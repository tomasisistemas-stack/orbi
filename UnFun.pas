unit UnFun;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Winsock, Controls, Forms,
  Dialogs, ExtCtrls, printers, jpeg, StdCtrls, strUtils, Tlhelp32,
  ComObj, ACBrBoleto, DateUtils, System.JSON, ACBrBoletoConversao,
  PsAPI, math, pcnConversao, ACBrNFe, ACBrBase, ACBrSocket,
  ACBrConsultaCNPJ, ACBrConsultaCPF, Xml.xmldom, Xml.XMLIntf, Xml.Win.msxmldom,
  Xml.XMLDoc, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, TypInfo, ACBrMDFe, ACBrDFe, ACBrBoletoFCFR, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, IPPeerClient,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, Data.DB,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Un_speedio_api;

type
  TRGBArray = array [Word] of TRGBTriple;
  pRGBArray = ^TRGBArray;

  TFMFUN = class(TForm)
    ACBrNFe1: TACBrNFe;
    idHttpGeral: TIdHTTP;
    XMLGeral: TXMLDocument;
    ACBrConsultaCNPJ1: TACBrConsultaCNPJ;
    ACBrBoletoFCFR1: TACBrBoletoFCFR;
    ACBrBoleto1: TACBrBoleto;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    procedure FormCreate(Sender: TObject);

  private
    procedure MontaLogger;
    procedure atualiza_comissao_margem(numdoc: string);
    procedure AtualizarSaldoExtrato(conta: string);
    function TraceStackLineOut(MapModuleName, ProcedureName: String; Line: Integer; FileName: String): string;

    { Private declarations }
  public

    { Public declarations }
    IP, ID, COMPUTADOR: string;
    procedure Localizar(pChamou_Form, pChamou_pesquisa, pCaption,
      pChamou_cadastro, pBtCaption : string; pBtVisible: Boolean;
      pCamposCombo: array of string; pRevenda: string = 'S');
    function LiberarProcesso: Boolean;
    procedure BuscaDadosPorCNPJJson(cnpj_cpf: string; out RazaoSocial: string; out Fantasia: string; out CEP: string; out Endereco: string; out Numero: string; out Complemento: string;
      out Bairro: string; out CIDADE: string; out uf: string; out EmpresaTipo: string; out Situacao: string);
    procedure TrimAppMemorySize;
    procedure AtualizaDadosComissaoDesconto(pedido: string);
    procedure AvisoEstoqueMinimo(email: string);
    procedure LogException;
    procedure AvisoRepresentantesVisitas(representante: string);
    function TamanhoArquivo(Arquivo: string): Integer;
    procedure VendasRepresentantesEmail(dia_semana: string; telemarketing: boolean);
    procedure AvisoContasReceber(conta: string; tipo: Integer);
    function FormataCEP(CEP: string): string;
    function FormataIE(uf: string): string;
    function BuscaDadosPorCNPJ(cnpj_cpf, uf: string; PJ: boolean): boolean;
    function BuscaAmbienteNFE: TpcnTipoAmbiente;
    function PegaValorParaSql(campo: TField):string;
    function Modulo11(Numero: string): string;
    function LimpaCNPJ(cnpj: string): string;
    procedure dgCreateProcess(const FileName: string);
    function IsFileInUse(fName: string): boolean;
    procedure AtualizaPeso(pedido: string);
    function enchezero(MDADENV: string; MTAMVAR: Integer): string;
    function enchevazio(MDADENV: string; MTAMVAR: Integer): string;
    function arredonda(MVLR: real): real;
    function DifDias(DataVenc: TDateTime; DataAtual: TDateTime): string;
    function DataExtenso(Data: TDateTime): string;
    function DifDateUtil(dataini, datafin: string): Integer;
    function IsWeekEnd(dData: TDateTime): boolean;
    function Arredondar(Valor: Double; Dec: Integer): Double;
    function extenso(Valor: real): string;
    function CkData(const S: string): boolean;
    function DataExtenso1(Data: TDateTime): string;
    function HexToInt(Hex: string): Integer;
    function BuscaTroca(Text, Busca, Troca: string): string;
    function Inscricao(Inscricao, tipo: string): boolean;
    function Mascara_Inscricao(Inscricao, Estado: string): string;
    function CaseString(const S: string; const x: array of string): Integer;
    function poePONTOS(MDADENV: string; MTAMVAR: Integer): string;
    function PreEsp(MSTR: string; MTAM: Integer): string;
    function RTrim(Texto: string): string;
    function Alltrim(const Search: string): string;
    function RemoveChar(const Texto: string): string;
    function GetDefaultPrinterName: string;
    function busca_sinal_igual(produto: string): boolean;
    // se o produto tiver sinal de igual ele avisa
    function verificaNumerico(S: string): boolean;
    procedure LimpaLetrasConsulta(S: TEdit);
    function poe2zero(MVLR: real): real;
    function TamArquivo(Arquivo: string): Integer;

    function Str_to_float(VlrStr: string; default: Currency): Currency;
    function prepara_valor(vlr: string): string;
    function TratarCodigoNCM(codigo: string; tipo: Integer): string;
    function calcula_dv_nfe(c_uf, dta_emissao, cnpj, modelo, serie, nr_nf, cod_numerico: string): string;
    function ValidarQuantidadeMaxima(produto: string; quantidade: Double): boolean;

    // porque o sinal de igual dá problema na hora do fechamento de consignação
{$IFNDEF ORBISELLER}
    function ValidaNCM(ncm, cest: string): boolean;
    function BuscaDescNCM(ncm: string): string;
    function BuscaProxCheque: Integer;
    function GravaExtrato(historico, Data, conta, operacao: string; Valor: Double; tipo: Integer): Integer;
    procedure GravaExtratoConta(extrato, conta, tipo: Integer);
    procedure ExcluirExtrato(extrato, operacao: string);
    procedure ExcluirExtratoConta(conta_pagar_receber, operacao: string; Valor: Double);
    function GravaCodeBar(codigo: string; tipo: Integer): string;
    procedure AtualizaDadosComissao(pedido: string);
{$ENDIF}
    function Explode(str, separador: string): TStringList;
    function BuscaImpressoraPadrao: string;
    procedure ConverterJPegParaBmp(Arquivo: string);
    function InverteData(Data: string): string;
    function cmdAux(wheresql, filtro: string): string;
    function AnsiToAscii(str: string; aspas: boolean = true): string;
    function Dc_MessageDlg(Msg: string; AType: TMsgDlgType; AButtons: TMsgDlgButtons; IndiceHelp: LongInt; DefButton: TMOdalResult = mrNone; Portugues: boolean = true): Word;
    procedure ImprimeEtiqueta(codigo, descricao, qtd_emb, unidade, codigo_barra: string; tipo: Integer; mostra_unidade, mostra_empresa: boolean);
    function CalculaDigEAN13(Cod: string): string;
    function UpperCase(St: string): string;
    function LowerCase(St: string): string;
    function PegarIP: string;
    function NomeMaquina: string;
    function ProcessoExiste(ExeFileName: string): boolean;
    function TerminarProcesso(sFile: string): boolean;
    function DecimalPonto(sValor: string): string;
    function JPEGDimensions(FileName: string; var x, Y: Word): boolean;
    function SaveJPEGPictureFile(Bitmap: TBitmap; FilePath, FileName: string; Quality: Integer): boolean;
    procedure SetJPGResize(width: Integer; const AInFile: string; const AOutFile: string);
    procedure QualityResizeBitmap(bmpOrig, bmpDest: TBitmap; newWidth, newHeight: Integer);
    function GetNumeroProcessos(const NomeExe: string): Integer;
    function StrInArray(str: String; const lista: array of string): boolean;

{$IFDEF ORBI}
    function MontaChaveAcessoNFe(codUF: Integer; dtEmissao: TDateTime; cnpj: string; modelo, serie, NumeroNF, TpEmis, CodigoNumerico: Integer): string;
    function calcula_custo_entrada(custo, perc_impostos, perc_ipi, perc_geral, perc_st: real): real;
    function LoginSite: boolean;
    function BonificacaoLiberado(cliente, produto, pedido: string; qtd: Integer): boolean;
    function AtualizarSite(Parametros: TStringStream): boolean;
    function GerarCodigoMobile(codigo: Integer): Integer;
    function calcula_preco_venda(custo_total, margem_lucro: real): real;
    function calcula_custo_total(custo, perc_impostos, perc_ipi, perc_geral, perc_st: real): real;
    function ChecarEmailCliente(cliente, tipo: string): boolean;
    function VerificaFaturaVencida(cod_cliente: string; aviso: boolean): boolean;
    procedure GraficoCusto(produto: string);
    function ValidaDadosCliente(cliente: string): boolean;
    function ValidaDadosTransportadora(transportadora: string): boolean;
    function ValidaData(Data: string): boolean;
    function ValidarQuantidade(produto: string; quantidade: Double): boolean;
    function ChecarPrazoAtualizacaoVendedor: boolean;
    function GerarProcessoPedido: string;
    procedure AlterarProcessoPedido(processo, pedido: string);
    procedure GravarProcessoPedido(status, processo, pedido: string);
    procedure ListaNCM(chamou, ncm: string; cest: boolean);

    procedure MontaCobrancaItem(NomeCliente, TipoPessoa, cnpj, cpf, Endereco, NrEndereco, Bairro, NomeCidade, sUF, CEP, carteira_conta, Boleto_Avalista, Titulo, Sequencia, Instrucao: string;
      Vencto: TDateTime; dias_protesto, dias_baixa, isento: Integer; Valor: Double);

{$ENDIF}
  end;

const
  LOGON_WITH_PROFILE = $00000001;

var
  FMFUN: TFMFUN;
  caminho_imp_cod_barras: string;

implementation

uses Un_dao

{$IFDEF ORBICOLLETOR}, un_principal, un_escolhe_impressora_termica,
  un_selec_uf
{$ENDIF}
{$IFDEF ORBIPALM} , Un_menuprincipal
{$ENDIF}{$IFDEF ORBI}, un_selec_uf, Un_Cliente, Un_status_financeiro_cliente,
  un_produto_variacao, unpri, un_localizar,
  un_escolhe_impressora_termica, alterar_status_pedido
{$ENDIF} // , UnPri;
    , UnSenha_especial;
{$R *.DFM}

procedure TFMFUN.TrimAppMemorySize;
var
  MainHandle: THandle;
begin
  try
    MainHandle := OpenProcess(PROCESS_ALL_ACCESS, false, GetCurrentProcessID);
    SetProcessWorkingSetSize(MainHandle, $FFFFFFFF, $FFFFFFFF);
    CloseHandle(MainHandle);
  except
  end;
  Application.ProcessMessages;
end;

{$IFDEF ORBI}

procedure TFMFUN.MontaCobrancaItem(NomeCliente, TipoPessoa, cnpj, cpf, Endereco, NrEndereco, Bairro, NomeCidade, sUF, CEP, carteira_conta, Boleto_Avalista, Titulo, Sequencia, Instrucao: string;
  Vencto: TDateTime; dias_protesto, dias_baixa, isento: Integer; Valor: Double);

var
  txt: TextFile;
  dia, mes, ano, Ord, ext, pathSaida, tempFile, nosso_numero, nosso_numero_div, sql_cliente, dir_remessa: string;
  sequencial_arquivo: Integer;
  MensagemPadrao: TStrings;
  TituloBoleto: TACBrTitulo;
  function MontaNossoNumero(Numero: string): string;
  var
    p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13: string;
    Soma, resto: Integer;
    function converteLetra(letra: string): string;
    var
      variavel: string;
      letter: char;
    begin
      variavel := '';
      if letra = '' then
        exit;
      letra := UpperCase(letra);
      letter := letra[1];

      case letter of // converte letra em número
        'A':
          variavel := '1';
        'B':
          variavel := '2';
        'C':
          variavel := '3';
        'D':
          variavel := '4';
        'E':
          variavel := '5';
        'F':
          variavel := '6';
        'G':
          variavel := '7';
        'H':
          variavel := '8';
        'I':
          variavel := '9';
        'J':
          variavel := '10';
        'K':
          variavel := '11';
        'L':
          variavel := '12';
        'M':
          variavel := '13';
        'N':
          variavel := '14';
        'O':
          variavel := '15';
        'P':
          variavel := '16';
        'Q':
          variavel := '17';
        'R':
          variavel := '18';
        'S':
          variavel := '19';
        'T':
          variavel := '20';
        'U':
          variavel := '21';
        'V':
          variavel := '22';
        'W':
          variavel := '23';
        'X':
          variavel := '24';
        'Y':
          variavel := '25';
        'Z':
          variavel := '26';
      end; // case letra
      if variavel = '' then
        variavel := letra;
      Result := variavel;
    end;

  begin
    p1 := Copy(Numero, 1, 1);
    p2 := Copy(Numero, 2, 1);
    p3 := Copy(Numero, 3, 1);
    p4 := Copy(Numero, 4, 1);
    p5 := Copy(Numero, 5, 1);
    p6 := Copy(Numero, 6, 1);
    p7 := Copy(Numero, 7, 1);
    p8 := Copy(Numero, 8, 1);
    p9 := Copy(Numero, 9, 1);
    p10 := Copy(Numero, 10, 1);
    p11 := Copy(Numero, 11, 1);
    p12 := Copy(Numero, 12, 1);
    p13 := Copy(Numero, 13, 1);
    Result := converteLetra(p1) + converteLetra(p2) + converteLetra(p3) + converteLetra(p4) + converteLetra(p5) + converteLetra(p6) + converteLetra(p7) + converteLetra(p8) + converteLetra(p9) +
      converteLetra(p10) + converteLetra(p11) + converteLetra(p12) + converteLetra(p13);
  end;

begin
  TituloBoleto := ACBrBoleto1.CriarTituloNaLista;

  with TituloBoleto do
  begin
    EspecieMod := 'R$';
    if ACBrBoleto1.Banco.Numero = 237 then
      LocalPagamento := 'Pagável preferencialmente na Rede Bradesco ou Bradesco Expresso.';
    // MEnsagem exigida pelo bradesco

    if ACBrBoleto1.Banco.Numero = 1 then
      LocalPagamento := 'PAGAR PREFERENCIALMENTE NOS CANAIS DE AUTOATENDIMENTO DO BANCO DO BRASIL.';
    // MEnsagem exigida pelo bradesco

    if ACBrBoleto1.Banco.Numero = 85 then
      LocalPagamento := 'Pagável preferencialmente nas cooperativas do Sistema AILOS.';

    if ACBrBoleto1.Banco.Numero = 104 then
    begin
      LocalPagamento := 'EM TODA A REDE BANCÁRIA E SEUS CORRESPONDENTES ATÉ O VALOR LIMITE';
      ACBrBoleto1.Banco.LayoutVersaoArquivo := 107;
      ACBrBoleto1.Banco.LayoutVersaoLote := 67;
    end;
    // MEnsagem exigida pelo cef

    DataDocumento := now;
    Vencimento := Vencto;

    if ACBrBoleto1.Banco.Numero = 756 then
      NumeroDocumento := Copy(Titulo, 1, 6) + FMFUN.enchezero(Sequencia, 1)
    else
      NumeroDocumento := Copy(Titulo, 1, 8) + FMFUN.enchezero(Sequencia, 1);

    Carteira := carteira_conta;

    NossoNumero := MontaNossoNumero(NumeroDocumento);

    EspecieDoc := 'DM';
    // Aceite :=
    DataProcessamento := now;

    ValorDocumento := Valor;

    Sacado.NomeSacado := NomeCliente;

    if (TipoPessoa = 'J') then
    begin
      Sacado.CNPJCPF := frpri.LimpaCNPJ(cnpj);
      Sacado.Pessoa := pJuridica;
    end
    else
    begin
      Sacado.CNPJCPF := frpri.LimpaCNPJ(cpf);
      Sacado.Pessoa := pFisica;
    end;

    Sacado.Logradouro := Endereco;
    Sacado.Numero := NrEndereco;
    Sacado.Bairro := Bairro;
    Sacado.CIDADE := NomeCidade;
    Sacado.uf := sUF;
    Sacado.CEP := frpri.LimpaCNPJ(CEP);
    Instrucao1 := '00';
    if ACBrBoleto1.Cedente.Nome = 'UNICRED LITORAL E NORTE CATARINENSE' then
      Sacado.Avalista := Boleto_Avalista;

    PercentualMulta := 2;
    ValorMoraJuros := Valor * 0.0017;

    if ACBrBoleto1.Banco.Numero = 341 then
      DataMoraJuros := Vencimento;

    if ACBrBoleto1.Banco.Numero = 104 then
      DataMoraJuros := Vencimento + 1;

    if dias_baixa > 0 then
    begin
      DataBaixa := Vencimento + dias_baixa;

      if DayOfTheWeek(DataBaixa) = 6 then
        DataBaixa := DataBaixa + 2;

      if DayOfTheWeek(DataBaixa) = 7 then
        DataBaixa := DataBaixa + 1;

    end;

    if dias_protesto > 0 then
    begin
      DataProtesto := Vencimento + dias_protesto;

      if DayOfTheWeek(DataProtesto) = 6 then
        DataProtesto := DataProtesto + 2;

      if DayOfTheWeek(DataProtesto) = 7 then
        DataProtesto := DataProtesto + 1;

      if ACBrBoleto1.Banco.Numero = 33 then
        Instrucao1 := '06'
      else
        Instrucao1 := '09';
    end;

    DataMulta := Vencimento + 1;

    mensagem.Clear;

    // Instrucao2 := '00' ;
    if (sUF = 'RS') and (not isento = 1) then
      mensagem.Text := 'VALOR GNRE JÁ INCLUSO NO BOLETO';

    if trim(Instrucao) <> '' then
      mensagem.Add(Instrucao);

    if ACBrBoleto1.Banco.Numero = 104 then
    begin
      mensagem.Add('SAC CAIXA: 0800 726 0101 (Informações, reclamações, sugestões e elogios).');
      mensagem.Add('Para pessoas com deficiência auditiva ou de fala: 0800 726 2492.');
      mensagem.Add('Ouvidoria: 0800 725 7474 (Reclamações não solucionadas e denúncias).');
      mensagem.Add('caixa.gov.br');
    end;

    if ACBrBoleto1.Banco.Numero = 41 then
    begin
      mensagem.Add('SAC BANRISUL-0800 646 1515');
      mensagem.Add('OUVIDORIA BANRISUL-0800 644 2200');
    end;

    // ACBrBoleto1.AdicionarMensagensPadroes(TituloBoleto, Mensagem);
  end;

end;

function TFMFUN.MontaChaveAcessoNFe(codUF: Integer; dtEmissao: TDateTime; cnpj: string; modelo, serie, NumeroNF, TpEmis, CodigoNumerico: Integer): string;
var
  emissao: string[10];
  chave, strCodNumerico: string;

begin
  emissao := FormatDateTime('DD/MM/YY', dtEmissao);

  // CodigoNumerico := (2 * StrToInt(FormatDateTime('ddmmyy', dtEcmissao))) + NumeroNF; Esse Código Gera uma Chave mais previsivel...
  strCodNumerico := Copy(FMFUN.enchezero(inttostr(CodigoNumerico), 8), 1, 8);

  chave := inttostr(codUF) + Copy(emissao, 7, 2) + Copy(emissao, 4, 2) + FMFUN.LimpaCNPJ(cnpj) + FMFUN.enchezero(inttostr(modelo), 2) + FMFUN.enchezero(inttostr(serie), 3) +
    FMFUN.enchezero(inttostr(NumeroNF), 9) + FMFUN.enchezero(inttostr(TpEmis), 1) + FMFUN.enchezero(inttostr(CodigoNumerico), 8);
  // [Versao 2.0] Agora com 8 Caracteres para poder incluir o Campo TpEmis Sem alterar o tamanho da Chave = 44...

  ID := FMFUN.Modulo11(chave);
  Result := chave + FMFUN.Modulo11(chave);
end;

procedure TFMFUN.ListaNCM(chamou, ncm: string; cest: boolean);
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

  Fr_localizar.Caption := 'Localizar NCM';
  chamou_form := chamou;
  chamou_pesquisa := 'fr_ncm';
  chamou_cadastro := 'Fr_ncm';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'NCM';
  Fr_localizar.BT_cadastro.Visible := false;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'NCM';
  Campos_combo[1] := 'Descrição';
  Campos_combo[2] := 'CEST';

  for i := 0 to 2 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;

  if cest then
  begin
    Fr_localizar.CBcampos.ItemIndex := Fr_localizar.CBcampos.Items.IndexOf('NCM');

    Fr_localizar.EDlocalizar.Text := ncm;
    Fr_localizar.zzbusca_qualquer.Checked := true;
    Fr_localizar.loc_ncm(Fr_localizar.EDlocalizar.Text);

  end;
  Fr_localizar.ShowModal;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
  Fr_localizar.free;
