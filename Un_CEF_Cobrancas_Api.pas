unit Un_CEF_Cobrancas_Api;

interface

uses
  Data.DB,
  System.SysUtils,
  System.Variants,
  System.JSON,
  Winapi.Windows,
  ActiveX,
  ComObj,
  EncdDecd,
  IdURI,
  UnFun,
  Un_CEF_Cobrancas;

type
  TCEFApiAmbiente = (cefProducao, cefHomologacao);

  TCEFApiException = class(Exception)
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

  TCEFRetornoHttp = record
    StatusCode: Integer;
    StatusText: string;
    ResponseText: string;
  end;

  TCEFApiLogProc = procedure(const AMensagem: string);

  TCEFApiCobrancas = class
  private
    FAmbiente: TCEFApiAmbiente;
    FUrlManutencao: string;
    FUrlConsulta: string;
    FUrlRest: string;
    FOAuthUrlRest: string;
    FAccessTokenRest: string;
    FApplicationKeyRest: string;
    FTimeoutConexao: Integer;
    FTimeoutEnvio: Integer;
    FTimeoutRecebimento: Integer;
    function UrlManutencao: string;
    function UrlConsulta: string;
    function UrlRest: string;
    function OAuthUrlRest: string;
    function UrlOperacao(AOperacao: TCEFOperacaoCobranca): string;
    procedure ExecuteRequest(const AUrl, ABody, ASOAPAction: string; out ARetorno: TCEFRetornoHttp);
    procedure ExecuteRestRequest(const AMethod, AUrl, ABody: string; out ARetorno: TCEFRetornoHttp);
    function ExecuteServico(AEntrada: TCEFServicoEntrada): TCEFRespostaServico;
  public
    constructor Create;

    function EnviarRaw(AEntrada: TCEFServicoEntrada): string;
    function IncluirBoleto(AEntrada: TCEFServicoEntrada): TCEFRespostaServico; overload;
    function IncluirBoleto(ABoleto: TCEFOperacaoBoleto; AHeader: TCEFHeader): TCEFRespostaServico; overload;
    function AlterarBoleto(AEntrada: TCEFServicoEntrada): TCEFRespostaServico; overload;
    function AlterarBoleto(ABoleto: TCEFOperacaoBoleto; AHeader: TCEFHeader): TCEFRespostaServico; overload;
    function BaixarBoleto(const ACodigoBeneficiario, ANossoNumero: string; AHeader: TCEFHeader): TCEFRespostaServico;
    function ConsultarBoleto(const ACodigoBeneficiario, ANossoNumero: string; AHeader: TCEFHeader): TCEFRespostaServico;
    function ObterTokenClientCredentialsRest(const AClientId, AClientSecret: string): string;
    function ConsultarSettlementRaw(const ACodigoBeneficiario, ANossoNumero: string): string;
    function ConsultarSettlementPagamento(const ACodigoBeneficiario, ANossoNumero: string; out ADataPagamento: TDateTime; out AValorPago: Double; out AStatus: string): Boolean;

    property Ambiente: TCEFApiAmbiente read FAmbiente write FAmbiente;
    property UrlManutencaoCustom: string read FUrlManutencao write FUrlManutencao;
    property UrlConsultaCustom: string read FUrlConsulta write FUrlConsulta;
    property UrlRestCustom: string read FUrlRest write FUrlRest;
    property OAuthUrlRestCustom: string read FOAuthUrlRest write FOAuthUrlRest;
    property AccessTokenRest: string read FAccessTokenRest write FAccessTokenRest;
    property ApplicationKeyRest: string read FApplicationKeyRest write FApplicationKeyRest;
    property TimeoutConexao: Integer read FTimeoutConexao write FTimeoutConexao;
    property TimeoutEnvio: Integer read FTimeoutEnvio write FTimeoutEnvio;
    property TimeoutRecebimento: Integer read FTimeoutRecebimento write FTimeoutRecebimento;
  end;

function CEFCodigoBeneficiarioApi(ADataSet: TDataSet): string;
function CEFCNPJBeneficiarioApi(ADataSet: TDataSet): string;
function CEFMontarNossoNumeroApi(ADataSet: TDataSet): string;
function CEFNovoHeaderApi(ADataSet: TDataSet; const ACodigoBeneficiario,
  ANossoNumero: string; ADataVencimento: TDateTime; AValor: Double;
  AUsarDadosTitulo: Boolean): TCEFHeader;
function CEFBoletoRegistradoNaApi(ADataSet: TDataSet; AAmbiente: TCEFApiAmbiente;
  ALog: TCEFApiLogProc; out ADataPagamento: TDateTime; out AValorPago: Double): Boolean;
function CEFBoletoRegistradoNaApiComApi(ADataSet: TDataSet; AAmbiente: TCEFApiAmbiente;
  ALog: TCEFApiLogProc; AApi: TCEFApiCobrancas; out ADataPagamento: TDateTime;
  out AValorPago: Double): Boolean;
function CEFAmbienteNome(AAmbiente: TCEFApiAmbiente): string;

implementation

