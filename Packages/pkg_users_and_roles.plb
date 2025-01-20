create or replace package body "PKG_USERS_AND_ROLES" as

/* START ROLE OPERATIONS */

procedure add_role(p_role_name string) as
begin
    IF p_role_name IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'Nazwa roli jest pusta');

        RETURN;
    END IF;

    insert into roles(rol_name) values(p_role_name);

exception
when others then
    RAISE_APPLICATION_ERROR(-20000, 'Wystąpił błąd podczas dodawania roli.');
end add_role;

procedure edit_role(p_role_id int, p_role_name string, p_role_f_active char) as
begin
    IF p_role_id IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID roli jest puste');
        RETURN;
    ELSIF p_role_name IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'Nazwa roli jest pusta');
        RETURN; 
    ELSIF p_role_f_active IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'Status roli jest pusty');
        RETURN;   
    END IF;

    update roles
    set rol_name = p_role_name, rol_f_active = p_role_f_active
    where rol_id = p_role_id;

exception
when others then
    RAISE_APPLICATION_ERROR(-20000, 'Wystąpił błąd podczas edycji roli.');
end edit_role;

procedure delete_role(p_role_id int) as
begin
    IF p_role_id IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'ID roli jest puste');

        RETURN;
    END IF;

    delete from roles where rol_id = p_role_id;

exception
when others then
    RAISE_APPLICATION_ERROR(-20000, 'Wystąpił błąd podczas usuwania roli.');
end delete_role;

/* END ROLE OPERATIONS */



/* START USER'S ROLES OPERATIONS */

function split_string(p_roles string) return t_ids as
v_roles_ids t_ids := t_ids();
begin
    if length(p_roles) > 0 then
        
        /* Use XMLTABLE to split the string by ':' */
        FOR role IN (
            SELECT COLUMN_VALUE AS role_id
            FROM XMLTABLE(('"' || REPLACE(p_roles, ':', '","') || '"') COLUMNS COLUMN_VALUE VARCHAR2(100) PATH '.')
        ) LOOP
            /* Add each role to the nested table */
            v_roles_ids.EXTEND;
            v_roles_ids(v_roles_ids.COUNT) := role.role_id;
        END LOOP;

        return v_roles_ids;
    else 
        RAISE_APPLICATION_ERROR(-20002, 'Musi istnieć przynajmniej jedna rola');
    end if;

EXCEPTION
WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20002, 'Wystąpił błąd podczas sprawdzania ról użytkownika (' || SQLERRM || ')');
end split_string;

function get_user_roles(p_user_id int) return t_ids as
t_user_roles t_ids := t_ids();
begin
    select ur_role_id bulk collect into t_user_roles
    from users_roles
    where ur_user_id = p_user_id and ur_end_date is null
    order by ur_role_id;

    return t_user_roles;

exception
when others then
    RAISE_APPLICATION_ERROR(-20000, 'Wystąpił błąd pobierania ról użytkownika.');
end get_user_roles;

procedure add_user_role(p_user_id int, p_role_id int) as
begin
    insert into users_roles(ur_role_id, ur_user_id, ur_start_date) values(p_role_id, p_user_id, sysdate);

exception
when others then
    RAISE_APPLICATION_ERROR(-20000, 'Wystąpił błąd podczas dodawania roli użytkownikowi.');
end add_user_role;

procedure edit_user_role(p_user_id int, p_role_id int) as
begin
    update users_roles set ur_end_date = sysdate where ur_user_id = p_user_id and ur_role_id = p_role_id;

exception
when others then
    RAISE_APPLICATION_ERROR(-20000, 'Wystąpił błąd podczas edycji roli użytkownika.');
end edit_user_role;

/* END USER'S ROLES OPERATIONS */



/* START USER AND ROLES OPERATIONS */

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
) as
--TYPE t_roles_ids IS TABLE OF VARCHAR2(10 char);
v_roles_ids t_ids := t_ids();

