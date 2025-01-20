create or replace package body "PKG_WAREHOUSE" as

/* START SIZE OPERATIONS */

procedure add_size(p_dim_1 int, p_dim_2 int, p_dim_3 int) as
begin
    insert into sizes(size_dim1_max, size_dim2_max, size_dim3_max) values(p_dim_1, p_dim_2, p_dim_3);

exception
when others then
    RAISE_APPLICATION_ERROR(-20000, 'Wystąpił błąd podczas dodawania rozmiaru lokalizacji magazynowej.');
end add_size;

procedure edit_size(p_size_id int, p_dim_1 int, p_dim_2 int, p_dim_3 int) as
begin
    update sizes
    set
        size_dim1_max = p_dim_1,
        size_dim2_max = p_dim_2,
        size_dim3_max = p_dim_3
    where size_id = p_size_id;

exception
when others then
    RAISE_APPLICATION_ERROR(-20000, 'Wystąpił błąd podczas edytowania rozmiaru lokalizacji magazynowej.');
end edit_size;

procedure delete_size(p_size_id int) as
begin
    delete from sizes where size_id = p_size_id;

exception
when others then
    RAISE_APPLICATION_ERROR(-20000, 'Wystąpił błąd podczas usuwania rozmiaru lokalizacji magazynowej.');
end delete_size;

/* end SIZE OPERATIONS */



/* START LOCATION OPERATIONS */

procedure add_location(p_loc_alley int, p_loc_side string, p_loc_number int, p_loc_size_id int) as
begin
    insert into locations(loc_alley, loc_side, loc_number, loc_size_id)
    values(p_loc_alley, p_loc_side, p_loc_number, p_loc_size_id);

exception
when others then
    RAISE_APPLICATION_ERROR(-20000, 'Wystąpił błąd podczas dodawania lokalizacji magazynowej.');
end add_location;

procedure edit_location(p_loc_id int, p_loc_alley int, p_loc_side string, p_loc_number int, p_loc_size_id int) as
begin
    update locations
    set
        loc_alley = p_loc_alley,
        loc_side = p_loc_side,
        loc_number = p_loc_number,
        loc_size_id = p_loc_size_id
    where loc_id = p_loc_id;

exception
when others then
    RAISE_APPLICATION_ERROR(-20000, 'Wystąpił błąd podczas edytowania lokalizacji magazynowej.');
end edit_location;

procedure delete_location(p_loc_id int) as
begin
    delete from locations where loc_id = p_loc_id;

exception
when others then
    RAISE_APPLICATION_ERROR(-20000, 'Wystąpił błąd podczas usuwania lokalizacji magazynowej.');
end delete_location;

/* end LOCATION OPERATIONS */



/* START PRODUCT OPERATIONS */

procedure add_product(p_prod_name string, p_prod_size_id int, p_prod_cl_id int, p_prod_optimum_q int) as
begin
    insert into products(prod_name, prod_size_id, prod_cl_id, prod_optimum_q)
    values(p_prod_name, p_prod_size_id, p_prod_cl_id, p_prod_optimum_q);

exception
when others then
    RAISE_APPLICATION_ERROR(-20000, 'Wystąpił błąd podczas dodawania produktu.');
end add_product;

procedure edit_product(p_prod_id int, p_prod_name string, p_prod_size_id int, p_prod_cl_id int, p_prod_optimum_q int) as
begin
    update products
    set
        prod_name = p_prod_name,
        prod_size_id = p_prod_size_id,
        prod_cl_id = p_prod_cl_id,
        prod_optimum_q = p_prod_optimum_q
    where prod_id = p_prod_id;

exception
when others then
    RAISE_APPLICATION_ERROR(-20000, 'Wystąpił błąd podczas edytowania produktu.');
end edit_product;

procedure delete_product(p_prod_id int) as
begin
    delete from products where prod_id = p_prod_id;

exception
when others then
    RAISE_APPLICATION_ERROR(-20000, 'Wystąpił błąd podczas usuwania produktu.');
end delete_product;

/* END PRODUCT OPERATIONS */



/* START SHIFT OPERATIONS */

procedure add_shift(p_whman_id int, p_shift_no int, p_shift_date date) as
v_shift_start timestamp;
begin
    v_shift_start := cast(p_shift_date as timestamp);
    case p_shift_no
        when 1 then v_shift_start := v_shift_start + interval '6' hour;
        when 2 then v_shift_start := v_shift_start + interval '14' hour;
    end case;

    insert into wh_schedule_whmen(wsw_whman_id, wsw_shift_no, wsw_start, wsw_end)
    values(p_whman_id, p_shift_no, v_shift_start, v_shift_start + interval '8' hour);

exception
when others then
    RAISE_APPLICATION_ERROR(-20001, 'Wystąpił błąd podczas dodawania zmiany.');
    --RAISE_APPLICATION_ERROR(-20000, 'PKG_WAREHOUSE.add_shift (' || SQLERRM || ')');
end add_shift;