const
  WinHttpRequestOption_SecureProtocols = 9;
  WinHttpRequestSecureProtocol_TLS1_2 = 2048;

var
  CEFTokenLock: TRTLCriticalSection;
  CEFTokenCacheChave: string;
  CEFTokenCacheValor: string;
  CEFTokenCacheValidade: TDateTime;

function CEFFieldStr(ADataSet: TDataSet; const AFieldName, ADefault: string): string;
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

function CEFFieldFloat(ADataSet: TDataSet; const AFieldName: string; ADefault: Double): Double;
var
  Field: TField;
begin
  Result := ADefault;
  if ADataSet = nil then
    Exit;
  Field := ADataSet.FindField(AFieldName);
  if (Field <> nil) and (not Field.IsNull) then
    Result := Field.AsFloat;
end;

function CEFBasicAuthValue(const AClientId, AClientSecret: string): string;
begin
  Result := StringReplace(EncodeString(AClientId + ':' + AClientSecret), #13#10, '', [rfReplaceAll]);
end;

function CEFJsonGetValue(AJson: TJSONValue; const AName: string): TJSONValue;
var
  Obj: TJSONObject;
  I: Integer;
  Pair: TJSONPair;
begin
  Result := nil;
  if not (AJson is TJSONObject) then
    Exit;

  Obj := TJSONObject(AJson);
  for I := 0 to Obj.Size - 1 do
  begin
    Pair := Obj.Get(I);
    if SameText(Pair.JsonString.Value, AName) then
    begin
      Result := Pair.JsonValue;
      Exit;
    end;
  end;
end;

function CEFJsonString(AJson: TJSONValue; const ANames: array of string): string;
var
  I: Integer;
  Value: TJSONValue;
begin
  Result := '';
  for I := Low(ANames) to High(ANames) do
  begin
    Value := CEFJsonGetValue(AJson, ANames[I]);
    if (Value <> nil) and not (Value is TJSONNull) then
    begin
      Result := StringReplace(Value.Value, '"', '', [rfReplaceAll]);
      Result := Trim(Result);
      if Result <> '' then
        Exit;
    end;
  end;
end;

function CEFJsonArrayFirst(AJson: TJSONValue; const AName: string): TJSONValue;
var
  Value: TJSONValue;
begin
  Result := nil;
  Value := CEFJsonGetValue(AJson, AName);
  if (Value is TJSONArray) and (TJSONArray(Value).Size > 0) then
    Result := TJSONArray(Value).Get(0);
end;

function CEFJsonObject(AJson: TJSONValue; const AName: string): TJSONValue;
var
  Value: TJSONValue;
begin
  Result := nil;
  Value := CEFJsonGetValue(AJson, AName);
  if Value is TJSONObject then
    Result := Value;
end;

function CEFStrToApiDate(const AValue: string; out ADate: TDateTime): Boolean;
var
  S: string;
  Y, M, D: Word;
begin
  Result := False;
  ADate := 0;
  S := Trim(AValue);
  if S = '' then
    Exit;

  S := StringReplace(S, '-', '', [rfReplaceAll]);
  S := StringReplace(S, '/', '', [rfReplaceAll]);
  S := Copy(S, 1, 8);
  if Length(S) <> 8 then
    Exit;

  if StrToIntDef(Copy(S, 1, 4), 0) > 1900 then
  begin
    Y := StrToIntDef(Copy(S, 1, 4), 0);
    M := StrToIntDef(Copy(S, 5, 2), 0);
    D := StrToIntDef(Copy(S, 7, 2), 0);
  end
  else
  begin
    D := StrToIntDef(Copy(S, 1, 2), 0);
    M := StrToIntDef(Copy(S, 3, 2), 0);
    Y := StrToIntDef(Copy(S, 5, 4), 0);
  end;

  Result := TryEncodeDate(Y, M, D, ADate);
end;

function CEFStrToApiFloat(const AValue: string; out AFloat: Double): Boolean;
var
  S: string;
  FS: TFormatSettings;
begin
  AFloat := 0;
  S := Trim(AValue);
  if S = '' then
  begin
    Result := False;
    Exit;
  end;

  GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, FS);
  FS.DecimalSeparator := '.';
  FS.ThousandSeparator := ',';
  S := StringReplace(S, 'R$', '', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S, ' ', '', [rfReplaceAll]);
  if (Pos(',', S) > 0) and (Pos('.', S) > 0) then
  begin
    S := StringReplace(S, '.', '', [rfReplaceAll]);
    S := StringReplace(S, ',', '.', [rfReplaceAll]);
  end
  else if Pos(',', S) > 0 then
    S := StringReplace(S, ',', '.', [rfReplaceAll]);

  Result := TryStrToFloat(S, AFloat, FS);
end;

function CEFLeftPadDigits(const AValue: string; ALen: Integer): string;
var
  Digits, Padded: string;
begin
  Digits := CEFOnlyNumbers(AValue);
  if Digits = '' then
  begin
    Result := '';
    Exit;
  end;

  Padded := StringOfChar('0', ALen) + Digits;
  Result := Copy(Padded, Length(Padded) - ALen + 1, ALen);
