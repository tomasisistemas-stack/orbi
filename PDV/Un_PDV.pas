unit Un_PDV;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Variants, Math,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DBCtrls, ComCtrls, DB,
  FireDAC.Comp.Client, sComboEdit,
  Un_dao, Un_nfce_simplificado, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  Vcl.Mask, sMaskEdit, sCustomComboEdit;

type
  TFr_PDV = class(TForm)
    pnCabecalho: TPanel;
    lbTitulo: TLabel;
    lbDataDocumento: TLabel;
    lbNumeroDocumento: TLabel;
    lbOperador: TLabel;
    lbCaixa: TLabel;
    pnEntrada: TPanel;
    lbCodigoBarras: TLabel;
    edCodigoBarras: TEdit;
    lbDescricaoItem: TLabel;
    edDescricaoItem: TEdit;
    lbQuantidadeItem: TLabel;
    edQuantidadeItem: TEdit;
    lbPrecoItem: TLabel;
    edPrecoItem: TEdit;
    lbDescontoItem: TLabel;
    edDescontoItem: TEdit;
    lbTotalItem: TLabel;
    edTotalItem: TEdit;
    lbCliente: TLabel;
    Prcod_cliente: TsComboEdit;
    LbNomCliente: TLabel;
    lbRepresentante: TLabel;
    Prcod_representante: TsComboEdit;
    LbNomRepresentante: TLabel;
    lbFormaPagamento: TLabel;
    Prcod_fop: TsComboEdit;
    LbNomFop: TLabel;
    lbPrazo: TLabel;
    Prcod_prazo_pgto: TsComboEdit;
    LbNomPrazo: TLabel;
    pnItens: TPanel;
    dbItens: TDBGrid;
    dsItens: TDataSource;
    mdItens: TFDMemTable;
    qFop: TFDQuery;
    dsFop: TDataSource;
    pnResumo: TPanel;
    lbItens: TLabel;
    lbQuantidade: TLabel;
    lbSubtotal: TLabel;
    lbDesconto: TLabel;
    edDescontoGeral: TEdit;
    lbTotal: TLabel;
    pnPagamento: TPanel;
    lbRecebido: TLabel;
    edRecebido: TEdit;
    lbTroco: TLabel;
    lbTrocoValor: TLabel;
    pnRodape: TPanel;
    lbStatusRodape: TLabel;
    btNovo: TButton;
    btLocalizarPedido: TButton;
    btExcluirItem: TButton;
    btCancelar: TButton;
    btFinalizar: TButton;
    btEmitirNFCe: TButton;
    btDANFCe: TButton;
    btImprimir: TButton;
    procedure FormCreate(Sender: TObject);
    procedure AjustaPaginaPDV(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edCodigoBarrasKeyPress(Sender: TObject; var Key: Char);
    procedure edCodigoBarrasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edQuantidadeItemExit(Sender: TObject);
    procedure edPrecoItemExit(Sender: TObject);
    procedure edDescontoItemExit(Sender: TObject);
    procedure ConfirmarItemPendente;
    procedure edDescontoGeralChange(Sender: TObject);
    procedure edDescontoGeralExit(Sender: TObject);
    procedure edRecebidoChange(Sender: TObject);
    procedure edRecebidoExit(Sender: TObject);
    procedure btFinalizarClick(Sender: TObject);
    procedure btEmitirNFCeClick(Sender: TObject);
    procedure btDANFCeClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure btLocalizarPedidoClick(Sender: TObject);
    procedure btExcluirItemClick(Sender: TObject);
    procedure btBuscarProdutoClick(Sender: TObject);
    procedure btBuscarClienteClick(Sender: TObject);
    procedure PrcodClienteExit(Sender: TObject);
    procedure btBuscarRepresentanteClick(Sender: TObject);
    procedure PrcodRepresentanteExit(Sender: TObject);
    procedure btBuscarFopClick(Sender: TObject);
    procedure PrcodFopKeyPress(Sender: TObject; var Key: Char);
    procedure PrcodFopExit(Sender: TObject);
    function CountPrazosFormaPgto(const ACodFop: Integer): Integer;
    function PrazoPertenceFormaPgto(const ACodFop, ACodPrazo: Integer): Boolean;
    procedure AplicarPrazoFormaPgto;
    procedure btBuscarPrazoClick(Sender: TObject);
    procedure PrcodPrazoKeyPress(Sender: TObject; var Key: Char);
    procedure PrcodPrazoExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure mdValorGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure mdItensAfterScroll(DataSet: TDataSet);
    procedure dbItensCellClick(Column: TColumn);
  private
    FNFCe: TFr_nfce_simplificado;
    FEmpresaPadrao: Integer;
    FPendenteCodigoProduto: string;
    FTotalPDV: Double;
    FSubtotalPDV: Double;
    FDescontoGeralPDV: Double;
    FQuantidadePDV: Double;
    FNumDoc: string;
    FFaturado: Boolean;
    FEmEdicao: Boolean;
    procedure CriarDocumento;
    procedure AdicionarCodigoProduto(const ACodigo: string);
    procedure RecalcularTotaisPDV;
    procedure AtualizarDocumento;
    function GravarDocumentoPDV: Boolean;
    procedure SolicitarEmissaoNFCe;
    function CodigoFormaPagamento: string;
    function CodigoPrazo: string;
    procedure LimparItens;
    procedure AtualizarResumo;
    procedure AtualizarStatusPDV;
    procedure AtualizarBotoesPDV;
    procedure AtualizarEditsPDV;
    procedure AtualizarEdicaoItem;
    procedure LimparEditsItem;
    procedure CarregarPadroesPDV;
    procedure PrepararEdicaoCodigo(const ACodigo: string);
    procedure AtualizarTotalItemEdicao;
    procedure AplicarDescontoEdicao;
    function ObterDescontoMaximoItem: Double;
    function ValidarDescontoItem(const ADesconto: Double): Boolean;
    procedure CarregarPedidoPDV(const ANumeroDocumento: string);
  end;

var
  Fr_PDV: TFr_PDV;

implementation

uses
  Un_localizar, UnPri, UnFun, Un_status_emissor, un_pedido_simplificado;

{$R *.dfm}

function ParsePDVFloat(const AValue: string): Double;
var
  S: string;
  F: TFormatSettings;
begin
  S := Trim(AValue);
  S := StringReplace(S, 'R$', '', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S, ' ', '', [rfReplaceAll]);
  F := FormatSettings;
  if (Pos(',', S) > 0) and (Pos('.', S) > 0) then
  begin
    S := StringReplace(S, '.', '', [rfReplaceAll]);
    S := StringReplace(S, ',', '.', [rfReplaceAll]);
    F.DecimalSeparator := '.';
    F.ThousandSeparator := ',';
  end
  else if Pos(',', S) > 0 then
  begin
    S := StringReplace(S, ',', '.', [rfReplaceAll]);
    F.DecimalSeparator := '.';
    F.ThousandSeparator := ',';
  end
  else
  begin
    F.DecimalSeparator := '.';
    F.ThousandSeparator := ',';
  end;
  Result := StrToFloatDef(S, 0, F);
end;

function MoneyPDV(const AValue: Double): string;
var
  F: TFormatSettings;
begin
  F := FormatSettings;
  F.DecimalSeparator := ',';
  F.ThousandSeparator := '.';
  Result := 'R$ ' + FormatFloat('#,##0.00', AValue, F);
end;

function DecimalPDV(const AValue: Double): string;
var
  F: TFormatSettings;
begin
  F := FormatSettings;
  F.DecimalSeparator := ',';
  F.ThousandSeparator := '.';
  Result := FormatFloat('#,##0.00', AValue, F);
end;

procedure TFr_PDV.CarregarPadroesPDV;
var
  Q: TFDQuery;
begin
  FEmpresaPadrao := 0;
  Prcod_fop.Clear;
  LbNomFop.Caption := '';
  Prcod_prazo_pgto.Clear;
  LbNomPrazo.Caption := '';
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := dao.CN;
    Q.SQL.Text :=
      'select frente_caixa_empresa_padrao, frente_caixa_cliente_padrao, ' +
      'frente_caixa_representante_padrao from configuracao';
    Q.Open;
    if not Q.IsEmpty then
    begin
      FEmpresaPadrao := Q.FieldByName('frente_caixa_empresa_padrao').AsInteger;
      Prcod_cliente.Text :=
        Q.FieldByName('frente_caixa_cliente_padrao').AsString;
      Prcod_representante.Text :=
        Q.FieldByName('frente_caixa_representante_padrao').AsString;
    end;
  finally
    Q.Free;
  end;

  Q := TFDQuery.Create(nil);
  try
    Q.Connection := dao.CN;
    Q.SQL.Text :=
      'select cod_fop, nom_fop from fop ' +
      'where ativo = ''S'' and lower(nom_fop) like ''%vista%'' ' +
      'order by cod_fop limit 1';
    Q.Open;
    if not Q.IsEmpty then
    begin
      Prcod_fop.Text := Q.FieldByName('cod_fop').AsString;
      LbNomFop.Caption := Q.FieldByName('nom_fop').AsString;
    end;
  finally
    Q.Free;
  end;

  Q := TFDQuery.Create(nil);
  try
    Q.Connection := dao.CN;
    Q.SQL.Text := 'select id from prazo where ativo = ''S'' order by id limit 1';
    Q.Open;
    if not Q.IsEmpty then
      Prcod_prazo_pgto.Text := Q.FieldByName('id').AsString;
  finally
    Q.Free;
  end;

  PrcodClienteExit(Self);
  PrcodRepresentanteExit(Self);
  PrcodFopExit(Self);
  PrcodPrazoExit(Self);
end;

procedure TFr_PDV.AjustaPaginaPDV(Sender: TObject);
var
  lar, alt: Integer;
begin
  if not (Sender is TScrollBox) then
    Exit;
  // layout de projeto 1280 x 760; acima disso a pagina acompanha a janela
  lar := TScrollBox(Sender).ClientWidth;
  alt := TScrollBox(Sender).ClientHeight;
  if lar < 1280 then
    lar := 1280;
  if alt < 760 then
    alt := 760;
  pnCabecalho.SetBounds(0, 0, lar, 64);
  pnEntrada.SetBounds(0, 64, lar, 64);
  pnItens.SetBounds(0, 128, lar - 350, alt - 128 - 80);
  pnResumo.SetBounds(lar - 350, 128, 350, alt - 128 - 80);
  pnRodape.SetBounds(0, alt - 80, lar, 80);
end;

procedure TFr_PDV.FormCreate(Sender: TObject);
var
  sbPagina: TScrollBox;
begin
  // a pagina do PDV rola dentro da tela filha, que mantem o tamanho original
  sbPagina := TScrollBox.Create(Self);
  sbPagina.Parent := Self;
  sbPagina.Align := alClient;
  sbPagina.BorderStyle := bsNone;
  sbPagina.AutoScroll := True;
  sbPagina.OnResize := AjustaPaginaPDV;
  pnCabecalho.Align := alNone;
  pnCabecalho.Parent := sbPagina;
  pnEntrada.Align := alNone;
  pnEntrada.Parent := sbPagina;
  pnItens.Align := alNone;
  pnItens.Parent := sbPagina;
  pnResumo.Align := alNone;
  pnResumo.Parent := sbPagina;
  pnRodape.Align := alNone;
  pnRodape.Parent := sbPagina;
  AjustaPaginaPDV(sbPagina);
  FNFCe := nil;
  FNumDoc := '';
  FFaturado := False;
  FEmEdicao := False;
  FTotalPDV := 0;
  FSubtotalPDV := 0;
  FDescontoGeralPDV := 0;
  FQuantidadePDV := 0;
  FPendenteCodigoProduto := '';
  if Trim(nom_usuario) <> '' then
    lbOperador.Caption := 'Operador: ' + nom_usuario
  else
    lbOperador.Caption := 'Operador: n'#227'o informado';
  lbDataDocumento.Caption :=
    'Data: ' + FormatDateTime('dd/mm/yyyy', dao.DtaSerDt);
  lbNumeroDocumento.Caption := 'Venda: Nova';
  qFop.Connection := dao.CN;
  qFop.SQL.Text := 'select cod_fop, nom_fop from fop where ativo = ''S'' order by nom_fop';
  qFop.Open;
  dsFop.DataSet := qFop;
  CarregarPadroesPDV;
  edRecebido.Text := '0,00';
  mdItens.FieldDefs.Add('cod_produto', ftInteger);
  mdItens.FieldDefs.Add('nom_produto', ftString, 120);
  mdItens.FieldDefs.Add('qtd', ftFloat);
  mdItens.FieldDefs.Add('preco', ftFloat);
  mdItens.FieldDefs.Add('desconto', ftFloat);
  mdItens.FieldDefs.Add('sub_total', ftFloat);
  mdItens.CreateDataSet;
  mdItens.AfterScroll := mdItensAfterScroll;
  dbItens.OnCellClick := dbItensCellClick;
  TFloatField(mdItens.FieldByName('preco')).DisplayFormat := '#,##0.00';
  TFloatField(mdItens.FieldByName('desconto')).DisplayFormat := '0.00';
  TFloatField(mdItens.FieldByName('sub_total')).DisplayFormat := '#,##0.00';
  TFloatField(mdItens.FieldByName('preco')).OnGetText := mdValorGetText;
  TFloatField(mdItens.FieldByName('desconto')).OnGetText := mdValorGetText;
  TFloatField(mdItens.FieldByName('sub_total')).OnGetText := mdValorGetText;
  AtualizarEdicaoItem;
  AtualizarResumo;
  AtualizarStatusPDV;
end;

procedure TFr_PDV.mdItensAfterScroll(DataSet: TDataSet);
begin
  if not dbItens.Focused then
    Exit;

  if (not DataSet.Active) or DataSet.IsEmpty then
  begin
    FPendenteCodigoProduto := '';
    AtualizarEdicaoItem;
    Exit;
  end;

  FPendenteCodigoProduto := DataSet.FieldByName('cod_produto').AsString;
  AtualizarEdicaoItem;
end;

procedure TFr_PDV.dbItensCellClick(Column: TColumn);
begin
  if (not mdItens.Active) or mdItens.IsEmpty then
    Exit;

  FPendenteCodigoProduto := mdItens.FieldByName('cod_produto').AsString;
  AtualizarEdicaoItem;
end;
procedure TFr_PDV.mdValorGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if Sender.FieldName = 'desconto' then
    Text := FormatFloat('#,##0.00', Sender.AsFloat)
  else
    Text := MoneyPDV(Sender.AsFloat);
end;

procedure TFr_PDV.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FNFCe);
end;

