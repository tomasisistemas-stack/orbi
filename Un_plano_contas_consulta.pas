unit Un_plano_contas_consulta;

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
  Tfr_plano_contas_consulta = class(TForm)
    Q_Ativo: TFDQuery;
    Panel1: tsPanel;
    GroupBox1: TsGroupBox;
    edDesc: TsEdit;
    BtLocalizar: TsBitBtn;
    GroupBox4: TsGroupBox;
    Label1: tsLabel;
    ftMovDe: TsDateEdit;
    Label2: tsLabel;
    ftMovAte: TsDateEdit;
    Panel7: tsPanel;
    GroupBox2: TsGroupBox;
    Panel2: tsPanel;
    stAtivo: tsLabel;
    TvAtivo: TTreeView;
    Panel8: tsPanel;
    GroupBox3: TsGroupBox;
    TvPassivo: TTreeView;
    GroupBox6: TsGroupBox;
    Panel3: tsPanel;
    stPassivo: tsLabel;
    q_despesas: TFDQuery;
    q_receitas: TFDQuery;
    GroupBox5: TsGroupBox;
    tvReceitas: TTreeView;
    Panel6: tsPanel;
    stReceita: tsLabel;
    Panel5: tsPanel;
    stDespesa: tsLabel;
    tvDespesas: TTreeView;
    Panel9: tsPanel;
    stTotalGeral: tsLabel;
    tsPanel: tsPanel;
    stTotalGeralLiq: tsLabel;
    Panel4: tsPanel;
    stDespesasGeral: tsLabel;
    stReceitasGeral: tsLabel;
    fR_RELATORIO: TfrxReport;
    btImprimir: TsSpeedButton;
    Q_Plano_Conta1: TFDQuery;
    Q_Plano_Conta2: TFDQuery;
    Q_Plano_Conta3: TFDQuery;
    Q_Plano_Conta4: TFDQuery;
    Q_Passivo: TFDQuery;
    procedure FormShow(Sender: TObject);
    procedure busca_plano_conta(id: string);
    function busca_prox_nr_conta(nr_conta: string): string;
    function TemFilhos(id: string): Boolean;
    procedure CarregaDados;
    procedure BtLocalizarClick(Sender: TObject);
    procedure TreeViewPassivo;
    procedure TreeViewAtivo;
    procedure TreeViewReceita;
    procedure TreeViewDespesa;

    function CarregaItem(Tipo, Pai: string; Item: integer): string;
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
  fr_plano_contas_consulta: Tfr_plano_contas_consulta;
  idpai: string;
  nivel: string;
  n_conta: string;
  operacao: string;
  descricao: string;
  totAtivo, totPassivo, totReceita, totCusto, totAtivoEstoque: real;

implementation

uses Un_dao, Un_plano_conta_cad, StrUtils, Un_dm;

{$R *.dfm}

procedure Tfr_plano_contas_consulta.FormShow(Sender: TObject);
begin
  CarregaDados;
end;

function Tfr_plano_contas_consulta.busca_prox_nr_conta(nr_conta: string): string;
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

procedure Tfr_plano_contas_consulta.busca_plano_conta(id: string);
begin
  dao.Geral1('select p1.descricao, p1.id, p1.operacao, p1.id_pai, p1.nivel,(select max(p2.NR_CONTA) as nr_conta from plano_contas p2 where p2.ID_PAI = p1.ID_PAI) as nr_conta from plano_contas p1 where p1.id = ' + QuotedStr(id));
  operacao := dao.Q1.fieldbyname('operacao').AsString;
  nivel := dao.Q1.fieldbyname('nivel').AsString;
  n_conta := dao.Q1.fieldbyname('nr_conta').AsString;
  idpai := dao.Q1.fieldbyname('id_pai').AsString;
  descricao := dao.Q1.fieldbyname('descricao').AsString;
end;

