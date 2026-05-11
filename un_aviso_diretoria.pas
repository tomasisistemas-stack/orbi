unit un_aviso_diretoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, ExtCtrls, DB, RxMemDS, StdCtrls,
  DBCtrls, Buttons, frxClass, sPageControl, sSpeedButton,
  sPanel, sBitBtn, sCheckBox, sDBCheckBox, sLabel, acDBGrid, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrAvisosDiretoria = class(TForm)
    Panel1: tsPanel;
    pg: TsPageControl;
    TbPedido: TsTabSheet;
    Panel2: tsPanel;
    Panel3: tsPanel;
    Panel4: tsPanel;
    dgPedido: Tdbgrid;
    Panel5: tsPanel;
    dgItem: Tdbgrid;
    q_pedidos: TFDQuery;
    ds_pedidos: TDataSource;
    q_itens: TFDQuery;
    ds_itens: TDataSource;
    Panel6: tsPanel;
    DBMemo1: TDBMemo;
    btImprimir: TsSpeedButton;
    fR_RELATORIO: TfrxReport;
    tbEstoque: TsTabSheet;
    q_grupo: TFDQuery;
    ds_grupo: TDataSource;
    q_produto: TFDQuery;
    ds_produto: TDataSource;
    sPanel1: TsPanel;
    dg_grupo: Tdbgrid;
    sPanel2: TsPanel;
    dg_produtos: Tdbgrid;
    btSair: TsSpeedButton;
    ckBloqueado: TsDBCheckBox;
    ckAtraso: TsDBCheckBox;
    ckEstoque: TsDBCheckBox;
    Shape1: TShape;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    Shape2: TShape;
    sLabel3: TsLabel;
    Shape3: TShape;
    Shape4: TShape;
    sLabel4: TsLabel;
    Shape5: TShape;
    sLabel5: TsLabel;
    ckMargemAbaixo: TsDBCheckBox;
    sTabSheet1: TsTabSheet;
    sPanel3: TsPanel;
    sPanel4: TsPanel;
    sDBGrid1: Tdbgrid;
    sPanel5: TsPanel;
    sPanel6: TsPanel;
    dgPedidosLiberacao: Tdbgrid;
    sPanel7: TsPanel;
    Shape10: TShape;
    sLabel10: TsLabel;
    DBMemo2: TDBMemo;
    Shape6: TShape;
    sLabel6: TsLabel;
    q_pedidos_liberacao: TFDQuery;
    ds_pedidos_liberacao: TDataSource;
    ckAtrasoLib: TsDBCheckBox;
    ckMargemLib: TsDBCheckBox;
    ckLiberarPedido: TsDBCheckBox;
    q_grupocod_grupo: TIntegerField;
    q_gruponom_grupo: TStringField;
    q_pedidosnumdoc: TIntegerField;
    q_pedidosdtadoc: TDateField;
    q_pedidoscod_cliente: TIntegerField;
    q_pedidoscliente: TStringField;
    q_pedidostot_bruto: TBCDField;
    q_pedidostot_liquido: TBCDField;
    q_pedidosfop: TStringField;
    q_pedidosrepresentante: TStringField;
    q_pedidosprazo: TStringField;
    q_pedidosnr_pedido_palm: TStringField;
    q_pedidospalm_nr_conexao: TIntegerField;
    q_pedidosobservacoes_pedido: TMemoField;
    q_pedidosestoque: TMemoField;
    q_pedidoscliente_bloqueado: TStringField;
    q_pedidosatraso: TMemoField;
    q_pedidosmargem_abaixo: TMemoField;
    q_pedidosmargem_lucro: TFMTBCDField;
    q_pedidosmargem_minima: TBCDField;
    q_pedidos_liberacaonumdoc: TIntegerField;
    q_pedidos_liberacaodtadoc: TDateField;
    q_pedidos_liberacaocod_cliente: TIntegerField;
    q_pedidos_liberacaocliente: TStringField;
    q_pedidos_liberacaotot_bruto: TBCDField;
    q_pedidos_liberacaotot_liquido: TBCDField;
    q_pedidos_liberacaofop: TStringField;
    q_pedidos_liberacaorepresentante: TStringField;
    q_pedidos_liberacaoprazo: TStringField;
    q_pedidos_liberacaonr_pedido_palm: TStringField;
    q_pedidos_liberacaopalm_nr_conexao: TIntegerField;
    q_pedidos_liberacaoobservacoes_pedido: TMemoField;
    q_pedidos_liberacaoestoque: TMemoField;
    q_pedidos_liberacaocliente_bloqueado: TStringField;
    q_pedidos_liberacaoatraso: TMemoField;
    q_pedidos_liberacaomargem_abaixo: TMemoField;
    q_pedidos_liberacaomargem_lucro: TFMTBCDField;
    q_pedidos_liberacaomargem_minima: TBCDField;
    procedure FormShow(Sender: TObject);
    procedure CarregaDadosPedidoNovos;
    procedure CarregaDadosItem(numdoc: string);
    procedure dgPedidoEnter(Sender: TObject);
    procedure dgPedidoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dgPedidoCellClick(Column: TColumn);
    procedure q_pedidosAfterOpen(DataSet: TDataSet);
    procedure fR_RELATORIOGetValue(const VarName: string;
      var Value: Variant);
    procedure dg_grupoCellClick(Column: TColumn);
    procedure dg_grupoEnter(Sender: TObject);
    procedure dg_grupoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btSairClick(Sender: TObject);
    procedure dgPedidoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dgItemDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dgPedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dgPedidosLiberacaoCellClick(Column: TColumn);
    procedure dgPedidosLiberacaoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dgPedidosLiberacaoEnter(Sender: TObject);
    procedure dgPedidosLiberacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dgPedidosLiberacaoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dgPedidosLiberacaoDblClick(Sender: TObject);
  private
    procedure CarregaDadosProduto(grupo: string);
    procedure CarregaDadosGrupo;
    procedure ImprimirPedido;
    procedure ImprimirEstoqueMinimo;
    procedure CarregaDadosPedidoLiberacao;
    procedure LiberaFaturamento;
    { Private declarations }
  public
    { Public declarations }
    Aviso_Palm: boolean;
  end;