procedure TFr_PDV.FormKeyPress(Sender: TObject; var Key: Char);
var
  Proximo: TControl;
begin
  if Key = #27 then
  begin
    btCancelarClick(Self);
    Exit;
  end;

  if Key = #13 then
  begin
    if ActiveControl = edDescontoGeral then
    begin
      Key := #0;
      if edRecebido.CanFocus then
        edRecebido.SetFocus;
      Exit;
    end;

    if ActiveControl = edRecebido then
    begin
      Key := #0;
      if edCodigoBarras.CanFocus then
        edCodigoBarras.SetFocus;
      Exit;
    end;

    if Assigned(ActiveControl) and (ActiveControl is TWinControl) then
    begin
      { Reenvia um Tab pela fila de mensagens, igual ao Tab do teclado, para
        que a navegacao percorra toda a tela (inclusive entre paineis). }
      Key := #0;
      Proximo := FindNextControl(ActiveControl, True, True, False);
      if (Proximo is TWinControl) and TWinControl(Proximo).CanFocus then
        TWinControl(Proximo).SetFocus;
    end;
  end;
end;

procedure TFr_PDV.edCodigoBarrasKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    if Trim(edCodigoBarras.Text) <> '' then
    begin
      PrepararEdicaoCodigo(Trim(edCodigoBarras.Text));
    end;
  end;
end;

procedure TFr_PDV.ConfirmarItemPendente;
var
  Quantidade, Preco: string;
  Desconto: string;
begin
  if Trim(FPendenteCodigoProduto) = '' then
  begin
    edCodigoBarras.SetFocus;
    Exit;
  end;

  { AdicionarCodigoProduto atualiza os campos da tela. Preserve os valores
    digitados para que a quantidade nao volte para 1,000. }
  Quantidade := edQuantidadeItem.Text;
  Preco := edPrecoItem.Text;
  Desconto := edDescontoItem.Text;
  if not ValidarDescontoItem(ParsePDVFloat(Desconto)) then
    Exit;
  AdicionarCodigoProduto(FPendenteCodigoProduto);
  edQuantidadeItem.Text := Quantidade;
  edPrecoItem.Text := Preco;
  edDescontoItem.Text := Desconto;
  AplicarDescontoEdicao;
  LimparEditsItem;
  edCodigoBarras.Clear;
  edCodigoBarras.SetFocus;
end;

procedure TFr_PDV.edDescontoItemExit(Sender: TObject);
var
  Desconto: Double;
begin
  Desconto := ParsePDVFloat(edDescontoItem.Text);
  if not ValidarDescontoItem(Desconto) then
    Exit;
  AtualizarTotalItemEdicao;
  ConfirmarItemPendente;
end;

procedure TFr_PDV.PrepararEdicaoCodigo(const ACodigo: string);
var
  Q: TFDQuery;
  CodigoProduto, Nome: string;
  Preco: Double;
begin
  FPendenteCodigoProduto := '';
  CodigoProduto := Trim(ACodigo);
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := dao.CN;
    Q.SQL.Text :=
      'select cod_produto from produto where codigo_barra = :codigo limit 1';
    Q.ParamByName('codigo').AsString := CodigoProduto;
    Q.Open;
    if not Q.IsEmpty then
      CodigoProduto := Q.FieldByName('cod_produto').AsString
    else
    begin
      Q.Close;
      Q.SQL.Text :=
        'select cod_produto from cod_barras ' +
        'where trim(cod_barras) = trim(:codigo) limit 1';
      Q.ParamByName('codigo').AsString := CodigoProduto;
      Q.Open;
      if not Q.IsEmpty then
        CodigoProduto := Q.FieldByName('cod_produto').AsString;
    end;

    if StrToIntDef(CodigoProduto, 0) > 0 then
    begin
      Q.Close;
      Q.SQL.Text :=
        'select cod_produto from produto where cod_produto = :codigo limit 1';
      Q.ParamByName('codigo').AsInteger := StrToIntDef(CodigoProduto, 0);
      Q.Open;
      if not Q.IsEmpty then
        CodigoProduto := Q.FieldByName('cod_produto').AsString;
    end;
  finally
    Q.Free;
  end;

  if StrToIntDef(CodigoProduto, 0) <= 0 then
  begin
    ShowMessage('Produto nao encontrado pelo codigo de barras.');
    Exit;
  end;

  Q := TFDQuery.Create(nil);
  try
    Q.Connection := dao.CN;
    Q.SQL.Text :=
      'select nom_produto, coalesce(preco_venda, 0) as preco_venda ' +
      'from produto where cod_produto = :codigo and status = ''N''';
    Q.ParamByName('codigo').AsInteger := StrToIntDef(CodigoProduto, 0);
    Q.Open;
    if Q.IsEmpty then
    begin
      ShowMessage('Produto inexistente ou inativo.');
      Exit;
    end;
    Nome := Q.FieldByName('nom_produto').AsString;
    Preco := Q.FieldByName('preco_venda').AsFloat;
  finally
    Q.Free;
  end;

  if Preco <= 0 then
  begin
    ShowMessage('O produto nao possui preco de venda.');
    Exit;
  end;

  FPendenteCodigoProduto := CodigoProduto;
  edDescricaoItem.Text := Nome;
  edQuantidadeItem.Text := '1,000';
  edPrecoItem.Text := MoneyPDV(Preco);
  edDescontoItem.Text := '0,00';
  edTotalItem.Text := MoneyPDV(Preco);
  AtualizarEditsPDV;
  edQuantidadeItem.SetFocus;
end;

procedure TFr_PDV.edCodigoBarrasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F9 then
  begin
    Key := 0;
    btBuscarProdutoClick(Self);
  end;
end;

procedure TFr_PDV.edPrecoItemExit(Sender: TObject);
var
  Preco, PrecoBase, Desconto: Double;
