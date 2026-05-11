unit Un_nfe_envio_lote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, RxMemDS, StdCtrls, Buttons, NFE_dll_TLB,
  DBCtrls, Mask, xmldom, XMLIntf, msxmldom, XMLDoc, IdFTPCommon,
  ACBrNFeDANFEClass, ACBrNFe,
  sSpeedButton, sPanel, sBitBtn, sLabel, sCheckBox, sGroupBox, pcnConversao,
  acDBGrid, sTooledit, sMaskEdit, sCustomComboEdit, sCurrEdit,
  sCurrencyEdit, sComboEdit, ACBrBase, ACBrMDFe, ACBrNFeDANFEFRDM, ACBrNFeDANFEFR,
  ACBrDFe, ACBrDFeReport, ACBrDFeDANFeReport;

type
  TNFeLote = class(TThread)
  private
    cBuscarCertificado: _BuscarCertificado;
    cont: integer;
    tipAmb: integer;
    erro, finalizado: boolean;
    msgerros, recibo, MsgRetWS: WideString;
    pathSaida, path, PathLote, nomeCertificado: string;

    procedure Execute; override;
    //referente a NF-e
    procedure GerarLote(NumerodoLote: string);
    procedure Mostra;
    procedure EnviarLote(arquivo: string);
    procedure GravarReciboNfe;
    procedure LimparArquivos;
  public
    constructor Create(BuscarCertificado: _BuscarCertificado);
  end;
  Tfm_nfe_envio_lote = class(TForm)
    mmListaNFe: TRxMemoryData;
    dsListaNFe: TDataSource;
    Panel1: tsPanel;
    Panel2: tsPanel;
    Panel3: tsPanel;
    dgListaNFe: Tdbgrid;
    BtnEnviarLoteNFE: TsBitBtn;
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
    btBuscaDadosCliente: TsSpeedButton;
    edCliente: TsComboEdit;
    Lbnom_cliente: tsLabel;
    BtConsulta: TsBitBtn;
    edPedido: TsCurrencyEdit;
    XMLNFe: TXMLDocument;
    lbTotalNFs: tsLabel;
    mmListaNFeStatusNFe: TStringField;
    mmListaNFeNFE: TIntegerField;
    gbNFe: TsGroupBox;
    edNFe: TsCurrencyEdit;
    ACBrNFe1: TACBrNFe;
    mmListaNFedata_rec: TDateTimeField;
    mmListaNFeprotocolo: TLargeintField;
    mmListaNFeCliente_Email: TStringField;
    mmListaNFeNFE_Email: TStringField;
    mmListaNFeCOD_FISCAL: TStringField;
    CheckTodos: tscheckbox;
    GroupBox1: TsGroupBox;
    lbEmpresaFat: tsLabel;
    edEmpresaFaturada: TsComboEdit;
    Label3: tsLabel;
    lbStatusServico: tsLabel;
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
    procedure BtnEnviarLoteNFEClick(Sender: TObject);
    procedure dgListaNFeDblClick(Sender: TObject);
    procedure CheckTodosClick(Sender: TObject);
    function CheckStatusNFe(sigla: string): string;
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_nfe_envio_lote: Tfm_nfe_envio_lote;
  TotalSelecionados: integer;
  AcionarSCAN: boolean;

implementation

uses Un_dao, Un_localizar, UnPri, Un_dados_cliente, un_nfe_transmissao,
  Un_dm, Un_vendas_industria2, unFUN, Un_splash;

{$R *.dfm}

procedure Tfm_nfe_envio_lote.CarregarGrid;
begin
  fm_splash.ggProgress.MaxValue := dao.q1.RecordCount;
  fm_splash.lbStatus.Caption := 'Carregando Itens...';
  fm_splash.ggProgress.progress := 0;
  fm_splash.Show;

  dao.q1.First;
  mmListaNFe.Close;
  mmListaNFe.EmptyTable;
  mmListaNFe.Open;
  while not dao.q1.eof do
  begin
    mmListaNFe.Append;
    mmListaNFeNum_Doc.Value := dao.Q1.fieldbyname('NUMDOC').value;
    mmListaNFeNFE.Value := dao.Q1.fieldbyname('nfe').value;
    mmListaNFeData_Saida.Value := dao.Q1.fieldbyname('dta_saida').value;
    mmListaNFeChave_NFE.Value := dao.Q1.fieldbyname('chave_nfe').value;
    mmListaNFeCliente.Value := dao.Q1.fieldbyname('cliente').value;
    mmListaNFeStatusNfe.AsString := dao.Q1.fieldbyname('status_nfe').AsString;
    mmListaNFeCliente_Email.AsString := dao.Q1.fieldbyname('email').AsString;
    mmListaNFeNFE_Email.AsString := dao.Q1.fieldbyname('nfe_email').AsString;
    mmListaNFeCOD_FISCAL.AsString := dao.Q1.fieldbyname('COD_FISCAL').AsString;
    mmListaNFeCheck.Value := false;
    mmListaNFe.Post;

    fm_splash.ggProgress.AddProgress(1);
    fm_splash.Refresh;
    sleep(10);

    dao.q1.next;
  end;
  dao.q1.close;
  mmListaNFe.First;
  fm_splash.Hide;
  TotalSelecionados := 0;
  BtnEnviarLoteNFE.enabled := false;
