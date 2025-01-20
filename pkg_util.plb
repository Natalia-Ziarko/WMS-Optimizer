create or replace package body "PKG_UTIL" as

function get_hint_status(p_hint_id int) return varchar2 as
v_actual_status varchar2(2 char);
begin
    select hint_status into v_actual_status from hints where hint_id = p_hint_id;

    return v_actual_status;

exception
when no_data_found then
    return '<STATUS NIEZNANY>';
end get_hint_status;

function get_contact_person(p_client_id int) return varchar2 as
v_user_contact_person varchar2(100 char);
begin
    select user_contact_person into v_user_contact_person from users where user_id = p_client_id;

    return v_user_contact_person;

exception
when no_data_found then
    return '<BRAK DANYCH>';
end get_contact_person;

function get_whmngr_cont_det return varchar2 as
v_name varchar2(100 char);
v_surname varchar2(100 char);
v_phone_no varchar2(100 char);
v_contact_details varchar2(1000 char);
begin
    select user_first_name, user_name_surname, user_phone into v_name, v_surname, v_phone_no
    from users, users_roles
    where user_id = ur_user_id and ur_role_id = PKG_USERS_AND_ROLES.G_WHMNGR_ROLE_ID and ur_end_date is null;

    v_contact_details := v_name || ' ' || v_surname || ', tel: ' || v_phone_no;

    return v_contact_details;

exception
when no_data_found then
    return '<BRAK DANYCH W BAZIE>';     
end get_whmngr_cont_det;

function get_user_role_id(p_user_id int) return int as
v_role_id int;
begin
    select ur_role_id into v_role_id
    from users_roles
    where ur_user_id = p_user_id and ur_end_date is null and rownum = 1;

    return v_role_id;

exception
when no_data_found then
    return PKG_USERS_AND_ROLES.G_SYSTEM_ROLE_ID;    
end get_user_role_id;

function get_client_id(p_oper_id int) return int as
v_cl_id int;
begin
    select oper_cl_id into v_cl_id from operations where oper_id = p_oper_id;

    return v_cl_id;

exception
when no_data_found then
    return 0;    
end get_client_id;

function get_oper_type(p_oper_id int) return varchar2 as
v_operation_type varchar2(2 char);
begin
    select oper_type into v_operation_type from operations where oper_id = p_oper_id;

    return v_operation_type;

exception
when no_data_found then
    return 'XX';
end get_oper_type;

function get_stock_q_oper(p_oper_id int) return int as
v_stock_q int;
begin
    select count(stock_id) into v_stock_q
    from stock, oper_positions
    where stock_pos_id = pos_id and pos_oper_id = p_oper_id;

    return v_stock_q;

exception
when no_data_found then
    return 0;
end get_stock_q_oper;

function get_parent_oper_id(p_oper_id int) return int as
v_parent_oper_id int;
begin
    select oper_parent_id into v_parent_oper_id
    from operations
    where oper_id = p_oper_id;

    return v_parent_oper_id;

exception
when no_data_found then
    RAISE;
end get_parent_oper_id; 

function get_child_oper_id(p_oper_id int) return int as
v_child_oper_id int;
begin
    select oper_id into v_child_oper_id
    from operations
    where oper_parent_id = p_oper_id;

    return v_child_oper_id;

exception
when no_data_found then
    RAISE;
end get_child_oper_id;       

function get_oper_duration(p_oper_id int) return int as
v_oper_duration int;
begin
    select oper_wh_optimum_time into v_oper_duration
    from operations
    where oper_id = p_oper_id;

    return v_oper_duration;

exception
when no_data_found then
    RAISE;
end get_oper_duration;   

end "PKG_UTIL";
/