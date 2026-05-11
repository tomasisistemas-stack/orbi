unit Un_vendas_industria2;

interface

uses
  Windows, Messages, ShellAPI, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Menus, Mask, Buttons, NFE_dll_TLB, Grids,
  ExtCtrls, StrUtils, ActnList, pmdfeConversaoMDFe, BaseGrid, AdvGrid,
   RDprint, ComObj, DateUtils,  xmldom, XMLIntf,
  msxmldom, XMLDoc, IdFTPCommon, ACBrNFe, ACBrNFeDANFEClass, pcnConversao,
  pcnConversaoNFe, DB, RxMemDS, DBGrids, RXDBCtrl, RXCtrls, DBCtrls, ImgList, frxClass,
  ACBrBase, ACBrBoleto, ACBrUtil, sSkinProvider, sPageControl, sSpeedButton,
  sPanel, sBitBtn, sLabel, sCheckBox, sGroupBox, ActiveX, sDBEdit, sDBText,
  sMaskEdit, sCustomComboEdit, sCurrEdit, sCurrencyEdit, acDBGrid, sTooledit,
  sEdit, sComboEdit, sComboBox, sRichEdit, sDBCheckBox, sDBCalcEdit,
  XPMan, sListBox, System.Actions, System.Rtti, System.TypInfo, AdvObj, RxToolEdit, ACBrBoletoFCFR,
  ACBrNFeDANFEFRDM, ACBrNFeDANFEFR, ACBrMDFe, ACBrDFe,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, ACBrDFeReport, ACBrDFeDANFeReport,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, ACBrDFe.Conversao,
  ACBrBoletoConversao, sDBDateEdit, Vcl.ExtDlgs;
// , xmldom;

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
    constructor Create(ChaveNfe, Justificativa, Protocolo: string; normal: boolean);
  end;

  TNFeCC = class(TThread)
  private
    pathSaida, cEvento, cChaveNfe, cJustificativa, strCabecXML: string;
    cont: integer;
    erro, finalizado: boolean;
    msgerros, MsgRetWS, strDados: WideString;
    tipAmb: integer;
    procedure Execute; override;
    // referente a NF-e
    function GerarXMLProcNFe: boolean;
    procedure Mostra;
    procedure LimparArquivos;
  public
    id, numdoc: string;
    constructor Create(ChaveNfe, Evento, Justificativa: string);
  end;

  TNFePedido = class(TThread)
  private
    cBuscarCertificado: _BuscarCertificado;
    tipAmb: integer;
    cont: integer;
    erro, finalizado: boolean;
    recibo, msgerros, status, motivo: WideString;
    ChaveNfe, PathLote, pathSaida: string;
    procedure Execute; override;
    // referente a NF-e
    procedure monta_NFE;
    procedure GravarChaveNfe;
    procedure TransfereNfeFTP;
    procedure EnviarLote(arquivo: string);
    procedure GravarReciboNfe;
    function GerarXMLProcNFe: boolean;
    procedure Mostra;
  public
    tipo: integer; // 0 - Saida; 1 - Entrada;
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
    Label11: tsLabel;
    Lbnom_representante: tsLabel;
    Prcod_representante: TsComboEdit;
    Label8: tsLabel;
    Lbnom_cliente: tsLabel;
    Lbnom_fop: tsLabel;
    Label16: tsLabel;
    Label17: tsLabel;
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
    Prcod_carga: TsEdit;
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
    lbObs: tsLabel;
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
    Btnovped: TSpeedButton;
    Btaltped: TSpeedButton;
    Btgraped: TSpeedButton;
    Btcanped: TSpeedButton;
    Btexcped: TSpeedButton;
    Btlocped: TSpeedButton;
    rd_vendas: TRDprint;
    tab_cr1: TsTabSheet;
    GroupBox8: TsGroupBox;
    Label30: tsLabel;
    Label31: tsLabel;
    Label32: tsLabel;
    Label33: tsLabel;
    Label51: tsLabel;
    gbAtalhos: TsGroupBox;
    Label52: tsLabel;
    Label54: tsLabel;
    Label55: tsLabel;
    Label56: tsLabel;
    Btinsere_cheque: TSpeedButton;
    Label34: tsLabel;
    Label53: tsLabel;
    Pacheque: TPanel;
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
    XMLNFe: TXMLDocument;
    TaNFe: TsTabSheet;
    Lbnom_supervisor: tsLabel;
    lbSupervisor: tsLabel;
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
    Panel3: tpanel;
    Label9: tsLabel;
    Lbnom_produto_db: TsDBText;
    Label18: tsLabel;
    Label19: tsLabel;
    Label20: tsLabel;
    lbDesc: tsLabel;
    lbPrecoLiq: tsLabel;
    lbTotalLiq: tsLabel;
    Label37: tsLabel;
    Label6: tsLabel;
    Panel1: tpanel;
    btnov: TSpeedButton;
    btalt: TSpeedButton;
    btgra: TSpeedButton;
    btcan: TSpeedButton;
    btexc: TSpeedButton;
    zzunidade: TsEdit;
    Meqtd: TsDBCalcEdit;
    Medesconto: TsDBCalcEdit;
    Mepreco: TsDBCalcEdit;
    Mesub_total: TsDBCalcEdit;
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
    MeCesta_Basica: TsDBEdit;
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
    edUltimaNf: TsEdit;
    PrNF: TsEdit;
    Label58: tsLabel;
    Label65: tsLabel;
    PrNFE: TsEdit;
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
    Panel4: tpanel;
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
    BtnMaisPrecos: TSpeedButton;
    mmVendas2PERC_COMISSAO: TFloatField;
    mmVendas2GRADE_COMISSAO: TStringField;
    pnWait: TPanel;
    MePromocao: TsDBEdit;
    mmVendas2PROMOCAO: TStringField;
    meDESCONTO_MAX: TsDBCalcEdit;
    BtnAltFormaPrazo: TSpeedButton;
    BtnBoleto: TSpeedButton;
    mmVendas2PESO: TFloatField;
    mmVendas2PESO_TOTAL: TFloatField;
    Prtipo_frete: TComboBox;
    lbcontabanco: tsLabel;
    lbCCBoleto: tsLabel;
    Shape1: TShape;
    Foto: TImage;
    lbSituacao: tsLabel;
    BtnEmailPedido: TSpeedButton;
    BtnEtiqueta: TSpeedButton;
    btAltRep: TSpeedButton;
    TaNFeDevol: TsTabSheet;
    sGroupBox1: TsGroupBox;
    PrChave_NFe_DEV: TsEdit;
    sGroupBox2: TsGroupBox;
    PrRECIBO_NFE_DEV: TsEdit;
    sGroupBox4: TsGroupBox;
    PrPROTOCOLO_NFE_DEV: TsEdit;
    sGroupBox5: TsGroupBox;
    PrDATA_REC_NFE_DEV: TDateTimePicker;
    sGroupBox6: TsGroupBox;
    PrMotivo_nfe_DEV: TsEdit;
    sGroupBox7: TsGroupBox;
    PrStatus_Nfe_DEV: TsEdit;
    gbCancNFeDev: TsGroupBox;
    LBsTATUSCANCEL_DEV: tsLabel;
    PrJUSTIF_CANC_NFE_DEV: TsEdit;
    BtnEnviarCancelamentoNFeDev: TSpeedButton;
    BtnEditarCancelamentoNFeDev: TSpeedButton;
    BtnSairCancelamentoNFeDev: TSpeedButton;
    sGroupBox9: TsGroupBox;
    PrNFE_Dev: TsEdit;
    btnNfeDev: TSpeedButton;
    BtnDanfe_Dev: TSpeedButton;
    BtnEmailNFe_Dev: TSpeedButton;
    mmVendas2CODIGO_BARRAS: TStringField;
    BtnEmailBoleto: TSpeedButton;
    Shape2: TShape;
    sLabel3: tsLabel;
    edPesoTotal: TsCurrencyEdit;
    sLabel4: tsLabel;
    sLabel5: tsLabel;
    edDecTransp: TsCurrencyEdit;
    Prdtadoc: TsDateEdit;
    DS_CR2: TDataSource;
    sDBGrid1: Tdbgrid;
    Q2S: TFDQuery;
    q_cr1: TFDQuery;
    gbTotalFaturado: TsGroupBox;
    sLabel6: tsLabel;
    sLabel7: tsLabel;
    cbEmpresa: TComboBox;
    cbMes: TComboBox;
    sLabel8: tsLabel;
    gbImpostos: TsGroupBox;
    Label60: tsLabel;
    Label61: tsLabel;
    Label62: tsLabel;
    Label63: tsLabel;
    Label64: tsLabel;
    lbLucro: tsLabel;
    Prvlr_bc_icms: TsCurrencyEdit;
    Prvlr_icms: TsCurrencyEdit;
    Prvlr_ipi: TsCurrencyEdit;
    PrVLR_BC_ICMS_ST: TsCurrencyEdit;
    Prvlr_st: TsCurrencyEdit;
    edMargemLucro: TsCurrencyEdit;
    TaAgrupar: TsTabSheet;
    sPanel7: tpanel;
    Shape10: TShape;
    sLabel10: tsLabel;
    Shape6: TShape;
    sLabel9: tsLabel;
    dgPedidosAgrupar: Tdbgrid;
    sPanel6: TPanel;
    DBMemo2: TDBMemo;
    sPanel4: tpanel;
    sDBGrid2: Tdbgrid;
    sPanel1: TPanel;
    q_pedidos_agrupar: TFDQuery;
    ds_pedidos_agrupar: TDataSource;
    q_itens: TFDQuery;
    ds_itens: TDataSource;
    sLabel11: tsLabel;
    ckSemDev: tscheckbox;
    I1: TMenuItem;
    btnExportaFrente: TSpeedButton;
    MePrecoBase: TsDBCalcEdit;
    lbPrecoBase: tsLabel;
    mmVendas2PRECO_BASE: TFloatField;
    BtnEnviarPedido: TSpeedButton;
    sLabel2: tsLabel;
    PrValorDescontoAdic: TsCurrencyEdit;
    mmVendas2DESCONTO_VALOR: TFloatField;
    lbDescValor: tsLabel;
    Medesconto_Valor: TsDBCalcEdit;
    XPManifest1: TXPManifest;
    lbBC_ST: tsLabel;
    lb_valor_st: tsLabel;
    mmVendas2NAO_VALIDAR_MARGEM: TStringField;
    BtAltTransp: TSpeedButton;
    I2: TMenuItem;
    M1: TMenuItem;
    pgNFE: TsPageControl;
    TabDadosNFE: TsTabSheet;
    GroupBox9: TsGroupBox;
    gbChaveNfe: TsGroupBox;
    PrChave_NFe: TsEdit;
    gbMotivo: TsGroupBox;
    PrMotivo_nfe: TsEdit;
    GbStat: TsGroupBox;
    PrStatus_Nfe: TsEdit;
    gbProtocolo: TsGroupBox;
    PrPROTOCOLO_NFE: TsEdit;
    gbDataRecNFe: TsGroupBox;
    PrDATA_REC_NFE: TDateTimePicker;
    gbCancNfe: TsGroupBox;
    lbStatusCancel: tsLabel;
    sLabel1: tsLabel;
    lbMotivo: tsLabel;
    PrJUSTIF_CANC_NFE: TsEdit;
    BtnEnviarCancelamentoNFe: TSpeedButton;
    BtnEditarCancelamentoNFe: TSpeedButton;
    BtnSairCancelamentoNFe: TSpeedButton;
    PrMOTIVO_NFE_CANCEL_INTERNO: TsComboEdit;
    BtnDanfe: TSpeedButton;
    BtnEmailNFe: TSpeedButton;
    btXml: TSpeedButton;
    sbClonar: TSpeedButton;
    TabCCe: TsTabSheet;
    gbCC: TsGroupBox;
    PrCartaCorrecao: TsDBEdit;
    BtnEnviarCC: TSpeedButton;
    BtnEditarCC: TSpeedButton;
    BtnInsCC: TSpeedButton;
    BtnCancelCC: TSpeedButton;
    BtnGravarCC: TSpeedButton;
    dgCCe: Tdbgrid;
    q_cce: TFDQuery;
    ds_cce: TDataSource;
    gbPedidoAssociar: TsGroupBox;
    PrNUMDOC_DESTINO: TComboBox;
    lbBC_ICMS: tsLabel;
    Mevlr_bc_icms: TsDBCalcEdit;
    TabNfeRef: TsTabSheet;
    q_NFe_Ref: TFDQuery;
    ds_nfe_ref: TDataSource;
    sDBGrid3: Tdbgrid;
    gbChaveRef: TsGroupBox;
    edChaveNfeRef: TsEdit;
    btnExcNfeDev: TSpeedButton;
    btnInsNfeDev: TSpeedButton;
    btnCanNfeDev: TSpeedButton;
    L1: TMenuItem;
    L2: TMenuItem;
    mmVendas2CEST: TStringField;
    gbDesconto: TsGroupBox;
    PrDESCONTO_GERAL: TsCurrencyEdit;
    PrVLR_DESCONTO_GERAL: TsCurrencyEdit;
    mmVendas2DESCONTO_VALOR_GERAL: TFloatField;
    BtStatus: TSpeedButton;
    sGroupBox10: TsGroupBox;
    PrProcesso_id: TsEdit;
    btHistorico: TSpeedButton;
    MePERC_COMISSAO: TsDBCalcEdit;
    lbComis: tsLabel;
    btAltSup: TSpeedButton;
    ACBrNFe1: TACBrNFe;
    qrGravaXmlCCe: TFDQuery;
    lbTotalFaturado: tsLabel;
    stOrigem: tsLabel;
    ckAgrupar: TDBCheckBox;
    ACBrNFeDANFEFR1: TACBrNFeDANFEFR;
    qrGravaXml: TFDQuery;
    q_xml: TFDQuery;
    ds_xml: TDataSource;
    Label49: tsLabel;
    Probservacoes_nota: TsRichEdit;
    sGroupBox3: TsGroupBox;
    PrDIGEST_NFE_DEV: TsEdit;
    rgTipoCarta: TRadioGroup;
    PrEntradaNaoDevolucao: TCheckBox;
    qrGravaXmlDev: TFDQuery;
    q_NFe_RefID: TIntegerField;
    q_NFe_RefCHAVE_NFE: TStringField;
    q_pedidos_agruparNUMDOC: TIntegerField;
    q_pedidos_agruparDTADOC: TDateField;
    q_pedidos_agruparCOD_CLIENTE: TIntegerField;
    q_pedidos_agruparCLIENTE: TStringField;
    q_pedidos_agruparTOT_BRUTO: TBCDField;
    q_pedidos_agruparTOT_LIQUIDO: TBCDField;
    q_pedidos_agruparREPRESENTANTE: TStringField;
    q_pedidos_agruparOBSERVACOES_PEDIDO: TMemoField;
    q_pedidos_agruparAGRUPADO: TStringField;
    q_xmlXML: TBlobField;
    q_xmlXML_DEV: TBlobField;
    q_fotocod_produto: TIntegerField;
    q_fotosubcategoria: TIntegerField;
    q_fotoimagem_bd: TBlobField;
    q_fotoqtd_estoque: TBCDField;
    q_fotoqtd_reservado: TBCDField;
    q_fotoqtd_total: TFMTBCDField;
    q_fotoqtd_embalagem: TBCDField;
    q_fotounidade: TStringField;
    q_cr1id: TIntegerField;
    q_cr1instrucao_boleto: TStringField;
    q_cr1titulo: TStringField;
    q_cr1sequencia: TIntegerField;
    q_cr1dtaven: TDateField;
    q_cr1valor: TBCDField;
    q_cr1cod_fop: TIntegerField;
    q_cr1nom_fop: TStringField;
    q_cr1dtarec: TDateField;
    q_cr1valor_recebido: TBCDField;
    q_cr1boleto_remessa_ordem: TIntegerField;
    q_cr1conta_padrao: TIntegerField;
    Lbforma_pgto: TsLabel;
    Crdtaven: TsDateEdit;
    Crvalor: TsCurrencyEdit;
    Crcod_fop: TsComboEdit;
    Crtitulo: TsEdit;
    Crsequencia: TsEdit;
    Btgrava_cr1: TSpeedButton;
    sLabel12: TsLabel;
    sLabel13: TsLabel;
    Crdtarec: TsDateEdit;
    Crvalor_recebido: TsCurrencyEdit;
    Crid: TsEdit;
    BtnNFE: TSpeedButton;
    gbTipoNFe: TsGroupBox;
    PrTipoNFe: TComboBox;
    gbEntrada_Saida: TsGroupBox;
    PrNfeEntradaSaida: TComboBox;
    tbRefComplementar: TsTabSheet;
    gbNumDocRef: TsGroupBox;
    PrNumdoc_Ref: TsComboEdit;
    gbNFeRef: TsGroupBox;
    edNfe_Ref: TsEdit;
    gbChaveNfeRef: TsGroupBox;
    ed_Chave_nfe_ref: TsEdit;
    Prcod_cliente: TsComboEdit;
    Prcod_fop: TsComboEdit;
    Prcod_prazo_pgto: TsComboEdit;
    PrCONTA_BOLETO: TsComboEdit;
    status: TsLabel;
    gbNumOC: TsGroupBox;
    Prnum_oc: TEdit;
    SpeedButton1: TSpeedButton;
    Mecod_produto: TRxDBComboEdit;
    Prconsumidor_final: TCheckBox;
    sLabel14: TsLabel;
    lbDescCarga: TsLabel;
    SaveFileDlg: TSaveTextFileDialog;
    Label71: TsLabel;
    edPercComissao: TsCurrencyEdit;
    edTotComissao: TsCurrencyEdit;
    Label72: TsLabel;
    sbDANFCe: TSpeedButton;
    sLabel15: TsLabel;
    Probs_adicional: TsRichEdit;
    BtnAltObs: TSpeedButton;
    pnEstoque: TPanel;
    Label15: TsLabel;
    Label12: TsLabel;
    Label13: TsLabel;
    zzreal: TsCurrencyEdit;
    zzreservado: TsCurrencyEdit;
    zztotal: TsCurrencyEdit;
    procedure ChecarBoletoEmpresa(cc, empresa: string);
    procedure Prcod_clienteButtonClick(Sender: TObject);
    procedure Prcod_clienteKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_representanteButtonClick(Sender: TObject);
    procedure Prcod_representanteKeyPress(Sender: TObject; var Key: Char);
    procedure Prempresa_faturarButtonClick(Sender: TObject);
    procedure Prempresa_faturarKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_transportadoraButtonClick(Sender: TObject);
    procedure Prcod_transportadoraExit(Sender: TObject);
    procedure Prcod_transportadoraKeyPress(Sender: TObject; var Key: Char);
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
    procedure Prcontato_freteKeyPress(Sender: TObject; var Key: Char);
    procedure BtaltpedClick(Sender: TObject);
    procedure ReceberDados1Click(Sender: TObject);
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
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
    procedure Mecod_produtoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MeTrib_ICMSExit(Sender: TObject);
    procedure Meipi_itemExit(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1MouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: boolean);
    procedure DBGrid1MouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: boolean);
    procedure Mecod_fiscal_itemButtonClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Meicms_itemExit(Sender: TObject);
    procedure CancelamentoAvulso1Click(Sender: TObject);
    procedure ImprimirPedidoDetalhado1Click(Sender: TObject);
    procedure fR_RELATORIOGetValue(const VarName: string; var Value: Variant);
    procedure BtnMaisPrecosClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Prcod_clienteChange(Sender: TObject);
    procedure MedescontoEnter(Sender: TObject);
    procedure BtnAltFormaPrazoClick(Sender: TObject);
    procedure BtnBoletoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Mecod_produtoChange(Sender: TObject);
    procedure Mecod_produtoEnter(Sender: TObject);
    procedure PrCONTA_BOLETOButtonClick(Sender: TObject);
    procedure PrCONTA_BOLETOExit(Sender: TObject);
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
    procedure BtnInsCCClick(Sender: TObject);
    procedure BtnCancelCCClick(Sender: TObject);
    procedure BtnGravarCCClick(Sender: TObject);
    procedure BtnEnviarCCClick(Sender: TObject);
    procedure PrCartaCorrecaoChange(Sender: TObject);
    procedure BtnEtiquetaClick(Sender: TObject);
    procedure PrMOTIVO_NFE_CANCEL_INTERNOButtonClick(Sender: TObject);
    procedure PrMOTIVO_NFE_CANCEL_INTERNOExit(Sender: TObject);
    procedure MedescontoChange(Sender: TObject);
    procedure btAltRepClick(Sender: TObject);
    procedure btnNfeDevClick(Sender: TObject);
    procedure btXML_DevClick(Sender: TObject);
    procedure BtnDanfe_DevClick(Sender: TObject);
    procedure BtnEmailBoletoClick(Sender: TObject);
    procedure BtnEditarCancelamentoNFeDevClick(Sender: TObject);
    procedure BtnEnviarCancelamentoNFeDevClick(Sender: TObject);
    procedure sbClonarClick(Sender: TObject);
    procedure Q2SAfterClose(DataSet: TDataSet);
    procedure Q2SBeforeOpen(DataSet: TDataSet);
    procedure q_cr1AfterScroll(DataSet: TDataSet);
    procedure q_cr1BeforeOpen(DataSet: TDataSet);
    procedure q_cr1AfterClose(DataSet: TDataSet);
    procedure cbEmpresaChange(Sender: TObject);
    procedure cbMesChange(Sender: TObject);
    procedure PrJUSTIF_CANC_NFE_DEVChange(Sender: TObject);
    procedure dgPedidosAgruparDblClick(Sender: TObject);
    procedure dgPedidosAgruparDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
    procedure dgPedidosAgruparEnter(Sender: TObject);
    procedure dgPedidosAgruparKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dgPedidosAgruparKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
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
    procedure q_cceAfterOpen(DataSet: TDataSet);
    procedure PrNUMDOC_DESTINOChange(Sender: TObject);
    procedure btnInsNfeDevClick(Sender: TObject);
    procedure btnExcNfeDevClick(Sender: TObject);
    procedure btnCanNfeDevClick(Sender: TObject);
    procedure q_NFe_RefAfterOpen(DataSet: TDataSet);
    procedure edChaveNfeRefChange(Sender: TObject);
    procedure L1Click(Sender: TObject);
    procedure L2Click(Sender: TObject);
    procedure PrDESCONTO_GERALExit(Sender: TObject);
    procedure PrVLR_DESCONTO_GERALExit(Sender: TObject);
    procedure sbDANFCeClick(Sender: TObject);
    procedure edDecTranspExit(Sender: TObject);
    procedure BtStatusClick(Sender: TObject);
    procedure MePERC_COMISSAOExit(Sender: TObject);
    procedure btAltSupClick(Sender: TObject);
    procedure Mesub_totalExit(Sender: TObject);
    procedure BtnEmailNFe_DevClick(Sender: TObject);
    procedure Prempresa_faturarChange(Sender: TObject);
    procedure PrNumdoc_RefButtonClick(Sender: TObject);
    procedure PrNumdoc_RefExit(Sender: TObject);
    procedure btnovClick(Sender: TObject);
    procedure btgraClick(Sender: TObject);
    procedure Btgrava_cr1Click(Sender: TObject);
    procedure BtlocpedClick(Sender: TObject);
    procedure BtnovpedClick(Sender: TObject);
    procedure BtgrapedClick(Sender: TObject);
    procedure BtcanpedClick(Sender: TObject);
    procedure BtexcpedClick(Sender: TObject);
    procedure Mecod_produtoButtonClick(Sender: TObject);
    procedure Mecod_produtoExit(Sender: TObject);
    procedure Mecod_produtoKeyPress(Sender: TObject; var Key: Char);
    procedure btcanClick(Sender: TObject);
    procedure btexcClick(Sender: TObject);
    procedure MedescontoExit(Sender: TObject);
    procedure MeprecoExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure ImprimirEtiquetadeTransporte1Click(Sender: TObject);
    procedure imprimirLotedePedidos1Click(Sender: TObject);
    procedure DesfaturarPedido1Click(Sender: TObject);
    procedure Prcod_cargaExit(Sender: TObject);
    procedure btXmlClick(Sender: TObject);
    procedure btHistoricoClick(Sender: TObject);
    procedure MeqtdExit(Sender: TObject);
    procedure PrNfeEntradaSaidaChange(Sender: TObject);
    procedure BtnAltObsClick(Sender: TObject);

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
    function VerificaEstoqueParaFaturar(cod_produto: string): boolean;
    { Verifica se existe quantidade suficiente no estoque para faturar o Pedido }
    function VerificaFaturaVencida(cod_cliente: string): boolean;
    { Private declarations }
    procedure ImprimePedido;
    procedure cancelar_faturamento(usuario_desfaturou, motivo: string);
    procedure MontaEtiquetaTransp(numdoc: string; coluna: integer);
    procedure DeletaLinha(Linha: integer);
    procedure CalculoIcmsItem;
    procedure AtualizaCalculoIcmsItem(sub_total, icms_item: double; id, ncm, cst: string);
    function Faturado: boolean;
    procedure MontaArquivoCobrancaBradescoEnvio;
    procedure BloquearPedido(pedido: string);
    procedure LiberarPedido(pedido: string);
    procedure AtualizaTotais(status: string);
    procedure ImprimirDanfe(chave: string; entrada: boolean = false);
    function TodosPromocao: boolean;
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
    function ChecaCFOP: boolean;
    function ValidarDesconto: boolean;
    procedure CFOPTROCA(alterar_itens : boolean);
    procedure PromocaoPorQuantidade(quantidade: string);
    procedure Imprimir(pedido: string; COM_ST, COM_DESC: boolean);
    function ChecarValorMinimoPedido: boolean;
    procedure CarregaChaveNfeDev;
    function BuscaAliquota(uf_origem, uf_destino, ncm, cest: string): real;
    procedure CalcularPeso;
    procedure CalcularPesoPerc;
    function CalculoComissaoDesconto: real;
    function BuscaNatOP(codigo: string): string;
    procedure HabilitaBotoesPedido(modo: Integer);
    procedure HabilitaBotoesItens(modo: integer);
    procedure bt_faturarClick(Sender: TObject);
    procedure Btinsere_chequeClick(Sender: TObject);
    procedure btnAlterarCRClick(Sender: TObject);
    procedure cancelamento_avulso;
    procedure ChecarFaturamentoLiquido(liquido, custo: double);
    procedure Crcod_fopButtonClick(Sender: TObject);
    procedure Crcod_fopExit(Sender: TObject);
    procedure Crcod_fopKeyPress(Sender: TObject; var Key: Char);
    procedure EnviarDadosparaDispositivo1Click(Sender: TObject);
    procedure Meid_corButtonClick(Sender: TObject);
    procedure Meid_corKeyPress(Sender: TObject; var Key: Char);
    procedure Meid_TamanhoButtonClick(Sender: TObject);
    procedure ProrcamentoChange(Sender: TObject);
    procedure Prpeso_notaExit(Sender: TObject);
    procedure PrTipoNFeChange(Sender: TObject);
    procedure Prtot_liquidoChange(Sender: TObject);
    procedure RDIMPNOTNewPage(Sender: TObject; Pagina: integer);
    procedure SgProCellsChanged(Sender: TObject; R: TRect);
    procedure SgProClickCell(Sender: TObject; ARow, ACol: integer);
    procedure SgProSelectCell(Sender: TObject; ACol, ARow: integer;
      var CanSelect: boolean);
    procedure SpeedButton1Click(Sender: TObject);
  public
    agrupar_pedidos, empresa_simples, cliente_aceita_simples, obrigatoriedade_peso, representacao, industria: boolean;
    nfe_duplicada: boolean;
    modo_insert: boolean;
    modo_insert_me: boolean;
    checar_qtd: boolean;
    venda: boolean;
    linMax: integer;
    MVA, Aliquota_ICMS_Interno: double; // Margem de Valor Agregado.
    acao: ShortString;
    id_mercadoria, id_pedido, UF_Cliente, UF_Emissor, mensagem_padrao: string;
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

    // variável que informa a qtd do produto antes da alteração...
    campo_pesquisado, dado_pesquisado: string;
    busca_qualquer_posicao_pesquisada, transferencia, troca: boolean;
    itens_repetidos: boolean;
    procedure insere_sgpro(tipo: string);
    procedure CalculaSubTotais;
    procedure ativa_vendas1(id: string);
    procedure DadosCCe;
    procedure ativa_vendas2(nr_documento: string);
    // carrega a Queryu com todos os produtos da Venda
    procedure ativa_cr1(numdoc: string);
    procedure mostra_cr1(numdoc: string);
    procedure CarregaDados;
    procedure carrega_vendas2;
    procedure mostra_campos_vendas1(prefixo: string);
    procedure gravar_liberacao_desconto(usuario, motivo: string);
    procedure mensagem_SB_vendas;
    // mostra as mensagen que fica no statubar do vendas
    procedure faturar(nr_documento, cod_cliente, cod_fop, cod_prazo: string; valor_total: real; NFe: boolean);
    procedure MontaPedido(n_pedido: string);
    procedure MontaNF(n_pedido: string);
    procedure MontaArquivoEnvio(nom_arquivo: string);
    procedure MontaArquivoCobrancaEnvio;
    // Monta Arquivo de Envio para os Palms
    procedure TrataArquivoRecebimento(nom_arquivo: string);
    // trata o arquivo recebido dos palms
    procedure CheckStatusNFe;
    function AjustaStr(str: string; tam: integer): string;
    procedure CarregaFoto(produto: string);
    procedure LimpaDescLucro;
    function CalculoComissao: real;
    procedure ClonarPedidoCancelado;
    function ChecarDadosCliente: boolean;
    function ChecarDadosTransportadora: boolean;
    procedure GerarParcelas(nr_documento, cod_cliente, cod_fop, cod_prazo: string; valor_total: real; NFe: boolean);
    function ChecarEmailCliente(cliente, tipo: string): boolean;
    function ChecarBoletoNFE(cc, NFe: string): boolean;
  end;

const
  sql_nota = 'SELECT ' + '  C.NOM_CLIENTE, ' + '  C.CPF, ' + '  C.CNPJ, ' + '  C.ENDERECO, ' + '  C.NR_ENDERECO, ' + '  C.BAIRRO, ' + '  C.CEP, ' + '  C.TELEFONE, ' + '  C.RG, ' + '  C.IE, ' + ' ' + '  CD.NOM_CIDADE AS CID_CLI, ' + '  CD.UF, ' + ' ' + '  V1.NUMDOC, ' + '  V1.NF, ' + '  V1.TOT_LIQUIDO, ' + '  V1.TIPO_FRETE, ' + '  V1.VOLUME_NOTA, ' + '  V1.PESO_NOTA, ' + '  V1.OBSERVACOES_NOTA, ' + '  V1.DTA_SAIDA, ' + '  V1.COD_FISCAL, ' + '  V1.DTA_EMISSAO, ' + '  V1.VLR_BC_ICMS, ' + '  V1.VLR_ICMS, ' +
    '  V1.VLR_IPI, ' + '  V1.CARTACORRECAO, ' + ' ' + '  CT.NOM_CIDADE AS CID_TRANSPORTADORA, ' + '  CT.UF AS UF_TRANSPORTADORA, ' + ' ' + '  FP.NOM_FOP, ' + '  TR.COD_TRANSPORTADORA, ' + '  TR.NOME AS NOM_TRANSPORTADORA, ' + '  TR.ENDERECO AS END_TRA, ' + '  TR.CNPJ AS CNPJ_TRA, ' + '  TR.IE AS IE_TRA, ' + '  TR.PLACA, ' + '  TR.MOTORISTA, ' + ' ' + '  CF.NOME AS NOM_CFOP, ' + ' ' + '  SUM(V2.VLR_BC_ST) AS VLR_BC_ST, ' + '  SUM(V2.VLR_ICMS_ST) AS VLR_ICMS_ST ' + 'FROM VENDAS1 V1 ' +
    'INNER JOIN VENDAS2 V2 ON (V1.NUMDOC = V2.NUMDOC) ' + 'LEFT JOIN CLIENTE C ON C.COD_CLIENTE = V1.COD_CLIENTE ' + 'LEFT JOIN CIDADES CD ON CD.COD_CIDADE = C.COD_CIDADE ' + 'LEFT JOIN TRANSPORTADORA TR ON TR.COD_TRANSPORTADORA=V1.COD_TRANSPORTADORA ' + 'LEFT JOIN COD_FISCAL CF ON CF.COD_FISCAL=V1.COD_FISCAL ' + 'LEFT JOIN CIDADES CT ON CT.COD_CIDADE=TR.COD_CIDADE ' + 'LEFT JOIN FOP FP ON (FP.COD_FOP=V1.COD_FOP) ';
  sql_grupo_nota = 'GROUP BY' + '  C.NOM_CLIENTE, ' + '  C.CPF, ' + '  C.CNPJ, ' + '  C.ENDERECO, ' + '  C.NR_ENDERECO, ' + '  C.BAIRRO, ' + '  C.CEP, ' + '  C.TELEFONE, ' + '  C.RG, ' + '  C.IE, ' + ' ' + '  CD.NOM_CIDADE, ' + '  CD.UF, ' + ' ' + '  V1.NUMDOC, ' + '  V1.NF, ' + '  V1.TOT_LIQUIDO, ' + '  V1.TIPO_FRETE, ' + '  V1.VOLUME_NOTA, ' + '  V1.PESO_NOTA, ' + '  V1.OBSERVACOES_NOTA, ' + '  V1.DTA_SAIDA, ' + '  V1.COD_FISCAL, ' + '  V1.DTA_EMISSAO, ' + '  V1.VLR_BC_ICMS, ' + '  V1.VLR_ICMS, ' + '  V1.VLR_IPI, ' + ' ' + '  CT.NOM_CIDADE, ' + '  CT.UF, ' + ' ' + '  FP.NOM_FOP, ' + '  TR.COD_TRANSPORTADORA, ' + '  TR.NOME, ' + '  TR.ENDERECO, ' + '  TR.CNPJ, ' + '  TR.IE, ' + '  TR.PLACA, ' + '  TR.MOTORISTA, ' + ' ' + '  CF.NOME ';
  sql_nota_dev = 'SELECT ' + '  C.RAZAO_SOCIAL as NOM_CLIENTE, ' + '  C.CNPCPF AS CPF, ' + '  C.CNPCPF AS CNPJ, ' + '  C.ENDERECO, ' + '  C.NR_ENDERECO, ' + '  C.BAIRRO, ' + '  C.CEP, ' + '  C.FONE AS TELEFONE, ' + '  C.IERG AS RG, ' + '  C.IERG AS IE, ' + ' ' + '  CD.NOM_CIDADE AS CID_CLI, ' + '  CD.UF, ' + ' ' + '  V1.NUMDOC, ' + '  V1.NF, ' + '  V1.TOT_LIQUIDO, ' + '  V1.TIPO_FRETE, ' + '  V1.VOLUME_NOTA, ' + '  V1.PESO_NOTA, ' + '  V1.OBSERVACOES_NOTA, ' + '  V1.DTA_SAIDA, ' + '  V1.COD_FISCAL, ' +
    '  V1.DTA_EMISSAO, ' + '  V1.VLR_BC_ICMS, ' + '  V1.VLR_ICMS, ' + '  V1.VLR_IPI, ' + '  V1.CARTACORRECAO, ' + ' ' + '  CT.NOM_CIDADE AS CID_TRANSPORTADORA, ' + '  CT.UF AS UF_TRANSPORTADORA, ' + ' ' + '  FP.NOM_FOP, ' + '  TR.COD_TRANSPORTADORA, ' + '  TR.NOME AS NOM_TRANSPORTADORA, ' + '  TR.ENDERECO AS END_TRA, ' + '  TR.CNPJ AS CNPJ_TRA, ' + '  TR.IE AS IE_TRA, ' + '  TR.PLACA, ' + '  TR.MOTORISTA, ' + ' ' + '  CF.NOME AS NOM_CFOP, ' + ' ' + '  SUM(V2.VLR_BC_ST) AS VLR_BC_ST, ' +
    '  SUM(V2.VLR_ICMS_ST) AS VLR_ICMS_ST ' + 'FROM VENDAS1 V1 ' + 'INNER JOIN VENDAS2 V2 ON (V1.NUMDOC = V2.NUMDOC) ' + 'LEFT JOIN FORNECEDOR C ON C.COD_FORNECEDOR = V1.COD_FORNECEDOR ' + 'LEFT JOIN CIDADES CD ON CD.COD_CIDADE = C.COD_CIDADE ' + 'LEFT JOIN TRANSPORTADORA TR ON TR.COD_TRANSPORTADORA=V1.COD_TRANSPORTADORA ' + 'LEFT JOIN COD_FISCAL CF ON CF.COD_FISCAL=V1.COD_FISCAL ' + 'LEFT JOIN CIDADES CT ON CT.COD_CIDADE=TR.COD_CIDADE ' + 'LEFT JOIN FOP FP ON (FP.COD_FOP=V1.COD_FOP) ';
  sql_grupo_nota_dev = 'GROUP BY' + '  C.RAZAO_SOCIAL, ' + '  C.CNPCPF, ' + '  C.ENDERECO, ' + '  C.NR_ENDERECO, ' + '  C.BAIRRO, ' + '  C.CEP, ' + '  C.FONE, ' + '  C.IERG, ' + '  C.IERG, ' + ' ' + '  CD.NOM_CIDADE, ' + '  CD.UF, ' + ' ' + '  V1.NUMDOC, ' + '  V1.NF, ' + '  V1.TOT_LIQUIDO, ' + '  V1.TIPO_FRETE, ' + '  V1.VOLUME_NOTA, ' + '  V1.PESO_NOTA, ' + '  V1.OBSERVACOES_NOTA, ' + '  V1.DTA_SAIDA, ' + '  V1.COD_FISCAL, ' + '  V1.DTA_EMISSAO, ' + '  V1.VLR_BC_ICMS, ' + '  V1.VLR_ICMS, ' + '  V1.VLR_IPI, ' + '  V1.CARTACORRECAO, ' + ' ' + '  CT.NOM_CIDADE, ' + '  CT.UF, ' + ' ' + '  FP.NOM_FOP, ' + '  TR.COD_TRANSPORTADORA, ' + '  TR.NOME, ' + '  TR.ENDERECO, ' + '  TR.CNPJ, ' + '  TR.IE, ' + '  TR.PLACA, ' + '  TR.MOTORISTA, ' + ' ' + '  CF.NOME ';

var
  Fr_vendas_industria2: TFr_vendas_industria2;
  localizar_acionado, carregando_item, cliente_alterado, cliente_bloqueado, cliente_com_pendencia, habilita_faturamento, cliente_isento_icms, cliente_consumidor_final, cliente_sem_ie, Mostra, produto_alterado, cliente_pre_cadastrado, representante_funcionario, GravarPedido, aviso_conta_boleto, promocao_desconto: boolean;
  cliente_anterior, produto_anterior, cst, cesta_basica, supervisor, id, id_item, perc_comissao, pedido_tablet, vlr_comissao, id_remessa, sql_vendas2, carteira_conta, conta_boleto, empresa_faturar, usuario_liberou_desconto, situacaoTm, statusTm, nome_logo: string;
  origem_tipo, dias_protesto, dias_baixar: integer;
  WindowList: Pointer;
  desconto_prazo, desconto_forma, valor_minimo_pedido, desconto_especial_cliente, cliente_saldo: real;
  ListaItens: array of integer;
  LiberaItemRepetido, Pedido_AVista, gerar_cr, liberar_margem, ValidarDesc: boolean;
  modelo_desconto: integer;
  UltConsSerasa: TDate;
  Boleto_Avalista: string;
  processo: string;
  cliente_com_suspensao_pis_cofins, cliente_pronautica, cliente_proemprego: boolean;
  // EnviarEmailNfe: boolean;

implementation

uses
  Un_localizar, UnPri, Un_dao, Un_dados_cliente, UnFun, un_conexao_vendor,
  Un_imp_pedidos_lote, Un_cheque_terceiros, un_frente_caixa, UnSenha_especial,
  frmMontaXML, Math, nfe_v200, un_dm, un_nfe_transmissao, Un_nfe_envio_lote,
  un_motivo, un_mais_precos, Un_splash, Un_Cliente, Un_Transportadora,
  un_definir_saldo_inicial, ACBrNFeWebServices, pcnProcNFe, un_email_envio,
  un_historico_processo_pedido, un_escolhe_impressora_termica, un_nfe, Un_status_emissor;

{$R *.dfm}

procedure TFr_vendas_industria2.Prcod_cargaExit(Sender: TObject);
begin
  if trim(Prcod_carga.Text) = '' then
    lbDescCarga.Caption := '...';

  // Prpeso_nota.Value := edPesoTotal.Value;

  if Prcod_carga.Text <> '' then
  begin
    dao.Geral2('select c.id, c.nom_carga||'' - ''||v.nom_veiculo||'' - ''||m.nome as desc '+
               'from carga1 c '+
               'left outer join veiculos v on v.id = c.id_veiculo '+
               'left outer join motorista m on m.id = c.id_motorista '+
               'where c.id = '+ QuotedStr(Prcod_carga.Text));
    if dao.q2.RecordCount > 0 then
    begin
      lbDescCarga.Caption := dao.q2.fieldbyname('desc').AsString;
    end
    else
    begin
      if Prcod_carga.Enabled then
      begin
        dao.msg('Registro não Encontrado!');
        Prcod_carga.Text := '';
        Prcod_carga.SetFocus;
        Exit;
      end;
    end;

  end;

end;

procedure TFr_vendas_industria2.Prcod_clienteButtonClick(Sender: TObject);
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
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(Campos_combo[i]);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_vendas_industria2.Prcod_clienteKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  if not (Key in ['0'..'9', #8]) and (Key <> #13) then
  begin
    beep; { somente delphi 2.0 ou > }
    Key := #0;
  end;

  if Key = #13 then
  begin
    if Prcod_cliente.Text = '' then
      Prcod_clienteButtonClick(Self);

    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;
end;

procedure TFr_vendas_industria2.Prcod_representanteButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Representante';

  chamou_pesquisa := 'fr_representante';
  chamou_form := 'fr_pedido_representante';
  chamou_cadastro := 'fr_representante';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Represenante';

  if tipo_usuario < '4' then
    Fr_localizar.BT_cadastro.Visible := false
  else
    Fr_localizar.BT_cadastro.Visible := true;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 5);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'Empresa';
  Campos_combo[3] := 'CNPJ';
  Campos_combo[4] := 'CPF';

  for i := 0 to 4 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;

  Fr_localizar.CBcampos.ItemIndex := 1;

  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_vendas_industria2.Prcod_representanteKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  if not (Key in ['0'..'9', #8]) and (Key <> #13) then
  begin
    beep; { somente delphi 2.0 ou > }
    Key := #0;
  end;

  if Key = #13 then
  begin
    if (Prcod_representante.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
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

      // preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo, 5);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Nome';
      Campos_combo[2] := 'Empresa';
      Campos_combo[3] := 'CNPJ';
      Campos_combo[4] := 'CPF';

      for i := 0 to 4 do
      begin
        valor_combo := Campos_combo[i];
        Fr_localizar.CBcampos.Items.Add(valor_combo);
      end;

      Fr_localizar.CBcampos.ItemIndex := 1;

      Fr_localizar.ShowModal;
      Fr_localizar.Free;

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;
    end;
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;
end;

procedure TFr_vendas_industria2.Prempresa_faturarButtonClick(Sender: TObject);
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
  chamou_form := 'fr_pedido_empresa';
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

  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_vendas_industria2.Prempresa_faturarChange(Sender: TObject);
begin
  PrNFE.Clear;
end;

procedure TFr_vendas_industria2.Prempresa_faturarKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  if not (Key in ['0'..'9', #8]) and (Key <> #13) then
  begin
    beep; { somente delphi 2.0 ou > }
    Key := #0;
  end;

  if Key = #13 then
  begin
    if (Prempresa_faturar.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
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
        valor_combo := Campos_combo[i];
        Fr_localizar.CBcampos.Items.Add(Campos_combo[i]);
      end;
      Fr_localizar.CBcampos.ItemIndex := 1;

      Fr_localizar.ShowModal;
      Fr_localizar.Free;

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;

    end;
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;
end;

procedure TFr_vendas_industria2.Prcod_transportadoraButtonClick(Sender: TObject);
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
  chamou_form := 'fr_pedido_transportadora';
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

  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_vendas_industria2.Prcod_transportadoraExit(Sender: TObject);
begin
  if trim(Prcod_transportadora.Text) = '' then
    LbNom_transportadora.Caption := '...';

  // Prpeso_nota.Value := edPesoTotal.Value;

  if Prcod_transportadora.Text <> '' then
  begin
    dao.Geral2('select nome, interno from transportadora where cod_transportadora=' + QuotedStr(Prcod_transportadora.Text));
    if dao.q2.RecordCount > 0 then
    begin
      LbNom_transportadora.Caption := dao.q2.fieldbyname('nome').AsString;

      { if dao.q2.fieldbyname('interno').AsString = 'N' then
        edDecTransp.Value := 30
        else
        edDecTransp.Value := 0;

        Prpeso_nota.Value := edPesoTotal.Value -
        (edPesoTotal.Value * (edDecTransp.Value / 100)) }
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

procedure TFr_vendas_industria2.Prcod_transportadoraKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin

  if not (Key in ['0'..'9', #8]) and (Key <> #13) then
  begin
    beep; { somente delphi 2.0 ou > }
    Key := #0;
  end;

  if Key = #13 then
  begin
    if (Prcod_transportadora.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Transportadora';
      chamou_pesquisa := 'fr_transportadora';
      chamou_form := 'fr_pedido_transportadora';
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

      Fr_localizar.ShowModal;
      Fr_localizar.Free;

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;
    end;
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
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
        tscheckbox(Components[i]).Enabled := true
      else if Components[i] is TsDateEdit then
        TsDateEdit(Components[i]).Enabled := true
      else if Components[i] is TsComboEdit then
        TsComboEdit(Components[i]).Enabled := true
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(Components[i]).Enabled := true
      else if Components[i] is TMaskEdit then
        TMaskEdit(Components[i]).Enabled := true
      else if Components[i] is TComboBox then
        TComboBox(Components[i]).Enabled := true
      else if Components[i] is TsRichEdit then
        TsRichEdit(Components[i]).Enabled := true;
    end;
  end;
  // Dados da NF-e sempre somente leitura...
  PrChave_NFe.ReadOnly := true;
  PrChave_NFe.Enabled := true;
  PrPROTOCOLO_NFE.ReadOnly := true;
  PrValorDescontoAdic.ReadOnly := true;
  PrDATA_REC_NFE.Enabled := false;
  PrValorDescontoAdic.ReadOnly := false;
  PrStatus_Nfe.ReadOnly := true;
  PrMotivo_nfe.ReadOnly := true;

  DBGrid1.Enabled := false;
  MePreco_venda.ReadOnly := true;
end;

procedure TFr_vendas_industria2.readonly_true(prefixo: ShortString);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if copy(Components[i].Name, 1, 2) = prefixo then
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
        tscheckbox(Components[i]).Enabled := false
      else if Components[i] is TsComboEdit then
        TsComboEdit(Components[i]).Enabled := false
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(Components[i]).Enabled := false
      else if Components[i] is TsDateEdit then
        TsDateEdit(Components[i]).Enabled := false
      else if Components[i] is TMaskEdit then
        TMaskEdit(Components[i]).Enabled := false
      else if Components[i] is TsRichEdit then
        TsRichEdit(Components[i]).Enabled := false
      else if Components[i] is TComboBox then
        TComboBox(Components[i]).Enabled := false;
    end;
  end;
  if mmVendas2.RecordCount > 0 then
    DBGrid1.Enabled := true;

  PrChave_NFe.ReadOnly := true;
  PrChave_NFe.Enabled := true;

end;


procedure TFr_vendas_industria2.limpa_campos(prefixo: ShortString);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).Clear
      else if Components[i] is TEdit then
        TEdit(Components[i]).Clear
      else if Components[i] is TsComboEdit then
        TsComboEdit(Components[i]).Clear
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(Components[i]).Clear
      else if Components[i] is TsDateEdit then
        TsDateEdit(Components[i]).Clear
      else if Components[i] is TMaskEdit then
        TMaskEdit(Components[i]).Clear
      else if Components[i] is TsRichEdit then
        TsRichEdit(Components[i]).Clear
      else if Components[i] is TComboBox then
        TComboBox(Components[i]).ItemIndex := 0;
    end;
  end;
  if prefixo = 'Pr' then
  begin
    Lbnom_representante.Caption := '...';
    Lbnom_supervisor.Caption := '...';
    Lbnom_cliente.Caption := '...';
    Lbnom_fop.Caption := '...';
    Lbprazo_pgto.Caption := '...';
    Lbempresa_faturamento.Caption := '...';
    LbNom_transportadora.Caption := '...';

  end
  else if prefixo = 'Me' then
  begin
    zzunidade.Text := '';
    zzqtd_embalagem.Value := 0;
  end;
  // stOrigem.Caption := '';
  I1.Enabled := false;
  PrNUMDOC_DESTINO.Text := '';
end;

procedure TFr_vendas_industria2.btaltClick(Sender: TObject);
var
  volume: real;
begin
  // GravarPedido := true;
  modo_insert_me := false;
  if desconto_maximo = '' then
    Prcod_clienteExit(Self);

  readonly_true('Pr');
  produto_alterado := false;
  checar_qtd := true;
  if Btnovped.Enabled = true then
  begin
    dao.msg('O Pedido está com Status Neutro, você deve Clicar no Botão Alterar ou Inserir!');
    Exit;
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
    Mevolume.Text := '1';
    Mevolume.Enabled := false
  end;

  if mform <> 'vendas_devolucoes' then
  begin
    Mecod_fiscal_item.Enabled := false;
    MeTrib_ICMS.Enabled := false;
  end;

  Mesub_total.ReadOnly := true;
  qtd_anterior := mmVendas2QTD.Value;

  if not (mmVendas2.State in [dsBrowse]) then
    mmVendas2.Cancel;

  mmVendas2.Edit;
  Mecod_produto.SetFocus;

  HabilitaBotoesItens(0);

end;

procedure TFr_vendas_industria2.totaliza_pedido;
begin

end;


procedure TFr_vendas_industria2.PrdtadocKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;

  end;
end;

procedure TFr_vendas_industria2.Prcod_representanteExit(Sender: TObject);
begin
  if trim(Prcod_representante.Text) = '' then
    Lbnom_representante.Caption := '...';

  if Prcod_representante.Text <> '' then
  begin
    if (not FMFUN.verificaNumerico(Prcod_representante.Text)) and (length(Prcod_representante.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      Prcod_representante.SetFocus;
      Exit;
    end;

    dao.Geral3('select nom_representante, funcionario, MARGEM_MINIMA, MARGEM_IDEAL, INDICE_ABAIXO, INDICE_ACIMA, PERC_COMISSAO_FIXA, somente_consumidor_final from representante where ativo = ''S'' and funcionario in (''0'', ''1'', ''4'') and id=' + Prcod_representante.Text);
    if dao.q3.RecordCount > 0 then
    begin

      margem_lucro_ideal := dao.q3.fieldbyname('MARGEM_IDEAL').AsCurrency;
      margem_lucro_minima := dao.q3.fieldbyname('MARGEM_MINIMA').AsCurrency;
      indice_abaixo := dao.q3.fieldbyname('INDICE_ABAIXO').AsCurrency;
      indice_acima := dao.q3.fieldbyname('INDICE_ACIMA').AsCurrency;
      comissao_fixa := dao.q3.fieldbyname('PERC_COMISSAO_FIXA').AsCurrency;

      Prconsumidor_final.Checked := dao.q3.fieldbyname('somente_consumidor_final').AsString = 'S';
      if Prconsumidor_final.Checked then
      begin
        dao.Geral5('select e.cod_empresa, e.nom_empresa ' +
                   'From empresa e ' +
                   'where consumidorfinal = ''S'' limit 1');
        if dao.q5.RecordCount > 0 then
        begin
          Prempresa_faturar.Text := dao.q5.fieldbyname('cod_empresa').AsString;
          Lbempresa_faturamento.Caption := dao.q5.fieldbyname('nom_empresa').AsString;
        end
      end;

      Lbnom_representante.Caption := dao.q3.fieldbyname('nom_representante').AsString;
      if dao.q3.fieldbyname('funcionario').AsString = '1' then
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
var
  preco: real;
begin
  if mmVendas2.RecordCount = 0 then
    Exit;

  LiberaItemRepetido := true;
  Pc_vendas.TabIndex := 0;
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
    mmVendas2.Edit;

    if not Faturado then
    begin
      preco := mmVendas2PRECO_LIQUIDO.Value;
      dados_produto(mmVendas2COD_PRODUTO.AsString);

      mmVendas2PRECO_LIQUIDO.Value := preco;
      ValidarDesc := false;
      MeprecoExit(Self);

      btgraClick(Self);
    end;
    ValidarDesc := true;
    fm_splash.ggProgress.AddProgress(1);
    fm_splash.refresh;
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

    if (not FMFUN.verificaNumerico(Prcod_cliente.Text)) and (length(Prcod_cliente.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      Prcod_cliente.SetFocus;
      Exit;
    end;

    sql_cliente := 'select c.nom_cliente, c.SUSPENSAO_PIS_CONFINS, coalesce(c.UltConsSerasa, c.DTA_CAD_SPC) as UltConsSerasa, c.cliente_bloqueado, c.cnpj, c.pre_cadastro, cd.nom_cidade, c.id_representante, ' +
                   ' c.ACEITA_NOTA_SIMPLES, c.desconto_maximo, cd.uf, coalesce(c.desconto_especial, 0) as desconto_especial, pronautica, ' +
                   'CASE WHEN c.IE = ''ISENTO'' or c.IE = ''ISENTA'' THEN ''1'' ELSE CASE WHEN c.ie is null and c.TIP_PESSOA = ''J'' THEN ''2'' ELSE ''0'' END END AS ISENTO, c.consumidor_final, coalesce(c.saldo, 0) as saldo ' +
                   'from cliente c ' +
                   'left join cidades cd on cd.cod_cidade=c.cod_cidade ' +
                   'where c.cod_cliente=' + QuotedStr(Prcod_cliente.Text);

    if FRPRI.TipUsu = '0' then
    begin
      if not FRPRI.supervisor then
        sql_cliente := sql_cliente + ' and ID_REPRESENTANTE = ' + FRPRI.Representante_id
      else
        sql_cliente := sql_cliente + ' and ID_REPRESENTANTE in (select r.ID from REPRESENTANTE r where r.FUNCIONARIO in (0 , 1) and r.ATIVO = ''S'')  and c.cliente_bloqueado = ''N'' ';
    end;

    dao.Geral4(sql_cliente);

    if dao.q4.RecordCount > 0 then
    begin
      cliente_bloqueado := dao.q4.fieldbyname('CLIENTE_BLOQUEADO').AsString = 'S';
      cliente_saldo := dao.q4.fieldbyname('SALDO').AsFloat;


      UltConsSerasa := dao.q4.fieldbyname('UltConsSerasa').AsDateTime;

      cliente_com_suspensao_pis_cofins := dao.q4.fieldbyname('SUSPENSAO_PIS_CONFINS').AsString = 'S';
      desconto_especial_cliente := dao.q4.fieldbyname('DESCONTO_ESPECIAL').AsFloat;
      if (desconto_especial_cliente > 0) then
        Probservacoes_nota.Text := 'Desconto VP. ' + formatfloat('##0.00%', desconto_especial_cliente) + ' no 1o. Boleto.';

      cliente_aceita_simples := dao.q4.fieldbyname('ACEITA_NOTA_SIMPLES').AsString = 'S';
      dao.q4.Open;

      cliente_consumidor_final := dao.q4.fieldbyname('consumidor_final').AsString = 'S';

      if (dao.q4.fieldbyname('isento').AsString = '1') or (dao.q4.fieldbyname('isento').AsString = '2') then
        cliente_isento_icms := true
      else
        cliente_isento_icms := false;

      if dao.q4.fieldbyname('pre_cadastro').AsString = 'S' then
        cliente_pre_cadastrado := true
      else
        cliente_pre_cadastrado := false;

      if FRPRI.TeleVendas then
      begin
        if Prcod_representante.Text <> dao.q4.fieldbyname('id_representante').AsString then
          showmessage('Representante informado no Cliente é diferente ao informado.');
      end;

      Lbnom_cliente.Caption := dao.q4.fieldbyname('nom_cliente').AsString + ' | CNPJ: ' + dao.q4.fieldbyname('cnpj').AsString + ' | Cidade: ' + dao.q4.fieldbyname('nom_cidade').AsString + '/' + dao.q4.fieldbyname('uf').AsString;

      if UltConsSerasa > 0 then
        Lbnom_cliente.Caption := Lbnom_cliente.Caption + ' | Última Consulta SERASA/SPC: ' + FormatDateTime('dd/mm/yyyy', UltConsSerasa);

      desconto_maximo := dao.q4.fieldbyname('desconto_maximo').AsString;
      UF_Cliente := dao.q4.fieldbyname('uf').AsString;

      if Prempresa_faturar.Text <> '' then
        Prempresa_faturarExit(Self);

      if cliente_alterado and (mmVendas2.RecordCount > 0) and (trim(Prnumdoc.Text) <> '') then
        AtualizaTotais('Alteração de Cliente - Atualizando os Itens do Pedido...');

      cliente_anterior := Prcod_cliente.Text;

      dao.Geral3('select verifica_status_financeiro, agrupar_pedidos from configuracao where cod_conf=' + QuotedStr('1'));

      if dao.q3.fieldbyname('agrupar_pedidos').AsString = 'S' then
        CarregaDadosAgrupar(Prcod_cliente.Text, Prnumdoc.Text);

      if (FRPRI.TipUsu > '1') and (dao.q3.fieldbyname('verifica_status_financeiro').AsString = 'S') then
        cliente_com_pendencia := VerificaFaturaVencida(Prcod_cliente.Text);


      { if (frpri.tipusu > '1') then
        ChecarDataUltConsultaSerasa; }
      { if (frpri.tipusu > '1') then
        ImprimirPedidosAnteriores; }

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
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
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
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(Campos_combo[i]);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  { Fr_localizar.CBcampos.ItemIndex :=  Fr_localizar.CBcampos.Items.IndexOf(campo_pesquisado);
    Fr_localizar.EDlocalizar.Text := '';
    Fr_localizar.zzbusca_qualquer.Checked := busca_qualquer_posicao_pesquisada;
    Fr_localizar.loc_fop(Fr_localizar.EDlocalizar.Text); }

  Fr_localizar.loc_fop('');
  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_vendas_industria2.Prcod_fopKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  if not (Key in ['0'..'9', #8]) and (Key <> #13) then
  begin
    beep; { somente delphi 2.0 ou > }
    Key := #0;
  end;

  if Key = #13 then
  begin
    if (Prcod_fop.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
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
        valor_combo := Campos_combo[i];
        Fr_localizar.CBcampos.Items.Add(Campos_combo[i]);
      end;
      Fr_localizar.CBcampos.ItemIndex := 1;

      Fr_localizar.ShowModal;
      Fr_localizar.Free;

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;
    end;

    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;

end;

procedure TFr_vendas_industria2.Prcod_prazo_pgtoButtonClick(Sender: TObject);
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
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(Campos_combo[i]);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;
  Fr_localizar.loc_prazo_pagamento('');
  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_vendas_industria2.Prcod_prazo_pgtoKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  if not (Key in ['0'..'9', #8]) and (Key <> #13) then
  begin
    beep; { somente delphi 2.0 ou > }
    Key := #0;
  end;

  if Key = #13 then
  begin
    if (Prcod_prazo_pgto.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
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
        valor_combo := Campos_combo[i];
        Fr_localizar.CBcampos.Items.Add(Campos_combo[i]);
      end;
      Fr_localizar.CBcampos.ItemIndex := 1;

      Fr_localizar.ShowModal;
      Fr_localizar.Free;

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;
    end;

    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
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
      Exit;

    mmVendas2.First;
    mmVendas2.DisableControls;
    while not mmVendas2.Eof do
    begin
      mmVendas2.Edit;

      desconto_dado := (mmVendas2DESCONTO.Value + desconto_adicional);
      mmVendas2PRECO_LIQUIDO.Value := roundto(mmVendas2PRECO_VENDA.Value - (mmVendas2PRECO_VENDA.Value * (desconto_dado / 100)), (CasasDecimais * (-1)));
      mmVendas2DESCONTO.Value := desconto_dado;
      mmVendas2SUB_TOTAL.Value := mmVendas2PRECO_LIQUIDO.Value * mmVendas2QTD.Value;

      mmVendas2.post;
      mmVendas2.next;
    end;
    mmVendas2.EnableControls;
    somaTotal;
  end;

begin
  AtualizarDesconto;
  tentativa := 0;
 { while total_liquido_anterior <> Prtot_liquido.Value do
  begin
    // Prtot_liquido.value := total_liquido_anterior;
    // Prtot_liquidoChange(Self);
    AtualizarDesconto;
    tentativa := tentativa + 1;
    if tentativa > 20 then
    begin
      Prtot_liquido.Enabled := false;
      Exit;
    end;
  end;
  Prtot_liquido.Enabled := false;}
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
    if (not FMFUN.verificaNumerico(Prcod_fop.Text)) and (length(Prcod_fop.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      Prcod_fop.SetFocus;
      Exit;
    end;

    dao.Geral5('select nom_fop, desconto, avista, prazo_padrao, NAO_GERAR_CR from fop where ATIVO = ''S'' AND cod_fop=' + QuotedStr(Prcod_fop.Text));
    if dao.q5.RecordCount > 0 then
    begin
      Lbnom_fop.Caption := copy(dao.q5.fieldbyname('nom_fop').AsString, 1, 15);
      prazo_padrao := dao.q5.fieldbyname('prazo_padrao').AsString;
      Pedido_AVista := dao.q5.fieldbyname('avista').AsString = 'S';

      gerar_cr := dao.q5.fieldbyname('NAO_GERAR_CR').AsString <> 'S';
      desconto_forma := dao.q5.fieldbyname('desconto').AsFloat;
      if (desconto_forma = 100) and (mform = 'vendas_industria') then
        showmessage('Aviso - Esse Pedido tem que ser Lançado na Tela de Devoluções e Remessas!');

      PrCONTA_BOLETO.Enabled := Prcod_fop.Enabled;

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

      if dao.q5.fieldbyname('nom_fop').AsString = 'ATIVO IMOBILIZADO' then
      begin
        ChecaCFOP;
        CFOPTROCA(true);
      end
      else if not modo_insert then
      begin
        if (Prcod_fiscal.Text = '5405') or (Prcod_fiscal.Text = '6403') then
          ChecaCFOP;
      end;

      if not Prcod_prazo_pgto.Enabled then
      begin
        if Probservacoes_pedido.Enabled then
          Probservacoes_pedido.SetFocus;
      end;

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
  prazo_maximo, valor_minimo_sql: string;
begin
  if trim(Prcod_prazo_pgto.Text) = '' then
    Lbprazo_pgto.Caption := '...';

  prazo_maximo := '';
  desconto_prazo := 0;

  if FRPRI.TipUsu < '4' then
    prazo_maximo := ' and ATIVO = ''S'' ';

  if Prcod_prazo_pgto.Text <> '' then
  begin
    if (not FMFUN.verificaNumerico(Prcod_prazo_pgto.Text)) and (length(Prcod_prazo_pgto.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      Prcod_prazo_pgto.SetFocus;
      Exit;
    end;

    if trim(Prcod_representante.Text) <> '' then
      valor_minimo_sql := 'coalesce((select pr.VALOR_MINIMO from PRAZO_REPRESENTANTE pr where pr.ID_PRAZO = p.id and pr.ID_REPRESENTANTE = ' + Prcod_representante.Text + '), p.VALOR_MINIMO_PEDIDO) as valor_minimo_pedido '
    else
      valor_minimo_sql := 'p.VALOR_MINIMO_PEDIDO ';

    dao.Geral2('select p.prazo, p.desconto, ' + valor_minimo_sql + 'from prazo p where p.id = ' + QuotedStr(Prcod_prazo_pgto.Text));

    if dao.q2.RecordCount > 0 then
    begin
      Lbprazo_pgto.Caption := dao.q2.fieldbyname('prazo').AsString;
      desconto_prazo := dao.q2.fieldbyname('desconto').AsFloat;
      if dao.q2.fieldbyname('prazo').AsString = '00' then
        PrCONTA_BOLETO.Clear;
      valor_minimo_pedido := dao.q2.fieldbyname('VALOR_MINIMO_PEDIDO').AsCurrency;
    end
    else
    begin
      dao.msg('Registro não Encontrado ou não Ativo!');
      Prcod_prazo_pgto.Text := '';
      Prcod_prazo_pgto.SetFocus;
      Exit;
    end;
    gbDesconto.Enabled := desconto_prazo > 0;
  end;
  if (FRPRI.TipUsu = '0') or (FRPRI.TipUsu = '1') then
    Mecod_produto.SetFocus;
end;

function TFr_vendas_industria2.ChecarBoletoNFE(cc, NFe: string): boolean;
begin
  if NFe = '' then
  begin
    Result := true;
    Exit;
  end;

  if cc = '' then
  begin
    Result := true;
    Exit;
  end;

  dao.Geral1('SELECT a.NFE, a.NUMDOC, c.NOM_CLIENTE, a.CONTA_BOLETO, cc.NOM_CONTA FROM VENDAS1 a ' + 'inner join cliente c on c.COD_CLIENTE = a.COD_CLIENTE ' + 'inner join conta_corrente cc on cc.id = a.CONTA_BOLETO ' + 'where coalesce(a.nfe, a.numdoc) = ' + NFe + ' and a.conta_boleto = ' + cc + ' and a.numdoc <> ' + Prnumdoc.Text);
  if dao.q1.RecordCount = 0 then
    Result := true
  else
  begin
    showmessage('Boleto ' + dao.q1.fieldbyname('NOM_CONTA').AsString + ' da Nota Fiscal/Pedido nº ' + NFe + ' já está incluído no pedido nº ' + dao.q1.fieldbyname('NUMDOC').AsString + ' - ' + dao.q1.fieldbyname('NOM_CLIENTE').AsString);
    // prconta_boleto.SetFocus;
    Result := false
  end;
end;

procedure TFr_vendas_industria2.ChecarBoletoEmpresa(cc, empresa: string);
begin
  if Faturado then
    Exit;
  if aviso_conta_boleto then
    Exit;
  if trim(PrCONTA_BOLETO.Text) = '' then
    Exit;
  if trim(empresa) = '' then
    Exit;
  if PrCONTA_BOLETO.Text <> cc then
    if MessageDlg('Conta Corrente do Boleto diferente da Conta Associada na Empresa ' + empresa + '. Manter? ', mtConfirmation, [mbYes, mbno], 1) = mrno then
    begin
      PrCONTA_BOLETO.Text := cc;
      PrCONTA_BOLETOExit(Self);
    end
end;

function TFr_vendas_industria2.ClienteAceitaSimples: boolean;
begin
  Result := true;
  if (trim(Prempresa_faturar.Text) = '') or (trim(Prcod_cliente.Text) = '') then
    Exit;
  if (empresa_simples and not (cliente_aceita_simples) and not (Faturado)) then
  begin
    showmessage('Cliente não aceita Emissão pelo SIMPLES!');
    Result := true; // Nao bloqueia somente avisa...
  end;
end;

procedure TFr_vendas_industria2.CFOPTROCA(alterar_itens : boolean);

  procedure CarregaPedidoOrigem(bonificacao: boolean);
  begin

    if bonificacao then
    begin

      gbPedidoAssociar.Visible := true;

      dao.Geral5('SELECT V1.NUMDOC||'' - ''||V1.TOT_LIQUIDO AS PEDIDO, V1.NUMDOC FROM VENDAS1 V1 WHERE V1.COD_CLIENTE = ' + Prcod_cliente.Text +
	             ' AND V1.COD_FOP NOT IN (9,7,22) AND V1.FATURADO IN (0,1) ORDER BY V1.NUMDOC DESC limit 10 ');

      dao.q5.First;

      PrNUMDOC_DESTINO.Clear;

      while not dao.q5.Eof do
      begin
        PrNUMDOC_DESTINO.Items.Add(dao.q5.fieldbyname('NUMDOC').AsString);
        dao.q5.next;
      end;
      if q_vendas1.sql.Text <> '' then
      begin
        q_vendas1.Open;
//        PrNUMDOC_DESTINO.ItemIndex := PrNUMDOC_DESTINO.IndexOf(q_vendas1.fieldbyname('NUMDOC_DESTINO').AsString);
      end;
    end
    else
      PrNUMDOC_DESTINO.Text := '';
    gbPedidoAssociar.Visible := false;

  end;

  procedure AtualizarCFOPItens(status: string);
  begin

    if (FRPRI.TipUsu <= '3') then
    begin
      FaturamentoAvulso1.Visible := false;
      DesfaturarPedido1.Visible := false;
    end;

    if mmVendas2.RecordCount = 0 then
      Exit;

    LiberaItemRepetido := true;
    Pc_vendas.TabIndex := 0;
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
      mmVendas2.Edit;

      dao.Geral3('                                               ' + ' SELECT                                                 ' + '   case when p.COD_FISCAL_PRODUTO is not null then COALESCE(P.TRIB_ICMS, N.TRIB_ICMS) else N.TRIB_ICMS END AS TRIB_ICMS, ' + '   COALESCE(M.MVA, 0) AS MVA ' + ' FROM                                                   ' + '   PRODUTO P                                            ' + ' LEFT OUTER JOIN GRUPO G ON (G.COD_GRUPO = P.COD_GRUPO) ' +
        ' LEFT OUTER JOIN NCM N ON (N.CODIGO = coalesce(P.NCM, G.NCM) AND N.CEST = coalesce(p.cest, g.cest)) ' + ' LEFT OUTER JOIN MVA M ON ' + ' ( ' + '  (   ' + '    M.NCM = N.CODIGO ' + '    OR M.NCM = substring(n.CODIGO from 1 for 9) ' + '    OR M.NCM = substring(n.CODIGO from 1 for 8) ' + '    OR M.NCM = substring(n.CODIGO from 1 for 7) ' + '    OR M.NCM = substring(n.CODIGO from 1 for 6) ' + '    OR M.NCM = substring(n.CODIGO from 1 for 5) ' + '    OR M.NCM = substring(n.CODIGO from 1 for 4) ' +
        '    OR M.NCM = substring(n.CODIGO from 1 for 3) ' + '    OR M.NCM = substring(n.CODIGO from 1 for 2) ' + '  ) ' + '  AND M.CEST = N.CEST ' + ' AND M.UF_ORIGEM = ''' + UF_Emissor + ''' AND M.UF = ''' + UF_Cliente + ''') ' + ' WHERE P.COD_PRODUTO = ' + QuotedStr(mmVendas2COD_PRODUTO.AsString));

      MVA := dao.q3.fieldbyname('MVA').AsfLOAT;

      if dao.q3.fieldbyname('trib_icms').AsString = '0' then
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

      if dao.q3.fieldbyname('trib_icms').AsString = '1' then
        cst := '10';
      if dao.q3.fieldbyname('trib_icms').AsString = '2' then
        cst := '20';
      if dao.q3.fieldbyname('trib_icms').AsString = '3' then
        cst := '30';
      if dao.q3.fieldbyname('trib_icms').AsString = '4' then
        cst := '40';
      if dao.q3.fieldbyname('trib_icms').AsString = '5' then
        cst := '41';
      if dao.q3.fieldbyname('trib_icms').AsString = '6' then
        cst := '50';
      if dao.q3.fieldbyname('trib_icms').AsString = '7' then
        cst := '51';
      if dao.q3.fieldbyname('trib_icms').AsString = '8' then
      begin
        cst := '60';
        if UF_Cliente = UF_Emissor then
          mmVendas2COD_FISCAL_ITEM.Text := '5405'
        else
          mmVendas2COD_FISCAL_ITEM.Text := '6403';

        mmVendas2IPI_ITEM.Value := 0;
        mmVendas2VLR_IPI_ITEM.Value := 0;
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

      if dao.q3.fieldbyname('trib_icms').AsString = '9' then
        cst := '70';

      if dao.q3.fieldbyname('trib_icms').AsString = '10' then
        cst := '90';

      if mmVendas2CESTA_BASICA.Value then
        cst := '90';

      if ((UF_Cliente <> UF_Emissor) and (cst = '60')) then
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

      if (Lbnom_fop.Caption = 'TRANSFERENCIA') then
      begin
        cst := '00';
        if UF_Cliente = UF_Emissor then
          mmVendas2COD_FISCAL_ITEM.Text := '5152'
        else
          mmVendas2COD_FISCAL_ITEM.Text := '6152';
      end;

      if (Lbnom_fop.Caption = 'ATIVO IMOBILIZA') then
      begin
        cst := '00';
        if UF_Cliente = UF_Emissor then
          mmVendas2COD_FISCAL_ITEM.Text := '5551'
        else
          mmVendas2COD_FISCAL_ITEM.Text := '6551';
      end;


      if (Lbnom_fop.Caption = 'DEVOLUÇÃO') then
      begin
        if UF_Cliente = UF_Emissor then
          mmVendas2COD_FISCAL_ITEM.Text := '5202'
        else
          mmVendas2COD_FISCAL_ITEM.Text := '6202';
      end;

      if (Lbnom_fop.Caption = 'CONSIGNAÇÃO') then
      begin
        if UF_Cliente = UF_Emissor then
          mmVendas2COD_FISCAL_ITEM.Text := '5917'
        else
          mmVendas2COD_FISCAL_ITEM.Text := '6917';
      end;

      if (Lbnom_fop.Caption = 'BONIFICAÇÃO') then
      begin
        FaturamentoAvulso1.Visible := true;
        DesfaturarPedido1.Visible := true;

        if UF_Cliente = UF_Emissor then
          mmVendas2COD_FISCAL_ITEM.Text := '5910'
        else
          mmVendas2COD_FISCAL_ITEM.Text := '6910';

        CarregaPedidoOrigem(true);
      end
      else
        CarregaPedidoOrigem(false);

      mmVendas2TRIB_ICMS.Text := cst;
      CalculoIcmsItem;

      mmVendas2.post;
      fm_splash.ggProgress.AddProgress(1);
      fm_splash.refresh;
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
  if mform = 'vendas_devolucoes' then
    Exit;

  if Prcod_fop.Text = '' then
    Exit;

  CarregaPedidoOrigem(false);


  if (Lbnom_fop.Caption = 'TROCA') or (Lbnom_fop.Caption = 'PERMUTA') then
  begin
    troca := true;
  end
  else if (Lbnom_fop.Caption = 'TRANSFERENCIA') then
  begin
    if not ChecaCFOP then
    begin
//
    end;
  end
  else if (Lbnom_fop.Caption = 'BONIFICAÇÃO') then
  begin
    FaturamentoAvulso1.Visible := true;
    DesfaturarPedido1.Visible := true;
{    if UF_Cliente = UF_Emissor then
      ChecarTroca('5910')
    else
      ChecarTroca('6910');
}
    CarregaPedidoOrigem(true);
  end
  else if (Lbnom_fop.Caption = 'DEVOLUÇÃO') then
  begin
 {   if UF_Cliente = UF_Emissor then
      ChecarTroca('5413')
    else
      ChecarTroca('6413');  }
  end
  else if (Lbnom_fop.Caption = 'CONSIGNAÇÃO') then
  begin
 {   if UF_Cliente = UF_Emissor then
      ChecarTroca('5917')
    else
      ChecarTroca('6917'); }
  end
  else
  begin
    if ChecaCFOP then
    begin
    {
      if UF_Cliente = UF_Emissor then
        ChecarTroca('5405')
      else
        ChecarTroca('6403');
        }
    end
    else
    begin
     {
      if UF_Cliente = UF_Emissor then
        ChecarTroca('5102')
      else
        ChecarTroca('6102');
        }
    end;
  end;

  Prcod_fiscalExit(Self);

  if alterar_itens then
  begin
    AtualizarCFOPItens('Alterando CFOP dos Itens...');
    somaTotal;
  end;
end;

function TFr_vendas_industria2.ChecaCFOP: boolean;
var
  cfop_st: boolean;
  qtd_st: integer;
begin
  if mform <> 'vendas_industria' then
    Exit;
  transferencia := false;
  if mmVendas2.RecordCount > 0 then
  begin
    mmVendas2.DisableControls;
    mmVendas2.First;
    qtd_st := 0;
    while not mmVendas2.Eof do
    begin
      if (mmVendas2COD_FISCAL_ITEM.AsString = '5405') or (mmVendas2COD_FISCAL_ITEM.AsString = '6403') or (mmVendas2COD_FISCAL_ITEM.AsString = '5409') or (mmVendas2COD_FISCAL_ITEM.AsString = '6409') then
        qtd_st := qtd_st + 1;

      mmVendas2.next;
    end;
    mmVendas2.EnableControls;

    cfop_st := qtd_st > 0;

    if not cfop_st then
    begin
      if industria then
      begin
        if UF_Cliente = UF_Emissor then
          Prcod_fiscal.Text := '5101'
        else
          Prcod_fiscal.Text := '6101';
      end
      else
      begin
        if UF_Cliente = UF_Emissor then
          Prcod_fiscal.Text := '5102'
        else
          Prcod_fiscal.Text := '6102';
      end;
      if (Lbnom_fop.Caption = 'TRANSFERENCIA') then
      begin
        transferencia := true;
        if UF_Cliente = UF_Emissor then
          Prcod_fiscal.Text := '5152'
        else
          Prcod_fiscal.Text := '6152';
      end;
      if (Lbnom_fop.Caption = 'ATIVO IMOBILIZA') then
      begin
        if UF_Cliente = UF_Emissor then
          Prcod_fiscal.Text := '5551'
        else
          Prcod_fiscal.Text := '6551';
      end;
    end
  end;
  Result := cfop_st;
  Prcod_fiscalExit(Self);
  if mmVendas2.RecordCount > 0 then
    mmVendas2.First;
end;

procedure TFr_vendas_industria2.Prempresa_faturarExit(Sender: TObject);
var
  bConsumidorFinal : Boolean;
begin
  empresa_faturar := '';
  if trim(Prempresa_faturar.Text) = '' then
    Lbempresa_faturamento.Caption := '...';

  if Prempresa_faturar.Text <> '' then
  begin
    if (not FMFUN.verificaNumerico(Prempresa_faturar.Text)) and (length(Prempresa_faturar.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      Prempresa_faturar.SetFocus;
      Exit;
    end;

    dao.Geral5('select e.nom_empresa||'' - ''||e.CNPJ AS NOM_EMPRESA, e.nom_empresa as logo_desc, c.id as conta_corrente, cd.uf, e.ENQUADRADA_SIMPLES, e.logo, e.industria, coalesce(e.consumidorfinal, ''F'') as consumidorfinal ' +
               'From empresa e inner join cidades cd on cd.cod_cidade = e.cod_cidade ' +
               'left outer join conta_corrente c on (c.id_empresa = e.cod_empresa) where e.cod_empresa=' + QuotedStr(Prempresa_faturar.Text));
    if dao.q5.RecordCount > 0 then
    begin
      Lbempresa_faturamento.Caption := dao.q5.fieldbyname('nom_empresa').AsString;
      conta_boleto := dao.q5.fieldbyname('conta_corrente').AsString;
      empresa_faturar := dao.q5.fieldbyname('nom_empresa').AsString;
      UF_Emissor := dao.q5.fieldbyname('uf').AsString;
      empresa_simples := dao.q5.fieldbyname('ENQUADRADA_SIMPLES').AsString = 'S';
      industria := dao.q5.fieldbyname('INDUSTRIA').AsString = 'S';
      bConsumidorFinal := dao.q5.fieldbyname('consumidorfinal').AsString = 'S';
      // ChecarBoletoEmpresa(conta_boleto, empresa_faturar);
      nome_logo := dao.q5.fieldbyname('logo_desc').AsString + '.bmp';
      //TBlobField(dao.q5.fieldbyname('LOGO')).SaveToFile(nome_logo);
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

    if Prconsumidor_final.Checked and not bConsumidorFinal then
    begin
      dao.msg('Somente habilitado para Empresas para Consumidor Final!');
      Prempresa_faturar.SetFocus;
      Exit;
    end;

    if venda then
    begin
      dao.Geral1('select cd.uf from cliente c ' +
                 'left join cidades cd on cd.cod_cidade=c.cod_cidade ' +
                 'where cod_cliente=' + QuotedStr(Prcod_cliente.Text));

      if dao.q1.fieldbyname('uf').AsString = UF_Emissor then
        Prcod_fiscal.Text := '5102'
      else
        Prcod_fiscal.Text := '6102';

        ChecaCFOP;
    end;
  end;

end;

procedure TFr_vendas_industria2.monta_sgpro;
begin
  { SgPro.ColWidths[0] := 0;
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
    SgPro.Cells[21, 0] := 'Volume'; }
end;



procedure TFr_vendas_industria2.HabilitaBotoesItens(modo: integer);
begin
  case modo of
    0: //ALTERAR E INSERIR CLICADOS
      begin
        Btnov.Enabled := False;
        Btalt.Enabled := False;
        Btgra.Enabled := True;
        Btcan.Enabled := True;
        Btexc.Enabled := False;
      end;
    1: //GRAVAR E CANCELAR CLICADOS
      begin
        Btnov.Enabled := True;
        Btalt.Enabled := True;
        Btgra.Enabled := False;
        Btcan.Enabled := False;
        Btexc.Enabled := True;
      end;
  end;
end;



procedure TFr_vendas_industria2.busca_produto_unitario(leitor: boolean; cod_barras: string);
var
  cmd: string;
begin
  if leitor then
  begin
    if length(trim(cod_barras)) < 13 then
    begin
      dao.Geral1('select p.cod_produto, nom_produto, qtd_estoque, grade from produto p ' + 'left join cod_barras cb on cb.cod_produto=p.cod_produto ' + 'where cb.cod_barras=' + QuotedStr(cod_barras));
      dao.q1.First;
      if dao.q1.RecordCount < 1 then
      begin
        dao.msg('Produto não encontrado!');
        Mecod_produto.SetFocus;
        Exit;
      end
      else
      begin
        mmVendas2COD_PRODUTO.AsString := dao.q1.fieldbyname('cod_produto').AsString;
        mmVendas2NOM_PRODUTO.AsString := dao.q1.fieldbyname('nom_produto').AsString;
      end;
    end
    else
    begin
      if length(trim(cod_barras)) > 21 then
      begin
        if copy(cod_barras, 1, 4) <> '' then
          dao.Geral2('select grade from produto where cod_produto= ' + QuotedStr(copy(cod_barras, 1, 4)));

        if dao.q2.fieldbyname('grade').AsString = '0' then
        begin
          dao.Geral1('select p.cod_produto, p.nom_produto, p.qtd_estoque,p.preco_venda, p.grade, gd.id_cor, gd.id_tamanho, c.cor, t.tamanho from produto p ' + 'left join grade gd on gd.cod_produto=p.cod_produto ' + 'left join cores c on c.id=gd.id_cor ' + 'left join tamanho t on t.id=gd.id_tamanho ' + 'where p.cod_produto=' + QuotedStr(copy(cod_barras, 1, 4)) + ' and gd.id_cor = ' + QuotedStr(copy(cod_barras, 5, 3)) + ' and id_tamanho = ' + QuotedStr(copy(cod_barras, 8, 3)));
        end;
      end
      else if length(trim(cod_barras)) < 22 then
      begin
        if copy(cod_barras, 1, 4) <> '' then
          dao.Geral2('select grade from produto where cod_produto= ' + QuotedStr(copy(cod_barras, 1, 4)));

        if dao.q2.fieldbyname('grade').AsString = '0' then
        begin
          dao.Geral1('select p.cod_produto, p.nom_produto, p.qtd_estoque,p.preco_venda, p.grade, gd.id_cor, gd.id_tamanho, c.cor, t.tamanho from produto p ' + 'left join grade gd on gd.cod_produto=p.cod_produto ' + 'left join cores c on c.id=gd.id_cor ' + 'left join tamanho t on t.id=gd.id_tamanho ' + 'where p.cod_produto=' + QuotedStr(copy(cod_barras, 1, 4)) + ' and gd.id_cor = ' + QuotedStr(copy(cod_barras, 5, 3)) + ' and id_tamanho = ' + QuotedStr(copy(cod_barras, 8, 2)));
        end;
      end;

      if dao.q2.fieldbyname('grade').AsString = '1' then
      begin
        dao.Geral1('select p.cod_produto, p.nom_produto, p.qtd_estoque,p.preco_venda, p.grade, gd.id_cor, gd.id_tamanho, c.cor, t.tamanho from produto p ' + 'left join grade gd on gd.cod_produto=p.cod_produto ' + 'left join cores c on c.id=gd.id_cor ' + 'left join tamanho t on t.id=gd.id_tamanho ' + 'where p.cod_produto=' + QuotedStr(copy(cod_barras, 1, 4)));
      end;

      dao.q1.First;
      if dao.q1.RecordCount < 1 then
      begin
        dao.msg('Produto não encontrado!');
        Mecod_produto.SetFocus;
        Exit;
      end
      else
      begin
        mmVendas2COD_PRODUTO.AsString := dao.q1.fieldbyname('cod_produto').AsString;
        mmVendas2NOM_PRODUTO.AsString := dao.q1.fieldbyname('nom_produto').AsString;
      end;
    end;
  end;

  if not (leitor) then
  begin
    dao.Geral1('select p.cod_produto, nom_produto, qtd_estoque,preco_venda, grade from produto p ' + 'where p.cod_produto = ' + QuotedStr(cod_barras));

    if dao.q1.RecordCount < 1 then
    begin
      dao.msg('Produto não encontrado!');
      Mecod_produto.SetFocus;
      Exit;
    end;
  end;

end;

procedure TFr_vendas_industria2.CalculoIcmsItem;
// ICMS ST = (Al x BC ST) – ICMS operação própria
begin
  if not (mmVendas2.State in [dsEdit, dsInsert]) then
    Exit;

  mmVendas2ICMS_ITEM.Value := BuscaAliquota(UF_Emissor, UF_Cliente, MMVENDAS2NCM.AsString, MMVENDAS2CEST.AsString);

  if (UF_Emissor = 'SC') and (UF_Cliente = 'SC')  then
    if cliente_consumidor_final then
      mmVendas2ICMS_ITEM.Value := 17
    else
      mmVendas2ICMS_ITEM.Value := 12;

  if mmVendas2ICMS_ITEM.Value = 0 then
    mmVendas2VLR_BC.Value := 0
  else
    mmVendas2VLR_BC.Value := roundto(mmVendas2SUB_TOTAL.Value - (mmVendas2SUB_TOTAL.Value * (PrDESCONTO_GERAL.Value / 100)), -2);

  mmVendas2VLR_ICMS_ITEM.Value := roundto(mmVendas2VLR_BC.Value * (mmVendas2ICMS_ITEM.Value / 100), -2);
  if (cst = '60') or (cst = '90') or (cst = '10') then
  begin
    // Buscar a Base de Cáculo ST
    if cliente_aceita_simples and (UF_Cliente = 'SC') then
      MVA := MVA - (MVA * 0.7);

    mmVendas2VLR_BC_ST.Value := roundto(((mmVendas2VLR_BC.Value + mmVendas2VLR_IPI_ITEM.Value) * (1 + (MVA / 100))), -2);
    mmVendas2VLR_ICMS_ST.Value := roundto(((mmVendas2VLR_BC_ST.Value * (Aliquota_ICMS_Interno / 100)) - mmVendas2VLR_ICMS_ITEM.Value), -2);

    if (cst <> '10') and (UF_Emissor <> 'RS') then
    begin
      mmVendas2VLR_BC.Value := 0;
      mmVendas2VLR_ICMS_ITEM.Value := 0;
      mmVendas2ICMS_ITEM.Value := 0;
    end
    else
    begin
      mmVendas2VLR_BC.Value := 0;
      mmVendas2VLR_ICMS_ITEM.Value := 0;
    end;

    mmVendas2VLR_AGR_ITEM.Value := MVA;
    mmVendas2VLR_ICMS_ST.Value := mmVendas2VLR_ICMS_ST.Value;
  end
  else
  begin
    mmVendas2VLR_BC_ST.Value := 0;
    mmVendas2VLR_ICMS_ST.Value := 0;
    mmVendas2VLR_AGR_ITEM.Value := 0;
  end;

  if cliente_isento_icms or (cliente_consumidor_final and (UF_Cliente <> 'RS')) or troca  (* or cliente_aceita_simples *) then
  begin
    mmVendas2TRIB_ICMS.AsString := '00';

    { if UF_Cliente = UF_Emissor then
      mmVendas2COD_FISCAL_ITEM.AsString := '5102'
      else
      mmVendas2COD_FISCAL_ITEM.AsString := '6102'; }

    if ansiindexstr(UF_Cliente, ['AM', 'BA', 'CE', 'GO', 'MG', 'MS', 'MT', 'PE', 'RN', 'SE', 'SP']) > 0 then
    begin
      mmVendas2VLR_BC_ST.Value := 0;
      mmVendas2VLR_ICMS_ST.Value := 0;
      mmVendas2VLR_BC.Value := 0;
      mmVendas2VLR_ICMS_ITEM.Value := 0;
     // mmVendas2ICMS_ITEM.Value := 0;
    end;
  end;

  if transferencia then
  begin
    mmVendas2TRIB_ICMS.AsString := '00';

    if UF_Cliente = UF_Emissor then
      mmVendas2COD_FISCAL_ITEM.AsString := '5152'
    else
      mmVendas2COD_FISCAL_ITEM.AsString := '6152';

    mmVendas2VLR_BC_ST.Value := 0;
    mmVendas2VLR_ICMS_ST.Value := 0;
    mmVendas2VLR_BC.Value := 0;
    mmVendas2VLR_ICMS_ITEM.Value := 0;
    mmVendas2ICMS_ITEM.Value := 0;
  end;

end;

function TFr_vendas_industria2.BuscaAliquota(uf_origem, uf_destino, ncm, cest: string): real;
begin


  dao.Geral1('SELECT a.ALIQ_ICMS FROM MVA a WHERE A.NCM = ''' + ncm + ''' AND A.CEST = ''' + cest + ''' AND A.UF = ''' + uf_destino + ''' and  A.UF_ORIGEM = ''' + uf_origem + ''' ');
  if dao.q1.fieldbyname('ALIQ_ICMS').IsNull then
  begin
    dao.Geral1('SELECT a.ICMS, A.ICMS_CONSUMIDOR_FINAL FROM ICMS a where  A.UF = ''' + uf_destino + ''' and  A.UF_ORIGEM = ''' + uf_origem + ''' ');
    Result := dao.q1.fieldbyname('ICMS').AsFloat;
  end
  else
    Result := dao.q1.fieldbyname('ALIQ_ICMS').AsFloat;

  if cliente_consumidor_final and (uf_destino = 'SC') And (uf_ORIGEM = 'SC') then
  begin
    dao.Geral1('SELECT a.ICMS, A.ICMS_CONSUMIDOR_FINAL FROM ICMS a where  A.UF = ''' + uf_destino + ''' and  A.UF_ORIGEM = ''' + uf_origem + ''' ');
    Result := dao.q1.fieldbyname('ICMS_CONSUMIDOR_FINAL').AsFloat;
  end;
end;

procedure TFr_vendas_industria2.dados_produto(cod_produto: string);
var
  status, cod_fiscal: string;
begin
  formatsettings.DecimalSeparator := ',';

  if Prcod_representante.Text = '' then
    Prcod_representante.Text := '0';

  if (mform <> 'vendas_devolucoes') and (not carregando_item) then
    status := ' AND P.STATUS = ' + QuotedStr('N')
  else
    status := '';

  if (mform = 'vendas_devolucoes') then
  begin
    dao.Geral3('SELECT ' + #13 + '  P.NOM_PRODUTO,' + #13 + '  P.PRECO_VENDA,' + #13 + '  P.PRECO_PROMOCAO,' + #13 + '  P.UNIDADE,' + #13 + '  P.QTD_EMBALAGEM,' + #13 + '  P.GRADE,' + #13 + '  P.GRADE_COMISSAO,' + #13 + '  P.QTD_ESTOQUE,' + #13 + '  P.TINTA_BASE,' + #13 + '  P.QTD_RESERVADO,' + #13 + '  P.CUSTO,' + #13 + '  P.CUSTO_TOTAL,' + #13 + '  P.LUCRO,' + #13 + '  100 AS DESCONTO_MAXIMO,' + #13 + '  N.CODIGO AS NCM,' + #13 + '  COALESCE(M.MVA, 0) AS MVA,' + #13 +
      '  COALESCE(M.ALIQ_ICMS_INTERNA, 0) AS ALIQ_ICMS_INTERNA,' + #13 + '  N.IPI_ALIQUOTA,' + #13 + '  case when p.COD_FISCAL_PRODUTO is not null then COALESCE(P.TRIB_ICMS, N.TRIB_ICMS) else N.TRIB_ICMS END AS TRIB_ICMS,' + #13 + '  P.PROMOCAO,' + #13 + '  N.CESTA_BASICA,' + #13 + '  N.CEST,' + #13 + '  P.PESO,' + #13 + '  P.CODIGO_BARRA,' + #13 + '  P.NAO_VALIDAR_MARGEM,' + #13 + '  P.BONIFICACAO_APENAS' + #13 + 'FROM' + #13 + '  PRODUTO P' + #13 + 'LEFT OUTER JOIN GRUPO G ON (G.COD_GRUPO = P.COD_GRUPO)'
      + #13 + 'LEFT OUTER JOIN NCM N ON (N.CODIGO = coalesce(P.NCM, G.NCM) AND N.CEST = coalesce(p.cest, g.cest))' + #13 + 'LEFT OUTER JOIN MVA M ON  (' + #13 + ' ( M.NCM = N.CODIGO' + #13 + '   OR M.NCM = substring(n.CODIGO from 1 for 9)' + #13 + '   OR M.NCM = substring(n.CODIGO from 1 for 8)' + #13 + '   OR M.NCM = substring(n.CODIGO from 1 for 7)' + #13 + '   OR M.NCM = substring(n.CODIGO from 1 for 6)' + #13 + '   OR M.NCM = substring(n.CODIGO from 1 for 5)' + #13 +
      '   OR M.NCM = substring(n.CODIGO from 1 for 4)' + #13 + '   OR M.NCM = substring(n.CODIGO from 1 for 3)' + #13 + '   OR M.NCM = substring(n.CODIGO from 1 for 2) )' + #13 + '  AND M.CEST = N.CEST ' + #13 + '  AND M.UF_ORIGEM = ''' + UF_Emissor + '''' + #13 + '  AND M.UF = ''' + UF_Cliente + ''') ' + #13 + ' WHERE P.COD_PRODUTO = ' + QuotedStr(cod_produto) + status);
    desconto_maximo := '100';
  end
  else
  begin
    dao.Geral3('SELECT ' + #13 + 
	           '   P.NOM_PRODUTO, ' + #13 + 
			   '   P.PRECO_VENDA, ' + #13 + 
			   '   P.PRECO_PROMOCAO, ' + #13 + 
			   '   P.UNIDADE, ' + #13 + 
			   '   P.QTD_EMBALAGEM, ' + #13 + 
			   '   P.GRADE, ' + #13 + 
			   '   P.GRADE_COMISSAO, ' + #13 +
			   '   P.QTD_ESTOQUE, ' + #13 + 
			   '   P.TINTA_BASE, ' + #13 + 
			   '   P.QTD_RESERVADO, ' + #13 + 
			   '   P.CUSTO, ' + #13 + 
			   '   P.CUSTO_TOTAL, ' + #13 + 
			   '   P.LUCRO, ' + #13 + 
			   '   coalesce( ' + #13 + 
			   '     (SELECT PR.DESCONTO_MAXIMO ' + #13 + 
			   '      FROM ' + #13 +
               '        PRODUTO_REPRESENTANTE PR ' + #13 + 
			   '      WHERE PR.COD_PRODUTO = P.COD_PRODUTO ' + #13 + 
			   '        AND PR.ID_REPRESENTANTE =  ' + Prcod_representante.Text + #13 + 
			   '     limit 1), ' + #13 + 
			   '     coalesce( ' + #13 +
			   '     (SELECT' + #13 + 
			   '        PR.DESCONTO_MAXIMO ' + #13 + 
			   '      FROM ' + #13 + 
			   '        GRUPO_REPRESENTANTE PR ' + #13 + 
			   '      WHERE PR.COD_GRUPO = P.COD_GRUPO ' + #13 + 
			   '        AND PR.ID_REPRESENTANTE = ' + Prcod_representante.Text + #13 + 
			   '     ), P.DESCONTO_MAXIMO)' + #13 +
               '   ) AS DESCONTO_MAXIMO, ' + #13 + 
			   '   COALESCE(COALESCE(N.CODIGO, P.NCM), G.NCM) AS NCM, ' + #13 +
			   '   COALESCE(M.MVA, 0) AS MVA, ' + #13 + 
			   '   COALESCE(M.ALIQ_ICMS_INTERNA, 0) AS ALIQ_ICMS_INTERNA, ' + #13 + 
			   '   N.IPI_ALIQUOTA, ' + #13 + 
			   '   case when COALESCE(NC.COD_FISCAL_PRODUTO, p.COD_FISCAL_PRODUTO) is not null then COALESCE(NC.TRIB_ICMS, COALESCE(P.TRIB_ICMS, N.TRIB_ICMS)) else N.TRIB_ICMS END AS TRIB_ICMS, ' + #13 + 
			   '   P.PROMOCAO, ' + #13 +
               '   N.CESTA_BASICA, ' + #13 + 
			   '   N.CEST, ' + #13 + 
			   '   P.PESO, ' + #13 +
			   '   P.CODIGO_BARRA, ' + #13 + 
			   '   P.NAO_VALIDAR_MARGEM, ' + #13 + 
			   '   P.BONIFICACAO_APENAS ' + #13 + 
			   ' FROM ' + #13 +
               '   PRODUTO P  ' + #13 + 
			   ' LEFT OUTER JOIN GRUPO G ON (G.COD_GRUPO = P.COD_GRUPO) ' + #13 + 
			   ' LEFT OUTER JOIN NCM N ON (N.CODIGO = coalesce(P.NCM, G.NCM) AND N.CEST = coalesce(p.cest, g.cest)) ' + #13 + 
			   ' LEFT OUTER JOIN CLIENTE_NCM NC ON (N.CODIGO = NC.NCM AND N.CEST = NC.CEST AND NC.COD_CLIENTE = ' + Prcod_cliente.Text + ' ) ' + #13 + 
			   ' LEFT OUTER JOIN MVA M ON  ( ' + #13 + 
			   '  ( M.NCM = N.CODIGO ' + #13 + 
			   '    OR M.NCM = substring(n.CODIGO from 1 for 9) ' + #13 + 
			   '    OR M.NCM = substring(n.CODIGO from 1 for 8) ' + #13 + 
			   '    OR M.NCM = substring(n.CODIGO from 1 for 7) ' + #13 + 
			   '    OR M.NCM = substring(n.CODIGO from 1 for 6) ' + #13 + 
			   '    OR M.NCM = substring(n.CODIGO from 1 for 5) ' + #13 + 
			   '    OR M.NCM = substring(n.CODIGO from 1 for 4) ' + #13 + 
			   '    OR M.NCM = substring(n.CODIGO from 1 for 3) ' + #13 + 
			   '    OR M.NCM = substring(n.CODIGO from 1 for 2) ) ' + #13 + 
			   '  AND M.CEST = N.CEST ' + #13 + 
			   '  AND M.UF_ORIGEM = ''' + UF_Emissor + '''' + #13 + 
			   '  AND M.UF = ''' + UF_Cliente + ''') ' + #13 + 
               ' WHERE P.COD_PRODUTO = ' + QuotedStr(cod_produto) + status);
  end;
  if Prcod_representante.Text = '0' then
    Prcod_representante.Text := '';
  if not dao.q3.IsEmpty then
  begin
    // Definir a Margem de Valor Agregado.
    MVA := dao.q3.fieldbyname('MVA').AsFloat;

    mmVendas2ICMS_ITEM.Value := BuscaAliquota(UF_Emissor, UF_Cliente, dao.q3.fieldbyname('ncm').AsString, dao.q3.fieldbyname('CEST').AsString);
    dao.q3.Open;

    if MePrecoBase.Visible then
    begin
      if dao.q3.fieldbyname('TINTA_BASE').AsString <> 'S' then
        MePrecoBase.Enabled := false
      else
        MePrecoBase.Enabled := true;
    end;

    if not GravarPedido then
    begin

      zzunidade.Text := dao.q3.fieldbyname('unidade').AsString;
      zzqtd_embalagem.Text := dao.q3.fieldbyname('qtd_embalagem').AsString;

      mmVendas2PROMOCAO.AsString := dao.q3.fieldbyname('PROMOCAO').AsString;

      if dao.q3.fieldbyname('PROMOCAO').AsString = 'S' then
        mmVendas2NOM_PRODUTO.Value := dao.q3.fieldbyname('NOM_PRODUTO').AsString + ' (PROMOÇÃO)'
      else
        mmVendas2NOM_PRODUTO.Value := dao.q3.fieldbyname('NOM_PRODUTO').AsString;

      if mmVendas2PRECO_VENDA.IsNull or produto_alterado then
        mmVendas2PRECO_VENDA.Value := dao.q3.fieldbyname('preco_venda').AsFloat;

      if mmVendas2PRECO_LIQUIDO.IsNull or produto_alterado then
        mmVendas2PRECO_LIQUIDO.Value := dao.q3.fieldbyname('preco_venda').AsFloat - (dao.q3.fieldbyname('preco_venda').AsFloat * mmVendas2DESCONTO.Value / 100);

      mmVendas2SUB_TOTAL.Value := mmVendas2PRECO_LIQUIDO.Value * mmVendas2QTD.Value;

      mmVendas2CEST.AsString := dao.q3.fieldbyname('CEST').AsString;

      mmVendas2GRADE_COMISSAO.AsString := dao.q3.fieldbyname('GRADE_COMISSAO').AsString;

      mmVendas2CODIGO_BARRAS.AsString := dao.q3.fieldbyname('CODIGO_BARRA').AsString;

      zz_lucro_produto.Value := dao.q3.fieldbyname('lucro').AsFloat;

      if mmVendas2PRECO_CUSTO.IsNull or produto_alterado then
        mmVendas2PRECO_CUSTO.Value := dao.q3.fieldbyname('CUSTO_TOTAL').AsFloat;

      mmVendas2PESO.Value := dao.q3.fieldbyname('PESO').AsFloat;

      if desconto_forma = 0 then
        mmVendas2DESCONTO_MAXIMO.Value := dao.q3.fieldbyname('DESCONTO_MAXIMO').AsFloat + (100 - dao.q3.fieldbyname('DESCONTO_MAXIMO').AsFloat)
      else
        mmVendas2DESCONTO_MAXIMO.Value := desconto_forma;

      if mmVendas2PROMOCAO.AsString = 'S' then
        mmVendas2DESCONTO_MAXIMO.Value := 0;

      { if mmVendas2PROMOCAO.AsString = 'S' then
        begin
        mmVendas2PRECO_VENDA.Value :=
        dao.q3.fieldbyname('PRECO_PROMOCAO').AsFloat;
        mmVendas2PRECO_CUSTO.Value := mmVendas2PRECO_VENDA.Value /
        (1 + (margem_lucro_minima / 100));
        SetRoundMode(rmDown);
        mmVendas2PRECO_CUSTO.Value := roundto(mmVendas2PRECO_CUSTO.Value,
        (CasasDecimais * (-1)));
        SetRoundMode(rmNearest);
        end;
      }
      Zzcusto.Value := mmVendas2PRECO_CUSTO.Value;
    end;

    if dao.q3.fieldbyname('cesta_basica').AsString = 'S' then
      mmVendas2CESTA_BASICA.Value := true
    else
      mmVendas2CESTA_BASICA.Value := false;

    zzreal.Value := dao.q3.fieldbyname('qtd_estoque').AsFloat;
    zzreservado.Value := dao.q3.fieldbyname('qtd_reservado').AsFloat;
    // mmVendas2NOM_PRODUTO.AsString := dao.Q3.fieldbyname('nom_produto').AsString;

    cod_fiscal := '';
    if mform = 'vendas_industria' then
    begin
      if dao.q3.fieldbyname('trib_icms').AsString = '0' then
      begin
        mmVendas2IPI_ITEM.Value := dao.q3.fieldbyname('IPI_ALIQUOTA').AsFloat;
        mmVendas2VLR_IPI_ITEM.Value := mmVendas2SUB_TOTAL.Value * (mmVendas2IPI_ITEM.Value / 100);

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

      if dao.q3.fieldbyname('trib_icms').AsString = '1' then
        cst := '10';
      if dao.q3.fieldbyname('trib_icms').AsString = '2' then
        cst := '20';
      if dao.q3.fieldbyname('trib_icms').AsString = '3' then
        cst := '30';
      if dao.q3.fieldbyname('trib_icms').AsString = '4' then
        cst := '40';
      if dao.q3.fieldbyname('trib_icms').AsString = '5' then
        cst := '41';
      if dao.q3.fieldbyname('trib_icms').AsString = '6' then
        cst := '50';
      if dao.q3.fieldbyname('trib_icms').AsString = '7' then
        cst := '51';
      if dao.q3.fieldbyname('trib_icms').AsString = '8' then
      begin
        cst := '60';
        if UF_Cliente = UF_Emissor then
          cod_fiscal := '5405'
        else
          cod_fiscal := '6403';

        mmVendas2IPI_ITEM.Value := 0;
        mmVendas2VLR_IPI_ITEM.Value := 0;
        if (MVA = 0) then
        begin
          { showmessage('Margem de Valor Agregado (MVA) não pode ser igual a zero.'
            + #13 + 'Verifique no cadastro de ncm no código :' +
            dao.Q3.fieldbyname('ncm').AsString + '.' + #13 +
            'Ou se o código CST 60 do produto ' + mecod_produto.text + '-' +
            Lbnom_produto_DB.Caption + ' está informado corretamente.'); }
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
      end
      else begin
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
      if dao.q3.fieldbyname('trib_icms').AsString = '9' then
        cst := '70';
      if dao.q3.fieldbyname('trib_icms').AsString = '10' then
        cst := '90';
      if mmVendas2CESTA_BASICA.Value then
        cst := '90';

      { if UF_Cliente = 'PR' then
        begin
        cst := '00';
        cod_fiscal := '6102';
        end; }

      if ((UF_Cliente <> UF_Emissor) and (cst = '60')) then
      begin
        cst := '10';
        cod_fiscal := '6403';
      end;

      if (UF_Emissor = 'SC') and (UF_Cliente = 'SC') then
      begin
        cst := '00';
        if UF_Cliente = UF_Emissor then
          cod_fiscal := '5102'
        else
          cod_fiscal := '6102';
      end;

      mmVendas2TRIB_ICMS.Text := cst;

    end
    else
    begin
      { mmVendas2ipi_item.Value := 0;
        mmVendas2vlr_ipi_item.Value := 0; }
      cod_fiscal := Prcod_fiscal.Text;
    end;

    if (Lbnom_fop.Caption = 'TROCA') or (Lbnom_fop.Caption = 'PERMUTA') then
    begin
      cst := '00';
      if UF_Cliente = UF_Emissor then
        cod_fiscal := '5949'
      else
        cod_fiscal := '6949';
    end;

    if (Lbnom_fop.Caption = 'TRANSFERENCIA') then
    begin
      if UF_Cliente = UF_Emissor then
        cod_fiscal := '5152'
      else
        cod_fiscal := '6152';
    end;

    if (Lbnom_fop.Caption = 'CONSIGNAÇÃO') then
    begin
      if UF_Cliente = UF_Emissor then
        cod_fiscal := '5917'
      else
        cod_fiscal := '6917';
    end;

    if (Lbnom_fop.Caption = 'BONIFICAÇÃO') then
    begin
      if UF_Cliente = UF_Emissor then
        cod_fiscal := '5910'
      else
        cod_fiscal := '6910';
    end;

    if (Lbnom_fop.Caption = 'ATIVO IMOBILIZA') then
    begin
      if UF_Cliente = UF_Emissor then
        cod_fiscal := '5551'
      else
        cod_fiscal := '6551';
    end;


    mmVendas2TRIB_ICMS.Text := cst;
    mmVendas2COD_FISCAL_ITEM.Text := cod_fiscal;
    mmVendas2NCM.Text := dao.q3.fieldbyname('ncm').AsString;
    { if mmVendas2Cesta_Basica.Value then
      Aliquota_ICMS_Interno := 12
      else
      Aliquota_ICMS_Interno := 17; }

    mmVendas2NAO_VALIDAR_MARGEM.AsString := dao.q3.fieldbyname('NAO_VALIDAR_MARGEM').AsString;

    mmVendas2DESCONTO_MAXIMO.Value := dao.q3.fieldbyname('DESCONTO_MAXIMO').AsFloat;

    if mmVendas2DESCONTO_MAXIMO.AsFloat > strtofloat(desconto_maximo) then
      mmVendas2DESCONTO_MAXIMO.AsFloat := strtofloat(desconto_maximo);

    CarregaFoto(Mecod_produto.Text);

    if MeTrib_ICMS.Visible and MeTrib_ICMS.Enabled then
      MeTrib_ICMS.SetFocus;

    if (dao.q3.fieldbyname('BONIFICACAO_APENAS').AsString = 'S') and (mform = 'vendas_industria') then
    begin
      if Mecod_produto.Enabled then
      begin
        showmessage('Produto apenas para Bonificação!');
        mmVendas2COD_PRODUTO.Clear;
        Mecod_produto.SetFocus;
        Exit;
      end;
    end;

    dao.Geral4('SELECT ALIQUOTA_INTERNA FROM UF WHERE UF = ' + QuotedStr(UF_Cliente));
    Aliquota_ICMS_Interno := dao.q4.fieldbyname('ALIQUOTA_INTERNA').AsFloat;
  end
  else
  begin
    if Mecod_produto.Enabled then
    begin
      showmessage('Produto Inexistente ou Inativo!');
      mmVendas2COD_PRODUTO.Clear;
      Mecod_produto.SetFocus;
    end;
  end;

end;

procedure TFr_vendas_industria2.ListarItensPedidos;
var
  x: integer;
begin
  if mmVendas2.RecordCount = 0 then
    Exit;

  itens_repetidos := false;
  mmVendas2.DisableControls;
  mmVendas2.First;

  SetLength(ListaItens, 0);

  SetLength(ListaItens, mmVendas2.RecordCount);

  for x := 0 to mmVendas2.RecordCount - 1 do
  begin
    if not itens_repetidos then
      itens_repetidos := ChecarProdutoNoPedido(mmVendas2COD_PRODUTO.AsInteger);
    ListaItens[x] := mmVendas2COD_PRODUTO.AsInteger;
    mmVendas2.next;
  end;
  mmVendas2.First;
  mmVendas2.EnableControls;
end;

procedure TFr_vendas_industria2.ChecarItensPedidos;
var
  x: integer;
begin
  itens_repetidos := false;
  mmVendas2.DisableControls;
  mmVendas2.First;
  for x := 0 to mmVendas2.RecordCount - 1 do
  begin
    itens_repetidos := ChecarProdutoNoPedido(mmVendas2COD_PRODUTO.AsInteger);
    mmVendas2.next;
  end;
  mmVendas2.First;
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

function TFr_vendas_industria2.CalculoComissaoDesconto: real;
var
  desconto: real;
begin
  desconto := strtofloat(Prdesconto.Text);
  if not representante_funcionario then
  begin
    if desconto < 35 then
      Result := 1
    else
      Result := 0.5;
  end
  else
  begin
    if desconto < 27 then
      Result := 2
    else if desconto < 35 then
      Result := 1
    else
      Result := 0.5;
  end;
end;

function TFr_vendas_industria2.CalculoComissao: real;
var
  comissao: double;
  com_comissao_fixa: boolean;
begin
  if Prcod_representante.Text = '' then
  begin
    Result := 0;
    Exit;
  end;

  dao.Geral5('SELECT a.PERC_COMISSAO_FIXA, a.COMISSAO_FIXA, a.MARGEM_IDEAL, a.MARGEM_MINIMA, a.INDICE_ABAIXO, a.INDICE_ACIMA FROM REPRESENTANTE a where a.ID = ' + Prcod_representante.Text);

  margem_lucro_ideal := dao.q5.fieldbyname('MARGEM_IDEAL').AsCurrency;
  margem_lucro_minima := dao.q5.fieldbyname('MARGEM_MINIMA').AsCurrency;
  indice_abaixo := dao.q5.fieldbyname('INDICE_ABAIXO').AsCurrency;
  indice_acima := dao.q5.fieldbyname('INDICE_ACIMA').AsCurrency;

  comissao_fixa := dao.q5.fieldbyname('PERC_COMISSAO_FIXA').AsCurrency;
  com_comissao_fixa := dao.q5.fieldbyname('COMISSAO_FIXA').AsString = 'S';

  if margem_lucro < margem_lucro_minima then
    comissao := 0
  else if margem_lucro < margem_lucro_ideal then
    comissao := comissao_fixa * (1 + ((margem_lucro - margem_lucro_ideal) / 100) * indice_abaixo)
  else
    comissao := comissao_fixa * (1 + ((margem_lucro - margem_lucro_ideal) / 100) * indice_acima);

  if com_comissao_fixa then
    comissao := comissao_fixa;

  Result := comissao;

end;

procedure TFr_vendas_industria2.PromocaoPorQuantidade(quantidade: string);
var
  custo, preco: real;
begin
  if (trim(Prcod_representante.Text) = '') then
    Exit;

  quantidade := FMFUN.BuscaTroca(quantidade, ',', '.');
  dao.Geral5(' SELECT a.COD_PRODUTO, a.ID_REPRESENTANTE, a.QTD_PROMOCAO, a.PRECO_PROMOCAO ' +
             ' FROM PRODUTO_REPRESENTANTE a where a.COD_PRODUTO = ' + Mecod_produto.Text +
			 ' and a.qtd_promocao >= ' + quantidade + 
			 ' and a.ID_REPRESENTANTE =' + Prcod_representante.Text + ' limit 1 ');

  preco := dao.q5.fieldbyname('preco_promocao').AsCurrency;

  if (preco > 0) then
  begin
    // custo := preco / (1 + (margem_lucro_ideal / 100));
    SetRoundMode(rmDown);
    // mmVendas2PRECO_CUSTO.Value := custo;
    mmVendas2PRECO_VENDA.Value := preco;
    if (mmVendas2PRECO_VENDA.Value <> preco) then
    begin
      mmVendas2PRECO_LIQUIDO.Value := preco;
      mmVendas2DESCONTO.Value := 0;
    end;
    mmVendas2PROMOCAO.AsString := 'S';
  end
  else
  begin
    produto_alterado := true;
    dados_produto(Mecod_produto.Text);
  end;

end;

procedure TFr_vendas_industria2.ProrcamentoChange(Sender: TObject);
begin
  if Prorcamento.ItemIndex = 0 then
    Prdtadoc.Date := now;
end;

procedure TFr_vendas_industria2.Prpeso_notaExit(Sender: TObject);
begin
  CalcularPesoPerc;
end;



procedure SetGroupBoxReadOnly(AGB: TWinControl; AReadOnly: Boolean);
var
  i: Integer;
  C: TControl;
  Ctx: TRttiContext;
  Typ: TRttiType;
  Prop: TRttiProperty;
begin
  if AGB = nil then
    Exit;
  for i := 0 to AGB.ControlCount - 1 do
  begin
    C := AGB.Controls[i];
    Typ := Ctx.GetType(C.ClassType);
    Prop := Typ.GetProperty('ReadOnly');
    if (Prop <> nil) and (Prop.PropertyType.TypeKind = tkEnumeration) then
      Prop.SetValue(C, AReadOnly)
    else
    begin
      Prop := Typ.GetProperty('Enabled');
      if (Prop <> nil) and (Prop.PropertyType.TypeKind = tkEnumeration) then
        Prop.SetValue(C, not AReadOnly);
    end;
  end;
end;

procedure TFr_vendas_industria2.PrTipoNFeChange(Sender: TObject);
begin
  case prTipoNFe.ItemIndex of
    0 :
      begin
        tbRefComplementar.TabVisible := False;
        SetGroupBoxReadOnly(gbImpostos, True);
        SetGroupBoxReadOnly(gbtotal, True);
      end;
    1 :
      begin
        tbRefComplementar.TabVisible := True;
        SetGroupBoxReadOnly(gbImpostos, False);
        SetGroupBoxReadOnly(gbtotal, False);
        pgNFE.ActivePage := tbRefComplementar;
      end;
  end;
end;


function TFr_vendas_industria2.TodosPromocao: boolean;
begin
  Result := true;
  { mmVendas2.DisableControls;
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
  if mmVendas2.State in [dsBrowse] then
    Exit;

  if cliente_alterado then
  begin
    liberado := true;
    Result := liberado;
    Exit;
  end;

  // if (mform = 'vendas_devolucoes') or (FRPRI.TipUsu = '0') or (FRPRI.TipUsu = '1') or representacao then
  if (mform = 'vendas_devolucoes') then
  begin
    liberado := true;
    Result := liberado;
    Exit;
  end;

  if desconto_maximo = '' then
    desconto_maximo := '0';

  if Btaltped.Enabled = false then
  begin

    liberado := true;

    { if (mmVendas2desconto.Value > mmVendas2DESCONTO_MAXIMO.Value) and
      (mmVendas2PROMOCAO.AsString = 'S')  then
      begin
      dao.msg('Não é possível dar desconto para produtos em promoção!');
      mmVendas2desconto.Value := mmVendas2DESCONTO_MAXIMO.Value;
      MedescontoExit(self);
      Medesconto.SetFocus;
      liberado := false;
      end;
    }

    if (roundto(mmVendas2DESCONTO.Value, -2) > roundto(mmVendas2DESCONTO_MAXIMO.AsFloat, -2)) and (Prcod_fop.Text <> '7') then
    begin

      FMFUN.Dc_MessageDlg('Desconto Superior ao Permitido para este Produto!', mtwarning, [mbok], 0, mrOk, true);
      liberado := FMFUN.LiberarProcesso;

      { if
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
      }
    end;
  end;
  CalculaSubTotais;
  Result := liberado;
end;



procedure TFr_vendas_industria2.CalculaSubTotais;
begin
  if mmVendas2.State in [dsBrowse] then
    Exit;

  mmVendas2SUB_TOTAL.Value := mmVendas2PRECO_LIQUIDO.Value * mmVendas2QTD.Value;
  {
    mmVendas2PRECO_LIQUIDO.Value := roundto(mmVendas2PRECO_VENDA.value -
    (mmVendas2PRECO_VENDA.value * mmVendas2desconto.Value / 100), (CasasDecimais * (-1)));
    mmVendas2sub_total.Value := mmVendas2PRECO_LIQUIDO.Value * mmVendas2qtd.Value; }

end;

procedure TFr_vendas_industria2.LimpaDescLucro;
begin
  habilita_faturamento := false;
end;


procedure TFr_vendas_industria2.CarregaTotaisEmpresa;
var
  sql_nfe_dev: string;
  total: currency;
begin
  if ckSemDev.Checked then
    sql_nfe_dev := ' A.NFEENTRADASAIDA = ''0'' AND A.PROCESSO_ID NOT IN (SELECT PROCESSO_ID FROM VENDAS1 WHERE FATURADO <> 2 AND NFEENTRADASAIDA = ''1'') AND A.NFE_DEV IS NULL AND '
  else
    sql_nfe_dev := '';

  dao.Geral1('SELECT SUM(A.TOT_LIQUIDO) AS TOTAL  ' +
             'FROM VENDAS1 a WHERE  A.FATURADO in (1,3) and ' + sql_nfe_dev +
             'A.EMPRESA_FATURAR = ' + copy(cbEmpresa.Text, 1, pos('-',cbempresa.text)-1) +
             ' and ' +
             ' case when extract(MONTH FROM a.DTA_EMISSAO) < 10 then cast(''0''||date_part(''month'', a.DTA_EMISSAO) as varchar(2)) else cast(extract(MONTH FROM a.DTA_EMISSAO) as varchar(2)) end||''/''||EXTRACT(YEAR FROM A.DTA_EMISSAO)  = ''' + cbMes.Text + '''');

  if dao.q1.fieldbyname('TOTAL').IsNull then
    total := 0
  else
    total := dao.q1.fieldbyname('TOTAL').Value;

  lbTotalFaturado.Caption := formatfloat('R$ #,###,##0.00', total);
end;

procedure TFr_vendas_industria2.SgProSelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
begin
  lin := ARow;
  scroll_sgpro;
end;

procedure TFr_vendas_industria2.scroll_sgpro;
begin

end;

procedure TFr_vendas_industria2.SgProCellsChanged(Sender: TObject; R: TRect);
begin
  // scroll_sgpro;

end;

procedure TFr_vendas_industria2.SgProClickCell(Sender: TObject; ARow, ACol: integer);
begin
  // scroll_sgpro;
  lin := ARow;
end;

procedure TFr_vendas_industria2.Meid_corButtonClick(Sender: TObject);
var
  q_campos_proponente: TFDQuery;
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

  Fr_localizar.Caption := 'Localizar Cor';

  chamou_pesquisa := 'fr_cor';
  chamou_form := 'fr_entrada_cor';
  chamou_cadastro := 'fr_cor';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cores';
  Fr_localizar.BT_cadastro.Visible := true;
  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Cor';

  for i := 0 to 1 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_vendas_industria2.Meid_corKeyPress(Sender: TObject; var Key: Char);
var
  q_campos_proponente: TFDQuery;
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;

  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin

  if not (Key in ['0'..'9', #8]) and (Key <> #13) then
  begin
    beep; { somente delphi 2.0 ou > }
    Key := #0;
  end;

end;

procedure TFr_vendas_industria2.Meid_TamanhoButtonClick(Sender: TObject);
var
  q_campos_proponente: TFDQuery;
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

  Fr_localizar.Caption := 'Localizar Tamanho';

  chamou_pesquisa := 'fr_tamanho';
  chamou_form := 'fr_entrada_tamanho';
  chamou_cadastro := 'fr_tamanho';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + ' Tamanhos';
  Fr_localizar.BT_cadastro.Visible := true;
  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Tamanho';

  for i := 0 to 1 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_vendas_industria2.ativa_vendas1(id: string);
begin
  with q_vendas1 do
  begin
    close;
    sql.Clear;
    sql.Add('select a.NUMDOC, a.NUMDOC_GRUPO, a.HORA, a.DTADOC, a.MOTIVO_NFE_CANCEL_INTERNO, a.COD_CLIENTE, a.COD_USUARIO, a.COD_EMPRESA, ' +
            'a.FATURADO, a.CONSIGNACAO, a.ORCAMENTO, a.ENTREGUE, a.TOT_BRUTO, a.DESCONTO, a.TOT_LIQUIDO, ' +
            'a.PRAZO_PGTO, a.COD_FOP, a.NUM_CUPOM, a.TIPO_VENDA, a.QTD_PARCELAS, a.PONTO_USADO, a.PROCESSO_ID, ' +
            'c.pronautica, c.proemprego, a.USUARIO_DESFATUROU, a.COD_REPRESENTANTE, a.COD_PRAZO_PGTO, a.CUSTO_TOTAL, a.LUCRO_MEDIO, ' +
            'coalesce((select pr.VALOR_MINIMO from PRAZO_REPRESENTANTE pr where pr.ID_PRAZO = p.id and pr.ID_REPRESENTANTE = a.cod_representante), p.VALOR_MINIMO_PEDIDO) as valor_minimo_pedido, ' + 'a.DTA_EMISSAO, a.DTA_SAIDA, a.EMPRESA_FATURAR, a.NF, a.OBSERVACOES_PEDIDO, a.OBSERVACOES_NOTA, ' + 'a.COD_TRANSPORTADORA, a.TIPO_FRETE, a.VOLUME_NOTA, a.PESO_NOTA, a.COD_CARGA, a.VL_FRETE, ' + 'a.CONTATO_FRETE, a.PED_IMPRESSO, a.DTA_VENCIMENTO_CONSIG, a.CANCELADO, a.CONTEM_AVARIA, ' +
            'a.CONTEM_ETIQUETA, a.MOTIVO_TROCA, a.NR_VENDA_ORIGINAL, a.PEDIDO, a.VENDA_ENVIADA, A.DESCONTO_GERAL, A.VLR_DESCONTO_GERAL, ' + 'a.CREDITO_USADO, a.NR_PEDIDO_PALM, o.numdoc as pedido_origem, a.BOLETO_ANEXO, a.COD_FISCAL, a.VLR_COMISSAO, a.ValorDescontoAdic, ' + 'a.VLR_BC_ICMS, a.VLR_ICMS, a.VLR_ST, a.VLR_TOT_NF, a.VLR_BC_ICMS_ST, a.CHAVE_NFE, a.desconto_valor, ' + 'a.RECIBO_NFE, a.STATUS_NFE, a.MOTIVO_NFE, a.DIGEST_NFE, a.PROTOCOLO_NFE, a.DATA_REC_NFE, ' +
            'a.JUSTIF_CANC_NFE, a.COD_SUPERVISOR, a.COD_FORNECEDOR, a.NFE, a.VLR_IPI, a.PALM_NR_CONEXAO, pp.STATUS, ' + 'a.SINCRONIZAR_PALM, a.NUMDOC_REF, a.FRETE_COMBINADO, a.DT_FRETE_COMBINADO, a.EMAIL_NFE, coalesce(ce.uf, ''SC'') as uf_emissor, e.ENQUADRADA_SIMPLES, ' + 'a.EMAIL_PEDIDO, a.PEDIDO_VENDEDOR, a.USUARIO_CHECOU_PEDIDO_VENDEDOR, a.CONTA_BOLETO, a.AVISOGNRE, ' + 'a.USUARIO_CHECOU_FRETE_COMBINADO, a.ABERTO_USUARIO, a.MAQUINA_USUARIO_ABERTO, A.CARTACORRECAO, a.NR_PEDIDO_PALM, e.logo, ' +
            'case when a.DATA_REC_NFE + INTERVAL ''1 day'' < current_timestamp THEN 1 ELSE 0 END AS PRAZO_CANCEL, a.USUARIO_LIBEROU_DESCONTO, a.MOTIVO_LIBERACAO_DESCONTO, ' + 'c.nom_cliente, c.SUSPENSAO_PIS_CONFINS, c.cnpj, c.pre_cadastro, c.desconto_maximo, CASE WHEN a.cod_cliente is not null then CASE WHEN c.IE = ''ISENTO'' THEN ''1'' ELSE CASE WHEN c.ie is null  and c.TIP_PESSOA = ''J'' THEN ''2'' ELSE ''0'' END END END AS ISENTO, ' +
            'r.nom_representante, s.nom_representante as supervisor, r.funcionario, f.nom_fop, f.desconto as desconto_forma, p.desconto as desconto_prazo, p.prazo, e.nom_empresa, t.nome, cd.nom_cidade, cd.uf, cf.nome as nom_cod_fiscal, ' + 'a.CHAVE_NFE_DEV, a.RECIBO_NFE_DEV, a.STATUS_NFE_DEV, a.MOTIVO_NFE_DEV, a.DIGEST_NFE_DEV, a.PROTOCOLO_NFE_DEV, a.DATA_REC_NFE_DEV, ' + 'case when a.DATA_REC_NFE_DEV + INTERVAL ''1 day'' < current_timestamp THEN 1 ELSE 0 END AS PRAZO_CANCEL_DEV,  a.JUSTIF_CANC_NFE_DEV, a.NFE_DEV, ' +
            '(select max(v3.nfe) from vendas1 v3 where v3.cod_cliente = c.COD_CLIENTE and v3.nfe <> a.nfe) as ultima_nf, c.consumidor_final, a.numdoc_destino, f.avista, f.NAO_GERAR_CR, a.tiponfe, a.nfeentradasaida, a.num_oc, ' +
            'a.consumidor_final, a.obs_adicional ' +
            'from vendas1 a ' +
            'left join vendas1_orig o on o.numdoc = a.numdoc ' +
            'left join cliente c on c.cod_cliente = a.cod_cliente ' +
            'left outer join PROCESSO_PEDIDO pp on pp.ID = a.PROCESSO_ID ' +
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
    Open;
    edUltimaNf.Text := fieldbyname('ultima_nf').AsString;
    cliente_pronautica := fieldbyname('pronautica').AsString = 'S';
    cliente_proemprego := fieldbyname('proemprego').AsString = 'S';
  end;

end;

procedure TFr_vendas_industria2.ativa_vendas2(nr_documento: string);
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
    Open;
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
        campo1 := copy(Components[i].Name, 3, length(Components[i].Name) - 1);
        TsEdit(FindComponent(campo)).Text := q_vendas1.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TEdit then
      begin
        campo := TsEdit(Components[i]).Name;
        campo1 := copy(Components[i].Name, 3, length(Components[i].Name) - 1);
        TsEdit(FindComponent(campo)).Text := q_vendas1.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TsRichEdit then
      begin
        campo := TsRichEdit(Components[i]).Name;
        campo1 := copy(Components[i].Name, 3, length(Components[i].Name) - 1);
        TsRichEdit(FindComponent(campo)).Text := q_vendas1.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TsComboEdit then
      begin
        campo := TsComboEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        TsComboEdit(FindComponent(campo)).Text := q_vendas1.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TsCurrencyEdit then
      begin
        campo := TsCurrencyEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        TsCurrencyEdit(FindComponent(campo)).Value := q_vendas1.fieldbyname(campo1).AsFloat;
      end
      else if Components[i] is TComboBox then
      begin
        campo := TComboBox(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        if not q_vendas1.fieldbyname(campo1).isnull then
          TComboBox(FindComponent(campo)).ItemIndex := q_vendas1.fieldbyname(campo1).AsInteger;
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

        TsDateEdit(FindComponent(campo)).Date := q_vendas1.fieldbyname(campo1).AsDateTime;
      end
      else if Components[i] is TMaskEdit then
      begin
        campo := TMaskEdit(Components[i]).Name;
        campo1 := copy(Components[i].Name, 3, length(Components[i].Name) - 1);
        TMaskEdit(FindComponent(campo)).Text := q_vendas1.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TDateTimePicker then
      begin
        campo := TDateTimePicker(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);

        TDateTimePicker(FindComponent(campo)).DateTime := q_vendas1.fieldbyname(campo1).AsDateTime;
      end;
    end;

  end; // end do for
  if (FRPRI.TipUsu <= '5') then
    FaturamentoAvulso1.Visible := false;

  empresa_simples := q_vendas1.fieldbyname('ENQUADRADA_SIMPLES').AsString = 'S';
  cliente_com_suspensao_pis_cofins := q_vendas1.fieldbyname('SUSPENSAO_PIS_CONFINS').AsString = 'S';
  cliente_consumidor_final := q_vendas1.fieldbyname('consumidor_final').AsString = 'S';
  cliente_isento_icms := q_vendas1.fieldbyname('isento').AsString = '1';
  cliente_sem_ie := q_vendas1.fieldbyname('isento').AsString = '2';
  cliente_pre_cadastrado := q_vendas1.fieldbyname('pre_cadastro').AsString = 'S';
  Btexcped.Enabled := q_vendas1.fieldbyname('faturado').AsString = '0';

  Lbnom_cliente.Caption := q_vendas1.fieldbyname('nom_cliente').AsString + ' | Cnpj: ' + q_vendas1.fieldbyname('cnpj').AsString + ' | Cidade: ' + q_vendas1.fieldbyname('nom_cidade').AsString + '-' + q_vendas1.fieldbyname('uf').AsString;

  UF_Cliente := q_vendas1.fieldbyname('uf').AsString;
  UF_Emissor := q_vendas1.fieldbyname('uf_emissor').AsString;

  Pedido_AVista := q_vendas1.fieldbyname('avista').AsString = 'S';
  gerar_cr := q_vendas1.fieldbyname('NAO_GERAR_CR').AsString <> 'S';

  Lbnom_representante.Caption := q_vendas1.fieldbyname('nom_representante').AsString;

  Lbnom_supervisor.Caption := q_vendas1.fieldbyname('supervisor').AsString;

  if not venda then
  begin
    Prcod_fornecedorExit(Self);
    CarregaChaveNfeDev;
  end;

  representante_funcionario := q_vendas1.fieldbyname('funcionario').AsString = 'S';

  Lbnom_fop.Caption := q_vendas1.fieldbyname('nom_fop').AsString;
  desconto_forma := q_vendas1.fieldbyname('desconto_forma').AsFloat;
  desconto_prazo := q_vendas1.fieldbyname('desconto_prazo').AsFloat;

  gbDesconto.Enabled := desconto_prazo > 0;
  valor_minimo_pedido := q_vendas1.fieldbyname('valor_minimo_pedido').AsCurrency;

  Lbprazo_pgto.Caption := q_vendas1.fieldbyname('prazo').AsString;
  Lbempresa_faturamento.Caption := q_vendas1.fieldbyname('nom_empresa').AsString;

  nome_logo := q_vendas1.fieldbyname('nom_empresa').AsString + '.bmp';
//  TBlobField(q_vendas1.fieldbyname('LOGO')).SaveToFile(nome_logo);

  aviso_conta_boleto := true;

  LbNom_transportadora.Caption := q_vendas1.fieldbyname('nome').AsString;
  desconto_maximo := q_vendas1.fieldbyname('desconto_maximo').AsString;
  Mostra := false;
  carrega_vendas2;
  promocao_desconto := TodosPromocao;
  somaTotal;
  desconto_anterior := Prdesconto.Value;
  Mostra := true;

  if PrStatus_Nfe.Text = '100' then
  begin
    btXML.Enabled := true;
    BtnDanfe.Enabled := true;
    btXML.Enabled := true;
    BtnEmailNFe.Enabled := true;
    BtnNFE.Enabled := false;

    if q_vendas1.fieldbyname('PRAZO_CANCEL').AsString = '1' then
    begin
      lbStatusCancel.Caption := 'Prazo de Cancelamento expirou.';
      BtnEditarCancelamentoNFe.Enabled := false;
      BtnEditarCC.Enabled := true;
    end
    else
    begin
      lbStatusCancel.Caption := 'Prazo Limite para o Cancelamento: ' + FormatDateTime('dd/mm/yyyy hh:mm', q_vendas1.fieldbyname('DATA_REC_NFE').AsDateTime + 1);
      BtnEditarCancelamentoNFe.Enabled := true;
      BtnEditarCC.Enabled := true;
    end;
  end
  else
  begin
    BtnNFE.Enabled := true;
    btnNfeDev.Enabled := false;
    BtnEditarCancelamentoNFe.Enabled := false;
    BtnEnviarCancelamentoNFe.Enabled := false;
    BtnSairCancelamentoNFe.Enabled := false;

    BtnEditarCC.Enabled := false;
    BtnEnviarCC.Enabled := false;
    BtnGravarCC.Enabled := false;
    BtnCancelCC.Enabled := false;

    BtnDanfe.Enabled := false;
    btXML.Enabled := false;
    BtnEmailNFe.Enabled := false;
    lbStatusCancel.Caption := ' ';
  end;

  {if q_vendas1.fieldbyname('faturado').AsString = '0' then
    sbClonar.Enabled := false
  else
    sbClonar.Enabled := true;
   }

  if not q_vendas1.fieldbyname('USUARIO_LIBEROU_DESCONTO').IsNull then
    usuario_liberou_desconto := q_vendas1.fieldbyname('USUARIO_LIBEROU_DESCONTO').AsString
  else
    usuario_liberou_desconto := '';

  PrCONTA_BOLETOExit(Self);

  // AtivaJanela;
  Screen.Cursor := crDefault;
  q_vendas1.Open;

  I1.Enabled := not (q_vendas1.fieldbyname('NR_PEDIDO_PALM').IsNull and q_vendas1.fieldbyname('pedido_origem').IsNull);
  pedido_tablet := q_vendas1.fieldbyname('NR_PEDIDO_PALM').AsString;

  if not q_vendas1.fieldbyname('NR_PEDIDO_PALM').IsNull then
  begin
    origem_tipo := 0;
    stOrigem.Caption := 'Pedido Tablet Nº.: ' + q_vendas1.fieldbyname('NR_PEDIDO_PALM').AsString;
  end;

  if not q_vendas1.fieldbyname('pedido_origem').IsNull then
  begin
    origem_tipo := 1;
    stOrigem.Caption := 'Pedido NoteBook Nº.: ' + q_vendas1.fieldbyname('pedido_origem').AsString;
  end;

  if not I1.Enabled then
    stOrigem.Caption := '';

  if (Lbnom_fop.Caption = 'TRANSFERENCIA') then
  begin
    transferencia := true;
  end;


  if not q_vendas1.fieldbyname('NUMDOC_DESTINO').IsNull then
  begin
    stOrigem.Caption := 'Pedido Destino Nº.: ' + q_vendas1.fieldbyname('NUMDOC_DESTINO').AsString;
    BtnEnviarPedido.Enabled := false;
  end
  else
    BtnEnviarPedido.Enabled := true;

  StatusPedido;

  Prcod_cargaExit(Self);

end;

procedure TFr_vendas_industria2.mostra_campos(prefixo: string);
begin

end;

procedure TFr_vendas_industria2.carrega_vendas2;
var
  total_custo: double;
begin
  // ativa_vendas2(Prnumdoc.Text);
  q_vendas2.First;
  // if Fr_vendas_industria2.mmVendas2.Active then  Fr_vendas_industria2.mmVendas2.Close;
  mmVendas2.EmptyTable;
  mmVendas2.Open;
  total_custo := 0;

  if q_vendas2.IsEmpty then
    Exit;
  btexc.Enabled := true;
  WindowList := DisableTaskWindows(fm_splash.Handle);
  q_vendas2.Last;
  fm_splash.ggProgress.MaxValue := q_vendas2.RecordCount;
  q_vendas2.First;
  fm_splash.lbStatus.Caption := 'Carregando Itens...';
  fm_splash.ggProgress.Progress := 0;
  fm_splash.Show;

  Pc_vendas.TabIndex := 0;
  pnWait.Visible := true;
  carregando_item := true;
  mmVendas2.DisableControls;

  while not (q_vendas2.Eof) do
  begin
    mmVendas2.Append;
    mmVendas2ID.AsString := q_vendas2.fieldbyname('id').Value;
    mmVendas2COD_PRODUTO.AsString := q_vendas2.fieldbyname('cod_produto').AsString;
    mmVendas2PROMOCAO.AsString := q_vendas2.fieldbyname('PROMOCAO').AsString;

    if mmVendas2PROMOCAO.AsString = 'S' then
      mmVendas2NOM_PRODUTO.AsString := q_vendas2.fieldbyname('nom_produto').AsString + ' (PROMOÇÃO)'
    else
      mmVendas2NOM_PRODUTO.AsString := q_vendas2.fieldbyname('nom_produto').AsString;

    if desconto_forma = 0 then
      mmVendas2DESCONTO_MAXIMO.Value := q_vendas2.fieldbyname('DESCONTO_MAXIMO').AsFloat + (100 - q_vendas2.fieldbyname('DESCONTO_MAXIMO').AsFloat)
    else
      mmVendas2DESCONTO_MAXIMO.Value := desconto_forma;

    mmVendas2NCM.AsString := q_vendas2.fieldbyname('ncm').AsString;
    mmVendas2TRIB_ICMS.AsString := q_vendas2.fieldbyname('trib_icms').AsString;
    mmVendas2COD_FISCAL_ITEM.AsString := q_vendas2.fieldbyname('COD_FISCAL_ITEM').AsString;

    if q_vendas2.fieldbyname('cesta_basica').AsString = 'S' then
      mmVendas2CESTA_BASICA.Value := true
    else
      mmVendas2CESTA_BASICA.Value := false;

    mmVendas2CEST.AsString := q_vendas2.fieldbyname('CEST').AsString;
    mmVendas2VOLUME.AsString := q_vendas2.fieldbyname('volume').AsString;
    mmVendas2QTD.AsString := q_vendas2.fieldbyname('qtd').AsString;
    mmVendas2PRECO_VENDA.AsString := q_vendas2.fieldbyname('preco_bruto').AsString;
    mmVendas2DESCONTO.AsString := q_vendas2.fieldbyname('desconto').AsString;
    mmVendas2DESCONTO_VALOR.AsString := q_vendas2.fieldbyname('desconto_valor').AsString;
    mmVendas2DESCONTO_VALOR_GERAL.AsString := q_vendas2.fieldbyname('desconto_valor_GERAL').AsString;
    mmVendas2PRECO_LIQUIDO.AsString := q_vendas2.fieldbyname('preco').AsString;
    mmVendas2PRECO_CUSTO.AsString := q_vendas2.fieldbyname('preco_CUSTO').AsString;
    mmVendas2PRECO_BASE.AsString := q_vendas2.fieldbyname('preco_BASE').AsString;
    total_custo := total_custo + (mmVendas2QTD.Value * mmVendas2PRECO_CUSTO.Value);
    mmVendas2SUB_TOTAL.AsString := q_vendas2.fieldbyname('sub_total').AsString;
    mmVendas2IPI_ITEM.AsString := q_vendas2.fieldbyname('ipi_item').AsString;
    mmVendas2VLR_IPI_ITEM.AsString := q_vendas2.fieldbyname('vlr_ipi_item').AsString;
    mmVendas2VLR_BC.AsString := q_vendas2.fieldbyname('vlr_bc').AsString;
    mmVendas2ICMS_ITEM.AsString := q_vendas2.fieldbyname('icms_item').AsString;
    mmVendas2VLR_ICMS_ITEM.AsString := q_vendas2.fieldbyname('vlr_icms_item').AsString;
    mmVendas2VLR_AGR_ITEM.AsString := q_vendas2.fieldbyname('vlr_agr_item').AsString;
    mmVendas2VLR_BC_ST.AsString := q_vendas2.fieldbyname('vlr_bc_st').AsString;
    mmVendas2VLR_ICMS_ST.AsString := q_vendas2.fieldbyname('vlr_icms_st').AsString;
    mmVendas2PERC_COMISSAO.AsString := q_vendas2.fieldbyname('PERC_comissao').AsString;
    mmVendas2VLR_COMISSAO.AsString := q_vendas2.fieldbyname('vlr_comissao').AsString;
    mmVendas2QTD_ESTOQUE.AsString := q_vendas2.fieldbyname('QTD_ESTOQUE').AsString;
    mmVendas2ESTOQUE_MINIMO.AsString := q_vendas2.fieldbyname('ESTOQUE_MINIMO').AsString;
    mmVendas2QTD_RESERVADO.AsString := q_vendas2.fieldbyname('QTD_RESERVADO').AsString;
    mmVendas2GRADE_COMISSAO.AsString := q_vendas2.fieldbyname('GRADE_COMISSAO').AsString;

    mmVendas2NAO_VALIDAR_MARGEM.AsString := q_vendas2.fieldbyname('NAO_VALIDAR_MARGEM').AsString;

    mmVendas2DESCONTO_MAXIMO.Value := q_vendas2.fieldbyname('DESCONTO_MAXIMO').AsFloat;

    mmVendas2CODIGO_BARRAS.AsString := q_vendas2.fieldbyname('CODIGO_BARRA').AsString;

    mmVendas2PESO.Value := q_vendas2.fieldbyname('PESO').AsFloat;
    mmVendas2PESO_TOTAL.Value := q_vendas2.fieldbyname('PESO_TOTAL').AsFloat;

    mmVendas2.post;

    fm_splash.ggProgress.AddProgress(1);
    fm_splash.refresh;
    // sleep(50);
    q_vendas2.next;
  end;
  mmVendas2.EnableControls;

  carregando_item := false;
  EnableTaskWindows(WindowList);
  fm_splash.Hide;
  pnWait.Visible := false;

  // ChecarFaturamentoLiquido((prtot_liquido.Value - total_custo), total_custo);
  if DBGrid1.Enabled then
    DBGrid1.SetFocus;
  mmVendas2.First;
  ListarItensPedidos;
end;

procedure TFr_vendas_industria2.BtcanpedClick(Sender: TObject);
var
  numdoc: integer;
begin
  cliente_alterado := false;
  if btcan.Enabled = true then
    btcanClick(Self);

  HabilitaBotoesPedido(1);

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


  if modo_insert then
  begin
    limpa_campos('Pr');
    status.Caption := '...';
    mmVendas2.EmptyTable;
    BtnNFE.Enabled := false;
    Btexcped.Enabled := false;
    promocao_desconto := false;
  end
  else if trim(Prnumdoc.Text) <> '' then
    CarregaDados;

  readonly_true('Pr');
  readonly_true('Me');

  sbvendas.Panels.Items[0].Text := '';
  BtnEnviarPedido.Enabled := BtnEnviarPedido.Visible and (Prnumdoc.Text <> '');

  if not mmVendas2.IsEmpty and not representacao then
  begin
    somaTotal;
  end;

end;

procedure TFr_vendas_industria2.btexcClick(Sender: TObject);
var
  volume: real;
begin
  try
    produto_alterado := false;
    if (Btnovped.Enabled = true) then
    begin
      dao.msg('O Botão Novo ou Alterar Geral deve ser pressionado!');
      Pc_vendas.ActivePageIndex := 0;
      DBGrid1.SetFocus;
      Exit;
    end;

    if MessageDlg('Tem Certeza que Deseja Excluir Este Produto da Entrada?', mtConfirmation, [mbYes, mbno], 0) = mryes then
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
      dao.msg('Houve um erro ao Excluir o Produto na Venda!' + #13 + e.Message);

      // dao.envia_email_suporte('Erro ao excluir produto '+Lbnom_produto.Caption+' da entrada: '+PrNr_documento.Text+'   - Fornecedor : '+LbNom_fornecedor.Caption  + #13 + e.Message+#13+'Data: '+dao.DtaSerStr +#13+'Usuario Logado:'+nom_usuario ,'Erro ao inserir Registro módulo Dao','claudioplasfan@gmail.com','','','');
    end;
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

procedure TFr_vendas_industria2.CheckStatusNFe;
var
  cBuscarCertificado: _BuscarCertificado;
  cTransmissaoXML: _TransmissaoXML;
  tipAmb, nomeCertificado, strVersaoDados, strDados, strCabecXML: string;
  MsgRetWS, smensagem: WideString;
begin
  // bt_faturar.Visible := false;
  Timer1.Enabled := false;
  try
    strCabecXML := '<?xml version="1.0" encoding="UTF-8" ?><cabecMsg xmlns="http://www.portalfiscal.inf.br/nfe" versao="1.02"><versaoDados>2.00</versaoDados></cabecMsg>';
    strDados := '<?xml version="1.0" encoding="UTF-8" ?><consStatServ xmlns="http://www.portalfiscal.inf.br/nfe" versao="2.00"><tpAmb>' + tipAmb + '</tpAmb><cUF>SC</cUF><xServ>STATUS</xServ></consStatServ>';

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
    cTransmissaoXML.NfeStatusServico('2', UF_Emissor, strtoint(tipAmb), nomeCertificado, strCabecXML, strDados, MsgRetWS);
  except
    // bt_faturar.Visible := true;
  end;
  cTransmissaoXML := nil;
  Timer1.Interval := 600000;
  Timer1.Enabled := true;
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
    mmVendas2.next;
  end;
  if Result = false then
    showmessage('Há itens com quantidade igual 0!');
  mmVendas2.EnableControls;
end;

procedure TFr_vendas_industria2.somaTotal;
var
  i: integer;
  ac_tot_liq, ac_tot_bruto, ac_fat_liq, ac_tot_custo, ac_tot_bc_icms, ac_tot_icms, ac_tot_bc_st, ac_tot_st, ac_tot_ipi, ac_volume, ac_vlr_comissao, ac_peso_total, ac_total_cr, ac_total_desconto, ac_total_desconto_geral, st_desc: real;
begin
  btnov.Enabled := true;
  if mmVendas2.RecordCount > 0 then
  begin
    btexc.Enabled := true;
    btalt.Enabled := true;
    DBGrid1.Enabled := true;
  end
  else
  begin
    btexc.Enabled := false;
    btalt.Enabled := false;
    DBGrid1.Enabled := false;
  end;

  ac_vlr_comissao := 0;
  ac_tot_bruto := 0;
  ac_tot_liq := 0;
  ac_tot_bc_icms := 0;
  ac_tot_icms := 0;
  ac_tot_bc_st := 0;
  ac_tot_st := 0;
  ac_tot_ipi := 0;
  // ac_volume := 0;
  ac_fat_liq := 0;
  ac_tot_custo := 0;
  ac_peso_total := 0;
  ac_total_cr := 0;
  ac_total_desconto := 0;
  ac_total_desconto_geral := 0;
  st_desc := 0;
  liberar_margem := false;
  if mmVendas2.isempty then Exit;
  
  mmVendas2.First;
  mmVendas2.DisableControls;
  while not mmVendas2.Eof do
  begin
    mmVendas2.Edit;
    dados_produto(mmVendas2COD_PRODUTO.AsString);
    mmVendas2SUB_TOTAL.Value := mmVendas2PRECO_LIQUIDO.Value * mmVendas2QTD.Value;
    mmVendas2PESO_TOTAL.Value := mmVendas2PESO.Value * mmVendas2QTD.Value;
    mmVendas2.post;

    if mmVendas2PROMOCAO.AsString = 'S' then
      ac_tot_custo := ac_tot_custo + (mmVendas2QTD.Value * (mmVendas2PRECO_LIQUIDO.Value * (margem_lucro_ideal / 100)))
    else
      ac_tot_custo := ac_tot_custo + (mmVendas2QTD.Value * mmVendas2PRECO_CUSTO.Value);

    ac_tot_bruto := ac_tot_bruto + (mmVendas2QTD.Value * mmVendas2PRECO_VENDA.Value);

    ac_tot_liq := ac_tot_liq + mmVendas2SUB_TOTAL.Value;

    ac_tot_bc_icms := ac_tot_bc_icms + mmVendas2VLR_BC.Value;

    ac_tot_icms := ac_tot_icms + mmVendas2VLR_ICMS_ITEM.Value;
    ac_tot_bc_st := ac_tot_bc_st + mmVendas2VLR_BC_ST.Value;
    ac_tot_st := ac_tot_st + mmVendas2VLR_ICMS_ST.Value;
    ac_tot_ipi := ac_tot_ipi + mmVendas2VLR_IPI_ITEM.Value;
    // ac_volume := ac_volume + (mmVendas2QTD.Value / mmVendas2VOLUME.Value);
    ac_vlr_comissao := ac_vlr_comissao + mmVendas2VLR_COMISSAO.Value;
    ac_peso_total := ac_peso_total + mmVendas2PESO_TOTAL.Value;
    ac_total_desconto := ac_total_desconto + mmVendas2DESCONTO_VALOR.Value;
    ac_total_desconto_geral := ac_total_desconto_geral + mmVendas2DESCONTO_VALOR_GERAL.Value;
    mmVendas2.next;
  end;
  mmVendas2.EnableControls;
  ac_fat_liq := ac_tot_bruto - ac_tot_custo;
  // ChecarFaturamentoLiquido(ac_fat_liq, ac_tot_custo);
  mmVendas2.First;

  if not modo_insert then
  begin
    ativa_cr1(Prnumdoc.Text);
    while not q_cr1.Eof do
    begin
      ac_total_cr := ac_total_cr + q_cr1.fieldbyname('valor').Value;
      q_cr1.next;
    end;
    q_cr1.First;
  end;

  if (UF_Cliente <> UF_Emissor) and Faturado and (trim(PrNFE.Text) <> '') and (not Btgraped.Enabled) then
    st_desc := ac_tot_st;

  { if cliente_consumidor_final then
    ac_tot_bc_icms := 0; }

  Prtot_bruto.Value := ac_tot_bruto;
  Prtot_liquido.Value := ac_tot_liq;
  PrValorDescontoAdic.Value := ac_total_desconto;

  if (ac_tot_liq > 0) and (ac_tot_bruto > 0) and (ac_tot_custo > 0) then
  begin

    if Faturado and (ac_total_cr > 0) then
      margem_lucro := (((ac_total_cr - st_desc) / ac_tot_custo) - 1) * 100
    else
      margem_lucro := ((ac_tot_liq / ac_tot_custo) - 1) * 100;

    edMargemLucro.Value := margem_lucro;
    // ac_vlr_comissao := CalculoComissao;
    // edPercComissao.Value := ac_vlr_comissao;

    if not ((Prcod_fop.Text = '7') or (Prcod_fop.Text = '9') or (mform = 'vendas_devolucoes')) then
    begin
      status.Font.Size := 14;
      if margem_lucro < margem_lucro_ideal then
      begin
        status.Caption := 'RUIM';
        status.Font.Color := clMaroon;
      end
      else if margem_lucro >= 60 then
      begin
        status.Caption := 'ÓTIMO';
        status.Font.Color := clNavy;
      end
      else
      begin
        status.Caption := 'BOM';
        status.Font.Color := clTeal;
      end;

      if (FRPRI.TipUsu = '0') or (FRPRI.TipUsu = '1') or representacao then
      begin
        status.Caption := 'Tot.ST: ' + formatfloat('R$ #,###,##0.00', ac_tot_st) + #13 + 'M.L.: ' + formatfloat('#0.00%', margem_lucro) + ' - ' + copy(status.Caption, 1, 1);
        status.Font.Size := 8;
      end;

    end;
  end;

  if ac_tot_bruto > 0 then
  begin
    Prdesconto.Value := 100 - ((ac_tot_liq / ac_tot_bruto * 100));
    desconto_anterior := Prdesconto.Value;
  end;

  edPercComissao.Value := CalculoComissaoDesconto;
  edTotComissao.Value := ac_tot_liq * (edPercComissao.Value / 100);

  PrVLR_DESCONTO_GERAL.Value := ac_total_desconto_geral;
  Prvlr_bc_icms.Value := ac_tot_bc_icms;
  Prvlr_icms.Value := ac_tot_icms;
  PrVLR_BC_ICMS_ST.Value := ac_tot_bc_st;
  Prvlr_st.Value := ac_tot_st;
  Prvlr_ipi.Value := ac_tot_ipi;
  edPesoTotal.Value := ac_peso_total;
  CalcularPeso;
  // Prvolume_nota.Value := ac_volume;
end;

procedure TFr_vendas_industria2.ChecarFaturamentoLiquido(liquido, custo: double);
var
  margem_lucro: double;
begin
  if (Prcod_fiscal.Text = '5101') or (Prcod_fiscal.Text = '6101') or (Prcod_fiscal.Text = '5102') or (Prcod_fiscal.Text = '6102') or (Prcod_fiscal.Text = '5405') or (Prcod_fiscal.Text = '6403') then
  begin
    mmVendas2.First;
    mmVendas2.DisableControls;
    habilita_faturamento := true;
    while not mmVendas2.Eof do
    begin
      if mmVendas2DESCONTO.Value > (mmVendas2DESCONTO_MAXIMO.Value + 0.5) then
      begin
        if Prcod_fop.Text <> '7' then // se não for permuta bloqueia...
          habilita_faturamento := false;
      end;
      mmVendas2.next;
    end;
    mmVendas2.EnableControls;
    liberado := habilita_faturamento;
    if not habilita_faturamento and (usuario_liberou_desconto = '') and (trim(Prnumdoc.Text) <> '') then
    begin
      if Mostra then
      begin
        if FMFUN.Dc_MessageDlg('Há Desconto Acima do Permitido no Pedido!. Solicitar Liberação?', mtConfirmation, [mbYes, mbno], 0, mrno) = mryes then
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
              gravar_liberacao_desconto(Fr_senha_especial.codusu, FmMotivo.mmMotivo.Text);
              liberado := true;
            end
            else
              liberado := false;

            FmMotivo.Free;
          end;
          Fr_senha_especial.Free;
          habilita_faturamento := liberado;
        end
        else
        begin
          liberado := false;
          Exit;
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

procedure TFr_vendas_industria2.Prcontato_freteKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Prdta_emissao.SetFocus;
    Key := #0;
  end;
end;

procedure TFr_vendas_industria2.GerarParcelas(nr_documento, cod_cliente, cod_fop, cod_prazo: string; valor_total: real; NFe: boolean);
var
  qtd_parcelas: integer;
  remessa, prazo_str, titulo: string;
  prazo: array of integer;
  i, p, j: integer;
  te: string;
  dt_vencimento: TDate;
  saldo_ultima_parcela, vl_parcela, comissao_total, comissao_parcela, desconto_primeira_parcela: real;
  letra_titulo: string;
  extrato: integer;
  historico: string;
begin
  dao.Geral1('select count(*) as total from cr1 where nr_documento = ' + Prnumdoc.Text + ' and valor_recebido > 0');

  desconto_primeira_parcela := (valor_total * (desconto_especial_cliente / 100));

  if dao.q1.fieldbyname('total').AsInteger = 0 then
  begin

    try
      if (trim(cod_fop) = '') then
      begin
        showmessage('Forma de Pagamento deve ser preenchida!');
        Exit;
      end;

      if (trim(cod_prazo) = '') then
      begin
        showmessage('Prazo deve ser preenchido!');
        Exit;
      end;

      if (Prcod_fop.Text <> '9') then
      begin
        dao.cn.StartTransaction;
        dao.Geral1('select * from prazo where id=' + QuotedStr(cod_prazo));
        qtd_parcelas := dao.q1.fieldbyname('qtd_parcelas').AsInteger;
        prazo_str := dao.q1.fieldbyname('prazo').AsString;

        dao.Geral2('select vlr_comissao from vendas1 where numdoc=' + QuotedStr(Prnumdoc.Text));
        comissao_total := dao.q2.fieldbyname('vlr_comissao').AsFloat;
        comissao_parcela := comissao_total / qtd_parcelas;
        p := 1;
        SetLength(prazo, qtd_parcelas);
        for i := 0 to qtd_parcelas - 1 do
        begin
          if i = qtd_parcelas - 1 then
            prazo[i] := strtoint(copy(prazo_str, p, length(prazo_str)))
          else
            prazo[i] := strtoint(copy(prazo_str, p, Pos('/', prazo_str) - 1));

          prazo_str := copy(prazo_str, Pos('/', prazo_str) + 1, length(prazo_str));
        end;

        vl_parcela := valor_total / qtd_parcelas;
        vl_parcela := SimpleRoundTo(vl_parcela, -2);


        // for i:=0 to high(prazo) do
        // te:= te + '/' + inttostr(prazo[i]);
        { dao.Geral4('SELECT distinct a.BOLETO_REMESSA_ORDEM, b.dia, b.mes  FROM CR1 a left outer join BOLETO_REMESSA_ORDEM b on (a.BOLETO_REMESSA_ORDEM = b.id)  WHERE a.NR_DOCUMENTO = ' + Prnumdoc.Text);

          if dao.q4.fieldbyname('BOLETO_REMESSA_ORDEM').isnull then
          remessa := 'null'
          else
          remessa := dao.q4.fieldbyname('BOLETO_REMESSA_ORDEM').AsString;
        }

        if not LimparBoletos then
          Exit;

        if Prempresa_faturar.Text = '1' then
          letra_titulo := 'b'
        else
          letra_titulo := 'c';

        if PrNFE.Text <> '' then
          titulo := PrNFE.Text + letra_titulo
        else
          titulo := nr_documento;

        saldo_ultima_parcela := valor_total;

        for i := 0 to high(prazo) do
        begin

          if i = 0 then
            vl_parcela := vl_parcela - desconto_primeira_parcela
          else
          begin
            if saldo_ultima_parcela > vl_parcela then
              vl_parcela := SimpleRoundTo((valor_total / qtd_parcelas), -2)
            else
              vl_parcela := saldo_ultima_parcela;
          end;
          saldo_ultima_parcela := saldo_ultima_parcela - vl_parcela;

          if (saldo_ultima_parcela < vl_parcela) and (i = high(prazo)) then
            vl_parcela := vl_parcela + saldo_ultima_parcela;

          dt_vencimento := Prdta_emissao.Date + prazo[i];
          dao.Execsql('insert into cr1 (id_plano_contas, cod_cliente, nr_documento, titulo, sequencia, cod_empresa, dtaven, valor, valor_corrigido, cod_fop, historico1' +
                      ',saldo, dias_atraso, id_representante, vlr_comissao) values (8, ' + QuotedStr(cod_cliente) + ',' + QuotedStr(nr_documento) + ',' + QuotedStr(FMFUN.enchezero(titulo, 6)) + ',' + QuotedStr(inttostr(i + 1)) + ',' + QuotedStr(cod_empresa) + ',' + QuotedStr(FormatDateTime('dd.mm.yyyy', dt_vencimento)) + ',' + QuotedStr(FMFUN.prepara_valor(floattostr
            (vl_parcela))) + ',' + QuotedStr(FMFUN.prepara_valor(floattostr(vl_parcela))) + ',' + QuotedStr(cod_fop) + ',' + QuotedStr('') + ',' + QuotedStr(FMFUN.prepara_valor(floattostr(vl_parcela))) + ',' + QuotedStr('0') + ',' + QuotedStr(Prcod_representante.Text) + ',' + QuotedStr(FMFUN.prepara_valor(floattostr(comissao_parcela))) + ')');
        end;
        dao.cn.Commit;
        // BtnAltFormaPrazo.Visible := true;
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

      if q_cr1.fieldbyname('conta_padrao').IsNull then
        Exit;

      while not q_cr1.Eof do
      begin
        try
          if not dao.cn.InTransaction then
            dao.cn.StartTransaction;

          historico := 'RECEBIMENTO CONTA: CLIENTE: ' + Lbnom_cliente.Caption + ' TÍTULO Nº: ' + q_cr1.fieldbyname('titulo').AsString + ';';
          extrato := FMFUN.GravaExtrato(historico, QuotedStr(formatdatetime('dd/mm/yyyy', q_cr1.fieldbyname('dtaven').AsDateTime)), q_cr1.fieldbyname('conta_padrao').AsString, 'C', q_cr1.fieldbyname('valor').Value, 0);
          FMFUN.GravaExtratoConta(extrato, q_cr1.fieldbyname('id').AsInteger, 2);

          dao.Exec_sql.sql.Clear;

          dao.Exec_sql.sql.Add('UPDATE CR1 SET DTAREC = ' + QuotedStr(formatdatetime('dd/mm/yyyy', q_cr1.fieldbyname('dtaven').AsDateTime)) + ', VALOR = ' + StringReplace(q_cr1.fieldbyname('valor').AsString, ',', '.', [rfReplaceAll]) + ', VLR_CORRIGIDO = ' + StringReplace(q_cr1.fieldbyname('valor').AsString, ',', '.', [rfReplaceAll]) + ', VALOR_RECEBIDO = ' + StringReplace(q_cr1.fieldbyname('valor').AsString, ',', '.', [rfReplaceAll]) + ' WHERE ID = ' + q_cr1.fieldbyname('id').AsString);

          dao.Exec_sql.Execsql;

          dao.grava_log(dao.Exec_sql.sql.Text, '');

          dao.cn.Commit;
        except
          dao.cn.Rollback;
        end;

        q_cr1.next;

      end;
    end;

  end
  else
    showmessage('Não é permitido Gerar Novas parcelas pagas.');
end;

procedure TFr_vendas_industria2.faturar(nr_documento, cod_cliente, cod_fop, cod_prazo: string; valor_total: real; NFe: boolean);
var
  qtd_parcelas: integer;
  prazo_str: string;
  prazo: array of integer;
  i, p, j, x: integer;
  te: string;
  dt_vencimento: TDate;
  vl_frete, vl_parcela, comissao_total, comissao_parcela: real;
  produto_lst, qtd_lst: TStringList;
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
        dao.Execsql('update vendas1 set faturado=' + QuotedStr('1') + ', orcamento = 0 where numdoc=' + QuotedStr(nr_documento));
        dao.cn.Commit;
      except
        dao.cn.Rollback;
      end;

    end;

    if Prtipo_frete.ItemIndex = 2 then
      vl_frete := Prvl_frete.Value
    else
      vl_frete := 0;

    if NFe and (UF_Cliente <> UF_Emissor) then
      valor_total := Prtot_liquido.Value + vl_frete + Prvlr_st.Value - PrVLR_DESCONTO_GERAL.Value - cliente_saldo
    else
      valor_total := Prtot_liquido.Value + vl_frete - PrVLR_DESCONTO_GERAL.Value - cliente_saldo;

    if gerar_cr then
      GerarParcelas(nr_documento, cod_cliente, cod_fop, cod_prazo, valor_total, NFe)
    else
      LimparBoletos;

    q_vendas2.First;

    produto_lst := TStringList.Create;
    qtd_lst := TStringList.Create;

    while not (q_vendas2.Eof) do
    begin
      produto_lst.Add(q_vendas2.fieldbyname('COD_PRODUTO').AsString);
      qtd_lst.Add(q_vendas2.fieldbyname('QTD').AsString);
      q_vendas2.next;
    end;

    if (PrProcesso_id.Text = '') then
    begin
      PrProcesso_id.Text := FMFUN.GerarProcessoPedido;
      dao.Execsql('UPDATE VENDAS1 A SET PROCESSO_ID = ' + PrProcesso_id.Text + ' WHERE NUMDOC = ' + Prnumdoc.Text);
    end;

    if mform <> 'vendas_devolucoes' then
      FMFUN.GravarProcessoPedido('FATURADO-VENDAS', PrProcesso_id.Text, Prnumdoc.Text)
    else
      FMFUN.GravarProcessoPedido('FATURADO-DEVOLUÇÃO', PrProcesso_id.Text, Prnumdoc.Text);

    //dao.cn.CommitRetaining;
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
    Exit;
  end;

  StatusPedido;
  dao.q1.Open;
  if dao.q1.fieldbyname('cod_fat').AsString <> '0' then
    Result := true
  else
    Result := false;
end;

procedure TFr_vendas_industria2.btXmlClick(Sender: TObject);
var
  ArquivoXML : string;
begin
  if SaveFileDlg.Execute then
  begin
    ArquivoXML := SaveFileDlg.FileName;
    q_xml.close;
    q_xml.ParamByName('numdoc').value := Prnumdoc.Text;
    q_xml.Open;

    if not q_xml.fieldbyname('XML').IsNull then
    begin
      TBlobField(q_xml.fieldbyname('XML')).SaveToFile(ArquivoXML);
      dao.msg('XML salvo com sucesso!');
      ShellExecute(0, 'open', 'iexplore.exe', PChar('file:///' + StringReplace(ArquivoXML, '\', '/', [rfReplaceAll])), nil, SW_SHOWNORMAL);
    end
    else
      dao.msg('XML não existente no Banco de dados.');
  end;
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
    if not Faturado then
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

      if Faturado then
      begin
        dao.msg('PEDIDO JÁ FATURADO OU CANCELADO!');
        Exit;
      end;

      { faturar(Prnumdoc.Text, Prcod_cliente.Text, Prcod_fop.Text, Prcod_prazo_pgto.Text, Prtot_liquido.Value, false); }
      try
        if not (dao.cn.InTransaction) then
          (dao.cn.StartTransaction);

        if PrNF.Text <> '' then
          dao.Execsql('update vendas1 set nf=' + QuotedStr(PrNF.Text) + ' where numdoc=' + QuotedStr(Prnumdoc.Text));

        dao.cn.Commit;
        // ativa_cr1(Prnumdoc.Text);

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

  end; // end do 1º if
end;



procedure TFr_vendas_industria2.HabilitaBotoesPedido(modo : Integer);
begin
 case modo of
   0 : //ALTERAR E INSERIR CLICADOS
     begin
       Btnovped.Enabled := False;
       Btaltped.Enabled := False;
       Btgraped.Enabled := True;
       Btcanped.Enabled := True;
       Btexcped.Enabled := False;
       BtStatus.Enabled := False;
       Btlocped.Enabled := False;
     end;
   1 : //GRAVAR E CANCELAR CLICADOS
     begin
       Btnovped.Enabled := True;
       Btaltped.Enabled := True;
       Btgraped.Enabled := False;
       Btcanped.Enabled := False;
       Btexcped.Enabled := True;
       BtStatus.Enabled := True;
       Btlocped.Enabled := True;
     end;
 end;

end;


procedure TFr_vendas_industria2.BtaltpedClick(Sender: TObject);
begin
  if BtnEnviarPedido.Visible then
    BtnEnviarPedido.Enabled := false;

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
    if Faturado then
    begin
      dao.msg('O Pedido está ' + sbvendas.Panels.Items[1].Text + '!');
      Exit;
    end;
  end;

  BtnEmailPedido.Enabled := false;
  BtnNFE.Enabled := false;

  HabilitaBotoesPedido(0);

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
  DBGrid1.Enabled := true;
  btnov.Enabled := true;
  if mmVendas2.RecordCount > 0 then
    btalt.Enabled := true
  else
    btalt.Enabled := false;

  Prempresa_faturar.ReadOnly := false;
  if (FRPRI.TipUsu = '0') or (FRPRI.TipUsu = '1') then
    Prcod_representante.ReadOnly := true;
 {

  if trim(PrNFE.Text) <> '' then
    Prempresa_faturar.ReadOnly := true;
 }
end;



procedure TFr_vendas_industria2.BtgrapedClick(Sender: TObject);
var
  comissao, qtd_est_reservado: real;
  desconto_valor, desconto_valor_geral, vlr_bc, vlricm, vlr_bc_st, VLR_ICMS_ST, preco_cs, trib_icms, enviado: string;
  IsComplementar: Boolean;
begin
  IsComplementar := (prTipoNFe.ItemIndex = 1);

  // Garante que nenhuma transacao abortada anterior fique pendente no PostgreSQL
  if dao.cn.InTransaction then
    dao.cn.Rollback;

  if not IsComplementar then
  begin
    LiberaItemRepetido := not itens_repetidos;

    if itens_repetidos then
    begin
      if MessageDlg('Produto incluído no Pedido mais de uma vez. Desejas continuar?', mtConfirmation, [mbYes, mbno], 0) = mrno then
        Exit
      else
        LiberaItemRepetido := true;
    end;

    if btgra.Enabled then
    begin
      Pc_vendas.TabIndex := 0;
      btgraClick(Self);
      Exit;
    end;

    if cliente_bloqueado and not Pedido_AVista then
    begin
      dao.msg('CLIENTE BLOQUEADO. Não é permitido gravar o pedido.');
      Exit;
    end;

    if (FRPRI.TipUsu > '0') then
    begin
      if (mform <> 'vendas_devolucoes') and not Pedido_AVista then
        ChecarDataUltConsultaSerasa;
    end;

    cliente_alterado := false;

    Pc_vendas.TabIndex := 0;
    if (Prcod_representante.Text = '') and venda then
    begin
      dao.msg('O campo Representante deve ser Preenchido');
      Prcod_representante.SetFocus;
      Exit;
    end;

    if venda then
    begin
      if Prcod_cliente.Text = '' then
      begin
        dao.msg('Campo Cliente deve ser Preenchido!');
        Prcod_cliente.SetFocus;
        Exit;
      end;
    end
    else
    begin
      if (Prcod_cliente.Text = '') and (Prcod_fornecedor.Text = '') then
      begin
        dao.msg('Campo Cliente ou Fornecedor deve ser Preenchido!');
        Prcod_cliente.SetFocus;
        Exit;
      end;
    end;

    if (FRPRI.TipUsu > '1') and (Prorcamento.ItemIndex = 0) and not representacao then
    begin
{      if not ChecarDadosCliente then
        Exit;  }

 {     if not ChecarDadosTransportadora then
        Exit;}

        { if Prcod_fop.Text = '1' then
          CalcularDesconto; }

      if (Prcod_fop.Text = '') then
      begin
        dao.msg('O campo Forma de Pagamento deve ser Preenchido');
        Prcod_fop.SetFocus;
        Exit;
      end;

      if (Prcod_prazo_pgto.Text = '') then
      begin
        dao.msg('O campo Prazo Pagamento deve ser Preenchido');
        Prcod_prazo_pgto.SetFocus;
        Exit;
      end;

      if Prempresa_faturar.Text = '' then
      begin
        dao.msg('O campo Empresa deve ser Preenchido');
        Pc_vendas.ActivePage := tab_finalizar;
        Prempresa_faturar.SetFocus;
        Exit;
      end;

      if Prcod_fiscal.Text = '' then
      begin
        dao.msg('O campo Código Fiscal deve ser Preenchido');
        Pc_vendas.ActivePage := tab_finalizar;
        Prcod_fiscal.SetFocus;
        Exit;
      end;

      if (Lbnom_fop.Caption = 'BOLETO') and (trim(PrCONTA_BOLETO.Text) = '') then
      begin
        dao.msg('Na forma de pagamento BOLETO. O campo Banco CC Boleto deve ser preenchido.');
        Pc_vendas.ActivePage := tab_mercadorias;
        PrCONTA_BOLETO.SetFocus;
        Exit;
      end;
    end;

    if mform <> 'vendas_devolucoes' then
    begin
      if not VerificarMargem then
        Exit;
    end;

    if (mmVendas2.RecordCount = 0) and (not agrupar_pedidos) and (not IsComplementar) then
    begin
      dao.msg('O Pedido não pode ser Gravado sem Mercadorias Lançadas');
      btcanClick(Self);
      Exit;
    end;
  end;

  try
    if Prnumdoc.Text = '' then
    begin
      try
        if not (dao.cn.InTransaction) then
          dao.cn.StartTransaction;
        PrProcesso_id.Text := FMFUN.GerarProcessoPedido;
        id_pedido := dao.insert('Pr', 'vendas1', 'numdoc', Fr_vendas_industria2, 'gen_venda1');
        dao.cn.Commit;
        Prnumdoc.Text := id_pedido;

      except
        dao.cn.Rollback;
      end;

    end;

    GravarPedido := true;

    CFOPTROCA(false);

    try
      if not (dao.cn.InTransaction) then
        dao.cn.StartTransaction;

      dao.Execsql('DELETE FROM VENDAS2 WHERE  NUMDOC = ' + Prnumdoc.Text);
      dao.cn.Commit;

    except
      dao.cn.Rollback;
    end;

    if not mmVendas2.IsEmpty then
    begin
      mmVendas2.DisableControls;
      mmVendas2.First;
      try
        WindowList := DisableTaskWindows(fm_splash.Handle);
        fm_splash.ggProgress.MaxValue := mmVendas2.RecordCount;
        fm_splash.lbStatus.Caption := 'Atualizando os Itens do Pedido...';
        fm_splash.ggProgress.Progress := 0;
        fm_splash.Show;

        carregando_item := true;
        Pc_vendas.TabIndex := 0;
        pnWait.Visible := true;

        mmVendas2.First;
        fm_splash.ggProgress.Progress := 0;

        while not mmVendas2.Eof do
        begin
          checar_qtd := false;
          mmVendas2.Edit;

          if mform = 'vendas_industria' then
          begin
            dados_produto(mmVendas2COD_PRODUTO.AsString);
            btgraClick(Self);
          end;

          if mmVendas2CESTA_BASICA.Value then
            cesta_basica := 'S'
          else
            cesta_basica := 'N';

          if mmVendas2COD_SUPERVISOR.AsString = '' then
            supervisor := ', null'
          else
            supervisor := ', ' + QuotedStr(mmVendas2COD_SUPERVISOR.AsString);

          if mmVendas2VLR_COMISSAO.AsString = '' then
            vlr_comissao := ', null'
          else
            vlr_comissao := ', ' + FMFUN.BuscaTroca(mmVendas2VLR_COMISSAO.AsString, ',', '.');

          if mmVendas2DESCONTO_VALOR.AsString = '' then
            desconto_valor := ', null'
          else
            desconto_valor := ', ' + FMFUN.BuscaTroca(mmVendas2DESCONTO_VALOR.AsString, ',', '.');

          if mmVendas2PERC_COMISSAO.AsString = '' then
            perc_comissao := ', null'
          else
            perc_comissao := ', ' + FMFUN.BuscaTroca(mmVendas2PERC_COMISSAO.AsString, ',', '.');

          if mmVendas2PRECO_BASE.AsString = '' then
            preco_cs := ', null'
          else
            preco_cs := ', ' + FMFUN.BuscaTroca(mmVendas2PRECO_BASE.AsString, ',', '.');

          if mmVendas2TRIB_ICMS.AsString = '' then
            trib_icms := ', null'
          else
            trib_icms := ', ' + FMFUN.BuscaTroca(mmVendas2TRIB_ICMS.AsString, ',', '.');

          if mmVendas2DESCONTO_VALOR_GERAL.AsString = '' then
            desconto_valor_geral := ', null'
          else
            desconto_valor_geral := ', ' + FMFUN.BuscaTroca(mmVendas2DESCONTO_VALOR_GERAL.AsString, ',', '.');

          sql_vendas2 := 'INSERT INTO VENDAS2 (NUMDOC, COD_PRODUTO, QTD, ' + ' PRECO, PRECO_CUSTO, SUB_TOTAL, DESCONTO, DESCONTO_VALOR, VOLUME, PRECO_BRUTO, PRECO_BASE, PERC_COMISSAO, VLR_COMISSAO, ' + ' COD_FISCAL_ITEM, ICMS_ITEM, VLR_ICMS_ST, VLR_BC_ST, VLR_ICMS_ITEM, NCM, VLR_BC, IPI_ITEM, VLR_IPI_ITEM, ' + ' VLR_AGR_ITEM, TRIB_ICMS, CESTA_BASICA, COD_SUPERVISOR, PROMOCAO, DESCONTO_MAX, NAO_VALIDAR_MARGEM, CEST, DESCONTO_VALOR_GERAL) ' + ' VALUES (' + Prnumdoc.Text + ', ' + mmVendas2COD_PRODUTO.AsString
            + ', ' + FMFUN.BuscaTroca(mmVendas2QTD.AsString, ',', '.') + ', ' + FMFUN.BuscaTroca(mmVendas2PRECO_LIQUIDO.AsString, ',', '.') + ', ' + FMFUN.BuscaTroca(mmVendas2PRECO_CUSTO.AsString, ',', '.') + ', ' + FMFUN.BuscaTroca(mmVendas2SUB_TOTAL.AsString, ',', '.') + ', ' + FMFUN.BuscaTroca(mmVendas2DESCONTO.AsString, ',', '.') + desconto_valor + ', ' + FMFUN.BuscaTroca(mmVendas2VOLUME.AsString, ',', '.') + ', ' + FMFUN.BuscaTroca(mmVendas2PRECO_VENDA.AsString, ',', '.') + preco_cs + perc_comissao +
            vlr_comissao + ', ' + QuotedStr(mmVendas2COD_FISCAL_ITEM.AsString) + ', ' + FMFUN.BuscaTroca(mmVendas2ICMS_ITEM.AsString, ',', '.') + ', ' + FMFUN.BuscaTroca(mmVendas2VLR_ICMS_ST.AsString, ',', '.') + ', ' + FMFUN.BuscaTroca(mmVendas2VLR_BC_ST.AsString, ',', '.') + ', ' + FMFUN.BuscaTroca(mmVendas2VLR_ICMS_ITEM.AsString, ',', '.') + ', ' + QuotedStr(mmVendas2NCM.AsString) + ', ' + FMFUN.BuscaTroca(mmVendas2VLR_BC.AsString, ',', '.') + ', ' + FMFUN.BuscaTroca(mmVendas2IPI_ITEM.AsString, ',', '.') + ', ' + FMFUN.BuscaTroca
            (mmVendas2VLR_IPI_ITEM.AsString, ',', '.') + ', ' + FMFUN.BuscaTroca(mmVendas2VLR_AGR_ITEM.AsString, ',', '.') + trib_icms + ', ' + QuotedStr(cesta_basica) + supervisor + ', ' + QuotedStr(mmVendas2PROMOCAO.AsString) + ', ' + FMFUN.BuscaTroca(mmVendas2DESCONTO_MAXIMO.AsString, ',', '.') + ', ' + QuotedStr(mmVendas2NAO_VALIDAR_MARGEM.AsString) + ', ' + QuotedStr(mmVendas2CEST.AsString) + desconto_valor_geral + ')';
          dao.Execsql(sql_vendas2);

          // id_item := dao.insert('Me', 'vendas2', 'id', Fr_vendas_industria2, 'gen_venda2');
          fm_splash.ggProgress.AddProgress(1);
          fm_splash.refresh;
          mmVendas2.next;
        end;
        dao.cn.Commit;
      except
        dao.cn.Rollback;
      end;
      mmVendas2.EnableControls;
      mmVendas2.First;
      carregando_item := false;
      EnableTaskWindows(WindowList);
      fm_splash.Hide;
      pnWait.Visible := false;
    end;

    somaTotal;

    BtnEmailPedido.Enabled := true;

    HabilitaBotoesPedido(1);


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

    if (Prcod_fiscal.Text = '5405') or (Prcod_fiscal.Text = '6403') then
      if not ((FRPRI.TipUsu = '0') or (FRPRI.TipUsu = '1') or representacao) then
        ChecaCFOP;

    try
      if not (dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      if not modo_insert then
        dao.update('vendas1', 'numdoc', Prnumdoc.Text, 'Pr', Fr_vendas_industria2);

      { marca o status do pedido como não faturado }
      if (FRPRI.TipUsu = '0') then
        dao.Execsql('update vendas1 set faturado=' + QuotedStr('0') + ', pedido_vendedor =' + QuotedStr('1') + ' where numdoc = ' + QuotedStr(Prnumdoc.Text))
      else
        dao.Execsql('update vendas1 set faturado=' + QuotedStr('0') + ' where numdoc = ' + QuotedStr(Prnumdoc.Text));

      // Grava a Comissão no Vendas1
      dao.Execsql('update vendas1 set vlr_comissao =' + FMFUN.prepara_valor(edTotComissao.Text) + ', perc_comissao = ' + FMFUN.prepara_valor(edPercComissao.Text) + ' where numdoc =' + QuotedStr(Prnumdoc.Text));

      { Grava os valores de icms e ST }

      dao.Geral2('select sum(case when vlr_bc is null then 0 else vlr_bc end) as vlr_bc, ' + 'sum(case when vlr_icms_item is null then 0 else vlr_icms_item end) as vlricm, ' + 'sum(case when VLR_BC_ST is null then 0 else vlr_bc_st end) as vlr_bc_st, ' + 'sum(case when VLR_ICMS_ST is null then 0 else vlr_icms_st end) as VLR_ICMS_ST ' + 'from vendas2 where numdoc= ' + QuotedStr(Prnumdoc.Text));

      if not dao.q2.fieldbyname('vlr_bc').IsNull then
        vlr_bc := QuotedStr(FMFUN.prepara_valor(dao.q2.fieldbyname('vlr_bc').AsString))
      else
        vlr_bc := '0';

      if not dao.q2.fieldbyname('vlricm').IsNull then
        vlricm := QuotedStr(FMFUN.prepara_valor(dao.q2.fieldbyname('vlricm').AsString))
      else
        vlricm := '0';

      if not dao.q2.fieldbyname('vlr_bc_st').IsNull then
        vlr_bc_st := QuotedStr(FMFUN.prepara_valor(dao.q2.fieldbyname('vlr_bc_st').AsString))
      else
        vlr_bc_st := '0';

      if not dao.q2.fieldbyname('VLR_ICMS_ST').IsNull then
        VLR_ICMS_ST := QuotedStr(FMFUN.prepara_valor(dao.q2.fieldbyname('VLR_ICMS_ST').AsString))
      else
        VLR_ICMS_ST := '0';

      dao.Execsql('update vendas1 set vlr_bc_icms=' + vlr_bc + ' ,vlr_icms=' + vlricm + ' ,VLR_BC_ICMS_ST=' + vlr_bc_st + ' ,VLR_ST=' + VLR_ICMS_ST + ' where numdoc=' + QuotedStr(Prnumdoc.Text));

      if Prvolume_nota.Value = 0 then
        dao.Execsql('update vendas1 set volume_nota = 0 where numdoc=' + QuotedStr(Prnumdoc.Text));

      dao.cn.Commit;
    except
      dao.cn.Rollback;
    end;

    readonly_true('Pr');
    readonly_true('Me');

    sbvendas.Panels.Items[0].Text := '';
    sbvendas.Panels.Items[1].Text := 'PEDIDO NÃO FATURADO';
    // sbvendas.Panels.Items[2].Text := 'CLIENTE COM PENDENCIA';

    ControleBoleto;

    ListarItensPedidos;

    BtnNFE.Enabled := true;
    TaAgrupar.TabVisible := agrupar_pedidos and (tipo_usuario <> '0');
    Prcod_clienteExit(Self);
    LiberaItemRepetido := false;
    BtnEnviarPedido.Enabled := BtnEnviarPedido.Visible and (Prnumdoc.Text <> '');

    AtivaJanela;
    try
      if not (dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      dao.Execsql('update vendas1 set ATUALIZAR_ESTOQUE = ''0'', cod_usuario = ' + cod_usuario + ' where numdoc = ' + QuotedStr(Prnumdoc.Text));

      if mform <> 'vendas_devolucoes' then
      begin
        dao.Execsql('DELETE FROM CLIENTE_VISITAS WHERE COD_CLIENTE = ' + Prcod_cliente.Text + ' AND DATA = ' + QuotedStr(FormatDateTime('DD.MM.YYYY', Prdtadoc.Date)));

        if FRPRI.modulo_vendedor then
          enviado := 'N'
        else
          enviado := 'S';

        dao.Execsql('INSERT INTO CLIENTE_VISITAS (COD_CLIENTE, DATA, VENDEU, VALOR_PEDIDO, ENVIADO) ' + 'SELECT V1.COD_CLIENTE, V1.DTADOC, ''S'' as vendeu, SUM(V1.TOT_LIQUIDO) AS TOT_LIQUIDO, ' + QuotedStr(enviado) + ' AS ENVIADO ' + 'FROM VENDAS1 V1 ' + 'WHERE V1.COD_CLIENTE = ' + Prcod_cliente.Text + ' AND V1.DTADOC = ' + QuotedStr(FormatDateTime('DD.MM.YYYY', Prdtadoc.Date)) + 'GROUP BY COD_CLIENTE, DTADOC, VENDEU, ENVIADO; ');
      end;
      dao.cn.Commit;
    except
      dao.cn.Rollback;
    end;

  except
    on e: Exception do
    begin
      if dao.cn.InTransaction then
        dao.cn.Rollback;
      acao := '';
      dao.msg('Houve um erro Ao Gravar o Pedido!' + #13 + e.Message);
      dao.envia_email_suporte(e.Message + #13 + 'Data: ' + dao.DtaSerStr + #13 + 'Usuario Logado:' + nom_usuario, 'Erro ao Gravar Pedido', 'claudioplasfan@gmail.com', '', '', '');
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
      dao.msg('Houve um erro ao gravar Alterações no grid do Contas a Receber!' + #13 + e.Message);
      dao.envia_email_suporte(e.Message + #13 + 'Data: ' + dao.DtaSerStr + #13 + 'Usuario Logado:' + nom_usuario, 'Erro ao gravar os dados no grid do cr1 form vendas_industria', 'informatica@plasfan.ind.br', '', '', '');
    end;
  end;
end;

procedure TFr_vendas_industria2.btHistoricoClick(Sender: TObject);
begin
  if PrProcesso_id.Text = '' then
    Exit;

  Application.CreateForm(Tfrm_historico_processo_pedido, frm_historico_processo_pedido);
  frm_historico_processo_pedido.processo := PrProcesso_id.Text;
  frm_historico_processo_pedido.ShowModal;
end;

function TFr_vendas_industria2.ChecarValorMinimoPedido: boolean;
begin
  Result := true;
  if valor_minimo_pedido > Prtot_liquido.Value then
  begin
    MessageDlg('Valor Mínimo para o Pedido para o Prazo ' + Lbprazo_pgto.Caption + ': ' + formatfloat('R$ #,###,##0.00', valor_minimo_pedido) + '.', mtError, [mbOK], 0);
    Result := false;
  end;
end;

procedure TFr_vendas_industria2.ChecarDuplicidadePedido;
begin
  { dao.Geral1('SELECT a.NUMDOC, A.COD_CLIENTE, A.TOT_LIQUIDO FROM VENDAS1 a '+
    'WHERE A.TOT_LIQUIDO = '++' and a.COD_CLIENTE = '+Prcod_cliente.Text+' and a.numdoc not in ('+Prnumdoc.Text+')'); }
end;

procedure TFr_vendas_industria2.ControleBoleto;
begin
  if Lbnom_fop.Caption = 'BOLETO' then
  begin
    PrCONTA_BOLETO.Enabled := true;
    BtnBoleto.Enabled := true;
    BtnEmailBoleto.Enabled := true;
  end
  else
  begin
    PrCONTA_BOLETO.Clear;
    PrCONTA_BOLETO.Enabled := false;
    lbCCBoleto.Caption := '';
    BtnBoleto.Enabled := false;
    BtnEmailBoleto.Enabled := false;
  end;
end;

procedure TFr_vendas_industria2.AtivaJanela;
begin
  Application.Restore;
  BringToFront;
end;


procedure TFr_vendas_industria2.AtualizaCalculoIcmsItem(sub_total, icms_item: double; id, ncm, cst: string);
// ICMS ST = (Al x BC ST) – ICMS operação própria
var
  vlr_bc, vlr_bc_st, VLR_ICMS_ST, vlr_icms_item: double;

  procedure AtualizaIcmsItem;
  begin
    vlr_icms_item := SimpleRoundTo((vlr_bc * (icms_item / 100)), -2);
  end;

begin
  if MeCesta_Basica.Text = 'S' then
    Aliquota_ICMS_Interno := 12
  else
    Aliquota_ICMS_Interno := 17;

  vlr_bc := sub_total;
  AtualizaIcmsItem;

  if (cst = '60') or (cst = '10') then
  begin
    // Buscar a Base de Cáculo ST
    vlr_bc_st := roundto((vlr_bc * (1 + (MVA / 100))), -2);
    VLR_ICMS_ST := roundto(((vlr_bc_st * (Aliquota_ICMS_Interno / 100)) - vlr_icms_item), -2);
    if UF_Emissor <> 'RS' then
      vlr_bc := 0;

    AtualizaIcmsItem;
  end
  else
  begin
    vlr_bc_st := 0;
    VLR_ICMS_ST := 0;
  end;

  if cliente_isento_icms and (cliente_consumidor_final and (UF_Cliente <> 'RS')) then
  begin
    vlr_bc_st := 0;
    VLR_ICMS_ST := 0;
    vlr_bc := 0;
    AtualizaIcmsItem;
  end;

  dao.Execsql('update vendas2 set ncm=' + QuotedStr(ncm) + ', trib_icms = ' + QuotedStr(cst) + ', icms_item = ' + QuotedStr(StringReplace(formatfloat('#0.00', icms_item), ',', '.', [rfReplaceAll])) + ', vlr_bc = ' + QuotedStr(StringReplace(formatfloat('#0.00', vlr_bc), ',', '.', [rfReplaceAll])) + ', vlr_bc_st = ' + QuotedStr(StringReplace(formatfloat('#0.00', vlr_bc_st), ',', '.', [rfReplaceAll])) + ', vlr_icms_st = ' + QuotedStr(StringReplace(formatfloat('#0.00', VLR_ICMS_ST), ',', '.', [rfReplaceAll])) + ', VLR_ICMS_ITEM = ' + QuotedStr(StringReplace(formatfloat('#0.00', vlr_icms_item), ',', '.', [rfReplaceAll])) + '  where id = ' + id);
end;


procedure TFr_vendas_industria2.btnAlterarCRClick(Sender: TObject);
begin
  q_cr1.Edit;
end;

procedure TFr_vendas_industria2.BloquearPedido(pedido: string);
begin
  if pedido = '' then
    Exit;
  try
    dao.cn.StartTransaction;
    dao.Execsql('UPDATE VENDAS1 SET ABERTO_USUARIO = ''N'', MAQUINA_USUARIO_ABERTO = ' + QuotedStr(nom_usuario + '-' + FMFUN.COMPUTADOR) + ' WHERE NUMDOC = ' + pedido);
    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;
end;

procedure TFr_vendas_industria2.LiberarPedido(pedido: string);
begin
  if pedido = '' then
    Exit;
  try
    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
    dao.Execsql('UPDATE VENDAS1 SET ABERTO_USUARIO = ''S'', MAQUINA_USUARIO_ABERTO = NULL WHERE NUMDOC = ' + pedido);
    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;
end;

function TFr_vendas_industria2.VerificaEstoqueParaFaturar(cod_produto: string): boolean;
begin
  if mmVendas2QTD.Value > zzreal.Value then
    Result := true
  else
    Result := false;
end;

procedure TFr_vendas_industria2.MontaPedido(n_pedido: string);
var
  lh, cl, MTAMTOT, i, x, y: integer;
  mcr1, usuario, observacao: string;
  total_produtos, total_liquido: real;
  MLHCH: array of string;
  Zebrado : Boolean;

  procedure SetaPagina;
  begin
  {  if (FRPRI.RD.Impressora <> Grafico) and (lh > 28) then
    begin
      FRPRI.RD.novapagina;
      lh := 0;
    end;
}
    if (lh > 71) then
    begin
      FRPRI.RD.novapagina;
      lh := 0;
    end;
  end;

begin
  if Btgraped.Enabled then
    BtgrapedClick(Self);

  dao.Geral1('select a.NUMDOC, a.HORA, a.DTADOC, a.COD_CLIENTE, a.COD_USUARIO, ' +
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
             'COALESCE(A.NUMDOC_DESTINO, (SELECT B.NUMDOC FROM VENDAS1 b where b.NUMDOC_DESTINO = a.NUMDOC)) as PEDIDO_VINCULADO, ' +
             'a.SINCRONIZAR_PALM, a.NUMDOC_REF, a.FRETE_COMBINADO, a.DT_FRETE_COMBINADO, a.EMAIL_NFE, ' +
             'a.EMAIL_PEDIDO, a.PEDIDO_VENDEDOR, a.USUARIO_CHECOU_PEDIDO_VENDEDOR, a.CONTA_BOLETO, ' +
             'a.USUARIO_CHECOU_FRETE_COMBINADO, a.ABERTO_USUARIO, a.MAQUINA_USUARIO_ABERTO, VALORDESCONTOADIC, ' +
             'c.nom_cliente, c.nom_fantasia, c.cnpj, (select min(dtadoc) from vendas1 v1 where v1.COD_CLIENTE = c.COD_CLIENTE) as dta_cad, c.bairro, c.endereco, c.nr_endereco, ' +
             'c.cep, c.TIP_PESSOA, c.cpf, c.cnpj,c.rg, c.ie, c.telefone, c.fax, c.email, c.contato, C.CELULAR AS CELULAR_CLIENTE, c.operadora as operadora_cliente, ' +
             'r.nom_representante, s.nom_representante as supervisor, r.celular, r.operadora as operadora_rep, f.nom_fop, p.prazo, e.nom_empresa, a.ORCAMENTO, ' +
             't.nome, cd.nom_cidade, cd.uf, us.logusu, a.DESCONTO_GERAL, a.VLR_DESCONTO_GERAL, c.WHASTAPP from vendas1 a ' +
             'left join cliente c on c.cod_cliente = a.cod_cliente ' +
             'left join cidades cd on cd.cod_cidade= c.cod_cidade ' +
             'left join representante r on r.id = a.cod_representante ' +
             'left join representante s on s.id = a.cod_supervisor ' +
             'left join fop f on f.cod_fop = a.cod_fop ' +
             'left join prazo p on p.id = a.cod_prazo_pgto ' +
             'left join empresa e on e.cod_empresa = a.empresa_faturar ' +
             'left join transportadora t on t.cod_transportadora = a.cod_transportadora ' +
             'left join tbusu us on cast(us.codusu as INTEGER) = a.cod_usuario ' +
             'where numdoc=' + n_pedido);

  FRPRI.RD.TamanhoQteColunas := 96;
  FRPRI.RD.TamanhoQteLinhas := 71;
  FRPRI.RD.TamanhoQteLPP := seis;
  FRPRI.RD.FonteTamanhoPadrao := S12cpp;

  FRPRI.RD.abrir; // Inicia a montagem do relatório...
  // for i:=1 to 2 do
  // begin
  lh := 13;
  // while not (dao.q1.eof) do
  // begin
  usuario := dao.q1.fieldbyname('logusu').AsString;

  if dao.q1.fieldbyname('ORCAMENTO').AsString = '1' then
    FRPRI.RD.ImpF(01, 42, 'ORÇAMENTO', [expandido, NEGRITO])
  else
    FRPRI.RD.ImpF(01, 42, 'PEDIDO', [expandido, NEGRITO]);

  FRPRI.RD.impC(02, 09, '-----------------------------------------------------------------------------------------------', [comp12, NEGRITO]);

  FRPRI.RD.impC(03, 02, 'Nº: ', [comp12, NEGRITO]);
  FRPRI.RD.ImpF(03, 08, inttostr(dao.q1.fieldbyname('numdoc').AsInteger), [comp12]); // DADOS DO CLIENTE

  if dao.q1.fieldbyname('dtadoc').Value <> null then
    FRPRI.RD.ImpF(03, 20, FormatDateTime('dd/mm/yyyy', dao.q1.fieldbyname('dtadoc').AsDateTime), [comp12]);

  FRPRI.RD.impC(03, 48, 'CLIENTE DESDE:', [comp12, NEGRITO]);
  if FormatDateTime('dd/mm/yyyy', dao.q1.fieldbyname('dta_cad').AsDateTime) <> '30/12/1899' then
    FRPRI.RD.ImpF(03, 55, FormatDateTime('dd/mm/yyyy', dao.q1.fieldbyname('dta_cad').AsDateTime), [comp12]);

  if FormatDateTime('dd/mm/yyyy', dao.q1.fieldbyname('dta_emissao').AsDateTime) <> '30/12/1899' then
    FRPRI.RD.ImpF(03, 86, FormatDateTime('dd/mm/yyyy', dao.q1.fieldbyname('dta_emissao').AsDateTime), [comp12]);

  FRPRI.RD.impC(05, 02, 'CODIGO:', [comp12, NEGRITO]);
  FRPRI.RD.ImpF(05, 10, dao.q1.fieldbyname('cod_cliente').AsString, [comp12]);

  FRPRI.RD.impC(05, 21, 'CLIENTE:', [comp12, NEGRITO]);
  FRPRI.RD.ImpF(05, 26, dao.q1.fieldbyname('nom_cliente').AsString + ' /' + copy(dao.q1.fieldbyname('nom_fantasia').AsString, 1, 40), [comp12]);

  FRPRI.RD.impC(06, 02, 'END:', [comp12, NEGRITO]);
  FRPRI.RD.ImpF(06, 07, dao.q1.fieldbyname('endereco').AsString + ', ' + dao.q1.fieldbyname('nr_endereco').AsString, [comp12]);

  FRPRI.RD.impC(06, 60, 'BAIRRO:', [comp12, NEGRITO]);
  FRPRI.RD.ImpF(06, 68, dao.q1.fieldbyname('bairro').AsString, [comp12]);

  FRPRI.RD.impC(07, 02, 'CEP:', [comp12, NEGRITO]);
  FRPRI.RD.ImpF(07, 06, dao.q1.fieldbyname('cep').AsString, [comp12]);

  FRPRI.RD.impC(07, 22, 'CIDADE:', [comp12, NEGRITO]);
  FRPRI.RD.ImpF(07, 27, dao.q1.fieldbyname('nom_cidade').AsString, [comp12]);

  FRPRI.RD.impC(07, 59, 'UF:', [comp12, NEGRITO]);
  FRPRI.RD.ImpF(07, 62, dao.q1.fieldbyname('uf').AsString, [comp12]);

  FRPRI.RD.impC(08, 02, 'CNPJ\CPF:', [comp12, NEGRITO]);

  if (dao.q1.fieldbyname('TIP_PESSOA').AsString = 'J') then
    FRPRI.RD.ImpF(08, 11, dao.q1.fieldbyname('cnpj').AsString, [comp12])
  else
    FRPRI.RD.ImpF(08, 11, dao.q1.fieldbyname('cpf').AsString, [comp12]);

  FRPRI.RD.impC(08, 40, 'I.E\RG:', [comp12, NEGRITO]);
  if (dao.q1.fieldbyname('TIP_PESSOA').AsString = 'J') then
    FRPRI.RD.ImpF(08, 45, dao.q1.fieldbyname('ie').AsString, [comp12])
  else
    FRPRI.RD.ImpF(08, 45, dao.q1.fieldbyname('rg').AsString, [comp12]);

  FRPRI.RD.impC(09, 02, 'FONE:', [comp12, NEGRITO]);
  FRPRI.RD.ImpF(09, 06, dao.q1.fieldbyname('telefone').AsString, [comp12]);

  FRPRI.RD.impC(09, 25, 'CELULAR:', [comp12, NEGRITO]);
  FRPRI.RD.ImpF(09, 29, dao.q1.fieldbyname('CELULAR_CLIENTE').AsString + '\' + dao.q1.fieldbyname('operadora_cliente').AsString, [comp12]);

  FRPRI.RD.impC(09, 50, 'WhatsApp:', [comp12, NEGRITO]);
  FRPRI.RD.ImpF(09, 55, dao.q1.fieldbyname('WHASTAPP').AsString, [comp12]);

  FRPRI.RD.impC(09, 75, 'CONTATO:', [comp12, NEGRITO]);
  FRPRI.RD.ImpF(09, 80, dao.q1.fieldbyname('contato').AsString, [comp12]);
  // if DMVEN.QUPED1.FIELDBYNAME('comcli').value<>null then
  // frpri.rd.impf(07,70,DMVEN.QUPED1.FieldByName('comcli').value,[comp12]);

  FRPRI.RD.impC(10, 02, 'E-MAIL:', [comp12, NEGRITO]);
  FRPRI.RD.ImpF(10, 12, dao.q1.fieldbyname('email').AsString, [comp12]);

  FRPRI.RD.impC(11, 02, 'REPRESENTANTE:', [comp12, NEGRITO]);
  FRPRI.RD.ImpF(11, 16, dao.q1.fieldbyname('nom_representante').AsString + '-' + dao.q1.fieldbyname('celular').AsString + '\' + dao.q1.fieldbyname('operadora_rep').AsString, [comp12]);

  FRPRI.RD.impC(11, 65, 'SUPERVISOR:', [comp12, NEGRITO]);
  FRPRI.RD.ImpF(11, 72, dao.q1.fieldbyname('supervisor').AsString, [comp12]);

  FRPRI.RD.impC(12, 09, '----------------------------------------------------------------------------------------------', [comp12, NEGRITO]);

  FRPRI.RD.impC(13, 02, 'COD \ PRODUTO                                             QTD  UNI-QTD  VLR.UNI        TOT.LIQ', [comp12, NEGRITO]);
  // 6                                         40    46        61   66       75       83
  // case when p.id_marca is null then p.nom_produto else p.nom_produto||'' MARCA: ''||m.nom_marca end as nom_produto,
  dao.Geral2('select a.ID, a.NUMDOC, a.DTADOC, a.COD_PRODUTO, a.COD_CLIENTE, a.COD_REPRESENTANTE, a.ID_COR, ' + 'a.ID_TAMANHO, a.QTD, a.QTD_DEVOLVIDA, a.DEVOLVIDO, a.PRECO, a.SUB_TOTAL, a.DESCONTO, a.VOLUME, ' + 'a.COD_EMPRESA, a.NR_PEDIDO_PALM, a.PRECO_BRUTO, a.SUB_TOTAL_BRUTO, a.VLR_COMISSAO, a.TROCA, ' + 'a.COD_FISCAL_ITEM, a.ICMS_ITEM, a.VLR_ICMS_ST, a.VLR_BC_ST, a.VLR_ICMS_ITEM, a.NCM, a.VLR_BC, ' + 'a.IPI_ITEM, a.VLR_IPI_ITEM, a.VLR_AGR_ITEM, a.TRIB_ICMS, a.CESTA_BASICA, a.COD_SUPERVISOR, ' +
    'a.QTD_EMBALAGEM, a.PRECO_CUSTO, a.PERC_COMISSAO, a.PROMOCAO, a.DESCONTO_MAX, ' + 'c.cor, t.tamanho, p.preco_venda, case when cf.MOSTRA_MARCA_NO_PEDIDO = ''S'' then case when p.id_marca is null then p.nom_produto else p.nom_produto||'' MARCA: ''||m.nom_marca end else p.NOM_PRODUTO end as nom_produto, ' + 'p.cod_prateleira,p.unidade, p.qtd_embalagem from CONFIGURACAO cf, vendas2 a ' + 'left join produto p on p.cod_produto = a.cod_produto ' + 'left join marcas m on m.id = p.id_marca ' + 'left join cores c on c.id = a.id_cor ' + 'left join tamanho t on t.id = a.id_tamanho ' + 'where numdoc = ' + QuotedStr(dao.q1.fieldbyname('numdoc').AsString) + ' order by ord_pauta ');

  dao.q2.First;
  total_produtos := 0;
  Zebrado := False;
  while not (dao.q2.Eof) do
  begin

    SetaPagina;

    lh := lh + 1;
    if Zebrado then
    begin
      FRPRI.RD.ImpF(lh, 01, dao.q2.fieldbyname('cod_produto').AsString + '\' + copy(dao.q2.fieldbyname('nom_produto').AsString, 1, 50), [comp12, NEGRITO]);
      FRPRI.RD.impval(lh, 52, '###,##0.00', dao.q2.fieldbyname('qtd').AsFloat, [comp12, NEGRITO]);
      FRPRI.RD.ImpF(lh, 64, dao.q2.fieldbyname('unidade').AsString, [comp12, NEGRITO]);
      FRPRI.RD.ImpF(lh, 67, formatfloat('0', dao.q2.fieldbyname('qtd_embalagem').AsFloat) + '/' + formatfloat('0', dao.q2.fieldbyname('volume').AsFloat), [comp12, NEGRITO]);
      if (dao.q2.fieldbyname('qtd_embalagem').AsFloat <> 0) and (dao.q2.fieldbyname('volume').AsFloat <> 0) then
        FRPRI.RD.ImpF(lh, 67, formatfloat('0', dao.q2.fieldbyname('qtd_embalagem').AsFloat) + '/' + formatfloat('0', dao.q2.fieldbyname('volume').AsFloat), [comp12, NEGRITO]);
      FRPRI.RD.impval(lh, 70, '###,##0.000', dao.q2.fieldbyname('preco').AsFloat, [comp12, NEGRITO]);
      FRPRI.RD.impval(lh, 85, '###,##0.00', dao.q2.fieldbyname('sub_total').AsFloat, [comp12, NEGRITO]);
    end
    else begin
      FRPRI.RD.ImpF(lh, 01, dao.q2.fieldbyname('cod_produto').AsString + '\' + copy(dao.q2.fieldbyname('nom_produto').AsString, 1, 50), [comp12]);
      FRPRI.RD.impval(lh, 52, '###,##0.00', dao.q2.fieldbyname('qtd').AsFloat, [comp12]);
      FRPRI.RD.ImpF(lh, 64, dao.q2.fieldbyname('unidade').AsString, [comp12]);
      FRPRI.RD.ImpF(lh, 67, formatfloat('0', dao.q2.fieldbyname('qtd_embalagem').AsFloat) + '/' + formatfloat('0', dao.q2.fieldbyname('volume').AsFloat), [comp12]);
      if (dao.q2.fieldbyname('qtd_embalagem').AsFloat <> 0) and (dao.q2.fieldbyname('volume').AsFloat <> 0) then
        FRPRI.RD.ImpF(lh, 67, formatfloat('0', dao.q2.fieldbyname('qtd_embalagem').AsFloat) + '/' + formatfloat('0', dao.q2.fieldbyname('volume').AsFloat), [comp12]);
      FRPRI.RD.impval(lh, 70, '###,##0.000', dao.q2.fieldbyname('preco').AsFloat, [comp12]);
      FRPRI.RD.impval(lh, 85, '###,##0.00', dao.q2.fieldbyname('sub_total').AsFloat, [comp12]);
    end;
    total_produtos := total_produtos + dao.q2.fieldbyname('sub_total').AsFloat;
    Zebrado := not Zebrado;

    dao.q2.next;

  end;

  SetaPagina;

  lh := lh + 1;
  FRPRI.RD.impC(lh, 01, '----------------------------------------------------------------------------------------------', [comp12, NEGRITO]);

  SetaPagina;

  lh := lh + 1;
  dao.q1.Open;
  case modelo_desconto of
    1:
      begin
        FRPRI.RD.impC(lh, 02, 'FOR.PAGAMEN.:', [comp12, NEGRITO]);
        FRPRI.RD.ImpF(lh, 15, dao.q1.fieldbyname('nom_fop').AsString + ' ' + dao.q1.fieldbyname('prazo').AsString, [comp12]);

        FRPRI.RD.impC(lh, 76, 'TOT.PRODUTOS:', [comp12, NEGRITO]);
        FRPRI.RD.impval(lh, 85, '###,##0.00', dao.q1.fieldbyname('tot_liquido').AsFloat, [comp12]);

        SetaPagina;
        lh := lh + 1;

        total_liquido := dao.q1.fieldbyname('tot_liquido').AsFloat - dao.q1.fieldbyname('VLR_DESCONTO_GERAL').AsFloat;

        FRPRI.RD.impC(lh, 02, 'PESO:', [comp12, NEGRITO]);
        FRPRI.RD.impval(lh, 6, '0.000', dao.q1.fieldbyname('peso_nota').AsFloat, [comp12]);

        FRPRI.RD.impC(lh, 35, 'VOLUMES:', [comp12, NEGRITO]);
        FRPRI.RD.impval(lh, 38, '##0.00', dao.q1.fieldbyname('volume_nota').AsFloat, [comp12]);

        FRPRI.RD.impC(lh, 78, 'DESCONTO:', [comp12, NEGRITO]);
        FRPRI.RD.impval(lh, 89, '##0.00', dao.q1.fieldbyname('VLR_DESCONTO_GERAL').AsFloat, [comp12]);
        SetaPagina;
        lh := lh + 1;

        FRPRI.RD.impC(lh, 77, 'TOT.LIQUIDO:', [comp12, NEGRITO]);
        FRPRI.RD.impval(lh, 85, '###,##0.00', total_liquido, [comp12]);
      end;
    2:
      begin
        FRPRI.RD.impC(lh, 02, 'TOT.PRODUTOS:', [comp12, NEGRITO]);
        FRPRI.RD.impval(lh, 15, '###,##0.00', total_produtos, [comp12]);

        FRPRI.RD.impC(lh, 36, 'DESCONTO:', [comp12, NEGRITO]);
        FRPRI.RD.impval(lh, 42, '##0.00', dao.q1.fieldbyname('VALORDESCONTOADIC').AsFloat, [comp12]);

        FRPRI.RD.impC(lh, 77, 'TOT.LIQUIDO:', [comp12, NEGRITO]);
        FRPRI.RD.impval(lh, 85, '###,##0.00', dao.q1.fieldbyname('tot_liquido').AsFloat, [comp12]);
      end;
  end;
  SetaPagina;

  lh := lh + 1;

  FRPRI.RD.impC(lh, 02, 'OBSERV:', [comp12, NEGRITO]);

  MTAMTOT := length(dao.q1.fieldbyname('observacoes_pedido').AsString);

  SetLength(MLHCH, ((MTAMTOT div 80) + 1));

  i := 1;
  observacao := StringReplace(dao.q1.fieldbyname('observacoes_pedido').AsString, #$D#$A, ' ', [rfReplaceAll]);

  if length(MLHCH) > 1 then
  begin
    for x := 0 to length(MLHCH) - 1 do
    begin
      MLHCH[x] := copy(observacao, i, 80);

      if length(trim(MLHCH[x])) < 80 then
        break;

      for y := length(MLHCH[x]) downto 1 do
      begin
        if copy(MLHCH[x], y, 1) = ' ' then
        begin
          MLHCH[x] := Trim(copy(observacao, i, y));
          i := i + y;
          break;
        end;
      end;
    end;

    for x := 0 to length(MLHCH) - 1 do
    begin
      FRPRI.RD.ImpF(lh, 09, MLHCH[x], [comp12]);
      lh := lh + 1;
    end;
  end
  else
  begin
    FRPRI.RD.ImpF(lh, 09, observacao, [comp12]);
    lh := lh + 1;
  end;

  SetaPagina;

  dao.Geral3('select * from cr1 where nr_documento=' + QuotedStr(n_pedido));
  if dao.q3.RecordCount >= 1 then
  begin
    SetaPagina;

    lh := lh + 1;
    FRPRI.RD.ImpF(lh, 02, 'Vencimentos: ', [comp12]);
    dao.q3.First;
    cl := 16;
    mcr1 := FormatDateTime('dd/mm/yyyy', dao.q3.fieldbyname('dtaven').AsDateTime) + ':' + formatfloat('###,##0.00', dao.q3.fieldbyname('valor').AsFloat);
    dao.q3.next;
    while not (dao.q3.Eof) do
    begin
      mcr1 := mcr1 + ' - ' + FormatDateTime('dd/mm/yyyy', dao.q3.fieldbyname('dtaven').AsDateTime) + ' : ' + formatfloat('###,##0.00', dao.q3.fieldbyname('valor').AsFloat);
      dao.q3.next;
    end;
    FRPRI.RD.ImpF(lh, 16, mcr1, [comp12]);
  end;

  SetaPagina;

  lh := lh + 1;
  FRPRI.RD.ImpF(lh, 01, '----------------------------------------------------------------------------------------------', [comp12, NEGRITO]);

  SetaPagina;

  case modelo_desconto of
    1:
      begin

        lh := lh + 1;

        FRPRI.RD.ImpF(lh, 80, usuario, [comp12, NEGRITO]);
      end;

    2:
      begin

        lh := lh + 1;

        FRPRI.RD.ImpF(lh, 02, fantasia + ' - Fone: ' + fone_empresa, [comp12, NEGRITO]);
        FRPRI.RD.ImpF(lh, 80, usuario, [comp12, NEGRITO]);
      end;
  end;

  SetaPagina;

  if dao.q1.fieldbyname('nom_fop').AsString = 'TROCA' then
  begin
    lh := lh + 1;
    FRPRI.RD.impC(lh, 03, '----------------------------------------------------------------------------------------------', [comp12, NEGRITO]);

    SetaPagina;

    lh := lh + 1;
    FRPRI.RD.ImpF(lh, 03, 'A TROCA DO PRODUTO SOMENTE SERÁ EFETUADA ', [expandido, NEGRITO]);

    if (FRPRI.RD.Impressora <> Grafico) and (lh > 28) then
    begin
      FRPRI.RD.novapagina;
      lh := 0;
    end;
    lh := lh + 1;
    FRPRI.RD.ImpF(lh, 03, 'MEDIANTE A DEVOLUÇÃO DA MERCADORIA COM ', [expandido, NEGRITO]);

    SetaPagina;
    lh := lh + 1;
    FRPRI.RD.ImpF(lh, 03, 'DEFEITO/IRREGULAR.', [expandido, NEGRITO]);

  end;

  if (dao.q1.fieldbyname('PEDIDO_VINCULADO').AsInteger > 0) then
  begin
    lh := lh + 1;
    FRPRI.RD.ImpF(lh, 03, 'VINCULADO PEDIDO Nº.: ' + dao.q1.fieldbyname('PEDIDO_VINCULADO').AsString, [expandido, NEGRITO]);
  end;
  // dao.q1.next;
  // end;

  FRPRI.RD.fechar; // Encerra o relatório...

end;

procedure TFr_vendas_industria2.ImprimePedido;
begin

end;

function TFr_vendas_industria2.ChecarDadosTransportadora: boolean;
begin
  Prcod_transportadoraExit(Self);

  if (Prcod_transportadora.Text = '') then
  begin
    Result := true;
    Exit;
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

  if (Prcod_cliente.Text = '') then
  begin
    Result := true;
    Exit;
  end;

  if not FMFUN.ValidaDadosCliente(Prcod_cliente.Text) then
  begin
    showmessage('Há dados incompletos no cadastro de Clientes!');
    try
      Application.CreateForm(TFr_Cliente, Fr_Cliente);
      Fr_Cliente.dados_incompletos := true;
      Fr_Cliente.cliente := Prcod_cliente.Text;
      Fr_Cliente.ShowModal;
    finally
      Fr_Cliente.Free;
    end;
    Result := false;
  end
  else
    Result := true;
end;


procedure TFr_vendas_industria2.mostra_cr1(numdoc: string);
begin

end;

procedure TFr_vendas_industria2.ativa_cr1(numdoc: string);
begin
  with q_cr1 do
  begin
    close;
    sql.Clear;
    sql.Add('select cr.id, cr.titulo, cr.sequencia, cr.dtaven, cast(coalesce(cr.valor, 0) as numeric(15,2)) as valor, cr.cod_fop, fp.nom_fop, cr.dtarec, ' +
            ' cast(Coalesce(cr.valor_recebido,0) as numeric(15,2)) as valor_recebido, cr.BOLETO_REMESSA_ORDEM, fp.conta_padrao, cr.Instrucao_boleto from cr1 cr ' +
            'left join fop fp on fp.cod_fop=cr.cod_fop ' +
            'where cr.nr_documento =' + QuotedStr(numdoc) + ' order by cr.dtaven ');
    Open;

    q_cr1.fieldbyname('titulo').DisplayLabel := 'Titulo';
    q_cr1.fieldbyname('sequencia').DisplayLabel := 'Seq.';
    q_cr1.fieldbyname('Instrucao_boleto').DisplayLabel := 'Instrução';
    q_cr1.fieldbyname('dtaven').DisplayLabel := 'Vencimento';
    q_cr1.fieldbyname('valor').DisplayLabel := 'Valor';
    q_cr1.fieldbyname('cod_fop').DisplayLabel := 'F.Pagto';
    q_cr1.fieldbyname('nom_fop').DisplayLabel := 'Forma Pagamento';
    q_cr1.fieldbyname('dtarec').DisplayLabel := 'Data Recebimento';
    q_cr1.fieldbyname('valor_recebido').DisplayLabel := 'Valor Recebido';
    q_cr1.fieldbyname('BOLETO_REMESSA_ORDEM').DisplayLabel := 'Remessa Assoc.';
    q_cr1.fieldbyname('conta_padrao').DisplayLabel := 'Conta Padrão';

    if trim(PrCONTA_BOLETO.Text) <> '' then
    begin
      MontaArquivoCobrancaEnvio;
      BtnBoleto.Enabled := true;
      BtnEmailBoleto.Enabled := true;
    end
    else
    begin
      BtnBoleto.Enabled := false;
      BtnEmailBoleto.Enabled := false;
    end;
  end;
end;


procedure TFr_vendas_industria2.Btinsere_chequeClick(Sender: TObject);
begin
  if Crtitulo.Text = '' then
  begin
    dao.msg('Selecione um Titulo para inserir um Cheque!');
    Exit;
  end;
  if Crcod_fop.Text <> '4' then
  begin
    dao.msg('Para inserir um cheque a forma de pagamento deve ser cheque!');
    Exit;
  end;
  Application.CreateForm(TFr_cheque_terceiros, Fr_cheque_terceiros);
  Fr_cheque_terceiros.ShowModal;
end;

procedure TFr_vendas_industria2.BtlocpedClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
  It, j, coluna: byte;
  totalcusto, lucromedio, tot_lucro, aliq_icms: real;
  contador: integer;
  lucro: real;
begin
  if (Prnumdoc.Text <> '') then
    LiberarPedido(Prnumdoc.Text);

  localizar_acionado := true;
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Vendas';
  chamou_pesquisa := 'fr_pedido';
  chamou_form := 'fr_pedido';
  chamou_cadastro := '';
  Fr_localizar.BT_cadastro.Caption := 'Ca&dastro de' + #13 + 'Cliente';
  Fr_localizar.BT_cadastro.Visible := false;

  // preenchendo o combo box com os campos desejados para pesquisar.
  if mform = 'vendas_devolucoes' then
    SetLength(Campos_combo, 11)
  else
    SetLength(Campos_combo, 10);

  Campos_combo[0] := 'Numero';
  Campos_combo[1] := 'NFE';
  Campos_combo[2] := 'Cliente - Código';
  Campos_combo[3] := 'Cliente - Razão S.';
  Campos_combo[4] := 'Cliente - Fantasia';
  Campos_combo[5] := 'CNPJ';
  Campos_combo[6] := 'CPF';
  Campos_combo[7] := 'Cidade';
  Campos_combo[8] := 'Vendedor';
  Campos_combo[9] := 'Televendas';

  if mform = 'vendas_devolucoes' then
    Campos_combo[10] := 'Fornecedor';
  if mform = 'vendas_devolucoes' then
  begin
    for i := 0 to 10 do
    begin
      valor_combo := Campos_combo[i];
      Fr_localizar.CBcampos.Items.Add(Campos_combo[i]);
    end;
  end
  else
  begin
    for i := 0 to 9 do
    begin
      valor_combo := Campos_combo[i];
      Fr_localizar.CBcampos.Items.Add(Campos_combo[i]);
    end;
  end;
  Fr_localizar.CBcampos.ItemIndex := 0;

  if campo_pesquisado <> '' then
  begin
    Fr_localizar.CBcampos.ItemIndex := Fr_localizar.CBcampos.Items.IndexOf(campo_pesquisado);
    Fr_localizar.EDlocalizar.Text := dado_pesquisado;
    Fr_localizar.zzbusca_qualquer.Checked := busca_qualquer_posicao_pesquisada;
    Fr_localizar.loc_vendas(Fr_localizar.EDlocalizar.Text);
  end;
  Fr_localizar.ShowModal;

  if Fr_localizar.modalresult = mrOk then
  begin
    chamou_form := chamou_form_old;
    chamou_pesquisa := chamou_pesquisa_old;

    // if Prcod_cliente.Text <> '' then
    // zzvalor_credito.Text:=  busca_credito(Prcod_cliente.Text);
    // BtnAltFormaPrazo.Visible := false;

    if Prcod_cliente.Text <> '' then
    begin
      dao.Geral1('select cliente_bloqueado from cliente where cod_cliente=' + QuotedStr(Prcod_cliente.Text));
      if dao.q1.fieldbyname('cliente_bloqueado').AsString = 'S' then
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
    StatusPedido;
    Fr_localizar.Free;
    HabilitaBotoesPedido(1);
  end;
end;

procedure TFr_vendas_industria2.MontaArquivoEnvio(nom_arquivo: string);
var
  txt: TextFile;
  Linha: string;
  mqtd_registros: integer;
  telefone: string;
  cod_cliente, nr_doc, pathSaida: string;
begin
  pathSaida := ExtractFilePath(Application.ExeName) + 'Transmicao\';
  AssignFile(txt, pathSaida + nom_arquivo);

  Rewrite(txt);

  // CABEÇALHO
  Write(txt, AjustaStr('01', 2));
  Write(txt, AjustaStr('000', 3));
  Write(txt, AjustaStr('1.00', 3));
  Write(txt, AjustaStr(dao.DtaSerStr, 10));
  Write(txt, AjustaStr(TimeToStr(time), 5));
  mqtd_registros := 1;

  write(txt, AjustaStr('05', 2));
  WriteLn(txt);

  // VENDEDOR
  dao.Geral1('select id, nom_representante, CASE FUNCIONARIO WHEN ''S'' THEN ''F'' ELSE ''O'' END TIPO from representante where nom_representante is not null ');
  dao.q1.First;
  formatsettings.DecimalSeparator := ',';
  while not (dao.q1.Eof) do
  begin
    // 1
    write(txt, AjustaStr('05', 2));

    // 2
    if dao.q1.fieldbyname('id').AsString <> '' then
      Write(txt, AjustaStr(FMFUN.enchezero(dao.q1.fieldbyname('id').AsString, 3), 3))
    else
      Write(txt, AjustaStr(FMFUN.enchezero('0', 3), 3));

    // 3
    if dao.q1.fieldbyname('id').AsString <> '' then
      Write(txt, AjustaStr(FMFUN.enchezero(dao.q1.fieldbyname('id').AsString, 3), 3))
    else
      Write(txt, AjustaStr(FMFUN.enchezero('0', 3), 3));

    // 4
    if dao.q1.fieldbyname('nom_representante').AsString <> '' then
      Write(txt, AjustaStr(FMFUN.AnsiToAscii(dao.q1.fieldbyname('nom_representante').AsString), 50))
    else
      Write(txt, AjustaStr('', 50));

    // 5
    Write(txt, AjustaStr('0000000.00', 10));

    if dao.q1.fieldbyname('TIPO').AsString <> '' then
      Write(txt, AjustaStr(FMFUN.AnsiToAscii(dao.q1.fieldbyname('TIPO').AsString), 1))
    else
      Write(txt, AjustaStr('', 1));

    WriteLn(txt);
    dao.q1.next;
    mqtd_registros := mqtd_registros + 1;
  end;

  // CLIENTES
  dao.Geral1('select id_representante, cod_cliente, nom_cliente, nom_fantasia, tip_pessoa, cnpj, cpf,' + 'ie, rg, endereco, bairro, cep, c.nom_cidade, c.uf, pri_compra, telefone, contato, id_fop,' + 'prazo_maximo, limite, desconto_maximo, email from cliente cl ' + 'left join cidades c on c.cod_cidade=cl.cod_cidade ' + 'where id_representante is not null');

  dao.q1.First;
  formatsettings.DecimalSeparator := ',';
  while not (dao.q1.Eof) do
  begin
    // 1
    write(txt, AjustaStr('10', 2));
    // 2
    if dao.q1.fieldbyname('id_representante').AsString <> '' then
      Write(txt, AjustaStr(FMFUN.enchezero(dao.q1.fieldbyname('id_representante').AsString, 3), 3))
    else
      Write(txt, AjustaStr(FMFUN.enchezero('0', 3), 3));
    // 3
    if dao.q1.fieldbyname('cod_cliente').AsString <> '' then
      Write(txt, AjustaStr(FMFUN.enchevazio(dao.q1.fieldbyname('cod_cliente').AsString, 6), 6))
    else
      Write(txt, AjustaStr(FMFUN.enchevazio('', 6), 6));
    // 4
    if dao.q1.fieldbyname('nom_cliente').AsString <> '' then
      Write(txt, AjustaStr(FMFUN.AnsiToAscii(dao.q1.fieldbyname('nom_cliente').AsString), 50))
    else
      Write(txt, AjustaStr('', 50));
    // 5
    if dao.q1.fieldbyname('nom_fantasia').AsString <> '' then
      Write(txt, AjustaStr(FMFUN.AnsiToAscii(dao.q1.fieldbyname('nom_fantasia').AsString), 50))
    else
      Write(txt, AjustaStr('', 50));
    // 6
    Write(txt, AjustaStr('J', 1)); // tipo de pessoa J F
    // 7
    if dao.q1.fieldbyname('cnpj').AsString <> '  .   .   /    -  ' then
      Write(txt, AjustaStr(dao.q1.fieldbyname('cnpj').AsString, 18))
    else if dao.q1.fieldbyname('cpf').AsString <> '   .   .   -  ' then
      Write(txt, AjustaStr(dao.q1.fieldbyname('cpf').AsString, 18))
    else
      Write(txt, AjustaStr('', 18));

    // 8
    if dao.q1.fieldbyname('rg').AsString <> '' then
      Write(txt, AjustaStr(dao.q1.fieldbyname('rg').AsString, 20))
    else if dao.q1.fieldbyname('ie').AsString <> '' then
      Write(txt, AjustaStr(dao.q1.fieldbyname('ie').AsString, 20))
    else
      Write(txt, AjustaStr('', 20));
    // 9
    if dao.q1.fieldbyname('endereco').AsString <> '' then
      Write(txt, AjustaStr(FMFUN.AnsiToAscii(dao.q1.fieldbyname('endereco').AsString), 50))
    else
      Write(txt, AjustaStr('', 50));
    // 10
    if dao.q1.fieldbyname('bairro').AsString <> '' then
      Write(txt, AjustaStr(dao.q1.fieldbyname('bairro').AsString, 25))
    else
      Write(txt, AjustaStr('', 25));
    // 11
    if dao.q1.fieldbyname('cep').AsString <> '' then
      Write(txt, AjustaStr(dao.q1.fieldbyname('cep').AsString, 10))
    else
      Write(txt, AjustaStr('', 10));
    // 12
    if dao.q1.fieldbyname('nom_cidade').AsString <> '' then
      Write(txt, AjustaStr(FMFUN.AnsiToAscii(dao.q1.fieldbyname('nom_cidade').AsString), 25))
    else
      Write(txt, AjustaStr('', 25));
    // 13
    if dao.q1.fieldbyname('uf').AsString <> '' then
      Write(txt, AjustaStr(dao.q1.fieldbyname('uf').AsString, 2))
    else
      Write(txt, AjustaStr('', 2));

    if dao.q1.fieldbyname('pri_compra').AsString <> '' then
      Write(txt, AjustaStr(FormatDateTime('dd/mm/yyyy', dao.q1.fieldbyname('pri_compra').AsDateTime), 10))
    else
      Write(txt, AjustaStr('', 10));

    // telefone:= copy(dao.Q1.FieldByName('telefone').AsString,1,1);
    // telefone:= telefone + copy(dao.Q1.FieldByName('telefone').AsString,3,12);
    telefone := '(';
    telefone := telefone + dao.q1.fieldbyname('telefone').AsString;
    if dao.q1.fieldbyname('telefone').AsString <> '' then
      Write(txt, AjustaStr(dao.q1.fieldbyname('telefone').AsString, 14))
    else
      Write(txt, AjustaStr('', 14));

    if dao.q1.fieldbyname('contato').AsString <> '' then
      Write(txt, AjustaStr(FMFUN.AnsiToAscii(dao.q1.fieldbyname('contato').AsString), 25))
    else
      Write(txt, AjustaStr('', 25));

    if dao.q1.fieldbyname('id_fop').AsString <> '' then
      Write(txt, AjustaStr(dao.q1.fieldbyname('id_fop').AsString, 3))
    else
      Write(txt, AjustaStr('', 3));

    if dao.q1.fieldbyname('prazo_maximo').AsString <> '' then
      Write(txt, AjustaStr(dao.q1.fieldbyname('prazo_maximo').AsString, 3))
    else
      Write(txt, AjustaStr('', 3));

    { if dao.Q1.FieldByName('limite').AsString <> '' then
      Write(txt, ajustastr(dao.Q1.FieldByName('limite').AsString, 9))
      else
      Write(txt, ajustastr('', 9));
    }
    if dao.q1.fieldbyname('desconto_maximo').AsString <> '' then
      Write(txt, AjustaStr(formatfloat('0.00', dao.q1.fieldbyname('desconto_maximo').AsFloat), 6))
    else
      Write(txt, AjustaStr('', 6));

    if dao.q1.fieldbyname('email').AsString <> '' then
      Write(txt, AjustaStr(dao.q1.fieldbyname('email').AsString, 50))
    else
      Write(txt, AjustaStr('', 50));

    WriteLn(txt);
    dao.q1.next;
    mqtd_registros := mqtd_registros + 1;
  end;

  // CLIENTE COMPLEMENTO
  dao.Geral1('select sum(v1.tot_liquido) as tot_liquido, v1.cod_representante, v1.cod_cliente, c.cliente_bloqueado, coalesce(c.limite,0) as limite from vendas1 v1 ' + 'inner join cliente c on c.cod_cliente=v1.cod_cliente ' + 'where v1.cod_representante is not null and v1.FATURADO = 1 ' + 'and v1.DTA_EMISSAO = (select max(v2.dta_emissao) from vendas1 v2 where v1.cod_cliente = v2.COD_CLIENTE and v2.FATURADO = 1) ' + 'group by cod_representante, cod_cliente, cliente_bloqueado, limite ' + 'order by cod_cliente');

  dao.q1.First;
  while not (dao.q1.Eof) do
  begin
    Write(txt, AjustaStr('11', 2));
    if dao.q1.fieldbyname('cod_representante').AsString <> '' then
      Write(txt, AjustaStr(FMFUN.enchezero(dao.q1.fieldbyname('cod_representante').AsString, 3), 3))
    else
      Write(txt, AjustaStr('', 3));

    if dao.q1.fieldbyname('cod_cliente').AsString <> '' then
      Write(txt, AjustaStr(dao.q1.fieldbyname('cod_cliente').AsString, 6))
    else
      Write(txt, AjustaStr('', 6));

    if dao.q1.fieldbyname('limite').AsString <> '' then
      Write(txt, AjustaStr(dao.q1.fieldbyname('limite').AsString, 12))
    else
      Write(txt, AjustaStr('', 12));

    if dao.q1.fieldbyname('tot_liquido').AsString <> '' then
      Write(txt, AjustaStr(dao.q1.fieldbyname('tot_liquido').AsString, 12))
    else
      Write(txt, AjustaStr('', 12));

    if (dao.q1.fieldbyname('limite').AsString <> '') and (dao.q1.fieldbyname('tot_liquido').AsString <> '') then
      Write(txt, AjustaStr(formatfloat('0.00', (dao.q1.fieldbyname('limite').AsFloat - dao.q1.fieldbyname('tot_liquido').AsFloat)), 12))
    else
      Write(txt, AjustaStr('', 12));

    if dao.q1.fieldbyname('cliente_bloqueado').AsString <> '' then
      Write(txt, AjustaStr(dao.q1.fieldbyname('cliente_bloqueado').AsString, 1))
    else
      Write(txt, AjustaStr('', 1));

    WriteLn(txt);
    dao.q1.next;
    mqtd_registros := mqtd_registros + 1;
  end;

  // CLIENTE OBSERVAÇÃO
  dao.Geral1('select distinct v1.cod_representante, c.aviso, v1.cod_cliente, c.cliente_bloqueado from vendas1 v1 ' + 'inner join cliente c on c.cod_cliente=v1.cod_cliente ' + 'where c.aviso is not null and  v1.DTA_EMISSAO = (select max(v2.dta_emissao) from vendas1 v2 where v1.cod_cliente = v2.COD_CLIENTE and v2.FATURADO = 1)  and v1.FATURADO = 1 ' + 'order by cod_representante, cod_cliente  ');

  dao.q1.First;
  while not (dao.q1.Eof) do
  begin
    Write(txt, AjustaStr('12', 2));
    if dao.q1.fieldbyname('cod_representante').AsString <> '' then
      Write(txt, AjustaStr(FMFUN.enchezero(dao.q1.fieldbyname('cod_representante').AsString, 3), 3))
    else
      Write(txt, AjustaStr('', 3));

    if dao.q1.fieldbyname('cod_cliente').AsString <> '' then
      Write(txt, AjustaStr(dao.q1.fieldbyname('cod_cliente').AsString, 6))
    else
      Write(txt, AjustaStr('', 6));

    if dao.q1.fieldbyname('aviso').AsString <> '' then
      Write(txt, AjustaStr(copy(StringReplace(FMFUN.AnsiToAscii(dao.q1.fieldbyname('aviso').AsString), #$D#$A, ' ', [rfReplaceAll]), 1, 200), 200))
    else
      Write(txt, AjustaStr('', 200));

    WriteLn(txt);
    dao.q1.next;
    mqtd_registros := mqtd_registros + 1;
  end;

  // COBRANÇA
  dao.Geral1('SELECT a.ID_REPRESENTANTE, a.TITULO||''-''||a.SEQUENCIA as titulo, a.COD_CLIENTE,  a.DTAVEN, a.VALOR, a.NR_DOCUMENTO, a.HISTORICO1 FROM CR1 a order by id_representante, titulo, sequencia ');

  dao.q1.First;
  while not (dao.q1.Eof) do
  begin
    Write(txt, AjustaStr('15', 2));
    if dao.q1.fieldbyname('ID_REPRESENTANTE').AsString <> '' then
      Write(txt, AjustaStr(FMFUN.enchezero(dao.q1.fieldbyname('ID_REPRESENTANTE').AsString, 3), 3))
    else
      Write(txt, AjustaStr('', 3));

    if dao.q1.fieldbyname('TITULO').AsString <> '' then
      Write(txt, AjustaStr(dao.q1.fieldbyname('TITULO').AsString, 15))
    else
      Write(txt, AjustaStr('', 15));

    if dao.q1.fieldbyname('cod_cliente').AsString <> '' then
      Write(txt, AjustaStr(dao.q1.fieldbyname('cod_cliente').AsString, 6))
    else
      Write(txt, AjustaStr('', 6));

    if dao.q1.fieldbyname('DTAVEN').AsDateTime <> 0 then
      Write(txt, AjustaStr(FormatDateTime('dd/mm/yyyy', dao.q1.fieldbyname('DTAVEN').AsDateTime), 10))
    else
      Write(txt, AjustaStr('', 10));

    if dao.q1.fieldbyname('VALOR').AsString <> '' then
      Write(txt, AjustaStr(formatfloat('0.00', dao.q1.fieldbyname('VALOR').AsFloat), 10))
    else
      Write(txt, AjustaStr('', 10));

    Write(txt, AjustaStr('', 10));

    if dao.q1.fieldbyname('NR_DOCUMENTO').AsString <> '' then
      Write(txt, AjustaStr(dao.q1.fieldbyname('NR_DOCUMENTO').AsString, 15))
    else
      Write(txt, AjustaStr('', 15));

    if dao.q1.fieldbyname('HISTORICO1').AsString <> '' then
      Write(txt, AjustaStr(copy(StringReplace(FMFUN.AnsiToAscii(dao.q1.fieldbyname('HISTORICO1').AsString), #$D#$A, ' ', [rfReplaceAll]), 1, 30), 30))
    else
      Write(txt, AjustaStr('', 30));

    WriteLn(txt);
    dao.q1.next;
    mqtd_registros := mqtd_registros + 1;
  end;

  // ULTIMA COMPRA CLIENTE  18
  dao.Geral1('select v1.dtadoc, v1.numdoc, v1.cod_representante, v1.cod_cliente, v2.cod_produto, v2.qtd, v2.preco, v1.tot_liquido from vendas2 v2 ' + 'inner join vendas1 v1 on v2.numdoc=v1.numdoc where v1.cod_representante is not null and v1.cod_cliente is not null ' + 'order by v2.cod_cliente, v2.dtadoc desc ');
  dao.q1.First;
  cod_cliente := dao.q1.fieldbyname('cod_cliente').AsString;
  nr_doc := dao.q1.fieldbyname('numdoc').AsString;

  while not (dao.q1.Eof) do
  begin
    if (dao.q1.fieldbyname('cod_cliente').AsString <> cod_cliente) and (dao.q1.fieldbyname('numdoc').AsString <> nr_doc) then
    begin
      cod_cliente := dao.q1.fieldbyname('cod_cliente').AsString;
      nr_doc := dao.q1.fieldbyname('numdoc').AsString;
    end;

    if (dao.q1.fieldbyname('cod_cliente').AsString = cod_cliente) and (dao.q1.fieldbyname('numdoc').AsString = nr_doc) then
    begin
      Write(txt, AjustaStr('18', 2));

      if dao.q1.fieldbyname('cod_representante').AsString <> '' then
        Write(txt, AjustaStr(FMFUN.enchezero(dao.q1.fieldbyname('cod_representante').AsString, 3), 3))
      else
        Write(txt, AjustaStr('', 3));

      if dao.q1.fieldbyname('numdoc').AsString <> '' then
        Write(txt, AjustaStr(dao.q1.fieldbyname('numdoc').AsString, 8))
      else
        Write(txt, AjustaStr('', 8));

      if dao.q1.fieldbyname('cod_produto').AsString <> '' then
        Write(txt, AjustaStr(dao.q1.fieldbyname('cod_produto').AsString, 6))
      else
        Write(txt, AjustaStr('', 6));

      if dao.q1.fieldbyname('qtd').AsString <> '' then
        Write(txt, AjustaStr(formatfloat('0.000', dao.q1.fieldbyname('qtd').AsFloat), 10))
      else
        Write(txt, AjustaStr('', 10));

      if dao.q1.fieldbyname('preco').AsString <> '' then
        Write(txt, AjustaStr(formatfloat('0.000', dao.q1.fieldbyname('preco').AsFloat), 10))
      else
        Write(txt, AjustaStr('', 10));

      if dao.q1.fieldbyname('cod_cliente').AsString <> '' then
        Write(txt, AjustaStr(dao.q1.fieldbyname('cod_cliente').AsString, 6))
      else
        Write(txt, AjustaStr('', 6));

      if dao.q1.fieldbyname('dtadoc').AsDateTime <> 0 then
        Write(txt, AjustaStr(FormatDateTime('dd/mm/yyyy', dao.q1.fieldbyname('dtadoc').AsDateTime), 10))
      else
        Write(txt, AjustaStr('', 10));

      WriteLn(txt);
      dao.q1.next;
      mqtd_registros := mqtd_registros + 1;
    end
    else
      dao.q1.next;
  end;

  // 20
  // PRODUTO
  dao.Geral1('select cod_produto, nom_produto ,unidade, qtd_embalagem, p.cod_grupo, cod_produto, preco_venda, custo, PROMOCAO, PERC_MARGEM_MINIMA, ' + ' case when n.codigo in  (''3920.20.19'', ''3917.32.90'') then ''B'' else ''A'' end as tipo,  ' + '     case when cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) < 30 ' + '     then ' + '       1 ' + '     else  ' +
    '       case when (cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) >= 30 and ' + '                  cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) < 35) ' + '       then ' + '         case when n.codigo in  (''3920.20.19'', ''3917.32.90'') then 2 else 2.25 end ' + '       else ' +
    '        case when (cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) >= 35 ' + 'and cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) < 40) ' + '        then ' + '          case when n.codigo in  (''3920.20.19'', ''3917.32.90'') then 2.25 else 2.75 end ' + '        else ' +
    '          case when (cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) >= 40 ' + ' and cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) < 50) ' + '          then ' + '            case when n.codigo in  (''3920.20.19'', ''3917.32.90'') then 2.5 else 3 end ' + '          else ' +
    '            case when (cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) >= 50 ' + ' and cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) < 60) ' + '            then ' + '              case when n.codigo in  (''3920.20.19'', ''3917.32.90'') then 2.75 else 3.25 end ' + '            else ' +
    '              case when (cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) >= 60 ' + ' and cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) < 70) ' + '              then ' + '                case when n.codigo in  (''3920.20.19'', ''3917.32.90'') then 3 else 3.5 end ' + '              else ' +
    '                case when (cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) >= 70 ' + ' and cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) < 80) ' + '                then ' + '                  case when n.codigo in  (''3920.20.19'', ''3917.32.90'') then 3.25 else 3.75 end ' + '                else ' +
    '                  case when (cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) >= 80 ' + ' and cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) < 100) ' + '                  then ' + '                    case when n.codigo in  (''3920.20.19'', ''3917.32.90'') then 3.5 else 4 end ' + '                  else ' +
    '                    case when (cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) >= 100) ' + '                    then ' + '                      case when n.codigo in  (''3920.20.19'', ''3917.32.90'') then 4 else 4.5 end ' + '                    end ' + '                  end ' + '                end ' + '              end   ' + '            end    ' + '          end     ' + '        end        ' + '       end          ' +
    '     end as comissao_funcionario, ' + '     case when cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) < 30 ' + '     then ' + '       1   ' + '     else   ' + '       case when (cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) >= 30 ' +
    ' and cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) < 35) ' + '       then ' + '         case when n.codigo in  (''3920.20.19'', ''3917.32.90'') then 4 else 4.5 end ' + '       else ' + '        case when (cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) >= 35 ' +
    ' and cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) < 40) ' + '        then ' + '          case when n.codigo in  (''3920.20.19'', ''3917.32.90'') then 4.5 else 5 end ' + '        else ' + '          case when (cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) >= 40 ' +
    ' and cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) < 50) ' + '          then ' + '            case when n.codigo in  (''3920.20.19'', ''3917.32.90'') then 5 else 5.5 end ' + '          else ' + '            case when (cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) >= 50 ' +
    ' and cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) < 60) ' + '            then ' + '              case when n.codigo in  (''3920.20.19'', ''3917.32.90'') then 5.25 else 5.75 end ' + '            else ' + '              case when (cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) >= 60 ' +
    ' and cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) < 70) ' + '              then ' + '                case when n.codigo in  (''3920.20.19'', ''3917.32.90'') then 5.5 else 6 end ' + '              else ' + '                case when (cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) >= 70 ' +
    ' and cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) < 80) ' + '                then ' + '                  case when n.codigo in  (''3920.20.19'', ''3917.32.90'') then 5.75 else 6.25 end ' + '                else ' + '                  case when (cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) >= 80 ' +
    ' and cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) < 100) ' + '                  then ' + '                    case when n.codigo in  (''3920.20.19'', ''3917.32.90'') then 6 else 6.5 end ' + '                  else ' + '                    case when (cast(((case when PRECO_venda = 0 then 1 else preco_venda end /case when CUSTO = 0 then 1 else custo end)-1)*100 as numeric(15,2)) >= 100) ' + '                    then ' +
    '                      case when n.codigo in  (''3920.20.19'', ''3917.32.90'') then 6.5 else 7.5 end ' + '                    end ' + '                  end ' + '                end ' + '              end ' + '            end ' + '          end  ' + '        end ' + '       end ' + '     end as comissao_outros, ' + '     p.QTD_MULTIPLA ' + ' from produto p ' + ' inner join grupo g on (p.COD_GRUPO = g.cod_grupo) ' + ' inner join ncm n on (n.codigo = g.NCM or n.codigo = p.NCM) ' + ' where status = ''N''');
  dao.q1.First;
  while not (dao.q1.Eof) do
  begin
    Write(txt, AjustaStr('20', 2));
    Write(txt, AjustaStr('***', 3));
    if dao.q1.fieldbyname('cod_produto').AsString <> '' then
      Write(txt, AjustaStr(FMFUN.enchevazio(dao.q1.fieldbyname('cod_produto').AsString, 10), 10))
    else
      Write(txt, AjustaStr(dao.q1.fieldbyname('cod_produto').AsString, 10));

    if dao.q1.fieldbyname('nom_produto').AsString <> '' then
      Write(txt, AjustaStr(FMFUN.AnsiToAscii(dao.q1.fieldbyname('nom_produto').AsString), 50))
    else
      Write(txt, AjustaStr('', 50));

    Write(txt, AjustaStr('', 25));

    if dao.q1.fieldbyname('unidade').AsString <> '' then
      Write(txt, AjustaStr(dao.q1.fieldbyname('unidade').AsString, 3))
    else
      Write(txt, AjustaStr('', 3));

    if dao.q1.fieldbyname('qtd_embalagem').AsString <> '' then
      Write(txt, AjustaStr(dao.q1.fieldbyname('qtd_embalagem').AsString, 10))
    else
      Write(txt, AjustaStr('', 10));

    if dao.q1.fieldbyname('cod_grupo').AsString <> '' then
      Write(txt, AjustaStr(dao.q1.fieldbyname('cod_grupo').AsString, 3))
    else
      Write(txt, AjustaStr('', 3));

    if dao.q1.fieldbyname('custo').AsString <> '' then
      Write(txt, AjustaStr(formatfloat('0.000', dao.q1.fieldbyname('custo').AsFloat), 10))
    else
      Write(txt, AjustaStr('', 10));

    if dao.q1.fieldbyname('preco_venda').AsString <> '' then
      Write(txt, AjustaStr(formatfloat('0.000', dao.q1.fieldbyname('preco_venda').AsFloat), 10))
    else
      Write(txt, AjustaStr('', 10));

    if dao.q1.fieldbyname('PERC_MARGEM_MINIMA').AsString <> '' then
      Write(txt, AjustaStr(FMFUN.enchevazio(dao.q1.fieldbyname('PERC_MARGEM_MINIMA').AsString, 6), 6))
    else
      Write(txt, AjustaStr('', 6));

    if dao.q1.fieldbyname('PROMOCAO').AsString <> '' then
      Write(txt, AjustaStr(dao.q1.fieldbyname('PROMOCAO').AsString, 1))
    else
      Write(txt, AjustaStr('N', 1));

    if dao.q1.fieldbyname('comissao_funcionario').AsString <> '' then
      Write(txt, AjustaStr(FMFUN.enchevazio(dao.q1.fieldbyname('comissao_funcionario').AsString, 6), 6))
    else
      Write(txt, AjustaStr('', 6));

    if dao.q1.fieldbyname('comissao_outros').AsString <> '' then
      Write(txt, AjustaStr(FMFUN.enchevazio(dao.q1.fieldbyname('comissao_outros').AsString, 6), 6))
    else
      Write(txt, AjustaStr('', 6));

    Write(txt, AjustaStr(dao.q1.fieldbyname('TIPO').AsString, 1));

    if dao.q1.fieldbyname('QTD_MULTIPLA').AsString <> '' then
      Write(txt, AjustaStr(formatfloat('0.000', dao.q1.fieldbyname('QTD_MULTIPLA').AsFloat), 10))
    else
      Write(txt, AjustaStr('', 10));

    // PROMOCAO, PERC_MARGEM_MINIMA

    WriteLn(txt);
    dao.q1.next;
    mqtd_registros := mqtd_registros + 1;
  end;

  // 23
  // PRODUTO ESTOQUE
  dao.Geral1('select cod_produto,qtd_estoque from produto where status = ''N''');
  dao.q1.First;
  while not (dao.q1.Eof) do
  begin
    Write(txt, AjustaStr('23', 2));
    Write(txt, AjustaStr('***', 3));
    if dao.q1.fieldbyname('cod_produto').AsString <> '' then
      Write(txt, AjustaStr(FMFUN.enchevazio(dao.q1.fieldbyname('cod_produto').AsString, 10), 10))
    else
      Write(txt, AjustaStr(dao.q1.fieldbyname('cod_produto').AsString, 10));

    if dao.q1.fieldbyname('qtd_estoque').AsString <> '' then
      Write(txt, AjustaStr(FMFUN.enchevazio(formatfloat('0.000', dao.q1.fieldbyname('qtd_estoque').AsFloat), 10), 10))
    else
      Write(txt, AjustaStr('', 10));

    WriteLn(txt);
    dao.q1.next;
    mqtd_registros := mqtd_registros + 1;
  end;

  // MARGEM X COMISSAO 35
  dao.Geral1('SELECT a.ID, 0 AS MARGEM_INICIO, 29.99 AS MARGEM_FINAL, 1 AS COMISSAO, ''A'' AS TIPO FROM REPRESENTANTE a ' + ' union SELECT a.ID, 30 AS MARGEM_INICIO, 34.99 AS MARGEM_FINAL, CASE WHEN A.FUNCIONARIO = ''S'' THEN 2.25 ELSE 4.5 END AS COMISSAO, ''A'' AS TIPO FROM REPRESENTANTE a ' + ' union SELECT a.ID, 35 AS MARGEM_INICIO, 39.99 AS MARGEM_FINAL, CASE WHEN A.FUNCIONARIO = ''S'' THEN 2.75 ELSE 5 END AS COMISSAO, ''A'' AS TIPO FROM REPRESENTANTE a ' +
    ' union SELECT a.ID, 40 AS MARGEM_INICIO, 49.99 AS MARGEM_FINAL, CASE WHEN A.FUNCIONARIO = ''S'' THEN 3 ELSE 5.5 END AS COMISSAO, ''A'' AS TIPO FROM REPRESENTANTE a ' + ' union SELECT a.ID, 50 AS MARGEM_INICIO, 59.99 AS MARGEM_FINAL, CASE WHEN A.FUNCIONARIO = ''S'' THEN 3.25 ELSE 5.75 END AS COMISSAO, ''A'' AS TIPO FROM REPRESENTANTE a ' + ' union SELECT a.ID, 60 AS MARGEM_INICIO, 69.99 AS MARGEM_FINAL, CASE WHEN A.FUNCIONARIO = ''S'' THEN 3.5 ELSE 6 END AS COMISSAO, ''A'' AS TIPO FROM REPRESENTANTE a '
    + ' union SELECT a.ID, 70 AS MARGEM_INICIO, 79.99 AS MARGEM_FINAL, CASE WHEN A.FUNCIONARIO = ''S'' THEN 3.75 ELSE 6.25 END AS COMISSAO, ''A'' AS TIPO FROM REPRESENTANTE a ' + ' union SELECT a.ID, 80 AS MARGEM_INICIO, 99.99 AS MARGEM_FINAL, CASE WHEN A.FUNCIONARIO = ''S'' THEN 4 ELSE 6.5 END AS COMISSAO, ''A'' AS TIPO FROM REPRESENTANTE a ' +
    ' union SELECT a.ID, 100 AS MARGEM_INICIO, 999.99 AS MARGEM_FINAL, CASE WHEN A.FUNCIONARIO = ''S'' THEN 4.5 ELSE 7.5 END AS COMISSAO, ''A'' AS TIPO FROM REPRESENTANTE a ' + ' UNION SELECT a.ID, 0 AS MARGEM_INICIO, 29.99 AS MARGEM_FINAL, 1 AS COMISSAO, ''B'' AS TIPO FROM REPRESENTANTE a ' + ' union SELECT a.ID, 30 AS MARGEM_INICIO, 34.99 AS MARGEM_FINAL, CASE WHEN A.FUNCIONARIO = ''S'' THEN 2 ELSE 4 END AS COMISSAO, ''B'' AS TIPO FROM REPRESENTANTE a ' +
    ' union SELECT a.ID, 35 AS MARGEM_INICIO, 39.99 AS MARGEM_FINAL, CASE WHEN A.FUNCIONARIO = ''S'' THEN 2.25 ELSE 4.5 END AS COMISSAO, ''B'' AS TIPO FROM REPRESENTANTE a ' + ' union SELECT a.ID, 40 AS MARGEM_INICIO, 49.99 AS MARGEM_FINAL, CASE WHEN A.FUNCIONARIO = ''S'' THEN 2.5 ELSE 5 END AS COMISSAO, ''B'' AS TIPO FROM REPRESENTANTE a ' +
    ' union SELECT a.ID, 50 AS MARGEM_INICIO, 59.99 AS MARGEM_FINAL, CASE WHEN A.FUNCIONARIO = ''S'' THEN 2.75 ELSE 5.25 END AS COMISSAO, ''B'' AS TIPO FROM REPRESENTANTE a ' + ' union SELECT a.ID, 60 AS MARGEM_INICIO, 69.99 AS MARGEM_FINAL, CASE WHEN A.FUNCIONARIO = ''S'' THEN 3 ELSE 5.5 END AS COMISSAO, ''B'' AS TIPO FROM REPRESENTANTE a ' + ' union SELECT a.ID, 70 AS MARGEM_INICIO, 79.99 AS MARGEM_FINAL, CASE WHEN A.FUNCIONARIO = ''S'' THEN 3.25 ELSE 5.75 END AS COMISSAO, ''B'' AS TIPO FROM REPRESENTANTE a '
    + ' union SELECT a.ID, 80 AS MARGEM_INICIO, 99.99 AS MARGEM_FINAL, CASE WHEN A.FUNCIONARIO = ''S'' THEN 3.5 ELSE 6 END AS COMISSAO, ''B'' AS TIPO FROM REPRESENTANTE a ' + ' union SELECT a.ID, 100 AS MARGEM_INICIO, 999.99 AS MARGEM_FINAL, CASE WHEN A.FUNCIONARIO = ''S'' THEN 4 ELSE 6.5 END AS COMISSAO, ''B'' AS TIPO FROM REPRESENTANTE a  ');
  dao.q1.First;
  while not (dao.q1.Eof) do
  begin
    Write(txt, AjustaStr('35', 2));

    if dao.q1.fieldbyname('ID').AsString <> '' then
      Write(txt, AjustaStr(FMFUN.enchezero(dao.q1.fieldbyname('ID').AsString, 3), 3))
    else
      Write(txt, AjustaStr('', 3));

    if dao.q1.fieldbyname('MARGEM_INICIO').AsString <> '' then
      Write(txt, AjustaStr(FMFUN.enchevazio(formatfloat('0.000', dao.q1.fieldbyname('MARGEM_INICIO').AsFloat), 6), 6))
    else
      Write(txt, AjustaStr('', 6));

    if dao.q1.fieldbyname('MARGEM_FINAL').AsString <> '' then
      Write(txt, AjustaStr(FMFUN.enchevazio(formatfloat('0.000', dao.q1.fieldbyname('MARGEM_FINAL').AsFloat), 6), 6))
    else
      Write(txt, AjustaStr('', 6));

    if dao.q1.fieldbyname('COMISSAO').AsString <> '' then
      Write(txt, AjustaStr(FMFUN.enchevazio(formatfloat('0.000', dao.q1.fieldbyname('COMISSAO').AsFloat), 6), 6))
    else
      Write(txt, AjustaStr('', 6));

    if dao.q1.fieldbyname('TIPO').AsString <> '' then
      Write(txt, AjustaStr(dao.q1.fieldbyname('TIPO').AsString, 1))
    else
      Write(txt, AjustaStr('', 1));

    WriteLn(txt);
    dao.q1.next;
    mqtd_registros := mqtd_registros + 1;
  end;

  // FORMA DE PAGTO
  dao.Geral1('select cod_fop, nom_fop, nivel from fop');
  dao.q1.First;
  while not (dao.q1.Eof) do
  begin
    Write(txt, AjustaStr('41', 2));
    Write(txt, AjustaStr('***', 3));
    Write(txt, AjustaStr(FMFUN.enchevazio(dao.q1.fieldbyname('cod_fop').AsString, 3), 3));
    Write(txt, AjustaStr(FMFUN.AnsiToAscii(dao.q1.fieldbyname('nom_fop').AsString), 35));
    Write(txt, AjustaStr('', 8));
    Write(txt, AjustaStr(dao.q1.fieldbyname('nivel').AsString, 2));
    WriteLn(txt);
    dao.q1.next;
    mqtd_registros := mqtd_registros + 1;
  end;

  // PRAZO
  dao.Geral1('select * from prazo');
  dao.q1.First;
  while not (dao.q1.Eof) do
  begin
    Write(txt, AjustaStr('42', 2));
    Write(txt, AjustaStr('***', 3));
    Write(txt, AjustaStr(FMFUN.enchevazio(dao.q1.fieldbyname('id').AsString, 3), 3));
    Write(txt, AjustaStr(dao.q1.fieldbyname('prazo').AsString, 19));
    WriteLn(txt);
    dao.q1.next;
    mqtd_registros := mqtd_registros + 1;
  end;

  // GRUPO
  dao.Geral1('select cod_grupo, nom_grupo from grupo');
  dao.q1.First;
  while not (dao.q1.Eof) do
  begin
    Write(txt, AjustaStr('44', 2));
    Write(txt, AjustaStr('***', 3));
    Write(txt, AjustaStr(FMFUN.enchevazio(dao.q1.fieldbyname('cod_grupo').AsString, 3), 3));
    Write(txt, AjustaStr(FMFUN.AnsiToAscii(dao.q1.fieldbyname('nom_grupo').AsString), 35));
    WriteLn(txt);
    dao.q1.next;
    mqtd_registros := mqtd_registros + 1;
  end;

  // VENDAS 52
  dao.Geral1('SELECT a.COD_REPRESENTANTE, a.NUMDOC, a.DTA_EMISSAO, a.COD_CLIENTE, a.TOT_BRUTO FROM VENDAS1 a WHERE a.FATURADO = 1 and a.DTA_EMISSAO >= (current_date - 45) order by a.COD_REPRESENTANTE, a.DTA_EMISSAO, a.NUMDOC');
  dao.q1.First;

  while not (dao.q1.Eof) do
  begin
    Write(txt, AjustaStr('52', 2));

    if dao.q1.fieldbyname('cod_representante').AsString <> '' then
      Write(txt, AjustaStr(FMFUN.enchezero(dao.q1.fieldbyname('cod_representante').AsString, 3), 3))
    else
      Write(txt, AjustaStr('', 3));

    if dao.q1.fieldbyname('numdoc').AsString <> '' then
      Write(txt, AjustaStr(dao.q1.fieldbyname('numdoc').AsString, 25))
    else
      Write(txt, AjustaStr('', 25));

    if dao.q1.fieldbyname('DTA_EMISSAO').AsDateTime <> 0 then
      Write(txt, AjustaStr(FormatDateTime('dd/mm/yyyy', dao.q1.fieldbyname('DTA_EMISSAO').AsDateTime), 10))
    else
      Write(txt, AjustaStr('', 10));

    if dao.q1.fieldbyname('COD_CLIENTE').AsString <> '' then
      Write(txt, AjustaStr(FMFUN.enchevazio(dao.q1.fieldbyname('COD_CLIENTE').AsString, 6), 6))
    else
      Write(txt, AjustaStr(dao.q1.fieldbyname('COD_CLIENTE').AsString, 6));

    if dao.q1.fieldbyname('TOT_BRUTO').AsString <> '' then
      Write(txt, AjustaStr(FMFUN.enchevazio(dao.q1.fieldbyname('TOT_BRUTO').AsString, 12), 12))
    else
      Write(txt, AjustaStr('', 12));

    WriteLn(txt);
    dao.q1.next;
    mqtd_registros := mqtd_registros + 1;
  end;

  // RODAPE
  mqtd_registros := mqtd_registros + 1;
  Write(txt, AjustaStr('99', 2));
  Write(txt, AjustaStr('000', 3));
  Write(txt, AjustaStr(inttostr(mqtd_registros), 6));
  Write(txt, AjustaStr('###EOF###', 7));
  WriteLn(txt);

  CloseFile(txt);

  dao.msg('Arquivo enviado com sucesso!');

end;

function TFr_vendas_industria2.AjustaStr(str: string; tam: integer): string;
begin
  while length(str) < tam do
    str := str + ' ';

  if length(str) > tam then
    str := copy(str, 1, tam);

  Result := str;
end;

procedure TFr_vendas_industria2.EnviarDadosparaDispositivo1Click(Sender: TObject);
begin
  MontaArquivoEnvio('palm1.txt');
end;

function TFr_vendas_industria2.VerificaFaturaVencida(cod_cliente: string): boolean;
var
  i: integer;
begin
  dao.Geral1('select cliente_bloqueado from cliente where cod_cliente=' + QuotedStr(cod_cliente));
  if dao.q1.fieldbyname('cliente_bloqueado').AsString = 'S' then
  begin
    dao.msg('<ATENÇÂO> Cliente Bloqueado <ATENÇÃO>');
    sbvendas.Panels[2].Text := 'CLIENTE BLOQUEADO!';
    Pc_vendas.TabIndex := 0;
    { if prcod_cliente.Enabled then
      Prcod_cliente.SetFocus;
      exit; }
  end;

  cliente_com_pendencia := FMFUN.VerificaFaturaVencida(Prcod_cliente.Text, true);

  Result := cliente_com_pendencia;

  if cliente_com_pendencia then
    sbvendas.Panels[2].Text := 'CLIENTE COM PENDENCIAS FINANCEIRA!'
  else
    sbvendas.Panels[2].Text := 'CLIENTE LIBERADO!!';
end;

function TFr_vendas_industria2.LimparBoletos: boolean;
begin
  Result := true;
  // dao.Geral5('select * from cr1 where nr_documento=' + Prnumdoc.Text);
  // if dao.q5.RecordCount = 0 then
  // begin

  if Pedido_AVista then
  begin
    ativa_cr1(Prnumdoc.Text);
    q_cr1.First;
    while not q_cr1.Eof do
    begin
      FMFUN.ExcluirExtratoConta(q_cr1.fieldbyname('id').AsString, 'C', q_cr1.fieldbyname('valor_recebido').AsFloat);
      q_cr1.next;
    end;
  end;

  try
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    dao.Execsql('delete from cr1 where nr_documento=' + Prnumdoc.Text);
    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;
  (* end
    else
    begin
    // showmessage('Conta à Receber não poder ser excluído por estar relacionado à uma Remessa!');
    Result := false;
    Exit; *)
  // end;
  ativa_cr1(Prnumdoc.Text);

end;

procedure TFr_vendas_industria2.cancelar_faturamento(usuario_desfaturou, motivo: string);
var
  pontos: string;
begin
  LimparBoletos;
  try
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    dao.Execsql('update vendas1 set faturado=' + QuotedStr('0') + ', usuario_desfaturou=' + QuotedStr(usuario_desfaturou) + ' where numdoc = ' + Prnumdoc.Text);
    dao.grava_log('DESFATURAMENTO PEDIDO N°: ' + Prnumdoc.Text + '. MOTIVO: ' + UPPERCASE(motivo), '');
    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;

  q_vendas2.First;

  CarregaDados;;
end;

procedure TFr_vendas_industria2.cancelamento_avulso;
var
  pontos: string;
begin
  LimparBoletos;
  try
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    dao.Execsql('update vendas1 set faturado=' + QuotedStr('2') + ' where numdoc = ' + Prnumdoc.Text);

    if (PrProcesso_id.Text = '') then
    begin
      PrProcesso_id.Text := FMFUN.GerarProcessoPedido;
      dao.Execsql('UPDATE VENDAS1 A SET PROCESSO_ID = ' + PrProcesso_id.Text + ' WHERE NUMDOC = ' + Prnumdoc.Text);
    end;

    FMFUN.GravarProcessoPedido('CANCELADO', PrProcesso_id.Text, Prnumdoc.Text);

    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;

  q_vendas2.First;

  CarregaDados;;
end;

procedure TFr_vendas_industria2.Prtot_liquidoChange(Sender: TObject);
begin

  if Prtot_bruto.Value > 0 then
  begin
    Prdesconto.Value := 100 - ((Prtot_liquido.Value / (Prtot_bruto.Value) * 100));
  end;

end;

procedure TFr_vendas_industria2.Crcod_fopKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  if not (Key in ['0'..'9', #8]) and (Key <> #13) then
  begin
    beep; { somente delphi 2.0 ou > }
    Key := #0;
  end;

  if Key = #13 then
  begin
    if (Prcod_fop.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
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
        valor_combo := Campos_combo[i];
        Fr_localizar.CBcampos.Items.Add(Campos_combo[i]);
      end;
      Fr_localizar.CBcampos.ItemIndex := 1;

      Fr_localizar.ShowModal;
      Fr_localizar.Free;

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;
    end;

    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;

end;

procedure TFr_vendas_industria2.Crcod_fopButtonClick(Sender: TObject);
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
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(Campos_combo[i]);
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

    if (not FMFUN.verificaNumerico(Crcod_fop.Text)) and (length(Crcod_fop.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      Crcod_fop.SetFocus;
      Exit;
    end;

    dao.Geral2('select nom_fop from fop where cod_fop=' + QuotedStr(Prcod_fop.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbforma_pgto.Caption := dao.q2.fieldbyname('nom_fop').AsString;
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

procedure TFr_vendas_industria2.MontaEtiquetaTransp(numdoc: string; coluna: integer);
var
  f: TextFile;
  i, ini_etiquetas, total_etiquetas, tamanho_caracter: integer;
  imp_primeira: boolean;
  qtd: string;
begin
  Application.CreateForm(Tfr_escolhe_impressora_termica, fr_escolhe_impressora_termica);
  fr_escolhe_impressora_termica.ShowModal;
  if fr_escolhe_impressora_termica.modalresult = mrOk then
    caminho_imp_cod_barras := fr_escolhe_impressora_termica.impressora_termica
  else
    Exit;

  dao.Geral1('select v.numdoc, v.volume_nota, coalesce(v.nfe, v.numdoc) as nfe, t.nome, t.placa,' + 'case when c.nom_cidade is not null then c.NOM_CIDADE else cf.NOM_CIDADE end as nom_cidade, ' + 'case when c.uf is not null then c.uf else cf.UF end as uf, ' + 'case when cl.nom_cliente is not null then cl.NOM_CLIENTE else f.RAZAO_SOCIAL end as nom_cliente ' + 'from vendas1 v ' + 'left join transportadora t on t.cod_transportadora = v.cod_transportadora ' + 'left join cliente cl on cl.cod_cliente = v.cod_cliente ' + 'left join FORNECEDOR f on f.COD_FORNECEDOR = v.COD_FORNECEDOR ' + 'left join cidades cf on cf.cod_cidade = f.cod_cidade ' + 'left join cidades c on c.cod_cidade = cl.cod_cidade ' + 'where numdoc = ' + QuotedStr(numdoc));

  Application.CreateForm(Tfm_definir_saldo_inicial, fm_definir_saldo_inicial);
  fm_definir_saldo_inicial.Caption := 'Etiquetas.';
  fm_definir_saldo_inicial.gbDefinirSaldo.Caption := 'De';
  fm_definir_saldo_inicial.gbPeso.Caption := 'Até';
  fm_definir_saldo_inicial.gbModelo.Visible := true;
  fm_definir_saldo_inicial.btgra.Caption := 'OK';
  fm_definir_saldo_inicial.edSaldo.Value := 1;
  fm_definir_saldo_inicial.edPeso.Value := dao.q1.fieldbyname('volume_nota').AsInteger;
  fm_definir_saldo_inicial.edSaldo.DisplayFormat := '0';
  fm_definir_saldo_inicial.edPeso.DisplayFormat := '0';
  fm_definir_saldo_inicial.ShowModal;
  if fm_definir_saldo_inicial.modalresult <> mrOk then
    Exit;

  ini_etiquetas := fm_definir_saldo_inicial.edSaldo.AsInteger;
  total_etiquetas := fm_definir_saldo_inicial.edPeso.AsInteger;

  for i := ini_etiquetas to total_etiquetas do
  begin
    AssignFile(f, caminho_imp_cod_barras);
    Rewrite(f);
    WriteLn(f, ' ');
    WriteLn(f, 'O');
    WriteLn(f, 'OD');
    WriteLn(f, 'N');
    WriteLn(f, 'D7');
    WriteLn(f, 'S2');
    WriteLn(f, 'ZT');
    WriteLn(f, 'Q403,22');
    // WriteLn(f, 'Q560,24');
    WriteLn(f, 'q784');

    if fm_definir_saldo_inicial.cbModeloEtiqueta.ItemIndex = 1 then
    begin
      WriteLn(f, 'A35,30,0,4,1,1,R,"Transportadora:"');
      WriteLn(f, 'A35,58,0,4,1,1,N,"' + dao.q1.fieldbyname('nome').AsString + ' - ' + dao.q1.fieldbyname('placa').AsString + '"');

      WriteLn(f, 'A35,90,0,4,1,1,R,"Numero Nota:"');
      WriteLn(f, 'A35,125,0,4,1,1,N,"' + dao.q1.fieldbyname('nfe').AsString + '"');

      WriteLn(f, 'A35,160,0,4,1,1,R,"Cidade:"');
      WriteLn(f, 'A35,190,0,4,1,1,N,"' + dao.q1.fieldbyname('nom_cidade').AsString + '- ' + dao.q1.fieldbyname('uf').AsString + '"');

      WriteLn(f, 'A35,230,0,4,1,1,R,"Cliente:"');
      WriteLn(f, 'A35,260,0,4,1,1,N,"' + dao.q1.fieldbyname('nom_cliente').AsString + '"');

      WriteLn(f, 'A325,300,0,3,3,2,N,"PLASFAN"');
      WriteLn(f, 'A625,301,0,2,1,2,N,"(47)3346-2052"');
      WriteLn(f, 'A325,340,0,4,1,1,R,"www.plasfan.ind.br"');

    end
    else
    begin

      WriteLn(f, 'A30,30,0,4,2,2,N,"Numero Nota:"');
      WriteLn(f, 'A420,30,0,4,2,2,N,"' + dao.q1.fieldbyname('nfe').AsString + '"');

      WriteLn(f, 'A30,110,0,4,2,2,N,"Cidade:"');
      tamanho_caracter := length(dao.q1.fieldbyname('nom_cidade').AsString + '- ' + dao.q1.fieldbyname('uf').AsString);
      WriteLn(f, 'A300,110,0,4,2,2,N,"' + copy(dao.q1.fieldbyname('nom_cidade').AsString + '- ' + dao.q1.fieldbyname('uf').AsString, 1, 15) + '"');
      if tamanho_caracter > 15 then
        WriteLn(f, 'A300,160,0,4,2,2,N,"' + copy(dao.q1.fieldbyname('nom_cidade').AsString + '- ' + dao.q1.fieldbyname('uf').AsString, 16, 15) + '"');

      WriteLn(f, 'A30,210,0,4,2,2,N,"Cliente:"');
      tamanho_caracter := length(dao.q1.fieldbyname('nom_cliente').AsString);
      WriteLn(f, 'A310,210,0,4,2,2,N,"' + copy(dao.q1.fieldbyname('nom_cliente').AsString, 1, 15) + '"');
      if tamanho_caracter > 15 then
        WriteLn(f, 'A310,260,0,4,2,2,N,"' + copy(dao.q1.fieldbyname('nom_cliente').AsString, 16, 15) + '"');
    end;

    WriteLn(f, 'P1');

    // Sleep(1000);
    CloseFile(f);
  end;
end;



procedure TFr_vendas_industria2.TrataArquivoRecebimento(nom_arquivo: string);
var
  txt: TextFile;
  Linha: string;
  cmd: string;
  qtdlin: integer;
  numped, pathSaida: string;
begin
  try
    pathSaida := ExtractFilePath(Application.ExeName) + 'Recepcao\';
    AssignFile(txt, pathSaida + nom_arquivo);

    Reset(txt);

    while not Eof(txt) do
    begin
      if trim(copy(Linha, 1, 2)) <> '70' then
      begin
        cmd := 'insert into vendas1 (cod_representante, nr_pedido_palm, dtadoc, hora, cod_cliente, cod_fop, cod_prazo_pgto,' + 'tot_bruto, tot_liquido, observacoes_pedido) values (' +
QuotedStr(trim(copy(Linha, 3, 3))) + ',' + // vendedor
  QuotedStr(trim(copy(Linha, 6, 7))) + ',' + // nr pedido palm
  QuotedStr(trim(copy(Linha, 13, 10))) + ',' + // data
  QuotedStr(trim(copy(Linha, 23, 5))) + ',' + // Hora
  QuotedStr(trim(copy(Linha, 28, 6))) + ',' + // cod Cliente
  QuotedStr(trim(copy(Linha, 34, 3))) + ',' + // Cod forma de Pgto
  QuotedStr(trim(copy(Linha, 37, 3))) + ',' + // Cod Prazo Pgto
  QuotedStr(trim(copy(Linha, 40, 10))) + ',' + // Total Bruto
  QuotedStr(trim(copy(Linha, 60, 10))) + ',' + // Total Liquido
  QuotedStr(trim(copy(Linha, 70, 150))) + ')'; // Observacao do Pedido
        dao.Execsql(cmd);
        dao.Geral3('SELECT nextval(''gen_vendas1'') as gen_id FROM configuracao ');
		
        numped := dao.q3.fieldbyname('gen_id').AsString;
      end;
      if trim(copy(Linha, 1, 2)) <> '72' then
      begin
        cmd := 'insert into vendas2 (cod_representante, numdoc, nr_pedido_palm, dtadoc, cod_produto, qtd, preco, sub_total  ) values (' +
QuotedStr(trim(copy(Linha, 3, 3))) + ',' + // vendedor
  QuotedStr(numped) + ',' + // nr pedido sistema
  QuotedStr(trim(copy(Linha, 6, 7))) + ',' + // nr pedido palm
  QuotedStr(trim(copy(Linha, 13, 10))) + ',' + // cod Produto
  QuotedStr(trim(copy(Linha, 23, 9))) + ',' + // Qtd
  QuotedStr(trim(copy(Linha, 32, 9))) + ',' +        // preco unitario liquido
  QuotedStr(trim(copy(Linha, 41, 9))) + ')'; // Sub-Total
      end;
      ReadLn(txt, Linha);
    end;
  except
    on e: Exception do
    begin
      dao.msg('Houve um erro ao Transmitir o arquivo de atulização!' + #13 + e.Message + #13 + cmd);
      dao.cn.Rollback;
    end;
  end;

end;

procedure TFr_vendas_industria2.ReceberDados1Click(Sender: TObject);
begin
  dao.Geral1('select id, nom_representante from representante where ativo=' + QuotedStr('S'));
  dao.q1.First;
  while not dao.q1.Eof do
  begin

  end;

end;





procedure TFr_vendas_industria2.BtexcpedClick(Sender: TObject);
var
  msg: string;
  desativar: boolean;
begin
  cliente_alterado := false;
  q_vendas1.Open;
  if q_vendas1.fieldbyname('faturado').AsString = '1' then
  begin
    dao.msg('Para Desativar um Pedido você deve Antes Desfatura-lo!');
    Exit;
  end;

  desativar := q_vendas1.fieldbyname('faturado').AsString = '0';

  if q_vendas1.fieldbyname('faturado').AsString = '0' then
    msg := 'Deseja Desativar este Pedido?';
  if q_vendas1.fieldbyname('faturado').AsString = '4' then
    msg := 'Deseja Reativar este Pedido?';

  if MessageDlg(msg, mtConfirmation, [mbYes, mbno], 0) = mryes then
  begin
    if btcan.Enabled = true then
      btcanClick(Self);

    if Prnumdoc.Text <> '' then
    begin
      try
        if not (dao.cn.InTransaction) then
          dao.cn.StartTransaction;
        if q_vendas1.fieldbyname('faturado').AsString = '0' then
        begin
          dao.Execsql('update vendas1 set faturado = 4 where numdoc=' + QuotedStr(Prnumdoc.Text));

          if (PrProcesso_id.Text = '') then
          begin
            PrProcesso_id.Text := FMFUN.GerarProcessoPedido;
            dao.Execsql('UPDATE VENDAS1 A SET PROCESSO_ID = ' + PrProcesso_id.Text + ' WHERE NUMDOC = ' + Prnumdoc.Text);
          end;

          if PrProcesso_id.Text <> '' then
            FMFUN.GravarProcessoPedido('DESATIVADO', PrProcesso_id.Text, Prnumdoc.Text);

          BtnEnviarPedido.Enabled := false;

          LimparBoletos;
        end;

        if q_vendas1.fieldbyname('faturado').AsString = '4' then
        begin
          dao.Execsql('update vendas1 set faturado = 0 where numdoc=' + QuotedStr(Prnumdoc.Text));

          if PrProcesso_id.Text <> '' then
            FMFUN.GravarProcessoPedido('À FATURAR', PrProcesso_id.Text, Prnumdoc.Text);

          BtnEnviarPedido.Enabled := BtnEnviarPedido.Visible and (Prnumdoc.Text <> '');
        end;

        dao.cn.Commit;
      except
        dao.cn.Rollback;
      end;

    end;


    HabilitaBotoesPedido(1);

    promocao_desconto := TodosPromocao;
  end;


end;

procedure TFr_vendas_industria2.DeletaLinha(Linha: integer);
begin
end;

procedure TFr_vendas_industria2.DesfaturarPedido1Click(Sender: TObject);
begin
  if (Prnumdoc.Text <> '') and (btnov.Enabled = true) then
    dao.Geral2('select faturado, chave_nfe from vendas1 where numdoc=' + QuotedStr(Prnumdoc.Text))
  else
    Exit;

  if not dao.q2.fieldbyname('CHAVE_NFE').IsNull then
  begin
    dao.msg('Não é permitido desfaturar Nota Fiscal Eletrônica!');
    Exit;
  end;

  if dao.q2.fieldbyname('faturado').AsString = '0' then
  begin
    dao.msg('Venda não Faturada!');
    Exit;
  end;

  if MessageDlg('Deseja Desfaturar essa Venda?', mtConfirmation, [mbYes, mbno], 0) = mryes then
  begin
    Application.CreateForm(TFr_senha_especial, Fr_senha_especial);
    Fr_senha_especial.nivel := '2';
    Fr_senha_especial.ShowModal;
    if liberado then
    begin
      Application.CreateForm(TFmMotivo, FmMotivo);
      FmMotivo.ShowModal;
      if FmMotivo.modalresult = mrOk then
        cancelar_faturamento(Fr_senha_especial.codusu, FmMotivo.mmMotivo.Text);
      FmMotivo.Free;
    end;
    Fr_senha_especial.Free;
  end;

  q_vendas1.Open;

  StatusPedido;
end;

procedure TFr_vendas_industria2.MontaNF(n_pedido: string);
var
  MCOL, lh: integer;
  MNUMNOT: string;
  i, y: integer;
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
  icms: string;
begin
  if (Prcod_cliente.Text <> '') then
    dao.Geral1(sql_nota + ' where v1.numdoc=' + QuotedStr(n_pedido) + sql_grupo_nota)
  else
    dao.Geral1(sql_nota_dev + ' where v1.numdoc=' + QuotedStr(n_pedido) + sql_grupo_nota_dev);

  dao.Geral2('select a.ID, a.NUMDOC, a.DTADOC, a.COD_PRODUTO, a.COD_CLIENTE, ' + 'a.COD_REPRESENTANTE, a.ID_COR, a.ID_TAMANHO, a.QTD, a.QTD_DEVOLVIDA, a.DEVOLVIDO, ' + 'a.PRECO, a.SUB_TOTAL, a.DESCONTO, a.VOLUME, a.COD_EMPRESA, a.NR_PEDIDO_PALM, a.PRECO_BRUTO, ' + 'a.SUB_TOTAL_BRUTO, a.VLR_COMISSAO, a.TROCA, a.COD_FISCAL_ITEM, a.ICMS_ITEM, a.VLR_ICMS_ST, ' + 'a.VLR_BC_ST, a.VLR_ICMS_ITEM, a.NCM, a.VLR_BC, a.IPI_ITEM, a.VLR_IPI_ITEM, a.VLR_AGR_ITEM, ' + 'a.TRIB_ICMS, a.CESTA_BASICA, a.COD_SUPERVISOR, a.QTD_EMBALAGEM, a.PRECO_CUSTO, a.PERC_COMISSAO, ' + 'a.PROMOCAO, a.DESCONTO_MAX, ' + 'p.nom_produto, p.unidade, p.qtd_embalagem, p.trib_icms from vendas2 a ' + 'left join produto p on p.cod_produto = a.cod_produto ' + 'where numdoc= ' + QuotedStr(n_pedido));

  dao.Geral3('select a.ID, a.COD_CLIENTE, a.NR_DOCUMENTO, a.TITULO, a.SEQUENCIA, a.COD_EMPRESA, ' + 'a.DTAVEN, a.VALOR, a.COD_FOP, a.HISTORICO1, a.DTAREC, a.VALOR_RECEBIDO, a.SALDO, a.DIAS_ATRASO, ' + 'a.VLR_CORRIGIDO, a.DESCONTO, a.NR_CUPOM, a.CONFERIDO, a.ID_REPRESENTANTE, a.VLR_COMISSAO, ' + 'a.ID_PLANO_CONTAS, a.SINCRONIZAR_PALM, a.EXTRATO, a.VALOR_CORRIGIDO, a.BOLETO_REMESSA_ORDEM, a.BOLETO_RETORNO_CODIGO, a.BOLETO_RETORNO_DESCRICAO ' + 'from cr1 a where nr_documento=' + QuotedStr(n_pedido));

  dao.Geral4('select icms from uf WHERE UF=' + QuotedStr(dao.q1.fieldbyname('uf').AsString));
  if dao.q4.RecordCount > 0 then
    icms := dao.q4.fieldbyname('ICMS').AsString;

  LINHA_ERRO := 1;
  if PrNF.Text = '' then
  begin
    showmessage('<ATENÇÃO> O NUMERO DA NOTA NÃO ESTÁ PREENCHIDO!<ATENÇÃO>');
    PrNF.SetFocus;
    Exit;
  end;

  dao.Geral4('select faturado from vendas1 where numdoc = ' + QuotedStr(n_pedido));
  if dao.q4.fieldbyname('faturado').AsString = 'F' then
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

  MQTDPRO := dao.q2.RecordCount;
  // showmessage(floattostr(mqtdpro));
  MQTDNOT := MQTDPRO / 22;
  if MQTDNOT <= 1 then
    MCTNOT := 1
  else
    MCTNOT := 2;

  // ***** IMPRESSÃO DA NOTA  ********

  RDIMPNOT.abrir;

  // *****************CORPO DA NOTA****************************
  for i := 1 to MCTNOT do
  begin
    if i = 2 then
      RDIMPNOT.novapagina;

    if i = 1 then
      dao.q2.First;
    lh := 35;
    while not (dao.q2.Eof) do
    begin
      if i = 2 then
      begin
        for y := 1 to 22 do
          if dao.q2.Eof then
            break;
        RDIMPNOT.ImpF(lh, 01, dao.q2.fieldbyname('cod_produto').AsString, [comp17]);
        RDIMPNOT.ImpF(lh, 09, dao.q2.fieldbyname('nom_produto').AsString, [comp17]);
        if dao.q2.fieldbyname('trib_icms').AsString = '0' then
          RDIMPNOT.ImpF(lh, 50, '00', [comp17])
        else if dao.q2.fieldbyname('trib_icms').AsString = '1' then
          RDIMPNOT.ImpF(lh, 50, '10', [comp17])
        else if dao.q2.fieldbyname('trib_icms').AsString = '2' then
          RDIMPNOT.ImpF(lh, 50, '20', [comp17])
        else if dao.q2.fieldbyname('trib_icms').AsString = '3' then
          RDIMPNOT.ImpF(lh, 50, '30', [comp17])
        else if dao.q2.fieldbyname('trib_icms').AsString = '4' then
          RDIMPNOT.ImpF(lh, 50, '40', [comp17])
        else if dao.q2.fieldbyname('trib_icms').AsString = '5' then
          RDIMPNOT.ImpF(lh, 50, '41', [comp17])
        else if dao.q2.fieldbyname('trib_icms').AsString = '6' then
          RDIMPNOT.ImpF(lh, 50, '50', [comp17])
        else if dao.q2.fieldbyname('trib_icms').AsString = '7' then
          RDIMPNOT.ImpF(lh, 50, '51', [comp17])
        else if dao.q2.fieldbyname('trib_icms').AsString = '8' then
          RDIMPNOT.ImpF(lh, 50, '60', [comp17])
        else if dao.q2.fieldbyname('trib_icms').AsString = '9' then
          RDIMPNOT.ImpF(lh, 50, '70', [comp17])
        else if dao.q2.fieldbyname('trib_icms').AsString = '10' then
          RDIMPNOT.ImpF(lh, 50, '90', [comp17]);

        RDIMPNOT.ImpF(lh, 65, dao.q2.fieldbyname('unidade').AsString, [comp17]);
        // +DMVEN.QUNOTPED2.Fieldbyname('divvol').AsString,[comp17])
        // else
        // RDIMPNOT.impf(lh,65,dao.Q2.Fieldbyname('unidade').AsString,[comp17]);

        RDIMPNOT.impd(lh, 68, dao.q2.fieldbyname('qtd').AsString, [comp17]);
        RDIMPNOT.impval(lh, 70, '###,##0.0000', dao.q2.fieldbyname('preco').AsFloat, [comp17]);
        RDIMPNOT.impval(lh, 94, '###,##0.00', dao.q2.fieldbyname('sub_total').AsFloat, [comp17]);
        // 26/09/07            if DMVEN.QUNOTPED1.Fieldbyname('PERICM').AsFloat<> null then
        if dao.q2.fieldbyname('trib_icms').AsString <> '8' then
          RDIMPNOT.impval(lh, 108, '###,##0.00', strtofloat(icms), [comp17]);

        lh := lh + 1;
        dao.q2.next;
      end;
      RDIMPNOT.ImpF(lh, 01, dao.q2.fieldbyname('cod_produto').AsString, [comp17]);
      RDIMPNOT.ImpF(lh, 10, dao.q2.fieldbyname('nom_produto').AsString, [comp17]);

      // if (DMVEN.QUNOTPED2.Fieldbyname('NOMMEDIDA').AsString<>null) and (DMVEN.QUNOTPED2.Fieldbyname('divvol').value<>null)then
      RDIMPNOT.ImpF(lh, 67, dao.q2.fieldbyname('unidade').AsString, [comp17]);
      // +DMVEN.QUNOTPED2.Fieldbyname('divvol').AsString,[comp17])
      // else
      // RDIMPNOT.impf(lh,64,DMVEN.QUNOTPED2.Fieldbyname('NOMMEDIDA').AsString,[comp17]);
      RDIMPNOT.impd(lh, 80, dao.q2.fieldbyname('QTD').AsString, [comp17]);
      RDIMPNOT.impval(lh, 81, '###,##0.0000', dao.q2.fieldbyname('preco').AsFloat, [comp17]);
      RDIMPNOT.impval(lh, 94, '###,##0.00', dao.q2.fieldbyname('sub_total').AsFloat, [comp17]);
      // 26/06/07        if DMVEN.QUNOTPED1.Fieldbyname('PERICM').AsFloat<> null then

      if dao.q2.fieldbyname('trib_icms').AsString <> '8' then
        RDIMPNOT.impval(lh, 116, '#0', strtofloat(icms), [comp17]);

      RDIMPNOT.impval(lh, 119, '#0', dao.q2.fieldbyname('ipi_item').AsFloat, [comp17]);
      RDIMPNOT.impval(lh, 122, '###,##0.00', dao.q2.fieldbyname('vlr_ipi_item').AsFloat, [comp17]);

      lh := lh + 1;
      if dao.q2.Eof then
        break;
      dao.q2.next;

      if lh = 57 then
        break; // ERA 82

    end;

  end;
  // if (MCTNOT=2) and (i=1) then continue;
  // **********************CÁLCULO DO IMPOSTO ***********************
  // BASE CÁLCULO ICMS
  // if DMVEN.QUNOTPED1.Fieldbyname('BASEICM').AsFloat <> null then

  if (dao.q1.fieldbyname('VLR_BC_ICMS').Value > 0) then
    RDIMPNOT.impval(61, 01, '###,##0.00', dao.q1.fieldbyname('VLR_BC_ICMS').AsFloat, [comp17]);
  // VLR DO ICMS
  // if DMVEN.QUNOTPED1.Fieldbyname('VLRICM').AsFloat<> null then
  if (dao.q1.fieldbyname('VLR_ICMS').Value > 0) then
    RDIMPNOT.impval(61, 24, '###,##0.00', dao.q1.fieldbyname('VLR_ICMS').AsFloat * (strtofloat(icms) / 100), [comp17]);
  // VALOR TOTAL DOS PRODUTOS
  { //BASE CÁLCULO ICMS SUBST.
    if (not dao.Q1.Fieldbyname('VLR_ICMS_ST').IsNull and dao.Q1.Fieldbyname('VLR_ICMS_ST').value > 0) then
    RDIMPNOT.impval(61, 60, '###,##0.00', dao.Q1.Fieldbyname('VLR_BC_ST').AsFloat, [comp17]);

    //VLR ICMS SUBST.
    if (not dao.Q1.Fieldbyname('VLR_ICMS_ST').IsNull and dao.Q1.Fieldbyname('VLR_ICMS_ST').value > 0) then
    RDIMPNOT.impval(61, 80, '###,##0.00', dao.Q1.Fieldbyname('VLR_ICMS_ST').AsFloat, [comp17]);
  }

  RDIMPNOT.impval(61, 119, '###,##0.00', dao.q1.fieldbyname('tot_liquido').AsFloat, [comp17]);
  // VALOR TOTAL DA NOTA
  // VLR ICMS SUBST.
  if (not dao.q1.fieldbyname('VLR_IPI').IsNull and dao.q1.fieldbyname('VLR_IPI').Value > 0) then
    RDIMPNOT.impval(64, 80, '###,##0.00', dao.q1.fieldbyname('VLR_IPI').AsFloat, [comp17]);

  RDIMPNOT.impval(64, 119, '###,##0.00', (dao.q1.fieldbyname('tot_liquido').AsFloat + dao.q1.fieldbyname('VLR_IPI').AsFloat), [comp17]);

  // ****************TRANSPORTADORA*******************************
  // NOME /RAZÃO SOCIAL
  RDIMPNOT.ImpF(69, 01, dao.q1.fieldbyname('nom_transportadora').AsString, [comp17]);

  // frete por conta
  RDIMPNOT.ImpF(69, 78, dao.q1.fieldbyname('tipo_frete').Value, [comp17]);

  // placa do veiculo
  RDIMPNOT.ImpF(69, 82, dao.q1.fieldbyname('placa').AsString, [comp17]);

  // uf
  RDIMPNOT.ImpF(69, 100, dao.q1.fieldbyname('uf_transportadora').AsString, [comp17]);

  // cnpj transportadora
  RDIMPNOT.ImpF(69, 115, dao.q1.fieldbyname('cnpj_tra').AsString, [comp17]);

  // endereço
  RDIMPNOT.ImpF(71, 01, dao.q1.fieldbyname('end_tra').AsString, [comp17]);

  // municipio
  // DMVEN.TACID.FindKey([DMVEN.TAPE1CIDCLI.VALUE]);
  // RDIMPNOT.impf(73,67,DMVEN.QUNOTPED1.Fieldbyname('NOMCID1'.VALUE,[comp17]);
  // UF MUNICIPIO
  // RDIMPNOT.impf(73,100,DMVEN.QUNOTPED1 UFCID.VALUE,[comp17]);
  // INSCRIÇÃO ESTADUAL
  RDIMPNOT.ImpF(71, 115, dao.q1.fieldbyname('ie_tra').AsString, [comp17]);

  // VOLUME DO PEDIDO
  RDIMPNOT.impval(74, 01, '#0', dao.q1.fieldbyname('volume_nota').AsFloat, [comp17]);

  // ESPÉCIE
  RDIMPNOT.ImpF(74, 26, 'VOLUMES', [comp17]);

  // MARCA
  RDIMPNOT.ImpF(74, 50, 'X', [comp17]);

  // PESO BRUTO
  RDIMPNOT.impval(74, 95, '###,##0.000', dao.q1.fieldbyname('peso_nota').AsFloat, [comp17]);

  // PESO LIQUIDO
  RDIMPNOT.impval(74, 118, '###,##0.000', dao.q1.fieldbyname('peso_nota').AsFloat, [comp17]);

  // ********INFORMAÇÕES ADICIONAIS*************************
  if Prboleto_anexo.Checked = true then
    RDIMPNOT.ImpF(75, 01, 'BOLETO ANEXO.', [comp17]);

  if dao.q1.fieldbyname('observacoes_nota').AsString <> '' then
    RDIMPNOT.ImpF(82, 01, dao.q1.fieldbyname('observacoes_nota').AsString, [comp17]);
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
  RDIMPNOT.ImpF(86, 01, dao.q1.fieldbyname('nom_cliente').AsString, [comp17]);

  // VALOR TOTAL DA NOTA
  RDIMPNOT.impval(86, 52, '###,##0.00', dao.q1.fieldbyname('tot_liquido').AsFloat, [comp17]);

  // NOME /RAZÃO SOCIAL
  RDIMPNOT.ImpF(86, 70, dao.q1.fieldbyname('nom_transportadora').AsString, [comp17]);

  // DTA SAIDA
  RDIMPNOT.ImpF(86, 100, datetostr(dao.q1.fieldbyname('dta_saida').AsDateTime), [comp17]);
  RDIMPNOT.fechar;
  // ****** acabou a impressão da nota *******

end;

procedure TFr_vendas_industria2.RDIMPNOTNewPage(Sender: TObject; Pagina: integer);
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

  RDIMPNOT.ImpF(11, 39, mcodope, [comp17]);
  // NOME CLIENTE
  RDIMPNOT.ImpF(15, 01, dao.q1.fieldbyname('nom_cliente').AsString, [comp17]);
  // CNPJ
  RDIMPNOT.ImpF(15, 88, dao.q1.fieldbyname('cpf').AsString, [comp17]);
  RDIMPNOT.ImpF(15, 88, dao.q1.fieldbyname('cnpj').AsString, [comp17]);
  // DTA EMISSÃO
  if copy(dao.q1.fieldbyname('dta_emissao').AsString, 7, 4) <> '1899' then
    RDIMPNOT.ImpF(15, 120, FormatDateTime('dd/mm/yyyy', dao.q1.fieldbyname('dta_emissao').AsDateTime), [comp17]);

  // endereço
  RDIMPNOT.ImpF(18, 01, dao.q1.fieldbyname('endereco').AsString + ', ' + dao.q1.fieldbyname('nr_endereco').AsString, [comp17]);

  // bairro
  RDIMPNOT.ImpF(18, 67, dao.q1.fieldbyname('bairro').AsString, [comp17]);
  // cep
  RDIMPNOT.ImpF(18, 97, dao.q1.fieldbyname('cep').AsString, [comp17]);

  // data saida / entrada
  // if copy(datetostr(DMVEN.QUNOTPED1.Fieldbyname('DTASAI').VALUE),7,4) <> '1899' then
  RDIMPNOT.ImpF(18, 119, FormatDateTime('dd/mm/yyyy', dao.q1.fieldbyname('dta_saida').AsDateTime), [comp17]);

  // municipio
  RDIMPNOT.ImpF(21, 01, dao.q1.fieldbyname('cid_cli').AsString, [comp17]);
  // fone
  RDIMPNOT.ImpF(21, 46, dao.q1.fieldbyname('telefone').AsString, [comp17]);
  // uf
  RDIMPNOT.ImpF(21, 80, dao.q1.fieldbyname('uf').AsString, [comp17]);
  // ie

  RDIMPNOT.ImpF(21, 86, dao.q1.fieldbyname('RG').AsString, [comp17]);
  RDIMPNOT.ImpF(21, 86, dao.q1.fieldbyname('IE').AsString, [comp17]);
  // horA
  // RDIMPNOT.impf(16,01,DMVEN.TAPE1horsai.value,[comp17]);
  // *******************FATURA*****************************
  dao.q3.First;
  mtotcr1 := dao.q3.RecordCount;
  maccr1 := 1;
  // Campo feito para marcar na nota qual nota forma de pgto
  RDIMPNOT.ImpF(25, 02, dao.q1.fieldbyname('nom_fop').AsString, [comp17]);
  MCOL := 49;
  while not (dao.q3.Eof) do
  begin
    RDIMPNOT.ImpF(25, MCOL, dao.q3.fieldbyname('dtaven').AsString, [comp17]);
    MCOL := MCOL + 14;
    dao.q3.next;
  end;

  RDIMPNOT.ImpF(27, 02, dao.q1.fieldbyname('nf').AsString, [comp17]);
  RDIMPNOT.ImpF(27, 24, dao.q3.fieldbyname('nr_documento').AsString, [comp17]);

  maccr1 := 1;
  dao.q3.First;
  MCOL := 53;
  while not (dao.q3.Eof) do
  begin
    RDIMPNOT.ImpF(27, MCOL, formatfloat('###,##0.00', dao.q3.fieldbyname('valor').AsFloat), [comp17]);
    MCOL := MCOL + 14;
    dao.q3.next;
  end;

end;

procedure TFr_vendas_industria2.Prcod_fiscalButtonClick(Sender: TObject);
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
  chamou_form := 'fr_pedidos_cod_fiscal';
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

  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

function TFr_vendas_industria2.BuscaNatOP(codigo:string):string;
begin
  dao.Geral2('select nome from cod_fiscal where cod_fiscal=' + QuotedStr(codigo));
  if dao.q2.RecordCount > 0 then
    Result := dao.q2.fieldbyname('nome').AsString
  else
    Result := '';
end;

procedure TFr_vendas_industria2.Prcod_fiscalExit(Sender: TObject);
begin
  if trim(Prcod_fiscal.Text) = '' then
    Lbnom_cod_fiscal.Caption := '...';

  if Prcod_fiscal.Text <> '' then
  begin
    Lbnom_cod_fiscal.Caption := BuscaNatOP(Prcod_fiscal.Text);
    if Lbnom_cod_fiscal.Caption = '' then
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_fiscal.Text := '';
      Prcod_fiscal.SetFocus;
      Exit;
    end;
  end;
end;

procedure TFr_vendas_industria2.Prcod_fiscalKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin

  if not (Key in ['0'..'9', #8]) and (Key <> #13) then
  begin
    beep; { somente delphi 2.0 ou > }
    Key := #0;
  end;

  if Key = #13 then
  begin
    if (Prcod_fiscal.Text = '') and (Btnovped.Enabled = false) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Código Fiscal';
      chamou_pesquisa := 'fr_cod_fiscal';
      chamou_form := 'fr_pedidos_cod_fiscal';
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

      Fr_localizar.ShowModal;
      Fr_localizar.Free;

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;
    end;
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;
end;

procedure TNFePedido.monta_NFE;
var
  cAssinarXML: _AssinarXML;
  strResultado: WideString;
  intResultado, CodigoNumerico, i, j, h, iAno: integer;
  smensagem: WideString;
  strChaveAcesso, natop_id : string;
  VST, VBCST, TotICMSSimples, ICMSSimples: currency;
  Aliq_ICMS_Simples: real;
  Fnf: file;
  assXML: TextFile;
  nr_erro: integer;
  XMLDoc, ref, nome, xmlassinado, mensagem: WideString;
  path, slInfCpl, slInfCpl_add, obs_st: string;
  SimplesICMS, CestaBasica, SubstituicaoTributaria, SubstituicaoTributariaRetida, Cheque, Dinheiro, Deposito: boolean;
  bDiferimento : Boolean;
  vTotalICMSDif, vTotalICMSOp, vTotalIBS, vTotalCBS : Currency;
  procedure LimpaDirNF;
  var
    Ret: integer;
    f: TSearchRec;
    Pasta: string;
    data_arquivo: TDateTime;
  begin
    try
      Pasta := ExtractFilePath(Application.ExeName) + '\nf\';
      Ret := FindFirst(Pasta + '*.xml', faAnyFile, f);
      while Ret = 0 do
      begin
        DeleteFile(Pasta + f.Name);
        Ret := FindNext(f);
      end;
    finally
      //
    end
  end;

begin
  // CDV := Copy(strChaveAcesso, Length(strChaveAcesso), Length(strChaveAcesso));
  bDiferimento  := False;
  vTotalICMSOp  := 0;
  vTotalICMSDif := 0;
  LimpaDirNF;
  cont := 1;
  Synchronize(Mostra);
  // cBuscarCertificado.BuscaNome(smensagem);
  try
    smensagem := Fr_vendas_industria2.ACBrNFe1.ssl.selecionarcertificado;
    // Fr_vendas_industria2.ACBrNFe1.Configuracoes.Certificados.NumeroSerie := '68e712cba9f8c25d';

  except
    on e: Exception do
    begin
      erro := true;
      msgerros := e.Message;
      Exit;
    end;
  end;
  nome_titular := smensagem;

  cont := 2;
  Synchronize(Mostra);

  // dao.Geral4('select ultima_nf from configuracao');
  // Nnumero_nf:= FMFUN.enchezero(dao.Q4.fieldbyname('ultima_nf').AsString,8);
  // frmmontaXml.Nnumero_nf:= Nnumero_nf; //q_vendas1.fieldbyname('nf').AsString;

  Fr_vendas_industria2.ACBrNFe1.NotasFiscais.Clear;

  with Fr_vendas_industria2.ACBrNFe1.NotasFiscais.Add.NFe do
  begin

    // frmmontaXml.Empresa_Faturar := Fr_vendas_industria2.Prempresa_faturar.Text;

    Ide.serie := 1;

    // frmmontaXml.Nserie_nf := '001';

    infnfe.id := '1';
    // frmmontaXml.Nnf_id := '1';

    infnfe.Versao := 4;
    // frmmontaXml.Nnf_versao := '2.0';
    // frmmontaXml.Nnr_documento := Fr_vendas_industria2.Prnumdoc.Text;

    if tipo = 0 then
      Ide.nNF := strtoint(Fr_vendas_industria2.PrNFE.Text)
    else
      Ide.nNF := strtoint(Fr_vendas_industria2.PrNFE_Dev.Text);

    // frmmontaXml.Nnumero_nf := Fr_vendas_industria2.PrNFE.Text;

    Randomize;
    CodigoNumerico := Random(9999999);

    Ide.CNF := strtoint(copy(FRPRI.strZero(CodigoNumerico, 8, 0), 1, 8));

    if (Fr_vendas_industria2.Lbnom_fop.Caption = 'À VISTA (SEM DESCONTOS ADICIONAIS)') then
      Ide.indPag := ipVista;

    if (Fr_vendas_industria2.Lbnom_fop.Caption = 'BOLETO') or (Fr_vendas_industria2.Lbnom_fop.Caption = 'DUP BB FANTONI') or (Fr_vendas_industria2.Lbnom_fop.Caption = 'MASTERSEC') or (Fr_vendas_industria2.Lbnom_fop.Caption = 'DUPLICATA') then
      Ide.indPag := ipPrazo;

    if (Fr_vendas_industria2.Lbnom_fop.Caption = 'CHEQUE PRÉ') or (Fr_vendas_industria2.Lbnom_fop.Caption = 'PERMUTA') or (Fr_vendas_industria2.Lbnom_fop.Caption = 'TROCA') or (Fr_vendas_industria2.Lbnom_fop.Caption = 'BONIFICAÇÃO') then
      Ide.indPag := ipOutras;

    if (Fr_vendas_industria2.Lbnom_fop.Caption = 'DEPÓSITO ANTECIPADO') then
    begin
      if (Fr_vendas_industria2.Prcod_prazo_pgto.Text = '7') then
        Ide.indPag := ipVista
      else
        Ide.indPag := ipPrazo;
    end;

    // frmmontaXml.Nmodelo := '55'; // '55';
    Ide.modelo := 55;

    // frmmontaXml.Nserie_nf := '1'; // '1';
    Ide.serie := 1;

    // frmmontaXml.Ndata_emissao := strtodate(Fr_vendas_industria2.Prdta_saida.text);
    if tipo = 0 then
      Ide.dEmi := strtodate(Fr_vendas_industria2.Prdta_saida.Text)
    else
      Ide.dEmi := today;

    //
    // frmmontaXml.Ndata_saida := FormatDateTime('yyyy-mm-dd', strtodate(Fr_vendas_industria2.Prdta_saida.text)); //

    Ide.dSaiEnt := now;

    Ide.hSaiEnt := now;

    // frmmontaXml.Ntipo_nf := '1'; //
    if tipo = 0 then
      Ide.tpNF := tnSaida
    else
      Ide.tpNF := tnEntrada;

    // Reforma Tributária
    Ide.gCompraGov.tpEnteGov := tcgUniao;
    Ide.gCompraGov.pRedutor := 5;

    Fr_vendas_industria2.Prcod_fiscalExit(Self);
    Ide.natOp := Fr_vendas_industria2.Prcod_fiscal.Text + '-' + copy(Fr_vendas_industria2.Lbnom_cod_fiscal.Caption, 1, 55);

    if Ide.tpNF = tnEntrada then
    begin
      if Fr_vendas_industria2.PrEntradaNaoDevolucao.checked  then
      begin
        if trim(Fr_vendas_industria2.PrNFE.Text) = '' then
          Fr_vendas_industria2.PrNFE.Text := Fr_vendas_industria2.PrNFE_Dev.Text;

        natop_id := Fr_vendas_industria2.Prcod_fiscal.Text;

        if natop_id = '5101' then
          natop_id := '1201';

        if natop_id = '5102' then
          natop_id := '1202';

        if natop_id = '6101' then
          natop_id := '2201';

        if natop_id = '6102' then
          natop_id := '2202';

        if natop_id = '5405' then
          natop_id := '1411';

        if natop_id = '5917' then
          natop_id := '1202';

        if natop_id = '5910' then
          natop_id := '1202';

        if natop_id = '6910' then
          natop_id := '2202';

        if natop_id = '5949' then
          natop_id := '1202';

        if natop_id = '6949' then
          natop_id := '2202';

        if natop_id = '6917' then
          natop_id := '2202';

        if natop_id = '6403' then
          natop_id := '2411';

        if natop_id = '6152' then
          natop_id := '2202';

        if natop_id = '6409' then
          natop_id := '2202';

        if natop_id = '6202' then
          natop_id := '2202';

        if natop_id = '5202' then
          natop_id := '1202';

        if natop_id = '6551' then
          natop_id := '2551';

        if natop_id = '5551' then
          natop_id := '1551';

        if natop_id = '5152' then
          natop_id := '1152';

        if natop_id = '6152' then
          natop_id := '2152';

        Ide.natOp := natop_id +'-'+ copy(Fr_vendas_industria2.BuscaNatOP(natop_id), 1, 55);
      end
      else
       Ide.natOp := 'Devolução';
    end
    else
    begin
      Fr_vendas_industria2.Prcod_fiscalExit(Self);
      Nnat_operacao := Ide.natOp;
    end;
    // + ' - ' + Fr_vendas_industria2.Lbnom_cod_fiscal.Caption;
    // frmmontaXml.Nnat_operacao := Fr_vendas_industria2.Prcod_fiscal.Text;
    // frmmontaXml.Ntipo_impressao := '1';
    Ide.tpImp := tiRetrato;

    // frmmontaXml.Ndigito_verificador:= ;//
    // frmmontaXml.Ntipo_ambiente := fmfun.BuscaAmbienteNFE;
    Ide.tpAmb := FMFUN.BuscaAmbienteNFE;

    Fr_vendas_industria2.ACBrNFe1.Configuracoes.WebServices.AguardarConsultaRet := 0;
    Fr_vendas_industria2.ACBrNFe1.Configuracoes.WebServices.AjustaAguardaConsultaRet := True;
//    Fr_vendas_industria2.ACBrNFe1.Configuracoes.WebServices.RespSincrono := True;
    Fr_vendas_industria2.ACBrNFe1.Configuracoes.WebServices.Ambiente := Ide.tpAmb;
    Fr_vendas_industria2.ACBrNFe1.Configuracoes.WebServices.UF := Fr_vendas_industria2.UF_Emissor;
    Fr_vendas_industria2.ACBrNFe1.Configuracoes.Geral.FormaEmissao := teNormal;
    Ide.cUF := Fr_vendas_industria2.ACBrNFe1.Configuracoes.WebServices.UFCodigo;
    // 1=produção 2=homologacao
    // frmmontaXml.Nfinalidade_nf := '1'; //
    if (ansiindexstr(Fr_vendas_industria2.Prcod_fiscal.Text, ['5412', '5553', '6412', '6553', '5202', '6202', '5411', '6411', '5918', '5919', '5921', '5209', '6209', '6918', '6919', '6921', '5210', '6210', '5413', '6413', '6556', '5556']) > -1) then
      Ide.finNFe := fnDevolucao
    else
      Ide.finNFe := fnNormal;

    if (Fr_vendas_industria2.Prcod_fiscal.Text = '5915') or (Fr_vendas_industria2.Prcod_fiscal.Text = '6915') then
      Ide.finNFe := fnNormal;

    if (Fr_vendas_industria2.Prcod_fiscal.Text = '5206') or (Fr_vendas_industria2.Prcod_fiscal.Text = '6206') then
      Ide.finNFe := fnNormal;

    if (Ide.tpNF = tnEntrada) and (not Fr_vendas_industria2.PrEntradaNaoDevolucao.checked) then
    begin

      with Ide.NFref.Add do
      begin
        refNFe := Fr_vendas_industria2.PrChave_NFe.Text;
      end;
    end;

    if mform = 'vendas_devolucoes' then
    begin
      if (Fr_vendas_industria2.Lbnom_fop.Caption = 'DEVOLUÇÃO') then
      begin
        Ide.finNFe := fnDevolucao;

        Fr_vendas_industria2.q_NFe_Ref.First;
        while not Fr_vendas_industria2.q_NFe_Ref.Eof do
        begin
          with Ide.NFref.Add do
          begin
            refNFe := Fr_vendas_industria2.q_NFe_RefCHAVE_NFE.AsString;
          end;
          Fr_vendas_industria2.q_NFe_Ref.next;
        end;
      end;
    end;
    { else if tipo = 1 then
      begin
      with ide.NFref.Add do
      begin
      refNFe := Fr_vendas_industria2.PrChave_NFe.Text;
      end;
      end; }
    // frmmontaXml.Nprocesso_Emissao := '0'; //
    Ide.procEmi := peAplicativoContribuinte;

    // emitente
    (* Informações da TAG EMIT... *)
    dao.Geral5('SELECT ' + '  a.CNPJ, ' + '  a.NOM_EMPRESA, a.nfecontigencia, ' + '  a.NOM_FANTASIA, ' + '  a.ENDERECO, ' + '  a.NR_ENDERECO, ' + '  a.COMPLEMENTO, ' + '  a.BAIRRO, ' + '  c.COD_IBGE, ' + '  c.NOM_CIDADE, ' + '  c.UF, ' + '  a.CEP, ' + '  a.FONE, ' + '  a.IE, ' + '  a.ALIQ_ICMS_SIMPLES ' + 'FROM EMPRESA a ' + 'INNER JOIN CIDADES c on (c.COD_CIDADE = a.COD_CIDADE) ' + 'WHERE cod_empresa=' + QuotedStr(Fr_vendas_industria2.Prempresa_faturar.Text));

    if dao.q5.RecordCount > 0 then
    begin

      // frmmontaXml.Ntipo_emissao := '1'; //
      if dao.q5.fieldbyname('NFECONTIGENCIA').AsString <> 'S' then
        Ide.tpEmis := teNormal
      else
        Ide.tpEmis := teSCAN;

      // frmmontaXml.NCNPJ := FRPRI.LimpaCNPJ(dao.Q2.fieldbyname('CNPJ').AsString);
      Emit.CNPJCPF := FRPRI.LimpaCNPJ(dao.q5.fieldbyname('CNPJ').AsString);

      strChaveAcesso := FMFUN.MontaChaveAcessoNFe(Ide.cUF, Ide.dEmi, Emit.CNPJCPF, Ide.modelo, Ide.serie, Ide.nNF, 1, Ide.CNF);

      // strChaveAcesso := Fr_vendas_industria2.PrChave_NFe.Text;
      // frmmontaXml.NNome := FMFUN.AnsiToAscii(dao.Q2.fieldbyname('NOM_EMPRESA').AsString);
      Emit.xNome := FMFUN.AnsiToAscii(dao.q5.fieldbyname('NOM_EMPRESA').AsString);

      // frmmontaXml.NFantasia := FMFUN.AnsiToAscii(dao.Q2.fieldbyname('NOM_FANTASIA').AsString);
      Emit.xFant := FMFUN.AnsiToAscii(dao.q5.fieldbyname('NOM_FANTASIA').AsString);

      (* TAG EnderEMIT... *)
      // frmmontaXml.Nrua := FMFUN.AnsiToAscii(dao.Q2.fieldbyname('ENDERECO').AsString);
      Emit.EnderEmit.xLgr := FMFUN.AnsiToAscii(dao.q5.fieldbyname('ENDERECO').AsString);

      // frmmontaXml.Nnumero := dao.Q2.fieldbyname('NR_ENDERECO').AsString;
      Emit.EnderEmit.nro := dao.q5.fieldbyname('NR_ENDERECO').AsString;

      // frmmontaXml.Ncomplemento := FMFUN.AnsiToAscii(dao.Q2.fieldbyname('COMPLEMENTO').AsString);
      Emit.EnderEmit.xCpl := FMFUN.AnsiToAscii(dao.q5.fieldbyname('COMPLEMENTO').AsString);

      // frmmontaXml.NBairro := FMFUN.AnsiToAscii(dao.Q2.fieldbyname('BAIRRO').AsString);
      Emit.EnderEmit.xBairro := FMFUN.AnsiToAscii(dao.q5.fieldbyname('BAIRRO').AsString);

      // frmmontaXml.Ncod_cidade := dao.Q2.fieldbyname('COD_IBGE').AsString;
      Emit.EnderEmit.cMun := dao.q5.fieldbyname('COD_IBGE').AsInteger;
      Ide.cMunFG := Emit.EnderEmit.cMun;
      // frmmontaXml.Nnom_cidade := FMFUN.AnsiToAscii(dao.Q2.fieldbyname('NOM_CIDADE').AsString);
      Emit.EnderEmit.xMun := FMFUN.AnsiToAscii(dao.q5.fieldbyname('NOM_CIDADE').AsString);

      // frmmontaXml.Nnom_UF := dao.Q2.fieldbyname('UF').AsString;
      Emit.EnderEmit.UF := dao.q5.fieldbyname('UF').AsString;

      // frmmontaXml.NCEP := FRPRI.LimpaCNPJ(dao.Q2.fieldbyname('CEP').AsString);
      Emit.EnderEmit.CEP := strtoint(FRPRI.LimpaCNPJ(dao.q5.fieldbyname('CEP').AsString));

      // frmmontaXml.Ncodigo_Pais := '1058';
      Emit.EnderEmit.cPais := 1058;

      // frmmontaXml.Nnom_Pais := 'Brasil';
      Emit.EnderEmit.xPais := 'Brasil';

      // frmmontaXml.Nfone := FRPRI.LimpaCNPJ(dao.Q2.fieldbyname('FONE').AsString);
      Emit.EnderEmit.fone := FRPRI.LimpaCNPJ(dao.q5.fieldbyname('FONE').AsString);

      // frmmontaXml.Nie := FRPRI.LimpaCNPJ(dao.Q2.fieldbyname('IE').AsString);
      Emit.IE := FRPRI.LimpaCNPJ(dao.q5.fieldbyname('IE').AsString);
      Aliq_ICMS_Simples := dao.q5.fieldbyname('Aliq_ICMS_Simples').AsFloat;
      if not Fr_vendas_industria2.empresa_simples {or (Ide.finNFe = fnDevolucao)} then
        Emit.CRT := crtRegimeNormal
      else
        Emit.CRT := crtSimplesNacional;

    end;

    (* Informações da TAG DEST... *)
    if trim(Fr_vendas_industria2.Prcod_cliente.Text) <> '' then
    begin
      dao.Geral1('select TIP_PESSOA, nom_cliente, cnpj, ie, cpf, endereco, nr_endereco, complemento, bairro, cd.cod_ibge, cd.nom_cidade, cd.uf, cep, telefone from cliente c ' + 'left join cidades cd on cd.cod_cidade=c.cod_cidade ' + 'where cod_cliente=' + QuotedStr(Fr_vendas_industria2.Prcod_cliente.Text));
    end
    else
    begin
      dao.Geral1('select ''J'' AS TIP_PESSOA, c.RAZAO_SOCIAL as nom_cliente, c.CNPCPF as cnpj, null as cpf, c.IERG as ie, endereco, nr_endereco, complemento, bairro, cd.cod_ibge, cd.nom_cidade, cd.uf, cep, fone as telefone from fornecedor c ' + 'left join cidades cd on cd.cod_cidade=c.cod_cidade ' + 'where cod_fornecedor=' + QuotedStr(Fr_vendas_industria2.Prcod_fornecedor.Text));
    end;

    if Ide.tpAmb = taProducao then
    begin
      Dest.EnderDest.UF := dao.q1.fieldbyname('uf').AsString;

      if dao.q1.fieldbyname('TIP_PESSOA').AsString = 'F' then
      begin
        Dest.CNPJCPF := FRPRI.LimpaCNPJ(dao.q1.fieldbyname('cpf').AsString);
        Dest.indIEDest := inIsento;
        if ansiindexstr(Dest.EnderDest.UF, ['AM', 'BA', 'CE', 'GO', 'MG', 'MS', 'MT', 'PE', 'PB', 'RN', 'SE', 'SP']) > 0 then
        begin
          Dest.indIEDest := inNaoContribuinte;
          Ide.indFinal := cfConsumidorFinal;
        end;
      end;

      if dao.q1.fieldbyname('TIP_PESSOA').AsString = 'J' then
      begin

        Dest.CNPJCPF := trim(FRPRI.LimpaCNPJ(dao.q1.fieldbyname('cnpj').AsString));

        if dao.q1.fieldbyname('ie').AsString = 'ISENTO' then
        begin
          Dest.indIEDest := inIsento;
          if ansiindexstr(Dest.EnderDest.UF, ['AM', 'BA', 'CE', 'GO', 'MG', 'MS', 'MT', 'PE', 'RN', 'SE', 'SP']) > 0 then
          begin
            Dest.indIEDest := inNaoContribuinte;
            Ide.indFinal := cfConsumidorFinal;
          end;
        end
        else
          Dest.IE := FRPRI.LimpaCNPJ(dao.q1.fieldbyname('ie').AsString);

      end;

      // frmmontaXml.Nie_destino := FRPRI.LimpaCNPJ(dao.Q1.fieldbyname('ie').AsString);
      // //'ISENTO'; (* Caso o destinatário não tenha Inscrição Estadual coloque a palavra "ISENTO" ...*)
      // cXML.InfNFe.Dest.ISUF := strResultado;

      Dest.xNome := FMFUN.AnsiToAscii(dao.q1.fieldbyname('nom_cliente').AsString);
    end
    else
    begin
      Dest.CNPJCPF := '99999999000191'; // '99999090910270';
      Dest.indIEDest := inIsento;
      Dest.xNome := 'NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL';
      // 'NF-e Associacao NF-e';
    end;

    if cliente_consumidor_final then
      Ide.indFinal := cfConsumidorFinal;

    // 'DISTRIBUIDORA DE AGUAS MINERAIS';
    (* TAG EnderDEST... *)
    // frmmontaXml.Nrua_destino := FMFUN.AnsiToAscii(dao.Q1.fieldbyname('endereco').AsString);
    Dest.EnderDest.xLgr := FMFUN.AnsiToAscii(dao.q1.fieldbyname('endereco').AsString);

    // 'AV DAS FONTES';
    Dest.EnderDest.nro := FMFUN.AnsiToAscii(dao.q1.fieldbyname('nr_endereco').AsString);
    // frmmontaXml.Nnumero_destino := FMFUN.AnsiToAscii(dao.Q1.fieldbyname('nr_endereco').AsString); // '1777';

    if Ncomplemento_destino <> '' then
      // frmmontaXml.Ncomplemento_destino := dao.Q1.fieldbyname('complemento').AsString // '10 ANDAR';
      Dest.EnderDest.xCpl := dao.q1.fieldbyname('complemento').AsString
    else
      Dest.EnderDest.xCpl := 'loja';
    // frmmontaXml.Ncomplemento_destino := 'loja'; // '10 ANDAR';
    // frmmontaXml.NBairro_destino := FMFUN.AnsiToAscii(dao.Q1.fieldbyname('bairro').AsString); // 'PARQUE FONTES';
    Dest.EnderDest.xBairro := FMFUN.AnsiToAscii(dao.q1.fieldbyname('bairro').AsString);

    // frmmontaXml.Ncod_cidade_destino := dao.Q1.fieldbyname('cod_ibge').AsString;
    Dest.EnderDest.cMun := dao.q1.fieldbyname('cod_ibge').AsInteger;
    // '5030801';
    Dest.EnderDest.xMun := FMFUN.AnsiToAscii(dao.q1.fieldbyname('nom_cidade').AsString);
    // frmmontaXml.Nnom_cidade_destino := FMFUN.AnsiToAscii(dao.Q1.fieldbyname('nom_cidade').AsString);
    // 'Sao Paulo';
    Dest.EnderDest.UF := dao.q1.fieldbyname('uf').AsString;
    // frmmontaXml.Nnom_UF_destino := dao.Q1.fieldbyname('uf').AsString; //  'SP';
    // frmmontaXml.NCEP_destino := FRPRI.LimpaCNPJ(dao.Q1.fieldbyname('cep').AsString); // '13950000';
    Dest.EnderDest.CEP := strtoint(FRPRI.LimpaCNPJ(dao.q1.fieldbyname('cep').AsString));

    // frmmontaXml.Ncodigo_Pais := '1058'; //  '1058';
    Dest.EnderDest.cPais := 1058;

    // frmmontaXml.Nnom_Pais := 'BRASIL'; // 'BRASIL';
    Dest.EnderDest.xPais := 'BRASIL'; // 'BRASIL';

    if not dao.q1.fieldbyname('telefone').IsNull then
      // frmmontaXml.NFone_destino := FRPRI.LimpaCNPJ(dao.Q1.fieldbyname('telefone').AsString); //'1932011234';
      Dest.EnderDest.fone := FRPRI.LimpaCNPJ(dao.q1.fieldbyname('telefone').AsString); // '1932011234';
    // mercadoria já estão na unit FRMMontaXML é só definir a variavel Mform

    if Dest.EnderDest.UF = Emit.EnderEmit.UF then
      Ide.idDest := doInterna
    else
      Ide.idDest := doInterestadual;

    vTotalIBS := 0;
    vTotalCBS := 0;

    if ((Ide.finNFe <> fnNormal) and (Ide.finNFe <> fnDevolucao)) and (Fr_vendas_industria2.q_vendas2.IsEmpty) then
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
          if not Fr_vendas_industria2.empresa_simples {or (Ide.finNFe = fnDevolucao)} then
          begin
            Imposto.icms.orig := oeNacional;
            Imposto.icms.cst := cst00;
            Imposto.icms.ModBC := dbiMargemValorAgregado;
            (* Zero é Aceitavél como valor... *)

            Imposto.icms.VBC := Nbase_calculo_icms_tot; // '10000000.00';
            if Fr_vendas_industria2.UF_Cliente = Fr_vendas_industria2.UF_Emissor then
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
          if not Fr_vendas_industria2.empresa_simples {or (Ide.finNFe = fnDevolucao)} then
          begin
            (* TAG ICMS.ICMS60... *)
            Imposto.icms.orig := oeNacional;
            Imposto.icms.cst := cst60;
            Imposto.icms.VBCSTRet := 0;
            Imposto.icms.VICMSSTRet := 0;
            SubstituicaoTributaria := true;
          end
          else
          begin
            Imposto.icms.orig := oeNacional;
            Imposto.icms.CSOSN := csosn500;
            Imposto.icms.VBCSTRet := 0;
            Imposto.icms.VICMSSTRet := 0;
            SubstituicaoTributaria := true;
          end;
        end;
        (* TAG PIS.PISALIQ... *)
        if not Fr_vendas_industria2.empresa_simples {or (Ide.finNFe = fnDevolucao)} then
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
        if not Fr_vendas_industria2.empresa_simples {or (Ide.finNFe = fnDevolucao)} then
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

        if not Fr_vendas_industria2.empresa_simples {or (Ide.finNFe = fnDevolucao)} then
        begin
          Imposto.IBSCBS.CST := cst811;
          Imposto.IBSCBS.cClassTrib := '000001';
          Imposto.IBSCBS.indDoacao := tieSim;

          Imposto.IBSCBS.gIBSCBS.vBC := roundto(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc').AsFloat, (CasasDecimais * (-1))); // '10000000.00';
          Imposto.IBSCBS.gIBSCBS.gIBSUF.pIBSUF := 0.1;
          Imposto.IBSCBS.gIBSCBS.gIBSUF.vIBSUF := roundto(Imposto.IBSCBS.gIBSCBS.vBC * (0.001),-2);

          Imposto.IBSCBS.gIBSCBS.vBC := roundto(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc').AsFloat, (CasasDecimais * (-1))); // '10000000.00';
          Imposto.IBSCBS.gIBSCBS.gCBS.pCBS := 0.9;
          Imposto.IBSCBS.gIBSCBS.gCBS.vCBS := roundto(Imposto.IBSCBS.gIBSCBS.vBC * (0.009),-2);

          // vIBS = vIBSUF + vIBSMun
          Imposto.IBSCBS.gIBSCBS.vIBS := Imposto.IBSCBS.gIBSCBS.gIBSUF.vIBSUF;

          vTotalIBS := vTotalIBS + Imposto.IBSCBS.gIBSCBS.gIBSUF.vIBSUF;
          vTotalCBS := vTotalCBS + Imposto.IBSCBS.gIBSCBS.gCBS.vCBS
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
      while not Fr_vendas_industria2.q_vendas2.Eof do
      begin
        j := j + 1;
        with det.Add do
        begin
          Prod.nItem := j;
          Prod.CProd := Fr_vendas_industria2.q_vendas2.fieldbyname('cod_produto').AsString;
          // '00001';
          Prod.CEAN := Fr_vendas_industria2.q_vendas2.fieldbyname('codigo_barra').AsString;
          (* Se não tiver EAN tem que colocar em Branco... *)
          Prod.XProd := trim(FMFUN.AnsiToAscii(Fr_vendas_industria2.q_vendas2.fieldbyname('nom_produto').AsString)); // 'Agua Mineral';
          Prod.ncm := FMFUN.TratarCodigoNCM(Fr_vendas_industria2.q_vendas2.fieldbyname('ncm').AsString, 1);
          // 'NCM';

          if Fr_vendas_industria2.q_vendas2.fieldbyname('CEST').AsString <> '0' then
            Prod.cest := FMFUN.TratarCodigoNCM(Fr_vendas_industria2.q_vendas2.fieldbyname('CEST').AsString, 1);

          Prod.cfop := Fr_vendas_industria2.q_vendas2.fieldbyname('COD_FISCAL_ITEM').AsString;

          if (Prod.cfop = '5102') or (Prod.cfop = '6102') or (Prod.cfop = '5101') or (Prod.cfop = '6101') then
            SimplesICMS := true
          else
            SimplesICMS := false;

          if tipo = 1 then
          begin
            if not Fr_vendas_industria2.PrEntradaNaoDevolucao.checked  then
               Ide.finNFe := fnDevolucao;

            if Prod.cfop = '5101' then
              Prod.cfop := '1201';

            if Prod.cfop = '5102' then
              Prod.cfop := '1202';

            if Prod.cfop = '6101' then
              Prod.cfop := '2201';

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

            if Prod.cfop = '6202' then
              Prod.cfop := '2202';

            if Prod.cfop = '5202' then
              Prod.cfop := '1202';

            if Prod.cfop = '6551' then
              Prod.cfop := '2551';

            if Prod.cfop = '5551' then
              Prod.cfop := '1551';

            if Prod.cfop = '5152' then
              Prod.cfop := '1202';

            if Prod.cfop = '6152' then
              Prod.cfop := '2202';

          end;

          Prod.UCom := Fr_vendas_industria2.q_vendas2.fieldbyname('unidade').AsString;

          Prod.QCom := Fr_vendas_industria2.q_vendas2.fieldbyname('qtd').AsFloat;
          // '1000000.0000';
          Prod.VUnCom := roundto(Fr_vendas_industria2.q_vendas2.fieldbyname('preco').AsFloat, (CasasDecimais * (-1))); // '1';
          Prod.VProd := roundto(Fr_vendas_industria2.q_vendas2.fieldbyname('preco').AsFloat, (CasasDecimais * (-1))) * Fr_vendas_industria2.q_vendas2.fieldbyname('qtd').AsFloat;
          // '10000000.00';
          Prod.CEANTrib := Fr_vendas_industria2.q_vendas2.fieldbyname('codigo_barra').AsString;
          (* Se não tiver EAN Trib. tem que colocar em Branco... *)
          Prod.UTrib := 'und'; // 'und';
          Prod.QTrib := Fr_vendas_industria2.q_vendas2.fieldbyname('qtd').AsFloat;
          // '12000000.0000';
          Prod.VUnTrib := roundto(Fr_vendas_industria2.q_vendas2.fieldbyname('preco').AsFloat, (CasasDecimais * (-1))); // '1';

          Prod.vDesc := roundto(Fr_vendas_industria2.q_vendas2.fieldbyname('DESCONTO_VALOR_GERAL').AsFloat, (CasasDecimais * (-1)));
          // '1';

          if (j = 1) and (Fr_vendas_industria2.Prtipo_frete.ItemIndex = 2) then
            Prod.vFrete := roundto(Fr_vendas_industria2.Prvl_frete.Value, (CasasDecimais * (-1)));

          // roundto(Fr_vendas_industria2.q_vendas2.fieldbyname('desconto_valor').AsFloat, (CasasDecimais * (-1)));
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
          if (Fr_vendas_industria2.q_vendas2.fieldbyname('trib_icms').AsString = '00') or (Fr_vendas_industria2.q_vendas2.fieldbyname('trib_icms').AsString = '0') then
          begin
            if not Fr_vendas_industria2.empresa_simples {or (Ide.finNFe = fnDevolucao)} then
            begin
              Imposto.icms.cst := cst00;
              Imposto.icms.orig := oeNacional;
              Imposto.icms.ModBC := dbiValorOperacao;
              (* Zero é Aceitavél como valor... *)
              Imposto.icms.VBC := roundto(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc').AsFloat, (CasasDecimais * (-1))); // '10000000.00';
              Imposto.icms.PICMS := Fr_vendas_industria2.q_vendas2.fieldbyname('icms_item').AsFloat;
              // '18.00';
              Imposto.icms.VICMS := Fr_vendas_industria2.q_vendas2.fieldbyname('VLR_ICMS_ITEM').AsFloat;
              {
                Imposto.ICMSUFDest.vBCUFDest      := 0.00;
                Imposto.ICMSUFDest.pFCPUFDest     := 0.00;
                Imposto.ICMSUFDest.pICMSUFDest    := 0.00;
                Imposto.ICMSUFDest.pICMSInter     := 0.00;
                Imposto.ICMSUFDest.pICMSInterPart := 0.00;
                Imposto.ICMSUFDest.vFCPUFDest     := 0.00;
                Imposto.ICMSUFDest.vICMSUFDest    := 0.00;
                Imposto.ICMSUFDest.vICMSUFRemet   := 0.00;
              }
            end
            else
            begin
              Imposto.icms.orig := oeNacional;
              Imposto.icms.CSOSN := csosn101;
              Imposto.icms.ModBC := dbiPauta;
              Imposto.icms.VBC := roundto(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc').AsFloat, (CasasDecimais * (-1)));
              Imposto.icms.PICMS := Fr_vendas_industria2.q_vendas2.fieldbyname('icms_item').AsFloat;
              // '18.00';
              Imposto.icms.VICMS := Fr_vendas_industria2.q_vendas2.fieldbyname('VLR_ICMS_ITEM').AsFloat;
              if SimplesICMS then
                TotICMSSimples := TotICMSSimples + Imposto.icms.VBC;
              // end;
            end;
          end;

          if (Fr_vendas_industria2.q_vendas2.fieldbyname('trib_icms').AsString = '10') then
          begin
            if not Fr_vendas_industria2.empresa_simples {or (Ide.finNFe = fnDevolucao)} then
            begin
              SubstituicaoTributariaRetida := true;
              Imposto.icms.orig := oeNacional;
              Imposto.icms.cst := cst10;
              Imposto.icms.ModBC := dbiMargemValorAgregado;
              (* Zero é Aceitavél como valor... *)
              Imposto.icms.VBC := roundto(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc').AsFloat, -2); // '10000000.00';
              Imposto.icms.PICMS := Fr_vendas_industria2.q_vendas2.fieldbyname('icms_item').AsFloat;
              // '18.00';
              Imposto.icms.VICMS := Fr_vendas_industria2.q_vendas2.fieldbyname('VLR_ICMS_ITEM').AsFloat;

              Imposto.icms.VBCST := roundto(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc_st').AsFloat, (CasasDecimais * (-1)));
              Imposto.icms.vICMSST := roundto(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_icms_st').AsFloat, (CasasDecimais * (-1)));

            end
            else
            begin
              SubstituicaoTributariaRetida := true;
              Imposto.icms.orig := oeNacional;
              Imposto.icms.CSOSN := csosn202;
              Imposto.icms.ModBC := dbiMargemValorAgregado;
              Imposto.icms.VBC := roundto(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc').AsFloat, (CasasDecimais * (-1))); // '10000000.00';
              Imposto.icms.PICMS := Fr_vendas_industria2.q_vendas2.fieldbyname('icms_item').AsFloat;
              // '18.00';
              Imposto.icms.VICMS := Fr_vendas_industria2.q_vendas2.fieldbyname('VLR_ICMS_ITEM').AsFloat;

              Imposto.icms.VBCST := roundto(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc_st').AsFloat, (CasasDecimais * (-1)));
              Imposto.icms.vICMSST := roundto(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_icms_st').AsFloat, (CasasDecimais * (-1)));

              // end;
            end;
          end;

          (* TAG ICMS.ICMS40... *)
          if Fr_vendas_industria2.q_vendas2.fieldbyname('trib_icms').AsString = '40' then
          begin
            if not Fr_vendas_industria2.empresa_simples {or (Ide.finNFe = fnDevolucao)} then
            begin
              Imposto.icms.orig := oeNacional;
              Imposto.icms.cst := cst40;
            end;
          end;

          if Fr_vendas_industria2.q_vendas2.fieldbyname('trib_icms').AsString = '41' then
          begin
            if not Fr_vendas_industria2.empresa_simples {or (Ide.finNFe = fnDevolucao)} then
            begin
              Imposto.icms.orig := oeNacional;
              Imposto.icms.cst := cst41;
            end;
          end;

          if Fr_vendas_industria2.q_vendas2.fieldbyname('trib_icms').AsString = '51' then
          begin
            if (Dest.indIEDest = inContribuinte) then
            begin
              if (Dest.EnderDest.UF = 'RS') and (Emit.EnderEmit.UF = 'RS') then
              begin
                Imposto.icms.orig := oeNacional;
                Imposto.icms.ModBC := dbiValorOperacao;
                (* Zero é Aceitavél como valor... *)
                Imposto.icms.VBC := roundto(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc').AsFloat, (CasasDecimais * (-1))); // '10000000.00';
                Imposto.icms.PICMS := Fr_vendas_industria2.q_vendas2.fieldbyname('icms_item').AsFloat;
                bDiferimento := True;
                Imposto.icms.vICMSOp := Fr_vendas_industria2.q_vendas2.fieldbyname('VLR_ICMS_ITEM').AsFloat;
                Imposto.icms.pDif := 29.41;
                Imposto.icms.vICMSDif := roundto(Imposto.icms.vICMSOp * 0.2941, (CasasDecimais * (-1)));
                Imposto.icms.vICMS := Imposto.icms.vICMSOp - Imposto.icms.vICMSDif;
                vTotalICMSOp := vTotalICMSOp + Imposto.icms.vICMSOp;
                vTotalICMSDif := vTotalICMSDif + Imposto.icms.vICMSDif;
                Imposto.icms.cst := cst51;
                Prod.cBenef := 'RS052158';
              end;

              if (Dest.EnderDest.UF = 'PR') and (Emit.EnderEmit.UF = 'PR') then
              begin
                bDiferimento := True;
                Prod.cBenef := 'PR830001';
                Imposto.icms.cst := cst51;
                Imposto.icms.orig := oeNacional;
                Imposto.icms.ModBC := dbiValorOperacao;
            (* Zero é Aceitavél como valor... *)
                Imposto.icms.VBC := roundto(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc').AsFloat, (CasasDecimais * (-1))); // '10000000.00';
                Imposto.icms.PICMS := Fr_vendas_industria2.q_vendas2.fieldbyname('icms_item').AsFloat;
                Imposto.icms.vICMSOp := Fr_vendas_industria2.q_vendas2.fieldbyname('VLR_ICMS_ITEM').AsFloat;
                Imposto.icms.pDif := 33.33;
                Imposto.icms.vICMSDif := roundto(Imposto.icms.vICMSOp * 0.3333, (CasasDecimais * (-1)));
                Imposto.icms.vICMS := Imposto.icms.vICMSOp - Imposto.icms.vICMSDif;
                vTotalICMSOp := vTotalICMSOp + Imposto.icms.vICMSOp;
                vTotalICMSDif := vTotalICMSDif + Imposto.icms.vICMSDif;
              end;
            end;
          end;

          if not Fr_vendas_industria2.empresa_simples {or (Ide.finNFe = fnDevolucao)} then
          begin
            if Fr_vendas_industria2.q_vendas2.fieldbyname('trib_icms').AsString = '60' then
            begin
              (* TAG ICMS.ICMS60... *)
              Imposto.icms.orig := oeNacional;
              Imposto.icms.cst := cst60;
              Imposto.icms.VBCST := 0;
              // _vendas_industria2.q_vendas2.fieldbyname('vlr_bc_st').AsFloat;
              Imposto.icms.vICMSST := 0;
              // r_vendas_industria2.q_vendas2.fieldbyname('vlr_icms_st').AsFloat;
              SubstituicaoTributaria := true;

              if (not cliente_consumidor_final) then
              begin
                Imposto.icms.VBCSTRet := roundto(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc_st').AsFloat, (CasasDecimais * (-1)));

                if Fr_vendas_industria2.UF_Emissor = 'RS' then
                begin
                  Imposto.icms.pST := Fr_vendas_industria2.q_vendas2.fieldbyname('icms_item').AsFloat;
                  Imposto.icms.vICMSSubstituto := roundto(Prod.VProd * (Fr_vendas_industria2.q_vendas2.fieldbyname('icms_item').AsFloat / 100), (CasasDecimais * (-1)));
                end;

                Imposto.icms.VICMSSTRet := roundto(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_icms_st').AsFloat, (CasasDecimais * (-1)));
              end;

              if cliente_consumidor_final then
              begin
                Imposto.icms.pRedBCEfet := 0;
                Imposto.icms.vBCEfet := Prod.VProd;
                Imposto.icms.pICMSEfet := Fr_vendas_industria2.Aliquota_ICMS_Interno;
                Imposto.icms.vICMSEfet := Prod.VProd * (Imposto.icms.pICMSEfet / 100);
              end;

            end;

            if Fr_vendas_industria2.q_vendas2.fieldbyname('trib_icms').AsString = '90' then
            begin
              (* TAG ICMS.ICMS90... *)
              Imposto.icms.orig := oeNacional;
              Imposto.icms.cst := cst90;
              Imposto.icms.ModBCST := dbisPrecoTabelado;
              Imposto.icms.PMVAST := roundto(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_agr_item').AsFloat, (CasasDecimais * (-1)));
              Imposto.icms.VBCST := roundto(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc_st').AsFloat, (CasasDecimais * (-1)));
              Imposto.icms.PICMSST := 12;
              Imposto.icms.vICMSST := roundto(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_icms_st').AsFloat, (CasasDecimais * (-1)));
              CestaBasica := true;
            end;
          end
          else
          begin
            if Fr_vendas_industria2.q_vendas2.fieldbyname('trib_icms').AsString = '90' then
            begin
              Imposto.icms.orig := oeNacional;
              Imposto.icms.CSOSN := csosn900;
              Imposto.icms.ModBCST := dbisPrecoTabelado;
              Imposto.icms.PMVAST := roundto(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_agr_item').AsFloat, (CasasDecimais * (-1)));
              Imposto.icms.VBCST := roundto(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc_st').AsFloat, (CasasDecimais * (-1)));
              if Fr_vendas_industria2.UF_Cliente <> Fr_vendas_industria2.UF_Emissor then
                Imposto.icms.PICMSST := 12
              else
                Imposto.icms.PICMSST := 17;
              Imposto.icms.vICMSST := roundto(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_icms_st').AsFloat, (CasasDecimais * (-1)));

              // CestaBasica := true;
              SubstituicaoTributaria := true;
            end;
            if Fr_vendas_industria2.q_vendas2.fieldbyname('trib_icms').AsString = '60' then
            begin
              Imposto.icms.orig := oeNacional;
              Imposto.icms.CSOSN := csosn500;
              Imposto.icms.VBCST := 0;
              // Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc_st').AsFloat;
              Imposto.icms.vICMSST := 0;
              // Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_icms_st').AsFloat;
              SubstituicaoTributaria := true;
            end;
            if Fr_vendas_industria2.q_vendas2.fieldbyname('trib_icms').AsString = '40' then
            begin
              Imposto.icms.orig := oeNacional;
              Imposto.icms.CSOSN := csosn400;
            end;

            if (not cliente_consumidor_final) then
            begin
              Imposto.icms.VBCSTRet := roundto(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc_st').AsFloat, (CasasDecimais * (-1)));

              Imposto.icms.pST := Fr_vendas_industria2.Aliquota_ICMS_Interno;
              Imposto.icms.VICMSSTRet := roundto(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_icms_st').AsFloat, (CasasDecimais * (-1)));
            end;

            if cliente_consumidor_final then
            begin
              Imposto.icms.pRedBCEfet := 0;
              Imposto.icms.vBCEfet := Prod.VProd;
              Imposto.icms.pICMSEfet := Fr_vendas_industria2.Aliquota_ICMS_Interno;
              Imposto.icms.vICMSEfet := Prod.VProd * (Imposto.icms.pICMSEfet / 100);
            end;

          end;

          (* TAG IPI... *)
          // Felipe que comentou 22/03/2009
          { cDetLista.Imposto.IPI.ClEnq := Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_icms_st').AsString;
            cDetLista.Imposto.IPI.CNPJProd := Valor;
            cDetLista.Imposto.IPI.CSelo := Valor;
            cDetLista.Imposto.IPI.QSelo := Valor;
          }
          (* TAG IPI.IPITRIB... *)
          if (Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_ipi_item').AsFloat > 0) { and ((Fr_vendas_industria2.q_vendas2.fieldbyname
            ('COD_FISCAL_ITEM').AsString = '5413') or
            (Fr_vendas_industria2.q_vendas2.fieldbyname('COD_FISCAL_ITEM')
            .AsString = '6413')
            { or (Fr_vendas_industria2.q_vendas2.fieldbyname('COD_FISCAL_ITEM').AsString = '5102') or (Fr_vendas_industria2.q_vendas2.fieldbyname('COD_FISCAL_ITEM').AsString = '6102')  ) }
              then
          begin
            Imposto.IPI.CEnq := '999';
            Imposto.IPI.cst := ipi50;
            Imposto.IPI.VBC := roundto(Fr_vendas_industria2.q_vendas2.fieldbyname('sub_total').AsFloat, (CasasDecimais * (-1)));
            Imposto.IPI.PIPI := roundto(Fr_vendas_industria2.q_vendas2.fieldbyname('ipi_item').AsFloat, (CasasDecimais * (-1)));
            Imposto.IPI.VIPI := roundto(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_ipi_item').AsFloat, (CasasDecimais * (-1)));

            roundto(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc_st').AsFloat, (CasasDecimais * (-1)));

          end;

          (* TAG PIS.PISALIQ... *)
          if not Fr_vendas_industria2.empresa_simples {or (Ide.finNFe = fnDevolucao)} then
          begin
            Imposto.PIS.cst := pis01;
            Imposto.PIS.VBC := Fr_vendas_industria2.q_vendas2.fieldbyname('sub_total').AsFloat;
            Imposto.PIS.PPIS := 0.65;
            Imposto.PIS.VPIS := Fr_vendas_industria2.q_vendas2.fieldbyname('sub_total').AsFloat * 0.0065;
          end
          else
          begin
            Imposto.PIS.cst := pis99;
            Imposto.PIS.QBCProd := 0;
            Imposto.PIS.VAliqProd := 0;
            Imposto.PIS.VPIS := 0;
          end;

          if cliente_com_suspensao_pis_cofins then
          begin
            Imposto.PIS.cst := pis09;
            Imposto.PIS.QBCProd := 0;
            Imposto.PIS.VAliqProd := 0;
            Imposto.PIS.VPIS := 0;
          end;

          (* TAG COFINS.COFINSALIQ_CST... *)
          // felipe comentou aqui
          if not Fr_vendas_industria2.empresa_simples {or (Ide.finNFe = fnDevolucao)} then
          begin
            Imposto.COFINS.cst := cof01;
            Imposto.COFINS.VBC := Fr_vendas_industria2.q_vendas2.fieldbyname('sub_total').AsFloat;
            Imposto.COFINS.PCOFINS := 2;
            Imposto.COFINS.VCOFINS := Fr_vendas_industria2.q_vendas2.fieldbyname('sub_total').AsFloat * 0.02;
          end
          else
          begin
            Imposto.COFINS.cst := cof99;
            Imposto.COFINS.QBCProd := 0;
            Imposto.COFINS.VAliqProd := 0;
            Imposto.COFINS.VCOFINS := 0;
          end;

          if cliente_com_suspensao_pis_cofins then
          begin
            Imposto.COFINS.cst := cof09;
            Imposto.COFINS.QBCProd := 0;
            Imposto.COFINS.VAliqProd := 0;
            Imposto.COFINS.VCOFINS := 0;
          end;

          (* TAG ICMS.ICMS40... *)
          if Fr_vendas_industria2.q_vendas2.fieldbyname('trib_icms').AsString = '40' then
          begin
            if not Fr_vendas_industria2.empresa_simples {or (Ide.finNFe = fnDevolucao)} then
            begin
              Imposto.icms.orig := oeNacional;
              Imposto.icms.cst := cst40;
            end;
          end;

          if not Fr_vendas_industria2.empresa_simples {or (Ide.finNFe = fnDevolucao)} then
          begin
            if Fr_vendas_industria2.q_vendas2.fieldbyname('trib_icms').AsString = '60' then
            begin
              (* TAG ICMS.ICMS60... *)
              Imposto.icms.orig := oeNacional;
              Imposto.icms.cst := cst60;
              Imposto.icms.VBCST := 0;
              // Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc_st').AsFloat;
              Imposto.icms.vICMSST := 0;
              Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_icms_st').AsFloat;
              SubstituicaoTributaria := true;

              if (not cliente_consumidor_final) then
              begin
                Imposto.icms.VBCSTRet := roundto(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc_st').AsFloat, (CasasDecimais * (-1)));

                Imposto.icms.pST := Fr_vendas_industria2.Aliquota_ICMS_Interno;
                Imposto.icms.VICMSSTRet := roundto(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_icms_st').AsFloat, (CasasDecimais * (-1)));
              end;

              if cliente_consumidor_final then
              begin
                Imposto.icms.pRedBCEfet := 0;
                Imposto.icms.vBCEfet := Prod.VProd;
                Imposto.icms.pICMSEfet := Fr_vendas_industria2.Aliquota_ICMS_Interno;
                Imposto.icms.vICMSEfet := Prod.VProd * (Imposto.icms.pICMSEfet / 100);
              end;

            end;

            if Fr_vendas_industria2.q_vendas2.fieldbyname('trib_icms').AsString = '90' then
            begin
              (* TAG ICMS.ICMS90... *)
              Imposto.icms.orig := oeNacional;
              Imposto.icms.cst := cst90;
              Imposto.icms.ModBCST := dbisPrecoTabelado;
              Imposto.icms.PMVAST := Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_agr_item').AsFloat;
              Imposto.icms.VBCST := Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc_st').AsFloat;
              Imposto.icms.PICMSST := 12;
              Imposto.icms.vICMSST := Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_icms_st').AsFloat;
              CestaBasica := true;
            end;
          end;

          if (Ide.indFinal = cfConsumidorFinal) and (ansiindexstr(Dest.EnderDest.UF, ['AM', 'BA', 'CE', 'GO', 'MG', 'MS', 'MT', 'PE', 'PB', 'RN', 'SE', 'SP']) > 0) then
          begin

            Imposto.ICMSUFDest.vBCUFDest := roundto(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc').AsFloat, (CasasDecimais * (-1)));
            Imposto.ICMSUFDest.vBCFCPUFDest := 0;
            Imposto.ICMSUFDest.pFCPUFDest := 0;
            Imposto.ICMSUFDest.pICMSUFDest := Fr_vendas_industria2.Aliquota_ICMS_Interno;
            Imposto.ICMSUFDest.pICMSInter := Fr_vendas_industria2.q_vendas2.fieldbyname('icms_item').AsFloat;

            iAno := strtoint(FormatDateTime('yyyy', now));

            case iAno of
              2017:
                Imposto.ICMSUFDest.pICMSInterPart := 60;
              2018:
                Imposto.ICMSUFDest.pICMSInterPart := 80;
            end;
            if iAno >= 2019 then
              Imposto.ICMSUFDest.pICMSInterPart := 100;

            Imposto.ICMSUFDest.vFCPUFDest := 0;
            Imposto.ICMSUFDest.vICMSUFDest := Fr_vendas_industria2.q_vendas2.fieldbyname('VLR_ICMS_ITEM').AsFloat;

          end;

          (* TAG PIS.PISALIQ... *)
          if not Fr_vendas_industria2.empresa_simples {or (Ide.finNFe = fnDevolucao)} then
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

          if cliente_com_suspensao_pis_cofins then
          begin
            Imposto.PIS.cst := pis09;
            Imposto.PIS.QBCProd := 0;
            Imposto.PIS.VAliqProd := 0;
            Imposto.PIS.VPIS := 0;
          end;

          (* TAG COFINS.COFINSALIQ_CST... *)
          // felipe comentou aqui
          if not Fr_vendas_industria2.empresa_simples {or (Ide.finNFe = fnDevolucao)} then
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

          if cliente_com_suspensao_pis_cofins then
          begin
            Imposto.COFINS.cst := cof09;
            Imposto.COFINS.QBCProd := 0;
            Imposto.COFINS.VAliqProd := 0;
            Imposto.COFINS.VCOFINS := 0;
          end;

          if cliente_pronautica or cliente_proemprego then
          begin
            Imposto.icms.VBC := 0;
            Imposto.icms.PICMS := 0;
            Imposto.icms.VICMS := 0;
            Imposto.icms.VBCST := 0;
            Imposto.icms.vICMSST := 0;
          end;

          if not Fr_vendas_industria2.empresa_simples {or (Ide.finNFe = fnDevolucao)} then
          begin
            Imposto.IBSCBS.CST := cst000;
            Imposto.IBSCBS.cClassTrib := '000001';
            Imposto.IBSCBS.indDoacao := tieNenhum;

            Imposto.IBSCBS.gIBSCBS.vBC := roundto(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc').AsFloat, (CasasDecimais * (-1))); // '10000000.00';
            Imposto.IBSCBS.gIBSCBS.gIBSUF.pIBSUF := 0.1;
            Imposto.IBSCBS.gIBSCBS.gIBSUF.vIBSUF := roundto(Imposto.IBSCBS.gIBSCBS.vBC * (0.001),-2);

            Imposto.IBSCBS.gIBSCBS.vBC := roundto(Fr_vendas_industria2.q_vendas2.fieldbyname('vlr_bc').AsFloat, (CasasDecimais * (-1))); // '10000000.00';
            Imposto.IBSCBS.gIBSCBS.gCBS.pCBS := 0.9;
            Imposto.IBSCBS.gIBSCBS.gCBS.vCBS := roundto(Imposto.IBSCBS.gIBSCBS.vBC * 0.009,-2);

            // vIBS = vIBSUF + vIBSMun
            Imposto.IBSCBS.gIBSCBS.vIBS := Imposto.IBSCBS.gIBSCBS.gIBSUF.vIBSUF;

            vTotalIBS := vTotalIBS + Imposto.IBSCBS.gIBSCBS.gIBSUF.vIBSUF;
            vTotalCBS := vTotalCBS + Imposto.IBSCBS.gIBSCBS.gCBS.vCBS
          end;

        end;
        Fr_vendas_industria2.q_vendas2.next;
      end;
    end;

    // Totais
    dao.Geral1('select tot_liquido, valordescontoadic, vlr_desconto_geral, vlr_icms, vlr_bc_icms, vlr_bc_icms_st, vlr_st, vl_frete, vlr_ipi from vendas1 where numdoc=' + QuotedStr(Fr_vendas_industria2.Prnumdoc.Text));

    if not Fr_vendas_industria2.empresa_simples {or (Ide.finNFe = fnDevolucao)} then
    begin
      total.ICMSTot.VBC := roundto(dao.q1.fieldbyname('vlr_bc_icms').AsFloat, (CasasDecimais * (-1)));
      total.ICMSTot.VICMS := roundto(dao.q1.fieldbyname('vlr_icms').AsFloat, (CasasDecimais * (-1)));

      if bDiferimento then
        total.ICMSTot.VICMS := vTotalICMSOp - vTotalICMSDif;
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

    VBCST := roundto(dao.q1.fieldbyname('vlr_bc_icms_st').AsFloat, (CasasDecimais * (-1)));
    VST := roundto(dao.q1.fieldbyname('vlr_st').AsFloat, (CasasDecimais * (-1)));

    if SubstituicaoTributariaRetida then
    begin
      total.ICMSTot.VBCST := VBCST;
      total.ICMSTot.VST := VST;
    end;

    if cliente_pronautica or cliente_proemprego then
    begin
      total.ICMSTot.VBC := 0;
      total.ICMSTot.VICMS := 0;
      total.ICMSTot.VBCST := 0;
      total.ICMSTot.VST := 0;
    end;

    total.ICMSTot.VProd := roundto(dao.q1.fieldbyname('tot_liquido').AsFloat, (CasasDecimais * (-1)));

    if Fr_vendas_industria2.Prtipo_frete.ItemIndex = 2 then
      total.ICMSTot.vFrete := roundto(dao.q1.fieldbyname('vl_frete').AsFloat, (CasasDecimais * (-1)))
    else
      total.ICMSTot.vFrete := 0;

    total.ICMSTot.vSeg := 0;
    total.ICMSTot.vDesc := roundto(dao.q1.fieldbyname('VLR_DESCONTO_GERAL').AsFloat, (CasasDecimais * (-1)));
    // total.ICMSTot.vDesc := 0;
    total.ICMSTot.vII := 0;
    total.ICMSTot.VIPI := roundto(dao.q1.fieldbyname('vlr_ipi').AsFloat, (CasasDecimais * (-1)));
    total.ICMSTot.VPIS := 0;
    total.ICMSTot.VCOFINS := 0;
    total.ICMSTot.vOutro := 0;
    total.ICMSTot.vNF := roundto(dao.q1.fieldbyname('tot_liquido').AsFloat + dao.q1.fieldbyname('vlr_ipi').AsFloat + total.ICMSTot.vFrete + total.ICMSTot.VST - total.ICMSTot.vDesc, (CasasDecimais * (-1)));

    //////////////////////
    Total.ISTot.vIS := roundto(dao.q1.fieldbyname('vlr_bc_icms').AsFloat, (CasasDecimais * (-1)));
    Total.IBSCBSTot.vBCIBSCBS := roundto(dao.q1.fieldbyname('vlr_bc_icms').AsFloat, (CasasDecimais * (-1)));
    Total.IBSCBSTot.gIBS.gIBSUFTot.vIBSUF := vTotalIBS;
    Total.IBSCBSTot.gIBS.vIBS := vTotalIBS;
    Total.IBSCBSTot.gCBS.vCBS := vTotalCBS;

    // Valor total da NF-e com IBS / CBS / IS
    Total.vNFTot := roundto(dao.q1.fieldbyname('vlr_bc_icms').AsFloat, (CasasDecimais * (-1)));
    //////////////////////




    if (Dest.indIEDest = inNaoContribuinte) and (ansiindexstr(Dest.EnderDest.UF, ['AM', 'BA', 'CE', 'GO', 'MG', 'MS', 'MT', 'PE', 'PB', 'RN', 'SE', 'SP']) > 0) then
    begin
      total.ICMSTot.vICMSUFDest := roundto(dao.q1.fieldbyname('vlr_icms').AsFloat, (CasasDecimais * (-1)));
    end;

    if Fr_vendas_industria2.Prtipo_frete.ItemIndex = 2 then
      Transp.ModFrete := mfContaDestinatario
    else
      Transp.ModFrete := mfContaEmitente;

    if Fr_vendas_industria2.Prcod_transportadora.Text <> '' then
    begin
      dao.Geral2('SELECT ' + '  coalesce(a.CNPJ, a.CPF) AS CNPJ, ' + '  a.NOME, ' + '  a.ENDERECO, ' + '  a.BAIRRO, ' + '  c.COD_IBGE, ' + '  c.NOM_CIDADE, ' + 'a.placa,  c.UF, ' + '  a.CEP, ' + '  a.FONE, ' + '  a.IE ' + 'FROM TRANSPORTADORA a ' + 'INNER JOIN CIDADES c on (c.COD_CIDADE = a.COD_CIDADE) ' + 'WHERE cod_transportadora=' + QuotedStr(Fr_vendas_industria2.Prcod_transportadora.Text));

      if dao.q2.RecordCount > 0 then
      begin
        Transp.Transporta.CNPJCPF := FRPRI.LimpaCNPJ(dao.q2.fieldbyname('CNPJ').AsString);
        Transp.Transporta.xNome := FMFUN.AnsiToAscii(dao.q2.fieldbyname('NOME').AsString);
        if not dao.q2.fieldbyname('IE').IsNull then
          Transp.Transporta.IE := FRPRI.LimpaCNPJ(dao.q2.fieldbyname('IE').AsString);
        Transp.Transporta.xEnder := FMFUN.AnsiToAscii(dao.q2.fieldbyname('ENDERECO').AsString);
        Transp.Transporta.xMun := FMFUN.AnsiToAscii(dao.q2.fieldbyname('NOM_CIDADE').AsString);
        Transp.Transporta.UF := dao.q2.fieldbyname('UF').AsString;
        if not dao.q2.fieldbyname('PLACA').IsNull then
        begin
          Transp.veicTransp.placa := dao.q2.fieldbyname('PLACA').AsString;
          Transp.veicTransp.UF := Transp.Transporta.UF;
        end;
      end;
    end
    else
    begin
      Transp.Transporta.CNPJCPF := Dest.CNPJCPF;
      Transp.Transporta.xNome := Dest.xNome;
      Transp.Transporta.IE := Dest.IE;
      Transp.Transporta.xEnder := Dest.EnderDest.xLgr + ', ' + Dest.EnderDest.nro;
      Transp.Transporta.xMun := Dest.EnderDest.xMun;
      Transp.Transporta.UF := Dest.EnderDest.UF;
    end;

    with Transp.Vol.Add do
    begin
      qVol := Fr_vendas_industria2.Prvolume_nota.AsInteger;
      esp := 'VOLUMES';
      marca := 'X';
      pesoL := Fr_vendas_industria2.Prpeso_nota.Value;
      pesoB := Fr_vendas_industria2.Prpeso_nota.Value;
    end;

    if Ide.finNFe = fnNormal then
    begin
      Cheque := false;
      Dinheiro := false;
      Deposito := false;

      i := 0;

      Cobr.fat.vliq := total.ICMSTot.vNF;
      Cobr.fat.nFat := Fr_vendas_industria2.PrNFE.Text;
      Cobr.fat.vDesc := 0;
      Cobr.fat.vOrig := total.ICMSTot.vNF;

      if tipo = 0 then
      begin
        if not Fr_vendas_industria2.q_cr1.IsEmpty then
        begin
          Fr_vendas_industria2.q_cr1.First;
          if Fr_vendas_industria2.q_cr1.fieldbyname('cod_fop').AsString = '1' then
          begin
            Dinheiro := true;
            with pag.Add do
            begin
              tPag := fpDinheiro;
              vPag := Fr_vendas_industria2.q_cr1.fieldbyname('valor').AsFloat;
            end;
          end
          else if (Fr_vendas_industria2.q_cr1.fieldbyname('cod_fop').AsString = '2') or (Fr_vendas_industria2.q_cr1.fieldbyname('cod_fop').AsString = '3') or (Fr_vendas_industria2.q_cr1.fieldbyname('cod_fop').AsString = '4') or (Fr_vendas_industria2.q_cr1.fieldbyname('cod_fop').AsString = '5') or (Fr_vendas_industria2.q_cr1.fieldbyname('cod_fop').AsString = '6') or (Fr_vendas_industria2.q_cr1.fieldbyname('cod_fop').AsString = '33') then
          begin
            if Fr_vendas_industria2.q_cr1.fieldbyname('cod_fop').AsString = '4' then
            begin
              Cheque := true;
              Fr_vendas_industria2.q_cr1.First;
              while not Fr_vendas_industria2.q_cr1.Eof do
              begin
                i := i + 1;
                with pag.Add do
                begin
                  tPag := fpCheque;
                  vPag := Fr_vendas_industria2.q_cr1.fieldbyname('valor').AsFloat;
                end;
                Fr_vendas_industria2.q_cr1.next;
              end;
            end
            else if (Fr_vendas_industria2.q_cr1.fieldbyname('cod_fop').AsString = '2') and (Fr_vendas_industria2.Prcod_prazo_pgto.Text = '7') then
            begin
              Deposito := true;
              with pag.Add do
              begin
                tPag := fpDinheiro;
                vPag := Fr_vendas_industria2.q_cr1.fieldbyname('valor').AsFloat;
              end;
            end
            else
            begin
              while not Fr_vendas_industria2.q_cr1.Eof do
              begin
                i := i + 1;
                with Cobr.Dup.Add do
                begin
                  // NDup := Fr_vendas_industria2.PrNFE.Text + '/' + inttostr(i);
                  NDup := formatfloat('000', i);
                  DVenc := Fr_vendas_industria2.q_cr1.fieldbyname('dtaven').AsDateTime;
                  VDup := Fr_vendas_industria2.q_cr1.fieldbyname('valor').AsFloat;
                end;

                with pag.Add do
                begin
                  tPag := fpDuplicataMercantil;
                  vPag := Fr_vendas_industria2.q_cr1.fieldbyname('valor').AsFloat;
                end;
                Fr_vendas_industria2.q_cr1.next
              end;
            end;
          end
          else
          begin

            while not Fr_vendas_industria2.q_cr1.Eof do
            begin
              i := i + 1;
              with Cobr.Dup.Add do
              begin
                NDup := formatfloat('000', i);
                DVenc := Fr_vendas_industria2.q_cr1.fieldbyname('dtaven').AsDateTime;
                VDup := Fr_vendas_industria2.q_cr1.fieldbyname('valor').AsFloat;
              end;

              with pag.Add do
              begin
                tPag := fpDuplicataMercantil;
                vPag := Fr_vendas_industria2.q_cr1.fieldbyname('valor').AsFloat;
              end;
              Fr_vendas_industria2.q_cr1.next
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
        Dinheiro := true;
        with pag.Add do
        begin
          tPag := fpDinheiro;
          vPag := Fr_vendas_industria2.q_cr1.fieldbyname('valor').AsFloat;
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

    slInfCpl := trim(FMFUN.AnsiToAscii(Fr_vendas_industria2.Probservacoes_nota.Text));

    if tipo = 1 then
      slInfCpl := slInfCpl + 'NF-e de Entrada ref. a NF-e de Saída ' + Fr_vendas_industria2.PrNFE.Text + ' de ' + Fr_vendas_industria2.Prdta_emissao.Text + '.';

    if Ide.finNFe = fnNormal then
    begin
      if (copy(Nnat_operacao, 1, 4) = '5405') or (copy(Nnat_operacao, 1, 4) = '6403') or (copy(Nnat_operacao, 1, 4) = '5102') or (copy(Nnat_operacao, 1, 4) = '6102') or (copy(Nnat_operacao, 1, 4) = '5101') or (copy(Nnat_operacao, 1, 4) = '6101') then
        slInfCpl := slInfCpl + 'Nao aceitamos devolucao sem previa Consulta ao Nosso Dep. Vendas. Favor conferir a mercadoria no ato do recebimento, nao aceitaremos reclamacoes posteriores. ' + 'O nao recebimento dos boletos, nao justifica a falta de pagamento ou dispensa de juros por atraso. Duvidas, entrar em contato antes do vencimento.';

      if Fr_vendas_industria2.empresa_simples and (Ide.finNFe = fnNormal) then
      begin
        // slInfCpl := slInfCpl + '.';
        if TotICMSSimples > 0 then
        begin
          ICMSSimples := TotICMSSimples * (Aliq_ICMS_Simples / 100);
          slInfCpl := slInfCpl + 'Permite o aproveitamento do crédito de ICMS no valor de ' + formatfloat('R$ #,###,##0.00', ICMSSimples) + ' correspondente à alíquota de ' + formatfloat('#0.00%', Aliq_ICMS_Simples) + ', nos termos do Art. 23 da LC 123/2006.';
        end
        else if not ((copy(Nnat_operacao, 1, 4) = '5102') or (copy(Nnat_operacao, 1, 4) = '6102') or (copy(Nnat_operacao, 1, 4) = '5101') or (copy(Nnat_operacao, 1, 4) = '6101')) then
          slInfCpl := slInfCpl + 'Documento emitido por ME ou EPP optante pelo simples nacional. Nao gera direito a credito Fiscal de ICMS. ';
      end
      else
      begin
        if bDiferimento then
        begin
          if Fr_vendas_industria2.UF_Emissor = 'PR' then
            slInfCpl := slInfCpl + 'Operação com diferimento parcial do imposto no valor de ' + formatfloat('R$ #,###,##0.00', vTotalICMSDif) + ' ( 33,33% de ' + formatfloat('R$ #,###,##0.00', vTotalICMSOp) + ') nos termos do inciso I do art.96 do Decreto n° 1.980/07 (RICMS/PR).  ';

          if Fr_vendas_industria2.UF_Emissor = 'RS' then
            slInfCpl := slInfCpl + 'Operação com diferimento parcial do imposto no valor de ' + formatfloat('R$ #,###,##0.00', vTotalICMSDif) + ' ( 29,41% de ' + formatfloat('R$ #,###,##0.00', vTotalICMSOp) + ') nos termos do Art. 1º-K, Livro III do Decreto n° 55.797/2021 RICMS/RS).  ';

        end;

        if (copy(Nnat_operacao, 1, 4) = '6102') and (Fr_vendas_industria2.UF_Cliente = 'RS') then
          slInfCpl := slInfCpl + 'Não incidência do ICMS/ST conforme o Inciso 10 do Artigo 10 e Inciso 2º do Artigo 203 – Livro 3 do RICMS/RS – (Mercadoria destinada a industrialização).';
      end;

      if (trim(Dest.IE) = '') or (trim(Dest.IE) = 'ISENTO') then
        slInfCpl := slInfCpl + 'Imposto retido por Substituicao Tributaria RIMCMS SC/01 Anexo 3. '
      else
      begin
        if CestaBasica then
          slInfCpl := slInfCpl + 'Termos do Art. 26 do RIMCMS/SC Produto Cesta Basica Construcao Civil. ';
        if SubstituicaoTributaria then
        begin
          if Fr_vendas_industria2.UF_Emissor = 'SC' then
            obs_st := 'Imposto retido por Substituicao Tributaria RIMCMS SC/01 Anexo 3. ';

          if Fr_vendas_industria2.UF_Emissor = 'PR' then
            obs_st := 'ICMS recolhido por Substituição Tributária cfe Art. 19 do Anexo X do RICMS-PR ';

          slInfCpl := slInfCpl + obs_st + ' BCST ' + FMFUN.DecimalPonto(formatfloat('##0.00', VBCST)) + ' IST ' + FMFUN.DecimalPonto(formatfloat('##0.00', VST)) + '. ';
        end;
      end;

      if cliente_pronautica then
        slInfCpl := slInfCpl + 'TTD NR 215000003027804 - ICMS/SC-01, Anexo 2, secao XXXVI, assim, no art. 177, inciso II, alinea b - PRAZO TTD INDETERMINADO - TERMO DE CONCESSAO No 215000005589621';

      if cliente_proemprego then
        slInfCpl := slInfCpl + 'TTD Nº 125000000684279 - TERMO DE CONCESSAO Nº125000002249685 PRO-EMPREGO DIFERIMENTO DO ICMS DEVIDO NA AQUISICAO DE BENS DESTINADOS A INTEGRACAO AO '+
                               'ATIVO PERMANENTE, QUANDO ADQUIRIDOS POR EXPORTADORA DENTRO DO ESTADO.';

      if (Nnat_operacao = '1202') or (Nnat_operacao = '2202') or (Nnat_operacao = '1202') or (Nnat_operacao = '2202') then
        slInfCpl := slInfCpl + 'Devolucao de Mercadoria referente a NF. de Saida: ' + Fr_vendas_industria2.PrNFE.Text;

      if Fr_vendas_industria2.transferencia then
      begin
        if Fr_vendas_industria2.UF_Cliente = 'RS' then
          slInfCpl := 'Segundo o Art. 203, inciso I, Livro III do RICMS-RS/97, o ICMS/ST não será incidente nas operações entre estabelecimentos de ' + 'empresas interdependentes e às transferências, que destinem mercadorias a estabelecimento de contribuinte localizado neste Estado, ' + 'exceto se o destinatário for exclusivamente varejista.';

        if Fr_vendas_industria2.UF_Cliente = 'PR' then
          slInfCpl := 'Conforme previsto no inciso II, da cláusula quinta do Convênio ICMS 81/93 em consonância ao disposto na alínea "b", ' + 'do inciso I, do Art. 12, do Anexo X do RICMS-PR/12, não se aplica o regime da substituição tributária nas transferências ' + 'para outro estabelecimento, exceto varejista, do sujeito passivo por substituição, hipótese em que a responsabilidade pela ' + 'retenção e recolhimento do imposto recairá sobre o estabelecimento que promover a saída da mercadoria com destino a empresa diversa.';

      end;
    end;

    infAdic.infCpl := trim(FMFUN.AnsiToAscii(slInfCpl));

    infRespTec.xContato := 'CLAUDIO LUIS TOMASI';
    infRespTec.CNPJ := '10819102000197';
    infRespTec.email := 'cltomasi@gmail.com';
    infRespTec.fone := '47999187025';

    {
      infRespTec.idCSRT :=
      infRespTec.hashCSRT :=
    }
    path := ExtractFilePath(Application.ExeName);
    arquivo_nfe := path + 'nf\';
    arquivo_nfe := arquivo_nfe + strChaveAcesso + '-nfe.xml';

    try
      Fr_vendas_industria2.ACBrNFe1.NotasFiscais.Assinar;
    except
      on e: Exception do
      begin
        erro := true;
        msgerros := e.Message;
        Exit;
      end;
    end;

    cont := 3;
    Synchronize(Mostra);

    path := ExtractFilePath(Application.ExeName);

    cont := 4;
    Synchronize(Mostra);
    // if StrToInt(FRPRI.pValidarXML(arquivo_nfe,path+'schemas\enviNFe_v2.00.xsd',mensagem, msgerros)) > 0 then
    try
      Fr_vendas_industria2.ACBrNFe1.NotasFiscais.Validar;
    except
      msgerros := Fr_vendas_industria2.ACBrNFe1.NotasFiscais.Items[0].Alertas;

      if msgerros = '' then
        msgerros := Fr_vendas_industria2.ACBrNFe1.NotasFiscais.Items[0].ErroValidacaoCompleto
      else
        msgerros := msgerros + #13 + Fr_vendas_industria2.ACBrNFe1.NotasFiscais.Items[0].ErroValidacaoCompleto;

      erro := true;
    end;

    Fr_vendas_industria2.ACBrNFe1.NotasFiscais.Items[0].NomeArq := arquivo_nfe;
    Fr_vendas_industria2.ACBrNFe1.NotasFiscais.GravarXML(arquivo_nfe);

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

    FRPRI.DesabilitaTimers;
    monta_NFE;

    if not erro then
    begin
      GravarChaveNfe;
      EnviarLote(PathLote);
      GravarReciboNfe;
      // TransfereNfeFTP;
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
    FRPRI.HabilitaTimers;
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
    Fr_nfe_transmissao.MsgErro.Enabled := false;
    Fr_nfe_transmissao.MsgErro.Text := msgerros;
    Fr_nfe_transmissao.MsgErro.Height := Fr_nfe_transmissao.Panel1.Height - Fr_nfe_transmissao.MsgErro.Top;
    Fr_nfe_transmissao.lbResultado.Caption := 'Houve erro no processo.';
    Fr_nfe_transmissao.BtnOK.modalresult := mrOk;
    Fr_nfe_transmissao.BtnOK.Enabled := true;
    DeleteFile(arquivo_nfe);
    DeleteFile(arquivo_procnfe);
    DeleteFile(arquivo_ReciboNFe);
  end;

  if finalizado then
  begin
    Fr_nfe_transmissao.lbResultado.Visible := true;
    if msgerros = '' then
      Fr_nfe_transmissao.lbResultado.Caption := 'Processo de Gerar NFe foi concluído com Sucesso.'
    else
      Fr_nfe_transmissao.lbResultado.Caption := 'Houve erro no processo.';
    Fr_nfe_transmissao.refresh;
    Fr_nfe_transmissao.MsgErro.Enabled := false;
    Fr_nfe_transmissao.BtnOK.Enabled := true;
    // sleep(500);
  end;

  Fr_nfe_transmissao.update;
  // Sleep(2000);
end;

procedure TNFePedido.GravarChaveNfe;
begin
  cont := 5;
  Synchronize(Mostra);
  {
  if tipo = 0 then
  begin
    if not Fr_vendas_industria2.q_vendas1.fieldbyname('Chave_NFe').IsNull then
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
    if not Fr_vendas_industria2.q_vendas1.fieldbyname('Chave_NFe_Dev').IsNull then
    begin
      dm.FTPNFe.Connect;
      if dm.FTPNFe.Connected then
      begin
        dm.FTPNFe.Delete(Fr_vendas_industria2.q_vendas1.fieldbyname('Chave_NFe_Dev').AsString + '-nfe.xml');
        dm.FTPNFe.Quit;
      end;
    end;
  end;
  }
  Fr_vendas_industria2.XMLNFe.LoadFromFile(arquivo_nfe);
  Fr_vendas_industria2.XMLNFe.active := true;
  ChaveNfe := Fr_vendas_industria2.XMLNFe.DocumentElement.ChildNodes.FindNode('infNFe').Attributes['Id'];
  ChaveNfe := copy(ChaveNfe, 4, 44);
  try
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;

    if tipo = 0 then
      dao.Execsql('update vendas1 set CHAVE_NFE =' + QuotedStr(ChaveNfe) + ' where numdoc=' + QuotedStr(Fr_vendas_industria2.Prnumdoc.Text))
    else
      dao.Execsql('update vendas1 set CHAVE_NFE_DEV =' + QuotedStr(ChaveNfe) + ' where numdoc=' + QuotedStr(Fr_vendas_industria2.Prnumdoc.Text));

    dao.cn.Commit;

    Fr_vendas_industria2.XMLNFe.active := false;
    Fr_vendas_industria2.PrChave_NFe.Text := ChaveNfe;
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

  destino := copy(ExtractFileName(arquivo_nfe), 1, length(ExtractFileName(arquivo_nfe)) - length(ExtractFileExt(arquivo_nfe))) + '.xml';
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
          destino := copy(ExtractFileName(arquivo_procnfe), 1, length(ExtractFileName(arquivo_procnfe)) - length(ExtractFileExt(arquivo_procnfe))) + '.xml';
          dm.FTPNFe.Put(arquivo_procnfe, destino);

          // desconecta
          dm.FTPNFe.Quit;
          DeleteFile(arquivo_nfe);
          DeleteFile(arquivo_procnfe);
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
  tpAmb: integer;
  smensagem: WideString;

  procedure RecuperarXML;
  var
    vCodUF  : Integer;
    vCnpj   : string;
    vChave  : string;
    ped_xml : TStringList;

  begin
     dao.Geral5('SELECT a.CNPJ FROM EMPRESA a WHERE cod_empresa=' + QuotedStr(Fr_vendas_industria2.Prempresa_faturar.Text));
     vCnpj := FRPRI.LimpaCNPJ(dao.q5.fieldbyname('CNPJ').AsString);
     vCodUF := Fr_vendas_industria2.ACBrNFe1.Configuracoes.WebServices.UFCodigo;
     vChave := Copy(msgerros, Pos('[',msgerros)+1, 100);
     vChave := Copy(vchave, pos(':',vchave)+1, 44);
    try
      Fr_vendas_industria2.ACBrNFe1.DistribuicaoDFePorChaveNFe(vCodUF, vCnpj, vChave);
//     Fr_vendas_industria2.ACBrNFe1.WebServices.DistribuicaoDFe.RetWS

      ped_xml := TStringList.Create;
      if not dao.CN.InTransaction then
        dao.cn.StartTransaction;
      try
        ped_xml.Text := Fr_vendas_industria2.ACBrNFe1.WebServices.DistribuicaoDFe.RetWS;
        ped_xml.SaveToFile('rec.xml');
        Fr_vendas_industria2.qrGravaXml.close;
        Fr_vendas_industria2.qrGravaXml.ParamByName('arquivo').LoadFromFile('rec.xml', ftBlob);
        Fr_vendas_industria2.qrGravaXml.ParamByName('numdoc').value := Fr_vendas_industria2.Prnumdoc.Text;
        Fr_vendas_industria2.qrGravaXml.Open;

        dao.cn.Commit;
        ped_xml.Free;
      except
        dao.cn.Rollback;
        Exit;
      end;
    except
      erro := true;
    end;
{    MemoResp.Lines.Text := ACBrNFe1.WebServices.DistribuicaoDFe.RetWS;
    memoRespWS.Lines.Text := ACBrNFe1.WebServices.DistribuicaoDFe.RetornoWS;

    LoadXML(ACBrNFe1.WebServices.DistribuicaoDFe.RetWS, WBResposta);}
  end;

  procedure GeraArqRec;
  begin
    reciboLst := TStringList.Create;          //  ACBrNFe1.WebServices.Enviar.RetWS
    reciboLst.Add(UTF8Encode(Fr_vendas_industria2.ACBrNFe1.WebServices.Enviar.RetWS));
    reciboLst.SaveToFile(pathSaida + 'ReciboLote.xml');
    reciboLst.Free;
  end;

begin
  cont := 6;
  pathSaida := ExtractFilePath(Application.ExeName) + 'nf\';
  Synchronize(Mostra);
  try
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    dao.Execsql('UPDATE VENDAS1 SET solicitar_emissor = ' + QuotedStr('EMISSAO') + ', status_motivo = null ' +
                ' WHERE numdoc = ' + Fr_vendas_industria2.Prnumdoc.Text);
    dao.cn.Commit;
    Exit;
  except
    on e: Exception do
    begin
      if dao.cn.InTransaction then
        dao.cn.Rollback;
      msgerros := UTF8Encode('Erro ao solicitar emissao: ' + e.Message);
      erro := true;
    end;
  end;
end;

function TNFePedido.GerarXMLProcNFe: boolean;
var
  NomeArquivo, gPathNFe: string;
  prot: WideString;
  ped_xml: TStringList;
begin

  try
    gPathNFe := ExtractFilePath(Application.ExeName) + 'nf\';
    Fr_vendas_industria2.ACBrNFe1.Consultar;
    prot := Fr_vendas_industria2.ACBrNFe1.WebServices.Consulta.Protocolo;
    status := inttostr(dm.ACBrNFe1.WebServices.Consulta.cStat);
    motivo := dm.ACBrNFe1.WebServices.Consulta.XMotivo;

    if prot = '' then
    begin
      Result := false;
      Exit;
    end;

    NomeArquivo := gPathNFe + ChaveNfe + '-procNfe.xml';
    arquivo_procnfe := NomeArquivo;

    Fr_vendas_industria2.ACBrNFe1.NotasFiscais.Items[0].NomeArq := arquivo_procnfe;
    Fr_vendas_industria2.ACBrNFe1.NotasFiscais.GravarXML(arquivo_procnfe);
    {
      if not dm.FTPNFe.Connected then
      dm.FTPNFe.Connect;

      if dm.FTPNFe.Connected then
      begin
      // transfere um arquivo texto
      dm.FTPNFe.TransferType := ftASCII;
      dm.FTPNFe.Put(NomeArquivo, ChaveNfe + '-procNFe.xml');
      // desconecta
      dm.FTPNFe.Quit;
      end;
    }
    try
      if not (dao.cn.InTransaction) then
        dao.cn.StartTransaction;

      ped_xml := TStringList.Create;
      ped_xml.LoadFromFile(NomeArquivo);

      if tipo = 0 then
      begin
        dao.Execsql('UPDATE VENDAS1 SET XML = '''+ped_xml.text+''' WHERE numdoc = '+Fr_vendas_industria2.Prnumdoc.Text);
   {     Fr_vendas_industria2.qrGravaXml.close;
        Fr_vendas_industria2.qrGravaXml.ParamByName('arquivo').LoadFromFile(NomeArquivo, ftBlob);
        Fr_vendas_industria2.qrGravaXml.ParamByName('numdoc').value := Fr_vendas_industria2.Prnumdoc.Text;

        Fr_vendas_industria2.qrGravaXml.Open;   }
      end
      else
      begin
        dao.Execsql('UPDATE VENDAS1 SET XML_DEV = '''+ped_xml.text+''' WHERE numdoc = '+Fr_vendas_industria2.Prnumdoc.Text);
        {
        Fr_vendas_industria2.qrGravaXmlDev.close;
        Fr_vendas_industria2.qrGravaXmlDev.ParamByName('arquivo').LoadFromFile(NomeArquivo, ftBlob);
        Fr_vendas_industria2.qrGravaXmlDev.ParamByName('numdoc').value := Fr_vendas_industria2.Prnumdoc.Text;

        Fr_vendas_industria2.qrGravaXmlDev.Open;
        }
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
  strVersaoDados, strCabecXML, strDados, Protocolo, digest, dataStr: string;
  reciboLst: TStringList;
  data: TDateTime;
  produto_lst, qtd_lst: TStringList;

  procedure SetaData;
  var
    dataarr: TStringList;
    horastr: string;
  begin
    horastr := copy(dataStr, Pos('T', dataStr) + 1, 8);
    dataStr := copy(dataStr, 1, Pos('T', dataStr) - 1);
    dataarr := TStringList.Create;
    dataarr := FMFUN.explode(dataStr, '-');
    dataStr := dataarr[2] + '/' + dataarr[1] + '/' + dataarr[0];
    dataarr.Free;
    data := strtodatetime(dataStr + ' ' + horastr);
  end;

  procedure ConsultaStatusLote(ChaveNfe: string);
  var
    xmlRecibo: IXMLNode;
    SxmlRecibo: TStringList;

    procedure RecuperaChaveNfe(chave: string);
    var
      sqlNfe: string;
    begin

      if tipo = 0 then
        sqlNfe := 'update vendas1 set CHAVE_NFE =' + QuotedStr(ChaveNfe) + ' where numdoc =' + Fr_vendas_industria2.Prnumdoc.Text
      else
        sqlNfe := 'update vendas1 set CHAVE_NFE_DEV =' + QuotedStr(ChaveNfe) + ' where numdoc =' + Fr_vendas_industria2.Prnumdoc.Text;

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
    SxmlRecibo := TStringList.Create;       //42251220846616000195550010000414601075704140-sit
    SxmlRecibo.LoadFromFile(pathSaida + 'ReciboLote.xml');
    SxmlRecibo.Text := StringReplace(SxmlRecibo.Text, 'ç', 'c', [rfReplaceAll]);
    SxmlRecibo.SaveToFile(pathSaida + 'ReciboLote.xml');
    arquivo_ReciboNFe := pathSaida + 'ReciboLote.xml';
    Fr_vendas_industria2.XMLNFe.LoadFromFile(pathSaida + 'ReciboLote.xml');

    if Assigned(Fr_vendas_industria2.XMLNFe.DocumentElement.ChildNodes.FindNode('protNFe')) then
    begin
      xmlRecibo := Fr_vendas_industria2.XMLNFe.DocumentElement.ChildNodes.FindNode('protNFe');
      xmlRecibo.ChildNodes.First;

      status := '';
      motivo := '';
      Protocolo := '';
      digest := '';
      dataStr := '';

      while not (xmlRecibo = nil) do
      begin
        if ChaveNfe = xmlRecibo.ChildNodes.FindNode('infProt').ChildNodes.FindNode('chNFe').Text then
        begin
          status := xmlRecibo.ChildNodes.FindNode('infProt').ChildNodes.FindNode('cStat').Text;
          motivo := xmlRecibo.ChildNodes.FindNode('infProt').ChildNodes.FindNode('xMotivo').Text;
          if status = '100' then
            Protocolo := xmlRecibo.ChildNodes.FindNode('infProt').ChildNodes.FindNode('nProt').Text
          else
          begin
            Protocolo := 'null';
            erro := true;
            msgerros := motivo;
          end;
          if not Fr_vendas_industria2.nfe_duplicada then
            digest := xmlRecibo.ChildNodes.FindNode('infProt').ChildNodes.FindNode('digVal').Text;
          dataStr := xmlRecibo.ChildNodes.FindNode('infProt').ChildNodes.FindNode('dhRecbto').Text;
          SetaData;
          if status = '539' then
          begin
            Fr_vendas_industria2.nfe_duplicada := true;
            RecuperaChaveNfe(motivo);
          end;
        end;
        xmlRecibo := xmlRecibo.NextSibling;
      end;
      // fm_nfe_envio_loteFr_vendas_industria2.XMLNFe.Active := false;
    end;
  end;

  procedure ConsultaStatusNFe(ChaveNfe: string);
  begin
    Fr_vendas_industria2.ACBrNFe1.WebServices.Consulta.NFeChave := ChaveNfe;
    try
      if not Fr_vendas_industria2.ACBrNFe1.WebServices.Consulta.Executar then
      begin
        erro := true;
        msgerros := UTF8Encode(Fr_vendas_industria2.ACBrNFe1.WebServices.Consulta.XMotivo);
      end
      else
      begin
        reciboLst := TStringList.Create;
        reciboLst.Add(UTF8Encode(Fr_vendas_industria2.ACBrNFe1.WebServices.Consulta.retWS));
        reciboLst.SaveToFile(pathSaida + 'Recibo.xml');
        arquivo_ReciboNFe := pathSaida + 'Recibo.xml';
        reciboLst.Free;

        // Fr_vendas_industria2.XMLNFe.Active := true;
        Fr_vendas_industria2.XMLNFe.LoadFromFile(pathSaida + 'Recibo.xml');

        if Assigned(Fr_vendas_industria2.XMLNFe.DocumentElement.ChildNodes.FindNode('chNFe')) then
        begin
          status := '';
          motivo := '';
          Protocolo := '';
          digest := '';
          dataStr := '';

          if ChaveNfe = Fr_vendas_industria2.XMLNFe.DocumentElement.ChildNodes.FindNode('chNFe').Text then
          begin
            status := Fr_vendas_industria2.XMLNFe.DocumentElement.ChildNodes.FindNode('cStat').Text;
            motivo := Fr_vendas_industria2.XMLNFe.DocumentElement.ChildNodes.FindNode('xMotivo').Text;
            if status = '100' then
            begin
              Protocolo := Fr_vendas_industria2.XMLNFe.DocumentElement.ChildNodes.FindNode('protNFe').ChildNodes.FindNode('infProt').ChildNodes.FindNode('nProt').Text;
              digest := Fr_vendas_industria2.XMLNFe.DocumentElement.ChildNodes.FindNode('protNFe').ChildNodes.FindNode('infProt').ChildNodes.FindNode('digVal').Text;
              dataStr := Fr_vendas_industria2.XMLNFe.DocumentElement.ChildNodes.FindNode('protNFe').ChildNodes.FindNode('infProt').ChildNodes.FindNode('dhRecbto').Text;
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
    Fr_vendas_industria2.ACBrNFe1.WebServices.recibo.recibo := recibo;

    try
      if not Fr_vendas_industria2.ACBrNFe1.WebServices.recibo.Executar then
      begin
        erro := true;
        msgerros := UTF8Encode(Fr_vendas_industria2.ACBrNFe1.WebServices.recibo.retWS);
      end
      else
        GerarXMLProcNFe;
    except
      on e: Exception do
      begin
        erro := true;
        msgerros := UTF8Encode(e.Message);
        // ConsultaStatusLote(Fr_vendas_industria2.PrChave_NFe.Text);
      end;
    end;

  end;

{ procedure ImprimirDanfe(chave, protocolo: string; data: TDateTime);
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

  function AtualizaStatusNFe: boolean;
  var
    sqlNfe, Faturado: string;
    x: integer;
  begin
    CarregaStatusLote;
    ConsultaStatusNFe(ChaveNfe);

    if status <> '100' then
    begin
      ConsultaStatusLote(ChaveNfe);
      if status <> '100' then
        Faturado := '0'
      else
      begin
        if ((Fr_vendas_industria2.Prcod_fiscal.Text = '5102') or (Fr_vendas_industria2.Prcod_fiscal.Text = '6102') or (Fr_vendas_industria2.Prcod_fiscal.Text = '5101') or (Fr_vendas_industria2.Prcod_fiscal.Text = '6101') or (Fr_vendas_industria2.Prcod_fiscal.Text = '5405') or (Fr_vendas_industria2.Prcod_fiscal.Text = '6403')) then
          Faturado := '1'
        else
          Faturado := '3';
      end;
    end
    else
    begin
      if ((Fr_vendas_industria2.Prcod_fiscal.Text = '5102') or (Fr_vendas_industria2.Prcod_fiscal.Text = '6102') or (Fr_vendas_industria2.Prcod_fiscal.Text = '5101') or (Fr_vendas_industria2.Prcod_fiscal.Text = '6101') or (Fr_vendas_industria2.Prcod_fiscal.Text = '5405') or (Fr_vendas_industria2.Prcod_fiscal.Text = '6403')) then
        Faturado := '1'
      else
        Faturado := '3';
    end;

    if trim(motivo) = 'Uso Denegado' then
    begin
      Faturado := '5';
      status := '110';
    end;

    if tipo = 0 then
    begin
      sqlNfe := 'update vendas1 set ' + '  RECIBO_NFE =' + QuotedStr(recibo) + ', STATUS_NFE = ' + status + ', MOTIVO_NFE = ' + QuotedStr(motivo);

      if digest <> 'null' then
        sqlNfe := sqlNfe + ' , DIGEST_NFE = ' + QuotedStr(digest);

      if Protocolo <> 'null' then
        sqlNfe := sqlNfe + ' , PROTOCOLO_NFE = ' + QuotedStr(Protocolo);

      sqlNfe := sqlNfe + ', DATA_REC_NFE = ' + QuotedStr(FormatDateTime('dd/mm/yyyy hh:mm:ss', data)) + ', EMAIL_NFE = 0 ' + ', FATURADO     = ' + Faturado + ' where numdoc =' + Fr_vendas_industria2.Prnumdoc.Text;
    end
    else
    begin
      sqlNfe := 'update vendas1 set ' + '  RECIBO_NFE_DEV =' + QuotedStr(recibo) + ', STATUS_NFE_DEV = ' + status + ', MOTIVO_NFE_DEV = ' + QuotedStr(motivo);

      if digest <> 'null' then
        sqlNfe := sqlNfe + ' , DIGEST_NFE_DEV = ' + QuotedStr(digest);

      if Protocolo <> 'null' then
        sqlNfe := sqlNfe + ' , PROTOCOLO_NFE_DEV = ' + QuotedStr(Protocolo);

      sqlNfe := sqlNfe + ', DATA_REC_NFE_DEV = ' + QuotedStr(FormatDateTime('dd/mm/yyyy hh:mm:ss', data)) + ' where numdoc =' + Fr_vendas_industria2.Prnumdoc.Text;

    end;
    try
      if not (dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      dao.Execsql(sqlNfe);
      dao.cn.Commit;
    except
      dao.cn.Rollback;
    end;

    dao.Geral4('SELECT COD_PRODUTO, QTD FROM VENDAS2 WHERE NUMDOC = ' + Fr_vendas_industria2.Prnumdoc.Text);
    dao.q4.First;

    produto_lst := TStringList.Create;
    qtd_lst := TStringList.Create;

    while not dao.q4.Eof do
    begin
      produto_lst.Add(dao.q4.fieldbyname('COD_PRODUTO').AsString);
      qtd_lst.Add(dao.q4.fieldbyname('QTD').AsString);
      dao.q4.next;
    end;

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

  Fr_vendas_industria2.XMLNFe.active := true;
  Fr_vendas_industria2.XMLNFe.LoadFromFile(pathSaida + 'ReciboLote.xml');
  recibo := Fr_vendas_industria2.XMLNFe.DocumentElement.ChildNodes.FindNode('nRec').Text;
  Fr_vendas_industria2.XMLNFe.active := false;
  // DeleteFile(pathSaida + 'ReciboLote.xml');

  AtualizaStatusNFe;

end;

procedure TFr_vendas_industria2.CarregaFoto(produto: string);
begin
  if not (dao.cn.InTransaction) then
    dao.cn.StartTransaction;

  q_foto.close;
  q_foto.ParamByName('produto').value := produto;
  q_foto.Open;

  zzreal.Value := q_foto.fieldbyname('QTD_ESTOQUE').AsFloat;
  zzreservado.Value := q_foto.fieldbyname('QTD_RESERVADO').AsFloat;
  zztotal.Value := q_foto.fieldbyname('QTD_TOTAL').AsFloat;
  Zzcusto.Value := mmVendas2PRECO_CUSTO.Value;
  // showmessage('1');
  Zztot_custo.Value := mmVendas2PRECO_CUSTO.Value * mmVendas2QTD.Value;
  if Zztot_custo.Value > 0 then
    zz_lucro_produto.Value := ((mmVendas2SUB_TOTAL.Value / Zztot_custo.Value) - 1) * 100
  else
    zz_lucro_produto.Value := 0;
  // showmessage('2');

  zzunidade.Text := q_foto.fieldbyname('UNIDADE').AsString;
  zzqtd_embalagem.Value := q_foto.fieldbyname('QTD_EMBALAGEM').AsFloat;

  if q_foto.fieldbyname('imagem_bd').IsNull then
  begin
    Foto.Picture := nil;
    Exit;
  end;

  try
    TBlobField(q_foto.fieldbyname('imagem_bd')).SaveToFile('foto.jpg');
    Foto.Picture.LoadFromFile('foto.jpg');
    DeleteFile('foto.jpg');
  except
    TBlobField(q_foto.fieldbyname('imagem_bd')).SaveToFile('foto.bmp');
    Foto.Picture.LoadFromFile('foto.bmp');
    DeleteFile('foto.bmp');
  end;

end;

function TFr_vendas_industria2.ChecarDataUltConsultaSerasa: boolean;
begin
  if (UltConsSerasa + 180 < today) { and not ChecarPedidoLiberado } then
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
      Result := false; }
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
    Exit;
  end;

  if (margem_lucro_minima > margem_lucro) and not ChecarPedidoLiberado then
  begin
    if FMFUN.Dc_MessageDlg('Pedido com Margem de Lucro Abaixo da Margem Mínima. Favor solicitar Liberação?', mtConfirmation, [mbYes, mbno], 0, mrno) = mryes then
      Result := SolicitaLiberacao
    else
    begin
      Result := false;
      Exit;
    end;
  end
  else
    Result := true;
end;

function TFr_vendas_industria2.ChecarLiberacao: boolean;
begin
  if trim(Prcod_cliente.Text) = '' then
    Exit;

  { dao.Geral1('Select ' +
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
    Exit;
  end;

  if cliente_com_pendencia and not ChecarPedidoLiberado and not Pedido_AVista then
  begin
    if FMFUN.Dc_MessageDlg('Cliente com Pendência. Efetue a baixa do pagamentos das Faturas em Aberto. Ou Solicitar Liberação?', mtConfirmation, [mbYes, mbno], 0, mrno) = mryes then
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
  pathSaida: string;
  IsComplementar: Boolean;
begin
  pathSaida := ExtractFilePath(Application.ExeName) + 'nf\';

  IsComplementar := (prTipoNFe.ItemIndex = 1);

  if not IsComplementar then
  begin
    LiberaItemRepetido := false;
    if itens_repetidos then
    begin
      if MessageDlg('Produto incluído no Pedido mais de uma vez. Desejas continuar?', mtConfirmation, [mbYes, mbno], 0) = mrno then
        Exit
      else
        LiberaItemRepetido := true;
    end;

    if not ChecarDadosPedido then
      Exit;

    nfe_duplicada := false;
    Pc_vendas.TabIndex := 0;

    if mform <> 'vendas_devolucoes' then
      if not ChecarLiberacao then
        Exit;

    if not ClienteAceitaSimples then
      Exit;

    if obrigatoriedade_peso and (Prpeso_nota.Value = 0) then
    begin
      showmessage('Não pode Emitir Nota Fiscal com Peso igual a Zero.');
      Exit;
    end;

    if Prorcamento.ItemIndex = 1 then
    begin
      showmessage('Não pode Faturar Orçamentos!');
      Exit;
    end;

    if mform = 'vendas_devolucoes' then
    begin
      if (trim(Probservacoes_nota.Text) = '') and (ansiindexstr(Prcod_fiscal.Text, ['5412', '5553', '6412', '6553', '5202', '6202', '5411', '6411', '5918', '5919', '5921', '5209', '6209', '6918', '6919', '6921', '5210', '6210', '5413', '6413', '6556', '5556']) > -1) then
      begin
        dao.msg('O campo Observações da Nota deve ser Preenchido');
        BtaltpedClick(Self);
        Pc_vendas.TabIndex := 1;
        Probservacoes_nota.SetFocus;
        Exit;
      end;

      if q_NFe_Ref.IsEmpty and (ansiindexstr(Prcod_fiscal.Text, ['5412', '5553', '6412', '6553', '5202', '6202', '5411', '6411', '5918', '5919', '5921', '5209', '6209', '6918', '6919', '6921', '5210', '6210', '5413', '6413', '6556', '5556']) > -1) then
      begin
        dao.msg('Chave de Referência deve ser preenchida!');
        Pc_vendas.ActivePage := TaNFe;
        pgNFE.ActivePage := TabNfeRef;

        Exit;
      end;

    end;
    if (Prtipo_frete.ItemIndex = 0) then
    begin
      dao.msg('O campo Tipo de Frete deve ser Preenchido');
      BtaltpedClick(Self);
      Pc_vendas.TabIndex := 1;
      Prtipo_frete.SetFocus;
      Exit;
    end;

    if (Prcod_representante.Text = '') and venda then
    begin
      dao.msg('O campo Representante deve ser Preenchido');
      BtaltpedClick(Self);
      Pc_vendas.TabIndex := 0;
      Prcod_representante.SetFocus;
      Exit;
    end;

    if venda then
    begin
      if Prcod_cliente.Text = '' then
      begin
        dao.msg('Campo Cliente deve ser Preenchido!');
        BtaltpedClick(Self);
        Pc_vendas.TabIndex := 0;
        Prcod_cliente.SetFocus;
        Exit;
      end;
    end
    else
    begin
      if (Prcod_cliente.Text = '') and (Prcod_fornecedor.Text = '') then
      begin
        dao.msg('Campo Cliente ou Fornecedor deve ser Preenchido!');
        BtaltpedClick(Self);
        Pc_vendas.TabIndex := 0;
        Prcod_cliente.SetFocus;
        Exit;
      end;
    end;

    if not ChecarDadosCliente then
      Exit;

    if not ChecarDadosTransportadora then
      Exit;

    if (Prcod_fop.Text = '') and venda then
    begin
      dao.msg('O campo Forma de Pagamento deve ser Preenchido');
      BtaltpedClick(Self);
      Pc_vendas.TabIndex := 0;
      Prcod_fop.SetFocus;
      Exit;
    end;

    if (Prcod_prazo_pgto.Text = '') and venda then
    begin
      dao.msg('O campo Prazo Pagamento deve ser Preenchido');
      BtaltpedClick(Self);
      Pc_vendas.TabIndex := 0;
      Prcod_prazo_pgto.SetFocus;
      Exit;
    end;

    if Prempresa_faturar.Text = '' then
    begin
      dao.msg('O campo Empresa deve ser Preenchido');
      BtaltpedClick(Self);
      Pc_vendas.TabIndex := 1;
      Prempresa_faturar.SetFocus;
      Exit;
    end;

    if Prcod_fiscal.Text = '' then
    begin
      dao.msg('O campo Código Fiscal deve ser Preenchido');
      BtaltpedClick(Self);
      Pc_vendas.ActivePage := tab_finalizar;
      Prcod_fiscal.SetFocus;
      Exit;
    end;

    if (Lbnom_fop.Caption = 'BOLETO') and (trim(PrCONTA_BOLETO.Text) = '') then
    begin
      dao.msg('Na forma de pagamento BOLETO. O campo Banco CC Boleto deve ser preenchido.');
      Pc_vendas.ActivePage := tab_mercadorias;
      BtaltpedClick(Self);
      PrCONTA_BOLETO.SetFocus;
      Exit;
    end;

    if mmVendas2.RecordCount = 0 then
    begin
      dao.msg('O Pedido não pode ser Gravado sem Mercadorias Lançadas');
      Exit;
    end;

  { if not habilita_faturamento and (FRPRI.TipUsu < '4') then
    begin
    showmessage('Há itens do Pedido com Desconto acima do Permitido');
    exit;
    end; }

    if cliente_com_pendencia and (FRPRI.TipUsu < '3') then
    begin
      showmessage('Cliente com pendências financeira não pode ser faturado!');
      Exit;
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

    if Faturado then
    begin
      dao.msg('PEDIDO JÁ FATURADO OU CANCELADO!');
      Exit;
    end;

    Mostra := true;
  { ChecarFaturamentoLiquido((prtot_liquido.Value - Zztot_custo.Value), Zztot_custo.Value);
    if not liberado then
    begin
    exit;
    end; }
{  Prempresa_faturar.ReadOnly := false;
  if trim(PrNFE.Text) = '' then
  begin
    for x := 1 to 2 do
    begin
      dao.Geral4('select CASE WHEN MAX(Nota) IS NULL THEN 1 ELSE MAX(Nota)+1 END AS NFE from ' +
                 ' ( SELECT NFE as  nota FROM VENDAS1 WHERE EMPRESA_FATURAR = ' + Prempresa_faturar.Text +
                 ' union SELECT NFE_dev as nota FROM VENDAS1 WHERE EMPRESA_FATURAR = ' + Prempresa_faturar.Text +
                 ') q1 ');

      PrNFE.Text := dao.q4.fieldbyname('NFE').AsString;
    end;

    try
      if not (dao.cn.InTransaction) then
        (dao.cn.StartTransaction);
      dao.Execsql('update vendas1 set nfe=' + QuotedStr(PrNFE.Text) + ' where numdoc=' + QuotedStr(Prnumdoc.Text));
      dao.cn.Commit;
      Prempresa_faturar.ReadOnly := true;
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

  /// Fr_nfe_transmissao.BtnOK.Enabled := true;
  FRPRI.Habilita_Consultas := false;

  Fr_nfe_transmissao.ShowModal;
  if Fr_nfe_transmissao.modalresult = mrOk then
  begin
    FRPRI.Habilita_Consultas := true;
    CarregaDados;

    if (PrProcesso_id.Text = '') then
    begin
      PrProcesso_id.Text := FMFUN.GerarProcessoPedido;
      dao.Execsql('UPDATE VENDAS1 A SET PROCESSO_ID = ' + PrProcesso_id.Text + ' WHERE NUMDOC = ' + Prnumdoc.Text);
    end;

    if PrStatus_Nfe.Text = '539' then
    begin
      DeleteFile(pathSaida + PrChave_NFe.Text + '.xml');
      PrChave_NFe.Text := copy(PrMotivo_nfe.Text, Pos('chNFe:', PrMotivo_nfe.Text) + 6, 44);
      if not dao.cn.InTransaction then
        dao.cn.StartTransaction;
      dao.Execsql('update vendas1 set chave_nfe = ' + QuotedStr(PrChave_NFe.Text) + ' where numdoc = ' + Prnumdoc.Text);
      dao.cn.Commit;

      LimparBoletos;

      //btXMLClick(Self);
      // CarregaDados;

    end
    else if PrStatus_Nfe.Text = '110' then
    begin
      if not dao.cn.InTransaction then
        dao.cn.StartTransaction;
      FMFUN.GravarProcessoPedido('NFE DENEGADA', PrProcesso_id.Text, Prnumdoc.Text);
      dao.cn.Commit;

      LimparBoletos;
    end
    else if PrStatus_Nfe.Text = '100' then
    begin
      // EnviarEmailNfe := true;
      ImprimirDanfe(PrChave_NFe.Text);

    end;
    }
  end;

  try
    if not (dao.cn.InTransaction) then
      (dao.cn.StartTransaction);
    dao.Execsql('update vendas1 set status_emissor = ''AGUARDANDO'', solicitar_emissor = ''EMISSAO'', status_motivo = null where numdoc=' + QuotedStr(Prnumdoc.Text));
    dao.cn.Commit;
    Prempresa_faturar.ReadOnly := true;
  except
    dao.cn.Rollback;
  end;

  try
    Application.CreateForm(TFr_status_emissor, Fr_status_emissor);
    Fr_status_emissor.StartWait('NFE', Prnumdoc.Text, 'EMITIR');
    Fr_status_emissor.ShowModal;
  finally
    if Assigned(Fr_status_emissor) then
      Fr_status_emissor := nil;

    CarregaDados;
    if PrStatus_Nfe.Text = '100' then
    begin
      try
        ImprimirDanfe(PrChave_NFe.Text);
      finally
        try
          BtnBoletoClick(self);
        finally
          try
            if MessageDlg('Deseja Imprimir as Etiquetas de Transportadora?', mtConfirmation, [mbYes, mbno], 0) = mryes then
              ImprimirEtiquetadeTransporte1Click(Self);
          finally
            BtnEmailNFeClick(Self);
          end;
        end;
      end;
    end;
  end;

  LiberaItemRepetido := false;
  StatusPedido;
  Pc_vendas.TabIndex := 3;
end;

procedure TFr_vendas_industria2.CarregaDados;
begin
  ativa_vendas1(Prnumdoc.Text);
  mostra_campos_vendas1('Pr');
  StatusPedido;
  q_vendas1.Open;
  {if (q_vendas1.fieldbyname('status_nfe').AsString <> '539') and not ((q_vendas1.fieldbyname('faturado').AsString = '1') or (q_vendas1.fieldbyname('faturado').AsString = '3')) then
    LimparBoletos;}

  ativa_vendas2(Prnumdoc.Text);
  ativa_cr1(Prnumdoc.Text);
  DadosCCe;

  Mostra := false;
  carrega_vendas2;
  Pc_vendas.ActivePage := tab_mercadorias;
  prTipoNFeChange(Self);
end;

procedure TFr_vendas_industria2.BtnEditarCancelamentoNFeClick(Sender: TObject);
begin
  PrJUSTIF_CANC_NFE.ReadOnly := false;
  PrJUSTIF_CANC_NFE.Enabled := true;
  PrJUSTIF_CANC_NFE.SetFocus;
  PrMOTIVO_NFE_CANCEL_INTERNO.ReadOnly := false;
  PrMOTIVO_NFE_CANCEL_INTERNO.Enabled := true;
end;

procedure TFr_vendas_industria2.BtnovpedClick(Sender: TObject);
var
  linhas_grid: integer;
begin
  if BtnEnviarPedido.Visible then
    BtnEnviarPedido.Enabled := false;

  if Btaltped.Enabled and (Prnumdoc.Text <> '') then
    LiberarPedido(Prnumdoc.Text);

  desconto_forma := 0;
  desconto_prazo := 0;
  // BtnAltFormaPrazo.Visible := false;
  mmVendas2.Cancel;
  readonly_true('Me');
  status.Caption := '...';

  GravarPedido := false;
  HabilitaBotoesPedido(0);
  BtnNFE.Enabled := false;

  promocao_desconto := true;

  Prcod_carga.Enabled := false;
  Pc_vendas.ActivePage := tab_mercadorias;
  limpa_campos('Pr');
  // limpa_campos('Me');
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
  Prtipo_frete.Text := '1';

  if not (dao.cn.InTransaction) then
    (dao.cn.StartTransaction);
  sbvendas.Panels.Items[0].Text := 'INSERIR';
  btnov.Enabled := true;
  btalt.Enabled := false;
  Prcod_representante.SetFocus;

  if (FRPRI.TipUsu = '0') then
  begin
    Prcod_representante.Text := FRPRI.Representante_id;
    Prcod_representanteExit(Self);
    Prcod_representante.ReadOnly := true;
  end;

  { if FRPRI.TeleVendas then
    begin
    Prcod_supervisor.Text := FRPRI.Representante_id;
    Prcod_supervisorExit(Self);
    Prcod_supervisor.ReadOnly := true;
    Prcod_representante.ReadOnly := true;
    end; }

  Prtipo_frete.ItemIndex := 1;
  Prconsignacao.ItemIndex := 0;
  Prorcamento.ItemIndex := 0;
  Prempresa_faturar.ReadOnly := false;
  q_pedidos_agrupar.close;
  TaAgrupar.TabVisible := false;
  liberar_margem := false;
end;

procedure TFr_vendas_industria2.BtnSairCancelamentoNFeClick(Sender: TObject);
begin
  PrJUSTIF_CANC_NFE.Clear;
  PrJUSTIF_CANC_NFE.ReadOnly := true;
  PrJUSTIF_CANC_NFE.Enabled := false;

  PrMOTIVO_NFE_CANCEL_INTERNO.Clear;
  PrMOTIVO_NFE_CANCEL_INTERNO.ReadOnly := true;
  PrMOTIVO_NFE_CANCEL_INTERNO.Enabled := false;

  BtnEnviarCancelamentoNFe.Enabled := false;
  BtnSairCancelamentoNFe.Enabled := false;
end;

procedure TFr_vendas_industria2.BtnEnviarCancelamentoNFeClick(Sender: TObject);
var
  CancelNFe: TNFeCancel;
begin
  if trim(PrJUSTIF_CANC_NFE.Text) = '' then
  begin
    dao.msg('Para o Cancelamento da NF-e, é necessário informar a Justificativa!');
    PrJUSTIF_CANC_NFE.SetFocus;
    Exit;
  end;


  if trim(PrMOTIVO_NFE_CANCEL_INTERNO.Text) = '' then
  begin
    dao.msg('Para o Cancelamento da NF-e, é necessário informar a Justificativa Interna!');
    PrMOTIVO_NFE_CANCEL_INTERNO.SetFocus;
    Exit;
  end;

(*
  try
    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;

    if (PrProcesso_id.Text = '') then
    begin
      PrProcesso_id.Text := FMFUN.GerarProcessoPedido;
      dao.Execsql('UPDATE VENDAS1 A SET PROCESSO_ID = ' + PrProcesso_id.Text + ' WHERE NUMDOC = ' + Prnumdoc.Text);
    end;

    dao.Execsql('UPDATE VENDAS1 SET MOTIVO_NFE_CANCEL_INTERNO = ' + QuotedStr(PrMOTIVO_NFE_CANCEL_INTERNO.Text) + ', JUSTIF_CANC_NFE = ' + QuotedStr(PrJUSTIF_CANC_NFE.Text) + ' WHERE NUMDOC = ' + Prnumdoc.Text);
    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;

  Application.CreateForm(TFr_nfe_transmissao, Fr_nfe_transmissao);
  CancelNFe := TNFeCancel.Create(PrChave_NFe.Text, FMFUN.AnsiToAscii(PrJUSTIF_CANC_NFE.Text), PrPROTOCOLO_NFE.Text, true);
  Fr_nfe_transmissao.lbResultado.Caption := 'Cancelamento da Nota Fiscal';

  Fr_nfe_transmissao.sCheckBox1.Visible := true;
  Fr_nfe_transmissao.sCheckBox1.Caption := 'Buscar Certificado.';

  Fr_nfe_transmissao.sCheckBox2.Visible := true;
  Fr_nfe_transmissao.sCheckBox2.Caption := 'Enviando Solicitação de Cancelamento da NFe.';

  Fr_nfe_transmissao.sCheckBox3.Visible := true;
  Fr_nfe_transmissao.sCheckBox3.Caption := 'Consultando Recibo de Cancelamento da NFe.';

  Fr_nfe_transmissao.Gauge1.MaxValue := 3;
  Fr_nfe_transmissao.Height := Fr_nfe_transmissao.Height + (16 * 3);
  Fr_nfe_transmissao.Gauge1.Progress := 0;

  Fr_nfe_transmissao.ShowModal;

  if Fr_nfe_transmissao.modalresult = mrOk then
  begin

    //if dao.cn.InTransaction then
      dao.cn.StartTransaction;
    FMFUN.GravarProcessoPedido('CANCELADO', PrProcesso_id.Text, Prnumdoc.Text);
    dao.cn.Commit;

    ativa_vendas1(Prnumdoc.Text);
    ativa_vendas2(Prnumdoc.Text);
    mostra_campos_vendas1('Pr');
    carrega_vendas2;
    StatusPedido;
    Pc_vendas.ActivePage := TaNFe;

    if MessageDlg('Desejas Clonar o Pedido Cancelado?', mtConfirmation, [mbYes, mbno], 0) = mryes then
      ClonarPedidoCancelado;
  end;
  *)

    try
      if not (dao.cn.InTransaction) then
        (dao.cn.StartTransaction);
      dao.Execsql('update vendas1 set status_emissor = ''AGUARDANDO'', solicitar_emissor = ''CANCELAMENTO'', status_motivo = null, justif_canc_nfe = ' + QuotedStr(PrJUSTIF_CANC_NFE.Text) + ' where numdoc=' + QuotedStr(Prnumdoc.Text));
      dao.cn.Commit;
      Prempresa_faturar.ReadOnly := true;
    except
      dao.cn.Rollback;
    end;


  try
    Application.CreateForm(TFr_status_emissor, Fr_status_emissor);
    Fr_status_emissor.StartWait('NFE', Prnumdoc.Text, 'CANCELAMENTO');
    Fr_status_emissor.ShowModal;
  finally
    if Assigned(Fr_status_emissor) then
      Fr_status_emissor := nil;
    CarregaDados;
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
    id_pedido := dao.insert('Pr', 'vendas1', 'numdoc', Fr_vendas_industria2, 'gen_venda1');
    dao.cn.Commit;

    novo_numdoc := id_pedido;
  except
    dao.cn.Rollback;
  end;

  mmVendas2.First;
  mmVendas2.DisableControls;
  try
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    WindowList := DisableTaskWindows(fm_splash.Handle);
    fm_splash.ggProgress.MaxValue := mmVendas2.RecordCount;
    fm_splash.lbStatus.Caption := 'Clonando os Itens do Pedido...';
    fm_splash.ggProgress.Progress := 0;
    fm_splash.Show;

    carregando_item := true;
    Pc_vendas.TabIndex := 0;
    pnWait.Visible := true;
    while not mmVendas2.Eof do
    begin
      checar_qtd := false;
      mmVendas2.Edit;

      if mform = 'vendas_industria' then
      begin
        GravarPedido := true;
        Mecod_produtoExit(Self);
        btgraClick(Self);
      end;

      if mmVendas2CESTA_BASICA.Value then
        cesta_basica := 'S'
      else
        cesta_basica := 'N';

      if mmVendas2COD_SUPERVISOR.AsString = '' then
        supervisor := ', null'
      else
        supervisor := ', ' + QuotedStr(mmVendas2COD_SUPERVISOR.AsString);

      if mmVendas2VLR_COMISSAO.AsString = '' then
        vlr_comissao := ', null'
      else
        vlr_comissao := ', ' + FMFUN.BuscaTroca(mmVendas2VLR_COMISSAO.AsString, ',', '.');

      if mmVendas2PERC_COMISSAO.AsString = '' then
        perc_comissao := ', null'
      else
        perc_comissao := ', ' + FMFUN.BuscaTroca(mmVendas2PERC_COMISSAO.AsString, ',', '.');

      sql_vendas2 := 'INSERT INTO VENDAS2 (NUMDOC, COD_PRODUTO, QTD, ' + ' PRECO, PRECO_CUSTO, SUB_TOTAL, DESCONTO, VOLUME, PRECO_BRUTO, PERC_COMISSAO, VLR_COMISSAO, ' + ' COD_FISCAL_ITEM, ICMS_ITEM, VLR_ICMS_ST, VLR_BC_ST, VLR_ICMS_ITEM, NCM, VLR_BC, IPI_ITEM, VLR_IPI_ITEM, ' + ' VLR_AGR_ITEM, TRIB_ICMS, CESTA_BASICA, COD_SUPERVISOR, PROMOCAO, CEST, DESCONTO_VALOR_GERAL) ' + ' VALUES (' + novo_numdoc + ', ' + mmVendas2COD_PRODUTO.AsString + ', ' + FMFUN.BuscaTroca(mmVendas2QTD.AsString, ',', '.') + ', ' +
        FMFUN.BuscaTroca(mmVendas2PRECO_LIQUIDO.AsString, ',', '.') + ', ' + FMFUN.BuscaTroca(mmVendas2PRECO_CUSTO.AsString, ',', '.') + ', ' + FMFUN.BuscaTroca(mmVendas2SUB_TOTAL.AsString, ',', '.') + ', ' + FMFUN.BuscaTroca(mmVendas2DESCONTO.AsString, ',', '.') + ', ' + FMFUN.BuscaTroca(mmVendas2VOLUME.AsString, ',', '.') + ', ' + FMFUN.BuscaTroca(mmVendas2PRECO_VENDA.AsString, ',', '.') + perc_comissao + vlr_comissao + ', ' + mmVendas2COD_FISCAL_ITEM.AsString + ', ' + FMFUN.BuscaTroca(mmVendas2ICMS_ITEM.AsString, ',', '.') + ', ' +
        FMFUN.BuscaTroca(mmVendas2VLR_ICMS_ST.AsString, ',', '.') + ', ' + FMFUN.BuscaTroca(mmVendas2VLR_BC_ST.AsString, ',', '.') + ', ' + FMFUN.BuscaTroca(mmVendas2VLR_ICMS_ITEM.AsString, ',', '.') + ', ' + QuotedStr(mmVendas2NCM.AsString) + ', ' + FMFUN.BuscaTroca(mmVendas2VLR_BC.AsString, ',', '.') + ', ' + FMFUN.BuscaTroca(mmVendas2IPI_ITEM.AsString, ',', '.') + ', ' + FMFUN.BuscaTroca(mmVendas2VLR_IPI_ITEM.AsString, ',', '.') + ', ' + FMFUN.BuscaTroca(mmVendas2VLR_AGR_ITEM.AsString, ',', '.') + ', ' +
        FMFUN.BuscaTroca(mmVendas2TRIB_ICMS.AsString, ',', '.') + ', ' + QuotedStr(cesta_basica) + supervisor + ', ' + QuotedStr(mmVendas2PROMOCAO.AsString) + ', ' + QuotedStr(mmVendas2CEST.AsString) + ', ' + FMFUN.BuscaTroca(mmVendas2DESCONTO_VALOR_GERAL.AsString, ',', '.') + ')';

      dao.Execsql(sql_vendas2);


      dao.Execsql('insert into nfe_ref_dev (id, numdoc, chave_nfe) '+
                  ' select id, '+novo_numdoc+', chave_nfe from nfe_ref_dev where  numdoc = '+Prnumdoc.Text);

      // id_item := dao.insert('Me', 'vendas2', 'id', Fr_vendas_industria2, 'gen_venda2');
      fm_splash.ggProgress.AddProgress(1);
      fm_splash.refresh;
      mmVendas2.next;
    end;
    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;
  try
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    dao.Execsql('update vendas1 set faturado = ''0'', nfe=null, chave_nfe=null, RECIBO_NFE = NULL, STATUS_NFE = NULL, ' + ' JUSTIF_CANC_NFE=null, MOTIVO_NFE = NULL, DIGEST_NFE = NULL, PROTOCOLO_NFE = NULL, DATA_REC_NFE = NULL, EMAIL_NFE = NULL, ' + ' CHAVE_NFE_DEV=null, RECIBO_NFE_DEV=null, STATUS_NFE_DEV=null, MOTIVO_NFE_DEV=null, DIGEST_NFE_DEV=null, ' + ' PROTOCOLO_NFE_DEV=null, DATA_REC_NFE_DEV=null, JUSTIF_CANC_NFE_DEV=null, NFE_DEV=null' + ' where numdoc = ' + novo_numdoc);

    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;

  EnableTaskWindows(WindowList);
  fm_splash.Hide;

  Pc_vendas.ActivePage := tab_mercadorias;
  mmVendas2.EnableControls;
  mmVendas2.First;

  Prnumdoc.Text := novo_numdoc;
  CarregaDados;

  StatusPedido;

end;

constructor TNFeCancel.Create(ChaveNfe, Justificativa, Protocolo: string; normal: boolean);
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
  entrada := not normal;
  Resume; // Inicia o Thread.
end;

procedure TNFeCancel.MontarEvento;
var
  arquivoNFe, pathSaida, Protocolo: string;
  NumeroLote: Int64;
begin
  try
    arquivoNFe := cChaveNfe + '-procNFe.xml';
    pathSaida := ExtractFilePath(Application.ExeName) + 'nf\';
    Fr_vendas_industria2.q_xml.close;
    Fr_vendas_industria2.q_xml.ParamByName('numdoc').value := Fr_vendas_industria2.Prnumdoc.Text;
    Fr_vendas_industria2.q_xml.Open;

    if entrada then
    begin
      if not Fr_vendas_industria2.q_xml.FIELDBYNAME('XML_DEV').IsNull then
        TBlobField(Fr_vendas_industria2.q_xml.FIELDBYNAME('XML_DEV')).SaveToFile(pathSaida + arquivoNFe);
    end
    else
    begin
      if not Fr_vendas_industria2.q_xml.FIELDBYNAME('XML').IsNull then
        TBlobField(Fr_vendas_industria2.q_xml.FIELDBYNAME('XML')).SaveToFile(pathSaida + arquivoNFe);
    end;

    Fr_vendas_industria2.ACBrNFe1.NotasFiscais.Clear;
  // numero do lote de envio (somente um exemplo, pode-se utilizar seu proprio controle)
    NumeroLote := StrToInt64(FormatDateTime('mmddhhmm', now));

  // carregar o xml da nota fiscal eletronica, pode ser omitido
    Fr_vendas_industria2.ACBrNFe1.NotasFiscais.Clear;
    if not Fr_vendas_industria2.ACBrNFe1.NotasFiscais.LoadFromFile(pathSaida + arquivoNFe) then
      raise Exception.Create('Não foi possível carregar o XML da Nota Fiscal Eletrônica correspondente!');

  // Criar o cancelamento
    Fr_vendas_industria2.ACBrNFe1.EventoNFe.Evento.Clear;
    Fr_vendas_industria2.ACBrNFe1.EventoNFe.idLote := NumeroLote;

    dao.Geral2('SELECT a.CNPJ FROM EMPRESA a WHERE cod_empresa=' + QuotedStr(Fr_vendas_industria2.Prempresa_faturar.Text));
    with Fr_vendas_industria2.ACBrNFe1.EventoNFe.Evento.Add do
    begin
      infEvento.chNFe := cChaveNfe;
      infEvento.CNPJ := FRPRI.LimpaCNPJ(dao.q2.fieldbyname('CNPJ').AsString);
      infEvento.cOrgao := Fr_vendas_industria2.ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.cUF;
      Fr_vendas_industria2.ACBrNFe1.Configuracoes.WebServices.UF := Fr_vendas_industria2.UF_Emissor;
      infEvento.dhEvento := now;
      infEvento.tpEvento := teCancelamento;
      infEvento.detEvento.nProt := cProtocoloNFe;
      infEvento.detEvento.xJust := cJustificativa;
    end;
    Fr_vendas_industria2.ACBrNFe1.Configuracoes.WebServices.Ambiente := FMFUN.BuscaAmbienteNFE;
  // Enviar o evento de cancelamento
    if Fr_vendas_industria2.ACBrNFe1.EnviarEvento(NumeroLote) then
    begin
      with Fr_vendas_industria2.ACBrNFe1.WebServices.EnvEvento do
      begin
        if EventoRetorno.retEvento.Items[0].RetInfEvento.cStat <> 135 then
        begin
          erro := true;
          msgerros := EventoRetorno.retEvento.Items[0].RetInfEvento.XMotivo;
          Exit;

        { raise Exception.CreateFmt(
          'Ocorreu o seguinte erro ao cancelar a nota fiscal eletrônica:' + sLineBreak +
          'Código:%d' + sLineBreak +
          'Motivo: %s', [
          EventoRetorno.retEvento.Items[0].RetInfEvento.cStat,
          EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo
          ]); }
        end;

      // retornos

        DataHoraEvento := EventoRetorno.retEvento.Items[0].RetInfEvento.dhRegEvento;
        NumeroProtocolo := EventoRetorno.retEvento.Items[0].RetInfEvento.nProt;
        XMLCancelamento := EventoRetorno.retEvento.Items[0].RetInfEvento.XML;
        CodigoStatus := EventoRetorno.retEvento.Items[0].RetInfEvento.cStat;
        MotivoStatus := EventoRetorno.retEvento.Items[0].RetInfEvento.XMotivo;

      end;
    end
    else
    begin
      with Fr_vendas_industria2.ACBrNFe1.WebServices.EnvEvento do
      begin
        raise Exception.Create('Ocorreram erros ao tentar efetuar o cancelamento:' + sLineBreak + 'Lote: ' + inttostr(EventoRetorno.idLote) + sLineBreak + 'Ambiente: ' + TpAmbToStr(EventoRetorno.tpAmb) + sLineBreak + 'Orgao: ' + inttostr(EventoRetorno.cOrgao) + sLineBreak + sLineBreak + 'Status: ' + inttostr(EventoRetorno.cStat) + sLineBreak + 'Motivo: ' + EventoRetorno.XMotivo);
      end;
    end;
  Except
    on e: Exception do
    begin
      erro := true;
      msgerros := e.Message;
      Exit;
    end;
  end;
end;

procedure TNFeCancel.Execute;
var
  reciboLst: TStringList;
  smensagem: WideString;
begin

  CoInitialize(nil);

  cont := 1;

  try
    smensagem := Fr_vendas_industria2.ACBrNFe1.ssl.selecionarcertificado;
  except
    on e: Exception do
    begin
      erro := true;
      msgerros := e.Message;
      Exit;
    end;
  end;

  Synchronize(Mostra);

  FRPRI.DesabilitaTimers;
  { if FMFUN.BuscaAmbienteNFE = taProducao then
    tipAmb := 1
    else
    tipAmb := 2; }
  cont := 2;
  Synchronize(Mostra);
  MontarEvento;

  reciboLst := TStringList.Create;
  reciboLst.Add(UTF8Encode(Fr_vendas_industria2.ACBrNFe1.WebServices.EnvEvento.retWS));
  reciboLst.SaveToFile(pathSaida + 'ReciboLote.xml');
  reciboLst.Free;

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
    Fr_nfe_transmissao.Gauge1.Visible := false;
    Fr_nfe_transmissao.lbResultado.Visible := true;
    Fr_nfe_transmissao.MsgErro.Visible := true;
    Fr_nfe_transmissao.MsgErro.Text := msgerros;
    Fr_nfe_transmissao.MsgErro.Height := Fr_nfe_transmissao.Panel1.Height - Fr_nfe_transmissao.MsgErro.Top;
    Fr_nfe_transmissao.lbResultado.Caption := 'Houve erro no processo.';
    Fr_nfe_transmissao.BtnOK.modalresult := MRCANCEL;
    FRPRI.HabilitaTimers;
  end;

  if finalizado then
  begin
    Fr_nfe_transmissao.Gauge1.Visible := false;
    Fr_nfe_transmissao.lbResultado.Visible := true;
    Fr_nfe_transmissao.lbResultado.Caption := 'Processo realizado com sucesso.';
    FRPRI.HabilitaTimers;
  end;

  Fr_nfe_transmissao.update;
  // Sleep(2000);
end;

procedure TNFeCancel.LimparArquivos;
var
  f: TSearchRec;
  Ret: integer;
  TempNome: string;
begin
  Ret := FindFirst(pathSaida + '*.xml', faAnyFile, f);
  try
    while Ret = 0 do
    begin
      DeleteFile(pathSaida + f.Name);
      Ret := FindNext(f);
    end;
  finally
    begin
      FindClose(f);
    end;
  end;
end;

procedure TNFeCancel.GravarReciboNfe;
var
  cTransmissaoXML: _TransmissaoXML;
  strVersaoDados, strCabecXML, strDados, status, motivo, Protocolo, digest, dataStr: string;
  reciboLst: TStringList;
  data: TDateTime;

  procedure SetaData;
  var
    dataarr: TStringList;
    horastr: string;
  begin
    horastr := copy(dataStr, Pos('T', dataStr) + 1, 8);
    dataStr := copy(dataStr, 1, Pos('T', dataStr) - 1);
    dataarr := TStringList.Create;
    dataarr := FMFUN.explode(dataStr, '-');
    dataStr := dataarr[2] + '/' + dataarr[1] + '/' + dataarr[0];
    dataarr.Free;
    data := strtodatetime(dataStr + ' ' + horastr);
  end;

  procedure ConsultaStatusNFe(ChaveNfe: string);
  begin

    status := inttostr(CodigoStatus);
    motivo := 'Cancelamento';
    Protocolo := NumeroProtocolo;
    dataStr := FormatDateTime('dd/mm/yyyy hh:mm:ss', DataHoraEvento);

    { Fr_vendas_industria2.XMLNFe.Active := true;
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

  function AtualizaStatusNFe: boolean;
  begin
    ConsultaStatusNFe(Fr_vendas_industria2.PrChave_NFe.Text);
    Synchronize(Mostra);
    if erro then
      Exit;
    try
      if not entrada then
      begin
        if not (dao.cn.InTransaction) then
          dao.cn.StartTransaction;
        dao.Execsql('update vendas1 set ' + '  STATUS_NFE = ' + status + ', FATURADO   = 2 ' + ', MOTIVO_NFE = ' + QuotedStr(motivo) + ', PROTOCOLO_NFE = ' + QuotedStr(Protocolo) + ', DATA_REC_NFE = ' + QuotedStr(FormatDateTime('dd/mm/yyyy hh:mm:ss', data)) + ' where numdoc =' + Fr_vendas_industria2.Prnumdoc.Text);
      end
      else
      begin
        dao.Execsql('update vendas1 set ' + '  STATUS_NFE_DEV = ' + status + ', MOTIVO_NFE_DEV = ' + QuotedStr(motivo) + ', PROTOCOLO_NFE_DEV = ' + QuotedStr(Protocolo) + ', DATA_REC_NFE_DEV = ' + QuotedStr(FormatDateTime('dd/mm/yyyy hh:mm:ss', data)) + ' where numdoc =' + Fr_vendas_industria2.Prnumdoc.Text);
      end;

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
  // EnviarEmailNfe := false;
  ImprimirDanfe(PrChave_NFe.Text);
end;

procedure TFr_vendas_industria2.PrJUSTIF_CANC_NFEChange(Sender: TObject);
begin
  if length(PrJUSTIF_CANC_NFE.Text) >= 15 then
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

procedure TFr_vendas_industria2.Prcod_supervisorKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  if not (Key in ['0'..'9', #8]) and (Key <> #13) then
  begin
    beep; { somente delphi 2.0 ou > }
    Key := #0;
  end;

  if Key = #13 then
  begin
    if (Prcod_supervisor.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
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

      // preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo, 5);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Nome';
      Campos_combo[2] := 'Empresa';
      Campos_combo[3] := 'CNPJ';
      Campos_combo[4] := 'CPF';

      for i := 0 to 4 do
      begin
        valor_combo := Campos_combo[i];
        Fr_localizar.CBcampos.Items.Add(valor_combo);
      end;

      Fr_localizar.CBcampos.ItemIndex := 1;

      Fr_localizar.ShowModal;
      Fr_localizar.Free;

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;
    end;
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;
end;

procedure TFr_vendas_industria2.Prcod_supervisorExit(Sender: TObject);
begin
  if trim(Prcod_supervisor.Text) = '' then
    Lbnom_supervisor.Caption := '...';

  if Prcod_supervisor.Text <> '' then
  begin
    if (not FMFUN.verificaNumerico(Prcod_supervisor.Text)) and (length(Prcod_supervisor.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      Prcod_supervisor.SetFocus;
      Exit;
    end;

    dao.Geral2('select nom_representante, somente_consumidor_final from representante where ativo = ''S'' and funcionario in (''0'', ''1'', ''4'') and id=' + QuotedStr(Prcod_supervisor.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_supervisor.Caption := dao.q2.fieldbyname('nom_representante').AsString;

      Prconsumidor_final.Checked := dao.q2.fieldbyname('somente_consumidor_final').AsString = 'S';
      if Prconsumidor_final.Checked then
      begin
        dao.Geral5('select e.cod_empresa, e.nom_empresa ' +
                   'From empresa e ' +
                   'where consumidorfinal = ''S'' limit 1');
        if dao.q5.RecordCount > 0 then
        begin
          Prempresa_faturar.Text := dao.q5.fieldbyname('cod_empresa').AsString;
          Lbempresa_faturamento.Caption := dao.q5.fieldbyname('nom_empresa').AsString;
        end
      end;
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

procedure TFr_vendas_industria2.Prcod_supervisorButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  if (Prcod_supervisor.Text = '') then
  begin
    Application.CreateForm(TFr_localizar, Fr_localizar);

    // guardar os valores antigos
    chamou_form_old := chamou_form;
    chamou_pesquisa_old := chamou_pesquisa;

    Fr_localizar.Caption := 'Localizar Supervisor';

    chamou_pesquisa := 'fr_supervisor';
    chamou_form := 'fr_pedido_supervisor';
    chamou_cadastro := 'fr_supervisor';

    Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Supervisor';

    // preenchendo o combo box com os campos desejados para pesquisar.
    SetLength(Campos_combo, 5);
    Campos_combo[0] := 'Codigo';
    Campos_combo[1] := 'Nome';
    Campos_combo[2] := 'Empresa';
    Campos_combo[3] := 'CNPJ';
    Campos_combo[4] := 'CPF';

    for i := 0 to 4 do
    begin
      valor_combo := Campos_combo[i];
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
  { if dao.terminal_nfe then
    CheckStatusNFe; }

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
    if (not FMFUN.verificaNumerico(Prcod_fornecedor.Text)) and (length(Prcod_fornecedor.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      Prcod_fornecedor.SetFocus;
      Exit;
    end;

    dao.Geral2('select RAZAO_SOCIAL, CNPCPF, cd.nom_cidade, cd.uf, CASE WHEN (c.IERG is null or c.IERG = ''ISENTO'') THEN ''1'' ELSE ''0'' END AS ISENTO from fornecedor c ' + 'left join cidades cd on cd.cod_cidade=c.cod_cidade ' + 'where cod_fornecedor=' + QuotedStr(Prcod_fornecedor.Text));

    if dao.q2.RecordCount > 0 then
    begin
      LbNom_fornecedor.Caption := dao.q2.fieldbyname('razao_social').AsString;
      lbCnpj_forn.Caption := dao.q2.fieldbyname('CNPCPF').AsString;

      UF_Cliente := dao.q2.fieldbyname('UF').AsString;

      lbcidade_forn.Caption := 'Cidade: ' + dao.q2.fieldbyname('nom_cidade').AsString + '/' + dao.q2.fieldbyname('uf').AsString;
      if dao.q2.fieldbyname('isento').AsString = '1' then
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

procedure TFr_vendas_industria2.Prcod_fornecedorButtonClick(Sender: TObject);
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
  chamou_form := 'fr_saida_fornecedor';
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

  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
end;

procedure TFr_vendas_industria2.FaturamentoAvulso1Click(Sender: TObject);
begin
  LiberaItemRepetido := false;
  if itens_repetidos then
  begin
    if MessageDlg('Produto incluído no Pedido mais de uma vez. Desejas continuar?', mtConfirmation, [mbYes, mbno], 0) = mrno then
      Exit
    else
      LiberaItemRepetido := true;
  end;

  Pc_vendas.TabIndex := 0;

  if not ChecarDadosPedido then
    Exit;

  if not ChecarLiberacao then
    Exit;

  if (Prcod_representante.Text = '') and venda then
  begin
    dao.msg('O campo Representante deve ser Preenchido');
    BtaltpedClick(Self);
    Prcod_representante.SetFocus;
    Exit;
  end;

  if venda then
  begin
    if Prcod_cliente.Text = '' then
    begin
      dao.msg('Campo Cliente deve ser Preenchido!');
      BtaltpedClick(Self);
      Prcod_cliente.SetFocus;
      Exit;
    end;
  end
  else
  begin
    if (Prcod_cliente.Text = '') and (Prcod_fornecedor.Text = '') then
    begin
      dao.msg('Campo Cliente ou Fornecedor deve ser Preenchido!');
      BtaltpedClick(Self);
      Prcod_cliente.SetFocus;
      Exit;
    end;
  end;
 {
  if not ChecarDadosCliente then
    Exit;

  if not ChecarDadosTransportadora then
    Exit;

  if (Prcod_fop.Text = '') and venda then
  begin
    dao.msg('O campo Forma de Pagamento deve ser Preenchido');
    BtaltpedClick(Self);
    Prcod_fop.SetFocus;
    Exit;
  end;
}
  if (Prcod_prazo_pgto.Text = '') and venda then
  begin
    dao.msg('O campo Prazo Pagamento deve ser Preenchido');
    BtaltpedClick(Self);
    Prcod_prazo_pgto.SetFocus;
    Exit;
  end;

  if Prempresa_faturar.Text = '' then
  begin
    dao.msg('O campo Empresa deve ser Preenchido');
    BtaltpedClick(Self);
    Pc_vendas.ActivePage := tab_finalizar;
    Prempresa_faturar.SetFocus;
    Exit;
  end;

  if Prcod_fiscal.Text = '' then
  begin
    dao.msg('O campo Código Fiscal deve ser Preenchido');
    BtaltpedClick(Self);
    Pc_vendas.ActivePage := tab_finalizar;
    Prcod_fiscal.SetFocus;
    Exit;
  end;

  if mmVendas2.RecordCount = 0 then
  begin
    dao.msg('O Pedido não pode ser Gravado sem Mercadorias Lançadas');
    Exit;
  end;

  { if not habilita_faturamento and (FRPRI.TipUsu < '4') then
    begin
    showmessage('Há itens do Pedido com Desconto acima do Permitido');
    exit;
    end; }

  if cliente_com_pendencia and (FRPRI.TipUsu < '3') then
  begin
    showmessage('Cliente com pendências financeira não pode ser faturado!');
    Exit;
  end;

  if trim(Prnumdoc.Text) = '' then
    Exit;

  if (Lbnom_fop.Caption = 'BOLETO') and (trim(PrCONTA_BOLETO.Text) = '') then
  begin
    dao.msg('Na forma de pagamento BOLETO. O campo Banco CC Boleto deve ser preenchido.');
    Pc_vendas.ActivePage := tab_mercadorias;
    BtaltpedClick(Self);
    PrCONTA_BOLETO.SetFocus;
    Exit;
  end;

  Mostra := true;
  // ChecarFaturamentoLiquido((prtot_liquido.Value - Zztot_custo.Value), Zztot_custo.Value);
  { if not liberado then
    exit; }

  dao.Geral4('SELECT CASE WHEN CHAVE_NFE IS NOT NULL THEN ''N'' ELSE ''S'' END AS HABILITADO FROM VENDAS1 WHERE NUMDOC = ' + Prnumdoc.Text);
  if dao.q4.fieldbyname('HABILITADO').AsString = 'S' then
  begin
    if MessageDlg('Desejas efetuar o processo de Faturamento Avulso?', mtConfirmation, [mbYes, mbno], 0) = mryes then
    begin
      PrNFE.Clear;
      try
        if not (dao.cn.InTransaction) then
          (dao.cn.StartTransaction);
        if (mform = 'vendas_industria') then
        begin
          dao.Execsql('update vendas1 set nfe = null, faturado = 1, orcamento = 0 where numdoc=' + QuotedStr(Prnumdoc.Text));
          faturar(Prnumdoc.Text, Prcod_cliente.Text, Prcod_fop.Text, Prcod_prazo_pgto.Text, Prtot_liquido.Value, false);
        end
        else
          dao.Execsql('update vendas1 set nfe = null, faturado = 3 where numdoc=' + QuotedStr(Prnumdoc.Text));

        dao.grava_log('FATURAMENTO AVULSO - PEDIDO N°: ' + Prnumdoc.Text, '');
        dao.cn.Commit;
      except
        dao.cn.Rollback;
      end;

    end;
    CarregaDados;

  end
  else
  begin
    showmessage('Não é permitido Faturado Avulso em Pedidos com NF-e geradas.');
    Exit;
  end;
  LiberaItemRepetido := false;
end;

procedure TFr_vendas_industria2.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if Column.Field = mmVendas2DESCONTO then
  begin
    DBGrid1.Canvas.Font.Color := clRed;
    if gdSelected in State then
    begin
      DBGrid1.Canvas.Brush.Color := clRed;
      DBGrid1.Canvas.Font.Color := clWhite;
    end;
  end
  else
  begin
    if mmVendas2PROMOCAO.AsString = 'S' then
    begin
      DBGrid1.Canvas.Font.Color := clPurple;
      if gdSelected in State then
      begin
        DBGrid1.Canvas.Brush.Color := clPurple;
        DBGrid1.Canvas.Font.Color := clWhite;
      end;
    end
    else
    begin
      DBGrid1.Canvas.Font.Color := clNavy;
      if gdSelected in State then
      begin
        DBGrid1.Canvas.Brush.Color := clNavy;
        DBGrid1.Canvas.Font.Color := clWhite;
      end;
    end;
  end;

  DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
  if Column.Field = mmVendas2CESTA_BASICA then
  begin
    DBGrid1.Canvas.FillRect(Rect);

    if mmVendas2CESTA_BASICA.Value then
      ImageList1.Draw(DBGrid1.Canvas, Rect.Left, Rect.Top + 1, 0);
  end;
end;

procedure TFr_vendas_industria2.Mecod_produtoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F9 then
    Mecod_produtoButtonClick(Self);
end;

procedure TFr_vendas_industria2.Mecod_produtoKeyPress(Sender: TObject;
  var Key: Char);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
  usa_leitor: boolean;
begin
  if not (Key in ['0'..'9', #8]) and (Key <> #13) then
  begin
    beep; { somente delphi 2.0 ou > }
    Key := #0;
  end;

  if Key = #13 then
  begin
    if (length(Mecod_produto.Text) < 12) and (Mecod_produto.Text <> '') then
      busca_produto_unitario(false, Mecod_produto.Text)
    else if (Mecod_produto.Text <> '') then
    begin
      busca_produto_unitario(true, Mecod_produto.Text);
      usa_leitor := true;
    end;
    if (Mecod_produto.Text = '') and (btnov.Enabled = false) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Produto';
      chamou_pesquisa := 'fr_produto';
      chamou_form := 'fr_pedido_produto';
      chamou_cadastro := 'Fr_produto';
      revenda := 'S';

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

      Fr_localizar.ShowModal;
      Fr_localizar.Free;

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;
    end;

    if Mecod_produto.Text <> '' then
    begin
      dao.Geral1('select grade from produto where cod_produto=' + QuotedStr(Mecod_produto.Text));
    end;
    Mevolume.SetFocus;

    // if usa_leitor then
    // Btgra.Click;
    // SelectNext(sender as TWinControl, true, true);
    Key := #0;
  end;
end;

procedure TFr_vendas_industria2.MeTrib_ICMSExit(Sender: TObject);
const
  // cst_lst: array[0..10] of string = ('00', '10', '20', '30', '40', '41', '50', '51', '60', '70', '90');
  cst_lst: array[0..3] of string = ('00', '10', '60', '90');
var
  x: integer;
  valido: boolean;
begin
  if length(trim(MeTrib_ICMS.Text)) = 0 then
    Exit;
  { valido := false;
    for x := 0 to 3 do
    begin
    if MeTrib_ICMS.Text = cst_lst[x] then
    valido := true;
    end;
    if not valido and (MeTrib_ICMS.Visible = true) then
    begin
    showmessage('CST Inválida!');
    Pc_vendas.ActivePageIndex := 0;
    if mmVendas2.State in [dsEdit] then
    mmVendas2.Edit;
    MeTrib_ICMS.SetFocus;
    Exit;
    end
    else
    begin
    if MeTrib_ICMS.Text = '00' then
    mmVendas2ICMS_ITEM.Value := BuscaAliquota(UF_Emissor, UF_Cliente);
    end; }
end;

procedure TFr_vendas_industria2.Meipi_itemExit(Sender: TObject);
begin
  if mmVendas2IPI_ITEM.Value > 0 then
    mmVendas2VLR_IPI_ITEM.Value := mmVendas2SUB_TOTAL.Value * (mmVendas2IPI_ITEM.Value / 100)
  else
    mmVendas2VLR_IPI_ITEM.Value := 0;
end;

procedure TFr_vendas_industria2.DBGrid1Enter(Sender: TObject);
begin
  CarregaFoto(mmVendas2COD_PRODUTO.AsString);
end;

procedure TFr_vendas_industria2.DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  CarregaFoto(mmVendas2COD_PRODUTO.AsString);
end;

procedure TFr_vendas_industria2.DBGrid1CellClick(Column: TColumn);
begin
  CarregaFoto(mmVendas2COD_PRODUTO.AsString);
end;

procedure TFr_vendas_industria2.DBGrid1MouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: boolean);
begin
  CarregaFoto(mmVendas2COD_PRODUTO.AsString);
end;

procedure TFr_vendas_industria2.DBGrid1MouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: boolean);
begin
  CarregaFoto(mmVendas2COD_PRODUTO.AsString);
end;

procedure TFr_vendas_industria2.Mecod_fiscal_itemButtonClick(Sender: TObject);
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
  chamou_form := 'fr_pedidos_item_cod_fiscal';
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

  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
end;

procedure TFr_vendas_industria2.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    // se for, passa o foco para o próximo campo, zerando o valor da variável Key
    if Probservacoes_pedido.Visible and Probservacoes_nota.Visible then
      if (ActiveControl.Name = 'Probservacoes_pedido') or (ActiveControl.Name = 'Probservacoes_nota') then
        Exit;
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TFr_vendas_industria2.FormShow(Sender: TObject);
var
  ambNFe: string;
  x, mes, ano, posicao: integer;

  procedure SetaPosicao;
  begin
    Mepreco.Left := Mepreco.Left - posicao;
    Medesconto.Left := Medesconto.Left - posicao;
    Medesconto_Valor.Left := Medesconto_Valor.Left - posicao;
    Mesub_total.Left := Mesub_total.Left - posicao;
    MePERC_COMISSAO.Left := MePERC_COMISSAO.Left - posicao;

    lbDesc.Left := lbDesc.Left - posicao;
    lbDescValor.Left := lbDescValor.Left - posicao;
    lbPrecoLiq.Left := lbPrecoLiq.Left - posicao;
    lbTotalLiq.Left := lbTotalLiq.Left - posicao;
    lbComis.Left := lbComis.Left - posicao;
    { lbICMSItem.Left := lbICMSItem.Left - posicao;
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
  ValidarDesc := true;
  BtnEnviarPedido.Visible := FRPRI.sbTransmissao.Visible;
  btnExportaFrente.Visible := FRPRI.Frente_Caixa;
  TaAgrupar.TabVisible := false;

  dao.Geral3('select representacao, agrupar_pedidos, modelo_desconto, tinta_base, OBRIGATORIEDADE_PESO, industria from configuracao where cod_conf=' + QuotedStr('1'));
  obrigatoriedade_peso := dao.q3.fieldbyname('OBRIGATORIEDADE_PESO').AsString = 'S';
  representacao := dao.q3.fieldbyname('representacao').AsString = 'S';
  modelo_desconto := dao.q3.fieldbyname('modelo_desconto').AsInteger;
  // industria := dao.Q3.fieldbyname('industria').AsString = 'S';

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

  if dao.q3.fieldbyname('tinta_base').AsString <> 'S' then
  begin
    lbPrecoBase.Visible := false;
    MePrecoBase.Visible := false;

    if Medesconto.Visible then
      posicao := Medesconto.Left - MePrecoBase.Left
    else
      posicao := Mepreco.Left - MePrecoBase.Left;

    SetaPosicao;
  end;

  agrupar_pedidos := dao.q3.fieldbyname('agrupar_pedidos').AsString = 'S';

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
    gbDesconto.Visible := false;
    ImprimirPedidoDetalhado1.Visible := false;
    FaturamentoAvulso1.Visible := false;
    DesfaturarPedido1.Visible := false;
    CancelamentoAvulso1.Visible := false;
    ImprimirEtiquetadeTransporte1.Visible := false;
    imprimirLotedePedidos1.Visible := false;
    // bt_faturar.Visible := false;
    BtnNFE.Visible := false;
    BtnBoleto.Visible := false;
    BtnEmailBoleto.Enabled := false;
    gbAtalhos.Visible := false;
    tab_cr1.TabVisible := false;
    TaNFe.TabVisible := false;
    tab_finalizar.TabVisible := false;
    TaNFeDevol.TabVisible := false;
    // BtnMaisPrecos.Visible := true;
    lbLucro.Visible := false;
    edMargemLucro.Visible := false;
    gbImpostos.Visible := false;
    Gbanalise_custo.Visible := false;
    gbTotalFaturado.Visible := false;
    BtnEtiqueta.Visible := false;
    lbcontabanco.Visible := false;
    PrCONTA_BOLETO.Visible := false;
    lbCCBoleto.Visible := false;
    lbObs.Top := lbcontabanco.Top;
    Probservacoes_pedido.Top := PrCONTA_BOLETO.Top;
    gbtotal.Height := 40;
    BtnEmailPedido.Visible := true;
    btAltRep.Enabled := false;
    btAltSup.Enabled := false;

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
  Btinsere_cheque.Caption := 'Inserir Cheque' + #13 + 'Referente a essa parcela';
  readonly_true('Pr');
  readonly_true('Me');

  Btnovped.Enabled := true;
  BtnEmailPedido.Enabled := true;

  Btgraped.Enabled := false;
  Btcanped.Enabled := false;
  Btexcped.Enabled := false;
  Btlocped.Enabled := true;
  // BtnNfe.Enabled := dao.terminal_nfe;

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

  TabNfeRef.TabVisible := not venda;
  Prcod_fornecedor.Visible := not venda;
  LbNom_fornecedor.Visible := not venda;
  lbForn.Visible := not venda;
  lbcidade_forn.Visible := not venda;
  lbCnpj_forn.Visible := not venda;

  if mform = 'vendas_devolucoes' then
  begin
    MeTrib_ICMS.Enabled := true;

    lbBC_ICMS.Visible := true;
    lbIPIitem.Visible := true;
    lbTotalIPI.Visible := true;
    lbICMSItem.Visible := true;
    lbTotalICMS.Visible := true;

    Mevlr_bc_icms.Visible := true;
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
    MeTrib_ICMS.Enabled := false;

    lbBC_ICMS.Visible := false;
    lbIPIitem.Visible := false;
    lbTotalIPI.Visible := false;
    lbICMSItem.Visible := false;
    lbTotalICMS.Visible := false;

    Mevlr_bc_icms.Visible := false;
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
  dao.q1.First;
  cbEmpresa.Items.Clear;
  while not dao.q1.Eof do
  begin
    cbEmpresa.Items.Add(dao.q1.fieldbyname('EMPRESA').AsString);
    dao.q1.next;
  end;

  cbMes.Items.Clear;
  mes := strtoint(FormatDateTime('m', now));
  ano := strtoint(FormatDateTime('yyyy', now));

  for x := 0 to 2 do
  begin
    if (mes - x) <= 0 then
      cbMes.Items.Add(FMFUN.enchezero(inttostr(12 + (mes - x)), 2) + '/' + inttostr(ano - 1))
    else
      cbMes.Items.Add(FMFUN.enchezero(inttostr(mes - x), 2) + '/' + inttostr(ano));
  end;
  if (FRPRI.TipUsu > '1') then
  begin
    cbEmpresa.ItemIndex := 0;
    cbMes.ItemIndex := 0;

    // CarregaTotaisEmpresa;
  end;

  if (FRPRI.TipUsu > '5') then
  begin
    FaturamentoAvulso1.Visible := true;
    DesfaturarPedido1.Visible := true;
    CancelamentoAvulso1.Visible := true;
  end;
  ACBrNFe1.Configuracoes.ARQUIVOS.PathSchemas := ExtractFilePath(Application.ExeName) + 'Schemas\';
  { ambNfe := FMFUN.BuscaAmbienteNFE;
    if ambNFe = '1' then

    WebServices.Ambiente := 'taProducao'
    else
    ACBrNFe1.WebServices.Ambiente := 'taHomologacao'; }

end;

procedure TFr_vendas_industria2.Meicms_itemExit(Sender: TObject);
begin
  if mmVendas2ICMS_ITEM.Value > 0 then
    mmVendas2VLR_ICMS_ITEM.Value := mmVendas2SUB_TOTAL.Value * (mmVendas2ICMS_ITEM.Value / 100)
  else
    mmVendas2VLR_ICMS_ITEM.Value := 0;
end;

procedure TFr_vendas_industria2.CancelamentoAvulso1Click(Sender: TObject);
begin
  if (Prnumdoc.Text <> '') and (btnov.Enabled = true) then
    dao.Geral2('select faturado, chave_nfe from vendas1 where numdoc=' + QuotedStr(Prnumdoc.Text))
  else
    Exit;

  if dao.q2.fieldbyname('faturado').AsString <> '0' then
  begin
    dao.msg('Venda Faturada ou Cancelada!');
    Exit;
  end;

  if MessageDlg('Deseja Cancelar essa Venda?', mtConfirmation, [mbYes, mbno], 0) = mryes then
  begin
    cancelamento_avulso;
  end;
end;

procedure TFr_vendas_industria2.ImprimirPedidoDetalhado1Click(Sender: TObject);
var
  path, cmd: string;
begin

  if (FRPRI.TipUsu = '0') or (FRPRI.TipUsu = '1') then
    Exit;

{  if not ChecarDadosCliente then
    Exit;

  if not ChecarDadosTransportadora then
    Exit;
 }
  path := ExtractFilePath(Application.ExeName);
  if Prnumdoc.Text = '' then
  begin
    dao.msg('Selecione um Pedido para Imprimir!');
    Exit;
  end;

  if Btgraped.Enabled then
    BtgrapedClick(Self);

  cmd := 'select v.NUMDOC, '+#13+
         '       V.DTADOC, '+#13+
         '       V.DTA_EMISSAO, '+#13+
         '       V.OBSERVACOES_PEDIDO AS OBS,  '+#13+
         '       PZ.PRAZO,  '+#13+
         '       V.TOT_LIQUIDO,  '+#13+
         '       ((V.TOT_BRUTO - V.TOT_LIQUIDO) / V.TOT_BRUTO) * 100 AS DESCONTO_PEDIDO,  '+#13+
         '       coalesce((  '+#13+
         '                  select sum(valor)  '+#13+
         '                  from cr1 as cr  '+#13+
         '                  where cr.nr_documento = v.NUMDOC   '+#13+
         '       ), 0) - case   '+#13+
         '                 when cd.UF <> ''SC'' and v.nfe is not null then v.VLR_ST  '+#13+
         '                 else 0  '+#13+
         '               end as valor_cr,  '+#13+
         '       c.COD_CLIENTE,  '+#13+
         '       c.NOM_CLIENTE,  '+#13+
         '       c.ENDERECO || '',  '+#13+
         '       ''       || C.NR_ENDERECO AS CLIENTE_ENDERECO,  '+#13+
         '       c.BAIRRO AS CLIENTE_BAIRRO,  '+#13+
         '       C.CEP AS CEP_CLIENTE,  '+#13+
         '       coalesce(c.cnpj, c.cpf) as cliente_cnpj_cpf,  '+#13+
         '       coalesce(c.ie, c.rg) as cliente_ie_rg,  '+#13+
         '       cast(cd.nom_cidade || '' - '' || cd.uf as varchar(300)) as cliente_cidade,  '+#13+
         '       c.telefone as fone_CLIENTE,  '+#13+
         '       c.fax,  '+#13+
         '       c.contato,  '+#13+
         '       c.aviso,  '+#13+
         '       r.id as codrep,  '+#13+
         '       r.NOM_REPRESENTANTE,  '+#13+
         '       b.NOM_BANCO,  '+#13+
         '       r.NR_BANCO,  '+#13+
         '       r.NR_AGENCIA,  '+#13+
         '       r.NR_CONTA_CORRENTE,   '+#13+
         '       r.email,  '+#13+
         '       r.fone,   '+#13+
         '       r.celular,  '+#13+
         '       p.COD_PRODUTO,  '+#13+
         '       CASE  '+#13+
         '         WHEN V2.PROMOCAO = ''S'' THEN cast (P.NOM_PRODUTO || ''*'' as varchar (300))  '+#13+
         '         ELSE cast (p.NOM_PRODUTO as varchar (300))  '+#13+
         '       END NOM_PRODUTO,  '+#13+
         '       coalesce(v2.preco_custo, p.custo_total) as custo,  '+#13+
         '       p.custo_total,  '+#13+
         '       p.LUCRO,  '+#13+
         '       (p.custo_total *(1 +(p.lucro / 100))) as preco_venda_calc,  '+#13+
         '       (((v2.PRECO - coalesce(v2.preco_custo, p.custo_total)) / coalesce(v2.preco_custo, p.custo_total))) * 100 as margem,  '+#13+
         '       coalesce(v2.PRECO_BRUTO, P.PRECO_VENDA) AS PRECO_VENDA,  '+#13+
         '       ((v2.PRECO / P.custo_total) - 1) * 100 as margem,  '+#13+
         '       p.ord_pauta,  '+#13+
         '       V2.ID,  '+#13+
         '       v2.PRECO,  '+#13+
         '       v2.DESCONTO,  '+#13+
         '       v2.QTD,  '+#13+
         '       v2.SUB_TOTAL,  '+#13+
         '       v.VLR_COMISSAO,  '+#13+
         '       V2.SUB_TOTAL *(V.TOT_LIQUIDO / coalesce((  '+#13+
         '                                                 select sum(valor)   '+#13+
         '                                                 from cr1 as cr  '+#13+
         '                                                 where cr.nr_documento = v.NUMDOC  '+#13+
         '       ), V.TOT_LIQUIDO)) AS SUBTOTAL_RATEADO,  '+#13+
         '       0 AS VLR_COMISSAO_RATEADO,  '+#13+
         '       V.FATURADO,  '+#13+
         '       v2.volume, '+#13+
         '       V2.PROMOCAO, '+#13+
         '       P.GRADE_COMISSAO as TIPO,  '+#13+
         '       ''Não''       AS SUPERVISAO,  '+#13+
         '       v.PERC_COMISSAO,  '+#13+
         '       s.NOM_REPRESENTANTE as supervisor,   '+#13+
         '       ''''       as contido,  '+#13+
         '       tl.NOME as USUARIO_LIBEROU_DESCONTO,  '+#13+
         '       v.MOTIVO_LIBERACAO_DESCONTO, '+#13+
         '       coalesce((  '+#13+
         '                  select sum(vc.preco_custo * vc.qtd)  '+#13+
         '                  from vendas2 as vc  '+#13+
         '                  where vc.numdoc = v.NUMDOC  '+#13+
         '       ), V.TOT_LIQUIDO) as total_custo  '+#13+
         'from vendas1 v  '+#13+
         'inner join cliente c on (c.COD_CLIENTE = v.cod_cliente)  '+#13+
         'inner join CIDADES cd on (c.COD_CIDADE = cd.COD_CIDADE)  '+#13+
         'inner join vendas2 v2 on (v.NUMDOC = v2.NUMDOC)  '+#13+
         'inner join REPRESENTANTE r on (r.ID = v.COD_REPRESENTANTE)  '+#13+
         'left join REPRESENTANTE s on (s.ID = v.COD_SUPERVISOR)  '+#13+
         'left join BANCO b on b.ID = cast (r.NR_BANCO as integer) '+#13+
         'inner join produto p on (p.COD_PRODUTO = v2.COD_PRODUTO) '+#13+
         'left join grupo g on (g.COD_GRUPO = p.COD_GRUPO) '+#13+
         'INNER JOIN PRAZO PZ ON (PZ.ID = V.COD_PRAZO_PGTO) '+#13+
         'left outer join tbusu tl on tl.codusu = cast(v.USUARIO_LIBEROU_DESCONTO as integer)  '+#13+
         'where '+
         '  p.custo is not null and ' +
         '  p.custo > 0 and ' +
         '  v.TOT_LIQUIDO > 0 and ' +
         '  v.numdoc = ' + Prnumdoc.Text +
         'order by r.NOM_REPRESENTANTE, v.dtadoc, v.numdoc, p.ord_pauta';

  with dm.q_venda_espelho do
  begin
    close;
    sql.Clear;
    sql.Add(cmd);
    Open;
  end;

  if dm.q_venda_espelho.IsEmpty then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    Exit;
  end;

  /// //////////////////////////////////////////////////////////

  cmd := 'SELECT V1.NUMDOC, V2.COD_PRODUTO||''-''||P.NOM_PRODUTO AS PRODUTO, V2.QTD, V2.PRECO, V2.SUB_TOTAL ' + 'FROM VENDAS1 V1 ' + 'INNER JOIN VENDAS2 V2 ON V1.NUMDOC = V2.NUMDOC ' + 'INNER JOIN PRODUTO P ON P.COD_PRODUTO = V2.COD_PRODUTO ' + 'where v2.NUMDOC = (select v3.numdoc from vendas1 v3 where V3.NUMDOC_DESTINO = ' + Prnumdoc.Text + ')';

  with dm.q_pedido_vinculado do
  begin
    close;
    sql.Clear;
    sql.Add(cmd);
    Open;
  end;

  if dm.q_pedido_vinculado.RecordCount < 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    Exit;
  end;

  /// //////////////////////////////////////////////////////////

  cmd := 'SELECT ' +
         '  distinct Cod_cliente, NR_documento, titulo, HISTORICO, DTAVEN, DTAREC, valor, valor_recebido, SITUACAO, CONTA ' + 'FROM ' + '( ' + '    SELECT ' + '      Cod_cliente, NR_documento, titulo, HISTORICO, DTAVEN, DTAREC, valor, valor_recebido, SITUACAO, CONTA ' +
         '    FROM ' +
         '      ( ' +
         '        SELECT ' +
         '           c.cod_cliente, NR_documento, titulo, substring(C.HISTORICO1 from 1 for 500) as historico, DTAVEN, DTAREC, C.valor, coalesce(c.valor_recebido,0) as valor_recebido, ' + '          case when dtarec is null then case when DTAVEN >= current_date then ''À VENCER'' else ''VENCIDO'' END ELSE ''PAGO'' END AS SITUACAO, ' + '          case when dtarec is null then ' + '            coalesce(CV.NR_AGENCIA||'' ''||CV.NR_CONTA||'' ''||CV.NOM_CONTA, F.NOM_FOP) ' +
         '          Else ' +
         '          coalesce(CC.NR_AGENCIA||'' ''||CC.NR_CONTA||'' ''||CC.NOM_CONTA, ' +
         '          CASE E.TIPO WHEN 0 THEN ''DINHEIRO'' ' +
         '                      WHEN 1 THEN ''CHEQUE PRÓPRIO'' ' +
         '                      WHEN 2 THEN ''DEPÓSITO'' ' +
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
         '          C.COD_CLIENTE = ' + Prcod_cliente.Text + ' and c.DTAREC is not null  ORDER BY ' +
         '          COD_CLIENTE, DTAVEN DESC ' + '  limit 10 ) q2  ' +
         '    Union ' +
         '    SELECT ' +
         '      c.Cod_cliente, NR_documento, titulo, substring(C.HISTORICO1 from 1 for 500) as historico, DTAVEN, ' +
         '      DTAREC, C.valor, coalesce(c.valor_recebido,0) as valor_recebido, case when dtarec is null then case when DTAVEN >= current_date then ''À VENCER'' else ''VENCIDO'' END ELSE ''PAGO'' END AS SITUACAO, ' +
         '          case when dtarec is null then ' +
         '            coalesce(CV.NR_AGENCIA||'' ''||CV.NR_CONTA||'' ''||CV.NOM_CONTA, F.NOM_FOP) ' +
         '          Else ' +
         '          coalesce(CC.NR_AGENCIA||'' ''||CC.NR_CONTA||'' ''||CC.NOM_CONTA, ' +
         '          CASE E.TIPO WHEN 0 THEN ''DINHEIRO'' ' +
         '                      WHEN 1 THEN ''CHEQUE PRÓPRIO'' ' +
         '                      WHEN 2 THEN ''DEPÓSITO'' ' +
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
         '      AND dtarec is null ) q1 ' +
         'ORDER BY ' +
         '  DTAVEN DESC';
//    '      AND case when dtarec is null then case when DTAVEN >= current_date then ''À VENCER'' else ''VENCIDO'' END ELSE ''PAGO'' END = ''VENCIDO'' ' + '  ) ' + 'ORDER BY ' + '  DTAVEN DESC';

  with dm.q_ultimos_cr do
  begin
    close;
    sql.Clear;
    sql.Add(cmd);
    Open;
  end;

  if dm.q_ultimos_cr.RecordCount < 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    Exit;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\vendas_detalhado.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    Exit;
  end;

  fR_RELATORIO.ShowReport;
end;

procedure TFr_vendas_industria2.fR_RELATORIOGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'empresa' then
    Value := nom_empresa
  else if VarName = 'dtaini' then
    Value := FormatDateTime('dd/mm/yyyy', now)
  else if VarName = 'dtafin' then
    Value := FormatDateTime('dd/mm/yyyy', now);

end;

procedure TFr_vendas_industria2.BtnMaisPrecosClick(Sender: TObject);
var
  tipo_rep: string;
begin
  if trim(Mecod_produto.Text) = '' then
  begin
    showmessage('Produto deve ser informado');
    Exit;
  end;

  if representante_funcionario then
    tipo_rep := '1'
  else
    tipo_rep := '0';

  try
    Application.CreateForm(Tfm_mais_precos, fm_mais_precos);

    fm_mais_precos.representante := Prcod_representante.Text;
    fm_mais_precos.tipo_representante := tipo_rep;
    fm_mais_precos.produto := mmVendas2COD_PRODUTO.AsString;

    fm_mais_precos.ShowModal;

    if fm_mais_precos.modalresult = mrOk then
    begin
      mmVendas2PRECO_LIQUIDO.Value := fm_mais_precos.preco_selecionado;
      MeprecoExit(Self);
    end;
  finally
    fm_mais_precos.Free;
  end;
end;

procedure TFr_vendas_industria2.DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  CarregaFoto(mmVendas2COD_PRODUTO.AsString);
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
  Medesconto.Text := StringReplace(Medesconto.Text, '%', '', [rfReplaceAll]);
end;

procedure TFr_vendas_industria2.MedescontoExit(Sender: TObject);
begin
  if ValidarDesc then
  begin
    if not ValidarDesconto then
    begin
      Medesconto.SetFocus;
      Exit;
    end;
  end;

  if mmVendas2DESCONTO.Value > 0 then
  begin
    mmVendas2PRECO_LIQUIDO.Value := roundto(mmVendas2PRECO_VENDA.Value, CasasDecimais*(-1))  - roundto((mmVendas2PRECO_VENDA.Value * mmVendas2DESCONTO.Value / 100), (CasasDecimais * (-1)));
    mmVendas2SUB_TOTAL.Value := mmVendas2PRECO_LIQUIDO.Value * mmVendas2QTD.Value;
  end;
  mmVendas2SUB_TOTAL_BRUTO.Value := mmVendas2PRECO_VENDA.Value * mmVendas2QTD.Value;

  if mmVendas2DESCONTO.Value > 0 then
    mmVendas2DESCONTO_VALOR.Value := mmVendas2SUB_TOTAL_BRUTO.Value - mmVendas2SUB_TOTAL.Value
  else
    mmVendas2DESCONTO_VALOR.Value := 0;
end;

procedure TFr_vendas_industria2.MontaArquivoCobrancaBradescoEnvio;
var
  txt: TextFile;
  dia, mes, ano, ord, ext, pathSaida, tempFile, nosso_numero, nosso_numero_div, sql_cliente: string;
  sequencial_arquivo: integer;

  function CalculaDivNossoNumero(numero: string): string;
  var
    p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13: string;
    soma, resto: integer;

    function converteLetra(letra: string): string;
    var
      variavel: string;
      letter: Char;
    begin
      variavel := '';
      letra := UPPERCASE(letra);
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
    soma := ((strtoint(p1) * 2) + (strtoint(p2) * 7) + (strtoint(p3) * 6) + (strtoint(p4) * 5) + (strtoint(p5) * 4) + (strtoint(p6) * 3) + (strtoint(p7) * 2) + (strtoint(p8) * 7) + (strtoint(p9) * 6) + (strtoint(p10) * 5) + (strtoint(p11) * 4) + (strtoint(p12) * 3) + (strtoint(p13) * 2));
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
  dia := FormatDateTime('dd', now);
  mes := FormatDateTime('mm', now);
  ano := FormatDateTime('yy', now);

  dao.Geral4('SELECT MAX(a.ID)+1 AS ID FROM BOLETO_BRADESCO_ORDEM a WHERE a.DIA = ''' + dia + ''' AND A.MES = ''' + mes + '''');
  if dao.q4.fieldbyname('id').IsNull then
    ord := '01'
  else
    ord := FMFUN.enchezero(dao.q4.fieldbyname('id').AsString, 2);

  if dao.CN.params.values['database'] = 'C:\orbi\trunk\dados\orbi.fdb' then
    ext := '.TST'
  else
    ext := '.REM';

  arquivo := pathSaida + 'CB' + dia + mes + ord + ext;

  AssignFile(txt, tempFile);
  Rewrite(txt);

  // CABEÇALHO 0
  sequencial_arquivo := 1;
  Write(txt, AjustaStr('0', 1));
  Write(txt, AjustaStr('1', 1));
  Write(txt, AjustaStr('REMESSA', 7));
  Write(txt, AjustaStr('01', 2));
  Write(txt, AjustaStr('COBRANCA', 15));
  Write(txt, AjustaStr(FMFUN.enchezero('4222894', 20), 20));
  Write(txt, AjustaStr(FMFUN.AnsiToAscii(Lbempresa_faturamento.Caption), 30));
  Write(txt, AjustaStr('237', 3));
  Write(txt, AjustaStr('BRADESCO', 15));
  Write(txt, AjustaStr(dia + mes + ano, 6));
  Write(txt, AjustaStr('', 8));
  Write(txt, AjustaStr('MX', 2));
  Write(txt, AjustaStr(FMFUN.enchezero(inttostr(strtoint(ord)), 7), 7));
  Write(txt, AjustaStr('', 277));
  Write(txt, AjustaStr(FMFUN.enchezero(inttostr(sequencial_arquivo), 6), 6));
  WriteLn(txt);
  // item
  q_cr1.First;
  while not q_cr1.Eof do
  begin
    Write(txt, AjustaStr('1', 1));
    Write(txt, FMFUN.enchezero('0', 5));
    Write(txt, FMFUN.enchezero('0', 1));
    Write(txt, FMFUN.enchezero('0', 5));
    Write(txt, FMFUN.enchezero('0', 7));
    Write(txt, FMFUN.enchezero('0', 1));
    Write(txt, FMFUN.enchezero('0', 1));
    Write(txt, FMFUN.enchezero('9', 3));
    Write(txt, AjustaStr('2227', 5));
    Write(txt, AjustaStr('0000777', 7));
    Write(txt, AjustaStr('3', 1));
    Write(txt, AjustaStr('', 25));
    Write(txt, AjustaStr('237', 3));
    Write(txt, AjustaStr('0', 1));
    Write(txt, FMFUN.enchezero('0', 4));
    nosso_numero := FMFUN.enchezero(q_cr1.fieldbyname('titulo').AsString, 10) + FMFUN.enchezero(q_cr1.fieldbyname('sequencia').AsString, 2);
    nosso_numero_div := CalculaDivNossoNumero(nosso_numero);
    Write(txt, AjustaStr(nosso_numero, 11));
    Write(txt, AjustaStr(nosso_numero_div, 1));
    Write(txt, FMFUN.enchezero('0', 10));
    Write(txt, FMFUN.enchezero('2', 1));
    Write(txt, 'N');
    Write(txt, AjustaStr('', 11));
    Write(txt, AjustaStr('2', 1));
    Write(txt, AjustaStr('', 2));
    Write(txt, AjustaStr('01', 2));

    Write(txt, AjustaStr(q_cr1.fieldbyname('titulo').AsString, 10));
    Write(txt, AjustaStr(FormatDateTime('ddmmyy', q_cr1.fieldbyname('dtaven').AsDateTime), 6));
    Write(txt, FMFUN.enchezero(StringReplace(FMFUN.DecimalPonto(formatfloat('##0.00', q_cr1.fieldbyname('valor').AsFloat)), '.', '', [rfReplaceAll]), 13));
    Write(txt, FMFUN.enchezero('0', 3));
    Write(txt, FMFUN.enchezero('0', 5));
    Write(txt, AjustaStr('01', 2));
    Write(txt, AjustaStr('N', 1));
    Write(txt, AjustaStr(FormatDateTime('ddmmyy', now), 6));
    Write(txt, AjustaStr('06', 2));
    Write(txt, AjustaStr('05', 2));
    Write(txt, FMFUN.enchezero(StringReplace(FMFUN.DecimalPonto(formatfloat('##0.00', q_cr1.fieldbyname('valor').AsFloat * 0.0017)), '.', '', [rfReplaceAll]), 13));
    Write(txt, FMFUN.enchezero('0', 6));
    Write(txt, FMFUN.enchezero('0', 13));
    Write(txt, FMFUN.enchezero('0', 13));
    Write(txt, FMFUN.enchezero('0', 13));
    /// dados do Cliente.
    sql_cliente := ' SELECT a.COD_CLIENTE, a.NOM_CLIENTE, a.ENDERECO, a.COMPLEMENTO, a.BAIRRO, a.CEP, a.COD_CIDADE, a.TIP_PESSOA, a.CNPJ, a.CPF, a.NR_ENDERECO, cd.NOM_CIDADE, cd.uf ' + ' FROM CLIENTE a ' + ' inner join cidades cd on (cd.COD_CIDADE = a.COD_CIDADE) ' + ' where a.cod_cliente = ' + Prcod_cliente.Text;

    dao.Geral4(sql_cliente);
    if (dao.q4.fieldbyname('TIP_PESSOA').AsString = 'J') then
    begin
      Write(txt, '02');
      Write(txt, AjustaStr(FRPRI.LimpaCNPJ(dao.q4.fieldbyname('CNPJ').AsString), 14));
      Write(txt, AjustaStr(dao.q4.fieldbyname('NOM_CLIENTE').AsString, 40));
      Write(txt, AjustaStr(dao.q4.fieldbyname('ENDERECO').AsString + ' ' + dao.q4.fieldbyname('NR_ENDERECO').AsString, 40));
      Write(txt, AjustaStr(' ', 12));
      Write(txt, AjustaStr(copy(dao.q4.fieldbyname('CEP').AsString, 1, 5), 5));
      Write(txt, AjustaStr(copy(dao.q4.fieldbyname('CEP').AsString, 7, 3), 3));
    end;
    Write(txt, AjustaStr(' ', 60));
    sequencial_arquivo := sequencial_arquivo + 1;
    Write(txt, AjustaStr(FMFUN.enchezero(inttostr(sequencial_arquivo), 6), 6));
    WriteLn(txt);
    q_cr1.next;
  end;
  // RODAPE
  Write(txt, AjustaStr('9', 1));
  Write(txt, AjustaStr(' ', 393));
  sequencial_arquivo := sequencial_arquivo + 1;
  Write(txt, AjustaStr(FMFUN.enchezero(inttostr(sequencial_arquivo), 6), 6));
  WriteLn(txt);

  q_cr1.First;

  CloseFile(txt);
  RenameFile(tempFile, arquivo);
  { dao.cn.StartTransaction;
    dao.Exec_sql.SQL.Clear;
    dao.Exec_sql.SQL.Add('INSERT INTO BOLETO_BRADESCO_ORDEM (ID, DIA, MES) VALUES ('+ord+','''+dia+''','''+mes+''')');
    dao.Exec_sql.ExecSQL;
    dao.cn.Commit; }
end;

procedure TFr_vendas_industria2.BtnAltFormaPrazoClick(Sender: TObject);
var
  NFe: boolean;
  valor_total, vl_frete: currency;
begin
  if not q_cr1.fieldbyname('BOLETO_REMESSA_ORDEM').IsNull then
  begin
    showmessage('Não é permitido alterar a forma de Pagamento onde há Boletos Associados à Remessas.');
    Exit;
  end;

  if BtnAltFormaPrazo.Caption = 'Alterar Forma e Prazo de Pagamento' then
  begin
    BtnBoleto.Enabled := false;
    BtnAltFormaPrazo.Caption := 'Gravar Forma e Prazo de Pagamento';
    Prcod_fop.Enabled := true;
    Probservacoes_pedido.Enabled := true;
    Prcod_prazo_pgto.Enabled := true;
    BtnBoleto.Enabled := false;
    BtnEmailBoleto.Enabled := false;
    Prcod_prazo_pgto.SetFocus;
  end
  else
  begin
    if trim(PrNFE.Text) <> '' then
      NFe := true
    else
      NFe := false;

    dao.Geral1('select count(*) as total from cr1 where nr_documento = ' + Prnumdoc.Text + ' and valor_recebido > 0');

    if dao.q1.fieldbyname('total').AsInteger = 0 then
    begin
      try
        if not dao.cn.InTransaction then
          dao.cn.StartTransaction;
        dao.update('vendas1', 'numdoc', Prnumdoc.Text, 'Pr', Fr_vendas_industria2);
        dao.cn.Commit;
      except
        dao.cn.Rollback;
      end;
      { if not ChecarBoletoNFE(PRCONTA_BOLETO.Text, prnfe.Text) then
        exit; }

      if Prtipo_frete.ItemIndex = 2 then
        vl_frete := Prvl_frete.Value
      else
        vl_frete := 0;

      if NFe and (UF_Cliente <> UF_Emissor) then
        valor_total := Prtot_liquido.Value + vl_frete + Prvlr_st.Value - PrVLR_DESCONTO_GERAL.Value
      else
        valor_total := Prtot_liquido.Value + vl_frete - PrVLR_DESCONTO_GERAL.Value;

      if gerar_cr then
        GerarParcelas(Prnumdoc.Text, Prcod_cliente.Text, Prcod_fop.Text, Prcod_prazo_pgto.Text, valor_total, NFe)
      else
        LimparBoletos;

      ativa_cr1(Prnumdoc.Text);
      // FMFUN.AtualizaDadosComissao(Prnumdoc.Text);

      somaTotal;
    end
    else
    begin
      showmessage('Não é permitido alterar a forma de Pagamento onde há parcelas pagas.');
      BtcanpedClick(Self);
      Pc_vendas.TabIndex := 2;
    end;

    BtnAltFormaPrazo.Caption := 'Alterar Forma e Prazo de Pagamento';

    ControleBoleto;

    Prcod_fop.Enabled := false;
    PrCONTA_BOLETO.Enabled := false;
    Prcod_prazo_pgto.Enabled := false;
    // BtnAltFormaPrazo.SetFocus;
    Probservacoes_pedido.Enabled := false;
    BtnEmailBoleto.Enabled := false;
    BtnBoleto.Enabled := true;
  end;

end;

procedure TFr_vendas_industria2.BtnAltObsClick(Sender: TObject);
begin
  if not BtnAltObs.Enabled then
    Exit;
  if Prnumdoc.Text = '' then
    Exit;

  if BtnAltObs.Caption = 'Alterar Obs.' then
  begin
    Probs_adicional.Enabled := True;
    Probs_adicional.SetFocus;
    BtnAltObs.Caption := 'Gravar Obs.';
  end
  else
  begin
    // Limpa eventual transacao abortada anterior no PostgreSQL
    if dao.cn.InTransaction then
      dao.cn.Rollback;

    try
      dao.cn.StartTransaction;
      dao.Execsql('UPDATE VENDAS1 SET obs_adicional = ' + QuotedStr(Probs_adicional.Text) +
        ' WHERE NUMDOC = ' + Prnumdoc.Text);
      dao.cn.Commit;

      Probs_adicional.Enabled := False;
      BtnAltObs.Caption := 'Alterar Obs.';
    except
      on E: Exception do
      begin
        if dao.cn.InTransaction then
          dao.cn.Rollback;
        dao.msg('Erro ao gravar observacao adicional:' + #13 + E.Message);
      end;
    end;
  end;
end;

procedure TFr_vendas_industria2.MontaArquivoCobrancaEnvio;
var
  txt: TextFile;
  dia, mes, ano, ord, ext, pathSaida, tempFile, nosso_numero, nosso_numero_div, sql_cliente, dir_remessa: string;
  sequencial_arquivo: integer;
begin
  // CABEÇALHO 0
  sequencial_arquivo := 1;
  q_cr1.First;
  FMFUN.ACBrBoleto1.ListadeBoletos.Clear;

  sql_cliente := ' SELECT a.COD_CLIENTE, ' + '   a.NOM_CLIENTE, ' + '   a.ENDERECO, ' + '   a.COMPLEMENTO, ' + '   a.BAIRRO, ' + '   a.CEP, ' + '   a.COD_CIDADE, ' + '   a.TIP_PESSOA, ' + '   a.CNPJ, ' + '   a.CPF, ' + '   a.NR_ENDERECO, ' + '   cd.NOM_CIDADE, ' + '   cd.uf, ' + '   CASE WHEN a.IE IS NULL THEN 1 ELSE 0 END AS ISENTO ' + ' FROM CLIENTE a ' + ' inner join cidades cd on (cd.COD_CIDADE = a.COD_CIDADE) ' + ' where a.cod_cliente = ' + Prcod_cliente.Text;

  dao.Geral4(sql_cliente);

  while not q_cr1.Eof do
  begin
    if (q_cr1.fieldbyname('valor_recebido').IsNull) or (q_cr1.fieldbyname('valor_recebido').Value = 0) then
    begin

      FMFUN.MontaCobrancaItem(dao.q4.fieldbyname('NOM_CLIENTE').AsString, dao.q4.fieldbyname('TIP_PESSOA').AsString, dao.q4.fieldbyname('CNPJ').AsString, dao.q4.fieldbyname('cpf').AsString, dao.q4.fieldbyname('ENDERECO').AsString, dao.q4.fieldbyname('NR_ENDERECO').AsString, dao.q4.fieldbyname('Bairro').AsString, dao.q4.fieldbyname('NOM_CIDADE').AsString, dao.q4.fieldbyname('uf').AsString, dao.q4.fieldbyname('CEP').AsString, carteira_conta, Boleto_Avalista, q_cr1.fieldbyname('titulo').AsString, q_cr1.fieldbyname('sequencia').AsString, q_cr1.fieldbyname('Instrucao_boleto').AsString+#13+mensagem_padrao, q_cr1.fieldbyname('dtaven').AsDateTime, dias_protesto, dias_baixar, dao.q4.fieldbyname('isento').AsInteger, q_cr1.fieldbyname('valor').AsFloat);
    end;
    q_cr1.next;
  end;
  q_cr1.First;
end;

procedure TFr_vendas_industria2.BtnBoletoClick(Sender: TObject);
begin

  // fmfun.ACBrBoleto1.GerarRemessa(strtoint(id_remessa));
  MontaArquivoCobrancaEnvio;
  FMFUN.ACBrBoletoFCFR1.DirLogo := ExtractFilePath(Application.ExeName) + '\Logos\colorido\';
  FMFUN.ACBrBoletoFCFR1.FastReportFile := ExtractFilePath(Application.ExeName) + 'Relatorios\Boleto.fr3';
  if trim(PrCONTA_BOLETO.Text) = '' then
  begin
    showmessage('É necessário informar a Conta Corrente do Boleto.');
    Exit;
  end;
  if q_cr1.IsEmpty then
    Exit;
  FMFUN.ACBrBoleto1.Imprimir;
end;

procedure TFr_vendas_industria2.FormCreate(Sender: TObject);
begin
  FMFUN.ACBrBoleto1.Cedente.TipoInscricao := pJuridica;

  Mepreco.DecimalPlaces := CasasDecimais;
  Meqtd.DecimalPlaces := 2;
  Medesconto_Valor.DecimalPlaces := 2;
  Mesub_total.DecimalPlaces := 2;
  Mevlr_icms_st.DecimalPlaces := 2;
  Mevlr_bc_st.DecimalPlaces := 2;
  Mevlr_bc.DecimalPlaces := 2;
  Meipi_item.DecimalPlaces := 2;
  Mevlr_ipi_item.DecimalPlaces := 2;
  Mevlr_agr_item.DecimalPlaces := 2;
  Meicms_item.DecimalPlaces := 2;
  Mevlr_icms_item.DecimalPlaces := 2;
  MePRECO_CUSTO.DecimalPlaces := 2;
  MePrecoBase.DecimalPlaces := 2;

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
        Medesconto_Valor.DisplayFormat := 'R$ #,##0.00';
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
        Prtot_bruto.DisplayFormat := 'R$ #,##0.00';
        PrValorDescontoAdic.DisplayFormat := 'R$ #,##0.00';
        Prtot_liquido.DisplayFormat := 'R$ #,##0.00';
        Prvlr_bc_icms.DisplayFormat := 'R$ #,##0.00';
        Prvlr_icms.DisplayFormat := 'R$ #,##0.00';
        PrVLR_BC_ICMS_ST.DisplayFormat := 'R$ #,##0.00';
        Prvlr_st.DisplayFormat := 'R$ #,##0.00';
        Prvlr_ipi.DisplayFormat := 'R$ #,##0.00';
        edTotComissao.DisplayFormat := 'R$ #,##0.00';

        Meqtd.DisplayFormat := '#,##0.00';
        Mepreco.DisplayFormat := 'R$ #,##0.000';
        Mesub_total.DisplayFormat := 'R$ #,##0.00';
        Mevlr_icms_st.DisplayFormat := 'R$ #,##0.00';
        Mevlr_bc_st.DisplayFormat := 'R$ #,##0.00';
        Mevlr_bc.DisplayFormat := 'R$ #,##0.00';
        Mevlr_ipi_item.DisplayFormat := 'R$ #,##0.00';
        Mevlr_agr_item.DisplayFormat := 'R$ #,##0.00';
        Mevlr_icms_item.DisplayFormat := 'R$ #,##0.00';
        MePRECO_CUSTO.DisplayFormat := 'R$ #,##0.00';
        Medesconto_Valor.DisplayFormat := 'R$ #,##0.00';
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
        mmVendas2PRECO_LIQUIDO.DisplayFormat := 'R$ #,##0.000';
        mmVendas2PRECO_CUSTO.DisplayFormat := 'R$ #,##0.00';
        mmVendas2PRECO_VENDA.DisplayFormat := 'R$ #,##0.000';
        mmVendas2PRECO_BASE.DisplayFormat := 'R$ #,##0.00';
      end;
    4:
      begin
        Prtot_bruto.DisplayFormat := 'R$ #,##0.00';
        PrValorDescontoAdic.DisplayFormat := 'R$ #,##0.00';
        Prtot_liquido.DisplayFormat := 'R$ #,##0.00';
        Prvlr_bc_icms.DisplayFormat := 'R$ #,##0.00';
        Prvlr_icms.DisplayFormat := 'R$ #,##0.00';
        PrVLR_BC_ICMS_ST.DisplayFormat := 'R$ #,##0.00';
        Prvlr_st.DisplayFormat := 'R$ #,##0.00';
        Prvlr_ipi.DisplayFormat := 'R$ #,##0.00';
        edTotComissao.DisplayFormat := 'R$ #,##0.00';

        Meqtd.DisplayFormat := '#,##0.00';
        Mepreco.DisplayFormat := 'R$ #,##0.0000';
        Mesub_total.DisplayFormat := 'R$ #,##0.00';
        Mevlr_icms_st.DisplayFormat := 'R$ #,##0.00';
        Mevlr_bc_st.DisplayFormat := 'R$ #,##0.00';
        Mevlr_bc.DisplayFormat := 'R$ #,##0.00';
        Mevlr_ipi_item.DisplayFormat := 'R$ #,##0.00';
        Mevlr_agr_item.DisplayFormat := 'R$ #,##0.00';
        Mevlr_icms_item.DisplayFormat := 'R$ #,##0.00';
        MePRECO_CUSTO.DisplayFormat := 'R$ #,##0.00';
        Medesconto_Valor.DisplayFormat := 'R$ #,##0.00';
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
        mmVendas2PRECO_LIQUIDO.DisplayFormat := 'R$ #,##0.0000';
        mmVendas2PRECO_CUSTO.DisplayFormat := 'R$ #,##0.00';
        mmVendas2PRECO_VENDA.DisplayFormat := 'R$ #,##0.0000';
        mmVendas2PRECO_BASE.DisplayFormat := 'R$ #,##0.00';
      end;
  end;

end;

procedure TFr_vendas_industria2.Mecod_produtoButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  try
    Application.CreateForm(TFr_localizar, Fr_localizar);

    // guardar os valores antigos
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

    Fr_localizar.ShowModal;
    Fr_localizar.Free;

    chamou_form := chamou_form_old;
    chamou_pesquisa := chamou_pesquisa_old;
  finally
    Mecod_produtoExit(Self);
  end;
end;

procedure TFr_vendas_industria2.Mecod_produtoChange(Sender: TObject);
begin
  if produto_anterior = '' then
    Exit;
  if produto_anterior <> Mecod_produto.Text then
  begin
    produto_alterado := true;
    { if not (mmVendas2.state in [dsBrowse]) then
      mmVendas2desconto.Value := 0; }
    CalculaSubTotais;
  end;
end;

procedure TFr_vendas_industria2.Mecod_produtoEnter(Sender: TObject);
begin
  produto_anterior := Mecod_produto.Text;
end;

procedure TFr_vendas_industria2.Mecod_produtoExit(Sender: TObject);
begin
  formatsettings.DecimalSeparator := ',';

  if ActiveControl <> nil then
  begin
    if (ActiveControl.Name = 'btgra') or (ActiveControl.Name = 'btcan') then
      Exit;
  end;

  if mmVendas2.State in [dsBrowse] then
    Exit;
  if Prcod_cliente.Text <> '' then
  begin
    dao.Geral1('select cd.uf, CASE WHEN (C.ie is null or C.IE = ''ISENTO'') THEN ''1'' ELSE ''0'' END AS ISENTO from cliente c ' + 'left join cidades cd on cd.cod_cidade=c.cod_cidade ' + 'where cod_cliente=' + QuotedStr(Prcod_cliente.Text));
    UF_Cliente := dao.q1.fieldbyname('uf').AsString;

    dao.Geral2('select * from icms where uf=' + QuotedStr(dao.q1.fieldbyname('uf').AsString));
    Meicms_item.Text := dao.q2.fieldbyname('icms').AsString;
  end;

  if Prcod_fornecedor.Text <> '' then
  begin
    dao.Geral1('select cd.uf, CASE WHEN (C.IERG is null or C.IERG = ''ISENTO'') THEN 1 ELSE 0 END AS ISENTO from fornecedor c ' + 'left join cidades cd on cd.cod_cidade=c.cod_cidade ' + 'where cod_fornecedor=' + QuotedStr(Prcod_fornecedor.Text));
    UF_Cliente := dao.q1.fieldbyname('uf').AsString;

    dao.Geral2('select * from icms where uf=' + QuotedStr(dao.q1.fieldbyname('uf').AsString));
    Meicms_item.Text := dao.q2.fieldbyname('icms').AsString;
  end;

  if trim(Mecod_produto.Text) <> '' then
  begin
    if (not FMFUN.verificaNumerico(Mecod_produto.Text)) and (length(Mecod_produto.Text) > 0) then
    begin
      dao.msg('Dado tem que ser sempre Numérico!');
      Mecod_produto.SetFocus;
      Exit;
    end;

    dados_produto(Mecod_produto.Text);

    if Meqtd.Value > 0 then
      PromocaoPorQuantidade(Meqtd.Text);

  end
  else
  begin
    dao.msg('O Campo Produto deve ser Preenchido!');
    Mecod_produto.SetFocus;
    Exit;
  end;

  if (mmVendas2VOLUME.Value = 0) then
    mmVendas2VOLUME.Value := 1;
end;

procedure TFr_vendas_industria2.PrCONTA_BOLETOButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  // guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Conta corrente';
  chamou_pesquisa := 'fr_conta_corrente';
  chamou_form := 'fr_cc_vendas';
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

  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_vendas_industria2.PrCONTA_BOLETOExit(Sender: TObject);
var
  sql_boleto: string;
begin
  if trim(PrCONTA_BOLETO.Text) = '' then
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
      end; }
    { else
      ChecarBoletoEmpresa(conta_boleto, empresa_faturar); }

    if (not FMFUN.verificaNumerico(PrCONTA_BOLETO.Text)) and (length(PrCONTA_BOLETO.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      PrCONTA_BOLETO.SetFocus;
      Exit;
    end;

    sql_boleto := 'select c.id, e.cod_empresa, C.DIAS_PROTESTO, C.DIAS_BAIXAR, b.NOM_BANCO, b.NR_BANCO, ' + 'b.LAYOUT_REMESSA, c.nr_conta, c.codigo_cedente, c.nr_agencia, c.dta_abertura_conta, ' + 'c.convenio, coalesce(C.NOME_CORRENTISTA, e.NOM_EMPRESA) as nome_correntista, C.CARTEIRA, e.CNPJ, e.ENDERECO, e.NR_ENDERECO, ' + 'e.CEP, cd.NOM_CIDADE, cd.UF, c.tipo_cobranca, c.codigo_transmissao, c.mensagem_padrao ' + 'from conta_corrente c ' + 'inner join banco b on b.ID = c.ID_BANCO ' + 'inner join empresa e on (e.COD_EMPRESA = c.ID_EMPRESA) ' + 'inner join cidades cd on cd.COD_CIDADE = e.COD_CIDADE ' + 'where c.id=' + QuotedStr(PrCONTA_BOLETO.Text);

    if PrCONTA_BOLETO.Enabled then
      sql_boleto := sql_boleto + ' and c.ativo = ''S'' ';

    dao.Geral2(sql_boleto);

    if dao.q2.RecordCount > 0 then
    begin
      lbCCBoleto.Caption := dao.q2.fieldbyname('nom_banco').AsString + ' - ' + dao.q2.fieldbyname('nr_agencia').AsString + '/' + dao.q2.fieldbyname('nr_conta').AsString;
      if dao.q2.fieldbyname('LAYOUT_REMESSA').AsString = 'c240' then
        FMFUN.ACBrBoleto1.LayoutRemessa := c240
      else
        FMFUN.ACBrBoleto1.LayoutRemessa := c400;

      case dao.q2.fieldbyname('nr_banco').AsInteger of
        1:
          begin
            FMFUN.ACBrBoleto1.Banco.TipoCobranca := cobBancoDoBrasil;
            if dao.q2.fieldbyname('tipo_cobranca').AsString = '1' then
              FMFUN.ACBrBoleto1.Cedente.CaracTitulo := tcSimples;

            if dao.q2.fieldbyname('tipo_cobranca').AsString = '2' then
              FMFUN.ACBrBoleto1.Cedente.CaracTitulo := tcVinculada;

            if dao.q2.fieldbyname('tipo_cobranca').AsString = '3' then
              FMFUN.ACBrBoleto1.Cedente.CaracTitulo := tcDescontada;
          end;
        104:
          FMFUN.ACBrBoleto1.Banco.TipoCobranca := cobCaixaEconomica;
        237:
          FMFUN.ACBrBoleto1.Banco.TipoCobranca := cobBradesco;
        341:
          FMFUN.ACBrBoleto1.Banco.TipoCobranca := cobItau;
        87:
          FMFUN.ACBrBoleto1.Banco.TipoCobranca := cobBradesco;
        756:
          begin
            FMFUN.ACBrBoleto1.Banco.TipoCobranca := cobBancoob;
            if dao.q2.fieldbyname('tipo_cobranca').AsString = '1' then
              FMFUN.ACBrBoleto1.Cedente.CaracTitulo := tcSimples;

            if dao.q2.fieldbyname('tipo_cobranca').AsString = '2' then
              FMFUN.ACBrBoleto1.Cedente.CaracTitulo := tcVinculada;

            if dao.q2.fieldbyname('tipo_cobranca').AsString = '3' then
              FMFUN.ACBrBoleto1.Cedente.CaracTitulo := tcDescontada;

            FMFUN.ACBrBoleto1.Cedente.Modalidade := '01';
          end;

        33:
          begin
            FMFUN.ACBrBoleto1.Banco.TipoCobranca := cobSantander;
            if dao.q2.fieldbyname('tipo_cobranca').AsString = '1' then
              FMFUN.ACBrBoleto1.Cedente.CaracTitulo := tcSimples;

            if dao.q2.fieldbyname('tipo_cobranca').AsString = '2' then
              FMFUN.ACBrBoleto1.Cedente.CaracTitulo := tcVinculada;

            if dao.q2.fieldbyname('tipo_cobranca').AsString = '3' then
              FMFUN.ACBrBoleto1.Cedente.CaracTitulo := tcDescontada;
          end;
        41:
          FMFUN.ACBrBoleto1.Banco.TipoCobranca := cobBanrisul;

        85:
          FMFUN.ACBrBoleto1.Banco.TipoCobranca := cobBancoCECRED;

      end;

      if pos('-', dao.Q2.fieldbyname('nr_agencia').AsString) > 0 then
      begin
        fmfun.ACBrBoleto1.Cedente.Agencia := copy(dao.Q2.fieldbyname('nr_agencia').AsString, 1, pos('-', dao.Q2.fieldbyname('nr_agencia').AsString) - 1);
        fmfun.ACBrBoleto1.Cedente.AgenciaDigito := copy(dao.Q2.fieldbyname('nr_agencia').AsString, pos('-', dao.Q2.fieldbyname('nr_agencia').AsString) + 1, 2);
      end
      else
        fmfun.ACBrBoleto1.Cedente.Agencia := dao.Q2.fieldbyname('nr_agencia').AsString;


      FMFUN.ACBrBoleto1.Cedente.AgenciaDigito := copy(dao.q2.fieldbyname('nr_agencia').AsString, Pos('-', dao.q2.fieldbyname('nr_agencia').AsString) + 1, 2);
      FMFUN.ACBrBoleto1.Cedente.Conta := copy(dao.q2.fieldbyname('nr_conta').AsString, 1, Pos('-', dao.q2.fieldbyname('nr_conta').AsString) - 1);
      FMFUN.ACBrBoleto1.Cedente.ContaDigito := copy(dao.q2.fieldbyname('nr_conta').AsString, Pos('-', dao.q2.fieldbyname('nr_conta').AsString) + 1, 2);
      FMFUN.ACBrBoleto1.Cedente.CodigoCedente := dao.q2.fieldbyname('codigo_cedente').AsString;
      FMFUN.ACBrBoleto1.Cedente.Convenio := dao.q2.fieldbyname('convenio').AsString;
      FMFUN.ACBrBoleto1.Cedente.nome := dao.q2.fieldbyname('NOME_CORRENTISTA').AsString;

      FMFUN.ACBrBoleto1.Cedente.CNPJCPF := dao.q2.fieldbyname('CNPJ').AsString;
      FMFUN.ACBrBoleto1.Cedente.Logradouro := dao.q2.fieldbyname('ENDERECO').AsString;
      FMFUN.ACBrBoleto1.Cedente.NumeroRes := dao.q2.fieldbyname('NR_ENDERECO').AsString;
      FMFUN.ACBrBoleto1.Cedente.Cidade := dao.q2.fieldbyname('NOM_CIDADE').AsString;
      FMFUN.ACBrBoleto1.Cedente.UF := dao.q2.fieldbyname('UF').AsString;

      dias_protesto := dao.q2.fieldbyname('DIAS_PROTESTO').AsInteger;
      dias_baixar := dao.q2.fieldbyname('DIAS_BAIXAR').AsInteger;
      carteira_conta := dao.q2.fieldbyname('CARTEIRA').AsString;
      mensagem_padrao := dao.q2.fieldbyname('mensagem_padrao').AsString;
      if dao.q2.fieldbyname('nr_banco').AsInteger = 33 then
      begin
        FMFUN.ACBrBoleto1.Cedente.CodigoTransmissao := dao.q2.fieldbyname('codigo_transmissao').AsString;
        FMFUN.ACBrBoleto1.Cedente.Modalidade := carteira_conta;
      end;
      if dao.q2.fieldbyname('nr_banco').AsInteger = 87 then
      begin

        Boleto_Avalista := dao.q2.fieldbyname('CNPJ').AsString + ' - CNPJ ' + dao.q2.fieldbyname('CNPJ').AsString + ' ' + dao.q2.fieldbyname('ENDERECO').AsString + ', ' + dao.q2.fieldbyname('NR_ENDERECO').AsString + ' - ' + dao.q2.fieldbyname('CEP').AsString + ', ' + dao.q2.fieldbyname('NOM_CIDADE').AsString + '-' + dao.q2.fieldbyname('UF').AsString;

        FMFUN.ACBrBoleto1.Cedente.nome := 'UNICRED LITORAL E NORTE CATARINENSE';
        FMFUN.ACBrBoleto1.Cedente.Logradouro := 'RUA CAMBORIÚ, Nº 519 - CENTRO';
        FMFUN.ACBrBoleto1.Cedente.Bairro := 'CENTRO';
        FMFUN.ACBrBoleto1.Cedente.Cidade := 'ITAJAI';
        FMFUN.ACBrBoleto1.Cedente.UF := 'SC';
        FMFUN.ACBrBoleto1.Cedente.CNPJCPF := '74114042000190';
        FMFUN.ACBrBoleto1.Cedente.CEP := '80301451';

      end;

      if modo_insert and (trim(Prempresa_faturar.Text) = '') then
      begin
        Pc_vendas.ActivePage := tab_finalizar;
        Prempresa_faturar.Text := dao.q2.fieldbyname('cod_empresa').AsString;
        Prempresa_faturarExit(Self);
      end;

      Prcod_fopExit(Self);
    end
    else
    begin
      dao.msg('Registro não Encontrado ou Desativado!');
      PrCONTA_BOLETO.Text := '';
      PrCONTA_BOLETO.SetFocus;
      Exit;
    end;
  end;

end;

procedure TFr_vendas_industria2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Prnumdoc.Text <> '' then
    LiberarPedido(Prnumdoc.Text);
end;

procedure TFr_vendas_industria2.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if Btnovped.Enabled = false then
  begin
    showmessage('<ATENÇÃO>ALGUM BOTÃO GRAVAR/CANCELAR ESTÁ PENDENTE!<ATENÇÃO>');
    CanClose := false;
  end
  else
    CanClose := true;
end;

function TFr_vendas_industria2.ChecarEmailCliente(cliente, tipo: string): boolean;
var
  ajustar_cliente: boolean;
  mensagem: string;
begin
  ajustar_cliente := false;
  dao.Geral4('SELECT EMAIL, EMAIL_END_NFE, NFE_EMAIL FROM CLIENTE WHERE COD_CLIENTE = ' + Prcod_cliente.Text);

  if dao.q4.fieldbyname('EMAIL_END_NFE').IsNull then
  begin
    showmessage('Email do Cliente para NFe não Definido no Cadastro de Clientes!');
    ajustar_cliente := true;
  end;

  if dao.q4.fieldbyname('NFE_EMAIL').AsString <> 'S' then
  begin
    showmessage('Opção de Envio da NFe no Cadastro de Clientes não Definida!');
    ajustar_cliente := true;
  end;

  if ajustar_cliente = false then
  begin
    if tipo = 'nfe' then
      mensagem := 'Email de NFe à ser enviado para: ' + dao.q4.fieldbyname('EMAIL_END_NFE').AsString + '. Desejas Alterar?';

    if MessageDlg(mensagem, mtConfirmation, [mbYes, mbno], 0) = mryes then
      ajustar_cliente := true;
  end;

  if ajustar_cliente then
  begin
    try
      Application.CreateForm(TFr_Cliente, Fr_Cliente);
      Fr_Cliente.dados_incompletos := true;
      Fr_Cliente.cliente := Prcod_cliente.Text;
      Fr_Cliente.ShowModal;
    finally
      Fr_Cliente.Free;
    end;
    Exit;
  end;
  Result := not ajustar_cliente;
end;

procedure TFr_vendas_industria2.BtnEmailNFeClick(Sender: TObject);
begin
  if mform = 'vendas_devolucoes' then
    Exit;

  if not ChecarEmailCliente(Prcod_cliente.Text, 'nfe') then
    Exit;

  FRPRI.EnvioEmailNFE(Prnumdoc.Text, 'Saída');
end;

procedure TFr_vendas_industria2.BtnEmailNFe_DevClick(Sender: TObject);
begin
  if mform = 'vendas_devolucoes' then
    Exit;

  if not ChecarEmailCliente(Prcod_cliente.Text, 'nfe') then
    Exit;

  FRPRI.EnvioEmailNFE(Prnumdoc.Text, 'Entrada');
end;

procedure TFr_vendas_industria2.BtnEmailPedidoClick(Sender: TObject);
begin
  if not ChecarEmailCliente(Prcod_cliente.Text, 'pedido') then
    Exit;

  FRPRI.EnvioEmailPedidos(Prnumdoc.Text);
end;


procedure TFr_vendas_industria2.MeqtdExit(Sender: TObject);
begin
  if ActiveControl.Name = 'btcan' then
    Exit;

  if mmVendas2.State in [dsBrowse] then
    Exit;

  if Meqtd.Value = 0 then
  begin
    showmessage('Quantidade tem que ser preenchida.');
    Meqtd.SetFocus;
    Exit;
  end;

  if trim(mmVendas2COD_PRODUTO.AsString) <> '' then
    if not FMFUN.ValidarQuantidade(mmVendas2COD_PRODUTO.AsString, mmVendas2QTD.Value) then
    begin
      Meqtd.SetFocus;
      Exit;
    end;

  mmVendas2PRECO_LIQUIDO.Value := mmVendas2PRECO_VENDA.Value - (mmVendas2PRECO_VENDA.Value * mmVendas2DESCONTO.Value / 100);
  mmVendas2SUB_TOTAL.Value := mmVendas2PRECO_LIQUIDO.Value * mmVendas2QTD.Value;
  mmVendas2PESO_TOTAL.Value := mmVendas2PESO.Value * mmVendas2QTD.Value;
  Meipi_itemExit(Self);

  PromocaoPorQuantidade(mmVendas2QTD.AsString);
  mmVendas2DESCONTO_MAXIMO.Value := mmVendas2DESCONTO_MAXIMO.Value + desconto_prazo;
end;

procedure TFr_vendas_industria2.MeqtdKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in [',']) and (Pos(formatsettings.DecimalSeparator, Meqtd.Text) <> 0) then
    Key := #0;
end;

procedure TFr_vendas_industria2.MevolumeKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in [',']) and (Pos(formatsettings.DecimalSeparator, Mevolume.Text) <> 0) then
    Key := #0;
end;

procedure TFr_vendas_industria2.MePreco_vendaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in [',']) and (Pos(formatsettings.DecimalSeparator, MePreco_venda.Text) <> 0) then
    Key := #0;
end;

procedure TFr_vendas_industria2.MedescontoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in [',']) and (Pos(formatsettings.DecimalSeparator, Medesconto.Text) <> 0) then
    Key := #0;
end;

procedure TFr_vendas_industria2.MeprecoExit(Sender: TObject);
begin
  if mmVendas2.State in [dsBrowse] then
    Exit;

  // Subtotal = Preco * Qtd, arredonda para 2 casas
  mmVendas2SUB_TOTAL.Value := RoundTo(mmVendas2PRECO_VENDA.Value * mmVendas2QTD.Value, -2);
  // Recalcula preco a partir do subtotal arredondado
  if mmVendas2QTD.Value <> 0 then
    mmVendas2PRECO_VENDA.Value := mmVendas2SUB_TOTAL.Value / mmVendas2QTD.Value;

  mmVendas2DESCONTO.Value := 100 - ((mmVendas2PRECO_LIQUIDO.Value / (mmVendas2PRECO_VENDA.Value) * 100));

  if not ValidarDesconto then
  begin
    mmVendas2PRECO_LIQUIDO.Value := mmVendas2PRECO_VENDA.Value;
    Mepreco.SetFocus;
    Exit;
  end;

  mmVendas2PRECO_LIQUIDO.Value := roundto(mmVendas2PRECO_VENDA.Value - (mmVendas2PRECO_VENDA.Value * mmVendas2DESCONTO.Value / 100), (CasasDecimais * (-1)));
  mmVendas2SUB_TOTAL.Value := RoundTo(mmVendas2PRECO_LIQUIDO.Value * mmVendas2QTD.Value, -2);

  { if Meicms_item.visible then
    Meicms_item.setfocus; }
end;

procedure TFr_vendas_industria2.MeprecoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in [',']) and (Pos(formatsettings.DecimalSeparator, Mepreco.Text) <> 0) then
    Key := #0;
end;

procedure TFr_vendas_industria2.Mesub_totalExit(Sender: TObject);
begin
  Mevlr_bc_icms.Value := Mesub_total.Value;
  btgraClick(Self);
end;

procedure TFr_vendas_industria2.Mesub_totalKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in [',']) and (Pos(formatsettings.DecimalSeparator, Mesub_total.Text) <> 0) then
    Key := #0;
end;

procedure TFr_vendas_industria2.Meicms_itemKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in [',']) and (Pos(formatsettings.DecimalSeparator, Meicms_item.Text) <> 0) then
    Key := #0;
end;

procedure TFr_vendas_industria2.Mevlr_icms_itemKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in [',']) and (Pos(formatsettings.DecimalSeparator, Mevlr_icms_item.Text) <> 0) then
    Key := #0;
end;

procedure TFr_vendas_industria2.Meipi_itemKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in [',']) and (Pos(formatsettings.DecimalSeparator, Meipi_item.Text) <> 0) then
    Key := #0;
end;

procedure TFr_vendas_industria2.Mevlr_ipi_itemKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in [',']) and (Pos(formatsettings.DecimalSeparator, Mevlr_ipi_item.Text) <> 0) then
    Key := #0;
end;

procedure TFr_vendas_industria2.BtnEditarCCClick(Sender: TObject);
begin
  if not q_cce.Active then
    Exit;

  if q_cce.IsEmpty then
    Exit;

  q_cce.Edit;
  PrCartaCorrecao.Enabled := True;
  PrCartaCorrecao.SetFocus;
end;

procedure TFr_vendas_industria2.BtnInsCCClick(Sender: TObject);
begin
  if not q_cce.Active then
    Exit;

  q_cce.Insert;
  PrCartaCorrecao.Enabled := True;
  PrCartaCorrecao.SetFocus;
end;

procedure TFr_vendas_industria2.BtnCancelCCClick(Sender: TObject);
begin
  if not q_cce.Active then
    Exit;

  if q_cce.State in dsEditModes then
    q_cce.Cancel;
end;
procedure TFr_vendas_industria2.BtnGravarCCClick(Sender: TObject);
var
  id: Integer;
  ExisteRegistro: Boolean;
begin
  if Trim(PrCartaCorrecao.Text) = '' then
  begin
    dao.msg('Para a Carta de Corre'#231#227'o da NF-e, '#233' necess'#225'rio informar o Motivo!');
    Exit;
  end;

  try
    dao.Geral1('Select Max(id) as ultimo_evento from carta_correcao where numdoc = ' + Prnumdoc.Text);

    ExisteRegistro := False;
    if (not dao.q1.IsEmpty) and (not dao.q1.FieldByName('ultimo_evento').IsNull) then
    begin
      id := dao.q1.FieldByName('ultimo_evento').AsInteger;
      ExisteRegistro := id > 0;
    end
    else
      id := 1;

    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;

    if ExisteRegistro then
      dao.Execsql('UPDATE CARTA_CORRECAO SET CARTACORRECAO = ' + QuotedStr(PrCartaCorrecao.Text) +
        ' WHERE NUMDOC = ' + Prnumdoc.Text + ' AND ID = ' + IntToStr(id))
    else
      dao.Execsql('INSERT INTO CARTA_CORRECAO (ID, NUMDOC, CARTACORRECAO) VALUES (' +
        IntToStr(id) + ',' + Prnumdoc.Text + ',' + QuotedStr(PrCartaCorrecao.Text) + ')');

    dao.cn.Commit;
    DadosCCe;
  except
    on E: Exception do
    begin
      if dao.cn.InTransaction then
        dao.cn.Rollback;
      dao.msg('Erro ao gravar Carta de Corre'#231#227'o: ' + E.Message);
    end;
  end;
end;

procedure TFr_vendas_industria2.DadosCCe;
begin
  q_cce.close;
  q_cce.sql.Clear;
  q_cce.sql.Text := 'SELECT a.ID, a.CARTACORRECAO, a.xml FROM CARTA_CORRECAO a where a.NUMDOC = ' + Prnumdoc.Text;
  q_cce.Open;
  sbDANFCe.Enabled := not q_cce.IsEmpty;

end;

procedure TFr_vendas_industria2.BtnEnviarCCClick(Sender: TObject);
var
  CCNFe: TNFeCC;
  id: integer;
  chave: string;
begin
  if trim(PrCartaCorrecao.Text) = '' then
  begin
    dao.msg('Para a Carta de Correção da NF-e, é necessário informar o Motivo!');
    Exit;
  end;

  BtnGravarCCClick(Sender);

  dao.Geral1('Select Max(id) as ultimo_evento from carta_correcao where numdoc = ' + Prnumdoc.Text);
  if dao.q1.IsEmpty or dao.q1.FieldByName('ultimo_evento').IsNull then
  begin
    dao.msg('N'#227'o foi poss'#237'vel obter o evento da Carta de Corre'#231#227'o para envio.');
    Exit;
  end;
  id := dao.q1.FieldByName('ultimo_evento').AsInteger;

  if rgTipoCarta.ItemIndex = 0 then
    chave := PrChave_NFe.Text
  else
    chave := PrChave_NFe_DEV.Text;

{  Application.CreateForm(TFr_nfe_transmissao, Fr_nfe_transmissao);
  CCNFe := TNFeCC.Create(chave, inttostr(id), FMFUN.AnsiToAscii(PrCartaCorrecao.Text));

  Fr_nfe_transmissao.lbResultado.Caption := 'Carta de Correção da Nota Fiscal';
  Fr_nfe_transmissao.lbResultado.Visible := true;

  Fr_nfe_transmissao.sCheckBox1.Visible := true;
  Fr_nfe_transmissao.sCheckBox1.Caption := 'Buscar Certificado.';

  Fr_nfe_transmissao.sCheckBox2.Visible := true;
  Fr_nfe_transmissao.sCheckBox2.Caption := 'Enviando Carta de Correção.';

  Fr_nfe_transmissao.Gauge1.MaxValue := 2;
  Fr_nfe_transmissao.Height := Fr_nfe_transmissao.Height + (16 * 2);
  Fr_nfe_transmissao.Gauge1.Progress := 0;

  Fr_nfe_transmissao.ShowModal;

  if Fr_nfe_transmissao.modalresult = mrOk then
    DadosCCe;
 }

    try
      if not (dao.cn.InTransaction) then
        (dao.cn.StartTransaction);
      dao.Execsql('update vendas1 set status_emissor = ''AGUARDANDO'', solicitar_emissor = ''CARTA DE CORREÇÃO'', status_motivo = null where numdoc=' + QuotedStr(Prnumdoc.Text));
      dao.cn.Commit;
      Prempresa_faturar.ReadOnly := true;
    except
      dao.cn.Rollback;
    end;


  try
    Application.CreateForm(TFr_status_emissor, Fr_status_emissor);
    Fr_status_emissor.StartWait('NFE', Prnumdoc.Text, 'CARTA DE CORREÇÃO');
    Fr_status_emissor.ShowModal;
  finally
    if Assigned(Fr_status_emissor) then
      Fr_status_emissor := nil;

    CarregaDados;
    q_cce.Last;

    if not q_cce.fieldbyname('XML').IsNull then
      sbDANFCeClick(Self);
  end;
end;

constructor TNFeCC.Create(ChaveNfe, Evento, Justificativa: string);
begin
  inherited Create(true);
  { Chama o contrutor herdado. Ele irá temporariamente colocar o thread em estado de espera para depois executá-lo. }
  FreeOnTerminate := true; // Libera o objeto após terminar.
  Priority := TpLower;
  { Configura sua prioridade na lista de processos do Sistema operacional. }
  cChaveNfe := ChaveNfe;
  cEvento := Evento;
  cJustificativa := Justificativa;

  pathSaida := ExtractFilePath(Application.ExeName) + 'nf\';
  id := Evento;
  numdoc := Fr_vendas_industria2.Prnumdoc.Text;

  Resume; // Inicia o Thread.
end;

procedure TNFeCC.Execute;
var
  reciboLst: TStringList;
  smensagem: WideString;
begin
  try
    CoInitialize(nil);

    cont := 1;

    try
      smensagem := Fr_vendas_industria2.ACBrNFe1.ssl.selecionarcertificado;
    except
      on e: Exception do
      begin
        erro := true;
        msgerros := e.Message;
        Synchronize(Mostra);
        Exit;
      end;
    end;

    Synchronize(Mostra);

    FRPRI.DesabilitaTimers;
    { if FMFUN.BuscaAmbienteNFE = taProducao then
      tipAmb := 1
      else
      tipAmb := 2; }
    cont := 2;
    Fr_vendas_industria2.ACBrNFe1.Configuracoes.WebServices.Ambiente := FMFUN.BuscaAmbienteNFE;
    Synchronize(Mostra);

    try
      Fr_vendas_industria2.ACBrNFe1.CartaCorrecao.CCe.Evento.Clear;
      with Fr_vendas_industria2.ACBrNFe1.CartaCorrecao.CCe.Evento.Add do
      begin
        infEvento.chNFe := cChaveNfe;
        infEvento.cOrgao := Fr_vendas_industria2.ACBrNFe1.Configuracoes.WebServices.UFCodigo;

        dao.Geral2('SELECT ' +
                   '  current_timestamp as hoje, ' +
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
                   'WHERE cod_empresa=' + QuotedStr(Fr_vendas_industria2.Prempresa_faturar.Text));

        if dao.q2.RecordCount > 0 then
          infEvento.CNPJ := FRPRI.LimpaCNPJ(dao.q2.fieldbyname('CNPJ').AsString)
        else
          Exit;

        Fr_vendas_industria2.ACBrNFe1.Configuracoes.WebServices.UF := Fr_vendas_industria2.UF_Emissor;

        infEvento.cOrgao := Fr_vendas_industria2.ACBrNFe1.Configuracoes.WebServices.UFCodigo;
        //infEvento.dhEvento := IncHour(Now(),-1);
        infEvento.dhEvento := Now;
        infEvento.tpEvento := teCCe;
        infEvento.nSeqEvento := strtoint(cEvento);
        infEvento.versaoEvento := '1.00';
        infEvento.detEvento.descEvento := 'Carta de Correção';
        infEvento.detEvento.xCorrecao := cJustificativa;
        infEvento.detEvento.xCondUso := '';
        // Texto fixo conforme NT 2011.003 -  http://www.nfe.fazenda.gov.br/portal/exibirArquivo.aspx?conteudo=tsiloeZ6vBw=
      end;
    except
      on e: Exception do
      begin
        msgerros := e.Message;
        erro := true;
      end;
    end;

    try
      Fr_vendas_industria2.ACBrNFe1.EnviarCartaCorrecao(1);
    except
      erro := true;
      msgerros := UTF8Encode(Fr_vendas_industria2.ACBrNFe1.WebServices.EnvEvento.retWS);
    end;

    if not erro then
    begin
      if Fr_vendas_industria2.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat <> 135 then
      begin
        msgerros := Fr_vendas_industria2.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.XMotivo;
        erro := true;
      end;
    end;
    reciboLst := TStringList.Create;
    // reciboLst.add(UTF8Encode(Fr_vendas_industria2.ACBrNFe1.WebServices.CartaCorrecao.RetWS));
    reciboLst.SaveToFile(pathSaida + 'ReciboLote.xml');
    reciboLst.Free;
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
    Fr_nfe_transmissao.Gauge1.Visible := false;
    Fr_nfe_transmissao.lbResultado.Visible := true;
    Fr_nfe_transmissao.MsgErro.Visible := true;
    Fr_nfe_transmissao.MsgErro.Text := msgerros;
    Fr_nfe_transmissao.MsgErro.Height := Fr_nfe_transmissao.Panel1.Height - Fr_nfe_transmissao.MsgErro.Top;
    Fr_nfe_transmissao.lbResultado.Caption := 'Houve erro no processo.';
    Fr_nfe_transmissao.BtnOK.modalresult := MRCANCEL;
    Fr_nfe_transmissao.BtnOK.Enabled := true;
    FRPRI.HabilitaTimers;

    try
      if not dao.cn.InTransaction then
        dao.cn.StartTransaction;
      dao.Execsql('DELETE FROM CARTA_CORRECAO WHERE ID = ' + id + ' and numdoc = ' + numdoc);
      dao.cn.Commit;
    except
      dao.cn.Rollback;
    end;

  end;

  if finalizado then
  begin
    Fr_nfe_transmissao.Gauge1.Visible := false;
    Fr_nfe_transmissao.lbResultado.Visible := true;
    Fr_nfe_transmissao.lbResultado.Caption := 'Processo realizado com sucesso.';
    FRPRI.HabilitaTimers;
  end;

  Fr_nfe_transmissao.update;
  // Sleep(2000);
end;

procedure TNFeCC.LimparArquivos;
var
  f: TSearchRec;
  Ret: integer;
  TempNome: string;
begin
  Ret := FindFirst(pathSaida + '*.xml', faAnyFile, f);
  try
    while Ret = 0 do
    begin
      DeleteFile(pathSaida + f.Name);
      Ret := FindNext(f);
    end;
  finally
    begin
      FindClose(f);
    end;
  end;
end;

function TNFeCC.GerarXMLProcNFe: boolean;
var
  NomeArquivo, gPathNFe: string;
  prot: WideString;
  cc_xml: TStringList;
begin
  try
    gPathNFe := ExtractFilePath(Application.ExeName) + 'nf\';
    NomeArquivo := gPathNFe + cChaveNfe + '-' + cEvento + '-ProcEventoNFe.xml';
    arquivo_procnfe := NomeArquivo;
    cc_xml := TStringList.Create;
    cc_xml.Text := UTF8Encode(Fr_vendas_industria2.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.XML);

    cc_xml.SaveToFile(NomeArquivo);

    try
      if not (dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      {
      Fr_vendas_industria2.qrGravaXmlCCe.close;
      Fr_vendas_industria2.qrGravaXmlCCe.ParamByName('arquivo').Loadfromfile(NomeArquivo, ftBlob);
      Fr_vendas_industria2.qrGravaXmlCCe.ParamByName('numdoc').Value := Fr_vendas_industria2.Prnumdoc.Text;
      Fr_vendas_industria2.qrGravaXmlCCe.ParamByName('id').AsString := cEvento;
      Fr_vendas_industria2.qrGravaXmlCCe.Open;
      }
      dao.Execsql('UPDATE CARTA_CORRECAO SET XML = '''+cc_xml.Text+''' WHERE id = '+cEvento+' and numdoc = '+Fr_vendas_industria2.Prnumdoc.Text);

      dao.cn.Commit;
    except
      dao.cn.Rollback;
      Exit;
    end;

    cc_xml.Free;
     {
    if not dm.FTPNFe.Connected then
      dm.FTPNFe.Connect;

    if dm.FTPNFe.Connected then
    begin
      // transfere um arquivo texto
      dm.FTPNFe.TransferType := ftASCII;
      dm.FTPNFe.Put(NomeArquivo, cChaveNfe + '-' + cEvento + '-ProcEventoNFe.xml');
      // desconecta
      dm.FTPNFe.Quit;
    end;
     }
    Result := true;
  except
    Result := false;
  end;
end;

procedure TFr_vendas_industria2.PrCartaCorrecaoChange(Sender: TObject);
begin
  if length(PrCartaCorrecao.Text) >= 15 then
  begin
    BtnEnviarCC.Enabled := true;
    BtnGravarCC.Enabled := true;
    BtnCancelCC.Enabled := true;
  end
  else
  begin
    BtnEnviarCC.Enabled := false;
    BtnGravarCC.Enabled := false;
    BtnCancelCC.Enabled := false;
  end;

end;

function TFr_vendas_industria2.ChecarPedidoLiberado: boolean;
begin
  Result := false;

  if (Prnumdoc.Text = '') then
    Exit;

  dao.Geral4('Select LIBERAR_FATURAMENTO from VENDAS1 WHERE NUMDOC = ' + Prnumdoc.Text);

  Result := dao.q4.fieldbyname('LIBERAR_FATURAMENTO').AsString = 'S';
end;

procedure TFr_vendas_industria2.BtnEtiquetaClick(Sender: TObject);
var
  i, total_etiquetas: integer;
  peso: double;
  mostrar_unidade, mostrar_empresa: boolean;
begin
  Application.CreateForm(Tfm_definir_saldo_inicial, fm_definir_saldo_inicial);
  fm_definir_saldo_inicial.Caption := 'Etiquetas.';
  fm_definir_saldo_inicial.gbDefinirSaldo.Caption := 'Definir Qtd. de Etiquetas';
  fm_definir_saldo_inicial.btgra.Caption := 'OK';
  fm_definir_saldo_inicial.edSaldo.Value := mmVendas2QTD.AsInteger div mmVendas2VOLUME.AsInteger;
  fm_definir_saldo_inicial.edSaldo.DecimalPlaces := 0;
  fm_definir_saldo_inicial.ckMostra.Visible := true;
  fm_definir_saldo_inicial.ckEmpresa.Visible := true;
  fm_definir_saldo_inicial.edPeso.Visible := true;
  fm_definir_saldo_inicial.ShowModal;
  if fm_definir_saldo_inicial.modalresult <> mrOk then
    Exit;
  total_etiquetas := fm_definir_saldo_inicial.edSaldo.AsInteger;
  peso := fm_definir_saldo_inicial.edPeso.Value;
  mostrar_unidade := fm_definir_saldo_inicial.ckMostra.Checked;
  mostrar_empresa := fm_definir_saldo_inicial.ckEmpresa.Checked;

  Application.CreateForm(Tfr_escolhe_impressora_termica, fr_escolhe_impressora_termica);
  fr_escolhe_impressora_termica.ShowModal;
  if fr_escolhe_impressora_termica.modalresult = mrOk then
    caminho_imp_cod_barras := fr_escolhe_impressora_termica.impressora_termica
  else
    Exit;

  for i := 1 to total_etiquetas do
  begin
    if peso > 0 then
      FMFUN.ImprimeEtiqueta(mmVendas2COD_PRODUTO.AsString, mmVendas2NOM_PRODUTO.AsString, formatfloat('#,###,##0.000', peso), 'KG', mmVendas2CODIGO_BARRAS.AsString, FRPRI.Tipo_Etiqueta, mostrar_unidade, mostrar_empresa)
    else
      FMFUN.ImprimeEtiqueta(mmVendas2COD_PRODUTO.AsString, mmVendas2NOM_PRODUTO.AsString, zzqtd_embalagem.Text, zzunidade.Text, mmVendas2CODIGO_BARRAS.AsString, FRPRI.Tipo_Etiqueta, mostrar_unidade, mostrar_empresa);
    // sleep(1000);
  end;
end;

procedure TFr_vendas_industria2.PrMOTIVO_NFE_CANCEL_INTERNOButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  // guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Motivo';
  chamou_pesquisa := 'fr_motivo';
  chamou_form := 'fr_motivo_vendas';
  chamou_cadastro := 'fr_motivo';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Motivos de Canc. de NFe';
  Fr_localizar.BT_cadastro.Visible := true;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Código';
  Campos_combo[1] := 'Motivo';

  for i := 0 to 1 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
end;

procedure TFr_vendas_industria2.PrMOTIVO_NFE_CANCEL_INTERNOExit(Sender: TObject);
begin
  if trim(PrMOTIVO_NFE_CANCEL_INTERNO.Text) = '' then
    lbMotivo.Caption := '...';

  if PrMOTIVO_NFE_CANCEL_INTERNO.Text <> '' then
  begin

    if (not FMFUN.verificaNumerico(PrMOTIVO_NFE_CANCEL_INTERNO.Text)) and (length(PrMOTIVO_NFE_CANCEL_INTERNO.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      PrMOTIVO_NFE_CANCEL_INTERNO.SetFocus;
      Exit;
    end;

    dao.Geral2('select motivo from NFE_MOTIVO_CANCEL where id =' + QuotedStr(PrMOTIVO_NFE_CANCEL_INTERNO.Text));
    if dao.q2.RecordCount > 0 then
      lbMotivo.Caption := dao.q2.fieldbyname('motivo').AsString
    else
    begin
      dao.msg('Registro não Encontrado ou não Ativo!');
      PrMOTIVO_NFE_CANCEL_INTERNO.Text := '';
      PrMOTIVO_NFE_CANCEL_INTERNO.SetFocus;
      Exit;
    end;
  end;
end;

procedure TFr_vendas_industria2.gravar_liberacao_desconto(usuario, motivo: string);
begin
  dao.cn.StartTransaction;
  try
    dao.Execsql('UPDATE VENDAS1 SET USUARIO_LIBEROU_DESCONTO = ' + QuotedStr(usuario) + ', MOTIVO_LIBERACAO_DESCONTO = ' + QuotedStr(motivo) + ' WHERE NUMDOC = ' + Prnumdoc.Text);
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
  if not Btaltped.Enabled then
    Exit;
  if Prnumdoc.Text = '' then
    Exit;

  if btAltRep.Caption = 'Alterar' then
  begin
    Prcod_representante.Enabled := true;
    Prcod_representante.SetFocus;
    btAltRep.Caption := 'Gravar';
  end
  else
  begin
    dao.cn.StartTransaction;
    dao.Execsql('UPDATE VENDAS1 SET COD_REPRESENTANTE = ' + Prcod_representante.Text + ' WHERE NUMDOC = ' + Prnumdoc.Text);
    dao.cn.Commit;
    Prcod_representante.Enabled := false;
    btAltRep.Caption := 'Alterar';
  end;
end;

procedure TFr_vendas_industria2.btAltSupClick(Sender: TObject);
begin
  if not Btaltped.Enabled then
    Exit;
  if Prnumdoc.Text = '' then
    Exit;

  if btAltSup.Caption = 'Alterar' then
  begin
    Prcod_supervisor.Enabled := true;
    Prcod_supervisor.SetFocus;
    btAltSup.Caption := 'Gravar';
  end
  else
  begin
    dao.cn.StartTransaction;
    dao.Execsql('UPDATE VENDAS1 SET COD_SUPERVISOR = ' + Prcod_supervisor.Text + ' WHERE NUMDOC = ' + Prnumdoc.Text);
    dao.cn.Commit;
    Prcod_supervisor.Enabled := false;
    btAltSup.Caption := 'Alterar';
  end;
end;

procedure TFr_vendas_industria2.btnNfeDevClick(Sender: TObject);
var
  EmissaoNFe: TNFePedido;
  cBuscarCeritifcado: _BuscarCertificado;
  valor_total: currency;
begin
  Mostra := true;
  if trim(PrNFE_Dev.Text) = '' then
  begin
    dao.Geral4('select CASE WHEN MAX(Nota) IS NULL THEN 1 ELSE MAX(Nota)+1 END AS NFE from ' +
               ' ( SELECT NFE as  nota FROM VENDAS1 WHERE EMPRESA_FATURAR = ' + Prempresa_faturar.Text + ' union SELECT NFE_dev as nota FROM VENDAS1 WHERE EMPRESA_FATURAR = ' + Prempresa_faturar.Text + ') q1 ');

    PrNFE_Dev.Text := dao.q4.fieldbyname('NFE').AsString;
    try
      if not (dao.cn.InTransaction) then
        (dao.cn.StartTransaction);

      if (PrProcesso_id.Text = '') then
      begin
        PrProcesso_id.Text := FMFUN.GerarProcessoPedido;
        dao.Execsql('UPDATE VENDAS1 A SET PROCESSO_ID = ' + PrProcesso_id.Text + ' WHERE NUMDOC = ' + Prnumdoc.Text);
      end;

      dao.Execsql('update vendas1 set nfe_dev=' + QuotedStr(PrNFE_Dev.Text) + ' where numdoc=' + QuotedStr(Prnumdoc.Text));

      dao.cn.Commit;

      LimparBoletos;

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

  /// Fr_nfe_transmissao.BtnOK.Enabled := true;

  Fr_nfe_transmissao.ShowModal;
  if Fr_nfe_transmissao.modalresult = mrOk then
  begin
    CarregaDados;

    if PrStatus_Nfe_DEV.Text = '100' then
    begin
      LimparBoletos;
      BtnDanfe_DevClick(Self);
      PrJUSTIF_CANC_NFE_DEV.Enabled := true;

      //if dao.cn.InTransaction then
        dao.cn.StartTransaction;
      FMFUN.GravarProcessoPedido('FATURADO-ENTRADA', PrProcesso_id.Text, Prnumdoc.Text);
      dao.cn.Commit;
    end;
    StatusPedido;
    { if prstatus_nfe.Text = '539' then
      begin
      PrChave_NFe.Text := copy(PrMotivo_nfe.Text, pos('chNFe:', PrMotivo_nfe.Text) + 6, 44);
      btXMLClick(Self);
      end;

      CarregaDados;
    }

  end;

end;

procedure TFr_vendas_industria2.btnovClick(Sender: TObject);
begin
  // GravarPedido := true;
  produto_alterado := true;
  checar_qtd := true;
  if desconto_maximo = '' then
    Prcod_clienteExit(Self);

  readonly_true('Pr');
  if (FRPRI.TipUsu > '1') and not representacao then
  begin
    if Prempresa_faturar.Text = '' then
    begin

      Prempresa_faturarButtonClick(Self);

      { dao.msg('O campo Empresa deve ser Preenchido');
        pc_vendas.ActivePage := tab_finalizar;
        Prempresa_faturar.SetFocus;
        exit; }
    end;

    if Prcod_fiscal.Text = '' then
    begin
      dao.msg('O campo Código Fiscal deve ser Preenchido');
      readonly_false('Pr');
      Pc_vendas.ActivePage := tab_finalizar;
      Prcod_fiscal.SetFocus;
      Exit;
    end;
  end;

  if Btnovped.Enabled = true then
  begin
    dao.msg('O Pedido está com Status Neutro, você deve Clicar no Botão Alterar ou Inserir!');
    readonly_false('Pr');
    Exit;
  end;

  if (Prcod_fop.Text = '') and venda then
  begin
    dao.msg('Campo Forma de Pagamento deve ser Preenchido!');
    readonly_false('Pr');
    Prcod_fop.SetFocus;
    Exit;
  end;

  if venda then
  begin
    if Prcod_cliente.Text = '' then
    begin
      dao.msg('Campo Cliente deve ser Preenchido!');
      readonly_false('Pr');
      Prcod_cliente.SetFocus;
      Exit;
    end;
  end
  else
  begin
    if (Prcod_cliente.Text = '') and (Prcod_fornecedor.Text = '') then
    begin
      dao.msg('Campo Cliente ou Fornecedor deve ser Preenchido!');
      readonly_false('Pr');
      Prcod_cliente.SetFocus;
      Exit;
    end;
  end;

  if (Prcod_representante.Text = '') and venda then
  begin
    dao.msg('Campo Representante deve ser Preenchido!');
    readonly_false('Pr');
    Prcod_representante.SetFocus;
    Exit;
  end;

  // limpa_campos('Me');
  readonly_false('Me');

  if not mmVendas2.active then
    mmVendas2.Open;
  mmVendas2.Append;

  if (FRPRI.TipUsu = '0') or (FRPRI.TipUsu = '1') or representacao then
  begin
    Mevolume.Text := '1';
    Mevolume.Enabled := false
  end;

  if mform <> 'vendas_devolucoes' then
  begin
    Mecod_fiscal_item.Enabled := false;
    MeTrib_ICMS.Enabled := false;
  end;

  modo_insert_me := true;
  Menumdoc.Text := Prnumdoc.Text;
  Medtadoc.Text := Prdtadoc.Text;
  Mecod_cliente.Text := Prcod_cliente.Text;
  // SgPro.Enabled := False;
  qtd_anterior := 0;

  HabilitaBotoesItens(0);
  mmVendas2VOLUME.Value := 1;
  Mecod_produto.SetFocus;

  linMax := 1;

end;

procedure TFr_vendas_industria2.btXML_DevClick(Sender: TObject);
var
  RecNFe: Tnferecxml;
  cBuscarCeritifcado: _BuscarCertificado;
begin
  Application.CreateForm(TFr_nfe_transmissao, Fr_nfe_transmissao);
  RecNFe := Tnferecxml.Create(strtoint(PrNFE_Dev.Text), strtoint(Prnumdoc.Text), strtoint(Prempresa_faturar.Text), PrChave_NFe.Text);

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

  if Fr_nfe_transmissao.modalresult = mrOk then
    CarregaDados;

end;

procedure TFr_vendas_industria2.BtStatusClick(Sender: TObject);
begin
  if trim(Prnumdoc.Text) = '' then
    Exit;

  if not dao.cn.InTransaction then
    dao.cn.StartTransaction;
  FMFUN.AlterarProcessoPedido(PrProcesso_id.Text, Prnumdoc.Text);
  dao.cn.Commit;
  StatusPedido;
  HabilitaBotoesPedido(1);
end;

procedure TFr_vendas_industria2.BtnDanfe_DevClick(Sender: TObject);
begin
  ImprimirDanfe(PrChave_NFe_DEV.Text, true);
end;

procedure TFr_vendas_industria2.ImprimirDanfe(chave: string; entrada: boolean = false);
var
  arquivoNFe, pathSaida, Protocolo: string;
begin
  arquivoNFe := chave + '-procNFe.xml';
  pathSaida := ExtractFilePath(Application.ExeName) + 'nf\';

  q_xml.close;
  q_xml.ParamByName('numdoc').value := Prnumdoc.Text;
  q_xml.Open;

  if entrada then
  begin
    if not q_xml.fieldbyname('XML_DEV').IsNull then
      TBlobField(q_xml.fieldbyname('XML_DEV')).SaveToFile(pathSaida + arquivoNFe);
  end
  else
  begin
    if not q_xml.fieldbyname('XML').IsNull then
      TBlobField(q_xml.fieldbyname('XML')).SaveToFile(pathSaida + arquivoNFe);
  end;
  {
    if not FilesExists(pathSaida + arquivoNFe) then
    begin
    try
    dm.FTPNFe.Connect;
    if dm.FTPNFe.Connected then
    begin
    // transfere um arquivo texto                       g
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
  }
  ACBrNFe1.NotasFiscais.Clear;
  ACBrNFe1.NotasFiscais.LoadFromFile(pathSaida + arquivoNFe);

  ACBrNFe1.DANFE.Logo := ExtractFilePath(Application.ExeName) + nome_logo;
  ACBrNFeDANFEFR1.fastfile := ExtractFilePath(Application.ExeName) + 'Relatorios\Danfe.fr3';
  ACBrNFe1.NotasFiscais.Imprimir;

  DeleteFile(pathSaida + arquivoNFe);
  { if EnviarEmailNfe then
    begin
    if not ChecarEmailCliente(Prcod_cliente.Text, 'nfe') then
    Exit;
    BtnEmailNFeClick(Self);
    end; }
end;

procedure TFr_vendas_industria2.ImprimirEtiquetadeTransporte1Click(
  Sender: TObject);
begin
  MontaEtiquetaTransp(Prnumdoc.Text, 1);
end;

procedure TFr_vendas_industria2.imprimirLotedePedidos1Click(Sender: TObject);
begin
  Application.CreateForm(TFr_imp_pedidos_lote, Fr_imp_pedidos_lote);
  Fr_imp_pedidos_lote.ShowModal;
end;

procedure TFr_vendas_industria2.BtnEmailBoletoClick(Sender: TObject);
var
  EmailBoleto: TEmail;
  corpo_email, assunto_email, ref: string;
begin
  if not ChecarEmailCliente(Prcod_cliente.Text, 'pedido') then
    Exit;

  dao.Geral1('SELECT V1.NUMDOC, C.EMAIL, C.EMAIL_ADICIONAL1, C.EMAIL_ADICIONAL2, C.EMAIL_ADICIONAL3, C.NOM_CLIENTE FROM VENDAS1 V1 INNER JOIN CLIENTE C ON V1.COD_CLIENTE = C.COD_CLIENTE WHERE V1.numdoc = ' + Prnumdoc.Text);
  if dao.q1.fieldbyname('EMAIL').IsNull then
    Exit;

  if trim(PrNFE.Text) <> '' then
    ref := 'NF-e Nº. ' + PrNFE.Text
  else
    ref := 'Pedido Nº. ' + Prnumdoc.Text;

  assunto_email := nom_empresa + ' - Boletos Ref. ' + ref;

  corpo_email := '<html><body> ' + '  <font face="Consolas" size="2">Prezado Cliente</font><br><br> ' + '  <font face="Consolas" size="2">Segue arquivos dos Boletos Ref. ' + ref + ' em Anexo</font><br><br> ' + '  <font face="Consolas" size="2">Informações: ' + fone_empresa + '</font><br> ' + '  <font face="Consolas" size="2">' + home_page + '</font><br><br>' + '  <img src="cid:123456"><br>' + '</body></html> ';

  DeleteFile(ExtractFilePath(Application.ExeName) + 'boleto.pdf');
  if q_cr1.IsEmpty then
    Exit;

  FMFUN.ACBrBoletoFCFR1.FastReportFile := ExtractFilePath(Application.ExeName) + 'Relatorios\Boleto.fr3';
  FMFUN.ACBrBoletoFCFR1.DirLogo := ExtractFilePath(Application.ExeName) + 'Logos\colorido\';
  FMFUN.ACBrBoletoFCFR1.NomeArquivo := ExtractFilePath(Application.ExeName) + 'boleto.pdf';
  FMFUN.ACBrBoleto1.GerarPDF;

  try
    Application.CreateForm(TFr_email_envio, Fr_email_envio);
    Fr_email_envio.lbResultado.Caption := 'Enviando Email de Boletos ao Cliente';

   if dao.CN.params.values['database'] = 'C:\orbi\trunk\dados\orbi.fdb' then
      EmailBoleto := TEmail.Create(corpo_email, 'Teste', '', '', '', '', 'claudioplasfan@gmail.com', FMFUN.ACBrBoletoFCFR1.NomeArquivo)
   else
      EmailBoleto := TEmail.Create(corpo_email, assunto_email, dao.q1.fieldbyname('EMAIL').AsString, dao.q1.fieldbyname('EMAIL_ADICIONAL1').AsString, dao.q1.fieldbyname('EMAIL_ADICIONAL2').AsString, dao.q1.fieldbyname('EMAIL_ADICIONAL3').AsString, 'claudioplasfan@gmail.com', FMFUN.ACBrBoletoFCFR1.NomeArquivo);

    Fr_email_envio.ShowModal;
  finally
    Fr_email_envio.Free;
    dao.q1.close;
  end;

end;

procedure TFr_vendas_industria2.BtnEditarCancelamentoNFeDevClick(Sender: TObject);
begin
  PrJUSTIF_CANC_NFE_DEV.ReadOnly := false;
  PrJUSTIF_CANC_NFE_DEV.Enabled := true;
  PrJUSTIF_CANC_NFE_DEV.SetFocus;
end;

procedure TFr_vendas_industria2.BtnEnviarCancelamentoNFeDevClick(Sender: TObject);
var
  CancelNFe: TNFeCancel;
begin
  if trim(PrJUSTIF_CANC_NFE_DEV.Text) = '' then
  begin
    dao.msg('Para o Cancelamento da NF-e de Devolução, é necessário informar a Justificativa!');
    PrJUSTIF_CANC_NFE_DEV.SetFocus;
    Exit;
  end;
  try
    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;

    if (PrProcesso_id.Text = '') then
    begin
      PrProcesso_id.Text := FMFUN.GerarProcessoPedido;
      dao.Execsql('UPDATE VENDAS1 A SET PROCESSO_ID = ' + PrProcesso_id.Text + ' WHERE NUMDOC = ' + Prnumdoc.Text);
    end;

    dao.Execsql('UPDATE VENDAS1 SET JUSTIF_CANC_NFE_DEV = ' + QuotedStr(PrJUSTIF_CANC_NFE_DEV.Text) + ' WHERE NUMDOC = ' + Prnumdoc.Text);
    dao.Execsql('update vendas1 set status_emissor = ''CANCELAMENTO'', solicitar_emissor = ''CANCELAR'', status_motivo = null, justif_canc_nfe_dev = ' + QuotedStr(PrJUSTIF_CANC_NFE_DEV.Text) + ' where numdoc=' + QuotedStr(Prnumdoc.Text));
    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;

  Application.CreateForm(TFr_nfe_transmissao, Fr_nfe_transmissao);
  CancelNFe := TNFeCancel.Create(PrChave_NFe_DEV.Text, FMFUN.AnsiToAscii(PrJUSTIF_CANC_NFE_DEV.Text), PrPROTOCOLO_NFE_DEV.Text, false);
  Fr_nfe_transmissao.lbResultado.Caption := 'Cancelamento da Nota Fiscal de Devolução';

  Fr_nfe_transmissao.sCheckBox1.Visible := true;
  Fr_nfe_transmissao.sCheckBox1.Caption := 'Buscar Certificado.';

  Fr_nfe_transmissao.sCheckBox2.Visible := true;
  Fr_nfe_transmissao.sCheckBox2.Caption := 'Enviando Solicitação de Cancelamento da NFe de Devolução.';

  Fr_nfe_transmissao.sCheckBox3.Visible := true;
  Fr_nfe_transmissao.sCheckBox3.Caption := 'Consultando Recibo de Cancelamento da NFe de Devolução.';

  Fr_nfe_transmissao.Gauge1.MaxValue := 3;
  Fr_nfe_transmissao.Height := Fr_nfe_transmissao.Height + (16 * 3);
  Fr_nfe_transmissao.Gauge1.Progress := 0;

  Fr_nfe_transmissao.ShowModal;

  if Fr_nfe_transmissao.modalresult = mrOk then
  begin
    //if dao.cn.InTransaction then
      dao.cn.StartTransaction;
    FMFUN.GravarProcessoPedido('CANCELADO', PrProcesso_id.Text, Prnumdoc.Text);
    dao.cn.Commit;

    CarregaDados;
    Pc_vendas.ActivePage := TaNFeDevol;

    { if MessageDlg('Desejas Clonar o Pedido Cancelado?', mtConfirmation, [mbYes,
      mbno],
      0) = mryes then
      ClonarPedidoCancelado;
      end;
    }
  end;
end;

procedure TFr_vendas_industria2.sbClonarClick(Sender: TObject);
begin
  if MessageDlg('Confirmar clonagem do Pedido Faturado/Cancelado?', mtConfirmation, [mbYes, mbno], 0) = mryes then
    ClonarPedidoCancelado;
end;

procedure TFr_vendas_industria2.sbDANFCeClick(Sender: TObject);
var
  arquivoNFe, pathSaida, Protocolo: string;
begin
  arquivoNFe := PrChave_NFe.Text + '-' + q_cce.fieldbyname('ID').AsString + '-ProcEventoNFe.xml';
  pathSaida := ExtractFilePath(Application.ExeName) + 'nf\';

  if not q_cce.fieldbyname('XML').IsNull then
    TBlobField(q_cce.fieldbyname('XML')).SaveToFile(pathSaida + arquivoNFe);

{  if not FilesExists(pathSaida + arquivoNFe) then
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
 }
  ACBrNFe1.EventoNFe.Evento.Clear;
  ACBrNFe1.EventoNFe.LerXML(pathSaida + arquivoNFe);
  ACBrNFe1.DANFE.Logo := ExtractFilePath(Application.ExeName) + nome_logo;
  ACBrNFeDANFEFR1.FastFileEvento := ExtractFilePath(Application.ExeName) + 'Relatorios\EVENTOS.fr3';

  ACBrNFe1.ImprimirEvento;

end;

procedure TFr_vendas_industria2.Q2SAfterClose(DataSet: TDataSet);
begin
  dao.cn.Commit;
  FRPRI.HabilitaTimers;
end;

procedure TFr_vendas_industria2.Q2SBeforeOpen(DataSet: TDataSet);
begin
  FRPRI.DesabilitaTimers;
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

    dao.Geral1('select * from cheque_terceiros where titulo_cr1=' + QuotedStr(Crtitulo.Text));
    if dao.q1.RecordCount > 0 then
    begin
      Pacheque.Visible := true;
      Sg_cheque.Cells[0, i] := dao.q1.fieldbyname('nr_cheque').AsString;
      Sg_cheque.Cells[1, i] := dao.q1.fieldbyname('nr_agencia').AsString;
      Sg_cheque.Cells[2, i] := dao.q1.fieldbyname('nr_conta_corrente').AsString;
      Sg_cheque.Cells[3, i] := dao.q1.fieldbyname('dta_emissao').AsString;
      Sg_cheque.Cells[4, i] := dao.q1.fieldbyname('dta_vencimento').AsString;
      Sg_cheque.Cells[5, i] := dao.q1.fieldbyname('valor').AsString;
      Sg_cheque.Cells[6, i] := dao.q1.fieldbyname('nom_titular').AsString;
      i := i + 1;
      dao.q1.next;
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
    Btgrava_cr1.Enabled := false
  else
    Btgrava_cr1.Enabled := true;

end;

procedure TFr_vendas_industria2.q_cr1BeforeOpen(DataSet: TDataSet);
begin
  FRPRI.DesabilitaTimers;
end;

procedure TFr_vendas_industria2.q_cr1AfterClose(DataSet: TDataSet);
begin
  dao.cn.Commit;
  FRPRI.HabilitaTimers;
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
  (* dao.Geral1('select v1.faturado as cod_fat, ' + '   v1.ABERTO_USUARIO,  ' +
    '   v1.MAQUINA_USUARIO_ABERTO, ' + '   v1.numdoc, ' +
    '   case when HP.OBS is not null then TRIM(SUBSTRING(HP.OBS FROM 9 FOR 20)) ' +
    '   else case when v1.faturado = ''0'' then ''NÃO FATURADO''  ' +
    '   else case when v1.faturado = ''1'' then ''FATURADO-VENDAS''  ' +
    '   else case when v1.faturado = ''1'' and v1.nfe_dev is not null then ''FATURADO-ENTRADA/DEVOLUÇÃO''  '
    + '   else case when v1.faturado = ''2'' then ''CANCELADA''  ' +
    '   else case when v1.faturado = ''3'' then ''FATURADO-DEVOLUÇÕES, REMESSAS E BONIFICAÇÕES''  '
    + '   else case when v1.faturado = ''4'' then ''DESATIVADO''  ' +
    '   else case when v1.faturado = ''5'' then ''NFE DENEGADA'' end end end end end end end end as faturado, '
    + '   v1.NUMDOC_GRUPO, ' + '   v1.nfe_dev ' + ' from vendas1 v1 ' +
    ' left outer join HIST_PROCESSO_PEDIDO HP ON HP.PROCESSO_ID = V1.PROCESSO_ID AND HP.NUMDOC = V1.NUMDOC ' +
    ' where v1.numdoc = ' + QuotedStr(Prnumdoc.Text));
  *)

  dao.Geral1('SELECT ' +
    '    v1.faturado AS cod_fat, ' +
    '    v1.ABERTO_USUARIO, ' +
    '    v1.MAQUINA_USUARIO_ABERTO, ' +
    '    v1.numdoc, ' +
    '    pp.status, ' +
    '    CASE ' +
    '        WHEN v1.faturado = ''0'' THEN ''NÃO FATURADO'' ' +
    '        WHEN v1.faturado = ''1'' AND (v1.nfe_dev IS NOT NULL OR CAST(v1.nfeentradasaida AS INTEGER) = 1) THEN ''FATURADO - ENTRADA / DEVOLUÇÃO'' ' +
    '        WHEN v1.faturado = ''1'' AND CAST(v1.tiponfe AS INTEGER) = 1 THEN ''FATURADO - COMPLEMENTAR'' ' +
    '        WHEN v1.faturado = ''1'' THEN ''FATURADO - VENDAS'' ' +
    '        WHEN v1.faturado = ''2'' THEN ''CANCELADA'' ' +
    '        WHEN v1.faturado = ''3'' THEN ''FATURADO - DEVOLUÇÕES, REMESSAS E BONIFICAÇÕES'' ' +
    '        WHEN v1.faturado = ''4'' THEN ''DESATIVADO'' ' +
    '        WHEN v1.faturado = ''5'' THEN ''NFE DENEGADA'' ' +
    '        ELSE ''STATUS DESCONHECIDO'' ' +
    '    END AS faturado, ' +
    '    v1.NUMDOC_GRUPO, ' +
    '    v1.nfe_dev ' +
    'FROM vendas1 v1 ' +
    'LEFT JOIN processo_pedido pp ON pp.id = v1.PROCESSO_ID ' +
    'LEFT JOIN HIST_PROCESSO_PEDIDO HP ON HP.PROCESSO_ID = V1.PROCESSO_ID AND HP.NUMDOC = V1.NUMDOC ' +
    'WHERE v1.numdoc = '+QuotedStr(Prnumdoc.Text));

{  if not dao.q1.fieldbyname('status').IsNull then
    sbvendas.Panels[1].Text := dao.q1.fieldbyname('faturado').AsString + '/' + dao.q1.fieldbyname('status').AsString
  else}
    sbvendas.Panels[1].Text := dao.q1.fieldbyname('faturado').AsString;

  FaturamentoAvulso1.Enabled := dao.q1.fieldbyname('cod_fat').AsInteger = 0;

  BtStatus.Enabled := (sbvendas.Panels[1].Text = 'NÃO FATURADO/À DIGITAR') or (sbvendas.Panels[1].Text = 'NÃO FATURADO/À CONFERIR') or (sbvendas.Panels[1].Text = 'NÃO FATURADO/À FATURAR');

  if dao.q1.fieldbyname('cod_fat').AsString = '4' then
    Btexcped.Caption := 'REATIVAR'
  else
    Btexcped.Caption := 'DESATIVAR';
  // BtnAltFormaPrazo.Visible := dao.q1.fieldbyname('cod_fat').AsString = '1';
  if not dao.q1.fieldbyname('NUMDOC_GRUPO').IsNull then
  begin
    sbvendas.Panels[1].Text := '-AGRUPADO AO PEDIDO Nº.: ' + dao.q1.fieldbyname('NUMDOC_GRUPO').AsString;
    TaAgrupar.TabVisible := false;
    Btaltped.Enabled := false;
    Btexcped.Enabled := false;
  end;

  if dao.q1.fieldbyname('ABERTO_USUARIO').AsString = 'N' then
  begin
    if dao.q1.fieldbyname('MAQUINA_USUARIO_ABERTO').AsString = nom_usuario + '-' + FMFUN.COMPUTADOR then
    begin
      // if FMFUN.GetNumeroProcessos(ExtractFileName(Application.ExeName)) = 1 then
      // begin
      LiberarPedido(Prnumdoc.Text);
      lbSituacao.Caption := '';

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

      BloquearPedido(Prnumdoc.Text);
      Exit;
      // end;
    end;
    lbSituacao.Caption := 'PEDIDO FECHADO PARA O USUÁRIO/MÁQUINA: ' + dao.q1.fieldbyname('MAQUINA_USUARIO_ABERTO').AsString;
    Btaltped.Enabled := false;
    BtnEmailPedido.Enabled := false;
    Btexcped.Enabled := false;
    BtnNFE.Enabled := false;
  end
  else
  begin
    lbSituacao.Caption := '';

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
    BloquearPedido(dao.q1.fieldbyname('numdoc').AsString);
  end;
end;

procedure TFr_vendas_industria2.CarregaDadosItem(numdoc: string);
begin
  q_itens.close;
  q_itens.ParamByName('numdoc').value := numdoc;
  q_itens.Open;
end;

procedure TFr_vendas_industria2.CarregaDadosAgrupar(cliente, numdoc: string);
begin
  if cliente = '' then
    Exit;
  if numdoc = '' then
    Exit;

  q_pedidos_agrupar.close;
  q_pedidos_agrupar.ParamByName('grupo').AsString := numdoc;
  q_pedidos_agrupar.ParamByName('cliente').AsString := cliente;
  q_pedidos_agrupar.Open;
end;

procedure TFr_vendas_industria2.AgrupaPedidos;
begin
  if q_pedidos_agruparAGRUPADO.AsString = 'S' then
    dao.Execsql('UPDATE VENDAS1 SET NUMDOC_GRUPO = NULL WHERE NUMDOC = ' + q_pedidos_agruparNUMDOC.AsString)
  else
    dao.Execsql('UPDATE VENDAS1 SET NUMDOC_GRUPO = ' + Prnumdoc.Text + ' WHERE NUMDOC = ' + q_pedidos_agruparNUMDOC.AsString);

  dao.Execsql('DELETE FROM VENDAS2 WHERE NUMDOC = ' + Prnumdoc.Text);

  dao.Execsql('INSERT INTO VENDAS2 (NUMDOC, COD_PRODUTO, QTD, PRECO, PRECO_CUSTO, SUB_TOTAL, DESCONTO, VOLUME, PRECO_BRUTO, DESCONTO_VALOR) ' + 'SELECT ' + Prnumdoc.Text + ' as numdoc, p.COD_PRODUTO, sum(b.QTD) as qtd, min(b.PRECO) as preco, min(b.PRECO_CUSTO) as custo, sum(b.QTD) * min(b.PRECO) as SUB_TOTAL, ' + '(((sum(b.QTD) * min(b.PRECO_BRUTO)) - (sum(b.qtd) * min(b.PRECO))) / (sum(b.QTD) * min(b.PRECO_BRUTO)))*100 as desconto, ' +
    'sum(b.VOLUME) as volume, min(b.PRECO_BRUTO) as preco_bruto, sum(b.DESCONTO_VALOR) as desconto_valor FROM VENDAS1 a INNER JOIN VENDAS2 b on b.NUMDOC = a.NUMDOC ' + 'inner join produto p on (p.COD_PRODUTO = b.COD_PRODUTO) INNER JOIN CLIENTE C ON C.COD_CLIENTE = A.COD_CLIENTE ' + 'where A.FATURADO = 0 and A.COD_CLIENTE = ' + Prcod_cliente.Text + ' and A.NUMDOC_GRUPO = ' + Prnumdoc.Text + ' group by numdoc, cod_produto');

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
    Exit;

  if (FRPRI.TipUsu = '0') or (FRPRI.TipUsu = '1') then
    Exit;
{
  if not ChecarDadosCliente then
    Exit;

  if not ChecarDadosTransportadora then
    Exit;  }

  path := ExtractFilePath(Application.ExeName);
  if Prnumdoc.Text = '' then
  begin
    dao.msg('Selecione um Pedido para Imprimir!');
    Exit;
  end;

  if Btgraped.Enabled then
    BtgrapedClick(Self);

  cmd := 'SELECT v.NUMDOC, v.tipo, V.OBS, v.prazo, v.DTADOC, v.DTA_EMISSAO, v.TOT_LIQUIDO, V.DESCONTO_PEDIDO, V.VALOR_CR, v.COD_CLIENTE, v.NOM_CLIENTE, v.CODREP, R.NOM_REPRESENTANTE, v.NOM_BANCO, ' + 'v.CLIENTE_ENDERECO, v.cliente_fone as fone_cliente, v.aviso, v.cliente_fax as fax, v.contato, v.CLIENTE_BAIRRO, v.CEP_CLIENTE, v.CLIENTE_CNPJ_CPF, v.CLIENTE_IE_RG, v.CLIENTE_CIDADE, ' +
    'v.NR_BANCO, v.NR_AGENCIA, v.NR_CONTA_CORRENTE, v.EMAIL, v.FONE, v.CELULAR, v.COD_PRODUTO, v.NOM_PRODUTO, v.CUSTO, v.LUCRO, v.PRECO_VENDA_CALC, v.MARGEM, V.USUARIO_LIBEROU_DESCONTO, V.MOTIVO_LIBERACAO_DESCONTO, ' + 'v.PRECO_VENDA, v.PRECO, v.total_custo, v.DESCONTO, v.QTD, v.SUB_TOTAL, v.VLR_COMISSAO, V.SUBTOTAL_RATEADO, V.VLR_COMISSAO_RATEADO, v.FATURADO, v.SUPERVISAO, v.PERC_COMISSAO, R.PERC_COMISSAO_FIXA, ' +
    'case when (select count(*) from vendas2 v2 where v2.COD_PRODUTO = v.cod_produto and v2.NUMDOC = ' + Prnumdoc.Text + ' ) > 0 then ''*'' else '''' end as contido, ' + 's.NOM_REPRESENTANTE as supervisor ' + 'FROM V_VENDA v INNER JOIN REPRESENTANTE R ON (R.ID = CODREP) ' + 'inner join vendas1 v1 on v1.NUMDOC = v.NUMDOC ' + 'left outer JOIN REPRESENTANTE s ON (s.ID = v1.COD_SUPERVISOR) ' + 'where v.faturado = 0 ' + ' and v.COD_CLIENTE = ' + Prcod_cliente.Text + ' and v.numdoc not in (' + Prnumdoc.Text + ')';

  cmd := cmd + ' order by NOM_REPRESENTANTE, dtadoc, numdoc, ord_pauta';

  with dm.q_venda_espelho do
  begin
    close;
    sql.Clear;
    sql.Add(cmd);
    Open;
  end;

  if dm.q_venda_espelho.RecordCount = 0 then
  begin
    // dao.msg('Não foi encontrado registro neste periodo!');
    Exit;
  end
  else if MessageDlg('Há pedidos em aberto neste Cliente. Desejas Visualizar?', mtConfirmation, [mbYes, mbno], 0) = mryes then
  begin

    cmd := 'SELECT ' + '  distinct Cod_cliente, NR_documento, titulo, HISTORICO, DTAVEN, DTAREC, valor, valor_recebido, SITUACAO, CONTA ' + 'FROM ' + '( ' + '    SELECT ' + '      Cod_cliente, NR_documento, titulo, HISTORICO, DTAVEN, DTAREC, valor, valor_recebido, SITUACAO, CONTA ' + '    FROM ' + '      ( ' + '        SELECT ' + '          FIRST 10 c.cod_cliente, NR_documento, titulo, cast(C.HISTORICO1 as varchar(300)) as historico, DTAVEN, DTAREC, C.valor, valor_recebido, ' +
      '          case when dtarec is null then case when DTAVEN >= current_date then ''À VENCER'' else ''VENCIDO'' END ELSE ''PAGO'' END AS SITUACAO, ' + '          case when dtarec is null then ' + '            coalesce(CV.NR_AGENCIA||'' ''||CV.NR_CONTA||'' ''||CV.NOM_CONTA, F.NOM_FOP) ' + '          Else ' + '          coalesce(CC.NR_AGENCIA||'' ''||CC.NR_CONTA||'' ''||CC.NOM_CONTA, ' + '          CASE E.TIPO WHEN 0 THEN ''DINHEIRO'' ' + '                      WHEN 1 THEN ''CHEQUE PRÓPRIO'' ' +
      '                      WHEN 2 THEN ''CHEQUE DE TERCEIROS'' ' + '                      WHEN 3 THEN ''PERMUTA'' ' + '                      WHEN 4 THEN ''DESCONTO'' ' + '          END) END AS CONTA ' + '        FROM ' + '          CR1 C ' + '        LEFT OUTER JOIN EXTRATO_CR1 EC ON EC.CR1 = C.ID ' + '        LEFT OUTER JOIN EXTRATO E ON E.ID = EC.EXTRATO ' + '        LEFT OUTER JOIN CONTA_CORRENTE CC ON CC.ID = E.ID_CONTA  ' + '        LEFT OUTER JOIN VENDAS1 V ON V.NUMDOC = C.NR_DOCUMENTO ' +
      '        LEFT OUTER JOIN CONTA_CORRENTE CV ON CV.ID = v.CONTA_BOLETO ' + '        LEFT OUTER JOIN FOP F ON F.COD_FOP = V.COD_FOP ' + '        WHERE ' + '          C.COD_CLIENTE = ' + Prcod_cliente.Text + '        ORDER BY ' + '          COD_CLIENTE, DTAVEN DESC ' + '      )   ' + '    Union ' + '    SELECT ' + '      c.Cod_cliente, NR_documento, titulo, cast(C.HISTORICO1 as varchar(300)) as historico, DTAVEN, ' +
      '      DTAREC, C.valor, valor_recebido, case when dtarec is null then case when DTAVEN >= current_date then ''À VENCER'' else ''VENCIDO'' END ELSE ''PAGO'' END AS SITUACAO, ' + '          case when dtarec is null then ' + '            coalesce(CV.NR_AGENCIA||'' ''||CV.NR_CONTA||'' ''||CV.NOM_CONTA, F.NOM_FOP) ' + '          Else ' + '          coalesce(CC.NR_AGENCIA||'' ''||CC.NR_CONTA||'' ''||CC.NOM_CONTA, ' + '          CASE E.TIPO WHEN 0 THEN ''DINHEIRO'' ' +
      '                      WHEN 1 THEN ''CHEQUE PRÓPRIO'' ' + '                      WHEN 2 THEN ''CHEQUE DE TERCEIROS'' ' + '                      WHEN 3 THEN ''PERMUTA'' ' + '                      WHEN 4 THEN ''DESCONTO'' ' + '          END) END AS CONTA ' + '    FROM ' + '      CR1 C ' + '    LEFT OUTER JOIN EXTRATO_CR1 EC ON EC.CR1 = C.ID ' + '    LEFT OUTER JOIN EXTRATO E ON E.ID = EC.EXTRATO ' + '    LEFT OUTER JOIN CONTA_CORRENTE CC ON CC.ID = E.ID_CONTA ' +
      '    LEFT OUTER JOIN VENDAS1 V ON V.NUMDOC = C.NR_DOCUMENTO ' + '    LEFT OUTER JOIN CONTA_CORRENTE CV ON CV.ID = v.CONTA_BOLETO ' + '    LEFT OUTER JOIN FOP F ON F.COD_FOP = V.COD_FOP ' + '    WHERE ' + '      C.COD_CLIENTE = ' + Prcod_cliente.Text + '      AND case when dtarec is null then case when DTAVEN >= current_date then ''À VENCER'' else ''VENCIDO'' END ELSE ''PAGO'' END = ''VENCIDO'' ' + '  ) ' + 'ORDER BY ' + '  DTAVEN DESC';

    with dm.q_ultimos_cr do
    begin
      close;
      sql.Clear;
      sql.Add(cmd);
      Open;
    end;
    dm.q_ultimos_cr.Open;

    if dm.q_ultimos_cr.RecordCount < 0 then
    begin
      dao.msg('Não foi encontrado registro neste periodo!');
      Exit;
    end;

    if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\vendas_detalhado.fr3')) then
    begin
      dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
      Exit;
    end;

    fR_RELATORIO.ShowReport;
  end;
end;

procedure TFr_vendas_industria2.insere_sgpro(tipo: string);
begin

end;

procedure TFr_vendas_industria2.PrJUSTIF_CANC_NFE_DEVChange(Sender: TObject);
begin
  if length(PrJUSTIF_CANC_NFE_DEV.Text) >= 15 then
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

procedure TFr_vendas_industria2.dgPedidosAgruparDblClick(Sender: TObject);
begin
  AgrupaPedidos;
end;

procedure TFr_vendas_industria2.dgPedidosAgruparDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
const
  IsChecked: array[boolean] of integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  DrawState: integer;
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

  dgPedidosAgrupar.DefaultDrawDataCell(Rect, Column.Field, State);

  if (gdFocused in State) then
  begin

    if (Column.Field.FieldName = ckAgrupar.DataField) then
    begin
      ckAgrupar.Left := Rect.Left + dgPedidosAgrupar.Left + 2;
      ckAgrupar.Top := Rect.Top + dgPedidosAgrupar.Top + 2;
      ckAgrupar.Width := Rect.Right - Rect.Left;
      ckAgrupar.Height := Rect.Bottom - Rect.Top;
      ckAgrupar.Visible := true;
    end;

  end
  else
  begin

    if (Column.Field.FieldName = ckAgrupar.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := IsChecked[Column.Field.AsString = 'S'];

      DrawFrameControl(dgPedidosAgrupar.Canvas.Handle, DrawRect, DFC_BUTTON, DrawState);
    end;

  end;

end;

procedure TFr_vendas_industria2.dgPedidosAgruparEnter(Sender: TObject);
begin
  CarregaDadosItem(q_pedidos_agruparNUMDOC.AsString);
end;

procedure TFr_vendas_industria2.dgPedidosAgruparKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  CarregaDadosItem(q_pedidos_agruparNUMDOC.AsString);
end;

procedure TFr_vendas_industria2.dgPedidosAgruparKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  CarregaDadosItem(q_pedidos_agruparNUMDOC.AsString);
end;

procedure TFr_vendas_industria2.dgPedidosAgruparCellClick(Column: TColumn);
begin
  CarregaDadosItem(q_pedidos_agruparNUMDOC.AsString);
end;

procedure TFr_vendas_industria2.q_pedidos_agruparAfterClose(DataSet: TDataSet);
begin
  q_itens.close;
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
  path := ExtractFilePath(Application.ExeName);
  if origem_tipo = 0 then
  begin
    cmd := 'SELECT a.NR_CONEXAO, a.COD_REPRESENTANTE, a.DATA_CONEXAO, a.HORA_CONEXAO, a.QTDE_PEDIDOS, a.QTDE_VISITAS_NEGATIVAS, a.CHECADO, cast(a.USUARIO_CHECOU||''-''||u.NOME as varchar(200)) as USUARIO_CHECOU, a.DATA_HORA_CHECADO, '
      + ' vd1.numdoc, v1.numdoc_destino, v1.DTADOC, cast(c.COD_CLIENTE||''-''||c.NOM_CLIENTE as varchar(200)) as cliente, c.ENDERECO, c.telefone, c.NR_ENDERECO, c.CEP, cast(cid.NOM_CIDADE||''-''||cid.UF as varchar(200)) as cidade, C.CNPJ, C.IE, '
      + ' C.RG,C.CPF, C.EMAIL, v1.TOT_BRUTO, v1.TOT_LIQUIDO, '
      + ' cast(v1.COD_FOP||''-''||f.NOM_FOP as varchar(200)) as fop, cast(v1.COD_REPRESENTANTE||''-''||r.NOM_REPRESENTANTE as varchar(200)) as representante, p.PRAZO, v1.PALM_NR_CONEXAO, v1.OBSERVACOES_PEDIDO, '
      + ' v2.ID, cast(v1.NR_PEDIDO_PALM as varchar(10)) as NR_PEDIDO_PALM, cast(v2.COD_PRODUTO||''-''||pr.NOM_PRODUTO as varchar(200)) as produto, pr.unidade, v2.QTD, v2.PRECO, '
      + ' v2.SUB_TOTAL, v2.NR_PEDIDO_PALM, v2.PRECO_BRUTO, (((v2.PRECO_BRUTO - v2.PRECO)/v2.PRECO_BRUTO) * 100) AS PERC_DESC, v2.VOLUME, '
      + ' '''' as NCM, ' + ' 0  as VLR_ICMS_ST, ' + ' 0  as perc_st, ' +
      ' pr.codigo_barra ' + ' FROM PALM_LOTE a ' +
      ' inner join tbusu u on (u.CODUSU = a.USUARIO_CHECOU) ' +
      ' inner join PEDIDO_PALM1 v1 on (v1.PALM_NR_CONEXAO = a.NR_CONEXAO)' +
      ' inner join PEDIDO_PALM2 v2 on (v2.NR_PEDIDO_PALM = v1.NR_PEDIDO_PALM)' +
      ' inner join vendas1 vd1 on cast(vd1.nr_pedido_palm as INTEGER) = v1.nr_pedido_palm ' +
      ' LEFT OUTER join CLIENTE c on (c.COD_CLIENTE = v1.COD_CLIENTE)' +
      ' LEFT OUTER join Cidades cid on (cid.COD_Cidade = c.COD_cidade)' +
      ' LEFT OUTER join REPRESENTANTE r on (r.id = v1.COD_REPRESENTANTE)' +
      ' LEFT OUTER join prazo p on (p.ID = v1.COD_PRAZO_PGTO) ' +
      ' LEFT OUTER join fop f on (f.COD_FOP = v1.COD_FOP) ' +
      ' LEFT OUTER join produto pr on (pr.COD_PRODUTO = v2.COD_PRODUTO) WHERE 1 = 1 ';
    cmd := cmd + 'and v1.NR_PEDIDO_PALM = ' + QuotedStr(pedido_tablet);

    cmd := cmd + ' order by  representante, NR_CONEXAO, NUMDOC, pr.ord_pauta, v2.VOLUME ';

    with dm.q_palm_pedidos do
    begin
      close;
      sql.Clear;
      sql.Add(cmd);
      Open;
    end;

    // deletefile(ExtractFilePath(Application.ExeName) + 'conexao.sql');
    /// Fim do teste

    if dm.q_palm_pedidos.RecordCount < 0 then
    begin
      dao.msg('Não foi encontrado registro neste periodo!');
    end;

    if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\palm_pedidos.fr3')) then
    begin
      dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
      Exit;
    end;
  end
  else
  begin
    cmd := 'SELECT v1.COD_REPRESENTANTE, v1.USUARIO_CHECOU_PEDIDO_VENDEDOR||''-''||u.NOME as USUARIO_CHECOU, ' + ' v1.NUMDOC, v1.DTADOC, c.COD_CLIENTE||''-''||c.NOM_CLIENTE as cliente, c.ENDERECO, c.NR_ENDERECO, c.CEP, cid.NOM_CIDADE||''-''||cid.UF as cidade, C.CNPJ, C.IE, C.RG,C.CPF, C.EMAIL, v1.TOT_BRUTO, v1.TOT_LIQUIDO, ' +
      ' v1.COD_FOP||''-''||f.NOM_FOP as fop, v1.COD_REPRESENTANTE||''-''||r.NOM_REPRESENTANTE as representante, p.PRAZO, '''' AS NR_PEDIDO_PALM, 0 as PALM_NR_CONEXAO, v1.OBSERVACOES_PEDIDO, ' + ' v2.ID, v2.COD_PRODUTO||''-''||pr.NOM_PRODUTO as produto, pr.unidade, v2.QTD, v2.PRECO, v2.SUB_TOTAL, v2.PRECO_BRUTO, (((v2.PRECO_BRUTO - v2.PRECO)/v2.PRECO_BRUTO) * 100) AS PERC_DESC, v2.VOLUME ' + ' FROM vendas1_orig v1 ' + ' LEFT OUTER join tbusu u on (u.CODUSU = v1.USUARIO_CHECOU_PEDIDO_VENDEDOR) ' +
      ' inner join vendas2_orig v2 on (v2.NUMDOC = v1.NUMDOC)' + ' inner join CLIENTE c on (c.COD_CLIENTE = v1.COD_CLIENTE)' + ' inner join Cidades cid on (cid.COD_Cidade = c.COD_cidade)' + ' inner join REPRESENTANTE r on (r.id = v1.COD_REPRESENTANTE)' + ' inner join prazo p on (p.ID = v1.COD_PRAZO_PGTO)' + ' inner join fop f on (f.COD_FOP = v1.COD_FOP) ' + ' inner join produto pr on (pr.COD_PRODUTO = v2.COD_PRODUTO) WHERE v1.numdoc = ' + Prnumdoc.Text;

    cmd := cmd + ' order by  representante, v1.NUMDOC, v2.COD_PRODUTO, v2.VOLUME ';

    with dm.q_pedidos_vendedor do
    begin
      close;
      sql.Clear;
      sql.Add(cmd);
      Open;
    end;

    if dm.q_palm_pedidos.RecordCount < 0 then
    begin
      dao.msg('Não foi encontrado registro neste periodo!');
      Exit;
    end;

    if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\pedidos_vendedor.fr3')) then
    begin
      dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
      Exit;
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
  Gdoor.produto(Prnumdoc.Text);
  Gdoor.pedido(Prnumdoc.Text);
  Gdoor.Itens(Prnumdoc.Text);
  Gdoor.Free;
  showmessage('Exportação concluída com Sucesso!');
  dao.Geral5('SELECT FRENTE_CAIXA_EMPRESA_PADRAO FROM CONFIGURACAO ');
  Prempresa_faturar.Text := dao.q5.fieldbyname('FRENTE_CAIXA_EMPRESA_PADRAO').AsString;
  FaturamentoAvulso1Click(Self);
end;

procedure TFr_vendas_industria2.MePrecoBaseKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in [',']) and (Pos(formatsettings.DecimalSeparator, MePrecoBase.Text) <> 0) then
    Key := #0;
end;

procedure TFr_vendas_industria2.MePERC_COMISSAOExit(Sender: TObject);
begin
  mmVendas2VLR_COMISSAO.Value := Mesub_total.Value * (MePERC_COMISSAO.Value / 100);
end;

procedure TFr_vendas_industria2.MePrecoBaseExit(Sender: TObject);
begin
  if (mmVendas2PRECO_BASE.Value > 0) then
    mmVendas2PRECO_LIQUIDO.Value := mmVendas2PRECO_BASE.Value;
end;

procedure TFr_vendas_industria2.Prtot_liquidoExit(Sender: TObject);
begin
  total_liquido_anterior := Prtot_liquido.Value;
  CalcularDesconto;
end;

procedure TFr_vendas_industria2.BtnEnviarPedidoClick(Sender: TObject);
var
  Vendor: TConexaoVendor;
begin
  if trim(Prnumdoc.Text) = '' then
    Exit;

  fm_splash.lbArquivos.Caption := 'Enviando Pedido...';
  fm_splash.update;
  try
    Vendor := TConexaoVendor.Create();
    Vendor.pedido(Prnumdoc.Text);
    Vendor.Free;
  finally
    CarregaDados;
  end;

  fm_splash.close;
end;

procedure TFr_vendas_industria2.PrValorDescontoAdicExit(Sender: TObject);
begin
  // Prtot_liquido.Value := Prtot_liquido.Value - PrValorDescontoAdic.Value;
end;

procedure TFr_vendas_industria2.PrVLR_DESCONTO_GERALExit(Sender: TObject);
begin
  PrDESCONTO_GERAL.Value := (PrVLR_DESCONTO_GERAL.Value / Prtot_liquido.Value) * 100;
  PrDESCONTO_GERALExit(Self);
end;

procedure TFr_vendas_industria2.Medesconto_ValorKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in [',']) and (Pos(formatsettings.DecimalSeparator, Medesconto_Valor.Text) <> 0) then
    Key := #0;
end;

procedure TFr_vendas_industria2.Medesconto_ValorExit(Sender: TObject);
begin
  if Medesconto_Valor.Value > Mesub_total.Value then
  begin
    dao.msg('Valor de Desconto não pode ser maior que o Subtotal!');
    Medesconto_Valor.SetFocus;
    Exit;
  end;

  CalculaSubTotais;
  // mmVendas2DESCONTO.Value := roundto(((mmVendas2DESCONTO_VALOR.value / mmVendas2sub_total.value) * 100), (CasasDecimais * (-1)));
end;

procedure TFr_vendas_industria2.BtAltTranspClick(Sender: TObject);
begin

  if not Btaltped.Enabled then
    Exit;
  if Prnumdoc.Text = '' then
    Exit;

  if BtAltTransp.Caption = 'Alterar' then
  begin
    Prcod_transportadora.Enabled := true;
    Prvl_frete.Enabled := true;
    Prcontato_frete.Enabled := true;
    Prcod_transportadora.SetFocus;
    BtAltTransp.Caption := 'Gravar';
  end
  else
  begin
    dao.cn.StartTransaction;
    dao.Execsql('UPDATE VENDAS1 SET COD_TRANSPORTADORA = ' + Prcod_transportadora.Text + ', CONTATO_FRETE = ''' + Prcontato_frete.Text + ''', ' + ' VL_FRETE = ' + FMFUN.BuscaTroca(Prvl_frete.Text, ',', '.') + ' WHERE NUMDOC = ' + Prnumdoc.Text);
    dao.cn.Commit;
    Prcod_transportadora.Enabled := false;
    Prvl_frete.Enabled := false;
    Prcontato_frete.Enabled := false;
    BtAltTransp.Caption := 'Alterar';
  end;

end;

procedure TFr_vendas_industria2.btcanClick(Sender: TObject);
begin
  try
    if MessageDlg('Deseja Cancelar está Operação?', mtConfirmation, [mbYes, mbno], 0) = mryes then
    begin
      readonly_false('Pr');
      modo_insert_me := false;
      produto_alterado := false;
      btnov.Enabled := true;
      if mmVendas2.RecordCount > 0 then
      begin
        btalt.Enabled := true;
        btexc.Enabled := true;
      end
      else
      begin
        DBGrid1.Enabled := false;
        btalt.Enabled := false;
        btexc.Enabled := false;
      end;
      btgra.Enabled := false;
      btcan.Enabled := false;
      if mmVendas2.State in [dsInsert] then
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

procedure TFr_vendas_industria2.btgraClick(Sender: TObject);
var
  comissao_item, volume, perc_descontado, perc_comissao: real;
  produto: string;
begin
  readonly_false('Pr');
  produto_alterado := false;
  if (Mecod_produto.Text = '') and (Mecod_produto.Enabled) then
  begin
    dao.msg('O Campo Produto deve ser Preenchido!');
    Mecod_produto.SetFocus;
    Exit;
  end;

  produto := Mecod_produto.Text;

  if (Meqtd.Value = 0) and (Meqtd.Enabled)  then
  begin
    dao.msg('O Campo Qtd deve ser Preenchido!');
    Meqtd.SetFocus;
    Exit;
  end;

  if (Mevolume.Value = 0) and (Mevolume.Enabled) then
  begin
    dao.msg('O Campo Volume deve ser Preenchido!');
    Mevolume.SetFocus;
    Exit;
  end;

  if (Mepreco.Value = 0) and (Mepreco.Enabled) then
  begin
    dao.msg('O Campo Preço deve ser Preenchido!');
    Mepreco.SetFocus;
    Exit;
  end;

  if (Mecod_fiscal_item.Text = '') and Mecod_fiscal_item.Enabled then
  begin
    dao.msg('O Campo Código Fiscal deve ser Preenchido!');
    Mecod_fiscal_item.SetFocus;
    Exit;
  end;

  if MeTrib_ICMS.Enabled and (MeTrib_ICMS.Text = '') then
  begin
    dao.msg('O Campo CST deve ser Preenchido!');
    MeTrib_ICMS.SetFocus;
    Exit;
  end;

  { if Prcod_fop.Text = '22' then
    if not FMFUN.BonificacaoLiberado(Prcod_cliente.Text, Mecod_produto.Text,
    Prnumdoc.Text, Meqtd.AsInteger) then
    begin
    dao.msg('Ultrapassou o Limite de Itens para Bonificação deste produto!');
    Meqtd.SetFocus;
    Exit;
    end;
  }
  if checar_qtd and VerificaEstoqueParaFaturar(Mecod_produto.Text) and (Meqtd.Enabled) then
    if MessageDlg('Estoque com Quantidade Insuficiente Para Faturar!' + #13 + 'Deseja Continuar Assim Mesmo!', mtConfirmation, [mbYes, mbno], 0) = mrno then
    begin
      Meqtd.SetFocus;
      Exit;
    end;

  { if (Prcod_representante.Text <> '') and (Prorcamento.ItemIndex = 0) then
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
  // mmVendas2Trib_ICMS.Text := cst;

  cst := mmVendas2TRIB_ICMS.Value;
  // Calcula o vlr icms do item
  if mform <> 'vendas_devolucoes' then
  begin
    dados_produto(mmVendas2COD_PRODUTO.AsString);
    CalculoIcmsItem;
  end;

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

  if mmVendas2VLR_BC.IsNull then
    mmVendas2VLR_BC.Value := 0;

  if mmVendas2VLR_ICMS_ITEM.IsNull then
    mmVendas2VLR_ICMS_ITEM.Value := 0;

  if mform <> 'vendas_devolucoes' then
  begin
    if mmVendas2VLR_BC.IsNull then
      mmVendas2VLR_BC.Value := 0;
  end;

  { if modo_insert_me then
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
  // monta os campos de custo e margem de lucro;
  if Zzcusto.Value > 0 then
  begin
    // Zzcusto.Value := dao.Q1.fieldbyname('custo').AsFloat;
    Zztot_custo.Value := Zzcusto.Value * mmVendas2QTD.Value;
    zz_lucro_produto.Value := (mmVendas2PRECO_LIQUIDO.Value / Zzcusto.Value) * 100;
    if zz_lucro_produto.Value < 0 then
      zz_lucro_produto.Value := zz_lucro_produto.Value *  - 1;

    if zz_lucro_produto.Value < 0 then
      zz_lucro_produto.Font.Color := clRed
    else
      zz_lucro_produto.Font.Color := clBlue;

  end;

  if mmVendas2DESCONTO.AsString = '' then
    mmVendas2DESCONTO.AsString := '0';

  mmVendas2.post;

  readonly_true('Me');
  if not cliente_alterado or (Prnumdoc.Text = '') then
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

  HabilitaBotoesItens(1);

  if not GravarPedido then
  begin
    if Mecod_produto.CanFocus then
      Mecod_produto.SetFocus;
  end;

end;

procedure TFr_vendas_industria2.M1Click(Sender: TObject);
begin
  if trim(Prnumdoc.Text) = '' then
    Exit;

  if FRPRI.TipUsu > '1' then
  begin
    if not ChecarDadosPedido then
      Exit;

   { if not ChecarDadosCliente then
      Exit;

    if not ChecarDadosTransportadora then
      Exit;
    }
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
  Imprimir(Prnumdoc.Text, true, true);
end;

procedure TFr_vendas_industria2.Imprimir(pedido: string; COM_ST, COM_DESC: boolean);
var
  cmd, path, relatorio: string;
  oExportfilter: TfrxCustomExportFilter;
begin
  if pedido = '' then
    Exit;

  path := ExtractFilePath(Application.ExeName);
    cmd := 'SELECT a.NR_CONEXAO, a.COD_REPRESENTANTE, a.DATA_CONEXAO, a.HORA_CONEXAO, a.QTDE_PEDIDOS, a.QTDE_VISITAS_NEGATIVAS, a.CHECADO, cast(a.USUARIO_CHECOU||''-''||u.NOME as varchar(200)) as USUARIO_CHECOU, a.DATA_HORA_CHECADO, '
      + ' v1.NUMDOC, v1.numdoc_destino, v1.DTADOC, cast(c.COD_CLIENTE||''-''||c.NOM_CLIENTE as varchar(200)) as cliente, c.ENDERECO, c.telefone, c.NR_ENDERECO, c.CEP, cast(cid.NOM_CIDADE||''-''||cid.UF as varchar(200)) as cidade, '
      + ' C.CNPJ, C.IE, C.RG,C.CPF, C.EMAIL, v1.TOT_BRUTO, cast(v1.TOT_LIQUIDO as Numeric(15,2)) as tot_liquido, '
      + ' cast(v1.COD_FOP||''-''||f.NOM_FOP as varchar(200)) as fop, cast(v1.COD_REPRESENTANTE||''-''||r.NOM_REPRESENTANTE as varchar(200)) as representante, p.PRAZO, v1.NR_PEDIDO_PALM, v1.PALM_NR_CONEXAO, v1.OBSERVACOES_PEDIDO, '
      + ' v2.ID, v2.NUMDOC, cast(v2.COD_PRODUTO||''-''||pr.NOM_PRODUTO as varchar(200)) as produto, pr.unidade, v2.QTD, v2.PRECO, v2.SUB_TOTAL, v2.NR_PEDIDO_PALM, v2.PRECO_BRUTO, (((v2.PRECO_BRUTO - v2.PRECO)/v2.PRECO_BRUTO) * 100) AS PERC_DESC, v2.VOLUME, '
      + ' '''' as NCM, ' +
      ' 0  as VLR_ICMS_ST, ' +
      ' 0  as perc_st, ' +
      ' pr.codigo_barra ' + ' FROM PALM_LOTE a ' +
      ' inner join tbusu u on (u.CODUSU = a.USUARIO_CHECOU) ' +
      ' inner join vendas1 v1 on (v1.PALM_NR_CONEXAO = a.NR_CONEXAO)' +
      ' inner join vendas2 v2 on (v2.NUMDOC = v1.NUMDOC)' +
      ' LEFT OUTER join CLIENTE c on (c.COD_CLIENTE = v1.COD_CLIENTE)' +
      ' LEFT OUTER join Cidades cid on (cid.COD_Cidade = c.COD_cidade)' +
      ' LEFT OUTER join REPRESENTANTE r on (r.id = v1.COD_REPRESENTANTE)' +
      ' LEFT OUTER join prazo p on (p.ID = v1.COD_PRAZO_PGTO) ' +
      ' LEFT OUTER join fop f on (f.COD_FOP = v1.COD_FOP) ' +
      ' LEFT OUTER join produto pr on (pr.COD_PRODUTO = v2.COD_PRODUTO) '+
      'WHERE 1 = 1  '+
      'and v1.numdoc = '+pedido +
      ' order by  a.COD_REPRESENTANTE, a.NR_CONEXAO, v1.numdoc, pr.ord_pauta, v2.VOLUME  ';

  with dm.q_palm_pedidos do
  begin
    close;
    sql.Clear;
    sql.Add(cmd);
    Open;
  end;

  if COM_ST then
    relatorio := 'pedido_email.fr3'
  else if COM_DESC then
    relatorio := 'pedido_sem_st.fr3'
  else
    relatorio := 'pedido_sem_st_sem_desconto.fr3';

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\' + relatorio)) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    Exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_vendas_industria2.q_cceAfterOpen(DataSet: TDataSet);
begin
  // sbDANFCe.Enabled := not q_cce.IsEmpty;
end;

procedure TFr_vendas_industria2.PrNfeEntradaSaidaChange(Sender: TObject);
begin
  if PrNfeEntradaSaida.ItemIndex = 1 then
  begin
    dao.Geral2('select F.cod_fop from fop f where f.nom_fop like ''%DEVOLUÇÃO%'' LIMIT 1');
    if dao.q2.RecordCount > 0 then
      Prcod_fop.Text := DAO.Q2.FieldByName('COD_FOP').AsString;
  end
  else begin
    Prcod_fop.Clear;
    Prcod_prazo_pgto.Clear;
  end;

  Prcod_fopExit(Self);
  PrCONTA_BOLETOExit(Self);
end;

procedure TFr_vendas_industria2.PrNUMDOC_DESTINOChange(Sender: TObject);
begin

  try

    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;

    dao.Exec_sql.sql.Clear;

    dao.Exec_sql.sql.Add('UPDATE vendas1 SET numdoc_destino = ' + PrNUMDOC_DESTINO.Text + ' where numdoc = ' + Prnumdoc.Text + ';');

    dao.Exec_sql.Execsql;

    dao.grava_log(dao.Exec_sql.sql.Text, '');

    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;

end;

procedure TFr_vendas_industria2.PrNumdoc_RefButtonClick(Sender: TObject);
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

procedure TFr_vendas_industria2.PrNumdoc_RefExit(Sender: TObject);
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

      if MessageDlg('Deseja carregar todos os itens do pedido referencia?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        try
          if not dao.cn.InTransaction then
            dao.cn.StartTransaction;

          if Prnumdoc.Text = '' then
          begin
            id_pedido := dao.insert('Pr', 'vendas1', 'numdoc', Fr_vendas_industria2, 'gen_venda1');
            Prnumdoc.Text := id_pedido;
          end;

          dao.Execsql('delete from vendas2 where numdoc = ' + QuotedStr(Prnumdoc.Text));

          dao.Execsql('insert into vendas2 (NUMDOC, COD_PRODUTO, QTD, PRECO, PRECO_CUSTO, SUB_TOTAL, DESCONTO, DESCONTO_VALOR, VOLUME, ' +
                      'PRECO_BRUTO, PRECO_BASE, PERC_COMISSAO, VLR_COMISSAO, COD_FISCAL_ITEM, ICMS_ITEM, VLR_ICMS_ST, VLR_BC_ST, VLR_ICMS_ITEM, ' +
                      'NCM, VLR_BC, IPI_ITEM, VLR_IPI_ITEM, VLR_AGR_ITEM, TRIB_ICMS, CESTA_BASICA, COD_SUPERVISOR, PROMOCAO, DESCONTO_MAX, NAO_VALIDAR_MARGEM, CEST, DESCONTO_VALOR_GERAL) ' +
                      'select ' + QuotedStr(Prnumdoc.Text) + ', COD_PRODUTO, QTD, PRECO, PRECO_CUSTO, SUB_TOTAL, DESCONTO, DESCONTO_VALOR, VOLUME, ' +
                      'PRECO_BRUTO, PRECO_BASE, PERC_COMISSAO, VLR_COMISSAO, COD_FISCAL_ITEM, ICMS_ITEM, VLR_ICMS_ST, VLR_BC_ST, VLR_ICMS_ITEM, ' +
                      'NCM, VLR_BC, IPI_ITEM, VLR_IPI_ITEM, VLR_AGR_ITEM, TRIB_ICMS, CESTA_BASICA, COD_SUPERVISOR, PROMOCAO, DESCONTO_MAX, NAO_VALIDAR_MARGEM, CEST, DESCONTO_VALOR_GERAL ' +
                      'from vendas2 where numdoc = ' + QuotedStr(PrNumdoc_Ref.Text));

          dao.cn.Commit;
        except
          dao.cn.Rollback;
          raise;
        end;

        ativa_vendas2(Prnumdoc.Text);
        carrega_vendas2;
        totaliza_pedido;
      end;
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

procedure TFr_vendas_industria2.btnInsNfeDevClick(Sender: TObject);
var
  id: integer;
begin
  try
    dao.Geral1('Select Max(id) as ultimo from nfe_ref_dev where numdoc = ' + Prnumdoc.Text);
    if dao.q1.IsEmpty then
      id := 1
    else
      id := dao.q1.fieldbyname('ultimo').AsInteger + 1;

    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
    // dao.Execsql('UPDATE VENDAS1 SET CARTACORRECAO = ' + QUOTEDSTR(PRCARTACORRECAO.Text) + ' WHERE NUMDOC = ' + PRNumdoc.Text);
    dao.Execsql('INSERT INTO NFE_REF_DEV (ID, NUMDOC, CHAVE_NFE) VALUES (' + inttostr(id) + ',' + Prnumdoc.Text + ',' + QuotedStr(edChaveNfeRef.Text) + ')');
    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;
  CarregaChaveNfeDev;
  edChaveNfeRef.Clear;
end;

procedure TFr_vendas_industria2.CarregaChaveNfeDev;
begin
  q_NFe_Ref.close;
  q_NFe_Ref.sql.Text := 'SELECT a.ID, a.CHAVE_NFE FROM NFE_REF_DEV a where a.NUMDOC = ' + Prnumdoc.Text;
  q_NFe_Ref.Open;
end;

procedure TFr_vendas_industria2.btnExcNfeDevClick(Sender: TObject);
begin
  try
    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
    dao.Execsql('DELETE FROM NFE_REF_DEV WHERE ID = ' + q_NFe_RefID.AsString);
    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;
  CarregaChaveNfeDev;
end;

procedure TFr_vendas_industria2.btnCanNfeDevClick(Sender: TObject);
begin
  edChaveNfeRef.Clear;
end;

procedure TFr_vendas_industria2.q_NFe_RefAfterOpen(DataSet: TDataSet);
begin
  btnExcNfeDev.Enabled := not q_NFe_Ref.IsEmpty;
end;

procedure TFr_vendas_industria2.edChaveNfeRefChange(Sender: TObject);
begin
  btnCanNfeDev.Enabled := length(edChaveNfeRef.Text) > 0;
  btnInsNfeDev.Enabled := length(edChaveNfeRef.Text) = 44;
end;

procedure TFr_vendas_industria2.CalcularPesoPerc;
begin
  edDecTransp.Value := ((edPesoTotal.Value - Prpeso_nota.Value) / edPesoTotal.Value) * 100;
end;

procedure TFr_vendas_industria2.CalcularPeso;
begin
  Prpeso_nota.Value := edPesoTotal.Value - (edPesoTotal.Value * (edDecTransp.Value / 100));
end;

procedure TFr_vendas_industria2.edDecTranspExit(Sender: TObject);
begin
  CalcularPeso;
end;

procedure TFr_vendas_industria2.L1Click(Sender: TObject);
begin
  Imprimir(Prnumdoc.Text, false, true);
end;

procedure TFr_vendas_industria2.L2Click(Sender: TObject);
begin
  Imprimir(Prnumdoc.Text, false, false);
end;

procedure TFr_vendas_industria2.PrDESCONTO_GERALExit(Sender: TObject);
begin
  if desconto_prazo < PrDESCONTO_GERAL.Value then
  begin
    MessageDlg('Desconto Máximo de ' + formatfloat('###0.00%', desconto_prazo), mtwarning, [mbOK], mrOk);
    PrDESCONTO_GERAL.SetFocus;
    Exit;
  end;

  PrVLR_DESCONTO_GERAL.Value := Prtot_liquido.Value * (PrDESCONTO_GERAL.Value / 100);

  if not mmVendas2.IsEmpty then
  begin
    mmVendas2.First;

    WindowList := DisableTaskWindows(fm_splash.Handle);
    fm_splash.ggProgress.MaxValue := mmVendas2.RecordCount;
    fm_splash.lbStatus.Caption := 'Calculando Descontos nos Itens do Pedido...';
    fm_splash.ggProgress.Progress := 0;
    fm_splash.Show;

    carregando_item := true;
    Pc_vendas.TabIndex := 0;
    pnWait.Visible := true;

    while not mmVendas2.Eof do
    begin
      checar_qtd := false;
      mmVendas2.Edit;
      mmVendas2DESCONTO_VALOR_GERAL.Value := mmVendas2SUB_TOTAL.Value * (PrDESCONTO_GERAL.Value / 100);

{      mmVendas2PRECO_LIQUIDO.Value := mmVendas2PRECO_LIQUIDO.Value - (roundto(mmVendas2PRECO_LIQUIDO.Value * (PrDESCONTO_GERAL.Value / 100), (CasasDecimais * (-1))));
      mmVendas2SUB_TOTAL.Value := mmVendas2PRECO_LIQUIDO.Value * mmVendas2QTD.Value;
      mmVendas2DESCONTO_VALOR_GERAL.Value := 0;  }


      mmVendas2.post;
      fm_splash.ggProgress.AddProgress(1);
      fm_splash.refresh;
      mmVendas2.next;
    end;

    EnableTaskWindows(WindowList);
    mmVendas2.First;
    mmVendas2.EnableControls;
    fm_splash.Hide;
    carregando_item := false;
    pnWait.Visible := false;
  end;

end;

end.









