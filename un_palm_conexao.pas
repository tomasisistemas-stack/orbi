unit un_palm_conexao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, ExtCtrls, DB, RxMemDS, StdCtrls, ActiveX,
  DBCtrls, Buttons, frxClass, sPageControl, sSpeedButton,
  sPanel, sBitBtn, sCheckBox, acDBGrid, Math, IdFTPCommon, sLabel,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPedidoData = Record
    numdoc : string;
    processo : string;
  End;
  TPedidos = class(TThread)
  private
    procedure Execute; override;
    procedure CarregarArquivosTablet;
    function ImportarPedidoPalm(arquivo: string): boolean;
    function BuscarClientePorCPFCNPJ(cpfcnpj: string): string;
    procedure Mostra;
  public
    constructor Create();
  end;

  TFrPalmConexao = class(TForm)
    Panel1: tsPanel;
    PageControl1: TsPageControl;
    TabConexao: TsTabSheet;
    dgPalm: Tdbgrid;
    TabPedido: TsTabSheet;
    mmPalm: TRxMemoryData;
    dsPalm: TDataSource;
    mmPalmNR_CONEXAO: TIntegerField;
    mmPalmREPRESENTANTE: TStringField;
    mmPalmDATA_CONEXAO: TDateField;
    mmPalmHORA: TTimeField;
    mmPalmQTDE_PEDIDOS: TIntegerField;
    mmPalmQTDE_VISITAS_NEGATIVAS: TIntegerField;
    DBCheckBox1: TDBCheckBox;
    mmPalmcheck: TBooleanField;
    Panel2: tsPanel;
    Panel3: tsPanel;
    Panel4: tsPanel;
    dgPedido: Tdbgrid;
    Panel5: tsPanel;
    dgItem: Tdbgrid;
    ds_pedidos: TDataSource;
    q_itens: TFDQuery;
    ds_itens: TDataSource;
    Panel6: tsPanel;
    DBMemo1: TDBMemo;
    CheckTodos: tscheckbox;
    BtConferir: TsSpeedButton;
    btImprimir: TsSpeedButton;
    fR_RELATORIO: TfrxReport;
    btImportar: TsSpeedButton;
    mmPalmCHECADO: TBooleanField;
    Shape1: TShape;
    Shape2: TShape;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    tabConexaoVendor: TsTabSheet;
    gdConexaoVendor: Tdbgrid;
    q_conexao_vendor: TFDQuery;
    ds_conexao_vendor: TDataSource;
    q_arquivos: TFDQuery;
    q_pedidos: TFDQuery;
    q_pedidosnumdoc: TIntegerField;
    q_pedidosdtadoc: TDateField;
    q_pedidoscliente: TStringField;
    q_pedidostot_bruto: TBCDField;
    q_pedidostot_liquido: TBCDField;
    q_pedidosfop: TStringField;
    q_pedidosrepresentante: TStringField;
    q_pedidosprazo: TStringField;
    q_pedidosnr_pedido_palm: TStringField;
    q_pedidospalm_nr_conexao: TIntegerField;
    q_pedidosobservacoes_pedido: TMemoField;
    q_pedidospedido_vendedor: TStringField;
    q_conexao_vendornr_conexao: TIntegerField;
    q_conexao_vendorcod_representante: TIntegerField;
    q_conexao_vendordata_conexao: TDateField;
    q_conexao_vendorhora_conexao: TTimeField;
    q_conexao_vendortipo: TStringField;
    q_itensid: TIntegerField;
    q_itensnumdoc: TIntegerField;
    q_itensproduto: TStringField;
    q_itensqtd: TBCDField;
    q_itenspreco: TBCDField;
    q_itenssub_total: TBCDField;
    q_itensnr_pedido_palm: TStringField;
    q_itenspreco_bruto: TBCDField;
    q_itensperc_desc: TFMTBCDField;
    q_itensvolume: TBCDField;
    q_arquivosnome: TStringField;
    q_arquivosano: TIntegerField;
    q_arquivosarquivo: TBlobField;
    q_arquivosstatus: TStringField;
    q_conexao_vendornom_representante: TStringField;
    q_pedidosprocesso_id: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure CarregaDadosConexao;
    procedure CarregaDadosPedidoNovos;
    procedure CarregaDadosPedido(nr_conexao, dt_conexao: string);
    procedure CarregaDadosItem(numdoc: string);
    procedure dgPalmDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dgPalmKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dgPalmCellClick(Column: TColumn);
    procedure dgPalmEnter(Sender: TObject);
    procedure dgPedidoEnter(Sender: TObject);
    procedure dgPedidoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dgPedidoCellClick(Column: TColumn);
    procedure q_pedidosAfterOpen(DataSet: TDataSet);
    procedure CheckTodosClick(Sender: TObject);
    procedure BtConferirClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure fR_RELATORIOGetValue(const VarName: string; var Value: Variant);
    procedure dgPalmDblClick(Sender: TObject);
    procedure btImportarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dgPedidoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    procedure GerarCopiaOriginal(pedido: string);
    procedure ImprimirTablet(pedidos: string; checado: boolean);
    procedure ImprimirNotebook(pedido: string; novo: boolean);
    procedure CarregaConexaoVendor;
    procedure ListaPedidos(conexao, dt_conexao: string);
    { Private declarations }
  public
    { Public declarations }
    Aviso_Palm: boolean;
  end;

var
  FrPalmConexao: TFrPalmConexao;
  TotalSelecionados: Integer;
  lista_pedido_palm: string;

implementation

uses Un_dao, UnPri, Un_dm, UnFun, un_email_envio, Un_splash;

{$R *.dfm}

procedure TFrPalmConexao.FormShow(Sender: TObject);
begin
  if not Aviso_Palm then
  begin
    TabConexao.TabVisible := false;
    tabConexaoVendor.TabVisible := false;
    dgPedido.Columns[0].Visible := false;
    BtConferir.enabled := true;
    CheckTodos.Visible := false;
    BtConferir.Left := btImportar.Left;
    btImportar.Visible := false;

    CarregaConexaoVendor;
    CarregaDadosPedidoNovos;
  end
  else
  begin
    CarregaDadosConexao;
    tabConexaoVendor.TabVisible := false;
  end;
end;
// a.pedido_vendedor = ''1''

procedure TFrPalmConexao.CarregaConexaoVendor;
begin
  q_conexao_vendor.Close;
  q_conexao_vendor.sql.text :=
    'SELECT a.NR_CONEXAO, a.COD_REPRESENTANTE, cast(a.COD_REPRESENTANTE||''-''||r.NOM_REPRESENTANTE as varchar(100)) as NOM_REPRESENTANTE, a.DATA_CONEXAO, a.HORA_CONEXAO, a.TIPO '
    + 'FROM CONEXAO_VENDOR a inner join REPRESENTANTE r on r.id = a.COD_REPRESENTANTE order by a.data_conexao desc, a.hora_conexao desc limit 500 ';
  q_conexao_vendor.Open;
end;

procedure TFrPalmConexao.CarregaDadosPedidoNovos;
begin
  q_pedidos.Close;
  q_pedidos.sql.text :=
    'SELECT a.pedido_vendedor, a.NUMDOC, a.DTADOC, cast(a.COD_CLIENTE||''-''||c.NOM_CLIENTE as varchar(100)) as cliente, a.TOT_BRUTO, a.TOT_LIQUIDO, '
    + ' cast(a.COD_FOP||''-''||f.NOM_FOP as varchar(100)) as fop, cast(a.COD_REPRESENTANTE||''-''||r.NOM_REPRESENTANTE as varchar(100)) as representante, '
    + ' p.PRAZO, a.NR_PEDIDO_PALM, a.PALM_NR_CONEXAO, A.OBSERVACOES_PEDIDO, a.pedido_vendedor, a.processo_id '
    + ' FROM VENDAS1 a ' +
    ' inner join CLIENTE c on (c.COD_CLIENTE = a.COD_CLIENTE) ' +
    ' inner join REPRESENTANTE r on (r.id = a.COD_REPRESENTANTE) ' +
    ' left  join prazo p on (p.ID = a.COD_PRAZO_PGTO) ' +
    ' left join fop f on (f.COD_FOP = a.COD_FOP) ' +
    ' where a.orcamento = 0 and a.pedido_vendedor is not null and cast(a.DTADOC as date) >= (current_date - 30) '
    + ' order by numdoc desc';
  q_pedidos.Open;
end;

procedure TFrPalmConexao.CarregaDadosPedido(nr_conexao, dt_conexao: string);
begin
  q_pedidos.Close;
  q_pedidos.ParamByName('nr_conexao').value := nr_conexao;
  q_pedidos.ParamByName('dt_conexao').value := dt_conexao;
  q_pedidos.Open;
end;

procedure TFrPalmConexao.CarregaDadosItem(numdoc: string);
begin
  q_itens.Close;
  q_itens.ParamByName('numdoc').value := numdoc;
  q_itens.Open;
end;

procedure TFrPalmConexao.CarregaDadosConexao;
begin
  dao.Q1.Close;
  dao.Geral1
    ('SELECT a.CHECADO, a.NR_CONEXAO, R.ID||''-''||R.NOM_REPRESENTANTE as REPRESENTANTE, a.DATA_CONEXAO, a.HORA_CONEXAO, a.QTDE_PEDIDOS, a.QTDE_VISITAS_NEGATIVAS FROM PALM_LOTE a '
    + 'INNER JOIN REPRESENTANTE R ON (R.ID = A.COD_REPRESENTANTE) WHERE a.status = ''S'' and cast(a.DATA_CONEXAO as date) >= (current_date - 30) order by a.DATA_CONEXAO desc, a.hora_conexao desc');
  dao.Q1.first;
  mmPalm.Close;
  mmPalm.EmptyTable;
  mmPalm.Open;
  mmPalm.DisableControls;
  while not dao.Q1.eof do
  begin
    mmPalm.Append;
    mmPalmNR_CONEXAO.AsString := dao.Q1.fieldbyname('NR_CONEXAO').AsString;
    mmPalmREPRESENTANTE.AsString := dao.Q1.fieldbyname('REPRESENTANTE')
      .AsString;
    mmPalmDATA_CONEXAO.AsDateTime := dao.Q1.fieldbyname('DATA_CONEXAO').AsDateTime;
    mmPalmHORA.AsString := dao.Q1.fieldbyname('HORA_CONEXAO').AsString;
    mmPalmQTDE_PEDIDOS.AsString := dao.Q1.fieldbyname('QTDE_PEDIDOS').AsString;
    mmPalmQTDE_VISITAS_NEGATIVAS.AsString :=
      dao.Q1.fieldbyname('QTDE_VISITAS_NEGATIVAS').AsString;
    mmPalmCHECADO.Value := dao.Q1.fieldbyname('CHECADO').AsString = 'S';
    mmPalm.Post;
    dao.Q1.next;
  end;
  mmPalm.first;
  mmPalm.EnableControls;
