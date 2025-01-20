create or replace package body "PKG_OPERATIONS" as

/* START ADD OPERATIONS */

function add_oper_positions(p_oper_id int, p_products_list clob) return int as
v_products_array JSON_ARRAY_T;
v_position_element JSON_ELEMENT_T;
v_position_array JSON_ARRAY_T;

v_pos_prod_id int;
v_pos_amount int := 0;
v_oper_id int;
v_products_q int := 0;
begin
    v_products_array := JSON_ARRAY_T.parse(p_products_list);

    for i in 0 .. v_products_array.get_size() - 1
    loop
        v_position_element := v_products_array.get(i);

        if v_position_element.is_array then
            v_position_array := JSON_ARRAY_T(v_position_element);

            v_pos_prod_id := v_position_array.get_string(0);
            v_pos_amount  := v_position_array.get_string(1);

            v_products_q := v_products_q + v_pos_amount; --INFO: needed for updating oper_wh_optimum_time in operations table

            insert into oper_positions(pos_prod_id, pos_amount, pos_oper_id)
                values (v_pos_prod_id, v_pos_amount, p_oper_id);
        end if;
    end loop;

    return v_products_q;

exception
when others then
    RAISE_APPLICATION_ERROR(-20001, 'Wystąpił błąd podczas dodawania pozycji operacji');
    --RAISE_APPLICATION_ERROR(-20000, 'PKG_OPERATIONS.add_oper_positions (' || SQLERRM || ')');
end add_oper_positions;



procedure copy_oper_pos_for_picking(p_release_oper_id int, p_picking_oper_id int) as
begin
    insert into oper_positions(pos_prod_id, pos_amount, pos_oper_id)
        select pos_prod_id, pos_amount, p_picking_oper_id from oper_positions where pos_oper_id = p_release_oper_id;

exception
when others then
    RAISE_APPLICATION_ERROR(-20001, 'Wystąpił błąd podczas kopiowania pozycji operacji wydania do kompletacji');
    --RAISE_APPLICATION_ERROR(-20000, 'PKG_OPERATIONS.copy_oper_pos_for_picking (' || SQLERRM || ')');
end copy_oper_pos_for_picking;



procedure add_operation(
    p_oper_type char,
    p_client_id int,
    p_planned_date timestamp,
    p_products_list clob := null,
    p_release_oper_id int := null,
    p_whman_id int := null
) as
v_oper_id int;
v_oper_status char(2 char);
v_products_q int := 0;
v_duration int := PKG_SCHEDULE_OPTIM.G_SLOT_INTERVAL;
begin
    /* Insert into operations */

    BEGIN
        --DEBUG dbms_output.put_line('Before insert into operations');

        v_oper_status := case p_oper_type
                            when G_PICKING_OPER_TYPE then G_STATUS_PICKING_HINT
                            when G_LOADING_OPER_TYPE then G_STATUS_LOADING_HINT
                            when G_RELEASE_OPER_TYPE then G_STATUS_RELEASE_HINT
                            else G_STATUS_NEW
                        end;
                        
        if (p_oper_type = G_PICKING_OPER_TYPE) then
            v_duration := PKG_UTIL.get_oper_duration(p_release_oper_id) - PKG_SCHEDULE_OPTIM.G_SLOT_INTERVAL;
        end if;               
        
        insert into operations(oper_type, oper_receive_date_time, oper_planned_date_time, oper_wh_optimum_time, oper_cl_id, oper_status, oper_emp_id, oper_parent_id)
        values(p_oper_type, sysdate, p_planned_date, v_duration, p_client_id, v_oper_status, p_whman_id, p_release_oper_id)
        returning oper_id into v_oper_id;

        dbms_output.put_line('      Operation created! ID: '||v_oper_id||', type: '||p_oper_type||', status: '||v_oper_status||', whman: '||p_whman_id);
        
        --DEBUG dbms_output.put_line('After insert into operations');
    EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20001, 'Wystąpił błąd podczas dodawania operacji (' || SQLERRM || ')');
    END;

    if v_oper_id is not null then
        if p_oper_type in(G_DELIVERY_OPER_TYPE, G_RELEASE_OPER_TYPE) then
            
            /* Insert into oper_positions */
            v_products_q := add_oper_positions(v_oper_id, p_products_list);

            /* Count oper_wh_optimum_time and update */
            if (v_products_q > 15) then
                v_duration := v_duration + ceil(v_products_q / 2);
                
                v_duration := ceil(v_duration / PKG_SCHEDULE_OPTIM.G_SLOT_INTERVAL) * PKG_SCHEDULE_OPTIM.G_SLOT_INTERVAL; --INFO: round up to the nearest multiple of schedule interval
            
                update operations set oper_wh_optimum_time = v_duration where oper_id = v_oper_id;         
            else
                v_duration := v_duration * 2;
            end if;
           
        end if;

        COMMIT;
    else
        ROLLBACK;

        RAISE_APPLICATION_ERROR(-20001, 'Operacja nie została utworzona w systemie');
    end if;

