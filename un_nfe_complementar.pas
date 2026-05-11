unit un_nfe_complementar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, ComCtrls, Buttons,
  NFE_dll_TLB,  xmldom, XMLIntf, msxmldom, XMLDoc, IdFTPCommon,
  ACBrNFeDANFEClass, ACBrNFe, RDprint, DBCtrls,
  RXDBCtrl, Grids, DBGrids, DB, RxMemDS, nfe_v200, Math, sPageControl,
  sPanel, sBitBtn, sLabel, sCheckBox, sGroupBox, pcnConversaoNFE, pcnConversao,
  ActiveX, ACBrUtil,
  sTooledit, sEdit, sMaskEdit, sCustomComboEdit, sCurrEdit, sCurrencyEdit,
  sComboEdit,  RxToolEdit, ACBrBase, ACBrDFe,
  ACBrNFeDANFEFRDM, ACBrNFeDANFEFR,
  ACBrDFeReport, ACBrDFeDANFeReport, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TNFeCancel = class(TThread)
  private
    pathSaida, cChaveNfe, cJustificativa, cProtocoloNFe, strCabecXML: string;
    DataHoraEvento: TDateTime;
    CodigoStatus: integer;
    NumeroProtocolo, XMLCancelamento, MotivoStatus: string;
    cont: integer;
    erro, finalizado, entrada: boolean;
    msgerros, MsgRetWS, strDados: WideString;
    tipAmb: integer;
    procedure Execute; override;
    // referente a NF-e
    procedure GravarReciboNfe;
    procedure Mostra;
    procedure LimparArquivos;
    procedure MontarEvento;
  public
    constructor Create(ChaveNfe, Justificativa, Protocolo: string);
  end;

  TNFePedido = class(TThread)
  private
    cont: integer;
    ChaveNfe, PathLote, pathSaida: string;
    erro, finalizado: boolean;
    recibo, msgerros: WideString;
    cXML: IXMLTNFe;
    arqXML: TXMLDocument;
    procedure Execute; override;
    // referente a NF-e
    procedure monta_NFE();
    procedure GravarChaveNfe;
    procedure TransfereNfeFTP;
    procedure EnviarLote(arquivo: string);
    procedure GravarReciboNfe;
    function GerarXMLProcNFe: boolean;

    procedure Mostra;
  public
    tipo: integer; // 0 - Saida; 1 - Entrada;
    constructor Create();
  end;

  Tfr_nfe_complementar = class(TForm)
    PageControl1: TsPageControl;
    TabDados: TsTabSheet;
    Panel2: tsPanel;
    gbTotal: TsGroupBox;
    gbBruto: TsGroupBox;
    Prtot_bruto: TsCurrencyEdit;
    gbLiquido: TsGroupBox;
    Prtot_liquido: TsCurrencyEdit;
    gbBCICMS: TsGroupBox;
    Prvlr_bc_icms: TsCurrencyEdit;
    gbICMS: TsGroupBox;
    Prvlr_icms: TsCurrencyEdit;
    gbBCST: TsGroupBox;
    PrVLR_BC_ICMS_ST: TsCurrencyEdit;
    gbST: TsGroupBox;
    Prvlr_st: TsCurrencyEdit;
    gbIPI: TsGroupBox;
    Prvlr_ipi: TsCurrencyEdit;
    gbRef: TsGroupBox;
    gbNumDocRef: TsGroupBox;
    PrNumdoc_Ref: TsComboEdit;
    gbNFeRef: TsGroupBox;
    edNfe_Ref: TsEdit;
    gbChaveNfeRef: TsGroupBox;
    ed_Chave_nfe_ref: TsEdit;
    gbFornecedor: TsGroupBox;
    LbNom_fornecedor: tsLabel;
    gbCliente: TsGroupBox;
    LbNom_cliente: tsLabel;
    gbCodigoFiscal: TsGroupBox;
    Lbnom_cod_fiscal: tsLabel;
    gbEmpresaFaturar: TsGroupBox;
    Lbempresa_faturamento: tsLabel;
    gbNumdoc: TsGroupBox;
    Prnumdoc: TsEdit;
    gbData: TsGroupBox;
    Prdtadoc: TsDateEdit;
    Panel1: tsPanel;
    TabNFE: TsTabSheet;
    Panel3: tsPanel;
    gbChaveNfe: TsGroupBox;
    PrChave_NFe: TsEdit;
    gbReciboNfe: TsGroupBox;
    PrRECIBO_NFE: TsEdit;
    gbDigest: TsGroupBox;
    PrDIGEST_NFE: TsEdit;
    gbProtocolo: TsGroupBox;
    PrPROTOCOLO_NFE: TsEdit;
    gbDataRecNFe: TsGroupBox;
    PrDATA_REC_NFE: TDateTimePicker;
    gbMotivo: TsGroupBox;
    PrMotivo_nfe: TsEdit;
    GbStat: TsGroupBox;
    PrStatus_Nfe: TsEdit;
    gbCancNfe: TsGroupBox;
    lbStatusCancel: tsLabel;
    prJUSTIF_CANC_NFE: TsEdit;
    BtnEnviarCancelamentoNFe: TsBitBtn;
    BtnEditarCancelamentoNFe: TsBitBtn;
    BtnSairCancelamentoNFe: TsBitBtn;
    Btnovped: TsBitBtn;
    Btaltped: TsBitBtn;
    Btgraped: TsBitBtn;
    Btcanped: TsBitBtn;
    Btlocped: TsBitBtn;
    Btexcped: TsBitBtn;
    Panel4: tsPanel;
    BtnNFE: TsBitBtn;
    BtnDanfe: TsBitBtn;
    sbvendas: TStatusBar;
    gbEmissao: TsGroupBox;
    Prdta_emissao: TsDateEdit;
    gbNfe: TsGroupBox;
    PrNFE: TsEdit;
    q_vendas1: TFDQuery;
    gbSaida: TsGroupBox;
    Prdta_saida: TsDateEdit;
    XMLNFe: TXMLDocument;
    Prcod_empresa: TsEdit;
    gbTransportadora: TsGroupBox;
    LbNom_transportadora: tsLabel;
    PrCod_Fop: TsEdit;
    gbObs: TsGroupBox;
    Probservacoes_nota: TRichEdit;
    GbNF: TsGroupBox;
    PrNF: TsEdit;
    RDIMPNOT: TRDprint;
    Prcod_cliente: TsComboEdit;
    Prcod_fornecedor: TsComboEdit;
    Prcod_fiscal: TsComboEdit;
    Prempresa_faturar: TsComboEdit;
    Prcod_transportadora: TsComboEdit;
    tabMercadorias: TsTabSheet;
    GbProduto: TsGroupBox;
    GroupBox6: TsGroupBox;
    Label15: tsLabel;
    Lbnom_produto: tsLabel;
    Label17: tsLabel;
    Label19: tsLabel;
    Label20: tsLabel;
    Lbembalagem: tsLabel;
    Lbcolecao: tsLabel;
    Label39: tsLabel;
    Emcod_produto: TRxDBComboEdit;
    Emqtd_entrada: TDBEdit;
    EmIcms: TDBEdit;
    Emsub_total: TDBEdit;
    Emid: TDBEdit;
    EmVolume: TDBEdit;
    Panel5: tsPanel;
    BtNovEm: TsBitBtn;
    BtAltEm: TsBitBtn;
    BtgraEm: TsBitBtn;
    BtcanEm: TsBitBtn;
    BtexcEm: TsBitBtn;
    zzEstoque: TsCurrencyEdit;
    dsVendas2: TDataSource;
    Label1: tsLabel;
    emPreco: TDBEdit;
    q_vendas2: TFDQuery;
    Mevlr_icms_st: TDBEdit;
    Mevlr_bc_st: TDBEdit;
    Mevlr_bc: TDBEdit;
    MeNCM: TDBEdit;
    MeCesta_Basica: TDBEdit;
    Mevlr_agr_item: TDBEdit;
    lbCST: tsLabel;
    Label67: tsLabel;
    Mecod_fiscal_item: TRxDBComboEdit;
    MeTrib_ICMS: TDBEdit;
    mmVendas2: TRxMemoryData;
    mmVendas2ID: TIntegerField;
    mmVendas2COD_PRODUTO: TIntegerField;
    mmVendas2NOM_PRODUTO: TStringField;
    mmVendas2NCM: TStringField;
    mmVendas2CESTA_BASICA: TBooleanField;
    mmVendas2QTD: TFloatField;
    mmVendas2SUB_TOTAL: TCurrencyField;
    mmVendas2IPI_ITEM: TFloatField;
    mmVendas2VLR_IPI_ITEM: TCurrencyField;
    mmVendas2VLR_BC: TCurrencyField;
    mmVendas2ICMS_ITEM: TFloatField;
    mmVendas2VLR_ICMS_ITEM: TCurrencyField;
    mmVendas2VLR_AGR_ITEM: TFloatField;
    mmVendas2VLR_BC_ST: TCurrencyField;
    mmVendas2VLR_ICMS_ST: TCurrencyField;
    mmVendas2NUMDOC: TIntegerField;
    mmVendas2DTADOC: TDateField;
    mmVendas2COD_CLIENTE: TIntegerField;
    mmVendas2COD_REPRESENTANTE: TIntegerField;
    mmVendas2ID_COR: TIntegerField;
    mmVendas2ID_TAMANHO: TIntegerField;
    mmVendas2QTD_DEVOLVIDA: TFloatField;
    mmVendas2DEVOLVIDO: TStringField;
    mmVendas2VOLUME: TFloatField;
    mmVendas2COD_EMPRESA: TIntegerField;
    mmVendas2NR_PEDIDO_PALM: TStringField;
    mmVendas2SUB_TOTAL_BRUTO: TCurrencyField;
    mmVendas2VLR_COMISSAO: TCurrencyField;
    mmVendas2TROCA: TStringField;
    mmVendas2COD_FISCAL_ITEM: TStringField;
    mmVendas2COD_SUPERVISOR: TIntegerField;
    mmVendas2PRECO_LIQUIDO: TFloatField;
    mmVendas2QTD_ESTOQUE: TFloatField;
    mmVendas2ESTOQUE_MINIMO: TFloatField;
    mmVendas2QTD_RESERVADO: TFloatField;
    mmVendas2DESCONTO: TFloatField;
    mmVendas2TRIB_ICMS: TStringField;
    mmVendas2PRECO_CUSTO: TCurrencyField;
    mmVendas2DESCONTO_MAXIMO: TFloatField;
    mmVendas2PRECO_VENDA: TCurrencyField;
    mmVendas2PERC_COMISSAO: TFloatField;
    mmVendas2GRADE_COMISSAO: TStringField;
    DBGrid1: TRxDBGrid;
    btRecXml: TsBitBtn;
    ACBrNFe1: TACBrNFe;
    sTabSheet1: TsTabSheet;
    sPanel1: tsPanel;
    gbChaveNfeEnt: TsGroupBox;
    PrCHAVE_NFE_DEV: TsEdit;
    gbReciboNfeEnt: TsGroupBox;
    PrRECIBO_NFE_DEV: TsEdit;
    gbDigestEnt: TsGroupBox;
    PrDIGEST_NFE_DEV: TsEdit;
    gbProtocoloEnt: TsGroupBox;
    PrPROTOCOLO_NFE_DEV: TsEdit;
    gbDataRecNFeEnt: TsGroupBox;
    PrDATA_REC_NFE_DEV: TDateTimePicker;
    gbMotivoEnt: TsGroupBox;
    PrMOTIVO_NFE_DEV: TsEdit;
    GbStatEnt: TsGroupBox;
    PrSTATUS_NFE_DEV: TsEdit;
    gbCancNfeEnt: TsGroupBox;
    sLabel1: tsLabel;
    PrJUSTIF_CANC_NFE_DEV: TsEdit;
    BtnEnviarCancelamentoNFeEnt: TsBitBtn;
    BtnEditarCancelamentoNFeEnt: TsBitBtn;
    BtnSairCancelamentoNFeEnt: TsBitBtn;
    sPanel2: tsPanel;
    BtnNFEEnt: TsBitBtn;
    BtnDanfeEnt: TsBitBtn;
    btRecXmlEnt: TsBitBtn;
    sGroupBox1: TsGroupBox;
    PrNFE_Dev: TsEdit;
    q_xml: TFDQuery;
    ACBrNFeDANFEFR1: TACBrNFeDANFEFR;
    Q_produto: TFDQuery;
    q_xmlXML: TBlobField;
    q_xmlXML_DEV: TBlobField;
    qrGravaXml: TFDQuery;
    qrGravaXmlDev: TFDQuery;
    function dados_produto(cod_produto: string): boolean;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure PrNumdoc_RefButtonClick(Sender: TObject);
    procedure PrCod_clienteExit(Sender: TObject);
    procedure PrCod_fornecedorExit(Sender: TObject);
    procedure PrCod_FiscalExit(Sender: TObject);
    procedure Prempresa_faturarExit(Sender: TObject);
    procedure BtnovpedClick(Sender: TObject);
    procedure limpa_campos(prefixo: ShortString);
    procedure readonly_false(prefixo: ShortString);
    procedure BtaltpedClick(Sender: TObject);
    procedure BtcanpedClick(Sender: TObject);
    procedure ativa_vendas1(id: string);
    procedure mostra_campos(prefixo: string);
    procedure readonly_true(prefixo: ShortString);
    procedure BtexcpedClick(Sender: TObject);
    procedure BtgrapedClick(Sender: TObject);
    procedure BtlocpedClick(Sender: TObject);
    procedure BtnNFEClick(Sender: TObject);
    procedure PrNumdoc_RefExit(Sender: TObject);
    procedure BtnDanfeClick(Sender: TObject);
    procedure Prcod_transportadoraExit(Sender: TObject);
    procedure BtnEditarCancelamentoNFeClick(Sender: TObject);
    procedure BtnEnviarCancelamentoNFeClick(Sender: TObject);
    procedure BtnSairCancelamentoNFeClick(Sender: TObject);
    procedure prJUSTIF_CANC_NFEChange(Sender: TObject);
    procedure BtnNotaClick(Sender: TObject);
    procedure MontaNF(n_pedido: string);
    function Faturado: boolean;
    procedure PrNFExit(Sender: TObject);
    procedure Prcod_clienteButtonClick(Sender: TObject);
    procedure Prcod_fornecedorButtonClick(Sender: TObject);
    procedure Prcod_fiscalButtonClick(Sender: TObject);
    procedure Prempresa_faturarButtonClick(Sender: TObject);
    procedure Prcod_transportadoraButtonClick(Sender: TObject);
    procedure RDIMPNOTNewPage(Sender: TObject; Pagina: integer);
    procedure Emcod_produtoExit(Sender: TObject);
    procedure BtNovEmClick(Sender: TObject);
    procedure BtAltEmClick(Sender: TObject);
    procedure BtgraEmClick(Sender: TObject);
    procedure BtcanEmClick(Sender: TObject);
    procedure BtexcEmClick(Sender: TObject);
    procedure Emcod_produtoButtonClick(Sender: TObject);
    procedure ativa_vendas2(nr_documento: string);
    procedure carrega_vendas2;
    procedure CalculoIcmsItem;
    procedure RecXml;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure btRecXmlClick(Sender: TObject);
    procedure BtnNFEEntClick(Sender: TObject);
    procedure BtnDanfeEntClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    UF_Cliente, UF_Emissor, campo_pesquisado, dado_pesquisado: string;
    cliente_isento_icms, busca_qualquer_posicao_pesquisada: boolean;
    Aliquota_ICMS_Interno: double;
  end;

const
  sql_nota = 'SELECT ' + '  C.NOM_CLIENTE, ' + '  C.CPF, ' + '  C.CNPJ, ' +
    '  C.ENDERECO, ' + '  C.NR_ENDERECO, ' + '  C.BAIRRO, ' + '  C.CEP, ' +
    '  C.TELEFONE, ' + '  C.RG, ' + '  C.IE, ' + ' ' +
    '  CD.NOM_CIDADE AS CID_CLI, ' + '  CD.UF, ' + ' ' + '  V1.NUMDOC, ' +
    '  V1.NF, ' + '  V1.TOT_LIQUIDO, ' + '  V1.TIPO_FRETE, ' +
    '  V1.VOLUME_NOTA, ' + '  V1.PESO_NOTA, ' + '  V1.OBSERVACOES_NOTA, ' +
    '  V1.DTA_SAIDA, ' + '  V1.COD_FISCAL, ' + '  V1.DTA_EMISSAO, ' +
    '  V1.VLR_BC_ICMS, ' + '  V1.VLR_ICMS, ' + '  V1.VLR_IPI, ' + ' ' +
    '  CT.NOM_CIDADE AS CID_TRANSPORTADORA, ' + '  CT.UF AS UF_TRANSPORTADORA, '
    + ' ' + '  FP.NOM_FOP, ' + '  TR.COD_TRANSPORTADORA, ' +
    '  TR.NOME AS NOM_TRANSPORTADORA, ' + '  TR.ENDERECO AS END_TRA, ' +
    '  TR.CNPJ AS CNPJ_TRA, ' + '  TR.IE AS IE_TRA, ' + '  TR.PLACA, ' +
    '  TR.MOTORISTA, ' + ' ' + '  CF.NOME AS NOM_CFOP, ' + ' ' +
    '  SUM(V2.VLR_BC_ST) AS VLR_BC_ST, ' +
    '  SUM(V2.VLR_ICMS_ST) AS VLR_ICMS_ST ' + 'FROM VENDAS1 V1 ' +
    'LEFT JOIN VENDAS2 V2 ON (V1.NUMDOC = V2.NUMDOC) ' +
    'LEFT JOIN CLIENTE C ON C.COD_CLIENTE = V1.COD_CLIENTE ' +
    'LEFT JOIN CIDADES CD ON CD.COD_CIDADE = C.COD_CIDADE ' +
    'LEFT JOIN TRANSPORTADORA TR ON TR.COD_TRANSPORTADORA=V1.COD_TRANSPORTADORA '
    + 'LEFT JOIN COD_FISCAL CF ON CF.COD_FISCAL=V1.COD_FISCAL ' +
    'LEFT JOIN CIDADES CT ON CT.COD_CIDADE=TR.COD_CIDADE ' +
    'LEFT JOIN FOP FP ON (FP.COD_FOP=V1.COD_FOP) ';
  sql_grupo_nota = 'GROUP BY' + '  C.NOM_CLIENTE, ' + '  C.CPF, ' + '  C.CNPJ, '
    + '  C.ENDERECO, ' + '  C.NR_ENDERECO, ' + '  C.BAIRRO, ' + '  C.CEP, ' +
    '  C.TELEFONE, ' + '  C.RG, ' + '  C.IE, ' + ' ' + '  CD.NOM_CIDADE, ' +
    '  CD.UF, ' + ' ' + '  V1.NUMDOC, ' + '  V1.NF, ' + '  V1.TOT_LIQUIDO, ' +
    '  V1.TIPO_FRETE, ' + '  V1.VOLUME_NOTA, ' + '  V1.PESO_NOTA, ' +
    '  V1.OBSERVACOES_NOTA, ' + '  V1.DTA_SAIDA, ' + '  V1.COD_FISCAL, ' +
    '  V1.DTA_EMISSAO, ' + '  V1.VLR_BC_ICMS, ' + '  V1.VLR_ICMS, ' +
    '  V1.VLR_IPI, ' + ' ' + '  CT.NOM_CIDADE, ' + '  CT.UF, ' + ' ' +
    '  FP.NOM_FOP, ' + '  TR.COD_TRANSPORTADORA, ' + '  TR.NOME, ' +
    '  TR.ENDERECO, ' + '  TR.CNPJ, ' + '  TR.IE, ' + '  TR.PLACA, ' +
    '  TR.MOTORISTA, ' + ' ' + '  CF.NOME ';
  sql_nota_dev = 'SELECT ' + '  C.RAZAO_SOCIAL as NOM_CLIENTE, ' +
    '  C.CNPCPF AS CPF, ' + '  C.CNPCPF AS CNPJ, ' + '  C.ENDERECO, ' +
    '  C.NR_ENDERECO, ' + '  C.BAIRRO, ' + '  C.CEP, ' +
    '  C.FONE AS TELEFONE, ' + '  C.IERG AS RG, ' + '  C.IERG AS IE, ' + ' ' +
    '  CD.NOM_CIDADE AS CID_CLI, ' + '  CD.UF, ' + ' ' + '  V1.NUMDOC, ' +
    '  V1.NF, ' + '  V1.TOT_LIQUIDO, ' + '  V1.TIPO_FRETE, ' +
    '  V1.VOLUME_NOTA, ' + '  V1.PESO_NOTA, ' + '  V1.OBSERVACOES_NOTA, ' +
    '  V1.DTA_SAIDA, ' + '  V1.COD_FISCAL, ' + '  V1.DTA_EMISSAO, ' +
    '  V1.VLR_BC_ICMS, ' + '  V1.VLR_ICMS, ' + '  V1.VLR_IPI, ' + ' ' +
    '  CT.NOM_CIDADE AS CID_TRANSPORTADORA, ' + '  CT.UF AS UF_TRANSPORTADORA, '
    + ' ' + '  FP.NOM_FOP, ' + '  TR.COD_TRANSPORTADORA, ' +
    '  TR.NOME AS NOM_TRANSPORTADORA, ' + '  TR.ENDERECO AS END_TRA, ' +
    '  TR.CNPJ AS CNPJ_TRA, ' + '  TR.IE AS IE_TRA, ' + '  TR.PLACA, ' +
    '  TR.MOTORISTA, ' + ' ' + '  CF.NOME AS NOM_CFOP, ' + ' ' +
    '  SUM(V2.VLR_BC_ST) AS VLR_BC_ST, ' +
    '  SUM(V2.VLR_ICMS_ST) AS VLR_ICMS_ST ' + 'FROM VENDAS1 V1 ' +
    'LEFT JOIN VENDAS2 V2 ON (V1.NUMDOC = V2.NUMDOC) ' +
    'LEFT JOIN FORNECEDOR C ON C.COD_FORNECEDOR = V1.COD_FORNECEDOR ' +
    'LEFT JOIN CIDADES CD ON CD.COD_CIDADE = C.COD_CIDADE ' +
    'LEFT JOIN TRANSPORTADORA TR ON TR.COD_TRANSPORTADORA=V1.COD_TRANSPORTADORA '
    + 'LEFT JOIN COD_FISCAL CF ON CF.COD_FISCAL=V1.COD_FISCAL ' +
    'LEFT JOIN CIDADES CT ON CT.COD_CIDADE=TR.COD_CIDADE ' +
    'LEFT JOIN FOP FP ON (FP.COD_FOP=V1.COD_FOP) ';
  sql_grupo_nota_dev = 'GROUP BY' + '  C.RAZAO_SOCIAL, ' + '  C.CNPCPF, ' +
    '  C.ENDERECO, ' + '  C.NR_ENDERECO, ' + '  C.BAIRRO, ' + '  C.CEP, ' +
    '  C.FONE, ' + '  C.IERG, ' + '  C.IERG, ' + ' ' + '  CD.NOM_CIDADE, ' +
    '  CD.UF, ' + ' ' + '  V1.NUMDOC, ' + '  V1.NF, ' + '  V1.TOT_LIQUIDO, ' +
    '  V1.TIPO_FRETE, ' + '  V1.VOLUME_NOTA, ' + '  V1.PESO_NOTA, ' +
    '  V1.OBSERVACOES_NOTA, ' + '  V1.DTA_SAIDA, ' + '  V1.COD_FISCAL, ' +
    '  V1.DTA_EMISSAO, ' + '  V1.VLR_BC_ICMS, ' + '  V1.VLR_ICMS, ' +
    '  V1.VLR_IPI, ' + ' ' + '  CT.NOM_CIDADE, ' + '  CT.UF, ' + ' ' +
    '  FP.NOM_FOP, ' + '  TR.COD_TRANSPORTADORA, ' + '  TR.NOME, ' +
    '  TR.ENDERECO, ' + '  TR.CNPJ, ' + '  TR.IE, ' + '  TR.PLACA, ' +
    '  TR.MOTORISTA, ' + ' ' + '  CF.NOME ';

