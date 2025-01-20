prompt --application/pages/page_00007
begin
--   Manifest
--     PAGE: 00007
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
 p_id=>7
,p_name=>'Product-actions'
,p_alias=>'PRODUCT-ACTIONS'
,p_page_mode=>'MODAL'
,p_step_title=>'Produkt'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(534186867780737221856)
,p_plug_name=>'Product-actions'
,p_title=>'Produkt'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>50
,p_query_type=>'TABLE'
,p_query_table=>'PRODUCTS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(90540988480655777045)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(534186867780737221856)
,p_button_name=>'SAVE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Zapisz zmiany'
,p_button_position=>'CHANGE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P7_ACTION_TYPE'
,p_button_condition2=>'edit'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(90540987697647777045)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(534186867780737221856)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_image_alt=>'Anuluj'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(90540988895308777046)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(534186867780737221856)
,p_button_name=>'CREATE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Dodaj'
,p_button_position=>'CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P7_ACTION_TYPE'
,p_button_condition2=>'add'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(90540988008619777045)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(534186867780737221856)
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
,p_button_condition=>'P7_ACTION_TYPE'
,p_button_condition2=>'edit'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(90482329274966875827)
,p_name=>'P7_PROD_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(534186867780737221856)
,p_item_source_plug_id=>wwv_flow_imp.id(534186867780737221856)
,p_prompt=>'ID'
,p_source=>'PROD_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>10
,p_grid_column=>2
,p_display_when=>'P7_ACTION_TYPE'
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
 p_id=>wwv_flow_imp.id(90482329372868875828)
,p_name=>'P7_PROD_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(534186867780737221856)
,p_item_source_plug_id=>wwv_flow_imp.id(534186867780737221856)
,p_prompt=>'Nazwa'
,p_source=>'PROD_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>255
,p_colspan=>10
,p_grid_column=>2
,p_field_template=>wwv_flow_imp.id(86355354664424879074)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(90482329420036875829)
,p_name=>'P7_PROD_SIZE_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(534186867780737221856)
,p_item_source_plug_id=>wwv_flow_imp.id(534186867780737221856)
,p_prompt=>'Wymiary do'
,p_source=>'PROD_SIZE_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    (SIZE_DIM1_MAX || '' cm x '' ||',
'    SIZE_DIM2_MAX || '' cm x '' ||',
'    SIZE_DIM3_MAX || '' cm'') size_dim,',
'    size_id',
'from sizes',
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
 p_id=>wwv_flow_imp.id(90482329561132875830)
,p_name=>'P7_PROD_CL_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(534186867780737221856)
,p_item_source_plug_id=>wwv_flow_imp.id(534186867780737221856)
,p_prompt=>'Klient'
,p_source=>'PROD_CL_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    USER_ID || '' - '' || USER_NAME_SURNAME client_name,',
'    USER_ID client_id',
'from users where user_type = ''C'' order by user_id'))
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
 p_id=>wwv_flow_imp.id(90482330154242875836)
