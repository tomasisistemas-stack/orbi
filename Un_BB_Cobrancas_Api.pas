unit Un_BB_Cobrancas_Api;

interface

uses
  System.Classes,
  Data.DB,
  System.JSON,
  System.SysUtils,
  System.Variants,
  Winapi.Windows,
  ActiveX,
  ComObj,
  EncdDecd,
  IdURI,
  Un_BB_Cobrancas;

type
  TBBApiAmbiente = (bbSandbox, bbHomologacao, bbProducao);
  TBBApiLogProc = procedure(const AMensagem: string);

  TBBApiException = class(Exception)
  private
    FStatusCode: Integer;
    FStatusText: string;
    FResponseText: string;
  public
    constructor Create(AStatusCode: Integer; const AStatusText, AResponseText: string);
    property StatusCode: Integer read FStatusCode;
    property StatusText: string read FStatusText;
    property ResponseText: string read FResponseText;
  end;

  TBBRetornoHttp = record
    StatusCode: Integer;
    StatusText: string;
    ResponseText: string;
  end;

  TBBClientCredentialsToken = class(TBBJsonModel)
  public
    AccessToken: string;
    TokenType: string;
    ExpiresIn: Integer;
    Scope: string;
    procedure FromJSON(AJson: TJSONObject); override;
  end;

  TBBParametrosListarBoletos = class
  public
    IndicadorSituacao: string;
    AgenciaBeneficiario: Integer;
    ContaBeneficiario: Int64;
    ContaCaucao: Integer;
    CarteiraConvenio: Integer;
    VariacaoCarteiraConvenio: Integer;
    ModalidadeCobranca: Integer;
    CnpjPagador: string;
    DigitoCnpjPagador: string;
    CpfPagador: Int64;
    DigitoCpfPagador: Integer;
    DataInicioVencimento: string;
    DataFimVencimento: string;
    DataInicioRegistro: string;
    DataFimRegistro: string;
    DataInicioMovimento: string;
    DataFimMovimento: string;
    CodigoEstadoTituloCobranca: Integer;
    BoletoVencido: string;
    Indice: Int64;
    function ToQueryString: string;
  end;

  TBBParametrosBaixaOperacional = class
  public
    AgenciaBeneficiario: Integer;
    ContaBeneficiario: Int64;
    NumeroConvenio: Int64;
    DataInicio: string;
    DataFim: string;
    Indice: Int64;
    function ToQueryString: string;
  end;

  TBBParametrosRetornoMovimento = class
  public
    DataInicioMovimento: string;
    DataFimMovimento: string;
    CodigoEstadoTituloCobranca: Integer;
    IndicadorSituacao: string;
    Indice: Int64;
    function ToJSON: TJSONObject;
  end;

  TBBApiCobrancas = class
  private
    FAmbiente: TBBApiAmbiente;
    FAccessToken: string;
    FAppKey: string;
    FTimeoutConexao: Integer;
    FTimeoutEnvio: Integer;
    FTimeoutRecebimento: Integer;
    function BaseUrl: string;
    function OAuthUrl: string;
    function BuildUrl(const AEndpoint: string): string;
    function AddQueryToEndpoint(const AEndpoint, AQueryString: string): string;
    function ParseJSONObject(const AResponseText: string): TJSONObject;
    procedure ExecuteRequest(const AMethod, AEndpoint, ABody: string; const AUseBearer: Boolean;
      out ARetorno: TBBRetornoHttp);
    function ExecuteJson(const AMethod, AEndpoint: string; ABody: TJSONObject; const AUseBearer: Boolean = True): TJSONObject;
  public
    constructor Create;

    function ObterTokenClientCredentials(const AClientId, AClientSecret: string; const AScope: string = ''): TBBClientCredentialsToken;
    function ObterTokenClientCredentialsRaw(const AClientId, AClientSecret: string; const AScope: string = ''): string;

    function RegistrarBoleto(ABoleto: TBBRegistroBoleto): TBBRespostaRegistroBoleto;
    function RegistrarBoletoRaw(ABoleto: TBBRegistroBoleto): string;

    function ListarBoletos(AParametros: TBBParametrosListarBoletos): TBBListaBoletos;
    function ListarBoletosRaw(AParametros: TBBParametrosListarBoletos): string;

    function DetalharBoletoRaw(const ANumeroTitulo: string; ANumeroConvenio: Int64): string;
    function DetalharBoletoJson(const ANumeroTitulo: string; ANumeroConvenio: Int64): TJSONObject;
    function BoletoRegistrado(const ANumeroTitulo: string; ANumeroConvenio: Int64): Boolean;

    function AlterarBoleto(const ANumeroTitulo: string; AAlteracao: TBBAlteracaoBoleto): TBBRespostaAlteracaoBoleto;
    function AlterarBoletoRaw(const ANumeroTitulo: string; AAlteracao: TBBAlteracaoBoleto): string;

    function BaixarBoleto(const ANumeroTitulo: string; ANumeroConvenio: Int64): TBBRespostaBaixaBoleto;
    function BaixarBoletoRaw(const ANumeroTitulo: string; ANumeroConvenio: Int64): string;

    function GerarPixRaw(const ANumeroTitulo: string): string;
    function ConsultarPix(const ANumeroTitulo: string): TBBRespostaPixBoleto;
    function ConsultarPixRaw(const ANumeroTitulo: string): string;
    function CancelarPixRaw(const ANumeroTitulo: string): string;

    function ListarRetornoMovimentoRaw(ANumeroConvenio: Int64; AParametros: TBBParametrosRetornoMovimento): string;
    function ListarRetornoMovimentoJson(ANumeroConvenio: Int64; AParametros: TBBParametrosRetornoMovimento): TJSONObject;

    function ListarBoletosBaixaOperacionalRaw(AParametros: TBBParametrosBaixaOperacional): string;
    function ListarBoletosBaixaOperacionalJson(AParametros: TBBParametrosBaixaOperacional): TJSONObject;

    function AtivarConsultaBaixaOperacionalRaw(ANumeroConvenio: Int64): string;
    function DesativarConsultaBaixaOperacionalRaw(ANumeroConvenio: Int64): string;

    property Ambiente: TBBApiAmbiente read FAmbiente write FAmbiente;
    property AccessToken: string read FAccessToken write FAccessToken;
    property AppKey: string read FAppKey write FAppKey;
    property TimeoutConexao: Integer read FTimeoutConexao write FTimeoutConexao;
    property TimeoutEnvio: Integer read FTimeoutEnvio write FTimeoutEnvio;
    property TimeoutRecebimento: Integer read FTimeoutRecebimento write FTimeoutRecebimento;
  end;

