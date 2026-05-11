unit un_controle_status_pedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, sCheckBox, sLabel,
  Vcl.ExtCtrls, Vcl.Buttons, sSpeedButton, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  acDBGrid, sPanel, frxClass, Data.DB, sBitBtn, sComboEdit,
  sToolEdit, Vcl.Mask, sMaskEdit, sCustomComboEdit, sCurrEdit, sCurrencyEdit,
  sGroupBox, RxMemDS, frxDBSet, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  Tfrm_controle_status_pedido = class(TForm)
    Panel2: TsPanel;
    Panel5: TsPanel;
    dgItem: Tdbgrid;
    Panel3: TsPanel;
    Panel4: TsPanel;
    dgPedido: Tdbgrid;
    Panel6: TsPanel;
    DBMemo1: TDBMemo;
    Panel1: TsPanel;
    BtAlterarStatus: TsSpeedButton;
    btImprimir: TsSpeedButton;
    Shape1: TShape;
    Shape2: TShape;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    CheckTodos: TsCheckBox;
    q_pedidos: TFDQuery;
    q_itens: TFDQuery;
    ds_itens: TDataSource;
    ds_pedidos: TDataSource;
    fR_RELATORIO: TfrxReport;
    sPanel1: TsPanel;
    gbPedido: TsGroupBox;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    edPedidoIni: TsCurrencyEdit;
    edPedidoFim: TsCurrencyEdit;
    gbDataSaida: TsGroupBox;
    Label2: TsLabel;
    Label1: TsLabel;
    edSaidaDe: TsDateEdit;
    edSaidaAte: TsDateEdit;
    gbCliente: TsGroupBox;
    Lbnom_cliente: TsLabel;
    edCliente: TsComboEdit;
    BtConsulta: TsBitBtn;
    gbStatus: TGroupBox;
    cbStatus: TComboBox;
    m_pedidos: TRxMemoryData;
    DBCheckBox1: TDBCheckBox;
    m_pedidosNUMDOC: TIntegerField;
    m_pedidosDTADOC: TDateField;
    m_pedidosCOD_CLIENTE: TIntegerField;
    m_pedidosNOM_CLIENTE: TStringField;
    m_pedidosCOD_FOP: TIntegerField;
    m_pedidosNOM_FOP: TStringField;
    m_pedidosCOD_PRAZO: TIntegerField;
    m_pedidosNOM_PRAZO: TStringField;
    m_pedidosTOT_BRUTO: TCurrencyField;
    m_pedidosTOT_LIQUIDO: TCurrencyField;
    m_pedidoscheck: TBooleanField;
    m_pedidosPROCESSO: TIntegerField;
    m_pedidosCOD_REPRESENTANTE: TIntegerField;
    m_pedidosNOM_REPRESENTANTE: TStringField;
    m_pedidosSTATUS: TStringField;
    Shape3: TShape;
    sLabel5: TsLabel;
    sLabel6: TsLabel;
    Shape4: TShape;
    dst_pedidos_status: TfrxDBDataset;
    Shape5: TShape;
    sLabel7: TsLabel;
    sLabel8: TsLabel;
    Shape6: TShape;
    Shape7: TShape;
    sLabel9: TsLabel;
    Shape8: TShape;
    sLabel10: TsLabel;
    btConfirmarEntrega: TsSpeedButton;
    Shape9: TShape;
    sLabel11: TsLabel;
    q_pedidosnumdoc: TIntegerField;
    q_pedidosdtadoc: TDateField;
    q_pedidoscod_cliente: TIntegerField;
    q_pedidosnom_cliente: TStringField;
    q_pedidostot_bruto: TBCDField;
    q_pedidostot_liquido: TBCDField;
    q_pedidoscod_fop: TIntegerField;
    q_pedidosnom_fop: TStringField;
    q_pedidoscod_representante: TIntegerField;
    q_pedidosnom_representante: TStringField;
    q_pedidoscod_prazo_pgto: TIntegerField;
    q_pedidosprazo: TStringField;
    q_pedidosobservacoes_pedido: TMemoField;
    q_pedidospedido_vendedor: TStringField;
    q_pedidosstatus: TStringField;
    q_pedidosprocesso_id: TIntegerField;
    q_pedidosnr_pedido_palm: TStringField;
    q_itensProduto: TStringField;
    q_itensvolume: TBCDField;
    q_itensqtd: TBCDField;
    q_itenssub_total: TBCDField;
    q_itenspreco: TBCDField;
    q_itenspreco_bruto: TBCDField;
    q_itensperc_desc: TFMTBCDField;
    procedure BtConsultaClick(Sender: TObject);
    procedure BtAlterarStatusClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dgPedidoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dgPedidoDblClick(Sender: TObject);
    procedure CheckTodosClick(Sender: TObject);
    procedure fR_RELATORIOGetValue(const VarName: string; var Value: Variant);
    procedure btImprimirClick(Sender: TObject);
    procedure btConfirmarEntregaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dgPedidoEnter(Sender: TObject);
    procedure dgPedidoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FLbComPerc: TsLabel;
    FLbComValor: TsLabel;
    FLbStatusPedido: TsLabel;
    procedure CarregarDados;
    procedure CarregaDadosItem(numdoc: integer);
    procedure GarantirLabelsResumo;
    procedure AtualizarResumoPedido;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_controle_status_pedido: Tfrm_controle_status_pedido;

