unit un_vendor_enviar_pedidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ExtCtrls, sPanel, acDBGrid,
  RxMemDS, StdCtrls, DBCtrls, Buttons, sBitBtn, sTooledit, Mask, sMaskEdit,
  sCustomComboEdit, sCurrEdit, sCurrencyEdit, sLabel, sGroupBox, sEdit,
  sCheckBox, sSpeedButton, Math, frxClass, FMTBcd, SqlExpr, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Tfm_vendor_enviar_pedidos = class(TForm)
    dsPedidos: TDataSource;
    dsMinaItem: TDataSource;
    dgPedidos: Tdbgrid;
    Panel6: TsPanel;
    DBGrid1: Tdbgrid;
    Panel5: TsPanel;
    mmPedidos: TRxMemoryData;
    mmPedidoscheck: TBooleanField;
    mmPedidosCLIENTE: TIntegerField;
    mmPedidosCLIENTE_NOME: TStringField;
    mmPedidosDOCUMENTO: TIntegerField;
    mmPedidosVENDEDOR: TIntegerField;
    mmPedidosVENDEDOR_NOME: TStringField;
    mmPedidosEMISSAO: TDateField;
    mmPedidosCONDICAO: TIntegerField;
    mmPedidosFORMA_PGTO: TStringField;
    mmPedidosVALOR: TCurrencyField;
    mmPedidosSITUACAO: TIntegerField;
    mmPedidosOBS: TStringField;
    DBCheckBox1: TDBCheckBox;
    Panel2: TsPanel;
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
    BtConsulta: TsBitBtn;
    edCliente: TsEdit;
    sPanel1: TsPanel;
    btImportar: TsSpeedButton;
    CheckTodos: TsCheckBox;
    fR_RELATORIO: TfrxReport;
    q_itens: TfdQuery;
    procedure dgPedidosCellClick(Column: TColumn);
    procedure dgPedidosEnter(Sender: TObject);
    procedure dgPedidosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dgPedidosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dgPedidosDblClick(Sender: TObject);
    procedure BtConsultaClick(Sender: TObject);
    procedure CheckTodosClick(Sender: TObject);
    procedure btImportarClick(Sender: TObject);
    procedure fR_RELATORIOGetValue(const VarName: string;
      var Value: Variant);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    procedure CarregaDadosItem(pedido: integer);
    procedure CarregaDados;
    procedure ImportarPedido;
    procedure relatorio_pedidos_geral;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_vendor_enviar_pedidos: Tfm_vendor_enviar_pedidos;
  totalselecionados: integer;
  pedidos: string;

implementation

uses Un_dao, UnFun, Un_dm, un_conexao_vendor;

{$R *.dfm}

procedure Tfm_vendor_enviar_pedidos.CarregaDadosItem(pedido: integer);
begin
  if pedido = 0 then
    exit;
  q_Itens.Close;
  q_Itens.ParamByName('NUMDOC').AsInteger := pedido;
  q_Itens.Open;
end;

procedure Tfm_vendor_enviar_pedidos.dgPedidosCellClick(Column: TColumn);
begin
  CarregaDadosItem(mmPedidosDOCUMENTO.AsInteger);
end;



procedure Tfm_vendor_enviar_pedidos.CarregaDados;
var
  sql: string;
begin
  sql := 'SELECT a.NUMDOC, a.DTADOC, a.COD_CLIENTE||''-''||c.NOM_CLIENTE as CLIENTE, a.TOT_BRUTO, a.TOT_LIQUIDO, ' +
    ' a.COD_FOP||''-''||f.NOM_FOP as fop, a.COD_REPRESENTANTE||''-''||r.NOM_REPRESENTANTE as representante, ' +
    ' p.PRAZO, A.OBSERVACOES_PEDIDO ' +
    'FROM ' +
    ' CONFIGURACAO CF, ' +
    ' VENDAS1 a ' +
    'inner join CLIENTE c on (c.COD_CLIENTE = a.COD_CLIENTE) ' +
    'inner join REPRESENTANTE r on (r.id = a.COD_REPRESENTANTE) ' +
    'left  join prazo p on (p.ID = a.COD_PRAZO_PGTO) ' +
    'left join fop f on (f.COD_FOP = a.COD_FOP) ' +
    'where A.FATURADO = 0 AND a.NUMDOC_DESTINO IS NULL and ' +
    '  CF.MODULO_VENDOR = ''S'' AND CF.REPRESENTACAO = ''S'' ';

  if trim(edPedidoIni.Text) <> '0' then
    sql := sql + ' AND a.numdoc >= ' + edPedidoIni.Text;

  if trim(edPedidoFim.Text) <> '0' then
    sql := sql + ' AND a.numdoc <= ' + edPedidoFim.Text;

  if trim(edSaidaDe.Text) <> '/  /' then
    sql := sql + ' AND a.dtadoc >= ' +
      QuotedStr(formatdatetime('dd/mm/yyyy', edSaidaDe.Date));

  if trim(edSaidaAte.Text) <> '/  /' then
    sql := sql + ' AND a.dtadoc <= ' +
      QuotedStr(formatdatetime('dd/mm/yyyy', edSaidaAte.Date));

  if TRIM(edCliente.Text) <> '' then
    sql := sql + ' AND C.NOM_CLIENTE LIKE ''' + trim(edcliente.Text) + '%''';

  sql := sql + ' order by numdoc desc ';

  dao.geral1(sql);

  mmPedidos.Close;
  mmPedidos.EmptyTable;
  mmPedidos.Open;
  dao.q1.First;

  while not dao.Q1.eof do
  begin
    mmPedidos.Append;
    mmPedidosCLIENTE_NOME.AsString  := dao.Q1.fieldbyname('CLIENTE').AsString;
    mmPedidosDOCUMENTO.AsInteger    := dao.Q1.fieldbyname('NUMDOC').Asinteger;
    mmPedidosVENDEDOR_NOME.AsString := dao.Q1.fieldbyname('REPRESENTANTE').AsString;
    mmPedidosEMISSAO.AsDateTime     := dao.Q1.fieldbyname('DTADOC').AsDateTime;
    mmPedidosFORMA_PGTO.AsString    := dao.Q1.fieldbyname('FOP').AsString;
    mmPedidosVALOR.Value            := dao.Q1.fieldbyname('TOT_LIQUIDO').value;
    mmPedidos.Post;
    dao.Q1.next;
  end;
  mmPedidos.First;
  if dao.Q1.RecordCount = 0 then
    q_Itens.Close
  else
    CarregaDadosItem(mmPedidosDOCUMENTO.AsInteger);