var
  fr_nfe_complementar: Tfr_nfe_complementar;
  acao, campo_pesquisado, dado_pesquisado: string;
  modo_insert, busca_qualquer_posicao_pesquisada: boolean;

implementation

uses Un_localizar, Un_dao, unpri, un_nfe_transmissao, UnFun, frmMontaXML,
  Un_dm, Un_splash, un_nfe;

{$R *.dfm}

procedure Tfr_nfe_complementar.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    // se for, passa o foco para o próximo campo, zerando o valor da variável Key
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;

end;

procedure Tfr_nfe_complementar.PrNumdoc_RefButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
  It, J, Coluna: byte;
  totalcusto, lucromedio, tot_lucro: real;
  contador: integer;
  lucro: real;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  Fr_localizar.Caption := 'Localizar Vendas';
  chamou_pesquisa := 'fr_pedido_ref';
  chamou_form := 'fr_pedido_ref';
  chamou_cadastro := '';
  Fr_localizar.BT_cadastro.Visible := false;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 10);

  Campos_combo[0] := 'Numero';
  Campos_combo[1] := 'Cliente - Razão S.';
  Campos_combo[2] := 'Cliente - Fantasia';
  Campos_combo[3] := 'CNPJ';
  Campos_combo[4] := 'CPF';
  Campos_combo[5] := 'Cidade';
  Campos_combo[6] := 'Vendedor';
  Campos_combo[7] := 'NFE';
  Campos_combo[8] := 'NF';
  Campos_combo[9] := 'Fornecedor';
  for i := 0 to 9 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(Campos_combo[i]);
  end;
  Fr_localizar.CBcampos.ItemIndex := 0;

  if campo_pesquisado <> '' then
  begin
    Fr_localizar.CBcampos.ItemIndex := Fr_localizar.CBcampos.Items.IndexOf
      (campo_pesquisado);
    Fr_localizar.EDlocalizar.Text := dado_pesquisado;
    Fr_localizar.zzbusca_qualquer.Checked := busca_qualquer_posicao_pesquisada;
    Fr_localizar.loc_vendas(Fr_localizar.EDlocalizar.Text);
  end;
  try
    Fr_localizar.ShowModal;
  finally

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
  if Fr_localizar.modalresult = mrOk then
  begin
    PrCod_clienteExit(self);
    PrCod_fornecedorExit(self);
    PrCod_FiscalExit(self);
    Prempresa_faturarExit(self);
    Prcod_transportadoraExit(self);
    PrNumdoc_RefExit(self);
  end;
    Fr_localizar.Free;
  end;
end;

procedure Tfr_nfe_complementar.PrCod_clienteExit(Sender: TObject);
begin
  if trim(Prcod_cliente.Text) = '' then
    LbNom_cliente.Caption := '...';
  if Prcod_cliente.Text <> '' then
  begin
    dao.Geral2
      ('select nom_cliente, cnpj, cd.nom_cidade, desconto_maximo, cd.uf, CASE WHEN (c.ie is null or c.IE = ''ISENTO'') THEN ''1'' ELSE ''0'' END AS ISENTO from cliente c '
      + 'left join cidades cd on cd.cod_cidade=c.cod_cidade ' +
      'where cod_cliente=' + QuotedStr(Prcod_cliente.Text));

    if dao.q2.RecordCount > 0 then
    begin
      LbNom_cliente.Caption := dao.q2.fieldbyname('nom_cliente').AsString;
      UF_Cliente := dao.q2.fieldbyname('uf').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_cliente.Text := '';
      Prcod_cliente.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfr_nfe_complementar.PrCod_fornecedorExit(Sender: TObject);
begin
  if trim(Prcod_fornecedor.Text) <> '' then
  begin
    dao.Geral2
      ('select RAZAO_SOCIAL, CNPCPF, cd.nom_cidade, cd.uf, CASE WHEN (c.IERG is null or c.IERG = ''ISENTO'') THEN ''1'' ELSE ''0'' END AS ISENTO from fornecedor c '
      + 'left join cidades cd on cd.cod_cidade=c.cod_cidade ' +
      'where cod_fornecedor=' + QuotedStr(Prcod_fornecedor.Text));

    if dao.q2.RecordCount > 0 then
    begin
      LbNom_fornecedor.Caption := dao.q2.fieldbyname('razao_social').AsString;
      UF_Cliente := dao.q2.fieldbyname('uf').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_fornecedor.Text := '';
      Exit;
    end;
  end
  else
    LbNom_fornecedor.Caption := '...';
end;

