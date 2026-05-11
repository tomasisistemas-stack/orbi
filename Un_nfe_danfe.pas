unit Un_nfe_danfe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, RxMemDS, StdCtrls, Buttons, NFE_dll_TLB,
  DBCtrls, Mask, xmldom, XMLIntf, msxmldom, XMLDoc, IdFTPCommon,
  ACBrNFeDANFEClass, ACBrNFe, sPanel, sBitBtn,
  sLabel, sCheckBox, sGroupBox, acDBGrid, sTooledit, sMaskEdit,
  sCustomComboEdit, sCurrEdit, sCurrencyEdit, sComboEdit, ACBrBase, ACBrDFe,
  ACBrNFeDANFEFRDM, ACBrNFeDANFEFR, ACBrDFeReport, ACBrDFeDANFeReport;

type
  Tfm_nfe_danfe = class(TForm)
    mmListaNFe: TRxMemoryData;
    dsListaNFe: TDataSource;
    Panel1: tsPanel;
    Panel2: tsPanel;
    Panel3: tsPanel;
    dgListaNFe: Tdbgrid;
    BtnImprimir: TsBitBtn;
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
    GroupBox1: TsGroupBox;
    lbEmpresaFat: tsLabel;
    edEmpresaFaturada: TsComboEdit;
    CheckTodos: tscheckbox;
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
    procedure BtnImprimirClick(Sender: TObject);
    procedure dgListaNFeDblClick(Sender: TObject);
    procedure LimparArquivos;
    procedure edEmpresaFaturadaButtonClick(Sender: TObject);
    procedure CheckTodosClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_nfe_danfe: Tfm_nfe_danfe;
  TotalSelecionados: integer;

implementation

uses Un_dao, Un_localizar, UnPri, Un_dados_cliente, un_nfe_transmissao,
  Un_dm, Un_vendas_industria2, unFUN, Un_splash;

{$R *.dfm}

procedure Tfm_nfe_danfe.CarregarGrid;
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
    mmListaNFeprotocolo.Value := dao.Q1.fieldbyname('PROTOCOLO_NFE').Value;
    mmListaNFedata_rec.Value := dao.Q1.fieldbyname('DATA_REC_NFE').Value;
    mmListaNFeCheck.Value := false;
    mmListaNFe.Post;

    fm_splash.ggProgress.AddProgress(1);
    fm_splash.Refresh;
    sleep(10);

    dao.q1.next;
  end;
  dao.q1.close;
  fm_splash.Hide;
  mmListaNFe.First;
  TotalSelecionados := 0;
  BtnImprimir.enabled := false;
end;

procedure Tfm_nfe_danfe.FormShow(Sender: TObject);
var
  data_ini, data_fim: Tdate;
