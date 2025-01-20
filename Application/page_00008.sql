prompt --application/pages/page_00008
begin
--   Manifest
--     PAGE: 00008
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
 p_id=>8
,p_name=>'Work-schedule-actions'
,p_alias=>'WORK-SCHEDULE-ACTIONS'
,p_page_mode=>'MODAL'
,p_step_title=>'Wydarzenie w kalendarzu'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(93366188839333737611)
,p_plug_name=>'New_event_on_calendar'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>75
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P8_ACTION_TYPE = ''add'' and (:P8_EVENT_TYPE != ''shift'' or :P8_EVENT_TYPE is null)'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(94844813190755385439)
,p_plug_name=>'Operation_edit_on_calendar'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>95
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P8_EVENT_TYPE = ''operation'''
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(91780466817859158519)
,p_plug_name=>'Operation_edit'
,p_title=>'Operacja'
,p_parent_plug_id=>wwv_flow_imp.id(94844813190755385439)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select OPER_ID,',
'        case OPER_TYPE',
'            when ''D'' then ''Dostawa''',
unistr('            when ''L'' then ''Za\0142adunek'''),
'            when ''P'' then ''Kompletacja''',
'            when ''R'' then ''Wydanie''',
unistr('            when ''T'' then ''Przesuni\0119cie'''),
'            else ''Nieznany''',
'        end oper_type,',
'       OPER_RECEIVE_DATE_TIME,',
'       OPER_PLANNED_DATE_TIME,',
'       OPER_CL_ID,',
'       OPER_EMP_ID,',
'       OPER_WH_START_DATE_TIME,',
'       OPER_WH_END_DATE_TIME,',
'       OPER_WH_OPTIMUM_TIME,',
'        case OPER_STATUS',
'            when ''C'' then ''Anulowana''',
unistr('            when ''D'' then ''Zako\0144czona'''),
'            when ''N'' then ''Nowa''',
'            when ''PH'' then ''Do zatwierdzenia''',
'            when ''LH'' then ''Niezatwierdzona kompletacja''',
unistr('            when ''RH'' then ''Przed optymalizacj\0105'''),
'            else ''Nieznany''',
'        end oper_status,',
'       OPER_PARENT_ID',
'  from OPERATIONS'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(94844814213115385450)
,p_plug_name=>'Operation_add_on_calendar'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>105
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P8_NEW_EVENT_TYPE = ''operation'''
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(626018040391682718199)
,p_plug_name=>'Shift_actions_on_calendar'
,p_title=>'Grafik'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>85
,p_query_type=>'TABLE'
,p_query_table=>'WH_SCHEDULE_WHMEN'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P8_EVENT_TYPE = ''shift'' or :P8_NEW_EVENT_TYPE = ''shift'''
,p_plug_display_when_cond2=>'PLSQL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(91831174066798496348)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(626018040391682718199)
,p_button_name=>'SAVE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Zapisz zmiany'
,p_button_position=>'CHANGE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P8_ACTION_TYPE'
,p_button_condition2=>'edit'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(91780468300644158534)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(94844813190755385439)
,p_button_name=>'SAVE_1'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Zapisz zmiany'
,p_button_position=>'CHANGE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P8_ACTION_TYPE'
,p_button_condition2=>'edit'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(95211177227839867817)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(94844814213115385450)
,p_button_name=>'SAVE_5'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Dalej'
,p_button_position=>'CHANGE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(91831173262483496347)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(626018040391682718199)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_image_alt=>'Anuluj'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(91780468192510158532)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(94844813190755385439)
,p_button_name=>'CANCEL_1'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_image_alt=>'Anuluj'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(93366188919151737612)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(93366188839333737611)
,p_button_name=>'CANCEL_4'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_image_alt=>'Anuluj'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P8_EVENT_TYPE is null and :P8_NEW_EVENT_TYPE is null'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(95211176993314867814)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(94844814213115385450)
,p_button_name=>'CANCEL_5'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_image_alt=>'Anuluj'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(91831174422401496348)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(626018040391682718199)
,p_button_name=>'CREATE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Dodaj'
,p_button_position=>'CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P8_ACTION_TYPE = ''add'' or :P8_NEW_EVENT_TYPE = ''shift'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(91831173681975496347)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(626018040391682718199)
,p_button_name=>'DELETE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--gapRight'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_image_alt=>unistr('Usu\0144')
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P8_ACTION_TYPE'
,p_button_condition2=>'edit'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(95211178912564867834)
,p_branch_name=>'Go To Page 2'
,p_branch_action=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:2:P2_ACTION_TYPE,P2_OPER_ID_2,P2_OPER_PLANNED_DATE_TIME_2:edit_on_calendar,&P8_OPER_TO_EDIT.,&P8_CALENDAR_DATE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(95211177227839867817)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91780466523416158516)
,p_name=>'P8_WSW_SHIFT_DATE'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(626018040391682718199)
,p_prompt=>'Data'
,p_format_mask=>'DD-MM-YYYY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_wsw_start timestamp;',
'begin',
'    if (:P8_CALENDAR_DATE is null) then',
'        select wsw_start into v_wsw_start',
'        from wh_schedule_whmen',
'        where wsw_id = :P8_WSW_ID;',
'    else',
'        return :P8_CALENDAR_DATE;',
'    end if;',
'',
'    return v_wsw_start;',
'end;'))
,p_source_type=>'FUNCTION_BODY'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_colspan=>10
,p_grid_column=>2
,p_field_template=>wwv_flow_imp.id(86355354664424879074)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'ITEM',
  'min_item', 'P8_MINIMUM_DATE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91780466768748158518)