end;

function Tfm_nfe_envio_lote.CheckStatusNFe(sigla: string): string;
var
  cBuscarCertificado: _BuscarCertificado;
  cTransmissaoXML: _TransmissaoXML;
  status, motivo, pathSaida, tipAmb, nomeCertificado, strVersaoDados, strDados, strCabecXML: string;
  MsgRetWS, smensagem: wideString;
  reciboLst: TStringList;
begin
  pathSaida := ExtractFilePath(Application.ExeName) + 'nf\';
  try
    strCabecXML := '<?xml version="1.0" encoding="UTF-8" ?><cabecMsg xmlns="http://www.portalfiscal.inf.br/nfe" versao="1.02"><versaoDados>2.00</versaoDados></cabecMsg>';
    if FMFUN.BuscaAmbienteNFE = taProducao then tipAmb := '1' else tipAmb := '2';
    strDados := '<?xml version="1.0" encoding="UTF-8" ?><consStatServ xmlns="http://www.portalfiscal.inf.br/nfe" versao="2.00"><tpAmb>' + tipAmb + '</tpAmb><cUF>42</cUF><xServ>STATUS</xServ></consStatServ>';
    if nomeCertificado = '' then
    begin
      cBuscarCertificado := CoBuscarCertificado.Create;
      cBuscarCertificado.BuscaNome(smensagem);
      nomeCertificado := smensagem;
    end;
    cTransmissaoXML := CoTransmissaoXML.Create;
    cTransmissaoXML.NfeStatusServico('2', sigla, StrToInt(tipAmb), nomeCertificado, strCabecXML, strDados, MsgRetWS);
    // cTransmissaoXML.NfeStatusServico(verSchema, siglaUF, StrToInt(tpAmb), titCertificado, strCabecXML, strDados, MsgRetWS)

    reciboLst := TStringList.Create;
    reciboLst.add(MsgRetWS);
    reciboLst.savetofile(pathSaida + 'ReciboServico.xml');
    reciboLst.free;

    XMLNFe.loadfromfile(pathSaida + 'ReciboServico.xml');

    status := XMLNFe.DocumentElement.ChildNodes.FindNode('cStat').text;
    motivo := XMLNFe.DocumentElement.ChildNodes.FindNode('xMotivo').text;

    lbStatusServico.Caption := status + '-' + motivo;
  except
    lbStatusServico.Caption := 'Sem conexão...';
  end;
  cTransmissaoXML := nil;
  Result := status;
end;

procedure Tfm_nfe_envio_lote.FormShow(Sender: TObject);
var
  status: string;
begin
  dao.Geral1('SELECT V.NFE, V.NUMDOC, V.DTA_SAIDA, V.CHAVE_NFE, V.STATUS_NFE||''-''||V.MOTIVO_NFE AS STATUS_NFE, ' +
    ' CASE WHEN C.COD_CLIENTE IS NOT NULL THEN C.COD_CLIENTE||''-''||C.NOM_CLIENTE ELSE F.COD_FORNECEDOR||''-''||F.RAZAO_SOCIAL END as cliente, ' +
    ' C.NFE_EMAIL, C.EMAIL, V.PROTOCOLO_NFE, V.DATA_REC_NFE, V.COD_FISCAL FROM VENDAS1 V LEFT OUTER JOIN CLIENTE C ON (C.COD_CLIENTE = V.COD_CLIENTE) ' +
    ' LEFT OUTER JOIN FORNECEDOR F ON (F.COD_FORNECEDOR = V.COD_FORNECEDOR) ' +
    ' WHERE V.CHAVE_NFE IS NOT NULL  AND V.FATURADO = 0 ORDER BY V.DTA_SAIDA ');
  CarregarGrid;
  AcionarSCAN := false;
  status := CheckStatusNFe('SC');
  if status <> '107' then
  begin
    status := CheckStatusNFe('SCAN');
    if status = '107' then
      AcionarSCAN := true;
  end;
end;

