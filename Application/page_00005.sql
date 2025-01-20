prompt --application/pages/page_00005
begin
--   Manifest
--     PAGE: 00005
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
 p_id=>5
,p_name=>'Size-actions'
,p_alias=>'SIZE-ACTIONS'
,p_page_mode=>'MODAL'
,p_step_title=>'Rozmiar lokalizacji magazynowej'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(353474179956759550621)
,p_plug_name=>'Size-actions'
,p_title=>'Rozmiar'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>30
,p_query_type=>'TABLE'
,p_query_table=>'SIZES'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(90068035866648497450)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(353474179956759550621)
,p_button_name=>'SAVE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Zapisz zmiany'
,p_button_position=>'CHANGE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P5_ACTION_TYPE'
,p_button_condition2=>'edit'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(90068035059076497449)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(353474179956759550621)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_image_alt=>'Anuluj'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(90068036278337497450)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(353474179956759550621)
,p_button_name=>'CREATE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Dodaj'
,p_button_position=>'CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P5_ACTION_TYPE'
,p_button_condition2=>'add'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(90068035456089497450)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(353474179956759550621)
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
,p_button_condition=>'P5_ACTION_TYPE'
,p_button_condition2=>'edit'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(90068071977819500601)
,p_name=>'P5_SIZE_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(353474179956759550621)
,p_item_source_plug_id=>wwv_flow_imp.id(353474179956759550621)
,p_prompt=>'ID'
,p_source=>'SIZE_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>10
,p_grid_column=>2
,p_display_when=>'P5_ACTION_TYPE'
,p_display_when2=>'edit'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(86355353371314879074)
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
 p_id=>wwv_flow_imp.id(90068072033040500602)
,p_name=>'P5_SIZE_DIM1_MAX'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(353474179956759550621)
,p_item_source_plug_id=>wwv_flow_imp.id(353474179956759550621)
,p_prompt=>unistr('D\0142ugo\015B\0107')
,p_format_mask=>'9999'
,p_source=>'SIZE_DIM1_MAX'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_colspan=>10
,p_grid_column=>2
,p_field_template=>wwv_flow_imp.id(86355354664424879074)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'min_value', '10',
  'number_alignment', 'left',
  'virtual_keyboard', 'numeric')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(90068072186162500603)
,p_name=>'P5_SIZE_DIM2_MAX'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(353474179956759550621)
,p_item_source_plug_id=>wwv_flow_imp.id(353474179956759550621)
,p_prompt=>unistr('Szeroko\015B\0107')
,p_source=>'SIZE_DIM2_MAX'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_colspan=>10
,p_grid_column=>2
,p_field_template=>wwv_flow_imp.id(86355354664424879074)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'min_value', '10',
  'number_alignment', 'left',
  'virtual_keyboard', 'numeric')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(90068072250517500604)
,p_name=>'P5_SIZE_DIM3_MAX'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(353474179956759550621)
,p_item_source_plug_id=>wwv_flow_imp.id(353474179956759550621)
,p_prompt=>unistr('Wysoko\015B\0107')
,p_source=>'SIZE_DIM3_MAX'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_colspan=>10
,p_grid_column=>2
,p_field_template=>wwv_flow_imp.id(86355354664424879074)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'min_value', '10',
  'number_alignment', 'left',
  'virtual_keyboard', 'numeric')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(90068072835984500610)
