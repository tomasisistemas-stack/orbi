unit Un_nfe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, ActiveX, Forms,
  pcnConversaoNfe, DateUtils, strutils,
  Math, Controls, pcnConversao,
  IdFTPCommon, XMLIntf;

type
  TNFe = class(TThread)
  private
    tipAmb: integer;
    cont: integer;
    num_nfe: integer;
    empresa: integer;
    pedido: integer;
    erro, finalizado: boolean;
    chave_nfe: string;
    recibo, msgerros, status, motivo: WideString;
    ChaveNFe, PathLote, pathSaida, arquivo_procnfe, arquivo_ReciboNFe,
      arquivo_nfe: string;
    procedure Execute; override;
    procedure monta_NFE;
    function GerarXMLProcNFe: boolean;
    procedure TransfereNfeFTP;
    procedure Mostra;
    function MontaChaveAcessoNFe(codUF: integer; dtEmissao: TDateTime;
      CNPJ: string; Modelo, Serie, NumeroNF, TpEmis, CodigoNumerico
      : integer): string;

  public
    tipo: integer; // 0 - Saida; 1 - Entrada;
    constructor Create(nr_nfe, nr_pedido, cod_empresa: integer;
      ChaveNFe: string = '');

  end;

  TNFePedido = class(TNFe)
  private
    procedure Execute; override;
    procedure GravarChaveNfe;
    procedure EnviarLote(arquivo: string);
    procedure GravarReciboNfe;
  public
    constructor Create(nr_nfe, nr_pedido, cod_empresa: integer);
  end;

  TNFeRecXml = class(TNFe)
  private
    procedure Execute; override;
  public
    constructor Create(nr_nfe, nr_pedido, cod_empresa: integer;
      ChaveNFe: string);
  end;

implementation

uses {$IFDEF ORBI}UnPri, frmMontaXML, Un_dm, {$ENDIF}Un_dao, Unfun,
  un_nfe_transmissao,
   ACBrNFeWebServices;

procedure TNFe.Execute;
begin
  try
    CoInitialize(nil);
    monta_NFE;

  finally
    CoUnInitialize;
{$IFDEF ORBI}frpri.HabilitaTimers;
{$ENDIF}
  end;
end;

function TNFe.MontaChaveAcessoNFe(codUF: integer; dtEmissao: TDateTime;
  CNPJ: string; Modelo, Serie, NumeroNF, TpEmis, CodigoNumerico
  : integer): string;
var
  emissao: string[10];
  chave, strCodNumerico: string;

begin
  emissao := formatdatetime('DD/MM/YY', dtEmissao);

  // CodigoNumerico := (2 * StrToInt(FormatDateTime('ddmmyy', dtEcmissao))) + NumeroNF; Esse Código Gera uma Chave mais previsivel...
  strCodNumerico := Copy(fmfun.enchezero(inttostr(CodigoNumerico), 8), 1, 8);

  chave := inttostr(codUF) + Copy(emissao, 7, 2) + Copy(emissao, 4, 2) +
    fmfun.LimpaCNPJ(CNPJ) + fmfun.enchezero(inttostr(Modelo), 2) +
    fmfun.enchezero(inttostr(Serie), 3) + fmfun.enchezero(inttostr(NumeroNF), 9)
    + fmfun.enchezero(inttostr(TpEmis), 1) +
    fmfun.enchezero(inttostr(CodigoNumerico), 8);
  // [Versao 2.0] Agora com 8 Caracteres para poder incluir o Campo TpEmis Sem alterar o tamanho da Chave = 44...

  // ID := fmfun.Modulo11(chave);
  Result := chave + fmfun.Modulo11(chave);
end;

constructor TNFe.Create(nr_nfe, nr_pedido, cod_empresa: integer;
  ChaveNFe: string = '');
begin
  inherited Create(True);
  { Chama o contrutor herdado. Ele irá temporariamente colocar o thread em estado de espera para depois executá-lo. }
  num_nfe := nr_nfe;
  empresa := cod_empresa;
  chave_nfe := ChaveNFe;
  pedido := nr_pedido;
  FreeOnTerminate := True; // Libera o objeto após terminar.
  Priority := TpLower;
  { Configura sua prioridade na lista de processos do Sistema operacional. }
  Resume; // Inicia o Thread.
end;

