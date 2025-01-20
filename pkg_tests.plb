create or replace package body "PKG_TESTS" as
G_RESULT_SUCCESS    CONSTANT VARCHAR2(1 CHAR) := 'C';
G_RESULT_ERROR      CONSTANT VARCHAR2(1 CHAR) := 'E';
L_NOT_EXIST_HINT_ID CONSTANT INT := 0;
L_NEW_HINT_ID       CONSTANT INT := 1;
L_NEW_HINT_ID_2     CONSTANT INT := 2;
L_CLOSED_HINT_ID    CONSTANT INT := 3;
L_PENDING_HINT_ID   CONSTANT INT := 4;

procedure log_test(p_method varchar2, p_result varchar2, p_error_message varchar2 := null, p_params_json clob := null) as
begin
    insert into tests(
        test_method, test_result, test_error_message, test_parameters
    )
    values(
        p_method, p_result, p_error_message, p_params_json
    );
    
end log_test;

procedure clear_test_results as
begin
    delete from tests;

end clear_test_results;

procedure show_test_summary as
v_cursor sys_refcursor;
v_error_cursor sys_refcursor;
v_test_method varchar2(100);
v_total_tests int;
v_passed_tests int;
v_failed_tests int;
v_test_id tests.test_id%type;
v_test_error_message tests.test_error_message%type;
v_test_parameters tests.test_parameters%type;
begin
    select 
        count(*) as total_tests, 
        sum(case when test_result = G_RESULT_SUCCESS then 1 else 0 end) as passed_tests, 
        sum(case when test_result = G_RESULT_ERROR then 1 else 0 end) as failed_tests
    into
        v_total_tests,
        v_passed_tests,
        v_failed_tests
    from tests;   

    DBMS_OUTPUT.PUT_LINE('Total tests: ' || v_total_tests);
    DBMS_OUTPUT.PUT_LINE('Passed: ' || v_passed_tests);
    DBMS_OUTPUT.PUT_LINE('Failed: ' || v_failed_tests);
    DBMS_OUTPUT.PUT_LINE(' ');
    DBMS_OUTPUT.PUT_LINE('Details:');
    DBMS_OUTPUT.PUT_LINE(' ');
    DBMS_OUTPUT.PUT_LINE(' ');

    v_total_tests := 0;
    v_passed_tests := 0;
    v_failed_tests := 0;

    open v_cursor for
        select 
            test_method, 
            count(*) as total_tests, 
            sum(case when test_result = G_RESULT_SUCCESS then 1 else 0 end) as passed_tests, 
            sum(case when test_result = G_RESULT_ERROR then 1 else 0 end) as failed_tests
        from tests
        group by test_method;
    loop
        fetch v_cursor into v_test_method, v_total_tests, v_passed_tests, v_failed_tests;
        exit when v_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Test method: ' || v_test_method);
        DBMS_OUTPUT.PUT_LINE('  Total tests: ' || v_total_tests);
        DBMS_OUTPUT.PUT_LINE('  Passed: ' || v_passed_tests);
        DBMS_OUTPUT.PUT_LINE('  Failed: ' || v_failed_tests);
        DBMS_OUTPUT.PUT_LINE('---------------------------');
    end loop;

    close v_cursor;
    DBMS_OUTPUT.PUT_LINE('');

    open v_error_cursor for
        select test_method, test_error_message, test_parameters
        from tests
        where test_result = G_RESULT_ERROR;
    
    loop
        fetch v_error_cursor into v_test_method, v_test_error_message, v_test_parameters;
        exit when v_error_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Failed method test: ' || v_test_method);
        DBMS_OUTPUT.PUT_LINE('Error message: ' || v_test_error_message);
        DBMS_OUTPUT.PUT_LINE('Parameters: ' || v_test_parameters);
        DBMS_OUTPUT.PUT_LINE('---------------------------');
    end loop;
    
    close v_error_cursor;

end show_test_summary;



/* START HINTS TESTS */