end;

function TFMFUN.BonificacaoLiberado(cliente, produto, pedido: string; qtd: Integer): boolean;
var
  limite, total: Integer;
  sql_aux: string;
begin
  if pedido <> '' then
    sql_aux := '               V1.NUMDOC <> ' + pedido + ' and ';

  dao.Geral1('SELECT a.COD_CLIENTE, a.COD_PRODUTO, a.LIMITE, ' + '  COALESCE((SELECT ' + '              CAST(SUM(V2.QTD) AS INTEGER) ' + '            from ' + '              VENDAS2 V2 ' +
    '            INNER JOIN VENDAS1 V1 ON V1.NUMDOC = V2.NUMDOC ' + '            where ' + '               V2.COD_PRODUTO = A.COD_PRODUTO and ' + '               V1.COD_CLIENTE = A.COD_CLIENTE and ' +
    sql_aux + '               V1.COD_FOP = 22 ' + '          ),0) AS TOTAL ' + 'FROM CLIENTE_PRODUTO a ' + 'WHERE A.COD_CLIENTE = ' + cliente + ' AND A.COD_PRODUTO = ' + produto);

  limite := dao.q1.fieldbyname('LIMITE').AsInteger;
  total := dao.q1.fieldbyname('TOTAL').AsInteger;

  Result := (total + qtd) <= limite;
end;

function TFMFUN.calcula_custo_total(custo, perc_impostos, perc_ipi, perc_geral, perc_st: real): real;
var
  imposto, ipi, geral, outros, St: real;
begin
  ipi := custo + (custo * (perc_ipi / 100));
  imposto := ipi + (ipi * (perc_impostos / 100));
  geral := imposto + (imposto * (perc_geral / 100));
  St := geral + (geral * (perc_st / 100));
  Result := St;
end;

function TFMFUN.calcula_custo_entrada(custo, perc_impostos, perc_ipi, perc_geral, perc_st: real): real;
var
  imposto, ipi, geral, outros, St: real;
begin
  imposto := custo - (custo * (perc_impostos / 100));
  ipi := imposto + (imposto * (perc_ipi / 100));
  geral := ipi + (ipi * (perc_geral / 100));
  St := geral + (geral * (perc_st / 100));
  Result := St;
end;

function TFMFUN.calcula_preco_venda(custo_total, margem_lucro: real): real;
var
  lucro: real;
begin
  lucro := (custo_total) * (margem_lucro / 100);
  Result := custo_total + lucro;
end;

function TFMFUN.ChecarEmailCliente(cliente, tipo: string): boolean;
var
  ajustar_cliente: boolean;
  mensagem: string;
begin
  ajustar_cliente := false;
  dao.Geral4('SELECT EMAIL, EMAIL_END_NFE, NFE_EMAIL FROM CLIENTE WHERE COD_CLIENTE = ' + cliente);
  if dao.Q4.fieldbyname('EMAIL').IsNull then
  begin
    showmessage('Email do Cliente não Definido no Cadastro de Clientes!');
    ajustar_cliente := true;
  end;

  if dao.Q4.fieldbyname('EMAIL_END_NFE').IsNull then
  begin
    showmessage('Email do Cliente para NFe não Definido no Cadastro de Clientes!');
    ajustar_cliente := true;
  end;

  if dao.Q4.fieldbyname('NFE_EMAIL').AsString <> 'S' then
  begin
    showmessage('Opção de Envio da NFe no Cadastro de Clientes não Definida!');
    ajustar_cliente := true;
  end;

  if ajustar_cliente = false then
  begin
    if tipo = 'pedido' then
      mensagem := 'Email de Pedido à ser enviado para: ' + dao.Q4.fieldbyname('EMAIL').AsString + '. Desejas Alterar?'
    else
      mensagem := 'Email de NFe à ser enviado para: ' + dao.Q4.fieldbyname('EMAIL_END_NFE').AsString + '. Desejas Alterar?';

    if MessageDlg(mensagem, mtConfirmation, [mbyes, mbno], 0) = mryes then
      ajustar_cliente := true;
  end;

  if ajustar_cliente then
  begin
    try
      Application.CreateForm(TFr_Cliente, Fr_Cliente);
      Fr_Cliente.dados_incompletos := true;
      Fr_Cliente.cliente := cliente;
      Fr_Cliente.ShowModal;
    finally
      Fr_Cliente.free;
    end;
    exit;
  end;
  Result := not ajustar_cliente;
end;



function TFMFUN.ValidarQuantidadeMaxima(produto: string; quantidade: Double): boolean;
begin
  if Tipo_usuario = '9' then
  begin
    Result := true;
    exit;
  end;

  dao.Geral4('SELECT case when coalesce(qtd_estoque_max, 0) - qtd_estoque > 0 then coalesce(qtd_estoque_max, 0) - qtd_estoque else 0 end quantidade_sugerida, coalesce(qtd_estoque_max, 0) as qtd_estoque_max  FROM PRODUTO WHERE COD_PRODUTO = ' + produto);
  if (quantidade > dao.Q4.fieldbyname('quantidade_sugerida').AsFloat) and (dao.Q4.fieldbyname('qtd_estoque_max').AsFloat > 0) then
  begin
    MessageDlg('A quantidade não pode ser maior do que ' + dao.Q4.fieldbyname('quantidade_sugerida').AsString, mtWarning, [mbOK], 0);
    Result := FMFUN.LiberarProcesso;
  end
  else
    Result := true

end;

function TFMFUN.ValidarQuantidade(produto: string; quantidade: Double): boolean;
begin
  dao.Geral4('SELECT QTD_MULTIPLA FROM PRODUTO WHERE COD_PRODUTO = ' + produto);
  if quantidade < dao.Q4.fieldbyname('QTD_MULTIPLA').AsFloat then
  begin
    showmessage('A quantidade não pode ser menor do que ' + dao.Q4.fieldbyname('QTD_MULTIPLA').AsString);
    Result := false;
  end
  else
    Result := true
end;

function TFMFUN.ValidaData(Data: string): boolean;
begin
  try
    strtodate(Data);
    Result := true;
  except
    Result := false;
  end;
end;

function TFMFUN.VerificaFaturaVencida(cod_cliente: string; aviso: boolean): boolean;
var
  i: Integer;
  procedure MostraFatura;
  begin
    Result := true;
    Application.CreateForm(TFr_status_financeiro_cliente, Fr_status_financeiro_cliente);
    dao.q1.First;
    i := 1;
    while not(dao.q1.Eof) do
    begin
      Fr_status_financeiro_cliente.SG_financeiro.cells[0, i] := dao.q1.fieldbyname('titulo').AsString;
      Fr_status_financeiro_cliente.SG_financeiro.cells[1, i] := dao.q1.fieldbyname('sequencia').AsString;
      Fr_status_financeiro_cliente.SG_financeiro.cells[2, i] := FormatDateTime('dd/mm/yyyy', dao.q1.fieldbyname('dtaven').AsDateTime);
      Fr_status_financeiro_cliente.SG_financeiro.cells[3, i] := FormatFloat('##,###0.00', dao.q1.fieldbyname('valor').AsFloat);
      dao.q1.Next;
      i := i + 1;
      Fr_status_financeiro_cliente.SG_financeiro.AddRow;
    end;
    Fr_status_financeiro_cliente.ShowModal;
  end;

begin
  dao.Geral1('Select ' + '  CL.NOM_CLIENTE, ' + '  CR1.titulo, ' + '  CR1.dtaven, ' + '  CR1.valor, ' + '  CR1.sequencia, ' + '  CR1.dtarec, ' + '  CR1.nr_documento ' + 'From ' + '  cr1 ' +
    'INNER JOIN CLIENTE CL ON (CL.COD_CLIENTE = CR1.COD_CLIENTE) ' + 'Where (CR1.cod_cliente=' + QuotedStr(cod_cliente) + ') and ' + '(CR1.dtaven+5 < current_date) and (CR1.dtarec is null) and ' +
    'cr1.cod_fop <> 7 ');

  if dao.q1.RecordCount > 0 then
  begin
    if cod_cliente <> '3217' then
      Result := true;

    if aviso then
    begin
      if MessageDlg('O Sistema encontrou ' + inttostr(dao.q1.RecordCount) + ' Titulo(s) em atraso do Cliente ' + dao.q1.fieldbyname('NOM_CLIENTE').AsString + #13 +
        'Deseja Visualizar a Descrição dos Titulos', mtConfirmation, [mbyes, mbno], 0) = mryes then
        MostraFatura;
    end
    else
      MostraFatura;
  end
  else
    Result := false;
end;

procedure TFMFUN.GraficoCusto(produto: string);
begin
  try
    Application.CreateForm(Tfm_produto_variacao, fm_produto_variacao);
    fm_produto_variacao.produto := produto;
    fm_produto_variacao.ShowModal;
  finally
    fm_produto_variacao.free;
  end;
end;

function TFMFUN.ValidaDadosTransportadora(transportadora: string): boolean;
var
  sql: string;
begin
  sql := 'SELECT ' + '  CASE WHEN a.NOME IS NULL THEN ''F'' ELSE ''T'' END AS RAZAO_SOCIAL_OK, ' + '  a.NOME, ' + '  CASE WHEN a.ENDERECO IS NULL THEN ''F'' ELSE ''T'' END AS ENDERECO_OK, ' +
    '  CASE WHEN a.BAIRRO IS NULL THEN ''F'' ELSE ''T'' END AS BAIRRO_OK, ' + '  CASE WHEN a.CEP IS NULL THEN ''F'' ELSE ''T'' END AS CEP_OK, ' + '  a.CEP, ' +
    '  CASE WHEN a.COD_CIDADE IS NULL THEN ''F'' ELSE ''T'' END AS COD_CIDADE_OK, ' + '  CASE WHEN A.TIP_PESSOA = ''J'' AND A.CNPJ IS NULL THEN ''F'' ELSE ''T'' END AS CNPJ_OK, ' +
    '  CASE WHEN A.TIP_PESSOA = ''F'' AND A.CPF IS NULL THEN ''F'' ELSE ''T'' END AS CPF_OK, ' + '  CASE WHEN a.fone IS NULL THEN ''F'' ELSE ''T'' END AS TELEFONE_OK, ' + '  a.fone AS TELEFONE, ' +
    '  CASE WHEN A.TIP_PESSOA = ''J'' AND a.IE IS NULL THEN ''F'' ELSE ''T'' END AS IE_OK ' + 'FROM TRANSPORTADORA a        ' + 'WHERE A.COD_TRANSPORTADORA =' + transportadora;

  dao.Geral4(sql);

  if dao.Q4.fieldbyname('RAZAO_SOCIAL_OK').AsString = 'F' then
  begin
    Result := false;
    exit;
  end;

  if pos(' ', dao.Q4.fieldbyname('NOME').AsString) = 1 then
  begin
    Result := false;
    exit;
  end;

  if dao.Q4.fieldbyname('ENDERECO_OK').AsString = 'F' then
  begin
    Result := false;
    exit;
  end;

  if dao.Q4.fieldbyname('BAIRRO_OK').AsString = 'F' then
  begin
    Result := false;
    exit;
  end;

  if dao.Q4.fieldbyname('CEP_OK').AsString = 'F' then
  begin
    Result := false;
    exit;
  end;

  if pos('.', dao.Q4.fieldbyname('CEP').AsString) <> 0 then
  begin
    Result := false;
    exit;
  end;

  if length(dao.Q4.fieldbyname('CEP').AsString) <> 9 then
  begin
    Result := false;
    exit;
  end;

  if dao.Q4.fieldbyname('COD_CIDADE_OK').AsString = 'F' then
  begin
    Result := false;
    exit;
  end;

  if dao.Q4.fieldbyname('CNPJ_OK').AsString = 'F' then
  begin
    Result := false;
    exit;
  end;

  if dao.Q4.fieldbyname('CPF_OK').AsString = 'F' then
  begin
    Result := false;
    exit;
  end;

  if dao.Q4.fieldbyname('TELEFONE_OK').AsString = 'F' then
  begin
    Result := false;
    exit;
  end;

  if pos(' ', dao.Q4.fieldbyname('TELEFONE').AsString) <> 0 then
  begin
    Result := false;
    exit;
  end;

  if dao.Q4.fieldbyname('IE_OK').AsString = 'F' then
  begin
    Result := false;
    exit;
  end;

  Result := true;
end;

function TFMFUN.ValidaDadosCliente(cliente: string): boolean;
var
  sql: string;
begin
  sql := 'SELECT ' + '  CASE WHEN a.NOM_CLIENTE IS NULL THEN ''F'' ELSE ''T'' END AS RAZAO_SOCIAL_OK, ' + '  a.NOM_CLIENTE, ' +
    '  CASE WHEN a.ENDERECO IS NULL THEN ''F'' ELSE ''T'' END AS ENDERECO_OK, ' + '  CASE WHEN a.BAIRRO IS NULL THEN ''F'' ELSE ''T'' END AS BAIRRO_OK, ' +
    '  CASE WHEN a.CEP IS NULL THEN ''F'' ELSE ''T'' END AS CEP_OK, ' + '  a.CEP, ' + '  CASE WHEN a.COD_CIDADE IS NULL THEN ''F'' ELSE ''T'' END AS COD_CIDADE_OK, ' +
    '  CASE WHEN A.TIP_PESSOA = ''J'' THEN CASE WHEN A.CNPJ IS NULL THEN ''F'' ELSE ''T'' END ELSE CASE WHEN A.CPF IS NULL THEN ''F'' ELSE ''T'' END END AS CNPJ_CPF_OK, ' +
    '  CASE WHEN a.NR_ENDERECO IS NULL THEN ''F'' ELSE ''T'' END AS NR_ENDERECO_OK, ' + '  CASE WHEN a.TELEFONE IS NULL THEN ''F'' ELSE ''T'' END AS TELEFONE_OK, ' + '  a.TELEFONE, ' +
    '  CASE WHEN A.TIP_PESSOA = ''J'' THEN CASE WHEN a.IE IS NULL THEN ''F'' ELSE ''T'' END ELSE CASE WHEN A.RG IS NULL THEN ''F'' ELSE ''T'' END END AS IE_RG_OK ' + 'FROM CLIENTE a        ' +
    'WHERE A.COD_CLIENTE =' + cliente;

  dao.Geral4(sql);

  if dao.Q4.fieldbyname('RAZAO_SOCIAL_OK').AsString = 'F' then
  begin
    Result := false;
    exit;
  end;

  if pos(' ', dao.Q4.fieldbyname('NOM_CLIENTE').AsString) = 1 then
  begin
    Result := false;
    exit;
  end;

  if dao.Q4.fieldbyname('ENDERECO_OK').AsString = 'F' then
  begin
    Result := false;
    exit;
  end;

  if dao.Q4.fieldbyname('BAIRRO_OK').AsString = 'F' then
  begin
    Result := false;
    exit;
  end;

  if dao.Q4.fieldbyname('CEP_OK').AsString = 'F' then
  begin
    Result := false;
    exit;
  end;

  if pos('.', dao.Q4.fieldbyname('CEP').AsString) <> 0 then
  begin
    Result := false;
    exit;
  end;

  if length(dao.Q4.fieldbyname('CEP').AsString) <> 9 then
  begin
    Result := false;
    exit;
  end;

  if dao.Q4.fieldbyname('COD_CIDADE_OK').AsString = 'F' then
  begin
    Result := false;
    exit;
  end;

  if dao.Q4.fieldbyname('CNPJ_CPF_OK').AsString = 'F' then
  begin
    Result := false;
    exit;
  end;

  if dao.Q4.fieldbyname('NR_ENDERECO_OK').AsString = 'F' then
  begin
    Result := false;
    exit;
  end;

  if dao.Q4.fieldbyname('TELEFONE_OK').AsString = 'F' then
  begin
    Result := false;
    exit;
  end;

  if pos(' ', dao.Q4.fieldbyname('TELEFONE').AsString) <> 0 then
  begin
    Result := false;
    exit;
  end;

  if dao.Q4.fieldbyname('IE_RG_OK').AsString = 'F' then
  begin
    Result := false;
    exit;
  end;

  Result := true;
end;

{$ENDIF}

function TFMFUN.GetNumeroProcessos(const NomeExe: string): Integer;
var
  Proc: TProcessEntry32;
  Snap: THandle;
begin
  Result := 0;
  Snap := CreateToolHelp32SnapShot(TH32CS_SNAPPROCESS, 0);
  Proc.dwSize := SizeOf(TProcessEntry32);
  Process32First(Snap, Proc);
  repeat
    // foi colocado o copy por causa de um bug do Windows 2000 que trunca o nome do processo
    if UpperCase(Copy(ExtractFileName(Proc.szExeFile), 1, 15)) = Copy(UpperCase(NomeExe), 1, 15) then
      Inc(Result);
  until (not Process32Next(Snap, Proc));
end;

function TFMFUN.NomeMaquina: string;

// Retorna o nome do computador
var
  lpBuffer: PChar;
  nSize: DWord;
const
  Buff_Size = MAX_COMPUTERNAME_LENGTH + 1;
begin
  try
    nSize := Buff_Size;
    lpBuffer := StrAlloc(Buff_Size);
    GetComputerName(lpBuffer, nSize);
    Result := string(lpBuffer);
    StrDispose(lpBuffer);
  except
    Result := '';
  end;
end;

function TFMFUN.PegarIP: string;
var
  WSAData: TWSAData;
  HostEnt: PHostEnt;
  Name: string;
begin
  WSAStartup(2, WSAData);
  SetLength(Name, 255);
  Gethostname(PAnsiChar(Name), 255);
  SetLength(Name, StrLen(PChar(Name)));
  HostEnt := gethostbyname(PAnsiChar(Name));
  with HostEnt^ do
    Result := Format('%d.%d.%d.%d', [Byte(h_addr^[0]), Byte(h_addr^[1]), Byte(h_addr^[2]), Byte(h_addr^[3])]);
  WSACleanup;
end;

function TFMFUN.UpperCase(St: string): string;
var
  a: Integer;
begin
  for a := 1 to length(St) do
    if (St[a] in ['a' .. 'z']) or (St[a] in ['à' .. 'ý']) then
      Dec(St[a], 32);
  Result := St;
end;

function TFMFUN.LowerCase(St: string): string;
var
  a: Integer;
begin
  for a := 1 to length(St) do
    if (St[a] in ['A' .. 'Z']) or (St[a] in ['À' .. 'Ý']) then
      Inc(St[a], 32);
  Result := St;
end;

function TFMFUN.AnsiToAscii(str: string; aspas: boolean = true): string;
var
  i: Integer;
