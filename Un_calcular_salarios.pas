unit Un_calcular_salarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, frxClass, DB,
   RxMemDS, DBCtrls, Mask, xmldom, XMLIntf,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  msxmldom, XMLDoc, sSpeedButton, sPanel, sBitBtn,
  sLabel, sCheckBox, frxExportPDF, acDBGrid, sMaskEdit, sCustomComboEdit,
  sTooledit, sEdit, sComboEdit, sGroupBox, sDBText, sDBEdit, frxExportBaseDialog;

type
  TFmCalcularSalario = class(TForm)
    Panel3: tsPanel;
    mmSalario: TRxMemoryData;
    dsSalario: TDataSource;
    dgSalario: Tdbgrid;
    Panel4: tsPanel;
    Panel5: tsPanel;
    btok: TsBitBtn;
    Lbl_Colaborador: TsLabel;
    cod_funcionario: TsComboEdit;
    Lbnom_funcionario: tsLabel;
    edFuncionario: TsEdit;
    sbFunc: TsSpeedButton;
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
    mmSalarioPLR: TCurrencyField;
    mmSalarioTOTAL: TCurrencyField;
    fR_RELATORIO: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    sPanel1: TsPanel;
    btImprimir: TsSpeedButton;
    mmSalarioVALES: TCurrencyField;
    mmSalarioCOMISSOES: TCurrencyField;
    sPanel2: TsPanel;
    sbAlterar: TsSpeedButton;
    sbSalvar: TsBitBtn;
    gbSalario: TsGroupBox;
    sGroupBox1: TsGroupBox;
    gbPLR: TsGroupBox;
    GBVales: TsGroupBox;
    sGroupBox2: TsGroupBox;
    sDBText1: TsDBText;
    sDBText2: TsDBText;
    sDBText3: TsDBText;
    sDBText4: TsDBText;
    sGroupBox3: TsGroupBox;
    sDBText5: TsDBText;
    edPLR: TsDBEdit;
    btnSalvar: TsSpeedButton;
    mmSalarioID: TIntegerField;
    mmSalarioID_PLR: TIntegerField;
    Tipo: TsGroupBox;
    ckRepTerc: TsCheckBox;
    ckRepInt: TsCheckBox;
    ckFuncEsc: TsCheckBox;
    ckFuncFab: TsCheckBox;
    ckTodos: TsCheckBox;
    ckTelemarketing: TsCheckBox;
    procedure cod_funcionarioButtonClick(Sender: TObject);
    procedure cod_funcionarioExit(Sender: TObject);
    procedure sbFuncClick(Sender: TObject);
    procedure btokClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btCalcularClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btImprimirClick(Sender: TObject);
    procedure fR_RELATORIOGetValue(const VarName: string;
      var Value: Variant);
    procedure sbAlterarClick(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure edPLRExit(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure ckTodosClick(Sender: TObject);
    procedure edFuncionarioChange(Sender: TObject);
  private
    { Private declarations }
    procedure CarregaDados;
    procedure CarregaGrid;
    function ValidarFiltro: boolean;
  public
    { Public declarations }
  end;

var
  FmCalcularSalario: TFmCalcularSalario;
  totalselecionados: integer;

implementation

uses UnFun, Un_dao, Un_localizar,  UnPri, Un_dm, un_definir_saldo_inicial,
  Math;

{$R *.dfm}

procedure TFmCalcularSalario.CarregaDados;
var
  sql, where, tipo_rep: string;
begin
  sql := ' SELECT DISTINCT R.ID as codrep, R.NOM_REPRESENTANTE, CP.DTAVEN, ' +
    '   coalesce((SELECT MAX(CP1.ID) FROM CP1 WHERE CP1.ID_PLANO_CONTAS = ( SELECT c.SALARIO_PLANO_CONTAS FROM CONFIGURACAO C) AND CP1.COD_REPRESENTANTE = R.ID AND CP1.DTAVEN = CP.DTAVEN),0) AS ID, ' +
    '   coalesce(r.salario,0) AS VALOR, ' +
    '   coalesce((SELECT MAX(CP_PLR.ID) FROM CP1 CP_PLR WHERE CP_PLR.ID_PLANO_CONTAS = ( SELECT c.PLR_PLANO_CONTAS FROM CONFIGURACAO C) AND CP_PLR.COD_REPRESENTANTE = R.ID AND CP_PLR.DTAVEN = CP.DTAVEN),0) AS ID_PLR, ' +
    '   coalesce((SELECT SUM(CP_PLR.VALOR) FROM CP1 CP_PLR WHERE CP_PLR.ID_PLANO_CONTAS = ( SELECT c.PLR_PLANO_CONTAS FROM CONFIGURACAO C) AND CP_PLR.COD_REPRESENTANTE = R.ID AND CP_PLR.DTAVEN = CP.DTAVEN),0) AS PLR, ' +
    '   coalesce((SELECT SUM(CP1.VALOR) FROM CP1 WHERE CP1.ID_PLANO_CONTAS = ( SELECT c.VALE_PLANO_CONTAS FROM CONFIGURACAO C) AND CP1.COD_REPRESENTANTE = R.ID AND ' +
    '   EXTRACT(MONTH FROM CP1.DTAVEN)||''/''||EXTRACT(YEAR FROM CP1.DTAVEN) = EXTRACT(MONTH FROM CP.DTAVEN-32)||''/''||EXTRACT(YEAR FROM CP.DTAVEN-32)),0) AS VALES, ' +
    '   case when r.PERC_COMISSAO_FIXA > 0 then coalesce((SELECT sum(case when r.COMISSAO_FIXA = ''S'' THEN A.VLR_COMISSAO_FIXA - a.COMISSAO_DESC ELSE a.VLR_COMISSAO END)  as total FROM V_COMISSAO_NOVA a ' +
    '   where extract(month from a.DTA_EMISSAO)||''/''||extract(year from a.DTA_EMISSAO) = EXTRACT(MONTH FROM CP.DTAVEN-32)||''/''||EXTRACT(YEAR FROM CP.DTAVEN-32) and a.FATURADO = 1 and a.CODREP = R.ID ),0) else 0 end AS COMISSOES ' +
    ' FROM REPRESENTANTE R INNER JOIN CP1 CP ON (CP.COD_REPRESENTANTE = R.ID) ';

  where := 'WHERE R.ATIVO = ''S'' AND CP.ID_PLANO_CONTAS NOT IN ( SELECT c.VALE_PLANO_CONTAS FROM CONFIGURACAO C) ';

  if trim(edFuncionario.Text) <> '' then
    where := where + fmfun.cmdAux('R.id', edFuncionario.Text);

  if (ftMovDe.Date <> 0) and (ftMovAte.Date <> 0) then
    where := where + ' AND CP.DTAVEN between ' + quotedstr(formatdatetime('dd/mm/yyyy', ftMovDe.Date)) + ' AND ' + quotedstr(formatdatetime('dd/mm/yyyy', ftMovAte.Date));

  tipo_rep := tipo_rep + '';

  if ckRepTerc.Checked then
    tipo_rep := tipo_rep + tipo_rep + '''0'',';

  if ckRepInt.Checked then
    tipo_rep := tipo_rep + '''1'',';

  if ckFuncEsc.Checked then
    tipo_rep := tipo_rep + '''2'',';

  if ckFuncFab.Checked then
    tipo_rep := tipo_rep + '''3'',';

  if ckTelemarketing.Checked then
    tipo_rep := tipo_rep + '''4'',';


  if tipo_rep <> '' then
  begin
    tipo_rep := copy(tipo_rep, 1, length(tipo_rep) - 1);
    where := where + ' AND R.FUNCIONARIO IN (' + tipo_rep + ') ';
  end;

  dao.Geral1(sql + where + ' ORDER BY R.NOM_REPRESENTANTE ');

  CarregaGrid;
end;

procedure TFmCalcularSalario.CarregaGrid;
begin
  dao.Q1.first;
  mmSalario.Close;
  mmSalario.EmptyTable;
  mmSalario.Open;
  while not dao.Q1.eof do
  begin
    mmSalario.Append;
    mmSalarioID.AsString := dao.Q1.fieldbyname('ID').AsString;
    mmSalarioID_PLR.AsString := dao.Q1.fieldbyname('ID_PLR').AsString;
    mmSalarioCOD_REPRESENTANTE.AsString := dao.Q1.fieldbyname('CODREP').AsString;
    mmSalarioNOME_REPRESENTANTE.AsString := dao.Q1.fieldbyname('NOM_REPRESENTANTE').AsString;
    mmSalarioDTAVEN.AsString := dao.Q1.fieldbyname('DTAVEN').AsString;
    mmSalarioVALOR.Value := dao.Q1.fieldbyname('VALOR').Value;
    mmSalarioPLR.Value := dao.Q1.fieldbyname('PLR').Value;
    mmSalarioVALES.Value := dao.Q1.fieldbyname('VALES').Value;
    mmSalarioCOMISSOES.Value := dao.Q1.fieldbyname('COMISSOES').Value;
    mmSalarioTOTAL.VALUE := mmSalarioVALOR.Value + mmSalarioCOMISSOES.Value + mmSalarioPLR.Value - mmSalarioVALES.Value;
    mmSalario.Post;
    dao.Q1.next;
  end;
  mmSalario.First;
end;

procedure TFmCalcularSalario.cod_funcionarioButtonClick(Sender: TObject);
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
  chamou_form := 'fr_salario_representante';
  chamou_cadastro := 'fr_representante';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Represenante';

  if tipo_usuario < '4' then
    Fr_localizar.BT_cadastro.Visible := false
  else
    Fr_localizar.BT_cadastro.Visible := true;

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

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

  edFuncionario.Text := edFuncionario.Text + ';' + cod_funcionario.Text;
  if pos(';', edFuncionario.Text) = 1 then
    edFuncionario.Text := copy(edFuncionario.Text, 2, length(edFuncionario.Text));

end;

procedure TFmCalcularSalario.cod_funcionarioExit(Sender: TObject);
begin
  if cod_funcionario.Text <> '' then
  begin

    if (not FMFUN.verificaNumerico(cod_funcionario.Text)) and
      (length(cod_funcionario.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      cod_funcionario.SetFocus;
      exit;
    end;

    dao.Geral2('select ID, NOM_REPRESENTANTE from REPRESENTANTE where id =' + QuotedStr(cod_funcionario.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_funcionario.Caption := dao.Q2.fieldbyname('nom_representante').AsString;
      edFuncionario.Text := edFuncionario.Text + ';' + cod_funcionario.Text;
      if pos(';', edFuncionario.Text) = 1 then
        edFuncionario.Text := copy(edFuncionario.Text, 2, length(edFuncionario.Text));
    end
    else
    begin
      dao.msg('Registro não Encontrado ou não registrado como Funcionário!');
      cod_funcionario.Text := '';
      cod_funcionario.SetFocus;
      Exit;
    end;
  end;
end;

procedure TFmCalcularSalario.sbFuncClick(Sender: TObject);
begin
  edFuncionario.Clear;
end;

procedure TFmCalcularSalario.btokClick(Sender: TObject);
begin
  CarregaDados;
end;

procedure TFmCalcularSalario.FormShow(Sender: TObject);
begin
  ckFuncEsc.Checked := true;
  ftMovDe.Text := formatdatetime('01/mm/yyyy', now);
  ftMovAte.text := formatdatetime('28/mm/yyyy', now);
  btokClick(self);
end;

procedure TFmCalcularSalario.btCalcularClick(Sender: TObject);
var
  st_salario_liquido, st_plr, st_comissoes, sql_exec, funcionario, func_cp, tipo_rep: string;
  fl_salario_liquido, fl_plr, fl_comissoes: double;

begin
  if not ValidarFiltro then exit;

  funcionario := '';

  if trim(edFuncionario.Text) <> '' then
    funcionario := fmfun.cmdAux('R.ID', edFuncionario.Text);

  tipo_rep := tipo_rep + '';

  if ckRepTerc.Checked then
    tipo_rep := tipo_rep + '''0'',';

  if ckRepInt.Checked then
    tipo_rep := tipo_rep + '''1'',';

  if ckFuncEsc.Checked then
    tipo_rep := tipo_rep + '''2'',';

  if ckFuncFab.Checked then
    tipo_rep := tipo_rep + '''3'',';

  if ckTelemarketing.Checked then
    tipo_rep := tipo_rep + '''4'',';

  if tipo_rep <> '' then
  begin
    tipo_rep := copy(tipo_rep, 1, length(tipo_rep) - 1);
    funcionario := funcionario + ' AND R.FUNCIONARIO IN (' + tipo_rep + ') ';
  end;

  dao.Geral4('SELECT R.ID, R.NOM_REPRESENTANTE, coalesce(R.SALARIO, 0) AS SALARIO, coalesce(R.PLR_VALOR, 0) AS PLR_VALOR, ' +
    'case when r.funcionario in (''0'',''1'',''4'') then case when r.PERC_COMISSAO_FIXA is not null then  coalesce((SELECT case when R.COMISSAO_FIXA = ''S'' then sum(a.VLR_COMISSAO_FIXA) - sum(a.COMISSAO_DESC) else sum(a.VLR_COMISSAO) end as total '+
    'FROM V_COMISSAO_NOVA a where a.DTA_EMISSAO between ' + quotedstr(formatdatetime('dd/mm/yyyy', edMovDe.date)) + '  AND  ' + quotedstr(formatdatetime('dd/mm/yyyy', edMovAte.date)) +
    ' and  a.FATURADO = 1  and a.CODREP = r.id), 0) '+
    'else 0 end else 0 end as comissoes, ' +
    'R.PLR, ' +
    'R.PLR_FABRICA, ' +
    'coalesce((SELECT sum(CP1.VALOR) FROM CP1 WHERE CP1.ID_PLANO_CONTAS = ( SELECT c.VALE_PLANO_CONTAS FROM CONFIGURACAO C) AND CP1.COD_REPRESENTANTE = R.ID AND CP1.DTAVEN between ' + quotedstr(formatdatetime('dd/mm/yyyy', edMovDe.date)) + '  AND  ' + quotedstr(formatdatetime('dd/mm/yyyy', edMovAte.date)) + '),0) AS VALES, ' +
    '(select c.SALARIO_FORNECEDOR from CONFIGURACAO c) as FORNECEDOR, ( SELECT c.SALARIO_PLANO_CONTAS FROM CONFIGURACAO C) AS PLANO_CONTAS, ' +
    '(select c.PLR_FORNECEDOR from CONFIGURACAO c) as FORNECEDOR_PLR, ( SELECT c.PLR_PLANO_CONTAS FROM CONFIGURACAO C) AS PLANO_CONTAS_PLR, ' +
    '(select c.COMISSAO_FORNECEDOR from CONFIGURACAO c) as FORNECEDOR_COMISSAO, ( SELECT c.COMISSAO_PLANO_CONTAS FROM CONFIGURACAO C) AS PLANO_CONTAS_COMISSAO ' +
    'FROM REPRESENTANTE R ' +
    'WHERE r.NOM_REPRESENTANTE is not null and R.ATIVO = ''S''' + funcionario);
  try
    func_cp := '';

    if trim(edFuncionario.Text) <> '' then
      func_cp := fmfun.cmdAux('COD_REPRESENTANTE', edFuncionario.Text);

    tipo_rep := '';

    if ckRepTerc.Checked then
      tipo_rep := tipo_rep + '''0'',';

    if ckRepInt.Checked then
      tipo_rep := tipo_rep + '''1'',';

    if ckFuncEsc.Checked then
      tipo_rep := tipo_rep + '''2'',';

    if ckFuncFab.Checked then
      tipo_rep := tipo_rep + '''3'',';

    if ckTelemarketing.Checked then
      tipo_rep := tipo_rep + '''4'',';


    if tipo_rep <> '' then
    begin
      tipo_rep := copy(tipo_rep, 1, length(tipo_rep) - 1);
      func_cp := func_cp + ' AND COD_REPRESENTANTE IN (SELECT R.ID FROM REPRESENTANTE R WHERE R.FUNCIONARIO IN (' + tipo_rep + ')) ';
    end;

    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
    dao.Exec_sql.SQL.Clear;
    dao.Exec_sql.SQL.Add('DELETE FROM CP1 WHERE DTAVEN = ' + quotedstr(formatdatetime('dd/mm/yyyy', edVcto.date)) + ' AND ID_PLANO_CONTAS = ' + dao.Q4.FieldByName('PLANO_CONTAS').AsString + func_cp);
    dao.Exec_sql.ExecSQL;

    dao.Exec_sql.SQL.Clear;
    dao.Exec_sql.SQL.Add('DELETE FROM CP1 WHERE DTAVEN = ' + quotedstr(formatdatetime('dd/mm/yyyy', edVcto.date)) + ' AND ID_PLANO_CONTAS = ' + dao.Q4.FieldByName('PLANO_CONTAS_PLR').AsString + func_cp);
    dao.Exec_sql.ExecSQL;

    dao.Exec_sql.SQL.Clear;
    dao.Exec_sql.SQL.Add('DELETE FROM CP1 WHERE DTAVEN = ' + quotedstr(formatdatetime('dd/mm/yyyy', edVcto.date)) + ' AND ID_PLANO_CONTAS = ' + dao.Q4.FieldByName('PLANO_CONTAS_COMISSAO').AsString + func_cp);
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
      fl_salario_liquido := dao.Q4.FieldByName('SALARIO').AsFloat - dao.Q4.FieldByName('VALES').AsFloat;
      st_salario_liquido := StringReplace(floattostr(fl_salario_liquido), ',', '.', [rfReplaceAll]);

      fl_comissoes := dao.Q4.FieldByName('COMISSOES').AsFloat;
      st_comissoes := StringReplace(floattostr(fl_comissoes), ',', '.', [rfReplaceAll]);

    {  if fl_salario_liquido > 0 then
      begin}
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
{      end;}


      if fl_comissoes > 0 then
      begin
        sql_exec := 'INSERT INTO CP1 (COD_FORNECEDOR, SEQUENCIA, TITULO, DTAVEN, VALOR, HISTORICO, OBS, ID_PLANO_CONTAS, COD_REPRESENTANTE) VALUES ( ';
        sql_exec := sql_exec + dao.Q4.FieldByName('FORNECEDOR_COMISSAO').AsString + ', 1, ''0000'', ';
        sql_exec := sql_exec + quotedstr(formatdatetime('dd/mm/yyyy', edVcto.date)) + ', ';
        sql_exec := sql_exec + st_comissoes + ', ';
        sql_exec := sql_exec + quotedstr(dao.Q4.FieldByName('NOM_REPRESENTANTE').AsString) + ', ';
        sql_exec := sql_exec + quotedstr(dao.Q4.FieldByName('NOM_REPRESENTANTE').AsString + ' REF.: De ' + quotedstr(formatdatetime('dd/mm/yyyy', edMovDe.Date) + ' até ' + quotedstr(formatdatetime('dd/mm/yyyy', edMovAte.Date)))) + ', ';
        sql_exec := sql_exec + dao.Q4.FieldByName('PLANO_CONTAS_COMISSAO').AsString + ', ';
        sql_exec := sql_exec + dao.Q4.FieldByName('ID').AsString + ')';

        dao.Exec_sql.SQL.Clear;
        dao.Exec_sql.SQL.Add(sql_exec);
        dao.Exec_sql.ExecSQL;
      end;

      fl_plr := dao.Q4.FieldByName('PLR_VALOR').AsFloat;
      st_plr := StringReplace(floattostr(fl_plr), ',', '.', [rfReplaceAll]);

      if fl_plr > 0 then
      begin
        sql_exec := 'INSERT INTO CP1 (COD_FORNECEDOR, SEQUENCIA, TITULO, DTAVEN, VALOR, HISTORICO, OBS, ID_PLANO_CONTAS, COD_REPRESENTANTE) VALUES ( ';
        sql_exec := sql_exec + dao.Q4.FieldByName('FORNECEDOR_PLR').AsString + ', 1, ''0000'', ';
        sql_exec := sql_exec + quotedstr(formatdatetime('dd/mm/yyyy', edVcto.date)) + ', ';
        sql_exec := sql_exec + st_plr + ', ';
        sql_exec := sql_exec + quotedstr(dao.Q4.FieldByName('NOM_REPRESENTANTE').AsString) + ', ';
        sql_exec := sql_exec + quotedstr(dao.Q4.FieldByName('NOM_REPRESENTANTE').AsString + ' REF.: De ' + quotedstr(formatdatetime('dd/mm/yyyy', edMovDe.Date) + ' até ' + quotedstr(formatdatetime('dd/mm/yyyy', edMovAte.Date)))) + ', ';
        sql_exec := sql_exec + dao.Q4.FieldByName('PLANO_CONTAS_PLR').AsString + ', ';
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

procedure TFmCalcularSalario.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TFmCalcularSalario.btImprimirClick(Sender: TObject);
var
  cmd, conexao, path, where, tipo_rep: string;
  oExportfilter: TfrxCustomExportFilter;
begin
  path := ExtractFilePath(Application.ExeName);
  cmd := ' SELECT DISTINCT r.ID, r.funcionario, r.NOM_REPRESENTANTE, r.NR_CONTA_CORRENTE, r.NR_AGENCIA, b.NOM_BANCO, r.TITULAR_CONTA, CP.DTAVEN, coalesce(r.salario,0) as salario, ' +
    '   coalesce((SELECT MAX(CP1.ID) FROM CP1 WHERE CP1.ID_PLANO_CONTAS = ( SELECT c.SALARIO_PLANO_CONTAS FROM CONFIGURACAO C) AND CP1.COD_REPRESENTANTE = R.ID AND CP1.DTAVEN = CP.DTAVEN),0) AS ID, ' +
    '   coalesce((SELECT MAX(CP_PLR.ID) FROM CP1 CP_PLR WHERE CP_PLR.ID_PLANO_CONTAS = ( SELECT c.PLR_PLANO_CONTAS FROM CONFIGURACAO C) AND CP_PLR.COD_REPRESENTANTE = R.ID AND CP_PLR.DTAVEN = CP.DTAVEN),0) AS ID_PLR, ' +
    '   coalesce((SELECT SUM(CP_PLR.VALOR) FROM CP1 CP_PLR WHERE CP_PLR.ID_PLANO_CONTAS = ( SELECT c.PLR_PLANO_CONTAS FROM CONFIGURACAO C) AND CP_PLR.COD_REPRESENTANTE = R.ID AND CP_PLR.DTAVEN = CP.DTAVEN),0) AS PLR, ' +
    '   coalesce((SELECT SUM(CP1.VALOR) FROM CP1 WHERE CP1.ID_PLANO_CONTAS = ( SELECT c.VALE_PLANO_CONTAS FROM CONFIGURACAO C) AND CP1.COD_REPRESENTANTE = R.ID AND ' +
    '   EXTRACT(MONTH FROM CP1.DTAVEN)||''/''||EXTRACT(YEAR FROM CP1.DTAVEN) = EXTRACT(MONTH FROM CP.DTAVEN-32)||''/''||EXTRACT(YEAR FROM CP.DTAVEN-32)),0) AS ADIANTAMENTOS , ' +
    '   coalesce((SELECT SUM(CP_COMISSOES.VALOR) FROM CP1 CP_COMISSOES WHERE CP_COMISSOES.ID_PLANO_CONTAS = ( SELECT c.COMISSAO_PLANO_CONTAS FROM CONFIGURACAO C) AND CP_COMISSOES.COD_REPRESENTANTE = R.ID AND CP_COMISSOES.DTAVEN = CP.DTAVEN),0) AS COMISSOES ' +
    ' FROM REPRESENTANTE R LEFT OUTER join banco b on (b.ID = cast(r.NR_BANCO as integer)) INNER JOIN CP1 CP ON (CP.COD_REPRESENTANTE = R.ID) ';

  where := 'WHERE r.ativo = ''S'' and CP.ID_PLANO_CONTAS NOT IN ( SELECT c.VALE_PLANO_CONTAS FROM CONFIGURACAO C) ';

  if trim(edFuncionario.Text) <> '' then
    where := where + fmfun.cmdAux('r.id', edFuncionario.Text);

  if (ftMovDe.Date <> 0) and (ftMovAte.Date <> 0) then
    where := where + ' AND CP.DTAVEN between ' + quotedstr(formatdatetime('dd/mm/yyyy', ftMovDe.Date)) + ' AND ' + quotedstr(formatdatetime('dd/mm/yyyy', ftMovAte.Date));

  tipo_rep := tipo_rep + '';

  if ckRepTerc.Checked then
    tipo_rep := tipo_rep + '''0'',';

  if ckRepInt.Checked then
    tipo_rep := tipo_rep + '''1'',';

  if ckFuncEsc.Checked then
    tipo_rep := tipo_rep + '''2'',';

  if ckFuncFab.Checked then
    tipo_rep := tipo_rep + '''3'',';

  if ckTelemarketing.Checked then
    tipo_rep := tipo_rep + '''4'',';


  if tipo_rep <> '' then
  begin
    tipo_rep := copy(tipo_rep, 1, length(tipo_rep) - 1);
    where := where + ' AND R.FUNCIONARIO IN (' + tipo_rep + ') ';
  end;

  cmd := cmd + where + ' ORDER BY r.funcionario, r.NOM_REPRESENTANTE, CP.DTAVEN  ';

  with dm.q_lista_func_sal do
  begin
    close;
    sql.Clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_lista_func_sal.RecordCount < 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not (fr_relatorio.LoadFromFile(path + 'Relatorios\lista_representantes_funcionarios_salarios.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;

  fr_relatorio.ShowReport;
end;

procedure TFmCalcularSalario.fR_RELATORIOGetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'empresa' then
    value := nom_empresa;

  if VarName = 'dtaini' then
    value := FormatDateTime('dd/mm/yyyy', ftMovDe.Date)
  else if VarName = 'dtafin' then
    value := FormatDateTime('dd/mm/yyyy', ftMovAte.Date)
end;

procedure TFmCalcularSalario.sbAlterarClick(Sender: TObject);
begin
  sbSalvar.Enabled := true;
  sbAlterar.Enabled := false;
  mmSalario.Edit;
  edPLR.SetFocus;
end;

procedure TFmCalcularSalario.sbSalvarClick(Sender: TObject);
begin
  if mmSalario.State in [dsedit] then
    mmSalario.Post;
  sbSalvar.Enabled := false;
  sbAlterar.Enabled := true;

end;

procedure TFmCalcularSalario.edPLRExit(Sender: TObject);
begin
  if mmSalario.State in [dsedit] then
    mmSalarioTOTAL.Value := mmSalarioVALOR.Value + mmSalarioCOMISSOES.Value + mmSalarioPLR.Value - mmSalarioVALES.Value;
end;

function TFmCalcularSalario.ValidarFiltro: boolean;
begin
  Result := true;

  if (edmovde.date = 0) then
  begin
    dao.msg('O campo "Data Movimento De" deve ser Preenchido');
    edmovde.SetFocus;
    result := false;
    exit;
  end;

  if (edmovate.date = 0) then
  begin
    dao.msg('O campo "Data Movimento Até" deve ser Preenchido');
    edmovate.SetFocus;
    result := false;
    exit;
  end;

  if (edvcto.date = 0) then
  begin
    dao.msg('O campo "Data Vencimento" deve ser Preenchido');
    edvcto.SetFocus;
    result := false;
    exit;
  end;

end;

procedure TFmCalcularSalario.btnSalvarClick(Sender: TObject);
var st_salario_liquido, st_plr, sql_exec: string;
begin
  if not ValidarFiltro then exit;

  dao.Geral4('select c.PLR_FORNECEDOR, c.PLR_PLANO_CONTAS FROM CONFIGURACAO C ');

  mmSalario.first;
  try
    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
    while not mmSalario.eof do
    begin
      st_salario_liquido := StringReplace(floattostr(mmSalarioTOTAL.Value), ',', '.', [rfReplaceAll]);
      st_plr := StringReplace(floattostr(mmSalarioPLR.Value), ',', '.', [rfReplaceAll]);

      dao.Execsql('UPDATE CP1 SET VALOR = ' + st_salario_liquido + ' WHERE ID = ' + mmSalarioID.AsString);

      if mmSalarioPLR.Value > 0 then
      begin
        if mmSalarioID_PLR.AsString <> '0' then
          dao.Execsql('UPDATE CP1 SET VALOR = ' + st_plr + ' WHERE ID = ' + mmSalarioID_PLR.AsString)
        else begin

          dao.Geral3('select c.PLR_FORNECEDOR, c.PLR_PLANO_CONTAS FROM CONFIGURACAO C ');


          sql_exec := 'INSERT INTO CP1 (COD_FORNECEDOR, SEQUENCIA, TITULO, DTAVEN, VALOR, HISTORICO, OBS, ID_PLANO_CONTAS, COD_REPRESENTANTE) VALUES ( ';
          sql_exec := sql_exec + dao.Q3.FieldByName('PLR_FORNECEDOR').AsString + ', 1, ''0000'', ';
          sql_exec := sql_exec + quotedstr(formatdatetime('dd/mm/yyyy', edVcto.date)) + ', ';
          sql_exec := sql_exec + st_plr + ', ';
          sql_exec := sql_exec + quotedstr(mmSalarioNOME_REPRESENTANTE.AsString) + ', ';
          sql_exec := sql_exec + quotedstr(mmSalarioNOME_REPRESENTANTE.AsString + ' REF.: De ' + quotedstr(formatdatetime('dd/mm/yyyy', edMovDe.Date) + ' até ' + quotedstr(formatdatetime('dd/mm/yyyy', edMovAte.Date)))) + ', ';
          sql_exec := sql_exec + dao.Q3.FieldByName('PLR_PLANO_CONTAS').AsString + ', ';
          sql_exec := sql_exec + mmSalarioCOD_REPRESENTANTE.AsString + ')';

          dao.Exec_sql.SQL.Clear;
          dao.Exec_sql.SQL.Add(sql_exec);
          dao.Exec_sql.ExecSQL;

        end;
      end
      else
        if mmSalarioID_PLR.AsString <> '0' then
          dao.Execsql('delete from CP1 WHERE ID = ' + mmSalarioID_PLR.AsString);
      mmSalario.next;
    end;
    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;

  mmSalario.first;
end;

procedure TFmCalcularSalario.ckTodosClick(Sender: TObject);
begin
  ckRepTerc.Checked := ckTodos.Checked;
  ckRepInt.Checked := ckTodos.Checked;
  ckFuncEsc.Checked := ckTodos.Checked;
  ckFuncFab.Checked := ckTodos.Checked;
  ckTelemarketing.Checked := ckTodos.Checked; 
end;

procedure TFmCalcularSalario.edFuncionarioChange(Sender: TObject);
begin
  FMFUN.LimpaLetrasConsulta(edFuncionario);
end;

end.

