unit Un_pedido_simplificado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBGrids, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, sComboEdit,
  Vcl.Grids, Vcl.Mask, sMaskEdit, sCustomComboEdit, sLabel, Vcl.ComCtrls,
  sRichEdit, RdPrint, RxMemDS;

type
  TFr_pedido_simplificado = class(TForm)
    pnTopo: TPanel;
    lbNumDoc: TLabel;
    Prnumdoc: TEdit;
    lbRepresentante: TLabel;
    lbCliente: TLabel;
    Prcod_cliente: TsComboEdit;
    LbNomCliente: TLabel;
    LbNomRepresentante: TLabel;
    lbFop: TLabel;
    Prcod_fop: TsComboEdit;
    LbNomFop: TLabel;
    lbPrazo: TLabel;
    Prcod_prazo_pgto: TsComboEdit;
    Prorcamento: TComboBox;
    LbNomPrazo: TLabel;
    Lb_orcamento: TLabel;
    dbgItens: TDBGrid;
    dsItens: TDataSource;
    qItens: TFDQuery;
    mmItens: TRxMemoryData;
    qPedido: TFDQuery;
    q_foto: TFDQuery;
    Foto: TImage;
    pnItem: TPanel;
    lbCodProduto: TLabel;
    lbQtd: TLabel;
    lbPreco: TLabel;
    lbDesc: TLabel;
    MeCodProduto: TsComboEdit;
    MeQtd: TEdit;
    MePreco: TEdit;
    MeDesconto: TEdit;
    LbNomProduto: TLabel;
    LbSubTotalItem: TLabel;
    LbTotalLiquidoPedido: TLabel;
    LbStatusPedido: TLabel;
    btInsItem: TButton;
    btAltItem: TButton;
    btGraItem: TButton;
    btExcItem: TButton;
    btCanItem: TButton;
    pnRod: TPanel;
    btCarregar: TButton;
    btNovo: TButton;
    btAlterar: TButton;
    btGravar: TButton;
    btCancelar: TButton;
    btImprimir: TButton;
    btStatus: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Probservacoes_pedido: TsRichEdit;
    lbObs: TsLabel;
    qItenscod_produto: TIntegerField;
    qItensnom_produto: TStringField;
    qItenspreco_base: TFMTBCDField;
    qItenspreco: TFMTBCDField;
    qItensqtd: TFMTBCDField;
    qItensdesconto: TFMTBCDField;
    qItenssub_total: TFMTBCDField;
    mmItenscod_produto: TIntegerField;
    mmItensnom_produto: TStringField;
    mmItenspreco_base: TFloatField;
    mmItenspreco: TFloatField;
    mmItensqtd: TFloatField;
    mmItensdesconto: TFloatField;
    mmItenssub_total: TFloatField;
    Prcod_representante: TsComboEdit;
    mmItenssub_total_bruto: TFloatField;
    pngeral: TPanel;
    pnGeralRod: TPanel;
    LbDescontoPedido: TLabel;
    LbComissaoPerc: TLabel;
    LbComissaoValor: TLabel;
    qItenssub_total_bruto: TFMTBCDField;
    lbSupervisor: TLabel;
    LbNomSupervisor: TLabel;
    Prcod_supervisor: TsComboEdit;
    procedure FormCreate(Sender: TObject);
    procedure btCarregarClick(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btInsItemClick(Sender: TObject);
    procedure btGraItemClick(Sender: TObject);
    procedure btAltItemClick(Sender: TObject);
    procedure btExcItemClick(Sender: TObject);
    procedure btCanItemClick(Sender: TObject);
    procedure dbgItensCellClick(Column: TColumn);
    procedure MeCodProdutoExit(Sender: TObject);
    procedure MeCodProdutoButtonClick(Sender: TObject);
    procedure Prcod_representanteButtonClick(Sender: TObject);
    procedure Prcod_clienteButtonClick(Sender: TObject);
    procedure Prcod_supervisorButtonClick(Sender: TObject);
    procedure Prcod_fopButtonClick(Sender: TObject);
    procedure Prcod_prazo_pgtoButtonClick(Sender: TObject);
    procedure MeQtdChange(Sender: TObject);
    procedure Prcod_clienteExit(Sender: TObject);
    procedure Prcod_supervisorExit(Sender: TObject);
    procedure Prcod_representanteExit(Sender: TObject);
    procedure Prcod_fopExit(Sender: TObject);
    procedure Prcod_prazo_pgtoExit(Sender: TObject);
    procedure qItensAfterScroll(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btImprimirClick(Sender: TObject);
    procedure btStatusClick(Sender: TObject);
    procedure MePrecoExit(Sender: TObject);
    procedure MePrecoChange(Sender: TObject);
    procedure MeDescontoExit(Sender: TObject);
    procedure ItemEditEnter(Sender: TObject);
    procedure MeQtdEnter(Sender: TObject);
    procedure MePrecoEnter(Sender: TObject);
    procedure MeDescontoEnter(Sender: TObject);
  private
    FEmEdicao: Boolean;
    FNovo: Boolean;
    FCampoPesquisado: string;
    FDadoPesquisado: string;
    FBuscaQualquerPosicao: Boolean;
    FFaturado: Boolean;
    FItemEmEdicao: Boolean;
    FItemAlterando: Boolean;
    FProcessoIdAtual: string;
    FCodFatAtual: string;
    FStatusAtual: string;
    FPrecoVendaProduto: Double;
    FTotalBruto: Double;
    FTotalLiquido: Double;
    FDesconto: Double;
    procedure LimparTela;
    procedure LimparDigitacaoItem;
    procedure CarregarItemSelecionado;
    procedure CarregarPedido;
    procedure CarregarItens;
    procedure PopularMemItens;
    procedure ConfigurarEdicaoPrefixo(const APrefixo: string; AHabilitar: Boolean);
    procedure HabilitarEdicao(AValor: Boolean);
    procedure HabilitarEdicaoItem(AValor: Boolean);
    procedure AtualizarBotoesItem;
    procedure AtualizarBotoes;
    procedure CarregarProdutoItem;
    function NumeroAtual: string;
    function ItemAtualCodProduto: string;
    function ItensVazios: Boolean;
    function BuscarCodigoLocalizar(const APesquisa, ATitulo: string): string;
    procedure CarregarNomeCliente;
    procedure CarregarNomeRepresentante;
    procedure CarregarNomeSupervisor;
    procedure CarregarNomeFop;
    procedure CarregarNomePrazo;
    procedure CarregaFoto(const AProduto: string);
    procedure AtualizarSubtotalItem;
    procedure AtualizarTotalLiquidoPedido;
    procedure AtualizarResumoPedido;
    procedure ImprimirMatricial;
    procedure GravarItem(AAlterar: Boolean);
    function ObterDescontoMaximoItem: Double;
    function ValidarDescontoItem(const ADesconto: Double): Boolean;
  public
    procedure CarregarPorNumDoc(const ANumDoc: string);
  end;

var
  Fr_pedido_simplificado: TFr_pedido_simplificado;

implementation

uses Un_dao, Un_localizar, UnPri, UnFun;

{$R *.dfm}

function ParseFloatFlex(const S: string): Double;
var
  F: TFormatSettings;
  V: string;
begin
  V := Trim(S);
  F := FormatSettings;
  Result := StrToFloatDef(V, 0, F);
  if Result = 0 then
  begin
    F.DecimalSeparator := '.';
    F.ThousandSeparator := ',';
    Result := StrToFloatDef(StringReplace(V, ',', '', [rfReplaceAll]), 0, F);
  end;
end;

function FmtQtd(const V: Double): string;
begin
  Result := FormatFloat('0.00', V);
end;

function FmtMoney(const V: Double): string;
begin
  Result := FormatFloat('#,##0.00', V);
end;

procedure TFr_pedido_simplificado.FormCreate(Sender: TObject);
begin
  qPedido.Connection := dao.CN;
  qItens.Connection := dao.CN;
  q_foto.Connection := dao.CN;
  FEmEdicao := False;
  FNovo := False;
  FCampoPesquisado := '';
  FDadoPesquisado := '';
  FBuscaQualquerPosicao := False;
  FFaturado := False;
  FItemEmEdicao := False;
  FItemAlterando := False;
  FProcessoIdAtual := '';
  FCodFatAtual := '';
  FStatusAtual := '-';
  FPrecoVendaProduto := 0;
  MeQtd.OnEnter := ItemEditEnter;
  MePreco.OnEnter := ItemEditEnter;
  MeDesconto.OnEnter := ItemEditEnter;
  HabilitarEdicao(False);
  LimparTela;
  AtualizarBotoes;
  LbTotalLiquidoPedido.Caption := 'Total Liquido: 0,00';
  LbSubTotalItem.Caption := '0,00';
  LbComissaoPerc.Caption := 'Comissao %: 0,00';
  LbComissaoValor.Caption := 'Comissao R$: 0,00';
  LbStatusPedido.Caption := 'Status: -';
  LbDescontoPedido.Caption := 'Desconto Pedido %: 0,00';
  Prorcamento.ItemIndex := 0;
end;

procedure TFr_pedido_simplificado.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    // se for, passa o foco para o próximo campo, zerando o valor da variável Key
      if (ActiveControl.Name = 'Probservacoes_pedido') then
        Exit;
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

function TFr_pedido_simplificado.NumeroAtual: string;
begin
  Result := Trim(Prnumdoc.Text);
end;

function TFr_pedido_simplificado.ItemAtualCodProduto: string;
begin
  Result := '';
  if Assigned(mmItens) and mmItens.Active and (not mmItens.IsEmpty) then
    Result := Trim(mmItens.FieldByName('cod_produto').AsString);
end;

function TFr_pedido_simplificado.ItensVazios: Boolean;
begin
  Result := (not Assigned(mmItens)) or (not mmItens.Active) or mmItens.IsEmpty;
end;


procedure TFr_pedido_simplificado.ConfigurarEdicaoPrefixo(const APrefixo: string; AHabilitar: Boolean);
var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
  begin
    if Copy(Components[I].Name, 1, Length(APrefixo)) <> APrefixo then
      Continue;
    if Components[I] is TsComboEdit then
      TsComboEdit(Components[I]).Enabled := AHabilitar
    else if Components[I] is TsRichEdit then
      TsRichEdit(Components[I]).Enabled := AHabilitar
    else if Components[I] is TEdit then
      TEdit(Components[I]).Enabled := AHabilitar;
  end;
end;
procedure TFr_pedido_simplificado.HabilitarEdicaoItem(AValor: Boolean);
begin
  ConfigurarEdicaoPrefixo('Me', AValor);
end;
procedure TFr_pedido_simplificado.HabilitarEdicao(AValor: Boolean);
begin
  ConfigurarEdicaoPrefixo('Pr', AValor and (not FFaturado));
  HabilitarEdicaoItem(AValor and FItemEmEdicao and (not FFaturado));
  Prnumdoc.ReadOnly := not FNovo;
  Prnumdoc.Enabled := True;
  dbgItens.Enabled := Assigned(mmItens) and mmItens.Active and (not mmItens.IsEmpty);
  AtualizarBotoesItem;
end;
procedure TFr_pedido_simplificado.AtualizarBotoesItem;
var
  PodeOperarItens: Boolean;
begin
  PodeOperarItens := FEmEdicao and (not FFaturado);
  btInsItem.Enabled := PodeOperarItens and (not FItemEmEdicao);
  btGraItem.Enabled := PodeOperarItens and FItemEmEdicao;
  btAltItem.Enabled := PodeOperarItens and (not FItemEmEdicao) and (not ItensVazios);
  btExcItem.Enabled := PodeOperarItens and (not FItemEmEdicao) and (not ItensVazios);
  btCanItem.Enabled := PodeOperarItens and FItemEmEdicao;
end;
procedure TFr_pedido_simplificado.AtualizarBotoes;
begin
  btNovo.Enabled := not FEmEdicao;
  btAlterar.Enabled := (not FEmEdicao) and (NumeroAtual <> '') and (not FFaturado);
  btGravar.Enabled := FEmEdicao and (not FFaturado);
  btCancelar.Enabled := FEmEdicao;
  //btExcluir.Enabled := (not FEmEdicao) and (NumeroAtual <> '');
  btCarregar.Enabled := not FEmEdicao;
  btImprimir.Enabled := (not FEmEdicao) and (NumeroAtual <> '');
  btStatus.Enabled := (not FEmEdicao) and (NumeroAtual <> '') and (FCodFatAtual = '0') and ((FStatusAtual = '') or (FStatusAtual = '-' ) or SameText(FStatusAtual, 'À DIGITAR') or SameText(FStatusAtual, 'À CONFERIR') or SameText(FStatusAtual, 'À FATURAR'));
  HabilitarEdicao(FEmEdicao);
end;

procedure TFr_pedido_simplificado.LimparDigitacaoItem;
begin
  MeCodProduto.Clear;
  LbNomProduto.Caption := '';
  MeQtd.Text := '1';
  MePreco.Clear;
  MeDesconto.Text := '0';
  LbSubTotalItem.Caption := '0,00';
  Foto.Picture := nil;
end;

procedure TFr_pedido_simplificado.CarregarItemSelecionado;
begin
  if ItensVazios then
  begin
    LimparDigitacaoItem;
    Exit;
  end;
  MeCodProduto.Text := mmItens.FieldByName('cod_produto').AsString;
  LbNomProduto.Caption := mmItens.FieldByName('nom_produto').AsString;
  MeQtd.Text := mmItens.FieldByName('qtd').DisplayText;
  MePreco.Text := mmItens.FieldByName('preco').DisplayText;
  if mmItens.FindField('desconto') <> nil then
    MeDesconto.Text := mmItens.FieldByName('desconto').DisplayText
  else
    MeDesconto.Text := '0';
  AtualizarSubtotalItem;
  CarregaFoto(mmItens.FieldByName('cod_produto').AsString);
end;
procedure TFr_pedido_simplificado.LimparTela;
begin
  Prcod_cliente.Clear;
  Prcod_representante.Clear;
  Prcod_supervisor.Clear;
  Prcod_fop.Clear;
  Prcod_prazo_pgto.Clear;
  LbNomCliente.Caption := '';
  LbNomRepresentante.Caption := '';
  LbNomSupervisor.Caption := '';
  LbNomFop.Caption := '';
  LbNomPrazo.Caption := '';
  Prorcamento.ItemIndex := 0;
  LimparDigitacaoItem;
  if qItens.Active then
    qItens.Close;
  if Assigned(mmItens) and mmItens.Active then
    mmItens.EmptyTable;
  FFaturado := False;
  FItemEmEdicao := False;
  FItemAlterando := False;
  FProcessoIdAtual := '';
  FCodFatAtual := '';
  FStatusAtual := '-';
end;

procedure TFr_pedido_simplificado.ItemEditEnter(Sender: TObject);
begin
  if Sender is TEdit then
    TEdit(Sender).SelectAll;
end;

procedure TFr_pedido_simplificado.MeDescontoEnter(Sender: TObject);
begin
  MeDesconto.SelectAll;
end;

procedure TFr_pedido_simplificado.MeDescontoExit(Sender: TObject);
var
  Desc: Double;
begin
  Desc := ParseFloatFlex(MeDesconto.Text);
  if Desc < 0 then
    Desc := 0;
  if Desc > 100 then
    Desc := 100;

  ValidarDescontoItem(Desc);
  Desc := ParseFloatFlex(MeDesconto.Text);

  if FPrecoVendaProduto > 0 then
    MePreco.Text := FmtMoney(FPrecoVendaProduto * (1 - (Desc / 100)));

  AtualizarSubtotalItem;
end;
procedure TFr_pedido_simplificado.MePrecoChange(Sender: TObject);
begin
  AtualizarSubtotalItem;
end;

procedure TFr_pedido_simplificado.MePrecoEnter(Sender: TObject);
begin
  MePreco.SelectAll;
end;

procedure TFr_pedido_simplificado.MePrecoExit(Sender: TObject);
begin
  if FPrecoVendaProduto > 0 then if ParseFloatFlex(MePreco.Text) <= FPrecoVendaProduto then MeDesconto.Text := FmtQtd(100 - ((ParseFloatFlex(MePreco.Text) / FPrecoVendaProduto) * 100)) else MeDesconto.Text := '0';
  if not ValidarDescontoItem(ParseFloatFlex(MeDesconto.Text)) then
  begin
    if FPrecoVendaProduto > 0 then
      MePreco.Text := FmtMoney(FPrecoVendaProduto);
    MeDesconto.Text := '0';
    AtualizarSubtotalItem;
    MePreco.SetFocus;
    Exit;
  end;
  AtualizarSubtotalItem;
end;

procedure TFr_pedido_simplificado.btImprimirClick(Sender: TObject);
begin
  ImprimirMatricial;
end;

procedure TFr_pedido_simplificado.btStatusClick(Sender: TObject);
begin
  if Trim(NumeroAtual) = '' then
    Exit;
  if Trim(FProcessoIdAtual) = '' then
  begin
    dao.msg('Pedido sem processo definido.');
    Exit;
  end;
  if not dao.CN.InTransaction then
    dao.CN.StartTransaction;
  try
    FMFUN.AlterarProcessoPedido(FProcessoIdAtual, NumeroAtual);
    dao.CN.Commit;
  except
    if dao.CN.InTransaction then
      dao.CN.Rollback;
    raise;
  end;

  AtualizarResumoPedido;
  AtualizarBotoes;
end;


procedure TFr_pedido_simplificado.ImprimirMatricial;
var
  lh, cl, MTAMTOT, i, x, y, modelo_desconto: integer;
  mcr1, usuario, observacao: string;
  total_produtos, total_liquido: real;
  MLHCH: array of string;
  Zebrado : Boolean;

  procedure SetaPagina;
  begin
  {  if (FRPRI.RD.Impressora <> Grafico) and (lh > 28) then
    begin
      FRPRI.RD.novapagina;
      lh := 0;
    end;
}
    if (lh > 71) then
    begin
      FRPRI.RD.novapagina;
      lh := 0;
    end;
  end;

begin
  dao.Geral1('select a.NUMDOC, a.HORA, a.DTADOC, a.COD_CLIENTE, a.COD_USUARIO, ' +
             'a.COD_EMPRESA, a.FATURADO, a.CONSIGNACAO, a.ORCAMENTO, a.ENTREGUE, a.TOT_BRUTO, ' +
             'a.DESCONTO, a.TOT_LIQUIDO, a.PRAZO_PGTO, a.COD_FOP, a.NUM_CUPOM, a.TIPO_VENDA, ' +
             'a.QTD_PARCELAS, a.PONTO_USADO, a.USUARIO_DESFATUROU, a.COD_REPRESENTANTE, ' +
             'a.COD_PRAZO_PGTO, a.CUSTO_TOTAL, a.LUCRO_MEDIO, a.DTA_EMISSAO, a.DTA_SAIDA, ' +
             'a.EMPRESA_FATURAR, a.NF, a.OBSERVACOES_PEDIDO, a.OBSERVACOES_NOTA, a.COD_TRANSPORTADORA, ' +
             'a.TIPO_FRETE, a.VOLUME_NOTA, a.PESO_NOTA, a.COD_CARGA, a.VL_FRETE, a.CONTATO_FRETE, ' +
             'a.PED_IMPRESSO, a.DTA_VENCIMENTO_CONSIG, a.CANCELADO, a.CONTEM_AVARIA, a.CONTEM_ETIQUETA, ' +
             'a.MOTIVO_TROCA, a.NR_VENDA_ORIGINAL, a.PEDIDO, a.VENDA_ENVIADA, a.CREDITO_USADO, ' +
             'a.NR_PEDIDO_PALM, a.BOLETO_ANEXO, a.COD_FISCAL, a.VLR_COMISSAO, a.VLR_BC_ICMS, a.VLR_ICMS, ' +
             'a.VLR_ST, a.VLR_TOT_NF, a.VLR_BC_ICMS_ST, a.CHAVE_NFE, a.RECIBO_NFE, a.STATUS_NFE, ' +
             'a.MOTIVO_NFE, a.DIGEST_NFE, a.PROTOCOLO_NFE, a.DATA_REC_NFE, a.JUSTIF_CANC_NFE, ' +
             'a.COD_SUPERVISOR, a.COD_FORNECEDOR, a.NFE, a.VLR_IPI, a.PALM_NR_CONEXAO, ' +
             'COALESCE(A.NUMDOC_DESTINO, (SELECT B.NUMDOC FROM VENDAS1 b where b.NUMDOC_DESTINO = a.NUMDOC)) as PEDIDO_VINCULADO, ' +
             'a.SINCRONIZAR_PALM, a.NUMDOC_REF, a.FRETE_COMBINADO, a.DT_FRETE_COMBINADO, a.EMAIL_NFE, ' +
             'a.EMAIL_PEDIDO, a.PEDIDO_VENDEDOR, a.USUARIO_CHECOU_PEDIDO_VENDEDOR, a.CONTA_BOLETO, ' +
             'a.USUARIO_CHECOU_FRETE_COMBINADO, a.ABERTO_USUARIO, a.MAQUINA_USUARIO_ABERTO, VALORDESCONTOADIC, ' +
             'c.nom_cliente, c.nom_fantasia, c.cnpj, (select min(dtadoc) from vendas1 v1 where v1.COD_CLIENTE = c.COD_CLIENTE) as dta_cad, c.bairro, c.endereco, c.nr_endereco, ' +
             'c.cep, c.TIP_PESSOA, c.cpf, c.cnpj,c.rg, c.ie, c.telefone, c.fax, c.email, c.contato, C.CELULAR AS CELULAR_CLIENTE, c.operadora as operadora_cliente, ' +
             'r.nom_representante, s.nom_representante as supervisor, r.celular, r.operadora as operadora_rep, f.nom_fop, p.prazo, e.nom_empresa, a.ORCAMENTO, ' +
             't.nome, cd.nom_cidade, cd.uf, us.logusu, a.DESCONTO_GERAL, a.VLR_DESCONTO_GERAL, c.WHASTAPP from vendas1 a ' +
             'left join cliente c on c.cod_cliente = a.cod_cliente ' +
             'left join cidades cd on cd.cod_cidade= c.cod_cidade ' +
             'left join representante r on r.id = a.cod_representante ' +
             'left join representante s on s.id = a.cod_supervisor ' +
             'left join fop f on f.cod_fop = a.cod_fop ' +
             'left join prazo p on p.id = a.cod_prazo_pgto ' +
             'left join empresa e on e.cod_empresa = a.empresa_faturar ' +
             'left join transportadora t on t.cod_transportadora = a.cod_transportadora ' +
             'left join tbusu us on cast(us.codusu as INTEGER) = a.cod_usuario ' +
             'where numdoc=' + Prnumdoc.Text);

  FRPRI.RD.TamanhoQteColunas := 96;
  FRPRI.RD.TamanhoQteLinhas := 71;
  FRPRI.RD.TamanhoQteLPP := seis;
  FRPRI.RD.FonteTamanhoPadrao := S12cpp;

  FRPRI.RD.abrir; // Inicia a montagem do relatório...
  // for i:=1 to 2 do
  // begin
  lh := 13;
  // while not (dao.q1.eof) do
  // begin
  usuario := dao.q1.fieldbyname('logusu').AsString;

  if dao.q1.fieldbyname('ORCAMENTO').AsString = '1' then
    FRPRI.RD.ImpF(01, 42, 'ORÇAMENTO', [expandido, NEGRITO])
  else
    FRPRI.RD.ImpF(01, 42, 'PEDIDO', [expandido, NEGRITO]);

  FRPRI.RD.impC(02, 09, '-----------------------------------------------------------------------------------------------', [comp12, NEGRITO]);

  FRPRI.RD.impC(03, 02, 'Nº: ', [comp12, NEGRITO]);
  FRPRI.RD.ImpF(03, 08, inttostr(dao.q1.fieldbyname('numdoc').AsInteger), [comp12]); // DADOS DO CLIENTE

  if dao.q1.fieldbyname('dtadoc').Value <> null then
    FRPRI.RD.ImpF(03, 20, FormatDateTime('dd/mm/yyyy', dao.q1.fieldbyname('dtadoc').AsDateTime), [comp12]);

  FRPRI.RD.impC(03, 48, 'CLIENTE DESDE:', [comp12, NEGRITO]);
  if FormatDateTime('dd/mm/yyyy', dao.q1.fieldbyname('dta_cad').AsDateTime) <> '30/12/1899' then
    FRPRI.RD.ImpF(03, 55, FormatDateTime('dd/mm/yyyy', dao.q1.fieldbyname('dta_cad').AsDateTime), [comp12]);

  if FormatDateTime('dd/mm/yyyy', dao.q1.fieldbyname('dta_emissao').AsDateTime) <> '30/12/1899' then
    FRPRI.RD.ImpF(03, 86, FormatDateTime('dd/mm/yyyy', dao.q1.fieldbyname('dta_emissao').AsDateTime), [comp12]);

  FRPRI.RD.impC(05, 02, 'CODIGO:', [comp12, NEGRITO]);
  FRPRI.RD.ImpF(05, 10, dao.q1.fieldbyname('cod_cliente').AsString, [comp12]);

  FRPRI.RD.impC(05, 21, 'CLIENTE:', [comp12, NEGRITO]);
  FRPRI.RD.ImpF(05, 26, dao.q1.fieldbyname('nom_cliente').AsString + ' /' + copy(dao.q1.fieldbyname('nom_fantasia').AsString, 1, 40), [comp12]);

  FRPRI.RD.impC(06, 02, 'END:', [comp12, NEGRITO]);
  FRPRI.RD.ImpF(06, 07, dao.q1.fieldbyname('endereco').AsString + ', ' + dao.q1.fieldbyname('nr_endereco').AsString, [comp12]);

  FRPRI.RD.impC(06, 60, 'BAIRRO:', [comp12, NEGRITO]);
  FRPRI.RD.ImpF(06, 68, dao.q1.fieldbyname('bairro').AsString, [comp12]);

  FRPRI.RD.impC(07, 02, 'CEP:', [comp12, NEGRITO]);
  FRPRI.RD.ImpF(07, 06, dao.q1.fieldbyname('cep').AsString, [comp12]);

  FRPRI.RD.impC(07, 22, 'CIDADE:', [comp12, NEGRITO]);
  FRPRI.RD.ImpF(07, 27, dao.q1.fieldbyname('nom_cidade').AsString, [comp12]);

  FRPRI.RD.impC(07, 59, 'UF:', [comp12, NEGRITO]);
  FRPRI.RD.ImpF(07, 62, dao.q1.fieldbyname('uf').AsString, [comp12]);

  FRPRI.RD.impC(08, 02, 'CNPJ\CPF:', [comp12, NEGRITO]);

  if (dao.q1.fieldbyname('TIP_PESSOA').AsString = 'J') then
    FRPRI.RD.ImpF(08, 11, dao.q1.fieldbyname('cnpj').AsString, [comp12])
  else
    FRPRI.RD.ImpF(08, 11, dao.q1.fieldbyname('cpf').AsString, [comp12]);

  FRPRI.RD.impC(08, 40, 'I.E\RG:', [comp12, NEGRITO]);
  if (dao.q1.fieldbyname('TIP_PESSOA').AsString = 'J') then
    FRPRI.RD.ImpF(08, 45, dao.q1.fieldbyname('ie').AsString, [comp12])
  else
    FRPRI.RD.ImpF(08, 45, dao.q1.fieldbyname('rg').AsString, [comp12]);

  FRPRI.RD.impC(09, 02, 'FONE:', [comp12, NEGRITO]);
  FRPRI.RD.ImpF(09, 06, dao.q1.fieldbyname('telefone').AsString, [comp12]);

  FRPRI.RD.impC(09, 25, 'CELULAR:', [comp12, NEGRITO]);
  FRPRI.RD.ImpF(09, 29, dao.q1.fieldbyname('CELULAR_CLIENTE').AsString + '\' + dao.q1.fieldbyname('operadora_cliente').AsString, [comp12]);

  FRPRI.RD.impC(09, 50, 'WhatsApp:', [comp12, NEGRITO]);
  FRPRI.RD.ImpF(09, 55, dao.q1.fieldbyname('WHASTAPP').AsString, [comp12]);

  FRPRI.RD.impC(09, 75, 'CONTATO:', [comp12, NEGRITO]);
  FRPRI.RD.ImpF(09, 80, dao.q1.fieldbyname('contato').AsString, [comp12]);
  // if DMVEN.QUPED1.FIELDBYNAME('comcli').value<>null then
  // frpri.rd.impf(07,70,DMVEN.QUPED1.FieldByName('comcli').value,[comp12]);

  FRPRI.RD.impC(10, 02, 'E-MAIL:', [comp12, NEGRITO]);
  FRPRI.RD.ImpF(10, 12, dao.q1.fieldbyname('email').AsString, [comp12]);

  FRPRI.RD.impC(11, 02, 'REPRESENTANTE:', [comp12, NEGRITO]);
  FRPRI.RD.ImpF(11, 16, dao.q1.fieldbyname('nom_representante').AsString + '-' + dao.q1.fieldbyname('celular').AsString + '\' + dao.q1.fieldbyname('operadora_rep').AsString, [comp12]);

  FRPRI.RD.impC(11, 65, 'SUPERVISOR:', [comp12, NEGRITO]);
  FRPRI.RD.ImpF(11, 72, dao.q1.fieldbyname('supervisor').AsString, [comp12]);

  FRPRI.RD.impC(12, 09, '----------------------------------------------------------------------------------------------', [comp12, NEGRITO]);

  FRPRI.RD.impC(13, 02, 'COD \ PRODUTO                                             QTD  UNI-QTD  VLR.UNI        TOT.LIQ', [comp12, NEGRITO]);
  // 6                                         40    46        61   66       75       83
  // case when p.id_marca is null then p.nom_produto else p.nom_produto||'' MARCA: ''||m.nom_marca end as nom_produto,
  dao.Geral2('select a.ID, a.NUMDOC, a.DTADOC, a.COD_PRODUTO, a.COD_CLIENTE, a.COD_REPRESENTANTE, a.ID_COR, ' + 'a.ID_TAMANHO, a.QTD, a.QTD_DEVOLVIDA, a.DEVOLVIDO, a.PRECO, a.SUB_TOTAL, a.DESCONTO, a.VOLUME, ' + 'a.COD_EMPRESA, a.NR_PEDIDO_PALM, a.PRECO_BRUTO, a.SUB_TOTAL_BRUTO, a.VLR_COMISSAO, a.TROCA, ' + 'a.COD_FISCAL_ITEM, a.ICMS_ITEM, a.VLR_ICMS_ST, a.VLR_BC_ST, a.VLR_ICMS_ITEM, a.NCM, a.VLR_BC, ' + 'a.IPI_ITEM, a.VLR_IPI_ITEM, a.VLR_AGR_ITEM, a.TRIB_ICMS, a.CESTA_BASICA, a.COD_SUPERVISOR, ' +
    'a.QTD_EMBALAGEM, a.PRECO_CUSTO, a.PERC_COMISSAO, a.PROMOCAO, a.DESCONTO_MAX, ' + 'c.cor, t.tamanho, p.preco_venda, case when cf.MOSTRA_MARCA_NO_PEDIDO = ''S'' then case when p.id_marca is null then p.nom_produto else p.nom_produto||'' MARCA: ''||m.nom_marca end else p.NOM_PRODUTO end as nom_produto, ' + 'p.cod_prateleira,p.unidade, p.qtd_embalagem from CONFIGURACAO cf, vendas2 a ' + 'left join produto p on p.cod_produto = a.cod_produto ' + 'left join marcas m on m.id = p.id_marca ' + 'left join cores c on c.id = a.id_cor ' + 'left join tamanho t on t.id = a.id_tamanho ' + 'where numdoc = ' + QuotedStr(dao.q1.fieldbyname('numdoc').AsString) + ' order by ord_pauta ');

  dao.q2.First;
  total_produtos := 0;
  Zebrado := False;
  while not (dao.q2.Eof) do
  begin

    SetaPagina;

    lh := lh + 1;
    if Zebrado then
    begin
      FRPRI.RD.ImpF(lh, 01, dao.q2.fieldbyname('cod_produto').AsString + '\' + copy(dao.q2.fieldbyname('nom_produto').AsString, 1, 50), [comp12, NEGRITO]);
      FRPRI.RD.impval(lh, 52, '###,##0.00', dao.q2.fieldbyname('qtd').AsFloat, [comp12, NEGRITO]);
      FRPRI.RD.ImpF(lh, 64, dao.q2.fieldbyname('unidade').AsString, [comp12, NEGRITO]);
      FRPRI.RD.ImpF(lh, 67, formatfloat('0', dao.q2.fieldbyname('qtd_embalagem').AsFloat) + '/' + formatfloat('0', dao.q2.fieldbyname('volume').AsFloat), [comp12, NEGRITO]);
      if (dao.q2.fieldbyname('qtd_embalagem').AsFloat <> 0) and (dao.q2.fieldbyname('volume').AsFloat <> 0) then
        FRPRI.RD.ImpF(lh, 67, formatfloat('0', dao.q2.fieldbyname('qtd_embalagem').AsFloat) + '/' + formatfloat('0', dao.q2.fieldbyname('volume').AsFloat), [comp12, NEGRITO]);
      FRPRI.RD.impval(lh, 70, '###,##0.000', dao.q2.fieldbyname('preco').AsFloat, [comp12, NEGRITO]);
      FRPRI.RD.impval(lh, 85, '###,##0.00', dao.q2.fieldbyname('sub_total').AsFloat, [comp12, NEGRITO]);
    end
    else begin
      FRPRI.RD.ImpF(lh, 01, dao.q2.fieldbyname('cod_produto').AsString + '\' + copy(dao.q2.fieldbyname('nom_produto').AsString, 1, 50), [comp12]);
      FRPRI.RD.impval(lh, 52, '###,##0.00', dao.q2.fieldbyname('qtd').AsFloat, [comp12]);
      FRPRI.RD.ImpF(lh, 64, dao.q2.fieldbyname('unidade').AsString, [comp12]);
      FRPRI.RD.ImpF(lh, 67, formatfloat('0', dao.q2.fieldbyname('qtd_embalagem').AsFloat) + '/' + formatfloat('0', dao.q2.fieldbyname('volume').AsFloat), [comp12]);
      if (dao.q2.fieldbyname('qtd_embalagem').AsFloat <> 0) and (dao.q2.fieldbyname('volume').AsFloat <> 0) then
        FRPRI.RD.ImpF(lh, 67, formatfloat('0', dao.q2.fieldbyname('qtd_embalagem').AsFloat) + '/' + formatfloat('0', dao.q2.fieldbyname('volume').AsFloat), [comp12]);
      FRPRI.RD.impval(lh, 70, '###,##0.000', dao.q2.fieldbyname('preco').AsFloat, [comp12]);
      FRPRI.RD.impval(lh, 85, '###,##0.00', dao.q2.fieldbyname('sub_total').AsFloat, [comp12]);
    end;
    total_produtos := total_produtos + dao.q2.fieldbyname('sub_total').AsFloat;
    Zebrado := not Zebrado;

    dao.q2.next;

  end;

  SetaPagina;

  lh := lh + 1;
  FRPRI.RD.impC(lh, 01, '----------------------------------------------------------------------------------------------', [comp12, NEGRITO]);

  SetaPagina;

  lh := lh + 1;
  dao.q1.Open;

  dao.Geral3('select representacao, agrupar_pedidos, modelo_desconto, tinta_base, OBRIGATORIEDADE_PESO, industria from configuracao where cod_conf=' + QuotedStr('1'));
  modelo_desconto := dao.q3.fieldbyname('modelo_desconto').AsInteger;

  case modelo_desconto of
    1:
      begin
        FRPRI.RD.impC(lh, 02, 'FOR.PAGAMEN.:', [comp12, NEGRITO]);
        FRPRI.RD.ImpF(lh, 15, dao.q1.fieldbyname('nom_fop').AsString + ' ' + dao.q1.fieldbyname('prazo').AsString, [comp12]);

        FRPRI.RD.impC(lh, 76, 'TOT.PRODUTOS:', [comp12, NEGRITO]);
        FRPRI.RD.impval(lh, 85, '###,##0.00', dao.q1.fieldbyname('tot_liquido').AsFloat, [comp12]);

        SetaPagina;
        lh := lh + 1;

        total_liquido := dao.q1.fieldbyname('tot_liquido').AsFloat - dao.q1.fieldbyname('VLR_DESCONTO_GERAL').AsFloat;

        FRPRI.RD.impC(lh, 02, 'PESO:', [comp12, NEGRITO]);
        FRPRI.RD.impval(lh, 6, '0.000', dao.q1.fieldbyname('peso_nota').AsFloat, [comp12]);

        FRPRI.RD.impC(lh, 35, 'VOLUMES:', [comp12, NEGRITO]);
        FRPRI.RD.impval(lh, 38, '##0.00', dao.q1.fieldbyname('volume_nota').AsFloat, [comp12]);

        FRPRI.RD.impC(lh, 78, 'DESCONTO:', [comp12, NEGRITO]);
        FRPRI.RD.impval(lh, 89, '##0.00', dao.q1.fieldbyname('VLR_DESCONTO_GERAL').AsFloat, [comp12]);
        SetaPagina;
        lh := lh + 1;

        FRPRI.RD.impC(lh, 77, 'TOT.LIQUIDO:', [comp12, NEGRITO]);
        FRPRI.RD.impval(lh, 85, '###,##0.00', total_liquido, [comp12]);
      end;
    2:
      begin
        FRPRI.RD.impC(lh, 02, 'TOT.PRODUTOS:', [comp12, NEGRITO]);
        FRPRI.RD.impval(lh, 15, '###,##0.00', total_produtos, [comp12]);

        FRPRI.RD.impC(lh, 36, 'DESCONTO:', [comp12, NEGRITO]);
        FRPRI.RD.impval(lh, 42, '##0.00', dao.q1.fieldbyname('VALORDESCONTOADIC').AsFloat, [comp12]);

        FRPRI.RD.impC(lh, 77, 'TOT.LIQUIDO:', [comp12, NEGRITO]);
        FRPRI.RD.impval(lh, 85, '###,##0.00', dao.q1.fieldbyname('tot_liquido').AsFloat, [comp12]);
      end;
  end;
  SetaPagina;

  lh := lh + 1;

  FRPRI.RD.impC(lh, 02, 'OBSERV:', [comp12, NEGRITO]);

  MTAMTOT := length(dao.q1.fieldbyname('observacoes_pedido').AsString);

  SetLength(MLHCH, ((MTAMTOT div 80) + 1));

  i := 1;
  observacao := StringReplace(dao.q1.fieldbyname('observacoes_pedido').AsString, #$D#$A, ' ', [rfReplaceAll]);

  if length(MLHCH) > 1 then
  begin
    for x := 0 to length(MLHCH) - 1 do
    begin
      MLHCH[x] := copy(observacao, i, 80);

      if length(trim(MLHCH[x])) < 80 then
        break;

      for y := length(MLHCH[x]) downto 1 do
      begin
        if copy(MLHCH[x], y, 1) = ' ' then
        begin
          MLHCH[x] := Trim(copy(observacao, i, y));
          i := i + y;
          break;
        end;
      end;
    end;

    for x := 0 to length(MLHCH) - 1 do
    begin
      FRPRI.RD.ImpF(lh, 09, MLHCH[x], [comp12]);
      lh := lh + 1;
    end;
  end
  else
  begin
    FRPRI.RD.ImpF(lh, 09, observacao, [comp12]);
    lh := lh + 1;
  end;

  SetaPagina;

  dao.Geral3('select * from cr1 where nr_documento=' + QuotedStr(Prnumdoc.Text));
  if dao.q3.RecordCount >= 1 then
  begin
    SetaPagina;

    lh := lh + 1;
    FRPRI.RD.ImpF(lh, 02, 'Vencimentos: ', [comp12]);
    dao.q3.First;
    cl := 16;
    mcr1 := FormatDateTime('dd/mm/yyyy', dao.q3.fieldbyname('dtaven').AsDateTime) + ':' + formatfloat('###,##0.00', dao.q3.fieldbyname('valor').AsFloat);
    dao.q3.next;
    while not (dao.q3.Eof) do
    begin
      mcr1 := mcr1 + ' - ' + FormatDateTime('dd/mm/yyyy', dao.q3.fieldbyname('dtaven').AsDateTime) + ' : ' + formatfloat('###,##0.00', dao.q3.fieldbyname('valor').AsFloat);
      dao.q3.next;
    end;
    FRPRI.RD.ImpF(lh, 16, mcr1, [comp12]);
  end;

  SetaPagina;

  lh := lh + 1;
  FRPRI.RD.ImpF(lh, 01, '----------------------------------------------------------------------------------------------', [comp12, NEGRITO]);

  SetaPagina;

  case modelo_desconto of
    1:
      begin

        lh := lh + 1;

        FRPRI.RD.ImpF(lh, 80, usuario, [comp12, NEGRITO]);
      end;

    2:
      begin

        lh := lh + 1;

        FRPRI.RD.ImpF(lh, 02, fantasia + ' - Fone: ' + fone_empresa, [comp12, NEGRITO]);
        FRPRI.RD.ImpF(lh, 80, usuario, [comp12, NEGRITO]);
      end;
  end;

  SetaPagina;

  if dao.q1.fieldbyname('nom_fop').AsString = 'TROCA' then
  begin
    lh := lh + 1;
    FRPRI.RD.impC(lh, 03, '----------------------------------------------------------------------------------------------', [comp12, NEGRITO]);

    SetaPagina;

    lh := lh + 1;
    FRPRI.RD.ImpF(lh, 03, 'A TROCA DO PRODUTO SOMENTE SERÁ EFETUADA ', [expandido, NEGRITO]);

    if (FRPRI.RD.Impressora <> Grafico) and (lh > 28) then
    begin
      FRPRI.RD.novapagina;
      lh := 0;
    end;
    lh := lh + 1;
    FRPRI.RD.ImpF(lh, 03, 'MEDIANTE A DEVOLUÇÃO DA MERCADORIA COM ', [expandido, NEGRITO]);

    SetaPagina;
    lh := lh + 1;
    FRPRI.RD.ImpF(lh, 03, 'DEFEITO/IRREGULAR.', [expandido, NEGRITO]);

  end;

  if (dao.q1.fieldbyname('PEDIDO_VINCULADO').AsInteger > 0) then
  begin
    lh := lh + 1;
    FRPRI.RD.ImpF(lh, 03, 'VINCULADO PEDIDO Nº.: ' + dao.q1.fieldbyname('PEDIDO_VINCULADO').AsString, [expandido, NEGRITO]);
  end;
  // dao.q1.next;
  // end;

  FRPRI.RD.fechar; // Encerra o relatório...

end;

procedure TFr_pedido_simplificado.btCarregarClick(Sender: TObject);
var
  Campos_combo: array of string;
  I: Integer;
  ChamouFormOld, ChamouPesquisaOld, ChamouCadastroOld: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);
  try
    ChamouFormOld := chamou_form;
    ChamouPesquisaOld := chamou_pesquisa;
    ChamouCadastroOld := chamou_cadastro;

    Fr_localizar.Caption := 'Localizar Vendas';
    chamou_pesquisa := 'fr_pedido';
    chamou_form := 'fr_pedido_simplificado';
    chamou_cadastro := '';
    Fr_localizar.BT_cadastro.Visible := False;

    Fr_localizar.CBcampos.Items.Clear;
    SetLength(Campos_combo, 10);
    Campos_combo[0] := 'Numero';
    Campos_combo[1] := 'NFE';
    Campos_combo[2] := 'Cliente - Codigo';
    Campos_combo[3] := 'Cliente - Razão S.';
    Campos_combo[4] := 'Cliente - Fantasia';
    Campos_combo[5] := 'CNPJ';
    Campos_combo[6] := 'CPF';
    Campos_combo[7] := 'Cidade';
    Campos_combo[8] := 'Vendedor';
    Campos_combo[9] := 'Televendas';

    for I := 0 to High(Campos_combo) do
      Fr_localizar.CBcampos.Items.Add(Campos_combo[I]);
    Fr_localizar.CBcampos.ItemIndex := 0;

    if FCampoPesquisado <> '' then
    begin
      I := Fr_localizar.CBcampos.Items.IndexOf(FCampoPesquisado);
      if I >= 0 then
        Fr_localizar.CBcampos.ItemIndex := I;
      Fr_localizar.EDlocalizar.Text := FDadoPesquisado;
      Fr_localizar.zzbusca_qualquer.Checked := FBuscaQualquerPosicao;
      Fr_localizar.loc_vendas(Fr_localizar.EDlocalizar.Text);
    end;

    Fr_localizar.ShowModal;

    if Fr_localizar.ModalResult = mrOk then
    begin
      FCampoPesquisado := Fr_localizar.CBcampos.Text;
      FDadoPesquisado := Fr_localizar.EDlocalizar.Text;
      FBuscaQualquerPosicao := Fr_localizar.zzbusca_qualquer.Checked;

      if Trim(Prnumdoc.Text) <> '' then
      begin
        CarregarPedido;
        CarregarItens;
      end;
    end;
  finally
    Fr_localizar.Free;
    chamou_form := ChamouFormOld;
    chamou_pesquisa := ChamouPesquisaOld;
    chamou_cadastro := ChamouCadastroOld;
  end;

  AtualizarBotoes;
end;

procedure TFr_pedido_simplificado.CarregarPedido;
begin
  LimparTela;

  if NumeroAtual = '' then
    Exit;

  qPedido.Close;
  qPedido.SQL.Text :=
    'select v.numdoc, v.cod_cliente, v.cod_representante, v.cod_supervisor, v.cod_fop, v.cod_prazo_pgto, v.observacoes_pedido, coalesce(v.faturado, ''0'') as faturado, coalesce(v.orcamento, ''0'') as orcamento ' +
    'from vendas1 v where v.numdoc = :numdoc';
  qPedido.ParamByName('numdoc').AsInteger := StrToIntDef(NumeroAtual,0);
  qPedido.Open;

  if qPedido.IsEmpty then
  begin
    ShowMessage('Pedido nao encontrado.');
    Exit;
  end;

  FFaturado := qPedido.FieldByName('faturado').AsString <> '0';

  Prcod_cliente.Text := qPedido.FieldByName('cod_cliente').AsString;
  Prcod_representante.Text := qPedido.FieldByName('cod_representante').AsString;
  Prcod_supervisor.Text := qPedido.FieldByName('cod_supervisor').AsString;
  Prcod_fop.Text := qPedido.FieldByName('cod_fop').AsString;
  Prcod_prazo_pgto.Text := qPedido.FieldByName('cod_prazo_pgto').AsString;
  if qPedido.FieldByName('orcamento').AsString = '1' then
    Prorcamento.ItemIndex := 1
  else
    Prorcamento.ItemIndex := 0;


  CarregarNomeCliente;
  CarregarNomeRepresentante;
  CarregarNomeSupervisor;
  CarregarNomeFop;
  CarregarNomePrazo;

  CarregarProdutoItem;
end;

procedure TFr_pedido_simplificado.PopularMemItens;
begin
  if not Assigned(mmItens) then
    Exit;
  mmItens.DisableControls;
  try
    if mmItens.Active then
      mmItens.EmptyTable
    else
      mmItens.Open;
    qItens.First;
    while not qItens.Eof do
    begin
      mmItens.Append;
      mmItens.FieldByName('cod_produto').AsInteger := qItens.FieldByName('cod_produto').AsInteger;
      mmItens.FieldByName('nom_produto').AsString := qItens.FieldByName('nom_produto').AsString;
      mmItens.FieldByName('preco_base').AsFloat := qItens.FieldByName('preco_base').AsFloat;
      mmItens.FieldByName('preco').AsFloat := qItens.FieldByName('preco').AsFloat;
      mmItens.FieldByName('qtd').AsFloat := qItens.FieldByName('qtd').AsFloat;
      mmItens.FieldByName('desconto').AsFloat := qItens.FieldByName('desconto').AsFloat;
      mmItens.FieldByName('sub_total').AsFloat := qItens.FieldByName('sub_total').AsFloat;
      mmItens.FieldByName('sub_total_bruto').AsFloat := qItens.FieldByName('sub_total_bruto').AsFloat;
      mmItens.Post;
      qItens.Next;
    end;
    mmItens.First;
  finally
    mmItens.EnableControls;
  end;
end;

procedure TFr_pedido_simplificado.CarregarItens;
begin
  if qPedido.IsEmpty then
    Exit;

  qItens.Close;
  qItens.ParamByName('numdoc').AsInteger := StrToIntDef(NumeroAtual,0);
  qItens.Open;
  PopularMemItens;
  AtualizarTotalLiquidoPedido;
  if not FItemEmEdicao then
  begin
    if ItensVazios then
      LimparDigitacaoItem
    else
      CarregarItemSelecionado;
  end;
  AtualizarBotoesItem;
end;

procedure TFr_pedido_simplificado.btNovoClick(Sender: TObject);
begin
  LimparTela;
  Prnumdoc.Clear;
  AtualizarResumoPedido;
  FFaturado := False;
  FNovo := True;
  FEmEdicao := True;
  HabilitarEdicao(True);
  AtualizarBotoes;
  LbTotalLiquidoPedido.Caption := 'Total Liquido: 0,00';
  LbSubTotalItem.Caption := '0,00';
  Prnumdoc.ReadOnly := True;
  Prcod_cliente.SetFocus;

  if (FRPRI.TipUsu = '0') then
  begin
    Prcod_representante.Text := FRPRI.Representante_id;
    Prcod_representanteExit(Self);
    Prcod_representante.ReadOnly := true;
  end;
end;

procedure TFr_pedido_simplificado.btAlterarClick(Sender: TObject);
begin
  if NumeroAtual = '' then
    Exit;

  if FFaturado then
  begin
    ShowMessage('Pedido ja faturado.');
    Exit;
  end;

  FNovo := False;
  FEmEdicao := True;
  HabilitarEdicao(True);
  AtualizarBotoes;

  if (FRPRI.TipUsu = '0') then
  begin
    Prcod_representante.ReadOnly := true;
    Prcod_supervisor.ReadOnly := true;
  end;
end;

procedure TFr_pedido_simplificado.btGravarClick(Sender: TObject);
var
  NumDoc, processo, SupervisorSql: string;
  Q: TFDQuery;
begin
  if dao.CN.InTransaction then
    dao.CN.Rollback;

  NumDoc := NumeroAtual;
  if NumDoc = '' then
  begin
    if FNovo then
    begin
      dao.Geral3('SELECT nextval(''gen_venda1'') as numdoc FROM configuracao');
      if not dao.Q3.IsEmpty then
      begin
        NumDoc := Trim(dao.Q3.FieldByName('numdoc').AsString);
        Prnumdoc.Text := NumDoc;
      end;
    end
    else
    begin
      ShowMessage('Informe o numero do pedido.');
      Exit;
    end;
  end;

  if NumDoc = '' then
  begin
    ShowMessage('Nao foi possivel gerar o numero do pedido.');
    Exit;
  end;

  if Trim(Prcod_cliente.Text) = '' then
  begin
    ShowMessage('Informe o cliente.');
    Exit;
  end;

  if Trim(Prcod_representante.Text) = '' then
  begin
    ShowMessage('Informe o representante.');
    Exit;
  end;

  if Trim(Prcod_fop.Text) = '' then
  begin
    ShowMessage('Informe a forma de pagamento.');
    Prcod_fop.SetFocus;
    Exit;
  end;

  if Trim(Prcod_prazo_pgto.Text) = '' then
  begin
    ShowMessage('Informe o prazo.');
    Prcod_prazo_pgto.SetFocus;
    Exit;
  end;

  if Trim(Prcod_supervisor.Text) = '' then
    SupervisorSql := 'null'
  else
    SupervisorSql := QuotedStr(Trim(Prcod_supervisor.Text));

  Q := TFDQuery.Create(nil);
  try
    Q.Connection := dao.CN;
    if not dao.CN.InTransaction then
      dao.CN.StartTransaction;
    try
      if FNovo then
      begin
        Q.SQL.Text := 'insert into vendas1 (numdoc, cod_empresa, cod_usuario, dtadoc, dta_emissao, dta_saida, empresa_faturar, cod_cliente, cod_representante, cod_supervisor, cod_fop, cod_prazo_pgto, orcamento, '+
                      ' faturado, tot_bruto, tot_liquido, desconto, pedido_vendedor) values (' +
          QuotedStr(NumDoc) + ',' + QuotedStr('0') + ',' + QuotedStr(cod_usuario) + ',' +
          QuotedStr(FormatDateTime('dd.mm.yyyy', dao.DtaSerDt)) + ',' + QuotedStr(FormatDateTime('dd.mm.yyyy', dao.DtaSerDt)) + ',' +
          QuotedStr(FormatDateTime('dd.mm.yyyy', dao.DtaSerDt)) + ',' + QuotedStr('0') + ',' + QuotedStr(Trim(Prcod_cliente.Text)) + ',' +
          QuotedStr(Trim(Prcod_representante.Text)) + ',' + SupervisorSql + ',' + QuotedStr(Trim(Prcod_fop.Text)) + ',' + QuotedStr(Trim(Prcod_prazo_pgto.Text)) + ',' +
          QuotedStr(IntToStr(Prorcamento.ItemIndex)) + ',' + QuotedStr('0') + ',' +
          StringReplace(FloatToStr(FTotalBruto), ',', '.', [rfReplaceAll]) + ',' +
          StringReplace(FloatToStr(FTotalLiquido), ',', '.', [rfReplaceAll])+ ',' +
          StringReplace(FloatToStr(FDesconto), ',', '.', [rfReplaceAll]) + ', 1)';
        Q.ExecSQL;
      end
      else
      begin
        Q.SQL.Text := 'update vendas1 set cod_cliente = ' + QuotedStr(Trim(Prcod_cliente.Text)) +
          ', cod_representante = ' + QuotedStr(Trim(Prcod_representante.Text)) +
          ', cod_supervisor = ' + SupervisorSql +
          ', cod_fop = ' + QuotedStr(Trim(Prcod_fop.Text)) +
          ', cod_prazo_pgto = ' + QuotedStr(Trim(Prcod_prazo_pgto.Text)) +
          ', orcamento = ' + QuotedStr(IntToStr(Prorcamento.ItemIndex)) +
          ', cod_empresa = ' + QuotedStr('0') +
          ', cod_usuario = ' + QuotedStr(cod_usuario) +
          ', empresa_faturar = ' + QuotedStr('0') +
          ', tot_bruto = ' + StringReplace(FloatToStr(FTotalBruto), ',', '.', [rfReplaceAll]) +
          ', tot_liquido = '+ StringReplace(FloatToStr(FTotalLiquido), ',', '.', [rfReplaceAll]) +
          ', desconto = '+ StringReplace(FloatToStr(FDesconto), ',', '.', [rfReplaceAll]) +
          ' where numdoc = ' + QuotedStr(NumDoc);
        Q.ExecSQL;
      end;

      Q.SQL.Text := 'delete from vendas2 where numdoc = ' + QuotedStr(NumDoc);
      Q.ExecSQL;

      if Assigned(mmItens) and mmItens.Active then begin
        mmItens.First;
        while not mmItens.Eof do begin
          Q.SQL.Text := 'insert into vendas2 (numdoc, cod_produto, qtd, preco_base, preco, desconto, sub_total, sub_total_bruto) values (' +
            QuotedStr(NumDoc) + ',' + QuotedStr(mmItens.FieldByName('cod_produto').AsString) + ',' +
            StringReplace(FloatToStr(mmItens.FieldByName('qtd').AsFloat), ',', '.', [rfReplaceAll]) + ',' +
            StringReplace(FloatToStr(mmItens.FieldByName('preco_base').AsFloat), ',', '.', [rfReplaceAll]) + ',' +
            StringReplace(FloatToStr(mmItens.FieldByName('preco').AsFloat), ',', '.', [rfReplaceAll]) + ',' +
            StringReplace(FloatToStr(mmItens.FieldByName('desconto').AsFloat), ',', '.', [rfReplaceAll]) + ',' +
            StringReplace(FloatToStr(mmItens.FieldByName('sub_total').AsFloat), ',', '.', [rfReplaceAll]) + ',' +
            StringReplace(FloatToStr(mmItens.FieldByName('sub_total_bruto').AsFloat), ',', '.', [rfReplaceAll]) + ')';
          Q.ExecSQL; mmItens.Next; end;
      end;

      dao.CN.Commit;
    except
      on E: Exception do
      begin
        if dao.CN.InTransaction then
          dao.CN.Rollback;
        ShowMessage('Erro ao gravar: ' + E.Message);
        Exit;
      end;
    end;
  finally
    if FNovo then
    begin
      processo := FMFUN.GerarProcessoPedido;
      FMFUN.GravarProcessoPedido('À Digitar', processo, NumDoc);
    end;
    FMFUN.AtualizaDadosComissaoDesconto(NumDoc);
    Q.Free;
  end;
  FEmEdicao := False;
  FNovo := False;
  HabilitarEdicao(False);
  CarregarPedido;
  CarregarItens;
  AtualizarBotoes;
  AtualizarResumoPedido;
end;
procedure TFr_pedido_simplificado.btCancelarClick(Sender: TObject);
begin
  FEmEdicao := False;
  FNovo := False;
  HabilitarEdicao(False);
  CarregarPedido;
  CarregarItens;
  AtualizarBotoes;
  AtualizarResumoPedido;
end;

procedure TFr_pedido_simplificado.btExcluirClick(Sender: TObject);
var
  NumDoc: string;
begin
  NumDoc := NumeroAtual;
  if NumDoc = '' then
    Exit;

  if FFaturado then
  begin
    ShowMessage('Pedido ja faturado.');
    Exit;
  end;

  if MessageDlg('Excluir pedido simplificado ' + NumDoc + '?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  try
    if not dao.CN.InTransaction then
      dao.CN.StartTransaction;
    dao.Execsql('delete from vendas2 where numdoc = ' + QuotedStr(NumDoc));
    dao.Execsql('delete from vendas1 where numdoc = ' + QuotedStr(NumDoc));
    dao.CN.Commit;
  except
    on E: Exception do
    begin
      if dao.CN.InTransaction then
        dao.CN.Rollback;
      ShowMessage('Erro ao excluir: ' + E.Message);
      Exit;
    end;
  end;

  Prnumdoc.Clear;
  LimparTela;
  AtualizarResumoPedido;
  AtualizarBotoes;
end;

procedure TFr_pedido_simplificado.CarregarProdutoItem;
var
  Q: TFDQuery;
begin
  LbNomProduto.Caption := '';
  FPrecoVendaProduto := 0;
  if Trim(MeCodProduto.Text) = '' then
    Exit;

  Q := TFDQuery.Create(nil);
  try
    Q.Connection := dao.CN;
    Q.SQL.Text :=
      'select nom_produto, coalesce(preco_venda, 0) as preco_venda ' +
      'from produto where cod_produto = :cod';
    Q.ParamByName('cod').AsInteger := StrToIntDef(Trim(MeCodProduto.Text),0);
    Q.Open;
    if not Q.IsEmpty then
    begin
      LbNomProduto.Caption := Q.FieldByName('nom_produto').AsString;
      FPrecoVendaProduto := Q.FieldByName('preco_venda').AsFloat;
      if (Trim(MePreco.Text) = '0,00') or (Trim(MePreco.Text) = '') then
        MePreco.Text := FormatFloat('0.00', Q.FieldByName('preco_venda').AsFloat);
    end;
  finally
    Q.Free;
  end;
end;

procedure TFr_pedido_simplificado.MeCodProdutoButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  I: Integer;
  ChamouFormOld, ChamouPesquisaOld, ChamouCadastroOld: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);
  try
    ChamouFormOld := chamou_form;
    ChamouPesquisaOld := chamou_pesquisa;
    ChamouCadastroOld := chamou_cadastro;

    Fr_localizar.Caption := 'Localizar Produto';
    chamou_pesquisa := 'fr_produto';
    chamou_form := 'fr_pedido_simplificado_produto';
    chamou_cadastro := 'Fr_produto';
    Fr_localizar.BT_cadastro.Visible := True;

    Fr_localizar.CBcampos.Items.Clear;
    SetLength(Campos_combo, 3);
    Campos_combo[0] := 'Codigo';
    Campos_combo[1] := 'Nome';
    for I := 0 to High(Campos_combo) do
      Fr_localizar.CBcampos.Items.Add(Campos_combo[I]);
    Fr_localizar.CBcampos.ItemIndex := 1;

    Fr_localizar.ShowModal;
    if not Fr_localizar.mmLocalizar.IsEmpty then
    begin
      MeCodProduto.Text := Fr_localizar.mmLocalizar.FieldByName('cod_produto').AsString;
      LbNomProduto.Caption := Fr_localizar.mmLocalizar.FieldByName('nom_produto').AsString;
    end;
  finally
    Fr_localizar.Free;
    chamou_form := ChamouFormOld;
    chamou_pesquisa := ChamouPesquisaOld;
    chamou_cadastro := ChamouCadastroOld;
  end;

  if Trim(MeCodProduto.Text) <> '' then
  begin
    CarregarProdutoItem;
    CarregaFoto(Trim(MeCodProduto.Text));
  end;
end;

procedure TFr_pedido_simplificado.MeCodProdutoExit(Sender: TObject);
begin
  MePreco.Clear;
  CarregarProdutoItem;
  if Trim(MeCodProduto.Text) <> '' then
    CarregaFoto(Trim(MeCodProduto.Text))
  else
    Foto.Picture := nil;
  AtualizarSubtotalItem;
end;
procedure TFr_pedido_simplificado.GravarItem(AAlterar: Boolean);
var
  Qtd, Preco, Desc, SubTotal, SubTotalBruto: Double;
  CodProdutoGravado: string;
begin
  if FFaturado then
  begin
    ShowMessage('Pedido ja faturado.');
    Exit;
  end;
  CarregarProdutoItem;
  if Trim(MeCodProduto.Text) = '' then
  begin
    ShowMessage('Informe o produto.');
    MeCodProduto.SetFocus;
    Exit;
  end;
  if AAlterar and ItensVazios then
  begin
    ShowMessage('Selecione um item para alterar.');
    Exit;
  end;
  CodProdutoGravado := Trim(MeCodProduto.Text);
  Qtd := ParseFloatFlex(MeQtd.Text);
  Preco := ParseFloatFlex(MePreco.Text);
  if Qtd <= 0 then
  begin
    ShowMessage('Informe a quantidade.');
    Exit;
  end;
  if Preco <= 0 then
  begin
    ShowMessage('Informe o preco.');
    Exit;
  end;
  Desc := ParseFloatFlex(MeDesconto.Text);
  if Desc < 0 then Desc := 0;
  if Desc > 100 then Desc := 100;
  if not ValidarDescontoItem(Desc) then
    Exit;
  SubTotal := (Qtd * Preco);
  SubTotalBruto := (Qtd * FPrecoVendaProduto);


  if not Assigned(mmItens) then
    Exit;
  if not mmItens.Active then
    mmItens.Open;

  if AAlterar then
    mmItens.Edit
  else
    mmItens.Append;

  mmItens.FieldByName('cod_produto').AsInteger := StrToIntDef(Trim(MeCodProduto.Text), 0);
  mmItens.FieldByName('nom_produto').AsString := LbNomProduto.Caption;
  mmItens.FieldByName('preco_base').AsFloat := FPrecoVendaProduto;
  mmItens.FieldByName('preco').AsFloat := Preco;
  mmItens.FieldByName('qtd').AsFloat := Qtd;
  mmItens.FieldByName('desconto').AsFloat := Desc;
  mmItens.FieldByName('sub_total').AsFloat := SubTotal;
  mmItens.FieldByName('sub_total_bruto').AsFloat := SubTotalBruto;
  mmItens.Post;

  if (CodProdutoGravado <> '') and mmItens.Active and (not mmItens.IsEmpty) then
    mmItens.Locate('cod_produto', CodProdutoGravado, []);
  AtualizarTotalLiquidoPedido;
  AtualizarResumoPedido;
  FItemEmEdicao := False;
  FItemAlterando := False;
  FProcessoIdAtual := '';
  FCodFatAtual := '';
  FStatusAtual := '-';
  HabilitarEdicaoItem(False);
  LimparDigitacaoItem;
  AtualizarBotoesItem;
  if btInsItem.Enabled then
    btInsItem.SetFocus;
end;
procedure TFr_pedido_simplificado.btInsItemClick(Sender: TObject);
begin
  FItemEmEdicao := True;
  FItemAlterando := False;
  LimparDigitacaoItem;
  HabilitarEdicaoItem(True);
  AtualizarBotoesItem;
  MeCodProduto.SetFocus;
end;
procedure TFr_pedido_simplificado.btGraItemClick(Sender: TObject);
begin
  if not FItemEmEdicao then
  begin
    ShowMessage('Clique em Ins. Item ou Alt. Item antes de gravar.');
    Exit;
  end;
  GravarItem(FItemAlterando);
end;
procedure TFr_pedido_simplificado.btAltItemClick(Sender: TObject);
begin
  if ItensVazios then
    Exit;
  FItemEmEdicao := True;
  FItemAlterando := True;
  CarregarItemSelecionado;
  HabilitarEdicaoItem(True);
  AtualizarBotoesItem;
  MeQtd.SetFocus;
end;
procedure TFr_pedido_simplificado.btCanItemClick(Sender: TObject);
begin
  FItemEmEdicao := False;
  FItemAlterando := False;
  FProcessoIdAtual := '';
  FCodFatAtual := '';
  FStatusAtual := '-';
  HabilitarEdicaoItem(False);
  if Assigned(mmItens) and mmItens.Active and (not mmItens.IsEmpty) then
    CarregarItemSelecionado
  else
    LimparDigitacaoItem;
  AtualizarBotoesItem;
end;
procedure TFr_pedido_simplificado.btExcItemClick(Sender: TObject);
begin
  if ItensVazios then
    Exit;
  if FFaturado then
    Exit;
  mmItens.Delete;
  FItemEmEdicao := False;
  FItemAlterando := False;
  FProcessoIdAtual := '';
  FCodFatAtual := '';
  FStatusAtual := '-';
  HabilitarEdicaoItem(False);
  if not ItensVazios then
    CarregarItemSelecionado
  else
    LimparDigitacaoItem;
  AtualizarTotalLiquidoPedido;
  AtualizarResumoPedido;
  AtualizarBotoesItem;
end;
procedure TFr_pedido_simplificado.dbgItensCellClick(Column: TColumn);
begin
  if ItensVazios then
    Exit;
  if FItemEmEdicao then
    Exit;
  CarregarItemSelecionado;
  AtualizarBotoesItem;
end;
function TFr_pedido_simplificado.BuscarCodigoLocalizar(const APesquisa, ATitulo: string): string;
begin
  Result := Trim(InputBox(ATitulo, 'Informe o codigo:', ''));
end;

procedure TFr_pedido_simplificado.Prcod_representanteButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  I: Integer;
  ChamouFormOld, ChamouPesquisaOld, ChamouCadastroOld: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);
  try
    ChamouFormOld := chamou_form;
    ChamouPesquisaOld := chamou_pesquisa;
    ChamouCadastroOld := chamou_cadastro;

    Fr_localizar.Caption := 'Localizar Representante';
    chamou_pesquisa := 'fr_representante';
    chamou_form := 'fr_pedido_simplificado_representante';
    chamou_cadastro := 'fr_representante';
    Fr_localizar.BT_cadastro.Visible := True;

    Fr_localizar.CBcampos.Items.Clear;
    SetLength(Campos_combo, 2);
    Campos_combo[0] := 'Codigo';
    Campos_combo[1] := 'Nome';
    for I := 0 to High(Campos_combo) do
      Fr_localizar.CBcampos.Items.Add(Campos_combo[I]);
    Fr_localizar.CBcampos.ItemIndex := 1;

    Fr_localizar.loc_representante('');
    Fr_localizar.ShowModal;
    if not Fr_localizar.mmLocalizar.IsEmpty then
    begin
      Prcod_representante.Text := Fr_localizar.mmLocalizar.FieldByName('id').AsString;
      LbNomRepresentante.Caption := Fr_localizar.mmLocalizar.FieldByName('nom_representante').AsString;
    end;
  finally
    Fr_localizar.Free;
    chamou_form := ChamouFormOld;
    chamou_pesquisa := ChamouPesquisaOld;
    chamou_cadastro := ChamouCadastroOld;
  end;

  CarregarNomeRepresentante;
end;

procedure TFr_pedido_simplificado.Prcod_representanteExit(Sender: TObject);
begin
  CarregarNomeRepresentante;
end;

procedure TFr_pedido_simplificado.Prcod_supervisorButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  I: Integer;
  ChamouFormOld, ChamouPesquisaOld, ChamouCadastroOld: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);
  try
    ChamouFormOld := chamou_form;
    ChamouPesquisaOld := chamou_pesquisa;
    ChamouCadastroOld := chamou_cadastro;
    Fr_localizar.Caption := 'Localizar Supervisor';
    chamou_pesquisa := 'fr_supervisor';
    chamou_form := 'fr_pedido_simplificado_supervisor';
    chamou_cadastro := 'fr_supervisor';
    Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Supervisor';
    Fr_localizar.BT_cadastro.Visible := True;
    Fr_localizar.CBcampos.Items.Clear;
    SetLength(Campos_combo, 5);
    Campos_combo[0] := 'Codigo';
    Campos_combo[1] := 'Nome';
    Campos_combo[2] := 'Empresa';
    Campos_combo[3] := 'CNPJ';
    Campos_combo[4] := 'CPF';
    for I := 0 to High(Campos_combo) do
      Fr_localizar.CBcampos.Items.Add(Campos_combo[I]);
    Fr_localizar.CBcampos.ItemIndex := 1;
    Fr_localizar.loc_representante('');
    Fr_localizar.ShowModal;
    if not Fr_localizar.mmLocalizar.IsEmpty then
    begin
      Prcod_supervisor.Text := Fr_localizar.mmLocalizar.FieldByName('id').AsString;
      LbNomSupervisor.Caption := Fr_localizar.mmLocalizar.FieldByName('nom_representante').AsString;
    end;
  finally
    Fr_localizar.Free;
    chamou_form := ChamouFormOld;
    chamou_pesquisa := ChamouPesquisaOld;
    chamou_cadastro := ChamouCadastroOld;
  end;
  CarregarNomeSupervisor;
end;
procedure TFr_pedido_simplificado.Prcod_supervisorExit(Sender: TObject);
begin
  if (Trim(Prcod_supervisor.Text) <> '') and (not FMFUN.verificaNumerico(Prcod_supervisor.Text)) then
  begin
    ShowMessage('Dado tem que ser sempre Numerico!');
    Prcod_supervisor.SetFocus;
    Exit;
  end;
  CarregarNomeSupervisor;
end;

procedure TFr_pedido_simplificado.qItensAfterScroll(DataSet: TDataSet);
begin
  if DataSet <> mmItens then
    Exit;
  if ItensVazios then
  begin
    if not FItemEmEdicao then
      LimparDigitacaoItem;
    AtualizarBotoesItem;
    Exit;
  end;
  if not FItemEmEdicao then
    CarregarItemSelecionado;
  AtualizarBotoesItem;
end;
procedure TFr_pedido_simplificado.Prcod_clienteButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  I: Integer;
  ChamouFormOld, ChamouPesquisaOld, ChamouCadastroOld: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);
  try
    ChamouFormOld := chamou_form;
    ChamouPesquisaOld := chamou_pesquisa;
    ChamouCadastroOld := chamou_cadastro;

    Fr_localizar.Caption := 'Localizar Cliente';
    chamou_pesquisa := 'fr_cliente';
    chamou_form := 'fr_pedido_simplificado_cliente';
    chamou_cadastro := 'Fr_cliente';

    Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cliente';
    Fr_localizar.BT_cadastro.Visible := True;

    Fr_localizar.CBcampos.Items.Clear;
    SetLength(Campos_combo, 6);
    Campos_combo[0] := 'Codigo';
    Campos_combo[1] := 'Razão Social';
    Campos_combo[2] := 'Nome Fantasia';
    Campos_combo[3] := 'CNPJ';
    Campos_combo[4] := 'CPF';
    Campos_combo[5] := 'Cidade';
    for I := 0 to High(Campos_combo) do
      Fr_localizar.CBcampos.Items.Add(Campos_combo[I]);
    Fr_localizar.CBcampos.ItemIndex := 1;


    Fr_localizar.ShowModal;
    if not Fr_localizar.mmLocalizar.IsEmpty then
    begin
      Prcod_cliente.Text := Fr_localizar.mmLocalizar.FieldByName('cod_cliente').AsString;
      LbNomCliente.Caption := Fr_localizar.mmLocalizar.FieldByName('nom_cliente').AsString;
    end;
  finally
    Fr_localizar.Free;
    chamou_form := ChamouFormOld;
    chamou_pesquisa := ChamouPesquisaOld;
    chamou_cadastro := ChamouCadastroOld;
  end;

  CarregarNomeCliente;
end;

procedure TFr_pedido_simplificado.Prcod_clienteExit(Sender: TObject);
begin
  CarregarNomeCliente;
end;

procedure TFr_pedido_simplificado.Prcod_fopButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  I: Integer;
  ChamouFormOld, ChamouPesquisaOld, ChamouCadastroOld: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);
  try
    ChamouFormOld := chamou_form;
    ChamouPesquisaOld := chamou_pesquisa;
    ChamouCadastroOld := chamou_cadastro;

    Fr_localizar.Caption := 'Localizar Forma de Pagamento';
    chamou_pesquisa := 'fr_fop';
    chamou_form := 'fr_pedido_simplificado_fop';
    chamou_cadastro := 'fr_fop';
    Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Fop';
    Fr_localizar.BT_cadastro.Visible := True;

    Fr_localizar.CBcampos.Items.Clear;
    SetLength(Campos_combo, 2);
    Campos_combo[0] := 'Codigo';
    Campos_combo[1] := 'Nome';
    for I := 0 to High(Campos_combo) do
      Fr_localizar.CBcampos.Items.Add(Campos_combo[I]);
    Fr_localizar.CBcampos.ItemIndex := 1;

    Fr_localizar.loc_fop('');
    Fr_localizar.ShowModal;
    if not Fr_localizar.mmLocalizar.IsEmpty then
    begin
      Prcod_fop.Text := Fr_localizar.mmLocalizar.FieldByName('cod_fop').AsString;
      LbNomFop.Caption := Fr_localizar.mmLocalizar.FieldByName('nom_fop').AsString;
    end;
  finally
    Fr_localizar.Free;
    chamou_form := ChamouFormOld;
    chamou_pesquisa := ChamouPesquisaOld;
    chamou_cadastro := ChamouCadastroOld;
  end;

  CarregarNomeFop;
end;

procedure TFr_pedido_simplificado.Prcod_fopExit(Sender: TObject);
var
  prazo_padrao : string;
begin
  CarregarNomeFop;
  if Trim(Prcod_fop.Text) <> '' then
  begin
    dao.Geral1('select coalesce(avista, ''N'') as avista, prazo_padrao from fop where ativo = ''S'' and cod_fop = ' + QuotedStr(Trim(Prcod_fop.Text)));
    prazo_padrao := dao.q1.fieldbyname('prazo_padrao').AsString;
    if (prazo_padrao <> '') then
    begin
      dao.Geral4('SELECT a.ID FROM PRAZO a where a.id = ' + prazo_padrao);
      Prcod_prazo_pgto.Text := dao.q4.fieldbyname('id').AsString;
      Prcod_prazo_pgtoExit(Self);
      Prcod_prazo_pgto.Enabled := false;
      Prorcamento.SetFocus;
    end
    else
      Prcod_prazo_pgto.Enabled := true;
  end
  else
  begin
    Prcod_prazo_pgto.Enabled := True;
    Prcod_prazo_pgto.SetFocus;
  end;
end;

procedure TFr_pedido_simplificado.Prcod_prazo_pgtoButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  I: Integer;
  ChamouFormOld, ChamouPesquisaOld, ChamouCadastroOld: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);
  try
    ChamouFormOld := chamou_form;
    ChamouPesquisaOld := chamou_pesquisa;
    ChamouCadastroOld := chamou_cadastro;

    Fr_localizar.Caption := 'Localizar Prazo';
    chamou_pesquisa := 'fr_prazo';
    chamou_form := 'fr_pedido_simplificado_prazo';
    chamou_cadastro := 'fr_prazo';
    Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Prazo';
    Fr_localizar.BT_cadastro.Visible := True;

    Fr_localizar.CBcampos.Items.Clear;
    SetLength(Campos_combo, 2);
    Campos_combo[0] := 'Código';
    Campos_combo[1] := 'Descrição';
    for I := 0 to High(Campos_combo) do
      Fr_localizar.CBcampos.Items.Add(Campos_combo[I]);
    Fr_localizar.CBcampos.ItemIndex := 1;

    Fr_localizar.loc_prazo_pagamento('');
    Fr_localizar.ShowModal;
    if not Fr_localizar.mmLocalizar.IsEmpty then
    begin
      Prcod_prazo_pgto.Text := Fr_localizar.mmLocalizar.FieldByName('id').AsString;
      LbNomPrazo.Caption := Fr_localizar.mmLocalizar.FieldByName('prazo').AsString;
    end;
  finally
    Fr_localizar.Free;
    chamou_form := ChamouFormOld;
    chamou_pesquisa := ChamouPesquisaOld;
    chamou_cadastro := ChamouCadastroOld;
  end;

  CarregarNomePrazo;
end;

procedure TFr_pedido_simplificado.Prcod_prazo_pgtoExit(Sender: TObject);
begin
  CarregarNomePrazo;
end;

procedure TFr_pedido_simplificado.AtualizarSubtotalItem;
var
  Qtd, Preco, Desc, Vlr: Double;
begin
  if Assigned(mmItens) and mmItens.Active and (not mmItens.IsEmpty) and
     (not MeQtd.Focused) and (not MePreco.Focused) and (not MeDesconto.Focused) then
  begin
    LbSubTotalItem.Caption := mmItens.FieldByName('sub_total').DisplayText;
    Exit;
  end;

  Qtd := ParseFloatFlex(MeQtd.Text);
  Preco := ParseFloatFlex(MePreco.Text);
  Desc := ParseFloatFlex(MeDesconto.Text);
  if Desc < 0 then Desc := 0;
  if Desc > 100 then Desc := 100;

  MeQtd.Text := FmtQtd(Qtd);
  MePreco.Text := FmtMoney(Preco);
  MeDesconto.Text := FmtQtd(Desc);

  Vlr := (Qtd * Preco) * (1 - (Desc / 100));
  LbSubTotalItem.Caption := FmtMoney(Vlr);
end;

procedure TFr_pedido_simplificado.AtualizarTotalLiquidoPedido;
begin
  FTotalBruto   := 0;
  FTotalLiquido := 0;

  if Assigned(mmItens) and mmItens.Active then
  begin
    mmItens.DisableControls;
    try
      mmItens.First;
      while not mmItens.Eof do
      begin
        if mmItens.FieldByName('sub_total_bruto').AsFloat = 0 then
        begin
          mmItens.edit;
          mmItens.FieldByName('sub_total_bruto').AsFloat := mmItens.FieldByName('preco_base').AsFloat * mmItens.FieldByName('qtd').AsFloat;
          mmItens.post;
        end;

        FTotalLiquido := FTotalLiquido + mmItens.FieldByName('sub_total').AsFloat;
        FTotalBruto := FTotalBruto + mmItens.FieldByName('sub_total_bruto').AsFloat;
        mmItens.Next;
      end;
    finally
      mmItens.EnableControls;
    end;
  end;
  LbTotalLiquidoPedido.Caption := 'Total Liquido: ' + FormatFloat('#,##0.00', FTotalLiquido);
  FDesconto := ((FTotalBruto - FTotalLiquido) / FTotalBruto) * 100;
  AtualizarResumoPedido;
  Self.Refresh;
end;

function TFr_pedido_simplificado.ObterDescontoMaximoItem: Double;
var
  Q: TFDQuery;
  LDescontoProduto: Double;
  LDescontoCliente: Double;
begin
  Result := 0;
  if Trim(MeCodProduto.Text) = '' then
    Exit;
  LDescontoProduto := 0;
  LDescontoCliente := 100;
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := dao.CN;
    Q.SQL.Text :=
      'select coalesce(p.desconto_maximo, 0) as desconto_produto, ' +
      '       coalesce(c.desconto_maximo, 100) as desconto_cliente ' +
      'from produto p ' +
      'left join cliente c on c.cod_cliente = :cod_cliente ' +
      'where p.cod_produto = :cod_produto';
    Q.ParamByName('cod_cliente').AsInteger := StrToIntDef(Trim(Prcod_cliente.Text), 0);
    Q.ParamByName('cod_produto').AsInteger := StrToIntDef(Trim(MeCodProduto.Text), 0);
    Q.Open;
    if not Q.IsEmpty then
    begin
      LDescontoProduto := Q.FieldByName('desconto_produto').AsFloat;
      LDescontoCliente := Q.FieldByName('desconto_cliente').AsFloat;
    end;
  finally
    Q.Free;
  end;
  Result := LDescontoProduto;
  if Result > LDescontoCliente then
    Result := LDescontoCliente;
end;

function TFr_pedido_simplificado.ValidarDescontoItem(const ADesconto: Double): Boolean;
var
  LDescontoMaximo: Double;
begin
  Result := True;
  LDescontoMaximo := ObterDescontoMaximoItem;
  if ADesconto > LDescontoMaximo then
  begin
    ShowMessage('Desconto Superior ao Permitido para este Produto! Maximo: ' + FmtQtd(LDescontoMaximo) + '%');
    MeDesconto.Text := FmtQtd(LDescontoMaximo);
    AtualizarSubtotalItem;
    MeDesconto.SetFocus;
    Result := False;
  end;
end;

procedure TFr_pedido_simplificado.MeQtdChange(Sender: TObject);
begin
  AtualizarSubtotalItem;
end;

procedure TFr_pedido_simplificado.MeQtdEnter(Sender: TObject);
begin
  MeQtd.SelectAll;
end;

procedure TFr_pedido_simplificado.CarregaFoto(const AProduto: string);
var
  ArquivoTmp: string;
begin
  Foto.Picture := nil;
  if Trim(AProduto) = '' then
    Exit;

  q_foto.Close;
  q_foto.SQL.Text := 'select s.imagem_bd from produto p inner join subcategoria s on s.id = p.subcategoria where p.cod_produto = :cod';
  q_foto.ParamByName('cod').AsInteger := StrToIntDef(Trim(AProduto),0);
  q_foto.Open;

  if q_foto.IsEmpty or q_foto.FieldByName('imagem_bd').IsNull then
    Exit;

  ArquivoTmp := IncludeTrailingPathDelimiter(GetEnvironmentVariable('TEMP')) +
    'pedido_simplificado_foto_' + Trim(AProduto) + '.jpg';
  try
    TBlobField(q_foto.FieldByName('imagem_bd')).SaveToFile(ArquivoTmp);
    if FileExists(ArquivoTmp) then
      Foto.Picture.LoadFromFile(ArquivoTmp);
  except
    Foto.Picture := nil;
  end;
end;

procedure TFr_pedido_simplificado.CarregarNomeCliente;
begin
  LbNomCliente.Caption := '';
  if Trim(Prcod_cliente.Text) = '' then Exit;
  dao.Geral1('select nom_cliente from cliente where cod_cliente = ' + QuotedStr(Trim(Prcod_cliente.Text)));
  if not dao.q1.IsEmpty then
    LbNomCliente.Caption := dao.q1.FieldByName('nom_cliente').AsString;
end;

procedure TFr_pedido_simplificado.CarregarNomeRepresentante;
begin
  LbNomRepresentante.Caption := '';
  if Trim(Prcod_representante.Text) = '' then Exit;
  dao.Geral1('select nom_representante from representante where ativo = ''S'' and funcionario in (''0'', ''1'') and  id = ' + QuotedStr(Trim(Prcod_representante.Text)));
  if not dao.q1.IsEmpty then
    LbNomRepresentante.Caption := dao.q1.FieldByName('nom_representante').AsString;
end;

procedure TFr_pedido_simplificado.CarregarNomeSupervisor;
begin
  LbNomSupervisor.Caption := '';
  if Trim(Prcod_supervisor.Text) = '' then Exit;
  dao.Geral1('select nom_representante from representante where ativo = ''S'' and funcionario in (''4'') and id = ' + QuotedStr(Trim(Prcod_supervisor.Text)));
  if not dao.q1.IsEmpty then
    LbNomSupervisor.Caption := dao.q1.FieldByName('nom_representante').AsString
  else
  begin
    dao.msg('Registro nao Encontrado!');
    Prcod_supervisor.Clear;
    Prcod_supervisor.SetFocus;
  end;
end;

procedure TFr_pedido_simplificado.CarregarNomeFop;
begin
  LbNomFop.Caption := '';
  if Trim(Prcod_fop.Text) = '' then Exit;
  dao.Geral1('select nom_fop from fop where cod_fop = ' + QuotedStr(Trim(Prcod_fop.Text)));
  if not dao.q1.IsEmpty then
    LbNomFop.Caption := dao.q1.FieldByName('nom_fop').AsString;
end;

procedure TFr_pedido_simplificado.CarregarNomePrazo;
begin
  LbNomPrazo.Caption := '';
  if Trim(Prcod_prazo_pgto.Text) = '' then Exit;
  dao.Geral1('select prazo from prazo where id = ' + QuotedStr(Trim(Prcod_prazo_pgto.Text)));
  if not dao.q1.IsEmpty then
    LbNomPrazo.Caption := dao.q1.FieldByName('prazo').AsString;
end;

procedure TFr_pedido_simplificado.AtualizarResumoPedido;
var
  Perc, Valor, DescPedido: Double;
  St: string;
  tipo_func: integer;
begin
  Perc := 0;
  Valor := 0;
  St := '-';

  FProcessoIdAtual := '';
  FCodFatAtual := '';
  FStatusAtual := '-';


  if FTotalBruto = 0 then Exit;


  if Prcod_representante.Text <> '' then
  begin
    dao.Geral5('select funcionario from  representante where id = '+Prcod_representante.Text);
    tipo_func := dao.q5.FieldByName('funcionario').AsInteger;

    FormatSettings.DecimalSeparator := '.';
    dao.Geral5('select perc_comissao_func, perc_comissao_terc from escala_comissao where  desconto <= '+FormatFloat('#.00', FDesconto)+' order by desconto desc limit 1');
    FormatSettings.DecimalSeparator := ',';
    case tipo_func of
      0 : Perc := dao.q5.FieldByName('perc_comissao_terc').AsFloat;
      1 : Perc := dao.q5.FieldByName('perc_comissao_func').AsFloat;
    end;

    Valor := FTotalLiquido * (Perc / 100);


    if NumeroAtual <> '' then
    begin
      dao.Geral1('select coalesce(pp.status, ' + QuotedStr('') + ') as status_pedido, ' +
                'coalesce(cast(v1.processo_id as varchar(20)), ' + QuotedStr('') + ') as processo_id, ' +
                'coalesce(v1.faturado, ' + QuotedStr('0') + ') as cod_fat ' +
                'from vendas1 v1 ' +
                'left join processo_pedido pp on pp.id = v1.processo_id ' +
                'where v1.numdoc = ' + QuotedStr(NumeroAtual));
      if not dao.q1.IsEmpty then
      begin
        FProcessoIdAtual := Trim(dao.q1.FieldByName('processo_id').AsString);

        if FProcessoIdAtual = '' then
        begin
          FProcessoIdAtual := FMFUN.GerarProcessoPedido;

          dao.Exec_sql.SQL.Text := 'update vendas1 set processo_id = '+FProcessoIdAtual+' where numdoc = '+NumeroAtual;
          dao.Exec_sql.ExecSQL;

          FMFUN.GravarProcessoPedido('À Digitar', FProcessoIdAtual, NumeroAtual);
          St := 'À Digitar';
        end
        else begin
          St := Trim(dao.q1.FieldByName('status_pedido').AsString);
          FCodFatAtual := Trim(dao.q1.FieldByName('cod_fat').AsString);
          if St = '' then
            St := '-';
        end;

        FStatusAtual := St;
      end;
    end;

    LbDescontoPedido.Caption := 'Desconto Pedido %: ' + FormatFloat('#,##0.00', FDesconto);
    LbComissaoPerc.Caption := 'Comissao %: ' + FormatFloat('#,##0.00', Perc);
    LbComissaoValor.Caption := 'Comissao R$: ' + FormatFloat('#,##0.00', Valor);
    LbStatusPedido.Caption := 'Status: ' + St;
    end;
  AtualizarBotoes;
end;

procedure TFr_pedido_simplificado.CarregarPorNumDoc(const ANumDoc: string);
begin
  Prnumdoc.Text := Trim(ANumDoc);
  CarregarPedido;
  CarregarItens;
  AtualizarBotoes;
  AtualizarResumoPedido;
end;

end.

























