unit Un_calcular_13o_salarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, frxClass, DB,
   RxMemDS, DBCtrls, Mask, xmldom, XMLIntf,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  msxmldom, XMLDoc, sSpeedButton, sPanel, sBitBtn,
  sLabel, sCheckBox, frxExportPDF, acDBGrid, sMaskEdit, sCustomComboEdit,
  sTooledit, sEdit, sComboEdit, sGroupBox, sDBText, sDBEdit, sCurrEdit,
  sCurrencyEdit, DateUtils, frxExportBaseDialog;

type
  TFmCalcular13Salario = class(TForm)
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
    edVcto: TsDateEdit;
    btCalcular: TsSpeedButton;
    fR_RELATORIO: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    sPanel1: TsPanel;
    btImprimir: TsSpeedButton;
    mmSalarioVALES: TCurrencyField;
    mmSalarioID: TIntegerField;
    Tipo: TsGroupBox;
    ckRepTerc: TsCheckBox;
    ckRepInt: TsCheckBox;
    ckFuncEsc: TsCheckBox;
    ckFuncFab: TsCheckBox;
    ckTodos: TsCheckBox;
    ckTelemarketing: TsCheckBox;
    edAnoRef: TsCurrencyEdit;
    mmSalarioADMISSAO: TDateTimeField;
    Label7: TsLabel;
    edNumParc: TsCurrencyEdit;
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
  FmCalcular13Salario: TFmCalcular13Salario;
  totalselecionados: integer;

implementation

uses UnFun, Un_dao, Un_localizar,  UnPri, Un_dm,
  un_definir_saldo_inicial,
  Math;

{$R *.dfm}

procedure TFmCalcular13Salario.CarregaDados;
var
  sql, where, tipo_rep: string;
begin
  sql := ' SELECT DISTINCT R.ID as codrep, R.NOM_REPRESENTANTE, R.ADMISSAO, CP.DTAVEN, '
    +
    '   coalesce((SELECT MAX(CP1.ID) FROM CP1 WHERE CP1.ID_PLANO_CONTAS = ( SELECT c.DEC_TERC_PLANO_CONTAS FROM CONFIGURACAO C) AND CP1.COD_REPRESENTANTE = R.ID AND CP1.DTAVEN = CP.DTAVEN),0) AS ID, ' +
    '   coalesce((SELECT SUM(CP1.VALOR) FROM CP1 WHERE CP1.ID_PLANO_CONTAS = ( SELECT c.DEC_TERC_PLANO_CONTAS FROM CONFIGURACAO C) AND CP1.COD_REPRESENTANTE = R.ID AND ' +
    '   EXTRACT(MONTH FROM CP1.DTAVEN)||''/''||EXTRACT(YEAR FROM CP1.DTAVEN) = EXTRACT(MONTH FROM CP.DTAVEN)||''/''||EXTRACT(YEAR FROM CP.DTAVEN)),0) AS VALOR ' +
    ' FROM REPRESENTANTE R INNER JOIN CP1 CP ON (CP.COD_REPRESENTANTE = R.ID) ';

  where :=
    'WHERE R.ATIVO = ''S'' and r.ADMISSAO is not null AND CP.OBS like ''%13º SALÁRIO REF.: Ano ' +
      edAnoRef.Text +
      '%'' AND CP.ID_PLANO_CONTAS IN ( SELECT c.DEC_TERC_PLANO_CONTAS FROM CONFIGURACAO C) ';

  if trim(edFuncionario.Text) <> '' then
    where := where + fmfun.cmdAux('R.id', edFuncionario.Text);

  if (ftMovDe.Date <> 0) and (ftMovAte.Date <> 0) then
    where := where + ' AND CP.DTAVEN between ' +
      quotedstr(formatdatetime('dd/mm/yyyy', ftMovDe.Date)) + ' AND ' +
      quotedstr(formatdatetime('dd/mm/yyyy', ftMovAte.Date));

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

  dao.Geral1(sql + where + ' ORDER BY R.NOM_REPRESENTANTE ');

  CarregaGrid;
