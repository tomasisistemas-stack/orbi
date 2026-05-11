unit Un_speedio_api;

interface

uses
  System.SysUtils,
  System.Classes,
  System.JSON,
  System.Variants,
  StrUtils,
  IniFiles,
  ComObj,
  IdURI;

type
  TSpeedioApi = class(TObject)
  private
    FBaseUrl: string;
    FAccessToken: string;
    FRefreshToken: string;
    FTokenFileName: string;
    function BuildUrlFindByCNPJ(const ACNPJ: string): string;
    function NormalizeCNPJ(const ACNPJ: string): string;
    function GetJSONValueByPath(AJSON: TJSONValue; const APath: string): string;
    function GetJSONValueByPaths(AJSON: TJSONValue; const APaths: array of string): string;
    procedure ExecuteRequest(const AMethod: string; const AUrl: string; const ABody: string; const AUseBearer: Boolean;
      out AStatus: Integer; out AStatusText: string; out AResponseText: string);
    procedure LoadTokensFromIni;
    procedure SaveTokensToIni;
    procedure RefreshAccessToken;
  public
    constructor Create(const AAccessToken: string; const ARefreshToken: string = ''; const ABaseUrl: string = 'https://api.speedio.com.br/api/v4';
      const ATokenFileName: string = '');
    property AccessToken: string read FAccessToken write FAccessToken;
    property RefreshToken: string read FRefreshToken write FRefreshToken;
    property BaseUrl: string read FBaseUrl write FBaseUrl;
    property TokenFileName: string read FTokenFileName write FTokenFileName;
    function BuscarEmpresaPorCNPJRaw(const ACNPJ: string): string;
    function BuscarEmpresaPorCNPJ(const ACNPJ: string): TJSONObject;
    procedure BuscarDadosPorCNPJ(const ACNPJ: string; out RazaoSocial: string; out Fantasia: string; out CEP: string; out Endereco: string; out Numero: string; out Complemento: string;
      out Bairro: string; out Cidade: string; out UF: string; out EmpresaTipo: string; out Situacao: string);
  end;

implementation

