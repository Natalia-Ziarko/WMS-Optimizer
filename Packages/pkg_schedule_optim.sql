create or replace package "PKG_SCHEDULE_OPTIM" as
G_FREE_SCHEDULE_SLOT  CONSTANT CHAR(1 CHAR) := 'F';
G_SCHEDULE_OPER_TYPE  CONSTANT CHAR(1 CHAR) := 'O';
G_SCHEDULE_SHIFT_TYPE CONSTANT CHAR(1 CHAR) := 'S';
G_SLOT_INTERVAL       CONSTANT INT := 15;

G_V_SCH_OPTIM_START_DATE     date := trunc(SYSDATE) + 1;
G_V_SCH_OPTIM_SHIFT_END_DATE date := G_V_SCH_OPTIM_START_DATE + 2;
G_V_SCH_OPTIM_OPER_END_DATE  date := G_V_SCH_OPTIM_START_DATE + 4;

TYPE r_slot IS RECORD(slot_id int, slot_start timestamp, whman_id int, oper_id int);
TYPE t_slot IS TABLE OF r_slot;
TYPE t_int  IS TABLE OF INT;

procedure insert_slots;

procedure assign_opers_update_slots;

function optimize_schedule return varchar2;

procedure manage_schedule_optim(p_loading_id int, p_f_accepted int);

end "PKG_SCHEDULE_OPTIM";
/