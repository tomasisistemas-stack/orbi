unit Un_BB_Cobrancas;

interface

uses
  System.Classes,
  System.JSON,
  System.SysUtils;

type
  TBBJsonModel = class
  protected
    procedure AddString(AJson: TJSONObject; const AName, AValue: string);
    procedure AddInteger(AJson: TJSONObject; const AName: string; AValue: Integer);
    procedure AddInt64(AJson: TJSONObject; const AName: string; AValue: Int64);
    procedure AddFloat(AJson: TJSONObject; const AName: string; AValue: Double);
    procedure AddObject(AJson: TJSONObject; const AName: string; AValue: TJSONObject);
    function GetString(AJson: TJSONObject; const AName: string): string;
    function GetInteger(AJson: TJSONObject; const AName: string): Integer;
    function GetInt64(AJson: TJSONObject; const AName: string): Int64;
    function GetFloat(AJson: TJSONObject; const AName: string): Double;
    function GetObject(AJson: TJSONObject; const AName: string): TJSONObject;
    function GetArray(AJson: TJSONObject; const AName: string): TJSONArray;
  public
    procedure FromJSON(AJson: TJSONObject); virtual;
    function ToJSON: TJSONObject; virtual;
  end;

  TBBPagador = class(TBBJsonModel)
  public
    TipoInscricao: Integer;
    NumeroInscricao: Int64;
    Nome: string;
    Endereco: string;
    Cep: Integer;
    Cidade: string;
    Bairro: string;
    Uf: string;
    Telefone: string;
    Email: string;
    procedure FromJSON(AJson: TJSONObject); override;
    function ToJSON: TJSONObject; override;
  end;

  TBBBeneficiarioFinal = class(TBBJsonModel)
  public
    TipoInscricao: Integer;
    NumeroInscricao: Int64;
    Nome: string;
    procedure FromJSON(AJson: TJSONObject); override;
    function ToJSON: TJSONObject; override;
  end;

  TBBDesconto = class(TBBJsonModel)
  public
    Tipo: Integer;
    DataExpiracao: string;
    Porcentagem: Double;
    Valor: Double;
    procedure FromJSON(AJson: TJSONObject); override;
    function ToJSON: TJSONObject; override;
  end;

  TBBJurosMora = class(TBBJsonModel)
  public
    Tipo: Integer;
    Porcentagem: Double;
    Valor: Double;
    procedure FromJSON(AJson: TJSONObject); override;
    function ToJSON: TJSONObject; override;
  end;

  TBBMulta = class(TBBJsonModel)
  public
    Tipo: Integer;
    Data: string;
    Porcentagem: Double;
    Valor: Double;
    procedure FromJSON(AJson: TJSONObject); override;
    function ToJSON: TJSONObject; override;
  end;

  TBBRegistroBoleto = class(TBBJsonModel)
  public
    NumeroConvenio: Int64;
    NumeroCarteira: Integer;
    NumeroVariacaoCarteira: Integer;
    CodigoModalidade: Integer;
    DataEmissao: string;
    DataVencimento: string;
    ValorOriginal: Double;
    ValorAbatimento: Double;
    QuantidadeDiasProtesto: Integer;
    QuantidadeDiasNegativacao: Integer;
    OrgaoNegativador: Integer;
    IndicadorAceiteTituloVencido: string;
    NumeroDiasLimiteRecebimento: Integer;
    CodigoAceite: string;
    CodigoTipoTitulo: Integer;
    DescricaoTipoTitulo: string;
    IndicadorPermissaoRecebimentoParcial: string;
    NumeroTituloBeneficiario: string;
    CampoUtilizacaoBeneficiario: string;
    NumeroTituloCliente: string;
    MensagemBloquetoOcorrencia: string;
    IndicadorPix: string;
    IdLocationPix: Integer;
    IdLocationRecorrencia: Integer;
    Desconto: TBBDesconto;
    SegundoDesconto: TBBDesconto;
    TerceiroDesconto: TBBDesconto;
    JurosMora: TBBJurosMora;
    Multa: TBBMulta;
    Pagador: TBBPagador;
    BeneficiarioFinal: TBBBeneficiarioFinal;
    constructor Create;
    destructor Destroy; override;
    procedure FromJSON(AJson: TJSONObject); override;
    function ToJSON: TJSONObject; override;
  end;

  TBBRespostaRegistroBoleto = class(TBBJsonModel)
  public
    Numero: string;
    NumeroCarteira: Integer;
    NumeroVariacaoCarteira: Integer;
    CodigoCliente: Int64;
    LinhaDigitavel: string;
    CodigoBarraNumerico: string;
    NumeroContratoCobranca: Int64;
    UrlImagemBoleto: string;
    Observacao: string;
    BeneficiarioJson: string;
    QrCodeJson: string;
    procedure FromJSON(AJson: TJSONObject); override;
  end;

  TBBListaBoletos = class(TBBJsonModel)
  public
    IndicadorContinuidade: string;
    QuantidadeRegistros: Integer;
    ProximoIndice: Integer;
    BoletosJson: string;
    ItensJson: string;
    procedure FromJSON(AJson: TJSONObject); override;
  end;

  TBBBaixaBoleto = class(TBBJsonModel)
  public
    NumeroConvenio: Int64;
    function ToJSON: TJSONObject; override;
  end;

  TBBRespostaBaixaBoleto = class(TBBJsonModel)
  public
    NumeroContratoCobranca: string;
    DataBaixa: string;
    HorarioBaixa: string;
    procedure FromJSON(AJson: TJSONObject); override;
  end;

  TBBAlteracaoBoleto = class(TBBJsonModel)
  public
    NumeroConvenio: Integer;
    DadosAlteracao: TJSONObject;
    constructor Create;
    destructor Destroy; override;
    function ToJSON: TJSONObject; override;
  end;

  TBBRespostaAlteracaoBoleto = class(TBBJsonModel)
  public
    NumeroContratoCobranca: Integer;
    DataAtualizacao: string;
    HorarioAtualizacao: string;
    procedure FromJSON(AJson: TJSONObject); override;
  end;

  TBBRespostaPixBoleto = class(TBBJsonModel)
  public
    Id: string;
    DataRegistroTituloCobranca: string;
    AgenciaBeneficiario: Integer;
    ContaBeneficiario: Integer;
    ValorOriginalTituloCobranca: Double;
    ValidadeTituloCobranca: string;
    PixJson: string;
    QrCodeJson: string;
    procedure FromJSON(AJson: TJSONObject); override;
  end;

  TBBErroCobranca = class(TBBJsonModel)
  public
    ErrosJson: string;
    PrimeiraMensagem: string;
    PrimeiraProvidencia: string;
    procedure FromJSON(AJson: TJSONObject); override;
  end;