function Tfr_plano_contas_consulta.TemFilhos(id: string): Boolean;
begin
  dao.Geral1('select (select count(*) from plano_contas p2 where p2.ID_PAI = p1.id) as filhos from PLANO_CONTAS p1 where p1.ID = ' + id);
  if dao.Q1.FieldByName('filhos').AsInteger > 0 then
    Result := true
  else
    Result := false;
end;

function Tfr_plano_contas_consulta.CarregaItem(Tipo, Pai: string; Item: integer): string;
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

  if not Pagos then
  begin
    case Item of
      1: sql_consulta := 'SELECT DISTINCT DESCRICAO1 AS PLANO, SUM(VALOR) AS TOTAL, 0       AS PAI, ID1 AS ID FROM V_PLANO_CONTAS where ID1 = ' + Tipo + ' ' + sql_desc + ' ' + sql_mov + ' GROUP BY PLANO, PAI, ID';
      2: sql_consulta := 'SELECT DISTINCT DESCRICAO2 AS PLANO, SUM(VALOR) AS TOTAL, ID_PAI2 AS PAI, ID2 AS ID FROM V_PLANO_CONTAS where ID_PAI2 = ' + Pai + ' AND ID1 = ' + Tipo + ' ' + sql_desc + ' ' + sql_mov + ' GROUP BY PLANO, PAI, ID';
      3: sql_consulta := 'SELECT DISTINCT DESCRICAO3 AS PLANO, SUM(VALOR) AS TOTAL, ID_PAI3 AS PAI, ID3 AS ID FROM V_PLANO_CONTAS where ID_PAI3 = ' + Pai + ' AND ID1 = ' + Tipo + ' ' + sql_desc + ' ' + sql_mov + ' GROUP BY PLANO, PAI, ID';
      4: sql_consulta := 'SELECT DISTINCT DESCRICAO4 AS PLANO, SUM(VALOR) AS TOTAL, ID_PAI4 AS PAI, ID  AS ID FROM V_PLANO_CONTAS where ID_PAI4 = ' + Pai + ' AND ID1 = ' + Tipo + ' ' + sql_desc + ' ' + sql_mov + ' GROUP BY PLANO, PAI, ID ';
      5: sql_consulta := 'SELECT DATA, TITULO, CLIENTE_FORNECEDOR, HISTORICO, VALOR, ID, DESCRICAO4 FROM V_PLANO_CONTAS where ID = ' + Pai + ' AND ID1 = ' + Tipo + ' ' + sql_desc + ' ' + sql_mov + ' order by data';
    end;
  end
  else
  begin
    case Item of
      1: sql_consulta := 'SELECT DISTINCT DESCRICAO1 AS PLANO, SUM(VALOR) AS TOTAL, 0       AS PAI, ID1 AS ID FROM V_PLANO_CONTAS_PAGOS where ID1 = ' + Tipo + ' ' + sql_desc + ' ' + sql_mov + ' GROUP BY PLANO, PAI, ID';
      2: sql_consulta := 'SELECT DISTINCT DESCRICAO2 AS PLANO, SUM(VALOR) AS TOTAL, ID_PAI2 AS PAI, ID2 AS ID FROM V_PLANO_CONTAS_PAGOS where ID_PAI2 = ' + Pai + ' AND ID1 = ' + Tipo + ' ' + sql_desc + ' ' + sql_mov + ' GROUP BY PLANO, PAI, ID';
      3: sql_consulta := 'SELECT DISTINCT DESCRICAO3 AS PLANO, SUM(VALOR) AS TOTAL, ID_PAI3 AS PAI, ID3 AS ID FROM V_PLANO_CONTAS_PAGOS where ID_PAI3 = ' + Pai + ' AND ID1 = ' + Tipo + ' ' + sql_desc + ' ' + sql_mov + ' GROUP BY PLANO, PAI, ID';
      4: sql_consulta := 'SELECT DISTINCT DESCRICAO4 AS PLANO, SUM(VALOR) AS TOTAL, ID_PAI4 AS PAI, ID  AS ID FROM V_PLANO_CONTAS_PAGOS where ID_PAI4 = ' + Pai + ' AND ID1 = ' + Tipo + ' ' + sql_desc + ' ' + sql_mov + ' GROUP BY PLANO, PAI, ID ';
      5: sql_consulta := 'SELECT DATA, TITULO, CLIENTE_FORNECEDOR, HISTORICO, VALOR, ID, DESCRICAO4 FROM V_PLANO_CONTAS_PAGOS where ID = ' + Pai + ' AND ID1 = ' + Tipo + ' ' + sql_desc + ' ' + sql_mov + ' order by data';
    end;
  end;

  Result := sql_consulta;
