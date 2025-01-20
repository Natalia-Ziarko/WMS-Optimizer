create or replace package body "PKG_SCHEDULE_OPTIM" as

procedure insert_slots as
begin
    delete from wh_schedule_slots;

    for slot in (
        with all_intervals as (
            select
                wsw_whman_id as whman_id,
                wsw_start as time_start,
                wsw_end as time_end,
                G_SCHEDULE_SHIFT_TYPE as interval_type,
                null as oper_id
            from wh_schedule_whmen
            where trunc(wsw_start) between G_V_SCH_OPTIM_START_DATE and G_V_SCH_OPTIM_SHIFT_END_DATE

            union all

            select
                oper_emp_id as whman_id,
                oper_planned_date_time as time_start,
                oper_planned_date_time + oper_wh_optimum_time/1440 as time_end,
                G_SCHEDULE_OPER_TYPE as interval_type,
                oper_id as oper_id
            FROM operations
            WHERE oper_planned_date_time > G_V_SCH_OPTIM_START_DATE
                AND oper_planned_date_time + oper_wh_optimum_time/1440 <= G_V_SCH_OPTIM_OPER_END_DATE
        ),
        split_points AS (
            SELECT whman_id, time_start AS split_time FROM all_intervals
            UNION
            SELECT whman_id, time_end AS split_time FROM all_intervals
        ),
        distinct_points AS (
            SELECT DISTINCT whman_id, split_time FROM split_points
        ),
        ordered_points AS (
            SELECT 
                whman_id,
                split_time,
                LEAD(split_time) OVER (PARTITION BY whman_id ORDER BY split_time) AS next_time
            FROM distinct_points
        )
            SELECT 
                p.whman_id,
                p.split_time AS time_start,
                p.next_time AS time_end,
                CASE 
                    WHEN MAX(CASE WHEN o.interval_type = G_SCHEDULE_OPER_TYPE THEN 1 ELSE 0 END) > 0 THEN G_SCHEDULE_OPER_TYPE
                    ELSE G_FREE_SCHEDULE_SLOT
                END AS slot_type,
                MAX(CASE WHEN o.interval_type = G_SCHEDULE_OPER_TYPE THEN o.oper_id ELSE NULL END) AS oper_id,
                (extract(hour from p.next_time - p.split_time) * 60 + extract(minute from p.next_time - p.split_time)) as slot_duration
            FROM ordered_points p
            LEFT JOIN all_intervals o
                ON p.whman_id = o.whman_id
                AND p.split_time < o.time_end
                AND p.next_time > o.time_start
            WHERE TO_CHAR(p.split_time, 'DD-MM-YYYY') = TO_CHAR(p.next_time, 'DD-MM-YYYY')
                AND p.next_time is not null --INFO: not adding free slots between shifts in different days
                AND p.whman_id is not null --INFO: only operations assigned to warehousemen
            GROUP BY p.whman_id, p.split_time, p.next_time
            order by p.whman_id, p.split_time
    ) loop
        INSERT INTO WH_SCHEDULE_SLOTS(wss_start, wss_end, wss_type, wss_whman_id, wss_oper_id, wss_duration)
        VALUES(slot.time_start, slot.time_end, slot.slot_type, slot.whman_id, slot.oper_id, slot.slot_duration);
    end loop;
end insert_slots;

procedure assign_opers_update_slots as
v_whman_id int;
begin
    dbms_output.put_line('Not assigned operations:'); --DEBUG

    /* Process not assigned operations */
    for oper in (
        select oper_id
        from operations
        where oper_emp_id is null
            and oper_status != PKG_OPERATIONS.G_STATUS_CANCELLED
            and trunc(oper_planned_date_time) > G_V_SCH_OPTIM_START_DATE
            and trunc(oper_planned_date_time) <= G_V_SCH_OPTIM_OPER_END_DATE
    ) loop
        dbms_output.put_line('ID: '||oper.oper_id); --DEBUG

        /* Select whman for the operation */
        begin
            select wss_whman_id into v_whman_id
            from wh_schedule_slots s
            left join operations o
                on s.wss_start <= o.oper_planned_date_time
                    and s.wss_end <= o.oper_planned_date_time + o.oper_wh_optimum_time/1440
            where o.oper_id = oper.oper_id   
                and s.wss_type = G_FREE_SCHEDULE_SLOT
                and rownum = 1;
        exception
        when no_data_found then
            --RAISE_APPLICATION_ERROR(-20000, 'PKG_SCHEDULE_OPTIM.assign_opers_update_slots (' || SQLERRM || ')');
            RAISE_APPLICATION_ERROR(-20001, 'Nie można przypisać operacji żadnemu magazynierowi');
        end;

        /* Update operation table */
        update operations set oper_emp_id = v_whman_id where oper_id = oper.oper_id;
    end loop;

    /* Update slots */
    insert_slots;