procedure Tfm_nfe_envio_lote.dgListaNFeDrawColumnCell(Sender: TObject;
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

procedure Tfm_nfe_envio_lote.dgListaNFeColExit(Sender: TObject);
begin
  if dgListaNFe.SelectedField.FieldName = DBCheckBox1.DataField then
    DBCheckBox1.Visible := False
end;

procedure Tfm_nfe_envio_lote.dgListaNFeKeyPress(Sender: TObject;
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

procedure Tfm_nfe_envio_lote.edPedidoButtonClick(Sender: TObject);
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

procedure Tfm_nfe_envio_lote.edClienteButtonClick(Sender: TObject);
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
  chamou_form := 'fr_nfe_envio_lote_cliente';
  chamou_cadastro := 'Fr_cliente';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cliente';
  Fr_localizar.BT_cadastro.Visible := true;

  SetLength(Campos_combo, 6);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Razão Social';
  Campos_combo[2] := 'Nome Fantasia';
  Campos_combo[3] := 'CNPJ';
  Campos_combo[4] := 'CPF';
  Campos_combo[5] := 'Cidade';

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

procedure Tfm_nfe_envio_lote.btBuscaDadosClienteClick(Sender: TObject);
begin
  if edcliente.Text <> '' then
  begin
    Application.CreateForm(TFr_dados_cliente, Fr_dados_cliente);
    Fr_dados_cliente.Busca_dados_cliente(edcliente.Text);
    Fr_dados_cliente.ShowModal;
  end;
end;

procedure Tfm_nfe_envio_lote.BtConsultaClick(Sender: TObject);
var
  filtro: string;
begin
  filtro := '';

  if trim(edNFe.Text) <> '' then
    filtro := filtro + ' AND V.NFE = ' + edNFe.Text;

  if trim(edPedido.Text) <> '' then
    filtro := filtro + ' AND V.NUMDOC = ' + edPedido.Text;

  if trim(edCliente.Text) <> '' then
    filtro := filtro + ' AND V.COD_CLIENTE = ' + edCliente.Text;

  if trim(edEmpresaFaturada.Text) <> '' then
    filtro := filtro + ' AND V.EMPRESA_FATURAR = ' + edEmpresaFaturada.Text;

  if trim(edSaidaDe.Text) <> '/  /' then
    filtro := filtro + ' AND V.DTA_SAIDA >= ' + QuotedStr(FormatDateTime('yyyy/mm/dd', edSaidaDe.Date));

  if trim(edSaidaAte.Text) <> '/  /' then
    filtro := filtro + ' AND V.DTA_SAIDA <= ' + QuotedStr(FormatDateTime('yyyy/mm/dd', edSaidaAte.Date));

  dao.Geral1('SELECT V.NFE, V.NUMDOC, V.DTA_SAIDA, V.CHAVE_NFE, V.STATUS_NFE||''-''||V.MOTIVO_NFE AS STATUS_NFE, ' +
    ' CASE WHEN C.COD_CLIENTE IS NOT NULL THEN C.COD_CLIENTE||''-''||C.NOM_CLIENTE ELSE F.COD_FORNECEDOR||''-''||F.RAZAO_SOCIAL END as cliente, C.NFE_EMAIL, C.EMAIL, V.PROTOCOLO_NFE, V.DATA_REC_NFE, V.COD_FISCAL ' +
    ' FROM VENDAS1 V LEFT OUTER JOIN CLIENTE C ON (C.COD_CLIENTE = V.COD_CLIENTE) ' +
    ' LEFT OUTER JOIN FORNECEDOR F ON (F.COD_FORNECEDOR = V.COD_FORNECEDOR) ' +
    ' WHERE V.CHAVE_NFE IS NOT NULL  AND V.FATURADO = 0 ' + filtro + ' ORDER BY V.DTA_SAIDA ');

  CarregarGrid;
end;

procedure Tfm_nfe_envio_lote.BtnEnviarLoteNFEClick(Sender: TObject);
var
  LoteNFe: TNFeLote;
  cBuscarCeritifcado: _BuscarCertificado;
begin

  Application.CreateForm(TFr_nfe_transmissao, Fr_nfe_transmissao);
  cBuscarCeritifcado := CoBuscarCertificado.Create;
  LoteNFe := TNFeLote.Create(cBuscarCeritifcado);

  Fr_nfe_transmissao.sCheckBox1.Visible := true;
  Fr_nfe_transmissao.sCheckBox1.Caption := 'Gerando Arquivo de Lote.';

  Fr_nfe_transmissao.sCheckBox2.Visible := true;
  Fr_nfe_transmissao.sCheckBox2.Caption := 'Carregando Arquivos NF-e no FTP';

  Fr_nfe_transmissao.sCheckBox3.Visible := true;
  Fr_nfe_transmissao.sCheckBox3.Caption := 'Buscar Certificado.';

  Fr_nfe_transmissao.sCheckBox4.Visible := true;
  Fr_nfe_transmissao.sCheckBox4.Caption := 'Enviando Lote';

  Fr_nfe_transmissao.sCheckBox5.Visible := true;
  Fr_nfe_transmissao.sCheckBox5.Caption := 'Consultando Recibo Lote';

  Fr_nfe_transmissao.Gauge1.MaxValue := 5;
  Fr_nfe_transmissao.Height := Fr_nfe_transmissao.Height + (16 * 5);
  Fr_nfe_transmissao.Gauge1.Progress := 0;

  Fr_nfe_transmissao.ShowModal;
end;

constructor TNFeLote.Create(BuscarCertificado: _BuscarCertificado);
begin
  inherited Create(True); { Chama o contrutor herdado. Ele irá temporariamente colocar o thread em estado de espera para depois executá-lo. }
  FreeOnTerminate := True; // Libera o objeto após terminar.
  Priority := TpLower; { Configura sua prioridade na lista de processos do Sistema operacional. }
  cBuscarCertificado := BuscarCertificado;
  Resume; // Inicia o Thread.
end;

procedure TNFeLote.Execute;
begin
  frpri.DesabilitaTimers;
  frpri.TmUpdate.Enabled := false;
  if FMFUN.BuscaAmbienteNFE = taProducao then tipAmb := 1 else tipAmb := 2;

  LimparArquivos;
  GerarLote('000000000000001');

  if not erro then
    EnviarLote(PathLote);

  if not erro then
    GravarReciboNfe;

  if not erro then
  begin
    finalizado := true;
    Synchronize(Mostra);
  end
  else
  begin
    Synchronize(Mostra);
  end;

  LimparArquivos;
  Fr_nfe_transmissao.BtnOK.Enabled := true;
  //  fm_nfe_envio_lote.BtConsultaClick(self);
  //  frpri.TmUpdate.Enabled := true;
end;

procedure TNFeLote.LimparArquivos;
var
  F: TSearchRec;
  Ret: Integer;
  TempNome: string;
begin
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

procedure TNFeLote.GerarLote(NumerodoLote: string);
var
  fArquivoTexto: TextFile;
  MeuXMLAssinado: PChar;
  buf, ArquivoXMLAssinado, arquivoNFe: string;
  mTexto, mTexto2: TStringList;
begin
  cont := 1;
  Synchronize(Mostra);
  mTexto2 := TStringList.Create;
  mTexto2.Clear;

  MeuXMLAssinado := Pchar(MeuXMLAssinado);

  // Crie o novo arquivo (Ex. arquivoXMLEnviNFe = 0000000000001env-lot.xml)

  pathSaida := ExtractFilePath(Application.ExeName) + 'nf\';

  PathLote := pathSaida + NumerodoLote + '-env-lot.xml'; // Nome do arquivo que será criado...
  AssignFile(fArquivoTexto, (PathLote));
  Rewrite(fArquivoTexto);

  // Adiciona as namespaces
  Write(fArquivoTexto, '<?xml version="1.0" encoding="UTF-8"?>');
  Write(fArquivoTexto, '<enviNFe xmlns="http://www.portalfiscal.inf.br/nfe" versao="2.00">');
  Write(fArquivoTexto, '<idLote>' + NumerodoLote + '</idLote>');

  //repetir essa parte do codigo quando quiser anexar varios arquivos... aki é que entra o while das notas
  buf := '';
  // aki é onde vc adiciona o conteudo dos XMLs das NFes... Usando o caminho que está aberto OpenDialog que ja foi aberto...

    // Nesse ponto vc está copiando o conteudo da tag "NFe" para o buffer...
  cont := 2;
  Synchronize(Mostra);
  fm_nfe_envio_lote.mmListaNFe.First;
  while not fm_nfe_envio_lote.mmListaNFe.eof do
  begin
    if fm_nfe_envio_lote.mmListaNFeCheck.Value then
    begin
      mTexto := TStringList.Create;
      mTexto.Clear;
      try
        dm.FTPNFe.Connect;
        if dm.FTPNFe.Connected then
        begin
          // transfere um arquivo texto
          dm.FTPNFe.TransferType := ftASCII;
          arquivoNFe := fm_nfe_envio_lote.mmListaNFeChave_NFE.AsString + '-nfe.xml';
          dm.FTPNFe.get(arquivoNFe, pathSaida + arquivoNFe);
          mTexto.LoadFromFile(pathSaida + arquivoNFe); // aki é onde vc adiciona o conteudo dos XMLs das NFes... Usando o caminho que está aberto OpenDialog que ja foi aberto...
          MeuXMLAssinado := PChar(mTexto.Text);
          // desconecta
          dm.FTPNFe.Quit;
        end;
      except
        dm.FTPNFe.Quit;
        erro := true;
        msgerros := 'Erro ao carregar Arquivo no FTP...';
      end;
      buf := Copy(MeuXMLAssinado, Pos('<NFe', MeuXMLAssinado), Length(MeuXMLAssinado));
      Write(fArquivoTexto, buf);
      mTexto.Free;
    end;
    fm_nfe_envio_lote.mmListaNFe.Next;
  end;
  //fim da repetição...

  // Fecha o arquivo
  Write(fArquivoTexto, '</enviNFe>');
  CloseFile(fArquivoTexto);
  mTexto2.Free;
end;

procedure TNFeLote.EnviarLote(arquivo: string);
var
  cAssinarXML: _AssinarXML;
  cTransmissaoXML: _TransmissaoXML;
  CabMsg, siglaUF, retWS, msg, tp: string;
  rtfDadosMsg, reciboLst: TStringList;
  tpamb: integer;
  smensagem: wideString;
begin
  cont := 3;
  Synchronize(Mostra);
  cBuscarCertificado.BuscaNome(smensagem);
  nomeCertificado := smensagem;
  rtfDadosMsg := TStringList.Create;
  rtfDadosMsg.LoadFromFile(arquivo);
  retWS := '';
  cabMsg := '<?xml version="1.0" encoding="UTF-8" ?><cabecMsg xmlns="http://www.portalfiscal.inf.br/nfe" versao="2.00"><versaoDados>2.00</versaoDados></cabecMsg>';
  msg := '';
  cont := 4;
  Synchronize(Mostra);

  if AcionarSCAN then
    siglaUF := 'SCAN'
  else
    siglaUF := 'SC';

  try
    cTransmissaoXML := CoTransmissaoXML.Create;
    if not cTransmissaoXML.NfeRecepcao('2', siglaUF, tipAmb, nomeCertificado, CabMsg, rtfDadosMsg.Text, MsgRetWS) then
    begin
      erro := true;
      msgerros := MsgRetWS;
    end
    else
    begin
      reciboLst := TStringList.Create;
      reciboLst.add(MsgRetWS);
      reciboLst.savetofile(pathSaida + 'ReciboLote.xml');
      reciboLst.free;
    end;
  finally
    cTransmissaoXML := nil;
  end;
end;

procedure TNFeLote.Mostra;
begin
  case cont of
    1:
      begin
        Fr_nfe_transmissao.sCheckBox1.Checked := true;
      end;
    2:
      begin
        Fr_nfe_transmissao.sCheckBox2.Checked := true;
      end;
    3:
      begin
        Fr_nfe_transmissao.sCheckBox3.Checked := true;
      end;
    4:
      begin
        Fr_nfe_transmissao.sCheckBox4.Checked := true;
      end;
    5:
      begin
        Fr_nfe_transmissao.sCheckBox5.Checked := true;
      end;
    6:
      begin
        Fr_nfe_transmissao.sCheckBox6.Checked := true;
      end;
    7:
      begin
        Fr_nfe_transmissao.sCheckBox7.Checked := true;
      end;
    8:
      begin
        Fr_nfe_transmissao.sCheckBox8.Checked := true;
      end;
    9:
      begin
        Fr_nfe_transmissao.sCheckBox9.Checked := true;
      end;
    10:
      begin
        Fr_nfe_transmissao.sCheckBox3.Checked := true;
      end;
  end;

  Fr_nfe_transmissao.Gauge1.Progress := cont;

  if erro then
  begin
    Fr_nfe_transmissao.lbResultado.Visible := true;
    Fr_nfe_transmissao.MsgErro.Visible := true;
    Fr_nfe_transmissao.MsgErro.Text := msgerros;
    Fr_nfe_transmissao.MsgErro.Height := Fr_nfe_transmissao.Panel1.Height - Fr_nfe_transmissao.MsgErro.Top;
    Fr_nfe_transmissao.lbResultado.Caption := 'Houve erro no processo.';
    frpri.HabilitaTimers;
  end;

  if finalizado then
  begin
    Fr_nfe_transmissao.lbResultado.Visible := true;
    Fr_nfe_transmissao.lbResultado.Caption := 'Processo realizado com sucesso.';
    frpri.HabilitaTimers;
  end;

  Fr_nfe_transmissao.Update;
  Sleep(2000);
end;

procedure TNFeLote.GravarReciboNfe;
var
  cTransmissaoXML: _TransmissaoXML;
  strVersaoDados, strCabecXML, strDados, status, motivo, protocolo, digest, dataStr: string;
  reciboLst: TStringList;
  data: TDateTime;

  procedure SetaData;
  var
    dataarr: TStringList;
    horastr: string;
  begin
    horastr := copy(datastr, pos('T', datastr) + 1, 8);
    datastr := copy(datastr, 1, pos('T', datastr) - 1);
    dataarr := TStringList.create;
    dataarr := FMFUN.explode(datastr, '-');
    datastr := dataarr[2] + '/' + dataarr[1] + '/' + dataarr[0];
    dataarr.free;
    data := strtodatetime(datastr + ' ' + horastr);
  end;

  procedure CarregaStatusLote;
  begin

    strDados := '<?xml version="1.0" encoding="UTF-8" ?><consReciNFe xmlns="http://www.portalfiscal.inf.br/nfe" versao="2.00"><tpAmb>' + inttostr(tipAmb) + '</tpAmb><nRec>' + Recibo + '</nRec></consReciNFe>';

    try
      cTransmissaoXML := CoTransmissaoXML.Create;
      if not cTransmissaoXML.NfeRetRecepcao('2', 'SC', tipAmb, nomeCertificado, strCabecXML, strDados, MsgRetWS) then
      begin
        erro := true;
        msgerros := MsgRetWS;
      end
      else
      begin
        reciboLst := TStringList.Create;
        reciboLst.add(MsgRetWS);
        reciboLst.savetofile(pathSaida + 'ReciboLote.xml');
        reciboLst.free;
      end;
    finally
      cTransmissaoXML := nil;
    end;
  end;

  procedure ConsultaStatusLote(ChaveNFe: string);
  var
    xmlRecibo: IXMLNode;
    SxmlRecibo: TStringList;
  begin
    SxmlRecibo := TStringList.Create;
    SxmlRecibo.LoadFromFile(pathSaida + 'ReciboLote.xml');
    SxmlRecibo.Text := StringReplace(SxmlRecibo.Text, 'ç', 'c', [rfReplaceAll]);
    SxmlRecibo.SaveToFile(pathSaida + 'ReciboLote.xml');
    fm_nfe_envio_lote.XMLNFe.loadfromfile(pathSaida + 'ReciboLote.xml');

    if Assigned(fm_nfe_envio_lote.XMLNFe.DocumentElement.ChildNodes.FindNode('protNFe')) then
    begin
      xmlRecibo := fm_nfe_envio_lote.XMLNFe.DocumentElement.ChildNodes.FindNode('protNFe');
      xmlRecibo.ChildNodes.First;

      status := '';
      motivo := '';
      protocolo := '';
      digest := '';
      datastr := '';

      while not (xmlRecibo = nil) do
      begin
        if ChaveNFe = xmlRecibo.ChildNodes.FindNode('infProt').ChildNodes.FindNode('chNFe').text then
        begin
          status := xmlRecibo.ChildNodes.FindNode('infProt').ChildNodes.FindNode('cStat').text;
          motivo := xmlRecibo.ChildNodes.FindNode('infProt').ChildNodes.FindNode('xMotivo').text;
          if status = '100' then
            protocolo := xmlRecibo.ChildNodes.FindNode('infProt').ChildNodes.FindNode('nProt').text
          else
            protocolo := 'null';
          digest := xmlRecibo.ChildNodes.FindNode('infProt').ChildNodes.FindNode('digVal').text;
          datastr := xmlRecibo.ChildNodes.FindNode('infProt').ChildNodes.FindNode('dhRecbto').text;
          SetaData;
        end;
        xmlRecibo := xmlRecibo.NextSibling;
      end;
      //    fm_nfe_envio_lote.XMLNFe.Active := false;
    end;
  end;

  procedure ConsultaStatusNFe(ChaveNFe: string);
  begin
    try
      cTransmissaoXML := CoTransmissaoXML.Create;
      strDados := '<?xml version="1.0" encoding="UTF-8"?><consSitNFe xmlns="http://www.portalfiscal.inf.br/nfe" versao="2.00"><tpAmb>' + inttostr(tipAmb) + '</tpAmb><xServ>CONSULTAR</xServ><chNFe>' + ChaveNFe + '</chNFe></consSitNFe>';
      if not cTransmissaoXML.NfeConsulta('2', 'SC', tipAmb, nomeCertificado, strCabecXML, strDados, MsgRetWS) then
      begin
        erro := true;
        msgerros := MsgRetWS;
      end
      else
      begin
        reciboLst := TStringList.Create;
        reciboLst.add(MsgRetWS);
        reciboLst.savetofile(pathSaida + 'Recibo.xml');
        reciboLst.free;

        //      fm_nfe_envio_lote.XMLNFe.Active := true;
        fm_nfe_envio_lote.XMLNFe.loadfromfile(pathSaida + 'Recibo.xml');

        if Assigned(fm_nfe_envio_lote.XMLNFe.DocumentElement.ChildNodes.FindNode('chNFe')) then
        begin
          status := '';
          motivo := '';
          protocolo := '';
          digest := '';
          datastr := '';

          if ChaveNFe = fm_nfe_envio_lote.XMLNFe.DocumentElement.ChildNodes.FindNode('chNFe').text then
          begin
            status := fm_nfe_envio_lote.XMLNFe.DocumentElement.ChildNodes.FindNode('cStat').text;
            motivo := fm_nfe_envio_lote.XMLNFe.DocumentElement.ChildNodes.FindNode('xMotivo').text;
            if status = '100' then
            begin
              protocolo := fm_nfe_envio_lote.XMLNFe.DocumentElement.ChildNodes.FindNode('protNFe').ChildNodes.FindNode('infProt').ChildNodes.FindNode('nProt').text;
              digest := fm_nfe_envio_lote.XMLNFe.DocumentElement.ChildNodes.FindNode('protNFe').ChildNodes.FindNode('infProt').ChildNodes.FindNode('digVal').text;
              datastr := fm_nfe_envio_lote.XMLNFe.DocumentElement.ChildNodes.FindNode('protNFe').ChildNodes.FindNode('infProt').ChildNodes.FindNode('dhRecbto').text;
              SetaData;
            end
            else
            begin
              protocolo := 'null';
              digest := 'null';
              datastr := 'null';
            end;
          end;
        end;
        // fm_nfe_envio_lote.XMLNFe.Active := false;
        DeleteFile(pathSaida + 'Recibo.xml');
      end;
    finally
      cTransmissaoXML := nil;
    end;
  end;

  procedure ImprimirDanfe(chave, protocolo: string; data: TDateTime);
  var
    arquivoNFe, arquivoPDF, pathSaida: string;
  begin
    pathSaida := ExtractFilePath(Application.ExeName) + 'nf\';
    arquivoNFe := chave + '-nfe.xml';
    fm_nfe_envio_lote.ACBrNFe1.NotasFiscais.Clear;
    //fm_nfe_envio_lote.ACBrNFe1.DANFE.Impressora := fmfun.BuscaImpressoraPadrao;
    fm_nfe_envio_lote.ACBrNFe1.NotasFiscais.LoadFromFile(pathSaida + arquivoNFe);
    fm_nfe_envio_lote.ACBrNFe1.DANFE.Protocolo := protocolo + ' ' + formatdatetime('dd/mm/yyyy hh:mm:ss', data);
    fm_nfe_envio_lote.ACBrNFe1.DANFE.Logo := ExtractFilePath(Application.ExeName) + 'logo.bmp';
    fm_nfe_envio_lote.ACBrNFe1.DANFE.ImprimirDANFE();
  end;

  function AtualizaStatusNFe: Boolean;
  var
    sqlNFe, faturado: string;
  begin
    CarregaStatusLote;
    fm_nfe_envio_lote.mmListaNFe.First;
    while not fm_nfe_envio_lote.mmListaNFe.eof do
    begin
      if fm_nfe_envio_lote.mmListaNFeCheck.Value then
      begin
        ConsultaStatusNFe(fm_nfe_envio_lote.mmListaNFeChave_NFe.AsString);

        if status <> '100' then
        begin
          ConsultaStatusLote(fm_nfe_envio_lote.mmListaNFeChave_NFe.AsString);
          if status <> '100' then
            faturado := '0'
          else
          begin
            if ((fm_nfe_envio_lote.mmListaNFeCOD_FISCAL.AsString = '5102') or (fm_nfe_envio_lote.mmListaNFeCOD_FISCAL.AsString = '6102') or (fm_nfe_envio_lote.mmListaNFeCOD_FISCAL.AsString = '5405') or (fm_nfe_envio_lote.mmListaNFeCOD_FISCAL.AsString = '6403')) then
              faturado := '1'
            else
              faturado := '3';
          end
        end
        else
        begin
          if ((fm_nfe_envio_lote.mmListaNFeCOD_FISCAL.AsString = '5102') or (fm_nfe_envio_lote.mmListaNFeCOD_FISCAL.AsString = '6102') or (fm_nfe_envio_lote.mmListaNFeCOD_FISCAL.AsString = '5405') or (fm_nfe_envio_lote.mmListaNFeCOD_FISCAL.AsString = '6403')) then
            faturado := '1'
          else
            faturado := '3';
        end;

        sqlNfe := 'update vendas1 set ' +
          '  RECIBO_NFE =' + quotedstr(recibo) +
          ', STATUS_NFE = ' + status +
          ', MOTIVO_NFE = ' + quotedstr(motivo);

        if digest <> 'null' then
          sqlNfe := sqlNfe + ' , DIGEST_NFE = ' + quotedstr(digest);

        if protocolo <> 'null' then
          sqlNfe := sqlNfe + ' , PROTOCOLO_NFE = ' + quotedstr(protocolo);

        sqlNfe := sqlNfe +
          ', DATA_REC_NFE = ' + quotedstr(formatdatetime('dd/mm/yyyy hh:mm:ss', data)) +
          ', EMAIL_NFE = 0 ' +
          ', FATURADO     = ' + faturado +
          ' where numdoc =' + fm_nfe_envio_lote.mmListaNFeNum_Doc.AsString;
        try
          if not (dao.cn.InTransaction) then
            dao.cn.StartTransaction;
          dao.Execsql(sqlNfe);
          dao.cn.Commit;
        except
          dao.cn.Rollback;
        end;

        dao.Geral4('SELECT COD_PRODUTO, QTD FROM VENDAS2 WHERE NUMDOC = ' + fm_nfe_envio_lote.mmListaNFeNum_Doc.AsString);
        dao.Q4.First;

        try
          if status = '100' then
            ImprimirDanfe(fm_nfe_envio_lote.mmListaNFeChave_NFe.AsString, protocolo, data);
        except
          //
        end
      end;
      fm_nfe_envio_lote.mmListaNFe.next;
    end;
    DeleteFile(pathSaida + 'ReciboLote.xml');
    fm_nfe_envio_lote.mmListaNFe.First;
  end;

begin
  cont := 5;
  Synchronize(Mostra);

  strVersaoDados := '2.00';
  strCabecXML := '<?xml version="1.0" encoding="UTF-8" ?><cabecMsg xmlns="http://www.portalfiscal.inf.br/nfe" versao="2.00"><versaoDados>' + strVersaoDados + '</versaoDados></cabecMsg>';

  fm_nfe_envio_lote.XMLNFe.Active := true;
  fm_nfe_envio_lote.XMLNFe.loadfromfile(pathSaida + 'ReciboLote.xml');
  recibo := fm_nfe_envio_lote.XMLNFe.DocumentElement.ChildNodes.FindNode('infRec').ChildNodes.FindNode('nRec').text;
  fm_nfe_envio_lote.XMLNFe.Active := false;
  //  DeleteFile(pathSaida + 'ReciboLote.xml');

  AtualizaStatusNFe;

end;

procedure Tfm_nfe_envio_lote.dgListaNFeDblClick(Sender: TObject);
begin
  mmListaNFe.Edit;
  if mmListaNFeCheck.Value = true then
  begin
    mmListaNFeCheck.Value := false;
    totalselecionados := totalselecionados - 1;
  end
  else
  begin
    if totalselecionados = 50 then
    begin
      Showmessage('Máximo 50 Notas Fiscais por Lote à serem enviadas.');
      exit;
    end;
    mmListaNFeCheck.Value := true;
    totalselecionados := totalselecionados + 1;
  end;
  mmListaNFe.Post;

  lbTotalNFS.Caption := 'Notas Fiscais Selecionadas: ' + inttostr(totalselecionados);

  if totalselecionados = 0 then
    BtnEnviarLoteNFE.enabled := false
  else
    BtnEnviarLoteNFE.enabled := true;
end;

procedure Tfm_nfe_envio_lote.CheckTodosClick(Sender: TObject);
begin
  totalselecionados := 0;
  mmListaNFe.First;
  while not mmListaNFe.Eof do
  begin
    mmListaNFe.Edit;
    mmListaNFeCheck.Value := CheckTodos.Checked;
    if CheckTodos.Checked then
      totalselecionados := totalselecionados + 1
    else
      totalselecionados := 0;
    mmListaNFe.Post;
    mmListaNFe.Next;
  end;
  mmListaNFe.First;
  if totalselecionados = 0 then
    BtnEnviarLoteNFE.enabled := false
  else
    BtnEnviarLoteNFE.enabled := true;
end;

procedure Tfm_nfe_envio_lote.FormActivate(Sender: TObject);
begin
  //  frpri.EnvioEmailNFE;
end;

procedure Tfm_nfe_envio_lote.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

end.