function BBDataApi(ADate: TDateTime): string;
function BBCloneObject(AJson: TJSONObject): TJSONObject;

implementation

function BBDataApi(ADate: TDateTime): string;
begin
  Result := FormatDateTime('dd.mm.yyyy', ADate);
end;

function BBCloneObject(AJson: TJSONObject): TJSONObject;
var
  V: TJSONValue;
begin
  Result := nil;
  if not Assigned(AJson) then
    Exit;
  V := TJSONObject.ParseJSONValue(AJson.ToJSON);
  if V is TJSONObject then
    Result := TJSONObject(V)
  else
    V.Free;
end;

function JsonValue(AJson: TJSONObject; const AName: string): TJSONValue;
begin
  Result := nil;
  if Assigned(AJson) then
    Result := AJson.GetValue(AName);
end;

procedure TBBJsonModel.AddString(AJson: TJSONObject; const AName, AValue: string);
begin
  if Trim(AValue) <> '' then
    AJson.AddPair(AName, AValue);
end;

procedure TBBJsonModel.AddInteger(AJson: TJSONObject; const AName: string; AValue: Integer);
begin
  if AValue <> 0 then
    AJson.AddPair(AName, TJSONNumber.Create(AValue));
end;

procedure TBBJsonModel.AddInt64(AJson: TJSONObject; const AName: string; AValue: Int64);
begin
  if AValue <> 0 then
    AJson.AddPair(AName, TJSONNumber.Create(AValue));
end;

procedure TBBJsonModel.AddFloat(AJson: TJSONObject; const AName: string; AValue: Double);
begin
  if AValue <> 0 then
    AJson.AddPair(AName, TJSONNumber.Create(AValue));
end;

procedure TBBJsonModel.AddObject(AJson: TJSONObject; const AName: string; AValue: TJSONObject);
begin
  if Assigned(AValue) and (AValue.ToJSON <> '{}') then
    AJson.AddPair(AName, AValue)
  else
    AValue.Free;
end;

function TBBJsonModel.GetString(AJson: TJSONObject; const AName: string): string;
var
  V: TJSONValue;
