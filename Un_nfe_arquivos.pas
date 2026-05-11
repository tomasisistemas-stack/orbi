unit Un_nfe_arquivos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, RxMemDS, StdCtrls, Buttons,
  NFE_dll_TLB,
  DBCtrls, Mask, xmldom, XMLIntf, msxmldom, XMLDoc,
  IdFTPCommon,
  ACBrNFeDANFEClass, ACBrNFe, sPanel,
  sBitBtn,
  sLabel, sCheckBox, sGroupBox, pcnConversao, acDBGrid, sTooledit,
  sMaskEdit, sCustomComboEdit, sCurrEdit, sCurrencyEdit, sComboEdit, ZipMstr,
  ACBrBase, ACBrDFe, ACBrNFeDANFEFRDM, ACBrNFeDANFEFR,
    ACBrDFeReport, ACBrDFeDANFeReport,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Tfm_nfe_arquivos = class(TForm)
    mmListaNFe: TRxMemoryData;
    dsListaNFe: TDataSource;
    Panel1: tsPanel;
    Panel2: tsPanel;
    Panel3: tsPanel;
    dgListaNFe: Tdbgrid;
    BtnGerar: TsBitBtn;
    BtnSair: TsBitBtn;
    mmListaNFeNum_Doc: TIntegerField;
    mmListaNFeChave_NFE: TStringField;
    mmListaNFeCliente: TStringField;
    mmListaNFeData_Saida: TDateTimeField;
    mmListaNFeCheck: TBooleanField;
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
    edPedidoIni: TsCurrencyEdit;
    XMLNFe: TXMLDocument;
    lbTotalNFs: tsLabel;
    mmListaNFeStatusNFe: TStringField;
    mmListaNFeNFE: TIntegerField;
    gbNFe: TsGroupBox;
    edNFeIni: TsCurrencyEdit;
    mmListaNFedata_rec: TDateTimeField;
    mmListaNFeprotocolo: TLargeintField;
    gbEmpresaFat: TsGroupBox;
    rgCancelado: TsRadioGroup;
    lbEmpresaFat: tsLabel;
    edEmpresaFaturada: TsComboEdit;
    CheckTodos: tscheckbox;
    mmListaNFefaturado: TIntegerField;
    mmListaNFeempresa: TIntegerField;
    BtnPDF: TsBitBtn;
    sLabel1: tsLabel;
    sLabel2: tsLabel;
    edNFeFim: TsCurrencyEdit;
    sLabel3: tsLabel;
    sLabel4: tsLabel;
    edPedidoFim: TsCurrencyEdit;
    gbContaBoleto: TsGroupBox;
    lbContaBoleto: tsLabel;
    edContaBoleto: TsComboEdit;
    gbRemessa: TsGroupBox;
    edRemessa: TsComboEdit;
    mmListaNFeREMESSA: TIntegerField;
    gbFop: TsGroupBox;
    lbFop: tsLabel;
    edcodfop: TsComboEdit;
    NfeZip: TZipMaster;
    ACBrNFe: TACBrNFe;
    ACBrNFeDANFEFR1: TACBrNFeDANFEFR;
    mmListaNFeXML: TBlobField;
    qrGravaXmlDev: TFDQuery;
    mmListaNFeentrada: TBooleanField;
    qrGravaXml: TFDQuery;
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
    procedure BtnGerarClick(Sender: TObject);
    procedure dgListaNFeDblClick(Sender: TObject);
    procedure LimparArquivos;
    procedure edEmpresaFaturadaButtonClick(Sender: TObject);
    procedure CheckTodosClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    function GerarXMLProcNFe(gPathNFe, gConteudoProt, chaveNfe: string)
      : Boolean;
    function pConsultarNFe(isSCAN: Boolean; verSchema, siglaUF, tpAmb,
      titCertificado, chaveNfe: WideString): WideString;
    procedure BtnPDFClick(Sender: TObject);
    procedure edEmpresaFaturadaExit(Sender: TObject);
    procedure edContaBoletoButtonClick(Sender: TObject);
    procedure edContaBoletoExit(Sender: TObject);
    procedure edRemessaButtonClick(Sender: TObject);
    procedure edcodfopButtonClick(Sender: TObject);
    procedure edcodfopExit(Sender: TObject);
  private
    procedure RecuperarXml;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_nfe_arquivos: Tfm_nfe_arquivos;
  TotalSelecionados: Integer;
  cBuscarCeritifcado: _BuscarCertificado;
  Certificado: WideString;
  tipAmb: string;

implementation

uses Un_dao, Un_localizar, UnPri, Un_dados_cliente, un_nfe_transmissao,
  Un_dm, Un_vendas_industria2, unFUN, Un_splash, Un_nfe, FileCtrl;

{$R *.dfm}

procedure Tfm_nfe_arquivos.CarregarGrid;
var
  PathNFe, NomeArquivo: string;