procedure setup_test_data as
begin
    /* Clear data */
    delete from test_hints;
    delete from test_operations;

    /* Add testing data */

    /* Operation - not assigned, delayed */
    insert into test_operations(oper_id, oper_type, oper_cl_id, oper_status, oper_planned_date_time, oper_wh_optimum_time, oper_receive_date_time)
    values (1, PKG_OPERATIONS.G_DELIVERY_OPER_TYPE, 101, PKG_HINTS.G_HINT_STATUS_NEW, sysdate - 2, 60, sysdate - 3);
    /* Operation - not assigned, not delayed */
    insert into test_operations(oper_id, oper_type, oper_cl_id, oper_status, oper_planned_date_time, oper_wh_optimum_time, oper_receive_date_time)
    values (2, PKG_OPERATIONS.G_DELIVERY_OPER_TYPE, 102, PKG_HINTS.G_HINT_STATUS_PENDING, sysdate + 1, 60, sysdate);
    /* Operation - assigned, delayed */
    insert into test_operations(oper_id, oper_type, oper_cl_id, oper_status, oper_planned_date_time, oper_wh_optimum_time, oper_receive_date_time)
    values (3, PKG_OPERATIONS.G_DELIVERY_OPER_TYPE, 103, PKG_HINTS.G_HINT_STATUS_NEW, sysdate - 3, 60, sysdate - 4);
    /* Operation - picking */
    insert into test_operations(oper_id, oper_type, oper_cl_id, oper_status, oper_planned_date_time, oper_wh_optimum_time, oper_receive_date_time)
    values (4, PKG_OPERATIONS.G_PICKING_OPER_TYPE, 104, PKG_HINTS.G_HINT_STATUS_NEW, sysdate + 3, 60, sysdate);

    /* Hint - not closed, not assgined operation */
    insert into test_hints(hint_id, hint_role_id, hint_title, hint_content, hint_client_id, hint_operation_id, hint_status, hint_start_date_time)
    values (L_NEW_HINT_ID, PKG_USERS_AND_ROLES.G_SYSTEM_ROLE_ID, PKG_HINTS.G_T_NOT_ASSIG_OPER, PKG_HINTS.G_C_NOT_ASSIG_OPER, 101, 1, PKG_HINTS.G_HINT_STATUS_NEW, sysdate - 1);
    /* Hint - not closed, delayed operation */
    insert into test_hints(hint_id, hint_role_id, hint_title, hint_content, hint_client_id, hint_operation_id, hint_status, hint_start_date_time)
    values (L_NEW_HINT_ID_2, PKG_USERS_AND_ROLES.G_SYSTEM_ROLE_ID, PKG_HINTS.G_T_OPER_NOT_STARTED, PKG_HINTS.G_C_OPER_DELAYED_NOT_ST, 102, 2, PKG_HINTS.G_HINT_STATUS_NEW, sysdate - 1);
    /* Hint - closed */
    insert into test_hints(hint_id, hint_role_id, hint_title, hint_content, hint_client_id, hint_operation_id, hint_status, hint_start_date_time)
    values (L_CLOSED_HINT_ID, PKG_USERS_AND_ROLES.G_SYSTEM_ROLE_ID, PKG_HINTS.G_T_NOT_ASSIG_OPER, PKG_HINTS.G_C_NOT_ASSIG_OPER, 101, 1, PKG_HINTS.G_HINT_STATUS_CLOSED, sysdate - 1);
    /* Hint - pending */
    insert into test_hints(hint_id, hint_role_id, hint_title, hint_content, hint_client_id, hint_operation_id, hint_status, hint_start_date_time)
    values (L_PENDING_HINT_ID, PKG_USERS_AND_ROLES.G_SYSTEM_ROLE_ID, PKG_HINTS.G_T_NOT_ASSIG_OPER, PKG_HINTS.G_C_NOT_ASSIG_OPER, 101, 1, PKG_HINTS.G_HINT_STATUS_PENDING, sysdate - 1);

end setup_test_data;

