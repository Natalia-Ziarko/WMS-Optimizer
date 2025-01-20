prompt --application/pages/page_00006
begin
--   Manifest
--     PAGE: 00006
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
 p_id=>6
,p_name=>'Location-actions'
,p_alias=>'LOCATION-ACTIONS'
,p_page_mode=>'MODAL'
,p_step_title=>'Lokalizacja'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(443645880737210444816)
,p_plug_name=>'Location-actions'
,p_title=>'Lokalizacja'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>30
,p_query_type=>'TABLE'
,p_query_table=>'LOCATIONS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(90171710255099894202)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(443645880737210444816)
,p_button_name=>'SAVE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Zapisz zmiany'
,p_button_position=>'CHANGE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P6_ACTION_TYPE'
,p_button_condition2=>'edit'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(90171708876986894202)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(443645880737210444816)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_image_alt=>'Anuluj'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(90171710968246894203)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(443645880737210444816)
,p_button_name=>'CREATE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Dodaj'
,p_button_position=>'CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P6_ACTION_TYPE'
,p_button_condition2=>'add'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(90171709684891894202)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(443645880737210444816)
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
,p_button_condition=>'P6_ACTION_TYPE'
,p_button_condition2=>'edit'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(90068076434897500646)
,p_name=>'P6_LOC_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(443645880737210444816)
,p_item_source_plug_id=>wwv_flow_imp.id(443645880737210444816)
,p_prompt=>'ID'
,p_source=>'LOC_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>10
,p_grid_column=>2
,p_display_when=>'P6_ACTION_TYPE'
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
 p_id=>wwv_flow_imp.id(90068076513752500647)
,p_name=>'P6_LOC_ALLEY'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(443645880737210444816)
,p_item_source_plug_id=>wwv_flow_imp.id(443645880737210444816)
,p_prompt=>'Aleja'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'LOC_ALLEY'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_colspan=>10
,p_grid_column=>2
,p_field_template=>wwv_flow_imp.id(86355354664424879074)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'min_value', '1',
  'number_alignment', 'left',
  'virtual_keyboard', 'numeric')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(90068076678794500648)
,p_name=>'P6_LOC_SIDE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(443645880737210444816)
,p_item_source_plug_id=>wwv_flow_imp.id(443645880737210444816)
,p_prompt=>'Strona'
,p_source=>'LOC_SIDE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Lewa;L,Prawa;R'
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
 p_id=>wwv_flow_imp.id(90068076719588500649)
,p_name=>'P6_LOC_NUMBER'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(443645880737210444816)
,p_item_source_plug_id=>wwv_flow_imp.id(443645880737210444816)
,p_prompt=>'Numer'
,p_source=>'LOC_NUMBER'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_colspan=>10
,p_grid_column=>2
,p_field_template=>wwv_flow_imp.id(86355354664424879074)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(90068076856363500650)
,p_name=>'P6_LOC_SIZE_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(443645880737210444816)
,p_item_source_plug_id=>wwv_flow_imp.id(443645880737210444816)
,p_prompt=>'Rozmiar'
,p_source=>'LOC_SIZE_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    (SIZE_DIM1_MAX || '' cm x '' ||',
'    SIZE_DIM2_MAX || '' cm x '' ||',
'    SIZE_DIM3_MAX || '' cm'') SIZE_DIM,',
'    SIZE_ID',
'from SIZES',
'order by size_id'))
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
 p_id=>wwv_flow_imp.id(180239794294332394819)
,p_name=>'P6_VALIDATION'
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
 p_id=>wwv_flow_imp.id(268772396484827749089)