end;

function CEFDigitoCodigoBeneficiario(const ACodigo: string): string;
var
  I, Peso, Soma, Resto, Digito: Integer;
  Digits: string;
begin
  Result := '';
  Digits := CEFLeftPadDigits(ACodigo, 6);
  if Digits = '' then
    Exit;

  Soma := 0;
  Peso := 2;
  for I := Length(Digits) downto 1 do
  begin
    Soma := Soma + (StrToIntDef(Digits[I], 0) * Peso);
    Inc(Peso);
    if Peso > 9 then
      Peso := 2;
  end;

  Resto := Soma mod 11;
  Digito := 11 - Resto;
  if Digito >= 10 then
    Digito := 0;
  Result := IntToStr(Digito);
end;

function CEFNormalizarCodigoBeneficiarioApi(const AValue: string): string;
var
  Digits, Base: string;
begin
  Digits := CEFOnlyNumbers(AValue);
  if Digits = '' then
  begin
    Result := '';
    Exit;
  end;

  if (Length(Digits) = 7) and (Digits[1] <> '0') then
  begin
    Result := Digits;
    Exit;
  end;

  Base := CEFLeftPadDigits(IntToStr(StrToIntDef(Digits, 0)), 6);
  if Base = '' then
    Result := ''
  else
    Result := Base + CEFDigitoCodigoBeneficiario(Base);
end;

function CEFCodigoBeneficiarioApi(ADataSet: TDataSet): string;
begin
  Result := CEFLeftPadDigits(CEFFieldStr(ADataSet, 'codigo_cedente', ''), 7);
  if Result = '' then
    Result := CEFLeftPadDigits(CEFFieldStr(ADataSet, 'convenio', ''), 7);
end;

function CEFCNPJBeneficiarioApi(ADataSet: TDataSet): string;
begin
  Result := CEFOnlyNumbers(CEFFieldStr(ADataSet, 'cnpj_beneficiario', ''));
  if Result = '' then
    Result := CEFOnlyNumbers(CEFFieldStr(ADataSet, 'empresa_cnpj', ''));
  if Result = '' then
    Result := CEFOnlyNumbers(CEFFieldStr(ADataSet, 'cnpj_empresa', ''));
end;

function CEFMontarNossoNumeroApi(ADataSet: TDataSet): string;
var
  Base: string;
  NossoNumero: string;
begin
  Result := CEFOnlyNumbers(CEFFieldStr(ADataSet, 'nosso_numero', ''));
  if Result <> '' then
  begin
    Result := CEFLeftPadDigits(Result, 17);
    Exit;
  end;

  Base := CEFFieldStr(ADataSet, 'titulo', '') +
          CEFFieldStr(ADataSet, 'sequencia', '');
  NossoNumero := FMFUN.MontaNossoNumero(Base);
  Result := '14'+NossoNumero.padleft(15, '0');
end;

function CEFNovoHeaderApi(ADataSet: TDataSet; const ACodigoBeneficiario,
  ANossoNumero: string; ADataVencimento: TDateTime; AValor: Double;
  AUsarDadosTitulo: Boolean): TCEFHeader;
var
  CNPJBeneficiario: string;
begin
  CNPJBeneficiario := CEFCNPJBeneficiarioApi(ADataSet);
  Result := TCEFHeader.Create;
  Result.Unidade := CEFLeftPadDigits(CEFFieldStr(ADataSet, 'nr_agencia', ''), 4);
  if AUsarDadosTitulo then
    Result.Autenticacao := CEFCalcularAutenticacao(ACodigoBeneficiario,
      ANossoNumero, ADataVencimento, AValor, CNPJBeneficiario)
  else
    Result.Autenticacao := CEFCalcularAutenticacaoConsultaBaixa(
      ACodigoBeneficiario, ANossoNumero, CNPJBeneficiario);
end;

function CEFAmbienteNome(AAmbiente: TCEFApiAmbiente): string;
begin
  case AAmbiente of
    cefHomologacao: Result := 'Homologacao';
  else
    Result := 'Producao';
  end;
end;

procedure CEFLog(ALog: TCEFApiLogProc; const AMensagem: string);
begin
  if Assigned(ALog) then
    ALog(AMensagem);
end;

function CEFRespostaNaoEncontrado(AResposta: TCEFRespostaServico): Boolean;
var
  Msg: string;
begin
  Msg := UpperCase(AResposta.ControleMensagem + ' ' + AResposta.MsgRetorno + ' ' + AResposta.Excecao);
  Result := (Pos('NAO LOCALIZ', Msg) > 0) or (Pos('NAO ENCONTR', Msg) > 0) or
            (Pos('N�O LOCALIZ', Msg) > 0) or (Pos('N�O ENCONTR', Msg) > 0) or
            (Pos('INEXIST', Msg) > 0);
end;

function CEFBoletoRegistradoNaApi(ADataSet: TDataSet; AAmbiente: TCEFApiAmbiente;
  ALog: TCEFApiLogProc; out ADataPagamento: TDateTime; out AValorPago: Double): Boolean;