end;

procedure Tfr_plano_contas_consulta.CarregaDados;
var
  TotGeral: real;
begin
  TotAtivo := 0;
  TotReceita := 0;
  totPassivo := 0;
  totCusto := 0;
  totAtivoEstoque := 0;

  TreeViewAtivo;
  TreeViewPassivo;
  TreeViewReceita;
  TreeViewDespesa;

  TotGeral := (TotAtivo + TotReceita) - (totPassivo + totCusto);

  stReceitasGeral.Caption := 'Total (Ativo+Receitas): ' + formatfloat('R$ ##,###,###,##0.00', (TotAtivo + TotReceita));
  stDespesasGeral.Caption := 'Total (Passivo+Despesas): ' + formatfloat('R$ ##,###,###,##0.00', (TotPassivo + TotCusto));
  stTotalGeral.Caption := 'Saldo Geral: ' + formatfloat('R$ ##,###,###,##0.00', TotGeral);
  stTotalGeralLiq.Caption := 'Saldo Geral Líquido (Sem Estoque): ' + formatfloat('R$ ##,###,###,##0.00', (TotGeral - totAtivoEstoque));

end;

procedure Tfr_plano_contas_consulta.BtLocalizarClick(Sender: TObject);
begin
  CarregaDados;
end;

procedure Tfr_plano_contas_consulta.TreeViewPassivo;
var
  strTexto: string;
  No1, No2, No3, No4: TTreeNode;
