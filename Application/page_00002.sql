prompt --application/pages/page_00002
begin
--   Manifest
--     PAGE: 00002
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
 p_id=>2
,p_name=>'Operation-actions'
,p_alias=>'OPERATION-ACTIONS'
,p_page_mode=>'MODAL'
,p_step_title=>'Operacja magazynowa'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(86687830094254394233)
,p_plug_name=>'Operation-add'
,p_title=>unistr('Formularz przyj\0119cia/wydania')
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>190
,p_location=>null
,p_plug_required_role=>wwv_flow_imp.id(94328010432251071261)
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P2_ACTION_TYPE'
,p_plug_display_when_cond2=>'add'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(86385187644572791315)
,p_plug_name=>'operation_details'
,p_title=>'operation_details'
,p_parent_plug_id=>wwv_flow_imp.id(86687830094254394233)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody:margin-top-lg:margin-bottom-lg:margin-left-lg:margin-right-lg'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>50
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(91780469043484158541)
,p_plug_name=>'Edit_by_whman'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>140
,p_location=>null
,p_plug_required_role=>wwv_flow_imp.id(94328038327426073459)
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P2_ACTION_TYPE = ''edit'' and :P2_OPER_STATUS = ''Nowa'''
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92061752365042505505)
,p_plug_name=>'status_start'
,p_parent_plug_id=>wwv_flow_imp.id(91780469043484158541)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source=>unistr('<h3 style="text-align: center;">Rozpocz\0119cie operacji magazynowej</h3>')
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P2_WH_START IS NULL AND :P2_WH_END IS NULL'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92061752452247505506)
,p_plug_name=>'status_end'
,p_parent_plug_id=>wwv_flow_imp.id(91780469043484158541)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source=>unistr('<h3 style="text-align: center;">Zako\0144czenie operacji magazynowej</h3>')
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P2_WH_START IS NOT NULL AND :P2_WH_END IS NULL'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92061752658664505508)
,p_plug_name=>'status_no_action_possible'
,p_parent_plug_id=>wwv_flow_imp.id(91780469043484158541)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source=>unistr('<h3 style="text-align: center;">Nie mo\017Cna zmieni\0107 statusu zako\0144czonej operacji magazynowej</h3>')
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P2_WH_START IS NOT NULL AND :P2_WH_END IS NOT NULL'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92061752767247505509)
,p_plug_name=>'Edit_by_logist'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>150
,p_location=>null
,p_plug_required_role=>wwv_flow_imp.id(94328010432251071261)
,p_plug_display_condition_type=>'FUNCTION_BODY'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'v_start TIMESTAMP;',
'v_end TIMESTAMP;',
'v_status CHAR(2 CHAR);',
'BEGIN',
'    if (:P2_ACTION_TYPE not in(''add'', ''edit_on_calendar'')) then',
'        SELECT oper_wh_start_date_time, oper_wh_end_date_time, oper_status',
'        INTO v_start, v_end, v_status',
'        FROM operations',
'        WHERE oper_id = :P2_OPER_ID;',
'',
'        IF v_start IS NULL AND v_end IS NULL AND v_status NOT IN(''LH'', ''PH'') THEN',
'            RETURN TRUE;',
'        ELSE',
'            RETURN FALSE;',
'        END IF;',
'    else',
'        return false;',
'    end if;',
'END;'))
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92061752856358505510)
,p_plug_name=>'oper_cancel'
,p_parent_plug_id=>wwv_flow_imp.id(92061752767247505509)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source=>'<h2 style="text-align: center;">Anulowanie operacji magazynowej</h2>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(92745365445112017336)
,p_plug_name=>'Report'
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--info:t-Alert--removeHeading js-removeLandmark'
,p_plug_template=>wwv_flow_imp.id(86355210226798879011)
,p_plug_display_sequence=>120
,p_plug_grid_column_span=>8
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P2_ACTION_TYPE = ''edit''',
'--and :P2_OPER_STATUS not in(''Do zatwierdzenia'', ''Niezatwierdzona kompletacja'')'))
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(95211179075066867835)
,p_plug_name=>'Edit_by_whmngr-edit_oper_on_calendar'
,p_title=>'Operacja'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>180
,p_location=>null
,p_plug_required_role=>wwv_flow_imp.id(94328862025724775021)
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P2_ACTION_TYPE'
,p_plug_display_when_cond2=>'edit_on_calendar'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(99791297057505863103)
,p_plug_name=>'No_action_possible'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>130
,p_location=>null
,p_plug_display_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_plug_display_when_condition=>'P2_OPER_STATUS'
,p_plug_display_when_cond2=>unistr('Niezatwierdzona kompletacja:Zako\0144czona')
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(104325429296871213501)
,p_plug_name=>'operation_closed'
,p_parent_plug_id=>wwv_flow_imp.id(99791297057505863103)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source=>unistr('<h3 style="text-align: center;">Nie mo\017Cna wykona\0107 akcji dla zako\0144czonej operacji magazynowej</h3>')
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P2_OPER_STATUS'
,p_plug_display_when_cond2=>unistr('Zako\0144czona')
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(104325429437856213503)
,p_plug_name=>'operation_wo_acceptance'
,p_parent_plug_id=>wwv_flow_imp.id(99791297057505863103)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source=>unistr('<h3 style="text-align: center;">Nie mo\017Cna wykona\0107 akcji dla operacji za\0142adunku przed zatwierdzeniem/odrzuceniem operacji kompletacji </h3>')
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P2_OPER_STATUS'
,p_plug_display_when_cond2=>'Niezatwierdzona kompletacja'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(99791297706966863110)
,p_plug_name=>'Accept_picking'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>160
,p_location=>null
,p_plug_required_role=>wwv_flow_imp.id(94328862025724775021)
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P2_ACTION_TYPE = ''edit'' and :P2_OPER_STATUS = ''Do zatwierdzenia'''
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(185142182269382158979)
,p_plug_name=>'Edit_by_whmngr'
,p_title=>'Operacja'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(86355282131832879041)
,p_plug_display_sequence=>170
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    OPER_ID,',
'    OPER_RECEIVE_DATE_TIME,',
'    OPER_PLANNED_DATE_TIME,',
'    OPER_CL_ID,',
'    OPER_EMP_ID,',
'    OPER_WH_START_DATE_TIME,',
'    OPER_WH_END_DATE_TIME,',
'    OPER_WH_OPTIMUM_TIME,',
'    case OPER_STATUS',
'        when ''C'' then ''Anulowana''',
unistr('        when ''D'' then ''Zako\0144czona'''),
'        when ''N'' then ''Nowa''',
'        when ''PH'' then ''Do zatwierdzenia''',
'        when ''LH'' then ''Niezatwierdzona''',
unistr('        when ''RH'' then ''Przed optymalizacj\0105'''),
'        else ''Nieznany''',
'    end oper_status,',
'    case OPER_TYPE',
'        when ''D'' then ''Dostawa''',
unistr('        when ''L'' then ''Za\0142adunek'''),
'        when ''P'' then ''Kompletacja''',
'        when ''R'' then ''Wydanie''',
unistr('        when ''T'' then ''Przesuni\0119cie'''),
'        else ''Nieznany''',
'    end oper_type,',
'    OPER_PARENT_ID',
'from OPERATIONS'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_required_role=>wwv_flow_imp.id(94328862025724775021)
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>unistr(':P2_ACTION_TYPE = ''edit'' and :P2_OPER_STATUS not in(''Do zatwierdzenia'', ''Niezatwierdzona kompletacja'', ''Zako\0144czona'')')
,p_plug_display_when_cond2=>'PLSQL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(93361716108780000464)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(99791297706966863110)
,p_button_name=>'DECLINE_PICKING_BTN'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--gapRight'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_image_alt=>unistr('Odrzu\0107')
,p_button_position=>'CHANGE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(104325429668246213505)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(185142182269382158979)
,p_button_name=>'DO_NOT_OPTIM_1'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nie optymalizuj'
,p_button_position=>'CHANGE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P2_OPER_STATUS'
,p_button_condition2=>unistr('Przed optymalizacj\0105')
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(93361716505816000464)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(185142182269382158979)
,p_button_name=>'SAVE_1'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Zapisz zmiany'
,p_button_position=>'CHANGE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P2_ACTION_TYPE = ''edit'' and :P2_OPER_STATUS != ''Do zatwierdzenia'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(86687835556755394238)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(91780469043484158541)
,p_button_name=>'SAVE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Potwierd\017A')
,p_button_position=>'CHANGE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P2_WH_END'
,p_button_condition_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(95211179910051867844)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(95211179075066867835)
,p_button_name=>'SAVE_4'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Zapisz zmiany'
,p_button_position=>'CHANGE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(91780469386324158544)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(92061752767247505509)
,p_button_name=>'SAVE_2'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_image_alt=>unistr('Potwierd\017A')
,p_button_position=>'CHANGE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(92061752908685505511)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(92061752767247505509)
,p_button_name=>'CANCEL_2'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_image_alt=>'Anuluj'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(99791298006961863113)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(99791297706966863110)
,p_button_name=>'CANCEL_BTN'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_image_alt=>'Anuluj'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(93361715718391000464)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(185142182269382158979)
,p_button_name=>'CANCEL_1'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_image_alt=>'Anuluj'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(95211179630222867841)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(95211179075066867835)
,p_button_name=>'CANCEL_4'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_image_alt=>'Anuluj'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(86687834582756394237)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(91780469043484158541)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_image_alt=>'Anuluj'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(91780469852119158549)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(86687830094254394233)
,p_button_name=>'CANCEL_3'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_image_alt=>'Anuluj'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(99791297180542863104)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(99791297057505863103)
,p_button_name=>'CANCEL_5'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_image_alt=>'Anuluj'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(99791297672953863109)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(99791297706966863110)
,p_button_name=>'ACCEPT_PICKING_BTN'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Zaakceptuj'
,p_button_position=>'CREATE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(94844811389416385421)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(86687830094254394233)
,p_button_name=>'CREATE_3'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Dalej'
,p_button_position=>'CREATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(92061753403390505516)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(92745365445112017336)
,p_button_name=>'DOWNLOAD_OPER_REPORT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_image_alt=>unistr('Pobierz list\0119 produkt\00F3w')
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(94844812392980385431)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(92745365445112017336)
,p_button_name=>'DOWNLOAD_WH_REPORT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(86355355813520879075)
,p_button_image_alt=>unistr('Pobierz list\0119 magazynow\0105')
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P2_WH_START is not null'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>'!'||wwv_flow_imp.id(94328010432251071261)
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(94844811912722385427)
,p_branch_name=>'Go To Page 12'
,p_branch_action=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:12:P12_OPER_TYPE,P12_OPER_CL_ID,P12_OPER_DATE_TIME:&P2_OPER_TYPE.,&P2_OPER_CL_ID.,&P2_OPER_PLANNED_DATE_TIME.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(94844811389416385421)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(86687830747488394235)
,p_name=>'P2_OPER_TYPE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(86385187644572791315)
,p_prompt=>'Typ operacji'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Dostawa;D,Wydanie;R'
,p_field_template=>wwv_flow_imp.id(86355354664424879074)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk:t-Form-fieldContainer--xlarge:t-Form-fieldContainer--radioButtonGroup'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(86687831117747394235)
,p_name=>'P2_OPER_PLANNED_DATE_TIME'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(86385187644572791315)
,p_prompt=>'Data dostawy/wydania'
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_source=>'P2_CALENDAR_MIN_DATE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_field_template=>wwv_flow_imp.id(86355354664424879074)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--indicatorAsterisk'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'ITEM',
  'min_item', 'P2_CALENDAR_MIN_DATE',
  'multiple_months', 'N',
  'show_time', 'Y',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(87935277502384031502)
