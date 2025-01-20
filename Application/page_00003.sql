prompt --application/pages/page_00003
begin
--   Manifest
--     PAGE: 00003
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
 p_id=>3
,p_name=>'User-actions'
,p_alias=>'USER-ACTIONS'
,p_page_mode=>'MODAL'
,p_step_title=>unistr('U\017Cytkownik')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(174831466583162381721)
,p_plug_name=>'User-details'
,p_title=>'User'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>30
,p_query_type=>'TABLE'
,p_query_table=>'USERS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(88866110245594054021)
,p_plug_name=>'User-roles'
,p_title=>'Roles'
,p_parent_plug_id=>wwv_flow_imp.id(174831466583162381721)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'TABLE'
,p_query_table=>'ROLES'
,p_query_where=>'rol_f_active = ''Y'''
,p_include_rowid_column=>false
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(100319949275437935917)
,p_plug_name=>'APEX-account'
,p_title=>'Konto'
,p_parent_plug_id=>wwv_flow_imp.id(174831466583162381721)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(88143638124757987504)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(174831466583162381721)
,p_button_name=>'SAVE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Zapisz zmiany'
,p_button_position=>'CHANGE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P3_ACTION_TYPE'
,p_button_condition2=>'edit'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(88143637237770987503)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(174831466583162381721)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_image_alt=>'Anuluj'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(88143638695456987504)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(174831466583162381721)
,p_button_name=>'CREATE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Dodaj'
,p_button_position=>'CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P3_ACTION_TYPE'
,p_button_condition2=>'add'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(88143637725169987504)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(174831466583162381721)
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
,p_button_condition=>'P3_ACTION_TYPE'
,p_button_condition2=>'edit'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(88143658068819987542)
,p_branch_action=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(87935280227661031529)
,p_name=>'P3_USER_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(174831466583162381721)
,p_item_source_plug_id=>wwv_flow_imp.id(174831466583162381721)
,p_prompt=>'ID'
,p_source=>'USER_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>10
,p_grid_column=>2
,p_display_when=>'P3_ACTION_TYPE'
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
 p_id=>wwv_flow_imp.id(87935280359459031530)
,p_name=>'P3_USER_LOGIN'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(100319949275437935917)
,p_item_source_plug_id=>wwv_flow_imp.id(174831466583162381721)
,p_prompt=>unistr('Nazwa u\017Cytkownika (login)')
,p_source=>'USER_LOGIN'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(87935280479072031531)
,p_name=>'P3_USER_EMAIL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(100319949275437935917)
,p_item_source_plug_id=>wwv_flow_imp.id(174831466583162381721)
,p_prompt=>'Adres e-mail'
,p_source=>'USER_EMAIL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
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
 p_id=>wwv_flow_imp.id(87935280533139031532)
,p_name=>'P3_USER_NAME_SURNAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(174831466583162381721)
,p_item_source_plug_id=>wwv_flow_imp.id(174831466583162381721)
,p_prompt=>'Nazwisko / Nazwa firmy'
,p_source=>'USER_NAME_SURNAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_colspan=>5
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
 p_id=>wwv_flow_imp.id(87935280693950031533)
,p_name=>'P3_USER_FIRST_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(174831466583162381721)
,p_item_source_plug_id=>wwv_flow_imp.id(174831466583162381721)
,p_prompt=>unistr('Imi\0119')
,p_source=>'USER_FIRST_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_colspan=>5
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
 p_id=>wwv_flow_imp.id(87935280743216031534)
,p_name=>'P3_USER_TAX_ID'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(174831466583162381721)
,p_item_source_plug_id=>wwv_flow_imp.id(174831466583162381721)
,p_prompt=>'NIP/PESEL'
,p_source=>'USER_TAX_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>5
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
 p_id=>wwv_flow_imp.id(87935280882899031535)
,p_name=>'P3_USER_PHONE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(174831466583162381721)
,p_item_source_plug_id=>wwv_flow_imp.id(174831466583162381721)
,p_prompt=>'Numer telefonu'
,p_source=>'USER_PHONE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_colspan=>5
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
 p_id=>wwv_flow_imp.id(87935280931327031536)
