unit Un_mala_direta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, frxClass, DB,
   RxMemDS, DBCtrls, Mask, xmldom, XMLIntf,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  msxmldom, XMLDoc, frxExportPDF, sSpeedButton,
  sPanel, sBitBtn, sLabel, sCheckBox, sGroupBox, acDBGrid, sEdit,
  sTooledit, sMaskEdit, sCustomComboEdit, sCurrEdit, sCurrencyEdit,
  sComboEdit, frxExportBaseDialog;

type
  TFmMalaDireta = class(TForm)
    Panel1: tsPanel;
    BtPublicar: TsSpeedButton;
    btImprimir: TsSpeedButton;
    Panel2: tsPanel;
    Panel3: tsPanel;
    mmMala: TRxMemoryData;
    dsMala: TDataSource;
    fR_RELATORIO: TfrxReport;
    mmMalaIDPRODUTO: TIntegerField;
    mmMalaNOME_PRODUTO: TStringField;
    mmMalaVALOR_PROMOCAO: TCurrencyField;
    gbPrecoProm: TsGroupBox;
    edPrecoPromocao: TsCurrencyEdit;
    gbValidoAte: TsGroupBox;
    EDValidoAte: TsDateEdit;
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
    XMLGeral: TXMLDocument;
    idHttpGeral: TIdHTTP;
    sbAlterar: TsSpeedButton;
    Label1: tsLabel;
    edFornecedor: TsEdit;
    sbFornecedor: TsSpeedButton;
    gbDesconto: TsGroupBox;
    edDesconto: TsCurrencyEdit;
    Panel6: tsPanel;
    Panel7: tsPanel;
    dgPalm: Tdbgrid;
    Panel8: tsPanel;
    DBGrid1: Tdbgrid;
    sbDeletar: TsSpeedButton;
    sbInserir: TsSpeedButton;
    sbInserirTodos: TsSpeedButton;
    SbDeletarTodos: TsSpeedButton;
    mmProdutos: TRxMemoryData;
    dsProdutos: TDataSource;
    edMalaDiretaData: TsDateEdit;
    mmProdutosID_PRODUTO: TIntegerField;
    mmProdutosNOME_PRODUTO: TStringField;
    mmProdutosUNIDADE: TStringField;
    mmProdutosVALOR_PROMOCAO: TCurrencyField;
    mmProdutosPRECO_VENDA: TCurrencyField;
    mmProdutosSUBCATEGORIA: TIntegerField;
    mmProdutosORD_PAUTA: TIntegerField;
    mmMalaSUBCATEGORIA: TIntegerField;
    mmMalaORD_PAUTA: TIntegerField;
    mmMalaUNIDADE: TStringField;
    mmMalaQTD_EMBALAGEM: TFloatField;
    btnSalvar: TsSpeedButton;
    sbAltTodos: TsSpeedButton;
    mmProdutosQTD_EMBALAGEM: TFloatField;
    mmMalaCUSTO_TOTAL: TCurrencyField;
    mmProdutosCUSTO_TOTAL: TCurrencyField;
    mmProdutosACRESCIMO: TFloatField;
    mmMalaACRESCIMO: TFloatField;
    rgTipo: TsRadioGroup;
    Label2: tsLabel;
    edProdutoDesc: TsEdit;
    GroupBox2: TsGroupBox;
    edCodProduto: TsEdit;
    edNomProduto: TsEdit;
    CbPromocao: tscheckbox;
    mmMalaDESCONTO: TFloatField;
    mmMalaPRECO_VENDA: TCurrencyField;
    mmProdutosDESCONTO: TFloatField;
    sbEmail: TsSpeedButton;
    frxPDFExport1: TfrxPDFExport;
    mmMalaMARGEM_LUCRO: TFloatField;
    mmProdutosMARGEM_LUCRO: TFloatField;
    cbZerar: TsCheckBox;
    btImpPromo: TsSpeedButton;
    gbMargemLucro: TsGroupBox;
    edMargemLucro: TsCurrencyEdit;
    ckLiquidacao: TsCheckBox;

    procedure Prcod_produtoButtonClick(Sender: TObject);
    procedure Prcod_produtoExit(Sender: TObject);
    procedure Prcod_fornecedorButtonClick(Sender: TObject);
    procedure Prcod_fornecedorExit(Sender: TObject);
    procedure Prcod_grupoButtonClick(Sender: TObject);
    procedure Prcod_grupoExit(Sender: TObject);
    procedure sbProdutoClick(Sender: TObject);
    procedure sbGrupoClick(Sender: TObject);
    procedure btokClick(Sender: TObject);
    procedure BtPublicarClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbAlterarClick(Sender: TObject);
    procedure sbFornecedorClick(Sender: TObject);
    procedure fR_RELATORIOGetValue(const VarName: string;
      var Value: Variant);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnSalvarClick(Sender: TObject);
    procedure sbAltTodosClick(Sender: TObject);
    procedure sbInserirTodosClick(Sender: TObject);
    procedure sbInserirClick(Sender: TObject);
    procedure sbDeletarClick(Sender: TObject);
    procedure SbDeletarTodosClick(Sender: TObject);
    procedure edCodProdutoChange(Sender: TObject);
    procedure edNomProdutoChange(Sender: TObject);
    procedure sbEmailClick(Sender: TObject);
    procedure ImprimirMalaDireta(pdf: boolean);
    procedure btImpPromoClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregaDados(tipo: integer);
    //    procedure CarregaGrid;
    procedure CarregaGridProdutos;
    procedure CarregaGridMala;
    procedure AtualizaProdutoWeb;
  public
    { Public declarations }

  end;

