prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>85488141341783735784
,p_default_application_id=>93334
,p_default_id_offset=>0
,p_default_owner=>'WKSP_WAREHOUSE2025'
);
wwv_flow_imp_page.create_page(
 p_id=>1
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>unistr('Magazyn - Strona g\0142\00F3wna')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'13'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(90068074985574500631)
,p_plug_name=>'wh_details-whmngr_whman_logist'
,p_title=>unistr('Szczeg\00F3\0142y magazynu')
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--accent1:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>95
,p_location=>null
,p_plug_required_role=>'!'||wwv_flow_imp.id(86355472489436879191)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(90068075134835500633)
,p_plug_name=>'warehouse_occupancy'
,p_title=>unistr('Zaj\0119to\015B\0107')
,p_parent_plug_id=>wwv_flow_imp.id(90068074985574500631)
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--accent14:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>10
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(90068075241123500634)
,p_region_id=>wwv_flow_imp.id(90068075134835500633)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>false
,p_show_value=>true
,p_legend_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(90068075378431500635)
,p_chart_id=>wwv_flow_imp.id(90068075241123500634)
,p_seq=>10
,p_name=>'warehouse_occupancy_chart_data'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    size_id,',
'    CASE COUNT(DISTINCT locations.loc_id) WHEN 0 THEN 1 ELSE COUNT(DISTINCT locations.loc_id) END AS loc_q,',
'    (COUNT(stock.stock_id) / CASE COUNT(DISTINCT locations.loc_id) WHEN  0 THEN 1 ELSE COUNT(DISTINCT locations.loc_id) END) AS stock_availability',
'FROM sizes',
'LEFT JOIN locations ON sizes.size_id = locations.loc_size_id',
'LEFT JOIN stock ON stock.stock_loc_id = locations.loc_id',
'GROUP BY size_id',
'ORDER BY size_id'))
,p_items_value_column_name=>'STOCK_AVAILABILITY'
,p_items_label_column_name=>'SIZE_ID'
,p_color=>'#000080'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(90068075575311500637)
,p_chart_id=>wwv_flow_imp.id(90068075241123500634)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_min=>0
,p_max=>1
,p_format_type=>'percent'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_step=>.1
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(99414174931169214101)
,p_chart_id=>wwv_flow_imp.id(90068075241123500634)
,p_axis=>'y2'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_split_dual_y=>'auto'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(90068075471148500636)
,p_chart_id=>wwv_flow_imp.id(90068075241123500634)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title=>'ID rozmiaru lokalizacji'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'none'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(90068075673003500638)
,p_plug_name=>'subregion'
,p_title=>'subregion'
,p_parent_plug_id=>wwv_flow_imp.id(90068074985574500631)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_column=>7
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(87108500022084593901)
,p_plug_name=>'locations'
,p_title=>'Lokalizacje'
,p_region_name=>'LOCATIONS_STATIC_ID'
,p_parent_plug_id=>wwv_flow_imp.id(90068075673003500638)
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--accent15:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_location=>null
,p_plug_required_role=>wwv_flow_imp.id(94328862025724775021)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(87108500119464593902)
,p_name=>'t_locations'
,p_title=>'Locations'
,p_region_name=>'T_LOCATIONS_STATIC_ID'
,p_parent_plug_id=>wwv_flow_imp.id(87108500022084593901)
,p_template=>wwv_flow_imp.id(86355272385676879037)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    null loc_menu,',
'    LOC_ID,',
'    LOC_ALLEY,',
'    LOC_SIDE,',
'    LOC_NUMBER,',
'    LOC_SIZE_ID',
'from LOCATIONS'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(86355320577334879058)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'Brak lokalizacji magazynowych'
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Pobierz dane'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(90068076346586500645)
,p_query_column_id=>1
,p_column_alias=>'LOC_MENU'
,p_column_display_sequence=>10
,p_column_css_class=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_column_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:6:P6_ACTION_TYPE,P6_LOC_ID:edit,#LOC_ID#'
,p_column_linktext=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_column_alignment=>'CENTER'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_report_column_width=>40
,p_derived_column=>'N'
,p_include_in_export=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(90068075799494500639)
,p_query_column_id=>2
,p_column_alias=>'LOC_ID'
,p_column_display_sequence=>20
,p_column_heading=>'ID'
,p_column_alignment=>'CENTER'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_report_column_width=>40
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(90068075823651500640)
,p_query_column_id=>3
,p_column_alias=>'LOC_ALLEY'
,p_column_display_sequence=>30
,p_column_heading=>'Aleja'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(90068075953474500641)
,p_query_column_id=>4
,p_column_alias=>'LOC_SIDE'
,p_column_display_sequence=>40
,p_column_heading=>'Strona'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_report_column_width=>40
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(90068076043273500642)
,p_query_column_id=>5
,p_column_alias=>'LOC_NUMBER'
,p_column_display_sequence=>50
,p_column_heading=>'Numer'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(90068076152109500643)
,p_query_column_id=>6
,p_column_alias=>'LOC_SIZE_ID'
,p_column_display_sequence=>60
,p_column_heading=>'ID rozmiaru'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_report_column_width=>40
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(87108501396258593914)
,p_plug_name=>'sizes'
,p_title=>unistr('Rozmiary lokalizacji magazynowych / maksymalne wymiary produkt\00F3w')
,p_region_name=>'SIZES_STATIC_ID'
,p_parent_plug_id=>wwv_flow_imp.id(90068075673003500638)
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--accent14:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>50
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(87108501437626593915)
,p_name=>'t_sizes'
,p_title=>'Sizes'
,p_region_name=>'T_SIZES_STATIC_ID'
,p_parent_plug_id=>wwv_flow_imp.id(87108501396258593914)
,p_template=>wwv_flow_imp.id(86355215450137879014)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    null size_menu,',
'    SIZE_ID,',
'    (SIZE_DIM1_MAX || '' cm x '' ||',
'    SIZE_DIM2_MAX || '' cm x '' ||',
'    SIZE_DIM3_MAX || '' cm'') SIZE_DIM',
'from',
'    SIZES'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(86355320577334879058)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>unistr('Brak rozmiar\00F3w lokalizacji magazynowych')
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Pobierz dane'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(90068072577395500607)
,p_query_column_id=>1
,p_column_alias=>'SIZE_MENU'
,p_column_display_sequence=>10
,p_column_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:5:P5_ACTION_TYPE,P5_SIZE_ID:edit,#SIZE_ID#'
,p_column_linktext=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_column_alignment=>'CENTER'
,p_report_column_required_role=>wwv_flow_imp.id(94328862025724775021)
,p_display_as=>'WITHOUT_MODIFICATION'
,p_report_column_width=>20
,p_derived_column=>'N'
,p_include_in_export=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(87108502174103593922)
,p_query_column_id=>2
,p_column_alias=>'SIZE_ID'
,p_column_display_sequence=>20
,p_column_heading=>'ID'
,p_column_alignment=>'CENTER'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(87108502586999593926)
,p_query_column_id=>3
,p_column_alias=>'SIZE_DIM'
,p_column_display_sequence=>30
,p_column_heading=>'Wymiar'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(90068075015082500632)
,p_plug_name=>'prods_stock-whmngr_logist'
,p_title=>'Produkty i ich stan magazynowy'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--accent1:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>105
,p_location=>null
,p_plug_required_role=>wwv_flow_imp.id(102238840792635185815)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(86385190576910791344)
,p_plug_name=>'t_products'
,p_title=>'Produkty'
,p_region_name=>'T_PRODUCTS_STATIC_ID'
,p_parent_plug_id=>wwv_flow_imp.id(90068075015082500632)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(86355272385676879037)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    null prod_menu,',
'    PROD_ID,',
'    PROD_NAME,',
'    PROD_SIZE_ID,',
'    (select USER_ID || '' - '' || USER_NAME_SURNAME from USERS where USER_ID = PROD_CL_ID) prod_client,',
'    (select count(stock_id) from stock where stock_prod_id = PROD_ID) prod_stock,',
'    PROD_OPTIMUM_Q',
'from PRODUCTS'))
,p_plug_source_type=>'NATIVE_IG'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Produkty'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(90482328766732875822)
,p_name=>'PROD_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROD_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(90482328885700875823)
,p_name=>'PROD_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROD_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nazwa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_max_length=>1020
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(90482328940421875824)
,p_name=>'PROD_SIZE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROD_SIZE_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'ID rozmiaru'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(90482329014098875825)
,p_name=>'PROD_CLIENT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROD_CLIENT'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Klient'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>243
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(90482329199313875826)
,p_name=>'PROD_STOCK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROD_STOCK'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Zapas<br>magazynowy'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(90482329949222875834)
,p_name=>'PROD_MENU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROD_MENU'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:7:P7_ACTION_TYPE,P7_PROD_ID,P7_STOCK:edit,&PROD_ID.,&PROD_STOCK.#PROD_ID#'
,p_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(90482330090332875835)
,p_name=>'PROD_OPTIMUM_Q'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROD_OPTIMUM_Q'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Zapas<br>optymalny'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(90482328621222875821)
,p_internal_uid=>90482328621222875821
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(90535854567887673434)
,p_interactive_grid_id=>wwv_flow_imp.id(90482328621222875821)
,p_static_id=>'905358546'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(90535854759911673434)
,p_report_id=>wwv_flow_imp.id(90535854567887673434)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(90535855243026673437)
,p_view_id=>wwv_flow_imp.id(90535854759911673434)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(90482328766732875822)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>73
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(90535856132502673441)
,p_view_id=>wwv_flow_imp.id(90535854759911673434)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(90482328885700875823)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>435
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(90535857036600673444)
,p_view_id=>wwv_flow_imp.id(90535854759911673434)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(90482328940421875824)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>92
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(90535857946575673447)
,p_view_id=>wwv_flow_imp.id(90535854759911673434)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(90482329014098875825)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>215
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(90535858896623673450)
,p_view_id=>wwv_flow_imp.id(90535854759911673434)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(90482329199313875826)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>109
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(90586384455071416665)
,p_view_id=>wwv_flow_imp.id(90535854759911673434)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(90482329949222875834)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>30
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(90591275196794455417)
,p_view_id=>wwv_flow_imp.id(90535854759911673434)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(90482330090332875835)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(90482327624246875811)
,p_name=>'t_stock_with_loc'
,p_title=>'Stan magazynowy produktu'
,p_parent_plug_id=>wwv_flow_imp.id(90068075015082500632)
,p_template=>wwv_flow_imp.id(86355282131832879041)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--accent14:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_new_grid_row=>false
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select pos_oper_id, stock_loc_id',
'from stock',
'left join oper_positions on stock_pos_id = pos_id',
'where pos_prod_id = :P1_PROD_ID_MD'))
,p_required_role=>wwv_flow_imp.id(94328862025724775021)
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P1_PROD_ID_MD'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(86355320577334879058)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>unistr('Wybierz produkt / Produkt jest niedost\0119pny na magazynie')
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Pobierz dane'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(95899990976398296227)
,p_query_column_id=>1
,p_column_alias=>'POS_OPER_ID'
,p_column_display_sequence=>10
,p_column_heading=>'ID operacji'
,p_column_alignment=>'CENTER'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_report_column_width=>100
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(90482327987296875814)
,p_query_column_id=>2
,p_column_alias=>'STOCK_LOC_ID'
,p_column_display_sequence=>20
,p_column_heading=>'ID lokalizacji'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_report_column_width=>30
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(95899991061872296228)
,p_name=>'t_stock_wo_loc'
,p_title=>'Stan magazynowy produktu'
,p_parent_plug_id=>wwv_flow_imp.id(90068075015082500632)
,p_template=>wwv_flow_imp.id(86355282131832879041)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--accent14:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_new_grid_row=>false
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select pos_oper_id, count(stock_loc_id)',
'from stock',
'left join oper_positions on stock_pos_id = pos_id',
'where pos_prod_id = :P1_PROD_ID_MD',
'group by pos_oper_id'))
,p_required_role=>wwv_flow_imp.id(94328010432251071261)
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P1_PROD_ID_MD'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(86355320577334879058)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>unistr('Wybierz produkt / Produkt jest niedost\0119pny na magazynie')
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Pobierz dane'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(95899991284089296230)
,p_query_column_id=>1
,p_column_alias=>'POS_OPER_ID'
,p_column_display_sequence=>20
,p_column_heading=>'ID operacji'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(95899991315303296231)
,p_query_column_id=>2
,p_column_alias=>'COUNT(STOCK_LOC_ID)'
,p_column_display_sequence=>30
,p_column_heading=>unistr('Ilo\015B\0107')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(91131321274410614704)
,p_plug_name=>'wh_work_opers-whmngr_whman_logist'
,p_title=>'Praca magazynu'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--accent1:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>85
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_plug_required_role=>'!'||wwv_flow_imp.id(86355472489436879191)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(86385190204543791341)
,p_plug_name=>'operations'
,p_title=>'Operacje'
,p_region_name=>'OPERATIONS_STATIC_ID'
,p_parent_plug_id=>wwv_flow_imp.id(91131321274410614704)
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--accent14:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>30
,p_location=>null
,p_plug_required_role=>'!'||wwv_flow_imp.id(86355472489436879191)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(86385186398671791302)
,p_plug_name=>'t_operations'
,p_title=>'Operacje'
,p_region_name=>'T_OPERATIONS_STATIC_ID'
,p_parent_plug_id=>wwv_flow_imp.id(86385190204543791341)
,p_region_template_options=>'#DEFAULT#:margin-top-md:margin-bottom-md:margin-left-md:margin-right-md'
,p_plug_template=>wwv_flow_imp.id(86355272385676879037)
,p_plug_display_sequence=>20
,p_query_type=>'FUNC_BODY_RETURNING_SQL'
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if (:P1_USER_ROLE = ''Warehouseman'') then',
'        return ''select',
'                    null oper_menu,',
'                    null oper_det_download,',
'                    OPER_ID,',
'                    OPER_PARENT_ID,',
'                    case OPER_STATUS',
'                        when ''''C'''' then ''''Anulowana''''',
unistr('                        when ''''D'''' then ''''Zako\0144czona'''''),
'                        when ''''N'''' then ''''Nowa''''',
'                        when ''''PH'''' then ''''Do zatwierdzenia''''',
'                        when ''''LH'''' then ''''Niezatwierdzona''''',
unistr('                        when ''''RH'''' then ''''Przed optymalizacj\0105'''''),
'                        else ''''Nieznany''''',
'                    end oper_status,',
'                    case OPER_TYPE',
'                        when ''''D'''' then ''''Dostawa''''',
unistr('                        when ''''L'''' then ''''Za\0142adunek'''''),
'                        when ''''P'''' then ''''Kompletacja''''',
'                        when ''''R'''' then ''''Wydanie''''',
unistr('                        when ''''T'''' then ''''Przesuni\0119cie'''''),
'                        else ''''Nieznany''''',
'                    end oper_type,',
'                    OPER_RECEIVE_DATE_TIME,',
'                    OPER_PLANNED_DATE_TIME,',
'                    (select USER_ID || '''' - '''' || USER_NAME_SURNAME from USERS where USER_ID = OPER_CL_ID) oper_client,',
'                    OPER_EMP_ID,',
'                    OPER_WH_START_DATE_TIME,',
'                    OPER_WH_END_DATE_TIME,',
'                    OPER_WH_OPTIMUM_TIME',
'                from OPERATIONS',
'                WHERE OPER_STATUS IN(''''D'''', ''''N'''') AND OPER_EMP_ID = '''''' || :P1_USER_ID || '''''''';',
'    ',
'    elsif (:P1_USER_ROLE = ''Warehousemngr'') then',
'        return ''select',
'                    null oper_menu,',
'                    null oper_det_download,',
'                    OPER_ID,',
'                    OPER_PARENT_ID,',
'                    case OPER_STATUS',
'                        when ''''C'''' then ''''Anulowana''''',
unistr('                        when ''''D'''' then ''''Zako\0144czona'''''),
'                        when ''''N'''' then ''''Nowa''''',
'                        when ''''PH'''' then ''''Do zatwierdzenia''''',
'                        when ''''LH'''' then ''''Niezatwierdzona kompletacja''''',
unistr('                        when ''''RH'''' then ''''Przed optymalizacj\0105'''''),
'                        else ''''Nieznany''''',
'                    end oper_status,',
'                    case OPER_TYPE',
'                        when ''''D'''' then ''''Dostawa''''',
unistr('                        when ''''L'''' then ''''Za\0142adunek'''''),
'                        when ''''P'''' then ''''Kompletacja''''',
'                        when ''''R'''' then ''''Wydanie''''',
unistr('                        when ''''T'''' then ''''Przesuni\0119cie'''''),
'                        else ''''Nieznany''''',
'                    end oper_type,',
'                    OPER_RECEIVE_DATE_TIME,',
'                    OPER_PLANNED_DATE_TIME,',
'                    (select USER_ID || '''' - '''' || USER_NAME_SURNAME from USERS where USER_ID = OPER_CL_ID) oper_client,',
'                    OPER_EMP_ID,',
'                    OPER_WH_START_DATE_TIME,',
'                    OPER_WH_END_DATE_TIME,',
'                    OPER_WH_OPTIMUM_TIME',
'                from OPERATIONS'';',
'                --WHERE OPER_STATUS != ''''C'''''';    ',
'    else',
'        return ''select',
'                    null oper_menu,',
'                    null oper_det_download,',
'                    OPER_ID,',
'                    OPER_PARENT_ID,',
'                    case OPER_STATUS',
'                        when ''''C'''' then ''''Anulowana''''',
unistr('                        when ''''D'''' then ''''Zako\0144czona'''''),
'                        when ''''N'''' then ''''Nowa''''',
'                        when ''''PH'''' then ''''Do zatwierdzenia przez kierownika''''',
'                        when ''''LH'''' then ''''Do zatwierdzenia przez kierownika''''',
'                        when ''''RH'''' then ''''Do zatwierdzenia przez kierownika''''',
'                        else ''''Nieznany''''',
'                    end oper_status,',
'                    case OPER_TYPE',
'                        when ''''D'''' then ''''Dostawa''''',
unistr('                        when ''''L'''' then ''''Za\0142adunek'''''),
'                        when ''''P'''' then ''''Kompletacja''''',
'                        when ''''R'''' then ''''Wydanie''''',
unistr('                        when ''''T'''' then ''''Przesuni\0119cie'''''),
'                        else ''''Nieznany''''',
'                    end oper_type,',
'                    OPER_RECEIVE_DATE_TIME,',
'                    OPER_PLANNED_DATE_TIME,',
'                    (select USER_ID || '''' - '''' || USER_NAME_SURNAME from USERS where USER_ID = OPER_CL_ID) oper_client,',
'                    OPER_EMP_ID,',
'                    OPER_WH_START_DATE_TIME,',
'                    OPER_WH_END_DATE_TIME,',
'                    OPER_WH_OPTIMUM_TIME',
'                from OPERATIONS'';',
'    end if;',
'end;'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P1_USER_ID,P1_APEX_USER_ID'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Operacje'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(92745362744296017309)
,p_name=>'OPER_MENU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OPER_MENU'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:2:P2_ACTION_TYPE,P2_OPER_ID,P2_OPER_ID_1,P2_OPER_STATUS,P2_WH_START,P2_OPER_EMP_ID,P2_OPER_PARENT_ID,P2_OPER_TYPE:edit,&OPER_ID.,&OPER_ID.,&OPER_STATUS.,&OPER_WH_START_DATE_TIME.,&OPER_EMP_ID.,&OPER_PARENT_ID.,&OPER_'
||'TYPE.'
,p_link_text=>'<span role="img" aria-label="Menu" class="fa fa-bars" title="Menu"></span>'
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(92745362918352017311)
,p_name=>'OPER_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OPER_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(92745363088570017312)
,p_name=>'OPER_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OPER_TYPE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Typ'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>13
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(92745363172422017313)
,p_name=>'OPER_RECEIVE_DATE_TIME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OPER_RECEIVE_DATE_TIME'
,p_data_type=>'TIMESTAMP'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(92745363237306017314)
,p_name=>'OPER_PLANNED_DATE_TIME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OPER_PLANNED_DATE_TIME'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Planowana data'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(92745363323282017315)
,p_name=>'OPER_CLIENT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OPER_CLIENT'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Klient'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>243
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(92745363481943017316)
,p_name=>'OPER_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OPER_EMP_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'ID magazyniera'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(92745363533288017317)
,p_name=>'OPER_WH_START_DATE_TIME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OPER_WH_START_DATE_TIME'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>unistr('Data rozpocz\0119cia')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(92745363699492017318)
,p_name=>'OPER_WH_END_DATE_TIME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OPER_WH_END_DATE_TIME'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>unistr('Data zako\0144czenia')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(92745363783411017319)
,p_name=>'OPER_WH_OPTIMUM_TIME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OPER_WH_OPTIMUM_TIME'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Planowany czas<br>[m]'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(93366190691358737629)
,p_name=>'OPER_STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OPER_STATUS'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Status'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(99791297420092863107)
,p_name=>'OPER_PARENT_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OPER_PARENT_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('ID<br>powi\0105zanego za\0142adunku')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(102220641665333164104)
,p_name=>'OPER_DET_DOWNLOAD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OPER_DET_DOWNLOAD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(92745362621178017308)
,p_internal_uid=>92745362621178017308
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU'
,p_enable_save_public_report=>true
,p_enable_subscriptions=>true
,p_enable_flashback=>false
,p_define_chart_view=>false
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(92758604878556802391)
,p_interactive_grid_id=>wwv_flow_imp.id(92745362621178017308)
,p_static_id=>'927586049'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>15
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(92758605037885802391)
,p_report_id=>wwv_flow_imp.id(92758604878556802391)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(92758605681227802397)
,p_view_id=>wwv_flow_imp.id(92758605037885802391)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(92745362744296017309)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>57
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(92758607366886802404)
,p_view_id=>wwv_flow_imp.id(92758605037885802391)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(92745362918352017311)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>77
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(92758608246325802407)
,p_view_id=>wwv_flow_imp.id(92758605037885802391)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(92745363088570017312)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>114
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(92758609144834802411)
,p_view_id=>wwv_flow_imp.id(92758605037885802391)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(92745363172422017313)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(92758610003958802414)
,p_view_id=>wwv_flow_imp.id(92758605037885802391)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(92745363237306017314)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>137
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(92758610992987802417)
,p_view_id=>wwv_flow_imp.id(92758605037885802391)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(92745363323282017315)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>167
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(92758611850443802420)
,p_view_id=>wwv_flow_imp.id(92758605037885802391)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(92745363481943017316)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>121
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(92758612724151802423)
,p_view_id=>wwv_flow_imp.id(92758605037885802391)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(92745363533288017317)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>134
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(92758613689450802426)
,p_view_id=>wwv_flow_imp.id(92758605037885802391)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(92745363699492017318)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>130
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(92758614559466802429)
,p_view_id=>wwv_flow_imp.id(92758605037885802391)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(92745363783411017319)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>124
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(93657940521765461969)
,p_view_id=>wwv_flow_imp.id(92758605037885802391)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(93366190691358737629)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>126
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(99992448322163685304)
,p_view_id=>wwv_flow_imp.id(92758605037885802391)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(99791297420092863107)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>158
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(102241044248203212938)
,p_view_id=>wwv_flow_imp.id(92758605037885802391)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(102220641665333164104)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(87108502768908593928)
,p_plug_name=>'whmen_schedule'
,p_title=>'Grafik'
,p_region_name=>'WAREHOUSEMEN_STATIC_ID'
,p_parent_plug_id=>wwv_flow_imp.id(91131321274410614704)
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--accent3:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>20
,p_location=>null
,p_plug_required_role=>wwv_flow_imp.id(94328862025724775021)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(88152282777556756713)
,p_plug_name=>'t_warehousemen'
,p_title=>'Warehousemen'
,p_region_name=>'T_WAREHOUSEMEN_STATIC_ID'
,p_parent_plug_id=>wwv_flow_imp.id(87108502768908593928)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(86355272385676879037)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>6
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    null user_menu,',
'    user_id,',
'    user_name_surname,',
'    user_first_name,',
'    user_phone',
'from',
'    users',
'where user_id in(select ur_user_id from users_roles where ur_role_id = 3)'))
,p_plug_source_type=>'NATIVE_IG'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Warehousemen'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(91780465049520158501)
,p_name=>'USER_MENU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USER_MENU'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(91780465142312158502)
,p_name=>'USER_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USER_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(91780465202338158503)
,p_name=>'USER_NAME_SURNAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USER_NAME_SURNAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Nazwisko'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_max_length=>200
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(91780465368791158504)
,p_name=>'USER_FIRST_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USER_FIRST_NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Imi\0119')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>200
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(91780465455535158505)
,p_name=>'USER_PHONE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USER_PHONE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Numer telefonu'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>48
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(91131325841429614750)
,p_internal_uid=>91131325841429614750
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_no_data_found_message=>unistr('Brak magazynier\00F3w')
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(91780917981006466921)
,p_interactive_grid_id=>wwv_flow_imp.id(91131325841429614750)
,p_static_id=>'917809180'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(91780918194748466921)
,p_report_id=>wwv_flow_imp.id(91780917981006466921)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(91780918609912466923)
,p_view_id=>wwv_flow_imp.id(91780918194748466921)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(91780465049520158501)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(91780919588158466926)
,p_view_id=>wwv_flow_imp.id(91780918194748466921)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(91780465142312158502)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>87
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(91780920479571466929)
,p_view_id=>wwv_flow_imp.id(91780918194748466921)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(91780465202338158503)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>196
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(91780921327319466932)
,p_view_id=>wwv_flow_imp.id(91780918194748466921)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(91780465368791158504)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>198
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(91780922213593466936)
,p_view_id=>wwv_flow_imp.id(91780918194748466921)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(91780465455535158505)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>211.59997701644897
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(91780465659882158507)
,p_plug_name=>'c_whman_schedule'
,p_region_name=>'C_WHMAN_SCHEDULE_STATIC_ID'
,p_parent_plug_id=>wwv_flow_imp.id(87108502768908593928)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    wsw_id,',
'    wsw_whman_id,',
'    ''Zmiana: '' || wsw_shift_no shift_display,',
'    wsw_start as shift_start,',
'    wsw_end as shift_end,',
'    case wsw_shift_no',
'        when 1 then ''apex-cal-silver''',
'        when 2 then ''apex-cal-gray''',
'    end as css_class',
'from wh_schedule_whmen',
'where wsw_whman_id = :P1_WHMAN_ID_MD'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CSS_CALENDAR'
,p_ajax_items_to_submit=>'P1_WHMAN_ID_MD'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function (pOptions) {   ',
'    pOptions.slotMinTime = "06:00:00";',
'    pOptions.slotMaxTime = "22:00:00";',
'    pOptions.initialDate = new Date();',
'    pOptions.allDaySlot = false;',
'    pOptions.slotDuration = "01:00:00";',
'    pOptions.windowResize = null;',
'',
'    return pOptions;',
'}'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'calendar_views_and_navigation', 'month:week:navigation',
  'create_link', 'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:8:P8_ACTION_TYPE,P8_EVENT_TYPE,P8_CALENDAR_DATE,P8_WSW_WHMAN_ID:add,shift,&APEX$NEW_START_DATE.,&P1_WHMAN_ID_MD.',
  'css_class', 'CSS_CLASS',
  'display_column', 'SHIFT_DISPLAY',
  'end_date_column', 'SHIFT_END',
  'event_sorting', 'AUTOMATIC',
  'first_hour', '12',
  'maximum_events_day', '10',
  'multiple_line_event', 'Y',
  'show_time', 'Y',
  'show_tooltip', 'Y',
  'show_weekend', 'Y',
  'start_date_column', 'SHIFT_START',
  'time_format', '00',
  'view_edit_link', 'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:8:P8_ACTION_TYPE,P8_EVENT_TYPE,P8_EVENT_ID:edit,shift,&WSW_ID.')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(91131322365416614715)