,p_name=>'P5_VALIDATION'
,p_item_sequence=>20
,p_use_cache_before_default=>'NO'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(178600675026479854880)
,p_name=>'P5_ACTION_TYPE'
,p_item_sequence=>10
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(90068072442996500606)
,p_validation_name=>'New'
,p_validation_sequence=>10
,p_validation=>'P5_SIZE_ID'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'X'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_imp.id(90068036278337497450)
,p_associated_item=>wwv_flow_imp.id(90068071977819500601)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(90068039760592497453)
,p_name=>'CANCEL_DA'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(90068035059076497449)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90068040283994497454)
,p_event_id=>wwv_flow_imp.id(90068039760592497453)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.dialog.close(true);'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(90068040611345497454)
,p_name=>'CREATE_DA'
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(90068036278337497450)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90068073805526500620)
,p_event_id=>wwv_flow_imp.id(90068040611345497454)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P5_VALIDATION'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'0'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90068074365352500625)
,p_event_id=>wwv_flow_imp.id(90068040611345497454)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'console.log(''1. P5_VALIDATION = '', $v("P5_VALIDATION"));'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90068073941459500621)
,p_event_id=>wwv_flow_imp.id(90068040611345497454)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P5_VALIDATION'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'(Number($v("P5_VALIDATION")) + 1)'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'!isNaN(parseFloat($v("P5_SIZE_DIM1_MAX")))'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90068074477110500626)
,p_event_id=>wwv_flow_imp.id(90068040611345497454)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(''2. P5_VALIDATION = '', $v("P5_VALIDATION"));',
'console.log(''P5_SIZE_DIM1_MAX number? '', !isNaN(parseFloat($v("P5_SIZE_DIM1_MAX"))));',
'console.log(''P5_SIZE_DIM1_MAX = '', $v("P5_SIZE_DIM1_MAX"));'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90068074080449500622)
,p_event_id=>wwv_flow_imp.id(90068040611345497454)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P5_VALIDATION'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'(Number($v("P5_VALIDATION")) + 1)'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'!isNaN(parseFloat($v("P5_SIZE_DIM2_MAX")))'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90068074547462500627)
,p_event_id=>wwv_flow_imp.id(90068040611345497454)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(''3. P5_VALIDATION = '', $v("P5_VALIDATION"));',
'console.log(''P5_SIZE_DIM2_MAX number? '', !isNaN(parseFloat($v("P5_SIZE_DIM2_MAX"))));',
'console.log(''P5_SIZE_DIM2_MAX = '', $v("P5_SIZE_DIM2_MAX"));'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90068074117118500623)
,p_event_id=>wwv_flow_imp.id(90068040611345497454)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P5_VALIDATION'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'(Number($v("P5_VALIDATION")) + 1)'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'!isNaN(parseFloat($v("P5_SIZE_DIM3_MAX")))'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90068074624439500628)
,p_event_id=>wwv_flow_imp.id(90068040611345497454)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(''4 P5_VALIDATION = '', $v("P5_VALIDATION"));',
'console.log(''P5_SIZE_DIM3_MAX number? '', !isNaN(parseFloat($v("P5_SIZE_DIM3_MAX"))));',
'console.log(''P5_SIZE_DIM3_MAX = '', $v("P5_SIZE_DIM3_MAX"));'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90068074789726500629)
,p_event_id=>wwv_flow_imp.id(90068040611345497454)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>unistr('Wszystkie wymiary musz\0105 by\0107 uzupe\0142nione')
,p_attribute_03=>'warning'
,p_client_condition_type=>'LESS_THAN'
,p_client_condition_element=>'P5_VALIDATION'
,p_client_condition_expression=>'3'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90068072706194500609)
,p_event_id=>wwv_flow_imp.id(90068040611345497454)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    PKG_WAREHOUSE.add_size(',
'        p_dim_1 => :P5_SIZE_DIM1_MAX,',
'        p_dim_2 => :P5_SIZE_DIM2_MAX,',
'        p_dim_3 => :P5_SIZE_DIM3_MAX',
'    );',
'END;'))
,p_attribute_02=>'P5_SIZE_DIM1_MAX,P5_SIZE_DIM2_MAX,P5_SIZE_DIM3_MAX'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P5_VALIDATION'
,p_client_condition_expression=>'3'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90068042146694497455)
,p_event_id=>wwv_flow_imp.id(90068040611345497454)
,p_event_result=>'TRUE'
,p_action_sequence=>110
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.navigation.dialog.close(true); ',
'',
'parent.apex.region("T_SIZES_STATIC_ID").refresh();',
unistr('parent.apex.message.showPageSuccess("Nowy rozmiar zosta\0142 dodany");')))
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P5_VALIDATION'
,p_client_condition_expression=>'3'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(90068042566700497455)
,p_name=>'DELETE_DA'
,p_event_sequence=>130
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(90068035456089497450)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90068043579276497456)
,p_event_id=>wwv_flow_imp.id(90068042566700497455)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    PKG_WAREHOUSE.delete_size(p_size_id => :P5_SIZE_ID);',
'END;'))
,p_attribute_02=>'P5_SIZE_ID'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90068043035686497455)
,p_event_id=>wwv_flow_imp.id(90068042566700497455)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.navigation.dialog.close(true); ',
'parent.apex.region("T_SIZES_STATIC_ID").refresh();',
unistr('parent.apex.message.showPageSuccess("Rozmiar zosta\0142 usuni\0119ty");')))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(90068043929664497456)
,p_name=>'SAVE_DA'
,p_event_sequence=>140
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(90068035866648497450)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90068072924728500611)
,p_event_id=>wwv_flow_imp.id(90068043929664497456)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P5_VALIDATION'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'0'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90068073594682500617)
,p_event_id=>wwv_flow_imp.id(90068043929664497456)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'console.log(''1. P5_VALIDATION = '', $v("P5_VALIDATION"));'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90068073053945500612)
,p_event_id=>wwv_flow_imp.id(90068043929664497456)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P5_VALIDATION'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'(Number($v("P5_VALIDATION")) + 1)'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'!isNaN(parseFloat($v("P5_SIZE_DIM1_MAX")))'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90068073620677500618)
,p_event_id=>wwv_flow_imp.id(90068043929664497456)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(''2. P5_VALIDATION = '', $v("P5_VALIDATION"));',
'console.log(''P5_SIZE_DIM1_MAX number? '', !isNaN(parseFloat($v("P5_SIZE_DIM1_MAX"))));',
'console.log(''P5_SIZE_DIM1_MAX = '', $v("P5_SIZE_DIM1_MAX"));'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90068073237882500614)
,p_event_id=>wwv_flow_imp.id(90068043929664497456)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P5_VALIDATION'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'(Number($v("P5_VALIDATION")) + 1)'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'!isNaN(parseFloat($v("P5_SIZE_DIM2_MAX")))'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90068073790027500619)
,p_event_id=>wwv_flow_imp.id(90068043929664497456)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(''3. P5_VALIDATION = '', $v("P5_VALIDATION"));',
'console.log(''P5_SIZE_DIM2_MAX number? '', !isNaN(parseFloat($v("P5_SIZE_DIM2_MAX"))));',
'console.log(''P5_SIZE_DIM2_MAX = '', $v("P5_SIZE_DIM2_MAX"));'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90068073391795500615)
,p_event_id=>wwv_flow_imp.id(90068043929664497456)
,p_event_result=>'TRUE'
,p_action_sequence=>110
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P5_VALIDATION'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'(Number($v("P5_VALIDATION")) + 1)'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'!isNaN(parseFloat($v("P5_SIZE_DIM3_MAX")))'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90068073420352500616)
,p_event_id=>wwv_flow_imp.id(90068043929664497456)
,p_event_result=>'TRUE'
,p_action_sequence=>120
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(''4 P5_VALIDATION = '', $v("P5_VALIDATION"));',
'console.log(''P5_SIZE_DIM3_MAX number? '', !isNaN(parseFloat($v("P5_SIZE_DIM3_MAX"))));',
'console.log(''P5_SIZE_DIM3_MAX = '', $v("P5_SIZE_DIM3_MAX"));'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90068074211305500624)
,p_event_id=>wwv_flow_imp.id(90068043929664497456)
,p_event_result=>'TRUE'
,p_action_sequence=>140
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>unistr('Wszystkie wymiary musz\0105 by\0107 uzupe\0142nione')
,p_attribute_03=>'warning'
,p_client_condition_type=>'LESS_THAN'
,p_client_condition_element=>'P5_VALIDATION'
,p_client_condition_expression=>'3'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90068044469853497456)
,p_event_id=>wwv_flow_imp.id(90068043929664497456)
,p_event_result=>'TRUE'
,p_action_sequence=>160
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    PKG_WAREHOUSE.edit_size(',
'        p_size_id => :P5_SIZE_ID,',
'        p_dim_1 => :P5_SIZE_DIM1_MAX,',
'        p_dim_2 => :P5_SIZE_DIM2_MAX,',
'        p_dim_3 => :P5_SIZE_DIM3_MAX',
'    );',
'END;'))
,p_attribute_02=>'P5_SIZE_ID,P5_SIZE_DIM1_MAX,P5_SIZE_DIM2_MAX,P5_SIZE_DIM3_MAX'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P5_VALIDATION'
,p_client_condition_expression=>'3'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90068044982696497456)
,p_event_id=>wwv_flow_imp.id(90068043929664497456)
,p_event_result=>'TRUE'
,p_action_sequence=>170
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.navigation.dialog.close(true);',
'parent.apex.region("T_SIZES_STATIC_ID").refresh();',
unistr('parent.apex.message.showPageSuccess("Rozmiar zosta\0142 zmodyfikowany");')))
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P5_VALIDATION'
,p_client_condition_expression=>'3'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(90068038526688497452)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(353474179956759550621)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Operation-actions'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>90068038526688497452
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(90068038934482497452)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(353474179956759550621)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Size-actions'
,p_internal_uid=>90068038934482497452
);
wwv_flow_imp.component_end;
end;
/
