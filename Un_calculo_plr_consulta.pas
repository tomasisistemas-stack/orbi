unit Un_calculo_plr_consulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids,  ExtCtrls,
  StdCtrls, Buttons, Mask, frxClass,
  sSpeedButton, sLabel, sPanel, sBitBtn, sGroupBox, sMaskEdit,
  sCustomComboEdit, sTooledit, sEdit,  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Tfr_calculo_plr_consulta = class(TForm)
    Q_Faturamento: TFDQuery;
    Panel1: tsPanel;
    GroupBox1: TsGroupBox;
    edDesc: TsEdit;
    BtLocalizar: TsBitBtn;
    GroupBox4: TsGroupBox;
    Label1: tsLabel;
    ftMovDe: TsDateEdit;
    Label2: tsLabel;
    ftMovAte: TsDateEdit;
    Q_Despesas: TFDQuery;
    Panel7: tsPanel;
    GroupBox2: TsGroupBox;
    Panel2: tsPanel;
    stFatLiq: tsLabel;
    TvFaturamento: TTreeView;
    Panel8: tsPanel;
    GroupBox3: TsGroupBox;
    TvDespesas: TTreeView;
    Panel3: tsPanel;
    stDespesas: tsLabel;
    Panel9: tsPanel;
    stTotalGeral: tsLabel;
    fR_RELATORIO: TfrxReport;
    btImprimir: TsSpeedButton;
    Q_Plano_Conta1: TFDQuery;
    Q_Plano_Conta2: TFDQuery;
    Q_Plano_Conta3: TFDQuery;
    Q_Plano_Conta4: TFDQuery;
    procedure FormShow(Sender: TObject);
    procedure busca_plano_conta(id: string);
    function busca_prox_nr_conta(nr_conta: string): string;
    function TemFilhos(id: string): Boolean;
    procedure CarregaDados;
    procedure BtLocalizarClick(Sender: TObject);
    procedure TreeViewFaturamento;
    procedure TreeViewDespesas;

    function CarregaItem(Pai: string; Item: integer): string;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btImprimirClick(Sender: TObject);
    procedure fR_RELATORIOGetValue(const VarName: string;
      var Value: Variant);

  private
    { Private declarations }
  public
    { Public declarations }
    Pagos: boolean;
  end;
var
  fr_calculo_plr_consulta: Tfr_calculo_plr_consulta;
  idpai: string;
  nivel: string;
  n_conta: string;
  operacao: string;
  descricao: string;
  TotGeral, totFaturamento, totDespesas: real;

implementation

uses Un_dao, Un_plano_conta_cad, StrUtils, Un_dm;

{$R *.dfm}

procedure Tfr_calculo_plr_consulta.FormShow(Sender: TObject);
begin
  CarregaDados;
end;

function Tfr_calculo_plr_consulta.busca_prox_nr_conta(nr_conta: string): string;
var
  nr1, nr2: string;
  nr: integer;
begin
  if nivel = '1' then
    Result := inttostr(strtoint(nr_conta) + 1)
  else begin

    nr2 := ReverseString(copy(ReverseString(nr_conta), 1, pos('.', ReverseString(nr_conta)) - 1));
    nr1 := ReverseString(copy(ReverseString(nr_conta), pos('.', ReverseString(nr_conta)), 10));
    nr := strtoint(nr2) + 1;

    if nivel = '4' then
      Result := nr1 + FormatFloat('00', nr)
    else
      Result := nr1 + FormatFloat('0', nr);
  end;
end;

procedure Tfr_calculo_plr_consulta.busca_plano_conta(id: string);
begin
  dao.Geral1('select p1.descricao, p1.id, p1.operacao, p1.id_pai, p1.nivel,(select max(p2.NR_CONTA) as nr_conta from plano_contas p2 where p2.ID_PAI = p1.ID_PAI) as nr_conta from plano_contas p1 where p1.id = ' + QuotedStr(id));
  operacao := dao.Q1.fieldbyname('operacao').AsString;
  nivel := dao.Q1.fieldbyname('nivel').AsString;
  n_conta := dao.Q1.fieldbyname('nr_conta').AsString;
  idpai := dao.Q1.fieldbyname('id_pai').AsString;
  descricao := dao.Q1.fieldbyname('descricao').AsString;
end;

