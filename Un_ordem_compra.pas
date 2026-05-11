unit Un_ordem_compra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, frxClass, DB,
   RxMemDS, DBCtrls, Mask, xmldom, XMLIntf,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  msxmldom, XMLDoc,  frxExportPDF, RXDBCtrl,
  sSpeedButton, sLabel, sPanel, sBitBtn, sGroupBox, sCheckBox, acDBGrid,
  sEdit, sMaskEdit, sCustomComboEdit, sComboEdit, RxToolEdit,
  frxExportBaseDialog, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFmOrdemCompra = class(TForm)
    Panel1: tsPanel;
    BtGerarOC: TsSpeedButton;
    btImprimir: TsSpeedButton;
    Panel2: tsPanel;
    Panel3: tsPanel;
    mmOC: TRxMemoryData;
    dsOC: TDataSource;
    fR_RELATORIO: TfrxReport;
    mmOCIDPRODUTO: TIntegerField;
    mmOCNOME_PRODUTO: TStringField;
    gbPrecoProm: TsGroupBox;
    gbValidoAte: TsGroupBox;
    Panel4: tsPanel;
    Panel5: tsPanel;
    btok: TsBitBtn;
    Lbl_produto: tsLabel;
    Prcod_produto: TsComboEdit;
    Lbnom_produto: tsLabel;
    edProduto: TsEdit;
    sbProduto: TsSpeedButton;
    Lbl_fornecedor: tsLabel;
    Prcod_fornecedor: TsComboEdit;
    Lbfornecedor: tsLabel;
    Lbl_grupo: tsLabel;
    Prcod_grupo: TsComboEdit;
    LbNom_Grupo: tsLabel;
    edGrupo: TsEdit;
    sbGrupo: TsSpeedButton;
    mmOCCUSTO: TCurrencyField;
    mmOCQTD_ENTRADA: TFloatField;
    mmOCSUB_TOTAL: TCurrencyField;
    edPrecoCusto: TDBEdit;
    edQtdEntrada: TDBEdit;
    sbAlterarItem: TsSpeedButton;
    Label1: tsLabel;
    prNr_OC: TsComboEdit;
    Label35: tsLabel;
    Prcod_empresa: TsComboEdit;
    Lbempresa_faturamento: tsLabel;
    sbEmail: TsSpeedButton;
    frxPDFExport1: TfrxPDFExport;
    Panel6: tsPanel;
    stTotal: tsLabel;
    sbSalvar: TsBitBtn;
    btAlterarOC: TsSpeedButton;
    GroupBox2: TsGroupBox;
    mmObs: TMemo;
    mmOCDT_ULTIMA_COMPRA: TDateTimeField;
    mmOCQTD_ULTIMA_COMPRA: TFloatField;
    mmOCPRECO_ULTIMA_COMPRA: TCurrencyField;
    mmOCFORNECEDOR: TStringField;
    mmOCNR_DCTO_ULTIMA_COMPRA: TIntegerField;
    btGrafico: TsSpeedButton;
    mmOCUNIDADE: TStringField;
    mmOCQTD_EMBALAGEM: TFloatField;
    gbQtdEmb: TsGroupBox;
    edQtd_embalagem: TDBEdit;
    gbUnidade: TsGroupBox;
    edUnidade: TRxDBComboEdit;
    Q_UltimasCompras: TFDQuery;
    ds_UltimasCompras: TDataSource;
    mmOCCOD_PRODUTO_FORNECEDOR: TStringField;
    SbForn: TsSpeedButton;
    Panel7: tsPanel;
    gbCodProduto: TsGroupBox;
    edCodProduto: TsEdit;
    GroupBox3: TsGroupBox;
    gbCodProdForn: TsGroupBox;
    edProdutoFornecedor: TsEdit;
    gbProdutoDesc: TsGroupBox;
    edNomProduto: TsEdit;
    dgUltimasCompras: Tdbgrid;
    Panel8: tsPanel;
    sbDeletar: TsSpeedButton;
    sbInserir: TsSpeedButton;
    sbInserirTodos: TsSpeedButton;
    SbDeletarTodos: TsSpeedButton;
    dgLista: Tdbgrid;
    dgProdutos: Tdbgrid;
    mmLista: TRxMemoryData;
    dsLista: TDataSource;
    mmListaIDPRODUTO: TIntegerField;
    mmListaNOME_PRODUTO: TStringField;
    mmListaCUSTO: TCurrencyField;
    mmListaQTD_ENTRADA: TFloatField;
    mmListaSUB_TOTAL: TCurrencyField;
    mmListaDT_ULTIMA_COMPRA: TDateField;
    mmListaQTD_ULTIMA_COMPRA: TFloatField;
    mmListaPRECO_ULTIMA_COMPRA: TCurrencyField;
    mmListaFORNECEDOR: TIntegerField;
    mmListaNR_DCTO_ULTIMA_COMPRA: TIntegerField;
    mmListaUNIDADE: TStringField;
    mmListaQTD_EMBALAGEM: TFloatField;
    mmListaCOD_PRODUTO_FORNECEDOR: TStringField;
    btnLocalizar: TsSpeedButton;
    ckSemCusto: TsCheckBox;
    Q_UltimasComprasult_qtd_entrada: TFloatField;
    Q_UltimasComprasultimo_custo: TFloatField;
    Q_UltimasComprasult_compra: TDateField;
    Q_UltimasComprasnr_documento: TIntegerField;
    Q_UltimasComprasfornecedor: TStringField;
    gbProduto: TsGroupBox;
    sbInserirItem: TsSpeedButton;
    lbDescProdAlt: TsLabel;
    edcodProdutoAlt: TRxDBComboEdit;
    sbCancelar: TsBitBtn;
    procedure Prcod_produtoButtonClick(Sender: TObject);
    procedure Prcod_produtoExit(Sender: TObject);
    procedure Prcod_fornecedorButtonClick(Sender: TObject);
    procedure Prcod_fornecedorExit(Sender: TObject);
    procedure Prcod_grupoButtonClick(Sender: TObject);
    procedure Prcod_grupoExit(Sender: TObject);
    procedure sbProdutoClick(Sender: TObject);
    procedure sbGrupoClick(Sender: TObject);
    procedure btokClick(Sender: TObject);
    procedure BtGerarOCClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure fR_RELATORIOGetValue(const VarName: string; var Value: Variant);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbAlterarItemClick(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure prNr_OCButtonClick(Sender: TObject);
    procedure sbAlterarTodosClick(Sender: TObject);
    procedure CheckTodosClick(Sender: TObject);
    procedure Prcod_empresaButtonClick(Sender: TObject);
    procedure sbEmailClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure ImprimirOC(PDF: Boolean);
    procedure Prcod_empresaExit(Sender: TObject);
    procedure edCodProdutoChange(Sender: TObject);
    procedure edNomProdutoChange(Sender: TObject);
    procedure btAlterarOCClick(Sender: TObject);
    procedure btGraficoClick(Sender: TObject);
    procedure edUnidadeButtonClick(Sender: TObject);
    procedure edUnidadeExit(Sender: TObject);
    procedure edUnidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dgUltimasComprasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CarregaUltimasCompras(produto: string);
    procedure dgProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dgProdutosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dgProdutosCellClick(Column: TColumn);
    procedure edQtdEntradaExit(Sender: TObject);
    procedure edProdutoFornecedorChange(Sender: TObject);
    procedure SbFornClick(Sender: TObject);
    procedure sbLocalizarItemClick(Sender: TObject);
    procedure sbInserirTodosClick(Sender: TObject);
    procedure SbDeletarTodosClick(Sender: TObject);
    procedure sbInserirClick(Sender: TObject);
    procedure sbDeletarClick(Sender: TObject);
    procedure edcodProdutoAltExit(Sender: TObject);
    procedure sbInserirItemClick(Sender: TObject);
    procedure mmOCAfterScroll(DataSet: TDataSet);
    procedure mmOCAfterOpen(DataSet: TDataSet);
    procedure mmOCAfterDelete(DataSet: TDataSet);
    procedure edcodProdutoAltButtonClick(Sender: TObject);
    procedure edcodProdutoAltKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edcodProdutoAltEnter(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregaDados;
    procedure CarregaGrid;
  public
    { Public declarations }
    busca_qualquer_posicao_pesquisada: Boolean;
    campo_pesquisado, dado_pesquisado: string;
  end;

var
  FmOrdemCompra: TFmOrdemCompra;
  totalselecionados: Integer;
  valor_total: double;
  GradeDigitada: Boolean;

implementation

uses UnFun, Un_dao, Un_localizar,  UnPri, Un_dm,
  un_email_envio, Un_splash, un_dados_fornecedor;

{$R *.dfm}

procedure TFmOrdemCompra.CarregaDados;
var
  sql, where, sql_produto_fornecedor: string;
begin

  if trim(Prcod_fornecedor.Text) <> '' then

    sql_produto_fornecedor :=
      'coalesce((SELECT a.COD_PRODUTO_FORNECEDOR FROM PRODUTO_FORNECEDOR a where a.COD_PRODUTO = p.cod_produto and a.COD_FORNECEDOR = '
      + Prcod_fornecedor.Text + ' order by a.cod_produto_fornecedor desc limit 1),'' '') as cod_produto_fornecedor, '
  else
    sql_produto_fornecedor := ''' '' as cod_produto_fornecedor, ';

  sql := 'select p.COD_PRODUTO, ' + sql_produto_fornecedor +
    ' p.NOM_PRODUTO, p.custo_total, case when coalesce(qtd_estoque_max, 0) - qtd_estoque > 0 then coalesce(qtd_estoque_max, 0) - qtd_estoque else 0 end AS QTD_ENTRADA, 0 AS SUB_TOTAL, P.UNIDADE, P.QTD_EMBALAGEM, P.PESO from produto p ';

  where := 'WHERE ( 1 = 1 ';

  if trim(edProduto.Text) <> '' then
    where := where + fmfun.cmdAux('p.cod_produto', edProduto.Text);

  if trim(prNr_OC.Text) <> '' then
    where := where +
      ' and p.cod_produto not in (select o.COD_PRODUTO from OC2 o WHERE o.NR_OC = '
      + trim(prNr_OC.Text) + ')';

  if trim(edGrupo.Text) <> '' then
    where := where + fmfun.cmdAux('p.cod_grupo', edGrupo.Text);

  if trim(Prcod_fornecedor.Text) <> '' then
    where := where + ' and (p.fornecedor_principal = ' + Prcod_fornecedor.Text +
      '  or 0 < (select count(*) from produto_fornecedor pf1 where pf1.cod_produto = p.cod_produto and pf1.cod_fornecedor = '
      + Prcod_fornecedor.Text + '))';

  where := where + ' ) ';

  if trim(edNomProduto.Text) <> '' then
  begin

    sql := 'select p.COD_PRODUTO, ' + sql_produto_fornecedor +
      ' p.NOM_PRODUTO, p.custo_total, case coalesce(qtd_estoque_max, 0) - qtd_estoque > 0 then coalesce(qtd_estoque_max, 0) - qtd_estoque else 0 end AS QTD_ENTRADA, 0 AS SUB_TOTAL, P.UNIDADE, P.QTD_EMBALAGEM, P.PESO from produto p ';

    where := 'WHERE ( p.nom_produto like ''%' +
      edNomProduto.Text + '%''';

    if trim(prNr_OC.Text) <> '' then
      where := where +
        ' and p.cod_produto not in (select o.COD_PRODUTO from OC2 o WHERE o.NR_OC = '
        + trim(prNr_OC.Text) + ')';

    if trim(Prcod_fornecedor.Text) <> '' then
      where := where + ' and (p.fornecedor_principal = ' + Prcod_fornecedor.Text
        + '  or 0 < (select count(*) from produto_fornecedor pf1 where pf1.cod_produto = p.cod_produto and pf1.cod_fornecedor = '
        + Prcod_fornecedor.Text + '))';

    where := where + ' ) ';

  end;
  dao.Geral1(sql + where + ' order by p.NOM_PRODUTO ');

  if trim(prNr_OC.Text) <> '' then
  begin
    sql := 'select p.COD_PRODUTO, ' +
           '       pT.NOM_PRODUTO, '+
           '       P.CUSTO AS CUSTO_TOTAL, '+
           '       P.QTD_ENTRADA, '+
           '       P.SUB_TOTAL, '+
           '       pt.ORD_PAUTA, '+
           '       coalesce(P.UNIDADE, PT.UNIDADE) AS UNIDADE, '+
           '       coalesce(P.QTD_EMBALAGEM, PT.QTD_EMBALAGEM) AS QTD_EMBALAGEM, '+
           '       PT.PESO, '+
           '       PF.COD_PRODUTO_FORNECEDOR '+
           'from OC2 p '+
           'LEFT OUTER JOIN PRODUTO_FORNECEDOR PF ON PF.COD_FORNECEDOR = P.COD_FORNECEDOR AND PF.COD_PRODUTO = P.COD_PRODUTO  ' +
           'INNER JOIN PRODUTO PT ON (PT.COD_PRODUTO = P.COD_PRODUTO) WHERE NR_OC = ' + prNr_OC.Text + ' and coalesce(pf.COD_PRODUTO_FORNECEDOR,''0'') = coalesce((SELECT a.COD_PRODUTO_FORNECEDOR FROM PRODUTO_FORNECEDOR a where a.COD_PRODUTO = pt.cod_produto and a.COD_FORNECEDOR = p.cod_fornecedor '
      + ' order by a.cod_produto_fornecedor desc limit 1),''0'') order by NOM_PRODUTO ';

    dao.Geral3(sql);
  end;

  GradeDigitada := false;
  CarregaGrid;


end;

procedure TFmOrdemCompra.CarregaGrid;
var
  sql_fornecedor: string;
begin
  valor_total := 0;
  dao.Q1.Open();
  if not dao.Q1.IsEmpty  then
  begin

    dao.Q1.Last;
    fm_splash.ggProgress.MaxValue := dao.Q1.RecordCount;
    fm_splash.lbStatus.Caption := 'Carregando Itens...';
    fm_splash.ggProgress.progress := 0;
    fm_splash.Show;
    dao.Q1.first;
    mmLista.Close;
    mmLista.EmptyTable;
    mmLista.Open;

    mmOC.Close;
    mmOC.EmptyTable;
    mmOC.Open;

    while not dao.Q1.eof do
    begin
      if dao.Q1.fieldbyname('QTD_ENTRADA').AsCurrency = 0 then
      begin
        mmLista.Append;
        mmListaIDPRODUTO.AsString := dao.Q1.fieldbyname('COD_PRODUTO').AsString;
        mmListaNOME_PRODUTO.AsString := dao.Q1.fieldbyname('NOM_PRODUTO').AsString;
        mmListaCUSTO.Value := dao.Q1.fieldbyname('CUSTO_TOTAL').AsCurrency;
        mmListaQTD_ENTRADA.Value := dao.Q1.fieldbyname('QTD_ENTRADA').AsCurrency;
        mmListaSUB_TOTAL.Value := dao.Q1.fieldbyname('SUB_TOTAL').AsCurrency;
        mmListaQTD_EMBALAGEM.Value := dao.Q1.fieldbyname('QTD_EMBALAGEM').AsCurrency;
        mmListaUNIDADE.AsString := dao.Q1.fieldbyname('UNIDADE').AsString;
        mmListaCOD_PRODUTO_FORNECEDOR.AsString := dao.Q1.fieldbyname('COD_PRODUTO_FORNECEDOR').AsString;

        if Prcod_fornecedor.Text <> '' then
          sql_fornecedor := ' and e1.cod_fornecedor = ' + Prcod_fornecedor.Text
        else
          sql_fornecedor := '';

        mmLista.Post;
      end
      else
      begin
        mmOC.Append;
        mmOCIDPRODUTO.AsString := dao.Q1.fieldbyname('COD_PRODUTO').AsString;
        mmOCNOME_PRODUTO.AsString := dao.Q1.fieldbyname('NOM_PRODUTO').AsString;
        mmOCCUSTO.Value := dao.Q1.fieldbyname('CUSTO_TOTAL').AsCurrency;
        mmOCQTD_ENTRADA.Value := dao.Q1.fieldbyname('QTD_ENTRADA').AsCurrency;
        mmOCSUB_TOTAL.Value := dao.Q1.fieldbyname('CUSTO_TOTAL').AsCurrency * dao.Q1.fieldbyname('QTD_ENTRADA').AsCurrency;
        mmOCQTD_EMBALAGEM.Value := dao.Q1.fieldbyname('QTD_EMBALAGEM').AsCurrency;
        mmOCUNIDADE.AsString := dao.Q1.fieldbyname('UNIDADE').AsString;
        mmOCCOD_PRODUTO_FORNECEDOR.AsString := dao.Q1.fieldbyname('COD_PRODUTO_FORNECEDOR').AsString;
        mmOC.Post;

        valor_total := valor_total + mmOCSUB_TOTAL.Value;
      end;

      fm_splash.ggProgress.AddProgress(1);
      fm_splash.update;

      dao.Q1.next;
    end;

    mmLista.first;
  end;

  if not dao.Q3.IsEmpty and (trim(prNr_OC.Text) <> '') then
  begin
    dao.Q3.Last;
    fm_splash.ggProgress.MaxValue := dao.Q3.RecordCount;
    fm_splash.lbStatus.Caption := 'Carregando Itens...';
    fm_splash.ggProgress.progress := 0;
    fm_splash.Show;
    dao.Q3.first;
    while not dao.Q3.eof do
    begin
      mmOC.Append;

      mmOCIDPRODUTO.AsString    := dao.Q3.fieldbyname('COD_PRODUTO').AsString;
      mmOCNOME_PRODUTO.AsString := dao.Q3.fieldbyname('NOM_PRODUTO').AsString;
      mmOCCUSTO.Value           := dao.Q3.fieldbyname('CUSTO_TOTAL').AsCurrency;
      mmOCQTD_ENTRADA.Value     := dao.Q3.fieldbyname('QTD_ENTRADA').AsCurrency;
      mmOCSUB_TOTAL.Value       := dao.Q3.fieldbyname('SUB_TOTAL').AsCurrency;
      mmOCQTD_EMBALAGEM.Value   := dao.Q3.fieldbyname('QTD_EMBALAGEM').AsCurrency;
      mmOCUNIDADE.AsString      := dao.Q3.fieldbyname('UNIDADE').AsString;
      mmOCCOD_PRODUTO_FORNECEDOR.AsString := dao.Q3.fieldbyname('COD_PRODUTO_FORNECEDOR').AsString;

      mmOC.Post;
      valor_total := valor_total + mmOCSUB_TOTAL.Value;

      fm_splash.ggProgress.AddProgress(1);
      fm_splash.update;

      dao.Q3.next;
    end;

    mmOC.first;



    CarregaUltimasCompras(mmListaIDPRODUTO.AsString);
  end;
  stTotal.Caption := formatfloat('R$ #,###,##0.00', valor_total);
  fm_splash.hide;
end;

procedure TFmOrdemCompra.Prcod_produtoButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: Integer;
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
  chamou_form := 'fr_ordem_compra_produto';
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

procedure TFmOrdemCompra.Prcod_produtoExit(Sender: TObject);
begin
  if trim(Prcod_produto.Text) = '' then
    Lbnom_produto.Caption := '...';

  if Prcod_produto.Text <> '' then
  begin
    dao.Geral2('select nom_produto from produto where cod_produto=' +
      QuotedStr(Prcod_produto.Text));
    if dao.Q2.RecordCount > 0 then
    begin
      Lbnom_produto.Caption := dao.Q2.fieldbyname('nom_produto').AsString;
      if edProduto.Text = '' then
        edProduto.Text := Prcod_produto.Text;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_produto.Text := '';
      Prcod_produto.SetFocus;
      exit;
    end;
  end;

end;

procedure TFmOrdemCompra.Prcod_fornecedorButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: Integer;
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
  chamou_form := 'fr_ordem_compra_fornecedor';
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
end;

procedure TFmOrdemCompra.Prcod_fornecedorExit(Sender: TObject);
begin
  if trim(Prcod_fornecedor.Text) = '' then
    Lbfornecedor.Caption := '...';

  if Prcod_fornecedor.Text <> '' then
  begin
    dao.Geral2('select razao_social from fornecedor where cod_fornecedor=' +
      QuotedStr(Prcod_fornecedor.Text));
    if dao.Q2.RecordCount > 0 then
      Lbfornecedor.Caption := dao.Q2.fieldbyname('razao_social').AsString
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_fornecedor.Text := '';
      Prcod_fornecedor.SetFocus;
      exit;
    end;
  end;
end;

procedure TFmOrdemCompra.Prcod_grupoButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: Integer;
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
  chamou_form := 'fr_ordem_compra_grupo';
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

procedure TFmOrdemCompra.Prcod_grupoExit(Sender: TObject);
begin
  if trim(Prcod_grupo.Text) = '' then
    LbNom_Grupo.Caption := '...';

  if Prcod_grupo.Text <> '' then
  begin
    dao.Geral2('select nom_grupo from grupo where cod_grupo=' +
      QuotedStr(Prcod_grupo.Text));
    if dao.Q2.RecordCount > 0 then
    begin
      LbNom_Grupo.Caption := dao.Q2.fieldbyname('nom_grupo').AsString;
      if edGrupo.Text = '' then
        edGrupo.Text := Prcod_grupo.Text;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_grupo.Text := '';
      Prcod_grupo.SetFocus;
      exit;
    end;
  end;
end;

procedure TFmOrdemCompra.sbProdutoClick(Sender: TObject);
begin
  edProduto.Clear;
end;

procedure TFmOrdemCompra.sbGrupoClick(Sender: TObject);
begin
  edGrupo.Clear;
end;

procedure TFmOrdemCompra.sbInserirClick(Sender: TObject);
begin
  if mmOC.Active = false then
    mmOC.Open;

  mmOC.Append;
  mmOCIDPRODUTO.AsString := mmListaIDPRODUTO.AsString;
  mmOCNOME_PRODUTO.AsString := mmListaNOME_PRODUTO.AsString;
  mmOCCUSTO.Value := mmListaCUSTO.Value;
  mmOCQTD_ENTRADA.Value := mmListaQTD_ENTRADA.Value;
  mmOCSUB_TOTAL.Value := mmListaSUB_TOTAL.Value;
  mmOCQTD_EMBALAGEM.Value := mmListaQTD_EMBALAGEM.Value;
  mmOCUNIDADE.AsString := mmListaUNIDADE.AsString;
  mmOCCOD_PRODUTO_FORNECEDOR.AsString := mmListaCOD_PRODUTO_FORNECEDOR.AsString;
  mmOC.Post;

  mmLista.Delete;
end;

procedure TFmOrdemCompra.sbInserirItemClick(Sender: TObject);
begin
  mmOC.Append;
  sbSalvar.Enabled := true;
  sbInserirItem.Enabled := false;
  sbAlterarItem.Enabled := false;
  edcodProdutoAlt.SetFocus;
  dgProdutos.Enabled := false;
  btAlterarOC.Enabled := false;
  BtGerarOC.Enabled := false;
  sbEmail.Enabled := false;
  btImprimir.Enabled := false;
end;

procedure TFmOrdemCompra.sbInserirTodosClick(Sender: TObject);
begin
  if mmOC.Active = false then
    mmOC.Open;

  mmLista.first;
  while not mmLista.eof do
  begin

    mmOC.Append;
    mmOCIDPRODUTO.AsString := mmListaIDPRODUTO.AsString;
    mmOCNOME_PRODUTO.AsString := mmListaNOME_PRODUTO.AsString;
    mmOCCUSTO.Value := mmListaCUSTO.Value;
    mmOCQTD_ENTRADA.Value := mmListaQTD_ENTRADA.Value;
    mmOCSUB_TOTAL.Value := mmListaSUB_TOTAL.Value;
    mmOCQTD_EMBALAGEM.Value := mmListaQTD_EMBALAGEM.Value;
    mmOCUNIDADE.AsString := mmListaUNIDADE.AsString;
    mmOCCOD_PRODUTO_FORNECEDOR.AsString :=
      mmListaCOD_PRODUTO_FORNECEDOR.AsString;
    mmOC.Post;

    mmLista.next;
  end;
  mmLista.first;
  mmLista.EmptyTable;

end;

procedure TFmOrdemCompra.sbLocalizarItemClick(Sender: TObject);
begin
  CarregaDados;
end;

procedure TFmOrdemCompra.btokClick(Sender: TObject);
begin
  if GradeDigitada then
  begin
    if MessageDlg
      ('Os dados digitados abaixo poderão ser perdidos. Confirmar a consulta?',
      mtConfirmation, [mbYes, mbno], 0) = mryes then
      CarregaDados;
  end
  else
   CarregaDados;
end;

procedure TFmOrdemCompra.BtGerarOCClick(Sender: TObject);
var
  nr_oc: string;
begin
  if trim(Prcod_empresa.Text) = '' then
  begin
    showmessage('Empresa tem que ser preenchido.');
    Prcod_empresa.SetFocus;
    exit;
  end;

  if trim(Prcod_fornecedor.Text) = '' then
  begin
    showmessage('Fornecedor tem que ser preenchido.');
    Prcod_fornecedor.SetFocus;
    exit;
  end;

  if valor_total = 0 then
  begin
    showmessage('Nenhuma quantidade do pedido foi preenchida.');
    exit;
  end;

  mmOC.first;

  try
    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
    dao.Exec_sql.sql.Clear;
    dao.Exec_sql.sql.Add
      ('INSERT INTO OC1 (COD_EMPRESA, COD_FORNECEDOR, DTA_DOCUMENTO, VL_TOTAL, OBS) VALUES ('
      + Prcod_empresa.Text + ', ' + Prcod_fornecedor.Text +
      ', CURRENT_DATE, ' + StringReplace(formatfloat('#0.00', valor_total), ',',
      '.', [rfReplaceAll]) + ', ' + QuotedStr(mmObs.Text) + ')');
    dao.Exec_sql.ExecSQL;
    dao.cn.commit;

    dao.geral1('SELECT last_value FROM gen_oc1');
    nr_oc := dao.q1.fieldbyname('last_value').value;

  except
    dao.cn.Rollback;
  end;

  try
    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
    while not mmOC.eof do
    begin
      try
        dao.Exec_sql.sql.Clear;
        dao.Exec_sql.sql.Add
          (' INSERT INTO OC2 (NR_OC, COD_FORNECEDOR, COD_PRODUTO, QTD_ENTRADA, CUSTO, SUB_TOTAL, UNIDADE, QTD_EMBALAGEM) '
          + ' VALUES ( ' + nr_oc + ', ' + Prcod_fornecedor.Text + ',' +
          mmOCIDPRODUTO.AsString + ',' + StringReplace(formatfloat('#0.00',
          mmOCQTD_ENTRADA.Value), ',', '.', [rfReplaceAll]) + ',' +
          StringReplace(formatfloat('#0.00', mmOCCUSTO.Value), ',', '.',
          [rfReplaceAll]) + ',' + StringReplace(formatfloat('#0.00',
          mmOCSUB_TOTAL.Value), ',', '.', [rfReplaceAll]) + ',' +
          QuotedStr(mmOCUNIDADE.AsString) + ',' +
          StringReplace(formatfloat('#0.00', mmOCQTD_EMBALAGEM.Value), ',', '.',
          [rfReplaceAll]) + ')');
        dao.Exec_sql.ExecSQL;
      except
        exit;
      end;
      mmOC.next;
    end;
    dao.cn.commit;
  except
    dao.cn.Rollback;
  end;
  mmOC.first;
  prNr_OC.Text := nr_oc;
  btokClick(Self);
end;

procedure TFmOrdemCompra.ImprimirOC(PDF: Boolean);
var
  cmd, conexao, path: string;
  oExportfilter: TfrxCustomExportFilter;
begin
  if trim(prNr_OC.Text) = '' then
  begin
    showmessage('Nº da Ordem de Compra deve ser informado!');
    prNr_OC.SetFocus;
    exit;
  end;

  path := ExtractFilePath(Application.ExeName);
  cmd  := 'SELECT '+#13+
          '  e.NOM_EMPRESA, '+#13+
          '  e.CNPJ, '+#13+
          '  e.ie, '+#13+
          '  e.ENDERECO, '+#13+
          '  e.NR_ENDERECO, '+#13+
          '  e.BAIRRO, '+#13+
          '  e.CEP, '+#13+
          '  cast(c.Nom_cidade || '' - '' || C.UF as varchar(200)) as cidade, '+#13+
          '  a.NR_OC, '+#13+
          '  cast(a.COD_FORNECEDOR || '' - '' || f.RAZAO_SOCIAL as varchar(200)) as fornecedor, '+#13+
          '  a.DTA_DOCUMENTO, '+#13+
          '  a.VL_TOTAL, '+#13+
          '  cast(o.COD_PRODUTO || '' - '' || p.NOM_PRODUTO as VARCHAR(200)) as produto, '+#13+
          '  pf.COD_PRODUTO_FORNECEDOR, '+#13+
          '  cast(coalesce(o.unidade, p.unidade) || '' / '' || coalesce(o.qtd_embalagem, p.qtd_embalagem) as varchar(100)) as unidade, '+#13+
          '  o.CUSTO, '+#13+
          '  o.QTD_ENTRADA, '+#13+
          '  o.SUB_TOTAL, '+#13+
          '  A.OBS, '+#13+
          '  p.peso '+#13+
          'FROM OC1 a '+#13+
          'INNER JOIN OC2 O on (a.NR_OC = o.NR_OC) '+#13+
          'inner join FORNECEDOR f on (f.COD_FORNECEDOR = a.COD_FORNECEDOR) '+#13+
          'left outer join PRODUTO_FORNECEDOR pf on (pf.COD_FORNECEDOR = a.COD_FORNECEDOR and pf.COD_PRODUTO = o.COD_PRODUTO) '+#13+
          'inner join produto p on (p.COD_PRODUTO = o.COD_PRODUTO) '+#13+
          'inner join empresa e on (e.COD_EMPRESA = a.COD_EMPRESA) '+#13+
          'inner join cidades c on (e.COD_CIDADE = c.cod_cidade) '+#13+
          'where a.nr_oc = ' + prNr_OC.Text + ' and '+#13+
          '      coalesce(pf.COD_PRODUTO_FORNECEDOR, ''0'') = coalesce(( '+#13+
          '                                                             SELECT b.COD_PRODUTO_FORNECEDOR '+#13+
          '                                                              FROM PRODUTO_FORNECEDOR b '+#13+
          '                                                              where b.COD_PRODUTO = pf.cod_produto and '+#13+
          '                                                                    b.COD_FORNECEDOR = a.cod_fornecedor '+#13+
          '                                                              order by b.cod_produto_fornecedor desc '+#13+
          '                                                              limit 1 '+#13+
          '       ), ''0'') '+#13+
          'ORDER BY p.nom_produto';

  with dm.q_ordem_compra do
  begin
    Close;
    sql.Clear;
    sql.Add(cmd);
    Open;
  end;

  if dm.q_ordem_compra.RecordCount < 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not ckSemCusto.Checked then
  begin
    if not(fR_RELATORIO.LoadFromFile(path + 'Relatorios\ordem_compra.fr3')) then
    begin
      dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 +
        'Avise o Suporte');
      exit;
    end;
  end
  else
  begin
    if not(fR_RELATORIO.LoadFromFile(path +
      'Relatorios\ordem_compra_sem_custo.fr3')) then
    begin
      dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 +
        'Avise o Suporte');
      exit;
    end;
  end;

  if PDF then
  begin
    fR_RELATORIO.PrepareReport(true);
    oExportfilter := TfrxCustomExportFilter(frxPDFExport1);
    oExportfilter.ShowDialog := false;
    oExportfilter.FileName := 'OrdemCompra_' + prNr_OC.Text + '.pdf';
    fR_RELATORIO.Export(oExportfilter);
  end
  else
    fR_RELATORIO.ShowReport;
