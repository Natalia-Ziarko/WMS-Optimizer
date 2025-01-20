prompt --application/pages/page_00009
begin
--   Manifest
--     PAGE: 00009
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
 p_id=>9
,p_name=>'Hint-actions'
,p_alias=>'HINT-ACTIONS'
,p_page_mode=>'MODAL'
,p_step_title=>'Zmiana godziny operacji'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(630600053387077917625)
,p_plug_name=>'Hint-actions'
,p_title=>unistr('Op\00F3\017Anienie')
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>50
,p_query_type=>'TABLE'
,p_query_table=>'HINTS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(96413186262734695776)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(630600053387077917625)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_image_alt=>'Anuluj'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(96413187483196695778)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(630600053387077917625)
,p_button_name=>'CREATE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Dodaj'
,p_button_position=>'CREATE'
,p_warn_on_unsaved_changes=>null
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(96403971747290306912)
,p_name=>'P9_HINT_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(630600053387077917625)
,p_item_source_plug_id=>wwv_flow_imp.id(630600053387077917625)
,p_source=>'HINT_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(96403971825807306913)
,p_name=>'P9_HINT_ROLE_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(630600053387077917625)
,p_item_source_plug_id=>wwv_flow_imp.id(630600053387077917625)
,p_source=>'HINT_ROLE_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(96403971997225306914)
,p_name=>'P9_HINT_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(630600053387077917625)
,p_item_source_plug_id=>wwv_flow_imp.id(630600053387077917625)
,p_source=>'HINT_STATUS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(96403972021546306915)
,p_name=>'P9_HINT_TITLE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(630600053387077917625)
,p_item_source_plug_id=>wwv_flow_imp.id(630600053387077917625)
,p_item_default=>'Informacja o zmianie godziny operacji'
,p_prompt=>unistr('Tytu\0142')
,p_source=>'HINT_TITLE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>10
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
 p_id=>wwv_flow_imp.id(96403972112233306916)
,p_name=>'P9_HINT_CONTENT'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(630600053387077917625)
,p_item_source_plug_id=>wwv_flow_imp.id(630600053387077917625)
,p_prompt=>unistr('Tre\015B\0107')
,p_source=>'HINT_CONTENT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>800
,p_cHeight=>5
,p_colspan=>10
,p_grid_column=>2
,p_field_template=>wwv_flow_imp.id(86355354664424879074)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'Y',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(96403972271187306917)
,p_name=>'P9_HINT_CLIENT_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(630600053387077917625)
,p_item_source_plug_id=>wwv_flow_imp.id(630600053387077917625)
,p_source=>'HINT_CLIENT_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(96403972309737306918)
,p_name=>'P9_HINT_OPERATION_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(630600053387077917625)
,p_item_source_plug_id=>wwv_flow_imp.id(630600053387077917625)
,p_prompt=>'ID operacji'
,p_source=>'HINT_OPERATION_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Operacja ID: ''||oper_id',
'        ||'', klient ID: ''|| oper_cl_id',
'        ||'' (z dnia ''||to_char(oper_planned_date_time, ''DD-Mon-YYYY HH24:MI'')||'')'' d,',
'        oper_id r',
'from operations',
'where oper_status != ''C''',
'    and oper_wh_start_date_time is null',
'    and to_char(oper_planned_date_time, ''DD-MM-YYYY'') >=  to_char(sysdate, ''DD-MM-YYYY'')',
'order by oper_planned_date_time'))
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
 p_id=>wwv_flow_imp.id(96403972423650306919)
,p_name=>'P9_HINT_PRODUCT_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(630600053387077917625)
,p_item_source_plug_id=>wwv_flow_imp.id(630600053387077917625)
,p_source=>'HINT_PRODUCT_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(96403972547590306920)
,p_name=>'P9_HINT_START_DATE_TIME'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(630600053387077917625)
,p_item_source_plug_id=>wwv_flow_imp.id(630600053387077917625)
,p_source=>'HINT_START_DATE_TIME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(96403972611893306921)
,p_name=>'P9_HINT_END_DATE_TIME'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(630600053387077917625)
,p_item_source_plug_id=>wwv_flow_imp.id(630600053387077917625)
,p_source=>'HINT_END_DATE_TIME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(96403972745637306922)
,p_name=>'P9_HINT_WHO_ADDED_ROLE_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(630600053387077917625)
,p_item_source_plug_id=>wwv_flow_imp.id(630600053387077917625)
,p_source=>'HINT_WHO_ADDED_ROLE_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(96403972830316306923)
,p_name=>'P9_NEW_OPER_DATE_TIME'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(630600053387077917625)
,p_item_default=>'P9_TODAY_DATE_TIME'
,p_item_default_type=>'ITEM'
,p_prompt=>'Nowa data'
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_source=>'P9_TODAY_DATE_TIME'
,p_source_type=>'ITEM'
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
  'min_item', 'P9_TODAY_DATE_TIME',
  'multiple_months', 'N',
  'show_time', 'Y',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(96403972961088306924)