begin
  dao.cn.StartTransaction;
  TvPassivo.Items.Clear;
  Q_Plano_Conta1.Close;
  Q_Plano_Conta1.sql.clear;
  Q_Plano_Conta1.SQL.Text := CarregaItem('34', '', 1);
  Q_Plano_Conta1.open;
  Q_Plano_Conta1.First;
  while not Q_Plano_Conta1.Eof do
  begin
    strTexto := Q_Plano_Conta1.FieldByName('plano').AsString + ' -> ' + formatfloat('R$ ##,###,###,##0.00', Q_Plano_Conta1.FieldByName('total').AsFloat);
    stPassivo.Caption := 'Total Passivo: ' + formatfloat('R$ ##,###,###,##0.00', Q_Plano_Conta1.FieldByName('total').AsFloat);

    totPassivo := Q_Plano_Conta1.FieldByName('total').AsFloat;

    No1 := TvPassivo.Items.Add(nil, strTexto);
    Q_Plano_Conta2.Close;
    Q_Plano_Conta2.sql.clear;
    Q_Plano_Conta2.SQL.Text := CarregaItem('34', Q_Plano_Conta1.FieldByName('ID').AsString, 2);
    Q_Plano_Conta2.open;
    Q_Plano_Conta2.First;
    while not Q_Plano_Conta2.Eof do
    begin
      strTexto := Q_Plano_Conta2.FieldByName('plano').AsString + ' -> ' + formatfloat('R$ ##,###,###,##0.00', Q_Plano_Conta2.FieldByName('total').AsFloat);
      No2 := TvPassivo.Items.AddChild(No1, strTexto);
      Q_Plano_Conta3.Close;
      Q_Plano_Conta3.sql.clear;
      Q_Plano_Conta3.SQL.Text := CarregaItem('34', Q_Plano_Conta2.FieldByName('ID').AsString, 3);
      Q_Plano_Conta3.open;
      Q_Plano_Conta3.First;
      while not Q_Plano_Conta3.eof do
      begin
        strTexto := Q_Plano_Conta3.FieldByName('plano').AsString + ' -> ' + formatfloat('R$ ##,###,###,##0.00', Q_Plano_Conta3.FieldByName('total').AsFloat);
        No3 := TvPassivo.Items.AddChild(No2, strTexto);
        Q_Plano_Conta4.Close;
        Q_Plano_Conta4.sql.clear;
        Q_Plano_Conta4.SQL.Text := CarregaItem('34', Q_Plano_Conta3.FieldByName('ID').AsString, 4);
        Q_Plano_Conta4.open;
        Q_Plano_Conta4.First;
        while not Q_Plano_Conta4.eof do
        begin
          strTexto := Q_Plano_Conta4.FieldByName('plano').AsString + ' -> ' + formatfloat('R$ ##,###,###,##0.00', Q_Plano_Conta4.FieldByName('total').AsFloat);
          No4 := TvPassivo.Items.AddChild(No3, strTexto);
          Q_Passivo.Close;
          Q_Passivo.sql.clear;
          Q_Passivo.sql.text := CarregaItem('34', Q_Plano_Conta4.FieldByName('ID').AsString, 5);
          Q_Passivo.Open;
          Q_Passivo.First;
          while not Q_Passivo.eof do
          begin
            strTexto := formatdatetime('dd/mm/yyyy', Q_Passivo.FieldByName('DATA').AsDateTime) + ' - ' + Q_Passivo.fieldbyname('TITULO').AsString + ' - ' + Q_Passivo.fieldbyname('CLIENTE_FORNECEDOR').AsString + ' - ' + Q_Passivo.fieldbyname('HISTORICO').AsString + ' -> ' + formatfloat('R$ ##,###,###,##0.00', Q_Passivo.FieldByName('VALOR').AsFloat);
            TvPassivo.Items.AddChild(No4, strTexto);
            Q_Passivo.Next;
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

procedure Tfr_plano_contas_consulta.TreeViewAtivo;
var
  strTexto: string;
  No1, No2, No3, No4: TTreeNode;