end;

procedure Tfm_vendor_enviar_pedidos.dgPedidosEnter(Sender: TObject);
begin
  CarregaDadosItem(mmPedidosDOCUMENTO.AsInteger);
end;

procedure Tfm_vendor_enviar_pedidos.dgPedidosKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  CarregaDadosItem(mmPedidosDOCUMENTO.AsInteger);
end;

procedure Tfm_vendor_enviar_pedidos.dgPedidosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
const
  IsChecked: array[Boolean] of Integer =
  (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = DBCheckBox1.DataField) then
    begin
      DBCheckBox1.Left := Rect.Left + dgPedidos.Left + 2;
      DBCheckBox1.Top := Rect.Top + dgPedidos.top + 2;
      DBCheckBox1.Width := Rect.Right - Rect.Left;
      DBCheckBox1.Height := Rect.Bottom - Rect.Top;

      DBCheckBox1.Visible := True;
    end
  end
  else
  begin
    if (Column.Field.FieldName = DBCheckBox1.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := ISChecked[Column.Field.AsBoolean];

      dgPedidos.Canvas.FillRect(Rect);
      DrawFrameControl(dgPedidos.Canvas.Handle, DrawRect,
        DFC_BUTTON, DrawState);
    end;
  end;

end;

procedure Tfm_vendor_enviar_pedidos.dgPedidosDblClick(Sender: TObject);
begin
  mmPedidos.Edit;
  if mmPedidoscheck.Value = true then
  begin
    mmPedidoscheck.Value := false;
    // totalselecionados := totalselecionados - 1;
  end
  else
  begin
    mmPedidoscheck.Value := true;
    // totalselecionados := totalselecionados + 1;
  end;
  mmPedidos.Post;
end;

procedure Tfm_vendor_enviar_pedidos.BtConsultaClick(Sender: TObject);
begin
  CarregaDados;
end;

procedure Tfm_vendor_enviar_pedidos.CheckTodosClick(Sender: TObject);
begin
  totalselecionados := 0;
  mmPedidos.First;
  while not mmPedidos.Eof do
  begin
    mmPedidos.Edit;
    mmPedidosCheck.Value := CheckTodos.Checked;
    if CheckTodos.Checked then
      totalselecionados := totalselecionados + 1
    else
      totalselecionados := 0;
    mmPedidos.Post;
    mmPedidos.Next;
  end;
  mmPedidos.First;

  {  if totalselecionados = 0 then
      BtConferir.enabled := false
    else
      BtConferir.enabled := true;}
end;

procedure Tfm_vendor_enviar_pedidos.relatorio_pedidos_geral;
var
  cmd, path: string;
  oExportfilter: TfrxCustomExportFilter;
begin
  path := extractFilePath(application.ExeName);
  cmd := 'SELECT a.NR_CONEXAO, a.COD_REPRESENTANTE, a.DATA_CONEXAO, a.HORA_CONEXAO, coalesce(a.QTDE_PEDIDOS, 0) as QTDE_PEDIDOS, coalesce(a.QTDE_VISITAS_NEGATIVAS, 0) as QTDE_VISITAS_NEGATIVAS, a.CHECADO, '
    +
    ' a.USUARIO_CHECOU||''-''||u.NOME as USUARIO_CHECOU, A.DATA_HORA_CHECADO, ' +
    ' v1.NUMDOC, V1.NUMDOC_DESTINO, v1.DTADOC, c.COD_CLIENTE||''-''||c.NOM_CLIENTE as cliente, C.TELEFONE, c.ENDERECO, c.NR_ENDERECO, c.CEP, cid.NOM_CIDADE||''-''||cid.UF as cidade, C.CNPJ, C.IE, C.RG,C.CPF, C.EMAIL, COALESCE(v1.TOT_BRUTO, 0) AS TOT_BRUTO, ' +
    ' COALESCE(v1.TOT_LIQUIDO, 0) AS TOT_LIQUIDO, v1.OBSERVACOES_PEDIDO, ' +
    ' v1.COD_FOP||''-''||f.NOM_FOP as fop, v1.COD_REPRESENTANTE||''-''||r.NOM_REPRESENTANTE as representante, p.PRAZO, v1.NR_PEDIDO_PALM, v1.PALM_NR_CONEXAO, v1.OBSERVACOES_PEDIDO, ' +
    ' v2.ID, v2.NUMDOC, v2.COD_PRODUTO||''-''||pr.NOM_PRODUTO as produto, pr.unidade, COALESCE(v2.QTD, 0) AS QTD, COALESCE(v2.PRECO, 0) AS PRECO, COALESCE(v2.SUB_TOTAL, 0) AS SUB_TOTAL, v2.NR_PEDIDO_PALM, COALESCE(v2.PRECO_BRUTO, 0) AS PRECO_BRUTO, ' +
    ' (((COALESCE(v2.PRECO_BRUTO,0) - COALESCE(v2.PRECO,0))/COALESCE(v2.PRECO_BRUTO,1)) * 100) AS PERC_DESC, COALESCE(v2.VOLUME,0) AS VOLUME, ' +
    ' v2.VLR_ICMS_ST, '+
    ' V2.NCM, '+
    ' (coalesce(v2.VLR_ICMS_ST,0)/COALESCE(v2.SUB_TOTAL, 0))*100 as perc_st, pr.codigo_barra '+
    ' FROM vendas1 v1' +
    ' left outer join PALM_LOTE a on (v1.PALM_NR_CONEXAO = a.NR_CONEXAO)' +
    ' LEFT OUTER join tbusu u on (u.CODUSU = a.USUARIO_CHECOU)' +
    ' inner join vendas2 v2 on (v2.NUMDOC = v1.NUMDOC)' +
    ' inner join CLIENTE c on (c.COD_CLIENTE = v1.COD_CLIENTE)' +
    ' inner join Cidades cid on (cid.COD_Cidade = c.COD_cidade)' +
    ' left outer join REPRESENTANTE r on (r.id = v1.COD_REPRESENTANTE)' +
    ' inner join prazo p on (p.ID = v1.COD_PRAZO_PGTO)' +
    ' inner join fop f on (f.COD_FOP = v1.COD_FOP) ' +
    ' inner join produto pr on (pr.COD_PRODUTO = v2.COD_PRODUTO) ' +
    'where 1 = 1 ';

  cmd := cmd + fmfun.cmdAux('v1.numdoc', pedidos);

  cmd := cmd +
    ' order by  v1.OBSERVACOES_PEDIDO, v1.NUMDOC, v2.COD_PRODUTO, v2.VOLUME ';

  with dm.q_palm_pedidos do
  begin
    close;
    sql.Clear;
    sql.add(cmd);
    open;
  end;

  if not (fr_relatorio.LoadFromFile(path + 'Relatorios\pedido_email.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 +
      'Avise o Suporte');
    exit;
  end;
  fr_relatorio.ShowReport;

end;

procedure Tfm_vendor_enviar_pedidos.btImportarClick(Sender: TObject);
begin
  ImportarPedido;
end;

procedure Tfm_vendor_enviar_pedidos.ImportarPedido;
var
  Vendor : TConexaoVendor;
  procedure ZerarDadosIncorretos(numdoc:string);
  begin
    dao.cn.StartTransaction;
    dao.Execsql('update vendas1 set DATA_REC_NFE = null where numdoc = '+numdoc);
    dao.cn.Commit;
  end;
begin
  Vendor  := TConexaoVendor.Create();
  pedidos := '';
  mmPedidos.First;
  while not mmPedidos.eof do
  begin
    if mmPedidoscheck.Value = true then
    begin
      ZerarDadosIncorretos(mmPedidosDOCUMENTO.AsString);
      Vendor.pedido(mmPedidosDOCUMENTO.AsString);
      pedidos := pedidos+mmPedidosDOCUMENTO.AsString+',';
    end;
    mmPedidos.Next;
  end;


  Vendor.EnviarVisitas;
  Vendor.Free;

  pedidos := copy(pedidos, 1, length(pedidos) - 1);
  if pedidos <> '' then
  begin
    Vendor.RegistrarConexao('ENVIO DE PEDIDOS');
    relatorio_pedidos_geral;
  end;
  BtConsultaClick(SELF);
  mmPedidos.First;

end;

procedure Tfm_vendor_enviar_pedidos.fR_RELATORIOGetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'empresa' then
    value := nom_empresa;
end;

procedure Tfm_vendor_enviar_pedidos.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure Tfm_vendor_enviar_pedidos.FormShow(Sender: TObject);
begin
  CarregaDados;
end;

end.