procedure test_get_hint_status(p_hint_id int, p_expected_status varchar2) as
L_METHOD_NAME CONSTANT VARCHAR2(50 CHAR) := 'PKG_UTIL.get_hint_status';
v_actual_status varchar2(1 char);
begin
    select hint_status into v_actual_status from test_hints where hint_id = p_hint_id;

    if (v_actual_status != p_expected_status) then
        log_test(
            p_method => L_METHOD_NAME,
            p_result => G_RESULT_ERROR,
            p_error_message => 'Unexpected status',
            p_params_json => '{"hint_id":"' || p_hint_id
                || '", "expected_status":"' || p_expected_status
                || '", "actual_status":"' || v_actual_status
                || '"}'
        );
    else
        log_test(
            p_method => L_METHOD_NAME,
            p_result => G_RESULT_SUCCESS,
            p_params_json => '{"hint_id":"' || p_hint_id
                || '", "expected_status":"' || p_expected_status
                || '", "actual_status":"' || v_actual_status
                || '"}'
        );
    end if;

exception
when no_data_found then
    log_test(
        p_method => L_METHOD_NAME,
        p_result => case when p_hint_id = L_NOT_EXIST_HINT_ID then G_RESULT_SUCCESS else G_RESULT_ERROR end,
        p_error_message => 'Hint ID not found',
        p_params_json => '{"hint_id":"' || p_hint_id || '"}'
    );
when others then
    log_test(
        p_method => L_METHOD_NAME,
        p_result => G_RESULT_ERROR,
        p_error_message => SQLERRM,
        p_params_json => '{"hint_id":"' || p_hint_id
            || '", "expected_status":"' || p_expected_status
            || '", "actual_status":"' || v_actual_status
            || '"}'
    );
end test_get_hint_status;

function test_get_hint_status(p_hint_id int, p_expected_status varchar2) return varchar2 as
L_METHOD_NAME CONSTANT VARCHAR2(50 CHAR) := 'PKG_UTIL.get_hint_status';
v_actual_status varchar2(1 char);
begin
    select hint_status into v_actual_status from test_hints where hint_id = p_hint_id;

    if (v_actual_status != p_expected_status) then
        log_test(
            p_method => L_METHOD_NAME,
            p_result => G_RESULT_ERROR,
            p_error_message => 'Unexpected status',
            p_params_json => '{"hint_id":"' || p_hint_id
                || '", "expected_status":"' || p_expected_status
                || '", "actual_status":"' || v_actual_status
                || '"}'
        );
    else
        log_test(
            p_method => L_METHOD_NAME,
            p_result => G_RESULT_SUCCESS,
            p_params_json => '{"hint_id":"' || p_hint_id
                || '", "expected_status":"' || p_expected_status
                || '", "actual_status":"' || v_actual_status
                || '"}'
        );
    end if;

    return v_actual_status;

exception
when no_data_found then
    log_test(
        p_method => L_METHOD_NAME,
        p_result => case when p_hint_id = L_NOT_EXIST_HINT_ID then G_RESULT_SUCCESS else G_RESULT_ERROR end,
        p_error_message => 'Hint ID not found',
        p_params_json => '{"hint_id":"' || p_hint_id || '"}'
    );
    return null;
when others then
    log_test(
        p_method => L_METHOD_NAME,
        p_result => G_RESULT_ERROR,
        p_error_message => SQLERRM,
        p_params_json => '{"hint_id":"' || p_hint_id
            || '", "expected_status":"' || p_expected_status
            || '", "actual_status":"' || v_actual_status
            || '"}'
    );
    return null;
end test_get_hint_status;

