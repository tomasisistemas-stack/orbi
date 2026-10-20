unit un_remessa_boleto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, sPanel, StdCtrls, Buttons, sBitBtn, Mask,
  sLabel, sCheckBox, Grids, DBGrids, DB, RxMemDS, ACBrBoleto,
  ACBrBase, DBCtrls, DateUtils, frxClass, acDBGrid, ACBrBoletoConversao,
  sMaskEdit, sCustomComboEdit, sComboEdit, sCurrEdit, sCurrencyEdit,
  ACBrBoletoFCFR, sBevel;

type
  Tfrm_remessa_boleto = class(TForm)
    sPanel1: TsPanel;
    sPanel2: TsPanel;
    btInserir: TsBitBtn;
    BtSalvar: TsBitBtn;
    sPanel3: TsPanel;
    BtBuscar: TsBitBtn;
    Lbl_produto: TsLabel;
    PrID: TsComboEdit;
    PrCONTA: TsComboEdit;
    Label40: TsLabel;
    lbCCBoleto: TsLabel;
    CheckTodos: TsCheckBox;
    lbTotalNFs: TsLabel;
    DBCheckBox1: TDBCheckBox;
    mmItens: TRxMemoryData;
    mmItensID: TIntegerField;
    mmItensTITULO: TStringField;
    mmItensSEQUENCIA: TIntegerField;
    mmItensNOM_CLIENTE: TStringField;
    mmItensDTAVEN: TDateField;
    mmItensVALOR: TCurrencyField;
    mmItensCheck: TBooleanField;
    dsItens: TDataSource;
    lbData: TsLabel;
    BtCancelar: TsBitBtn;
    mmItensCOD_CLIENTE: TStringField;
    mmItensTIPO_PESSOA: TStringField;
    mmItensCNPJ: TStringField;
    mmItensCPF: TStringField;
    mmItensENDERECO: TStringField;
    mmItensNR_ENDERECO: TStringField;
    mmItensBAIRRO: TStringField;
    mmItensNOM_CIDADE: TStringField;
    mmItensUF: TStringField;
    mmItensCEP: TStringField;
    mmItensISENTO: TIntegerField;
    fR_RELATORIO: TfrxReport;
    BtImprimir: TsBitBtn;
    mmItensNR_DOCUMENTO: TIntegerField;
    BtBoleto: TsBitBtn;
    dgItens: Tdbgrid;
    BtGerarArquivo: TsBitBtn;
    mmItensINSTRUCAO_BOLETO: TStringField;
    mmItensDESCONTADA: TBooleanField;
    DBCheckBox2: TDBCheckBox;
    Panel1: TPanel;
    sStickyLabel1: TsStickyLabel;
    sBevel1: TsBevel;
    lbtotal: TsLabel;
    sLabel1: TsLabel;
    SaveDialog1: TSaveDialog;
    mmItensBOLETO_REGISTRADO: TBooleanField;
    procedure MontaArquivoCobrancaEnvio;
    procedure relatorio_cobranca;
    procedure PrCONTAExit(Sender: TObject);
    procedure CarregaItens(ordem: string);
    procedure CarregaRemessa;
    procedure PrIDExit(Sender: TObject);
    procedure PrCONTAButtonClick(Sender: TObject);
    procedure PrIDButtonClick(Sender: TObject);
    procedure BtBuscarClick(Sender: TObject);
    procedure btInserirClick(Sender: TObject);
    procedure dgItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtSalvarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BtImprimirClick(Sender: TObject);
    procedure CheckTodosClick(Sender: TObject);
    procedure fR_RELATORIOGetValue(const VarName: string; var Value: Variant);
    procedure BtBoletoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtGerarArquivoClick(Sender: TObject);
    procedure dgItensTitleClick(Column: TColumn);
    procedure dgItensCellClick(Column: TColumn);
  private
    remessa_arquivo: string;
    FCarregandoItens: Boolean;
    FRegistrandoBoletos: Boolean;
    FAcaoAposCarga: Integer;
    FBoletosFalhaRegistro: TStringList;
    procedure SetarBoletos(listaboletos: string);
    procedure SetaBoletosDescontados(listaboletos: string; descontar: boolean);
    procedure ChecarDataVencida;
    procedure RegistrarBoletosApi(const ListaBoletos: string);
    procedure ImprimirBoletosCarregados;
    procedure GerarArquivoCarregado;
    procedure FinalizarRegistroBoletos;
    procedure AbrirClientesParaCorrigirCep(AClientes: TStrings);

    { Private declarations }
  public
    { Public declarations }
    modo_insert: boolean;
    totalselecionados: Integer;
    impressao_boleto : Boolean;
    destructor Destroy; override;
  end;

var
  frm_remessa_boleto: Tfrm_remessa_boleto;
  carteira_conta: string;
  dias_protesto, dias_baixa: Integer;
  Boleto_Avalista: string;
  tem_data_vcto_vencida: boolean;
  mensagem_padrao : string;
implementation

uses Un_dao, Un_localizar, unpri, UnFun, Un_dm, FireDAC.Comp.Client, un_splash,
  Un_BB_Cobrancas, Un_BB_Cobrancas_Api, Un_CEF_Cobrancas, Un_CEF_Cobrancas_Api,
  System.JSON, Un_Error_Logger, ActiveX, Un_Cliente;

{$R *.dfm}

const
  BB_COBRANCA_SCOPE = 'cobrancas.boletos-info cobrancas.boletos-requisicao';
  API_BOLETOS_POR_WORKER = 5;
  API_MAX_WORKERS = 8;

type
  TConsultaBoletoApiWorker = class(TThread)
  private
    FOwner: Tfrm_remessa_boleto;
    FConnParams: TStringList;
    FDriverName: string;
    FSQL: string;
    FWorkerIndex: Integer;
    FWorkerCount: Integer;
    FBBAmbiente: TBBApiAmbiente;
    FCEFAmbiente: TCEFApiAmbiente;
    FID: Integer;
    FDataPagamento: TDateTime;
    FValorPago: Double;
    FErro: string;
    procedure SincronizarBoletoRegistrado;
    procedure SincronizarErro;
    procedure SincronizarProgresso;
  protected
    procedure Execute; override;
  public
    constructor Create(AOwner: Tfrm_remessa_boleto; AConnParams: TStrings;
      const ADriverName, ASQL: string; AWorkerIndex, AWorkerCount: Integer;
      ABBAmbiente: TBBApiAmbiente; ACEFAmbiente: TCEFApiAmbiente);
    destructor Destroy; override;
  end;

function BBFieldStr(Q: TFDQuery; const Name, Default: string): string;
begin
  if (Q.FindField(Name) <> nil) and (not Q.FieldByName(Name).IsNull) then
    Result := Q.FieldByName(Name).AsString
  else
    Result := Default;
end;

function BBFieldInt(Q: TFDQuery; const Name: string; Default: Integer = 0): Integer;
begin
  if (Q.FindField(Name) <> nil) and (not Q.FieldByName(Name).IsNull) then
    Result := Q.FieldByName(Name).AsInteger
  else
    Result := Default;
end;

function BBFieldFloat(Q: TFDQuery; const Name: string; Default: Double = 0): Double;
begin
  if (Q.FindField(Name) <> nil) and (not Q.FieldByName(Name).IsNull) then
    Result := Q.FieldByName(Name).AsFloat
  else
    Result := Default;
end;

function BBFieldDate(Q: TFDQuery; const Name: string): TDateTime;
begin
  if (Q.FindField(Name) <> nil) and (not Q.FieldByName(Name).IsNull) then
    Result := Q.FieldByName(Name).AsDateTime
  else
    Result := 0;
end;

function BBOnlyNumbers(const Value: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(Value) do
    if CharInSet(Value[I], ['0'..'9']) then
      Result := Result + Value[I];
end;

function BBDate(const Value: TDateTime): string;
begin
  if Value = 0 then
    Result := ''
  else
    Result := FormatDateTime('dd.mm.yyyy', Value);
end;

function BBLeftPadDigits(const Value: string; Len: Integer): string;
var
  Digits, Padded: string;
begin
  Digits := BBOnlyNumbers(Value);
  if Digits = '' then
  begin
    Result := '';
    Exit;
  end;

  Padded := StringOfChar('0', Len) + Digits;
  Result := Copy(Padded, Length(Padded) - Len + 1, Len);
end;

function BBNumeroTituloCliente(Q: TFDQuery): string;
var
  Convenio, Controle, Titulo, Sequencia: string;
begin
  Convenio := BBLeftPadDigits(BBFieldStr(Q, 'convenio', ''), 7);
  Titulo := BBOnlyNumbers(BBFieldStr(Q, 'titulo', ''));
  Sequencia := BBOnlyNumbers(BBFieldStr(Q, 'sequencia', ''));
  Controle := BBLeftPadDigits(Titulo, 8) + BBLeftPadDigits(Sequencia, 2);

  if (Convenio = '') or (Controle = '') then
    Result := ''
  else
    Result := '000' + Convenio + Controle;
end;

function BBRightStr(const Value: string; Len: Integer): string;
begin
  if Length(Value) <= Len then
    Result := Value
  else
    Result := Copy(Value, Length(Value) - Len + 1, Len);
end;

function BBTituloNossoNumero(Q: TFDQuery): string;
var
  Titulo, Sequencia: string;
begin
  Titulo := BBFieldStr(Q, 'titulo', '');
  Sequencia := BBFieldStr(Q, 'sequencia', '');
  Result := BBRightStr(Titulo, 10) + BBLeftPadDigits(Sequencia, 1);
  Result := FMFUN.MontaNossoNumero(Result);
end;

function BBFormataNossoNumero(Q: TFDQuery): string;
var
  Convenio, NossoNumero: string;
begin
  Convenio := BBOnlyNumbers(BBFieldStr(Q, 'convenio', ''));
  NossoNumero := BBTituloNossoNumero(Q);

  if Length(Convenio) = 7 then
    Result := BBLeftPadDigits(Convenio, 7) + NossoNumero.padleft(10, '0')
  else
    Result := NossoNumero;
end;

function BBCalcularDigitoVerificador(const Documento: string): string;
var
  I, Peso, Soma, ModuloFinal: Integer;
begin
  Result := '0';
  Soma := 0;
  Peso := 9;

  for I := Length(Documento) downto 1 do
  begin
    if CharInSet(Documento[I], ['0'..'9']) then
      Soma := Soma + StrToInt(Documento[I]) * Peso;
    Dec(Peso);
    if Peso < 2 then
      Peso := 9;
  end;

  ModuloFinal := Soma mod 11;
  if ModuloFinal >= 10 then
    Result := 'X'
  else
    Result := IntToStr(ModuloFinal);
end;

function BBMontarCampoNossoNumero(Q: TFDQuery): string;
begin
  Result := '000' + BBFormataNossoNumero(Q);
end;
function BBNumeroTituloBeneficiario(Q: TFDQuery): string;
var
  I: Integer;
  Value: string;
begin
  Result := '';
  Value := UpperCase(Trim(BBFieldStr(Q, 'titulo', '') + '-' + BBFieldStr(Q, 'sequencia', '')));

  for I := 1 to Length(Value) do
  begin
    if CharInSet(Value[I], ['A'..'Z', '0'..'9']) then
      Result := Result + Value[I]
    else if (Value[I] = '-') and (Result <> '') and (Result[Length(Result)] <> '-') then
      Result := Result + Value[I];
  end;

  while (Result <> '') and (Result[Length(Result)] = '-') do
    Delete(Result, Length(Result), 1);

  Result := Copy(Result, 1, 15);
end;

function BBJsonString(AObj: TJSONObject; const AName: string): string;
var
  V: TJSONValue;
begin
  Result := '';
  if not Assigned(AObj) then
    Exit;

  V := AObj.GetValue(AName);
  if Assigned(V) then
    Result := V.Value;
end;

function BBJsonStringAny(AObj: TJSONObject; const ANames: array of string): string;
var
  I: Integer;
  V: TJSONValue;
  Pair: TJSONPair;
begin
  Result := '';
  if AObj = nil then
    Exit;

  for I := Low(ANames) to High(ANames) do
  begin
    V := AObj.GetValue(ANames[I]);
    if V <> nil then
    begin
      Result := Trim(V.Value);
      if Result <> '' then
        Exit;
    end;
  end;

  for I := 0 to AObj.Count - 1 do
  begin
    Pair := AObj.Pairs[I];
    if Pair.JsonValue is TJSONObject then
    begin
      Result := BBJsonStringAny(TJSONObject(Pair.JsonValue), ANames);
      if Result <> '' then
        Exit;
    end
    else if Pair.JsonValue is TJSONArray then
    begin
      if (TJSONArray(Pair.JsonValue).Count > 0) and
         (TJSONArray(Pair.JsonValue).Items[0] is TJSONObject) then
      begin
        Result := BBJsonStringAny(TJSONObject(TJSONArray(Pair.JsonValue).Items[0]), ANames);
        if Result <> '' then
          Exit;
      end;
    end;
  end;
end;

function BBTryDate(const Value: string; out ADate: TDateTime): Boolean;
var
  S: string;
  FS: TFormatSettings;
begin
  S := Trim(Value);
  Result := False;
  ADate := 0;
  if S = '' then
    Exit;

  if Length(S) >= 10 then
    S := Copy(S, 1, 10);

  GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, FS);
  FS.DateSeparator := '/';
  FS.ShortDateFormat := 'dd/mm/yyyy';

  Result := TryStrToDate(StringReplace(S, '.', '/', [rfReplaceAll]), ADate, FS);
  if Result then
    Exit;

  FS.DateSeparator := '-';
  FS.ShortDateFormat := 'yyyy-mm-dd';
  Result := TryStrToDate(S, ADate, FS);
