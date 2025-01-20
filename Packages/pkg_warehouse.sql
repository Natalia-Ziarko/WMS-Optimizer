create or replace package "PKG_WAREHOUSE" as

/* Sizes */

procedure add_size(p_dim_1 int, p_dim_2 int, p_dim_3 int);

procedure edit_size(p_size_id int, p_dim_1 int, p_dim_2 int, p_dim_3 int);

procedure delete_size(p_size_id int);



/* Locations */

procedure add_location(p_loc_alley int, p_loc_side string, p_loc_number int, p_loc_size_id int);

procedure edit_location(p_loc_id int, p_loc_alley int, p_loc_side string, p_loc_number int, p_loc_size_id int);

procedure delete_location(p_loc_id int);



/* Products */

procedure add_product(p_prod_name string, p_prod_size_id int, p_prod_cl_id int, p_prod_optimum_q int);

procedure edit_product(p_prod_id int, p_prod_name string, p_prod_size_id int, p_prod_cl_id int, p_prod_optimum_q int);

procedure delete_product(p_prod_id int);



/* Shifts */

procedure add_shift(p_whman_id int, p_shift_no int, p_shift_date date);

procedure edit_shift(p_shift_id int, p_shift_no int, p_shift_date date);

procedure delete_shift(p_shift_id int);



/* Stock */

procedure create_oper_stock(p_oper_id int);

procedure take_oper_stock(p_oper_id int);



end "PKG_WAREHOUSE";
/