begin
  for i := 1 to length(str) do
  begin
    case str[i] of
      '''':
        if aspas then
          str[i] := ' ';
      '"':
        if aspas then
          str[i] := ' ';
      '°':
        str[i] := 'o';
      'º':
        str[i] := 'o';
      // ',': str[i] := '.';
      'á':
        str[i] := 'a';
      'é':
        str[i] := 'e';
      'í':
        str[i] := 'i';
      'ó':
        str[i] := 'o';
      'ú':
        str[i] := 'u';
      'à':
        str[i] := 'a';
      'è':
        str[i] := 'e';
      'ì':
        str[i] := 'i';
      'ò':
        str[i] := 'o';
      'ù':
        str[i] := 'u';
      'â':
        str[i] := 'a';
      'ê':
        str[i] := 'e';
      'î':
        str[i] := 'i';
      'ô':
        str[i] := 'o';
      'û':
        str[i] := 'u';
      'ä':
        str[i] := 'a';
      'ë':
        str[i] := 'e';
      'ï':
        str[i] := 'i';
      'ö':
        str[i] := 'o';
      'ü':
        str[i] := 'u';
      'ã':
        str[i] := 'a';
      'õ':
        str[i] := 'o';
      'ñ':
        str[i] := 'n';
      'ç':
        str[i] := 'c';
      'Á':
        str[i] := 'A';
      'É':
        str[i] := 'E';
      'Í':
        str[i] := 'I';
      'Ó':
        str[i] := 'O';
      'Ú':
        str[i] := 'U';
      'À':
        str[i] := 'A';
      'È':
        str[i] := 'E';
      'Ì':
        str[i] := 'I';
      'Ò':
        str[i] := 'O';
      'Ù':
        str[i] := 'U';
      'Â':
        str[i] := 'A';
      'Ê':
        str[i] := 'E';
      'Î':
        str[i] := 'I';
      'Ô':
        str[i] := 'O';
      'Û':
        str[i] := 'U';
      'Ä':
        str[i] := 'A';
      'Ë':
        str[i] := 'E';
      'Ï':
        str[i] := 'I';
      'Ö':
        str[i] := 'O';
      'Ü':
        str[i] := 'U';
      'Ã':
        str[i] := 'A';
      'Õ':
        str[i] := 'O';
      'Ñ':
        str[i] := 'N';
      'Ç':
        str[i] := 'C';
      // '&': str[i] := 'E';
    end;
  end;
  Result := str;
end;

procedure TFMFUN.ImprimeEtiqueta(codigo, descricao, qtd_emb, unidade, codigo_barra: string; tipo: Integer; mostra_unidade, mostra_empresa: boolean);
const
  colunas = 27;
var
  f: TextFile;
  i, dvi, tam_descricao: Integer;
  imp_primeira: boolean;
  Arquivo, dv, pf, descricao1, descricao2, descricao3: string;
begin
 {  arquivo := ExtractFilePath(Application.ExeName)+'etiqueta.txt';
   AssignFile(F, arquivo);
  }
{$IFDEF ORBI}
  AssignFile(f, caminho_imp_cod_barras);
{$ENDIF}
{$IFDEF ORBICOLLETOR}
  AssignFile(f, frpri.caminho_imp_cod_barras);
{$ENDIF}

  if codigo_barra = '' then
    codigo_barra := GravaCodeBar(codigo, tipo);
  // FileMode := 0;
  Rewrite(f);
  Writeln(f, ' ');
  Writeln(f, 'O');
  Writeln(f, 'OD');
  Writeln(f, 'N');
  Writeln(f, 'D7');
  Writeln(f, 'S2');
  Writeln(f, 'ZT');
  // Writeln(f, 'Q560,24');
  // WriteLn(f, 'Q403,22');
  Writeln(f, 'Q407,29');
  Writeln(f, 'q784');
  tam_descricao := length(AnsiToAscii(codigo + '-' + descricao));
  if tam_descricao > colunas then
  begin
    descricao  := Copy(codigo + '-' + descricao, 1, 100);
    descricao1 := Copy(descricao, 1, colunas);
    descricao1 := ReverseString(descricao1);
    descricao1 := Copy(descricao1, pos(' ', descricao1) + 1, colunas);
    descricao1 := ReverseString(descricao1);

    descricao2 := trim(Copy(descricao, length(descricao1) + 2, 100));
    descricao2 := Copy(descricao2, 1, colunas);
    descricao2 := ReverseString(descricao2);
    descricao2 := Copy(descricao2, pos(' ', descricao2) + 1, colunas);
    descricao2 := ReverseString(descricao2);

    descricao3 := trim(Copy(descricao, (length(descricao1) + length(descricao2) + 2), 40));

    Writeln(f, 'A25,15,0,3,2,2,N,"' + AnsiToAscii(descricao1) + '"');
    Writeln(f, 'A25,65,0,3,2,2,N,"' + AnsiToAscii(descricao2) + '"');

    if mostra_unidade then
      Writeln(f, 'A25,115,0,3,2,2,N,"' + AnsiToAscii(descricao3) + ' - ' + qtd_emb + '/' + unidade + '"');

    Writeln(f, 'B25,165,0,E30,4,8,150,B,"' + codigo_barra + '"');
    if mostra_empresa then
    begin
      case tipo of
        0:
          begin
            //Writeln(f, 'A25,280,0,3,3,2,N,"PLASFAN"');
            Writeln(f, 'A25,350,0,4,1,1,R,"www.plasfan.ind.br"');
            Writeln(f, 'A325,350,0,2,1,2,N,"(47)3346-2052"');
          end;
        1:
          begin
            //Writeln(f, 'A25,295,0,3,3,2,N,"M7 EXP"');
            Writeln(f, 'A325,350,0,2,1,2,N,"(47)3346-2052"');
            Writeln(f, 'A25,350,0,4,1,1,R,"www.m7expositores.com.br"');
          end;
      end;
    end;
  end
  else
  begin
    Writeln(f, 'A25,15,0,3,2,2,N,"' + AnsiToAscii(codigo + '-' + descricao) + '"');
    if mostra_unidade then
      Writeln(f, 'A25,65,0,3,2,2,N,"' + qtd_emb + '/' + unidade + '"');
    Writeln(f, 'B25,165,0,E30,4,8,150,B,"' + codigo_barra + '"');
    if mostra_empresa then
    begin
      case tipo of
        0:
          begin
          //  Writeln(f, 'A25,280,0,3,3,2,N,"PLASFAN"');
            Writeln(f, 'A25,350,0,4,1,1,R,"www.plasfan.ind.br"');
            Writeln(f, 'A325,350,0,2,1,2,N,"(47)3346-2052"');
          end;
        1:
          begin
            Writeln(f, 'A325,350,0,2,1,2,N,"(47)3346-2052"');
            Writeln(f, 'A25,350,0,4,1,1,R,"www.m7expositores.com.br"');

            {Writeln(f, 'A25,295,0,3,3,2,N,"M7 EXP"');
            Writeln(f, 'A325,331,0,2,1,2,N,"(47)3346-2052"');
            Writeln(f, 'A25,330,0,4,1,1,R,"www.m7expositores.com.br"'); }

          end;
      end;
    end;
  end;
  Writeln(f, 'P1');

  Sleep(2000);
  CloseFile(f);

  (*

 A25,15,0,3,2,2,N,"2922-ADAPTADOR TORNEIRA 1/2"
A25,75,0,3,2,2,N,"0/PC"
B25,120,0,E30,4,8,150,B,"7899826501524"
A25,330,0,4,1,1,R,"www.plasfan.ind.br"
A325,331,0,2,1,2,N,"(47)3346-2052"



    {$IFDEF ORBI}
    WinExec(PAnsiChar('print /d:'+caminho_imp_cod_barras+' '+arquivo), SW_HIDE);
    {$ENDIF}

    {$IFDEF ORBICOLLETOR}
    WinExec(PAnsiChar('print /d:'+frpri.caminho_imp_cod_barras+' '+arquivo),SW_HIDE);
    {$ENDIF}
  *)

end;
{$IFNDEF ORBISELLER}

function TFMFUN.GravaCodeBar(codigo: string; tipo: Integer): string;
var
  dv, pf: string;
begin
  { dao.Geral1('Select codigo_barras from configuracao ');
    if dao.q1.FieldByName('codigo_barras').AsString <> 'S' then
    exit; }

  if length(trim(codigo)) = 0 then
    exit;

  case tipo of
    0: // PLASFAN
      begin
        if strtoint(codigo) < 2000 then
        begin
          if length(trim(codigo)) < 4 then
            if length(trim(codigo)) < 2 then
              pf := '789843776' + '00' + codigo
            else if length(trim(codigo)) < 3 then
              pf := '789843776' + '0' + codigo
            else
              pf := '789843776' + codigo
          else
            pf := '789843777' + Copy(codigo, 2, 3);
        end
        else
          pf := '78996544' + enchezero(codigo, 4);
      end;
    1: // M7
      begin
        pf := '78998265' + enchezero(codigo, 4);
      end;
  end;

  dv := CalculaDigEAN13(pf);

  Result := pf + dv;

  dao.Exec_sql.sql.Clear;
  dao.Exec_sql.sql.Add('UPDATE PRODUTO SET CODIGO_BARRA = ' + QuotedStr(pf + dv) + ' WHERE COD_PRODUTO = ' + codigo);
  dao.Exec_sql.ExecSQL;

end;
{$ENDIF}

function TFMFUN.CalculaDigEAN13(Cod: string): string;
  function Par(Cod: Integer): boolean;
  begin
    Result := Cod mod 2 = 0;
  end;

var
  i, SomaPar, SomaImpar: Integer;
begin
  SomaPar := 0;
  SomaImpar := 0;
  for i := 1 to length(Cod) do
    if Par(i) then
      SomaPar := SomaPar + strtoint(Cod[i])
    else
      SomaImpar := SomaImpar + strtoint(Cod[i]);
  SomaPar := SomaPar * 3;
  i := 0;
  while i < (SomaPar + SomaImpar) do
    Inc(i, 10);
  Result := inttostr(i - (SomaPar + SomaImpar));
end;

function TFMFUN.Dc_MessageDlg(Msg: string; AType: TMsgDlgType; AButtons: TMsgDlgButtons; IndiceHelp: LongInt; DefButton: TMOdalResult = mrNone; Portugues: boolean = true): Word;
var
  i: Integer;
  mensagem: TForm;
begin
  mensagem := CreateMessageDialog(Msg, AType, AButtons);
  mensagem.HelpContext := IndiceHelp;
  with mensagem do
  begin
    for i := 0 to ComponentCount - 1 do
    begin
      if (Components[i] is TButton) then
      begin
        if (TButton(Components[i]).ModalResult = DefButton) then
        begin
          ActiveControl := TWincontrol(Components[i]);
        end;
      end;
    end;
    if Portugues then
    begin
      if AType = mtConfirmation then
        Caption := 'Confirmação'
      else if AType = mtWarning then
        Caption := 'Aviso'
      else if AType = mtError then
        Caption := 'Erro'
      else if AType = mtInformation then
        Caption := 'Informação';
    end;
  end;
  if Portugues then
  begin
    TButton(mensagem.FindComponent('YES')).Caption := '&Sim';
    TButton(mensagem.FindComponent('NO')).Caption := '&Não';
    TButton(mensagem.FindComponent('CANCEL')).Caption := '&Cancelar';
    TButton(mensagem.FindComponent('ABORT')).Caption := '&Abortar';
    TButton(mensagem.FindComponent('RETRY')).Caption := '&Repetir';
    TButton(mensagem.FindComponent('IGNORE')).Caption := '&Ignorar';
    TButton(mensagem.FindComponent('ALL')).Caption := '&Todos';
    TButton(mensagem.FindComponent('HELP')).Caption := 'A&juda';
  end;
  Result := mensagem.ShowModal;
  mensagem.free;
end;

function TFMFUN.cmdAux(wheresql, filtro: string): string;
var
  cmd_aux: string;
  cmd_arr: TStringList;
  x: Integer;
begin
  if pos(';', filtro) > 0 then
  begin
    cmd_arr := TStringList.Create;
    cmd_arr := Explode(filtro, ';');
    cmd_aux := '';
    for x := 0 to cmd_arr.Count - 1 do
    begin
      cmd_aux := cmd_aux + cmd_arr[x] + ', ';
    end;
    cmd_arr.free;
    Result := ' and cast(' + wheresql + ' as integer) in (' + Copy(cmd_aux, 1, length(cmd_aux) - 2) + ')';
    exit;
  end;
  if pos('-', filtro) > 0 then
  begin
    cmd_arr := TStringList.Create;
    cmd_arr := Explode(filtro, '-');
    cmd_aux := '';
    for x := 0 to cmd_arr.Count - 1 do
    begin
      cmd_aux := cmd_aux + cmd_arr[x] + ' and ';
    end;
    cmd_arr.free;
    Result := 'and cast(' + wheresql + ' as integer) between ' + Copy(cmd_aux, 1, length(cmd_aux) - 5);
    exit;
  end;
  Result := 'and cast(' + wheresql + ' as integer) in (' + filtro + ')';
end;

function TFMFUN.InverteData(Data: string): string;
var
  dataarr: TStringList;
begin
  dataarr := TStringList.Create;
  dataarr := Explode(Data, '/');
  Result := dataarr[2] + '/' + dataarr[1] + '/' + dataarr[0];
  dataarr.free;
end;

procedure TFMFUN.ConverterJPegParaBmp(Arquivo: string);
var
  jpeg: TJPegImage;
  Bmp: TBitmap;
begin
  jpeg := TJPegImage.Create;
  try
    jpeg.LoadFromFile(Arquivo);
    Bmp := TBitmap.Create;
    try
      Bmp.Assign(jpeg);
      Bmp.SaveToFile(ChangeFileExt(Arquivo, '.bmp'));
    finally
      Bmp.free;
    end;
  finally
    jpeg.free;
  end;
end;

function TFMFUN.BuscaImpressoraPadrao: string;
var
  Device: array [0 .. cchDeviceName] of char;
  Driver: array [0 .. MAX_PATH] of char;
  DriverPort: string;
  Port: array [0 .. MAX_PATH] of char;
  hDMode: THandle;
begin
  Printer.GetPrinter(@Device, @Driver, @Port, hDMode);
  Result := Device;
end;

function TFMFUN.BuscaAmbienteNFE: TpcnTipoAmbiente;
begin
  dao.Geral5('select NFE_HOMOLOGACAO from configuracao');

  if dao.Q5.fieldbyname('NFE_HOMOLOGACAO').AsString = 'S' then
    Result := taHomologacao
  else
    Result := taProducao;

end;

function TFMFUN.Explode(str, separador: string): TStringList;
var
  p: Integer;
begin
  Result := TStringList.Create;

  p := pos(separador, str);
  while (p > 0) do
  begin
    Result.Add(Copy(str, 1, p - 1));
    Delete(str, 1, p + length(separador) - 1);
    p := pos(separador, str);
  end;

  if (str <> '') then
    Result.Add(str);
end;
{$IFNDEF ORBISELLER}

function TFMFUN.BuscaProxCheque: Integer;
var
  cheque: Integer;
begin
  dao.Geral4('SELECT nextval(''GEN_CHEQUES'') AS INDICE FROM configuracao ');
  cheque := dao.Q4.fieldbyname('INDICE').AsInteger;
  Result := cheque;
end;

procedure TFMFUN.GravaExtratoConta(extrato, conta, tipo: Integer);
begin
  dao.Exec_sql.sql.Clear;
  case tipo of
    1:
      dao.Exec_sql.sql.Add('INSERT INTO EXTRATO_CP1(EXTRATO, CP1) VALUES (' + inttostr(extrato) + ', ' + inttostr(conta) + ')');
    2:
      dao.Exec_sql.sql.Add('INSERT INTO EXTRATO_CR1(EXTRATO, CR1) VALUES (' + inttostr(extrato) + ', ' + inttostr(conta) + ')');
  end;
  dao.Exec_sql.ExecSQL;
end;

function TFMFUN.GravaExtrato(historico, Data, conta, operacao: string; Valor: Double; tipo: Integer): Integer;
var
  extrato: Integer;
  saldo: real;
begin

  dao.Geral3('SELECT coalesce(E.SALDO, 0) AS SALDO_FINAL FROM EXTRATO E WHERE E.ID = (SELECT MAX(E1.ID) FROM EXTRATO E1 WHERE E1.ID_CONTA =' + conta + ') AND E.ID_CONTA = ' + conta);

  if operacao = 'D' then
    saldo := dao.Q3.fieldbyname('SALDO_FINAL').AsFloat - Valor
  else
    saldo := dao.Q3.fieldbyname('SALDO_FINAL').AsFloat + Valor;

  dao.Geral4('SELECT nextval(''GEN_EXTRATO'') AS INDICE FROM configuracao ');
  extrato := dao.Q4.fieldbyname('INDICE').AsInteger;

  dao.Exec_sql.sql.Clear;
  dao.Exec_sql.sql.Add('INSERT INTO EXTRATO (ID, HISTORICO, DATA_MOV, VALOR, ID_CONTA, OPERACAO, SALDO, TIPO) VALUES (' + inttostr(extrato) + ', ' + QuotedStr(historico) + ', ' + Data + ', ' +
    stringreplace(FormatFloat('#########0.00', Valor), ',', '.', [rfReplaceAll]) + ', ' + conta + ', ' + QuotedStr(operacao) + ', ' + stringreplace(FormatFloat('#########0.00', saldo), ',', '.',
    [rfReplaceAll]) + ', ' + inttostr(tipo) + ')');
  dao.Exec_sql.ExecSQL;

  if (Data <> QuotedStr(formatdatetime('dd/mm/yyyy', now))) then
  begin

    dao.cn.Commit;

    //if dao.cn.InTransaction then
      dao.cn.StartTransaction;

    // AtualizarSaldoExtrato(conta);

    dao.cn.Commit;
    //if dao.cn.InTransaction then
      dao.cn.StartTransaction;

  end;

  Result := extrato;
end;

procedure TFMFUN.ExcluirExtratoConta(conta_pagar_receber, operacao: string; Valor: Double);
var
  extrato, conta: string;
  LogText: TStringList;
begin
  LogText := TStringList.Create;

  if operacao = 'C' then
    dao.Geral2('SELECT distinct a.CR1 AS CONTA FROM EXTRATO_CR1 a where a.extrato in (select a1.extrato from extrato_cr1 a1 where a1.CR1 =' + conta_pagar_receber + ')')
  else
    dao.Geral2('SELECT distinct a.CP1 AS CONTA FROM EXTRATO_CP1 a where a.extrato in (select a1.extrato from extrato_cp1 a1 where a1.CP1 =' + conta_pagar_receber + ')');

  try
    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;

    if dao.Q2.IsEmpty then
    begin

      dao.Exec_sql.sql.Clear;

      if operacao = 'C' then
        dao.Exec_sql.sql.Add('UPDATE CR1 SET DTAREC = null, extrato = null, VALOR_RECEBIDO = null WHERE ID = ' + conta_pagar_receber)
      else
        dao.Exec_sql.sql.Add('UPDATE CP1 SET DTAPAG = null, CHEQUE = null, extrato = null, VALOR_PAGO = null WHERE ID = ' + conta_pagar_receber);
      LogText.Add(dao.Exec_sql.sql.Text);
      dao.Exec_sql.ExecSQL;
    end;

    while not dao.Q2.Eof do
    begin
      conta := dao.Q2.fieldbyname('CONTA').AsString;
      dao.Exec_sql.sql.Clear;

      if operacao = 'C' then
        dao.Exec_sql.sql.Add('UPDATE CR1 SET DTAREC = null, extrato = null, VALOR_RECEBIDO = null WHERE ID = ' + conta)
      else
        dao.Exec_sql.sql.Add('UPDATE CP1 SET DTAPAG = null, CHEQUE = null, extrato = null, VALOR_PAGO = null WHERE ID = ' + conta);

      dao.Exec_sql.ExecSQL;
      LogText.Add(dao.Exec_sql.sql.Text);
      dao.Q2.Next;
    end;
    dao.grava_log(LogText.Text, '');
    LogText.free;

    if operacao = 'C' then
      dao.Geral5('SELECT distinct a.EXTRATO FROM EXTRATO_CR1 a where a.extrato in (select a1.extrato from extrato_cr1 a1 where a1.CR1 =' + conta_pagar_receber + ')')
    else
      dao.Geral5('SELECT distinct a.EXTRATO FROM EXTRATO_CP1 a where a.extrato in (select a1.extrato from extrato_cp1 a1 where a1.CP1 =' + conta_pagar_receber + ')');

    while not dao.Q5.Eof do
    begin
      extrato := dao.Q5.fieldbyname('EXTRATO').AsString;
      ExcluirExtrato(extrato, operacao);
      dao.Q5.Next;
    end;

    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;
end;

procedure TFMFUN.AtualizarSaldoExtrato(conta: string);
var
  saldo, saldo_inicial: real;
  operacao: string;
begin
  dao.Geral3('SELECT A.SALDO FROM EXTRATO A WHERE A.ID_CONTA = ' + conta + ' AND A.ID = (SELECT MIN(B.ID) FROM EXTRATO B WHERE B.ID_CONTA = ' + conta + ')');

  saldo_inicial := dao.Q3.fieldbyname('SALDO').AsFloat;

  dao.Geral4('SELECT a.ID, a.DATA_MOV, a.VALOR, a.ID_CONTA, a.OPERACAO, a.SALDO, a.TIPO FROM EXTRATO a ' + 'where a.ID_CONTA = ' + conta +
    ' AND A.ID <> (SELECT MIN(B.ID) FROM EXTRATO B WHERE B.ID_CONTA = ' + conta + ') order by a.DATA_MOV, a.id');

  dao.Q4.First;

  saldo := saldo_inicial;
  while not dao.Q4.Eof do
  begin

    operacao := dao.Q4.fieldbyname('operacao').AsString;
    if operacao = 'D' then
      saldo := saldo - dao.Q4.fieldbyname('valor').AsFloat
    else
      saldo := saldo + dao.Q4.fieldbyname('valor').AsFloat;

    dao.Exec_sql.sql.Clear;
    dao.Exec_sql.sql.Text := 'UPDATE EXTRATO SET SALDO = ' + prepara_valor(floattostr(saldo)) + ' WHERE ID = ' + dao.Q4.fieldbyname('id').AsString;
    dao.Exec_sql.ExecSQL;

    dao.Q4.Next;
  end;
end;

procedure TFMFUN.ExcluirExtrato(extrato, operacao: string);
var
  saldo, Valor: real;
  conta: string;
begin
  dao.Geral3('SELECT ID_CONTA, VALOR FROM EXTRATO WHERE ID = ' + extrato);
  if not dao.Q3.IsEmpty then
  begin

    conta := dao.Q3.fieldbyname('ID_CONTA').AsString;
    Valor := dao.Q3.fieldbyname('VALOR').value;

  // if not dao.cn.InTransaction then dao.cn.StartTransaction;
    dao.Exec_sql.sql.Clear;
    dao.Exec_sql.sql.Add('DELETE FROM EXTRATO WHERE ID = ' + extrato);
    dao.Exec_sql.ExecSQL;
  // dao.cn.commit;

    dao.Exec_sql.sql.Clear;
    if operacao = 'C' then
      dao.Exec_sql.sql.Add('DELETE FROM EXTRATO_CR1 a where a.extrato =' + extrato)
    else
      dao.Exec_sql.sql.Add('DELETE FROM EXTRATO_CP1 a where a.extrato =' + extrato);
    dao.Exec_sql.ExecSQL;
  end;
    // AtualizarSaldoExtrato(conta);

  // if not dao.cn.InTransaction then dao.cn.StartTransaction;

  { dao.Exec_sql.SQL.Clear;

    if operacao = 'D' then
    dao.Exec_sql.SQL.Add('UPDATE EXTRATO SET SALDO = SALDO + ' +
    StringReplace(floattostr(valor), ',', '.', [rfReplaceAll]) +
    ' WHERE ID_CONTA = ' + conta +
    ' AND ID > (SELECT MAX(E1.ID) FROM EXTRATO E1 WHERE E1.ID_CONTA =' + conta
    +
    ')')
    else
    dao.Exec_sql.SQL.Add('UPDATE EXTRATO SET SALDO = SALDO - ' +
    StringReplace(floattostr(valor), ',', '.', [rfReplaceAll]) +
    ' WHERE ID_CONTA = ' + conta +
    ' AND ID > (SELECT MAX(E1.ID) FROM EXTRATO E1 WHERE E1.ID_CONTA =' + conta
    +
    ')');

    dao.Exec_sql.ExecSQL; }

  // dao.cn.commit;
end;

function TFMFUN.ValidaNCM(ncm, cest: string): boolean;
begin
  if ncm = '' then
    exit;
  dao.Geral1('select codigo from ncm where cest = ' + QuotedStr(cest) + ' and codigo = ' + QuotedStr(ncm));
  Result := not dao.q1.IsEmpty;
end;

function TFMFUN.BuscaDescNCM(ncm: string): string;
begin
  if ncm = '' then
    exit;
  dao.Geral1('select descricao from ncm where codigo = ' + QuotedStr(ncm));
  Result := dao.q1.fieldbyname('descricao').AsString;
end;
{$ENDIF}

function TFMFUN.TratarCodigoNCM(codigo: string; tipo: Integer): string;
var
  ncm_text: string;
  tamanho, x: Integer;
begin
  case tipo of
    0:
      begin
        codigo := stringreplace(codigo, '.', '', [rfReplaceAll]);
        tamanho := length(codigo);
        ncm_text := '';
        for x := 1 to tamanho do
        begin
          ncm_text := ncm_text + Copy(codigo, x, 1);
          if ((x mod 2) = 0) and (x >= 4) then
            ncm_text := ncm_text + '.';
        end;
        if (tamanho mod 2) = 0 then
          Result := Copy(ncm_text, 1, length(ncm_text) - 1)
        else
          Result := ncm_text;
      end;
    1:
      Result := stringreplace(codigo, '.', '', [rfReplaceAll]);
  end;
end;

function TFMFUN.enchezero(MDADENV: string; MTAMVAR: Integer): string;
var
  MZEROS: string;
  MTAMREA: Integer; { p/conter o tamnho sem os brancos }
begin
  MZEROS := '00000000000000000000000';
  MTAMREA := length(MDADENV);
  Result := Copy(MZEROS, 1, (MTAMVAR - MTAMREA)) + MDADENV;
end;

function TFMFUN.arredonda(MVLR: real): real;
var
  MVAR: string;
  MVAR1: real;
begin
  MVAR := Format('%15.2f', [MVLR]);
  MVAR1 := MVLR;

  MVAR1 := strtofloat(FloattoStrF(MVAR1, FFfixed, 15, 2));

  Result := MVAR1;

end;

function TFMFUN.DifDias(DataVenc: TDateTime; DataAtual: TDateTime): string;
var
  Data: TDateTime;
  dia, mes, ano: Word;
begin
  if DataAtual < DataVenc then
  begin
    Result := 'A data data atual não pode ser menor que a data inicial';
  end
  else
  begin
    Data := DataAtual - DataVenc;
    DecodeDate(Data, ano, mes, dia);
    Result := floattostr(Data);
  end;
end;

function TFMFUN.DataExtenso(Data: TDateTime): string;
{ Retorna uma data por extenso }
var
  NoDia: Integer;
  DiaDaSemana: array [1 .. 7] of string;
  Meses: array [1 .. 12] of string;
  dia, mes, ano: Word;
begin

  { Dias da Semana }
  DiaDaSemana[1] := 'Domingo';
  DiaDaSemana[2] := 'Segunda-feira';
  DiaDaSemana[3] := 'Terça-feira';
  DiaDaSemana[4] := 'Quarta-feira';
  DiaDaSemana[5] := 'Quinta-feira';
  DiaDaSemana[6] := 'Sexta-feira';
  DiaDaSemana[7] := 'Sabado';
  { Meses do ano }
  Meses[1] := 'Janeiro';
  Meses[2] := 'Fevereiro';
  Meses[3] := 'Marco';
  Meses[4] := 'Abril';
  Meses[5] := 'Maio';
  Meses[6] := 'Junho';
  Meses[7] := 'Julho';
  Meses[8] := 'Agosto';
  Meses[9] := 'Setembro';
  Meses[10] := 'Outubro';
  Meses[11] := 'Novembro';
  Meses[12] := 'Dezembro';
  DecodeDate(Data, ano, mes, dia);
  NoDia := DayOfWeek(Data);
  Result := 'Itajai/SC' + '   ' + inttostr(dia) + '    ' + Meses[mes] + '       ' + inttostr(ano);
end;

// retorna a qtd de dias uteis entre duas datas

function TFMFUN.DifDateUtil(dataini, datafin: string): Integer;
var
  a, b, c: TDateTime;
  ct, S: Integer;
begin
  if strtodate(datafin) < strtodate(dataini) then
  begin
    Result := 0;
    exit;
  end;
  ct := 0;
  S := 1;
  a := strtodate(datafin);
  b := strtodate(dataini);
  if a > b then
  begin
    c := a;
    a := b;
    b := c;
    S := 1;
  end;
  a := a + 1;
  while (DayOfWeek(a) <> 2) and (a <= b) do
  begin
    if DayOfWeek(a) in [2 .. 6] then
    begin
      Inc(ct);
    end;
    a := a + 1;
  end;
  ct := ct + round((5 * int((b - a) / 7)));
  a := a + (7 * int((b - a) / 7));
  while a <= b do
  begin
    if DayOfWeek(a) in [2 .. 6] then
    begin
      Inc(ct);
    end;
    a := a + 1;
  end;
  if ct < 0 then
  begin
    ct := 0;
  end;
  Result := S * ct;
end;

function TFMFUN.IsWeekEnd(dData: TDateTime): boolean;
{ Verifica se uma data informada cai em um final de semana }
begin
  if DayOfWeek(dData) in [1, 7] then
    Result := true
  else
    Result := false;
end;

// FUNÇÃO PARA ARREDONDAR VALORES

function TFMFUN.Arredondar(Valor: Double; Dec: Integer): Double;
var
  Valor1, Numero1, Numero2, Numero3: Double;
begin
  Valor1 := Exp(Ln(10) * (Dec + 1));
  Numero1 := int(Valor * Valor1);
  Numero2 := (Numero1 / 10);
  Numero3 := round(Numero2);
  Result := (Numero3 / (Exp(Ln(10) * Dec)));
end;

// função para valores extenso

function TFMFUN.extenso(Valor: real): string;
var
  Centavos, Centena, Milhar, Milhao, Texto, Msg: string;
const
  Unidades: array [1 .. 9] of string = ('Um', 'Dois', 'Tres', 'Quatro', 'Cinco', 'Seis', 'Sete', 'Oito', 'Nove');
  Dez: array [1 .. 9] of string = ('Onze', 'Doze', 'Treze', 'Quatorze', 'Quinze', 'Dezesseis', 'Dezessete', 'Dezoito', 'Dezenove');
  Dezenas: array [1 .. 9] of string = ('Dez', 'Vinte', 'Trinta', 'Quarenta', 'Cinquenta', 'Sessenta', 'Setenta', 'Oitenta', 'Noventa');
  Centenas: array [1 .. 9] of string = ('Cento', 'Duzentos', 'Trezentos', 'Quatrocentos', 'Quinhentos', 'Seiscentos', 'Setecentos', 'Oitocentos', 'Novecentos');

  function ifs(Expressao: boolean; CasoVerdadeiro, CasoFalso: string): string;
  begin
    if Expressao then
      Result := CasoVerdadeiro
    else
      Result := CasoFalso;
  end;

  function MiniExtenso(trio: string): string;
  var
    unidade, Dezena, Centena: string;
  begin
    unidade := '';
    Dezena := '';
    Centena := '';
    if (trio[2] = '1') and (trio[3] <> '0') then
    begin
      unidade := Dez[strtoint(trio[3])];
      Dezena := '';
    end
    else
    begin
      if trio[2] <> '0' then
        Dezena := Dezenas[strtoint(trio[2])];
      if trio[3] <> '0' then
        unidade := Unidades[strtoint(trio[3])];
    end;
    if (trio[1] = '1') and (unidade = '') and (Dezena = '') then
      Centena := 'cem'
    else if trio[1] <> '0' then
      Centena := Centenas[strtoint(trio[1])]
    else
      Centena := '';
    Result := Centena + ifs((Centena <> '') and ((Dezena <> '') or (unidade <> '')), ' e ', '') + Dezena + ifs((Dezena <> '') and (unidade <> ''), ' e ', '') + unidade;
  end;

begin
  if (Valor > 999999.99) or (Valor < 0) then
  begin
    Msg := 'O valor está fora do intervalo permitido.';
    Msg := Msg + 'O número deve ser maior ou igual a zero e menor que 999.999,99.';
    Msg := Msg + ' Se não for corrigido o número não será escrito por extenso.';
    showmessage(Msg);
    Result := '';
    exit;
  end;
  if Valor = 0 then
  begin
    Result := '';
    exit;
  end;
  Texto := FormatFloat('000000.00', Valor);
  Milhar := MiniExtenso(Copy(Texto, 1, 3));
  Centena := MiniExtenso(Copy(Texto, 4, 3));
  Centavos := MiniExtenso('0' + Copy(Texto, 8, 2));
  Result := Milhar;
  if Milhar <> '' then
    if Copy(Texto, 4, 3) = '000' then
      Result := Result + ' Mil Reais'
    else
      Result := Result + ' Mil ';
  if (((Copy(Texto, 4, 2) = '00') and (Milhar <> '') and (Copy(Texto, 6, 1) <> '0')) or (Centavos = '')) and (Centena <> '') then
    Result := Result + '  ';
  if (Milhar + Centena <> '') then
    Result := Result + Centena;
  if (Milhar = '') and (Copy(Texto, 4, 3) = '001') then
    Result := Result + ' Real'
  else if (Copy(Texto, 4, 3) <> '000') then
    Result := Result + ' Reais';
  if Centavos = '' then
  begin
    Result := Result + '.';
    exit;
  end
  else
  begin
    if Milhar + Centena = '' then
      Result := Centavos
    else
      Result := Result + ' e ' + Centavos;
    if (Copy(Texto, 8, 2) = '01') and (Centavos <> '') then
      Result := Result + ' Centavo.'
    else
      Result := Result + ' Centavos.';
  end;
end;

function TFMFUN.CkData(const S: string): boolean;
begin
  try
    strtodate(S);
    Result := true;
  except
    Result := false;
  end;
end;

function TFMFUN.DataExtenso1(Data: TDateTime): string;
{ Retorna uma data por extenso }
var
  NoDia: Integer;
  DiaDaSemana: array [1 .. 7] of string;
  Meses: array [1 .. 12] of string;
  dia, mes, ano: Word;
begin

  { Dias da Semana }
  DiaDaSemana[1] := 'Domingo';
  DiaDaSemana[2] := 'Segunda-feira';
  DiaDaSemana[3] := 'Terça-feira';
  DiaDaSemana[4] := 'Quarta-feira';
  DiaDaSemana[5] := 'Quinta-feira';
  DiaDaSemana[6] := 'Sexta-feira';
  DiaDaSemana[7] := 'Sabado';
  { Meses do ano }
  Meses[1] := 'Janeiro';
  Meses[2] := 'Fevereiro';
  Meses[3] := 'Marco';
  Meses[4] := 'Abril';
  Meses[5] := 'Maio';
  Meses[6] := 'Junho';
  Meses[7] := 'Julho';
  Meses[8] := 'Agosto';
  Meses[9] := 'Setembro';
  Meses[10] := 'Outubro';
  Meses[11] := 'Novembro';
  Meses[12] := 'Dezembro';
  DecodeDate(Data, ano, mes, dia);
  NoDia := DayOfWeek(Data);
  Result := inttostr(dia) + '     ' + Meses[mes] + '       ' + inttostr(ano);
end;

// converter hexadecimal para inteiro

function TFMFUN.HexToInt(Hex: string): Integer;
begin
  Result := strtoint('$' + Hex);
end;
// Ela só pega o hexadecimal, adiciona o caracter '$' e converte para inteiro!

function TFMFUN.BuscaTroca(Text, Busca, Troca: string): string;
{ Substitui um caractere dentro da string }
var
  n: Integer;
begin
  for n := 1 to length(Text) do
  begin
    if Copy(Text, n, 1) = Busca then
    begin
      Delete(Text, n, 1);
      Insert(Troca, Text, n);
    end;
  end;
  Result := Text;
end;

{ Inscrições __________________________________ }

function TFMFUN.Inscricao(Inscricao, tipo: string): boolean;
var

  Contador: ShortInt;
  Casos: ShortInt;
  Digitos: ShortInt;

  Tabela_1: string;
  Tabela_2: string;
  Tabela_3: string;

  Base_1: string;
  Base_2: string;
  Base_3: string;

  Valor_1: ShortInt;

  Soma_1: Integer;
  Soma_2: Integer;

  Erro_1: ShortInt;
  Erro_2: ShortInt;
  Erro_3: ShortInt;

  Posicao_1: string;
  Posicao_2: string;

  Tabela: string;
  Rotina: string;
  Modulo: ShortInt;
  Peso: string;

  Digito: ShortInt;

  Resultado: string;
  Retorno: boolean;

begin

  try

    Tabela_1 := ' ';
    Tabela_2 := ' ';
    Tabela_3 := ' ';

    { }{ }
    { Valores possiveis para os digitos (j) }
    { }
    { 0 a 9 = Somente o digito indicado. }
    { N = Numeros 0 1 2 3 4 5 6 7 8 ou 9 }
    { A = Numeros 1 2 3 4 5 6 7 8 ou 9 }
    { B = Numeros 0 3 5 7 ou 8 }
    { C = Numeros 4 ou 7 }
    { D = Numeros 3 ou 4 }
    { E = Numeros 0 ou 8 }
    { F = Numeros 0 1 ou 5 }
    { G = Numeros 1 7 8 ou 9 }
    { H = Numeros 0 1 2 ou 3 }
    { I = Numeros 0 1 2 3 ou 4 }
    { J = Numeros 0 ou 9 }
    { K = Numeros 1 2 3 ou 9 }
    { }
    { -------------------------------------------------------- }
    { }
    { Valores possiveis para as rotinas (d) e (g) }
    { }
    { A a E = Somente a Letra indicada. }
    { 0 = B e D }
    { 1 = C e E }
    { 2 = A e E }
    { }
    { -------------------------------------------------------- }
    { }
    { C T F R M P R M P }
    { A A A O O E O O E }
    { S M T T D S T D S }
    { }
    { a b c d e f g h i jjjjjjjjjjjjjj }
    { 0000000001111111111222222222233333333 }
    { 1234567890123456789012345678901234567 }

    if tipo = 'AC' then
      Tabela_1 := '1.09.0.E.11.01. . . . 01NNNNNNX.14.00';
    if tipo = 'AC' then
      Tabela_2 := '2.13.0.E.11.02.E.11.01. 01NNNNNNNNNXY.13.14';
    if tipo = 'AL' then
      Tabela_1 := '1.09.0.0.11.01. . . . 24BNNNNNX.14.00';
    if tipo = 'AP' then
      Tabela_1 := '1.09.0.1.11.01. . . . 03NNNNNNX.14.00';
    if tipo = 'AP' then
      Tabela_2 := '2.09.1.1.11.01. . . . 03NNNNNNX.14.00';
    if tipo = 'AP' then
      Tabela_3 := '3.09.0.E.11.01. . . . 03NNNNNNX.14.00';
    if tipo = 'AM' then
      Tabela_1 := '1.09.0.E.11.01. . . . 0CNNNNNNX.14.00';
    if tipo = 'BA' then
      Tabela_1 := '1.08.0.E.10.02.E.10.03. NNNNNNYX.14.13';
    if tipo = 'BA' then
      Tabela_2 := '2.08.0.E.11.02.E.11.03. NNNNNNYX.14.13';
    if tipo = 'CE' then
      Tabela_1 := '1.09.0.E.11.01. . . . 0NNNNNNNX.14.13';
    if tipo = 'DF' then
      Tabela_1 := '1.13.0.E.11.02.E.11.01. 07DNNNNNNNNXY.13.14';
    if tipo = 'ES' then
      Tabela_1 := '1.09.0.E.11.01. . . . 0ENNNNNNX.14.00';
    if tipo = 'GO' then
      Tabela_1 := '1.09.1.E.11.01. . . . 1FNNNNNNX.14.00';
    if tipo = 'GO' then
      Tabela_2 := '2.09.0.E.11.01. . . . 1FNNNNNNX.14.00';
    if tipo = 'MA' then
      Tabela_1 := '1.09.0.E.11.01. . . . 12NNNNNNX.14.00';
    if tipo = 'MT' then
      Tabela_1 := '1.11.0.E.11.01. . . . NNNNNNNNNNX.14.00';
    if tipo = 'MS' then
      Tabela_1 := '1.09.0.E.11.01. . . . 28NNNNNNX.14.00';
    if tipo = 'MG' then
      Tabela_1 := '1.13.0.2.10.10.E.11.11. NNNNNNNNNNNXY.13.14';
    if tipo = 'PA' then
      Tabela_1 := '1.09.0.E.11.01. . . . 15NNNNNNX.14.00';
    if tipo = 'PB' then
      Tabela_1 := '1.09.0.E.11.01. . . . 16NNNNNNX.14.00';
    if tipo = 'PR' then
      Tabela_1 := '1.10.0.E.11.09.E.11.08. NNNNNNNNXY.13.14';
    if tipo = 'PE' then
      Tabela_1 := '1.14.1.E.11.07. . . .18ANNNNNNNNNNX.14.00';
    if tipo = 'PI' then
      Tabela_1 := '1.09.0.E.11.01. . . . 19NNNNNNX.14.00';
    if tipo = 'RJ' then
      Tabela_1 := '1.08.0.E.11.08. . . . GNNNNNNX.14.00';
    if tipo = 'RN' then
      Tabela_1 := '1.09.0.0.11.01. . . . 20HNNNNNX.14.00';
    if tipo = 'RS' then
      Tabela_1 := '1.10.0.E.11.01. . . . INNNNNNNNX.14.00';
    if tipo = 'RO' then
      Tabela_1 := '1.09.1.E.11.04. . . . ANNNNNNNX.14.00';
    if tipo = 'RO' then
      Tabela_2 := '2.14.0.E.11.01. . . .NNNNNNNNNNNNNX.14.00';
    if tipo = 'RR' then
      Tabela_1 := '1.09.0.D.09.05. . . . 24NNNNNNX.14.00';
    if tipo = 'SC' then
      Tabela_1 := '1.09.0.E.11.01. . . . NNNNNNNNX.14.00';
    if tipo = 'SP' then
      Tabela_1 := '1.12.0.D.11.12.D.11.13. NNNNNNNNXNNY.11.14';
    if tipo = 'SP' then
      Tabela_2 := '2.12.0.D.11.12. . . . NNNNNNNNXNNN.11.00';
    if tipo = 'SE' then
      Tabela_1 := '1.09.0.E.11.01. . . . NNNNNNNNX.14.00';
    if tipo = 'TO' then
      Tabela_1 := '1.11.0.E.11.06. . . . 29JKNNNNNNX.14.00';

    if tipo = 'CNPJ' then
      Tabela_1 := '1.14.0.E.11.21.E.11.22.NNNNNNNNNNNNXY.13.14';
    if tipo = 'CPF' then
      Tabela_1 := '1.11.0.E.11.31.E.11.32. NNNNNNNNNXY.13.14';

    { Deixa somente os numeros }

    Base_1 := '';

    for Contador := 1 to 30 do
      if pos(Copy(Inscricao, Contador, 1), '0123456789') <> 0 then
        Base_1 := Base_1 + Copy(Inscricao, Contador, 1);

    { Repete 3x - 1 para cada caso possivel }

    Casos := 0;

    Erro_1 := 0;
    Erro_2 := 0;
    Erro_3 := 0;

    while Casos < 3 do
    begin

      Casos := Casos + 1;

      if Casos = 1 then
        Tabela := Tabela_1;
      if Casos = 2 then
        Erro_1 := Erro_3;
      if Casos = 2 then
        Tabela := Tabela_2;
      if Casos = 3 then
        Erro_2 := Erro_3;
      if Casos = 3 then
        Tabela := Tabela_3;

      Erro_3 := 0;

      if Copy(Tabela, 1, 1) <> ' ' then
      begin

        { Verifica o Tamanho }

        if length(trim(Base_1)) <> (strtoint(Copy(Tabela, 3, 2))) then
          Erro_3 := 1;

        if Erro_3 = 0 then
        begin

          { Ajusta o Tamanho }

          Base_2 := Copy(' ' + Base_1, length(' ' + Base_1) - 13, 14);

          { Compara com valores possivel para cada uma da 14 posições }

          Contador := 0;

          while (Contador < 14) and (Erro_3 = 0) do
          begin

            Contador := Contador + 1;

            Posicao_1 := Copy(Copy(Tabela, 24, 14), Contador, 1);
            Posicao_2 := Copy(Base_2, Contador, 1);

            if (Posicao_1 = ' ') and (Posicao_2 <> ' ') then
              Erro_3 := 1;
            if (Posicao_1 = 'N') and (pos(Posicao_2, '0123456789') = 0) then
              Erro_3 := 1;
            if (Posicao_1 = 'A') and (pos(Posicao_2, '123456789') = 0) then
              Erro_3 := 1;
            if (Posicao_1 = 'B') and (pos(Posicao_2, '03578') = 0) then
              Erro_3 := 1;
            if (Posicao_1 = 'C') and (pos(Posicao_2, '47') = 0) then
              Erro_3 := 1;
            if (Posicao_1 = 'D') and (pos(Posicao_2, '34') = 0) then
              Erro_3 := 1;
            if (Posicao_1 = 'E') and (pos(Posicao_2, '08') = 0) then
              Erro_3 := 1;
            if (Posicao_1 = 'F') and (pos(Posicao_2, '015') = 0) then
              Erro_3 := 1;
            if (Posicao_1 = 'G') and (pos(Posicao_2, '1789') = 0) then
              Erro_3 := 1;
            if (Posicao_1 = 'H') and (pos(Posicao_2, '0123') = 0) then
              Erro_3 := 1;
            if (Posicao_1 = 'I') and (pos(Posicao_2, '01234') = 0) then
              Erro_3 := 1;
            if (Posicao_1 = 'J') and (pos(Posicao_2, '09') = 0) then
              Erro_3 := 1;
            if (Posicao_1 = 'K') and (pos(Posicao_2, '1239') = 0) then
              Erro_3 := 1;
            if (Posicao_1 <> Posicao_2) and (pos(Posicao_1, '0123456789') > 0) then
              Erro_3 := 1;

          end;

          { Calcula os Digitos }

          Rotina := ' ';
          Digitos := 000;
          Digito := 000;

          while (Digitos < 2) and (Erro_3 = 0) do
          begin

            Digitos := Digitos + 1;

            { Carrega peso }

            Peso := Copy(Tabela, 5 + (Digitos * 8), 2);

            if Peso <> ' ' then
            begin

              Rotina := Copy(Tabela, 0 + (Digitos * 8), 1);
              Modulo := strtoint(Copy(Tabela, 2 + (Digitos * 8), 2));

              if Peso = '01' then
                Peso := '06.05.04.03.02.09.08.07.06.05.04.03.02.00';
              if Peso = '02' then
                Peso := '05.04.03.02.09.08.07.06.05.04.03.02.00.00';
              if Peso = '03' then
                Peso := '06.05.04.03.02.09.08.07.06.05.04.03.00.02';
              if Peso = '04' then
                Peso := '00.00.00.00.00.00.00.00.06.05.04.03.02.00';
              if Peso = '05' then
                Peso := '00.00.00.00.00.01.02.03.04.05.06.07.08.00';
              if Peso = '06' then
                Peso := '00.00.00.09.08.00.00.07.06.05.04.03.02.00';
              if Peso = '07' then
                Peso := '05.04.03.02.01.09.08.07.06.05.04.03.02.00';
              if Peso = '08' then
                Peso := '08.07.06.05.04.03.02.07.06.05.04.03.02.00';
              if Peso = '09' then
                Peso := '07.06.05.04.03.02.07.06.05.04.03.02.00.00';
              if Peso = '10' then
                Peso := '00.01.02.01.01.02.01.02.01.02.01.02.00.00';
              if Peso = '11' then
                Peso := '00.03.02.11.10.09.08.07.06.05.04.03.02.00';
              if Peso = '12' then
                Peso := '00.00.01.03.04.05.06.07.08.10.00.00.00.00';
              if Peso = '13' then
                Peso := '00.00.03.02.10.09.08.07.06.05.04.03.02.00';
              if Peso = '21' then
                Peso := '05.04.03.02.09.08.07.06.05.04.03.02.00.00';
              if Peso = '22' then
                Peso := '06.05.04.03.02.09.08.07.06.05.04.03.02.00';
              if Peso = '31' then
                Peso := '00.00.00.10.09.08.07.06.05.04.03.02.00.00';
              if Peso = '32' then
                Peso := '00.00.00.11.10.09.08.07.06.05.04.03.02.00';

              { Multiplica }

              Base_3 := Copy(('0000000000000000' + trim(Base_2)), length(('0000000000000000' + trim(Base_2))) - 13, 14);

              Soma_1 := 0;
              Soma_2 := 0;

              for Contador := 1 to 14 do
              begin

                Valor_1 := (strtoint(Copy(Base_3, Contador, 01)) * strtoint(Copy(Peso, Contador * 3 - 2, 2)));

                Soma_1 := Soma_1 + Valor_1;

                if Valor_1 > 9 then
                  Valor_1 := Valor_1 - 9;

                Soma_2 := Soma_2 + Valor_1;

              end;

              { Ajusta valor da soma }

              if pos(Rotina, 'A2') > 0 then
                Soma_1 := Soma_2;
              if pos(Rotina, 'B0') > 0 then
                Soma_1 := Soma_1 * 10;
              if pos(Rotina, 'C1') > 0 then
                Soma_1 := Soma_1 + (5 + 4 * strtoint(Copy(Tabela, 6, 1)));

              { Calcula o Digito }

              if pos(Rotina, 'D0') > 0 then
                Digito := Soma_1 mod Modulo;
              if pos(Rotina, 'E12') > 0 then
                Digito := Modulo - (Soma_1 mod Modulo);

              if Digito < 10 then
                Resultado := inttostr(Digito);
              if Digito = 10 then
                Resultado := '0';
              if Digito = 11 then
                Resultado := Copy(Tabela, 6, 1);

              { Verifica o Digito }

              if (Copy(Base_2, strtoint(Copy(Tabela, 36 + (Digitos * 3), 2)), 1) <> Resultado) then
                Erro_3 := 1;

            end;

          end;

        end;

      end;

    end;

    { Retorna o resultado da Verificação }

    Retorno := false;

    if (trim(Tabela_1) <> '') and (Erro_1 = 0) then
      Retorno := true;
    if (trim(Tabela_2) <> '') and (Erro_2 = 0) then
      Retorno := true;
    if (trim(Tabela_3) <> '') and (Erro_3 = 0) then
      Retorno := true;

    if trim(Inscricao) = 'ISENTO' then
      Retorno := true;

    Result := Retorno;

  except

    Result := false;

  end;

end;

{ Mascara_Inscricao __________________________________ }

function TFMFUN.Mascara_Inscricao(Inscricao, Estado: string): string;
var

  Mascara: string;

  Contador_1: Integer;
  Contador_2: Integer;

begin

  if Estado = 'AC' then
    Mascara := '**.***.***/***-**';
  if Estado = 'AL' then
    Mascara := '*********';
  if Estado = 'AP' then
    Mascara := '*********';
  if Estado = 'AM' then
    Mascara := '**.***.***-*';
  if Estado = 'BA' then
    Mascara := '******-**';
  if Estado = 'CE' then
    Mascara := '********-*';
  if Estado = 'DF' then
    Mascara := '***********-**';
  if Estado = 'ES' then
    Mascara := '*********';
  if Estado = 'GO' then
    Mascara := '**.***.***-*';
  if Estado = 'MA' then
    Mascara := '*********';
  if Estado = 'MT' then
    Mascara := '**********-*';
  if Estado = 'MS' then
    Mascara := '*********';
  if Estado = 'MG' then
    Mascara := '***.***.***/****';
  if Estado = 'PA' then
    Mascara := '**-******-*';
  if Estado = 'PB' then
    Mascara := '********-*';
  if Estado = 'PR' then
    Mascara := '********-**';
  if Estado = 'PE' then
    Mascara := '**.*.***.*******-*';
  if Estado = 'PI' then
    Mascara := '*********';
  if Estado = 'RJ' then
    Mascara := '**.***.**-*';
  if Estado = 'RN' then
    Mascara := '**.***.***-*';
  if Estado = 'RS' then
    Mascara := '***/*******';
  if Estado = 'RO' then
    Mascara := '***.*****-*';
  if Estado = 'RR' then
    Mascara := '********-*';
  if Estado = 'SC' then
    Mascara := '***.***.***';
  if Estado = 'SP' then
    Mascara := '***.***.***.***';
  if Estado = 'SE' then
    Mascara := '*********-*';
  if Estado = 'TO' then
    Mascara := '***********';

  Contador_2 := 1;

  Result := '';

  Mascara := Mascara + '****';

  for Contador_1 := 1 to length(Mascara) do
  begin

    if Copy(Mascara, Contador_1, 1) = '*' then
      Result := Result + Copy(Inscricao, Contador_2, 1);
    if Copy(Mascara, Contador_1, 1) <> '*' then
      Result := Result + Copy(Mascara, Contador_1, 1);

    if Copy(Mascara, Contador_1, 1) = '*' then
      Contador_2 := Contador_2 + 1;

  end;

  Result := trim(Result);

end;

{ Fim __________________________________ }

function TFMFUN.CaseString(const S: string; const x: array of string): Integer;
var
  i: Integer;
begin
  Result := -1;
  for i := Low(x) to High(x) do
  begin
    if S = x[i] then
    begin
      Result := i;
      Break;
    end;
  end;
end;

function TFMFUN.poePONTOS(MDADENV: string; MTAMVAR: Integer): string;
var
  MPONTOS: string;
  MTAMREA: Integer; { p/conter o tamnho sem os brancos }
begin
  MPONTOS := '............................................................';
  MTAMREA := length(MDADENV);
  Result := MDADENV + Copy(MPONTOS, 1, (MTAMVAR - MTAMREA));
end;

function TFMFUN.PreEsp(MSTR: string; MTAM: Integer): string;
var
  mfor, i: Integer;
  mstrfin: string;
begin
  mfor := MTAM - (length(MSTR));
  mstrfin := MSTR;
  for i := 0 to mfor do
  begin
    mstrfin := mstrfin + ' ';
  end;
  Result := mstrfin;
end;

function TFMFUN.RTrim(Texto: string): string;
{ Remove os Espaços em branco à esquerda da string }
var
  i: Integer;
begin
  i := length(Texto) + 1;
  while true do
  begin
    Dec(i);
    if i <= 0 then
      Break;
    if Texto[i] <> #32 then
      Break;
  end;
  Result := Copy(Texto, 1, i);
end;

function TFMFUN.Alltrim(const Search: string): string;
{ Remove os espaços em branco de ambos os lados da string }
const
  BlackSpace = [#33 .. #126];
var
  Index: Byte;
begin
  Index := 1;
  while (Index <= length(Search)) and not(Search[Index] in BlackSpace) do
  begin
    Index := Index + 1;
  end;
  Result := Copy(Search, Index, 255);
  Index := length(Result);
  while (Index > 0) and not(Result[Index] in BlackSpace) do
  begin
    Index := Index - 1;
  end;
  Result := Copy(Result, 1, Index);
end;

function TFMFUN.RemoveChar(const Texto: string): string;
// Remove caracteres de uma string deixando apenas numeros
var
  i: Integer;
  S: string;
begin
  S := '';
  for i := 1 to length(Texto) do
  begin
    if (Texto[i] in ['0' .. '9']) then
    begin
      S := S + Copy(Texto, i, 1);
    end;
  end;
  Result := S;
end;

function TFMFUN.GetDefaultPrinterName: string;
//
// Retorna o nome da impressora padrão do Windows
//
begin
  if (Printer.PrinterIndex > 0) then
  begin
    Result := Printer.printers[Printer.PrinterIndex];
  end
  else
  begin
    Result := 'Nenhuma impressora Padrão foi detectada';
  end;
  showmessage(Result);
end;

function TFMFUN.busca_sinal_igual(produto: string): boolean;
var
  i: Integer;
begin
  if pos('=', produto) > 0 then
  begin
    showmessage('O NOME DO PRODUTO NÃO PODE CONTER O SINAL DE = ');
    Result := false
  end
  else
  begin
    Result := true;

  end;
end;

procedure TFMFUN.LimpaLetrasConsulta(S: TEdit);
var
  tem_letra: boolean;
  ultimo_caracter: string;
begin
 if trim(S.Text) = '' then
   Exit;

  ultimo_caracter := Copy(S.Text, length(S.Text), 1);
  try
    strtoint(ultimo_caracter);
    tem_letra := false;
  except
    tem_letra := true;
  end;
  if pos(',', ultimo_caracter) > 0 then
    tem_letra := false;
  if pos('-', ultimo_caracter) > 0 then
    tem_letra := false;
  if tem_letra = true then
    S.Clear;
end;

function TFMFUN.verificaNumerico(S: string): boolean;
begin
  try
    strtoint(S);
    Result := true;
  except
    Result := false;
  end;
end;

function TFMFUN.poe2zero(MVLR: real): real;
var
  MVLR1, MVLR2, MVLR3: string;
  MPOS: Word;
begin
  MVLR1 := floattostr(MVLR);
  if formatsettings.DecimalSeparator = '.' then
    MPOS := pos('.', MVLR1);
  if formatsettings.DecimalSeparator = ',' then
    MPOS := pos(',', MVLR1);
  MVLR2 := Copy(MVLR1, 1, MPOS + 2);
  MVLR2 := MVLR2 + '00';
  MVLR3 := Copy(MVLR1, MPOS + 3, (length(MVLR1) + 1) - (MPOS + 3));
  MVLR2 := MVLR2 + MVLR3;
  Result := strtofloat(MVLR2);

end;

function TFMFUN.enchevazio(MDADENV: string; MTAMVAR: Integer): string;
var
  MZEROS: string;
  MTAMREA: Integer; { p/conter o tamnho sem os brancos }
begin
  MZEROS := '               '; // 15
  MTAMREA := length(MDADENV);
  Result := Copy(MZEROS, 1, (MTAMVAR - MTAMREA)) + MDADENV;

end;

function TFMFUN.TamArquivo(Arquivo: string): Integer;
begin
  with TFileStream.Create(Arquivo, fmOpenRead or fmShareExclusive) do
    try
      Result := Size;
    finally
      free;

    end;

end;

function TFMFUN.Str_to_float(VlrStr: string; default: Currency): Currency;
begin
  VlrStr := stringreplace(VlrStr, formatsettings.ThousandSeparator, '', [rfReplaceAll]);
  VlrStr := stringreplace(VlrStr, formatsettings.CurrencyString, '', [rfReplaceAll]);
  Result := StrToCurrDef(VlrStr, Default);
end;

function TFMFUN.prepara_valor(vlr: string): string;
var
  Valor: string;
begin
  Valor := vlr;
  if Copy(Valor, pos(',', Valor) + 1, 2) = '00' then
  begin
    Valor := Copy(Valor, 1, pos(',', Valor) - 1);
  end
  else
  begin
    Valor := FMFUN.BuscaTroca(Valor, '.', '');
    Valor := FMFUN.BuscaTroca(Valor, ',', '.');
  end;
  Result := Valor;
end;

function TFMFUN.calcula_dv_nfe(c_uf, dta_emissao, cnpj, modelo, serie, nr_nf, cod_numerico: string): string;
var
  chave: string;
  somatorio: Integer;
  i: Integer;
  multi: Integer;
  b: real;
begin
  // sequencia de multiplicadores 2,3,4,5,6,7,8,9,2,3
  chave := c_uf + dta_emissao + cnpj + modelo + serie + nr_nf + cod_numerico;
  multi := 2;
  for i := 1 to 43 do
  begin
    somatorio := somatorio + strtoint(Copy(chave, i, 1)) * multi;
    multi := multi + 1;
    if multi >= 10 then
      multi := 2;
  end;
  Result := inttostr(somatorio mod 11);

end;

procedure TFMFUN.FormCreate(Sender: TObject);
begin

  COMPUTADOR := NomeMaquina;
end;

function TFMFUN.DecimalPonto(sValor: string): string;
begin
  Result := stringreplace(sValor, '.', '', [rfReplaceAll]);
  Result := stringreplace(Result, ',', '.', [rfReplaceAll]);
end;

function TFMFUN.ProcessoExiste(ExeFileName: string): boolean;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32 { declarar Uses Tlhelp32 };
begin
  Result := false;

  FSnapshotHandle := CreateToolHelp32SnapShot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) = UpperCase(ExeFileName))) then
    begin
      Result := true;
      exit;
    end;
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

function TFMFUN.TerminarProcesso(sFile: string): boolean;
var
  verSystem: TOSVersionInfo;
  hdlSnap, hdlProcess: THandle;
  bPath, bLoop: BOOL;
  peEntry: TProcessEntry32;
  arrPid: array [0 .. 1023] of DWord;
  iC: DWord;
  k, iCount: Integer;
  arrModul: array [0 .. 299] of char;
  hdlModul: HMODULE;
begin
  Result := false;
  if ExtractFileName(sFile) = sFile then
    bPath := false
  else
    bPath := true;
  verSystem.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
  GetVersionEx(verSystem);
  if verSystem.dwPlatformId = VER_PLATFORM_WIN32_WINDOWS then
  begin
    hdlSnap := CreateToolHelp32SnapShot(TH32CS_SNAPPROCESS, 0);
    peEntry.dwSize := SizeOf(peEntry);
    bLoop := Process32First(hdlSnap, peEntry);
    while Integer(bLoop) <> 0 do
    begin
      if bPath then
      begin
        if CompareText(peEntry.szExeFile, sFile) = 0 then
        begin
          TerminateProcess(OpenProcess(PROCESS_TERMINATE, false, peEntry.th32ProcessID), 0);
          Result := true;
        end;
      end
      else
      begin
        if CompareText(ExtractFileName(peEntry.szExeFile), sFile) = 0 then
        begin
          TerminateProcess(OpenProcess(PROCESS_TERMINATE, false, peEntry.th32ProcessID), 0);
          Result := true;
        end;
      end;
      bLoop := Process32Next(hdlSnap, peEntry);
    end;
    CloseHandle(hdlSnap);
  end
  else if verSystem.dwPlatformId = VER_PLATFORM_WIN32_NT then
  begin
    EnumProcesses(@arrPid, SizeOf(arrPid), iC);
    iCount := iC div SizeOf(DWord);
    for k := 0 to Pred(iCount) do
    begin
      hdlProcess := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ, false, arrPid[k]);
      if (hdlProcess <> 0) then
      begin
        EnumProcessModules(hdlProcess, @hdlModul, SizeOf(hdlModul), iC);
        GetModuleFilenameEx(hdlProcess, hdlModul, arrModul, SizeOf(arrModul));
        if bPath then
        begin
          if CompareText(arrModul, sFile) = 0 then
          begin
            TerminateProcess(OpenProcess(PROCESS_TERMINATE or PROCESS_QUERY_INFORMATION, false, arrPid[k]), 0);
            Result := true;
          end;
        end
        else
        begin
          if CompareText(ExtractFileName(arrModul), sFile) = 0 then
          begin
            TerminateProcess(OpenProcess(PROCESS_TERMINATE or PROCESS_QUERY_INFORMATION, false, arrPid[k]), 0);
            Result := true;
          end;
        end;
        CloseHandle(hdlProcess);
      end;
    end;
  end;
end;
{$IFNDEF ORBISELLER}

procedure TFMFUN.AtualizaPeso(pedido: string);
var
  cmd1: string;
begin
  cmd1 := 'update vendas1 v1 set v1.PESO_NOTA = (SELECT SUM(COALESCE(PRECO_BRUTO,0)) FROM VENDAS2 V2 WHERE V2.NUMDOC = V1.NUMDOC) where v1.numdoc = ' + pedido;
  try
    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
    dao.ExecSQL(cmd1);
    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;

end;

procedure TFMFUN.AtualizaDadosComissao(pedido: string);
var
  cmd1: string;
begin
  { cmd1 := 'update  '+
    '  vendas2 v        '+
    'set                '+
    '  v.PRECO_CUSTO =  '+
    '  (select p.CUSTO_total  '+
    '   from vendas2 v2 '+
    '   inner join produto p on (p.COD_PRODUTO = v2.COD_PRODUTO)  '+
    '   where v2.NUMDOC = '+pedido+' and v.id = v2.id) '+
    '   where v.id in '+
    '   ( '+
    '     select '+
    '       v2.id '+
    '     from vendas2 v2 '+
    '     inner join produto p on (p.COD_PRODUTO = v2.COD_PRODUTO) '+
    '     where v2.NUMDOC = '+pedido+' ) ';
    try
    if not dao.cn.InTransaction then
    dao.cn.StartTransaction;
    dao.Execsql(cmd1);
    dao.cn.Commit;
    except
    dao.cn.rollback;
    end;
  }
  cmd1 := 'update ' +
          '  vendas1  ' +
          'set ' +
          '  PERC_COMISSAO = ' +
          '  (SELECT DISTINCT ' +
          '     case when v.MARGEM_LUCRO < r.MARGEM_MINIMA then 0 ' +
          '     else case when v.MARGEM_LUCRO < r.MARGEM_IDEAL then ' +
          '     r.PERC_COMISSAO_FIXA * (1 + ((v.MARGEM_LUCRO - r.MARGEM_IDEAL) / 100) * r.INDICE_ABAIXO) ' +
          '     else r.PERC_COMISSAO_FIXA * (1 + ((v.MARGEM_LUCRO - r.MARGEM_IDEAL) / 100) * r.INDICE_ACIMA) end end calc_comissao ' + '   FROM VENDAS1 a ' +
          '   inner join v_comissao_nova v on (v.NUMDOC = a.NUMDOC) ' +
          '   inner join REPRESENTANTE r on (r.id = a.COD_REPRESENTANTE) ' +
          '   where a.numdoc = ' + pedido + ') ' +
          '   where numdoc = ' + pedido;
  try
    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
    dao.ExecSQL(cmd1);
    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;

  cmd1 := 'update vendas1  set VLR_COMISSAO = TOT_LIQUIDO * (PERC_COMISSAO / 100) where numdoc = ' + pedido;
  try
    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
    dao.ExecSQL(cmd1);
    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;
end;

procedure TFMFUN.AtualizaDadosComissaoDesconto(pedido: string);
var
  cmd1: string;
begin
  cmd1 := 'update ' +
          '  vendas1 ' +
          'set ' +
          '  numdoc = numdoc, ' +
          '  numdoc_destino = 0 ' +
          '  where numdoc = ' + pedido;
  try
    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
    dao.ExecSQL(cmd1);
    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;
end;

{$ENDIF}

function TFMFUN.SaveJPEGPictureFile(Bitmap: TBitmap; FilePath, FileName: string; Quality: Integer): boolean;
begin
  Result := true;
  try
    if ForceDirectories(FilePath) then
    begin
      with TJPegImage.Create do
      begin
        try
          Assign(Bitmap);
          CompressionQuality := Quality;
          SaveToFile(FilePath + FileName);
        finally
          free;
        end; { try }
      end; { with }
    end; { if }
  except
    raise;
    Result := false;
  end; { try }
end; { SaveJPEGPictureFile }

{ ---------------------------------------------------------------------------
  ----------------------- }

function TFMFUN.JPEGDimensions(FileName: string; var x, Y: Word): boolean;
var
  SegmentPos: Integer;
  SOIcount: Integer;
  b: Byte;
begin
  Result := false;
  with TFileStream.Create(FileName, fmOpenRead or fmShareDenyNone) do
  begin
    try
      Position := 0;
      Read(x, 2);
      if (x <> $D8FF) then
        exit;
      SOIcount := 0;
      Position := 0;
      while (Position + 7 < Size) do
      begin
        Read(b, 1);
        if (b = $FF) then
        begin
          Read(b, 1);
          if (b = $D8) then
            Inc(SOIcount);
          if (b = $DA) then
            Break;
        end; { if }
      end; { while }
      if (b <> $DA) then
        exit;
      SegmentPos := -1;
      Position := 0;
      while (Position + 7 < Size) do
      begin
        Read(b, 1);
        if (b = $FF) then
        begin
          Read(b, 1);
          if (b in [$C0, $C1, $C2]) then
          begin
            SegmentPos := Position;
            Dec(SOIcount);
            if (SOIcount = 0) then
              Break;
          end; { if }
        end; { if }
      end; { while }
      if (SegmentPos = -1) then
        exit;
      if (Position + 7 > Size) then
        exit;
      Position := SegmentPos + 3;
      Read(Y, 2);
      Read(x, 2);
      x := Swap(x);
      Y := Swap(Y);
      Result := true;
    finally
      free;
    end; { try }
  end; { with }
end; { JPEGDimensions }

procedure TFMFUN.SetJPGResize(width: Integer; const AInFile: string; const AOutFile: string);
var
  iCompression: Integer;
  oJPG: TJPegImage;
  oBMP, oBMPNovo: TBitmap;
  Rect: TRect;
begin
  // Force Compression to range 1..100
  // Create Jpeg and Bmp work classes
  oJPG := TJPegImage.Create;
  oJPG.LoadFromFile(AInFile);
  oBMP := TBitmap.Create;
  oBMPNovo := TBitmap.Create;
  oBMP.Assign(oJPG);

  Rect.Right := width;
  Rect.Bottom := trunc((oBMP.Height * (width / oBMP.width)));

  oBMPNovo.Height := Rect.Bottom;
  oBMPNovo.width := Rect.Right;
  oBMPNovo.Canvas.StretchDraw(Rect, oBMP);

  oJPG.Assign(oBMPNovo);
  // Do the Compression and Save New File
  oJPG.CompressionQuality := 100;
  oJPG.Compress;
  oJPG.SaveToFile(AOutFile);

  // Clean Up
  oJPG.free;
  oBMP.free;
  oBMPNovo.free;
end;

procedure TFMFUN.QualityResizeBitmap(bmpOrig, bmpDest: TBitmap; newWidth, newHeight: Integer);
var
  xIni, xFin, yIni, yFin, xSalt, ySalt: Double;
  x, Y, pX, pY, tpX: Integer;
  R, G, b: Integer;
  pxColor: TColor;
begin
  bmpDest.width := newWidth;
  bmpDest.Height := newHeight;

  xSalt := bmpOrig.width / newWidth;
  ySalt := bmpOrig.Height / newHeight;

  yFin := 0;
  for Y := 0 to Pred(newHeight) do
  begin
    yIni := yFin;
    yFin := yIni + ySalt;
    if yFin >= bmpOrig.Height then
      yFin := Pred(bmpOrig.Height);

    xFin := 0;
    for x := 0 to Pred(newWidth) do
    begin
      xIni := xFin;
      xFin := xIni + xSalt;
      if xFin >= bmpOrig.width then
        xFin := Pred(bmpOrig.width);

      R := 0;
      G := 0;
      b := 0;
      tpX := 0;

      for pY := round(yIni) to round(yFin) do
        for pX := round(xIni) to round(xFin) do
        begin
          Inc(tpX);
          pxColor := ColorToRGB(bmpOrig.Canvas.Pixels[pX, pY]);
          R := R + GetRValue(pxColor);
          G := G + GetGValue(pxColor);
          b := b + GetBValue(pxColor);
        end;

      bmpDest.Canvas.Pixels[x, Y] := RGB(round(R / tpX), round(G / tpX), round(b / tpX));
    end;
  end;
end;

procedure TFMFUN.MontaLogger;
begin
  //
end;

procedure TFMFUN.dgCreateProcess(const FileName: string);
var
  ProcInfo: TProcessInformation;
  StartInfo: TStartupInfo;
begin
  FillMemory(@StartInfo, SizeOf(StartInfo), 0);
  StartInfo.cb := SizeOf(StartInfo);
  CreateProcess(nil, PChar(FileName), nil, nil, false, NORMAL_PRIORITY_CLASS, nil, nil, StartInfo, ProcInfo);
  CloseHandle(ProcInfo.hProcess);
  CloseHandle(ProcInfo.hThread);
end;

function TFMFUN.IsFileInUse(fName: string): boolean;
var
  HFileRes: HFILE;
  Res: string[6];

  function CheckAttributes(FileNam: string; CheckAttr: string): boolean;
  var
    fa: Integer;
  begin
    fa := GetFileAttributes(PChar(FileNam));
    Res := '';

    if (fa and FILE_ATTRIBUTE_NORMAL) <> 0 then
    begin
      Result := false;
      exit;
    end;

    if (fa and FILE_ATTRIBUTE_ARCHIVE) <> 0 then
      Res := Res + 'A';
    if (fa and FILE_ATTRIBUTE_COMPRESSED) <> 0 then
      Res := Res + 'C';
    if (fa and FILE_ATTRIBUTE_DIRECTORY) <> 0 then
      Res := Res + 'D';
    if (fa and FILE_ATTRIBUTE_HIDDEN) <> 0 then
      Res := Res + 'H';
    if (fa and FILE_ATTRIBUTE_READONLY) <> 0 then
      Res := Res + 'R';
    if (fa and FILE_ATTRIBUTE_SYSTEM) <> 0 then
      Res := Res + 'S';

    Result := AnsiContainsText(Res, CheckAttr);
  end; (* CheckAttributes *)

  procedure SetAttr(fName: string);
  var
    Attr: Integer;
  begin
    Attr := 0;
    if AnsiContainsText(Res, 'A') then
      Attr := Attr + FILE_ATTRIBUTE_ARCHIVE;
    if AnsiContainsText(Res, 'C') then
      Attr := Attr + FILE_ATTRIBUTE_COMPRESSED;
    if AnsiContainsText(Res, 'D') then
      Attr := Attr + FILE_ATTRIBUTE_DIRECTORY;
    if AnsiContainsText(Res, 'H') then
      Attr := Attr + FILE_ATTRIBUTE_HIDDEN;
    if AnsiContainsText(Res, 'S') then
      Attr := Attr + FILE_ATTRIBUTE_SYSTEM;

    SetFileAttributes(PChar(fName), Attr);
  end; (* SetAttr *)

begin // IsFileInUse
  if CheckAttributes(fName, 'R') then
  begin
    Result := false;

    if not FileExists(fName) then
      exit;

    if MessageDlg(ExtractFileName(fName) + ' is a READ-ONLY file.' + #13#10 + 'Do you wish to clear the READ-ONLY flag???', mtConfirmation, [mbyes, mbno], 0) = mrNo then
    begin
      Result := true;
      exit;
    end;
  end;

  SetFileAttributes(PChar(fName), FILE_ATTRIBUTE_NORMAL);

  SetAttr(fName);

  HFileRes := CreateFile(PChar(fName), GENERIC_READ or GENERIC_WRITE, 0, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  Result := (HFileRes = INVALID_HANDLE_VALUE);
  if not Result then
    CloseHandle(HFileRes);
end; // IsFileInUse

procedure TFMFUN.atualiza_comissao_margem(numdoc: string);
var
  cmd: string;
begin
  cmd := 'update ' +
         '  vendas1 ' +
         'set ' +
         '  PERC_COMISSAO = ' +
         '  ( ' +
         '    SELECT ' +
         '      case when v.MARGEM_LUCRO < r.MARGEM_MINIMA then  0 ' +
         '      else case when v.MARGEM_LUCRO < r.MARGEM_IDEAL then  ' +
         '        r.PERC_COMISSAO_FIXA * (1 + ((v.MARGEM_LUCRO - r.MARGEM_IDEAL) / 100) * r.INDICE_ABAIXO) ' +
         '      else ' +
         '        r.PERC_COMISSAO_FIXA * (1 + ((v.MARGEM_LUCRO - r.MARGEM_IDEAL) / 100) * r.indice_acima) ' +
         '      end end calc_comissao ' +
         '    FROM VENDAS1 a ' +
         '    inner join v_comissao_nova v on (v.NUMDOC = a.NUMDOC) ' +
         '    inner join REPRESENTANTE r on (r.id = a.COD_REPRESENTANTE) ' +
         '    where a.numdoc = ' + numdoc +
         '  ) ' +
         'where numdoc = ' + numdoc;

  dao.Exec_sql.sql.Clear;
  dao.Exec_sql.sql.Add(cmd);
  dao.Exec_sql.ExecSQL;

  cmd := 'update vendas1 set VLR_COMISSAO = cast( ' +
    '(((case when (coalesce((select sum(valor) from cr1 as cr where cr.nr_documento = v.NUMDOC),0) - case when cd.UF <> ''SC'' and v.nfe is not null then v.VLR_ST else 0 end) > 0 ' +
    'then (coalesce((select sum(valor) from cr1 as cr where cr.nr_documento = v.NUMDOC),0) - case when cd.UF <> ''SC'' and v.nfe is not null then v.VLR_ST else 0 end) ' +
    'else v.TOT_LIQUIDO end) * (PERC_COMISSAO / 100) as numeric(15,2)) ' +
    'where  numdoc = ' + numdoc;

  dao.Exec_sql.sql.Clear;
  dao.Exec_sql.sql.Add(cmd);
  dao.Exec_sql.ExecSQL;

end;

function TFMFUN.Modulo11(Numero: string): string;
var
  i, k: Integer;
  Soma: Integer;
  Digito: Integer;

begin
  Result := '';
  try
    Soma := 0;
    k := 2;
    for i := length(Numero) downto 1 do
    begin
      Soma := Soma + (strtoint(Numero[i]) * k);
      Inc(k);
      if k > 9 then
        k := 2;
    end;
    Digito := 11 - Soma mod 11;
    if Digito >= 10 then
      Digito := 0;
    Result := Result + Chr(Digito + Ord('0'));
  except
    Result := 'X';
  end;
end;

function TFMFUN.LimpaCNPJ(cnpj: string): string;
begin
  Result := stringreplace(stringreplace(stringreplace(stringreplace(stringreplace(cnpj, '.', '', [rfReplaceAll]), '-', '', [rfReplaceAll]), '/', '', [rfReplaceAll]), '(', '', [rfReplaceAll]), ')', '',
    [rfReplaceAll]);
end;

function TFMFUN.PegaValorParaSql(campo: TField):string;
begin
  if campo.IsNull then
    Result := 'NULL'
  else if campo.DataType = ftDate then
    Result := QuotedStr(formatdatetime('dd/mm/yyyy', campo.AsDateTime))
  else if campo.DataType = ftFloat then
    Result := stringreplace(campo.AsString, ',', '.', [rfReplaceAll])
  else if not campo.IsBlob then
    Result := QuotedStr(stringreplace(campo.AsString, #13#10, ' ', [rfReplaceAll]))
  else
    Result := QuotedStr(campo.AsString);
end;

function TFMFUN.FormataIE(uf: string): string;
begin
  dao.Geral5('SELECT a.MASCARA_IE FROM UF a where uf = ''' + uf + '''');
  Result := dao.Q5.fieldbyname('MASCARA_IE').AsString;
end;

function TFMFUN.FormataCEP(CEP: string): string;
begin
  CEP := LimpaCNPJ(CEP);
  CEP := enchezero(CEP, 8);
  Result := Copy(CEP, 1, 5) + '-' + Copy(CEP, 6, 3);
end;


{
procedure TFMFUN.BuscaDadosPorCNPJJson(cnpj_cpf: string; out RazaoSocial: string; out Fantasia: string; out CEP: string; out Endereco: string; out Numero: string; out Complemento: string;
  out Bairro: string; out CIDADE: string; out uf: string; out EmpresaTipo: string; out Situacao: string);
var
  Api: TSpeedioApi;
begin
  RazaoSocial := '';
  Fantasia := '';
  CEP := '';
  Endereco := '';
  Numero := '';
  Complemento := '';
  Bairro := '';
  CIDADE := '';
  uf := '';
  EmpresaTipo := '';
  Situacao := '';

  Api := TSpeedioApi.Create('', '');
  try
    try
      Api.BuscarDadosPorCNPJ(cnpj_cpf, RazaoSocial, Fantasia, CEP, Endereco, Numero, Complemento, Bairro, CIDADE, uf, EmpresaTipo, Situacao);
    except
      on e: Exception do
        MessageDlg(e.Message, mtError, [mbOK], 0);
    end;
  finally
    Api.Free;
  end;
end;
}

procedure TFMFUN.BuscaDadosPorCNPJJson(cnpj_cpf: string; out RazaoSocial: string; out Fantasia: string; out CEP: string; out Endereco: string; out Numero: string; out Complemento: string;
  out Bairro: string; out CIDADE: string; out uf: string; out EmpresaTipo: string; out Situacao: string);
var
  Resposta: TStringStream;
  URL: string;
  Retorno: TJSONObject;
  prows: TJSONPair;
  arrayr: TJSONArray;
  orows: TJSONObject;
  arraye: TJSONArray;
  oelementos: TJSONObject;
  oduracao, odistancia: TJSONObject;
begin
  try
    cnpj_cpf := LimpaCNPJ(cnpj_cpf);
    Resposta := TStringStream.Create('');

    URL := 'http://www.receitaws.com.br/v1/cnpj/{vcnpj}';
    RESTClient1.BaseURL := 'http://www.receitaws.com.br/v1/cnpj/'+cnpj_cpf;
    RESTRequest1.Execute;

    Retorno := RESTRequest1.Response.JSONValue as TJSONObject;

    if Retorno.GetValue('status').value <> 'OK' then
    begin
      showmessage(Retorno.GetValue('message').value);
      exit;
    end;

    RazaoSocial := Retorno.GetValue('nome').value;
    Fantasia := Retorno.GetValue('fantasia').value;
    CEP := Retorno.GetValue('cep').value;
    Endereco := Retorno.GetValue('logradouro').value;
    Numero := Retorno.GetValue('numero').value;
    Complemento := Retorno.GetValue('complemento').value;
    Bairro := Retorno.GetValue('bairro').value;
    CIDADE := Retorno.GetValue('municipio').value;
    uf := Retorno.GetValue('uf').value;
    prows := Retorno.Get('atividade_principal');
    arrayr := prows.JSONValue as TJSONArray;
    orows := arrayr.Items[0] as TJSONObject;
    EmpresaTipo := orows.GetValue('text').value;
    Situacao := Retorno.GetValue('situacao').value;
  except
    on e: Exception do
      MessageDlg(e.Message, mtError, [mbOK], 0);
  end;
end;


function TFMFUN.BuscaDadosPorCNPJ(cnpj_cpf, uf: string; PJ: boolean): boolean;
var
  captcha: string;
begin
  if uf = '' then
  begin
{$IFDEF ORBI}
    Application.CreateForm(Tfm_selec_uf, fm_selec_uf);
    fm_selec_uf.ShowModal;
    if fm_selec_uf.ModalResult = mrok then
    begin
      uf := fm_selec_uf.uf_selecionado;
      captcha := fm_selec_uf.edCaptcha.Text;
    end;
{$ENDIF}
    cnpj_cpf := LimpaCNPJ(cnpj_cpf);
    {
      dao.Geral5
      ('SELECT SERIE_CERTIFICADO FROM EMPRESA WHERE SERIE_CERTIFICADO is not null and CERTIFICADO_VCTO > current_date limit 1 ');
      if dao.Q5.IsEmpty then
      begin
      Result := false;
      exit;
      end;

      ACBrNFe1.Configuracoes.Certificados.NumeroSerie :=
      dao.Q5.fieldbyname('SERIE_CERTIFICADO').AsString;
      ACBrNFe1.WebServices.ConsultaCadastro.uf := uf;
      ACBrNFe1.Configuracoes.WebServices.Ambiente := taProducao;
    }
    if captcha = '' then
      exit;

    if PJ then
    begin

      if not ACBrConsultaCNPJ1.Consulta(cnpj_cpf, captcha, true) then
      begin
        // MessageDlg(ACBrConsultaCNPJ1. , mtError, [mbOK], 0);
        exit;
      end;

      // ACBrNFe1.WebServices.ConsultaCadastro.cnpj := cnpj_cpf;

    end
    else
    begin
      // ACBrConsultaCPF1.Consulta(cnpj_cpf, captcha, true);
      // ACBrNFe1.WebServices.ConsultaCadastro.CPF := cnpj_cpf;
    end;
    Result := true;
    { try
      ACBrNFe1.WebServices.ConsultaCadastro.Executar;
      except
      on e: Exception do
      if ACBrNFe1.WebServices.ConsultaCadastro.xMotivo <> 'Consulta cadastro com uma ocorrencia'
      then
      begin
      MessageDlg(e.Message, mtError, [mbOK], 0);
      Result := false;
      end;
      end; }
  end;
end;

{$IFDEF ORBI}

procedure TFMFUN.GravarProcessoPedido(status, processo, pedido: string);
begin
  dao.ExecSQL('UPDATE PROCESSO_PEDIDO SET STATUS = ''' + status + ''' WHERE ID = ' + processo);
  dao.ExecSQL('INSERT INTO HIST_PROCESSO_PEDIDO (PROCESSO_ID, NUMDOC, DATA, HORA, OBS)  VALUES ( ' + processo + ', ' + pedido + ', CURRENT_DATE, CURRENT_TIME, ''STATUS: ' + status + ''')');