end;

function BBTryFloat(const Value: string; out AValue: Double): Boolean;
var
  S: string;
  FS: TFormatSettings;
begin
  S := Trim(Value);
  GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, FS);
  FS.DecimalSeparator := '.';
  FS.ThousandSeparator := ',';
  Result := TryStrToFloat(S, AValue, FS);
  if Result then
    Exit;

  FS.DecimalSeparator := ',';
  FS.ThousandSeparator := '.';
  Result := TryStrToFloat(S, AValue, FS);
end;
function BBJsonArrayMessage(AObj: TJSONObject; const AArrayName, AMessageName: string): string;
var
  V: TJSONValue;
  Arr: TJSONArray;
  Item: TJSONObject;
begin
  Result := '';
  if not Assigned(AObj) then
    Exit;

  V := AObj.GetValue(AArrayName);
  if not (V is TJSONArray) then
    Exit;

  Arr := TJSONArray(V);
  if Arr.Count = 0 then
    Exit;
  if not (Arr.Items[0] is TJSONObject) then
    Exit;

  Item := TJSONObject(Arr.Items[0]);
  Result := BBJsonString(Item, AMessageName);
end;

function BBMensagemErroApi(E: Exception): string;
var
  ApiError: TBBApiException;
  V: TJSONValue;
  Obj: TJSONObject;
begin
  Result := E.Message;
  if not (E is TBBApiException) then
    Exit;

  ApiError := TBBApiException(E);
  V := TJSONObject.ParseJSONValue(ApiError.ResponseText);
  try
    if not (V is TJSONObject) then
      Exit;

    Obj := TJSONObject(V);
    Result := BBJsonArrayMessage(Obj, 'errors', 'message');
    if Result = '' then
      Result := BBJsonArrayMessage(Obj, 'erros', 'message');
    if Result = '' then
      Result := BBJsonArrayMessage(Obj, 'erros', 'mensagem');
    if Result = '' then
      Result := BBJsonString(Obj, 'message');
    if Result = '' then
      Result := BBJsonString(Obj, 'mensagem');
    if Result = '' then
      Result := BBJsonString(Obj, 'detail');
    if Result = '' then
      Result := E.Message;
  finally
    V.Free;
  end;
end;

function BBAmbienteApi: TBBApiAmbiente;
begin
  Result := bbProducao;
  dao.Geral5('select NFE_HOMOLOGACAO from configuracao');
  if (not dao.Q5.IsEmpty) and (UpperCase(Trim(dao.Q5.fieldbyname('NFE_HOMOLOGACAO').AsString)) = 'S') then
    Result := bbHomologacao;
end;

function BBAmbienteNome(AAmbiente: TBBApiAmbiente): string;
begin
  case AAmbiente of
    bbSandbox: Result := 'Sandbox';
    bbHomologacao: Result := 'Homologacao';
    bbProducao: Result := 'Producao';
  else
    Result := 'Desconhecido';
  end;
end;

procedure BBLogApi(const AMensagem: string);
begin
  try
    dao.grava_log('API BB COBRANCAS - ' + AMensagem, '');
  except
  end;
end;

function CEFAmbienteApi: TCEFApiAmbiente;
begin
  Result := cefProducao;
  dao.Geral5('select NFE_HOMOLOGACAO from configuracao');
  if (not dao.Q5.IsEmpty) and (UpperCase(Trim(dao.Q5.fieldbyname('NFE_HOMOLOGACAO').AsString)) = 'S') then
    Result := cefHomologacao;
end;

procedure CEFLogApi(const AMensagem: string);
begin
  try
    dao.grava_log('API CEF COBRANCAS - ' + AMensagem, '');
  except
  end;
end;

function BBBoletoRegistradoNaApi(Q: TFDQuery; out ADataPagamento: TDateTime; out AValorPago: Double): Boolean;
begin
  Result := Un_BB_Cobrancas_Api.BBBoletoRegistradoNaApi(Q, BBAmbienteApi,
    BB_COBRANCA_SCOPE, BBLogApi, ADataPagamento, AValorPago);
end;

function BoletoRegistradoNaApi(Q: TFDQuery; out ADataPagamento: TDateTime; out AValorPago: Double): Boolean;
var
  Banco: string;
begin
  Banco := BBOnlyNumbers(BBFieldStr(Q, 'nr_banco', ''));
  if (Banco = '1') or (Banco = '001') then
    Result := BBBoletoRegistradoNaApi(Q, ADataPagamento, AValorPago)
  else if Banco = '104' then
    Result := Un_CEF_Cobrancas_Api.CEFBoletoRegistradoNaApi(Q, CEFAmbienteApi,
      CEFLogApi, ADataPagamento, AValorPago)
  else
  begin
    ADataPagamento := 0;
    AValorPago := 0;
    Result := False;
  end;
end;
procedure BBMarcarBoletoRegistrado(AIdCR1: Integer; ADataPagamento: TDateTime; AValorPago: Double);
var
  SQL: string;
begin
  SQL := 'update cr1 set boleto_registrado = true';
  if (ADataPagamento > 0) and (AValorPago > 0) then
    SQL := SQL + ', dtarec = ' + QuotedStr(FormatDateTime('yyyy-mm-dd', ADataPagamento)) +
      ', valor_recebido = ' + StringReplace(FormatFloat('0.00', AValorPago), ',', '.', [rfReplaceAll]) +
      ', vlr_corrigido = ' + StringReplace(FormatFloat('0.00', AValorPago), ',', '.', [rfReplaceAll]);
  SQL := SQL + ' where id = ' + IntToStr(AIdCR1);

  dao.Execsql(SQL);
  BBLogApi('Update CR1 boleto registrado - id=' + IntToStr(AIdCR1) +
    ', pagamento=' + BoolToStr((ADataPagamento > 0) and (AValorPago > 0), True));
end;

constructor TConsultaBoletoApiWorker.Create(AOwner: Tfrm_remessa_boleto;
  AConnParams: TStrings; const ADriverName, ASQL: string; AWorkerIndex,
  AWorkerCount: Integer; ABBAmbiente: TBBApiAmbiente;
  ACEFAmbiente: TCEFApiAmbiente);
begin
  inherited Create(True);
  FreeOnTerminate := False;
  FOwner := AOwner;
  FConnParams := TStringList.Create;
  FConnParams.Assign(AConnParams);
  FDriverName := ADriverName;
  FSQL := ASQL;
  FWorkerIndex := AWorkerIndex;
  FWorkerCount := AWorkerCount;
  FBBAmbiente := ABBAmbiente;
  FCEFAmbiente := ACEFAmbiente;
end;

destructor TConsultaBoletoApiWorker.Destroy;
begin
  FConnParams.Free;
  inherited;
end;

procedure TConsultaBoletoApiWorker.SincronizarBoletoRegistrado;
begin
  BBMarcarBoletoRegistrado(FID, FDataPagamento, FValorPago);
  if FOwner.mmItens.Locate('ID', FID, []) then
  begin
    FOwner.mmItens.Edit;
    FOwner.mmItensBOLETO_REGISTRADO.AsBoolean := True;
    FOwner.mmItens.Post;
  end;
end;

procedure TConsultaBoletoApiWorker.SincronizarErro;
begin
  BBLogApi('CarregaItens verificar boleto registrado ERRO - cr1_id=' +
    IntToStr(FID) + ', erro=' + FErro);
end;

procedure TConsultaBoletoApiWorker.SincronizarProgresso;
begin
  fm_splash.ggProgress.AddProgress(1);
  fm_splash.Update;
end;

procedure TConsultaBoletoApiWorker.Execute;
var
  Conn: TFDConnection;
  Q: TFDQuery;
  BBApi: TBBApiCobrancas;
  CEFApi: TCEFApiCobrancas;
  Banco: string;
  IndiceCandidato: Integer;
  Registrado: Boolean;
begin
  CoInitialize(nil);
  Conn := nil;
  Q := nil;
  BBApi := nil;
  CEFApi := nil;
  try
    try
      Conn := TFDConnection.Create(nil);
      Conn.Params.Assign(FConnParams);
      Conn.DriverName := FDriverName;
      Conn.LoginPrompt := False;
      Conn.Connected := True;

      Q := TFDQuery.Create(nil);
      Q.Connection := Conn;
      Q.SQL.Text := FSQL;
      Q.Open;
      Q.FetchAll;

      IndiceCandidato := 0;
      Q.First;
      while not Q.Eof do
      begin
        if not Q.FieldByName('BOLETO_REGISTRADO').AsBoolean then
        begin
          if (IndiceCandidato mod FWorkerCount) = FWorkerIndex then
          begin
            FID := Q.FieldByName('id').AsInteger;
            FDataPagamento := 0;
            FValorPago := 0;
            Registrado := False;
            try
              Banco := BBOnlyNumbers(BBFieldStr(Q, 'nr_banco', ''));
              if (Banco = '1') or (Banco = '001') then
              begin
                if BBApi = nil then
                  BBApi := TBBApiCobrancas.Create;
                Registrado := Un_BB_Cobrancas_Api.BBBoletoRegistradoNaApiComApi(
                  Q, FBBAmbiente, BB_COBRANCA_SCOPE, nil, BBApi,
                  FDataPagamento, FValorPago);
              end
              else if Banco = '104' then
              begin
                if CEFApi = nil then
                  CEFApi := TCEFApiCobrancas.Create;
                Registrado := Un_CEF_Cobrancas_Api.CEFBoletoRegistradoNaApiComApi(
                  Q, FCEFAmbiente, nil, CEFApi, FDataPagamento, FValorPago);
              end;

              if Registrado then
                Synchronize(SincronizarBoletoRegistrado);
            except
              on E: Exception do
              begin
                FErro := E.Message;
                Synchronize(SincronizarErro);
              end;
            end;
            Synchronize(SincronizarProgresso);
          end;
          Inc(IndiceCandidato);
        end;
        Q.Next;
      end;
    except
      on E: Exception do
      begin
        FID := 0;
        FErro := 'Falha no worker ' + IntToStr(FWorkerIndex + 1) + ': ' + E.Message;
        Synchronize(SincronizarErro);
      end;
    end;
  finally
    CEFApi.Free;
    BBApi.Free;
    Q.Free;
    Conn.Free;
    CoUninitialize;
  end;
end;

procedure ConfigurarEncargosBB(ABoleto: TBBRegistroBoleto; AVencimento: TDateTime; AValor: Double);
begin
  ABoleto.JurosMora.Tipo := 1;
  ABoleto.JurosMora.Porcentagem := 0;
  ABoleto.JurosMora.Valor := AValor * 0.0017;

  ABoleto.Multa.Tipo := 2;
  ABoleto.Multa.Data := BBDate(AVencimento + 1);
  ABoleto.Multa.Porcentagem := 2;
  ABoleto.Multa.Valor := 0;
end;