end assign_opers_update_slots;

procedure insert_not_assigned_opers as
begin
    for oper in (
        select
            oper_planned_date_time as time_start,
            oper_planned_date_time + oper_wh_optimum_time/1440 as time_end,
            oper_id as oper_id,
            oper_wh_optimum_time as oper_duration
        from operations
        where oper_emp_id is null
            and oper_planned_date_time > G_V_SCH_OPTIM_START_DATE
            and oper_planned_date_time + oper_wh_optimum_time/1440 <= G_V_SCH_OPTIM_OPER_END_DATE
    ) loop
        insert into wh_schedule_slots(wss_start, wss_end, wss_type, wss_oper_id, wss_duration)
        values(oper.time_start, oper.time_end, G_SCHEDULE_OPER_TYPE, oper.oper_id, oper.oper_duration);
    end loop;
end insert_not_assigned_opers;

procedure process_schedule_optimization(
    p_release_oper_id int,
    p_new_oper_date_time timestamp,
    p_whman_id int
) as
v_client_id int;
begin
    v_client_id := PKG_UTIL.get_client_id(p_release_oper_id);

    /* Create picking operation */
    PKG_OPERATIONS.add_operation(
        p_oper_type => PKG_OPERATIONS.G_PICKING_OPER_TYPE,
        p_client_id => v_client_id,
        p_planned_date => p_new_oper_date_time,
        p_release_oper_id => p_release_oper_id,
        p_whman_id => p_whman_id
    );

    /* Change release operation to loading operation */
    update operations
    set oper_type = PKG_OPERATIONS.G_LOADING_OPER_TYPE,
        oper_status = PKG_OPERATIONS.G_STATUS_LOADING_HINT,
        oper_wh_optimum_time = G_SLOT_INTERVAL
    where oper_id = p_release_oper_id;

    dbms_output.put_line('      Release operation updated!');

exception
when others then
    RAISE_APPLICATION_ERROR(-20001, 'Wystąpił błąd podczas tworzenia listy kompletacji');
    --RAISE_APPLICATION_ERROR(-20000, 'PKG_OPERATIONS.create_picking_oper (' || SQLERRM || ')');
end process_schedule_optimization;