function Tfr_calculo_plr_consulta.TemFilhos(id: string): Boolean;
begin
  dao.Geral1('select (select count(*) from plano_contas p2 where p2.ID_PAI = p1.id) as filhos from PLANO_CONTAS p1 where p1.ID = ' + id);
  if dao.Q1.FieldByName('filhos').AsInteger > 0 then
    Result := true
  else
    Result := false;
end;

function Tfr_calculo_plr_consulta.CarregaItem(Pai: string; Item: integer): string;
var
  sql_consulta, sql_mov, sql_desc: string;
begin
  sql_desc := '';
  sql_mov := '';

  if (ftMovDe.Date <> 0) and (ftMovAte.Date <> 0) then
    sql_mov := ' and data between ' + quotedstr(formatdatetime('dd/mm/yyyy', ftMovDe.Date)) + ' and ' + quotedstr(formatdatetime('dd/mm/yyyy', ftMovAte.Date))
  else
    sql_mov := ' and extract(month from data)||extract(year from data) = extract(month from current_date)||extract(year from current_date) ';

  if trim(edDesc.Text) <> '' then
    sql_desc := ' AND DESCRICAO4 like ' + quotedstr('%' + trim(edDesc.Text) + '%');

  case Item of
    1: sql_consulta := 'SELECT DISTINCT DESCRICAO1 AS PLANO, SUM(VALOR) AS TOTAL, 0       AS PAI, ID1 AS ID FROM V_CUSTOS_FIXOS where 1 = 1 ' + sql_desc + ' ' + sql_mov + ' GROUP BY PLANO, PAI, ID';
    2: sql_consulta := 'SELECT DISTINCT DESCRICAO2 AS PLANO, SUM(VALOR) AS TOTAL, ID_PAI2 AS PAI, ID2 AS ID FROM V_CUSTOS_FIXOS where ID_PAI2 = ' + Pai + ' ' + sql_desc + ' ' + sql_mov + ' GROUP BY PLANO, PAI, ID';
    3: sql_consulta := 'SELECT DISTINCT DESCRICAO3 AS PLANO, SUM(VALOR) AS TOTAL, ID_PAI3 AS PAI, ID3 AS ID FROM V_CUSTOS_FIXOS where ID_PAI3 = ' + Pai + ' ' + sql_desc + ' ' + sql_mov + ' GROUP BY PLANO, PAI, ID';
    4: sql_consulta := 'SELECT DISTINCT DESCRICAO4 AS PLANO, SUM(VALOR) AS TOTAL, ID_PAI4 AS PAI, ID  AS ID FROM V_CUSTOS_FIXOS where ID_PAI4 = ' + Pai + ' ' + sql_desc + ' ' + sql_mov + ' GROUP BY PLANO, PAI, ID ';
    5: sql_consulta := 'SELECT DATA, TITULO, CLIENTE_FORNECEDOR, HISTORICO, VALOR, ID, DESCRICAO4 FROM V_CUSTOS_FIXOS where ID = ' + Pai + ' ' + sql_desc + ' ' + sql_mov + ' order by data';
  end;

  Result := sql_consulta;
end;

procedure Tfr_calculo_plr_consulta.CarregaDados;
begin
  totFaturamento := 0;
  totDespesas := 0;

  TreeViewFaturamento;
  TreeViewDespesas;

  TotGeral := totFaturamento - totDespesas;

  stFatLiq.Caption := 'Total Faturamento Líquido: ' + formatfloat('R$ ##,###,###,##0.00', (TotFaturamento));
  stDespesas.Caption := 'Total Despesas: ' + formatfloat('R$ ##,###,###,##0.00', (TotDespesas));
  stTotalGeral.Caption := 'Faturamento Real: ' + formatfloat('R$ ##,###,###,##0.00', (TotGeral));

end;

procedure Tfr_calculo_plr_consulta.BtLocalizarClick(Sender: TObject);
begin
  CarregaDados;
end;

procedure Tfr_calculo_plr_consulta.TreeViewDespesas;
var
  strTexto: string;
  No1, No2, No3, No4: TTreeNode;