begin
  dao.cn.StartTransaction;
  TvAtivo.Items.Clear;
  Q_Plano_Conta1.Close;
  Q_Plano_Conta1.sql.clear;
  Q_Plano_Conta1.SQL.Text := CarregaItem('1', '', 1);
  Q_Plano_Conta1.open;
  Q_Plano_Conta1.First;
  while not Q_Plano_Conta1.Eof do
  begin
    strTexto := Q_Plano_Conta1.FieldByName('plano').AsString + ' -> ' + formatfloat('R$ ##,###,###,##0.00', Q_Plano_Conta1.FieldByName('total').AsFloat);
    stAtivo.Caption := 'Total Ativo: ' + formatfloat('R$ ##,###,###,##0.00', Q_Plano_Conta1.FieldByName('total').AsFloat);

    totAtivo := Q_Plano_Conta1.FieldByName('total').AsFloat;

    No1 := TvAtivo.Items.Add(nil, strTexto);
    Q_Plano_Conta2.Close;
    Q_Plano_Conta2.sql.clear;
    Q_Plano_Conta2.SQL.Text := CarregaItem('1', Q_Plano_Conta1.FieldByName('ID').AsString, 2);
    Q_Plano_Conta2.First;
    while not Q_Plano_Conta2.Eof do
    begin
      strTexto := Q_Plano_Conta2.FieldByName('plano').AsString + ' -> ' + formatfloat('R$ ##,###,###,##0.00', Q_Plano_Conta2.FieldByName('total').AsFloat);
      No2 := TvAtivo.Items.AddChild(No1, strTexto);

      Q_Plano_Conta3.Close;
      Q_Plano_Conta3.sql.clear;
      Q_Plano_Conta3.SQL.Text := CarregaItem('1', Q_Plano_Conta2.FieldByName('ID').AsString, 3);
      Q_Plano_Conta3.First;
      while not Q_Plano_Conta3.eof do
      begin
        strTexto := Q_Plano_Conta3.FieldByName('plano').AsString + ' -> ' + formatfloat('R$ ##,###,###,##0.00', Q_Plano_Conta3.FieldByName('total').AsFloat);
        if Q_Plano_Conta3.FieldByName('ID').AsString = '11' then
          totAtivoEstoque := Q_Plano_Conta3.FieldByName('total').AsFloat;

        No3 := TvAtivo.Items.AddChild(No2, strTexto);
        Q_Plano_Conta4.Close;
        Q_Plano_Conta4.sql.clear;
        Q_Plano_Conta4.SQL.Text := CarregaItem('1', Q_Plano_Conta3.FieldByName('ID').AsString, 4);
        Q_Plano_Conta4.First;
        while not Q_Plano_Conta4.eof do
        begin
          strTexto := Q_Plano_Conta4.FieldByName('plano').AsString + ' -> ' + formatfloat('R$ ##,###,###,##0.00', Q_Plano_Conta4.FieldByName('total').AsFloat);
          No4 := TvAtivo.Items.AddChild(No3, strTexto);
          Q_Ativo.Close;
          Q_Ativo.sql.clear;
          Q_Ativo.sql.text := CarregaItem('1', Q_Plano_Conta4.FieldByName('ID').AsString, 5);
          Q_Ativo.Open;
          Q_Ativo.First;
          while not Q_Ativo.eof do
          begin
            strTexto := formatdatetime('dd/mm/yyyy', Q_Ativo.FieldByName('DATA').AsDateTime) + ' - ' + Q_Ativo.fieldbyname('TITULO').AsString + ' - ' + Q_Ativo.fieldbyname('CLIENTE_FORNECEDOR').AsString + ' - ' + Q_Ativo.fieldbyname('HISTORICO').AsString + ' -> ' + formatfloat('R$ ##,###,###,##0.00', Q_Ativo.FieldByName('VALOR').AsFloat);
            TvAtivo.Items.AddChild(No4, strTexto);
            Q_Ativo.Next;
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

procedure Tfr_plano_contas_consulta.TreeViewReceita;
var
  strTexto: string;
  No1, No2, No3, No4: TTreeNode;