,p_name=>'P2_OPER_CL_ID'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(86385187644572791315)
,p_prompt=>'Klient'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    user_id || '' - '' || user_name_surname as displayValue,',
'    user_id as returnValue',
'from users',
'where user_type = ''C''',
'order by user_id'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(86355354664424879074)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--indicatorAsterisk'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91780468974472158540)
,p_name=>'P2_ACTION_TYPE'
,p_item_sequence=>10
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(91780469134178158542)
,p_name=>'P2_WH_START'
,p_item_sequence=>30
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(92061752574198505507)
,p_name=>'P2_WH_END'
,p_item_sequence=>40
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(93366190943637737632)
,p_name=>'P2_OPER_STATUS'
,p_item_sequence=>50
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(93366191477590737637)
,p_name=>'P2_VALIDATION'
,p_item_sequence=>60
,p_use_cache_before_default=>'NO'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(95211179184003867836)
,p_name=>'P2_OPER_ID_2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(95211179075066867835)
,p_prompt=>'ID operacji'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(86355353371314879074)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(95211179229318867837)
,p_name=>'P2_OPER_PLANNED_DATE_TIME_2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(95211179075066867835)
,p_prompt=>'Planowana data'
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(86355354664424879074)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'Y',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(95211179351915867838)
,p_name=>'P2_OPER_WH_OPTIMUM_TIME_2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(95211179075066867835)
,p_use_cache_before_default=>'NO'
,p_item_default=>'60'
,p_prompt=>'Przewidywany czas [m]'
,p_source=>'select oper_wh_optimum_time from operations where oper_id = :P2_OPER_ID_2'
,p_source_type=>'QUERY'
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
,p_field_template=>wwv_flow_imp.id(86355354664424879074)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(95211179533303867840)
,p_name=>'P2_OPER_EMP_ID_2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(95211179075066867835)
,p_prompt=>'ID magazyniera'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select user_id || '' - '' || user_name_surname || '' '' || user_first_name, user_id',
'from users',
'where user_id in(select ur_user_id from users_roles where ur_role_id = 3)',
'order by user_id'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(86355353371314879074)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99384722961052566401)
,p_name=>'P2_CALENDAR_MIN_DATE'
,p_item_sequence=>70
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(',
'        cast(trunc(sysdate+1) + interval ''6'' hour as timestamp),',
'        ''DD-Mon-YYYY HH24:MI:SS''',
'    )',
'from dual'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99414175673454214108)
,p_name=>'P2_OPER_ID'
,p_item_sequence=>80
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99414175794880214109)
,p_name=>'P2_OPER_EMP_ID'
,p_item_sequence=>100
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99791297525017863108)
,p_name=>'P2_PARENT_OPER_ID_1'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(185142182269382158979)
,p_item_source_plug_id=>wwv_flow_imp.id(185142182269382158979)
,p_prompt=>unistr('ID powi\0105zanej operacji')
,p_source=>'OPER_PARENT_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>5
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
 p_id=>wwv_flow_imp.id(99791298346529863116)