procedure ConfigurarEncargosCEF(ABoleto: TCEFOperacaoBoleto; AVencimento: TDateTime; AValor: Double);
begin
  ABoleto.Titulo.JurosMora.Tipo := 'VALOR_POR_DIA';
  ABoleto.Titulo.JurosMora.Data := CEFDataApi(AVencimento + 1);
  ABoleto.Titulo.JurosMora.Valor := AValor * 0.0017;
  ABoleto.Titulo.JurosMora.Percentual := 0;

  ABoleto.Titulo.Multa.Data := CEFDataApi(AVencimento + 1);
  ABoleto.Titulo.Multa.Valor := 0;
  ABoleto.Titulo.Multa.Percentual := 2;
end;
procedure BBMessageDlgErroApi(const APrefixo: string; E: Exception);
var
  Msg: string;
begin
  Msg := BBMensagemErroApi(E);
  if Trim(APrefixo) <> '' then
    Msg := APrefixo + #13 + Msg;
  RegistrarErroAplicacao(E, 'BBMessageDlgErroApi', '', Msg);
  MessageDlg(Msg, mtError, [mbOK], 0);
end;
procedure Tfrm_remessa_boleto.CarregaRemessa;
var
  cmd: string;
begin
  cmd := '';
  cmd := ' SELECT a.ID, a.DIA, a.MES, a.ANO, a.DATA, a.CONTA FROM BOLETO_REMESSA_ORDEM a WHERE A.ID = '
    + PrID.text + ' AND A.CONTA = ' + PrCONTA.text;
  dao.Geral2(cmd);
  PrCONTA.text := dao.Q2.fieldbyname('CONTA').AsString;
  lbData.Caption := formatdatetime('dd/mm/yyyy', dao.Q2.fieldbyname('DATA').AsDateTime);
  BtSalvar.Enabled := formatdatetime('dd/mm/yyyy', dao.Q2.fieldbyname('DATA').AsDateTime) = formatdatetime('dd/mm/yyyy', now);

  PrCONTAExit(self);
  CarregaItens('ORDER BY TITULO, SEQUENCIA');
end;

procedure Tfrm_remessa_boleto.CarregaItens(ordem: string);
var
  cmd, cmd_conta, cmd_remessa: string;
  ConnParams: TStringList;
  ConnDriverName, MensagemPadraoLocal, StatusSplashAnterior: string;
  ImpressaoLocal: Boolean;
  BBAmbiente: TBBApiAmbiente;
  CEFAmbiente: TCEFApiAmbiente;
begin
  if FCarregandoItens then
    Exit;

  cmd_conta := ' 1 = 1 ';
  if PrID.Text <> '' then
    cmd_remessa := ' and coalesce(a.CONTA_BOLETO, v1.conta_boleto) = ' +
      PrCONTA.Text + ' and a.BOLETO_REMESSA_ORDEM = ' + PrID.Text
  else
    cmd_remessa := ' and a.BOLETO_REMESSA_ORDEM = 0 ';

  if PrCONTA.Text <> '' then
    cmd_conta := ' coalesce(a.CONTA_BOLETO, v1.conta_boleto) = ' + PrCONTA.Text;
  if PrID.Text = '' then
    cmd_conta := cmd_conta + ' and 1 = 1 ';

  cmd := ' select * from ( ' +
    ' select a.ID, a.COD_CLIENTE, a.NR_DOCUMENTO, a.TITULO, ' +
    ' a.SEQUENCIA, a.COD_EMPRESA, a.DTAVEN, a.VALOR, a.COD_FOP, a.Instrucao_boleto, ' +
    ' a.HISTORICO, a.DTAREC, a.VALOR_RECEBIDO, a.SALDO, a.DIAS_ATRASO, ' +
    ' a.VLR_CORRIGIDO, a.DESCONTO, a.NR_CUPOM, a.CONFERIDO, a.ID_REPRESENTANTE, ' +
    ' a.VLR_COMISSAO, a.ID_PLANO_CONTAS, a.SINCRONIZAR_PALM, a.EXTRATO, ' +
    ' a.VALOR_CORRIGIDO, a.BOLETO_REMESSA_ORDEM, a.BOLETO_RETORNO_CODIGO, a.CONTA_BOLETO, ' +
    ' a.BOLETO_RETORNO_DESCRICAO, c.nom_cliente, C.TIP_PESSOA, C.CNPJ, C.CPF, C.ENDERECO, A.DESCONTADA, coalesce(A.BOLETO_REGISTRADO, false) as BOLETO_REGISTRADO, ' +
    ' cc.api_key_cobranca, cc.client_id_cobranca, cc.client_secret_cobranca, cc.convenio, cc.codigo_cedente, cc.nr_agencia, emp.cnpj as cnpj_beneficiario, bb.nr_banco, ' +
    ' C.NR_ENDERECO, C.BAIRRO, CD.NOM_CIDADE, CD.UF, C.CEP, CASE WHEN C.IE IS NULL THEN 1 ELSE 0 END AS ISENTO ' +
    ' from cr1 a left join cliente c on c.cod_cliente = a.cod_cliente ' +
    ' inner join cidades cd on cd.COD_CIDADE = C.COD_CIDADE ' +
    ' left outer join vendas1 v1 on v1.NUMDOC = a.NR_DOCUMENTO ' +
    ' left outer join conta_corrente cc on cc.id = coalesce(a.conta_boleto, v1.conta_boleto) ' +
    ' left outer join banco bb on bb.id = cc.id_banco ' +
    ' left outer join empresa emp on emp.cod_empresa = cc.id_empresa ' +
    ' where ' + cmd_conta + ' and a.DTAREC is null and a.BOLETO_REMESSA_ORDEM is null ' +
    ' union ' +
    ' select a.ID, a.COD_CLIENTE, a.NR_DOCUMENTO, a.TITULO, ' +
    ' a.SEQUENCIA, a.COD_EMPRESA, a.DTAVEN, a.VALOR, a.COD_FOP, a.Instrucao_boleto, ' +
    ' a.HISTORICO, a.DTAREC, a.VALOR_RECEBIDO, a.SALDO, a.DIAS_ATRASO, ' +
    ' a.VLR_CORRIGIDO, a.DESCONTO, a.NR_CUPOM, a.CONFERIDO, a.ID_REPRESENTANTE, ' +
    ' a.VLR_COMISSAO, a.ID_PLANO_CONTAS, a.SINCRONIZAR_PALM, a.EXTRATO, ' +
    ' a.VALOR_CORRIGIDO, a.BOLETO_REMESSA_ORDEM, a.BOLETO_RETORNO_CODIGO, a.CONTA_BOLETO, ' +
    ' a.BOLETO_RETORNO_DESCRICAO, c.nom_cliente, C.TIP_PESSOA, C.CNPJ, C.CPF, C.ENDERECO, A.DESCONTADA, coalesce(A.BOLETO_REGISTRADO, false) as BOLETO_REGISTRADO, ' +
    ' cc.api_key_cobranca, cc.client_id_cobranca, cc.client_secret_cobranca, cc.convenio, cc.codigo_cedente, cc.nr_agencia, emp.cnpj as cnpj_beneficiario, bb.nr_banco, ' +
    ' C.NR_ENDERECO, C.BAIRRO, CD.NOM_CIDADE, CD.UF, C.CEP, CASE WHEN C.IE IS NULL THEN 1 ELSE 0 END AS ISENTO ' +
    ' from cr1 a left join cliente c on c.cod_cliente = a.cod_cliente ' +
    ' inner join cidades cd on cd.COD_CIDADE = C.COD_CIDADE ' +
    ' left outer join vendas1 v1 on v1.NUMDOC = a.NR_DOCUMENTO ' +
    ' left outer join conta_corrente cc on cc.id = coalesce(a.conta_boleto, v1.conta_boleto) ' +
    ' left outer join banco bb on bb.id = cc.id_banco ' +
    ' left outer join empresa emp on emp.cod_empresa = cc.id_empresa ' +
    ' where 1 = 1 ' + cmd_remessa + ') q1 ' + ordem;

  FCarregandoItens := True;
  ConnParams := TStringList.Create;
  ConnParams.Assign(dao.cn.Params);
  ConnDriverName := dao.cn.DriverName;
  MensagemPadraoLocal := mensagem_padrao;
  ImpressaoLocal := impressao_boleto;
  BBAmbiente := BBAmbienteApi;
  CEFAmbiente := CEFAmbienteApi;

  if not mmItens.Active then
    mmItens.Open;
  mmItens.DisableControls;
  mmItens.EmptyTable;
  totalselecionados := 0;
  tem_data_vcto_vencida := False;
  dgItens.Enabled := False;
  sPanel1.Enabled := False;
  sPanel2.Enabled := False;
  sPanel3.Enabled := False;
  BtBuscar.Enabled := False;
  Screen.Cursor := crSQLWait;
  StatusSplashAnterior := fm_splash.lbStatus.Caption;
  fm_splash.lbStatus.Caption := 'Carregando itens...';
  fm_splash.ggProgress.Progress := 0;
  fm_splash.ggProgress.MaxValue := 1;
  fm_splash.Show;
  fm_splash.Update;

  TThread.CreateAnonymousThread(
    procedure
    var
      ConnThread: TFDConnection;
      QThread: TFDQuery;
      Workers: array of TConsultaBoletoApiWorker;
      LDtaVen: TDateTime;
      LValor, LTotal: Double;
      LID, LNrDocumento, LSequencia, LIsento, LSelecionados: Integer;
      LVerificarCount, LWorkerCount, I: Integer;
      LTitulo, LCodCliente, LNomCliente, LTipoPessoa, LCNPJ, LCPF: string;
      LEndereco, LNrEndereco, LBairro, LNomCidade, LUF, LCEP: string;
      LInstrucao, LErro, LPilhaErro: string;
      LDescontada, LBoletoRegistrado, LCheck: Boolean;
      LAcao: Integer;
    begin
      CoInitialize(nil);
      ConnThread := nil;
      QThread := nil;
      LTotal := 0;
      LSelecionados := 0;
      LVerificarCount := 0;
      try
        try
          ConnThread := TFDConnection.Create(nil);
          ConnThread.Params.Assign(ConnParams);
          ConnThread.DriverName := ConnDriverName;
          ConnThread.LoginPrompt := False;
          ConnThread.Connected := True;

          QThread := TFDQuery.Create(nil);
          QThread.Connection := ConnThread;
          QThread.SQL.Text := cmd;
          QThread.Open;
          QThread.FetchAll;
          TThread.Synchronize(TThread.CurrentThread,
            procedure
            begin
              fm_splash.ggProgress.Progress := 0;
              if QThread.RecordCount > 0 then
                fm_splash.ggProgress.MaxValue := QThread.RecordCount
              else
                fm_splash.ggProgress.MaxValue := 1;
            end);

          QThread.First;
          while not QThread.Eof do
          begin
            LID := QThread.FieldByName('id').AsInteger;
            LNrDocumento := QThread.FieldByName('NR_DOCUMENTO').AsInteger;
            LTitulo := QThread.FieldByName('titulo').AsString;
            LSequencia := QThread.FieldByName('sequencia').AsInteger;
            LCodCliente := QThread.FieldByName('cod_cliente').AsString;
            LNomCliente := QThread.FieldByName('nom_cliente').AsString;
            LTipoPessoa := QThread.FieldByName('tip_pessoa').AsString;
            LCNPJ := QThread.FieldByName('cnpj').AsString;
            LCPF := QThread.FieldByName('cpf').AsString;
            LEndereco := QThread.FieldByName('endereco').AsString;
            LNrEndereco := QThread.FieldByName('nr_endereco').AsString;
            LBairro := QThread.FieldByName('bairro').AsString;
            LNomCidade := QThread.FieldByName('nom_cidade').AsString;
            LUF := QThread.FieldByName('uf').AsString;
            LCEP := QThread.FieldByName('cep').AsString;
            LDtaVen := QThread.FieldByName('dtaven').AsDateTime;
            LValor := QThread.FieldByName('valor').AsFloat;
            LIsento := QThread.FieldByName('ISENTO').AsInteger;
            LDescontada := QThread.FieldByName('DESCONTADA').AsString = '1';
            LBoletoRegistrado := QThread.FieldByName('BOLETO_REGISTRADO').AsBoolean;
            if not LBoletoRegistrado then
              Inc(LVerificarCount);
            LInstrucao := QThread.FieldByName('INSTRUCAO_BOLETO').AsString;
            if ImpressaoLocal then
              LInstrucao := LInstrucao + #13 + MensagemPadraoLocal;
            LCheck := not QThread.FieldByName('BOLETO_REMESSA_ORDEM').IsNull;
            if LCheck then
              Inc(LSelecionados);
            LTotal := LTotal + LValor;

            TThread.Synchronize(TThread.CurrentThread,
              procedure
              begin
                mmItens.Append;
                mmItensID.AsInteger := LID;
                mmItensNR_DOCUMENTO.AsInteger := LNrDocumento;
                mmItensTITULO.AsString := Copy(LTitulo, 1, mmItensTITULO.Size);
                mmItensSEQUENCIA.AsInteger := LSequencia;
                mmItensCOD_CLIENTE.AsString := Copy(LCodCliente, 1, mmItensCOD_CLIENTE.Size);
                mmItensNOM_CLIENTE.AsString := Copy(LNomCliente, 1, mmItensNOM_CLIENTE.Size);
                mmItensTIPO_PESSOA.AsString := Copy(LTipoPessoa, 1, mmItensTIPO_PESSOA.Size);
                mmItensCNPJ.AsString := Copy(LCNPJ, 1, mmItensCNPJ.Size);
                mmItensCPF.AsString := Copy(LCPF, 1, mmItensCPF.Size);
                mmItensENDERECO.AsString := Copy(LEndereco, 1, mmItensENDERECO.Size);
                mmItensNR_ENDERECO.AsString := Copy(LNrEndereco, 1, mmItensNR_ENDERECO.Size);
                mmItensBAIRRO.AsString := Copy(LBairro, 1, mmItensBAIRRO.Size);
                mmItensNOM_CIDADE.AsString := Copy(LNomCidade, 1, mmItensNOM_CIDADE.Size);
                mmItensUF.AsString := Copy(LUF, 1, mmItensUF.Size);
                mmItensCEP.AsString := Copy(LCEP, 1, mmItensCEP.Size);
                mmItensDTAVEN.AsDateTime := LDtaVen;
                mmItensVALOR.AsCurrency := LValor;
                mmItensISENTO.AsInteger := LIsento;
                mmItensDESCONTADA.AsBoolean := LDescontada;
                mmItensBOLETO_REGISTRADO.AsBoolean := LBoletoRegistrado;
                mmItensINSTRUCAO_BOLETO.AsString := Copy(LInstrucao, 1,
                  mmItensINSTRUCAO_BOLETO.Size);
                mmItensCheck.AsBoolean := LCheck;
                mmItens.Post;
                fm_splash.ggProgress.AddProgress(1);
                fm_splash.Update;
              end);
            QThread.Next;
          end;

          if LVerificarCount > 0 then
          begin
            LWorkerCount := (LVerificarCount + API_BOLETOS_POR_WORKER - 1) div
              API_BOLETOS_POR_WORKER;
            if LWorkerCount > API_MAX_WORKERS then
              LWorkerCount := API_MAX_WORKERS;
            if LVerificarCount < LWorkerCount then
              LWorkerCount := LVerificarCount;
            SetLength(Workers, LWorkerCount);
            TThread.Synchronize(TThread.CurrentThread,
              procedure
              begin
                fm_splash.lbStatus.Caption := 'Verificando registros na API...';
                fm_splash.ggProgress.Progress := 0;
                fm_splash.ggProgress.MaxValue := LVerificarCount;
                fm_splash.Update;
              end);
            try
              for I := 0 to LWorkerCount - 1 do
              begin
                Workers[I] := TConsultaBoletoApiWorker.Create(Self, ConnParams,
                  ConnDriverName, cmd, I, LWorkerCount, BBAmbiente, CEFAmbiente);
                Workers[I].Start;
              end;
              for I := 0 to LWorkerCount - 1 do
                Workers[I].WaitFor;
            finally
              for I := 0 to LWorkerCount - 1 do
                Workers[I].Free;
              SetLength(Workers, 0);
            end;
          end;

          TThread.Synchronize(TThread.CurrentThread,
            procedure
            begin
              totalselecionados := LSelecionados;
              if not mmItens.IsEmpty then
                mmItens.First;
              mmItens.EnableControls;
              lbTotalNFs.Caption := 'Boletos Relacionados: ' + IntToStr(LSelecionados);
              lbtotal.Caption := FormatFloat('R$ #,###,##0.00', LTotal);
              dgItens.Enabled := True;
              sPanel1.Enabled := True;
              sPanel2.Enabled := True;
              sPanel3.Enabled := True;
              BtBuscar.Enabled := True;
              Screen.Cursor := crDefault;
              fm_splash.Hide;
              fm_splash.lbStatus.Caption := StatusSplashAnterior;
              FCarregandoItens := False;
              LAcao := FAcaoAposCarga;
              FAcaoAposCarga := 0;
              if LAcao = 1 then
                ImprimirBoletosCarregados
              else if LAcao = 2 then
                GerarArquivoCarregado;
            end);
        except
          on E: Exception do
          begin
            LErro := E.Message;
            LPilhaErro := CapturarPilhaExcecaoAplicacao;
            TThread.Synchronize(TThread.CurrentThread,
              procedure
              begin
                mmItens.EnableControls;
                dgItens.Enabled := True;
                sPanel1.Enabled := True;
                sPanel2.Enabled := True;
                sPanel3.Enabled := True;
                BtBuscar.Enabled := True;
                Screen.Cursor := crDefault;
                fm_splash.Hide;
                fm_splash.lbStatus.Caption := StatusSplashAnterior;
                FCarregandoItens := False;
                FAcaoAposCarga := 0;
                RegistrarMensagemErroAplicacao(LErro,
                  'Tfrm_remessa_boleto.CarregaItens', cmd, '', LPilhaErro);
                MessageDlg('Houve um erro ao carregar os boletos!' + #13 + LErro,
                  mtError, [mbOK], 0);
              end);
          end;
        end;
      finally
        QThread.Free;
        ConnThread.Free;
        ConnParams.Free;
        CoUninitialize;
      end;
    end).Start;