end;

procedure TFmOrdemCompra.mmOCAfterDelete(DataSet: TDataSet);
begin
  sbalteraritem.Enabled := not mmOC.IsEmpty;
  sbInserirItem.Enabled := True;
end;

procedure TFmOrdemCompra.mmOCAfterOpen(DataSet: TDataSet);
begin
  sbalteraritem.Enabled := not mmOC.IsEmpty;
  sbInserirItem.Enabled := True;
end;

procedure TFmOrdemCompra.mmOCAfterScroll(DataSet: TDataSet);
begin
  sbalteraritem.Enabled := not mmOC.IsEmpty;
  sbInserirItem.Enabled := True;
end;

procedure TFmOrdemCompra.FormShow(Sender: TObject);
begin
  GradeDigitada := false;
  // btokClick(self);
end;

procedure TFmOrdemCompra.fR_RELATORIOGetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'empresa' then
    Value := nom_empresa;
end;

procedure TFmOrdemCompra.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Activecontrol.Name = 'mmObs' then
    exit;
  if Key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TFmOrdemCompra.sbAlterarItemClick(Sender: TObject);
begin
  mmOC.Edit;
  sbSalvar.Enabled := true;
  sbInserirItem.Enabled := false;
  sbAlterarItem.Enabled := false;
  edPrecoCusto.SetFocus;
  dgProdutos.Enabled := false;
  btAlterarOC.Enabled := false;
  BtGerarOC.Enabled := false;
  sbEmail.Enabled := false;
  btImprimir.Enabled := false;
