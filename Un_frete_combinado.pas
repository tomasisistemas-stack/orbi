unit Un_frete_combinado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, RxMemDS, StdCtrls, Buttons, NFE_dll_TLB,
  DBCtrls, Mask, xmldom, XMLIntf, msxmldom, XMLDoc, IdFTPCommon,
  ACBrNFeDANFEClass, ACBrNFe, frxClass, acDBGrid, sEdit, sGroupBox, sComboEdit,
  sToolEdit, sMaskEdit, sCustomComboEdit, sCurrEdit, sCurrencyEdit, sCheckBox,
  sBitBtn, ACBrNFeDANFEFRDM, ACBrNFeDANFEFR, sSpeedButton, sLabel, sPanel,
  ACBrBase, ACBrDFeReport, ACBrDFeDANFeReport;

type
  Tfr_frete_combinado = class(TForm)
    mmListaFrete: TRxMemoryData;
    dsListaNFe: TDataSource;
    Panel1: tsPanel;
    Panel2: tsPanel;
    Panel3: tsPanel;
    dgListaNFe: Tdbgrid;
    BtnSair: TsBitBtn;
    mmListaFreteNum_Doc: TIntegerField;
    mmListaFreteCliente: TStringField;
    mmListaFreteData_Saida: TDateTimeField;
    mmListaFreteCheck: TBooleanField;
    DBCheckBox1: TDBCheckBox;
    gbPedido: TsGroupBox;
    gbDataSaida: TsGroupBox;
    edSaidaDe: TsDateEdit;
    Label2: tsLabel;
    Label1: tsLabel;
    edSaidaAte: TsDateEdit;
    gbCliente: TsGroupBox;
    edCliente: TsComboEdit;
    Lbnom_cliente: tsLabel;
    BtConsulta: TsBitBtn;
    edPedido: TsCurrencyEdit;
    lbTotalNFs: tsLabel;
    mmListaFreteNFE: TIntegerField;
    gbNFe: TsGroupBox;
    edNFe: TsCurrencyEdit;
    CheckTodos: tscheckbox;
    gbTransp: TsGroupBox;
    lbTransportadora: tsLabel;
    edTransportadora: TsComboEdit;
    mmListaFreteTransportadora: TStringField;
    mmListaFreteValorFrete: TCurrencyField;
    rgFreteComb: TsRadioGroup;
    gbConf: TsGroupBox;
    Label3: tsLabel;
    Label4: tsLabel;
    edConfDe: TsDateEdit;
    edConfAte: TsDateEdit;
    mmListaFreteDataConf: TDateField;
    Panel4: tsPanel;
    sbAlterar: TsSpeedButton;
    gbPrecoProm: TsGroupBox;
    gbValidoAte: TsGroupBox;
    edValorFrete: TDBEdit;
    edDtConf: TDBEdit;
    BtnConfirmar: TsSpeedButton;
    btImprimir: TsSpeedButton;
    fR_RELATORIO: TfrxReport;
    mmListaFreteChave_NFE: TStringField;
    mmListaFretePesoNota: TFloatField;
    mmListaFreteTotLiquido: TCurrencyField;
    mmListaFreteCidade: TStringField;
    mmListaFreteUF: TStringField;
    mmListaFreteVolumeNota: TFloatField;
    GroupBox1: TsGroupBox;
    Prcod_cidade: TsComboEdit;
    LbNom_cidade: tsLabel;
    edCidade: TsEdit;
    sbCidade: TsSpeedButton;
    GroupBox2: TsGroupBox;
    Pruf: TsComboEdit;
    lbuf: tsLabel;
    ckImpSVlrFrete: tscheckbox;
    btCancelar: TsSpeedButton;
    mmListaFreteUsuarioConf: TStringField;
    ACBrNFeDANFEFR1: TACBrNFeDANFEFR;
    procedure FormShow(Sender: TObject);
    procedure CarregarGrid;
    procedure dgListaNFeDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dgListaNFeColExit(Sender: TObject);
    procedure dgListaNFeKeyPress(Sender: TObject; var Key: Char);
    procedure edPedidoButtonClick(Sender: TObject);
    procedure edClienteButtonClick(Sender: TObject);
    procedure btBuscaDadosClienteClick(Sender: TObject);
    procedure BtConsultaClick(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure dgListaNFeDblClick(Sender: TObject);
    procedure CheckTodosClick(Sender: TObject);
    procedure sbAlterarClick(Sender: TObject);
    procedure sbTodosClick(Sender: TObject);
    procedure edTransportadoraButtonClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btImprimirClick(Sender: TObject);
    procedure fR_RELATORIOGetValue(const VarName: string;
      var Value: Variant);
    procedure Prcod_cidadeExit(Sender: TObject);
    procedure Prcod_cidadeButtonClick(Sender: TObject);
    procedure sbCidadeClick(Sender: TObject);
    procedure PrufButtonClick(Sender: TObject);
    procedure PrufExit(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fr_frete_combinado: Tfr_frete_combinado;
  TotalSelecionados: integer;

implementation

uses Un_dao, Un_localizar, UnPri, Un_dados_cliente, un_nfe_transmissao,
  Un_dm, Un_vendas_industria2, unFUN, Un_splash;

{$R *.dfm}

procedure Tfr_frete_combinado.CarregarGrid;
begin
  fm_splash.ggProgress.MaxValue := dao.q1.RecordCount;
  fm_splash.lbStatus.Caption := 'Carregando Itens...';
  fm_splash.ggProgress.progress := 0;
  fm_splash.Show;

  dao.q1.First;
  mmListaFrete.Close;
  mmListaFrete.EmptyTable;
  mmListaFrete.Open;

  totalselecionados := 0;
  while not dao.q1.eof do
  begin
    mmListaFrete.Append;
    mmListaFreteNum_Doc.Value := dao.Q1.fieldbyname('NUMDOC').value;
    mmListaFreteNFE.Value := dao.Q1.fieldbyname('NFE').value;
    mmListaFreteData_Saida.Value := dao.Q1.fieldbyname('DTA_SAIDA').value;
    mmListaFreteCliente.Value := dao.Q1.fieldbyname('CLIENTE').value;
    mmListaFreteTransportadora.Value := dao.Q1.fieldbyname('Transportadora').value;
    mmListaFreteValorFrete.Value := dao.Q1.fieldbyname('VL_FRETE').value;
    mmListaFreteDataConf.AsString := dao.Q1.fieldbyname('DT_FRETE_COMBINADO').AsString;
    mmListaFretePesoNota.Value := dao.Q1.fieldbyname('PESO_NOTA').value;

    mmListaFreteTotLiquido.Value := dao.Q1.fieldbyname('TOT_LIQUIDO').value;
    mmListaFreteVolumeNota.Value := dao.Q1.fieldbyname('VOLUME_NOTA').value;
    mmListaFreteCidade.AsString := dao.Q1.fieldbyname('NOM_CIDADE').AsString;
    mmListaFreteUF.AsString := dao.Q1.fieldbyname('UF').AsString;
    mmListaFreteUsuarioConf.AsString := dao.Q1.fieldbyname('USUARIO_CONF').AsString;

    if dao.Q1.FieldByName('FRETE_COMBINADO').AsString = 'S' then
    begin
      mmListaFreteCheck.Value := true;
      totalselecionados := totalselecionados + 1
    end
    else
      mmListaFreteCheck.Value := false;

    mmListaFrete.Post;

    fm_splash.ggProgress.AddProgress(1);
    fm_splash.Refresh;
    sleep(10);
    dao.q1.next;
  end;
  dao.q1.close;
  mmListaFrete.First;
  fm_splash.Hide;
  if TotalSelecionados = 0 then
    BtnConfirmar.enabled := false
  else
    BtnConfirmar.enabled := true;
end;

procedure Tfr_frete_combinado.FormShow(Sender: TObject);
var
  data_ini, data_fim: Tdate;
begin
  data_ini := now - 15;
  data_fim := now;
  edSaidaDe.Date := data_ini;
  edSaidaAte.Date := data_fim;


  dao.Geral1('SELECT CASE WHEN V.NFE IS NULL THEN 0 ELSE V.NFE END AS NFE, V.NUMDOC, V.DTA_SAIDA, T.COD_TRANSPORTADORA||''-''||T.NOME AS TRANSPORTADORA, V.FRETE_COMBINADO, ' +
    ' coalesce(V.VL_FRETE,0) as VL_FRETE, ' +
    ' CASE WHEN C.COD_CLIENTE IS NOT NULL THEN C.COD_CLIENTE||''-''||C.NOM_CLIENTE ELSE F.COD_FORNECEDOR||''-''||F.RAZAO_SOCIAL END as cliente, v.DT_FRETE_COMBINADO, coalesce(V.PESO_NOTA, 0) as PESO_NOTA, ' +
    ' CD.NOM_CIDADE, CD.UF, coalesce(V.TOT_LIQUIDO, 0) as TOT_LIQUIDO, coalesce(V.VOLUME_NOTA, 0) as VOLUME_NOTA, U.LOGUSU AS USUARIO_CONF ' +
    ' FROM VENDAS1 V ' +
    ' INNER JOIN TRANSPORTADORA T ON (T.COD_TRANSPORTADORA = V.COD_TRANSPORTADORA) ' +
    ' LEFT OUTER JOIN TBUSU U ON (U.CODUSU = V.USUARIO_CHECOU_FRETE_COMBINADO) ' +
    ' LEFT OUTER JOIN CLIENTE C ON (C.COD_CLIENTE = V.COD_CLIENTE) ' +
    ' LEFT OUTER JOIN FORNECEDOR F ON (F.COD_FORNECEDOR = V.COD_FORNECEDOR) ' +
    ' INNER JOIN CIDADES CD ON (coalesce(C.COD_CIDADE, F.COD_CIDADE) = CD.COD_CIDADE) ' +
    ' WHERE V.COD_TRANSPORTADORA NOT IN (4,10, 33, 15) AND V.FATURADO IN (''1'', ''3'') AND V.DTA_SAIDA between ' + quotedstr(formatdatetime('dd.mm.yyyy', data_ini)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', data_fim)) + '  ORDER BY V.DTA_SAIDA DESC, V.NUMDOC DESC');

  CarregarGrid;
end;

procedure Tfr_frete_combinado.dgListaNFeDrawColumnCell(Sender: TObject;
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
      DBCheckBox1.Left := Rect.Left + dgListaNFe.Left + 2;
      DBCheckBox1.Top := Rect.Top + dgListaNFe.top + 2;
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

      dgListaNFe.Canvas.FillRect(Rect);
      DrawFrameControl(dgListaNFe.Canvas.Handle, DrawRect,
        DFC_BUTTON, DrawState);
    end;
  end;
end;

procedure Tfr_frete_combinado.dgListaNFeColExit(Sender: TObject);
begin
  if dgListaNFe.SelectedField.FieldName = DBCheckBox1.DataField then
    DBCheckBox1.Visible := False
end;

procedure Tfr_frete_combinado.dgListaNFeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = Chr(9)) then
    Exit;

  if (dgListaNFe.SelectedField.FieldName = DBCheckBox1.DataField) then
  begin
    DBCheckBox1.SetFocus;
    SendMessage(DBCheckBox1.Handle, WM_Char, word(Key), 0);
  end;

end;

procedure Tfr_frete_combinado.edPedidoButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
  It, J, Coluna: byte;
  totalcusto, lucromedio, tot_lucro: real;
  contador: integer;
  lucro: real;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  //guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Vendas';
  chamou_pesquisa := 'fr_pedido';
  chamou_form := 'fr_nfe_envio_lote';
  chamou_cadastro := '';
  Fr_localizar.BT_cadastro.Caption := 'Pedidos';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 7);
  Campos_combo[0] := 'Numero';
  Campos_combo[1] := 'Cliente';
  Campos_combo[2] := 'CNPJ';
  Campos_combo[3] := 'CPF';
  Campos_combo[4] := 'Cidade';
  Campos_combo[5] := 'Vendedor';
  Campos_combo[6] := 'NF';

  for i := 0 to 6 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(campos_combo[i]);
  end;
  Fr_localizar.CBcampos.ItemIndex := 0;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
end;

procedure Tfr_frete_combinado.edClienteButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Cliente';
  chamou_pesquisa := 'fr_cliente';
  chamou_form := 'fr_frete_cliente';
  chamou_cadastro := 'Fr_cliente';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cliente';
  Fr_localizar.BT_cadastro.Visible := true;

  SetLength(Campos_combo, 6);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'CNPJ';
  Campos_combo[3] := 'CPF';
  Campos_combo[4] := 'Cidade';

  for i := 0 to 5 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(campos_combo[i]);
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

procedure Tfr_frete_combinado.btBuscaDadosClienteClick(Sender: TObject);
begin
  if edcliente.Text <> '' then
  begin
    Application.CreateForm(TFr_dados_cliente, Fr_dados_cliente);
    Fr_dados_cliente.Busca_dados_cliente(edcliente.Text);
    Fr_dados_cliente.ShowModal;
  end;
end;

procedure Tfr_frete_combinado.BtConsultaClick(Sender: TObject);
var
  filtro: string;
begin
  filtro := '';

  if trim(edNFe.Text) <> '0' then
    filtro := filtro + ' AND V.NFE = ' + edNFe.Text;

  if trim(edPedido.Text) <> '0' then
    filtro := filtro + ' AND V.NUMDOC = ' + edPedido.Text;

  if trim(edCliente.Text) <> '' then
    filtro := filtro + ' AND (V.COD_CLIENTE = ' + edCliente.Text + ' OR V.COD_FORNECEDOR = ' + edCliente.Text + ') ';

  if trim(edTransportadora.Text) <> '' then
    filtro := filtro + ' AND (V.COD_TRANSPORTADORA = ' + edTransportadora.Text + ') ';

  if trim(edSaidaDe.Text) <> '/  /' then
    filtro := filtro + ' AND V.DTA_SAIDA >= ' + QuotedStr(FormatDateTime('yyyy/mm/dd', edSaidaDe.Date))
  else begin
    filtro := filtro + ' AND V.DTA_SAIDA >= ' + quotedstr(formatdatetime('dd.mm.yyyy', now - 15));
    edSaidaDe.Date := now - 15;
  end;

  if trim(edSaidaAte.Text) <> '/  /' then
    filtro := filtro + ' AND V.DTA_SAIDA <= ' + QuotedStr(FormatDateTime('yyyy/mm/dd', edSaidaAte.Date))
  else begin
    filtro := filtro + ' AND V.DTA_SAIDA <= ' + quotedstr(formatdatetime('dd.mm.yyyy', now));
    edSaidaAte.Date := now;
  end;

  if trim(edConfDe.Text) <> '/  /' then
    filtro := filtro + ' AND V.DT_FRETE_COMBINADO >= ' + QuotedStr(FormatDateTime('yyyy/mm/dd', edConfDe.Date));

  if trim(edConfAte.Text) <> '/  /' then
    filtro := filtro + ' AND V.DT_FRETE_COMBINADO <= ' + QuotedStr(FormatDateTime('yyyy/mm/dd', edConfAte.Date));

  if trim(EdCidade.Text) <> '' then
    filtro := filtro + fmfun.cmdAux('cd.cod_cidade', EdCidade.Text);

  if trim(pruf.Text) <> '' then
    filtro := filtro + ' and cd.uf=' + quotedstr(pruf.Text);

  case rgFreteComb.ItemIndex of
    1: filtro := filtro + ' AND FRETE_COMBINADO = ''S''';
    2: filtro := filtro + ' AND FRETE_COMBINADO = ''N''';
  end;

  dao.Geral1('SELECT CASE WHEN V.NFE IS NULL THEN 0 ELSE V.NFE END AS NFE, V.NUMDOC, V.DTA_SAIDA, T.COD_TRANSPORTADORA||''-''||T.NOME AS TRANSPORTADORA, V.FRETE_COMBINADO, coalesce(V.VL_FRETE, 0) as VL_FRETE, ' +
    ' CASE WHEN C.COD_CLIENTE IS NOT NULL THEN C.COD_CLIENTE||''-''||C.NOM_CLIENTE ELSE F.COD_FORNECEDOR||''-''||F.RAZAO_SOCIAL END as cliente, v.DT_FRETE_COMBINADO,  coalesce(V.PESO_NOTA, 0) as PESO_NOTA,  ' +
    ' CD.NOM_CIDADE, CD.UF, coalesce(V.TOT_LIQUIDO, 0) as TOT_LIQUIDO, coalesce(V.VOLUME_NOTA, 0) as VOLUME_NOTA, U.LOGUSU AS USUARIO_CONF ' +
    ' FROM VENDAS1 V ' +
    ' INNER JOIN TRANSPORTADORA T ON (T.COD_TRANSPORTADORA = V.COD_TRANSPORTADORA) ' +
    ' LEFT OUTER JOIN TBUSU U ON (U.CODUSU = V.USUARIO_CHECOU_FRETE_COMBINADO) ' +
    ' LEFT OUTER JOIN CLIENTE C ON (C.COD_CLIENTE = V.COD_CLIENTE) ' +
    ' LEFT OUTER JOIN FORNECEDOR F ON (F.COD_FORNECEDOR = V.COD_FORNECEDOR) ' +
    ' INNER JOIN CIDADES CD ON (coalesce(C.COD_CIDADE, F.COD_CIDADE) = CD.COD_CIDADE) ' +
    ' WHERE V.COD_TRANSPORTADORA NOT IN (4, 10, 33, 15) AND V.FATURADO in (1, 3) AND V.DTA_SAIDA >= ''10/01/2010''' + filtro + ' ORDER BY V.DTA_SAIDA DESC, V.NUMDOC DESC');

  CarregarGrid;
end;

procedure Tfr_frete_combinado.BtnConfirmarClick(Sender: TObject);
begin
  mmListaFrete.First;
  try
    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
    while not mmListaFrete.eof do
    begin
      begin
        dao.Exec_sql.SQL.Clear;
        if mmListaFreteCheck.Value then
          dao.Execsql('UPDATE VENDAS1 SET  USUARIO_CHECOU_FRETE_COMBINADO =' + cod_usuario + ', VL_FRETE = ' + StringReplace(formatfloat('#0.00', mmListaFreteValorFrete.Value), ',', '.', [rfReplaceAll]) + ', FRETE_COMBINADO = ''S'', DT_FRETE_COMBINADO = ' + QuotedStr(FormatDateTime('yyyy/mm/dd', mmListaFreteDataConf.Value)) + ' WHERE NUMDOC = ' + mmListaFreteNUM_DOC.AsString);
      end;
      mmListaFrete.next;
    end;
    dao.cn.Commit;
  except
    dao.cn.Rollback;
    exit;
  end;
  mmListaFrete.First;
  btconsultaclick(self);
end;

procedure Tfr_frete_combinado.dgListaNFeDblClick(Sender: TObject);
begin
  mmListaFrete.Edit;
  if mmListaFreteCheck.Value = true then
  begin
    mmListaFreteCheck.Value := false;
    totalselecionados := totalselecionados - 1;
  end
  else
  begin
    mmListaFreteCheck.Value := true;
    totalselecionados := totalselecionados + 1;
  end;
  mmListaFrete.Post;

  lbTotalNFS.Caption := 'Notas Fiscais Selecionadas: ' + inttostr(totalselecionados);

  if totalselecionados = 0 then
    BtnConfirmar.enabled := false
  else
    BtnConfirmar.enabled := true;
end;

procedure Tfr_frete_combinado.CheckTodosClick(Sender: TObject);
begin
  totalselecionados := 0;
  mmListaFrete.First;
  while not mmListaFrete.Eof do
  begin
    mmListaFrete.Edit;
    mmListaFreteCheck.Value := CheckTodos.Checked;
    if CheckTodos.Checked then
      totalselecionados := totalselecionados + 1
    else
      totalselecionados := 0;
    mmListaFrete.Post;
    mmListaFrete.Next;
  end;
  mmListaFrete.First;
  if totalselecionados = 0 then
    BtnConfirmar.enabled := false
  else
    BtnConfirmar.enabled := true;
end;

procedure Tfr_frete_combinado.sbAlterarClick(Sender: TObject);
begin
  if mmListaFreteCheck.Value = true then
  begin
    mmListaFrete.Edit;
    mmListaFrete.Post;
  end;
end;

procedure Tfr_frete_combinado.sbTodosClick(Sender: TObject);
begin
  mmListaFrete.First;
  while not mmListaFrete.eof do
  begin
    if mmListaFreteCheck.Value = true then
    begin
      mmListaFrete.Edit;
      mmListaFreteValorFrete.Value := dao.Q1.fieldbyname('VL_FRETE').value;
      mmListaFreteDataConf.Value := dao.Q1.fieldbyname('DT_FRETE_COMBINADO').value;
      mmListaFrete.Post;
    end;
    mmListaFrete.next;
  end;
end;

procedure Tfr_frete_combinado.edTransportadoraButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Transportadora';
  chamou_pesquisa := 'fr_transportadora';
  chamou_form := 'fr_frete_transportadora';
  chamou_cadastro := 'Fr_transportadora';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Transportadoras';
  Fr_localizar.BT_cadastro.Visible := true;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';

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
  end;;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure Tfr_frete_combinado.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;

end;

procedure Tfr_frete_combinado.btImprimirClick(Sender: TObject);
var
  conexao, path: string;
begin
  path := ExtractFilePath(Application.ExeName);

  with dm.q_frete_combinado do
  begin
    close;
    sql.Clear;
    sql.text := dao.Q1.sql.text;
    open;
  end;

  if dm.q_mala_direta1.RecordCount < 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;
  if not ckImpSVlrFrete.Checked then
  begin
    if not (fr_relatorio.LoadFromFile(path + 'Relatorios\frete_combinado.fr3')) then
    begin
      dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
      exit;
    end;
  end
  else
  begin
    if not (fr_relatorio.LoadFromFile(path + 'Relatorios\frete_combinado_sem_valor.fr3')) then
    begin
      dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
      exit;
    end;
  end;
  fr_relatorio.ShowReport;
end;

procedure Tfr_frete_combinado.fR_RELATORIOGetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'empresa' then
    value := nom_empresa;
end;

procedure Tfr_frete_combinado.Prcod_cidadeExit(Sender: TObject);
begin
  if trim(Prcod_cidade.Text) = '' then
    LbNom_cidade.Caption := '...';
  if edcidade.Text = '' then
    edcidade.Text := Prcod_cidade.Text;
end;

procedure Tfr_frete_combinado.Prcod_cidadeButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Cidade';

  chamou_pesquisa := 'fr_cidades';
  chamou_form := 'fr_frete_combinado_cidade';
  chamou_cadastro := 'fr_cidade';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cidades';

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

  edCidade.Text := edCidade.Text + ';' + Prcod_cidade.Text;
  if pos(';', edCidade.Text) = 1 then
    edCidade.Text := copy(edCidade.Text, 2, length(edCidade.Text));

end;

procedure Tfr_frete_combinado.sbCidadeClick(Sender: TObject);
begin
  edcidade.Clear;
end;

procedure Tfr_frete_combinado.PrufButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Código Fiscal';
  chamou_pesquisa := 'fr_UF';
  chamou_form := 'fr_frete_combinado_UF';
  chamou_cadastro := 'Fr_UF';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Códigos Fiscais';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 1);
  Campos_combo[0] := 'UF';
  //  Campos_combo[1] := 'Nome';

  for i := 0 to 0 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 0;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure Tfr_frete_combinado.PrufExit(Sender: TObject);
begin
  if trim(Pruf.Text) = '' then
    lbuf.Caption := '...';

  if Pruf.Text <> '' then
  begin
    dao.Geral2('select uf from uf where uf=' + QuotedStr(Pruf.Text));
    if dao.q2.RecordCount > 0 then
    begin
      lbuf.Caption := dao.Q2.fieldbyname('uf').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Pruf.Text := '';
      Pruf.SetFocus;
      Exit;
    end;

  end;
end;

procedure Tfr_frete_combinado.btCancelarClick(Sender: TObject);
begin
  mmListaFrete.Cancel;
end;

end.




