unit frmMontaXML;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Math,
  XMLDoc, Clipbrd, DB, DBClient, xmldom, XMLIntf, msxmldom, nfe_v200;

procedure CriarDocumento;
procedure GerarNFe(const nfeVersao, nfeID: string);

var
  NomeArquivo: string;
  CaminhoArquivo: string;
  strTpAmb: string;
  SerieNF: string;
  NumeroNF: string;
  CDV: string;
  cXML: IXMLTNFe;
  arqXML: TXMLDocument;
  (* Objetos do Documento XML... *)
  cDetLista: IXMLDet;
  cRefLista: IXMLNFref;
  cRebLista: IXMLTVeiculo;
  cVolLista: IXMLVol;
  cLacLista: IXMLLacres;
  cDupLista: IXMLDup;
  cProcRefLista: IXMLProcRef;
  cDILista: IXMLDI;
  cAdiLista: IXMLAdi;
  cMedLista: IXMLMed;
  cArmLista: IXMLArma;
  cObsLista: IXMLObsFisco;

  {CAMPOS NF-E}
  Empresa_Faturar: string;
  {**Cabeçalho Criação NF-e}
  Nserie_nf: string;
  Nnumero_nf: string;
  Nnumero_ram_nf: string;
  Nnr_documento: string;
  Nnr_documento_ref: string;

  {**Tag Informações da NF-e}
  Nnf_id: string;
  Nnf_versao: string;

  {**Tag Identificação}
  Ncod_uf: string; //Código da UF do emitente do Documento Fiscal. Utilizar a Tabela do IBGE.
  Nnat_operacao: string; // descricao da natureza de operação
  Nmodelo: string; //Código do modelo do Documento Fiscal. Utilizar 55 para identificação da NF-e, emitida em substituição ao modelo 1 e 1A.
  Nindice_pagamento: string; //Indicador da forma de pagamento: 0 – pagamento à vista; 1 – pagamento à prazo; 2 – outros.
  Ndata_emissao: TDate;
  Ndata_saida: string;
  Ntipo_nf: string; // 0-entrada e 1-saida
  Ncod_cidadeFG: string; //Código do Município de Ocorrência do Fato Gerador (utilizar a tabela do IBGE)

  {**Tag NF referenciada}
  Ntipo_impressao: string; //Formato de impressão do DANFE (1 - Retrato; 2 - Paisagem)
  Ntipo_emissao: string; //Forma de emissão da NF-e (1 - Normal; 2 - Contingência)
  Ndigito_verificador: string;
  Ntipo_ambiente: string; // 1-produção e 2-homologação
  Nchave_nf_ref: string;

  Nfinalidade_nf: string; //1-NFe normal - 2-NFe complementar - 3-Nfe ajuste
  Nprocesso_Emissao: string; //Processo de emissão utilizado com a seguinte codificação:
  {0 - emissão de NF-e com aplicativo do contribuinte;
  1 - emissão de NF-e avulsa pelo Fisco;
  2 - emissão de NF-e avulsa, pelo contribuinte com seu certificado digital, através do site
  do Fisco;
  3- emissão de NF-e pelo contribuinte com aplicativo fornecido pelo Fisco.}

  Versao_Programa: string; // 'NDSIS NFE' Versão do Aplicativo Emissor da NFe...

  {* Informações da TAG EMIT... *}
  NCNPJ: string; //cnpj emitente
  NNome: string; // razao social
  NFantasia: string; //Fantasia
  //** tag endereco emitente//
  Nrua: string;
  Nnumero: string;
  Ncomplemento: string;
  NBairro: string;
  Ncod_cidade: string;
  Nnom_cidade: string;
  Nnom_UF: string;
  NCEP: string;
  Ncodigo_Pais: string;
  Nnome_Pais: string;
  Nfone: string;
  Nie: string;

  {* Informações da TAG DEST... *}
  Ncnpj_destino: string;
  Ncpf_destino: string;
  Nnome_destino: string;
  {* TAG EnderDEST... *}
  Nrua_destino: string;
  Nnumero_destino: string;
  Ncomplemento_destino: string;
  NBairro_destino: string;
  Ncod_cidade_destino: string;
  Nnom_cidade_destino: string;
  Nnom_UF_destino: string;
  NCEP_destino: string;
  Ncod_Pais: string;
  Nnom_Pais: string;
  NFone_destino: string;
  Nie_destino: string; (* Caso o destinatário não tenha Inscrição Estadual coloque a palavra "ISENTO" ...*)

  {* TAG ICMS TOTAL *}
  Nbase_calculo_icms_tot: real;
  Nvalor_icms_tot: real;
  Nvalor_bc_ST_tot: real;
  Nvalor_ST_tot: real;
  Nvalor_Produto_tot: real;
  Nvalor_frete_tot: real;
  NValor_Seguro_tot: real;
  Nvalor_Desconto_tot: real;
  Nvalor_II_tot: real;
  Nvalor_IPI_tot: real;
  Nvalor_PIS: real;
  Nvalor_confins: real;
  Nvalor_Outro: real;
  Nvalor_NF: real;

  {transporte }
  Ntipo_frete: string; //Modalidade do frete (0 - por conta do emitente; 1 - por conta do destinatário)
  NCNPJ_trans: string;
  NCPF_trans: string;
  Nrazao_trans: string;
  Nie_trans: string;
  Nender_trans: string;
  Ncidade_trans: string;
  NUF_trans: string;

  NQVol: real;
  NEsp: string;
  NMarca: string;
  NPesoL: real;
  NPesoB: real;

  NObs_nota: string; // informações adicionais do fisco

implementation

uses UnFun, UnPri, Un_dao;