end;

procedure TFmOrdemCompra.sbSalvarClick(Sender: TObject);
begin
  dgProdutos.Enabled := true;
  mmOCSUB_TOTAL.Value := mmOCCUSTO.Value * mmOCQTD_ENTRADA.Value;
  mmOCNOME_PRODUTO.AsString := lbDescProdAlt.Caption;
  mmOC.Post;
  valor_total := 0;
  mmOC.first;
  while not mmOC.eof do
  begin
    valor_total := valor_total + mmOCSUB_TOTAL.Value;
    mmOC.next;
  end;
  mmOC.first;

  stTotal.Caption := 'Total: ' + formatfloat('R$ #,###,##0.00', valor_total);

  edcodProdutoAlt.SetFocus;
  sbAlterarItem.Enabled := true;
  sbSalvar.Enabled := false;
  GradeDigitada := true;
  btAlterarOC.Enabled := true;
  BtGerarOC.Enabled := true;
  sbEmail.Enabled := true;
  btImprimir.Enabled := true;
end;

procedure TFmOrdemCompra.prNr_OCButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Ordem de Compra';
  chamou_pesquisa := 'fr_ordem_compra';
  chamou_form := 'fr_ordem_compra';
  chamou_cadastro := 'fr_ordem_compra';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Ordem de Compra';
  Fr_localizar.BT_cadastro.Visible := false;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Número';
  Campos_combo[1] := 'Fornecedor';

  for i := 0 to 1 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  if campo_pesquisado <> '' then
  begin
    Fr_localizar.CBcampos.ItemIndex := Fr_localizar.CBcampos.Items.IndexOf
      (campo_pesquisado);
    Fr_localizar.EDlocalizar.Text := dado_pesquisado;
    Fr_localizar.zzbusca_qualquer.Checked := busca_qualquer_posicao_pesquisada;
    Fr_localizar.loc_ordem_compra(Fr_localizar.EDlocalizar.Text);
  end;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
