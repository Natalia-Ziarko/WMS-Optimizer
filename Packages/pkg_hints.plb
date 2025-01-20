create or replace package body "PKG_HINTS" as

/* */
procedure change_hint_status(p_hint_id int, p_status char := null) as
v_actual_status char(2 char);
begin
    if (p_status is not null) then
        update hints set hint_status = p_status where hint_id = p_hint_id;       
    else
        v_actual_status := PKG_UTIL.get_hint_status(p_hint_id);

        if (v_actual_status = G_HINT_STATUS_CLOSED) then RAISE_APPLICATION_ERROR(-20001, 'Nie można zmienić statusu zakończonej sugestii'); end if;

        update hints
        set hint_status = case v_actual_status when G_HINT_STATUS_NEW then G_HINT_STATUS_PENDING when G_HINT_STATUS_PENDING then G_HINT_STATUS_CLOSED end
        where hint_id = p_hint_id;
    end if;

exception
when others then
    RAISE_APPLICATION_ERROR(-20001, 'Wystąpił błąd podczas zmiany statusu');
end change_hint_status;

/* */
procedure check_not_assigned_opers as
begin
    for oper in (
        select oper_id, oper_cl_id
        from operations
        where oper_emp_id is null
            and oper_status != PKG_OPERATIONS.G_STATUS_CANCELLED
            and oper_id not in(select hint_operation_id from hints where hint_operation_id = oper_id and hint_title = G_T_NOT_ASSIG_OPER)
    ) loop
        insert into hints(
            hint_role_id,
            hint_title,
            hint_content,
            hint_client_id,
            hint_operation_id,
            hint_start_date_time
        )
        values(
            PKG_USERS_AND_ROLES.G_WHMNGR_ROLE_ID,
            G_T_NOT_ASSIG_OPER,
            G_C_NOT_ASSIG_OPER,
            oper.oper_cl_id,
            oper.oper_id,
            sysdate
        );
    end loop;

    for oper2 in (
        select oper_id
        from operations
        where oper_emp_id is not null
            and oper_status != PKG_OPERATIONS.G_STATUS_CANCELLED
            and oper_id in(select hint_operation_id from hints where hint_operation_id = oper_id and hint_title = G_T_NOT_ASSIG_OPER)
    ) loop
        update hints
        set hint_status = G_HINT_STATUS_CLOSED
        where hint_operation_id = oper2.oper_id;
    end loop;          
end check_not_assigned_opers;

/* */
procedure check_delayed_oper as
TYPE r_oper IS RECORD(oper_id int, oper_cl_id int);
TYPE t_oper_details IS TABLE OF r_oper;
t_oper_not_started t_oper_details;
t_oper_with_delay t_oper_details;
v_cl_contact_person varchar2(100 char);
begin
    /* Not started operations */
    select oper_id, oper_cl_id bulk collect into t_oper_not_started
    from operations
    where oper_wh_start_date_time is null and oper_planned_date_time < sysdate
        and oper_id not in(select hint_operation_id from hints where hint_title = G_T_OPER_NOT_STARTED)
        and oper_status = PKG_OPERATIONS.G_STATUS_NEW;

    if (t_oper_not_started.count > 0) then
        for i in 1 .. t_oper_not_started.count
        loop
            v_cl_contact_person := PKG_UTIL.get_contact_person(t_oper_not_started(i).oper_cl_id);

            insert into hints(
                hint_role_id,
                hint_title,
                hint_content,
                hint_client_id,
                hint_operation_id,
                hint_start_date_time
            )
            values(
                PKG_USERS_AND_ROLES.G_LOGIST_ROLE_ID,
                G_T_OPER_NOT_STARTED,
                G_C_OPER_DELAYED_NOT_ST||v_cl_contact_person,
                t_oper_not_started(i).oper_cl_id,
                t_oper_not_started(i).oper_id,
                sysdate
            );
        end loop;
    end if;

    /* Delayed operations */
    select oper_id, oper_cl_id bulk collect into t_oper_with_delay
    from operations
    where (oper_wh_start_date_time < oper_planned_date_time or oper_planned_date_time + oper_wh_optimum_time/1440 < oper_wh_end_date_time)
        and oper_id not in(select hint_operation_id from hints)
        and oper_status = PKG_OPERATIONS.G_STATUS_NEW;

    if (t_oper_with_delay.count > 0) then
        for i in 1 .. t_oper_with_delay.count
        loop
            v_cl_contact_person := PKG_UTIL.get_contact_person(t_oper_not_started(i).oper_cl_id);

            insert into hints(
                hint_role_id,
                hint_title,
                hint_content,
                hint_client_id,
                hint_operation_id,
                hint_start_date_time
            )
            values(
                PKG_USERS_AND_ROLES.G_LOGIST_ROLE_ID,
                G_T_OPER_DELAYED,
                G_C_OPER_DELAYED_NOT_ST||v_cl_contact_person,
                t_oper_not_started(i).oper_cl_id,
                t_oper_not_started(i).oper_id,
                sysdate
            );
        end loop;
    end if;        