procedure edit_shift(p_shift_id int, p_shift_no int, p_shift_date date) as
begin
    update wh_schedule_whmen
    set
        wsw_shift_no = p_shift_no,
        wsw_start = p_shift_date,
        wsw_end = p_shift_date + interval '8' hour
    where wsw_id = p_shift_id;

exception
when others then
    RAISE_APPLICATION_ERROR(-20001, 'Wystąpił błąd podczas edytowania zmiany.');
end edit_shift;

procedure delete_shift(p_shift_id int) as
begin
    delete from wh_schedule_whmen where wsw_id = p_shift_id;

exception
when others then
    RAISE_APPLICATION_ERROR(-20001, 'Wystąpił błąd podczas usuwania zmiany.');
end delete_shift;

/* END SHIFT OPERATIONS */



/* START STOCK OPERATIONS */

procedure create_oper_stock(p_oper_id int) as
type t_positions is table of int;
v_positions_array t_positions;
v_stock_no int;
v_location_id int;
v_prod_amount int;
v_product_id int;
v_product_size_id int;
begin
    v_stock_no := PKG_UTIL.get_stock_q_oper(p_oper_id);

    if v_stock_no > 0 then 
        RAISE_APPLICATION_ERROR(-20001, 'Lista magazynowa przyjęcia została już utworzona.');
    end if;

    select pos_id bulk collect into v_positions_array from oper_positions where pos_oper_id = p_oper_id;
    --DEBUG dbms_output.put_line('v_positions_array(1) = ' || v_positions_array(1));
    
    for i in 1 .. v_positions_array.count
    loop     
        /* Get pos_amount, size_id and prod_id */
        select pos_amount, pos_prod_id, prod_size_id into v_prod_amount, v_product_id, v_product_size_id
        from oper_positions, products
        where pos_prod_id = prod_id and pos_id = v_positions_array(i);
        --DEBUG dbms_output.put_line('v_prod_amount = ' || v_prod_amount || ', v_product_id = ' || v_product_id);

        for j in 0 .. v_prod_amount - 1
        loop
            --DEBUG dbms_output.put_line('j = ' || j || ', v_product_size_id = ' || v_product_size_id);              
            /* Choose loc_id */
            select loc_id into v_location_id
            from (select loc_id
                  from locations
                  where loc_size_id = v_product_size_id and loc_id not in(select stock_loc_id from stock)
                  order by loc_id
                  )
            where rownum = 1;
            --DEBUG dbms_output.put_line('v_location_id = ' || v_location_id); 

            /* Insert into stock */
            insert into stock(stock_pos_id, stock_prod_id, stock_loc_id) values(v_positions_array(i), v_product_id, v_location_id);
            
            /* Insert into stock_audit */
            insert into stock_audit(sa_oper_pos_id, sa_loc_id) values(v_positions_array(i), v_location_id);
        end loop;
    end loop;

exception
when no_data_found then
    ROLLBACK; 
    RAISE_APPLICATION_ERROR(-20001, 'Brak miejsca na magazynie'); 
when others then
    ROLLBACK;
    RAISE_APPLICATION_ERROR(-20000, 'Wystąpił błąd tworzenia listy magazynowej przyjęcia (' || SQLERRM || ')');    
end create_oper_stock;

procedure take_oper_stock(p_oper_id int) as
type t_positions is table of int;
v_positions_array t_positions;
v_stock_no int;
v_stock_id int;
v_location_id int;
v_prod_amount int;
v_product_id int;
v_product_size_id int;
begin
    select pos_id bulk collect into v_positions_array from oper_positions where pos_oper_id = p_oper_id;
    dbms_output.put_line('v_positions_array(1) = ' || v_positions_array(1));
    
    for i in 1 .. v_positions_array.count
    loop     
        /* Get pos_id and prod_id, size_id */
        select pos_amount, pos_prod_id into v_prod_amount, v_product_id
        from oper_positions
        where pos_id = v_positions_array(i);
        dbms_output.put_line('v_prod_amount = ' || v_prod_amount || ', v_product_id = ' || v_product_id);

        for j in 1 .. v_prod_amount
        loop
            /* Choose stock_id */
            select stock_id, stock_loc_id into v_stock_id, v_location_id
            from (select stock_id, stock_loc_id from stock where stock_prod_id = v_product_id order by stock_loc_id)
            where rownum = 1;
            dbms_output.put_line('v_stock_id = ' || v_stock_id || 'v_location_id = ' || v_location_id); 

            /* Delete from stock */
            delete from stock where stock_id = v_stock_id;
            
            /* Insert into stock_audit */
            insert into stock_audit(sa_oper_pos_id, sa_loc_id) values(v_positions_array(i), v_location_id);
        end loop;
    end loop;

exception
when no_data_found then
    ROLLBACK; 
    RAISE_APPLICATION_ERROR(-20001, 'Brak towarów na magazynie'); 
when others then
    ROLLBACK;
    RAISE_APPLICATION_ERROR(-20000, 'Wystąpił błąd tworzenia listy magazynowej wydania (' || SQLERRM || ')');    
end take_oper_stock;

/* END STOCK OPERATIONS */

end "PKG_WAREHOUSE";
/