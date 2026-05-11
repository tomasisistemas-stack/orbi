unit un_entrada_producao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, sLabel,
  Vcl.Mask, sMaskEdit, sCustomComboEdit, sToolEdit, sComboEdit, sBevel, Data.DB,
  RxMemDS, Vcl.Grids, Vcl.DBGrids, acDBGrid, RxToolEdit, RxDBCtrl, acDBTextFX,
  sCurrEdit, sDBCalcEdit, Vcl.Buttons, sBitBtn,  Vcl.ComCtrls,
  frxClass, sSpeedButton, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  Tfrm_entrada_producao = class(TForm)
    pnCab: TPanel;
    gbCodigo: TGroupBox;
    GbLocal: TGroupBox;
    gbEmissao: TGroupBox;
    PrDT_EMISSAO: TsDateEdit;
    PrLocal: TsComboEdit;
    sBevel1: TsBevel;
    lbdescEstoque: TsLabelFX;
    mmEntradaItem: TRxMemoryData;
    mmEntradaItemCOD_PRODUTO: TIntegerField;
    mmEntradaItemDESCRICAO: TStringField;
    mmEntradaItemQUANTIDADE: TFloatField;
    mmEntradaItemCUSTO: TCurrencyField;
    mmEntradaItemTOTAL: TCurrencyField;
    dsEntradaItem: TDataSource;
    Panel3: TPanel;
    pnItensCtrl: TPanel;
    pnbotoesitens: TPanel;
    Btnovitem: TsBitBtn;
    Btaltitem: TsBitBtn;
    Btgraitem: TsBitBtn;
    Btcanitem: TsBitBtn;
    BTEXCLUIRitem: TsBitBtn;
    sDBGrid1: Tdbgrid;
    Panel2: TPanel;
    Btlocped: TsBitBtn;
    Btgraped: TsBitBtn;
    Btaltped: TsBitBtn;
    Btnovped: TsBitBtn;
    Panel6: TPanel;
    pnItens: TPanel;
    GroupBox1: TGroupBox;
    sBevel2: TsBevel;
    lbDescProduto: TsDBTextFX;
    Mecod_produto: TRxDBComboEdit;
    GroupBox2: TGroupBox;
    Meqtd: TsDBCalcEdit;
    fR_RELATORIO: TfrxReport;
    BtAlterarStatus: TsSpeedButton;
    btImprimir: TsSpeedButton;
    Btcanped: TsBitBtn;
    lbCodigo: TLabel;
    Status: TLabel;
    q_clientes: TFDQuery;
    procedure PrLocalExit(Sender: TObject);
    procedure PrLocalButtonClick(Sender: TObject);
    procedure Mecod_produtoExit(Sender: TObject);
    procedure Mecod_produtoButtonClick(Sender: TObject);
    procedure MeqtdExit(Sender: TObject);
    procedure BtnovitemClick(Sender: TObject);
    procedure BtaltitemClick(Sender: TObject);
    procedure BtgraitemClick(Sender: TObject);
    procedure BTEXCLUIRitemClick(Sender: TObject);
    procedure BtcanitemClick(Sender: TObject);
    procedure BtnovpedClick(Sender: TObject);
    procedure BtaltpedClick(Sender: TObject);
    procedure BtcanpedClick(Sender: TObject);
    procedure BtlocpedClick(Sender: TObject);
    procedure BtgrapedClick(Sender: TObject);
    procedure BtAlterarStatusClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtImprimirClick(Sender: TObject);
    procedure fR_RELATORIOGetValue(const VarName: string; var Value: Variant);
  private
    procedure GerarSerie(produto: string; qtd: integer);
    procedure LimpaDados;
    { Private declarations }
  public
    { Public declarations }
    procedure CarregaEntrada(codigo: string);
    procedure CarregaEntradaItem(codigo: string);
  end;