begin
  Result := '';
  V := JsonValue(AJson, AName);
  if Assigned(V) then
    Result := V.Value;
end;

function TBBJsonModel.GetInteger(AJson: TJSONObject; const AName: string): Integer;
begin
  Result := StrToIntDef(GetString(AJson, AName), 0);
end;

function TBBJsonModel.GetInt64(AJson: TJSONObject; const AName: string): Int64;
begin
  Result := StrToInt64Def(GetString(AJson, AName), 0);
end;

function TBBJsonModel.GetFloat(AJson: TJSONObject; const AName: string): Double;
var
  S: string;
  FS: TFormatSettings;
begin
  Result := 0;
  S := Trim(GetString(AJson, AName));
  if S = '' then
    Exit;
  FS := FormatSettings;
  FS.DecimalSeparator := '.';
  if not TryStrToFloat(S, Result, FS) then
    Result := StrToFloatDef(StringReplace(S, '.', FormatSettings.DecimalSeparator, [rfReplaceAll]), 0);
end;

function TBBJsonModel.GetObject(AJson: TJSONObject; const AName: string): TJSONObject;
var
  V: TJSONValue;
begin
  Result := nil;
  V := JsonValue(AJson, AName);
  if V is TJSONObject then
    Result := TJSONObject(V);
end;

function TBBJsonModel.GetArray(AJson: TJSONObject; const AName: string): TJSONArray;
var
  V: TJSONValue;
begin
  Result := nil;
  V := JsonValue(AJson, AName);
  if V is TJSONArray then
    Result := TJSONArray(V);
end;

procedure TBBJsonModel.FromJSON(AJson: TJSONObject);
begin
end;

function TBBJsonModel.ToJSON: TJSONObject;
begin
  Result := TJSONObject.Create;
end;

procedure TBBPagador.FromJSON(AJson: TJSONObject);
begin
  TipoInscricao := GetInteger(AJson, 'tipoInscricao');
  NumeroInscricao := GetInt64(AJson, 'numeroInscricao');
  Nome := GetString(AJson, 'nome');
  Endereco := GetString(AJson, 'endereco');
  Cep := GetInteger(AJson, 'cep');
  Cidade := GetString(AJson, 'cidade');
  Bairro := GetString(AJson, 'bairro');
  Uf := GetString(AJson, 'uf');
  Telefone := GetString(AJson, 'telefone');
  Email := GetString(AJson, 'email');
end;

function TBBPagador.ToJSON: TJSONObject;
begin
  Result := inherited ToJSON;
  AddInteger(Result, 'tipoInscricao', TipoInscricao);
  AddInt64(Result, 'numeroInscricao', NumeroInscricao);
  AddString(Result, 'nome', Nome);
  AddString(Result, 'endereco', Endereco);
  AddInteger(Result, 'cep', Cep);
  AddString(Result, 'cidade', Cidade);
  AddString(Result, 'bairro', Bairro);
  AddString(Result, 'uf', Uf);
  AddString(Result, 'telefone', Telefone);
  AddString(Result, 'email', Email);
end;

procedure TBBBeneficiarioFinal.FromJSON(AJson: TJSONObject);
begin
  TipoInscricao := GetInteger(AJson, 'tipoInscricao');
  NumeroInscricao := GetInt64(AJson, 'numeroInscricao');
  Nome := GetString(AJson, 'nome');
end;

function TBBBeneficiarioFinal.ToJSON: TJSONObject;
begin
  Result := inherited ToJSON;
  AddInteger(Result, 'tipoInscricao', TipoInscricao);
  AddInt64(Result, 'numeroInscricao', NumeroInscricao);
  AddString(Result, 'nome', Nome);
end;

procedure TBBDesconto.FromJSON(AJson: TJSONObject);
begin
  Tipo := GetInteger(AJson, 'tipo');
  DataExpiracao := GetString(AJson, 'dataExpiracao');
  Porcentagem := GetFloat(AJson, 'porcentagem');
  Valor := GetFloat(AJson, 'valor');
end;

function TBBDesconto.ToJSON: TJSONObject;
begin
  Result := inherited ToJSON;
  AddInteger(Result, 'tipo', Tipo);
  AddString(Result, 'dataExpiracao', DataExpiracao);
  AddFloat(Result, 'porcentagem', Porcentagem);
  AddFloat(Result, 'valor', Valor);
end;