v_user_id int;
v_roles_number int;
begin
    BEGIN
        dbms_output.put_line('Before insert into users');
        
        insert into users(
            user_name_surname,
            user_first_name,
            user_login,
            user_email,
            user_tax_id,
            user_phone,
            user_contact_person,
            user_type,
            user_when_added,
            user_who_added
        )
        values(
            p_name_surname,
            p_first_name,
            p_user_login,
            p_user_email,
            p_tax_id,
            p_phone,
            p_contact_person,
            p_user_type,
            sysdate,
            G_ADMIN_ROLE_ID
        )
        returning user_id into v_user_id;
        
        dbms_output.put_line('After insert into users');
    EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20001, 'Wystąpił błąd podczas dodawania użytkownika (' || SQLERRM || ')');
    END;

    if v_user_id is not null and length(p_roles) > 0 then
        BEGIN
            /* Use XMLTABLE to split the string by ':' */
            FOR role IN (
                SELECT COLUMN_VALUE AS role_id
                FROM XMLTABLE(('"' || REPLACE(p_roles, ':', '","') || '"') COLUMNS COLUMN_VALUE VARCHAR2(100) PATH '.')
            ) LOOP
                /* Add each role to the nested table */
                v_roles_ids.EXTEND;
                v_roles_ids(v_roles_ids.COUNT) := role.role_id;
            END LOOP;

            v_roles_number := v_roles_ids.COUNT;

            dbms_output.put_line('Before insert into users_roles');
            for i in 1..v_roles_number
            loop
                insert into users_roles(ur_role_id, ur_user_id, ur_start_date)
                values(v_roles_ids(i), v_user_id, sysdate);
            end loop;
            dbms_output.put_line('After insert into users_roles');
        EXCEPTION
            WHEN OTHERS THEN
                RAISE_APPLICATION_ERROR(-20002, 'Wystąpił błąd podczas dodawania ról (' || SQLERRM || ')');
        END;

        commit;
        
    else
        rollback;
        
        RAISE_APPLICATION_ERROR(-20000, 'Wystąpił błąd podczas dodawania użytkownika');
    end if;
    
exception
when others then
    RAISE_APPLICATION_ERROR(-20000, 'Wystąpił błąd podczas dodawania użytkownika/ról (' || SQLERRM || ')');
end add_user_with_roles;

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
) as
v_old_roles_ids t_ids := t_ids();
v_new_roles_ids t_ids := t_ids();

v_roles_ids_to_add t_ids := t_ids();
v_roles_ids_to_edit t_ids := t_ids();

v_user_id int;
v_roles_number int;

v_roles_old_string varchar2(1000 char);
v_roles_new_string varchar2(1000 char);

f_user_roles_equal BOOLEAN;
begin
    --DEBUG dbms_output.put_line('Before update user');
    
    update users
    set
        user_name_surname = p_name_surname,
        user_first_name = p_first_name,
        user_tax_id = p_tax_id,
        user_phone = p_phone,
        user_contact_person = p_contact_person,
        user_type = p_user_type,
        user_login = p_user_login,
        user_when_modified = sysdate,
        user_who_modified = G_ADMIN_ROLE_ID
    where user_id = p_user_id;
    
    --DEBUG dbms_output.put_line('After update user');
    --DEBUG dbms_output.put_line('');
    
    --DEBUG dbms_output.put_line('Before user''s roles operations');
    
    v_old_roles_ids := get_user_roles(p_user_id);
    v_new_roles_ids := split_string(p_roles);
        
    v_roles_ids_to_edit := v_old_roles_ids MULTISET EXCEPT v_new_roles_ids;
    IF v_roles_ids_to_edit.COUNT > 0 THEN
        FOR i IN v_roles_ids_to_edit.FIRST .. v_roles_ids_to_edit.LAST LOOP
            --DEBUG DBMS_OUTPUT.PUT_LINE('ID role to be edited: ' || v_roles_ids_to_edit(i));
            edit_user_role(p_user_id, v_roles_ids_to_edit(i));
        END LOOP;
        --DEBUG DBMS_OUTPUT.PUT_LINE('>>>User''s roles were removed');
    END IF;

    v_roles_ids_to_add := v_new_roles_ids MULTISET EXCEPT v_old_roles_ids;
    IF v_roles_ids_to_add.COUNT > 0 THEN
        FOR i IN v_roles_ids_to_add.FIRST .. v_roles_ids_to_add.LAST LOOP
            --DEBUG DBMS_OUTPUT.PUT_LINE('ID role to be added: ' || v_roles_ids_to_add(i));
            add_user_role(p_user_id, v_roles_ids_to_add(i));
        END LOOP;
    END IF;
    
    --DEBUG dbms_output.put_line('After user''s roles operations');
    --DEBUG dbms_output.put_line('');
    
    COMMIT;
    
exception
when others then
    rollback;

    RAISE_APPLICATION_ERROR(-20000, 'Wystąpił błąd podczas edytowania użytkownika/ról (' || SQLERRM || ')');
end edit_user_with_roles;

procedure delete_user_with_roles(p_user_id int) as
begin
    delete from users_roles where ur_user_id = p_user_id;
    if SQL%ROWCOUNT = 0 then RAISE_APPLICATION_ERROR(-20000, 'Użytkownik o podanym ID nie miał przypisanych ról'); end if;

    delete from users where user_id = p_user_id;
    if SQL%ROWCOUNT = 0 then RAISE_APPLICATION_ERROR(-20000, 'Użytkownik o podanym ID nie istnieje'); end if;

exception
when others then
    rollback;

    RAISE_APPLICATION_ERROR(-20000, 'Wystąpił błąd podczas usuwania użytkownika/ról (' || SQLERRM || ')');
end delete_user_with_roles;

/* END USER AND ROLES OPERATIONS */

end "PKG_USERS_AND_ROLES";
/