begin
  Preco := ParsePDVFloat(edPrecoItem.Text);
  PrecoBase := 0;

  if (FNFCe <> nil) and FNFCe.mmItens.Active and
     FNFCe.mmItens.Locate('cod_produto', FPendenteCodigoProduto, []) and
     (FNFCe.mmItens.FindField('preco_base') <> nil) then
    PrecoBase := FNFCe.mmItens.FieldByName('preco_base').AsFloat;

  if PrecoBase > 0 then
  begin
    if Preco <= PrecoBase then
      Desconto := 100 - ((Preco / PrecoBase) * 100)
    else
      Desconto := 0;

    if Desconto < 0 then
      Desconto := 0;
    if Desconto > 100 then
      Desconto := 100;

    edDescontoItem.Text := DecimalPDV(Desconto);
    if not ValidarDescontoItem(Desconto) then
    begin
      edPrecoItem.Text := MoneyPDV(PrecoBase);
      edDescontoItem.Text := '0,00';
      AtualizarTotalItemEdicao;
      if edPrecoItem.CanFocus then
        edPrecoItem.SetFocus;
      Exit;
    end;
  end;

  AtualizarTotalItemEdicao;
end;
procedure TFr_PDV.edQuantidadeItemExit(Sender: TObject);
begin
  AtualizarTotalItemEdicao;
end;

procedure TFr_PDV.AdicionarCodigoProduto(const ACodigo: string);
var
  Nome: string;
  CodigoProduto: string;
  Preco, Desconto, ValorSubtotal, QuantidadeAdicionar: Double;
  Q: TFDQuery;
begin
  if Trim(ACodigo) = '' then
    Exit;
  CodigoProduto := Trim(ACodigo);
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := dao.CN;
    Q.SQL.Text := 'select cod_produto from produto where codigo_barra = :codigo limit 1';
    Q.ParamByName('codigo').AsString := CodigoProduto;
    Q.Open;
    if not Q.IsEmpty then
      CodigoProduto := Q.FieldByName('cod_produto').AsString
    else
    begin
      Q.Close;
      Q.SQL.Text :=
        'select cod_produto from cod_barras ' +
        'where trim(cod_barras) = trim(:codigo) limit 1';
      Q.ParamByName('codigo').AsString := CodigoProduto;
      Q.Open;
      if not Q.IsEmpty then
        CodigoProduto := Q.FieldByName('cod_produto').AsString;
    end;

    if StrToIntDef(CodigoProduto, 0) > 0 then
    begin
      Q.Close;
      Q.SQL.Text := 'select cod_produto from produto where cod_produto = :codigo limit 1';
      Q.ParamByName('codigo').AsInteger := StrToIntDef(CodigoProduto, 0);
      Q.Open;
      if not Q.IsEmpty then
        CodigoProduto := Q.FieldByName('cod_produto').AsString;
    end;
  finally
    Q.Free;
  end;
  if StrToIntDef(CodigoProduto, 0) <= 0 then
  begin
    ShowMessage('Produto nao encontrado pelo codigo de barras.');
    Exit;
  end;

  Q := TFDQuery.Create(nil);
  try
    Q.Connection := dao.CN;
    Q.SQL.Text :=
      'select nom_produto, coalesce(preco_venda, 0) as preco_venda ' +
      'from produto where cod_produto = :codigo and status = ''N''';
    Q.ParamByName('codigo').AsInteger := StrToIntDef(CodigoProduto, 0);
    Q.Open;
    if Q.IsEmpty then
    begin
      ShowMessage('Produto inexistente ou inativo.');
      Exit;
    end;
    Nome := Q.FieldByName('nom_produto').AsString;
    Preco := Q.FieldByName('preco_venda').AsFloat;
  finally
    Q.Free;
  end;

  if Preco <= 0 then
  begin
    ShowMessage('O produto nao possui preco de venda.');
    Exit;
  end;

  QuantidadeAdicionar := ParsePDVFloat(edQuantidadeItem.Text);
  if QuantidadeAdicionar <= 0 then
    QuantidadeAdicionar := 1;

  if FNFCe = nil then
    CriarDocumento;
  if not FNFCe.mmItens.Active then
    FNFCe.mmItens.Open;
  if FNFCe.mmItens.Locate('cod_produto', CodigoProduto, []) then
  begin
    FNFCe.mmItens.Edit;
    FNFCe.mmItens.FieldByName('qtd').AsFloat :=
      FNFCe.mmItens.FieldByName('qtd').AsFloat + QuantidadeAdicionar;
    Desconto := FNFCe.mmItens.FieldByName('desconto').AsFloat;
    FNFCe.mmItens.FieldByName('sub_total').AsFloat :=
      FNFCe.mmItens.FieldByName('qtd').AsFloat *
      FNFCe.mmItens.FieldByName('preco').AsFloat *
      (1 - (Desconto / 100));
    FNFCe.mmItens.FieldByName('sub_total_bruto').AsFloat :=
      FNFCe.mmItens.FieldByName('qtd').AsFloat *
      FNFCe.mmItens.FieldByName('preco_base').AsFloat;
    FNFCe.mmItens.Post;

    if mdItens.Locate('cod_produto', CodigoProduto, []) then
    begin
      mdItens.Edit;
      mdItens.FieldByName('qtd').AsFloat :=
        mdItens.FieldByName('qtd').AsFloat + QuantidadeAdicionar;
      mdItens.FieldByName('sub_total').AsFloat :=
        mdItens.FieldByName('qtd').AsFloat *
        mdItens.FieldByName('preco').AsFloat *
        (1 - (mdItens.FieldByName('desconto').AsFloat / 100));
      mdItens.Post;
    end;
    RecalcularTotaisPDV;
    AtualizarEdicaoItem;
    Exit;
  end;

  ValorSubtotal := QuantidadeAdicionar * Preco;
  FNFCe.mmItens.Append;
  FNFCe.mmItens.FieldByName('cod_produto').AsInteger := StrToIntDef(CodigoProduto, 0);
  FNFCe.mmItens.FieldByName('nom_produto').AsString := Nome;
  FNFCe.mmItens.FieldByName('preco_base').AsFloat := Preco;
  FNFCe.mmItens.FieldByName('preco').AsFloat := Preco;
  FNFCe.mmItens.FieldByName('qtd').AsFloat := QuantidadeAdicionar;
  FNFCe.mmItens.FieldByName('desconto').AsFloat := 0;
  FNFCe.mmItens.FieldByName('sub_total').AsFloat := ValorSubtotal;
  FNFCe.mmItens.FieldByName('sub_total_bruto').AsFloat :=
    QuantidadeAdicionar * Preco;
  FNFCe.mmItens.Post;

  mdItens.Append;
  mdItens.FieldByName('cod_produto').AsString := CodigoProduto;
  mdItens.FieldByName('nom_produto').AsString := Nome;
  mdItens.FieldByName('qtd').AsFloat := QuantidadeAdicionar;
  mdItens.FieldByName('preco').AsFloat := Preco;
  mdItens.FieldByName('desconto').AsFloat := 0;
  mdItens.FieldByName('sub_total').AsFloat := ValorSubtotal;
  mdItens.Post;
  RecalcularTotaisPDV;
  AtualizarEdicaoItem;
end;

procedure TFr_PDV.RecalcularTotaisPDV;
var
  DescontoGeral: Double;
begin
  FQuantidadePDV := 0;
  FSubtotalPDV := 0;
  if not mdItens.Active then
  begin
    FTotalPDV := 0;
    Exit;
  end;
  mdItens.First;
  while not mdItens.Eof do
  begin
    FQuantidadePDV := FQuantidadePDV + mdItens.FieldByName('qtd').AsFloat;
    FSubtotalPDV := FSubtotalPDV + mdItens.FieldByName('sub_total').AsFloat;
    mdItens.Next;
  end;
  DescontoGeral := ParsePDVFloat(edDescontoGeral.Text);
  if DescontoGeral < 0 then
    DescontoGeral := 0;
  if DescontoGeral > FSubtotalPDV then
    DescontoGeral := FSubtotalPDV;
  FDescontoGeralPDV := DescontoGeral;
  FTotalPDV := FSubtotalPDV - FDescontoGeralPDV;
  AtualizarResumo;
  AtualizarBotoesPDV;
end;

procedure TFr_PDV.CriarDocumento;
begin
  if FNFCe <> nil then
    Exit;
  FNFCe := TFr_nfce_simplificado.Create(Self);
  FNFCe.PrepararPDV;
  FNFCe.Prcod_cliente.Text := Trim(Prcod_cliente.Text);
  if FNFCe.Prcod_cliente.Text = '' then
    FNFCe.Prcod_cliente.Text := '0';
  FNFCe.Prcod_fop.Text := CodigoFormaPagamento;
  FNFCe.Prcod_prazo_pgto.Text := CodigoPrazo;
  FNFCe.Prcod_representante.Text := Trim(Prcod_representante.Text);
end;

procedure TFr_PDV.btBuscarProdutoClick(Sender: TObject);
var
  CamposCombo: array of string;
  I: Integer;
  ChamouFormOld, ChamouPesquisaOld, ChamouCadastroOld: string;
begin
  if not Assigned(Fr_localizar) then
    Application.CreateForm(TFr_localizar, Fr_localizar);
  try
    ChamouFormOld := chamou_form;
    ChamouPesquisaOld := chamou_pesquisa;
    ChamouCadastroOld := chamou_cadastro;

    Fr_localizar.Caption := 'Localizar Produto';
    chamou_pesquisa := 'fr_produto';
    chamou_form := 'fr_pdv_produto';
    chamou_cadastro := 'Fr_produto';
    Fr_localizar.BT_cadastro.Visible := True;

    Fr_localizar.CBcampos.Items.Clear;
    SetLength(CamposCombo, 2);
    CamposCombo[0] := 'Codigo';
    CamposCombo[1] := 'Nome';
    for I := 0 to High(CamposCombo) do
      Fr_localizar.CBcampos.Items.Add(CamposCombo[I]);
    Fr_localizar.CBcampos.ItemIndex := 1;
    Fr_localizar.ShowModal;

    if not Fr_localizar.mmLocalizar.IsEmpty then
    begin
      edCodigoBarras.Text :=
        Fr_localizar.mmLocalizar.FieldByName('cod_produto').AsString;
      PrepararEdicaoCodigo(edCodigoBarras.Text);
    end;
  finally
    if Assigned(Fr_localizar) then
    begin
      Fr_localizar.Free;
      Fr_localizar := nil;
    end;
    chamou_form := ChamouFormOld;
    chamou_pesquisa := ChamouPesquisaOld;
    chamou_cadastro := ChamouCadastroOld;
  end;
  edCodigoBarras.Clear;
  if (Trim(FPendenteCodigoProduto) <> '') and edQuantidadeItem.CanFocus then
  begin
    edQuantidadeItem.SetFocus;
    edQuantidadeItem.SelectAll;
  end
  else if edCodigoBarras.CanFocus then
    edCodigoBarras.SetFocus;