,p_name=>'P8_EVENT_TYPE'
,p_item_sequence=>20
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91780466983778158520)
,p_name=>'P8_OPER_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(91780466817859158519)
,p_item_source_plug_id=>wwv_flow_imp.id(91780466817859158519)
,p_prompt=>'ID operacji'
,p_source=>'OPER_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>5
,p_grid_column=>2
,p_display_when=>'P8_ACTION_TYPE'
,p_display_when2=>'edit'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(86355354664424879074)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91780467049051158521)
,p_name=>'P8_OPER_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(91780466817859158519)
,p_item_source_plug_id=>wwv_flow_imp.id(91780466817859158519)
,p_prompt=>'Typ'
,p_source=>'OPER_TYPE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>5
,p_grid_column=>2
,p_field_template=>wwv_flow_imp.id(86355354664424879074)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91780467115145158522)
,p_name=>'P8_OPER_RECEIVE_DATE_TIME'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(91780466817859158519)
,p_item_source_plug_id=>wwv_flow_imp.id(91780466817859158519)
,p_source=>'OPER_RECEIVE_DATE_TIME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91780467270354158523)
,p_name=>'P8_OPER_PLANNED_DATE_TIME'
,p_source_data_type=>'TIMESTAMP'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(91780466817859158519)
,p_item_source_plug_id=>wwv_flow_imp.id(91780466817859158519)
,p_prompt=>'Planowana data'
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_source=>'OPER_PLANNED_DATE_TIME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_colspan=>10
,p_grid_column=>2
,p_field_template=>wwv_flow_imp.id(86355354664424879074)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'ITEM',
  'min_item', 'P8_MINIMUM_DATE_TIME',
  'multiple_months', 'N',
  'show_time', 'Y',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91780467351222158524)
,p_name=>'P8_OPER_CL_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(91780466817859158519)
,p_item_source_plug_id=>wwv_flow_imp.id(91780466817859158519)
,p_source=>'OPER_CL_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91780467482047158525)
,p_name=>'P8_OPER_EMP_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(91780466817859158519)
,p_item_source_plug_id=>wwv_flow_imp.id(91780466817859158519)
,p_prompt=>'ID przypisanego magazyniera'
,p_source=>'OPER_EMP_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select user_id || '' - '' || user_name_surname || '' '' || user_first_name, user_id',
'from users',
'where user_id in(select ur_user_id from users_roles where ur_role_id = 3)',
'order by user_id'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>10
,p_grid_column=>2
,p_field_template=>wwv_flow_imp.id(86355353371314879074)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91780467536768158526)
,p_name=>'P8_OPER_WH_START_DATE_TIME'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(91780466817859158519)
,p_item_source_plug_id=>wwv_flow_imp.id(91780466817859158519)
,p_prompt=>unistr('Data rozpocz\0119cia operacji')
,p_source=>'OPER_WH_START_DATE_TIME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>5
,p_grid_column=>2
,p_field_template=>wwv_flow_imp.id(86355353371314879074)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91780467627114158527)
,p_name=>'P8_OPER_WH_END_DATE_TIME'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(91780466817859158519)
,p_item_source_plug_id=>wwv_flow_imp.id(91780466817859158519)
,p_prompt=>unistr('Data zako\0144czenia operacji')
,p_source=>'OPER_WH_END_DATE_TIME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_field_template=>wwv_flow_imp.id(86355353371314879074)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91780467732136158528)
,p_name=>'P8_OPER_WH_OPTIMUM_TIME'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(91780466817859158519)
,p_item_source_plug_id=>wwv_flow_imp.id(91780466817859158519)
,p_item_default=>'0'
,p_prompt=>'Przewidywany czas [m]'
,p_source=>'OPER_WH_OPTIMUM_TIME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'NUMBER_MULTIPLIED_15'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH numbers (n) AS (',
'    SELECT 15 AS n FROM dual',
'    UNION ALL',
'    SELECT n + 15 FROM numbers WHERE n < 840',
')',
'SELECT n disp, n ret FROM numbers'))
,p_cHeight=>1
,p_colspan=>10
,p_grid_column=>2
,p_field_template=>wwv_flow_imp.id(86355354664424879074)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91780467968449158530)
,p_name=>'P8_EVENT_ID'
,p_item_sequence=>30
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(93366188064761737603)
,p_name=>'P8_NEW_EVENT_TYPE'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(93366188839333737611)
,p_prompt=>'Operacja'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>unistr('STATIC:Dodaj zmian\0119;shift,Edytuj operacj\0119;operation')
,p_grid_column=>6
,p_display_when=>'P8_ACTION_TYPE'
,p_display_when2=>'add'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(86355354664424879074)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--xlarge:t-Form-fieldContainer--radioButtonGroup'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'execute_validations', 'Y',
  'number_of_columns', '1',
  'page_action_on_selection', 'SUBMIT')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(94844812961788385437)
