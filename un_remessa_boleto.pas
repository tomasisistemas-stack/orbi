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
    procedure SetarBoletos(listaboletos: string);
    procedure SetaBoletosDescontados(listaboletos: string; descontar: boolean);
    procedure ChecarDataVencida;
    procedure RegistrarBoletosApi(const ListaBoletos: string);

    { Private declarations }
  public
    { Public declarations }
    modo_insert: boolean;
    totalselecionados: Integer;
    impressao_boleto : Boolean;
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
  Un_BB_Cobrancas, Un_BB_Cobrancas_Api, Un_CEF_Cobrancas, Un_CEF_Cobrancas_Api, System.JSON;

{$R *.dfm}

const
  BB_COBRANCA_SCOPE = 'cobrancas.boletos-info cobrancas.boletos-requisicao';

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
procedure BBMessageDlgErroApi(const APrefixo: string; E: Exception);
var
  Msg: string;
begin
  Msg := BBMensagemErroApi(E);
  if Trim(APrefixo) <> '' then
    Msg := APrefixo + #13 + Msg;
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
  total: real;
  LDataPagamento: TDateTime;
  LValorPago: Double;
begin
  Screen.Cursor := crSQLWait;

  cmd_conta := ' 1 = 1  ';

  if PrID.text <> '' then
    cmd_remessa := ' and coalesce(a.CONTA_BOLETO, v1.conta_boleto) = ' +
      PrCONTA.text + ' and a.BOLETO_REMESSA_ORDEM = ' + PrID.text
  else
    cmd_remessa := ' and a.BOLETO_REMESSA_ORDEM = 0 ';

  if PrCONTA.text <> '' then
    cmd_conta := '   coalesce(a.CONTA_BOLETO, v1.conta_boleto) = ' +
      PrCONTA.text;

  if PrID.text = '' then
    //cmd_conta := cmd_conta {+ ' and A.DTAVEN >= CURRENT_DATE '/};
    cmd_conta := cmd_conta + ' and 1 = 1 ';

  cmd := '';
  cmd := ' select * ' + ' from ' + ' ( ' +
    '   select a.ID, a.COD_CLIENTE, a.NR_DOCUMENTO, a.TITULO, ' +
    '   a.SEQUENCIA, a.COD_EMPRESA, a.DTAVEN, a.VALOR, a.COD_FOP, a.Instrucao_boleto, '
    + '   a.HISTORICO, a.DTAREC, a.VALOR_RECEBIDO, a.SALDO, a.DIAS_ATRASO, ' +
    '   a.VLR_CORRIGIDO, a.DESCONTO, a.NR_CUPOM, a.CONFERIDO, a.ID_REPRESENTANTE, '
    + '   a.VLR_COMISSAO, a.ID_PLANO_CONTAS, a.SINCRONIZAR_PALM, a.EXTRATO, ' +
    '   a.VALOR_CORRIGIDO, a.BOLETO_REMESSA_ORDEM, a.BOLETO_RETORNO_CODIGO, a.CONTA_BOLETO, '
    + '   a.BOLETO_RETORNO_DESCRICAO, c.nom_cliente, C.TIP_PESSOA, C.CNPJ, C.CPF, C.ENDERECO, A.DESCONTADA, coalesce(A.BOLETO_REGISTRADO, false) as BOLETO_REGISTRADO, ' +
    '   cc.api_key_cobranca, cc.client_id_cobranca, cc.client_secret_cobranca, cc.convenio, cc.codigo_cedente, cc.nr_agencia, emp.cnpj as cnpj_beneficiario, bb.nr_banco, '
    + '   C.NR_ENDERECO, C.BAIRRO, CD.NOM_CIDADE, CD.UF, C.CEP, CASE WHEN C.IE IS NULL THEN 1 ELSE 0 END AS ISENTO  '
    + '   from cr1 a ' +
    '   left join cliente c on c.cod_cliente = a.cod_cliente ' +
    '   inner join cidades cd on (cd.COD_CIDADE = C.COD_CIDADE) ' +
    '   left outer join vendas1 v1 on (v1.NUMDOC = a.NR_DOCUMENTO) ' +
    '   left outer join conta_corrente cc on cc.id = coalesce(a.conta_boleto, v1.conta_boleto) ' +
    '   left outer join banco bb on bb.id = cc.id_banco ' +
    '   left outer join empresa emp on emp.cod_empresa = cc.id_empresa ' +
    '   where ' + cmd_conta + ' and ' + '   a.DTAREC is null and ' +
    '   a.BOLETO_REMESSA_ORDEM is null ' + '   union ' +
    '   select a.ID, a.COD_CLIENTE, a.NR_DOCUMENTO, a.TITULO, ' +
    '   a.SEQUENCIA, a.COD_EMPRESA, a.DTAVEN, a.VALOR, a.COD_FOP, a.Instrucao_boleto, '
    + '   a.HISTORICO, a.DTAREC, a.VALOR_RECEBIDO, a.SALDO, a.DIAS_ATRASO, ' +
    '   a.VLR_CORRIGIDO, a.DESCONTO, a.NR_CUPOM, a.CONFERIDO, a.ID_REPRESENTANTE, '
    + '   a.VLR_COMISSAO, a.ID_PLANO_CONTAS, a.SINCRONIZAR_PALM, a.EXTRATO, ' +
    '   a.VALOR_CORRIGIDO, a.BOLETO_REMESSA_ORDEM, a.BOLETO_RETORNO_CODIGO, a.CONTA_BOLETO, '
    + '   a.BOLETO_RETORNO_DESCRICAO, c.nom_cliente, C.TIP_PESSOA, C.CNPJ, C.CPF, C.ENDERECO, A.DESCONTADA, coalesce(A.BOLETO_REGISTRADO, false) as BOLETO_REGISTRADO, ' +
    '   cc.api_key_cobranca, cc.client_id_cobranca, cc.client_secret_cobranca, cc.convenio, cc.codigo_cedente, cc.nr_agencia, emp.cnpj as cnpj_beneficiario, bb.nr_banco, '
    + '   C.NR_ENDERECO, C.BAIRRO, CD.NOM_CIDADE, CD.UF, C.CEP, CASE WHEN C.IE IS NULL THEN 1 ELSE 0 END AS ISENTO  '
    + '   from cr1 a ' +
    '   left join cliente c on c.cod_cliente = a.cod_cliente ' +
    '   inner join cidades cd on (cd.COD_CIDADE = C.COD_CIDADE) ' +
    '   left outer join vendas1 v1 on (v1.NUMDOC = a.NR_DOCUMENTO) ' +
    '   left outer join conta_corrente cc on cc.id = coalesce(a.conta_boleto, v1.conta_boleto) ' +
    '   left outer join banco bb on bb.id = cc.id_banco ' +
    '   left outer join empresa emp on emp.cod_empresa = cc.id_empresa ' +
    '   where 1 = 1 ' +
    //' A.DTAVEN >= CURRENT_DATE and a.DTAREC is null ' +
    cmd_remessa
    + '   ) q1 ' + ordem;

  dao.Geral1(cmd);
  dao.Q1.First;
  tem_data_vcto_vencida := false;
  mmItens.DisableControls;
  mmItens.Close;
  mmItens.EmptyTable;
  mmItens.Open;
  totalselecionados := 0;
  total := 0;
  fm_splash.ggProgress.Progress := 0;
  fm_splash.ggProgress.MaxValue := dao.Q1.RecordCount;
  while not dao.Q1.Eof do
  begin
    mmItens.Append;
    mmItensID.AsString := dao.Q1.fieldbyname('id').AsString;
    mmItensNR_DOCUMENTO.AsString := dao.Q1.fieldbyname('NR_DOCUMENTO').AsString;
    mmItensTITULO.AsString := dao.Q1.fieldbyname('titulo').AsString;
    mmItensSEQUENCIA.AsString := dao.Q1.fieldbyname('sequencia').AsString;
    mmItensCOD_CLIENTE.AsString := dao.Q1.fieldbyname('COD_CLIENTE').AsString;
    mmItensNOM_CLIENTE.AsString := dao.Q1.fieldbyname('nom_cliente').AsString;
    mmItensCOD_CLIENTE.AsString := dao.Q1.fieldbyname('cod_cliente').AsString;
    mmItensTIPO_PESSOA.AsString := dao.Q1.fieldbyname('tip_pessoa').AsString;
    mmItensCNPJ.AsString := dao.Q1.fieldbyname('cnpj').AsString;
    mmItensCPF.AsString := dao.Q1.fieldbyname('cpf').AsString;
    mmItensENDERECO.AsString := dao.Q1.fieldbyname('endereco').AsString;
    mmItensNR_ENDERECO.AsString := dao.Q1.fieldbyname('nr_endereco').AsString;
    mmItensBAIRRO.AsString := dao.Q1.fieldbyname('bairro').AsString;
    mmItensNOM_CIDADE.AsString := dao.Q1.fieldbyname('nom_cidade').AsString;
    mmItensUF.AsString := dao.Q1.fieldbyname('uf').AsString;
    mmItensCEP.AsString := dao.Q1.fieldbyname('cep').AsString;
    mmItensDTAVEN.AsString := dao.Q1.fieldbyname('dtaven').AsString;
    mmItensVALOR.AsString := dao.Q1.fieldbyname('valor').AsString;
    mmItensISENTO.AsInteger := dao.Q1.fieldbyname('ISENTO').AsInteger;
    mmItensDESCONTADA.Value := dao.Q1.fieldbyname('DESCONTADA').AsString = '1';
    mmItensBOLETO_REGISTRADO.Value := (not dao.Q1.fieldbyname('BOLETO_REGISTRADO').IsNull) and dao.Q1.fieldbyname('BOLETO_REGISTRADO').AsBoolean;

    if impressao_boleto then
      mmItensINSTRUCAO_BOLETO.AsString := dao.Q1.fieldbyname('INSTRUCAO_BOLETO').AsString+#13+mensagem_padrao
    else
      mmItensINSTRUCAO_BOLETO.AsString := dao.Q1.fieldbyname('INSTRUCAO_BOLETO').AsString;

    if not dao.Q1.fieldbyname('BOLETO_REMESSA_ORDEM').IsNull then
    begin
      mmItensCheck.Value := true;
      totalselecionados := totalselecionados + 1;
    end
    else
      mmItensCheck.Value := false;

    total := total + dao.Q1.fieldbyname('valor').Asfloat;
    if not mmItensBOLETO_REGISTRADO.AsBoolean then
    begin
      try
        if BoletoRegistradoNaApi(dao.Q1, LDataPagamento, LValorPago) then
        begin
          BBMarcarBoletoRegistrado(dao.Q1.fieldbyname('id').AsInteger, LDataPagamento, LValorPago);
          mmItensBOLETO_REGISTRADO.AsBoolean := true;
        end;
      except
        on E: Exception do
          BBLogApi('CarregaItens verificar boleto registrado ERRO - cr1_id=' + dao.Q1.fieldbyname('id').AsString + ', erro=' + E.Message);
      end;
    end;
    mmItens.Post;
    fm_splash.ggProgress.AddProgress(1);
    fm_splash.Update;
    dao.Q1.Next;
  end;
  mmItens.First;
  mmItens.EnableControls;
  lbTotalNFs.Caption := 'Boletos Relacionados: ' + IntToStr(totalselecionados);
  lbtotal.Caption := FormatFloat('R$ #,###,##0.00', total);
  Screen.Cursor := crDefault;
  fm_splash.Hide;
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
      fmfun.ACBrBoleto1.Cedente.CodigoCedente :=
        dao.Q2.fieldbyname('codigo_cedente').AsString;
      fmfun.ACBrBoleto1.Cedente.Convenio := dao.Q2.fieldbyname('convenio').AsString;
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
        fmfun.ACBrBoleto1.Cedente.Logradouro := 'RUA CAMBORIÚ, Nº 519 - CENTRO';
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
      dao.msg('Registro não Encontrado!');
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