end;

procedure TFr_PDV.btBuscarClienteClick(Sender: TObject);
var
  CamposCombo: array of string;
  I: Integer;
  ChamouFormOld, ChamouPesquisaOld, ChamouCadastroOld: string;
begin
  if not Assigned(Fr_localizar) then
    Application.CreateForm(TFr_localizar, Fr_localizar);
  try
    ChamouFormOld := chamou_form;
    ChamouPesquisaOld := chamou_pesquisa;
    ChamouCadastroOld := chamou_cadastro;

    Fr_localizar.Caption := 'Localizar Cliente';
    chamou_pesquisa := 'fr_cliente';
    chamou_form := 'fr_pdv_cliente';
    chamou_cadastro := 'Fr_cliente';
    Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cliente';
    Fr_localizar.BT_cadastro.Visible := True;

    Fr_localizar.CBcampos.Items.Clear;
    SetLength(CamposCombo, 6);
    CamposCombo[0] := 'Codigo';
    CamposCombo[1] := 'Raz' + #227 + 'o Social';
    CamposCombo[2] := 'Nome Fantasia';
    CamposCombo[3] := 'CNPJ';
    CamposCombo[4] := 'CPF';
    CamposCombo[5] := 'Cidade';
    for I := 0 to High(CamposCombo) do
      Fr_localizar.CBcampos.Items.Add(CamposCombo[I]);
    Fr_localizar.CBcampos.ItemIndex := 1;
    Fr_localizar.ShowModal;

    if not Fr_localizar.mmLocalizar.IsEmpty then
    begin
      Prcod_cliente.Text := Fr_localizar.mmLocalizar.FieldByName('cod_cliente').AsString;
      LbNomCliente.Caption := Fr_localizar.mmLocalizar.FieldByName('nom_cliente').AsString;
    end;
  finally
    if Assigned(Fr_localizar) then
    begin
      Fr_localizar.Free;
      Fr_localizar := nil;
    end;
    chamou_form := ChamouFormOld;
    chamou_pesquisa := ChamouPesquisaOld;
    chamou_cadastro := ChamouCadastroOld;
  end;
  Prcod_cliente.SetFocus;
end;

procedure TFr_PDV.PrcodClienteExit(Sender: TObject);
var
  Q: TFDQuery;
begin
  LbNomCliente.Caption := '';
  if Trim(Prcod_cliente.Text) = '' then
    Exit;
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := dao.CN;
    Q.SQL.Text := 'select nom_cliente from cliente where cod_cliente = :cod';
    Q.ParamByName('cod').AsInteger := StrToIntDef(Trim(Prcod_cliente.Text), 0);
    Q.Open;
    if not Q.IsEmpty then
      LbNomCliente.Caption := Q.FieldByName('nom_cliente').AsString;
  finally
    Q.Free;
  end;
end;

procedure TFr_PDV.btBuscarRepresentanteClick(Sender: TObject);
var
  CamposCombo: array of string;
  I: Integer;
  ChamouFormOld, ChamouPesquisaOld, ChamouCadastroOld: string;
begin
  if not Assigned(Fr_localizar) then
    Application.CreateForm(TFr_localizar, Fr_localizar);
  try
    ChamouFormOld := chamou_form;
    ChamouPesquisaOld := chamou_pesquisa;
    ChamouCadastroOld := chamou_cadastro;
    Fr_localizar.Caption := 'Localizar Representante';
    chamou_pesquisa := 'fr_representante';
    chamou_form := 'fr_pdv_representante';
    chamou_cadastro := 'Fr_representante';
    Fr_localizar.BT_cadastro.Visible := True;
    Fr_localizar.CBcampos.Items.Clear;
    SetLength(CamposCombo, 2);
    CamposCombo[0] := 'C' + #243 + 'digo';
    CamposCombo[1] := 'Nome';
    for I := 0 to High(CamposCombo) do
      Fr_localizar.CBcampos.Items.Add(CamposCombo[I]);
    Fr_localizar.CBcampos.ItemIndex := 1;
    Fr_localizar.ShowModal;
    if not Fr_localizar.mmLocalizar.IsEmpty then
    begin
      Prcod_representante.Text :=
        Fr_localizar.mmLocalizar.FieldByName('id').AsString;
      PrcodRepresentanteExit(Self);
    end;
  finally
    chamou_form := ChamouFormOld;
    chamou_pesquisa := ChamouPesquisaOld;
    chamou_cadastro := ChamouCadastroOld;
    if Assigned(Fr_localizar) then
    begin
      Fr_localizar.Free;
      Fr_localizar := nil;
    end;
  end;
  Prcod_representante.SetFocus;
end;

procedure TFr_PDV.PrcodRepresentanteExit(Sender: TObject);
var
  Q: TFDQuery;
begin
  LbNomRepresentante.Caption := '';
  if Trim(Prcod_representante.Text) = '' then
    Exit;
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := dao.CN;
    Q.SQL.Text := 'select nom_representante from representante where id = :id';
    Q.ParamByName('id').AsInteger :=
      StrToIntDef(Trim(Prcod_representante.Text), 0);
    Q.Open;
    if not Q.IsEmpty then
      LbNomRepresentante.Caption := Q.FieldByName('nom_representante').AsString;
  finally
    Q.Free;
  end;
end;

procedure TFr_PDV.btBuscarFopClick(Sender: TObject);
var
  CamposCombo: array of string;
  I: Integer;
  ChamouFormOld, ChamouPesquisaOld, ChamouCadastroOld: string;
begin
  if not Assigned(Fr_localizar) then
    Application.CreateForm(TFr_localizar, Fr_localizar);
  try
    ChamouFormOld := chamou_form;
    ChamouPesquisaOld := chamou_pesquisa;
    ChamouCadastroOld := chamou_cadastro;
    Fr_localizar.Caption := 'Localizar Forma de Pagamento';
    chamou_pesquisa := 'fr_fop';
    chamou_form := 'fr_pdv_fop';
    chamou_cadastro := 'fr_fop';
    Fr_localizar.BT_cadastro.Visible := True;
    Fr_localizar.CBcampos.Items.Clear;
    SetLength(CamposCombo, 2);
    CamposCombo[0] := 'C' + #243 + 'digo';
    CamposCombo[1] := 'Nome';
    for I := 0 to High(CamposCombo) do
      Fr_localizar.CBcampos.Items.Add(CamposCombo[I]);
    Fr_localizar.CBcampos.ItemIndex := 1;
    Fr_localizar.ShowModal;
    if not Fr_localizar.mmLocalizar.IsEmpty then
    begin
      Prcod_fop.Text := Fr_localizar.mmLocalizar.FieldByName('cod_fop').AsString;
      PrcodFopExit(Self);
    end;
  finally
    if Assigned(Fr_localizar) then
    begin
      Fr_localizar.Free;
      Fr_localizar := nil;
    end;
    chamou_form := ChamouFormOld;
    chamou_pesquisa := ChamouPesquisaOld;
    chamou_cadastro := ChamouCadastroOld;
  end;
  Prcod_fop.SetFocus;
end;

procedure TFr_PDV.PrcodFopKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #13]) then
  begin
    Beep;
    Key := #0;
    Exit;
  end;
  if Key = #13 then
  begin
    Key := #0;
    if Trim(Prcod_fop.Text) = '' then
      btBuscarFopClick(Self)
    else
      PrcodFopExit(Self);
  end;
end;

procedure TFr_PDV.PrcodFopExit(Sender: TObject);
var
  Q: TFDQuery;
begin
  LbNomFop.Caption := '';
  if Trim(Prcod_fop.Text) = '' then
  begin
    Prcod_prazo_pgto.Enabled := True;
    Exit;
  end;
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := dao.CN;
    Q.SQL.Text :=
      'select nom_fop ' +
      'from fop where ativo = ''S'' and cod_fop = :cod';
    Q.ParamByName('cod').AsInteger := StrToIntDef(Trim(Prcod_fop.Text), 0);
    Q.Open;
    if Q.IsEmpty then
    begin
      Prcod_fop.Clear;
      Prcod_prazo_pgto.Clear;
      LbNomPrazo.Caption := '';
      Prcod_prazo_pgto.Enabled := True;
      Exit;
    end;
    LbNomFop.Caption := Q.FieldByName('nom_fop').AsString;
  finally
    Q.Free;
  end;
  AplicarPrazoFormaPgto;
end;

function TFr_PDV.CountPrazosFormaPgto(const ACodFop: Integer): Integer;
var
  Q: TFDQuery;
begin
  Result := 0;
  if ACodFop <= 0 then
    Exit;
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := dao.CN;
    Q.SQL.Text :=
      'select count(*) as total from fop_prazo where cod_fop = :cod_fop';
    Q.ParamByName('cod_fop').AsInteger := ACodFop;
    Q.Open;
    Result := Q.FieldByName('total').AsInteger;
  finally
    Q.Free;
  end;
end;

function TFr_PDV.PrazoPertenceFormaPgto(const ACodFop,
  ACodPrazo: Integer): Boolean;
var
  Q: TFDQuery;
begin
  Result := False;
  if (ACodFop <= 0) or (ACodPrazo <= 0) then
    Exit;
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := dao.CN;
    Q.SQL.Text :=
      'select 1 from fop_prazo ' +
      'where cod_fop = :cod_fop and id_prazo = :id_prazo limit 1';
    Q.ParamByName('cod_fop').AsInteger := ACodFop;
    Q.ParamByName('id_prazo').AsInteger := ACodPrazo;
    Q.Open;
    Result := not Q.IsEmpty;
  finally
    Q.Free;
  end;
end;

procedure TFr_PDV.AplicarPrazoFormaPgto;
var
  Q: TFDQuery;
  TotalPrazos: Integer;