,p_name=>'P3_USER_WHEN_ADDED'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(174831466583162381721)
,p_item_source_plug_id=>wwv_flow_imp.id(174831466583162381721)
,p_source=>'USER_WHEN_ADDED'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(87935281096780031537)
,p_name=>'P3_USER_WHO_ADDED'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(174831466583162381721)
,p_item_source_plug_id=>wwv_flow_imp.id(174831466583162381721)
,p_source=>'USER_WHO_ADDED'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(87935281190053031538)
,p_name=>'P3_USER_WHEN_MODIFIED'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(174831466583162381721)
,p_item_source_plug_id=>wwv_flow_imp.id(174831466583162381721)
,p_source=>'USER_WHEN_MODIFIED'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(87935281245289031539)
,p_name=>'P3_USER_WHO_MODIFIED'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(174831466583162381721)
,p_item_source_plug_id=>wwv_flow_imp.id(174831466583162381721)
,p_source=>'USER_WHO_MODIFIED'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(87935281362597031540)
,p_name=>'P3_USER_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(174831466583162381721)
,p_item_source_plug_id=>wwv_flow_imp.id(174831466583162381721)
,p_prompt=>'Typ'
,p_source=>'USER_TYPE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Klient;C,Pracownik;E'
,p_cHeight=>1
,p_colspan=>5
,p_grid_column=>2
,p_field_template=>wwv_flow_imp.id(86355354664424879074)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(88866110110599054020)
,p_name=>'P3_ACTION_TYPE'
,p_item_sequence=>10
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(88866110658699054025)
,p_name=>'P3_ROL_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(88866110245594054021)
,p_item_source_plug_id=>wwv_flow_imp.id(88866110245594054021)
,p_source=>'ROL_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(88866110700240054026)
,p_name=>'P3_ROL_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(88866110245594054021)
,p_item_source_plug_id=>wwv_flow_imp.id(88866110245594054021)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rol_id',
'from roles',
'where rol_id in(select ur_role_id from users_roles where ur_user_id = :P3_USER_ID and ur_end_date is null)'))
,p_item_default_type=>'SQL_QUERY_COLON'
,p_prompt=>'Rola'
,p_source=>'ROL_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rol_name, rol_id',
'from roles',
'where rol_f_active = ''Y''',
'order by rol_id asc'))
,p_field_template=>wwv_flow_imp.id(86355353371314879074)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--xlarge:t-Form-fieldContainer--radioButtonGroup'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(88866110894097054027)
,p_name=>'P3_ROL_F_ACTIVE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(88866110245594054021)
,p_item_source_plug_id=>wwv_flow_imp.id(88866110245594054021)
,p_source=>'ROL_F_ACTIVE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(88866112842272054047)
,p_name=>'P3_VALIDATION'
,p_item_sequence=>20
,p_use_cache_before_default=>'NO'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(100319949136690935916)
,p_name=>'P3_USER_CONTACT_PERSON'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(174831466583162381721)
,p_item_source_plug_id=>wwv_flow_imp.id(174831466583162381721)
,p_prompt=>'Osoba kontaktowa'
,p_source=>'USER_CONTACT_PERSON'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_field_template=>wwv_flow_imp.id(86355353371314879074)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(88143652330116987537)
,p_name=>'P3_OPER_TYPE_DA'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P3_OPER_TYPE'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'JSON.stringify(apex.item("P3_OPER_TYPE").getValue()) === JSON.stringify(["D", "R"])'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88143652817401987538)
,p_event_id=>wwv_flow_imp.id(88143652330116987537)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'console.log("Chosen type: ", apex.item("P3_OPER_TYPE").getValue());'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88143653895839987538)
,p_event_id=>wwv_flow_imp.id(88143652330116987537)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>'Wybierz tylko jeden typ operacji'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88143653340929987538)
,p_event_id=>wwv_flow_imp.id(88143652330116987537)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_OPER_TYPE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(88143656043178987540)
,p_name=>'P3_OPER_CL_ID_DA'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P3_OPER_CL_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88143656591635987540)
,p_event_id=>wwv_flow_imp.id(88143656043178987540)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'console.log(''Chosen client: '', $(''#P3_OPER_CL_ID'').val());'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(88143655193401987539)
,p_name=>'HIDE_T_PROD_DA'
,p_event_sequence=>80
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(88143650324937987535)
,p_name=>'CREATE_DA'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(88143638695456987504)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89498804095830142407)
,p_event_id=>wwv_flow_imp.id(88143650324937987535)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_VALIDATION'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'0'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P3_USER_NAME_SURNAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89498803770053142404)
,p_event_id=>wwv_flow_imp.id(88143650324937987535)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(',
'    ''START P3_VALIDATION = '', $v("P3_VALIDATION")//,',
'    //''TEST ADDING 1 TO P3_VALIDATION = '', (Number($v("P3_VALIDATION")) + 1)',
');'))
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88866112591526054044)
,p_event_id=>wwv_flow_imp.id(88143650324937987535)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>unistr('Nazwa nie mo\017Ce by\0107 pusta')
,p_attribute_03=>'warning'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P3_USER_NAME_SURNAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88866112920678054048)
,p_event_id=>wwv_flow_imp.id(88143650324937987535)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_VALIDATION'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'(Number($v("P3_VALIDATION")) + 1)'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P3_USER_NAME_SURNAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89498803878565142405)
,p_event_id=>wwv_flow_imp.id(88143650324937987535)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(',
'    ''1 P3_VALIDATION = '', $v("P3_VALIDATION")',
');'))
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88866112603854054045)
,p_event_id=>wwv_flow_imp.id(88143650324937987535)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>unistr('NIP/PESEL nie mo\017Ce by\0107 pusty')
,p_attribute_03=>'warning'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P3_USER_TAX_ID'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89498803407810142401)
,p_event_id=>wwv_flow_imp.id(88143650324937987535)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_VALIDATION'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'(Number($v("P3_VALIDATION")) + 1)'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P3_USER_TAX_ID'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89498803909735142406)
,p_event_id=>wwv_flow_imp.id(88143650324937987535)
,p_event_result=>'TRUE'
,p_action_sequence=>110
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(',
'    ''2 P3_VALIDATION = '', $v("P3_VALIDATION")',
');'))
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88866112780128054046)
,p_event_id=>wwv_flow_imp.id(88143650324937987535)
,p_event_result=>'TRUE'
,p_action_sequence=>120
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>unistr('Numer telefonu nie mo\017Ce by\0107 pusty')
,p_attribute_03=>'warning'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P3_USER_PHONE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89498803574262142402)
,p_event_id=>wwv_flow_imp.id(88143650324937987535)
,p_event_result=>'TRUE'
,p_action_sequence=>140
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_VALIDATION'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'(Number($v("P3_VALIDATION")) + 1)'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P3_USER_PHONE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89498804256715142409)
,p_event_id=>wwv_flow_imp.id(88143650324937987535)
,p_event_result=>'TRUE'
,p_action_sequence=>150
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(',
'    ''3 P3_VALIDATION = '', $v("P3_VALIDATION")',
');'))
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89498804342056142410)
,p_event_id=>wwv_flow_imp.id(88143650324937987535)
,p_event_result=>'TRUE'
,p_action_sequence=>160
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>unistr('Przynajmniej jedna rola musi by\0107 przypisana do u\017Cytkownika')
,p_attribute_03=>'warning'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P3_ROL_NAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89498804179325142408)
,p_event_id=>wwv_flow_imp.id(88143650324937987535)
,p_event_result=>'TRUE'
,p_action_sequence=>170
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_VALIDATION'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'(Number($v("P3_VALIDATION")) + 1)'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P3_ROL_NAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89498803631128142403)
,p_event_id=>wwv_flow_imp.id(88143650324937987535)
,p_event_result=>'TRUE'
,p_action_sequence=>180
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//console.log(''Roles = '', $v("P3_ROL_NAME"));',
'console.log(''END P3_VALIDATION = '', $v("P3_VALIDATION"));'))
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89498804554443142412)
,p_event_id=>wwv_flow_imp.id(88143650324937987535)
,p_event_result=>'TRUE'
,p_action_sequence=>210
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'PKG_USERS_AND_ROLES.add_user_with_roles(',
'    p_name_surname => :P3_USER_NAME_SURNAME,',
'    p_first_name => :P3_USER_FIRST_NAME,',
'    p_tax_id => :P3_USER_TAX_ID,',
'    p_phone => :P3_USER_PHONE,',
'    p_contact_person => :P3_USER_CONTACT_PERSON,',
'    p_user_type => :P3_USER_TYPE,',
'    p_user_login => :P3_USER_LOGIN,',
'    p_user_email => :P3_USER_EMAIL,',
'    p_roles => :P3_ROL_NAME',
');'))
,p_attribute_02=>'P3_USER_NAME_SURNAME,P3_USER_FIRST_NAME,P3_USER_TAX_ID,P3_USER_PHONE,P3_USER_CONTACT_PERSON,P3_USER_TYPE,P3_USER_LOGIN,P3_USER_EMAIL,P3_ROL_NAME'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P3_VALIDATION'
,p_client_condition_expression=>'4'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89498804793262142414)
,p_event_id=>wwv_flow_imp.id(88143650324937987535)
,p_event_result=>'TRUE'
,p_action_sequence=>220
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.navigation.dialog.close(true); ',
'',
'parent.apex.region("T_USERS_STATIC_ID").refresh();',
'parent.apex.region("T_USERS_ROLES_STATIC_ID").refresh();',
unistr('parent.apex.message.showPageSuccess("Nowy u\017Cytkownik zosta\0142 dodany");')))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(89498806371972142430)
,p_name=>'SAVE_DA'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(88143638124757987504)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89498806492552142431)
,p_event_id=>wwv_flow_imp.id(89498806371972142430)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_VALIDATION'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'0'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P3_USER_NAME_SURNAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89498806511477142432)
,p_event_id=>wwv_flow_imp.id(89498806371972142430)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(',
'    ''START P3_VALIDATION = '', $v("P3_VALIDATION")//,',
'    //''TEST ADDING 1 TO P3_VALIDATION = '', (Number($v("P3_VALIDATION")) + 1)',
');'))
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89498806618926142433)
,p_event_id=>wwv_flow_imp.id(89498806371972142430)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>unistr('Nazwa nie mo\017Ce by\0107 pusta')
,p_attribute_03=>'warning'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P3_USER_NAME_SURNAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89498806713643142434)
,p_event_id=>wwv_flow_imp.id(89498806371972142430)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_VALIDATION'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'(Number($v("P3_VALIDATION")) + 1)'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P3_USER_NAME_SURNAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89498806873472142435)
,p_event_id=>wwv_flow_imp.id(89498806371972142430)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(',
'    ''1 P3_VALIDATION = '', $v("P3_VALIDATION")',
');'))
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89498806976368142436)
,p_event_id=>wwv_flow_imp.id(89498806371972142430)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>unistr('NIP/PESEL nie mo\017Ce by\0107 pusty')
,p_attribute_03=>'warning'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P3_USER_TAX_ID'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89498807071845142437)
,p_event_id=>wwv_flow_imp.id(89498806371972142430)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_VALIDATION'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'(Number($v("P3_VALIDATION")) + 1)'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P3_USER_TAX_ID'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89498807133943142438)
,p_event_id=>wwv_flow_imp.id(89498806371972142430)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(',
'    ''2 P3_VALIDATION = '', $v("P3_VALIDATION")',
');'))
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89498807222600142439)
,p_event_id=>wwv_flow_imp.id(89498806371972142430)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>unistr('Numer telefonu nie mo\017Ce by\0107 pusty')
,p_attribute_03=>'warning'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P3_USER_PHONE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89498807398239142440)
,p_event_id=>wwv_flow_imp.id(89498806371972142430)
,p_event_result=>'TRUE'
,p_action_sequence=>110
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_VALIDATION'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'(Number($v("P3_VALIDATION")) + 1)'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P3_USER_PHONE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89498807454971142441)
,p_event_id=>wwv_flow_imp.id(89498806371972142430)
,p_event_result=>'TRUE'
,p_action_sequence=>120
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(',
'    ''3 P3_VALIDATION = '', $v("P3_VALIDATION")',
');'))
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89498807525459142442)
,p_event_id=>wwv_flow_imp.id(89498806371972142430)
,p_event_result=>'TRUE'
,p_action_sequence=>130
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>unistr('Przynajmniej jedna rola musi by\0107 przypisana do u\017Cytkownika')
,p_attribute_03=>'warning'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P3_ROL_NAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89498807644235142443)
,p_event_id=>wwv_flow_imp.id(89498806371972142430)
,p_event_result=>'TRUE'
,p_action_sequence=>140
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_VALIDATION'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'(Number($v("P3_VALIDATION")) + 1)'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P3_ROL_NAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89498807718034142444)
,p_event_id=>wwv_flow_imp.id(89498806371972142430)
,p_event_result=>'TRUE'
,p_action_sequence=>150
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//console.log(''Roles = '', $v("P3_ROL_NAME"));',
'console.log(''END P3_VALIDATION = '', $v("P3_VALIDATION"));'))
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89498807814791142445)
,p_event_id=>wwv_flow_imp.id(89498806371972142430)
,p_event_result=>'TRUE'
,p_action_sequence=>160
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'PKG_USERS_AND_ROLES.edit_user_with_roles(',
'    p_user_id => :P3_USER_ID,',
'    p_name_surname => :P3_USER_NAME_SURNAME,',
'    p_first_name => :P3_USER_FIRST_NAME,',
'    p_tax_id => :P3_USER_TAX_ID,',
'    p_phone => :P3_USER_PHONE,',
'    p_contact_person => :P3_USER_CONTACT_PERSON,',
'    p_user_type => :P3_USER_TYPE,',
'    p_user_login => :P3_USER_LOGIN,',
'    p_user_email => :P3_USER_EMAIL,',
'    p_roles => :P3_ROL_NAME',
');'))
,p_attribute_02=>'P3_USER_ID,P3_USER_NAME_SURNAME,P3_USER_FIRST_NAME,P3_USER_TAX_ID,P3_USER_PHONE,P3_USER_CONTACT_PERSON,P3_USER_TYPE,P3_USER_LOGIN,P3_USER_EMAIL,P3_ROL_NAME'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P3_VALIDATION'
,p_client_condition_expression=>'4'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89498807993794142446)
,p_event_id=>wwv_flow_imp.id(89498806371972142430)
,p_event_result=>'TRUE'
,p_action_sequence=>170
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.navigation.dialog.close(true); ',
'',
'parent.apex.region("T_USERS_STATIC_ID").refresh();',
'parent.apex.region("T_USERS_ROLES_STATIC_ID").refresh();',
unistr('parent.apex.message.showPageSuccess("U\017Cytkownik zosta\0142 zmodyfikowany");')))
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P3_VALIDATION'
,p_client_condition_expression=>'4'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(88143654270687987538)
,p_name=>'P3_OPER_RECEIVE_DATE_DA'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P3_OPER_RECEIVE_DATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88143654701758987539)
,p_event_id=>wwv_flow_imp.id(88143654270687987538)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'console.log(''Chosen date: '', $(''#P3_OPER_RECEIVE_DATE'').val());'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(88866109968963054018)
,p_name=>'CANCEL_DA'
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(88143637237770987503)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88866110018187054019)
,p_event_id=>wwv_flow_imp.id(88866109968963054018)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.dialog.close(true);'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(89498808096595142447)
,p_name=>'DELETE_DA'
,p_event_sequence=>130
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(88143637725169987504)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89498808396317142450)
,p_event_id=>wwv_flow_imp.id(89498808096595142447)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'console.log(''P3_USER_ID = '', $v("P3_USER_ID"));'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89498808161126142448)
,p_event_id=>wwv_flow_imp.id(89498808096595142447)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    PKG_USERS_AND_ROLES.delete_user_with_roles(p_user_id => :P3_USER_ID);',
'END;'))
,p_attribute_02=>'P3_USER_ID'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(89498808279763142449)
,p_event_id=>wwv_flow_imp.id(89498808096595142447)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.navigation.dialog.close(true); ',
'',
'parent.apex.region("T_USERS_STATIC_ID").refresh();',
unistr('parent.apex.message.showPageSuccess("U\017Cytkownik zosta\0142 usuni\0119ty");')))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(88143642725842987516)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(174831466583162381721)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Operation-actions'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>88143642725842987516
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(88143642328312987516)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(174831466583162381721)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Operation-actions'
,p_internal_uid=>88143642328312987516
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(88866110567944054024)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(88866110245594054021)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form User-actions'
,p_internal_uid=>88866110567944054024
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(88143649913365987533)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'insert_operation'
,p_process_sql_clob=>'pkg_operations.insert_operation;'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>88143649913365987533
);
wwv_flow_imp.component_end;
end;
/