begin
  Result := CEFBoletoRegistradoNaApiComApi(ADataSet, AAmbiente, ALog, nil,
    ADataPagamento, AValorPago);
end;

function CEFBoletoRegistradoNaApiComApi(ADataSet: TDataSet; AAmbiente: TCEFApiAmbiente;
  ALog: TCEFApiLogProc; AApi: TCEFApiCobrancas; out ADataPagamento: TDateTime;
  out AValorPago: Double): Boolean;
var
  Api: TCEFApiCobrancas;
  Header: TCEFHeader;
  Resposta: TCEFRespostaServico;
  Banco, CodigoBeneficiario, NossoNumero, CNPJBeneficiario: string;
  ClientId, ClientSecret, AppKey, StatusSettlement, ErroSettlement: string;
  ApiPropria: Boolean;
begin
  Result := False;
  ADataPagamento := 0;
  AValorPago := 0;

  Banco := CEFOnlyNumbers(CEFFieldStr(ADataSet, 'nr_banco', ''));
  CodigoBeneficiario := CEFCodigoBeneficiarioApi(ADataSet);
  NossoNumero := CEFMontarNossoNumeroApi(ADataSet);
  CNPJBeneficiario := CEFCNPJBeneficiarioApi(ADataSet);
  ClientId := Trim(CEFFieldStr(ADataSet, 'client_id_cobranca', ''));
  ClientSecret := Trim(CEFFieldStr(ADataSet, 'client_secret_cobranca', ''));
  AppKey := Trim(CEFFieldStr(ADataSet, 'api_key_cobranca', ''));
  if AppKey = '' then
    AppKey := ClientId;

  if (Banco <> '104') or (CodigoBeneficiario = '') or
     (NossoNumero = '') or (CNPJBeneficiario = '') then
    Exit;

  ApiPropria := AApi = nil;
  if ApiPropria then
    Api := TCEFApiCobrancas.Create
  else
    Api := AApi;
  Header := nil;
  try
    Api.Ambiente := AAmbiente;

    if (ClientId <> '') and (ClientSecret <> '') then
    begin
      try
        CEFLog(ALog, 'Consultar boleto completo - ambiente=' + CEFAmbienteNome(AAmbiente) +
          ', nosso_numero=' + NossoNumero + ', codigo_beneficiario=' + CodigoBeneficiario);
        Api.ApplicationKeyRest := AppKey;
        if Api.AccessTokenRest = '' then
          Api.AccessTokenRest := Api.ObterTokenClientCredentialsRest(ClientId, ClientSecret);
        if Api.ConsultarSettlementPagamento(CodigoBeneficiario, NossoNumero,
          ADataPagamento, AValorPago, StatusSettlement) then
        begin
          Result := True;
          CEFLog(ALog, 'Consultar boleto completo OK - ambiente=' + CEFAmbienteNome(AAmbiente) +
            ', nosso_numero=' + NossoNumero + ', situacao=' + StatusSettlement +
            ', data_pagamento=' + FormatDateTime('yyyy-mm-dd', ADataPagamento) +
            ', valor_pago=' + StringReplace(FormatFloat('0.00', AValorPago), ',', '.', [rfReplaceAll]));
          Exit;
        end
        else if StatusSettlement <> '' then
        begin
          if Pos('HTTP ', UpperCase(StatusSettlement)) = 1 then
            CEFLog(ALog, 'Consultar boleto completo ERRO - ambiente=' +
              CEFAmbienteNome(AAmbiente) + ', nosso_numero=' + NossoNumero +
              ', erro=' + StatusSettlement)
          else
          begin
            Result := True;
            CEFLog(ALog, 'Consultar boleto completo OK sem pagamento - ambiente=' +
              CEFAmbienteNome(AAmbiente) + ', nosso_numero=' + NossoNumero +
              ', situacao=' + StatusSettlement);
            Exit;
          end;
        end
        else
          CEFLog(ALog, 'Consultar boleto completo sem retorno JSON - ambiente=' +
            CEFAmbienteNome(AAmbiente) + ', nosso_numero=' + NossoNumero);
      except
        on E: Exception do
        begin
          ErroSettlement := E.Message;
          CEFLog(ALog, 'Consultar boleto completo ERRO - ambiente=' +
            CEFAmbienteNome(AAmbiente) + ', nosso_numero=' + NossoNumero +
            ', erro=' + ErroSettlement);
        end;
      end;
    end;

    CEFLog(ALog, 'Consultar boleto SOAP - ambiente=' + CEFAmbienteNome(AAmbiente) +
      ', nosso_numero=' + NossoNumero + ', codigo_beneficiario=' + CodigoBeneficiario);
    Header := CEFNovoHeaderApi(ADataSet, CodigoBeneficiario, NossoNumero, 0, 0, False);
    Resposta := nil;
    try
      Resposta := Api.ConsultarBoleto(CodigoBeneficiario, NossoNumero, Header);
    except
      on E: TCEFApiException do
      begin
        CEFLog(ALog, 'Consultar boleto SOAP ERRO HTTP - ambiente=' + CEFAmbienteNome(AAmbiente) +
          ', nosso_numero=' + NossoNumero + ', codigo_beneficiario=' + CodigoBeneficiario +
          ', erro=' + E.Message);
        Exit;
      end;
      on E: Exception do
      begin
        CEFLog(ALog, 'Consultar boleto SOAP ERRO - ambiente=' + CEFAmbienteNome(AAmbiente) +
          ', nosso_numero=' + NossoNumero + ', codigo_beneficiario=' + CodigoBeneficiario +
          ', erro=' + E.Message);
        raise;
      end;
    end;
    try
      if Resposta.Sucesso then
      begin
        Result := True;
        CEFLog(ALog, 'Consultar boleto SOAP OK - ambiente=' + CEFAmbienteNome(AAmbiente) +
          ', nosso_numero=' + NossoNumero + ', codigo_beneficiario=' + CodigoBeneficiario +
          ', retorno=' + Resposta.ControleMensagem);

        if Pos('LIQUIDADO', UpperCase(Resposta.ControleMensagem)) > 0 then
        begin
          if (ClientId <> '') and (ClientSecret <> '') then
          begin
            try
             Api.ApplicationKeyRest := AppKey;
              if Api.AccessTokenRest = '' then
                Api.AccessTokenRest := Api.ObterTokenClientCredentialsRest(ClientId, ClientSecret);
              if Api.ConsultarSettlementPagamento(CodigoBeneficiario, NossoNumero,
                ADataPagamento, AValorPago, StatusSettlement) then
                CEFLog(ALog, 'Consultar settlement OK - ambiente=' + CEFAmbienteNome(AAmbiente) +
                  ', nosso_numero=' + NossoNumero + ', status=' + StatusSettlement +
                  ', data_pagamento=' + FormatDateTime('yyyy-mm-dd', ADataPagamento) +
                  ', valor_pago=' + StringReplace(FormatFloat('0.00', AValorPago), ',', '.', [rfReplaceAll]))
              else
                CEFLog(ALog, 'Consultar settlement sem pagamento - ambiente=' + CEFAmbienteNome(AAmbiente) +
                  ', nosso_numero=' + NossoNumero + ', status=' + StatusSettlement);
            except
              on E: Exception do
              begin
                ErroSettlement := E.Message;
                CEFLog(ALog, 'Consultar settlement ERRO - ambiente=' + CEFAmbienteNome(AAmbiente) +
                  ', nosso_numero=' + NossoNumero + ', erro=' + ErroSettlement);
              end;
            end;
          end
          else
            CEFLog(ALog, 'Consultar settlement ignorado - credenciais REST nao informadas - ambiente=' +
              CEFAmbienteNome(AAmbiente) + ', nosso_numero=' + NossoNumero);
        end;
      end
      else if CEFRespostaNaoEncontrado(Resposta) then
        CEFLog(ALog, 'Consultar boleto nao registrado - ambiente=' + CEFAmbienteNome(AAmbiente) +
          ', nosso_numero=' + NossoNumero + ', codigo_beneficiario=' + CodigoBeneficiario +
          ', retorno=' + Resposta.ControleMensagem)
      else
      begin
        CEFLog(ALog, 'Consultar boleto ERRO - ambiente=' + CEFAmbienteNome(AAmbiente) +
          ', nosso_numero=' + NossoNumero + ', codigo_beneficiario=' + CodigoBeneficiario +
          ', retorno=' + Resposta.ControleMensagem);
        raise Exception.Create('Erro API CEF: ' + Resposta.ControleMensagem);
      end;
    finally
      Resposta.Free;
    end;
  finally
    Header.Free;
    if ApiPropria then
      Api.Free;
  end;
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
  end;