begin
  dao.cn.StartTransaction;
  TvReceitas.Items.Clear;
  Q_Plano_Conta1.Close;
  Q_Plano_Conta1.sql.clear;
  Q_Plano_Conta1.SQL.Text := CarregaItem('82', '', 1);
  Q_Plano_Conta1.open;
  Q_Plano_Conta1.First;
  while not Q_Plano_Conta1.Eof do
  begin
    strTexto := Q_Plano_Conta1.FieldByName('plano').AsString + ' -> ' + formatfloat('R$ ##,###,###,##0.00', Q_Plano_Conta1.FieldByName('total').AsFloat);
    stReceita.Caption := 'Total Receitas: ' + formatfloat('R$ ##,###,###,##0.00', Q_Plano_Conta1.FieldByName('total').AsFloat);

    totReceita := Q_Plano_Conta1.FieldByName('total').AsFloat;

    No1 := TvReceitas.Items.Add(nil, strTexto);
    Q_Plano_Conta2.Close;
    Q_Plano_Conta2.sql.clear;
    Q_Plano_Conta2.SQL.Text := CarregaItem('82', Q_Plano_Conta1.FieldByName('ID').AsString, 2);
    Q_Plano_Conta2.First;
    while not Q_Plano_Conta2.Eof do
    begin
      strTexto := Q_Plano_Conta2.FieldByName('plano').AsString + ' -> ' + formatfloat('R$ ##,###,###,##0.00', Q_Plano_Conta2.FieldByName('total').AsFloat);
      No2 := TvReceitas.Items.AddChild(No1, strTexto);
      Q_Plano_Conta3.Close;
      Q_Plano_Conta3.sql.clear;
      Q_Plano_Conta3.SQL.Text := CarregaItem('82', Q_Plano_Conta2.FieldByName('ID').AsString, 3);
      Q_Plano_Conta3.First;
      while not Q_Plano_Conta3.eof do
      begin
        strTexto := Q_Plano_Conta3.FieldByName('plano').AsString + ' -> ' + formatfloat('R$ ##,###,###,##0.00', Q_Plano_Conta3.FieldByName('total').AsFloat);
        No3 := TvReceitas.Items.AddChild(No2, strTexto);
        Q_Plano_Conta4.Close;
        Q_Plano_Conta4.sql.clear;
        Q_Plano_Conta4.SQL.Text := CarregaItem('82', Q_Plano_Conta3.FieldByName('ID').AsString, 4);
        Q_Plano_Conta4.First;
        while not Q_Plano_Conta4.eof do
        begin
          strTexto := Q_Plano_Conta4.FieldByName('plano').AsString + ' -> ' + formatfloat('R$ ##,###,###,##0.00', Q_Plano_Conta4.FieldByName('total').AsFloat);
          No4 := TvReceitas.Items.AddChild(No3, strTexto);
          Q_Receitas.Close;
          Q_Receitas.sql.clear;
          Q_Receitas.sql.text := CarregaItem('82', Q_Plano_Conta4.FieldByName('ID').AsString, 5);
          Q_Receitas.Open;
          Q_Receitas.First;
          while not Q_Receitas.eof do
          begin
            strTexto := formatdatetime('dd/mm/yyyy', Q_Receitas.FieldByName('DATA').AsDateTime) + ' - ' + Q_Receitas.fieldbyname('TITULO').AsString + ' - ' + Q_Receitas.fieldbyname('CLIENTE_FORNECEDOR').AsString + ' - ' + Q_Receitas.fieldbyname('HISTORICO').AsString + ' -> ' + formatfloat('R$ ##,###,###,##0.00', Q_Receitas.FieldByName('VALOR').AsFloat);
            TvReceitas.Items.AddChild(No4, strTexto);
            Q_Receitas.Next;
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

procedure Tfr_plano_contas_consulta.TreeViewDespesa;
var
  strTexto: string;
  No1, No2, No3, No4: TTreeNode;
begin
  dao.cn.StartTransaction;
  TvDespesas.Items.Clear;
  Q_Plano_Conta1.Close;
  Q_Plano_Conta1.sql.clear;
  Q_Plano_Conta1.SQL.Text := CarregaItem('58', '', 1);
  Q_Plano_Conta1.open;
  Q_Plano_Conta1.First;
  while not Q_Plano_Conta1.Eof do
  begin
    strTexto := Q_Plano_Conta1.FieldByName('plano').AsString + ' -> ' + formatfloat('R$ ##,###,###,##0.00', Q_Plano_Conta1.FieldByName('total').AsFloat);
    stDespesa.Caption := 'Total Despesas e Custos: ' + formatfloat('R$ ##,###,###,##0.00', Q_Plano_Conta1.FieldByName('total').AsFloat);

    totCusto := Q_Plano_Conta1.FieldByName('total').AsFloat;

    No1 := TvDespesas.Items.Add(nil, strTexto);
    Q_Plano_Conta2.Close;
    Q_Plano_Conta2.sql.clear;
    Q_Plano_Conta2.SQL.Text := CarregaItem('58', Q_Plano_Conta1.FieldByName('ID').AsString, 2);
    Q_Plano_Conta2.First;
    while not Q_Plano_Conta2.Eof do
    begin
      strTexto := Q_Plano_Conta2.FieldByName('plano').AsString + ' -> ' + formatfloat('R$ ##,###,###,##0.00', Q_Plano_Conta2.FieldByName('total').AsFloat);
      No2 := TvDespesas.Items.AddChild(No1, strTexto);
      Q_Plano_Conta3.Close;
      Q_Plano_Conta3.sql.clear;
      Q_Plano_Conta3.SQL.Text := CarregaItem('58', Q_Plano_Conta2.FieldByName('ID').AsString, 3);
      Q_Plano_Conta3.First;
      while not Q_Plano_Conta3.eof do
      begin
        strTexto := Q_Plano_Conta3.FieldByName('plano').AsString + ' -> ' + formatfloat('R$ ##,###,###,##0.00', Q_Plano_Conta3.FieldByName('total').AsFloat);
        No3 := TvDespesas.Items.AddChild(No2, strTexto);
        Q_Plano_Conta4.Close;
        Q_Plano_Conta4.sql.clear;
        Q_Plano_Conta4.SQL.Text := CarregaItem('58', Q_Plano_Conta3.FieldByName('ID').AsString, 4);
        Q_Plano_Conta4.First;
        while not Q_Plano_Conta4.eof do
        begin
          strTexto := Q_Plano_Conta4.FieldByName('plano').AsString + ' -> ' + formatfloat('R$ ##,###,###,##0.00', Q_Plano_Conta4.FieldByName('total').AsFloat);
          No4 := TvDespesas.Items.AddChild(No3, strTexto);
          Q_Despesas.Close;
          Q_Despesas.sql.clear;
          Q_Despesas.sql.text := CarregaItem('58', Q_Plano_Conta4.FieldByName('ID').AsString, 5);
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