procedure TNFe.monta_NFE;
var
  strResultado: WideString;
  iAno, intResultado, CodigoNumerico, i, j, h: integer;
  smensagem: WideString;
  strChaveAcesso: string;
  VST, VBCST, TotICMSSimples, ICMSSimples: currency;
  Fnf: file;
  assXML: TextFile;
  nr_erro: integer;
  xmldoc, ref, nome, xmlassinado, mensagem: WideString;
  obs_st, path, slInfCpl, cmd, Numdoc: string;
  SimplesICMS, CestaBasica, SubstituicaoTributaria,
    SubstituicaoTributariaRetida, Cheque, Dinheiro, Deposito,
    Industria: boolean;
  Aliquota_ICMS_Interno: real;

  procedure LimpaDirNF;
  var
    Ret: integer;
    F: TSearchRec;
    Pasta: string;
    data_arquivo: TDateTime;
  begin
    try
      Pasta := ExtractFilePath(Application.ExeName) + '\nf\';
      Ret := FindFirst(Pasta + '*.xml', faAnyFile, F);
      while Ret = 0 do
      begin
        DeleteFile(Pasta + F.Name);
        Ret := FindNext(F);
      end;
    finally
      //
    end
  end;

  procedure EfetuaConsulta;
  begin
    cmd := 'select case when a.nfe <> ' + inttostr(num_nfe) +
      ' then 1 else 0 end as tipo, ' +
      'a.NUMDOC, (select b.nfe from vendas1 b where b.NUMDOC = a.numdoc_ref) as nfe_ref, a.HORA, a.DTADOC, a.MOTIVO_NFE_CANCEL_INTERNO, a.COD_CLIENTE, a.COD_USUARIO, a.EMPRESA_FATURAR, '
      + ' a.FATURADO, a.CONSIGNACAO, a.ORCAMENTO, a.ENTREGUE, a.TOT_BRUTO, a.DESCONTO, a.TOT_LIQUIDO, a.valordescontoadic, '
      + ' a.PRAZO_PGTO, a.COD_FOP, a.DATA_REC_NFE, a.NUM_CUPOM, a.TIPO_VENDA, a.QTD_PARCELAS, a.PONTO_USADO, '
      + ' a.USUARIO_DESFATUROU, a.COD_REPRESENTANTE, a.COD_PRAZO_PGTO, a.CUSTO_TOTAL, a.LUCRO_MEDIO, '
      + ' a.DTA_EMISSAO, a.DTA_SAIDA, a.EMPRESA_FATURAR, a.NF, a.OBSERVACOES_PEDIDO, a.OBSERVACOES_NOTA, '
      + ' a.COD_TRANSPORTADORA, a.TIPO_FRETE, a.VOLUME_NOTA, a.PESO_NOTA, a.COD_CARGA, a.VL_FRETE, '
      + ' a.CONTATO_FRETE, a.PED_IMPRESSO, a.DTA_VENCIMENTO_CONSIG, a.CANCELADO, a.CONTEM_AVARIA, '
      + ' a.CONTEM_ETIQUETA, a.MOTIVO_TROCA, a.NR_VENDA_ORIGINAL, a.PEDIDO, a.VENDA_ENVIADA, '
      + ' a.CREDITO_USADO, a.NR_PEDIDO_PALM, a.BOLETO_ANEXO, a.COD_FISCAL, a.VLR_COMISSAO, '
      + ' a.VLR_BC_ICMS, a.VLR_ICMS, a.VLR_ST, a.VLR_TOT_NF, a.VLR_BC_ICMS_ST, '
      + ' coalesce(a.CHAVE_NFE, a.CHAVE_NFE_DEV) AS CHAVE_NFE, a.VLR_DESCONTO_GERAL, '
      + ' a.RECIBO_NFE, a.STATUS_NFE, a.MOTIVO_NFE, a.DIGEST_NFE, a.PROTOCOLO_NFE, a.DATA_REC_NFE, '
      + ' a.JUSTIF_CANC_NFE, a.COD_SUPERVISOR, a.COD_FORNECEDOR, a.NFE, a.VLR_IPI, a.PALM_NR_CONEXAO, '
      + ' a.SINCRONIZAR_PALM, a.NUMDOC_REF, a.FRETE_COMBINADO, a.DT_FRETE_COMBINADO, a.EMAIL_NFE, '
      + ' a.EMAIL_PEDIDO, a.PEDIDO_VENDEDOR, a.USUARIO_CHECOU_PEDIDO_VENDEDOR, a.CONTA_BOLETO, a.AVISOGNRE, '
      + ' a.USUARIO_CHECOU_FRETE_COMBINADO, a.ABERTO_USUARIO, a.MAQUINA_USUARIO_ABERTO, A.CARTACORRECAO, '
      + ' case when (a.DATA_REC_NFE + 1) < current_timestamp THEN 1 ELSE 0 END AS PRAZO_CANCEL, a.USUARIO_LIBEROU_DESCONTO, a.MOTIVO_LIBERACAO_DESCONTO, '
      + ' c.nom_cliente, c.cnpj, c.pre_cadastro, c.desconto_maximo, CASE WHEN a.cod_cliente is not null then CASE WHEN c.IE = ''ISENTO'' THEN 1 ELSE CASE WHEN c.ie is null  and c.TIP_PESSOA = ''J'' THEN 2 ELSE 0 END END END AS ISENTO, '
      + ' r.nom_representante, r.funcionario, f.nom_fop, f.desconto as desconto_forma, pz.desconto as desconto_prazo, pz.prazo, '
      + ' a.CHAVE_NFE_DEV, a.RECIBO_NFE_DEV, a.STATUS_NFE_DEV, a.MOTIVO_NFE_DEV, a.DIGEST_NFE_DEV, a.PROTOCOLO_NFE_DEV, a.DATA_REC_NFE_DEV, a.JUSTIF_CANC_NFE_DEV, a.NFE_DEV, '
      + ' e.CNPJ as CNPJ_EMPRESA, ' + ' e.NOM_EMPRESA AS RAZAO_SOCIAL_EMPRESA, '
      + ' nfr.CHAVE_NFE as CHAVE_NFE_REF, ' +
      ' e.NOM_FANTASIA AS NOM_FANTASIA_EMPRESA, ' +
      ' e.ENDERECO AS ENDERECO_EMPRESA, ' +
      ' e.NR_ENDERECO AS NR_ENDERECO_EMPRESA, ' +
      ' e.COMPLEMENTO AS COMPLEMENTO_EMPRESA, ' +
      ' e.BAIRRO AS BAIRRO_EMPRESA, ' + ' ce.COD_IBGE as COD_IBGE_EMPRESA, ' +
      ' ce.NOM_CIDADE AS NOM_CIDADE_EMPRESA, ' + ' ce.UF AS UF_EMPRESA, ' +
      ' e.CEP AS CEP_EMPRESA, ' + ' e.FONE AS FONE_EMPRESA, ' +
      ' e.IE AS IE_EMPRESA, ' + ' E.INDUSTRIA, ' + ' e.SERIE_CERTIFICADO, ' +
      ' e.ENQUADRADA_SIMPLES, ' + ' c.cpf as CPF_CLIENTE, ' +
      ' coalesce(fn.CNPCPF, C.CNPJ)  as CNPJ_CLIENTE, ' +
      ' coalesce(FN.RAZAO_SOCIAL, C.NOM_CLIENTE) AS RAZAO_SOCIAL_CLIENTE, ' +
      ' coalesce(fn.FANTASIA, c.NOM_FANTASIA) AS NOM_FANTASIA_CLIENTE, ' +
      ' coalesce(fn.ENDERECO, c.ENDERECO) AS ENDERECO_CLIENTE, ' +
      ' coalesce(fn.NR_ENDERECO, c.NR_ENDERECO) AS NR_ENDERECO_CLIENTE, ' +
      ' coalesce(fn.COMPLEMENTO, c.COMPLEMENTO) AS COMPLEMENTO_CLIENTE, ' +

      ' coalesce(fn.BAIRRO, c.BAIRRO) AS BAIRRO_CLIENTE, ' +
      ' cd.COD_IBGE as COD_IBGE_CLIENTE, ' +
      ' cd.NOM_CIDADE AS NOM_CIDADE_CLIENTE, ' + ' cd.UF AS UF_CLIENTE, ' +
      ' coalesce(fn.CEP, c.CEP) AS CEP_CLIENTE, ' +
      ' coalesce(fn.fone, c.TELEFONE) AS FONE_CLIENTE, ' +
      ' coalesce(fn.IERG, c.IE) AS IE_CLIENTE, ' + ' T.CNPJ as CNPJ_TRANSP, ' +
      ' T.NOME AS RAZAO_SOCIAL_TRANSP, ' + ' T.ENDERECO AS ENDERECO_TRANSP, ' +
      ' T.BAIRRO AS BAIRRO_TRANSP, ' + ' ct.COD_IBGE as COD_IBGE_TRANSP, ' +
      ' ct.NOM_CIDADE AS NOM_CIDADE_TRANSP, ' + ' ct.UF AS UF_TRANSP, ' +
      ' T.CEP AS CEP_TRANSP, ' + ' T.FONE AS FONE_TRANSP, ' +
      ' T.IE AS IE_TRANSP, ' + ' cf.cod_fiscal, ' + ' cf.nome as desc_fiscal, '
      + ' V2.ID, COALESCE(V2.PROMOCAO, ''N'') AS PROMOCAO, ' + ' V2.NCM, ' +
      ' V2.TRIB_ICMS, ' + ' V2.COD_FISCAL_ITEM, ' + ' V2.CESTA_BASICA, ' +
      ' V2.COD_PRODUTO, ' + ' V2.VOLUME, ' + ' V2.QTD, ' +
      ' COALESCE(V2.PRECO_CUSTO, P.CUSTO_TOTAL) AS PRECO_CUSTO, ' +
      ' V2.PRECO_BRUTO, ' + ' V2.VLR_COMISSAO, ' + ' p.cod_grupo, ' +
      ' V2.DESCONTO, ' + ' V2.PRECO, ' + ' V2.sub_total, ' +
      ' COALESCE(V2.ipi_item, 0) AS IPI_ITEM, ' +
      ' COALESCE(V2.vlr_ipi_item,0) AS VLR_IPI_ITEM, ' +
      ' COALESCE(V2.vlr_bc,0) AS VLR_BC, ' +
      ' COALESCE(V2.icms_item, 0) AS ICMS_ITEM, ' +
      ' COALESCE(V2.vlr_icms_item,0) AS VLR_ICMS_ITEM, ' +
      ' COALESCE(V2.vlr_agr_item,0) AS VLR_AGR_ITEM, ' +
      ' COALESCE(V2.vlr_bc_st,0) AS VLR_BC_ST, ' +
      ' COALESCE(V2.vlr_icms_st,0) AS VLR_ICMS_ST, ' +
      ' CASE WHEN V2.PROMOCAO = ''S'' THEN P.PRECO_PROMOCAO ELSE P.PRECO_VENDA END PRECO_VENDA, '
      + ' p.nom_produto, ' + ' p.QTD_ESTOQUE, ' + ' p.qtd_embalagem, ' +
      ' p.CODIGO_BARRA, ' + ' p.unidade, ' + ' p.ESTOQUE_MINIMO, v2.cest, ' +
      ' p.QTD_RESERVADO, ' + ' P.GRADE_COMISSAO, ' + ' P.PESO, ' +
      ' e.cod_empresa, c.TIP_PESSOA, c.endereco, c.nr_endereco, ' +
      ' (P.PESO * V2.QTD) AS PESO_TOTAL ' + 'from vendas1 a ' +
      'left join vendas2 v2 on v2.NUMDOC = a.NUMDOC ' +
      'left join produto p on p.cod_produto = v2.cod_produto ' +
      'left join cliente c on c.cod_cliente = a.cod_cliente ' +
      'left join fornecedor fn on fn.cod_fornecedor = a.cod_fornecedor ' +
      'left join cidades cd on cd.cod_cidade = coalesce(fn.COD_CIDADE, c.cod_cidade) '
      + 'left join representante r on r.id = a.cod_representante ' +
      'left join fop f on f.cod_fop = a.cod_fop ' +
      'left join prazo pz on pz.id = a.cod_prazo_pgto ' +
      'left join empresa e on e.cod_empresa = a.empresa_faturar ' +
      'left join cidades ce on ce.cod_cidade= e.cod_cidade ' +
      'left join transportadora t on t.cod_transportadora = a.cod_transportadora '
      + 'left join cidades ct on ct.cod_cidade= t.cod_cidade ' +
      'left join cod_fiscal cf on cf.cod_fiscal= a.cod_fiscal ' +
      'left join NFE_REF_DEV nfr on nfr.NUMDOC = a.numdoc ' +
      'where a.numdoc = ' + inttostr(pedido) + ' and (a.nfe_dev = ' +
      inttostr(num_nfe) + ' or a.nfe = ' + inttostr(num_nfe) +
      ') and a.EMPRESA_FATURAR = ' + inttostr(empresa);

    dao.geral1(cmd);

    dao.q1.First;

  end;

  begin

  EfetuaConsulta;


  LimpaDirNF;
  cont := 1;
  Synchronize(Mostra);
  // cBuscarCertificado.BuscaNome(smensagem);
  try
    // smensagem := dm.ACBrNFe1.Configuracoes.Certificados.SelecionarCertificado;
    dm.ACBrNFe1.Configuracoes.Certificados.NumeroSerie :=
      dao.Q1.fieldbyname('SERIE_CERTIFICADO').AsString;
    Industria := dao.Q1.fieldbyname('industria').AsString = 'S';
  except
    on E: Exception do
    begin
      erro := True;
      msgerros := E.Message;
      exit;
    end;
  end;

  cont := 2;
  Synchronize(Mostra);

  // dao.Geral4('select ultima_nf from configuracao');
  // Nnumero_nf:= FMFUN.enchezero(dao.Q4.fieldbyname('ultima_nf').AsString,8);
  // frmmontaXml.Nnumero_nf:= Nnumero_nf; //q_vendas1.fieldbyname('nf').AsString;

  Numdoc := dao.Q1.fieldbyname('NUMDOC').AsString;

  dm.ACBrNFe1.NotasFiscais.Clear;

  with dm.ACBrNFe1.NotasFiscais.Add.NFe do
  begin


    // frmmontaXml.Empresa_Faturar := dm.Prempresa_faturar.Text;

    ide.Serie := 1;

    // frmmontaXml.Nserie_nf := '001';

    infnfe.id := '1';
    // frmmontaXml.Nnf_id := '1';

    infnfe.Versao := 4;
    // frmmontaXml.Nnf_versao := '2.0';

    // frmmontaXml.Nnr_documento := dm.Prnumdoc.Text;

    if tipo = 0 then
      ide.nNF := dao.Q1.fieldbyname('NFE').AsInteger
    else
      ide.nNF := dao.Q1.fieldbyname('NFE_DEV').AsInteger;

    // frmmontaXml.Nnumero_nf := dm.PrNFE.Text;

    // Randomize;
    // CodigoNumerico := Random(9999999);


    if (dao.Q1.fieldbyname('nom_fop')
      .AsString = 'À VISTA (SEM DESCONTOS ADICIONAIS)') then
      ide.indPag := ipVista;

    if (dao.Q1.fieldbyname('nom_fop').AsString = 'BOLETO') or
      (dao.Q1.fieldbyname('nom_fop').AsString = 'DUP BB FANTONI') or
      (dao.Q1.fieldbyname('nom_fop').AsString = 'MASTERSEC') or
      (dao.Q1.fieldbyname('nom_fop').AsString = 'DUPLICATA') then
      ide.indPag := ipPrazo;

    if (dao.Q1.fieldbyname('nom_fop').AsString = 'CHEQUE PRÉ') or
      (dao.Q1.fieldbyname('nom_fop').AsString = 'PERMUTA') or
      (dao.Q1.fieldbyname('nom_fop').AsString = 'TROCA') or
      (dao.Q1.fieldbyname('nom_fop').AsString = 'BONIFICAÇÃO') then
      ide.indPag := ipOutras;

    if (dao.Q1.fieldbyname('nom_fop').AsString = 'DEPÓSITO ANTECIPADO') then
    begin
      if (dao.Q1.fieldbyname('PRAZO_PGTO').AsString = '7') then
        ide.indPag := ipVista
      else
        ide.indPag := ipPrazo;
    end;

    // frmmontaXml.Nmodelo := '55'; // '55';
    ide.Modelo := 55;

    // frmmontaXml.Nserie_nf := '1'; // '1';
    ide.Serie := 1;

    // frmmontaXml.Ndata_emissao := strtodate(dm.Prdta_saida.text);
    if tipo = 0 then
      ide.dEmi := dao.Q1.fieldbyname('dta_saida').AsDateTime
    else
      ide.dEmi := today;
    //
    // frmmontaXml.Ndata_saida := FormatDateTime('yyyy-mm-dd', strtodate(dm.Prdta_saida.text)); //
    if tipo = 0 then
      ide.dSaiEnt := dao.Q1.fieldbyname('DATA_REC_NFE').AsDateTime
    else
      ide.dSaiEnt := today;


    Ide.hSaiEnt := dao.Q1.fieldbyname('DATA_REC_NFE').AsDateTime;



    // frmmontaXml.Ntipo_nf := '1'; //
    if tipo = 0 then
      ide.tpNF := tnSaida
    else
      ide.tpNF := tnEntrada;

    ide.natOp := dao.Q1.fieldbyname('cod_fiscal').AsString + '-' +
      Copy(dao.Q1.fieldbyname('desc_fiscal').AsString, 1, 55);

    if ide.tpNF = tnEntrada then
    begin
      ide.natOp := dao.Q1.fieldbyname('cod_fiscal').AsString;
      if ide.natOp = '5101' then
        ide.natOp := '1101';

      if ide.natOp = '5102' then
        ide.natOp := '1202';

      if ide.natOp = '5405' then
        ide.natOp := '1411';

      if ide.natOp = '5917' then
        ide.natOp := '1202';

      if ide.natOp = '6910' then
        ide.natOp := '1202';

      if ide.natOp = '5910' then
        ide.natOp := '1202';

      if ide.natOp = '6101' then
        ide.natOp := '2101';

      if ide.natOp = '6102' then
        ide.natOp := '2202';

      if ide.natOp = '6202' then
        ide.natOp := '2202';

      if ide.natOp = '5202' then
        ide.natOp := '1202';

      if ide.natOp = '6949' then
        ide.natOp := '2202';

      if ide.natOp = '5949' then
        ide.natOp := '1202';

      if ide.natOp = '6403' then
        ide.natOp := '2411';

      if ide.natOp = '6152' then
        ide.natOp := '2202';

      if ide.natOp = '6409' then
        ide.natOp := '2202';

      if ide.natOp = '6917' then
        ide.natOp := '2202';
    end
    else
    begin
      Nnat_operacao := ide.natOp;
    end;
    // + ' - ' + dm.Lbnom_cod_fiscal.Caption;

    // frmmontaXml.Nnat_operacao := dm.Prcod_fiscal.Text;

    // frmmontaXml.Ntipo_impressao := '1';
    ide.tpImp := tiRetrato;

    // frmmontaXml.Ntipo_emissao := '1'; //
    ide.TpEmis := teNormal;

    // frmmontaXml.Ndigito_verificador:= ;//

    // frmmontaXml.Ntipo_ambiente := fmfun.BuscaAmbienteNFE;
    ide.tpAmb := fmfun.BuscaAmbienteNFE;

    dm.ACBrNFe1.Configuracoes.WebServices.Ambiente := ide.tpAmb;
    dm.ACBrNFe1.Configuracoes.WebServices.UF :=
      dao.Q1.fieldbyname('UF_EMPRESA').AsString;
    dm.ACBrNFe1.Configuracoes.Geral.FormaEmissao := teNormal;
    ide.cUF := dm.ACBrNFe1.Configuracoes.WebServices.UFCodigo;

    if (dao.Q1.fieldbyname('cod_fiscal').AsString = '5206') or
      (dao.Q1.fieldbyname('cod_fiscal').AsString = '6206') then
      ide.finNFe := fnNormal;

    if ide.tpNF = tnEntrada then
    begin
      with ide.NFref.Add do
      begin
        refNFe := dao.Q1.fieldbyname('Chave_NFe').AsString;
      end;
    end;

    if mform = 'vendas_devolucoes' then
    begin
      if (dao.Q1.fieldbyname('nom_fop').AsString = 'DEVOLUÇÃO') then
      begin
        ide.finNFe := fnDevolucao;

        dao.Geral5
          ('SELECT a.ID, a.CHAVE_NFE FROM NFE_REF_DEV a where a.NUMDOC = ' +
          dao.Q1.fieldbyname('numdoc').AsString);

        dao.Q5.First;
        while not dao.Q5.Eof do
        begin
          with ide.NFref.Add do
          begin
            refNFe := dao.Q5.fieldbyname('CHAVE_NFE').AsString;
          end;
          dao.Q5.next;
        end;
      end;
    end;

    { else if tipo = 1 then
      begin
      with ide.NFref.Add do
      begin
      refNFe := dm.PrChave_NFe.Text;
      end;
      end; }

    // frmmontaXml.Nprocesso_Emissao := '0'; //
    ide.ProcEmi := peAplicativoContribuinte;

    // emitente
    (* Informações da TAG EMIT... *)

    // frmmontaXml.NCNPJ := FRPRI.LimpaCNPJ(dao.Q2.fieldbyname('CNPJ').AsString);
    emit.CNPJCPF := frpri.LimpaCNPJ(dao.Q1.fieldbyname('CNPJ_EMPRESA')
      .AsString);

    // strChaveAcesso := fmfun.MontaChave{AcessoNFe(ide.cUF, ide.dEmi, emit.CNPJCPF,
    // ide.Modelo, ide.Serie, ide.nNF, 1, ide.CNF);

    strChaveAcesso := dao.Q1.fieldbyname('Chave_NFe').AsString;

    ide.CNF := strtoint(Copy(strChaveAcesso, 36, 8));

    // frmmontaXml.NNome := FMFUN.AnsiToAscii(dao.Q2.fieldbyname('NOM_EMPRESA').AsString);
    emit.xNome := fmfun.AnsiToAscii(dao.Q1.fieldbyname('RAZAO_SOCIAL_EMPRESA')
      .AsString);

    // frmmontaXml.NFantasia := FMFUN.AnsiToAscii(dao.Q2.fieldbyname('NOM_FANTASIA').AsString);
    emit.xFant := fmfun.AnsiToAscii(dao.Q1.fieldbyname('NOM_FANTASIA_EMPRESA')
      .AsString);

    (* TAG EnderEMIT... *)
    // frmmontaXml.Nrua := FMFUN.AnsiToAscii(dao.Q2.fieldbyname('ENDERECO').AsString);
    emit.EnderEmit.xLgr := fmfun.AnsiToAscii
      (dao.Q1.fieldbyname('ENDERECO_EMPRESA').AsString);

    // frmmontaXml.Nnumero := dao.Q2.fieldbyname('NR_ENDERECO').AsString;
    emit.EnderEmit.nro := dao.Q1.fieldbyname('NR_ENDERECO_EMPRESA').AsString;

    // frmmontaXml.Ncomplemento := FMFUN.AnsiToAscii(dao.Q2.fieldbyname('COMPLEMENTO').AsString);
    emit.EnderEmit.xCpl := fmfun.AnsiToAscii
      (dao.Q1.fieldbyname('COMPLEMENTO_EMPRESA').AsString);

    // frmmontaXml.NBairro := FMFUN.AnsiToAscii(dao.Q2.fieldbyname('BAIRRO').AsString);
    emit.EnderEmit.xBairro := fmfun.AnsiToAscii
      (dao.Q1.fieldbyname('BAIRRO_EMPRESA').AsString);

    // frmmontaXml.Ncod_cidade := dao.Q2.fieldbyname('COD_IBGE').AsString;
    emit.EnderEmit.cMun := dao.Q1.fieldbyname('COD_IBGE_EMPRESA').AsInteger;

    ide.cMunFG := emit.EnderEmit.cMun;
    // frmmontaXml.Nnom_cidade := FMFUN.AnsiToAscii(dao.Q2.fieldbyname('NOM_CIDADE').AsString);
    emit.EnderEmit.xMun := fmfun.AnsiToAscii
      (dao.Q1.fieldbyname('NOM_CIDADE_EMPRESA').AsString);

    // frmmontaXml.Nnom_UF := dao.Q2.fieldbyname('UF').AsString;
    emit.EnderEmit.UF := dao.Q1.fieldbyname('UF_EMPRESA').AsString;

    // frmmontaXml.NCEP := FRPRI.LimpaCNPJ(dao.Q2.fieldbyname('CEP').AsString);
    emit.EnderEmit.CEP :=
      strtoint(frpri.LimpaCNPJ(dao.Q1.fieldbyname('CEP_EMPRESA').AsString));

    // frmmontaXml.Ncodigo_Pais := '1058';
    emit.EnderEmit.cPais := 1058;

    // frmmontaXml.Nnom_Pais := 'Brasil';
    emit.EnderEmit.xPais := 'Brasil';

    // frmmontaXml.Nfone := FRPRI.LimpaCNPJ(dao.Q2.fieldbyname('FONE').AsString);
    emit.EnderEmit.fone := frpri.LimpaCNPJ(dao.Q1.fieldbyname('FONE_EMPRESA')
      .AsString);

    // frmmontaXml.Nie := FRPRI.LimpaCNPJ(dao.Q2.fieldbyname('IE').AsString);
    emit.IE := frpri.LimpaCNPJ(dao.Q1.fieldbyname('IE_EMPRESA').AsString);
    // Aliq_ICMS_Simples := dao.q5.fieldbyname('Aliq_ICMS_Simples').AsFloat;
    if dao.Q1.fieldbyname('ENQUADRADA_SIMPLES').AsString <> 'S' then
      emit.CRT := crtRegimeNormal
    else
      emit.CRT := crtSimplesNacional;

    (* Informações da TAG DEST... *)

    if ide.tpAmb = taProducao then
    begin
      Dest.EnderDest.UF := dao.Q1.fieldbyname('UF_CLIENTE').AsString;

      if dao.Q1.fieldbyname('TIP_PESSOA').AsString = 'F' then
      begin
        Dest.CNPJCPF := frpri.LimpaCNPJ(dao.Q1.fieldbyname('cpf').AsString);
        Dest.indIEDest := inIsento;
        if ansiindexstr(Dest.EnderDest.UF, ['AM', 'BA', 'CE', 'GO', 'MG', 'MS',
          'MT', 'PE', 'RN', 'SE', 'SP']) > 0 then
        begin
          Dest.indIEDest := inNaoContribuinte;
          ide.indFinal := cfConsumidorFinal;
        end;
      end;

      if dao.Q1.fieldbyname('TIP_PESSOA').AsString = 'J' then
      begin

        Dest.CNPJCPF :=
          trim(frpri.LimpaCNPJ(dao.Q1.fieldbyname('cnpj_cliente').AsString));

        if dao.Q1.fieldbyname('IE_CLIENTE').AsString = 'ISENTO' then
        begin
          Dest.indIEDest := inIsento;
          if ansiindexstr(Dest.EnderDest.UF, ['AM', 'BA', 'CE', 'GO', 'MG',
            'MS', 'MT', 'PE', 'RN', 'SE', 'SP']) > 0 then
          begin
            Dest.indIEDest := inNaoContribuinte;
            ide.indFinal := cfConsumidorFinal;
          end;
        end
        else
          Dest.IE := frpri.LimpaCNPJ(dao.Q1.fieldbyname('IE_CLIENTE').AsString);

      end;

      // frmmontaXml.Nie_destino := FRPRI.LimpaCNPJ(dao.Q1.fieldbyname('ie').AsString);
      // //'ISENTO'; (* Caso o destinatário não tenha Inscrição Estadual coloque a palavra "ISENTO" ...*)
      // cXML.InfNFe.Dest.ISUF := strResultado;

      Dest.xNome := fmfun.AnsiToAscii(dao.Q1.fieldbyname('nom_cliente')
        .AsString);
    end
    else
    begin
      Dest.CNPJCPF := '99999999000191'; // '99999090910270';
      Dest.indIEDest := inIsento;
      Dest.xNome :=
        'NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL';
      // 'NF-e Associacao NF-e';
    end;

    // 'DISTRIBUIDORA DE AGUAS MINERAIS';
    (* TAG EnderDEST... *)
    // frmmontaXml.Nrua_destino := FMFUN.AnsiToAscii(dao.Q1.fieldbyname('endereco').AsString);
    Dest.EnderDest.xLgr := fmfun.AnsiToAscii
      (dao.Q1.fieldbyname('ENDERECO_CLIENTE').AsString);

    // 'AV DAS FONTES';
    Dest.EnderDest.nro := fmfun.AnsiToAscii
      (dao.Q1.fieldbyname('NR_ENDERECO_CLIENTE').AsString);
    // frmmontaXml.Nnumero_destino := FMFUN.AnsiToAscii(dao.Q1.fieldbyname('nr_endereco').AsString); // '1777';

    if Ncomplemento_destino <> '' then
      // frmmontaXml.Ncomplemento_destino := dao.Q1.fieldbyname('complemento').AsString // '10 ANDAR';
      Dest.EnderDest.xCpl := dao.Q1.fieldbyname('COMPLEMENTO_CLIENTE').AsString
    else
      Dest.EnderDest.xCpl := 'loja';
    // frmmontaXml.Ncomplemento_destino := 'loja'; // '10 ANDAR';

    // frmmontaXml.NBairro_destino := FMFUN.AnsiToAscii(dao.Q1.fieldbyname('bairro').AsString); // 'PARQUE FONTES';
    Dest.EnderDest.xBairro := fmfun.AnsiToAscii
      (dao.Q1.fieldbyname('BAIRRO_CLIENTE').AsString);

    // frmmontaXml.Ncod_cidade_destino := dao.Q1.fieldbyname('cod_ibge').AsString;
    Dest.EnderDest.cMun := dao.Q1.fieldbyname('cod_ibge_CLIENTE').AsInteger;
    // '5030801';
    Dest.EnderDest.xMun := fmfun.AnsiToAscii
      (dao.Q1.fieldbyname('nom_cidade_CLIENTE').AsString);
    // frmmontaXml.Nnom_cidade_destino := FMFUN.AnsiToAscii(dao.Q1.fieldbyname('nom_cidade').AsString);
    // 'Sao Paulo';
    Dest.EnderDest.UF := dao.Q1.fieldbyname('uf_CLIENTE').AsString;
    // frmmontaXml.Nnom_UF_destino := dao.Q1.fieldbyname('uf').AsString; //  'SP';

    // frmmontaXml.NCEP_destino := FRPRI.LimpaCNPJ(dao.Q1.fieldbyname('cep').AsString); // '13950000';
    Dest.EnderDest.CEP :=
      strtoint(frpri.LimpaCNPJ(dao.Q1.fieldbyname('cep_CLIENTE').AsString));

    // frmmontaXml.Ncodigo_Pais := '1058'; //  '1058';
    Dest.EnderDest.cPais := 1058;

    // frmmontaXml.Nnom_Pais := 'BRASIL'; // 'BRASIL';
    Dest.EnderDest.xPais := 'BRASIL'; // 'BRASIL';

    if not dao.Q1.fieldbyname('fone_CLIENTE').IsNull then
      // frmmontaXml.NFone_destino := FRPRI.LimpaCNPJ(dao.Q1.fieldbyname('telefone').AsString); //'1932011234';
      Dest.EnderDest.fone := frpri.LimpaCNPJ(dao.Q1.fieldbyname('fone_CLIENTE')
        .AsString);
    // '1932011234';

    // mercadoria já estão na unit FRMMontaXML é só definir a variavel Mform

    if Dest.EnderDest.UF = emit.EnderEmit.UF then
    begin
      ide.idDest := doInterna;
      Aliquota_ICMS_Interno := 17;
    end
    else
    begin
      ide.idDest := doInterestadual;
      Aliquota_ICMS_Interno := 12;
    end;
    if ((ide.finNFe <> fnNormal) and (ide.finNFe <> fnDevolucao)) and
      (dao.Q1.IsEmpty) then
    begin
      with det.Add do
      begin
        Prod.nItem := 1;
        Prod.CProd := '99999';
        Prod.CEAN := ''; (* Se não tiver EAN tem que colocar em Branco... *)
        Prod.XProd := 'COMPLEMENTO'; // 'Agua Mineral';
        Prod.ncm := '39173290'; // 'NCM';
        Prod.cfop := Nnat_operacao;

        Prod.UCom := '1';
        Prod.QCom := 0;
        // FMFUN.DecimalPonto(FormatFloat('##0.0000', 0)); //'1000000.0000';
        Prod.VUnCom := 0;
        // FMFUN.DecimalPonto(FormatFloat('##0.00', 0)); //'1';

        Prod.VProd := 0;
        // FMFUN.DecimalPonto(FormatFloat('##0.00', 0)); // '10000000.00';

        Prod.VProd := Nvalor_NF;
        // FMFUN.DecimalPonto(FormatFloat('##0.00', Nvalor_NF));

        Prod.CEANTrib := '';
        (* Se não tiver EAN Trib. tem que colocar em Branco... *)
        Prod.UTrib := 'und'; // 'und';
        Prod.QTrib := 0;
        // FMFUN.DecimalPonto(FormatFloat('##0.0000', 0)); //'12000000.0000';
        Prod.VUnTrib := 1; // '1';
        Prod.IndTot := itSomaTotalNFe; // '1';
        Prod.cest := '';
        (* Será necessário criar regras de negócio  de acordo com o ERP na qual definirá a ocorrência das TAGs de IMPOSTO... *)
        (* TAG ICMS.ICMS00... *)

        if Nbase_calculo_icms_tot > 0 then
        begin
          if dao.Q1.fieldbyname('cod_empresa').AsString = '1' then
          begin
            Imposto.icms.orig := oeNacional;
            Imposto.icms.cst := cst00;
            Imposto.icms.ModBC := dbiMargemValorAgregado;
            (* Zero é Aceitavél como valor... *)

            Imposto.icms.VBC := Nbase_calculo_icms_tot; // '10000000.00';
            if Dest.EnderDest.UF = emit.EnderEmit.UF then
              Imposto.icms.PICMS := 17
            else
              Imposto.icms.PICMS := 12;
            // '18.00';
            Imposto.icms.VICMS := Nvalor_icms_tot; // '1800000.00';
          end
          else
          begin
            Imposto.icms.orig := oeNacional;
            Imposto.icms.CSOSN := csosn101;
            Imposto.icms.ModBC := dbiPauta;
            Imposto.icms.VBC := 0; // '10000000.00';
            // cDetLista.Imposto.ICMS.ICMSSN900.PRedBC := FMFUN.DecimalPonto(FormatFloat('##0.00', 1)); //'18.00';
            Imposto.icms.PICMS := 0; // '18.00';
            Imposto.icms.VICMS := 0; // '1800000.00';
          end;

        end
        else
        begin
          if dao.Q1.fieldbyname('ENQUADRADA_SIMPLES').AsString <> 'S' then
          begin
            (* TAG ICMS.ICMS60... *)
            Imposto.icms.orig := oeNacional;
            Imposto.icms.cst := cst60;
            Imposto.icms.VBCSTRet := 0;
            Imposto.icms.VICMSSTRet := 0;
            SubstituicaoTributaria := True;
          end
          else
          begin
            Imposto.icms.orig := oeNacional;
            Imposto.icms.CSOSN := csosn500;
            Imposto.icms.VBCSTRet := 0;
            Imposto.icms.VICMSSTRet := 0;
            SubstituicaoTributaria := True;
          end;
        end;
        (* TAG PIS.PISALIQ... *)
        if dao.Q1.fieldbyname('ENQUADRADA_SIMPLES').AsString <> 'S' then
        begin
          Imposto.PIS.cst := pis01;
          Imposto.PIS.VBC := 0;
          Imposto.PIS.PPIS := 0.65;
          Imposto.PIS.VPIS := 0;
        end
        else
        begin
          Imposto.PIS.cst := pis99;
          Imposto.PIS.QBCProd := 0;
          Imposto.PIS.VAliqProd := 0;
          Imposto.PIS.VPIS := 0;
        end;

        (* TAG COFINS.COFINSALIQ_CST... *)
        // felipe comentou aqui
        if dao.Q1.fieldbyname('ENQUADRADA_SIMPLES').AsString <> 'S' then
        begin
          Imposto.COFINS.cst := cof01;
          Imposto.COFINS.VBC := 0;
          Imposto.COFINS.PCOFINS := 2;
          Imposto.COFINS.VCOFINS := 0;
        end
        else
        begin
          Imposto.COFINS.cst := cof99;
          Imposto.COFINS.QBCProd := 0;
          Imposto.COFINS.VAliqProd := 0;
          Imposto.COFINS.VCOFINS := 0;
        end;
      end;
    end
    else
    begin
      dao.Q1.First;
      j := 0;
      CestaBasica := false;
      SubstituicaoTributaria := false;
      TotICMSSimples := 0;
      while not dao.Q1.Eof do
      begin
        j := j + 1;
        with det.Add do
        begin
          Prod.nItem := j;
          Prod.CProd := dao.Q1.fieldbyname('cod_produto').AsString;
          // '00001';
          Prod.CEAN := dao.Q1.fieldbyname('codigo_barra').AsString;
          (* Se não tiver EAN tem que colocar em Branco... *)
          Prod.XProd := trim(fmfun.AnsiToAscii(dao.Q1.fieldbyname('nom_produto')
            .AsString)); // 'Agua Mineral';
          Prod.ncm := fmfun.TratarCodigoNCM(dao.Q1.fieldbyname('ncm')
            .AsString, 1);
          // 'NCM';

          if dao.Q1.fieldbyname('CEST').AsString <> '0' then
            Prod.cest := fmfun.TratarCodigoNCM(dao.Q1.fieldbyname('CEST')
              .AsString, 1);

          Prod.cfop := dao.Q1.fieldbyname('COD_FISCAL_ITEM').AsString;

          if (Prod.cfop = '5102') or (Prod.cfop = '6102') or
            (Prod.cfop = '5101') or (Prod.cfop = '6101') then
            SimplesICMS := True
          else
            SimplesICMS := false;

          if tipo = 1 then
          begin
            if Prod.cfop = '5101' then
              Prod.cfop := '1101';

            if Prod.cfop = '5102' then
              Prod.cfop := '1202';

            if Prod.cfop = '6101' then
              Prod.cfop := '2101';

            if Prod.cfop = '6102' then
              Prod.cfop := '2202';

            if Prod.cfop = '5405' then
              Prod.cfop := '1411';

            if Prod.cfop = '5917' then
              Prod.cfop := '1202';

            if Prod.cfop = '5910' then
              Prod.cfop := '1202';

            if Prod.cfop = '6910' then
              Prod.cfop := '2202';

            if Prod.cfop = '5949' then
              Prod.cfop := '1202';

            if Prod.cfop = '6949' then
              Prod.cfop := '2202';

            if Prod.cfop = '6917' then
              Prod.cfop := '2202';

            if Prod.cfop = '6403' then
              Prod.cfop := '2411';

            if Prod.cfop = '6152' then
              Prod.cfop := '2202';

            if Prod.cfop = '6409' then
              Prod.cfop := '2202';

          end;

          Prod.UCom := dao.Q1.fieldbyname('unidade').AsString;

          Prod.QCom := dao.Q1.fieldbyname('qtd').AsFloat;
          // '1000000.0000';
          Prod.VUnCom := roundto(dao.Q1.fieldbyname('preco').AsFloat,
            (CasasDecimais * (-1))); // '1';
          Prod.VProd := roundto(dao.Q1.fieldbyname('preco').AsFloat,
            (CasasDecimais * (-1))) * dao.Q1.fieldbyname('qtd').AsFloat;
          // '10000000.00';
          Prod.CEANTrib := dao.Q1.fieldbyname('codigo_barra').AsString;
          (* Se não tiver EAN Trib. tem que colocar em Branco... *)
          Prod.UTrib := 'und'; // 'und';
          Prod.QTrib := dao.Q1.fieldbyname('qtd').AsFloat;
          // '12000000.0000';
          Prod.VUnTrib := roundto(dao.Q1.fieldbyname('preco').AsFloat,
            (CasasDecimais * (-1))); // '1';

          Prod.vDesc := roundto(dao.Q1.fieldbyname('DESCONTO').AsFloat,
            (CasasDecimais * (-1))); // '1';

          if (j = 1) and (dao.Q1.fieldbyname('tipo_frete').AsInteger = 2) then
            Prod.vFrete := roundto(dao.Q1.fieldbyname('vl_frete').Value,
              (CasasDecimais * (-1)));

          // roundto(dao.q1.fieldbyname('desconto_valor').AsFloat, (CasasDecimais * (-1)));
          Prod.IndTot := itSomaTotalNFe;
          (* Informações da TAG DI... Opcional *)
          {
            h := 1;
            cDILista := cXML.InfNFe.Det.Items[j].Prod.DI.Add;
            cDILista.NDI := Valor;
            cDILista.DDI := Valor;
            cDILista.XLocDesemb := Valor;
            cDILista.UFDesemb := Valor;
            cDILista.DDesemb := Valor;
            cDILista.NDI := Valor;
          }

          (* Informações da TAG ADI... Opcional *)
          {
            cAdiLista := cXML.InfNFe.Det.Items[j].Prod.DI.Items[h].Adi.Add;
            cAdiLista.NAdicao := Valor;
            cAdiLista.NSeqAdic := Valor;
            cAdiLista.CFabricante := Valor;
            cAdiLista.VDescDI := Valor;
          }

          (* Será necessário criar regras de negócio  de acordo com o ERP na qual definirá a ocorrência das TAGs de IMPOSTO... *)
          (* TAG ICMS.ICMS00... *)
          if (dao.Q1.fieldbyname('trib_icms').AsString = '00') or
            (dao.Q1.fieldbyname('trib_icms').AsString = '0') then
          begin
            if dao.Q1.fieldbyname('ENQUADRADA_SIMPLES').AsString <> 'S' then
            begin
              Imposto.icms.cst := cst00;
              Imposto.icms.orig := oeNacional;
              Imposto.icms.ModBC := dbiValorOperacao;
              (* Zero é Aceitavél como valor... *)
              Imposto.icms.VBC := roundto(dao.Q1.fieldbyname('vlr_bc').AsFloat,
                (CasasDecimais * (-1))); // '10000000.00';
              Imposto.icms.PICMS := dao.Q1.fieldbyname('icms_item').AsFloat;
              // '18.00';
              Imposto.icms.VICMS := dao.Q1.fieldbyname('VLR_ICMS_ITEM').AsFloat;
            end
            else
            begin
              Imposto.icms.orig := oeNacional;
              Imposto.icms.CSOSN := csosn101;
              Imposto.icms.ModBC := dbiPauta;
              Imposto.icms.VBC := roundto(dao.Q1.fieldbyname('vlr_bc').AsFloat,
                (CasasDecimais * (-1)));
              Imposto.icms.PICMS := dao.Q1.fieldbyname('icms_item').AsFloat;
              // '18.00';
              Imposto.icms.VICMS := dao.Q1.fieldbyname('VLR_ICMS_ITEM').AsFloat;
              if SimplesICMS then
                TotICMSSimples := TotICMSSimples + Imposto.icms.VBC;
              // end;
            end;
          end;

          if (dao.Q1.fieldbyname('trib_icms').AsString = '10') then
          begin
            if dao.Q1.fieldbyname('ENQUADRADA_SIMPLES').AsString <> 'S' then
            begin
              SubstituicaoTributariaRetida := True;
              Imposto.icms.orig := oeNacional;
              Imposto.icms.cst := cst10;
              Imposto.icms.ModBC := dbiMargemValorAgregado;
              (* Zero é Aceitavél como valor... *)
              Imposto.icms.VBC := roundto(dao.Q1.fieldbyname('vlr_bc').AsFloat,
                -2); // '10000000.00';
              Imposto.icms.PICMS := dao.Q1.fieldbyname('icms_item').AsFloat;
              // '18.00';
              Imposto.icms.VICMS := dao.Q1.fieldbyname('VLR_ICMS_ITEM').AsFloat;

              Imposto.icms.VBCST :=
                roundto(dao.Q1.fieldbyname('vlr_bc_st').AsFloat,
                (CasasDecimais * (-1)));
              Imposto.icms.vICMSST :=
                roundto(dao.Q1.fieldbyname('vlr_icms_st').AsFloat,
                (CasasDecimais * (-1)));

            end
            else
            begin
              SubstituicaoTributariaRetida := True;
              Imposto.icms.orig := oeNacional;
              Imposto.icms.CSOSN := csosn202;
              Imposto.icms.ModBC := dbiMargemValorAgregado;
              Imposto.icms.VBC := roundto(dao.Q1.fieldbyname('vlr_bc').AsFloat,
                (CasasDecimais * (-1))); // '10000000.00';
              Imposto.icms.PICMS := dao.Q1.fieldbyname('icms_item').AsFloat;
              // '18.00';
              Imposto.icms.VICMS := dao.Q1.fieldbyname('VLR_ICMS_ITEM').AsFloat;

              Imposto.icms.VBCST :=
                roundto(dao.Q1.fieldbyname('vlr_bc_st').AsFloat,
                (CasasDecimais * (-1)));
              Imposto.icms.vICMSST :=
                roundto(dao.Q1.fieldbyname('vlr_icms_st').AsFloat,
                (CasasDecimais * (-1)));

              // end;
            end;
          end;

          (* TAG ICMS.ICMS40... *)
          if dao.Q1.fieldbyname('trib_icms').AsString = '40' then
          begin
            if dao.Q1.fieldbyname('ENQUADRADA_SIMPLES').AsString <> 'S' then
            begin
              Imposto.icms.orig := oeNacional;
              Imposto.icms.cst := cst40;
            end;
          end;
          if dao.Q1.fieldbyname('ENQUADRADA_SIMPLES').AsString <> 'S' then
          begin
            if dao.Q1.fieldbyname('trib_icms').AsString = '60' then
            begin
              (* TAG ICMS.ICMS60... *)
              Imposto.icms.orig := oeNacional;
              Imposto.icms.cst := cst60;
              Imposto.icms.VBCST := 0;
              // _vendas_industria2.q_vendas2.fieldbyname('vlr_bc_st').AsFloat;
              Imposto.icms.vICMSST := 0;
              // r_vendas_industria2.q_vendas2.fieldbyname('vlr_icms_st').AsFloat;
              SubstituicaoTributaria := True;
            end;

            if dao.Q1.fieldbyname('trib_icms').AsString = '90' then
            begin
              (* TAG ICMS.ICMS90... *)
              Imposto.icms.orig := oeNacional;
              Imposto.icms.cst := cst90;
              Imposto.icms.ModBCST := dbisPrecoTabelado;
              Imposto.icms.PMVAST :=
                roundto(dao.Q1.fieldbyname('vlr_agr_item').AsFloat,
                (CasasDecimais * (-1)));
              Imposto.icms.VBCST :=
                roundto(dao.Q1.fieldbyname('vlr_bc_st').AsFloat,
                (CasasDecimais * (-1)));
              Imposto.icms.PICMSST := 12;
              Imposto.icms.vICMSST :=
                roundto(dao.Q1.fieldbyname('vlr_icms_st').AsFloat,
                (CasasDecimais * (-1)));
              CestaBasica := True;
            end;
          end
          else
          begin
            if dao.Q1.fieldbyname('trib_icms').AsString = '90' then
            begin
              Imposto.icms.orig := oeNacional;
              Imposto.icms.CSOSN := csosn900;
              Imposto.icms.ModBCST := dbisPrecoTabelado;
              Imposto.icms.PMVAST :=
                roundto(dao.Q1.fieldbyname('vlr_agr_item').AsFloat,
                (CasasDecimais * (-1)));
              Imposto.icms.VBCST :=
                roundto(dao.Q1.fieldbyname('vlr_bc_st').AsFloat,
                (CasasDecimais * (-1)));
              if Dest.EnderDest.UF <> emit.EnderEmit.UF then
                Imposto.icms.PICMSST := 12
              else
                Imposto.icms.PICMSST := 17;
              Imposto.icms.vICMSST :=
                roundto(dao.Q1.fieldbyname('vlr_icms_st').AsFloat,
                (CasasDecimais * (-1)));

              // CestaBasica := true;
              SubstituicaoTributaria := True;
            end;
            if dao.Q1.fieldbyname('trib_icms').AsString = '60' then
            begin
              Imposto.icms.orig := oeNacional;
              Imposto.icms.CSOSN := csosn500;
              Imposto.icms.VBCST := 0;
              // dao.q1.fieldbyname('vlr_bc_st').AsFloat;
              Imposto.icms.vICMSST := 0;
              // dao.q1.fieldbyname('vlr_icms_st').AsFloat;
              SubstituicaoTributaria := True;
            end;
            if dao.Q1.fieldbyname('trib_icms').AsString = '40' then
            begin
              Imposto.icms.orig := oeNacional;
              Imposto.icms.CSOSN := csosn400;
            end;
          end;

          (* TAG IPI... *)
          // Felipe que comentou 22/03/2009
          { cDetLista.Imposto.IPI.ClEnq := dao.q1.fieldbyname('vlr_icms_st').AsString;
            cDetLista.Imposto.IPI.CNPJProd := Valor;
            cDetLista.Imposto.IPI.CSelo := Valor;
            cDetLista.Imposto.IPI.QSelo := Valor;
          }

          (* TAG IPI.IPITRIB... *)
          if (dao.Q1.fieldbyname('vlr_ipi_item').AsFloat > 0)
          { and ((dao.q1.fieldbyname
            ('COD_FISCAL_ITEM').AsString = '5413') or
            (dao.q1.fieldbyname('COD_FISCAL_ITEM')
            .AsString = '6413')
            { or (dao.q1.fieldbyname('COD_FISCAL_ITEM').AsString = '5102') or (dao.q1.fieldbyname('COD_FISCAL_ITEM').AsString = '6102')  ) }
          then
          begin
            Imposto.IPI.CEnq := '999';
            Imposto.IPI.cst := ipi50;
            Imposto.IPI.VBC := dao.Q1.fieldbyname('sub_total').AsFloat;
            Imposto.IPI.PIPI := dao.Q1.fieldbyname('ipi_item').AsFloat;
            Imposto.IPI.VIPI := dao.Q1.fieldbyname('vlr_ipi_item').AsFloat;
          end;

          (* TAG PIS.PISALIQ... *)
          if dao.Q1.fieldbyname('ENQUADRADA_SIMPLES').AsString <> 'S' then
          begin
            Imposto.PIS.cst := pis01;
            Imposto.PIS.VBC := dao.Q1.fieldbyname('sub_total').AsFloat;
            Imposto.PIS.PPIS := 0.65;
            Imposto.PIS.VPIS := dao.Q1.fieldbyname('sub_total').AsFloat
              * 0.0065;
          end
          else
          begin
            Imposto.PIS.cst := pis99;
            Imposto.PIS.QBCProd := 0;
            Imposto.PIS.VAliqProd := 0;
            Imposto.PIS.VPIS := 0;
          end;

          { if cliente_com_suspensao_pis_cofins then
            begin
            Imposto.PIS.cst := pis09;
            Imposto.PIS.QBCProd := 0;
            Imposto.PIS.VAliqProd := 0;
            Imposto.PIS.VPIS := 0;
            end; }

          (* TAG COFINS.COFINSALIQ_CST... *)
          // felipe comentou aqui
          if dao.Q1.fieldbyname('ENQUADRADA_SIMPLES').AsString <> 'S' then
          begin
            Imposto.COFINS.cst := cof01;
            Imposto.COFINS.VBC := dao.Q1.fieldbyname('sub_total').AsFloat;
            Imposto.COFINS.PCOFINS := 2;
            Imposto.COFINS.VCOFINS := dao.Q1.fieldbyname('sub_total')
              .AsFloat * 0.02;
          end
          else
          begin
            Imposto.COFINS.cst := cof99;
            Imposto.COFINS.QBCProd := 0;
            Imposto.COFINS.VAliqProd := 0;
            Imposto.COFINS.VCOFINS := 0;
          end;

          { if cliente_com_suspensao_pis_cofins then
            begin
            Imposto.COFINS.cst := cof09;
            Imposto.COFINS.QBCProd := 0;
            Imposto.COFINS.VAliqProd := 0;
            Imposto.COFINS.VCOFINS := 0;
            end; }

          (* TAG ICMS.ICMS40... *)
          if dao.Q1.fieldbyname('trib_icms').AsString = '40' then
          begin
            if dao.Q1.fieldbyname('ENQUADRADA_SIMPLES').AsString <> 'S' then
            begin
              Imposto.icms.orig := oeNacional;
              Imposto.icms.cst := cst40;
            end;
          end;
          if dao.Q1.fieldbyname('ENQUADRADA_SIMPLES').AsString <> 'S' then
          begin
            if dao.Q1.fieldbyname('trib_icms').AsString = '60' then
            begin
              (* TAG ICMS.ICMS60... *)
              Imposto.icms.orig := oeNacional;
              Imposto.icms.cst := cst60;
              Imposto.icms.VBCST := 0;
              // dao.q1.fieldbyname('vlr_bc_st').AsFloat;
              Imposto.icms.vICMSST := 0;
              dao.Q1.fieldbyname('vlr_icms_st').AsFloat;
              SubstituicaoTributaria := True;
            end;

            if dao.Q1.fieldbyname('trib_icms').AsString = '90' then
            begin
              (* TAG ICMS.ICMS90... *)
              Imposto.icms.orig := oeNacional;
              Imposto.icms.cst := cst90;
              Imposto.icms.ModBCST := dbisPrecoTabelado;
              Imposto.icms.PMVAST := dao.Q1.fieldbyname('vlr_agr_item').AsFloat;
              Imposto.icms.VBCST := dao.Q1.fieldbyname('vlr_bc_st').AsFloat;
              Imposto.icms.PICMSST := 12;
              Imposto.icms.vICMSST := dao.Q1.fieldbyname('vlr_icms_st').AsFloat;
              CestaBasica := True;
            end;
          end;

          (* TAG PIS.PISALIQ... *)
          if dao.Q1.fieldbyname('ENQUADRADA_SIMPLES').AsString <> 'S' then
          begin
            Imposto.PIS.cst := pis01;
            Imposto.PIS.VBC := 0;
            Imposto.PIS.PPIS := 0.65;
            Imposto.PIS.VPIS := 0;
          end
          else
          begin
            Imposto.PIS.cst := pis99;
            Imposto.PIS.QBCProd := 0;
            Imposto.PIS.VAliqProd := 0;
            Imposto.PIS.VPIS := 0;
          end;

          {
            if cliente_com_suspensao_pis_cofins then
            begin
            Imposto.PIS.cst := pis09;
            Imposto.PIS.QBCProd := 0;
            Imposto.PIS.VAliqProd := 0;
            Imposto.PIS.VPIS := 0;
            end;
          }

          (* TAG COFINS.COFINSALIQ_CST... *)
          // felipe comentou aqui
          if dao.Q1.fieldbyname('ENQUADRADA_SIMPLES').AsString <> 'S' then
          begin
            Imposto.COFINS.cst := cof01;
            Imposto.COFINS.VBC := 0;
            Imposto.COFINS.PCOFINS := 2;
            Imposto.COFINS.VCOFINS := 0;
          end
          else
          begin
            Imposto.COFINS.cst := cof99;
            Imposto.COFINS.QBCProd := 0;
            Imposto.COFINS.VAliqProd := 0;
            Imposto.COFINS.VCOFINS := 0;
          end;

          { if cliente_com_suspensao_pis_cofins then
            begin
            Imposto.COFINS.cst := cof09;
            Imposto.COFINS.QBCProd := 0;
            Imposto.COFINS.VAliqProd := 0;
            Imposto.COFINS.VCOFINS := 0;
            end; }

          if (dao.Q1.fieldbyname('ie_cliente').AsString = 'ISENTO') and
            (ansiindexstr(Dest.EnderDest.UF, ['AM', 'BA', 'CE', 'GO', 'MG',
            'MS', 'MT', 'PE', 'RN', 'SE', 'SP']) > 0) then
          begin

            Imposto.ICMSUFDest.vBCUFDest :=
              roundto(dao.Q1.fieldbyname('vlr_bc').AsFloat,
              (CasasDecimais * (-1)));
            Imposto.ICMSUFDest.vBCFCPUFDest := 0;
            Imposto.ICMSUFDest.pFCPUFDest := 0;
            Imposto.ICMSUFDest.pICMSUFDest := Aliquota_ICMS_Interno;
            Imposto.ICMSUFDest.pICMSInter :=
              dao.Q1.fieldbyname('icms_item').AsFloat;

            iAno := strtoint(formatdatetime('yyyy', now));

            case iAno of
              2017:
                Imposto.ICMSUFDest.pICMSInterPart := 60;
              2018:
                Imposto.ICMSUFDest.pICMSInterPart := 80;
            end;
            if iAno >= 2019 then
              Imposto.ICMSUFDest.pICMSInterPart := 100;

            Imposto.ICMSUFDest.vFCPUFDest := 0;
            Imposto.ICMSUFDest.vICMSUFDest :=
              dao.Q1.fieldbyname('VLR_ICMS_ITEM').AsFloat;

          end;

        end;
        dao.Q1.next;
      end;
    end;
     EfetuaConsulta;
    // Totais

    if dao.Q1.fieldbyname('ENQUADRADA_SIMPLES').AsString <> 'S' then
    begin
      total.ICMSTot.VBC := roundto(dao.Q1.fieldbyname('vlr_bc_icms').AsFloat,
        (CasasDecimais * (-1)));
      total.ICMSTot.VICMS := roundto(dao.Q1.fieldbyname('vlr_icms').AsFloat,
        (CasasDecimais * (-1)));
    end
    else
    begin
      total.ICMSTot.VBC := 0;
      total.ICMSTot.VICMS := 0;
    end;
    // vDesc
    // total.ICMSTot.vDesc := roundto(dao.q1.fieldbyname('VLR_DESCONTO_GERAL').AsFloat, (CasasDecimais * (-1)));
    total.ICMSTot.VBCST := 0;
    total.ICMSTot.VST := 0;

    VBCST := roundto(dao.Q1.fieldbyname('vlr_bc_icms_st').AsFloat,
      (CasasDecimais * (-1)));
    VST := roundto(dao.Q1.fieldbyname('vlr_st').AsFloat,
      (CasasDecimais * (-1)));

    if SubstituicaoTributariaRetida then
    begin
      total.ICMSTot.VBCST := VBCST;
      total.ICMSTot.VST := VST;
    end;

    total.ICMSTot.VProd := roundto(dao.Q1.fieldbyname('tot_liquido').AsFloat,
      (CasasDecimais * (-1)));

    if dao.Q1.fieldbyname('tipo_frete').AsInteger = 2 then
      total.ICMSTot.vFrete := roundto(dao.Q1.fieldbyname('vl_frete').AsFloat,
        (CasasDecimais * (-1)))
    else
      total.ICMSTot.vFrete := 0;

    total.ICMSTot.vSeg := 0;
    total.ICMSTot.vDesc := roundto(dao.Q1.fieldbyname('VLR_DESCONTO_GERAL')
      .AsFloat, (CasasDecimais * (-1)));
    // total.ICMSTot.vDesc := 0;
    total.ICMSTot.vII := 0;
    total.ICMSTot.VIPI := roundto(dao.Q1.fieldbyname('vlr_ipi').AsFloat,
      (CasasDecimais * (-1)));
    total.ICMSTot.VPIS := 0;
    total.ICMSTot.VCOFINS := 0;
    total.ICMSTot.vOutro := 0;
    total.ICMSTot.vNF := roundto(dao.Q1.fieldbyname('tot_liquido').AsFloat +
      dao.Q1.fieldbyname('vlr_ipi').AsFloat + total.ICMSTot.vFrete +
      total.ICMSTot.VST - total.ICMSTot.vDesc, (CasasDecimais * (-1)));

    if (Dest.indIEDest = inNaoContribuinte) and
      (ansiindexstr(Dest.EnderDest.UF, ['AM', 'BA', 'CE', 'GO', 'MG', 'MS',
      'MT', 'PE', 'RN', 'SE', 'SP']) > 0) then
    begin
      total.ICMSTot.vICMSUFDest :=
        roundto(dao.Q1.fieldbyname('vlr_icms').AsFloat, (CasasDecimais * (-1)));
    end;

    if dao.Q1.fieldbyname('tipo_frete').AsInteger = 2 then
      Transp.ModFrete := mfContaDestinatario
    else
      Transp.ModFrete := mfContaEmitente;

    Transp.Transporta.CNPJCPF :=
      frpri.LimpaCNPJ(dao.Q1.fieldbyname('CNPJ_TRANSP').AsString);
    Transp.Transporta.xNome := fmfun.AnsiToAscii
      (dao.Q1.fieldbyname('RAZAO_SOCIAL_TRANSP').AsString);
    if not dao.Q1.fieldbyname('IE_TRANSP').IsNull then
      Transp.Transporta.IE := frpri.LimpaCNPJ(dao.Q1.fieldbyname('IE_TRANSP')
        .AsString);
    Transp.Transporta.xEnder :=
      fmfun.AnsiToAscii(dao.Q1.fieldbyname('ENDERECO_TRANSP').AsString);
    Transp.Transporta.xMun := fmfun.AnsiToAscii
      (dao.Q1.fieldbyname('NOM_CIDADE_TRANSP').AsString);
    Transp.Transporta.UF := dao.Q1.fieldbyname('UF_TRANSP').AsString;
    { if not dao.q2.fieldbyname('PLACA').IsNull then
      begin
      Transp.veicTransp.placa := dao.q2.fieldbyname('PLACA').AsString;
      Transp.veicTransp.UF := Transp.Transporta.UF;
      end; }

    if Transp.Transporta.xNome = '' then
    begin
      Transp.Transporta.CNPJCPF := Dest.CNPJCPF;
      Transp.Transporta.xNome := Dest.xNome;
      Transp.Transporta.IE := Dest.IE;
      Transp.Transporta.xEnder := Dest.EnderDest.xLgr + ', ' +
        Dest.EnderDest.nro;
      Transp.Transporta.xMun := Dest.EnderDest.xMun;
      Transp.Transporta.UF := Dest.EnderDest.UF;
    end;

    with Transp.Vol.Add do
    begin
      qVol := dao.Q1.fieldbyname('volume_nota').Value;
      esp := 'VOLUMES';
      marca := 'X';
      pesoL := dao.Q1.fieldbyname('peso_nota').Value;
      pesoB := dao.Q1.fieldbyname('peso_nota').Value;
    end;

    if ide.finNFe = fnNormal then
    begin
      Cheque := false;
      Dinheiro := false;
      Deposito := false;

      i := 0;

      Cobr.fat.vliq := total.ICMSTot.vNF;
      Cobr.fat.nFat := dao.Q1.fieldbyname('NFE').Value;
      Cobr.fat.vDesc := 0;
      Cobr.fat.vOrig := total.ICMSTot.vNF;

      dao.Q1.open;

      if tipo = 0 then
      begin
        dm.q_contas_receber.close;
        dm.q_contas_receber.SQL.Clear;
        dm.q_contas_receber.SQL.Text := ' select  ' + '   cr1.dtaven, ' +
          '   cr1.dtarec, ' + '   cr1.titulo, ' +
          '   cast(cr1.historico1 as varchar(300)) as historico, ' +
          '   cr1.sequencia, ' + '   cr1.valor, ' + '   cr1.valor_recebido, ' +
          '   c.nom_cliente, ' + '   c.telefone, ' + '   cr1.cod_fop, ' +
          '   fp.nom_fop, ' + '   e.nom_empresa, ' + '   r.nom_representante, '
          + '   cr1.NR_DOCUMENTO AS NUMDOC, ' +
          '   cc.id||''-''||trim(cc.NR_AGENCIA)||''/''||cc.NR_CONTA||''-''||bc.NOM_BANCO as conta, '
          + '   v.DTA_EMISSAO, ' + '   v.dtadoc, ' +
          '   rr.NOM_REPRESENTANTE as vendedor_pedido ' + ' from ' +
          '   cr1 cr1 ' +
          ' left join cliente c on c.cod_cliente= cr1.cod_cliente ' +
          ' left join fop fp on fp.cod_fop=cr1.cod_fop ' +
          ' left join empresa e on e.cod_empresa=cr1.cod_empresa  ' +
          ' left join representante r on r.id=cr1.id_representante ' +
          ' left join vendas1 v on v.NUMDOC = cr1.NR_DOCUMENTO ' +
          ' LEFT OUTER join CONTA_CORRENTE cc on  (cc.ID = coalesce(cr1.CONTA_BOLETO, v.conta_boleto)) '
          + ' inner join banco bc on (cc.ID_BANCO = bc.ID) ' +
          ' left join REPRESENTANTE rr on rr.id = v.COD_REPRESENTANTE  ' +
          ' where 1 = 1 ' + '   and cr1.nr_documento =' + Numdoc;
        dm.q_contas_receber.open;
        if not dm.q_contas_receber.IsEmpty then
        begin
          dm.q_contas_receber.First;
          if dm.q_contas_receber.fieldbyname('cod_fop').AsString = '1' then
          begin
            Dinheiro := True;
            with pag.Add do
            begin
              tPag := fpDinheiro;
              vPag := dm.q_contas_receber.fieldbyname('valor').AsFloat;
            end;
          end
          else if (dm.q_contas_receber.fieldbyname('cod_fop').AsString = '2') or
            (dm.q_contas_receber.fieldbyname('cod_fop').AsString = '3') or
            (dm.q_contas_receber.fieldbyname('cod_fop').AsString = '4') or
            (dm.q_contas_receber.fieldbyname('cod_fop').AsString = '5') or
            (dm.q_contas_receber.fieldbyname('cod_fop').AsString = '6') or
            (dm.q_contas_receber.fieldbyname('cod_fop').AsString = '33') then
          begin
            if dm.q_contas_receber.fieldbyname('cod_fop').AsString = '4' then
            begin
              Cheque := True;
              dm.q_contas_receber.First;
              while not dm.q_contas_receber.Eof do
              begin
                i := i + 1;
                with pag.Add do
                begin
                  tPag := fpCheque;
                  vPag := dm.q_contas_receber.fieldbyname('valor').AsFloat;
                end;
                dm.q_contas_receber.next;
              end;
            end
            else if (dm.q_contas_receber.fieldbyname('cod_fop').AsString = '2')
              and (dm.q_contas_receber.fieldbyname('cod_prazo_pgto')
              .AsString = '7') then
            begin
              Deposito := True;
              with pag.Add do
              begin
                tPag := fpDinheiro;
                vPag := dm.q_contas_receber.fieldbyname('valor').AsFloat;
              end;
            end
            else
            begin
              while not dm.q_contas_receber.Eof do
              begin
                i := i + 1;
                with Cobr.Dup.Add do
                begin
                  // NDup := dm.PrNFE.Text + '/' + inttostr(i);
                  NDup := formatfloat('000', i);
                  DVenc := dm.q_contas_receber.fieldbyname('dtaven').AsDateTime;
                  VDup := dm.q_contas_receber.fieldbyname('valor').AsFloat;
                end;

                with pag.Add do
                begin
                  tPag := fpDuplicataMercantil;
                  vPag := dm.q_contas_receber.fieldbyname('valor').AsFloat;
                end;
                dm.q_contas_receber.next;
              end;
            end;
          end
          else
          begin

            while not dm.q_contas_receber.Eof do
            begin
              i := i + 1;
              with Cobr.Dup.Add do
              begin
                NDup := formatfloat('000', i);
                DVenc := dm.q_contas_receber.fieldbyname('dtaven').AsDateTime;
                VDup := dm.q_contas_receber.fieldbyname('valor').AsFloat;
              end;

              with pag.Add do
              begin
                tPag := fpDuplicataMercantil;
                vPag := dm.q_contas_receber.fieldbyname('valor').AsFloat;
              end;
              dm.q_contas_receber.next;
            end;
          end;
        end
        else
        begin
          with pag.Add do
          begin
            tPag := fpSemPagamento;
            vPag := 0.00;

          end;
        end;
      end
      else
      begin
        Dinheiro := True;
        with pag.Add do
        begin
          tPag := fpDinheiro;
          vPag := dm.q_contas_receber.fieldbyname('valor').AsFloat;
        end;
      end;
    end
    else
    begin
      with pag.Add do
      begin
        tPag := fpSemPagamento;
        vPag := 0.00;
      end;
    end;

    slInfCpl := trim(fmfun.AnsiToAscii(dao.Q1.fieldbyname('observacoes_nota')
      .AsString));

    if tipo = 1 then
      slInfCpl := slInfCpl + 'NF-e de Entrada ref. a NF-e de Saída ' +
        dao.Q1.fieldbyname('NFE').AsString + ' de ' +
        dao.Q1.fieldbyname('dta_emissao').AsString + '.';

    if ide.finNFe = fnNormal then
    begin
      if (Copy(Nnat_operacao, 1, 4) = '5405') or
        (Copy(Nnat_operacao, 1, 4) = '6403') or
        (Copy(Nnat_operacao, 1, 4) = '5102') or
        (Copy(Nnat_operacao, 1, 4) = '6102') or
        (Copy(Nnat_operacao, 1, 4) = '5101') or
        (Copy(Nnat_operacao, 1, 4) = '6101') then
        slInfCpl := slInfCpl +
          'Nao aceitamos devolucao sem previa Consulta ao Nosso Dep. Vendas. Favor conferir a mercadoria no ato do recebimento, nao aceitaremos reclamacoes posteriores. '
          + 'O nao recebimento dos boletos, nao justifica a falta de pagamento ou dispensa de juros por atraso. Duvidas, entrar em contato antes do vencimento.';

      if dao.Q1.fieldbyname('ENQUADRADA_SIMPLES').AsString = 'S' then
      begin
        // slInfCpl := slInfCpl + '.';
        if TotICMSSimples > 0 then
        begin
          ICMSSimples := TotICMSSimples *
            (dao.Q1.fieldbyname('icms_item').AsFloat / 100);
          slInfCpl := slInfCpl +
            'Permite o aproveitamento do crédito de ICMS no valor de ' +
            formatfloat('R$ #,###,##0.00', ICMSSimples) +
            ' correspondente à alíquota de ' + formatfloat('#0.00%',
            dao.Q1.fieldbyname('icms_item').AsFloat) +
            ', nos termos do Art. 23 da LC 123/2006.';
        end
        else if not((Copy(Nnat_operacao, 1, 4) = '5102') or
          (Copy(Nnat_operacao, 1, 4) = '6102') or
          (Copy(Nnat_operacao, 1, 4) = '5101') or
          (Copy(Nnat_operacao, 1, 4) = '6101')) then
          slInfCpl := slInfCpl +
            'Documento emitido por ME ou EPP optante pelo simples nacional. Nao gera direito a credito Fiscal de ICMS. ';
      end
      else
      begin
        if (Copy(Nnat_operacao, 1, 4) = '6102') and (Dest.EnderDest.UF = 'RS')
        then
          slInfCpl := slInfCpl +
            'Não incidência do ICMS/ST conforme o Inciso 10 do Artigo 10 e Inciso 2º do Artigo 203 – Livro 3 do RICMS/RS – (Mercadoria destinada a industrialização).';
      end;

      if (trim(Dest.IE) = '') or (trim(Dest.IE) = 'ISENTO') then
        slInfCpl := slInfCpl +
          'Imposto retido por Substituicao Tributaria RIMCMS SC/01 Anexo 3. '
      else
      begin
        if CestaBasica then
          slInfCpl := slInfCpl +
            'Termos do Art. 26 do RIMCMS/SC Produto Cesta Basica Construcao Civil. ';
        if SubstituicaoTributaria then
        begin
          if emit.EnderEmit.UF = 'SC' then
            obs_st := 'Imposto retido por Substituicao Tributaria RIMCMS SC/01 Anexo 3. ';

          if emit.EnderEmit.UF = 'PR' then
            obs_st := 'ICMS recolhido por Substituição Tributária cfe Art. 19 do Anexo X do RICMS-PR ';

          slInfCpl := slInfCpl + obs_st + ' BCST ' +
            fmfun.DecimalPonto(formatfloat('##0.00', VBCST)) + ' IST ' +
            fmfun.DecimalPonto(formatfloat('##0.00', VST)) + '. ';
        end;
      end;

      if (Nnat_operacao = '1202') or (Nnat_operacao = '2202') or
        (Nnat_operacao = '1202') or (Nnat_operacao = '2202') then
        slInfCpl := slInfCpl +
          'Devolucao de Mercadoria referente a NF. de Saida: ' +
          dao.Q1.fieldbyname('NFE').AsString;

      if dao.Q1.fieldbyname('nom_fop').AsString = 'TRANSFERENCIA' then
      begin
        if emit.EnderEmit.UF = 'RS' then
          slInfCpl :=
            'Segundo o Art. 203, inciso I, Livro III do RICMS-RS/97, o ICMS/ST não será incidente nas operações entre estabelecimentos de '
            + 'empresas interdependentes e às transferências, que destinem mercadorias a estabelecimento de contribuinte localizado neste Estado, '
            + 'exceto se o destinatário for exclusivamente varejista.';

        if emit.EnderEmit.UF = 'PR' then
          slInfCpl :=
            'Conforme previsto no inciso II, da cláusula quinta do Convênio ICMS 81/93 em consonância ao disposto na alínea "b", '
            + 'do inciso I, do Art. 12, do Anexo X do RICMS-PR/12, não se aplica o regime da substituição tributária nas transferências '
            + 'para outro estabelecimento, exceto varejista, do sujeito passivo por substituição, hipótese em que a responsabilidade pela '
            + 'retenção e recolhimento do imposto recairá sobre o estabelecimento que promover a saída da mercadoria com destino a empresa diversa.';

      end;
    end;

    InfAdic.InfCpl := trim(fmfun.AnsiToAscii(slInfCpl));

    infRespTec.xContato := 'CLAUDIO LUIS TOMASI';
    infRespTec.CNPJ := '10819102000197';
    infRespTec.email := 'cltomasi@gmail.com';
    infRespTec.fone := '47999187025';


    path := ExtractFilePath(Application.ExeName);
    arquivo_nfe := path + 'nf\';
    arquivo_nfe := arquivo_nfe + strChaveAcesso + '-nfe.xml';
{
    try
      dm.ACBrNFe1.NotasFiscais.Assinar;
    except
      on E: Exception do
      begin
        erro := True;
        msgerros := E.Message;
        exit;
      end;
    end;

    cont := 3;
    Synchronize(Mostra);

    path := ExtractFilePath(Application.ExeName);

    cont := 4;
    Synchronize(Mostra);
    // if StrToInt(FRPRI.pValidarXML(arquivo_nfe,path+'schemas\enviNFe_v2.00.xsd',mensagem, msgerros)) > 0 then
    try
      dm.ACBrNFe1.NotasFiscais.Validar;
    except
      msgerros := dm.ACBrNFe1.NotasFiscais.Items[0].Alertas;

      if msgerros = '' then
        msgerros := dm.ACBrNFe1.NotasFiscais.Items[0].ErroValidacaoCompleto
      else
        msgerros := msgerros + #13 + dm.ACBrNFe1.NotasFiscais.Items[0]
          .ErroValidacaoCompleto;

      erro := True;
    end;
 }
    dm.ACBrNFe1.NotasFiscais.Items[0].NomeArq := arquivo_nfe;

    {try
      dm.ACBrNFe1.NotasFiscais.Assinar;
    except
      on e: Exception do
      begin
        erro := true;
        msgerros := e.Message;
        Exit;
      end;
    end;
    }

    dm.ACBrNFe1.NotasFiscais.GravarXML(arquivo_nfe);





  end;

end;

constructor TNFePedido.Create(nr_nfe, nr_pedido, cod_empresa: integer);
begin
  inherited Create(nr_nfe, nr_pedido, cod_empresa);
end;

procedure TNFePedido.Execute;
begin
  try
    CoInitialize(nil);
{$IFDEF ORBI}frpri.DesabilitaTimers;
{$ENDIF}
    monta_NFE;

    if not erro then
    begin
      GravarChaveNfe;
      EnviarLote(PathLote);
      GravarReciboNfe;
      TransfereNfeFTP;
      finalizado := True;
      Synchronize(Mostra);
    end
    else
    begin
      Synchronize(Mostra);
    end;

    Fr_nfe_transmissao.BtnOK.Enabled := True;

  finally
    CoUnInitialize;
{$IFDEF ORBI}frpri.HabilitaTimers;
{$ENDIF}
  end;
end;

procedure TNFe.Mostra;
begin
  case cont of
    1:
      begin
        Fr_nfe_transmissao.sCheckBox1.Checked := True;
      end;
    2:
      begin
        Fr_nfe_transmissao.sCheckBox2.Checked := True;
      end;
    3:
      begin
        Fr_nfe_transmissao.sCheckBox3.Checked := True;
      end;
    4:
      begin
        Fr_nfe_transmissao.sCheckBox4.Checked := True;
      end;
    5:
      begin
        Fr_nfe_transmissao.sCheckBox5.Checked := True;
      end;
    6:
      begin
        Fr_nfe_transmissao.sCheckBox6.Checked := True;
      end;
    7:
      begin
        Fr_nfe_transmissao.sCheckBox7.Checked := True;
      end;
    8:
      begin
        Fr_nfe_transmissao.sCheckBox8.Checked := True;
      end;
    9:
      begin
        Fr_nfe_transmissao.sCheckBox9.Checked := True;
      end;
    10:
      begin
        Fr_nfe_transmissao.sCheckBox10.Checked := True;
      end;
  end;

  Fr_nfe_transmissao.Gauge1.Progress := cont;

  if erro then
  begin
    Fr_nfe_transmissao.lbResultado.Visible := True;
    Fr_nfe_transmissao.MsgErro.Visible := True;
    Fr_nfe_transmissao.MsgErro.Enabled := false;
    Fr_nfe_transmissao.MsgErro.Text := msgerros;
    Fr_nfe_transmissao.MsgErro.Height := Fr_nfe_transmissao.Panel1.Height -
      Fr_nfe_transmissao.MsgErro.Top;
    Fr_nfe_transmissao.lbResultado.Caption := 'Houve erro no processo.';
    Fr_nfe_transmissao.BtnOK.MODALRESULT := mrok;
    Fr_nfe_transmissao.BtnOK.Enabled := True;
    DeleteFile(arquivo_nfe);
    DeleteFile(arquivo_procnfe);
    DeleteFile(arquivo_ReciboNFe);
  end;

  if finalizado then
  begin
    Fr_nfe_transmissao.lbResultado.Visible := True;
    if msgerros = '' then
      Fr_nfe_transmissao.lbResultado.Caption :=
        'Processo de Gerar NFe foi concluído com Sucesso.'
    else
      Fr_nfe_transmissao.lbResultado.Caption := 'Houve erro no processo.';
    Fr_nfe_transmissao.Refresh;
    Fr_nfe_transmissao.MsgErro.Enabled := false;
    Fr_nfe_transmissao.BtnOK.Enabled := True;
    sleep(500);
  end;

  Fr_nfe_transmissao.Update;
  sleep(2000);
end;

procedure TNFePedido.GravarChaveNfe;
begin
  cont := 5;
  Synchronize(Mostra);
  if tipo = 0 then
  begin
    if not dao.Q1.fieldbyname('Chave_NFe').IsNull then
    begin
      dm.FTPNFe.Connect;
      if dm.FTPNFe.Connected then
      begin
        dm.FTPNFe.Delete(dao.Q1.fieldbyname('Chave_NFe').AsString + '-nfe.xml');
        dm.FTPNFe.Quit;
      end;
    end;
  end
  else
  begin
    if not dao.Q1.fieldbyname('Chave_NFe_Dev').IsNull then
    begin
      dm.FTPNFe.Connect;
      if dm.FTPNFe.Connected then
      begin
        dm.FTPNFe.Delete(dao.Q1.fieldbyname('Chave_NFe_Dev').AsString +
          '-nfe.xml');
        dm.FTPNFe.Quit;
      end;
    end;
  end;

  dm.XMLNFe.LoadFromFile(arquivo_nfe);
  dm.XMLNFe.Active := True;
  ChaveNFe := dm.XMLNFe.DocumentElement.ChildNodes.FindNode('infNFe')
    .Attributes['Id'];
  ChaveNFe := Copy(ChaveNFe, 4, 44);
  try
    if not(dao.cn.InTransaction) then
      dao.cn.StartTransaction;

    if tipo = 0 then
      dao.Execsql('update vendas1 set CHAVE_NFE =' + QuotedStr(ChaveNFe) +
        ' where numdoc=' + QuotedStr(dao.Q1.fieldbyname('numdoc').AsString))
    else
      dao.Execsql('update vendas1 set CHAVE_NFE_DEV =' + QuotedStr(ChaveNFe) +
        ' where numdoc=' + QuotedStr(dao.Q1.fieldbyname('numdoc').AsString));

    dao.cn.Commit;

    dm.XMLNFe.Active := false;
  except
    dao.cn.Rollback;
  end;

end;

procedure TNFe.TransfereNfeFTP;
var
  destino: string;
  x: integer;
  conectou: boolean;
begin
  cont := 8;
  Synchronize(Mostra);

  destino := Copy(ExtractFileName(arquivo_nfe), 1,
    length(ExtractFileName(arquivo_nfe)) - length(ExtractFileExt(arquivo_nfe))
    ) + '.xml';
  conectou := false;
  for x := 0 to 4 do
  begin
    if not conectou then
    begin
      try
        if not dm.FTPNFe.Connected then
          dm.FTPNFe.Connect;

        if dm.FTPNFe.Connected then
        begin
          // transfere um arquivo texto
          dm.FTPNFe.TransferType := ftASCII;
          dm.FTPNFe.Put(arquivo_nfe, destino);
          destino := Copy(ExtractFileName(arquivo_procnfe), 1,
            length(ExtractFileName(arquivo_procnfe)) -
            length(ExtractFileExt(arquivo_procnfe))) + '.xml';
          dm.FTPNFe.Put(arquivo_procnfe, destino);

          // desconecta
          dm.FTPNFe.Quit;
          DeleteFile(arquivo_nfe);
          DeleteFile(arquivo_procnfe);
          conectou := True;
        end;
      except
        //
      end;
    end;
  end;
end;

procedure TNFePedido.EnviarLote(arquivo: string);
var
  CabMsg, siglaUF, retWS, msg, tp, pathSaida: string;
  rtfDadosMsg, reciboLst: TStringList;
  tpAmb: integer;
  smensagem: WideString;
  procedure GeraArqRec;
  begin
    reciboLst := TStringList.Create;
    reciboLst.Add(UTF8Encode(dm.ACBrNFe1.WebServices.Retorno.retWS));
    reciboLst.savetofile(pathSaida + 'ReciboLote.xml');
    reciboLst.free;
  end;

begin
  cont := 6;
  pathSaida := ExtractFilePath(Application.ExeName) + 'nf\';
  Synchronize(Mostra);
  try
    dm.ACBrNFe1.Enviar(1, false);
    GeraArqRec;
  except

    on E: Exception do
    begin
      if dm.ACBrNFe1.WebServices.Retorno.cStat <> 539 then
        erro := True
      else
        dm.nfe_duplicada := True;
      msgerros := UTF8Encode(E.Message);
      GeraArqRec;
    end;
  end;
end;

function TNFe.GerarXMLProcNFe: boolean;
var
  NomeArquivo, gPathNFe: string;
  prot, faturado: WideString;
begin
  try
    gPathNFe := ExtractFilePath(Application.ExeName) + 'nf\';
    dm.ACBrNFe1.NotasFiscais.Clear;
    dm.ACBrNFe1.NotasFiscais.LoadFromFile(gPathNFe + chave_nfe + '-nfe.xml');

   // dm.ACBrNFe1.NotasFiscais.Add;
    dm.ACBrNFe1.Consultar;


    {dm.ACBrNFe1.WebServices.Consulta.NFeChave := chave_nfe;
    dm.ACBrNFe1.WebServices.Consulta.Executar;}
//    dm.ACBrNFe1.Consultar(chave_nfe);



    {
    prot := dm.ACBrNFe1.WebServices.Consulta.Protocolo;
    status := inttostr(dm.ACBrNFe1.WebServices.Consulta.cStat);
    motivo := dm.ACBrNFe1.WebServices.Consulta.XMotivo;
    }
   // dm.ACBrNFe1.NotasFiscais.Items[0].nfe.procNFe := dm.ACBrNFe1.WebServices.Consulta.protNFe;

    prot := dm.ACBrNFe1.NotasFiscais.Items[0].nfe.procNFe.nProt;
    status := inttostr(dm.ACBrNFe1.NotasFiscais.Items[0].nfe.procNFe.cStat);
    motivo := dm.ACBrNFe1.NotasFiscais.Items[0].nfe.procNFe.xMotivo;

    if prot = '' then
    begin
      dm.ACBrNFe1.WebServices.Consulta.NFeChave := chave_nfe;
      dm.ACBrNFe1.WebServices.Consulta.Executar;
      prot := dm.ACBrNFe1.WebServices.Consulta.Protocolo;
      status := inttostr(dm.ACBrNFe1.WebServices.Consulta.cStat);
      motivo := dm.ACBrNFe1.WebServices.Consulta.XMotivo;
    end;

    if prot = '' then
    begin
      Result := false;
      exit;
    end;

    if motivo = 'Uso Denegado' then
      faturado := '5'
    else
      faturado := '1';

    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
    dao.Execsql('update vendas1 set motivo_nfe = ' + QuotedStr(motivo) +
      ', status_nfe = ' + status + ', protocolo_nfe = ' + QuotedStr(prot) +
      ', faturado = ' + faturado + ' where chave_nfe = ' +
      QuotedStr(dm.ACBrNFe1.WebServices.Consulta.NFeChave));
    dao.cn.Commit;

    NomeArquivo := gPathNFe + chave_nfe + '-procNfe.xml';
    arquivo_procnfe := NomeArquivo;

   // dm.ACBrNFe1.NotasFiscais.Items[0].NomeArq := arquivo_procnfe;
    dm.ACBrNFe1.NotasFiscais.GravarXML(arquivo_procnfe);
    {
      if not dm.FTPNFe.Connected then
      dm.FTPNFe.Connect;

      if dm.FTPNFe.Connected then
      begin
      // transfere um arquivo texto
      dm.FTPNFe.TransferType := ftASCII;
      dm.FTPNFe.Put(NomeArquivo, chave_nfe + '-procNFe.xml');
      // desconecta
      dm.FTPNFe.Quit;
      end;
    }
    Result := True;
  except
    Result := false;
  end;
  // DeleteFile(NomeArquivo);
end;

procedure TNFePedido.GravarReciboNfe;
var
  strVersaoDados, strCabecXML, strDados, Protocolo, digest, dataStr: string;
  reciboLst: TStringList;
  data: TDateTime;

  procedure SetaData;
  var
    dataarr: TStringList;
    horastr: string;
  begin
    horastr := Copy(dataStr, pos('T', dataStr) + 1, 8);
    dataStr := Copy(dataStr, 1, pos('T', dataStr) - 1);
    dataarr := TStringList.Create;
    dataarr := fmfun.explode(dataStr, '-');
    dataStr := dataarr[2] + '/' + dataarr[1] + '/' + dataarr[0];
    dataarr.free;
    data := strtodatetime(dataStr + ' ' + horastr);
  end;

  procedure ConsultaStatusLote(ChaveNFe: string);
  var
    xmlRecibo: IXMLNode;
    SxmlRecibo: TStringList;
    procedure RecuperaChaveNfe(chave: string);
    var
      sqlNfe: string;
    begin

      if tipo = 0 then
        sqlNfe := 'update vendas1 set CHAVE_NFE =' + QuotedStr(ChaveNFe) +
          ' where numdoc =' + dao.Q1.fieldbyname('numdoc').AsString
      else
        sqlNfe := 'update vendas1 set CHAVE_NFE_DEV =' + QuotedStr(ChaveNFe) +
          ' where numdoc =' + dao.Q1.fieldbyname('numdoc').AsString;

      try
        if not(dao.cn.InTransaction) then
          dao.cn.StartTransaction;
        dao.Execsql(sqlNfe);
        dao.cn.Commit;
      except
        dao.cn.Rollback;
      end;
    end;

  begin
    SxmlRecibo := TStringList.Create;
    SxmlRecibo.LoadFromFile(pathSaida + 'ReciboLote.xml');
    SxmlRecibo.Text := StringReplace(SxmlRecibo.Text, 'ç', 'c', [rfReplaceAll]);
    SxmlRecibo.savetofile(pathSaida + 'ReciboLote.xml');
    arquivo_ReciboNFe := pathSaida + 'ReciboLote.xml';
    dm.XMLNFe.LoadFromFile(pathSaida + 'ReciboLote.xml');

    if Assigned(dm.XMLNFe.DocumentElement.ChildNodes.FindNode('protNFe')) then
    begin
      xmlRecibo := dm.XMLNFe.DocumentElement.ChildNodes.FindNode('protNFe');
      xmlRecibo.ChildNodes.First;

      status := '';
      motivo := '';
      Protocolo := '';
      digest := '';
      dataStr := '';

      while not(xmlRecibo = nil) do
      begin
        if ChaveNFe = xmlRecibo.ChildNodes.FindNode('infProt')
          .ChildNodes.FindNode('chNFe').Text then
        begin
          status := xmlRecibo.ChildNodes.FindNode('infProt')
            .ChildNodes.FindNode('cStat').Text;
          motivo := xmlRecibo.ChildNodes.FindNode('infProt')
            .ChildNodes.FindNode('xMotivo').Text;
          if status = '100' then
            Protocolo := xmlRecibo.ChildNodes.FindNode('infProt')
              .ChildNodes.FindNode('nProt').Text
          else
          begin
            Protocolo := 'null';
            erro := True;
            msgerros := motivo;
          end;
          digest := xmlRecibo.ChildNodes.FindNode('infProt')
            .ChildNodes.FindNode('digVal').Text;
          dataStr := xmlRecibo.ChildNodes.FindNode('infProt')
            .ChildNodes.FindNode('dhRecbto').Text;
          SetaData;
          if status = '539' then
          begin
            dm.nfe_duplicada := True;
            RecuperaChaveNfe(motivo);
          end;
        end;
        xmlRecibo := xmlRecibo.NextSibling;
      end;
      // fm_nfe_envio_lotedm.XMLNFe.Active := false;
    end;
  end;

  procedure ConsultaStatusNFe(ChaveNFe: string);
  begin
    dm.ACBrNFe1.WebServices.Consulta.NFeChave := ChaveNFe;
    try
      if not dm.ACBrNFe1.WebServices.Consulta.Executar then
      begin
        erro := True;
        msgerros := UTF8Encode(dm.ACBrNFe1.WebServices.Consulta.XMotivo);
      end
      else
      begin
        reciboLst := TStringList.Create;
        reciboLst.Add(UTF8Encode(dm.ACBrNFe1.WebServices.Consulta.retWS));
        reciboLst.savetofile(pathSaida + 'Recibo.xml');
        arquivo_ReciboNFe := pathSaida + 'Recibo.xml';
        reciboLst.free;

        // dm.XMLNFe.Active := true;
        dm.XMLNFe.LoadFromFile(pathSaida + 'Recibo.xml');

        if Assigned(dm.XMLNFe.DocumentElement.ChildNodes.FindNode('chNFe')) then
        begin
          status := '';
          motivo := '';
          Protocolo := '';
          digest := '';
          dataStr := '';

          if ChaveNFe = dm.XMLNFe.DocumentElement.ChildNodes.FindNode('chNFe').Text
          then
          begin
            status := dm.XMLNFe.DocumentElement.ChildNodes.FindNode
              ('cStat').Text;
            motivo := dm.XMLNFe.DocumentElement.ChildNodes.FindNode
              ('xMotivo').Text;
            if status = '100' then
            begin
              Protocolo := dm.XMLNFe.DocumentElement.ChildNodes.FindNode
                ('protNFe').ChildNodes.FindNode('infProt')
                .ChildNodes.FindNode('nProt').Text;
              digest := dm.XMLNFe.DocumentElement.ChildNodes.FindNode('protNFe')
                .ChildNodes.FindNode('infProt').ChildNodes.FindNode
                ('digVal').Text;
              dataStr := dm.XMLNFe.DocumentElement.ChildNodes.FindNode
                ('protNFe').ChildNodes.FindNode('infProt')
                .ChildNodes.FindNode('dhRecbto').Text;
              SetaData;
            end
            else
            begin
              Protocolo := 'null';
              digest := 'null';
              dataStr := 'null';
            end;
          end;
        end;
        // fm_nfe_envio_lote.XMLNFe.Active := false;
        DeleteFile(pathSaida + 'Recibo.xml');
      end;
    except
      on E: Exception do
      begin
        erro := True;
        msgerros := UTF8Encode(E.Message);
      end;
    end;
  end;

  procedure CarregaStatusLote;
  var
    arquivoNFe: string;
  begin
    dm.ACBrNFe1.WebServices.recibo.recibo := recibo;

    try
      if not dm.ACBrNFe1.WebServices.recibo.Executar then
      begin
        erro := True;
        msgerros := UTF8Encode(dm.ACBrNFe1.WebServices.recibo.retWS);
      end
      else
        GerarXMLProcNFe;
    except
      on E: Exception do
      begin
        erro := True;
        msgerros := UTF8Encode(E.Message);
        // ConsultaStatusLote(dm.PrChave_NFe.Text);
      end;
    end;

  end;

{ procedure ImprimirDanfe(chave, protocolo: string; data: TDateTime);
  var
  arquivoNFe, arquivoPDF, pathSaida: string;
  begin
  pathSaida := ExtractFilePath(Application.ExeName) + 'nf\';
  arquivoNFe := chave + '-nfe.xml';
  dm.ACBrNFe1.NotasFiscais.Clear;
  //    dm.ACBrNFe1.DANFE.Impressora := fmfun.BuscaImpressoraPadrao;
  dm.ACBrNFe1.NotasFiscais.LoadFromFile(pathSaida + arquivoNFe);
  dm.ACBrNFe1.DANFE.ProtocoloNFe := protocolo + ' ' + formatdatetime('dd/mm/yyyy hh:mm:ss', data);
  dm.ACBrNFe1.DANFE.ImprimirDANFE();
  end;
}

  function AtualizaStatusNFe: boolean;
  var
    sqlNfe, faturado: string;
  begin
    CarregaStatusLote;
    ConsultaStatusNFe(ChaveNFe);

    if status <> '100' then
    begin
      ConsultaStatusLote(ChaveNFe);
      if status <> '100' then
        faturado := '0'
      else
      begin
        if ((dao.Q1.fieldbyname('cod_fiscal').AsString = '5102') or
          (dao.Q1.fieldbyname('cod_fiscal').AsString = '6102') or
          (dao.Q1.fieldbyname('cod_fiscal').AsString = '5101') or
          (dao.Q1.fieldbyname('cod_fiscal').AsString = '6101') or
          (dao.Q1.fieldbyname('cod_fiscal').AsString = '5405') or
          (dao.Q1.fieldbyname('cod_fiscal').AsString = '6403')) then
          faturado := '1'
        else
          faturado := '3';
      end
    end
    else
    begin
      if ((dao.Q1.fieldbyname('cod_fiscal').AsString = '5102') or
        (dao.Q1.fieldbyname('cod_fiscal').AsString = '6102') or
        (dao.Q1.fieldbyname('cod_fiscal').AsString = '5101') or
        (dao.Q1.fieldbyname('cod_fiscal').AsString = '6101') or
        (dao.Q1.fieldbyname('cod_fiscal').AsString = '5405') or
        (dao.Q1.fieldbyname('cod_fiscal').AsString = '6403')) then
        faturado := '1'
      else
        faturado := '3';
    end;

    if trim(motivo) = 'Uso Denegado' then
    begin
      faturado := '5';
      status := '110';
    end;

    if tipo = 0 then
    begin
      sqlNfe := 'update vendas1 set ' + '  RECIBO_NFE =' + QuotedStr(recibo) +
        ', STATUS_NFE = ' + status + ', MOTIVO_NFE = ' + QuotedStr(motivo);

      if digest <> 'null' then
        sqlNfe := sqlNfe + ' , DIGEST_NFE = ' + QuotedStr(digest);

      if Protocolo <> 'null' then
        sqlNfe := sqlNfe + ' , PROTOCOLO_NFE = ' + QuotedStr(Protocolo);

      sqlNfe := sqlNfe + ', DATA_REC_NFE = ' +
        QuotedStr(formatdatetime('dd/mm/yyyy hh:mm:ss', data)) +
        ', EMAIL_NFE = 0 ' + ', FATURADO     = ' + faturado + ' where numdoc ='
        + dao.Q1.fieldbyname('Numdoc').AsString;
    end
    else
    begin
      sqlNfe := 'update vendas1 set ' + '  RECIBO_NFE_DEV =' + QuotedStr(recibo)
        + ', STATUS_NFE_DEV = ' + status + ', MOTIVO_NFE_DEV = ' +
        QuotedStr(motivo);

      if digest <> 'null' then
        sqlNfe := sqlNfe + ' , DIGEST_NFE_DEV = ' + QuotedStr(digest);

      if Protocolo <> 'null' then
        sqlNfe := sqlNfe + ' , PROTOCOLO_NFE_DEV = ' + QuotedStr(Protocolo);

      sqlNfe := sqlNfe + ', DATA_REC_NFE_DEV = ' +
        QuotedStr(formatdatetime('dd/mm/yyyy hh:mm:ss', data)) +
        ' where numdoc =' + dao.Q1.fieldbyname('Numdoc').AsString;

    end;
    try
      if not(dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      dao.Execsql(sqlNfe);
      dao.cn.Commit;
    except
      dao.cn.Rollback;
    end;

    dao.Geral4('SELECT COD_PRODUTO, QTD FROM VENDAS2 WHERE NUMDOC = ' +
      dao.Q1.fieldbyname('Numdoc').AsString);
    dao.q4.First;


    { try
      if status = '100' then
      ImprimirDanfe(cChaveNfe, protocolo, data);
      finally
      DeleteFile(pathSaida + 'ReciboLote.xml');
      end;
    }
  end;

begin
  cont := 7;
  Synchronize(Mostra);
  pathSaida := ExtractFilePath(Application.ExeName) + 'nf\';

  dm.XMLNFe.Active := True;
  dm.XMLNFe.LoadFromFile(pathSaida + 'ReciboLote.xml');
  recibo := dm.XMLNFe.DocumentElement.ChildNodes.FindNode('nRec').Text;
  dm.XMLNFe.Active := false;
  // DeleteFile(pathSaida + 'ReciboLote.xml');

  AtualizaStatusNFe;

end;

procedure TNFeRecXml.Execute;
var cmd : string;
    xml_st : TStringList;
  procedure EfetuaConsulta;
  begin
    cmd := 'select case when a.nfe <> ' + inttostr(num_nfe) +
      ' then 1 else 0 end as tipo, ' +
      'a.NUMDOC, (select b.nfe from vendas1 b where b.NUMDOC = a.numdoc_ref) as nfe_ref, a.HORA, a.DTADOC, a.MOTIVO_NFE_CANCEL_INTERNO, a.COD_CLIENTE, a.COD_USUARIO, a.EMPRESA_FATURAR, '
      + ' a.FATURADO, a.CONSIGNACAO, a.ORCAMENTO, a.ENTREGUE, a.TOT_BRUTO, a.DESCONTO, a.TOT_LIQUIDO, a.valordescontoadic, '
      + ' a.PRAZO_PGTO, a.COD_FOP, a.NUM_CUPOM, a.TIPO_VENDA, a.QTD_PARCELAS, a.PONTO_USADO, '
      + ' a.USUARIO_DESFATUROU, a.COD_REPRESENTANTE, a.COD_PRAZO_PGTO, a.CUSTO_TOTAL, a.LUCRO_MEDIO, '
      + ' a.DTA_EMISSAO, a.DTA_SAIDA, a.EMPRESA_FATURAR, a.NF, a.OBSERVACOES_PEDIDO, a.OBSERVACOES_NOTA, '
      + ' a.COD_TRANSPORTADORA, a.TIPO_FRETE, a.VOLUME_NOTA, a.PESO_NOTA, a.COD_CARGA, a.VL_FRETE, '
      + ' a.CONTATO_FRETE, a.PED_IMPRESSO, a.DTA_VENCIMENTO_CONSIG, a.CANCELADO, a.CONTEM_AVARIA, '
      + ' a.CONTEM_ETIQUETA, a.MOTIVO_TROCA, a.NR_VENDA_ORIGINAL, a.PEDIDO, a.VENDA_ENVIADA, '
      + ' a.CREDITO_USADO, a.NR_PEDIDO_PALM, a.BOLETO_ANEXO, a.COD_FISCAL, a.VLR_COMISSAO, '
      + ' a.VLR_BC_ICMS, a.VLR_ICMS, a.VLR_ST, a.VLR_TOT_NF, a.VLR_BC_ICMS_ST, '
      + ' coalesce(a.CHAVE_NFE, a.CHAVE_NFE_DEV) AS CHAVE_NFE, a.VLR_DESCONTO_GERAL, '
      + ' a.RECIBO_NFE, a.STATUS_NFE, a.MOTIVO_NFE, a.DIGEST_NFE, a.PROTOCOLO_NFE, a.DATA_REC_NFE, '
      + ' a.JUSTIF_CANC_NFE, a.COD_SUPERVISOR, a.COD_FORNECEDOR, a.NFE, a.VLR_IPI, a.PALM_NR_CONEXAO, '
      + ' a.SINCRONIZAR_PALM, a.NUMDOC_REF, a.FRETE_COMBINADO, a.DT_FRETE_COMBINADO, a.EMAIL_NFE, '
      + ' a.EMAIL_PEDIDO, a.PEDIDO_VENDEDOR, a.USUARIO_CHECOU_PEDIDO_VENDEDOR, a.CONTA_BOLETO, a.AVISOGNRE, '
      + ' a.USUARIO_CHECOU_FRETE_COMBINADO, a.ABERTO_USUARIO, a.MAQUINA_USUARIO_ABERTO, A.CARTACORRECAO, '
      + ' case when (a.DATA_REC_NFE + 1) < current_timestamp THEN 1 ELSE 0 END AS PRAZO_CANCEL, a.USUARIO_LIBEROU_DESCONTO, a.MOTIVO_LIBERACAO_DESCONTO, '
      + ' c.nom_cliente, c.cnpj, c.pre_cadastro, c.desconto_maximo, CASE WHEN a.cod_cliente is not null then CASE WHEN c.IE = ''ISENTO'' THEN 1 ELSE CASE WHEN c.ie is null  and c.TIP_PESSOA = ''J'' THEN 2 ELSE 0 END END END AS ISENTO, '
      + ' r.nom_representante, r.funcionario, f.nom_fop, f.desconto as desconto_forma, pz.desconto as desconto_prazo, pz.prazo, '
      + ' a.CHAVE_NFE_DEV, a.RECIBO_NFE_DEV, a.STATUS_NFE_DEV, a.MOTIVO_NFE_DEV, a.DIGEST_NFE_DEV, a.PROTOCOLO_NFE_DEV, a.DATA_REC_NFE_DEV, a.JUSTIF_CANC_NFE_DEV, a.NFE_DEV, '
      + ' e.CNPJ as CNPJ_EMPRESA, ' + ' e.NOM_EMPRESA AS RAZAO_SOCIAL_EMPRESA, '
      + ' nfr.CHAVE_NFE as CHAVE_NFE_REF, ' +
      ' e.NOM_FANTASIA AS NOM_FANTASIA_EMPRESA, ' +
      ' e.ENDERECO AS ENDERECO_EMPRESA, ' +
      ' e.NR_ENDERECO AS NR_ENDERECO_EMPRESA, ' +
      ' e.COMPLEMENTO AS COMPLEMENTO_EMPRESA, ' +
      ' e.BAIRRO AS BAIRRO_EMPRESA, ' + ' ce.COD_IBGE as COD_IBGE_EMPRESA, ' +
      ' ce.NOM_CIDADE AS NOM_CIDADE_EMPRESA, ' + ' ce.UF AS UF_EMPRESA, ' +
      ' e.CEP AS CEP_EMPRESA, ' + ' e.FONE AS FONE_EMPRESA, ' +
      ' e.IE AS IE_EMPRESA, ' + ' E.INDUSTRIA, ' + ' e.SERIE_CERTIFICADO, ' +
      ' e.ENQUADRADA_SIMPLES, ' + ' c.cpf as CPF_CLIENTE, ' +
      ' coalesce(fn.CNPCPF, C.CNPJ)  as CNPJ_CLIENTE, ' +
      ' coalesce(FN.RAZAO_SOCIAL, C.NOM_CLIENTE) AS RAZAO_SOCIAL_CLIENTE, ' +
      ' coalesce(fn.FANTASIA, c.NOM_FANTASIA) AS NOM_FANTASIA_CLIENTE, ' +
      ' coalesce(fn.ENDERECO, c.ENDERECO) AS ENDERECO_CLIENTE, ' +
      ' coalesce(fn.NR_ENDERECO, c.NR_ENDERECO) AS NR_ENDERECO_CLIENTE, ' +
      ' coalesce(fn.COMPLEMENTO, c.COMPLEMENTO) AS COMPLEMENTO_CLIENTE, ' +

      ' coalesce(fn.BAIRRO, c.BAIRRO) AS BAIRRO_CLIENTE, ' +
      ' cd.COD_IBGE as COD_IBGE_CLIENTE, ' +
      ' cd.NOM_CIDADE AS NOM_CIDADE_CLIENTE, ' + ' cd.UF AS UF_CLIENTE, ' +
      ' coalesce(fn.CEP, c.CEP) AS CEP_CLIENTE, ' +
      ' coalesce(fn.fone, c.TELEFONE) AS FONE_CLIENTE, ' +
      ' coalesce(fn.IERG, c.IE) AS IE_CLIENTE, ' + ' T.CNPJ as CNPJ_TRANSP, ' +
      ' T.NOME AS RAZAO_SOCIAL_TRANSP, ' + ' T.ENDERECO AS ENDERECO_TRANSP, ' +
      ' T.BAIRRO AS BAIRRO_TRANSP, ' + ' ct.COD_IBGE as COD_IBGE_TRANSP, ' +
      ' ct.NOM_CIDADE AS NOM_CIDADE_TRANSP, ' + ' ct.UF AS UF_TRANSP, ' +
      ' T.CEP AS CEP_TRANSP, ' + ' T.FONE AS FONE_TRANSP, ' +
      ' T.IE AS IE_TRANSP, ' + ' cf.cod_fiscal, ' + ' cf.nome as desc_fiscal, '
      + ' V2.ID, COALESCE(V2.PROMOCAO, ''N'') AS PROMOCAO, ' + ' V2.NCM, ' +
      ' V2.TRIB_ICMS, ' + ' V2.COD_FISCAL_ITEM, ' + ' V2.CESTA_BASICA, ' +
      ' V2.COD_PRODUTO, ' + ' V2.VOLUME, ' + ' V2.QTD, ' +
      ' COALESCE(V2.PRECO_CUSTO, P.CUSTO_TOTAL) AS PRECO_CUSTO, ' +
      ' V2.PRECO_BRUTO, ' + ' V2.VLR_COMISSAO, ' + ' p.cod_grupo, ' +
      ' V2.DESCONTO, ' + ' V2.PRECO, ' + ' V2.sub_total, ' +
      ' COALESCE(V2.ipi_item, 0) AS IPI_ITEM, ' +
      ' COALESCE(V2.vlr_ipi_item,0) AS VLR_IPI_ITEM, ' +
      ' COALESCE(V2.vlr_bc,0) AS VLR_BC, ' +
      ' COALESCE(V2.icms_item, 0) AS ICMS_ITEM, ' +
      ' COALESCE(V2.vlr_icms_item,0) AS VLR_ICMS_ITEM, ' +
      ' COALESCE(V2.vlr_agr_item,0) AS VLR_AGR_ITEM, ' +
      ' COALESCE(V2.vlr_bc_st,0) AS VLR_BC_ST, ' +
      ' COALESCE(V2.vlr_icms_st,0) AS VLR_ICMS_ST, ' +
      ' CASE WHEN V2.PROMOCAO = ''S'' THEN P.PRECO_PROMOCAO ELSE P.PRECO_VENDA END PRECO_VENDA, '
      + ' p.nom_produto, ' + ' p.QTD_ESTOQUE, ' + ' p.qtd_embalagem, ' +
      ' p.CODIGO_BARRA, ' + ' p.unidade, ' + ' p.ESTOQUE_MINIMO, v2.cest, ' +
      ' p.QTD_RESERVADO, ' + ' P.GRADE_COMISSAO, ' + ' P.PESO, ' +
      ' e.cod_empresa, c.TIP_PESSOA, c.endereco, c.nr_endereco, ' +
      ' (P.PESO * V2.QTD) AS PESO_TOTAL ' + 'from vendas1 a ' +
      'left join vendas2 v2 on v2.NUMDOC = a.NUMDOC ' +
      'left join produto p on p.cod_produto = v2.cod_produto ' +
      'left join cliente c on c.cod_cliente = a.cod_cliente ' +
      'left join fornecedor fn on fn.cod_fornecedor = a.cod_fornecedor ' +
      'left join cidades cd on cd.cod_cidade = coalesce(fn.COD_CIDADE, c.cod_cidade) '
      + 'left join representante r on r.id = a.cod_representante ' +
      'left join fop f on f.cod_fop = a.cod_fop ' +
      'left join prazo pz on pz.id = a.cod_prazo_pgto ' +
      'left join empresa e on e.cod_empresa = a.empresa_faturar ' +
      'left join cidades ce on ce.cod_cidade= e.cod_cidade ' +
      'left join transportadora t on t.cod_transportadora = a.cod_transportadora '
      + 'left join cidades ct on ct.cod_cidade= t.cod_cidade ' +
      'left join cod_fiscal cf on cf.cod_fiscal= a.cod_fiscal ' +
      'left join NFE_REF_DEV nfr on nfr.NUMDOC = a.numdoc ' +
      'where a.numdoc = ' + inttostr(pedido) + ' and (a.nfe_dev = ' +
      inttostr(num_nfe) + ' or a.nfe = ' + inttostr(num_nfe) +
      ') and a.EMPRESA_FATURAR = ' + inttostr(empresa);

    dao.geral1(cmd);

    dao.q1.First;

  end;
begin
  try
    CoInitialize(nil);
    efetuaconsulta;

    dm.ACBrNFe1.Configuracoes.Certificados.NumeroSerie := dao.Q1.fieldbyname('SERIE_CERTIFICADO').AsString;
    dm.ACBrNFe1.Configuracoes.WebServices.Ambiente := FMFUN.BuscaAmbienteNFE;
    dm.ACBrNFe1.Configuracoes.WebServices.UF := dao.Q1.fieldbyname('UF_EMPRESA').AsString;
    dm.ACBrNFe1.Configuracoes.Geral.FormaEmissao := teNormal;
    dm.ACBrNFe1.Configuracoes.ARQUIVOS.PathSchemas := ExtractFilePath(Application.ExeName) + 'Schemas\';
{
    end;
    xml_st := TStringList.Create;
    xml_st.Text := dm.ACBrNFe1.WebServices.DistribuicaoDFe.RetornoWS;

    arquivo_nfe := ExtractFilePath(Application.ExeName) + '\nf\';
    arquivo_nfe := arquivo_nfe + chave_nfe + '-procNfe.xml';

    xml_st.SaveToFile(arquivo_nfe);
     }

    monta_nfe;

{$IFDEF ORBI}frpri.DesabilitaTimers;
{$ENDIF}
    if not erro then
    begin
      GerarXMLProcNFe;

      finalizado := True;
      Synchronize(Mostra);
    end
    else
    begin
      Synchronize(Mostra);
      Fr_nfe_transmissao.MODALRESULT := mrcancel;
    end;

    Fr_nfe_transmissao.BtnOK.Enabled := True;
    Fr_nfe_transmissao.MODALRESULT := mrok;
  finally
    CoUnInitialize;
{$IFDEF ORBI}frpri.HabilitaTimers;
{$ENDIF}
  end;
end;

constructor TNFeRecXml.Create(nr_nfe, nr_pedido, cod_empresa: integer;
  ChaveNFe: string);
begin
  inherited Create(nr_nfe, nr_pedido, cod_empresa, ChaveNFe);
end;

end.
