unit Un_CEF_Cobrancas;

interface

uses
  System.Classes,
  System.Contnrs,
  System.StrUtils,
  System.SysUtils,
  Winapi.Windows;

type
  TCEFOperacaoCobranca = (cefIncluiBoleto, cefAlteraBoleto, cefBaixaBoleto, cefConsultaBoleto);

  TCEFXmlModel = class
  protected
    procedure AddTag(AStrings: TStrings; const AName, AValue: string); overload;
    procedure AddTag(AStrings: TStrings; const APrefix, AName, AValue: string); overload;
    procedure AddFloatTag(AStrings: TStrings; const AName: string; AValue: Double);
    procedure AddIntegerTag(AStrings: TStrings; const AName: string; AValue: Integer);
    function XmlFloat(AValue: Double): string;
    function XmlEscape(const AValue: string): string;
  end;

  TCEFHeader = class(TCEFXmlModel)
  public
    Versao: string;
    Autenticacao: string;
    UsuarioServico: string;
    Usuario: string;
    Operacao: string;
    Indice: Integer;
    SistemaOrigem: string;
    Unidade: string;
    IdentificadorOrigem: string;
    DataHora: string;
    IdProcesso: string;
    constructor Create;
    function ToXML(const APrefix: string): string;
  end;

  TCEFEndereco = class(TCEFXmlModel)
  public
    Logradouro: string;
    Bairro: string;
    Cidade: string;
    UF: string;
    CEP: string;
    function ToXML(const ATagName: string): string;
  end;

  TCEFPessoa = class(TCEFXmlModel)
  public
    CPF: string;
    CNPJ: string;
    Nome: string;
    RazaoSocial: string;
    Endereco: TCEFEndereco;
    constructor Create;
    destructor Destroy; override;
    function ToXML(const ATagName: string; AIncluirEndereco: Boolean): string;
  end;

  TCEFJurosMora = class(TCEFXmlModel)
  public
    Tipo: string;
    Data: string;
    Valor: Double;
    Percentual: Double;
    function ToXML: string;
  end;

  TCEFPosVencimento = class(TCEFXmlModel)
  public
    Acao: string;
    NumeroDias: Integer;
    function ToXML: string;
  end;

  TCEFMulta = class(TCEFXmlModel)
  public
    Data: string;
    Valor: Double;
    Percentual: Double;
    function ToXML: string;
  end;

  TCEFDesconto = class(TCEFXmlModel)
  public
    Data: string;
    Valor: Double;
    Percentual: Double;
    Tipo: string;
    function ToXML: string;
  end;

  TCEFMensagens = class(TCEFXmlModel)
  public
    Mensagens: TStringList;
    constructor Create;
    destructor Destroy; override;
    function ToXML(const ATagName: string): string;
  end;

  TCEFPagamento = class(TCEFXmlModel)
  public
    QuantidadePermitida: Integer;
    Tipo: string;
    ValorMinimo: Double;
    ValorMaximo: Double;
    FlagPagamentoParcial: string;
    PercentualMinimo: Double;
    PercentualMaximo: Double;
    function ToXML: string;
  end;

  TCEFTituloBoleto = class(TCEFXmlModel)
  private
    FDescontos: TObjectList;
  public
    NossoNumero: string;
    Tipo: string;
    NumeroDocumento: string;
    DataVencimento: string;
    Valor: Double;
    TipoEspecie: string;
    FlagAceite: string;
    DataEmissao: string;
    JurosMora: TCEFJurosMora;
    ValorAbatimento: Double;
    PosVencimento: TCEFPosVencimento;
    CodigoMoeda: string;
    Pagador: TCEFPessoa;
    SacadorAvalista: TCEFPessoa;
    Multa: TCEFMulta;
    ValorIOF: Double;
    IdentificacaoEmpresa: string;
    FichaCompensacao: TCEFMensagens;
    ReciboPagador: TCEFMensagens;
    Pagamento: TCEFPagamento;
    Carteira: string;
    constructor Create;
    destructor Destroy; override;
    function AddDesconto: TCEFDesconto;
    function ToXML(AIncluirRetornoConsulta: Boolean = False): string;
  end;

  TCEFOperacaoBoleto = class(TCEFXmlModel)
  public
    CodigoBeneficiario: string;
    NossoNumero: string;
    Titulo: TCEFTituloBoleto;
    constructor Create;
    destructor Destroy; override;
    function ToXML(AOperacao: TCEFOperacaoCobranca): string;
  end;

  TCEFServicoEntrada = class(TCEFXmlModel)
  public
    Header: TCEFHeader;
    Operacao: TCEFOperacaoCobranca;
    Boleto: TCEFOperacaoBoleto;
    constructor Create;
    destructor Destroy; override;
    function ToSOAPXML: string;
  end;

  TCEFRespostaServico = class
  public
    Xml: string;
    CodRetorno: string;
    OrigemRetorno: string;
    MsgRetorno: string;
    ControleOrigemRetorno: string;
    ControleCodRetorno: string;
    ControleMensagem: string;
    Excecao: string;
    CodigoBarras: string;
    LinhaDigitavel: string;
    NossoNumero: string;
    Url: string;
    QrCode: string;
    UrlQrCode: string;
    procedure FromXML(const AXML: string);
    function Sucesso: Boolean;
  end;