,p_name=>'P9_TODAY_DATE_TIME'
,p_item_sequence=>40
,p_use_cache_before_default=>'NO'
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'v_sysdate TIMESTAMP;',
'v_minutes_extract INT;',
'v_sysdate_with_interval TIMESTAMP;',
'BEGIN',
'    SELECT sysdate INTO v_sysdate FROM dual;',
'    v_minutes_extract := 15 - MOD(EXTRACT(MINUTE FROM v_sysdate), 15);',
'    IF v_minutes_extract = 15 THEN v_minutes_extract := 0; END IF;',
'',
'    v_sysdate_with_interval := v_sysdate + INTERVAL ''1'' MINUTE * v_minutes_extract;',
'',
'    --not working',
'    --v_sysdate_with_interval := to_char(v_sysdate_with_interval, ''DD-MON-YYYY HH24:MI'');',
'',
'    return v_sysdate_with_interval;',
'END;'))
,p_source_type=>'FUNCTION_BODY'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(96403973653209306931)
,p_name=>'P9_USER_ID'
,p_item_sequence=>30
,p_use_cache_before_default=>'NO'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(367193979163370867667)
,p_name=>'P9_VALIDATION'
,p_item_sequence=>20
,p_use_cache_before_default=>'NO'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(455726581353866221937)
,p_name=>'P9_ACTION_TYPE'
,p_item_sequence=>10
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(96413192790104695799)
,p_name=>'CANCEL_DA'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(96413186262734695776)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(96413193247308695801)
,p_event_id=>wwv_flow_imp.id(96413192790104695799)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.dialog.close(true);'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(96413193660732695802)
,p_name=>'CREATE_DA'
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(96413187483196695778)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(96403973086518306925)
,p_event_id=>wwv_flow_imp.id(96413193660732695802)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9_VALIDATION'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'0'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(96403973138277306926)
,p_event_id=>wwv_flow_imp.id(96413193660732695802)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9_VALIDATION'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'(Number($v("P9_VALIDATION")) + 1)'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P9_HINT_OPERATION_ID'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(96403973899758306933)
,p_event_id=>wwv_flow_imp.id(96413193660732695802)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>unistr('ID operacji nie zosta\0142o przekazane. Skontaktuj si\0119 z tw\00F3rc\0105 oprogramowania.')
,p_attribute_03=>'warning'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P9_HINT_OPERATION_ID'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(96403973756488306932)
,p_event_id=>wwv_flow_imp.id(96413193660732695802)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9_VALIDATION'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'(Number($v("P9_VALIDATION")) + 1)'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P9_NEW_OPER_DATE_TIME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(96413195127558695802)
,p_event_id=>wwv_flow_imp.id(96413193660732695802)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>unistr('Uzupe\0142nij now\0105 dat\0119 operacji')
,p_attribute_03=>'warning'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P9_NEW_OPER_DATE_TIME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(96403973377214306928)
,p_event_id=>wwv_flow_imp.id(96413193660732695802)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9_VALIDATION'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'(Number($v("P9_VALIDATION")) + 1)'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P9_HINT_CONTENT'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(96403973275228306927)
,p_event_id=>wwv_flow_imp.id(96413193660732695802)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>unistr('Uzupe\0142nij tre\015B\0107')
,p_attribute_03=>'warning'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P9_HINT_CONTENT'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(96413194174802695802)
,p_event_id=>wwv_flow_imp.id(96413193660732695802)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    PKG_HINTS.add_when_planned_date_changed(',
'        p_oper_id => :P9_HINT_OPERATION_ID,',
'        p_for_who_id => PKG_USERS_AND_ROLES.G_WHMNGR_ROLE_ID,',
'        p_new_oper_date_time => :P9_NEW_OPER_DATE_TIME,',
'        p_info_from_client => :P9_HINT_CONTENT',
'    );',
'END;'))
,p_attribute_02=>'P9_HINT_OPERATION_ID,P9_NEW_OPER_DATE_TIME,P9_HINT_CONTENT'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P9_VALIDATION'
,p_client_condition_expression=>'3'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(96403973432900306929)
,p_event_id=>wwv_flow_imp.id(96413193660732695802)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(''oper_id: '', $v("P9_HINT_OPERATION_ID"));',
'console.log(''user_id: '', $v("P9_USER_ID"));',
'console.log(''new_date: '', $v("P9_NEW_OPER_DATE_TIME"));',
'console.log(''content: '', $v("P9_HINT_CONTENT"));'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(96413194692770695802)
,p_event_id=>wwv_flow_imp.id(96413193660732695802)
,p_event_result=>'TRUE'
,p_action_sequence=>110
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.navigation.dialog.close(true);',
'',
unistr('parent.apex.message.showPageSuccess("Informacja zosta\0142a przekazana kierownikowi magazynu");')))
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P9_VALIDATION'
,p_client_condition_expression=>'3'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(96413190996259695790)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(630600053387077917625)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Operation-actions'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>96413190996259695790
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(96413191234528695791)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(630600053387077917625)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Location-actions'
,p_internal_uid=>96413191234528695791
);
wwv_flow_imp.component_end;
end;
/