begin
  { fm_splash.ggProgress.MaxValue := dao.q1.RecordCount;
    fm_splash.lbStatus.Caption := 'Carregando Itens...';
    fm_splash.ggProgress.progress := 0;
    fm_splash.Show; }
  LimparArquivos;
  dao.q1.First;
  mmListaNFe.Close;
  mmListaNFe.EmptyTable;
  mmListaNFe.Open;
  while not dao.q1.eof do
  begin
    mmListaNFe.Append;
    mmListaNFeREMESSA.Value := dao.q1.fieldbyname('REMESSA').asinteger;
    mmListaNFeNum_Doc.Value := dao.q1.fieldbyname('NUMDOC').Value;
    mmListaNFeNFE.Value := dao.q1.fieldbyname('nfe').Value;
    mmListaNFeData_Saida.Value := dao.q1.fieldbyname('dta_saida').Value;

    mmListaNFeChave_NFE.Value := dao.q1.fieldbyname('chave_nfe').Value;

    mmListaNFeCliente.Value := dao.q1.fieldbyname('cliente').Value;
    mmListaNFeStatusNFe.AsString := dao.q1.fieldbyname('status_nfe').AsString;
    mmListaNFeprotocolo.Value := dao.q1.fieldbyname('PROTOCOLO_NFE').Value;
    mmListaNFedata_rec.AsDateTime := dao.q1.fieldbyname('DATA_REC_NFE').AsDateTime;
    mmListaNFefaturado.Value := dao.q1.fieldbyname('faturado').Value;
    mmListaNFeempresa.Value := dao.q1.fieldbyname('EMPRESA_FATURAR').Value;

    PathNFe := ExtractFilePath(Application.ExeName) + 'nf\';
    NomeArquivo := PathNFe + mmListaNFeChave_NFE.AsString + '-procNFe.xml';

    if not dao.q1.fieldbyname('XML').isnull then
      TBlobField(dao.q1.fieldbyname('XML')).SaveToFile(NomeArquivo);


    mmListaNFeentrada.Value := dao.q1.fieldbyname('TIPO').AsString = '1';
    mmListaNFeCheck.Value := false;
    mmListaNFe.Post;

    fm_splash.ggProgress.AddProgress(1);
    fm_splash.Refresh;
    sleep(10);

    dao.q1.next;
  end;
  dao.q1.Close;
  fm_splash.Hide;
  mmListaNFe.First;
  TotalSelecionados := 0;
  BtnGerar.enabled := false;
end;

procedure Tfm_nfe_arquivos.FormShow(Sender: TObject);
var
  data_ini, data_fim: Tdate;
begin
  { data_ini := now - 15;
    data_fim := now;

    dao.Geral1('SELECT REMESSA, NFE, NUMDOC, DTA_SAIDA, CHAVE_NFE, STATUS_NFE, FATURADO, COD_CLIENTE, cliente, PROTOCOLO_NFE, DATA_REC_NFE, EMPRESA_FATURAR, STATUS_COD  FROM '+
    '(SELECT (SELECT CR.BOLETO_REMESSA_ORDEM FROM CR1 CR WHERE CR.NR_DOCUMENTO = V.NUMDOC limit 1) AS REMESSA, '+
    'COALESCE(V.COD_CLIENTE, V.COD_FORNECEDOR) AS COD_CLIENTE, V.CONTA_BOLETO, V.NFE, V.NUMDOC, V.EMPRESA_FATURAR, V.DTA_SAIDA, V.CHAVE_NFE, '+
    'V.STATUS_NFE||''-''||V.MOTIVO_NFE AS STATUS_NFE, V.FATURADO,  CASE WHEN C.COD_CLIENTE IS NOT NULL THEN C.COD_CLIENTE||''-''||C.NOM_CLIENTE ELSE F.COD_FORNECEDOR||''-''||F.RAZAO_SOCIAL END as cliente, '+
    'V.PROTOCOLO_NFE, V.DATA_REC_NFE, v.STATUS_NFE AS STATUS_COD FROM VENDAS1 V LEFT OUTER JOIN CLIENTE C ON (C.COD_CLIENTE = V.COD_CLIENTE)  LEFT OUTER JOIN FORNECEDOR F ON (F.COD_FORNECEDOR = V.COD_FORNECEDOR) '+
    'WHERE V.CHAVE_NFE IS NOT NULL AND V.PROTOCOLO_NFE IS NOT NULL   AND V.FATURADO in (1, 2, 3, 5) '+
    'union '+
    'SELECT '+
    '(SELECT CR.BOLETO_REMESSA_ORDEM FROM CR1 CR WHERE CR.NR_DOCUMENTO = V.NUMDOC limit 1) AS REMESSA, '+
    'COALESCE(V.COD_CLIENTE, V.COD_FORNECEDOR) AS COD_CLIENTE, V.CONTA_BOLETO, V.NFE_DEV AS NFE, V.NUMDOC, V.EMPRESA_FATURAR, CAST(V.DATA_REC_NFE_DEV AS DATE) AS DTA_SAIDA, V.CHAVE_NFE_DEV AS CHAVE_NFE, '+
    'V.STATUS_NFE_DEV||''-''||V.MOTIVO_NFE_DEV AS STATUS_NFE, ''4'' as FATURADO, '+
    'CASE WHEN C.COD_CLIENTE IS NOT NULL THEN C.COD_CLIENTE||''-''||C.NOM_CLIENTE ELSE F.COD_FORNECEDOR||''-''||F.RAZAO_SOCIAL END as cliente, V.PROTOCOLO_NFE_DEV AS PROTOCOLO_NFE, V.DATA_REC_NFE_DEV AS DATA_REC_NFE, v.STATUS_NFE_DEV AS STATUS_COD '+
    'FROM VENDAS1 V LEFT OUTER JOIN CLIENTE C ON (C.COD_CLIENTE = V.COD_CLIENTE)  LEFT OUTER JOIN FORNECEDOR F ON (F.COD_FORNECEDOR = V.COD_FORNECEDOR)  WHERE V.CHAVE_NFE_DEV IS NOT NULL AND V.PROTOCOLO_NFE_DEV IS NOT NULL  AND V.FATURADO in (1, 3, 5)) '+
    'WHERE CHAVE_NFE IS NOT NULL AND PROTOCOLO_NFE IS NOT NULL AND FATURADO = 1 AND DTA_SAIDA between ' +
    quotedstr(formatdatetime('dd.mm.yyyy', data_ini)) + ' and ' +
    quotedstr(formatdatetime('dd.mm.yyyy', data_fim)) +
    ' ORDER BY NFE DESC, DTA_SAIDA DESC, NUMDOC DESC');

    CarregarGrid; }
