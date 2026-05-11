unit Un_calcular_comissoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, frxClass, DB,
   RxMemDS, DBCtrls, Mask, xmldom, XMLIntf,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  msxmldom, XMLDoc, sSpeedButton, sPanel, sBitBtn,
  sLabel, sCheckBox, acDBGrid, sMaskEdit, sCustomComboEdit, sTooledit,
  sEdit, sComboEdit;

type
  TFmCalcularComissao = class(TForm)
    Panel3: tsPanel;
    mmSalario: TRxMemoryData;
    dsPalm: TDataSource;
    dgPalm: Tdbgrid;
    Panel4: tsPanel;
    Panel5: tsPanel;
    btok: TsBitBtn;
    Lbl_produto: tsLabel;
    cod_representante: TsComboEdit;
    Lbnom_representante: tsLabel;
    edRepresentante: TsEdit;
    sbFunc: TsSpeedButton;
    mmSalarioID: TIntegerField;
    mmSalarioCOD_FORNECEDOR: TIntegerField;
    mmSalarioNR_DOCUMENTO: TStringField;
    mmSalarioTITULO: TStringField;
    mmSalarioSEQUENCIA: TIntegerField;
    mmSalarioDTAVEN: TDateField;
    mmSalarioDTAPAG: TDateField;
    mmSalarioVALOR: TCurrencyField;
    mmSalarioCOD_REPRESENTANTE: TIntegerField;
    mmSalarioNOME_REPRESENTANTE: TStringField;
    ftMovDe: TsDateEdit;
    Label1: tsLabel;
    ftMovAte: TsDateEdit;
    Label2: tsLabel;
    Panel2: tsPanel;
    Label4: tsLabel;
    Label5: tsLabel;
    edMovDe: TsDateEdit;
    edMovAte: TsDateEdit;
    Label6: tsLabel;
    edVcto: TsDateEdit;
    btCalcular: TsSpeedButton;
    procedure cod_representanteButtonClick(Sender: TObject);
    procedure cod_representanteExit(Sender: TObject);
    procedure sbFuncClick(Sender: TObject);
    procedure btokClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btCalcularClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure CarregaDados;
    procedure CarregaGrid;
  public
    { Public declarations }
  end;

var
  FmCalcularComissao: TFmCalcularComissao;
  totalselecionados: integer;

implementation

uses UnFun, Un_dao, Un_localizar,  UnPri, Un_dm;

{$R *.dfm}

procedure TFmCalcularComissao.CarregaDados;
var
  sql, where: string;
begin
  sql := 'SELECT R.ID, R.NOM_REPRESENTANTE, CP.COD_FORNECEDOR, CP.DTAVEN, CP.VALOR ' +
    'FROM REPRESENTANTE R ' +
    'INNER JOIN CP1 CP ON (CP.COD_REPRESENTANTE = R.ID) ';

  where := 'WHERE ( R.FUNCIONARIO <> ''2'' AND R.ATIVO = ''S''  AND (CP.ID_PLANO_CONTAS IN ( SELECT c.COMISSAO_PLANO_CONTAS FROM CONFIGURACAO C) )) ';

  if trim(edRepresentante.Text) <> '' then
    where := where + fmfun.cmdAux('R.id', edRepresentante.Text);

  if (ftMovDe.Date <> 0) and (ftMovAte.Date <> 0) then
    where := where + ' AND CP.DTAVEN between ' + quotedstr(formatdatetime('dd/mm/yyyy', ftMovDe.Date)) + ' AND ' + quotedstr(formatdatetime('dd/mm/yyyy', ftMovAte.Date));

  dao.Geral1(sql + where + ' ORDER BY R.NOM_REPRESENTANTE ');

  CarregaGrid;
end;

procedure TFmCalcularComissao.CarregaGrid;
begin
  dao.Q1.first;
  mmSalario.Close;
  mmSalario.EmptyTable;
  mmSalario.Open;
  while not dao.Q1.eof do
  begin
    mmSalario.Append;
    mmSalarioCOD_REPRESENTANTE.AsString := dao.Q1.fieldbyname('ID').AsString;
    mmSalarioNOME_REPRESENTANTE.AsString := dao.Q1.fieldbyname('NOM_REPRESENTANTE').AsString;
    mmSalarioCOD_FORNECEDOR.AsString := dao.Q1.fieldbyname('COD_FORNECEDOR').AsString;
    mmSalarioDTAVEN.AsString := dao.Q1.fieldbyname('DTAVEN').AsString;
    mmSalarioVALOR.AsString := dao.Q1.fieldbyname('VALOR').AsString;
    mmSalario.Post;
    dao.Q1.next;
  end;
  mmSalario.First;
end;

procedure TFmCalcularComissao.cod_representanteButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  //guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Representante';

  chamou_pesquisa := 'fr_representante';
  chamou_form := 'fr_comissao_representante';
  chamou_cadastro := 'fr_representante';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Represenante';

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 5);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'Empresa';
  Campos_combo[3] := 'CNPJ';
  Campos_combo[4] := 'CPF';

  for i := 0 to 4 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;

  Fr_localizar.CBcampos.ItemIndex := 1;

  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFmCalcularComissao.cod_representanteExit(Sender: TObject);