end;

procedure TFmOrdemCompra.sbAlterarTodosClick(Sender: TObject);
var
  qtd: double;
begin
  if edPrecoCusto.Text = '0' then
  begin
    showmessage('Preço de Custo tem que ser preenchido!');
    edPrecoCusto.SetFocus;
    exit;
  end;

  if edQtdEntrada.Text = '0' then
  begin
    showmessage('Quantidade tem que ser preenchida!');
    edQtdEntrada.SetFocus;
    exit;
  end;

  qtd := mmOCQTD_ENTRADA.Value;
  mmOC.Cancel;
  mmOC.first;
  if not dao.cn.InTransaction then
    dao.cn.StartTransaction;
  while not mmOC.eof do
  begin
    mmOC.Edit;
    mmOCQTD_ENTRADA.Value := qtd;
    mmOCSUB_TOTAL.Value := qtd * mmOCCUSTO.Value;
    valor_total := valor_total + mmOCSUB_TOTAL.Value;
    mmOC.Post;
    mmOC.next;
  end;
  GradeDigitada := true;
  stTotal.Caption := 'Total: ' + formatfloat('R$ #,###,##0.00', valor_total);
end;

procedure TFmOrdemCompra.sbCancelarClick(Sender: TObject);
begin
  mmOC.Cancel;