,p_name=>'P2_PICKING_DETAILS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(99791297706966863110)
,p_prompt=>unistr('Szczeg\00F3\0142y operacji kompletacji')
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    ''ID ''||oper_id',
'    ||'', w dniu ''||oper_planned_date_time',
'    ||'' (''||oper_wh_optimum_time||'' minut)  |  ID magazyniera: ''||oper_emp_id',
'from operations',
'where oper_id = :P2_OPER_ID'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>10
,p_grid_column=>2
,p_field_template=>wwv_flow_imp.id(86355353371314879074)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99791298416216863117)
,p_name=>'P2_LOADING_DETAILS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(99791297706966863110)
,p_prompt=>unistr('Szczeg\00F3\0142y operacji za\0142adunku')
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    ''ID ''||oper_id',
'    ||'', w dniu ''||oper_planned_date_time',
'    ||'' (''||oper_wh_optimum_time||'' minut)  |  ID magazyniera: ''||oper_emp_id',
'from operations',
'where oper_id = (select oper_parent_id from operations where oper_id = :P2_OPER_ID)'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>10
,p_grid_column=>2
,p_field_template=>wwv_flow_imp.id(86355353371314879074)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(100190213560556284313)
,p_name=>'P2_OPER_PARENT_ID'
,p_item_sequence=>90
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(104325429566287213504)
,p_name=>'P2_OPER_STATUS_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(185142182269382158979)
,p_item_source_plug_id=>wwv_flow_imp.id(185142182269382158979)
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
 p_id=>wwv_flow_imp.id(105675268538362058503)
