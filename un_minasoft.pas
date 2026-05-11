unit un_minasoft;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ExtCtrls, sPanel, acDBGrid,
  RxMemDS, StdCtrls, DBCtrls, Buttons, sBitBtn, sTooledit, Mask, sMaskEdit,
  sCustomComboEdit, sCurrEdit, sCurrencyEdit, sLabel, sGroupBox, sEdit,
  sCheckBox, sSpeedButton, Math, frxClass, FMTBcd, SqlExpr;

type
  Tfm_minasoft_pedidos = class(TForm)
    dsPedidos: TDataSource;
    dsMinaItem: TDataSource;
    dgPedidos: Tdbgrid;
    Panel6: TsPanel;
    DBGrid1: Tdbgrid;
    Panel5: TsPanel;
    mmMinaPedidos: TRxMemoryData;
    mmMinaPedidoscheck: TBooleanField;
    mmMinaPedidosCLIENTE: TIntegerField;
    mmMinaPedidosCLIENTE_NOME: TStringField;
    mmMinaPedidosDOCUMENTO: TIntegerField;
    mmMinaPedidosVENDEDOR: TIntegerField;
    mmMinaPedidosVENDEDOR_NOME: TStringField;
    mmMinaPedidosEMISSAO: TDateField;
    mmMinaPedidosCONDICAO: TIntegerField;
    mmMinaPedidosFORMA_PGTO: TStringField;
    mmMinaPedidosVALOR: TCurrencyField;
    mmMinaPedidosSITUACAO: TIntegerField;
    mmMinaPedidosOBS: TStringField;
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
    procedure qrMinaPedBeforeOpen(DataSet: TDataSet);
    procedure qrMinaItemBeforeOpen(DataSet: TDataSet);
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
  fm_minasoft_pedidos: Tfm_minasoft_pedidos;
  totalselecionados: integer;
  pedidos: string;

implementation

uses Un_dao, UnFun, Un_dm;

{$R *.dfm}

procedure Tfm_minasoft_pedidos.CarregaDadosItem(pedido: integer);
begin
  if pedido = 0 then
    exit;
  qrMinaItem.Close;
  qrMinaItem.ParamByName('pedido').AsInteger := pedido;
  qrMinaItem.Open;
end;

procedure Tfm_minasoft_pedidos.dgPedidosCellClick(Column: TColumn);
begin
  CarregaDadosItem(mmMinaPedidosDOCUMENTO.AsInteger);
end;

procedure Tfm_minasoft_pedidos.CarregaDados;
var
  sql: string;
begin
  sql := 'select ' +
    '  p.cliente, ' +
    '  c.nome as cliente_nome, ' +
    '  p.documento, ' +
    '  p.vendedor, ' +
    '  v.nome as vendedor_nome, ' +
    '  p.emissao, ' +
    '  p.condicao, ' +
    '  f.descricao as forma_pgto, ' +
    '  p.valor, ' +
    '  p.parcelas, ' +
    '  p.situacao, ' +
    '  p.obs ' +
    'from ' +
    '  ccr p ' +
    'inner join pdv d on d.pedido = p.documento ' +
    'inner join vendedor v on v.codigo = p.vendedor ' +
    'inner join cliente c on c.codigo = p.cliente ' +
    'inner join cpagamen f on f.codigo = p.condicao  ' +
    'where d.finalizou = true';

  if trim(edPedidoIni.Text) <> '0' then
    sql := sql + ' AND p.documento >= ' + edPedidoIni.Text;

  if trim(edPedidoFim.Text) <> '0' then
    sql := sql + ' AND p.documento <= ' + edPedidoFim.Text;

  if trim(edSaidaDe.Text) <> '/  /' then
    sql := sql + ' AND P.EMISSAO >= ' +
      QuotedStr(formatdatetime('dd/mm/yyyy', edSaidaDe.Date));

  if trim(edSaidaAte.Text) <> '/  /' then
    sql := sql + ' AND P.EMISSAO <= ' +
      QuotedStr(formatdatetime('dd/mm/yyyy', edSaidaAte.Date));

  if TRIM(edCliente.Text) <> '' then
    sql := sql + ' AND C.NOME LIKE ''' + trim(edcliente.Text) + '%''';

  sql := sql + ' order by documento desc ';

  qrMinaItem.close;
  qrMinaPed.close;
  qrMinaPed.SQL.Clear;
  qrMinaPed.SQL.Text := sql;
  qrMinaPed.open;
  mmMinaPedidos.Close;
  mmMinaPedidos.EmptyTable;
  mmMinaPedidos.Open;
  qrMinaPed.First;

  while not qrMinaPed.eof do
  begin
    mmMinaPedidos.Append;
    mmMinaPedidosCLIENTE.AsString := qrMinaPedcliente.AsString;
    mmMinaPedidosCLIENTE_NOME.AsString := qrMinaPedcliente_nome.AsString;
    mmMinaPedidosDOCUMENTO.AsInteger := qrMinaPeddocumento.AsInteger;
    mmMinaPedidosVENDEDOR.AsInteger := qrMinaPedvendedor.AsInteger;
    mmMinaPedidosVENDEDOR_NOME.AsString := qrMinaPedvendedor_nome.AsString;
    mmMinaPedidosEMISSAO.AsDateTime := qrMinaPedemissao.AsDateTime;
    mmMinaPedidosCONDICAO.AsInteger := qrMinaPedcondicao.AsInteger;
    mmMinaPedidosFORMA_PGTO.AsString := qrMinaPedforma_pgto.AsString;
    mmMinaPedidosVALOR.Value := qrMinaPedvalor.Value;
    mmMinaPedidosSITUACAO.Value := qrMinaPedsituacao.Value;
    mmMinaPedidosOBS.Value := qrMinaPedobs.Value;
    mmMinaPedidos.Post;
    qrMinaPed.next;
  end;
  mmMinaPedidos.First;
  if qrMinaPed.RecordCount = 0 then
    qrMinaItem.Close
  else
    CarregaDadosItem(mmMinaPedidosDOCUMENTO.AsInteger);