end;

procedure TFrPalmConexao.dgPalmDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
  IsChecked: array [boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or
    DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  if mmPalmCHECADO.Value = true then
  begin
    dgPalm.Canvas.Font.Color := clGrayText;
    if gdSelected in State then
    begin
      dgPalm.Canvas.Brush.Color := clGray;
      dgPalm.Canvas.Font.Color := clWhite;
    end;
  end
  else
  begin
    dgPalm.Canvas.Font.Color := clPurple;
    if gdSelected in State then
    begin
      dgPalm.Canvas.Brush.Color := clPurple;
      dgPalm.Canvas.Font.Color := clWhite;
    end;
  end;

  dgPalm.DefaultDrawDataCell(Rect, Column.Field, State);

  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = DBCheckBox1.DataField) then
    begin
      DBCheckBox1.Left := Rect.Left + dgPalm.Left + 2;
      DBCheckBox1.Top := Rect.Top + dgPalm.Top + 2;
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

      dgPalm.Canvas.FillRect(Rect);
      DrawFrameControl(dgPalm.Canvas.Handle, DrawRect, DFC_BUTTON, DrawState);
    end;
  end;
end;

procedure TFrPalmConexao.dgPalmKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CarregaDadosPedido(mmPalmNR_CONEXAO.AsString, mmPalmDATA_CONEXAO.AsString);
end;

procedure TFrPalmConexao.dgPalmCellClick(Column: TColumn);
begin
  CarregaDadosPedido(mmPalmNR_CONEXAO.AsString, mmPalmDATA_CONEXAO.AsString);
end;

procedure TFrPalmConexao.dgPalmEnter(Sender: TObject);
begin
  CarregaDadosPedido(mmPalmNR_CONEXAO.AsString, mmPalmDATA_CONEXAO.AsString);
end;

procedure TFrPalmConexao.dgPedidoEnter(Sender: TObject);
begin
  CarregaDadosItem(q_pedidosNUMDOC.AsString);
end;

procedure TFrPalmConexao.dgPedidoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CarregaDadosItem(q_pedidosNUMDOC.AsString);
end;

procedure TFrPalmConexao.dgPedidoCellClick(Column: TColumn);
begin
  CarregaDadosItem(q_pedidosNUMDOC.AsString);
end;

procedure TFrPalmConexao.q_pedidosAfterOpen(DataSet: TDataSet);
begin
  q_pedidos.first;
  CarregaDadosItem(q_pedidosNUMDOC.AsString);
end;

procedure TFrPalmConexao.CheckTodosClick(Sender: TObject);
begin
  TotalSelecionados := 0;
  mmPalm.first;
  mmPalm.DisableControls;
  while not mmPalm.eof do
  begin
    mmPalm.Edit;

    if mmPalmCHECADO.Value = false then
      mmPalmcheck.Value := CheckTodos.Checked;

    if CheckTodos.Checked then
      TotalSelecionados := TotalSelecionados + 1
    else
      TotalSelecionados := 0;
    mmPalm.Post;
    mmPalm.next;
  end;
  mmPalm.first;
  mmPalm.EnableControls;

  if TotalSelecionados = 0 then
    BtConferir.enabled := false
  else
    BtConferir.enabled := true;
end;

procedure TFrPalmConexao.GerarCopiaOriginal(pedido: string);
var
  NumDoc: Int64;
begin
  NumDoc := StrToInt64Def(Trim(pedido), 0);
  if NumDoc = 0 then
    Exit;

  dao.ExecSql(
    'INSERT INTO VENDAS1_ORIG (NUMDOC, COD_REPRESENTANTE, DTADOC, HORA, COD_CLIENTE, FATURADO, COD_FOP, COD_PRAZO_PGTO, TOT_BRUTO, TOT_LIQUIDO, OBSERVACOES_PEDIDO) ' +
    'SELECT a.NUMDOC, a.COD_REPRESENTANTE, a.DTADOC, a.HORA, a.COD_CLIENTE, a.FATURADO, a.COD_FOP, a.COD_PRAZO_PGTO, a.TOT_BRUTO, a.TOT_LIQUIDO, a.OBSERVACOES_PEDIDO ' +
    'FROM VENDAS1 a ' +
    'WHERE a.NUMDOC = ' + IntToStr(NumDoc) + ' ' +
    '  AND NOT EXISTS (SELECT 1 FROM VENDAS1_ORIG o WHERE o.NUMDOC = a.NUMDOC)');

  dao.ExecSql(
    'INSERT INTO VENDAS2_ORIG (ID, NUMDOC, COD_PRODUTO, QTD, PRECO, SUB_TOTAL, PRECO_BRUTO, VOLUME, PROMOCAO, PRECO_CUSTO) ' +
    'SELECT a.ID, a.NUMDOC, a.COD_PRODUTO, a.QTD, a.PRECO, a.SUB_TOTAL, a.PRECO_BRUTO, a.VOLUME, a.PROMOCAO, a.PRECO_CUSTO ' +
    'FROM VENDAS2 a ' +
    'WHERE a.NUMDOC = ' + IntToStr(NumDoc) + ' ' +
    '  AND NOT EXISTS (SELECT 1 FROM VENDAS2_ORIG o WHERE o.ID = a.ID AND o.NUMDOC = a.NUMDOC)');
end;

procedure TFrPalmConexao.BtConferirClick(Sender: TObject);
var
  lista_pedidos: array of TPedidoData;
  PedidoData: TPedidoData;
  pedidos: string;
  conexao: string;
  x: Integer;
begin
  if Aviso_Palm then
  begin
    conexao := '';
    lista_pedido_palm := '';
    mmPalm.DisableControls;
    mmPalm.first;
    while not mmPalm.eof do
    begin
      if (mmPalmcheck.Value = true) and (mmPalmCHECADO.Value = false) then
      begin
        try
          if not dao.cn.InTransaction then
            dao.cn.StartTransaction;

          dao.Execsql
            ('UPDATE PALM_LOTE SET DATA_HORA_CHECADO = current_timestamp, CHECADO = ''S'', USUARIO_CHECOU = '
            + cod_usuario + ' WHERE NR_CONEXAO = ' + mmPalmNR_CONEXAO.AsString);

          if (mmPalmcheck.Value = true) and (mmPalmCHECADO.Value = false) then
          begin
            if lista_pedido_palm <> '' then
              lista_pedido_palm := lista_pedido_palm + ';';
            conexao := conexao + ';' + mmPalmNR_CONEXAO.AsString;
            ListaPedidos(mmPalmNR_CONEXAO.AsString, mmPalmDATA_CONEXAO.AsString);
          end;
          dao.cn.commit;
        except
          dao.cn.Rollback;
          exit;
        end;
      end;
      mmPalm.next;
    end;
    mmPalm.first;
    mmPalm.EnableControls;

    ImprimirTablet(lista_pedido_palm, false);

    CarregaDadosConexao;
  end
  else
  begin
    try
      q_pedidos.first;
      q_pedidos.DisableControls;

      pedidos := '';

      x := 0;
      while not q_pedidos.eof do
      begin
        if q_pedidosPEDIDO_VENDEDOR.AsString = '1' then
        begin
          PedidoData.numdoc := q_pedidos.fieldbyname('numdoc').AsString;
          PedidoData.processo := q_pedidos.fieldbyname('Processo_id').AsString;
          SetLength(lista_pedidos, (x + 1));
          lista_pedidos[x] := PedidoData;
          pedidos := pedidos + q_pedidos.fieldbyname('numdoc').AsString + ';';
          x := x + 1;
        end;
        q_pedidos.next;
      end;

      pedidos := copy(pedidos, 1, length(pedidos) - 1);

      if length(lista_pedidos) = 0 then
      begin
        showmessage('Não há pedidos à conferir!');
        exit;
      end;

      for x := 0 to length(lista_pedidos) - 1 do
      begin
        try
          PedidoData := lista_pedidos[x];

          FMFUN.AtualizaDadosComissao(PedidoData.numdoc);

          if not dao.cn.InTransaction then
            dao.cn.StartTransaction;


          GerarCopiaOriginal(PedidoData.numdoc);
          dao.Execsql('UPDATE VENDAS1 SET PEDIDO_VENDEDOR = ''2'', USUARIO_CHECOU_PEDIDO_VENDEDOR = '+ cod_usuario + ' WHERE NUMDOC = ' + PedidoData.numdoc);
          dao.Execsql('UPDATE VENDAS1_ORIG SET USUARIO_CHECOU_PEDIDO_VENDEDOR = '+ cod_usuario + ' WHERE NUMDOC = ' + PedidoData.numdoc);
          dao.cn.commit;
          FMFUN.GravarProcessoPedido('À DIGITAR', PedidoData.processo, PedidoData.numdoc);
        except
          dao.cn.Rollback;
          exit;
        end;
      end;
      q_pedidos.first;
      CarregaDadosPedidoNovos;
      q_pedidos.EnableControls;
    finally
      ImprimirNotebook(pedidos, true);
    end;
  end;
end;

procedure TFrPalmConexao.ImprimirTablet(pedidos: string; checado: boolean);
var
  cmd, path: string;