,p_plug_name=>'c_work_schedule'
,p_region_name=>'C_WORK_SCHEDULE_STATIC_ID'
,p_parent_plug_id=>wwv_flow_imp.id(91131321274410614704)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--accent9:t-Region--noUI:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
unistr('    case oper_type when ''D'' then ''Dostawa'' when ''P'' then ''Kompletacja'' when ''R'' then ''Wydanie'' when ''L'' then ''Za\0142adunek'' end'),
'        ||'' ID: ''',
'        || oper_id || '', ID magazyniera: '' || NVL(TO_CHAR(oper_emp_id), ''!BRAK!'')',
'    as id,',
'    oper_id event_id,',
'    ''operation'' event_type,',
'    oper_planned_date_time as data_start,',
'    oper_planned_date_time + (oper_wh_optimum_time/1440) as data_koniec,',
'    case nvl(oper_emp_id,0) ',
'        when 0 then ''apex-cal-red''',
'        when 3 then ''apex-cal-orange''',
'        else ''apex-cal-darkblue''',
'    end as css_class',
'from',
'    operations',
'    where oper_status != ''C''',
'union all',
'select',
'    ''ID magazyniera: '' || wsw_whman_id as id,',
'    wsw_id event_id,',
'    ''shift'' event_type,',
'    wsw_start as data_start,',
'    wsw_end as data_koniec,',
'    case wsw_whman_id',
'       when 3 then ''apex-cal-orange''',
'       else ''apex-cal-darkblue''',
'    end as css_class',
'from',
'    wh_schedule_whmen;'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CSS_CALENDAR'
,p_plug_required_role=>wwv_flow_imp.id(94328862025724775021)
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function (pOptions) {   ',
'    pOptions.slotMinTime = "06:00:00";',
'    pOptions.slotMaxTime = "22:00:00";',
'    pOptions.initialDate = new Date();',
'    pOptions.allDaySlot = false;',
'    pOptions.slotDuration = "00:15:00";',
'',
'    return pOptions;',
'}'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'calendar_export', 'CSV',
  'calendar_views_and_navigation', 'month:week:day:navigation',
  'create_link', 'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:8:P8_ACTION_TYPE,P8_CALENDAR_DATE,P8_WSW_WHMAN_ID:add,&APEX$NEW_START_DATE.,&P1_WHMAN_ID_MD.',
  'css_class', 'CSS_CLASS',
  'display_column', 'ID',
  'end_date_column', 'DATA_KONIEC',
  'event_sorting', 'AUTOMATIC',
  'first_hour', '6',
  'maximum_events_day', '20',
  'multiple_line_event', 'Y',
  'show_time', 'Y',
  'show_tooltip', 'Y',
  'show_weekend', 'Y',
  'start_date_column', 'DATA_START',
  'time_format', '00',
  'view_edit_link', 'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:8:P8_ACTION_TYPE,P8_EVENT_TYPE,P8_EVENT_ID:edit,&EVENT_TYPE.,&EVENT_ID.')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(91131323269353614724)