function CEFOperacaoToString(AOperacao: TCEFOperacaoCobranca): string;
function CEFDataApi(ADate: TDateTime): string;
function CEFDataHoraApi(ADateTime: TDateTime): string;
function CEFOnlyNumbers(const AValue: string): string;
function CEFNormalizarCEP(const AValue: string): string;
function CEFCalcularAutenticacao(const ACodigoBeneficiario, ANossoNumero: string;
  ADataVencimento: TDateTime; AValor: Double; const ACpfCnpjBeneficiario: string): string;
function CEFCalcularAutenticacaoConsultaBaixa(const ACodigoBeneficiario, ANossoNumero,
  ACpfCnpjBeneficiario: string): string;

implementation

const
  PROV_RSA_AES = 24;
  CRYPT_VERIFYCONTEXT = $F0000000;
  CALG_SHA_256 = $0000800C;
  HP_HASHVAL = $0002;

type
  ALG_ID = Cardinal;
  HCRYPTPROV = Cardinal;
  HCRYPTHASH = Cardinal;

function CryptAcquireContext(var phProv: HCRYPTPROV; pszContainer, pszProvider: PChar;
  dwProvType, dwFlags: DWORD): BOOL; stdcall; external 'advapi32.dll' name 'CryptAcquireContextW';
function CryptReleaseContext(hProv: HCRYPTPROV; dwFlags: DWORD): BOOL; stdcall; external 'advapi32.dll';
function CryptCreateHash(hProv: HCRYPTPROV; Algid: ALG_ID; hKey: Cardinal;
  dwFlags: DWORD; var phHash: HCRYPTHASH): BOOL; stdcall; external 'advapi32.dll';
function CryptDestroyHash(hHash: HCRYPTHASH): BOOL; stdcall; external 'advapi32.dll';
function CryptHashData(hHash: HCRYPTHASH; pbData: PByte; dwDataLen, dwFlags: DWORD): BOOL; stdcall; external 'advapi32.dll';
function CryptGetHashParam(hHash: HCRYPTHASH; dwParam: DWORD; pbData: PByte;
  var pdwDataLen: DWORD; dwFlags: DWORD): BOOL; stdcall; external 'advapi32.dll';

function CEFOperacaoToString(AOperacao: TCEFOperacaoCobranca): string;
begin
  case AOperacao of
    cefIncluiBoleto: Result := 'INCLUI_BOLETO';
    cefAlteraBoleto: Result := 'ALTERA_BOLETO';
    cefBaixaBoleto: Result := 'BAIXA_BOLETO';
  else
    Result := 'CONSULTA_BOLETO';
  end;
end;

function CEFDataApi(ADate: TDateTime): string;
begin
  if ADate = 0 then
    Result := ''
  else
    Result := FormatDateTime('yyyy-mm-dd', ADate);
end;

function CEFDataHoraApi(ADateTime: TDateTime): string;
begin
  if ADateTime = 0 then
    Result := ''
  else
    Result := FormatDateTime('yyyymmddhhnnss', ADateTime);