end;

procedure Tfm_nfe_arquivos.dgListaNFeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
  IsChecked: array [Boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or
    DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = DBCheckBox1.DataField) then
    begin
      DBCheckBox1.Left := Rect.Left + dgListaNFe.Left + 2;
      DBCheckBox1.Top := Rect.Top + dgListaNFe.Top + 2;
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

      DrawState := IsChecked[Column.Field.AsBoolean];

      dgListaNFe.Canvas.FillRect(Rect);
      DrawFrameControl(dgListaNFe.Canvas.Handle, DrawRect, DFC_BUTTON,
        DrawState);
    end;
  end;
end;

procedure Tfm_nfe_arquivos.dgListaNFeColExit(Sender: TObject);
begin
  if dgListaNFe.SelectedField.FieldName = DBCheckBox1.DataField then
    DBCheckBox1.Visible := false
end;

procedure Tfm_nfe_arquivos.dgListaNFeKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(9)) then
    Exit;

  if (dgListaNFe.SelectedField.FieldName = DBCheckBox1.DataField) then
  begin
    DBCheckBox1.SetFocus;
    SendMessage(DBCheckBox1.Handle, WM_Char, word(Key), 0);
  end;

end;

procedure Tfm_nfe_arquivos.edPedidoButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
  It, J, Coluna: byte;
  totalcusto, lucromedio, tot_lucro: real;
  contador: Integer;
  lucro: real;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Vendas';
  chamou_pesquisa := 'fr_pedido';
  chamou_form := 'fr_nfe_envio_lote';
  chamou_cadastro := '';
  Fr_localizar.BT_cadastro.Caption := 'Pedidos';
  Fr_localizar.BT_cadastro.Visible := false;

  // preenchendo o combo box com os campos desejados para pesquisar.
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
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(Campos_combo[i]);
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

procedure Tfm_nfe_arquivos.edClienteButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Cliente';
  chamou_pesquisa := 'fr_cliente';
  chamou_form := 'fr_nfe_danfe_arquivo_cliente';
  chamou_cadastro := 'Fr_cliente';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cliente';
  Fr_localizar.BT_cadastro.Visible := True;

  SetLength(Campos_combo, 6);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Razão Social';
  Campos_combo[2] := 'Nome Fantasia';
  Campos_combo[3] := 'CNPJ';
  Campos_combo[4] := 'CPF';
  Campos_combo[5] := 'Cidade';

  for i := 0 to 5 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(Campos_combo[i]);
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

procedure Tfm_nfe_arquivos.edcodfopButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Forma de Pagamento';
  chamou_pesquisa := 'fr_fop';
  chamou_form := 'fr_nfe_arquivos_fop';
  chamou_cadastro := 'fr_fop';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Fop';
  Fr_localizar.BT_cadastro.Visible := True;

  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';

  for i := 0 to 1 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(Campos_combo[i]);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  { Fr_localizar.CBcampos.ItemIndex :=  Fr_localizar.CBcampos.Items.IndexOf(campo_pesquisado);
    Fr_localizar.EDlocalizar.Text := '';
    Fr_localizar.zzbusca_qualquer.Checked := busca_qualquer_posicao_pesquisada;
    Fr_localizar.loc_fop(Fr_localizar.EDlocalizar.Text); }

  Fr_localizar.loc_fop('');
  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure Tfm_nfe_arquivos.edcodfopExit(Sender: TObject);