var
  FmMalaDireta: TFmMalaDireta;
  totalselecionados: integer;
  relat_mala_direta : string;

implementation

uses UnFun, Un_dao, Un_localizar,  UnPri, Un_dm, Un_splash,
  un_aviso_representantes;

{$R *.dfm}

procedure TFmMalaDireta.CarregaDados(tipo: integer);
var
  sql, where, where_not, where_geral: string;
begin
  if tipo = 1 then
    if MessageDlg('Esse processo vai Cancelar os Dados Digitados não Salvos. Confirmar?', mtConfirmation, [mbYes, mbno], 0) = mrno then
      exit;

  sql := 'select p.COD_PRODUTO, p.NOM_PRODUTO, P.CUSTO_TOTAL, P.PRECO_VENDA, P.UNIDADE, P.Qtd_embalagem, P.DESCONTO_MAXIMO, p.preco_promocao, p.promocao, p.subcategoria, p.ord_pauta, ' +
    ' 100 - ((case when coalesce(p.preco_promocao, 0) = 0 then p.preco_venda else p.preco_promocao end) / p.preco_venda) * 100 as desc_promocao, ' +
    ' 100 - (p.custo_total / (case when coalesce(p.preco_promocao, 0) = 0 then p.preco_venda else p.preco_promocao end)) * 100 as margem_lucro from produto p ' +
    ' WHERE p.status <> ''S'' and ( p.preco_venda > 0 ';

  if trim(edProduto.Text) <> '' then
    where := where + fmfun.cmdAux('p.cod_produto', edproduto.Text);

  if trim(edProdutoDesc.Text) <> '' then
    where := where + ' AND P.NOM_PRODUTO LIKE ''%' + edProdutoDesc.Text + '%''';

  if trim(edGrupo.Text) <> '' then
    where := where + fmfun.cmdAux('p.cod_grupo', edgrupo.Text);

  if trim(edFornecedor.Text) <> '' then
    where := where + fmfun.cmdAux('p.fornecedor_principal', edFornecedor.Text);

  if edMalaDiretaData.Date <> 0 then
    where_not := ' AND P.COD_PRODUTO NOT IN (SELECT PI.COD_PRODUTO FROM PROMOCAO_ITEM PI INNER JOIN PROMOCAO PR ON (PR.ID = PI.PROMOCAO_ID AND PR.DATA_VALIDA_ATE =' + QUOTEDSTR(formatdatetime('dd/mm/yyyy', edMalaDiretaData.Date)) + '))';

  if cbPromocao.Checked then
    where := where + ' AND P.PROMOCAO = ''S''';

  where_geral := where + where_not + ' ) ';

  dao.Geral1(sql + where_geral + ' order by p.ord_pauta limit 100 ');

  CarregaGridProdutos;

  if edMalaDiretaData.Date <> 0 then
  begin
    dao.Geral1('SELECT PI.COD_PRODUTO, P.NOM_PRODUTO, P.CUSTO_TOTAL, P.PRECO_VENDA, PI.PRECO_PROMOCAO, P.SUBCATEGORIA, P.ORD_PAUTA, ' +
      ' 100 - ((case when coalesce(p.preco_promocao, 0) = 0 then p.preco_venda else pi.preco_promocao end) / p.preco_venda) * 100 as desc_promocao, ' +
      ' (((case when coalesce(pi.preco_promocao, 0) = 0 then p.preco_venda else pi.preco_promocao end) - p.custo_total)/p.custo_total) * 100 as margem_lucro, pm.liquidacao ' +
      'FROM PROMOCAO_ITEM PI                                      ' +
      'INNER JOIN PROMOCAO PM ON (PM.ID = PI.PROMOCAO_ID)         ' +
      'INNER JOIN PRODUTO P ON (P.COD_PRODUTO = PI.COD_PRODUTO) ' +
      'WHERE p.status <> ''S'' and PM.DATA_VALIDA_ATE = ' + QUOTEDSTR(formatdatetime('dd/mm/yyyy', edMalaDiretaData.Date)) +
      ' and p.preco_venda > 0 ');

    CarregaGridMala;
  end
  else
    mmMala.Open;
end;

procedure TFmMalaDireta.CarregaGridMala;
begin
  dao.Q1.first;

  fm_splash.ggProgress.MaxValue := dao.Q1.RecordCount;
  fm_splash.lbStatus.Caption := 'Carregando Itens...';
  fm_splash.ggProgress.progress := 0;
  fm_splash.Show;

  mmMala.Close;
  mmMala.EmptyTable;
  mmMala.Open;
  while not dao.Q1.eof do
  begin
    mmMala.Append;
    mmMalaIDPRODUTO.AsString := dao.Q1.fieldbyname('COD_PRODUTO').AsString;
    mmMalaNOME_PRODUTO.AsString := dao.Q1.fieldbyname('NOM_PRODUTO').AsString;
    mmMalaVALOR_PROMOCAO.Value := dao.Q1.fieldbyname('preco_promocao').AsCurrency;
    mmMalaSUBCATEGORIA.Value := dao.Q1.fieldbyname('SUBCATEGORIA').AsInteger;
    mmMalaORD_PAUTA.Value := dao.Q1.fieldbyname('ORD_PAUTA').AsInteger;
    mmMalaDESCONTO.VALUE := dao.Q1.fieldbyname('desc_promocao').AsFloat;
    mmMalaMARGEM_LUCRO.VALUE := dao.Q1.fieldbyname('margem_lucro').AsFloat;
    mmMalaPRECO_VENDA.VALUE := dao.Q1.fieldbyname('PRECO_VENDA').AsCURRENCY;
    mmMalaCUSTO_TOTAL.VALUE := dao.Q1.fieldbyname('CUSTO_TOTAL').AsCURRENCY;
    mmMala.Post;

    fm_splash.ggProgress.AddProgress(1);
    fm_splash.Refresh;
    sleep(10);

    dao.Q1.next;
  end;
  mmMala.First;
  fm_splash.Hide;

  ckLiquidacao.Checked := dao.Q1.FieldByName('LIQUIDACAO').AsString = 'S';
    
