prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 93334
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>85488141341783735784
,p_default_application_id=>93334
,p_default_id_offset=>0
,p_default_owner=>'WKSP_WAREHOUSE2025'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(86355472785831879191)
,p_group_name=>'Administration'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(91194007820858141501)
,p_group_name=>'User Settings'
);
wwv_flow_imp.component_end;
end;
/