var
  frm_entrada_producao: Tfrm_entrada_producao;
  modo: string; // inserir; alterar;
  campo_pesquisado, dado_pesquisado: string;
  busca_qualquer_posicao_pesquisada, transferencia: boolean;

implementation

uses un_dao, un_localizar, unpri, UnFun, Un_dm, alterar_status_ordem_producao;

{$R *.dfm}

procedure Tfrm_entrada_producao.BtaltitemClick(Sender: TObject);
begin
  Btnovitem.Enabled := false;
  Btaltitem.Enabled := false;
  BTEXCLUIRitem.Enabled := false;
  Btgraitem.Enabled := true;
  Btcanitem.Enabled := true;
  pnItens.Enabled := true;
  pnbotoesitens.Enabled := true;
  if not mmEntradaItem.Active then
    mmEntradaItem.open;
  mmEntradaItem.Edit;
end;

procedure Tfrm_entrada_producao.LimpaDados;
begin
  mmEntradaItem.EmptyTable;
  PrLocal.Clear;
  PrDT_EMISSAO.Clear;
end;

procedure Tfrm_entrada_producao.BtaltpedClick(Sender: TObject);
begin
  modo := 'alterar';
  Btnovped.Enabled := false;
  Btaltped.Enabled := false;
  Btlocped.Enabled := false;
  BtAlterarStatus.Enabled := false;
  Btgraped.Enabled := true;
  Btcanped.Enabled := true;
  Btnovitem.Enabled := true;
  Btaltitem.Enabled := not mmEntradaItem.IsEmpty;
  pnCab.Enabled := true;
  pnbotoesitens.Enabled := true;
end;

procedure Tfrm_entrada_producao.BtcanitemClick(Sender: TObject);
begin
  Btnovitem.Enabled := true;
  Btaltitem.Enabled := true;
  BTEXCLUIRitem.Enabled := false;
  Btgraitem.Enabled := false;
  Btcanitem.Enabled := false;
  pnItens.Enabled := false;

  if MessageDlg('Desejas cancelar este item?', mtConfirmation, [mbYes, mbno], 0)
    = mryes then
    mmEntradaItem.Cancel;
end;

procedure Tfrm_entrada_producao.BtcanpedClick(Sender: TObject);
begin
  if MessageDlg('Desejas cancelar este item?', mtConfirmation, [mbYes, mbno], 0)
    = mryes then
    if lbCodigo.Caption <> '' then
      CarregaEntrada(lbCodigo.Caption)
    else
    begin
      LimpaDados;
      Btnovped.Enabled := true;
      BtAlterarStatus.Enabled := not mmEntradaItem.IsEmpty;
      Btlocped.Enabled := true;
      BtAlterarStatus.Enabled := not mmEntradaItem.IsEmpty;
      Btgraped.Enabled := false;
      Btcanped.Enabled := false;
      pnCab.Enabled := false;
      pnbotoesitens.Enabled := false;
    end;
end;

procedure Tfrm_entrada_producao.BTEXCLUIRitemClick(Sender: TObject);
begin
  Btnovitem.Enabled := true;
  Btaltitem.Enabled := true;
  BTEXCLUIRitem.Enabled := false;
  Btgraitem.Enabled := false;
  Btcanitem.Enabled := false;
  pnItens.Enabled := false;
  if mmEntradaItem.IsEmpty then
    exit;
  if MessageDlg('Desejas excluir este item?', mtConfirmation, [mbYes, mbno], 0)
    = mryes then
    mmEntradaItem.Delete;
end;

procedure Tfrm_entrada_producao.BtAlterarStatusClick(Sender: TObject);
var
  msg, status: string;
  desativar: boolean;