,p_name=>'P7_PROD_OPTIMUM_Q'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(534186867780737221856)
,p_item_source_plug_id=>wwv_flow_imp.id(534186867780737221856)
,p_prompt=>'Optymalny zapas'
,p_source=>'PROD_OPTIMUM_Q'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH numbers (n) AS (',
'    SELECT 1 AS n FROM dual',
'    UNION ALL',
'    SELECT n + 1 FROM numbers WHERE n < 1000',
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
 p_id=>wwv_flow_imp.id(90482330348443875838)
,p_name=>'P7_STOCK'
,p_item_sequence=>30
,p_use_cache_before_default=>'NO'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(270780787400113171871)
,p_name=>'P7_VALIDATION'
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
 p_id=>wwv_flow_imp.id(359313389590608526141)
,p_name=>'P7_ACTION_TYPE'
,p_item_sequence=>10
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(90540993827059777053)
,p_name=>'CANCEL_DA'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(90540987697647777045)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90540994338965777054)
,p_event_id=>wwv_flow_imp.id(90540993827059777053)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.dialog.close(true);'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(90540994738250777054)
,p_name=>'CREATE_DA'
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(90540988895308777046)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90482329660685875831)
,p_event_id=>wwv_flow_imp.id(90540994738250777054)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>unistr('Uzupe\0142nij nazw\0119 produktu')
,p_attribute_03=>'warning'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P7_PROD_NAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90482329760426875832)
,p_event_id=>wwv_flow_imp.id(90540994738250777054)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    PKG_WAREHOUSE.add_product(',
'        p_prod_name => :P7_PROD_NAME,',
'        p_prod_size_id => :P7_PROD_SIZE_ID,',
'        p_prod_cl_id => :P7_PROD_CL_ID,',
'        p_prod_optimum_q => :P7_PROD_OPTIMUM_Q',
'    );',
'END;'))
,p_attribute_02=>'P7_PROD_NAME,P7_PROD_SIZE_ID,P7_PROD_CL_ID,P7_PROD_OPTIMUM_Q'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P7_PROD_NAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90482329849266875833)
,p_event_id=>wwv_flow_imp.id(90540994738250777054)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.navigation.dialog.close(true);',
'parent.apex.region("T_PRODUCTS_STATIC_ID").refresh();',
unistr('parent.apex.message.showPageSuccess("Produkt zosta\0142 dodany");')))
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P7_PROD_NAME'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(90541000145412777057)
,p_name=>'DELETE_DA'
,p_event_sequence=>130
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(90540988008619777045)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90482330572145875840)
,p_event_id=>wwv_flow_imp.id(90541000145412777057)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>unistr('Nie mo\017Cna usun\0105\0107 produktu znajduj\0105cego si\0119 na magazynie')
,p_attribute_03=>'danger'
,p_server_condition_type=>'EXPRESSION'
,p_server_condition_expr1=>':P7_STOCK > 0'
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90482330707701875842)
,p_event_id=>wwv_flow_imp.id(90541000145412777057)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.navigation.dialog.close(true); ',
unistr('parent.apex.message.error("Produkt nie zosta\0142 usuni\0119ty");')))
,p_server_condition_type=>'EXPRESSION'
,p_server_condition_expr1=>':P7_STOCK > 0'
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90541001146688777057)
,p_event_id=>wwv_flow_imp.id(90541000145412777057)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    PKG_WAREHOUSE.delete_product(p_prod_id => :P7_PROD_ID);',
'END;'))
,p_attribute_02=>'P7_PROD_ID'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P7_STOCK'
,p_server_condition_expr2=>'0'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90541000694304777057)
,p_event_id=>wwv_flow_imp.id(90541000145412777057)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.navigation.dialog.close(true); ',
'parent.apex.region("T_PRODUCTS_STATIC_ID").refresh();',
unistr('parent.apex.message.showPageSuccess("Produkt zosta\0142 usuni\0119ty");')))
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P7_STOCK'
,p_server_condition_expr2=>'0'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(90541001593734777058)
,p_name=>'SAVE_DA'
,p_event_sequence=>140
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(90540988480655777045)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90541002545719777058)
,p_event_id=>wwv_flow_imp.id(90541001593734777058)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>unistr('Uzupe\0142nij nazw\0119 produktu')
,p_attribute_03=>'warning'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P7_PROD_NAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90541003520123777059)
,p_event_id=>wwv_flow_imp.id(90541001593734777058)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    PKG_WAREHOUSE.edit_product(',
'        p_prod_id => :P7_PROD_ID,',
'        p_prod_name => :P7_PROD_NAME,',
'        p_prod_size_id => :P7_PROD_SIZE_ID,',
'        p_prod_cl_id => :P7_PROD_CL_ID,',
'        p_prod_optimum_q => :P7_PROD_OPTIMUM_Q',
'    );',
'END;'))
,p_attribute_02=>'P7_PROD_ID,P7_PROD_NAME,P7_PROD_SIZE_ID,P7_PROD_CL_ID,P7_PROD_OPTIMUM_Q'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P7_PROD_NAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(90541003063676777058)
,p_event_id=>wwv_flow_imp.id(90541001593734777058)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.navigation.dialog.close(true);',
'',
'parent.apex.region("T_PRODUCTS_STATIC_ID").refresh();',
unistr('parent.apex.message.showPageSuccess("Produkt zosta\0142 zmodyfikowany");')))
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P7_PROD_NAME'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(90540992333774777050)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(534186867780737221856)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Operation-actions'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>90540992333774777050
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(90540992784385777050)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(534186867780737221856)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Location-actions'
,p_internal_uid=>90540992784385777050
);
wwv_flow_imp.component_end;
end;
/