end;

function CEFOnlyNumbers(const AValue: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(AValue) do
    if CharInSet(AValue[I], ['0'..'9']) then
      Result := Result + AValue[I];
end;

function CEFNormalizarCEP(const AValue: string): string;
begin
  Result := CEFOnlyNumbers(AValue);
  if Result = '' then
    Exit;
  if Length(Result) < 8 then
    Result := StringOfChar('0', 8 - Length(Result)) + Result;
end;
function LeftPadDigits(const AValue: string; ALen: Integer): string;
var
  S: string;
begin
  S := StringOfChar('0', ALen) + CEFOnlyNumbers(AValue);
  Result := Copy(S, Length(S) - ALen + 1, ALen);
end;

function Base64EncodeBytes(const ABytes: TBytes): string;
const
  Table: AnsiString = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
var
  I, B1, B2, B3: Integer;
begin
  Result := '';
  I := 0;
  while I < Length(ABytes) do
  begin
    B1 := ABytes[I];
    if I + 1 < Length(ABytes) then B2 := ABytes[I + 1] else B2 := 0;
    if I + 2 < Length(ABytes) then B3 := ABytes[I + 2] else B3 := 0;

    Result := Result + Char(Table[(B1 shr 2) + 1]);
    Result := Result + Char(Table[(((B1 and 3) shl 4) or (B2 shr 4)) + 1]);
    if I + 1 < Length(ABytes) then
      Result := Result + Char(Table[(((B2 and 15) shl 2) or (B3 shr 6)) + 1])
    else
      Result := Result + '=';
    if I + 2 < Length(ABytes) then
      Result := Result + Char(Table[(B3 and 63) + 1])
    else
      Result := Result + '=';
    Inc(I, 3);
  end;
end;

function SHA256BytesAnsi(const AValue: AnsiString): TBytes;
var
  Provider: HCRYPTPROV;
  Hash: HCRYPTHASH;
  Size: DWORD;
begin
  Provider := 0;
  Hash := 0;
  SetLength(Result, 0);
  if not CryptAcquireContext(Provider, nil, nil, PROV_RSA_AES, CRYPT_VERIFYCONTEXT) then
    RaiseLastOSError;
  try
    if not CryptCreateHash(Provider, CALG_SHA_256, 0, 0, Hash) then
      RaiseLastOSError;
    try
      if (Length(AValue) > 0) and (not CryptHashData(Hash, @AValue[1], Length(AValue), 0)) then
        RaiseLastOSError;
      Size := 32;
      SetLength(Result, Size);
      if not CryptGetHashParam(Hash, HP_HASHVAL, @Result[0], Size, 0) then
        RaiseLastOSError;
      SetLength(Result, Size);
    finally
      CryptDestroyHash(Hash);
    end;
  finally
    CryptReleaseContext(Provider, 0);
  end;
end;

function CEFCalcularAutenticacao(const ACodigoBeneficiario, ANossoNumero: string;
  ADataVencimento: TDateTime; AValor: Double; const ACpfCnpjBeneficiario: string): string;
var
  S, Valor: string;
begin
  Valor := FormatFloat('0.00', AValor);
  Valor := StringReplace(Valor, FormatSettings.DecimalSeparator, '', [rfReplaceAll]);
  S := LeftPadDigits(ACodigoBeneficiario, 7) +
       LeftPadDigits(ANossoNumero, 17) +
       FormatDateTime('ddmmyyyy', ADataVencimento) +
       LeftPadDigits(Valor, 15) +
       LeftPadDigits(ACpfCnpjBeneficiario, 14);
  Result := Base64EncodeBytes(SHA256BytesAnsi(AnsiString(S)));
end;

function CEFCalcularAutenticacaoConsultaBaixa(const ACodigoBeneficiario, ANossoNumero,
  ACpfCnpjBeneficiario: string): string;
var
  S: string;
begin
  S := LeftPadDigits(ACodigoBeneficiario, 7) +
       LeftPadDigits(ANossoNumero, 17) +
       StringOfChar('0', 8) +
       StringOfChar('0', 15) +
       LeftPadDigits(ACpfCnpjBeneficiario, 14);
  Result := Base64EncodeBytes(SHA256BytesAnsi(AnsiString(S)));
end;

procedure TCEFXmlModel.AddTag(AStrings: TStrings; const AName, AValue: string);
begin
  if Trim(AValue) <> '' then
    AStrings.Add('<' + AName + '>' + XmlEscape(AValue) + '</' + AName + '>');
end;

procedure TCEFXmlModel.AddTag(AStrings: TStrings; const APrefix, AName, AValue: string);
begin
  if Trim(APrefix) = '' then
    AddTag(AStrings, AName, AValue)
  else if Trim(AValue) <> '' then
    AStrings.Add('<' + APrefix + ':' + AName + '>' + XmlEscape(AValue) + '</' + APrefix + ':' + AName + '>');
end;

procedure TCEFXmlModel.AddFloatTag(AStrings: TStrings; const AName: string; AValue: Double);
begin
  if AValue <> 0 then
    AStrings.Add('<' + AName + '>' + XmlFloat(AValue) + '</' + AName + '>');
end;

procedure TCEFXmlModel.AddIntegerTag(AStrings: TStrings; const AName: string; AValue: Integer);
begin
  if AValue <> 0 then
    AStrings.Add('<' + AName + '>' + IntToStr(AValue) + '</' + AName + '>');
end;

function TCEFXmlModel.XmlFloat(AValue: Double): string;
begin
  Result := FormatFloat('0.00', AValue);
  Result := StringReplace(Result, FormatSettings.DecimalSeparator, '.', [rfReplaceAll]);
end;

function TCEFXmlModel.XmlEscape(const AValue: string): string;
begin
  Result := AValue;
  Result := StringReplace(Result, '&', '&amp;', [rfReplaceAll]);
  Result := StringReplace(Result, '<', '&lt;', [rfReplaceAll]);
  Result := StringReplace(Result, '>', '&gt;', [rfReplaceAll]);
  Result := StringReplace(Result, '"', '&quot;', [rfReplaceAll]);
  Result := StringReplace(Result, '''', '&apos;', [rfReplaceAll]);
end;

constructor TCEFHeader.Create;
begin
  inherited Create;
  Versao := '3.0';
  UsuarioServico := 'SGCBS02P';
  SistemaOrigem := 'SIGCB';
  DataHora := CEFDataHoraApi(Now);
end;

function TCEFHeader.ToXML(const APrefix: string): string;
var
  L: TStringList;
  TagName: string;
begin
  L := TStringList.Create;
  try
    if Trim(APrefix) = '' then TagName := 'HEADER' else TagName := APrefix + ':HEADER';
    L.Add('<' + TagName + '>');
    AddTag(L, 'VERSAO', Versao);
    AddTag(L, 'AUTENTICACAO', Autenticacao);
    AddTag(L, 'USUARIO_SERVICO', UsuarioServico);
    AddTag(L, 'USUARIO', Usuario);
    AddTag(L, 'OPERACAO', Operacao);
    AddIntegerTag(L, 'INDICE', Indice);
    AddTag(L, 'SISTEMA_ORIGEM', SistemaOrigem);
    AddTag(L, 'UNIDADE', Unidade);
    AddTag(L, 'IDENTIFICADOR_ORIGEM', IdentificadorOrigem);
    AddTag(L, 'DATA_HORA', DataHora);
    AddTag(L, 'ID_PROCESSO', IdProcesso);
    L.Add('</' + TagName + '>');
    Result := L.Text;
  finally
    L.Free;
  end;
end;

function TCEFEndereco.ToXML(const ATagName: string): string;
var
  L: TStringList;
begin
  L := TStringList.Create;
  try
    L.Add('<' + ATagName + '>');
    AddTag(L, 'LOGRADOURO', Logradouro);
    AddTag(L, 'BAIRRO', Bairro);
    AddTag(L, 'CIDADE', Cidade);
    AddTag(L, 'UF', UF);
    AddTag(L, 'CEP', CEFOnlyNumbers(CEP));
    L.Add('</' + ATagName + '>');
    Result := L.Text;
  finally
    L.Free;
  end;
end;

constructor TCEFPessoa.Create;
begin
  inherited Create;
  Endereco := TCEFEndereco.Create;
end;

destructor TCEFPessoa.Destroy;
begin
  Endereco.Free;
  inherited;
end;

function TCEFPessoa.ToXML(const ATagName: string; AIncluirEndereco: Boolean): string;
var
  L: TStringList;
begin
  L := TStringList.Create;
  try
    L.Add('<' + ATagName + '>');
    if CEFOnlyNumbers(CPF) <> '' then
    begin
      AddTag(L, 'CPF', LeftPadDigits(CPF, 11));
      AddTag(L, 'NOME', Nome);
    end
    else if CEFOnlyNumbers(CNPJ) <> '' then
    begin
      AddTag(L, 'CNPJ', LeftPadDigits(CNPJ, 14));
      AddTag(L, 'RAZAO_SOCIAL', RazaoSocial);
    end;
    if AIncluirEndereco then
      L.Add(Endereco.ToXML('ENDERECO'));
    L.Add('</' + ATagName + '>');
    Result := L.Text;
  finally
    L.Free;
  end;
end;

function TCEFJurosMora.ToXML: string;
var
  L: TStringList;
  LTipo: string;
begin
  L := TStringList.Create;
  try
    LTipo := Trim(Tipo);
    if LTipo = '' then
      LTipo := 'ISENTO';

    L.Add('<JUROS_MORA>');
    AddTag(L, 'TIPO', LTipo);
    if SameText(LTipo, 'ISENTO') then
      L.Add('<VALOR>0.00</VALOR>')
    else
    begin
      AddTag(L, 'DATA', Data);
      AddFloatTag(L, 'VALOR', Valor);
      AddFloatTag(L, 'PERCENTUAL', Percentual);
    end;
    L.Add('</JUROS_MORA>');
    Result := L.Text;
  finally
    L.Free;
  end;
end;

function TCEFPosVencimento.ToXML: string;
var
  L: TStringList;
  LAcao: string;
begin
  L := TStringList.Create;
  try
    LAcao := Trim(Acao);
    if LAcao = '' then
      LAcao := 'DEVOLVER';

    L.Add('<POS_VENCIMENTO>');
    AddTag(L, 'ACAO', LAcao);
    L.Add('<NUMERO_DIAS>' + IntToStr(NumeroDias) + '</NUMERO_DIAS>');
    L.Add('</POS_VENCIMENTO>');
    Result := L.Text;
  finally
    L.Free;
  end;
end;

function TCEFMulta.ToXML: string;
var
  L: TStringList;
begin
  L := TStringList.Create;
  try
    L.Add('<MULTA>');
    AddTag(L, 'DATA', Data);
    AddFloatTag(L, 'VALOR', Valor);
    AddFloatTag(L, 'PERCENTUAL', Percentual);
    L.Add('</MULTA>');
    Result := L.Text;
  finally
    L.Free;
  end;
end;

function TCEFDesconto.ToXML: string;
var
  L: TStringList;
begin
  L := TStringList.Create;
  try
    L.Add('<DESCONTO>');
    AddTag(L, 'DATA', Data);
    AddFloatTag(L, 'VALOR', Valor);
    AddFloatTag(L, 'PERCENTUAL', Percentual);
    AddTag(L, 'TIPO', Tipo);
    L.Add('</DESCONTO>');
    Result := L.Text;
  finally
    L.Free;
  end;
end;

constructor TCEFMensagens.Create;
begin
  inherited Create;
  Mensagens := TStringList.Create;
end;

destructor TCEFMensagens.Destroy;
begin
  Mensagens.Free;
  inherited;
end;

function TCEFMensagens.ToXML(const ATagName: string): string;
var
  I: Integer;
  L: TStringList;
begin
  Result := '';
  if Mensagens.Count = 0 then
    Exit;
  L := TStringList.Create;
  try
    L.Add('<' + ATagName + '>');
    L.Add('<MENSAGENS>');
    for I := 0 to Mensagens.Count - 1 do
      AddTag(L, 'MENSAGEM', Mensagens[I]);
    L.Add('</MENSAGENS>');
    L.Add('</' + ATagName + '>');
    Result := L.Text;
  finally
    L.Free;
  end;
end;

function TCEFPagamento.ToXML: string;
var
  L: TStringList;
begin
  L := TStringList.Create;
  try
    L.Add('<PAGAMENTO>');
    L.Add('<QUANTIDADE_PERMITIDA>' + IntToStr(QuantidadePermitida) +
      '</QUANTIDADE_PERMITIDA>');
    AddTag(L, 'TIPO', Tipo);
    L.Add('<VALOR_MINIMO>' + XmlFloat(ValorMinimo) + '</VALOR_MINIMO>');
    L.Add('<VALOR_MAXIMO>' + XmlFloat(ValorMaximo) + '</VALOR_MAXIMO>');
    L.Add('<FLAG_PAGAMENTO_PARCIAL>' + XmlEscape(FlagPagamentoParcial) +
      '</FLAG_PAGAMENTO_PARCIAL>');
    L.Add('</PAGAMENTO>');
    Result := L.Text;
  finally
    L.Free;
  end;
end;

constructor TCEFTituloBoleto.Create;
begin
  inherited Create;
  FDescontos := TObjectList.Create(True);
  JurosMora := TCEFJurosMora.Create;
  PosVencimento := TCEFPosVencimento.Create;
  Pagador := TCEFPessoa.Create;
  SacadorAvalista := TCEFPessoa.Create;
  Multa := TCEFMulta.Create;
  FichaCompensacao := TCEFMensagens.Create;
  ReciboPagador := TCEFMensagens.Create;
  Pagamento := TCEFPagamento.Create;
  Pagamento.QuantidadePermitida := 1;
  Pagamento.Tipo := 'NAO_ACEITA_VALOR_DIVERGENTE';
  Pagamento.FlagPagamentoParcial := 'N';
  CodigoMoeda := '09';
end;

destructor TCEFTituloBoleto.Destroy;
begin
  Pagamento.Free;
  ReciboPagador.Free;
  FichaCompensacao.Free;
  Multa.Free;
  SacadorAvalista.Free;
  Pagador.Free;
  PosVencimento.Free;
  JurosMora.Free;
  FDescontos.Free;
  inherited;
end;

function TCEFTituloBoleto.AddDesconto: TCEFDesconto;
begin
  Result := TCEFDesconto.Create;
  FDescontos.Add(Result);
end;

function TCEFTituloBoleto.ToXML(AIncluirRetornoConsulta: Boolean): string;
var
  I: Integer;
  L: TStringList;
begin
  L := TStringList.Create;
  try
    L.Add('<TITULO>');
    AddTag(L, 'NOSSO_NUMERO', NossoNumero);
    AddTag(L, 'TIPO', Tipo);
    AddTag(L, 'NUMERO_DOCUMENTO', NumeroDocumento);
    AddTag(L, 'DATA_VENCIMENTO', DataVencimento);
    AddFloatTag(L, 'VALOR', Valor);
    AddTag(L, 'TIPO_ESPECIE', TipoEspecie);
    AddTag(L, 'FLAG_ACEITE', FlagAceite);
    AddTag(L, 'DATA_EMISSAO', DataEmissao);
    L.Add(JurosMora.ToXML);
    AddFloatTag(L, 'VALOR_ABATIMENTO', ValorAbatimento);
    L.Add(PosVencimento.ToXML);
    AddTag(L, 'CODIGO_MOEDA', CodigoMoeda);
    if (CEFOnlyNumbers(Pagador.CPF) <> '') or (CEFOnlyNumbers(Pagador.CNPJ) <> '') then
      L.Add(Pagador.ToXML('PAGADOR', True));
    if (CEFOnlyNumbers(SacadorAvalista.CPF) <> '') or (CEFOnlyNumbers(SacadorAvalista.CNPJ) <> '') then
      L.Add(SacadorAvalista.ToXML('SACADOR_AVALISTA', False));
    if (Multa.Valor <> 0) or (Multa.Percentual <> 0) or (Trim(Multa.Data) <> '') then L.Add(Multa.ToXML);
    if FDescontos.Count > 0 then
    begin
      L.Add('<DESCONTOS>');
      for I := 0 to FDescontos.Count - 1 do
        L.Add(TCEFDesconto(FDescontos[I]).ToXML);
      L.Add('</DESCONTOS>');
    end;
    AddFloatTag(L, 'VALOR_IOF', ValorIOF);
    AddTag(L, 'IDENTIFICACAO_EMPRESA', IdentificacaoEmpresa);
    L.Add(FichaCompensacao.ToXML('FICHA_COMPENSACAO'));
    L.Add(ReciboPagador.ToXML('RECIBO_PAGADOR'));
    if Trim(Pagamento.Tipo) <> '' then L.Add(Pagamento.ToXML);
    if AIncluirRetornoConsulta then
    begin
      AddTag(L, 'CARTEIRA', Carteira);
    end;
    L.Add('</TITULO>');
    Result := L.Text;
  finally
    L.Free;
  end;
end;

constructor TCEFOperacaoBoleto.Create;
begin
  inherited Create;
  Titulo := TCEFTituloBoleto.Create;
end;

destructor TCEFOperacaoBoleto.Destroy;
begin
  Titulo.Free;
  inherited;
end;

function TCEFOperacaoBoleto.ToXML(AOperacao: TCEFOperacaoCobranca): string;
var
  L: TStringList;
  Op: string;
begin
  L := TStringList.Create;
  try
    Op := CEFOperacaoToString(AOperacao);
    L.Add('<' + Op + '>');
    AddTag(L, 'CODIGO_BENEFICIARIO', LeftPadDigits(CodigoBeneficiario, 7));
    case AOperacao of
      cefBaixaBoleto, cefConsultaBoleto:
        AddTag(L, 'NOSSO_NUMERO', LeftPadDigits(NossoNumero, 17));
    else
      L.Add(Titulo.ToXML);
    end;
    L.Add('</' + Op + '>');
    Result := L.Text;
  finally
    L.Free;
  end;
end;

constructor TCEFServicoEntrada.Create;
begin
  inherited Create;
  Header := TCEFHeader.Create;
  Boleto := TCEFOperacaoBoleto.Create;
end;

destructor TCEFServicoEntrada.Destroy;
begin
  Boleto.Free;
  Header.Free;
  inherited;
end;

function TCEFServicoEntrada.ToSOAPXML: string;
var
  L: TStringList;
  Ns: string;
begin
  Header.Operacao := CEFOperacaoToString(Operacao);
  if Operacao = cefConsultaBoleto then
    Ns := 'http://caixa.gov.br/sibar/consulta_cobranca_bancaria/boleto'
  else
    Ns := 'http://caixa.gov.br/sibar/manutencao_cobranca_bancaria/boleto/externo';

  L := TStringList.Create;
  try
    L.Add('<?xml version="1.0" encoding="UTF-8"?>');
    L.Add('<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ext="' + Ns + '" xmlns:sib="http://caixa.gov.br/sibar">');
    L.Add('<soapenv:Header/>');
    L.Add('<soapenv:Body>');
    L.Add('<ext:SERVICO_ENTRADA>');
    L.Add(Header.ToXML('sib'));
    L.Add('<DADOS>');
    L.Add(Boleto.ToXML(Operacao));
    L.Add('</DADOS>');
    L.Add('</ext:SERVICO_ENTRADA>');
    L.Add('</soapenv:Body>');
    L.Add('</soapenv:Envelope>');
    Result := L.Text;
  finally
    L.Free;
  end;
end;

function XmlUnescape(const AValue: string): string;
begin
  Result := AValue;
  Result := StringReplace(Result, '&lt;', '<', [rfReplaceAll]);
  Result := StringReplace(Result, '&gt;', '>', [rfReplaceAll]);
  Result := StringReplace(Result, '&quot;', '"', [rfReplaceAll]);
  Result := StringReplace(Result, '&apos;', '''', [rfReplaceAll]);
  Result := StringReplace(Result, '&amp;', '&', [rfReplaceAll]);
end;

function ExtractTagValue(const AXML, ATagName: string): string;
var
  P1, P2, P3: Integer;
  OpenTag, CloseTag: string;
begin
  Result := '';
  OpenTag := '<' + ATagName + '>';
  CloseTag := '</' + ATagName + '>';
  P1 := Pos(OpenTag, AXML);
  if P1 = 0 then
  begin
    P1 := Pos(':' + ATagName + '>', AXML);
    if P1 > 0 then
    begin
      while (P1 > 1) and (AXML[P1] <> '<') do Dec(P1);
      P2 := PosEx('>', AXML, P1);
    end
    else
      P2 := 0;
  end
  else
    P2 := P1 + Length(OpenTag) - 1;

  if (P1 = 0) or (P2 = 0) then
    Exit;

  P3 := Pos(CloseTag, AXML);
  if P3 = 0 then
    P3 := Pos(':' + ATagName + '>', Copy(AXML, P2 + 1, MaxInt));
  if P3 = 0 then
    Exit;
  if Pos(CloseTag, AXML) = 0 then
    P3 := P2 + P3 - 1;
  Result := XmlUnescape(Trim(Copy(AXML, P2 + 1, P3 - P2 - 1)));
end;

function ExtractBlock(const AXML, ATagName: string): string;
var
  P1, P2, P3: Integer;
  OpenTag, CloseTag: string;
begin
  Result := '';
  OpenTag := '<' + ATagName + '>';
  CloseTag := '</' + ATagName + '>';
  P1 := Pos(OpenTag, AXML);
  if P1 = 0 then
  begin
    P1 := Pos(':' + ATagName + '>', AXML);
    if P1 > 0 then
    begin
      while (P1 > 1) and (AXML[P1] <> '<') do Dec(P1);
      P2 := PosEx('>', AXML, P1);
    end
    else
      P2 := 0;
  end
  else
    P2 := P1 + Length(OpenTag) - 1;

  if (P1 = 0) or (P2 = 0) then
    Exit;

  P3 := Pos(CloseTag, AXML);
  if P3 = 0 then
    P3 := Pos(':' + ATagName + '>', Copy(AXML, P2 + 1, MaxInt));
  if P3 = 0 then
    Exit;
  if Pos(CloseTag, AXML) = 0 then
    P3 := P2 + P3 - 1;
  Result := Copy(AXML, P2 + 1, P3 - P2 - 1);
end;

procedure TCEFRespostaServico.FromXML(const AXML: string);
var
  Controle: string;
begin
  Xml := AXML;
  CodRetorno := ExtractTagValue(AXML, 'COD_RETORNO');
  OrigemRetorno := ExtractTagValue(AXML, 'ORIGEM_RETORNO');
  MsgRetorno := ExtractTagValue(AXML, 'MSG_RETORNO');
  Controle := ExtractBlock(AXML, 'CONTROLE_NEGOCIAL');
  if Controle <> '' then
  begin
    ControleOrigemRetorno := ExtractTagValue(Controle, 'ORIGEM_RETORNO');
    ControleCodRetorno := ExtractTagValue(Controle, 'COD_RETORNO');
    ControleMensagem := ExtractTagValue(Controle, 'RETORNO');
  end
  else
  begin
    ControleOrigemRetorno := OrigemRetorno;
    ControleCodRetorno := CodRetorno;
    ControleMensagem := ExtractTagValue(AXML, 'RETORNO');
  end;
  Excecao := ExtractTagValue(AXML, 'EXCECAO');
  CodigoBarras := ExtractTagValue(AXML, 'CODIGO_BARRAS');
  LinhaDigitavel := ExtractTagValue(AXML, 'LINHA_DIGITAVEL');
  NossoNumero := ExtractTagValue(AXML, 'NOSSO_NUMERO');
  Url := ExtractTagValue(AXML, 'URL');
  QrCode := ExtractTagValue(AXML, 'QRCODE');
  UrlQrCode := ExtractTagValue(AXML, 'URL_QRCODE');
end;

function TCEFRespostaServico.Sucesso: Boolean;
begin
  Result := ((CodRetorno = '') or (CodRetorno = '00')) and
            ((ControleCodRetorno = '') or (ControleCodRetorno = '0') or
             (ControleCodRetorno = '00'));
end;

end.