end;

procedure TFMFUN.AlterarProcessoPedido(processo, pedido: string);
var
  sql, ID: string;
begin
  Application.CreateForm(tfrm_alterar_status_pedido, frm_alterar_status_pedido);
  frm_alterar_status_pedido.ShowModal;
  if frm_alterar_status_pedido.ModalResult = mrok then
    GravarProcessoPedido(frm_alterar_status_pedido.status, processo, pedido);
  frm_alterar_status_pedido.free;
end;

function TFMFUN.GerarProcessoPedido: string;
var
  sql, ID: string;
begin

  dao.ExecSQL('INSERT INTO PROCESSO_PEDIDO (STATUS) VALUES (''À CONFERIR'')');
  dao.geral1('SELECT last_value FROM gen_processo_pedido ');
  ID := dao.q1.fieldbyname('last_value').value;

//  ID := dao.Insert('Pr', 'PROCESSO_PEDIDO', 'ID', FMFUN, 'GEN_PROCESSO_PEDIDO');
  dao.ExecSQL('UPDATE PROCESSO_PEDIDO SET STATUS = ''À CONFERIR'' WHERE ID = ' + ID);

  dao.ExecSQL('INSERT INTO HIST_PROCESSO_PEDIDO (PROCESSO_ID, DATA, HORA, OBS)  VALUES ( ' + ID + ', CURRENT_DATE, CURRENT_TIME, ''STATUS: À CONFERIR'')');

  Result := ID;

