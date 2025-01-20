prompt --application/pages/page_00012
begin
--   Manifest
--     PAGE: 00012
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
 p_id=>12
,p_name=>'Operation-form'
,p_alias=>'OPERATION-FORM'
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Formularz produkt\00F3w')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(94844812030581385428)
,p_plug_name=>'interactive_form'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>140
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(181270978773737972016)
,p_plug_name=>'f_products'
,p_title=>'Produkty'
,p_region_name=>'F_PRODUCTS_STATIC_ID'
,p_parent_plug_id=>wwv_flow_imp.id(94844812030581385428)
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:js-headingLevel-5'
,p_plug_template=>wwv_flow_imp.id(86355272385676879037)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    p.prod_id,',
'    p.prod_name,',
'    case :P12_OPER_TYPE',
'        when ''D'' then 0',
'        when ''R'' then (',
'            select nvl(count(s.stock_id), 0)',
'            from stock s',
'            where s.stock_prod_id = p.prod_id',
'        ) + (',
'            select nvl(sum(dp.pos_amount), 0)',
'            from oper_positions dp',
'            join operations d ',
'              on dp.pos_oper_id = d.oper_id',
'            where dp.pos_prod_id = p.prod_id',
'              and d.oper_type = ''D''',
'              and d.oper_status = ''N''',
'              and (d.oper_planned_date_time + d.oper_wh_optimum_time / 1440) < :P12_OPER_DATE_TIME',
'        ) - (',
'            select nvl(sum(rp.pos_amount), 0)',
'            from oper_positions rp',
'            join operations r',
'              on rp.pos_oper_id = r.oper_id',
'            where rp.pos_prod_id = p.prod_id',
'              and r.oper_type in(''R'', ''P'')',
'              and r.oper_status in(''N'', ''RH'')',
'              and (r.oper_planned_date_time + r.oper_wh_optimum_time / 1440) < :P12_OPER_DATE_TIME            ',
'        )',
'    end as prod_quantity',
'from products p',
'left join stock s on p.prod_id = s.stock_prod_id',
'where p.prod_cl_id = :P12_OPER_CL_ID',
'group by p.prod_id, p.prod_name'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P12_OPER_TYPE,P12_OPER_CL_ID,P12_OPER_DATE_TIME'
,p_prn_content_disposition=>'ATTACHMENT'
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
,p_landmark_type=>'region'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(181994294030798774630)
,p_name=>'PROD_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROD_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
,p_enable_control_break=>false
,p_enable_hide=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(181994294082325774631)
,p_name=>'PROD_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROD_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nazwa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(181994294329326774633)
,p_name=>'PROD_QUANTITY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROD_QUANTITY'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Ilo\015B\0107<br>Edycja - kliknij dwukrotnie w kom\00F3rk\0119')
,p_label=>unistr('Ilo\015B\0107')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'min_value', '0',
  'number_alignment', 'left',
  'virtual_keyboard', 'numeric')).to_clob
,p_format_mask=>'999G999G999G999G999G999G990'
,p_item_width=>10
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_static_id=>'t_prod_quantity'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_default_type=>'FUNCTION_BODY'
,p_default_language=>'PLSQL'
,p_default_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_prod_on_stock_no int;',
'begin',
'    if :P12_OPER_TYPE = ''D'' then',
'        return 0;',
'    elsif :P12_OPER_TYPE = ''R'' then',
'        select sum(stock_id) into v_prod_on_stock_no from stock where stock_prod_id = :PROD_ID;',
'        return v_prod_on_stock_no;',
'    end if;',
'end;'))
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(181994294420932774634)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(181994294503298774635)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_multi_select', 'Y',
  'hide_control', 'N',
  'show_select_all', 'Y')).to_clob