implementation

uses unfun, un_dao, alterar_status_pedido;

{$R *.dfm}


procedure Tfrm_controle_status_pedido.GarantirLabelsResumo;
begin
  if not Assigned(FLbComPerc) then
  begin
    FLbComPerc := TsLabel.Create(Self);
    FLbComPerc.Parent := Panel1;
    FLbComPerc.Left := 560;
    FLbComPerc.Top := 10;
    FLbComPerc.Caption := 'Comissao %: 0,00';
    FLbComPerc.Font.Style := [fsBold];
  end;

  if not Assigned(FLbComValor) then
  begin
    FLbComValor := TsLabel.Create(Self);
    FLbComValor.Parent := Panel1;
    FLbComValor.Left := 560;
    FLbComValor.Top := 28;
    FLbComValor.Caption := 'Comissao R$: 0,00';
    FLbComValor.Font.Style := [fsBold];
  end;

  if not Assigned(FLbStatusPedido) then
  begin
    FLbStatusPedido := TsLabel.Create(Self);
    FLbStatusPedido.Parent := Panel1;
    FLbStatusPedido.Left := 560;
    FLbStatusPedido.Top := 46;
    FLbStatusPedido.Caption := 'Status: -';
    FLbStatusPedido.Font.Style := [fsBold];
  end;
end;

procedure Tfrm_controle_status_pedido.AtualizarResumoPedido;
var
  PercComissao, VlrComissao: Double;
  StatusPedido: string;
begin
  GarantirLabelsResumo;

  PercComissao := 0;
  VlrComissao := 0;
  StatusPedido := '-';

  if not m_pedidos.Active or m_pedidos.IsEmpty then
  begin
    FLbComPerc.Caption := 'Comissao %: 0,00';
    FLbComValor.Caption := 'Comissao R$: 0,00';
    FLbStatusPedido.Caption := 'Status: -';
    Exit;
  end;

  StatusPedido := Trim(m_pedidosSTATUS.AsString);
  if StatusPedido = '' then
    StatusPedido := '-';

  dao.Geral1('select coalesce(perc_comissao,0) as perc_comissao, coalesce(vlr_comissao,0) as vlr_comissao ' +
            'from vendas1 where numdoc = ' + m_pedidosNUMDOC.AsString);
  if not dao.q1.IsEmpty then
  begin
    PercComissao := dao.q1.FieldByName('perc_comissao').AsFloat;
    VlrComissao := dao.q1.FieldByName('vlr_comissao').AsFloat;
  end;

  FLbComPerc.Caption := 'Comissao %: ' + FormatFloat('#,##0.00', PercComissao);
  FLbComValor.Caption := 'Comissao R$: ' + FormatFloat('#,##0.00', VlrComissao);
  FLbStatusPedido.Caption := 'Status: ' + StatusPedido;
end;


procedure Tfrm_controle_status_pedido.BtAlterarStatusClick(Sender: TObject);
var status : string;
begin
  Application.CreateForm(tfrm_alterar_status_pedido, frm_alterar_status_pedido);
  frm_alterar_status_pedido.ShowModal;
  if frm_alterar_status_pedido.ModalResult = mrok then
    status := frm_alterar_status_pedido.status;
  frm_alterar_status_pedido.Free;

  if not dao.cn.InTransaction then dao.cn.StartTransaction;
  m_pedidos.First;
  m_pedidos.DisableControls;
  while not m_pedidos.eof do
  begin
    if ((m_pedidoscheck.Value = true) and
    (
      (m_pedidosSTATUS.AsString <> 'FATURADO-VENDAS')    AND
      (m_pedidosSTATUS.AsString <> 'FATURADO-DEVOLUÇÃO') AND
      (m_pedidosSTATUS.AsString <> 'DESATIVADO') AND
      (m_pedidosSTATUS.AsString <> 'CANCELADO') AND
      (m_pedidosSTATUS.AsString <> 'ENTREGUE')
    ))
    then fmfun.GravarProcessoPedido(status, m_pedidosPROCESSO.AsString, m_pedidosNUMDOC.asstring);
    m_pedidos.Next;
  end;
  m_pedidos.First;
  dao.cn.Commit;
  CarregarDados;
  m_pedidos.EnableControls;