end;

function TFMFUN.LoginSite: boolean;
var
  Xml: TStringList;
  Resposta, Consulta: TStringStream;
  URL, logado, post: string;
begin
  dao.Geral2('SELECT a.SITE, a.USUARIO_SITE, a.LOGIN_SITE FROM CONFIGURACAO a');

  Xml := TStringList.Create;
  Resposta := TStringStream.Create('');
  Consulta := TStringStream.Create('');

  try

    URL := 'http://' + dao.Q2.fieldbyname('site').AsString + 'admin/login_imp.php?';
    URL := URL + 'login=' + dao.Q2.fieldbyname('USUARIO_SITE').AsString;
    URL := URL + '&senha=' + dao.Q2.fieldbyname('LOGIN_SITE').AsString;

    idHttpGeral.Request.UserAgent := 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)';
    idHttpGeral.Request.ContentType := 'text/xml';
    Xml.Text := idHttpGeral.post(URL, Resposta);
  except
    exit;
  end;

  XMLGeral.Active := true;
  XMLGeral.Encoding := 'iso-8859-1';
  XMLGeral.LoadFromXML(Xml.Text);

  logado := XMLGeral.DocumentElement.ChildNodes['resultado'].NodeValue;

  Consulta.free;
  Resposta.free;

  XMLGeral.Active := false;

  Result := logado = 'LOGADO';
