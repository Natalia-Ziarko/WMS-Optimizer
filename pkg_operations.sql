create or replace package "PKG_OPERATIONS" as
G_PICKING_OPER_TYPE   CONSTANT CHAR(1 CHAR) := 'P';
G_DELIVERY_OPER_TYPE  CONSTANT CHAR(1 CHAR) := 'D';
G_RELEASE_OPER_TYPE   CONSTANT CHAR(1 CHAR) := 'R';
G_LOADING_OPER_TYPE   CONSTANT CHAR(1 CHAR) := 'L';

G_STATUS_NEW          CONSTANT CHAR(1 CHAR) := 'N';
G_STATUS_CANCELLED    CONSTANT CHAR(1 CHAR) := 'C';
G_STATUS_DONE         CONSTANT CHAR(1 CHAR) := 'D';
G_STATUS_PICKING_HINT CONSTANT CHAR(2 CHAR) := 'PH';
G_STATUS_LOADING_HINT CONSTANT CHAR(2 CHAR) := 'LH';
G_STATUS_RELEASE_HINT CONSTANT CHAR(2 CHAR) := 'RH';



/* Add */

procedure add_operation(
    p_oper_type char,
    p_client_id int,
    p_planned_date timestamp,
    p_products_list clob := null,
    p_release_oper_id int := null,
    p_whman_id int := null
);



/* Edit */

procedure edit_oper_as_mngr(
    p_oper_id int,
    p_whman_id int,
    p_planned_date_time timestamp,
    p_oper_time int
);

procedure edit_oper_as_whman(p_oper_id int, p_action varchar2);

procedure edit_oper_as_logist(p_oper_id int);

end "PKG_OPERATIONS";
/