function BBBoletoRegistradoNaApi(ADataSet: TDataSet; AAmbiente: TBBApiAmbiente;
  const AScope: string; ALog: TBBApiLogProc; out ADataPagamento: TDateTime;
  out AValorPago: Double): Boolean;
function BBBoletoRegistradoNaApiComApi(ADataSet: TDataSet; AAmbiente: TBBApiAmbiente;
  const AScope: string; ALog: TBBApiLogProc; AApi: TBBApiCobrancas;
  out ADataPagamento: TDateTime; out AValorPago: Double): Boolean;

function BBBBMontarCampoNossoNumero(ADataSet: TDataSet; ADigitoVerificador: Boolean = False): string;
implementation

const
  WinHttpRequestOption_SecureProtocols = 9;
  WinHttpRequestSecureProtocol_TLS1_2 = 2048;

function BBBBOnlyNumbers(const Value: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(Value) do
    if CharInSet(Value[I], ['0'..'9']) then
      Result := Result + Value[I];
end;

function BBBBFieldStr(ADataSet: TDataSet; const AFieldName, ADefault: string): string;
var
  Field: TField;
begin
  Result := ADefault;
  if ADataSet = nil then
    Exit;
  Field := ADataSet.FindField(AFieldName);
  if (Field <> nil) and (not Field.IsNull) then
    Result := Field.AsString;
end;

function BBBBLeftPadDigits(const Value: string; Len: Integer): string;
var
  Digits, Padded: string;
begin
  Digits := BBBBOnlyNumbers(Value);
  if Digits = '' then
  begin
    Result := '';
    Exit;
  end;

  Padded := StringOfChar('0', Len) + Digits;
  Result := Copy(Padded, Length(Padded) - Len + 1, Len);
end;

function BBBBRightStr(const Value: string; Len: Integer): string;
begin
  if Length(Value) <= Len then
    Result := Value
  else
    Result := Copy(Value, Length(Value) - Len + 1, Len);
end;

function BBBBMontaNossoNumero(const Numero: string): string;
var
  I: Integer;

  function ConverteLetra(const Letra: string): string;
  var
    S: string;
    Letter: Char;
  begin
    Result := '';
    if Letra = '' then
      Exit;
    S := UpperCase(Letra);
    Letter := S[1];
    case Letter of
      'A': Result := '1';
      'B': Result := '2';
      'C': Result := '3';
      'D': Result := '4';
      'E': Result := '5';
      'F': Result := '6';
      'G': Result := '7';
      'H': Result := '8';
      'I': Result := '9';
      'J': Result := '10';
      'K': Result := '11';
      'L': Result := '12';
      'M': Result := '13';
      'N': Result := '14';
      'O': Result := '15';
      'P': Result := '16';
      'Q': Result := '17';
      'R': Result := '18';
      'S': Result := '19';
      'T': Result := '20';
      'U': Result := '21';
      'V': Result := '22';
      'W': Result := '23';
      'X': Result := '24';
      'Y': Result := '25';
      'Z': Result := '26';
    else
      Result := Letra;
    end;
  end;

begin
  Result := '';
  for I := 1 to 13 do
    Result := Result + ConverteLetra(Copy(Numero, I, 1));
end;

function BBBBFormataNossoNumero(ADataSet: TDataSet): string;
var
  Convenio, NossoNumero, Titulo, Sequencia: string;
begin
  Convenio := BBBBOnlyNumbers(BBBBFieldStr(ADataSet, 'convenio', ''));
  Titulo := BBBBFieldStr(ADataSet, 'titulo', '');
  Sequencia := BBBBFieldStr(ADataSet, 'sequencia', '');
  NossoNumero := BBBBMontaNossoNumero(BBBBRightStr(Titulo, 10) + BBBBLeftPadDigits(Sequencia, 1));

  if Length(Convenio) = 7 then
    Result := BBBBLeftPadDigits(Convenio, 7) + NossoNumero.PadLeft(10, '0')
  else
    Result := NossoNumero;
end;

function BBBBCalcularDigitoVerificador(const Documento: string): string;
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

function BBBBMontarCampoNossoNumero(ADataSet: TDataSet; ADigitoVerificador: Boolean): string;
begin
  Result := '000' + BBBBFormataNossoNumero(ADataSet);
  if ADigitoVerificador then
    Result := Result + BBBBCalcularDigitoVerificador(Result);
end;

function BBBBJsonString(AObj: TJSONObject; const ANames: array of string): string;
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
      Result := BBBBJsonString(TJSONObject(Pair.JsonValue), ANames);
      if Result <> '' then
        Exit;
    end
    else if Pair.JsonValue is TJSONArray then
    begin
      if (TJSONArray(Pair.JsonValue).Count > 0) and
         (TJSONArray(Pair.JsonValue).Items[0] is TJSONObject) then
      begin
        Result := BBBBJsonString(TJSONObject(TJSONArray(Pair.JsonValue).Items[0]), ANames);
        if Result <> '' then
          Exit;
      end;
    end;
  end;
end;

function BBBBTryDate(const Value: string; out ADate: TDateTime): Boolean;
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

function BBBBTryFloat(const Value: string; out AValue: Double): Boolean;
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

function BBBBAmbienteNome(AAmbiente: TBBApiAmbiente): string;
begin
  case AAmbiente of
    bbSandbox: Result := 'Sandbox';
    bbHomologacao: Result := 'Homologacao';
    bbProducao: Result := 'Producao';
  else
    Result := 'Desconhecido';
  end;
end;

procedure BBBBLog(ALog: TBBApiLogProc; const AMensagem: string);
begin
  if Assigned(ALog) then
    ALog(AMensagem);
end;

function BBBoletoRegistradoNaApi(ADataSet: TDataSet; AAmbiente: TBBApiAmbiente;
  const AScope: string; ALog: TBBApiLogProc; out ADataPagamento: TDateTime;
  out AValorPago: Double): Boolean;
begin
  Result := BBBoletoRegistradoNaApiComApi(ADataSet, AAmbiente, AScope, ALog,
    nil, ADataPagamento, AValorPago);
end;

function BBBoletoRegistradoNaApiComApi(ADataSet: TDataSet; AAmbiente: TBBApiAmbiente;
  const AScope: string; ALog: TBBApiLogProc; AApi: TBBApiCobrancas;
  out ADataPagamento: TDateTime; out AValorPago: Double): Boolean;
var
  Api: TBBApiCobrancas;
  Obj: TJSONObject;
  Banco, ApiKey, ClientId, ClientSecret, NumeroTitulo: string;
  NumeroConvenio: Int64;
  SData, SValor: string;
  ApiPropria: Boolean;
begin
  Result := False;
  ADataPagamento := 0;
  AValorPago := 0;
  Banco := BBBBOnlyNumbers(BBBBFieldStr(ADataSet, 'nr_banco', ''));
  ApiKey := Trim(BBBBFieldStr(ADataSet, 'api_key_cobranca', ''));
  ClientId := Trim(BBBBFieldStr(ADataSet, 'client_id_cobranca', ''));
  ClientSecret := Trim(BBBBFieldStr(ADataSet, 'client_secret_cobranca', ''));
  NumeroConvenio := StrToInt64Def(BBBBOnlyNumbers(BBBBFieldStr(ADataSet, 'convenio', '')), 0);
  NumeroTitulo := BBBBMontarCampoNossoNumero(ADataSet);

  if not ((Banco = '1') or (Banco = '001')) or (ApiKey = '') or
     (ClientId = '') or (ClientSecret = '') or (NumeroConvenio <= 0) or
     (NumeroTitulo = '') then
    Exit;

  ApiPropria := AApi = nil;
  if ApiPropria then
    Api := TBBApiCobrancas.Create
  else
    Api := AApi;
  try
    Api.Ambiente := AAmbiente;
    Api.AppKey := ApiKey;
    BBBBLog(ALog, 'Detalhar boleto - ambiente=' + BBBBAmbienteNome(AAmbiente) +
      ', titulo=' + NumeroTitulo + ', convenio=' + IntToStr(NumeroConvenio));
    try
      if Api.AccessToken = '' then
        Api.ObterTokenClientCredentials(ClientId, ClientSecret, AScope).Free;
      Obj := Api.DetalharBoletoJson(NumeroTitulo, NumeroConvenio);
      try
        Result := True;
        SData := BBBBJsonString(Obj, ['dataRecebimentoTitulo', 'dataPagamento', 'dataRecebimento', 'dataLiquidacao', 'dataCredito', 'dataCreditoLiquidacao']);
        SValor := BBBBJsonString(Obj, ['valorPagoSacado', 'valorPago', 'valorRecebido', 'valorCredito', 'valorLiquidado']);
        if SData <> '' then
          BBBBTryDate(SData, ADataPagamento);
        if SValor <> '' then
          BBBBTryFloat(SValor, AValorPago);
        BBBBLog(ALog, 'Detalhar boleto OK - ambiente=' + BBBBAmbienteNome(AAmbiente) +
          ', titulo=' + NumeroTitulo + ', convenio=' + IntToStr(NumeroConvenio) +
          ', pago=' + BoolToStr((ADataPagamento > 0) and (AValorPago > 0), True));
      finally
        Obj.Free;
      end;
    except
      on E: TBBApiException do
      begin
        if E.StatusCode = 404 then
        begin
          BBBBLog(ALog, 'Detalhar boleto nao registrado - ambiente=' + BBBBAmbienteNome(AAmbiente) +
            ', titulo=' + NumeroTitulo + ', convenio=' + IntToStr(NumeroConvenio) +
            ', erro=' + E.Message);
          Result := False;
        end
        else
        begin
          BBBBLog(ALog, 'Detalhar boleto ERRO - ambiente=' + BBBBAmbienteNome(AAmbiente) +
            ', titulo=' + NumeroTitulo + ', convenio=' + IntToStr(NumeroConvenio) +
            ', erro=' + E.Message);
          raise;
        end;
      end;
      on E: Exception do
      begin
        BBBBLog(ALog, 'Detalhar boleto ERRO - ambiente=' + BBBBAmbienteNome(AAmbiente) +
          ', titulo=' + NumeroTitulo + ', convenio=' + IntToStr(NumeroConvenio) +
          ', erro=' + E.Message);
        raise;
      end;
    end;
  finally
    if ApiPropria then
      Api.Free;
  end;
end;
procedure AddQueryStringParam(AParams: TStrings; const AName, AValue: string);
begin
  if Trim(AValue) <> '' then
    AParams.Add(AName + '=' + TIdURI.ParamsEncode(AValue));
end;

procedure AddQueryIntegerParam(AParams: TStrings; const AName: string; AValue: Integer);
begin
  if AValue <> 0 then
    AddQueryStringParam(AParams, AName, IntToStr(AValue));
end;

procedure AddQueryInt64Param(AParams: TStrings; const AName: string; AValue: Int64);
begin
  if AValue <> 0 then
    AddQueryStringParam(AParams, AName, IntToStr(AValue));
end;

function JoinQueryParams(AParams: TStrings): string;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to AParams.Count - 1 do
  begin
    if Result <> '' then
      Result := Result + '&';
    Result := Result + AParams[I];
  end;
end;

function BasicAuthValue(const AClientId, AClientSecret: string): string;
begin
  Result := StringReplace(EncodeString(AClientId + ':' + AClientSecret), #13#10, '', [rfReplaceAll]);
end;

function NormalizeAppKey(const AValue: string): string;
var
  P: Integer;
begin
  Result := Trim(AValue);
  Result := StringReplace(Result, #13, '', [rfReplaceAll]);
  Result := StringReplace(Result, #10, '', [rfReplaceAll]);
  Result := StringReplace(Result, '"', '', [rfReplaceAll]);
  Result := StringReplace(Result, '''', '', [rfReplaceAll]);

  P := Pos('gw-dev-app-key=', LowerCase(Result));
  if P > 0 then
  begin
    Delete(Result, 1, P + Length('gw-dev-app-key=') - 1);
    P := Pos('&', Result);
    if P > 0 then
      Result := Copy(Result, 1, P - 1);
  end;

  P := Pos('gw-app-key=', LowerCase(Result));
  if P > 0 then
  begin
    Delete(Result, 1, P + Length('gw-app-key=') - 1);
    P := Pos('&', Result);
    if P > 0 then
      Result := Copy(Result, 1, P - 1);
  end;

  P := Pos('?', Result);
  if P > 0 then
    Result := Copy(Result, 1, P - 1);

  Result := Trim(Result);
end;

function BeginComThread: Integer;
begin
  Result := CoInitialize(nil);
  if (Result < 0) and (Cardinal(Result) <> $80010106) then
    OleCheck(Result);
end;

procedure EndComThread(AInitResult: Integer);
begin
  if (AInitResult = 0) or (AInitResult = 1) then
    CoUninitialize;
end;

procedure ConfigureWinHttpSecureProtocols(var AHttp: OleVariant);
begin
  try
    AHttp.Option[WinHttpRequestOption_SecureProtocols] := WinHttpRequestSecureProtocol_TLS1_2;
  except
    // Algumas instalacoes antigas do WinHTTP nao reconhecem TLS 1.2 por Option[9].
    // Nesses casos, segue com a configuracao do Windows/SChannel.
  end;
end;

{ TBBApiException }

constructor TBBApiException.Create(AStatusCode: Integer; const AStatusText, AResponseText: string);
begin
  inherited CreateFmt('Erro API BB HTTP %d - %s: %s', [AStatusCode, AStatusText, AResponseText]);
  FStatusCode := AStatusCode;
  FStatusText := AStatusText;
  FResponseText := AResponseText;
end;

{ TBBClientCredentialsToken }

procedure TBBClientCredentialsToken.FromJSON(AJson: TJSONObject);
begin
  AccessToken := GetString(AJson, 'access_token');
  TokenType := GetString(AJson, 'token_type');
  ExpiresIn := GetInteger(AJson, 'expires_in');
  Scope := GetString(AJson, 'scope');
end;

{ TBBParametrosListarBoletos }

function TBBParametrosListarBoletos.ToQueryString: string;
var
  Params: TStringList;
begin
  Params := TStringList.Create;
  try
    AddQueryStringParam(Params, 'indicadorSituacao', IndicadorSituacao);
    AddQueryIntegerParam(Params, 'agenciaBeneficiario', AgenciaBeneficiario);
    AddQueryInt64Param(Params, 'contaBeneficiario', ContaBeneficiario);
    AddQueryIntegerParam(Params, 'contaCaucao', ContaCaucao);
    AddQueryIntegerParam(Params, 'carteiraConvenio', CarteiraConvenio);
    AddQueryIntegerParam(Params, 'variacaoCarteiraConvenio', VariacaoCarteiraConvenio);
    AddQueryIntegerParam(Params, 'modalidadeCobranca', ModalidadeCobranca);
    AddQueryStringParam(Params, 'cnpjPagador', CnpjPagador);
    AddQueryStringParam(Params, 'digitoCNPJPagador', DigitoCnpjPagador);
    AddQueryInt64Param(Params, 'cpfPagador', CpfPagador);
    AddQueryIntegerParam(Params, 'digitoCPFPagador', DigitoCpfPagador);
    AddQueryStringParam(Params, 'dataInicioVencimento', DataInicioVencimento);
    AddQueryStringParam(Params, 'dataFimVencimento', DataFimVencimento);
    AddQueryStringParam(Params, 'dataInicioRegistro', DataInicioRegistro);
    AddQueryStringParam(Params, 'dataFimRegistro', DataFimRegistro);
    AddQueryStringParam(Params, 'dataInicioMovimento', DataInicioMovimento);
    AddQueryStringParam(Params, 'dataFimMovimento', DataFimMovimento);
    AddQueryIntegerParam(Params, 'codigoEstadoTituloCobranca', CodigoEstadoTituloCobranca);
    AddQueryStringParam(Params, 'boletoVencido', BoletoVencido);
    AddQueryInt64Param(Params, 'indice', Indice);
    Result := JoinQueryParams(Params);
  finally
    Params.Free;
  end;
end;

{ TBBParametrosBaixaOperacional }

function TBBParametrosBaixaOperacional.ToQueryString: string;
var
  Params: TStringList;
begin
  Params := TStringList.Create;
  try
    AddQueryIntegerParam(Params, 'agenciaBeneficiario', AgenciaBeneficiario);
    AddQueryInt64Param(Params, 'contaBeneficiario', ContaBeneficiario);
    AddQueryInt64Param(Params, 'numeroConvenio', NumeroConvenio);
    AddQueryStringParam(Params, 'dataInicio', DataInicio);
    AddQueryStringParam(Params, 'dataFim', DataFim);
    AddQueryInt64Param(Params, 'indice', Indice);
    Result := JoinQueryParams(Params);
  finally
    Params.Free;
  end;
end;

{ TBBParametrosRetornoMovimento }

function TBBParametrosRetornoMovimento.ToJSON: TJSONObject;
begin
  Result := TJSONObject.Create;
  if Trim(DataInicioMovimento) <> '' then Result.AddPair('dataInicioMovimento', DataInicioMovimento);
  if Trim(DataFimMovimento) <> '' then Result.AddPair('dataFimMovimento', DataFimMovimento);
  if CodigoEstadoTituloCobranca <> 0 then Result.AddPair('codigoEstadoTituloCobranca', TJSONNumber.Create(CodigoEstadoTituloCobranca));
  if Trim(IndicadorSituacao) <> '' then Result.AddPair('indicadorSituacao', IndicadorSituacao);
  if Indice <> 0 then Result.AddPair('indice', TJSONNumber.Create(Indice));
end;

{ TBBApiCobrancas }

constructor TBBApiCobrancas.Create;
begin
  inherited Create;
  FAmbiente := bbHomologacao;
  FTimeoutConexao := 10000;
  FTimeoutEnvio := 30000;
  FTimeoutRecebimento := 30000;
end;

function TBBApiCobrancas.BaseUrl: string;
begin
  case FAmbiente of
    bbSandbox: Result := 'https://api.sandbox.bb.com.br/cobrancas/v2';
    bbHomologacao: Result := 'https://api.hm.bb.com.br/cobrancas/v2';
  else
    Result := 'https://api.bb.com.br/cobrancas/v2';
  end;
end;

function TBBApiCobrancas.OAuthUrl: string;
begin
  case FAmbiente of
    bbSandbox: Result := 'https://oauth.sandbox.bb.com.br/oauth/token';
    bbHomologacao: Result := 'https://oauth.hm.bb.com.br/oauth/token';
  else
    Result := 'https://oauth.bb.com.br/oauth/token';
  end;
end;

function TBBApiCobrancas.BuildUrl(const AEndpoint: string): string;
var
  P: Integer;
  AppKeyQuery, UrlBase, UrlQuery: string;
begin
  if Pos('http', LowerCase(AEndpoint)) = 1 then
    Result := AEndpoint
  else
    Result := BaseUrl + AEndpoint;

  if NormalizeAppKey(FAppKey) <> '' then
  begin
    AppKeyQuery := 'gw-dev-app-key=' + TIdURI.ParamsEncode(NormalizeAppKey(FAppKey));
    P := Pos('?', Result);
    if P > 0 then
    begin
      UrlBase := Copy(Result, 1, P - 1);
      UrlQuery := Copy(Result, P + 1, MaxInt);
      Result := UrlBase + '?' + AppKeyQuery;
      if Trim(UrlQuery) <> '' then
        Result := Result + '&' + UrlQuery;
    end
    else
      Result := Result + '?' + AppKeyQuery;
  end;
end;
function TBBApiCobrancas.AddQueryToEndpoint(const AEndpoint, AQueryString: string): string;
begin
  Result := AEndpoint;
  if Trim(AQueryString) = '' then
    Exit;
  if Pos('?', Result) > 0 then
    Result := Result + '&' + AQueryString
  else
    Result := Result + '?' + AQueryString;
end;

function TBBApiCobrancas.ParseJSONObject(const AResponseText: string): TJSONObject;
var
  V: TJSONValue;
begin
  Result := TJSONObject.Create;
  if Trim(AResponseText) = '' then
    Exit;

  V := TJSONObject.ParseJSONValue(AResponseText);
  if V is TJSONObject then
  begin
    Result.Free;
    Result := TJSONObject(V);
  end
  else if V is TJSONArray then
    Result.AddPair('items', V)
  else
    V.Free;
end;

procedure TBBApiCobrancas.ExecuteRequest(const AMethod, AEndpoint, ABody: string; const AUseBearer: Boolean;
  out ARetorno: TBBRetornoHttp);
var
  Http: OleVariant;
  ComInit: Integer;
begin
  ComInit := BeginComThread;
  try
    Http := CreateOleObject('WinHttp.WinHttpRequest.5.1');
    ConfigureWinHttpSecureProtocols(Http);
    Http.Open(AMethod, BuildUrl(AEndpoint), False);
    Http.SetRequestHeader('Accept', 'application/json');
    if AUseBearer and (Trim(FAccessToken) <> '') then
      Http.SetRequestHeader('Authorization', 'Bearer ' + Trim(FAccessToken));
    if Trim(ABody) <> '' then
      Http.SetRequestHeader('Content-Type', 'application/json');
    Http.SetTimeouts(FTimeoutConexao, FTimeoutConexao, FTimeoutEnvio, FTimeoutRecebimento);

    if Trim(ABody) <> '' then
      Http.Send(ABody)
    else
      Http.Send(EmptyParam);

    ARetorno.StatusCode := Integer(Http.Status);
    ARetorno.StatusText := VarToStr(Http.StatusText);
    ARetorno.ResponseText := VarToStr(Http.ResponseText);

    if (ARetorno.StatusCode < 200) or (ARetorno.StatusCode > 299) then
      raise TBBApiException.Create(ARetorno.StatusCode, ARetorno.StatusText, ARetorno.ResponseText);
  finally
    EndComThread(ComInit);
  end;
end;

function TBBApiCobrancas.ExecuteJson(const AMethod, AEndpoint: string; ABody: TJSONObject; const AUseBearer: Boolean): TJSONObject;
var
  Retorno: TBBRetornoHttp;
  Body: string;
begin
  Body := '';
  if Assigned(ABody) then
    Body := ABody.ToJSON;
  ExecuteRequest(AMethod, AEndpoint, Body, AUseBearer, Retorno);
  Result := ParseJSONObject(Retorno.ResponseText);
end;

function TBBApiCobrancas.ObterTokenClientCredentialsRaw(const AClientId, AClientSecret: string; const AScope: string): string;
var
  Http: OleVariant;
  Body: string;
  ComInit: Integer;
begin
  Body := 'grant_type=client_credentials';
  if Trim(AScope) <> '' then
    Body := Body + '&scope=' + TIdURI.ParamsEncode(AScope);

  ComInit := BeginComThread;
  try
    Http := CreateOleObject('WinHttp.WinHttpRequest.5.1');
    ConfigureWinHttpSecureProtocols(Http);
    Http.Open('POST', OAuthUrl, False);
    Http.SetRequestHeader('Accept', 'application/json');
    Http.SetRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    Http.SetRequestHeader('Authorization', 'Basic ' + BasicAuthValue(AClientId, AClientSecret));
    Http.SetTimeouts(FTimeoutConexao, FTimeoutConexao, FTimeoutEnvio, FTimeoutRecebimento);
    Http.Send(Body);

    if (Integer(Http.Status) < 200) or (Integer(Http.Status) > 299) then
      raise TBBApiException.Create(Integer(Http.Status), VarToStr(Http.StatusText), VarToStr(Http.ResponseText));

    Result := VarToStr(Http.ResponseText);
  finally
    EndComThread(ComInit);
  end;
end;

function TBBApiCobrancas.ObterTokenClientCredentials(const AClientId, AClientSecret: string; const AScope: string): TBBClientCredentialsToken;
var
  Obj: TJSONObject;
begin
  Obj := ParseJSONObject(ObterTokenClientCredentialsRaw(AClientId, AClientSecret, AScope));
  Result := TBBClientCredentialsToken.Create;
  try
    Result.FromJSON(Obj);
    FAccessToken := Result.AccessToken;
  finally
    Obj.Free;
  end;
end;

function TBBApiCobrancas.RegistrarBoletoRaw(ABoleto: TBBRegistroBoleto): string;
var
  Obj: TJSONObject;
  Retorno: TBBRetornoHttp;
begin
  Obj := ABoleto.ToJSON;
  try
    ExecuteRequest('POST', '/boletos', Obj.ToJSON, True, Retorno);
    Result := Retorno.ResponseText;
  finally
    Obj.Free;
  end;
end;

function TBBApiCobrancas.RegistrarBoleto(ABoleto: TBBRegistroBoleto): TBBRespostaRegistroBoleto;
var
  Obj: TJSONObject;
begin
  Obj := ParseJSONObject(RegistrarBoletoRaw(ABoleto));
  Result := TBBRespostaRegistroBoleto.Create;
  try
    Result.FromJSON(Obj);
  finally
    Obj.Free;
  end;
end;

function TBBApiCobrancas.ListarBoletosRaw(AParametros: TBBParametrosListarBoletos): string;
var
  Retorno: TBBRetornoHttp;
begin
  ExecuteRequest('GET', AddQueryToEndpoint('/boletos', AParametros.ToQueryString), '', True, Retorno);
  Result := Retorno.ResponseText;
end;

function TBBApiCobrancas.ListarBoletos(AParametros: TBBParametrosListarBoletos): TBBListaBoletos;
var
  Obj: TJSONObject;
begin
  Obj := ParseJSONObject(ListarBoletosRaw(AParametros));
  Result := TBBListaBoletos.Create;
  try
    Result.FromJSON(Obj);
  finally
    Obj.Free;
  end;
end;

function TBBApiCobrancas.DetalharBoletoRaw(const ANumeroTitulo: string; ANumeroConvenio: Int64): string;
var
  Retorno: TBBRetornoHttp;
begin
  ExecuteRequest('GET', '/boletos/' + TIdURI.ParamsEncode(ANumeroTitulo) + '?numeroConvenio=' + IntToStr(ANumeroConvenio), '', True, Retorno);
  Result := Retorno.ResponseText;
end;

function TBBApiCobrancas.DetalharBoletoJson(const ANumeroTitulo: string; ANumeroConvenio: Int64): TJSONObject;
begin
  Result := ParseJSONObject(DetalharBoletoRaw(ANumeroTitulo, ANumeroConvenio));
end;

function TBBApiCobrancas.BoletoRegistrado(const ANumeroTitulo: string; ANumeroConvenio: Int64): Boolean;
var
  Obj: TJSONObject;
begin
  Result := False;
  try
    Obj := DetalharBoletoJson(ANumeroTitulo, ANumeroConvenio);
    try
      Result := True;
    finally
      Obj.Free;
    end;
  except
    on E: TBBApiException do
    begin
      if E.StatusCode = 404 then
        Result := False
      else
        raise;
    end;
  end;
end;

function TBBApiCobrancas.AlterarBoletoRaw(const ANumeroTitulo: string; AAlteracao: TBBAlteracaoBoleto): string;
var
  Obj: TJSONObject;
  Retorno: TBBRetornoHttp;
begin
  Obj := AAlteracao.ToJSON;
  try
    ExecuteRequest('PATCH', '/boletos/' + TIdURI.ParamsEncode(ANumeroTitulo), Obj.ToJSON, True, Retorno);
    Result := Retorno.ResponseText;
  finally
    Obj.Free;
  end;
end;

function TBBApiCobrancas.AlterarBoleto(const ANumeroTitulo: string; AAlteracao: TBBAlteracaoBoleto): TBBRespostaAlteracaoBoleto;
var
  Obj: TJSONObject;
begin
  Obj := ParseJSONObject(AlterarBoletoRaw(ANumeroTitulo, AAlteracao));
  Result := TBBRespostaAlteracaoBoleto.Create;
  try
    Result.FromJSON(Obj);
  finally
    Obj.Free;
  end;
end;

function TBBApiCobrancas.BaixarBoletoRaw(const ANumeroTitulo: string; ANumeroConvenio: Int64): string;
var
  Obj: TJSONObject;
  Retorno: TBBRetornoHttp;
begin
  Obj := TJSONObject.Create;
  try
    Obj.AddPair('numeroConvenio', TJSONNumber.Create(ANumeroConvenio));
    ExecuteRequest('POST', '/boletos/' + TIdURI.ParamsEncode(ANumeroTitulo) + '/baixar', Obj.ToJSON, True, Retorno);
    Result := Retorno.ResponseText;
  finally
    Obj.Free;
  end;
end;

function TBBApiCobrancas.BaixarBoleto(const ANumeroTitulo: string; ANumeroConvenio: Int64): TBBRespostaBaixaBoleto;
var
  Obj: TJSONObject;
begin
  Obj := ParseJSONObject(BaixarBoletoRaw(ANumeroTitulo, ANumeroConvenio));
  Result := TBBRespostaBaixaBoleto.Create;
  try
    Result.FromJSON(Obj);
  finally
    Obj.Free;
  end;
end;

function TBBApiCobrancas.GerarPixRaw(const ANumeroTitulo: string): string;
var
  Retorno: TBBRetornoHttp;
begin
  ExecuteRequest('POST', '/boletos/' + TIdURI.ParamsEncode(ANumeroTitulo) + '/gerar-pix', '', True, Retorno);
  Result := Retorno.ResponseText;
end;

function TBBApiCobrancas.ConsultarPixRaw(const ANumeroTitulo: string): string;
var
  Retorno: TBBRetornoHttp;
begin
  ExecuteRequest('GET', '/boletos/' + TIdURI.ParamsEncode(ANumeroTitulo) + '/pix', '', True, Retorno);
  Result := Retorno.ResponseText;
end;

function TBBApiCobrancas.ConsultarPix(const ANumeroTitulo: string): TBBRespostaPixBoleto;
var
  Obj: TJSONObject;
begin
  Obj := ParseJSONObject(ConsultarPixRaw(ANumeroTitulo));
  Result := TBBRespostaPixBoleto.Create;
  try
    Result.FromJSON(Obj);
  finally
    Obj.Free;
  end;
end;

function TBBApiCobrancas.CancelarPixRaw(const ANumeroTitulo: string): string;
var
  Retorno: TBBRetornoHttp;
begin
  ExecuteRequest('POST', '/boletos/' + TIdURI.ParamsEncode(ANumeroTitulo) + '/cancelar-pix', '', True, Retorno);
  Result := Retorno.ResponseText;
end;

function TBBApiCobrancas.ListarRetornoMovimentoRaw(ANumeroConvenio: Int64; AParametros: TBBParametrosRetornoMovimento): string;
var
  Obj: TJSONObject;
  Retorno: TBBRetornoHttp;
begin
  Obj := AParametros.ToJSON;
  try
    ExecuteRequest('POST', '/convenios/' + IntToStr(ANumeroConvenio) + '/listar-retorno-movimento', Obj.ToJSON, True, Retorno);
    Result := Retorno.ResponseText;
  finally
    Obj.Free;
  end;
end;

function TBBApiCobrancas.ListarRetornoMovimentoJson(ANumeroConvenio: Int64; AParametros: TBBParametrosRetornoMovimento): TJSONObject;
begin
  Result := ParseJSONObject(ListarRetornoMovimentoRaw(ANumeroConvenio, AParametros));
end;

function TBBApiCobrancas.ListarBoletosBaixaOperacionalRaw(AParametros: TBBParametrosBaixaOperacional): string;
var
  Retorno: TBBRetornoHttp;
begin
  ExecuteRequest('GET', AddQueryToEndpoint('/boletos-baixa-operacional', AParametros.ToQueryString), '', True, Retorno);
  Result := Retorno.ResponseText;
end;

function TBBApiCobrancas.ListarBoletosBaixaOperacionalJson(AParametros: TBBParametrosBaixaOperacional): TJSONObject;
begin
  Result := ParseJSONObject(ListarBoletosBaixaOperacionalRaw(AParametros));
end;

function TBBApiCobrancas.AtivarConsultaBaixaOperacionalRaw(ANumeroConvenio: Int64): string;
var
  Retorno: TBBRetornoHttp;
begin
  ExecuteRequest('PATCH', '/convenios/' + IntToStr(ANumeroConvenio) + '/ativar-consulta-baixa-operacional', '', True, Retorno);
  Result := Retorno.ResponseText;
end;

function TBBApiCobrancas.DesativarConsultaBaixaOperacionalRaw(ANumeroConvenio: Int64): string;
var
  Retorno: TBBRetornoHttp;
begin
  ExecuteRequest('PATCH', '/convenios/' + IntToStr(ANumeroConvenio) + '/desativar-consulta-baixa-operacional', '', True, Retorno);
  Result := Retorno.ResponseText;
end;

end.