end;

procedure TFmOrdemCompra.sbDeletarClick(Sender: TObject);
begin
  if mmLista.Active = false then
    mmLista.Open;

  mmLista.Append;

  mmListaIDPRODUTO.AsString := mmOCIDPRODUTO.AsString;
  mmListaNOME_PRODUTO.AsString := mmOCNOME_PRODUTO.AsString;
  mmListaCUSTO.Value := mmOCCUSTO.Value;
  mmListaQTD_ENTRADA.Value := mmOCQTD_ENTRADA.Value;
  mmListaSUB_TOTAL.Value := mmOCSUB_TOTAL.Value;
  mmListaQTD_EMBALAGEM.Value := mmOCQTD_EMBALAGEM.Value;
  mmListaUNIDADE.AsString := mmOCUNIDADE.AsString;
  mmListaCOD_PRODUTO_FORNECEDOR.AsString := mmOCCOD_PRODUTO_FORNECEDOR.AsString;

  mmLista.Post;

  mmOC.Delete;
end;

procedure TFmOrdemCompra.SbDeletarTodosClick(Sender: TObject);
begin
  if mmLista.Active = false then
    mmLista.Open;
  mmOC.first;
  while not mmOC.eof do
  begin

    mmLista.Append;

    mmListaIDPRODUTO.AsString := mmOCIDPRODUTO.AsString;
    mmListaNOME_PRODUTO.AsString := mmOCNOME_PRODUTO.AsString;
    mmListaCUSTO.Value := mmOCCUSTO.Value;
    mmListaQTD_ENTRADA.Value := mmOCQTD_ENTRADA.Value;
    mmListaSUB_TOTAL.Value := mmOCSUB_TOTAL.Value;
    mmListaQTD_EMBALAGEM.Value := mmOCQTD_EMBALAGEM.Value;
    mmListaUNIDADE.AsString := mmOCUNIDADE.AsString;
    mmListaCOD_PRODUTO_FORNECEDOR.AsString :=
      mmOCCOD_PRODUTO_FORNECEDOR.AsString;

    mmLista.Post;

    mmOC.next;

  end;
  mmOC.first;
  mmOC.EmptyTable;