end;
procedure Tfrm_remessa_boleto.PrCONTAExit(Sender: TObject);
begin
  if trim(PrCONTA.text) = '' then
    lbCCBoleto.Caption := '...'
  else
  begin
    dao.Geral2
      ('select c.id, e.cod_empresa, C.DIAS_PROTESTO, c.DIAS_BAIXAR, b.NOM_BANCO, b.NR_BANCO, c.mensagem_padrao, '
      + 'b.LAYOUT_REMESSA, c.nr_conta, c.codigo_cedente, c.nr_agencia, c.dta_abertura_conta, '
      + 'c.convenio, COALESCE(C.NOME_CORRENTISTA, E.NOM_EMPRESA) AS NOME_CORRENTISTA, C.CARTEIRA, e.CNPJ, e.ENDERECO, e.NR_ENDERECO, '
      + 'e.CEP, cd.NOM_CIDADE, cd.UF, c.tipo_cobranca, c.codigo_transmissao, C.MODALIDADE ' +
      'from conta_corrente c ' + 'inner join banco b on b.ID = c.ID_BANCO ' +
      'inner join empresa e on (e.COD_EMPRESA = c.ID_EMPRESA) ' +
      'inner join cidades cd on cd.COD_CIDADE = e.COD_CIDADE ' + 'where c.id=' +
      QuotedStr(PrCONTA.text));
    if dao.Q2.RecordCount > 0 then
    begin
      lbCCBoleto.Caption := dao.Q2.fieldbyname('nom_banco').AsString + ' - ' +
        dao.Q2.fieldbyname('nr_agencia').AsString + '/' +
        dao.Q2.fieldbyname('nr_conta').AsString;
      if dao.Q2.fieldbyname('LAYOUT_REMESSA').AsString = 'c240' then
        fmfun.ACBrBoleto1.LayoutRemessa := c240
      else
        fmfun.ACBrBoleto1.LayoutRemessa := c400;

      case dao.Q2.fieldbyname('nr_banco').AsInteger of
        1:
          begin
            fmfun.ACBrBoleto1.Banco.TipoCobranca := cobBancoDoBrasil;
            if dao.Q2.fieldbyname('tipo_cobranca').AsString = '1' then
              fmfun.ACBrBoleto1.Cedente.CaracTitulo := tcSimples;

            if dao.Q2.fieldbyname('tipo_cobranca').AsString = '2' then
              fmfun.ACBrBoleto1.Cedente.CaracTitulo := tcVinculada;

            if dao.Q2.fieldbyname('tipo_cobranca').AsString = '3' then
              fmfun.ACBrBoleto1.Cedente.CaracTitulo := tcDescontada;

            fmfun.ACBrBoleto1.Cedente.TipoCarteira := tctRegistrada;

            fmfun.ACBrBoleto1.Cedente.Modalidade :=  dao.Q2.fieldbyname('MODALIDADE').AsString;
          end;
        104:
          fmfun.ACBrBoleto1.Banco.TipoCobranca := cobCaixaEconomica;
        237:
          fmfun.ACBrBoleto1.Banco.TipoCobranca := cobBradesco;
        341:
          fmfun.ACBrBoleto1.Banco.TipoCobranca := cobItau;
        87:
          fmfun.ACBrBoleto1.Banco.TipoCobranca := cobBradesco;
        756:
          begin
            fmfun.ACBrBoleto1.Banco.TipoCobranca := cobBancoob;
            if dao.Q2.fieldbyname('tipo_cobranca').AsString = '1' then
              fmfun.ACBrBoleto1.Cedente.CaracTitulo := tcSimples;

            if dao.Q2.fieldbyname('tipo_cobranca').AsString = '2' then
              fmfun.ACBrBoleto1.Cedente.CaracTitulo := tcVinculada;

            if dao.Q2.fieldbyname('tipo_cobranca').AsString = '3' then
              fmfun.ACBrBoleto1.Cedente.CaracTitulo := tcDescontada;

            fmfun.ACBrBoleto1.Cedente.Modalidade := '01';
          end;
        33:
          begin
            fmfun.ACBrBoleto1.Banco.TipoCobranca := cobSantander;
            if dao.Q2.fieldbyname('tipo_cobranca').AsString = '1' then
              fmfun.ACBrBoleto1.Cedente.CaracTitulo := tcSimples;

            if dao.Q2.fieldbyname('tipo_cobranca').AsString = '2' then
              fmfun.ACBrBoleto1.Cedente.CaracTitulo := tcVinculada;

            if dao.Q2.fieldbyname('tipo_cobranca').AsString = '3' then
              fmfun.ACBrBoleto1.Cedente.CaracTitulo := tcDescontada;
          end;
        41:
          fmfun.ACBrBoleto1.Banco.TipoCobranca := cobBanrisul;

        85:
          fmfun.ACBrBoleto1.Banco.TipoCobranca := cobBancoCECRED;

      end;

      if pos('-', dao.Q2.fieldbyname('nr_agencia').AsString) > 0 then
      begin
        fmfun.ACBrBoleto1.Cedente.Agencia := copy(dao.Q2.fieldbyname('nr_agencia').AsString, 1, pos('-', dao.Q2.fieldbyname('nr_agencia').AsString) - 1);
        fmfun.ACBrBoleto1.Cedente.AgenciaDigito := copy(dao.Q2.fieldbyname('nr_agencia').AsString, pos('-', dao.Q2.fieldbyname('nr_agencia').AsString) + 1, 2);
      end
      else
        fmfun.ACBrBoleto1.Cedente.Agencia := dao.Q2.fieldbyname('nr_agencia').AsString;


      fmfun.ACBrBoleto1.Cedente.Conta := copy(dao.Q2.fieldbyname('nr_conta').AsString,
        1, pos('-', dao.Q2.fieldbyname('nr_conta').AsString) - 1);
      fmfun.ACBrBoleto1.Cedente.ContaDigito :=
        copy(dao.Q2.fieldbyname('nr_conta').AsString,
        pos('-', dao.Q2.fieldbyname('nr_conta').AsString) + 1, 2);

      if fmfun.ACBrBoleto1.Banco.TipoCobranca <> cobCaixaEconomica then
      begin
        fmfun.ACBrBoleto1.Cedente.CodigoCedente := dao.Q2.fieldbyname('codigo_cedente').AsString;
        fmfun.ACBrBoleto1.Cedente.Convenio := dao.Q2.fieldbyname('convenio').AsString;
      end
      else begin
        if Length(Trim(dao.Q2.fieldbyname('convenio').AsString)) >= 7 then
          fmfun.ACBrBoleto1.Cedente.CodigoCedente := FMFUN.enchezero(IntToStr(StrToIntDef(dao.Q2.fieldbyname('convenio').AsString, 0)), 7)
        else
          fmfun.ACBrBoleto1.Cedente.CodigoCedente := FMFUN.enchezero(IntToStr(StrToIntDef(dao.Q2.fieldbyname('codigo_cedente').AsString, 0)), 6);
        fmfun.ACBrBoleto1.Cedente.Convenio := FMFUN.enchezero(IntToStr(StrToIntDef(dao.Q2.fieldbyname('convenio').AsString, 0)), 6);
      end;

      fmfun.ACBrBoleto1.Cedente.Nome :=
        dao.Q2.fieldbyname('NOME_CORRENTISTA').AsString;
      fmfun.ACBrBoleto1.Cedente.Logradouro := dao.Q2.fieldbyname('ENDERECO').AsString;
      fmfun.ACBrBoleto1.Cedente.NumeroRes :=
        dao.Q2.fieldbyname('NR_ENDERECO').AsString;
      fmfun.ACBrBoleto1.Cedente.Cidade := dao.Q2.fieldbyname('NOM_CIDADE').AsString;
      fmfun.ACBrBoleto1.Cedente.UF := dao.Q2.fieldbyname('UF').AsString;

      dias_protesto := dao.Q2.fieldbyname('DIAS_PROTESTO').AsInteger;
      dias_baixa := dao.Q2.fieldbyname('DIAS_BAIXAR').AsInteger;
      carteira_conta := dao.Q2.fieldbyname('CARTEIRA').AsString;
      fmfun.ACBrBoleto1.Cedente.CNPJCPF := dao.Q2.fieldbyname('CNPJ').AsString;

      if dao.Q2.fieldbyname('nr_banco').AsInteger = 104 then
      begin
        fmfun.ACBrBoleto1.Cedente.Modalidade := FMFUN.enchezero(IntToStr(StrToIntDef(Trim(dao.Q2.fieldbyname('MODALIDADE').AsString), 1)), 2);
      end;

      if dao.Q2.fieldbyname('nr_banco').AsInteger = 33 then
      begin
        fmfun.ACBrBoleto1.Cedente.CodigoTransmissao :=
          dao.Q2.fieldbyname('codigo_transmissao').AsString;
        fmfun.ACBrBoleto1.Cedente.Modalidade := carteira_conta;
      end;

      if dao.Q2.fieldbyname('nr_banco').AsInteger = 87 then
      begin
        Boleto_Avalista := dao.Q2.fieldbyname('CNPJ').AsString + ' - CNPJ ' +
          dao.Q2.fieldbyname('CNPJ').AsString + ' ' +
          dao.Q2.fieldbyname('ENDERECO').AsString + ', ' +
          dao.Q2.fieldbyname('NR_ENDERECO').AsString + ' - ' +
          dao.Q2.fieldbyname('CEP').AsString + ', ' +
          dao.Q2.fieldbyname('NOM_CIDADE').AsString + '-' +
          dao.Q2.fieldbyname('UF').AsString;

        fmfun.ACBrBoleto1.Cedente.Nome := 'UNICRED LITORAL E NORTE CATARINENSE';
        fmfun.ACBrBoleto1.Cedente.Logradouro := 'RUA CAMBORI?, N? 519 - CENTRO';
        fmfun.ACBrBoleto1.Cedente.Bairro := 'CENTRO';
        fmfun.ACBrBoleto1.Cedente.Cidade := 'ITAJAI';
        fmfun.ACBrBoleto1.Cedente.UF := 'SC';
        fmfun.ACBrBoleto1.Cedente.CNPJCPF := '74114042000190';
        fmfun.ACBrBoleto1.Cedente.CEP := '80301451';
      end;
      mensagem_padrao := dao.Q2.fieldbyname('mensagem_padrao').AsString;
      CarregaItens('order by titulo, sequencia');
      BtGerarArquivo.enabled := fmfun.ACBrBoleto1.Cedente.Agencia <> '';
    end
    else // 4456324
    begin
      dao.msg('Registro n?o Encontrado!');
      PrCONTA.text := '';
      PrCONTA.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfrm_remessa_boleto.PrIDExit(Sender: TObject);