begin
  Application.CreateForm(Tfrm_alterar_status_ordem_producao, frm_alterar_status_ordem_producao);
  frm_alterar_status_ordem_producao.ShowModal;
  if frm_alterar_status_ordem_producao.ModalResult = mrok then
    status := frm_alterar_status_ordem_producao.status;
  frm_alterar_status_ordem_producao.Free;

  if not dao.cn.InTransaction then dao.cn.StartTransaction;

  if MessageDlg('Desejas alterar o Status?', mtConfirmation, [mbYes, mbno], 0) = mryes then
  begin
    if Btcanped.Enabled = true then
      BtcanpedClick(Self);

    if lbCodigo.Caption <> '' then
    begin
      try
        if not(dao.cn.InTransaction) then
          dao.cn.StartTransaction;

        if Status = 'CANCELADO' then
          dao.Execsql
            ('UPDATE ENTRADA_PRODUCAO SET STATUS = ''3'' WHERE CODIGO  = ' +
            lbCodigo.Caption);

        if Status = 'À PRODUZIR' then
          dao.Execsql
            ('UPDATE ENTRADA_PRODUCAO SET STATUS = ''0'' WHERE CODIGO  = ' +
            lbCodigo.Caption);

        if Status = 'EM PRODUÇÃO' then
          dao.Execsql
            ('UPDATE ENTRADA_PRODUCAO SET STATUS = ''1'' WHERE CODIGO  = ' +
            lbCodigo.Caption);

        if Status = 'FINALIZADO' then
        begin
          dao.Execsql
            ('UPDATE ENTRADA_PRODUCAO SET STATUS = ''2'' WHERE CODIGO  = ' +
            lbCodigo.Caption);

           mmEntradaItem.First;
           mmEntradaItem.DisableControls;
           while not mmEntradaItem.Eof do
           begin
             GerarSerie(mmEntradaItemCOD_PRODUTO.AsString, mmEntradaItemQUANTIDADE.AsInteger);
             mmEntradaItem.Next;
           end;
           mmEntradaItem.First;
           mmEntradaItem.EnableControls;

         end;
        dao.cn.Commit;
      except
        dao.cn.Rollback;
      end;
      CarregaEntrada(lbCodigo.Caption);
    end;
  end;

end;

procedure Tfrm_entrada_producao.BtgraitemClick(Sender: TObject);
begin
  if Mecod_produto.Text = '' then
  begin
    MessageDlg('Produto não informado.', mtInformation, [mbOk], 0);
    Mecod_produto.SetFocus;
    exit;
  end;

  if Meqtd.AsInteger = 0 then
  begin
    MessageDlg('Quantidade não informada.', mtInformation, [mbOk], 0);
    Mecod_produto.SetFocus;
    exit;
  end;

  Btnovitem.Enabled := true;
  Btaltitem.Enabled := true;
  BTEXCLUIRitem.Enabled := false;
  Btgraitem.Enabled := false;
  Btcanitem.Enabled := false;
  pnItens.Enabled := false;
  mmEntradaItem.Post;
end;

procedure Tfrm_entrada_producao.BtgrapedClick(Sender: TObject);
var
  sql_insert: string;
  x: integer;