end;

procedure TFmOrdemCompra.CheckTodosClick(Sender: TObject);
begin
  valor_total := 0;
  mmOC.first;
  while not mmOC.eof do
  begin
    mmOC.Edit;
    valor_total := valor_total + mmOCSUB_TOTAL.Value;
    mmOC.Post;
    mmOC.next;
  end;
  mmOC.first;
  stTotal.Caption := 'Total: ' + formatfloat('R$ #,###,##0.00', valor_total);
end;

procedure TFmOrdemCompra.Prcod_empresaButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Empresa';
  chamou_pesquisa := 'fr_empresa';
  chamou_form := 'fr_ordem_compra_empresa';
  chamou_cadastro := 'Fr_empresa';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Empresa';
  Fr_localizar.BT_cadastro.Visible := false;

  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';

  for i := 0 to 1 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(Campos_combo[i]);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFmOrdemCompra.sbEmailClick(Sender: TObject);
var
  corpo_email, assunto_email, email_fornecedor: string;
  EmailNFe: TEmail;
begin
  ImprimirOC(true);
  dao.Geral1('SELECT a.EMAIL_ENVIADO FROM OC1 a where a.NR_OC = ' +
    prNr_OC.Text);

  if (dao.Q1.fieldbyname('EMAIL_ENVIADO').AsString = 'S') then
  begin
    if MessageDlg('Email enviado anteriormente! Desejas Reenviá-lo?',
      mtConfirmation, [mbYes, mbno], 0) = mrno then
      exit;
  end;

  if trim(Prcod_fornecedor.Text) = '' then
  begin
    showmessage('Fornecedor tem que ser preenchido.');
    Prcod_fornecedor.SetFocus;
    exit;
  end;

  if trim(prNr_OC.Text) = '' then
    exit;

  assunto_email := 'PLASFAN - ORDEM DE COMPRA N°: ' + prNr_OC.Text;

  dao.Geral1('SELECT a.EMAIL FROM FORNECEDOR a where a.cod_fornecedor = ' +
    Prcod_fornecedor.Text);
  if dao.Q1.fieldbyname('EMAIL').IsNull then
  begin
    showmessage('Email do Fornecedor não está cadastrado!');
    exit;
  end
  else
    email_fornecedor := dao.Q1.fieldbyname('EMAIL').AsString;

  corpo_email := '<html><body> ' +
    '  <font face="Consolas" size="2">Segue em anexo a Ordem Compra.</font><br><br> '
    + '  <font face="Consolas" size="2">Informa&ccedil;&otilde;es: ' +
    fone_empresa + '</font><br> ' + '  <font face="Consolas" size="2">' +
    home_page + '</font><br><br>' + '  <img src="cid:123456"><br>' +
    '</body></html> ';

  { if dao.CN.Path = 'C:\orbi\trunk\dados\orbi.fdb' then }
  EmailNFe := TEmail.Create(corpo_email, assunto_email, '', '', '', '',
    'claudioplasfan@gmail.com', 'OrdemCompra_' + prNr_OC.Text + '.pdf');
  { else
    EmailNFe := TEmail.Create(corpo_email, assunto_email, email_fornecedor, '', '', '', 'claudioplasfan@gmail.com;compras@plasfan.ind.br;fantoni@plasfan.ind.br', 'OrdemCompra_' + prNr_oc.Text + '.pdf'); }

  try
    Application.CreateForm(TFr_email_envio, Fr_email_envio);
    Fr_email_envio.lbResultado.Caption :=
      'Enviando Email de Ordem de Compra ao Fornecedor...';
    Fr_email_envio.ShowModal;
  finally
    Fr_email_envio.Free;
    try
      if not dao.cn.InTransaction then
        dao.cn.StartTransaction;
      dao.ExecSQL('UPDATE OC1 SET EMAIL_ENVIADO = ''S'' WHERE NR_OC = ' +
        prNr_OC.Text);
      dao.cn.commit;
    except
      dao.cn.Rollback;
    end;
  end;