begin
  data_ini := now - 15;
  data_fim := now;

  dao.Geral1('SELECT V.NFE, V.NUMDOC, V.DTA_SAIDA, V.CHAVE_NFE, V.STATUS_NFE||''-''||V.MOTIVO_NFE AS STATUS_NFE, ' +
    ' CASE WHEN C.COD_CLIENTE IS NOT NULL THEN C.COD_CLIENTE||''-''||C.NOM_CLIENTE ELSE F.COD_FORNECEDOR||''-''||F.RAZAO_SOCIAL END as cliente, V.PROTOCOLO_NFE, V.DATA_REC_NFE FROM VENDAS1 V LEFT OUTER JOIN CLIENTE C ON (C.COD_CLIENTE = V.COD_CLIENTE) ' +
    ' LEFT OUTER JOIN FORNECEDOR F ON (F.COD_FORNECEDOR = V.COD_FORNECEDOR) ' +
    ' WHERE V.CHAVE_NFE IS NOT NULL AND V.PROTOCOLO_NFE IS NOT NULL AND STATUS_NFE = 100 AND V.FATURADO = 1  AND V.DTA_SAIDA between ' + quotedstr(formatdatetime('dd.mm.yyyy', data_ini)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', data_fim)) + ' ORDER BY V.DTA_SAIDA DESC, V.NUMDOC DESC');
  CarregarGrid;

end;

procedure Tfm_nfe_danfe.dgListaNFeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
const IsChecked: array[Boolean] of Integer =
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

procedure Tfm_nfe_danfe.dgListaNFeColExit(Sender: TObject);
begin
  if dgListaNFe.SelectedField.FieldName = DBCheckBox1.DataField then
    DBCheckBox1.Visible := False
end;

procedure Tfm_nfe_danfe.dgListaNFeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = Chr(9)) then Exit;

  if (dgListaNFe.SelectedField.FieldName = DBCheckBox1.DataField) then
  begin
    DBCheckBox1.SetFocus;
    SendMessage(DBCheckBox1.Handle, WM_Char, word(Key), 0);
  end;

end;

procedure Tfm_nfe_danfe.edPedidoButtonClick(Sender: TObject);
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

procedure Tfm_nfe_danfe.edClienteButtonClick(Sender: TObject);
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
  chamou_form := 'fr_nfe_danfe_cliente';
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

procedure Tfm_nfe_danfe.btBuscaDadosClienteClick(Sender: TObject);
begin
  if edcliente.Text <> '' then
  begin
    Application.CreateForm(TFr_dados_cliente, Fr_dados_cliente);
    Fr_dados_cliente.Busca_dados_cliente(edcliente.Text);
    Fr_dados_cliente.ShowModal;
  end;
end;

procedure Tfm_nfe_danfe.BtConsultaClick(Sender: TObject);
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

  if trim(edSaidaDe.Text) <> '/  /' then
    filtro := filtro + ' AND V.DTA_SAIDA >= ' + QuotedStr(FormatDateTime('yyyy/mm/dd', edSaidaDe.Date));

  if trim(edSaidaAte.Text) <> '/  /' then
    filtro := filtro + ' AND V.DTA_SAIDA <= ' + QuotedStr(FormatDateTime('yyyy/mm/dd', edSaidaAte.Date));

  dao.Geral1('SELECT V.NFE, V.NUMDOC, V.DTA_SAIDA, V.CHAVE_NFE, V.STATUS_NFE||''-''||V.MOTIVO_NFE AS STATUS_NFE, ' +
    ' CASE WHEN C.COD_CLIENTE IS NOT NULL THEN C.COD_CLIENTE||''-''||C.NOM_CLIENTE ELSE F.COD_FORNECEDOR||''-''||F.RAZAO_SOCIAL END as cliente, V.PROTOCOLO_NFE, V.DATA_REC_NFE FROM VENDAS1 V LEFT OUTER JOIN CLIENTE C ON (C.COD_CLIENTE = V.COD_CLIENTE) ' +
    ' LEFT OUTER JOIN FORNECEDOR F ON (F.COD_FORNECEDOR = V.COD_FORNECEDOR) ' +
    ' WHERE V.CHAVE_NFE IS NOT NULL AND V.PROTOCOLO_NFE IS NOT NULL AND STATUS_NFE = 100 AND V.FATURADO = 1 ' + filtro + ' ORDER BY V.DTA_SAIDA DESC, V.NUMDOC DESC');

  CarregarGrid;
end;

procedure Tfm_nfe_danfe.BtnImprimirClick(Sender: TObject);
  procedure ImprimirDanfe(chave, protocolo: string; data: TDateTime);
  var
    arquivoNFe, pathSaida, arquivoPDF: string;
  begin
    try
      pathSaida := ExtractFilePath(Application.ExeName) + 'nf\';
      dm.FTPNFe.Connect;
      if dm.FTPNFe.Connected then
      begin
          // transfere um arquivo texto
        dm.FTPNFe.TransferType := ftASCII;
        arquivoNFe := chave + '-nfe.xml';
        dm.FTPNFe.get(arquivoNFe, pathSaida + arquivoNFe);
        dm.FTPNFe.Quit;
      end;
    except
      dm.FTPNFe.Quit;
      showmessage('Erro ao carregar Arquivo no FTP...');
      deletefile(pathSaida + arquivoNFe);
      fm_splash.Hide;
      exit;
    end;
    Sleep(2000);
    pathSaida := ExtractFilePath(Application.ExeName) + 'nf\';
    arquivoNFe := chave + '-nfe.xml';
    ACBrNFe1.NotasFiscais.Clear;
    ACBrNFe1.NotasFiscais.LoadFromFile(pathSaida + arquivoNFe);
    ACBrNFe1.DANFE := ACBrNFeDANFEFR1;
    //ACBrNFe1.DANFE.Impressora := fmfun.BuscaImpressoraPadrao;
    ACBrNFe1.DANFE.Protocolo := protocolo + ' ' + formatdatetime('dd/mm/yyyy hh:mm:ss', data);

    ACBrNFe1.DANFE.Logo := ExtractFilePath(Application.ExeName) + 'logo.bmp';
    ACBrNFe1.DANFE.ImprimirDANFE();
    {
    arquivoPDF := chave + '.pdf';
    ACBrNFe1.DANFE.PathPDF := pathSaida;
    ACBrNFe1.DANFE.ImprimirDANFEPDF();
    }
    DeleteFile(arquivoNFE);
  end;
begin
//  LimparArquivos;
  fm_splash.ggProgress.MaxValue := mmListaNFe.RecordCount;
  fm_splash.lbStatus.Caption := 'Imprimindo DANFEs...';
  fm_splash.ggProgress.progress := 0;
  fm_splash.Show;

  mmListaNFe.First;
  while not mmListaNFe.eof do
  begin
    if mmListaNFeCheck.Value then
    begin
      try
        ImprimirDanfe(mmListaNFeChave_NFe.AsString, mmListaNFeprotocolo.AsString, mmListaNFedata_rec.Value);
      except
        exit;
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

procedure Tfm_nfe_danfe.LimparArquivos;
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

procedure Tfm_nfe_danfe.dgListaNFeDblClick(Sender: TObject);
begin
  mmListaNFe.Edit;
  if mmListaNFeCheck.Value = true then
  begin
    mmListaNFeCheck.Value := false;
    totalselecionados := totalselecionados - 1;
  end
  else begin
    mmListaNFeCheck.Value := true;
    totalselecionados := totalselecionados + 1;
  end;
  mmListaNFe.Post;

  lbTotalNFS.Caption := 'Notas Fiscais Selecionadas: ' + inttostr(totalselecionados);

  if totalselecionados = 0 then
    BtnImprimir.enabled := false
  else
    BtnImprimir.enabled := true;
end;

procedure Tfm_nfe_danfe.edEmpresaFaturadaButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Empresa';
  chamou_pesquisa := 'fr_empresa';
  chamou_form := 'fr_nfe_danfe_empresa';
  chamou_cadastro := 'Fr_empresa';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Empresa';
  Fr_localizar.BT_cadastro.Visible := false;

  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';

  for i := 0 to 1 do
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

procedure Tfm_nfe_danfe.CheckTodosClick(Sender: TObject);
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
    BtnImprimir.enabled := false
  else
    BtnImprimir.enabled := true;
end;

procedure Tfm_nfe_danfe.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

end.