begin
  if PrLocal.Text = '' then
  begin
    MessageDlg('Local de Estoque não informado.', mtInformation, [mbOk], 0);
    PrLocal.SetFocus;
    exit;
  end;

  if PrDT_EMISSAO.Date = 0 then
  begin
    MessageDlg('Data de Emissão não informada.', mtInformation, [mbOk], 0);
    PrDT_EMISSAO.SetFocus;
    exit;
  end;

  if mmEntradaItem.IsEmpty then
  begin
    MessageDlg('Não poderá gravar o registro sem itens.', mtInformation,
      [mbOk], 0);
    PrLocal.SetFocus;
    exit;
  end;

  try
    if modo = 'inserir' then
    begin
      lbCodigo.Caption := dao.insert('Pr', 'ENTRADA_PRODUCAO', 'codigo',
        frm_entrada_producao, 'GEN_ENTRADA_PRODUCAO');
    end;

    if modo = 'alterar' then
      dao.Execsql('UPDATE ENTRADA_PRODUCAO SET LOCAL = ' + PrLocal.Text +
        ', DT_EMISSAO = ' + QuotedStr(FormatDateTime('dd.mm.yyyy',
        PrDT_EMISSAO.Date)) + ', STATUS = ''0'' WHERE CODIGO  = ' +
        lbCodigo.Caption);

    mmEntradaItem.First;

    dao.cn.StartTransaction;
    dao.Execsql('DELETE FROM ENTRADA_PRODUCAO_ITEM WHERE codigo = ' +
      lbCodigo.Caption);
    while not mmEntradaItem.Eof do
    begin
      sql_insert :=
        'INSERT INTO ENTRADA_PRODUCAO_ITEM (CODIGO, COD_PRODUTO, QTDE) ' +
        ' VALUES (' + lbCodigo.Caption + ', ' +
        mmEntradaItemCOD_PRODUTO.AsString + ', ' +
        mmEntradaItemQUANTIDADE.AsString + ');';
      dao.Execsql(sql_insert);

{      GerarSerie(mmEntradaItemCOD_PRODUTO.AsString,
        mmEntradaItemQUANTIDADE.AsInteger);}

      mmEntradaItem.Next;
    end;

    dao.cn.Commit;

  finally
    showmessage('Registro Salvo com Sucesso!');
    CarregaEntrada(lbCodigo.Caption);
  end;
end;

procedure Tfrm_entrada_producao.BtImprimirClick(Sender: TObject);
var
  cmd, path, relatorio: string;
  oExportfilter: TfrxCustomExportFilter;