end;

constructor TCEFApiException.Create(AStatusCode: Integer; const AStatusText, AResponseText: string);
begin
  inherited CreateFmt('Erro API CEF HTTP %d - %s: %s', [AStatusCode, AStatusText, AResponseText]);
  FStatusCode := AStatusCode;
  FStatusText := AStatusText;
  FResponseText := AResponseText;
end;

constructor TCEFApiCobrancas.Create;
begin
  inherited Create;
  FAmbiente := cefProducao;
  FTimeoutConexao := 30000;
  FTimeoutEnvio := 30000;
  FTimeoutRecebimento := 60000;
end;

function CEFSOAPAction(AOperacao: TCEFOperacaoCobranca): string;
begin
  case AOperacao of
    cefIncluiBoleto: Result := 'IncluiBoleto';
    cefAlteraBoleto: Result := 'AlteraBoleto';
    cefBaixaBoleto: Result := 'BaixaBoleto';
  else
    Result := 'ConsultaBoleto';
  end;
end;
function TCEFApiCobrancas.UrlManutencao: string;
begin
  if Trim(FUrlManutencao) <> '' then
    Result := FUrlManutencao
  else
    Result := 'https://barramento.caixa.gov.br/sibar/ManutencaoCobrancaBancaria/Boleto/Externo';
end;

