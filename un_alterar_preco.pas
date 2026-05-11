unit un_alterar_preco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, sEdit, Vcl.Mask,
  sMaskEdit, sCustomComboEdit, sComboEdit, Vcl.Buttons, sSpeedButton, sLabel,
  Vcl.ExtCtrls, sPanel, Vcl.Grids, Vcl.DBGrids, sCurrEdit, sCurrencyEdit,
  sGroupBox, sBitBtn, Data.DB, RxMemDS;

type
  TFmAlterarPreco = class(TForm)
    Panel4: TsPanel;
    Lbl_produto: TsLabel;
    Lbnom_produto: TsLabel;
    sbProduto: TsSpeedButton;
    Lbl_fornecedor: TsLabel;
    Lbfornecedor: TsLabel;
    Lbl_grupo: TsLabel;
    LbNom_Grupo: TsLabel;
    sbGrupo: TsSpeedButton;
    sbFornecedor: TsSpeedButton;
    Label2: TsLabel;
    Prcod_produto: TsComboEdit;
    edProduto: TsEdit;
    Prcod_fornecedor: TsComboEdit;
    Prcod_grupo: TsComboEdit;
    edGrupo: TsEdit;
    edFornecedor: TsEdit;
    edProdutoDesc: TsEdit;
    Panel5: TsPanel;
    btok: TsBitBtn;
    Panel2: TsPanel;
    sbAlterar: TsSpeedButton;
    gbMargemLucro: TsGroupBox;
    edAcresDesc: TsCurrencyEdit;
    pnProdutos: TsPanel;
    dgProdutos: TDBGrid;
    mmAcrescimo: TRxMemoryData;
    mmAcrescimoIDPRODUTO: TIntegerField;
    mmAcrescimoNOME_PRODUTO: TStringField;
    mmAcrescimoCUSTO_TOTAL: TCurrencyField;
    mmAcrescimoPRECO_VENDA: TCurrencyField;
    mmAcrescimoMARGEM_LUCRO: TFloatField;
    Panel1: TsPanel;
    btnSalvar: TsSpeedButton;
    dsAcrescimo: TDataSource;
    sbSair: TsSpeedButton;
    mmAcrescimoCUSTO: TCurrencyField;
    mmAcrescimoDTA_ALT_PRECO: TDateField;
    mmAcrescimoCUSTO_SUBTOTAL: TCurrencyField;
    pncabProdutos: TPanel;
    pnHistorico: TsPanel;
    pnCabHistorico: TPanel;
    dgHistorico: TDBGrid;
    mmHistPrec: TRxMemoryData;
    mmHistPrecDATAHORA: TDateTimeField;
    mmHistPrecUSUARIO: TStringField;
    mmHistPrecCUSTO: TCurrencyField;
    mmHistPrecIMPOSTOS: TCurrencyField;
    mmHistPrecIPI: TCurrencyField;
    mmHistPrecOUTROS: TCurrencyField;
    mmHistPrecCUSTO_TOTAL: TCurrencyField;
    mmHistPrecLUCRO: TFloatField;
    mmHistPrecPRECO_VENDA: TCurrencyField;
    dsHistPrec: TDataSource;
    procedure btokClick(Sender: TObject);
    procedure sbProdutoClick(Sender: TObject);
    procedure sbFornecedorClick(Sender: TObject);
    procedure sbGrupoClick(Sender: TObject);
    procedure Prcod_produtoButtonClick(Sender: TObject);
    procedure Prcod_fornecedorButtonClick(Sender: TObject);
    procedure Prcod_grupoButtonClick(Sender: TObject);
    procedure Prcod_produtoExit(Sender: TObject);
    procedure Prcod_fornecedorExit(Sender: TObject);
    procedure Prcod_grupoExit(Sender: TObject);
    procedure sbSairClick(Sender: TObject);
    procedure sbAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure mmAcrescimoAfterScroll(DataSet: TDataSet);
  private
    procedure BuscaHist(produto: string; dataini, datafim: TDate);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmAlterarPreco: TFmAlterarPreco;

implementation

{$R *.dfm}

uses
  Un_dao, unfun, Un_localizar, unpri;