function TSpeedioApi.NormalizeCNPJ(const ACNPJ: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(Trim(ACNPJ)) do
    if CharInSet(ACNPJ[I], ['0'..'9']) then
      Result := Result + ACNPJ[I];
end;

function TSpeedioApi.BuildUrlFindByCNPJ(const ACNPJ: string): string;
begin
  Result := FBaseUrl + '/companies/find_by_cnpj?cnpj=' + TIdURI.ParamsEncode(NormalizeCNPJ(ACNPJ));
end;

function TSpeedioApi.GetJSONValueByPath(AJSON: TJSONValue; const APath: string): string;
var
  LCurrent: TJSONValue;
  LParts: TStringList;
  LPart: string;
  LName: string;
  LIndexStart: Integer;
  LIndexEnd: Integer;
  LIndex: Integer;
  LJSONArray: TJSONArray;
  LJSONObject: TJSONObject;
  I: Integer;
begin
  Result := '';
  if (AJSON = nil) or (Trim(APath) = '') then
    Exit;

  LCurrent := AJSON;
  LParts := TStringList.Create;
  try
    ExtractStrings(['.'], [], PChar(APath), LParts);

    for I := 0 to LParts.Count - 1 do
    begin
      LPart := LParts[I];

      if LCurrent = nil then
        Exit('');

      LName := LPart;
      LIndex := -1;
      LIndexStart := Pos('[', LPart);
      if LIndexStart > 0 then
      begin
        LIndexEnd := Pos(']', LPart);
        if LIndexEnd > LIndexStart then
        begin
          LName := Copy(LPart, 1, LIndexStart - 1);
          LIndex := StrToIntDef(Copy(LPart, LIndexStart + 1, LIndexEnd - LIndexStart - 1), -1);
        end;
      end;

      if LName <> '' then
      begin
        if not (LCurrent is TJSONObject) then
          Exit('');
        LJSONObject := TJSONObject(LCurrent);
        LCurrent := LJSONObject.GetValue(LName);
      end;

      if LIndex >= 0 then
      begin
        if not (LCurrent is TJSONArray) then
          Exit('');
        LJSONArray := TJSONArray(LCurrent);
        if (LIndex < 0) or (LIndex >= LJSONArray.Count) then
          Exit('');
        LCurrent := LJSONArray.Items[LIndex];
      end;
    end;
  finally
    LParts.Free;
  end;

  if LCurrent = nil then
    Exit('');

  if LCurrent is TJSONNull then
    Exit('');

  if LCurrent is TJSONString then
    Result := TJSONString(LCurrent).Value
  else
    Result := LCurrent.Value;
end;

function TSpeedioApi.GetJSONValueByPaths(AJSON: TJSONValue; const APaths: array of string): string;
var
  I: Integer;
begin
  Result := '';
  for I := Low(APaths) to High(APaths) do
  begin
    Result := Trim(GetJSONValueByPath(AJSON, APaths[I]));
    if Result <> '' then
      Exit;
  end;
end;

procedure TSpeedioApi.ExecuteRequest(const AMethod: string; const AUrl: string; const ABody: string; const AUseBearer: Boolean;
  out AStatus: Integer; out AStatusText: string; out AResponseText: string);
var
  LHttp: OleVariant;
begin
  LHttp := CreateOleObject('WinHttp.WinHttpRequest.5.1');
  LHttp.Open(AMethod, AUrl, False);
  LHttp.SetRequestHeader('Accept', 'application/json');
  if AUseBearer and (Trim(FAccessToken) <> '') then
    LHttp.SetRequestHeader('Authorization', 'Bearer ' + Trim(FAccessToken));
  if Trim(ABody) <> '' then
    LHttp.SetRequestHeader('Content-Type', 'application/json');
  LHttp.SetTimeouts(10000, 10000, 30000, 30000);

  if Trim(ABody) <> '' then
    LHttp.Send(ABody)
  else
    LHttp.Send(EmptyParam);

  AStatus := Integer(LHttp.Status);
  AStatusText := VarToStr(LHttp.StatusText);
  AResponseText := VarToStr(LHttp.ResponseText);
end;

procedure TSpeedioApi.LoadTokensFromIni;
var
  LIni: TIniFile;
  LAccessToken: string;
  LRefreshToken: string;
begin
  if (Trim(FTokenFileName) = '') or (not FileExists(FTokenFileName)) then
    Exit;

  LIni := TIniFile.Create(FTokenFileName);
  try
    LAccessToken := Trim(LIni.ReadString('AUTH', 'AccessToken', ''));
    LRefreshToken := Trim(LIni.ReadString('AUTH', 'RefreshToken', ''));
    if LAccessToken <> '' then
      FAccessToken := LAccessToken;
    if LRefreshToken <> '' then
      FRefreshToken := LRefreshToken;
  finally
    LIni.Free;
  end;
end;

procedure TSpeedioApi.SaveTokensToIni;
var
  LIni: TIniFile;
begin
  if Trim(FTokenFileName) = '' then
    Exit;

  LIni := TIniFile.Create(FTokenFileName);
  try
    LIni.WriteString('AUTH', 'AccessToken', Trim(FAccessToken));
    LIni.WriteString('AUTH', 'RefreshToken', Trim(FRefreshToken));
  finally
    LIni.Free;
  end;
end;

procedure TSpeedioApi.RefreshAccessToken;
var
  LRequestBody: TJSONObject;
  LResponseJson: TJSONValue;
  LStatus: Integer;
  LStatusText: string;
  LResponseText: string;
  LNewAccessToken: string;
  LNewRefreshToken: string;
begin
  if Trim(FRefreshToken) = '' then
    raise Exception.Create('Refresh token da Speedio nao informado. Configure o arquivo ' + FTokenFileName + '.');

  LRequestBody := TJSONObject.Create;
  try
    LRequestBody.AddPair('refresh_token', FRefreshToken);
    ExecuteRequest('POST', 'https://api.speedio.com.br/api/v3/auth/refresh_integration_token', LRequestBody.ToString, False,
      LStatus, LStatusText, LResponseText);
  finally
    LRequestBody.Free;
  end;

  if (LStatus < 200) or (LStatus >= 300) then
    raise Exception.CreateFmt('Erro ao renovar token Speedio HTTP %d: %s. %s', [LStatus, LStatusText, LResponseText]);

  LResponseJson := TJSONObject.ParseJSONValue(LResponseText);
  if not (LResponseJson is TJSONObject) then
  begin
    LResponseJson.Free;
    raise Exception.Create('Resposta invalida ao renovar token da Speedio.');
  end;

  try
    LNewAccessToken := Trim(GetJSONValueByPath(LResponseJson, 'token'));
    LNewRefreshToken := Trim(GetJSONValueByPath(LResponseJson, 'refresh_token'));
    if LNewAccessToken = '' then
      raise Exception.Create('A Speedio nao retornou um novo access token.');
    if LNewRefreshToken = '' then
      raise Exception.Create('A Speedio nao retornou um novo refresh token.');

    FAccessToken := LNewAccessToken;
    FRefreshToken := LNewRefreshToken;
    SaveTokensToIni;
  finally
    LResponseJson.Free;
  end;
end;

constructor TSpeedioApi.Create(const AAccessToken: string; const ARefreshToken: string; const ABaseUrl: string; const ATokenFileName: string);
begin
  inherited Create;
  FAccessToken := Trim(AAccessToken);
  FRefreshToken := Trim(ARefreshToken);
  FBaseUrl := ExcludeTrailingPathDelimiter(Trim(ABaseUrl));
  if Trim(ATokenFileName) <> '' then
    FTokenFileName := ATokenFileName
  else
    FTokenFileName := ExtractFilePath(ParamStr(0)) + 'speedio.ini';
  LoadTokensFromIni;
end;

function TSpeedioApi.BuscarEmpresaPorCNPJRaw(const ACNPJ: string): string;
var
  LStatus: Integer;
  LStatusText: string;
  LResponseText: string;
begin
  if NormalizeCNPJ(ACNPJ) = '' then
    raise Exception.Create('CNPJ nao informado.');

  if (Trim(FAccessToken) = '') and (Trim(FRefreshToken) <> '') then
    RefreshAccessToken;

  if Trim(FAccessToken) = '' then
    raise Exception.Create('Access token da Speedio nao informado e nao foi possivel renovar. Configure o arquivo ' + FTokenFileName + '.');

  ExecuteRequest('GET', BuildUrlFindByCNPJ(ACNPJ), '', True, LStatus, LStatusText, LResponseText);

  if (LStatus = 401) and (Trim(FRefreshToken) <> '') then
  begin
    RefreshAccessToken;
    ExecuteRequest('GET', BuildUrlFindByCNPJ(ACNPJ), '', True, LStatus, LStatusText, LResponseText);
  end;

  if (LStatus < 200) or (LStatus >= 300) then
    raise Exception.CreateFmt('Erro Speedio HTTP %d: %s. %s', [LStatus, LStatusText, LResponseText]);

  Result := LResponseText;
end;

function TSpeedioApi.BuscarEmpresaPorCNPJ(const ACNPJ: string): TJSONObject;
var
  LJSON: TJSONValue;
begin
  LJSON := TJSONObject.ParseJSONValue(BuscarEmpresaPorCNPJRaw(ACNPJ));
  if not (LJSON is TJSONObject) then
  begin
    LJSON.Free;
    raise Exception.Create('Resposta JSON invalida da Speedio.');
  end;
  Result := TJSONObject(LJSON);
end;

procedure TSpeedioApi.BuscarDadosPorCNPJ(const ACNPJ: string; out RazaoSocial: string; out Fantasia: string; out CEP: string; out Endereco: string; out Numero: string;
  out Complemento: string; out Bairro: string; out Cidade: string; out UF: string; out EmpresaTipo: string; out Situacao: string);
var
  LJSON: TJSONObject;
  LTipoLogradouro: string;
  LNomeRua: string;
begin
  RazaoSocial := '';
  Fantasia := '';
  CEP := '';
  Endereco := '';
  Numero := '';
  Complemento := '';
  Bairro := '';
  Cidade := '';
  UF := '';
  EmpresaTipo := '';
  Situacao := '';

  LJSON := BuscarEmpresaPorCNPJ(ACNPJ);
  try
    RazaoSocial := GetJSONValueByPaths(LJSON, ['razao_social', 'nome', 'name', 'company.razao_social', 'company.nome']);
    Fantasia := GetJSONValueByPaths(LJSON, ['nome_fantasia', 'fantasia', 'trade_name', 'company.nome_fantasia']);
    CEP := GetJSONValueByPaths(LJSON, ['address.cep', 'address.zip_code', 'location.cep', 'cep']);

    LTipoLogradouro := GetJSONValueByPaths(LJSON, ['address.type_public_place', 'address.street_type', 'location.tipo_logradouro']);
    LNomeRua := GetJSONValueByPaths(LJSON, ['address.name_public_place', 'address.street', 'location.nome_rua', 'logradouro', 'endereco']);
    Endereco := Trim(Trim(LTipoLogradouro + ' ' + LNomeRua));
    if Endereco = '' then
      Endereco := GetJSONValueByPaths(LJSON, ['address.full_address', 'location.logradouro', 'logradouro', 'endereco']);

    Numero := GetJSONValueByPaths(LJSON, ['address.number_public_place', 'address.number', 'location.numero', 'numero']);
    Complemento := GetJSONValueByPaths(LJSON, ['address.complement', 'location.complemento', 'complemento']);
    Bairro := GetJSONValueByPaths(LJSON, ['address.neighborhood', 'address.district', 'location.bairro', 'bairro']);
    Cidade := GetJSONValueByPaths(LJSON, ['address.city', 'location.municipio', 'location.cidade', 'cidade', 'municipio']);
    UF := GetJSONValueByPaths(LJSON, ['address.state', 'location.uf', 'uf']);
    EmpresaTipo := GetJSONValueByPaths(LJSON, ['main_activity.description', 'main_activity.text', 'atividade_principal[0].text', 'natureza_juridica', 'company_type']);
    Situacao := GetJSONValueByPaths(LJSON, ['situacao_cadastral', 'situacao', 'status', 'registration.status']);
  finally
    LJSON.Free;
  end;
end;

end.


