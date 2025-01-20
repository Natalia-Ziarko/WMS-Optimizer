create or replace package "PKG_HINTS" as
G_HINT_STATUS_NEW     CONSTANT CHAR(1 CHAR) := 'N';
G_HINT_STATUS_PENDING CONSTANT CHAR(1 CHAR) := 'P';
G_HINT_STATUS_CLOSED  CONSTANT CHAR(1 CHAR) := 'D';

G_T_NOT_ASSIG_OPER      CONSTANT VARCHAR2(100 CHAR) := 'Nieprzypisana operacja';
G_C_NOT_ASSIG_OPER      CONSTANT VARCHAR2(1000 CHAR) := 'Przypisz operację do magazyniera';
G_T_WO_ACCEPT_OPER      CONSTANT VARCHAR2(100 CHAR) := 'Optymalizacja oczekuje na akceptację';
G_C_WO_ACCEPT_OPER      CONSTANT VARCHAR2(1000 CHAR) := 'Zaakceptuj lub odrzuć utworzoną operację kompletacji';
G_T_OPER_DELAYED        CONSTANT VARCHAR2(100 CHAR) := 'Opóźnienie operacji';
G_T_OPER_NOT_STARTED    CONSTANT VARCHAR2(100 CHAR) := 'Operacja nierozpoczęta';
G_C_OPER_DELAYED_NOT_ST CONSTANT VARCHAR2(1000 CHAR) := 'Skontaktuj się z kierownikiem magazynu oraz poinformuj klienta o możliwym opóźnieniu. Kontakt: ';

G_T_NEW_OPER_DATE_FOR_LOGIST   CONSTANT VARCHAR2(100 CHAR) := 'Planowana data operacji została zmieniona';
G_C_WHMNGR_CONT_DET_FOR_LOGIST CONSTANT VARCHAR2(1000 CHAR) := 'Skontaktuj się z kierownikem magazynu. Dane kontaktowe: ';
G_T_NEW_OPER_DATE_FOR_WHMNGR   CONSTANT VARCHAR2(100 CHAR) := 'Zmiana godziny operacji przez klienta';
L_C_ACCEPT_NEW_PICKING         CONSTANT VARCHAR2(1000 CHAR) := '" -> Zatwierdź lub odrzuć proponowaną operację kompletacji.';

procedure change_hint_status(p_hint_id int, p_status char := null);

procedure check_not_assigned_opers;

procedure check_delayed_oper;

procedure check_opers_wo_acceptance;

procedure add_when_planned_date_changed(
    p_oper_id int,
    p_for_who_id int,
    p_new_oper_date_time timestamp := null,
    p_info_from_client varchar2 := null
    );

end "PKG_HINTS";
/