var
  FrAvisosDiretoria: TFrAvisosDiretoria;
  TotalSelecionados: integer;
implementation

uses Un_dao, UnPri, Un_dm, UnFun, un_email_envio, Math;

{$R *.dfm}

procedure TFrAvisosDiretoria.FormShow(Sender: TObject);
begin
  CarregaDadosPedidoNovos;
  CarregaDadosGrupo;
  CarregaDadosPedidoLiberacao;
end;

procedure TFrAvisosDiretoria.CarregaDadosPedidoLiberacao;
begin
  q_pedidos_liberacao.Close;
  q_pedidos_liberacao.Open;
end;

procedure TFrAvisosDiretoria.CarregaDadosPedidoNovos;
begin
  q_pedidos.Close;
  q_pedidos.Open;
end;

procedure TFrAvisosDiretoria.CarregaDadosGrupo;
begin
  q_grupo.Close;
  q_grupo.Open;
end;

procedure TFrAvisosDiretoria.CarregaDadosItem(numdoc: string);
begin
  q_itens.Close;
  q_itens.ParamByName('numdoc').value := numdoc;
  q_itens.Open;
end;

procedure TFrAvisosDiretoria.CarregaDadosProduto(grupo: string);
begin
  q_produto.Close;
  q_produto.ParamByName('grupo').value := grupo;
  q_produto.Open;
end;

procedure TFrAvisosDiretoria.dgPedidoEnter(Sender: TObject);
begin
  CarregaDadosItem(q_pedidosNUMDOC.AsString);
end;

procedure TFrAvisosDiretoria.dgPedidoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CarregaDadosItem(q_pedidosNUMDOC.AsString);
end;

procedure TFrAvisosDiretoria.dgPedidoCellClick(Column: TColumn);
begin
  CarregaDadosItem(q_pedidosNUMDOC.AsString);
end;

procedure TFrAvisosDiretoria.q_pedidosAfterOpen(DataSet: TDataSet);
begin
  q_pedidos.First;
  CarregaDadosItem(q_pedidosNUMDOC.AsString);
end;

procedure TFrAvisosDiretoria.ImprimirEstoqueMinimo;
var
  nom_arquivo: string;
  linha: integer;
  cod_produto, path: string;
  ac_qtd: Real;
  cmd: string;
