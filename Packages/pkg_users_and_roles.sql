create or replace package "PKG_USERS_AND_ROLES" as
G_ADMIN_ROLE_ID  CONSTANT INT := 1;
G_WHMNGR_ROLE_ID CONSTANT INT := 2;
G_LOGIST_ROLE_ID CONSTANT INT := 4;
G_SYSTEM_ROLE_ID CONSTANT INT := 9999999999;

TYPE t_ids IS TABLE OF INTEGER;



/* Roles */

procedure add_role(p_role_name string);

procedure edit_role(p_role_id int, p_role_name string, p_role_f_active char);

procedure delete_role(p_role_id int);



/* User and it's roles */

procedure add_user_with_roles(
    p_name_surname varchar2,
    p_first_name varchar2 := null,
    p_tax_id varchar2,
    p_phone varchar2,
    p_contact_person varchar2,
    p_user_type varchar2 := null,
    p_user_login varchar2,
    p_user_email varchar2,
    p_roles varchar2
);

procedure edit_user_with_roles(
    p_user_id int,
    p_name_surname varchar2,
    p_first_name varchar2 := null,
    p_tax_id varchar2,
    p_phone varchar2,
    p_contact_person varchar2,
    p_user_type varchar2 := null,
    p_user_login varchar2,
    p_user_email varchar2,
    p_roles varchar2
);

procedure delete_user_with_roles(p_user_id int);

end "PKG_USERS_AND_ROLES";
/