,p_name=>'P2_METHOD_ERROR'
,p_item_sequence=>110
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(185142184311403158985)
,p_name=>'P2_OPER_ID_1'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(185142182269382158979)
,p_item_source_plug_id=>wwv_flow_imp.id(185142182269382158979)
,p_prompt=>'ID operacji'
,p_source=>'OPER_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>5
,p_grid_column=>2
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
 p_id=>wwv_flow_imp.id(185142184376676158986)
,p_name=>'P2_OPER_TYPE_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(185142182269382158979)
,p_item_source_plug_id=>wwv_flow_imp.id(185142182269382158979)
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
 p_id=>wwv_flow_imp.id(185142184442770158987)
,p_name=>'P2_OPER_RECEIVE_DATE_TIME_1'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(185142182269382158979)
,p_item_source_plug_id=>wwv_flow_imp.id(185142182269382158979)
,p_source=>'OPER_RECEIVE_DATE_TIME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(185142184597979158988)
,p_name=>'P2_OPER_PLANNED_DATE_TIME_1'
,p_source_data_type=>'TIMESTAMP'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(185142182269382158979)
,p_item_source_plug_id=>wwv_flow_imp.id(185142182269382158979)
,p_prompt=>'Planowana data'
,p_format_mask=>'DD-MON-YYYY HH24:MI'
,p_source=>'OPER_PLANNED_DATE_TIME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_colspan=>5
,p_grid_column=>2
,p_field_template=>wwv_flow_imp.id(86355354664424879074)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'ITEM',
  'min_item', 'P2_CALENDAR_MIN_DATE',
  'multiple_months', 'N',
  'show_time', 'Y',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(185142184678847158989)