procedure TBBJurosMora.FromJSON(AJson: TJSONObject);
begin
  Tipo := GetInteger(AJson, 'tipo');
  Porcentagem := GetFloat(AJson, 'porcentagem');
  Valor := GetFloat(AJson, 'valor');
end;

function TBBJurosMora.ToJSON: TJSONObject;
begin
  Result := inherited ToJSON;
  AddInteger(Result, 'tipo', Tipo);
  AddFloat(Result, 'porcentagem', Porcentagem);
  AddFloat(Result, 'valor', Valor);
end;

procedure TBBMulta.FromJSON(AJson: TJSONObject);
begin
  Tipo := GetInteger(AJson, 'tipo');
  Data := GetString(AJson, 'data');
  Porcentagem := GetFloat(AJson, 'porcentagem');
  Valor := GetFloat(AJson, 'valor');
end;

function TBBMulta.ToJSON: TJSONObject;
begin
  Result := inherited ToJSON;
  AddInteger(Result, 'tipo', Tipo);
  AddString(Result, 'data', Data);
  AddFloat(Result, 'porcentagem', Porcentagem);
  AddFloat(Result, 'valor', Valor);
end;

constructor TBBRegistroBoleto.Create;
begin
  inherited Create;
  Desconto := TBBDesconto.Create;
  SegundoDesconto := TBBDesconto.Create;
  TerceiroDesconto := TBBDesconto.Create;
  JurosMora := TBBJurosMora.Create;
  Multa := TBBMulta.Create;
  Pagador := TBBPagador.Create;
  BeneficiarioFinal := TBBBeneficiarioFinal.Create;
end;

destructor TBBRegistroBoleto.Destroy;
begin
  BeneficiarioFinal.Free;
  Pagador.Free;
  Multa.Free;
  JurosMora.Free;
  TerceiroDesconto.Free;
  SegundoDesconto.Free;
  Desconto.Free;
  inherited;
end;

procedure TBBRegistroBoleto.FromJSON(AJson: TJSONObject);
begin
  NumeroConvenio := GetInt64(AJson, 'numeroConvenio');
  NumeroCarteira := GetInteger(AJson, 'numeroCarteira');
  NumeroVariacaoCarteira := GetInteger(AJson, 'numeroVariacaoCarteira');
  CodigoModalidade := GetInteger(AJson, 'codigoModalidade');
  DataEmissao := GetString(AJson, 'dataEmissao');
  DataVencimento := GetString(AJson, 'dataVencimento');
  ValorOriginal := GetFloat(AJson, 'valorOriginal');
  ValorAbatimento := GetFloat(AJson, 'valorAbatimento');
  QuantidadeDiasProtesto := GetInteger(AJson, 'quantidadeDiasProtesto');
  QuantidadeDiasNegativacao := GetInteger(AJson, 'quantidadeDiasNegativacao');
  OrgaoNegativador := GetInteger(AJson, 'orgaoNegativador');
  IndicadorAceiteTituloVencido := GetString(AJson, 'indicadorAceiteTituloVencido');
  NumeroDiasLimiteRecebimento := GetInteger(AJson, 'numeroDiasLimiteRecebimento');
  CodigoAceite := GetString(AJson, 'codigoAceite');
  CodigoTipoTitulo := GetInteger(AJson, 'codigoTipoTitulo');
  DescricaoTipoTitulo := GetString(AJson, 'descricaoTipoTitulo');
  IndicadorPermissaoRecebimentoParcial := GetString(AJson, 'indicadorPermissaoRecebimentoParcial');
  NumeroTituloBeneficiario := GetString(AJson, 'numeroTituloBeneficiario');
  CampoUtilizacaoBeneficiario := GetString(AJson, 'campoUtilizacaoBeneficiario');
  NumeroTituloCliente := GetString(AJson, 'numeroTituloCliente');
  MensagemBloquetoOcorrencia := GetString(AJson, 'mensagemBloquetoOcorrencia');
  IndicadorPix := GetString(AJson, 'indicadorPix');
  IdLocationPix := GetInteger(AJson, 'idLocationPix');
  IdLocationRecorrencia := GetInteger(AJson, 'idLocationRecorrencia');
  if Assigned(GetObject(AJson, 'desconto')) then Desconto.FromJSON(GetObject(AJson, 'desconto'));
  if Assigned(GetObject(AJson, 'segundoDesconto')) then SegundoDesconto.FromJSON(GetObject(AJson, 'segundoDesconto'));
  if Assigned(GetObject(AJson, 'terceiroDesconto')) then TerceiroDesconto.FromJSON(GetObject(AJson, 'terceiroDesconto'));
  if Assigned(GetObject(AJson, 'jurosMora')) then JurosMora.FromJSON(GetObject(AJson, 'jurosMora'));
  if Assigned(GetObject(AJson, 'multa')) then Multa.FromJSON(GetObject(AJson, 'multa'));
  if Assigned(GetObject(AJson, 'pagador')) then Pagador.FromJSON(GetObject(AJson, 'pagador'));
  if Assigned(GetObject(AJson, 'beneficiarioFinal')) then BeneficiarioFinal.FromJSON(GetObject(AJson, 'beneficiarioFinal'));