begin

  if trim(PrID.text) = '' then
    Exit;
  if trim(PrCONTA.text) = '' then
    Exit;

  CarregaRemessa;

  BtGerarArquivo.enabled := fmfun.ACBrBoleto1.Cedente.Agencia <> '';
  BtImprimir.enabled := true;
  BtBoleto.enabled := true;
end;

procedure Tfrm_remessa_boleto.PrCONTAButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  if not Assigned(Fr_localizar) then
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  // guardar os valores antigos
  chamou_form_old := '';
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Conta corrente';
  chamou_pesquisa := 'fr_conta_corrente';
  chamou_form := 'fr_cc_remessa';
  chamou_cadastro := 'Fr_conta_corrente';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Conta corrente';
  Fr_localizar.BT_cadastro.Visible := false;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 5);
  Campos_combo[0] := 'C?digo';
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
    if Assigned(Fr_localizar) then
    begin
      Fr_localizar.Free;
      Fr_localizar := nil;
    end;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure Tfrm_remessa_boleto.PrIDButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  if not Assigned(Fr_localizar) then
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  // guardar os valores antigos
  chamou_form_old := '';
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Remessa';
  chamou_pesquisa := 'frm_remessa_boleto';
  chamou_form := 'frm_remessa_boleto';
  chamou_cadastro := 'frm_remessa_boleto';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Conta corrente';
  Fr_localizar.BT_cadastro.Visible := false;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 4);
  Campos_combo[0] := 'Nº Remessa';
  Campos_combo[1] := 'Banco';
  Campos_combo[2] := 'Conta';
  Campos_combo[3] := 'Data';

  for i := 0 to 3 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  try
    Fr_localizar.ShowModal;
  finally
    if Assigned(Fr_localizar) then
    begin
      Fr_localizar.Free;
      Fr_localizar := nil;
    end;
  end;
  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
end;

procedure Tfrm_remessa_boleto.BtBuscarClick(Sender: TObject);
begin
  PrIDButtonClick(self);
end;

procedure Tfrm_remessa_boleto.btInserirClick(Sender: TObject);
begin
  modo_insert := true;
  PrID.enabled := false;
  PrID.Clear;
  PrCONTA.enabled := true;
  btInserir.enabled := false;
  BtSalvar.enabled := true;
  BtCancelar.enabled := true;
  BtBuscar.enabled := false;
  BtGerarArquivo.enabled := false;

  PrCONTA.SetFocus;
  mmItens.EmptyTable;
end;