procedure TFmAlterarPreco.btnSalvarClick(Sender: TObject);
begin
  mmAcrescimo.first;
  while not mmAcrescimo.eof do
  begin
    dao.Exec_sql.sql.Clear;
    dao.Exec_sql.sql.Add
      ('UPDATE PRODUTO SET DTA_ALT_PRECO = :data, custo_total = :custo_total, custosubtotal = :custosubtotal, custo = :custo, PRECO_VENDA = :preco WHERE COD_PRODUTO =  :produto ');
    dao.Exec_sql.parambyname('preco').Value := mmAcrescimoPRECO_VENDA.Value;
    dao.Exec_sql.parambyname('custosubtotal').Value := mmAcrescimoCUSTO_SUBTOTAL.Value;
    dao.Exec_sql.parambyname('custo_total').Value := mmAcrescimoCUSTO_TOTAL.Value;
    dao.Exec_sql.parambyname('custo').Value := mmAcrescimoCUSTO.Value;
    dao.Exec_sql.parambyname('produto').Value := mmAcrescimoIDPRODUTO.Value;
    dao.Exec_sql.parambyname('data').Value := now;
    dao.Exec_sql.ExecSQL;
    mmAcrescimo.Next;
  end;
  mmAcrescimo.first;
  showmessage('Alteração de Preço efetuado com sucesso!');
  btokClick(self);
end;

procedure TFmAlterarPreco.BuscaHist(produto: string; dataini, datafim: TDate);
begin
  if produto = '' then
    Exit;
  dao.Geral2
    ('SELECT a.ID, A.CODUSU, U.NOME, a.COD_PRODUTO, a.DATA_HORA, a.CUSTO, a.IMPOSTOS, a.IPI, a.OUTROS, a.CUSTO_TOTAL, a.LUCRO, a.PRECO_VENDA FROM PRODUTO_LOG_PRECO a INNER JOIN TBUSU U ON U.CODUSU = A.CODUSU WHERE 1 = 1 '
    + ' AND A.COD_PRODUTO = ' + produto + ' AND A.DATA_HORA BETWEEN ' + QuotedStr(FORMATDATETIME('dd/mm/yyyy 00:00:00', dataini)) + ' and ' + QuotedStr(FORMATDATETIME('dd/mm/yyyy 23:59:59', datafim))
    + ' ORDER BY a.DATA_HORA DESC ');

  dao.Q2.First;
  mmHistPrec.Close;
  mmHistPrec.EmptyTable;
  mmHistPrec.open;
  while not dao.Q2.Eof do
  begin
    mmHistPrec.Append;
    mmHistPrecUSUARIO.AsString := dao.Q2.fieldbyname('NOME').AsString;
    mmHistPrecDATAHORA.AsDateTime := dao.Q2.fieldbyname('DATA_HORA').AsDateTime;
    mmHistPrecCUSTO.AsString := dao.Q2.fieldbyname('CUSTO').AsString;
    mmHistPrecIMPOSTOS.AsString := dao.Q2.fieldbyname('IMPOSTOS').AsString;
    mmHistPrecIPI.AsString := dao.Q2.fieldbyname('IPI').AsString;
    mmHistPrecOUTROS.AsString := dao.Q2.fieldbyname('OUTROS').AsString;
    mmHistPrecCUSTO_TOTAL.AsString := dao.Q2.fieldbyname('CUSTO_TOTAL').AsString;
    mmHistPrecLUCRO.AsString := dao.Q2.fieldbyname('LUCRO').AsString;
    mmHistPrecPRECO_VENDA.AsString := dao.Q2.fieldbyname('PRECO_VENDA').AsString;
    mmHistPrec.Post;
    dao.Q2.Next;
  end;
  mmHistPrec.First;
end;


procedure TFmAlterarPreco.btokClick(Sender: TObject);
var
  where: string;