procedure test_change_hint_status(p_hint_id int, p_status varchar2, p_expected_status varchar2) as
L_METHOD_NAME CONSTANT VARCHAR2(50 CHAR) := 'PKG_HINTS.change_hint_status';
v_actual_status varchar2(2 char);
begin
    if (p_status is not null) then
        update test_hints set hint_status = p_status where hint_id = p_hint_id;       
    else
        v_actual_status := test_get_hint_status(p_hint_id, p_status);

        if (v_actual_status = PKG_HINTS.G_HINT_STATUS_CLOSED) then
            log_test(
                p_method => L_METHOD_NAME,
                p_result => G_RESULT_SUCCESS,
                p_params_json => '{"hint_id":"' || p_hint_id
                    || ', "expected_status":"N/A'
                    || '", "actual_status":"' || v_actual_status
                    || '"}'
            );
            return;
        else
            update test_hints
            set hint_status = case v_actual_status
                    when PKG_HINTS.G_HINT_STATUS_NEW then PKG_HINTS.G_HINT_STATUS_PENDING
                    when PKG_HINTS.G_HINT_STATUS_PENDING then PKG_HINTS.G_HINT_STATUS_CLOSED
                end
            where hint_id = p_hint_id;
        end if; 
    end if;
    
    v_actual_status := test_get_hint_status(p_hint_id, p_status);
    
    if (v_actual_status = p_expected_status or (v_actual_status is null and p_expected_status is null)) then
        log_test(
            p_method => L_METHOD_NAME,
            p_result => G_RESULT_SUCCESS,
            p_params_json => '{"hint_id":"' || p_hint_id
                || ', "expected_status":"' || p_expected_status
                || '", "actual_status":"' || v_actual_status
                || '"}'
        );
    else
        log_test(
            p_method => L_METHOD_NAME,
            p_result => G_RESULT_ERROR,
            p_error_message => 'Hint status mismatch',
            p_params_json => '{"hint_id":"' || p_hint_id
                || ', "expected_status":"' || p_expected_status
                || '", "actual_status":"' || v_actual_status
                || '"}'
        );
    end if;

exception
when others then
    log_test(
        p_method => L_METHOD_NAME,
        p_result => G_RESULT_ERROR,
        p_error_message => SQLERRM,
        p_params_json => '{"hint_id":"' || p_hint_id
            || ', "expected_status":"' || p_expected_status
            || '", "actual_status":"' || v_actual_status
            || '"}'
    );
end test_change_hint_status;

procedure test_check_not_assign_opers(p_expected_count int) as
L_METHOD_NAME CONSTANT VARCHAR2(50 CHAR) := 'PKG_HINTS.check_not_assigned_opers';
v_actual_count int;
begin
    for oper in (
        select oper_id, oper_cl_id
        from test_operations
        where oper_emp_id is null
            and oper_status != PKG_OPERATIONS.G_STATUS_CANCELLED
            and oper_id not in(select hint_operation_id from test_hints where hint_operation_id = oper_id and hint_title = PKG_HINTS.G_T_NOT_ASSIG_OPER)
    ) loop
        insert into test_hints(
            hint_id,
            hint_status,
            hint_role_id,
            hint_title,
            hint_content,
            hint_client_id,
            hint_operation_id,
            hint_start_date_time
        )
        values(
            oper.oper_id + 100,
            PKG_HINTS.G_HINT_STATUS_NEW,
            PKG_USERS_AND_ROLES.G_SYSTEM_ROLE_ID,
            PKG_HINTS.G_T_NOT_ASSIG_OPER,
            PKG_HINTS.G_C_NOT_ASSIG_OPER,
            oper.oper_cl_id,
            oper.oper_id,
            sysdate
        );
    end loop;

    for oper2 in (
        select oper_id
        from test_operations
        where oper_emp_id is not null
            and oper_status != PKG_OPERATIONS.G_STATUS_CANCELLED
            and oper_id in(select hint_operation_id from test_hints where hint_operation_id = oper_id and hint_title = PKG_HINTS.G_T_NOT_ASSIG_OPER)
    ) loop
        update test_hints
        set hint_status = PKG_HINTS.G_HINT_STATUS_CLOSED
        where hint_operation_id = oper2.oper_id;
    end loop;

    select count(*) into v_actual_count
    from test_hints
    where hint_title = PKG_HINTS.G_T_NOT_ASSIG_OPER;

    if (v_actual_count = p_expected_count) then
        log_test(
            p_method => L_METHOD_NAME,
            p_result => G_RESULT_SUCCESS,
            p_params_json => '{"expected_count":"' || p_expected_count || '", "actual_count":"' || v_actual_count || '"}'
        );
    else
        log_test(
            p_method => L_METHOD_NAME,
            p_result => G_RESULT_ERROR,
            p_error_message => 'Hint count mismatch',
            p_params_json => '{"expected_count":"' || p_expected_count || '", "actual_count":"' || v_actual_count || '"}'
        );
    end if;