end;

procedure Tfm_minasoft_pedidos.dgPedidosEnter(Sender: TObject);
begin
  CarregaDadosItem(mmMinaPedidosDOCUMENTO.AsInteger);
end;

procedure Tfm_minasoft_pedidos.dgPedidosKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  CarregaDadosItem(mmMinaPedidosDOCUMENTO.AsInteger);
end;

procedure Tfm_minasoft_pedidos.dgPedidosDrawColumnCell(Sender: TObject;
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

procedure Tfm_minasoft_pedidos.dgPedidosDblClick(Sender: TObject);
begin
  mmMinaPedidos.Edit;
  if mmMinaPedidoscheck.Value = true then
  begin
    mmMinaPedidoscheck.Value := false;
    // totalselecionados := totalselecionados - 1;
  end
  else
  begin
    mmMinaPedidoscheck.Value := true;
    // totalselecionados := totalselecionados + 1;
  end;
  mmMinaPedidos.Post;
end;

procedure Tfm_minasoft_pedidos.BtConsultaClick(Sender: TObject);
begin
  CarregaDados;
end;

procedure Tfm_minasoft_pedidos.CheckTodosClick(Sender: TObject);
begin
  totalselecionados := 0;
  mmMinaPedidos.First;
  while not mmMinaPedidos.Eof do
  begin
    mmMinaPedidos.Edit;
    mmMinaPedidosCheck.Value := CheckTodos.Checked;
    if CheckTodos.Checked then
      totalselecionados := totalselecionados + 1
    else
      totalselecionados := 0;
    mmMinaPedidos.Post;
    mmMinaPedidos.Next;
  end;
  mmMinaPedidos.First;

  {  if totalselecionados = 0 then
      BtConferir.enabled := false
    else
      BtConferir.enabled := true;}
end;

procedure Tfm_minasoft_pedidos.relatorio_pedidos_geral;
var
  cmd, path: string;
  oExportfilter: TfrxCustomExportFilter;
begin
  path := extractFilePath(application.ExeName);
  cmd := 'SELECT a.NR_CONEXAO, a.COD_REPRESENTANTE, a.DATA_CONEXAO, a.HORA_CONEXAO, coalesce(a.QTDE_PEDIDOS, 0) as QTDE_PEDIDOS, coalesce(a.QTDE_VISITAS_NEGATIVAS, 0) as QTDE_VISITAS_NEGATIVAS, a.CHECADO, '
    +
    ' a.USUARIO_CHECOU||''-''||u.NOME as USUARIO_CHECOU, A.DATA_HORA_CHECADO, ' +
    ' v1.NUMDOC, v1.numdoc_destino, v1.DTADOC, c.COD_CLIENTE||''-''||c.NOM_CLIENTE as cliente, C.TELEFONE, c.ENDERECO, c.NR_ENDERECO, c.CEP, cid.NOM_CIDADE||''-''||cid.UF as cidade, C.CNPJ, C.IE, C.RG,C.CPF, C.EMAIL, COALESCE(v1.TOT_BRUTO, 0) AS TOT_BRUTO, ' +
    ' COALESCE(v1.TOT_LIQUIDO, 0) AS TOT_LIQUIDO, v1.OBSERVACOES_PEDIDO, ' +
    ' v1.COD_FOP||''-''||f.NOM_FOP as fop, v1.COD_REPRESENTANTE||''-''||r.NOM_REPRESENTANTE as representante, p.PRAZO, v1.NR_PEDIDO_PALM, v1.PALM_NR_CONEXAO, v1.OBSERVACOES_PEDIDO, ' +
    ' v2.ID, v2.NUMDOC, v2.COD_PRODUTO||''-''||pr.NOM_PRODUTO as produto, pr.unidade, COALESCE(v2.QTD, 0) AS QTD, COALESCE(v2.PRECO, 0) AS PRECO, COALESCE(v2.SUB_TOTAL, 0) AS SUB_TOTAL, v2.NR_PEDIDO_PALM, COALESCE(v2.PRECO_BRUTO, 0) AS PRECO_BRUTO, ' +
    ' (((COALESCE(v2.PRECO_BRUTO,0) - COALESCE(v2.PRECO,0))/COALESCE(v2.PRECO_BRUTO,1)) * 100) AS PERC_DESC, COALESCE(v2.VOLUME,0) AS VOLUME, ' +
    '  v2.VLR_ICMS_ST, '+
    '  V2.NCM, '+
    ' (coalesce(v2.VLR_ICMS_ST,0)/COALESCE(v2.SUB_TOTAL, 0))*100 as perc_st '+    
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

procedure Tfm_minasoft_pedidos.btImportarClick(Sender: TObject);
begin
  pedidos := '';
  mmMinaPedidos.First;
  while not mmMinaPedidos.eof do
  begin
    if mmMinaPedidoscheck.Value = true then
      ImportarPedido;
    mmMinaPedidos.Next;
  end;

  pedidos := copy(pedidos, 1, length(pedidos) - 1);
  if pedidos <> '' then
    relatorio_pedidos_geral;
  BtConsultaClick(SELF);
  mmMinaPedidos.First;
end;

procedure Tfm_minasoft_pedidos.ImportarPedido;
var
  numdoc, sql_insert, data, total_liquido, fop, prazo, preco_item, preco_bruto,
    custo, qtd_item, cst, cod_fiscal_item, UF_Cliente: string;

  MVA, total_item, VLR_BC, vlr_icms_item, icms_item, vlr_bc_st, vlr_icms_st,
    vlr_agr_item,
    Aliquota_ICMS_Interno: real;
  cliente_isento_icms: boolean;

  function ChecarPedidoItem(pedido, produto: string): boolean;
  begin
    dao.Geral5('SELECT id FROM VENDAS2 WHERE numdoc = ' + pedido +
      ' and cod_produto = ' + produto);
    Result := dao.q5.IsEmpty;
  end;

  function ChecarPedido(pedido_mina, data_emissao: string): boolean;
  begin
    dao.Geral1('SELECT numdoc fROM VENDAS1 WHERE OBSERVACOES_PEDIDO like ''%' +
      pedido_mina + '%'' AND DTADOC = ' + data_emissao);
    Result := dao.q1.IsEmpty;
    numdoc := dao.q1.fieldbyname('numdoc').asstring;
  end;

  procedure CalculoIcmsItem;
  begin
    VLR_BC := total_item;

    vlr_icms_item := vlr_bc * (icms_item / 100);
    if (cst = '60') or (cst = '90') then
    begin
      //Buscar a Base de Cáculo ST
      vlr_bc_st := RoundTo((VLR_BC * (1 + (MVA / 100))), -2);
      vlr_icms_st := RoundTo(((vlr_bc_st * (Aliquota_ICMS_Interno / 100)) -
        vlr_icms_item), -2);
      vlr_bc := 0;
      vlr_icms_item := 0;
      vlr_agr_item := MVA;
      icms_item := 0;
    end
    else
    begin
      vlr_bc_st := 0;
      vlr_icms_st := 0;
      vlr_agr_item := 0;
    end;

    if cliente_isento_icms then
    begin
      vlr_bc_st := 0;
      vlr_icms_st := 0;
      vlr_bc := 0;
      vlr_icms_item := 0;
      icms_item := 0;
    end;
  end;
begin
  data := quotedstr(formatdatetime('yyyy/mm/dd',
    mmMinaPedidosEMISSAO.AsDateTime));
  total_liquido := quotedstr(stringreplace(mmMinaPedidosVALOR.AsString, ',',
    '.',
    [rfReplaceAll]));

  if mmMinaPedidosCONDICAO.AsString = '1' then
  begin
    fop := '1';
    prazo := '7';
  end
  else
  begin
    fop := '3';
    prazo := '28';
  end;

  if ChecarPedido(mmMinaPedidosDOCUMENTO.AsString,  data) then
  begin

    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;

    dao.Geral3('SELECT nextval(''Gen_venda1'') as numdoc FROM configuracao ');
    numdoc := dao.Q3.fieldbyname('numdoc').AsString;

    sql_insert := 'INSERT INTO VENDAS1 (COD_EMPRESA, NUMDOC, COD_REPRESENTANTE, DTADOC, COD_CLIENTE, '
      +
      '                     FATURADO, COD_FOP, COD_PRAZO_PGTO, TOT_LIQUIDO, ' +
      '                     OBSERVACOES_PEDIDO) ' +
      ' VALUES (0, ' + numdoc + ', ' + mmMinaPedidosVENDEDOR.AsString + ','
      + data + ','
      + mmMinaPedidosCLIENTE.AsString + ', 0,'
      + fop + ','
      + prazo + ','
      + total_liquido + ','
      + QuotedStr('Pedido importado do Minasoft nº ' +
      mmMinaPedidosDOCUMENTO.AsString) + ')';
    dao.Execsql(sql_insert);
  end;

  CarregaDadosItem(mmMinaPedidosDOCUMENTO.AsInteger);

  while not qrMinaItem.Eof do
  begin
    if ChecarPedidoItem(numdoc, qrMinaItemREDUZIDO.AsString) then
    begin
    dao.Geral4('SELECT N.CODIGO AS NCM, N.CESTA_BASICA, COALESCE(N.TRIB_ICMS, P.TRIB_ICMS) AS TRIB_ICMS, P.CUSTO_TOTAL, P.PRECO_VENDA, ' +
      ' COALESCE(N.MARGEM_VALOR_AGRE_DENTRO ,0) AS MARGEM_VALOR_AGRE_DENTRO, COALESCE(N.MARGEM_VALOR_AGRE_FORA ,0) AS MARGEM_VALOR_AGRE_FORA ' +
      ' FROM PRODUTO P ' +
      ' LEFT OUTER JOIN GRUPO G ON (G.COD_GRUPO = P.COD_GRUPO) ' +
      ' LEFT OUTER JOIN NCM N ON (N.CODIGO = G.NCM OR N.CODIGO = P.NCM) ' +
      ' WHERE COD_PRODUTO = ' + qrMinaItemREDUZIDO.AsString);


      if dao.Q4.fieldbyname('trib_icms').AsString = '0' then
      begin
        cst := '00';
        if UF_Cliente = 'SC' then
        begin
          icms_item := 17;
          cod_fiscal_item := '5102';
        end
        else
        begin
          icms_item := 12;
          cod_fiscal_item := '6102';
        end;
      end;

      if dao.Q4.fieldbyname('trib_icms').AsString = '1' then
        cst := '10';
      if dao.Q4.fieldbyname('trib_icms').AsString = '2' then
        cst := '20';
      if dao.Q4.fieldbyname('trib_icms').AsString = '3' then
        cst := '30';
      if dao.Q4.fieldbyname('trib_icms').AsString = '4' then
        cst := '40';
      if dao.Q4.fieldbyname('trib_icms').AsString = '5' then
        cst := '41';
      if dao.Q4.fieldbyname('trib_icms').AsString = '6' then
        cst := '50';
      if dao.Q4.fieldbyname('trib_icms').AsString = '7' then
        cst := '51';
      if dao.Q4.fieldbyname('trib_icms').AsString = '8' then
      begin
        cst := '60';
        if UF_Cliente = 'SC' then
        begin
          icms_item := 17;
          cod_fiscal_item := '5405';
        end
        else
        begin
          icms_item := 12;
          cod_fiscal_item := '6403';
        end;
      end;

      if dao.Q4.fieldbyname('trib_icms').AsString = '9' then
        cst := '70';
      if dao.Q4.fieldbyname('trib_icms').AsString = '10' then
        cst := '90';
      if dao.Q4.fieldbyname('CESTA_BASICA').AsString = 'S' then
        cst := '90';

      if UF_Cliente = 'SC' then
        MVA :=
          dao.Q4.fieldbyname('MARGEM_VALOR_AGRE_DENTRO').AsFloat
      else
        MVA :=
          dao.Q4.fieldbyname('MARGEM_VALOR_AGRE_FORA').AsFloat;

      if dao.Q4.fieldbyname('cesta_basica').AsString = 'S' then
        Aliquota_ICMS_Interno := 12
      else
        Aliquota_ICMS_Interno := 17;

      if UF_Cliente = 'PR' then
      begin
        cst := '00';
        cod_fiscal_item := '6102';
        icms_item := 12;
      end;

      custo := stringreplace(dao.Q4.fieldbyname('custo_total').AsString, ',',
        '.', [rfReplaceAll]);
      preco_bruto := stringreplace(dao.Q4.fieldbyname('preco_venda').AsString,
        ',', '.', [rfReplaceAll]);
      preco_item := stringreplace(qrMinaItemPRECO.AsString, ',', '.',
        [rfReplaceAll]);
      total_item := qrMinaItemTOTAL.AsCurrency;
      qtd_item := stringreplace(qrMinaItemQUANTIDADE.AsString, ',', '.',
        [rfReplaceAll]);

      CalculoIcmsItem;

      sql_insert := 'INSERT INTO VENDAS2 (NUMDOC, COD_PRODUTO, QTD, PRECO, SUB_TOTAL, '
        +
        ' PRECO_BRUTO, VOLUME, NCM, TRIB_ICMS, VLR_BC, VLR_ICMS_ITEM, VLR_BC_ST, ' +
        ' VLR_AGR_ITEM, ICMS_ITEM, vlr_icms_st, ' +
        ' cod_fiscal_item, PRECO_CUSTO) ' +
        ' VALUES (' + numdoc + ',' +
        qrMinaItemREDUZIDO.AsString + ',' + //COD_PRODUTO
      qtd_item + ',' + //QTD
      preco_item + ',' + //PRECO
      stringreplace(floattostr(total_item), ',', '.', [rfReplaceAll]) + ',' +
        preco_bruto + ',' + //PRECO_BRUTO
      '0,' + //VOLUME
      quotedstr(dao.Q4.fieldbyname('ncm').AsString) + ',' + //NCM
      quotedstr(cst) + ',' + //CST
      stringreplace(formatfloat('0.00', VLR_BC), ',', '.', [rfReplaceAll]) + ','
        + //VLR_BC
      stringreplace(formatfloat('0.00', VLR_ICMS_ITEM), ',', '.', [rfReplaceAll])
        + ',' + //VLR_ICMS_ITEM
      stringreplace(formatfloat('0.00', VLR_BC_ST), ',', '.', [rfReplaceAll]) +
        ',' + //VLR_BC_ST
      stringreplace(formatfloat('0.00', VLR_AGR_ITEM), ',', '.', [rfReplaceAll])
        + ',' + //VLR_AGR_ITEM
      stringreplace(formatfloat('0.00', ICMS_ITEM), ',', '.', [rfReplaceAll]) +
        ',' + //ICMS_ITEM
      stringreplace(formatfloat('0.00', vlr_icms_st), ',', '.', [rfReplaceAll])
        +
        ',' + //VLR_ICMS_ST

      quotedstr(cod_fiscal_item) + ',' + //COD_FISCAL_ITEM
      custo + //PRECO_CUSTO
      ')';

      dao.Execsql(sql_insert);
    end;
    qrMinaItem.Next;
  end;
  dao.cn.commit;
  qrMinaItem.first;

  updatePedido.SQL.Text :=
    'UPDATE CCR SET OBS = ''PEDIDO EXPORTADO PARA O ORBI No.: ' + NUMDOC +
    '.'' WHERE DOCUMENTO = ' + mmMinaPedidosDOCUMENTO.AsString;
  updatePedido.ExecSQL;

  updatePedido.SQL.Text := 'DELETE FROM CCR WHERE DOCUMENTO = ' +
    mmMinaPedidosDOCUMENTO.AsString;
  updatePedido.ExecSQL;

  updatePedido.SQL.Text := 'DELETE FROM PDV WHERE PEDIDO = ' +
    mmMinaPedidosDOCUMENTO.AsString;
  updatePedido.ExecSQL;
  //PDV E CCR => EXCLUIR CMP E PCR NAO EXCLUIR...

  pedidos := pedidos + numdoc + ',';
end;

procedure Tfm_minasoft_pedidos.fR_RELATORIOGetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'empresa' then
    value := nom_empresa;
end;

procedure Tfm_minasoft_pedidos.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure Tfm_minasoft_pedidos.qrMinaPedBeforeOpen(DataSet: TDataSet);
begin
  qrMinaPed.DatabaseName := dao.minaPath;
end;

procedure Tfm_minasoft_pedidos.qrMinaItemBeforeOpen(DataSet: TDataSet);
begin
  qrMinaItem.DatabaseName := dao.minaPath;
end;

procedure Tfm_minasoft_pedidos.FormShow(Sender: TObject);
begin
  updatePedido.DatabaseName := dao.minaPath;
end;

end.