,p_name=>'P6_ACTION_TYPE'
,p_item_sequence=>10
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(90171724315816894211)
,p_name=>'CANCEL_DA'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(90171708876986894202)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90171725269730894211)
,p_event_id=>wwv_flow_imp.id(90171724315816894211)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.dialog.close(true);'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(90171725807824894211)
,p_name=>'CREATE_DA'
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(90171710968246894203)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90482326759271875802)
,p_event_id=>wwv_flow_imp.id(90171725807824894211)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P6_VALIDATION'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'0'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90482326892928875803)
,p_event_id=>wwv_flow_imp.id(90171725807824894211)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'console.log(''1. P6_VALIDATION = '', $v("P6_VALIDATION"));'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90482326922823875804)
,p_event_id=>wwv_flow_imp.id(90171725807824894211)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P6_VALIDATION'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'(Number($v("P6_VALIDATION")) + 1)'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'!isNaN(parseFloat($v("P6_LOC_ALLEY")))'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90482327062932875805)
,p_event_id=>wwv_flow_imp.id(90171725807824894211)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(''2. P6_VALIDATION = '', $v("P6_VALIDATION"));',
'console.log(''>> P6_LOC_ALLEY number? '', !isNaN(parseFloat($v("P6_LOC_ALLEY"))));',
'console.log(''>> P6_LOC_ALLEY = '', $v("P6_LOC_ALLEY"));'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90482327103213875806)
,p_event_id=>wwv_flow_imp.id(90171725807824894211)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P6_VALIDATION'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'(Number($v("P6_VALIDATION")) + 1)'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'!isNaN(parseFloat($v("P6_LOC_NUMBER")))'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90482327211268875807)
,p_event_id=>wwv_flow_imp.id(90171725807824894211)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(''3. P6_VALIDATION = '', $v("P6_LOC_NUMBER"));',
'console.log(''>> P6_LOC_NUMBER number? '', !isNaN(parseFloat($v("P6_LOC_NUMBER"))));',
'console.log(''>> P6_LOC_NUMBER = '', $v("P6_LOC_NUMBER"));'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90482327377522875808)
,p_event_id=>wwv_flow_imp.id(90171725807824894211)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>unistr('Uzupe\0142nij brakuj\0105ce pola (aleja i numer musz\0105 by\0107 liczb\0105)')
,p_attribute_03=>'warning'
,p_client_condition_type=>'LESS_THAN'
,p_client_condition_element=>'P6_VALIDATION'
,p_client_condition_expression=>'2'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90482327421646875809)
,p_event_id=>wwv_flow_imp.id(90171725807824894211)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'console.log(''4. P6_VALIDATION = '', $v("P6_LOC_NUMBER"));'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90171726624619894212)
,p_event_id=>wwv_flow_imp.id(90171725807824894211)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    PKG_WAREHOUSE.add_location(',
'        p_loc_alley=> :P6_LOC_ALLEY,',
'        p_loc_side => :P6_LOC_SIDE,',
'        p_loc_number=> :P6_LOC_NUMBER,',
'        p_loc_size_id=> :P6_LOC_SIZE_ID',
'    );',
'END;'))
,p_attribute_02=>'P6_LOC_ALLEY,P6_LOC_SIDE,P6_LOC_NUMBER,P6_LOC_SIZE_ID'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P6_VALIDATION'
,p_client_condition_expression=>'2'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90171727615332894212)
,p_event_id=>wwv_flow_imp.id(90171725807824894211)
,p_event_result=>'TRUE'
,p_action_sequence=>110
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.navigation.dialog.close(true); ',
'',
'parent.apex.region("T_LOCATIONS_STATIC_ID").refresh();',
unistr('parent.apex.message.showPageSuccess("Nowa lokalizacja zosta\0142a dodana");')))
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P6_VALIDATION'
,p_client_condition_expression=>'2'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(90171734999645894215)
,p_name=>'DELETE_DA'
,p_event_sequence=>130
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(90171709684891894202)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90171736223634894216)
,p_event_id=>wwv_flow_imp.id(90171734999645894215)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    PKG_WAREHOUSE.delete_location(p_loc_id => :P6_LOC_ID);',
'END;'))
,p_attribute_02=>'P6_LOC_ID'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90171735656895894216)
,p_event_id=>wwv_flow_imp.id(90171734999645894215)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.navigation.dialog.close(true); ',
'parent.apex.region("T_LOCATIONS_STATIC_ID").refresh();',
unistr('parent.apex.message.showPageSuccess("Lokalizacja zosta\0142a usuni\0119ta");')))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(90171736799872894216)
,p_name=>'SAVE_DA'
,p_event_sequence=>140
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(90171710255099894202)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90171742163563894218)
,p_event_id=>wwv_flow_imp.id(90171736799872894216)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P6_VALIDATION'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'0'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90171738104065894217)
,p_event_id=>wwv_flow_imp.id(90171736799872894216)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'console.log(''1. P6_VALIDATION = '', $v("P6_VALIDATION"));'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90171742747872894219)
,p_event_id=>wwv_flow_imp.id(90171736799872894216)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P6_VALIDATION'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'(Number($v("P6_VALIDATION")) + 1)'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'!isNaN(parseFloat($v("P6_LOC_ALLEY")))'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90171740917305894218)
,p_event_id=>wwv_flow_imp.id(90171736799872894216)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(''2. P6_VALIDATION = '', $v("P6_VALIDATION"));',
'console.log(''P6_LOC_ALLEY number? '', !isNaN(parseFloat($v("P6_LOC_ALLEY"))));',
'console.log(''P6_LOC_ALLEY = '', $v("P6_LOC_ALLEY"));'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90171743357950894219)
,p_event_id=>wwv_flow_imp.id(90171736799872894216)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P6_VALIDATION'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'(Number($v("P6_VALIDATION")) + 1)'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'!isNaN(parseFloat($v("P6_LOC_NUMBER")))'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90171741672691894218)
,p_event_id=>wwv_flow_imp.id(90171736799872894216)
,p_event_result=>'TRUE'
,p_action_sequence=>110
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(''3. P6_VALIDATION = '', $v("P6_LOC_NUMBER"));',
'console.log(''P6_LOC_NUMBER number? '', !isNaN(parseFloat($v("P6_LOC_NUMBER"))));',
'console.log(''P6_LOC_NUMBER = '', $v("P6_LOC_NUMBER"));'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90171738894896894217)
,p_event_id=>wwv_flow_imp.id(90171736799872894216)
,p_event_result=>'TRUE'
,p_action_sequence=>130
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>unistr('Uzupe\0142nij brakuj\0105ce pola (aleja i numer musz\0105 by\0107 liczb\0105)')
,p_attribute_03=>'warning'
,p_client_condition_type=>'LESS_THAN'
,p_client_condition_element=>'P6_VALIDATION'
,p_client_condition_expression=>'2'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90171740249309894217)
,p_event_id=>wwv_flow_imp.id(90171736799872894216)
,p_event_result=>'TRUE'
,p_action_sequence=>150
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    PKG_WAREHOUSE.edit_location(',
'        p_loc_id=> :P6_LOC_ID,',
'        p_loc_alley=> :P6_LOC_ALLEY,',
'        p_loc_side => :P6_LOC_SIDE,',
'        p_loc_number=> :P6_LOC_NUMBER,',
'        p_loc_size_id=> :P6_LOC_SIZE_ID',
'    );',
'END;'))
,p_attribute_02=>'P6_LOC_ID,P6_LOC_ALLEY,P6_LOC_SIDE,P6_LOC_NUMBER,P6_LOC_SIZE_ID'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P6_VALIDATION'
,p_client_condition_expression=>'2'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90171739556400894217)
,p_event_id=>wwv_flow_imp.id(90171736799872894216)
,p_event_result=>'TRUE'
,p_action_sequence=>160
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.navigation.dialog.close(true);',
'parent.apex.region("T_LOCATIONS_STATIC_ID").refresh();',
unistr('parent.apex.message.showPageSuccess("Lokalizacja zosta\0142a zmodyfikowana");')))
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P6_VALIDATION'
,p_client_condition_expression=>'2'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(90171718450755894207)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(443645880737210444816)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Operation-actions'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>90171718450755894207
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(90171719173501894207)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(443645880737210444816)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Location-actions'
,p_internal_uid=>90171719173501894207
);
wwv_flow_imp.component_end;
end;
/