procedure Tfr_plano_contas_consulta.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure Tfr_plano_contas_consulta.btImprimirClick(Sender: TObject);
var
  cmd, path: string;
begin
  path := ExtractFilePath(Application.ExeName);

  if not Pagos then
    cmd := 'select a.ID, a.NR_CONTA, a.DESCRICAO1, a.DESCRICAO2, a.DESCRICAO3, a.DESCRICAO4, a.OPERACAO, a.TITULO, a.DATA, a.HISTORICO, a.VALOR, a.VALOR_SALDO, a.CLIENTE_FORNECEDOR, a.FORMA ' +
      ' FROM V_PLANO_CONTAS a WHERE 1 = 1 '
  else
    cmd := 'select a.ID, a.NR_CONTA, a.DESCRICAO1, a.DESCRICAO2, a.DESCRICAO3, a.DESCRICAO4, a.OPERACAO, a.TITULO, a.DATA, a.HISTORICO, a.VALOR, a.VALOR_SALDO, a.CLIENTE_FORNECEDOR, a.FORMA ' +
      ' FROM V_PLANO_CONTAS_PAGOS a WHERE 1 = 1 ';

  cmd := cmd + 'and a.data between ' + QuotedStr(FormatDateTime('dd.mm.yyyy', ftMovDe.Date)) + ' and ' + QuotedStr(FormatDateTime('dd.mm.yyyy', ftMovAte.Date)) + ' ORDER BY a.operacao, a.DESCRICAO1, a.DESCRICAO2, a.DESCRICAO3, a.DESCRICAO4, A.TITULO, a.data, a.cliente_fornecedor ';

  with Dm.q_plano_contas do
  begin
    Close;
    sql.Clear;
    sql.add(cmd);
    open;
  end;

  if Dm.q_plano_contas.RecordCount <= 0 then
  begin
    dao.msg('Não foi encontrado Registros para gerar o Relatório');
    exit;
  end;

  if not (fr_relatorio.LoadFromFile(path + 'Relatorios\plano_contas.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fr_relatorio.ShowReport;
end;

procedure Tfr_plano_contas_consulta.fR_RELATORIOGetValue(
  const VarName: string; var Value: Variant);
begin
  if VarName = 'empresa' then
    value := nom_empresa;

  if VarName = 'dtaini' then
    value := FormatDateTime('dd/mm/yyyy', ftMovDe.Date)
  else if VarName = 'dtafin' then
      value := FormatDateTime('dd/mm/yyyy', ftMovAte.Date)
end;

end.