procedure Tfrm_remessa_boleto.dgItensDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
  IsChecked: array [boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or
    DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  if Assigned(FBoletosFalhaRegistro) and
     (FBoletosFalhaRegistro.IndexOf(mmItensID.AsString) >= 0) then
    dgItens.Canvas.Font.Color := clRed
  else
    dgItens.Canvas.Font.Color := dgItens.Font.Color;

  if Column.Field.FieldName = 'BOLETO_REGISTRADO' then
  begin
    dgItens.Canvas.FillRect(Rect);
    if Column.Field.AsBoolean then
    begin
      DrawRect := Rect;
      DrawRect.Left := Rect.Left + ((Rect.Right - Rect.Left - 16) div 2);
      DrawRect.Top := Rect.Top + ((Rect.Bottom - Rect.Top - 16) div 2);
      DrawRect.Right := DrawRect.Left + 16;
      DrawRect.Bottom := DrawRect.Top + 16;
      DrawFrameControl(dgItens.Canvas.Handle, DrawRect, DFC_MENU, DFCS_MENUCHECK);
    end;
    Exit;
  end;

  dgItens.DefaultDrawDataCell(Rect, Column.Field, State);

  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = DBCheckBox1.DataField) then
    begin
      DBCheckBox1.Left := Rect.Left + dgItens.Left + 2;
      DBCheckBox1.Top := Rect.Top + dgItens.Top + 2;
      DBCheckBox1.Width := Rect.Right - Rect.Left;
      DBCheckBox1.Height := Rect.Bottom - Rect.Top;

      DBCheckBox1.Visible := true;
    end;
    if (Column.Field.FieldName = DBCheckBox2.DataField) then
    begin
      DBCheckBox2.Left := Rect.Left + dgItens.Left + 2;
      DBCheckBox2.Top := Rect.Top + dgItens.Top + 2;
      DBCheckBox2.Width := Rect.Right - Rect.Left;
      DBCheckBox2.Height := Rect.Bottom - Rect.Top;

      DBCheckBox2.Visible := true;
    end;

  end
  else
  begin
    if (Column.Field.FieldName = DBCheckBox1.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := IsChecked[Column.Field.AsBoolean];

      dgItens.Canvas.FillRect(Rect);
      DrawFrameControl(dgItens.Canvas.Handle, DrawRect, DFC_BUTTON, DrawState);
    end;

    if (Column.Field.FieldName = DBCheckBox2.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := IsChecked[Column.Field.AsBoolean];

      dgItens.Canvas.FillRect(Rect);
      DrawFrameControl(dgItens.Canvas.Handle, DrawRect, DFC_BUTTON, DrawState);
    end;

  end;
end;

procedure Tfrm_remessa_boleto.MontaArquivoCobrancaEnvio;
var
  txt: TextFile;
  dia, mes, ano, ord, ext, pathSaida, tempFile, nosso_numero, nosso_numero_div,
    sql_cliente, dir_remessa: string;
  sequencial_arquivo: Integer;
begin
  pathSaida := ExtractFilePath(Application.ExeName);
  tempFile := pathSaida + 'temp.txt';
  dia := formatdatetime('dd', now);
  mes := formatdatetime('mm', now);
  ano := formatdatetime('yy', now);

  if dao.CN.params.values['database'] = 'C:\orbi\trunk\dados\orbi.fdb' then
    ext := '.TST'
  else
    ext := '.REM';

  if remessa_arquivo <> '' then
  begin
    dir_remessa := ExtractFilePath(remessa_arquivo);
    arquivo := ExtractFileName(remessa_arquivo);
  end
  else
  begin
    dir_remessa := pathSaida + fmfun.ACBrBoleto1.Banco.Nome + '_' + PrCONTA.text + '\\';
    if not DirectoryExists(dir_remessa) then
      ForceDirectories(dir_remessa);

    if fmfun.ACBrBoleto1.Banco.TipoCobranca = cobItau then
      arquivo := PrID.text + ext
    else
      arquivo := 'CB' + dia + mes + PrID.text + ext;
  end;

  fmfun.ACBrBoleto1.DirArqRemessa := dir_remessa;
  fmfun.ACBrBoleto1.NomeArqRemessa := arquivo;

  // CABE?ALHO 0
  sequencial_arquivo := 1;
  mmItens.First;
  fmfun.ACBrBoleto1.ListadeBoletos.Clear;
  while not mmItens.Eof do
  begin
    if mmItensCheck.Value = true then
    begin
      fmfun.MontaCobrancaItem(mmItensNOM_CLIENTE.AsString,
        mmItensTIPO_PESSOA.AsString, mmItensCNPJ.AsString, mmItensCPF.AsString,
        mmItensENDERECO.AsString, mmItensNR_ENDERECO.AsString,
        mmItensBAIRRO.AsString, mmItensNOM_CIDADE.AsString, mmItensUF.AsString,
        mmItensCEP.AsString, carteira_conta, Boleto_Avalista,
        mmItensTITULO.AsString, mmItensSEQUENCIA.AsString,
        mmItensINSTRUCAO_BOLETO.AsString, mmItensDTAVEN.AsDateTime, dias_protesto,
        dias_baixa, mmItensISENTO.AsInteger, mmItensVALOR.Value);
    end;
    mmItens.Next;
  end;

  mmItens.First;
  if trim(PrID.text) = '' then
    Exit;

  fmfun.ACBrBoleto1.GerarRemessa(strtoint(PrID.text));
  showmessage('Remessa gerada com sucesso.')
end;

procedure Tfrm_remessa_boleto.AbrirClientesParaCorrigirCep(AClientes: TStrings);
var
  I: Integer;
begin
  if AClientes = nil then
    Exit;

  for I := 0 to AClientes.Count - 1 do
  begin
    if Assigned(Fr_Cliente) then
      FreeAndNil(Fr_Cliente);
    Application.CreateForm(TFr_Cliente, Fr_Cliente);
    try
      Fr_Cliente.dados_incompletos := True;
      Fr_Cliente.cliente := AClientes[I];
      Fr_Cliente.ShowModal;
    finally
      FreeAndNil(Fr_Cliente);
    end;
  end;
end;
destructor Tfrm_remessa_boleto.Destroy;
begin
  if frm_remessa_boleto = Self then
    frm_remessa_boleto := nil;
  FBoletosFalhaRegistro.Free;
  inherited;
end;
procedure Tfrm_remessa_boleto.FinalizarRegistroBoletos;
begin
  PrCONTA.Enabled := False;
  btInserir.Enabled := True;
  BtSalvar.Enabled := False;
  BtCancelar.Enabled := False;
  BtBuscar.Enabled := True;
  BtGerarArquivo.Enabled := fmfun.ACBrBoleto1.Cedente.Agencia <> '';
  BtImprimir.Enabled := True;
  BtBoleto.Enabled := True;
end;

procedure Tfrm_remessa_boleto.RegistrarBoletosApi(const ListaBoletos: string);
var
  ConnParams: TStringList;
  ConnDriverName, StatusSplashAnterior: string;
  Ambiente: TBBApiAmbiente;
  AmbienteCEF: TCEFApiAmbiente;
begin
  if Trim(ListaBoletos) = '' then
  begin
    FinalizarRegistroBoletos;
    Exit;
  end;
  if FRegistrandoBoletos then
    Exit;

  if FBoletosFalhaRegistro = nil then
    FBoletosFalhaRegistro := TStringList.Create
  else
    FBoletosFalhaRegistro.Clear;

  ConnParams := TStringList.Create;
  ConnParams.Assign(dao.cn.Params);
  ConnDriverName := dao.cn.DriverName;
  Ambiente := BBAmbienteApi;
  AmbienteCEF := CEFAmbienteApi;
  FRegistrandoBoletos := True;

  sPanel1.Enabled := False;
  sPanel2.Enabled := False;
  sPanel3.Enabled := False;
  dgItens.Enabled := False;
  Screen.Cursor := crSQLWait;
  StatusSplashAnterior := fm_splash.lbStatus.Caption;
  fm_splash.lbStatus.Caption := 'Registrando boletos na API...';
  fm_splash.ggProgress.Progress := 0;
  fm_splash.ggProgress.MaxValue := 1;
  fm_splash.Show;
  fm_splash.Update;

  TThread.CreateAnonymousThread(
    procedure
    var
      ConnThread: TFDConnection;
      Q: TFDQuery;
      Api: TBBApiCobrancas;
      ApiCEF: TCEFApiCobrancas;
      Boleto: TBBRegistroBoleto;
      BoletoCEF: TCEFOperacaoBoleto;
      HeaderCEF: TCEFHeader;
      Resposta: TBBRespostaRegistroBoleto;
      RespostaCEF: TCEFRespostaServico;
      Banco, ApiKey, ClientId, ClientSecret, DocPagador: string;
      TituloCliente, CodigoBeneficiarioCEF, NossoNumeroCEF: string;
      LErro, LLog, LPilhaErro: string;
      VariacaoCarteira, LID: Integer;
      LDataPagamento: TDateTime;
      LValorPago: Double;
      JaRegistrado: Boolean;
      Falhas, FalhasIds, ClientesCep: TStringList;
      LIdentificacao: string;
    begin
      CoInitialize(nil);
      ConnThread := nil;
      Q := nil;
      Falhas := TStringList.Create;
      FalhasIds := TStringList.Create;
      ClientesCep := TStringList.Create;
      ClientesCep.Sorted := True;
      ClientesCep.Duplicates := dupIgnore;
      try
        try
          ConnThread := TFDConnection.Create(nil);
          ConnThread.Params.Assign(ConnParams);
          ConnThread.DriverName := ConnDriverName;
          ConnThread.LoginPrompt := False;
          ConnThread.Connected := True;

          Q := TFDQuery.Create(nil);
          Q.Connection := ConnThread;
          Q.SQL.Text :=
            'select cr.id, cr.titulo, cr.sequencia, cr.dtaven, cr.valor, ' +
            ' c.api_key_cobranca, c.client_id_cobranca, c.client_secret_cobranca, ' +
            ' c.convenio, c.codigo_cedente, c.nr_agencia, emp.cnpj as cnpj_beneficiario, c.carteira, c.modalidade, c.tipo_cobranca, c.dias_protesto, b.nr_banco, ' +
            ' cl.cod_cliente, cl.tip_pessoa, cl.nom_cliente, cl.cnpj, cl.cpf, cl.endereco, cl.nr_endereco, ' +
            ' cl.bairro, cl.cep, cl.telefone, cl.email, cd.nom_cidade, cd.uf ' +
            'from cr1 cr inner join conta_corrente c on c.id = cr.conta_boleto ' +
            'inner join banco b on b.id = c.id_banco ' +
            'inner join empresa emp on emp.cod_empresa = c.id_empresa ' +
            'inner join cliente cl on cl.cod_cliente = cr.cod_cliente ' +
            'left join cidades cd on cd.cod_cidade = cl.cod_cidade ' +
            'where cr.id in (' + ListaBoletos + ') order by cr.titulo, cr.sequencia';
          Q.Open;
          Q.FetchAll;
          TThread.Synchronize(nil,
            procedure
            begin
              if (not Assigned(frm_remessa_boleto)) or (frm_remessa_boleto <> Self) then
                Exit;
              if Q.RecordCount > 0 then
                fm_splash.ggProgress.MaxValue := Q.RecordCount
              else
                fm_splash.ggProgress.MaxValue := 1;
            end);

          Q.First;
          while not Q.Eof do
          begin
            LID := Q.FieldByName('id').AsInteger;
            Banco := BBOnlyNumbers(BBFieldStr(Q, 'nr_banco', ''));
            ApiKey := Trim(BBFieldStr(Q, 'api_key_cobranca', ''));
            ClientId := Trim(BBFieldStr(Q, 'client_id_cobranca', ''));
            ClientSecret := Trim(BBFieldStr(Q, 'client_secret_cobranca', ''));
            LIdentificacao := 'cr1_id=' + IntToStr(LID) +
              ', titulo=' + BBFieldStr(Q, 'titulo', '') + '-' +
              BBFieldStr(Q, 'sequencia', '') + ', banco=' + Banco;

            try
            if ((Banco = '1') or (Banco = '001')) and (ApiKey <> '') and
               (ClientId <> '') and (ClientSecret <> '') then
            begin
              Boleto := TBBRegistroBoleto.Create;
              Api := TBBApiCobrancas.Create;
              try
                Api.Ambiente := Ambiente;
                Api.AppKey := ApiKey;
                Api.ObterTokenClientCredentials(ClientId, ClientSecret,
                  BB_COBRANCA_SCOPE).Free;

                if UpperCase(Trim(BBFieldStr(Q, 'tip_pessoa', ''))) = 'J' then
                begin
                  if Ambiente = bbProducao then
                    DocPagador := BBOnlyNumbers(BBFieldStr(Q, 'cnpj', ''))
                  else
                    DocPagador := '00000000000191';
                  Boleto.Pagador.TipoInscricao := 2;
                end
                else
                begin
                  if Ambiente = bbProducao then
                    DocPagador := BBOnlyNumbers(BBFieldStr(Q, 'cpf', ''))
                  else
                    DocPagador := '00000000191';
                  Boleto.Pagador.TipoInscricao := 1;
                end;

                TituloCliente := BBNumeroTituloCliente(Q);
                if Length(TituloCliente) <> 20 then
                  raise Exception.Create('Numero titulo cliente do Banco do Brasil invalido. Verifique o convenio e o titulo do boleto.');
                Boleto.NumeroConvenio := StrToInt64Def(BBOnlyNumbers(BBFieldStr(Q, 'convenio', '')), 0);
                Boleto.NumeroCarteira := StrToIntDef(BBOnlyNumbers(BBFieldStr(Q, 'carteira', '')), 0);
                VariacaoCarteira := StrToIntDef(BBOnlyNumbers(BBFieldStr(Q, 'modalidade', '')), 19);
                Boleto.NumeroVariacaoCarteira := VariacaoCarteira;
                Boleto.CodigoModalidade := 1;
                Boleto.DataEmissao := BBDate(Date);
                Boleto.DataVencimento := BBDate(BBFieldDate(Q, 'dtaven'));
                Boleto.ValorOriginal := BBFieldFloat(Q, 'valor');
                ConfigurarEncargosBB(Boleto, BBFieldDate(Q, 'dtaven'), Boleto.ValorOriginal);
                Boleto.CodigoAceite := 'N';
                Boleto.CodigoTipoTitulo := 2;
                Boleto.DescricaoTipoTitulo := 'DM';
                Boleto.IndicadorPermissaoRecebimentoParcial := 'N';
                Boleto.NumeroTituloBeneficiario := BBNumeroTituloBeneficiario(Q);
                Boleto.NumeroTituloCliente := BBMontarCampoNossoNumero(Q);
                Boleto.Pagador.NumeroInscricao := StrToInt64Def(DocPagador, 0);
                Boleto.Pagador.Nome := Copy(BBFieldStr(Q, 'nom_cliente', ''), 1, 60);
                Boleto.Pagador.Endereco := Copy(Trim(BBFieldStr(Q, 'endereco', '') + ', ' + BBFieldStr(Q, 'nr_endereco', '')), 1, 60);
                Boleto.Pagador.Cep := StrToIntDef(BBOnlyNumbers(BBFieldStr(Q, 'cep', '')), 0);
                Boleto.Pagador.Cidade := Copy(BBFieldStr(Q, 'nom_cidade', ''), 1, 30);
                Boleto.Pagador.Bairro := Copy(BBFieldStr(Q, 'bairro', ''), 1, 30);
                Boleto.Pagador.Uf := Copy(BBFieldStr(Q, 'uf', ''), 1, 2);
                Boleto.Pagador.Telefone := Copy(BBOnlyNumbers(BBFieldStr(Q, 'telefone', '')), 1, 15);
                Boleto.Pagador.Email := Copy(BBFieldStr(Q, 'email', ''), 1, 60);

                JaRegistrado := False;
                LDataPagamento := 0;
                LValorPago := 0;
                try
                  JaRegistrado := Un_BB_Cobrancas_Api.BBBoletoRegistradoNaApi(
                    Q, Ambiente, BB_COBRANCA_SCOPE, nil,
                    LDataPagamento, LValorPago);
                except
                  JaRegistrado := False;
                end;
                if JaRegistrado then
                begin
                  TThread.Synchronize(nil,
                    procedure
                    begin
                      BBMarcarBoletoRegistrado(LID, LDataPagamento, LValorPago);
                      BBLogApi('Registrar boleto ignorado, ja registrado - ambiente=' +
                        BBAmbienteNome(Ambiente) + ', cr1_id=' + IntToStr(LID) +
                        ', titulo=' + TituloCliente);
                    end);
                end
                else
                begin
                  Resposta := Api.RegistrarBoleto(Boleto);
                  Resposta.Free;
                  TThread.Synchronize(nil,
                    procedure
                    begin
                      BBMarcarBoletoRegistrado(LID, 0, 0);
                      BBLogApi('Registrar boleto OK - ambiente=' +
                        BBAmbienteNome(Ambiente) + ', cr1_id=' + IntToStr(LID) +
                        ', titulo=' + TituloCliente);
                    end);
                end;
              finally
                Api.Free;
                Boleto.Free;
              end;
            end
            else if Banco = '104' then
            begin
              CodigoBeneficiarioCEF := CEFCodigoBeneficiarioApi(Q);
              NossoNumeroCEF := CEFMontarNossoNumeroApi(Q);
              if (CodigoBeneficiarioCEF <> '') and (NossoNumeroCEF <> '') and
                 (CEFCNPJBeneficiarioApi(Q) <> '') then
              begin
                JaRegistrado := False;
                LDataPagamento := 0;
                LValorPago := 0;
                try
                  JaRegistrado := Un_CEF_Cobrancas_Api.CEFBoletoRegistradoNaApi(
                    Q, AmbienteCEF, nil, LDataPagamento, LValorPago);
                except
                  JaRegistrado := False;
                end;

                if JaRegistrado then
                begin
                  TThread.Synchronize(nil,
                    procedure
                    begin
                      BBMarcarBoletoRegistrado(LID, LDataPagamento, LValorPago);
                      CEFLogApi('Registrar boleto ignorado, ja registrado - ambiente=' +
                        CEFAmbienteNome(AmbienteCEF) + ', cr1_id=' + IntToStr(LID) +
                        ', nosso_numero=' + NossoNumeroCEF);
                    end);
                end
                else
                begin
                  BoletoCEF := TCEFOperacaoBoleto.Create;
                  HeaderCEF := nil;
                  ApiCEF := TCEFApiCobrancas.Create;
                  try
                    ApiCEF.Ambiente := AmbienteCEF;
                    BoletoCEF.CodigoBeneficiario := CodigoBeneficiarioCEF;
                    BoletoCEF.Titulo.NossoNumero := NossoNumeroCEF;
                    BoletoCEF.Titulo.NumeroDocumento := BBNumeroTituloBeneficiario(Q);
                    BoletoCEF.Titulo.DataVencimento := CEFDataApi(BBFieldDate(Q, 'dtaven'));
                    BoletoCEF.Titulo.Valor := BBFieldFloat(Q, 'valor');
                    ConfigurarEncargosCEF(BoletoCEF, BBFieldDate(Q, 'dtaven'), BoletoCEF.Titulo.Valor);
                    if StrToIntDef(BBFieldStr(Q, 'dias_protesto', ''), 0) > 0 then
                    begin
                      BoletoCEF.Titulo.PosVencimento.Acao := 'PROTESTAR';
                      BoletoCEF.Titulo.PosVencimento.NumeroDias :=
                        StrToIntDef(BBFieldStr(Q, 'dias_protesto', ''), 0);
                    end;
                    BoletoCEF.Titulo.TipoEspecie := '99';
                    BoletoCEF.Titulo.FlagAceite := 'N';
                    BoletoCEF.Titulo.DataEmissao := CEFDataApi(Date);
                    if UpperCase(Trim(BBFieldStr(Q, 'tip_pessoa', ''))) = 'J' then
                    begin
                      BoletoCEF.Titulo.Pagador.CNPJ := BBOnlyNumbers(BBFieldStr(Q, 'cnpj', ''));
                      BoletoCEF.Titulo.Pagador.RazaoSocial := Copy(BBFieldStr(Q, 'nom_cliente', ''), 1, 40);
                    end
                    else
                    begin
                      BoletoCEF.Titulo.Pagador.CPF := BBOnlyNumbers(BBFieldStr(Q, 'cpf', ''));
                      BoletoCEF.Titulo.Pagador.Nome := Copy(BBFieldStr(Q, 'nom_cliente', ''), 1, 40);
                    end;
                    BoletoCEF.Titulo.Pagador.Endereco.Logradouro := Copy(Trim(BBFieldStr(Q, 'endereco', '') + ', ' + BBFieldStr(Q, 'nr_endereco', '')), 1, 40);
                    BoletoCEF.Titulo.Pagador.Endereco.Bairro := Copy(BBFieldStr(Q, 'bairro', ''), 1, 15);
                    BoletoCEF.Titulo.Pagador.Endereco.Cidade := Copy(BBFieldStr(Q, 'nom_cidade', ''), 1, 15);
                    BoletoCEF.Titulo.Pagador.Endereco.UF := Copy(BBFieldStr(Q, 'uf', ''), 1, 2);
                    BoletoCEF.Titulo.Pagador.Endereco.CEP := CEFNormalizarCEP(BBFieldStr(Q, 'cep', ''));
                    if Length(BoletoCEF.Titulo.Pagador.Endereco.CEP) <> 8 then
                      raise Exception.Create('CEP invalido para registro do boleto CEF: ' +
                        BoletoCEF.Titulo.Pagador.Endereco.CEP);
                    HeaderCEF := CEFNovoHeaderApi(Q, CodigoBeneficiarioCEF,
                      NossoNumeroCEF, BBFieldDate(Q, 'dtaven'),
                      BBFieldFloat(Q, 'valor'), True);
                    RespostaCEF := ApiCEF.IncluirBoleto(BoletoCEF, HeaderCEF);
                    try
                      if not RespostaCEF.Sucesso then
                      begin
                        LLog := Trim(RespostaCEF.ControleMensagem);
                        if Trim(RespostaCEF.MsgRetorno) <> '' then
                        begin
                          if LLog <> '' then
                            LLog := LLog + ' - ';
                          LLog := LLog + Trim(RespostaCEF.MsgRetorno);
                        end;
                        if Trim(RespostaCEF.Excecao) <> '' then
                        begin
                          if LLog <> '' then
                            LLog := LLog + ' - ';
                          LLog := LLog + Trim(RespostaCEF.Excecao);
                        end;
                        if LLog = '' then
                          LLog := 'Retorno sem mensagem';
                        LLog := 'codigo=' + RespostaCEF.CodRetorno +
                          ', codigo_negocial=' + RespostaCEF.ControleCodRetorno +
                          ', mensagem=' + LLog;

                        raise Exception.Create('Erro API CEF: ' + LLog +
                          ', CEP enviado=' + BoletoCEF.Titulo.Pagador.Endereco.CEP);
                      end;
                    finally
                      RespostaCEF.Free;
                    end;
                    TThread.Synchronize(nil,
                      procedure
                      begin
                        BBMarcarBoletoRegistrado(LID, 0, 0);
                        CEFLogApi('Registrar boleto OK - ambiente=' +
                          CEFAmbienteNome(AmbienteCEF) + ', cr1_id=' + IntToStr(LID) +
                          ', nosso_numero=' + NossoNumeroCEF);
                      end);
                  finally
                    ApiCEF.Free;
                    HeaderCEF.Free;
                    BoletoCEF.Free;
                  end;
                end;
              end
              else
                raise Exception.Create('Configuracao CEF incompleta: beneficiario, nosso numero ou CNPJ do beneficiario nao informado');
            end
            else if (Banco = '1') or (Banco = '001') then
              raise Exception.Create('Credenciais da API do Banco do Brasil nao informadas');
            except
              on E: Exception do
              begin
                Falhas.Add(LIdentificacao + ', causa=' + E.Message);
                if FalhasIds.IndexOf(IntToStr(LID)) < 0 then
                  FalhasIds.Add(IntToStr(LID));
                if (Pos('(43)', UpperCase(E.Message)) > 0) and
                   (Pos('CEP NAO ENCONTRADO', UpperCase(E.Message)) > 0) and
                   (Trim(BBFieldStr(Q, 'cod_cliente', '')) <> '') then
                  ClientesCep.Add(Trim(BBFieldStr(Q, 'cod_cliente', '')));
              end;
            end;

            TThread.Synchronize(nil,
              procedure
              begin
              if (not Assigned(frm_remessa_boleto)) or (frm_remessa_boleto <> Self) then
                Exit;
                fm_splash.ggProgress.AddProgress(1);
                fm_splash.Update;
              end);
            Q.Next;
          end;

          TThread.Synchronize(TThread.CurrentThread,
            procedure
            begin
              if (not Assigned(frm_remessa_boleto)) or (frm_remessa_boleto <> Self) or
                 (not Assigned(fm_splash)) or Application.Terminated then
                Exit;
              FBoletosFalhaRegistro.Assign(FalhasIds);
              if Falhas.Count > 0 then
              begin
                try
                  dao.grava_log('API COBRANCAS - Registro finalizado com ' +
                    IntToStr(Falhas.Count) + ' boleto(s) nao registrado(s):' +
                    #13#10 + Falhas.Text, '');
                except
                end;
              end;
              fm_splash.Hide;
              fm_splash.lbStatus.Caption := StatusSplashAnterior;
              Screen.Cursor := crDefault;
              sPanel1.Enabled := True;
              sPanel2.Enabled := True;
              sPanel3.Enabled := True;
              dgItens.Enabled := True;
              FRegistrandoBoletos := False;
              if Falhas.Count > 0 then
                MessageDlg('O registro dos boletos foi concluido com ' +
                  IntToStr(Falhas.Count) + ' falha(s):' + #13#10#13#10 +
                  Falhas.Text, mtWarning, [mbOK], 0);
              FinalizarRegistroBoletos;
              if ClientesCep.Count > 0 then
                AbrirClientesParaCorrigirCep(ClientesCep);
              CarregaItens('ORDER BY TITULO, SEQUENCIA');
            end);
        except
          on E: Exception do
          begin
            LErro := E.Message;
            LPilhaErro := CapturarPilhaExcecaoAplicacao;
            TThread.Synchronize(nil,
              procedure
              begin
                if (not Assigned(frm_remessa_boleto)) or (frm_remessa_boleto <> Self) then
                  Exit;
                fm_splash.Hide;
                fm_splash.lbStatus.Caption := StatusSplashAnterior;
                Screen.Cursor := crDefault;
                sPanel1.Enabled := True;
                sPanel2.Enabled := True;
                sPanel3.Enabled := True;
                dgItens.Enabled := True;
                FRegistrandoBoletos := False;
                BtSalvar.Enabled := True;
                RegistrarMensagemErroAplicacao(LErro,
                  'Tfrm_remessa_boleto.RegistrarBoletosApi', '', '', LPilhaErro);
                MessageDlg('Houve um erro ao registrar boletos na API!' +
                  #13 + LErro, mtError, [mbOK], 0);
              end);
          end;
        end;
      finally
        ClientesCep.Free;
        FalhasIds.Free;
        Falhas.Free;
        Q.Free;
        ConnThread.Free;
        ConnParams.Free;
        CoUninitialize;
      end;
    end).Start;
end;
procedure Tfrm_remessa_boleto.BtSalvarClick(Sender: TObject);
var
  cmd, dia, mes, ano, data_str, boletos, boletos_descontados,
    boletos_n_descontados: string;
  extrato, Conta_Receber: Integer;
begin
  if PrID.text <> '' then
  begin
    dao.cn.StartTransaction;
    dao.Execsql
      ('UPDATE CR1 SET BOLETO_REMESSA_ORDEM = NULL WHERE conta_boleto = ' +
      PrCONTA.text + ' and BOLETO_REMESSA_ORDEM = ' + PrID.text);
    dao.cn.Commit;
  end;

  boletos := '';
  boletos_descontados := '';
  boletos_n_descontados := '';
  mmItens.First;
  while not mmItens.Eof do
  begin
    if mmItensCheck.Value = true then
      boletos := boletos + mmItensID.AsString + ',';

    { FMFUN.ExcluirExtratoConta(mmItensID.AsString, 'C', mmItensVALOR.Value); }
    if mmItensDESCONTADA.Value = true then
    begin
      boletos_descontados := boletos_descontados + mmItensID.AsString + ',';
      {
        extrato := FMFUN.GravaExtrato('DESCONTO ESCRITURAL REF. AO T?TULO: ' +
        mmItensTITULO.AsString + '-' + mmItensSEQUENCIA.AsString,
        QuotedStr(formatdatetime('dd/mm/yyyy', now)), PrCONTA.text, 'C',
        mmItensVALOR.Value, 2);
        FMFUN.GravaExtratoConta(extrato, mmItensID.Value, 2); }
    end
    else
      boletos_n_descontados := boletos_n_descontados + mmItensID.AsString + ',';
    mmItens.Next;
  end;
  mmItens.First;
  // dao.cn.Commit;
  // MontaArquivoCobrancaEnvio;
  boletos := copy(boletos, 1, length(boletos) - 1);
  boletos_descontados := copy(boletos_descontados, 1,
    length(boletos_descontados) - 1);
  boletos_n_descontados := copy(boletos_n_descontados, 1,
    length(boletos_n_descontados) - 1);
  if boletos <> '' then
    SetarBoletos(boletos);

  if boletos_descontados <> '' then
    SetaBoletosDescontados(boletos_descontados, true);

  if boletos_n_descontados <> '' then
    SetaBoletosDescontados(boletos_n_descontados, false);

  if boletos <> '' then
    RegistrarBoletosApi(boletos)
  else
    FinalizarRegistroBoletos;
end;

procedure Tfrm_remessa_boleto.SetaBoletosDescontados(listaboletos: string;
  descontar: boolean);
begin
  dao.cn.StartTransaction;
  if descontar then
    dao.Execsql('UPDATE CR1 SET DESCONTADA = ''1'' WHERE ID in (' +
      listaboletos + ')')
  else
    dao.Execsql('UPDATE CR1 SET DESCONTADA = ''0'' WHERE ID in (' +
      listaboletos + ')');
  dao.cn.Commit;
end;

procedure Tfrm_remessa_boleto.SetarBoletos(listaboletos: string);
var
  cmd, dia, mes, ano, data_str: string;
begin
  if modo_insert then
  begin
    // dao.Geral4('SELECT GEN_ID(GEN_BOLETO_REMESSA_ORDEM, 1) as ordem FROM RDB$DATABASE');
    dao.Geral4
      ('SELECT max(a.ID)+1 as ordem FROM BOLETO_REMESSA_ORDEM a where a.CONTA = '
      + PrCONTA.text);
    PrID.text := dao.q4.fieldbyname('ORDEM').AsString;

    dia := formatdatetime('dd', now);
    mes := formatdatetime('mm', now);
    ano := formatdatetime('yyyy', now);
    data_str := formatdatetime('dd/mm/yyyy', now);
    dao.cn.StartTransaction;
    cmd := 'INSERT INTO BOLETO_REMESSA_ORDEM (ID, DIA, MES, ANO, DATA, CONTA) '
      + 'VALUES (' + PrID.text + ',''' + dia + ''',''' + mes + ''',''' + ano +
      ''',''' + data_str + ''',''' + PrCONTA.text + ''')';
    dao.Execsql(cmd);
    dao.cn.Commit;
  end;
  dao.cn.StartTransaction;
  dao.Execsql('UPDATE CR1 SET conta_boleto = ' + PrCONTA.text +
    ', BOLETO_REMESSA_ORDEM = ' + PrID.text + ' WHERE ID In (' +
    listaboletos + ')');
  dao.cn.Commit;
end;

procedure Tfrm_remessa_boleto.BtCancelarClick(Sender: TObject);
begin
  if PrID.text = '' then
  begin
    mmItens.EmptyTable;
    PrID.Clear;
    PrCONTA.Clear;
    BtGerarArquivo.enabled := false;
    BtImprimir.enabled := false;
    BtBoleto.enabled := false;
  end
  else
  begin
    CarregaRemessa;
    BtGerarArquivo.enabled := fmfun.ACBrBoleto1.Cedente.Agencia <> '';
    BtImprimir.enabled := true;
    BtBoleto.enabled := true;
  end;

  btInserir.enabled := true;
  BtSalvar.enabled := false;
  BtCancelar.enabled := false;
  BtBuscar.enabled := true;
  PrCONTA.enabled := false;
end;

procedure Tfrm_remessa_boleto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := (not FCarregandoItens) and (not FRegistrandoBoletos);
  if not CanClose then
    MessageDlg('Aguarde o processamento dos boletos ser concluido.',
      mtInformation, [mbOK], 0);
end;
procedure Tfrm_remessa_boleto.FormShow(Sender: TObject);
begin
  modo_insert := false;
  BtBoleto.enabled := false;
  BtGerarArquivo.enabled := false;
  BtImprimir.enabled := false;
end;

procedure Tfrm_remessa_boleto.relatorio_cobranca;
var
  cmd, Path: string;
begin
  Path := ExtractFilePath(Application.ExeName);

  cmd := 'SELECT distinct a.ID, a.COD_CLIENTE, a.NR_DOCUMENTO, a.TITULO, a.SEQUENCIA,'
    + 'a.COD_EMPRESA, a.DTAVEN, a.VALOR, a.COD_FOP, a.HISTORICO, a.DTAREC, a.BOLETO_RETORNO_CODIGO, a.BOLETO_RETORNO_DESCRICAO, '
    + 'coalesce(a.VALOR_RECEBIDO, 0) as VALOR_RECEBIDO, a.SALDO, a.DIAS_ATRASO, coalesce(a.VLR_CORRIGIDO,0) AS VLR_CORRIGIDO, a.DESCONTO, '
    + 'a.NR_CUPOM, a.CONFERIDO, a.ID_REPRESENTANTE, a.VLR_COMISSAO, a.ID_PLANO_CONTAS, '
    + 'a.SINCRONIZAR_PALM, a.EXTRATO, a.VALOR_CORRIGIDO, a.BOLETO_REMESSA_ORDEM, '
    + 'bc.NR_BANCO, bc.NOM_BANCO, cc.NR_AGENCIA, cc.nom_conta,  cc.NR_CONTA, cc.CODIGO_CEDENTE, '
    + 'cast (''CB''||lpad(cast(b.DIA as VARCHAR(2)), 2,  ''0'')||lpad(cast(b.MES as VARCHAR(2)), 2, ''0'') || b.ID || ''. REM'' as varchar (50)) AS ARQUIVO, b.data, '
    + 'CL.COD_CLIENTE, CL.NOM_CLIENTE FROM CR1 a left outer join vendas1 v1 on (v1.NUMDOC = a.NR_DOCUMENTO) '
    + 'inner join CLIENTE CL on (CL.COD_CLIENTE = a.COD_CLIENTE) ' +
    'LEFT OUTER join CONTA_CORRENTE cc on  (cc.ID = coalesce(a.CONTA_BOLETO, v1.conta_boleto))  '
    + 'inner join banco bc on (cc.ID_BANCO = bc.ID) ' +
    'inner join BOLETO_REMESSA_ORDEM b on (b.ID = a.BOLETO_REMESSA_ORDEM AND B.CONTA = coalesce(a.CONTA_BOLETO, v1.conta_boleto)) '
    + 'WHERE 1 = 1 ';

  cmd := cmd + ' and b.id = ' + PrID.text + ' and b.conta = ' + PrCONTA.text;

  cmd := cmd + ' order by bc.NR_BANCO, cl.nom_cliente, a.ID, a.dtaven';
  with Dm.q_cobranca do
  begin
    Close;
    sql.Clear;
    sql.Add(cmd);
    Open;
  end;

  if Dm.q_cobranca.RecordCount <= 0 then
  begin
    dao.msg('N?o foi encontrado Registros para gerar o Relat?rio');
    Exit;
  end;

  if not(fR_RELATORIO.LoadFromFile(Path + 'Relatorios\cobranca.fr3')) then
  begin
    dao.msg('Relat?rio n?o encontrado nas configura??es do Sistema' + #13 +
      'Avise o Suporte');
    Exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure Tfrm_remessa_boleto.BtImprimirClick(Sender: TObject);
begin
  if trim(PrID.text) = '' then
    Exit;
  relatorio_cobranca;
end;

procedure Tfrm_remessa_boleto.CheckTodosClick(Sender: TObject);
begin
  totalselecionados := 0;
  mmItens.First;
  while not mmItens.Eof do
  begin
    mmItens.Edit;
    mmItensCheck.Value := CheckTodos.Checked;
    if CheckTodos.Checked then
      totalselecionados := totalselecionados + 1
    else
      totalselecionados := 0;
    mmItens.Post;
    mmItens.Next;
  end;
  mmItens.First;
  lbTotalNFs.Caption := 'Boletos Relacionados: ' + inttostr(totalselecionados);
  BtSalvar.enabled := true;
  BtCancelar.enabled := true;
end;

procedure Tfrm_remessa_boleto.fR_RELATORIOGetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'empresa' then
    Value := nom_empresa;

  if VarName = 'titulo' then
    Value := 'Remessa de Cobran?a';

  if VarName = 'dtaini' then
    Value := formatdatetime('dd/mm/yyyy', now)
  else if VarName = 'dtafin' then
    Value := formatdatetime('dd/mm/yyyy', now);
end;

procedure Tfrm_remessa_boleto.BtBoletoClick(Sender: TObject);
begin
  if FCarregandoItens then
    Exit;
  impressao_boleto := True;
  FAcaoAposCarga := 1;
  CarregaItens('ORDER BY TITULO, SEQUENCIA');
end;

procedure Tfrm_remessa_boleto.ImprimirBoletosCarregados;
begin
  if Trim(PrID.Text) = '' then
    Exit;
  MontaArquivoCobrancaEnvio;
  fmfun.ACBrBoletoFCFR1.DirLogo := ExtractFilePath(Application.ExeName) +
    'Logos\colorido\';
  fmfun.ACBrBoletoFCFR1.FastReportFile := ExtractFilePath(Application.ExeName) +
    'Relatorios\Boleto.fr3';
  fmfun.ACBrBoleto1.Imprimir;
end;
procedure Tfrm_remessa_boleto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    Close;
  end;
  if Key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure Tfrm_remessa_boleto.ChecarDataVencida;
begin
  mmItens.DisableControls;
  mmItens.First;
  tem_data_vcto_vencida := false;
  while not mmItens.Eof do
  begin
    if (mmItensDTAVEN.Value < now) and (mmItensCheck.Value = true) then
    begin
      tem_data_vcto_vencida := true;
      mmItens.EnableControls;
      Exit;
    end;
    mmItens.Next;
  end;
  mmItens.EnableControls;
end;

procedure Tfrm_remessa_boleto.BtGerarArquivoClick(Sender: TObject);
begin
  if FCarregandoItens then
    Exit;
  impressao_boleto := False;
  FAcaoAposCarga := 2;
  CarregaItens('ORDER BY TITULO, SEQUENCIA');
end;

procedure Tfrm_remessa_boleto.GerarArquivoCarregado;
var
  dia, mes, ano, ext, pathSaida, dir_remessa, arquivo: string;
begin
  ChecarDataVencida;
  if tem_data_vcto_vencida then
  begin
    Dialogs.messagedlg
      ('Ha Data de Vencimentos Vencidos nos boletos relacionados!', mtError,
      [mbOk], 0, mbOk);
    Exit;
  end;

  pathSaida := ExtractFilePath(Application.ExeName);
  dia := formatdatetime('dd', now);
  mes := formatdatetime('mm', now);
  ano := formatdatetime('yy', now);

  if dao.CN.params.values['database'] = 'C:\orbi\trunk\dados\orbi.fdb' then
    ext := '.TST'
  else
    ext := '.REM';

  dir_remessa := pathSaida + fmfun.ACBrBoleto1.Banco.Nome + '_' + PrCONTA.text + '\\';
  if not DirectoryExists(dir_remessa) then
    ForceDirectories(dir_remessa);

  if fmfun.ACBrBoleto1.Banco.TipoCobranca = cobItau then
    arquivo := PrID.text + ext
  else
    arquivo := 'CB' + dia + mes + PrID.text + ext;

  SaveDialog1.InitialDir := dir_remessa;
  SaveDialog1.FileName := arquivo;
  SaveDialog1.Filter := 'Remessa (*' + ext + ')|*' + ext + '|Todos (*.*)|*.*';
  SaveDialog1.DefaultExt := Copy(ext, 2, Length(ext) - 1);

  if not SaveDialog1.Execute then
    Exit;

  remessa_arquivo := SaveDialog1.FileName;
  MontaArquivoCobrancaEnvio;
end;

procedure Tfrm_remessa_boleto.dgItensTitleClick(Column: TColumn);
begin
  CarregaItens('ORDER BY ' + Column.FieldName);
end;

procedure Tfrm_remessa_boleto.dgItensCellClick(Column: TColumn);
begin
  mmItens.Edit;

  if Column.FieldName = 'Check' then
  begin
    if mmItensCheck.Value = true then
    begin
      mmItensCheck.Value := false;
      totalselecionados := totalselecionados - 1;
    end
    else
    begin
      mmItensCheck.Value := true;
      totalselecionados := totalselecionados + 1;
    end;
  end;

  if Column.FieldName = 'DESCONTADA' then
  begin
    if mmItensDESCONTADA.Value = true then
      mmItensDESCONTADA.Value := false
    else
      mmItensDESCONTADA.Value := true;
  end;

  mmItens.Post;
  lbTotalNFs.Caption := 'Boletos Relacionados: ' + inttostr(totalselecionados);

  btInserir.enabled := false;
  BtSalvar.enabled := true;
  BtCancelar.enabled := true;
  BtBuscar.enabled := false;
  BtGerarArquivo.enabled := false;
  BtImprimir.enabled := false;
  BtBoleto.enabled := false;
end;

end.