end check_delayed_oper;

/* */
procedure check_opers_wo_acceptance as
begin
    for i in (
        select oper_id
        from operations
        where oper_status = PKG_OPERATIONS.G_STATUS_PICKING_HINT
        and oper_id not in(select hint_operation_id from hints where hint_title = G_T_WO_ACCEPT_OPER)
    )
    loop
        insert into hints(
            hint_role_id,
            hint_title,
            hint_content,
            hint_operation_id,
            hint_start_date_time,
            hint_who_added_role_id
        )
        values(
            PKG_USERS_AND_ROLES.G_WHMNGR_ROLE_ID,
            G_T_WO_ACCEPT_OPER,
            G_C_WO_ACCEPT_OPER,
            i.oper_id,
            sysdate,
            PKG_USERS_AND_ROLES.G_SYSTEM_ROLE_ID
        );
    end loop;
end check_opers_wo_acceptance;

procedure add_when_planned_date_changed(p_oper_id int, p_for_who_id int, p_new_oper_date_time timestamp := null, p_info_from_client varchar2 := null) as
v_logist_content_start varchar2(100 char) := 'Nowa godzina operacji: '||to_char(p_new_oper_date_time, 'DD-Mon-YYYY HH24:MI')||'. Informacja z działu logistycznego: "';
v_whmngr_cont_det varchar2(1000 char);
v_who_added_role_id int;
v_oper_type char(2 char);
f_slot_found boolean;
begin
    --_who_added_role_id := PKG_UTIL.get_user_role_id(p_for_who_id);

    if (v_who_added_role_id = PKG_USERS_AND_ROLES.G_WHMNGR_ROLE_ID) then
        v_whmngr_cont_det := PKG_UTIL.get_whmngr_cont_det();

        insert into hints(
            hint_role_id,
            hint_title,
            hint_content,
            hint_operation_id,
            hint_start_date_time,
            hint_who_added_role_id
        )
        values(
            PKG_USERS_AND_ROLES.G_LOGIST_ROLE_ID,
            G_T_NEW_OPER_DATE_FOR_LOGIST,
            G_C_WHMNGR_CONT_DET_FOR_LOGIST||v_whmngr_cont_det,
            p_oper_id,
            sysdate,
            v_who_added_role_id
        );
    
    elsif (v_who_added_role_id = PKG_USERS_AND_ROLES.G_LOGIST_ROLE_ID) then
        insert into hints(
            hint_role_id,
            hint_title,
            hint_content,
            hint_operation_id,
            hint_start_date_time,
            hint_who_added_role_id,
            hint_new_oper_date_time
        )
        values(
            PKG_USERS_AND_ROLES.G_WHMNGR_ROLE_ID,
            G_T_NEW_OPER_DATE_FOR_WHMNGR,
            v_logist_content_start||p_info_from_client||L_C_ACCEPT_NEW_PICKING,
            p_oper_id,
            sysdate,
            v_who_added_role_id,
            p_new_oper_date_time
        );

    end if;
end add_when_planned_date_changed;

end "PKG_HINTS";
/