begin
  if cod_representante.Text <> '' then
  begin
    dao.Geral2('select ID, NOM_REPRESENTANTE from REPRESENTANTE where funcionario <> ''2'' and id =' + QuotedStr(cod_representante.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_representante.Caption := dao.Q2.fieldbyname('nom_representante').AsString;
      if edRepresentante.Text = '' then
        edRepresentante.Text := cod_representante.Text;
    end
    else
    begin
      dao.msg('Registro não Encontrado ou não registrado como Funcionário!');
      cod_representante.Text := '';
      cod_representante.SetFocus;
      Exit;
    end;
  end;
end;

procedure TFmCalcularComissao.sbFuncClick(Sender: TObject);
begin
  edRepresentante.Clear;
end;

procedure TFmCalcularComissao.btokClick(Sender: TObject);
begin
  CarregaDados;
end;

procedure TFmCalcularComissao.FormShow(Sender: TObject);
begin
  btokClick(self);
end;

procedure TFmCalcularComissao.btCalcularClick(Sender: TObject);
var
  st_salario_liquido, sql_exec: string;
  fl_salario_liquido: double;

begin
  dao.Geral4(' SELECT R.ID, R.NOM_REPRESENTANTE, coalesce(R.SALARIO, 0) AS SALARIO,' +
    ' coalesce((SELECT SUM(CN.VLR_COMISSAO) FROM V_COMISSAO_NOVA2 CN ' +
    ' WHERE CN.CODREP = R.ID AND CN.FATURADO = ''1'' AND CN.DTA_EMISSAO between ' + QuotedStr(formatdatetime('dd/mm/yyyy', edMovDe.Date)) + ' AND ' + QuotedStr(formatdatetime('dd/mm/yyyy', edMovAte.Date)) + '),0) AS COMISSAO, ' +
    ' coalesce((SELECT SUM(VALOR) FROM CP1 CP WHERE CP.COD_REPRESENTANTE = R.ID AND CP.ID_PLANO_CONTAS NOT IN (( SELECT c.SALARIO_PLANO_CONTAS FROM CONFIGURACAO C), ( SELECT c.COMISSAO_PLANO_CONTAS FROM CONFIGURACAO C)) AND CP.DTAVEN between ' + QuotedStr(formatdatetime('dd/mm/yyyy', edMovDe.Date)) + ' AND ' + QuotedStr(formatdatetime('dd/mm/yyyy', edMovAte.Date)) + '),0) AS VALES, ' +
    '(select c.COMISSAO_FORNECEDOR from CONFIGURACAO c) as FORNECEDOR, ( SELECT c.COMISSAO_PLANO_CONTAS FROM CONFIGURACAO C) AS PLANO_CONTAS ' +
    ' FROM REPRESENTANTE R WHERE R.FUNCIONARIO <> ''2'' AND R.ATIVO = ''S''');

  try
    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
    dao.Exec_sql.SQL.Clear;
    dao.Exec_sql.SQL.Add('DELETE FROM CP1 WHERE DTAVEN = ' + quotedstr(formatdatetime('dd/mm/yyyy', edVcto.date)) + ' AND ID_PLANO_CONTAS = ' + dao.Q4.FieldByName('PLANO_CONTAS').AsString);
    dao.Exec_sql.ExecSQL;
    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;

  try
    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
    dao.Q4.First;
    while not dao.Q4.Eof do
    begin
      fl_salario_liquido := (dao.Q4.FieldByName('SALARIO').AsFloat + dao.Q4.FieldByName('COMISSAO').AsFloat) - dao.Q4.FieldByName('VALES').AsFloat;
      st_salario_liquido := StringReplace(floattostr(fl_salario_liquido), ',', '.', [rfReplaceAll]);
      if fl_salario_liquido > 0 then
      begin
        sql_exec := 'INSERT INTO CP1 (COD_FORNECEDOR, SEQUENCIA, TITULO, DTAVEN, VALOR, HISTORICO, OBS, ID_PLANO_CONTAS, COD_REPRESENTANTE) VALUES ( ';
        sql_exec := sql_exec + dao.Q4.FieldByName('FORNECEDOR').AsString + ', 1, ''0000'', ';
        sql_exec := sql_exec + quotedstr(formatdatetime('dd/mm/yyyy', edVcto.date)) + ', ';
        sql_exec := sql_exec + st_salario_liquido + ', ';
        sql_exec := sql_exec + quotedstr(dao.Q4.FieldByName('NOM_REPRESENTANTE').AsString) + ', ';
        sql_exec := sql_exec + quotedstr(dao.Q4.FieldByName('NOM_REPRESENTANTE').AsString + ' REF.: De ' + quotedstr(formatdatetime('dd/mm/yyyy', edMovDe.Date) + ' até ' + quotedstr(formatdatetime('dd/mm/yyyy', edMovAte.Date)))) + ', ';
        sql_exec := sql_exec + dao.Q4.FieldByName('PLANO_CONTAS').AsString + ', ';
        sql_exec := sql_exec + dao.Q4.FieldByName('ID').AsString + ')';

        dao.Exec_sql.SQL.Clear;
        dao.Exec_sql.SQL.Add(sql_exec);
        dao.Exec_sql.ExecSQL;
      end;
      dao.Q4.Next;
    end;
    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;
  ftMovDe.Date := edVcto.Date;
  ftMovAte.Date := edVcto.Date;
  btokClick(Self);
end;

procedure TFmCalcularComissao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

end.