procedure Tfr_nfe_complementar.PrCod_FiscalExit(Sender: TObject);
begin
  if trim(Prcod_fiscal.Text) = '' then
    Lbnom_cod_fiscal.Caption := '...';

  if Prcod_fiscal.Text <> '' then
  begin
    dao.Geral2('select nome from cod_fiscal where cod_fiscal=' +
      QuotedStr(Prcod_fiscal.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_cod_fiscal.Caption := dao.q2.fieldbyname('nome').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_fiscal.Text := '';
      Prcod_fiscal.SetFocus;
      Exit;
    end;

  end;
end;

procedure Tfr_nfe_complementar.Prempresa_faturarExit(Sender: TObject);
begin
  if trim(Prempresa_faturar.Text) = '' then
    Lbempresa_faturamento.Caption := '...';

  if Prempresa_faturar.Text <> '' then
  begin
    dao.Geral2
      ('select e.nom_empresa||'' - ''||e.CNPJ AS NOM_EMPRESA, e.LOGO, cd.UF From empresa e inner join cidades cd on cd.cod_cidade = e.cod_cidade where e.cod_empresa='
      + QuotedStr(Prempresa_faturar.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbempresa_faturamento.Caption :=
        dao.q2.fieldbyname('nom_empresa').AsString;
      TBlobField(dao.q2.fieldbyname('LOGO')).SaveToFile('LOGO.BMP');
      UF_Emissor := dao.q2.fieldbyname('uf').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prempresa_faturar.Text := '';
      Prempresa_faturar.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfr_nfe_complementar.limpa_campos(prefixo: ShortString);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).Clear
      else if Components[i] is TsComboEdit then
        TsComboEdit(Components[i]).Clear
      else if Components[i] is TRichEdit then
        TRichEdit(Components[i]).Clear
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(Components[i]).Clear
      else if Components[i] is TsDateEdit then
        TsDateEdit(Components[i]).Clear
      else if Components[i] is TMaskEdit then
        TMaskEdit(Components[i]).Clear
      else if Components[i] is TComboBox then
        TComboBox(Components[i]).ItemIndex := 0;
    end;
  end;
  if prefixo = 'Pr' then
  begin
    LbNom_cliente.Caption := '...';
    LbNom_fornecedor.Caption := '...';
    Lbnom_cod_fiscal.Caption := '...';
    Lbempresa_faturamento.Caption := '...';
  end;
end;

procedure Tfr_nfe_complementar.readonly_false(prefixo: ShortString);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).ReadOnly := false
      else if Components[i] is TsDateEdit then
        TsDateEdit(Components[i]).ReadOnly := false
      else if Components[i] is TsComboEdit then
        TsComboEdit(Components[i]).ReadOnly := false
      else if Components[i] is TsDateEdit then
        TsDateEdit(Components[i]).ReadOnly := false
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(Components[i]).ReadOnly := false
      else if Components[i] is TRichEdit then
        TRichEdit(Components[i]).ReadOnly := false
      else if Components[i] is TMaskEdit then
        TMaskEdit(Components[i]).ReadOnly := false;
    end;
  end;
  // Dados da NF-e sempre somente leitura...
  PrChave_NFe.ReadOnly := true;
  PrRECIBO_NFE.ReadOnly := true;
  PrDIGEST_NFE.ReadOnly := true;
  PrPROTOCOLO_NFE.ReadOnly := true;
  PrDATA_REC_NFE.Enabled := false;
  PrStatus_Nfe.ReadOnly := true;
  PrMotivo_nfe.ReadOnly := true;
end;

procedure Tfr_nfe_complementar.BtnovpedClick(Sender: TObject);
begin
  Btnovped.Enabled := false;
  Btaltped.Enabled := false;
  Btgraped.Enabled := true;
  Btcanped.Enabled := true;
  Btexcped.Enabled := false;
  Btlocped.Enabled := false;
  limpa_campos('Pr');
  // limpa_campos('Me');
  readonly_false('Pr');
  modo_insert := true;
  acao := 'insert';
  Prdtadoc.Date := dao.DtaSerDt;
  Prdta_emissao.Date := dao.DtaSerDt;
  Prdta_saida.Date := dao.DtaSerDt;
  Prcod_empresa.Text := cod_empresa;
  Prdta_emissao.Date := dao.DtaSerDt;
  sbvendas.Panels.Items[0].Text := 'INSERIR';
  Btaltped.Enabled := false;
  Prdtadoc.SetFocus;
end;

procedure Tfr_nfe_complementar.BtaltpedClick(Sender: TObject);
begin
  if Prnumdoc.Text = '' then
  begin
    dao.msg('VOCÊ DEVE LOCALIZAR UM PEDIDO PARA ALTERAR!');
    Exit;
  end;

  if Prnumdoc.Text <> '' then
  begin
    if PrStatus_Nfe.Text = '100' then
    begin
      dao.msg('A NF-e Complementar enviada não pode ser mais alterada!');
      Exit;
    end;
  end;

  Btnovped.Enabled := false;
  Btaltped.Enabled := false;
  Btgraped.Enabled := true;
  Btcanped.Enabled := true;
  Btexcped.Enabled := false;
  Btlocped.Enabled := false;

  Prdta_emissao.Date := dao.DtaSerDt;
  Prdta_saida.Date := dao.DtaSerDt;
  modo_insert := false;
  acao := 'alterar';
  sbvendas.Font.Style := [fsbold];
  sbvendas.Panels.Items[0].Text := 'ALTERAR';

  readonly_false('Pr');
  PageControl1.ActivePageIndex := 0;
  Prdtadoc.SetFocus;
end;

procedure Tfr_nfe_complementar.ativa_vendas1(id: string);
begin
  with q_vendas1 do
  begin
    close;
    sql.Clear;
    sql.Add('select a.NUMDOC, a.NUMDOC_GRUPO, a.HORA, a.DTADOC, a.MOTIVO_NFE_CANCEL_INTERNO, a.COD_CLIENTE, a.COD_USUARIO, a.COD_EMPRESA, ' +
            'a.FATURADO, a.CONSIGNACAO, a.ORCAMENTO, a.ENTREGUE, a.TOT_BRUTO, a.DESCONTO, a.TOT_LIQUIDO, ' +
            'a.PRAZO_PGTO, a.COD_FOP, a.NUM_CUPOM, a.TIPO_VENDA, a.QTD_PARCELAS, a.PONTO_USADO, a.PROCESSO_ID, ' +
            'a.USUARIO_DESFATUROU, a.COD_REPRESENTANTE, a.COD_PRAZO_PGTO, a.CUSTO_TOTAL, a.LUCRO_MEDIO, ' +
            'coalesce((select pr.VALOR_MINIMO from PRAZO_REPRESENTANTE pr where pr.ID_PRAZO = p.id and pr.ID_REPRESENTANTE = a.cod_representante), p.VALOR_MINIMO_PEDIDO) as valor_minimo_pedido, ' + 'a.DTA_EMISSAO, a.DTA_SAIDA, a.EMPRESA_FATURAR, a.NF, a.OBSERVACOES_PEDIDO, a.OBSERVACOES_NOTA, ' + 'a.COD_TRANSPORTADORA, a.TIPO_FRETE, a.VOLUME_NOTA, a.PESO_NOTA, a.COD_CARGA, a.VL_FRETE, ' + 'a.CONTATO_FRETE, a.PED_IMPRESSO, a.DTA_VENCIMENTO_CONSIG, a.CANCELADO, a.CONTEM_AVARIA, ' +
            'a.CONTEM_ETIQUETA, a.MOTIVO_TROCA, a.NR_VENDA_ORIGINAL, a.PEDIDO, a.VENDA_ENVIADA, A.DESCONTO_GERAL, A.VLR_DESCONTO_GERAL, ' + 'a.CREDITO_USADO, a.NR_PEDIDO_PALM, o.numdoc as pedido_origem, a.BOLETO_ANEXO, a.COD_FISCAL, a.VLR_COMISSAO, a.ValorDescontoAdic, ' + 'a.VLR_BC_ICMS, a.VLR_ICMS, a.VLR_ST, a.VLR_TOT_NF, a.VLR_BC_ICMS_ST, a.CHAVE_NFE, a.desconto_valor, ' + 'a.RECIBO_NFE, a.STATUS_NFE, a.MOTIVO_NFE, a.DIGEST_NFE, a.PROTOCOLO_NFE, a.DATA_REC_NFE, ' +
            'a.JUSTIF_CANC_NFE, a.COD_SUPERVISOR, a.COD_FORNECEDOR, a.NFE, a.VLR_IPI, a.PALM_NR_CONEXAO, pp.STATUS, ' + 'a.SINCRONIZAR_PALM, a.NUMDOC_REF, a.FRETE_COMBINADO, a.DT_FRETE_COMBINADO, a.EMAIL_NFE, coalesce(ce.uf, ''SC'') as uf_emissor, e.ENQUADRADA_SIMPLES, ' + 'a.EMAIL_PEDIDO, a.PEDIDO_VENDEDOR, a.USUARIO_CHECOU_PEDIDO_VENDEDOR, a.CONTA_BOLETO, a.AVISOGNRE, ' + 'a.USUARIO_CHECOU_FRETE_COMBINADO, a.ABERTO_USUARIO, a.MAQUINA_USUARIO_ABERTO, A.CARTACORRECAO, a.NR_PEDIDO_PALM, e.logo, ' +
            'case when a.DATA_REC_NFE + INTERVAL ''1 day'' < current_timestamp THEN 1 ELSE 0 END AS PRAZO_CANCEL, a.USUARIO_LIBEROU_DESCONTO, a.MOTIVO_LIBERACAO_DESCONTO, ' + 'c.nom_cliente, c.SUSPENSAO_PIS_CONFINS, c.cnpj, c.pre_cadastro, c.desconto_maximo, CASE WHEN a.cod_cliente is not null then CASE WHEN c.IE = ''ISENTO'' THEN ''1'' ELSE CASE WHEN c.ie is null  and c.TIP_PESSOA = ''J'' THEN ''2'' ELSE ''0'' END END END AS ISENTO, ' +
            'r.nom_representante, s.nom_representante as supervisor, r.funcionario, f.nom_fop, f.desconto as desconto_forma, p.desconto as desconto_prazo, p.prazo, e.nom_empresa, t.nome, cd.nom_cidade, cd.uf, cf.nome as nom_cod_fiscal, ' + 'a.CHAVE_NFE_DEV, a.RECIBO_NFE_DEV, a.STATUS_NFE_DEV, a.MOTIVO_NFE_DEV, a.DIGEST_NFE_DEV, a.PROTOCOLO_NFE_DEV, a.DATA_REC_NFE_DEV, ' + 'case when a.DATA_REC_NFE_DEV + INTERVAL ''1 day'' < current_timestamp THEN 1 ELSE 0 END AS PRAZO_CANCEL_DEV,  a.JUSTIF_CANC_NFE_DEV, a.NFE_DEV, ' +
            '(select max(v3.nfe) from vendas1 v3 where v3.cod_cliente = c.COD_CLIENTE and v3.nfe <> a.nfe) as ultima_nf, c.consumidor_final, a.numdoc_destino, f.avista, f.NAO_GERAR_CR ' + 'from vendas1 a ' + 'left join vendas1_orig o on o.numdoc = a.numdoc ' + 'left join cliente c on c.cod_cliente = a.cod_cliente ' + 'left outer join PROCESSO_PEDIDO pp on pp.ID = a.PROCESSO_ID ' + 'left join fornecedor fn on fn.cod_fornecedor = a.cod_fornecedor ' + 'left join cidades cd on cd.cod_cidade= c.cod_cidade ' +
            'left join representante r on r.id = a.cod_representante ' +
            'left join representante s on s.id = a.cod_supervisor ' +
            'left join fop f on f.cod_fop = a.cod_fop ' +
            'left join prazo p on p.id = a.cod_prazo_pgto ' +
            'left join empresa e on e.cod_empresa = a.empresa_faturar ' + 'left join cidades ce on ce.cod_cidade= e.cod_cidade ' + 'left join transportadora t on t.cod_transportadora = a.cod_transportadora ' + 'left join cod_fiscal cf on cf.cod_fiscal= a.cod_fiscal ' + 'where a.numdoc=' + QuotedStr(id));
    open;
  end;

end;

procedure Tfr_nfe_complementar.BtcanpedClick(Sender: TObject);
var
  numdoc: integer;
begin
  Btnovped.Enabled := true;
  Btaltped.Enabled := true;
  Btgraped.Enabled := false;
  Btcanped.Enabled := false;
  Btexcped.Enabled := true;
  Btlocped.Enabled := true;

  if modo_insert then
  begin
    limpa_campos('Pr');
  end
  else
  begin
    dao.cn.Rollback;
    ativa_vendas1(Prnumdoc.Text);
    mostra_campos('Pr');
  end;

  readonly_true('Pr');

  sbvendas.Panels.Items[0].Text := '';

end;

procedure Tfr_nfe_complementar.readonly_true(prefixo: ShortString);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).ReadOnly := true
      else if Components[i] is TsComboEdit then
        TsComboEdit(Components[i]).ReadOnly := true
      else if Components[i] is TsDateEdit then
        TsDateEdit(Components[i]).ReadOnly := true
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(Components[i]).ReadOnly := true
      else if Components[i] is TMaskEdit then
        TMaskEdit(Components[i]).ReadOnly := true
      else if Components[i] is TRichEdit then
        TRichEdit(Components[i]).ReadOnly := true;
    end;
  end;
end;

procedure Tfr_nfe_complementar.mostra_campos(prefixo: string);
var
  i: integer;
  campo, campo1: string;
begin
  Screen.Cursor := crSQLWait;
  for i := 0 to ComponentCount - 1 do
  begin
    if Copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
      begin
        campo := TsEdit(Components[i]).Name;
        campo1 := Copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
        TsEdit(FindComponent(campo)).Text :=
          q_vendas1.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TsComboEdit then
      begin
        campo := TsComboEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := Copy(campo, 3, 50);
        TsComboEdit(FindComponent(campo)).Text :=
          q_vendas1.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TsCurrencyEdit then
      begin
        campo := TsCurrencyEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := Copy(campo, 3, 50);
        TsCurrencyEdit(FindComponent(campo)).Value :=
          q_vendas1.fieldbyname(campo1).AsFloat;
      end
      else if Components[i] is TComboBox then
      begin
        campo := TComboBox(Components[i]).Name;
        campo1 := campo;
        campo1 := Copy(campo, 3, 50);

        TComboBox(FindComponent(campo)).ItemIndex :=
          q_vendas1.fieldbyname(campo1).AsInteger;
      end
      else if Components[i] is TsDateEdit then
      begin
        campo := TsDateEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := Copy(campo, 3, 50);

        TsDateEdit(FindComponent(campo)).Date := q_vendas1.fieldbyname(campo1)
          .AsDateTime;
      end
      else if Components[i] is TMaskEdit then
      begin
        campo := TMaskEdit(Components[i]).Name;
        campo1 := Copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
        TMaskEdit(FindComponent(campo)).Text :=
          q_vendas1.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TRichEdit then
      begin
        campo := TRichEdit(Components[i]).Name;
        campo1 := Copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
        TRichEdit(FindComponent(campo)).Text :=
          q_vendas1.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TDateTimePicker then
      begin
        campo := TDateTimePicker(Components[i]).Name;
        campo1 := campo;
        campo1 := Copy(campo, 3, 50);

        TDateTimePicker(FindComponent(campo)).DateTime :=
          q_vendas1.fieldbyname(campo1).AsDateTime;
      end;

    end;

  end; // end do for

  PrCod_clienteExit(self);
  PrCod_fornecedorExit(self);
  PrCod_FiscalExit(self);
  Prempresa_faturarExit(self);
  PrNumdoc_RefExit(self);
  Prcod_transportadoraExit(self);
  q_vendas1.open;
  if PrStatus_Nfe.Text = '100' then
  begin
    BtnDanfe.Enabled := true;
    btRecXml.Enabled := true;
    if q_vendas1.fieldbyname('PRAZO_CANCEL').AsString = '1' then
    begin
      lbStatusCancel.Caption := 'Prazo de Cancelamento expirou.';
      BtnEditarCancelamentoNFe.Enabled := false;
    end
    else
    begin
      lbStatusCancel.Caption := 'Prazo Limite para o Cancelamento: ' +
        formatdatetime('dd/mm/yyyy hh:mm', q_vendas1.fieldbyname('DATA_REC_NFE')
        .AsDateTime + 7);
      BtnEditarCancelamentoNFe.Enabled := dao.terminal_nfe;
    end;
  end
  else
  begin
    BtnEditarCancelamentoNFe.Enabled := false;
    BtnEnviarCancelamentoNFe.Enabled := false;
    BtnSairCancelamentoNFe.Enabled := false;
    BtnDanfe.Enabled := false;
    btRecXml.Enabled := true;
    lbStatusCancel.Caption := ' ';
    if PrStatus_Nfe.Text = '101' then
      BtnNFE.Enabled := false;
  end;

  if PrSTATUS_NFE_DEV.Text = '100' then
  begin
    BtnDanfeEnt.Enabled := true;
    btRecXmlEnt.Enabled := true;
    if q_vendas1.fieldbyname('PRAZO_CANCEL').AsString = '1' then
    begin
      lbStatusCancel.Caption := 'Prazo de Cancelamento expirou.';
      BtnEditarCancelamentoNFeEnt.Enabled := false;
    end
    else
    begin
      lbStatusCancel.Caption := 'Prazo Limite para o Cancelamento: ' +
        formatdatetime('dd/mm/yyyy hh:mm', q_vendas1.fieldbyname('DATA_REC_NFE')
        .AsDateTime + 7);
      BtnEditarCancelamentoNFeEnt.Enabled := dao.terminal_nfe;
    end;
  end
  else
  begin
    BtnEditarCancelamentoNFeEnt.Enabled := false;
    BtnEnviarCancelamentoNFeEnt.Enabled := false;
    BtnSairCancelamentoNFeEnt.Enabled := false;
    BtnDanfeEnt.Enabled := false;
    btRecXmlEnt.Enabled := true;
    lbStatusCancel.Caption := ' ';
    if PrSTATUS_NFE_DEV.Text = '101' then
      BtnNFEEnt.Enabled := false;
  end;



  ativa_vendas2(Prnumdoc.Text);
  Screen.Cursor := crDefault;

end;

procedure Tfr_nfe_complementar.BtexcpedClick(Sender: TObject);
begin
  if q_vendas1.fieldbyname('status_nfe').AsString = '100' then
  begin
    dao.msg('NF-e Complementar enviada não pode ser excluída!');
    Exit;
  end;
  if MessageDlg('Deseja Excluir este Pedido!', mtConfirmation, [mbYes, mbno], 0)
    = mryes then
  begin
    if Prnumdoc.Text <> '' then
    begin
      try
        if not(dao.cn.InTransaction) then
          dao.cn.StartTransaction;
        dao.Execsql('delete from vendas1 where numdoc=' +
          QuotedStr(Prnumdoc.Text));
        dao.cn.Commit;
      except
        dao.cn.Rollback;
      end;

      limpa_campos('Pr');
    end;
  end;
end;

procedure Tfr_nfe_complementar.CalculoIcmsItem;
// ICMS ST = (Al x BC ST) – ICMS operação própria
begin
  mmVendas2VLR_BC.Value := mmVendas2SUB_TOTAL.Value;

  mmVendas2VLR_ICMS_ITEM.Value := mmVendas2VLR_BC.Value *
    (mmVendas2ICMS_ITEM.Value / 100);
  if (mmVendas2TRIB_ICMS.AsString = '60') or (mmVendas2TRIB_ICMS.AsString = '90')
  then
  begin
    // Buscar a Base de Cáculo ST
    mmVendas2VLR_BC_ST.Value :=
      RoundTo((mmVendas2SUB_TOTAL.Value * (1 + (mmVendas2VLR_AGR_ITEM.Value /
      100))), -2);
    mmVendas2VLR_ICMS_ST.Value :=
      RoundTo(((mmVendas2VLR_BC_ST.Value * (Aliquota_ICMS_Interno / 100)) -
      mmVendas2VLR_ICMS_ITEM.Value), -2);
    mmVendas2VLR_BC.Value := 0;
    mmVendas2VLR_ICMS_ITEM.Value := 0;
    mmVendas2ICMS_ITEM.Value := 0;
  end
  else
  begin
    mmVendas2VLR_BC_ST.Value := 0;
    mmVendas2VLR_ICMS_ST.Value := 0;
    mmVendas2VLR_AGR_ITEM.Value := 0;
  end;

  if cliente_isento_icms then
  begin
    mmVendas2VLR_BC_ST.Value := 0;
    mmVendas2VLR_ICMS_ST.Value := 0;
    mmVendas2VLR_BC.Value := 0;
    mmVendas2VLR_ICMS_ITEM.Value := 0;
    mmVendas2ICMS_ITEM.Value := 0;
  end;
end;

procedure Tfr_nfe_complementar.BtgrapedClick(Sender: TObject);
var
  id, id_item, cesta_basica, vlr_comissao, supervisor, sql_vendas2: string;
  comissao, qtd_est_reservado: real;
begin
  try
    if (Prcod_cliente.Text = '') and (Prcod_fornecedor.Text = '') then
    begin
      dao.msg('Campo Cliente ou Fornecedor deve ser Preenchido!');
      Prcod_cliente.SetFocus;
      Exit;
    end;

    if Prcod_fiscal.Text = '' then
    begin
      dao.msg('O campo Código Fiscal deve ser Preenchido');
      Prcod_fiscal.SetFocus;
      Exit;
    end;

    if (trim(PrNumdoc_Ref.Text) = '') then
    begin
      dao.msg('O campo N° de Documento Referente deve ser Preenchido');
      PrNumdoc_Ref.SetFocus;
      Exit;
    end;

    Btnovped.Enabled := true;
    Btaltped.Enabled := true;
    Btgraped.Enabled := false;
    Btcanped.Enabled := false;
    Btexcped.Enabled := true;
    Btlocped.Enabled := true;

    if Prnumdoc.Text = '' then
    begin
      try
        if not(dao.cn.InTransaction) then
          dao.cn.StartTransaction;
        Prnumdoc.Text := dao.insert('Pr', 'vendas1', 'numdoc',
          fr_nfe_complementar, 'gen_venda1');
        dao.cn.Commit;
      except
        dao.cn.Rollback;
      end;

    end
    else
    begin
      try
        if not(dao.cn.InTransaction) then
          dao.cn.StartTransaction;
        dao.update('vendas1', 'numdoc', Prnumdoc.Text, 'Pr',
          fr_nfe_complementar);
        dao.cn.Commit;
      except
        dao.cn.Rollback;
      end;
    end;

    if not mmVendas2.IsEmpty then
    begin
      mmVendas2.First;
      try
        if not(dao.cn.InTransaction) then
          dao.cn.StartTransaction;
        dao.Execsql('DELETE FROM VENDAS2 WHERE NUMDOC = ' + Prnumdoc.Text);

        PageControl1.TabIndex := 0;

        while not mmVendas2.Eof do
        begin
          mmVendas2.edit;

          sql_vendas2 := 'INSERT INTO VENDAS2 (NUMDOC, COD_PRODUTO, QTD, ' +
            ' PRECO, SUB_TOTAL, VOLUME, ' +
            ' COD_FISCAL_ITEM, ICMS_ITEM, VLR_ICMS_ST, VLR_BC_ST, VLR_ICMS_ITEM, NCM, VLR_BC, '
            + ' TRIB_ICMS) ' + ' VALUES (' + Prnumdoc.Text + ', ' +
            mmVendas2COD_PRODUTO.AsString + ', ' +
            FMFUN.BuscaTroca(mmVendas2QTD.AsString, ',', '.') + ', ' +
            FMFUN.BuscaTroca(mmVendas2PRECO_LIQUIDO.AsString, ',', '.') + ', ' +
            FMFUN.BuscaTroca(mmVendas2SUB_TOTAL.AsString, ',', '.') + ', ' +
            FMFUN.BuscaTroca(mmVendas2VOLUME.AsString, ',', '.') + ', ' +
            FMFUN.BuscaTroca(mmVendas2PRECO_VENDA.AsString, ',', '.') +
            mmVendas2COD_FISCAL_ITEM.AsString + ', ' +
            mmVendas2ICMS_ITEM.AsString + ', ' +
            FMFUN.BuscaTroca(mmVendas2VLR_ICMS_ST.AsString, ',', '.') + ', ' +
            FMFUN.BuscaTroca(mmVendas2VLR_BC_ST.AsString, ',', '.') + ', ' +
            FMFUN.BuscaTroca(mmVendas2VLR_ICMS_ITEM.AsString, ',', '.') + ', ' +
            QuotedStr(mmVendas2NCM.AsString) + ', ' +
            FMFUN.BuscaTroca(mmVendas2VLR_BC.AsString, ',', '.') + ', ' +
            FMFUN.BuscaTroca(mmVendas2TRIB_ICMS.AsString, ',', '.') + ')';

          dao.Execsql(sql_vendas2);

          mmVendas2.next;
        end;
      except
        dao.cn.Rollback;
        Exit;
      end;
      mmVendas2.First;
    end;
    { marca o status do pedido como não faturado }
    if not(dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    dao.Execsql('update vendas1 set faturado=' + QuotedStr('0') +
      ' where numdoc = ' + QuotedStr(Prnumdoc.Text));
    ativa_vendas1(Prnumdoc.Text);

    dao.cn.Commit;

    readonly_true('Pr');

    sbvendas.Panels.Items[0].Text := '';
    sbvendas.Panels.Items[1].Text := 'PEDIDO NÃO FATURADO';
  except
    on e: Exception do
    begin
      acao := '';
      dao.cn.Rollback;
      dao.msg('Houve um erro Ao Gravar o Pedido!' + #13 + e.Message);
{      dao.envia_email_suporte(e.Message + #13 + 'Data: ' + dao.DtaSerStr + #13 +
        'Usuario Logado:' + nom_usuario, 'Erro ao Gravar Pedido',
        'claudioplasfan@gmail.com', '', '', '');}
    end;
  end;
end;

procedure Tfr_nfe_complementar.BtlocpedClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
  It, J, Coluna: byte;
  totalcusto, lucromedio, tot_lucro: real;
  contador: integer;
  lucro: real;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  Fr_localizar.Caption := 'Localizar Vendas';
  chamou_pesquisa := 'fr_pedido_complementar';
  chamou_form := 'fr_pedido_complementar';
  chamou_cadastro := '';
  Fr_localizar.BT_cadastro.Visible := false;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 10);

  Campos_combo[0] := 'Numero';
  Campos_combo[1] := 'Cliente - Razão S.';
  Campos_combo[2] := 'Cliente - Fantasia';
  Campos_combo[3] := 'CNPJ';
  Campos_combo[4] := 'CPF';
  Campos_combo[5] := 'Cidade';
  Campos_combo[6] := 'Vendedor';
  Campos_combo[7] := 'NFE';
  Campos_combo[8] := 'NF';
  Campos_combo[9] := 'Fornecedor';
  for i := 0 to 9 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(Campos_combo[i]);
  end;
  Fr_localizar.CBcampos.ItemIndex := 0;

  if campo_pesquisado <> '' then
  begin
    Fr_localizar.CBcampos.ItemIndex := Fr_localizar.CBcampos.Items.IndexOf
      (campo_pesquisado);
    Fr_localizar.EDlocalizar.Text := dado_pesquisado;
    Fr_localizar.zzbusca_qualquer.Checked := busca_qualquer_posicao_pesquisada;
    Fr_localizar.loc_vendas(Fr_localizar.EDlocalizar.Text);
  end;

  try
    Fr_localizar.ShowModal;
  finally
    ativa_vendas1(Prnumdoc.Text);
    mostra_campos('Pr');
    Fr_localizar.Free;
  end;
  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure Tfr_nfe_complementar.BtnNFEClick(Sender: TObject);
var
  EmissaoNFe: TNFePedido;
begin
  frpri.DesabilitaTimers;
  { if Prcod_transportadora.Text = '' then
    begin
    dao.msg('O campo Transportadora deve ser Preenchido');
    Prcod_transportadora.SetFocus;
    exit;
    end;
  }
  if q_vendas1.fieldbyname('status_nfe').AsString = '100' then
  begin
    dao.msg('NF-e Complementar já foi enviada!');
    Exit;
  end;

  if PrNFE.Text = '' then
  begin
    dao.Geral4
      ('select CASE WHEN MAX(Nota) IS NULL THEN 1 ELSE MAX(Nota)+1 END AS NFE from '
      + ' ( SELECT NFE as  nota FROM VENDAS1 WHERE EMPRESA_FATURAR = ' +
      Prempresa_faturar.Text +
      ' union SELECT NFE_dev as nota FROM VENDAS1 WHERE EMPRESA_FATURAR = ' +
      Prempresa_faturar.Text + ') as ultima_nota ');
    PrNFE.Text := dao.Q4.fieldbyname('NFE').AsString;
    try
      if not(dao.cn.InTransaction) then
        (dao.cn.StartTransaction);
      dao.Execsql('update vendas1 set nfe=' + QuotedStr(PrNFE.Text) +
        ' where numdoc=' + QuotedStr(Prnumdoc.Text));
      dao.cn.Commit;
    except
      dao.cn.Rollback;
      Exit;
    end;
  end;
  Application.CreateForm(TFr_nfe_transmissao, Fr_nfe_transmissao);
  EmissaoNFe := TNFePedido.Create();
  EmissaoNFe.tipo := 0;

  Fr_nfe_transmissao.sCheckBox1.Visible := true;
  Fr_nfe_transmissao.sCheckBox1.Caption := 'Buscar Certificado.';

  Fr_nfe_transmissao.sCheckBox2.Visible := true;
  Fr_nfe_transmissao.sCheckBox2.Caption := 'Gerar Arquivo NFe.';

  Fr_nfe_transmissao.sCheckBox3.Visible := true;
  Fr_nfe_transmissao.sCheckBox3.Caption := 'Assinar Arquivo NFe.';

  Fr_nfe_transmissao.sCheckBox4.Visible := true;
  Fr_nfe_transmissao.sCheckBox4.Caption := 'Validar Arquivo NFe.';

  Fr_nfe_transmissao.sCheckBox5.Visible := true;
  Fr_nfe_transmissao.sCheckBox5.Caption := 'Gravando Chave NFe.';

  Fr_nfe_transmissao.sCheckBox6.Visible := true;
  Fr_nfe_transmissao.sCheckBox6.Caption := 'Enviando Lote';

  Fr_nfe_transmissao.sCheckBox7.Visible := true;
  Fr_nfe_transmissao.sCheckBox7.Caption := 'Grava Recibo Lote';

  Fr_nfe_transmissao.sCheckBox8.Visible := true;
  Fr_nfe_transmissao.sCheckBox8.Caption := 'Transferindo XML para Servidor FTP';

  Fr_nfe_transmissao.Gauge1.MaxValue := 8;
  Fr_nfe_transmissao.Height := Fr_nfe_transmissao.Height + (11 * 10);
  Fr_nfe_transmissao.Gauge1.Progress := 0;

  Fr_nfe_transmissao.ShowModal;
  if Fr_nfe_transmissao.modalresult = mrOk then
  begin
    frpri.HabilitaTimers;

    ativa_vendas1(Prnumdoc.Text);
    mostra_campos('Pr');
    if PrStatus_Nfe.Text = '100' then
      BtnDanfeClick(self);
  end;
end;

procedure Tfr_nfe_complementar.BtnNFEEntClick(Sender: TObject);
var
  EmissaoNFe: TNFePedido;
begin
  frpri.DesabilitaTimers;
  { if Prcod_transportadora.Text = '' then
    begin
    dao.msg('O campo Transportadora deve ser Preenchido');
    Prcod_transportadora.SetFocus;
    exit;
    end;
  }
  if q_vendas1.fieldbyname('status_nfe_dev').AsString = '100' then
  begin
    dao.msg('NF-e Complementar já foi enviada!');
    Exit;
  end;

  if PrNFE.Text = '' then
  begin
    dao.Geral4
      ('select CASE WHEN MAX(Nota) IS NULL THEN 1 ELSE MAX(Nota)+1 END AS NFE from '
      + ' ( SELECT NFE as  nota FROM VENDAS1 WHERE EMPRESA_FATURAR = ' +
      Prempresa_faturar.Text +
      ' union SELECT NFE_dev as nota FROM VENDAS1 WHERE EMPRESA_FATURAR = ' +
      Prempresa_faturar.Text + ')');
    PrNFE_Dev.Text := dao.Q4.fieldbyname('NFE').AsString;
    try
      if not(dao.cn.InTransaction) then
        (dao.cn.StartTransaction);
      dao.Execsql('update vendas1 set nfe=' + QuotedStr(PrNFE_Dev.Text) +
        ' where numdoc=' + QuotedStr(Prnumdoc.Text));
      dao.cn.Commit;
    except
      dao.cn.Rollback;
      Exit;
    end;
  end;
  Application.CreateForm(TFr_nfe_transmissao, Fr_nfe_transmissao);
  EmissaoNFe := TNFePedido.Create();
  EmissaoNFe.tipo := 1;

  Fr_nfe_transmissao.sCheckBox1.Visible := true;
  Fr_nfe_transmissao.sCheckBox1.Caption := 'Buscar Certificado.';

  Fr_nfe_transmissao.sCheckBox2.Visible := true;
  Fr_nfe_transmissao.sCheckBox2.Caption := 'Gerar Arquivo NFe.';

  Fr_nfe_transmissao.sCheckBox3.Visible := true;
  Fr_nfe_transmissao.sCheckBox3.Caption := 'Assinar Arquivo NFe.';

  Fr_nfe_transmissao.sCheckBox4.Visible := true;
  Fr_nfe_transmissao.sCheckBox4.Caption := 'Validar Arquivo NFe.';

  Fr_nfe_transmissao.sCheckBox5.Visible := true;
  Fr_nfe_transmissao.sCheckBox5.Caption := 'Gravando Chave NFe.';

  Fr_nfe_transmissao.sCheckBox6.Visible := true;
  Fr_nfe_transmissao.sCheckBox6.Caption := 'Enviando Lote';

  Fr_nfe_transmissao.sCheckBox7.Visible := true;
  Fr_nfe_transmissao.sCheckBox7.Caption := 'Grava Recibo Lote';

  Fr_nfe_transmissao.sCheckBox8.Visible := true;
  Fr_nfe_transmissao.sCheckBox8.Caption := 'Transferindo XML para Servidor FTP';

  Fr_nfe_transmissao.Gauge1.MaxValue := 8;
  Fr_nfe_transmissao.Height := Fr_nfe_transmissao.Height + (11 * 10);
  Fr_nfe_transmissao.Gauge1.Progress := 0;

  Fr_nfe_transmissao.ShowModal;
  if Fr_nfe_transmissao.modalresult = mrOk then
  begin
    frpri.HabilitaTimers;

    ativa_vendas1(Prnumdoc.Text);
    mostra_campos('Pr');
    if PrStatus_Nfe.Text = '100' then
      BtnDanfeClick(self);
  end;
end;

procedure TNFePedido.monta_NFE();
var
  cAssinarXML: _AssinarXML;
  strResultado: WideString;
  intResultado, CodigoNumerico: integer;
  smensagem: WideString;
  SubstituicaoTributaria, CestaBasica: boolean;
  Fnf: file;
  assXML: TextFile;
  J, nr_erro: integer;
  XMLDoc, ref, nome, xmlassinado, mensagem: WideString;
  path: string;
  strChaveAcesso, slInfCpl: string;
begin
  cont := 1;
  Synchronize(Mostra);
  smensagem := fr_nfe_complementar.ACBrNFe1.ssl.SelecionarCertificado;
  nome_titular := smensagem;

  cont := 2;
  Synchronize(Mostra);
  fr_nfe_complementar.ACBrNFe1.NotasFiscais.Clear;

  with fr_nfe_complementar.ACBrNFe1.NotasFiscais.Add.NFe do
  begin
    ide.tpAmb := FMFUN.BuscaAmbienteNFE;
    fr_nfe_complementar.ACBrNFe1.Configuracoes.WebServices.Ambiente :=
      ide.tpAmb;
    fr_nfe_complementar.ACBrNFe1.Configuracoes.WebServices.UF :=
      fr_nfe_complementar.UF_Emissor;
    fr_nfe_complementar.ACBrNFe1.Configuracoes.Geral.FormaEmissao := teNormal;
    fr_nfe_complementar.ACBrNFe1.Configuracoes.Arquivos.PathSchemas :=
      ExtractFilePath(Application.ExeName) + 'Schemas\';
    ide.cUF := fr_nfe_complementar.ACBrNFe1.Configuracoes.WebServices.UFCodigo;

    ide.serie := 1;
    infnfe.id := '1';
    infnfe.Versao := 4;

    if tipo = 0 then ide.nNF := strtoint(fr_nfe_complementar.PrNFE.Text);
    if tipo = 1 then ide.nNF := strtoint(fr_nfe_complementar.PrNFE_Dev.Text);

    ide.NFref.Add.refNFe := fr_nfe_complementar.ed_Chave_nfe_ref.Text;

    Randomize;
    CodigoNumerico := Random(9999999);
    ide.CNF := strtoint(Copy(frpri.strZero(CodigoNumerico, 8, 0), 1, 8));

    if tipo = 0 then
      ide.tpNF := tnSaida;
    if tipo = 1 then
      ide.tpNF := tnEntrada;
    ide.natOp := fr_nfe_complementar.Prcod_fiscal.Text;

    if ide.tpNF = tnEntrada then
    begin
      if ide.natOp = '5101' then
        ide.natOp := '1101';

      if ide.natOp = '5102' then
        ide.natOp := '1102';

      if ide.natOp = '5405' then
        ide.natOp := '1403';

      if ide.natOp = '5917' then
        ide.natOp := '1917';

      if ide.natOp = '6910' then
        ide.natOp := '2910';

      if ide.natOp = '5910' then
        ide.natOp := '1910';

      if ide.natOp = '6101' then
        ide.natOp := '2101';

      if ide.natOp = '6102' then
        ide.natOp := '2102';

      if ide.natOp = '6202' then
        ide.natOp := '2202';

      if ide.natOp = '5202' then
        ide.natOp := '1202';

      if ide.natOp = '6949' then
        ide.natOp := '2949';

      if ide.natOp = '5949' then
        ide.natOp := '1949';

      if ide.natOp = '6403' then
        ide.natOp := '2403';

      if ide.natOp = '6152' then
        ide.natOp := '2152';

      if ide.natOp = '6409' then
        ide.natOp := '2409';

      if ide.natOp = '6917' then
        ide.natOp := '2917';
    end
    else
    begin
      fr_nfe_complementar.PrCod_FiscalExit(self);
      Nnat_operacao := ide.natOp;
    end;

    if (fr_nfe_complementar.PrCod_Fop.Text = '1') or
      (fr_nfe_complementar.PrCod_Fop.Text = '2') then
      ide.indPag := ipVista;

    if (fr_nfe_complementar.PrCod_Fop.Text = '3') or
      (fr_nfe_complementar.PrCod_Fop.Text = '5') or
      (fr_nfe_complementar.PrCod_Fop.Text = '6') then
      ide.indPag := ipPrazo;

    if (fr_nfe_complementar.PrCod_Fop.Text = '4') or
      (fr_nfe_complementar.PrCod_Fop.Text = '7') then
      ide.indPag := ipOutras;

    ide.indPag := ipNenhum;
    ide.modelo := 55;
    ide.serie := 1;
    ide.dEmi := strtodate(fr_nfe_complementar.Prdta_saida.Text);
    ide.dSaiEnt := strtodate(fr_nfe_complementar.Prdta_saida.Text);

    ide.tpImp := tiRetrato;
    ide.finNFe := fnComplementar;
    ide.ProcEmi := peAplicativoContribuinte;

    // emitente
    (* Informações da TAG EMIT... *)
    dao.Geral2('SELECT ' + '  a.CNPJ, ' + '  a.NOM_EMPRESA, ' +
      '  a.NOM_FANTASIA, ' + '  a.ENDERECO, ' + '  a.NR_ENDERECO, ' +
      '  a.COMPLEMENTO, ' + '  a.BAIRRO, ' + '  c.COD_IBGE, ' +
      '  c.NOM_CIDADE, ' + '  c.UF, ' + '  a.CEP, ' + '  a.FONE, ' + '  a.IE ' +
      'FROM EMPRESA a ' +
      'INNER JOIN CIDADES c on (c.COD_CIDADE = a.COD_CIDADE) ' +
      'WHERE cod_empresa=' +
      QuotedStr(fr_nfe_complementar.Prempresa_faturar.Text));
    if dao.q2.RecordCount > 0 then
    begin
      emit.CNPJCPF := frpri.LimpaCNPJ(dao.q2.fieldbyname('CNPJ').AsString);
      strChaveAcesso := fMFUN.MontaChaveAcessoNFe(ide.cUF, ide.dEmi,
        emit.CNPJCPF, ide.modelo, ide.serie, ide.nNF, 1, ide.CNF);
      emit.xNome := FMFUN.AnsiToAscii(dao.q2.fieldbyname('NOM_EMPRESA')
        .AsString);
      emit.xFant := FMFUN.AnsiToAscii(dao.q2.fieldbyname('NOM_FANTASIA')
        .AsString);

      (* TAG EnderEMIT... *)
      emit.EnderEmit.xLgr := FMFUN.AnsiToAscii(dao.q2.fieldbyname('ENDERECO')
        .AsString);
      emit.EnderEmit.nro := dao.q2.fieldbyname('NR_ENDERECO').AsString;
      emit.EnderEmit.xCpl := FMFUN.AnsiToAscii(dao.q2.fieldbyname('COMPLEMENTO')
        .AsString);
      emit.EnderEmit.xBairro := FMFUN.AnsiToAscii(dao.q2.fieldbyname('BAIRRO')
        .AsString);
      emit.EnderEmit.cMun := dao.q2.fieldbyname('COD_IBGE').AsInteger;
      ide.cMunFG := emit.EnderEmit.cMun;
      emit.EnderEmit.xMun := FMFUN.AnsiToAscii(dao.q2.fieldbyname('NOM_CIDADE')
        .AsString);
      emit.EnderEmit.UF := dao.q2.fieldbyname('UF').AsString;
      emit.EnderEmit.CEP :=
        strtoint(frpri.LimpaCNPJ(dao.q2.fieldbyname('CEP').AsString));
      emit.EnderEmit.cPais := 1058;
      emit.EnderEmit.xPais := 'Brasil';
      emit.EnderEmit.fone := frpri.LimpaCNPJ(dao.q2.fieldbyname('FONE')
        .AsString);
      emit.IE := frpri.LimpaCNPJ(dao.q2.fieldbyname('IE').AsString);

      if fr_nfe_complementar.Prempresa_faturar.Text <> '2' then
        emit.CRT := crtRegimeNormal
      else
        emit.CRT := crtSimplesNacional;
    end;

    (* Informações da TAG DEST... *)
    if trim(fr_nfe_complementar.Prcod_cliente.Text) <> '' then
    begin
      dao.Geral1
        ('select nom_cliente, cnpj, ie, cpf, endereco, nr_endereco, complemento, bairro, cd.cod_ibge, cd.nom_cidade, cd.uf, cep, telefone from cliente c '
        + 'left join cidades cd on cd.cod_cidade=c.cod_cidade ' +
        'where cod_cliente=' +
        QuotedStr(fr_nfe_complementar.Prcod_cliente.Text));
    end
    else
    begin
      dao.Geral1
        ('select c.RAZAO_SOCIAL as nom_cliente, c.CNPCPF as cnpj, c.IERG as ie, null as cpf, endereco, nr_endereco, complemento, bairro, cd.cod_ibge, cd.nom_cidade, cd.uf, cep, fone as telefone from fornecedor c '
        + 'left join cidades cd on cd.cod_cidade=c.cod_cidade ' +
        'where cod_fornecedor=' +
        QuotedStr(fr_nfe_complementar.Prcod_fornecedor.Text));
    end;
    if ide.tpAmb = taProducao then
    begin
      if NOT dao.q1.fieldbyname('cpf').IsNull then
        Dest.CNPJCPF := frpri.LimpaCNPJ(dao.q1.fieldbyname('cpf').AsString);

      if trim(frpri.LimpaCNPJ(dao.q1.fieldbyname('cnpj').AsString)) <> '' then
        Dest.CNPJCPF :=
          trim(frpri.LimpaCNPJ(dao.q1.fieldbyname('cnpj').AsString));

      Dest.xNome := FMFUN.AnsiToAscii(dao.q1.fieldbyname('nom_cliente')
        .AsString);
    end
    else
    begin
      Dest.CNPJCPF := '99999999000191'; // '99999090910270';
      Dest.xNome :=
        'NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL';
      // 'NF-e Associacao NF-e';
    end;

    // 'DISTRIBUIDORA DE AGUAS MINERAIS';
    (* TAG EnderDEST... *)
    Dest.EnderDest.xLgr := FMFUN.AnsiToAscii(dao.q1.fieldbyname('endereco')
      .AsString);

    // 'AV DAS FONTES';
    Dest.EnderDest.nro := FMFUN.AnsiToAscii(dao.q1.fieldbyname('nr_endereco')
      .AsString);

    if Ncomplemento_destino <> '' then
      Dest.EnderDest.xCpl := dao.q1.fieldbyname('complemento').AsString
    else
      Dest.EnderDest.xCpl := 'loja';
    Dest.EnderDest.xBairro := FMFUN.AnsiToAscii(dao.q1.fieldbyname('bairro')
      .AsString);
    Dest.EnderDest.cMun := dao.q1.fieldbyname('cod_ibge').AsInteger;
    Dest.EnderDest.xMun := FMFUN.AnsiToAscii(dao.q1.fieldbyname('nom_cidade')
      .AsString);
    Dest.EnderDest.UF := dao.q1.fieldbyname('uf').AsString;
    Dest.EnderDest.CEP :=
      strtoint(frpri.LimpaCNPJ(dao.q1.fieldbyname('cep').AsString));
    Dest.EnderDest.cPais := 1058;
    Dest.EnderDest.xPais := 'BRASIL'; // 'BRASIL';

    if NOT dao.q1.fieldbyname('telefone').IsNull then
      Dest.EnderDest.fone := frpri.LimpaCNPJ(dao.q1.fieldbyname('telefone')
        .AsString); // '1932011234';

    if dao.q1.fieldbyname('ie').AsString = 'ISENTO' then
      Dest.IE := 'ISENTO'
    else
      Dest.IE := frpri.LimpaCNPJ(dao.q1.fieldbyname('ie').AsString);

    if Dest.EnderDest.UF = emit.EnderEmit.UF then
      ide.idDest := doInterna
    else
      ide.idDest := doInterestadual;

    // mercadoria já estão na unit FRMMontaXML é só definir a variavel Mform
    dao.Geral1('select ' +
      ' a.ID, a.NUMDOC, a.DTADOC, a.COD_PRODUTO, a.COD_CLIENTE, a.COD_REPRESENTANTE, '
      + ' a.ID_COR, a.ID_TAMANHO, a.QTD, a.QTD_DEVOLVIDA, a.DEVOLVIDO, a.PRECO, a.SUB_TOTAL, '
      + ' a.DESCONTO, a.VOLUME, a.COD_EMPRESA, a.NR_PEDIDO_PALM, a.PRECO_BRUTO, a.SUB_TOTAL_BRUTO, '
      + ' a.VLR_COMISSAO, a.TROCA, a.COD_FISCAL_ITEM, a.ICMS_ITEM, a.VLR_ICMS_ST, a.VLR_BC_ST, '
      + ' a.VLR_ICMS_ITEM, a.NCM, a.VLR_BC, a.IPI_ITEM, a.VLR_IPI_ITEM, a.VLR_AGR_ITEM, a.TRIB_ICMS, '
      + ' a.CESTA_BASICA, a.COD_SUPERVISOR, a.QTD_EMBALAGEM, a.PRECO_CUSTO, a.PERC_COMISSAO, '
      + ' a.PROMOCAO, a.DESCONTO_MAX, ' + ' p.nom_produto, ' + ' p.unidade, ' +
      ' p.qtd_embalagem, ' + ' cd.uf ' + 'from vendas2 a ' +
      'inner join vendas1 v1 on (v1.NUMDOC = a.NUMDOC) ' +
      'inner join FORNECEDOR c on (C.COD_FORNECEDOR = v1.COD_FORNECEDOR) ' +
      'inner join CIDADES cd on (cd.COD_Cidade = c.COD_CIDADE) ' +
      'left join produto p on p.cod_produto= a.cod_produto ' +
      'left join ncm n on (n.CODIGO = a.NCM) ' + 'where a.numdoc=' +
      QuotedStr(fr_nfe_complementar.Prnumdoc.Text));

    dao.Geral2
      ('select  tot_liquido, vlr_icms, vlr_bc_icms, vlr_bc_icms_st, vlr_st, vl_frete, vlr_ipi from vendas1 where numdoc='
      + QuotedStr(fr_nfe_complementar.Prnumdoc.Text));
    Nvalor_NF := dao.q2.fieldbyname('tot_liquido').AsFloat +
      dao.q2.fieldbyname('vlr_ipi').AsFloat;
    Nbase_calculo_icms_tot := dao.q2.fieldbyname('vlr_bc_icms').AsFloat;
    Nvalor_icms_tot := dao.q2.fieldbyname('vlr_icms').AsFloat;

    if fr_nfe_complementar.mmVendas2.IsEmpty then
    begin
      with det.Add do
      begin
        Prod.nItem := 1;
        Prod.CProd := '99999';
        Prod.CEAN := ''; (* Se não tiver EAN tem que colocar em Branco... *)
        Prod.XProd := 'COMPLEMENTO'; // 'Agua Mineral';
        Prod.NCM := '39173290'; // 'NCM';
        Prod.CFOP := ide.natOp;

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

        (* Será necessário criar regras de negócio  de acordo com o ERP na qual definirá a ocorrência das TAGs de IMPOSTO... *)
        (* TAG ICMS.ICMS00... *)

        if Nvalor_icms_tot > 0 then
        begin
          if fr_nfe_complementar.Prempresa_faturar.Text <> '2' then
          begin
            Imposto.ICMS.orig := oeNacional;
            Imposto.ICMS.CST := cst00;
            Imposto.ICMS.ModBC := dbiMargemValorAgregado;
            (* Zero é Aceitavél como valor... *)

            Imposto.ICMS.VBC := Nbase_calculo_icms_tot; // '10000000.00';
            { if Nnom_UF_destino = 'SC' then
              Imposto.ICMS.PICMS := 17
              else
              Imposto.ICMS.PICMS := 12; }
            // '18.00';
            // Imposto.ICMS.PICMS := 6;
            Imposto.ICMS.VICMS := Nvalor_icms_tot; // '1800000.00';
          end;
        end;

        if fr_nfe_complementar.PrVLR_BC_ICMS_ST.Value > 0 then
        begin
          if fr_nfe_complementar.Prempresa_faturar.Text <> '2' then
          begin
            (* TAG ICMS.ICMS60... *)
            if Nnom_UF_destino = 'SC' then
            begin
              Imposto.ICMS.orig := oeNacional;
              Imposto.ICMS.CST := cst60;

              Imposto.ICMS.VBCSTRet := 0;
              Imposto.ICMS.VICMSSTRet := 0;
              SubstituicaoTributaria := true;
            end
            else
            begin
              Imposto.ICMS.orig := oeNacional;
              Imposto.ICMS.CST := cst10;

              Imposto.ICMS.vBCST := fr_nfe_complementar.PrVLR_BC_ICMS_ST.Value;
              Imposto.ICMS.vICMSST := fr_nfe_complementar.Prvlr_st.Value;
              SubstituicaoTributaria := false;
            end;
          end;
        end;

        (* TAG PIS.PISALIQ... *)
        if fr_nfe_complementar.Prempresa_faturar.Text <> '2' then
        begin
          Imposto.PIS.CST := pis01;
          Imposto.PIS.VBC := 0;
          Imposto.PIS.PPIS := 0.65;
          Imposto.PIS.VPIS := 0;
        end
        else
        begin
          Imposto.PIS.CST := pis99;
          Imposto.PIS.QBCProd := 0;
          Imposto.PIS.VAliqProd := 0;
          Imposto.PIS.VPIS := 0;
        end;

        (* TAG COFINS.COFINSALIQ_CST... *)
        // felipe comentou aqui
        if fr_nfe_complementar.Prempresa_faturar.Text <> '2' then
        begin
          Imposto.COFINS.CST := cof01;
          Imposto.COFINS.VBC := 0;
          Imposto.COFINS.PCOFINS := 2;
          Imposto.COFINS.VCOFINS := 0;
        end
        else
        begin
          Imposto.COFINS.CST := cof99;
          Imposto.COFINS.QBCProd := 0;
          Imposto.COFINS.VAliqProd := 0;
          Imposto.COFINS.VCOFINS := 0;
        end;
      end;
      { end
        else
        begin
        fr_nfe_complementar.mmVendas2.First;
        while not fr_nfe_complementar.mmVendas2.Eof do
        begin
        J := J + 1;

        with det.Add do
        begin
        Prod.nItem := J;
        Prod.CProd := fr_nfe_complementar.q_vendas2.fieldbyname('cod_produto')
        .AsString; // '00001';
        Prod.CEAN := fr_nfe_complementar.q_vendas2.fieldbyname('codigo_barra')
        .AsString; (* Se não tiver EAN tem que colocar em Branco... *)
        Prod.XProd :=
        trim(FMFUN.AnsiToAscii(fr_nfe_complementar.q_vendas2.fieldbyname
        ('nom_produto').AsString)); // 'Agua Mineral';
        Prod.NCM := FMFUN.TratarCodigoNCM
        (fr_nfe_complementar.q_vendas2.fieldbyname('ncm').AsString, 1);
        // 'NCM';
        Prod.CFOP := fr_nfe_complementar.q_vendas2.fieldbyname
        ('COD_FISCAL_ITEM').AsString;

        Prod.UCom := inttostr(fr_nfe_complementar.q_vendas2.fieldbyname
        ('volume').AsInteger) + fr_nfe_complementar.q_vendas2.fieldbyname
        ('unidade').AsString;
        Prod.QCom := fr_nfe_complementar.q_vendas2.fieldbyname('qtd').AsFloat;
        // '1000000.0000';
        Prod.VUnCom := fr_nfe_complementar.q_vendas2.fieldbyname('preco')
        .AsFloat; // '1';
        Prod.VProd :=
        RoundTo((fr_nfe_complementar.q_vendas2.fieldbyname('preco').AsFloat
        * fr_nfe_complementar.q_vendas2.fieldbyname('qtd').AsFloat), -2);
        // '10000000.00';
        Prod.CEANTrib := fr_nfe_complementar.q_vendas2.fieldbyname
        ('codigo_barra').AsString;
        (* Se não tiver EAN Trib. tem que colocar em Branco... *)
        Prod.UTrib := 'und'; // 'und';
        Prod.QTrib := fr_nfe_complementar.q_vendas2.fieldbyname('qtd')
        .AsFloat; // '12000000.0000';
        Prod.VUnTrib := 1;
        Prod.IndTot := itSomaTotalNFe;
        (* Será necessário criar regras de negócio  de acordo com o ERP na qual definirá a ocorrência das TAGs de IMPOSTO... *)
        (* TAG ICMS.ICMS00... *)

        if (fr_nfe_complementar.q_vendas2.fieldbyname('trib_icms')
        .AsString = '00') or
        (fr_nfe_complementar.q_vendas2.fieldbyname('trib_icms')
        .AsString = '0') then
        begin
        if fr_nfe_complementar.Prempresa_faturar.Text = '1' then
        begin
        Imposto.ICMS.orig := oeNacional;
        Imposto.ICMS.CST := cst00;
        Imposto.ICMS.ModBC := dbiMargemValorAgregado;
        (* Zero é Aceitavél como valor... *)
        Imposto.ICMS.VBC := fr_nfe_complementar.q_vendas2.fieldbyname
        ('vlr_bc').AsFloat; // '10000000.00';
        Imposto.ICMS.PICMS := fr_nfe_complementar.q_vendas2.fieldbyname
        ('icms_item').AsFloat; // '18.00';
        Imposto.ICMS.VICMS :=
        RoundTo((fr_nfe_complementar.q_vendas2.fieldbyname('vlr_bc')
        .AsFloat * (fr_nfe_complementar.q_vendas2.fieldbyname
        ('icms_item').AsFloat / 100)), -2); // '1800000.00';
        end
        else
        begin
        Imposto.ICMS.orig := oeNacional;
        Imposto.ICMS.CSOSN := csosn900;
        Imposto.ICMS.ModBC := dbiPauta;
        Imposto.ICMS.VBC := fr_nfe_complementar.q_vendas2.fieldbyname
        ('vlr_bc').AsFloat;
        Imposto.ICMS.PICMS := fr_nfe_complementar.q_vendas2.fieldbyname
        ('icms_item').AsFloat; // '18.00';
        Imposto.ICMS.VICMS :=
        RoundTo((fr_nfe_complementar.q_vendas2.fieldbyname('vlr_bc')
        .AsFloat * (fr_nfe_complementar.q_vendas2.fieldbyname
        ('icms_item').AsFloat / 100)), -2);
        // end;
        end;

        end;

        if (fr_nfe_complementar.q_vendas2.fieldbyname('trib_icms')
        .AsString = '10') then
        begin
        if fr_nfe_complementar.Prempresa_faturar.Text = '1' then
        begin

        Imposto.ICMS.orig := oeNacional;
        Imposto.ICMS.CST := cst10;
        Imposto.ICMS.ModBC := dbiMargemValorAgregado;
        (* Zero é Aceitavél como valor... *)
        Imposto.ICMS.VBC := fr_nfe_complementar.q_vendas2.fieldbyname
        ('vlr_bc').AsFloat; // '10000000.00';
        Imposto.ICMS.PICMS := fr_nfe_complementar.q_vendas2.fieldbyname
        ('icms_item').AsFloat; // '18.00';
        Imposto.ICMS.VICMS :=
        RoundTo((fr_nfe_complementar.q_vendas2.fieldbyname('vlr_bc')
        .AsFloat * (fr_nfe_complementar.q_vendas2.fieldbyname
        ('icms_item').AsFloat / 100)), -2); // '1800000.00';
        end
        else
        begin

        Imposto.ICMS.orig := oeNacional;
        Imposto.ICMS.CSOSN := csosn202;
        Imposto.ICMS.ModBC := dbiPauta;
        Imposto.ICMS.VBC := fr_nfe_complementar.q_vendas2.fieldbyname
        ('vlr_bc').AsFloat;
        Imposto.ICMS.PICMS := fr_nfe_complementar.q_vendas2.fieldbyname
        ('icms_item').AsFloat; // '18.00';
        Imposto.ICMS.VICMS :=
        RoundTo((fr_nfe_complementar.q_vendas2.fieldbyname('vlr_bc')
        .AsFloat * (fr_nfe_complementar.q_vendas2.fieldbyname
        ('icms_item').AsFloat / 100)), -2);
        // end;
        end;
        end;

        (* TAG ICMS.ICMS40... *)
        if fr_nfe_complementar.q_vendas2.fieldbyname('trib_icms').AsString = '40'
        then
        begin
        if fr_nfe_complementar.Prempresa_faturar.Text = '1' then
        begin
        Imposto.ICMS.orig := oeNacional;
        Imposto.ICMS.CST := cst40;
        end;
        end;
        if fr_nfe_complementar.Prempresa_faturar.Text = '1' then
        begin
        if fr_nfe_complementar.q_vendas2.fieldbyname('trib_icms').AsString = '60'
        then
        begin
        (* TAG ICMS.ICMS60... *)
        Imposto.ICMS.orig := oeNacional;
        Imposto.ICMS.CST := cst60;
        Imposto.ICMS.VBCSTRet := fr_nfe_complementar.q_vendas2.fieldbyname
        ('vlr_bc_st').AsFloat;
        Imposto.ICMS.VICMSSTRet :=
        fr_nfe_complementar.q_vendas2.fieldbyname
        ('vlr_icms_st').AsFloat;
        SubstituicaoTributaria := true;
        end;

        if fr_nfe_complementar.q_vendas2.fieldbyname('trib_icms').AsString = '90'
        then
        begin
        (* TAG ICMS.ICMS90... *)
        Imposto.ICMS.orig := oeNacional;
        Imposto.ICMS.CST := cst90;
        Imposto.ICMS.ModBCST := dbisPrecoTabelado;
        Imposto.ICMS.PMVAST := fr_nfe_complementar.q_vendas2.fieldbyname
        ('vlr_agr_item').AsFloat;
        Imposto.ICMS.vBCST := fr_nfe_complementar.q_vendas2.fieldbyname
        ('vlr_bc_st').AsFloat;
        Imposto.ICMS.PICMSST := 12;
        Imposto.ICMS.vICMSST := fr_nfe_complementar.q_vendas2.fieldbyname
        ('vlr_icms_st').AsFloat;
        CestaBasica := true;
        end;
        end
        else
        begin
        if fr_nfe_complementar.q_vendas2.fieldbyname('trib_icms').AsString = '90'
        then
        begin
        Imposto.ICMS.orig := oeNacional;
        Imposto.ICMS.CSOSN := csosn202;
        Imposto.ICMS.ModBCST := dbisPrecoTabelado;
        Imposto.ICMS.PMVAST := fr_nfe_complementar.q_vendas2.fieldbyname
        ('vlr_agr_item').AsFloat;
        Imposto.ICMS.vBCST := fr_nfe_complementar.q_vendas2.fieldbyname
        ('vlr_bc_st').AsFloat;
        if Nnom_UF_destino <> 'SC' then
        Imposto.ICMS.PICMSST := 12
        else
        Imposto.ICMS.PICMSST := 17;
        Imposto.ICMS.vICMSST := fr_nfe_complementar.q_vendas2.fieldbyname
        ('vlr_icms_st').AsFloat;

        CestaBasica := true;
        end;
        if fr_nfe_complementar.q_vendas2.fieldbyname('trib_icms').AsString = '60'
        then
        begin
        Imposto.ICMS.orig := oeNacional;
        Imposto.ICMS.CSOSN := csosn500;
        Imposto.ICMS.VBCSTRet := 0;
        Imposto.ICMS.VICMSSTRet := 0;
        SubstituicaoTributaria := true;
        end;
        if fr_nfe_complementar.q_vendas2.fieldbyname('trib_icms').AsString = '40'
        then
        begin
        Imposto.ICMS.orig := oeNacional;
        Imposto.ICMS.CSOSN := csosn400;
        end;
        end;

        (* TAG IPI.IPITRIB... *)
        if (fr_nfe_complementar.Prempresa_faturar.Text = '1') and
        ((fr_nfe_complementar.q_vendas2.fieldbyname('COD_FISCAL_ITEM')
        .AsString = '5202') or
        (fr_nfe_complementar.q_vendas2.fieldbyname('COD_FISCAL_ITEM')
        .AsString = '6202')) then
        begin
        Imposto.IPI.CEnq := '999';
        Imposto.IPI.CST := ipi50;
        Imposto.IPI.VBC := fr_nfe_complementar.q_vendas2.fieldbyname
        ('sub_total').AsFloat;
        Imposto.IPI.PIPI := fr_nfe_complementar.q_vendas2.fieldbyname
        ('ipi_item').AsFloat;
        Imposto.IPI.VIPI := fr_nfe_complementar.q_vendas2.fieldbyname
        ('vlr_ipi_item').AsFloat;
        end;

        (* TAG PIS.PISALIQ... *)
        if fr_nfe_complementar.Prempresa_faturar.Text = '1' then
        begin
        Imposto.PIS.CST := pis01;
        Imposto.PIS.VBC := fr_nfe_complementar.q_vendas2.fieldbyname
        ('sub_total').AsFloat;
        Imposto.PIS.PPIS := 0.65;
        Imposto.PIS.VPIS := fr_nfe_complementar.q_vendas2.fieldbyname
        ('sub_total').AsFloat * 0.0065;
        end
        else
        begin
        Imposto.PIS.CST := pis99;
        Imposto.PIS.QBCProd := 0;
        Imposto.PIS.VAliqProd := 0;
        Imposto.PIS.VPIS := 0;
        end;

        (* TAG COFINS.COFINSALIQ_CST... *)
        // felipe comentou aqui
        if fr_nfe_complementar.Prempresa_faturar.Text = '1' then
        begin
        Imposto.COFINS.CST := cof01;
        Imposto.COFINS.VBC := fr_nfe_complementar.q_vendas2.fieldbyname
        ('sub_total').AsFloat;
        Imposto.COFINS.PCOFINS := 2;
        Imposto.COFINS.VCOFINS := fr_nfe_complementar.q_vendas2.fieldbyname
        ('sub_total').AsFloat * 0.02;
        end
        else
        begin
        Imposto.COFINS.CST := cof99;
        Imposto.COFINS.QBCProd := 0;
        Imposto.COFINS.VAliqProd := 0;
        Imposto.COFINS.VCOFINS := 0;
        end;

        (* TAG ICMS.ICMS40... *)
        if fr_nfe_complementar.q_vendas2.fieldbyname('trib_icms').AsString = '40'
        then
        begin
        if fr_nfe_complementar.Prempresa_faturar.Text = '1' then
        begin
        Imposto.ICMS.orig := oeNacional;
        Imposto.ICMS.CST := cst40;
        end;
        end;
        if fr_nfe_complementar.Prempresa_faturar.Text = '1' then
        begin
        if fr_nfe_complementar.q_vendas2.fieldbyname('trib_icms').AsString = '60'
        then
        begin
        (* TAG ICMS.ICMS60... *)
        Imposto.ICMS.orig := oeNacional;
        Imposto.ICMS.CST := cst60;
        Imposto.ICMS.VBCSTRet := 0;
        Imposto.ICMS.VICMSSTRet := 0;
        SubstituicaoTributaria := true;
        end;

        if fr_nfe_complementar.q_vendas2.fieldbyname('trib_icms').AsString = '90'
        then
        begin
        (* TAG ICMS.ICMS90... *)
        Imposto.ICMS.orig := oeNacional;
        Imposto.ICMS.CST := cst90;
        Imposto.ICMS.ModBCST := dbisPrecoTabelado;
        Imposto.ICMS.PMVAST := fr_nfe_complementar.q_vendas2.fieldbyname
        ('vlr_agr_item').AsFloat;
        Imposto.ICMS.vBCST := fr_nfe_complementar.q_vendas2.fieldbyname
        ('vlr_bc_st').AsFloat;
        Imposto.ICMS.PICMSST := 12;
        Imposto.ICMS.vICMSST := fr_nfe_complementar.q_vendas2.fieldbyname
        ('vlr_icms_st').AsFloat;
        CestaBasica := true;
        end;
        end;

        (* TAG PIS.PISALIQ... *)
        if fr_nfe_complementar.Prempresa_faturar.Text = '1' then
        begin
        Imposto.PIS.CST := pis01;
        Imposto.PIS.VBC := 0;
        Imposto.PIS.PPIS := 0.65;
        Imposto.PIS.VPIS := 0;
        end
        else
        begin
        Imposto.PIS.CST := pis99;
        Imposto.PIS.QBCProd := 0;
        Imposto.PIS.VAliqProd := 0;
        Imposto.PIS.VPIS := 0;
        end;
        (* TAG COFINS.COFINSALIQ_CST... *)
        // felipe comentou aqui
        if fr_nfe_complementar.Prempresa_faturar.Text = '1' then
        begin
        Imposto.COFINS.CST := cof01;
        Imposto.COFINS.VBC := 0;
        Imposto.COFINS.PCOFINS := 2;
        Imposto.COFINS.VCOFINS := 0;
        end
        else
        begin
        Imposto.COFINS.CST := cof99;
        Imposto.COFINS.QBCProd := 0;
        Imposto.COFINS.VAliqProd := 0;
        Imposto.COFINS.VCOFINS := 0;
        end;
        end;
        fr_nfe_complementar.mmVendas2.next;
        end; }
    end;
    // Totais
    dao.Geral1
      ('select  tot_liquido, vlr_icms, vlr_bc_icms, vlr_bc_icms_st, vlr_st, vl_frete, vlr_ipi from vendas1 where numdoc='
      + QuotedStr(fr_nfe_complementar.Prnumdoc.Text));
    Total.ICMSTot.VBC := dao.q1.fieldbyname('vlr_bc_icms').AsFloat;
    Total.ICMSTot.VICMS := dao.q1.fieldbyname('vlr_icms').AsFloat;

    if Nnom_UF_destino = 'SC' then
    begin
      Total.ICMSTot.vBCST := 0;
      Total.ICMSTot.VST := 0;
    end
    else
    begin
      Total.ICMSTot.vBCST := fr_nfe_complementar.PrVLR_BC_ICMS_ST.Value;
      Total.ICMSTot.VST := fr_nfe_complementar.Prvlr_st.Value;
    end;

    Total.ICMSTot.VProd := dao.q1.fieldbyname('tot_liquido').AsFloat;
    Total.ICMSTot.VFrete := dao.q1.fieldbyname('vl_frete').AsFloat;
    Total.ICMSTot.vSeg := 0;
    Total.ICMSTot.vDesc := 0;
    Total.ICMSTot.vII := 0;
    Total.ICMSTot.VIPI := dao.q1.fieldbyname('vlr_ipi').AsFloat;
    Total.ICMSTot.VPIS := 0;
    Total.ICMSTot.VCOFINS := 0;
    Total.ICMSTot.vOutro := 0;
    Total.ICMSTot.vNF := dao.q1.fieldbyname('tot_liquido').AsFloat +
      dao.q1.fieldbyname('vlr_ipi').AsFloat + Total.ICMSTot.VST;

    Transp.ModFrete := mfContaDestinatario;

    if fr_nfe_complementar.Prcod_transportadora.Text <> '' then
    begin
      dao.Geral2('SELECT ' + '  a.CNPJ, ' + '  a.NOME, ' + '  a.ENDERECO, ' +
        '  a.BAIRRO, ' + '  c.COD_IBGE, ' + '  c.NOM_CIDADE, ' + '  c.UF, ' +
        '  a.CEP, ' + '  a.FONE, ' + '  a.IE ' + 'FROM TRANSPORTADORA a ' +
        'INNER JOIN CIDADES c on (c.COD_CIDADE = a.COD_CIDADE) ' +
        'WHERE cod_transportadora=' +
        QuotedStr(fr_nfe_complementar.Prcod_transportadora.Text));

      if dao.q2.RecordCount > 0 then
      begin
        Transp.Transporta.CNPJCPF :=
          frpri.LimpaCNPJ(dao.q2.fieldbyname('CNPJ').AsString);
        Transp.Transporta.xNome := FMFUN.AnsiToAscii(dao.q2.fieldbyname('NOME')
          .AsString);
        Transp.Transporta.IE := frpri.LimpaCNPJ(dao.q2.fieldbyname('IE')
          .AsString);
        Transp.Transporta.xEnder :=
          FMFUN.AnsiToAscii(dao.q2.fieldbyname('ENDERECO').AsString);
        Transp.Transporta.xMun :=
          FMFUN.AnsiToAscii(dao.q2.fieldbyname('NOM_CIDADE').AsString);
        Transp.Transporta.UF := dao.q2.fieldbyname('UF').AsString;
      end;
    end
    else
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
      qVol := 0;
      esp := 'VOLUMES';
      marca := 'X';
      pesoL := 0;
      pesoB := 0;
    end;

    with pag.Add do
    begin
      tPag := fpSemPagamento;
    end;

      slInfCpl := '';

    if (dao.q1.fieldbyname('vlr_st').AsFloat > 0) and (Nnom_UF_destino = 'SC')
    then
      slInfCpl := slInfCpl +
        'Imposto retido por Substituicao Tributaria RIMCMS SC/01 Anexo 3. BCST '
        + FMFUN.DecimalPonto(FormatFloat('##0.00',
        dao.q1.fieldbyname('vlr_bc_icms_st').AsFloat)) + ' IST ' +
        FMFUN.DecimalPonto(FormatFloat('##0.00', dao.q1.fieldbyname('vlr_st')
        .AsFloat)) + '.';

    slInfCpl := slInfCpl + 'NFe Complementar Referente a NFe: ' +
      fr_nfe_complementar.edNfe_Ref.Text;

    InfAdic.InfCpl := slInfCpl;

    infRespTec.xContato := 'CLAUDIO LUIS TOMASI';
    infRespTec.CNPJ := '20846616000276';
    infRespTec.email := 'cltomasi@gmail.com';
    infRespTec.fone := '47999187025';


    cont := 3;
    Synchronize(Mostra);
    fr_nfe_complementar.ACBrNFe1.NotasFiscais.Assinar;

    // OD.FileName:= arquivo_nfe;//buscando o xml gerado
    // AssignFile(Fnf, OD.FileName);//colocando em memoria
    path := ExtractFilePath(Application.ExeName);
    arquivo_nfe := path + 'nf\';
    arquivo_nfe := arquivo_nfe + strChaveAcesso + '-nfe.xml';

    cont := 4;
    Synchronize(Mostra);

    try
      fr_nfe_complementar.ACBrNFe1.NotasFiscais.Validar;
    except
      msgerros := fr_nfe_complementar.ACBrNFe1.NotasFiscais.Items[0].Alertas;
      if msgerros = '' then
        msgerros := fr_nfe_complementar.ACBrNFe1.NotasFiscais.Items[0].ErroValidacaoCompleto
      else
        msgerros := msgerros + #13 + fr_nfe_complementar.ACBrNFe1.NotasFiscais.Items[0].ErroValidacaoCompleto;

      erro := true;
    end;

    fr_nfe_complementar.ACBrNFe1.NotasFiscais.Items[0].NomeArq := arquivo_nfe;
    fr_nfe_complementar.ACBrNFe1.NotasFiscais.GravarXML(arquivo_nfe);

  end;
end;

constructor TNFePedido.Create;
begin
  inherited Create(true);
  { Chama o contrutor herdado. Ele irá temporariamente colocar o thread em estado de espera para depois executá-lo. }
  FreeOnTerminate := true; // Libera o objeto após terminar.
  Priority := TpLower;
  { Configura sua prioridade na lista de processos do Sistema operacional. }
  Resume; // Inicia o Thread.
end;

procedure TNFePedido.Execute;
begin
  try
    CoInitialize(nil);

    monta_NFE;

    if not erro then
    begin
      GravarChaveNfe;
      EnviarLote(PathLote);
      GravarReciboNfe;
      //TransfereNfeFTP;

      finalizado := true;
      Synchronize(Mostra);
      DeleteFile(arquivo_nfe);
    end
    else
    begin
      // DeleteFile(arquivo_nfe);
      Synchronize(Mostra);
    end;

    Fr_nfe_transmissao.BtnOK.Enabled := true;

  finally
    CoUnInitialize;
  end;

  frpri.TmUpdate.Enabled := true;
end;

procedure TNFePedido.Mostra;
begin
  case cont of
    1:
      begin
        Fr_nfe_transmissao.sCheckBox1.Checked := true;
      end;
    2:
      begin
        Fr_nfe_transmissao.sCheckBox2.Checked := true;
      end;
    3:
      begin
        Fr_nfe_transmissao.sCheckBox3.Checked := true;
      end;
    4:
      begin
        Fr_nfe_transmissao.sCheckBox4.Checked := true;
      end;
    5:
      begin
        Fr_nfe_transmissao.sCheckBox5.Checked := true;
      end;
    6:
      begin
        Fr_nfe_transmissao.sCheckBox6.Checked := true;
      end;
    7:
      begin
        Fr_nfe_transmissao.sCheckBox7.Checked := true;
      end;
    8:
      begin
        Fr_nfe_transmissao.sCheckBox8.Checked := true;
      end;
    9:
      begin
        Fr_nfe_transmissao.sCheckBox9.Checked := true;
      end;
    10:
      begin
        Fr_nfe_transmissao.sCheckBox10.Checked := true;
      end;
  end;

  Fr_nfe_transmissao.Gauge1.Progress := cont;

  if erro then
  begin
    Fr_nfe_transmissao.lbResultado.Visible := true;
    Fr_nfe_transmissao.MsgErro.Visible := true;
    Fr_nfe_transmissao.MsgErro.Text := msgerros;
    Fr_nfe_transmissao.MsgErro.Height := Fr_nfe_transmissao.Panel1.Height -
      Fr_nfe_transmissao.MsgErro.Top;
    Fr_nfe_transmissao.lbResultado.Caption := 'Houve erro no processo.';
    Fr_nfe_transmissao.BtnOK.Enabled := true;
  end;

  if finalizado then
  begin
    Fr_nfe_transmissao.lbResultado.Visible := true;
    Fr_nfe_transmissao.lbResultado.Caption := 'Processo realizado com sucesso.';
    Fr_nfe_transmissao.BtnOK.Enabled := true;
  end;

  Fr_nfe_transmissao.update;
  Sleep(2000);
end;

procedure TNFePedido.GravarChaveNfe;
begin
  cont := 5;
  Synchronize(Mostra);

  fr_nfe_complementar.XMLNFe.LoadFromFile(arquivo_nfe);
  fr_nfe_complementar.XMLNFe.Active := true;
  ChaveNfe := fr_nfe_complementar.XMLNFe.DocumentElement.ChildNodes.FindNode
    ('infNFe').Attributes['Id'];
  ChaveNfe := Copy(ChaveNfe, 4, 44);
  try
    if not(dao.cn.InTransaction) then
      dao.cn.StartTransaction;

    if tipo = 0 then
      dao.Execsql('update vendas1 set CHAVE_NFE =' + QuotedStr(ChaveNfe) +
        ' where numdoc=' + QuotedStr(fr_nfe_complementar.Prnumdoc.Text))
    else
      dao.Execsql('update vendas1 set CHAVE_NFE_DEV =' + QuotedStr(ChaveNfe) +
        ' where numdoc=' + QuotedStr(fr_nfe_complementar.Prnumdoc.Text));

    dao.cn.Commit;

    fr_nfe_complementar.XMLNFe.Active := false;
    fr_nfe_complementar.PrChave_NFe.Text := ChaveNfe;
  except
    dao.cn.Rollback;
    Exit;
  end;
end;

procedure TNFePedido.TransfereNfeFTP;
var
  destino: string;
begin
  cont := 8;
  Synchronize(Mostra);

  destino := Copy(ExtractFileName(arquivo_nfe), 1,
    Length(ExtractFileName(arquivo_nfe)) - Length(ExtractFileExt(arquivo_nfe))
    ) + '.xml';

  dm.FTPNFe.Connect;

  if dm.FTPNFe.Connected then
  begin
    // transfere um arquivo texto
    dm.FTPNFe.TransferType := ftASCII;
    dm.FTPNFe.Put(arquivo_nfe, destino);
    destino := Copy(ExtractFileName(arquivo_procnfe), 1,
      Length(ExtractFileName(arquivo_procnfe)) -
      Length(ExtractFileExt(arquivo_procnfe))) + '.xml';
    dm.FTPNFe.Put(arquivo_procnfe, destino);
    // desconecta
    dm.FTPNFe.Quit;
    DeleteFile(arquivo_nfe);
    DeleteFile(arquivo_procnfe);
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
    reciboLst.Add(UTF8Encode(fr_nfe_complementar.ACBrNFe1.WebServices.
      Retorno.retWS));
    reciboLst.SaveToFile(pathSaida + 'ReciboLote.xml');
    reciboLst.free;
  end;

begin
  cont := 6;
  pathSaida := ExtractFilePath(Application.ExeName) + 'nf\';
  Synchronize(Mostra);
  try
    fr_nfe_complementar.ACBrNFe1.Enviar(1, false);
    GeraArqRec;
  except
    on e: Exception do
    begin
      erro := true;
      msgerros := UTF8Encode(e.Message);
      GeraArqRec;
    end;
  end;
end;

function TNFePedido.GerarXMLProcNFe: boolean;
var
  NomeArquivo, gPathNFe: string;
  prot, status: WideString;
  ped_xml: TStringList;
begin
  try
    gPathNFe := ExtractFilePath(Application.ExeName) + '\nf\';
    fr_nfe_complementar.ACBrNFe1.Consultar;
    prot := fr_nfe_complementar.ACBrNFe1.WebServices.Consulta.Protocolo;
    if prot = '' then
    begin
      Result := false;
      Exit;
    end;
    NomeArquivo := gPathNFe + ChaveNfe + '-procNfe.xml';
    arquivo_procnfe := NomeArquivo;

    fr_nfe_complementar.ACBrNFe1.NotasFiscais.Items[0].NomeArq := NomeArquivo;
    fr_nfe_complementar.ACBrNFe1.NotasFiscais.GravarXML(arquivo_procnfe);

   try
      if not(dao.cn.InTransaction) then
        dao.cn.StartTransaction;

      ped_xml := TStringList.Create;
      ped_xml.LoadFromFile(NomeArquivo);

      if tipo = 0 then
      begin

        fr_nfe_complementar.qrGravaXml.close;
        fr_nfe_complementar.qrGravaXml.ParamByName('arquivo').AsString := ped_xml.Text;
        fr_nfe_complementar.qrGravaXml.ParamByName('numdoc').AsString := fr_nfe_complementar.Prnumdoc.Text;

        fr_nfe_complementar.qrGravaXml.Open;
      end
      else
      begin
        fr_nfe_complementar.qrGravaXmlDev.close;
        fr_nfe_complementar.qrGravaXmlDev.ParamByName('arquivo').AsString := ped_xml.Text;
        fr_nfe_complementar.qrGravaXmlDev.ParamByName('numdoc').AsString := fr_nfe_complementar.Prnumdoc.Text;

        fr_nfe_complementar.qrGravaXmlDev.Open;

      end;

      dao.cn.Commit;
    except
      dao.cn.Rollback;
      Exit;
    end;
    ped_xml.Free;
    Result := true;
  except
    Result := false;
  end;
end;

procedure TNFePedido.GravarReciboNfe;
var
  strVersaoDados, strCabecXML, strDados, status, motivo, Protocolo, digest,
    dataStr: string;
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
    dataarr := FMFUN.explode(dataStr, '-');
    dataStr := dataarr[2] + '/' + dataarr[1] + '/' + dataarr[0];
    dataarr.free;
    data := strtodatetime(dataStr + ' ' + horastr);
  end;

  procedure CarregaStatusLote;
  var
    arquivoNFe: string;
  begin
    fr_nfe_complementar.ACBrNFe1.WebServices.recibo.recibo := recibo;
    if fr_nfe_complementar.ACBrNFe1.WebServices.recibo.Executar then
      GerarXMLProcNFe;
  end;

  procedure ConsultaStatusLote(ChaveNfe: string);
  var
    xmlRecibo: IXMLNode;
    SxmlRecibo: TStringList;
  begin
    SxmlRecibo := TStringList.Create;
    SxmlRecibo.LoadFromFile(pathSaida + 'ReciboLote.xml');
    SxmlRecibo.Text := StringReplace(SxmlRecibo.Text, 'ç', 'c', [rfReplaceAll]);
    SxmlRecibo.SaveToFile(pathSaida + 'ReciboLote.xml');
    arquivo_ReciboNFe := pathSaida + 'ReciboLote.xml';
    fr_nfe_complementar.XMLNFe.LoadFromFile(pathSaida + 'ReciboLote.xml');

    if Assigned(fr_nfe_complementar.XMLNFe.DocumentElement.ChildNodes.FindNode
      ('protNFe')) then
    begin
      xmlRecibo := fr_nfe_complementar.XMLNFe.DocumentElement.ChildNodes.
        FindNode('protNFe');
      xmlRecibo.ChildNodes.First;

      status := '';
      motivo := '';
      Protocolo := '';
      digest := '';
      dataStr := '';

      while not(xmlRecibo = nil) do
      begin
        if ChaveNfe = xmlRecibo.ChildNodes.FindNode('infProt')
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
            erro := true;
            msgerros := motivo;
          end;
          digest := xmlRecibo.ChildNodes.FindNode('infProt')
            .ChildNodes.FindNode('digVal').Text;
          dataStr := xmlRecibo.ChildNodes.FindNode('infProt')
            .ChildNodes.FindNode('dhRecbto').Text;
          SetaData;
        end;
        xmlRecibo := xmlRecibo.NextSibling;
      end;
      // fm_nfe_envio_lotefr_nfe_complementar.XMLNFe.Active := false;
    end;
  end;

  procedure ConsultaStatusNFe(ChaveNfe: string);
  begin
    fr_nfe_complementar.ACBrNFe1.WebServices.Consulta.NFeChave := ChaveNfe;
    if not fr_nfe_complementar.ACBrNFe1.WebServices.Consulta.Executar then
    begin
      erro := true;
      msgerros := UTF8Encode(fr_nfe_complementar.ACBrNFe1.WebServices.
        Consulta.XMotivo);
    end
    else
    begin
      reciboLst := TStringList.Create;
      reciboLst.Add(UTF8Encode(fr_nfe_complementar.ACBrNFe1.WebServices.
        Consulta.retWS));
      reciboLst.SaveToFile(pathSaida + 'Recibo.xml');
      arquivo_ReciboNFe := pathSaida + 'Recibo.xml';
      reciboLst.free;

      // fr_nfe_complementar.XMLNFe.Active := true;
      fr_nfe_complementar.XMLNFe.LoadFromFile(pathSaida + 'Recibo.xml');

      if Assigned(fr_nfe_complementar.XMLNFe.DocumentElement.ChildNodes.FindNode
        ('chNFe')) then
      begin
        status := '';
        motivo := '';
        Protocolo := '';
        digest := '';
        dataStr := '';

        if ChaveNfe = fr_nfe_complementar.XMLNFe.DocumentElement.ChildNodes.
          FindNode('chNFe').Text then
        begin
          status := fr_nfe_complementar.XMLNFe.DocumentElement.ChildNodes.
            FindNode('cStat').Text;
          motivo := fr_nfe_complementar.XMLNFe.DocumentElement.ChildNodes.
            FindNode('xMotivo').Text;
          if status = '100' then
          begin
            Protocolo := fr_nfe_complementar.XMLNFe.DocumentElement.ChildNodes.
              FindNode('protNFe').ChildNodes.FindNode('infProt')
              .ChildNodes.FindNode('nProt').Text;
            digest := fr_nfe_complementar.XMLNFe.DocumentElement.ChildNodes.
              FindNode('protNFe').ChildNodes.FindNode('infProt')
              .ChildNodes.FindNode('digVal').Text;
            dataStr := fr_nfe_complementar.XMLNFe.DocumentElement.ChildNodes.
              FindNode('protNFe').ChildNodes.FindNode('infProt')
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
  end;

{ procedure ImprimirDanfe(chave, protocolo: string; data: TDateTime);
  var
  arquivoNFe, arquivoPDF, pathSaida: string;
  begin
  pathSaida := ExtractFilePath(Application.ExeName) + 'nf\';
  arquivoNFe := chave + '-nfe.xml';
  fr_nfe_complementar.ACBrNFe1.NotasFiscais.Clear;
  //    fr_nfe_complementar.ACBrNFe1.DANFE.Impressora := fmfun.BuscaImpressoraPadrao;
  fr_nfe_complementar.ACBrNFe1.NotasFiscais.LoadFromFile(pathSaida + arquivoNFe);
  fr_nfe_complementar.ACBrNFe1.DANFE.ProtocoloNFe := protocolo + ' ' + formatdatetime('dd/mm/yyyy hh:mm:ss', data);
  fr_nfe_complementar.ACBrNFe1.DANFE.ImprimirDANFE();
  end;
}

  function AtualizaStatusNFe: boolean;
  var
    sqlNFe, Faturado: string;
  begin
    CarregaStatusLote;
    ConsultaStatusNFe(ChaveNfe);
    // if erro then exit;
    if status <> '100' then
    begin
      ConsultaStatusLote(ChaveNfe);
      if status <> '100' then
        Faturado := '0'
      else
      begin
        if ((fr_nfe_complementar.Prcod_fiscal.Text = '5102') or
          (fr_nfe_complementar.Prcod_fiscal.Text = '6102') or
          (fr_nfe_complementar.Prcod_fiscal.Text = '5405') or
          (fr_nfe_complementar.Prcod_fiscal.Text = '6403')) then
          Faturado := '1'
        else
          Faturado := '3';
      end
    end
    else
    begin
      if ((fr_nfe_complementar.Prcod_fiscal.Text = '5102') or
        (fr_nfe_complementar.Prcod_fiscal.Text = '6102') or
        (fr_nfe_complementar.Prcod_fiscal.Text = '5405') or
        (fr_nfe_complementar.Prcod_fiscal.Text = '6403')) then
        Faturado := '1'
      else
        Faturado := '3';
    end;

    if tipo = 0 then
    begin
      sqlNFe := 'update vendas1 set ' + '  RECIBO_NFE =' + QuotedStr(recibo) +
        ', STATUS_NFE = ' + status + ', MOTIVO_NFE = ' + QuotedStr(motivo);
      if digest <> 'null' then
        sqlNFe := sqlNFe + ' , DIGEST_NFE = ' + QuotedStr(digest);
      if Protocolo <> 'null' then
        sqlNFe := sqlNFe + ' , PROTOCOLO_NFE = ' + QuotedStr(Protocolo);
      sqlNFe := sqlNFe + ', DATA_REC_NFE = ' +
        QuotedStr(formatdatetime('dd/mm/yyyy hh:mm:ss', data)) +
        ', EMAIL_NFE = 0 ' + ', FATURADO     = ' + Faturado +
        ' where numdoc =' + fr_nfe_complementar.Prnumdoc.Text;
    end;

    if tipo = 1 then
    begin
      sqlNFe := 'update vendas1 set ' + '  RECIBO_NFE_DEV =' + QuotedStr(recibo) +
        ', STATUS_NFE = ' + status + ', MOTIVO_NFE_DEV = ' + QuotedStr(motivo);
      if digest <> 'null' then
        sqlNFe := sqlNFe + ' , DIGEST_NFE_DEV = ' + QuotedStr(digest);
      if Protocolo <> 'null' then
        sqlNFe := sqlNFe + ' , PROTOCOLO_NFE_DEV = ' + QuotedStr(Protocolo);
      sqlNFe := sqlNFe + ', DATA_REC_NFE_DEV = ' +
        QuotedStr(formatdatetime('dd/mm/yyyy hh:mm:ss', data)) +
        ' where numdoc =' + fr_nfe_complementar.Prnumdoc.Text;
    end;



    try
      if not(dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      dao.Execsql(sqlNFe);
      dao.cn.Commit;
    except
      dao.cn.Rollback;
    end;

    dao.Geral4('SELECT COD_PRODUTO, QTD FROM VENDAS2 WHERE NUMDOC = ' +
      fr_nfe_complementar.Prnumdoc.Text);
    dao.Q4.First;


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

  fr_nfe_complementar.XMLNFe.Active := true;
  fr_nfe_complementar.XMLNFe.LoadFromFile(pathSaida + 'ReciboLote.xml');
  recibo := fr_nfe_complementar.XMLNFe.DocumentElement.ChildNodes.FindNode
    ('nRec').Text;
  fr_nfe_complementar.XMLNFe.Active := false;
  // DeleteFile(pathSaida + 'ReciboLote.xml');
  AtualizaStatusNFe;
end;

constructor TNFeCancel.Create(ChaveNfe, Justificativa, Protocolo: string);
begin
  inherited Create(true);
  { Chama o contrutor herdado. Ele irá temporariamente colocar o thread em estado de espera para depois executá-lo. }
  FreeOnTerminate := true; // Libera o objeto após terminar.
  Priority := TpLower;
  { Configura sua prioridade na lista de processos do Sistema operacional. }
  cChaveNfe := ChaveNfe;
  cJustificativa := Justificativa;
  cProtocoloNFe := Protocolo;
  pathSaida := ExtractFilePath(Application.ExeName) + 'nf\';
  Resume; // Inicia o Thread.
end;

procedure TNFeCancel.Execute;
var
  reciboLst: TStringList;
begin
  try
    CoInitialize(nil);

    cont := 1;
    fr_nfe_complementar.ACBrNFe1.ssl.SelecionarCertificado;
    Synchronize(Mostra);

    frpri.DesabilitaTimers;

    fr_nfe_complementar.ACBrNFe1.Configuracoes.WebServices.Ambiente :=
      FMFUN.BuscaAmbienteNFE;

    cont := 2;
    Synchronize(Mostra);
    MontarEvento;

    if not erro then
      GravarReciboNfe;
    if not erro then
    begin
      finalizado := true;
      Synchronize(Mostra);
    end
    else
      Synchronize(Mostra);

    LimparArquivos;
    Fr_nfe_transmissao.BtnOK.Enabled := true;
  finally
    CoUnInitialize;
  end;
end;

procedure TNFeCancel.Mostra;
begin
  case cont of
    1:
      begin
        Fr_nfe_transmissao.sCheckBox1.Checked := true;
      end;
    2:
      begin
        Fr_nfe_transmissao.sCheckBox2.Checked := true;
      end;
    3:
      begin
        Fr_nfe_transmissao.sCheckBox3.Checked := true;
      end;
    4:
      begin
        Fr_nfe_transmissao.sCheckBox4.Checked := true;
      end;
    5:
      begin
        Fr_nfe_transmissao.sCheckBox5.Checked := true;
      end;
    6:
      begin
        Fr_nfe_transmissao.sCheckBox6.Checked := true;
      end;
    7:
      begin
        Fr_nfe_transmissao.sCheckBox7.Checked := true;
      end;
    8:
      begin
        Fr_nfe_transmissao.sCheckBox8.Checked := true;
      end;
    9:
      begin
        Fr_nfe_transmissao.sCheckBox9.Checked := true;
      end;
    10:
      begin
        Fr_nfe_transmissao.sCheckBox10.Checked := true;
      end;
  end;

  Fr_nfe_transmissao.Gauge1.Progress := cont;

  if erro then
  begin
    Fr_nfe_transmissao.Gauge1.Visible := false;
    Fr_nfe_transmissao.lbResultado.Visible := true;
    Fr_nfe_transmissao.MsgErro.Visible := true;
    Fr_nfe_transmissao.MsgErro.Text := msgerros;
    Fr_nfe_transmissao.MsgErro.Height := Fr_nfe_transmissao.Panel1.Height -
      Fr_nfe_transmissao.MsgErro.Top;
    Fr_nfe_transmissao.lbResultado.Caption := 'Houve erro no processo.';
    Fr_nfe_transmissao.BtnOK.modalresult := MRCANCEL;
    frpri.HabilitaTimers;
  end;

  if finalizado then
  begin
    Fr_nfe_transmissao.Gauge1.Visible := false;
    Fr_nfe_transmissao.lbResultado.Visible := true;
    Fr_nfe_transmissao.lbResultado.Caption := 'Processo realizado com sucesso.';
    frpri.HabilitaTimers;
  end;

  Fr_nfe_transmissao.update;
  Sleep(2000);
end;

procedure TNFeCancel.LimparArquivos;
var
  F: TSearchRec;
  Ret: integer;
  TempNome: string;
begin
  Ret := FindFirst(pathSaida + '*.xml', faAnyFile, F);
  try
    while Ret = 0 do
    begin
      DeleteFile(pathSaida + F.Name);
      Ret := FindNext(F);
    end;
  finally
    begin
      FindClose(F);
    end;
  end;
end;

procedure TNFeCancel.MontarEvento;
var
  arquivoNFe, pathSaida, Protocolo: string;
  NumeroLote: integer;
begin
  arquivoNFe := cChaveNfe + '-procNFe.xml';
  pathSaida := ExtractFilePath(Application.ExeName) + 'nf\';

  if not FilesExists(pathSaida + arquivoNFe) then
  begin
    try
      dm.FTPNFe.Connect;
      if dm.FTPNFe.Connected then
      begin
        // transfere um arquivo texto
        dm.FTPNFe.TransferType := ftASCII;
        // arquivoNFe := PrChave_NFe.text + '-nfe.xml';
        dm.FTPNFe.get(arquivoNFe, pathSaida + arquivoNFe);
        dm.FTPNFe.Quit;
      end;
    except
      dm.FTPNFe.Quit;
      showmessage('Erro ao carregar Arquivo no FTP...');
      DeleteFile(pathSaida + arquivoNFe);
      Exit;
    end;
  end;

  fr_nfe_complementar.ACBrNFe1.NotasFiscais.Clear;
  // numero do lote de envio (somente um exemplo, pode-se utilizar seu proprio controle)
  NumeroLote := strtoint(formatdatetime('yymmddhhmm', now));

  // carregar o xml da nota fiscal eletronica, pode ser omitido
  fr_nfe_complementar.ACBrNFe1.NotasFiscais.Clear;
  if not fr_nfe_complementar.ACBrNFe1.NotasFiscais.LoadFromFile
    (pathSaida + arquivoNFe) then
    raise Exception.Create
      ('Não foi possível carregar o XML da Nota Fiscal Eletrônica correspondente!');

  // Criar o cancelamento
  fr_nfe_complementar.ACBrNFe1.EventoNFe.Evento.Clear;
  fr_nfe_complementar.ACBrNFe1.EventoNFe.idLote := NumeroLote;

  dao.Geral2('SELECT a.CNPJ FROM EMPRESA a WHERE cod_empresa=' +
    QuotedStr(fr_nfe_complementar.Prempresa_faturar.Text));
  with fr_nfe_complementar.ACBrNFe1.EventoNFe.Evento.Add do
  begin
    infEvento.chNFe := cChaveNfe;
    infEvento.CNPJ := frpri.LimpaCNPJ(dao.q2.fieldbyname('CNPJ').AsString);
    infEvento.cOrgao := fr_nfe_complementar.ACBrNFe1.NotasFiscais.Items[0]
      .NFe.ide.cUF;
    fr_nfe_complementar.ACBrNFe1.Configuracoes.WebServices.UF :=
      fr_nfe_complementar.UF_Emissor;
    infEvento.dhEvento := now;
    infEvento.tpEvento := teCancelamento;
    infEvento.detEvento.nProt := cProtocoloNFe;
    infEvento.detEvento.xJust := cJustificativa;
  end;

  fr_nfe_complementar.ACBrNFe1.Configuracoes.WebServices.Ambiente :=
    FMFUN.BuscaAmbienteNFE;

  // Enviar o evento de cancelamento
  if fr_nfe_complementar.ACBrNFe1.EnviarEvento(NumeroLote) then
  begin
    with fr_nfe_complementar.ACBrNFe1.WebServices.EnvEvento do
    begin
      if EventoRetorno.retEvento.Items[0].RetInfEvento.cStat <> 135 then
      begin
        erro := true;
        msgerros := EventoRetorno.retEvento.Items[0].RetInfEvento.XMotivo;
        Exit;
      end;

      // retornos
      DataHoraEvento := EventoRetorno.retEvento.Items[0]
        .RetInfEvento.dhRegEvento;
      NumeroProtocolo := EventoRetorno.retEvento.Items[0].RetInfEvento.nProt;
      XMLCancelamento := EventoRetorno.retEvento.Items[0].RetInfEvento.XML;
      CodigoStatus := EventoRetorno.retEvento.Items[0].RetInfEvento.cStat;
      MotivoStatus := EventoRetorno.retEvento.Items[0].RetInfEvento.XMotivo;

    end;
  end
  else
  begin
    with fr_nfe_complementar.ACBrNFe1.WebServices.EnvEvento do
    begin
      raise Exception.Create('Ocorreram erros ao tentar efetuar o cancelamento:'
        + sLineBreak + 'Lote: ' + inttostr(EventoRetorno.idLote) + sLineBreak +
        'Ambiente: ' + TpAmbToStr(EventoRetorno.tpAmb) + sLineBreak + 'Orgao: '
        + inttostr(EventoRetorno.cOrgao) + sLineBreak + sLineBreak + 'Status: '
        + inttostr(EventoRetorno.cStat) + sLineBreak + 'Motivo: ' +
        EventoRetorno.XMotivo);
    end;
  end;
end;

procedure TNFeCancel.GravarReciboNfe;
var
  cTransmissaoXML: _TransmissaoXML;
  strVersaoDados, strCabecXML, strDados, status, motivo, Protocolo, digest,
    dataStr: string;
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
    dataarr := FMFUN.explode(dataStr, '-');
    dataStr := dataarr[2] + '/' + dataarr[1] + '/' + dataarr[0];
    dataarr.free;
    data := strtodatetime(dataStr + ' ' + horastr);
  end;

  procedure ConsultaStatusNFe(ChaveNfe: string);
  begin
    fr_nfe_complementar.XMLNFe.Active := true;
    fr_nfe_complementar.XMLNFe.LoadFromFile(pathSaida + 'ReciboLote.xml');

    status := fr_nfe_complementar.XMLNFe.DocumentElement.ChildNodes.FindNode
      ('infCanc').ChildNodes.FindNode('cStat').Text;
    motivo := fr_nfe_complementar.XMLNFe.DocumentElement.ChildNodes.FindNode
      ('infCanc').ChildNodes.FindNode('xMotivo').Text;
    Protocolo := fr_nfe_complementar.XMLNFe.DocumentElement.ChildNodes.FindNode
      ('infCanc').ChildNodes.FindNode('nProt').Text;
    dataStr := fr_nfe_complementar.XMLNFe.DocumentElement.ChildNodes.FindNode
      ('infCanc').ChildNodes.FindNode('dhRecbto').Text;

    SetaData;

    fr_nfe_complementar.XMLNFe.Active := false;
  end;

  function AtualizaStatusNFe: boolean;
  begin
    ConsultaStatusNFe(fr_nfe_complementar.PrChave_NFe.Text);
    try
      if not(dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      dao.Execsql('update vendas1 set ' + '  STATUS_NFE = ' + status +
        ', FATURADO   = 2 ' + ', MOTIVO_NFE = ' + QuotedStr(motivo) +
        ', PROTOCOLO_NFE = ' + QuotedStr(Protocolo) + ', DATA_REC_NFE = ' +
        QuotedStr(formatdatetime('dd/mm/yyyy hh:mm:ss', data)) +
        ' where numdoc =' + fr_nfe_complementar.Prnumdoc.Text);

      dao.Execsql('delete from cr1 where nr_documento=' +
        QuotedStr(fr_nfe_complementar.Prnumdoc.Text));
      dao.cn.Commit;
    except
      dao.cn.Rollback;
    end;

  end;

begin
  cont := 3;
  Synchronize(Mostra);

  AtualizaStatusNFe;
end;

procedure Tfr_nfe_complementar.PrNumdoc_RefExit(Sender: TObject);
begin
  if (trim(PrNumdoc_Ref.Text) = '') and (trim(PrNF.Text) = '') then
  begin
    edNfe_Ref.Clear;
    ed_Chave_nfe_ref.Clear;
    Prcod_cliente.Clear;
    Prcod_fornecedor.Clear;
    Prcod_fiscal.Clear;
    Prempresa_faturar.Clear;

    PrCod_clienteExit(self);
    PrCod_fornecedorExit(self);
    PrCod_FiscalExit(self);
    Prempresa_faturarExit(self);
    Prcod_transportadoraExit(self);
  end;
  if PrNumdoc_Ref.Text <> '' then
  begin
    dao.Geral2('select v1.* from vendas1 v1 where v1.numdoc = ' +
      PrNumdoc_Ref.Text);

    if dao.q2.RecordCount > 0 then
    begin
      edNfe_Ref.Text := dao.q2.fieldbyname('nfe').AsString;
      ed_Chave_nfe_ref.Text := dao.q2.fieldbyname('chave_nfe').AsString;
      Prcod_cliente.Text := dao.q2.fieldbyname('cod_cliente').AsString;
      Prcod_fornecedor.Text := dao.q2.fieldbyname('cod_fornecedor').AsString;
      Prcod_fiscal.Text := dao.q2.fieldbyname('cod_fiscal').AsString;
      Prempresa_faturar.Text := dao.q2.fieldbyname('empresa_faturar').AsString;
      PrCod_Fop.Text := dao.q2.fieldbyname('empresa_faturar').AsString;

      PrCod_clienteExit(self);
      PrCod_fornecedorExit(self);
      PrCod_FiscalExit(self);
      Prempresa_faturarExit(self);
      Prcod_transportadoraExit(self);
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      PrNumdoc_Ref.Clear;
      PrNumdoc_Ref.SetFocus;
      Exit;
    end;
  end;

end;

procedure Tfr_nfe_complementar.BtnDanfeClick(Sender: TObject);
var
  arquivoNFe, pathSaida, Protocolo: string;
begin
  arquivoNFe := PrChave_NFe.Text + '-procNFe.xml';
  pathSaida := ExtractFilePath(Application.ExeName) + 'nf\';

  q_xml.close;
  q_xml.ParamByName('numdoc').AsInteger := strtoint(Prnumdoc.Text);
  q_xml.Open;

  if not q_xmlXML.IsNull then
    q_xmlXML.SaveToFile(pathSaida + arquivoNFe);

  ACBrNFe1.NotasFiscais.Clear;
  ACBrNFe1.NotasFiscais.LoadFromFile(pathSaida + arquivoNFe);

  ACBrNFe1.DANFE.Logo := ExtractFilePath(Application.ExeName) + 'logo.bmp';
  ACBrNFeDANFEFR1.fastfile := ExtractFilePath(Application.ExeName) + 'Relatorios\Danfe.fr3';
  ACBrNFe1.NotasFiscais.Imprimir;

  DeleteFile(pathSaida + arquivoNFe);
end;

procedure Tfr_nfe_complementar.BtnDanfeEntClick(Sender: TObject);
var
  arquivoNFe, pathSaida, Protocolo: string;
begin
  arquivoNFe := PrCHAVE_NFE_DEV.Text + '-procNFe.xml';
  pathSaida := ExtractFilePath(Application.ExeName) + 'nf\';

  q_xml.close;
  q_xml.ParamByName('numdoc').AsString := Prnumdoc.Text;
  q_xml.Open;

  if not q_xmlXML_DEV.IsNull then
    q_xmlXML_DEV.SaveToFile(pathSaida + arquivoNFe);

  ACBrNFe1.NotasFiscais.Clear;
  ACBrNFe1.NotasFiscais.LoadFromFile(pathSaida + arquivoNFe);

  ACBrNFe1.DANFE.Logo := ExtractFilePath(Application.ExeName) + 'logo.bmp';
  ACBrNFeDANFEFR1.fastfile := ExtractFilePath(Application.ExeName) + 'Relatorios\Danfe.fr3';
  ACBrNFe1.NotasFiscais.Imprimir;

  DeleteFile(pathSaida + arquivoNFe);
end;

procedure Tfr_nfe_complementar.Prcod_transportadoraExit(Sender: TObject);
begin
  if trim(Prcod_transportadora.Text) = '' then
    LbNom_transportadora.Caption := '...';

  if Prcod_transportadora.Text <> '' then
  begin
    dao.Geral2('select nome from transportadora where cod_transportadora=' +
      QuotedStr(Prcod_transportadora.Text));
    if dao.q2.RecordCount > 0 then
    begin
      LbNom_transportadora.Caption := dao.q2.fieldbyname('nome').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_transportadora.Text := '';
      Prcod_transportadora.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfr_nfe_complementar.BtnEditarCancelamentoNFeClick(Sender: TObject);
begin
  prJUSTIF_CANC_NFE.ReadOnly := false;
  prJUSTIF_CANC_NFE.SetFocus;
end;

procedure Tfr_nfe_complementar.BtnEnviarCancelamentoNFeClick(Sender: TObject);
var
  CancelNFe: TNFeCancel;
begin
  if trim(prJUSTIF_CANC_NFE.Text) = '' then
  begin
    dao.msg('Para o Cancelamento da NF-e, é necessário informar a justificativa!');
    Exit;
  end;

  Application.CreateForm(TFr_nfe_transmissao, Fr_nfe_transmissao);
  CancelNFe := TNFeCancel.Create(PrChave_NFe.Text,
    FMFUN.AnsiToAscii(prJUSTIF_CANC_NFE.Text), PrPROTOCOLO_NFE.Text);
  Fr_nfe_transmissao.lbResultado.Caption := 'Cancelamento da Nota Fiscal';

  Fr_nfe_transmissao.sCheckBox1.Visible := true;
  Fr_nfe_transmissao.sCheckBox1.Caption := 'Buscar Certificado.';

  Fr_nfe_transmissao.sCheckBox2.Visible := true;
  Fr_nfe_transmissao.sCheckBox2.Caption :=
    'Enviando Solicitação de Cancelamento da NFe.';

  Fr_nfe_transmissao.sCheckBox3.Visible := true;
  Fr_nfe_transmissao.sCheckBox3.Caption :=
    'Consultando Recibo de Cancelamento da NFe.';

  Fr_nfe_transmissao.Gauge1.MaxValue := 3;
  Fr_nfe_transmissao.Height := Fr_nfe_transmissao.Height + (18 * 3);
  Fr_nfe_transmissao.Gauge1.Progress := 0;

  Fr_nfe_transmissao.ShowModal;

  if Fr_nfe_transmissao.modalresult = mrOk then
  begin
    ativa_vendas1(Prnumdoc.Text);
    mostra_campos('Pr')
  end;

end;

procedure Tfr_nfe_complementar.BtnSairCancelamentoNFeClick(Sender: TObject);
begin
  prJUSTIF_CANC_NFE.Clear;
  prJUSTIF_CANC_NFE.ReadOnly := true;
  BtnEnviarCancelamentoNFe.Enabled := false;
  BtnSairCancelamentoNFe.Enabled := false;
end;

procedure Tfr_nfe_complementar.prJUSTIF_CANC_NFEChange(Sender: TObject);
begin
  if Length(prJUSTIF_CANC_NFE.Text) >= 15 then
  begin
    BtnEnviarCancelamentoNFe.Enabled := true;
    BtnSairCancelamentoNFe.Enabled := true;
  end
  else
  begin
    BtnEnviarCancelamentoNFe.Enabled := false;
    BtnSairCancelamentoNFe.Enabled := false;
  end;
end;

procedure Tfr_nfe_complementar.BtnNotaClick(Sender: TObject);
begin
  if Btgraped.Enabled = true then
  begin
    dao.msg('O Pedido deve ser Gravado para poder Faturar!');
    Exit;
  end;

  if (PrNF.Text = '') then
  begin
    dao.msg('O CAMPO NOTA FISCAL DEVE SER PREENCHIDO!');
    PrNF.SetFocus;
    Exit;
  end;

  if Btgraped.Enabled = false then
  begin
    if not Faturado then
    begin
      if Prdta_emissao.Text = '  /  /    ' then
      begin;
        dao.msg('O Campo Data Emissão deve Ser Preenchida');
        Prdta_emissao.SetFocus;
        Exit;
      end;

      if Prdta_saida.Text = '  /  /    ' then
      begin;
        dao.msg('O Campo Data Saida deve Ser Preenchida');
        Prdta_saida.SetFocus;
        Exit;
      end;

      if Prempresa_faturar.Text = '  /  /    ' then
      begin;
        dao.msg('O Campo Empresa de Faturamento deve Ser Preenchida');
        Prempresa_faturar.SetFocus;
        Exit;
      end;

      if Faturado then
      begin
        dao.msg('PEDIDO JÁ FATURADO OU CANCELADO!');
        Exit;
      end;
      try
        if not(dao.cn.InTransaction) then
          (dao.cn.StartTransaction);
        { faturar(Prnumdoc.Text, Prcod_cliente.Text, Prcod_fop.Text, Prcod_prazo_pgto.Text, Prtot_liquido.Value, false); }

        if PrNF.Text <> '' then
          dao.Execsql('update vendas1 set nf=' + QuotedStr(PrNF.Text) +
            ' where numdoc=' + QuotedStr(Prnumdoc.Text));

        dao.cn.Commit;
        // ativa_cr1(Prnumdoc.Text);

        MontaNF(Prnumdoc.Text);
      except
        dao.cn.Rollback;
        Exit;
      end;
    end
    else
    begin
      dao.msg('PEDIDO JÁ FATURADO OU CANCELADO!');
      Exit;
    end;

  end; // end do 1º if
end;

procedure Tfr_nfe_complementar.MontaNF(n_pedido: string);
var
  MCOL, LH: integer;
  MNUMNOT: string;
  i, Y: integer;
  CTPAR: integer;
  MVLRPAR: real;
  MNEWVLR: real;
  MVLRDIF: real;
  MLETRA: integer;
  CTPGT: integer;
  MDIAVEN: integer;
  MNUMDUP: string;
  MQTDPRO: integer;
  MQTDNOT: real;
  MCTNOT: integer;
  MDIVCOM: real;
  MNUMPED, MCODTRA: integer;
  LINHA_ERRO: integer;
  ICMS: string;
begin
  if (Prcod_cliente.Text <> '') then
    dao.Geral1(sql_nota + ' where v1.numdoc=' + QuotedStr(n_pedido) +
      sql_grupo_nota)
  else
    dao.Geral1(sql_nota_dev + ' where v1.numdoc=' + QuotedStr(n_pedido) +
      sql_grupo_nota_dev);

  { dao.Geral2('select v2.*, p.nom_produto, p.unidade, p.qtd_embalagem, p.trib_icms from vendas2 v2 ' +
    'left join produto p on p.cod_produto=v2.cod_produto ' +
    'where numdoc= ' + QuotedStr(n_pedido));

    dao.Geral3('select * from cr1 where nr_documento=' + QuotedStr(n_pedido));
  }
  dao.Geral4('select icms from uf WHERE UF=' +
    QuotedStr(dao.q1.fieldbyname('uf').AsString));
  if dao.Q4.RecordCount > 0 then
    ICMS := dao.Q4.fieldbyname('ICMS').AsString;

  LINHA_ERRO := 1;
  if PrNF.Text = '' then
  begin
    showmessage('<ATENÇÃO> O NUMERO DA NOTA NÃO ESTÁ PREENCHIDO!<ATENÇÃO>');
    PrNF.SetFocus;
    Exit;
  end;

  dao.Geral4('select faturado from vendas1 where numdoc = ' +
    QuotedStr(n_pedido));
  if dao.Q4.fieldbyname('faturado').AsString = 'F' then
  begin
    showmessage('O PEDIDO JÁ FOI FATURADO');
    Exit;
  end;

  MNUMPED := dao.q1.fieldbyname('numdoc').AsInteger;
  MCODTRA := dao.q1.fieldbyname('cod_transportadora').AsInteger;

  MDIVCOM := 0;
  MNUMNOT := dao.q1.fieldbyname('nf').AsString;

  // **** começa a gerar o contas a pagar   ********

  LINHA_ERRO := LINHA_ERRO + 1;

  MQTDPRO := 1;
  // showmessage(floattostr(mqtdpro));
  MQTDNOT := MQTDPRO / 22;
  if MQTDNOT <= 1 then
    MCTNOT := 1
  else
    MCTNOT := 2;

  // ***** IMPRESSÃO DA NOTA  ********

  RDIMPNOT.Abrir;

  // *****************CORPO DA NOTA****************************
  for i := 1 to MCTNOT do
  begin
    if i = 2 then
      RDIMPNOT.Novapagina;

    // if i = 1 then dao.q2.First;
    LH := 35;
    // while not (dao.Q2.eof) do
    // begin
    (* if i = 2 then
      begin
      //      for Y := 1 to 22 do
      //        if dao.Q2.Eof then break;
      RDIMPNOT.impf(lh, 01, '999', [comp17]);
      RDIMPNOT.impf(lh, 09, 'COMPLEMENTO DE IMPOSTO/PRECO', [comp17]);
      //      if dao.Q2.Fieldbyname('trib_icms').AsString = '0' then
      RDIMPNOT.impf(lh, 50, '00', [comp17]);
      {      else
      if dao.Q2.Fieldbyname('trib_icms').AsString = '1' then
      RDIMPNOT.impf(lh, 50, '10', [comp17])
      else
      if dao.Q2.Fieldbyname('trib_icms').AsString = '2' then
      RDIMPNOT.impf(lh, 50, '20', [comp17])
      else
      if dao.Q2.Fieldbyname('trib_icms').AsString = '3' then
      RDIMPNOT.impf(lh, 50, '30', [comp17])
      else
      if dao.Q2.Fieldbyname('trib_icms').AsString = '4' then
      RDIMPNOT.impf(lh, 50, '40', [comp17])
      else
      if dao.Q2.Fieldbyname('trib_icms').AsString = '5' then
      RDIMPNOT.impf(lh, 50, '41', [comp17])
      else
      if dao.Q2.Fieldbyname('trib_icms').AsString = '6' then
      RDIMPNOT.impf(lh, 50, '50', [comp17])
      else
      if dao.Q2.Fieldbyname('trib_icms').AsString = '7' then
      RDIMPNOT.impf(lh, 50, '51', [comp17])
      else
      if dao.Q2.Fieldbyname('trib_icms').AsString = '8' then
      RDIMPNOT.impf(lh, 50, '60', [comp17])
      else
      if dao.Q2.Fieldbyname('trib_icms').AsString = '9' then
      RDIMPNOT.impf(lh, 50, '70', [comp17])
      else
      if dao.Q2.Fieldbyname('trib_icms').AsString = '10' then
      RDIMPNOT.impf(lh, 50, '90', [comp17]);}

      RDIMPNOT.impf(lh, 65, 'UN', [comp17]); //+DMVEN.QUNOTPED2.Fieldbyname('divvol').AsString,[comp17])
      //          else
      //             RDIMPNOT.impf(lh,65,dao.Q2.Fieldbyname('unidade').AsString,[comp17]);

      {      RDIMPNOT.impd(lh, 68, dao.Q2.Fieldbyname('qtd').AsString, [comp17]);
      RDIMPNOT.impval(lh, 70, '###,##0.0000', dao.Q2.Fieldbyname('preco').AsFloat, [comp17]);
      RDIMPNOT.impVAL(lh, 94, '###,##0.00', dao.Q2.Fieldbyname('sub_total').AsFloat, [comp17]);}
      //26/09/07            if DMVEN.QUNOTPED1.Fieldbyname('PERICM').AsFloat<> null then
      //      if dao.Q2.Fieldbyname('trib_icms').AsString <> '8' then
      RDIMPNOT.impVAL(lh, 108, '###,##0.00', StrToFloat(icms), [comp17]);

      lh := lh + 1;
      //  dao.Q2.Next;
      //end;
    *)
    RDIMPNOT.impf(LH, 01, '999', [comp17]);
    RDIMPNOT.impf(LH, 10, 'COMPLEMENTO DE IMPOSTO/PRECO', [comp17]);

    // if (DMVEN.QUNOTPED2.Fieldbyname('NOMMEDIDA').AsString<>null) and (DMVEN.QUNOTPED2.Fieldbyname('divvol').value<>null)then
    RDIMPNOT.impf(LH, 67, 'UN', [comp17]);
    // +DMVEN.QUNOTPED2.Fieldbyname('divvol').AsString,[comp17])
    // else
    // RDIMPNOT.impf(lh,64,DMVEN.QUNOTPED2.Fieldbyname('NOMMEDIDA').AsString,[comp17]);
    { RDIMPNOT.impd(lh, 80, dao.Q2.Fieldbyname('QTD').AsString, [comp17]);
      RDIMPNOT.impval(lh, 81, '###,##0.0000', dao.Q2.Fieldbyname('preco').AsFloat, [comp17]);
      RDIMPNOT.impVAL(lh, 94, '###,##0.00', dao.Q2.Fieldbyname('sub_total').AsFloat, [comp17]);
      //26/06/07        if DMVEN.QUNOTPED1.Fieldbyname('PERICM').AsFloat<> null then

      if dao.Q2.Fieldbyname('trib_icms').AsString <> '8' then }
    RDIMPNOT.impVAL(LH, 116, '#0', StrToFloat(ICMS), [comp17]);

    { RDIMPNOT.impVAL(lh, 119, '#0', dao.Q2.Fieldbyname('ipi_item').AsFloat, [comp17]);
      RDIMPNOT.impVAL(lh, 122, '###,##0.00', dao.Q2.Fieldbyname('vlr_ipi_item').AsFloat, [comp17]);
    }
    LH := LH + 1;
    // if dao.q2.eof then break;
    // dao.Q2.Next;
    break;
    if LH = 57 then
      break; // ERA 82

  end;

  // end;

  // **********************CÁLCULO DO IMPOSTO ***********************
  // BASE CÁLCULO ICMS
  // if DMVEN.QUNOTPED1.Fieldbyname('BASEICM').AsFloat <> null then

  if (Prvlr_bc_icms.Value > 0) then
    RDIMPNOT.impVAL(61, 01, '###,##0.00', Prvlr_bc_icms.Value, [comp17]);
  // VLR DO ICMS
  // if DMVEN.QUNOTPED1.Fieldbyname('VLRICM').AsFloat<> null then
  if (Prvlr_icms.Value > 0) then
    RDIMPNOT.impVAL(61, 24, '###,##0.00', Prvlr_icms.Value, [comp17]);
  // VALOR TOTAL DOS PRODUTOS

  { //BASE CÁLCULO ICMS SUBST.
    if (not dao.Q1.Fieldbyname('VLR_ICMS_ST').IsNull and dao.Q1.Fieldbyname('VLR_ICMS_ST').value > 0) then
    RDIMPNOT.impval(61, 60, '###,##0.00', dao.Q1.Fieldbyname('VLR_BC_ST').AsFloat, [comp17]);

    //VLR ICMS SUBST.
    if (not dao.Q1.Fieldbyname('VLR_ICMS_ST').IsNull and dao.Q1.Fieldbyname('VLR_ICMS_ST').value > 0) then
    RDIMPNOT.impval(61, 80, '###,##0.00', dao.Q1.Fieldbyname('VLR_ICMS_ST').AsFloat, [comp17]);
  }

  // RDIMPNOT.impval(61, 119, '###,##0.00', dao.Q1.Fieldbyname('tot_liquido').AsFloat, [comp17]);
  // VALOR TOTAL DA NOTA

  // VLR ICMS SUBST.
  // if (not dao.Q1.Fieldbyname('VLR_IPI').IsNull and dao.Q1.Fieldbyname('VLR_IPI').value > 0) then
  // RDIMPNOT.impval(64, 80, '###,##0.00', dao.Q1.Fieldbyname('VLR_IPI').AsFloat, [comp17]);

  // RDIMPNOT.impval(64, 119, '###,##0.00', (dao.Q1.Fieldbyname('tot_liquido').AsFloat + dao.Q1.Fieldbyname('VLR_IPI').AsFloat), [comp17]);

  // ****************TRANSPORTADORA*******************************
  // NOME /RAZÃO SOCIAL
  RDIMPNOT.impf(69, 01, dao.q1.fieldbyname('nom_transportadora').AsString,
    [comp17]);

  // frete por conta
  RDIMPNOT.impf(69, 78, '0', [comp17]);

  // placa do veiculo
  RDIMPNOT.impf(69, 82, dao.q1.fieldbyname('placa').AsString, [comp17]);

  // uf
  RDIMPNOT.impf(69, 100, dao.q1.fieldbyname('uf_transportadora').AsString,
    [comp17]);

  // cnpj transportadora
  RDIMPNOT.impf(69, 115, dao.q1.fieldbyname('cnpj_tra').AsString, [comp17]);

  // endereço
  RDIMPNOT.impf(71, 01, dao.q1.fieldbyname('end_tra').AsString, [comp17]);

  // municipio
  // DMVEN.TACID.FindKey([DMVEN.TAPE1CIDCLI.VALUE]);
  // RDIMPNOT.impf(73,67,DMVEN.QUNOTPED1.Fieldbyname('NOMCID1'.VALUE,[comp17]);

  // UF MUNICIPIO
  // RDIMPNOT.impf(73,100,DMVEN.QUNOTPED1 UFCID.VALUE,[comp17]);

  // INSCRIÇÃO ESTADUAL
  RDIMPNOT.impf(71, 115, dao.q1.fieldbyname('ie_tra').AsString, [comp17]);

  // VOLUME DO PEDIDO
  RDIMPNOT.impVAL(74, 01, '#0', dao.q1.fieldbyname('volume_nota').AsFloat,
    [comp17]);

  // ESPÉCIE
  RDIMPNOT.impf(74, 26, 'VOLUMES', [comp17]);

  // MARCA
  RDIMPNOT.impf(74, 50, 'X', [comp17]);

  // PESO BRUTO
  RDIMPNOT.impVAL(74, 95, '###,##0.000', dao.q1.fieldbyname('peso_nota')
    .AsFloat, [comp17]);

  // PESO LIQUIDO
  RDIMPNOT.impVAL(74, 118, '###,##0.000', dao.q1.fieldbyname('peso_nota')
    .AsFloat, [comp17]);

  // ********INFORMAÇÕES ADICIONAIS*************************
  if dao.q1.fieldbyname('observacoes_nota').AsString <> '' then
    RDIMPNOT.impf(82, 01, dao.q1.fieldbyname('observacoes_nota').AsString,
      [comp17]);
  // mensagem
  // RDIMPNOT.impF(77,01,'DOCUMENTO EMITIDO POR EPP OPTANTE PELO SIMPLES NACIONAL E NÃO ',[comp17]);
  // RDIMPNOT.impF(78,01,'GERA DIREITO A CRÉDITO FICSCAL DE ICMS E ISS',[comp17]);
  { RDIMPNOT.impF(79, 01, '-Nao aceitamos devolucao sem previa Consulta ao Nosso Dep.Vendas-', [comp17]);
    RDIMPNOT.impF(80, 01, '-Favor conferir a mercadoria no ato do recebimento nao-', [comp17]);
    RDIMPNOT.impF(81, 01, '-aceitaremos reclamacoes posteriores.-', [comp17]);
    // if (not dao.Q1.Fieldbyname('VLR_ICMS_ST').IsNull and dao.Q1.Fieldbyname('VLR_ICMS_ST').value > 0)  then
    RDIMPNOT.impF(82, 01, '-Imposto retido por Substituição Tributária - RIMCMS - SC/01 - Anexo 3.', [comp17]);

    if dao.q1.Fieldbyname('ie').IsNotNull then
    begin
    RDIMPNOT.impF(83, 01, '-BCST ' + FORMATFLOAT('###,##0.00', dao.Q1.Fieldbyname('VLR_BC_ST').AsFloat), [comp17]);
    RDIMPNOT.impF(84, 01, '-IST ' + FORMATFLOAT('###,##0.00', dao.Q1.Fieldbyname('VLR_ICMS_ST').AsFloat), [comp17]);
    end;
  }
  LINHA_ERRO := LINHA_ERRO + 1; // 3

  // *************RODAPÉ DA NOTA****************************

  // NOME CLIENTE
  RDIMPNOT.impf(86, 01, dao.q1.fieldbyname('nom_cliente').AsString, [comp17]);

  // VALOR TOTAL DA NOTA
  RDIMPNOT.impVAL(86, 52, '###,##0.00', dao.q1.fieldbyname('tot_liquido')
    .AsFloat, [comp17]);

  // NOME /RAZÃO SOCIAL
  RDIMPNOT.impf(86, 70, dao.q1.fieldbyname('nom_transportadora').AsString,
    [comp17]);

  // DTA SAIDA
  RDIMPNOT.impf(86, 100, datetostr(dao.q1.fieldbyname('dta_saida').AsDateTime),
    [comp17]);
  RDIMPNOT.Fechar;
  // ****** acabou a impressão da nota *******

end;

function Tfr_nfe_complementar.Faturado: boolean;
begin
  dao.Geral1('select faturado from vendas1 where numdoc=' +
    QuotedStr(Prnumdoc.Text));
  if dao.q1.fieldbyname('faturado').AsString = '1' then
    sbvendas.Panels[1].Text := '-FATURADO-VENDAS'
  else if dao.q1.fieldbyname('faturado').AsString = '2' then
    sbvendas.Panels[1].Text := '-CANCELADA-'
  else if dao.q1.fieldbyname('faturado').AsString = '3' then
    sbvendas.Panels[1].Text := '-FATURADO-DEVOLUÇÕES, REMESSAS E BONIFICAÇÕES-'
  else
    sbvendas.Panels[1].Text := '-NÃO FATURADO-';

  if dao.q1.fieldbyname('faturado').AsString <> '0' then
    Result := true
  else
    Result := false;
end;

procedure Tfr_nfe_complementar.PrNFExit(Sender: TObject);
begin
  if trim(PrNF.Text) <> '' then
  begin
    Prcod_cliente.Enabled := true;
    Prcod_fornecedor.Enabled := true;
    Prcod_fiscal.Enabled := true;
    Prempresa_faturar.Enabled := true;
    Prcod_transportadora.Enabled := true;
  end
  else
  begin
    Prcod_cliente.Enabled := false;
    Prcod_fornecedor.Enabled := false;
    Prcod_fiscal.Enabled := false;
    Prempresa_faturar.Enabled := false;
    Prcod_transportadora.Enabled := false;
  end
end;

procedure Tfr_nfe_complementar.Prcod_clienteButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Cliente';
  chamou_pesquisa := 'fr_cliente';
  chamou_form := 'fr_complemento_cliente';
  chamou_cadastro := 'Fr_cliente';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cliente';
  Fr_localizar.BT_cadastro.Visible := true;

  SetLength(Campos_combo, 6);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Razão Social';
  Campos_combo[2] := 'Nome Fantasia';
  Campos_combo[3] := 'CNPJ';
  Campos_combo[4] := 'CPF';
  Campos_combo[5] := 'Cidade';

  for i := 0 to 5 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(Campos_combo[i]);
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

procedure Tfr_nfe_complementar.Prcod_fornecedorButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Fornecedor';
  chamou_pesquisa := 'fr_fornecedor';
  chamou_form := 'fr_complemento_fornecedor';
  chamou_cadastro := 'Fr_fornecedor';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Fornecedores';
  Fr_localizar.BT_cadastro.Visible := true;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 5);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Razão Social';
  Campos_combo[2] := 'Fantasia';
  Campos_combo[3] := 'CNPJ';
  Campos_combo[4] := 'Cidade';

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

procedure Tfr_nfe_complementar.Prcod_fiscalButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Código Fiscal';
  chamou_pesquisa := 'fr_cod_fiscal';
  chamou_form := 'fr_complemento_cod_fiscal';
  chamou_cadastro := 'Fr_cod_fiscal';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Códigos Fiscais';
  Fr_localizar.BT_cadastro.Visible := false;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';

  for i := 0 to 1 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 0;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure Tfr_nfe_complementar.Prempresa_faturarButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Empresa';
  chamou_pesquisa := 'fr_empresa';
  chamou_form := 'fr_complemento_empresa';
  chamou_cadastro := 'Fr_empresa';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Empresa';
  Fr_localizar.BT_cadastro.Visible := false;

  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';

  for i := 0 to 1 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(Campos_combo[i]);
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

procedure Tfr_nfe_complementar.Prcod_transportadoraButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Transportadora';
  chamou_pesquisa := 'fr_transportadora';
  chamou_form := 'fr_complemento_transportadora';
  chamou_cadastro := 'Fr_transportadora';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Transportadoras';
  Fr_localizar.BT_cadastro.Visible := true;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';

  for i := 0 to 1 do
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

procedure Tfr_nfe_complementar.RDIMPNOTNewPage(Sender: TObject;
  Pagina: integer);
var
  MCOL, maccr1, mtotcr1: integer;
  mcodope: string;
begin
  // SAIDA DA NOTA
  RDIMPNOT.impC(05, 79, 'X', [comp17]);
  // natureza da operação
  { if DMVEN.QUPED1.FieldByName('NATOPE').AsString = '5.915' then
    begin
    RDIMPNOT.impC(11,01,'REMESSA PARA CONCERTO',[comp17]);
    end
    else }
  RDIMPNOT.impC(11, 01, dao.q1.fieldbyname('nom_cfop').AsString, [comp17]);
  // NATUREZA OPERAÇÃO
  mcodope := dao.q1.fieldbyname('cod_fiscal').AsString;

  RDIMPNOT.impf(11, 39, mcodope, [comp17]);
  // NOME CLIENTE
  RDIMPNOT.impf(15, 01, dao.q1.fieldbyname('nom_cliente').AsString, [comp17]);
  // CNPJ
  RDIMPNOT.impf(15, 88, dao.q1.fieldbyname('cpf').AsString, [comp17]);
  RDIMPNOT.impf(15, 88, dao.q1.fieldbyname('cnpj').AsString, [comp17]);
  // DTA EMISSÃO
  if Copy(dao.q1.fieldbyname('dta_emissao').AsString, 7, 4) <> '1899' then
    RDIMPNOT.impf(15, 120, formatdatetime('dd/mm/yyyy',
      dao.q1.fieldbyname('dta_emissao').AsDateTime), [comp17]);

  // endereço
  RDIMPNOT.impf(18, 01, dao.q1.fieldbyname('endereco').AsString + ', ' +
    dao.q1.fieldbyname('nr_endereco').AsString, [comp17]);

  // bairro
  RDIMPNOT.impf(18, 67, dao.q1.fieldbyname('bairro').AsString, [comp17]);
  // cep
  RDIMPNOT.impf(18, 97, dao.q1.fieldbyname('cep').AsString, [comp17]);

  // data saida / entrada
  // if copy(datetostr(DMVEN.QUNOTPED1.Fieldbyname('DTASAI').VALUE),7,4) <> '1899' then
  RDIMPNOT.impf(18, 119, formatdatetime('dd/mm/yyyy',
    dao.q1.fieldbyname('dta_saida').AsDateTime), [comp17]);

  // municipio
  RDIMPNOT.impf(21, 01, dao.q1.fieldbyname('cid_cli').AsString, [comp17]);
  // fone
  RDIMPNOT.impf(21, 46, dao.q1.fieldbyname('telefone').AsString, [comp17]);
  // uf
  RDIMPNOT.impf(21, 80, dao.q1.fieldbyname('uf').AsString, [comp17]);
  // ie

  RDIMPNOT.impf(21, 86, dao.q1.fieldbyname('RG').AsString, [comp17]);
  RDIMPNOT.impf(21, 86, dao.q1.fieldbyname('IE').AsString, [comp17]);
  // horA

  // RDIMPNOT.impf(16,01,DMVEN.TAPE1horsai.value,[comp17]);

  // *******************FATURA*****************************
  dao.Q3.First;
  mtotcr1 := dao.Q3.RecordCount;
  maccr1 := 1;
  // Campo feito para marcar na nota qual nota forma de pgto
  RDIMPNOT.impf(25, 02, dao.q1.fieldbyname('nom_fop').AsString, [comp17]);
  MCOL := 49;
  while not(dao.Q3.Eof) do
  begin
    RDIMPNOT.impf(25, MCOL, dao.Q3.fieldbyname('dtaven').AsString, [comp17]);
    MCOL := MCOL + 14;
    dao.Q3.next;
  end;

  RDIMPNOT.impf(27, 02, dao.q1.fieldbyname('nf').AsString, [comp17]);
  RDIMPNOT.impf(27, 24, dao.Q3.fieldbyname('nr_documento').AsString, [comp17]);

  maccr1 := 1;
  dao.Q3.First;
  MCOL := 53;
  while not(dao.Q3.Eof) do
  begin
    RDIMPNOT.impf(27, MCOL, FormatFloat('###,##0.00',
      dao.Q3.fieldbyname('valor').AsFloat), [comp17]);
    MCOL := MCOL + 14;
    dao.Q3.next;
  end;

end;



function Tfr_nfe_complementar.dados_produto(cod_produto: string): boolean;
begin

  with Q_produto do
  begin
    close;
    sql.Clear;
    sql.Add(' SELECT                                                 ' +
      '   P.NOM_PRODUTO,                                       ' +
      '   P.PRECO_VENDA,                                       ' +
      '   P.UNIDADE,                                           ' +
      '   P.QTD_EMBALAGEM,                                     ' +
      '   P.GRADE,                                             ' +
      '   P.GRADE_COMISSAO,                                    ' +
      '   P.QTD_ESTOQUE,                                       ' +
      '   P.QTD_RESERVADO,                                     ' +
      '   P.CUSTO,                                             ' +
      '   P.CUSTO_TOTAL,                                       ' +
      '   P.LUCRO,                                             ' +
      '   P.DESCONTO_MAXIMO, ' +
      '   N.CODIGO AS NCM,                                     ' +
      '   COALESCE(N.MARGEM_VALOR_AGRE_DENTRO ,0) AS MARGEM_VALOR_AGRE_DENTRO, '
      + '   COALESCE(N.MARGEM_VALOR_AGRE_FORA ,0) AS MARGEM_VALOR_AGRE_FORA, ' +
      '   N.IPI_ALIQUOTA,                                      ' +
      '   COALESCE(N.TRIB_ICMS, P.TRIB_ICMS) AS TRIB_ICMS,     ' +
      '   N.CESTA_BASICA                                       ' +
      ' FROM                                                   ' +
      '   PRODUTO P                                            ' +
      ' LEFT OUTER JOIN GRUPO G ON (G.COD_GRUPO = P.COD_GRUPO) ' +
      ' LEFT OUTER JOIN NCM N ON (N.CODIGO = G.NCM OR N.CODIGO = P.NCM) ' +
      ' WHERE P.COD_PRODUTO = ' + QuotedStr(cod_produto) + ' and status = ' +
      QuotedStr('N'));
    open;
  end;
  if Q_produto.RecordCount > 0 then
    Result := true
  else
    Result := false;
end;

procedure Tfr_nfe_complementar.Emcod_produtoExit(Sender: TObject);
begin
  if trim(Emcod_produto.Text) = '' then
    Lbnom_produto.Caption := '...';

  if Emcod_produto.Text <> '' then
  begin
    if Length(trim(Emcod_produto.Text)) > 13 then
    begin
      if dados_produto(Copy(Emcod_produto.Text, 1, 4)) = false then
      begin
        showmessage('Produto inexistente ou desativado!');
        Exit;
      end;
    end
    else
    begin
      if dados_produto(Emcod_produto.Text) = false then
      begin
        showmessage('Produto inexistente ou desativado!');
        Exit;
      end;
    end;

    if Q_produto.fieldbyname('nom_produto').AsString <> '' then
    begin
      Lbnom_produto.Caption := Q_produto.fieldbyname('nom_produto').AsString;
      if mmVendas2.State in [dsEdit, dsInsert] then
        mmVendas2NOM_PRODUTO.AsString :=
          Q_produto.fieldbyname('nom_produto').AsString;
    end;

    if Q_produto.fieldbyname('unidade').AsString <> '' then
      Lbembalagem.Caption := Q_produto.fieldbyname('unidade').AsString + '\ ' +
        Q_produto.fieldbyname('qtd_embalagem').AsString;

    if Q_produto.fieldbyname('NCM').AsString <> '' then
      mmVendas2NCM.AsString := Q_produto.fieldbyname('NCM').AsString;

    if UF_Cliente = 'SC' then
    begin
      mmVendas2VLR_AGR_ITEM.Value := Q_produto.fieldbyname
        ('MARGEM_VALOR_AGRE_DENTRO').AsFloat;
      mmVendas2ICMS_ITEM.Value := 17;
    end
    else
    begin
      mmVendas2VLR_AGR_ITEM.Value := Q_produto.fieldbyname
        ('MARGEM_VALOR_AGRE_FORA').AsFloat;
      mmVendas2ICMS_ITEM.Value := 12;
    end;

    zzEstoque.Text := Q_produto.fieldbyname('qtd_estoque').AsString;

    { puxando o custo do cadastro de produto }
    // if (Prcod_fiscal.Text = '5918') or (Prcod_fiscal.Text = '6918') or (Prcod_fiscal.Text = '5915') or (Prcod_fiscal.Text = '6915') or (Prcod_fiscal.Text = '5914') or (Prcod_fiscal.Text = '6914') or (Prcod_fiscal.Text = '5202') or (Prcod_fiscal.Text = '6202') then
    // begin
    dao.Geral1('select custo, preco_venda from produto where cod_produto=' +
      QuotedStr(Emcod_produto.Text));

    if mmVendas2PRECO_LIQUIDO.ISNULL then
      mmVendas2PRECO_LIQUIDO.AsString :=
        dao.q1.fieldbyname('preco_venda').AsString;
    // end;
  end;

end;

procedure Tfr_nfe_complementar.BtNovEmClick(Sender: TObject);
begin
  try
    if (Btnovped.Enabled = true) or (Btaltped.Enabled = true) then
    begin
      dao.msg('O Botão Inserir ou Alterar Geral deve ser precionado!');
      PageControl1.ActivePageIndex := 0;
      Btaltped.SetFocus;
      Exit;
    end;

    if (Prcod_cliente.Text = '') and (Prcod_fornecedor.Text = '') then
    begin
      dao.msg('O campo Cliente ou Fornecedor não estão preenchidos!');
      PageControl1.ActivePageIndex := 0;
      if Prcod_fornecedor.Text = '' then
        Prcod_fornecedor.SetFocus
      else
        Prcod_cliente.SetFocus;
      Exit;
    end;
    if not mmVendas2.Active then
      mmVendas2.open;
    mmVendas2.Append;
    mmVendas2QTD.AsString := '1';

    readonly_false('Em');

    Emcod_produto.SetFocus;
    // habilita botões
    BtNovEm.Enabled := false;
    BtAltEm.Enabled := false;
    BtgraEm.Enabled := true;
    BtcanEm.Enabled := true;
    BtexcEm.Enabled := false;
    GbProduto.Enabled := false;

  except

  end;

end;

procedure Tfr_nfe_complementar.BtAltEmClick(Sender: TObject);
begin
  try
    if (Btnovped.Enabled = true) or (Btaltped.Enabled = true) then
    begin
      dao.msg('O Botão Inserir ou Alterar Geral deve ser precionado!');
      PageControl1.ActivePageIndex := 0;
      Btaltped.SetFocus;
      Exit;
    end;

    mmVendas2.edit;
    Emcod_produto.SetFocus;
    // habilita botões
    BtNovEm.Enabled := false;
    BtAltEm.Enabled := false;
    BtgraEm.Enabled := true;
    BtcanEm.Enabled := true;
    BtexcEm.Enabled := false;

    Emcod_produto.SetFocus;
    GbProduto.Enabled := false;
  except
  end;
end;

procedure Tfr_nfe_complementar.BtgraEmClick(Sender: TObject);
var
  vl_icms, sub_total: real;
  cod_fiscal: string;
begin
  try
    if (mmVendas2QTD.ISNULL) or (mmVendas2QTD.Value = 0) then
    begin
      dao.msg('O Campo Quantidade deve ser preenchido!');
      Emqtd_entrada.SetFocus;
      Exit;
    end;

    BtNovEm.Enabled := true;
    BtAltEm.Enabled := true;
    BtgraEm.Enabled := false;
    BtcanEm.Enabled := false;
    BtexcEm.Enabled := true;
    // paAtributo.Visible:= true;
    // zzPreco_venda_atualizar.ReadOnly:= true;

    // recalcular o sub_total
    mmVendas2SUB_TOTAL.Value := mmVendas2PRECO_LIQUIDO.Value *
      mmVendas2QTD.Value;
    mmVendas2VLR_BC.Value := mmVendas2SUB_TOTAL.Value;

    if mmVendas2ICMS_ITEM.ISNULL then
      mmVendas2ICMS_ITEM.Value := 0
    else
      mmVendas2VLR_ICMS_ITEM.Value := mmVendas2VLR_BC.Value *
        (mmVendas2ICMS_ITEM.Value / 100);

    if mmVendas2VLR_ICMS_ITEM.ISNULL then
      mmVendas2VLR_ICMS_ITEM.Value := 0;
    if mmVendas2VOLUME.ISNULL then
      mmVendas2VOLUME.Value := 0;
    CalculoIcmsItem;

    mmVendas2.Post;
    BtNovEm.SetFocus;
    cod_fiscal := Copy(trim(Prcod_fiscal.Text), 1, 1);

    // agora é o estoque para valer

    GbProduto.Enabled := true;
    // lbqtdpecas.Caption := FloatToStr(SgPro.ColumnSum(3, 1, SgPro.RowCount));

  except
    on e: Exception do
    begin
      dao.msg('Houve um erro ao Gravar o Produto ' + Lbnom_produto.Caption +
        ' desta NFe Complementar!' + #13 + e.Message);
{      dao.envia_email_suporte('Houve um erro ao Gravar o Produto ' +
        Lbnom_produto.Caption + ' desta NFe Complementar!' + #13 +
        'Nr.Documento=' + Prnumdoc.Text + '  - Cliente: ' +
        LbNom_cliente.Caption + #13 + e.Message + #13 + 'Data: ' + dao.DtaSerStr
        + #13 + 'Usuario Logado:' + nom_usuario,
        'Erro ao Gravar Registro 1 exction do procedimento NFe Complementar',
        'claudioplasfan@gmail.com', '', '', '');
        }
    end;
  end;
end;

procedure Tfr_nfe_complementar.BtcanEmClick(Sender: TObject);
begin
  try
    if MessageDlg('Deseja Cancelar está Operação?', mtConfirmation,
      [mbYes, mbno], 0) = mryes then
      mmVendas2.Cancel
    else
      Exit;

    GbProduto.Enabled := true;

  except
  end;
end;

procedure Tfr_nfe_complementar.BtexcEmClick(Sender: TObject);
begin
  try
    if (Btnovped.Enabled = true) or (Btaltped.Enabled = true) then
    begin
      dao.msg('O Botão Inserir ou Alterar Geral deve ser precionado!');
      PageControl1.ActivePageIndex := 0;
      Btaltped.SetFocus;
      Exit;
    end;

    if MessageDlg('Tem Certeza que Deseja Excluir Este Produto?',
      mtConfirmation, [mbYes, mbno], 0) = mryes then
      mmVendas2.Delete;
  except
    on e: Exception do
    begin
      dao.msg('Houve um erro ao Excluir o Produto!' + #13 + e.Message);

{      dao.envia_email_suporte('Erro ao excluir produto ' + Lbnom_produto.Caption
        + ' da entrada: ' + Prnumdoc.Text + '   - Cliente : ' +
        LbNom_cliente.Caption + #13 + e.Message + #13 + 'Data: ' + dao.DtaSerStr
        + #13 + 'Usuario Logado:' + nom_usuario,
        'Erro ao inserir Registro módulo Dao', 'claudioplasfan@gmail.com',
        '', '', '');}
    end;
  end;
end;

procedure Tfr_nfe_complementar.Emcod_produtoButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Produto';
  chamou_pesquisa := 'fr_produto';
  revenda := 'S';
  chamou_form := 'fr_complemento_produto';

  chamou_cadastro := 'Fr_produto';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Produto';
  Fr_localizar.BT_cadastro.Visible := true;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'Marca';

  for i := 0 to 2 do
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

procedure Tfr_nfe_complementar.carrega_vendas2;
var
  total_custo: double;
begin
  // ativa_vendas2(Prnumdoc.Text);
  q_vendas2.First;
  // if fr_nfe_complementar.mmVendas2.Active then  fr_nfe_complementar.mmVendas2.Close;
  mmVendas2.EmptyTable;
  mmVendas2.open;
  total_custo := 0;

  if q_vendas2.IsEmpty then
    Exit;
  while not(q_vendas2.Eof) do
  begin
    mmVendas2.Append;
    mmVendas2ID.AsString := q_vendas2.fieldbyname('id').Value;
    mmVendas2COD_PRODUTO.AsString := q_vendas2.fieldbyname
      ('cod_produto').AsString;
    mmVendas2NOM_PRODUTO.AsString := q_vendas2.fieldbyname
      ('nom_produto').AsString;

    mmVendas2DESCONTO_MAXIMO.Value :=
      q_vendas2.fieldbyname('DESCONTO_MAXIMO').AsFloat;
    mmVendas2NCM.AsString := q_vendas2.fieldbyname('ncm').AsString;
    mmVendas2TRIB_ICMS.AsString := q_vendas2.fieldbyname('trib_icms').AsString;
    mmVendas2COD_FISCAL_ITEM.AsString :=
      q_vendas2.fieldbyname('COD_FISCAL_ITEM').AsString;

    if q_vendas2.fieldbyname('cesta_basica').AsString = 'S' then
      mmVendas2CESTA_BASICA.Value := true
    else
      mmVendas2CESTA_BASICA.Value := false;

    mmVendas2VOLUME.AsString := q_vendas2.fieldbyname('volume').AsString;
    mmVendas2QTD.AsString := q_vendas2.fieldbyname('qtd').AsString;
    mmVendas2PRECO_VENDA.AsString := q_vendas2.fieldbyname
      ('preco_venda').AsString;
    mmVendas2DESCONTO.AsString := q_vendas2.fieldbyname('desconto').AsString;
    mmVendas2PRECO_LIQUIDO.AsString := q_vendas2.fieldbyname('preco').AsString;
    mmVendas2PRECO_CUSTO.AsString := q_vendas2.fieldbyname
      ('preco_CUSTO').AsString;
    total_custo := total_custo +
      (mmVendas2QTD.Value * mmVendas2PRECO_CUSTO.Value);
    mmVendas2SUB_TOTAL.AsString := q_vendas2.fieldbyname('sub_total').AsString;
    mmVendas2IPI_ITEM.AsString := q_vendas2.fieldbyname('ipi_item').AsString;
    mmVendas2VLR_IPI_ITEM.AsString :=
      q_vendas2.fieldbyname('vlr_ipi_item').AsString;
    mmVendas2VLR_BC.AsString := q_vendas2.fieldbyname('vlr_bc').AsString;
    mmVendas2ICMS_ITEM.AsString := q_vendas2.fieldbyname('icms_item').AsString;
    mmVendas2VLR_ICMS_ITEM.AsString :=
      q_vendas2.fieldbyname('vlr_icms_item').AsString;
    mmVendas2VLR_AGR_ITEM.AsString :=
      q_vendas2.fieldbyname('vlr_agr_item').AsString;
    mmVendas2VLR_BC_ST.AsString := q_vendas2.fieldbyname('vlr_bc_st').AsString;
    mmVendas2VLR_ICMS_ST.AsString := q_vendas2.fieldbyname
      ('vlr_icms_st').AsString;
    mmVendas2PERC_COMISSAO.AsString :=
      q_vendas2.fieldbyname('PERC_comissao').AsString;
    mmVendas2VLR_COMISSAO.AsString :=
      q_vendas2.fieldbyname('vlr_comissao').AsString;
    mmVendas2QTD_ESTOQUE.AsString := q_vendas2.fieldbyname
      ('QTD_ESTOQUE').AsString;
    mmVendas2ESTOQUE_MINIMO.AsString :=
      q_vendas2.fieldbyname('ESTOQUE_MINIMO').AsString;
    mmVendas2QTD_RESERVADO.AsString :=
      q_vendas2.fieldbyname('QTD_RESERVADO').AsString;
    mmVendas2GRADE_COMISSAO.AsString :=
      q_vendas2.fieldbyname('GRADE_COMISSAO').AsString;

    mmVendas2.Post;

    q_vendas2.next;
  end;
  // DBGrid1.SetFocus;
  mmVendas2.First;

end;

procedure Tfr_nfe_complementar.ativa_vendas2(nr_documento: string);
begin
  with q_vendas2 do
  begin
    close;
    sql.Clear;
    sql.Add(' select DISTINCT ' +
            ' V2.ID, ' +
            ' COALESCE(V2.PROMOCAO, ''N'') AS PROMOCAO, ' +
            ' COALESCE(V2.DESCONTO_VALOR,0) AS DESCONTO_VALOR, ' +
            ' COALESCE(V2.DESCONTO_VALOR_GERAL,0) AS DESCONTO_VALOR_GERAL, ' +
            ' V2.TRIB_ICMS, ' +
            ' V2.COD_FISCAL_ITEM, ' +
            ' V2.CESTA_BASICA, ' +
            ' V2.COD_PRODUTO, ' +
            ' V2.VOLUME, ' +
            ' V2.QTD, ' +
            ' COALESCE(V2.PRECO_CUSTO, P.CUSTO_TOTAL) AS PRECO_CUSTO, ' +
            ' V2.PRECO_BRUTO, ' +
            ' V2.PERC_COMISSAO, ' +
            ' COALESCE(V2.VLR_COMISSAO, 0) AS VLR_COMISSAO, ' +
            ' COALESCE(V2.PRECO_BASE, P.PRECO_VENDA) AS PRECO_BASE, ' +
            ' p.cod_grupo, ' +
            ' V2.NAO_VALIDAR_MARGEM, ' +
            ' V2.NCM, ' +
            ' COALESCE(V2.CEST, COALESCE(P.CEST, G.CEST)) AS CEST, ' +
            ' V2.DESCONTO, ' +
            ' V2.PRECO, ' +
            ' p.ord_pauta, ' +
            ' V2.sub_total, ' +
            ' COALESCE(V2.ipi_item, 0) AS IPI_ITEM, ' +
            ' COALESCE(V2.vlr_ipi_item,0) AS VLR_IPI_ITEM, ' +
            ' COALESCE(V2.vlr_bc,0) AS VLR_BC, ' +
            ' COALESCE(V2.icms_item, 0) AS ICMS_ITEM, ' +
            ' COALESCE(V2.vlr_icms_item,0) AS VLR_ICMS_ITEM, ' +
            ' COALESCE(V2.vlr_agr_item,0) AS VLR_AGR_ITEM, ' +
            ' COALESCE(V2.vlr_bc_st,0) AS VLR_BC_ST, ' +
            ' COALESCE(V2.vlr_icms_st,0) AS VLR_ICMS_ST, ' +
            ' CASE WHEN V2.PROMOCAO = ''S'' THEN P.PRECO_PROMOCAO ELSE P.PRECO_VENDA END PRECO_VENDA, ' +
            ' p.nom_produto, ' +
            ' p.QTD_ESTOQUE, ' +
            ' p.qtd_embalagem, ' +
            ' p.CODIGO_BARRA, ' +
            ' p.unidade, ' +
            ' coalesce((SELECT PR.DESCONTO_MAXIMO FROM PRODUTO_REPRESENTANTE PR ' +
            '      WHERE PR.COD_PRODUTO = p.COD_PRODUTO AND PR.ID_REPRESENTANTE = v1.cod_representante ' + ' limit 1 ),       coalesce(       (SELECT ' + '        PR.DESCONTO_MAXIMO        FROM ' + '        GRUPO_REPRESENTANTE PR ' + '      WHERE PR.COD_GRUPO = p.COD_GRUPO AND PR.ID_REPRESENTANTE = v1.cod_representante ' + '     ), P.DESCONTO_MAXIMO)) AS DESCONTO_MAXIMO, ' + ' p.ESTOQUE_MINIMO, ' + ' p.QTD_RESERVADO, ' + ' P.GRADE_COMISSAO, ' + ' P.PESO, ' + ' (P.PESO * V2.QTD) AS PESO_TOTAL ' + ' from vendas2 v2 ' +
            ' INNER JOIN VENDAS1 V1 ON (V1.NUMDOC = V2.NUMDOC) ' +
            ' left join produto p on p.cod_produto = v2.cod_produto ' +
            ' LEFT JOIN GRUPO G ON G.COD_GRUPO = P.COD_GRUPO ' +
            ' LEFT OUTER JOIN NCM N ON N.CODIGO = P.NCM AND N.CEST = COALESCE(P.CEST, G.CEST) ' +
            ' where v2.numdoc = ' + QuotedStr(nr_documento) + ' order by p.ord_pauta ');
    open;
  end;
  carrega_vendas2;
end;

procedure Tfr_nfe_complementar.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
end;

procedure Tfr_nfe_complementar.FormShow(Sender: TObject);
begin
  { ACBrNFe1.Configuracoes.Geral.PathSchemas :=
    ExtractFilePath(Application.ExeName) + 'Schemas\' }
end;

procedure Tfr_nfe_complementar.RecXml;
var
  RecNFe: Tnferecxml;
begin
  Application.CreateForm(TFr_nfe_transmissao, Fr_nfe_transmissao);
  RecNFe := Tnferecxml.Create(strtoint(PrNFE.Text), strtoint(Prnumdoc.Text),
    strtoint(Prempresa_faturar.Text), prchave_nfe.text);
  Fr_nfe_transmissao.sCheckBox1.Visible := true;
  Fr_nfe_transmissao.sCheckBox1.Caption := 'Buscar Certificado.';

  Fr_nfe_transmissao.sCheckBox2.Visible := true;
  Fr_nfe_transmissao.sCheckBox2.Caption := 'Gerar Arquivo NFe.';

  Fr_nfe_transmissao.sCheckBox3.Visible := true;
  Fr_nfe_transmissao.sCheckBox3.Caption := 'Gravar Dados de Protocolo.';

  Fr_nfe_transmissao.Gauge1.MaxValue := 3;
  Fr_nfe_transmissao.Height := Fr_nfe_transmissao.Height + (16 * 3);
  Fr_nfe_transmissao.Gauge1.Progress := 0;

  try
    Fr_nfe_transmissao.ShowModal;
  finally
    BtnDanfeClick(self);
  end;
end;

procedure Tfr_nfe_complementar.btRecXmlClick(Sender: TObject);
begin
  RecXml;
end;

end.