,p_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(181994293870270774629)
,p_internal_uid=>181994293870270774629
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_no_data_found_message=>unistr('Brak produkt\00F3w dla wybranego klienta')
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>false
,p_define_chart_view=>false
,p_enable_download=>false
,p_download_formats=>null
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(182033314714992228732)
,p_interactive_grid_id=>wwv_flow_imp.id(181994293870270774629)
,p_static_id=>'871475240'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(182033314890065228732)
,p_report_id=>wwv_flow_imp.id(182033314714992228732)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(182033315378356228734)
,p_view_id=>wwv_flow_imp.id(182033314890065228732)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(181994294030798774630)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>87.32
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(182033316328524228737)
,p_view_id=>wwv_flow_imp.id(182033314890065228732)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(181994294082325774631)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>260.68
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(182033779038111238374)
,p_view_id=>wwv_flow_imp.id(182033314890065228732)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(181994294329326774633)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>235.00799999999998
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(182034851787516567680)
,p_view_id=>wwv_flow_imp.id(182033314890065228732)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(181994294420932774634)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(94886004524293180714)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_imp.id(94844812030581385428)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_image_alt=>'Anuluj'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(94886004964823180714)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(94844812030581385428)
,p_button_name=>'CREATE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Dodaj'
,p_button_position=>'CREATE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(181573839780384574952)
,p_name=>'P12_OPER_TYPE'
,p_item_sequence=>30
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(182821285086554212238)
,p_name=>'P12_PRODUCTS_LIST_JSON'
,p_data_type=>'CLOB'
,p_item_sequence=>80
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(182821285166775212239)
,p_name=>'P12_PRODUCTS_LIST'
,p_item_sequence=>90
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(182821293183417212248)
,p_name=>'P12_OPER_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>20
,p_item_source_plug_id=>wwv_flow_imp.id(86687830094254394233)
,p_source=>'OPER_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(186666483144082339271)
,p_name=>'P12_ACTION_TYPE'
,p_item_sequence=>10
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(186666483303788339273)
,p_name=>'P12_OPER_CL_ID'
,p_item_sequence=>50
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(188252195447243918338)
,p_name=>'P12_OPER_DATE_TIME'
,p_item_sequence=>60
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(188252205647200918368)
,p_name=>'P12_VALIDATION'
,p_item_sequence=>100
,p_use_cache_before_default=>'NO'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(94886016192898180733)
,p_validation_name=>'PRODUCTS_Q_VAL'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    -- Check if P12_PRODUCTS_LIST is NULL or an empty string',
'    IF :P12_PRODUCTS_LIST IS NULL OR TRIM(:P12_PRODUCTS_LIST) = '''' THEN',
unistr('        RETURN ''Uzupe\0142nij ilo\015B\0107 co najmniej jednego produktu'';'),
'    END IF;',
'',
'    -- Optionally, check if it contains at least one valid item',
'    IF INSTR(:P12_PRODUCTS_LIST, '','') = 0 THEN',
'        -- If no commas are found, ensure it still has content',
'        IF TRIM(:P12_PRODUCTS_LIST) IS NULL THEN',
unistr('            RETURN ''Uzupe\0142nij ilo\015B\0107 co najmniej jednego produktu'';'),
'        END IF;',
'    END IF;',
'',
'    -- Validation passed',
'    RETURN NULL;',
'END;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(94886004964823180714)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(94886035790102180744)
,p_name=>'P12_OPER_CL_ID_DA'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P12_OPER_CL_ID'
,p_condition_element=>'P12_OPER_TYPE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'D'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(94886036796112180745)
,p_event_id=>wwv_flow_imp.id(94886035790102180744)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'console.log(''Chosen client: '', $(''#P12_OPER_CL_ID'').val());'
,p_build_option_id=>wwv_flow_imp.id(86354378099415878996)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(94886038209851180745)
,p_event_id=>wwv_flow_imp.id(94886035790102180744)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(94886036247337180744)
,p_event_id=>wwv_flow_imp.id(94886035790102180744)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(181270978773737972016)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(94886037290414180745)
,p_event_id=>wwv_flow_imp.id(94886035790102180744)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(181270978773737972016)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(94886037744724180745)
,p_event_id=>wwv_flow_imp.id(94886035790102180744)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(181270978773737972016)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(94886016487171180733)
,p_name=>'CREATE_DA'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(94886004964823180714)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(94844812265972385430)
,p_event_id=>wwv_flow_imp.id(94886016487171180733)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P12_VALIDATION'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'0'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(94886019901248180736)
,p_event_id=>wwv_flow_imp.id(94886016487171180733)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'create_json_prod_list'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// Get the tbody element within the table',
'var tbody = document.querySelector(''#F_PRODUCTS_STATIC_ID tbody'');',
'',
'// Select all rows (<tr>) within the tbody',
'var rows = tbody.querySelectorAll(''tr'');',
'',
'var products_list = [];',
'',
'// Iterate over each row',
'rows.forEach(row => {',
'    // Get all cells in the current row',
'    let cells = row.querySelectorAll(''td'');',
'',
'    // Extract the product ID (first column) and quantity (third column)',
'    let prod_id = cells[0].textContent.trim(); // First column',
'    let prod_quantity = cells[2].textContent.trim(); // Third column',
'',
'    // Add the values to the array as an object',
'    if (prod_quantity > 0) {',
'        products_list.push([prod_id, prod_quantity]);',
'    }',
'});',
'',
'// Set coma separated list item and log it',
'apex.item(''P12_PRODUCTS_LIST'').setValue(products_list);',
'//DEBUG console.log("P12_PRODUCTS_LIST = ", apex.item("P12_PRODUCTS_LIST").getValue());',
'',
'// Set json list item',
'apex.item(''P12_PRODUCTS_LIST_JSON'').setValue(JSON.stringify(products_list));',
'',
'// Validation',
'if ($v("P12_PRODUCTS_LIST") !== null && $v("P12_PRODUCTS_LIST").trim() !== '''') {',
'    $s("P12_VALIDATION", Number($v("P12_VALIDATION")) + 1);',
'}'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(94886020911547180736)
,p_event_id=>wwv_flow_imp.id(94886016487171180733)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>unistr('Wszystkie pola s\0105 wymagane, na li\015Bcie produkt\00F3w co najmniej jeden musi mie\0107 ilo\015B\0107 wi\0119ksz\0105 ni\017C 0')
,p_attribute_03=>'warning'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P12_VALIDATION'
,p_client_condition_expression=>'0'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(99414175514783214107)
,p_event_id=>wwv_flow_imp.id(94886016487171180733)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'//DEBUG console.log(''date = '', $v("P12_OPER_DATE_TIME"))'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(94886022495459180737)
,p_event_id=>wwv_flow_imp.id(94886016487171180733)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'PKG_OPERATIONS.add_operation(',
'    p_oper_type => :P12_OPER_TYPE,',
'    p_client_id => :P12_OPER_CL_ID,',
'    p_planned_date =>:P12_OPER_DATE_TIME,',
'    p_products_list => :P12_PRODUCTS_LIST_JSON',
');'))
,p_attribute_02=>'P12_OPER_TYPE,P12_PRODUCTS_LIST_JSON'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P12_VALIDATION'
,p_client_condition_expression=>'1'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(94886018485883180734)
,p_event_id=>wwv_flow_imp.id(94886016487171180733)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.navigation.dialog.close(true);',
'',
'parent.apex.region("T_OPERATIONS_STATIC_ID").refresh();',
unistr('parent.apex.message.showPageSuccess("Operacja zosta\0142a dodana");')))
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P12_VALIDATION'
,p_client_condition_expression=>'1'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(94886031551903180742)
,p_name=>'CANCEL_DA'
,p_event_sequence=>140
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(94886004524293180714)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(94886032067458180742)
,p_event_id=>wwv_flow_imp.id(94886031551903180742)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.dialog.close(true);'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(94886025634430180739)
,p_name=>'PRODUCTS_LIST_JSON_DA'
,p_event_sequence=>150
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P12_PRODUCTS_LIST_JSON'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(94886026102835180739)
,p_event_id=>wwv_flow_imp.id(94886025634430180739)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'//DEBUG console.log(''P12_PRODUCTS_LIST_JSON = '', $v(''P12_PRODUCTS_LIST_JSON''));'
);
wwv_flow_imp.component_end;
end;
/