end;

procedure TFmCalcular13Salario.CarregaGrid;
begin
  dao.Q1.first;
  mmSalario.Close;
  mmSalario.EmptyTable;
  mmSalario.Open;
  while not dao.Q1.eof do
  begin
    mmSalario.Append;
    mmSalarioID.AsString := dao.Q1.fieldbyname('ID').AsString;
    mmSalarioCOD_REPRESENTANTE.AsString :=
      dao.Q1.fieldbyname('CODREP').AsString;
    mmSalarioNOME_REPRESENTANTE.AsString :=
      dao.Q1.fieldbyname('NOM_REPRESENTANTE').AsString;
    mmSalarioDTAVEN.AsDateTime := dao.Q1.fieldbyname('DTAVEN').AsDateTime;
    mmSalarioADMISSAO.AsDateTime := dao.Q1.fieldbyname('ADMISSAO').AsDateTime;
    mmSalarioVALOR.Value := dao.Q1.fieldbyname('VALOR').Value;
    mmSalario.Post;
    dao.Q1.next;
  end;
  mmSalario.First;
end;

procedure TFmCalcular13Salario.cod_funcionarioButtonClick(Sender: TObject);
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
  chamou_form := 'fr_13salario_representante';
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
    edFuncionario.Text := copy(edFuncionario.Text, 2,
      length(edFuncionario.Text));

end;