begin
  where := 'where 1 = 1 and p.revenda = ''S'' and p.status <> ''S''  ';

  dao.Q1.close;

  if trim(edProduto.Text) <> '' then
    where := where + fmfun.cmdAux('p.cod_produto', edProduto.Text);

  if trim(edProdutoDesc.Text) <> '' then
    where := where + ' AND P.NOM_PRODUTO LIKE ''%' + edProdutoDesc.Text + '%''';

  if trim(edGrupo.Text) <> '' then
    where := where + fmfun.cmdAux('p.cod_grupo', edGrupo.Text);

  if trim(edFornecedor.Text) <> '' then
    where := where + fmfun.cmdAux('p.fornecedor_principal', edFornecedor.Text);

  dao.Geral1('select ' + '  p.cod_produto, ' + '  p.nom_produto, ' +
    '  p.custo_total, ' + '  p.preco_venda, ' + '  p.custo, cast(coalesce(p.DTA_ALT_PRECO, ''2018/12/31'') as date) as dta_alt_preco ' +
    ' from  ' + '  PRODUTO p ' + where);

  dao.Q1.first;

  mmAcrescimo.Close;
  mmAcrescimo.EmptyTable;
  mmAcrescimo.Open;
  while not dao.Q1.eof do
  begin
    mmAcrescimo.Append;
    mmAcrescimoIDPRODUTO.AsString := dao.Q1.fieldbyname('COD_PRODUTO').AsString;
    mmAcrescimoNOME_PRODUTO.AsString :=
      dao.Q1.fieldbyname('nom_produto').AsString;
    mmAcrescimoCUSTO_TOTAL.AsString :=
      dao.Q1.fieldbyname('custo_total').AsString;
    mmAcrescimoPRECO_VENDA.AsString :=
      dao.Q1.fieldbyname('preco_venda').AsString;

    if mmAcrescimoCUSTO_TOTAL.value > 0 then
       mmAcrescimoMARGEM_LUCRO.Value := ((mmAcrescimoPRECO_VENDA.value - mmAcrescimoCUSTO_TOTAL.value) / mmAcrescimoPRECO_VENDA.value) * 100
    else
       mmAcrescimoMARGEM_LUCRO.Value := 0;

    mmAcrescimoDTA_ALT_PRECO.asstring := formatdatetime('dd/mm/yyyy', dao.Q1.fieldbyname('DTA_ALT_PRECO').AsDateTime);
    mmAcrescimoCUSTO.AsString := dao.Q1.fieldbyname('custo').AsString;
    mmAcrescimo.Post;

    dao.Q1.Next;
  end;

end;

procedure TFmAlterarPreco.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TFmAlterarPreco.mmAcrescimoAfterScroll(DataSet: TDataSet);
begin
  BuscaHist(mmAcrescimoIDPRODUTO.AsString, now-90, now);
end;

procedure TFmAlterarPreco.Prcod_fornecedorButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Fornecedor';
  chamou_pesquisa := 'fr_fornecedor';
  chamou_form := 'FmAlterarPreco_fornecedor';
  chamou_cadastro := 'Fr_fornecedor';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Fornecedores';
  Fr_localizar.BT_cadastro.Visible := false;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 5);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Razão Social';
  Campos_combo[2] := 'Fantasia';
  Campos_combo[3] := 'CNPJ';
  Campos_combo[4] := 'Cidade';

  for i := 0 to 4 do
  begin
    valor_combo := Campos_combo[i];
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

  edFornecedor.Text := edFornecedor.Text + ';' + Prcod_fornecedor.Text;
  if pos(';', edFornecedor.Text) = 1 then
    edFornecedor.Text := copy(edFornecedor.Text, 2, length(edFornecedor.Text));

end;