begin
  dao.cn.StartTransaction;

  TvDespesas.Items.Clear;
  Q_Plano_Conta1.SQL.Text := CarregaItem('', 1);
  Q_Plano_Conta1.First;
  while not Q_Plano_Conta1.Eof do
  begin
    strTexto := Q_Plano_Conta1.FieldByName('plano').AsString + ' -> ' + formatfloat('R$ ##,###,###,##0.00', Q_Plano_Conta1.FieldByName('total').AsFloat);
    stDespesas.Caption := 'Total Despesas: ' + formatfloat('R$ ##,###,###,##0.00', Q_Plano_Conta1.FieldByName('total').AsFloat);

    TotDespesas := TotDespesas + Q_Plano_Conta1.FieldByName('total').AsFloat;

    No1 := TvDespesas.Items.Add(nil, strTexto);
    Q_Plano_Conta2.SQL.Text := CarregaItem(Q_Plano_Conta1.FieldByName('ID').AsString, 2);
    Q_Plano_Conta2.First;

    while not Q_Plano_Conta2.Eof do
    begin
      strTexto := Q_Plano_Conta2.FieldByName('plano').AsString + ' -> ' + formatfloat('R$ ##,###,###,##0.00', Q_Plano_Conta2.FieldByName('total').AsFloat);
      No2 := TvDespesas.Items.AddChild(No1, strTexto);
      Q_Plano_Conta3.SQL.Text := CarregaItem(Q_Plano_Conta2.FieldByName('ID').AsString, 3);
      Q_Plano_Conta3.First;
      while not Q_Plano_Conta3.eof do
      begin
        strTexto := Q_Plano_Conta3.FieldByName('plano').AsString + ' -> ' + formatfloat('R$ ##,###,###,##0.00', Q_Plano_Conta3.FieldByName('total').AsFloat);
        No3 := TvDespesas.Items.AddChild(No2, strTexto);
        Q_Plano_Conta4.SQL.Text := CarregaItem(Q_Plano_Conta3.FieldByName('ID').AsString, 4);
        Q_Plano_Conta4.First;
        while not Q_Plano_Conta4.eof do
        begin
          strTexto := Q_Plano_Conta4.FieldByName('plano').AsString + ' -> ' + formatfloat('R$ ##,###,###,##0.00', Q_Plano_Conta4.FieldByName('total').AsFloat);
          No4 := TvDespesas.Items.AddChild(No3, strTexto);
          Q_Despesas.Close;
          Q_Despesas.sql.clear;
          Q_Despesas.sql.text := CarregaItem(Q_Plano_Conta4.FieldByName('ID').AsString, 5);
          Q_Despesas.Open;
          Q_Despesas.First;
          while not Q_Despesas.eof do
          begin
            strTexto := formatdatetime('dd/mm/yyyy', Q_Despesas.FieldByName('DATA').AsDateTime) + ' - ' + Q_Despesas.fieldbyname('TITULO').AsString + ' - ' + Q_Despesas.fieldbyname('CLIENTE_FORNECEDOR').AsString + ' - ' + Q_Despesas.fieldbyname('HISTORICO').AsString + ' -> ' + formatfloat('R$ ##,###,###,##0.00', Q_Despesas.FieldByName('VALOR').AsFloat);
            TvDespesas.Items.AddChild(No4, strTexto);
            Q_Despesas.Next;
          end;
          Q_Plano_Conta4.Next;
        end;
        Q_Plano_Conta3.Next;
      end;
      Q_Plano_Conta2.Next;
    end;
    Q_Plano_Conta1.Next;
  end;
  dao.cn.Commit;
end;

procedure Tfr_calculo_plr_consulta.TreeViewFaturamento;
var
  strTexto, strNumeros: string;
  No1, No2, No3: TTreeNode;
  function CarregaItemFat(Filtro: string; Item: integer): string;
  var
    sql_consulta, sql_mov, sql_desc: string;
  begin
    if (ftMovDe.Date <> 0) and (ftMovAte.Date <> 0) then
      sql_mov := ' and DTA_EMISSAO between ' + quotedstr(formatdatetime('dd/mm/yyyy', ftMovDe.Date)) + ' and ' + quotedstr(formatdatetime('dd/mm/yyyy', ftMovAte.Date))
    else
      sql_mov := ' and extract(month from DTA_EMISSAO)||extract(year from DTA_EMISSAO) = extract(month from current_date)||extract(year from current_date) ';

    case Item of
      1: sql_consulta := 'SELECT sum(a.FAT_BRUTO) as FAT_BRUTO, sum(a.CUSTO) AS CUSTO, sum(a.FAT_LIQUIDO) AS FAT_LIQUIDO FROM V_FATURAMENT_LIQUIDO a ' +
        'WHERE  1 = 1 ' + sql_mov;
      2: sql_consulta := 'SELECT a.DTA_EMISSAO, sum(a.FAT_BRUTO) as FAT_BRUTO, sum(a.CUSTO) AS CUSTO, sum(a.FAT_LIQUIDO) AS FAT_LIQUIDO FROM V_FATURAMENT_LIQUIDO a ' +
        'WHERE  1 = 1 ' + sql_mov + ' group by dta_emissao ORDER BY DTA_EMISSAO';
      3: sql_consulta := 'SELECT a.NUMDOC, A.CLIENTE, a.DTA_EMISSAO, a.FAT_BRUTO, a.CUSTO, a.FAT_LIQUIDO FROM V_FATURAMENT_LIQUIDO a WHERE  1 = 1 AND A.DTA_EMISSAO = ' + QuotedStr(Filtro) + ' ORDER BY DTA_EMISSAO, NUMDOC';
    end;

    Result := sql_consulta;
  end;