function TCEFApiCobrancas.UrlConsulta: string;
begin
  if Trim(FUrlConsulta) <> '' then
    Result := FUrlConsulta
  else
    Result := 'https://barramento.caixa.gov.br/sibar/ConsultaCobrancaBancaria/Boleto';
end;

function TCEFApiCobrancas.UrlRest: string;
begin
  if Trim(FUrlRest) <> '' then
    Result := FUrlRest
  else
  begin
    case FAmbiente of
      cefHomologacao: Result := 'https://api.caixa.gov.br:8443/sandbox';
    else
      Result := 'https://api.caixa.gov.br:8443';
    end;
  end;
end;

function TCEFApiCobrancas.OAuthUrlRest: string;
begin
  if Trim(FOAuthUrlRest) <> '' then
    Result := FOAuthUrlRest
  else
  begin
    case FAmbiente of
      cefHomologacao: Result := 'https://logindes.caixa.gov.br/auth/realms/internet/protocol/openid-connect/token';
    else
      Result := 'https://loginservicos.caixa.gov.br/auth/realms/internet/protocol/openid-connect/token';
    end;
  end;
end;

function TCEFApiCobrancas.UrlOperacao(AOperacao: TCEFOperacaoCobranca): string;
begin
  if AOperacao = cefConsultaBoleto then
    Result := UrlConsulta
  else
    Result := UrlManutencao;
end;

procedure TCEFApiCobrancas.ExecuteRequest(const AUrl, ABody, ASOAPAction: string; out ARetorno: TCEFRetornoHttp);
var
  Http: OleVariant;
  ComInit: Integer;
begin
  ComInit := BeginComThread;
  try
    Http := CreateOleObject('WinHttp.WinHttpRequest.5.1');
    ConfigureWinHttpSecureProtocols(Http);
    Http.Open('POST', AUrl, False);
    Http.SetRequestHeader('Accept', 'text/xml');
    Http.SetRequestHeader('Content-Type', 'text/xml; charset=utf-8');
    Http.SetRequestHeader('SOAPAction', '"' + ASOAPAction + '"');
    Http.SetTimeouts(FTimeoutConexao, FTimeoutConexao, FTimeoutEnvio, FTimeoutRecebimento);
    Http.Send(ABody);

    ARetorno.StatusCode := Integer(Http.Status);
    ARetorno.StatusText := VarToStr(Http.StatusText);
    ARetorno.ResponseText := VarToStr(Http.ResponseText);

    if (ARetorno.StatusCode < 200) or (ARetorno.StatusCode > 299) then
      raise TCEFApiException.Create(ARetorno.StatusCode, ARetorno.StatusText, ARetorno.ResponseText);
  finally
    EndComThread(ComInit);
  end;
end;


procedure TCEFApiCobrancas.ExecuteRestRequest(const AMethod, AUrl, ABody: string; out ARetorno: TCEFRetornoHttp);
var
  Http: OleVariant;
  ComInit: Integer;
begin
  ComInit := BeginComThread;
  try
    Http := CreateOleObject('WinHttp.WinHttpRequest.5.1');
    ConfigureWinHttpSecureProtocols(Http);
    Http.Open(AMethod, AUrl, False);
    Http.SetRequestHeader('Accept', 'application/json');
    if Trim(ABody) <> '' then
      Http.SetRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
    else
      Http.SetRequestHeader('Content-Type', 'application/json');
    if Trim(FAccessTokenRest) <> '' then
      Http.SetRequestHeader('Authorization', 'Bearer ' + Trim(FAccessTokenRest));
    if Trim(FApplicationKeyRest) <> '' then
    begin
      Http.SetRequestHeader('apikey', Trim(FApplicationKeyRest));
      Http.SetRequestHeader('x-api-key', Trim(FApplicationKeyRest));
      Http.SetRequestHeader('X-Application-Key', Trim(FApplicationKeyRest));
    end;
    Http.SetTimeouts(FTimeoutConexao, FTimeoutConexao, FTimeoutEnvio, FTimeoutRecebimento);
    Http.Send(ABody);

    ARetorno.StatusCode := Integer(Http.Status);
    ARetorno.StatusText := VarToStr(Http.StatusText);
    ARetorno.ResponseText := VarToStr(Http.ResponseText);
  finally
    EndComThread(ComInit);
  end;
end;

function TCEFApiCobrancas.ObterTokenClientCredentialsRest(const AClientId, AClientSecret: string): string;
var
  Http: OleVariant;
  ComInit: Integer;
  Retorno, CacheChave, SExpira: string;
  JsonValue: TJSONValue;
  AccessValue: TJSONValue;
  StatusCode, Tentativa, ExpiraSegundos: Integer;