begin
  TotalPrazos := CountPrazosFormaPgto(
    StrToIntDef(Trim(Prcod_fop.Text), 0));

  Prcod_prazo_pgto.Enabled := True;
  if TotalPrazos <= 0 then
  begin
    PrcodPrazoExit(Self);
    Exit;
  end;

  if TotalPrazos > 1 then
  begin
    if (StrToIntDef(Trim(Prcod_prazo_pgto.Text), 0) > 0) and
       (not PrazoPertenceFormaPgto(
         StrToIntDef(Trim(Prcod_fop.Text), 0),
         StrToIntDef(Trim(Prcod_prazo_pgto.Text), 0))) then
    begin
      Prcod_prazo_pgto.Clear;
      LbNomPrazo.Caption := '';
    end;
    Exit;
  end;

  Q := TFDQuery.Create(nil);
  try
    Q.Connection := dao.CN;
    Q.SQL.Text :=
      'select p.id, p.prazo from fop_prazo fp ' +
      'inner join prazo p on p.id = fp.id_prazo ' +
      'where fp.cod_fop = :cod_fop limit 1';
    Q.ParamByName('cod_fop').AsInteger :=
      StrToIntDef(Trim(Prcod_fop.Text), 0);
    Q.Open;
    if not Q.IsEmpty then
    begin
      Prcod_prazo_pgto.Text := Q.FieldByName('id').AsString;
      LbNomPrazo.Caption := Q.FieldByName('prazo').AsString;
      Prcod_prazo_pgto.Enabled := False;
    end;
  finally
    Q.Free;
  end;
end;

procedure TFr_PDV.btBuscarPrazoClick(Sender: TObject);
var
  CamposCombo: array of string;
  I: Integer;
  ChamouFormOld, ChamouPesquisaOld, ChamouCadastroOld: string;
begin
  if not Assigned(Fr_localizar) then
    Application.CreateForm(TFr_localizar, Fr_localizar);
  try
    ChamouFormOld := chamou_form;
    ChamouPesquisaOld := chamou_pesquisa;
    ChamouCadastroOld := chamou_cadastro;
    Fr_localizar.Caption := 'Localizar Prazo';
    chamou_pesquisa := 'fr_prazo';
    chamou_form := 'fr_pdv_prazo';
    chamou_cadastro := 'fr_prazo';
    Fr_localizar.BT_cadastro.Visible := True;
    Fr_localizar.CBcampos.Items.Clear;
    SetLength(CamposCombo, 2);
    CamposCombo[0] := 'C' + #243 + 'digo';
    CamposCombo[1] := 'Descri' + #231 + #227 + 'o';
    for I := 0 to High(CamposCombo) do
      Fr_localizar.CBcampos.Items.Add(CamposCombo[I]);
    Fr_localizar.CBcampos.ItemIndex := 1;
    Fr_localizar.ShowModal;
    if not Fr_localizar.mmLocalizar.IsEmpty then
    begin
      Prcod_prazo_pgto.Text := Fr_localizar.mmLocalizar.FieldByName('id').AsString;
      PrcodPrazoExit(Self);
    end;
  finally
    if Assigned(Fr_localizar) then
    begin
      Fr_localizar.Free;
      Fr_localizar := nil;
    end;
    chamou_form := ChamouFormOld;
    chamou_pesquisa := ChamouPesquisaOld;
    chamou_cadastro := ChamouCadastroOld;
  end;
  Prcod_prazo_pgto.SetFocus;
end;

procedure TFr_PDV.PrcodPrazoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #13]) then
  begin
    Beep;
    Key := #0;
    Exit;
  end;
  if Key = #13 then
  begin
    Key := #0;
    if Trim(Prcod_prazo_pgto.Text) = '' then
      btBuscarPrazoClick(Self)
    else
      PrcodPrazoExit(Self);
  end;
end;

procedure TFr_PDV.PrcodPrazoExit(Sender: TObject);
var
  Q: TFDQuery;
  CodFop, CodPrazo: Integer;
begin
  LbNomPrazo.Caption := '';
  if Trim(Prcod_prazo_pgto.Text) = '' then
    Exit;

  CodFop := StrToIntDef(Trim(Prcod_fop.Text), 0);
  CodPrazo := StrToIntDef(Trim(Prcod_prazo_pgto.Text), 0);
  if (CountPrazosFormaPgto(CodFop) > 0) and
     (not PrazoPertenceFormaPgto(CodFop, CodPrazo)) then
  begin
    Prcod_prazo_pgto.Clear;
    Exit;
  end;

  Q := TFDQuery.Create(nil);
  try
    Q.Connection := dao.CN;
    Q.SQL.Text := 'select prazo from prazo where ativo = ''S'' and id = :id';
    Q.ParamByName('id').AsInteger := CodPrazo;
    Q.Open;
    if not Q.IsEmpty then
      LbNomPrazo.Caption := Q.FieldByName('prazo').AsString;
  finally
    Q.Free;
  end;
end;

function TFr_PDV.CodigoFormaPagamento: string;
begin
  Result := Trim(Prcod_fop.Text);
end;

function TFr_PDV.CodigoPrazo: string;
begin
  Result := Trim(Prcod_prazo_pgto.Text);
end;

procedure TFr_PDV.AtualizarDocumento;
begin
  if FNFCe = nil then
    CriarDocumento;
  FNFCe.Prcod_cliente.Text := Trim(Prcod_cliente.Text);
  if FNFCe.Prcod_cliente.Text = '' then
    FNFCe.Prcod_cliente.Text := '0';
  FNFCe.Prcod_fop.Text := CodigoFormaPagamento;
  FNFCe.Prcod_prazo_pgto.Text := CodigoPrazo;
  FNFCe.Prcod_representante.Text := Trim(Prcod_representante.Text);
end;

procedure TFr_PDV.AtualizarResumo;
var
  ValorTroco: Double;
begin
  ValorTroco := ParsePDVFloat(edRecebido.Text) - FTotalPDV;
  if ValorTroco < 0 then
    ValorTroco := 0;
  lbItens.Caption := 'Itens: ' + IntToStr(mdItens.RecordCount);
  lbQuantidade.Caption := 'Quantidade: ' + FormatFloat('#,##0.00', FQuantidadePDV);
  lbSubtotal.Caption := 'Subtotal: ' + MoneyPDV(FSubtotalPDV);
  lbDesconto.Caption := 'Desconto: ' + MoneyPDV(FSubtotalPDV - FTotalPDV);
  lbTotal.Caption := MoneyPDV(FTotalPDV);
  lbTrocoValor.Caption := MoneyPDV(ValorTroco);
end;
procedure TFr_PDV.AtualizarStatusPDV;
begin
  if FFaturado then
  begin
    lbStatusRodape.Caption := 'Status: Faturado';
    lbStatusRodape.Font.Color := clYellow;
  end
  else
  begin
    lbStatusRodape.Caption := 'Status: Em aberto';
    lbStatusRodape.Font.Color := clWhite;
  end;
  AtualizarBotoesPDV;
end;

procedure TFr_PDV.AtualizarBotoesPDV;
var
  TemItens, PodeEditar: Boolean;
begin
  TemItens := Assigned(mdItens) and mdItens.Active and (not mdItens.IsEmpty);
  PodeEditar := FEmEdicao and (not FFaturado);

  btNovo.Enabled := (not FEmEdicao) or FFaturado;
  btLocalizarPedido.Enabled := (not FEmEdicao) or FFaturado;
  btCancelar.Enabled := PodeEditar;
  btExcluirItem.Enabled := PodeEditar and TemItens;
  btFinalizar.Enabled := PodeEditar and TemItens;
  btEmitirNFCe.Enabled := PodeEditar and TemItens and (Trim(FNumDoc) <> '');
  btDANFCe.Enabled := (Trim(FNumDoc) <> '') and FFaturado;
  AtualizarEditsPDV;
end;

procedure TFr_PDV.AtualizarEditsPDV;
var
  PodeEditar, TemItemEmEdicao: Boolean;
begin
  PodeEditar := FEmEdicao and (not FFaturado);
  TemItemEmEdicao := PodeEditar and (Trim(FPendenteCodigoProduto) <> '');

  edCodigoBarras.Enabled := PodeEditar;
  edDescricaoItem.Enabled := False;
  edQuantidadeItem.Enabled := TemItemEmEdicao;
  edPrecoItem.Enabled := TemItemEmEdicao;
  edDescontoItem.Enabled := TemItemEmEdicao;
  edTotalItem.Enabled := False;
  edDescontoGeral.Enabled := PodeEditar and
    Assigned(mdItens) and mdItens.Active and (not mdItens.IsEmpty);
  edRecebido.Enabled := PodeEditar;

  Prcod_cliente.Enabled := PodeEditar;
  Prcod_representante.Enabled := PodeEditar;
  Prcod_fop.Enabled := PodeEditar;
  if not PodeEditar then
    Prcod_prazo_pgto.Enabled := False
  else if Trim(Prcod_fop.Text) = '' then
    Prcod_prazo_pgto.Enabled := True;
end;

procedure TFr_PDV.AtualizarEdicaoItem;
begin
  if not mdItens.Active or mdItens.IsEmpty then
  begin
    edDescricaoItem.Clear;
    edQuantidadeItem.Text := '0,000';
    edPrecoItem.Text := MoneyPDV(0);
    edDescontoItem.Text := '0,00';
    edTotalItem.Text := MoneyPDV(0);
    AtualizarEditsPDV;
    Exit;
  end;
  edDescricaoItem.Text := mdItens.FieldByName('nom_produto').AsString;
  edQuantidadeItem.Text := FormatFloat('#,##0.000',
    mdItens.FieldByName('qtd').AsFloat);
  edPrecoItem.Text := MoneyPDV(mdItens.FieldByName('preco').AsFloat);
  edDescontoItem.Text := FormatFloat('#,##0.00',
    mdItens.FieldByName('desconto').AsFloat);
  edTotalItem.Text := MoneyPDV(mdItens.FieldByName('sub_total').AsFloat);
  AtualizarEditsPDV;
end;

procedure TFr_PDV.LimparEditsItem;
begin
  edDescricaoItem.Clear;
  edQuantidadeItem.Clear;
  edPrecoItem.Clear;
  edDescontoItem.Clear;
  edTotalItem.Clear;
  FPendenteCodigoProduto := '';
  AtualizarEditsPDV;
end;

procedure TFr_PDV.AtualizarTotalItemEdicao;
var
  Quantidade, Preco, Desconto: Double;
begin
  if Trim(FPendenteCodigoProduto) = '' then
    Exit;

  Quantidade := ParsePDVFloat(edQuantidadeItem.Text);
  Preco := ParsePDVFloat(edPrecoItem.Text);
  Desconto := ParsePDVFloat(edDescontoItem.Text);

  if Quantidade < 0 then
    Quantidade := 0;
  if Desconto < 0 then
    Desconto := 0;
  if Desconto > 100 then
    Desconto := 100;

  edTotalItem.Text := MoneyPDV(Quantidade * Preco * (1 - (Desconto / 100)));
end;