begin
  path := ExtractFilePath(Application.ExeName);

  if not checado then
  begin
    cmd := 'SELECT a.NR_CONEXAO, a.COD_REPRESENTANTE, a.DATA_CONEXAO, a.HORA_CONEXAO, a.QTDE_PEDIDOS, a.QTDE_VISITAS_NEGATIVAS, a.CHECADO, cast(a.USUARIO_CHECOU||''-''||u.NOME as varchar(200)) as USUARIO_CHECOU, a.DATA_HORA_CHECADO, '
      + ' v1.NUMDOC, v1.numdoc_destino, v1.DTADOC, cast(c.COD_CLIENTE||''-''||c.NOM_CLIENTE as varchar(200)) as cliente, c.ENDERECO, c.telefone, c.NR_ENDERECO, c.CEP, cast(cid.NOM_CIDADE||''-''||cid.UF as varchar(200)) as cidade, '
      + ' C.CNPJ, C.IE, C.RG,C.CPF, C.EMAIL, v1.TOT_BRUTO, cast(v1.TOT_LIQUIDO as Numeric(15,2)) as tot_liquido, '
      + ' cast(v1.COD_FOP||''-''||f.NOM_FOP as varchar(200)) as fop, cast(v1.COD_REPRESENTANTE||''-''||r.NOM_REPRESENTANTE as varchar(200)) as representante, p.PRAZO, v1.NR_PEDIDO_PALM, v1.PALM_NR_CONEXAO, v1.OBSERVACOES_PEDIDO, '
      + ' v2.ID, v2.NUMDOC, cast(v2.COD_PRODUTO||''-''||pr.NOM_PRODUTO as varchar(200)) as produto, pr.unidade, v2.QTD, v2.PRECO, v2.SUB_TOTAL, v2.NR_PEDIDO_PALM, v2.PRECO_BRUTO, (((v2.PRECO_BRUTO - v2.PRECO)/v2.PRECO_BRUTO) * 100) AS PERC_DESC, v2.VOLUME, '
      + ' '''' as NCM, ' +
      ' 0  as VLR_ICMS_ST, ' +
      ' 0  as perc_st, ' +
      ' pr.codigo_barra ' + ' FROM PALM_LOTE a ' +
      ' inner join tbusu u on (u.CODUSU = a.USUARIO_CHECOU) ' +
      ' inner join vendas1 v1 on (v1.PALM_NR_CONEXAO = a.NR_CONEXAO)' +
      ' inner join vendas2 v2 on (v2.NUMDOC = v1.NUMDOC)' +
      ' LEFT OUTER join CLIENTE c on (c.COD_CLIENTE = v1.COD_CLIENTE)' +
      ' LEFT OUTER join Cidades cid on (cid.COD_Cidade = c.COD_cidade)' +
      ' LEFT OUTER join REPRESENTANTE r on (r.id = v1.COD_REPRESENTANTE)' +
      ' LEFT OUTER join prazo p on (p.ID = v1.COD_PRAZO_PGTO) ' +
      ' LEFT OUTER join fop f on (f.COD_FOP = v1.COD_FOP) ' +
      ' LEFT OUTER join produto pr on (pr.COD_PRODUTO = v2.COD_PRODUTO) WHERE 1 = 1 ';
    cmd := cmd + FMFUN.cmdAux('v1.numdoc', pedidos);
    cmd := cmd + ' and a.cod_representante = v1.cod_representante and a.data_conexao >= v1.dtadoc ';
    cmd := cmd +
      ' order by  a.COD_REPRESENTANTE, a.NR_CONEXAO, v1.numdoc, pr.ord_pauta, v2.VOLUME  ';

  end
  else
  begin
    cmd := 'SELECT a.NR_CONEXAO, a.COD_REPRESENTANTE, a.DATA_CONEXAO, a.HORA_CONEXAO, a.QTDE_PEDIDOS, a.QTDE_VISITAS_NEGATIVAS, a.CHECADO, cast(a.USUARIO_CHECOU||''-''||u.NOME as varchar(200)) as USUARIO_CHECOU, a.DATA_HORA_CHECADO, '
      + ' vd1.numdoc, vd1.numdoc_destino, vd1.DTADOC, cast(c.COD_CLIENTE||''-''||c.NOM_CLIENTE as varchar(200)) as cliente, c.ENDERECO, c.telefone, c.NR_ENDERECO, c.CEP, cast(cid.NOM_CIDADE||''-''||cid.UF as varchar(200)) as cidade, C.CNPJ, C.IE, '
      + ' C.RG,C.CPF, C.EMAIL, vd1.TOT_BRUTO, cast(vd1.TOT_LIQUIDO as numeric(15,2)) as tot_liquido, '
      + ' cast(vd1.COD_FOP||''-''||f.NOM_FOP as varchar(200)) as fop, cast(vd1.COD_REPRESENTANTE||''-''||r.NOM_REPRESENTANTE as varchar(200)) as representante, p.PRAZO, vd1.PALM_NR_CONEXAO, vd1.OBSERVACOES_PEDIDO, '
      + ' vd2.ID, cast(vd1.NR_PEDIDO_PALM as varchar(10)) as NR_PEDIDO_PALM, cast(vd2.COD_PRODUTO||''-''||pr.NOM_PRODUTO as varchar(200)) as produto, pr.unidade, vd2.QTD, vd2.PRECO, '
      + ' vd2.SUB_TOTAL, vd2.NR_PEDIDO_PALM, vd2.PRECO_BRUTO, (((vd2.PRECO_BRUTO - vd2.PRECO)/vd2.PRECO_BRUTO) * 100) AS PERC_DESC, vd2.VOLUME, ' +
      ' '''' as NCM, ' +
      ' 0  as VLR_ICMS_ST, ' +
      ' 0  as perc_st, ' +
      ' pr.codigo_barra ' +
      ' FROM PALM_LOTE a ' +
      ' inner join tbusu u on (u.CODUSU = a.USUARIO_CHECOU) ' +
      ' inner join vendas1 vd1 on vd1.PALM_NR_CONEXAO = a.NR_CONEXAO ' +
      ' inner join vendas2 vd2 on vd1.numdoc = vd2.numdoc ' +
      ' LEFT OUTER join CLIENTE c on (c.COD_CLIENTE = vd1.COD_CLIENTE)' +
      ' LEFT OUTER join Cidades cid on (cid.COD_Cidade = c.COD_cidade)' +
      ' LEFT OUTER join REPRESENTANTE r on (r.id = vd1.COD_REPRESENTANTE)' +
      ' LEFT OUTER join prazo p on (p.ID = vd1.COD_PRAZO_PGTO) ' +
      ' LEFT OUTER join fop f on (f.COD_FOP = vd1.COD_FOP) ' +
      ' LEFT OUTER join produto pr on (pr.COD_PRODUTO = vd2.COD_PRODUTO) WHERE 1 = 1 ';

    cmd := cmd + FMFUN.cmdAux('vd1.numdoc', pedidos);
    cmd := cmd + ' and a.cod_representante = vd1.cod_representante and a.data_conexao >= vd1.dtadoc ';
    cmd := cmd +
      ' order by  a.COD_REPRESENTANTE, a.NR_CONEXAO, vd1.numdoc, pr.ord_pauta, vd2.VOLUME  ';

  end;

  with dm.q_palm_pedidos do
  begin
    Close;
    sql.Clear;
    sql.add(cmd);
    Open;
  end;

  deletefile(ExtractFilePath(Application.ExeName) + 'conexao.sql');
  /// Fim do teste

  if dm.q_palm_pedidos.RecordCount = 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not(fR_RELATORIO.LoadFromFile(path + 'Relatorios\palm_pedidos.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 +
      'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;
end;

procedure TFrPalmConexao.ImprimirNotebook(pedido: string; novo: boolean);
var
  cmd, path: string;
begin
  if novo then
  begin
    cmd := 'SELECT v1.COD_REPRESENTANTE, v1.USUARIO_CHECOU_PEDIDO_VENDEDOR||''-''||u.NOME as USUARIO_CHECOU, '
      + ' v1.NUMDOC, v1.DTADOC, c.COD_CLIENTE||''-''||c.NOM_CLIENTE as cliente, c.ENDERECO, c.NR_ENDERECO, c.CEP, cid.NOM_CIDADE||''-''||cid.UF as cidade, C.CNPJ, C.IE, C.RG,C.CPF, C.EMAIL, v1.TOT_BRUTO, cast(v1.TOT_LIQUIDO as numeric(15,2)) as tot_liquido, '
      + ' v1.COD_FOP||''-''||f.NOM_FOP as fop, v1.COD_REPRESENTANTE||''-''||r.NOM_REPRESENTANTE as representante, p.PRAZO, v1.NR_PEDIDO_PALM, v1.PALM_NR_CONEXAO, v1.OBSERVACOES_PEDIDO, '
      + ' v2.ID, v2.COD_PRODUTO||''-''||pr.NOM_PRODUTO as produto, pr.unidade, v2.QTD, v2.PRECO, v2.SUB_TOTAL, v2.PRECO_BRUTO, (((v2.PRECO_BRUTO - v2.PRECO)/v2.PRECO_BRUTO) * 100) AS PERC_DESC, v2.VOLUME, '
      + ' '''' as NCM, ' + ' 0  as VLR_ICMS_ST, ' + ' 0  as perc_st ' +
      ' FROM vendas1 v1 ' +
      ' LEFT OUTER join tbusu u on (u.CODUSU = v1.USUARIO_CHECOU_PEDIDO_VENDEDOR) '
      + ' inner join vendas2 v2 on (v2.NUMDOC = v1.NUMDOC)' +
      ' inner join CLIENTE c on (c.COD_CLIENTE = v1.COD_CLIENTE)' +
      ' inner join Cidades cid on (cid.COD_Cidade = c.COD_cidade)' +
      ' inner join REPRESENTANTE r on (r.id = v1.COD_REPRESENTANTE)' +
      ' inner join prazo p on (p.ID = v1.COD_PRAZO_PGTO)' +
      ' inner join fop f on (f.COD_FOP = v1.COD_FOP) ' +
      ' inner join produto pr on (pr.COD_PRODUTO = v2.COD_PRODUTO) WHERE 1 = 1 ';

    cmd := cmd + FMFUN.cmdAux('v1.numdoc', pedido);

    cmd := cmd +
      ' order by  representante, v1.NUMDOC, v2.COD_PRODUTO, v2.VOLUME ';
  end
  else
  begin
    cmd := 'SELECT v1.COD_REPRESENTANTE, v1.USUARIO_CHECOU_PEDIDO_VENDEDOR||''-''||u.NOME as USUARIO_CHECOU, '
      + ' v1.NUMDOC, v1.DTADOC, c.COD_CLIENTE||''-''||c.NOM_CLIENTE as cliente, c.ENDERECO, c.NR_ENDERECO, c.CEP, cid.NOM_CIDADE||''-''||cid.UF as cidade, C.CNPJ, C.IE, C.RG,C.CPF, C.EMAIL, v1.TOT_BRUTO, cast(v1.TOT_LIQUIDO as numeric(15,2)) as tot_liquido, '
      + ' v1.COD_FOP||''-''||f.NOM_FOP as fop, v1.COD_REPRESENTANTE||''-''||r.NOM_REPRESENTANTE as representante, p.PRAZO, '''' as NR_PEDIDO_PALM, 0 as PALM_NR_CONEXAO, v1.OBSERVACOES_PEDIDO, '
      + ' v2.ID, v2.COD_PRODUTO||''-''||pr.NOM_PRODUTO as produto, pr.unidade, v2.QTD, v2.PRECO, v2.SUB_TOTAL, v2.PRECO_BRUTO, (((v2.PRECO_BRUTO - v2.PRECO)/v2.PRECO_BRUTO) * 100) AS PERC_DESC, v2.VOLUME, '
      + ' '''' as NCM, ' + ' 0  as VLR_ICMS_ST, ' + ' 0  as perc_st ' +
      ' FROM vendas1_orig v1 ' +
      ' LEFT OUTER join tbusu u on (u.CODUSU = v1.USUARIO_CHECOU_PEDIDO_VENDEDOR) '
      + ' inner join vendas2_orig v2 on (v2.NUMDOC = v1.NUMDOC)' +
      ' inner join CLIENTE c on (c.COD_CLIENTE = v1.COD_CLIENTE)' +
      ' inner join Cidades cid on (cid.COD_Cidade = c.COD_cidade)' +
      ' inner join REPRESENTANTE r on (r.id = v1.COD_REPRESENTANTE)' +
      ' inner join prazo p on (p.ID = v1.COD_PRAZO_PGTO)' +
      ' inner join fop f on (f.COD_FOP = v1.COD_FOP) ' +
      ' inner join produto pr on (pr.COD_PRODUTO = v2.COD_PRODUTO) WHERE 1 = 1 ';

    cmd := cmd + FMFUN.cmdAux('v1.numdoc', pedido);

    cmd := cmd +
      ' order by  representante, v1.NUMDOC, v2.COD_PRODUTO, v2.VOLUME ';
  end;

  with dm.q_pedidos_vendedor do
  begin
    Close;
    sql.Clear;
    sql.add(cmd);
    Open;
  end;

  if dm.q_pedidos_vendedor.RecordCount = 0 then
  begin

    if novo then
      dao.msg('Não foi encontrado registro neste periodo!')
    else
      ImprimirNotebook(pedido, true);

    exit;
  end;

  if not(fR_RELATORIO.LoadFromFile(path + 'Relatorios\pedidos_vendedor.fr3'))
  then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 +
      'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFrPalmConexao.ListaPedidos(conexao, dt_conexao: string);
begin
  dao.Geral1('select v1.numdoc, v1.processo_id from vendas1 v1 inner join palm_lote l on l.nr_conexao = v1.palm_nr_conexao and v1.cod_representante = l.cod_representante where l.data_conexao = '''+dt_conexao+''' and v1.PALM_NR_CONEXAO in ('+conexao+')');
  while not dao.Q1.eof do
  begin
    lista_pedido_palm := lista_pedido_palm + dao.Q1.fieldbyname('numdoc').AsString + ';';
    FMFUN.GravarProcessoPedido('À DIGITAR', dao.Q1.fieldbyname('processo_id').AsString, dao.Q1.fieldbyname('numdoc').AsString);
    dao.Q1.next;
  end;
  lista_pedido_palm := copy(lista_pedido_palm, 1, length(lista_pedido_palm) - 1);
end;

procedure TFrPalmConexao.btImprimirClick(Sender: TObject);
var
  cmd, path: string;
  EmailConexao: TEmail;
begin
  path := ExtractFilePath(Application.ExeName);
  lista_pedido_palm := '';
  if Aviso_Palm then
  begin
    if mmPalmCHECADO.Value = false then
    begin
      showmessage('Só pode ser impressos apenas pedidos conferidos!');
      exit;
    end
    else
    begin
      ListaPedidos(mmPalmNR_CONEXAO.AsString, mmPalmDATA_CONEXAO.AsString);
      ImprimirTablet(lista_pedido_palm, mmPalmCHECADO.Value);
    end;
  end
  else
  begin
    if q_pedidosPEDIDO_VENDEDOR.AsString = '1' then
    begin
      showmessage('Só pode ser impressos apenas pedidos conferidos!');
      exit;
    end
    else
      ImprimirNotebook(q_pedidosNUMDOC.AsString, false);
  end;

end;

procedure TFrPalmConexao.fR_RELATORIOGetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'empresa' then
    Value := nom_empresa
  else if VarName = 'dtaini' then
    Value := formatdatetime('dd/mm/yyyy', now)
  else if VarName = 'dtafin' then
    Value := formatdatetime('dd/mm/yyyy', now)
end;

procedure TFrPalmConexao.dgPalmDblClick(Sender: TObject);
begin
  if mmPalmCHECADO.Value = true then
  begin
    showmessage('Já Conferido!');
    exit;
  end;

  mmPalm.Edit;
  if mmPalmcheck.Value = true then
  begin
    mmPalmcheck.Value := false;
    TotalSelecionados := TotalSelecionados - 1;
  end
  else
  begin
    mmPalmcheck.Value := true;
    TotalSelecionados := TotalSelecionados + 1;
  end;
  mmPalm.Post;

  if TotalSelecionados = 0 then
    BtConferir.enabled := false
  else
    BtConferir.enabled := true;
end;
(*
  constructor TPalmImportacao.Create;
  begin
  fmPrincipal.TmImport.Enabled := false;
  //  fmPrincipal.TmExport.Enabled := false;

  //  DecimalSeparator := ',';
  inherited Create(True);
  { Chama o contrutor herdado. Ele irá temporariamente colocar o thread em estado de espera para depois executá-lo. }
  FreeOnTerminate := True; // Libera o objeto após terminar.
  Priority := tpHigher;
  { Configura sua prioridade na lista de processos do Sistema operacional. }
  Resume; // Inicia o Thread.
  end;

  procedure TPalmImportacao.Execute;
  begin
  try
  BuscaArquivosImportacao;
  ExportaFotosProdutos;
  ExportarCatalogo;
  EmailNota;
  except
  if not dao.CN.Connected then
  dao.CN.Connect;
  fmPrincipal.TmImport.Enabled := true;
  free;
  end;
  end;

  procedure TPalmImportacao.Mostra;
  begin
  fmPrincipal.pgArquivos.MaxValue := total_arq;
  fmPrincipal.pgPedidos.MaxValue := total_ped;
  fmPrincipal.pgArquivos.progress := cont_arq;
  fmPrincipal.pgPedidos.progress := cont_ped;
  if not finalizou then
  begin
  fmPrincipal.lbArquivos.Caption := 'Importando ' + inttostr(cont_arq) +
  ' até ' + inttostr(total_arq) + ' >> Arquivo ' + nom_arq + '...';
  fmPrincipal.lbPedidos.Caption := 'Importando ' + inttostr(cont_ped) + ' até '
  + inttostr(total_ped) + ' >> Pedido n°: ' + pedido_nr + '...';
  end
  else
  begin
  fmPrincipal.lbArquivos.Caption := '.';
  fmPrincipal.lbPedidos.Caption := '.';
  //    fmPrincipal.TmExport.Interval := 3600000;
  //    fmPrincipal.TmExport.Interval := 1200000;

  //    fmPrincipal.TmImport.Interval := 3720000;
  fmPrincipal.TmImport.Interval := 180000;

  //    fmPrincipal.TmEmail.Interval := 5000;
  fmPrincipal.TmImport.Enabled := true;
  //    fmPrincipal.TmExport.Enabled := true;
  //    fmPrincipal.TmEmail.Enabled := true;
  end;
  fmPrincipal.Update;
  Sleep(2000);
  end;

  procedure TPalmImportacao.BuscaArquivosImportacao;
  var
  F: TSearchRec;
  Ret: Integer;
  TempNome, pathSaida: string;
  prog: string;
  progC: PAnsiChar;
  begin
  finalizou := false;
  cont_arq := 0;
  pathSaida := ExtractFilePath(Application.ExeName) + 'pedidos\';
  Ret := FindFirst(pathSaida + '*.txt', faAnyFile, F);

  total_arq := 0;
  while Ret = 0 do
  begin
  total_arq := total_arq + 1;
  Ret := FindNext(F);
  end;

  if total_arq = 0 then
  begin
  Prog := 'c:\destrava.bat';
  ProgC := PAnsiChar(Prog);
  WinExec(ProgC, SW_SHOWNORMAL);

  Prog := pathSaida + 'DestravarTablet.bat';
  ProgC := PAnsiChar(Prog);
  WinExec(ProgC, SW_SHOWNORMAL);
  end;

  Ret := FindFirst(pathSaida + '*.txt', faAnyFile, F);
  try
  while Ret = 0 do
  begin
  nom_arq := F.Name;
  cont_arq := cont_arq + 1;
  Synchronize(Mostra);
  ImportarPedidoPalm4(pathSaida + F.Name);
  //RenameFile(pathSaida + F.Name, pathSaida + F.Name + '.ped');
  //      DeleteFile(pathSaida + F.Name);
  Ret := FindNext(F);
  end;
  finally
  begin
  cont_arq := 0;
  total_arq := 0;
  cont_ped := 0;
  total_ped := 0;
  finalizou := true;
  Synchronize(Mostra);
  FindClose(F);

  end;
  end;
  end;



*)

procedure TFrPalmConexao.btImportarClick(Sender: TObject);
var
  PedidosImport: TPedidos;
begin
  if Aviso_Palm then
  begin
    // CarregarArquivosTablet;
    PedidosImport := TPedidos.Create();
  end;
end;

procedure TFrPalmConexao.FormCreate(Sender: TObject);
begin
  if not Aviso_Palm then
    FrPalmConexao.Caption := 'Pedidos Enviados pelos Representantes';
end;

procedure TFrPalmConexao.dgPedidoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if q_pedidosPEDIDO_VENDEDOR.AsString = '1' then
  begin
    dgPedido.Canvas.Font.Color := clPurple;
    if gdSelected in State then
    begin
      dgPedido.Canvas.Brush.Color := clPurple;
      dgPedido.Canvas.Font.Color := clWhite;
    end;
  end
  else
  begin
    dgPedido.Canvas.Font.Color := clGrayText;
    if gdSelected in State then
    begin
      dgPedido.Canvas.Brush.Color := clGray;
      dgPedido.Canvas.Font.Color := clWhite;
    end;
  end;

  dgPedido.DefaultDrawDataCell(Rect, Column.Field, State);

end;

constructor TPedidos.Create();
begin
  inherited Create(true);
  { Chama o contrutor herdado. Ele irá temporariamente colocar o thread em estado de espera para depois executá-lo. }
  FreeOnTerminate := true; // Libera o objeto após terminar.
  Priority := TpLower;
  Resume; // Inicia o Thread.
end;

procedure TPedidos.Execute;
begin
  CoInitialize(nil);
  CarregarArquivosTablet;
  FrPalmConexao.CarregaDadosConexao;
  //showmessage('Importação Efetuada com Sucesso!!!');
  CoUnInitialize;
end;

procedure TPedidos.Mostra;
begin

end;

procedure TPedidos.CarregarArquivosTablet;
var
  pathSaida: string;
  F: TSearchRec;
  x, total_arq, Ret: Integer;
  Arquivos: TStringList;
  Arquivos_Lista: string;

begin
  Arquivos := TStringList.Create;
  pathSaida := ExtractFilePath(Application.ExeName) + 'pedidos_tablet\';
  if not DirectoryExists(pathSaida) then
    ForceDirectories(pathSaida);

  { if not dm.ftpPedidosTablet.Connected then
    dm.ftpPedidosTablet.Connect;
    dm.ftpPedidosTablet.TransferType := ftASCII;
    dm.ftpPedidosTablet.List(Arquivos, '*.txt', false); }

  FrPalmConexao.q_arquivos.Open;

  // if Arquivos.Count = 0 then
  if FrPalmConexao.q_arquivos.IsEmpty then
  begin
    showmessage('Não pedidos há importar.');
    exit;
  end;

  total_arq := FrPalmConexao.q_arquivos.RecordCount;

  fm_splash.pgArquivos.Visible := true;
  fm_splash.lbArquivos.Visible := true;
  fm_splash.pgArquivos.MaxValue := total_arq - 1;
  fm_splash.lbArquivos.Caption := 'Importando Pedidos Tablet...';
  fm_splash.lbStatus.Caption := '...';
  fm_splash.pgArquivos.Progress := 0;
  fm_splash.ggProgress.Progress := 0;
  fm_splash.Show;

  lista_pedido_palm := '';
  x := 0;
  // try
  // for x := 0 to Arquivos.Count - 1 do
  FrPalmConexao.q_arquivos.first;
  while not FrPalmConexao.q_arquivos.eof do
  begin
    fm_splash.lbArquivos.Caption := 'Importando Pedidos Tablet -> Arquivo ' +
      FrPalmConexao.q_arquivosNOME.AsString + ' : ' + inttostr(x + 1) + ' de ' +
      inttostr(total_arq);

    fm_splash.Refresh;

    deletefile(pathSaida + FrPalmConexao.q_arquivosNOME.AsString);
    // dm.ftpPedidosTablet.Get(Arquivos[x], pathSaida + Arquivos[x]);
    FrPalmConexao.q_arquivosARQUIVO.savetofile
      (pathSaida + FrPalmConexao.q_arquivosNOME.AsString);

    ImportarPedidoPalm(pathSaida + FrPalmConexao.q_arquivosNOME.AsString);

    Arquivos_Lista := Arquivos_Lista +
      quotedstr(FrPalmConexao.q_arquivosNOME.AsString) + ',';

    x := x + 1;
    fm_splash.pgArquivos.AddProgress(1);
    fm_splash.Refresh;

    FrPalmConexao.q_arquivos.next;
  end;
  // except
  // MessageDlg('Erro ao baixar o arquivo.', mtError, [mbok], 2);
  // end;
  fm_splash.pgArquivos.Visible := false;
  fm_splash.lbArquivos.Visible := false;
  fm_splash.Close;

  Arquivos_Lista := copy(Arquivos_Lista, 1, length(Arquivos_Lista) - 1);

  if not(dao.cn.InTransaction) then
    dao.cn.StartTransaction;
  dao.Exec_sql.sql.text := 'UPDATE PALM_ARQUIVOS SET STATUS = 1 WHERE NOME in ('
    + Arquivos_Lista + ') AND ANO = ' + FrPalmConexao.q_arquivosANO.AsString;
  dao.Exec_sql.Execsql;
  dao.cn.commit;

  // Arquivos.Free;
  // dm.ftpPedidosTablet.connected := false;
end;

function TPedidos.ImportarPedidoPalm(arquivo: string): boolean;
var
  pedidoLote: TStringList;
  fim_do_pedido, Duplicado, cliente_isento_icms, novo_cliente_completo,
    erroLote: boolean;
  sql_insert, sql_insert_palm, sql_geral, nr_conexao, numdoc, nr_pedido_palm,
    UF_Cliente, cst, processo, cod_fiscal_item, volume, cliente_cnpj_cpf,
    cod_produto, str_total_liquido, str_total_bruto, observacao, forma_pgto,
    data, data_str, hora, pedido_nr, orcamento: string;

  x, y, tot_linhas, Aliquota_ICMS_Interno, tot_clientes_novos, qtd_cliente_novo,
    ind_cliente: Integer;
  VLR_BC, SUB_TOTAL, VLR_ICMS_ITEM, VLR_BC_ST, MVA, VLR_AGR_ITEM, ICMS_ITEM,
    vlr_icms_st, ipi_item, vlr_ipi_item, perc_desc, valor_desc, perc_comissao,
    custo, vlr_comissao, qtd, total_itens, total_liquido, total_bruto: real;
  // Pré Cadastro de Clientes
  data_cad, representante, cod_tablet, cliente, tipo_pessoa, Razao_Social,
    Fantasia, CNPJ, IE, CPF, ENDERECO, NUMERO, COMPLEMENTO, PONTO_REF, BAIRRO,
    CEP, CIDADE, UF, TELEFONE, FAX, CONTATO, CELULAR, F_PGTO, PRAZO_PGTO, EMAIL,
    OBS, COD_CIDADE: string;

  total_ped, cont_ped, total_item, num_item: Integer;
  pedidos_check: TStringList;
  Cliente_Temp_Cod, Cliente_Cod: array of string;
  procedure CalculoIcmsItem;
  begin
    VLR_BC := SUB_TOTAL;

    VLR_ICMS_ITEM := VLR_BC * (ICMS_ITEM / 100);
    if (cst = '60') or (cst = '90') then
    begin
      // Buscar a Base de Cáculo ST
      VLR_BC_ST := RoundTo((SUB_TOTAL * (1 + (MVA / 100))), -2);
      vlr_icms_st := RoundTo(((VLR_BC_ST * (Aliquota_ICMS_Interno / 100)) -
        VLR_ICMS_ITEM), -2);
      VLR_BC := 0;
      VLR_ICMS_ITEM := 0;
      VLR_AGR_ITEM := MVA;
      ICMS_ITEM := 0;
    end
    else
    begin
      VLR_BC_ST := 0;
      vlr_icms_st := 0;
      VLR_AGR_ITEM := 0;
    end;

    if cliente_isento_icms then
    begin
      VLR_BC_ST := 0;
      vlr_icms_st := 0;
      VLR_BC := 0;
      VLR_ICMS_ITEM := 0;
      ICMS_ITEM := 0;
    end;
  end;

  function ChecarPedidoItem(pedido, produto: string): boolean;
  begin
    dao.Geral1('SELECT TIPO_SISTEMA FROM REPRESENTANTE WHERE ID = ' +
      representante);

    if dao.Q1.fieldbyname('TIPO_SISTEMA').AsString = '0' then
    begin
      dao.Geral5('SELECT id FROM VENDAS2 WHERE numdoc = ' + pedido +
        ' and cod_produto = ' + produto);
      Result := dao.q5.IsEmpty;
    end
    else
      Result := true;
  end;

  function ChecarPedidoPalm(representante, data, hora,
    pedido_palm: string): boolean;
  begin
    dao.Geral1
      ('SELECT numdoc, NR_PEDIDO_PALM FROM VENDAS1 WHERE COD_representante = ' +
      inttostr(strtoint(representante)) + ' AND DTADOC = ' + data +
      ' and HORA = ' + hora);

    if dao.Q1.RecordCount > 1 then
    begin
      dao.Geral1
        ('SELECT numdoc, NR_PEDIDO_PALM FROM VENDAS1 WHERE NR_PEDIDO_PALM = ' +
        pedido_palm);
      Result := dao.Q1.IsEmpty;
      numdoc := dao.Q1.fieldbyname('numdoc').AsString;
    end
    else
    begin
      Result := dao.Q1.IsEmpty;
      numdoc := dao.Q1.fieldbyname('numdoc').AsString;
    end;

  end;

  function ChecarLote(conexao: string): boolean;
  begin
    dao.Geral1('SELECT NR_CONEXAO FROM PALM_LOTE WHERE NR_CONEXAO = ' +
      inttostr(strtoint(conexao)));
    Result := dao.Q1.IsEmpty;
  end;

  function BuscaRep: string;
  begin
    dao.Geral1('SELECT id FROM REPRESENTANTE WHERE cod_tablet = ' + cod_tablet);

    Result := dao.Q1.fieldbyname('id').AsString;
  end;

  procedure LimparRegistros(conexao: string);
  begin
    dao.Execsql
      ('delete from PEDIDO_PALM2 p where p.NR_PEDIDO_PALM in (select p.NR_PEDIDO_PALM from PEDIDO_PALM1 p where p.PALM_NR_CONEXAO = '
      + conexao + ')');
    dao.Execsql
      ('delete from vendas2 v2 where v2.numdoc in (select v1.numdoc from vendas1 v1 where v1.PALM_NR_CONEXAO = '
      + conexao + ')');
    dao.Execsql('delete from vendas1 p where p.PALM_NR_CONEXAO = ' + conexao);
    dao.Execsql('delete from PEDIDO_PALM1 p where p.PALM_NR_CONEXAO = '
      + conexao);
    dao.Execsql('delete from PALM_LOTE p where p.NR_CONEXAO = ' + conexao);
  end;

  procedure ContarPedidos;
  var
    x: Integer;
  begin
    for x := 0 to tot_linhas - 1 do
    begin
      if copy(pedidoLote[x], 1, 2) = '70' then
        total_ped := total_ped + 1;
    end;
  end;

  procedure ContarClientesNovos;
  var
    x: Integer;
  begin
    for x := 0 to tot_linhas - 1 do
    begin
      if copy(pedidoLote[x], 1, 2) = '65' then
        tot_clientes_novos := tot_clientes_novos + 1;
    end;
  end;

  procedure CadastrarLote;
  begin
    if copy(pedidoLote[x], 1, 2) = '60' then
    begin
      nr_conexao := copy(pedidoLote[x], 6, 6);
      // LimparRegistros(nr_conexao);
      if ChecarLote(nr_conexao) then
      begin
        if not(dao.cn.InTransaction) then
          dao.cn.StartTransaction;

        cod_tablet := copy(pedidoLote[x], 3, 3);
        representante := BuscaRep;

        sql_insert :=
          'INSERT INTO PALM_LOTE (NR_CONEXAO, COD_REPRESENTANTE, DATA_CONEXAO, HORA_CONEXAO, QTDE_PEDIDOS, QTDE_VISITAS_NEGATIVAS, CHECADO) '
          + ' VALUES (' + nr_conexao + ',' + representante + ',' +
          quotedstr(FMFUN.InverteData(copy(pedidoLote[x], 12, 10))) + ',' +
          quotedstr(copy(pedidoLote[x], 22, 5)) + ',' + copy(pedidoLote[x], 27,
          3) + ',' + copy(pedidoLote[x], 30, 3) + ',''N'')';
        dao.Execsql(sql_insert);
        dao.grava_log(sql_insert, '20');
        dao.cn.commit;
      end;
      data_cad := quotedstr(FMFUN.InverteData(copy(pedidoLote[x], 12, 10)));
    end;

  end;

  procedure CadastrarClientesNovos;
  begin
    if tot_clientes_novos > 0 then
    begin
      if copy(pedidoLote[x], 1, 2) = '65' then
      begin
        tipo_pessoa := copy(pedidoLote[x], 12, 1);
        if tipo_pessoa = 'J' then
          cliente_cnpj_cpf := BuscarClientePorCPFCNPJ
            (copy(pedidoLote[x], 133, 18)) // CNPJ
        else
          cliente_cnpj_cpf := BuscarClientePorCPFCNPJ
            (copy(pedidoLote[x], 171, 14)); // CPF

        cliente := copy(pedidoLote[x], 6, 6);

        if length(Cliente_Temp_Cod) <> tot_clientes_novos then
        begin
          qtd_cliente_novo := 0;
          SetLength(Cliente_Temp_Cod, tot_clientes_novos);
        end;

        if length(Cliente_Cod) <> tot_clientes_novos then
          SetLength(Cliente_Cod, tot_clientes_novos);

        if cliente_cnpj_cpf = '0' then
        begin
          novo_cliente_completo := false;

          dao.Geral1('SELECT nextval(''Gen_Cliente'') as codigo FROM configuracao ');

          Cliente_Temp_Cod[qtd_cliente_novo] := cliente;
          Cliente_Cod[qtd_cliente_novo] := dao.Q1.fieldbyname('codigo')
            .AsString;

          cod_tablet := copy(pedidoLote[x], 3, 3);
          representante := BuscaRep;
          Razao_Social := copy(pedidoLote[x], 13, 60);
          Fantasia := copy(pedidoLote[x], 73, 60);
          CNPJ := copy(pedidoLote[x], 133, 18);
          IE := copy(pedidoLote[x], 151, 20);
          CPF := copy(pedidoLote[x], 171, 14);
          ENDERECO := copy(pedidoLote[x], 185, 50);
          NUMERO := copy(pedidoLote[x], 235, 6);
          COMPLEMENTO := copy(pedidoLote[x], 241, 20);
          PONTO_REF := copy(pedidoLote[x], 261, 30);
          BAIRRO := copy(pedidoLote[x], 291, 30);
          CEP := copy(pedidoLote[x], 321, 9);
        end
        else
        begin
          Cliente_Temp_Cod[qtd_cliente_novo] := cliente;
          Cliente_Cod[qtd_cliente_novo] := cliente_cnpj_cpf;
        end;
      end;

      if copy(pedidoLote[x], 1, 2) = '66' then
      begin
        if cliente_cnpj_cpf = '0' then
        begin

          CIDADE := copy(pedidoLote[x], 12, 30);
          UF := copy(pedidoLote[x], 42, 2);

          dao.Geral2
            ('SELECT a.COD_CIDADE FROM CIDADES a WHERE a.NOM_CIDADE LIKE ''' +
            trim(CIDADE) + '%'' AND a.UF = ''' + UF + '''');

          if not dao.Q2.IsEmpty then
            COD_CIDADE := dao.Q2.fieldbyname('COD_CIDADE').AsString
          else
            COD_CIDADE := '0';

          TELEFONE := copy(pedidoLote[x], 44, 2) + copy(pedidoLote[x], 46, 9);
          FAX := copy(pedidoLote[x], 44, 2) + copy(pedidoLote[x], 55, 9);
          CONTATO := copy(pedidoLote[x], 64, 30);
          CELULAR := copy(pedidoLote[x], 94, 9);

          F_PGTO := trim(copy(pedidoLote[x], 103, 6));
          if F_PGTO = '' then
            F_PGTO := 'null';

          PRAZO_PGTO := trim(copy(pedidoLote[x], 110, 6));
          if PRAZO_PGTO = '' then
            PRAZO_PGTO := 'null';

          EMAIL := copy(pedidoLote[x], 116, 50);
        end;
      end;

      if cliente_cnpj_cpf = '0' then
      begin

        if copy(pedidoLote[x], 1, 2) = '67' then
        begin

          OBS := copy(pedidoLote[x], 12, 150);
          novo_cliente_completo := true;
        end;

        if novo_cliente_completo then
        begin
          qtd_cliente_novo := qtd_cliente_novo + 1;

          if not(dao.cn.InTransaction) then
            dao.cn.StartTransaction;
          sql_insert :=
            'INSERT INTO CLIENTE (COD_CLIENTE, DTA_CAD, PRI_COMPRA, NOM_CLIENTE, NOM_FANTASIA, ENDERECO, COMPLEMENTO, PROXIMO, BAIRRO, CEP, COD_CIDADE, TIP_PESSOA, TELEFONE, EMAIL, CNPJ, IE, CONTATO, '
            + 'CPF, OBSERVACOES, FAX, ID_REPRESENTANTE, ID_FOP, PRAZO_MAXIMO, CLIENTE_BLOQUEADO, NR_ENDERECO, NFE_EMAIL, PRE_CADASTRO)'
            + ' VALUES ( ' + Cliente_Cod[qtd_cliente_novo - 1] + ', ' + data_cad
            + ', ' + data_cad + ', ' + quotedstr(Razao_Social) + ',' +
            quotedstr(Fantasia) + ',' + quotedstr(ENDERECO) + ',' +
            quotedstr(COMPLEMENTO) + ',' + quotedstr(PONTO_REF) + ',' +
            quotedstr(BAIRRO) + ',' + quotedstr(CEP) + ',' +
            quotedstr(COD_CIDADE) + ',' + quotedstr(tipo_pessoa) + ',' +
            quotedstr(TELEFONE) + ',' + quotedstr(EMAIL) + ',' + quotedstr(CNPJ)
            + ',' + quotedstr(IE) + ',' + quotedstr(CONTATO) + ',' +
            quotedstr(CPF) + ',' + quotedstr(OBS) + ',' + quotedstr(FAX) + ',' +
            representante + ',' + F_PGTO + ',' + PRAZO_PGTO + ',''N'', ' +
            quotedstr(NUMERO) + ',''S'',''S'')';

          dao.Execsql(sql_insert);

          dao.grava_log(sql_insert, '20');

          dao.cn.commit;

          novo_cliente_completo := false;
        end;
      end;
    end;

  end;

  procedure CadastrarPedidoCab;
  var
    y: Integer;
  begin
    if (copy(pedidoLote[x], 1, 2) = '70') or (copy(pedidoLote[x], 1, 2) = '71')
    then
    begin
      if not(dao.cn.InTransaction) then
        dao.cn.StartTransaction;

      if copy(pedidoLote[x], 1, 2) = '70' then
      begin
        cont_ped := cont_ped + 1;

        nr_pedido_palm := copy(pedidoLote[x], 6, 7);
        cliente := copy(pedidoLote[x], 34, 6);
        cod_tablet := copy(pedidoLote[x], 3, 3);
        representante := BuscaRep;
        nr_pedido_palm := copy(pedidoLote[x], 6, 7);
        str_total_liquido := copy(pedidoLote[x], 56, 10);
        total_liquido := strtofloat(stringreplace(trim(str_total_liquido), '.',
          ',', [rfReplaceAll]));
        data := quotedstr(FMFUN.InverteData(copy(pedidoLote[x], 14, 10)));
        data_str := copy(pedidoLote[x], 14, 10);
        hora := quotedstr(copy(pedidoLote[x], 29, 5));
        forma_pgto := copy(pedidoLote[x], 40, 3);
        PRAZO_PGTO := copy(pedidoLote[x], 43, 3);
        str_total_bruto := copy(pedidoLote[x], 46, 10);
        total_bruto := strtofloat(stringreplace(trim(str_total_bruto), '.', ',',
          [rfReplaceAll]));
        orcamento := copy(pedidoLote[x], 268, 1);

        total_item := strtoint(trim(copy(pedidoLote[x], 76, 3)));

        observacao := quotedstr(copy(pedidoLote[x], 104, 150));

        pedidos_check.add('F');

        pedido_nr := nr_pedido_palm;

        fm_splash.ggProgress.Progress := 0;
        fm_splash.ggProgress.MaxValue := total_item;
        fm_splash.lbStatus.Caption := 'Importando Pedido (' + pedido_nr +
          ') de ' + inttostr(cont_ped) + ' até ' + inttostr(total_ped);

        fm_splash.Refresh;

        if tot_clientes_novos > 0 then
        begin
          for y := 0 to tot_clientes_novos - 1 do
          begin
            if trim(cliente) = trim(Cliente_Temp_Cod[y]) then
              cliente := Cliente_Cod[y];
          end;
        end;

        total_itens := 0;

        if ChecarPedidoPalm(representante, data, hora, nr_pedido_palm) then
        begin
          lista_pedido_palm := lista_pedido_palm + nr_pedido_palm + ';';
          dao.Geral3('SELECT nextval(''Gen_venda1'') as numdoc FROM configuracao ');
          numdoc := dao.Q3.fieldbyname('numdoc').AsString;

          sql_insert_palm :=
            'INSERT INTO PEDIDO_PALM1 (COD_REPRESENTANTE, NR_PEDIDO_PALM, DTADOC, HORA, COD_CLIENTE, COD_FOP, COD_PRAZO_PGTO, TOT_BRUTO, TOT_LIQUIDO, OBSERVACOES_PEDIDO, PALM_NR_CONEXAO) '
            + ' VALUES (' + representante + ',' + nr_pedido_palm + ',' + data +
            ',' + hora + ',' + cliente + ',' + forma_pgto + ',' + PRAZO_PGTO +
            ',' + str_total_bruto + ',' + str_total_liquido + ',' + observacao +
            ',' + nr_conexao + ')';

          dao.Execsql(sql_insert_palm);
          dao.grava_log(sql_insert_palm, '20');
          processo := FMFUN.GerarProcessoPedido;

          sql_insert :=
            'INSERT INTO VENDAS1 (CONSIGNACAO, NUMDOC, COD_REPRESENTANTE, NR_PEDIDO_PALM, DTADOC, HORA, COD_CLIENTE, '
            + '                     FATURADO, COD_FOP, COD_PRAZO_PGTO, TOT_BRUTO, TOT_LIQUIDO, '
            + '                     OBSERVACOES_PEDIDO, PALM_NR_CONEXAO, COD_EMPRESA, EMAIL_PEDIDO, PROCESSO_ID) '
            + ' VALUES (0, ' + numdoc + ', ' + representante + ',' + nr_pedido_palm
            + ',' + data + ',' + hora + ',' + cliente + ', 0,' + forma_pgto +
            ',' + PRAZO_PGTO + ',' + str_total_bruto + ',' + str_total_liquido +
            ',' + observacao + ',' + nr_conexao + ',1, 1, ' + processo + ')';

          dao.Execsql(sql_insert);
          dao.grava_log(sql_insert, '20');

        end;

        Duplicado := false;
      end
      else
        Duplicado := true;

      if copy(pedidoLote[x], 1, 2) = '71' then
      begin
        observacao := quotedstr(trim(copy(pedidoLote[x], 13, 240)));
        sql_insert_palm := 'UPDATE PEDIDO_PALM1 SET OBSERVACOES_PEDIDO = ' +
          observacao + ' WHERE NR_PEDIDO_PALM = ' + nr_pedido_palm;
        dao.Execsql(sql_insert_palm);
        dao.grava_log(sql_insert_palm, '20');

        sql_insert := 'UPDATE VENDAS1 SET OBSERVACOES_PEDIDO = ' + observacao +
          ' WHERE NUMDOC = ' + numdoc;
        dao.Execsql(sql_insert);

      end;

      dao.cn.commit;

      dao.Geral4
        ('SELECT CID.UF FROM CIDADES CID INNER JOIN CLIENTE C ON (C.COD_CIDADE = CID.COD_CIDADE AND C.COD_CLIENTE = '
        + cliente + ')');
      UF_Cliente := dao.q4.fieldbyname('UF').AsString;
    end;
  end;

  procedure CadastrarPedidoItem;
  begin
    if copy(pedidoLote[x], 1, 2) = '72' then
    begin
      cod_produto := inttostr(strtoint(trim(copy(pedidoLote[x], 16, 10))));
      if formatsettings.DecimalSeparator = '.' then
        SUB_TOTAL := strtofloat(stringreplace(trim(copy(pedidoLote[x], 42, 10)),
          ',', '.', [rfReplaceAll]))
      else
        SUB_TOTAL := strtofloat(stringreplace(trim(copy(pedidoLote[x], 42, 10)),
          '.', ',', [rfReplaceAll]));

      total_itens := total_itens + SUB_TOTAL;

      if (floattostr(total_liquido) = floattostr(total_itens)) then
        pedidos_check[cont_ped - 1] := 'V';


      // total_item

      num_item := strtoint(trim(copy(pedidoLote[x], 13, 3)));

      fm_splash.lbStatus.Caption := 'Importando Pedido (' + pedido_nr + ') de '
        + inttostr(cont_ped) + ' até ' + inttostr(total_ped);

      fm_splash.ggProgress.Progress := num_item;
      fm_splash.Refresh;

      if ChecarPedidoItem(numdoc, cod_produto) then
      begin
        sql_geral := ' ' +
          ' SELECT                                                ' +
          '   P.NOM_PRODUTO,                                       ' +
          '   CASE WHEN P.PROMOCAO = ''S'' THEN P.PRECO_PROMOCAO ELSE P.PRECO_VENDA END PRECO_VENDA, '
          + '   P.UNIDADE,                                           ' +
          '   P.QTD_EMBALAGEM,                                     ' +
          '   P.GRADE,                                             ' +
          '   P.GRADE_COMISSAO,                                    ' +
          '   P.QTD_ESTOQUE,                                       ' +
          '   P.QTD_RESERVADO,                                     ' +
          '   P.CUSTO,                                             ' +
          '   P.CUSTO_TOTAL,                                       ' +
          '   P.LUCRO,                                             ' +
          '   coalesce(                   ' + '     (SELECT DISTINCT  ' +
          '        CASE WHEN P.PROMOCAO = ''S'' THEN  0 ELSE PR.DESCONTO_MAXIMO END '
          + '      FROM ' + '        PRODUTO_REPRESENTANTE PR ' +
          '      WHERE PR.COD_PRODUTO = P.COD_PRODUTO AND PR.ID_REPRESENTANTE = '
          + representante + '     ), ' + '   coalesce(                   ' +
          '     (SELECT DISTINCT               ' +
          '        CASE WHEN P.PROMOCAO = ''S'' THEN  0 ELSE PR.DESCONTO_MAXIMO END '
          + '      FROM ' + '        GRUPO_REPRESENTANTE PR ' +
          '      WHERE PR.COD_GRUPO = P.COD_GRUPO AND PR.ID_REPRESENTANTE = ' +
          representante +
          '     ), CASE WHEN P.PROMOCAO = ''S'' THEN  0 ELSE P.DESCONTO_MAXIMO END)) AS DESCONTO_MAXIMO, '
          + '   N.CODIGO AS NCM,                                     ' +
          '   COALESCE(N.MARGEM_VALOR_AGRE_DENTRO ,0) AS MARGEM_VALOR_AGRE_DENTRO, '
          + '   COALESCE(N.MARGEM_VALOR_AGRE_FORA ,0) AS MARGEM_VALOR_AGRE_FORA, '
          + '   N.IPI_ALIQUOTA,                                      ' +
          '   COALESCE(N.TRIB_ICMS, P.TRIB_ICMS) AS TRIB_ICMS,     ' +
          '   P.PROMOCAO,                                          ' +
          '   N.CESTA_BASICA                                       ' +
          ' FROM                                                   ' +
          '   PRODUTO P                                            ' +
          ' LEFT OUTER JOIN GRUPO G ON (G.COD_GRUPO = P.COD_GRUPO) ' +
          ' LEFT OUTER JOIN NCM N ON (N.CODIGO = G.NCM OR N.CODIGO = P.NCM) ' +
          ' WHERE P.COD_PRODUTO = ' + cod_produto;

        dao.Geral4(sql_geral);

        if dao.q4.fieldbyname('trib_icms').AsString = '0' then
        begin
          cst := '00';
          if UF_Cliente = 'SC' then
          begin
            ICMS_ITEM := 17;
            cod_fiscal_item := '5102';
          end
          else
          begin
            ICMS_ITEM := 12;
            cod_fiscal_item := '6102';
          end;
        end;

        if dao.q4.fieldbyname('trib_icms').AsString = '1' then
          cst := '10';
        if dao.q4.fieldbyname('trib_icms').AsString = '2' then
          cst := '20';
        if dao.q4.fieldbyname('trib_icms').AsString = '3' then
          cst := '30';
        if dao.q4.fieldbyname('trib_icms').AsString = '4' then
          cst := '40';
        if dao.q4.fieldbyname('trib_icms').AsString = '5' then
          cst := '41';
        if dao.q4.fieldbyname('trib_icms').AsString = '6' then
          cst := '50';
        if dao.q4.fieldbyname('trib_icms').AsString = '7' then
          cst := '51';
        if dao.q4.fieldbyname('trib_icms').AsString = '8' then
        begin
          cst := '60';
          if UF_Cliente = 'SC' then
          begin
            ICMS_ITEM := 17;
            cod_fiscal_item := '5405';
          end
          else
          begin
            ICMS_ITEM := 12;
            cod_fiscal_item := '6403';
          end;
        end;

        if dao.q4.fieldbyname('trib_icms').AsString = '9' then
          cst := '70';
        if dao.q4.fieldbyname('trib_icms').AsString = '10' then
          cst := '90';
        if dao.q4.fieldbyname('CESTA_BASICA').AsString = 'S' then
          cst := '90';

        if UF_Cliente = 'SC' then
          MVA := dao.q4.fieldbyname('MARGEM_VALOR_AGRE_DENTRO').AsFloat
        else
          MVA := dao.q4.fieldbyname('MARGEM_VALOR_AGRE_FORA').AsFloat;

        if dao.q4.fieldbyname('cesta_basica').AsString = 'S' then
          Aliquota_ICMS_Interno := 12
        else
          Aliquota_ICMS_Interno := 17;

        ipi_item := dao.q4.fieldbyname('IPI_ALIQUOTA').AsFloat;
        vlr_ipi_item := SUB_TOTAL * (dao.q4.fieldbyname('IPI_ALIQUOTA')
          .AsFloat / 100);

        if UF_Cliente = 'PR' then
        begin
          cst := '00';
          cod_fiscal_item := '6102';
          ICMS_ITEM := 12;
        end;

        CalculoIcmsItem;

        if formatsettings.DecimalSeparator = '.' then
          perc_comissao :=
            strtofloat(stringreplace(trim(copy(pedidoLote[x], 69, 7)), ',', '.',
            [rfReplaceAll]))
        else
          perc_comissao :=
            strtofloat(stringreplace(trim(copy(pedidoLote[x], 69, 7)), '.', ',',
            [rfReplaceAll]));
        vlr_comissao := SUB_TOTAL * (perc_comissao / 100);

        if formatsettings.DecimalSeparator = '.' then
          valor_desc :=
            (strtofloat(stringreplace(trim(copy(pedidoLote[x], 52, 10)), ',',
            '.', [rfReplaceAll])))
        else
          valor_desc :=
            (strtofloat(stringreplace(trim(copy(pedidoLote[x], 52, 10)), '.',
            ',', [rfReplaceAll])));

        if valor_desc <> 0 then
        begin
          if formatsettings.DecimalSeparator = '.' then
            perc_desc := valor_desc /
              (strtofloat(stringreplace(trim(copy(pedidoLote[x], 77, 9)), ',',
              '.', [rfReplaceAll])) *
              strtofloat(stringreplace(trim(copy(pedidoLote[x], 26, 6)), ',',
              '.', [rfReplaceAll]))) * (-100)
          else
            perc_desc := valor_desc /
              (strtofloat(stringreplace(trim(copy(pedidoLote[x], 77, 9)), '.',
              ',', [rfReplaceAll])) *
              strtofloat(stringreplace(trim(copy(pedidoLote[x], 26, 6)), '.',
              ',', [rfReplaceAll]))) * (-100);
        end
        else
          perc_desc := 0;

        volume := copy(pedidoLote[x], 87, 9);
        if trim(volume) = '0.000' then
          volume := '1';

        if trim(copy(pedidoLote[x], 96, 10)) = '' then
          custo := dao.q4.fieldbyname('CUSTO_TOTAL').AsCurrency
        else
        begin
          if formatsettings.DecimalSeparator = '.' then
            custo := strtofloat(stringreplace(trim(copy(pedidoLote[x], 96, 10)),
              ',', '.', [rfReplaceAll]))
          else
            custo := strtofloat(stringreplace(trim(copy(pedidoLote[x], 96, 10)),
              '.', ',', [rfReplaceAll]));
        end;

        if not(dao.cn.InTransaction) then
          dao.cn.StartTransaction;

        sql_insert_palm :=
          'INSERT INTO PEDIDO_PALM2 (NR_PEDIDO_PALM, COD_PRODUTO, QTD, PRECO, SUB_TOTAL, PRECO_BRUTO, VOLUME, PROMOCAO, PRECO_CUSTO) '
          + ' VALUES (' + nr_pedido_palm + ',' + copy(pedidoLote[x], 16, 10) +
          ',' + // COD_PRODUTO
          copy(pedidoLote[x], 26, 6) + ',' + // QTD
          copy(pedidoLote[x], 32, 10) + ',' + // PRECO
          copy(pedidoLote[x], 42, 10) + ',' + // SUB_TOTAL
          copy(pedidoLote[x], 77, 9) + ',' + // PRECO_BRUTO
          volume + ',' + // VOLUME
          quotedstr(dao.q4.fieldbyname('PROMOCAO').AsString) + ',' + // PROMOCAO
          stringreplace(formatfloat('0.00', custo), ',', '.', [rfReplaceAll]) +
        // PRECO_CUSTO
          ')';

        dao.Execsql(sql_insert_palm);
        dao.grava_log(sql_insert_palm, '20');

        sql_insert :=
          'INSERT INTO VENDAS2 (NUMDOC, COD_PRODUTO, QTD, PRECO, SUB_TOTAL, ' +
          ' NR_PEDIDO_PALM, PRECO_BRUTO, VOLUME, NCM, TRIB_ICMS, VLR_BC, VLR_ICMS_ITEM, VLR_BC_ST, '
          + ' VLR_AGR_ITEM, ICMS_ITEM, vlr_icms_st, ipi_item, vlr_ipi_item, PERC_COMISSAO, vlr_comissao, '
          + ' desconto, cod_fiscal_item, PROMOCAO, PRECO_CUSTO) ' + ' VALUES ('
          + numdoc + ',' + copy(pedidoLote[x], 16, 10) + ',' + // COD_PRODUTO
          copy(pedidoLote[x], 26, 6) + ',' + // QTD
          copy(pedidoLote[x], 32, 10) + ',' + // PRECO
          copy(pedidoLote[x], 42, 10) + ',' + // SUB_TOTAL
          nr_pedido_palm + ',' + // NR_PEDIDO_PALM
          copy(pedidoLote[x], 77, 9) + ',' + // PRECO_BRUTO
          volume + ',' + // VOLUME
          quotedstr(dao.q4.fieldbyname('ncm').AsString) + ',' + // NCM
          quotedstr(cst) + ',' + // CST
          stringreplace(formatfloat('0.00', VLR_BC), ',', '.', [rfReplaceAll]) +
          ',' + // VLR_BC
          stringreplace(formatfloat('0.00', VLR_ICMS_ITEM), ',', '.',
          [rfReplaceAll]) + ',' + // VLR_ICMS_ITEM
          stringreplace(formatfloat('0.00', VLR_BC_ST), ',', '.', [rfReplaceAll]
          ) + ',' + // VLR_BC_ST
          stringreplace(formatfloat('0.00', VLR_AGR_ITEM), ',', '.',
          [rfReplaceAll]) + ',' + // VLR_AGR_ITEM
          stringreplace(formatfloat('0.00', ICMS_ITEM), ',', '.', [rfReplaceAll]
          ) + ',' + // ICMS_ITEM
          stringreplace(formatfloat('0.00', vlr_icms_st), ',', '.',
          [rfReplaceAll]) + ',' + // VLR_ICMS_ST
          stringreplace(formatfloat('0.00', ipi_item), ',', '.', [rfReplaceAll])
          + ',' + // IPI_ITEM
          stringreplace(formatfloat('0.00', vlr_ipi_item), ',', '.',
          [rfReplaceAll]) + ',' + // VLR_IPI_ITEM
          stringreplace(formatfloat('0.00', perc_comissao), ',', '.',
          [rfReplaceAll]) + ',' + // PERC_COMISSAO
          stringreplace(formatfloat('0.00', vlr_comissao), ',', '.',
          [rfReplaceAll]) + ',' + // VLR_COMISSAO
          stringreplace(formatfloat('0.00', perc_desc), ',', '.', [rfReplaceAll]
          ) + ',' + // PREC_DESC
          quotedstr(cod_fiscal_item) + ',' + // COD_FISCAL_ITEM
          quotedstr(dao.q4.fieldbyname('PROMOCAO').AsString) + ',' + // PROMOCAO
          stringreplace(formatfloat('0.00', custo), ',', '.', [rfReplaceAll]) +
        // PRECO_CUSTO
          ')';

        dao.Execsql(sql_insert);
        dao.grava_log(sql_insert, '20');

        qtd := strtofloat(copy(pedidoLote[x], 26, 6));
        dao.cn.commit;

        if numdoc <> '' then
        begin
          FMFUN.AtualizaPeso(numdoc);
          FMFUN.AtualizaDadosComissao(numdoc);
        end;
      end;
    end;

  end;

begin
  erroLote := false;
  pedidoLote := TStringList.Create;
  pedidoLote.LoadFromFile(arquivo);
  tot_linhas := pedidoLote.Count;
  total_ped := 0;
  cont_ped := 0;
  pedidos_check := TStringList.Create;

  ContarPedidos;

  ContarClientesNovos;

  for x := 0 to tot_linhas - 1 do
  begin

    CadastrarLote;

    CadastrarClientesNovos;

    CadastrarPedidoCab;

    CadastrarPedidoItem;

  end;

  for x := 0 to pedidos_check.Count - 1 do
  begin
    if pedidos_check[x] = 'F' then
    begin
      // showmessage(pedidos_check[x]);
      Result := false;
      // LimparRegistros(nr_conexao);
      exit;
    end;
  end;

  pedidos_check.Free;
  Result := true;
end;

function TPedidos.BuscarClientePorCPFCNPJ(cpfcnpj: string): string;
begin
  dao.Geral1
    ('select c.cod_cliente from cliente c where  c.CLIENTE_BLOQUEADO <> ''S'' and '
    + ' (c.CNPJ = ''' + cpfcnpj + '''   or  c.cpf  = ''' + cpfcnpj + ''') limit 1 ');
  if dao.Q1.RecordCount = 0 then
    Result := '0'
  else
    Result := dao.Q1.fieldbyname('cod_cliente').AsString;

end;

end.