end;

procedure TFmMalaDireta.CarregaGridProdutos;
begin
  dao.Q1.first;

  fm_splash.ggProgress.MaxValue := dao.Q1.RecordCount;
  fm_splash.lbStatus.Caption := 'Carregando Itens...';
  fm_splash.ggProgress.progress := 0;
  fm_splash.Show;

  mmProdutos.Close;
  mmProdutos.EmptyTable;
  mmProdutos.Open;
  while not dao.Q1.eof do
  begin
    mmProdutos.Append;
    mmProdutosID_PRODUTO.AsString := dao.Q1.fieldbyname('COD_PRODUTO').AsString;
    mmProdutosQTD_EMBALAGEM.Value := dao.Q1.fieldbyname('Qtd_embalagem').AsInteger;
    mmProdutosNOME_PRODUTO.AsString := dao.Q1.fieldbyname('NOM_PRODUTO').AsString;
    mmProdutosUNIDADE.AsString := dao.Q1.fieldbyname('UNIDADE').AsString;
    mmProdutosVALOR_PROMOCAO.Value := dao.Q1.fieldbyname('preco_promocao').AsCurrency;
    mmProdutosCUSTO_TOTAL.VALUE := dao.Q1.fieldbyname('CUSTO_TOTAL').AsCURRENCY;
    mmProdutosPRECO_VENDA.VALUE := dao.Q1.fieldbyname('PRECO_VENDA').AsCURRENCY;
    mmProdutosSUBCATEGORIA.Value := dao.Q1.fieldbyname('subcategoria').AsInteger;
    mmProdutosORD_PAUTA.Value := dao.Q1.fieldbyname('ORD_PAUTA').AsInteger;
    mmProdutosDESCONTO.VALUE := dao.Q1.fieldbyname('desc_promocao').AsFloat;
    mmProdutosMARGEM_LUCRO.VALUE := dao.Q1.fieldbyname('margem_lucro').AsFloat;

    mmProdutos.Post;

    fm_splash.ggProgress.AddProgress(1);
    fm_splash.Refresh;
    sleep(10);

    dao.Q1.next;
  end;
  mmProdutos.First;
  fm_splash.Hide;
end;

procedure TFmMalaDireta.Prcod_produtoButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Produto';
  chamou_pesquisa := 'fr_produto';
  chamou_form := 'fr_mala_direta_produto';
  chamou_cadastro := 'Fr_produto';
  revenda := 'S';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Produto';
  Fr_localizar.BT_cadastro.Visible := true;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'Marca';

  for i := 0 to 2 do
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
  edProduto.Text := edProduto.Text + ';' + Prcod_produto.Text;
  if pos(';', edProduto.Text) = 1 then
    edProduto.Text := copy(edProduto.Text, 2, length(edProduto.Text));
end;