end;

procedure TFmOrdemCompra.SbFornClick(Sender: TObject);
begin
  if Prcod_fornecedor.Text <> '' then
  begin
    Application.CreateForm(TFr_dados_fornecedor, Fr_dados_fornecedor);
    Fr_dados_fornecedor.Busca_dados_fornecedor(Prcod_fornecedor.Text);
    Fr_dados_fornecedor.ShowModal;
  end;
end;

procedure TFmOrdemCompra.btImprimirClick(Sender: TObject);
begin
  ImprimirOC(false);
end;

procedure TFmOrdemCompra.Prcod_empresaExit(Sender: TObject);
begin
  if trim(Prcod_empresa.Text) = '' then
    Lbempresa_faturamento.Caption := '...';

  if Prcod_empresa.Text <> '' then
  begin
    dao.Geral2
      ('select nom_empresa||'' - ''||CNPJ AS NOM_EMPRESA From empresa where cod_empresa='
      + QuotedStr(Prcod_empresa.Text));
    if dao.Q2.RecordCount > 0 then
    begin
      Lbempresa_faturamento.Caption :=
        dao.Q2.fieldbyname('nom_empresa').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_empresa.Text := '';
      Prcod_empresa.SetFocus;
      exit;
    end;
  end;
end;

procedure TFmOrdemCompra.edcodProdutoAltButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
begin
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'Marca';

  try
    fmfun.Localizar(
     'fr_ordem_compra_produto_alt',
     'fr_produto',
     'Localizar Produto',
     'Fr_produto',
     'Cadastro de' + #13 + 'Produto',
     true,
     Campos_combo, 'S');
  finally
     edcodProdutoAltExit(Self);
  end;

end;

procedure TFmOrdemCompra.edcodProdutoAltEnter(Sender: TObject);
begin
  if mmOC.State in [dsBrowse] then
    sbInserirItemClick(Self);
end;

procedure TFmOrdemCompra.edcodProdutoAltExit(Sender: TObject);
begin
  if trim(edcodProdutoAlt.Text) = '' then
  begin
    lbDescProdAlt.Caption := '...';
    mmOC.Cancel;
    exit;
  end;

  if edcodProdutoAlt.Text <> '' then
  begin
    dao.Geral2('select nom_produto, custo_total, case when coalesce(qtd_estoque_max, 0) - qtd_estoque > 0 then coalesce(qtd_estoque_max, 0) - qtd_estoque else 0 end qtd_sugerida from produto where cod_produto=' +
      QuotedStr(edcodProdutoAlt.Text));
    if dao.Q2.RecordCount > 0 then
    begin
      lbDescProdAlt.Caption := dao.Q2.fieldbyname('nom_produto').AsString;
      mmOCCUSTO.AsFloat := dao.Q2.fieldbyname('custo_total').AsFloat;
      mmOCQTD_ENTRADA.AsFloat := dao.Q2.fieldbyname('qtd_sugerida').AsFloat;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      mmOCCUSTO.AsVariant := null;
      edcodProdutoAlt.Text := '';
      edcodProdutoAlt.SetFocus;
      exit;
    end;
  end;
end;

procedure TFmOrdemCompra.edcodProdutoAltKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F9 then
    edcodProdutoAltButtonClick(Self);
end;

procedure TFmOrdemCompra.edCodProdutoChange(Sender: TObject);
begin
  if edCodProduto.Text <> '' then
    mmLista.Locate('IDPRODUTO', edCodProduto.Text, [loPartialKey]);
end;

procedure TFmOrdemCompra.edNomProdutoChange(Sender: TObject);
begin
  if edNomProduto.Text <> '' then
    mmLista.Locate('NOME_PRODUTO', edNomProduto.Text, [loPartialKey]);
end;