begin
  dao.cn.StartTransaction;

  TvFaturamento.Items.Clear;
  Q_Plano_Conta1.SQL.Text := CarregaItemFat('', 1);
  Q_Plano_Conta1.First;

  totFaturamento := Q_Plano_Conta1.FieldByName('FAT_LIQUIDO').AsFloat;

  strTexto := '(+) Fat. Bruto: ' + formatfloat('R$ ##,###,###,##0.00', Q_Plano_Conta1.FieldByName('FAT_BRUTO').AsFloat);
  No1 := TvFaturamento.Items.Add(nil, strTexto);

  strTexto := '(-) Custo: ' + formatfloat('R$ ##,###,###,##0.00', Q_Plano_Conta1.FieldByName('CUSTO').AsFloat);
  No1 := TvFaturamento.Items.Add(nil, strTexto);

  strTexto := '(=) Fat. Líquido : ' + formatfloat('R$ ##,###,###,##0.00', Q_Plano_Conta1.FieldByName('FAT_LIQUIDO').AsFloat);
  No1 := TvFaturamento.Items.Add(nil, strTexto);

  Q_Plano_Conta2.SQL.Text := CarregaItemFat('', 2);
  Q_Plano_Conta2.First;

  while not Q_Plano_Conta2.Eof do
  begin
    strTexto := Q_Plano_Conta2.FieldByName('DTA_EMISSAO').AsString;
    No2 := TvFaturamento.Items.AddChild(No1, strTexto);

    strTexto := '(+) Fat. Bruto: ' + formatfloat('R$ ##,###,###,##0.00', Q_Plano_Conta2.FieldByName('FAT_BRUTO').AsFloat);
    No2 := TvFaturamento.Items.AddChild(No1, strTexto);

    strTexto := '(-) Custo: ' + formatfloat('R$ ##,###,###,##0.00', Q_Plano_Conta2.FieldByName('CUSTO').AsFloat);
    No2 := TvFaturamento.Items.AddChild(No1, strTexto);

    strTexto := '(=) Fat. Líquido : ' + formatfloat('R$ ##,###,###,##0.00', Q_Plano_Conta2.FieldByName('FAT_LIQUIDO').AsFloat);
    No2 := TvFaturamento.Items.AddChild(No1, strTexto);

    Q_Plano_Conta3.SQL.Text := CarregaItemFat(formatdatetime('dd.mm.yyyy', Q_Plano_Conta2.FieldByName('DTA_EMISSAO').AsDateTime), 3);
    Q_Plano_Conta3.First;
    while not Q_Plano_Conta3.Eof do
    begin
      strTexto := Q_Plano_Conta3.FieldByName('NUMDOC').AsString + ' - ' + Q_Plano_Conta3.FieldByName('CLIENTE').AsString;
      No3 := TvFaturamento.Items.AddChild(No2, strTexto);

      strTexto := '(+) Fat. Bruto: ' + formatfloat('R$ ##,###,###,##0.00', Q_Plano_Conta3.FieldByName('FAT_BRUTO').AsFloat);
      No3 := TvFaturamento.Items.AddChild(No2, strTexto);

      strTexto := '(-) Custo: ' + formatfloat('R$ ##,###,###,##0.00', Q_Plano_Conta3.FieldByName('CUSTO').AsFloat);
      No3 := TvFaturamento.Items.AddChild(No2, strTexto);

      strTexto := '(=) Fat. Líquido : ' + formatfloat('R$ ##,###,###,##0.00', Q_Plano_Conta3.FieldByName('FAT_LIQUIDO').AsFloat);
      No3 := TvFaturamento.Items.AddChild(No2, strTexto);

      Q_Plano_Conta3.Next;
    end;
    Q_Plano_Conta2.Next;
  end;
  dao.cn.Commit;