procedure TFmCalcular13Salario.cod_funcionarioExit(Sender: TObject);
begin
  if cod_funcionario.Text <> '' then
  begin
    dao.Geral2('select ID, NOM_REPRESENTANTE from REPRESENTANTE where id =' +
      QuotedStr(cod_funcionario.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_funcionario.Caption :=
        dao.Q2.fieldbyname('nom_representante').AsString;
      edFuncionario.Text := edFuncionario.Text + ';' + cod_funcionario.Text;
      if pos(';', edFuncionario.Text) = 1 then
        edFuncionario.Text := copy(edFuncionario.Text, 2,
          length(edFuncionario.Text));
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

procedure TFmCalcular13Salario.sbFuncClick(Sender: TObject);
begin
  edFuncionario.Clear;
end;

procedure TFmCalcular13Salario.btokClick(Sender: TObject);
begin
  CarregaDados;
end;

procedure TFmCalcular13Salario.FormShow(Sender: TObject);
begin
  ckFuncEsc.Checked := true;
  ftMovDe.Text := formatdatetime('01/mm/yyyy', now);
  ftMovAte.text := formatdatetime('28/mm/yyyy', now);
  edAnoRef.Text := formatdatetime('yyyy', now);
  btokClick(self);
end;

procedure TFmCalcular13Salario.btCalcularClick(Sender: TObject);
var
  st_13salario, sql_exec, funcionario, func_cp, tipo_rep, data_str: string;
  fl_13salario, rateio: double;
  x, dia, mes, mes_admissao, ano_admissao, ano: integer;
  admissao, dtvcto: Tdate;
begin
  if not ValidarFiltro then
    exit;

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

  dao.Geral4('SELECT R.ID, R.NOM_REPRESENTANTE, r.ADMISSAO, coalesce(R.SALARIO, 0) AS SALARIO, ' +
    '(select c.DEC_TERC_FORNECEDOR from CONFIGURACAO c) as FORNECEDOR, ' +
    '(SELECT c.DEC_TERC_PLANO_CONTAS FROM CONFIGURACAO C) AS PLANO_CONTAS ' +
    'FROM REPRESENTANTE R ' +
    'WHERE r.NOM_REPRESENTANTE is not null and r.ADMISSAO is not null and R.ATIVO = ''S''' +
    funcionario);

  try
    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
    dao.Exec_sql.SQL.Clear;
    dao.Exec_sql.SQL.Add('DELETE FROM CP1 WHERE OBS like ''%13º SALÁRIO REF.: Ano ' + edAnoRef.Text + ' %''' +
      ' AND ID_PLANO_CONTAS = ' + dao.Q4.FieldByName('PLANO_CONTAS').AsString +
      func_cp);
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
      admissao := dao.Q4.FieldByName('admissao').AsDateTime;
      mes_admissao := strtoint(formatdatetime('mm', admissao));
      ano_admissao := strtoint(formatdatetime('yyyy', admissao));

      if (ano_admissao < edAnoRef.AsInteger) then
        rateio := 1
      else
        rateio := (12 - (mes_admissao - 1)) / 12;

      fl_13salario := (dao.Q4.FieldByName('SALARIO').AsFloat * rateio) /
        edNumParc.AsInteger;
      st_13salario := StringReplace(floattostr(fl_13salario), ',', '.',
        [rfReplaceAll]);

      dia := strtoint(formatdatetime('dd', edVcto.Date));
      mes := strtoint(formatdatetime('mm', edVcto.Date));
      ano := strtoint(formatdatetime('yyyy', edVcto.Date));

      for x := 1 to edNumParc.AsInteger do
      begin

        if mes > 12 then
        begin
          mes := mes - 12;
          ano := ano + 1;
        end;

        data_str := inttostr(dia) + '/' + inttostr(mes) + '/' + inttostr(ano);

        if not (FmFun.ValidaData(data_str)) then
          dia := dia - 1
        else
          dtvcto := strtodate(data_str);
        FmFun.ValidaData(data_str);

        if DayOfTheWeek(dtvcto) = 6 then
          dtvcto := dtvcto + 1;
        if DayOfTheWeek(dtvcto) = 7 then
          dtvcto := dtvcto + 1;

        sql_exec :=
          'INSERT INTO CP1 (COD_FORNECEDOR, SEQUENCIA, TITULO, DTAVEN, VALOR, HISTORICO, OBS, ID_PLANO_CONTAS, COD_REPRESENTANTE) VALUES ( ';
        sql_exec := sql_exec + dao.Q4.FieldByName('FORNECEDOR').AsString +
          ', 1, ''0000'', ';
        sql_exec := sql_exec + quotedstr(formatdatetime('dd/mm/yyyy',
          dtvcto)) + ', ';
        sql_exec := sql_exec + st_13salario + ', ';
        sql_exec := sql_exec +
          quotedstr(dao.Q4.FieldByName('NOM_REPRESENTANTE').AsString) + ', ';
        sql_exec := sql_exec +
          quotedstr(dao.Q4.FieldByName('NOM_REPRESENTANTE').AsString +
          ' 13º SALÁRIO REF.: Ano ' + edAnoRef.Text + ' PARCELA ' + inttostr(x)
            +
          '/' + edNumParc.Text) + ', ';
        sql_exec := sql_exec + dao.Q4.FieldByName('PLANO_CONTAS').AsString +
          ', ';
        sql_exec := sql_exec + dao.Q4.FieldByName('ID').AsString + ')';

        dao.Exec_sql.SQL.Clear;
        dao.Exec_sql.SQL.Add(sql_exec);
        dao.Exec_sql.ExecSQL;
        mes := mes + 1;
      end;
      dao.Q4.Next;
    end;
    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;

  ftMovDe.Date := edVcto.Date;
  ftMovAte.Date := dtvcto;
  btokClick(Self);
end;

procedure TFmCalcular13Salario.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TFmCalcular13Salario.btImprimirClick(Sender: TObject);
var
  cmd, conexao, path, where, tipo_rep: string;
  oExportfilter: TfrxCustomExportFilter;
begin
  path := ExtractFilePath(Application.ExeName);
  cmd := 'SELECT DISTINCT R.ID as codrep, r.funcionario, R.NOM_REPRESENTANTE, R.ADMISSAO, r.NR_CONTA_CORRENTE, r.NR_AGENCIA, b.NOM_BANCO, r.TITULAR_CONTA, CP.DTAVEN, '
    +
    ' coalesce((SELECT MAX(CP1.ID) FROM CP1 WHERE CP1.ID_PLANO_CONTAS = ( SELECT c.DEC_TERC_PLANO_CONTAS FROM CONFIGURACAO C) AND CP1.COD_REPRESENTANTE = R.ID AND CP1.DTAVEN = CP.DTAVEN),0) AS ID, ' +
    ' coalesce((SELECT SUM(CP1.VALOR) FROM CP1 WHERE CP1.ID_PLANO_CONTAS = ( SELECT c.DEC_TERC_PLANO_CONTAS FROM CONFIGURACAO C) AND CP1.COD_REPRESENTANTE = R.ID AND ' +
    ' EXTRACT(MONTH FROM CP1.DTAVEN)||''/''||EXTRACT(YEAR FROM CP1.DTAVEN) = EXTRACT(MONTH FROM CP.DTAVEN)||''/''||EXTRACT(YEAR FROM CP.DTAVEN)),0) AS VALOR ' +
    ' FROM REPRESENTANTE R INNER JOIN CP1 CP ON (CP.COD_REPRESENTANTE = R.ID) LEFT OUTER join banco b on (b.ID = cast(r.NR_BANCO as integer)) ';

  where :=
    'WHERE r.ADMISSAO is not null AND CP.ID_PLANO_CONTAS IN ( SELECT c.DEC_TERC_PLANO_CONTAS FROM CONFIGURACAO C) ';

  if trim(edFuncionario.Text) <> '' then
    where := where + fmfun.cmdAux('r.id', edFuncionario.Text);

  if (ftMovDe.Date <> 0) and (ftMovAte.Date <> 0) then
    where := where + ' AND CP.DTAVEN between ' +
      quotedstr(formatdatetime('dd/mm/yyyy', ftMovDe.Date)) + ' AND ' +
      quotedstr(formatdatetime('dd/mm/yyyy', ftMovAte.Date));

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

  cmd := cmd + where +
    ' ORDER BY r.funcionario, r.NOM_REPRESENTANTE, CP.DTAVEN  ';

  with dm.q_lista_func_13sal do
  begin
    close;
    sql.Clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_lista_func_13sal.RecordCount < 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not (fr_relatorio.LoadFromFile(path +
    'Relatorios\lista_13_salario.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 +
      'Avise o Suporte');
    exit;
  end;

  fr_relatorio.ShowReport;
end;

procedure TFmCalcular13Salario.fR_RELATORIOGetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'empresa' then
    value := nom_empresa;

  if VarName = 'dtaini' then
    value := FormatDateTime('dd/mm/yyyy', ftMovDe.Date)
  else if VarName = 'dtafin' then
    value := FormatDateTime('dd/mm/yyyy', ftMovAte.Date)
end;

procedure TFmCalcular13Salario.sbAlterarClick(Sender: TObject);
begin
  mmSalario.Edit;
end;

procedure TFmCalcular13Salario.sbSalvarClick(Sender: TObject);
begin
  if mmSalario.State in [dsedit] then
    mmSalario.Post;
end;

function TFmCalcular13Salario.ValidarFiltro: boolean;
begin
  Result := true;

  if (edAnoRef.asinteger = 0) then
  begin
    dao.msg('O campo "Ano Referência" deve ser Preenchido');
    edAnoRef.SetFocus;
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

procedure TFmCalcular13Salario.ckTodosClick(Sender: TObject);
begin
  ckRepTerc.Checked := ckTodos.Checked;
  ckRepInt.Checked := ckTodos.Checked;
  ckFuncEsc.Checked := ckTodos.Checked;
  ckFuncFab.Checked := ckTodos.Checked;
  ckTelemarketing.Checked := ckTodos.Checked;  
end;

procedure TFmCalcular13Salario.edFuncionarioChange(Sender: TObject);
begin
  FMFUN.LimpaLetrasConsulta(edFuncionario);
end;

end.

