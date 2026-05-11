unit Un_vendas_industria2;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Menus, Mask, Buttons, NFE_dll_TLB,
  JvgGridHeaderControl, Grids,  ExtCtrls, JvExControls,
  JvComponent, JvLookOut, JvExStdCtrls, JvCheckBox,  ActnList,
  BaseGrid, AdvGrid,  RDprint, JvExExtCtrls, JvNavigationPane,
  ComObj, DateUtils,
  xmldom, XMLIntf, msxmldom, XMLDoc, IdFTPCommon, ACBrNFe,
  ACBrNFeDANFEClass, ACBrNFeDANFERave, pcnConversao, ACBrNFeDANFeRLClass,
  ACBrNFeDANFeQRClass, RpDefine, RpRave, DB, RxMemDS, DBGrids, RXDBCtrl,
  DBCtrls, IBCustomDataSet, ImgList, JvMemoryDataset, frxClass, ACBrBase,
  ACBrBoleto, ACBrBoletoFCFortesFr, ACBrUtil, sSkinProvider, sPageControl,
  sSpeedButton, sPanel, sBitBtn, sLabel, sCheckBox, sGroupBox, ActiveX,
  sDBEdit, sDBText, JvBehaviorLabel, sMaskEdit, sCustomComboEdit,
  sCurrEdit, sCurrencyEdit, QRPDFFilt, acDBGrid, sTooledit, sEdit,
  sComboEdit, sComboBox, sRichEdit, sDBCheckBox, sDBCalcEdit,
  XPMan, ACBrDANFCeFortesFr;
//, xmldom;

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
    //referente a NF-e
    procedure GravarReciboNfe;
    procedure Mostra;
    procedure LimparArquivos;
    procedure MontarEvento;
  public
    constructor Create(ChaveNfe, Justificativa, Protocolo: string; normal:
      boolean);
  end;

  TNFeCC = class(TThread)
  private
    pathSaida, cEvento, cChaveNfe, cJustificativa, strCabecXML: string;
    cont: integer;
    erro, finalizado: boolean;
    msgerros, MsgRetWS, strDados: WideString;
    tipAmb: integer;
    procedure Execute; override;
    //referente a NF-e
    function GerarXMLProcNFe: Boolean;
    procedure Mostra;
    procedure LimparArquivos;
  public
    constructor Create(ChaveNfe, Evento, Justificativa: string);
  end;

  TNFePedido = class(TThread)
  private
    cBuscarCertificado: _BuscarCertificado;
    tipAmb: integer;
    cont: integer;
    erro, finalizado: boolean;
    recibo, msgerros, status, motivo: WideString;
    ChaveNFe, PathLote, pathSaida: string;
    procedure Execute; override;
    //referente a NF-e
    procedure monta_NFE;
    procedure GravarChaveNfe;
    procedure TransfereNfeFTP;
    procedure EnviarLote(arquivo: string);
    procedure GravarReciboNfe;
    function GerarXMLProcNFe: Boolean;
    procedure Mostra;
  public
    tipo: integer; //0 - Saida; 1 - Entrada;
    constructor Create(BuscarCertificado: _BuscarCertificado);
  end;

  TFr_vendas_industria2 = class(TForm)
    Gbdados: TsGroupBox;
    Label1: tsLabel;
    Label2: tsLabel;
    Prnumdoc: TsEdit;
    sbvendas: TStatusBar;
    Pc_vendas: TsPageControl;
    tab_mercadorias: TsTabSheet;
    tab_finalizar: TsTabSheet;
    Prcod_cliente: TsComboEdit;
    Label11: tsLabel;
    Lbnom_representante: tsLabel;
    Prcod_representante: TsComboEdit;
    Label8: tsLabel;
    Lbnom_cliente: tsLabel;
    SpeedButton1: TsSpeedButton;
    Prcod_fop: TsComboEdit;
    Lbnom_fop: tsLabel;
    Label16: tsLabel;
    Label17: tsLabel;
    Prcod_prazo_pgto: TsComboEdit;
    Lbprazo_pgto: tsLabel;
    gbFaturamento: TsGroupBox;
    Prempresa_faturar: TsComboEdit;
    Label35: tsLabel;
    Lbempresa_faturamento: tsLabel;
    gbTransp: TsGroupBox;
    Label38: tsLabel;
    Prcod_transportadora: TsComboEdit;
    LbNom_transportadora: tsLabel;
    Label39: tsLabel;
    Label41: tsLabel;
    Label42: tsLabel;
    Prpeso_nota: TsCurrencyEdit;
    Label45: tsLabel;
    Label46: tsLabel;
    Prdta_emissao: TsDateEdit;
    Prdta_saida: TsDateEdit;
    Label47: tsLabel;
    Prcod_carga: TsEdit;
    Probservacoes_nota: TsRichEdit;
    Label49: tsLabel;
    ActionList1: TActionList;
    Ac_inserir: TAction;
    Ac_alterar: TAction;
    Ac_gravar: TAction;
    Ac_cancelar: TAction;
    ac_localizar: TAction;
    GroupBox2: TsGroupBox;
    Label44: tsLabel;
    Prcontato_frete: TsEdit;
    Prvl_frete: TsCurrencyEdit;
    Label43: tsLabel;
    tab_analise: TsTabSheet;
    GroupBox1: TsGroupBox;
    Label24: tsLabel;
    Label26: tsLabel;
    Label27: tsLabel;
    Label28: tsLabel;
    Label29: tsLabel;
    Zztot_bruto: TsCurrencyEdit;
    Zzdesconto: TsCurrencyEdit;
    Zztot_liquido: TsCurrencyEdit;
    Prcusto_total: TsCurrencyEdit;
    Prlucro_medio: TsCurrencyEdit;
    GroupBox5: TsGroupBox;
    Probservacoes_pedido: TsRichEdit;
    lbObs: TsLabel;
    q_vendas1: TFDQuery;
    q_vendas2: TFDQuery;
    Lb_orcamento: tsLabel;
    Prorcamento: TComboBox;
    Lb_consignacao: tsLabel;
    Prconsignacao: TComboBox;
    Prcod_empresa: TsEdit;
    Prvolume_nota: TsCurrencyEdit;
    gbtotal: TsGroupBox;
    Prtot_bruto: TsCurrencyEdit;
    Label21: tsLabel;
    Label48: tsLabel;
    Label50: tsLabel;
    Prtot_liquido: TsCurrencyEdit;
    Prdesconto: TsCurrencyEdit;
    Prcod_usuario: TsEdit;
    Btnovped: TsBitBtn;
    Btaltped: TsBitBtn;
    Btgraped: TsBitBtn;
    Btcanped: TsBitBtn;
    Btexcped: TsBitBtn;
    Btlocped: TsBitBtn;
    rd_vendas: TRDprint;
    tab_cr1: TsTabSheet;
    GroupBox8: TsGroupBox;
    Label30: tsLabel;
    Label31: tsLabel;
    Label32: tsLabel;
    Label33: tsLabel;
    Label51: tsLabel;
    Lbforma_pgto: tsLabel;
    Crdtaven: TsDateEdit;
    Crvalor: TsCurrencyEdit;
    Crdtarec: TsDateEdit;
    Crvalor_recebido: TsCurrencyEdit;
    Crcod_fop: TsComboEdit;
    JvNavPanelDivider2: TJvNavPanelDivider;
    Crid: TsEdit;
    Btgrava_cr1: TsBitBtn;
    gbAtalhos: TsGroupBox;
    Label52: tsLabel;
    Label54: tsLabel;
    Label55: tsLabel;
    Label56: tsLabel;
    Btinsere_cheque: TsBitBtn;
    Crtitulo: TsEdit;
    Label34: tsLabel;
    Crsequencia: TsEdit;
    Label53: tsLabel;
    Pacheque: tsPanel;
    Sg_cheque: TAdvStringGrid;
    Label57: tsLabel;
    Prtipo_venda: TsEdit;
    Label36: tsLabel;
    Prboleto_anexo: tscheckbox;
    RDNOVNOT: TRDprint;
    RDIMPNOT: TRDprint;
    Prcod_fiscal: TsComboEdit;
    Label59: tsLabel;
    Lbnom_cod_fiscal: tsLabel;
    Prvlr_tot_nf: TsCurrencyEdit;
    OD: TOpenDialog;
    BtnNFE: TsBitBtn;
    XMLNFe: TXMLDocument;
    TaNFe: TsTabSheet;
    Lbnom_supervisor: tsLabel;
    lbSupervisor: TsLabel;
    Prcod_supervisor: TsComboEdit;
    Timer1: TTimer;
    Prcod_fornecedor: TsComboEdit;
    LbNom_fornecedor: tsLabel;
    lbForn: tsLabel;
    lbcidade_forn: tsLabel;
    lbCnpj_forn: tsLabel;
    mmVendas2: TRxMemoryData;
    dsVendas2: TDataSource;
    mmVendas2ID: TIntegerField;
    mmVendas2COD_PRODUTO: TIntegerField;
    mmVendas2NOM_PRODUTO: TStringField;
    mmVendas2NCM: TStringField;
    mmVendas2CESTA_BASICA: TBooleanField;
    mmVendas2QTD: TFloatField;
    mmVendas2SUB_TOTAL: TFloatField;
    mmVendas2IPI_ITEM: TFloatField;
    mmVendas2VLR_IPI_ITEM: TFloatField;
    mmVendas2VLR_BC: TFloatField;
    mmVendas2ICMS_ITEM: TFloatField;
    mmVendas2VLR_ICMS_ITEM: TFloatField;
    mmVendas2VLR_AGR_ITEM: TFloatField;
    mmVendas2VLR_BC_ST: TFloatField;
    mmVendas2VLR_ICMS_ST: TFloatField;
    DBGrid1: Tdbgrid;
    Panel3: tsPanel;
    Label9: tsLabel;
    Lbnom_produto_db: TsDBText;
    Label18: tsLabel;
    Label19: tsLabel;
    Label20: tsLabel;
    lbDesc: TsLabel;
    lbPrecoLiq: TsLabel;
    lbTotalLiq: TsLabel;
    Label37: tsLabel;
    Label6: tsLabel;
    Panel1: tsPanel;
    btnov: TsBitBtn;
    btalt: TsBitBtn;
    btgra: TsBitBtn;
    btcan: TsBitBtn;
    btexc: TsBitBtn;
    zzunidade: TsEdit;
    Meqtd: TsDBCalcEdit;
    Medesconto: TsDBCalcEdit;
    Mepreco: TsDBCalcEdit;
    Mesub_total: TsDBCalcEdit;
    Panel2: tsPanel;
    Label15: tsLabel;
    Label12: tsLabel;
    Label13: tsLabel;
    zzreal: TsCurrencyEdit;
    zzreservado: TsCurrencyEdit;
    zztotal: TsCurrencyEdit;
    zzqtd_embalagem: TsCurrencyEdit;
    Mevolume: TsDBCalcEdit;
    Gbanalise_custo: TsGroupBox;
    Label3: tsLabel;
    Label4: tsLabel;
    Label5: tsLabel;
    zz_lucro_produto: TsCurrencyEdit;
    Zztot_custo: TsCurrencyEdit;
    Zzcusto: TsCurrencyEdit;
    Meid: TsDBEdit;
    paAtributo: tsPanel;
    Label10: tsLabel;
    LbCor: tsLabel;
    Lbtamanho: tsLabel;
    Label7: tsLabel;
    Meid_cor: TsComboEdit;
    Meid_Tamanho: TsComboEdit;
    Menumdoc: TsDBEdit;
    Medtadoc: TsDateEdit;
    Mecod_cliente: TsDBEdit;
    Mevlr_icms_st: TsDBCalcEdit;
    Mevlr_bc_st: TsDBCalcEdit;
    MeNCM: TsDBEdit;
    Mevlr_bc: TsDBCalcEdit;
    Meipi_item: TsDBCalcEdit;
    Mevlr_ipi_item: TsDBCalcEdit;
    Mevlr_agr_item: TsDBCalcEdit;
    MeCesta_Basica: TsdbEdit;
    MeTrib_ICMS: TsDBEdit;
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
    mmVendas2SUB_TOTAL_BRUTO: TFloatField;
    mmVendas2VLR_COMISSAO: TFloatField;
    mmVendas2TROCA: TStringField;
    mmVendas2COD_FISCAL_ITEM: TStringField;
    mmVendas2COD_SUPERVISOR: TIntegerField;
    Mecod_produto: TRxDBComboEdit;
    edUltimaNf: TsEdit;
    PrNF: TsEdit;
    Label58: tsLabel;
    Label65: tsLabel;
    PrNFE: TsEdit;
    ACBrNFe1: TACBrNFe;
    ACBrNFeDANFEQR1: TACBrNFeDANFEQR;
    mmVendas2PRECO_LIQUIDO: TFloatField;
    ImageList1: TImageList;
    mmVendas2QTD_ESTOQUE: TFloatField;
    mmVendas2ESTOQUE_MINIMO: TFloatField;
    mmVendas2QTD_RESERVADO: TFloatField;
    mmVendas2DESCONTO: TFloatField;
    MainMenu1: TMainMenu;
    Funes1: TMenuItem;
    ImprimirEtiquetadeTransporte1: TMenuItem;
    HistoricodeCompradoCliente1: TMenuItem;
    ImprimirPedido1: TMenuItem;
    imprimirLotedePedidos1: TMenuItem;
    CrditoCliente1: TMenuItem;
    FaturamentoAvulso1: TMenuItem;
    DesfaturarPedido1: TMenuItem;
    mmVendas2TRIB_ICMS: TStringField;
    lbCST: tsLabel;
    lbIPIitem: tsLabel;
    lbTotalIPI: tsLabel;
    q_foto: TFDQuery;
    Panel4: tsPanel;
    MePreco_venda: TsDBEdit;
    Label67: tsLabel;
    Mecod_fiscal_item: TRxDBComboEdit;
    lbICMSItem: tsLabel;
    Meicms_item: TsDBCalcEdit;
    lbTotalICMS: tsLabel;
    Mevlr_icms_item: TsDBCalcEdit;
    CancelamentoAvulso1: TMenuItem;
    mmVendas2PRECO_CUSTO: TFloatField;
    MePRECO_CUSTO: TsDBCalcEdit;
    mmVendas2DESCONTO_MAXIMO: TFloatField;
    mmVendas2PRECO_VENDA: TFloatField;
    fR_RELATORIO: TfrxReport;
    ImprimirPedidoDetalhado1: TMenuItem;
    BtnMaisPrecos: TsBitBtn;
    mmVendas2PERC_COMISSAO: TFloatField;
    mmVendas2GRADE_COMISSAO: TStringField;
    pnWait: tsPanel;
    MePromocao: TsDBEdit;
    mmVendas2PROMOCAO: TStringField;
    meDESCONTO_MAX: TsDBCalcEdit;
    BtnAltFormaPrazo: TsBitBtn;
    ACBrBoleto1: TACBrBoleto;
    ACBrBoletoFCFortes1: TACBrBoletoFCFortes;
    BtnBoleto: TsBitBtn;
    mmVendas2PESO: TFloatField;
    mmVendas2PESO_TOTAL: TFloatField;
    Prtipo_frete: TComboBox;
    lbcontabanco: TsLabel;
    PrCONTA_BOLETO: TsComboEdit;
    lbCCBoleto: tsLabel;
    Shape1: TShape;
    Foto: TImage;
    lbSituacao: TsLabel;
    BtnEmailPedido: TsBitBtn;
    BtnEtiqueta: TsBitBtn;
    btAltRep: TsBitBtn;
    TaNFeDevol: TsTabSheet;
    sGroupBox1: TsGroupBox;
    PrChave_NFe_DEV: TsEdit;
    sGroupBox2: TsGroupBox;
    PrRECIBO_NFE_DEV: TsEdit;
    sGroupBox3: TsGroupBox;
    PrDIGEST_NFE_DEV: TsEdit;
    sGroupBox4: TsGroupBox;
    PrPROTOCOLO_NFE_DEV: TsEdit;
    sGroupBox5: TsGroupBox;
    PrDATA_REC_NFE_DEV: TDateTimePicker;
    sGroupBox6: TsGroupBox;
    PrMotivo_nfe_DEV: TsEdit;
    sGroupBox7: TsGroupBox;
    PrStatus_Nfe_DEV: TsEdit;
    sGroupBox8: TsGroupBox;
    LBsTATUSCANCEL_DEV: TsLabel;
    PrJUSTIF_CANC_NFE_DEV: TsEdit;
    BtnEnviarCancelamentoNFeDev: TsBitBtn;
    BtnEditarCancelamentoNFeDev: TsBitBtn;
    BtnSairCancelamentoNFeDev: TsBitBtn;
    sGroupBox9: TsGroupBox;
    PrNFE_Dev: TsEdit;
    btnNfeDev: TsBitBtn;
    btRecXml_Dev: TsBitBtn;
    BtnDanfe_Dev: TsBitBtn;
    BtnEmailNFe_Dev: TsBitBtn;
    mmVendas2CODIGO_BARRAS: TStringField;
    BtnEmailBoleto: TsBitBtn;
    Shape2: TShape;
    sLabel3: TsLabel;
    QRPDFFilter1: TQRPDFFilter;
    edPesoTotal: TsCurrencyEdit;
    sLabel4: TsLabel;
    sLabel5: TsLabel;
    edDecTransp: TsCurrencyEdit;
    Prdtadoc: TsDateEdit;
    DS_CR2: TDataSource;
    sDBGrid1: Tdbgrid;
    Q2S: TIBOQuery;
    q_cr1: TIBOQuery;
    gbTotalFaturado: TsGroupBox;
    sLabel6: TsLabel;
    sLabel7: TsLabel;
    cbEmpresa: TsComboBox;
    cbMes: TsComboBox;
    sLabel8: TsLabel;
    lbTotalFaturado: TJvBehaviorLabel;
    Status: TJvBehaviorLabel;
    gbImpostos: TsGroupBox;
    Label60: TsLabel;
    Label61: TsLabel;
    Label62: TsLabel;
    Label63: TsLabel;
    Label64: TsLabel;
    lbLucro: TsLabel;
    Label71: TsLabel;
    Label72: TsLabel;
    Prvlr_bc_icms: TsCurrencyEdit;
    Prvlr_icms: TsCurrencyEdit;
    Prvlr_ipi: TsCurrencyEdit;
    edPercComissao: TsCurrencyEdit;
    edTotComissao: TsCurrencyEdit;
    PrVLR_BC_ICMS_ST: TsCurrencyEdit;
    Prvlr_st: TsCurrencyEdit;
    edMargemLucro: TsCurrencyEdit;
    TaAgrupar: TsTabSheet;
    sPanel7: TsPanel;
    Shape10: TShape;
    sLabel10: TsLabel;
    Shape6: TShape;
    sLabel9: TsLabel;
    dgPedidosAgrupar: Tdbgrid;
    sPanel6: TsPanel;
    DBMemo2: TDBMemo;
    sPanel4: TsPanel;
    sDBGrid2: Tdbgrid;
    sPanel1: TsPanel;
    q_pedidos_agrupar: TIBOQuery;
    ds_pedidos_agrupar: TDataSource;
    q_itens: TIBOQuery;
    q_itensID: TIntegerField;
    q_itensNUMDOC: TIntegerField;
    q_itensPRODUTO: TStringField;
    q_itensQTD: TBCDField;
    q_itensPRECO: TBCDField;
    q_itensSUB_TOTAL: TBCDField;
    q_itensNR_PEDIDO_PALM: TStringField;
    q_itensPRECO_BRUTO: TBCDField;
    q_itensPERC_DESC: TIBOFloatField;
    q_itensVOLUME: TBCDField;
    q_itensQTD_ESTOQUE: TBCDField;
    ds_itens: TDataSource;
    q_pedidos_agruparNUMDOC: TIntegerField;
    q_pedidos_agruparDTADOC: TDateField;
    q_pedidos_agruparCOD_CLIENTE: TIntegerField;
    q_pedidos_agruparCLIENTE: TStringField;
    q_pedidos_agruparTOT_BRUTO: TBCDField;
    q_pedidos_agruparTOT_LIQUIDO: TBCDField;
    q_pedidos_agruparREPRESENTANTE: TStringField;
    q_pedidos_agruparOBSERVACOES_PEDIDO: TMemoField;
    q_pedidos_agruparAGRUPADO: TStringField;
    ckAgrupar: TsDBCheckBox;
    sLabel11: TsLabel;
    ckSemDev: TsCheckBox;
    I1: TMenuItem;
    stOrigem: TJvBehaviorLabel;
    btnExportaFrente: TsBitBtn;
    MePrecoBase: TsDBCalcEdit;
    lbPrecoBase: TsLabel;
    mmVendas2PRECO_BASE: TFloatField;
    BtnEnviarPedido: TsBitBtn;
    sLabel2: TsLabel;
    PrValorDescontoAdic: TsCurrencyEdit;
    mmVendas2DESCONTO_VALOR: TFloatField;
    lbDescValor: TsLabel;
    Medesconto_Valor: TsDBCalcEdit;
    XPManifest1: TXPManifest;
    lbBC_ST: TsLabel;
    lb_valor_st: TsLabel;
    mmVendas2NAO_VALIDAR_MARGEM: TStringField;
    BtAltTransp: TsBitBtn;
    I2: TMenuItem;
    M1: TMenuItem;
    sPageControl1: TsPageControl;
    TabDadosNFE: TsTabSheet;
    GroupBox9: TsGroupBox;
    gbChaveNfe: TsGroupBox;
    PrChave_NFe: TsEdit;
    gbReciboNfe: TsGroupBox;
    PrRECIBO_NFE: TsEdit;
    gbMotivo: TsGroupBox;
    PrMotivo_nfe: TsEdit;
    GbStat: TsGroupBox;
    PrStatus_Nfe: TsEdit;
    gbProtocolo: TsGroupBox;
    PrPROTOCOLO_NFE: TsEdit;
    gbDigest: TsGroupBox;
    PrDIGEST_NFE: TsEdit;
    gbDataRecNFe: TsGroupBox;
    PrDATA_REC_NFE: TDateTimePicker;
    gbCancNfe: TsGroupBox;
    lbStatusCancel: TsLabel;
    sLabel1: TsLabel;
    lbMotivo: TsLabel;
    PrJUSTIF_CANC_NFE: TsEdit;
    BtnEnviarCancelamentoNFe: TsBitBtn;
    BtnEditarCancelamentoNFe: TsBitBtn;
    BtnSairCancelamentoNFe: TsBitBtn;
    PrMOTIVO_NFE_CANCEL_INTERNO: TsComboEdit;
    BtnDanfe: TsBitBtn;
    BtnEmailNFe: TsBitBtn;
    btRecXml: TsBitBtn;
    sbClonar: TsBitBtn;
    TabCCe: TsTabSheet;
    gbCC: TsGroupBox;
    PrCartaCorrecao: TsEdit;
    BtnEnviarCC: TsBitBtn;
    BtnEditarCC: TsBitBtn;
    BtnCancelarCC: TsBitBtn;
    dgCCe: Tdbgrid;
    q_cce: TIBOQuery;
    ds_cce: TDataSource;
    q_cceID: TIntegerField;
    q_cceCARTACORRECAO: TStringField;
    sbDANFCe: TsBitBtn;
    procedure ChecarBoletoEmpresa(cc, empresa: string);
    procedure Prcod_clienteButtonClick(Sender: TObject);
    procedure Prcod_clienteKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_representanteButtonClick(Sender: TObject);
    procedure Prcod_representanteKeyPress(Sender: TObject; var Key: Char);
    procedure Prempresa_faturarButtonClick(Sender: TObject);
    procedure Prempresa_faturarKeyPress(Sender: TObject;
      var Key: Char);
    procedure Prcod_transportadoraButtonClick(Sender: TObject);
    procedure Prcod_transportadoraExit(Sender: TObject);
    procedure Prcod_transportadoraKeyPress(Sender: TObject;
      var Key: Char);
    procedure AtivaJanela;
    procedure btaltClick(Sender: TObject);
    procedure PrdtadocKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_representanteExit(Sender: TObject);
    procedure Prcod_clienteExit(Sender: TObject);
    procedure Prcod_fopButtonClick(Sender: TObject);
    procedure Prcod_fopKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_prazo_pgtoButtonClick(Sender: TObject);
    procedure Prcod_prazo_pgtoKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_fopExit(Sender: TObject);
    procedure Prcod_prazo_pgtoExit(Sender: TObject);
    procedure Prempresa_faturarExit(Sender: TObject);
    procedure btnovClick(Sender: TObject);
    procedure Mecod_produtoKeyPress(Sender: TObject; var Key: Char);
    procedure Mecod_produtoButtonClick(Sender: TObject);
    procedure Mecod_produtoExit(Sender: TObject);
    procedure btgraClick(Sender: TObject);
    procedure MeqtdExit(Sender: TObject);
    procedure MedescontoExit(Sender: TObject);
    procedure MeprecoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SgProSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SgProCellsChanged(Sender: TObject; R: TRect);
    procedure SgProClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure Meid_corButtonClick(Sender: TObject);
    procedure Meid_corKeyPress(Sender: TObject; var Key: Char);
    procedure Meid_TamanhoButtonClick(Sender: TObject);
    procedure Meid_TamanhoKeyPress(Sender: TObject; var Key: Char);
    procedure Meid_TamanhoExit(Sender: TObject);
    procedure Meid_corExit(Sender: TObject);
    procedure btcanClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Prcontato_freteKeyPress(Sender: TObject; var Key: Char);
    procedure bt_faturarClick(Sender: TObject);
    procedure BtnovpedClick(Sender: TObject);
    procedure BtaltpedClick(Sender: TObject);
    procedure BtgrapedClick(Sender: TObject);
    procedure BtcanpedClick(Sender: TObject);
    procedure BtlocpedClick(Sender: TObject);
    procedure imprimirLotedePedidos1Click(Sender: TObject);
    procedure Btgrava_cr1Click(Sender: TObject);
    procedure Btinsere_chequeClick(Sender: TObject);
    procedure EnviarDadosparaDispositivo1Click(Sender: TObject);
    procedure DesfaturarPedido1Click(Sender: TObject);
    procedure Prtot_liquidoChange(Sender: TObject);
    procedure MeprecoChange(Sender: TObject);
    procedure Crcod_fopKeyPress(Sender: TObject; var Key: Char);
    procedure Crcod_fopButtonClick(Sender: TObject);
    procedure Crcod_fopExit(Sender: TObject);
    procedure ImprimirEtiquetadeTransporte1Click(Sender: TObject);
    procedure ReceberDados1Click(Sender: TObject);
    procedure BtexcpedClick(Sender: TObject);
    procedure btexcClick(Sender: TObject);
    procedure RDIMPNOTNewPage(Sender: TObject; Pagina: Integer);
    procedure Prcod_fiscalButtonClick(Sender: TObject);
    procedure Prcod_fiscalExit(Sender: TObject);
    procedure Prcod_fiscalKeyPress(Sender: TObject; var Key: Char);
    procedure BtnNFEClick(Sender: TObject);
    procedure BtnEditarCancelamentoNFeClick(Sender: TObject);
    procedure BtnSairCancelamentoNFeClick(Sender: TObject);
    procedure BtnEnviarCancelamentoNFeClick(Sender: TObject);
    procedure BtnDanfeClick(Sender: TObject);
    procedure PrJUSTIF_CANC_NFEChange(Sender: TObject);
    procedure Prcod_supervisorKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_supervisorExit(Sender: TObject);
    procedure Prcod_supervisorButtonClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Prcod_fornecedorExit(Sender: TObject);
    procedure Prcod_fornecedorButtonClick(Sender: TObject);
    procedure FaturamentoAvulso1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Mecod_produtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MeTrib_ICMSExit(Sender: TObject);
    procedure Meipi_itemExit(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1MouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure DBGrid1MouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure Mecod_fiscal_itemButtonClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Meicms_itemExit(Sender: TObject);
    procedure cancelamento_avulso;
    procedure CancelamentoAvulso1Click(Sender: TObject);
    procedure ChecarFaturamentoLiquido(liquido, custo: double);
    procedure ImprimirPedidoDetalhado1Click(Sender: TObject);
    procedure fR_RELATORIOGetValue(const VarName: string;
      var Value: Variant);
    procedure BtnMaisPrecosClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure q_vendas1BeforeOpen(IB_Dataset: TIB_Dataset);
    procedure q_vendas2BeforeOpen(IB_Dataset: TIB_Dataset);
    procedure q_fotoBeforeOpen(IB_Dataset: TIB_Dataset);
    procedure q_fotoAfterClose(IB_Dataset: TIB_Dataset);
    procedure Prcod_clienteChange(Sender: TObject);
    procedure MedescontoEnter(Sender: TObject);
    procedure BtnAltFormaPrazoClick(Sender: TObject);
    procedure BtnBoletoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Mecod_produtoChange(Sender: TObject);
    procedure Mecod_produtoEnter(Sender: TObject);
    procedure PrCONTA_BOLETOButtonClick(Sender: TObject);
    procedure PrCONTA_BOLETOExit(Sender: TObject);
    procedure FaturamentoAvulso2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnEmailNFeClick(Sender: TObject);
    procedure BtnEmailPedidoClick(Sender: TObject);
    procedure MeqtdKeyPress(Sender: TObject; var Key: Char);
    procedure MevolumeKeyPress(Sender: TObject; var Key: Char);
    procedure MePreco_vendaKeyPress(Sender: TObject; var Key: Char);
    procedure MedescontoKeyPress(Sender: TObject; var Key: Char);
    procedure MeprecoKeyPress(Sender: TObject; var Key: Char);
    procedure Mesub_totalKeyPress(Sender: TObject; var Key: Char);
    procedure Meicms_itemKeyPress(Sender: TObject; var Key: Char);
    procedure Mevlr_icms_itemKeyPress(Sender: TObject; var Key: Char);
    procedure Meipi_itemKeyPress(Sender: TObject; var Key: Char);
    procedure Mevlr_ipi_itemKeyPress(Sender: TObject; var Key: Char);
    procedure BtnEditarCCClick(Sender: TObject);
    procedure BtnEnviarCCClick(Sender: TObject);
    procedure PrCartaCorrecaoChange(Sender: TObject);
    procedure BtnEtiquetaClick(Sender: TObject);
    procedure PrMOTIVO_NFE_CANCEL_INTERNOButtonClick(Sender: TObject);
    procedure PrMOTIVO_NFE_CANCEL_INTERNOExit(Sender: TObject);
    procedure MedescontoChange(Sender: TObject);
    procedure btAltRepClick(Sender: TObject);
    procedure btRecXmlClick(Sender: TObject);
    procedure btnNfeDevClick(Sender: TObject);
    procedure btRecXml_DevClick(Sender: TObject);
    procedure BtnDanfe_DevClick(Sender: TObject);
    procedure BtnEmailBoletoClick(Sender: TObject);
    procedure BtnEditarCancelamentoNFeDevClick(Sender: TObject);
    procedure BtnEnviarCancelamentoNFeDevClick(Sender: TObject);
    procedure sbClonarClick(Sender: TObject);
    procedure Q2SAfterClose(DataSet: TDataSet);
    procedure Q2SBeforeOpen(DataSet: TDataSet);
    procedure q_vendas1AfterClose(IB_Dataset: TIB_Dataset);
    procedure q_vendas2AfterClose(IB_Dataset: TIB_Dataset);
    procedure q_cr1AfterScroll(DataSet: TDataSet);
    procedure q_cr1BeforeOpen(DataSet: TDataSet);
    procedure q_cr1AfterClose(DataSet: TDataSet);
    procedure cbEmpresaChange(Sender: TObject);
    procedure cbMesChange(Sender: TObject);
    procedure PrJUSTIF_CANC_NFE_DEVChange(Sender: TObject);
    procedure dgPedidosAgruparDblClick(Sender: TObject);
    procedure dgPedidosAgruparDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dgPedidosAgruparEnter(Sender: TObject);
    procedure dgPedidosAgruparKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dgPedidosAgruparKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dgPedidosAgruparCellClick(Column: TColumn);
    procedure q_pedidos_agruparAfterClose(DataSet: TDataSet);
    procedure ckSemDevClick(Sender: TObject);
    procedure I1Click(Sender: TObject);
    procedure btnExportaFrenteClick(Sender: TObject);
    procedure MePrecoBaseKeyPress(Sender: TObject; var Key: Char);
    procedure MePrecoBaseExit(Sender: TObject);
    procedure Prtot_liquidoExit(Sender: TObject);
    procedure BtnEnviarPedidoClick(Sender: TObject);
    procedure PrValorDescontoAdicExit(Sender: TObject);
    procedure Medesconto_ValorKeyPress(Sender: TObject; var Key: Char);
    procedure Medesconto_ValorExit(Sender: TObject);
    procedure BtAltTranspClick(Sender: TObject);
    procedure M1Click(Sender: TObject);
    procedure I2Click(Sender: TObject);
    procedure sbDANFCeClick(Sender: TObject);
    procedure q_cceAfterOpen(DataSet: TDataSet);
  private
    procedure readonly_false(prefixo: ShortString);
    procedure readonly_true(prefixo: ShortString);
    procedure limpa_campos(prefixo: ShortString);

    procedure monta_sgpro;
    procedure totaliza_pedido;
    procedure busca_produto_unitario(leitor: boolean; cod_barras: string);
    procedure dados_produto(cod_produto: string);
    procedure scroll_sgpro;
    procedure mostra_campos(prefixo: string);
    procedure carrega_venda_avulsa(id: string);
    procedure somaTotal;
    function VerificaEstoqueParaFaturar(cod_produto: string): Boolean;
    {Verifica se existe quantidade suficiente no estoque para faturar o Pedido}
    function VerificaFaturaVencida(cod_cliente: string): Boolean;
    { Private declarations }
    procedure ImprimePedido;
    procedure cancelar_faturamento(usuario_desfaturou, motivo: string);
    procedure MontaEtiquetaTransp(numdoc: string; coluna: integer);
    procedure DeletaLinha(Linha: Integer);
    procedure CalculoIcmsItem;
    procedure AtualizaCalculoIcmsItem(sub_total, icms_item: double; id, ncm,
      cst: string);
    function Faturado: boolean;
    procedure MontaArquivoCobrancaBradescoEnvio;
    procedure BloquearPedido(pedido: string);
    procedure LiberarPedido(pedido: string);
    procedure AtualizaTotais(status: string);
    procedure ImprimirDanfe(chave: string);
    function TodosPromocao: Boolean;
    procedure CarregaTotaisEmpresa;
    function ClienteAceitaSimples: boolean;
    function ChecarPedidoLiberado: boolean;
    function ChecarLiberacao: boolean;
    procedure ControleBoleto;
    procedure ChecarDuplicidadePedido;
    procedure CalcularDesconto;
    function ChecarDadosPedido: boolean;
    procedure ImprimirPedidosAnteriores;
    procedure StatusPedido;
    procedure CarregaDadosAgrupar(cliente, numdoc: string);
    procedure CarregaDadosItem(numdoc: string);
    procedure AgrupaPedidos;
    function LimparBoletos: boolean;
    function VerificarMargem: boolean;
    function ChecarProdutoNoPedido(produto: integer): boolean;
    procedure ListarItensPedidos;
    procedure ChecarItensPedidos;
    function ChecarDataUltConsultaSerasa: boolean;
    procedure ChecaCFOP;
    function ValidarDesconto: boolean;
    procedure CFOPTROCA;
    procedure PromocaoPorQuantidade(quantidade: string);
    procedure Imprimir(pedido: string);
  public
    agrupar_pedidos, empresa_simples, cliente_aceita_simples,
      obrigatoriedade_peso, representacao, industria: boolean;
    nfe_duplicada: Boolean;
    modo_insert: Boolean;
    modo_insert_me: Boolean;
    checar_qtd: Boolean;
    venda: Boolean;
    linMax: integer;
    MVA, Aliquota_ICMS_Interno: Double; //Margem de Valor Agregado.
    acao: ShortString;
    id_mercadoria, id_pedido, UF_Cliente, UF_Emissor: string;
    desconto_maximo: string;
    qtd_anterior: real;

    margem_lucro_ideal: real;
    margem_lucro_minima: real;
    margem_lucro: real;
    indice_acima: real;
    indice_abaixo: real;
    comissao_fixa: real;
    desconto_anterior: real;
    total_liquido_anterior: real;

    //variável que informa a qtd do produto antes da alteração...
    campo_pesquisado, dado_pesquisado: string;
    busca_qualquer_posicao_pesquisada: boolean;
    itens_repetidos: boolean;

    procedure insere_sgpro(tipo: string);
    procedure CalculaSubTotais;
    procedure ativa_vendas1(id: string);
    procedure DadosCCe;
    procedure ativa_vendas2(nr_documento: string);
    //carrega a Queryu com todos os produtos da Venda
    procedure ativa_cr1(numdoc: string);
    procedure mostra_cr1(numdoc: string);
    procedure CarregaDados;
    procedure carrega_vendas2;
    procedure mostra_campos_vendas1(prefixo: string);
    procedure gravar_liberacao_desconto(usuario, motivo: string);

    procedure mensagem_SB_vendas;
    //mostra as mensagen que fica no statubar do vendas
    procedure faturar(nr_documento, cod_cliente, cod_fop, cod_prazo: string;
      valor_total: real; NFe: boolean);

    procedure MontaPedido(n_pedido: string);
    procedure MontaNF(n_pedido: string);

    procedure MontaArquivoEnvio(nom_arquivo: string);
    procedure MontaArquivoCobrancaEnvio;
    //Monta Arquivo de Envio para os Palms
    procedure TrataArquivoRecebimento(nom_arquivo: string);
    //trata o arquivo recebido dos palms
    procedure CheckStatusNFe;
    function AjustaStr(str: string; tam: Integer): string;
    procedure CarregaFoto(produto: string);
    procedure LimpaDescLucro;
    function CalculoComissao: Real;
    procedure ClonarPedidoCancelado;
    function ChecarDadosCliente: boolean;
    function ChecarDadosTransportadora: boolean;
    procedure GerarParcelas(nr_documento, cod_cliente, cod_fop, cod_prazo:
      string; valor_total: real; NFe: boolean);
    function ChecarEmailCliente(cliente, tipo: string): boolean;
    function ChecarBoletoNFE(cc, nfe: string): boolean;
  end;

const
  sql_nota =
    'SELECT ' +
    '  C.NOM_CLIENTE, ' +
    '  C.CPF, ' +
    '  C.CNPJ, ' +
    '  C.ENDERECO, ' +
    '  C.NR_ENDERECO, ' +
    '  C.BAIRRO, ' +
    '  C.CEP, ' +
    '  C.TELEFONE, ' +
    '  C.RG, ' +
    '  C.IE, ' +
    ' ' +
    '  CD.NOM_CIDADE AS CID_CLI, ' +
    '  CD.UF, ' +
    ' ' +
    '  V1.NUMDOC, ' +
    '  V1.NF, ' +
    '  V1.TOT_LIQUIDO, ' +
    '  V1.TIPO_FRETE, ' +
    '  V1.VOLUME_NOTA, ' +
    '  V1.PESO_NOTA, ' +
    '  V1.OBSERVACOES_NOTA, ' +
    '  V1.DTA_SAIDA, ' +
    '  V1.COD_FISCAL, ' +
    '  V1.DTA_EMISSAO, ' +
    '  V1.VLR_BC_ICMS, ' +
    '  V1.VLR_ICMS, ' +
    '  V1.VLR_IPI, ' +
    '  V1.CARTACORRECAO, ' +
    ' ' +
    '  CT.NOM_CIDADE AS CID_TRANSPORTADORA, ' +
    '  CT.UF AS UF_TRANSPORTADORA, ' +
    ' ' +
    '  FP.NOM_FOP, ' +
    '  TR.COD_TRANSPORTADORA, ' +
    '  TR.NOME AS NOM_TRANSPORTADORA, ' +
    '  TR.ENDERECO AS END_TRA, ' +
    '  TR.CNPJ AS CNPJ_TRA, ' +
    '  TR.IE AS IE_TRA, ' +
    '  TR.PLACA, ' +
    '  TR.MOTORISTA, ' +
    ' ' +
    '  CF.NOME AS NOM_CFOP, ' +
    ' ' +
    '  SUM(V2.VLR_BC_ST) AS VLR_BC_ST, ' +
    '  SUM(V2.VLR_ICMS_ST) AS VLR_ICMS_ST ' +
    'FROM VENDAS1 V1 ' +
    'INNER JOIN VENDAS2 V2 ON (V1.NUMDOC = V2.NUMDOC) ' +
    'LEFT JOIN CLIENTE C ON C.COD_CLIENTE = V1.COD_CLIENTE ' +
    'LEFT JOIN CIDADES CD ON CD.COD_CIDADE = C.COD_CIDADE ' +
    'LEFT JOIN TRANSPORTADORA TR ON TR.COD_TRANSPORTADORA=V1.COD_TRANSPORTADORA ' +
    'LEFT JOIN COD_FISCAL CF ON CF.COD_FISCAL=V1.COD_FISCAL ' +
    'LEFT JOIN CIDADES CT ON CT.COD_CIDADE=TR.COD_CIDADE ' +
    'LEFT JOIN FOP FP ON (FP.COD_FOP=V1.COD_FOP) ';
  sql_grupo_nota =
    'GROUP BY' +
    '  C.NOM_CLIENTE, ' +
    '  C.CPF, ' +
    '  C.CNPJ, ' +
    '  C.ENDERECO, ' +
    '  C.NR_ENDERECO, ' +
    '  C.BAIRRO, ' +
    '  C.CEP, ' +
    '  C.TELEFONE, ' +
    '  C.RG, ' +
    '  C.IE, ' +
    ' ' +
    '  CD.NOM_CIDADE, ' +
    '  CD.UF, ' +
    ' ' +
    '  V1.NUMDOC, ' +
    '  V1.NF, ' +
    '  V1.TOT_LIQUIDO, ' +
    '  V1.TIPO_FRETE, ' +
    '  V1.VOLUME_NOTA, ' +
    '  V1.PESO_NOTA, ' +
    '  V1.OBSERVACOES_NOTA, ' +
    '  V1.DTA_SAIDA, ' +
    '  V1.COD_FISCAL, ' +
    '  V1.DTA_EMISSAO, ' +
    '  V1.VLR_BC_ICMS, ' +
    '  V1.VLR_ICMS, ' +
    '  V1.VLR_IPI, ' +
    ' ' +
    '  CT.NOM_CIDADE, ' +
    '  CT.UF, ' +
    ' ' +
    '  FP.NOM_FOP, ' +
    '  TR.COD_TRANSPORTADORA, ' +
    '  TR.NOME, ' +
    '  TR.ENDERECO, ' +
    '  TR.CNPJ, ' +
    '  TR.IE, ' +
    '  TR.PLACA, ' +
    '  TR.MOTORISTA, ' +
    ' ' +
    '  CF.NOME ';
  sql_nota_dev =
    'SELECT ' +
    '  C.RAZAO_SOCIAL as NOM_CLIENTE, ' +
    '  C.CNPCPF AS CPF, ' +
    '  C.CNPCPF AS CNPJ, ' +
    '  C.ENDERECO, ' +
    '  C.NR_ENDERECO, ' +
    '  C.BAIRRO, ' +
    '  C.CEP, ' +
    '  C.FONE AS TELEFONE, ' +
    '  C.IERG AS RG, ' +
    '  C.IERG AS IE, ' +
    ' ' +
    '  CD.NOM_CIDADE AS CID_CLI, ' +
    '  CD.UF, ' +
    ' ' +
    '  V1.NUMDOC, ' +
    '  V1.NF, ' +
    '  V1.TOT_LIQUIDO, ' +
    '  V1.TIPO_FRETE, ' +
    '  V1.VOLUME_NOTA, ' +
    '  V1.PESO_NOTA, ' +
    '  V1.OBSERVACOES_NOTA, ' +
    '  V1.DTA_SAIDA, ' +
    '  V1.COD_FISCAL, ' +
    '  V1.DTA_EMISSAO, ' +
    '  V1.VLR_BC_ICMS, ' +
    '  V1.VLR_ICMS, ' +
    '  V1.VLR_IPI, ' +
    '  V1.CARTACORRECAO, ' +
    ' ' +
    '  CT.NOM_CIDADE AS CID_TRANSPORTADORA, ' +
    '  CT.UF AS UF_TRANSPORTADORA, ' +
    ' ' +
    '  FP.NOM_FOP, ' +
    '  TR.COD_TRANSPORTADORA, ' +
    '  TR.NOME AS NOM_TRANSPORTADORA, ' +
    '  TR.ENDERECO AS END_TRA, ' +
    '  TR.CNPJ AS CNPJ_TRA, ' +
    '  TR.IE AS IE_TRA, ' +
    '  TR.PLACA, ' +
    '  TR.MOTORISTA, ' +
    ' ' +
    '  CF.NOME AS NOM_CFOP, ' +
    ' ' +
    '  SUM(V2.VLR_BC_ST) AS VLR_BC_ST, ' +
    '  SUM(V2.VLR_ICMS_ST) AS VLR_ICMS_ST ' +
    'FROM VENDAS1 V1 ' +
    'INNER JOIN VENDAS2 V2 ON (V1.NUMDOC = V2.NUMDOC) ' +
    'LEFT JOIN FORNECEDOR C ON C.COD_FORNECEDOR = V1.COD_FORNECEDOR ' +
    'LEFT JOIN CIDADES CD ON CD.COD_CIDADE = C.COD_CIDADE ' +
    'LEFT JOIN TRANSPORTADORA TR ON TR.COD_TRANSPORTADORA=V1.COD_TRANSPORTADORA ' +
    'LEFT JOIN COD_FISCAL CF ON CF.COD_FISCAL=V1.COD_FISCAL ' +
    'LEFT JOIN CIDADES CT ON CT.COD_CIDADE=TR.COD_CIDADE ' +
    'LEFT JOIN FOP FP ON (FP.COD_FOP=V1.COD_FOP) ';
  sql_grupo_nota_dev =
    'GROUP BY' +
    '  C.RAZAO_SOCIAL, ' +
    '  C.CNPCPF, ' +
    '  C.ENDERECO, ' +
    '  C.NR_ENDERECO, ' +
    '  C.BAIRRO, ' +
    '  C.CEP, ' +
    '  C.FONE, ' +
    '  C.IERG, ' +
    '  C.IERG, ' +
    ' ' +
    '  CD.NOM_CIDADE, ' +
    '  CD.UF, ' +
    ' ' +
    '  V1.NUMDOC, ' +
    '  V1.NF, ' +
    '  V1.TOT_LIQUIDO, ' +
    '  V1.TIPO_FRETE, ' +
    '  V1.VOLUME_NOTA, ' +
    '  V1.PESO_NOTA, ' +
    '  V1.OBSERVACOES_NOTA, ' +
    '  V1.DTA_SAIDA, ' +
    '  V1.COD_FISCAL, ' +
    '  V1.DTA_EMISSAO, ' +
    '  V1.VLR_BC_ICMS, ' +
    '  V1.VLR_ICMS, ' +
    '  V1.VLR_IPI, ' +
    '  V1.CARTACORRECAO, ' +
    ' ' +
    '  CT.NOM_CIDADE, ' +
    '  CT.UF, ' +
    ' ' +
    '  FP.NOM_FOP, ' +
    '  TR.COD_TRANSPORTADORA, ' +
    '  TR.NOME, ' +
    '  TR.ENDERECO, ' +
    '  TR.CNPJ, ' +
    '  TR.IE, ' +
    '  TR.PLACA, ' +
    '  TR.MOTORISTA, ' +
    ' ' +
    '  CF.NOME ';
var
  Fr_vendas_industria2: TFr_vendas_industria2;
  localizar_acionado, carregando_item, cliente_alterado, cliente_bloqueado,
    cliente_com_pendencia,
    habilita_faturamento, cliente_isento_icms, cliente_consumidor_final,
    cliente_sem_ie, mostra,
    produto_alterado, cliente_pre_cadastrado, representante_funcionario,
    GravarPedido, aviso_conta_boleto, promocao_desconto: boolean;
  cliente_anterior, produto_anterior, cst, cesta_basica, supervisor, id,
    id_item, perc_comissao, pedido_tablet,
    vlr_comissao, id_remessa, sql_vendas2, carteira_conta, conta_boleto,
    empresa_faturar, usuario_liberou_desconto, situacaoTm, statusTm: string;
  origem_tipo, dias_protesto: integer;
  WindowList: Pointer;
  desconto_prazo, desconto_forma: real;
  ListaItens: array of integer;
  LiberaItemRepetido, Pedido_AVista, gerar_cr, liberar_margem: boolean;
  modelo_desconto: integer;
  UltConsSerasa: TDate;
  Boleto_Avalista: string;

implementation

uses Un_localizar, UnPri, Un_dao, Un_dados_cliente, UnFun, un_conexao_vendor,
  Un_imp_pedidos_lote, Un_cheque_terceiros, un_frente_caixa,
  UnSenha_especial, frmMontaXML, Math, nfe_v200, un_dm,
  un_nfe_transmissao, Un_nfe_envio_lote, un_motivo, un_mais_precos,
  Un_splash, Un_Cliente, Un_Transportadora, un_definir_saldo_inicial,
  ACBrNFeWebServices, pcnProcNFe, un_email_envio, pcnNFe,
  un_escolhe_impressora_termica, un_nfe, VMXCCePrint1;

{$R *.dfm}

procedure TFr_vendas_industria2.Prcod_clienteButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  //guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Cliente';
  chamou_pesquisa := 'fr_cliente';
  chamou_form := 'fr_pedido_cliente';
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
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(campos_combo[i]);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_vendas_industria2.Prcod_clienteKeyPress(Sender: TObject; var Key:
  Char);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin
  if not (key in ['0'..'9', #8]) and (key <> #13) then
  begin
    beep; {somente delphi 2.0 ou >}
    key := #0;
  end;

  if key = #13 then
  begin
    if Prcod_cliente.Text = '' then
      Prcod_clienteButtonClick(Self);

    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_vendas_industria2.Prcod_representanteButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  //guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Representante';

  chamou_pesquisa := 'fr_representante';
  chamou_form := 'fr_pedido_representante';
  chamou_cadastro := 'fr_representante';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Represenante';

  if tipo_usuario < '4' then
    Fr_localizar.BT_cadastro.Visible := false
  else
    Fr_localizar.BT_cadastro.Visible := true;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 5);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'Empresa';
  Campos_combo[3] := 'CNPJ';
  Campos_combo[4] := 'CPF';

  for i := 0 to 4 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;

  Fr_localizar.CBcampos.ItemIndex := 1;

  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_vendas_industria2.Prcod_representanteKeyPress(Sender: TObject;
  var Key: Char);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin
  if not (key in ['0'..'9', #8]) and (key <> #13) then
  begin
    beep; {somente delphi 2.0 ou >}
    key := #0;
  end;

  if key = #13 then
  begin
    if (Prcod_representante.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Representante';

      chamou_pesquisa := 'fr_representante';
      chamou_form := 'fr_pedido_representante';
      chamou_cadastro := 'fr_representante';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Represenante';

      if tipo_usuario < '4' then
        Fr_localizar.BT_cadastro.Visible := false
      else
        Fr_localizar.BT_cadastro.Visible := true;

      //preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo, 5);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Nome';
      Campos_combo[2] := 'Empresa';
      Campos_combo[3] := 'CNPJ';
      Campos_combo[4] := 'CPF';

      for i := 0 to 4 do
      begin
        valor_combo := campos_combo[i];
        Fr_localizar.CBcampos.Items.Add(valor_combo);
      end;

      Fr_localizar.CBcampos.ItemIndex := 1;

      Fr_localizar.ShowModal;
      Fr_localizar.Free;

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;
    end;
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_vendas_industria2.Prempresa_faturarButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  //guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Empresa';
  chamou_pesquisa := 'fr_empresa';
  chamou_form := 'fr_pedido_empresa';
  chamou_cadastro := 'Fr_empresa';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Empresa';
  Fr_localizar.BT_cadastro.Visible := false;

  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';

  for i := 0 to 1 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(campos_combo[i]);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_vendas_industria2.Prempresa_faturarKeyPress(Sender: TObject;
  var Key: Char);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  if not (key in ['0'..'9', #8]) and (key <> #13) then
  begin
    beep; {somente delphi 2.0 ou >}
    key := #0;
  end;

  if key = #13 then
  begin
    if (Prempresa_faturar.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Empresa';
      chamou_pesquisa := 'fr_empresa';
      chamou_form := 'fr_pedido_empresa';
      chamou_cadastro := 'Fr_empresa';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Empresa';
      Fr_localizar.BT_cadastro.Visible := false;

      SetLength(Campos_combo, 2);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Nome';

      for i := 0 to 1 do
      begin
        valor_combo := campos_combo[i];
        Fr_localizar.CBcampos.Items.Add(campos_combo[i]);
      end;
      Fr_localizar.CBcampos.ItemIndex := 1;

      Fr_localizar.ShowModal;
      Fr_localizar.Free;

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;

    end;
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_vendas_industria2.Prcod_transportadoraButtonClick(Sender:
  TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  //guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Transportadora';
  chamou_pesquisa := 'fr_transportadora';
  chamou_form := 'fr_pedido_transportadora';
  chamou_cadastro := 'Fr_transportadora';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Transportadoras';
  Fr_localizar.BT_cadastro.Visible := true;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';

  for i := 0 to 1 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  Fr_localizar.ShowModal;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_vendas_industria2.Prcod_transportadoraExit(Sender: TObject);
begin
  if trim(Prcod_transportadora.Text) = '' then
    LbNom_transportadora.Caption := '...';

  Prpeso_nota.Value := edPesoTotal.Value;

  if Prcod_transportadora.Text <> '' then
  begin
    dao.Geral2('select nome, interno from transportadora where cod_transportadora=' +
      QuotedStr(Prcod_transportadora.Text));
    if dao.q2.RecordCount > 0 then
    begin
      LbNom_transportadora.Caption := dao.Q2.fieldbyname('nome').AsString;

      if dao.Q2.fieldbyname('interno').AsString = 'N' then
        edDecTransp.Value := 30
      else
        edDecTransp.Value := 0;

      Prpeso_nota.Value := edPesoTotal.Value - (edPesoTotal.Value *
        (edDecTransp.Value / 100))
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

procedure TFr_vendas_industria2.Prcod_transportadoraKeyPress(Sender: TObject;
  var Key: Char);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin

  if not (key in ['0'..'9', #8]) and (key <> #13) then
  begin
    beep; {somente delphi 2.0 ou >}
    key := #0;
  end;

  if key = #13 then
  begin
    if (Prcod_transportadora.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Transportadora';
      chamou_pesquisa := 'fr_transportadora';
      chamou_form := 'fr_pedido_transportadora';
      chamou_cadastro := 'Fr_transportadora';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 +
        'Transportadoras';
      Fr_localizar.BT_cadastro.Visible := true;

      //preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo, 2);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Nome';

      for i := 0 to 1 do
      begin
        valor_combo := campos_combo[i];
        Fr_localizar.CBcampos.Items.Add(valor_combo);
      end;
      Fr_localizar.CBcampos.ItemIndex := 1;

      Fr_localizar.ShowModal;

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;
    end;
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_vendas_industria2.readonly_false(prefixo: ShortString);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TRxDBComboEdit then
        TRxDBComboEdit(Components[i]).Enabled := true
      else if Components[i] is TsDBEdit then
        TsDBEdit(Components[i]).Enabled := true
      else if Components[i] is TsDBCalcEdit then
      begin
        TsDBCalcEdit(Components[i]).ReadOnly := false;
        TsDBCalcEdit(Components[i]).Enabled := true;
        TsDBCalcEdit(Components[i]).Button.Enabled := true;
      end
      else if Components[i] is TsEdit then
        TsEdit(Components[i]).Enabled := true
      else if Components[i] is tscheckbox then
        tscheckbox(components[i]).Enabled := true
      else if Components[i] is TsDateEdit then
        TsDateEdit(components[i]).Enabled := true
      else if Components[i] is TsComboEdit then
        TsComboEdit(components[i]).Enabled := true
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(components[i]).Enabled := true
      else if Components[i] is TMaskEdit then
        TMaskEdit(components[i]).Enabled := true
      else if Components[i] is TComboBox then
        TComboBox(components[i]).Enabled := true
      else if Components[i] is TsRichEdit then
        TsRichEdit(components[i]).Enabled := true;
    end;
  end;
  // Dados da NF-e sempre somente leitura...
  PrChave_NFe.ReadOnly := true;
  PrChave_NFe.Enabled := true;
  PrRecibo_NFe.ReadOnly := true;
  PrDigest_NFe.ReadOnly := true;
  PrProtocolo_NFe.ReadOnly := true;
  PrValorDescontoAdic.ReadOnly := true;
  PrData_Rec_NFe.Enabled := false;
  //PrValorDescontoAdic.ReadOnly := false;
  PrStatus_NFe.ReadOnly := true;
  PrMotivo_NFe.ReadOnly := true;

  Dbgrid1.Enabled := false;
  MePreco_venda.ReadOnly := true;
end;

procedure TFr_vendas_industria2.readonly_true(prefixo: ShortString);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TRxDBComboEdit then
        TRxDBComboEdit(Components[i]).Enabled := false
      else if Components[i] is TsDBEdit then
        TsDBEdit(Components[i]).Enabled := false
      else if Components[i] is TsDBCalcEdit then
      begin
        TsDBCalcEdit(Components[i]).ReadOnly := true;
        TsDBCalcEdit(Components[i]).Enabled := false;
        TsDBCalcEdit(Components[i]).Button.Enabled := false;
      end
      else if Components[i] is TsEdit then
        TsEdit(Components[i]).Enabled := false
      else if Components[i] is tscheckbox then
        tscheckbox(components[i]).Enabled := false
      else if Components[i] is TsComboEdit then
        TsComboEdit(components[i]).Enabled := false
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(components[i]).Enabled := false
      else if Components[i] is TsDateEdit then
        TsDateEdit(components[i]).Enabled := false
      else if Components[i] is TMaskEdit then
        TMaskEdit(components[i]).Enabled := false
      else if Components[i] is TsRichEdit then
        TsRichEdit(components[i]).Enabled := false
      else if Components[i] is TComboBox then
        TComboBox(components[i]).Enabled := false;
    end;
  end;
  if mmVendas2.RecordCount > 0 then
    dbgrid1.Enabled := true;

  PrChave_NFe.ReadOnly := true;
  PrChave_NFe.Enabled := true;

end;

procedure TFr_vendas_industria2.limpa_campos(prefixo: ShortString);
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
        TsComboEdit(components[i]).Clear
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(components[i]).Clear
      else if Components[i] is TsDateEdit then
        TsDateEdit(components[i]).Clear
      else if Components[i] is TMaskEdit then
        TMaskEdit(components[i]).Clear
      else if Components[i] is TsRichEdit then
        TsRichEdit(components[i]).Clear
      else if Components[i] is TComboBox then
        TComboBox(components[i]).ItemIndex := 0;
    end;
  end;
  if prefixo = 'Pr' then
  begin
    Lbnom_representante.Caption := '...';
    Lbnom_supervisor.Caption := '...';
    Lbnom_Cliente.Caption := '...';
    Lbnom_fop.Caption := '...';
    Lbprazo_pgto.caption := '...';
    Lbempresa_faturamento.Caption := '...';
    LbNom_transportadora.Caption := '...';

  end
  else if prefixo = 'Me' then
  begin
    LbCor.Caption := '...';
    Lbtamanho.Caption := '...';
    zzunidade.Text := '';
    zzqtd_embalagem.Value := 0;
  end;
  stOrigem.Caption := '';
  I1.Enabled := false;
end;

procedure TFr_vendas_industria2.btaltClick(Sender: TObject);
var
  volume: Real;
begin
  //  GravarPedido := true;
  modo_insert_me := false;
  produto_alterado := false;
  checar_qtd := true;
  if Btnovped.Enabled = true then
  begin
    dao.msg('O Pedido está com Status Neutro, você deve Clicar no Botão Alterar ou Inserir!');
    exit;
  end;
  {
   modo_insert_me := false;
   readonly_false('Me');

   SgPro.Enabled := False;
   if modo_insert_me = false then
   begin
     qtd_anterior := Meqtd.Value;
     volume := Mevolume.Value / Meqtd.Value;
     Prvolume_nota.Value := Prvolume_nota.Value - volume;
   end
   else
     qtd_anterior := 0;
 }
  readonly_false('Me');

  if (FRPRI.TipUsu = '0') or (FRPRI.TipUsu = '1') or representacao then
  begin
    Mevolume.text := '1';
    Mevolume.Enabled := false
  end;

  if mform <> 'vendas_devolucoes' then
  begin
    Mecod_fiscal_item.Enabled := false;
    MeTrib_ICMS.Enabled := false;
  end;

  Mesub_total.ReadOnly := true;
  btnov.Enabled := false;
  btalt.Enabled := false;
  btgra.Enabled := true;
  btcan.Enabled := true;
  btexc.Enabled := false;
  qtd_anterior := mmVendas2QTD.Value;

  if not (mmVendas2.state in [dsBrowse]) then
    mmVendas2.Cancel;

  mmVendas2.Edit;
  Mecod_produto.SetFocus;

end;

procedure TFr_vendas_industria2.totaliza_pedido;
begin

end;

procedure TFr_vendas_industria2.PrdtadocKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;

  end;
end;

procedure TFr_vendas_industria2.Prcod_representanteExit(Sender: TObject);
begin
  if trim(Prcod_representante.Text) = '' then
    Lbnom_representante.Caption := '...';

  if Prcod_representante.Text <> '' then
  begin
    if (not FMFUN.verificaNumerico(Prcod_representante.Text)) and
      (length(Prcod_representante.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      Prcod_representante.SetFocus;
      exit;
    end;

    dao.Geral3('select nom_representante, funcionario, MARGEM_MINIMA, MARGEM_IDEAL, INDICE_ABAIXO, INDICE_ACIMA PERC_COMISSAO_FIXA from representante where ativo = ''S'' and funcionario in (''0'', ''1'', ''4'') and id=' + Prcod_representante.Text);
    if dao.q3.RecordCount > 0 then
    begin

      margem_lucro_ideal := dao.q3.fieldbyname('MARGEM_IDEAL').AsCurrency;
      margem_lucro_minima := dao.q3.fieldbyname('MARGEM_MINIMA').AsCurrency;
      indice_abaixo := dao.q3.fieldbyname('INDICE_ABAIXO').AsCurrency;
      indice_acima := dao.q3.fieldbyname('INDICE_ACIMA').AsCurrency;
      comissao_fixa := dao.q3.fieldbyname('PERC_COMISSAO_FIXA').AsCurrency;

      Lbnom_representante.Caption :=
        dao.Q3.fieldbyname('nom_representante').AsString;
      if dao.Q3.fieldbyname('funcionario').AsString = '1' then
        representante_funcionario := true
      else
        representante_funcionario := false;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_representante.Text := '';
      Prcod_representante.SetFocus;
      Exit;
    end;
  end;

end;

procedure TFr_vendas_industria2.AtualizaTotais(status: string);
begin

  if mmVendas2.recordcount = 0 then
    exit;

  LiberaItemRepetido := true;
  pc_vendas.TabIndex := 0;
  pnWait.Visible := true;
  WindowList := DisableTaskWindows(fm_splash.Handle);
  fm_splash.ggProgress.Progress := 0;
  fm_splash.ggProgress.MaxValue := mmVendas2.RecordCount;
  fm_splash.lbStatus.Caption := status;
  fm_splash.Show;
  fm_splash.refresh;
  mmVendas2.DisableControls;
  mmVendas2.First;
  carregando_item := true;
  while not mmVendas2.Eof do
  begin
    checar_qtd := false;
    mmVendas2.edit;

    if not faturado then
    begin
      mecod_produtoexit(self);
      btgraClick(self);
    end;

    fm_splash.ggProgress.AddProgress(1);
    fm_splash.Refresh;
    mmVendas2.next;
  end;
  carregando_item := false;
  mmVendas2.First;
  mmVendas2.EnableControls;
  EnableTaskWindows(WindowList);
  fm_splash.Hide;
  pnWait.Visible := false;
  LiberaItemRepetido := false;
end;

procedure TFr_vendas_industria2.Prcod_clienteExit(Sender: TObject);
var
  sql_cliente: string;
begin
  if trim(Prcod_cliente.Text) = '' then
    Lbnom_cliente.Caption := '...';
  if Prcod_cliente.Text <> '' then
  begin

    if (not FMFUN.verificaNumerico(Prcod_cliente.Text)) and
      (length(Prcod_cliente.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      Prcod_cliente.SetFocus;
      exit;
    end;

    sql_cliente := 'select c.nom_cliente, coalesce(c.UltConsSerasa, c.DTA_CAD_SPC) as UltConsSerasa, c.cliente_bloqueado, c.cnpj, c.pre_cadastro, cd.nom_cidade, c.id_representante, c.ACEITA_NOTA_SIMPLES, c.desconto_maximo, cd.uf, '
      +
      'CASE WHEN c.IE = ''ISENTO'' or c.IE = ''ISENTA'' THEN ''1'' ELSE CASE WHEN c.ie is null and c.TIP_PESSOA = ''J'' THEN ''2'' ELSE ''0'' END END AS ISENTO, c.consumidor_final ' +
      'from cliente c ' +
      'left join cidades cd on cd.cod_cidade=c.cod_cidade ' +
      'where c.cod_cliente=' + QuotedStr(Prcod_cliente.Text);

    if frpri.TipUsu = '0' then
    begin
      if not frpri.supervisor then
        sql_cliente := sql_cliente + ' and ID_REPRESENTANTE = ' +
          frpri.Representante_id
      else
        sql_cliente := sql_cliente +
          ' and ID_REPRESENTANTE in (select r.ID from REPRESENTANTE r where r.FUNCIONARIO in (0 , 1) and r.ATIVO = ''S'')  and c.cliente_bloqueado = ''N'' ';
    end;

    dao.Geral4(sql_cliente);

    if dao.q4.RecordCount > 0 then
    begin
      cliente_bloqueado := dao.Q4.fieldbyname('CLIENTE_BLOQUEADO').AsString =
        'S';

      UltConsSerasa := dao.Q4.fieldbyname('UltConsSerasa').AsDateTime;

      cliente_aceita_simples :=
        dao.Q4.fieldbyname('ACEITA_NOTA_SIMPLES').AsString = 'S';
      dao.Q4.Open;

      cliente_consumidor_final := dao.Q4.fieldbyname('consumidor_final').AsString
        = 'S';

      if (dao.Q4.fieldbyname('isento').AsString = '1') or
        (dao.Q4.fieldbyname('isento').AsString = '2') then
        cliente_isento_icms := true
      else
        cliente_isento_icms := false;

      if dao.Q4.fieldbyname('pre_cadastro').AsString = 'S' then
        cliente_pre_cadastrado := true
      else
        cliente_pre_cadastrado := false;

      if frpri.TeleVendas then
      begin
        if Prcod_representante.text <>
          dao.Q4.fieldbyname('id_representante').AsString then
          showmessage('Representante informado no Cliente é diferente ao informado.');
      end;

      Lbnom_cliente.Caption := dao.Q4.fieldbyname('nom_cliente').AsString +
        ' | CNPJ: ' + dao.Q4.fieldbyname('cnpj').AsString +
        ' | Cidade: ' + dao.Q4.fieldbyname('nom_cidade').AsString + '/' +
        dao.Q4.fieldbyname('uf').AsString;
      if UltConsSerasa > 0 then
        Lbnom_cliente.Caption := Lbnom_cliente.Caption +
          ' | Última Consulta SERASA/SPC: ' + FormatDateTime('dd/mm/yyyy',
          UltConsSerasa);

      desconto_maximo := dao.Q4.fieldbyname('desconto_maximo').AsString;
      UF_Cliente := dao.Q4.fieldbyname('uf').AsString;

      if prempresa_faturar.text <> '' then
        prempresa_faturarexit(self);

      if cliente_alterado and (mmVendas2.recordcount > 0) and
        (trim(Prnumdoc.Text) <> '') then
        AtualizaTotais('Alteração de Cliente - Atualizando os Itens do Pedido...');

      cliente_anterior := Prcod_cliente.Text;

      dao.Geral3('select verifica_status_financeiro, agrupar_pedidos from configuracao where cod_conf=' + QuotedStr('1'));

      if dao.Q3.fieldbyname('agrupar_pedidos').AsString = 'S' then
        CarregaDadosAgrupar(Prcod_cliente.Text, prnumdoc.Text);

      if (frpri.tipusu > '1') and
        (dao.Q3.fieldbyname('verifica_status_financeiro').AsString = 'S') then
        cliente_com_pendencia := VerificaFaturaVencida(Prcod_cliente.Text);

      if (frpri.tipusu > '1') then
        ChecarDataUltConsultaSerasa;

      if (frpri.tipusu > '1') then
        ImprimirPedidosAnteriores;

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

procedure TFr_vendas_industria2.Prcod_fopButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  //guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Forma de Pagamento';
  chamou_pesquisa := 'fr_fop';
  chamou_form := 'fr_pedido_fop';
  chamou_cadastro := 'fr_fop';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Fop';
  Fr_localizar.BT_cadastro.Visible := true;

  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';

  for i := 0 to 1 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(campos_combo[i]);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_vendas_industria2.Prcod_fopKeyPress(Sender: TObject;
  var Key: Char);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  if not (key in ['0'..'9', #8]) and (key <> #13) then
  begin
    beep; {somente delphi 2.0 ou >}
    key := #0;
  end;

  if key = #13 then
  begin
    if (Prcod_fop.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Forma de Pagamento';
      chamou_pesquisa := 'fr_fop';
      chamou_form := 'fr_pedido_fop';
      chamou_cadastro := 'fr_fop';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Fop';
      Fr_localizar.BT_cadastro.Visible := true;

      SetLength(Campos_combo, 2);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Nome';

      for i := 0 to 1 do
      begin
        valor_combo := campos_combo[i];
        Fr_localizar.CBcampos.Items.Add(campos_combo[i]);
      end;
      Fr_localizar.CBcampos.ItemIndex := 1;

      Fr_localizar.ShowModal;
      Fr_localizar.Free;

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;
    end;

    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;

end;

procedure TFr_vendas_industria2.Prcod_prazo_pgtoButtonClick(
  Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  //guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Forma de Pagamento';
  chamou_pesquisa := 'fr_prazo';
  chamou_form := 'fr_pedido_prazo';
  chamou_cadastro := 'fr_prazo';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'prazo';
  Fr_localizar.BT_cadastro.Visible := true;

  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Código';
  Campos_combo[1] := 'Descrição';

  for i := 0 to 1 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(campos_combo[i]);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_vendas_industria2.Prcod_prazo_pgtoKeyPress(Sender: TObject;
  var Key: Char);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  if not (key in ['0'..'9', #8]) and (key <> #13) then
  begin
    beep; {somente delphi 2.0 ou >}
    key := #0;
  end;

  if key = #13 then
  begin
    if (Prcod_prazo_pgto.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Forma de Pagamento';
      chamou_pesquisa := 'fr_prazo';
      chamou_form := 'fr_pedido_prazo';
      chamou_cadastro := 'fr_prazo';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'prazo';
      Fr_localizar.BT_cadastro.Visible := true;

      SetLength(Campos_combo, 2);
      Campos_combo[0] := 'Código';
      Campos_combo[1] := 'Descrição';

      for i := 0 to 1 do
      begin
        valor_combo := campos_combo[i];
        Fr_localizar.CBcampos.Items.Add(campos_combo[i]);
      end;
      Fr_localizar.CBcampos.ItemIndex := 1;

      Fr_localizar.ShowModal;
      Fr_localizar.Free;

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;
    end;

    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;

end;

procedure TFr_vendas_industria2.CalcularDesconto;
var
  tentativa: integer;
  desconto_adicional, desconto_dado: double;
  procedure AtualizarDesconto;
  begin
    desconto_adicional := Prdesconto.Value - desconto_anterior;
    if mmVendas2.RecordCount = 0 then
      exit;

    mmVendas2.First;
    while not mmVendas2.Eof do
    begin
      mmVendas2.edit;

      desconto_dado := (mmVendas2DESCONTO.Value + desconto_adicional);
      mmVendas2PRECO_LIQUIDO.Value := roundto(mmVendas2PRECO_VENDA.Value -
        (mmVendas2PRECO_VENDA.Value * (desconto_dado / 100)), (CasasDecimais *
        (-1)));
      mmVendas2DESCONTO.Value := desconto_dado;
      mmVendas2SUB_TOTAL.Value := mmVendas2PRECO_LIQUIDO.Value *
        mmVendas2QTD.Value;

      mmVendas2.post;
      mmVendas2.Next;
    end;
    somaTotal;
  end;
begin
  AtualizarDesconto;
  tentativa := 0;
  while total_liquido_anterior <> Prtot_liquido.value do
  begin
    //Prtot_liquido.value := total_liquido_anterior;
    //Prtot_liquidoChange(Self);
    AtualizarDesconto;
    tentativa := tentativa + 1;
    if tentativa > 20 then
    begin
      Prtot_liquido.Enabled := false;
      exit;
    end;
  end;
  Prtot_liquido.Enabled := false;
end;

procedure TFr_vendas_industria2.Prcod_fopExit(Sender: TObject);
var
  prazo_padrao: string;
begin
  if trim(Prcod_fop.Text) = '' then
    Lbnom_fop.Caption := '...';
  desconto_forma := 0;
  if Prcod_fop.Text <> '' then
  begin
    if (not FMFUN.verificaNumerico(Prcod_fop.Text)) and
      (length(Prcod_fop.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      Prcod_fop.SetFocus;
      exit;
    end;

    dao.Geral5('select nom_fop, desconto, avista, prazo_padrao, NAO_GERAR_CR from fop where ATIVO = ''S'' AND cod_fop=' +
      QuotedStr(Prcod_fop.Text));
    if dao.q5.RecordCount > 0 then
    begin
      Lbnom_fop.Caption := copy(dao.Q5.fieldbyname('nom_fop').AsString, 1, 15);
      prazo_padrao := dao.Q5.fieldbyname('prazo_padrao').AsString;
      Pedido_AVista := dao.Q5.fieldbyname('avista').AsString = 'S';
      gerar_cr := dao.Q5.fieldbyname('NAO_GERAR_CR').AsString <> 'S';
      desconto_forma := dao.Q5.fieldbyname('desconto').AsFloat;
      if (desconto_forma = 100) and (mform = 'vendas_industria') then
        showmessage('Aviso - Esse Pedido tem que ser Lançado na Tela de Devoluções e Remessas!');

      PrCONTA_BOLETO.Enabled := Prcod_fop.enabled;

      if Lbnom_fop.Caption = 'BOLETO' then
        PrCONTA_BOLETO.Enabled := true
      else
      begin
        PrCONTA_BOLETO.Clear;
        PrCONTA_BOLETO.Enabled := false;
      end;

      if (prazo_padrao <> '') then
      begin
        dao.Geral4('SELECT a.ID FROM PRAZO a where a.id = ' + prazo_padrao);
        Prcod_prazo_pgto.Text := dao.q4.fieldbyname('id').AsString;
        Prcod_prazo_pgtoExit(Self);
        Prcod_prazo_pgto.Enabled := false;
      end
      else
        Prcod_prazo_pgto.Enabled := true;

      CFOPTROCA;
      if (Prcod_fiscal.Text = '5405') or (Prcod_fiscal.Text = '6403') then
        ChecaCFOP;

    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_fop.Text := '';
      Prcod_fop.SetFocus;
      Exit;
    end;
  end;

end;

procedure TFr_vendas_industria2.Prcod_prazo_pgtoExit(Sender: TObject);
var
  prazo_maximo: string;
begin
  if trim(Prcod_prazo_pgto.Text) = '' then
    Lbprazo_pgto.Caption := '...';

  prazo_maximo := '';
  desconto_prazo := 0;

  if frpri.tipusu < '4' then
    prazo_maximo := ' and ATIVO = ''S'' ';

  if Prcod_prazo_pgto.Text <> '' then
  begin
    if (not FMFUN.verificaNumerico(Prcod_prazo_pgto.Text)) and
      (length(Prcod_prazo_pgto.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      Prcod_prazo_pgto.SetFocus;
      exit;
    end;

    dao.Geral2('select prazo, desconto from prazo where id =' +
      QuotedStr(Prcod_prazo_pgto.Text) + prazo_maximo);
    if dao.q2.RecordCount > 0 then
    begin
      Lbprazo_pgto.Caption := dao.Q2.fieldbyname('prazo').AsString;
      desconto_prazo := dao.Q2.fieldbyname('desconto').AsFloat;
      if dao.Q2.fieldbyname('prazo').AsString = '00' then
        PrConta_Boleto.clear;
    end
    else
    begin
      dao.msg('Registro não Encontrado ou não Ativo!');
      Prcod_prazo_pgto.Text := '';
      Prcod_prazo_pgto.SetFocus;
      Exit;
    end;
  end;
  if (FRPRI.TipUsu = '0') or (FRPRI.TipUsu = '1') then
    btnov.SetFocus;
end;

function TFr_vendas_industria2.ChecarBoletoNFE(cc, nfe: string): boolean;
begin
  if nfe = '' then
  begin
    Result := true;
    exit;
  end;

  if cc = '' then
  begin
    Result := true;
    exit;
  end;

  dao.Geral1('SELECT a.NFE, a.NUMDOC, c.NOM_CLIENTE, a.CONTA_BOLETO, cc.NOM_CONTA FROM VENDAS1 a ' +
    'inner join cliente c on c.COD_CLIENTE = a.COD_CLIENTE ' +
    'inner join conta_corrente cc on cc.id = a.CONTA_BOLETO ' +
    'where coalesce(a.nfe, a.numdoc) = ' + nfe + ' and a.conta_boleto = ' + cc +
    ' and a.numdoc <> ' + prnumdoc.Text);
  if dao.q1.RecordCount = 0 then
    Result := true
  else
  begin
    showmessage('Boleto ' + dao.q1.FieldByName('NOM_CONTA').AsString +
      ' da Nota Fiscal/Pedido nº ' + nfe +
      ' já está incluído no pedido nº ' + dao.q1.FieldByName('NUMDOC').AsString
      +
      ' - ' +
      dao.Q1.FieldByName('NOM_CLIENTE').AsString);
    //    prconta_boleto.SetFocus;
    Result := false
  end;
end;

procedure TFr_vendas_industria2.ChecarBoletoEmpresa(cc, empresa: string);
begin
  if Faturado then
    exit;
  if aviso_conta_boleto then
    exit;
  if trim(PrCONTA_BOLETO.Text) = '' then
    exit;
  if trim(empresa) = '' then
    exit;
  if prconta_boleto.Text <> cc then
    if
      MessageDlg('Conta Corrente do Boleto diferente da Conta Associada na Empresa '
      + empresa + '. Manter? ', mtConfirmation, [mbYes, mbno], 1) = mrno then
    begin
      prconta_boleto.Text := cc;
      prconta_boletoexit(self);
    end
end;

function TFr_vendas_industria2.ClienteAceitaSimples: boolean;
begin
  Result := true;
  if (trim(Prempresa_faturar.Text) = '') or (trim(Prcod_cliente.Text) = '') then
    exit;
  if (empresa_simples and not (cliente_aceita_simples) and not (Faturado)) then
  begin
    ShowMessage('Cliente não aceita Emissão pelo SIMPLES!');
    Result := true; //Nao bloqueia somente avisa...
  end;
end;

procedure TFr_vendas_industria2.CFOPTROCA;
var
  alterar_itens: boolean;
  procedure ChecarTroca(cfop: string);
  begin
    if Prcod_fiscal.Text <> cfop then
    begin
      Prcod_fiscal.Text := cfop;
      alterar_itens := true;
    end;
  end;

  procedure AtualizarCFOPItens(status: string);
  begin

    if mmVendas2.recordcount = 0 then
      exit;

    LiberaItemRepetido := true;
    pc_vendas.TabIndex := 0;
    pnWait.Visible := true;
    WindowList := DisableTaskWindows(fm_splash.Handle);
    fm_splash.ggProgress.Progress := 0;
    fm_splash.ggProgress.MaxValue := mmVendas2.RecordCount;
    fm_splash.lbStatus.Caption := status;
    fm_splash.Show;
    fm_splash.refresh;
    mmVendas2.DisableControls;
    mmVendas2.First;
    carregando_item := true;
    while not mmVendas2.Eof do
    begin
      checar_qtd := false;
      mmVendas2.edit;

      dao.Geral3('                                               ' +
        ' SELECT                                                 ' +
        '   case when p.COD_FISCAL_PRODUTO is not null then COALESCE(P.TRIB_ICMS, N.TRIB_ICMS) else N.TRIB_ICMS END AS TRIB_ICMS, ' +
        '   COALESCE(M.MVA, 0) AS MVA ' +
        ' FROM                                                   ' +
        '   PRODUTO P                                            ' +
        ' LEFT OUTER JOIN GRUPO G ON (G.COD_GRUPO = P.COD_GRUPO) ' +
        ' LEFT OUTER JOIN NCM N ON (N.CODIGO = coalesce(P.NCM, G.NCM)) ' +
        ' LEFT OUTER JOIN MVA M ON ((M.NCM = N.CODIGO or M.NCM = substring(n.CODIGO from 1 for 2)||''.''||substring(n.CODIGO from 3 for 2) )AND M.UF = ''' + UF_Cliente
        + ''') ' +
        ' WHERE P.COD_PRODUTO = ' + QUOTEDSTR(mmVendas2cod_produto.asstring));

      MVA := dao.Q3.fieldbyname('MVA').AsDouble;

      if dao.Q3.fieldbyname('trib_icms').AsString = '0' then
      begin
        cst := '00';
        if industria then
        begin
          if UF_Cliente = UF_Emissor then
            mmVendas2COD_FISCAL_ITEM.Text := '5101'
          else
            mmVendas2COD_FISCAL_ITEM.Text := '6101';
        end
        else
        begin
          if UF_Cliente = UF_Emissor then
            mmVendas2COD_FISCAL_ITEM.Text := '5102'
          else
            mmVendas2COD_FISCAL_ITEM.Text := '6102';
        end;
      end;

      if dao.Q3.fieldbyname('trib_icms').AsString = '1' then
        cst := '10';
      if dao.Q3.fieldbyname('trib_icms').AsString = '2' then
        cst := '20';
      if dao.Q3.fieldbyname('trib_icms').AsString = '3' then
        cst := '30';
      if dao.Q3.fieldbyname('trib_icms').AsString = '4' then
        cst := '40';
      if dao.Q3.fieldbyname('trib_icms').AsString = '5' then
        cst := '41';
      if dao.Q3.fieldbyname('trib_icms').AsString = '6' then
        cst := '50';
      if dao.Q3.fieldbyname('trib_icms').AsString = '7' then
        cst := '51';
      if dao.Q3.fieldbyname('trib_icms').AsString = '8' then
      begin
        cst := '60';
        if UF_Cliente = UF_Emissor then
          mmVendas2COD_FISCAL_ITEM.Text := '5405'
        else
          mmVendas2COD_FISCAL_ITEM.Text := '6403';

        mmVendas2ipi_item.Value := 0;
        mmVendas2vlr_ipi_item.Value := 0;
        if (MVA = 0) then
        begin
          cst := '00';
          if industria then
          begin
            if UF_Cliente = UF_Emissor then
              mmVendas2COD_FISCAL_ITEM.Text := '5101'
            else
              mmVendas2COD_FISCAL_ITEM.Text := '6101';
          end
          else
          begin
            if UF_Cliente = UF_Emissor then
              mmVendas2COD_FISCAL_ITEM.Text := '5102'
            else
              mmVendas2COD_FISCAL_ITEM.Text := '6102';
          end;
        end;
      end;
      if dao.Q3.fieldbyname('trib_icms').AsString = '9' then
        cst := '70';
      if dao.Q3.fieldbyname('trib_icms').AsString = '10' then
        cst := '90';
      if mmVendas2Cesta_Basica.Value then
        cst := '90';

      if (((UF_Cliente = 'RS') or (UF_Cliente = 'PR')) and (cst = '60')) then
      begin
        cst := '10';
        mmVendas2COD_FISCAL_ITEM.Text := '6403';
      end;

      if (Lbnom_fop.Caption = 'TROCA') or (Lbnom_fop.Caption = 'PERMUTA') then
      begin
        cst := '00';
        if UF_Cliente = UF_Emissor then
          mmVendas2COD_FISCAL_ITEM.Text := '5949'
        else
          mmVendas2COD_FISCAL_ITEM.Text := '6949';
      end;

      if (Lbnom_fop.Caption = 'BONIFICAÇÃO') then
      begin
        if uf_cliente = UF_Emissor then
          mmVendas2COD_FISCAL_ITEM.Text := '5910'
        else
          mmVendas2COD_FISCAL_ITEM.Text := '6910';
      end;
      mmVendas2Trib_ICMS.Text := cst;

      mmVendas2.post;
      fm_splash.ggProgress.AddProgress(1);
      fm_splash.Refresh;
      mmVendas2.next;
    end;
    carregando_item := false;
    mmVendas2.First;
    mmVendas2.EnableControls;
    EnableTaskWindows(WindowList);
    fm_splash.Hide;
    pnWait.Visible := false;
    LiberaItemRepetido := false;

  end;
begin
  if Prcod_fop.Text = '' then
    exit;

  alterar_itens := false;

  if (Lbnom_fop.Caption = 'TROCA') or (Lbnom_fop.Caption = 'PERMUTA') then
  begin
    if uf_cliente = UF_Emissor then
      ChecarTroca('5949')
    else
      ChecarTroca('6949');
  end
  else if (Lbnom_fop.Caption = 'BONIFICAÇÃO') then
  begin
    if uf_cliente = UF_Emissor then
      ChecarTroca('5910')
    else
      ChecarTroca('6910');
  end
  else
  begin
    if uf_cliente = UF_Emissor then
      ChecarTroca('5405')
    else
      ChecarTroca('6403');
  end;

  Prcod_fiscalexit(self);

  if alterar_itens then
    AtualizarCFOPItens('Alterando CFOP dos Itens...');

end;

procedure TFr_vendas_industria2.ChecaCFOP;
var
  cfop_st: boolean;
  qtd_st: integer;
begin
  if mform <> 'vendas_industria' then
    exit;

  if mmvendas2.RecordCount > 0 then
  begin
    mmVendas2.DisableControls;
    mmvendas2.first;
    qtd_st := 0;
    while not mmVendas2.Eof do
    begin

      if (mmVendas2COD_FISCAL_ITEM.AsString = '5405') or
        (mmVendas2COD_FISCAL_ITEM.AsString = '6403') then
        qtd_st := qtd_st + 1;

      mmvendas2.next;
    end;
    mmVendas2.EnableControls;

    cfop_st := qtd_st > 0;

    if not cfop_st then
    begin
      if industria then
      begin
        if uf_cliente = UF_Emissor then
          Prcod_fiscal.Text := '5101'
        else
          Prcod_fiscal.Text := '6101';
      end
      else
      begin
        if uf_cliente = UF_Emissor then
          Prcod_fiscal.Text := '5102'
        else
          Prcod_fiscal.Text := '6102';
      end;
    end
    else
    begin
      if uf_cliente = UF_Emissor then
        Prcod_fiscal.Text := '5405'
      else
        Prcod_fiscal.Text := '6403';
    end;
  end;

  Prcod_fiscalExit(Self);
  if mmvendas2.recordcount > 0 then
    mmvendas2.first;
end;

procedure TFr_vendas_industria2.Prempresa_faturarExit(Sender: TObject);
begin
  empresa_faturar := '';
  if trim(Prempresa_faturar.Text) = '' then
    Lbempresa_faturamento.Caption := '...';

  if Prempresa_faturar.Text <> '' then
  begin
    if (not FMFUN.verificaNumerico(Prempresa_faturar.Text)) and
      (length(Prempresa_faturar.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      Prempresa_faturar.SetFocus;
      exit;
    end;

    dao.Geral5('select e.nom_empresa||'' - ''||e.CNPJ AS NOM_EMPRESA, c.id as conta_corrente, cd.uf, e.ENQUADRADA_SIMPLES, e.logo From empresa e inner join cidades cd on cd.cod_cidade = e.cod_cidade ' +
      'inner join conta_corrente c on (c.id_empresa = e.cod_empresa) where c.ativo = ''S'' and e.cod_empresa=' +
      QuotedStr(Prempresa_faturar.Text));
    if dao.q5.RecordCount > 0 then
    begin
      Lbempresa_faturamento.Caption :=
        dao.Q5.fieldbyname('nom_empresa').AsString;
      conta_boleto := dao.Q5.fieldbyname('conta_corrente').AsString;
      empresa_faturar := dao.Q5.fieldbyname('nom_empresa').AsString;
      UF_Emissor := dao.Q5.fieldbyname('uf').AsString;
      empresa_simples := dao.Q5.fieldbyname('ENQUADRADA_SIMPLES').AsString =
        'S';
      //ChecarBoletoEmpresa(conta_boleto, empresa_faturar);
      dao.Q5.FieldByName('LOGO').SaveToFile('logo.bmp');
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prempresa_faturar.Text := '';
      Prempresa_faturar.SetFocus;
      Exit;
    end;

    if (Prcod_cliente.Text = '') and (mform = 'vendas_industria') then
    begin
      dao.msg('Favor Informar o Cliente!');
      Prcod_cliente.SetFocus;
      Exit;
    end;

    if venda then
    begin
      dao.Geral1('select cd.uf from cliente c ' +
        'left join cidades cd on cd.cod_cidade=c.cod_cidade ' +
        'where cod_cliente=' + QuotedStr(Prcod_cliente.Text));

      if Prempresa_faturar.Text = '1' then
      begin
        if mform = 'vendas_industria' then
        begin
          { if cliente_consumidor_final then
           begin
             if dao.Q1.FieldByName('uf').AsString = UF_Emissor then
               Prcod_fiscal.Text := '5102'
             else
               Prcod_fiscal.Text := '6102';
           end
           else
           begin
           }
          if Prcod_fiscal.Text = '' then
          begin
            if dao.Q1.FieldByName('uf').AsString = UF_emissor then
              Prcod_fiscal.Text := '5405'
            else
              Prcod_fiscal.Text := '6403';

            CFOPTROCA;

            if (Prcod_fiscal.Text = '5405') or (Prcod_fiscal.Text = '6403') then
              ChecaCFOP;

          end;
        end
        else
        begin
          if Prcod_fiscal.Text = '' then
          begin
            if dao.Q1.FieldByName('uf').AsString = UF_emissor then
              Prcod_fiscal.Text := '5202'
            else
              Prcod_fiscal.Text := '6202';
          end;
        end;
        dao.Geral2('select nome from cod_fiscal where cod_fiscal=' +
          QuotedStr(Prcod_fiscal.Text));
        Lbnom_cod_fiscal.Caption := dao.Q2.fieldbyname('nome').AsString;
      end
      else
      begin
        if mform = 'vendas_industria' then
        begin
          {if cliente_consumidor_final then
          begin
            if dao.Q1.FieldByName('uf').AsString = UF_Emissor then
              Prcod_fiscal.Text := '5102'
            else
              Prcod_fiscal.Text := '6102';
          end
          else
          begin}
          if Prcod_fiscal.Text = '' then
          begin
            if dao.Q1.FieldByName('uf').AsString = UF_emissor then
              Prcod_fiscal.Text := '5405'
            else
              Prcod_fiscal.Text := '6403';

            CFOPTROCA;

            if (Prcod_fiscal.Text = '5405') or (Prcod_fiscal.Text = '6403') then
              ChecaCFOP;

          end;
        end
        else
        begin
          if Prcod_fiscal.Text = '' then
          begin
            if dao.Q1.FieldByName('uf').AsString = UF_emissor then
              Prcod_fiscal.Text := '5202'
            else
              Prcod_fiscal.Text := '6202';
          end;
        end;
      end;
    end;
  end;

end;

procedure TFr_vendas_industria2.monta_sgpro;
begin
  {  SgPro.ColWidths[0] := 0;
    SgPro.ColWidths[1] := 40;
    SgPro.ColWidths[3] := 65;
    SgPro.ColWidths[4] := 30;
    SgPro.ColWidths[5] := 40;
    SgPro.ColWidths[6] := 50;
    SgPro.ColWidths[7] := 60;
    SgPro.ColWidths[8] := 60;
    SgPro.ColWidths[9] := 60;
    SgPro.ColWidths[10] := 70;
    SgPro.ColWidths[11] := 40;
    SgPro.ColWidths[12] := 70;
    SgPro.ColWidths[13] := 70;
    SgPro.ColWidths[14] := 45;
    SgPro.ColWidths[15] := 70;
    SgPro.ColWidths[16] := 50;
    SgPro.ColWidths[17] := 70;
    SgPro.ColWidths[18] := 70;
    SgPro.FontColors[8, 0] := clred;
    SgPro.Cells[0, 0] := 'id';
    SgPro.Cells[1, 0] := 'Código';
    SgPro.Cells[2, 0] := 'Produto';
    SgPro.Cells[3, 0] := 'NCM';
    SgPro.Cells[4, 0] := 'CST';
    SgPro.Cells[5, 0] := 'C.Bás.';
    SgPro.Cells[6, 0] := 'Qtd';
    SgPro.Cells[7, 0] := 'Preço';
    SgPro.Cells[8, 0] := 'Desconto';
    SgPro.Cells[9, 0] := 'Preço Liq.';
    SgPro.Cells[10, 0] := 'Sub-total';
    SgPro.Cells[11, 0] := 'IPI %';
    SgPro.Cells[12, 0] := 'Vlr. IPI';
    SgPro.Cells[13, 0] := 'ICMS BC';
    SgPro.Cells[14, 0] := 'ICMS %';
    SgPro.Cells[15, 0] := 'Valor Icms';
    SgPro.Cells[16, 0] := '% Vlr.Ag.';
    SgPro.Cells[17, 0] := 'IST BC';
    SgPro.Cells[18, 0] := 'IST Vlr';
    SgPro.Cells[19, 0] := 'NumDoc';
    SgPro.Cells[20, 0] := 'DtaDoc';
    SgPro.Cells[21, 0] := 'Volume';}
end;

procedure TFr_vendas_industria2.btnovClick(Sender: TObject);
begin
  //  GravarPedido := true;
  produto_alterado := true;
  checar_qtd := true;
  if (FRPRI.TipUsu > '1') and not representacao then
  begin
    if Prempresa_faturar.Text = '' then
    begin
      dao.msg('O campo Empresa deve ser Preenchido');
      pc_vendas.ActivePage := tab_finalizar;
      Prempresa_faturar.SetFocus;
      exit;
    end;

    if Prcod_fiscal.Text = '' then
    begin
      dao.msg('O campo Código Fiscal deve ser Preenchido');
      pc_vendas.ActivePage := tab_finalizar;
      Prcod_fiscal.SetFocus;
      exit;
    end;
  end;

  if Btnovped.Enabled = true then
  begin
    dao.msg('O Pedido está com Status Neutro, você deve Clicar no Botão Alterar ou Inserir!');
    exit;
  end;

  if (Prcod_fop.Text = '') and venda then
  begin
    dao.msg('Campo Forma de Pagamento deve ser Preenchido!');
    Prcod_fop.SetFocus;
    exit;
  end;

  if venda then
  begin
    if Prcod_cliente.Text = '' then
    begin
      dao.msg('Campo Cliente deve ser Preenchido!');
      Prcod_cliente.SetFocus;
      exit;
    end;
  end
  else
  begin
    if (Prcod_cliente.Text = '') and (Prcod_fornecedor.Text = '') then
    begin
      dao.msg('Campo Cliente ou Fornecedor deve ser Preenchido!');
      Prcod_cliente.SetFocus;
      exit;
    end;
  end;

  if (Prcod_representante.Text = '') and venda then
  begin
    dao.msg('Campo Representante deve ser Preenchido!');
    Prcod_representante.SetFocus;
    exit;
  end;

  //  limpa_campos('Me');
  readonly_false('Me');

  if not mmVendas2.Active then
    mmVendas2.open;
  mmVendas2.Append;

  if (FRPRI.TipUsu = '0') or (FRPRI.TipUsu = '1') or representacao then
  begin
    Mevolume.text := '1';
    Mevolume.Enabled := false
  end;

  if mform <> 'vendas_devolucoes' then
  begin
    Mecod_fiscal_item.Enabled := false;
    MeTrib_ICMS.Enabled := false;
  end;

  modo_insert_me := true;
  Menumdoc.Text := Prnumdoc.Text;
  Medtadoc.text := Prdtadoc.Text;
  Mecod_cliente.Text := Prcod_cliente.Text;
  //  SgPro.Enabled := False;
  qtd_anterior := 0;

  btnov.Enabled := false;
  btalt.Enabled := false;
  btgra.Enabled := true;
  btcan.Enabled := true;
  btexc.Enabled := false;
  mmVendas2VOLUME.Value := 1;
  Mecod_produto.SetFocus;

  linMax := 1;
end;

procedure TFr_vendas_industria2.Mecod_produtoKeyPress(Sender: TObject;
  var Key: Char);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
  usa_leitor: Boolean;
begin
  if not (key in ['0'..'9', #8]) and (key <> #13) then
  begin
    beep; {somente delphi 2.0 ou >}
    key := #0;
  end;

  if key = #13 then
  begin
    if (Length(Mecod_produto.Text) < 12) and (Mecod_produto.Text <> '') then
      busca_produto_unitario(False, Mecod_produto.Text)
    else if (Mecod_produto.Text <> '') then
    begin
      busca_produto_unitario(true, Mecod_produto.Text);
      usa_leitor := true;
    end;
    if (Mecod_produto.Text = '') and (BtNov.Enabled = false) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Produto';
      chamou_pesquisa := 'fr_produto';
      chamou_form := 'fr_pedido_produto';
      chamou_cadastro := 'Fr_produto';
      revenda := 'S';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Produto';
      Fr_localizar.BT_cadastro.Visible := true;

      //preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo, 3);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Nome';
      Campos_combo[2] := 'Marca';

      for i := 0 to 2 do
      begin
        valor_combo := campos_combo[i];
        Fr_localizar.CBcampos.Items.Add(valor_combo);
      end;
      Fr_localizar.CBcampos.ItemIndex := 1;

      Fr_localizar.ShowModal;

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;
    end;

    if Mecod_produto.Text <> '' then
    begin
      dao.Geral1('select grade from produto where cod_produto=' +
        QuotedStr(Mecod_produto.Text));
      if dao.Q1.FieldByName('grade').AsString = '1' then
        paAtributo.Visible := false
      else
        //        paAtributo.Visible := true;
    end;
    if paAtributo.Visible = true then
      Meid_cor.SetFocus
    else
      Mevolume.SetFocus;

    //    if usa_leitor then
    //        Btgra.Click;

    //    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;

end;

procedure TFr_vendas_industria2.busca_produto_unitario(leitor: boolean;
  cod_barras: string);
var
  cmd: string;
begin
  if leitor then
  begin
    if length(trim(cod_barras)) < 13 then
    begin
      dao.Geral1('select p.cod_produto, nom_produto, qtd_estoque, grade from produto p ' +
        'left join cod_barras cb on cb.cod_produto=p.cod_produto ' +
        'where cb.cod_barras=' + QuotedStr(cod_barras));
      dao.Q1.first;
      if dao.Q1.RecordCount < 1 then
      begin
        dao.msg('Produto não encontrado!');
        Mecod_produto.SetFocus;
        exit;
      end
      else
      begin
        mmVendas2COD_PRODUTO.AsString :=
          dao.Q1.fieldbyname('cod_produto').AsString;
        mmVendas2NOM_PRODUTO.AsString :=
          dao.Q1.fieldbyname('nom_produto').AsString;
      end;
    end
    else
    begin
      if length(trim(cod_barras)) > 21 then
      begin
        if copy(cod_barras, 1, 4) <> '' then
          dao.Geral2('select grade from produto where cod_produto= ' +
            QuotedStr(copy(cod_barras, 1, 4)));

        if dao.Q2.FieldByName('grade').AsString = '0' then
        begin
          dao.Geral1('select p.cod_produto, p.nom_produto, p.qtd_estoque,p.preco_venda, p.grade, gd.id_cor, gd.id_tamanho, c.cor, t.tamanho from produto p ' +
            'left join grade gd on gd.cod_produto=p.cod_produto ' +
            'left join cores c on c.id=gd.id_cor ' +
            'left join tamanho t on t.id=gd.id_tamanho ' +
            'where p.cod_produto=' + QuotedStr(copy(cod_barras, 1, 4)) +
            ' and gd.id_cor = ' + QuotedStr(copy(cod_barras, 5, 3)) +
            ' and id_tamanho = ' + QuotedStr(copy(cod_barras, 8, 3)));
        end;
      end
      else if length(trim(cod_barras)) < 22 then
      begin
        if copy(cod_barras, 1, 4) <> '' then
          dao.Geral2('select grade from produto where cod_produto= ' +
            QuotedStr(copy(cod_barras, 1, 4)));

        if dao.Q2.FieldByName('grade').AsString = '0' then
        begin
          dao.Geral1('select p.cod_produto, p.nom_produto, p.qtd_estoque,p.preco_venda, p.grade, gd.id_cor, gd.id_tamanho, c.cor, t.tamanho from produto p ' +
            'left join grade gd on gd.cod_produto=p.cod_produto ' +
            'left join cores c on c.id=gd.id_cor ' +
            'left join tamanho t on t.id=gd.id_tamanho ' +
            'where p.cod_produto=' + QuotedStr(copy(cod_barras, 1, 4)) +
            ' and gd.id_cor = ' + QuotedStr(copy(cod_barras, 5, 3)) +
            ' and id_tamanho = ' + QuotedStr(copy(cod_barras, 8, 2)));
        end;
      end;

      if dao.Q2.FieldByName('grade').AsString = '1' then
      begin
        dao.Geral1('select p.cod_produto, p.nom_produto, p.qtd_estoque,p.preco_venda, p.grade, gd.id_cor, gd.id_tamanho, c.cor, t.tamanho from produto p ' +
          'left join grade gd on gd.cod_produto=p.cod_produto ' +
          'left join cores c on c.id=gd.id_cor ' +
          'left join tamanho t on t.id=gd.id_tamanho ' +
          'where p.cod_produto=' + QuotedStr(copy(cod_barras, 1, 4)));
      end;

      dao.Q1.first;
      if dao.Q1.RecordCount < 1 then
      begin
        dao.msg('Produto não encontrado!');
        Mecod_produto.SetFocus;
        exit;
      end
      else
      begin
        mmVendas2COD_PRODUTO.AsString :=
          dao.Q1.fieldbyname('cod_produto').AsString;
        mmVendas2NOM_PRODUTO.AsString :=
          dao.Q1.fieldbyname('nom_produto').AsString;
        if dao.Q1.FieldByName('grade').AsString = '0' then
        begin
          Meid_cor.Text := '';
          LbCor.Caption := '...';
          Meid_Tamanho.Text := '';
          Lbtamanho.Caption := '...';

          Meid_cor.Text := dao.Q1.fieldbyname('id_cor').AsString;
          LbCor.Caption := dao.Q1.fieldbyname('cor').AsString;
          Meid_Tamanho.Text := dao.Q1.fieldbyname('id_tamanho').AsString;
          Lbtamanho.Caption := dao.Q1.fieldbyname('tamanho').AsString;
        end;
      end;
    end;
  end;

  if not (leitor) then
  begin
    dao.Geral1('select p.cod_produto, nom_produto, qtd_estoque,preco_venda, grade from produto p ' +
      'where p.cod_produto = ' + QuotedStr(cod_barras));

    if dao.Q1.RecordCount < 1 then
    begin
      dao.msg('Produto não encontrado!');
      Mecod_produto.SetFocus;
      exit;
    end;
  end;

end;

procedure TFr_vendas_industria2.Mecod_produtoButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  try
    Application.CreateForm(TFr_localizar, Fr_localizar);

    //guardar os valores antigos
    chamou_form_old := chamou_form;
    chamou_pesquisa_old := chamou_pesquisa;

    Fr_localizar.Caption := 'Localizar Produto';
    chamou_pesquisa := 'fr_produto';
    revenda := 'S';

    if mform = 'vendas_devolucoes' then
      chamou_form := 'fr_pedido_produto_dev'
    else
      chamou_form := 'fr_pedido_produto';

    chamou_cadastro := 'Fr_produto';

    Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Produto';
    Fr_localizar.BT_cadastro.Visible := true;

    //preenchendo o combo box com os campos desejados para pesquisar.
    SetLength(Campos_combo, 3);
    Campos_combo[0] := 'Codigo';
    Campos_combo[1] := 'Nome';
    Campos_combo[2] := 'Marca';

    for i := 0 to 2 do
    begin
      valor_combo := campos_combo[i];
      Fr_localizar.CBcampos.Items.Add(valor_combo);
    end;
    Fr_localizar.CBcampos.ItemIndex := 1;

    Fr_localizar.ShowModal;
    // Fr_localizar.Free;

    chamou_form := chamou_form_old;
    chamou_pesquisa := chamou_pesquisa_old;
  finally
    Mecod_produtoexit(self);
  end;
end;

procedure TFr_vendas_industria2.CalculoIcmsItem;
//ICMS ST = (Al x BC ST) – ICMS operação própria
begin
  if not (mmVendas2.State in [dsEdit, dsInsert]) then
    exit;

  if mmVendas2ICMS_ITEM.value = 0 then
    mmVendas2VLR_BC.Value := 0
  else
    mmVendas2VLR_BC.Value := mmVendas2SUB_TOTAL.Value;

  mmVendas2vlr_icms_item.Value := mmVendas2vlr_bc.Value *
    (mmVendas2icms_item.Value / 100);
  if (cst = '60') or (cst = '90') or (cst = '10') then
  begin
    //Buscar a Base de Cáculo ST
    if cliente_aceita_simples and (UF_Cliente <> 'RS') then
      MVA := MVA - (MVA * 0.7);

    mmVendas2vlr_bc_st.Value := RoundTo(((mmVendas2sub_total.Value +
      mmVendas2VLR_IPI_ITEM.Value) * (1 + (MVA /
      100))), -5);
    mmVendas2vlr_icms_st.Value := RoundTo(((mmVendas2vlr_bc_st.Value *
      (Aliquota_ICMS_Interno / 100)) - mmVendas2vlr_icms_item.Value), -5);

    if cst <> '10' then
    begin
      mmVendas2vlr_bc.Value := 0;
      mmVendas2vlr_icms_item.Value := 0;
      mmVendas2icms_item.Value := 0;
    end;
    mmVendas2vlr_agr_item.Value := MVA;
    mmVendas2VLR_ICMS_ST.Value := mmVendas2VLR_ICMS_ST.Value;
  end
  else
  begin
    mmVendas2vlr_bc_st.Value := 0;
    mmVendas2vlr_icms_st.Value := 0;
    mmVendas2vlr_agr_item.Value := 0;
  end;

  if cliente_isento_icms or cliente_consumidor_final
    (*or cliente_aceita_simples *)then
  begin
    mmVendas2vlr_bc_st.Value := 0;
    mmVendas2vlr_icms_st.Value := 0;
    mmVendas2vlr_bc.Value := 0;
    mmVendas2vlr_icms_item.Value := 0;
    mmVendas2icms_item.Value := 0;
  end;

end;

procedure TFr_vendas_industria2.dados_produto(cod_produto: string);
var
  status, cod_fiscal: string;
begin
  DecimalSeparator := ',';
  if (mform <> 'vendas_devolucoes') and (not carregando_item) then
    status := ' AND P.STATUS = ' + QuotedStr('N')
  else
    status := '';

  if Prcod_representante.Text = '' then
    Prcod_representante.Text := '0';

  dao.Geral3('                                               ' +
    ' SELECT                                                 ' +
    '   P.NOM_PRODUTO,                                       ' +
    '   CASE WHEN P.PROMOCAO = ''S'' THEN P.PRECO_PROMOCAO ELSE P.PRECO_VENDA END PRECO_VENDA, ' +
    '   P.UNIDADE,                                           ' +
    '   P.QTD_EMBALAGEM,                                     ' +
    '   P.GRADE,                                             ' +
    '   P.GRADE_COMISSAO,                                    ' +
    '   P.QTD_ESTOQUE,                                       ' +
    '   P.TINTA_BASE,                                        ' +
    '   P.QTD_RESERVADO,                                     ' +
    '   P.CUSTO,                                             ' +
    '   P.CUSTO_TOTAL,                                       ' +
    '   P.LUCRO,                                             ' +
    '     CASE WHEN P.PROMOCAO = ''S'' THEN 0 ELSE           ' +
    '   ( SELECT distinct max((a.PRECO_VENDA - a.PRECO_INI)/a.PRECO_VENDA)*100 ' +
    '     FROM V_GRADE_COMISSAO a ' +
    '     WHERE A.COD_PRODUTO = P.COD_PRODUTO AND A.CODREP = ' +
    Prcod_representante.Text +
    '   ) end AS DESCONTO_MAXIMO, ' +
    '   N.CODIGO AS NCM,                                     ' +
    '   COALESCE(M.MVA, 0) AS MVA, ' +
    '   COALESCE(M.ALIQ_ICMS_INTERNA, 0) AS ALIQ_ICMS_INTERNA, ' +
    '   N.IPI_ALIQUOTA,                                      ' +
    '   case when p.COD_FISCAL_PRODUTO is not null then COALESCE(P.TRIB_ICMS, N.TRIB_ICMS) else N.TRIB_ICMS END AS TRIB_ICMS, ' +
    '   P.PROMOCAO,                                          ' +
    '   N.CESTA_BASICA,                                      ' +
    '   P.PESO,                                               ' +
    '   P.CODIGO_BARRA,                                      ' +
    '   P.NAO_VALIDAR_MARGEM,                                ' +
    '   P.BONIFICACAO_APENAS                                 ' +
    ' FROM                                                   ' +
    '   PRODUTO P                                            ' +
    ' LEFT OUTER JOIN GRUPO G ON (G.COD_GRUPO = P.COD_GRUPO) ' +
    ' LEFT OUTER JOIN NCM N ON (N.CODIGO = coalesce(P.NCM, G.NCM)) ' +
    ' LEFT OUTER JOIN MVA M ON ((M.NCM = N.CODIGO or M.NCM = substring(n.CODIGO from 1 for 2)||''.''||substring(n.CODIGO from 3 for 2) )AND M.UF = ''' + UF_Cliente
    + ''') ' +
    ' WHERE P.COD_PRODUTO = ' + QUOTEDSTR(COD_PRODUTO) + status);

  if Prcod_representante.Text = '0' then
    Prcod_representante.Text := '';
  if not dao.Q3.IsEmpty then
  begin
    //Definir a Margem de Valor Agregado.
    MVA := dao.Q3.fieldbyname('MVA').AsDouble;
    if UF_Cliente = UF_Emissor then
      mmVendas2icms_item.Value := 17
    else
      mmVendas2icms_item.Value := 12;
    Aliquota_ICMS_Interno := dao.Q3.fieldbyname('ALIQ_ICMS_INTERNA').AsDouble;

    if MePrecoBase.Visible then
    begin
      if dao.Q3.fieldbyname('TINTA_BASE').AsString <> 'S' then
        MePrecoBase.enabled := false
      else
        MePrecoBase.enabled := true;
    end;

    if not GravarPedido then
    begin

      zzunidade.Text := dao.Q3.fieldbyname('unidade').AsString;
      zzqtd_embalagem.Text := dao.Q3.fieldbyname('qtd_embalagem').AsString;

      mmVendas2PROMOCAO.AsString := dao.Q3.fieldbyname('PROMOCAO').AsString;

      if dao.Q3.fieldbyname('PROMOCAO').AsString = 'S' then
        mmVendas2NOM_PRODUTO.Value := dao.Q3.fieldbyname('NOM_PRODUTO').AsString
          +
          ' (PROMOÇÃO)'
      else
        mmVendas2NOM_PRODUTO.Value :=
          dao.Q3.fieldbyname('NOM_PRODUTO').AsString;

      if mmVendas2PRECO_VENDA.IsNull or produto_alterado then
        mmVendas2PRECO_VENDA.Value := dao.Q3.fieldbyname('preco_venda').AsFloat;

      if mmVendas2PRECO_LIQUIDO.IsNull or produto_alterado then
        mmVendas2PRECO_LIQUIDO.Value := dao.Q3.fieldbyname('preco_venda').AsFloat
          - (dao.Q3.fieldbyname('preco_venda').AsFloat * mmVendas2desconto.Value
          /
          100);

      mmVendas2sub_total.Value := mmVendas2PRECO_LIQUIDO.Value *
        mmVendas2qtd.Value;

      mmVendas2GRADE_COMISSAO.AsString :=
        dao.Q3.fieldbyname('GRADE_COMISSAO').AsString;

      if dao.Q3.fieldbyname('cesta_basica').AsString = 'S' then
        mmVendas2Cesta_Basica.value := true
      else
        mmVendas2Cesta_Basica.value := false;

      mmVendas2CODIGO_BARRAS.AsString :=
        dao.Q3.fieldbyname('CODIGO_BARRA').AsString;

      zz_lucro_produto.Value := dao.Q3.fieldbyname('lucro').AsFloat;

      if mmVendas2PRECO_CUSTO.IsNull or produto_alterado then
        mmVendas2PRECO_CUSTO.Value := dao.Q3.fieldbyname('CUSTO_TOTAL').AsFloat;

      mmVendas2PESO.Value := dao.Q3.fieldbyname('PESO').AsFloat;

      if desconto_forma = 0 then
        mmVendas2DESCONTO_MAXIMO.Value :=
          dao.Q3.fieldbyname('DESCONTO_MAXIMO').AsFloat + (((100 -
          dao.Q3.fieldbyname('DESCONTO_MAXIMO').AsFloat) * desconto_prazo) / 100)
      else
        mmVendas2DESCONTO_MAXIMO.Value := desconto_forma;

      if mmVendas2PROMOCAO.AsString = 'S' then
        mmVendas2DESCONTO_MAXIMO.Value := 0;

      if mmVendas2PROMOCAO.AsString = 'S' then
      begin
        mmVendas2PRECO_CUSTO.value := mmVendas2PRECO_VENDA.value / (1 +
          (margem_lucro_ideal / 100));
        SetRoundMode(rmDown);
        mmVendas2PRECO_CUSTO.value := roundto(mmVendas2PRECO_CUSTO.value,
          (CasasDecimais * (-1)));
        SetRoundMode(rmNearest);
      end;

      zzcusto.Value := mmVendas2PRECO_CUSTO.Value;
    end;

    zzreal.Value := dao.Q3.fieldbyname('qtd_estoque').AsFloat;
    zzreservado.Value := dao.Q3.fieldbyname('qtd_reservado').AsFloat;
    //mmVendas2NOM_PRODUTO.AsString := dao.Q3.fieldbyname('nom_produto').AsString;

    cod_fiscal := '';
    if mform = 'vendas_industria' then
    begin
      if dao.Q3.fieldbyname('trib_icms').AsString = '0' then
      begin
        mmVendas2ipi_item.Value := dao.Q3.fieldbyname('IPI_ALIQUOTA').AsFloat;
        mmVendas2vlr_ipi_item.Value := mmVendas2sub_total.Value *
          (mmVendas2ipi_item.Value / 100);

        cst := '00';
        if industria then
        begin
          if UF_Cliente = UF_Emissor then
            cod_fiscal := '5101'
          else
            cod_fiscal := '6101';
        end
        else
        begin
          if UF_Cliente = UF_Emissor then
            cod_fiscal := '5102'
          else
            cod_fiscal := '6102';
        end;
      end;

      if dao.Q3.fieldbyname('trib_icms').AsString = '1' then
        cst := '10';
      if dao.Q3.fieldbyname('trib_icms').AsString = '2' then
        cst := '20';
      if dao.Q3.fieldbyname('trib_icms').AsString = '3' then
        cst := '30';
      if dao.Q3.fieldbyname('trib_icms').AsString = '4' then
        cst := '40';
      if dao.Q3.fieldbyname('trib_icms').AsString = '5' then
        cst := '41';
      if dao.Q3.fieldbyname('trib_icms').AsString = '6' then
        cst := '50';
      if dao.Q3.fieldbyname('trib_icms').AsString = '7' then
        cst := '51';
      if dao.Q3.fieldbyname('trib_icms').AsString = '8' then
      begin
        cst := '60';
        if UF_Cliente = UF_Emissor then
          cod_fiscal := '5405'
        else
          cod_fiscal := '6403';

        mmVendas2ipi_item.Value := 0;
        mmVendas2vlr_ipi_item.Value := 0;
        if (MVA = 0) then
        begin
          {showmessage('Margem de Valor Agregado (MVA) não pode ser igual a zero.'
            + #13 + 'Verifique no cadastro de ncm no código :' +
            dao.Q3.fieldbyname('ncm').AsString + '.' + #13 +
            'Ou se o código CST 60 do produto ' + mecod_produto.text + '-' +
            Lbnom_produto_DB.Caption + ' está informado corretamente.');}
          cst := '00';

          if industria then
          begin
            if UF_Cliente = UF_Emissor then
              cod_fiscal := '5101'
            else
              cod_fiscal := '6101';
          end
          else
          begin
            if UF_Cliente = UF_Emissor then
              cod_fiscal := '5102'
            else
              cod_fiscal := '6102';
          end;
        end;
      end;
      if dao.Q3.fieldbyname('trib_icms').AsString = '9' then
        cst := '70';
      if dao.Q3.fieldbyname('trib_icms').AsString = '10' then
        cst := '90';
      if mmVendas2Cesta_Basica.Value then
        cst := '90';

      {      if UF_Cliente = 'PR' then
            begin
              cst := '00';
              cod_fiscal := '6102';
            end; }

      if (((UF_Cliente = 'RS') or (UF_Cliente = 'PR')) and (cst = '60')) then
      begin
        cst := '10';
        cod_fiscal := '6403';
      end;

      {if cliente_consumidor_final then
      begin

        cst := '00';
        if UF_Cliente = UF_Emissor then
          cod_fiscal := '5102'
        else
          cod_fiscal := '6102';

      end;}

      mmVendas2Trib_ICMS.Text := cst;

    end
    else
    begin
      {     mmVendas2ipi_item.Value := 0;
           mmVendas2vlr_ipi_item.Value := 0;}
      cod_fiscal := prcod_fiscal.text;
    end;

    if (Lbnom_fop.Caption = 'TROCA') or (Lbnom_fop.Caption = 'PERMUTA') then
    begin
      cst := '00';
      if UF_Cliente = UF_Emissor then
        cod_fiscal := '5949'
      else
        cod_fiscal := '6949';
    end;

    if (Lbnom_fop.Caption = 'BONIFICAÇÃO') then
    begin
      if uf_cliente = UF_Emissor then
        cod_fiscal := '5910'
      else
        cod_fiscal := '6910';
    end;
    mmVendas2Trib_ICMS.Text := cst;
    mmVendas2COD_FISCAL_ITEM.Text := cod_fiscal;
    mmVendas2NCM.Text := dao.Q3.fieldbyname('ncm').AsString;
    {if mmVendas2Cesta_Basica.Value then
      Aliquota_ICMS_Interno := 12
    else
      Aliquota_ICMS_Interno := 17;  }

    mmVendas2NAO_VALIDAR_MARGEM.AsString :=
      dao.Q3.fieldbyname('NAO_VALIDAR_MARGEM').AsString;

    if mmVendas2NAO_VALIDAR_MARGEM.AsString = 'S' then
      mmVendas2DESCONTO_MAXIMO.Value :=
        dao.q3.fieldbyname('DESCONTO_MAXIMO').asfloat;

    CarregaFoto(Mecod_produto.text);

    if MeTrib_ICMS.Visible and MeTrib_ICMS.Enabled then
      MeTrib_ICMS.setfocus;

    if (dao.q3.fieldbyname('BONIFICACAO_APENAS').AsString = 'S') and (mform =
      'vendas_industria') then
    begin
      showmessage('Produto apenas para Bonificação!');
      mmVendas2COD_PRODUTO.Clear;
      mecod_produto.SetFocus;
      exit;
    end;

  end
  else
  begin
    showmessage('Produto Inexistente ou Inativo!');
    mmVendas2COD_PRODUTO.Clear;
    Mecod_produto.SetFocus;
  end;

end;

procedure TFr_vendas_industria2.ListarItensPedidos;
var
  x: integer;

begin
  if mmVendas2.RecordCount = 0 then
    exit;

  itens_repetidos := false;
  mmVendas2.DisableControls;
  mmVendas2.first;

  SetLength(ListaItens, 0);

  SetLength(ListaItens, mmVendas2.RecordCount);

  for x := 0 to mmVendas2.RecordCount - 1 do
  begin
    if not itens_repetidos then
      itens_repetidos := ChecarProdutoNoPedido(mmVendas2COD_PRODUTO.AsInteger);
    ListaItens[x] := mmVendas2COD_PRODUTO.AsInteger;
    mmVendas2.Next;
  end;
  mmVendas2.first;
  mmVendas2.EnableControls;
end;

procedure TFr_vendas_industria2.ChecarItensPedidos;
var
  x: integer;

begin
  itens_repetidos := false;
  mmVendas2.DisableControls;
  mmVendas2.first;
  for x := 0 to mmVendas2.RecordCount - 1 do
  begin
    itens_repetidos := ChecarProdutoNoPedido(mmVendas2COD_PRODUTO.AsInteger);
    mmVendas2.Next;
  end;
  mmVendas2.first;
  mmVendas2.EnableControls;
end;

function TFr_vendas_industria2.ChecarProdutoNoPedido(produto: integer): boolean;
var
  x: integer;
begin
  Result := false;
  for x := 0 to High(ListaItens) do
    if ListaItens[x] = produto then
      Result := true;
end;

procedure TFr_vendas_industria2.Mecod_produtoExit(Sender: TObject);
begin
  DecimalSeparator := ',';

  if ActiveControl <> nil then
  begin
    if (ActiveControl.Name = 'btgra') or (ActiveControl.Name = 'btcan') then
      exit;
  end;

  if mmVendas2.state in [dsbrowse] then
    exit;
  if Prcod_cliente.Text <> '' then
  begin
    dao.Geral1('select cd.uf, CASE WHEN (C.ie is null or C.IE = ''ISENTO'') THEN ''1'' ELSE ''0'' END AS ISENTO from cliente c ' +
      'left join cidades cd on cd.cod_cidade=c.cod_cidade ' +
      'where cod_cliente=' + QuotedStr(Prcod_cliente.Text));
    UF_Cliente := dao.Q1.fieldbyname('uf').AsString;

    dao.Geral2('select * from icms where uf=' +
      QuotedStr(dao.Q1.fieldbyname('uf').AsString));
    Meicms_item.Text := dao.Q2.fieldbyname('icms').AsString;
  end;

  if Prcod_fornecedor.Text <> '' then
  begin
    dao.Geral1('select cd.uf, CASE WHEN (C.IERG is null or C.IERG = ''ISENTO'') THEN 1 ELSE 0 END AS ISENTO from fornecedor c ' +
      'left join cidades cd on cd.cod_cidade=c.cod_cidade ' +
      'where cod_fornecedor=' + QuotedStr(Prcod_fornecedor.Text));
    UF_Cliente := dao.Q1.fieldbyname('uf').AsString;

    dao.Geral2('select * from icms where uf=' +
      QuotedStr(dao.Q1.fieldbyname('uf').AsString));
    Meicms_item.Text := dao.Q2.fieldbyname('icms').AsString;
  end;

  if trim(Mecod_produto.Text) <> '' then
  begin
    if (not FMFUN.verificaNumerico(Mecod_produto.Text)) and
      (length(Mecod_produto.Text) > 0) then
    begin
      dao.msg('Dado tem que ser sempre Numérico!');
      Mecod_produto.SetFocus;
      exit;
    end;

    dados_produto(Mecod_produto.Text);

    if (FRPRI.TipUsu = '0') or (FRPRI.TipUsu = '1') or telemarketing or
      representacao then
      if Meqtd.value > 0 then
        PromocaoPorQuantidade(Meqtd.Text);

  end
  else
  begin
    dao.msg('O Campo Produto deve ser Preenchido!');
    Mecod_produto.SetFocus;
    exit;
  end;

  if (mmVendas2VOLUME.value = 0) then
    mmVendas2VOLUME.value := 1;

end;

function TFr_vendas_industria2.CalculoComissao: Real;
var
  comissao: double;
  com_comissao_fixa: boolean;
begin
  if Prcod_representante.Text = '' then
  begin
    Result := 0;
    exit;
  end;

  dao.Geral5('SELECT a.PERC_COMISSAO_FIXA, a.COMISSAO_FIXA, a.MARGEM_IDEAL, a.MARGEM_MINIMA, a.INDICE_ABAIXO, a.INDICE_ACIMA FROM REPRESENTANTE a where a.ID = ' + Prcod_representante.Text);

  margem_lucro_ideal := dao.q5.fieldbyname('MARGEM_IDEAL').AsCurrency;
  margem_lucro_minima := dao.q5.fieldbyname('MARGEM_MINIMA').AsCurrency;
  indice_abaixo := dao.q5.fieldbyname('INDICE_ABAIXO').AsCurrency;
  indice_acima := dao.q5.fieldbyname('INDICE_ACIMA').AsCurrency;

  comissao_fixa := dao.Q5.fieldbyname('PERC_COMISSAO_FIXA').AsCurrency;
  com_comissao_fixa := dao.Q5.fieldbyname('COMISSAO_FIXA').AsString = 'S';

  if margem_lucro < margem_lucro_minima then
    comissao := 0
  else if margem_lucro < margem_lucro_ideal then
    comissao := comissao_fixa * (1 + ((margem_lucro - margem_lucro_ideal) / 100)
      * indice_abaixo)
  else
    comissao := comissao_fixa * (1 + ((margem_lucro - margem_lucro_ideal) / 100)
      * indice_acima);

  if com_comissao_fixa then
    comissao := comissao_fixa;

  Result := comissao;

end;

procedure TFr_vendas_industria2.btgraClick(Sender: TObject);
var
  comissao_item, volume, perc_descontado, perc_comissao: real;
  produto: string;
begin

  produto_alterado := false;
  if Mecod_produto.Text = '' then
  begin
    dao.msg('O Campo Produto deve ser Preenchido!');
    Mecod_produto.SetFocus;
    exit;
  end;

  produto := Mecod_produto.Text;

  if Meqtd.value = 0 then
  begin
    dao.msg('O Campo Qtd deve ser Preenchido!');
    Meqtd.SetFocus;
    exit;
  end;

  if Mevolume.value = 0 then
  begin
    dao.msg('O Campo Volume deve ser Preenchido!');
    Mevolume.SetFocus;
    exit;
  end;

  if Mepreco.value = 0 then
  begin
    dao.msg('O Campo Preço deve ser Preenchido!');
    Meqtd.SetFocus;
    exit;
  end;

  if (Mecod_fiscal_item.Text = '') and Mecod_fiscal_item.Enabled then
  begin
    dao.msg('O Campo Código Fiscal deve ser Preenchido!');
    Mecod_fiscal_item.SetFocus;
    exit;
  end;

  if MeTrib_ICMS.Visible and (MeTrib_ICMS.Text = '') then
  begin
    dao.msg('O Campo CST deve ser Preenchido!');
    MeTrib_ICMS.SetFocus;
    exit;
  end;

  if checar_qtd and VerificaEstoqueParaFaturar(Mecod_produto.Text) then
    if MessageDlg('Estoque com Quantidade Insuficiente Para Faturar!' + #13 +
      'Deseja Continuar Assim Mesmo!', mtConfirmation, [mbYes, mbNo], 0) = mrno
        then
    begin
      Meqtd.SetFocus;
      exit;
    end;

  {  if (Prcod_representante.Text <> '') and (Prorcamento.ItemIndex = 0) then
    begin
      perc_comissao := CalculoComissao(mmVendas2GRADE_COMISSAO.AsString,
        zz_lucro_produto.Value, Zzcusto.Value, mmVendas2PRECO_LIQUIDO.Value,
        representante_funcionario);
      comissao_item := mmVendas2sub_total.Value * (perc_comissao / 100);
      mmVendas2PERC_comissao.Value := perc_comissao;
      mmVendas2vlr_comissao.Value := comissao_item;
    end; }

    { if cliente_isento_icms then
       cst := '40'
     else if mmVendas2Cesta_Basica.Value then
       cst := '90'
     else
       cst := '60';
     }

   //  mmVendas2Trib_ICMS.Text := cst;

  cst := mmVendas2Trib_ICMS.Value;
  //Calcula o vlr icms do item
  if mform <> 'vendas_devolucoes' then
    CalculoIcmsItem;

  if mmVendas2IPI_ITEM.IsNull then
    mmVendas2IPI_ITEM.Value := 0;
  if mmVendas2VLR_IPI_ITEM.IsNull then
    mmVendas2VLR_IPI_ITEM.Value := 0;

  if mmVendas2VLR_BC_ST.IsNull then
    mmVendas2VLR_BC_ST.Value := 0;
  if mmVendas2VLR_ICMS_ST.IsNull then
    mmVendas2VLR_ICMS_ST.Value := 0;

  if mmVendas2VLR_AGR_ITEM.IsNull then
    mmVendas2VLR_AGR_ITEM.Value := 0;

  if mform <> 'vendas_devolucoes' then
  begin
    if mmVendas2VLR_BC.IsNull then
      mmVendas2VLR_BC.Value := 0;
  end
  else
    mmVendas2VLR_BC.Value := mmVendas2SUB_TOTAL.Value;

  {  if modo_insert_me then
    begin
      id_mercadoria := dao.insert('Me', 'vendas2', 'id', Fr_vendas_industria, 'gen_venda2');
      mmVendas2id.Text := id_mercadoria;
      insere_sgpro('1');
    end
    else
    begin
     //Felipe 30/10/2008  dao.update('entrada2','id',SgPro.Cells[0,lin],'Em',Fr_entrada);
      dao.update('vendas2', 'id', Meid.Text, 'Me', Fr_vendas_industria);
      insere_sgpro('2');
    end;
   }

    //monta os campos de custo e margem de lucro;
  if Zzcusto.Value > 0 then
  begin
    //    Zzcusto.Value := dao.Q1.fieldbyname('custo').AsFloat;
    Zztot_custo.Value := Zzcusto.Value * mmVendas2qtd.Value;
    zz_lucro_produto.Value := (mmVendas2PRECO_LIQUIDO.Value / Zzcusto.Value) *
      100;
    if zz_lucro_produto.Value < 0 then
      zz_lucro_produto.Value := zz_lucro_produto.Value * -1;

    if zz_lucro_produto.Value < 0 then
      zz_lucro_produto.Font.Color := clRed
    else
      zz_lucro_produto.Font.Color := clBlue;

  end;

  {  qtd_est_reservado := mmVendas2qtd.Value - qtd_anterior;
  if paAtributo.Visible = true then
  begin
    zztotal.Value := FRPRI.atualiza_estoque(mmVendas2cod_produto.Text, 'E', floattostr(qtd_est_reservado), 'RS');
    zztotal.Value := FRPRI.atualiza_estoque_grade(mmVendas2cod_produto.Text, mmVendas2id_cor.Text, '', mmVendas2id_Tamanho.Text, 'E', floattostr(qtd_est_reservado), 'RS');
  end
  else
  begin
    zztotal.Value := FRPRI.atualiza_estoque(mmVendas2cod_produto.Text, 'E', floattostr(qtd_est_reservado), 'RS');
  end;}
//  frpri.AvisoEstoqueMinimo(Mecod_produto.Text);

  btnov.Enabled := true;
  btalt.Enabled := true;
  btgra.Enabled := false;
  btcan.Enabled := false;
  btexc.Enabled := true;

  btnov.SetFocus;

  if mmVendas2DESCONTO.AsString = '' then
    mmVendas2DESCONTO.AsString := '0';

  mmVendas2.Post;

  readonly_true('Me');
  if not cliente_alterado or (prnumdoc.Text = '') then
  begin
    if not GravarPedido then
    begin
      somaTotal;
      mmVendas2.Last;
      mmVendas2.Locate('cod_produto', produto, [loCaseInsensitive]);
    end;
  end;
  promocao_desconto := TodosPromocao;
  // GravarPedido := true;
  if not LiberaItemRepetido then
    ListarItensPedidos;
end;

procedure TFr_vendas_industria2.insere_sgpro(tipo: string);
begin
end;

procedure TFr_vendas_industria2.PromocaoPorQuantidade(quantidade: string);
var
  custo, preco: real;
begin
  dao.geral5(' SELECT first 1 a.COD_PRODUTO, a.ID_REPRESENTANTE, a.QTD_PROMOCAO, a.PRECO_PROMOCAO ' +
    ' FROM PRODUTO_REPRESENTANTE a where a.COD_PRODUTO = ' + mecod_produto.text
    +
    ' and a.qtd_promocao <= ' + quantidade +
    ' and a.ID_REPRESENTANTE =' + prcod_representante.text);

  preco := dao.q5.fieldbyname('preco_promocao').ascurrency;

  if (preco > 0) then
  begin
    custo := preco / (1 + (margem_lucro_ideal / 100));
    SetRoundMode(rmDown);
    mmVendas2PRECO_CUSTO.Value := custo;
    mmVendas2PRECO_VENDA.Value := preco;
    if (mmVendas2PRECO_VENDA.Value <> preco) then
    begin
      mmVendas2PRECO_LIQUIDO.Value := preco;
      mmVendas2DESCONTO.VALUE := 0;
    end;
    mmVendas2PROMOCAO.AsString := 'S';
  end
  else
  begin
    produto_alterado := true;
    dados_produto(mecod_produto.Text);
  end;

end;

procedure TFr_vendas_industria2.MeqtdExit(Sender: TObject);
begin
  if activecontrol.Name = 'btcan' then
    exit;

  if mmVendas2.state in [dsbrowse] then
    exit;

  if Meqtd.Value = 0 then
  begin
    ShowMessage('Quantidade tem que ser preenchida.');
    Meqtd.SetFocus;
    exit;
  end;

  if trim(mmVendas2COD_PRODUTO.AsString) <> '' then
    if not fmfun.ValidarQuantidade(mmvendas2cod_produto.AsString,
      mmVendas2qtd.Value) then
    begin
      meqtd.SetFocus;
      exit;
    end;

  mmVendas2PRECO_LIQUIDO.Value := mmVendas2PRECO_VENDA.value -
    (mmVendas2PRECO_VENDA.value * mmVendas2desconto.Value / 100);
  mmVendas2sub_total.Value := mmVendas2PRECO_LIQUIDO.Value * mmVendas2qtd.Value;
  mmVendas2PESO_TOTAL.Value := mmVendas2PESO.Value * mmVendas2qtd.Value;
  Meipi_itemExit(Self);

  if (FRPRI.TipUsu = '0') or (FRPRI.TipUsu = '1') or telemarketing or
    representacao then
    PromocaoPorQuantidade(mmVendas2QTD.AsString);
end;

function TFr_vendas_industria2.TodosPromocao: Boolean;
begin
  Result := true;
  {  mmVendas2.DisableControls;
    mmVendas2.First;
    while not mmVendas2.Eof do
    begin
      if mmVendas2PROMOCAO.AsString = 'N' then
      begin
        Result := false;
        mmVendas2.EnableControls;
        exit;
      end;
      mmVendas2.Next;
    end;
    mmVendas2.First;
    mmVendas2.EnableControls;
    }
end;

function TFr_vendas_industria2.ValidarDesconto: boolean;
begin
  if mmVendas2.state in [dsbrowse] then
    exit;

  //  if (mform = 'vendas_devolucoes') or (FRPRI.TipUsu = '0') or (FRPRI.TipUsu = '1') or representacao then
  if (mform = 'vendas_devolucoes') then
  begin
    liberado := true;
    Result := liberado;
    exit;
  end;

  if desconto_maximo = '' then
    desconto_maximo := '0';

  if Btaltped.Enabled = False then
  begin

    liberado := true;

    if (mmVendas2desconto.Value > mmVendas2DESCONTO_MAXIMO.Value) and
      (mmVendas2PROMOCAO.AsString = 'S') {and (not promocao_desconto)} then
    begin
      dao.msg('Não é possível dar desconto para produtos em promoção!');
      mmVendas2desconto.Value := mmVendas2DESCONTO_MAXIMO.Value;
      MedescontoExit(self);
      Medesconto.SetFocus;
      liberado := false;
    end;

    if (roundto(mmVendas2desconto.Value, -2) >
      roundto(mmVendas2desconto_Maximo.asfloat, -2)) and
      (Prcod_fop.Text <> '7') and (usuario_liberou_desconto = '') and
      (trim(Prnumdoc.Text) <> '') and (mmVendas2NAO_VALIDAR_MARGEM.AsString =
      'S') then
    begin
      if
        fmfun.Dc_MessageDlg('Desconto Superior ao Permitido para este Produto!. Solicitar Liberação?',
        mtConfirmation, [mbyes, mbno], 0, mrno) = mryes then
      begin

        Application.CreateForm(TFr_senha_especial, Fr_senha_especial);
        Fr_senha_especial.ShowModal;
        if not liberado then
        begin
          mmVendas2desconto.Value := mmVendas2desconto_Maximo.Value;
          medesconto.SetFocus;
        end
        else
        begin
          Application.CreateForm(TFmMotivo, FmMotivo);
          FmMotivo.ShowModal;
          if FmMotivo.modalresult = mrOk then
          begin
            gravar_liberacao_desconto(Fr_senha_especial.codusu,
              fmmotivo.mmMotivo.text);
            liberado := true;
          end
          else
            liberado := false;
          FmMotivo.free;
        end;
      end
      else
        liberado := false;

      {  if (Prcod_fiscal.Text = '5102') or (Prcod_fiscal.Text = '6102') or
          (Prcod_fiscal.Text = '5405') or (Prcod_fiscal.Text = '6403') then
        begin
          if (mmVendas2desconto.Value > strtofloat(desconto_maximo)) and
            (Prcod_fop.Text <> '7') and (usuario_liberou_desconto = '') and
            (trim(Prnumdoc.Text) <> '') then
          begin
                  if fmfun.Dc_MessageDlg('Desconto Superior ao Permitido para este Cliente!. Solicitar Liberação?',
                    mtConfirmation, [mbyes, mbno], 0, mrno) = mryes then
                  begin
                    Application.CreateForm(TFr_senha_especial, Fr_senha_especial);
                    Fr_senha_especial.ShowModal;
                    if not liberado then
                    begin
                      mmVendas2desconto.Value := 0;
                      medesconto.SetFocus;
                      exit;
                    end
                    else
                    begin
                      Application.CreateForm(TFmMotivo, FmMotivo);
                      FmMotivo.ShowModal;
                      if FmMotivo.modalresult = mrOk then
                      begin
                        gravar_liberacao_desconto(Fr_senha_especial.codusu, fmmotivo.mmMotivo.text);
                        liberado := true;
                        mostra := false;
                      end
                      else
                        liberado := false;
                      FmMotivo.free;
                    end;
                    Fr_senha_especial.free;
                  end
                  else
            liberado := false;
          end; //0,5% de margem de tolerância... roundto(mmVendas2desconto_Maximo.asfloat,-2)

        end
        else liberado := true;
      end;
      else
       if representacao then
         liberado := true;}
    end;
  end;
  CalculaSubTotais;
  Result := liberado;
end;

procedure TFr_vendas_industria2.MedescontoExit(Sender: TObject);
begin

  if not ValidarDesconto then
  begin
    Medesconto.SetFocus;
    exit;
  end;

  if mmVendas2desconto.Value > 0 then
  begin
    mmVendas2PRECO_LIQUIDO.Value := roundto(mmVendas2PRECO_VENDA.value -
      (mmVendas2PRECO_VENDA.value * mmVendas2desconto.Value / 100),
      (CasasDecimais
      * (-1)));
    mmVendas2sub_total.Value := mmVendas2PRECO_LIQUIDO.Value *
      mmVendas2qtd.Value;
  end;
  {  if mmVendas2desconto.Value > 0 then
      mmVendas2DESCONTO_VALOR.Value := roundto(mmVendas2sub_total.value * (mmVendas2desconto.Value / 100), (CasasDecimais * (-1)))
    else
      mmVendas2DESCONTO_VALOR.Value := 0;}
end;

procedure TFr_vendas_industria2.CalculaSubTotais;
begin
  if mmVendas2.state in [dsBrowse] then
    exit;

  mmVendas2sub_total.Value := mmVendas2PRECO_LIQUIDO.Value * mmVendas2qtd.Value;
  {
   mmVendas2PRECO_LIQUIDO.Value := roundto(mmVendas2PRECO_VENDA.value -
     (mmVendas2PRECO_VENDA.value * mmVendas2desconto.Value / 100), (CasasDecimais * (-1)));
   mmVendas2sub_total.Value := mmVendas2PRECO_LIQUIDO.Value * mmVendas2qtd.Value;}

end;

procedure TFr_vendas_industria2.MeprecoExit(Sender: TObject);
begin
  if mmVendas2.state in [dsbrowse] then
    exit;

  mmVendas2desconto.Value := 100 - ((mmVendas2PRECO_LIQUIDO.Value /
    (mmVendas2PRECO_VENDA.value) * 100));

  if not ValidarDesconto then
  begin
    mmVendas2PRECO_LIQUIDO.Value := mmVendas2PRECO_VENDA.Value;
    Mepreco.SetFocus;
    exit;
  end;

  mmVendas2PRECO_LIQUIDO.Value := roundto(mmVendas2PRECO_VENDA.value -
    (mmVendas2PRECO_VENDA.value * mmVendas2desconto.Value / 100), (CasasDecimais
    * (-1)));
  mmVendas2sub_total.Value := mmVendas2PRECO_LIQUIDO.Value * mmVendas2qtd.Value;

  {  if Meicms_item.visible then
      Meicms_item.setfocus;}

end;

procedure TFr_vendas_industria2.LimpaDescLucro;
begin
  habilita_faturamento := false;
end;

procedure TFr_vendas_industria2.FormShow(Sender: TObject);
var
  ambNFe: string;
  x, mes, ano, posicao: integer;

  procedure SetaPosicao;
  begin
    mepreco.Left := mepreco.Left - posicao;
    Medesconto.Left := Medesconto.Left - posicao;
    MeDesconto_Valor.Left := MeDesconto_Valor.Left - posicao;
    Mesub_total.Left := mesub_total.Left - posicao;

    lbDesc.Left := lbDesc.Left - posicao;
    lbDescValor.Left := lbDescValor.Left - posicao;
    lbPrecoLiq.Left := lbPrecoLiq.Left - posicao;
    lbTotalLiq.Left := lbTotalLiq.Left - posicao;

    {    lbICMSItem.Left := lbICMSItem.Left - posicao;
    //    lbBC_ST.Left := lbBC_ST.Left - posicao;
    //    lb_valor_st.Left := lb_valor_st.Left - posicao;

    //    Mevlr_bc_st.Left := Mevlr_bc_st.left - posicao;
        Mevlr_icms_st.Left := Mevlr_icms_st.left - posicao;

        lbTotalICMS.Left := lbTotalICMS.Left - posicao;
        lbIPIitem.Left := lbIPIitem.Left - posicao;
        lbTotalIPI.Left := lbTotalIPI.Left - posicao;

        Meicms_item.left := Meicms_item.Left - posicao;
        Mevlr_icms_item.Left := mevlr_icms_item.Left - posicao;
        Meipi_item.left := Meipi_item.Left - posicao;
        Mevlr_ipi_item.left := Mevlr_ipi_item.Left - posicao;

        }
  end;
begin
  BtnEnviarPedido.Visible := FRPRI.sbTransmissao.Visible;
  btnExportaFrente.Visible := FRPRI.Frente_Caixa;
  TaAgrupar.TabVisible := false;

  dao.Geral3('select representacao, agrupar_pedidos, modelo_desconto, tinta_base, OBRIGATORIEDADE_PESO, industria from configuracao where cod_conf=' + QuotedStr('1'));
  obrigatoriedade_peso := dao.Q3.fieldbyname('OBRIGATORIEDADE_PESO').AsString =
    'S';
  representacao := dao.Q3.fieldbyname('representacao').AsString = 'S';
  modelo_desconto := dao.Q3.fieldbyname('modelo_desconto').AsInteger;
  industria := dao.Q3.fieldbyname('industria').AsString = 'S';

  if modelo_desconto = 1 then
  begin
    lbDesc.Visible := true;
    lbDescValor.Visible := false;
    Medesconto.Visible := true;
    Medesconto_Valor.Visible := false;
    posicao := 0;
  end;

  if modelo_desconto = 2 then
  begin
    lbDesc.Visible := false;
    lbDescValor.Visible := true;
    Medesconto.Visible := false;
    Medesconto_Valor.Visible := true;
    posicao := Mepreco.Left - Medesconto.Left;
  end;
  SetaPosicao;

  if dao.Q3.fieldbyname('tinta_base').AsString <> 'S' then
  begin
    lbPrecoBase.Visible := false;
    MePrecoBase.Visible := false;

    if Medesconto.Visible then
      posicao := Medesconto.Left - MePrecoBase.Left
    else
      posicao := Mepreco.Left - MePrecoBase.Left;

    SetaPosicao;
  end;

  agrupar_pedidos := dao.Q3.fieldbyname('agrupar_pedidos').AsString = 'S';

  cliente_alterado := false;
  desconto_prazo := 0;
  desconto_forma := 0;
  if FRPRI.TipUsu >= '2' then
    Gbanalise_custo.Visible := true
  else
    Gbanalise_custo.Visible := false;

  BtnMaisPrecos.Visible := false;

  if (FRPRI.TipUsu = '0') or (FRPRI.TipUsu = '1') or representacao then
  begin
    agrupar_pedidos := false;

    ImprimirPedidoDetalhado1.Visible := false;
    FaturamentoAvulso1.Visible := false;
    DesfaturarPedido1.Visible := false;
    CancelamentoAvulso1.Visible := false;
    ImprimirEtiquetadeTransporte1.Visible := false;
    imprimirLotedePedidos1.Visible := false;
    //    bt_faturar.Visible := false;
    btnnfe.Visible := false;
    btnBoleto.Visible := false;
    BtnEmailBoleto.Enabled := false;
    gbAtalhos.Visible := false;
    tab_cr1.TabVisible := false;
    taNFE.TabVisible := false;
    tab_Finalizar.TabVisible := false;
    TaNFeDevol.TabVisible := false;
    //BtnMaisPrecos.Visible := true;
    lblucro.visible := false;
    edMargemLucro.Visible := false;
    gbImpostos.Visible := false;
    Gbanalise_custo.Visible := false;
    gbTotalFaturado.Visible := false;
    btnEtiqueta.Visible := false;
    lbcontabanco.Visible := false;
    PrCONTA_BOLETO.Visible := false;
    lbCCBoleto.Visible := false;
    lbObs.Top := lbcontabanco.Top;
    Probservacoes_pedido.Top := PrCONTA_BOLETO.Top;
    gbtotal.Height := 40;
    BtnEmailPedido.Visible := true;
    btAltRep.Enabled := false;

    Lbnom_supervisor.Visible := false;
    lbSupervisor.Visible := false;
    Prcod_supervisor.Visible := false;
  end;

  if (FRPRI.TipUsu = '1') then
    Btaltped.Enabled := false
  else
    Btaltped.Enabled := true;

  LimpaDescLucro;

  lbStatusCancel.Caption := ' ';
  Btgrava_cr1.Caption := 'Gravar Alterações' + #13 + 'no Contas a Receber';
  Btinsere_cheque.Caption := 'Inserir Cheque' + #13 +
    'Referente a essa parcela';
  paAtributo.Visible := false;
  readonly_true('Pr');
  readonly_true('Me');

  Btnovped.Enabled := true;
  BtnEmailPedido.Enabled := true;

  Btgraped.Enabled := false;
  Btcanped.Enabled := false;
  Btexcped.Enabled := false;
  Btlocped.Enabled := true;
  //BtnNfe.Enabled := dao.terminal_nfe;

  Sg_cheque.Cells[0, 0] := 'Nº Cheque';
  Sg_cheque.Cells[1, 0] := 'Ag';
  Sg_cheque.Cells[2, 0] := 'C.C';
  Sg_cheque.Cells[3, 0] := 'Dta. Emissão';
  Sg_cheque.Cells[4, 0] := 'Dta. Vencimento';
  Sg_cheque.Cells[5, 0] := 'Valor';
  Sg_cheque.Cells[6, 0] := 'Titular';
  Pacheque.Visible := false;
  sbvendas.Panels[2].Text := '';
  sbvendas.Panels[1].Text := '';

  prcod_fornecedor.Visible := not venda;
  LbNom_fornecedor.Visible := not venda;
  lbForn.Visible := not venda;
  lbcidade_forn.Visible := not venda;
  lbCnpj_forn.Visible := not venda;

  if mform = 'vendas_devolucoes' then
  begin
    MeTrib_ICMS.enabled := true;
    lbIPIitem.Visible := true;
    lbTotalIPI.Visible := true;
    lbICMSitem.Visible := true;
    lbTotalICMS.Visible := true;

    Meipi_item.Visible := true;
    Mevlr_ipi_item.Visible := true;
    Meicms_item.Visible := true;
    Mevlr_icms_item.Visible := true;
    lbCST.Visible := true;

    lbBC_ST.Visible := true;
    lb_valor_st.Visible := true;
    Mevlr_bc_st.Visible := true;
    Mevlr_icms_st.Visible := true;

  end
  else
  begin
    if (FRPRI.TipUsu = '0') or (FRPRI.TipUsu = '1') or representacao then
      Probservacoes_pedido.Height := 111
    else
      Probservacoes_pedido.Height := 63;

    lbCST.Visible := true;
    MeTrib_ICMS.enabled := false;
    lbIPIitem.Visible := false;
    lbTotalIPI.Visible := false;
    lbICMSitem.Visible := false;
    lbTotalICMS.Visible := false;

    Meipi_item.Visible := false;
    Mevlr_ipi_item.Visible := false;
    Meicms_item.Visible := false;
    Mevlr_icms_item.Visible := false;

    cliente_anterior := '';

    lbBC_ST.Visible := false;
    lb_valor_st.Visible := false;
    Mevlr_bc_st.Visible := false;
    Mevlr_icms_st.Visible := false;

  end;

  dao.Geral1('SELECT a.COD_EMPRESA||''-''||a.NOM_EMPRESA as EMPRESA FROM EMPRESA a');
  dao.Q1.First;
  cbEmpresa.Items.Clear;
  while not dao.Q1.Eof do
  begin
    cbEmpresa.Items.Add(dao.Q1.fieldbyname('EMPRESA').AsString);
    dao.Q1.Next;
  end;

  cbMes.Items.Clear;
  mes := strtoint(FormatDateTime('m', now));
  ano := strtoint(FormatDateTime('yyyy', now));

  for x := 0 to 2 do
  begin
    if (mes - x) <= 0 then
      cbMes.Items.Add(fmfun.enchezero(inttostr(12 + (mes - x)), 2) + '/' +
        inttostr(ano - 1))
    else
      cbMes.Items.Add(fmfun.enchezero(inttostr(mes - x), 2) + '/' +
        inttostr(ano));
  end;
  if (FRPRI.TipUsu > '1') then
  begin
    cbEmpresa.ItemIndex := 0;
    cbMes.ItemIndex := 0;

    CarregaTotaisEmpresa;
  end;

  {  ambNfe := FMFUN.BuscaAmbienteNFE;
    if ambNFe = '1' then

     WebServices.Ambiente := 'taProducao'
    else
     ACBrNFe1.WebServices.Ambiente := 'taHomologacao';}
end;

procedure TFr_vendas_industria2.CarregaTotaisEmpresa;
var
  sql_nfe_dev: string;
  total: currency;
begin
  if ckSemDev.Checked then
    sql_nfe_dev := 'A.NFE_DEV IS NULL AND '
  else
    sql_nfe_dev := '';

  dao.Geral1('SELECT SUM(A.TOT_LIQUIDO) AS TOTAL  ' +
    'FROM VENDAS1 a WHERE  A.FATURADO in (1,3) and ' + sql_nfe_dev +
    'A.EMPRESA_FATURAR = ' + copy(cbEmpresa.Text, 1, 1) + ' and ' +
    'case when extract(MONTH FROM a.DTA_EMISSAO) < 10 then ''0''||extract(MONTH FROM a.DTA_EMISSAO) else extract(MONTH FROM a.DTA_EMISSAO) end||''/''||EXTRACT(YEAR FROM A.DTA_EMISSAO)  = ''' +
    cbMes.Text + '''');

  if dao.Q1.fieldbyname('TOTAL').IsNull then
    total := 0
  else
    total := dao.Q1.fieldbyname('TOTAL').Value;

  lbTotalFaturado.Caption := formatfloat('R$ #,###,##0.00', total);
end;

procedure TFr_vendas_industria2.SgProSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  lin := ARow;
  scroll_sgpro;
end;

procedure TFr_vendas_industria2.scroll_sgpro;
begin

end;

procedure TFr_vendas_industria2.SgProCellsChanged(Sender: TObject;
  R: TRect);
begin
  //  scroll_sgpro;

end;

procedure TFr_vendas_industria2.SgProClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  //  scroll_sgpro;
  lin := ARow;
end;

procedure TFr_vendas_industria2.Meid_corButtonClick(Sender: TObject);
var
  q_campos_proponente: TFDQuery;
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;

  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  //guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Cor';

  chamou_pesquisa := 'fr_cor';
  chamou_form := 'fr_entrada_cor';
  chamou_cadastro := 'fr_cor';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cores';
  Fr_localizar.BT_cadastro.Visible := true;
  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Cor';

  for i := 0 to 1 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_vendas_industria2.Meid_corKeyPress(Sender: TObject; var Key:
  Char);
var
  q_campos_proponente: TFDQuery;
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;

  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin

  if not (key in ['0'..'9', #8]) and (key <> #13) then
  begin
    beep; {somente delphi 2.0 ou >}
    key := #0;
  end;

  if key = #13 then
  begin
    if (Meid_Cor.Text = '') and (BtNov.Enabled = false) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);
      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Cor';

      chamou_pesquisa := 'fr_cor';
      chamou_form := 'fr_entrada_cor';
      chamou_cadastro := 'fr_cor';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cores';
      Fr_localizar.BT_cadastro.Visible := true;
      //preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo, 2);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Cor';

      for i := 0 to 1 do
      begin
        valor_combo := campos_combo[i];
        Fr_localizar.CBcampos.Items.Add(valor_combo);
      end;
      Fr_localizar.CBcampos.ItemIndex := 1;

      Fr_localizar.ShowModal;
      Fr_localizar.Free;

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;
    end
    else if Meid_cor.Text <> '' then
    begin
      dao.Geral2('select cor from cores where id=' + QuotedStr(Meid_cor.Text));
      if dao.q2.RecordCount > 0 then
        LbCor.Caption := dao.Q2.fieldbyname('cor').AsString
      else
      begin
        dao.msg('Registro não Encontrado');
        Meid_cor.Text := '';
        Meid_cor.SetFocus;
        Exit;
      end;

    end;

    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;

end;

procedure TFr_vendas_industria2.Meid_TamanhoButtonClick(Sender: TObject);
var
  q_campos_proponente: TFDQuery;
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;

  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);
  //guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Tamanho';

  chamou_pesquisa := 'fr_tamanho';
  chamou_form := 'fr_entrada_tamanho';
  chamou_cadastro := 'fr_tamanho';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + ' Tamanhos';
  Fr_localizar.BT_cadastro.Visible := true;
  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Tamanho';

  for i := 0 to 1 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_vendas_industria2.Meid_TamanhoKeyPress(Sender: TObject; var Key:
  Char);
var
  q_campos_proponente: TFDQuery;
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;

  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin

  if not (key in ['0'..'9', #8]) and (key <> #13) then
  begin
    beep; {somente delphi 2.0 ou >}
    key := #0;
  end;

  if key = #13 then
  begin
    if (Meid_tamanho.Text = '') and (BtNov.Enabled = false) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);
      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Tamanho';

      chamou_pesquisa := 'fr_tamanho';
      chamou_form := 'fr_entrada_tamanho';
      chamou_cadastro := 'fr_tamanho';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + ' Tamanhos';
      Fr_localizar.BT_cadastro.Visible := true;
      //preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo, 2);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Tamanho';

      for i := 0 to 1 do
      begin
        valor_combo := campos_combo[i];
        Fr_localizar.CBcampos.Items.Add(valor_combo);
      end;
      Fr_localizar.CBcampos.ItemIndex := 1;

      Fr_localizar.ShowModal;
      Fr_localizar.Free;

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;
    end
    else if Meid_Tamanho.Text <> '' then
    begin
      dao.Geral2('select tamanho from tamanho where id=' +
        QuotedStr(Meid_Tamanho.Text));
      if dao.q2.RecordCount > 0 then
        Lbtamanho.Caption := dao.Q2.fieldbyname('tamanho').AsString
      else
      begin
        dao.msg('Registro não Encontrado');
        Meid_Tamanho.Text := '';
        Meid_Tamanho.SetFocus;
        Exit;
      end;

    end;

    Mevolume.SetFocus;
    key := #0;
  end;

end;

procedure TFr_vendas_industria2.Meid_TamanhoExit(Sender: TObject);
begin
  if Meid_Tamanho.Text <> '' then
  begin
    dao.Geral2('select tamanho from tamanho where id=' +
      QuotedStr(Meid_Tamanho.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbtamanho.Caption := dao.Q2.fieldbyname('tamanho').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Meid_Tamanho.Text := '';
      Meid_Tamanho.SetFocus;
      Exit;
    end;

  end;

end;

procedure TFr_vendas_industria2.Meid_corExit(Sender: TObject);
begin
  if Meid_cor.Text <> '' then
  begin
    dao.Geral2('select cor from cores where id=' + QuotedStr(Meid_cor.Text));
    if dao.q2.RecordCount > 0 then
    begin
      LbCor.Caption := dao.Q2.fieldbyname('cor').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Meid_cor.Text := '';
      Meid_cor.SetFocus;
      Exit;
    end;

  end;

end;

procedure TFr_vendas_industria2.ativa_vendas1(id: string);
begin
  with q_vendas1 do
  begin
    close;
    sql.Clear;
    sql.Add('select a.NUMDOC, a.NUMDOC_GRUPO, a.HORA, a.DTADOC, a.MOTIVO_NFE_CANCEL_INTERNO, a.COD_CLIENTE, a.COD_USUARIO, a.COD_EMPRESA, ' +
      'a.FATURADO, a.CONSIGNACAO, a.ORCAMENTO, a.ENTREGUE, a.TOT_BRUTO, a.DESCONTO, a.TOT_LIQUIDO, ' +
      'a.PRAZO_PGTO, a.COD_FOP, a.NUM_CUPOM, a.TIPO_VENDA, a.QTD_PARCELAS, a.PONTO_USADO, ' +
      'a.USUARIO_DESFATUROU, a.COD_REPRESENTANTE, a.COD_PRAZO_PGTO, a.CUSTO_TOTAL, a.LUCRO_MEDIO, ' +
      'a.DTA_EMISSAO, a.DTA_SAIDA, a.EMPRESA_FATURAR, a.NF, a.OBSERVACOES_PEDIDO, a.OBSERVACOES_NOTA, ' +
      'a.COD_TRANSPORTADORA, a.TIPO_FRETE, a.VOLUME_NOTA, a.PESO_NOTA, a.COD_CARGA, a.VL_FRETE, ' +
      'a.CONTATO_FRETE, a.PED_IMPRESSO, a.DTA_VENCIMENTO_CONSIG, a.CANCELADO, a.CONTEM_AVARIA, ' +
      'a.CONTEM_ETIQUETA, a.MOTIVO_TROCA, a.NR_VENDA_ORIGINAL, a.PEDIDO, a.VENDA_ENVIADA, ' +
      'a.CREDITO_USADO, a.NR_PEDIDO_PALM, o.numdoc as pedido_origem, a.BOLETO_ANEXO, a.COD_FISCAL, a.VLR_COMISSAO, a.ValorDescontoAdic, ' +
      'a.VLR_BC_ICMS, a.VLR_ICMS, a.VLR_ST, a.VLR_TOT_NF, a.VLR_BC_ICMS_ST, a.CHAVE_NFE, a.desconto_valor, ' +
      'a.RECIBO_NFE, a.STATUS_NFE, a.MOTIVO_NFE, a.DIGEST_NFE, a.PROTOCOLO_NFE, a.DATA_REC_NFE, ' +
      'a.JUSTIF_CANC_NFE, a.COD_SUPERVISOR, a.COD_FORNECEDOR, a.NFE, a.VLR_IPI, a.PALM_NR_CONEXAO, ' +
      'a.SINCRONIZAR_PALM, a.NUMDOC_REF, a.FRETE_COMBINADO, a.DT_FRETE_COMBINADO, a.EMAIL_NFE, coalesce(ce.uf, ''SC'') as uf_emissor, e.ENQUADRADA_SIMPLES, ' +
      'a.EMAIL_PEDIDO, a.PEDIDO_VENDEDOR, a.USUARIO_CHECOU_PEDIDO_VENDEDOR, a.CONTA_BOLETO, a.AVISOGNRE, ' +
      'a.USUARIO_CHECOU_FRETE_COMBINADO, a.ABERTO_USUARIO, a.MAQUINA_USUARIO_ABERTO, A.CARTACORRECAO, a.NR_PEDIDO_PALM, e.logo, ' +
      'case when (a.DATA_REC_NFE + 1) < current_timestamp THEN 1 ELSE 0 END AS PRAZO_CANCEL, a.USUARIO_LIBEROU_DESCONTO, a.MOTIVO_LIBERACAO_DESCONTO, ' +
      'c.nom_cliente, c.cnpj, c.pre_cadastro, c.desconto_maximo, CASE WHEN a.cod_cliente is not null then CASE WHEN c.IE = ''ISENTO'' THEN ''1'' ELSE CASE WHEN c.ie is null  and c.TIP_PESSOA = ''J'' THEN ''2'' ELSE ''0'' END END END AS ISENTO, ' +
      'r.nom_representante, s.nom_representante as supervisor, r.funcionario, f.nom_fop, f.desconto as desconto_forma, p.desconto as desconto_prazo, p.prazo, e.nom_empresa, t.nome, cd.nom_cidade, cd.uf, cf.nome as nom_cod_fiscal, ' +
      'a.CHAVE_NFE_DEV, a.RECIBO_NFE_DEV, a.STATUS_NFE_DEV, a.MOTIVO_NFE_DEV, a.DIGEST_NFE_DEV, a.PROTOCOLO_NFE_DEV, a.DATA_REC_NFE_DEV, a.JUSTIF_CANC_NFE_DEV, a.NFE_DEV, ' +
      '(select max(v3.nfe) from vendas1 v3 where v3.cod_cliente = c.COD_CLIENTE and v3.nfe <> a.nfe) as ultima_nf, c.consumidor_final, a.numdoc_destino, f.avista, f.NAO_GERAR_CR ' +
      'from vendas1 a ' +
      'left join vendas1_orig o on o.numdoc = a.numdoc ' +
      'left join cliente c on c.cod_cliente = a.cod_cliente ' +
      'left join fornecedor fn on fn.cod_fornecedor = a.cod_fornecedor ' +
      'left join cidades cd on cd.cod_cidade= c.cod_cidade ' +
      'left join representante r on r.id = a.cod_representante ' +
      'left join representante s on s.id = a.cod_supervisor ' +
      'left join fop f on f.cod_fop = a.cod_fop ' +
      'left join prazo p on p.id = a.cod_prazo_pgto ' +
      'left join empresa e on e.cod_empresa = a.empresa_faturar ' +
      'left join cidades ce on ce.cod_cidade= e.cod_cidade ' +
      'left join transportadora t on t.cod_transportadora = a.cod_transportadora ' +
      'left join cod_fiscal cf on cf.cod_fiscal= a.cod_fiscal ' +
      'where a.numdoc=' + QuotedStr(id));
    open;
    edUltimaNf.Text := fieldbyname('ultima_nf').AsString;
  end;

end;

procedure TFr_vendas_industria2.ativa_vendas2(nr_documento: string);
begin
  with q_vendas2 do
  begin
    close;
    sql.Clear;
    sql.Add('select V2.ID, COALESCE(V2.PROMOCAO, ''N'') AS PROMOCAO, V2.NCM, V2.DESCONTO_VALOR, V2.TRIB_ICMS, V2.COD_FISCAL_ITEM, V2.CESTA_BASICA, V2.COD_PRODUTO, V2.VOLUME, V2.QTD, COALESCE(V2.PRECO_CUSTO, P.CUSTO_TOTAL) AS PRECO_CUSTO, V2.PRECO_BRUTO, ' +
      ' coalesce(V2.PERC_COMISSAO, (SELECT VW.PERC_COMISSAO FROM V_VENDA VW inner join vendas1 v1 on (v1.NUMDOC = vw.NUMDOC) WHERE VW.ID = V2.ID and vw.CODREP = v1.COD_REPRESENTANTE )) AS PERC_COMISSAO, ' +
      ' V2.VLR_COMISSAO, V2.PRECO_BASE, p.cod_grupo, V2.NAO_VALIDAR_MARGEM, ' +
      ' V2.DESCONTO, V2.PRECO, V2.sub_total, COALESCE(V2.ipi_item, 0) AS IPI_ITEM, COALESCE(V2.vlr_ipi_item,0) AS VLR_IPI_ITEM, ' +
      ' COALESCE(V2.vlr_bc,0) AS VLR_BC, COALESCE(V2.icms_item, 0) AS ICMS_ITEM, COALESCE(V2.vlr_icms_item,0) AS VLR_ICMS_ITEM, COALESCE(V2.vlr_agr_item,0) AS VLR_AGR_ITEM, COALESCE(V2.vlr_bc_st,0) AS VLR_BC_ST, ' +
      ' COALESCE(V2.vlr_icms_st,0) AS VLR_ICMS_ST, CASE WHEN V2.PROMOCAO = ''S'' THEN P.PRECO_PROMOCAO ELSE P.PRECO_VENDA END PRECO_VENDA, p.nom_produto, ' +
      ' p.QTD_ESTOQUE, p.qtd_embalagem, p.CODIGO_BARRA, p.unidade, ' +
      '   ( SELECT distinct max((a.PRECO_VENDA - a.PRECO_INI)/a.PRECO_VENDA)*100 ' +
      '     FROM V_GRADE_COMISSAO a ' +
      '     WHERE A.COD_PRODUTO = P.COD_PRODUTO AND A.CODREP = v1.cod_representante ' +
      '   ) AS DESCONTO_MAXIMO, ' +
      ' p.ESTOQUE_MINIMO, p.QTD_RESERVADO, P.GRADE_COMISSAO, P.PESO, (P.PESO * V2.QTD) AS PESO_TOTAL ' +
      ' from vendas2 v2 ' +
      ' INNER JOIN VENDAS1 V1 ON (V1.NUMDOC = V2.NUMDOC) ' +
      ' left join produto p on p.cod_produto = v2.cod_produto ' +
      ' where v2.numdoc = ' + QuotedStr(nr_documento) +
      ' order by p.ord_pauta ');
    open;
  end;

end;

procedure TFr_vendas_industria2.mostra_campos_vendas1(prefixo: string);
var
  i: integer;
  campo, campo1: string;
begin
  Screen.Cursor := crSQLWait;
  Pc_vendas.ActivePage := tab_mercadorias;
  for i := 0 to ComponentCount - 1 do
  begin
    if copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
      begin
        campo := TsEdit(Components[i]).Name;
        campo1 := copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
        TsEdit(FindComponent(campo)).Text :=
          q_vendas1.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TsRichEdit then
      begin
        campo := TsRichEdit(Components[i]).Name;
        campo1 := copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
        TsRichEdit(FindComponent(campo)).Text :=
          q_vendas1.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TsComboEdit then
      begin
        campo := TsComboEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        TsComboEdit(FindComponent(campo)).Text :=
          q_vendas1.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TsCurrencyEdit then
      begin
        campo := TsCurrencyEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        TsCurrencyEdit(FindComponent(campo)).Value :=
          q_vendas1.fieldbyname(campo1).AsFloat;
      end
      else if Components[i] is TComboBox then
      begin
        campo := TComboBox(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);

        TComboBox(FindComponent(campo)).ItemIndex :=
          q_vendas1.fieldbyname(campo1).AsInteger;
      end
      else if Components[i] is tscheckbox then
      begin
        campo := tscheckbox(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        if q_vendas1.fieldbyname(campo1).AsString = 'S' then
          tscheckbox(FindComponent(campo)).Checked := true
        else
          tscheckbox(FindComponent(campo)).Checked := false;
      end
      else if Components[i] is TsDateEdit then
      begin
        campo := TsDateEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);

        TsDateEdit(FindComponent(campo)).Date :=
          q_vendas1.fieldbyname(campo1).AsDateTime;
      end
      else if Components[i] is TMaskEdit then
      begin
        campo := TMaskEdit(Components[i]).Name;
        campo1 := copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
        TMaskEdit(FindComponent(campo)).Text :=
          q_vendas1.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TDateTimePicker then
      begin
        campo := TDateTimePicker(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);

        TDateTimePicker(FindComponent(campo)).DateTime :=
          q_vendas1.fieldbyname(campo1).AsDateTime;
      end;

    end;

  end; //end do for

  empresa_simples := q_vendas1.fieldbyname('ENQUADRADA_SIMPLES').AsString = 'S';
  cliente_consumidor_final := q_vendas1.fieldbyname('consumidor_final').AsString
    = 'S';
  cliente_isento_icms := q_vendas1.fieldbyname('isento').AsString = '1';
  cliente_sem_ie := q_vendas1.fieldbyname('isento').AsString = '2';
  cliente_pre_cadastrado := q_vendas1.fieldbyname('pre_cadastro').AsString =
    'S';
  Btexcped.Enabled := q_vendas1.fieldbyname('faturado').AsString = '0';

  LbNom_cliente.Caption := q_vendas1.fieldbyname('nom_cliente').AsString +
    ' | Cnpj: ' + q_vendas1.fieldbyname('cnpj').AsString +
    ' | Cidade: ' + q_vendas1.fieldbyname('nom_cidade').AsString + '-' +
    q_vendas1.fieldbyname('uf').AsString;

  uf_cliente := q_vendas1.fieldbyname('uf').AsString;
  UF_Emissor := q_vendas1.fieldbyname('uf_emissor').AsString;

  Pedido_AVista := q_vendas1.fieldbyname('avista').AsString = 'S';
  gerar_cr := q_vendas1.fieldbyname('NAO_GERAR_CR').AsString <> 'S';

  Lbnom_representante.Caption :=
    q_vendas1.fieldbyname('nom_representante').AsString;

  Lbnom_supervisor.Caption :=
    q_vendas1.fieldbyname('supervisor').AsString;

  if not venda then
    Prcod_fornecedorExit(Self);

  representante_funcionario := q_vendas1.fieldbyname('funcionario').AsString =
    'S';

  Lbnom_fop.Caption := q_vendas1.fieldbyname('nom_fop').AsString;
  desconto_forma := q_vendas1.fieldbyname('desconto_forma').AsFloat;
  desconto_prazo := q_vendas1.fieldbyname('desconto_prazo').AsFloat;

  Lbprazo_pgto.Caption := q_vendas1.fieldbyname('prazo').AsString;
  Lbempresa_faturamento.Caption :=
    q_vendas1.fieldbyname('nom_empresa').AsString;

  q_vendas1.FieldByName('LOGO').SaveToFile('logo.bmp');
  aviso_conta_boleto := true;

  LbNom_transportadora.Caption := q_vendas1.fieldbyname('nome').AsString;
  desconto_maximo := q_vendas1.fieldbyname('desconto_maximo').AsString;
  mostra := false;
  carrega_vendas2;
  promocao_desconto := TodosPromocao;
  somatotal;
  desconto_anterior := Prdesconto.Value;
  mostra := true;

  if (prstatus_nfe.Text = '100') or
    (prstatus_nfe.Text = '101') then
  begin
    btnNFE.enabled := false;
  end
  else
  begin
    btnNFE.enabled := true;
  end;

  if prstatus_nfe.Text = '100' then
  begin
    btRecXml.enabled := true;
    BtnDanfe.enabled := true;
    btRecXml.enabled := true;
    BtnEmailNFe.Enabled := true;
    btnNFE.enabled := false;

    if PrStatus_Nfe_DEV.Text = '' then
    begin
      btnNfeDev.enabled := true;
      BtnDanfe_Dev.enabled := false;
      btRecXml_Dev.enabled := false;
    end;

    if PrStatus_Nfe_DEV.Text = '100' then
    begin
      BtnDanfe_Dev.enabled := true;
      btnNfeDev.enabled := false;
      btRecXml_Dev.enabled := true;
    end;

    if q_vendas1.fieldbyname('PRAZO_CANCEL').AsString = '1' then
    begin
      lbStatusCancel.Caption := 'Prazo de Cancelamento expirou.';
      BtnEditarCancelamentoNFe.enabled := false;
      BtnEditarCC.enabled := true;
    end
    else
    begin
      lbStatusCancel.Caption := 'Prazo Limite para o Cancelamento: ' +
        formatdatetime('dd/mm/yyyy hh:mm',
        q_vendas1.fieldbyname('DATA_REC_NFE').AsDateTime + 1);
      BtnEditarCancelamentoNFe.enabled := dao.terminal_nfe;
      BtnEditarCC.enabled := true;
    end;
  end
  else
  begin
    btnNFE.enabled := true;
    btnNfeDev.enabled := false;
    BtnEditarCancelamentoNFe.enabled := false;
    BtnEnviarCancelamentoNFe.enabled := false;
    BtnSairCancelamentoNFe.enabled := false;

    BtnEditarCC.enabled := false;
    BtnEnviarCC.enabled := false;
    BtnCancelarCC.enabled := false;

    BtnDanfe.enabled := false;
    btrecxml.enabled := false;
    BtnEmailNFe.Enabled := false;
    lbStatusCancel.Caption := ' ';
  end;

  if (prstatus_nfe.Text = '100') or
    (prstatus_nfe.Text = '101') then
  begin
    btnNFE.enabled := false;
  end
  else
  begin
    btnNFE.enabled := true;
  end;

  {if PrStatus_Nfe_DEV.Text = '100' then
  begin
    btRecXml_Dev.enabled := true;
    BtnDanfe_Dev.enabled := true;
    btnNfeDev.enabled := false;
    BtnEmailNFe_Dev.Enabled := true;

    if q_vendas1.fieldbyname('PRAZO_CANCEL_DEV').AsString = '1' then
    begin
      LBsTATUSCANCEL_DEV.Caption := 'Prazo de Cancelamento expirou.';
      BtnEditarCancelamentoNFeDev.enabled := false;
    end
    else
    begin
      LBsTATUSCANCEL_DEV.Caption := 'Prazo Limite para o Cancelamento: ' +
        formatdatetime('dd/mm/yyyy hh:mm',
        q_vendas1.fieldbyname('DATA_REC_NFE_DEV').AsDateTime + 1);
      BtnEditarCancelamentoNFeDev.enabled := dao.terminal_nfe;
    end;
  end
  else
  begin
    btnNfeDev.enabled := true;
    BtnEditarCancelamentoNFeDev.enabled := false;
    BtnEnviarCancelamentoNFeDev.enabled := false;
    BtnSairCancelamentoNFeDev.enabled := false;

    BtnDanfe_Dev.enabled := false;
    btRecXml_Dev.enabled := false;
    BtnEmailNFe_Dev.Enabled := false;
    LBsTATUSCANCEL_DEV.Caption := ' ';
  end;
  }

  if q_vendas1.fieldbyname('faturado').AsString = '0' then
    sbClonar.Enabled := false
  else
    sbClonar.Enabled := true;

  if q_vendas1.fieldbyname('Chave_nfe').IsNotNull and
    (q_vendas1.fieldbyname('faturado').AsString = '0') then
    BtnNFE.Enabled := true
  else
    BtnNFE.Enabled := false;

  if q_vendas1.fieldbyname('USUARIO_LIBEROU_DESCONTO').IsNotNull then
    usuario_liberou_desconto :=
      q_vendas1.fieldbyname('USUARIO_LIBEROU_DESCONTO').AsString
  else
    usuario_liberou_desconto := '';

  prconta_boletoexit(self);

  AtivaJanela;
  Screen.Cursor := crDefault;
  q_vendas1.Open;

  I1.Enabled := q_vendas1.fieldbyname('NR_PEDIDO_PALM').IsNotNull or
    q_vendas1.fieldbyname('pedido_origem').IsNotNull;
  pedido_tablet := q_vendas1.fieldbyname('NR_PEDIDO_PALM').AsString;

  if q_vendas1.fieldbyname('NR_PEDIDO_PALM').IsNotNull then
  begin
    origem_tipo := 0;
    stOrigem.Caption := 'Pedido Tablet Nº.: ' +
      q_vendas1.fieldbyname('NR_PEDIDO_PALM').AsString;
  end;

  if q_vendas1.fieldbyname('pedido_origem').IsNotNull then
  begin
    origem_tipo := 1;
    stOrigem.Caption := 'Pedido NoteBook Nº.: ' +
      q_vendas1.fieldbyname('pedido_origem').AsString;
  end;

  if not I1.Enabled then
    stOrigem.Caption := '';

  if q_vendas1.FieldByName('NUMDOC_DESTINO').IsNotNull then
  begin
    stOrigem.Caption := 'Pedido Destino Nº.: ' +
      q_vendas1.fieldbyname('NUMDOC_DESTINO').AsString;
    BtnEnviarPedido.Enabled := false;
  end
  else
    BtnEnviarPedido.Enabled := true;
end;

procedure TFr_vendas_industria2.mostra_campos(prefixo: string);
begin

end;

procedure TFr_vendas_industria2.carrega_vendas2;
var
  total_custo: double;
begin
  //  ativa_vendas2(Prnumdoc.Text);
  q_vendas2.First;
  //  if Fr_vendas_industria2.mmVendas2.Active then  Fr_vendas_industria2.mmVendas2.Close;
  mmVendas2.EmptyTable;
  mmVendas2.Open;
  total_custo := 0;

  if q_vendas2.isempty then
    exit;
  btexc.enabled := true;
  WindowList := DisableTaskWindows(fm_splash.Handle);
  q_vendas2.last;
  fm_splash.ggProgress.MaxValue := q_vendas2.RecordCount;
  q_vendas2.First;
  fm_splash.lbStatus.Caption := 'Carregando Itens...';
  fm_splash.ggProgress.progress := 0;
  fm_splash.Show;

  pc_vendas.TabIndex := 0;
  pnWait.Visible := true;
  carregando_item := true;
  while not (q_vendas2.Eof) do
  begin
    mmVendas2.Append;
    mmVendas2ID.AsString := q_vendas2.fieldbyname('id').Value;
    mmVendas2COD_PRODUTO.AsString :=
      q_vendas2.fieldbyname('cod_produto').AsString;
    mmVendas2PROMOCAO.AsString := q_vendas2.fieldbyname('PROMOCAO').AsString;

    if mmVendas2PROMOCAO.AsString = 'S' then
      mmVendas2nom_produto.AsString :=
        q_vendas2.fieldbyname('nom_produto').AsString + ' (PROMOÇÃO)'
    else
      mmVendas2nom_produto.AsString :=
        q_vendas2.fieldbyname('nom_produto').AsString;

    if desconto_forma = 0 then
      mmVendas2DESCONTO_MAXIMO.Value :=
        q_vendas2.fieldbyname('DESCONTO_MAXIMO').AsFloat + (((100 -
        q_vendas2.fieldbyname('DESCONTO_MAXIMO').AsFloat) * desconto_prazo) /
        100)
    else
      mmVendas2DESCONTO_MAXIMO.Value := desconto_forma;

    if mmVendas2PROMOCAO.AsString = 'S' then
      mmVendas2DESCONTO_MAXIMO.Value := 0;

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
    mmVendas2PRECO_VENDA.AsString :=
      q_vendas2.fieldbyname('preco_bruto').AsString;
    mmVendas2DESCONTO.AsString := q_vendas2.fieldbyname('desconto').AsString;
    mmVendas2DESCONTO_VALOR.AsString :=
      q_vendas2.fieldbyname('desconto_valor').AsString;
    mmVendas2PRECO_LIQUIDO.AsString := q_vendas2.fieldbyname('preco').AsString;
    mmVendas2PRECO_CUSTO.AsString :=
      q_vendas2.fieldbyname('preco_CUSTO').AsString;
    mmVendas2PRECO_BASE.AsString :=
      q_vendas2.fieldbyname('preco_BASE').AsString;
    total_custo := total_custo + (mmVendas2QTD.value *
      mmVendas2PRECO_CUSTO.value);
    mmVendas2sub_total.AsString := q_vendas2.fieldbyname('sub_total').AsString;
    mmVendas2ipi_item.AsString := q_vendas2.fieldbyname('ipi_item').AsString;
    mmVendas2vlr_ipi_item.AsString :=
      q_vendas2.fieldbyname('vlr_ipi_item').AsString;
    mmVendas2vlr_bc.AsString := q_vendas2.fieldbyname('vlr_bc').AsString;
    mmVendas2icms_item.AsString := q_vendas2.fieldbyname('icms_item').AsString;
    mmVendas2vlr_icms_item.AsString :=
      q_vendas2.fieldbyname('vlr_icms_item').AsString;
    mmVendas2vlr_agr_item.AsString :=
      q_vendas2.fieldbyname('vlr_agr_item').AsString;
    mmVendas2vlr_bc_st.AsString := q_vendas2.fieldbyname('vlr_bc_st').AsString;
    mmVendas2vlr_icms_st.AsString :=
      q_vendas2.fieldbyname('vlr_icms_st').AsString;
    mmVendas2PERC_COMISSAO.AsString :=
      q_vendas2.fieldbyname('PERC_comissao').AsString;
    mmVendas2VLR_COMISSAO.AsString :=
      q_vendas2.fieldbyname('vlr_comissao').AsString;
    mmVendas2QTD_ESTOQUE.AsString :=
      q_vendas2.fieldbyname('QTD_ESTOQUE').AsString;
    mmVendas2ESTOQUE_MINIMO.AsString :=
      q_vendas2.fieldbyname('ESTOQUE_MINIMO').AsString;
    mmVendas2QTD_RESERVADO.AsString :=
      q_vendas2.fieldbyname('QTD_RESERVADO').AsString;
    mmVendas2GRADE_COMISSAO.AsString :=
      q_vendas2.fieldbyname('GRADE_COMISSAO').AsString;

    mmVendas2NAO_VALIDAR_MARGEM.AsString :=
      q_vendas2.fieldbyname('NAO_VALIDAR_MARGEM').AsString;

    if mmVendas2NAO_VALIDAR_MARGEM.AsString = 'S' then
      mmVendas2DESCONTO_MAXIMO.Value :=
        q_vendas2.fieldbyname('DESCONTO_MAXIMO').asfloat;

    mmVendas2CODIGO_BARRAS.AsString :=
      q_vendas2.fieldbyname('CODIGO_BARRA').AsString;

    mmVendas2PESO.Value := q_vendas2.fieldbyname('PESO').AsFloat;
    mmVendas2PESO_TOTAL.Value := q_vendas2.fieldbyname('PESO_TOTAL').AsFloat;

    mmVendas2.Post;

    fm_splash.ggProgress.AddProgress(1);
    fm_splash.Refresh;
    //sleep(50);
    q_vendas2.Next;
  end;

  carregando_item := false;
  EnableTaskWindows(WindowList);
  fm_splash.Hide;
  pnWait.Visible := false;

  //ChecarFaturamentoLiquido((prtot_liquido.Value - total_custo), total_custo);
  if DBGrid1.enabled then
    DBGrid1.SetFocus;
  mmVendas2.First;
  ListarItensPedidos;
end;

procedure TFr_vendas_industria2.btcanClick(Sender: TObject);
begin
  try
    if MessageDlg('Deseja Cancelar está Operação?', mtConfirmation, [mbyes,
      mbno], 0) = mryes then
    begin
      modo_insert_me := false;
      produto_alterado := false;
      btnov.Enabled := true;
      if mmVendas2.RecordCount > 0 then
      begin
        btalt.Enabled := true;
        btexc.enabled := true;
      end
      else
      begin
        dbgrid1.Enabled := false;
        btalt.Enabled := false;
        btexc.enabled := false;
      end;
      btgra.Enabled := false;
      btcan.Enabled := false;
      if mmVendas2.State in [dsinsert] then
      begin
        mmVendas2.ClearFields;
        mmVendas2.Cancel;
      end
      else
        mmVendas2.Cancel;
      readonly_true('Me');
      promocao_desconto := TodosPromocao;
    end;
  except
  end;
end;

procedure TFr_vendas_industria2.carrega_venda_avulsa(id: string);
begin

end;

procedure TFr_vendas_industria2.mensagem_SB_vendas;
begin

end;

procedure TFr_vendas_industria2.SpeedButton1Click(Sender: TObject);
begin
  if Prcod_cliente.Text <> '' then
  begin
    Application.CreateForm(TFr_dados_cliente, Fr_dados_cliente);
    Fr_dados_cliente.Busca_dados_cliente(Prcod_cliente.Text);
    Fr_dados_cliente.ShowModal;
  end;
end;

procedure TFr_vendas_industria2.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if Btnovped.Enabled = false then
  begin
    showmessage('<ATENÇÃO>ALGUM BOTÃO GRAVAR/CANCELAR ESTÁ PENDENTE!<ATENÇÃO>');
    CanClose := FALSE;
  end
  else
    CanClose := true;

end;

procedure TFr_vendas_industria2.CheckStatusNFe;
var
  cBuscarCertificado: _BuscarCertificado;
  cTransmissaoXML: _TransmissaoXML;
  tipAmb, nomeCertificado, strVersaoDados, strDados, strCabecXML: string;
  MsgRetWS, smensagem: wideString;
begin
  //  bt_faturar.Visible := false;
  timer1.Enabled := false;
  try
    strCabecXML :=
      '<?xml version="1.0" encoding="UTF-8" ?><cabecMsg xmlns="http://www.portalfiscal.inf.br/nfe" versao="1.02"><versaoDados>2.00</versaoDados></cabecMsg>';
    strDados := '<?xml version="1.0" encoding="UTF-8" ?><consStatServ xmlns="http://www.portalfiscal.inf.br/nfe" versao="2.00"><tpAmb>'
      + tipAmb + '</tpAmb><cUF>SC</cUF><xServ>STATUS</xServ></consStatServ>';

    if FMFUN.BuscaAmbienteNFE = taProducao then
      tipAmb := '1'
    else
      tipAmb := '2';
    if nomeCertificado = '' then
    begin
      cBuscarCertificado := CoBuscarCertificado.Create;
      cBuscarCertificado.BuscaNome(smensagem);
      nomeCertificado := smensagem;
    end;
    cTransmissaoXML := CoTransmissaoXML.Create;
    cTransmissaoXML.NfeStatusServico('2', UF_Emissor, StrToInt(tipAmb),
      nomeCertificado, strCabecXML, strDados, MsgRetWS);
  except
    //    bt_faturar.Visible := true;
  end;
  cTransmissaoXML := nil;
  timer1.Interval := 600000;
  timer1.Enabled := true;
end;

function TFr_vendas_industria2.ChecarDadosPedido: boolean;
begin
  Result := true;
  mmVendas2.DisableControls;
  mmVendas2.First;
  while not mmVendas2.Eof do
  begin
    if mmVendas2QTD.Value = 0 then
      Result := false;
    mmVendas2.Next;
  end;
  if Result = false then
    ShowMessage('Há itens com quantidade igual 0!');
  mmVendas2.EnableControls;
end;

procedure TFr_vendas_industria2.somaTotal;
var
  i: integer;
  ac_tot_liq, ac_tot_bruto, ac_fat_liq, ac_tot_custo, ac_tot_bc_icms,
    ac_tot_icms, ac_tot_bc_st, ac_tot_st, ac_tot_ipi, ac_volume,
    ac_vlr_comissao, ac_peso_total, ac_total_cr, ac_total_desconto, st_desc:
  real;
begin
  btnov.Enabled := true;
  if mmVendas2.RecordCount > 0 then
  begin
    btexc.enabled := true;
    btalt.Enabled := true;
    dbgrid1.Enabled := true;
  end
  else
  begin
    btexc.enabled := false;
    btalt.Enabled := false;
    dbgrid1.Enabled := false;
  end;

  ac_vlr_comissao := 0;
  ac_tot_bruto := 0;
  ac_tot_liq := 0;
  ac_tot_bc_icms := 0;
  ac_tot_icms := 0;
  ac_tot_bc_st := 0;
  ac_tot_st := 0;
  ac_tot_ipi := 0;
  //  ac_volume := 0;
  ac_fat_liq := 0;
  ac_tot_custo := 0;
  ac_peso_total := 0;
  ac_total_cr := 0;
  ac_total_desconto := 0;
  st_desc := 0;
  liberar_margem := true;
  mmVendas2.First;
  while not mmVendas2.Eof do
  begin
    ac_tot_custo := ac_tot_custo + (mmVendas2QTD.Value *
      mmVendas2PRECO_CUSTO.Value);
    ac_tot_bruto := ac_tot_bruto + (mmVendas2QTD.Value *
      mmVendas2PRECO_VENDA.Value);
    ac_tot_liq := ac_tot_liq + mmVendas2SUB_TOTAL.Value;

    ac_tot_bc_icms := ac_tot_bc_icms + mmVendas2SUB_TOTAL.Value;
    ac_tot_icms := ac_tot_icms + mmVendas2VLR_ICMS_ITEM.Value;
    ac_tot_bc_st := ac_tot_bc_st + mmVendas2VLR_BC_ST.Value;
    ac_tot_st := ac_tot_st + mmVendas2VLR_ICMS_ST.Value;
    ac_tot_ipi := ac_tot_ipi + mmVendas2VLR_IPI_ITEM.Value;
    //    ac_volume := ac_volume + (mmVendas2QTD.Value / mmVendas2VOLUME.Value);
   // ac_vlr_comissao := ac_vlr_comissao + mmVendas2VLR_COMISSAO.Value;
    ac_peso_total := ac_peso_total + mmVendas2PESO_TOTAL.Value;
    ac_total_desconto := ac_total_desconto + mmVendas2DESCONTO_VALOR.Value;

    if mmVendas2NAO_VALIDAR_MARGEM.AsString <> 'S' then
      liberar_margem := false;

    mmVendas2.Next;
  end;

  ac_fat_liq := ac_tot_bruto - ac_tot_custo;
  //ChecarFaturamentoLiquido(ac_fat_liq, ac_tot_custo);
  mmVendas2.First;

  if not modo_insert then
  begin
    ativa_cr1(Prnumdoc.Text);
    while not q_cr1.eof do
    begin
      ac_total_cr := ac_total_cr + q_cr1.FieldByName('valor').value;
      q_cr1.Next;
    end;
    q_cr1.First;
  end;

  if (UF_Cliente <> UF_Emissor) and Faturado and (trim(PrNFE.Text) <> '') then
    st_desc := ac_tot_st;

  if cliente_consumidor_final then
    ac_tot_bc_icms := 0;

  Prtot_bruto.Value := ac_tot_bruto;
  Prtot_liquido.Value := ac_tot_liq - ac_total_desconto;
  PrValorDescontoAdic.value := ac_total_desconto;

  if (ac_tot_liq > 0) and (ac_tot_bruto > 0) and (ac_tot_custo > 0) then
  begin

    if Faturado and (ac_total_cr > 0) then
      margem_lucro := (((ac_total_cr - st_desc) / ac_tot_custo) - 1) * 100
    else
      margem_lucro := ((ac_tot_liq / ac_tot_custo) - 1) * 100;

    edMargemLucro.Value := margem_lucro;
    ac_vlr_comissao := CalculoComissao;
    edPercComissao.Value := ac_vlr_comissao;
    edTotComissao.Value := Prtot_liquido.Value * (edPercComissao.Value / 100);

    Prdesconto.Value := 100 - ((ac_tot_liq / ac_tot_bruto * 100));
    desconto_anterior := Prdesconto.Value;

    if not ((Prcod_fop.Text = '7') or (Prcod_fop.Text = '9') or (mform =
      'vendas_devolucoes')) then
    begin
      Status.Font.Size := 14;
      if margem_lucro < margem_lucro_ideal then
      begin
        Status.Caption := 'RUIM';
        Status.Font.Color := clMaroon;
      end
      else if margem_lucro >= 60 then
      begin
        Status.Caption := 'ÓTIMO';
        Status.Font.Color := clNavy;
      end
      else
      begin
        Status.Caption := 'BOM';
        Status.Font.Color := clTeal;
      end;

      if (FRPRI.TipUsu = '0') or (FRPRI.TipUsu = '1') or representacao then
      begin
        Status.Caption := 'Tot.ST: ' + FormatFloat('R$ #,###,##0.00', ac_tot_st)
          + #13 + 'M.Lucro: ' + FormatFloat('#0.00%', margem_lucro) + ' - ' +
          copy(Status.Caption, 1, 1);
        Status.Font.Size := 8;
      end;

    end;
  end;
  Prvlr_bc_icms.Value := ac_tot_bc_icms;
  Prvlr_icms.Value := ac_tot_icms;
  PrVLR_BC_ICMS_ST.Value := ac_tot_bc_st;
  Prvlr_st.Value := ac_tot_st;
  Prvlr_ipi.Value := ac_tot_ipi;
  edPesoTotal.Value := ac_peso_total;
  //Prvolume_nota.Value := ac_volume;
end;

procedure TFr_vendas_industria2.ChecarFaturamentoLiquido(liquido, custo:
  double);
var
  margem_lucro: double;
begin
  if (Prcod_fiscal.Text = '5101') or (Prcod_fiscal.Text = '6101') or
    (Prcod_fiscal.Text = '5102') or (Prcod_fiscal.Text = '6102') or
    (Prcod_fiscal.Text = '5405') or (Prcod_fiscal.Text = '6403') then
  begin
    mmVendas2.First;
    habilita_faturamento := true;
    while not mmVendas2.Eof do
    begin
      if mmVendas2Desconto.Value > (mmVendas2Desconto_maximo.Value + 0.5) then
      begin
        if Prcod_fop.Text <> '7' then //se não for permuta bloqueia...
          habilita_faturamento := false;
      end;
      mmVendas2.Next;
    end;
    liberado := habilita_faturamento;
    if not habilita_faturamento and (usuario_liberou_desconto = '') and
      (trim(Prnumdoc.Text) <> '') then
    begin
      if mostra then
      begin
        if
          fmfun.Dc_MessageDlg('Há Desconto Acima do Permitido no Pedido!. Solicitar Liberação?',
          mtConfirmation, [mbyes, mbno], 0, mrno) = mryes then
        begin
          Application.CreateForm(TFr_senha_especial, Fr_senha_especial);
          Fr_senha_especial.nivel := '5';
          Fr_senha_especial.ShowModal;
          if liberado then
          begin
            Application.CreateForm(TFmMotivo, FmMotivo);
            FmMotivo.ShowModal;
            if FmMotivo.modalresult = mrOk then
            begin
              gravar_liberacao_desconto(Fr_senha_especial.codusu,
                fmmotivo.mmMotivo.text);
              liberado := true;
            end
            else
              liberado := false;

            FmMotivo.free;
          end;
          Fr_senha_especial.free;
          habilita_faturamento := liberado;
        end
        else
        begin
          liberado := false;
          exit;
        end;
      end;
    end
    else
    begin
      habilita_faturamento := true;
      liberado := true;
    end;
  end
  else
  begin
    habilita_faturamento := true;
    liberado := true;
  end;
end;

procedure TFr_vendas_industria2.Prcontato_freteKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    Prdta_emissao.SetFocus;
    key := #0;
  end;
end;

procedure TFr_vendas_industria2.GerarParcelas(nr_documento, cod_cliente,
  cod_fop,
  cod_prazo: string; valor_total: real; NFe: boolean);
var
  qtd_parcelas: integer;
  remessa, prazo_str, titulo: string;
  prazo: array of Integer;
  i, p, j: integer;
  te: string;
  dt_vencimento: TDate;
  vl_parcela, comissao_total, comissao_parcela: real;
  letra_titulo: string;
  extrato: integer;
  historico: string;
begin
  dao.Geral1('select count(*) as total from cr1 where nr_documento = ' +
    Prnumdoc.Text + ' and valor_recebido > 0');

  if dao.Q1.FieldByName('total').AsInteger = 0 then
  begin

    try
      if (trim(cod_fop) = '') then
      begin
        showmessage('Forma de Pagamento deve ser preenchida!');
        exit;
      end;

      if (trim(cod_prazo) = '') then
      begin
        showmessage('Prazo deve ser preenchido!');
        exit;
      end;

      if (Prcod_fop.Text <> '9') then
      begin
        dao.Geral1('select * from prazo where id=' + QuotedStr(cod_prazo));
        qtd_parcelas := dao.Q1.fieldbyname('qtd_parcelas').AsInteger;
        prazo_str := dao.Q1.fieldbyname('prazo').AsString;

        dao.Geral2('select vlr_comissao from vendas1 where numdoc=' +
          QuotedStr(Prnumdoc.Text));
        comissao_total := dao.Q2.fieldbyname('vlr_comissao').AsFloat;
        comissao_parcela := comissao_total / qtd_parcelas;
        p := 1;
        SetLength(prazo, qtd_parcelas);
        for i := 0 to qtd_parcelas - 1 do
        begin
          if i = qtd_parcelas - 1 then
            prazo[i] := strtoint(copy(prazo_str, p, Length(prazo_str)))
          else
            prazo[i] := strtoint(copy(prazo_str, p, Pos('/', prazo_str) - 1));

          prazo_str := copy(prazo_str, pos('/', prazo_str) + 1,
            length(prazo_str));
        end;
        vl_parcela := valor_total / qtd_parcelas;

        //  for i:=0 to high(prazo) do
        //      te:= te + '/' + inttostr(prazo[i]);
       { dao.Geral4('SELECT distinct a.BOLETO_REMESSA_ORDEM, b.dia, b.mes  FROM CR1 a left outer join BOLETO_REMESSA_ORDEM b on (a.BOLETO_REMESSA_ORDEM = b.id)  WHERE a.NR_DOCUMENTO = ' + Prnumdoc.Text);

        if dao.q4.fieldbyname('BOLETO_REMESSA_ORDEM').isnull then
          remessa := 'null'
        else
          remessa := dao.q4.fieldbyname('BOLETO_REMESSA_ORDEM').AsString;
         }

        if not LimparBoletos then
          exit;

        if Prempresa_faturar.Text = '1' then
          letra_titulo := 'b'
        else
          letra_titulo := 'c';

        if prnfe.Text <> '' then
          titulo := prnfe.Text + letra_titulo
        else
          titulo := nr_documento;

        for i := 0 to high(prazo) do
        begin
          dt_vencimento := Prdta_emissao.Date + prazo[i];
          dao.Execsql('insert into cr1 (id_plano_contas, cod_cliente, nr_documento, titulo, sequencia, cod_empresa, dtaven, valor, valor_corrigido, cod_fop, historico1' +
            ',saldo, dias_atraso, id_representante, vlr_comissao) values (8, ' +
            quotedStr(cod_cliente) + ',' + QuotedStr(nr_documento) + ',' +
            QuotedStr(FMFUN.enchezero(titulo, 6)) + ',' +
            QuotedStr(inttostr(i + 1)) + ',' + quotedStr(cod_empresa) + ',' +
            quotedStr(FormatDateTime('dd.mm.yyyy', dt_vencimento)) + ',' +
            QuotedStr(FMFUN.prepara_valor(floattostr(vl_parcela))) + ',' +
            QuotedStr(FMFUN.prepara_valor(floattostr(vl_parcela))) + ',' +
            quotedStr(cod_fop) + ',' + QuotedStr('') + ',' +
            QuotedStr(FMFUN.prepara_valor(floattostr(vl_parcela))) + ',' +
            QuotedStr('0') + ',' + QuotedStr(Prcod_representante.Text) + ',' +
            QuotedStr(FMFUN.prepara_valor(FloatToStr(comissao_parcela))) + ')');
        end;
        dao.cn.Commit;
        BtnAltFormaPrazo.Visible := true;
        ControleBoleto;

      end;
    except
      on e: Exception do
      begin
        dao.cn.Rollback;
        dao.msg('Houve um erro Ao Faturar o Pedido!' + #13 + e.Message);
      end;
    end;

    if Pedido_AVista then
    begin
      ativa_cr1(Prnumdoc.Text);

      if q_cr1.FieldByName('conta_padrao').IsNull then
        exit;

      while not q_cr1.Eof do
      begin
        try
          if not dao.cn.InTransaction then
            dao.cn.StartTransaction;

          historico := 'RECEBIMENTO CONTA: CLIENTE: ' + Lbnom_cliente.Caption
            +
            ' TÍTULO Nº: ' + q_cr1.FieldByName('titulo').AsString + ';';
          extrato := fmfun.GravaExtrato(historico,
            QuotedStr(formatdatetime('dd/mm/yyyy',
            q_cr1.FieldByName('dtaven').AsDateTime)),
            q_cr1.FieldByName('conta_padrao').asstring, 'C',
            q_cr1.FieldByName('valor').value, 0);
          fmfun.GravaExtratoConta(extrato,
            q_cr1.FieldByName('id').AsInteger,
            2);

          dao.Exec_sql.SQL.Clear;

          dao.Exec_sql.SQL.Add('UPDATE CR1 SET DTAREC = ' +
            QuotedStr(formatdatetime('dd/mm/yyyy',
            q_cr1.FieldByName('dtaven').AsDateTime))
            + ', VALOR = ' + StringReplace(q_cr1.FieldByName('valor').asstring,
            ',', '.', [rfReplaceAll])
            + ', VLR_CORRIGIDO = ' +
            StringReplace(q_cr1.FieldByName('valor').asstring, ',', '.',
            [rfReplaceAll])
            + ', VALOR_RECEBIDO = ' +
            StringReplace(q_cr1.FieldByName('valor').asstring, ',', '.',
            [rfReplaceAll])
            + ' WHERE ID = ' + q_cr1.FieldByName('id').ASString);

          dao.Exec_sql.ExecSQL;

          dao.grava_log(dao.Exec_sql.SQL.text, '');

          dao.cn.Commit;
        except
          dao.cn.Rollback;
        end;

        q_cr1.next;

      end;
    end;

  end
  else
    Showmessage('Não é permitido Gerar Novas parcelas pagas.');
end;

procedure TFr_vendas_industria2.faturar(nr_documento, cod_cliente, cod_fop,
  cod_prazo: string; valor_total: real; Nfe: Boolean);
var
  qtd_parcelas: integer;
  prazo_str: string;
  prazo: array of Integer;
  i, p, j: integer;
  te: string;
  dt_vencimento: TDate;
  vl_parcela, comissao_total, comissao_parcela: real;

begin
  try
    if cliente_pre_cadastrado then
    begin
      dao.msg('CLIENTE PRÉ-CADASTRADO NÃO PODE SER FATURADO!');
      Exit;
    end;

    if not NFe then
    begin
      try
        if not (dao.cn.InTransaction) then
          dao.cn.StartTransaction;
        dao.Execsql('update vendas1 set faturado=' + QuotedStr('1') +
          ' where numdoc=' + QuotedStr(nr_documento));
        dao.cn.commit;
      except
        dao.cn.Rollback;
      end;

    end;

    if NFe and (UF_Cliente <> UF_Emissor) then
      valor_total := Prtot_liquido.Value + Prvlr_st.value
    else
      valor_total := Prtot_liquido.Value;

    if gerar_cr then
      GerarParcelas(nr_documento, cod_cliente, cod_fop, cod_prazo, valor_total,
        Nfe);

    q_vendas2.First;
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    while not (q_vendas2.Eof) do
    begin
      Fmfun.atualiza_estoque_geral(q_vendas2.fieldbyname('COD_PRODUTO').AsString);
      q_vendas2.Next;
    end;
    dao.cn.CommitRetaining;
  except
    on e: Exception do
    begin
      dao.msg('Houve um erro Ao Faturar o Pedido!' + #13 + e.Message);
    end;
  end;
end;

function TFr_vendas_industria2.Faturado: boolean;
begin
  if Prnumdoc.Text = '' then
  begin
    Result := false;
    exit;
  end;
  dao.Geral1('select faturado, NUMDOC_GRUPO from vendas1 where numdoc=' +
    QuotedStr(Prnumdoc.Text));
  if dao.Q1.FieldByName('faturado').AsString = '1' then
    SbVendas.Panels[1].Text := '-FATURADO-VENDAS'
  else if dao.Q1.FieldByName('faturado').AsString = '2' then
    SbVendas.Panels[1].Text := '-CANCELADA-'
  else if dao.Q1.FieldByName('faturado').AsString = '3' then
    SbVendas.Panels[1].Text := '-FATURADO-DEVOLUÇÕES, REMESSAS E BONIFICAÇÕES-'
  else if dao.Q1.FieldByName('faturado').AsString = '4' then
    SbVendas.Panels[1].Text := '-DESATIVADO-'
  else if dao.Q1.FieldByName('faturado').AsString = '5' then
    SbVendas.Panels[1].Text := '-NFE DENEGADA-'
  else
    SbVendas.Panels[1].Text := '-NÃO FATURADO-';

  if dao.Q1.FieldByName('NUMDOC_GRUPO').IsNotNull then
  begin
    SbVendas.Panels[1].Text := '-AGRUPADO AO PEDIDO Nº.: ' +
      dao.Q1.FieldByName('NUMDOC_GRUPO').AsString;
    TaAgrupar.TabVisible := false;
    Btaltped.Enabled := false;
    Btexcped.Enabled := false;
  end;

  if dao.Q1.FieldByName('faturado').AsString <> '0' then
    Result := true
  else
    Result := false;
end;

procedure TFr_vendas_industria2.bt_faturarClick(Sender: TObject);
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
    if not faturado then
    begin
      if Prdta_emissao.Text = '  /  /    ' then
      begin
        ;
        dao.msg('O Campo Data Emissão deve Ser Preenchida');
        Prdta_emissao.SetFocus;
        Exit;
      end;

      if Prdta_saida.Text = '  /  /    ' then
      begin
        ;
        dao.msg('O Campo Data Saida deve Ser Preenchida');
        Prdta_saida.SetFocus;
        Exit;
      end;

      if Prempresa_faturar.Text = '  /  /    ' then
      begin
        ;
        dao.msg('O Campo Empresa de Faturamento deve Ser Preenchida');
        Prempresa_faturar.SetFocus;
        Exit;
      end;

      if faturado then
      begin
        dao.msg('PEDIDO JÁ FATURADO OU CANCELADO!');
        Exit;
      end;

      { faturar(Prnumdoc.Text, Prcod_cliente.Text, Prcod_fop.Text, Prcod_prazo_pgto.Text, Prtot_liquido.Value, false);}
      try
        if not (dao.cn.InTransaction) then
          (dao.cn.StartTransaction);

        if PrNF.Text <> '' then
          dao.Execsql('update vendas1 set nf=' + QuotedStr(PrNF.Text) +
            ' where numdoc=' + QuotedStr(Prnumdoc.Text));

        dao.cn.Commit;
        //ativa_cr1(Prnumdoc.Text);

        MontaNF(Prnumdoc.Text);
      except
        dao.cn.Rollback;
      end;
    end
    else
    begin
      dao.msg('PEDIDO JÁ FATURADO OU CANCELADO!');
      Exit;
    end;

  end; //end do 1º if
end;

procedure TFr_vendas_industria2.BtnovpedClick(Sender: TObject);
var
  linhas_grid: integer;
begin
  if btnenviarpedido.visible then
    btnenviarpedido.enabled := false;

  if btaltped.enabled and (prnumdoc.Text <> '') then
    LiberarPedido(prnumdoc.Text);

  desconto_forma := 0;
  desconto_prazo := 0;
  BtnAltFormaPrazo.Visible := false;
  mmVendas2.Cancel;
  readonly_true('Me');
  status.Caption := '...';

  GravarPedido := false;
  Btnovped.Enabled := false;
  Btaltped.Enabled := false;
  BtnEmailPedido.Enabled := false;
  Btgraped.Enabled := true;
  Btcanped.Enabled := true;
  Btexcped.Enabled := false;
  Btlocped.Enabled := false;
  Btnnfe.Enabled := false;

  promocao_desconto := true;

  Prcod_carga.Enabled := false;
  Pc_vendas.ActivePage := tab_mercadorias;
  limpa_campos('Pr');
  //  limpa_campos('Me');
  mmVendas2.EmptyTable;

  readonly_false('Pr');
  PrValorDescontoAdic.ReadOnly := true;
  Prnumdoc.ReadOnly := true;
  Prdtadoc.ReadOnly := true;
  LimpaDescLucro;
  modo_insert := true;
  acao := 'insert';
  Prcod_empresa.Text := cod_empresa;
  Prdtadoc.Date := dao.DtaSerDt;
  Prdta_emissao.Date := dao.DtaSerDt;
  Prdta_saida.Date := dao.DtaSerDt;
  Prcod_usuario.Text := cod_usuario;
  Prtipo_frete.text := '1';

  if not (dao.cn.InTransaction) then
    (dao.cn.StartTransaction);
  sbvendas.Panels.Items[0].Text := 'INSERIR';
  btnov.Enabled := true;
  btalt.Enabled := false;
  Prcod_representante.SetFocus;

  if (frpri.TipUsu = '0') then
  begin
    Prcod_representante.Text := frpri.Representante_id;
    Prcod_representanteexit(self);
    Prcod_representante.ReadOnly := true;
  end;

  {  if frpri.TeleVendas then
    begin
      Prcod_supervisor.Text := frpri.Representante_id;
      Prcod_supervisorExit(self);
      Prcod_supervisor.ReadOnly := true;
      Prcod_representante.ReadOnly := true;
    end;}
  Prtipo_frete.ItemIndex := 1;
  Prempresa_faturar.ReadOnly := false;
  q_pedidos_agrupar.Close;
  TaAgrupar.TabVisible := false;
  liberar_margem := false;
  UF_Emissor := 'SC';
end;

procedure TFr_vendas_industria2.BtaltpedClick(Sender: TObject);
begin
  if btnenviarpedido.visible then
    btnenviarpedido.enabled := false;

  mmVendas2.Cancel;
  readonly_true('Me');

  GravarPedido := false;
  localizar_acionado := false;
  if Prnumdoc.Text = '' then
  begin
    dao.msg('VOCÊ DEVE LOCALIZAR UM PEDIDO PARA ALTERAR!');
    Exit;

  end;
  if Prnumdoc.Text <> '' then
  begin
    if faturado then
    begin
      dao.msg('O Pedido está ' + sbvendas.Panels.Items[1].Text + '!');
      exit;
    end;
  end;

  Btnovped.Enabled := false;
  Btaltped.Enabled := false;
  BtnEmailPedido.Enabled := false;
  Btgraped.Enabled := true;
  Btcanped.Enabled := true;
  Btexcped.Enabled := false;
  Btlocped.Enabled := false;
  Btnnfe.Enabled := false;

  try
    Prdta_emissao.Date := dao.DtaSerDt;
    Prdta_saida.Date := dao.DtaSerDt;
  except
    //
  end;
  modo_insert := false;
  acao := 'alterar';
  sbvendas.Font.Style := [fsbold];
  sbvendas.Panels.Items[0].Text := 'ALTERAR';

  readonly_false('Pr');
  Prnumdoc.ReadOnly := true;
  Prdtadoc.ReadOnly := true;

  Prcod_representante.SetFocus;
  Dbgrid1.Enabled := true;
  btnov.Enabled := true;
  if mmVendas2.RecordCount > 0 then
    Btalt.Enabled := true
  else
    Btalt.Enabled := false;

  Prempresa_faturar.Enabled := true;
  if (frpri.TipUsu = '0') or (FRPRI.TipUsu = '1') then
    Prcod_representante.ReadOnly := true;

  Prempresa_faturar.ReadOnly := false;
  if trim(PrNFE.Text) <> '' then
    Prempresa_faturar.ReadOnly := true;
end;

procedure TFr_vendas_industria2.BtgrapedClick(Sender: TObject);
var
  comissao, qtd_est_reservado: Real;
  desconto_valor, vlr_bc, vlricm, vlr_bc_st, VLR_ICMS_ST, preco_cs, trib_icms:
  string;
begin

  LiberaItemRepetido := not itens_repetidos;

  if itens_repetidos then
  begin
    if
      MessageDlg('Produto incluído no Pedido mais de uma vez. Desejas continuar?',
      mtConfirmation, [mbyes, mbno], 0) = mrno then
      exit
    else
      LiberaItemRepetido := true;
  end;

  if btgra.enabled then
  begin
    pc_vendas.TabIndex := 0;
    btgraclick(self);
    exit;
  end;

  if cliente_bloqueado and not Pedido_AVista then
  begin
    dao.msg('CLIENTE BLOQUEADO. Não é permitido gravar o pedido.');
    exit;
  end;

  if (frpri.TipUsu > '0') then
  begin
    if (mform <> 'vendas_devolucoes') and not Pedido_AVista then
      ChecarDataUltConsultaSerasa;
  end;

  cliente_alterado := false;
  try
    pc_vendas.TabIndex := 0;
    if (Prcod_representante.Text = '') and venda then
    begin
      dao.msg('O campo Representante deve ser Preenchido');
      Prcod_representante.SetFocus;
      exit;
    end;

    if venda then
    begin
      if Prcod_cliente.Text = '' then
      begin
        dao.msg('Campo Cliente deve ser Preenchido!');
        Prcod_cliente.SetFocus;
        exit;
      end;
    end
    else
    begin
      if (Prcod_cliente.Text = '') and (Prcod_fornecedor.Text = '') then
      begin
        dao.msg('Campo Cliente ou Fornecedor deve ser Preenchido!');
        Prcod_cliente.SetFocus;
        exit;
      end;
    end;

    if (frpri.TipUsu > '1') and (Prorcamento.ItemIndex = 0) and not representacao
      then
    begin
      if not ChecarDadosCliente then
        exit;

      if not ChecarDadosTransportadora then
        exit;

      { if Prcod_fop.Text = '1' then
         CalcularDesconto;}

      if (Prcod_fop.Text = '') then
      begin
        dao.msg('O campo Forma de Pagamento deve ser Preenchido');
        Prcod_fop.SetFocus;
        exit;
      end;

      if (Prcod_prazo_pgto.Text = '') and venda then
      begin
        dao.msg('O campo Prazo Pagamento deve ser Preenchido');
        Prcod_prazo_pgto.SetFocus;
        exit;
      end;

      if Prempresa_faturar.Text = '' then
      begin
        dao.msg('O campo Empresa deve ser Preenchido');
        pc_vendas.ActivePage := tab_finalizar;
        Prempresa_faturar.SetFocus;
        exit;
      end;

      if Prcod_fiscal.Text = '' then
      begin
        dao.msg('O campo Código Fiscal deve ser Preenchido');
        pc_vendas.ActivePage := tab_finalizar;
        Prcod_fiscal.SetFocus;
        exit;
      end;

      if (Lbnom_fop.Caption = 'BOLETO') and (trim(PrCONTA_BOLETO.Text) = '')
        then
      begin
        dao.msg('Na forma de pagamento BOLETO. O campo Banco CC Boleto deve ser preenchido.');
        pc_vendas.ActivePage := tab_mercadorias;
        PrCONTA_BOLETO.SetFocus;
        exit;
      end;
    end;

    if mform <> 'vendas_devolucoes' then
    begin
      if not VerificarMargem then
        exit;
    end;

    if (mmVendas2.RecordCount = 0) and (not agrupar_pedidos) then
    begin
      dao.msg('O Pedido não pode ser Gravado sem Mercadorias Lançadas');
      btcanClick(self);
      exit;
    end
    else
    begin
      if prnumdoc.Text = '' then
      begin
        try
          if not (dao.cn.InTransaction) then
            dao.cn.StartTransaction;
          id_pedido := dao.insert('Pr', 'vendas1', 'numdoc',
            Fr_vendas_industria2,
            'gen_venda1');
          dao.cn.Commit;
          Prnumdoc.Text := id_pedido;
        except
          dao.cn.Rollback;
        end;

      end;

      GravarPedido := true;
      if not mmVendas2.IsEmpty then
      begin
        mmVendas2.First;
        try
          if not (dao.cn.InTransaction) then
            dao.cn.StartTransaction;
          dao.Execsql('DELETE FROM VENDAS2 WHERE NUMDOC = ' + Prnumdoc.TEXT);

          WindowList := DisableTaskWindows(fm_splash.Handle);
          fm_splash.ggProgress.MaxValue := mmVendas2.RecordCount;
          fm_splash.lbStatus.Caption := 'Atualizando os Itens do Pedido...';
          fm_splash.ggProgress.progress := 0;
          fm_splash.Show;

          carregando_item := true;
          pc_vendas.TabIndex := 0;
          pnWait.Visible := true;
          while not mmVendas2.Eof do
          begin
            checar_qtd := false;
            mmVendas2.edit;

            if mform = 'vendas_industria' then
            begin
              mecod_produtoexit(self);
              btgraClick(self);
            end;

            if mmVendas2CESTA_BASICA.Value then
              cesta_basica := 'S'
            else
              cesta_basica := 'N';

            if mmVendas2COD_SUPERVISOR.asstring = '' then
              supervisor := ', null'
            else
              supervisor := ', ' + QuotedStr(mmVendas2COD_SUPERVISOR.asstring);

            if mmVendas2VLR_COMISSAO.asstring = '' then
              vlr_comissao := ', null'
            else
              vlr_comissao := ', ' +
                FMFUN.BuscaTroca(mmVendas2VLR_COMISSAO.AsString,
                ',', '.');

            if mmVendas2DESCONTO_VALOR.asstring = '' then
              desconto_valor := ', null'
            else
              desconto_valor := ', ' +
                FMFUN.BuscaTroca(mmVendas2DESCONTO_VALOR.AsString, ',', '.');

            if mmVendas2PERC_COMISSAO.asstring = '' then
              perc_comissao := ', null'
            else
              perc_comissao := ', ' +
                FMFUN.BuscaTroca(mmVendas2PERC_COMISSAO.AsString, ',', '.');

            if mmVendas2PRECO_BASE.AsString = '' then
              preco_cs := ', null'
            else
              preco_cs := ', ' + FMFUN.BuscaTroca(mmVendas2PRECO_BASE.AsString,
                ',', '.');

            if mmVendas2TRIB_ICMS.AsString = '' then
              trib_icms := ', null'
            else
              trib_icms := ', ' + FMFUN.BuscaTroca(mmVendas2TRIB_ICMS.AsString,
                ',', '.');

            sql_vendas2 := 'INSERT INTO VENDAS2 (NUMDOC, COD_PRODUTO, QTD, ' +
              ' PRECO, PRECO_CUSTO, SUB_TOTAL, DESCONTO, DESCONTO_VALOR, VOLUME, PRECO_BRUTO, PRECO_BASE, PERC_COMISSAO, VLR_COMISSAO, ' +
              ' COD_FISCAL_ITEM, ICMS_ITEM, VLR_ICMS_ST, VLR_BC_ST, VLR_ICMS_ITEM, NCM, VLR_BC, IPI_ITEM, VLR_IPI_ITEM, ' +
              ' VLR_AGR_ITEM, TRIB_ICMS, CESTA_BASICA, COD_SUPERVISOR, PROMOCAO, DESCONTO_MAX, NAO_VALIDAR_MARGEM) ' +
              ' VALUES (' + Prnumdoc.TEXT + ', ' +
              mmVendas2COD_PRODUTO.AsString + ', ' +
              FMFUN.BuscaTroca(mmVendas2QTD.AsString, ',', '.') + ', ' +
              FMFUN.BuscaTroca(mmVendas2PRECO_LIQUIDO.AsString, ',', '.') + ', '
              +
              FMFUN.BuscaTroca(mmVendas2PRECO_CUSTO.AsString, ',', '.') + ', ' +
              FMFUN.BuscaTroca(mmVendas2SUB_TOTAL.AsString, ',', '.') + ', ' +
              FMFUN.BuscaTroca(mmVendas2DESCONTO.AsString, ',', '.') +
              desconto_valor + ', ' +
              FMFUN.BuscaTroca(mmVendas2VOLUME.AsString, ',', '.') + ', ' +
              FMFUN.BuscaTroca(mmVendas2PRECO_VENDA.AsString, ',', '.') +
              preco_cs + perc_comissao + vlr_comissao + ', ' +
              mmVendas2COD_FISCAL_ITEM.AsString + ', ' +
              mmVendas2ICMS_ITEM.AsString
              + ', ' +
              FMFUN.BuscaTroca(mmVendas2VLR_ICMS_ST.AsString, ',', '.') + ', ' +
              FMFUN.BuscaTroca(mmVendas2VLR_BC_ST.AsString, ',', '.') + ', ' +
              FMFUN.BuscaTroca(mmVendas2VLR_ICMS_ITEM.AsString, ',', '.') + ', '
              +
              QuotedStr(mmVendas2NCM.AsString) + ', ' +
              FMFUN.BuscaTroca(mmVendas2VLR_BC.AsString, ',', '.') + ', ' +
              FMFUN.BuscaTroca(mmVendas2IPI_ITEM.AsString, ',', '.') + ', ' +
              FMFUN.BuscaTroca(mmVendas2VLR_IPI_ITEM.AsString, ',', '.') + ', '
              +
              FMFUN.BuscaTroca(mmVendas2VLR_AGR_ITEM.AsString, ',', '.') +
              trib_icms + ', ' +
              QuotedStr(cesta_basica) + supervisor + ', ' +
              QuotedStr(mmVendas2PROMOCAO.AsString) + ', ' +
              FMFUN.BuscaTroca(mmVendas2DESCONTO_MAXIMO.AsString, ',', '.') +
              ', ' +
              QuotedStr(mmVendas2NAO_VALIDAR_MARGEM.AsString) +
              ')';

            dao.Execsql(sql_vendas2);

            //id_item := dao.insert('Me', 'vendas2', 'id', Fr_vendas_industria2, 'gen_venda2');
            fm_splash.ggProgress.AddProgress(1);
            fm_splash.Refresh;
            mmVendas2.next;
          end;
          dao.cn.commit;
        except
          dao.cn.Rollback;
        end;
        mmVendas2.First;
        carregando_item := false;
        EnableTaskWindows(WindowList);
        fm_splash.Hide;
        pnWait.Visible := false;
      end;
    end;
    somaTotal;
    Btnovped.Enabled := true;

    BtnEmailPedido.Enabled := true;

    Btgraped.Enabled := false;
    Btcanped.Enabled := false;
    Btlocped.Enabled := true;

    if (FRPRI.TipUsu = '1') then
    begin
      Btaltped.Enabled := false;
      Btexcped.Enabled := false;
    end
    else
    begin
      Btaltped.Enabled := true;
      Btexcped.Enabled := true;
    end;

    CFOPTROCA;

    if (Prcod_fiscal.Text = '5405') or (Prcod_fiscal.Text = '6403') then
      if not ((FRPRI.TipUsu = '0') or (FRPRI.TipUsu = '1') or representacao)
        then
        ChecaCFOP;

    try
      if not (dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      if modo_insert then
      begin
        dao.update('vendas1', 'numdoc', Prnumdoc.Text, 'Pr',
          Fr_vendas_industria2);
        ativa_vendas1(Prnumdoc.Text);
      end
      else
      begin
        dao.update('vendas1', 'numdoc', Prnumdoc.Text, 'Pr',
          Fr_vendas_industria2);
      end;

      {marca o status do pedido como não faturado}
      if (frpri.TipUsu = '0') then
        dao.Execsql('update vendas1 set faturado=' + QuotedStr('0') +
          ', pedido_vendedor =' + QuotedStr('1') + ' where numdoc = ' +
          QuotedStr(Prnumdoc.Text))
      else
        dao.Execsql('update vendas1 set faturado=' + QuotedStr('0') +
          ' where numdoc = ' + QuotedStr(Prnumdoc.Text));

      ativa_vendas1(Prnumdoc.Text);
      ativa_vendas2(Prnumdoc.Text);

      //Grava a Comissão no Vendas1
      dao.Execsql('update vendas1 set vlr_comissao =' +
        FMFUN.prepara_valor(edTotComissao.Text) + ', perc_comissao = ' +
        FMFUN.prepara_valor(edPercComissao.text) + ' where numdoc =' +
        QuotedStr(Prnumdoc.Text));

      {Grava os valores de icms e ST}

      dao.Geral2('select sum(case when vlr_bc is null then 0 else vlr_bc end) as vlr_bc, ' +
        'sum(case when vlr_icms_item is null then 0 else vlr_icms_item end) as vlricm, ' +
        'sum(case when VLR_BC_ST is null then 0 else vlr_bc_st end) as vlr_bc_st, ' +
        'sum(case when VLR_ICMS_ST is null then 0 else vlr_icms_st end) as VLR_ICMS_ST ' +
        'from vendas2 where numdoc= ' + QuotedStr(Prnumdoc.Text));

      if dao.Q2.fieldbyname('vlr_bc').IsNotNull then
        vlr_bc :=
          QuotedStr(FMFUN.prepara_valor(dao.Q2.fieldbyname('vlr_bc').AsString))
      else
        vlr_bc := '0';

      if dao.Q2.fieldbyname('vlricm').IsNotNull then
        vlricm :=
          QuotedStr(FMFUN.prepara_valor(dao.Q2.fieldbyname('vlricm').AsString))
      else
        vlricm := '0';

      if dao.Q2.fieldbyname('vlr_bc_st').IsNotNull then
        vlr_bc_st :=
          QuotedStr(FMFUN.prepara_valor(dao.Q2.fieldbyname('vlr_bc_st').AsString))
      else
        vlr_bc_st := '0';

      if dao.Q2.fieldbyname('VLR_ICMS_ST').IsNotNull then
        VLR_ICMS_ST :=
          QuotedStr(FMFUN.prepara_valor(dao.Q2.fieldbyname('VLR_ICMS_ST').AsString))
      else
        VLR_ICMS_ST := '0';

      dao.Execsql('update vendas1 set vlr_bc_icms=' + vlr_bc +
        ' ,vlr_icms=' + vlricm +
        ' ,VLR_BC_ICMS_ST=' + vlr_bc_st +
        ' ,VLR_ST=' + VLR_ICMS_ST +
        ' where numdoc=' + QuotedStr(Prnumdoc.Text));

      if Prvolume_nota.Value = 0 then
        dao.Execsql('update vendas1 set volume_nota = 0 where numdoc=' +
          QuotedStr(Prnumdoc.Text));

      dao.cn.Commit;
    except
      dao.cn.Rollback;
    end;

    readonly_true('Pr');
    readonly_true('Me');

    sbvendas.Panels.Items[0].Text := '';
    sbvendas.Panels.Items[1].Text := 'PEDIDO NÃO FATURADO';
    //    sbvendas.Panels.Items[2].Text := 'CLIENTE COM PENDENCIA';
    ativa_cr1(Prnumdoc.Text);
    {
    if not mmVendas2.IsEmpty and not representacao then
    begin
      WindowList := DisableTaskWindows(fm_splash.Handle);
      fm_splash.ggProgress.MaxValue := mmVendas2.RecordCount;
      fm_splash.lbStatus.Caption := 'Atualizando o Estoque...';
      fm_splash.ggProgress.progress := 0;
      fm_splash.Show;

      pnWait.Visible := true;

      mmVendas2.first;
      try
        if not (dao.cn.InTransaction) then
          dao.cn.StartTransaction;
        while not mmVendas2.Eof do
        begin
          Fmfun.atualiza_estoque_geral(mmVendas2COD_PRODUTO.AsString);

          fm_splash.ggProgress.AddProgress(1);
          fm_splash.Refresh;
          mmVendas2.Next;
        end;
        dao.cn.Commit;
      except
        dao.cn.Rollback;
      end;

      EnableTaskWindows(WindowList);
      fm_splash.Hide;
      pnWait.Visible := false;
      mmVendas2.first;

      somaTotal;

    end;
    }

    ControleBoleto;

    ListarItensPedidos;

    btnnfe.enabled := true;
    TaAgrupar.TabVisible := agrupar_pedidos and (tipo_usuario <> '0');
    Prcod_clienteExit(Self);
    LiberaItemRepetido := false;
    btnenviarpedido.enabled := btnenviarpedido.visible and (prnumdoc.text <>
      '');

    AtivaJanela;
    dao.Execsql('update vendas1 set cod_usuario = ' + cod_usuario +
      ' where numdoc = ' + QuotedStr(prnumdoc.Text));
  except
    on e: Exception do
    begin
      acao := '';
      dao.msg('Houve um erro Ao Gravar o Pedido!' + #13 + e.Message);
      dao.envia_email_suporte(e.Message + #13 + 'Data: ' + dao.DtaSerStr + #13 +
        'Usuario Logado:' + nom_usuario, 'Erro ao Gravar Pedido',
        'claudioplasfan@gmail.com', '', '', '');
    end;
  end;
end;

procedure TFr_vendas_industria2.ChecarDuplicidadePedido;
begin
  {  dao.Geral1('SELECT a.NUMDOC, A.COD_CLIENTE, A.TOT_LIQUIDO FROM VENDAS1 a '+
               'WHERE A.TOT_LIQUIDO = '++' and a.COD_CLIENTE = '+Prcod_cliente.Text+' and a.numdoc not in ('+Prnumdoc.Text+')');}
end;

procedure TFr_vendas_industria2.ControleBoleto;
begin
  if Lbnom_fop.Caption = 'BOLETO' then
  begin
    PrConta_Boleto.Enabled := true;
    btnBoleto.Enabled := true;
    BtnEmailBoleto.Enabled := true;
  end
  else
  begin
    PrConta_Boleto.Clear;
    PrConta_Boleto.Enabled := false;
    lbccboleto.Caption := '';
    btnBoleto.Enabled := false;
    BtnEmailBoleto.Enabled := false;
  end;
end;

procedure TFr_vendas_industria2.AtivaJanela;
begin
  Application.Restore;
  BringToFront;
end;

procedure TFr_vendas_industria2.BtcanpedClick(Sender: TObject);
var
  numdoc: integer;
begin
  cliente_alterado := false;
  if btcan.Enabled = true then
    btcanClick(Self);

  Btnovped.Enabled := true;

  if (FRPRI.TipUsu = '1') then
  begin
    Btaltped.Enabled := false;
    Btexcped.Enabled := false;
  end
  else
  begin
    Btaltped.Enabled := true;
    Btexcped.Enabled := true;
  end;

  BtnEmailPedido.Enabled := true;

  Btgraped.Enabled := false;
  Btcanped.Enabled := false;
  Btlocped.Enabled := true;

  if modo_insert then
  begin
    limpa_campos('Pr');
    status.Caption := '...';
    mmVendas2.EmptyTable;
    btnnfe.enabled := false;
    Btexcped.Enabled := false;
    promocao_desconto := false;
  end
  else
  begin
    dao.cn.Rollback;
    if trim(Prnumdoc.Text) <> '' then
    begin
      ativa_vendas1(Prnumdoc.Text);
      ativa_vendas2(Prnumdoc.Text);
      mostra_campos_vendas1('Pr');
    end;
  end;

  readonly_true('Pr');
  readonly_true('Me');

  sbvendas.Panels.Items[0].Text := '';
  btnenviarpedido.enabled := btnenviarpedido.visible and (prnumdoc.text <> '');

end;

procedure TFr_vendas_industria2.AtualizaCalculoIcmsItem(sub_total, icms_item:
  double; id, ncm, cst: string);
//ICMS ST = (Al x BC ST) – ICMS operação própria
var
  vlr_bc, vlr_bc_st, vlr_icms_st, vlr_icms_item: double;
  procedure AtualizaIcmsItem;
  begin
    vlr_icms_item := SimpleRoundTo((vlr_bc * (icms_item / 100)), -5);
  end;
begin
  if MeCesta_Basica.Text = 'S' then
    Aliquota_ICMS_Interno := 12
  else
    Aliquota_ICMS_Interno := 17;

  vlr_bc := SUB_TOTAL;
  AtualizaIcmsItem;

  if (cst = '60') or (cst = '10') then
  begin
    //Buscar a Base de Cáculo ST
    vlr_bc_st := RoundTo((vlr_bc * (1 + (MVA / 100))), -5);
    vlr_icms_st := RoundTo(((vlr_bc_st * (Aliquota_ICMS_Interno / 100)) -
      vlr_icms_item), -5);
    vlr_bc := 0;
    AtualizaIcmsItem;
  end
  else
  begin
    vlr_bc_st := 0;
    vlr_icms_st := 0;
  end;

  if cliente_isento_icms and cliente_consumidor_final then
  begin
    vlr_bc_st := 0;
    vlr_icms_st := 0;
    vlr_bc := 0;
    AtualizaIcmsItem;
  end;

  dao.Execsql('update vendas2 set ncm=' + QuotedStr(ncm) + ', trib_icms = ' +
    quotedStr(cst) + ', icms_item = ' +
    QuotedStr(StringReplace(FormatFloat('#0.00', icms_item), ',', '.',
    [rfReplaceAll])) + ', vlr_bc = ' +
    QuotedStr(StringReplace(FormatFloat('#0.00', vlr_bc), ',', '.',
    [rfReplaceAll])) + ', vlr_bc_st = ' +
    QuotedStr(StringReplace(FormatFloat('#0.00', vlr_bc_st), ',', '.',
    [rfReplaceAll])) + ', vlr_icms_st = ' +
    QuotedStr(StringReplace(FormatFloat('#0.00', vlr_icms_st), ',', '.',
    [rfReplaceAll])) + ', VLR_ICMS_ITEM = ' +
    QuotedStr(StringReplace(FormatFloat('#0.00', vlr_icms_item), ',', '.',
    [rfReplaceAll])) + '  where id = ' + id);
end;

procedure TFr_vendas_industria2.BtlocpedClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
  It, J, Coluna: byte;
  totalcusto, lucromedio, tot_lucro, aliq_icms: real;
  contador: integer;
  lucro: real;
begin
  if (prnumdoc.Text <> '') then
    LiberarPedido(prnumdoc.Text);

  localizar_acionado := true;
  Application.CreateForm(TFr_localizar, Fr_localizar);

  //guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Vendas';
  chamou_pesquisa := 'fr_pedido';
  chamou_form := 'fr_pedido';
  chamou_cadastro := '';
  Fr_localizar.BT_cadastro.Caption := 'Ca&dastro de' + #13 + 'Cliente';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  if mform = 'vendas_devolucoes' then
    SetLength(Campos_combo, 11)
  else
    SetLength(Campos_combo, 10);

  Campos_combo[0] := 'Numero';
  Campos_combo[1] := 'Cliente - Código';
  Campos_combo[2] := 'Cliente - Razão S.';
  Campos_combo[3] := 'Cliente - Fantasia';
  Campos_combo[4] := 'CNPJ';
  Campos_combo[5] := 'CPF';
  Campos_combo[6] := 'Cidade';
  Campos_combo[7] := 'Vendedor';
  Campos_combo[8] := 'NFE';
  Campos_combo[9] := 'NF';
  if mform = 'vendas_devolucoes' then
    Campos_combo[10] := 'Fornecedor';
  if mform = 'vendas_devolucoes' then
  begin
    for i := 0 to 10 do
    begin
      valor_combo := campos_combo[i];
      Fr_localizar.CBcampos.Items.Add(campos_combo[i]);
    end;
  end
  else
  begin
    for i := 0 to 9 do
    begin
      valor_combo := campos_combo[i];
      Fr_localizar.CBcampos.Items.Add(campos_combo[i]);
    end;
  end;
  Fr_localizar.CBcampos.ItemIndex := 0;

  if campo_pesquisado <> '' then
  begin
    Fr_localizar.CBcampos.ItemIndex :=
      Fr_localizar.CBcampos.Items.IndexOf(campo_pesquisado);
    Fr_localizar.EDlocalizar.Text := dado_pesquisado;
    Fr_localizar.zzbusca_qualquer.Checked := busca_qualquer_posicao_pesquisada;
    Fr_localizar.loc_vendas(Fr_localizar.EDlocalizar.Text);
  end;
  Fr_localizar.ShowModal;
  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

  //  if Prcod_cliente.Text <> '' then
  //     zzvalor_credito.Text:=  busca_credito(Prcod_cliente.Text);
  BtnAltFormaPrazo.Visible := false;

  StatusPedido;

  if Prcod_cliente.Text <> '' then
  begin
    dao.Geral1('select cliente_bloqueado from cliente where cod_cliente=' +
      QuotedStr(Prcod_cliente.Text));
    if dao.Q1.FieldByName('cliente_bloqueado').AsString = 'S' then
      sbvendas.Panels[2].Text := 'CLIENTE BLOQUEADO!'
    else
      sbvendas.Panels[2].Text := 'CLIENTE LIBERADO!';

    aviso_conta_boleto := false;

    TaAgrupar.TabVisible := agrupar_pedidos and (tipo_usuario <> '0');

    Prcod_clienteExit(Self);

  end
  else
    sbvendas.Panels[2].Text := '';
  PrNF.Text := q_vendas1.fieldbyname('nf').AsString;
  cliente_alterado := false;

end;

procedure TFr_vendas_industria2.BloquearPedido(pedido: string);
begin
  if pedido = '' then
    exit;
  try
    if not dao.cn.InTransaction then
      dao.cn.Rollback;
    dao.cn.StartTransaction;
    dao.Execsql('UPDATE VENDAS1 SET ABERTO_USUARIO = ''N'', MAQUINA_USUARIO_ABERTO = ' + QuotedStr(nom_usuario + '-' + FMFUN.COMPUTADOR) + ' WHERE NUMDOC = ' +
      pedido);
    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;
end;

procedure TFr_vendas_industria2.LiberarPedido(pedido: string);
begin
  if pedido = '' then
    exit;
  try
    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
    dao.Execsql('UPDATE VENDAS1 SET ABERTO_USUARIO = ''S'', MAQUINA_USUARIO_ABERTO = NULL WHERE NUMDOC = ' + pedido);
    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;
end;

function TFr_vendas_industria2.VerificaEstoqueParaFaturar(cod_produto: string):
  Boolean;
begin
  if mmVendas2QTD.Value > zzreal.Value then
    Result := true
  else
    Result := false;
end;

procedure TFr_vendas_industria2.MontaPedido(n_pedido: string);
var
  lh, cl, MTAMTOT, I, x, y: INTEGER;
  mcr1, usuario, observacao: string;
  total_produtos: real;
  MLHCH: array of string;
begin
  if Btgraped.Enabled then
    BtgrapedClick(Self);

  dao.Geral1('select a.NUMDOC, a.HORA, a.DTADOC, a.COD_CLIENTE, a.COD_USUARIO, '
    +
    'a.COD_EMPRESA, a.FATURADO, a.CONSIGNACAO, a.ORCAMENTO, a.ENTREGUE, a.TOT_BRUTO, ' +
    'a.DESCONTO, a.TOT_LIQUIDO, a.PRAZO_PGTO, a.COD_FOP, a.NUM_CUPOM, a.TIPO_VENDA, ' +
    'a.QTD_PARCELAS, a.PONTO_USADO, a.USUARIO_DESFATUROU, a.COD_REPRESENTANTE, ' +
    'a.COD_PRAZO_PGTO, a.CUSTO_TOTAL, a.LUCRO_MEDIO, a.DTA_EMISSAO, a.DTA_SAIDA, ' +
    'a.EMPRESA_FATURAR, a.NF, a.OBSERVACOES_PEDIDO, a.OBSERVACOES_NOTA, a.COD_TRANSPORTADORA, ' +
    'a.TIPO_FRETE, a.VOLUME_NOTA, a.PESO_NOTA, a.COD_CARGA, a.VL_FRETE, a.CONTATO_FRETE, ' +
    'a.PED_IMPRESSO, a.DTA_VENCIMENTO_CONSIG, a.CANCELADO, a.CONTEM_AVARIA, a.CONTEM_ETIQUETA, ' +
    'a.MOTIVO_TROCA, a.NR_VENDA_ORIGINAL, a.PEDIDO, a.VENDA_ENVIADA, a.CREDITO_USADO, ' +
    'a.NR_PEDIDO_PALM, a.BOLETO_ANEXO, a.COD_FISCAL, a.VLR_COMISSAO, a.VLR_BC_ICMS, a.VLR_ICMS, ' +
    'a.VLR_ST, a.VLR_TOT_NF, a.VLR_BC_ICMS_ST, a.CHAVE_NFE, a.RECIBO_NFE, a.STATUS_NFE, ' +
    'a.MOTIVO_NFE, a.DIGEST_NFE, a.PROTOCOLO_NFE, a.DATA_REC_NFE, a.JUSTIF_CANC_NFE, ' +
    'a.COD_SUPERVISOR, a.COD_FORNECEDOR, a.NFE, a.VLR_IPI, a.PALM_NR_CONEXAO, ' +
    'a.SINCRONIZAR_PALM, a.NUMDOC_REF, a.FRETE_COMBINADO, a.DT_FRETE_COMBINADO, a.EMAIL_NFE, ' +
    'a.EMAIL_PEDIDO, a.PEDIDO_VENDEDOR, a.USUARIO_CHECOU_PEDIDO_VENDEDOR, a.CONTA_BOLETO, ' +
    'a.USUARIO_CHECOU_FRETE_COMBINADO, a.ABERTO_USUARIO, a.MAQUINA_USUARIO_ABERTO, VALORDESCONTOADIC, ' +
    'c.nom_cliente, c.nom_fantasia, c.cnpj, c.dta_cad, c.bairro, c.endereco, c.nr_endereco, ' +
    'c.cep, c.TIP_PESSOA, c.cpf, c.cnpj,c.rg, c.ie, c.telefone, c.fax, c.email, c.contato, C.CELULAR AS CELULAR_CLIENTE, c.operadora as operadora_cliente, ' +
    'r.nom_representante, s.nom_representante as supervisor, r.celular, r.operadora as operadora_rep, f.nom_fop, p.prazo, e.nom_empresa, a.ORCAMENTO, ' +
    't.nome, cd.nom_cidade, cd.uf, us.logusu from vendas1 a ' +
    'left join cliente c on c.cod_cliente = a.cod_cliente ' +
    'left join cidades cd on cd.cod_cidade= c.cod_cidade ' +
    'left join representante r on r.id = a.cod_representante ' +
    'left join representante s on s.id = a.cod_supervisor ' +
    'left join fop f on f.cod_fop = a.cod_fop ' +
    'left join prazo p on p.id = a.cod_prazo_pgto ' +
    'left join empresa e on e.cod_empresa = a.empresa_faturar ' +
    'left join transportadora t on t.cod_transportadora = a.cod_transportadora ' +
    'left join tbusu us on us.codusu = a.cod_usuario ' +
    'where numdoc=' + QuotedStr(n_pedido));

  FRPRI.RD.TamanhoQteColunas := 96;
  FRPRI.RD.TamanhoQteLinhas := 33;
  FRPRI.RD.TamanhoQteLPP := seis;
  FRPRI.rd.FonteTamanhoPadrao := S12cpp;

  FRPRI.rd.abrir; // Inicia a montagem do relatório...
  // for i:=1 to 2 do
  // begin
  lh := 13;
  //  while not (dao.q1.eof) do
  //  begin
  usuario := dao.Q1.fieldbyname('logusu').AsString;

  if dao.Q1.FieldByName('ORCAMENTO').AsString = '1' then
    frpri.rd.ImpF(01, 42, 'ORÇAMENTO', [expandido, NEGRITO])
  else
    frpri.rd.ImpF(01, 42, 'PEDIDO', [expandido, NEGRITO]);

  frpri.rd.impC(02, 09,
    '-----------------------------------------------------------------------------------------------',
    [comp12, NEGRITO]);

  frpri.rd.impC(03, 02, 'Nº: ', [comp12, negrito]);
  frpri.rd.impf(03, 08, inttostr(dao.Q1.FIELDBYNAME('numdoc').asinteger),
    [comp12]); // DADOS DO CLIENTE

  if dao.Q1.FieldByName('dtadoc').Value <> null then
    frpri.rd.impf(03, 20, FormatDateTime('dd/mm/yyyy',
      dao.Q1.fieldbyname('dtadoc').AsDateTime), [comp12]);

  frpri.rd.impC(03, 48, 'CLIENTE DESDE:', [comp12, negrito]);
  if FormatDateTime('dd/mm/yyyy', dao.Q1.FieldByName('dta_cad').AsDateTime) <>
    '30/12/1899' then
    frpri.rd.impf(03, 55, FormatDateTime('dd/mm/yyyy',
      dao.Q1.fieldbyname('dta_cad').AsDateTime), [comp12]);

  if FormatDateTime('dd/mm/yyyy', dao.Q1.FieldByName('dta_emissao').AsDateTime) <>
    '30/12/1899' then
    frpri.rd.impf(03, 86, formatdatetime('dd/mm/yyyy',
      dao.Q1.fieldbyname('dta_emissao').AsDateTime), [comp12]);

  frpri.rd.impC(05, 02, 'CODIGO:', [comp12, NEGRITO]);
  frpri.rd.impf(05, 10, dao.Q1.fieldbyname('cod_cliente').AsString, [comp12]);

  frpri.rd.impC(05, 21, 'CLIENTE:', [comp12, NEGRITO]);
  frpri.rd.impf(05, 26, dao.Q1.fieldbyname('nom_cliente').AsString + ' /' +
    copy(dao.Q1.fieldbyname('nom_fantasia').AsString, 1, 40), [comp12]);

  frpri.rd.impC(06, 02, 'END:', [comp12, NEGRITO]);
  frpri.rd.impf(06, 07, dao.Q1.fieldbyname('endereco').AsString + ', ' +
    dao.Q1.fieldbyname('nr_endereco').AsString, [comp12]);

  frpri.rd.impC(06, 60, 'BAIRRO:', [comp12, NEGRITO]);
  frpri.rd.impf(06, 68, dao.Q1.fieldbyname('bairro').AsString, [comp12]);

  frpri.rd.impC(07, 02, 'CEP:', [comp12, NEGRITO]);
  frpri.rd.impf(07, 06, dao.Q1.fieldbyname('cep').AsString, [comp12]);

  frpri.rd.impC(07, 22, 'CIDADE:', [comp12, NEGRITO]);
  frpri.rd.impf(07, 27, dao.Q1.fieldbyname('nom_cidade').AsString, [comp12]);

  frpri.rd.impC(07, 59, 'UF:', [comp12, NEGRITO]);
  frpri.rd.impf(07, 62, dao.Q1.fieldbyname('uf').AsString, [comp12]);

  frpri.rd.impC(08, 02, 'CNPJ\CPF:', [comp12, NEGRITO]);

  if (dao.Q1.FieldByName('TIP_PESSOA').AsString = 'J') then
    frpri.rd.impf(08, 11, dao.Q1.fieldbyname('cnpj').AsString, [comp12])
  else
    frpri.rd.impf(08, 11, dao.Q1.fieldbyname('cpf').AsString, [comp12]);

  frpri.rd.impC(08, 40, 'I.E\RG:', [comp12, NEGRITO]);
  if (dao.Q1.FieldByName('TIP_PESSOA').AsString = 'J') then
    frpri.rd.impf(08, 45, dao.Q1.fieldbyname('ie').AsString, [comp12])
  else
    frpri.rd.impf(08, 45, dao.Q1.fieldbyname('rg').AsString, [comp12]);

  frpri.rd.impC(09, 02, 'FONE:', [comp12, NEGRITO]);
  frpri.rd.impf(09, 06, dao.Q1.fieldbyname('telefone').AsString, [comp12]);

  frpri.rd.impC(09, 25, 'CELULAR:', [comp12, NEGRITO]);
  frpri.rd.impf(09, 29, dao.Q1.fieldbyname('CELULAR_CLIENTE').AsString + '\' +
    dao.Q1.fieldbyname('operadora_cliente').AsString,
    [comp12]);

  frpri.rd.impC(09, 48, 'FAX:', [comp12, NEGRITO]);
  frpri.rd.impf(09, 50, dao.Q1.fieldbyname('fax').AsString, [comp12]);

  frpri.rd.impC(09, 70, 'CONTATO:', [comp12, NEGRITO]);
  frpri.rd.Impf(09, 75, dao.Q1.fieldbyname('contato').AsString, [comp12]);
  //  if DMVEN.QUPED1.FIELDBYNAME('comcli').value<>null then
  //  frpri.rd.impf(07,70,DMVEN.QUPED1.FieldByName('comcli').value,[comp12]);

  frpri.rd.impC(10, 02, 'E-MAIL:', [comp12, NEGRITO]);
  frpri.rd.impf(10, 12, dao.Q1.fieldbyname('email').AsString, [comp12]);

  frpri.rd.impC(11, 02, 'REPRESENTANTE:', [comp12, NEGRITO]);
  frpri.rd.impf(11, 16, dao.Q1.fieldbyname('nom_representante').AsString + '-'
    + dao.Q1.fieldbyname('celular').AsString + '\' +
    dao.Q1.fieldbyname('operadora_rep').AsString, [comp12]);

  frpri.rd.impC(11, 65, 'SUPERVISOR:', [comp12, NEGRITO]);
  frpri.rd.impf(11, 72, dao.Q1.fieldbyname('supervisor').AsString, [comp12]);

  frpri.rd.impC(12, 09,
    '----------------------------------------------------------------------------------------------',
    [comp12, NEGRITO]);

  frpri.rd.impC(13, 02,
    'COD \ PRODUTO                                                  QTD  UNI-QTD  VLR.UNI   TOT.LIQ',
    [comp12, NEGRITO]);
  //                       6                                         40    46        61   66       75       83
//case when p.id_marca is null then p.nom_produto else p.nom_produto||'' MARCA: ''||m.nom_marca end as nom_produto,
  dao.Geral2('select a.ID, a.NUMDOC, a.DTADOC, a.COD_PRODUTO, a.COD_CLIENTE, a.COD_REPRESENTANTE, a.ID_COR, ' +
    'a.ID_TAMANHO, a.QTD, a.QTD_DEVOLVIDA, a.DEVOLVIDO, a.PRECO, a.SUB_TOTAL, a.DESCONTO, a.VOLUME, ' +
    'a.COD_EMPRESA, a.NR_PEDIDO_PALM, a.PRECO_BRUTO, a.SUB_TOTAL_BRUTO, a.VLR_COMISSAO, a.TROCA, ' +
    'a.COD_FISCAL_ITEM, a.ICMS_ITEM, a.VLR_ICMS_ST, a.VLR_BC_ST, a.VLR_ICMS_ITEM, a.NCM, a.VLR_BC, ' +
    'a.IPI_ITEM, a.VLR_IPI_ITEM, a.VLR_AGR_ITEM, a.TRIB_ICMS, a.CESTA_BASICA, a.COD_SUPERVISOR, ' +
    'a.QTD_EMBALAGEM, a.PRECO_CUSTO, a.PERC_COMISSAO, a.PROMOCAO, a.DESCONTO_MAX, ' +
    'c.cor, t.tamanho, p.preco_venda, case when cf.MOSTRA_MARCA_NO_PEDIDO = ''S'' then case when p.id_marca is null then p.nom_produto else p.nom_produto||'' MARCA: ''||m.nom_marca end else p.NOM_PRODUTO end as nom_produto, ' +
    'p.cod_prateleira,p.unidade, p.qtd_embalagem from CONFIGURACAO cf, vendas2 a ' +
    'left join produto p on p.cod_produto = a.cod_produto ' +
    'left join marcas m on m.id = p.id_marca ' +
    'left join cores c on c.id = a.id_cor ' +
    'left join tamanho t on t.id = a.id_tamanho ' +
    'where numdoc = ' + QuotedStr(dao.Q1.fieldbyname('numdoc').AsString) +
    ' order by ord_pauta ');

  dao.Q2.First;
  total_produtos := 0;
  while not (dao.Q2.eof) do
  begin

    if (frpri.rd.Impressora <> Grafico) and (LH > 28) then
    begin
      frpri.rd.novapagina;
      lh := 0;
    end;

    if (frpri.rd.Impressora = Grafico) and (LH > 69) then
    begin
      frpri.rd.novapagina;
      lh := 0;
    end;

    LH := LH + 1;

    frpri.rd.impf(LH, 01, dao.Q2.fieldbyname('cod_produto').AsString + '\' +
      copy(dao.Q2.fieldbyname('nom_produto').AsString, 1, 50), [comp12]);

    frpri.rd.impval(LH, 57, '###,##0.00', dao.Q2.fieldbyname('qtd').AsFloat,
      [comp12]);

    frpri.rd.impf(LH, 69, dao.Q2.fieldbyname('unidade').AsString, [comp12]);

    frpri.rd.impf(LH, 72, FormatFloat('0',
      dao.Q2.fieldbyname('qtd_embalagem').AsFloat) + '/' + FormatFloat('0',
      dao.Q2.fieldbyname('volume').AsFloat), [comp12]);

    if (dao.Q2.fieldbyname('qtd_embalagem').AsFloat <> 0) and
      (dao.Q2.fieldbyname('volume').AsFloat <> 0) then
      frpri.rd.impf(LH, 72, FormatFloat('0',
        dao.Q2.fieldbyname('qtd_embalagem').AsFloat) + '/' + FormatFloat('0',
        dao.Q2.fieldbyname('volume').AsFloat), [comp12]);
    //         frpri.rd.impf(LH,72,formatfloat('#',dao.Q2.fieldbyname('qtd_embalagem').AsFloat)+'/'+dao.Q2.fieldbyname('volume').AsString,[comp12]);

    frpri.rd.impd(LH, 85, FormatFloat('###,##0.00',
      dao.Q2.fieldbyname('preco').AsFloat), [comp12]);
    frpri.rd.impval(LH, 85, '###,##0.00',
      dao.Q2.fieldbyname('sub_total').AsFloat, [comp12]);
    total_produtos := total_produtos + dao.Q2.fieldbyname('sub_total').AsFloat;
    dao.Q2.next;

  end;

  if (frpri.rd.Impressora <> Grafico) and (LH > 28) then
  begin
    frpri.rd.novapagina;
    lh := 0;
  end;

  if (frpri.rd.Impressora = Grafico) and (LH > 69) then
  begin
    frpri.rd.novapagina;
    lh := 0;
  end;

  LH := LH + 1;
  frpri.rd.impC(LH, 01,
    '----------------------------------------------------------------------------------------------',
    [comp12, NEGRITO]);

  if (frpri.rd.Impressora <> Grafico) and (LH > 28) then
  begin
    frpri.rd.novapagina;
    lh := 0;
  end;

  if (frpri.rd.Impressora = Grafico) and (LH > 69) then
  begin
    frpri.rd.novapagina;
    lh := 0;
  end;

  LH := LH + 1;
  dao.Q1.Open;
  case modelo_desconto of
    1:
      begin
        frpri.rd.impC(LH, 02, 'FOR.PAGAMEN.:', [comp12, NEGRITO]);
        frpri.rd.impf(LH, 15, dao.Q1.fieldbyname('nom_fop').AsString + ' ' +
          dao.Q1.fieldbyname('prazo').AsString, [comp12]);

        frpri.rd.impC(LH, 77, 'TOT.LIQUIDO:', [comp12, NEGRITO]);
        frpri.rd.impval(LH, 85, '###,##0.00',
          dao.Q1.fieldbyname('tot_liquido').AsFloat, [comp12]);
      end;
    2:
      begin
        frpri.rd.impC(LH, 02, 'TOT.PRODUTOS:', [comp12, NEGRITO]);
        frpri.rd.ImpVal(LH, 15, '###,##0.00', total_produtos, [comp12]);

        frpri.rd.impC(LH, 36, 'DESCONTO:', [comp12, NEGRITO]);
        frpri.rd.ImpVal(LH, 42, '##0.00',
          dao.Q1.fieldbyname('VALORDESCONTOADIC').AsFloat, [comp12]);

        frpri.rd.impC(LH, 77, 'TOT.LIQUIDO:', [comp12, NEGRITO]);
        frpri.rd.impval(LH, 85, '###,##0.00',
          dao.Q1.fieldbyname('tot_liquido').AsFloat, [comp12]);
      end;
  end;
  if (frpri.rd.Impressora <> Grafico) and (LH > 28) then
  begin
    frpri.rd.novapagina;
    lh := 0;
  end;

  if (frpri.rd.Impressora = Grafico) and (LH > 69) then
  begin
    frpri.rd.novapagina;
    lh := 0;
  end;

  LH := LH + 1;
  case modelo_desconto of
    1:
      begin
        frpri.rd.impC(LH, 02, 'PESO PEDIDO:', [comp12, NEGRITO]);
        frpri.rd.ImpVal(LH, 15, '0.000',
          dao.Q1.fieldbyname('peso_nota').AsFloat,
          [comp12]);

        frpri.rd.impC(LH, 70, 'QTD DE VOLUMES DO PEDIDO:', [comp12, NEGRITO]);
        frpri.rd.impval(LH, 89, '##0.00',
          dao.Q1.fieldbyname('volume_nota').AsFloat, [comp12]);
      end;
    2:
      begin
        frpri.rd.impC(LH, 02, 'FOR.PAGAMEN.:', [comp12, NEGRITO]);
        frpri.rd.impf(LH, 15, dao.Q1.fieldbyname('nom_fop').AsString + ' ' +
          dao.Q1.fieldbyname('prazo').AsString, [comp12]);

        frpri.rd.impC(LH, 35, 'PESO PEDIDO:', [comp12, NEGRITO]);
        frpri.rd.ImpVal(LH, 43, '0.000',
          dao.Q1.fieldbyname('peso_nota').AsFloat,
          [comp12]);

        frpri.rd.impC(LH, 70, 'QTD DE VOLUMES DO PEDIDO:', [comp12, NEGRITO]);
        frpri.rd.impval(LH, 89, '##0.00',
          dao.Q1.fieldbyname('volume_nota').AsFloat, [comp12]);
      end;
  end;

  if (frpri.rd.Impressora <> Grafico) and (LH > 28) then
  begin
    frpri.rd.novapagina;
    lh := 0;
  end;

  if (frpri.rd.Impressora = Grafico) and (LH > 69) then
  begin
    frpri.rd.novapagina;
    lh := 0;
  end;

  LH := LH + 1;
  frpri.rd.impC(LH, 02, 'OBSERV:', [comp12, NEGRITO]);

  MTAMTOT := length(dao.Q1.fieldbyname('observacoes_pedido').AsString);

  SetLength(MLHCH, ((MTAMTOT div 90) + 1));

  I := 1;
  observacao := stringreplace(dao.Q1.fieldbyname('observacoes_pedido').AsString,
    #$D#$A, ' ', [rfReplaceAll]);

  if length(MLHCH) > 1 then
  begin
    for x := 0 to length(MLHCH) - 1 do
    begin
      MLHCH[x] := copy(observacao, I, 90);
      for y := length(MLHCH[x]) downto 1 do
      begin
        if copy(MLHCH[x], y, 1) = ' ' then
        begin
          MLHCH[x] := copy(observacao, I, y);
          I := I + y;
          break;
        end;
      end;
    end;

    for x := 0 to length(MLHCH) - 1 do
    begin
      frpri.rd.impf(LH, 09, MLHCH[x], [comp12]);
      LH := LH + 1;
    end;
  end
  else
  begin
    frpri.rd.impf(LH, 09, observacao, [comp12]);
    LH := LH + 1;
  end;

  if (frpri.rd.Impressora <> Grafico) and (LH > 28) then
  begin
    frpri.rd.novapagina;
    lh := 0;
  end;

  if (frpri.rd.Impressora = Grafico) and (LH > 69) then
  begin
    frpri.rd.novapagina;
    lh := 0;
  end;

  dao.Geral3('select * from cr1 where nr_documento=' + QuotedStr(n_pedido));
  if dao.Q3.RecordCount >= 1 then
  begin
    if (frpri.rd.Impressora <> Grafico) and (LH > 28) then
    begin
      frpri.rd.novapagina;
      lh := 0;
    end;

    if (frpri.rd.Impressora = Grafico) and (LH > 69) then
    begin
      frpri.rd.novapagina;
      lh := 0;
    end;

    lh := lh + 1;
    frpri.rd.ImpF(lh, 02, 'Vencimentos: ', [comp12]);
    dao.Q3.First;
    CL := 16;
    MCR1 := FormatDateTime('dd/mm/yyyy', dao.Q3.fieldbyname('dtaven').AsDateTime)
      +
      ':' + formatfloat('###,##0.00', dao.Q3.fieldbyname('valor').AsFloat);
    dao.Q3.Next;
    while not (dao.Q3.Eof) do
    begin
      MCR1 := MCR1 + ' - ' + FormatDateTime('dd/mm/yyyy',
        dao.Q3.fieldbyname('dtaven').AsDateTime) + ' : ' +
        formatfloat('###,##0.00', dao.q3.fieldbyname('valor').AsFloat);
      dao.Q3.Next;
    end;
    frpri.rd.ImpF(lh, 16, MCR1, [comp12]);
  end;

  if (frpri.rd.Impressora <> Grafico) and (LH > 28) then
  begin
    frpri.rd.novapagina;
    lh := 0;
  end;

  if (frpri.rd.Impressora = Grafico) and (LH > 69) then
  begin
    frpri.rd.novapagina;
    lh := 0;
  end;

  LH := LH + 1;
  frpri.rd.impf(LH, 01,
    '----------------------------------------------------------------------------------------------',
    [comp12, NEGRITO]);

  if (frpri.rd.Impressora <> Grafico) and (LH > 28) then
  begin
    frpri.rd.novapagina;
    lh := 0;
  end;

  if (frpri.rd.Impressora = Grafico) and (LH > 69) then
  begin
    frpri.rd.novapagina;
    lh := 0;
  end;

  LH := LH + 1;

  frpri.rd.impf(LH, 02, fantasia + ' - Fone: ' + fone_empresa, [comp12,
    negrito]);
  frpri.rd.impf(LH, 80, USUARIO, [comp12, negrito]);

  if (frpri.rd.Impressora <> Grafico) and (LH > 28) then
  begin
    frpri.rd.novapagina;
    lh := 0;
  end;

  if (frpri.rd.Impressora = Grafico) and (LH > 69) then
  begin
    frpri.rd.novapagina;
    lh := 0;
  end;

  LH := LH + 1;
  frpri.rd.impC(LH, 03,
    '----------------------------------------------------------------------------------------------',
    [comp12, NEGRITO]);

  if dao.Q1.fieldbyname('nom_fop').AsString = 'TROCA' then
  begin
    if (frpri.rd.Impressora <> Grafico) and (LH > 28) then
    begin
      frpri.rd.novapagina;
      lh := 0;
    end;

    if (frpri.rd.Impressora = Grafico) and (LH > 69) then
    begin
      frpri.rd.novapagina;
      lh := 0;
    end;

    LH := LH + 1;
    frpri.rd.impF(LH, 03, 'A TROCA DO PRODUTO SOMENTE SERÁ EFETUADA ',
      [expandido, NEGRITO]);

    if (frpri.rd.Impressora <> Grafico) and (LH > 28) then
    begin
      frpri.rd.novapagina;
      lh := 0;
    end;
    LH := LH + 1;
    frpri.rd.impF(LH, 03, 'MEDIANTE A DEVOLUÇÃO DA MERCADORIA COM ',
      [expandido,
      NEGRITO]);

    if (frpri.rd.Impressora <> Grafico) and (LH > 28) then
    begin
      frpri.rd.novapagina;
      lh := 0;
    end;
    if (frpri.rd.Impressora = Grafico) and (LH > 69) then
    begin
      frpri.rd.novapagina;
      lh := 0;
    end;
    LH := LH + 1;
    frpri.rd.impF(LH, 03, 'DEFEITO/IRREGULAR.', [expandido, NEGRITO]);

  end;
  //    dao.q1.next;
  //  end;

  frpri.rd.fechar; // Encerra o relatório...

end;

procedure TFr_vendas_industria2.ImprimePedido;
begin

end;

function TFr_vendas_industria2.ChecarDadosTransportadora: boolean;
begin
  Prcod_transportadoraExit(Self);

  if (Prcod_transportadora.text = '') then
  begin
    Result := true;
    exit;
  end;

  if not FMFUN.ValidaDadosTransportadora(Prcod_transportadora.Text) then
  begin
    showmessage('Há dados incompletos no cadastro de Transportadoras!');
    try
      Application.CreateForm(TFr_Transportadora, Fr_Transportadora);
      Fr_Transportadora.dados_incompletos := true;
      Fr_Transportadora.transportadora := Prcod_transportadora.Text;
      Fr_Transportadora.ShowModal;
    finally
      Fr_Transportadora.Free;
    end;
    Result := false;
  end
  else
    Result := true;
end;

function TFr_vendas_industria2.ChecarDadosCliente: boolean;
begin

  if (prcod_cliente.text = '') then
  begin
    Result := true;
    exit;
  end;

  if not FMFUN.ValidaDadosCliente(prcod_cliente.Text) then
  begin
    showmessage('Há dados incompletos no cadastro de Clientes!');
    try
      Application.CreateForm(TFr_Cliente, Fr_Cliente);
      Fr_Cliente.dados_incompletos := true;
      Fr_Cliente.cliente := prcod_cliente.Text;
      Fr_Cliente.ShowModal;
    finally
      fr_cliente.Free;
    end;
    Result := false;
  end
  else
    Result := true;
end;

procedure TFr_vendas_industria2.imprimirLotedePedidos1Click(
  Sender: TObject);
begin
  Application.CreateForm(TFr_imp_pedidos_lote, Fr_imp_pedidos_lote);
  Fr_imp_pedidos_lote.ShowModal;
end;

procedure TFr_vendas_industria2.mostra_cr1(numdoc: string);
begin

end;

procedure TFr_vendas_industria2.ativa_cr1(numdoc: string);
begin
  with q_cr1 do
  begin
    close;
    sql.clear;
    sql.add('select cr.id, cr.titulo, cr.sequencia, cr.dtaven, cr.valor, cr.cod_fop, fp.nom_fop, cr.dtarec, cr.valor_recebido, cr.BOLETO_REMESSA_ORDEM, fp.conta_padrao from cr1 cr ' +
      'left join fop fp on fp.cod_fop=cr.cod_fop ' +
      'where cr.nr_documento =' + QuotedStr(numdoc));
    open;

    q_cr1.FieldByName('titulo').DisplayLabel := 'Titulo';
    q_cr1.FieldByName('sequencia').DisplayLabel := 'Seq.';
    q_cr1.FieldByName('dtaven').DisplayLabel := 'Vencimento';
    q_cr1.FieldByName('valor').DisplayLabel := 'Valor';
    q_cr1.FieldByName('cod_fop').DisplayLabel := 'F.Pagto';
    q_cr1.FieldByName('nom_fop').DisplayLabel := 'Forma Pagamento';
    q_cr1.fieldbyname('dtarec').DisplayLabel := 'Data Recebimento';
    q_cr1.FieldByName('valor_recebido').DisplayLabel := 'Valor Recebido';
    q_cr1.FieldByName('BOLETO_REMESSA_ORDEM').DisplayLabel := 'Remessa Assoc.';
    q_cr1.FieldByName('conta_padrao').DisplayLabel := 'Conta Padrão';

    if trim(prconta_boleto.text) <> '' then
    begin
      MontaArquivoCobrancaEnvio;
      btnBoleto.Enabled := true;
      BtnEmailBoleto.Enabled := true;
    end
    else
    begin
      btnBoleto.Enabled := false;
      BtnEmailBoleto.Enabled := false;
    end;
  end;
end;

procedure TFr_vendas_industria2.Btgrava_cr1Click(Sender: TObject);
begin
  try
    if not (dao.cn.InTransaction) then
      (dao.cn.StartTransaction);
    dao.update('cr1', 'id', Crid.Text, 'Cr', Fr_vendas_industria2);
    dao.cn.Commit;
    ativa_cr1(Prnumdoc.Text);
    dao.msg('Alterações Gravadas com Sucesso!');
  except
    on e: Exception do
    begin
      dao.cn.Rollback;
      dao.msg('Houve um erro ao gravar Alterações no grid do Contas a Receber!'
        + #13 +
        e.message);
      dao.envia_email_suporte(e.Message + #13 + 'Data: ' + dao.DtaSerStr + #13 +
        'Usuario Logado:' + nom_usuario,
        'Erro ao gravar os dados no grid do cr1 form vendas_industria',
        'informatica@plasfan.ind.br', '', '', '');
    end;
  end;

end;

procedure TFr_vendas_industria2.Btinsere_chequeClick(Sender: TObject);
begin
  if Crtitulo.Text = '' then
  begin
    dao.msg('Selecione um Titulo para inserir um Cheque!');
    exit;
  end;
  if Crcod_fop.Text <> '4' then
  begin
    dao.msg('Para inserir um cheque a forma de pagamento deve ser cheque!');
    exit;
  end;
  Application.CreateForm(TFr_cheque_terceiros, Fr_cheque_terceiros);
  Fr_cheque_terceiros.ShowModal;
end;

procedure TFr_vendas_industria2.MontaArquivoEnvio(nom_arquivo: string);
var
  txt: TextFile;
  linha: string;
  mqtd_registros: integer;
  telefone: string;
  cod_cliente, nr_doc, pathSaida: string;
begin
  pathSaida := ExtractFilePath(Application.ExeName) + 'Transmicao\';
  AssignFile(txt, pathSaida + nom_arquivo);

  Rewrite(txt);

  //CABEÇALHO
  Write(txt, ajustastr('01', 2));
  Write(txt, ajustastr('000', 3));
  Write(txt, ajustastr('1.00', 3));
  Write(txt, ajustastr(dao.DtaSerStr, 10));
  Write(txt, ajustastr(TimeToStr(time), 5));
  mqtd_registros := 1;

  write(txt, ajustastr('05', 2));
  WriteLn(txt);

  //VENDEDOR
  dao.Geral1('select id, nom_representante, CASE FUNCIONARIO WHEN ''S'' THEN ''F'' ELSE ''O'' END TIPO from representante where nom_representante is not null ');
  dao.Q1.First;
  DecimalSeparator := ',';
  while not (dao.q1.eof) do
  begin
    //1
    write(txt, ajustastr('05', 2));

    //2
    if dao.Q1.FieldByName('id').AsString <> '' then
      Write(txt, ajustastr(FMFUN.enchezero(dao.Q1.FieldByName('id').AsString,
        3), 3))
    else
      Write(txt, ajustastr(FMFUN.enchezero('0', 3), 3));

    //3
    if dao.Q1.FieldByName('id').AsString <> '' then
      Write(txt, ajustastr(FMFUN.enchezero(dao.Q1.FieldByName('id').AsString,
        3), 3))
    else
      Write(txt, ajustastr(FMFUN.enchezero('0', 3), 3));

    //4
    if dao.Q1.FieldByName('nom_representante').AsString <> '' then
      Write(txt,
        ajustastr(FMFUN.AnsiToAscii(dao.Q1.FieldByName('nom_representante').AsString), 50))
    else
      Write(txt, ajustastr('', 50));

    //5
    Write(txt, ajustastr('0000000.00', 10));

    if dao.Q1.FieldByName('TIPO').AsString <> '' then
      Write(txt,
        ajustastr(FMFUN.AnsiToAscii(dao.Q1.FieldByName('TIPO').AsString), 1))
    else
      Write(txt, ajustastr('', 1));

    WriteLn(txt);
    dao.Q1.Next;
    mqtd_registros := mqtd_registros + 1;
  end;

  //CLIENTES
  dao.Geral1('select id_representante, cod_cliente, nom_cliente, nom_fantasia, tip_pessoa, cnpj, cpf,' +
    'ie, rg, endereco, bairro, cep, c.nom_cidade, c.uf, pri_compra, telefone, contato, id_fop,' +
    'prazo_maximo, limite, desconto_maximo, email from cliente cl ' +
    'left join cidades c on c.cod_cidade=cl.cod_cidade ' +
    'where id_representante is not null');

  dao.Q1.First;
  DecimalSeparator := ',';
  while not (dao.q1.eof) do
  begin
    //1
    write(txt, ajustastr('10', 2));
    //2
    if dao.Q1.FieldByName('id_representante').AsString <> '' then
      Write(txt,
        ajustastr(FMFUN.enchezero(dao.Q1.FieldByName('id_representante').AsString,
        3), 3))
    else
      Write(txt, ajustastr(FMFUN.enchezero('0', 3), 3));
    //3
    if dao.Q1.FieldByName('cod_cliente').AsString <> '' then
      Write(txt,
        ajustastr(FMFUN.enchevazio(dao.Q1.FieldByName('cod_cliente').AsString,
        6),
        6))
    else
      Write(txt, ajustastr(FMFUN.enchevazio('', 6), 6));
    //4
    if dao.Q1.FieldByName('nom_cliente').AsString <> '' then
      Write(txt,
        ajustastr(FMFUN.AnsiToAscii(dao.Q1.FieldByName('nom_cliente').AsString),
        50))
    else
      Write(txt, ajustastr('', 50));
    //5
    if dao.Q1.FieldByName('nom_fantasia').AsString <> '' then
      Write(txt,
        ajustastr(FMFUN.AnsiToAscii(dao.Q1.FieldByName('nom_fantasia').AsString),
        50))
    else
      Write(txt, ajustastr('', 50));
    //6
    Write(txt, ajustastr('J', 1)); //tipo de pessoa J F
    //7
    if dao.Q1.FieldByName('cnpj').AsString <> '  .   .   /    -  ' then
      Write(txt, ajustastr(dao.Q1.FieldByName('cnpj').AsString, 18))
    else if dao.Q1.FieldByName('cpf').AsString <> '   .   .   -  ' then
      Write(txt, ajustastr(dao.Q1.FieldByName('cpf').AsString, 18))
    else
      Write(txt, ajustastr('', 18));

    //8
    if dao.Q1.FieldByName('rg').AsString <> '' then
      Write(txt, ajustastr(dao.Q1.FieldByName('rg').AsString, 20))
    else if dao.Q1.FieldByName('ie').AsString <> '' then
      Write(txt, ajustastr(dao.Q1.FieldByName('ie').AsString, 20))
    else
      Write(txt, ajustastr('', 20));
    //9
    if dao.Q1.FieldByName('endereco').AsString <> '' then
      Write(txt,
        ajustastr(FMFUN.AnsiToAscii(dao.Q1.FieldByName('endereco').AsString),
        50))
    else
      Write(txt, ajustastr('', 50));
    //10
    if dao.Q1.FieldByName('bairro').AsString <> '' then
      Write(txt, ajustastr(dao.Q1.FieldByName('bairro').AsString, 25))
    else
      Write(txt, ajustastr('', 25));
    //11
    if dao.Q1.FieldByName('cep').AsString <> '' then
      Write(txt, ajustastr(dao.Q1.FieldByName('cep').AsString, 10))
    else
      Write(txt, ajustastr('', 10));
    //12
    if dao.Q1.FieldByName('nom_cidade').AsString <> '' then
      Write(txt,
        ajustastr(FMFUN.AnsiToAscii(dao.Q1.FieldByName('nom_cidade').AsString),
        25))
    else
      Write(txt, ajustastr('', 25));
    //13
    if dao.Q1.FieldByName('uf').AsString <> '' then
      Write(txt, ajustastr(dao.Q1.FieldByName('uf').AsString, 2))
    else
      Write(txt, ajustastr('', 2));

    if dao.Q1.FieldByName('pri_compra').AsString <> '' then
      Write(txt, ajustastr(Formatdatetime('dd/mm/yyyy',
        dao.Q1.FieldByName('pri_compra').AsDateTime), 10))
    else
      Write(txt, ajustastr('', 10));

    //telefone:= copy(dao.Q1.FieldByName('telefone').AsString,1,1);
    //telefone:= telefone + copy(dao.Q1.FieldByName('telefone').AsString,3,12);
    telefone := '(';
    telefone := telefone + dao.Q1.FieldByName('telefone').AsString;
    if dao.Q1.FieldByName('telefone').AsString <> '' then
      Write(txt, ajustastr(dao.Q1.FieldByName('telefone').AsString, 14))
    else
      Write(txt, ajustastr('', 14));

    if dao.Q1.FieldByName('contato').AsString <> '' then
      Write(txt,
        ajustastr(FMFUN.AnsiToAscii(dao.Q1.FieldByName('contato').AsString), 25))
    else
      Write(txt, ajustastr('', 25));

    if dao.Q1.FieldByName('id_fop').AsString <> '' then
      Write(txt, ajustastr(dao.Q1.FieldByName('id_fop').AsString, 3))
    else
      Write(txt, ajustastr('', 3));

    if dao.Q1.FieldByName('prazo_maximo').AsString <> '' then
      Write(txt, ajustastr(dao.Q1.FieldByName('prazo_maximo').AsString, 3))
    else
      Write(txt, ajustastr('', 3));

    {  if dao.Q1.FieldByName('limite').AsString <> '' then
        Write(txt, ajustastr(dao.Q1.FieldByName('limite').AsString, 9))
      else
        Write(txt, ajustastr('', 9));
     }
    if dao.Q1.FieldByName('desconto_maximo').AsString <> '' then
      Write(txt, ajustastr(formatfloat('0.00',
        dao.Q1.FieldByName('desconto_maximo').AsFloat), 6))
    else
      Write(txt, ajustastr('', 6));

    if dao.Q1.FieldByName('email').AsString <> '' then
      Write(txt, ajustastr(dao.Q1.FieldByName('email').AsString, 50))
    else
      Write(txt, ajustastr('', 50));

    WriteLn(txt);
    dao.Q1.Next;
    mqtd_registros := mqtd_registros + 1;
  end;

  //CLIENTE COMPLEMENTO
  dao.Geral1('select sum(v1.tot_liquido) as tot_liquido, v1.cod_representante, v1.cod_cliente, c.cliente_bloqueado, coalesce(c.limite,0) as limite from vendas1 v1 ' +
    'inner join cliente c on c.cod_cliente=v1.cod_cliente ' +
    'where v1.cod_representante is not null and v1.FATURADO = 1 ' +
    'and v1.DTA_EMISSAO = (select max(v2.dta_emissao) from vendas1 v2 where v1.cod_cliente = v2.COD_CLIENTE and v2.FATURADO = 1) ' +
    'group by cod_representante, cod_cliente, cliente_bloqueado, limite ' +
    'order by cod_cliente');

  dao.Q1.First;
  while not (dao.q1.eof) do
  begin
    Write(txt, ajustastr('11', 2));
    if dao.Q1.fieldbyname('cod_representante').AsString <> '' then
      Write(txt,
        ajustastr(FMFUN.enchezero(dao.Q1.fieldbyname('cod_representante').AsString, 3), 3))
    else
      Write(txt, ajustastr('', 3));

    if dao.Q1.fieldbyname('cod_cliente').AsString <> '' then
      Write(txt, ajustastr(dao.Q1.fieldbyname('cod_cliente').AsString, 6))
    else
      Write(txt, ajustastr('', 6));

    if dao.Q1.fieldbyname('limite').AsString <> '' then
      Write(txt, ajustastr(dao.Q1.fieldbyname('limite').AsString, 12))
    else
      Write(txt, ajustastr('', 12));

    if dao.Q1.fieldbyname('tot_liquido').AsString <> '' then
      Write(txt, ajustastr(dao.Q1.fieldbyname('tot_liquido').AsString, 12))
    else
      Write(txt, ajustastr('', 12));

    if (dao.Q1.fieldbyname('limite').AsString <> '') and
      (dao.Q1.fieldbyname('tot_liquido').AsString <> '') then
      Write(txt, ajustastr(FormatFloat('0.00',
        (dao.Q1.fieldbyname('limite').AsFloat -
        dao.Q1.fieldbyname('tot_liquido').AsFloat)), 12))
    else
      Write(txt, ajustastr('', 12));

    if dao.Q1.fieldbyname('cliente_bloqueado').AsString <> '' then
      Write(txt, ajustastr(dao.Q1.fieldbyname('cliente_bloqueado').AsString, 1))
    else
      Write(txt, ajustastr('', 1));

    WriteLn(txt);
    dao.Q1.Next;
    mqtd_registros := mqtd_registros + 1;
  end;

  //CLIENTE OBSERVAÇÃO
  dao.Geral1('select distinct v1.cod_representante, c.aviso, v1.cod_cliente, c.cliente_bloqueado from vendas1 v1 ' +
    'inner join cliente c on c.cod_cliente=v1.cod_cliente ' +
    'where c.aviso is not null and  v1.DTA_EMISSAO = (select max(v2.dta_emissao) from vendas1 v2 where v1.cod_cliente = v2.COD_CLIENTE and v2.FATURADO = 1)  and v1.FATURADO = 1 ' +
    'order by cod_representante, cod_cliente  ');

  dao.Q1.First;
  while not (dao.q1.eof) do
  begin
    Write(txt, ajustastr('12', 2));
    if dao.Q1.fieldbyname('cod_representante').AsString <> '' then
      Write(txt,
        ajustastr(FMFUN.enchezero(dao.Q1.fieldbyname('cod_representante').AsString, 3), 3))
    else
      Write(txt, ajustastr('', 3));

    if dao.Q1.fieldbyname('cod_cliente').AsString <> '' then
      Write(txt, ajustastr(dao.Q1.fieldbyname('cod_cliente').AsString, 6))
    else
      Write(txt, ajustastr('', 6));

    if dao.Q1.fieldbyname('aviso').AsString <> '' then
      Write(txt,
        ajustastr(copy(stringreplace(FMFUN.AnsiToAscii(dao.Q1.fieldbyname('aviso').AsString), #$D#$A, ' ', [rfReplaceAll]), 1, 200), 200))
    else
      Write(txt, ajustastr('', 200));

    WriteLn(txt);
    dao.Q1.Next;
    mqtd_registros := mqtd_registros + 1;
  end;

  //COBRANÇA
  dao.Geral1('SELECT a.ID_REPRESENTANTE, a.TITULO||''-''||a.SEQUENCIA as titulo, a.COD_CLIENTE,  a.DTAVEN, a.VALOR, a.NR_DOCUMENTO, a.HISTORICO1 FROM CR1 a order by id_representante, titulo, sequencia ');

  dao.Q1.First;
  while not (dao.q1.eof) do
  begin
    Write(txt, ajustastr('15', 2));
    if dao.Q1.fieldbyname('ID_REPRESENTANTE').AsString <> '' then
      Write(txt,
        ajustastr(FMFUN.enchezero(dao.Q1.fieldbyname('ID_REPRESENTANTE').AsString,
        3), 3))
    else
      Write(txt, ajustastr('', 3));

    if dao.Q1.fieldbyname('TITULO').AsString <> '' then
      Write(txt, ajustastr(dao.Q1.fieldbyname('TITULO').AsString, 15))
    else
      Write(txt, ajustastr('', 15));

    if dao.Q1.fieldbyname('cod_cliente').AsString <> '' then
      Write(txt, ajustastr(dao.Q1.fieldbyname('cod_cliente').AsString, 6))
    else
      Write(txt, ajustastr('', 6));

    if dao.Q1.fieldbyname('DTAVEN').AsDateTime <> 0 then
      Write(txt, ajustastr(FormatDateTime('dd/mm/yyyy',
        dao.Q1.fieldbyname('DTAVEN').AsDateTime), 10))
    else
      Write(txt, ajustastr('', 10));

    if dao.Q1.fieldbyname('VALOR').AsString <> '' then
      Write(txt, ajustastr(FormatFloat('0.00',
        dao.Q1.fieldbyname('VALOR').AsFloat), 10))
    else
      Write(txt, ajustastr('', 10));

    Write(txt, ajustastr('', 10));

    if dao.Q1.fieldbyname('NR_DOCUMENTO').AsString <> '' then
      Write(txt, ajustastr(dao.Q1.fieldbyname('NR_DOCUMENTO').AsString, 15))
    else
      Write(txt, ajustastr('', 15));

    if dao.Q1.fieldbyname('HISTORICO1').AsString <> '' then
      Write(txt,
        ajustastr(copy(stringreplace(FMFUN.AnsiToAscii(dao.Q1.fieldbyname('HISTORICO1').AsString), #$D#$A, ' ', [rfReplaceAll]), 1, 30), 30))
    else
      Write(txt, ajustastr('', 30));

    WriteLn(txt);
    dao.Q1.Next;
    mqtd_registros := mqtd_registros + 1;
  end;

  //ULTIMA COMPRA CLIENTE  18
  dao.Geral1('select v1.dtadoc, v1.numdoc, v1.cod_representante, v1.cod_cliente, v2.cod_produto, v2.qtd, v2.preco, v1.tot_liquido from vendas2 v2 ' +
    'inner join vendas1 v1 on v2.numdoc=v1.numdoc where v1.cod_representante is not null and v1.cod_cliente is not null ' +
    'order by v2.cod_cliente, v2.dtadoc desc ');
  dao.Q1.First;
  cod_cliente := dao.Q1.fieldbyname('cod_cliente').AsString;
  nr_doc := dao.Q1.fieldbyname('numdoc').AsString;

  while not (dao.q1.eof) do
  begin
    if (dao.Q1.fieldbyname('cod_cliente').AsString <> cod_cliente) and
      (dao.Q1.fieldbyname('numdoc').AsString <> nr_doc) then
    begin
      cod_cliente := dao.Q1.fieldbyname('cod_cliente').AsString;
      nr_doc := dao.Q1.fieldbyname('numdoc').AsString;
    end;

    if (dao.Q1.fieldbyname('cod_cliente').AsString = cod_cliente) and
      (dao.Q1.fieldbyname('numdoc').AsString = nr_doc) then
    begin
      Write(txt, ajustastr('18', 2));

      if dao.Q1.fieldbyname('cod_representante').AsString <> '' then
        Write(txt,
          ajustastr(FMFUN.enchezero(dao.Q1.fieldbyname('cod_representante').AsString, 3), 3))
      else
        Write(txt, ajustastr('', 3));

      if dao.Q1.fieldbyname('numdoc').AsString <> '' then
        Write(txt, ajustastr(dao.Q1.fieldbyname('numdoc').AsString, 8))
      else
        Write(txt, ajustastr('', 8));

      if dao.Q1.fieldbyname('cod_produto').AsString <> '' then
        Write(txt, ajustastr(dao.Q1.fieldbyname('cod_produto').AsString, 6))
      else
        Write(txt, ajustastr('', 6));

      if dao.Q1.fieldbyname('qtd').AsString <> '' then
        Write(txt, ajustastr(formatfloat('0.000',
          dao.Q1.fieldbyname('qtd').AsFloat), 10))
      else
        Write(txt, ajustastr('', 10));

      if dao.Q1.fieldbyname('preco').AsString <> '' then
        Write(txt, ajustastr(formatfloat('0.000',
          dao.Q1.fieldbyname('preco').AsFloat), 10))
      else
        Write(txt, ajustastr('', 10));

      if dao.Q1.fieldbyname('cod_cliente').AsString <> '' then
        Write(txt, ajustastr(dao.Q1.fieldbyname('cod_cliente').AsString, 6))
      else
        Write(txt, ajustastr('', 6));

      if dao.Q1.fieldbyname('dtadoc').AsDateTime <> 0 then
        Write(txt, ajustastr(FormatDateTime('dd/mm/yyyy',
          dao.Q1.fieldbyname('dtadoc').AsDateTime), 10))
      else
        Write(txt, ajustastr('', 10));

      WriteLn(txt);
      dao.Q1.Next;
      mqtd_registros := mqtd_registros + 1;
    end
    else
      dao.Q1.Next;
  end;

  //20
  //PRODUTO
  dao.Geral1('select cod_produto, nom_produto ,unidade, qtd_embalagem, p.cod_grupo, cod_produto, preco_venda, custo, PROMOCAO, PERC_MARGEM_MINIMA, ' +
    ' case when n.codigo in  (''3920.20.19'', ''3917.32.90'') then ''B'' else ''A'' end as tipo,  ' +
    '     case when cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) < 30 ' +
    '     then ' +
    '       1 ' +
    '     else  ' +
    '       case when (cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) >= 30 and ' +
    '                  cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) < 35) ' +
    '       then ' +
    '         case when n.codigo in  (''3920.20.19'', ''3917.32.90'') then 2 else 2.25 end ' +
    '       else ' +
    '        case when (cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) >= 35 ' + 'and cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) < 40) '
    +
    '        then ' +
    '          case when n.codigo in  (''3920.20.19'', ''3917.32.90'') then 2.25 else 2.75 end ' +
    '        else ' +
    '          case when (cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) >= 40 ' + ' and cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) < 50) '
    +
    '          then ' +
    '            case when n.codigo in  (''3920.20.19'', ''3917.32.90'') then 2.5 else 3 end ' +
    '          else ' +
    '            case when (cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) >= 50 ' + ' and cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) < 60) '
    +
    '            then ' +
    '              case when n.codigo in  (''3920.20.19'', ''3917.32.90'') then 2.75 else 3.25 end ' +
    '            else ' +
    '              case when (cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) >= 60 ' + ' and cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) < 70) '
    +
    '              then ' +
    '                case when n.codigo in  (''3920.20.19'', ''3917.32.90'') then 3 else 3.5 end ' +
    '              else ' +
    '                case when (cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) >= 70 ' + ' and cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) < 80) '
    +
    '                then ' +
    '                  case when n.codigo in  (''3920.20.19'', ''3917.32.90'') then 3.25 else 3.75 end ' +
    '                else ' +
    '                  case when (cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) >= 80 ' + ' and cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) < 100) '
    +
    '                  then ' +
    '                    case when n.codigo in  (''3920.20.19'', ''3917.32.90'') then 3.5 else 4 end ' +
    '                  else ' +
    '                    case when (cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) >= 100) ' +
    '                    then ' +
    '                      case when n.codigo in  (''3920.20.19'', ''3917.32.90'') then 4 else 4.5 end ' +
    '                    end ' +
    '                  end ' +
    '                end ' +
    '              end   ' +
    '            end    ' +
    '          end     ' +
    '        end        ' +
    '       end          ' +
    '     end as comissao_funcionario, ' +
    '     case when cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) < 30 ' +
    '     then ' +
    '       1   ' +
    '     else   ' +
    '       case when (cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) >= 30 ' + ' and cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) < 35) '
    +
    '       then ' +
    '         case when n.codigo in  (''3920.20.19'', ''3917.32.90'') then 4 else 4.5 end ' +
    '       else ' +
    '        case when (cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) >= 35 ' + ' and cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) < 40) '
    +
    '        then ' +
    '          case when n.codigo in  (''3920.20.19'', ''3917.32.90'') then 4.5 else 5 end ' +
    '        else ' +
    '          case when (cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) >= 40 ' + ' and cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) < 50) '
    +
    '          then ' +
    '            case when n.codigo in  (''3920.20.19'', ''3917.32.90'') then 5 else 5.5 end ' +
    '          else ' +
    '            case when (cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) >= 50 ' + ' and cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) < 60) '
    +
    '            then ' +
    '              case when n.codigo in  (''3920.20.19'', ''3917.32.90'') then 5.25 else 5.75 end ' +
    '            else ' +
    '              case when (cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) >= 60 ' + ' and cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) < 70) '
    +
    '              then ' +
    '                case when n.codigo in  (''3920.20.19'', ''3917.32.90'') then 5.5 else 6 end ' +
    '              else ' +
    '                case when (cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) >= 70 ' + ' and cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) < 80) '
    +
    '                then ' +
    '                  case when n.codigo in  (''3920.20.19'', ''3917.32.90'') then 5.75 else 6.25 end ' +
    '                else ' +
    '                  case when (cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) >= 80 ' + ' and cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) < 100) '
    +
    '                  then ' +
    '                    case when n.codigo in  (''3920.20.19'', ''3917.32.90'') then 6 else 6.5 end ' +
    '                  else ' +
    '                    case when (cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) >= 100) ' +
    '                    then ' +
    '                      case when n.codigo in  (''3920.20.19'', ''3917.32.90'') then 6.5 else 7.5 end ' +
    '                    end ' +
    '                  end ' +
    '                end ' +
    '              end ' +
    '            end ' +
    '          end  ' +
    '        end ' +
    '       end ' +
    '     end as comissao_outros, ' +
    '     p.QTD_MULTIPLA ' +
    ' from produto p ' +
    ' inner join grupo g on (p.COD_GRUPO = g.cod_grupo) ' +
    ' inner join ncm n on (n.codigo = g.NCM or n.codigo = p.NCM) ' +
    ' where status = ''N''');
  dao.Q1.First;
  while not (dao.q1.eof) do
  begin
    Write(txt, ajustastr('20', 2));
    Write(txt, ajustastr('***', 3));
    if dao.Q1.fieldbyname('cod_produto').AsString <> '' then
      Write(txt,
        ajustastr(FMFUN.enchevazio(dao.Q1.fieldbyname('cod_produto').AsString,
        10), 10))
    else
      Write(txt, ajustastr(dao.Q1.fieldbyname('cod_produto').AsString, 10));

    if dao.Q1.FieldByName('nom_produto').AsString <> '' then
      Write(txt,
        ajustastr(FMFUN.AnsiToAscii(dao.Q1.fieldbyname('nom_produto').AsString),
        50))
    else
      Write(txt, ajustastr('', 50));

    Write(txt, ajustastr('', 25));

    if dao.Q1.fieldbyname('unidade').AsString <> '' then
      Write(txt, ajustastr(dao.Q1.fieldbyname('unidade').AsString, 3))
    else
      Write(txt, ajustastr('', 3));

    if dao.Q1.fieldbyname('qtd_embalagem').AsString <> '' then
      Write(txt, ajustastr(dao.Q1.fieldbyname('qtd_embalagem').AsString, 10))
    else
      Write(txt, ajustastr('', 10));

    if dao.Q1.fieldbyname('cod_grupo').AsString <> '' then
      Write(txt, ajustastr(dao.Q1.fieldbyname('cod_grupo').AsString, 3))
    else
      Write(txt, ajustastr('', 3));

    if dao.Q1.fieldbyname('custo').AsString <> '' then
      Write(txt, ajustastr(formatfloat('0.000',
        dao.Q1.fieldbyname('custo').AsFloat), 10))
    else
      Write(txt, ajustastr('', 10));

    if dao.Q1.fieldbyname('preco_venda').AsString <> '' then
      Write(txt, ajustastr(formatfloat('0.000',
        dao.Q1.fieldbyname('preco_venda').AsFloat), 10))
    else
      Write(txt, ajustastr('', 10));

    if dao.Q1.fieldbyname('PERC_MARGEM_MINIMA').AsString <> '' then
      Write(txt,
        ajustastr(FMFUN.enchevazio(dao.Q1.fieldbyname('PERC_MARGEM_MINIMA').AsString, 6), 6))
    else
      Write(txt, ajustastr('', 6));

    if dao.Q1.fieldbyname('PROMOCAO').AsString <> '' then
      Write(txt, ajustastr(dao.Q1.fieldbyname('PROMOCAO').AsString, 1))
    else
      Write(txt, ajustastr('N', 1));

    if dao.Q1.fieldbyname('comissao_funcionario').AsString <> '' then
      Write(txt,
        ajustastr(FMFUN.enchevazio(dao.Q1.fieldbyname('comissao_funcionario').AsString, 6), 6))
    else
      Write(txt, ajustastr('', 6));

    if dao.Q1.fieldbyname('comissao_outros').AsString <> '' then
      Write(txt,
        ajustastr(FMFUN.enchevazio(dao.Q1.fieldbyname('comissao_outros').AsString,
        6), 6))
    else
      Write(txt, ajustastr('', 6));

    Write(txt, ajustastr(dao.Q1.fieldbyname('TIPO').AsString, 1));

    if dao.Q1.fieldbyname('QTD_MULTIPLA').AsString <> '' then
      Write(txt, ajustastr(formatfloat('0.000',
        dao.Q1.fieldbyname('QTD_MULTIPLA').AsFloat), 10))
    else
      Write(txt, ajustastr('', 10));

    //PROMOCAO, PERC_MARGEM_MINIMA

    WriteLn(txt);
    dao.Q1.Next;
    mqtd_registros := mqtd_registros + 1;
  end;

  //23
  //PRODUTO ESTOQUE
  dao.Geral1('select cod_produto,qtd_estoque from produto where status = ''N''');
  dao.Q1.First;
  while not (dao.q1.eof) do
  begin
    Write(txt, ajustastr('23', 2));
    Write(txt, ajustastr('***', 3));
    if dao.Q1.fieldbyname('cod_produto').AsString <> '' then
      Write(txt,
        ajustastr(FMFUN.enchevazio(dao.Q1.fieldbyname('cod_produto').AsString,
        10), 10))
    else
      Write(txt, ajustastr(dao.Q1.fieldbyname('cod_produto').AsString, 10));

    if dao.Q1.fieldbyname('qtd_estoque').AsString <> '' then
      Write(txt, ajustastr(FMFUN.enchevazio(FormatFloat('0.000',
        dao.Q1.fieldbyname('qtd_estoque').AsFloat), 10), 10))
    else
      Write(txt, ajustastr('', 10));

    WriteLn(txt);
    dao.Q1.Next;
    mqtd_registros := mqtd_registros + 1;
  end;

  //MARGEM X COMISSAO 35
  dao.Geral1('SELECT a.ID, 0 AS MARGEM_INICIO, 29.99 AS MARGEM_FINAL, 1 AS COMISSAO, ''A'' AS TIPO FROM REPRESENTANTE a ' +
    ' union SELECT a.ID, 30 AS MARGEM_INICIO, 34.99 AS MARGEM_FINAL, CASE WHEN A.FUNCIONARIO = ''S'' THEN 2.25 ELSE 4.5 END AS COMISSAO, ''A'' AS TIPO FROM REPRESENTANTE a ' +
    ' union SELECT a.ID, 35 AS MARGEM_INICIO, 39.99 AS MARGEM_FINAL, CASE WHEN A.FUNCIONARIO = ''S'' THEN 2.75 ELSE 5 END AS COMISSAO, ''A'' AS TIPO FROM REPRESENTANTE a ' +
    ' union SELECT a.ID, 40 AS MARGEM_INICIO, 49.99 AS MARGEM_FINAL, CASE WHEN A.FUNCIONARIO = ''S'' THEN 3 ELSE 5.5 END AS COMISSAO, ''A'' AS TIPO FROM REPRESENTANTE a ' +
    ' union SELECT a.ID, 50 AS MARGEM_INICIO, 59.99 AS MARGEM_FINAL, CASE WHEN A.FUNCIONARIO = ''S'' THEN 3.25 ELSE 5.75 END AS COMISSAO, ''A'' AS TIPO FROM REPRESENTANTE a ' +
    ' union SELECT a.ID, 60 AS MARGEM_INICIO, 69.99 AS MARGEM_FINAL, CASE WHEN A.FUNCIONARIO = ''S'' THEN 3.5 ELSE 6 END AS COMISSAO, ''A'' AS TIPO FROM REPRESENTANTE a ' +
    ' union SELECT a.ID, 70 AS MARGEM_INICIO, 79.99 AS MARGEM_FINAL, CASE WHEN A.FUNCIONARIO = ''S'' THEN 3.75 ELSE 6.25 END AS COMISSAO, ''A'' AS TIPO FROM REPRESENTANTE a ' +
    ' union SELECT a.ID, 80 AS MARGEM_INICIO, 99.99 AS MARGEM_FINAL, CASE WHEN A.FUNCIONARIO = ''S'' THEN 4 ELSE 6.5 END AS COMISSAO, ''A'' AS TIPO FROM REPRESENTANTE a ' +
    ' union SELECT a.ID, 100 AS MARGEM_INICIO, 999.99 AS MARGEM_FINAL, CASE WHEN A.FUNCIONARIO = ''S'' THEN 4.5 ELSE 7.5 END AS COMISSAO, ''A'' AS TIPO FROM REPRESENTANTE a ' +
    ' UNION SELECT a.ID, 0 AS MARGEM_INICIO, 29.99 AS MARGEM_FINAL, 1 AS COMISSAO, ''B'' AS TIPO FROM REPRESENTANTE a ' +
    ' union SELECT a.ID, 30 AS MARGEM_INICIO, 34.99 AS MARGEM_FINAL, CASE WHEN A.FUNCIONARIO = ''S'' THEN 2 ELSE 4 END AS COMISSAO, ''B'' AS TIPO FROM REPRESENTANTE a ' +
    ' union SELECT a.ID, 35 AS MARGEM_INICIO, 39.99 AS MARGEM_FINAL, CASE WHEN A.FUNCIONARIO = ''S'' THEN 2.25 ELSE 4.5 END AS COMISSAO, ''B'' AS TIPO FROM REPRESENTANTE a ' +
    ' union SELECT a.ID, 40 AS MARGEM_INICIO, 49.99 AS MARGEM_FINAL, CASE WHEN A.FUNCIONARIO = ''S'' THEN 2.5 ELSE 5 END AS COMISSAO, ''B'' AS TIPO FROM REPRESENTANTE a ' +
    ' union SELECT a.ID, 50 AS MARGEM_INICIO, 59.99 AS MARGEM_FINAL, CASE WHEN A.FUNCIONARIO = ''S'' THEN 2.75 ELSE 5.25 END AS COMISSAO, ''B'' AS TIPO FROM REPRESENTANTE a ' +
    ' union SELECT a.ID, 60 AS MARGEM_INICIO, 69.99 AS MARGEM_FINAL, CASE WHEN A.FUNCIONARIO = ''S'' THEN 3 ELSE 5.5 END AS COMISSAO, ''B'' AS TIPO FROM REPRESENTANTE a ' +
    ' union SELECT a.ID, 70 AS MARGEM_INICIO, 79.99 AS MARGEM_FINAL, CASE WHEN A.FUNCIONARIO = ''S'' THEN 3.25 ELSE 5.75 END AS COMISSAO, ''B'' AS TIPO FROM REPRESENTANTE a ' +
    ' union SELECT a.ID, 80 AS MARGEM_INICIO, 99.99 AS MARGEM_FINAL, CASE WHEN A.FUNCIONARIO = ''S'' THEN 3.5 ELSE 6 END AS COMISSAO, ''B'' AS TIPO FROM REPRESENTANTE a ' +
    ' union SELECT a.ID, 100 AS MARGEM_INICIO, 999.99 AS MARGEM_FINAL, CASE WHEN A.FUNCIONARIO = ''S'' THEN 4 ELSE 6.5 END AS COMISSAO, ''B'' AS TIPO FROM REPRESENTANTE a  ');
  dao.Q1.First;
  while not (dao.q1.eof) do
  begin
    Write(txt, ajustastr('35', 2));

    if dao.Q1.fieldbyname('ID').AsString <> '' then
      Write(txt, ajustastr(FMFUN.enchezero(dao.Q1.fieldbyname('ID').AsString,
        3), 3))
    else
      Write(txt, ajustastr('', 3));

    if dao.Q1.fieldbyname('MARGEM_INICIO').AsString <> '' then
      Write(txt, ajustastr(FMFUN.enchevazio(FormatFloat('0.000',
        dao.Q1.fieldbyname('MARGEM_INICIO').AsFloat), 6), 6))
    else
      Write(txt, ajustastr('', 6));

    if dao.Q1.fieldbyname('MARGEM_FINAL').AsString <> '' then
      Write(txt, ajustastr(FMFUN.enchevazio(FormatFloat('0.000',
        dao.Q1.fieldbyname('MARGEM_FINAL').AsFloat), 6), 6))
    else
      Write(txt, ajustastr('', 6));

    if dao.Q1.fieldbyname('COMISSAO').AsString <> '' then
      Write(txt, ajustastr(FMFUN.enchevazio(FormatFloat('0.000',
        dao.Q1.fieldbyname('COMISSAO').AsFloat), 6), 6))
    else
      Write(txt, ajustastr('', 6));

    if dao.Q1.fieldbyname('TIPO').AsString <> '' then
      Write(txt, ajustastr(dao.Q1.fieldbyname('TIPO').AsString, 1))
    else
      Write(txt, ajustastr('', 1));

    WriteLn(txt);
    dao.Q1.Next;
    mqtd_registros := mqtd_registros + 1;
  end;

  //FORMA DE PAGTO
  dao.Geral1('select cod_fop, nom_fop, nivel from fop');
  dao.Q1.First;
  while not (dao.q1.eof) do
  begin
    Write(txt, ajustastr('41', 2));
    Write(txt, ajustastr('***', 3));
    Write(txt,
      ajustastr(FMFUN.enchevazio(dao.Q1.fieldbyname('cod_fop').AsString, 3),
      3));
    Write(txt,
      ajustastr(FMFUN.AnsiToAscii(dao.Q1.fieldbyname('nom_fop').AsString), 35));
    Write(txt, ajustastr('', 8));
    Write(txt, ajustastr(dao.Q1.fieldbyname('nivel').AsString, 2));
    WriteLn(txt);
    dao.Q1.Next;
    mqtd_registros := mqtd_registros + 1;
  end;

  //PRAZO
  dao.Geral1('select * from prazo');
  dao.Q1.First;
  while not (dao.q1.eof) do
  begin
    Write(txt, ajustastr('42', 2));
    Write(txt, ajustastr('***', 3));
    Write(txt, ajustastr(FMFUN.enchevazio(dao.Q1.fieldbyname('id').AsString, 3),
      3));
    Write(txt, ajustastr(dao.Q1.fieldbyname('prazo').AsString, 19));
    WriteLn(txt);
    dao.Q1.Next;
    mqtd_registros := mqtd_registros + 1;
  end;

  //GRUPO
  dao.Geral1('select cod_grupo, nom_grupo from grupo');
  dao.Q1.First;
  while not (dao.q1.eof) do
  begin
    Write(txt, ajustastr('44', 2));
    Write(txt, ajustastr('***', 3));
    Write(txt,
      ajustastr(FMFUN.enchevazio(dao.Q1.fieldbyname('cod_grupo').AsString, 3),
      3));
    Write(txt,
      ajustastr(FMFUN.AnsiToAscii(dao.Q1.fieldbyname('nom_grupo').AsString),
      35));
    WriteLn(txt);
    dao.Q1.Next;
    mqtd_registros := mqtd_registros + 1;
  end;

  //VENDAS 52
  dao.Geral1('SELECT a.COD_REPRESENTANTE, a.NUMDOC, a.DTA_EMISSAO, a.COD_CLIENTE, a.TOT_BRUTO FROM VENDAS1 a WHERE a.FATURADO = 1 and a.DTA_EMISSAO >= (current_date - 45) order by a.COD_REPRESENTANTE, a.DTA_EMISSAO, a.NUMDOC');
  dao.Q1.First;

  while not (dao.q1.eof) do
  begin
    Write(txt, ajustastr('52', 2));

    if dao.Q1.fieldbyname('cod_representante').AsString <> '' then
      Write(txt,
        ajustastr(FMFUN.enchezero(dao.Q1.fieldbyname('cod_representante').AsString, 3), 3))
    else
      Write(txt, ajustastr('', 3));

    if dao.Q1.fieldbyname('numdoc').AsString <> '' then
      Write(txt, ajustastr(dao.Q1.fieldbyname('numdoc').AsString, 25))
    else
      Write(txt, ajustastr('', 25));

    if dao.Q1.fieldbyname('DTA_EMISSAO').AsDateTime <> 0 then
      Write(txt, ajustastr(FormatDateTime('dd/mm/yyyy',
        dao.Q1.fieldbyname('DTA_EMISSAO').AsDateTime), 10))
    else
      Write(txt, ajustastr('', 10));

    if dao.Q1.fieldbyname('COD_CLIENTE').AsString <> '' then
      Write(txt,
        ajustastr(FMFUN.enchevazio(dao.Q1.fieldbyname('COD_CLIENTE').AsString,
        6),
        6))
    else
      Write(txt, ajustastr(dao.Q1.fieldbyname('COD_CLIENTE').AsString, 6));

    if dao.Q1.fieldbyname('TOT_BRUTO').AsString <> '' then
      Write(txt,
        ajustastr(FMFUN.enchevazio(dao.Q1.fieldbyname('TOT_BRUTO').AsString,
        12),
        12))
    else
      Write(txt, ajustastr('', 12));

    WriteLn(txt);
    dao.Q1.Next;
    mqtd_registros := mqtd_registros + 1;
  end;

  //RODAPE
  mqtd_registros := mqtd_registros + 1;
  Write(txt, ajustastr('99', 2));
  Write(txt, ajustastr('000', 3));
  Write(txt, ajustastr(inttostr(mqtd_registros), 6));
  Write(txt, ajustastr('###EOF###', 7));
  WriteLn(txt);

  CloseFile(txt);

  dao.msg('Arquivo enviado com sucesso!');

end;

function TFr_vendas_industria2.AjustaStr(str: string; tam: Integer): string;
begin
  while Length(str) < tam do
    str := str + ' ';

  if Length(str) > tam then
    str := Copy(str, 1, tam);

  Result := str;
end;

procedure TFr_vendas_industria2.EnviarDadosparaDispositivo1Click(
  Sender: TObject);
begin
  MontaArquivoEnvio('palm1.txt');
end;

function TFr_vendas_industria2.VerificaFaturaVencida(
  cod_cliente: string): Boolean;
var
  i: integer;
begin
  dao.Geral1('select cliente_bloqueado from cliente where cod_cliente=' +
    QuotedStr(cod_cliente));
  if dao.Q1.FieldByName('cliente_bloqueado').AsString = 'S' then
  begin
    dao.msg('<ATENÇÂO> Cliente Bloqueado <ATENÇÃO>');
    sbvendas.Panels[2].Text := 'CLIENTE BLOQUEADO!';
    pc_vendas.TabIndex := 0;
    {  if prcod_cliente.Enabled then
        Prcod_cliente.SetFocus;
      exit;}
  end;

  cliente_com_pendencia := FMFUN.VerificaFaturaVencida(Prcod_cliente.Text,
    true);

  Result := cliente_com_pendencia;

  if cliente_com_pendencia then
    sbvendas.Panels[2].Text := 'CLIENTE COM PENDENCIAS FINANCEIRA!'
  else
    sbvendas.Panels[2].Text := 'CLIENTE LIBERADO!!';
end;

procedure TFr_vendas_industria2.DesfaturarPedido1Click(Sender: TObject);
begin
  if (PrNumDoc.Text <> '') and (btnov.Enabled = true) then
    dao.Geral2('select faturado, chave_nfe from vendas1 where numdoc=' +
      QuotedStr(PrNumDoc.Text))
  else
    exit;

  if dao.Q2.FieldByName('CHAVE_NFE').IsNotNull then
  begin
    dao.msg('Não é permitido desfaturar Nota Fiscal Eletrônica!');
    exit;
  end;

  if dao.Q2.FieldByName('faturado').AsString = '0' then
  begin
    dao.msg('Venda não Faturada!');
    exit;
  end;

  if messagedlg('Deseja Desfaturar essa Venda?', mtConfirmation, [mbYes, mbNo],
    0) = mryes then
  begin
    Application.CreateForm(TFr_senha_especial, Fr_senha_especial);
    Fr_senha_especial.nivel := '2';
    Fr_senha_especial.ShowModal;
    if liberado then
    begin
      Application.CreateForm(TFmMotivo, FmMotivo);
      FmMotivo.ShowModal;
      if FmMotivo.modalresult = mrOk then
        cancelar_faturamento(Fr_senha_especial.codusu, fmmotivo.mmMotivo.text);
      FmMotivo.free;
    end;
    Fr_senha_especial.free;
  end;

  q_vendas1.Open;
  if q_vendas1.Active then
  begin
    if q_vendas1.FieldByName('faturado').AsString = '1' then
      SbVendas.Panels[1].Text := '-FATURADO-VENDAS'
    else if q_vendas1.FieldByName('faturado').AsString = '2' then
      SbVendas.Panels[1].Text := '-CANCELADA-'
    else if q_vendas1.FieldByName('faturado').AsString = '3' then
      SbVendas.Panels[1].Text :=
        '-FATURADO-DEVOLUÇÕES, REMESSAS E BONIFICAÇÕES-'
    else if dao.Q1.FieldByName('faturado').AsString = '4' then
      SbVendas.Panels[1].Text := '-DESATIVADO-'
    else if dao.Q1.FieldByName('faturado').AsString = '5' then
      SbVendas.Panels[1].Text := '-NFE DENEGADA-'
    else
      SbVendas.Panels[1].Text := '-NÃO FATURADO-';

    if q_vendas1.FieldByName('NUMDOC_GRUPO').IsNotNull then
    begin
      SbVendas.Panels[1].Text := '-AGRUPADO AO PEDIDO Nº.: ' +
        q_vendas1.FieldByName('NUMDOC_GRUPO').AsString;
      TaAgrupar.TabVisible := false;
      Btaltped.Enabled := false;
      Btexcped.Enabled := false;
    end;

  end;

end;

function TFr_vendas_industria2.LimparBoletos: boolean;
begin
  Result := true;
  dao.Geral5('select * from cr1 where  BOLETO_REMESSA_ORDEM is not null and nr_documento=' + Prnumdoc.Text);
  if dao.Q5.RecordCount = 0 then
  begin

    if Pedido_AVista then
    begin
      ativa_cr1(Prnumdoc.Text);
      q_cr1.First;
      while not q_cr1.Eof do
      begin
        fmfun.ExcluirExtratoConta(q_cr1.fieldbyname('id').AsString, 'C',
          q_cr1.fieldbyname('valor_recebido').AsFloat);
        q_cr1.Next;
      end;
    end;

    try
      if not (dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      dao.Execsql('delete from cr1 where nr_documento=' + Prnumdoc.Text);
      dao.cn.commit;
    except
      dao.cn.Rollback;
    end;
  end
  else
  begin
    //  showmessage('Conta à Receber não poder ser excluído por estar relacionado à uma Remessa!');
    Result := false;
    exit;
  end;

end;

procedure TFr_vendas_industria2.cancelar_faturamento(usuario_desfaturou, motivo:
  string);
var
  pontos: string;
begin
  LimparBoletos;
  try
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    dao.Execsql('update vendas1 set faturado=' + QuotedStr('0') +
      ', usuario_desfaturou=' + QuotedStr(usuario_desfaturou) +
      ' where numdoc = '
      +
      Prnumdoc.Text);
    dao.grava_log('DESFATURAMENTO PEDIDO N°:' + Prnumdoc.Text + '. MOTIVO: ' +
      UPPERCASE(motivo), '');
    dao.cn.commit;
  except
    dao.cn.Rollback;
  end;

  q_vendas2.First;
  try
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    while not (q_vendas2.Eof) do
    begin
      Fmfun.atualiza_estoque_geral(q_vendas2.fieldbyname('cod_produto').AsString);
      q_vendas2.Next;
    end;
    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;

  ativa_cr1(Prnumdoc.Text);
  ativa_vendas1(Prnumdoc.Text);
end;

procedure TFr_vendas_industria2.cancelamento_avulso;
var
  pontos: string;
begin
  LimparBoletos;
  try
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    dao.Execsql('update vendas1 set faturado=' + QuotedStr('2') +
      ' where numdoc = ' + Prnumdoc.Text);
    dao.cn.commit;
  except
    dao.cn.Rollback;
  end;

  q_vendas2.First;
  try
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    while not (q_vendas2.Eof) do
    begin
      Fmfun.atualiza_estoque_geral(q_vendas2.fieldbyname('cod_produto').AsString);
      q_vendas2.Next;
    end;
    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;

  ativa_cr1(Prnumdoc.Text);
  ativa_vendas1(Prnumdoc.Text);
end;

procedure TFr_vendas_industria2.Prtot_liquidoChange(Sender: TObject);
begin

  if Prtot_bruto.Value > 0 then
  begin
    Prdesconto.Value := 100 - ((Prtot_liquido.Value / (Prtot_bruto.Value) *
      100));
  end;

end;

procedure TFr_vendas_industria2.MeprecoChange(Sender: TObject);
begin
  {//100-((FMFUN.Str_to_float(sgx.Cells[5,lin],0)/ FMFUN.Str_to_float(sgx.Cells[9,lin],0))*100))}
  {  if (mmVendas2PRECO_VENDA.value > 0) then
      mmVendas2DESCONTO.Value := 100 - ((mmVendas2PRECO_LIQUIDO.Value / (mmVendas2PRECO_VENDA.value) * 100));}
end;

procedure TFr_vendas_industria2.Crcod_fopKeyPress(Sender: TObject;
  var Key: Char);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  if not (key in ['0'..'9', #8]) and (key <> #13) then
  begin
    beep; {somente delphi 2.0 ou >}
    key := #0;
  end;

  if key = #13 then
  begin
    if (Prcod_fop.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Forma de Pagamento';
      chamou_pesquisa := 'fr_fop';
      chamou_form := 'fr_pedido_cr1_fop';
      chamou_cadastro := 'fr_fop';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Fop';
      Fr_localizar.BT_cadastro.Visible := true;

      SetLength(Campos_combo, 2);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Nome';

      for i := 0 to 1 do
      begin
        valor_combo := campos_combo[i];
        Fr_localizar.CBcampos.Items.Add(campos_combo[i]);
      end;
      Fr_localizar.CBcampos.ItemIndex := 1;

      Fr_localizar.ShowModal;
      Fr_localizar.Free;

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;
    end;

    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;

end;

procedure TFr_vendas_industria2.Crcod_fopButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  //guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Forma de Pagamento';
  chamou_pesquisa := 'fr_fop';
  chamou_form := 'fr_pedido_cr1_fop';
  chamou_cadastro := 'fr_fop';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Fop';
  Fr_localizar.BT_cadastro.Visible := true;

  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';

  for i := 0 to 1 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(campos_combo[i]);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_vendas_industria2.Crcod_fopExit(Sender: TObject);
begin
  if trim(Crcod_fop.Text) = '' then
    Lbforma_pgto.Caption := '...';

  if Crcod_fop.Text <> '' then
  begin

    if (not FMFUN.verificaNumerico(Crcod_fop.Text)) and
      (length(Crcod_fop.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      Crcod_fop.SetFocus;
      exit;
    end;

    dao.Geral2('select nom_fop from fop where cod_fop=' +
      QuotedStr(Prcod_fop.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbforma_pgto.Caption := dao.Q2.fieldbyname('nom_fop').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Crcod_fop.Text := '';
      Crcod_fop.SetFocus;
      Exit;
    end;
  end;

end;

procedure TFr_vendas_industria2.MontaEtiquetaTransp(numdoc: string; coluna:
  integer);
var
  f: TextFile;
  i, ini_etiquetas, total_etiquetas: integer;
  imp_primeira: boolean;
  qtd: string;
begin
  Application.CreateForm(Tfr_escolhe_impressora_termica,
    fr_escolhe_impressora_termica);
  fr_escolhe_impressora_termica.ShowModal;
  if fr_escolhe_impressora_termica.ModalResult = mrok then
    caminho_imp_cod_barras := fr_escolhe_impressora_termica.impressora_termica
  else
    exit;

  dao.Geral1('select v.numdoc, v.volume_nota, v.nfe, t.nome, t.placa,' +
    'case when c.nom_cidade is not null then c.NOM_CIDADE else cf.NOM_CIDADE end as nom_cidade, ' +
    'case when c.uf is not null then c.uf else cf.UF end as uf, ' +
    'case when cl.nom_cliente is not null then cl.NOM_CLIENTE else f.RAZAO_SOCIAL end as nom_cliente ' +
    'from vendas1 v ' +
    'left join transportadora t on t.cod_transportadora = v.cod_transportadora ' +
    'left join cliente cl on cl.cod_cliente = v.cod_cliente ' +
    'left join FORNECEDOR f on f.COD_FORNECEDOR = v.COD_FORNECEDOR ' +
    'left join cidades cf on cf.cod_cidade = f.cod_cidade ' +
    'left join cidades c on c.cod_cidade = cl.cod_cidade ' +
    'where numdoc = ' + QuotedStr(numdoc));

  Application.CreateForm(Tfm_definir_saldo_inicial, fm_definir_saldo_inicial);
  fm_definir_saldo_inicial.Caption := 'Etiquetas.';
  fm_definir_saldo_inicial.gbDefinirSaldo.Caption := 'De';
  fm_definir_saldo_inicial.gbPeso.Caption := 'Até';

  fm_definir_saldo_inicial.btgra.Caption := 'OK';
  fm_definir_saldo_inicial.edSaldo.value := 1;
  fm_definir_saldo_inicial.edPeso.value :=
    dao.q1.fieldbyname('volume_nota').AsInteger;
  fm_definir_saldo_inicial.edSaldo.DisplayFormat := '0';
  fm_definir_saldo_inicial.edPeso.DisplayFormat := '0';
  fm_definir_saldo_inicial.ShowModal;
  if fm_definir_saldo_inicial.ModalResult <> mrok then
    exit;

  ini_etiquetas := fm_definir_saldo_inicial.edSaldo.AsInteger;
  total_etiquetas := fm_definir_saldo_inicial.edPeso.AsInteger;

  for i := ini_etiquetas to total_etiquetas do
  begin
    AssignFile(F, caminho_imp_cod_barras);
    Rewrite(F);
    //    Writeln(F,' ');
    Writeln(F, ' ');
    Writeln(F, 'O');
    Writeln(F, 'OD');
    Writeln(F, 'N');
    Writeln(F, 'D7');
    Writeln(F, 'S2');
    Writeln(F, 'ZT');
    Writeln(F, 'Q560,24');
    Writeln(F, 'q784');

    Writeln(F, 'A35,30,0,4,1,1,R,"Transportadora:"');
    Writeln(F, 'A35,58,0,4,1,1,N,"' + dao.q1.fieldbyname('nome').AsString + ' - '
      + dao.q1.fieldbyname('placa').AsString + '"');

    Writeln(F, 'A450,80,0,4,1,1,R,"Volume:"');
    Writeln(F, 'A450,130,0,3,3,2,N,"' + inttostr(i) + '/' +
      inttostr(total_etiquetas) + '"');

    Writeln(F, 'A35,90,0,4,1,1,R,"Numero Nota:"');
    Writeln(F, 'A35,125,0,4,1,1,N,"' + dao.q1.fieldbyname('nfe').AsString +
      '"');

    Writeln(F, 'A35,160,0,4,1,1,R,"Cidade:"');
    Writeln(F, 'A35,190,0,4,1,1,N,"' + dao.q1.fieldbyname('nom_cidade').AsString
      + '- ' + dao.q1.fieldbyname('uf').AsString + '"');

    Writeln(F, 'A35,230,0,4,1,1,R,"Cliente:"');
    Writeln(F, 'A35,260,0,4,1,1,N,"' + dao.q1.fieldbyname('nom_cliente').AsString
      + '"');

    Writeln(F, 'A325,300,0,3,3,2,N,"PLASFAN"');
    Writeln(F, 'A625,301,0,2,1,2,N,"(47)3346-2052"');
    Writeln(F, 'A325,340,0,4,1,1,R,"www.plasfan.ind.br"');

    Writeln(F, 'P1');

    //Sleep(1000);
    CloseFile(F);
  end;
end;

procedure TFr_vendas_industria2.ImprimirEtiquetadeTransporte1Click(
  Sender: TObject);
begin
  MontaEtiquetaTransp(Prnumdoc.Text, 1);
end;

procedure TFr_vendas_industria2.TrataArquivoRecebimento(
  nom_arquivo: string);
var
  txt: TextFile;
  linha: string;
  cmd: string;
  qtdlin: integer;
  numped, pathSaida: string;
begin
  try
    pathSaida := ExtractFilePath(Application.ExeName) + 'Recepcao\';
    AssignFile(txt, pathSaida + nom_arquivo);

    Reset(txt);

    while not eof(txt) do
    begin
      if trim(copy(linha, 1, 2)) <> '70' then
      begin
        cmd := 'insert into vendas1 (cod_representante, nr_pedido_palm, dtadoc, hora, cod_cliente, cod_fop, cod_prazo_pgto,'
          +
          'tot_bruto, tot_liquido, observacoes_pedido) values (' +

        QuotedStr(trim(copy(linha, 3, 3))) + ',' + //vendedor
        QuotedStr(trim(copy(linha, 6, 7))) + ',' + //nr pedido palm
        QuotedStr(trim(copy(linha, 13, 10))) + ',' + //data
        QuotedStr(trim(copy(linha, 23, 5))) + ',' + //Hora
        QuotedStr(trim(copy(linha, 28, 6))) + ',' + //cod Cliente
        QuotedStr(trim(copy(linha, 34, 3))) + ',' + //Cod forma de Pgto
        QuotedStr(trim(copy(linha, 37, 3))) + ',' + // Cod Prazo Pgto
        QuotedStr(trim(copy(linha, 40, 10))) + ',' + // Total Bruto
        QuotedStr(trim(copy(linha, 60, 10))) + ',' + // Total Liquido
        QuotedStr(trim(copy(linha, 70, 150))) + ')'; // Observacao do Pedido
        dao.Execsql(cmd);
        dao.Geral3('SELECT GEN_ID(gen_vendas1, 1) FROM RDB$DATABASE');
        numped := dao.Q3.fieldbyname('gen_id').AsString;
      end;
      if trim(copy(linha, 1, 2)) <> '72' then
      begin
        cmd := 'insert into vendas2 (cod_representante, numdoc, nr_pedido_palm, dtadoc, cod_produto, qtd, preco, sub_total  ) values ('
          +

        QuotedStr(trim(copy(linha, 3, 3))) + ',' + //vendedor
        QuotedStr(numped) + ',' + //nr pedido sistema
        QuotedStr(trim(copy(linha, 6, 7))) + ',' + //nr pedido palm
        QuotedStr(trim(copy(linha, 13, 10))) + ',' + //cod Produto
        QuotedStr(trim(copy(linha, 23, 9))) + ',' + //Qtd
        QuotedStr(trim(copy(linha, 32, 9))) + ',' + // preco unitario liquido
        QuotedStr(trim(copy(linha, 41, 9))) + ')'; // Sub-Total
      end;
      ReadLn(txt, linha);
    end;
  except
    on e: Exception do
    begin
      dao.msg('Houve um erro ao Transmitir o arquivo de atulização!' + #13 +
        e.message + #13 + cmd);
      dao.cn.Rollback;
    end;
  end;

end;

procedure TFr_vendas_industria2.ReceberDados1Click(Sender: TObject);
begin
  dao.Geral1('select id, nom_representante from representante where ativo=' +
    QuotedStr('S'));
  dao.Q1.First;
  while not dao.Q1.Eof do
  begin

  end;

end;

procedure TFr_vendas_industria2.BtexcpedClick(Sender: TObject);
var
  msg: string;
begin
  cliente_alterado := false;
  q_vendas1.open;
  if q_vendas1.FieldByName('faturado').AsString = '1' then
  begin
    dao.msg('Para Desativar um Pedido você deve Antes Desfatura-lo!');
    exit;
  end;
  if q_vendas1.FieldByName('faturado').AsString = '0' then
    msg := 'Deseja Desativar este Pedido?';
  if q_vendas1.FieldByName('faturado').AsString = '4' then
    msg := 'Deseja Reativar este Pedido?';

  if MessageDlg(msg, mtConfirmation, [mbYes, mbno], 0)
    = mryes then
  begin
    if btcan.Enabled = true then
      btcanClick(Self);

    if Prnumdoc.Text <> '' then
    begin
      try
        if not (dao.cn.InTransaction) then
          dao.cn.StartTransaction;
        if q_vendas1.FieldByName('faturado').AsString = '0' then
        begin
          dao.Execsql('update vendas1 set faturado = 4 where numdoc=' +
            QuotedStr(Prnumdoc.Text));
          btnenviarpedido.enabled := false;
        end;

        if q_vendas1.FieldByName('faturado').AsString = '4' then
        begin
          dao.Execsql('update vendas1 set faturado = 0 where numdoc=' +
            QuotedStr(Prnumdoc.Text));
          btnenviarpedido.enabled := btnenviarpedido.visible and (prnumdoc.text
            <> '');
        end;

        dao.cn.Commit;
      except
        dao.cn.Rollback;
      end;

    end;

    mmVendas2.First;
    try
      if not (dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      while not mmVendas2.Eof do
      begin
        Fmfun.atualiza_estoque_geral(mmVendas2cod_produto.AsString);
        mmVendas2.Next;
      end;
      dao.cn.Commit;
      btnnfe.Enabled := false;
      //      mmVendas2.EmptyTable;
      //      limpa_campos('Pr');
      //      limpa_campos('Me');
      StatusPedido;
    except
      dao.cn.Rollback;
    end;
    promocao_desconto := TodosPromocao;
  end;

end;

procedure TFr_vendas_industria2.btexcClick(Sender: TObject);
var
  volume: Real;
begin
  try
    produto_alterado := false;
    if (Btnovped.Enabled = true) then
    begin
      dao.msg('O Botão Novo ou Alterar Geral deve ser precionado!');
      Pc_vendas.ActivePageIndex := 0;
      BtAlt.SetFocus;
      exit;
    end;

    if MessageDlg('Tem Certeza que Deseja Excluir Este Produto da Entrada?',
      mtConfirmation, [mbyes, mbno], 0) = mryes then
    begin
      mmVendas2.Edit;
      mmVendas2.ClearFields;
      mmVendas2.Delete;
      dao.msg('Produto excluido com sucesso!');
    end;
    somaTotal;
    promocao_desconto := TodosPromocao;
    if not LiberaItemRepetido then
      ListarItensPedidos;
  except
    on e: Exception do
    begin
      dao.msg('Houve um erro ao Excluir o Produto na Venda!' + #13 +
        e.message);

      // dao.envia_email_suporte('Erro ao excluir produto '+Lbnom_produto.Caption+' da entrada: '+PrNr_documento.Text+'   - Fornecedor : '+LbNom_fornecedor.Caption  + #13 + e.Message+#13+'Data: '+dao.DtaSerStr +#13+'Usuario Logado:'+nom_usuario ,'Erro ao inserir Registro módulo Dao','claudioplasfan@gmail.com','','','');
    end;
  end;

end;

procedure TFr_vendas_industria2.DeletaLinha(Linha: Integer);
begin
end;

procedure TFr_vendas_industria2.MontaNF(n_pedido: string);
var
  MCOL, LH: integer;
  MNUMNOT: string;
  I, Y: integer;
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
  MNUMPED, MCODTRA: Integer;
  LINHA_ERRO: INTEGER;
  icms: string;
begin
  if (Prcod_cliente.Text <> '') then
    dao.Geral1(sql_nota + ' where v1.numdoc=' + QuotedStr(n_pedido) +
      sql_grupo_nota)
  else
    dao.Geral1(sql_nota_dev + ' where v1.numdoc=' + QuotedStr(n_pedido) +
      sql_grupo_nota_dev);

  dao.Geral2('select a.ID, a.NUMDOC, a.DTADOC, a.COD_PRODUTO, a.COD_CLIENTE, ' +
    'a.COD_REPRESENTANTE, a.ID_COR, a.ID_TAMANHO, a.QTD, a.QTD_DEVOLVIDA, a.DEVOLVIDO, ' +
    'a.PRECO, a.SUB_TOTAL, a.DESCONTO, a.VOLUME, a.COD_EMPRESA, a.NR_PEDIDO_PALM, a.PRECO_BRUTO, ' +
    'a.SUB_TOTAL_BRUTO, a.VLR_COMISSAO, a.TROCA, a.COD_FISCAL_ITEM, a.ICMS_ITEM, a.VLR_ICMS_ST, ' +
    'a.VLR_BC_ST, a.VLR_ICMS_ITEM, a.NCM, a.VLR_BC, a.IPI_ITEM, a.VLR_IPI_ITEM, a.VLR_AGR_ITEM, ' +
    'a.TRIB_ICMS, a.CESTA_BASICA, a.COD_SUPERVISOR, a.QTD_EMBALAGEM, a.PRECO_CUSTO, a.PERC_COMISSAO, ' +
    'a.PROMOCAO, a.DESCONTO_MAX, ' +
    'p.nom_produto, p.unidade, p.qtd_embalagem, p.trib_icms from vendas2 a ' +
    'left join produto p on p.cod_produto = a.cod_produto ' +
    'where numdoc= ' + QuotedStr(n_pedido));

  dao.Geral3('select a.ID, a.COD_CLIENTE, a.NR_DOCUMENTO, a.TITULO, a.SEQUENCIA, a.COD_EMPRESA, ' +
    'a.DTAVEN, a.VALOR, a.COD_FOP, a.HISTORICO1, a.DTAREC, a.VALOR_RECEBIDO, a.SALDO, a.DIAS_ATRASO, ' +
    'a.VLR_CORRIGIDO, a.DESCONTO, a.NR_CUPOM, a.CONFERIDO, a.ID_REPRESENTANTE, a.VLR_COMISSAO, ' +
    'a.ID_PLANO_CONTAS, a.SINCRONIZAR_PALM, a.EXTRATO, a.VALOR_CORRIGIDO, a.BOLETO_REMESSA_ORDEM, a.BOLETO_RETORNO_CODIGO, a.BOLETO_RETORNO_DESCRICAO ' +
    'from cr1 a where nr_documento=' + QuotedStr(n_pedido));

  dao.Geral4('select icms from uf WHERE UF=' +
    QuotedStr(dao.Q1.fieldbyname('uf').AsString));
  if dao.Q4.RecordCount > 0 then
    icms := dao.Q4.fieldbyname('ICMS').AsString;

  LINHA_ERRO := 1;
  if PrNF.Text = '' then
  begin
    showmessage('<ATENÇÃO> O NUMERO DA NOTA NÃO ESTÁ PREENCHIDO!<ATENÇÃO>');
    PrNF.SetFocus;
    exit;
  end;

  dao.Geral4('select faturado from vendas1 where numdoc = ' +
    QuotedStr(n_pedido));
  if dao.Q4.FieldByName('faturado').AsString = 'F' then
  begin
    showmessage('O PEDIDO JÁ FOI FATURADO');
    exit;
  end;

  MNUMPED := dao.Q1.fieldbyname('numdoc').AsInteger;
  MCODTRA := dao.q1.fieldbyname('cod_transportadora').AsInteger;

  MDIVCOM := 0;
  MNUMNOT := dao.Q1.fieldbyname('nf').AsString;

  //   **** começa a gerar o contas a pagar   ********

  LINHA_ERRO := LINHA_ERRO + 1;

  MQTDPRO := dao.Q2.RecordCount;
  //showmessage(floattostr(mqtdpro));
  MQTDNOT := MQTDPRO / 22;
  if MQTDNOT <= 1 then
    MCTNOT := 1
  else
    MCTNOT := 2;

  // ***** IMPRESSÃO DA NOTA  ********

  RDIMPNOT.Abrir;

  //*****************CORPO DA NOTA****************************
  for i := 1 to MCTNOT do
  begin
    if i = 2 then
      RDIMPNOT.Novapagina;

    if i = 1 then
      dao.q2.First;
    lh := 35;
    while not (dao.Q2.eof) do
    begin
      if i = 2 then
      begin
        for Y := 1 to 22 do
          if dao.Q2.Eof then
            break;
        RDIMPNOT.impf(lh, 01, dao.Q2.Fieldbyname('cod_produto').AsString,
          [comp17]);
        RDIMPNOT.impf(lh, 09, dao.Q2.Fieldbyname('nom_produto').AsString,
          [comp17]);
        if dao.Q2.Fieldbyname('trib_icms').AsString = '0' then
          RDIMPNOT.impf(lh, 50, '00', [comp17])
        else if dao.Q2.Fieldbyname('trib_icms').AsString = '1' then
          RDIMPNOT.impf(lh, 50, '10', [comp17])
        else if dao.Q2.Fieldbyname('trib_icms').AsString = '2' then
          RDIMPNOT.impf(lh, 50, '20', [comp17])
        else if dao.Q2.Fieldbyname('trib_icms').AsString = '3' then
          RDIMPNOT.impf(lh, 50, '30', [comp17])
        else if dao.Q2.Fieldbyname('trib_icms').AsString = '4' then
          RDIMPNOT.impf(lh, 50, '40', [comp17])
        else if dao.Q2.Fieldbyname('trib_icms').AsString = '5' then
          RDIMPNOT.impf(lh, 50, '41', [comp17])
        else if dao.Q2.Fieldbyname('trib_icms').AsString = '6' then
          RDIMPNOT.impf(lh, 50, '50', [comp17])
        else if dao.Q2.Fieldbyname('trib_icms').AsString = '7' then
          RDIMPNOT.impf(lh, 50, '51', [comp17])
        else if dao.Q2.Fieldbyname('trib_icms').AsString = '8' then
          RDIMPNOT.impf(lh, 50, '60', [comp17])
        else if dao.Q2.Fieldbyname('trib_icms').AsString = '9' then
          RDIMPNOT.impf(lh, 50, '70', [comp17])
        else if dao.Q2.Fieldbyname('trib_icms').AsString = '10' then
          RDIMPNOT.impf(lh, 50, '90', [comp17]);

        RDIMPNOT.impf(lh, 65, dao.Q2.Fieldbyname('unidade').AsString, [comp17]);
        //+DMVEN.QUNOTPED2.Fieldbyname('divvol').AsString,[comp17])
      //          else
     //             RDIMPNOT.impf(lh,65,dao.Q2.Fieldbyname('unidade').AsString,[comp17]);

        RDIMPNOT.impd(lh, 68, dao.Q2.Fieldbyname('qtd').AsString, [comp17]);
        RDIMPNOT.impval(lh, 70, '###,##0.0000',
          dao.Q2.Fieldbyname('preco').AsFloat, [comp17]);
        RDIMPNOT.impVAL(lh, 94, '###,##0.00',
          dao.Q2.Fieldbyname('sub_total').AsFloat, [comp17]);
        //26/09/07            if DMVEN.QUNOTPED1.Fieldbyname('PERICM').AsFloat<> null then
        if dao.Q2.Fieldbyname('trib_icms').AsString <> '8' then
          RDIMPNOT.impVAL(lh, 108, '###,##0.00', StrToFloat(icms), [comp17]);

        lh := lh + 1;
        dao.Q2.Next;
      end;
      RDIMPNOT.impf(lh, 01, dao.Q2.Fieldbyname('cod_produto').AsString,
        [comp17]);
      RDIMPNOT.impf(lh, 10, dao.Q2.Fieldbyname('nom_produto').AsString,
        [comp17]);

      //        if (DMVEN.QUNOTPED2.Fieldbyname('NOMMEDIDA').AsString<>null) and (DMVEN.QUNOTPED2.Fieldbyname('divvol').value<>null)then
      RDIMPNOT.impf(lh, 67, dao.Q2.Fieldbyname('unidade').AsString, [comp17]);
      //+DMVEN.QUNOTPED2.Fieldbyname('divvol').AsString,[comp17])
    //        else
    //        RDIMPNOT.impf(lh,64,DMVEN.QUNOTPED2.Fieldbyname('NOMMEDIDA').AsString,[comp17]);
      RDIMPNOT.impd(lh, 80, dao.Q2.Fieldbyname('QTD').AsString, [comp17]);
      RDIMPNOT.impval(lh, 81, '###,##0.0000',
        dao.Q2.Fieldbyname('preco').AsFloat, [comp17]);
      RDIMPNOT.impVAL(lh, 94, '###,##0.00',
        dao.Q2.Fieldbyname('sub_total').AsFloat, [comp17]);
      //26/06/07        if DMVEN.QUNOTPED1.Fieldbyname('PERICM').AsFloat<> null then

      if dao.Q2.Fieldbyname('trib_icms').AsString <> '8' then
        RDIMPNOT.impVAL(lh, 116, '#0', StrToFloat(icms), [comp17]);

      RDIMPNOT.impVAL(lh, 119, '#0', dao.Q2.Fieldbyname('ipi_item').AsFloat,
        [comp17]);
      RDIMPNOT.impVAL(lh, 122, '###,##0.00',
        dao.Q2.Fieldbyname('vlr_ipi_item').AsFloat, [comp17]);

      lh := lh + 1;
      if dao.q2.eof then
        break;
      dao.Q2.Next;

      if lh = 57 then
        break; // ERA 82

    end;

  end;
  //if (MCTNOT=2) and (i=1) then continue;

 //**********************CÁLCULO DO IMPOSTO ***********************
 //BASE CÁLCULO ICMS
//  if DMVEN.QUNOTPED1.Fieldbyname('BASEICM').AsFloat <> null then

  if (dao.Q1.Fieldbyname('VLR_BC_ICMS').value > 0) then
    RDIMPNOT.impval(61, 01, '###,##0.00',
      dao.Q1.Fieldbyname('VLR_BC_ICMS').AsFloat, [comp17]);
  //VLR DO ICMS
//     if DMVEN.QUNOTPED1.Fieldbyname('VLRICM').AsFloat<> null then
  if (dao.Q1.Fieldbyname('VLR_ICMS').value > 0) then
    RDIMPNOT.impval(61, 24, '###,##0.00', dao.Q1.Fieldbyname('VLR_ICMS').AsFloat
      * (StrToFloat(icms) / 100), [comp17]); //VALOR TOTAL DOS PRODUTOS

  {     //BASE CÁLCULO ICMS SUBST.
    if (not dao.Q1.Fieldbyname('VLR_ICMS_ST').IsNull and dao.Q1.Fieldbyname('VLR_ICMS_ST').value > 0) then
      RDIMPNOT.impval(61, 60, '###,##0.00', dao.Q1.Fieldbyname('VLR_BC_ST').AsFloat, [comp17]);

       //VLR ICMS SUBST.
    if (not dao.Q1.Fieldbyname('VLR_ICMS_ST').IsNull and dao.Q1.Fieldbyname('VLR_ICMS_ST').value > 0) then
      RDIMPNOT.impval(61, 80, '###,##0.00', dao.Q1.Fieldbyname('VLR_ICMS_ST').AsFloat, [comp17]);
   }

  RDIMPNOT.impval(61, 119, '###,##0.00',
    dao.Q1.Fieldbyname('tot_liquido').AsFloat, [comp17]);
  //VALOR TOTAL DA NOTA

  //VLR ICMS SUBST.
  if (not dao.Q1.Fieldbyname('VLR_IPI').IsNull and
    dao.Q1.Fieldbyname('VLR_IPI').value > 0) then
    RDIMPNOT.impval(64, 80, '###,##0.00', dao.Q1.Fieldbyname('VLR_IPI').AsFloat,
      [comp17]);

  RDIMPNOT.impval(64, 119, '###,##0.00',
    (dao.Q1.Fieldbyname('tot_liquido').AsFloat +
    dao.Q1.Fieldbyname('VLR_IPI').AsFloat), [comp17]);

  //****************TRANSPORTADORA*******************************
  //NOME /RAZÃO SOCIAL
  RDIMPNOT.impf(69, 01, dao.Q1.Fieldbyname('nom_transportadora').AsString,
    [comp17]);

  //frete por conta
  RDIMPNOT.impf(69, 78, dao.Q1.Fieldbyname('tipo_frete').Value, [comp17]);

  //placa do veiculo
  RDIMPNOT.impf(69, 82, dao.Q1.Fieldbyname('placa').AsString, [comp17]);

  //uf
  RDIMPNOT.impF(69, 100, dao.Q1.fieldbyname('uf_transportadora').AsString,
    [comp17]);

  //cnpj transportadora
  RDIMPNOT.impf(69, 115, dao.Q1.fieldbyname('cnpj_tra').AsString, [comp17]);

  //endereço
  RDIMPNOT.impf(71, 01, dao.q1.fieldbyname('end_tra').AsString, [comp17]);

  //municipio
 // DMVEN.TACID.FindKey([DMVEN.TAPE1CIDCLI.VALUE]);
   // RDIMPNOT.impf(73,67,DMVEN.QUNOTPED1.Fieldbyname('NOMCID1'.VALUE,[comp17]);

  //UF MUNICIPIO
 // RDIMPNOT.impf(73,100,DMVEN.QUNOTPED1 UFCID.VALUE,[comp17]);

 //INSCRIÇÃO ESTADUAL
  RDIMPNOT.impf(71, 115, dao.q1.Fieldbyname('ie_tra').AsString, [comp17]);

  // VOLUME DO PEDIDO
  RDIMPNOT.impVAL(74, 01, '#0', dao.q1.Fieldbyname('volume_nota').AsFloat,
    [comp17]);

  //ESPÉCIE
  RDIMPNOT.impf(74, 26, 'VOLUMES', [comp17]);

  //MARCA
  RDIMPNOT.impf(74, 50, 'X', [comp17]);

  //PESO BRUTO
  RDIMPNOT.impVAL(74, 95, '###,##0.000',
    dao.q1.Fieldbyname('peso_nota').AsFloat,
    [comp17]);

  //PESO LIQUIDO
  RDIMPNOT.impVAL(74, 118, '###,##0.000',
    dao.q1.Fieldbyname('peso_nota').AsFloat, [comp17]);

  //********INFORMAÇÕES ADICIONAIS*************************
  if Prboleto_anexo.Checked = true then
    RDIMPNOT.impf(75, 01, 'BOLETO ANEXO.', [comp17]);

  if dao.q1.Fieldbyname('observacoes_nota').AsString <> '' then
    RDIMPNOT.impF(82, 01, dao.q1.Fieldbyname('observacoes_nota').AsString,
      [comp17]);
  //mensagem
//     RDIMPNOT.impF(77,01,'DOCUMENTO EMITIDO POR EPP OPTANTE PELO SIMPLES NACIONAL E NÃO ',[comp17]);
//     RDIMPNOT.impF(78,01,'GERA DIREITO A CRÉDITO FICSCAL DE ICMS E ISS',[comp17]);
{  RDIMPNOT.impF(79, 01, '-Nao aceitamos devolucao sem previa Consulta ao Nosso Dep.Vendas-', [comp17]);
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
  LINHA_ERRO := LINHA_ERRO + 1; //3

  //*************RODAPÉ DA NOTA****************************

  //NOME CLIENTE
  RDIMPNOT.impF(86, 01, dao.q1.Fieldbyname('nom_cliente').AsString, [comp17]);

  //VALOR TOTAL DA NOTA
  RDIMPNOT.impval(86, 52, '###,##0.00',
    dao.q1.Fieldbyname('tot_liquido').AsFloat, [comp17]);

  //NOME /RAZÃO SOCIAL
  RDIMPNOT.impf(86, 70, dao.q1.Fieldbyname('nom_transportadora').AsString,
    [comp17]);

  //DTA SAIDA
  RDIMPNOT.impf(86, 100, datetostr(dao.q1.Fieldbyname('dta_saida').AsDateTime),
    [comp17]);
  RDIMPNOT.Fechar;
  //****** acabou a impressão da nota *******

end;

procedure TFr_vendas_industria2.RDIMPNOTNewPage(Sender: TObject;
  Pagina: Integer);
var
  mcol, maccr1, mtotcr1: integer;
  mcodope: string;
begin
  //SAIDA DA NOTA
  RDIMPNOT.impC(05, 79, 'X', [comp17]);
  //natureza da operação
{   if DMVEN.QUPED1.FieldByName('NATOPE').AsString = '5.915' then
   begin
     RDIMPNOT.impC(11,01,'REMESSA PARA CONCERTO',[comp17]);
   end
   else}
  RDIMPNOT.impC(11, 01, dao.q1.fieldbyname('nom_cfop').AsString, [comp17]);
  //NATUREZA OPERAÇÃO
  MCODOPE := dao.q1.FieldByName('cod_fiscal').AsString;

  RDIMPNOT.impF(11, 39, mcodope, [comp17]);
  //NOME CLIENTE
  RDIMPNOT.impF(15, 01, dao.Q1.fieldbyname('nom_cliente').AsString, [comp17]);
  //CNPJ
  RDIMPNOT.impF(15, 88, dao.Q1.fieldbyname('cpf').AsString, [comp17]);
  RDIMPNOT.impF(15, 88, dao.Q1.fieldbyname('cnpj').AsString, [comp17]);
  //DTA EMISSÃO
  if copy(dao.Q1.fieldbyname('dta_emissao').AsString, 7, 4) <> '1899' then
    RDIMPNOT.impf(15, 120, formatdatetime('dd/mm/yyyy',
      dao.Q1.fieldbyname('dta_emissao').AsDateTime), [comp17]);

  //endereço
  RDIMPNOT.impf(18, 01, dao.Q1.fieldbyname('endereco').AsString + ', ' +
    dao.Q1.fieldbyname('nr_endereco').AsString, [comp17]);

  //bairro
  RDIMPNOT.impf(18, 67, dao.Q1.fieldbyname('bairro').AsString, [comp17]);
  //cep
  RDIMPNOT.impf(18, 97, dao.Q1.fieldbyname('cep').AsString, [comp17]);

  //data saida / entrada
 // if copy(datetostr(DMVEN.QUNOTPED1.Fieldbyname('DTASAI').VALUE),7,4) <> '1899' then
  RDIMPNOT.impf(18, 119, formatdatetime('dd/mm/yyyy',
    dao.Q1.fieldbyname('dta_saida').AsDateTime), [comp17]);

  //municipio
  RDIMPNOT.impf(21, 01, dao.Q1.fieldbyname('cid_cli').AsString, [comp17]);
  //fone
  RDIMPNOT.impf(21, 46, dao.Q1.fieldbyname('telefone').AsString, [comp17]);
  //uf
  RDIMPNOT.impf(21, 80, dao.Q1.fieldbyname('uf').AsString, [comp17]);
  //ie

  RDIMPNOT.impf(21, 86, dao.Q1.fieldbyname('RG').AsString, [comp17]);
  RDIMPNOT.impf(21, 86, dao.Q1.fieldbyname('IE').AsString, [comp17]);
  //horA

 // RDIMPNOT.impf(16,01,DMVEN.TAPE1horsai.value,[comp17]);

 //*******************FATURA*****************************
  DAO.Q3.First;
  mtotcr1 := dao.Q3.RecordCount;
  maccr1 := 1;
  //Campo feito para marcar na nota qual nota forma de pgto
  RDIMPNOT.impf(25, 02, dao.q1.fieldbyname('nom_fop').AsString, [comp17]);
  MCOL := 49;
  while not (dao.q3.Eof) do
  begin
    RDIMPNOT.impF(25, MCOL, dao.Q3.fieldbyname('dtaven').AsString, [comp17]);
    mcol := MCOL + 14;
    dao.q3.Next;
  end;

  RDIMPNOT.impf(27, 02, dao.Q1.fieldbyname('nf').AsString, [comp17]);
  RDIMPNOT.impf(27, 24, dao.Q3.fieldbyname('nr_documento').Asstring, [comp17]);

  maccr1 := 1;
  dao.q3.FIRST;
  MCOL := 53;
  while not (dao.q3.Eof) do
  begin
    RDIMPNOT.impF(27, mcol, formatfloat('###,##0.00',
      dao.Q3.fieldbyname('valor').AsFloat), [comp17]);
    MCOL := MCOL + 14;
    dao.q3.Next;
  end;

end;

procedure TFr_vendas_industria2.Prcod_fiscalButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  //guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Código Fiscal';
  chamou_pesquisa := 'fr_cod_fiscal';
  chamou_form := 'fr_pedidos_cod_fiscal';
  chamou_cadastro := 'Fr_cod_fiscal';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Códigos Fiscais';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';

  for i := 0 to 1 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 0;

  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_vendas_industria2.Prcod_fiscalExit(Sender: TObject);
begin
  if trim(Prcod_fiscal.Text) = '' then
    Lbnom_cod_fiscal.Caption := '...';

  if Prcod_fiscal.Text <> '' then
  begin
    dao.Geral2('select nome from cod_fiscal where cod_fiscal=' +
      QuotedStr(Prcod_fiscal.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_cod_fiscal.Caption := dao.Q2.fieldbyname('nome').AsString;
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

procedure TFr_vendas_industria2.Prcod_fiscalKeyPress(Sender: TObject; var Key:
  Char);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin

  if not (key in ['0'..'9', #8]) and (key <> #13) then
  begin
    beep; {somente delphi 2.0 ou >}
    key := #0;
  end;

  if key = #13 then
  begin
    if (Prcod_fiscal.Text = '') and (BtNovped.Enabled = false) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Código Fiscal';
      chamou_pesquisa := 'fr_cod_fiscal';
      chamou_form := 'fr_pedidos_cod_fiscal';
      chamou_cadastro := 'Fr_cod_fiscal';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 +
        'Códigos Fiscais';
      Fr_localizar.BT_cadastro.Visible := false;

      //preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo, 2);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Nome';

      for i := 0 to 1 do
      begin
        valor_combo := campos_combo[i];
        Fr_localizar.CBcampos.Items.Add(valor_combo);
      end;
      Fr_localizar.CBcampos.ItemIndex := 0;

      Fr_localizar.ShowModal;
      Fr_localizar.Free;

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;
    end;
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TNFePedido.monta_NFE;
var
  cAssinarXML: _AssinarXML;
  strResultado: widestring;
  intResultado, CodigoNumerico, i, j, h: Integer;
  smensagem: wideString;
  strChaveAcesso: string;
  VST, VBCST, TotICMSSimples, ICMSSimples: currency;
  Fnf: file;
  assXML: TextFile;
  nr_erro: integer;
  xmldoc, ref, nome, xmlassinado, mensagem: Widestring;
  path, slInfCpl: string;
  SimplesICMS, CestaBasica, SubstituicaoTributaria,
    SubstituicaoTributariaRetida, Cheque, Dinheiro, Deposito: Boolean;
  procedure LimpaDirNF;
  var
    Ret: Integer;
    F: TSearchRec;
    Pasta: string;
    data_arquivo: Tdatetime;
  begin
    try
      Pasta := ExtractFilePath(Application.ExeName) + '\nf\';
      Ret := FindFirst(pasta + '*.xml', faAnyFile, F);
      while Ret = 0 do
      begin
        DeleteFile(pasta + F.Name);
        Ret := FindNext(F);
      end;
    finally
      //
    end
  end;
begin
  //  CDV := Copy(strChaveAcesso, Length(strChaveAcesso), Length(strChaveAcesso));
  LimpaDirNF;
  cont := 1;
  Synchronize(Mostra);
  //  cBuscarCertificado.BuscaNome(smensagem);
  try
    smensagem :=
      Fr_vendas_industria2.ACBrNFe1.Configuracoes.Certificados.SelecionarCertificado;
  except
    on E: Exception do
    begin
      erro := true;
      msgerros := E.Message;
      exit;
    end;
  end;
  nome_titular := smensagem;

  cont := 2;
  Synchronize(Mostra);

  //  dao.Geral4('select ultima_nf from configuracao');
  //  Nnumero_nf:= FMFUN.enchezero(dao.Q4.fieldbyname('ultima_nf').AsString,8);
  //  frmmontaXml.Nnumero_nf:= Nnumero_nf; //q_vendas1.fieldbyname('nf').AsString;

  Fr_vendas_industria2.ACBrNFe1.NotasFiscais.Clear;

  with Fr_vendas_industria2.ACBrNFe1.NotasFiscais.Add.NFe do
  begin

    //  frmmontaXml.Empresa_Faturar := Fr_vendas_industria2.Prempresa_faturar.Text;

    ide.serie := 1;

    //  frmmontaXml.Nserie_nf := '001';

    infnfe.ID := '1';
    //  frmmontaXml.Nnf_id := '1';

    infNfe.Versao := 2;
    //  frmmontaXml.Nnf_versao := '2.0';

    //  frmmontaXml.Nnr_documento := Fr_vendas_industria2.Prnumdoc.Text;

    if tipo = 0 then
      ide.nNF := strtoint(Fr_vendas_industria2.PrNFE.Text)
    else
      ide.nNF := strtoint(Fr_vendas_industria2.PrNFE_Dev.Text);

    //  frmmontaXml.Nnumero_nf := Fr_vendas_industria2.PrNFE.Text;

    ide.cUF := 42;
    //  frmmontaXml.Ncod_uf := '42';

    Randomize;
    CodigoNumerico := Random(9999999);

    Ide.CNF := strtoint(Copy(frpri.strZero(CodigoNumerico, 8, 0), 1, 8));

    if (Fr_vendas_industria2.Lbnom_fop.Caption =
      'À VISTA (SEM DESCONTOS ADICIONAIS)') then
      ide.indPag := ipVista;

    if (Fr_vendas_industria2.Lbnom_fop.Caption = 'BOLETO') or
      (Fr_vendas_industria2.Lbnom_fop.Caption = 'DUP BB FANTONI') or
      (Fr_vendas_industria2.Lbnom_fop.Caption = 'DUPLICATA') then
      ide.indPag := ipPrazo;

    if (Fr_vendas_industria2.Lbnom_fop.Caption = 'CHEQUE PRÉ') or
      (Fr_vendas_industria2.Lbnom_fop.Caption = 'PERMUTA') or
      (Fr_vendas_industria2.Lbnom_fop.Caption = 'TROCA') or
      (Fr_vendas_industria2.Lbnom_fop.Caption = 'BONIFICAÇÃO') then
      ide.indPag := ipOutras;

    if (Fr_vendas_industria2.Lbnom_fop.Caption = 'DEPÓSITO ANTECIPADO') then
    begin
      if (Fr_vendas_industria2.Prcod_prazo_pgto.Text = '7') then
        ide.indPag := ipVista
      else
        ide.indPag := ipPrazo;
    end;

    //  frmmontaXml.Nmodelo := '55'; // '55';
    ide.modelo := 55;

    //  frmmontaXml.Nserie_nf := '1'; // '1';
    ide.Serie := 1;

    //  frmmontaXml.Ndata_emissao := strtodate(Fr_vendas_industria2.Prdta_saida.text);
    if tipo = 0 then
      ide.dEmi := strtodate(Fr_vendas_industria2.Prdta_saida.text)
    else
      ide.dEmi := today;
    //
  //  frmmontaXml.Ndata_saida := FormatDateTime('yyyy-mm-dd', strtodate(Fr_vendas_industria2.Prdta_saida.text)); //
    if tipo = 0 then
      ide.dSaiEnt := strtodate(Fr_vendas_industria2.Prdta_saida.text)
    else
      ide.dSaiEnt := today;

    //  frmmontaXml.Ntipo_nf := '1'; //
    if tipo = 0 then
      ide.tpNF := tnSaida
    else
      ide.tpNF := tnEntrada;

    Fr_vendas_industria2.Prcod_fiscalExit(Self);
    ide.natOp := Fr_vendas_industria2.Prcod_fiscal.Text + '-' +
      copy(Fr_vendas_industria2.Lbnom_cod_fiscal.Caption, 1, 55);

    if ide.tpNF = tnEntrada then
    begin
      if ide.natOp = '5202' then
        ide.natOp := '1202';

      if ide.natOp = '5405' then
        ide.natOp := '1411';

      if ide.natOp = '6202' then
        ide.natOp := '2202';

      if ide.natOp = '6403' then
        ide.natOp := '2411';

      if ide.natOp = '6102' then
        ide.natOp := '2102';

      if ide.natOp = '5102' then
        ide.natOp := '1102';

      if ide.natOp = '5101' then
        ide.natOp := '1101';

      if ide.natOp = '6101' then
        ide.natOp := '2101';

      if ide.natOp = '5949' then
        ide.natOp := '1949';

      if ide.natOp = '6949' then
        ide.natOp := '2949';

      if ide.natOp = '5910' then
        ide.natOp := '1910';

      if ide.natOp = '6910' then
        ide.natOp := '2910';

    end;

    Fr_vendas_industria2.Prcod_fiscalExit(self);
    Nnat_operacao := ide.natOp;

    //     + ' - ' + Fr_vendas_industria2.Lbnom_cod_fiscal.Caption;

        //  frmmontaXml.Nnat_operacao := Fr_vendas_industria2.Prcod_fiscal.Text;

        //  frmmontaXml.Ntipo_impressao := '1';
    ide.tpImp := tiRetrato;

    //  frmmontaXml.Ntipo_emissao := '1'; //
    ide.tpEmis := teNormal;

    //  frmmontaXml.Ndigito_verificador:= ;//

    //frmmontaXml.Ntipo_ambiente := fmfun.BuscaAmbienteNFE;
    ide.tpAmb := fmfun.BuscaAmbienteNFE;
    Fr_vendas_industria2.ACBrNFe1.Configuracoes.WebServices.Ambiente :=
      ide.tpAmb;

    //1=produção 2=homologacao
  //  frmmontaXml.Nfinalidade_nf := '1'; //
    ide.finNFe := fnNormal;

    //frmmontaXml.Nprocesso_Emissao := '0'; //
    ide.ProcEmi := peAplicativoContribuinte;

    //emitente
  (* Informações da TAG EMIT... *)
    dao.Geral2('SELECT ' +
      '  a.CNPJ, ' +
      '  a.NOM_EMPRESA, ' +
      '  a.NOM_FANTASIA, ' +
      '  a.ENDERECO, ' +
      '  a.NR_ENDERECO, ' +
      '  a.COMPLEMENTO, ' +
      '  a.BAIRRO, ' +
      '  c.COD_IBGE, ' +
      '  c.NOM_CIDADE, ' +
      '  c.UF, ' +
      '  a.CEP, ' +
      '  a.FONE, ' +
      '  a.IE ' +
      'FROM EMPRESA a ' +
      'INNER JOIN CIDADES c on (c.COD_CIDADE = a.COD_CIDADE) ' +
      'WHERE cod_empresa=' +
      QuotedStr(Fr_vendas_industria2.Prempresa_faturar.Text));

    if dao.q2.RecordCount > 0 then
    begin
      //    frmmontaXml.NCNPJ := FRPRI.LimpaCNPJ(dao.Q2.fieldbyname('CNPJ').AsString);
      emit.CNPJCPF := FRPRI.LimpaCNPJ(dao.Q2.fieldbyname('CNPJ').AsString);

      strChaveAcesso := FRPRI.MontaChaveAcessoNFe(ide.cUF, ide.dEmi,
        emit.CNPJCPF, ide.modelo, ide.serie, ide.nNF, 1, Ide.CNF);

      //      strChaveAcesso := Fr_vendas_industria2.PrChave_NFe.Text;

            //    frmmontaXml.NNome := FMFUN.AnsiToAscii(dao.Q2.fieldbyname('NOM_EMPRESA').AsString);
      emit.xNome :=
        FMFUN.AnsiToAscii(dao.Q2.fieldbyname('NOM_EMPRESA').AsString);

      //    frmmontaXml.NFantasia := FMFUN.AnsiToAscii(dao.Q2.fieldbyname('NOM_FANTASIA').AsString);
      emit.xFant :=
        FMFUN.AnsiToAscii(dao.Q2.fieldbyname('NOM_FANTASIA').AsString);

      (* TAG EnderEMIT... *)
  //    frmmontaXml.Nrua := FMFUN.AnsiToAscii(dao.Q2.fieldbyname('ENDERECO').AsString);
      emit.EnderEmit.xLgr :=
        FMFUN.AnsiToAscii(dao.Q2.fieldbyname('ENDERECO').AsString);

      //    frmmontaXml.Nnumero := dao.Q2.fieldbyname('NR_ENDERECO').AsString;
      emit.EnderEmit.nro := dao.Q2.fieldbyname('NR_ENDERECO').AsString;

      //    frmmontaXml.Ncomplemento := FMFUN.AnsiToAscii(dao.Q2.fieldbyname('COMPLEMENTO').AsString);
      emit.EnderEmit.xCpl :=
        FMFUN.AnsiToAscii(dao.Q2.fieldbyname('COMPLEMENTO').AsString);

      //    frmmontaXml.NBairro := FMFUN.AnsiToAscii(dao.Q2.fieldbyname('BAIRRO').AsString);
      emit.EnderEmit.xBairro :=
        FMFUN.AnsiToAscii(dao.Q2.fieldbyname('BAIRRO').AsString);

      //    frmmontaXml.Ncod_cidade := dao.Q2.fieldbyname('COD_IBGE').AsString;
      emit.EnderEmit.cMun := dao.Q2.fieldbyname('COD_IBGE').AsInteger;
      ide.cMunFG := emit.EnderEmit.cMun;
      //    frmmontaXml.Nnom_cidade := FMFUN.AnsiToAscii(dao.Q2.fieldbyname('NOM_CIDADE').AsString);
      emit.EnderEmit.xMun :=
        FMFUN.AnsiToAscii(dao.Q2.fieldbyname('NOM_CIDADE').AsString);

      //    frmmontaXml.Nnom_UF := dao.Q2.fieldbyname('UF').AsString;
      emit.EnderEmit.UF := dao.Q2.fieldbyname('UF').AsString;

      //    frmmontaXml.NCEP := FRPRI.LimpaCNPJ(dao.Q2.fieldbyname('CEP').AsString);
      emit.EnderEmit.CEP :=
        strtoint(FRPRI.LimpaCNPJ(dao.Q2.fieldbyname('CEP').AsString));

      //    frmmontaXml.Ncodigo_Pais := '1058';
      emit.EnderEmit.cPais := 1058;

      //    frmmontaXml.Nnom_Pais := 'Brasil';
      emit.EnderEmit.xPais := 'Brasil';

      //    frmmontaXml.Nfone := FRPRI.LimpaCNPJ(dao.Q2.fieldbyname('FONE').AsString);
      emit.EnderEmit.fone :=
        FRPRI.LimpaCNPJ(dao.Q2.fieldbyname('FONE').AsString);

      //    frmmontaXml.Nie := FRPRI.LimpaCNPJ(dao.Q2.fieldbyname('IE').AsString);
      emit.IE := FRPRI.LimpaCNPJ(dao.Q2.fieldbyname('IE').AsString);

      if not Fr_vendas_industria2.empresa_simples then
        emit.CRT := crtRegimeNormal
      else
        emit.CRT := crtSimplesNacional;

    end;

    (* Informações da TAG DEST... *)
    if trim(Fr_vendas_industria2.Prcod_cliente.Text) <> '' then
    begin
      dao.Geral1('select nom_cliente, c.NOM_FANTASIA, cnpj, ie, cpf, endereco, nr_endereco, complemento, bairro, cd.cod_ibge, cd.nom_cidade, cd.uf, cep, telefone from cliente c ' +
        'left join cidades cd on cd.cod_cidade=c.cod_cidade ' +
        'where cod_cliente=' +
        QuotedStr(Fr_vendas_industria2.Prcod_cliente.Text));
    end
    else
    begin
      dao.Geral1('select c.RAZAO_SOCIAL as nom_cliente, c.FANTASIA as NOM_FANTASIA, c.CNPCPF as cnpj, null as cpf, c.IERG as ie, endereco, nr_endereco, complemento, bairro, cd.cod_ibge, cd.nom_cidade, cd.uf, cep, fone as telefone from fornecedor c ' +
        'left join cidades cd on cd.cod_cidade=c.cod_cidade ' +
        'where cod_fornecedor=' +
        QuotedStr(Fr_vendas_industria2.Prcod_fornecedor.Text));
    end;

    if ide.tpAmb = taProducao then
    begin
      if trim(FRPRI.LimpaCNPJ(dao.q1.fieldbyname('cpf').AsString)) <> '' then
        Dest.CNPJCPF := FRPRI.LimpaCNPJ(dao.q1.fieldbyname('cpf').AsString);

      if trim(FRPRI.LimpaCNPJ(dao.q1.fieldbyname('cnpj').AsString)) <> '' then
        Dest.CNPJCPF :=
          trim(FRPRI.LimpaCNPJ(dao.q1.fieldbyname('cnpj').AsString));
      if dao.Q1.fieldbyname('ie').AsString = 'ISENTO' then
        //     frmmontaXml.Nie_destino := 'ISENTO'
        dest.IE := 'ISENTO'
          // //'ISENTO'; (* Caso o destinatário não tenha Inscrição Estadual coloque a palavra "ISENTO" ...*)
      else
        dest.IE := FRPRI.LimpaCNPJ(dao.Q1.fieldbyname('ie').AsString);
      //  frmmontaXml.Nie_destino := FRPRI.LimpaCNPJ(dao.Q1.fieldbyname('ie').AsString);
        // //'ISENTO'; (* Caso o destinatário não tenha Inscrição Estadual coloque a palavra "ISENTO" ...*)
        //  cXML.InfNFe.Dest.ISUF := strResultado;

      Dest.xNome := FMFUN.AnsiToAscii(dao.Q1.fieldbyname('nom_cliente').AsString);

    end
    else
    begin
      Dest.CNPJCPF := '99999999000191'; //'99999090910270';
      Dest.XNome := 'NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL';
      //'NF-e Associacao NF-e';
      Dest.IE := '';
    end;

    //  'DISTRIBUIDORA DE AGUAS MINERAIS';
    (* TAG EnderDEST... *)
  //    frmmontaXml.Nrua_destino := FMFUN.AnsiToAscii(dao.Q1.fieldbyname('endereco').AsString);
    Dest.EnderDest.xLgr :=
      FMFUN.AnsiToAscii(dao.Q1.fieldbyname('endereco').AsString);

    // 'AV DAS FONTES';
    Dest.EnderDest.nro :=
      FMFUN.AnsiToAscii(dao.Q1.fieldbyname('nr_endereco').AsString);
    //    frmmontaXml.Nnumero_destino := FMFUN.AnsiToAscii(dao.Q1.fieldbyname('nr_endereco').AsString); // '1777';

    if Ncomplemento_destino <> '' then
      //      frmmontaXml.Ncomplemento_destino := dao.Q1.fieldbyname('complemento').AsString // '10 ANDAR';
      Dest.EnderDest.xCpl := dao.Q1.fieldbyname('complemento').AsString
    else
      Dest.EnderDest.xCpl := 'loja';
    //      frmmontaXml.Ncomplemento_destino := 'loja'; // '10 ANDAR';

  //    frmmontaXml.NBairro_destino := FMFUN.AnsiToAscii(dao.Q1.fieldbyname('bairro').AsString); // 'PARQUE FONTES';
    Dest.EnderDest.xBairro :=
      FMFUN.AnsiToAscii(dao.Q1.fieldbyname('bairro').AsString);

    //    frmmontaXml.Ncod_cidade_destino := dao.Q1.fieldbyname('cod_ibge').AsString;
    Dest.EnderDest.cMun := dao.Q1.fieldbyname('cod_ibge').AsInteger;
    // '5030801';
    Dest.EnderDest.xMun :=
      FMFUN.AnsiToAscii(dao.Q1.fieldbyname('nom_cidade').AsString);
    //    frmmontaXml.Nnom_cidade_destino := FMFUN.AnsiToAscii(dao.Q1.fieldbyname('nom_cidade').AsString);
        //  'Sao Paulo';
    Dest.EnderDest.UF := dao.Q1.fieldbyname('uf').AsString;
    //    frmmontaXml.Nnom_UF_destino := dao.Q1.fieldbyname('uf').AsString; //  'SP';

    //    frmmontaXml.NCEP_destino := FRPRI.LimpaCNPJ(dao.Q1.fieldbyname('cep').AsString); // '13950000';
    Dest.EnderDest.CEP :=
      strtoint(FRPRI.LimpaCNPJ(dao.Q1.fieldbyname('cep').AsString));

    //    frmmontaXml.Ncodigo_Pais := '1058'; //  '1058';
    Dest.EnderDest.cPais := 1058;

    //    frmmontaXml.Nnom_Pais := 'BRASIL'; // 'BRASIL';
    Dest.EnderDest.xPais := 'BRASIL'; // 'BRASIL';

    if dao.Q1.fieldbyname('telefone').IsNotNull then
      //      frmmontaXml.NFone_destino := FRPRI.LimpaCNPJ(dao.Q1.fieldbyname('telefone').AsString); //'1932011234';
      Dest.EnderDest.fone :=
        FRPRI.LimpaCNPJ(dao.Q1.fieldbyname('telefone').AsString); //'1932011234';

    //mercadoria já estão na unit FRMMontaXML é só definir a variavel Mform

    if (ide.finNFe <> fnNormal) and (Fr_vendas_industria2.q_vendas2.IsEmpty)
      then
    begin
      with det.Add do
      begin
        Prod.nItem := 1;
        Prod.CProd := '99999';
        Prod.CEAN := ''; (* Se não tiver EAN tem que colocar em Branco...*)
        Prod.XProd := 'COMPLEMENTO'; // 'Agua Mineral';
        Prod.NCM := '39173290'; // 'NCM';
        Prod.CFOP := Nnat_operacao;

        Prod.UCom := '1';
        Prod.QCom := 0;
        //FMFUN.DecimalPonto(FormatFloat('##0.0000', 0)); //'1000000.0000';
        Prod.VUnCom := 0; //FMFUN.DecimalPonto(FormatFloat('##0.00', 0)); //'1';

        Prod.VProd := 0;
        //FMFUN.DecimalPonto(FormatFloat('##0.00', 0)); // '10000000.00';

        Prod.VProd := Nvalor_NF;
        //FMFUN.DecimalPonto(FormatFloat('##0.00', Nvalor_NF));

        Prod.CEANTrib := '';
        (* Se não tiver EAN Trib. tem que colocar em Branco...*)
        Prod.UTrib := 'und'; //'und';
        Prod.QTrib := 0;
        //FMFUN.DecimalPonto(FormatFloat('##0.0000', 0)); //'12000000.0000';
        Prod.VUnTrib := 1; //'1';
        Prod.IndTot := itSomaTotalNFe; //'1';

        (*  Será necessário criar regras de negócio  de acordo com o ERP na qual definirá a ocorrência das TAGs de IMPOSTO...*)
        (* TAG ICMS.ICMS00... *)

        if Nbase_calculo_icms_tot > 0 then
        begin
          if Fr_vendas_industria2.Prempresa_faturar.Text = '1' then
          begin
            Imposto.ICMS.orig := oeNacional;
            Imposto.ICMS.CST := cst00;
            Imposto.ICMS.ModBC := dbiMargemValorAgregado;
            (* Zero é Aceitavél como valor... *)

            Imposto.ICMS.VBC := Nbase_calculo_icms_tot; // '10000000.00';
            if Nnom_UF_destino = Fr_vendas_industria2.UF_Emissor then
              Imposto.ICMS.PICMS := 17
            else
              Imposto.ICMS.PICMS := 12;
            //'18.00';
            Imposto.ICMS.VICMS := Nvalor_icms_tot; //'1800000.00';
          end
          else
          begin
            Imposto.ICMS.Orig := oeNacional;
            Imposto.ICMS.CSOSN := csosn101;
            Imposto.ICMS.ModBC := dbiPauta;
            Imposto.ICMS.VBC := 0; // '10000000.00';
            //        cDetLista.Imposto.ICMS.ICMSSN900.PRedBC := FMFUN.DecimalPonto(FormatFloat('##0.00', 1)); //'18.00';
            Imposto.ICMS.PICMS := 0; //'18.00';
            Imposto.ICMS.VICMS := 0; //'1800000.00';
          end;

        end
        else
        begin
          if not Fr_vendas_industria2.empresa_simples then
          begin
            (* TAG ICMS.ICMS60... *)
            Imposto.ICMS.Orig := oeNacional;
            Imposto.ICMS.CST := cst60;
            Imposto.ICMS.VBCSTRet := 0;
            Imposto.ICMS.VICMSSTRet := 0;
            SubstituicaoTributaria := true;
          end
          else
          begin
            Imposto.ICMS.Orig := oeNacional;
            Imposto.ICMS.CSOSN := csosn500;
            Imposto.ICMS.VBCSTRet := 0;
            Imposto.ICMS.VICMSSTRet := 0;
            SubstituicaoTributaria := true;
          end;
        end;
        (* TAG PIS.PISALIQ... *)
        if not Fr_vendas_industria2.empresa_simples then
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
    //     felipe comentou aqui
        if not Fr_vendas_industria2.empresa_simples then
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
    end
    else
    begin
      Fr_vendas_industria2.q_vendas2.First;
      j := 0;
      CestaBasica := false;
      SubstituicaoTributaria := false;
      TotICMSSimples := 0;
      while not Fr_vendas_industria2.q_vendas2.eof do
      begin
        j := j + 1;
        with det.Add do
        begin
          Prod.NItem := j;
          Prod.CProd :=
            Fr_vendas_industria2.q_vendas2.fieldbyname('cod_produto').AsString;
          //'00001';
          Prod.CEAN :=
            Fr_vendas_industria2.q_vendas2.fieldbyname('codigo_barra').AsString;
          (* Se não tiver EAN tem que colocar em Branco...*)
          Prod.XProd :=
            trim(FMFUN.AnsiToAscii(Fr_vendas_industria2.q_vendas2.fieldbyname('nom_produto').AsString)); // 'Agua Mineral';
          Prod.NCM :=
            FMFUN.TratarCodigoNCM(Fr_vendas_industria2.q_vendas2.fieldbyname('ncm').AsString, 1); // 'NCM';

          Prod.CFOP :=
            Fr_vendas_industria2.q_vendas2.fieldbyname('COD_FISCAL_ITEM').AsString;

          if (Prod.CFOP = '5102') or (Prod.CFOP = '6102') or (Prod.CFOP = '5101') or (Prod.CFOP = '6101') then
            SimplesICMS := true
          else
            SimplesICMS := false;

          if tipo = 1 then
          begin

            if Prod.CFOP = '5202' then
              Prod.CFOP := '1202';

            if Prod.CFOP = '6202' then
              Prod.CFOP := '2202';

            if Prod.CFOP = '6102' then
              Prod.CFOP := '2102';

            if Prod.CFOP = '5102' then
              Prod.CFOP := '1102';

            if Prod.CFOP = '6101' then
              Prod.CFOP := '2101';

            if Prod.CFOP = '5101' then
              Prod.CFOP := '1101';

            if Prod.CFOP = '5405' then
              Prod.CFOP := '1411';

            if Prod.CFOP = '6403' then
              Prod.CFOP := '2411';

            if Prod.CFOP = '5949' then
              Prod.CFOP := '1949';

            if Prod.CFOP = '6949' then
              Prod.CFOP := '2949';

            if Prod.CFOP = '5910' then
              Prod.CFOP := '1910';

            if Prod.CFOP = '6910' then
              Prod.CFOP := '2910';

          end;

          Prod.UCom :=
            Fr_vendas_industria2.q_vendas2.fieldbyname('unidade').AsString;

          Prod.QCom :=
            Fr_vendas_industria2.q_vendas2.fieldbyname('qtd').AsFloat;
          //'1000000.0000';
          Prod.VUnCom :=
            RoundTo(Fr_vendas_industria2.q_vendas2.fieldbyname('preco').AsFloat,
            (CasasDecimais * (-1))); //'1';
          Prod.VProd :=
            RoundTo(Fr_vendas_industria2.q_vendas2.fieldbyname('preco').AsFloat,
            (CasasDecimais * (-1))) *
            Fr_vendas_industria2.q_vendas2.fieldbyname('qtd').AsFloat;
          // '10000000.00';
          Prod.CEANTrib :=
            Fr_vendas_industria2.q_vendas2.fieldbyname('codigo_barra').AsString;
          (* Se não tiver EAN Trib. tem que colocar em Branco...*)
          Prod.UTrib := 'und'; //'und';
          Prod.QTrib :=
            Fr_vendas_industria2.q_vendas2.fieldbyname('qtd').AsFloat;
          //'12000000.0000';
          Prod.VUnTrib :=
            RoundTo(Fr_vendas_industria2.q_vendas2.fieldbyname('preco').AsFloat,
            (CasasDecimais * (-1))); //'1';
          prod.vDesc :=
            RoundTo(Fr_vendas_industria2.q_vendas2.fieldbyname('desconto_valor').AsFloat, (CasasDecimais * (-1)));
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

          (*  Será necessário criar regras de negócio  de acordo com o ERP na qual definirá a ocorrência das TAGs de IMPOSTO...*)
         (* TAG ICMS.ICMS00... *)
          if (Fr_vendas_industria2.q_vendas2.FieldByName('trib_icms').AsString =
            '00') or
            (Fr_vendas_industria2.q_vendas2.FieldByName('trib_icms').AsString =
            '0') then
          begin
            if not Fr_vendas_industria2.empresa_simples then
            begin
              Imposto.ICMS.CST := cst00;
              Imposto.ICMS.Orig := oeNacional;
              Imposto.ICMS.ModBC := dbiValorOperacao;
              (* Zero é Aceitavél como valor... *)
              Imposto.ICMS.VBC :=
                RoundTo(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc').AsFloat, (CasasDecimais * (-1))); // '10000000.00';
              Imposto.ICMS.PICMS :=
                Fr_vendas_industria2.q_vendas2.fieldbyname('icms_item').AsFloat;
              //'18.00';
              Imposto.ICMS.VICMS :=
                roundto((Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc').AsFloat *
                (Fr_vendas_industria2.q_vendas2.fieldbyname('icms_item').AsFloat
                /
                100)), (CasasDecimais * (-1)));
            end
            else
            begin
              Imposto.ICMS.Orig := oeNacional;
              Imposto.ICMS.CSOSN := csosn101;
              Imposto.ICMS.ModBC := dbiPauta;
              Imposto.ICMS.VBC :=
                RoundTo(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc').AsFloat, (CasasDecimais * (-1)));
              Imposto.ICMS.PICMS :=
                Fr_vendas_industria2.q_vendas2.fieldbyname('icms_item').AsFloat;
              //'18.00';
              Imposto.ICMS.VICMS :=
                roundto((Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc').AsFloat *
                (Fr_vendas_industria2.q_vendas2.fieldbyname('icms_item').AsFloat
                /
                100)),
                (CasasDecimais * (-1)));
              if SimplesICMS then
                TotICMSSimples := TotICMSSimples + Imposto.ICMS.VBC;
              //end;
            end;
          end;

          if (Fr_vendas_industria2.q_vendas2.FieldByName('trib_icms').AsString =
            '10') then
          begin
            if not Fr_vendas_industria2.empresa_simples then
            begin
              SubstituicaoTributariaRetida := true;
              Imposto.ICMS.Orig := oeNacional;
              Imposto.ICMS.CST := cst10;
              Imposto.ICMS.ModBC := dbiMargemValorAgregado;
              (* Zero é Aceitavél como valor... *)
              Imposto.ICMS.VBC :=
                RoundTo(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc').AsFloat, -2); // '10000000.00';
              Imposto.ICMS.PICMS :=
                Fr_vendas_industria2.q_vendas2.fieldbyname('icms_item').AsFloat;
              //'18.00';
              Imposto.ICMS.VICMS :=
                roundto((Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc').AsFloat *
                (Fr_vendas_industria2.q_vendas2.fieldbyname('icms_item').AsFloat
                /
                100)), (CasasDecimais * (-1)));
              //'1800000.00';

              Imposto.ICMS.vBCST :=
                RoundTo(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc_st').AsFloat, (CasasDecimais * (-1)));
              Imposto.ICMS.vICMSST :=
                RoundTo(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_icms_st').AsFloat, (CasasDecimais * (-1)));

            end
            else
            begin
              SubstituicaoTributariaRetida := true;
              Imposto.ICMS.Orig := oeNacional;
              Imposto.ICMS.CSOSN := csosn202;
              Imposto.ICMS.ModBC := dbiMargemValorAgregado;
              Imposto.ICMS.VBC :=
                RoundTo(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc').AsFloat, (CasasDecimais * (-1))); // '10000000.00';
              Imposto.ICMS.PICMS :=
                Fr_vendas_industria2.q_vendas2.fieldbyname('icms_item').AsFloat;
              //'18.00';
              Imposto.ICMS.VICMS :=
                roundto((Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc').AsFloat *
                (Fr_vendas_industria2.q_vendas2.fieldbyname('icms_item').AsFloat
                /
                100)), -2);
              //'1800000.00';

              Imposto.ICMS.vBCST :=
                RoundTo(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc_st').AsFloat, (CasasDecimais * (-1)));
              Imposto.ICMS.vICMSST :=
                RoundTo(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_icms_st').AsFloat, (CasasDecimais * (-1)));

              //end;
            end;
          end;

          (* TAG ICMS.ICMS40... *)
          if Fr_vendas_industria2.q_vendas2.FieldByName('trib_icms').AsString =
            '40' then
          begin
            if not Fr_vendas_industria2.empresa_simples then
            begin
              Imposto.ICMS.Orig := oeNacional;
              Imposto.ICMS.CST := cst40;
            end;
          end;
          if not Fr_vendas_industria2.empresa_simples then
          begin
            if Fr_vendas_industria2.q_vendas2.FieldByName('trib_icms').AsString
              =
              '60' then
            begin
              (* TAG ICMS.ICMS60... *)
              Imposto.ICMS.Orig := oeNacional;
              Imposto.ICMS.CST := cst60;
              Imposto.ICMS.vBCST := 0;
              //_vendas_industria2.q_vendas2.fieldbyname('vlr_bc_st').AsFloat;
              Imposto.ICMS.vICMSST := 0;
              // r_vendas_industria2.q_vendas2.fieldbyname('vlr_icms_st').AsFloat;
              SubstituicaoTributaria := true;
            end;

            if Fr_vendas_industria2.q_vendas2.FieldByName('trib_icms').AsString
              =
              '90' then
            begin
              (* TAG ICMS.ICMS90... *)
              Imposto.ICMS.Orig := oeNacional;
              Imposto.ICMS.CST := cst90;
              Imposto.ICMS.ModBCST := dbisPrecoTabelado;
              Imposto.ICMS.PMVAST :=
                RoundTo(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_agr_item').AsFloat, (CasasDecimais * (-1)));
              Imposto.ICMS.VBCST :=
                RoundTo(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc_st').AsFloat, (CasasDecimais * (-1)));
              Imposto.ICMS.PICMSST := 12;
              Imposto.ICMS.VICMSST :=
                RoundTo(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_icms_st').AsFloat, (CasasDecimais * (-1)));
              CestaBasica := true;
            end;
          end
          else
          begin
            if Fr_vendas_industria2.q_vendas2.FieldByName('trib_icms').AsString
              =
              '90' then
            begin
              Imposto.ICMS.Orig := oeNacional;
              Imposto.ICMS.CSOSN := csosn900;
              Imposto.ICMS.ModBCST := dbisPrecoTabelado;
              Imposto.ICMS.PMVAST :=
                RoundTo(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_agr_item').AsFloat, (CasasDecimais * (-1)));
              Imposto.ICMS.VBCST :=
                RoundTo(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc_st').AsFloat, (CasasDecimais * (-1)));
              if Nnom_UF_destino <> Fr_vendas_industria2.UF_Emissor then
                Imposto.ICMS.PICMSST := 12
              else
                Imposto.ICMS.PICMSST := 17;
              Imposto.ICMS.VICMSST :=
                RoundTo(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_icms_st').AsFloat, (CasasDecimais * (-1)));

              //              CestaBasica := true;
              SubstituicaoTributaria := true;
            end;
            if Fr_vendas_industria2.q_vendas2.FieldByName('trib_icms').AsString
              =
              '60' then
            begin
              Imposto.ICMS.Orig := oeNacional;
              Imposto.ICMS.CSOSN := csosn500;
              Imposto.ICMS.VBCST := 0;
              //Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc_st').AsFloat;
              Imposto.ICMS.VICMSST := 0;
              //Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_icms_st').AsFloat;
              SubstituicaoTributaria := true;
            end;
            if Fr_vendas_industria2.q_vendas2.FieldByName('trib_icms').AsString
              =
              '40' then
            begin
              Imposto.ICMS.Orig := oeNacional;
              Imposto.ICMS.CSOSN := csosn400;
            end;
          end;

          (* TAG IPI... *)
          //Felipe que comentou 22/03/2009
    {      cDetLista.Imposto.IPI.ClEnq := Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_icms_st').AsString;
          cDetLista.Imposto.IPI.CNPJProd := Valor;
          cDetLista.Imposto.IPI.CSelo := Valor;
          cDetLista.Imposto.IPI.QSelo := Valor;
     }

          (* TAG IPI.IPITRIB... *)
          if (Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_ipi_item').AsFloat
            > 0) and
            ((Fr_vendas_industria2.q_vendas2.fieldbyname('COD_FISCAL_ITEM').AsString =
            '5202') or
            (Fr_vendas_industria2.q_vendas2.fieldbyname('COD_FISCAL_ITEM').AsString
            = '6202')
            { or (Fr_vendas_industria2.q_vendas2.fieldbyname('COD_FISCAL_ITEM').AsString = '5102') or (Fr_vendas_industria2.q_vendas2.fieldbyname('COD_FISCAL_ITEM').AsString = '6102')}) then
          begin
            Imposto.IPI.CEnq := '999';
            Imposto.IPI.CST := ipi50;
            Imposto.IPI.VBC :=
              Fr_vendas_industria2.q_vendas2.fieldbyname('sub_total').AsFloat;
            Imposto.IPI.PIPI :=
              Fr_vendas_industria2.q_vendas2.fieldbyname('ipi_item').AsFloat;
            Imposto.IPI.VIPI :=
              Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_ipi_item').AsFloat;
          end;

          (* TAG PIS.PISALIQ... *)
          if not Fr_vendas_industria2.empresa_simples then
          begin
            Imposto.PIS.CST := pis01;
            Imposto.PIS.VBC :=
              Fr_vendas_industria2.q_vendas2.fieldbyname('sub_total').AsFloat;
            Imposto.PIS.PPIS := 0.65;
            Imposto.PIS.VPIS :=
              Fr_vendas_industria2.q_vendas2.fieldbyname('sub_total').AsFloat *
              0.0065;
          end
          else
          begin
            Imposto.PIS.CST := pis99;
            Imposto.PIS.QBCProd := 0;
            Imposto.PIS.VAliqProd := 0;
            Imposto.PIS.VPIS := 0;
          end;

          (* TAG COFINS.COFINSALIQ_CST... *)
    //     felipe comentou aqui
          if not Fr_vendas_industria2.empresa_simples then
          begin
            Imposto.COFINS.CST := cof01;
            Imposto.COFINS.VBC :=
              Fr_vendas_industria2.q_vendas2.fieldbyname('sub_total').AsFloat;
            Imposto.COFINS.PCOFINS := 2;
            Imposto.COFINS.VCOFINS :=
              Fr_vendas_industria2.q_vendas2.fieldbyname('sub_total').AsFloat *
              0.02;
          end
          else
          begin
            Imposto.COFINS.CST := cof99;
            Imposto.COFINS.QBCProd := 0;
            Imposto.COFINS.VAliqProd := 0;
            Imposto.COFINS.VCOFINS := 0;
          end;

          (* TAG ICMS.ICMS40... *)
          if Fr_vendas_industria2.q_vendas2.FieldByName('trib_icms').AsString =
            '40' then
          begin
            if not Fr_vendas_industria2.empresa_simples then
            begin
              Imposto.ICMS.Orig := oeNacional;
              Imposto.ICMS.CST := cst40;
            end;
          end;
          if not Fr_vendas_industria2.empresa_simples then
          begin
            if Fr_vendas_industria2.q_vendas2.FieldByName('trib_icms').AsString
              =
              '60' then
            begin
              (* TAG ICMS.ICMS60... *)
              Imposto.ICMS.Orig := oeNacional;
              Imposto.ICMS.CST := cst60;
              Imposto.ICMS.VBCST := 0;
              //Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc_st').AsFloat;
              Imposto.ICMS.VICMSST := 0;
              Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_icms_st').AsFloat;
              SubstituicaoTributaria := true;
            end;

            if Fr_vendas_industria2.q_vendas2.FieldByName('trib_icms').AsString
              =
              '90' then
            begin
              (* TAG ICMS.ICMS90... *)
              Imposto.ICMS.Orig := oeNacional;
              Imposto.ICMS.CST := cst90;
              Imposto.ICMS.ModBCST := dbisPrecoTabelado;
              Imposto.ICMS.PMVAST :=
                Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_agr_item').AsFloat;
              Imposto.ICMS.VBCST :=
                Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc_st').AsFloat;
              Imposto.ICMS.PICMSST := 12;
              Imposto.ICMS.VICMSST :=
                Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_icms_st').AsFloat;
              CestaBasica := true;
            end;
          end;

          (* TAG PIS.PISALIQ... *)
          if not Fr_vendas_industria2.empresa_simples then
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
    //     felipe comentou aqui
          if not Fr_vendas_industria2.empresa_simples then
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
        Fr_vendas_industria2.q_vendas2.Next;
      end;
    end;

    //Totais
    dao.Geral1('select tot_liquido, valordescontoadic, vlr_icms, vlr_bc_icms, vlr_bc_icms_st, vlr_st, vl_frete, vlr_ipi from vendas1 where numdoc=' + QuotedStr(Fr_vendas_industria2.Prnumdoc.text));
    if not Fr_vendas_industria2.empresa_simples then
    begin
      Total.ICMSTot.vBC := RoundTo(dao.Q1.fieldbyname('vlr_bc_icms').AsFloat,
        (CasasDecimais * (-1)));
      Total.ICMSTot.vICMS := RoundTo(dao.Q1.fieldbyname('vlr_icms').AsFloat,
        (CasasDecimais * (-1)));
    end
    else
    begin
      Total.ICMSTot.vBC := 0;
      Total.ICMSTot.vICMS := 0;
    end;

    Total.ICMSTot.vBCST := 0;
    Total.ICMSTot.VST := 0;

    vBCST := RoundTo(dao.Q1.fieldbyname('vlr_bc_icms_st').AsFloat, (CasasDecimais
      * (-1)));
    VST := RoundTo(dao.Q1.fieldbyname('vlr_st').AsFloat, (CasasDecimais *
      (-1)));

    if SubstituicaoTributariaRetida then
    begin
      Total.ICMSTot.vBCST := vBCST;
      Total.ICMSTot.VST := VST;
    end;

    Total.ICMSTot.VProd := RoundTo(dao.Q1.fieldbyname('tot_liquido').AsFloat +
      dao.Q1.fieldbyname('ValorDescontoAdic').AsFloat, (CasasDecimais * (-1)));
    Total.ICMSTot.VFrete := 0;
    Total.ICMSTot.vSeg := 0;
    Total.ICMSTot.vDesc :=
      RoundTo(dao.Q1.fieldbyname('ValorDescontoAdic').AsFloat, (CasasDecimais *
      (-1)));
    Total.ICMSTot.vII := 0;
    Total.ICMSTot.vIPI := RoundTo(dao.Q1.fieldbyname('vlr_ipi').AsFloat,
      (CasasDecimais * (-1)));
    Total.ICMSTot.vPIS := 0;
    Total.ICMSTot.vCOFINS := 0;
    Total.ICMSTot.vOutro := 0;
    Total.ICMSTot.vNF := RoundTo(dao.Q1.fieldbyname('tot_liquido').AsFloat +
      dao.Q1.fieldbyname('vlr_ipi').AsFloat + Total.ICMSTot.VST, (CasasDecimais
      * (-1)));

    if Fr_vendas_industria2.prtipo_frete.itemindex = 2 then
      Transp.ModFrete := mfContaDestinatario
    else
      Transp.ModFrete := mfContaEmitente;

    if Fr_vendas_industria2.Prcod_transportadora.Text <> '' then
    begin
      dao.Geral2('SELECT ' +
        '  coalesce(a.CNPJ, a.CPF) AS CNPJ, ' +
        '  a.NOME, ' +
        '  a.ENDERECO, ' +
        '  a.BAIRRO, ' +
        '  c.COD_IBGE, ' +
        '  c.NOM_CIDADE, ' +
        '  c.UF, ' +
        '  a.CEP, ' +
        '  a.FONE, ' +
        '  a.IE ' +
        'FROM TRANSPORTADORA a ' +
        'INNER JOIN CIDADES c on (c.COD_CIDADE = a.COD_CIDADE) ' +
        'WHERE cod_transportadora=' +
        QuotedStr(Fr_vendas_industria2.Prcod_transportadora.Text));

      if dao.q2.RecordCount > 0 then
      begin
        Transp.Transporta.CNPJCPF :=
          FRPRI.LimpaCNPJ(dao.Q2.fieldbyname('CNPJ').AsString);
        Transp.Transporta.xNome :=
          FMFUN.AnsiToAscii(dao.Q2.fieldbyname('NOME').AsString);
        if not dao.Q2.fieldbyname('IE').IsNull then
          Transp.Transporta.IE :=
            FRPRI.LimpaCNPJ(dao.Q2.fieldbyname('IE').AsString);
        Transp.Transporta.xEnder :=
          FMFUN.AnsiToAscii(dao.Q2.fieldbyname('ENDERECO').AsString);
        Transp.Transporta.xMun :=
          FMFUN.AnsiToAscii(dao.Q2.fieldbyname('NOM_CIDADE').AsString);
        Transp.Transporta.UF := dao.Q2.fieldbyname('UF').AsString;
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
      qVol := Fr_vendas_industria2.Prvolume_nota.AsInteger;
      esp := 'VOLUMES';
      marca := 'X';
      pesoL := Fr_vendas_industria2.PrPESO_NOTA.Value;
      pesoB := Fr_vendas_industria2.PrPESO_NOTA.Value;
    end;

    if ide.finNFe = fnNormal then
    begin
      Cheque := false;
      Dinheiro := false;
      Deposito := false;

      i := 0;
      if tipo = 0 then
      begin
        if not Fr_vendas_industria2.q_cr1.IsEmpty then
        begin
          Fr_vendas_industria2.q_cr1.First;
          if Fr_vendas_industria2.q_cr1.fieldbyname('cod_fop').AsString = '1'
            then
            Dinheiro := true
          else if (Fr_vendas_industria2.q_cr1.fieldbyname('cod_fop').AsString =
            '2') or
            (Fr_vendas_industria2.q_cr1.fieldbyname('cod_fop').AsString = '3')
            or
            (Fr_vendas_industria2.q_cr1.fieldbyname('cod_fop').AsString = '4')
            or
            (Fr_vendas_industria2.q_cr1.fieldbyname('cod_fop').AsString = '5')
            or
            (Fr_vendas_industria2.q_cr1.fieldbyname('cod_fop').AsString = '6')
              then
          begin
            if Fr_vendas_industria2.q_cr1.fieldbyname('cod_fop').AsString = '4'
              then
              Cheque := true;
            if (Fr_vendas_industria2.q_cr1.fieldbyname('cod_fop').AsString = '2')
              and (Fr_vendas_industria2.Prcod_prazo_pgto.Text = '7') then
              Deposito := true
            else
            begin

              while not Fr_vendas_industria2.q_cr1.eof do
              begin
                i := i + 1;
                with Cobr.Dup.Add do
                begin
                  NDup := Fr_vendas_industria2.PrNFE.Text + '/' + inttostr(i);
                  DVenc :=
                    Fr_vendas_industria2.q_cr1.fieldbyname('dtaven').AsDateTime;
                  VDup :=
                    Fr_vendas_industria2.q_cr1.fieldbyname('valor').AsFloat;
                end;
                Fr_vendas_industria2.q_cr1.Next
              end;

            end;
          end;
        end;
      end
      else
        Dinheiro := true;
    end;

    slInfCpl :=
      trim(FMFUN.AnsiToAscii(Fr_vendas_industria2.Probservacoes_nota.Text));

    if ide.finNFe = fnNormal then
    begin
      if (copy(Nnat_operacao, 1, 4) = '5405') or (copy(Nnat_operacao, 1, 4) = '6403') or
         (copy(Nnat_operacao, 1, 4) = '5102') or (copy(Nnat_operacao, 1, 4) = '6102') or
         (copy(Nnat_operacao, 1, 4) = '5101') or (copy(Nnat_operacao, 1, 4) = '6101') then
        slInfCpl := slInfCpl +
          'Nao aceitamos devolucao sem previa Consulta ao Nosso Dep. Vendas. Favor conferir a mercadoria no ato do recebimento, nao aceitaremos reclamacoes posteriores. ' +
          'O nao recebimento dos boletos, nao justifica a falta de pagamento ou dispensa de juros por atraso. Duvidas, entrar em contato antes do vencimento.';

      if Fr_vendas_industria2.empresa_simples then
      begin
        //    slInfCpl := slInfCpl + '.';
        if TotICMSSimples > 0 then
        begin
          ICMSSimples := TotICMSSimples * (2.56 / 100);
          slInfCpl := slInfCpl + 'Permite o aproveitamento do crédito de ICMS no valor de ' +
            formatfloat('R$ #,###,##0.00', ICMSSimples) +
            ' correspondente à alíquota de 2,56%, nos termos do Art. 23 da LC 123/2006.';
        end
        else if  not ((copy(Nnat_operacao, 1, 4) = '5102') or (copy(Nnat_operacao, 1, 4) = '6102') or (copy(Nnat_operacao, 1, 4) = '5101') or (copy(Nnat_operacao, 1, 4) = '6101')) then
          slInfCpl := slInfCpl +
            'Documento emitido por ME ou EPP optante pelo simples nacional. Nao gera direito a credito Fiscal de ICMS. ';
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
          slInfCpl := slInfCpl +
            'Imposto retido por Substituicao Tributaria RIMCMS SC/01 Anexo 3. BCST ' +
            FMFUN.DecimalPonto(FormatFloat('##0.00', vBCST)) + ' IST ' +
            FMFUN.DecimalPonto(FormatFloat('##0.00', VST)) + '. ';
      end;

      if (Nnat_operacao = '1202') or (Nnat_operacao = '2202') or (Nnat_operacao
        =
        '1202') or (Nnat_operacao = '2202') then
        slInfCpl := slInfCpl +
          'Devolucao de Mercadoria referente a NF. de Saida: ' +
          Fr_vendas_industria2.PrNFE.Text;

      InfAdic.InfCpl := trim(FMFUN.AnsiToAscii(slInfCpl));
    end;

    path := ExtractFilePath(Application.ExeName);
    arquivo_nfe := path + 'nf\';
    arquivo_nfe := arquivo_nfe + strChaveAcesso + '-nfe.xml';

    Fr_vendas_industria2.ACBrNFe1.NotasFiscais.Assinar;
    cont := 3;
    Synchronize(Mostra);

    path := ExtractFilePath(Application.ExeName);

    cont := 4;
    Synchronize(Mostra);
    // if StrToInt(FRPRI.pValidarXML(arquivo_nfe,path+'schemas\enviNFe_v2.00.xsd',mensagem, msgerros)) > 0 then
    try
      Fr_vendas_industria2.ACBrNFe1.NotasFiscais.Valida;
    except
      msgerros := Fr_vendas_industria2.ACBrNFe1.NotasFiscais.Items[0].Alertas;
      erro := true;
    end;
    Fr_vendas_industria2.ACBrNFe1.NotasFiscais.SaveToFile(arquivo_nfe);
  end;
end;

constructor TNFePedido.Create;
begin
  inherited Create(True);
  { Chama o contrutor herdado. Ele irá temporariamente colocar o thread em estado de espera para depois executá-lo. }
  FreeOnTerminate := True; // Libera o objeto após terminar.
  Priority := TpLower;
  { Configura sua prioridade na lista de processos do Sistema operacional. }
  Resume; // Inicia o Thread.
end;

procedure TNFePedido.Execute;
begin
  try
    CoInitialize(nil);

    frpri.DesabilitaTimers;
    monta_NFE;

    if not erro then
    begin
      GravarChaveNfe;
      EnviarLote(PathLote);
      GravarReciboNfe;
      //TransfereNfeFTP;
      finalizado := true;
      Synchronize(Mostra);
    end
    else
    begin
      Synchronize(Mostra);
    end;

    Fr_nfe_transmissao.BtnOK.Enabled := true;

  finally
    CoUnInitialize;
    frpri.HabilitaTimers;
  end;
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
    Fr_nfe_transmissao.MsgErro.enabled := false;
    Fr_nfe_transmissao.MsgErro.Text := msgerros;
    Fr_nfe_transmissao.MsgErro.Height := Fr_nfe_transmissao.Panel1.Height -
      Fr_nfe_transmissao.MsgErro.Top;
    Fr_nfe_transmissao.lbResultado.Caption := 'Houve erro no processo.';
    Fr_nfe_transmissao.BTNOK.MODALRESULT := mrok;
    Fr_nfe_transmissao.BTNOK.Enabled := true;
    DeleteFile(arquivo_nfe);
    DeleteFile(arquivo_procnfe);
    DeleteFile(arquivo_ReciboNFe);
  end;

  if finalizado then
  begin
    Fr_nfe_transmissao.lbResultado.Visible := true;
    if msgerros = '' then
      Fr_nfe_transmissao.lbResultado.Caption :=
        'Processo de Gerar NFe foi concluído com Sucesso.'
    else
      Fr_nfe_transmissao.lbResultado.Caption := 'Houve erro no processo.';
    Fr_nfe_transmissao.Refresh;
    Fr_nfe_transmissao.MsgErro.enabled := false;
    Fr_nfe_transmissao.BTNOK.Enabled := true;
    //sleep(500);
  end;

  Fr_nfe_transmissao.Update;
  //  Sleep(2000);
end;

procedure TNFePedido.GravarChaveNfe;
begin
  cont := 5;
  Synchronize(Mostra);
  if tipo = 0 then
  begin
    if Fr_vendas_industria2.q_vendas1.fieldbyname('Chave_NFe').IsNotNull then
    begin
      dm.FTPNFe.Connect;
      if dm.FTPNFe.Connected then
      begin
        dm.FTPNFe.Delete(Fr_vendas_industria2.q_vendas1.fieldbyname('Chave_NFe').AsString + '-nfe.xml');
        dm.FTPNFe.Quit;
      end;
    end;
  end
  else
  begin
    if Fr_vendas_industria2.q_vendas1.fieldbyname('Chave_NFe_Dev').IsNotNull
      then
    begin
      dm.FTPNFe.Connect;
      if dm.FTPNFe.Connected then
      begin
        dm.FTPNFe.Delete(Fr_vendas_industria2.q_vendas1.fieldbyname('Chave_NFe_Dev').AsString + '-nfe.xml');
        dm.FTPNFe.Quit;
      end;
    end;
  end;

  Fr_vendas_industria2.XMLNFe.LoadFromFile(arquivo_nfe);
  Fr_vendas_industria2.XMLNFe.Active := true;
  ChaveNFe :=
    Fr_vendas_industria2.XMLNFe.DocumentElement.ChildNodes.FindNode('infNFe').Attributes['Id'];
  ChaveNfe := copy(ChaveNFe, 4, 44);
  try
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;

    if tipo = 0 then
      dao.Execsql('update vendas1 set CHAVE_NFE =' + QuotedStr(ChaveNFe) +
        ' where numdoc=' + QuotedStr(Fr_vendas_industria2.Prnumdoc.Text))
    else
      dao.Execsql('update vendas1 set CHAVE_NFE_DEV =' + QuotedStr(ChaveNFe) +
        ' where numdoc=' + QuotedStr(Fr_vendas_industria2.Prnumdoc.Text));

    dao.cn.Commit;

    Fr_vendas_industria2.XMLNFe.Active := false;
    Fr_vendas_industria2.PrChave_NFe.Text := ChaveNFe;
  except
    dao.cn.Rollback;
  end;

end;

procedure TNFePedido.TransfereNfeFTP;
var
  destino: string;
  x: integer;
  conectou: boolean;
begin
  cont := 8;
  Synchronize(Mostra);

  destino := copy(ExtractFileName(arquivo_nfe), 1,
    length(ExtractFileName(arquivo_nfe)) - length(ExtractFileExt(arquivo_nfe)))
    +
    '.xml';
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
          destino := copy(ExtractFileName(arquivo_procnfe), 1,
            length(ExtractFileName(arquivo_procnfe)) -
            length(ExtractFileExt(arquivo_procnfe))) + '.xml';
          dm.FTPNFe.Put(arquivo_procnfe, destino);

          // desconecta
          dm.FTPNFe.Quit;
          DeleteFile(arquivo_nfe);
          DeleteFile(arquivo_procNFE);
          conectou := true;
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
  tpamb: integer;
  smensagem: wideString;
  procedure GeraArqRec;
  begin
    reciboLst := TStringList.Create;
    reciboLst.add(UTF8Encode(Fr_vendas_industria2.ACBrNFe1.WebServices.Retorno.RetWS));
    reciboLst.savetofile(pathSaida + 'ReciboLote.xml');
    reciboLst.free;
  end;
begin
  cont := 6;
  pathSaida := ExtractFilePath(Application.ExeName) + 'nf\';
  Synchronize(Mostra);
  try
    Fr_vendas_industria2.ACBrNFe1.Enviar(1, False);
    GeraArqRec;
  except

    on e: Exception do
    begin
      if Fr_vendas_industria2.ACBrNFe1.WebServices.Retorno.cStat <> 539 then
        erro := true
      else
        Fr_vendas_industria2.nfe_duplicada := true;
      msgerros := UTF8Encode(e.Message);
      GeraArqRec;
    end;
  end;
end;

function TNFePedido.GerarXMLProcNFe: Boolean;
var
  NomeArquivo, gPathNFe: string;
  prot: widestring;
begin
  try
    gPathNFe := ExtractFilePath(Application.ExeName) + '\nf\';
    Fr_vendas_industria2.ACBrNFe1.Consultar;
    prot := Fr_vendas_industria2.ACBrNFe1.WebServices.Consulta.Protocolo;
    status := inttostr(dm.ACBrNFe1.WebServices.Consulta.cStat);
    motivo := dm.ACBrNFe1.WebServices.Consulta.XMotivo;

    if prot = '' then
    begin
      Result := False;
      exit;
    end;

    NomeArquivo := gPathNFe + chaveNfe + '-procNfe.xml';
    arquivo_procNFe := NomeArquivo;

    Fr_vendas_industria2.ACBrNFe1.NotasFiscais.Items[0].SaveToFile(NomeArquivo);

    if not dm.FTPNFe.Connected then
      dm.FTPNFe.Connect;

    if dm.FTPNFe.Connected then
    begin
      // transfere um arquivo texto
      dm.FTPNFe.TransferType := ftASCII;
      dm.FTPNFe.Put(NomeArquivo, chaveNfe + '-procNFe.xml');
      // desconecta
      dm.FTPNFe.Quit;
    end;

    Result := True;
  except
    Result := False;
  end;
end;

procedure TNFePedido.GravarReciboNfe;
var
  strVersaoDados, strCabecXML, strDados, protocolo, digest,
    dataStr: string;
  reciboLst: TStringList;
  data: TDateTime;

  procedure SetaData;
  var
    dataarr: TStringList;
    horastr: string;
  begin
    horastr := copy(datastr, pos('T', datastr) + 1, 8);
    datastr := copy(datastr, 1, pos('T', datastr) - 1);
    dataarr := TStringList.create;
    dataarr := FMFUN.explode(datastr, '-');
    datastr := dataarr[2] + '/' + dataarr[1] + '/' + dataarr[0];
    dataarr.free;
    data := strtodatetime(datastr + ' ' + horastr);
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
        sqlNfe := 'update vendas1 set CHAVE_NFE =' + quotedstr(ChaveNFe) +
          ' where numdoc =' + Fr_vendas_industria2.PrNumdoc.text
      else
        sqlNfe := 'update vendas1 set CHAVE_NFE_DEV =' + quotedstr(ChaveNFe) +
          ' where numdoc =' + Fr_vendas_industria2.PrNumdoc.text;

      try
        if not (dao.cn.InTransaction) then
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
    SxmlRecibo.SaveToFile(pathSaida + 'ReciboLote.xml');
    arquivo_ReciboNFe := pathSaida + 'ReciboLote.xml';
    Fr_vendas_industria2.XMLNFe.loadfromfile(pathSaida + 'ReciboLote.xml');

    if
      Assigned(Fr_vendas_industria2.XMLNFe.DocumentElement.ChildNodes.FindNode('protNFe')) then
    begin
      xmlRecibo :=
        Fr_vendas_industria2.XMLNFe.DocumentElement.ChildNodes.FindNode('protNFe');
      xmlRecibo.ChildNodes.First;

      status := '';
      motivo := '';
      protocolo := '';
      digest := '';
      datastr := '';

      while not (xmlRecibo = nil) do
      begin
        if ChaveNFe =
          xmlRecibo.ChildNodes.FindNode('infProt').ChildNodes.FindNode('chNFe').text then
        begin
          status :=
            xmlRecibo.ChildNodes.FindNode('infProt').ChildNodes.FindNode('cStat').text;
          motivo :=
            xmlRecibo.ChildNodes.FindNode('infProt').ChildNodes.FindNode('xMotivo').text;
          if status = '100' then
            protocolo :=
              xmlRecibo.ChildNodes.FindNode('infProt').ChildNodes.FindNode('nProt').text
          else
          begin
            protocolo := 'null';
            erro := true;
            msgerros := motivo;
          end;
          digest :=
            xmlRecibo.ChildNodes.FindNode('infProt').ChildNodes.FindNode('digVal').text;
          datastr :=
            xmlRecibo.ChildNodes.FindNode('infProt').ChildNodes.FindNode('dhRecbto').text;
          SetaData;
          if status = '539' then
          begin
            Fr_vendas_industria2.nfe_duplicada := true;
            RecuperaChaveNfe(motivo);
          end;
        end;
        xmlRecibo := xmlRecibo.NextSibling;
      end;
      //    fm_nfe_envio_loteFr_vendas_industria2.XMLNFe.Active := false;
    end;
  end;

  procedure ConsultaStatusNFe(ChaveNFe: string);
  begin
    Fr_vendas_industria2.ACBrNFe1.WebServices.Consulta.NFeChave := ChaveNFe;
    try
      if not Fr_vendas_industria2.ACBrNFe1.WebServices.Consulta.Executar then
      begin
        erro := true;
        msgerros :=
          UTF8Encode(Fr_vendas_industria2.ACBrNFe1.WebServices.Consulta.XMotivo);
      end
      else
      begin
        reciboLst := TStringList.Create;
        reciboLst.add(UTF8Encode(Fr_vendas_industria2.ACBrNFe1.WebServices.Consulta.RetWS));
        reciboLst.savetofile(pathSaida + 'Recibo.xml');
        arquivo_ReciboNFe := pathSaida + 'Recibo.xml';
        reciboLst.free;

        //      Fr_vendas_industria2.XMLNFe.Active := true;
        Fr_vendas_industria2.XMLNFe.loadfromfile(pathSaida + 'Recibo.xml');

        if
          Assigned(Fr_vendas_industria2.XMLNFe.DocumentElement.ChildNodes.FindNode('chNFe')) then
        begin
          status := '';
          motivo := '';
          protocolo := '';
          digest := '';
          datastr := '';

          if ChaveNFe =
            Fr_vendas_industria2.XMLNFe.DocumentElement.ChildNodes.FindNode('chNFe').text then
          begin
            status :=
              Fr_vendas_industria2.XMLNFe.DocumentElement.ChildNodes.FindNode('cStat').text;
            motivo :=
              Fr_vendas_industria2.XMLNFe.DocumentElement.ChildNodes.FindNode('xMotivo').text;
            if status = '100' then
            begin
              protocolo :=
                Fr_vendas_industria2.XMLNFe.DocumentElement.ChildNodes.FindNode('protNFe').ChildNodes.FindNode('infProt').ChildNodes.FindNode('nProt').text;
              digest :=
                Fr_vendas_industria2.XMLNFe.DocumentElement.ChildNodes.FindNode('protNFe').ChildNodes.FindNode('infProt').ChildNodes.FindNode('digVal').text;
              datastr :=
                Fr_vendas_industria2.XMLNFe.DocumentElement.ChildNodes.FindNode('protNFe').ChildNodes.FindNode('infProt').ChildNodes.FindNode('dhRecbto').text;
              SetaData;
            end
            else
            begin
              protocolo := 'null';
              digest := 'null';
              datastr := 'null';
            end;
          end;
        end;
        // fm_nfe_envio_lote.XMLNFe.Active := false;
        DeleteFile(pathSaida + 'Recibo.xml');
      end;
    except
      on e: Exception do
      begin
        erro := true;
        msgerros := UTF8Encode(e.Message);
      end;
    end;
  end;

  procedure CarregaStatusLote;
  var
    arquivoNFe: string;
  begin
    Fr_vendas_industria2.ACBrNFe1.WebServices.Recibo.Recibo := Recibo;

    try
      if not Fr_vendas_industria2.ACBrNFe1.WebServices.Recibo.Executar then
      begin
        erro := true;
        msgerros :=
          UTF8Encode(Fr_vendas_industria2.ACBrNFe1.WebServices.Recibo.RetWS);
      end
      else
        GerarXMLProcNFe;
    except
      on e: Exception do
      begin
        erro := true;
        msgerros := UTF8Encode(e.Message);
        //ConsultaStatusLote(Fr_vendas_industria2.PrChave_NFe.Text);
      end;
    end;

  end;

  {  procedure ImprimirDanfe(chave, protocolo: string; data: TDateTime);
    var
      arquivoNFe, arquivoPDF, pathSaida: string;
    begin
      pathSaida := ExtractFilePath(Application.ExeName) + 'nf\';
      arquivoNFe := chave + '-nfe.xml';
      Fr_vendas_industria2.ACBrNFe1.NotasFiscais.Clear;
  //    Fr_vendas_industria2.ACBrNFe1.DANFE.Impressora := fmfun.BuscaImpressoraPadrao;
      Fr_vendas_industria2.ACBrNFe1.NotasFiscais.LoadFromFile(pathSaida + arquivoNFe);
      Fr_vendas_industria2.ACBrNFe1.DANFE.ProtocoloNFe := protocolo + ' ' + formatdatetime('dd/mm/yyyy hh:mm:ss', data);
      Fr_vendas_industria2.ACBrNFe1.DANFE.ImprimirDANFE();
    end;
   }

  function AtualizaStatusNFe: Boolean;
  var
    sqlNFe, faturado: string;
  begin
    CarregaStatusLote;
    ConsultaStatusNFe(ChaveNfe);

    if status <> '100' then
    begin
      ConsultaStatusLote(ChaveNfe);
      if status <> '100' then
        faturado := '0'
      else
      begin
        if ((Fr_vendas_industria2.Prcod_fiscal.Text = '5102') or
          (Fr_vendas_industria2.Prcod_fiscal.Text = '6102') or
          (Fr_vendas_industria2.Prcod_fiscal.Text = '5101') or
          (Fr_vendas_industria2.Prcod_fiscal.Text = '6101') or
          (Fr_vendas_industria2.Prcod_fiscal.Text = '5405') or
          (Fr_vendas_industria2.Prcod_fiscal.Text = '6403')) then
          faturado := '1'
        else
          faturado := '3';
      end;
    end
    else
    begin
      if ((Fr_vendas_industria2.Prcod_fiscal.Text = '5102') or
        (Fr_vendas_industria2.Prcod_fiscal.Text = '6102') or
        (Fr_vendas_industria2.Prcod_fiscal.Text = '5101') or
        (Fr_vendas_industria2.Prcod_fiscal.Text = '6101') or
        (Fr_vendas_industria2.Prcod_fiscal.Text = '5405') or
        (Fr_vendas_industria2.Prcod_fiscal.Text = '6403')) then
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
      sqlNfe := 'update vendas1 set ' +
        '  RECIBO_NFE =' + quotedstr(recibo) +
        ', STATUS_NFE = ' + status +
        ', MOTIVO_NFE = ' + quotedstr(motivo);

      if digest <> 'null' then
        sqlNfe := sqlNfe + ' , DIGEST_NFE = ' + quotedstr(digest);

      if protocolo <> 'null' then
        sqlNfe := sqlNfe + ' , PROTOCOLO_NFE = ' + quotedstr(protocolo);

      sqlNfe := sqlNfe +
        ', DATA_REC_NFE = ' + quotedstr(formatdatetime('dd/mm/yyyy hh:mm:ss',
        data)) +
        ', EMAIL_NFE = 0 ' +
        ', FATURADO     = ' + faturado +
        ' where numdoc =' + Fr_vendas_industria2.PrNumdoc.text;
    end
    else
    begin
      sqlNfe := 'update vendas1 set ' +
        '  RECIBO_NFE_DEV =' + quotedstr(recibo) +
        ', STATUS_NFE_DEV = ' + status +
        ', MOTIVO_NFE_DEV = ' + quotedstr(motivo);

      if digest <> 'null' then
        sqlNfe := sqlNfe + ' , DIGEST_NFE_DEV = ' + quotedstr(digest);

      if protocolo <> 'null' then
        sqlNfe := sqlNfe + ' , PROTOCOLO_NFE_DEV = ' + quotedstr(protocolo);

      sqlNfe := sqlNfe +
        ', DATA_REC_NFE_DEV = ' +
        quotedstr(formatdatetime('dd/mm/yyyy hh:mm:ss', data)) +
        ' where numdoc =' + Fr_vendas_industria2.PrNumdoc.text;

    end;
    try
      if not (dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      dao.Execsql(sqlNfe);
      dao.cn.Commit;
    except
      dao.cn.Rollback;
    end;

    dao.Geral4('SELECT COD_PRODUTO, QTD FROM VENDAS2 WHERE NUMDOC = ' +
      Fr_vendas_industria2.PrNumdoc.text);
    dao.Q4.First;

    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    while not dao.Q4.eof do
    begin
      Fmfun.atualiza_estoque_geral(dao.Q4.fieldbyname('COD_PRODUTO').AsString);
      dao.Q4.Next;
    end;
    dao.cn.CommitRetaining;

    {    try
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

  Fr_vendas_industria2.XMLNFe.Active := true;
  Fr_vendas_industria2.XMLNFe.loadfromfile(pathSaida + 'ReciboLote.xml');
  recibo :=
    Fr_vendas_industria2.XMLNFe.DocumentElement.ChildNodes.FindNode('nRec').text;
  Fr_vendas_industria2.XMLNFe.Active := false;
  //  DeleteFile(pathSaida + 'ReciboLote.xml');

  AtualizaStatusNFe;

end;

procedure TFr_vendas_industria2.CarregaFoto(produto: string);
begin
  q_foto.Close;
  q_foto.ParamByName('produto').AsString := produto;
  q_foto.Open;

  zzReal.Value := q_foto.fieldbyname('QTD_ESTOQUE').AsDouble;
  zzReservado.Value := q_foto.fieldbyname('QTD_RESERVADO').AsDouble;
  zzTotal.Value := q_foto.fieldbyname('QTD_TOTAL').AsDouble;
  zzCusto.Value := mmVendas2PRECO_CUSTO.Value;
  //  showmessage('1');
  zzTot_custo.Value := mmVendas2PRECO_CUSTO.Value * mmVendas2QTD.Value;
  if zzTot_custo.Value > 0 then
    zz_Lucro_Produto.Value := ((mmVendas2SUB_TOTAL.Value / zzTot_custo.Value) -
      1) * 100
  else
    zz_Lucro_Produto.Value := 0;
  // showmessage('2');

  zzunidade.text := q_foto.fieldbyname('UNIDADE').AsString;
  zzqtd_embalagem.value := q_foto.fieldbyname('QTD_EMBALAGEM').AsDouble;

  if q_foto.fieldbyname('imagem_bd').IsNull then
  begin
    foto.Picture := nil;
    exit;
  end;

  try
    q_foto.fieldbyname('imagem_bd').SaveToFile('foto.jpg');
    foto.Picture.LoadFromFile('foto.jpg');
    DeleteFile('foto.jpg');
  except
    q_foto.fieldbyname('imagem_bd').SaveToFile('foto.bmp');
    foto.Picture.LoadFromFile('foto.bmp');
    DeleteFile('foto.bmp');
  end;

end;

function TFr_vendas_industria2.ChecarDataUltConsultaSerasa: boolean;
begin
  if (UltConsSerasa + 180 < Today) {and not ChecarPedidoLiberado} then
  begin
    dao.msg('Data de 180 dias após a Ultima Consulta ao SERASA/SPC expirou. Favor fazer uma nova consulta.');
    { if fmfun.Dc_MessageDlg('Data de 180 dias após a Ultima Consulta ao SERASA expirou. Favor fazer uma nova consulta.', mtConfirmation, [mbyes, mbno], 0, mrno) = mryes then
    begin
      Application.CreateForm(TFr_senha_especial, Fr_senha_especial);
      Fr_senha_especial.nivel := '5';
      Fr_senha_especial.ShowModal;
      if not liberado then
        Result := false
      else
      begin
        if Prnumdoc.Text <> '' then
          dao.Execsql('UPDATE VENDAS1 SET LIBERAR_FATURAMENTO = ''S'' WHERE NUMDOC = ' + Prnumdoc.Text);
        Result := true;
      end;
    end
    else
      Result := false;}
  end
  else
    Result := true;
end;

function TFr_vendas_industria2.VerificarMargem: boolean;
var
  sql_pedido: string;
  function SolicitaLiberacao: boolean;
  begin
    Application.CreateForm(TFr_senha_especial, Fr_senha_especial);
    Fr_senha_especial.nivel := '5';
    Fr_senha_especial.ShowModal;
    Result := liberado;
  end;
begin
  if liberar_margem then
  begin
    Result := true;
    exit;
  end;

  if (margem_lucro_minima > edMargemLucro.Value) and not ChecarPedidoLiberado
    then
  begin
    if
      fmfun.Dc_MessageDlg('Pedido com Margem de Lucro Abaixo da Margem Mínima. Favor solicitar Liberação?', mtConfirmation, [mbyes, mbno], 0, mrno) = mryes then
      Result := SolicitaLiberacao
    else
    begin
      Result := false;
      exit;
    end;
  end
  else
    Result := true;
end;

function TFr_vendas_industria2.ChecarLiberacao: boolean;
begin
  if trim(Prcod_cliente.Text) = '' then
    exit;

  {  dao.Geral1('Select ' +
      '  CL.NOM_CLIENTE, ' +
      '  CR1.titulo, ' +
      '  CR1.dtaven, ' +
      '  CR1.valor, ' +
      '  CR1.sequencia, ' +
      '  CR1.dtarec, ' +
      '  CR1.nr_documento ' +
      'From ' +
      '  cr1 ' +
      'INNER JOIN CLIENTE CL ON (CL.COD_CLIENTE = CR1.COD_CLIENTE) ' +
      'Where (CR1.cod_cliente=' + QuotedStr(Prcod_cliente.Text) + ') and ' +
      '(CR1.dtaven+5 < current_date) and (CR1.dtarec is null)');

    cliente_com_pendencia := dao.q1.RecordCount > 0;
   }

  if not VerificarMargem then
  begin
    Result := false;
    exit;
  end;

  if cliente_com_pendencia and not ChecarPedidoLiberado and not Pedido_AVista
    then
  begin
    if
      fmfun.Dc_MessageDlg('Cliente com Pendência. Efetue a baixa do pagamentos das Faturas em Aberto. Ou Solicitar Liberação?', mtConfirmation, [mbyes, mbno], 0, mrno) = mryes then
    begin
      Application.CreateForm(TFr_senha_especial, Fr_senha_especial);
      Fr_senha_especial.nivel := '5';
      Fr_senha_especial.ShowModal;
      if not liberado then
        Result := false
      else
      begin
        dao.Execsql('UPDATE VENDAS1 SET LIBERAR_FATURAMENTO = ''S'' WHERE NUMDOC = ' + Prnumdoc.Text);
        Result := true;
      end;
    end
    else
      Result := false;
  end
  else
    Result := true;
end;

procedure TFr_vendas_industria2.BtnNFEClick(Sender: TObject);
var
  EmissaoNFe: TNFePedido;
  cBuscarCeritifcado: _BuscarCertificado;
  valor_total: currency;
  x: integer;
begin
  LiberaItemRepetido := false;
  if itens_repetidos then
  begin
    if
      MessageDlg('Produto incluído no Pedido mais de uma vez. Desejas continuar?',
      mtConfirmation, [mbyes, mbno], 0) = mrno then
      exit
    else
      LiberaItemRepetido := true;
  end;

  if not ChecarDadosPedido then
    exit;

  nfe_duplicada := false;
  pc_vendas.TabIndex := 0;

  if mform <> 'vendas_devolucoes' then
    if not ChecarLiberacao then
      exit;

  if not ClienteAceitaSimples then
    exit;

  if obrigatoriedade_peso and (Prpeso_nota.Value = 0) then
  begin
    showmessage('Não pode Emitir Nota Fiscal com Peso igual a Zero.');
    Exit;
  end;

  if mform = 'vendas_devolucoes' then
    if (trim(Probservacoes_nota.Text) = '') then
    begin
      dao.msg('O campo Observações da Nota deve ser Preenchido');
      btaltpedclick(self);
      pc_vendas.TabIndex := 1;
      Probservacoes_nota.SetFocus;
      exit;
    end;

  if (Prtipo_frete.ItemIndex = 0) then
  begin
    dao.msg('O campo Tipo de Frete deve ser Preenchido');
    btaltpedclick(self);
    pc_vendas.TabIndex := 1;
    Prtipo_frete.SetFocus;
    exit;
  end;

  if (Prcod_representante.Text = '') and venda then
  begin
    dao.msg('O campo Representante deve ser Preenchido');
    btaltpedclick(self);
    pc_vendas.TabIndex := 0;
    Prcod_representante.SetFocus;
    exit;
  end;

  if venda then
  begin
    if Prcod_cliente.Text = '' then
    begin
      dao.msg('Campo Cliente deve ser Preenchido!');
      btaltpedclick(self);
      pc_vendas.TabIndex := 0;
      Prcod_cliente.SetFocus;
      exit;
    end;
  end
  else
  begin
    if (Prcod_cliente.Text = '') and (Prcod_fornecedor.Text = '') then
    begin
      dao.msg('Campo Cliente ou Fornecedor deve ser Preenchido!');
      btaltpedclick(self);
      pc_vendas.TabIndex := 0;
      Prcod_cliente.SetFocus;
      exit;
    end;
  end;

  if not ChecarDadosCliente then
    exit;

  if not ChecarDadosTransportadora then
    exit;

  if (Prcod_fop.Text = '') and venda then
  begin
    dao.msg('O campo Forma de Pagamento deve ser Preenchido');
    btaltpedclick(self);
    pc_vendas.TabIndex := 0;
    Prcod_fop.SetFocus;
    exit;
  end;

  if (Prcod_prazo_pgto.Text = '') and venda then
  begin
    dao.msg('O campo Prazo Pagamento deve ser Preenchido');
    btaltpedclick(self);
    pc_vendas.TabIndex := 0;
    Prcod_prazo_pgto.SetFocus;
    exit;
  end;

  if Prempresa_faturar.Text = '' then
  begin
    dao.msg('O campo Empresa deve ser Preenchido');
    btaltpedclick(self);
    pc_vendas.TabIndex := 1;
    Prempresa_faturar.SetFocus;
    exit;
  end;

  if Prcod_fiscal.Text = '' then
  begin
    dao.msg('O campo Código Fiscal deve ser Preenchido');
    btaltpedclick(self);
    pc_vendas.ActivePage := tab_finalizar;
    Prcod_fiscal.SetFocus;
    exit;
  end;

  if (Lbnom_fop.Caption = 'BOLETO') and (trim(PrCONTA_BOLETO.Text) = '') then
  begin
    dao.msg('Na forma de pagamento BOLETO. O campo Banco CC Boleto deve ser preenchido.');
    pc_vendas.ActivePage := tab_mercadorias;
    btaltpedclick(self);
    PrCONTA_BOLETO.SetFocus;
    exit;
  end;

  if mmVendas2.RecordCount = 0 then
  begin
    dao.msg('O Pedido não pode ser Gravado sem Mercadorias Lançadas');
    exit;
  end;

  {  if not habilita_faturamento and (FRPRI.TipUsu < '4') then
    begin
      showmessage('Há itens do Pedido com Desconto acima do Permitido');
      exit;
    end;}

  if cliente_com_pendencia and (FRPRI.TipUsu < '3') then
  begin
    showmessage('Cliente com pendências financeira não pode ser faturado!');
    exit;
  end;

  { if Prcod_transportadora.Text = '' then
   begin
     dao.msg('O campo Transportadora deve ser Preenchido');
     Prcod_transportadora.SetFocus;
     exit;
   end;
   }
  if cliente_pre_cadastrado then
  begin
    dao.msg('CLIENTE PRÉ-CADASTRADO NÃO PODE SER FATURADO!');
    Exit;
  end;

  if cliente_sem_ie then
  begin
    dao.msg('CLIENTE SEM INSCRIÇÃO ESTADUAL!');
    Exit;
  end;

  if faturado then
  begin
    dao.msg('PEDIDO JÁ FATURADO OU CANCELADO!');
    Exit;
  end;

  mostra := true;
  { ChecarFaturamentoLiquido((prtot_liquido.Value - Zztot_custo.Value), Zztot_custo.Value);
   if not liberado then
   begin
     exit;
   end; }
  Prempresa_faturar.ReadOnly := false;
  if trim(PrNFE.Text) = '' then
  begin
    for x := 1 to 2 do
    begin
      dao.Geral4('select CASE WHEN MAX(Nota) IS NULL THEN 1 ELSE MAX(Nota)+1 END AS NFE from ' +
        ' ( SELECT NFE as  nota FROM VENDAS1 WHERE EMPRESA_FATURAR = ' +
        Prempresa_faturar.Text +
        ' union SELECT NFE_dev as nota FROM VENDAS1 WHERE EMPRESA_FATURAR = ' +
        Prempresa_faturar.Text + ')');

      PrNFE.Text := dao.Q4.fieldbyname('NFE').AsString;
    end;

    try
      if not (dao.cn.InTransaction) then
        (dao.cn.StartTransaction);
      dao.Execsql('update vendas1 set nfe=' + QuotedStr(PrNFE.Text) +
        ' where numdoc=' + QuotedStr(Prnumdoc.Text));
      dao.cn.Commit;
      Prempresa_faturar.ReadOnly := true;
    except
      dao.cn.Rollback;
    end;

  end;

  if Prcod_fop.Text <> '' then
  begin
    try
      if not (dao.cn.InTransaction) then
        (dao.cn.StartTransaction);

      faturar(PrNumdoc.Text, Prcod_cliente.Text, Prcod_fop.Text,
        Prcod_prazo_pgto.Text, valor_total, true);

      dao.cn.Commit;
      ativa_cr1(Prnumdoc.Text);
    except
      dao.cn.Rollback;
    end;
  end;

  EmissaoNFe := TNFePedido.Create(cBuscarCeritifcado);
  EmissaoNFe.tipo := 0;
  Application.CreateForm(TFr_nfe_transmissao, Fr_nfe_transmissao);

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

  ///  Fr_nfe_transmissao.BtnOK.Enabled := true;

  Fr_nfe_transmissao.ShowModal;
  if Fr_nfe_transmissao.modalresult = mrok then
  begin
    CarregaDados;

    if prstatus_nfe.Text = '539' then
    begin
      PrChave_NFe.Text := copy(PrMotivo_nfe.Text, pos('chNFe:',
        PrMotivo_nfe.Text) + 6, 44);
      if not dao.cn.InTransaction then
        dao.cn.StartTransaction;
      dao.Execsql('update vendas1 set chave_nfe = ' + quotedstr(PrChave_NFe.Text)
        + ' where numdoc = ' + Prnumdoc.Text);
      dao.cn.Commit;
      btRecXmlClick(Self);
      CarregaDados;
    end
    else if prstatus_nfe.Text = '100' then
      btnDanfeclick(self);

    {  else
      begin
        if not dao.cn.InTransaction then
          dao.cn.StartTransaction;
        dao.Execsql('update vendas1 set nfe = null where numdoc = ' + Prnumdoc.Text);
        dao.cn.Commit;
        prnfe.text := '';
      end;}
  end;
  LiberaItemRepetido := false;
end;

procedure TFr_vendas_industria2.CarregaDados;
begin
  ativa_vendas1(prnumdoc.Text);
  mostra_campos_vendas1('Pr');
  q_vendas1.open;
  if q_vendas1.Active then
  begin
    if q_vendas1.FieldByName('faturado').AsString = '1' then
      SbVendas.Panels[1].Text := '-FATURADO-VENDAS'
    else if q_vendas1.FieldByName('faturado').AsString = '2' then
      SbVendas.Panels[1].Text := '-CANCELADA-'
    else if q_vendas1.FieldByName('faturado').AsString = '3' then
      SbVendas.Panels[1].Text := '-FATURADO-DEVOLUÇÕES, REMESSAS E BONIFICAÇÕES-'
    else if q_vendas1.FieldByName('faturado').AsString = '4' then
      SbVendas.Panels[1].Text := '-DESATIVADO-'
    else if q_vendas1.FieldByName('faturado').AsString = '5' then
      SbVendas.Panels[1].Text := '-NFE DENEGADA-'
    else
    begin
      SbVendas.Panels[1].Text := '-NÃO FATURADO-';
      btnNfe.enabled := true;
    end;

    if (q_vendas1.FieldByName('status_nfe').AsString <> '539') and not
      ((q_vendas1.FieldByName('faturado').AsString = '1') or
      (q_vendas1.FieldByName('faturado').AsString = '3')) then
      LimparBoletos;
  end;

  ativa_vendas2(prnumdoc.Text);
  ativa_cr1(prnumdoc.Text);
  DadosCCe;

  mostra := false;
  carrega_vendas2;

  Pc_vendas.ActivePage := tab_finalizar;
end;

procedure TFr_vendas_industria2.BtnEditarCancelamentoNFeClick(
  Sender: TObject);
begin
  prJUSTIF_CANC_NFE.ReadOnly := false;
  prJUSTIF_CANC_NFE.Enabled := true;
  prJUSTIF_CANC_NFE.SetFocus;
  PrMOTIVO_NFE_CANCEL_INTERNO.ReadOnly := false;
  PrMOTIVO_NFE_CANCEL_INTERNO.Enabled := true;
end;

procedure TFr_vendas_industria2.BtnSairCancelamentoNFeClick(
  Sender: TObject);
begin
  prJUSTIF_CANC_NFE.Clear;
  prJUSTIF_CANC_NFE.ReadOnly := true;
  prJUSTIF_CANC_NFE.Enabled := false;

  PrMOTIVO_NFE_CANCEL_INTERNO.Clear;
  PrMOTIVO_NFE_CANCEL_INTERNO.ReadOnly := true;
  PrMOTIVO_NFE_CANCEL_INTERNO.Enabled := false;

  BtnEnviarCancelamentoNfe.Enabled := false;
  BtnSairCancelamentoNfe.Enabled := false;
end;

procedure TFr_vendas_industria2.BtnEnviarCancelamentoNFeClick(
  Sender: TObject);
var
  CancelNFe: TNfeCancel;
begin
  if trim(prJUSTIF_CANC_NFE.Text) = '' then
  begin
    dao.msg('Para o Cancelamento da NF-e, é necessário informar a Justificativa!');
    prJUSTIF_CANC_NFE.setfocus;
    Exit;
  end;
  if trim(PrMOTIVO_NFE_CANCEL_INTERNO.Text) = '' then
  begin
    dao.msg('Para o Cancelamento da NF-e, é necessário informar a Justificativa Interna!');
    PrMOTIVO_NFE_CANCEL_INTERNO.setfocus;
    Exit;
  end;
  try
    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
    dao.Execsql('UPDATE VENDAS1 SET MOTIVO_NFE_CANCEL_INTERNO = ' +
      quotedstr(PRMOTIVO_NFE_CANCEL_INTERNO.TEXT) + ', JUSTIF_CANC_NFE = ' +
      QUOTEDSTR(PRJUSTIF_CANC_NFE.Text) + ' WHERE NUMDOC = ' + PRNumdoc.Text);
    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;

  Application.CreateForm(TFr_nfe_transmissao, Fr_nfe_transmissao);
  CancelNFe := TNfeCancel.Create(PrChave_NFe.Text,
    FMFUN.AnsiToAscii(prJUSTIF_CANC_NFE.Text), PrPROTOCOLO_NFE.Text, true);
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
  Fr_nfe_transmissao.Height := Fr_nfe_transmissao.Height + (16 * 3);
  Fr_nfe_transmissao.Gauge1.Progress := 0;

  Fr_nfe_transmissao.ShowModal;

  if Fr_nfe_transmissao.modalresult = mrok then
  begin
    ativa_vendas1(prnumdoc.Text);
    ativa_vendas2(prnumdoc.Text);
    mostra_campos_vendas1('Pr');
    carrega_vendas2;
    StatusPedido;
    Pc_vendas.ActivePage := taNfe;

    if MessageDlg('Desejas Clonar o Pedido Cancelado?', mtConfirmation, [mbYes,
      mbno],
        0) = mryes then
      ClonarPedidoCancelado;
  end;
end;

procedure TFr_vendas_industria2.ClonarPedidoCancelado;
var
  novo_numdoc: string;
begin
  LiberaItemRepetido := true;
  try
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    id_pedido := dao.insert('Pr', 'vendas1', 'numdoc', Fr_vendas_industria2,
      'gen_venda1');
    dao.cn.Commit;

    novo_numdoc := id_pedido;
  except
    dao.cn.Rollback;
  end;

  mmVendas2.First;
  try
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    WindowList := DisableTaskWindows(fm_splash.Handle);
    fm_splash.ggProgress.MaxValue := mmVendas2.RecordCount;
    fm_splash.lbStatus.Caption := 'Clonando os Itens do Pedido...';
    fm_splash.ggProgress.progress := 0;
    fm_splash.Show;

    carregando_item := true;
    pc_vendas.TabIndex := 0;
    pnWait.Visible := true;
    while not mmVendas2.Eof do
    begin
      checar_qtd := false;
      mmVendas2.edit;

      if mform = 'vendas_industria' then
      begin
        GravarPedido := true;
        mecod_produtoexit(self);
        btgraClick(self);
      end;

      if mmVendas2CESTA_BASICA.Value then
        cesta_basica := 'S'
      else
        cesta_basica := 'N';

      if mmVendas2COD_SUPERVISOR.asstring = '' then
        supervisor := ', null'
      else
        supervisor := ', ' + QuotedStr(mmVendas2COD_SUPERVISOR.asstring);

      if mmVendas2VLR_COMISSAO.asstring = '' then
        vlr_comissao := ', null'
      else
        vlr_comissao := ', ' + FMFUN.BuscaTroca(mmVendas2VLR_COMISSAO.AsString,
          ',', '.');

      if mmVendas2PERC_COMISSAO.asstring = '' then
        perc_comissao := ', null'
      else
        perc_comissao := ', ' +
          FMFUN.BuscaTroca(mmVendas2PERC_COMISSAO.AsString,
          ',', '.');

      sql_vendas2 := 'INSERT INTO VENDAS2 (NUMDOC, COD_PRODUTO, QTD, ' +
        ' PRECO, PRECO_CUSTO, SUB_TOTAL, DESCONTO, VOLUME, PRECO_BRUTO, PERC_COMISSAO, VLR_COMISSAO, ' +
        ' COD_FISCAL_ITEM, ICMS_ITEM, VLR_ICMS_ST, VLR_BC_ST, VLR_ICMS_ITEM, NCM, VLR_BC, IPI_ITEM, VLR_IPI_ITEM, ' +
        ' VLR_AGR_ITEM, TRIB_ICMS, CESTA_BASICA, COD_SUPERVISOR, PROMOCAO) ' +
        ' VALUES (' + novo_numdoc + ', ' +
        mmVendas2COD_PRODUTO.AsString + ', ' +
        FMFUN.BuscaTroca(mmVendas2QTD.AsString, ',', '.') + ', ' +
        FMFUN.BuscaTroca(mmVendas2PRECO_LIQUIDO.AsString, ',', '.') + ', ' +
        FMFUN.BuscaTroca(mmVendas2PRECO_CUSTO.AsString, ',', '.') + ', ' +
        FMFUN.BuscaTroca(mmVendas2SUB_TOTAL.AsString, ',', '.') + ', ' +
        FMFUN.BuscaTroca(mmVendas2DESCONTO.AsString, ',', '.') + ', ' +
        FMFUN.BuscaTroca(mmVendas2VOLUME.AsString, ',', '.') + ', ' +
        FMFUN.BuscaTroca(mmVendas2PRECO_VENDA.AsString, ',', '.') +
        perc_comissao + vlr_comissao + ', ' +
        mmVendas2COD_FISCAL_ITEM.AsString + ', ' + mmVendas2ICMS_ITEM.AsString +
        ', ' +
        FMFUN.BuscaTroca(mmVendas2VLR_ICMS_ST.AsString, ',', '.') + ', ' +
        FMFUN.BuscaTroca(mmVendas2VLR_BC_ST.AsString, ',', '.') + ', ' +
        FMFUN.BuscaTroca(mmVendas2VLR_ICMS_ITEM.AsString, ',', '.') + ', ' +
        QuotedStr(mmVendas2NCM.AsString) + ', ' +
        FMFUN.BuscaTroca(mmVendas2VLR_BC.AsString, ',', '.') + ', ' +
        FMFUN.BuscaTroca(mmVendas2IPI_ITEM.AsString, ',', '.') + ', ' +
        FMFUN.BuscaTroca(mmVendas2VLR_IPI_ITEM.AsString, ',', '.') + ', ' +
        FMFUN.BuscaTroca(mmVendas2VLR_AGR_ITEM.AsString, ',', '.') + ', ' +
        FMFUN.BuscaTroca(mmVendas2TRIB_ICMS.AsString, ',', '.') + ', ' +
        QuotedStr(cesta_basica) + supervisor + ', ' +
        QuotedStr(mmVendas2PROMOCAO.AsString) + ')';

      dao.Execsql(sql_vendas2);

      //id_item := dao.insert('Me', 'vendas2', 'id', Fr_vendas_industria2, 'gen_venda2');
      fm_splash.ggProgress.AddProgress(1);
      fm_splash.Refresh;
      mmVendas2.next;
    end;
    dao.cn.commit;
  except
    dao.cn.Rollback;
  end;
  try
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    dao.Execsql('update vendas1 set faturado = ''0'', nfe=null, chave_nfe=null, RECIBO_NFE = NULL, STATUS_NFE = NULL, ' +
      ' JUSTIF_CANC_NFE=null, MOTIVO_NFE = NULL, DIGEST_NFE = NULL, PROTOCOLO_NFE = NULL, DATA_REC_NFE = NULL, EMAIL_NFE = NULL ' +
      ' where numdoc = ' + novo_numdoc);

    dao.cn.commit;
  except
    dao.cn.Rollback;
  end;

  EnableTaskWindows(WindowList);
  fm_splash.Hide;

  Pc_vendas.ActivePage := tab_mercadorias;
  mmVendas2.First;

  ativa_vendas1(novo_numdoc);
  ativa_vendas2(novo_numdoc);
  mostra_campos_vendas1('Pr');
  carrega_vendas2;

  StatusPedido;

end;

constructor TNFeCancel.Create(ChaveNfe, Justificativa, Protocolo: string;
  normal: boolean);
begin
  inherited Create(True);
  { Chama o contrutor herdado. Ele irá temporariamente colocar o thread em estado de espera para depois executá-lo. }
  FreeOnTerminate := True; // Libera o objeto após terminar.
  Priority := TpLower;
  { Configura sua prioridade na lista de processos do Sistema operacional. }
  cChaveNFe := ChaveNfe;
  cJustificativa := Justificativa;
  cProtocoloNFe := Protocolo;
  pathSaida := ExtractFilePath(Application.ExeName) + 'nf\';
  entrada := not normal;
  Resume; // Inicia o Thread.
end;

procedure TNFeCancel.MontarEvento;
var
  arquivoNFe, pathSaida, protocolo: string;
  NumeroLote: integer;
begin
  arquivoNFe := cChaveNFe + '-procNFe.xml';
  pathSaida := ExtractFilePath(Application.ExeName) + 'nf\';

  if not FilesExists(pathSaida + arquivoNFe) then
  begin
    try
      dm.FTPNFe.Connect;
      if dm.FTPNFe.Connected then
      begin
        // transfere um arquivo texto
        dm.FTPNFe.TransferType := ftASCII;
        //      arquivoNFe := PrChave_NFe.text + '-nfe.xml';
        dm.FTPNFe.get(arquivoNFe, pathSaida + arquivoNFe);
        dm.FTPNFe.Quit;
      end;
    except
      dm.FTPNFe.Quit;
      showmessage('Erro ao carregar Arquivo no FTP...');
      deletefile(pathSaida + arquivoNFe);
      exit;
    end;
  end;
  Fr_vendas_industria2.ACBrNFe1.NotasFiscais.Clear;
  // numero do lote de envio (somente um exemplo, pode-se utilizar seu proprio controle)
  NumeroLote := StrToInt(FormatDateTime('yymmddhhmm', NOW));

  // carregar o xml da nota fiscal eletronica, pode ser omitido
  Fr_vendas_industria2.ACBrNFe1.NotasFiscais.Clear;
  if not Fr_vendas_industria2.ACBrNFe1.NotasFiscais.LoadFromFile(pathSaida +
    arquivoNFe) then
    raise
      Exception.Create('Não foi possível carregar o XML da Nota Fiscal Eletrônica correspondente!');

  // Criar o cancelamento
  Fr_vendas_industria2.ACBrNFe1.EventoNFe.Evento.Clear;
  Fr_vendas_industria2.ACBrNFe1.EventoNFe.idLote := NumeroLote;

  dao.Geral2('SELECT a.CNPJ FROM EMPRESA a WHERE cod_empresa=' +
    QuotedStr(Fr_vendas_industria2.Prempresa_faturar.Text));
  with Fr_vendas_industria2.ACBrNFe1.EventoNFe.Evento.Add do
  begin
    infEvento.chNFe := cChaveNFe;
    infEvento.CNPJ := FRPRI.LimpaCNPJ(dao.Q2.fieldbyname('CNPJ').AsString);
    infEvento.dhEvento := NOW;
    infEvento.tpEvento := teCancelamento;
    infEvento.detEvento.nProt := cProtocoloNFe;
    infEvento.detEvento.xJust := cJustificativa;
  end;
  Fr_vendas_industria2.ACBrNFe1.Configuracoes.WebServices.Ambiente :=
    FMFUN.BuscaAmbienteNFE;
  // Enviar o evento de cancelamento
  if Fr_vendas_industria2.ACBrNFe1.EnviarEventoNFe(NumeroLote) then
  begin
    with Fr_vendas_industria2.ACBrNFe1.WebServices.EnvEvento do
    begin
      if EventoRetorno.retEvento.Items[0].RetInfEvento.cStat <> 135 then
      begin
        erro := true;
        msgerros := EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo;
        exit;

        {raise Exception.CreateFmt(
          'Ocorreu o seguinte erro ao cancelar a nota fiscal eletrônica:' + sLineBreak +
          'Código:%d' + sLineBreak +
          'Motivo: %s', [
          EventoRetorno.retEvento.Items[0].RetInfEvento.cStat,
            EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo
            ]);}
      end;

      // retornos

      DataHoraEvento :=
        EventoRetorno.retEvento.Items[0].RetInfEvento.dhRegEvento;
      NumeroProtocolo := EventoRetorno.retEvento.Items[0].RetInfEvento.nProt;
      XMLCancelamento := EventoRetorno.retEvento.Items[0].RetInfEvento.XML;
      CodigoStatus := EventoRetorno.retEvento.Items[0].RetInfEvento.cStat;
      MotivoStatus := EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo;

    end;
  end
  else
  begin
    with Fr_vendas_industria2.ACBrNFe1.WebServices.EnvEvento do
    begin
      raise Exception.Create(
        'Ocorreram erros ao tentar efetuar o cancelamento:' + sLineBreak +
        'Lote: ' + IntToStr(EventoRetorno.idLote) + sLineBreak +
        'Ambiente: ' + TpAmbToStr(EventoRetorno.tpAmb) + sLineBreak +
        'Orgao: ' + IntToStr(EventoRetorno.cOrgao) + sLineBreak +
        sLineBreak +
        'Status: ' + IntToStr(EventoRetorno.cStat) + sLineBreak +
        'Motivo: ' + EventoRetorno.xMotivo
        );
    end;
  end;
end;

procedure TNFeCancel.Execute;
var
  reciboLst: TStringList;
  smensagem: wideString;
begin

  CoInitialize(nil);

  cont := 1;

  try
    smensagem :=
      Fr_vendas_industria2.ACBrNFe1.Configuracoes.Certificados.SelecionarCertificado;
  except
    on E: Exception do
    begin
      erro := true;
      msgerros := E.Message;
      exit;
    end;
  end;

  Synchronize(Mostra);

  frpri.DesabilitaTimers;
  {    if FMFUN.BuscaAmbienteNFE = taProducao then
        tipAmb := 1
      else
        tipAmb := 2;}
  cont := 2;
  Synchronize(Mostra);
  MontarEvento;

  {    Fr_vendas_industria2.ACBrNFe1.Configuracoes.WebServices.Ambiente := FMFUN.BuscaAmbienteNFE;

      Fr_vendas_industria2.ACBrNFe1.WebServices.Cancelamento.NFeChave := cChaveNFe;
      Fr_vendas_industria2.ACBrNFe1.WebServices.Cancelamento.Protocolo := cProtocoloNFe;
      Fr_vendas_industria2.ACBrNFe1.WebServices.Cancelamento.Justificativa := cJustificativa;
      Fr_vendas_industria2.ACBrNFe1.WebServices.Cancelamento.Executar;

      reciboLst := TStringList.Create;
      reciboLst.add(UTF8Encode(Fr_vendas_industria2.ACBrNFe1.WebServices.Cancelamento.RetWS));
      reciboLst.savetofile(pathSaida + 'ReciboLote.xml');
      reciboLst.free;
       }
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

  CoUnInitialize;
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
    Fr_nfe_transmissao.Gauge1.visible := false;
    Fr_nfe_transmissao.lbResultado.Visible := true;
    Fr_nfe_transmissao.MsgErro.Visible := true;
    Fr_nfe_transmissao.MsgErro.Text := msgerros;
    Fr_nfe_transmissao.MsgErro.Height := Fr_nfe_transmissao.Panel1.Height -
      Fr_nfe_transmissao.MsgErro.Top;
    Fr_nfe_transmissao.lbResultado.Caption := 'Houve erro no processo.';
    Fr_nfe_transmissao.BTNOK.MODALRESULT := MRCANCEL;
    frpri.HabilitaTimers;
  end;

  if finalizado then
  begin
    Fr_nfe_transmissao.Gauge1.visible := false;
    Fr_nfe_transmissao.lbResultado.Visible := true;
    Fr_nfe_transmissao.lbResultado.Caption := 'Processo realizado com sucesso.';
    frpri.HabilitaTimers;
  end;

  Fr_nfe_transmissao.Update;
  //Sleep(2000);
end;

procedure TNFeCancel.LimparArquivos;
var
  F: TSearchRec;
  Ret: Integer;
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

procedure TNFeCancel.GravarReciboNfe;
var
  cTransmissaoXML: _TransmissaoXML;
  strVersaoDados, strCabecXML, strDados, status, motivo, protocolo, digest,
    dataStr: string;
  reciboLst: TStringList;
  data: TDateTime;

  procedure SetaData;
  var
    dataarr: TStringList;
    horastr: string;
  begin
    horastr := copy(datastr, pos('T', datastr) + 1, 8);
    datastr := copy(datastr, 1, pos('T', datastr) - 1);
    dataarr := TStringList.create;
    dataarr := FMFUN.explode(datastr, '-');
    datastr := dataarr[2] + '/' + dataarr[1] + '/' + dataarr[0];
    dataarr.free;
    data := strtodatetime(datastr + ' ' + horastr);
  end;

  procedure ConsultaStatusNFe(ChaveNFe: string);
  begin

    status := inttostr(CodigoStatus);
    motivo := 'Cancelamento';
    protocolo := NumeroProtocolo;
    datastr := formatdatetime('dd/mm/yyyy hh:mm:ss', DataHoraEvento);

    {    Fr_vendas_industria2.XMLNFe.Active := true;
    Fr_vendas_industria2.XMLNFe.loadfromfile(pathSaida + 'ReciboLote.xml');

    status := Fr_vendas_industria2.XMLNFe.DocumentElement.ChildNodes.FindNode('infCanc').ChildNodes.FindNode('cStat').text;
    motivo := Fr_vendas_industria2.XMLNFe.DocumentElement.ChildNodes.FindNode('infCanc').ChildNodes.FindNode('xMotivo').text;
    if status = '101' then
    begin
      protocolo := Fr_vendas_industria2.XMLNFe.DocumentElement.ChildNodes.FindNode('infCanc').ChildNodes.FindNode('nProt').text;
      datastr   := Fr_vendas_industria2.XMLNFe.DocumentElement.ChildNodes.FindNode('infCanc').ChildNodes.FindNode('dhRecbto').text;
      SetaData;
    end
    else
    begin
      erro := true;
      msgerros := motivo;
    end;

    Fr_vendas_industria2.XMLNFe.Active := false;
}
  end;

  function AtualizaStatusNFe: Boolean;
  begin
    ConsultaStatusNFe(Fr_vendas_industria2.PrChave_NFe.Text);
    Synchronize(Mostra);
    if erro then
      exit;
    try
      if not entrada then
      begin
        if not (dao.cn.InTransaction) then
          dao.cn.StartTransaction;
        dao.Execsql('update vendas1 set ' +
          '  STATUS_NFE = ' + status +
          ', FATURADO   = 2 ' +
          ', MOTIVO_NFE = ' + quotedstr(motivo) +
          ', PROTOCOLO_NFE = ' + quotedstr(protocolo) +
          ', DATA_REC_NFE = ' + quotedstr(FORMATDATETIME('dd/mm/yyyy hh:mm:ss',
          data)) +
          ' where numdoc =' + Fr_vendas_industria2.Prnumdoc.Text);
      end
      else
      begin
        dao.Execsql('update vendas1 set ' +
          '  STATUS_NFE_DEV = ' + status +
          ', MOTIVO_NFE_DEV = ' + quotedstr(motivo) +
          ', PROTOCOLO_NFE_DEV = ' + quotedstr(protocolo) +
          ', DATA_REC_NFE_DEV = ' +
          quotedstr(FORMATDATETIME('dd/mm/yyyy hh:mm:ss',
          data)) +
          ' where numdoc =' + Fr_vendas_industria2.Prnumdoc.Text);
      end;
      {    Fr_vendas_industria2.q_vendas2.First;
          while not (Fr_vendas_industria2.q_vendas2.Eof) do
          begin
            FRPRI.atualiza_estoque(Fr_vendas_industria2.q_vendas2.fieldbyname('cod_produto').AsString, 'E', Fr_vendas_industria2.q_vendas2.fieldbyname('qtd').AsString, 'R');
            FRPRI.atualiza_estoque(Fr_vendas_industria2.q_vendas2.fieldbyname('cod_produto').AsString, 'E', Fr_vendas_industria2.q_vendas2.fieldbyname('qtd').AsString, 'RS');

            Fr_vendas_industria2.q_vendas2.Next;
          end;}
      dao.cn.Commit;
    except
      dao.cn.Rollback;
    end;
    Fr_vendas_industria2.LimparBoletos;
  end;

begin
  cont := 3;
  Synchronize(Mostra);

  AtualizaStatusNFe;

end;

procedure TFr_vendas_industria2.BtnDanfeClick(Sender: TObject);
begin
  ImprimirDanfe(PrChave_NFe.text);
end;

procedure TFr_vendas_industria2.PrJUSTIF_CANC_NFEChange(Sender: TObject);
begin
  if Length(prJUSTIF_CANC_NFE.Text) >= 15 then
  begin
    BtnEnviarCancelamentoNfe.Enabled := true;
    BtnSairCancelamentoNfe.Enabled := true;
  end
  else
  begin
    BtnEnviarCancelamentoNfe.Enabled := false;
    BtnSairCancelamentoNfe.Enabled := false;
  end;
end;

procedure TFr_vendas_industria2.Prcod_supervisorKeyPress(Sender: TObject;
  var Key: Char);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin
  if not (key in ['0'..'9', #8]) and (key <> #13) then
  begin
    beep; {somente delphi 2.0 ou >}
    key := #0;
  end;

  if key = #13 then
  begin
    if (Prcod_supervisor.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Supervisor';

      chamou_pesquisa := 'fr_supervisor';
      chamou_form := 'fr_pedido_supervisor';
      chamou_cadastro := 'fr_supervisor';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Representante';

      if tipo_usuario < '4' then
        Fr_localizar.BT_cadastro.Visible := false
      else
        Fr_localizar.BT_cadastro.Visible := true;

      //preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo, 5);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Nome';
      Campos_combo[2] := 'Empresa';
      Campos_combo[3] := 'CNPJ';
      Campos_combo[4] := 'CPF';

      for i := 0 to 4 do
      begin
        valor_combo := campos_combo[i];
        Fr_localizar.CBcampos.Items.Add(valor_combo);
      end;

      Fr_localizar.CBcampos.ItemIndex := 1;

      Fr_localizar.ShowModal;
      Fr_localizar.Free;

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;
    end;
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_vendas_industria2.Prcod_supervisorExit(Sender: TObject);
begin
  if trim(Prcod_supervisor.Text) = '' then
    Lbnom_supervisor.Caption := '...';

  if Prcod_supervisor.Text <> '' then
  begin
    if (not FMFUN.verificaNumerico(Prcod_supervisor.Text)) and
      (length(Prcod_supervisor.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      Prcod_supervisor.SetFocus;
      exit;
    end;

    dao.Geral2('select nom_representante from representante where ativo = ''S'' and funcionario in (''0'', ''1'', ''4'') and id=' + QuotedStr(Prcod_supervisor.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_supervisor.Caption :=
        dao.Q2.fieldbyname('nom_representante').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_supervisor.Text := '';
      Prcod_supervisor.SetFocus;
      Exit;
    end;
  end;
end;

procedure TFr_vendas_industria2.Prcod_supervisorButtonClick(
  Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  if (Prcod_supervisor.Text = '') then
  begin
    Application.CreateForm(TFr_localizar, Fr_localizar);

    //guardar os valores antigos
    chamou_form_old := chamou_form;
    chamou_pesquisa_old := chamou_pesquisa;

    Fr_localizar.Caption := 'Localizar Supervisor';

    chamou_pesquisa := 'fr_supervisor';
    chamou_form := 'fr_pedido_supervisor';
    chamou_cadastro := 'fr_supervisor';

    Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Supervisor';

    //preenchendo o combo box com os campos desejados para pesquisar.
    SetLength(Campos_combo, 5);
    Campos_combo[0] := 'Codigo';
    Campos_combo[1] := 'Nome';
    Campos_combo[2] := 'Empresa';
    Campos_combo[3] := 'CNPJ';
    Campos_combo[4] := 'CPF';

    for i := 0 to 4 do
    begin
      valor_combo := campos_combo[i];
      Fr_localizar.CBcampos.Items.Add(valor_combo);
    end;

    Fr_localizar.CBcampos.ItemIndex := 1;

    Fr_localizar.ShowModal;
    Fr_localizar.Free;

    chamou_form := chamou_form_old;
    chamou_pesquisa := chamou_pesquisa_old;
  end;
end;

procedure TFr_vendas_industria2.Timer1Timer(Sender: TObject);
begin
  {  if dao.terminal_nfe then
        CheckStatusNFe;}

  if lbSituacao.Caption <> '' then
  begin
    situacaoTm := lbSituacao.Caption;
    lbSituacao.Caption := '';
  end
  else
    lbSituacao.Caption := situacaoTm;

  if sbvendas.Panels[1].Text <> '' then
  begin
    statusTm := sbvendas.Panels[1].Text;
    sbvendas.Panels[1].Text := '';
  end
  else
    sbvendas.Panels[1].Text := statusTm;

end;

procedure TFr_vendas_industria2.Prcod_fornecedorExit(Sender: TObject);
begin
  if trim(Prcod_fornecedor.Text) <> '' then
  begin
    if (not FMFUN.verificaNumerico(Prcod_fornecedor.Text)) and
      (length(Prcod_fornecedor.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      Prcod_fornecedor.SetFocus;
      exit;
    end;

    dao.Geral2('select RAZAO_SOCIAL, CNPCPF, cd.nom_cidade, cd.uf, CASE WHEN (c.IERG is null or c.IERG = ''ISENTO'') THEN ''1'' ELSE ''0'' END AS ISENTO from fornecedor c ' +
      'left join cidades cd on cd.cod_cidade=c.cod_cidade ' +
      'where cod_fornecedor=' + QuotedStr(Prcod_fornecedor.Text));

    if dao.q2.RecordCount > 0 then
    begin
      LbNom_fornecedor.Caption := dao.Q2.fieldbyname('razao_social').AsString;
      lbCnpj_forn.Caption := dao.Q2.fieldbyname('CNPCPF').AsString;
      lbcidade_forn.Caption := 'Cidade: ' +
        dao.Q2.fieldbyname('nom_cidade').AsString + '/' +
        dao.Q2.fieldbyname('uf').AsString;
      if dao.Q2.fieldbyname('isento').AsString = '1' then
        cliente_isento_icms := true
      else
        cliente_isento_icms := false;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_fornecedor.Text := '';
      Exit;
    end;
  end
  else
  begin
    LbNom_fornecedor.Caption := '...';
    lbCnpj_forn.Caption := 'Cnpj:';
    lbcidade_forn.Caption := 'Cidade:';
  end;
end;

procedure TFr_vendas_industria2.Prcod_fornecedorButtonClick(
  Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  //guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Fornecedor';
  chamou_pesquisa := 'fr_fornecedor';
  chamou_form := 'fr_saida_fornecedor';
  chamou_cadastro := 'Fr_fornecedor';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Fornecedores';
  Fr_localizar.BT_cadastro.Visible := true;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 4);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Razão Social';
  Campos_combo[2] := 'Fantasia';
  Campos_combo[3] := 'Cidade';

  for i := 0 to 3 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  Fr_localizar.ShowModal;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
end;

procedure TFr_vendas_industria2.FaturamentoAvulso1Click(Sender: TObject);
begin
  LiberaItemRepetido := false;
  if itens_repetidos then
  begin
    if
      MessageDlg('Produto incluído no Pedido mais de uma vez. Desejas continuar?',
      mtConfirmation, [mbyes, mbno], 0) = mrno then
      exit
    else
      LiberaItemRepetido := true;
  end;

  pc_vendas.TabIndex := 0;

  if not ChecarDadosPedido then
    exit;

  if not ChecarLiberacao then
    exit;

  if (Prcod_representante.Text = '') and venda then
  begin
    dao.msg('O campo Representante deve ser Preenchido');
    btaltpedclick(self);
    Prcod_representante.SetFocus;
    exit;
  end;

  if venda then
  begin
    if Prcod_cliente.Text = '' then
    begin
      dao.msg('Campo Cliente deve ser Preenchido!');
      btaltpedclick(self);
      Prcod_cliente.SetFocus;
      exit;
    end;
  end
  else
  begin
    if (Prcod_cliente.Text = '') and (Prcod_fornecedor.Text = '') then
    begin
      dao.msg('Campo Cliente ou Fornecedor deve ser Preenchido!');
      btaltpedclick(self);
      Prcod_cliente.SetFocus;
      exit;
    end;
  end;

  if not ChecarDadosCliente then
    exit;

  if not ChecarDadosTransportadora then
    exit;

  if (Prcod_fop.Text = '') and venda then
  begin
    dao.msg('O campo Forma de Pagamento deve ser Preenchido');
    btaltpedclick(self);
    Prcod_fop.SetFocus;
    exit;
  end;

  if (Prcod_prazo_pgto.Text = '') and venda then
  begin
    dao.msg('O campo Prazo Pagamento deve ser Preenchido');
    btaltpedclick(self);
    Prcod_prazo_pgto.SetFocus;
    exit;
  end;

  if Prempresa_faturar.Text = '' then
  begin
    dao.msg('O campo Empresa deve ser Preenchido');
    btaltpedclick(self);
    pc_vendas.ActivePage := tab_finalizar;
    Prempresa_faturar.SetFocus;
    exit;
  end;

  if Prcod_fiscal.Text = '' then
  begin
    dao.msg('O campo Código Fiscal deve ser Preenchido');
    btaltpedclick(self);
    pc_vendas.ActivePage := tab_finalizar;
    Prcod_fiscal.SetFocus;
    exit;
  end;

  if mmVendas2.RecordCount = 0 then
  begin
    dao.msg('O Pedido não pode ser Gravado sem Mercadorias Lançadas');
    exit;
  end;

  { if not habilita_faturamento and (FRPRI.TipUsu < '4') then
   begin
     showmessage('Há itens do Pedido com Desconto acima do Permitido');
     exit;
   end;}

  if cliente_com_pendencia and (FRPRI.TipUsu < '3') then
  begin
    showmessage('Cliente com pendências financeira não pode ser faturado!');
    exit;
  end;

  if trim(Prnumdoc.Text) = '' then
    exit;

  if (Lbnom_fop.Caption = 'BOLETO') and (trim(PrCONTA_BOLETO.Text) = '') then
  begin
    dao.msg('Na forma de pagamento BOLETO. O campo Banco CC Boleto deve ser preenchido.');
    pc_vendas.ActivePage := tab_mercadorias;
    btaltpedclick(self);
    PrCONTA_BOLETO.SetFocus;
    exit;
  end;

  mostra := true;
  //ChecarFaturamentoLiquido((prtot_liquido.Value - Zztot_custo.Value), Zztot_custo.Value);
{  if not liberado then
    exit; }

  dao.Geral4('SELECT CASE WHEN CHAVE_NFE IS NOT NULL THEN ''N'' ELSE ''S'' END AS HABILITADO FROM VENDAS1 WHERE NUMDOC = ' + Prnumdoc.Text);
  if dao.Q4.FieldByName('HABILITADO').AsString = 'S' then
  begin
    if MessageDlg('Desejas efetuar o processo de Faturamento Avulso?',
      mtConfirmation, [mbyes, mbno], 0) = mryes then
    begin
      prnfe.Clear;
      try
        if not (dao.cn.InTransaction) then
          (dao.cn.StartTransaction);
        if (mform = 'vendas_industria') then
        begin
          dao.Execsql('update vendas1 set nfe = null, faturado = 1 where numdoc='
            +
            QuotedStr(Prnumdoc.Text));
          faturar(Prnumdoc.Text, Prcod_cliente.Text, Prcod_fop.Text,
            Prcod_prazo_pgto.Text, Prtot_liquido.Value, false);
        end
        else
          dao.Execsql('update vendas1 set nfe = null, faturado = 3 where numdoc='
            +
            QuotedStr(Prnumdoc.Text));

        dao.grava_log('FATURAMENTO AVULSO - PEDIDO N°: ' + Prnumdoc.Text, '');
        dao.cn.Commit;
      except
        dao.cn.Rollback;
      end;

    end;
    ativa_vendas1(Prnumdoc.Text);
    ativa_vendas2(Prnumdoc.Text);
    mostra_campos_vendas1('Pr');
    ativa_cr1(Prnumdoc.Text);
    StatusPedido;
  end
  else
  begin
    showmessage('Não é permitido Faturado Avulso em Pedidos com NF-e geradas.');
    exit;
  end;
  LiberaItemRepetido := false;
end;

procedure TFr_vendas_industria2.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if column.Field = mmVendas2DESCONTO then
  begin
    dbgrid1.Canvas.Font.Color := clRed;
    if gdSelected in State then
    begin
      dbgrid1.Canvas.Brush.Color := clRed;
      dbgrid1.Canvas.Font.Color := clWhite;
    end;
  end
  else
  begin
    if mmVendas2PROMOCAO.AsString = 'S' then
    begin
      dbgrid1.Canvas.Font.Color := clPurple;
      if gdSelected in State then
      begin
        dbgrid1.Canvas.Brush.Color := clPurple;
        dbgrid1.Canvas.Font.Color := clWhite;
      end;
    end
    else
    begin
      dbgrid1.Canvas.Font.Color := clNavy;
      if gdSelected in State then
      begin
        dbgrid1.Canvas.Brush.Color := clNavy;
        dbgrid1.Canvas.Font.Color := clWhite;
      end;
    end;
  end;

  dbgrid1.DefaultDrawDataCell(rect, Column.Field, State);
  if column.Field = mmVendas2CESTA_BASICA then
  begin
    dbgrid1.Canvas.FillRect(Rect);

    if mmVendas2CESTA_BASICA.Value then
      ImageList1.Draw(dbGrid1.Canvas, Rect.Left, Rect.Top + 1, 0);
  end;
end;

procedure TFr_vendas_industria2.Mecod_produtoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F9 then
    Mecod_produtoButtonClick(Self);
end;

procedure TFr_vendas_industria2.MeTrib_ICMSExit(Sender: TObject);
const
  //  cst_lst: array[0..10] of string = ('00', '10', '20', '30', '40', '41', '50', '51', '60', '70', '90');
  cst_lst: array[0..3] of string = ('00', '10', '60', '90');
var
  x: integer;
  valido: boolean;
begin
  if Length(trim(MeTrib_ICMS.Text)) = 0 then
    exit;
  valido := false;
  for x := 0 to 3 do
  begin
    if MeTrib_ICMS.Text = cst_lst[x] then
      valido := true;
  end;
  if not valido and (MeTrib_ICMS.visible = true) then
  begin
    ShowMessage('CST Inválida!');
    Pc_vendas.ActivePageIndex := 0;
    if mmVendas2.State in [dsedit] then
      mmVendas2.Edit;
    MeTrib_ICMS.SetFocus;
    Exit;
  end
  else
  begin
    if MeTrib_ICMS.Text = '00' then
    begin
      if UF_Cliente = UF_Emissor then
        mmVendas2icms_item.Value := 17
      else
        mmVendas2icms_item.Value := 12;
    end;
  end;
end;

procedure TFr_vendas_industria2.Meipi_itemExit(Sender: TObject);
begin
  if mmVendas2ipi_item.Value > 0 then
    mmVendas2vlr_ipi_item.Value := mmVendas2sub_total.Value *
      (mmVendas2ipi_item.Value / 100)
  else
    mmVendas2vlr_ipi_item.Value := 0;
end;

procedure TFr_vendas_industria2.DBGrid1Enter(Sender: TObject);
begin
  CarregaFoto(mmVendas2cod_produto.AsString);
end;

procedure TFr_vendas_industria2.DBGrid1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  CarregaFoto(mmVendas2cod_produto.AsString);
end;

procedure TFr_vendas_industria2.DBGrid1CellClick(Column: TColumn);
begin
  CarregaFoto(mmVendas2cod_produto.AsString);
end;

procedure TFr_vendas_industria2.DBGrid1MouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  CarregaFoto(mmVendas2cod_produto.AsString);
end;

procedure TFr_vendas_industria2.DBGrid1MouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  CarregaFoto(mmVendas2cod_produto.AsString);
end;

procedure TFr_vendas_industria2.Mecod_fiscal_itemButtonClick(
  Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  //guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Código Fiscal';
  chamou_pesquisa := 'fr_cod_fiscal';
  chamou_form := 'fr_pedidos_item_cod_fiscal';
  chamou_cadastro := 'Fr_cod_fiscal';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Códigos Fiscais';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';

  for i := 0 to 1 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 0;

  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
end;

procedure TFr_vendas_industria2.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    //se for, passa o foco para o próximo campo, zerando o valor da variável Key
    if Probservacoes_pedido.visible and Probservacoes_nota.visible then
      if (ActiveControl.Name = 'Probservacoes_pedido') or
        (ActiveControl.Name = 'Probservacoes_nota') then
        exit;
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TFr_vendas_industria2.Meicms_itemExit(Sender: TObject);
begin
  if mmVendas2ICMS_ITEM.Value > 0 then
    mmVendas2VLR_ICMS_ITEM.Value := mmVendas2sub_total.Value *
      (mmVendas2ICMS_ITEM.Value / 100)
  else
    mmVendas2VLR_ICMS_ITEM.Value := 0;
end;

procedure TFr_vendas_industria2.CancelamentoAvulso1Click(Sender: TObject);
begin
  if (PrNumDoc.Text <> '') and (btnov.Enabled = true) then
    dao.Geral2('select faturado, chave_nfe from vendas1 where numdoc=' +
      QuotedStr(PrNumDoc.Text))
  else
    exit;

  if dao.Q2.FieldByName('faturado').AsString <> '0' then
  begin
    dao.msg('Venda Faturada ou Cancelada!');
    exit;
  end;

  if messagedlg('Deseja Cancelar essa Venda?', mtConfirmation, [mbYes, mbNo], 0)
    = mryes then
  begin
    cancelamento_avulso;
  end;
end;

procedure TFr_vendas_industria2.ImprimirPedidoDetalhado1Click(
  Sender: TObject);
var
  path, cmd: string;
begin

  if (FRPRI.TipUsu = '0') or (FRPRI.TipUsu = '1') then
    exit;

  if not ChecarDadosCliente then
    exit;

  if not ChecarDadosTransportadora then
    exit;

  path := ExtractFilePath(Application.ExeName);
  if Prnumdoc.Text = '' then
  begin
    dao.msg('Selecione um Pedido para Imprimir!');
    exit;
  end;

  if Btgraped.Enabled then
    BtgrapedClick(Self);

  cmd := 'SELECT v.NUMDOC, v.tipo, V.OBS, v.prazo, v.DTADOC, v.DTA_EMISSAO, v.TOT_LIQUIDO, V.DESCONTO_PEDIDO, V.VALOR_CR, v.COD_CLIENTE, v.NOM_CLIENTE, v.CODREP, R.NOM_REPRESENTANTE, v.NOM_BANCO, '
    +
    'v.CLIENTE_ENDERECO, v.cliente_fone as fone_cliente, v.aviso, v.cliente_fax as fax, v.contato, v.CLIENTE_BAIRRO, v.CEP_CLIENTE, v.CLIENTE_CNPJ_CPF, v.CLIENTE_IE_RG, v.CLIENTE_CIDADE, ' +
    'v.NR_BANCO, v.NR_AGENCIA, v.NR_CONTA_CORRENTE, v.EMAIL, v.FONE, v.CELULAR, v.COD_PRODUTO, v.NOM_PRODUTO, v.CUSTO, v.LUCRO, v.PRECO_VENDA_CALC, v.MARGEM, V.USUARIO_LIBEROU_DESCONTO, V.MOTIVO_LIBERACAO_DESCONTO, ' +
    'v.PRECO_VENDA, v.PRECO, v.total_custo, v.DESCONTO, v.QTD, v.SUB_TOTAL, v.VLR_COMISSAO, V.SUBTOTAL_RATEADO, V.VLR_COMISSAO_RATEADO, v.FATURADO, v.SUPERVISAO, v.PERC_COMISSAO, R.PERC_COMISSAO_FIXA, '''' as contido, ' +
    's.NOM_REPRESENTANTE as supervisor ' +
    'FROM V_VENDA v INNER JOIN REPRESENTANTE R ON (R.ID = CODREP) ' +
    'inner join vendas1 v1 on v1.NUMDOC = v.NUMDOC ' +
    'left outer JOIN REPRESENTANTE s ON (s.ID = v1.COD_SUPERVISOR) ' +
    'where v.codrep = ' + Prcod_representante.Text + ' and v.numdoc = ' +
    Prnumdoc.Text;
  cmd := cmd + ' order by NOM_REPRESENTANTE, dtadoc, numdoc, ord_pauta';

  with dm.q_venda_espelho do
  begin
    close;
    sql.Clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_venda_espelho.RecordCount < 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  cmd :=
    'SELECT ' +
    '  distinct Cod_cliente, NR_documento, titulo, HISTORICO, DTAVEN, DTAREC, valor, valor_recebido, SITUACAO, CONTA ' +
    'FROM ' +
    '( ' +
    '    SELECT ' +
    '      Cod_cliente, NR_documento, titulo, HISTORICO, DTAVEN, DTAREC, valor, valor_recebido, SITUACAO, CONTA ' +
    '    FROM ' +
    '      ( ' +
    '        SELECT ' +
    '          FIRST 10 c.cod_cliente, NR_documento, titulo, cast(C.HISTORICO1 as varchar(300)) as historico, DTAVEN, DTAREC, C.valor, valor_recebido, ' +
    '          case when dtarec is null then case when DTAVEN >= current_date then ''À VENCER'' else ''VENCIDO'' END ELSE ''PAGO'' END AS SITUACAO, ' +
    '          case when dtarec is null then ' +
    '            coalesce(CV.NR_AGENCIA||'' ''||CV.NR_CONTA||'' ''||CV.NOM_CONTA, F.NOM_FOP) ' +
    '          Else ' +
    '          coalesce(CC.NR_AGENCIA||'' ''||CC.NR_CONTA||'' ''||CC.NOM_CONTA, ' +
    '          CASE E.TIPO WHEN 0 THEN ''DINHEIRO'' ' +
    '                      WHEN 1 THEN ''CHEQUE PRÓPRIO'' ' +
    '                      WHEN 2 THEN ''CHEQUE DE TERCEIROS'' ' +
    '                      WHEN 3 THEN ''PERMUTA'' ' +
    '                      WHEN 4 THEN ''DESCONTO'' ' +
    '          END) END AS CONTA ' +
    '        FROM ' +
    '          CR1 C ' +
    '        LEFT OUTER JOIN EXTRATO_CR1 EC ON EC.CR1 = C.ID ' +
    '        LEFT OUTER JOIN EXTRATO E ON E.ID = EC.EXTRATO ' +
    '        LEFT OUTER JOIN CONTA_CORRENTE CC ON CC.ID = E.ID_CONTA  ' +
    '        LEFT OUTER JOIN VENDAS1 V ON V.NUMDOC = C.NR_DOCUMENTO ' +
    '        LEFT OUTER JOIN CONTA_CORRENTE CV ON CV.ID = v.CONTA_BOLETO ' +
    '        LEFT OUTER JOIN FOP F ON F.COD_FOP = V.COD_FOP ' +
    '        WHERE ' +
    '          C.COD_CLIENTE = ' + Prcod_cliente.Text +
    '        ORDER BY ' +
    '          COD_CLIENTE, DTAVEN DESC ' +
    '      )   ' +
    '    Union ' +
    '    SELECT ' +
    '      c.Cod_cliente, NR_documento, titulo, cast(C.HISTORICO1 as varchar(300)) as historico, DTAVEN, ' +
    '      DTAREC, C.valor, valor_recebido, case when dtarec is null then case when DTAVEN >= current_date then ''À VENCER'' else ''VENCIDO'' END ELSE ''PAGO'' END AS SITUACAO, ' +
    '          case when dtarec is null then ' +
    '            coalesce(CV.NR_AGENCIA||'' ''||CV.NR_CONTA||'' ''||CV.NOM_CONTA, F.NOM_FOP) ' +
    '          Else ' +
    '          coalesce(CC.NR_AGENCIA||'' ''||CC.NR_CONTA||'' ''||CC.NOM_CONTA, ' +
    '          CASE E.TIPO WHEN 0 THEN ''DINHEIRO'' ' +
    '                      WHEN 1 THEN ''CHEQUE PRÓPRIO'' ' +
    '                      WHEN 2 THEN ''CHEQUE DE TERCEIROS'' ' +
    '                      WHEN 3 THEN ''PERMUTA'' ' +
    '                      WHEN 4 THEN ''DESCONTO'' ' +
    '          END) END AS CONTA ' +
    '    FROM ' +
    '      CR1 C ' +
    '    LEFT OUTER JOIN EXTRATO_CR1 EC ON EC.CR1 = C.ID ' +
    '    LEFT OUTER JOIN EXTRATO E ON E.ID = EC.EXTRATO ' +
    '    LEFT OUTER JOIN CONTA_CORRENTE CC ON CC.ID = E.ID_CONTA ' +
    '    LEFT OUTER JOIN VENDAS1 V ON V.NUMDOC = C.NR_DOCUMENTO ' +
    '    LEFT OUTER JOIN CONTA_CORRENTE CV ON CV.ID = v.CONTA_BOLETO ' +
    '    LEFT OUTER JOIN FOP F ON F.COD_FOP = V.COD_FOP ' +
    '    WHERE ' +
    '      C.COD_CLIENTE = ' + Prcod_cliente.Text +
    '      AND case when dtarec is null then case when DTAVEN >= current_date then ''À VENCER'' else ''VENCIDO'' END ELSE ''PAGO'' END = ''VENCIDO'' ' +
    '  ) ' +
    'ORDER BY ' +
    '  DTAVEN DESC';

  with dm.q_ultimos_cr do
  begin
    close;
    sql.Clear;
    sql.add(cmd);
    open;
  end;
  dm.q_ultimos_cr.Open;

  if dm.q_ultimos_cr.RecordCount < 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not (fr_relatorio.LoadFromFile(path + 'Relatorios\vendas_detalhado.fr3'))
    then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 +
      'Avise o Suporte');
    exit;
  end;

  fr_relatorio.ShowReport;
end;

procedure TFr_vendas_industria2.fR_RELATORIOGetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'empresa' then
    value := nom_empresa
  else if VarName = 'dtaini' then
    value := FormatDateTime('dd/mm/yyyy', now)
  else if VarName = 'dtafin' then
    value := FormatDateTime('dd/mm/yyyy', now);

end;

procedure TFr_vendas_industria2.BtnMaisPrecosClick(Sender: TObject);
var
  tipo_rep: string;
begin
  if trim(mecod_produto.Text) = '' then
  begin
    showmessage('Produto deve ser informado');
    exit;
  end;

  if representante_funcionario then
    tipo_rep := '1'
  else
    tipo_rep := '0';

  try
    Application.CreateForm(Tfm_mais_precos, fm_mais_precos);

    fm_mais_precos.representante := prcod_representante.Text;
    fm_mais_precos.tipo_representante := tipo_rep;
    fm_mais_precos.produto := mmVendas2cod_produto.AsString;

    fm_mais_precos.ShowModal;

    if fm_mais_precos.modalresult = mrOk then
    begin
      mmVendas2preco_liquido.value := fm_mais_precos.preco_selecionado;
      MeprecoExit(self);
    end;
  finally
    fm_mais_precos.Free;
  end;
end;

procedure TFr_vendas_industria2.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  CarregaFoto(mmVendas2cod_produto.AsString);
end;

procedure TFr_vendas_industria2.q_vendas1BeforeOpen(
  IB_Dataset: TIB_Dataset);
begin
  frpri.DesabilitaTimers;
end;

procedure TFr_vendas_industria2.q_vendas2BeforeOpen(
  IB_Dataset: TIB_Dataset);
begin
  frpri.DesabilitaTimers;
end;

procedure TFr_vendas_industria2.q_fotoBeforeOpen(IB_Dataset: TIB_Dataset);
begin
  frpri.DesabilitaTimers;
end;

procedure TFr_vendas_industria2.q_fotoAfterClose(IB_Dataset: TIB_Dataset);
begin
  dao.cn.Commit;
  frpri.HabilitaTimers;
end;

procedure CalculoGeral(cliente: string);
begin

end;

procedure TFr_vendas_industria2.Prcod_clienteChange(Sender: TObject);
begin

  if (cliente_anterior <> '') and (not localizar_acionado) then
    cliente_alterado := true;
end;

procedure TFr_vendas_industria2.MedescontoEnter(Sender: TObject);
begin
  Medesconto.text := stringreplace(Medesconto.Text, '%', '', [rfReplaceAll]);
end;

procedure TFr_vendas_industria2.MontaArquivoCobrancaBradescoEnvio;
var
  txt: TextFile;
  dia, mes, ano, ord, ext, pathSaida, tempFile, nosso_numero, nosso_numero_div,
    sql_cliente: string;
  sequencial_arquivo: integer;
  function CalculaDivNossoNumero(numero: string): string;
  var
    p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13: string;
    soma, resto: integer;
    function converteLetra(letra: string): string;
    var
      variavel: string;
      letter: char;
    begin
      variavel := '';
      letra := uppercase(letra);
      letter := letra[1];

      case letter of //converte letra em número
        'A': variavel := '1';
        'B': variavel := '2';
        'C': variavel := '3';
        'D': variavel := '4';
        'E': variavel := '5';
        'F': variavel := '6';
        'G': variavel := '7';
        'H': variavel := '8';
        'I': variavel := '9';
        'J': variavel := '10';
        'K': variavel := '11';
        'L': variavel := '12';
        'M': variavel := '13';
        'N': variavel := '14';
        'O': variavel := '15';
        'P': variavel := '16';
        'Q': variavel := '17';
        'R': variavel := '18';
        'S': variavel := '19';
        'T': variavel := '20';
        'U': variavel := '21';
        'V': variavel := '22';
        'W': variavel := '23';
        'X': variavel := '24';
        'Y': variavel := '25';
        'Z': variavel := '26';
      end; // case letra
      if variavel = '' then
        variavel := letra;
      result := variavel;
    end;
  begin
    p1 := copy(numero, 1, 1);
    p2 := copy(numero, 2, 1);
    p3 := copy(numero, 3, 1);
    p4 := copy(numero, 4, 1);
    p5 := copy(numero, 5, 1);
    p6 := copy(numero, 6, 1);
    p7 := copy(numero, 7, 1);
    p8 := copy(numero, 8, 1);
    p9 := copy(numero, 9, 1);
    p10 := copy(numero, 10, 1);
    p11 := copy(numero, 11, 1);
    p12 := copy(numero, 12, 1);
    p13 := copy(numero, 13, 1);
    soma := ((strtoint(p1) * 2) + (strtoint(p2) * 7) + (strtoint(p3) * 6) +
      (strtoint(p4) * 5) + (strtoint(p5) * 4) + (strtoint(p6) * 3) +
      (strtoint(p7)
      * 2) + (strtoint(p8) * 7) + (strtoint(p9) * 6) + (strtoint(p10) * 5) +
      (strtoint(p11) * 4) + (strtoint(p12) * 3) + (strtoint(p13) * 2));
    resto := soma mod 11;
    if resto = 1 then
      Result := 'P';
    if resto = 0 then
      Result := '0';
    if not ((resto = 0) or (resto = 1)) then
      Result := inttostr(11 - resto);
  end;
begin
  pathSaida := ExtractFilePath(Application.ExeName);
  tempFile := pathSaida + 'temp.txt';
  dia := formatdatetime('dd', now);
  mes := formatdatetime('mm', now);
  ano := formatdatetime('yy', now);

  dao.Geral4('SELECT MAX(a.ID)+1 AS ID FROM BOLETO_BRADESCO_ORDEM a WHERE a.DIA = ''' + dia + ''' AND A.MES = ''' + mes + '''');
  if dao.q4.fieldbyname('id').isnull then
    ord := '01'
  else
    ord := FMFUN.enchezero(dao.q4.fieldbyname('id').AsString, 2);

  if dao.CN.Path = 'C:\orbi\trunk\dados\orbi.fdb' then
    ext := '.TST'
  else
    ext := '.REM';

  arquivo := pathSaida + 'CB' + dia + mes + ord + ext;

  AssignFile(txt, tempFile);
  Rewrite(txt);

  //CABEÇALHO 0
  sequencial_arquivo := 1;
  Write(txt, ajustastr('0', 1));
  Write(txt, ajustastr('1', 1));
  Write(txt, ajustastr('REMESSA', 7));
  Write(txt, ajustastr('01', 2));
  Write(txt, ajustastr('COBRANCA', 15));
  Write(txt, ajustastr(FMFUN.enchezero('4222894', 20), 20));
  Write(txt, ajustastr(FMFUN.AnsiToAscii(Lbempresa_faturamento.Caption), 30));
  Write(txt, ajustastr('237', 3));
  Write(txt, ajustastr('BRADESCO', 15));
  Write(txt, ajustastr(dia + mes + ano, 6));
  Write(txt, ajustastr('', 8));
  Write(txt, ajustastr('MX', 2));
  Write(txt, ajustastr(FMFUN.enchezero(inttostr(strtoint(ORD)), 7), 7));
  Write(txt, ajustastr('', 277));
  Write(txt, ajustastr(FMFUN.enchezero(inttostr(sequencial_arquivo), 6), 6));
  WriteLn(txt);
  //item
  q_cr1.first;
  while not q_cr1.Eof do
  begin
    Write(txt, ajustastr('1', 1));
    Write(txt, FMFUN.enchezero('0', 5));
    Write(txt, FMFUN.enchezero('0', 1));
    Write(txt, FMFUN.enchezero('0', 5));
    Write(txt, FMFUN.enchezero('0', 7));
    Write(txt, FMFUN.enchezero('0', 1));
    Write(txt, FMFUN.enchezero('0', 1));
    Write(txt, FMFUN.enchezero('9', 3));
    Write(txt, ajustastr('2227', 5));
    Write(txt, ajustastr('0000777', 7));
    Write(txt, ajustastr('3', 1));
    Write(txt, ajustastr('', 25));
    Write(txt, ajustastr('237', 3));
    Write(txt, ajustastr('0', 1));
    Write(txt, FMFUN.enchezero('0', 4));
    nosso_numero := FMFUN.enchezero(q_cr1.FieldByName('titulo').Asstring, 10) +
      FMFUN.enchezero(q_cr1.FieldByName('sequencia').AsString, 2);
    nosso_numero_div := CalculaDivNossoNumero(nosso_numero);
    Write(txt, ajustastr(nosso_numero, 11));
    Write(txt, ajustastr(nosso_numero_div, 1));
    Write(txt, FMFUN.enchezero('0', 10));
    Write(txt, FMFUN.enchezero('2', 1));
    Write(txt, 'N');
    Write(txt, ajustastr('', 11));
    Write(txt, ajustastr('2', 1));
    Write(txt, ajustastr('', 2));
    Write(txt, ajustastr('01', 2));

    Write(txt, ajustastr(q_cr1.FieldByName('titulo').Asstring, 10));
    Write(txt, ajustastr(formatdatetime('ddmmyy',
      q_cr1.FieldByName('dtaven').AsDateTime), 6));
    Write(txt,
      FMFUN.enchezero(stringreplace(FMFUN.DecimalPonto(FormatFloat('##0.00',
      q_cr1.FieldByName('valor').AsFloat)), '.', '', [rfReplaceAll]), 13));
    Write(txt, FMFUN.enchezero('0', 3));
    Write(txt, FMFUN.enchezero('0', 5));
    Write(txt, ajustastr('01', 2));
    Write(txt, ajustastr('N', 1));
    Write(txt, ajustastr(formatdatetime('ddmmyy', now), 6));
    Write(txt, ajustastr('06', 2));
    Write(txt, ajustastr('05', 2));
    Write(txt,
      FMFUN.enchezero(stringreplace(FMFUN.DecimalPonto(FormatFloat('##0.00',
      q_cr1.FieldByName('valor').AsFloat * 0.0017)), '.', '', [rfReplaceAll]),
      13));
    Write(txt, FMFUN.enchezero('0', 6));
    Write(txt, FMFUN.enchezero('0', 13));
    Write(txt, FMFUN.enchezero('0', 13));
    Write(txt, FMFUN.enchezero('0', 13));
    ///dados do Cliente.
    sql_cliente := ' SELECT a.COD_CLIENTE, a.NOM_CLIENTE, a.ENDERECO, a.COMPLEMENTO, a.BAIRRO, a.CEP, a.COD_CIDADE, a.TIP_PESSOA, a.CNPJ, a.CPF, a.NR_ENDERECO, cd.NOM_CIDADE, cd.uf '
      +
      ' FROM CLIENTE a ' +
      ' inner join cidades cd on (cd.COD_CIDADE = a.COD_CIDADE) ' +
      ' where a.cod_cliente = ' + Prcod_cliente.Text;

    dao.Geral4(sql_cliente);
    if (dao.Q4.fieldbyname('TIP_PESSOA').AsString = 'J') then
    begin
      Write(txt, '02');
      Write(txt, ajustastr(FRPRI.LimpaCNPJ(dao.Q4.fieldbyname('CNPJ').AsString),
        14));
      Write(txt, ajustastr(dao.Q4.fieldbyname('NOM_CLIENTE').AsString, 40));
      Write(txt, ajustastr(dao.Q4.fieldbyname('ENDERECO').AsString + ' ' +
        dao.Q4.fieldbyname('NR_ENDERECO').AsString, 40));
      Write(txt, ajustastr(' ', 12));
      Write(txt, ajustastr(COPY(dao.Q4.fieldbyname('CEP').AsString, 1, 5), 5));
      Write(txt, ajustastr(COPY(dao.Q4.fieldbyname('CEP').AsString, 7, 3), 3));
    end;
    Write(txt, ajustastr(' ', 60));
    sequencial_arquivo := sequencial_arquivo + 1;
    Write(txt, ajustastr(FMFUN.enchezero(inttostr(sequencial_arquivo), 6), 6));
    WriteLn(txt);
    q_cr1.next;
  end;
  //RODAPE
  Write(txt, ajustastr('9', 1));
  Write(txt, ajustastr(' ', 393));
  sequencial_arquivo := sequencial_arquivo + 1;
  Write(txt, ajustastr(FMFUN.enchezero(inttostr(sequencial_arquivo), 6), 6));
  WriteLn(txt);

  q_cr1.first;

  CloseFile(txt);
  RenameFile(TempFile, arquivo);
  {  dao.cn.StartTransaction;
    dao.Exec_sql.SQL.Clear;
    dao.Exec_sql.SQL.Add('INSERT INTO BOLETO_BRADESCO_ORDEM (ID, DIA, MES) VALUES ('+ord+','''+dia+''','''+mes+''')');
    dao.Exec_sql.ExecSQL;
    dao.cn.Commit;}
end;

procedure TFr_vendas_industria2.BtnAltFormaPrazoClick(Sender: TObject);
var
  Nfe: boolean;
  valor_total: currency;
begin
  if not q_cr1.FieldByName('BOLETO_REMESSA_ORDEM').IsNull then
  begin
    Showmessage('Não é permitido alterar a forma de Pagamento onde há Boletos Associados à Remessas.');
    exit;
  end;

  if btnAltFormaPrazo.Caption = 'Alterar Forma e Prazo de Pagamento' then
  begin
    BtnBoleto.Enabled := false;
    btnAltFormaPrazo.Caption := 'Gravar Forma e Prazo de Pagamento';
    Prcod_fop.Enabled := true;
    Probservacoes_pedido.Enabled := true;
    Prcod_prazo_pgto.Enabled := true;
    BtnBoleto.Enabled := false;
    BtnEmailBoleto.Enabled := false;
    Prcod_prazo_pgto.setfocus;
  end
  else
  begin
    if trim(prnfe.Text) <> '' then
      Nfe := true
    else
      Nfe := false;

    dao.Geral1('select count(*) as total from cr1 where nr_documento = ' +
      Prnumdoc.Text + ' and valor_recebido > 0');

    if dao.Q1.FieldByName('total').AsInteger = 0 then
    begin
      try
        if not dao.cn.InTransaction then
          dao.cn.StartTransaction;
        dao.update('vendas1', 'numdoc', Prnumdoc.Text, 'Pr',
          Fr_vendas_industria2);
        dao.cn.Commit;
      except
        dao.cn.Rollback;
      end;
      {if not ChecarBoletoNFE(PRCONTA_BOLETO.Text, prnfe.Text) then
        exit;}

      if NFe and (UF_Cliente <> UF_Emissor) then
        valor_total := Prtot_liquido.Value + Prvlr_st.value
      else
        valor_total := Prtot_liquido.Value;
      if gerar_cr then
        GerarParcelas(Prnumdoc.Text, Prcod_cliente.Text, Prcod_fop.Text,
          Prcod_prazo_pgto.Text, valor_total, Nfe);

      ativa_cr1(Prnumdoc.Text);
      FMFUN.AtualizaDadosComissao(Prnumdoc.Text);

      somaTotal;
    end
    else
    begin
      Showmessage('Não é permitido alterar a forma de Pagamento onde há parcelas pagas.');
      BtcanpedClick(Self);
      pc_vendas.TabIndex := 2;
    end;

    btnAltFormaPrazo.Caption := 'Alterar Forma e Prazo de Pagamento';

    ControleBoleto;

    Prcod_fop.Enabled := false;
    Prconta_boleto.Enabled := false;
    Prcod_prazo_pgto.Enabled := false;
    btnAltFormaPrazo.setfocus;
    Probservacoes_pedido.Enabled := false;
    BtnEmailBoleto.Enabled := false;
    BtnBoleto.Enabled := true;
  end;

end;

procedure TFr_vendas_industria2.MontaArquivoCobrancaEnvio;
var
  txt: TextFile;
  dia, mes, ano, ord, ext, pathSaida, tempFile, nosso_numero, nosso_numero_div,
    sql_cliente, dir_remessa: string;
  sequencial_arquivo: integer;
  MensagemPadrao: TStrings;
  TituloBoleto: TACBrTitulo;
  function MontaNossoNumero(numero: string): string;
  var
    p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13: string;
    soma, resto: integer;
    function converteLetra(letra: string): string;
    var
      variavel: string;
      letter: char;
    begin
      variavel := '';
      if letra = '' then
        exit;
      letra := uppercase(letra);
      letter := letra[1];

      case letter of //converte letra em número
        'A': variavel := '1';
        'B': variavel := '2';
        'C': variavel := '3';
        'D': variavel := '4';
        'E': variavel := '5';
        'F': variavel := '6';
        'G': variavel := '7';
        'H': variavel := '8';
        'I': variavel := '9';
        'J': variavel := '10';
        'K': variavel := '11';
        'L': variavel := '12';
        'M': variavel := '13';
        'N': variavel := '14';
        'O': variavel := '15';
        'P': variavel := '16';
        'Q': variavel := '17';
        'R': variavel := '18';
        'S': variavel := '19';
        'T': variavel := '20';
        'U': variavel := '21';
        'V': variavel := '22';
        'W': variavel := '23';
        'X': variavel := '24';
        'Y': variavel := '25';
        'Z': variavel := '26';
      end; // case letra
      if variavel = '' then
        variavel := letra;
      result := variavel;
    end;
  begin
    p1 := copy(numero, 1, 1);
    p2 := copy(numero, 2, 1);
    p3 := copy(numero, 3, 1);
    p4 := copy(numero, 4, 1);
    p5 := copy(numero, 5, 1);
    p6 := copy(numero, 6, 1);
    p7 := copy(numero, 7, 1);
    p8 := copy(numero, 8, 1);
    p9 := copy(numero, 9, 1);
    p10 := copy(numero, 10, 1);
    p11 := copy(numero, 11, 1);
    p12 := copy(numero, 12, 1);
    p13 := copy(numero, 13, 1);
    result := converteLetra(p1) + converteLetra(p2) + converteLetra(p3) +
      converteLetra(p4) +
      converteLetra(p5) + converteLetra(p6) + converteLetra(p7) +
      converteLetra(p8) +
      converteLetra(p9) + converteLetra(p10) + converteLetra(p11) +
      converteLetra(p12) +
      converteLetra(p13);
  end;
begin
  {  pathSaida := ExtractFilePath(Application.ExeName);
    tempFile := pathSaida + 'temp.txt';
    dia := formatdatetime('dd', now);
    mes := formatdatetime('mm', now);
    ano := formatdatetime('yy', now);

    dao.Geral4('SELECT distinct a.BOLETO_REMESSA_ORDEM, b.dia, b.mes  FROM CR1 a left outer join BOLETO_REMESSA_ORDEM b on (a.BOLETO_REMESSA_ORDEM = b.id)  WHERE a.NR_DOCUMENTO = ' + Prnumdoc.Text);
    if dao.q4.fieldbyname('BOLETO_REMESSA_ORDEM').isnull then
    begin
      dao.Geral4('SELECT GEN_ID(GEN_BOLETO_REMESSA_ORDEM, 1) as ordem FROM RDB$DATABASE');
      id_remessa := dao.q4.fieldbyname('ORDEM').AsString;
      try
        if not (dao.cn.InTransaction) then
          dao.cn.StartTransaction;
        dao.Execsql('INSERT INTO BOLETO_REMESSA_ORDEM (ID, DIA, MES, ANO, DATA) VALUES (' + id_remessa + ', ' + dia + ', ' + mes + ',' + ANO + ',''' + formatdatetime('dd.mm.yyyy', now) + ''')');
        dao.Execsql('update cr1 set BOLETO_REMESSA_ORDEM =' + id_remessa + ' where nr_documento = ' + PrNumdoc.Text);
        dao.cn.Commit;
      except
        dao.cn.Rollback;
      end;

    end
    else
    begin
      id_remessa := dao.q4.fieldbyname('BOLETO_REMESSA_ORDEM').AsString;
      mes := FMFUN.enchezero(dao.q4.fieldbyname('mes').AsString, 2);
      dia := FMFUN.enchezero(dao.q4.fieldbyname('dia').AsString, 2);
    end;

    ord := FMFUN.enchezero(id_remessa, 2);

    if dao.CN.Path = 'C:\orbi\trunk\dados\orbi.fdb' then
      ext := '.TST'
    else
      ext := '.REM';

    dir_remessa := pathSaida + ACBrBoleto1.Banco.Nome + '\';
    if not DirectoryExists(dir_remessa) then
      ForceDirectories(dir_remessa);
    arquivo := dir_remessa + 'CB' + dia + mes + ord + ext;

    ACBrBoleto1.NomeArqRemessa := ARQUIVO;
   }
    //CABEÇALHO 0
  sequencial_arquivo := 1;
  q_cr1.first;
  ACBrBoleto1.ListadeBoletos.Clear;
  while not q_cr1.Eof do
  begin
    if (q_cr1.FieldByName('valor_recebido').isnull) or
      (q_cr1.FieldByName('valor_recebido').Value = 0) then
    begin
      TituloBoleto := ACBrBoleto1.CriarTituloNaLista;
      with TituloBoleto do
      begin

        if ACBrBoleto1.Banco.Numero = 237 then
          LocalPagamento :=
            'Pagável preferencialmente na Rede Bradesco ou Bradesco Expresso.'; //MEnsagem exigida pelo bradesco

        if ACBrBoleto1.Banco.Numero = 1 then
          LocalPagamento := 'PAGÁVEL EM QUALQUER BANCO ATÉ O VENCIMENTO.';
        //MEnsagem exigida pelo bradesco

        Vencimento := q_cr1.FieldByName('dtaven').AsDateTime;
        DataDocumento := now;
        NumeroDocumento := FMFUN.enchezero(q_cr1.FieldByName('titulo').Asstring
          + FMFUN.enchezero(q_cr1.FieldByName('sequencia').AsString, 2), 10);
        EspecieDoc := 'DM';
        //      Aceite :=
        DataProcessamento := Now;
        Carteira := carteira_conta;
        NossoNumero := MontaNossoNumero(q_cr1.FieldByName('titulo').Asstring +
          FMFUN.enchezero(q_cr1.FieldByName('sequencia').AsString, 2));
        ValorDocumento := q_cr1.FieldByName('valor').AsFloat;

        sql_cliente := ' SELECT a.COD_CLIENTE, a.NOM_CLIENTE, a.ENDERECO, a.COMPLEMENTO, a.BAIRRO, a.CEP, a.COD_CIDADE, a.TIP_PESSOA, a.CNPJ, a.CPF, a.NR_ENDERECO, cd.NOM_CIDADE, cd.uf '
          +
          ' FROM CLIENTE a ' +
          ' inner join cidades cd on (cd.COD_CIDADE = a.COD_CIDADE) ' +
          ' where a.cod_cliente = ' + Prcod_cliente.Text;

        dao.Geral4(sql_cliente);

        Sacado.NomeSacado := dao.Q4.fieldbyname('NOM_CLIENTE').AsString;

        if (dao.Q4.fieldbyname('TIP_PESSOA').AsString = 'J') then
        begin
          Sacado.CNPJCPF :=
            FRPRI.LimpaCNPJ(dao.Q4.fieldbyname('CNPJ').AsString);
          Sacado.Pessoa := pJuridica;
        end
        else
        begin
          Sacado.CNPJCPF := FRPRI.LimpaCNPJ(dao.Q4.fieldbyname('CPF').AsString);
          Sacado.Pessoa := pFisica;
        end;

        Sacado.Logradouro := dao.Q4.fieldbyname('ENDERECO').AsString;
        Sacado.Numero := dao.Q4.fieldbyname('NR_ENDERECO').AsString;
        Sacado.Bairro := dao.Q4.fieldbyname('BAIRRO').AsString;
        Sacado.Cidade := dao.Q4.fieldbyname('NOM_CIDADE').AsString;
        Sacado.UF := dao.Q4.fieldbyname('UF').AsString;
        Sacado.CEP := FRPRI.LimpaCNPJ(dao.Q4.fieldbyname('CEP').AsString);

        if ACBrBoleto1.Cedente.Nome = 'UNICRED LITORAL E NORTE CATARINENSE' then
          Sacado.Avalista := Boleto_Avalista;

        PercentualMulta := 2;
        ValorMoraJuros := q_cr1.FieldByName('valor').AsFloat * 0.0017;
        DataProtesto := Vencimento + dias_protesto;

        if DayOfTheWeek(DataProtesto) = 6 then
          DataProtesto := DataProtesto + 2;

        if DayOfTheWeek(DataProtesto) = 7 then
          DataProtesto := DataProtesto + 1;

        Instrucao1 := '00';

        //Instrucao2 := '00';
        if (trim(PrNFE.Text) <> '') and (Prvlr_st.Value > 0) and (UF_Cliente <>
          UF_Emissor) then
          Mensagem.Text := 'VALOR GNRE JÁ INCLUSO NO BOLETO';
        ACBrBoleto1.AdicionarMensagensPadroes(TituloBoleto, Mensagem);
      end;
    end;
    q_cr1.next;
  end;
  q_cr1.first;
end;

procedure TFr_vendas_industria2.BtnBoletoClick(Sender: TObject);
begin

  //  acbrboleto1.GerarRemessa(strtoint(id_remessa));
  ACBrBoletoFCFortes1.DirLogo := ExtractFilePath(Application.ExeName) +
    '\Logos\colorido\';
  if trim(PrCONTA_BOLETO.Text) = '' then
  begin
    ShowMessage('É necessário informar a Conta Corrente do Boleto.');
    exit;
  end;
  if q_cr1.IsEmpty then
    exit;
  acbrboleto1.Imprimir;
end;

procedure TFr_vendas_industria2.FormCreate(Sender: TObject);
begin
  Acbrboleto1.Cedente.TipoInscricao := pJuridica;

  Meqtd.DecimalPlaces := CasasDecimais;
  MeDesconto_Valor.DecimalPlaces := CasasDecimais;
  Mepreco.DecimalPlaces := CasasDecimais;
  Mesub_total.DecimalPlaces := CasasDecimais;
  Mevlr_icms_st.DecimalPlaces := CasasDecimais;
  Mevlr_bc_st.DecimalPlaces := CasasDecimais;
  Mevlr_bc.DecimalPlaces := CasasDecimais;
  Meipi_item.DecimalPlaces := CasasDecimais;
  Mevlr_ipi_item.DecimalPlaces := CasasDecimais;
  Mevlr_agr_item.DecimalPlaces := CasasDecimais;
  Meicms_item.DecimalPlaces := CasasDecimais;
  Mevlr_icms_item.DecimalPlaces := CasasDecimais;
  MePRECO_CUSTO.DecimalPlaces := CasasDecimais;
  MePrecoBase.DecimalPlaces := CasasDecimais;

  case CasasDecimais of
    2:
      begin
        Prtot_bruto.DisplayFormat := 'R$ #,##0.00';
        Prtot_liquido.DisplayFormat := 'R$ #,##0.00';
        PrValorDescontoAdic.DisplayFormat := 'R$ #,##0.00';
        Prvlr_bc_icms.DisplayFormat := 'R$ #,##0.00';
        Prvlr_icms.DisplayFormat := 'R$ #,##0.00';
        PrVLR_BC_ICMS_ST.DisplayFormat := 'R$ #,##0.00';
        Prvlr_st.DisplayFormat := 'R$ #,##0.00';
        Prvlr_ipi.DisplayFormat := 'R$ #,##0.00';
        edTotComissao.DisplayFormat := 'R$ #,##0.00';

        Meqtd.DisplayFormat := '#,##0.00';
        Mepreco.DisplayFormat := 'R$ #,##0.00';
        Mesub_total.DisplayFormat := 'R$ #,##0.00';
        Mevlr_icms_st.DisplayFormat := 'R$ #,##0.00';
        Mevlr_bc_st.DisplayFormat := 'R$ #,##0.00';
        Mevlr_bc.DisplayFormat := 'R$ #,##0.00';
        Mevlr_ipi_item.DisplayFormat := 'R$ #,##0.00';
        Mevlr_agr_item.DisplayFormat := 'R$ #,##0.00';
        Mevlr_icms_item.DisplayFormat := 'R$ #,##0.00';
        MePRECO_CUSTO.DisplayFormat := 'R$ #,##0.00';
        MeDesconto_Valor.DisplayFormat := 'R$ #,##0.00';
        MePrecoBase.DisplayFormat := 'R$ #,##0.00';

        mmVendas2SUB_TOTAL.DisplayFormat := 'R$ #,##0.00';
        mmVendas2VLR_IPI_ITEM.DisplayFormat := 'R$ #,##0.00';
        mmVendas2VLR_BC.DisplayFormat := 'R$ #,##0.00';
        mmVendas2VLR_ICMS_ITEM.DisplayFormat := 'R$ #,##0.00';
        mmVendas2VLR_AGR_ITEM.DisplayFormat := 'R$ #,##0.00';
        mmVendas2VLR_BC_ST.DisplayFormat := 'R$ #,##0.00';
        mmVendas2VLR_BC_ST.DisplayFormat := 'R$ #,##0.00';
        mmVendas2VLR_ICMS_ST.DisplayFormat := 'R$ #,##0.00';
        mmVendas2VLR_COMISSAO.DisplayFormat := 'R$ #,##0.00';
        mmVendas2PRECO_LIQUIDO.DisplayFormat := 'R$ #,##0.00';
        mmVendas2PRECO_CUSTO.DisplayFormat := 'R$ #,##0.00';
        mmVendas2PRECO_VENDA.DisplayFormat := 'R$ #,##0.00';
        mmVendas2PRECO_BASE.DisplayFormat := 'R$ #,##0.00';

      end;
    3:
      begin
        Prtot_bruto.DisplayFormat := 'R$ #,##0.000';
        PrValorDescontoAdic.DisplayFormat := 'R$ #,##0.000';
        Prtot_liquido.DisplayFormat := 'R$ #,##0.000';
        Prvlr_bc_icms.DisplayFormat := 'R$ #,##0.000';
        Prvlr_icms.DisplayFormat := 'R$ #,##0.000';
        PrVLR_BC_ICMS_ST.DisplayFormat := 'R$ #,##0.000';
        Prvlr_st.DisplayFormat := 'R$ #,##0.000';
        Prvlr_ipi.DisplayFormat := 'R$ #,##0.000';
        edTotComissao.DisplayFormat := 'R$ #,##0.000';

        Meqtd.DisplayFormat := '#,##0.000';
        Mepreco.DisplayFormat := 'R$ #,##0.000';
        Mesub_total.DisplayFormat := 'R$ #,##0.000';
        Mevlr_icms_st.DisplayFormat := 'R$ #,##0.000';
        Mevlr_bc_st.DisplayFormat := 'R$ #,##0.000';
        Mevlr_bc.DisplayFormat := 'R$ #,##0.000';
        Mevlr_ipi_item.DisplayFormat := 'R$ #,##0.000';
        Mevlr_agr_item.DisplayFormat := 'R$ #,##0.000';
        Mevlr_icms_item.DisplayFormat := 'R$ #,##0.000';
        MePRECO_CUSTO.DisplayFormat := 'R$ #,##0.000';
        MeDesconto_Valor.DisplayFormat := 'R$ #,##0.00';
        MePrecoBase.DisplayFormat := 'R$ #,##0.000';

        mmVendas2SUB_TOTAL.DisplayFormat := 'R$ #,##0.000';
        mmVendas2VLR_IPI_ITEM.DisplayFormat := 'R$ #,##0.000';
        mmVendas2VLR_BC.DisplayFormat := 'R$ #,##0.000';
        mmVendas2VLR_ICMS_ITEM.DisplayFormat := 'R$ #,##0.000';
        mmVendas2VLR_AGR_ITEM.DisplayFormat := 'R$ #,##0.000';
        mmVendas2VLR_BC_ST.DisplayFormat := 'R$ #,##0.000';
        mmVendas2VLR_BC_ST.DisplayFormat := 'R$ #,##0.000';
        mmVendas2VLR_ICMS_ST.DisplayFormat := 'R$ #,##0.000';
        mmVendas2VLR_COMISSAO.DisplayFormat := 'R$ #,##0.000';
        mmVendas2PRECO_LIQUIDO.DisplayFormat := 'R$ #,##0.000';
        mmVendas2PRECO_CUSTO.DisplayFormat := 'R$ #,##0.000';
        mmVendas2PRECO_VENDA.DisplayFormat := 'R$ #,##0.000';
        mmVendas2PRECO_BASE.DisplayFormat := 'R$ #,##0.000';
      end;
    4:
      begin
        Prtot_bruto.DisplayFormat := 'R$ #,##0.0000';
        PrValorDescontoAdic.DisplayFormat := 'R$ #,##0.0000';
        Prtot_liquido.DisplayFormat := 'R$ #,##0.0000';
        Prvlr_bc_icms.DisplayFormat := 'R$ #,##0.0000';
        Prvlr_icms.DisplayFormat := 'R$ #,##0.0000';
        PrVLR_BC_ICMS_ST.DisplayFormat := 'R$ #,##0.0000';
        Prvlr_st.DisplayFormat := 'R$ #,##0.0000';
        Prvlr_ipi.DisplayFormat := 'R$ #,##0.0000';
        edTotComissao.DisplayFormat := 'R$ #,##0.0000';

        Meqtd.DisplayFormat := '#,##0.0000';
        Mepreco.DisplayFormat := 'R$ #,##0.0000';
        Mesub_total.DisplayFormat := 'R$ #,##0.0000';
        Mevlr_icms_st.DisplayFormat := 'R$ #,##0.0000';
        Mevlr_bc_st.DisplayFormat := 'R$ #,##0.0000';
        Mevlr_bc.DisplayFormat := 'R$ #,##0.0000';
        Mevlr_ipi_item.DisplayFormat := 'R$ #,##0.0000';
        Mevlr_agr_item.DisplayFormat := 'R$ #,##0.0000';
        Mevlr_icms_item.DisplayFormat := 'R$ #,##0.0000';
        MePRECO_CUSTO.DisplayFormat := 'R$ #,##0.0000';
        MeDesconto_Valor.DisplayFormat := 'R$ #,##0.00';
        MePrecoBase.DisplayFormat := 'R$ #,##0.0000';

        mmVendas2SUB_TOTAL.DisplayFormat := 'R$ #,##0.0000';
        mmVendas2VLR_IPI_ITEM.DisplayFormat := 'R$ #,##0.0000';
        mmVendas2VLR_BC.DisplayFormat := 'R$ #,##0.0000';
        mmVendas2VLR_ICMS_ITEM.DisplayFormat := 'R$ #,##0.0000';
        mmVendas2VLR_AGR_ITEM.DisplayFormat := 'R$ #,##0.0000';
        mmVendas2VLR_BC_ST.DisplayFormat := 'R$ #,##0.0000';
        mmVendas2VLR_BC_ST.DisplayFormat := 'R$ #,##0.0000';
        mmVendas2VLR_ICMS_ST.DisplayFormat := 'R$ #,##0.0000';
        mmVendas2VLR_COMISSAO.DisplayFormat := 'R$ #,##0.0000';
        mmVendas2PRECO_LIQUIDO.DisplayFormat := 'R$ #,##0.0000';
        mmVendas2PRECO_CUSTO.DisplayFormat := 'R$ #,##0.0000';
        mmVendas2PRECO_VENDA.DisplayFormat := 'R$ #,##0.0000';
        mmVendas2PRECO_BASE.DisplayFormat := 'R$ #,##0.0000';
      end;
  end;

end;

procedure TFr_vendas_industria2.Mecod_produtoChange(Sender: TObject);
begin
  if produto_anterior = '' then
    exit;
  if produto_anterior <> Mecod_produto.Text then
  begin
    produto_alterado := true;
    if not (mmVendas2.state in [dsBrowse]) then
      mmVendas2desconto.Value := 0;
    CalculaSubtotais;
  end;
end;

procedure TFr_vendas_industria2.Mecod_produtoEnter(Sender: TObject);
begin
  produto_anterior := Mecod_produto.Text;
end;

procedure TFr_vendas_industria2.PrCONTA_BOLETOButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  //guardar os valores antigos
  //guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Conta corrente';
  chamou_pesquisa := 'fr_conta_corrente';
  chamou_form := 'fr_cc_vendas';
  chamou_cadastro := 'Fr_conta_corrente';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Conta corrente';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 5);
  Campos_combo[0] := 'Código';
  Campos_combo[1] := 'Banco';
  Campos_combo[2] := 'Numero da Agencia';
  Campos_combo[3] := 'Numero da Conta';
  Campos_combo[4] := 'Data da abertura da conta';

  for i := 0 to 4 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  Fr_localizar.ShowModal;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_vendas_industria2.PrCONTA_BOLETOExit(Sender: TObject);
var
  sql_boleto: string;
begin
  if trim(prCONTA_BOLETO.Text) = '' then
    lbCCBoleto.Caption := '...'
  else
  begin
    { if trim(Prempresa_faturar.Text) = '' then
     begin
       dao.msg('O campo Empresa deve ser Preenchido');
       btaltpedclick(self);
       PrCONTA_BOLETO.Clear;
       pc_vendas.TabIndex := 1;
       Prempresa_faturar.SetFocus;
       exit;
     end;}
     {else
       ChecarBoletoEmpresa(conta_boleto, empresa_faturar);}

    if (not FMFUN.verificaNumerico(prCONTA_BOLETO.Text)) and
      (length(prCONTA_BOLETO.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      prCONTA_BOLETO.SetFocus;
      exit;
    end;

    sql_boleto := 'select c.id, e.cod_empresa, C.DIAS_PROTESTO, b.NOM_BANCO, b.NR_BANCO, '
      +
      'b.LAYOUT_REMESSA, c.nr_conta, c.codigo_cedente, c.nr_agencia, c.dta_abertura_conta, ' +
      'c.convenio, C.NOME_CORRENTISTA, C.CARTEIRA, e.CNPJ, e.ENDERECO, e.NR_ENDERECO, ' +
      'e.CEP, cd.NOM_CIDADE, cd.UF, c.tipo_cobranca ' +
      'from conta_corrente c ' +
      'inner join banco b on b.ID = c.ID_BANCO ' +
      'inner join empresa e on (e.COD_EMPRESA = c.ID_EMPRESA) ' +
      'inner join cidades cd on cd.COD_CIDADE = e.COD_CIDADE ' +
      'where c.id=' + QuotedStr(PrCONTA_BOLETO.Text);

    if prconta_boleto.Enabled then
      sql_boleto := sql_boleto + ' and c.ativo = ''S'' ';

    dao.Geral2(sql_boleto);

    if dao.q2.RecordCount > 0 then
    begin
      lbCCBoleto.Caption := dao.Q2.fieldbyname('nom_banco').AsString + ' - ' +
        dao.Q2.fieldbyname('nr_agencia').AsString + '/' +
        dao.Q2.fieldbyname('nr_conta').AsString;
      if dao.Q2.fieldbyname('LAYOUT_REMESSA').AsString = 'c240' then
        ACBrBoleto1.LayoutRemessa := c240
      else
        ACBrBoleto1.LayoutRemessa := c400;

      case dao.Q2.fieldbyname('nr_banco').AsInteger of
        1:
          begin
            ACBrBoleto1.Banco.TipoCobranca := cobBancoDoBrasil;

            if dao.Q2.fieldbyname('tipo_cobranca').AsString = '1' then
              ACBrBoleto1.Cedente.CaracTitulo := tcSimples;

            if dao.Q2.fieldbyname('tipo_cobranca').AsString = '2' then
              ACBrBoleto1.Cedente.CaracTitulo := tcVinculada;
          end;
        104: ACBrBoleto1.Banco.TipoCobranca := cobCaixaEconomica;
        237: ACBrBoleto1.Banco.TipoCobranca := cobBradesco;
        341: ACBrBoleto1.Banco.TipoCobranca := cobItau;
        87: ACBrBoleto1.Banco.TipoCobranca := cobBradesco;
      end;

      ACBrBoleto1.Cedente.Agencia :=
        copy(dao.Q2.fieldbyname('nr_agencia').AsString, 1, pos('-',
        dao.Q2.fieldbyname('nr_agencia').AsString) - 1);
      ACBrBoleto1.Cedente.AgenciaDigito :=
        copy(dao.Q2.fieldbyname('nr_agencia').AsString, pos('-',
        dao.Q2.fieldbyname('nr_agencia').AsString) + 1, 2);
      ACBrBoleto1.Cedente.Conta := copy(dao.Q2.fieldbyname('nr_conta').AsString,
        1, pos('-', dao.Q2.fieldbyname('nr_conta').AsString) - 1);
      ACBrBoleto1.Cedente.ContaDigito :=
        copy(dao.Q2.fieldbyname('nr_conta').AsString, pos('-',
        dao.Q2.fieldbyname('nr_conta').AsString) + 1, 2);
      ACBrBoleto1.Cedente.CodigoCedente :=
        dao.Q2.fieldbyname('codigo_cedente').AsString;
      ACBrBoleto1.Cedente.Convenio := dao.Q2.fieldbyname('convenio').AsString;
      ACBrBoleto1.Cedente.Nome :=
        dao.Q2.fieldbyname('NOME_CORRENTISTA').AsString;
      ACBrBoleto1.Cedente.CNPJCPF := dao.Q2.fieldbyname('CNPJ').AsString;
      dias_protesto := dao.Q2.fieldbyname('DIAS_PROTESTO').AsInteger;
      carteira_conta := dao.Q2.fieldbyname('CARTEIRA').AsString;

      if dao.Q2.fieldbyname('nr_banco').AsInteger = 87 then
      begin

        Boleto_Avalista := dao.Q2.fieldbyname('CNPJ').AsString + ' - CNPJ ' +
          dao.Q2.fieldbyname('CNPJ').AsString + ' ' +
          dao.Q2.fieldbyname('ENDERECO').AsString + ', ' +
          dao.Q2.fieldbyname('NR_ENDERECO').AsString + ' - ' +
          dao.Q2.fieldbyname('CEP').AsString + ', ' +
          dao.Q2.fieldbyname('NOM_CIDADE').AsString + '-' +
          dao.Q2.fieldbyname('UF').AsString;

        ACBrBoleto1.Cedente.Nome := 'UNICRED LITORAL E NORTE CATARINENSE';
        ACBrBoleto1.Cedente.Logradouro := 'RUA CAMBORIÚ, Nº 519 - CENTRO';
        ACBrBoleto1.Cedente.Bairro := 'CENTRO';
        ACBrBoleto1.Cedente.Cidade := 'ITAJAI';
        ACBrBoleto1.Cedente.UF := 'SC';
        ACBrBoleto1.Cedente.CNPJCPF := '74114042000190';
        ACBrBoleto1.Cedente.CEP := '80301451';

      end;

      if modo_insert or (trim(Prempresa_faturar.Text) = '') then
      begin
        Pc_vendas.ActivePage := tab_finalizar;
        Prempresa_faturar.Text := dao.Q2.fieldbyname('cod_empresa').asstring;
        Prempresa_faturarExit(Self);
      end;

      Prcod_fopExit(Self);
    end
    else
    begin
      dao.msg('Registro não Encontrado ou Desativado!');
      prCONTA_BOLETO.Text := '';
      prCONTA_BOLETO.SetFocus;
      Exit;
    end;
  end;

end;

procedure TFr_vendas_industria2.FaturamentoAvulso2Click(Sender: TObject);
begin
  //
end;

procedure TFr_vendas_industria2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if prnumdoc.Text <> '' then
    LiberarPedido(prnumdoc.Text);
end;

function TFr_vendas_industria2.ChecarEmailCliente(cliente, tipo: string):
  boolean;
var
  ajustar_cliente: boolean;
  mensagem: string;
begin
  ajustar_cliente := false;
  dao.Geral4('SELECT EMAIL, EMAIL_END_NFE, NFE_EMAIL FROM CLIENTE WHERE COD_CLIENTE = ' + PRCOD_CLIENTE.Text);
  if dao.Q4.FieldByName('EMAIL').IsNull then
  begin
    showmessage('Email do Cliente não Definido no Cadastro de Clientes!');
    ajustar_cliente := true;
  end;

  if dao.Q4.FieldByName('EMAIL_END_NFE').IsNull then
  begin
    showmessage('Email do Cliente para NFe não Definido no Cadastro de Clientes!');
    ajustar_cliente := true;
  end;

  if dao.Q4.FieldByName('NFE_EMAIL').AsString <> 'S' then
  begin
    showmessage('Opção de Envio da NFe no Cadastro de Clientes não Definida!');
    ajustar_cliente := true;
  end;

  if ajustar_cliente = false then
  begin
    if tipo = 'pedido' then
      mensagem := 'Email de Pedido à ser enviado para: ' +
        dao.Q4.FieldByName('EMAIL').AsString + '. Desejas Alterar?'
    else
      mensagem := 'Email de NFe à ser enviado para: ' +
        dao.Q4.FieldByName('EMAIL_END_NFE').AsString + '. Desejas Alterar?';

    if MessageDlg(mensagem, mtConfirmation, [mbyes, mbno], 0) = mryes then
      ajustar_cliente := true;
  end;

  if ajustar_cliente then
  begin
    try
      Application.CreateForm(TFr_Cliente, Fr_Cliente);
      Fr_Cliente.dados_incompletos := true;
      Fr_Cliente.cliente := prcod_cliente.Text;
      Fr_Cliente.ShowModal;
    finally
      fr_cliente.Free;
    end;
    exit;
  end;
  Result := not ajustar_cliente;
end;

procedure TFr_vendas_industria2.BtnEmailNFeClick(Sender: TObject);
begin
  if not ChecarEmailCliente(prcod_cliente.Text, 'nfe') then
    exit;

  frpri.EnvioEmailNFE(prnumdoc.Text);
end;

procedure TFr_vendas_industria2.BtnEmailPedidoClick(Sender: TObject);
begin
  if not ChecarEmailCliente(prcod_cliente.Text, 'pedido') then
    exit;

  frpri.EnvioEmailPedidos(prnumdoc.Text);
end;

procedure TFr_vendas_industria2.MeqtdKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key in [',']) and (Pos(DecimalSeparator, Meqtd.Text) <> 0) then
    key := #0;
end;

procedure TFr_vendas_industria2.MevolumeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key in [',']) and (Pos(DecimalSeparator, Mevolume.Text) <> 0) then
    key := #0;
end;

procedure TFr_vendas_industria2.MePreco_vendaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key in [',']) and (Pos(DecimalSeparator, mePreco_venda.Text) <> 0) then
    key := #0;
end;

procedure TFr_vendas_industria2.MedescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key in [',']) and (Pos(DecimalSeparator, Medesconto.Text) <> 0) then
    key := #0;
end;

procedure TFr_vendas_industria2.MeprecoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key in [',']) and (Pos(DecimalSeparator, Mepreco.Text) <> 0) then
    key := #0;
end;

procedure TFr_vendas_industria2.Mesub_totalKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key in [',']) and (Pos(DecimalSeparator, Mesub_total.Text) <> 0) then
    key := #0;
end;

procedure TFr_vendas_industria2.Meicms_itemKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key in [',']) and (Pos(DecimalSeparator, Meicms_item.Text) <> 0) then
    key := #0;
end;

procedure TFr_vendas_industria2.Mevlr_icms_itemKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key in [',']) and (Pos(DecimalSeparator, Mevlr_icms_item.Text) <> 0) then
    key := #0;
end;

procedure TFr_vendas_industria2.Meipi_itemKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key in [',']) and (Pos(DecimalSeparator, Meipi_item.Text) <> 0) then
    key := #0;
end;

procedure TFr_vendas_industria2.Mevlr_ipi_itemKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key in [',']) and (Pos(DecimalSeparator, Mevlr_ipi_item.Text) <> 0) then
    key := #0;
end;

procedure TFr_vendas_industria2.BtnEditarCCClick(Sender: TObject);
begin
  PrCartaCorrecao.ReadOnly := false;
  PrCartaCorrecao.Enabled := true;
  PrCartaCorrecao.SetFocus;
end;

procedure TFr_vendas_industria2.DadosCCe;
begin
  q_cce.close;
  q_cce.SQL.Clear;
  q_cce.SQL.Text :=
    'SELECT a.ID, a.CARTACORRECAO FROM CARTA_CORRECAO a where a.NUMDOC = ' +
    prnumdoc.text;
  q_cce.open;
end;

procedure TFr_vendas_industria2.BtnEnviarCCClick(Sender: TObject);
var
  CCNFe: TNfeCC;
  id: integer;
begin
  if trim(PrCartaCorrecao.Text) = '' then
  begin
    dao.msg('Para a Carta de Correção da NF-e, é necessário informar o Motivo!');
    Exit;
  end;
  try

    dao.Geral1('Select Max(id) as ultimo_evento from carta_correcao where numdoc = ' + PRNumdoc.Text);
    if dao.Q1.IsEmpty then
      id := 1
    else
      id := dao.Q1.fieldbyname('ultimo_evento').AsInteger + 1;

    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
    //dao.Execsql('UPDATE VENDAS1 SET CARTACORRECAO = ' + QUOTEDSTR(PRCARTACORRECAO.Text) + ' WHERE NUMDOC = ' + PRNumdoc.Text);
    dao.Execsql('INSERT INTO CARTA_CORRECAO (ID, NUMDOC, CARTACORRECAO) VALUES ('
      + inttostr(id) + ',' + PRNumdoc.Text + ',' +
      QUOTEDSTR(PRCARTACORRECAO.Text)
      + ')');
    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;

  Application.CreateForm(TFr_nfe_transmissao, Fr_nfe_transmissao);
  CCNFe := TNfeCC.Create(PrChave_NFe.Text, inttostr(id),
    FMFUN.AnsiToAscii(PrCartaCorrecao.Text));

  Fr_nfe_transmissao.lbResultado.Caption := 'Carta de Correção da Nota Fiscal';
  Fr_nfe_transmissao.lbResultado.visible := true;

  Fr_nfe_transmissao.sCheckBox1.Visible := true;
  Fr_nfe_transmissao.sCheckBox1.Caption := 'Buscar Certificado.';

  Fr_nfe_transmissao.sCheckBox2.Visible := true;
  Fr_nfe_transmissao.sCheckBox2.Caption := 'Enviando Carta de Correção.';

  Fr_nfe_transmissao.Gauge1.MaxValue := 2;
  Fr_nfe_transmissao.Height := Fr_nfe_transmissao.Height + (16 * 2);
  Fr_nfe_transmissao.Gauge1.Progress := 0;

  Fr_nfe_transmissao.ShowModal;

  if Fr_nfe_transmissao.ModalResult = mrok then
    DadosCCe;

end;

constructor TNFeCC.Create(ChaveNfe, Evento, Justificativa: string);
begin
  inherited Create(True);
  { Chama o contrutor herdado. Ele irá temporariamente colocar o thread em estado de espera para depois executá-lo. }
  FreeOnTerminate := True; // Libera o objeto após terminar.
  Priority := TpLower;
  { Configura sua prioridade na lista de processos do Sistema operacional. }
  cChaveNFe := ChaveNfe;
  cEvento := Evento;
  cJustificativa := Justificativa;

  pathSaida := ExtractFilePath(Application.ExeName) + 'nf\';
  Resume; // Inicia o Thread.
end;

procedure TNFeCC.Execute;
var
  reciboLst: TStringList;
  smensagem: wideString;
begin
  try
    CoInitialize(nil);

    cont := 1;

    try
      smensagem :=
        Fr_vendas_industria2.ACBrNFe1.Configuracoes.Certificados.SelecionarCertificado;
    except
      on E: Exception do
      begin
        erro := true;
        msgerros := E.Message;
        exit;
      end;
    end;

    Synchronize(Mostra);

    frpri.DesabilitaTimers;
    {    if FMFUN.BuscaAmbienteNFE = taProducao then
          tipAmb := 1
        else
          tipAmb := 2;}
    cont := 2;
    Fr_vendas_industria2.ACBrNFe1.Configuracoes.WebServices.Ambiente :=
      FMFUN.BuscaAmbienteNFE;
    Synchronize(Mostra);

    Fr_vendas_industria2.ACBrNFe1.CartaCorrecao.CCe.Evento.Clear;
    with Fr_vendas_industria2.ACBrNFe1.CartaCorrecao.CCe.Evento.Add do
    begin
      infEvento.chNFe := cChaveNFe;
      infEvento.cOrgao :=
        Fr_vendas_industria2.ACBrNFe1.Configuracoes.WebServices.UFCodigo;

      dao.Geral2('SELECT ' +
        '  current_timestamp-0.05 as hoje, ' +
        '  a.CNPJ, ' +
        '  a.NOM_EMPRESA, ' +
        '  a.NOM_FANTASIA, ' +
        '  a.ENDERECO, ' +
        '  a.NR_ENDERECO, ' +
        '  a.COMPLEMENTO, ' +
        '  a.BAIRRO, ' +
        '  c.COD_IBGE, ' +
        '  c.NOM_CIDADE, ' +
        '  c.UF, ' +
        '  a.CEP, ' +
        '  a.FONE, ' +
        '  a.IE ' +
        'FROM EMPRESA a ' +
        'INNER JOIN CIDADES c on (c.COD_CIDADE = a.COD_CIDADE) ' +
        'WHERE cod_empresa=' +
        QuotedStr(Fr_vendas_industria2.Prempresa_faturar.Text));

      if dao.q2.RecordCount > 0 then
        infEvento.CNPJ := FRPRI.LimpaCNPJ(dao.Q2.fieldbyname('CNPJ').AsString)
      else
        exit;

      infEvento.dhEvento := dao.Q2.fieldbyname('HOje').AsDateTime;
      infEvento.tpEvento := 110110;
      infEvento.nSeqEvento := strtoint(cEvento);
      infEvento.versaoEvento := '1.00';
      infEvento.detEvento.descEvento := 'Carta de Correção';
      infEvento.detEvento.xCorrecao := cJustificativa;
      infEvento.detEvento.xCondUso := '';
      //Texto fixo conforme NT 2011.003 -  http://www.nfe.fazenda.gov.br/portal/exibirArquivo.aspx?conteudo=tsiloeZ6vBw=
    end;

    try
      Fr_vendas_industria2.ACBrNFe1.EnviarCartaCorrecao(1);
    except
      erro := true;
      msgerros :=
        UTF8Encode(Fr_vendas_industria2.ACBrNFe1.WebServices.CartaCorrecao.Msg);
    end;

    reciboLst := TStringList.Create;
    reciboLst.add(UTF8Encode(Fr_vendas_industria2.ACBrNFe1.WebServices.CartaCorrecao.RetWS));
    reciboLst.savetofile(pathSaida + 'ReciboLote.xml');
    reciboLst.free;
    GerarXMLProcNFe;
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

procedure TNFeCC.Mostra;
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
    Fr_nfe_transmissao.Gauge1.visible := false;
    Fr_nfe_transmissao.lbResultado.Visible := true;
    Fr_nfe_transmissao.MsgErro.Visible := true;
    Fr_nfe_transmissao.MsgErro.Text := msgerros;
    Fr_nfe_transmissao.MsgErro.Height := Fr_nfe_transmissao.Panel1.Height -
      Fr_nfe_transmissao.MsgErro.Top;
    Fr_nfe_transmissao.lbResultado.Caption := 'Houve erro no processo.';
    Fr_nfe_transmissao.BTNOK.MODALRESULT := MRCANCEL;
    frpri.HabilitaTimers;
  end;

  if finalizado then
  begin
    Fr_nfe_transmissao.Gauge1.visible := false;
    Fr_nfe_transmissao.lbResultado.Visible := true;
    Fr_nfe_transmissao.lbResultado.Caption := 'Processo realizado com sucesso.';
    frpri.HabilitaTimers;
  end;

  Fr_nfe_transmissao.Update;
  //Sleep(2000);
end;

procedure TNFeCC.LimparArquivos;
var
  F: TSearchRec;
  Ret: Integer;
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

function TNFeCC.GerarXMLProcNFe: Boolean;
var
  NomeArquivo, gPathNFe: string;
  prot: widestring;
  cc_xml: TStringList;
begin
  try
    gPathNFe := ExtractFilePath(Application.ExeName) + '\nf\';
    NomeArquivo := gPathNFe + cChaveNFe + '-ProcEventoNFe.xml';
    arquivo_procNFe := NomeArquivo;
    cc_xml := TStringList.Create;
    cc_xml.Text :=
      Fr_vendas_industria2.ACBrNFe1.WebServices.CartaCorrecao.CCeRetorno.retEvento.Items[0].RetInfEvento.XML;
    cc_xml.SaveToFile(NomeArquivo);
    cc_xml.free;

    if not dm.FTPNFe.Connected then
      dm.FTPNFe.Connect;

    if dm.FTPNFe.Connected then
    begin
      // transfere um arquivo texto
      dm.FTPNFe.TransferType := ftASCII;
      dm.FTPNFe.Put(NomeArquivo, cChaveNFe + '-ProcEventoNFe.xml');
      // desconecta
      dm.FTPNFe.Quit;
    end;

    Result := True;
  except
    Result := False;
  end;
end;

procedure TFr_vendas_industria2.PrCartaCorrecaoChange(Sender: TObject);
begin
  if Length(PrCartaCorrecao.Text) >= 15 then
  begin
    BtnEnviarCC.Enabled := true;
    BtnCancelarCC.Enabled := true;
  end
  else
  begin
    BtnEnviarCC.Enabled := false;
    BtnCancelarCC.Enabled := false;
  end;

end;

function TFr_vendas_industria2.ChecarPedidoLiberado: boolean;
begin
  Result := false;

  if (Prnumdoc.Text = '') then
    exit;

  dao.Geral4('Select LIBERAR_FATURAMENTO from VENDAS1 WHERE NUMDOC = ' +
    Prnumdoc.Text);

  Result := dao.Q4.FieldByName('LIBERAR_FATURAMENTO').AsString = 'S';
end;

procedure TFr_vendas_industria2.BtnEtiquetaClick(Sender: TObject);
var
  i, total_etiquetas: integer;
  peso: double;
  mostrar_unidade: boolean;
begin
  Application.CreateForm(Tfm_definir_saldo_inicial, fm_definir_saldo_inicial);
  fm_definir_saldo_inicial.Caption := 'Etiquetas.';
  fm_definir_saldo_inicial.gbDefinirSaldo.Caption :=
    'Definir Qtd. de Etiquetas';
  fm_definir_saldo_inicial.btgra.Caption := 'OK';
  fm_definir_saldo_inicial.edSaldo.value := mmVendas2QTD.AsInteger div
    mmVendas2volume.asinteger;
  fm_definir_saldo_inicial.edSaldo.DecimalPlaces := 0;
  fm_definir_saldo_inicial.ckMostra.Visible := true;
  fm_definir_saldo_inicial.edPeso.Visible := true;
  fm_definir_saldo_inicial.ShowModal;
  if fm_definir_saldo_inicial.ModalResult <> mrok then
    exit;
  total_etiquetas := fm_definir_saldo_inicial.edSaldo.AsInteger;
  peso := fm_definir_saldo_inicial.edPeso.Value;
  mostrar_unidade := fm_definir_saldo_inicial.ckMostra.checked;

  Application.CreateForm(Tfr_escolhe_impressora_termica,
    fr_escolhe_impressora_termica);
  fr_escolhe_impressora_termica.ShowModal;
  if fr_escolhe_impressora_termica.ModalResult = mrok then
    caminho_imp_cod_barras := fr_escolhe_impressora_termica.impressora_termica
  else
    exit;

  for i := 1 to total_etiquetas do
  begin
    if peso > 0 then
      Fmfun.ImprimeEtiqueta(mmVendas2COD_PRODUTO.AsString,
        mmVendas2NOM_PRODUTO.AsString, FormatFloat('#,###,##0.000', peso), 'KG',
        mmVendas2CODIGO_BARRAS.AsString, FRPRI.Tipo_Etiqueta,
        mostrar_unidade)
    else
      Fmfun.ImprimeEtiqueta(mmVendas2COD_PRODUTO.AsString,
        mmVendas2NOM_PRODUTO.AsString, zzqtd_embalagem.TEXT, zzunidade.TEXT,
        mmVendas2CODIGO_BARRAS.AsString,
        FRPRI.Tipo_Etiqueta,
        mostrar_unidade);
    //sleep(1000);
  end;
end;

procedure TFr_vendas_industria2.PrMOTIVO_NFE_CANCEL_INTERNOButtonClick(
  Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  //guardar os valores antigos
  //guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Motivo';
  chamou_pesquisa := 'fr_motivo';
  chamou_form := 'fr_motivo_vendas';
  chamou_cadastro := 'fr_motivo';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 +
    'Motivos de Canc. de NFe';
  Fr_localizar.BT_cadastro.Visible := true;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Código';
  Campos_combo[1] := 'Motivo';

  for i := 0 to 1 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  Fr_localizar.ShowModal;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
end;

procedure TFr_vendas_industria2.PrMOTIVO_NFE_CANCEL_INTERNOExit(
  Sender: TObject);
begin
  if trim(PrMOTIVO_NFE_CANCEL_INTERNO.Text) = '' then
    lbMotivo.Caption := '...';

  if PrMOTIVO_NFE_CANCEL_INTERNO.Text <> '' then
  begin

    if (not FMFUN.verificaNumerico(PrMOTIVO_NFE_CANCEL_INTERNO.Text)) and
      (length(PrMOTIVO_NFE_CANCEL_INTERNO.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      PrMOTIVO_NFE_CANCEL_INTERNO.SetFocus;
      exit;
    end;

    dao.Geral2('select motivo from NFE_MOTIVO_CANCEL where id =' +
      QuotedStr(PrMOTIVO_NFE_CANCEL_INTERNO.Text));
    if dao.q2.RecordCount > 0 then
      lbMotivo.Caption := dao.Q2.fieldbyname('motivo').AsString
    else
    begin
      dao.msg('Registro não Encontrado ou não Ativo!');
      PrMOTIVO_NFE_CANCEL_INTERNO.Text := '';
      PrMOTIVO_NFE_CANCEL_INTERNO.SetFocus;
      Exit;
    end;
  end;
end;

procedure TFr_vendas_industria2.gravar_liberacao_desconto(usuario, motivo:
  string);
begin
  dao.cn.StartTransaction;
  try
    dao.Execsql('UPDATE VENDAS1 SET USUARIO_LIBEROU_DESCONTO = ' +
      QUOTEDSTR(usuario) + ', MOTIVO_LIBERACAO_DESCONTO = ' + quotedstr(motivo)
      +
      ' WHERE NUMDOC = ' + PRNUMDOC.Text);
    dao.cn.Commit;
    usuario_liberou_desconto := usuario;
  except
    dao.cn.Rollback;
  end;
end;

procedure TFr_vendas_industria2.MedescontoChange(Sender: TObject);
begin
  usuario_liberou_desconto := '';
end;

procedure TFr_vendas_industria2.btAltRepClick(Sender: TObject);
begin
  if not btaltped.Enabled then
    exit;
  if Prnumdoc.Text = '' then
    exit;

  if btAltRep.Caption = 'Alterar' then
  begin
    Prcod_representante.Enabled := true;
    Prcod_representante.setfocus;
    btAltRep.Caption := 'Gravar';
  end
  else
  begin
    dao.cn.StartTransaction;
    dao.Execsql('UPDATE VENDAS1 SET COD_REPRESENTANTE = ' +
      Prcod_representante.Text + ' WHERE NUMDOC = ' + Prnumdoc.Text);
    dao.cn.Commit;
    Prcod_representante.Enabled := false;
    btAltRep.Caption := 'Alterar';
  end;
end;

procedure TFr_vendas_industria2.btRecXmlClick(Sender: TObject);
var
  RecNFe: Tnferecxml;
  cBuscarCeritifcado: _BuscarCertificado;
begin
  Application.CreateForm(TFr_nfe_transmissao, Fr_nfe_transmissao);
  RecNFe := TNFeRecXml.Create(strtoint(prnfe.text), strtoint(Prnumdoc.Text),
    strtoint(Prempresa_faturar.text));

  Fr_nfe_transmissao.sCheckBox1.Visible := true;
  Fr_nfe_transmissao.sCheckBox1.Caption := 'Buscar Certificado.';

  Fr_nfe_transmissao.sCheckBox2.Visible := true;
  Fr_nfe_transmissao.sCheckBox2.Caption := 'Gerar Arquivo NFe.';

  Fr_nfe_transmissao.sCheckBox3.Visible := true;
  Fr_nfe_transmissao.sCheckBox3.Caption := 'Gravar Dados de Protocolo.';

  Fr_nfe_transmissao.Gauge1.MaxValue := 3;
  Fr_nfe_transmissao.Height := Fr_nfe_transmissao.Height + (16 * 3);
  Fr_nfe_transmissao.Gauge1.Progress := 0;

  Fr_nfe_transmissao.ShowModal;

  if Fr_nfe_transmissao.ModalResult = mrok then
    CarregaDados;
end;

procedure TFr_vendas_industria2.btnNfeDevClick(Sender: TObject);
var
  EmissaoNFe: TNFePedido;
  cBuscarCeritifcado: _BuscarCertificado;
  valor_total: currency;
begin

  mostra := true;
  if trim(PrNFE_DEV.Text) = '' then
  begin
    dao.Geral4('select CASE WHEN MAX(Nota) IS NULL THEN 1 ELSE MAX(Nota)+1 END AS NFE from ' +
      ' ( SELECT NFE as  nota FROM VENDAS1 WHERE EMPRESA_FATURAR = ' +
      Prempresa_faturar.Text +
      ' union SELECT NFE_dev as nota FROM VENDAS1 WHERE EMPRESA_FATURAR = ' +
      Prempresa_faturar.Text + ')');

    PrNFE_DEV.Text := dao.Q4.fieldbyname('NFE').AsString;
    try
      if not (dao.cn.InTransaction) then
        (dao.cn.StartTransaction);
      dao.Execsql('update vendas1 set nfe_dev=' + QuotedStr(PrNFE_DEV.Text) +
        ' where numdoc=' + QuotedStr(Prnumdoc.Text));
      dao.cn.Commit;
      Prempresa_faturar.ReadOnly := true;
    except
      dao.cn.Rollback;
    end;

  end;

  EmissaoNFe := TNFePedido.Create(cBuscarCeritifcado);
  EmissaoNFe.tipo := 1;
  Application.CreateForm(TFr_nfe_transmissao, Fr_nfe_transmissao);

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

  ///  Fr_nfe_transmissao.BtnOK.Enabled := true;

  Fr_nfe_transmissao.ShowModal;
  if Fr_nfe_transmissao.modalresult = mrok then
  begin
    CarregaDados;

    if PrStatus_Nfe_DEV.Text = '100' then
    begin
      BtnDanfe_DevClick(self);
      LimparBoletos;
      PrJUSTIF_CANC_NFE_DEV.Enabled := true;
    end;

    {    if prstatus_nfe.Text = '539' then
        begin
          PrChave_NFe.Text := copy(PrMotivo_nfe.Text, pos('chNFe:', PrMotivo_nfe.Text) + 6, 44);
          btRecXmlClick(Self);
        end;

     CarregaDados;
     }

  end;

end;

procedure TFr_vendas_industria2.btRecXml_DevClick(Sender: TObject);
var
  RecNFe: Tnferecxml;
  cBuscarCeritifcado: _BuscarCertificado;
begin
  Application.CreateForm(TFr_nfe_transmissao, Fr_nfe_transmissao);
  RecNFe := TNFeRecXml.Create(strtoint(prnfe_dev.text), strtoint(Prnumdoc.text),
    strtoint(Prempresa_faturar.text));

  Fr_nfe_transmissao.sCheckBox1.Visible := true;
  Fr_nfe_transmissao.sCheckBox1.Caption := 'Buscar Certificado.';

  Fr_nfe_transmissao.sCheckBox2.Visible := true;
  Fr_nfe_transmissao.sCheckBox2.Caption := 'Gerar Arquivo NFe.';

  Fr_nfe_transmissao.sCheckBox3.Visible := true;
  Fr_nfe_transmissao.sCheckBox3.Caption := 'Gravar Dados de Protocolo.';

  Fr_nfe_transmissao.Gauge1.MaxValue := 3;
  Fr_nfe_transmissao.Height := Fr_nfe_transmissao.Height + (16 * 3);
  Fr_nfe_transmissao.Gauge1.Progress := 0;

  Fr_nfe_transmissao.ShowModal;

  if Fr_nfe_transmissao.ModalResult = mrok then
    CarregaDados;

end;

procedure TFr_vendas_industria2.BtnDanfe_DevClick(Sender: TObject);
begin
  ImprimirDanfe(PrChave_NFe_DEV.text);
end;

procedure TFr_vendas_industria2.ImprimirDanfe(chave: string);
var
  arquivoNFe, pathSaida, protocolo: string;
begin
  arquivoNFe := chave + '-procNFe.xml';
  pathSaida := ExtractFilePath(Application.ExeName) + 'nf\';

  if not FilesExists(pathSaida + arquivoNFe) then
  begin
    try
      dm.FTPNFe.Connect;
      if dm.FTPNFe.Connected then
      begin
        // transfere um arquivo texto
        dm.FTPNFe.TransferType := ftASCII;
        //      arquivoNFe := PrChave_NFe.text + '-nfe.xml';
        dm.FTPNFe.get(arquivoNFe, pathSaida + arquivoNFe);
        dm.FTPNFe.Quit;
      end;
    except
      dm.FTPNFe.Quit;
      showmessage('Erro ao carregar Arquivo no FTP...');
      deletefile(pathSaida + arquivoNFe);
      exit;
    end;
  end;
  ACBrNFe1.NotasFiscais.Clear;
  ACBrNFe1.NotasFiscais.LoadFromFile(pathSaida + arquivoNFe);
  //  protocolo := PrPROTOCOLO_NFE.text + ' ' +  formatdatetime('dd/mm/yyyy hh:mm:ss', prDATA_REC_NFE.date);
   // ACBrNFe1.DANFE.ProtocoloNFe := protocolo;
  ACBrNFe1.DANFE.Logo := ExtractFilePath(Application.ExeName) + 'logo.bmp';
  ACBrNFe1.DANFE.ImprimirDANFE();
  deletefile(pathSaida + arquivoNFe);

end;

procedure TFr_vendas_industria2.BtnEmailBoletoClick(Sender: TObject);
var
  EmailBoleto: TEmail;
  corpo_email, assunto_email, ref: string;
begin
  if not ChecarEmailCliente(prcod_cliente.Text, 'pedido') then
    exit;

  dao.Geral1('SELECT V1.NUMDOC, C.EMAIL, C.EMAIL_ADICIONAL1, C.EMAIL_ADICIONAL2, C.EMAIL_ADICIONAL3, C.NOM_CLIENTE FROM VENDAS1 V1 INNER JOIN CLIENTE C ON V1.COD_CLIENTE = C.COD_CLIENTE WHERE V1.numdoc = ' + Prnumdoc.Text);
  if dao.Q1.FieldByName('EMAIL').IsNull then
    exit;

  if trim(PrNFE.Text) <> '' then
    ref := 'NF-e Nº. ' + PrNFE.Text
  else
    ref := 'Pedido Nº. ' + Prnumdoc.Text;

  assunto_email := nom_empresa + ' - Boletos Ref. ' + ref;

  corpo_email :=
    '<html><body> ' +
    '  <font face="Consolas" size="2">Prezado Cliente</font><br><br> ' +
    '  <font face="Consolas" size="2">Segue arquivos dos Boletos Ref. ' + ref +
    ' em Anexo</font><br><br> ' +
    '  <font face="Consolas" size="2">Informações: ' + fone_empresa +
    '</font><br> ' +
    '  <font face="Consolas" size="2">' + home_page + '</font><br><br>' +
    '  <img src="cid:principal.bmp"><br>' +
    '</body></html> ';

  if q_cr1.IsEmpty then
    exit;
  ACBrBoletoFCFortes1.NomeArquivo := 'c:\orbi\boleto.pdf';
  acbrboleto1.GerarPDF;

  try
    Application.CreateForm(TFr_email_envio, Fr_email_envio);
    Fr_email_envio.lbResultado.Caption :=
      'Enviando Email de Boletos ao Cliente';

    if dao.CN.Path = 'C:\orbi\trunk\dados\orbi.fdb' then
      EmailBoleto := TEmail.Create(corpo_email, 'Teste', '', '', '', '',
        'claudioplasfan@gmail.com', ACBrBoletoFCFortes1.NomeArquivo)
    else
      EmailBoleto := TEmail.Create(corpo_email, assunto_email,
        dao.Q1.FieldByName('EMAIL').AsString,
        dao.Q1.FieldByName('EMAIL_ADICIONAL1').AsString,
        dao.Q1.FieldByName('EMAIL_ADICIONAL2').AsString,
        dao.Q1.FieldByName('EMAIL_ADICIONAL3').AsString,
        'claudioplasfan@gmail.com', ACBrBoletoFCFortes1.NomeArquivo);

    Fr_email_envio.showModal;
  finally
    Fr_email_envio.Free;
    dao.Q1.Close;
  end;

end;

procedure TFr_vendas_industria2.BtnEditarCancelamentoNFeDevClick(
  Sender: TObject);
begin
  PrJUSTIF_CANC_NFE_DEV.ReadOnly := false;
  PrJUSTIF_CANC_NFE_DEV.Enabled := true;
  PrJUSTIF_CANC_NFE_DEV.SetFocus;
end;

procedure TFr_vendas_industria2.BtnEnviarCancelamentoNFeDevClick(
  Sender: TObject);
var
  CancelNFe: TNfeCancel;
begin
  if trim(PrJUSTIF_CANC_NFE_DEV.Text) = '' then
  begin
    dao.msg('Para o Cancelamento da NF-e de Devolução, é necessário informar a Justificativa!');
    PrJUSTIF_CANC_NFE_DEV.setfocus;
    Exit;
  end;
  try
    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
    dao.Execsql('UPDATE VENDAS1 SET JUSTIF_CANC_NFE_DEV = ' +
      QUOTEDSTR(PrJUSTIF_CANC_NFE_DEV.Text) + ' WHERE NUMDOC = ' +
      PRNumdoc.Text);
    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;

  Application.CreateForm(TFr_nfe_transmissao, Fr_nfe_transmissao);
  CancelNFe := TNfeCancel.Create(PrChave_NFe_DEV.Text,
    FMFUN.AnsiToAscii(PrJUSTIF_CANC_NFE_DEV.Text), PrPROTOCOLO_NFE_DEV.Text,
    false);
  Fr_nfe_transmissao.lbResultado.Caption :=
    'Cancelamento da Nota Fiscal de Devolução';

  Fr_nfe_transmissao.sCheckBox1.Visible := true;
  Fr_nfe_transmissao.sCheckBox1.Caption := 'Buscar Certificado.';

  Fr_nfe_transmissao.sCheckBox2.Visible := true;
  Fr_nfe_transmissao.sCheckBox2.Caption :=
    'Enviando Solicitação de Cancelamento da NFe de Devolução.';

  Fr_nfe_transmissao.sCheckBox3.Visible := true;
  Fr_nfe_transmissao.sCheckBox3.Caption :=
    'Consultando Recibo de Cancelamento da NFe de Devolução.';

  Fr_nfe_transmissao.Gauge1.MaxValue := 3;
  Fr_nfe_transmissao.Height := Fr_nfe_transmissao.Height + (16 * 3);
  Fr_nfe_transmissao.Gauge1.Progress := 0;

  Fr_nfe_transmissao.ShowModal;

  if Fr_nfe_transmissao.modalresult = mrok then
  begin
    ativa_vendas1(prnumdoc.Text);
    ativa_vendas2(prnumdoc.Text);
    mostra_campos_vendas1('Pr');
    carrega_vendas2;
    StatusPedido;

    Pc_vendas.ActivePage := TaNFeDevol;

    {    if MessageDlg('Desejas Clonar o Pedido Cancelado?', mtConfirmation, [mbYes,
          mbno],
            0) = mryes then
          ClonarPedidoCancelado;
      end;
     }
  end;
end;

procedure TFr_vendas_industria2.sbClonarClick(Sender: TObject);
begin
  if MessageDlg('Confirmar clonagem do Pedido Faturado/Cancelado?',
    mtConfirmation, [mbYes,
    mbno],
      0) = mryes then
    ClonarPedidoCancelado;
end;

procedure TFr_vendas_industria2.Q2SAfterClose(DataSet: TDataSet);
begin
  dao.cn.Commit;
  frpri.HabilitaTimers;
end;

procedure TFr_vendas_industria2.Q2SBeforeOpen(DataSet: TDataSet);
begin
  frpri.DesabilitaTimers;
end;

procedure TFr_vendas_industria2.q_vendas1AfterClose(
  IB_Dataset: TIB_Dataset);
begin
  dao.cn.Commit;
  frpri.HabilitaTimers;
end;

procedure TFr_vendas_industria2.q_vendas2AfterClose(
  IB_Dataset: TIB_Dataset);
begin
  dao.cn.Commit;
  frpri.HabilitaTimers;

end;

procedure TFr_vendas_industria2.q_cr1AfterScroll(DataSet: TDataSet);
var
  i: integer;
begin
  Crid.Text := q_cr1.fieldbyname('id').AsString;
  Crtitulo.Text := q_cr1.fieldbyname('titulo').AsString;
  Crsequencia.Text := q_cr1.fieldbyname('sequencia').AsString;
  Crdtaven.Date := q_cr1.fieldbyname('dtaven').AsDateTime;
  Crvalor.Value := q_cr1.fieldbyname('valor').AsFloat;
  Crcod_fop.Text := q_cr1.fieldbyname('cod_fop').AsString;
  Lbforma_pgto.Caption := q_cr1.fieldbyname('nom_fop').AsString;
  Crdtarec.Date := q_cr1.fieldbyname('dtarec').AsDateTime;
  Crvalor_recebido.Value := q_cr1.fieldbyname('valor_recebido').AsFloat;
  if Crcod_fop.Text = '4' then
  begin
    i := 1;
    Sg_cheque.Clear;
    Sg_cheque.RowCount := 2;
    Sg_cheque.Cells[0, 0] := 'Nº Cheque';
    Sg_cheque.Cells[1, 0] := 'Ag';
    Sg_cheque.Cells[2, 0] := 'C.C';
    Sg_cheque.Cells[3, 0] := 'Dta. Emissão';
    Sg_cheque.Cells[4, 0] := 'Dta. Vencimento';
    Sg_cheque.Cells[5, 0] := 'Valor';
    Sg_cheque.Cells[6, 0] := 'Titular';

    dao.Geral1('select * from cheque_terceiros where titulo_cr1=' +
      QuotedStr(Crtitulo.Text));
    if dao.Q1.RecordCount > 0 then
    begin
      Pacheque.Visible := true;
      Sg_cheque.Cells[0, i] := dao.Q1.fieldbyname('nr_cheque').AsString;
      Sg_cheque.Cells[1, i] := dao.Q1.fieldbyname('nr_agencia').AsString;
      Sg_cheque.Cells[2, i] := dao.Q1.fieldbyname('nr_conta_corrente').AsString;
      Sg_cheque.Cells[3, i] := dao.Q1.fieldbyname('dta_emissao').AsString;
      Sg_cheque.Cells[4, i] := dao.Q1.fieldbyname('dta_vencimento').AsString;
      Sg_cheque.Cells[5, i] := dao.Q1.fieldbyname('valor').AsString;
      Sg_cheque.Cells[6, i] := dao.Q1.fieldbyname('nom_titular').AsString;
      i := i + 1;
      DAO.Q1.Next;
    end;
  end
  else
  begin
    Sg_cheque.Clear;
    Sg_cheque.RowCount := 2;
    Sg_cheque.Cells[0, 0] := 'Nº Cheque';
    Sg_cheque.Cells[1, 0] := 'Ag';
    Sg_cheque.Cells[2, 0] := 'C.C';
    Sg_cheque.Cells[3, 0] := 'Dta. Emissão';
    Sg_cheque.Cells[4, 0] := 'Dta. Vencimento';
    Sg_cheque.Cells[5, 0] := 'Valor';
    Sg_cheque.Cells[6, 0] := 'Titular';
    Pacheque.Visible := false;
  end;

  if trim(Crid.Text) = '' then
    Btgrava_cr1.enabled := false
  else
    Btgrava_cr1.enabled := true;

end;

procedure TFr_vendas_industria2.q_cr1BeforeOpen(DataSet: TDataSet);
begin
  frpri.DesabilitaTimers;
end;

procedure TFr_vendas_industria2.q_cr1AfterClose(DataSet: TDataSet);
begin
  dao.cn.Commit;
  frpri.HabilitaTimers;
end;

procedure TFr_vendas_industria2.cbEmpresaChange(Sender: TObject);
begin
  CarregaTotaisEmpresa
end;

procedure TFr_vendas_industria2.cbMesChange(Sender: TObject);
begin
  CarregaTotaisEmpresa
end;

procedure TFr_vendas_industria2.StatusPedido;
begin
  q_vendas1.Open;
  if q_vendas1.Active then
  begin
    if q_vendas1.FieldByName('faturado').AsString = '1' then
    begin
      SbVendas.Panels[1].Text := '-FATURADO-VENDAS';
      if FRPRI.TipUsu >= '3' then
        BtnAltFormaPrazo.Visible := true;
    end
    else if q_vendas1.FieldByName('faturado').AsString = '2' then
      SbVendas.Panels[1].Text := '-CANCELADA-'
    else if q_vendas1.FieldByName('faturado').AsString = '3' then
      SbVendas.Panels[1].Text := '-FATURADO-DEVOLUÇÕES, REMESSAS E BONIFICAÇÕES-'
    else if q_vendas1.FieldByName('faturado').AsString = '4' then
      SbVendas.Panels[1].Text := '-DESATIVADO-'
    else if q_vendas1.FieldByName('faturado').AsString = '5' then
      SbVendas.Panels[1].Text := '-NFE DENEGADA-'
    else
      SbVendas.Panels[1].Text := '-NÃO FATURADO-';

    if q_vendas1.FieldByName('faturado').AsString = '4' then
      Btexcped.Caption := 'REATIVAR'
    else
      Btexcped.Caption := 'DESATIVAR';

    if q_vendas1.FieldByName('NUMDOC_GRUPO').IsNotNull then
    begin
      SbVendas.Panels[1].Text := '-AGRUPADO AO PEDIDO Nº.: ' +
        q_vendas1.FieldByName('NUMDOC_GRUPO').AsString;
      TaAgrupar.TabVisible := false;
      Btaltped.Enabled := false;
      Btexcped.Enabled := false;
    end;

    if q_vendas1.FieldByName('ABERTO_USUARIO').AsString = 'N' then
    begin
      if q_vendas1.FieldByName('MAQUINA_USUARIO_ABERTO').AsString = nom_usuario
        +
        '-' + FMFUN.COMPUTADOR then
      begin
        if FMFUN.GetNumeroProcessos(ExtractFileName(Application.ExeName)) = 1
          then
        begin
          LiberarPedido(prnumdoc.Text);
          lbsituacao.Caption := '';

          if (FRPRI.TipUsu = '1') then
          begin
            btaltped.Enabled := false;
            btexcped.Enabled := false;
          end
          else
          begin
            btaltped.Enabled := true;
            btexcped.Enabled := true;
          end;

          BtnEmailPedido.Enabled := true;

          BtnNFE.Enabled := true;
          BloquearPedido(prnumdoc.Text);
          exit;
        end;
      end;

      lbsituacao.Caption := 'PEDIDO FECHADO PARA O USUÁRIO/MÁQUINA: ' +
        q_vendas1.FieldByName('MAQUINA_USUARIO_ABERTO').AsString;
      btaltped.Enabled := false;
      BtnEmailPedido.Enabled := false;
      btexcped.Enabled := false;
      BtnNFE.Enabled := false;
    end
    else
    begin
      lbsituacao.Caption := '';

      if (FRPRI.TipUsu = '1') then
      begin
        btaltped.Enabled := false;
        btexcped.Enabled := false;
      end
      else
      begin
        btaltped.Enabled := true;
        btexcped.Enabled := true;
      end;

      BtnEmailPedido.Enabled := true;
      BtnNFE.Enabled := true;
      BloquearPedido(q_vendas1.FieldByName('numdoc').AsString);

    end;
  end;
end;

procedure TFr_vendas_industria2.CarregaDadosItem(numdoc: string);
begin
  q_itens.Close;
  q_itens.ParamByName('numdoc').AsString := numdoc;
  q_itens.Open;
end;

procedure TFr_vendas_industria2.CarregaDadosAgrupar(cliente, numdoc: string);
begin
  if cliente = '' then
    exit;
  if numdoc = '' then
    exit;

  q_pedidos_agrupar.Close;
  q_pedidos_agrupar.ParamByName('grupo').AsString := numdoc;
  q_pedidos_agrupar.ParamByName('cliente').AsString := cliente;
  q_pedidos_agrupar.Open;
end;

procedure TFr_vendas_industria2.AgrupaPedidos;
begin
  if q_pedidos_agruparAGRUPADO.AsString = 'S' then
    dao.Execsql('UPDATE VENDAS1 SET NUMDOC_GRUPO = NULL WHERE NUMDOC = ' +
      q_pedidos_agruparNUMDOC.AsString)
  else
    dao.Execsql('UPDATE VENDAS1 SET NUMDOC_GRUPO = ' + prnumdoc.text +
      ' WHERE NUMDOC = ' + q_pedidos_agruparNUMDOC.AsString);

  dao.Execsql('DELETE FROM VENDAS2 WHERE NUMDOC = ' + Prnumdoc.TEXT);

  dao.Execsql('INSERT INTO VENDAS2 (NUMDOC, COD_PRODUTO, QTD, PRECO, PRECO_CUSTO, SUB_TOTAL, DESCONTO, VOLUME, PRECO_BRUTO, DESCONTO_VALOR) ' +
    'SELECT ' + Prnumdoc.Text +
    ' as numdoc, p.COD_PRODUTO, sum(b.QTD) as qtd, min(b.PRECO) as preco, min(b.PRECO_CUSTO) as custo, sum(b.QTD) * min(b.PRECO) as SUB_TOTAL, ' +
    '(((sum(b.QTD) * min(b.PRECO_BRUTO)) - (sum(b.qtd) * min(b.PRECO))) / (sum(b.QTD) * min(b.PRECO_BRUTO)))*100 as desconto, ' +
    'sum(b.VOLUME) as volume, min(b.PRECO_BRUTO) as preco_bruto, sum(b.DESCONTO_VALOR) as desconto_valor FROM VENDAS1 a INNER JOIN VENDAS2 b on b.NUMDOC = a.NUMDOC ' +
    'inner join produto p on (p.COD_PRODUTO = b.COD_PRODUTO) INNER JOIN CLIENTE C ON C.COD_CLIENTE = A.COD_CLIENTE ' +
    'where A.FATURADO = 0 and A.COD_CLIENTE = ' + Prcod_cliente.Text +
    ' and A.NUMDOC_GRUPO = ' + Prnumdoc.Text + ' group by numdoc, cod_produto');

  ativa_vendas2(Prnumdoc.Text);
  carrega_vendas2;
  somaTotal;
  Btgraped.Enabled := true;
  BtgrapedClick(Self);
  Pc_vendas.ActivePage := TaAgrupar;

end;

procedure TFr_vendas_industria2.ImprimirPedidosAnteriores;
var
  path, cmd: string;
begin
  if modo_insert then
    exit;

  if (FRPRI.TipUsu = '0') or (FRPRI.TipUsu = '1') then
    exit;

  if not ChecarDadosCliente then
    exit;

  if not ChecarDadosTransportadora then
    exit;

  path := ExtractFilePath(Application.ExeName);
  if Prnumdoc.Text = '' then
  begin
    dao.msg('Selecione um Pedido para Imprimir!');
    exit;
  end;

  if Btgraped.Enabled then
    BtgrapedClick(Self);

  cmd := 'SELECT v.NUMDOC, v.tipo, V.OBS, v.prazo, v.DTADOC, v.DTA_EMISSAO, v.TOT_LIQUIDO, V.DESCONTO_PEDIDO, V.VALOR_CR, v.COD_CLIENTE, v.NOM_CLIENTE, v.CODREP, R.NOM_REPRESENTANTE, v.NOM_BANCO, '
    +
    'v.CLIENTE_ENDERECO, v.cliente_fone as fone_cliente, v.aviso, v.cliente_fax as fax, v.contato, v.CLIENTE_BAIRRO, v.CEP_CLIENTE, v.CLIENTE_CNPJ_CPF, v.CLIENTE_IE_RG, v.CLIENTE_CIDADE, ' +
    'v.NR_BANCO, v.NR_AGENCIA, v.NR_CONTA_CORRENTE, v.EMAIL, v.FONE, v.CELULAR, v.COD_PRODUTO, v.NOM_PRODUTO, v.CUSTO, v.LUCRO, v.PRECO_VENDA_CALC, v.MARGEM, V.USUARIO_LIBEROU_DESCONTO, V.MOTIVO_LIBERACAO_DESCONTO, ' +
    'v.PRECO_VENDA, v.PRECO, v.total_custo, v.DESCONTO, v.QTD, v.SUB_TOTAL, v.VLR_COMISSAO, V.SUBTOTAL_RATEADO, V.VLR_COMISSAO_RATEADO, v.FATURADO, v.SUPERVISAO, v.PERC_COMISSAO, R.PERC_COMISSAO_FIXA, ' +
    'case when (select count(*) from vendas2 v2 where v2.COD_PRODUTO = v.cod_produto and v2.NUMDOC = ' +
    Prnumdoc.text + ' ) > 0 then ''*'' else '''' end as contido, ' +
    's.NOM_REPRESENTANTE as supervisor ' +
    'FROM V_VENDA v INNER JOIN REPRESENTANTE R ON (R.ID = CODREP) ' +
    'inner join vendas1 v1 on v1.NUMDOC = v.NUMDOC ' +
    'left outer JOIN REPRESENTANTE s ON (s.ID = v1.COD_SUPERVISOR) ' +
    'where v.faturado = 0 ' +
    ' and v.COD_CLIENTE = ' + Prcod_cliente.Text + ' and v.numdoc not in (' +
    Prnumdoc.text + ')';

  cmd := cmd + ' order by NOM_REPRESENTANTE, dtadoc, numdoc, ord_pauta';

  with dm.q_venda_espelho do
  begin
    close;
    sql.Clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_venda_espelho.RecordCount = 0 then
  begin
    //dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end
  else if MessageDlg('Há pedidos em aberto neste Cliente. Desejas Visualizar?',
    mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin

    cmd :=
      'SELECT ' +
      '  distinct Cod_cliente, NR_documento, titulo, HISTORICO, DTAVEN, DTAREC, valor, valor_recebido, SITUACAO, CONTA ' +
      'FROM ' +
      '( ' +
      '    SELECT ' +
      '      Cod_cliente, NR_documento, titulo, HISTORICO, DTAVEN, DTAREC, valor, valor_recebido, SITUACAO, CONTA ' +
      '    FROM ' +
      '      ( ' +
      '        SELECT ' +
      '          FIRST 10 c.cod_cliente, NR_documento, titulo, cast(C.HISTORICO1 as varchar(300)) as historico, DTAVEN, DTAREC, C.valor, valor_recebido, ' +
      '          case when dtarec is null then case when DTAVEN >= current_date then ''À VENCER'' else ''VENCIDO'' END ELSE ''PAGO'' END AS SITUACAO, ' +
      '          case when dtarec is null then ' +
      '            coalesce(CV.NR_AGENCIA||'' ''||CV.NR_CONTA||'' ''||CV.NOM_CONTA, F.NOM_FOP) ' +
      '          Else ' +
      '          coalesce(CC.NR_AGENCIA||'' ''||CC.NR_CONTA||'' ''||CC.NOM_CONTA, ' +
      '          CASE E.TIPO WHEN 0 THEN ''DINHEIRO'' ' +
      '                      WHEN 1 THEN ''CHEQUE PRÓPRIO'' ' +
      '                      WHEN 2 THEN ''CHEQUE DE TERCEIROS'' ' +
      '                      WHEN 3 THEN ''PERMUTA'' ' +
      '                      WHEN 4 THEN ''DESCONTO'' ' +
      '          END) END AS CONTA ' +
      '        FROM ' +
      '          CR1 C ' +
      '        LEFT OUTER JOIN EXTRATO_CR1 EC ON EC.CR1 = C.ID ' +
      '        LEFT OUTER JOIN EXTRATO E ON E.ID = EC.EXTRATO ' +
      '        LEFT OUTER JOIN CONTA_CORRENTE CC ON CC.ID = E.ID_CONTA  ' +
      '        LEFT OUTER JOIN VENDAS1 V ON V.NUMDOC = C.NR_DOCUMENTO ' +
      '        LEFT OUTER JOIN CONTA_CORRENTE CV ON CV.ID = v.CONTA_BOLETO ' +
      '        LEFT OUTER JOIN FOP F ON F.COD_FOP = V.COD_FOP ' +
      '        WHERE ' +
      '          C.COD_CLIENTE = ' + Prcod_cliente.Text +
      '        ORDER BY ' +
      '          COD_CLIENTE, DTAVEN DESC ' +
      '      )   ' +
      '    Union ' +
      '    SELECT ' +
      '      c.Cod_cliente, NR_documento, titulo, cast(C.HISTORICO1 as varchar(300)) as historico, DTAVEN, ' +
      '      DTAREC, C.valor, valor_recebido, case when dtarec is null then case when DTAVEN >= current_date then ''À VENCER'' else ''VENCIDO'' END ELSE ''PAGO'' END AS SITUACAO, ' +
      '          case when dtarec is null then ' +
      '            coalesce(CV.NR_AGENCIA||'' ''||CV.NR_CONTA||'' ''||CV.NOM_CONTA, F.NOM_FOP) ' +
      '          Else ' +
      '          coalesce(CC.NR_AGENCIA||'' ''||CC.NR_CONTA||'' ''||CC.NOM_CONTA, ' +
      '          CASE E.TIPO WHEN 0 THEN ''DINHEIRO'' ' +
      '                      WHEN 1 THEN ''CHEQUE PRÓPRIO'' ' +
      '                      WHEN 2 THEN ''CHEQUE DE TERCEIROS'' ' +
      '                      WHEN 3 THEN ''PERMUTA'' ' +
      '                      WHEN 4 THEN ''DESCONTO'' ' +
      '          END) END AS CONTA ' +
      '    FROM ' +
      '      CR1 C ' +
      '    LEFT OUTER JOIN EXTRATO_CR1 EC ON EC.CR1 = C.ID ' +
      '    LEFT OUTER JOIN EXTRATO E ON E.ID = EC.EXTRATO ' +
      '    LEFT OUTER JOIN CONTA_CORRENTE CC ON CC.ID = E.ID_CONTA ' +
      '    LEFT OUTER JOIN VENDAS1 V ON V.NUMDOC = C.NR_DOCUMENTO ' +
      '    LEFT OUTER JOIN CONTA_CORRENTE CV ON CV.ID = v.CONTA_BOLETO ' +
      '    LEFT OUTER JOIN FOP F ON F.COD_FOP = V.COD_FOP ' +
      '    WHERE ' +
      '      C.COD_CLIENTE = ' + Prcod_cliente.Text +
      '      AND case when dtarec is null then case when DTAVEN >= current_date then ''À VENCER'' else ''VENCIDO'' END ELSE ''PAGO'' END = ''VENCIDO'' ' +
      '  ) ' +
      'ORDER BY ' +
      '  DTAVEN DESC';

    with dm.q_ultimos_cr do
    begin
      close;
      sql.Clear;
      sql.add(cmd);
      open;
    end;
    dm.q_ultimos_cr.Open;

    if dm.q_ultimos_cr.RecordCount < 0 then
    begin
      dao.msg('Não foi encontrado registro neste periodo!');
      exit;
    end;

    if not (fr_relatorio.LoadFromFile(path + 'Relatorios\vendas_detalhado.fr3'))
      then
    begin
      dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 +
        'Avise o Suporte');
      exit;
    end;

    fr_relatorio.ShowReport;
  end;
end;

procedure TFr_vendas_industria2.PrJUSTIF_CANC_NFE_DEVChange(
  Sender: TObject);
begin
  if Length(PrJUSTIF_CANC_NFE_DEV.Text) >= 15 then
  begin
    BtnEnviarCancelamentoNFeDev.Enabled := true;
    BtnSairCancelamentoNFeDev.Enabled := true;
  end
  else
  begin
    BtnEnviarCancelamentoNFeDev.Enabled := false;
    BtnSairCancelamentoNFeDev.Enabled := false;
  end;
end;

procedure TFr_vendas_industria2.dgPedidosAgruparDblClick(
  Sender: TObject);
begin
  AgrupaPedidos;
end;

procedure TFr_vendas_industria2.dgPedidosAgruparDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
const
  IsChecked: array[Boolean] of Integer =
  (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  if (q_pedidos_agruparAGRUPADO.AsString = 'S') then
  begin
    dgPedidosAgrupar.Canvas.Font.Color := clTeal;
    if gdSelected in State then
    begin
      dgPedidosAgrupar.Canvas.Brush.Color := clTeal;
      dgPedidosAgrupar.Canvas.Font.Color := clWhite;
    end;
  end
  else
  begin
    dgPedidosAgrupar.Canvas.Font.Color := clGray;
    if gdSelected in State then
    begin
      dgPedidosAgrupar.Canvas.Brush.Color := clGray;
      dgPedidosAgrupar.Canvas.Font.Color := clWhite;
    end;
  end;

  dgPedidosAgrupar.DefaultDrawDataCell(rect, Column.Field, State);

  if (gdFocused in State) then
  begin

    if (Column.Field.FieldName = ckAgrupar.DataField) then
    begin
      ckAgrupar.Left := Rect.Left + dgPedidosAgrupar.Left + 2;
      ckAgrupar.Top := Rect.Top + dgPedidosAgrupar.top + 2;
      ckAgrupar.Width := Rect.Right - Rect.Left;
      ckAgrupar.Height := Rect.Bottom - Rect.Top;
      ckAgrupar.Visible := True;
    end;

  end
  else
  begin

    if (Column.Field.FieldName = ckAgrupar.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := ISChecked[Column.Field.AsString = 'S'];

      DrawFrameControl(dgPedidosAgrupar.Canvas.Handle, DrawRect, DFC_BUTTON,
        DrawState);
    end;

  end;

end;

procedure TFr_vendas_industria2.dgPedidosAgruparEnter(Sender: TObject);
begin
  CarregaDadosItem(q_pedidos_agruparNUMDOC.AsString);
end;

procedure TFr_vendas_industria2.dgPedidosAgruparKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  CarregaDadosItem(q_pedidos_agruparNUMDOC.AsString);
end;

procedure TFr_vendas_industria2.dgPedidosAgruparKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  CarregaDadosItem(q_pedidos_agruparNUMDOC.AsString);
end;

procedure TFr_vendas_industria2.dgPedidosAgruparCellClick(Column: TColumn);
begin
  CarregaDadosItem(q_pedidos_agruparNUMDOC.AsString);
end;

procedure TFr_vendas_industria2.q_pedidos_agruparAfterClose(
  DataSet: TDataSet);
begin
  q_itens.Close;
end;

procedure TFr_vendas_industria2.ckSemDevClick(Sender: TObject);
begin
  CarregaTotaisEmpresa;
end;

procedure TFr_vendas_industria2.I1Click(Sender: TObject);
var
  cmd, conexao, path: string;
  EmailConexao: TEmail;
begin
  if origem_tipo = 0 then
  begin
    path := ExtractFilePath(Application.ExeName);
    cmd := 'SELECT  a.NR_CONEXAO, a.COD_REPRESENTANTE, a.DATA_CONEXAO, a.HORA_CONEXAO, a.QTDE_PEDIDOS, a.QTDE_VISITAS_NEGATIVAS, a.CHECADO, a.USUARIO_CHECOU||''-''||u.NOME as USUARIO_CHECOU, a.DATA_HORA_CHECADO, '
      +
      ' (SELECT P.NUMDOC FROM VENDAS1 P WHERE P.NR_PEDIDO_PALM = v1.NR_PEDIDO_PALM) as NUMDOC, 0 AS numdoc_destino, v1.DTADOC, c.COD_CLIENTE||''-''||c.NOM_CLIENTE as cliente, c.ENDERECO, c.NR_ENDERECO, c.CEP, cid.NOM_CIDADE||''-''||cid.UF as cidade, ' +
      ' C.CNPJ, C.IE, C.RG,C.CPF, c.telefone, C.EMAIL, v1.TOT_BRUTO, v1.TOT_LIQUIDO, ' +
      ' v1.COD_FOP||''-''||f.NOM_FOP as fop, v1.COD_REPRESENTANTE||''-''||r.NOM_REPRESENTANTE as representante, p.PRAZO, cast(v1.NR_PEDIDO_PALM as varchar(10)) as NR_PEDIDO_PALM, v1.PALM_NR_CONEXAO, v1.OBSERVACOES_PEDIDO, ' +
      ' v2.ID, v2.COD_PRODUTO||''-''||pr.NOM_PRODUTO as produto, pr.unidade, v2.QTD, v2.PRECO, v2.SUB_TOTAL, v2.PRECO_BRUTO, (((v2.PRECO_BRUTO - v2.PRECO)/v2.PRECO_BRUTO) * 100) AS PERC_DESC, v2.VOLUME ' +
      ' FROM PALM_LOTE a ' +
      ' LEFT OUTER join tbusu u on (u.CODUSU = a.USUARIO_CHECOU) ' +
      ' inner join PEDIDO_PALM1 v1 on (v1.PALM_NR_CONEXAO = a.NR_CONEXAO) ' +
      ' inner join PEDIDO_PALM2 v2 on (v2.NR_PEDIDO_PALM = v1.NR_PEDIDO_PALM) ' +
      ' LEFT OUTER join CLIENTE c on (c.COD_CLIENTE = v1.COD_CLIENTE) ' +
      ' LEFT OUTER join Cidades cid on (cid.COD_Cidade = c.COD_cidade) ' +
      ' LEFT OUTER join REPRESENTANTE r on (r.id = v1.COD_REPRESENTANTE) ' +
      ' LEFT OUTER join prazo p on (p.ID = v1.COD_PRAZO_PGTO) ' +
      ' LEFT OUTER join fop f on (f.COD_FOP = v1.COD_FOP) ' +
      ' LEFT OUTER join produto pr on (pr.COD_PRODUTO = v2.COD_PRODUTO) WHERE 1 = 1 ';

    cmd := cmd + 'and v1.NR_PEDIDO_PALM = ' + QuotedStr(pedido_tablet);

    cmd := cmd +
      ' order by  representante, NR_CONEXAO, NUMDOC, pr.ord_pauta, v2.VOLUME ';

    with dm.q_palm_pedidos do
    begin
      close;
      sql.Clear;
      sql.add(cmd);
      open;
    end;

    //deletefile(ExtractFilePath(Application.ExeName) + 'conexao.sql');
    ///Fim do teste

    if dm.q_palm_pedidos.RecordCount < 0 then
    begin
      dao.msg('Não foi encontrado registro neste periodo!');
      exit;
    end;

    if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\palm_pedidos.fr3'))
      then
    begin
      dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 +
        'Avise o Suporte');
      exit;
    end;
  end
  else
  begin
    cmd := 'SELECT v1.COD_REPRESENTANTE, v1.USUARIO_CHECOU_PEDIDO_VENDEDOR||''-''||u.NOME as USUARIO_CHECOU, '
      +
      ' v1.NUMDOC, v1.DTADOC, c.COD_CLIENTE||''-''||c.NOM_CLIENTE as cliente, c.ENDERECO, c.NR_ENDERECO, c.CEP, cid.NOM_CIDADE||''-''||cid.UF as cidade, C.CNPJ, C.IE, C.RG,C.CPF, C.EMAIL, v1.TOT_BRUTO, v1.TOT_LIQUIDO, ' +
      ' v1.COD_FOP||''-''||f.NOM_FOP as fop, v1.COD_REPRESENTANTE||''-''||r.NOM_REPRESENTANTE as representante, p.PRAZO, '''' AS NR_PEDIDO_PALM, 0 as PALM_NR_CONEXAO, v1.OBSERVACOES_PEDIDO, ' +
      ' v2.ID, v2.COD_PRODUTO||''-''||pr.NOM_PRODUTO as produto, pr.unidade, v2.QTD, v2.PRECO, v2.SUB_TOTAL, v2.PRECO_BRUTO, (((v2.PRECO_BRUTO - v2.PRECO)/v2.PRECO_BRUTO) * 100) AS PERC_DESC, v2.VOLUME ' +
      ' FROM vendas1_orig v1 ' +
      ' LEFT OUTER join tbusu u on (u.CODUSU = v1.USUARIO_CHECOU_PEDIDO_VENDEDOR) ' +
      ' inner join vendas2_orig v2 on (v2.NUMDOC = v1.NUMDOC)' +
      ' inner join CLIENTE c on (c.COD_CLIENTE = v1.COD_CLIENTE)' +
      ' inner join Cidades cid on (cid.COD_Cidade = c.COD_cidade)' +
      ' inner join REPRESENTANTE r on (r.id = v1.COD_REPRESENTANTE)' +
      ' inner join prazo p on (p.ID = v1.COD_PRAZO_PGTO)' +
      ' inner join fop f on (f.COD_FOP = v1.COD_FOP) ' +
      ' inner join produto pr on (pr.COD_PRODUTO = v2.COD_PRODUTO) WHERE v1.numdoc = ' +
      Prnumdoc.Text;

    cmd := cmd +
      ' order by  representante, v1.NUMDOC, v2.COD_PRODUTO, v2.VOLUME ';

    with dm.q_pedidos_vendedor do
    begin
      close;
      sql.Clear;
      sql.add(cmd);
      open;
    end;

    if dm.q_palm_pedidos.RecordCount < 0 then
    begin
      dao.msg('Não foi encontrado registro neste periodo!');
      exit;
    end;

    if not (fr_relatorio.LoadFromFile(path + 'Relatorios\pedidos_vendedor.fr3'))
      then
    begin
      dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 +
        'Avise o Suporte');
      exit;
    end;
  end;
  fR_RELATORIO.ShowReport;
end;

procedure TFr_vendas_industria2.btnExportaFrenteClick(Sender: TObject);
var
  Gdoor: TFrenteCaixa;
begin
  Gdoor := TFrenteCaixa.Create();
  Gdoor.cliente(Prcod_cliente.Text);
  Gdoor.Produto(Prnumdoc.Text);
  Gdoor.Pedido(Prnumdoc.Text);
  Gdoor.Itens(Prnumdoc.Text);
  Gdoor.Free;
  showmessage('Exportação concluída com Sucesso!');
  dao.Geral5('SELECT FRENTE_CAIXA_EMPRESA_PADRAO FROM CONFIGURACAO ');
  Prempresa_faturar.Text :=
    dao.Q5.fieldbyname('FRENTE_CAIXA_EMPRESA_PADRAO').AsString;
  FaturamentoAvulso1Click(Self);
end;

procedure TFr_vendas_industria2.MePrecoBaseKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key in [',']) and (Pos(DecimalSeparator, MeprecoBase.Text) <> 0) then
    key := #0;
end;

procedure TFr_vendas_industria2.MePrecoBaseExit(Sender: TObject);
begin
  if (mmVendas2PRECO_BASE.Value > 0) then
    mmVendas2PRECO_LIQUIDO.Value := mmVendas2PRECO_BASE.Value;
end;

procedure TFr_vendas_industria2.Prtot_liquidoExit(Sender: TObject);
begin
  total_liquido_anterior := Prtot_liquido.value;
  CalcularDesconto;
end;

procedure TFr_vendas_industria2.BtnEnviarPedidoClick(Sender: TObject);
var
  Vendor: TConexaoVendor;
begin
  if trim(Prnumdoc.Text) = '' then
    exit;

  fm_splash.lbArquivos.Caption := 'Enviando Pedido...';
  fm_splash.update;
  try
    Vendor := TConexaoVendor.Create();
    Vendor.pedido(Prnumdoc.Text);
    Vendor.Free;
  finally
    ativa_vendas1(Prnumdoc.Text);
    mostra_campos_vendas1('Pr');
  end;

  fm_splash.close;
end;

procedure TFr_vendas_industria2.PrValorDescontoAdicExit(Sender: TObject);
begin
  Prtot_liquido.Value := Prtot_liquido.Value - PrValorDescontoAdic.Value;
end;

procedure TFr_vendas_industria2.Medesconto_ValorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key in [',']) and (Pos(DecimalSeparator, MeDesconto_Valor.Text) <> 0) then
    key := #0;
end;

procedure TFr_vendas_industria2.Medesconto_ValorExit(Sender: TObject);
begin
  if Medesconto_Valor.Value > Mesub_total.Value then
  begin
    dao.msg('Valor de Desconto não pode ser maior que o Subtotal!');
    Medesconto_Valor.SetFocus;
    exit;
  end;

  CalculaSubTotais;
  //  mmVendas2DESCONTO.Value := roundto(((mmVendas2DESCONTO_VALOR.value / mmVendas2sub_total.value) * 100), (CasasDecimais * (-1)));
end;

procedure TFr_vendas_industria2.BtAltTranspClick(Sender: TObject);
begin

  if not btaltped.Enabled then
    exit;
  if Prnumdoc.Text = '' then
    exit;

  if BtAltTransp.Caption = 'Alterar' then
  begin
    Prcod_transportadora.Enabled := true;
    Prcod_transportadora.setfocus;
    BtAltTransp.Caption := 'Gravar';
  end
  else
  begin
    dao.cn.StartTransaction;
    dao.Execsql('UPDATE VENDAS1 SET COD_TRANSPORTADORA = ' +
      Prcod_transportadora.Text + ' WHERE NUMDOC = ' + Prnumdoc.Text);
    dao.cn.Commit;
    Prcod_transportadora.Enabled := false;
    BtAltTransp.Caption := 'Alterar';
  end;

end;

procedure TFr_vendas_industria2.M1Click(Sender: TObject);
begin
  if trim(Prnumdoc.Text) = '' then
    exit;

  if frpri.TipUsu > '1' then
  begin
    if not ChecarDadosPedido then
      exit;

    if not ChecarDadosCliente then
      exit;

    if not ChecarDadosTransportadora then
      exit;

    if obrigatoriedade_peso and (Prpeso_nota.Value = 0) then
    begin
      showmessage('Não pode imprimir com Peso igual a Zero.');
      Exit;
    end;
  end;

  MontaPedido(Prnumdoc.Text);
end;

procedure TFr_vendas_industria2.I2Click(Sender: TObject);
begin
  imprimir(prnumdoc.text);
end;

procedure TFr_vendas_industria2.Imprimir(pedido: string);
var
  cmd, path: string;
  oExportfilter: TfrxCustomExportFilter;
begin
  if pedido = '' then
    exit;

  path := extractFilePath(application.ExeName);
  cmd := 'SELECT a.NR_CONEXAO, a.COD_REPRESENTANTE, a.DATA_CONEXAO, a.HORA_CONEXAO, coalesce(a.QTDE_PEDIDOS, 0) as QTDE_PEDIDOS, coalesce(a.QTDE_VISITAS_NEGATIVAS, 0) as QTDE_VISITAS_NEGATIVAS, a.CHECADO, '
    +
    ' a.USUARIO_CHECOU||''-''||u.NOME as USUARIO_CHECOU, A.DATA_HORA_CHECADO, ' +
    ' v1.NUMDOC, v1.numdoc_destino, v1.DTADOC, c.COD_CLIENTE||''-''||c.NOM_CLIENTE as cliente, c.telefone, c.ENDERECO, c.NR_ENDERECO, c.CEP, cid.NOM_CIDADE||''-''||cid.UF as cidade, C.CNPJ, C.IE, C.RG,C.CPF, C.EMAIL, COALESCE(v1.TOT_BRUTO, 0) AS TOT_BRUTO, ' +
    ' COALESCE(v1.TOT_LIQUIDO, 0) AS TOT_LIQUIDO, ' +
    ' v1.COD_FOP||''-''||f.NOM_FOP as fop, v1.COD_REPRESENTANTE||''-''||r.NOM_REPRESENTANTE as representante, p.PRAZO, v1.NR_PEDIDO_PALM, v1.PALM_NR_CONEXAO, v1.OBSERVACOES_PEDIDO, ' +
    ' v2.ID, v2.NUMDOC, v2.COD_PRODUTO||''-''||pr.NOM_PRODUTO as produto, pr.unidade, COALESCE(v2.QTD, 0) AS QTD, COALESCE(v2.PRECO, 0) AS PRECO, COALESCE(v2.SUB_TOTAL, 0) AS SUB_TOTAL, v2.NR_PEDIDO_PALM, COALESCE(v2.PRECO_BRUTO, 0) AS PRECO_BRUTO, ' +
    ' (((COALESCE(v2.PRECO_BRUTO,0) - COALESCE(v2.PRECO,0))/COALESCE(v2.PRECO_BRUTO,1)) * 100) AS PERC_DESC, COALESCE(v2.VOLUME,0) AS VOLUME ' +
    ' FROM vendas1 v1' +
    ' left outer join PALM_LOTE a on (v1.PALM_NR_CONEXAO = a.NR_CONEXAO)' +
    ' LEFT OUTER join tbusu u on (u.CODUSU = a.USUARIO_CHECOU)' +
    ' inner join vendas2 v2 on (v2.NUMDOC = v1.NUMDOC)' +
    ' inner join CLIENTE c on (c.COD_CLIENTE = v1.COD_CLIENTE)' +
    ' inner join Cidades cid on (cid.COD_Cidade = c.COD_cidade)' +
    ' inner join REPRESENTANTE r on (r.id = v1.COD_REPRESENTANTE)' +
    ' inner join prazo p on (p.ID = v1.COD_PRAZO_PGTO)' +
    ' inner join fop f on (f.COD_FOP = v1.COD_FOP) ' +
    ' inner join produto pr on (pr.COD_PRODUTO = v2.COD_PRODUTO) ' +
    'where v1.numdoc = ' + pedido;

  cmd := cmd +
    ' order by  representante, NR_CONEXAO, v1.NUMDOC, v2.COD_PRODUTO, v2.VOLUME ';

  with dm.q_palm_pedidos do
  begin
    close;
    sql.Clear;
    sql.add(cmd);
    open;
  end;

  if not (fr_relatorio.LoadFromFile(path + 'Relatorios\pedido_email.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 +
      'Avise o Suporte');
    exit;
  end;
  fr_relatorio.ShowReport;

end;

procedure TFr_vendas_industria2.sbDANFCeClick(Sender: TObject);
var
  CCeImp1: TCCeImp;
  pathSaida, arquivoNFe: string;
begin
  pathSaida := ExtractFilePath(Application.ExeName) + 'nf\';
  CCeImp1 := TCCeImp.Create(nil);
  CCeImp1.defineSaida(tps_PDF, pathSaida + prchave_nfe.text +
    '-ProcEventoNFe.pdf');
  CCeImp1.defineLayOut(fp_Portrait); // implementado impressão retrato

  arquivoNFe := PrChave_NFe.text + '-ProcEventoNFe.xml';
  if not FilesExists(pathSaida + arquivoNFe) then
  begin
    try
      dm.FTPNFe.Connect;
      if dm.FTPNFe.Connected then
      begin
        // transfere um arquivo texto
        dm.FTPNFe.TransferType := ftASCII;
        dm.FTPNFe.get(arquivoNFe, pathSaida + arquivoNFe);
        dm.FTPNFe.Quit;
      end;
    except
      dm.FTPNFe.Quit;
      showmessage('Erro ao carregar Arquivo no FTP...');
      deletefile(pathSaida + arquivoNFe);
      exit;
    end;
  end;

  CCeImp1.defineXMLCCe(pathSaida + arquivoNFe); // XML da CCe
  CCeImp1.defineSaida(tps_preview, pathSaida + prchave_nfe.text +
    '-ProcEventoNFe.pdf');
  CCeImp1.defineSoftHouse('.');
  try
    CCeImp1.Execute;
  except
    // Tratamento
  end;
  CCeImp1.Free;
end;

procedure TFr_vendas_industria2.q_cceAfterOpen(DataSet: TDataSet);
begin
  sbDANFCe.Enabled := not q_cce.IsEmpty;
end;

end.