end;

procedure Tfr_calculo_plr_consulta.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure Tfr_calculo_plr_consulta.btImprimirClick(Sender: TObject);
var
  cmd_fat, cmd_custos, path: string;
begin
  Btlocalizarclick(self);
  path := ExtractFilePath(Application.ExeName);

  cmd_fat := 'SELECT a.NUMDOC, a.CLIENTE, a.DTA_EMISSAO, a.FAT_BRUTO, a.CUSTO, a.FAT_LIQUIDO FROM V_FATURAMENT_LIQUIDO a WHERE 1 = 1 ';
  if (ftMovDe.Date <> 0) and (ftMovAte.Date <> 0) then
    cmd_fat := cmd_fat + 'and a.DTA_EMISSAO between ' + QuotedStr(FormatDateTime('dd.mm.yyyy', ftMovDe.Date)) + ' and ' + QuotedStr(FormatDateTime('dd.mm.yyyy', ftMovAte.Date)) + ' ORDER BY DTA_EMISSAO, NUMDOC '
  else
    cmd_fat := cmd_fat + ' and extract(month from a.DTA_EMISSAO)||extract(year from a.DTA_EMISSAO) = extract(month from current_date)||extract(year from current_date) ORDER BY DTA_EMISSAO, NUMDOC';

  cmd_custos := 'SELECT a.ID, a.NR_CONTA, a.ID1, a.ID2, a.ID3, a.ID_PAI2, a.ID_PAI3, a.ID_PAI4, a.DESCRICAO1, a.DESCRICAO2, a.DESCRICAO3, a.DESCRICAO4, a.OPERACAO, a.TITULO, a.DATA, a.HISTORICO, a.VALOR, a.VALOR_SALDO, a.CLIENTE_FORNECEDOR ' +
    'FROM V_CUSTOS_FIXOS a WHERE 1 = 1 ';

  if (ftMovDe.Date <> 0) and (ftMovAte.Date <> 0) then
    cmd_custos := cmd_custos + 'and a.DATA between ' + QuotedStr(FormatDateTime('dd.mm.yyyy', ftMovDe.Date)) + ' and ' + QuotedStr(FormatDateTime('dd.mm.yyyy', ftMovAte.Date)) + ' ORDER BY a.operacao, a.DESCRICAO1, a.DESCRICAO2, a.DESCRICAO3, a.DESCRICAO4, A.TITULO, a.data, a.cliente_fornecedor '
  else
    cmd_custos := cmd_custos + ' and extract(month from a.data)||extract(year from a.data) = extract(month from current_date)||extract(year from current_date) ORDER BY a.operacao, a.DESCRICAO1, a.DESCRICAO2, a.DESCRICAO3, a.DESCRICAO4, A.TITULO, a.data, a.cliente_fornecedor ';

  with Dm.q_fat_liq do
  begin
    Close;
    sql.Clear;
    sql.add(cmd_fat);
    open;
  end;

  if Dm.q_fat_liq.RecordCount <= 0 then
  begin
    dao.msg('Não foi encontrado Registros para gerar o Relatório');
    exit;
  end;

  with Dm.q_custo_fixo do
  begin
    Close;
    sql.Clear;
    sql.add(cmd_custos);
    open;
  end;

  if Dm.q_custo_fixo.RecordCount <= 0 then
  begin
    dao.msg('Não foi encontrado Registros para gerar o Relatório');
    exit;
  end;

  if not (fr_relatorio.LoadFromFile(path + 'Relatorios\faturamento_liquido.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fr_relatorio.ShowReport;
end;

procedure Tfr_calculo_plr_consulta.fR_RELATORIOGetValue(
  const VarName: string; var Value: Variant);
begin
  if VarName = 'empresa' then
    value := nom_empresa;

  if VarName = 'fat_real' then
    value := formatfloat('R$ ##,###,###,##0.00', (TotGeral));

  if VarName = 'dtaini' then
    value := FormatDateTime('dd/mm/yyyy', ftMovDe.Date)
  else if VarName = 'dtafin' then
      value := FormatDateTime('dd/mm/yyyy', ftMovAte.Date)
end;

end.


