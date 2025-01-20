create or replace package "PKG_UTIL" as

function get_hint_status(p_hint_id int) return varchar2;

function get_contact_person(p_client_id int) return varchar2;

function get_whmngr_cont_det return varchar2;

function get_user_role_id(p_user_id int) return int;

function get_client_id(p_oper_id int) return int;

function get_oper_type(p_oper_id int) return varchar2;

function get_stock_q_oper(p_oper_id int) return int;

function get_parent_oper_id(p_oper_id int) return int;

function get_child_oper_id(p_oper_id int) return int;

function get_oper_duration(p_oper_id int) return int;

end "PKG_UTIL";
/