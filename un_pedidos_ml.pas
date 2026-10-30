unit un_pedidos_ml;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, StdCtrls, sPanel, sSpeedButton, sLabel,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Buttons, ComCtrls, frxClass, frxDBSet, frxExportPDF, frxExportBaseDialog;

type
  TFrPedidosML = class(TForm)
    Panel1: tsPanel;
    btImprimir: TsSpeedButton;
    lbPeriodo: TsLabel;
    dtInicial: TDateTimePicker;
    lbAte: TsLabel;
    dtFinal: TDateTimePicker;
    lbStatus: TsLabel;
    cbStatus: TComboBox;
    Panel2: tsPanel;
    btAtualizar: TsSpeedButton;
    lbTotal: TsLabel;
    dgPedidos: TDBGrid;
    dsPedidos: TDataSource;
    qPedidos: TFDQuery;
    qPedidosnumdoc: TIntegerField;
    qPedidosbuyer_name: TStringField;
    qPedidostotal_amount: TBCDField;
    qPedidostaxa_ml: TBCDField;
    qPedidostaxa_frete: TBCDField;
    qPedidosdata_fechamento: TSQLTimeStampField;
    qPedidosstatus: TStringField;
    fR_RELATORIO: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxDBDataset1: TfrxDBDataset;
    procedure FormShow(Sender: TObject);
    procedure btAtualizarClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure dgPedidosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    procedure CarregaPedidos;
    procedure ImprimirPedidos(PDF: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrPedidosML: TFrPedidosML;

implementation

uses Un_dao;

{$R *.dfm}

procedure TFrPedidosML.CarregaPedidos;
var
  filtroStatus: string;
begin
  if cbStatus.ItemIndex <= 0 then
    filtroStatus := ''
  else
    filtroStatus := ' and v.faturado = ' + IntToStr(cbStatus.ItemIndex - 1);
  try
    qPedidos.Close;
    qPedidos.SQL.Text :=
      'select m.numdoc, m.data_fechamento, cast(upper(m.buyer_name) as varchar(200)) buyer_name, m.total_amount, m.taxa_ml, m.taxa_frete, ' +
      'cast(case v.faturado when 0 then ''' + #192 + ' FATURAR'' when 1 then ''FATURADO'' ' +
      'when 2 then ''CANCELADO'' end as varchar(100)) status ' +
      'from ml_pedido m ' +
      'inner join vendas1 v on v.numdoc = m.numdoc ' +
      'where cast(m.data_fechamento as date) between ' +
      'cast(''' + FormatDateTime('yyyy-mm-dd', dtInicial.Date) + ''' as date) and ' +
      'cast(''' + FormatDateTime('yyyy-mm-dd', dtFinal.Date) + ''' as date)' + filtroStatus + ' ' +
      'order by 1 desc';
    qPedidos.Open;
    lbTotal.Caption := 'Registros: ' + IntToStr(qPedidos.RecordCount);
  except
    on E: Exception do
      ShowMessage('Erro ao carregar pedidos do Mercado Livre: ' + E.Message);
  end;
end;

procedure TFrPedidosML.dgPedidosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  status: string;
  Field: TField;
begin
  Field := Column.Field;
  dgPedidos.Canvas.Font.Color := clWindowText;

  status := qPedidosstatus.AsString;

  if status = 'FATURADO' then
  begin
    if gdSelected in State then
    begin
      dgPedidos.Canvas.Font.Color := clWhite;
      dgPedidos.Canvas.Brush.Color := clNavy;
    end
    else
    begin
      dgPedidos.Canvas.Font.Color := clNavy;
      dgPedidos.Canvas.Brush.Color := clWhite;
    end;
  end
  else if status = 'À FATURAR' then
  begin
    if gdSelected in State then
    begin
      dgPedidos.Canvas.Font.Color := clWhite;
      dgPedidos.Canvas.Brush.Color := clTeal;
    end
    else
    begin
      dgPedidos.Canvas.Font.Color := clTeal;
      dgPedidos.Canvas.Brush.Color := clWhite;
    end;
  end
  else if status = 'CANCELADO' then
  begin
    if gdSelected in State then
    begin
      dgPedidos.Canvas.Font.Color := clWhite;
      dgPedidos.Canvas.Brush.Color := clGray;
    end
    else
    begin
      dgPedidos.Canvas.Font.Color := clGray;
      dgPedidos.Canvas.Brush.Color := clWhite;
    end;
  end;
  dgPedidos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrPedidosML.FormShow(Sender: TObject);
begin
  if cbStatus.Items.Count = 0 then
  begin
    cbStatus.Items.Add('TODOS');
    cbStatus.Items.Add(#192 + ' FATURAR');
    cbStatus.Items.Add('FATURADO');
    cbStatus.Items.Add('CANCELADO');
    cbStatus.ItemIndex := 0;
    dtFinal.Date := Date;
    dtInicial.Date := Date - 30;
  end;
  CarregaPedidos;
end;

procedure TFrPedidosML.btAtualizarClick(Sender: TObject);
begin
  CarregaPedidos;
end;

procedure TFrPedidosML.ImprimirPedidos(PDF: Boolean);
var
  Titulo: string;
  memoPeriodo: TObject;
begin
  if qPedidos.IsEmpty then
  begin
    ShowMessage('N'#227'o h'#225' pedidos para imprimir.');
    Exit;
  end;

  if not(fR_RELATORIO.LoadFromFile(ExtractFilePath(Application.ExeName) +
    'Relatorios\un_pedidos_ml.fr3')) then
  begin
    dao.msg('Relat'#243'rio n'#227'o encontrado nas configura'#231#245'es do Sistema' + #13 +
      'Avise o Suporte');
    Exit;
  end;

  Titulo := 'Per'#237'odo: ' + FormatDateTime('dd/mm/yyyy', dtInicial.Date) + ' a ' +
    FormatDateTime('dd/mm/yyyy', dtFinal.Date) + '   |   Status: ' + cbStatus.Text;
  memoPeriodo := fR_RELATORIO.FindObject('mPeriodo');
  if memoPeriodo is TfrxMemoView then
    TfrxMemoView(memoPeriodo).Text := Titulo;

  qPedidos.First;

  if PDF then
  begin
    fR_RELATORIO.PrepareReport(True);
    frxPDFExport1.ShowDialog := False;
    frxPDFExport1.FileName := 'PedidosML_' + FormatDateTime('yyyymmdd_hhnnss', Now) + '.pdf';
    fR_RELATORIO.Export(frxPDFExport1);
  end
  else
    fR_RELATORIO.ShowReport;
end;

procedure TFrPedidosML.btImprimirClick(Sender: TObject);
begin
  ImprimirPedidos(False);
end;

end.