end;

function TBBRegistroBoleto.ToJSON: TJSONObject;
begin
  Result := inherited ToJSON;
  AddInt64(Result, 'numeroConvenio', NumeroConvenio);
  AddInteger(Result, 'numeroCarteira', NumeroCarteira);
  AddInteger(Result, 'numeroVariacaoCarteira', NumeroVariacaoCarteira);
  AddInteger(Result, 'codigoModalidade', CodigoModalidade);
  AddString(Result, 'dataEmissao', DataEmissao);
  AddString(Result, 'dataVencimento', DataVencimento);
  AddFloat(Result, 'valorOriginal', ValorOriginal);
  AddFloat(Result, 'valorAbatimento', ValorAbatimento);
  AddInteger(Result, 'quantidadeDiasProtesto', QuantidadeDiasProtesto);
  AddInteger(Result, 'quantidadeDiasNegativacao', QuantidadeDiasNegativacao);
  AddInteger(Result, 'orgaoNegativador', OrgaoNegativador);
  AddString(Result, 'indicadorAceiteTituloVencido', IndicadorAceiteTituloVencido);
  AddInteger(Result, 'numeroDiasLimiteRecebimento', NumeroDiasLimiteRecebimento);
  AddString(Result, 'codigoAceite', CodigoAceite);
  AddInteger(Result, 'codigoTipoTitulo', CodigoTipoTitulo);
  AddString(Result, 'descricaoTipoTitulo', DescricaoTipoTitulo);
  AddString(Result, 'indicadorPermissaoRecebimentoParcial', IndicadorPermissaoRecebimentoParcial);
  AddString(Result, 'numeroTituloBeneficiario', NumeroTituloBeneficiario);
  AddString(Result, 'campoUtilizacaoBeneficiario', CampoUtilizacaoBeneficiario);
  AddString(Result, 'numeroTituloCliente', NumeroTituloCliente);
  AddString(Result, 'mensagemBloquetoOcorrencia', MensagemBloquetoOcorrencia);
  AddObject(Result, 'desconto', Desconto.ToJSON);
  AddObject(Result, 'segundoDesconto', SegundoDesconto.ToJSON);
  AddObject(Result, 'terceiroDesconto', TerceiroDesconto.ToJSON);
  AddObject(Result, 'jurosMora', JurosMora.ToJSON);
  AddObject(Result, 'multa', Multa.ToJSON);
  AddObject(Result, 'pagador', Pagador.ToJSON);
  AddObject(Result, 'beneficiarioFinal', BeneficiarioFinal.ToJSON);
  AddString(Result, 'indicadorPix', IndicadorPix);
  AddInteger(Result, 'idLocationPix', IdLocationPix);
  AddInteger(Result, 'idLocationRecorrencia', IdLocationRecorrencia);
end;

procedure TBBRespostaRegistroBoleto.FromJSON(AJson: TJSONObject);
begin
  Numero := GetString(AJson, 'numero');
  NumeroCarteira := GetInteger(AJson, 'numeroCarteira');
  NumeroVariacaoCarteira := GetInteger(AJson, 'numeroVariacaoCarteira');
  CodigoCliente := GetInt64(AJson, 'codigoCliente');
  LinhaDigitavel := GetString(AJson, 'linhaDigitavel');
  CodigoBarraNumerico := GetString(AJson, 'codigoBarraNumerico');
  NumeroContratoCobranca := GetInt64(AJson, 'numeroContratoCobranca');
  UrlImagemBoleto := GetString(AJson, 'urlImagemBoleto');
  Observacao := GetString(AJson, 'observacao');
  if Assigned(GetObject(AJson, 'beneficiario')) then BeneficiarioJson := GetObject(AJson, 'beneficiario').ToJSON;
  if Assigned(GetObject(AJson, 'qrCode')) then QrCodeJson := GetObject(AJson, 'qrCode').ToJSON;