begin

  path := ExtractFilePath(Application.ExeName);

  with dm.q_ordem_producao do
  begin
    Close;
    ParamByName('cod').AsString := lbCodigo.Caption;
    Open;
  end;




  if not(fR_RELATORIO.LoadFromFile(path + 'Relatorios\ordem_producao.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 +
      'Avise o Suporte');
    Exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure Tfrm_entrada_producao.GerarSerie(produto: string; qtd: integer);
var
  x: integer;
  sql, serie: string;
begin

  x := 0;
  repeat
    sql := 'select nextval(''GEN_SERIE_PRODUTO'') as gen_id from configuracao';	
    dao.Geral1(sql);
    serie := dao.Q1.fieldbyname('gen_id').AsString;

    sql := ' INSERT INTO SERIE_PRODUTO (SERIE, COD_PRODUTO) ' + ' VALUES (' +
      serie + ',' + produto + ');';
    dao.Execsql(sql);

    sql := ' INSERT INTO SERIE_MOVIMENTO (SERIE, MOVIMENTO, TIPO) ' +
      ' VALUES (' + serie + ', 1,  ''ENTRADA DE PRODUÇÃO'')';
    dao.Execsql(sql);

    inc(x);
  until (x = qtd);

end;

procedure Tfrm_entrada_producao.BtlocpedClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Entrada de Produção';
  chamou_pesquisa := 'fr_entrada_producao';
  chamou_form := 'fr_entrada_producao';
  chamou_cadastro := 'Fr_entrada_producao';

  Fr_localizar.BT_cadastro.Visible := false;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Nº Documento';
  Campos_combo[1] := 'Local';
  Campos_combo[2] := 'Emissão';

  for i := 0 to 2 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  if campo_pesquisado <> '' then
  begin
    Fr_localizar.CBcampos.ItemIndex := Fr_localizar.CBcampos.Items.IndexOf
      (campo_pesquisado);
    Fr_localizar.EDlocalizar.Text := dado_pesquisado;
    Fr_localizar.zzbusca_qualquer.Checked := busca_qualquer_posicao_pesquisada;
    Fr_localizar.loc_entrada_producao(Fr_localizar.EDlocalizar.Text);
  end;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure Tfrm_entrada_producao.BtnovitemClick(Sender: TObject);
begin
  Btnovitem.Enabled := false;
  Btaltitem.Enabled := false;
  BTEXCLUIRitem.Enabled := false;
  Btgraitem.Enabled := true;
  Btcanitem.Enabled := true;
  pnItens.Enabled := true;

  if not mmEntradaItem.Active then
    mmEntradaItem.open;
  mmEntradaItem.Append;
  Mecod_produto.SetFocus;
end;

procedure Tfrm_entrada_producao.BtnovpedClick(Sender: TObject);
begin
  modo := 'inserir';

  PrDT_EMISSAO.Date := now;
  Btnovped.Enabled := false;
  Btaltped.Enabled := false;
  Btlocped.Enabled := false;
  BtAlterarStatus.Enabled := false;
  Btgraped.Enabled := true;
  Btcanped.Enabled := true;
  Btnovitem.Enabled := true;
  pnCab.Enabled := true;
  pnbotoesitens.Enabled := true;
  PrLocal.SetFocus;
end;

procedure Tfrm_entrada_producao.Mecod_produtoButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
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
  chamou_form := 'fr_entrada_producao_produto';
  chamou_cadastro := 'Fr_produto';
  revenda := 'S';

  Fr_localizar.BT_cadastro.Visible := false;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'Marca';

  for i := 0 to 2 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.add(valor_combo);
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

procedure Tfrm_entrada_producao.Mecod_produtoExit(Sender: TObject);
begin
  if not mmEntradaItem.Active then
    exit;

  if trim(Mecod_produto.Text) = '' then
    mmEntradaItemDESCRICAO.AsString := '';

  if Mecod_produto.Text <> '' then
  begin
    dao.Geral2('select nom_produto, custo_total from produto where cod_produto='
      + QuotedStr(Mecod_produto.Text));
    if dao.Q2.RecordCount > 0 then
    begin
      mmEntradaItemDESCRICAO.AsString :=
        dao.Q2.fieldbyname('nom_produto').AsString;
      mmEntradaItemCUSTO.Value := dao.Q2.fieldbyname('custo_total').AsFloat;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Mecod_produto.Text := '';
      Mecod_produto.SetFocus;
      exit;
    end;
  end;

end;

procedure Tfrm_entrada_producao.MeqtdExit(Sender: TObject);
begin
  mmEntradaItemTOTAL.Value := mmEntradaItemQUANTIDADE.Value *
    mmEntradaItemCUSTO.Value;
end;

procedure Tfrm_entrada_producao.PrLocalButtonClick(Sender: TObject);
var
  q_campos_proponente: TFDQuery;
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;

  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Categorias de Estoque';

  chamou_pesquisa := 'fr_categoria_estoque';
  chamou_form := 'fr_entrada_producao_local';
  chamou_cadastro := 'fr_categoria_estoque';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 +
    'Categoria de Estoque';

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Descrição';

  for i := 0 to 1 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.add(valor_combo);
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

procedure Tfrm_entrada_producao.PrLocalExit(Sender: TObject);
begin
  if trim(PrLocal.Text) = '' then
    lbdescEstoque.Caption := '...';

  if PrLocal.Text <> '' then
  begin
    dao.Geral2('select descricao from categoria_estoque where id=' +
      QuotedStr(PrLocal.Text));
    if dao.Q2.RecordCount > 0 then
    begin
      lbdescEstoque.Caption := dao.Q2.fieldbyname('descricao').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      PrLocal.Text := '';
      PrLocal.SetFocus;
      exit;
    end;
  end;
end;

procedure Tfrm_entrada_producao.CarregaEntrada(codigo: string);
begin
  dao.Geral1
    ('SELECT EP.CODIGO, EP.DT_EMISSAO, EP.LOCAL, CE.DESCRICAO, EP.STATUS from ENTRADA_PRODUCAO EP '
    + 'LEFT OUTER JOIN CATEGORIA_ESTOQUE CE ON CE.ID = EP.LOCAL ' +
    'WHERE EP.CODIGO = ' + codigo);

  if not dao.Q1.IsEmpty then
  begin
    lbCodigo.Caption       := dao.Q1.fieldbyname('codigo').AsString;
    PrLocal.Text           := dao.Q1.fieldbyname('LOCAL').AsString;
    lbdescEstoque.Caption  := dao.Q1.fieldbyname('DESCRICAO').AsString;
    PrDT_EMISSAO.Date      := dao.Q1.fieldbyname('DT_EMISSAO').AsDateTime;

    Btnovped.Enabled := true;
    Btaltped.Enabled := true;
    Btlocped.Enabled := true;
    BtAlterarStatus.Enabled := true;
    Btgraped.Enabled := false;
    Btcanped.Enabled := false;
    pnCab.Enabled := false;
    pnbotoesitens.Enabled := false;

    case dao.Q1.fieldbyname('STATUS').AsInteger of
      0:
        begin
          Status.Caption := 'À PRODUZIR';
          BtAlterarStatus.Enabled := true;
        end;
      1:
        begin
          Status.Caption := 'EM PRODUÇÃO';
          BtAlterarStatus.Enabled := true;
        end;
      2:
        begin
          Status.Caption := 'FINALIZADO';
          BtAlterarStatus.Enabled := true;
        end;
      3:
        begin
          Status.Caption := 'CANCELADO';
          BtAlterarStatus.Enabled := true;
        end;
    end;

    CarregaEntradaItem(codigo);

  end;
end;

procedure Tfrm_entrada_producao.CarregaEntradaItem(codigo: string);
begin
  dao.Geral1
    ('SELECT EI.CODIGO, EI.COD_PRODUTO, P.NOM_PRODUTO, EI.QTDE, P.CUSTO, (EI.QTDE * P.CUSTO) AS SUBTOTAL '
    + 'FROM ENTRADA_PRODUCAO_ITEM EI INNER JOIN PRODUTO P ON P.COD_PRODUTO = EI.COD_PRODUTO '
    + 'WHERE EI.CODIGO = ' + codigo);

  if not mmEntradaItem.Active then
    mmEntradaItem.open;
  mmEntradaItem.EmptyTable;

  if dao.Q1.IsEmpty then
    exit;

  while not dao.Q1.Eof do
  begin

    mmEntradaItem.Append;
    mmEntradaItemCOD_PRODUTO.AsString :=
      dao.Q1.fieldbyname('COD_PRODUTO').AsString;
    mmEntradaItemDESCRICAO.AsString :=
      dao.Q1.fieldbyname('NOM_PRODUTO').AsString;
    mmEntradaItemQUANTIDADE.AsFloat := dao.Q1.fieldbyname('QTDE').AsFloat;
    mmEntradaItemCUSTO.AsFloat := dao.Q1.fieldbyname('CUSTO').AsFloat;
    mmEntradaItemTOTAL.AsFloat := dao.Q1.fieldbyname('SUBTOTAL').AsFloat;
    mmEntradaItem.Post;

    dao.Q1.Next;
  end;
  mmEntradaItem.First;

  Btnovitem.Enabled := true;
  Btaltitem.Enabled := not mmEntradaItem.IsEmpty;
  BTEXCLUIRitem.Enabled := not mmEntradaItem.IsEmpty;
  Btgraitem.Enabled := false;
  Btcanitem.Enabled := false;
  pnItens.Enabled := false;
end;

procedure Tfrm_entrada_producao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    close;
  if Key = #13 then
  begin

    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure Tfrm_entrada_producao.FormShow(Sender: TObject);
begin
  Btlocped.Enabled := true;
  Btlocped.SetFocus;
end;

procedure Tfrm_entrada_producao.fR_RELATORIOGetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'empresa' then
    Value := nom_empresa;
end;

end.