procedure TFmOrdemCompra.btAlterarOCClick(Sender: TObject);
begin
  if trim(prNr_OC.Text) = '' then
  begin
    showmessage('Nº da Ordem de Compra deve ser informado!');
    prNr_OC.SetFocus;
    exit;
  end;

  if trim(Prcod_empresa.Text) = '' then
  begin
    showmessage('Empresa tem que ser preenchido.');
    Prcod_empresa.SetFocus;
    exit;
  end;

  if trim(Prcod_fornecedor.Text) = '' then
  begin
    showmessage('Fornecedor tem que ser preenchido.');
    Prcod_fornecedor.SetFocus;
    exit;
  end;

  if valor_total = 0 then
  begin
    showmessage('Nenhuma quantidade do pedido foi preenchida.');
    exit;
  end;

  mmOC.first;
  try
    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
    dao.Exec_sql.sql.Clear;
    dao.Exec_sql.sql.Add('DELETE FROM OC1 WHERE NR_OC = ' + prNr_OC.Text);
    dao.Exec_sql.ExecSQL;
    dao.cn.commit;
  except
    dao.cn.Rollback;
  end;

  try
    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
    dao.Exec_sql.sql.Clear;
    dao.Exec_sql.sql.Add('DELETE FROM OC2 WHERE NR_OC = ' + prNr_OC.Text);
    dao.Exec_sql.ExecSQL;
    dao.cn.commit;
  except
    dao.cn.Rollback;
  end;

  try
    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
    dao.Exec_sql.sql.Clear;
    dao.Exec_sql.sql.Add
      ('INSERT INTO OC1 (NR_OC, COD_EMPRESA, COD_FORNECEDOR, DTA_DOCUMENTO, VL_TOTAL, OBS) VALUES ('
      + prNr_OC.Text + ', ' + Prcod_empresa.Text + ', ' + Prcod_fornecedor.Text
      + ', CURRENT_DATE, ' + StringReplace(formatfloat('#0.00', valor_total),
      ',', '.', [rfReplaceAll]) + ', ' + QuotedStr(mmObs.Text) + ')');
    dao.Exec_sql.ExecSQL;
    dao.cn.commit;
  except
    dao.cn.Rollback;
  end;

  try
    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
    while not mmOC.eof do
    begin
      try
        dao.Exec_sql.sql.Clear;
        dao.Exec_sql.sql.Add
          (' INSERT INTO OC2 (NR_OC, COD_FORNECEDOR, COD_PRODUTO, QTD_ENTRADA, CUSTO, SUB_TOTAL, UNIDADE, QTD_EMBALAGEM) '
          + ' VALUES ( ' + prNr_OC.Text + ', ' + Prcod_fornecedor.Text + ',' +
          mmOCIDPRODUTO.AsString + ',' + StringReplace(formatfloat('#0.00',
          mmOCQTD_ENTRADA.Value), ',', '.', [rfReplaceAll]) + ',' +
          StringReplace(formatfloat('#0.00', mmOCCUSTO.Value), ',', '.',
          [rfReplaceAll]) + ',' + StringReplace(formatfloat('#0.00',
          mmOCSUB_TOTAL.Value), ',', '.', [rfReplaceAll]) + ',' +
          QuotedStr(mmOCUNIDADE.AsString) + ',' +
          StringReplace(formatfloat('#0.00', mmOCQTD_EMBALAGEM.Value), ',', '.',
          [rfReplaceAll]) + ')');
        dao.Exec_sql.ExecSQL;
      except
        exit;
      end;
      mmOC.next;
    end;
    dao.cn.commit;
  except
    dao.cn.Rollback;
  end;

  mmOC.first;

  btokClick(Self);
end;

procedure TFmOrdemCompra.btGraficoClick(Sender: TObject);
begin
  if not mmOCIDPRODUTO.IsNull then
    fmfun.GraficoCusto(mmOCIDPRODUTO.AsString);
end;

procedure TFmOrdemCompra.edUnidadeButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Unidade';
  chamou_pesquisa := 'fr_unidade';
  chamou_form := 'fr_oc_unidade';
  chamou_cadastro := 'Fr_unidade';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Unidade';
  Fr_localizar.BT_cadastro.Visible := true;

  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Unidade';

  for i := 0 to 1 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(Campos_combo[i]);
  end;
  Fr_localizar.CBcampos.ItemIndex := 0;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
end;

procedure TFmOrdemCompra.edUnidadeExit(Sender: TObject);
begin
  if edUnidade.Text <> '' then
  begin
    dao.Geral2('select unidade from unidade where unidade=' +
      QuotedStr(edUnidade.Text));
    if dao.Q2.RecordCount > 0 then
    begin
      edUnidade.Text := dao.Q2.fieldbyname('unidade').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      edUnidade.Text := '';
      edUnidade.SetFocus;
      exit;
    end;
  end;

  sbSalvarClick(Self);
end;

procedure TFmOrdemCompra.edUnidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F9 then
    edUnidadeButtonClick(Self);
end;

procedure TFmOrdemCompra.dgUltimasComprasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (gdSelected in State) then // se a célula está selecionada
  begin
    dgUltimasCompras.Canvas.Font.Color := clWhite;
    dgUltimasCompras.Canvas.Brush.Color := clBlue;
  end
  else if odd(Q_UltimasCompras.RecNo) then
  begin
    dgUltimasCompras.Canvas.Font.Color := clBlack;
    dgUltimasCompras.Canvas.Brush.Color := $CCFFFF;
  end
  else
  begin
    dgUltimasCompras.Canvas.Font.Color := clBlack;
    dgUltimasCompras.Canvas.Brush.Color := clWhite;
  end;
  dgUltimasCompras.Canvas.FillRect(Rect);
  dgUltimasCompras.Canvas.TextOut(Rect.Left + 2, Rect.Top,
    Column.Field.AsString);

  dgUltimasCompras.DefaultDrawDataCell(Rect, dgUltimasCompras.columns[DataCol]
    .Field, State);
end;

procedure TFmOrdemCompra.CarregaUltimasCompras(produto: string);
begin
  Q_UltimasCompras.Close;
  Q_UltimasCompras.ParamByName('produto').Value := produto;
  Q_UltimasCompras.Open;
end;

procedure TFmOrdemCompra.dgProdutosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CarregaUltimasCompras(mmListaIDPRODUTO.AsString);
end;

procedure TFmOrdemCompra.dgProdutosKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CarregaUltimasCompras(mmListaIDPRODUTO.AsString);
end;

procedure TFmOrdemCompra.dgProdutosCellClick(Column: TColumn);
begin
  CarregaUltimasCompras(mmListaIDPRODUTO.AsString);
end;

procedure TFmOrdemCompra.edQtdEntradaExit(Sender: TObject);
begin
  if not sbSalvar.enabled then Exit;

  if not fmfun.ValidarQuantidadeMaxima(mmOCIDPRODUTO.AsString, mmOCQTD_ENTRADA.Value)
  then
  begin
    edQtdEntrada.SetFocus;
    exit;
  end;
end;

procedure TFmOrdemCompra.edProdutoFornecedorChange(Sender: TObject);
begin
  sbAlterarItem.Enabled := true;
  sbSalvar.Enabled := false;
  if edProdutoFornecedor.Text <> '' then
    mmOC.Locate('COD_PRODUTO_FORNECEDOR', edProdutoFornecedor.Text,
      [loPartialKey]);
end;

end.