EXCEPTION
WHEN OTHERS THEN
    --RAISE_APPLICATION_ERROR(-20001, 'Wystąpił błąd podczas dodawania operacji przez logistyka');
    RAISE_APPLICATION_ERROR(-20000, 'PKG_OPERATIONS.add_operation (' || SQLERRM || ')');
end add_operation;

/* END ADD OPERATIONS */



/* START EDIT OPERATIONS */

procedure edit_oper_as_mngr(p_oper_id int, p_whman_id int, p_planned_date_time timestamp, p_oper_time int) as
begin
    update operations
    set
        oper_emp_id = p_whman_id,
        oper_planned_date_time = p_planned_date_time,
        oper_wh_optimum_time = p_oper_time
    where oper_id = p_oper_id;

exception
when others then
    RAISE_APPLICATION_ERROR(-20001, 'Wystąpił błąd podczas edytowania operacji przez kierownika magazynu');
    --RAISE_APPLICATION_ERROR(-20000, 'PKG_OPERATIONS.edit_oper_as_mngr (' || SQLERRM || ')');
end edit_oper_as_mngr;

procedure edit_oper_as_whman(p_oper_id int, p_action varchar2) as
v_operation_type char(2 char);
v_operation_parent_id int;
begin
    case p_action
        when 'start' then
            update operations set oper_wh_start_date_time = sysdate + interval '1' hour where oper_id = p_oper_id;
            
            v_operation_type := PKG_UTIL.get_oper_type(p_oper_id);
            
            case v_operation_type
                /* Create stock list */
                when G_DELIVERY_OPER_TYPE then PKG_WAREHOUSE.create_oper_stock(p_oper_id);
                when G_RELEASE_OPER_TYPE then PKG_WAREHOUSE.take_oper_stock(p_oper_id);
                when G_PICKING_OPER_TYPE then
                    v_operation_parent_id := PKG_UTIL.get_parent_oper_id(p_oper_id);
                    PKG_WAREHOUSE.take_oper_stock(v_operation_parent_id);
                else null;
            end case;

        when 'end' then
            update operations
            set oper_wh_end_date_time = sysdate + interval '1' hour, oper_status = G_STATUS_DONE
            where oper_id = p_oper_id;
    end case;

exception
when no_data_found then
    RAISE_APPLICATION_ERROR(-20001, 'Nie znaleziono operacji');
when others then
    --RAISE_APPLICATION_ERROR(-20001, 'Wystąpił błąd podczas edytowania operacji przez magazyniera');
    RAISE_APPLICATION_ERROR(-20000, 'PKG_OPERATIONS.edit_oper_as_whman (' || SQLERRM || ')');
end edit_oper_as_whman;

procedure edit_oper_as_logist(p_oper_id int) as
begin
    update operations set oper_status = G_STATUS_CANCELLED where oper_id = p_oper_id;

exception
when others then
    RAISE_APPLICATION_ERROR(-20001, 'Wystąpił błąd podczas edytowania operacji przez logistyka');
    --RAISE_APPLICATION_ERROR(-20000, 'PKG_OPERATIONS.edit_oper_as_logist (' || SQLERRM || ')');
end edit_oper_as_logist;

/* END EDIT OPERATIONS */

end "PKG_OPERATIONS";
/