function Alltrim(const Search: string): string;
const
  BlackSpace = [#33..#126];
var
  Index: byte;

begin
  Index := 1;
  while (Index <= Length(Search)) and not (Search[Index] in BlackSpace) do
  begin
    Index := Index + 1;
  end;
  Result := Copy(Search, Index, 255);
  Index := Length(Result);
  while (Index > 0) and not (Result[Index] in BlackSpace) do
  begin
    Index := Index - 1;
  end;
  Result := Copy(Result, 1, Index);
end;

function StrZero(Num: Real; Zeros, Deci: Integer): string;
var
  tam, z: Integer;
  res, zer: string;

begin
  str(Num: Zeros: Deci, res);
  res := Alltrim(res);
  tam := length(res);
  zer := '';
  for z := 1 to (Zeros - tam) do
    zer := zer + '0';
  result := zer + res
end;

(* Essa função retira os pontos de valores numéricos e no lugar da vírgula coloca um ponto...*)

procedure CriarDocumento;
var
  strChaveAcesso: string;
  ano, mes, dia: Word;
  digito_verificador, path: string;
begin
  (* Criando o Documento XML e Gravando cabeçalho... *)
  arqXML := TXMLDocument.Create(nil);
  arqXML.Active := False;
  arqXML.FileName := '';
  cXML := GetNFe(arqXML);
  arqXML.Version := '1.0';
  arqXML.Encoding := 'UTF-8';
  {  arqXML.DocumentElement.Attributes['xmlns:ds'] := 'http://www.w3.org/2000/09/xmldsig#';
    arqXML.DocumentElement.Attributes['xmlns:xsi'] := 'http://www.w3.org/2001/XMLSchema-instance';
    arqXML.DocumentElement.Attributes['xsi:schemaLocation'] := 'http://www.portalfiscal.inf.br/nfe/enviNFe_v2.00.xsd';
   }
  SerieNF := '001';
  NumeroNF := Nnumero_ram_nf; // '118005127'; (* Código Aleatório que irá compor a Chave de Acesso...*)
  (* Montar a Chave de Acesso da NFe de acordo com as informações do Registro...*)
  (* cUF=31,dEmi=...*)
//Código da UF | AAMM da emissão | CNPJ do Emitente | Modelo | Série | Número da  NF-e | Código Numérico | DV
//     02            04                 14              02      03            09               09          01

// DecodeDate(Ndata_emissao, ano, mes, dia);
  strChaveAcesso := FMFUN.MontaChaveAcessoNFe(StrToInt(Ncod_uf), Ndata_emissao, NCNPJ, StrToInt(Nmodelo), StrToInt(Nserie_nf), StrToInt(Nnumero_nf), StrToInt(Ntipo_emissao), strtoint(Nnumero_ram_nf));
  //inutilizei digito_verificador:= FMFUN.calcula_dv_nfe(Ncod_uf, copy(IntToStr(ano),3,2)+ FMFUN.enchezero(inttostr(mes),2),NCNPJ,Nmodelo, SerieNF, NumeroNF, NumeroNF);
  //inutilizei strChaveAcesso:= Ncod_uf+IntToStr(ano)+FMFUN.enchezero(inttostr(mes),2)+NCNPJ+Nmodelo+Nserie_nf+NumeroNF+NumeroNF+digito_verificador;
  // strChaveAcesso := '35080599999090910270550010000000015180051273';

  CDV := Copy(strChaveAcesso, Length(strChaveAcesso), Length(strChaveAcesso));
  frmmontaXml.Ndigito_verificador := CDV; //

  GerarNFe('2.00', 'NFe' + strChaveAcesso);
  path := ExtractFilePath(Application.ExeName);
  NomeArquivo := path + 'nf\';
  NomeArquivo := NomeArquivo + strChaveAcesso + '-nfe.xml';
  arqXML.XML.SaveToFile(NomeArquivo);
  arquivo_nfe := NomeArquivo;
  arqXML := nil;
end;

procedure GerarNFe(const nfeVersao, nfeID: string);
var
  strDEmi, strDSaiEnt, strResultado, slInfCpl: string;
  i, j, h: Integer;
  CestaBasica, SubstituicaoTributaria, Cheque, Dinheiro, Deposito: Boolean;
begin
  (* Informações da TAG InfNFe... *)
  cXML.InfNFe.Id := nfeID;
  cXML.InfNFe.Versao := nfeVersao;

  (* Informações da TAG IDE... *)
  cXML.InfNFe.Ide.CUF := Ncod_uf; //'35';
  cXML.InfNFe.Ide.CNF := Nnumero_ram_nf; // '518005127';
  if (Nnat_operacao = '5353') or (Nnat_operacao = '6353') then
    cXML.InfNFe.Ide.NatOp := 'Transporte a Estabelecimento Comercial';
  if (Nnat_operacao = '5405') or (Nnat_operacao = '6403') then
    cXML.InfNFe.Ide.NatOp := 'Venda';
  if (Nnat_operacao = '5102') or (Nnat_operacao = '6102') then
    cXML.InfNFe.Ide.NatOp := 'Venda';
  if (Nnat_operacao = '5910') or (Nnat_operacao = '6910') then
    cXML.InfNFe.Ide.NatOp := 'Remessa de Bonificacao ou Doacao';
  if (Nnat_operacao = '5202') or (Nnat_operacao = '6202') then
    cXML.InfNFe.Ide.NatOp := 'Remessa de Devolucao';
  if (Nnat_operacao = '5915') or (Nnat_operacao = '6915') then
    cXML.InfNFe.Ide.NatOp := 'Remessa de Mercadoria para Conserto';
  if (Nnat_operacao = '5916') or (Nnat_operacao = '6916') then
    cXML.InfNFe.Ide.NatOp := 'Remessa de Mercadoria Remetido para Conserto';
  if (Nnat_operacao = '5911') or (Nnat_operacao = '6911') then
    cXML.InfNFe.Ide.NatOp := 'Remessa de Amostra Gratis';
  if (Nnat_operacao = '5929') or (Nnat_operacao = '6929') then
    cXML.InfNFe.Ide.NatOp := 'Lancamento de Emissao de Documento Fiscal Relativo a Operacao';
  if (Nnat_operacao = '5949') or (Nnat_operacao = '6949') then
    cXML.InfNFe.Ide.NatOp := 'Outras saidas de mercadorias nao especificadas';

  cXML.InfNFe.Ide.IndPag := Nindice_pagamento; // '0'; (* Zero é Aceitavél como valor... *)
  cXML.InfNFe.Ide.Mod_ := Nmodelo; // '55';
  cXML.InfNFe.Ide.Serie := Nserie_nf; // '1';
  cXML.InfNFe.Ide.NNF := Nnumero_nf; // '1';
  cXML.InfNFe.Ide.DEmi := FormatDateTime('yyyy-mm-dd', Ndata_emissao); // '2008-05-06';

  (* Opcional... *)
  cXML.InfNFe.Ide.DSaiEnt := Ndata_saida; // '2008-05-06';

  cXML.InfNFe.Ide.TpNF := Ntipo_nf; // '0'; (* Zero é Aceitavél como valor... *)
  cXML.InfNFe.Ide.CMunFG := Ncod_cidade;
  if Nfinalidade_nf = '2' then
    cXML.InfNFe.Ide.NFref.Add.RefNFe := Nchave_nf_ref;

  (* Informações da TAG Notas Fiscais Referenciadas... se Houver... *)

  { Essa TAG é Opcional e só aparece no XML se Houver NFes a serem referenciadas na Nota...
  cRefLista := cXML.InfNFe.Ide.NFref.Add;
  cRefLista.RefNFe := Valor;
  cRefLista.RefNF.CUF := Valor;
  cRefLista.RefNF.AAMM := Valor;
  cRefLista.RefNF.CNPJ := Valor;
  cRefLista.RefNF.Mod_ := Valor;
  cRefLista.RefNF.Serie := Valor;
  cRefLista.RefNF.NNF := Valor;
  }

  cXML.InfNFe.Ide.TpImp := Ntipo_impressao; // '1';
  cXML.InfNFe.Ide.TpEmis := Ntipo_emissao; // '1';
  cXML.InfNFe.Ide.CDV := Ndigito_verificador; // '3';
  cXML.InfNFe.Ide.TpAmb := Ntipo_ambiente; // '2';
  cXML.InfNFe.Ide.FinNFe := Nfinalidade_nf; // '1';

  cXML.InfNFe.Ide.ProcEmi := Nprocesso_Emissao; //'0'; (* Zero é Aceitavél como valor... *)
  cXML.InfNFe.Ide.VerProc := '1.0.80'; // Versao_Programa; //'ENDSIS NFE'; //Versão do Aplicativo Emissor da NFe...

  (* Informações da TAG EMIT... *)
  cXML.InfNFe.Emit.CNPJ := NCNPJ; //'99999090910270';
  cXML.InfNFe.Emit.XNome := NNome; //'NF-e Associacao NF-e';
  cXML.InfNFe.Emit.XFant := NFantasia; //  'NF-e';

  (* TAG EnderEMIT... *)
  cXML.InfNFe.Emit.EnderEmit.XLgr := Nrua; // 'Rua Central';
  cXML.InfNFe.Emit.EnderEmit.Nro := Nnumero; // '100';
  cXML.InfNFe.Emit.EnderEmit.XCpl := Ncomplemento; //  'Fundos';
  cXML.InfNFe.Emit.EnderEmit.XBairro := NBairro; // 'Distrito Industrial';
  cXML.InfNFe.Emit.EnderEmit.CMun := Ncod_cidade; // '3502200';
  cXML.InfNFe.Emit.EnderEmit.XMun := Nnom_cidade; // 'Angatuba';
  cXML.InfNFe.Emit.EnderEmit.UF := Nnom_UF; // 'SP';
  cXML.InfNFe.Emit.EnderEmit.CEP := NCEP; // '17100171';
  cXML.InfNFe.Emit.EnderEmit.CPais := Ncodigo_Pais; // '1058';
  cXML.InfNFe.Emit.EnderEmit.XPais := Nnom_Pais; // 'Brasil';
  cXML.InfNFe.Emit.EnderEmit.Fone := Nfone; //'1733021717';
  cXML.InfNFe.Emit.IE := Nie; // '123456789012';

  //  cXML.InfNFe.Emit.IEST := Nie;
  //  cXML.InfNFe.Emit.IM := '1';
  if Empresa_Faturar = '1' then
    cXML.InfNFe.Emit.CRT := '3'
  else
    cXML.InfNFe.Emit.CRT := '1';

  //  cXML.InfNFe.Emit.CNAE := '';

  (* Informações da TAG DEST... *)

  if Ntipo_ambiente = '1' then
  begin
    if trim(Ncpf_destino) <> '' then
      cXML.InfNFe.Dest.CPF := Ncpf_destino;
    if trim(Ncnpj_destino) <> '' then
      cXML.InfNFe.Dest.CNPJ := Ncnpj_destino; //'00000000000191';
    cXML.InfNFe.Dest.XNome := Nnome_destino; //  'DISTRIBUIDORA DE AGUAS MINERAIS';
  end
  else
  begin
    cXML.InfNFe.Dest.CNPJ := '99999999000191'; //'99999090910270';
    cXML.InfNFe.Dest.XNome := 'NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL'; //'NF-e Associacao NF-e';
  end;

  (* TAG EnderDEST... *)
  cXML.InfNFe.Dest.EnderDest.XLgr := Nrua_destino; // 'AV DAS FONTES';
  cXML.InfNFe.Dest.EnderDest.Nro := Nnumero_destino; // '1777';
  cXML.InfNFe.Dest.EnderDest.XCpl := Ncomplemento_destino; // '10 ANDAR';
  cXML.InfNFe.Dest.EnderDest.XBairro := NBairro_destino; // 'PARQUE FONTES';
  cXML.InfNFe.Dest.EnderDest.CMun := Ncod_cidade_destino; // '5030801';
  cXML.InfNFe.Dest.EnderDest.XMun := Nnom_cidade_destino; //  'Sao Paulo';
  cXML.InfNFe.Dest.EnderDest.UF := Nnom_UF_destino; //  'SP';
  cXML.InfNFe.Dest.EnderDest.CEP := NCEP_destino; // '13950000';
  cXML.InfNFe.Dest.EnderDest.CPais := Ncodigo_Pais; //  '1058';
  cXML.InfNFe.Dest.EnderDest.XPais := Nnom_Pais; // 'BRASIL';
  cXML.InfNFe.Dest.EnderDest.Fone := NFone_destino;
  if Ntipo_ambiente = '1' then
    cXML.InfNFe.Dest.IE := Nie_destino; // //'ISENTO'; (* Caso o destinatário não tenha Inscrição Estadual coloque a palavra "ISENTO" ...*)
  //  cXML.InfNFe.Dest.ISUF := strResultado;

(* Informações da TAG RETIRADA... se Houver *)

  {Essa TAG é Opcional e só aparece no XML se Houverem informações de RETIRADA...
  cXML.InfNFe.Retirada.CNPJ := Valor;
  cXML.InfNFe.Retirada.XLgr := Valor;
  cXML.InfNFe.Retirada.Nro := Valor;
  cXML.InfNFe.Retirada.XCpl := Valor;
  cXML.InfNFe.Retirada.XBairro := Valor;
  cXML.InfNFe.Retirada.CMun := Valor;
  cXML.InfNFe.Retirada.XMun := Valor;
  cXML.InfNFe.Retirada.UF := Valor;
  }

(* Informações da TAG ENTREGA... se Houver *)

  {Essa TAG é Opcional e só aparece no XML se Houverem informações de ENTREGA...
  cXML.InfNFe.Entrega.CNPJ := Valor;
  cXML.InfNFe.Entrega.XLgr := Valor;
  cXML.InfNFe.Entrega.Nro := Valor;
  cXML.InfNFe.Entrega.XCpl := Valor;
  cXML.InfNFe.Entrega.XBairro := Valor;
  cXML.InfNFe.Entrega.CMun := Valor;
  cXML.InfNFe.Entrega.XMun := Valor;
  cXML.InfNFe.Entrega.UF := Valor;
  }

(* Informações da TAG DET... *)
  if ((mform = 'vendas_devolucoes') and ((Nnat_operacao = '5410') or (Nnat_operacao = '6410') or (Nnat_operacao = '5202') or (Nnat_operacao = '6202') or (Nnat_operacao = '5915') or (Nnat_operacao = '6915') or (Nnat_operacao = '5949') or (Nnat_operacao = '6949'))) then
  begin
    dao.Geral1('select ' +
      ' a.ID, a.NUMDOC, a.DTADOC, a.COD_PRODUTO, a.COD_CLIENTE, a.COD_REPRESENTANTE, ' +
      ' a.ID_COR, a.ID_TAMANHO, a.QTD, a.QTD_DEVOLVIDA, a.DEVOLVIDO, a.PRECO, a.SUB_TOTAL, ' +
      ' a.DESCONTO, a.VOLUME, a.COD_EMPRESA, a.NR_PEDIDO_PALM, a.PRECO_BRUTO, a.SUB_TOTAL_BRUTO, ' +
      ' a.VLR_COMISSAO, a.TROCA, a.COD_FISCAL_ITEM, a.ICMS_ITEM, a.VLR_ICMS_ST, a.VLR_BC_ST, ' +
      ' a.VLR_ICMS_ITEM, a.NCM, a.VLR_BC, a.IPI_ITEM, a.VLR_IPI_ITEM, a.VLR_AGR_ITEM, a.TRIB_ICMS, ' +
      ' a.CESTA_BASICA, a.COD_SUPERVISOR, a.QTD_EMBALAGEM, a.PRECO_CUSTO, a.PERC_COMISSAO, ' +
      ' a.PROMOCAO, a.DESCONTO_MAX,' +
      ' p.nom_produto, ' +
      ' p.unidade, ' +
      ' p.qtd_embalagem, ' +
      ' p.codigo_barra, ' +
      ' cd.uf ' +
      'from vendas2 a ' +
      'inner join vendas1 v1 on (v1.NUMDOC = a.NUMDOC) ' +
      'inner join FORNECEDOR c on (C.COD_FORNECEDOR = v1.COD_FORNECEDOR) ' +
      'inner join CIDADES cd on (cd.COD_Cidade = c.COD_CIDADE) ' +
      'left join produto p on p.cod_produto=a.cod_produto ' +
      'left join ncm n on (n.CODIGO = a.NCM) ' +
      'where a.numdoc=' + QuotedStr(Nnr_documento));
  end
  else
  begin
    dao.Geral1('select ' +
      ' a.ID, a.NUMDOC, a.DTADOC, a.COD_PRODUTO, a.COD_CLIENTE, a.COD_REPRESENTANTE, ' +
      ' a.ID_COR, a.ID_TAMANHO, a.QTD, a.QTD_DEVOLVIDA, a.DEVOLVIDO, a.PRECO, a.SUB_TOTAL, ' +
      ' a.DESCONTO, a.VOLUME, a.COD_EMPRESA, a.NR_PEDIDO_PALM, a.PRECO_BRUTO, a.SUB_TOTAL_BRUTO, ' +
      ' a.VLR_COMISSAO, a.TROCA, a.COD_FISCAL_ITEM, a.ICMS_ITEM, a.VLR_ICMS_ST, a.VLR_BC_ST, ' +
      ' a.VLR_ICMS_ITEM, a.NCM, a.VLR_BC, a.IPI_ITEM, a.VLR_IPI_ITEM, a.VLR_AGR_ITEM, a.TRIB_ICMS, ' +
      ' a.CESTA_BASICA, a.COD_SUPERVISOR, a.QTD_EMBALAGEM, a.PRECO_CUSTO, a.PERC_COMISSAO, ' +
      ' a.PROMOCAO, a.DESCONTO_MAX,' +
      ' p.nom_produto, ' +
      ' p.unidade, ' +
      ' p.qtd_embalagem, ' +
      ' p.codigo_barra, ' +
      ' cd.uf ' +
      'from vendas2 a ' +
      'inner join vendas1 v1 on (v1.NUMDOC = a.NUMDOC) ' +
      'inner join CLIENTE c on (c.COD_CLIENTE = v1.COD_CLIENTE) ' +
      'inner join CIDADES cd on (cd.COD_Cidade = c.COD_CIDADE) ' +
      'left join produto p on p.cod_produto=a.cod_produto ' +
      'left join ncm n on (n.CODIGO = a.NCM) ' +
      'where a.numdoc=' + QuotedStr(Nnr_documento));
  end;
  if (Nfinalidade_nf <> '1') and (dao.Q1.IsEmpty) then
  begin
    cDetLista := cXML.InfNFe.Det.Add;
    cDetLista.NItem := '1';
    cDetLista.Prod.CProd := '99999';
    cDetLista.Prod.CEAN := ''; (* Se não tiver EAN tem que colocar em Branco...*)
    cDetLista.Prod.XProd := 'COMPLEMENTO'; // 'Agua Mineral';
    cDetLista.Prod.NCM := '39173290'; // 'NCM';
    cDetLista.Prod.CFOP := Nnat_operacao;

    cDetLista.Prod.UCom := '1';
    cDetLista.Prod.QCom := FMFUN.DecimalPonto(FormatFloat('##0.0000', 0)); //'1000000.0000';
    cDetLista.Prod.VUnCom := FMFUN.DecimalPonto(FormatFloat('##0.00', 0)); //'1';

    //    cDetLista.Prod.VProd := FMFUN.DecimalPonto(FormatFloat('##0.00', 0)); // '10000000.00';

    cDetLista.Prod.VProd := FMFUN.DecimalPonto(FormatFloat('##0.00', Nvalor_NF));

    cDetLista.Prod.CEANTrib := ''; (* Se não tiver EAN Trib. tem que colocar em Branco...*)
    cDetLista.Prod.UTrib := 'und'; //'und';
    cDetLista.Prod.QTrib := FMFUN.DecimalPonto(FormatFloat('##0.0000', 0)); //'12000000.0000';
    cDetLista.Prod.VUnTrib := '1';
    cDetLista.Prod.IndTot := '1';

    (*  Será necessário criar regras de negócio  de acordo com o ERP na qual definirá a ocorrência das TAGs de IMPOSTO...*)
    (* TAG ICMS.ICMS00... *)

    if Nbase_calculo_icms_tot > 0 then
    begin
      if Empresa_Faturar = '1' then
      begin
        cDetLista.Imposto.ICMS.ICMS00.Orig := '0';
        cDetLista.Imposto.ICMS.ICMS00.CST := '00';
        cDetLista.Imposto.ICMS.ICMS00.ModBC := '0'; (* Zero é Aceitavél como valor... *)

        cDetLista.Imposto.ICMS.ICMS00.VBC := FMFUN.DecimalPonto(FormatFloat('##0.00', Nbase_calculo_icms_tot)); // '10000000.00';
        if Nnom_UF_destino = 'SC' then
          cDetLista.Imposto.ICMS.ICMS00.PICMS := FMFUN.DecimalPonto(FormatFloat('##0.00', 17))
        else
          cDetLista.Imposto.ICMS.ICMS00.PICMS := FMFUN.DecimalPonto(FormatFloat('##0.00', 12));
        //'18.00';
        cDetLista.Imposto.ICMS.ICMS00.VICMS := FMFUN.DecimalPonto(FormatFloat('##0.00', Nvalor_icms_tot)); //'1800000.00';
      end
      else
      begin
        cDetLista.Imposto.ICMS.ICMSSN900.Orig := '0';
        cDetLista.Imposto.ICMS.ICMSSN900.CSOSN := '900';
        cDetLista.Imposto.ICMS.ICMSSN900.ModBC := '1';
        cDetLista.Imposto.ICMS.ICMSSN900.VBC := FMFUN.DecimalPonto(FormatFloat('##0.00', Nbase_calculo_icms_tot)); // '10000000.00';
        //        cDetLista.Imposto.ICMS.ICMSSN900.PRedBC := FMFUN.DecimalPonto(FormatFloat('##0.00', 1)); //'18.00';
        cDetLista.Imposto.ICMS.ICMSSN900.PICMS := FMFUN.DecimalPonto(FormatFloat('##0.00', 0)); //'18.00';
        cDetLista.Imposto.ICMS.ICMSSN900.VICMS := FMFUN.DecimalPonto(FormatFloat('##0.00', Nvalor_icms_tot)); //'1800000.00';
      end;

    end
    else
    begin

      if Empresa_Faturar = '1' then
      begin
        (* TAG ICMS.ICMS60... *)
        cDetLista.Imposto.ICMS.ICMS60.Orig := '0';
        cDetLista.Imposto.ICMS.ICMS60.CST := '60';
        cDetLista.Imposto.ICMS.ICMS60.VBCSTRet := FMFUN.DecimalPonto(FormatFloat('##0.00', 0));
        cDetLista.Imposto.ICMS.ICMS60.VICMSSTRet := FMFUN.DecimalPonto(FormatFloat('##0.00', 0));
        SubstituicaoTributaria := true;
      end
      else
      begin
        cDetLista.Imposto.ICMS.ICMSSN500.Orig := '0';
        cDetLista.Imposto.ICMS.ICMSSN500.CSOSN := '500';
        cDetLista.Imposto.ICMS.ICMSSN500.VBCSTRet := FMFUN.DecimalPonto(FormatFloat('##0.00', 0));
        cDetLista.Imposto.ICMS.ICMSSN500.VICMSSTRet := FMFUN.DecimalPonto(FormatFloat('##0.00', 0));
        SubstituicaoTributaria := true;
      end;
    end;
    (* TAG PIS.PISALIQ... *)
    if Empresa_Faturar = '1' then
    begin
      cDetLista.Imposto.PIS.PISAliq.CST := '01';
      cDetLista.Imposto.PIS.PISAliq.VBC := FMFUN.DecimalPonto(FormatFloat('##0.00', 0));
      cDetLista.Imposto.PIS.PISAliq.PPIS := '0.65';
      cDetLista.Imposto.PIS.PISAliq.VPIS := FMFUN.DecimalPonto(FormatFloat('##0.00', 0 * 0.0065));
      ;
    end
    else
    begin
      cDetLista.Imposto.PIS.PISOutr.CST := '99';
      cDetLista.Imposto.PIS.PISOutr.QBCProd := '0';
      cDetLista.Imposto.PIS.PISOutr.VAliqProd := '0';
      cDetLista.Imposto.PIS.PISOutr.VPIS := '0';
    end;

    (* TAG COFINS.COFINSALIQ_CST... *)
//     felipe comentou aqui
    if Empresa_Faturar = '1' then
    begin
      cDetLista.Imposto.COFINS.COFINSAliq.CST := '01';
      cDetLista.Imposto.COFINS.COFINSAliq.VBC := FMFUN.DecimalPonto(FormatFloat('##0.00', 0));
      cDetLista.Imposto.COFINS.COFINSAliq.PCOFINS := '2.00';
      cDetLista.Imposto.COFINS.COFINSAliq.VCOFINS := FMFUN.DecimalPonto(FormatFloat('##0.00', 0));
    end
    else
    begin
      cDetLista.Imposto.COFINS.COFINSOutr.CST := '99';
      cDetLista.Imposto.COFINS.COFINSOutr.QBCProd := '0';
      cDetLista.Imposto.COFINS.COFINSOutr.VAliqProd := '0';
      cDetLista.Imposto.COFINS.COFINSOutr.VCOFINS := '0';
    end;
  end
  else
  begin
    dao.q1.First;
    j := 0;
    CestaBasica := false;
    SubstituicaoTributaria := false;
    while not dao.q1.eof do
    begin
      j := j + 1;
      cDetLista := cXML.InfNFe.Det.Add;
      cDetLista.NItem := IntToStr(j);
      cDetLista.Prod.CProd := dao.Q1.fieldbyname('cod_produto').AsString; //'00001';
      cDetLista.Prod.CEAN := dao.Q1.fieldbyname('codigo_barra').AsString; (* Se não tiver EAN tem que colocar em Branco...*)
      cDetLista.Prod.XProd := trim(FMFUN.AnsiToAscii(dao.Q1.fieldbyname('nom_produto').AsString)); // 'Agua Mineral';
      cDetLista.Prod.NCM := FMFUN.TratarCodigoNCM(dao.Q1.fieldbyname('ncm').AsString, 1); // 'NCM';
      cDetLista.Prod.CFOP := dao.Q1.fieldbyname('COD_FISCAL_ITEM').AsString;
      //cDetLista.Prod.EXTIPI := '';
      //cDetLista.Prod.Genero := '';
{    if (Nnat_operacao = '5405') or (Nnat_operacao = '6403') then
      cDetLista.Prod.CFOP := FRPRI.busca_cfop_produto(Nnom_UF_destino, dao.Q1.fieldbyname('trib_icms').AsString, 'S')
    else
      cDetLista.Prod.CFOP := Nnat_operacao;}
//      if Nnom_UF_destino ='SC' then
//          cDetLista.Prod.CFOP := '5101'//dao.Q1.fieldbyname('cod_fiscal_item').AsString;//'5101';
 //     else
  //        cDetLista.Prod.CFOP := '6101';//dao.Q1.fieldbyname('cod_fiscal_item').AsString;//'5101';

      cDetLista.Prod.UCom := inttostr(dao.Q1.fieldbyname('volume').AsInteger) + dao.Q1.fieldbyname('unidade').AsString;
      cDetLista.Prod.QCom := FMFUN.DecimalPonto(FormatFloat('##0.0000', dao.Q1.fieldbyname('qtd').AsFloat)); //'1000000.0000';
      cDetLista.Prod.VUnCom := FMFUN.DecimalPonto(FormatFloat('##0.00', dao.Q1.fieldbyname('preco').AsFloat)); //'1';
      cDetLista.Prod.VProd := FMFUN.DecimalPonto(FormatFloat('##0.00', dao.Q1.fieldbyname('preco').AsFloat * dao.Q1.fieldbyname('qtd').AsFloat)); // '10000000.00';
      cDetLista.Prod.CEANTrib := dao.Q1.fieldbyname('codigo_barra').AsString; (* Se não tiver EAN Trib. tem que colocar em Branco...*)
      cDetLista.Prod.UTrib := 'und'; //'und';
      cDetLista.Prod.QTrib := FMFUN.DecimalPonto(FormatFloat('##0.0000', dao.Q1.fieldbyname('qtd').AsFloat)); //'12000000.0000';
      cDetLista.Prod.VUnTrib := '1';
      cDetLista.Prod.IndTot := '1';
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

      (*  Será necessário criar regras de negócio  de acordo com o ERP na qual definirá a ocorrência das TAGs de IMPOSTO...*)
      (* TAG ICMS.ICMS00... *)

      if (dao.Q1.FieldByName('trib_icms').AsString = '00') or (dao.Q1.FieldByName('trib_icms').AsString = '0') then
      begin
        if Empresa_Faturar = '1' then
        begin
          cDetLista.Imposto.ICMS.ICMS00.Orig := '0';
          cDetLista.Imposto.ICMS.ICMS00.CST := '00';
          cDetLista.Imposto.ICMS.ICMS00.ModBC := '0'; (* Zero é Aceitavél como valor... *)
          cDetLista.Imposto.ICMS.ICMS00.VBC := FMFUN.DecimalPonto(FormatFloat('##0.00', dao.Q1.fieldbyname('vlr_bc').AsFloat)); // '10000000.00';
          cDetLista.Imposto.ICMS.ICMS00.PICMS := FMFUN.DecimalPonto(FormatFloat('##0.00', dao.Q1.fieldbyname('icms_item').AsFloat)); //'18.00';
          cDetLista.Imposto.ICMS.ICMS00.VICMS := FMFUN.DecimalPonto(FormatFloat('##0.00', dao.Q1.fieldbyname('vlr_bc').AsFloat * (dao.Q1.fieldbyname('icms_item').AsFloat / 100))); //'1800000.00';
        end
        else
        begin
          {          if Nnom_UF_destino <> 'PR' then
                    begin
                      cDetLista.Imposto.ICMS.ICMSSN101.Orig := '0';
                      cDetLista.Imposto.ICMS.ICMSSN101.CSOSN := '101';
                      cDetLista.Imposto.ICMS.ICMSSN101.PCredSN := FMFUN.DecimalPonto(FormatFloat('##0.00', dao.Q1.fieldbyname('icms_item').AsFloat)); //'18.00';
                      cDetLista.Imposto.ICMS.ICMSSN101.VCredICMSSN:= FMFUN.DecimalPonto(FormatFloat('##0.00', dao.Q1.fieldbyname('vlr_bc').AsFloat * (dao.Q1.fieldbyname('icms_item').AsFloat / 100))); //'1800000.00';
                    end
                    else begin}
          cDetLista.Imposto.ICMS.ICMSSN900.Orig := '0';
          cDetLista.Imposto.ICMS.ICMSSN900.CSOSN := '900';
          cDetLista.Imposto.ICMS.ICMSSN900.ModBC := '1';
          cDetLista.Imposto.ICMS.ICMSSN900.VBC := FMFUN.DecimalPonto(FormatFloat('##0.00', dao.Q1.fieldbyname('vlr_bc').AsFloat));
          cDetLista.Imposto.ICMS.ICMSSN900.PICMS := FMFUN.DecimalPonto(FormatFloat('##0.00', dao.Q1.fieldbyname('icms_item').AsFloat)); //'18.00';
          cDetLista.Imposto.ICMS.ICMSSN900.VICMS := FMFUN.DecimalPonto(FormatFloat('##0.00', dao.Q1.fieldbyname('vlr_bc').AsFloat * (dao.Q1.fieldbyname('icms_item').AsFloat / 100)));
          //end;
        end;

      end;

      (* TAG ICMS.ICMS40... *)
      if dao.Q1.FieldByName('trib_icms').AsString = '40' then
      begin
        if Empresa_Faturar = '1' then
        begin
          cDetLista.Imposto.ICMS.ICMS40.Orig := '0';
          cDetLista.Imposto.ICMS.ICMS40.CST := '40';
          {      end
                else begin
                  cDetLista.Imposto.ICMS.ICMS40.Orig := '0';
                  cDetLista.Imposto.ICMS.ICMS40.CST := '41';}
        end;
      end;
      if Empresa_Faturar = '1' then
      begin
        if dao.Q1.FieldByName('trib_icms').AsString = '60' then
        begin
          (* TAG ICMS.ICMS60... *)
          cDetLista.Imposto.ICMS.ICMS60.Orig := '0';
          cDetLista.Imposto.ICMS.ICMS60.CST := '60';
          cDetLista.Imposto.ICMS.ICMS60.VBCSTRet := FMFUN.DecimalPonto(FormatFloat('##0.00', dao.Q1.fieldbyname('vlr_bc_st').AsFloat));
          cDetLista.Imposto.ICMS.ICMS60.VICMSSTRet := FMFUN.DecimalPonto(FormatFloat('##0.00', dao.Q1.fieldbyname('vlr_icms_st').AsFloat));
          SubstituicaoTributaria := true;
        end;

        if dao.Q1.FieldByName('trib_icms').AsString = '90' then
        begin
          (* TAG ICMS.ICMS90... *)
          cDetLista.Imposto.ICMS.ICMS90.Orig := '0';
          cDetLista.Imposto.ICMS.ICMS90.CST := '90';
          cDetLista.Imposto.ICMS.ICMS90.ModBCST := '0';
          cDetLista.Imposto.ICMS.ICMS90.PMVAST := FMFUN.DecimalPonto(FormatFloat('##0.00', dao.Q1.fieldbyname('vlr_agr_item').AsFloat));
          cDetLista.Imposto.ICMS.ICMS90.VBCST := FMFUN.DecimalPonto(FormatFloat('##0.00', dao.Q1.fieldbyname('vlr_bc_st').AsFloat));
          cDetLista.Imposto.ICMS.ICMS90.PICMSST := '12.00';
          cDetLista.Imposto.ICMS.ICMS90.VICMSST := FMFUN.DecimalPonto(FormatFloat('##0.00', dao.Q1.fieldbyname('vlr_icms_st').AsFloat));
          CestaBasica := true;
        end;
      end
      else
      begin
        if dao.Q1.FieldByName('trib_icms').AsString = '90' then
        begin
          cDetLista.Imposto.ICMS.ICMSSN202.Orig := '0';
          cDetLista.Imposto.ICMS.ICMSSN202.CSOSN := '202';
          cDetLista.Imposto.ICMS.ICMSSN202.ModBCST := '0';
          cDetLista.Imposto.ICMS.ICMSSN202.PMVAST := FMFUN.DecimalPonto(FormatFloat('##0.00', dao.Q1.fieldbyname('vlr_agr_item').AsFloat));
          cDetLista.Imposto.ICMS.ICMSSN202.VBCST := FMFUN.DecimalPonto(FormatFloat('##0.00', dao.Q1.fieldbyname('vlr_bc_st').AsFloat));
          if Nnom_UF_destino <> 'SC' then
            cDetLista.Imposto.ICMS.ICMSSN202.PICMSST := '12.00'
          else
            cDetLista.Imposto.ICMS.ICMSSN202.PICMSST := '17.00';
          cDetLista.Imposto.ICMS.ICMSSN202.VICMSST := FMFUN.DecimalPonto(FormatFloat('##0.00', dao.Q1.fieldbyname('vlr_icms_st').AsFloat));

          CestaBasica := true;
        end;
        if dao.Q1.FieldByName('trib_icms').AsString = '60' then
        begin
          cDetLista.Imposto.ICMS.ICMSSN500.Orig := '0';
          cDetLista.Imposto.ICMS.ICMSSN500.CSOSN := '500';
          cDetLista.Imposto.ICMS.ICMSSN500.VBCSTRet := FMFUN.DecimalPonto(FormatFloat('##0.00', 0));
          cDetLista.Imposto.ICMS.ICMSSN500.VICMSSTRet := FMFUN.DecimalPonto(FormatFloat('##0.00', 0));
          SubstituicaoTributaria := true;
          SubstituicaoTributaria := true;
        end;
        if dao.Q1.FieldByName('trib_icms').AsString = '40' then
        begin
          cDetLista.Imposto.ICMS.ICMSSN102.Orig := '0';
          cDetLista.Imposto.ICMS.ICMSSN102.CSOSN := '400';
        end;
      end;

      (* TAG IPI... *)
      //Felipe que comentou 22/03/2009
{      cDetLista.Imposto.IPI.ClEnq := dao.Q1.fieldbyname('vlr_icms_st').AsString;
      cDetLista.Imposto.IPI.CNPJProd := Valor;
      cDetLista.Imposto.IPI.CSelo := Valor;
      cDetLista.Imposto.IPI.QSelo := Valor;
 }

      (* TAG IPI.IPITRIB... *)
      if (Empresa_Faturar = '1') and ((Nnat_operacao = '5410') or (Nnat_operacao = '6410') or (dao.Q1.fieldbyname('COD_FISCAL_ITEM').AsString = '5202') or (dao.Q1.fieldbyname('COD_FISCAL_ITEM').AsString = '6202') { or (dao.Q1.fieldbyname('COD_FISCAL_ITEM').AsString = '5102') or (dao.Q1.fieldbyname('COD_FISCAL_ITEM').AsString = '6102')}) then
      begin
        cDetLista.Imposto.IPI.CEnq := '999';
        cDetLista.Imposto.IPI.IPITrib.CST := '50';
        cDetLista.Imposto.IPI.IPITrib.VBC := FMFUN.DecimalPonto(FormatFloat('##0.00', dao.Q1.fieldbyname('sub_total').AsFloat));
        //cDetLista.Imposto.IPI.IPITrib.QUnid := Valor;
        //cDetLista.Imposto.IPI.IPITrib.VUnid := Valor;
        cDetLista.Imposto.IPI.IPITrib.PIPI := FMFUN.DecimalPonto(FormatFloat('##0.00', dao.Q1.fieldbyname('ipi_item').AsFloat));
        cDetLista.Imposto.IPI.IPITrib.VIPI := FMFUN.DecimalPonto(FormatFloat('##0.00', dao.Q1.fieldbyname('vlr_ipi_item').AsFloat));
      end;
      (* TAG IPI.IPINT... *)
      {cDetLista.Imposto.IPI.IPINT.CST := Valor;

      (* TAG II... *)
      cDetLista.Imposto.II.VBC := Valor;
      cDetLista.Imposto.II.VDespAdu := Valor;
      cDetLista.Imposto.II.VII := Valor;
      cDetLista.Imposto.II.VIOF := Valor;
    }
      (* TAG PIS.PISALIQ... *)
      if Empresa_Faturar = '1' then
      begin
        cDetLista.Imposto.PIS.PISAliq.CST := '01';
        cDetLista.Imposto.PIS.PISAliq.VBC := FMFUN.DecimalPonto(FormatFloat('##0.00', dao.Q1.fieldbyname('sub_total').AsFloat));
        cDetLista.Imposto.PIS.PISAliq.PPIS := '0.65';
        cDetLista.Imposto.PIS.PISAliq.VPIS := FMFUN.DecimalPonto(FormatFloat('##0.00', dao.Q1.fieldbyname('sub_total').AsFloat * 0.0065));
        ;
      end
      else
      begin
        cDetLista.Imposto.PIS.PISOutr.CST := '99';
        cDetLista.Imposto.PIS.PISOutr.QBCProd := '0';
        cDetLista.Imposto.PIS.PISOutr.VAliqProd := '0';
        cDetLista.Imposto.PIS.PISOutr.VPIS := '0';
      end;
      {
      (* TAG PIS.PISQTDE... *)
      cDetLista.Imposto.PIS.PISQtde.CST := strResultado;
      cDetLista.Imposto.PIS.PISQtde.QBCProd := strResultado;
      cDetLista.Imposto.PIS.PISQtde.VAliqProd := strResultado;
      cDetLista.Imposto.PIS.PISQtde.VPIS := strResultado;

      (* TAG PIS.PISNT... *)
      cDetLista.Imposto.PIS.PISNT.CST := strResultado;

      (* TAG PIS.PISOUTR... *)
      cDetLista.Imposto.PIS.PISOutr.CST := strResultado;
      cDetLista.Imposto.PIS.PISOutr.VBC := strResultado;
      cDetLista.Imposto.PIS.PISOutr.PPIS := strResultado;
      cDetLista.Imposto.PIS.PISOutr.QBCProd := strResultado;
      cDetLista.Imposto.PIS.PISOutr.VAliqProd := strResultado;
      cDetLista.Imposto.PIS.PISOutr.VPIS := strResultado;

      (* TAG PISST... *)
      cDetLista.Imposto.PISST.VBC := strResultado;
      cDetLista.Imposto.PISST.PPIS := strResultado;
      cDetLista.Imposto.PISST.QBCProd := strResultado;
      cDetLista.Imposto.PISST.VAliqProd := strResultado;
      cDetLista.Imposto.PISST.VPIS := strResultado;
      }
      (* TAG COFINS.COFINSALIQ_CST... *)
//     felipe comentou aqui
      if Empresa_Faturar = '1' then
      begin
        cDetLista.Imposto.COFINS.COFINSAliq.CST := '01';
        cDetLista.Imposto.COFINS.COFINSAliq.VBC := FMFUN.DecimalPonto(FormatFloat('##0.00', dao.Q1.fieldbyname('sub_total').AsFloat));
        cDetLista.Imposto.COFINS.COFINSAliq.PCOFINS := '2.00';
        cDetLista.Imposto.COFINS.COFINSAliq.VCOFINS := FMFUN.DecimalPonto(FormatFloat('##0.00', dao.Q1.fieldbyname('sub_total').AsFloat * 0.02));
      end
      else
      begin
        cDetLista.Imposto.COFINS.COFINSOutr.CST := '99';
        cDetLista.Imposto.COFINS.COFINSOutr.QBCProd := '0';
        cDetLista.Imposto.COFINS.COFINSOutr.VAliqProd := '0';
        cDetLista.Imposto.COFINS.COFINSOutr.VCOFINS := '0';
      end;

      (* TAG COFINS.COFINSQTDE... *)
{
      cDetLista.Imposto.COFINS.COFINSQtde.CST := strResultado;
      cDetLista.Imposto.COFINS.COFINSQtde.QBCProd := strResultado;
      cDetLista.Imposto.COFINS.COFINSQtde.VCOFINS := strResultado;
      cDetLista.Imposto.COFINS.COFINSQtde.VAliqProd := strResultado;

      (* TAG COFINS.COFINSNT... *)
      cDetLista.Imposto.COFINS.COFINSNT.CST := strResultado;

      (* TAG COFINS.COFINSOUTR... *)
      cDetLista.Imposto.COFINS.COFINSOutr.CST := strResultado;
      cDetLista.Imposto.COFINS.COFINSOutr.VBC := strResultado;
      cDetLista.Imposto.COFINS.COFINSOutr.PCOFINS := strResultado;
      cDetLista.Imposto.COFINS.COFINSOutr.QBCProd := strResultado;
      cDetLista.Imposto.COFINS.COFINSOutr.VAliqProd := strResultado;
      cDetLista.Imposto.COFINS.COFINSOutr.VCOFINS := strResultado;

      (* TAG COFINSST... *)
      cDetLista.Imposto.COFINSST.VBC := strResultado;
      cDetLista.Imposto.COFINSST.PCOFINS := strResultado;
      cDetLista.Imposto.COFINSST.QBCProd := strResultado;
      cDetLista.Imposto.COFINSST.VAliqProd := strResultado;
      cDetLista.Imposto.COFINSST.VCOFINS := strResultado;

      (* TAG ISSQN.. *)
      cDetLista.Imposto.ISSQN.VBC := strResultado;
      cDetLista.Imposto.ISSQN.VAliq := strResultado;
      cDetLista.Imposto.ISSQN.VISSQN := strResultado;
      cDetLista.Imposto.ISSQN.CMunFG := strResultado;
      cDetLista.Imposto.ISSQN.CListServ := strResultado;

    end;
    }
      (* TAG ICMS.ICMS40... *)
      if dao.Q1.FieldByName('trib_icms').AsString = '40' then
      begin
        if Empresa_Faturar = '1' then
        begin
          cDetLista.Imposto.ICMS.ICMS40.Orig := '0';
          cDetLista.Imposto.ICMS.ICMS40.CST := '40';
          {      end
                else begin
                  cDetLista.Imposto.ICMS.ICMS40.Orig := '0';
                  cDetLista.Imposto.ICMS.ICMS40.CST := '41';}
        end;
      end;
      if Empresa_Faturar = '1' then
      begin
        if dao.Q1.FieldByName('trib_icms').AsString = '60' then
        begin
          (* TAG ICMS.ICMS60... *)
          cDetLista.Imposto.ICMS.ICMS60.Orig := '0';
          cDetLista.Imposto.ICMS.ICMS60.CST := '60';
          cDetLista.Imposto.ICMS.ICMS60.VBCSTRet := FMFUN.DecimalPonto(FormatFloat('##0.00', 0));
          cDetLista.Imposto.ICMS.ICMS60.VICMSSTRet := FMFUN.DecimalPonto(FormatFloat('##0.00', 0));
          SubstituicaoTributaria := true;
        end;

        if dao.Q1.FieldByName('trib_icms').AsString = '90' then
        begin
          (* TAG ICMS.ICMS90... *)
          cDetLista.Imposto.ICMS.ICMS90.Orig := '0';
          cDetLista.Imposto.ICMS.ICMS90.CST := '90';
          cDetLista.Imposto.ICMS.ICMS90.ModBCST := '0';
          cDetLista.Imposto.ICMS.ICMS90.PMVAST := FMFUN.DecimalPonto(FormatFloat('##0.00', dao.Q1.fieldbyname('vlr_agr_item').AsFloat));
          cDetLista.Imposto.ICMS.ICMS90.VBCST := FMFUN.DecimalPonto(FormatFloat('##0.00', dao.Q1.fieldbyname('vlr_bc_st').AsFloat));
          cDetLista.Imposto.ICMS.ICMS90.PICMSST := '12.00';
          cDetLista.Imposto.ICMS.ICMS90.VICMSST := FMFUN.DecimalPonto(FormatFloat('##0.00', dao.Q1.fieldbyname('vlr_icms_st').AsFloat));
          CestaBasica := true;
        end;
        {      end
              else begin
                if dao.Q1.FieldByName('trib_icms').AsString <> '40' then
                begin
                  cDetLista.Imposto.ICMS.ICMSSN500.Orig := '0';
                  cDetLista.Imposto.ICMS.ICMSSN500.CSOSN := '500';
                  cDetLista.Imposto.ICMS.ICMSSN500.VBCSTRet := FMFUN.DecimalPonto(FormatFloat('##0.00', 0));
                  cDetLista.Imposto.ICMS.ICMSSN500.VICMSSTRet := FMFUN.DecimalPonto(FormatFloat('##0.00', 0));
                  SubstituicaoTributaria := true;
                end
                else begin
                  cDetLista.Imposto.ICMS.ICMSSN102.Orig := '0';
                  cDetLista.Imposto.ICMS.ICMSSN102.CSOSN := '400';
                end;}
      end;

      (* TAG IPI.IPITRIB... *)
 {     if (Empresa_Faturar = '1') and ((dao.Q1.fieldbyname('COD_FISCAL_ITEM').AsString = '5202') or (dao.Q1.fieldbyname('COD_FISCAL_ITEM').AsString = '6202') or (dao.Q1.fieldbyname('COD_FISCAL_ITEM').AsString = '5102') or (dao.Q1.fieldbyname('COD_FISCAL_ITEM').AsString = '6102')) then
      begin
        cDetLista.Imposto.IPI.CEnq := '999';
        cDetLista.Imposto.IPI.IPITrib.CST := '50';
        cDetLista.Imposto.IPI.IPITrib.VBC := FMFUN.DecimalPonto(FormatFloat('##0.00', 0));
      //cDetLista.Imposto.IPI.IPITrib.QUnid := Valor;
      //cDetLista.Imposto.IPI.IPITrib.VUnid := Valor;
        cDetLista.Imposto.IPI.IPITrib.PIPI := FMFUN.DecimalPonto(FormatFloat('##0.00', 0));
        cDetLista.Imposto.IPI.IPITrib.VIPI := FMFUN.DecimalPonto(FormatFloat('##0.00', 0));
      end;}
      (* TAG IPI.IPINT... *)
      {cDetLista.Imposto.IPI.IPINT.CST := Valor;

      (* TAG II... *)
      cDetLista.Imposto.II.VBC := Valor;
      cDetLista.Imposto.II.VDespAdu := Valor;
      cDetLista.Imposto.II.VII := Valor;
      cDetLista.Imposto.II.VIOF := Valor;
    }
      (* TAG PIS.PISALIQ... *)
      if Empresa_Faturar = '1' then
      begin
        cDetLista.Imposto.PIS.PISAliq.CST := '01';
        cDetLista.Imposto.PIS.PISAliq.VBC := FMFUN.DecimalPonto(FormatFloat('##0.00', 0));
        cDetLista.Imposto.PIS.PISAliq.PPIS := '0.65';
        cDetLista.Imposto.PIS.PISAliq.VPIS := FMFUN.DecimalPonto(FormatFloat('##0.00', 0));
        ;
      end
      else
      begin
        cDetLista.Imposto.PIS.PISOutr.CST := '99';
        cDetLista.Imposto.PIS.PISOutr.QBCProd := '0';
        cDetLista.Imposto.PIS.PISOutr.VAliqProd := '0';
        cDetLista.Imposto.PIS.PISOutr.VPIS := '0';
      end;
      (* TAG COFINS.COFINSALIQ_CST... *)
//     felipe comentou aqui
      if Empresa_Faturar = '1' then
      begin
        cDetLista.Imposto.COFINS.COFINSAliq.CST := '01';
        cDetLista.Imposto.COFINS.COFINSAliq.VBC := FMFUN.DecimalPonto(FormatFloat('##0.00', 0));
        cDetLista.Imposto.COFINS.COFINSAliq.PCOFINS := '2.00';
        cDetLista.Imposto.COFINS.COFINSAliq.VCOFINS := FMFUN.DecimalPonto(FormatFloat('##0.00', 0));
        ;
      end
      else
      begin
        cDetLista.Imposto.COFINS.COFINSOutr.CST := '99';
        cDetLista.Imposto.COFINS.COFINSOutr.QBCProd := '0';
        cDetLista.Imposto.COFINS.COFINSOutr.VAliqProd := '0';
        cDetLista.Imposto.COFINS.COFINSOutr.VCOFINS := '0';
      end;
      dao.q1.Next;
    end;
  end;

  (* Informações da TAG TOTAL... *)

 (* TAG ICMSTOT... *)
  cXML.InfNFe.Total.ICMSTot.VBC := FMFUN.DecimalPonto(FormatFloat('##0.00', Nbase_calculo_icms_tot));
  cXML.InfNFe.Total.ICMSTot.VICMS := FMFUN.DecimalPonto(FormatFloat('##0.00', Nvalor_icms_tot));
  {  cXML.InfNFe.Total.ICMSTot.VBCST := FMFUN.DecimalPonto(FormatFloat('##0.00', Nvalor_bc_ST_tot));
    cXML.InfNFe.Total.ICMSTot.VST := FMFUN.DecimalPonto(FormatFloat('##0.00', Nvalor_ST_tot));

    cXML.InfNFe.Total.ICMSTot.VBC := FMFUN.DecimalPonto(FormatFloat('##0.00', 0));
    cXML.InfNFe.Total.ICMSTot.VICMS := FMFUN.DecimalPonto(FormatFloat('##0.00', 0));}
  cXML.InfNFe.Total.ICMSTot.VBCST := FMFUN.DecimalPonto(FormatFloat('##0.00', 0));
  cXML.InfNFe.Total.ICMSTot.VST := FMFUN.DecimalPonto(FormatFloat('##0.00', 0));

  cXML.InfNFe.Total.ICMSTot.VProd := FMFUN.DecimalPonto(FormatFloat('##0.00', Nvalor_Produto_tot));
  cXML.InfNFe.Total.ICMSTot.VFrete := FMFUN.DecimalPonto(FormatFloat('##0.00', 0));
  //FMFUN.DecimalPonto(FormatFloat('##0.00', Nvalor_frete_tot));
  cXML.InfNFe.Total.ICMSTot.VSeg := FMFUN.DecimalPonto(FormatFloat('##0.00', NValor_Seguro_tot));
  cXML.InfNFe.Total.ICMSTot.VDesc := FMFUN.DecimalPonto(FormatFloat('##0.00', Nvalor_Desconto_tot));
  cXML.InfNFe.Total.ICMSTot.VII := FMFUN.DecimalPonto(FormatFloat('##0.00', Nvalor_II_tot));

  if (Empresa_Faturar = '1') and ((Nnat_operacao = '5202') or (Nnat_operacao = '6202') { or (dao.Q1.fieldbyname('COD_FISCAL_ITEM').AsString = '5102') or (dao.Q1.fieldbyname('COD_FISCAL_ITEM').AsString = '6102')}) then
    cXML.InfNFe.Total.ICMSTot.VIPI := FMFUN.DecimalPonto(FormatFloat('##0.00', Nvalor_IPI_tot))
  else
    cXML.InfNFe.Total.ICMSTot.VIPI := FMFUN.DecimalPonto(FormatFloat('##0.00', 0));

  if Empresa_Faturar = '1' then
  begin
    cXML.InfNFe.Total.ICMSTot.VPIS := FMFUN.DecimalPonto(FormatFloat('##0.00', Nvalor_PIS));
    cXML.InfNFe.Total.ICMSTot.VCOFINS := FMFUN.DecimalPonto(FormatFloat('##0.00', Nvalor_confins));
  end
  else
  begin
    cXML.InfNFe.Total.ICMSTot.VPIS := '0';
    cXML.InfNFe.Total.ICMSTot.VCOFINS := '0';
  end;

  cXML.InfNFe.Total.ICMSTot.VOutro := FMFUN.DecimalPonto(FormatFloat('##0.00', Nvalor_Outro));
  cXML.InfNFe.Total.ICMSTot.VNF := FMFUN.DecimalPonto(FormatFloat('##0.00', Nvalor_NF));
  {
    (* TAG ISSQNTOT... Opcional *)
    {
    cXML.InfNFe.Total.ISSQNtot.VServ := Valor;
    cXML.InfNFe.Total.ISSQNtot.VBC := Valor;
    cXML.InfNFe.Total.ISSQNtot.VISS := Valor;
    cXML.InfNFe.Total.ISSQNtot.VPIS := Valor;
    cXML.InfNFe.Total.ISSQNtot.VCOFINS := Valor;

    (* TAG  RETTRIB... Opcional *)
    cXML.InfNFe.Total.RetTrib.VRetPIS := Valor;
    cXML.InfNFe.Total.RetTrib.VRetCOFINS := Valor;
    cXML.InfNFe.Total.RetTrib.VRetCSLL := Valor;
    cXML.InfNFe.Total.RetTrib.VBCIRRF := Valor;
    cXML.InfNFe.Total.RetTrib.VIRRF := Valor;
    cXML.InfNFe.Total.RetTrib.VBCRetPrev := Valor;
    cXML.InfNFe.Total.RetTrib.VRetPrev := Valor;}

    (* Informações da TAG TRANSP... *)
  if trim(Nrazao_trans) <> '' then
  begin
    cXML.InfNFe.Transp.ModFrete := Ntipo_frete;

    if trim(NCPF_trans) <> '' then
      cXML.InfNFe.Transp.Transporta.CPF := NCPF_trans;
    if trim(NCNPJ_trans) <> '' then
      cXML.InfNFe.Transp.Transporta.CNPJ := NCNPJ_trans; //'00000000000191';

    cXML.InfNFe.Transp.Transporta.XNome := Nrazao_trans;

    if Nie_trans <> 'ISENTO' then
      cXML.InfNFe.Transp.Transporta.IE := Nie_trans;

    cXML.InfNFe.Transp.Transporta.XEnder := Nender_trans;
    cXML.InfNFe.Transp.Transporta.XMun := Ncidade_trans;
    cXML.InfNFe.Transp.Transporta.UF := NUF_trans;
  end;
  (* Informações da TAG VEICTRANSP... Opcional *)
  {
  cXML.InfNFe.Transp.VeicTransp.Placa := strResultado;
  cXML.InfNFe.Transp.VeicTransp.UF := strResultado;
  cXML.InfNFe.Transp.VeicTransp.RNTC := strResultado;

  cRebLista := cXML.InfNFe.Transp.Reboque.Add;
  cRebLista.Placa := strResultado;
  cRebLista.UF := strResultado;
  cRebLista.RNTC := strResultado;
  }

  i := 1; (* Essa variável tem que ser incrementada no caso do Valume possuir mais de um lacre...*)

  (* Informações da TAG VOLUMES... Opcional *)

  cVolLista := cXML.InfNFe.Transp.Vol.Add;
  cVolLista.QVol := FMFUN.DecimalPonto(FormatFloat('##0', NQVol));
  cVolLista.Esp := NEsp;
  cVolLista.Marca := NMarca;
  cVolLista.PesoL := FMFUN.DecimalPonto(FormatFloat('##0.000', NPesoL));
  cVolLista.PesoB := FMFUN.DecimalPonto(FormatFloat('##0.000', NPesoB));

  (* Informações da TAG LACRES... Opcional *)
  {
  cLacLista := cXML.InfNFe.Transp.Vol.Items[i].Lacres.Add;
  cLacLista.NLacre := Valor;
  }

  (* Informações da TAG COBR... se Houver *)
  {
  cXML.InfNFe.Cobr.Fat.NFat := Valor;
  cXML.InfNFe.Cobr.Fat.VOrig := Valor;
  cXML.InfNFe.Cobr.Fat.VDesc := Valor;
  cXML.InfNFe.Cobr.Fat.VLiq := Valor;
  }

  (* Informações da TAG DUP...*)
  if Nfinalidade_nf = '1' then
  begin
    Cheque := false;
    Dinheiro := false;
    Deposito := false;
    dao.Geral4('select c.id, c.dtaven, c.VALOR, v.COD_FOP from cr1 c inner join vendas1 v on (v.NUMDOC = c.NR_DOCUMENTO) where c.nr_documento =' + QuotedStr(Nnr_documento) + ' order by DTAVEN');
    i := 0;
    if not dao.Q4.IsEmpty then
    begin
      dao.Q4.First;
      if dao.Q4.fieldbyname('cod_fop').AsString = '1' then
        Dinheiro := true
      else if dao.Q4.fieldbyname('cod_fop').AsString = '2' then
        Deposito := true
      else if (dao.Q4.fieldbyname('cod_fop').AsString = '3') or (dao.Q4.fieldbyname('cod_fop').AsString = '4') or (dao.Q4.fieldbyname('cod_fop').AsString = '5') or (dao.Q4.fieldbyname('cod_fop').AsString = '6') then
      begin
        if dao.Q4.fieldbyname('cod_fop').AsString = '4' then
          Cheque := true;
        while not dao.Q4.eof do
        begin
          i := i + 1;
          cDupLista := cXML.InfNFe.Cobr.Dup.Add;
          cDupLista.NDup := Nnr_documento + '/' + inttostr(i);
          cDupLista.DVenc := FormatDateTime('yyyy-mm-dd', dao.Q4.fieldbyname('dtaven').AsDateTime);
          cDupLista.VDup := FMFUN.DecimalPonto(FormatFloat('##0.00', dao.Q4.fieldbyname('valor').AsFloat));
          dao.Q4.Next
        end;
      end;
    end;
  end;
  (* Informações da TAG INFADIC... se Houver *)
  //  cXML.InfNFe.InfAdic.InfAdFisco := '.';
  //  cXML.InfNFe.InfAdic. = ' - Imposto retido por Substituicao Tributaria - RIMCMS - SC/01 - Anexo 3.';
  slInfCpl := trim(NObs_nota);
  if Nfinalidade_nf = '1' then
  begin
    if (Nnat_operacao = '5405') or (Nnat_operacao = '6403') or (Nnat_operacao = '5102') or (Nnat_operacao = '6102') then
      slInfCpl := slInfCpl + 'Nao aceitamos devolucao sem previa Consulta ao Nosso Dep. Vendas. Favor conferir a mercadoria no ato do recebimento, nao aceitaremos reclamacoes posteriores. ';

    if Empresa_Faturar = '2' then
      //    slInfCpl := slInfCpl + '.';
      slInfCpl := slInfCpl + 'Documento emitido por ME ou EPP optante pelo simples nacional. Nao gera direito a credito Fiscal de ICMS.';

    if (trim(cXML.InfNFe.Dest.IE) = '') or (trim(cXML.InfNFe.Dest.IE) = 'ISENTO') then
      slInfCpl := slInfCpl + 'Imposto retido por Substituicao Tributaria RIMCMS SC/01 Anexo 3.'
    else
    begin
      if CestaBasica then
        slInfCpl := slInfCpl + 'Termos do Art. 26 do RIMCMS/SC Produto Cesta Basica Construcao Civil.';
      if (not ((Nnat_operacao = '5915') or (Nnat_operacao = '6915'))) and SubstituicaoTributaria then
        slInfCpl := slInfCpl + 'Imposto retido por Substituicao Tributaria RIMCMS SC/01 Anexo 3. BCST ' + FMFUN.DecimalPonto(FormatFloat('##0.00', Nvalor_bc_ST_tot)) + ' IST ' + FMFUN.DecimalPonto(FormatFloat('##0.00', Nvalor_ST_tot)) + '.';
    end;
    {
        if Dinheiro then
          slInfCpl := slInfCpl + 'Pagamento em Dinheiro.';

        if Deposito then
          slInfCpl := slInfCpl + 'Pagamento em Deposito.';

        if Cheque then
        begin
          slInfCpl := slInfCpl + 'Pagamento(s) em Cheque(s):';
          dao.Q4.first;
          while not dao.Q4.eof do
          begin
            slInfCpl := slInfCpl + ' - ' + FormatDateTime('dd/mm/yyyy', dao.Q4.fieldbyname('dtaven').AsDateTime) + ' ';
            slInfCpl := slInfCpl + FMFUN.DecimalPonto(FormatFloat('##0.00', dao.Q4.fieldbyname('valor').AsFloat));
            dao.Q4.Next
          end;
        end;}
  end;
  cXML.InfNFe.InfAdic.InfCpl := trim(FMFUN.AnsiToAscii(slInfCpl));
  (* Informações da TAG OBSCONT... *)
//  cXML.InfNFe.InfAdic.ObsCont.XCampo := Valor;
//  cXML.InfNFe.InfAdic.ObsCont.XTexto := Valor;

//  cProcRefLista := cXML.InfNFe.InfAdic.ProcRef.Add;
//  cProcRefLista.NProc := Valor;
//  cProcRefLista.IndProc := Valor;

  (* Informações da TAG EXPORTA... se Houver *)
//  cXML.InfNFe.Exporta.UFEmbarq := Valor;
//  cXML.InfNFe.Exporta.XLocEmbarq := Valor;

  (* Informações da TAG COMPRA... se Houver *)
  {
  cXML.InfNFe.Compra.XNEmp := Valor;
  cXML.InfNFe.Compra.XPed := Valor;
  cXML.InfNFe.Compra.XCont := Valor;
  }

end;
end.
