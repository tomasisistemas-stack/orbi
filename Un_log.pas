unit Un_log;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Mask, ExtCtrls, Buttons, DB,
  RxMemDS, DBCtrls, sPanel, sBitBtn, sLabel, sCheckBox, acDBGrid, sEdit,
  sMaskEdit, sCustomComboEdit, sTooledit, sComboEdit;

type
  TFr_log = class(TForm)
    Panel1: tsPanel;
    Panel2: tsPanel;
    Panel3: tsPanel;
    Label1: tsLabel;
    Label2: tsLabel;
    Label3: tsLabel;
    Label4: tsLabel;
    Label5: tsLabel;
    Label6: tsLabel;
    EdDt_ini: TsDateEdit;
    Eddt_Fim: TsDateEdit;
    Ed_Hr_ini: TMaskEdit;
    Ed_Hr_Fim: TMaskEdit;
    Prcod_usuario: TsComboEdit;
    lb_nom_ocupacao: tsLabel;
    Ed_descricao: TsEdit;
    ed_log: Tdbgrid;
    btok: TsBitBtn;
    mmLog: TRxMemoryData;
    dsLog: TDataSource;
    mmLogID: TIntegerField;
    mmLogLOGUSU: TStringField;
    mmLogDATA: TDateField;
    mmLogHORA: TTimeField;
    mmLogDESCRICAO: TBlobField;
    mmLogIP: TStringField;
    DBMemo1: TDBMemo;
    mmLogCOMPUTADOR: TStringField;
    procedure Prcod_usuarioButtonClick(Sender: TObject);
    procedure btokClick(Sender: TObject);
    procedure Prcod_usuarioExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr_log: TFr_log;


implementation

uses un_dao, Un_localizar, unpri;

{$R *.dfm}

procedure TFr_log.Prcod_usuarioButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  Fr_localizar.Caption := 'Localizar Usuário';
  chamou_pesquisa := 'fr_log';
  chamou_form := 'fr_log';
  chamou_cadastro := 'fr_log';

 //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';

  for i := 0 to 1 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  Fr_localizar.ShowModal;


  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
end;

procedure TFr_log.btokClick(Sender: TObject);
var
  sql: string;
begin
  sql := 'SELECT a.ID, a.COD_USUARIO_LOGADO, U.LOGUSU, a.DATA, a.HORA, a.DESCRICAO, a.COD_EMPRESA, a.IP, a.NIVEL, A.COMPUTADOR FROM LOG a INNER JOIN TBUSU U ON (U.CODUSU = A.COD_USUARIO_LOGADO) where 1 = 1 ';
  if eddt_ini.Date <> 0 then
    sql := sql + ' and a.data >= ' + quotedstr(formatdatetime('dd.mm.yyyy', eddt_ini.Date));
  if eddt_fim.Date <> 0 then
    sql := sql + ' and a.data <= ' + quotedstr(formatdatetime('dd.mm.yyyy', eddt_fim.Date));
  if trim(ed_hr_ini.Text) <> ':' then
    sql := sql + ' and a.hora >= ' + quotedstr(ed_hr_ini.Text);
  if trim(ed_hr_fim.Text) <> ':' then
    sql := sql + ' and a.hora <= ' + quotedstr(ed_hr_fim.Text);
  if trim(prcod_usuario.Text) <> '' then
    sql := sql + ' and a.cod_usuario_logado = ' + prcod_usuario.Text;
  if trim(ed_descricao.Text) <> '' then
    sql := sql + ' and a.DESCRICAO like ''%' + ed_descricao.Text + '%''';
  sql := sql + ' order by a.data desc, a.hora desc, a.id desc ';
  dao.Geral1(sql);

  dao.Q1.First;

  mmLog.Close;
  mmLog.EmptyTable;
  mmLog.Open;
  while not dao.Q1.eof do
  begin
    mmLog.Append;
    mmLogID.AsString := dao.Q1.fieldbyname('ID').AsString;
    mmLogDESCRICAO.AsString := dao.Q1.fieldbyname('DESCRICAO').AsString;
    mmLogLOGUSU.Value := dao.Q1.fieldbyname('LOGUSU').AsString;
    mmLogDATA.Value := dao.Q1.fieldbyname('DATA').AsDateTime;
    mmLogHORA.Value := dao.Q1.fieldbyname('HORA').AsDateTime;
    mmLogIP.Value := dao.Q1.fieldbyname('IP').AsString;
    mmLogCOMPUTADOR.Value := dao.Q1.fieldbyname('COMPUTADOR').AsString;    

    mmLog.Post;
    dao.Q1.next;
  end;
  mmLog.First;
end;

procedure TFr_log.Prcod_usuarioExit(Sender: TObject);
begin
  if trim(Prcod_usuario.Text) <> '' then
  begin
    dao.Geral2('SELECT a.CODUSU, a.LOGUSU FROM TBUSU a where codusu=' + QuotedStr(Prcod_usuario.Text));

    if dao.q2.RecordCount > 0 then
      lb_nom_ocupacao.Caption := dao.Q2.fieldbyname('LOGUSU').AsString
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_usuario.Text := '';
      Exit;
    end;
  end
  else
    lb_nom_ocupacao.Caption := '...';
end;

end.