begin
  Result := '';
  CacheChave := LowerCase(Trim(OAuthUrlRest)) + '|' + Trim(AClientId);

  EnterCriticalSection(CEFTokenLock);
  try
    if (CEFTokenCacheChave = CacheChave) and
       (CEFTokenCacheValor <> '') and
       (CEFTokenCacheValidade > Now) then
    begin
      Result := CEFTokenCacheValor;
      FAccessTokenRest := Result;
      Exit;
    end;

    ComInit := BeginComThread;
    try
      Tentativa := 0;
      repeat
        Inc(Tentativa);
        Http := CreateOleObject('WinHttp.WinHttpRequest.5.1');
        ConfigureWinHttpSecureProtocols(Http);
        Http.Open('POST', OAuthUrlRest, False);
        Http.SetRequestHeader('Accept', 'application/json');
        Http.SetRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        Http.SetTimeouts(FTimeoutConexao, FTimeoutConexao, FTimeoutEnvio,
          FTimeoutRecebimento);
        Http.Send('client_id=' + TIdURI.ParamsEncode(Trim(AClientId)) +
          '&client_secret=' + TIdURI.ParamsEncode(Trim(AClientSecret)) +
          '&grant_type=client_credentials');

        StatusCode := Integer(Http.Status);
        if (StatusCode <> 429) or (Tentativa >= 4) then
          Break;

        Sleep(5000 * Tentativa);
        Http := Unassigned;
      until False;

      if (StatusCode < 200) or (StatusCode > 299) then
        raise TCEFApiException.Create(StatusCode, VarToStr(Http.StatusText),
          VarToStr(Http.ResponseText));

      Retorno := VarToStr(Http.ResponseText);
      JsonValue := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Retorno), 0);
      try
        AccessValue := CEFJsonGetValue(JsonValue, 'access_token');
        if AccessValue <> nil then
          Result := AccessValue.Value;

        SExpira := CEFJsonString(JsonValue, ['expires_in']);
        ExpiraSegundos := StrToIntDef(SExpira, 300);
        if ExpiraSegundos > 60 then
          Dec(ExpiraSegundos, 60);
        if ExpiraSegundos < 60 then
          ExpiraSegundos := 60;
      finally
        JsonValue.Free;
      end;

      if Result = '' then
        raise Exception.Create('Token de acesso nao retornado pela API CEF.');

      FAccessTokenRest := Result;
      CEFTokenCacheChave := CacheChave;
      CEFTokenCacheValor := Result;
      CEFTokenCacheValidade := Now + (ExpiraSegundos / 86400);
    finally
      EndComThread(ComInit);
    end;
  finally
    LeaveCriticalSection(CEFTokenLock);
  end;
end;
function TCEFApiCobrancas.ConsultarSettlementRaw(const ACodigoBeneficiario, ANossoNumero: string): string;
var
  Retorno: TCEFRetornoHttp;
begin
  ExecuteRestRequest('GET', UrlRest + '/cobranca-bancaria/v4/beneficiarios/' +
    TIdURI.ParamsEncode(Trim(ACodigoBeneficiario)) + '/boletos/' +
    TIdURI.ParamsEncode(Trim(ANossoNumero)), '', Retorno);
  if (Retorno.StatusCode < 200) or (Retorno.StatusCode > 299) then
    Result := 'HTTP ' + IntToStr(Retorno.StatusCode) + ' - ' +
      Retorno.StatusText + ': ' + Retorno.ResponseText
  else
    Result := Retorno.ResponseText;
end;

function TCEFApiCobrancas.ConsultarSettlementPagamento(const ACodigoBeneficiario,
  ANossoNumero: string; out ADataPagamento: TDateTime; out AValorPago: Double;
  out AStatus: string): Boolean;
var
  Raw: string;
  JsonValue, DadosCadastrais, Pagamento: TJSONValue;
  SData, SValor: string;
begin
  Result := False;
  ADataPagamento := 0;
  AValorPago := 0;
  AStatus := '';

  Raw := ConsultarSettlementRaw(ACodigoBeneficiario, ANossoNumero);
  if Pos('HTTP ', UpperCase(Trim(Raw))) = 1 then
  begin
    AStatus := Raw;
    Exit;
  end;

  JsonValue := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Raw), 0);
  try
    if JsonValue = nil then
      Exit;
    DadosCadastrais := CEFJsonObject(JsonValue, 'dados_cadastrais');
    if DadosCadastrais = nil then
      DadosCadastrais := JsonValue;

    AStatus := CEFJsonString(DadosCadastrais, ['situacao', 'situa��o', 'status', 'situation']);
    if AStatus = '' then
      AStatus := CEFJsonString(JsonValue, ['situacao', 'situa��o', 'status', 'situation']);

    SData := CEFJsonString(DadosCadastrais, ['data_hora_pagamento',
      'data_pagamento', 'dataPagamento', 'data_liquidacao', 'dataLiquidacao',
      'data_credito', 'dataCredito']);

    if SData = '0001-01-01-00.00.00' then
      SData := FormatDateTime('yyyy-mm-dd', Now);

    SValor := CEFJsonString(DadosCadastrais, ['valor_pago', 'valorPago']);

    if (SData = '') or (SValor = '') then
    begin
      Pagamento := CEFJsonObject(DadosCadastrais, 'pagamento');
      if Pagamento <> nil then
      begin
        if SData = '' then
          SData := CEFJsonString(Pagamento, ['data_hora_pagamento',
            'data_pagamento', 'dataPagamento', 'data_liquidacao', 'dataLiquidacao']);
        if SValor = '' then
          SValor := CEFJsonString(Pagamento, ['valor_pago', 'valorPago']);
      end;
    end;

    Result := ((Pos('LIQUIDADO', UpperCase(AStatus)) > 0) or
      (Pos('PAGO', UpperCase(AStatus)) > 0)) and
      CEFStrToApiFloat(SValor, AValorPago) and
      (AValorPago > 0);

    if Result then
      CEFStrToApiDate(SData, ADataPagamento);
    Result := Result and (ADataPagamento > 0);
  finally
    JsonValue.Free;
  end;