function TFr_PDV.ObterDescontoMaximoItem: Double;
var
  Q: TFDQuery;
  DescontoProduto, DescontoCliente: Double;
  PrecoVenda, PrecoPromocao: Double;
begin
  Result := 0;
  if StrToIntDef(Trim(FPendenteCodigoProduto), 0) <= 0 then
    Exit;

  DescontoProduto := 0;
  DescontoCliente := 100;
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := dao.CN;
    Q.SQL.Text :=
      'select coalesce(c.desconto_maximo, 100) as desconto_cliente, ' +
      '       coalesce(p.promocao, ''N'') as promocao, ' +
      '       coalesce((select pr.desconto_maximo from produto_representante pr ' +
      '          where pr.cod_produto = p.cod_produto and pr.id_representante = :cod_rep limit 1), ' +
      '         coalesce((select gr.desconto_maximo from grupo_representante gr ' +
      '          where gr.cod_grupo = p.cod_grupo and gr.id_representante = :cod_rep limit 1), ' +
      '           coalesce(p.desconto_maximo, 0))) as desconto_produto, ' +
      '       coalesce(p.preco_venda, 0) as preco_venda, ' +
      '       coalesce(p.preco_promocao, 0) as preco_promocao ' +
      'from produto p ' +
      'left join cliente c on c.cod_cliente = :cod_cliente ' +
      'where p.cod_produto = :cod_produto';
    Q.ParamByName('cod_cliente').AsInteger := StrToIntDef(Trim(Prcod_cliente.Text), 0);
    Q.ParamByName('cod_produto').AsInteger := StrToIntDef(Trim(FPendenteCodigoProduto), 0);
    Q.ParamByName('cod_rep').AsInteger := StrToIntDef(Trim(Prcod_representante.Text), 0);
    Q.Open;
    if not Q.IsEmpty then
    begin
      PrecoVenda := Q.FieldByName('preco_venda').AsFloat;
      PrecoPromocao := Q.FieldByName('preco_promocao').AsFloat;
      if (Q.FieldByName('promocao').AsString = 'S') and (PrecoVenda > 0) then
        DescontoProduto := ((PrecoVenda - PrecoPromocao) / PrecoVenda) * 100
      else
        DescontoProduto := Q.FieldByName('desconto_produto').AsFloat;
      DescontoCliente := Q.FieldByName('desconto_cliente').AsFloat;
    end;
  finally
    Q.Free;
  end;

  Result := DescontoProduto;
  if Result > DescontoCliente then
    Result := DescontoCliente;
  if Result < 0 then
    Result := 0;
end;

function TFr_PDV.ValidarDescontoItem(const ADesconto: Double): Boolean;
var
  DescontoMaximo: Double;
begin
  Result := True;
  DescontoMaximo := ObterDescontoMaximoItem;
  if RoundTo(ADesconto, -2) > RoundTo(DescontoMaximo, -2) then
  begin
    ShowMessage('Desconto superior ao permitido para este produto. Maximo: ' +
      DecimalPDV(DescontoMaximo) + '%');
    edDescontoItem.Text := DecimalPDV(DescontoMaximo);
    AtualizarTotalItemEdicao;
    if edDescontoItem.CanFocus then
      edDescontoItem.SetFocus;
    Result := False;
  end;
end;
procedure TFr_PDV.AplicarDescontoEdicao;
var
  Desconto, Quantidade, Preco: Double;
begin
  Quantidade := ParsePDVFloat(edQuantidadeItem.Text);
  if Quantidade <= 0 then
    Quantidade := 1;
  Preco := ParsePDVFloat(edPrecoItem.Text);
  if Preco <= 0 then
    Exit;
  Desconto := ParsePDVFloat(edDescontoItem.Text);
  if Desconto < 0 then
    Desconto := 0;
  if Desconto > 100 then
    Desconto := 100;

  if not ValidarDescontoItem(Desconto) then
    Exit;
  if mdItens.Locate('cod_produto', FPendenteCodigoProduto, []) then
  begin
    mdItens.Edit;
    mdItens.FieldByName('qtd').AsFloat := Quantidade;
    mdItens.FieldByName('preco').AsFloat := Preco;
    mdItens.FieldByName('desconto').AsFloat := Desconto;
    mdItens.FieldByName('sub_total').AsFloat :=
      Quantidade * Preco * (1 - (Desconto / 100));
    mdItens.Post;
  end;

  if (FNFCe <> nil) and FNFCe.mmItens.Locate(
    'cod_produto', FPendenteCodigoProduto, []) then
  begin
    FNFCe.mmItens.Edit;
    FNFCe.mmItens.FieldByName('qtd').AsFloat := Quantidade;
    FNFCe.mmItens.FieldByName('preco').AsFloat := Preco;
    FNFCe.mmItens.FieldByName('preco_base').AsFloat := Preco;
    FNFCe.mmItens.FieldByName('desconto').AsFloat := Desconto;
    FNFCe.mmItens.FieldByName('sub_total').AsFloat :=
      Quantidade * Preco * (1 - (Desconto / 100));
    FNFCe.mmItens.FieldByName('sub_total_bruto').AsFloat :=
      Quantidade * Preco;
    FNFCe.mmItens.Post;
  end;

  RecalcularTotaisPDV;
  AtualizarEdicaoItem;
end;

procedure TFr_PDV.edRecebidoChange(Sender: TObject);
begin
  AtualizarResumo;
end;

procedure TFr_PDV.edRecebidoExit(Sender: TObject);
begin
  edRecebido.Text := DecimalPDV(ParsePDVFloat(edRecebido.Text));
  AtualizarResumo;
end;

procedure TFr_PDV.edDescontoGeralChange(Sender: TObject);
begin
  RecalcularTotaisPDV;
end;

procedure TFr_PDV.edDescontoGeralExit(Sender: TObject);
begin
  edDescontoGeral.Text := DecimalPDV(ParsePDVFloat(edDescontoGeral.Text));
  RecalcularTotaisPDV;
end;

function TFr_PDV.GravarDocumentoPDV: Boolean;
var
  Q: TFDQuery;
  CodCliente, CodRepresentante, CodFop, CodPrazo: string;
  QuantidadeItem, PrecoItem, DescontoItem: Double;
  SubtotalItem, SubtotalBrutoItem: Double;
  DescontoItemValor, DescontoGeralItem, DescontoGeralRestante: Double;
  Processo: string;
  PercentualDescontoGeral: Double;
  ValorPago, ValorTroco: Double;
  ItensGravados: Integer;
  DocumentoExistente: Boolean;
