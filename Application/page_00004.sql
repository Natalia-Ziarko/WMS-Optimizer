prompt --application/pages/page_00004
begin
--   Manifest
--     PAGE: 00004
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
 p_id=>4
,p_name=>'Role-actions'
,p_alias=>'ROLE-ACTIONS'
,p_page_mode=>'MODAL'
,p_step_title=>'Rola'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(263406145508644053176)
,p_plug_name=>'Role-actions'
,p_title=>'Rola'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>40
,p_query_type=>'TABLE'
,p_query_table=>'ROLES'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(88574680318276671462)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(263406145508644053176)
,p_button_name=>'SAVE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Zapisz zmiany'
,p_button_position=>'CHANGE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P4_ACTION_TYPE'
,p_button_condition2=>'edit'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(88574679519609671461)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(263406145508644053176)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_image_alt=>'Anuluj'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(88574680792891671463)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(263406145508644053176)
,p_button_name=>'CREATE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Dodaj'
,p_button_position=>'CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P4_ACTION_TYPE'
,p_button_condition2=>'add'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(88574679961692671462)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(263406145508644053176)
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
,p_button_condition=>'P4_ACTION_TYPE'
,p_button_condition2=>'edit'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(88532634893261357418)
,p_name=>'P4_ROL_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(263406145508644053176)
,p_item_source_plug_id=>wwv_flow_imp.id(263406145508644053176)
,p_prompt=>'ID'
,p_source=>'ROL_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>10
,p_grid_column=>2
,p_display_when=>'P4_ACTION_TYPE'
,p_display_when2=>'add'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
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
 p_id=>wwv_flow_imp.id(88532634933821357419)
,p_name=>'P4_ROL_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(263406145508644053176)
,p_item_source_plug_id=>wwv_flow_imp.id(263406145508644053176)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_role_name varchar2(255 char);',
'begin',
'    if (:P4_ROL_ID_PARAMETER is not null) then',
'        select rol_name into v_role_name from roles where rol_id = :P4_ROL_ID_PARAMETER;',
'        ',
'        return v_role_name;',
'    end if;',
'end;'))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Nazwa'
,p_source=>'ROL_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>255
,p_colspan=>10
,p_grid_column=>2
,p_field_template=>wwv_flow_imp.id(86355354664424879074)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(88532635066785357420)
,p_name=>'P4_ROL_F_ACTIVE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(263406145508644053176)
,p_item_source_plug_id=>wwv_flow_imp.id(263406145508644053176)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_f_role_active varchar2(1 char);',
'begin',
'    if (:P4_ROL_ID_PARAMETER is not null) then',
'        select rol_f_active into v_f_role_active from roles where rol_id = :P4_ROL_ID_PARAMETER;',
'        ',
'        return v_f_role_active;',
'    end if;',
'end;'))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Aktywna'
,p_source=>'ROL_F_ACTIVE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_colspan=>10
,p_grid_column=>2
,p_display_when=>'P4_ACTION_TYPE'
,p_display_when2=>'edit'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(86355353371314879074)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(88532635704583357427)
,p_name=>'P4_ACTION_TYPE'
,p_item_sequence=>10
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(88532635428480357424)
,p_name=>'CANCEL_DA'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(88574679519609671461)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88532635563253357425)
,p_event_id=>wwv_flow_imp.id(88532635428480357424)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.dialog.close(true);'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(88532638081972357450)
,p_name=>'CREATE_DA'
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(88574680792891671463)
,p_condition_element=>'P4_ROL_NAME'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88866108892174054007)
,p_event_id=>wwv_flow_imp.id(88532638081972357450)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>unistr('Nazwa roli nie mo\017Ce by\0107 pusta')
,p_attribute_03=>'warning'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P4_ROL_NAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88866108533819054004)
,p_event_id=>wwv_flow_imp.id(88532638081972357450)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    PKG_USERS_AND_ROLES.add_role(p_role_name => :P4_ROL_NAME);',
'END;'))
,p_attribute_02=>'P4_ROL_NAME'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88866108357405054002)
,p_event_id=>wwv_flow_imp.id(88532638081972357450)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.navigation.dialog.close(true); ',
'',
'parent.apex.region("T_ROLES_STATIC_ID").refresh();',
unistr('parent.apex.message.showPageSuccess("Nowa rola zosta\0142a dodana");')))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(88866109090013054009)
,p_name=>'DELETE_DA'
,p_event_sequence=>130
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(88574679961692671462)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88866109305151054012)
,p_event_id=>wwv_flow_imp.id(88866109090013054009)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    PKG_USERS_AND_ROLES.delete_role(p_role_id => :P4_ROL_ID);',
'END;'))
,p_attribute_02=>'P4_ROL_ID'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88866109213292054011)
,p_event_id=>wwv_flow_imp.id(88866109090013054009)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.navigation.dialog.close(true); ',
'parent.apex.region("T_ROLES_STATIC_ID").refresh();',
unistr('parent.apex.message.showPageSuccess("Rola zosta\0142a usuni\0119ta");')))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(88866109458609054013)
,p_name=>'SAVE_DA'
,p_event_sequence=>140
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(88574680318276671462)
,p_condition_element=>'P4_ROL_NAME'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88866109661835054015)
,p_event_id=>wwv_flow_imp.id(88866109458609054013)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    PKG_USERS_AND_ROLES.edit_role(',
'        p_role_id => :P4_ROL_ID,',
'        p_role_name => :P4_ROL_NAME,',
'        p_role_f_active => :P4_ROL_F_ACTIVE',
'    );',
'END;'))
,p_attribute_02=>'P4_ROL_ID,P4_ROL_NAME,P4_ROL_F_ACTIVE'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88866109882188054017)
,p_event_id=>wwv_flow_imp.id(88866109458609054013)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>unistr('Nazwa roli nie mo\017Ce by\0107 pusta')
,p_attribute_03=>'warning'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P4_ROL_NAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88866109711919054016)
,p_event_id=>wwv_flow_imp.id(88866109458609054013)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.navigation.dialog.close(true);',
'parent.apex.region("T_ROLES_STATIC_ID").refresh();',
'parent.apex.region("T_USERS_ROLES_STATIC_ID").refresh();',
unistr('parent.apex.message.showPageSuccess("Rola zosta\0142a zmodyfikowana");')))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(88574688893355671472)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(263406145508644053176)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Operation-actions'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>88574688893355671472
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(88620037825321807751)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(263406145508644053176)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Role-actions'
,p_internal_uid=>88620037825321807751
);
wwv_flow_imp.component_end;
end;
/