,p_name=>'P2_OPER_CL_ID_1'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(185142182269382158979)
,p_item_source_plug_id=>wwv_flow_imp.id(185142182269382158979)
,p_source=>'OPER_CL_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(185142184809672158990)
,p_name=>'P2_OPER_EMP_ID_1'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(185142182269382158979)
,p_item_source_plug_id=>wwv_flow_imp.id(185142182269382158979)
,p_prompt=>'ID magazyniera'
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
 p_id=>wwv_flow_imp.id(185142184864393158991)
,p_name=>'P2_OPER_WH_START_DATE_TIME'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(185142182269382158979)
,p_item_source_plug_id=>wwv_flow_imp.id(185142182269382158979)
,p_source=>'OPER_WH_START_DATE_TIME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(185142184954739158992)
,p_name=>'P2_OPER_WH_END_DATE_TIME'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(185142182269382158979)
,p_item_source_plug_id=>wwv_flow_imp.id(185142182269382158979)
,p_source=>'OPER_WH_END_DATE_TIME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(185142185059761158993)
,p_name=>'P2_OPER_WH_OPTIMUM_TIME'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(185142182269382158979)
,p_item_source_plug_id=>wwv_flow_imp.id(185142182269382158979)
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
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_field_template=>wwv_flow_imp.id(86355354664424879074)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(87935277603205031503)
,p_name=>'P2_OPER_CL_ID_DA'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2_OPER_CL_ID'
,p_condition_element=>'P2_OPER_TYPE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'D'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_required_patch=>wwv_flow_imp.id(86354378099415878996)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(87935277787617031504)
,p_event_id=>wwv_flow_imp.id(87935277603205031503)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'console.log(''Chosen client: '', $(''#P2_OPER_CL_ID'').val());'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(88704575682717496011)
,p_name=>'CANCEL_DA'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(86687834582756394237)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88704576032571496013)
,p_event_id=>wwv_flow_imp.id(88704575682717496011)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.dialog.close(true);'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(99791297276268863105)
,p_name=>'CANCEL_DA_5'
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(99791297180542863104)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(99791297376753863106)
,p_event_id=>wwv_flow_imp.id(99791297276268863105)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.dialog.close(true);'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92745366815968017350)
,p_name=>'CANCEL_DA_1'
,p_event_sequence=>130
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(93361715718391000464)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(93366187835406737601)
,p_event_id=>wwv_flow_imp.id(92745366815968017350)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.dialog.close(true);'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(99791298160420863114)
,p_name=>'CANCEL_BTN_DA'
,p_event_sequence=>140
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(99791298006961863113)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(99791298235119863115)
,p_event_id=>wwv_flow_imp.id(99791298160420863114)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.dialog.close(true);'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(95211179752027867842)
,p_name=>'CANCEL_DA_4'
,p_event_sequence=>150
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(95211179630222867841)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(95211179897029867843)
,p_event_id=>wwv_flow_imp.id(95211179752027867842)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.dialog.close(true);'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92745365636947017338)
,p_name=>'CANCEL_DA_2'
,p_event_sequence=>160
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(92061752908685505511)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92745365720204017339)
,p_event_id=>wwv_flow_imp.id(92745365636947017338)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.dialog.close(true);'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(91780469994381158550)
,p_name=>'CANCEL_DA_3'
,p_event_sequence=>170
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(91780469852119158549)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92061751941821505501)
,p_event_id=>wwv_flow_imp.id(91780469994381158550)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.dialog.close(true);'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(88532637301058357443)
,p_name=>'PRODUCTS_LIST_JSON_DA'
,p_event_sequence=>180
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2_PRODUCTS_LIST_JSON'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_required_patch=>wwv_flow_imp.id(86354378099415878996)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88532637429342357444)
,p_event_id=>wwv_flow_imp.id(88532637301058357443)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'console.log(''P2_PRODUCTS_LIST_JSON = '', $v(''P2_PRODUCTS_LIST_JSON''));'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92061752043217505502)
,p_name=>'SAVE_DA'
,p_event_sequence=>190
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(86687835556755394238)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(94163129432159882504)
,p_event_id=>wwv_flow_imp.id(92061752043217505502)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'console.log('':P2_WH_START = '', $v("P2_WH_START"));'
,p_build_option_id=>wwv_flow_imp.id(86354378099415878996)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(105675268773255058505)
,p_event_id=>wwv_flow_imp.id(92061752043217505502)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'apex_util.set_session_state(''P2_METHOD_ERROR'', null);'
,p_attribute_02=>'P2_METHOD_ERROR'
,p_attribute_03=>'P2_METHOD_ERROR'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92061752129504505503)
,p_event_id=>wwv_flow_imp.id(92061752043217505502)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P2_METHOD_ERROR := PKG_OPERATIONS.edit_oper_as_whman(',
'        p_oper_id => :P2_OPER_ID,',
'        p_action => case when :P2_WH_START is null then ''start'' else ''end'' end',
'    );'))
,p_attribute_02=>'P2_METHOD_ERROR ,P2_WH_START'
,p_attribute_03=>'P2_METHOD_ERROR'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(105675268656465058504)
,p_event_id=>wwv_flow_imp.id(92061752043217505502)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>'<div style="text-align: center;">&P2_METHOD_ERROR.</div>'
,p_attribute_03=>'danger'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P2_METHOD_ERROR'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92061752240341505504)
,p_event_id=>wwv_flow_imp.id(92061752043217505502)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.navigation.dialog.close(true); ',
'',
'parent.apex.region("T_OPERATIONS_STATIC_ID").refresh();',
unistr('parent.apex.message.showPageSuccess("Status operacji zosta\0142 zmodyfikowany");')))
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P2_METHOD_ERROR'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92745366580644017347)
,p_name=>'SAVE_DA_1'
,p_event_sequence=>200
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(93361716505816000464)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(93366187925789737602)
,p_event_id=>wwv_flow_imp.id(92745366580644017347)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>unistr('Wybierz dat\0119')
,p_attribute_03=>'danger'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P2_OPER_PLANNED_DATE_TIME_1'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92745366680153017348)
,p_event_id=>wwv_flow_imp.id(92745366580644017347)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    PKG_OPERATIONS.edit_oper_as_mngr(',
'        p_oper_id => :P2_OPER_ID_1,',
'        p_whman_id => :P2_OPER_EMP_ID_1,',
'        p_planned_date_time => TO_TIMESTAMP(:P2_OPER_PLANNED_DATE_TIME_1, ''DD-Mon-YYYY HH24:MI:SS''),',
'        p_oper_time => :P2_OPER_WH_OPTIMUM_TIME',
'    );',
'END;'))
,p_attribute_02=>'P2_OPER_ID_1,P2_OPER_EMP_ID_1,P2_OPER_PLANNED_DATE_TIME_1,P2_OPER_WH_OPTIMUM_TIME'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P2_OPER_PLANNED_DATE_TIME_1'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(92745366735181017349)
,p_event_id=>wwv_flow_imp.id(92745366580644017347)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.navigation.dialog.close(true);',
'',
'parent.apex.region("C_WORK_SCHEDULE_STATIC_ID").refresh();',
'parent.apex.region("C_WHMAN_SCHEDULE_STATIC_ID").refresh();',
'parent.apex.region("T_OPERATIONS_STATIC_ID").refresh();',
unistr('parent.apex.message.showPageSuccess("Operacja zosta\0142a zmodyfikowana");')))
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P2_OPER_PLANNED_DATE_TIME_1'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(95211180015258867845)
,p_name=>'SAVE_DA_4'
,p_event_sequence=>210
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(95211179910051867844)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(95211180121094867846)
,p_event_id=>wwv_flow_imp.id(95211180015258867845)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>unistr('Wybierz dat\0119')
,p_attribute_03=>'danger'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P2_OPER_PLANNED_DATE_TIME_2'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(95211180209607867847)
,p_event_id=>wwv_flow_imp.id(95211180015258867845)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    PKG_OPERATIONS.edit_oper_as_mngr(',
'        p_oper_id => :P2_OPER_ID_2,',
'        p_whman_id => :P2_OPER_EMP_ID_2,',
'        p_planned_date_time => TO_TIMESTAMP(:P2_OPER_PLANNED_DATE_TIME_2, ''DD-Mon-YYYY HH24:MI:SS''),',
'        p_oper_time => :P2_OPER_WH_OPTIMUM_TIME_2',
'    );',
'END;'))
,p_attribute_02=>'P2_OPER_ID_2,P2_OPER_EMP_ID_2,P2_OPER_PLANNED_DATE_TIME_2,P2_OPER_WH_OPTIMUM_TIME_2'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P2_OPER_PLANNED_DATE_TIME_2'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(95211180393739867848)
,p_event_id=>wwv_flow_imp.id(95211180015258867845)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.navigation.dialog.close(true);',
'',
'parent.apex.region("T_OPERATIONS_STATIC_ID").refresh();',
'parent.apex.region("C_WORK_SCHEDULE_STATIC_ID").refresh();',
unistr('parent.apex.message.showPageSuccess("Operacja zosta\0142a zmodyfikowana");')))
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P2_OPER_PLANNED_DATE_TIME_2'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(92061753566897505517)
,p_name=>'DOWNLOAD_OPER_REPORT_DA'
,p_event_sequence=>220
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(92061753403390505516)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(100190213711119284315)
,p_event_id=>wwv_flow_imp.id(92061753566897505517)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_PRINT_REPORT'
,p_attribute_01=>wwv_flow_imp.id(92519667736337334972)
,p_attribute_02=>'operacja_id_&P2_OPER_ID._lista_prod'
,p_attribute_03=>'ATTACHMENT'
,p_attribute_04=>'P2_OPER_ID'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(94844812493063385432)
,p_name=>'DOWNLOAD_WH_REPORT_DA'
,p_event_sequence=>240
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(94844812392980385431)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(94844812540361385433)
,p_event_id=>wwv_flow_imp.id(94844812493063385432)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_PRINT_REPORT'
,p_attribute_01=>wwv_flow_imp.id(95101413608038319038)
,p_attribute_02=>'operacja_id_&P2_OPER_ID._lista_mag'
,p_attribute_03=>'ATTACHMENT'
,p_attribute_04=>'P2_OPER_ID'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(93366189577596737618)
,p_name=>'SAVE_DA_2'
,p_event_sequence=>260
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(91780469386324158544)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(93366189623325737619)
,p_event_id=>wwv_flow_imp.id(93366189577596737618)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    PKG_OPERATIONS.edit_oper_as_logist(p_oper_id => :P2_OPER_ID);',
'end;'))
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(93366189709392737620)
,p_event_id=>wwv_flow_imp.id(93366189577596737618)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.navigation.dialog.close(true);',
'',
'parent.apex.region("T_OPERATIONS_STATIC_ID").refresh();',
unistr('parent.apex.message.showPageSuccess("Operacja zosta\0142a anulowana");')))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(99414175384782214105)
,p_name=>'CHECK_VALIDATION_ERROR'
,p_event_sequence=>270
,p_bind_type=>'bind'
,p_bind_event_type=>'apexbeforepagesubmit'
,p_required_patch=>wwv_flow_imp.id(86354378099415878996)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(94844810376062385411)
,p_event_id=>wwv_flow_imp.id(99414175384782214105)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'console.log(''Chosen type: '', $(''#P2_OPER_TYPE'').val());'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(99414175238120214104)
,p_event_id=>wwv_flow_imp.id(99414175384782214105)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'console.log(''Chosen date: '', $(''#P2_OPER_PLANNED_DATE_TIME'').val());'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(99414175442673214106)
,p_event_id=>wwv_flow_imp.id(99414175384782214105)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>'&P2_OPER_PLANNED_DATE_TIME.'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(99622972127272985104)
,p_name=>'SET_WH_START'
,p_event_sequence=>280
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_required_patch=>wwv_flow_imp.id(86354378099415878996)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(99622972226751985105)
,p_event_id=>wwv_flow_imp.id(99622972127272985104)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2_WH_START'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>'select oper_wh_start_date_time from operations where oper_id = :P2_OPER_ID'
,p_attribute_07=>'P2_OPER_ID'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(99791298598432863118)
,p_name=>'ACCEPT_PICKING_DA'
,p_event_sequence=>290
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(99791297672953863109)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(99791298642872863119)
,p_event_id=>wwv_flow_imp.id(99791298598432863118)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'PKG_SCHEDULE_OPTIM.manage_schedule_optim(',
'    p_loading_id => :P2_OPER_ID,',
'    p_f_accepted => 1',
');'))
,p_attribute_02=>'P2_OPER_ID'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(99791298980040863122)
,p_event_id=>wwv_flow_imp.id(99791298598432863118)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.navigation.dialog.close(true);',
'',
'parent.apex.region("T_HINTS_STATIC_ID").refresh();',
'parent.apex.region("C_WORK_SCHEDULE_STATIC_ID").refresh();',
'parent.apex.region("T_OPERATIONS_STATIC_ID").refresh();',
unistr('parent.apex.message.showPageSuccess("Optymalizacja systemowa zosta\0142a zaakceptowana");')))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(99791298757543863120)
,p_name=>'DECLINE_PICKING_DA'
,p_event_sequence=>300
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(93361716108780000464)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(99791298888686863121)
,p_event_id=>wwv_flow_imp.id(99791298757543863120)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'PKG_SCHEDULE_OPTIM.manage_schedule_optim(',
'    p_loading_id => :P2_OPER_ID,',
'    p_f_accepted => 0',
');'))
,p_attribute_02=>'P2_OPER_ID'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(99791299031067863123)
,p_event_id=>wwv_flow_imp.id(99791298757543863120)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.navigation.dialog.close(true);',
'',
'parent.apex.region("T_HINTS_STATIC_ID").refresh();',
'parent.apex.region("C_WORK_SCHEDULE_STATIC_ID").refresh();',
'parent.apex.region("T_OPERATIONS_STATIC_ID").refresh();',
unistr('parent.apex.message.showPageSuccess("Optymalizacja systemowa zosta\0142a odrzucona");')))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(102492416748429123501)
,p_name=>'SET_OPER_ID_FOR_PICKING'
,p_event_sequence=>310
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_display_when_cond=>'P2_OPER_PARENT_ID'
,p_da_event_comment=>'Warehouse report requires P2_OPER_ID item value even for pickings'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(100190213971444284317)
,p_event_id=>wwv_flow_imp.id(102492416748429123501)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2_OPER_ID'
,p_attribute_01=>'FUNCTION_BODY'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_oper_type varchar2(2 char);',
'v_oper_parent_id int;',
'begin',
'    select oper_type into v_oper_type',
'    from operations',
'    where oper_id = :P2_OPER_ID;',
'',
'    case v_oper_type',
'        when ''P'' then',
'            select oper_parent_id into v_oper_parent_id',
'            from operations',
'            where oper_id = :P2_OPER_ID;',
'',
'            :P2_OPER_ID := v_oper_parent_id;',
'        else',
'            null;',
'    end case;',
'',
'    return :P2_OPER_ID;',
'',
'end;'))
,p_attribute_07=>'P2_OPER_ID'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_build_option_id=>wwv_flow_imp.id(86354378099415878996)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(102492417600758123510)
,p_event_id=>wwv_flow_imp.id(102492416748429123501)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2_OPER_ID'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>':P2_OPER_PARENT_ID'
,p_attribute_07=>'P2_OPER_PARENT_ID'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(102492416983212123503)
,p_event_id=>wwv_flow_imp.id(102492416748429123501)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2_OPER_ID'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(104325429766964213506)
,p_name=>'DO_NOT_OPTIM_1_DA'
,p_event_sequence=>320
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(104325429668246213505)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(105675268854883058506)
,p_event_id=>wwv_flow_imp.id(104325429766964213506)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'apex_util.set_session_state(''P2_METHOD_ERROR'', null);'
,p_attribute_02=>'P2_METHOD_ERROR'
,p_attribute_03=>'P2_METHOD_ERROR'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(105675268971640058507)
,p_event_id=>wwv_flow_imp.id(104325429766964213506)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P2_METHOD_ERROR := PKG_OPERATIONS.update_status_oper_not_optim(:P2_OPER_ID_1);'
,p_attribute_02=>'P2_METHOD_ERROR ,P2_OPER_ID_1'
,p_attribute_03=>'P2_METHOD_ERROR'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(105675269073235058508)
,p_event_id=>wwv_flow_imp.id(104325429766964213506)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>'<div style="text-align: center;">&P2_METHOD_ERROR.</div>'
,p_attribute_03=>'danger'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P2_METHOD_ERROR'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(104325429995212213508)
,p_event_id=>wwv_flow_imp.id(104325429766964213506)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.navigation.dialog.close(true);',
'',
'parent.apex.region("C_WORK_SCHEDULE_STATIC_ID").refresh();',
'parent.apex.region("C_WHMAN_SCHEDULE_STATIC_ID").refresh();',
'parent.apex.region("T_OPERATIONS_STATIC_ID").refresh();',
unistr('parent.apex.message.showPageSuccess("Operacja zosta\0142a zmodyfikowana");')))
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'$v(''P2_OPER_PLANNED_DATE_TIME_1'') !== null && $v(''P2_METHOD_ERROR'') !== null'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(92745366499159017346)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(185142182269382158979)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Edit_by_whmngr'
,p_security_scheme=>wwv_flow_imp.id(94328862025724775021)
,p_internal_uid=>92745366499159017346
);
wwv_flow_imp.component_end;
end;
/