begin
  Result := False;
  DocumentoExistente := Trim(FNumDoc) <> '';
  ItensGravados := 0;
  if mdItens.IsEmpty then
    Exit;
  if DocumentoExistente and FFaturado then
  begin
    ShowMessage('A venda esta faturada e nao pode ser alterada.');
    Exit;
  end;

  if FNFCe = nil then
    CriarDocumento;
  AtualizarDocumento;

  CodCliente := Trim(Prcod_cliente.Text);
  if CodCliente = '' then
    CodCliente := '0';
  CodRepresentante := Trim(Prcod_representante.Text);
  CodFop := Trim(FNFCe.Prcod_fop.Text);
  CodPrazo := Trim(FNFCe.Prcod_prazo_pgto.Text);

  if CodRepresentante = '' then
  begin
    ShowMessage('Informe o representante.');
    Exit;
  end;
  if CodFop = '' then
  begin
    ShowMessage('Informe a forma de pagamento.');
    Exit;
  end;
  if CodPrazo = '' then
  begin
    ShowMessage('Informe o prazo.');
    Exit;
  end;

  ValorPago := ParsePDVFloat(edRecebido.Text);
  ValorTroco := ValorPago - FTotalPDV;
  if ValorTroco < 0 then
    ValorTroco := 0;

  if FSubtotalPDV > 0 then
    PercentualDescontoGeral :=
      (FDescontoGeralPDV / FSubtotalPDV) * 100
  else
    PercentualDescontoGeral := 0;

  Q := TFDQuery.Create(nil);
  try
    Q.Connection := dao.CN;
    if not dao.CN.InTransaction then
      dao.CN.StartTransaction;
    try
      if DocumentoExistente then
      begin
        Q.SQL.Text :=
          'update vendas1 set cod_empresa = :cod_empresa, cod_usuario = :cod_usuario, ' +
          'dtadoc = :dtadoc, dta_emissao = :dta_emissao, dta_saida = :dta_saida, ' +
          'empresa_faturar = :empresa_faturar, cod_cliente = :cod_cliente, ' +
          'cod_representante = :cod_representante, cod_fop = :cod_fop, ' +
          'cod_prazo_pgto = :cod_prazo_pgto, tot_bruto = :tot_bruto, ' +
          'tot_liquido = :tot_liquido, desconto = :desconto, ' +
          'vlr_desconto_geral = :vlr_desconto_geral, valor_pago = :valor_pago, ' +
          'valor_troco = :valor_troco, modelo_documento = 65, ' +
          'serie_documento = 1 where numdoc = :numdoc';
        Q.ParamByName('numdoc').AsInteger := StrToIntDef(FNumDoc, 0);
      end
      else
      begin
        Q.SQL.Text :=
          'insert into vendas1 (cod_empresa, cod_usuario, dtadoc, dta_emissao, dta_saida, ' +
          'empresa_faturar, cod_cliente, cod_representante, cod_fop, cod_prazo_pgto, orcamento, ' +
          'faturado, tot_bruto, tot_liquido, desconto, vlr_desconto_geral, valor_pago, ' +
          'valor_troco, ' +
          'pedido_vendedor, modelo_documento, serie_documento) ' +
          'values (:cod_empresa, :cod_usuario, :dtadoc, :dta_emissao, :dta_saida, ' +
          ':empresa_faturar, :cod_cliente, :cod_representante, :cod_fop, :cod_prazo_pgto, ' +
          '0, 0, :tot_bruto, :tot_liquido, :desconto, :vlr_desconto_geral, :valor_pago, ' +
          ':valor_troco, 1, 65, 1) ' +
          'returning numdoc';
      end;
      Q.ParamByName('cod_empresa').AsInteger := FEmpresaPadrao;
      Q.ParamByName('cod_usuario').AsInteger := StrToIntDef(cod_usuario, 0);
      Q.ParamByName('dtadoc').AsDateTime := dao.DtaSerDt;
      Q.ParamByName('dta_emissao').AsDateTime := dao.DtaSerDt;
      Q.ParamByName('dta_saida').AsDateTime := dao.DtaSerDt;
      Q.ParamByName('empresa_faturar').AsInteger := FEmpresaPadrao;
      Q.ParamByName('cod_cliente').AsInteger := StrToIntDef(CodCliente, 0);
      Q.ParamByName('cod_representante').AsInteger := StrToIntDef(CodRepresentante, 0);
      Q.ParamByName('cod_fop').AsInteger := StrToIntDef(CodFop, 0);
      Q.ParamByName('cod_prazo_pgto').AsInteger := StrToIntDef(CodPrazo, 0);
      Q.ParamByName('tot_bruto').AsFloat := FSubtotalPDV;
      Q.ParamByName('tot_liquido').AsFloat := FTotalPDV;
      Q.ParamByName('desconto').AsFloat := PercentualDescontoGeral;
      Q.ParamByName('vlr_desconto_geral').AsFloat := FSubtotalPDV - FTotalPDV;
      Q.ParamByName('valor_pago').AsFloat := ValorPago;
      Q.ParamByName('valor_troco').AsFloat := ValorTroco;
      if DocumentoExistente then
      begin
        Q.ExecSQL;
        if Q.RowsAffected <> 1 then
          raise Exception.Create('A venda nao foi encontrada para atualizacao.');
      end
      else
      begin
        Q.Open;
        if Q.IsEmpty then
          raise Exception.Create('A venda nao foi gravada em vendas1.');
        FNumDoc := Q.FieldByName('numdoc').AsString;
        Q.Close;
      end;

      Q.SQL.Text := 'delete from vendas2 where numdoc = :numdoc';
      Q.ParamByName('numdoc').AsInteger := StrToIntDef(FNumDoc, 0);
      Q.ExecSQL;

      DescontoGeralRestante := FDescontoGeralPDV;
      mdItens.First;
      while not mdItens.Eof do
      begin
        Q.SQL.Text :=
          'insert into vendas2 (numdoc, cod_produto, qtd, preco_bruto, preco_base, preco, desconto, ' +
          'desconto_valor_geral, sub_total, sub_total_bruto) values (:numdoc, :cod_produto, :qtd, :preco_bruto, :preco_base, ' +
          ':preco, :desconto, :desconto_valor_geral, :sub_total, :sub_total_bruto)';
        Q.ParamByName('numdoc').AsInteger := StrToIntDef(FNumDoc, 0);
        Q.ParamByName('cod_produto').AsInteger := mdItens.FieldByName('cod_produto').AsInteger;
        Q.ParamByName('qtd').AsFloat := mdItens.FieldByName('qtd').AsFloat;
        Q.ParamByName('preco_bruto').AsFloat := mdItens.FieldByName('preco').AsFloat;
        Q.ParamByName('preco_base').AsFloat := mdItens.FieldByName('preco').AsFloat;
        Q.ParamByName('preco').AsFloat := mdItens.FieldByName('preco').AsFloat;
        Q.ParamByName('desconto').AsFloat := mdItens.FieldByName('desconto').AsFloat;
        QuantidadeItem := mdItens.FieldByName('qtd').AsFloat;
        PrecoItem := mdItens.FieldByName('preco').AsFloat;
        DescontoItem := mdItens.FieldByName('desconto').AsFloat;
        SubtotalBrutoItem := QuantidadeItem * PrecoItem;
        SubtotalItem := SubtotalBrutoItem * (1 - (DescontoItem / 100));
        DescontoItemValor := SubtotalBrutoItem - SubtotalItem;
        DescontoGeralItem := 0;
        if (FDescontoGeralPDV > 0) and (FSubtotalPDV > 0) then
        begin
          if mdItens.RecNo < mdItens.RecordCount then
            DescontoGeralItem := Round(FDescontoGeralPDV *
              (SubtotalItem / FSubtotalPDV) * 100) / 100
          else
            DescontoGeralItem := DescontoGeralRestante;
          if DescontoGeralItem < 0 then
            DescontoGeralItem := 0;
          if DescontoGeralItem > DescontoGeralRestante then
            DescontoGeralItem := DescontoGeralRestante;
          DescontoGeralRestante := DescontoGeralRestante - DescontoGeralItem;
        end;
        Q.ParamByName('desconto_valor_geral').AsFloat :=
          DescontoItemValor + DescontoGeralItem;
        Q.ParamByName('sub_total').AsFloat := SubtotalItem;
        Q.ParamByName('sub_total_bruto').AsFloat := SubtotalBrutoItem;
        Q.ExecSQL;
        if Q.RowsAffected <> 1 then
          raise Exception.Create('Um item nao foi gravado em vendas2.');
        Inc(ItensGravados);
        mdItens.Next;
      end;
      Q.Close;
      Q.SQL.Text :=
        'select ' +
        '(select count(*) from vendas1 where numdoc = :numdoc) as total_venda, ' +
        '(select count(*) from vendas2 where numdoc = :numdoc) as total_itens';
      Q.ParamByName('numdoc').AsInteger := StrToIntDef(FNumDoc, 0);
      Q.Open;
      if Q.FieldByName('total_venda').AsInteger <> 1 then
        raise Exception.Create('A venda nao foi encontrada apos a gravacao.');
      if Q.FieldByName('total_itens').AsInteger <> ItensGravados then
        raise Exception.Create('A quantidade de itens gravados nao confere.');
      dao.CN.Commit;
      Result := True;
    except
      on E: Exception do
      begin
        if dao.CN.InTransaction then
          dao.CN.Rollback;
        FNumDoc := '';
        ShowMessage('Erro ao gravar a venda: ' + E.Message);
      end;
    end;
  finally
    Q.Free;
  end;

  if Result then
  begin
    lbNumeroDocumento.Caption := 'Venda: ' + FNumDoc;
    FNFCe.Prnumdoc.Text := FNumDoc;
    Processo := FMFUN.GerarProcessoPedido;
    FMFUN.GravarProcessoPedido('A Digitar', Processo, FNumDoc);
    FMFUN.AtualizaDadosComissaoDesconto(FNumDoc);
    AtualizarBotoesPDV;
  end;
end;

procedure TFr_PDV.SolicitarEmissaoNFCe;
var
  Q: TFDQuery;
  StatusNFe: Integer;
begin
  if Trim(FNumDoc) = '' then
    Exit;

  Q := TFDQuery.Create(nil);
  try
    Q.Connection := dao.CN;
    if not dao.CN.InTransaction then
      dao.CN.StartTransaction;
    try
      Q.SQL.Text :=
        'update vendas1 set modelo_documento = 65, serie_documento = 1, ' +
        'solicitar_emissor = ''EMISSAO'', status_emissor = ''AGUARDANDO'', ' +
        'status_motivo = null where numdoc = :numdoc';
      Q.ParamByName('numdoc').AsInteger := StrToIntDef(FNumDoc, 0);
      Q.ExecSQL;
      dao.CN.Commit;
    except
      if dao.CN.InTransaction then
        dao.CN.Rollback;
      raise;
    end;
  finally
    Q.Free;
  end;

  Application.CreateForm(TFr_status_emissor, Fr_status_emissor);
  try
    Fr_status_emissor.StartWait('NFE', FNumDoc, 'EMISSAO');
    Fr_status_emissor.ShowModal;
  finally
    if Assigned(Fr_status_emissor) then
      FreeAndNil(Fr_status_emissor);
  end;

  dao.Geral1('select coalesce(status_nfe, 0) as status_nfe from vendas1 where numdoc = ' + QuotedStr(FNumDoc));
  StatusNFe := 0;
  if not dao.Q1.IsEmpty then
    StatusNFe := dao.Q1.FieldByName('status_nfe').AsInteger;
  if StatusNFe = 100 then
  begin
    FMFUN.AtualizaDadosComissaoDesconto(FNumDoc);
    FFaturado := True;
    FEmEdicao := False;
    AtualizarStatusPDV;
    try
      FNFCe.ImprimirNFCePDV;
    except
      on E: Exception do
        ShowMessage('A NFC-e foi autorizada, mas nao foi possivel imprimir: ' + E.Message);
    end;
    ShowMessage('NFC-e autorizada. Numero: ' + FNumDoc)
  end
  else
    ShowMessage('A NFC-e nao foi autorizada. Verifique o motivo no status do emissor.');
end;

procedure TFr_PDV.btFinalizarClick(Sender: TObject);
var
  ValorRecebido: Double;
begin
  if (FNFCe = nil) or mdItens.IsEmpty then
  begin
    ShowMessage('Inclua pelo menos um produto antes de finalizar a venda.');
    edCodigoBarras.SetFocus;
    Exit;
  end;
  RecalcularTotaisPDV;
  if Trim(edRecebido.Text) = '' then
  begin
    ShowMessage('Informe o valor recebido antes de finalizar a venda.');
    edRecebido.SetFocus;
    Exit;
  end;
  ValorRecebido := ParsePDVFloat(edRecebido.Text);
  if ValorRecebido <= 0 then
  begin
    ShowMessage('Informe um valor recebido maior que zero.');
    edRecebido.SetFocus;
    Exit;
  end;
  if ValorRecebido < FTotalPDV then
  begin
    ShowMessage('O valor recebido nao pode ser menor que o total da venda.');
    edRecebido.SetFocus;
    Exit;
  end;
  GravarDocumentoPDV;
end;

procedure TFr_PDV.btEmitirNFCeClick(Sender: TObject);
begin
  if Trim(FNumDoc) = '' then
  begin
    ShowMessage('Finalize a venda antes de emitir a NFC-e.');
    Exit;
  end;
  if FFaturado then
  begin
    ShowMessage('Esta venda ja foi faturada.');
    Exit;
  end;
  SolicitarEmissaoNFCe;
end;

procedure TFr_PDV.btImprimirClick(Sender: TObject);
var
  Pedido: TFr_pedido_simplificado;
begin
  if Trim(FNumDoc) = '' then
  begin
    ShowMessage('Nenhum pedido foi selecionado para impressao.');
    Exit;
  end;

  Pedido := TFr_pedido_simplificado.Create(Application);
  try
    Pedido.CarregarPorNumDoc(FNumDoc);
    Pedido.ImprimirMatricial;
  except
    on E: Exception do
      ShowMessage('Nao foi possivel imprimir o pedido: ' + E.Message);
  end;
  Pedido.Free;