procedure TFmMalaDireta.Prcod_produtoExit(Sender: TObject);
begin
  if trim(Prcod_produto.Text) = '' then
    Lbnom_produto.Caption := '...';

  if Prcod_produto.Text <> '' then
  begin
    dao.Geral2('select nom_produto from produto where cod_produto=' + QuotedStr(Prcod_produto.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_produto.Caption := dao.Q2.fieldbyname('nom_produto').AsString;
      if edproduto.Text = '' then
        edproduto.Text := Prcod_produto.Text;
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

procedure TFmMalaDireta.Prcod_fornecedorButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Fornecedor';
  chamou_pesquisa := 'fr_fornecedor';
  chamou_form := 'fr_mala_direta_fornecedor';
  chamou_cadastro := 'Fr_fornecedor';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Fornecedores';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 5);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Razão Social';
  Campos_combo[2] := 'Fantasia';
  Campos_combo[3] := 'CNPJ';
  Campos_combo[4] := 'Cidade';

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

  edFornecedor.Text := edFornecedor.Text + ';' + Prcod_fornecedor.Text;
  if pos(';', edFornecedor.Text) = 1 then
    edFornecedor.Text := copy(edFornecedor.Text, 2, length(edFornecedor.Text));

end;

procedure TFmMalaDireta.Prcod_fornecedorExit(Sender: TObject);
begin
  if trim(Prcod_fornecedor.Text) = '' then
    Lbfornecedor.Caption := '...';

  if Prcod_fornecedor.Text <> '' then
  begin
    dao.Geral2('select razao_social from fornecedor where cod_fornecedor=' + QuotedStr(Prcod_fornecedor.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbfornecedor.Caption := dao.Q2.fieldbyname('razao_social').AsString;
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

procedure TFmMalaDireta.Prcod_grupoButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Grupo';

  chamou_pesquisa := 'fr_grupo';
  chamou_form := 'fr_mala_direta_grupo';
  chamou_cadastro := 'fr_grupo';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Grupos';

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'UF';

  for i := 0 to 1 do
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

  edGrupo.Text := edGrupo.Text + ';' + Prcod_grupo.Text;
  if pos(';', edGrupo.Text) = 1 then
    edGrupo.Text := copy(edGrupo.Text, 2, length(edGrupo.Text));

end;

procedure TFmMalaDireta.Prcod_grupoExit(Sender: TObject);
begin
  if trim(Prcod_grupo.Text) = '' then
    LbNom_Grupo.Caption := '...';

  if Prcod_grupo.Text <> '' then
  begin
    dao.Geral2('select nom_grupo from grupo where cod_grupo=' + QuotedStr(Prcod_grupo.Text));
    if dao.q2.RecordCount > 0 then
    begin
      LbNom_Grupo.Caption := dao.Q2.fieldbyname('nom_grupo').AsString;
      if edgrupo.Text = '' then
        edgrupo.Text := Prcod_grupo.Text;
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

procedure TFmMalaDireta.sbProdutoClick(Sender: TObject);
begin
  edProduto.Clear;
end;

procedure TFmMalaDireta.sbGrupoClick(Sender: TObject);
begin
  edgrupo.Clear;
end;

procedure TFmMalaDireta.btokClick(Sender: TObject);
begin
    CarregaDados(1);
end;

procedure TFmMalaDireta.BtPublicarClick(Sender: TObject);
var
  promocao_pacote: string;
begin
  if MessageDlg('Esse processo efetuará a Publicação no WebSite e no Sistema do Palm. Confirmar?', mtConfirmation, [mbYes, mbno], 0) = mrno then
    exit;

  btnSalvarClick(self);

  if EDValidoAte.Date = 0 then
  begin
    showmessage('Prazo da Promoção tem que ser preenchida!');
    EDValidoAte.SetFocus;
    exit;
  end;

  if cbZerar.Checked then
    FRPRI.ZeraProdutoWeb;

  mmMala.First;

  fm_splash.ggProgress.MaxValue := mmMala.RecordCount;
  fm_splash.lbStatus.Caption := 'Atualizados Dados da Promoção...';
  fm_splash.ggProgress.progress := 0;
  fm_splash.Show;
  try
    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
    while not mmMala.eof do
    begin
      try
        dao.Exec_sql.SQL.Clear;
        dao.Exec_sql.SQL.Add('UPDATE PRODUTO SET PROMOCAO = ''S'', DESCONTO_MAXIMO = '+ StringReplace(formatfloat('#0.00', mmMalaDESCONTO.Value), ',', '.', [rfReplaceAll]) +', PRECO_PROMOCAO = ' + StringReplace(formatfloat('#0.00', mmMalaVALOR_PROMOCAO.Value), ',', '.', [rfReplaceAll]) + ' WHERE COD_PRODUTO = ' + mmMalaIDPRODUTO.AsString);
        dao.Exec_sql.ExecSQL;
        AtualizaProdutoWeb;
      except
        exit;
      end;
      fm_splash.ggProgress.AddProgress(1);
      fm_splash.Refresh;
      sleep(10);
      mmMala.next;
    end;
    fm_splash.Hide;
    dao.cn.commit;
  except
    dao.cn.Rollback;
  end;
  mmMala.First;
  try
    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
    dao.Exec_sql.SQL.Clear;
    dao.Exec_sql.SQL.Add('UPDATE CONFIGURACAO SET MALA_DIRETA_PRAZO = ' + QuotedStr(FormatDateTime('yyyy/mm/dd', EDValidoAte.Date)));
    dao.Exec_sql.ExecSQL;
    dao.cn.commit;
  except
    dao.cn.Rollback;
  end;
  CarregaDados(0);
end;

procedure TFmMalaDireta.AtualizaProdutoWeb;
var
  Consulta : TStringStream;
begin
  Consulta  := TStringStream.Create('');
  Consulta.WriteString('modo=produto');
  Consulta.WriteString('&id='+mmMalaIDPRODUTO.AsString);
  Consulta.WriteString('&produto='+mmMalaNOME_PRODUTO.AsString);
  Consulta.WriteString('&subcategoria='+mmMalaSUBCATEGORIA.AsString);
  Consulta.WriteString('&ord='+mmMalaORD_PAUTA.AsString);
  Consulta.WriteString('&promocao=1');
  if mmMalaUNIDADE.AsString = 'PT' then
    Consulta.WriteString('&valor='+FormatFloat('R$ #,###,##0.00', mmMalaVALOR_PROMOCAO.Value / mmMalaQTD_EMBALAGEM.Value))
  else
    Consulta.WriteString('&valor='+FormatFloat('R$ #,###,##0.00', mmMalaVALOR_PROMOCAO.Value));

  fmfun.AtualizarSite(Consulta);
  Consulta.Free;
end;

procedure TFmMalaDireta.btImprimirClick(Sender: TObject);
begin
  ImprimirMalaDireta(false);
end;

procedure TFmMalaDireta.FormShow(Sender: TObject);
begin
  dao.Geral1('select * from configuracao');
  relat_mala_direta := dao.Q1.FieldByName('mala_direta').AsString;
  CarregaDados(0);
end;

procedure TFmMalaDireta.sbAlterarClick(Sender: TObject);
begin
  if (edPrecoPromocao.value = 0) and (edDesconto.value = 0) and (edMargemLucro.Value = 0) then
  begin
    showmessage('Preço da Promoção, Desconto ou Margem de Lucro tem que ser preenchido!');
    edDesconto.SetFocus;
    exit;
  end;

  if rgtipo.ItemIndex = 0 then
  begin
    mmProdutos.Edit;

    if (edDesconto.value > 0) then
      edPrecoPromocao.Value := mmProdutosPRECO_VENDA.VALUE - (mmProdutosPRECO_VENDA.VALUE * (edDesconto.Value / 100));

    if (edMargemLucro.value > 0) then
    begin
      edPrecoPromocao.Value := mmProdutosCUSTO_TOTAL.VALUE * (1 + (edMargemLucro.Value / 100));
      mmProdutosMARGEM_LUCRO.Value := edMargemLucro.value;
    end
    else
      mmProdutosMARGEM_LUCRO.Value := ((mmProdutosVALOR_PROMOCAO.Value - mmProdutosCUSTO_TOTAL.Value) / mmProdutosVALOR_PROMOCAO.Value) * 100;

    mmProdutosDESCONTO.Value := edDesconto.Value;
    mmProdutosVALOR_PROMOCAO.Value := edPrecoPromocao.Value;

    mmProdutos.Post;
  end
  else
  begin
    mmMala.Edit;
    if (edDesconto.value > 0) then
      edPrecoPromocao.Value := mmMalaPRECO_VENDA.VALUE - (mmMalaPRECO_VENDA.VALUE * (edDesconto.Value / 100));

    if (edMargemLucro.value > 0) then
    begin
      edPrecoPromocao.Value := mmMalaCUSTO_TOTAL.VALUE * (1 + (edMargemLucro.Value / 100));
      mmMalaMARGEM_LUCRO.Value := edMargemLucro.value;
    end
    else
      mmMalaMARGEM_LUCRO.Value := ((mmMalaVALOR_PROMOCAO.Value - mmMalaCUSTO_TOTAL.Value) / mmMalaVALOR_PROMOCAO.Value) * 100;

    mmMalaDESCONTO.Value := edDesconto.Value;
    mmMalaVALOR_PROMOCAO.Value := edPrecoPromocao.Value;

    mmMala.Post;
  end;
end;

procedure TFmMalaDireta.sbFornecedorClick(Sender: TObject);
begin
  edFornecedor.Clear;
end;

procedure TFmMalaDireta.fR_RELATORIOGetValue(const VarName: string;
  var Value: Variant);
begin
  dao.Geral2('select mala_direta_prazo from CONFIGURACAO ');
  if VarName = 'data_validade' then
    value := formatdatetime('dd" de "mmmm" de "yyyy', edMalaDiretaData.date);

  if VarName = 'empresa' then
    value := nom_empresa;
end;

procedure TFmMalaDireta.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TFmMalaDireta.btnSalvarClick(Sender: TObject);
var
  promocao, liquidacao: string;
begin
  if mmMala.IsEmpty then
  begin
    showmessage('Mala Direta não pode ser gravada se estiver vazia!');
    exit;
  end;

  if EDValidoAte.Date = 0 then
  begin
    showmessage('Prazo da Promoção tem que ser preenchida!');
    EDValidoAte.SetFocus;
    exit;
  end;

  mmMala.First;

  dao.Geral2('SELECT ID as promocao FROM PROMOCAO where DATA_VALIDA_ATE = ' + quotedstr(formatdatetime('dd.mm.yyyy', EDValidoAte.Date)));

  if ckLiquidacao.Checked then liquidacao := 'S' else liquidacao := 'N';

  if dao.Q2.IsEmpty then
  begin
    dao.Geral1('SELECT nextval(''gen_promocao'') as promocao FROM configuracao');

    promocao := dao.Q1.fieldbyname('promocao').AsString;
    try
      if not dao.cn.InTransaction then
        dao.cn.StartTransaction;
      dao.Exec_sql.SQL.Clear;
      dao.Exec_sql.SQL.Add('INSERT INTO PROMOCAO (ID, DATA_VALIDA_ATE, LIQUIDACAO) VALUES (' + promocao + ', ' + quotedstr(formatdatetime('dd.mm.yyyy', EDValidoAte.Date)) +', '+quotedstr(liquidacao)+')');
      dao.Exec_sql.ExecSQL;
      dao.cn.commit;
    except
      dao.cn.Rollback;
    end;
  end
  else begin
    promocao := dao.Q2.fieldbyname('promocao').AsString;

    try
      if not dao.cn.InTransaction then
        dao.cn.StartTransaction;
      dao.Exec_sql.SQL.Clear;
      dao.Exec_sql.SQL.Add('UPDATE PROMOCAO set LIQUIDACAO = '+QUOTEDSTR(LIQUIDACAO)+' WHERE ID = '+promocao);
      dao.Exec_sql.ExecSQL;
      dao.cn.commit;
    except
      dao.cn.Rollback;
    end;

  end;
  try
    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
    dao.Exec_sql.SQL.Clear;
    dao.Exec_sql.SQL.Add('DELETE FROM PROMOCAO_ITEM WHERE PROMOCAO_ID= ' + promocao);
    dao.Exec_sql.ExecSQL;
    dao.cn.commit;
  except
    dao.cn.Rollback;
  end;

  try
    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
    while not mmMala.eof do
    begin
      try
        dao.Exec_sql.SQL.Clear;
        dao.Exec_sql.SQL.Add('INSERT INTO PROMOCAO_ITEM (PROMOCAO_ID, COD_PRODUTO, PRECO_PROMOCAO) ' +
          ' VALUES (' + promocao + ',' + mmMalaIDPRODUTO.AsString + ',' + FMFUN.BuscaTroca(mmMalaVALOR_PROMOCAO.AsString, ',', '.') + ')');
        dao.Exec_sql.ExecSQL;
      except
        exit;
      end;
      mmMala.next;
    end;
    dao.cn.commit;
  except
    dao.cn.Rollback;
  end;

  mmMala.First;
  edMalaDiretaData.Date := EDValidoAte.Date;
  CarregaDados(0);
end;

procedure TFmMalaDireta.sbAltTodosClick(Sender: TObject);
begin
  if (edPrecoPromocao.value = 0) and (edDesconto.value = 0) and (edMargemLucro.Value = 0) then
  begin
    showmessage('Preço da Promoção, Desconto ou Margem de Lucro tem que ser preenchido!');
    edDesconto.SetFocus;
    exit;
  end;

  if MessageDlg('Esse processo alterará todos os Itens. Confirmar?', mtConfirmation, [mbYes, mbno], 0) = mrno then
    exit;

  if rgtipo.ItemIndex = 0 then
  begin
    mmProdutos.First;
    while not mmProdutos.Eof do
    begin
      mmProdutos.Edit;
      if (edDesconto.value > 0) then
        edPrecoPromocao.Value := mmProdutosPRECO_VENDA.VALUE - (mmProdutosPRECO_VENDA.VALUE * (edDesconto.Value / 100));

      if (edMargemLucro.value > 0) then
      begin
        edPrecoPromocao.Value := mmProdutosCUSTO_TOTAL.VALUE * (1 + (edMargemLucro.Value / 100));
        mmProdutosMARGEM_LUCRO.Value := edMargemLucro.value;
      end
      else
        mmProdutosMARGEM_LUCRO.Value := ((mmProdutosVALOR_PROMOCAO.Value - mmProdutosCUSTO_TOTAL.Value) / mmProdutosVALOR_PROMOCAO.Value) * 100;

      mmProdutosDESCONTO.Value := edDesconto.Value;
      mmProdutosVALOR_PROMOCAO.Value := edPrecoPromocao.Value;


      mmProdutos.Post;
      mmProdutos.Next;
    end;
    mmProdutos.First;
  end
  else
  begin
    mmMala.First;
    while not mmMala.Eof do
    begin
      mmMala.Edit;
      if (edDesconto.value > 0) then
        edPrecoPromocao.Value := mmMalaPRECO_VENDA.VALUE - (mmMalaPRECO_VENDA.VALUE * (edDesconto.Value / 100));

      if (edMargemLucro.value > 0) then
      begin
        edPrecoPromocao.Value := mmMalaCUSTO_TOTAL.VALUE * (1 + (edMargemLucro.Value / 100));
        mmMalaMARGEM_LUCRO.Value := edMargemLucro.value;
      end
      else
        mmMalaMARGEM_LUCRO.Value := ((mmMalaVALOR_PROMOCAO.Value - mmMalaCUSTO_TOTAL.Value) / mmMalaVALOR_PROMOCAO.Value) * 100;


      mmMalaDESCONTO.Value := edDesconto.Value;
      mmMalaVALOR_PROMOCAO.Value := edPrecoPromocao.Value;

      mmMala.Post;
      mmMala.Next;
    end;
    mmMala.First;
  end;
end;

procedure TFmMalaDireta.sbInserirTodosClick(Sender: TObject);
begin
  if MessageDlg('Esse processo moverá todos os Itens para a Mala Direta. Confirmar?', mtConfirmation, [mbYes, mbno], 0) = mrno then
    exit;

  mmProdutos.First;
  while not mmProdutos.Eof do
  begin
    mmMala.Append;
    mmMalaIDPRODUTO.Value := mmProdutosID_PRODUTO.value;
    mmMalaQTD_EMBALAGEM.Value := mmProdutosQTD_EMBALAGEM.Value;
    mmMalaNOME_PRODUTO.Value := mmProdutosNOME_PRODUTO.Value;
    mmMalaUNIDADE.Value := mmProdutosUNIDADE.Value;
    mmMalaVALOR_PROMOCAO.Value := mmProdutosVALOR_PROMOCAO.Value;
    mmMalaCUSTO_TOTAL.Value := mmProdutosCUSTO_TOTAL.Value;
    mmMalaACRESCIMO.Value := mmProdutosACRESCIMO.Value;
    mmMalaSUBCATEGORIA.Value := mmProdutosSUBCATEGORIA.Value;
    mmMalaORD_PAUTA.Value := mmProdutosORD_PAUTA.Value;
    mmMalaDESCONTO.Value := mmProdutosDESCONTO.Value;
    mmMalaPRECO_VENDA.Value := mmProdutosPRECO_VENDA.Value;

    mmMala.Post;
    mmProdutos.Next;
  end;
  mmProdutos.First;
  mmProdutos.EmptyTable;

end;

procedure TFmMalaDireta.sbInserirClick(Sender: TObject);
begin
  mmMala.Append;
  mmMalaIDPRODUTO.Value := mmProdutosID_PRODUTO.value;
  mmMalaQTD_EMBALAGEM.Value := mmProdutosQTD_EMBALAGEM.Value;
  mmMalaNOME_PRODUTO.Value := mmProdutosNOME_PRODUTO.Value;
  mmMalaUNIDADE.Value := mmProdutosUNIDADE.Value;
  mmMalaVALOR_PROMOCAO.Value := mmProdutosVALOR_PROMOCAO.Value;
  mmMalaCUSTO_TOTAL.Value := mmProdutosCUSTO_TOTAL.Value;
  mmMalaACRESCIMO.Value := mmProdutosACRESCIMO.Value;
  mmMalaSUBCATEGORIA.Value := mmProdutosSUBCATEGORIA.Value;
  mmMalaORD_PAUTA.Value := mmProdutosORD_PAUTA.Value;
  mmMalaDESCONTO.Value := mmProdutosDESCONTO.Value;
  mmMalaPRECO_VENDA.Value := mmProdutosPRECO_VENDA.Value;
  mmMala.Post;
  mmProdutos.Delete;
end;

procedure TFmMalaDireta.sbDeletarClick(Sender: TObject);
begin
  mmProdutos.Append;
  mmProdutosID_PRODUTO.value := mmMalaIDPRODUTO.Value;
  mmProdutosQTD_EMBALAGEM.Value := mmMalaQTD_EMBALAGEM.Value;
  mmProdutosNOME_PRODUTO.Value := mmMalaNOME_PRODUTO.Value;
  mmProdutosUNIDADE.Value := mmMalaUNIDADE.Value;
  mmProdutosACRESCIMO.Value := mmMalaACRESCIMO.Value;
  mmProdutosCUSTO_TOTAL.Value := mmMalaCUSTO_TOTAL.Value;
  mmProdutosVALOR_PROMOCAO.Value := mmMalaVALOR_PROMOCAO.Value;
  mmProdutosSUBCATEGORIA.Value := mmMalaSUBCATEGORIA.Value;
  mmProdutosORD_PAUTA.Value := mmMalaORD_PAUTA.Value;
  mmProdutosDESCONTO.Value := mmMalaDESCONTO.Value;
  mmProdutosPRECO_VENDA.Value := mmMalaPRECO_VENDA.Value;

  mmProdutos.post;
  mmMala.Delete;
end;

procedure TFmMalaDireta.SbDeletarTodosClick(Sender: TObject);
begin
  if MessageDlg('Esse processo moverá todos os Itens para fora da Mala Direta. Confirmar?', mtConfirmation, [mbYes, mbno], 0) = mrno then
    exit;

  mmMala.First;
  while not mmMala.Eof do
  begin
    mmProdutos.Append;
    mmProdutosID_PRODUTO.value := mmMalaIDPRODUTO.Value;
    mmProdutosQTD_EMBALAGEM.Value := mmMalaQTD_EMBALAGEM.Value;
    mmProdutosNOME_PRODUTO.Value := mmMalaNOME_PRODUTO.Value;
    mmProdutosUNIDADE.Value := mmMalaUNIDADE.Value;
    mmProdutosVALOR_PROMOCAO.Value := mmMalaVALOR_PROMOCAO.Value;
    mmProdutosACRESCIMO.Value := mmMalaACRESCIMO.Value;
    mmProdutosCUSTO_TOTAL.Value := mmMalaCUSTO_TOTAL.Value;
    mmProdutosSUBCATEGORIA.Value := mmMalaSUBCATEGORIA.Value;
    mmProdutosORD_PAUTA.Value := mmMalaORD_PAUTA.Value;
    mmProdutosDESCONTO.Value := mmMalaDESCONTO.Value;
    mmProdutosPRECO_VENDA.Value := mmMalaPRECO_VENDA.Value;
    mmProdutos.post;
    mmMala.Next;
  end;
  mmMala.First;
  mmMala.EmptyTable;
end;

procedure TFmMalaDireta.edCodProdutoChange(Sender: TObject);
begin
  if edCodProduto.Text <> '' then
  begin
    if rgTipo.ItemIndex = 0 then
      mmProdutos.Locate('ID_PRODUTO', edCodProduto.Text, [loPartialKey])
    else
      mmMala.Locate('IDPRODUTO', edCodProduto.Text, [loPartialKey]);
  end
end;

procedure TFmMalaDireta.edNomProdutoChange(Sender: TObject);
begin
  if edNomProduto.Text <> '' then
  begin
    if rgTipo.ItemIndex = 0 then
      mmProdutos.Locate('NOME_PRODUTO', edNomProduto.Text, [loPartialKey])
    else
      mmMala.Locate('NOME_PRODUTO', edNomProduto.Text, [loPartialKey]);
  end;
end;

procedure TFmMalaDireta.sbEmailClick(Sender: TObject);
begin
  if EDValidoAte.Date = 0 then
  begin
    showmessage('Prazo da Promoção tem que ser preenchida!');
    EDValidoAte.SetFocus;
    exit;
  end;

  if MessageDlg('Enviar SMS e Email de Aviso aos Representantes?', mtConfirmation, [mbYes, mbno], 0) = mrYes then
  begin
    ImprimirMalaDireta(true);

    Application.CreateForm(Tfm_aviso_representantes, fm_aviso_representantes);
    fm_aviso_representantes.Assunto_Aviso := 'Aviso - Mala Direta.';
    fm_aviso_representantes.Texto_Aviso := 'Mala Direta com validade até ' + FormatDateTime('dd/mm/yyyy', EDValidoAte.Date) + ' disponível.' + #13;
    fm_aviso_representantes.Anexo := 'MalaDireta_' + FormatDateTime('dd_mm_yyyy', EDValidoAte.Date) + '.pdf';
    fm_aviso_representantes.ShowModal;
  end;
end;

procedure TFmMalaDireta.ImprimirMalaDireta(pdf: boolean);
var
  cmd, where, conexao, path: string;
  oExportfilter: TfrxCustomExportFilter;
begin
  path := ExtractFilePath(Application.ExeName);

  if trim(edProduto.Text) <> '' then
    where := where + fmfun.cmdAux('p.cod_produto', edproduto.Text);

  if trim(edProdutoDesc.Text) <> '' then
    where := where + ' AND P.NOM_PRODUTO LIKE ''%' + edProdutoDesc.Text + '%''';

  if trim(edGrupo.Text) <> '' then
    where := where + fmfun.cmdAux('p.cod_grupo', edgrupo.Text);

  if trim(edFornecedor.Text) <> '' then
    where := where + fmfun.cmdAux('p.fornecedor_principal', edFornecedor.Text);

  if cbPromocao.Checked then
    where := where + ' AND P.PROMOCAO = ''S''';

  cmd := ' select TRIM(ct.categoria) AS CATEGORIA, p.COD_PRODUTO, p.unidade, s.id, M.NOM_MARCA AS MARCA, trim(case when p.unidade = ''PT'' and p.qtd_embalagem > 1 then p.Nom_produto||''**'' else p.NOM_PRODUTO end) Nom_produto, ' +
    ' case when p.unidade = ''PT'' and p.qtd_embalagem > 1 then  CAST(pi.preco_promocao/p.qtd_embalagem AS NUMERIC(15,2)) else pi.preco_promocao end AS PRECO_PROMOCAO, ' +
    ' case when p.PROMOCAO_PACOTE = ''S'' then cast(p.QTD_EMBALAGEM as integer)||'' ''||p.UNIDADE else '''' end as pacote, pr.liquidacao, ' +
    ' s.IMAGEM, s.imagem_bd, trim(s.subcategoria) as subcategoria, (select count(*) from produto p1 where p1.subcategoria = p.subcategoria and p1.promocao = ''S'') as ordem ' +
    ' from produto p inner join PROMOCAO_ITEM PI on (PI.COD_PRODUTO = P.COD_PRODUTO) INNER JOIN PROMOCAO PR ON (PR.ID = PI.PROMOCAO_ID) ' +
    ' Inner join subcategoria s on (p.SUBCATEGORIA = s.ID) inner join categoria ct on ct.id = s.categoria INNER JOIN MARCAS M ON M.ID = P.ID_MARCA where pr.data_valida_ate =' + QUOTEDSTR(formatdatetime('dd/mm/yyyy', edMalaDiretaData.Date)) + where +
    ' order by ct.categoria, subcategoria, ordem, ord_pauta, nom_produto ';

  with dm.q_mala_direta1 do
  begin
    close;
    sql.Clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_mala_direta1.RecordCount < 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not (fr_relatorio.LoadFromFile(path + 'Relatorios\'+relat_mala_direta+'.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;

  if PDF then
  begin
    fr_relatorio.PrepareReport(True);
    oExportfilter := TfrxCustomExportFilter(frxPDFExport1);
    oExportFilter.ShowDialog := False;
    oExportFilter.FileName := 'MalaDireta_' + FormatDateTime('dd_mm_yyyy', edMalaDiretaData.Date) + '.pdf';
    fr_relatorio.Export(oExportFilter);
  end
  else
    fr_relatorio.ShowReport;

end;


procedure TFmMalaDireta.btImpPromoClick(Sender: TObject);
var
  cmd, path: string;
begin
  path := ExtractFilePath(Application.ExeName);
  cmd := 'select pro.cod_produto, pro.nom_produto, pro.peso, pro.grade, pro.qtd_estoque, pro.cod_grupo, g.NOM_GRUPO, f.COD_FORNECEDOR, f.RAZAO_SOCIAL, '
    +
    ' pro.custo, pro.IMPOSTOS, pro.ipi, pro.OUTROS, pro.geral, pro.LUCRO, pro.custo_total, ' +
    ' cast(pro.custo_total + (pro.custo_total * (pro.lucro/100)) as numeric(15,2)) AS Vlr_calc, ' +
    ' cast( pro.preco_venda as numeric(15,2)) as preco_venda, ' +
    ' cast( pro.preco_promocao as numeric(15,2)) as preco_promocao, ' +
    ' f.razao_social, f.fantasia ' +
    ' from produto pro ' +
    ' inner join grupo g on (g.COD_GRUPO = pro.COD_GRUPO) ' +
    ' left join fornecedor f on f.cod_fornecedor = pro.fornecedor_principal ' +
    'where pro.promocao = ''S'' ';

  with dm.q_produto_custo do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if not (fr_relatorio.LoadFromFile(path + 'Relatorios\produto_promocao.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 +
      'Avise o Suporte');
    exit;
  end;
  fr_relatorio.ShowReport;
end;

end.