end;

function TCEFApiCobrancas.ExecuteServico(AEntrada: TCEFServicoEntrada): TCEFRespostaServico;
var
  Retorno: TCEFRetornoHttp;
begin
  ExecuteRequest(UrlOperacao(AEntrada.Operacao), AEntrada.ToSOAPXML, CEFSOAPAction(AEntrada.Operacao), Retorno);
  Result := TCEFRespostaServico.Create;
  try
    Result.FromXML(Retorno.ResponseText);
  except
    Result.Free;
    raise;
  end;
end;

function TCEFApiCobrancas.EnviarRaw(AEntrada: TCEFServicoEntrada): string;
var
  Retorno: TCEFRetornoHttp;
begin
  ExecuteRequest(UrlOperacao(AEntrada.Operacao), AEntrada.ToSOAPXML, CEFSOAPAction(AEntrada.Operacao), Retorno);
  Result := Retorno.ResponseText;
end;

function TCEFApiCobrancas.IncluirBoleto(AEntrada: TCEFServicoEntrada): TCEFRespostaServico;
begin
  AEntrada.Operacao := cefIncluiBoleto;
  Result := ExecuteServico(AEntrada);
end;

function TCEFApiCobrancas.IncluirBoleto(ABoleto: TCEFOperacaoBoleto; AHeader: TCEFHeader): TCEFRespostaServico;
var
  Entrada: TCEFServicoEntrada;
begin
  Entrada := TCEFServicoEntrada.Create;
  try
    Entrada.Operacao := cefIncluiBoleto;
    Entrada.Header.Free;
    Entrada.Header := AHeader;
    Entrada.Boleto.Free;
    Entrada.Boleto := ABoleto;
    try
      Result := ExecuteServico(Entrada);
    finally
      Entrada.Header := nil;
      Entrada.Boleto := nil;
    end;
  finally
    Entrada.Free;
  end;
end;

function TCEFApiCobrancas.AlterarBoleto(AEntrada: TCEFServicoEntrada): TCEFRespostaServico;
begin
  AEntrada.Operacao := cefAlteraBoleto;
  Result := ExecuteServico(AEntrada);
end;

function TCEFApiCobrancas.AlterarBoleto(ABoleto: TCEFOperacaoBoleto; AHeader: TCEFHeader): TCEFRespostaServico;
var
  Entrada: TCEFServicoEntrada;
begin
  Entrada := TCEFServicoEntrada.Create;
  try
    Entrada.Operacao := cefAlteraBoleto;
    Entrada.Header.Free;
    Entrada.Header := AHeader;
    Entrada.Boleto.Free;
    Entrada.Boleto := ABoleto;
    try
      Result := ExecuteServico(Entrada);
    finally
      Entrada.Header := nil;
      Entrada.Boleto := nil;
    end;
  finally
    Entrada.Free;
  end;
end;

function TCEFApiCobrancas.BaixarBoleto(const ACodigoBeneficiario, ANossoNumero: string;
  AHeader: TCEFHeader): TCEFRespostaServico;
var
  Entrada: TCEFServicoEntrada;
begin
  Entrada := TCEFServicoEntrada.Create;
  try
    Entrada.Operacao := cefBaixaBoleto;
    Entrada.Header.Free;
    Entrada.Header := AHeader;
    Entrada.Boleto.CodigoBeneficiario := ACodigoBeneficiario;
    Entrada.Boleto.NossoNumero := ANossoNumero;
    try
      Result := ExecuteServico(Entrada);
    finally
      Entrada.Header := nil;
    end;
  finally
    Entrada.Free;
  end;
end;

function TCEFApiCobrancas.ConsultarBoleto(const ACodigoBeneficiario, ANossoNumero: string;
  AHeader: TCEFHeader): TCEFRespostaServico;
var
  Entrada: TCEFServicoEntrada;
begin
  Entrada := TCEFServicoEntrada.Create;
  try
    Entrada.Operacao := cefConsultaBoleto;
    Entrada.Header.Free;
    Entrada.Header := AHeader;
    Entrada.Boleto.CodigoBeneficiario := ACodigoBeneficiario;
    Entrada.Boleto.NossoNumero := ANossoNumero;
    try
      Result := ExecuteServico(Entrada);
    finally
      Entrada.Header := nil;
    end;
  finally
    Entrada.Free;
  end;
end;

initialization
  InitializeCriticalSection(CEFTokenLock);

finalization
  DeleteCriticalSection(CEFTokenLock);

end.


