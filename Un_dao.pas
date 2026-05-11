unit Un_dao;

{- Criar no banco de dados um campo para registrar a versão atual.
 - apontar no código fonte em algum lugar a versão.

-SIGNIFICADO DAS TABELAS DE SISTEMA
RSD$RELATION_NAME  =  NOME DA TABELA
RDB$RELATION_FIELDS.RDB$FIELD_POSITION =  POSICAO,
RDB$RELATION_FIELDS.RDB$FIELD_NAME = NOME,
RDB$TYPES.RDB$TYPE_NAME = TIPO,
RDB$FIELDS.RDB$FIELD_LENGTH = TAMANHO

**criar generator
ALTER TABLE PRODUTO ADD CONSTRAINT PK_PRODUTO PRIMARY KEY (COD_PRODUTO  );

**comandos para verificar se exeste ou não a estrutura do banco de dados

-  verificar se tabela existe
ex: CREATE TABLE PRODUTO (
    COD_PRODUTO              INTEGER NOT NULL,
    NOM_PRODUTO              VARCHAR50 /* VARCHAR50 = VARCHAR(50) */,
    COD_GRUPO                INTEGER,
    UNIDADE                  CHAR(3),
    PESO                     NUMERIC(6,3) DEFAULT 0,
    REF_FABRICA              CHAR(15) COLLATE WIN_PTBR,
    COD_PRATELEIRA           CHAR10 /* CHAR10 = CHAR(10) */,
    QTD_ESTOQUE              NUMERIC(15,2) DEFAULT 0,
    QTD_ESTOQUE_MIN          NUMERIC(15,2) DEFAULT 0,
    ETIQUETA_LIN1            VARCHAR(25) COLLATE WIN_PTBR,
    ETIQUETA_LIN2            VARCHAR(25) COLLATE WIN_PTBR,
    OBSERVACAO               BLOB SUB_TYPE 1 SEGMENT SIZE 80,
    ORIGEM_MERCADORIA        CHAR(1),
    TRIB_ICMS                CHAR(2),
    IPI                      NUMERIC(15,2) DEFAULT 0,
    CUSTO                    NUMERIC(15,2) DEFAULT 0,
    IMPOSTOS                 NUMERIC(15,2) DEFAULT 0,
    GERAL                    NUMERIC(15,2) DEFAULT 0,
    OUTROS                   NUMERIC(15,2) DEFAULT 0,
    LUCRO                    NUMERIC(15,2) DEFAULT 0,
    AVISAR_PROD_DESAT        CHAR(1),
    QTD_DIAS_DESAT           SMALLINT,
    DTA_ULT_ATUALIZACAO      DATE);

}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, SToolEdit, Mask, registry,
  ComCtrls, IniFiles, DBCTRLS,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, TLHelp32, PsAPI,
  IdMessageClient, IdSMTP, IdMessage, ExtCtrls, sSkinManager, sSkinProvider,
  sCheckBox, IdAttachment, IdAttachmentFile,
  IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL, sCurrEdit, sCurrencyEdit,
  sMaskEdit, sCustomComboEdit, sEdit, sComboEdit, sComboBox,
  sGroupBox, System.Character,
  DB, IdExplicitTLSClientServerBase, IdSMTPBase,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.Comp.Client, FireDAC.Comp.ScriptCommands,
  FireDAC.Stan.Util, FireDAC.Comp.Script, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.Phys.PG, FireDAC.Phys.PGDef;