exception
when others then
    log_test(
        p_method => L_METHOD_NAME,
        p_result => G_RESULT_ERROR,
        p_error_message => SQLERRM,
        p_params_json => '{"expected_count":' || p_expected_count || '}'
    );
end test_check_not_assign_opers;

procedure test_check_delayed_oper(p_expected_count int) as
L_METHOD_NAME CONSTANT VARCHAR2(50 CHAR) := 'PKG_HINTS.check_delayed_oper';
TYPE r_oper IS RECORD(oper_id int, oper_cl_id int);
TYPE t_oper_details IS TABLE OF r_oper;
t_oper_not_started t_oper_details;
t_oper_with_delay t_oper_details;
v_actual_count int;
begin
    /* Not started operations */
    select oper_id, oper_cl_id bulk collect into t_oper_not_started
    from test_operations
    where oper_wh_start_date_time is null and oper_planned_date_time < sysdate
        and oper_id not in(select hint_operation_id from test_hints where hint_title = PKG_HINTS.G_T_OPER_NOT_STARTED)
        and oper_status = PKG_OPERATIONS.G_STATUS_NEW;

    if (t_oper_not_started.count > 0) then
        for i in 1 .. t_oper_not_started.count
        loop
            insert into test_hints(
                hint_id,
                hint_status,
                hint_role_id,
                hint_title,
                hint_content,
                hint_client_id,
                hint_operation_id,
                hint_start_date_time
            )
            values(
                i + 200,
                PKG_HINTS.G_HINT_STATUS_NEW,
                PKG_USERS_AND_ROLES.G_LOGIST_ROLE_ID,
                PKG_HINTS.G_T_OPER_NOT_STARTED,
                PKG_HINTS.G_C_OPER_DELAYED_NOT_ST,
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
            insert into test_hints(
                hint_id,
                hint_status,
                hint_role_id,
                hint_title,
                hint_content,
                hint_client_id,
                hint_operation_id,
                hint_start_date_time
            )
            values(
                i + 300,
                PKG_HINTS.G_HINT_STATUS_NEW,
                PKG_USERS_AND_ROLES.G_LOGIST_ROLE_ID,
                PKG_HINTS.G_T_OPER_DELAYED,
                PKG_HINTS.G_C_OPER_DELAYED_NOT_ST,
                t_oper_not_started(i).oper_cl_id,
                t_oper_not_started(i).oper_id,
                sysdate
            );
        end loop;
    end if;

    select count(*) into v_actual_count
    from test_hints
    where hint_title in(PKG_HINTS.G_T_OPER_DELAYED, PKG_HINTS.G_T_OPER_NOT_STARTED);

    if (v_actual_count = p_expected_count) then
        log_test(
            p_method => L_METHOD_NAME,
            p_result => G_RESULT_SUCCESS,
            p_params_json => '{"expected_count":"' || p_expected_count || '", "actual_count":"' || v_actual_count || '"}'
        );
    else
        log_test(
            p_method => L_METHOD_NAME,
            p_result => G_RESULT_ERROR,
            p_error_message => 'Hint count mismatch',
            p_params_json => '{"expected_count":"' || p_expected_count || '", "actual_count":"' || v_actual_count || '"}'
        );
    end if;

exception
when others then
    log_test(
        p_method => L_METHOD_NAME,
        p_result => G_RESULT_ERROR,
        p_error_message => SQLERRM,
        p_params_json => '{"expected_count":"' || p_expected_count || '"}'
    );
end test_check_delayed_oper;

procedure test_opers_wo_acceptance(p_expected_count int) as
L_METHOD_NAME CONSTANT VARCHAR2(50 CHAR) := 'PKG_HINTS.check_opers_wo_acceptance';
v_hint_count int;
begin
    for i in (
        select oper_id
        from test_operations
        where oper_status = PKG_OPERATIONS.G_STATUS_PICKING_HINT
        and oper_id not in(select hint_operation_id from test_hints where hint_title = PKG_HINTS.G_T_WO_ACCEPT_OPER)
    )
    loop
        begin
            insert into test_hints(
                hint_id,
                hint_status,
                hint_role_id,
                hint_title,
                hint_content,
                hint_operation_id,
                hint_start_date_time,
                hint_who_added_role_id
            )
            values(
                i.oper_id + 400,
                PKG_HINTS.G_HINT_STATUS_NEW,
                PKG_USERS_AND_ROLES.G_WHMNGR_ROLE_ID,
                PKG_HINTS.G_T_WO_ACCEPT_OPER,
                PKG_HINTS.G_C_WO_ACCEPT_OPER,
                i.oper_id,
                sysdate,
                PKG_USERS_AND_ROLES.G_SYSTEM_ROLE_ID
            );

            v_hint_count := v_hint_count + 1;

        exception
        when others then
            log_test(
                p_method => L_METHOD_NAME,
                p_result => G_RESULT_ERROR,
                p_error_message => SQLERRM,
                p_params_json => '{"oper_id":"' || i.oper_id || '"}'
            );
        end;     
    end loop;

    if (v_hint_count != p_expected_count) then
        log_test(
            p_method => L_METHOD_NAME,
            p_result => G_RESULT_ERROR,
            p_error_message => 'Hint count mismatch',
            p_params_json => '{"expected_count":"' || p_expected_count || '", "actual_count":"' || v_hint_count || '"}'
        );
    else
        log_test(
            p_method => L_METHOD_NAME,
            p_result => G_RESULT_SUCCESS
        );
    end if;

exception
when no_data_found then
    log_test(
        p_method => L_METHOD_NAME,
        p_result => G_RESULT_ERROR,
        p_error_message => SQLERRM
    );
when others then
    log_test(
        p_method => L_METHOD_NAME,
        p_result => G_RESULT_ERROR,
        p_error_message => SQLERRM
    );    
end test_opers_wo_acceptance;

procedure test_planned_date_changed(p_oper_id int, p_for_who_id int, p_new_oper_date_time timestamp := null, p_info_from_client varchar2 := null) as
L_METHOD_NAME CONSTANT VARCHAR2(50 CHAR) := 'PKG_HINTS.add_when_planned_date_changed';
v_logist_content_start varchar2(100 char) := 'Nowa godzina operacji: '||to_char(p_new_oper_date_time, 'DD-Mon-YYYY HH24:MI')||'. Informacja z działu logistycznego: "';
v_whmngr_cont_det varchar2(1000 char);
v_hint_id int;
v_hint_id_2 int;
begin
    if (p_for_who_id = PKG_USERS_AND_ROLES.G_WHMNGR_ROLE_ID) then
        v_whmngr_cont_det := PKG_UTIL.get_whmngr_cont_det();

        insert into test_hints(
            hint_id,
            hint_status,
            hint_role_id,
            hint_title,
            hint_content,
            hint_operation_id,
            hint_start_date_time,
            hint_who_added_role_id
        )
        values(
            p_oper_id + 500,
            PKG_HINTS.G_HINT_STATUS_NEW,
            PKG_USERS_AND_ROLES.G_LOGIST_ROLE_ID,
            PKG_HINTS.G_T_NEW_OPER_DATE_FOR_LOGIST,
            PKG_HINTS.G_C_WHMNGR_CONT_DET_FOR_LOGIST||v_whmngr_cont_det,
            p_oper_id,
            sysdate,
            PKG_USERS_AND_ROLES.G_SYSTEM_ROLE_ID
        )
        returning hint_id into v_hint_id;

        log_test(
            p_method => L_METHOD_NAME,
            p_result => G_RESULT_SUCCESS
        );        
    
    elsif (p_for_who_id = PKG_USERS_AND_ROLES.G_LOGIST_ROLE_ID) then
        
        insert into test_hints(
            hint_id,
            hint_status,
            hint_role_id,
            hint_title,
            hint_content,
            hint_operation_id,
            hint_start_date_time,
            hint_who_added_role_id,
            hint_new_oper_date_time
        )
        values(
            p_oper_id + 600,
            PKG_HINTS.G_HINT_STATUS_NEW,
            PKG_USERS_AND_ROLES.G_WHMNGR_ROLE_ID,
            PKG_HINTS.G_T_NEW_OPER_DATE_FOR_WHMNGR,
            v_logist_content_start||p_info_from_client||PKG_HINTS.L_C_ACCEPT_NEW_PICKING,
            p_oper_id,
            sysdate,
            PKG_USERS_AND_ROLES.G_SYSTEM_ROLE_ID,
            p_new_oper_date_time
        )
        returning hint_id into v_hint_id_2;
        
        log_test(
            p_method => L_METHOD_NAME,
            p_result => G_RESULT_SUCCESS
        );

    end if;

exception
when others then
    log_test(
        p_method => L_METHOD_NAME,
        p_result => G_RESULT_ERROR,
        p_error_message => SQLERRM
    );
end test_planned_date_changed;

/* EXECUTING TESTS */

procedure test_hints as
L_INFO_FROM_CLIENT CONSTANT VARCHAR2(50 CHAR) := 'Nie dojedzie na czas';
L_EXP_NOT_ASSIGN_OPERS CONSTANT INT := 6;
L_EXP_DEL_OPERS        CONSTANT INT := 3;
L_EXP_WO_ACCEPT_OPERS  CONSTANT INT := 1;
L_OPER_ID_W_NEW_DATE_1 CONSTANT INT := 1;
L_OPER_ID_W_NEW_DATE_2 CONSTANT INT := 2;
begin
    setup_test_data;

    /* GET HINT STATUS */
    test_get_hint_status(L_NEW_HINT_ID, PKG_HINTS.G_HINT_STATUS_NEW); -- Status: new
    test_get_hint_status(L_NEW_HINT_ID, PKG_HINTS.G_HINT_STATUS_NEW); -- Status: done

    /* CHANGE HINT STATUS */
    test_change_hint_status(L_NOT_EXIST_HINT_ID, null, null); -- No_data_found
    test_change_hint_status(L_NEW_HINT_ID, null, PKG_HINTS.G_HINT_STATUS_PENDING); -- Status: new -> done
    test_change_hint_status(L_PENDING_HINT_ID, null, PKG_HINTS.G_HINT_STATUS_CLOSED); -- Status: pending -> done
    test_change_hint_status(L_NEW_HINT_ID_2, PKG_HINTS.G_HINT_STATUS_CLOSED, PKG_HINTS.G_HINT_STATUS_CLOSED); -- Status: new -> done
    test_change_hint_status(L_CLOSED_HINT_ID, null, null); -- No action

    /* ADD HINTS - NOT ASSIGNED OPERS */
    test_check_not_assign_opers(L_EXP_NOT_ASSIGN_OPERS);

    /* ADD HINTS - DELAYED / NOT STARTED OPERS */
    test_check_delayed_oper(L_EXP_DEL_OPERS);

    /* ADD HINTS - OPERS TO BE ACCEPTED */
    test_opers_wo_acceptance(L_EXP_WO_ACCEPT_OPERS);

    /* ADD HINT FOR WHMNGR - OPERS AFTER DATE CHANGE */
    test_planned_date_changed(
        p_oper_id => L_OPER_ID_W_NEW_DATE_1,
        p_for_who_id => PKG_USERS_AND_ROLES.G_WHMNGR_ROLE_ID,
        p_new_oper_date_time => sysdate + 3,
        p_info_from_client => L_INFO_FROM_CLIENT
    );

    /* ADD HINT FOR LOGIST - OPERS AFTER DATE CHANGE */
    test_planned_date_changed(
        p_oper_id => L_OPER_ID_W_NEW_DATE_2,
        p_for_who_id => PKG_USERS_AND_ROLES.G_LOGIST_ROLE_ID,
        p_new_oper_date_time => sysdate + 3
    );

end test_hints;

procedure run_tests as
begin
    clear_test_results;

    test_hints;

    show_test_summary;
end;

/* END HINTS TESTS */

end "PKG_TESTS";
/