end;

function TFMFUN.AtualizarSite(Parametros: TStringStream): boolean;
var
  Resposta: TStringStream;
  URL: string;
begin

  if not LoginSite then
  begin
    Result := false;
    exit;
  end;

  Resposta := TStringStream.Create('');

  URL := 'http://' + dao.Q2.fieldbyname('site').AsString + 'admin/importar.php?';

  try
    idHttpGeral.Request.ContentType := 'application/x-www-form-urlencoded';
    idHttpGeral.post(URL, Parametros, Resposta);

    Resposta.free;
    Result := true;
  except
    Result := false;
    exit;
  end;

end;

function TFMFUN.ChecarPrazoAtualizacaoVendedor: boolean;
var
  prazo_atualizar, ultimo_envio_pedidos, hoje: Tdate;
  function ChecarPrazo(Data: Tdate): boolean;
  begin
    Result := Data < prazo_atualizar;
    if (prazo_atualizar - Data) = 1 then
      MessageDlg('Falta 1 dia para efetuar a Atualização de Dados.', mtWarning, [mbOK], 0);
  end;

begin
  dao.Geral1
    ('SELECT coalesce(a.VENDOR_PRAZO_ATUALIZAR, current_date-2) prazo, coalesce(a.DATA_ULTIMO_ENVIO, current_date) as ultimo_envio, current_date AS HOJE FROM CONFIGURACAO a where a.cod_conf = 1');
  prazo_atualizar := dao.q1.fieldbyname('prazo').AsDateTime;
  ultimo_envio_pedidos := dao.q1.fieldbyname('ultimo_envio').AsDateTime;
  hoje := dao.q1.fieldbyname('hoje').AsDateTime;

  if ultimo_envio_pedidos <= hoje then
    Result := ChecarPrazo(hoje)
  else
    Result := ChecarPrazo(ultimo_envio_pedidos)