end;

procedure Tfrm_controle_status_pedido.btConfirmarEntregaClick(Sender: TObject);
begin
  if not dao.cn.InTransaction then dao.cn.StartTransaction;
  m_pedidos.First;
  m_pedidos.DisableControls;
  while not m_pedidos.eof do
  begin
    if m_pedidoscheck.Value = true and ((m_pedidosSTATUS.AsString = 'FATURADO-VENDAS') OR (m_pedidosSTATUS.AsString = 'FATURADO-DEVOLUÇÃO'))  then
     fmfun.GravarProcessoPedido('ENTREGUE', m_pedidosPROCESSO.AsString, m_pedidosNUMDOC.asstring);
    m_pedidos.Next;
  end;
  m_pedidos.First;
  dao.cn.Commit;
  CarregarDados;
  m_pedidos.EnableControls;

end;

procedure Tfrm_controle_status_pedido.BtConsultaClick(Sender: TObject);
begin
  CarregarDados;
  AtualizarResumoPedido;
end;

procedure Tfrm_controle_status_pedido.btImprimirClick(Sender: TObject);
var
  path : string;
begin
  path := ExtractFilePath(Application.ExeName);
  if not(fR_RELATORIO.LoadFromFile(path + 'Relatorios\pedidos_status.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 +
      'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure Tfrm_controle_status_pedido.CarregarDados;
var
  sql, cmd: string;
begin
  sql := 'SELECT a.NUMDOC, a.DTADOC, a.COD_CLIENTE, c.NOM_CLIENTE, a.TOT_BRUTO, a.TOT_LIQUIDO, '
    + '  a.COD_FOP, f.NOM_FOP, a.COD_REPRESENTANTE, r.NOM_REPRESENTANTE, a.cod_prazo_pgto, p.PRAZO, '
    + '  A.OBSERVACOES_PEDIDO, a.pedido_vendedor, pp.STATUS, a.PROCESSO_ID, a.nr_pedido_palm '
    + '  FROM VENDAS1 a ' +
    '  left outer join PROCESSO_PEDIDO pp on pp.ID = a.PROCESSO_ID ' +
    '  inner join CLIENTE c on (c.COD_CLIENTE = a.COD_CLIENTE) ' +
    '  inner join REPRESENTANTE r on (r.id = a.COD_REPRESENTANTE) ' +
    '  left  join prazo p on (p.ID = a.COD_PRAZO_PGTO) ' +
    '  left join fop f on (f.COD_FOP = a.COD_FOP) ' + '  where 1 = 1 ' +
    '  and a.PROCESSO_ID is not null';

  cmd := '';

  if edPedidoIni.Value > 0 then
    cmd := cmd + ' and a.numdoc >= ' + edPedidoIni.Text;

  if edPedidoFim.Value > 0 then
    cmd := cmd + ' and a.numdoc <= ' + edPedidoFim.Text;

  if edSaidaDe.Date > 0 then
    cmd := cmd + ' and a.dtadoc >= ' +
      quotedstr(formatdatetime('dd.mm.yyyy', edSaidaDe.Date));

  if edSaidaAte.Date > 0 then
    cmd := cmd + ' and a.dtadoc <= ' +
      quotedstr(formatdatetime('dd.mm.yyyy', edSaidaAte.Date));

  if edCliente.Text <> '' then
    cmd := cmd + ' and a.cod_cliente = ' + edCliente.Text;

  if cbStatus.Text <> 'TODOS' then
    cmd := cmd + ' and pp.status = ''' + cbStatus.Text + '''';

  cmd := cmd + ' order by a.numdoc ';

  q_pedidos.Close;
  q_pedidos.sql.Clear;
  q_pedidos.sql.Text := sql + cmd;
  q_pedidos.Open;
  q_pedidos.First;

  m_pedidos.EmptyTable;
  m_pedidos.Open;
  while not q_pedidos.eof do
  begin
    m_pedidos.Append;
    m_pedidosNUMDOC.AsInteger := q_pedidosNUMDOC.AsInteger;
    m_pedidosDTADOC.AsDateTime := q_pedidosDTADOC.AsDateTime;
    m_pedidosCOD_CLIENTE.AsInteger := q_pedidosCOD_CLIENTE.AsInteger;
    m_pedidosNOM_CLIENTE.AsString := q_pedidosNOM_CLIENTE.AsString;
    m_pedidosCOD_FOP.AsString := q_pedidosCOD_FOP.AsString;
    m_pedidosNOM_FOP.AsString := q_pedidosNOM_FOP.AsString;
    m_pedidosCOD_REPRESENTANTE.AsString := q_pedidosCOD_REPRESENTANTE.AsString;
    m_pedidosNOM_REPRESENTANTE.AsString := q_pedidosNOM_REPRESENTANTE.AsString;
    m_pedidosCOD_PRAZO.AsString := q_pedidosCOD_PRAZO_PGTO.AsString;
    m_pedidosNOM_PRAZO.AsString := q_pedidosPRAZO.AsString;
    m_pedidosTOT_BRUTO.AsCurrency := q_pedidosTOT_BRUTO.AsCurrency;
    m_pedidosTOT_LIQUIDO.AsCurrency := q_pedidosTOT_LIQUIDO.AsCurrency;
    m_pedidosPROCESSO.AsInteger := q_pedidosPROCESSO_ID.AsInteger;
    m_pedidosSTATUS.AsString := q_pedidosSTATUS.AsString;
    m_pedidoscheck.Value := false;
    m_pedidos.Post;
    q_pedidos.Next;
  end;
  m_pedidos.First;
  AtualizarResumoPedido;
end;

procedure Tfrm_controle_status_pedido.CheckTodosClick(Sender: TObject);
begin

  m_pedidos.First;

  while not m_pedidos.eof do
  begin
    m_pedidos.edit;
    m_pedidoscheck.Value := CheckTodos.Checked;
    m_pedidos.Post;
    m_pedidos.Next;
  end;

  m_pedidos.First;

  BtAlterarStatus.Enabled    := CheckTodos.Checked;
  btConfirmarEntrega.Enabled := CheckTodos.Checked;

end;

procedure Tfrm_controle_status_pedido.dgPedidoDblClick(Sender: TObject);
begin
    m_pedidos.edit;
    m_pedidoscheck.Value := not m_pedidoscheck.Value = true;
    m_pedidos.Post;

    BtAlterarStatus.Enabled    := m_pedidoscheck.Value = true;
    btConfirmarEntrega.Enabled := m_pedidoscheck.Value = true;
    AtualizarResumoPedido;

end;

procedure Tfrm_controle_status_pedido.dgPedidoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
  IsChecked: array [Boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or
    DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  dgPedido.Canvas.Font.Color := clBlack;
  if gdSelected in State then
  begin
    dgPedido.Canvas.Brush.Color := clBlack;
    dgPedido.Canvas.Font.Color := clWhite;
  end;

  if m_pedidosSTATUS.Value = 'À DIGITAR' then
  begin
    dgPedido.Canvas.Font.Color := clOlive;
    if gdSelected in State then
    begin
      dgPedido.Canvas.Brush.Color := clOlive;
      dgPedido.Canvas.Font.Color := clWhite;
    end;
  end;

  if m_pedidosSTATUS.Value = 'À FATURAR' then
  begin
    dgPedido.Canvas.Font.Color := clGreen;
    if gdSelected in State then
    begin
      dgPedido.Canvas.Brush.Color := clGreen;
      dgPedido.Canvas.Font.Color := clWhite;
    end;
  end;

  if m_pedidosSTATUS.Value = 'FATURADO-VENDAS' then
  begin
    dgPedido.Canvas.Font.Color := clNavy;
    if gdSelected in State then
    begin
      dgPedido.Canvas.Brush.Color := clNavy;
      dgPedido.Canvas.Font.Color := clWhite;
    end;
  end;

  if m_pedidosSTATUS.Value = 'CANCELADO' then
  begin
    dgPedido.Canvas.Font.Color := clGray;
    if gdSelected in State then
    begin
      dgPedido.Canvas.Brush.Color := clGray;
      dgPedido.Canvas.Font.Color := clWhite;
    end;
  end;

  if m_pedidosSTATUS.Value = 'FATURADO-ENTRADA' then
  begin
    dgPedido.Canvas.Font.Color := clNavy;
    if gdSelected in State then
    begin
      dgPedido.Canvas.Brush.Color := clNavy;
      dgPedido.Canvas.Font.Color := clWhite;
    end;
  end;


    if m_pedidosSTATUS.Value = 'FATURADO-ENTRADA' then
  begin
    dgPedido.Canvas.Font.Color := clNavy;
    if gdSelected in State then
    begin
      dgPedido.Canvas.Brush.Color := clNavy;
      dgPedido.Canvas.Font.Color := clWhite;
    end;
  end;

    if m_pedidosSTATUS.Value = 'FATURADO-DEVOLUÇÃO' then
  begin
    dgPedido.Canvas.Font.Color := clMaroon;
    if gdSelected in State then
    begin
      dgPedido.Canvas.Brush.Color := clMaroon;
      dgPedido.Canvas.Font.Color := clWhite;
    end;
  end;

  if m_pedidosSTATUS.Value = 'DESATIVADO' then
  begin
    dgPedido.Canvas.Font.Color := clWebChocolate;
    if gdSelected in State then
    begin
      dgPedido.Canvas.Brush.Color := clWebChocolate;
      dgPedido.Canvas.Font.Color := clWhite;
    end;
  end;

  if m_pedidosSTATUS.Value = 'À CONFERIR' then
  begin
    dgPedido.Canvas.Font.Color := clWebMediumSeaGreen;
    if gdSelected in State then
    begin
      dgPedido.Canvas.Brush.Color := clWebMediumSeaGreen;
      dgPedido.Canvas.Font.Color := clWhite;
    end;
  end;

  if m_pedidosSTATUS.Value = 'ENTREGUE' then
  begin
    dgPedido.Canvas.Font.Color := $2F6B55;
    if gdSelected in State then
    begin
      dgPedido.Canvas.Brush.Color := $2F6B55;
      dgPedido.Canvas.Font.Color := clWhite;
    end;
  end;

  if m_pedidosSTATUS.Value = 'PENDENTE' then
  begin
    dgPedido.Canvas.Font.Color := $007100E1;
    if gdSelected in State then
    begin
      dgPedido.Canvas.Brush.Color := $007100E1;
      dgPedido.Canvas.Font.Color := clWhite;
    end;
  end;

  dgPedido.DefaultDrawDataCell(Rect, Column.Field, State);

  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = DBCheckBox1.DataField) then
    begin
      DBCheckBox1.Left := Rect.Left + dgPedido.Left + 2;
      DBCheckBox1.Top := Rect.Top + dgPedido.Top + 2;
      DBCheckBox1.Width := Rect.Right - Rect.Left;
      DBCheckBox1.Height := Rect.Bottom - Rect.Top;

      DBCheckBox1.Visible := true;
    end
  end
  else
  begin
    if (Column.Field.FieldName = DBCheckBox1.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := IsChecked[Column.Field.AsBoolean];

      dgPedido.Canvas.FillRect(Rect);
      DrawFrameControl(dgPedido.Canvas.Handle, DrawRect, DFC_BUTTON, DrawState);
    end;
  end;
end;

procedure Tfrm_controle_status_pedido.dgPedidoEnter(Sender: TObject);
begin
  CarregaDadosItem(m_pedidosNUMDOC.AsInteger);
  AtualizarResumoPedido;
end;

procedure Tfrm_controle_status_pedido.dgPedidoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  CarregaDadosItem(m_pedidosNUMDOC.AsInteger);
  AtualizarResumoPedido;
end;

procedure Tfrm_controle_status_pedido.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure Tfrm_controle_status_pedido.FormShow(Sender: TObject);
begin
  edSaidaDe.Date := now - 7;
  edSaidaAte.Date := now;
  CarregarDados;
  AtualizarResumoPedido;
end;

procedure Tfrm_controle_status_pedido.fR_RELATORIOGetValue(
  const VarName: string; var Value: Variant);
begin
    if VarName = 'dtaini' then
      Value := formatdatetime('dd/mm/yyyy', edSaidaDe.date)
    else if VarName = 'dtafin' then
      Value := formatdatetime('dd/mm/yyyy', edSaidaAte.date);

    if VarName = 'status' then
      Value := cbStatus.Text;
end;

procedure Tfrm_controle_status_pedido.CarregaDadosItem(numdoc: Integer);
begin
  q_itens.Close;
  q_itens.ParamByName('numdoc').AsInteger := numdoc;
  q_itens.Open;
end;

end.