procedure Tfrm_remessa_boleto.PrIDButtonClick(Sender: TObject);
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
    Fr_localizar.Free;
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

  // CABEÇALHO 0
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

procedure Tfrm_remessa_boleto.RegistrarBoletosApi(const ListaBoletos: string);
var
  Q: TFDQuery;
  Api: TBBApiCobrancas;
  ApiCEF: TCEFApiCobrancas;
  Boleto: TBBRegistroBoleto;
  BoletoCEF: TCEFOperacaoBoleto;
  HeaderCEF: TCEFHeader;
  Resposta: TBBRespostaRegistroBoleto;
  RespostaCEF: TCEFRespostaServico;
  Banco, ApiKey, ClientId, ClientSecret, DocPagador, TituloCliente, CodigoBeneficiarioCEF, NossoNumeroCEF: string;
  VariacaoCarteira: Integer;
  Ambiente: TBBApiAmbiente;
  AmbienteCEF: TCEFApiAmbiente;
  LDataPagamento: TDateTime;
  LValorPago: Double;
begin
  if Trim(ListaBoletos) = '' then
    Exit;

  Q := TFDQuery.Create(nil);
  try
    Q.Connection := dao.cn;
    Q.SQL.Text :=
      'select cr.id, cr.titulo, cr.sequencia, cr.dtaven, cr.valor, ' +
      '       c.api_key_cobranca, c.client_id_cobranca, c.client_secret_cobranca, ' +
      '       c.convenio, c.codigo_cedente, c.nr_agencia, emp.cnpj as cnpj_beneficiario, c.carteira, c.modalidade, c.tipo_cobranca, b.nr_banco, ' +
      '       cl.tip_pessoa, cl.nom_cliente, cl.cnpj, cl.cpf, cl.endereco, cl.nr_endereco, ' +
      '       cl.bairro, cl.cep, cl.telefone, cl.email, cd.nom_cidade, cd.uf ' +
      'from cr1 cr ' +
      'inner join conta_corrente c on c.id = cr.conta_boleto ' +
      'inner join banco b on b.id = c.id_banco ' +
      'inner join empresa emp on emp.cod_empresa = c.id_empresa ' +
      'inner join cliente cl on cl.cod_cliente = cr.cod_cliente ' +
      'left join cidades cd on cd.cod_cidade = cl.cod_cidade ' +
      'where cr.id in (' + ListaBoletos + ') ' +
      'order by cr.titulo, cr.sequencia';
    Q.Open;

    while not Q.Eof do
    begin
      Banco := BBOnlyNumbers(BBFieldStr(Q, 'nr_banco', ''));
      ApiKey := Trim(BBFieldStr(Q, 'api_key_cobranca', ''));
      ClientId := Trim(BBFieldStr(Q, 'client_id_cobranca', ''));
      ClientSecret := Trim(BBFieldStr(Q, 'client_secret_cobranca', ''));

      if ((Banco = '1') or (Banco = '001')) and (ApiKey <> '') and
         (ClientId <> '') and (ClientSecret <> '') then
      begin
        Boleto := TBBRegistroBoleto.Create;
        Api := TBBApiCobrancas.Create;
        try
          Ambiente := BBAmbienteApi;
          Api.Ambiente := Ambiente;
          Api.AppKey := ApiKey;
          Api.ObterTokenClientCredentials(ClientId, ClientSecret, BB_COBRANCA_SCOPE).Free;

          if UpperCase(Trim(BBFieldStr(Q, 'tip_pessoa', ''))) = 'J' then
          begin
            if Api.Ambiente = bbProducao then
              DocPagador := BBOnlyNumbers(BBFieldStr(Q, 'cnpj', ''))
            else
              DocPagador := '00000000000191';

            Boleto.Pagador.TipoInscricao := 2;
          end
          else
          begin
            if Api.Ambiente = bbProducao then
              DocPagador := BBOnlyNumbers(BBFieldStr(Q, 'cpf', ''))
            else
              DocPagador := '00000000191';

            Boleto.Pagador.TipoInscricao := 1;
          end;

          Boleto.Pagador.Nome := Copy(BBFieldStr(Q, 'nom_cliente', ''), 1, 60);

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
          Boleto.CodigoAceite := 'N';
          Boleto.CodigoTipoTitulo := 2;
          Boleto.DescricaoTipoTitulo := 'DM';
          Boleto.IndicadorPermissaoRecebimentoParcial := 'N';
          Boleto.NumeroTituloBeneficiario := BBNumeroTituloBeneficiario(Q);
          Boleto.NumeroTituloCliente := BBMontarCampoNossoNumero(Q);

          Boleto.Pagador.NumeroInscricao := StrToInt64Def(DocPagador, 0);
          Boleto.Pagador.Endereco := Copy(Trim(BBFieldStr(Q, 'endereco', '') + ', ' + BBFieldStr(Q, 'nr_endereco', '')), 1, 60);
          Boleto.Pagador.Cep := StrToIntDef(BBOnlyNumbers(BBFieldStr(Q, 'cep', '')), 0);
          Boleto.Pagador.Cidade := Copy(BBFieldStr(Q, 'nom_cidade', ''), 1, 30);
          Boleto.Pagador.Bairro := Copy(BBFieldStr(Q, 'bairro', ''), 1, 30);
          Boleto.Pagador.Uf := Copy(BBFieldStr(Q, 'uf', ''), 1, 2);
          Boleto.Pagador.Telefone := Copy(BBOnlyNumbers(BBFieldStr(Q, 'telefone', '')), 1, 15);
          Boleto.Pagador.Email := Copy(BBFieldStr(Q, 'email', ''), 1, 60);

          BBLogApi('Registrar boleto - ambiente=' + BBAmbienteNome(Ambiente) +
            ', cr1_id=' + Q.FieldByName('id').AsString + ', titulo=' + TituloCliente +
            ', convenio=' + IntToStr(Boleto.NumeroConvenio));
          try
            if BoletoRegistradoNaApi(Q, LDataPagamento, LValorPago) then
            begin
              BBMarcarBoletoRegistrado(Q.FieldByName('id').AsInteger, LDataPagamento, LValorPago);
              BBLogApi('Registrar boleto ignorado, ja registrado - ambiente=' + BBAmbienteNome(Ambiente) +
                ', cr1_id=' + Q.FieldByName('id').AsString + ', titulo=' + TituloCliente);
            end;
          except
            try
              Resposta := Api.RegistrarBoleto(Boleto);
              Resposta.Free;
              BBMarcarBoletoRegistrado(Q.FieldByName('id').AsInteger, 0, 0);
              BBLogApi('Registrar boleto OK - ambiente=' + BBAmbienteNome(Ambiente) +
                ', cr1_id=' + Q.FieldByName('id').AsString + ', titulo=' + TituloCliente);
            except
              on E: Exception do
              begin
                BBLogApi('Registrar boleto ERRO - ambiente=' + BBAmbienteNome(Ambiente) +
                  ', cr1_id=' + Q.FieldByName('id').AsString + ', titulo=' + TituloCliente + ', erro=' + E.Message);
                raise;
              end;
            end;
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
          AmbienteCEF := CEFAmbienteApi;
          CEFLogApi('Registrar boleto - ambiente=' + CEFAmbienteNome(AmbienteCEF) +
            ', cr1_id=' + Q.FieldByName('id').AsString + ', nosso_numero=' + NossoNumeroCEF +
            ', codigo_beneficiario=' + CodigoBeneficiarioCEF);
          try
            if BoletoRegistradoNaApi(Q, LDataPagamento, LValorPago) then
            begin
              BBMarcarBoletoRegistrado(Q.FieldByName('id').AsInteger, LDataPagamento, LValorPago);
              CEFLogApi('Registrar boleto ignorado, ja registrado - ambiente=' + CEFAmbienteNome(AmbienteCEF) +
                ', cr1_id=' + Q.FieldByName('id').AsString + ', nosso_numero=' + NossoNumeroCEF);
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
                BoletoCEF.Titulo.TipoEspecie := '99';
                BoletoCEF.Titulo.FlagAceite := 'N';
                BoletoCEF.Titulo.DataEmissao := CEFDataApi(Date);
                BoletoCEF.Titulo.CodigoMoeda := '9';
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
                BoletoCEF.Titulo.Pagador.Endereco.CEP := BBOnlyNumbers(BBFieldStr(Q, 'cep', ''));
                HeaderCEF := CEFNovoHeaderApi(Q, CodigoBeneficiarioCEF, NossoNumeroCEF,
                  BBFieldDate(Q, 'dtaven'), BBFieldFloat(Q, 'valor'), True);
                RespostaCEF := ApiCEF.IncluirBoleto(BoletoCEF, HeaderCEF);
                try
                  if not RespostaCEF.Sucesso then
                    raise Exception.Create('Erro API CEF: ' + RespostaCEF.ControleMensagem);
                finally
                  RespostaCEF.Free;
                end;
                BBMarcarBoletoRegistrado(Q.FieldByName('id').AsInteger, 0, 0);
                CEFLogApi('Registrar boleto OK - ambiente=' + CEFAmbienteNome(AmbienteCEF) +
                  ', cr1_id=' + Q.FieldByName('id').AsString + ', nosso_numero=' + NossoNumeroCEF);
              finally
                ApiCEF.Free;
                HeaderCEF.Free;
                BoletoCEF.Free;
              end;
            end;
          except
            on E: Exception do
            begin
              CEFLogApi('Registrar boleto ERRO - ambiente=' + CEFAmbienteNome(AmbienteCEF) +
                ', cr1_id=' + Q.FieldByName('id').AsString + ', nosso_numero=' + NossoNumeroCEF + ', erro=' + E.Message);
              raise;
            end;
          end;
        end;
      end;

      Q.Next;
    end;
  finally
    Q.Free;
  end;
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
        extrato := FMFUN.GravaExtrato('DESCONTO ESCRITURAL REF. AO TÍTULO: ' +
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
  boletos_descontados := copy(boletos, 1, length(boletos_descontados) - 1);
  boletos_n_descontados := copy(boletos, 1, length(boletos_n_descontados) - 1);
  if boletos <> '' then
    SetarBoletos(boletos);

  if boletos_descontados <> '' then
    SetaBoletosDescontados(boletos_descontados, true);

  if boletos_n_descontados <> '' then
    SetaBoletosDescontados(boletos_n_descontados, false);

  if boletos <> '' then
  begin
    try
      RegistrarBoletosApi(boletos);
    except
      on E: Exception do
      begin
        BBMessageDlgErroApi('Houve um erro ao registrar boletos na API do Banco do Brasil!', E);
        Exit;
      end;
    end;
  end;

  PrCONTA.enabled := false;
  btInserir.enabled := true;
  BtSalvar.enabled := false;
  BtCancelar.enabled := false;
  BtBuscar.enabled := true;
  BtGerarArquivo.enabled := fmfun.ACBrBoleto1.Cedente.Agencia <> '';
  BtImprimir.enabled := true;
  BtBoleto.enabled := true;
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
    dao.msg('Não foi encontrado Registros para gerar o Relatório');
    Exit;
  end;

  if not(fR_RELATORIO.LoadFromFile(Path + 'Relatorios\cobranca.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 +
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
    Value := 'Remessa de Cobrança';

  if VarName = 'dtaini' then
    Value := formatdatetime('dd/mm/yyyy', now)
  else if VarName = 'dtafin' then
    Value := formatdatetime('dd/mm/yyyy', now);
end;

procedure Tfrm_remessa_boleto.BtBoletoClick(Sender: TObject);
begin
  impressao_boleto := True;
  CarregaItens('ORDER BY TITULO, SEQUENCIA');
  if trim(PrID.text) = '' then
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
var
  dia, mes, ano, ext, pathSaida, dir_remessa, arquivo: string;
begin
  impressao_boleto := False;
  CarregaItens('ORDER BY TITULO, SEQUENCIA');
  if tem_data_vcto_vencida then
  begin
    Dialogs.messagedlg
      ('Há Data de Vencimentos Vencidos nos boletos relacionados!', mtError,
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






