end;

function TFMFUN.GerarCodigoMobile(codigo: Integer): Integer;
var
  codigo_mobile: Integer;
  cmd: string;
begin
  repeat
    codigo_mobile := Random(999999);
    dao.Geral3('select id, mobile from representante where mobile = ' + inttostr(codigo_mobile));
  until dao.Q3.IsEmpty and (codigo_mobile > 100000);

  dao.Geral3('select id, mobile from representante where id = ' + inttostr(codigo));

  if Not dao.Q3.fieldbyname('mobile').IsNull then
    exit;

  try
    //if dao.cn.InTransaction then
      dao.cn.StartTransaction;

    cmd := 'update representante set mobile = ' + inttostr(codigo_mobile) + ' where  id = ' + inttostr(codigo);
    dao.Exec_sql.sql.Clear;
    dao.Exec_sql.sql.Add(cmd);
    dao.Exec_sql.ExecSQL;

    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;

end;

{$ENDIF}

procedure TFMFUN.AvisoRepresentantesVisitas(representante: string);
var
  sql, ddd, fone, email, corpo_email, email_html, zebra_html, assunto_email, CIDADE: string;
begin
  sql := ' SELECT a.COD_CLIENTE||''-''||a.NOM_CLIENTE as cliente, a.ULTIMA_FREQUENCIA, R.ID||''-''||R.NOM_REPRESENTANTE as rep, R.EMAIL,  ' +
    '  a.ENDERECO||'', ''||a.NR_ENDERECO||'' - ''||A.BAIRRO||'' - ''||CD.NOM_CIDADE||''-''||CD.UF AS ENDERECO, CD.NOM_CIDADE||''-''||CD.UF as CIDADE ' + ' FROM CLIENTE a ' +
    ' INNER JOIN REPRESENTANTE R ON R.ID = A.ID_REPRESENTANTE ' + ' INNER JOIN CIDADES CD ON CD.COD_CIDADE = A.COD_CIDADE ' + ' WHERE ' +
    '  (A.ULTIMA_FREQUENCIA + CAST(a.PERIODO_FREQUENCIA_VISITAS AS INTEGER)) < current_date and ' + '  A.ID_REPRESENTANTE = ' + representante + ' AND ' + '  A.CLIENTE_BLOQUEADO <> ''S'' ' +
    '  ORDER BY CD.NOM_CIDADE, A.BAIRRO, A.ENDERECO, A.ULTIMA_FREQUENCIA DESC ';
  dao.Geral1(sql);

  // email := dao.q1.fieldbyname('EMAIL').AsString;
  email := 'informatica@plasfan.ind.br';

  assunto_email := 'CLIENTES À VISITAR';
  email_html := ' <META HTTP-EQUIV="Content-Type" CONTENT="text/html;charset=iso-8859-1"> ' + ' <html> ' + '  <style> ' +
    '     .tr1{ font-family:"Lucida Grande", "Lucida Sans Unicode", "Trebuchet MS", Helvetica, Arial, sans-serif; ' + '           font-size: 10px; ' + '         	background-color: #E6E6FA; ' +
    '           color: #565656;} ' + '     .tr2{ font-family:"Lucida Grande", "Lucida Sans Unicode", "Trebuchet MS", Helvetica, Arial, sans-serif; ' + '           background-color: #D8D8D8; ' +
    '           color: #565656; ' + '           font-size: 10px;)} ' + '     .tr3{ font-family:"Lucida Grande", "Lucida Sans Unicode", "Trebuchet MS", Helvetica, Arial, sans-serif; ' +
    '           background-color: #BDB76B; ' + '           color: #565656; ' + '           font-size: 10px;} ' + ' </style> ' + ' <body bgcolor="#8FBC8F"> ' + ' <table width="100%" class="tabela1"> '
    + '   <thead align="left"> ' + '     <tr class="tr1"><th colspan="3" align="center">' + dao.q1.fieldbyname('rep').AsString + '</th></tr> ' +
    '     <tr class="tr1"><th align="left" WIDTH="30%">CLIENTE</th><th align="left" WIDTH="50%">ENDERECO</th><th align="center" WIDTH="20%">ULTIMA FREQUENCIA</th></tr> ' + '   </thead> ' +
    ' <tbody> ';
  zebra_html := '<tr class="tr1">';
  CIDADE := '';
  while not dao.q1.Eof do
  begin

    if CIDADE <> dao.q1.fieldbyname('CIDADE').AsString then
    begin

      if zebra_html = '<tr class="tr1">' then
        zebra_html := '<tr class="tr2">'
      else
        zebra_html := '<tr class="tr1">';

      CIDADE := dao.q1.fieldbyname('CIDADE').AsString;
    end;

    email_html := email_html + zebra_html + '  <td align="left">' + dao.q1.fieldbyname('CLIENTE').AsString + '</td> ' + '  <td align="left">' + dao.q1.fieldbyname('ENDERECO').AsString + '</td> ' +
      '  <td align="center">' + FormatDateTime('dd/mm/yyyy', dao.q1.fieldbyname('ULTIMA_FREQUENCIA').AsDateTime) + '</td></tr> ';

    dao.q1.Next;
  end;

  email_html := email_html + ' </tbody></table></body></html> ';

{$IFDEF ORBIPALM}
  if not dao.q1.IsEmpty then
    fmPrincipal.envia_email(email_html, assunto_email, email, '', '', '', 'informatica@plasfan.ind.br', '', '');
{$ENDIF}
end;

procedure TFMFUN.AvisoContasReceber(conta: string; tipo: Integer);
var
  back_color, estilo_linha, Titulo, email_html, zebra_html, sql_tipo, assunto_email, nome_conta: string;
  total_boleto: real;
  function BuscaBanco: string;
  begin
    dao.Geral1('select trim(b.NOM_BANCO)||'' ''||trim(c.NR_AGENCIA)||'' ''||trim(c.NR_CONTA) as banco from CONTA_CORRENTE c inner join banco b on b.ID = c.ID_BANCO where c.id = ' + conta);
    Result := dao.q1.fieldbyname('banco').AsString;
  end;