procedure TFmAlterarPreco.Prcod_fornecedorExit(Sender: TObject);
begin
  if trim(Prcod_fornecedor.Text) = '' then
    Lbfornecedor.Caption := '...';

  if Prcod_fornecedor.Text <> '' then
  begin
    dao.Geral2('select razao_social from fornecedor where cod_fornecedor=' +
      QuotedStr(Prcod_fornecedor.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbfornecedor.Caption := dao.q2.fieldbyname('razao_social').AsString;
      if edFornecedor.Text = '' then
        edFornecedor.Text := Prcod_fornecedor.Text;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_fornecedor.Text := '';
      Prcod_fornecedor.SetFocus;
      Exit;
    end;
  end;
end;

procedure TFmAlterarPreco.Prcod_grupoButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;

  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Grupo';

  chamou_pesquisa := 'fr_grupo';
  chamou_form := 'FmAlterarPreco_grupo';
  chamou_cadastro := 'fr_grupo';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Grupos';

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'UF';

  for i := 0 to 1 do
  begin
    valor_combo := Campos_combo[i];
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

  edGrupo.Text := edGrupo.Text + ';' + Prcod_grupo.Text;
  if pos(';', edGrupo.Text) = 1 then
    edGrupo.Text := copy(edGrupo.Text, 2, length(edGrupo.Text));

end;

procedure TFmAlterarPreco.Prcod_grupoExit(Sender: TObject);
begin
  if trim(Prcod_grupo.Text) = '' then
    LbNom_Grupo.Caption := '...';

  if Prcod_grupo.Text <> '' then
  begin
    dao.Geral2('select nom_grupo from grupo where cod_grupo=' +
      QuotedStr(Prcod_grupo.Text));
    if dao.q2.RecordCount > 0 then
    begin
      LbNom_Grupo.Caption := dao.q2.fieldbyname('nom_grupo').AsString;
      if edGrupo.Text = '' then
        edGrupo.Text := Prcod_grupo.Text;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_grupo.Text := '';
      Prcod_grupo.SetFocus;
      Exit;
    end;
  end;
end;

procedure TFmAlterarPreco.Prcod_produtoButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Produto';
  chamou_pesquisa := 'fr_produto';
  chamou_form := 'FmAlterarPreco_produto';
  chamou_cadastro := 'Fr_produto';
  revenda := 'S';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Produto';
  Fr_localizar.BT_cadastro.Visible := true;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'Marca';

  for i := 0 to 2 do
  begin
    valor_combo := Campos_combo[i];
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
  edProduto.Text := edProduto.Text + ';' + Prcod_produto.Text;
  if pos(';', edProduto.Text) = 1 then
    edProduto.Text := copy(edProduto.Text, 2, length(edProduto.Text));

end;

procedure TFmAlterarPreco.Prcod_produtoExit(Sender: TObject);
begin
  if trim(Prcod_produto.Text) = '' then
    Lbnom_produto.Caption := '...';

  if Prcod_produto.Text <> '' then
  begin
    dao.Geral2('select nom_produto from produto where cod_produto=' +
      QuotedStr(Prcod_produto.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_produto.Caption := dao.q2.fieldbyname('nom_produto').AsString;
      if edProduto.Text = '' then
        edProduto.Text := Prcod_produto.Text;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_produto.Text := '';
      Prcod_produto.SetFocus;
      Exit;
    end;

  end;
end;

procedure TFmAlterarPreco.sbAlterarClick(Sender: TObject);
begin
  mmAcrescimo.first;
  while not mmAcrescimo.eof do
  begin
    mmAcrescimo.edit;


    mmAcrescimoPRECO_VENDA.Value := mmAcrescimoPRECO_VENDA.Value * (1 + (edAcresDesc.Value / 100));
    mmAcrescimoCUSTO_SUBTOTAL.Value := mmAcrescimoCUSTO_SUBTOTAL.Value * (1 + (edAcresDesc.Value / 100));
    mmAcrescimoCUSTO_TOTAL.Value := mmAcrescimoCUSTO_TOTAL.Value * (1 + (edAcresDesc.Value / 100));
    mmAcrescimoCUSTO.Value := mmAcrescimoCUSTO.Value * (1 + (edAcresDesc.Value / 100));


    mmAcrescimoMARGEM_LUCRO.Value :=
      ((mmAcrescimoPRECO_VENDA.Value - mmAcrescimoCUSTO_TOTAL.Value) /
      mmAcrescimoPRECO_VENDA.Value) * 100;
    mmAcrescimo.Post;
    mmAcrescimo.Next;
  end;
  mmAcrescimo.first;
end;

procedure TFmAlterarPreco.sbFornecedorClick(Sender: TObject);
begin
  edFornecedor.Clear;
end;

procedure TFmAlterarPreco.sbGrupoClick(Sender: TObject);
begin
  edGrupo.Clear;
end;

procedure TFmAlterarPreco.sbProdutoClick(Sender: TObject);
begin
  edProduto.Clear;
end;

procedure TFmAlterarPreco.sbSairClick(Sender: TObject);
begin
  Close
end;

end.