,p_name=>'P8_CALENDAR_DATE'
,p_item_sequence=>50
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(94844813218513385440)
,p_name=>'P8_OPER_TO_EDIT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(94844814213115385450)
,p_item_default=>'Brak'
,p_prompt=>'Lista operacji do edycji'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    ''ID operacji: '' || oper_id',
'    || case oper_type',
'         when ''D'' then '' (Dostawa)'' ',
unistr('         when ''L'' then '' (Za\0142adunek)'' '),
'         when ''P'' then '' (Kompletacja)'' ',
'         when ''R'' then '' (Wydanie)''',
unistr('         when ''T'' then '' (Przeniesienie wewn\0119trzne)'' '),
'       end disp,',
'    oper_id ret',
'from operations',
'where (oper_planned_date_time is null or oper_emp_id is null or oper_wh_optimum_time is null)',
'    and oper_status != ''C''',
'    and to_char(trunc(oper_planned_date_time), ''DD-MM-YYYY'') >= :P8_MINIMUM_DATE'))
,p_cHeight=>1
,p_colspan=>10
,p_grid_column=>2
,p_display_when=>'P8_ACTION_TYPE'
,p_display_when2=>'edit'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(86355354664424879074)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99480518439502536277)
,p_name=>'P8_MINIMUM_DATE'
,p_item_sequence=>55
,p_format_mask=>'DD-MM-YYYY'
,p_source=>'select to_char(sysdate, ''DD-MM-YYYY'') from dual'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99622972353175985106)
,p_name=>'P8_WSW_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(626018040391682718199)
,p_item_source_plug_id=>wwv_flow_imp.id(626018040391682718199)
,p_source=>'WSW_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99622972498338985107)
,p_name=>'P8_WSW_WHMAN_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(626018040391682718199)
,p_prompt=>'Magazynier'
,p_source=>'select wsw_whman_id from wh_schedule_whmen where wsw_id = :P8_WSW_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'WAREHOUSEMEN_ID_NAME_SURNAME'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select user_id||'' - ''||user_name_surname||'' ''||user_first_name disp, user_id ret',
'from users',
'left join users_roles on user_id = ur_user_id',
'left join roles on ur_role_id = rol_id',
'where upper(rol_name) = upper(''warehouseman'')'))
,p_cHeight=>1
,p_colspan=>10
,p_grid_column=>2
,p_read_only_when=>'P8_ACTION_TYPE'
,p_read_only_when2=>'edit'
,p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(86355354664424879074)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99622972516934985108)
,p_name=>'P8_WSW_SHIFT_NO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(626018040391682718199)
,p_item_source_plug_id=>wwv_flow_imp.id(626018040391682718199)
,p_prompt=>'Numer zmiany'
,p_source=>'WSW_SHIFT_NO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:1;1,2;2'
,p_cHeight=>1
,p_colspan=>10
,p_grid_column=>2
,p_field_template=>wwv_flow_imp.id(86355354664424879074)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99622972662907985109)
,p_name=>'P8_WSW_START'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(626018040391682718199)
,p_item_source_plug_id=>wwv_flow_imp.id(626018040391682718199)
,p_source=>'WSW_START'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99622972739305985110)
,p_name=>'P8_WSW_END'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(626018040391682718199)
,p_item_source_plug_id=>wwv_flow_imp.id(626018040391682718199)
,p_source=>'WSW_END'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99791296914214863102)
,p_name=>'P8_MINIMUM_DATE_TIME'
,p_item_sequence=>65
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_source=>'select cast(trunc(sysdate) as timestamp) from dual'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(105675268380226058501)
,p_name=>'P8_OPER_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(91780466817859158519)
,p_item_source_plug_id=>wwv_flow_imp.id(91780466817859158519)
,p_prompt=>'Status'
,p_source=>'OPER_STATUS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_field_template=>wwv_flow_imp.id(86355354664424879074)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(105675268491201058502)
,p_name=>'P8_OPER_PARENT_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(91780466817859158519)
,p_item_source_plug_id=>wwv_flow_imp.id(91780466817859158519)
,p_prompt=>unistr('ID powi\0105zanego za\0142adunku')
,p_source=>'OPER_PARENT_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_field_template=>wwv_flow_imp.id(86355353371314879074)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(362611966132082668224)
,p_name=>'P8_VALIDATION'
,p_item_sequence=>40
,p_use_cache_before_default=>'NO'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(451144568322578022494)
,p_name=>'P8_ACTION_TYPE'
,p_item_sequence=>10
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(94844813746482385445)
,p_name=>'HIDE_OPERATION_FORM'
,p_event_sequence=>5
,p_bind_type=>'bind'
,p_bind_event_type=>'apexbeforepagesubmit'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_when_cond=>'P8_ACTION_TYPE'
,p_display_when_cond2=>'add'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(94844813874098385446)
,p_event_id=>wwv_flow_imp.id(94844813746482385445)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(91780466817859158519)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P8_ACTION_TYPE'
,p_server_condition_expr2=>'add'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(91831179786584496354)
,p_name=>'CANCEL_DA'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(91831173262483496347)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(91831180225471496355)
,p_event_id=>wwv_flow_imp.id(91831179786584496354)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.dialog.close(true);'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(91780468542750158536)
,p_name=>'CANCEL_DA_1'
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(91780468192510158532)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(91780468699083158537)
,p_event_id=>wwv_flow_imp.id(91780468542750158536)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.dialog.close(true);'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(95211177005047867815)
,p_name=>'CANCEL_DA_5'
,p_event_sequence=>130
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(95211176993314867814)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(95211177186705867816)
,p_event_id=>wwv_flow_imp.id(95211177005047867815)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.dialog.close(true);'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(93366189050260737613)
,p_name=>'CANCEL_DA_4'
,p_event_sequence=>140
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(93366188919151737612)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(93366189108709737614)
,p_event_id=>wwv_flow_imp.id(93366189050260737613)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.dialog.close(true);'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(91831180659192496355)
,p_name=>'CREATE_DA'
,p_event_sequence=>150
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(91831174422401496348)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(91780466634180158517)
,p_event_id=>wwv_flow_imp.id(91831180659192496355)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>unistr('Wybierz dat\0119')
,p_attribute_03=>'danger'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P8_WSW_SHIFT_DATE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(91831181112176496355)
,p_event_id=>wwv_flow_imp.id(91831180659192496355)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    PKG_WAREHOUSE.add_shift(',
'        p_whman_id => :P8_WSW_WHMAN_ID,',
'        p_shift_no => :P8_WSW_SHIFT_NO,',
'        p_shift_date => to_date(:P8_WSW_SHIFT_DATE, ''DD-MM-YYYY'')',
'    );',
'END;'))
,p_attribute_02=>'P8_WSW_WHMAN_ID,P8_WSW_SHIFT_NO,P8_WSW_SHIFT_DATE'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P8_WSW_SHIFT_DATE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(91831181641606496356)
,p_event_id=>wwv_flow_imp.id(91831180659192496355)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.navigation.dialog.close(true);',
'',
'parent.apex.region("C_WORK_SCHEDULE_STATIC_ID").refresh();',
'parent.apex.region("C_WHMAN_SCHEDULE_STATIC_ID").refresh();',
unistr('parent.apex.message.showPageSuccess("Zmiana zosta\0142a dodana");')))
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P8_WSW_SHIFT_DATE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(91831182588626496356)
,p_name=>'DELETE_DA'
,p_event_sequence=>160
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(91831173681975496347)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(91831184551159496357)
,p_event_id=>wwv_flow_imp.id(91831182588626496356)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    PKG_WAREHOUSE.delete_shift(p_shift_id => :P8_EVENT_ID);',
'END;'))
,p_attribute_02=>'P8_EVENT_ID'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(91831184050503496357)
,p_event_id=>wwv_flow_imp.id(91831182588626496356)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.navigation.dialog.close(true);',
'',
'parent.apex.region("C_WORK_SCHEDULE_STATIC_ID").refresh();',
'parent.apex.region("C_WHMAN_SCHEDULE_STATIC_ID").refresh();',
unistr('parent.apex.message.showPageSuccess("Zmiana zosta\0142a usuni\0119ta");')))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(91831184954907496357)
,p_name=>'SAVE_DA'
,p_event_sequence=>170
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(91831174066798496348)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(91831183038144496356)
,p_event_id=>wwv_flow_imp.id(91831184954907496357)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>unistr('Wybierz dat\0119')
,p_attribute_03=>'danger'
,p_server_condition_type=>'ITEM_IS_NULL'
,p_server_condition_expr1=>'P8_WSW_SHIFT_DATE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(91831186430306496358)
,p_event_id=>wwv_flow_imp.id(91831184954907496357)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'PKG_WAREHOUSE.edit_shift(',
'    p_shift_id => :P8_WSW_ID,',
'    p_shift_no => :P8_WSW_SHIFT_NO,',
'    p_shift_date => to_date(:P8_WSW_SHIFT_DATE, ''DD-MM-YYYY'')',
');'))
,p_attribute_02=>'P8_WSW_ID,P8_WSW_SHIFT_NO,P8_WSW_SHIFT_DATE'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P8_WSW_SHIFT_DATE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(91831185902912496358)
,p_event_id=>wwv_flow_imp.id(91831184954907496357)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.navigation.dialog.close(true);',
'',
'parent.apex.region("C_WORK_SCHEDULE_STATIC_ID").refresh();',
'parent.apex.region("C_WHMAN_SCHEDULE_STATIC_ID").refresh();',
unistr('parent.apex.message.showPageSuccess("Zmiana zosta\0142a zmodyfikowana");')))
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P8_WSW_SHIFT_DATE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92745365815795017340)
,p_name=>'SAVE_DA_1'
,p_event_sequence=>180
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(91780468300644158534)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92745365934664017341)
,p_event_id=>wwv_flow_imp.id(92745365815795017340)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>unistr('Wybierz dat\0119')
,p_attribute_03=>'danger'
,p_server_condition_type=>'ITEM_IS_NULL'
,p_server_condition_expr1=>'P8_OPER_PLANNED_DATE_TIME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92745366216101017344)
,p_event_id=>wwv_flow_imp.id(92745365815795017340)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(''oper = '', $v("P8_OPER_ID"));',
'console.log(''whman = '', $v("P8_OPER_EMP_ID"));',
'console.log(''planned date_time = '', $v("P8_OPER_PLANNED_DATE_TIME"));',
'console.log(''optimum time = '', $v("P8_OPER_WH_OPTIMUM_TIME"));'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92745366020594017342)
,p_event_id=>wwv_flow_imp.id(92745365815795017340)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    PKG_OPERATIONS.edit_oper_as_mngr(',
'        p_oper_id => :P8_OPER_ID,',
'        p_whman_id => :P8_OPER_EMP_ID,',
'        p_planned_date_time => :P8_OPER_PLANNED_DATE_TIME,',
'        p_oper_time => :P8_OPER_WH_OPTIMUM_TIME',
'    );',
'END;'))
,p_attribute_02=>'P8_OPER_ID,P8_OPER_EMP_ID,P8_OPER_PLANNED_DATE_TIME,P8_OPER_WH_OPTIMUM_TIME'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P8_OPER_PLANNED_DATE_TIME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92745366144014017343)
,p_event_id=>wwv_flow_imp.id(92745365815795017340)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.navigation.dialog.close(true);',
'',
'parent.apex.region("T_OPERATIONS_STATIC_ID").refresh();',
'parent.apex.region("C_WORK_SCHEDULE_STATIC_ID").refresh();',
unistr('parent.apex.message.showPageSuccess("Operacja zosta\0142a zmodyfikowana");')))
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P8_OPER_PLANNED_DATE_TIME'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(91780467813006158529)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Ser oper_id or shift_id'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if (:P8_EVENT_TYPE = ''shift'') then',
'        :P8_WSW_ID := :P8_EVENT_ID;',
'    elsif (:P8_EVENT_TYPE = ''operation'') then',
'        :P8_OPER_ID := :P8_EVENT_ID;',
'    end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>91780467813006158529
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(91831178305964496351)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(626018040391682718199)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Shift_actions_on_calendar'
,p_internal_uid=>91831178305964496351
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(91780468060662158531)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(91780466817859158519)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Operation_edit'
,p_internal_uid=>91780468060662158531
);
wwv_flow_imp.component_end;
end;
/