function optimize_schedule return varchar2 as
found_slots t_slot := t_slot();
t_rel_to_be_processed t_int := t_int();
slot_record r_slot;
v_processed_rel_no int := 0;
v_found_rel_no int := 0;
v_slot_no int := 0;
begin
    dbms_output.put_line('START schedule optimization process');
    dbms_output.put_line('Start date: '||G_V_SCH_OPTIM_START_DATE);

    dbms_output.put_line('  1. Assign operations and update slots');
    insert_slots;
    assign_opers_update_slots;

    dbms_output.put_line('  2. Process releases');

    /* Count releases to be processed */

    for i in (
        select oper_id
        from wh_schedule_slots
        left join operations on wss_oper_id = oper_id
        where oper_type = PKG_OPERATIONS.G_RELEASE_OPER_TYPE and oper_status = PKG_OPERATIONS.G_STATUS_RELEASE_HINT
        order by wss_start
    )
    loop
        t_rel_to_be_processed.extend;
        t_rel_to_be_processed(t_rel_to_be_processed.last) := i.oper_id;
    end loop;

    v_found_rel_no := t_rel_to_be_processed.count;
    dbms_output.put_line('     Found releases: '||v_found_rel_no);

    /* Iterate over selected releases */

    for rel in 1..v_found_rel_no
    loop
        dbms_output.put_line('       '||rel||'. Release ID: '||t_rel_to_be_processed(rel));

        /* Process when slot found */
        
        for slot in (
            select slot_id, slot_start, whman_id
            from (
                select
                    s.wss_id as slot_id,
                    s.wss_start as slot_start,
                    s.wss_whman_id as whman_id
                from wh_schedule_slots s
                left join wh_schedule_slots o
                    on o.wss_type = G_SCHEDULE_OPER_TYPE
                    and s.wss_start < o.wss_start
                    and s.wss_duration >= o.wss_duration - G_SLOT_INTERVAL --INFO picking time = release time - loading time
                where s.wss_type = G_FREE_SCHEDULE_SLOT
                    and o.wss_oper_id = t_rel_to_be_processed(rel)
                order by s.wss_start
            ) where rownum = 1
        ) loop
            /* Creating table with more then 1 found slot */
            /**
            slot_record.slot_id := slot.slot_id;
            slot_record.slot_start := slot.slot_start;
            slot_record.whman_id := slot.whman_id;
            slot_record.oper_id := t_rel_to_be_processed(rel);

            found_slots.extend;
            found_slots(found_slots.last) := slot_record;

            v_slot_no := v_slot_no + 1;
            */
           
            process_schedule_optimization(
                p_release_oper_id => t_rel_to_be_processed(rel),
                p_new_oper_date_time => slot.slot_start,
                p_whman_id => slot.whman_id
            );

            /* Update slots */
            
            insert_slots;

            v_processed_rel_no := v_processed_rel_no + 1;         
        end loop;
         
        v_slot_no := 0; 
    end loop;

    dbms_output.put_line('  3. Change status of releases which could not be processed');
    if (v_processed_rel_no < v_found_rel_no) then
        update operations
        set oper_status = PKG_OPERATIONS.G_STATUS_NEW
        where oper_type = PKG_OPERATIONS.G_RELEASE_OPER_TYPE and oper_status not in(PKG_OPERATIONS.G_STATUS_CANCELLED, PKG_OPERATIONS.G_STATUS_DONE);
    end if;

    dbms_output.put_line('  4. Add hints about accepting new operations');
    PKG_HINTS.check_opers_wo_acceptance;

    dbms_output.put_line('END schedule optimization process'|| chr(10));

    return 'Proces optymalizacji został zakończony. Ilość utworzonych operacji kompletacji: '||v_processed_rel_no;
end optimize_schedule;

procedure manage_schedule_optim(p_loading_id int, p_f_accepted int) as
v_picking_id int;
v_picking_time int;
v_hint_id int;
begin
    v_picking_id := PKG_UTIL.get_child_oper_id(p_loading_id);

    case p_f_accepted
        when 1 then
            update operations
            set oper_status = PKG_OPERATIONS.G_STATUS_NEW
            where oper_id in(p_loading_id, v_picking_id);

        when 0 then
            select oper_wh_optimum_time into v_picking_time
            from operations
            where oper_id = v_picking_id;
            
            update operations
            set oper_wh_optimum_time = oper_wh_optimum_time + v_picking_time, oper_status = PKG_OPERATIONS.G_STATUS_NEW
            where oper_id = p_loading_id;
    
            update operations
            set oper_status = PKG_OPERATIONS.G_STATUS_CANCELLED
            where oper_id = p_loading_id;  
    end case;

    /* Change hint status to done */
    select distinct hint_id into v_hint_id from hints where hint_operation_id = v_picking_id;
    PKG_HINTS.change_hint_status(v_hint_id, PKG_HINTS.G_HINT_STATUS_CLOSED);

exception
when no_data_found then
    --RAISE_APPLICATION_ERROR(-20001, 'Wystąpił błąd podczas zarządzania zmianą systemową');
    RAISE_APPLICATION_ERROR(-20000, 'PKG_OPERATIONS.manage_picking_hint (' || SQLERRM || ')');
when others then
    RAISE_APPLICATION_ERROR(-20001, 'Wystąpił błąd podczas zarządzania zmianą systemową');
    --RAISE_APPLICATION_ERROR(-20000, 'PKG_OPERATIONS.manage_picking_hint (' || SQLERRM || ')');
end manage_schedule_optim;

/* END SCHEDULE OPTIMIZATION OPERATIONS */

end "PKG_SCHEDULE_OPTIM";
/