type
  Tdao = class(TForm)
    Q_insert: TFDQuery;
    Q_update: TFDQuery;
    Q1: TFDQuery;
    Q2: TFDQuery;
    Q_delete: TFDQuery;
    IB_Query1: TFDQuery;
    geral: TFDQuery;
    Exec_sql: TFDQuery;
    q_log: TFDQuery;
    Q1S: TFDQuery;
    Q2S: TFDQuery;
    Exec_sql2: TFDQuery;
    Q_atualiza_estrutura: TFDQuery;
    Q3: TFDQuery;
    GroupBox1: TGroupBox;
    Edit1: TsEdit;
    ZZfone_corretor: TMaskEdit;
    PRcod_analista: TsComboEdit;
    zzdata_proposta: TsDateEdit;
    FNvl_honorario_inspecao: TsCurrencyEdit;
    RichEdit1: TRichEdit;
    ComboBox1: TComboBox;
    GroupBox2: TGroupBox;
    q3_net: TFDQuery;
    q1_net: TFDQuery;
    q2_net: TFDQuery;
    exec_sql2_net: TFDQuery;
    exec_sql_net: TFDQuery;
    Q_update_net: TFDQuery;
    Q_insert_net: TFDQuery;
    Q_delete_net: TFDQuery;
    SMTP_suporte: TIdSMTP;
    IMmail: TIdMessage;
    sSkinProvider1: TsSkinProvider;
    SkinData1: TsSkinManager;
    Q5: TFDQuery;
    GroupBox3: TGroupBox;
    q1_frente: TFDQuery;
    q2_frente: TFDQuery;
    q3_frente: TFDQuery;
    exec_sql_frente: TFDQuery;
    exec_sql_frente2: TFDQuery;
    Q_insert_frente: TFDQuery;
    Q_update_frente: TFDQuery;
    Q_delete_frente: TFDQuery;
    GroupBox4: TGroupBox;
    q1_vendor: TFDQuery;
    q2_vendor: TFDQuery;
    q3_vendor: TFDQuery;
    exec_sql_vendor: TFDQuery;
    exec_sql_vendor2: TFDQuery;
    Q_delete_vendor: TFDQuery;
    Q_update_vendor: TFDQuery;
    Q_insert_vendor: TFDQuery;
    qrGravaFoto: TFDQuery;
    Q4: TFDQuery;
    q_nav: TFDQuery;
    CN: TFDConnection;
    CN_Export: TFDConnection;
    CN_NET: TFDConnection;
    CN_Vendor_Origem: TFDConnection;
    CN_store: TFDConnection;
    CN_Frente: TFDConnection;
    trservidor: TFDTransaction;
    tr_atualiza_estrutura: TFDTransaction;
    tr_net: TFDTransaction;
    tr: TFDTransaction;
    tr_export: TFDTransaction;
    tr_vendor: TFDTransaction;
    tr_frente: TFDTransaction;
    TRS: TFDTransaction;
    IS_IMPORTAR_DADOS: TFDScript;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    procedure Exec_sqlError(Sender: TObject; const ERRCODE: Integer;
      ErrorMessage, ErrorCodes: TStringList; const SQLCODE: Integer;
      SQLMessage, SQL: TStringList; var RaiseException: Boolean);
    procedure CNError(Sender: TObject; const ERRCODE: Integer;
      ErrorMessage, ErrorCodes: TStringList; const SQLCODE: Integer;
      SQLMessage, SQL: TStringList; var RaiseException: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure CN_ExportError(Sender: TObject; const ERRCODE: Integer;
      ErrorMessage, ErrorCodes: TStringList; const SQLCODE: Integer;
      SQLMessage, SQL: TStringList; var RaiseException: Boolean);
  private
    {variaveis}
    cmd, cmd_campos, cmd_valor, cmd_geral: string;
    procedure Reconectar;
    procedure ResetPreparedQueries;
    procedure ConfigurarExecucaoDireta;

    { Private declarations }
  public
    terminal_nfe: boolean;
    servidor_selecionado: integer;
    skin, skinPath, minaPath, NomeBanco: string;
    { Public declarations }
//    procedure iniciaCn(login, senha, caminho, servidor: String);
    procedure conf_CN; // busca os dados do arq servidor.ini e configura o CN

    function insert(prefixo, tabela, id: ShortString; form: TForm; generator:
      ShortString): ShortString;
    function insert_net(prefixo, tabela, id: ShortString; form: TForm;
      generator: ShortString): ShortString;
    function TestaConexao: boolean;

    procedure update(tabela, campo_id, id, prefixo: shortString; form: TForm);
      overload;
    procedure update_net(tabela, campo_id, id, prefixo: shortString; form:
      TForm); overload;

    procedure update(tabela, campo_id, campo_id2, id, id2, prefixo: shortString;
      form: TForm); overload;
    procedure update_net(tabela, campo_id, campo_id2, id, id2, prefixo:
      shortString; form: TForm); overload;

    procedure delete(campo_id, id, tabela: ShortString); overload;
    procedure delete_net(campo_id, id, tabela: ShortString); overload;

    procedure delete(campo_id, campo_id2, id, id2, tabela: ShortString);
      overload;
    procedure delete_net(campo_id, campo_id2, id, id2, tabela: ShortString);
      overload;

    procedure Geral1(cmd: string);
    procedure Geral2(cmd: string);
    procedure Geral3(cmd: string);
    procedure Geral4(cmd: string);
    procedure Geral5(cmd: string);
    procedure Execsql(cmd: string);
    procedure Execsql2(cmd: string);

    procedure Geral1_NET(cmd: string);
    procedure Geral2_NET(cmd: string);
    procedure Geral3_NET(cmd: string);
    procedure Execsql_NET(cmd: string);
    procedure Execsql2_NET(cmd: string);

    procedure grava_log(cmd, cod_usu: string);
    function DtaSerStr: string;
    function DtaSerDt: TDateTime;
    function HrSer: string;

    procedure mostra_campos(prefixo: ShortString; form: TForm; cmd: string);
    procedure executa_atualiza_estrutura(cmd: string);

    procedure Configura_CN_NET(cod_empresa: string);
    procedure DesabilitarTimers;
    procedure HabilitarTimers;

    procedure atu_estrutura_banco_dados;
    procedure msg(texto: string);
    procedure envia_email_suporte(corpo, assunto, end1, end2, end3, CC: string);
    //    function BuscaTroca(Text,Busca,Troca : string) : string;

    function IsNumeric(Texto: string): boolean;
  end;

var
  dao: Tdao;
  cod_usuario, nom_usuario, email_usuario, tipo_usuario: ShortString;
  cod_empresa, nom_empresa, fantasia, fone_empresa, email_empresa, tipo_empresa,
    area_atuacao, Representante_usuario, site_empresa: string;
  tentativa_conexao: integer;

implementation

uses unfun, Wininet, Un_splash{$IFDEF ORBI}, un_log, UnPri{$ENDIF}
{$IFDEF ORBICOLLETOR}, un_principal{$ENDIF}
{$IFDEF ORBIPALM}, un_menuprincipal{$ENDIF};

{$R *.dfm}

{ Tdao }

function Tdao.IsNumeric(Texto : string):boolean;
var I : integer;
begin
Result := true;
for I := 1 to Length(Texto) do
  begin
    { Check for number }
    if not IsNumber(Texto[I]) then
    begin
      Result := false;
      Break;
    end;
  end;
end;

function Tdao.insert(prefixo, tabela, id: ShortString; form: TForm; Generator:
  ShortString): ShortString;
var
  i: integer;
  id_valor: string;
begin
  try
    //recupera o id
{    if generator <> '' then
    begin
      cmd := 'select nextval(''' + generator + ''') as gen_id from configuracao ';
      Geral1(cmd);
      id_valor := Q1.fieldbyname('gen_id').AsString;
    end
    else
      id_valor := '';
 }
    cmd_campos := '';
    cmd_valor := '';
    cmd := '';
    for i := 0 to form.ComponentCount - 1 do
    begin
      with form do
      begin
        if (copy(form.Components[i].Name, 1, 2) = prefixo) and
          (copy(form.Components[i].Name, 3, Length(form.Components[i].Name) - 1)
          <> id) then
        begin
          if (form.Components[i] is TsEdit) and
            ((TsEdit(form.Components[i]).Text) <> '') then
          begin
            cmd_campos := cmd_campos + copy(form.Components[i].Name, 3,
              Length(form.Components[i].Name) - 1) + ',';
            cmd_valor := cmd_valor +
              QuotedStr(trim(TsEdit(form.Components[i]).Text)) + ',';
          end
          else if (form.Components[i] is TEdit) and
            ((TsEdit(form.Components[i]).Text) <> '') then
          begin
            cmd_campos := cmd_campos + copy(form.Components[i].Name, 3,
              Length(form.Components[i].Name) - 1) + ',';
            cmd_valor := cmd_valor +
              QuotedStr(trim(TsEdit(form.Components[i]).Text)) + ',';
          end
          else if (form.Components[i] is TsComboEdit) and
            ((TsComboEdit(form.Components[i]).Text) <> '') then
          begin
            cmd_campos := cmd_campos + copy(form.Components[i].Name, 3,
              Length(form.Components[i].Name) - 1) + ',';
            cmd_valor := cmd_valor +
              QuotedStr(trim(TsComboEdit(form.Components[i]).Text)) + ',';
          end
          else if form.Components[i] is TsComboBox then
          begin
            cmd_campos := cmd_campos + copy(form.Components[i].Name, 3,
              Length(form.Components[i].Name) - 1) + ',';
            cmd_valor := cmd_valor +
              QuotedStr(inttostr(TComboBox(form.Components[i]).ItemIndex)) +
              ',';
          end
          else if form.Components[i] is TComboBox then
          begin
            cmd_campos := cmd_campos + copy(form.Components[i].Name, 3,
              Length(form.Components[i].Name) - 1) + ',';
            cmd_valor := cmd_valor +
              QuotedStr(inttostr(TComboBox(form.Components[i]).ItemIndex)) +
              ',';
          end
          else if Components[i] is TsCheckBox then
          begin
            cmd_campos := cmd_campos + copy(form.Components[i].Name, 3,
              Length(form.Components[i].Name) - 1) + ',';

            if TsCheckBox(form.Components[i]).Checked then
              cmd_valor := cmd_valor + QuotedStr('S') + ','
            else
              cmd_valor := cmd_valor + QuotedStr('N') + ',';
          end
          else if Components[i] is TCheckBox then
          begin
            cmd_campos := cmd_campos + copy(form.Components[i].Name, 3,
              Length(form.Components[i].Name) - 1) + ',';

            if TCheckBox(form.Components[i]).Checked then
              cmd_valor := cmd_valor + QuotedStr('S') + ','
            else
              cmd_valor := cmd_valor + QuotedStr('N') + ',';
          end
          else if (form.Components[i] is TsCurrencyEdit) and
            (TsCurrencyEdit(form.Components[i]).Text <> '') and
            (TsCurrencyEdit(form.Components[i]).Text <> '0') then
          begin
            formatsettings.DecimalSeparator := '.';
            cmd_campos := cmd_campos + copy(form.Components[i].Name, 3,
              Length(form.Components[i].Name) - 1) + ',';
            cmd_valor := cmd_valor +
              QuotedStr(trim(FMFUN.BuscaTroca(TsCurrencyEdit(form.Components[i]).Text, ',', '.'))) + ',';
            formatsettings.DecimalSeparator := ',';
          end
          else if form.Components[i] is TsRadioGroup then
          begin
            cmd_campos := cmd_campos + copy(form.Components[i].Name, 3,
              Length(form.Components[i].Name) - 1) + ',';
            cmd_valor := cmd_valor +
              inttostr(TsRadioGroup(form.Components[i]).itemIndex) + ',';
          end
          else if form.Components[i] is TRadioGroup then
          begin
            cmd_campos := cmd_campos + copy(form.Components[i].Name, 3,
              Length(form.Components[i].Name) - 1) + ',';
            cmd_valor := cmd_valor +
              inttostr(TRadioGroup(form.Components[i]).itemIndex) + ',';
          end
          else if form.Components[i] is TsDateEdit then
          begin
            if TsDateEdit(form.Components[i]).Text <> '  /  /    ' then
            begin
              cmd_campos := cmd_campos + copy(form.Components[i].Name, 3,
                Length(form.Components[i].Name) - 1) + ',';
              cmd_valor := cmd_valor + QuotedStr((FormatDateTime('dd/mm/yyyy',
                TsDateEdit(form.Components[i]).Date))) + ',';
            end
            else
            begin
              cmd_campos := cmd_campos + copy(form.Components[i].Name, 3,
                Length(form.Components[i].Name) - 1) + ',';
              cmd_valor := cmd_valor + 'null,';
            end;
          end
          else if (form.Components[i] is TRichEdit) and
            ((TRichEdit(form.Components[i]).Text <> '')) then
          begin
            cmd_campos := cmd_campos + copy(form.Components[i].Name, 3,
              Length(form.Components[i].Name) - 1) + ',';
            cmd_valor := cmd_valor +
              QuotedStr(trim(TRichEdit(form.Components[i]).Text)) + ',';
          end
          else if (form.Components[i] is TMaskEdit) and
            ((TMaskEdit(form.Components[i]).Text) <> '') then
          begin
            cmd_campos := cmd_campos + copy(form.Components[i].Name, 3,
              Length(form.Components[i].Name) - 1) + ',';
            cmd_valor := cmd_valor +
              QuotedStr(trim(TMaskEdit(form.Components[i]).Text)) + ',';
          end
          else if (form.Components[i] is TMemo) and
            ((TRichEdit(form.Components[i]).Text <> '')) then
          begin
            cmd_campos := cmd_campos + copy(form.Components[i].Name, 3,
              Length(form.Components[i].Name) - 1) + ',';
            cmd_valor := cmd_valor +
              QuotedStr(trim(TMemo(form.Components[i]).Text)) + ',';
          end;
        end; //end do if
      end; //end do with
    end; {end do FOR}

  {  if id <> '' then
    begin
      cmd_campos := cmd_campos + id + ',';
      cmd_valor := cmd_valor + id_valor + ',';
    end;
   }
    //tirando a ultima virgula que fica sobrando
    cmd_campos := copy(cmd_campos, 1, Length(cmd_campos) - 1);
    cmd_valor := copy(cmd_valor, 1, Length(cmd_valor) - 1);

    cmd := 'insert into ' + tabela + ' (' + cmd_campos + ') values (' + cmd_valor + ')';

    with Q_insert do
    begin
      close;
      sql.Clear;
      sql.add(cmd);
      ExecSQL;
      close;
    end;
    if cn.InTransaction then
      cn.Commit;

//    grava_log(cmd, '');

    if Generator <> '' then
    begin
      dao.geral1('SELECT last_value FROM ' + Generator);
      id_valor := dao.q1.fieldbyname('last_value').value;
    end
    else
      id_valor := '';

    Result := id_valor;



  except
    on e: Exception do
    begin
      if (copy(e.message, 1, 24) <> 'ISC ERROR CODE:335544721') and
        (copy(e.message, 1, 24) <> 'ISC ERROR CODE:335544726') then
      begin
        msg('Houve um erro ao inserir o Registro!' + #13 +
          e.message);

        {envia_email_suporte(e.Message + #13 + cmd + #13 + 'Form: ' + form.Name +
          #13 + 'Data: ' + DtaSerStr + #13 + 'Usuario Logado:' + nom_usuario,
          'Erro ao inserir Registro módulo Dao', 'informatica@plasfan.ind.br',
          '',
          '', '');}
      end
      else
        Reconectar;
    end;
  end;

end;

procedure Tdao.mostra_campos(prefixo: ShortString; form: TForm; cmd: string);
var
  i: integer;
begin

end;

procedure Tdao.update(tabela, campo_id, id, prefixo: shortString; form: TForm);
var
  i: integer;
begin
  //ex update('processo', '235', 'PR', Fr_processo);
  try
    cmd_campos := '';
    cmd_valor := '';
    cmd := '';
    for i := 0 to form.ComponentCount - 1 do
    begin
      with form do
      begin
        if (copy(form.Components[i].Name, 1, 2) = prefixo) and
          (copy(form.Components[i].Name, 3, Length(form.Components[i].Name) - 1)
          <> campo_id) then
        begin
          if (form.Components[i] is TsEdit) then
          begin
            if (trim(TsEdit(form.Components[i]).text) <> '') then
            begin
              cmd_campos := copy(form.Components[i].Name, 3,
                Length(form.Components[i].Name) - 1);
              cmd_valor := QuotedStr(TsEdit(form.Components[i]).Text);
            end
            else
            begin
              cmd_campos := copy(form.Components[i].Name, 3,
                Length(form.Components[i].Name) - 1);
              cmd_valor := 'null';
            end;
          end
          else if (form.Components[i] is TEdit) then
          begin
            if (trim(TsEdit(form.Components[i]).text) <> '') then
            begin
              cmd_campos := copy(form.Components[i].Name, 3,
                Length(form.Components[i].Name) - 1);
              cmd_valor := QuotedStr(TsEdit(form.Components[i]).Text);
            end
            else
            begin
              cmd_campos := copy(form.Components[i].Name, 3,
                Length(form.Components[i].Name) - 1);
              cmd_valor := 'null';
            end;
          end
          else if (form.Components[i] is TsComboEdit) then
          begin
            if (trim(TsComboEdit(form.Components[i]).Text) <> '') then
            begin
              cmd_campos := copy(form.Components[i].Name, 3,
                Length(form.Components[i].Name) - 1);
              cmd_valor := QuotedStr(TsComboEdit(form.Components[i]).Text);
            end
            else
            begin
              cmd_campos := copy(form.Components[i].Name, 3,
                Length(form.Components[i].Name) - 1);
              cmd_valor := 'null';
            end;
          end
          else if (form.Components[i] is TsCurrencyEdit) then
          begin
            formatsettings.DecimalSeparator := '.';
            cmd_campos := copy(form.Components[i].Name, 3,
              Length(form.Components[i].Name) - 1);
            if (TsCurrencyEdit(form.Components[i]).Text <> '') then
              cmd_valor :=
                QuotedStr(FMFUN.BuscaTroca(TsCurrencyEdit(form.Components[i]).Text,
                ',', '.'))
            else
              cmd_valor := '0';
            formatsettings.DecimalSeparator := ',';
          end
          else if form.Components[i] is TsComboBox then
          begin
            cmd_campos := copy(form.Components[i].Name, 3, Length(form.Components[i].Name) - 1);
            if (TsComboBox(form.Components[i]).Text <> '') then
              cmd_valor  := QuotedStr(TsComboBox(Components[i]).text)
            else
              cmd_valor  := 'null';
          end
          else if form.Components[i] is TComboBox then
          begin
            cmd_campos := copy(form.Components[i].Name, 3, Length(form.Components[i].Name) - 1);
            cmd_valor  := QuotedStr(inttostr(TComboBox(Components[i]).ItemIndex));
          end
          else if form.Components[i] is TsCheckBox then
          begin
            cmd_campos := copy(form.Components[i].Name, 3,
              Length(form.Components[i].Name) - 1);

            if TsCheckBox(form.Components[i]).Checked then
              cmd_valor := QuotedStr('S')
            else
              cmd_valor := QuotedStr('N');
          end
          else if form.Components[i] is TCheckBox then
          begin
            cmd_campos := copy(form.Components[i].Name, 3,
              Length(form.Components[i].Name) - 1);

            if TCheckBox(form.Components[i]).Checked then
              cmd_valor := QuotedStr('S')
            else
              cmd_valor := QuotedStr('N');
          end
          else if form.Components[i] is TsRadioGroup then
          begin
            cmd_campos := copy(form.Components[i].Name, 3,
              Length(form.Components[i].Name) - 1);
            cmd_valor := inttostr(TsRadioGroup(form.Components[i]).itemIndex);
          end
          else if form.Components[i] is TRadioGroup then
          begin
            cmd_campos := copy(form.Components[i].Name, 3,
              Length(form.Components[i].Name) - 1);
            cmd_valor := inttostr(TRadioGroup(form.Components[i]).itemIndex);
          end
          else if form.Components[i] is TsDateEdit then
          begin
            if TsDateEdit(form.Components[i]).Text <> '  /  /    ' then
            begin
              cmd_campos := copy(form.Components[i].Name, 3,
                Length(form.Components[i].Name) - 1);
              cmd_valor := QuotedStr((FormatDateTime('dd/mm/yyyy',
                TsDateEdit(form.Components[i]).Date)));
            end
            else
            begin
              cmd_campos := copy(form.Components[i].Name, 3,
                Length(form.Components[i].Name) - 1);
              cmd_valor := 'null';
            end;
          end
          else if form.Components[i] is TDateTimePicker then
          begin
            if TDateTimePicker(form.Components[i]).DateTime <> 0 then
            begin
              cmd_campos := copy(form.Components[i].Name, 3,
                Length(form.Components[i].Name) - 1);
              cmd_valor := QuotedStr((FormatDateTime('dd.mm.yyyy hh:mm:ss',
                TDateTimePicker(form.Components[i]).DateTime)));
            end;
          end
          else if (form.Components[i] is TRichEdit) then
            //and (TRichEdit(form.Components[i]).Text <> '') then
          begin
            cmd_campos := copy(form.Components[i].Name, 3,
              Length(form.Components[i].Name) - 1);
            cmd_valor := QuotedStr(TRichEdit(form.Components[i]).Text);
          end
          else if (form.Components[i] is TMaskEdit) and
            ((TMaskEdit(form.Components[i]).Text) <> '') then
          begin
            cmd_campos := copy(form.Components[i].Name, 3,
              Length(form.Components[i].Name) - 1);
            cmd_valor := QuotedStr(TMaskEdit(form.Components[i]).Text);
          end
          else if (form.Components[i] is TMemo) then
            //and (TMemo(form.Components[i]).Text <> '') then
          begin
            cmd_campos := copy(form.Components[i].Name, 3, Length(form.Components[i].Name) - 1);
            cmd_valor := QuotedStr(TMemo(form.Components[i]).Text);
          end;

          if (cmd_campos <> '') and (cmd_valor <> '') then
            cmd := cmd + cmd_campos + '=' + cmd_valor + ',';

          cmd_campos := '';
          cmd_valor := '';

        end; //end do if
      end; //end do with
    end; {end do FOR}

    //tirando a ultima virgula que fica sobrando
    cmd := copy(cmd, 1, Length(cmd) - 1);
    cmd := 'update ' + tabela + ' set ' + cmd + ' where ' + campo_id + '=' +
      QuotedStr(id);

    if cmd <> '' then
    begin
      with Q_update do
      begin
        close;
        sql.Clear;
        sql.add(cmd);
        ExecSQL;
        close;
      end;
      grava_log(cmd, '');
    end;
  except
    on e: Exception do
    begin
      if (copy(e.message, 1, 24) <> 'ISC ERROR CODE:335544721') and
        (copy(e.message, 1, 24) <> 'ISC ERROR CODE:335544726') then
      begin
        msg('Houve um erro ao Efetuar a Atualização!' + #13 +
          e.message);
        {envia_email_suporte(e.Message + #13 + cmd + #13 + 'Form: ' + form.Name +
          #13 + #13 + 'Data: ' + DtaSerStr + #13 + 'Usuario Logado:' +
          nom_usuario,
          'Erro ao Alterar o Registro módulo Dao', 'informatica@plasfan.ind.br',
          '',
          '', '');}
      end
      else
        Reconectar;
    end;
  end;

end;

procedure Tdao.delete(campo_id, id, tabela: ShortString);
begin
  with Q_delete do
  begin
    close;
    sql.clear;
    sql.add('delete from ' + tabela + ' where ' + campo_id + '=' + id);
    ExecSQL;
  end;
  grava_log(cmd, '');
end;

procedure Tdao.Geral1(cmd: string);
begin
  try
    with Q1 do
    begin
      Prepared := False;
      close;
      sql.Clear;
      sql.add(cmd);
      open;
    end;
  except
    on e: Exception do
    begin
      if (copy(e.message, 1, 24) <> 'ISC ERROR CODE:335544721') and
        (copy(e.message, 1, 24) <> 'ISC ERROR CODE:335544726') then
      begin
        msg('Houve um erro ao Executar o Procedimento!' + #13 +
          e.message);

        {envia_email_suporte(e.Message + #13 + cmd + #13 + 'Data: ' + DtaSerStr +
          #13 + 'Usuario Logado:' + nom_usuario,
          'Erro ao executar o procedimento Geral1 módulo Dao',
          'informatica@plasfan.ind.br', '', '', '');}
      end
      else
        Reconectar;
    end;
  end;

end;

procedure Tdao.Geral2(cmd: string);
begin
  try
    with Q2 do
    begin
      Prepared := False;
      close;
      sql.Clear;
      sql.Text := cmd;
      open;
    end;
  except
    on e: Exception do
    begin
      if (copy(e.message, 1, 24) <> 'ISC ERROR CODE:335544721') and
        (copy(e.message, 1, 24) <> 'ISC ERROR CODE:335544726') then
      begin
        msg('Houve um erro ao Executar o Procedimento!' + #13 +
          e.message);

        {envia_email_suporte(e.Message + #13 + cmd + #13 + 'Data: ' + DtaSerStr +
          #13 + 'Usuario Logado:' + nom_usuario,
          'Erro ao executar o procedimento Geral2 módulo Dao',
          'informatica@plasfan.ind.br', '', '', '');}
      end
      else
        Reconectar;
    end;
  end;

end;

procedure Tdao.Geral5(cmd: string);
begin
  try
    with Q5 do
    begin
      Prepared := False;
      close;
      sql.Clear;
      sql.add(cmd);
      open;
    end;
  except
    on e: Exception do
    begin
      if (copy(e.message, 1, 24) <> 'ISC ERROR CODE:335544721') and
        (copy(e.message, 1, 24) <> 'ISC ERROR CODE:335544726') then
      begin
        msg('Houve um erro ao Executar o Procedimento!' + #13 +
          e.message);

        {envia_email_suporte(e.Message + #13 + cmd + #13 + 'Data: ' + DtaSerStr +
          #13 + 'Usuario Logado:' + nom_usuario,
          'Erro ao executar o procedimento Geral1 módulo Dao',
          'informatica@plasfan.ind.br', '', '', '');}
      end
      else
        Reconectar;
    end;
  end;

end;

procedure Tdao.Execsql(cmd: string);
begin
  try
    if cmd = '' then
      exit;
    with dao.Exec_sql do
    begin
      Prepared := False;
      close;
      sql.Clear;
      sql.add(cmd);
      ExecSQL;
    end;
    grava_log(cmd, '');

  except
    on e: Exception do
    begin
      if (copy(e.message, 1, 24) <> 'ISC ERROR CODE:335544721') and
        (copy(e.message, 1, 24) <> 'ISC ERROR CODE:335544726') then
      begin
        //        msg('Houve um erro ao Executar o ExecSql!' + #13 + e.message);
        Exception.Create(E.Message);
        {envia_email_suporte(e.Message + #13 + cmd + #13 + 'Data: ' + DtaSerStr +
          #13 + 'Usuario Logado:' + nom_usuario,
          'Erro ao executar ExecSql módulo Dao', 'informatica@plasfan.ind.br',
          '',
          '', '');}
      end
      else
        Reconectar;
    end;
  end;

end;

procedure Tdao.Execsql2(cmd: string);
begin
  try
    with dao.Exec_sql2 do
    begin
      Prepared := False;
      close;
      sql.Clear;
      sql.add(cmd);
      ExecSQL;
    end;
    grava_log(cmd, '');
  except
    on e: Exception do
    begin
      if (copy(e.message, 1, 24) <> 'ISC ERROR CODE:335544721') and
        (copy(e.message, 1, 24) <> 'ISC ERROR CODE:335544726') then
      begin
        msg('Houve um erro ao Executar o Procedimento de Sql!' + #13 +
          e.message);

        {envia_email_suporte(e.Message + #13 + cmd + #13 + 'Data: ' + DtaSerStr +
          #13 + 'Usuario Logado:' + nom_usuario,
          'Erro ao executar o procedimento ExecSql2 módulo Dao',
          'informatica@plasfan.ind.br', '', '', '');}
      end;
    end;
  end;

end;

{procedure Tdao.iniciaCn(login, senha, caminho, servidor: String);
begin

  cn.Username:= login;
  cn.Password:= senha;
  cn.Path:= caminho;
  cn.Server:= servidor;

end;}

procedure Tdao.update(tabela, campo_id, campo_id2, id, id2,
  prefixo: shortString; form: TForm);
var
  i: integer;
begin
  //ex update('processo', '235', 'PR', Fr_processo);
  cmd_campos := '';
  cmd_valor := '';
  cmd := '';
  for i := 0 to form.ComponentCount - 1 do
  begin
    with form do
    begin
      if (copy(form.Components[i].Name, 1, 2) = prefixo) and
        (copy(form.Components[i].Name, 3, Length(form.Components[i].Name) - 1)
        <>
        campo_id) then
      begin
        if (form.Components[i] is TsEdit) and
          (TsEdit(form.Components[i]).Modified) and
          (TsEdit(form.Components[i]).Text <> '') then
        begin
          cmd_campos := copy(form.Components[i].Name, 3,
            Length(form.Components[i].Name) - 1);
          cmd_valor := QuotedStr(TsEdit(form.Components[i]).Text);
        end
        else if (form.Components[i] is TsComboEdit) and
          (trim(TsComboEdit(form.Components[i]).Text) <> '') then
        begin
          cmd_campos := copy(form.Components[i].Name, 3,
            Length(form.Components[i].Name) - 1);
          cmd_valor := QuotedStr(TsComboEdit(form.Components[i]).Text);
        end
        else if (form.Components[i] is TsCurrencyEdit) and
          (trim(TsCurrencyEdit(form.Components[i]).Text) <> '') and
          (TsCurrencyEdit(form.Components[i]).Text <> '0') then
        begin
          formatsettings.DecimalSeparator := '.';
          cmd_campos := copy(form.Components[i].Name, 3,
            Length(form.Components[i].Name) - 1);
          cmd_valor :=
            QuotedStr(FMFUN.BuscaTroca(TsCurrencyEdit(form.Components[i]).Text,
            ',', '.'));
          formatsettings.DecimalSeparator := ',';
        end
        else if form.Components[i] is TComboBox then
        begin
          cmd_campos := copy(form.Components[i].Name, 3,
            Length(form.Components[i].Name) - 1);
          cmd_valor := QuotedStr(inttostr(TComboBox(Components[i]).ItemIndex));
        end
        else if form.Components[i] is TsCheckBox then
        begin
          cmd_campos := copy(form.Components[i].Name, 3,
            Length(form.Components[i].Name) - 1);

          if TsCheckBox(form.Components[i]).Checked then
            cmd_valor := QuotedStr('S')
          else
            cmd_valor := QuotedStr('N');
        end
        else if form.Components[i] is TsDateEdit then
        begin
          if TsDateEdit(form.Components[i]).Text <> '  /  /    ' then
          begin
            cmd_campos := copy(form.Components[i].Name, 3,
              Length(form.Components[i].Name) - 1);
            cmd_valor := QuotedStr((FormatDateTime('dd.mm.yyyy',
              TsDateEdit(form.Components[i]).Date)));
          end;
        end
        else if (form.Components[i] is TMaskEdit) and
          ((TMaskEdit(form.Components[i]).Text) <> '') then
        begin
          cmd_campos := copy(form.Components[i].Name, 3,
            Length(form.Components[i].Name) - 1);
          cmd_valor := QuotedStr(TMaskEdit(form.Components[i]).Text);
        end
        else if (form.Components[i] is TRichEdit) and
          (trim(TRichEdit(form.Components[i]).Text) <> '') then
        begin
          cmd_campos := copy(form.Components[i].Name, 3,
            Length(form.Components[i].Name) - 1);
          cmd_valor := QuotedStr(TRichEdit(form.Components[i]).Text);
        end;
        if (cmd_campos <> '') and (cmd_valor <> '') then
          cmd := cmd + cmd_campos + '=' + cmd_valor + ',';

        cmd_campos := '';
        cmd_valor := '';

      end; //end do if
    end; //end do with
  end; {end do FOR}

  //tirando a ultima virgula que fica sobrando
  cmd := copy(cmd, 1, Length(cmd) - 1);
  cmd := 'update ' + tabela + ' set ' + cmd + ' where ' + campo_id + '=' +
    QuotedStr(id) + ' and ' + campo_id2 + '=' + QuotedStr(id2);

  with Q_update do
  begin
    close;
    sql.Clear;
    sql.add(cmd);
    ExecSQL;
    close;
  end;
  grava_log(cmd, '');

end;

procedure Tdao.conf_CN;
var
  Ini: TIniFile;
  Path, nfe: string;

begin
  Path := extractFilePath(application.ExeName);
  Ini := TIniFile.Create(Path + 'servidor.ini');
  try
    NomeBanco := Ini.ReadString(inttostr(servidor_selecionado), 'Nome', '');
    CN.connected := false;
  //  CN.params.clear;
  //  CN.params.values['DriverID'] := 'PG';
    CN.params.values['password'] := 'Plasfan!@#';
    CN.params.values['user_name'] := 'postgres';
    CN.params.values['server'] := Ini.ReadString(inttostr(servidor_selecionado), 'servidor', '');
    CN.params.values['database'] := Ini.ReadString(inttostr(servidor_selecionado), 'path', '');
    CN.params.values['port'] := '5432';
    CN.connected := true;
    (*
    minaPath := Ini.ReadString(inttostr(servidor_selecionado), 'PathMina', '');
   // CN_Export.params.clear;
   // CN_Export.params.values['DriverID'] := 'PG';
    CN_Export.params.values['password'] := '123';
    CN_Export.params.values['user_name'] := 'postgres';
    CN_Export.params.values['server'] := Ini.ReadString(inttostr(servidor_selecionado), 'servidor', '');
    CN_Export.params.values['database'] := Ini.ReadString(inttostr(servidor_selecionado), 'path', '');
    CN_Export.params.values['port'] := '5432';

    nfe := Ini.ReadString(inttostr(servidor_selecionado), 'nfe', '');
    if nfe = '1' then
      terminal_nfe := true
    else
      terminal_nfe := false;
    *)

    //    CN_store.Server := Ini.ReadString( 'store', 'servidor','');
    //    CN_store.Path := Ini.ReadString( 'store', 'path','');
    //    CN_store.Connect;
  finally
    Ini.Free;
  end;
end;

procedure Tdao.delete(campo_id, campo_id2, id, id2, tabela: ShortString);
begin
  with Q_delete do
  begin
    close;
    sql.clear;
    sql.add('delete from ' + tabela + ' where ' + campo_id + '=' + id + ' and '
      + campo_id2 + '=' + id2);
    ExecSQL;
  end;
  grava_log(cmd, '');
end;

procedure Tdao.grava_log(cmd, cod_usu: string);
var
  dt, hr, usuario, ip, computador: string;
begin
  if FMFUN = nil then
    Application.CreateForm(TFMFUN, FMFUN);
  if trim(cmd) = '' then
    exit;
  {o parametro cod_usu é para pegar o cod_usuario que estiver fazendo alguma coisa diferente como fazendo uma venda, desfaturando um pedido e etc}
  dt := FMFUN.BuscaTroca(DtaSerStr, '/', '.');
  hr := HrSer;

{$IFDEF ORBIPALM}
  cod_usu := '20';
  usuario := '20';
{$ENDIF}
{$IFDEF ORBI}
  ip := QuotedStr(FMFUN.IP);
  computador := QuotedStr(FMFUN.COMPUTADOR);
  usuario := cod_usuario;
{$ENDIF}
{$IFDEF ORBICOLLETOR}
  usuario := frpri.cod_usuario;
{$ENDIF}
  try
    with q_log do
    begin
      Close;
      sql.Clear;
      if cod_usu <> '' then
        sql.add('insert into log (cod_usuario_logado, data, hora, descricao, cod_empresa, IP, COMPUTADOR) values ' +
          '(' + QuotedStr(usuario) + ', ' + QuotedStr(dt) + ', ' + QuotedStr(hr)
          + ', ' + QuotedStr(cmd) + ', ' + QuotedStr(cod_empresa) + ', ' +
          QuotedStr(FMFUN.IP) + ', ' + QuotedStr(FMFUN.COMPUTADOR) + ')')
      else
{$IFDEF ORBI}if (IP = '') or (computador = '') then
          sql.add('insert into log (cod_usuario_logado, data, hora, descricao, cod_empresa) values ' +
            '(' + QuotedStr(usuario) + ', ' + QuotedStr(dt) + ', ' +
            QuotedStr(hr) + ', ' + QuotedStr(cmd) + ', ' + QuotedStr(cod_empresa)
            + ')')
        else
          sql.add('insert into log (cod_usuario_logado, data, hora, descricao, cod_empresa, IP, COMPUTADOR) values ' +
            '(' + QuotedStr(usuario) + ', ' + QuotedStr(dt) + ', ' +
            QuotedStr(hr) + ', ' + QuotedStr(cmd) + ', ' + QuotedStr(cod_empresa)
            + ', ' + QuotedStr(FMFUN.IP) + ', ' + QuotedStr(FMFUN.COMPUTADOR) +
            ')');
{$ENDIF}
{$IFDEF ORBICOLLETOR}
      sql.add('insert into log (cod_usuario_logado, data, hora, descricao) values ' +
        '(' + QuotedStr(usuario) + ', ' + QuotedStr(dt) + ', ' + QuotedStr(hr) +
        ', ' + QuotedStr(cmd) + ')');
{$ENDIF}
      sql.SaveToFile('teste.sql');
      ExecSQL;
    end;
  except
    //
  end;
end;

function Tdao.DtaSerStr: string;
begin
  Geral3('select current_date as dts from configuracao ');
  Result := FormatDateTime('dd.mm.yyyy', Q3.fieldbyname('dts').AsDateTime);
end;

function Tdao.DtaSerDt: TDateTime;
begin
  Geral2('select current_date as dt from configuracao');
  Result := Q2.fieldbyname('dt').AsDateTime;

end;

function Tdao.HrSer: string;
begin
  Geral5('select current_time as hr from configuracao');
  Result := Q5.fieldbyname('hr').AsString;

end;

procedure Tdao.atu_estrutura_banco_dados;
begin

end;

procedure Tdao.executa_atualiza_estrutura(cmd: string);
begin
  try
    //if not (tr_atualiza_estrutura.InTransaction) then
      tr_atualiza_estrutura.StartTransaction;

    with Q_atualiza_estrutura do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      ExecSQL;
    end;
    tr_atualiza_estrutura.Commit;
  except on e: Exception do
    begin
      tr_atualiza_estrutura.Rollback;
      msg('Houve um problema ao Atualizar a estrutura do Banco de Dados!' + #13
        +
        'Logo Abaixo contém o comando que gerou o erro!' + #13 + #13 + cmd);
    end;
  end;
end;

procedure Tdao.Geral3(cmd: string);
begin
  try
    with Q3 do
    begin
      close;
      sql.Clear;
      sql.add(cmd);
      open;
    end;
  except
    on e: Exception do
    begin
      if (copy(e.message, 1, 24) <> 'ISC ERROR CODE:335544721') and
        (copy(e.message, 1, 24) <> 'ISC ERROR CODE:335544726') then
      begin
        msg('Houve um erro ao Executar o Procedimento!' + #13 +
          e.message);

        {envia_email_suporte(e.Message + #13 + cmd + #13 + 'Data: ' + DtaSerStr +
          #13 + 'Usuario Logado:' + nom_usuario,
          'Erro ao executar o procedimento Geral3 módulo Dao',
          'informatica@plasfan.ind.br', '', '', '');}
      end
      else
        Reconectar;
    end;
  end;

end;

procedure Tdao.Configura_CN_NET(cod_empresa: string);
begin
  dao.Geral2('select ip_valido from empresa where cod_empresa=' +
    QuotedStr(cod_empresa));

  dao.CN_NET.Connected := False;
  dao.CN_NET.params.values['server'] := dao.Q2.fieldbyname('ip_valido').AsString;
  dao.CN_NET.Connected := true;

end;

procedure Tdao.Execsql_NET(cmd: string);
begin
  try
    with dao.exec_sql_net do
    begin
      close;
      sql.Clear;
      sql.add(cmd);
      ExecSQL;
    end;
    grava_log(cmd, '');

  except
    on e: Exception do
    begin
      if (copy(e.message, 1, 24) <> 'ISC ERROR CODE:335544721') and
        (copy(e.message, 1, 24) <> 'ISC ERROR CODE:335544726') then
      begin
        msg('Houve um erro ao Executar o ExecSql!' + #13 +
          e.message);

        {envia_email_suporte(e.Message + #13 + cmd + #13 + 'Data: ' + DtaSerStr +
          #13 + 'Usuario Logado:' + nom_usuario,
          'Erro ao executar ExecSql módulo Dao', 'informatica@plasfan.ind.br',
          '',
          '', '');}
      end
      else
        Reconectar;
    end;
  end;

end;

procedure Tdao.Execsql2_NET(cmd: string);
begin
  try
    with dao.exec_sql2_net do
    begin
      close;
      sql.Clear;
      sql.add(cmd);
      ExecSQL;
    end;
    grava_log(cmd, '');

  except
    on e: Exception do
    begin
      if (copy(e.message, 1, 24) <> 'ISC ERROR CODE:335544721') and
        (copy(e.message, 1, 24) <> 'ISC ERROR CODE:335544726') then
      begin

        msg('Houve um erro ao Executar o ExecSql!' + #13 +
          e.message);

        {envia_email_suporte(e.Message + #13 + cmd + #13 + 'Data: ' + DtaSerStr +
          #13 + 'Usuario Logado:' + nom_usuario,
          'Erro ao executar ExecSql módulo Dao', 'informatica@plasfan.ind.br',
          '',
          '', '');}
      end
      else
        Reconectar;
    end;
  end;

end;

procedure Tdao.Geral1_NET(cmd: string);
begin
  try
    with q1_net do
    begin
      close;
      sql.Clear;
      sql.add(cmd);
      open;
    end;
  except
    on e: Exception do
    begin
      if (copy(e.message, 1, 24) <> 'ISC ERROR CODE:335544721') and
        (copy(e.message, 1, 24) <> 'ISC ERROR CODE:335544726') then
      begin

        msg('Houve um erro ao Executar o Procedimento!' + #13 +
          e.message);
        {envia_email_suporte(e.Message + #13 + cmd + #13 + 'Data: ' + DtaSerStr +
          #13 + 'Usuario Logado:' + nom_usuario,
          'Erro ao executar o procedimento Geral1 módulo Dao',
          'informatica@plasfan.ind.br', '', '', '');}
      end
      else
        Reconectar;
    end;
  end;
end;

procedure Tdao.Geral2_NET(cmd: string);
begin
  try
    with q2_net do
    begin
      close;
      sql.Clear;
      sql.add(cmd);
      open;
    end;
  except
    on e: Exception do
    begin
      if (copy(e.message, 1, 24) <> 'ISC ERROR CODE:335544721') and
        (copy(e.message, 1, 24) <> 'ISC ERROR CODE:335544726') then
      begin
        msg('Houve um erro ao Executar o Procedimento!' + #13 +
          e.message);

        {envia_email_suporte(e.Message + #13 + cmd + #13 + 'Data: ' + DtaSerStr +
          #13 + 'Usuario Logado:' + nom_usuario,
          'Erro ao executar o procedimento Geral1 módulo Dao',
          'informatica@plasfan.ind.br', '', '', '');}
      end
      else
        Reconectar;
    end;
  end;

end;

procedure Tdao.Geral3_NET(cmd: string);
begin
  try
    with q3_net do
    begin
      close;
      sql.Clear;
      sql.add(cmd);
      open;
    end;
  except
    on e: Exception do
    begin
      if (copy(e.message, 1, 24) <> 'ISC ERROR CODE:335544721') and
        (copy(e.message, 1, 24) <> 'ISC ERROR CODE:335544726') then
      begin

        msg('Houve um erro ao Executar o Procedimento!' + #13 +
          e.message);

        {envia_email_suporte(e.Message + #13 + cmd + #13 + 'Data: ' + DtaSerStr +
          #13 + 'Usuario Logado:' + nom_usuario,
          'Erro ao executar o procedimento Geral1 módulo Dao',
          'informatica@plasfan.ind.br', '', '', '');}
      end
      else
        Reconectar;
    end;
  end;

end;

procedure Tdao.Geral4(cmd: string);
begin
  try
    with Q4 do
    begin
      close;
      sql.Clear;
      sql.add(cmd);
      open;
    end;
  except
    on e: Exception do
    begin
      if (copy(e.message, 1, 24) <> 'ISC ERROR CODE:335544721') and
        (copy(e.message, 1, 24) <> 'ISC ERROR CODE:335544726') then
      begin

        msg('Houve um erro ao Executar o Procedimento!' + #13 +
          e.message);

        {envia_email_suporte(e.Message + #13 + cmd + #13 + 'Data: ' + DtaSerStr +
          #13 + 'Usuario Logado:' + nom_usuario,
          'Erro ao executar o procedimento Geral4 módulo Dao',
          'informatica@plasfan.ind.br', '', '', '');}
      end
      else
        Reconectar;
    end;
  end;

end;

procedure Tdao.delete_net(campo_id, id, tabela: ShortString);
begin
  with Q_delete_net do
  begin
    close;
    sql.clear;
    sql.add('delete from ' + tabela + ' where ' + campo_id + '=' + id);
    ExecSQL;
  end;
  grava_log(cmd, '');

end;

procedure Tdao.delete_net(campo_id, campo_id2, id, id2,
  tabela: ShortString);
begin
  with Q_delete_net do
  begin
    close;
    sql.clear;
    sql.add('delete from ' + tabela + ' where ' + campo_id + '=' + id + ' and '
      + campo_id2 + '=' + id2);
    ExecSQL;
  end;
  grava_log(cmd, '');

end;

function Tdao.insert_net(prefixo, tabela, id: ShortString; form: TForm;
  generator: ShortString): ShortString;
var
  i: integer;
begin
  try
    cmd_campos := '';
    cmd_valor := '';
    cmd := '';
    for i := 0 to form.ComponentCount - 1 do
    begin
      with form do
      begin
        if (copy(form.Components[i].Name, 1, 2) = prefixo) and
          (copy(form.Components[i].Name, 3, Length(form.Components[i].Name) - 1)
          <> id) then
        begin
          if (form.Components[i] is TsEdit) and
            ((TsEdit(form.Components[i]).Text) <> '') then
          begin
            cmd_campos := cmd_campos + copy(form.Components[i].Name, 3,
              Length(form.Components[i].Name) - 1) + ',';
            cmd_valor := cmd_valor +
              QuotedStr(trim(TsEdit(form.Components[i]).Text)) + ',';
          end
          else if (form.Components[i] is TsComboEdit) and
            ((TsComboEdit(form.Components[i]).Text) <> '') then
          begin
            cmd_campos := cmd_campos + copy(form.Components[i].Name, 3,
              Length(form.Components[i].Name) - 1) + ',';
            cmd_valor := cmd_valor +
              QuotedStr(trim(TsComboEdit(form.Components[i]).Text)) + ',';
          end
          else if form.Components[i] is TComboBox then
          begin
            cmd_campos := cmd_campos + copy(form.Components[i].Name, 3,
              Length(form.Components[i].Name) - 1) + ',';
            cmd_valor := cmd_valor +
              QuotedStr(inttostr(TComboBox(form.Components[i]).ItemIndex)) +
              ',';
          end
          else if (form.Components[i] is TsCurrencyEdit) and
            (TsCurrencyEdit(form.Components[i]).Text <> '') and
            (TsCurrencyEdit(form.Components[i]).Text <> '0') then
          begin
            formatsettings.DecimalSeparator := '.';
            cmd_campos := cmd_campos + copy(form.Components[i].Name, 3,
              Length(form.Components[i].Name) - 1) + ',';
            cmd_valor := cmd_valor +
              QuotedStr(trim(FMFUN.BuscaTroca(TsCurrencyEdit(form.Components[i]).Text, ',', '.'))) + ',';
            formatsettings.DecimalSeparator := ',';
          end
          else if (form.Components[i] is TMaskEdit) and
            ((TMaskEdit(form.Components[i]).Text) <> '') then
          begin
            cmd_campos := cmd_campos + copy(form.Components[i].Name, 3,
              Length(form.Components[i].Name) - 1) + ',';
            cmd_valor := cmd_valor +
              QuotedStr(trim(TMaskEdit(form.Components[i]).Text)) + ',';
          end
          else if form.Components[i] is TsDateEdit then
          begin
            if TsDateEdit(form.Components[i]).Text <> '  /  /    ' then
            begin
              cmd_campos := cmd_campos + copy(form.Components[i].Name, 3,
                Length(form.Components[i].Name) - 1) + ',';
              cmd_valor := cmd_valor + QuotedStr((FormatDateTime('dd.mm.yyyy',
                TsDateEdit(form.Components[i]).Date))) + ',';
            end;
          end
          else if (form.Components[i] is TRichEdit) and
            ((TRichEdit(form.Components[i]).Text <> '')) then
          begin
            cmd_campos := cmd_campos + copy(form.Components[i].Name, 3,
              Length(form.Components[i].Name) - 1) + ',';
            cmd_valor := cmd_valor +
              QuotedStr(trim(TRichEdit(form.Components[i]).Text)) + ',';
          end;
        end; //end do if
      end; //end do with
    end; {end do FOR}

    //tirando a ultima virgula que fica sobrando
    cmd_campos := copy(cmd_campos, 1, Length(cmd_campos) - 1);
    cmd_valor := copy(cmd_valor, 1, Length(cmd_valor) - 1);

    cmd := 'insert into ' + tabela + ' (' + cmd_campos + ') values (' + cmd_valor
      + ')';

    with Q_insert_net do
    begin
      close;
      sql.Clear;
      sql.add(cmd);
      ExecSQL;
      close;
    end;
    grava_log(cmd, '');
    //recupera o id
    cmd := 'select nextval(''' + generator + ''') as gen_id from configuracao';
    Geral1(cmd);
    Result := Q1.fieldbyname('gen_id').AsString;
  except
    on e: Exception do
    begin
      if (copy(e.message, 1, 24) <> 'ISC ERROR CODE:335544721') and
        (copy(e.message, 1, 24) <> 'ISC ERROR CODE:335544726') then
      begin
        msg('Houve um erro ao inserir o Registro!' + #13 +
          e.message);

        {envia_email_suporte(e.Message + #13 + cmd + #13 + 'Form: ' + form.Name +
          #13 + 'Data: ' + DtaSerStr + #13 + 'Usuario Logado:' + nom_usuario,
          'Erro ao inserir Registro módulo Dao', 'informatica@plasfan.ind.br',
          '',
          '', '');}
      end
      else
        Reconectar;
    end;
  end;

end;

procedure Tdao.update_net(tabela, campo_id, id, prefixo: shortString;
  form: TForm);
var
  i: integer;
begin
  //ex update('processo', '235', 'PR', Fr_processo);
  try
    cmd_campos := '';
    cmd_valor := '';
    cmd := '';
    for i := 0 to form.ComponentCount - 1 do
    begin
      with form do
      begin
        if (copy(form.Components[i].Name, 1, 2) = prefixo) and
          (copy(form.Components[i].Name, 3, Length(form.Components[i].Name) - 1)
          <> campo_id) then
        begin
          if (form.Components[i] is TsEdit) then
          begin
            cmd_campos := copy(form.Components[i].Name, 3,
              Length(form.Components[i].Name) - 1);
            cmd_valor := QuotedStr(TsEdit(form.Components[i]).Text);
          end
          else if (form.Components[i] is TsComboEdit) and
            (TsComboEdit(form.Components[i]).Text <> '') then
          begin
            cmd_campos := copy(form.Components[i].Name, 3,
              Length(form.Components[i].Name) - 1);
            cmd_valor := QuotedStr(TsComboEdit(form.Components[i]).Text);
          end
          else if (form.Components[i] is TsCurrencyEdit) and
            (TsCurrencyEdit(form.Components[i]).Text <> '') and
            (TsCurrencyEdit(form.Components[i]).Text <> '0') then
          begin
            formatsettings.DecimalSeparator := '.';
            cmd_campos := copy(form.Components[i].Name, 3,
              Length(form.Components[i].Name) - 1);
            cmd_valor :=
              QuotedStr(FMFUN.BuscaTroca(TsCurrencyEdit(form.Components[i]).Text,
              ',', '.'));
            formatsettings.DecimalSeparator := ',';
          end
          else if form.Components[i] is TComboBox then
          begin
            cmd_campos := copy(form.Components[i].Name, 3,
              Length(form.Components[i].Name) - 1);
            cmd_valor :=
              QuotedStr(inttostr(TComboBox(Components[i]).ItemIndex));
          end
          else if (form.Components[i] is TMaskEdit) and
            ((TMaskEdit(form.Components[i]).Text) <> '') then
          begin
            cmd_campos := copy(form.Components[i].Name, 3,
              Length(form.Components[i].Name) - 1);
            cmd_valor := QuotedStr(TMaskEdit(form.Components[i]).Text);
          end
          else if form.Components[i] is TsDateEdit then
          begin
            if TsDateEdit(form.Components[i]).Text <> '  /  /    ' then
            begin
              cmd_campos := copy(form.Components[i].Name, 3,
                Length(form.Components[i].Name) - 1);
              cmd_valor := QuotedStr((FormatDateTime('dd.mm.yyyy',
                TsDateEdit(form.Components[i]).Date)));
            end;
          end
          else if (form.Components[i] is TRichEdit) then
            //and (TRichEdit(form.Components[i]).Text <> '') then
          begin
            cmd_campos := copy(form.Components[i].Name, 3,
              Length(form.Components[i].Name) - 1);
            cmd_valor := QuotedStr(TRichEdit(form.Components[i]).Text);
          end;
          if (cmd_campos <> '') and (cmd_valor <> '') then
            cmd := cmd + cmd_campos + '=' + cmd_valor + ',';

          cmd_campos := '';
          cmd_valor := '';

        end; //end do if
      end; //end do with
    end; {end do FOR}

    //tirando a ultima virgula que fica sobrando
    cmd := copy(cmd, 1, Length(cmd) - 1);
    cmd := 'update ' + tabela + ' set ' + cmd + ' where ' + campo_id + '=' +
      QuotedStr(id);

    if cmd <> '' then
    begin
      with Q_update_net do
      begin
        close;
        sql.Clear;
        sql.add(cmd);
        ExecSQL;
        close;
      end;
      grava_log(cmd, '');
    end;
  except
    on e: Exception do
    begin
      if (copy(e.message, 1, 24) <> 'ISC ERROR CODE:335544721') and
        (copy(e.message, 1, 24) <> 'ISC ERROR CODE:335544726') then
      begin

        msg('Houve um erro ao Efetuar a Atualização!' + #13 +
          e.message);
        {envia_email_suporte(e.Message + #13 + cmd + #13 + 'Form: ' + form.Name +
          #13 + #13 + 'Data: ' + DtaSerStr + #13 + 'Usuario Logado:' +
          nom_usuario,
          'Erro ao Alterar o Registro módulo Dao', 'informatica@plasfan.ind.br',
          '',
          '', '');}
      end
      else
        Reconectar;
    end;
  end;

end;

function Tdao.TestaConexao: boolean;
var
  Flags: DWORD;
begin
  if not InternetGetConnectedState(@Flags, 0) then
  begin
    //    ShowMessage('<ATENÇÃO> VC NÃO ESTÁ CONECTADO A INTERNET! <ATENÇÃO>')
    Result := false;
  end
  else
  begin
    if Flags and INTERNET_CONNECTION_LAN <> 0 then
      result := true;
    //ShowMessage('Você está conectado à Internet através de LAN');
    if Flags and INTERNET_CONNECTION_MODEM <> 0 then
      result := true;
    //continue;
    //  ShowMessage('Você está conectado à Internet através de MODEM');
    if Flags and INTERNET_CONNECTION_PROXY <> 0 then
      result := true;
    //Continue;
     // ShowMessage('Você está conectado à Internet através de proxy.');
  end;
end;

procedure Tdao.envia_email_suporte(corpo, assunto, end1, end2, end3,
  CC: string);
var
  registro: TRegistry;
  lista_endereco: string;
  tamstr: Integer;
begin
  if not (TestaConexao) then
    exit;

  try
    IMmail.From.Name := nom_empresa;
    IMmail.From.Address := 'informatica@plasfan.ind.br';
   // SMTP_suporte.HeloName := 'Plasfan TI';
    SMTP_suporte.Username := 'informatica@plasfan.ind.br';
    SMTP_suporte.Password := '8104cl04';
    SMTP_suporte.Port := 587;
    SMTP_suporte.Host := 'smtp.iai.terra.com.br';

    {  SMTP_suporte.IOHandler := SSLSocket;

      SSLSocket.SSLOptions.Method := sslvSSLv2;
      SSLSocket.SSLOptions.Mode := sslmClient;}

    with IMmail do
    begin
      lista_endereco := '';
      IMmail.Recipients.Clear;
      if end1 <> '' then
        IMmail.Recipients.Add.Address := end1;
      if end2 <> '' then
        IMmail.Recipients.Add.Address := end2;
      if end3 <> '' then
        IMmail.Recipients.Add.Address := end3;

      Subject := assunto;
      ClearBody;
      Body.Text := corpo;

      CCList.Clear;
      if cc <> '' then
        CCList.EMailAddresses := CC;
      if assunto = 'Erro ORBI - Análise da memória.' then
        TIdAttachmentFile.Create(IMmail.MessageParts,
          TFileName(ExtractFilePath(Application.ExeName) +
          'ORBI_MemoryManager_EventosLog.txt'))
      else
      begin
{$IFDEF ORBI}
        TIdAttachmentFile.Create(IMmail.MessageParts,
          TFileName(ExtractFilePath(Application.ExeName) + 'ERROS.LOG'));
{$ENDIF}
{$IFDEF ORBIPALM}
        TIdAttachmentFile.Create(IMmail.MessageParts,
          TFileName(ExtractFilePath(Application.ExeName) + 'ERROS.LOG'));
{$ENDIF}
      end;

      if not SMTP_suporte.Connected then
        SMTP_suporte.Connect;

      SMTP_suporte.Send(IMmail);

      SMTP_suporte.disconnect;
    end;
  except
    on e: Exception do
    begin
      msg('Houve um erro ao enviar o e-mail! ' + #13 +
        e.Message);
    end;
  end;

end;

procedure Tdao.msg(texto: string);
begin
  messagedlg(texto, mtInformation, [mbOK], 0);
end;

procedure Tdao.update_net(tabela, campo_id, campo_id2, id, id2,
  prefixo: shortString; form: TForm);
var
  i: integer;
begin
  //ex update('processo', '235', 'PR', Fr_processo);
  cmd_campos := '';
  cmd_valor := '';
  cmd := '';
  for i := 0 to form.ComponentCount - 1 do
  begin
    with form do
    begin
      if (copy(form.Components[i].Name, 1, 2) = prefixo) and
        (copy(form.Components[i].Name, 3, Length(form.Components[i].Name) - 1)
        <>
        campo_id) then
      begin
        if (form.Components[i] is TsEdit) and
          (TsEdit(form.Components[i]).Modified) then
        begin
          cmd_campos := copy(form.Components[i].Name, 3,
            Length(form.Components[i].Name) - 1);
          cmd_valor := QuotedStr(TsEdit(form.Components[i]).Text);
        end
        else if (form.Components[i] is TsComboEdit) and
          (TsComboEdit(form.Components[i]).Text <> '') then
        begin
          cmd_campos := copy(form.Components[i].Name, 3,
            Length(form.Components[i].Name) - 1);
          cmd_valor := QuotedStr(TsComboEdit(form.Components[i]).Text);
        end
        else if (form.Components[i] is TsCurrencyEdit) and
          (TsCurrencyEdit(form.Components[i]).Text <> '') and
          (TsCurrencyEdit(form.Components[i]).Text <> '0') then
        begin
          formatsettings.DecimalSeparator := '.';
          cmd_campos := copy(form.Components[i].Name, 3,
            Length(form.Components[i].Name) - 1);
          cmd_valor :=
            QuotedStr(FMFUN.BuscaTroca(TsCurrencyEdit(form.Components[i]).Text,
            ',', '.'));
          formatsettings.DecimalSeparator := ',';
        end
        else if form.Components[i] is TComboBox then
        begin
          cmd_campos := copy(form.Components[i].Name, 3,
            Length(form.Components[i].Name) - 1);
          cmd_valor := QuotedStr(inttostr(TComboBox(Components[i]).ItemIndex));
        end
        else if (form.Components[i] is TMaskEdit) and
          ((TMaskEdit(form.Components[i]).Text) <> '') then
        begin
          cmd_campos := copy(form.Components[i].Name, 3,
            Length(form.Components[i].Name) - 1);
          cmd_valor := QuotedStr(TMaskEdit(form.Components[i]).Text);
        end
        else if form.Components[i] is TsDateEdit then
        begin
          if TsDateEdit(form.Components[i]).Text <> '  /  /    ' then
          begin
            cmd_campos := copy(form.Components[i].Name, 3,
              Length(form.Components[i].Name) - 1);
            cmd_valor := QuotedStr((FormatDateTime('dd.mm.yyyy',
              TsDateEdit(form.Components[i]).Date)));
          end;
        end
        else if (form.Components[i] is TRichEdit) and
          (TRichEdit(form.Components[i]).Text <> '') then
        begin
          cmd_campos := copy(form.Components[i].Name, 3,
            Length(form.Components[i].Name) - 1);
          cmd_valor := QuotedStr(TRichEdit(form.Components[i]).Text);
        end;
        if (cmd_campos <> '') and (cmd_valor <> '') then
          cmd := cmd + cmd_campos + '=' + cmd_valor + ',';

        cmd_campos := '';
        cmd_valor := '';

      end; //end do if
    end; //end do with
  end; {end do FOR}

  //tirando a ultima virgula que fica sobrando
  cmd := copy(cmd, 1, Length(cmd) - 1);
  cmd := 'update ' + tabela + ' set ' + cmd + ' where ' + campo_id + '=' +
    QuotedStr(id) + ' and ' + campo_id2 + '=' + QuotedStr(id2);

  with Q_update_net do
  begin
    close;
    sql.Clear;
    sql.add(cmd);
    ExecSQL;
    close;
  end;
  grava_log(cmd, '');

end;

procedure Tdao.Exec_sqlError(Sender: TObject; const ERRCODE: Integer;
  ErrorMessage, ErrorCodes: TStringList; const SQLCODE: Integer;
  SQLMessage, SQL: TStringList; var RaiseException: Boolean);
begin
  //  ShowMessage(dao.Exec_sql.SQL.Text);
end;

procedure Tdao.ResetPreparedQueries;
var
  I: Integer;
  Q: TFDQuery;
begin
  for I := 0 to ComponentCount - 1 do
    if Components[I] is TFDQuery then
    begin
      Q := TFDQuery(Components[I]);
      try
        Q.Prepared := False;
      except
      end;
    end;
end;

procedure Tdao.ConfigurarExecucaoDireta;
var
  I: Integer;
  Q: TFDQuery;
begin
  for I := 0 to ComponentCount - 1 do
    if Components[I] is TFDQuery then
    begin
      Q := TFDQuery(Components[I]);
      Q.ResourceOptions.DirectExecute := True;
    end;
end;
procedure Tdao.Reconectar;
begin
  try
    if tentativa_conexao = 0 then
      if fmfun.Dc_MessageDlg('Sem conexão. Esperar conectar?', mtConfirmation,
        [mbyes, mbno], 0, mrno) = mrno then
      begin
{$IFDEF ORBI}
        fmfun.TerminarProcesso('TelasOrbi.exe');
        fmfun.TerminarProcesso('Orbi.exe');
{$ENDIF}
{$IFDEF ORBIPALM}
        fmfun.TerminarProcesso('OrbiPalm.exe');
{$ENDIF}
      end;

    cn.connected := false;
    tentativa_conexao := tentativa_conexao + 1;

{$IFDEF ORBI}
    fm_splash.ggProgress.Progress := tentativa_conexao;
    fm_splash.ggProgress.MaxValue := 20;
    fm_splash.lbStatus.caption := 'Sem Conexão! Tentativa de Conexão...';
    fm_splash.Show;
    fm_splash.refresh;
{$ENDIF}

{$IFDEF ORBIPALM}
    fmPrincipal.PgItem.Progress := tentativa_conexao;
    fmPrincipal.PgItem.MaxValue := 20;
    fmPrincipal.LbItem.caption := 'Sem Conexão! Tentativa de Conexão...';
    fmPrincipal.Show;
    fmPrincipal.refresh;
{$ENDIF}

    Screen.Cursor := crArrow;
    sleep(1000);
    if tentativa_conexao < 20 then
    begin
      cn.Connected := True;
      ResetPreparedQueries;
    end
    else
    begin
{$IFDEF ORBI}
      fmfun.TerminarProcesso('TelasOrbi.exe');
      fmfun.TerminarProcesso('Orbi.exe');
{$ENDIF}
{$IFDEF ORBIPALM}
      fmfun.TerminarProcesso('OrbiPalm.exe');
{$ENDIF}
    end;
  except
  end;
end;

procedure Tdao.CNError(Sender: TObject; const ERRCODE: Integer;
  ErrorMessage, ErrorCodes: TStringList; const SQLCODE: Integer;
  SQLMessage, SQL: TStringList; var RaiseException: Boolean);
begin
  if (ERRCODE = 0) or (ERRCODE = 335544726) or (ERRCODE = 335544727) then
  begin
    RaiseException := false;
    Reconectar;
  end;

  if ERRCODE = 335544336 then
  begin
    try
      RaiseException := false;
      fm_splash.hide;
      fm_splash.ggProgress.Progress := tentativa_conexao;
      fm_splash.ggProgress.MaxValue := 10;
      fm_splash.lbStatus.caption :=
        'Erro no Inicio de Transação... Tente Novamente!';
      fm_splash.Show;
      fm_splash.refresh;
      sleep(2000);
      fm_splash.hide;
    except
    end;
  end;

{$IFDEF ORBIPALM}
  {  if (ERRCODE = 335544726) or (ERRCODE = 335544727) then
      fmPrincipal.ReiniciaImportacao;}
{$ENDIF}

end;


procedure Tdao.DesabilitarTimers;
begin
{$IFDEF ORBI}
  if frpri <> nil then
    frpri.DesabilitaTimers;
{$ENDIF}
end;

procedure Tdao.HabilitarTimers;
begin
{$IFDEF ORBI}
  if frpri <> nil then
    frpri.HabilitaTimers;
{$ENDIF}
end;

procedure Tdao.FormCreate(Sender: TObject);
begin
  tentativa_conexao := 0;
  ConfigurarExecucaoDireta;
  ResetPreparedQueries;
end;

procedure Tdao.CN_ExportError(Sender: TObject; const ERRCODE: Integer;
  ErrorMessage, ErrorCodes: TStringList; const SQLCODE: Integer;
  SQLMessage, SQL: TStringList; var RaiseException: Boolean);
begin
{$IFDEF ORBIPALM}
  {  if (ERRCODE = 0) or (ERRCODE = 335544726) or (ERRCODE = 335544727) then
      fmPrincipal.ReiniciaExportacao;}
{$ENDIF}
end;

end.