begin
  if trim(edcodfop.Text) = '' then
    lbFop.Caption := '...';
  if edcodfop.Text <> '' then
  begin
    if (not FMFUN.verificaNumerico(edcodfop.Text)) and
      (length(edcodfop.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      edcodfop.SetFocus;
      Exit;
    end;

    dao.Geral5
      ('select nom_fop, desconto, avista, prazo_padrao, NAO_GERAR_CR from fop where ATIVO = ''S'' AND cod_fop='
      + QuotedStr(edcodfop.Text));
    if dao.q5.RecordCount > 0 then
      lbFop.Caption := dao.q5.fieldbyname('nom_fop').AsString;
  end;
end;

procedure Tfm_nfe_arquivos.btBuscaDadosClienteClick(Sender: TObject);
begin
  if edCliente.Text <> '' then
  begin
    Application.CreateForm(TFr_dados_cliente, Fr_dados_cliente);
    Fr_dados_cliente.Busca_dados_cliente(edCliente.Text);
    Fr_dados_cliente.ShowModal;
  end;
end;

procedure Tfm_nfe_arquivos.BtConsultaClick(Sender: TObject);
var
  filtro: string;
begin
  filtro := '';

  if rgCancelado.ItemIndex = 0 then
    filtro := filtro + ' AND FATURADO in (1, 3) '
  else if rgCancelado.ItemIndex = 1 then
    filtro := filtro + ' AND (FATURADO = 2 or STATUS_COD = 135) '
  else if rgCancelado.ItemIndex = 2 then
    filtro := filtro + ' AND (FATURADO = 4 AND STATUS_COD = 100) '
  else
    filtro := filtro + ' AND FATURADO = 5 ';

  if trim(edNFeIni.Text) <> '0' then
    filtro := filtro + ' AND NFE >= ' + edNFeIni.Text;

  if trim(edNFeFim.Text) <> '0' then
    filtro := filtro + ' AND NFE <= ' + edNFeFim.Text;

  if trim(edPedidoIni.Text) <> '0' then
    filtro := filtro + ' AND NUMDOC >= ' + edPedidoIni.Text;

  if trim(edPedidoFim.Text) <> '0' then
    filtro := filtro + ' AND NUMDOC <= ' + edPedidoFim.Text;

  if trim(edEmpresaFaturada.Text) <> '' then
    filtro := filtro + ' AND EMPRESA_FATURAR = ' + edEmpresaFaturada.Text;

  if trim(edCliente.Text) <> '' then
    filtro := filtro + ' AND (COD_CLIENTE = ' + edCliente.Text + ') ';

  if trim(edContaBoleto.Text) <> '' then
    filtro := filtro + ' AND (CONTA_BOLETO = ' + edContaBoleto.Text + ') ';

  if trim(edRemessa.Text) <> '' then
    filtro := filtro + ' AND (REMESSA = ' + edRemessa.Text + ') ';

  if trim(edSaidaDe.Text) <> '/  /' then
    filtro := filtro + ' AND DTA_SAIDA >= ' +
      QuotedStr(FormatDateTime('yyyy/mm/dd', edSaidaDe.Date));

  if trim(edSaidaAte.Text) <> '/  /' then
    filtro := filtro + ' AND DTA_SAIDA <= ' +
      QuotedStr(FormatDateTime('yyyy/mm/dd', edSaidaAte.Date));

  dao.Geral1
    ('SELECT TIPO, REMESSA, NFE, NUMDOC, DTA_SAIDA, CHAVE_NFE, STATUS_NFE, FATURADO, COD_CLIENTE, cliente, PROTOCOLO_NFE, DATA_REC_NFE, EMPRESA_FATURAR, STATUS_COD, XML  FROM '
    + '(SELECT 0 as tipo, (SELECT CR.BOLETO_REMESSA_ORDEM FROM CR1 CR WHERE CR.NR_DOCUMENTO = V.NUMDOC limit 1) AS REMESSA, '
    + 'COALESCE(V.COD_CLIENTE, V.COD_FORNECEDOR) AS COD_CLIENTE, V.CONTA_BOLETO, V.NFE, V.NUMDOC, V.EMPRESA_FATURAR, V.DTA_SAIDA, V.CHAVE_NFE, V.XML, '
    + 'V.STATUS_NFE||''-''||V.MOTIVO_NFE AS STATUS_NFE, V.FATURADO,  CASE WHEN C.COD_CLIENTE IS NOT NULL THEN C.COD_CLIENTE||''-''||C.NOM_CLIENTE ELSE F.COD_FORNECEDOR||''-''||F.RAZAO_SOCIAL END as cliente, '
    + 'V.PROTOCOLO_NFE, V.DATA_REC_NFE, v.STATUS_NFE AS STATUS_COD FROM VENDAS1 V LEFT OUTER JOIN CLIENTE C ON (C.COD_CLIENTE = V.COD_CLIENTE)  LEFT OUTER JOIN FORNECEDOR F ON (F.COD_FORNECEDOR = V.COD_FORNECEDOR) '
    + 'WHERE V.CHAVE_NFE IS NOT NULL AND V.PROTOCOLO_NFE IS NOT NULL   AND V.FATURADO in (1, 2, 3, 5) '
    + 'union ' + 'SELECT ' +
    '1 as tipo, (SELECT CR.BOLETO_REMESSA_ORDEM FROM CR1 CR WHERE CR.NR_DOCUMENTO = V.NUMDOC limit 1) AS REMESSA, '
    + 'COALESCE(V.COD_CLIENTE, V.COD_FORNECEDOR) AS COD_CLIENTE, V.CONTA_BOLETO, V.NFE_DEV AS NFE, V.NUMDOC, V.EMPRESA_FATURAR, CAST(V.DATA_REC_NFE_DEV AS DATE) AS DTA_SAIDA, V.CHAVE_NFE_DEV AS CHAVE_NFE, V.XML_DEV AS XML, '
    + 'V.STATUS_NFE_DEV||''-''||V.MOTIVO_NFE_DEV AS STATUS_NFE, ''4'' as FATURADO, '
    + 'CASE WHEN C.COD_CLIENTE IS NOT NULL THEN C.COD_CLIENTE||''-''||C.NOM_CLIENTE ELSE F.COD_FORNECEDOR||''-''||F.RAZAO_SOCIAL END as cliente, V.PROTOCOLO_NFE_DEV AS PROTOCOLO_NFE, V.DATA_REC_NFE_DEV AS DATA_REC_NFE, v.STATUS_NFE_DEV AS STATUS_COD '
    + 'FROM VENDAS1 V LEFT OUTER JOIN CLIENTE C ON (C.COD_CLIENTE = V.COD_CLIENTE)  LEFT OUTER JOIN FORNECEDOR F ON (F.COD_FORNECEDOR = V.COD_FORNECEDOR)  WHERE V.CHAVE_NFE_DEV IS NOT NULL AND V.PROTOCOLO_NFE_DEV IS NOT NULL  AND V.FATURADO in (1, 3, 5)) q1 '
    + 'WHERE CHAVE_NFE IS NOT NULL AND PROTOCOLO_NFE IS NOT NULL ' + filtro +
    'ORDER BY NFE DESC, DTA_SAIDA DESC, NUMDOC DESC');

  CarregarGrid;
end;

function Tfm_nfe_arquivos.GerarXMLProcNFe(gPathNFe, gConteudoProt,
  chaveNfe: string): Boolean;
var
  vXMLProt, vXMLNFe, vXMLCompartilha, vXMLProtCons, vXMLProc: TXMLDocument;
  NodePaiNFe, NodeProt, NodeInf: IXMLNode;
  NodeNivelA, NodeNivelB: IXMLNode;
  CaminhoXML, PathNFe, NomeArquivo, NomeArquivo2: string;
  assXML, assXML2: TextFile;
  Conteudo: string;
  mTexto: WideString;

begin
  try
    CaminhoXML := gPathNFe;
    NomeArquivo := ExtractFilePath(Application.ExeName) + 'nf\Temp-prot.xml';
    NomeArquivo2 := ExtractFilePath(Application.ExeName) + 'nf\Temp-cons.xml';
    PathNFe := ExtractFilePath(Application.ExeName) + 'nf\';

    // Gerando o arquivo de Processamento atraves do retorno da consulta ao retorno da recepção...
    AssignFile(assXML, NomeArquivo);
    Rewrite(assXML);
    Write(assXML, gConteudoProt);
    CloseFile(assXML);

    vXMLProt := TXMLDocument.Create(self);
    vXMLProt.Active := True;

    vXMLNFe := TXMLDocument.Create(self);
    vXMLNFe.Active := True;

    vXMLProtCons := TXMLDocument.Create(self);
    vXMLProtCons.Active := True;

    vXMLProc := TXMLDocument.Create(self);
    vXMLProc.Active := True;

    vXMLCompartilha := TXMLDocument.Create(self);
    vXMLCompartilha.Active := True;

    try
      // Abre XML NFe assinada;
      vXMLNFe.LoadFromFile(CaminhoXML);
      // Abre XML Protocolo autorização;
      vXMLProt.LoadFromFile(NomeArquivo);
      // Le o nó "NFe" da NFe assinada
      NodePaiNFe := vXMLNFe.DocumentElement;
      // Le o nó "protNFe" do protocolo de autorização
      NodeProt := vXMLProt.DocumentElement.ChildNodes.FindNode('protNFe');

      // Cria documento de envio para o Destinatário
      with vXMLCompartilha do
      begin
        // ativa, versiona e codifica UTF-8 para o XML
        Active := True;
        Version := '1.0';
        Encoding := 'UTF-8';

        // adiciona atributos padrão arquivo
        AddChild('nfeProc', 'http://www.portalfiscal.inf.br/nfe');

        // Prepara o nó principal e adiciona a versão como atributo
        NodeNivelA := DocumentElement;
        NodeNivelA.Attributes['versao'] := '2.00';
        // <<< Se ainda tiver com a versão 1.10 colocar a versão que esta utilizando...

        // Adiciona o nó "NFe" da Nota Fiscal eletrônica assinada
        NodeNivelA.ChildNodes.Add(NodePaiNFe);

        NodeNivelA.ChildNodes.Add(NodeProt);
      end;
      // salva arquivo de distribuição da NF-e no disco.
      DeleteFile(NomeArquivo);

      NomeArquivo := PathNFe + chaveNfe + '-procNFe.xml';

      // StringReplace(vXMLCompartilha.XML.Text, 'xmlns=" "', '', [rfReplaceAll]);
      vXMLCompartilha.SaveToFile(NomeArquivo);

      if mmListaNFeentrada.AsBoolean = false then
      begin

        qrGravaXml.Close;
        qrGravaXml.ParamByName('arquivo').AsStream := TFileStream.Create(NomeArquivo, fmOpenRead);
        qrGravaXml.ParamByName('numdoc').AsString := mmListaNFeNum_Doc.AsString;
        qrGravaXml.Open;
      end
      else
      begin
        qrGravaXmlDev.Close;
        qrGravaXmlDev.ParamByName('arquivo').AsStream := TFileStream.Create(NomeArquivo, fmOpenRead);
        qrGravaXmlDev.ParamByName('numdoc').AsString :=
          mmListaNFeNum_Doc.AsString;

        qrGravaXmlDev.Open;

      end;

      dm.FTPNFe.Connect;

      if dm.FTPNFe.Connected then
      begin
        // transfere um arquivo texto
        dm.FTPNFe.TransferType := ftASCII;

        dm.FTPNFe.Put(NomeArquivo, chaveNfe + '-procNFe.xml');

        // desconecta
        dm.FTPNFe.Quit;
      end;

    finally
      FreeAndNil(vXMLNFe);
      FreeAndNil(vXMLProt);
      FreeAndNil(vXMLCompartilha);
      FreeAndNil(vXMLProtCons);
    end;

    Result := True;
  except
    Result := false;
  end;
end;

procedure Tfm_nfe_arquivos.BtnGerarClick(Sender: TObject);
var
  pathSaida: string;
  NomeArquivo: string;
  SelDir: string;
  SrcDir: string;
  F: TSearchRec;
  Ret: Integer;

  procedure ImprimirDanfe(chave, protocolo: string; data: TDateTime);
  var
    arquivoNFe, arquivoPDF: string;
    consultaNFe: TStringList;

    procedure RecXml;
    var
      RecNFe: Tnferecxml;
      cBuscarCeritifcado: _BuscarCertificado;
    begin
      Application.CreateForm(TFr_nfe_transmissao, Fr_nfe_transmissao);
      RecNFe := Tnferecxml.Create(mmListaNFeNFE.asinteger, mmListaNFeNum_Doc.asinteger, mmListaNFeempresa.asinteger,  mmListaNFeChave_NFE.AsString);
      Fr_nfe_transmissao.sCheckBox1.Visible := True;
      Fr_nfe_transmissao.sCheckBox1.Caption := 'Buscar Certificado.';

      Fr_nfe_transmissao.sCheckBox2.Visible := True;
      Fr_nfe_transmissao.sCheckBox2.Caption := 'Gerar Arquivo NFe.';

      Fr_nfe_transmissao.sCheckBox3.Visible := True;
      Fr_nfe_transmissao.sCheckBox3.Caption := 'Gravar Dados de Protocolo.';

      Fr_nfe_transmissao.Gauge1.MaxValue := 3;
      Fr_nfe_transmissao.Height := Fr_nfe_transmissao.Height + (16 * 3);
      Fr_nfe_transmissao.Gauge1.Progress := 0;

      try
        Fr_nfe_transmissao.ShowModal;
      finally

        if mmListaNFeentrada.AsBoolean = false then
        begin
          NomeArquivo := pathSaida + mmListaNFeChave_NFE.AsString + '-procNFe.xml';

          qrGravaXml.Close;
          qrGravaXml.ParamByName('arquivo').AsStream := TFileStream.Create(NomeArquivo, fmOpenRead);
          qrGravaXml.ParamByName('numdoc').AsString := mmListaNFeNum_Doc.AsString;
          qrGravaXml.Open;
        end
        else
        begin
          qrGravaXmlDev.Close;
          qrGravaXmlDev.ParamByName('arquivo').AsStream := TFileStream.Create(NomeArquivo, fmOpenRead);
          qrGravaXmlDev.ParamByName('numdoc').AsString := mmListaNFeNum_Doc.AsString;
          qrGravaXmlDev.Open;
        end;

        mmListaNFe.next;

        ImprimirDanfe(mmListaNFeChave_NFE.AsString, mmListaNFeprotocolo.AsString, mmListaNFedata_rec.Value);
      end;

    end;

  begin
  //RecXml;
    arquivoNFe := chave + '-procNFe.xml';

{    if not FileExists(pathSaida + arquivoNFe) then
      RecXml;
 }


   { if not FileExists(pathSaida + arquivoNFe) then
    begin
      try
        dm.FTPNFe.Connect;
        if dm.FTPNFe.Connected then
        begin
          // transfere um arquivo texto
          dm.FTPNFe.TransferType := ftASCII;

          dm.FTPNFe.get(arquivoNFe, pathSaida + arquivoNFe);
          dm.FTPNFe.Quit;
        end;
      except
        dm.FTPNFe.Quit;
        dm.FTPNFe.connected := false;
        // showmessage('Erro ao carregar Arquivo no FTP...');
        DeleteFile(pathSaida + arquivoNFe);
        RecXml;
      end;
    end; }
  end;

begin
  SelDir := ExtractFilePath(Application.ExeName) + 'nf\';
  if not SelectDirectory('Selecione a pasta para salvar o ZIP', '', SelDir) then
  begin
    fm_splash.Hide;
    Exit;
  end;

  pathSaida := IncludeTrailingPathDelimiter(SelDir);
  if not DirectoryExists(pathSaida) then
    ForceDirectories(pathSaida);

  fm_splash.ggProgress.MaxValue := mmListaNFe.RecordCount;
  fm_splash.lbStatus.Caption := 'Gerando XMLs...';
  fm_splash.ggProgress.Progress := 0;
  fm_splash.Show;
  mmListaNFe.First;
  while not mmListaNFe.eof do
  begin
    if mmListaNFeCheck.Value then
    begin
      try
        ImprimirDanfe(mmListaNFeChave_NFE.AsString,
          mmListaNFeprotocolo.AsString, mmListaNFedata_rec.Value);
      except
        Exit;
      end;
    end;
    fm_splash.ggProgress.AddProgress(1);
    fm_splash.Refresh;
    sleep(10);
    mmListaNFe.next;
  end;
  mmListaNFe.First;

  SrcDir := ExtractFilePath(Application.ExeName) + 'nf\';
  if not SameText(IncludeTrailingPathDelimiter(SrcDir), pathSaida) then
  begin
    Ret := FindFirst(SrcDir + '*.xml', faAnyFile, F);
    try
      while Ret = 0 do
      begin
        CopyFile(PChar(SrcDir + F.Name), PChar(pathSaida + F.Name), False);
        Ret := FindNext(F);
      end;
    finally
      if Ret = 0 then
        FindClose(F);
    end;
  end;

  Ret := FindFirst(pathSaida + '*.xml', faAnyFile, F);
  try
    if Ret <> 0 then
    begin
      fm_splash.Hide;
      MessageDlg('Nenhum XML gerado para compactar.', mtInformation, [mbOk], 0);
      Exit;
    end;
  finally
    if Ret = 0 then
      FindClose(F);
  end;

  NfeZip.Clear;
  NfeZip.ZipFilename := pathSaida + stringreplace(stringreplace(lbEmpresaFat.Caption, ' ',
    '_', [rfReplaceAll]),'/', '_', [rfReplaceAll]) + '_' + rgCancelado.Items.Strings
    [rgCancelado.ItemIndex] + '_' + FormatDateTime('ddmmyyyy', edSaidaDe.Date) +
    '_' + FormatDateTime('ddmmyyyy', edSaidaAte.Date) + '.zip';
  NfeZip.TempDir := ExtractFilePath(paramstr(0));
  NfeZip.ExtrBaseDir := ExtractFilePath(paramstr(0));
  NfeZip.FSpecArgs.Add(pathSaida + '*.xml');
  NfeZip.Add;

  Ret := FindFirst(pathSaida + '*.xml', faAnyFile, F);
  try
    while Ret = 0 do
    begin
      DeleteFile(pathSaida + F.Name);
      Ret := FindNext(F);
    end;
  finally
    FindClose(F);
  end;

  fm_splash.Hide;
end;

function Tfm_nfe_arquivos.pConsultarNFe(isSCAN: Boolean;
  verSchema, siglaUF, tpAmb, titCertificado, chaveNfe: WideString): WideString;
var
  cTransmissaoXML: _TransmissaoXML;
  MsgRetWS, strDados: WideString;
  strCabecXML, strVersaoDados: string;
begin

  if siglaUF <> '' then
  begin
    if tpAmb <> '' then
    begin
      if verSchema = '1' then
        strVersaoDados := '1.07'
      else
        strVersaoDados := '2.00';
      strCabecXML :=
        '<?xml version="1.0" encoding="UTF-8" ?><cabecMsg xmlns="http://www.portalfiscal.inf.br/nfe" versao="1.02"><versaoDados>'
        + strVersaoDados + '</versaoDados></cabecMsg>';
      strDados :=
        '<?xml version="1.0" encoding="UTF-8"?><consSitNFe xmlns="http://www.portalfiscal.inf.br/nfe" versao="'
        + strVersaoDados + '"><tpAmb>' + tpAmb +
        '</tpAmb><xServ>CONSULTAR</xServ><chNFe>' + chaveNfe +
        '</chNFe></consSitNFe>';

      try
        if isSCAN then
          siglaUF := 'SCAN';

        cTransmissaoXML := CoTransmissaoXML.Create;
        if cTransmissaoXML.NfeConsulta(verSchema, siglaUF, StrToInt(tpAmb),
          titCertificado, strCabecXML, strDados, MsgRetWS) then
        begin
          Result := MsgRetWS;
        end
        else
        begin
          Result := 'Erros: ' + MsgRetWS;
        end;
      finally
        cTransmissaoXML := nil;
      end;
    end
    else
      MessageDlg('Tipo de Ambiente Inexistente!', mtInformation, [mbOk], 0);
  end
  else
    MessageDlg('Sigla da UF Inexistente!', mtInformation, [mbOk], 0);

end;

procedure Tfm_nfe_arquivos.LimparArquivos;
var
  F: TSearchRec;
  Ret: Integer;
  TempNome, pathSaida: string;
begin
  pathSaida := ExtractFilePath(Application.ExeName) + 'nf\';
  Ret := FindFirst(pathSaida + '*.xml', faAnyFile, F);
  try
    while Ret = 0 do
    begin
      DeleteFile(pathSaida + F.Name);
      Ret := FindNext(F);
    end;
  finally
    begin
      FindClose(F);
    end;
  end;
end;

procedure Tfm_nfe_arquivos.dgListaNFeDblClick(Sender: TObject);
begin
  mmListaNFe.Edit;
  if mmListaNFeCheck.Value = True then
  begin
    mmListaNFeCheck.Value := false;
    TotalSelecionados := TotalSelecionados - 1;
  end
  else
  begin
    mmListaNFeCheck.Value := True;
    TotalSelecionados := TotalSelecionados + 1;
  end;
  mmListaNFe.Post;

  lbTotalNFs.Caption := 'Notas Fiscais Selecionadas: ' +
    inttostr(TotalSelecionados);

  if TotalSelecionados = 0 then
  begin
    BtnGerar.enabled := false;
    BtnPDF.enabled := false;
  end
  else
  begin
    BtnGerar.enabled := True;
    BtnPDF.enabled := True;
  end;
end;

procedure Tfm_nfe_arquivos.edEmpresaFaturadaButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Empresa';
  chamou_pesquisa := 'fr_empresa';
  chamou_form := 'fr_nfe_danfe_arquivo_empresa';
  chamou_cadastro := 'Fr_empresa';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Empresa';
  Fr_localizar.BT_cadastro.Visible := false;

  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';

  for i := 0 to 1 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(Campos_combo[i]);
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

procedure Tfm_nfe_arquivos.CheckTodosClick(Sender: TObject);
begin
  TotalSelecionados := 0;
  mmListaNFe.DisableControls;
  mmListaNFe.First;
  while not mmListaNFe.eof do
  begin
    mmListaNFe.Edit;
    mmListaNFeCheck.Value := CheckTodos.Checked;
    if CheckTodos.Checked then
      TotalSelecionados := TotalSelecionados + 1
    else
      TotalSelecionados := 0;
    mmListaNFe.Post;
    mmListaNFe.next;
  end;
  mmListaNFe.EnableControls;
  mmListaNFe.First;

  if TotalSelecionados = 0 then
  begin
    BtnGerar.enabled := false;
    BtnPDF.enabled := false;
  end
  else
  begin
    BtnGerar.enabled := True;
    BtnPDF.enabled := True;
  end;

  lbTotalNFs.Caption := 'Notas Fiscais Selecionadas: ' +
    inttostr(TotalSelecionados);
end;

procedure Tfm_nfe_arquivos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure Tfm_nfe_arquivos.BtnPDFClick(Sender: TObject);
var
  arquivoNFe, pathSaida, arquivoPDF: string;
  procedure PDFDanfe(chave: string);
  begin
    arquivoNFe := chave + '-procNFe.xml';
    {
    if not FileExists(pathSaida + arquivoNFe) then
    begin
      try
        dm.FTPNFe.Connect;
        if dm.FTPNFe.Connected then
        begin
          // transfere um arquivo texto
          dm.FTPNFe.TransferType := ftASCII;
          arquivoNFe := chave + '-procNFe.xml';

          dm.FTPNFe.get(arquivoNFe, pathSaida + arquivoNFe);
          dm.FTPNFe.Quit;
        end;
      except
        dm.FTPNFe.Quit;
        dm.FTPNFe.connected := false;
        // showmessage('Erro ao carregar Arquivo no FTP...');
        DeleteFile(pathSaida + arquivoNFe);
      end;
    end;
    }
    arquivoPDF := chave + '.pdf';


    ACBrNFe.NotasFiscais.Clear;
    ACBrNFeDANFEFR1.fastfile := ExtractFilePath(Application.ExeName) +
      'Relatorios\Danfe.fr3';
    ACBrNFe.NotasFiscais.LoadFromFile(pathSaida + arquivoNFe);
    ACBrNFe.DANFE.PathPDF := pathSaida;

    ACBrNFe.DANFE.Logo := ExtractFilePath(Application.ExeName) + 'logo.bmp';
    ACBrNFe.DANFE.ImprimirDANFEPDF();
  end;

begin
  pathSaida := ExtractFilePath(Application.ExeName) + 'nf\';

  fm_splash.ggProgress.MaxValue := mmListaNFe.RecordCount;
  fm_splash.lbStatus.Caption := 'Gerando XMLs...';
  fm_splash.ggProgress.Progress := 0;
  fm_splash.Show;

  mmListaNFe.First;
  while not mmListaNFe.eof do
  begin
    if mmListaNFeCheck.Value then
    begin
      try
        PDFDanfe(mmListaNFeChave_NFE.AsString);
      except
        Exit;
      end;
    end;
    fm_splash.ggProgress.AddProgress(1);
    fm_splash.Refresh;
    sleep(10);
    mmListaNFe.next;
  end;
  mmListaNFe.First;
  fm_splash.Hide;

end;


procedure Tfm_nfe_arquivos.RecuperarXml;
begin
 // ACBrNFe.DistribuicaoDFePorChaveNFe(StrToInt(cUFAutor), CNPJ, chaveNFe);
end;

procedure Tfm_nfe_arquivos.edEmpresaFaturadaExit(Sender: TObject);
begin
  if (edEmpresaFaturada.Text <> '') then
  begin
    dao.Geral2('select e.nom_empresa From empresa e where e.cod_empresa=' +
      QuotedStr(edEmpresaFaturada.Text));
    if dao.q2.RecordCount > 0 then
    begin
      lbEmpresaFat.Caption := dao.q2.fieldbyname('nom_empresa').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      lbEmpresaFat.Caption := '';
      edEmpresaFaturada.Clear;
      Exit;
    end;
  end;

end;

procedure Tfm_nfe_arquivos.edContaBoletoButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  // guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Conta corrente';
  chamou_pesquisa := 'fr_conta_corrente';
  chamou_form := 'fr_cc_nfe_arquivos';
  chamou_cadastro := 'Fr_conta_corrente';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Conta corrente';
  Fr_localizar.BT_cadastro.Visible := false;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 5);
  Campos_combo[0] := 'Código';
  Campos_combo[1] := 'Banco';
  Campos_combo[2] := 'Numero da Agencia';
  Campos_combo[3] := 'Numero da Conta';
  Campos_combo[4] := 'Data da abertura da conta';

  for i := 0 to 4 do
  begin
    valor_combo := Campos_combo[i];
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

end;

procedure Tfm_nfe_arquivos.edContaBoletoExit(Sender: TObject);
begin
  if trim(edContaBoleto.Text) = '' then
    lbContaBoleto.Caption := '...'
  else
  begin
    dao.Geral2
      ('select c.id, C.DIAS_PROTESTO, b.NOM_BANCO, b.NR_BANCO, b.LAYOUT_REMESSA, c.nr_conta, c.codigo_cedente, c.nr_agencia, c.dta_abertura_conta, c.convenio, C.NOME_CORRENTISTA, C.CARTEIRA, e.CNPJ '
      + 'from conta_corrente c inner join banco b on b.ID = c.ID_BANCO inner join empresa e on (e.COD_EMPRESA = c.ID_EMPRESA) '
      + 'where c.id=' + QuotedStr(edContaBoleto.Text));
    if dao.q2.RecordCount > 0 then
    begin
      lbContaBoleto.Caption := dao.q2.fieldbyname('nom_banco').AsString + ' - '
        + dao.q2.fieldbyname('nr_agencia').AsString + '/' +
        dao.q2.fieldbyname('nr_conta').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      edContaBoleto.Text := '';
      edContaBoleto.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfm_nfe_arquivos.edRemessaButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  // guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Remessa';
  chamou_pesquisa := 'frm_remessa_boleto';
  chamou_form := 'fr_remessa_boleto_nfe_arquivos';
  chamou_cadastro := 'frm_remessa_boleto';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Conta corrente';
  Fr_localizar.BT_cadastro.Visible := false;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Nº Remessa';
  Campos_combo[1] := 'Banco';
  Campos_combo[2] := 'Data';

  for i := 0 to 2 do
  begin
    valor_combo := Campos_combo[i];
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

end;

end.