begin
  nome_conta := BuscaBanco;
  case tipo of
    1:
      begin
        back_color := '#8FBC8F';
        Titulo := nome_conta + ' | LISTA DE CONTAS VENCIDAS E ANTES DA DATA DE PROTESTO | ' + FormatDateTime('dd/mm/yyyy', now);
        assunto_email := '[ORBI][' + nome_conta + '][Lista de Contas Vencidas e Antes da Data de Protesto][' + FormatDateTime('dd/mm/yyyy', now) + '][Não responder]';
        sql_tipo := ' c.DTAREC is null and c.DTAVEN <= current_date and c.DTAVEN+5 > current_date and ';
      end;
    2:
      begin
        back_color := '#EEDD82';
        Titulo := BuscaBanco + ' | LISTA DE CONTAS VENCIDAS E APÓS A DATA DE PROTESTO E ANTES DA DATA LIMITE DE PROTESTO | ' + FormatDateTime('dd/mm/yyyy', now);
        assunto_email := '[ORBI][' + nome_conta + '][Lista de Contas Vencidas, Após a Data de Protesto e Antes da Data Limite de Protesto][' + FormatDateTime('dd/mm/yyyy', now) + '][Não responder]';
        sql_tipo := ' c.DTAREC is null and c.DTAVEN+5 <= current_date and c.DTAVEN+20 > current_date and ';
      end;
    3:
      begin
        back_color := '#FF4500';
        Titulo := BuscaBanco + ' | LISTA DE CONTAS VENCIDAS E APÓS A DATA DE PROTESTO E APÓS DA DATA LIMITE DE PROTESTO | ' + FormatDateTime('dd/mm/yyyy', now);
        assunto_email := '[ORBI][' + nome_conta + '][Lista de Contas Vencidas, Após a Data de Protesto e Após da Data Limite de Protesto][' + FormatDateTime('dd/mm/yyyy', now) + '][Não responder]';
        sql_tipo := ' c.DTAREC is null and c.DTAVEN+20 <= current_date and ';
      end;
  end;

  email_html := '<META HTTP-EQUIV="Content-Type" CONTENT="text/html;charset=iso-8859-1"> ' + '<html> ' + '<style> ' + '   .tr1{ ' +
    '   font-family:"Lucida Grande", "Lucida Sans Unicode", "Trebuchet MS", Helvetica, Arial, sans-serif; ' + '   font-size: 10px; ' + '   background-color: #E6E6FA; ' + '   color: #565656; ' +
    '   } ' + '   .tr2{ ' + '   font-family:"Lucida Grande", "Lucida Sans Unicode", "Trebuchet MS", Helvetica, Arial, sans-serif; ' + '   background-color: #D8D8D8; ' + '   color: #565656; ' +
    '   font-size: 10px; ' + ' 	} ' + '   .tr3{ ' + '   font-family:"Lucida Grande", "Lucida Sans Unicode", "Trebuchet MS", Helvetica, Arial, sans-serif; ' + '   background-color: #BDB76B; ' +
    '   color: #565656; ' + '   font-size: 10px; ' + '   } ' + '</style> ' + '<body bgcolor="' + back_color + '"> ' + '<table width="100%" class="tabela1"> ' + '   <thead align="left"> ' +
    '     <tr class="tr1"> ' + '       <th align="center" colspan=8>' + Titulo + '</th> ' + '     </tr> ' + '     <tr class="tr2"> ' +
    '       <th align="center">VENCIMENTO</th><th align="center">PROTESTO</th><th align="center">LIMITE</th><th align="center">PEDIDO</th>     <th align="center">TÍTULO</th>     <th>CLIENTE</th>     <th align="center">VALOR</th>     <th>HISTÓRICO</th> '
    + '     </tr> ' + '   </thead> ' + '   <tbody> ';

  dao.Geral2('SELECT ' + #13 + '  c.DTAVEN                              as VCTO, ' + #13 + '  c.DTAVEN + 5                          as PROTESTO, ' + #13 +
    '  C.DTAVEN + 20                         as LIMITE, ' + #13 + '  C.NR_DOCUMENTO                        as PEDIDO, ' + #13 + '  C.TITULO||''-''||C.SEQUENCIA          as TITULO, ' + #13 +
    '  CL.COD_CLIENTE||''-''||CL.NOM_CLIENTE as CLIENTE, ' + #13 + '  C.VALOR                               as VALOR, ' + #13 + '  COALESCE(C.HISTORICO,'''')            as HISTORICO ' + #13 + 'FROM '
    + #13 + '  CR1 c ' + #13 + 'inner join vendas1 v on v.NUMDOC = c.NR_DOCUMENTO ' + #13 + 'inner join cliente cl on cl.cod_cliente = c.COD_CLIENTE ' + #13 + 'where ' + #13 + sql_tipo +
    '  v.CONTA_BOLETO = ' + conta + #13 + 'order by c.dtaven desc, c.NR_DOCUMENTO');
  dao.Q2.First;
  zebra_html := '<tr class="tr1">';
  total_boleto := 0;
  while not dao.Q2.Eof do
  begin

    if zebra_html = '<tr class="tr1">' then
      zebra_html := '<tr class="tr2">'
    else
      zebra_html := '<tr class="tr1">';

    email_html := email_html + zebra_html + '  <td align="center">' + FormatDateTime('dd/mm/yyyy', dao.Q2.fieldbyname('vcto').AsDateTime) + '</td> ' + '  <td align="center">' +
      FormatDateTime('dd/mm/yyyy', dao.Q2.fieldbyname('protesto').AsDateTime) + '</td> ' + '  <td align="center">' + FormatDateTime('dd/mm/yyyy', dao.Q2.fieldbyname('limite').AsDateTime) + '</td> ' +
      '  <td align="center">' + dao.Q2.fieldbyname('PEDIDO').AsString + '</td> ' + '  <td align="center">' + dao.Q2.fieldbyname('TITULO').AsString + '</td> ' + '  <td>' + dao.Q2.fieldbyname('CLIENTE')
      .AsString + '</td> ' + '  <td align="right">' + FormatFloat('R$ #,###,##0.00', dao.Q2.fieldbyname('VALOR').AsCurrency) + '</td> ' + '  <td>' + dao.Q2.fieldbyname('HISTORICO').AsString + '</td> '
      + ' </tr> ';
    total_boleto := total_boleto + dao.Q2.fieldbyname('VALOR').AsCurrency;
    dao.Q2.Next;
  end;

  email_html := email_html + ' </tbody> ' + ' <tfoot> ' + '    <tr class="tr3"> ' + '     <td align="right" colspan=6>TOTAL</td> ' + '     <td align="right">' +
    FormatFloat('R$ #,###,##0.00', total_boleto) + '</td> ' + '     <td></td> ' + '    </tr> ' + ' </tfoot> ' + '</table> ' + '</body> ' + '</html> ';

  dao.Geral3('SELECT A.AVISO_CONTA_VENCIDA_EMAIL1,  A.AVISO_CONTA_VENCIDA_EMAIL2,  A.AVISO_CONTA_VENCIDA_EMAIL3 FROM CONFIGURACAO a');

{$IFDEF ORBIPALM}
  if not dao.Q3.IsEmpty then
    fmPrincipal.envia_email(email_html, assunto_email, dao.Q3.fieldbyname('AVISO_CONTA_VENCIDA_EMAIL1').AsString, dao.Q3.fieldbyname('AVISO_CONTA_VENCIDA_EMAIL2').AsString, '', '',
      'informatica@plasfan.ind.br', '', '')
{$ENDIF}
end;

procedure TFMFUN.VendasRepresentantesEmail(dia_semana: string; telemarketing: boolean);
var
  sql_vendas, email_corpo, assunto_email, cor_linha1, cor_linha2, cor_linha3, cor_linha4: string;
  semana_mes: array of string;
  x: Integer;
  procedure ListaVendas(semana: string);
  var
    sql_semana, sql_telemarketing, titulo_semana, titulo_telemarketing: string;
    total_plasfan, total_mecatool, total_kaua, total_ideal, total_geral: real;
  begin
    dao.Geral2('SELECT (CURRENT_DATE -1) AS DATA, ' + 
	           '  (SELECT b.MES ' + 
			   '   FROM CALENDARIO b ' + 
			   '   where ' + 
			   '     extract(weekday from b.Data) not in (0,6) and ' +
               '     b.MES = case when extract(month from current_date) < 10 then ''0''||extract(month from current_date)||''/''||extract(year from current_date) else extract(month from current_date)||''/''||extract(year from current_date) end ' + 
			   '   order by b.data limit 1) as mes, ' + 
			   '  (SELECT b.DATA ' + 
			   '   FROM CALENDARIO b ' + 
			   '   where ' + 
			   '    extract(weekday from b.Data) not in (0,6) and ' +
               '    (extract(yearday from b.DATA)-extract(weekday from b.DATA)+7)/7 = ' + semana + ' and ' +
               '     b.MES = case when extract(month from current_date) < 10 then ''0''||extract(month from current_date)||''/''||extract(year from current_date) else extract(month from current_date)||''/''||extract(year from current_date) end ' + 
			   '   order by b.data limit 1) as inicio, ' + 
			   '  (SELECT b.DATA ' + 
			   '   FROM CALENDARIO b ' + 
			   '   where ' + 
			   '  extract(weekday from b.Data) not in (0,6) and ' +
               '    (extract(yearday from b.DATA)-extract(weekday from b.DATA)+7)/7 = ' + semana + ' and ' +
               '     b.MES = case when extract(month from current_date) < 10 then ''0''||extract(month from current_date)||''/''||extract(year from current_date) else extract(month from current_date)||''/''||extract(year from current_date) end ' + 
			   '   order by b.data desc limit 1) as fim ' + 
			   'from ' + 
			   '  CONFIGURACAO');

    if telemarketing then
    begin
      sql_telemarketing := '  R.FUNCIONARIO IN (4) and ';
      titulo_telemarketing := 'TELEMARKETING';
      assunto_email := '[ORBI][Vendas Telemarketing][' + FormatDateTime('dd/mm/yyyy', now) + '][Não responder]';
    end
    else
    begin
      sql_telemarketing := '  R.FUNCIONARIO IN (0,1) and ';
      titulo_telemarketing := 'REPRESENTANTES';
      assunto_email := '[ORBI][Vendas Representante][' + FormatDateTime('dd/mm/yyyy', now) + '][Não responder]';
    end;

    if semana = '-1' then
    begin
      sql_semana := ' a.data  = (current_date-1) ';
      titulo_semana := 'RESUMO DE VENDAS - ' + titulo_telemarketing + ' - ' + FormatDateTime('DD/MM/YYYY', dao.Q2.fieldbyname('DATA').AsDateTime);
      cor_linha1 := 'tr9';
      cor_linha2 := 'tr10';
      cor_linha3 := 'tr11';
      cor_linha4 := 'tr12';
    end
    else if semana = '0' then
    begin
      sql_semana :=
        ' case when extract(month from A.Data) < 10 then ''0''||extract(month from A.Data)||''/''||extract(year from A.Data) else extract(month from A.Data)||''/''||extract(year from A.Data) end  = '
        + ' case when extract(month from current_date) < 10 then ''0''||extract(month from current_date)||''/''||extract(year from current_date) else extract(month from current_date)||''/''||extract(year from current_date) end ';
      titulo_semana := 'RESUMO DE VENDAS - ' + titulo_telemarketing + ' - ' + dao.Q2.fieldbyname('MES').AsString;
      cor_linha1 := 'tr4';
      cor_linha2 := 'tr5';
      cor_linha3 := 'tr6';
      cor_linha4 := 'tr8';
    end
    else
    begin
      sql_semana := '(extract(yearday from A.Data)-extract(weekday from A.Data)+7)/7 = ' + semana;
      titulo_semana := 'RESUMO DE VENDAS - ' + titulo_telemarketing + ' - ' + dao.Q2.fieldbyname('INICIO').AsString + ' À ' + dao.Q2.fieldbyname('FIM').AsString;
      cor_linha1 := 'tr1';
      cor_linha2 := 'tr2';
      cor_linha3 := 'tr3';
      cor_linha4 := 'tr7';
    end;

    sql_vendas := 'SELECT ' + '   R.NOM_REPRESENTANTE, ' + '   coalesce(( ' + '     SELECT SUM(a.VALOR) AS TOTAL ' + '     FROM VENDAS_REPRESENTANTE a ' + '     where ' +
      '       a.ORIGEM = ''PLASFAN'' and ' + '       A.COD_REPRESENTANTE = R.ID and ' + sql_semana + '   ),0) AS PLASFAN, ' + '   coalesce(( ' + '     SELECT SUM(a.VALOR) AS TOTAL ' +
      '     FROM VENDAS_REPRESENTANTE a ' + '     where ' + '       a.ORIGEM = ''MECATOOL'' and ' + '       A.COD_REPRESENTANTE = R.ID and ' + sql_semana + '   ),0) AS MECATOOL, ' + '   coalesce(( ' +
      '     SELECT SUM(a.VALOR) AS TOTAL ' + '     FROM VENDAS_REPRESENTANTE a ' + '     where ' + '       A.COD_REPRESENTANTE = R.ID and ' + sql_semana + '   ),0) AS TOTAL ' + 'from  ' +
      '  REPRESENTANTE R ' + 'WHERE ' + sql_telemarketing + ' R.ATIVO = ''S''';
    dao.Geral1(sql_vendas);

    email_corpo := email_corpo + ' <table width="100%" class="tabela1"> ' + '	<thead align="left"> ' + '   <tr class="' + cor_linha4 + '"> ' + '     <th align="center" colspan=4>' + titulo_semana +
      '</th>' + '   </tr> ' + '   <tr class="' + cor_linha2 + '"> ' + '     <th align="center">REPRESENTANTE</th> ' + '     <th align="center">PLASFAN</th> ' + '     <th align="center">MECATOOL</th> '
      + '     <th align="center">TOTAL</th> ' + '   </tr> ' + ' </thead> ' + '	<tbody> ';

    total_plasfan := 0;
    total_mecatool := 0;
    total_kaua := 0;
    total_ideal := 0;
    total_geral := 0;

    while not dao.q1.Eof do
    begin
      email_corpo := email_corpo + '   <tr class="' + cor_linha1 + '"> ' + '     <td align="left">' + dao.q1.fieldbyname('NOM_REPRESENTANTE').AsString + '</td> ' + '     <td align="right">' +
        FormatFloat('R$ #,###,##0.00', dao.q1.fieldbyname('PLASFAN').AsCurrency) + '</td> ' + '     <td align="right">' + FormatFloat('R$ #,###,##0.00', dao.q1.fieldbyname('MECATOOL').AsCurrency) +
        '</td> ' + '     <td align="right"><b>' + FormatFloat('R$ #,###,##0.00', dao.q1.fieldbyname('TOTAL').AsCurrency) + '</b></td> ' + '   </tr>  ';

      total_plasfan := total_plasfan + dao.q1.fieldbyname('PLASFAN').AsCurrency;
      total_mecatool := total_mecatool + dao.q1.fieldbyname('MECATOOL').AsCurrency;
      total_geral := total_geral + dao.q1.fieldbyname('TOTAL').AsCurrency;

      dao.q1.Next;
    end;

    email_corpo := email_corpo + ' <tr class="' + cor_linha3 + '"> ' + '   <td align="left"><b>TOTAL</i></b></td> ' + '   <td align="right"><b>' + FormatFloat('R$ #,###,##0.00', total_plasfan) +
      '</b></td> ' + '   <td align="right"><b>' + FormatFloat('R$ #,###,##0.00', total_mecatool) + '</b></td> ' + '   <td align="right"><b>' + FormatFloat('R$ #,###,##0.00', total_geral) +
      '</b></td> ' + ' </tr> ' + ' </table>';

  end;

begin
  dao.Geral1(' SELECT distinct (extract(yearday from A.Data)-extract(weekday from A.Data)+7)/7 as semana ' + ' FROM CALENDARIO a ' + ' where ' + '  extract(weekday from A.Data) not in (0,6) and ' +
    '  a.MES = case when extract(month from current_date) < 10 then ''0''||extract(month from current_date)||''/''||extract(year from current_date) else extract(month from current_date)||''/''||extract(year from current_date) end and '
    + '  (extract(yearday from A.Data)-extract(weekday from A.Data)+7)/7 = (extract(yearday from current_date)-extract(weekday from current_date)+7)/7');

  SetLength(semana_mes, dao.q1.RecordCount);
  x := 0;
  while not dao.q1.Eof do
  begin
    semana_mes[x] := dao.q1.fieldbyname('semana').AsString;
    x := x + 1;
    dao.q1.Next;
  end;

  email_corpo := '<META HTTP-EQUIV="Content-Type" CONTENT="text/html;charset=iso-8859-1"> ' + '<html> ' + '<style> ' + '  .tr1{  ' +
    '    font-family:"Lucida Grande", "Lucida Sans Unicode", "Trebuchet MS", Helvetica, Arial, sans-serif; ' + '    font-size: 10px; ' + '  	background-color: #E6E6FA; ' + '  	color: #565656; ' +
    '  } ' + '  .tr2{ ' + '    font-family:"Lucida Grande", "Lucida Sans Unicode", "Trebuchet MS", Helvetica, Arial, sans-serif; ' + ' 	  background-color: #D8D8D8; ' + ' 	  color: #565656; ' +
    '  	font-size: 10px; ' + '  } ' + '  .tr3{ ' + '    font-family:"Lucida Grande", "Lucida Sans Unicode", "Trebuchet MS", Helvetica, Arial, sans-serif; ' + ' 	  background-color: #BDB76B; ' +
    '	  color: #565656; ' + '	  font-size: 10px; ' + '  } ' + '  .tr4{ ' + '    font-family:"Lucida Grande", "Lucida Sans Unicode", "Trebuchet MS", Helvetica, Arial, sans-serif; ' +
    ' 	  font-size: 10px; ' + '	  background-color: #87CEEB; ' + ' 	  color: #565656; ' + '  } ' + '  .tr5{ ' +
    '    font-family:"Lucida Grande", "Lucida Sans Unicode", "Trebuchet MS", Helvetica, Arial, sans-serif; ' + ' 	  background-color: #3CB371; ' + '	  color: #565656; ' + '	  font-size: 10px; ' +
    '  } ' + '  .tr6{ ' + '    font-family:"Lucida Grande", "Lucida Sans Unicode", "Trebuchet MS", Helvetica, Arial, sans-serif; ' + '	  background-color: #5F9EA0; ' + ' 	  color: #565656; ' +
    '	 font-size: 10px; ' + '	} ' + '  .tr7{ ' + '    font-family:"Lucida Grande", "Lucida Sans Unicode", "Trebuchet MS", Helvetica, Arial, sans-serif; ' + '	  background-color: #8B7E66; ' +
    ' 	  color: #F5F5F5; ' + '	 font-size: 10px; ' + '	} ' + '  .tr8{ ' + '    font-family:"Lucida Grande", "Lucida Sans Unicode", "Trebuchet MS", Helvetica, Arial, sans-serif; ' +
    '	  background-color: #53868B; ' + ' 	  color: #F5F5F5; ' + '	 font-size: 10px; ' + '	} ' + '  .tr9{ ' +
    '    font-family:"Lucida Grande", "Lucida Sans Unicode", "Trebuchet MS", Helvetica, Arial, sans-serif; ' + '	  background-color: #F5F6CE;' + ' 	  color: #8A0808; ' + '	 font-size: 10px; ' +
    '	} ' + '  .tr10{ ' + '    font-family:"Lucida Grande", "Lucida Sans Unicode", "Trebuchet MS", Helvetica, Arial, sans-serif; ' + '	  background-color: #F5BCA9; ' + ' 	  color: #8A2908; ' +
    '	 font-size: 10px; ' + '	} ' + '  .tr11{ ' + '    font-family:"Lucida Grande", "Lucida Sans Unicode", "Trebuchet MS", Helvetica, Arial, sans-serif; ' + '	  background-color: #FAAC58; ' +
    ' 	  color: #5F4C0B; ' + '	 font-size: 10px; ' + '	} ' + '  .tr12{ ' + '    font-family:"Lucida Grande", "Lucida Sans Unicode", "Trebuchet MS", Helvetica, Arial, sans-serif; ' +
    '	  background-color: #F7D358; ' + ' 	  color: #61380B; ' + '	 font-size: 10px; ' + '	} ' + '  </style> ' + '<body bgcolor="#E0FFFF">  ';

  ListaVendas('-1');
  for x := 0 to length(semana_mes) - 1 do
  begin
    ListaVendas(semana_mes[x]);
  end;
  ListaVendas('0');

  email_corpo := email_corpo + '</body></html>';

  dao.Geral3('SELECT a.AVISO_VENDAS_EMAIL1, a.AVISO_VENDAS_EMAIL2, a.AVISO_VENDAS_EMAIL3 FROM CONFIGURACAO a ');

{$IFDEF ORBIPALM}
  fmPrincipal.envia_email(email_corpo, assunto_email, dao.Q3.fieldbyname('AVISO_VENDAS_EMAIL1').AsString, dao.Q3.fieldbyname('AVISO_VENDAS_EMAIL2').AsString, '', '',
    'informatica@plasfan.ind.br', '', '')
{$ENDIF}
end;

function TFMFUN.TamanhoArquivo(Arquivo: string): Integer;
begin
  with TFileStream.Create(Arquivo, fmOpenRead or fmShareExclusive) do
    try
      Result := Size;
    finally
      free;
    end;
end;

function TFMFUN.TraceStackLineOut(MapModuleName, ProcedureName: String; Line: Integer; FileName: String): string;
var
  ds: String;
begin
  ds := ' Module: ' + MapModuleName + ' / Procedure: ' + ProcedureName + ' / Line:' + inttostr(Line) + ' / Source File: ' + FileName;
  Result := ds;
end;

procedure TFMFUN.LogException;
var
  LStringOut: TStringList;
  Path: string;
begin
  LStringOut := TStringList.Create;

  LStringOut.Add(DateTimeToStr(now));

  // Log unhandled exception stack info to ExceptionLogMemo
  // JclLastExceptStackListToStrings(LStringOut, false, true, true, false);

  // Insert empty line
  LStringOut.Add('');
  Path := extractFilePath(Application.ExeName);
  LStringOut.SaveToFile(Path + 'Erros.log');
  LStringOut.free;

end;

procedure TFMFUN.AvisoEstoqueMinimo(email: string);
var
  sql, ddd, fone, corpo_email, email_html, zebra_html, assunto_email, CIDADE: string;
begin
  sql := 'SELECT ' + '  a.COD_PRODUTO, ' + '  TRIM(a.NOM_PRODUTO) AS NOM_PRODUTO, ' + '  a.UNIDADE, ' + '  a.QTD_ESTOQUE, ' + '  a.ESTOQUE_MINIMO, ' +
    '  COALESCE(f.COD_FORNECEDOR, 0) as COD_FORNECEDOR, ' + '  COALESCE(F.RAZAO_SOCIAL, ''OUTROS'') AS NOME_FORNECEDOR ' + 'FROM  ' + '  PRODUTO a  ' +
    'left outer join fornecedor f on f.COD_FORNECEDOR = a.FORNECEDOR_PRINCIPAL  ' + 'WHERE  ' + '  a.STATUS <> ''S'' and  ' + '  a.REVENDA = ''S'' and   ' + '  a.INDISPONIVEL <> ''S'' AND  ' +
    '  A.QTD_ESTOQUE < A.ESTOQUE_MINIMO  ' + 'ORDER BY NOME_FORNECEDOR, A.NOM_PRODUTO   ';
  dao.Geral1(sql);

  assunto_email := 'AVISO ESTOQUE MÍNIMO - ' + FormatDateTime('DD/MM/YYYY', Date);
  email_html := ' <META HTTP-EQUIV="Content-Type" CONTENT="text/html;charset=iso-8859-1"> ' + ' <html> ' + '  <style> ' +
    '     .tr1{ font-family:"Lucida Grande", "Lucida Sans Unicode", "Trebuchet MS", Helvetica, Arial, sans-serif; ' + '           font-size: 10px; ' + '         	background-color: #E6E6FA; ' +
    '           color: #565656;} ' + '     .tr2{ font-family:"Lucida Grande", "Lucida Sans Unicode", "Trebuchet MS", Helvetica, Arial, sans-serif; ' + '           background-color: #D8D8D8; ' +
    '           color: #565656; ' + '           font-size: 10px;)} ' + '     .tr3{ font-family:"Lucida Grande", "Lucida Sans Unicode", "Trebuchet MS", Helvetica, Arial, sans-serif; ' +
    '           background-color: #BDB76B; ' + '           color: #565656; ' + '           font-size: 10px;} ' + ' </style> ' + ' <body bgcolor="#8FBC8F"> ' + ' <table width="100%" class="tabela1"> '
    + '   <thead align="left"> ' +
    '     <tr class="tr1"><th align="left" WIDTH="70%">PRODUTO</th><th align="center" WIDTH="10%">UN</th><th align="center" WIDTH="10%">ESTOQUE</th><th align="center" WIDTH="10%">MÍNIMO</th></tr> ' +
    '   </thead> ' + ' <tbody> ';
  zebra_html := '<tr class="tr1">';

  while not dao.q1.Eof do
  begin
    if zebra_html = '<tr class="tr1">' then
      zebra_html := '<tr class="tr2">'
    else
      zebra_html := '<tr class="tr1">';

    email_html := email_html + zebra_html + '  <td align="left">' + dao.q1.fieldbyname('COD_PRODUTO').AsString + '-' + dao.q1.fieldbyname('NOM_PRODUTO').AsString + '</td> ' + '  <td align="center">' +
      dao.q1.fieldbyname('UNIDADE').AsString + '</td> ' + '  <td align="center">' + dao.q1.fieldbyname('QTD_ESTOQUE').AsString + '</td> ' + '  <td align="center">' +
      dao.q1.fieldbyname('ESTOQUE_MINIMO').AsString + '</td>' + '</tr> ';

    dao.q1.Next;
  end;

  email_html := email_html + ' </tbody></table></body></html> ';

{$IFDEF ORBIPALM}
  if not dao.q1.IsEmpty then
    fmPrincipal.envia_email(email_html, assunto_email, email, '', '', '', 'informatica@plasfan.ind.br', '', '');
{$ENDIF}
end;

function TFMFUN.StrInArray(str: String;

  const lista: Array of string): boolean;
var
  i: Integer;
begin
  for i := Low(lista) to High(lista) do
    if lista[i] = str then
    begin
      Result := true;
      exit;;
    end;
  Result := false;
end;

function TFMFUN.LiberarProcesso : Boolean;
begin
  Result := true;
  if Tipo_usuario <> '9' then
  begin
    Application.CreateForm(TFr_senha_especial, Fr_senha_especial);
    Fr_senha_especial.nivel := '9';
    Fr_senha_especial.ShowModal;
    if not liberado then
      MessageDlg('Sem Liberação para executar o processo!', mtWarning, [mbOK], 0);
    Result := liberado;
  end;
end;




procedure TFMFUN.Localizar(pChamou_Form, pChamou_pesquisa, pCaption, pChamou_cadastro, pBtCaption : string; pBtVisible: Boolean; pCamposCombo: array of string; pRevenda : string = 'S');
var
  i: Integer;
  valor_combo: string;
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  chamou_form_old := pchamou_form;
  chamou_pesquisa_old := pchamou_pesquisa;

  Fr_localizar.Caption := pCaption;
  chamou_pesquisa := pchamou_pesquisa;
  chamou_form := pChamou_Form;
  chamou_cadastro := pChamou_cadastro;
  revenda := pRevenda;

  Fr_localizar.BT_cadastro.Caption := pBtCaption;
  Fr_localizar.BT_cadastro.Visible := pBtVisible;

  for i := 0 to Length(pCamposCombo)-1 do
    Fr_localizar.CBcampos.Items.Add(pCamposCombo[i]);
  Fr_localizar.CBcampos.ItemIndex := 1;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;
end;
end.