end;

procedure TBBListaBoletos.FromJSON(AJson: TJSONObject);
var
  Arr: TJSONArray;
  Obj: TJSONObject;
begin
  Obj := AJson;
  Arr := GetArray(AJson, 'items');
  if Assigned(Arr) then
  begin
    ItensJson := Arr.ToJSON;
    if (Arr.Count > 0) and (Arr.Items[0] is TJSONObject) then
      Obj := TJSONObject(Arr.Items[0]);
  end;
  IndicadorContinuidade := GetString(Obj, 'indicadorContinuidade');
  QuantidadeRegistros := GetInteger(Obj, 'quantidadeRegistros');
  ProximoIndice := GetInteger(Obj, 'proximoIndice');
  Arr := GetArray(Obj, 'boletos');
  if Assigned(Arr) then
    BoletosJson := Arr.ToJSON;
end;

function TBBBaixaBoleto.ToJSON: TJSONObject;
begin
  Result := inherited ToJSON;
  AddInt64(Result, 'numeroConvenio', NumeroConvenio);
end;

procedure TBBRespostaBaixaBoleto.FromJSON(AJson: TJSONObject);
begin
  NumeroContratoCobranca := GetString(AJson, 'numeroContratoCobranca');
  DataBaixa := GetString(AJson, 'dataBaixa');
  HorarioBaixa := GetString(AJson, 'horarioBaixa');
end;

constructor TBBAlteracaoBoleto.Create;
begin
  inherited Create;
  DadosAlteracao := TJSONObject.Create;
end;

destructor TBBAlteracaoBoleto.Destroy;
begin
  DadosAlteracao.Free;
  inherited;
end;

function TBBAlteracaoBoleto.ToJSON: TJSONObject;
begin
  Result := BBCloneObject(DadosAlteracao);
  if not Assigned(Result) then
    Result := TJSONObject.Create;
  AddInteger(Result, 'numeroConvenio', NumeroConvenio);
end;

procedure TBBRespostaAlteracaoBoleto.FromJSON(AJson: TJSONObject);
begin
  NumeroContratoCobranca := GetInteger(AJson, 'numeroContratoCobranca');
  DataAtualizacao := GetString(AJson, 'dataAtualizacao');
  HorarioAtualizacao := GetString(AJson, 'horarioAtualizacao');
end;

procedure TBBRespostaPixBoleto.FromJSON(AJson: TJSONObject);
begin
  Id := GetString(AJson, 'id');
  DataRegistroTituloCobranca := GetString(AJson, 'dataRegistroTituloCobranca');
  AgenciaBeneficiario := GetInteger(AJson, 'agenciaBeneficiario');
  ContaBeneficiario := GetInteger(AJson, 'contaBeneficiario');
  ValorOriginalTituloCobranca := GetFloat(AJson, 'valorOriginalTituloCobranca');
  ValidadeTituloCobranca := GetString(AJson, 'validadeTituloCobranca');
  if Assigned(GetObject(AJson, 'pix')) then PixJson := GetObject(AJson, 'pix').ToJSON;
  if Assigned(GetObject(AJson, 'qrCode')) then QrCodeJson := GetObject(AJson, 'qrCode').ToJSON;
end;

procedure TBBErroCobranca.FromJSON(AJson: TJSONObject);
var
  Arr: TJSONArray;
  Obj: TJSONObject;
begin
  Arr := GetArray(AJson, 'erros');
  if not Assigned(Arr) then
    Arr := GetArray(AJson, 'errors');
  if Assigned(Arr) then
  begin
    ErrosJson := Arr.ToJSON;
    if (Arr.Count > 0) and (Arr.Items[0] is TJSONObject) then
    begin
      Obj := TJSONObject(Arr.Items[0]);
      PrimeiraMensagem := GetString(Obj, 'mensagem');
      if PrimeiraMensagem = '' then PrimeiraMensagem := GetString(Obj, 'textoMensagem');
      if PrimeiraMensagem = '' then PrimeiraMensagem := GetString(Obj, 'message');
      PrimeiraProvidencia := GetString(Obj, 'providencia');
      if PrimeiraProvidencia = '' then PrimeiraProvidencia := GetString(Obj, 'textoProvidencia');
      if PrimeiraProvidencia = '' then PrimeiraProvidencia := GetString(Obj, 'action');
    end;
  end;
end;

end.