end;
procedure TFr_PDV.btDANFCeClick(Sender: TObject);
begin
  if Trim(FNumDoc) = '' then
  begin
    ShowMessage('Nenhuma NFC-e foi selecionada para reimpressao.');
    Exit;
  end;

  if FNFCe = nil then
    CriarDocumento;
  FNFCe.Prnumdoc.Text := FNumDoc;

  try
    FNFCe.VisualizarNFCePDV;
  except
    on E: Exception do
      ShowMessage('Nao foi possivel reimprimir a DANFE NFC-e: ' + E.Message);
  end;
end;

procedure TFr_PDV.btCancelarClick(Sender: TObject);
begin
  if MessageDlg('Cancelar a venda atual?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    FreeAndNil(FNFCe);
    LimparItens;
    if edCodigoBarras.CanFocus then
      edCodigoBarras.SetFocus;
  end;
end;

procedure TFr_PDV.LimparItens;
begin
  if mdItens.Active then
    mdItens.EmptyDataSet;
  FNumDoc := '';
  FTotalPDV := 0;
  FQuantidadePDV := 0;
  FSubtotalPDV := 0;
  FDescontoGeralPDV := 0;
  FFaturado := False;
  FEmEdicao := False;
  FPendenteCodigoProduto := '';
  edDescontoGeral.Text := '0,00';
  edRecebido.Text := '0,00';
  AtualizarEdicaoItem;
  AtualizarResumo;
  AtualizarStatusPDV;
end;

procedure TFr_PDV.btNovoClick(Sender: TObject);
begin
  FreeAndNil(FNFCe);
  LimparItens;
  FEmEdicao := True;
  CarregarPadroesPDV;
  lbNumeroDocumento.Caption := 'Venda: Nova';
  AtualizarStatusPDV;
  CriarDocumento;
  AtualizarBotoesPDV;
  if edCodigoBarras.CanFocus then
    edCodigoBarras.SetFocus;
end;

procedure TFr_PDV.btLocalizarPedidoClick(Sender: TObject);
var
  CamposCombo: array of string;
  I: Integer;
  NumDocSelecionado: string;
  ChamouFormOld, ChamouPesquisaOld, ChamouCadastroOld: string;
begin
  NumDocSelecionado := '';
  if not Assigned(Fr_localizar) then
    Application.CreateForm(TFr_localizar, Fr_localizar);
  try
    ChamouFormOld := chamou_form;
    ChamouPesquisaOld := chamou_pesquisa;
    ChamouCadastroOld := chamou_cadastro;

    Fr_localizar.Caption := 'Localizar pedidos';
    chamou_pesquisa := 'fr_pedido';
    chamou_form := 'fr_pdv';
    chamou_cadastro := '';
    Fr_localizar.BT_cadastro.Visible := False;

    Fr_localizar.CBcampos.Items.Clear;
    SetLength(CamposCombo, 10);
    CamposCombo[0] := 'Numero';
    CamposCombo[1] := 'NFE';
    CamposCombo[2] := 'Cliente - Codigo';
    CamposCombo[3] := 'Cliente - Razao S.';
    CamposCombo[4] := 'Cliente - Fantasia';
    CamposCombo[5] := 'CNPJ';
    CamposCombo[6] := 'CPF';
    CamposCombo[7] := 'Cidade';
    CamposCombo[8] := 'Vendedor';
    CamposCombo[9] := 'Televendas';
    for I := 0 to High(CamposCombo) do
      Fr_localizar.CBcampos.Items.Add(CamposCombo[I]);
    Fr_localizar.CBcampos.ItemIndex := 0;
    Fr_localizar.CBcampos.Text := 'Numero';
    Fr_localizar.ShowModal;

    { A tela de localização fecha pelo duplo clique/Enter e nem sempre
      preserva o ModalResult. O registro selecionado continua na grade. }
    if Fr_localizar.mmLocalizar.Active and
       (not Fr_localizar.mmLocalizar.IsEmpty) and
       (Fr_localizar.mmLocalizar.FindField('numdoc') <> nil) then
      NumDocSelecionado :=
        Trim(Fr_localizar.mmLocalizar.FieldByName('numdoc').AsString);
  finally
    if Assigned(Fr_localizar) then
    begin
      Fr_localizar.Free;
      Fr_localizar := nil;
    end;
    chamou_form := ChamouFormOld;
    chamou_pesquisa := ChamouPesquisaOld;
    chamou_cadastro := ChamouCadastroOld;
  end;

  if NumDocSelecionado <> '' then
    CarregarPedidoPDV(NumDocSelecionado);
end;

procedure TFr_PDV.CarregarPedidoPDV(const ANumeroDocumento: string);
var
  Q: TFDQuery;
  CodCliente, CodRepresentante, CodFop, CodPrazo: string;
  QuantidadeItem, PrecoItem, DescontoItem: Double;
  SubtotalItem, SubtotalBrutoItem: Double;
  DescontoGeral, ValorPago, ValorTroco: Double;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := dao.CN;
    Q.SQL.Text :=
      'select cod_empresa, cod_cliente, cod_representante, cod_fop, ' +
      'cod_prazo_pgto, dtadoc, faturado, ' +
      'coalesce(vlr_desconto_geral, 0) as vlr_desconto_geral, ' +
      'coalesce(valor_pago, 0) as valor_pago, ' +
      'coalesce(valor_troco, 0) as valor_troco ' +
      'from vendas1 where numdoc = :numdoc';
    Q.ParamByName('numdoc').AsInteger := StrToIntDef(ANumeroDocumento, 0);
    Q.Open;
    if Q.IsEmpty then
    begin
      ShowMessage('Pedido nao encontrado.');
      Exit;
    end;

    CodCliente := Q.FieldByName('cod_cliente').AsString;
    CodRepresentante := Q.FieldByName('cod_representante').AsString;
    CodFop := Q.FieldByName('cod_fop').AsString;
    CodPrazo := Q.FieldByName('cod_prazo_pgto').AsString;
    FEmpresaPadrao := Q.FieldByName('cod_empresa').AsInteger;
    FFaturado := Q.FieldByName('faturado').AsInteger = 1;

    DescontoGeral := Q.FieldByName('vlr_desconto_geral').AsFloat;
    ValorPago := Q.FieldByName('valor_pago').AsFloat;
    ValorTroco := Q.FieldByName('valor_troco').AsFloat;
    FreeAndNil(FNFCe);
    if mdItens.Active then
      mdItens.EmptyDataSet;
    CriarDocumento;

    edDescontoGeral.Text := DecimalPDV(DescontoGeral);
    edRecebido.Text := DecimalPDV(ValorPago);
    lbTrocoValor.Caption := MoneyPDV(ValorTroco);

    Prcod_cliente.Text := CodCliente;
    Prcod_representante.Text := CodRepresentante;
    Prcod_fop.Text := CodFop;
    Prcod_prazo_pgto.Text := CodPrazo;
    PrcodClienteExit(Self);
    PrcodRepresentanteExit(Self);
    PrcodFopExit(Self);
    PrcodPrazoExit(Self);

    Q.Close;
    Q.SQL.Text :=
      'select v.cod_produto, coalesce(p.nom_produto, '''') as nom_produto, ' +
      'v.qtd, v.preco_bruto, v.preco_base, v.preco, v.desconto, ' +
      'v.sub_total, v.sub_total_bruto ' +
      'from vendas2 v left join produto p on p.cod_produto = v.cod_produto ' +
      'where v.numdoc = :numdoc order by v.cod_produto';
    Q.ParamByName('numdoc').AsInteger := StrToIntDef(ANumeroDocumento, 0);
    Q.Open;
    if not FNFCe.mmItens.Active then
      FNFCe.mmItens.Open;
    while not Q.Eof do
    begin
      QuantidadeItem := Q.FieldByName('qtd').AsFloat;
      PrecoItem := Q.FieldByName('preco').AsFloat;
      DescontoItem := Q.FieldByName('desconto').AsFloat;
      SubtotalBrutoItem := QuantidadeItem * PrecoItem;
      SubtotalItem := SubtotalBrutoItem * (1 - (DescontoItem / 100));

      FNFCe.mmItens.Append;
      FNFCe.mmItens.FieldByName('cod_produto').AsInteger :=
        Q.FieldByName('cod_produto').AsInteger;
      FNFCe.mmItens.FieldByName('nom_produto').AsString :=
        Q.FieldByName('nom_produto').AsString;
      FNFCe.mmItens.FieldByName('qtd').AsFloat := QuantidadeItem;
      FNFCe.mmItens.FieldByName('preco_base').AsFloat := Q.FieldByName('preco_base').AsFloat;
      FNFCe.mmItens.FieldByName('preco').AsFloat := PrecoItem;
      FNFCe.mmItens.FieldByName('desconto').AsFloat := DescontoItem;
      FNFCe.mmItens.FieldByName('sub_total').AsFloat := SubtotalItem;
      FNFCe.mmItens.FieldByName('sub_total_bruto').AsFloat := SubtotalBrutoItem;
      FNFCe.mmItens.Post;

      mdItens.Append;
      mdItens.FieldByName('cod_produto').AsInteger := Q.FieldByName('cod_produto').AsInteger;
      mdItens.FieldByName('nom_produto').AsString := Q.FieldByName('nom_produto').AsString;
      mdItens.FieldByName('qtd').AsFloat := QuantidadeItem;
      mdItens.FieldByName('preco').AsFloat := PrecoItem;
      mdItens.FieldByName('desconto').AsFloat := DescontoItem;
      mdItens.FieldByName('sub_total').AsFloat := SubtotalItem;
      mdItens.Post;
      Q.Next;
    end;
  finally
    Q.Free;
  end;

  FPendenteCodigoProduto := '';
  edCodigoBarras.Clear;
  FNumDoc := ANumeroDocumento;
  FEmEdicao := True;
  lbNumeroDocumento.Caption := 'Venda: ' + ANumeroDocumento;
  AtualizarStatusPDV;
  RecalcularTotaisPDV;
  AtualizarEdicaoItem;
  if edCodigoBarras.CanFocus then
    edCodigoBarras.SetFocus
  else if btDANFCe.CanFocus then
    btDANFCe.SetFocus;
end;

procedure TFr_PDV.btExcluirItemClick(Sender: TObject);
var
  Codigo: string;
begin
  if mdItens.IsEmpty or (FNFCe = nil) then
    Exit;
  Codigo := mdItens.FieldByName('cod_produto').AsString;
  if FNFCe.mmItens.Locate('cod_produto', Codigo, []) then
    FNFCe.btExcItemClick(Self);
  mdItens.Delete;
  RecalcularTotaisPDV;
  AtualizarBotoesPDV;
end;

end.