begin
  path := ExtractFilePath(Application.ExeName);
  if not (fr_relatorio.LoadFromFile(path +
    'Relatorios\posicao_estoque_simplificado_ind.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 +
      'Avise o Suporte');
    exit;
  end;

  cmd := 'select pro.cod_produto, pro.nom_produto, pro.grade, pro.ESTOQUE_MINIMO, pro.QTD_EMBALAGEM, pro.UNIDADE, pro.qtd_estoque, pro.qtd_reservado, pro.cod_grupo, cr.cor , tm.tamanho, gd.est_individual, g.nom_grupo, pro.preco_venda, f.razao_social ' +
    'from produto pro ' +
    'left join grade gd on gd.cod_produto=pro.cod_produto ' +
    'left join cores cr on cr.id=gd.id_cor ' +
    'left join tamanho tm on tm.id=gd.id_tamanho ' +
    'left join fornecedor f on f.cod_fornecedor = pro.fornecedor_principal ' +
    'left join grupo g on g.cod_grupo = pro.cod_grupo ';

  cmd := cmd + 'where 1 = 1 and pro.status <> ''S'' and pro.QTD_ESTOQUE < pro.ESTOQUE_MINIMO ';

  cmd := cmd + ' order by f.razao_social, g.nom_grupo, pro.ORD_PAUTA';

  with DM.q_posicao_estoque do
  begin
    close;
    sql.clear;
    sql.Add(cmd);
    close;
  end;
  fr_relatorio.ShowReport;
end;

procedure TFrAvisosDiretoria.ImprimirPedido;
var
  cmd, conexao, path: string;
  EmailConexao: TEmail;
begin
  path := ExtractFilePath(Application.ExeName);
  cmd := 'select distinct v1.numdoc, v1.dtadoc, tot_liquido, coalesce((select sum(valor) from cr1 as cr where cr.nr_documento = v1.NUMDOC),0) as valor_cr, ' +
    ' c.nom_cliente, r.NOM_REPRESENTANTE, b.NOM_BANCO, r.NR_BANCO,r.NR_AGENCIA,r.NR_CONTA_CORRENTE, r.email, r.fone,r.celular,' +
    ' case when r.ID in (select cm.ID_REPRESENTANTE from COMISSAO cm) then (select cm.PERC_COMISSAO from comissao cm where cm.ID_REPRESENTANTE = r.ID and v1.DESCONTO between cm.PERC_MINIMO and cm.PERC_MAXIMO) else r.PERC_COMISSAO_FIXA end as comissao ' +
    'from vendas1 v1 ' +
    'left outer join vendas2 v2 on (v2.numdoc = v1.numdoc)           ' +
    'left outer join produto pr on (pr.COD_PRODUTO = v2.COD_PRODUTO) ' +
    'left outer join cliente c on c.cod_cliente=v1.cod_cliente      ' +
    'left outer join cidades cd on (c.cod_cidade = cd.cod_cidade)   ' +
    'left outer join cadmicro mc on (mc.microcod = cd.microcod)     ' +
    'left outer join cadmeso ms on (ms.mesocod = mc.mesocod)        ' +
    'left outer join REPRESENTANTE r on r.ID = v1.COD_REPRESENTANTE ' +
    'left outer join BANCO b on b.ID = r.NR_BANCO         ' +
    'left outer join prazo p on (p.ID = v1.COD_PRAZO_PGTO) ' +
    'left outer join fop f on (f.COD_FOP = v1.COD_FOP) ' +
    'where v1.consignacao<>' + QuotedStr('1') + ' and v1.orcamento=' +
    QuotedStr('0') + ' and v1.cod_fop <>' + QuotedStr('9') +
    ' and v1.DTADOC <= current_date - 3 AND v1.DTADOC >= ''01.11.2012'' AND v1.FATURADO NOT IN (1,2,3) ';

  cmd := cmd + ' order by v1.numdoc, v1.dtadoc';

  with dm.q_vendas1 do
  begin
    close;
    sql.Clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_vendas1.RecordCount < 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not (fr_relatorio.LoadFromFile(path + 'Relatorios\vendas_padrao_ind.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 +
      'Avise o Suporte');
    exit;
  end;

  {
    cmd := 'select distinct v1.numdoc, v1.dtadoc, tot_liquido, coalesce((select sum(valor) from cr1 as cr where cr.nr_documento = v1.NUMDOC),0) as valor_cr, '
      +
      ' c.nom_cliente, r.NOM_REPRESENTANTE, b.NOM_BANCO, r.NR_BANCO,r.NR_AGENCIA,r.NR_CONTA_CORRENTE, r.email, r.fone,r.celular,' +
      ' case when r.ID in (select cm.ID_REPRESENTANTE from COMISSAO cm) then (select cm.PERC_COMISSAO from comissao cm where cm.ID_REPRESENTANTE = r.ID and v1.DESCONTO between cm.PERC_MINIMO and cm.PERC_MAXIMO) else r.PERC_COMISSAO_FIXA end as comissao ' +
      'from vendas1 v1 ' +
      'inner join vendas2 v2 on (v2.numdoc = v1.numdoc) ' +
      'inner join produto p on (p.COD_PRODUTO = v2.COD_PRODUTO) ' +
      'left join cliente c on c.cod_cliente=v1.cod_cliente ' +
      'inner join cidades cd on (c.cod_cidade = cd.cod_cidade) ' +
      'inner join cadmicro mc on (mc.microcod = cd.microcod) ' +
      'inner join cadmeso ms on (ms.mesocod = mc.mesocod) ' +
      'left join REPRESENTANTE r on r.ID = v1.COD_SUPERVISOR ' +
      'left join BANCO b on b.ID = r.NR_BANCO ' +
      'where v1.consignacao<>' + QuotedStr('1') + ' and v1.orcamento=' + QuotedStr('0') +
      ' and v1.cod_fop <>' + QuotedStr('9') +
      ' and v1.DTADOC <= current_date - 3 AND v1.DTADOC >= ''10/01/2012'' AND v1.FATURADO NOT IN (1,2) ';

    cmd := cmd + ' order by  NOM_REPRESENTANTE, v1.NUMDOC, v2.COD_PRODUTO, v2.VOLUME ';

    with dm.q_vendas1 do
    begin
      close;
      sql.Clear;
      sql.add(cmd);
      open;
    end;

    if not (fr_relatorio.LoadFromFile(path + 'Relatorios\vendas_padrao_ind.fr3')) then
    begin
      dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
      exit;
    end;}
  fr_relatorio.ShowReport;
end;

procedure TFrAvisosDiretoria.fR_RELATORIOGetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'empresa' then
    Value := nom_empresa
  else if VarName = 'dtaini' then
    value := FormatDateTime('dd/mm/yyyy', now)
  else if VarName = 'dtafin' then
    value := FormatDateTime('dd/mm/yyyy', now)
end;

procedure TFrAvisosDiretoria.dg_grupoCellClick(Column: TColumn);
begin
  CarregaDadosProduto(q_grupoCOD_GRUPO.AsString);
end;

procedure TFrAvisosDiretoria.dg_grupoEnter(Sender: TObject);
begin
  CarregaDadosProduto(q_grupoCOD_GRUPO.AsString);
end;

procedure TFrAvisosDiretoria.dg_grupoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CarregaDadosProduto(q_grupoCOD_GRUPO.AsString);
end;

procedure TFrAvisosDiretoria.btImprimirClick(Sender: TObject);
begin
  if pg.ActivePage = TbPedido then
    ImprimirPedido;

  if pg.ActivePage = tbEstoque then
    ImprimirEstoqueMinimo;

end;

procedure TFrAvisosDiretoria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrAvisosDiretoria.btSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrAvisosDiretoria.dgPedidoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
const
  IsChecked: array[Boolean] of Integer =
  (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  if q_pedidos.FieldByName('CLIENTE_BLOQUEADO').AsString = 'S' then
  begin
    if (gdSelected in State) then // se a célula está selecionada
    begin
      dgPedido.Canvas.Font.Color := clWhite;
      dgPedido.Canvas.Brush.Color := clMaroon;
    end
    else
    begin
      dgPedido.Canvas.Font.Color := clMaroon;
      dgPedido.Canvas.Brush.Color := clWhite;
    end;
  end
  else if q_pedidos.FieldByName('MARGEM_ABAIXO').AsString = 'S' then
  begin
    if (gdSelected in State) then // se a célula está selecionada
    begin
      dgPedido.Canvas.Font.Color := clWhite;
      dgPedido.Canvas.Brush.Color := clGray;
    end
    else
    begin
      dgPedido.Canvas.Font.Color := clGray;
      dgPedido.Canvas.Brush.Color := clWhite;
    end;
  end
  else if q_pedidos.FieldByName('ATRASO').AsString = 'S' then
  begin
    if (gdSelected in State) then // se a célula está selecionada
    begin
      dgPedido.Canvas.Font.Color := clWhite;
      dgPedido.Canvas.Brush.Color := clTeal;
    end
    else
    begin
      dgPedido.Canvas.Font.Color := clTeal;
      dgPedido.Canvas.Brush.Color := clWhite;
    end;
  end
  else if q_pedidos.FieldByName('ESTOQUE').AsString = 'S' then
  begin
    if (gdSelected in State) then // se a célula está selecionada
    begin
      dgPedido.Canvas.Font.Color := clWhite;
      dgPedido.Canvas.Brush.Color := clOlive;
    end
    else
    begin
      dgPedido.Canvas.Font.Color := clOlive;
      dgPedido.Canvas.Brush.Color := clWhite;
    end;
  end
  else
  begin
    if (gdSelected in State) then // se a célula está selecionada
    begin
      dgPedido.Canvas.Font.Color := clWhite;
      dgPedido.Canvas.Brush.Color := clNavy;
    end
    else
    begin
      dgPedido.Canvas.Font.Color := clNavy;
      dgPedido.Canvas.Brush.Color := clWhite;
    end;
  end;
  dgPedido.Canvas.FillRect(Rect);
  dgPedido.DefaultDrawDataCell(Rect, dgPedido.columns[datacol].field, State);

  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = ckBloqueado.DataField) then
    begin
      ckBloqueado.Left := Rect.Left + dgPedido.Left + 2;
      ckBloqueado.Top := Rect.Top + dgPedido.top + 2;
      ckBloqueado.Width := Rect.Right - Rect.Left;
      ckBloqueado.Height := Rect.Bottom - Rect.Top;
      ckBloqueado.Visible := True;
    end;

    if (Column.Field.FieldName = ckAtraso.DataField) then
    begin
      ckAtraso.Left := Rect.Left + dgPedido.Left + 2;
      ckAtraso.Top := Rect.Top + dgPedido.top + 2;
      ckAtraso.Width := Rect.Right - Rect.Left;
      ckAtraso.Height := Rect.Bottom - Rect.Top;
      ckAtraso.Visible := True;
    end;

    if (Column.Field.FieldName = ckEstoque.DataField) then
    begin
      ckEstoque.Left := Rect.Left + dgPedido.Left + 2;
      ckEstoque.Top := Rect.Top + dgPedido.top + 2;
      ckEstoque.Width := Rect.Right - Rect.Left;
      ckEstoque.Height := Rect.Bottom - Rect.Top;
      ckEstoque.Visible := True;
    end;

    if (Column.Field.FieldName = ckMargemAbaixo.DataField) then
    begin
      ckMargemAbaixo.Left := Rect.Left + dgPedido.Left + 2;
      ckMargemAbaixo.Top := Rect.Top + dgPedido.top + 2;
      ckMargemAbaixo.Width := Rect.Right - Rect.Left;
      ckMargemAbaixo.Height := Rect.Bottom - Rect.Top;
      ckMargemAbaixo.Visible := True;
    end;

  end
  else
  begin
    if (Column.Field.FieldName = ckBloqueado.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := ISChecked[Column.Field.AsString = 'S'];

      dgPedido.Canvas.Brush.Color := clMaroon;
      dgPedido.Canvas.FillRect(Rect);

      DrawFrameControl(dgPedido.Canvas.Handle, DrawRect,
        DFC_BUTTON, DrawState);
    end;

    if (Column.Field.FieldName = ckAtraso.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := ISChecked[Column.Field.AsString = 'S'];

      dgPedido.Canvas.Brush.Color := clTeal;
      dgPedido.Canvas.FillRect(Rect);
      DrawFrameControl(dgPedido.Canvas.Handle, DrawRect,
        DFC_BUTTON, DrawState);
    end;

    if (Column.Field.FieldName = ckEstoque.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := ISChecked[Column.Field.AsString = 'S'];

      dgPedido.Canvas.Brush.Color := clOlive;
      dgPedido.Canvas.FillRect(Rect);
      DrawFrameControl(dgPedido.Canvas.Handle, DrawRect,
        DFC_BUTTON, DrawState);
    end;

    if (Column.Field.FieldName = ckMargemAbaixo.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := ISChecked[Column.Field.AsString = 'S'];

      dgPedido.Canvas.Brush.Color := clGray;
      dgPedido.Canvas.FillRect(Rect);
      DrawFrameControl(dgPedido.Canvas.Handle, DrawRect,
        DFC_BUTTON, DrawState);
    end;

  end;
end;

procedure TFrAvisosDiretoria.dgItemDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if q_itens.FieldByName('qtd_estoque').AsFloat <= 0 then
  begin
    if (gdSelected in State) then // se a célula está selecionada
    begin
      dgItem.Canvas.Font.Color := clWhite;
      dgItem.Canvas.Brush.Color := clOlive;
    end
    else
    begin
      dgItem.Canvas.Font.Color := clOlive;
      dgItem.Canvas.Brush.Color := clWhite;
    end;
  end
  else
  begin
    if (gdSelected in State) then // se a célula está selecionada
    begin
      dgItem.Canvas.Font.Color := clWhite;
      dgItem.Canvas.Brush.Color := clNavy;
    end
    else
    begin
      dgItem.Canvas.Font.Color := clNavy;
      dgItem.Canvas.Brush.Color := clWhite;
    end;
  end;
  dgItem.Canvas.FillRect(Rect);
  dgItem.DefaultDrawDataCell(Rect, dgItem.columns[datacol].field, State);
end;

procedure TFrAvisosDiretoria.dgPedidoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F9 then
    FMFUN.VerificaFaturaVencida(q_pedidosCOD_CLIENTE.AsString, false);
end;

procedure TFrAvisosDiretoria.dgPedidosLiberacaoCellClick(Column: TColumn);
begin
  CarregaDadosItem(q_pedidos_liberacaoNUMDOC.AsString);
end;

procedure TFrAvisosDiretoria.dgPedidosLiberacaoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
const
  IsChecked: array[Boolean] of Integer =
  (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  if q_pedidos_liberacao.FieldByName('MARGEM_ABAIXO').AsString = 'S' then
  begin
    if (gdSelected in State) then // se a célula está selecionada
    begin
      dgPedidosLiberacao.Canvas.Font.Color := clWhite;
      dgPedidosLiberacao.Canvas.Brush.Color := clGray;
    end
    else
    begin
      dgPedidosLiberacao.Canvas.Font.Color := clGray;
      dgPedidosLiberacao.Canvas.Brush.Color := clWhite;
    end;
  end
  else if q_pedidos_liberacao.FieldByName('ATRASO').AsString = 'S' then
  begin
    if (gdSelected in State) then // se a célula está selecionada
    begin
      dgPedidosLiberacao.Canvas.Font.Color := clWhite;
      dgPedidosLiberacao.Canvas.Brush.Color := clTeal;
    end
    else
    begin
      dgPedidosLiberacao.Canvas.Font.Color := clTeal;
      dgPedidosLiberacao.Canvas.Brush.Color := clWhite;
    end;
  end
  else
  begin
    if (gdSelected in State) then // se a célula está selecionada
    begin
      dgPedidosLiberacao.Canvas.Font.Color := clWhite;
      dgPedidosLiberacao.Canvas.Brush.Color := clNavy;
    end
    else
    begin
      dgPedidosLiberacao.Canvas.Font.Color := clNavy;
      dgPedidosLiberacao.Canvas.Brush.Color := clWhite;
    end;
  end;
  dgPedidosLiberacao.Canvas.FillRect(Rect);
  dgPedidosLiberacao.DefaultDrawDataCell(Rect, dgPedidosLiberacao.columns[datacol].field, State);

  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = ckAtraso.DataField) then
    begin
      ckAtraso.Left := Rect.Left + dgPedidosLiberacao.Left + 2;
      ckAtraso.Top := Rect.Top + dgPedidosLiberacao.top + 2;
      ckAtraso.Width := Rect.Right - Rect.Left;
      ckAtraso.Height := Rect.Bottom - Rect.Top;
      ckAtraso.Visible := True;
    end;

    if (Column.Field.FieldName = ckMargemAbaixo.DataField) then
    begin
      ckMargemAbaixo.Left := Rect.Left + dgPedidosLiberacao.Left + 2;
      ckMargemAbaixo.Top := Rect.Top + dgPedidosLiberacao.top + 2;
      ckMargemAbaixo.Width := Rect.Right - Rect.Left;
      ckMargemAbaixo.Height := Rect.Bottom - Rect.Top;
      ckMargemAbaixo.Visible := True;
    end;

    if (Column.Field.FieldName = ckLiberarPedido.DataField) then
    begin
      ckLiberarPedido.Left := Rect.Left + dgPedidosLiberacao.Left + 2;
      ckLiberarPedido.Top := Rect.Top + dgPedidosLiberacao.top + 2;
      ckLiberarPedido.Width := Rect.Right - Rect.Left;
      ckLiberarPedido.Height := Rect.Bottom - Rect.Top;
      ckLiberarPedido.Visible := True;
    end;

  end
  else
  begin
    if (Column.Field.FieldName = ckAtrasoLib.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := ISChecked[Column.Field.AsString = 'S'];

      dgPedidosLiberacao.Canvas.Brush.Color := clTeal;
      dgPedidosLiberacao.Canvas.FillRect(Rect);
      DrawFrameControl(dgPedidosLiberacao.Canvas.Handle, DrawRect,
        DFC_BUTTON, DrawState);
    end;

    if (Column.Field.FieldName = ckMargemLib.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := ISChecked[Column.Field.AsString = 'S'];

      dgPedidosLiberacao.Canvas.Brush.Color := clGray;
      dgPedidosLiberacao.Canvas.FillRect(Rect);
      DrawFrameControl(dgPedidosLiberacao.Canvas.Handle, DrawRect,
        DFC_BUTTON, DrawState);
    end;

    if (Column.Field.FieldName = ckLiberarPedido.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := ISChecked[Column.Field.AsString = 'S'];

      dgPedidosLiberacao.Canvas.Brush.Color := clNavy;
      dgPedidosLiberacao.Canvas.FillRect(Rect);
      DrawFrameControl(dgPedidosLiberacao.Canvas.Handle, DrawRect,
        DFC_BUTTON, DrawState);
    end;

  end;
end;

procedure TFrAvisosDiretoria.dgPedidosLiberacaoEnter(Sender: TObject);
begin
  CarregaDadosItem(q_pedidos_liberacaoNUMDOC.AsString);
end;

procedure TFrAvisosDiretoria.dgPedidosLiberacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_SPACE then
    LiberaFaturamento;

  if Key = VK_F9 then
    FMFUN.VerificaFaturaVencida(q_pedidos_liberacaoCOD_CLIENTE.AsString, false);
end;

procedure TFrAvisosDiretoria.dgPedidosLiberacaoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  CarregaDadosItem(q_pedidos_liberacaoNUMDOC.AsString);
end;

procedure TFrAvisosDiretoria.dgPedidosLiberacaoDblClick(Sender: TObject);
begin
    LiberaFaturamento;
end;

procedure TFrAvisosDiretoria.LiberaFaturamento;
begin
  if Tipo_usuario <> '5' then exit;
  {
  if q_pedidos_liberacaoLIBERAR_FATURAMENTO.AsString = 'S' then
    dao.Execsql('UPDATE VENDAS1 SET LIBERAR_FATURAMENTO = ''N'' WHERE NUMDOC = '+q_pedidos_liberacaoNUMDOC.AsString)
  else
    dao.Execsql('UPDATE VENDAS1 SET LIBERAR_FATURAMENTO = ''S'' WHERE NUMDOC = '+q_pedidos_liberacaoNUMDOC.AsString);
    }
end;
end.