,p_plug_name=>'users_roles-admin'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>115
,p_location=>null
,p_plug_required_role=>wwv_flow_imp.id(86355472489436879191)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(87108502674501593927)
,p_plug_name=>'roles'
,p_title=>'Role w systemie'
,p_region_name=>'ROLES_STATIC_ID'
,p_parent_plug_id=>wwv_flow_imp.id(91131323269353614724)
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--accent15:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>90
,p_location=>null
,p_required_patch=>wwv_flow_imp.id(86354378099415878996)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(87935281576979031542)
,p_name=>'t_roles'
,p_title=>'Roles'
,p_region_name=>'T_ROLES_STATIC_ID'
,p_parent_plug_id=>wwv_flow_imp.id(87108502674501593927)
,p_template=>wwv_flow_imp.id(86355282131832879041)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    ''<i class="fa fa-edit"></i>'' rol_menu,',
'    ROL_ID,',
'    ROL_NAME,',
'    case when ROL_F_ACTIVE = ''Y'' then ''Tak'' else ''Nie'' end ROL_F_ACTIVE',
'from',
'    ROLES'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(86355320577334879058)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>unistr('Brak r\00F3l')
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Pobierz dane'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(88532634772664357417)
,p_query_column_id=>1
,p_column_alias=>'ROL_MENU'
,p_column_display_sequence=>10
,p_column_link=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:4:P4_ROL_ID,P4_ACTION_TYPE:#ROL_ID#,edit'
,p_column_linktext=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_column_alignment=>'CENTER'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_report_column_width=>10
,p_derived_column=>'N'
,p_include_in_export=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(88152281900792756705)
,p_query_column_id=>2
,p_column_alias=>'ROL_ID'
,p_column_display_sequence=>20
,p_column_heading=>'ID'
,p_column_alignment=>'CENTER'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_report_column_width=>30
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(88152282041572756706)
,p_query_column_id=>3
,p_column_alias=>'ROL_NAME'
,p_column_display_sequence=>30
,p_column_heading=>'Nazwa'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(88532635960259357429)
,p_query_column_id=>4
,p_column_alias=>'ROL_F_ACTIVE'
,p_column_display_sequence=>40
,p_column_heading=>'Aktywna'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_report_column_width=>20
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(87108502889502593929)
,p_plug_name=>'users'
,p_title=>unistr('U\017Cytkownicy i ich role')
,p_region_name=>'USERS_STATIC_ID'
,p_parent_plug_id=>wwv_flow_imp.id(91131323269353614724)
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--accent2:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>80
,p_location=>null
,p_required_patch=>wwv_flow_imp.id(86354378099415878996)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(87258147574604915522)
,p_plug_name=>'t_users'
,p_title=>'Users'
,p_region_name=>'T_USERS_STATIC_ID'
,p_parent_plug_id=>wwv_flow_imp.id(87108502889502593929)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(86355272385676879037)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    ''<i class="fa fa-edit"></i>'' user_menu,',
'    user_id,',
'    user_login,',
'    user_id_apex,',
'    user_name_surname,',
'    user_first_name,',
'    user_tax_id,',
'    user_phone,',
'    case when user_type = ''C'' then ''Klient'' else ''Pracownik'' end user_type',
'from',
'    users'))
,p_plug_source_type=>'NATIVE_IG'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Users'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(88152286383889756749)
,p_name=>'USER_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USER_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_item_width=>10
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(88152286433650756750)
,p_name=>'USER_LOGIN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USER_LOGIN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Login'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_max_length=>200
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(88532633281984357402)
,p_name=>'USER_NAME_SURNAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USER_NAME_SURNAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Nazwa/Nazwisko'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_max_length=>200
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(88532633317361357403)
,p_name=>'USER_FIRST_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USER_FIRST_NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Imi\0119')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>200
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(88532633434294357404)
,p_name=>'USER_TAX_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USER_TAX_ID'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'NIP/PESEL'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_max_length=>48
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(88532633526281357405)
,p_name=>'USER_PHONE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USER_PHONE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Numer telefonu'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>48
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(88532633602103357406)
,p_name=>'USER_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USER_TYPE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Typ'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>9
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(88532636008544357430)
,p_name=>'USER_MENU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USER_MENU'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:3:P3_ACTION_TYPE,P3_USER_ID:edit,&USER_ID.#USER_ID##USER_ID#'
,p_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(94844812105501385429)
,p_name=>'USER_ID_APEX'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USER_ID_APEX'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('APEX ID u\017Cytkownika')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>200
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(88152286165180756747)
,p_internal_uid=>88152286165180756747
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>false
,p_define_chart_view=>false
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(88532804202090056168)
,p_interactive_grid_id=>wwv_flow_imp.id(88152286165180756747)
,p_static_id=>'885328043'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(88532804423517056169)
,p_report_id=>wwv_flow_imp.id(88532804202090056168)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(88532805854464056174)
,p_view_id=>wwv_flow_imp.id(88532804423517056169)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(88152286383889756749)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>20
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(88532806733957056177)
,p_view_id=>wwv_flow_imp.id(88532804423517056169)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(88152286433650756750)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(88532808748666056183)
,p_view_id=>wwv_flow_imp.id(88532804423517056169)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(88532633281984357402)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(88532809611589056186)
,p_view_id=>wwv_flow_imp.id(88532804423517056169)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(88532633317361357403)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(88532810570148056189)
,p_view_id=>wwv_flow_imp.id(88532804423517056169)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(88532633434294357404)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(88532811437196056192)
,p_view_id=>wwv_flow_imp.id(88532804423517056169)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(88532633526281357405)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(88532812387258056195)
,p_view_id=>wwv_flow_imp.id(88532804423517056169)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(88532633602103357406)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(88624004635070862885)
,p_view_id=>wwv_flow_imp.id(88532804423517056169)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(88532636008544357430)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>20
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(95010484562620757854)
,p_view_id=>wwv_flow_imp.id(88532804423517056169)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(94844812105501385429)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(179072052585261112012)
,p_interactive_grid_id=>wwv_flow_imp.id(88152286165180756747)
,p_name=>'Pracownicy'
,p_static_id=>'905446390'
,p_type=>'ALTERNATIVE'
,p_default_view=>'GRID'
,p_authorization_scheme=>'!'||wwv_flow_imp.id(86355472489436879191)
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(179072052806688112013)
,p_report_id=>wwv_flow_imp.id(179072052585261112012)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(179072054237635112018)
,p_view_id=>wwv_flow_imp.id(179072052806688112013)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(88152286383889756749)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>20
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(179072055117128112021)
,p_view_id=>wwv_flow_imp.id(179072052806688112013)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(88152286433650756750)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(179072057131837112027)
,p_view_id=>wwv_flow_imp.id(179072052806688112013)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(88532633281984357402)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(179072057994760112030)
,p_view_id=>wwv_flow_imp.id(179072052806688112013)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(88532633317361357403)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(179072058953319112033)
,p_view_id=>wwv_flow_imp.id(179072052806688112013)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(88532633434294357404)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(179072059820367112036)
,p_view_id=>wwv_flow_imp.id(179072052806688112013)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(88532633526281357405)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(179072060770429112039)
,p_view_id=>wwv_flow_imp.id(179072052806688112013)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(88532633602103357406)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(179163253018241918729)
,p_view_id=>wwv_flow_imp.id(179072052806688112013)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(88532636008544357430)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>20
);
wwv_flow_imp_page.create_ig_report_filter(
 p_id=>wwv_flow_imp.id(90539322212179066688)
,p_report_id=>wwv_flow_imp.id(179072052585261112012)
,p_type=>'COLUMN'
,p_column_id=>wwv_flow_imp.id(88532633602103357406)
,p_operator=>'EQ'
,p_is_case_sensitive=>false
,p_expression=>'Pracownik'
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(269616205245770228654)
,p_interactive_grid_id=>wwv_flow_imp.id(88152286165180756747)
,p_name=>'Klienci'
,p_static_id=>'905441580'
,p_type=>'ALTERNATIVE'
,p_default_view=>'GRID'
,p_authorization_scheme=>'!'||wwv_flow_imp.id(86355472489436879191)
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(269616205467197228655)
,p_report_id=>wwv_flow_imp.id(269616205245770228654)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(269616206898144228660)
,p_view_id=>wwv_flow_imp.id(269616205467197228655)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(88152286383889756749)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>20
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(269616207777637228663)
,p_view_id=>wwv_flow_imp.id(269616205467197228655)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(88152286433650756750)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(269616209792346228669)
,p_view_id=>wwv_flow_imp.id(269616205467197228655)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(88532633281984357402)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(269616210655269228672)
,p_view_id=>wwv_flow_imp.id(269616205467197228655)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(88532633317361357403)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(269616211613828228675)
,p_view_id=>wwv_flow_imp.id(269616205467197228655)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(88532633434294357404)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(269616212480876228678)
,p_view_id=>wwv_flow_imp.id(269616205467197228655)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(88532633526281357405)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(269616213430938228681)
,p_view_id=>wwv_flow_imp.id(269616205467197228655)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(88532633602103357406)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(269707405678751035371)
,p_view_id=>wwv_flow_imp.id(269616205467197228655)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(88532636008544357430)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>20
);
wwv_flow_imp_page.create_ig_report_filter(
 p_id=>wwv_flow_imp.id(181083474872688183330)
,p_report_id=>wwv_flow_imp.id(269616205245770228654)
,p_type=>'COLUMN'
,p_column_id=>wwv_flow_imp.id(88532633602103357406)
,p_operator=>'EQ'
,p_is_case_sensitive=>false
,p_expression=>'Klient'
,p_is_enabled=>true
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(88152283924166756725)
,p_name=>'t_users_roles'
,p_title=>unistr('Role u\017Cytkownika')
,p_region_name=>'T_USERS_ROLES_STATIC_ID'
,p_parent_plug_id=>wwv_flow_imp.id(87108502889502593929)
,p_template=>wwv_flow_imp.id(86355282131832879041)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--accent3:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:u-colors:t-MediaList--stack'
,p_new_grid_row=>false
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select UR_ID,',
'       UR_ROLE_ID,',
'       (select rol_name from roles where rol_id = UR_ROLE_ID) role_name,',
'       UR_USER_ID,',
'       UR_START_DATE,',
'       UR_END_DATE,',
'       (select rol_name from roles where rol_id = UR_ROLE_ID) list_title,',
'       ''OD ''',
'       || to_char(UR_START_DATE, ''DD-MM-YYYY'')',
'       || '' DO ''',
'       || case when UR_END_DATE is not null then to_char(UR_END_DATE, ''DD-MM-YYYY'') else ''N/A'' end list_text,',
'       ''fa fa-key'' icon_class,',
'       null link',
'  from USERS_ROLES',
' where ur_end_date is null and ur_user_id = :P1_USER_ID_MD'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P1_USER_ID_MD'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(86355317322098879057)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>unistr('Wybierz u\017Cytkownika / U\017Cytkownik nie ma przypisanych r\00F3l')
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Pobierz dane'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(88152284350565756729)
,p_query_column_id=>1
,p_column_alias=>'UR_ID'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(88152284463074756730)
,p_query_column_id=>2
,p_column_alias=>'UR_ROLE_ID'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(88532634101215357411)
,p_query_column_id=>3
,p_column_alias=>'ROLE_NAME'
,p_column_display_sequence=>50
,p_column_heading=>'Rola'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(88152284524369756731)
,p_query_column_id=>4
,p_column_alias=>'UR_USER_ID'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(88152284664462756732)
,p_query_column_id=>5
,p_column_alias=>'UR_START_DATE'
,p_column_display_sequence=>60
,p_column_heading=>'Data od'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>2
,p_default_sort_dir=>'desc'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(88152284748891756733)
,p_query_column_id=>6
,p_column_alias=>'UR_END_DATE'
,p_column_display_sequence=>70
,p_column_heading=>'Data do'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(88532636245203357432)
,p_query_column_id=>7
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>80
,p_column_heading=>'List Title'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(88532636409215357434)
,p_query_column_id=>8
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>90
,p_column_heading=>'List Text'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(88532636512581357435)
,p_query_column_id=>9
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>100
,p_column_heading=>'Icon Class'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(88532636679518357436)
,p_query_column_id=>10
,p_column_alias=>'LINK'
,p_column_display_sequence=>110
,p_column_heading=>'Link'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(95899989382642296211)
,p_plug_name=>'hints-whmngr_logist'
,p_title=>'Sugestie'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--accent8:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>75
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_plug_required_role=>'!'||wwv_flow_imp.id(86355472489436879191)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(95899989547095296213)
,p_name=>'t_hints'
,p_title=>'Sugestie'
,p_region_name=>'T_HINTS_STATIC_ID'
,p_parent_plug_id=>wwv_flow_imp.id(95899989382642296211)
,p_template=>wwv_flow_imp.id(86355282131832879041)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Timeline--compact'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    ''<span aria-hidden="true" class="fa fa-head-ai-sparkle fa-lg u-opacity-100"></span>'' user_avatar,',
'    HINT_ID,',
'    case',
'        when HINT_CLIENT_ID is not null and HINT_OPERATION_ID is not null then ''ID operacji: '' || HINT_OPERATION_ID || '', ID klienta: '' || HINT_CLIENT_ID',
'        when HINT_OPERATION_ID is not null then ''ID operacji: '' || HINT_OPERATION_ID',
'        when HINT_PRODUCT_ID is not null then ''ID produktu: '' || HINT_PRODUCT_ID',
'    end user_name,',
'    to_char(HINT_START_DATE_TIME, ''DD-MON-YYYY HH24:MM'') event_date,',
'    HINT_ROLE_ID,',
'    HINT_TITLE event_title,',
'    HINT_CONTENT event_desc,',
'    ''javascript:apex.event.trigger(document, "CHANGE_HINT_STATUS_EVENT", '' || HINT_ID || '')'' event_link,',
'    case HINT_STATUS',
'        when ''N'' then ''fa fa-exclamation-triangle''',
'        when ''P'' then ''fa fa-clock-o''',
'        when ''D'' then ''fa fa-times''',
'    end event_icon,',
'    case HINT_STATUS ',
'        when ''N'' then ''Nowa''',
'        when ''P'' then ''W trakcie''',
unistr('        when ''D'' then ''Zako\0144czona'''),
'    end event_type,',
'    case HINT_STATUS ',
'        when ''N'' then ''is-removed''',
'        when ''P'' then ''is-updated''',
'        when ''D'' then ''is-new''',
'      end event_status,',
'    ''<p class="u-underline"></p>'' event_modifiers',
'from HINTS',
'where hint_role_id = :P1_USER_ID'))
,p_query_order_by_type=>'ITEM'
,p_query_order_by=>'{"orderBys":[{"key":"HINT_STATUS","expr":"event_status desc"},{"key":"HINT_START_DATE_TIME","expr":"event_date desc"},{"key":"EVENT_DATE","expr":"event_date asc"}],"itemName":"P1_HINTS_ORDER_BY"}'
,p_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span aria-hidden="true" class="fa fa-lightbulb-o">',
unistr('    <span>Kliknij w sugesti\0119, aby zmieni\0107 jej status</span>'),
'</span>'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P1_USER_ID'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(95958227734447526080)
,p_query_num_rows=>5
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'1:2:3'
,p_query_no_data_found=>'Brak podpowiedzi systemowych'
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.set_region_column_width(
 p_id=>wwv_flow_imp.id(95899989547095296213)
,p_plug_column_width=>'#event_modifiers#'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(95899989909745296217)
,p_query_column_id=>1
,p_column_alias=>'USER_AVATAR'
,p_column_display_sequence=>40
,p_column_heading=>'User Avatar'
,p_heading_alignment=>'LEFT'
,p_display_as=>'RICH_TEXT'
,p_attribute_01=>'HTML'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(95899989658463296214)
,p_query_column_id=>2
,p_column_alias=>'HINT_ID'
,p_column_display_sequence=>10
,p_column_heading=>'Hint Id'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_display_as=>'RICH_TEXT'
,p_attribute_01=>'HTML'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(95899990313800296221)
,p_query_column_id=>3
,p_column_alias=>'USER_NAME'
,p_column_display_sequence=>80
,p_column_heading=>'User Name'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(95899990495739296222)
,p_query_column_id=>4
,p_column_alias=>'EVENT_DATE'
,p_column_display_sequence=>90
,p_column_heading=>'Event Date'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(95899989776066296215)
,p_query_column_id=>5
,p_column_alias=>'HINT_ROLE_ID'
,p_column_display_sequence=>20
,p_column_heading=>'Hint Role Id'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(95899989833737296216)
,p_query_column_id=>6
,p_column_alias=>'EVENT_TITLE'
,p_column_display_sequence=>30
,p_column_heading=>'Event Title'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(95899990278252296220)
,p_query_column_id=>7
,p_column_alias=>'EVENT_DESC'
,p_column_display_sequence=>70
,p_column_heading=>'Event Desc'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(95899990612222296224)
,p_query_column_id=>8
,p_column_alias=>'EVENT_LINK'
,p_column_display_sequence=>110
,p_column_heading=>'Event Link'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(95899990075714296218)
,p_query_column_id=>9
,p_column_alias=>'EVENT_ICON'
,p_column_display_sequence=>50
,p_column_heading=>'Event Icon'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(95899990138059296219)
,p_query_column_id=>10
,p_column_alias=>'EVENT_TYPE'
,p_column_display_sequence=>60
,p_column_heading=>'Event Type'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(95899990507618296223)
,p_query_column_id=>11
,p_column_alias=>'EVENT_STATUS'
,p_column_display_sequence=>100
,p_column_heading=>'Event Status'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(95899990730577296225)
,p_query_column_id=>12
,p_column_alias=>'EVENT_MODIFIERS'
,p_column_display_sequence=>120
,p_column_heading=>'Event Modifiers'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(86385187011855791309)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(86385190204543791341)
,p_button_name=>'b_new_operation'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--hoverIconPush:t-Button--gapRight'
,p_button_template_id=>wwv_flow_imp.id(86355355966755879075)
,p_button_image_alt=>'Operacja'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:2:P2_ACTION_TYPE:add'
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_imp.id(94328010432251071261)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(87258149682316915543)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(87108502889502593929)
,p_button_name=>'b_new_user'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--hoverIconPush'
,p_button_template_id=>wwv_flow_imp.id(86355355966755879075)
,p_button_image_alt=>unistr('U\017Cytkownik')
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:3:P3_ACTION_TYPE:add'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(88152282391506756709)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(87108502674501593927)
,p_button_name=>'b_new_role'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--hoverIconPush'
,p_button_template_id=>wwv_flow_imp.id(86355355966755879075)
,p_button_image_alt=>'Rola'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:4:P4_ACTION_TYPE:add'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(88152282417110756710)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(87108501396258593914)
,p_button_name=>'b_new_size'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--hoverIconPush'
,p_button_template_id=>wwv_flow_imp.id(86355355966755879075)
,p_button_image_alt=>'Rozmiar'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:5:P5_ACTION_TYPE:add'
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_imp.id(94328862025724775021)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(88152282593275756711)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(90068075015082500632)
,p_button_name=>'b_new_product'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--hoverIconPush'
,p_button_template_id=>wwv_flow_imp.id(86355355966755879075)
,p_button_image_alt=>'Produkt'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:7:P7_ACTION_TYPE:add'
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_imp.id(94328862025724775021)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(88152282663200756712)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(87108500022084593901)
,p_button_name=>'b_new_location'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--hoverIconPush'
,p_button_template_id=>wwv_flow_imp.id(86355355966755879075)
,p_button_image_alt=>'Lokalizacja'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:6:P6_ACTION_TYPE:add'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(96403971674794306911)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(86385190204543791341)
,p_button_name=>'b_new_alert'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--hoverIconPush'
,p_button_template_id=>wwv_flow_imp.id(86355355966755879075)
,p_button_image_alt=>'Informacja o zmianie godziny operacji'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:9:P9_ACTION_TYPE,P9_USER_ID:add,&P1_USER_ID.'
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_imp.id(94328010432251071261)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(100190212340151284301)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(91131321274410614704)
,p_button_name=>'b_optimize_schedule'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--hoverIconPush'
,p_button_template_id=>wwv_flow_imp.id(86355355966755879075)
,p_button_image_alt=>'Systemowa optymalizacja'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-target-arrow'
,p_security_scheme=>wwv_flow_imp.id(94328862025724775021)
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(100190214355587284321)
,p_branch_name=>'Go To Page 10000'
,p_branch_action=>'f?p=&APP_ID.:10000:&SESSION.::&DEBUG.:10000::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_HEADER'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_security_scheme=>wwv_flow_imp.id(86355472489436879191)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(88152284884181756734)
,p_name=>'P1_USER_ID_MD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(87108502889502593929)
,p_item_default=>'0'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(90482328194535875816)
,p_name=>'P1_PROD_ID_MD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(90068075015082500632)
,p_item_default=>'0'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91780465753205158508)
,p_name=>'P1_WHMAN_ID_MD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(87108502768908593928)
,p_item_default=>'select user_id from users where user_id in(select ur_user_id from users_roles where ur_role_id = 3) and rownum=1'
,p_item_default_type=>'SQL_QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92745362502496017307)
,p_name=>'P1_OPER_ID_MD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(86385190204543791341)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(94428487690593707005)
,p_name=>'P1_USER_NAME'
,p_item_sequence=>5
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(94428487741131707006)
,p_name=>'P1_USER_ID'
,p_item_sequence=>35
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(94428487888340707007)
,p_name=>'P1_APEX_USER_ID'
,p_item_sequence=>25
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(94844809511889385403)
,p_name=>'P1_USER_ROLE'
,p_item_sequence=>15
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(95899989468888296212)
,p_name=>'P1_HINT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(95899989382642296211)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(95899990887367296226)
,p_name=>'P1_HINTS_ORDER_BY'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(95899989547095296213)
,p_item_display_point=>'ORDER_BY_ITEM'
,p_item_default=>'HINT_STATUS'
,p_prompt=>'Sortuj'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Status;HINT_STATUS,Najnowsze;HINT_START_DATE_TIME,Najstarsze;EVENT_DATE'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(86355353371314879074)
,p_item_css_classes=>'background-color: #fefbd8;'
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(100190212667880284304)
,p_name=>'P1_SCHEDULE_OPTIM_RESULT'
,p_item_sequence=>5
,p_item_plug_id=>wwv_flow_imp.id(91131321274410614704)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(100190213216970284310)
,p_name=>'P1_DATE_TOMORROW'
,p_item_sequence=>45
,p_source=>'select to_char(sysdate+1, ''DD-Mon-YYYY'') from dual'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(100190213335326284311)
,p_name=>'P1_SCH_OPT_OPER_DATE_END'
,p_item_sequence=>55
,p_source=>'select to_char(sysdate+5, ''DD-Mon-YYYY'') from dual'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(100190213463598284312)
,p_name=>'P1_SCH_OPT_SHIFT_DATE_END'
,p_item_sequence=>65
,p_source=>'select to_char(sysdate+3, ''DD-Mon-YYYY'') from dual'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(95899991703296296235)
,p_name=>'SET_SESSION_USER_DATA'
,p_event_sequence=>15
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(95899991855725296236)
,p_event_id=>wwv_flow_imp.id(95899991703296296235)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'SET_USER_NAME'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    apex_util.set_session_state(''P1_USER_NAME'', APEX_CUSTOM_AUTH.GET_USER);',
'end;'))
,p_attribute_02=>'P1_USER_NAME'
,p_attribute_03=>'P1_USER_NAME'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(88152284923271756735)
,p_name=>'P1_USER_ID_MD_DA'
,p_event_sequence=>25
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(87258147574604915522)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88152285036501756736)
,p_event_id=>wwv_flow_imp.id(88152284923271756735)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P1_USER_ID_MD'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>wwv_flow_string.join(wwv_flow_t_varchar2(
'this.data.selectedRecords.length != 1 ? '''': this.data.model.getValue( ',
'    this.data.selectedRecords[0], "USER_ID" )'))
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88532633929761357409)
,p_event_id=>wwv_flow_imp.id(88152284923271756735)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(88152283924166756725)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89498805762198142424)
,p_event_id=>wwv_flow_imp.id(88152284923271756735)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(88152283924166756725)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(88866110382843054022)
,p_name=>'SET_MESSAGES_SHOW_TIME'
,p_event_sequence=>35
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88866110493519054023)
,p_event_id=>wwv_flow_imp.id(88866110382843054022)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function autoCloseMessages(duration = 20000) {',
'    apex.message.clearErrors();',
'    apex.message.hidePageSuccess();',
'    ',
'    setTimeout(autoCloseMessages, duration);',
'};',
'',
'autoCloseMessages();'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(90482328221009875817)
,p_name=>'P1_PROD_ID_MD_DA'
,p_event_sequence=>45
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(86385190576910791344)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90482328328579875818)
,p_event_id=>wwv_flow_imp.id(90482328221009875817)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P1_PROD_ID_MD'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'this.data.selectedRecords.length != 1 ? '''': this.data.model.getValue( this.data.selectedRecords[0], "PROD_ID")'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90482328443528875819)
,p_event_id=>wwv_flow_imp.id(90482328221009875817)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(90482327624246875811)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(95899991441760296232)
,p_event_id=>wwv_flow_imp.id(90482328221009875817)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(95899991061872296228)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(91780465924664158510)
,p_name=>'P1_WHMAN_ID_MD_DA'
,p_event_sequence=>55
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(88152282777556756713)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(91780466041616158511)
,p_event_id=>wwv_flow_imp.id(91780465924664158510)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P1_WHMAN_ID_MD'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>wwv_flow_string.join(wwv_flow_t_varchar2(
'this.data.selectedRecords.length != 1 ? '''': this.data.model.getValue( ',
'    this.data.selectedRecords[0], "USER_ID")'))
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(91780466168126158512)
,p_event_id=>wwv_flow_imp.id(91780465924664158510)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(91780465659882158507)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(91131321577078614707)
,p_name=>'CHANGE_HINT_STATUS_DA'
,p_event_sequence=>65
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'CHANGE_HINT_STATUS_EVENT'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(91131321692989614708)
,p_event_id=>wwv_flow_imp.id(91131321577078614707)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="text-align: center;">',
unistr('    <span style="font-weight: bold">Czy potwierdzasz zmian\0119 statusu?</span>'),
'    <br>&bull; Nowa -> w trakcie',
unistr('    <br>&bull; W trakcie -> zako\0144czona'),
'</div>'))
,p_attribute_06=>'Tak'
,p_attribute_07=>'Nie'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(95899988723926296205)
,p_event_id=>wwv_flow_imp.id(91131321577078614707)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$s("P1_HINT_ID", this.data);'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(95899989045036296208)
,p_event_id=>wwv_flow_imp.id(91131321577078614707)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    PKG_HINTS.change_hint_status(:P1_HINT_ID);',
'end;'))
,p_attribute_02=>'P1_HINT_ID'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(95899992472027296242)
,p_event_id=>wwv_flow_imp.id(91131321577078614707)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>unistr('apex.message.showPageSuccess(''Status sugestii zosta\0142 zmieniony'');')
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(95899989182898296209)
,p_event_id=>wwv_flow_imp.id(91131321577078614707)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(95899989547095296213)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92745362082326017302)
,p_name=>'DOWNLOAD_OPER_DET_DA'
,p_event_sequence=>75
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'DOWNLOAD_OPER_DET_EVENT'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92745362157592017303)
,p_event_id=>wwv_flow_imp.id(92745362082326017302)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_PRINT_REPORT'
,p_attribute_01=>wwv_flow_imp.id(92519667736337334972)
,p_attribute_02=>'szczegoly_operacji'
,p_attribute_03=>'ATTACHMENT'
,p_attribute_04=>'P1_OPER_ID_MD'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92745362325679017305)
,p_name=>'P1_OPER_ID_MD_DA'
,p_event_sequence=>85
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(86385186398671791302)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92745362474180017306)
,p_event_id=>wwv_flow_imp.id(92745362325679017305)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P1_OPER_ID_MD'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'this.data.selectedRecords.length != 1 ? '''': this.data.model.getValue( this.data.selectedRecords[0], "OPER_ID")'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(94844812782786385435)
,p_name=>'SET_ON_PAGE_LOAD_WHMAN_ID_MD'
,p_event_sequence=>95
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(94844812801571385436)
,p_event_id=>wwv_flow_imp.id(94844812782786385435)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P1_WHMAN_ID_MD'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function() {',
'    var region = apex.region("T_WAREHOUSEMEN_STATIC_ID");  // Get the region by static ID',
'    var grid = region.widget().interactiveGrid("getViews").grid;  // Access the grid widget',
'',
'    // Get all rows from the grid',
'    var rows = grid.model.getRows();  // Get rows (this is the correct method)',
'',
'    // Check if there are any rows',
'    if (rows.length > 0) {',
'        var firstRow = rows[0];  // Access the first row',
'        var userId = firstRow["USER_ID"];  // Get the USER_ID from the first row',
'        console.log(userId);  // Log the USER_ID value',
'        return userId;  // Return the USER_ID value',
'    } else {',
'        console.log("No records available");',
'        return null;  // Return null if no records',
'    }',
'}'))
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(95844161613494760703)
,p_name=>'SET_HINTS_AUTO_REFRESH'
,p_event_sequence=>105
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(95844161714291760704)
,p_event_id=>wwv_flow_imp.id(95844161613494760703)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function setRefresh() {',
'  apex.region("T_HINTS_STATIC_ID").refresh();',
'',
'  // Refresh every 5 minutes',
'  setTimeout(setRefresh, 300000);',
'}',
'',
'setRefresh();'))
,p_security_scheme=>'!'||wwv_flow_imp.id(86355472489436879191)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(96403970838209306903)
,p_name=>'UPDATE_USER_DATA_AND_REF_REG_DA'
,p_event_sequence=>115
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_USER_NAME'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(96403971020087306905)
,p_event_id=>wwv_flow_imp.id(96403970838209306903)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'SET_USER_ID'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_user_id number;',
'begin',
'    select user_id into v_user_id from users where upper(user_login) = upper(:P1_USER_NAME);',
'    apex_util.set_session_state(''P1_USER_ID'', v_user_id);',
'end;'))
,p_attribute_02=>'P1_USER_NAME'
,p_attribute_03=>'P1_USER_ID'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(95899991929425296237)
,p_event_id=>wwv_flow_imp.id(96403970838209306903)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_name=>'SET_APEX_USER_ID'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_apex_user_id number;',
'begin',
'    select user_id into v_apex_user_id from users where user_login = upper(:P1_USER_NAME);',
'    apex_util.set_session_state(''P1_APEX_USER_ID'', v_apex_user_id);',
'end;'))
,p_attribute_02=>'P1_USER_NAME'
,p_attribute_03=>'P1_APEX_USER_ID'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(95899992153273296239)
,p_event_id=>wwv_flow_imp.id(96403970838209306903)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'Y'
,p_name=>'SET_USER_ROLE'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_user_role varchar2(100 char);',
'begin',
'    select role_names into v_user_role from APEX_APPL_ACL_USERS where user_name = :P1_USER_NAME;',
'    apex_util.set_session_state(''P1_USER_ROLE'', v_user_role);',
'exception',
'    when no_data_found then apex_util.set_session_state(''P1_USER_ROLE'', ''BRAK'');    ',
'end;'))
,p_attribute_02=>'P1_USER_ROLE'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(96403971388140306908)
,p_event_id=>wwv_flow_imp.id(96403970838209306903)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P1_USER_ID'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(96403971419687306909)
,p_event_id=>wwv_flow_imp.id(96403970838209306903)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(95899989547095296213)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(99622971822456985101)
,p_event_id=>wwv_flow_imp.id(96403970838209306903)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(86385190576910791344)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(102220641362132164101)
,p_event_id=>wwv_flow_imp.id(96403970838209306903)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(90482327624246875811)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(102220641442008164102)
,p_event_id=>wwv_flow_imp.id(96403970838209306903)
,p_event_result=>'TRUE'
,p_action_sequence=>110
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(95899991061872296228)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(102220641549156164103)
,p_event_id=>wwv_flow_imp.id(96403970838209306903)
,p_event_result=>'TRUE'
,p_action_sequence=>120
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(87935281576979031542)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(102220641784224164105)
,p_event_id=>wwv_flow_imp.id(96403970838209306903)
,p_event_result=>'TRUE'
,p_action_sequence=>130
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(87108500119464593902)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(102220641893784164106)
,p_event_id=>wwv_flow_imp.id(96403970838209306903)
,p_event_result=>'TRUE'
,p_action_sequence=>140
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(87108501437626593915)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(102220641937302164107)
,p_event_id=>wwv_flow_imp.id(96403970838209306903)
,p_event_result=>'TRUE'
,p_action_sequence=>150
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(91131322365416614715)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(102220642023283164108)
,p_event_id=>wwv_flow_imp.id(96403970838209306903)
,p_event_result=>'TRUE'
,p_action_sequence=>160
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(86385186398671791302)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(102220642191852164109)
,p_event_id=>wwv_flow_imp.id(96403970838209306903)
,p_event_result=>'TRUE'
,p_action_sequence=>170
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(91780465659882158507)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(102220642253122164110)
,p_event_id=>wwv_flow_imp.id(96403970838209306903)
,p_event_result=>'TRUE'
,p_action_sequence=>180
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(88152282777556756713)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(100190212469877284302)
,p_name=>'OPTIMIZE_SCHEDULE_DA'
,p_event_sequence=>125
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(100190212340151284301)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(100190213132143284309)
,p_event_id=>wwv_flow_imp.id(100190212469877284302)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Zakres od <b>&P1_DATE_TOMORROW.</b> do:',
'<br><b>&P1_SCH_OPT_SHIFT_DATE_END.</b> (grafik prac.)',
'<br><b>&P1_SCH_OPT_OPER_DATE_END.</b> (planowane oper.)',
unistr('<br><br>Dzia\0142anie:'),
unistr('<br>1. System przypisze magazynier\00F3w do nieprzypisanych operacji.'),
unistr('<br>2. Je\017Celi b\0119dzie to mo\017Cliwe, podzieli zaplanowane wydania na dwie osobne operacje - kompletacj\0119 i za\0142adunek.')))
,p_attribute_02=>unistr('Potwierd\017A rozpocz\0119cie procesu optymalizacji operacji wyda\0144')
,p_attribute_03=>'warning'
,p_attribute_05=>'u-textCenter'
,p_attribute_06=>'Tak'
,p_attribute_07=>'Nie'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(100190212592867284303)
,p_event_id=>wwv_flow_imp.id(100190212469877284302)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P1_SCHEDULE_OPTIM_RESULT := PKG_SCHEDULE_OPTIM.optimize_schedule;'
,p_attribute_03=>'P1_SCHEDULE_OPTIM_RESULT'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(100190212744507284305)
,p_event_id=>wwv_flow_imp.id(100190212469877284302)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>'<div style="text-align: center;">&P1_SCHEDULE_OPTIM_RESULT.</div>'
,p_attribute_03=>'information'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(100190212891563284306)
,p_event_id=>wwv_flow_imp.id(100190212469877284302)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(95899989547095296213)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(100190213097547284308)
,p_event_id=>wwv_flow_imp.id(100190212469877284302)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(91131322365416614715)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(100190212942138284307)
,p_event_id=>wwv_flow_imp.id(100190212469877284302)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(86385186398671791302)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(103796529535050410703)
,p_name=>'SET_TOOLTIPS'
,p_event_sequence=>145
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(100190212340151284301)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'mousemove'
,p_required_patch=>wwv_flow_imp.id(86354378099415878996)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(103796529643365410704)
,p_event_id=>wwv_flow_imp.id(103796529535050410703)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(100190212340151284301)
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function toolTip_enable(event, element, message) {',
'    // Your tooltip logic here',
'    var tooltip = document.createElement("div");',
'    tooltip.className = "tooltip";',
'    tooltip.innerText = message;',
'    document.body.appendChild(tooltip);',
'',
'    // Positioning the tooltip near the button',
'    var rect = element.getBoundingClientRect();',
'    tooltip.style.position = ''absolute'';',
'    tooltip.style.left = rect.left + ''px'';',
'    tooltip.style.top = rect.top - 20 + ''px''; // Adjust as necessary',
'',
'    element.onmouseout = function() {',
'        document.body.removeChild(tooltip);',
'    };',
'}',
'',
'toolTip_enable(event, element, ''TEST'');'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(103959760865216486501)
,p_name=>'CHECK_ERROR_HANDLING'
,p_event_sequence=>155
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_required_patch=>wwv_flow_imp.id(86354378099415878996)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(103959760988600486502)
,p_event_id=>wwv_flow_imp.id(103959760865216486501)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
unistr('    RAISE_APPLICATION_ERROR(-20001, ''Testowy b\0142\0105d APEX'');'),
'END;'))
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp.component_end;
end;
/
