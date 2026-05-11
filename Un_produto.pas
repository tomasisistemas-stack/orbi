unit Un_produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids,
   StdCtrls, Mask, Buttons, ComCtrls, jpeg,
  ExtCtrls,   BaseGrid,
  AdvGrid, RxGIF, Comobj, ShellApi,
  xmldom, XMLIntf, System.Character,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  msxmldom, XMLDoc, DB, DBGrids, RxMemDS, DBCtrls,
  RXDBCtrl, sPageControl, sSpeedButton, sLabel, sPanel, sBitBtn, sGroupBox,
  sCheckBox, acDBGrid, sTooledit, sMaskEdit, sCustomComboEdit, sCurrEdit,
  sCurrencyEdit, sEdit, sComboEdit, RxToolEdit,
  AdvObj, frxClass, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFr_produtos = class(TForm)
    Pc_produto: TsPageControl;
    tab_dados: TsTabSheet;
    tab_fornecedor: TsTabSheet;
    tab_custo_valores: TsTabSheet;
    GroupBox1: TsGroupBox;
    PrRef_fabrica: TsEdit;
    Prcod_prateleira: TsEdit;
    Label4: tsLabel;
    Label5: tsLabel;
    Label6: tsLabel;
    zzestoque_disponivel: TsCurrencyEdit;
    zzPreco_venda: TsCurrencyEdit;
    Label11: tsLabel;
    Label12: tsLabel;
    GroupBox3: TsGroupBox;
    BtAnt: TsSpeedButton;
    BtPro: TsSpeedButton;
    BtIns_fot: TsBitBtn;
    BtAlt_fot: TsBitBtn;
    BtGra_fot: TsBitBtn;
    BtCan_fot: TsBitBtn;
    BtExc_fot: TsBitBtn;
    bt_Sel_foto: TsBitBtn;
    Label15: tsLabel;
    gbTrib: TsGroupBox;
    Label8: tsLabel;
    PrTrib_icms: TComboBox;
    PrOrigem_mercadoria: TComboBox;
    Label7: tsLabel;
    gbMontagem: TsGroupBox;
    Label21: tsLabel;
    Label43: tsLabel;
    Label44: tsLabel;
    Prcusto_medio: TsCurrencyEdit;
    Prcusto_calculado: TsCurrencyEdit;
    Prcusto_atualizado: TsCurrencyEdit;
    q_produtos: TFDQuery;
    zzDescricao: TsEdit;
    PrQtd_embalagem: TsCurrencyEdit;
    PrPeso: TsCurrencyEdit;
    Label18: tsLabel;
    q_produto_fornecedor: TFDQuery;
    q_fotos: TFDQuery;
    ds_produto_fornecedor: TDataSource;
    pp_produto: TPopupMenu;
    Q_cod_barras: TFDQuery;
    TabSheet4: TsTabSheet;
    ds_cod_barras: TDataSource;
    tab_grade: TsTabSheet;
    GroupBox10: TsGroupBox;
    Panel1: tsPanel;
    Label20: tsLabel;
    Gdid_Cor: TsComboEdit;
    LbCor: tsLabel;
    Label23: tsLabel;
    BtAdiG: TsBitBtn;
    SgGrade: TAdvStringGrid;
    IB_Grid1: TDBGrid;
    GroupBox6: TsGroupBox;
    Label13: tsLabel;
    Label14: tsLabel;
    PrEtiqueta_lin1: TsEdit;
    PrEtiqueta_lin2: TsEdit;
    GroupBox2: TsGroupBox;
    Label17: tsLabel;
    Image1: TImage;
    SpeedButton2: TsSpeedButton;
    Cbcod_barras: TsEdit;
    btAdib: TButton;
    btexcb: TButton;
    dgcod_barras: TDBGrid;
    Cbcod_produto: TsEdit;
    BtExcG: TsBitBtn;
    Gdid_tamanho: TsComboEdit;
    Lbtamanho: tsLabel;
    Panel2: tsPanel;
    Label1: tsLabel;
    PrNom_produto: TsEdit;
    Label2: tsLabel;
    Prcod_grupo: TsComboEdit;
    Label34: tsLabel;
    LbNom_Grupo: tsLabel;
    dsfh1: TMenuItem;
    Tab_geral: TsTabSheet;
    Prdta_ult_atualizacao: TsDateEdit;
    Label47: tsLabel;
    Label46: tsLabel;
    Pravisar_prod_desat: tscheckbox;
    tab_estoque: TsTabSheet;
    GroupBox7: TsGroupBox;
    Label28: tsLabel;
    Label9: tsLabel;
    zzestoque: TsCurrencyEdit;
    Prqtd_estoque_min: TsCurrencyEdit;
    Gdcod_produto: TsEdit;
    Gdcod_empresa: TsEdit;
    Lblutiliza_grade: tsLabel;
    Prgrade: TComboBox;
    lblcod_colecao: tsLabel;
    Prcod_colecao: TsComboEdit;
    Lbcolecao: tsLabel;
    RelatriodeProdutosInativos1: TMenuItem;
    RankingdeProdutosmaisVendidos1: TMenuItem;
    RelatriodePosiodeEstoque1: TMenuItem;
    GroupBox4: TsGroupBox;
    Label16: tsLabel;
    LbNom_fornecedor: tsLabel;
    GroupBox5: TsGroupBox;
    IB_Grid2: TDBGrid;
    Pfcod_fornecedor: TsComboEdit;
    Pfcod_produto: TsEdit;
    BtNov_Pf: TsBitBtn;
    BtAlt_Pf: TsBitBtn;
    BtGra_Pf: TsBitBtn;
    BtCan_Pf: TsBitBtn;
    BtExc_Pf: TsBitBtn;
    GroupBox11: TsGroupBox;
    Prfornecedor_principal: TsComboEdit;
    LbNom_fornecedor_principal: tsLabel;
    GroupBox12: TsGroupBox;
    SgPro: TAdvStringGrid;
    GroupBox13: TsGroupBox;
    Label33: tsLabel;
    Plcod_empresa: TsComboEdit;
    DG_produto_pertence: TDBGrid;
    BitBtn1: TsBitBtn;
    BitBtn2: TsBitBtn;
    Plcod_produto: TsEdit;
    q_grade: TFDQuery;
    ds_grade: TDataSource;
    ds_produto_empresa: TDataSource;
    Lbempresa: tsLabel;
    PrQtd_dias_desat: TsCurrencyEdit;
    PaAguarde: tsPanel;
    Image2: TImage;
    Label27: tsLabel;
    Label37: tsLabel;
    GroupBox14: TsGroupBox;
    BitBtn3: TsBitBtn;
    Lbestoque: tsLabel;
    Prcod_estoque: TsComboEdit;
    Label45: tsLabel;
    Label40: tsLabel;
    Prdesconto_maximo: TsCurrencyEdit;
    Prid_marca: TsComboEdit;
    Lbmarca: tsLabel;
    Label49: tsLabel;
    Prunidade: TsComboEdit;
    Lbl_cliente: tsLabel;
    Pricms: TsCurrencyEdit;
    asda: tsLabel;
    Prstatus: tscheckbox;
    Prmargem_valor_agregado_st: TsCurrencyEdit;
    Label19: tsLabel;
    Prcod_fiscal_produto: TsComboEdit;
    Label22: tsLabel;
    Lbnom_cod_fiscal: tsLabel;
    ODfoto: TOpenDialog;
    Label51: tsLabel;
    PrNCM: TsComboEdit;
    Lb_NCM: tsLabel;
    Label52: tsLabel;
    PrMts_Rolo: TsCurrencyEdit;
    Label53: tsLabel;
    PrPERC_MARGEM_MINIMA: TsCurrencyEdit;
    PrPromocao: tscheckbox;
    Label54: tsLabel;
    Prsubcategoria: TsComboEdit;
    lbSubCategoria: tsLabel;
    XMLGeral: TXMLDocument;
    idHttpGeral: TIdHTTP;
    lbOrd_Pauta: tsLabel;
    PrOrd_Pauta: TsEdit;
    Label55: tsLabel;
    PrPreco_Promocao: TsCurrencyEdit;
    Panel3: tsPanel;
    sbCodeBar: TsSpeedButton;
    BtNov: TsBitBtn;
    BtAlt: TsBitBtn;
    BtGra: TsBitBtn;
    BtExc: TsBitBtn;
    BtLocalizar: TsBitBtn;
    PgMov: TsPageControl;
    tbEntradas: TsTabSheet;
    tbReservado: TsTabSheet;
    TbFaturado: TsTabSheet;
    tbAcerto: TsTabSheet;
    Panel4: tsPanel;
    Panel5: tsPanel;
    dtMovIni: TsDateEdit;
    Label56: tsLabel;
    dtMovFim: TsDateEdit;
    Label57: tsLabel;
    BtPesqMov: TsBitBtn;
    q_mov_ent: TFDQuery;
    q_mov_res: TFDQuery;
    q_mov_fat: TFDQuery;
    q_mov_acerto: TFDQuery;
    Panel6: tsPanel;
    stEntradas: tsLabel;
    stReservado: tsLabel;
    stSaida: tsLabel;
    stAcerto: tsLabel;
    ds_mov_ent: TDataSource;
    ds_mov_fat: TDataSource;
    ds_mov_res: TDataSource;
    ds_mov_acerto: TDataSource;
    DBGrid1: Tdbgrid;
    DBGrid2: Tdbgrid;
    DBGrid3: Tdbgrid;
    DBGrid4: Tdbgrid;
    Panel7: tsPanel;
    PrPromocao_pacote: tscheckbox;
    Prid_plano_contas: TsComboEdit;
    Lbnom_plano_contas_N1: tsLabel;
    Lbnom_plano_contas_N2: tsLabel;
    Lbnom_plano_contas_N3: tsLabel;
    Lbnom_plano_contas_N4: tsLabel;
    Label58: tsLabel;
    Pacusto_produto: tsPanel;
    Label24: tsLabel;
    Label38: tsLabel;
    Label25: tsLabel;
    Label39: tsLabel;
    Label26: tsLabel;
    Label41: tsLabel;
    Label35: tsLabel;
    Label42: tsLabel;
    LbPrecovenda: tsLabel;
    Label10: tsLabel;
    Label36: tsLabel;
    PrCusto: TsCurrencyEdit;
    PrImpostos: TsCurrencyEdit;
    Prgeral: TsCurrencyEdit;
    PrLucro: TsCurrencyEdit;
    Prcalcula_preco_automatic: tscheckbox;
    Prpreco_venda: TsCurrencyEdit;
    Pripi: TsCurrencyEdit;
    GroupBox8: TsGroupBox;
    dgGradeComissoes: Tdbgrid;
    Panel8: tsPanel;
    mmGradeComissao: TRxMemoryData;
    mmGradeComissaocheck: TBooleanField;
    mmGradeComissaoTipo: TStringField;
    mmGradeComissaoInicio: TFloatField;
    mmGradeComissaoFim: TFloatField;
    mmGradeComissaoComissaoInterno: TFloatField;
    mmGradeComissaoComissaoOutros: TFloatField;
    dsGradeComissao: TDataSource;
    mmGradeComissaoPrecoInicial: TCurrencyField;
    mmGradeComissaoValorInterno: TCurrencyField;
    mmGradeComissaoValorOutros: TCurrencyField;
    Label60: tsLabel;
    Label61: tsLabel;
    PrCusto_Total: TsCurrencyEdit;
    TabHistPrec: TsTabSheet;
    Panel10: tsPanel;
    Label62: tsLabel;
    Label63: tsLabel;
    edHistIni: TsDateEdit;
    edHistFim: TsDateEdit;
    BtnPesqHist: TsBitBtn;
    DBGrid5: Tdbgrid;
    mmHistPrec: TRxMemoryData;
    dsHistPrec: TDataSource;
    mmHistPrecDATAHORA: TDateTimeField;
    mmHistPrecUSUARIO: TStringField;
    mmHistPrecCUSTO: TCurrencyField;
    mmHistPrecIMPOSTOS: TCurrencyField;
    mmHistPrecIPI: TCurrencyField;
    mmHistPrecOUTROS: TCurrencyField;
    mmHistPrecCUSTO_TOTAL: TCurrencyField;
    mmHistPrecLUCRO: TFloatField;
    mmHistPrecPRECO_VENDA: TCurrencyField;
    TabDescontoEspecial: TsTabSheet;
    Panel9: tsPanel;
    BtPesqDesc: TsBitBtn;
    dsDescEspecial: TDataSource;
    ft_representante: TsComboEdit;
    ft_lb_nom_representante: tsLabel;
    Panel11: tsPanel;
    Panel12: tsPanel;
    BtNovoDescEsp: TsBitBtn;
    BtAltDescEsp: TsBitBtn;
    BtGravarDescEsp: TsBitBtn;
    BtCancDescEsp: TsBitBtn;
    BtExcDescEsp: TsBitBtn;
    mmGradeComissaoPerc_Desconto: TFloatField;
    Com_Ft_Representante: TsComboEdit;
    lb_com_representante: tsLabel;
    BtnPesqGrade: TsBitBtn;
    mmGradeComissaoPrecoFinal: TCurrencyField;
    Label59: tsLabel;
    Label64: tsLabel;
    PrCOMISSAO_INICIAL_INTERNO: TsCurrencyEdit;
    PrCOMISSAO_INICIAL_OUTROS: TsCurrencyEdit;
    Label65: tsLabel;
    PrESCALA_COMISSAO_INTERNO: TsCurrencyEdit;
    Label66: tsLabel;
    PrESCALA_COMISSAO_OUTROS: TsCurrencyEdit;
    gbRepre: TsGroupBox;
    Lbnom_representante: TDBText;
    edId_representante: TRxDBComboEdit;
    gbDescMax: TsGroupBox;
    edDescMaximo: TDBEdit;
    DBGrid6: Tdbgrid;
    mmDescEspecial: TRxMemoryData;
    mmDescEspecialID_REPRESENTANTE: TIntegerField;
    mmDescEspecialNOME_REPRESENTANTE: TStringField;
    mmDescEspecialDESCONTO_MAXIMO: TFloatField;
    Label67: tsLabel;
    PrEscala_Desconto: TsCurrencyEdit;
    mmGradeComissaoMargemLucroOutros: TFloatField;
    mmGradeComissaoMargemLucroInterno: TFloatField;
    btGrafico: TsSpeedButton;
    Label68: tsLabel;
    PrQtd_Multipla: TsCurrencyEdit;
    Shape1: TShape;
    Foto: TImage;
    PrBONIFICACAO_APENAS: tscheckbox;
    PrMOSTRAR_EMB_ETIQUETA: tscheckbox;
    PrIndisponivel: tscheckbox;
    sPanel1: tsPanel;
    Paestoque: TsGroupBox;
    Label3: tsLabel;
    Label48: tsLabel;
    Label50: tsLabel;
    zzqtdrea: TsCurrencyEdit;
    zzqtdres: TsCurrencyEdit;
    zzqtdtot: TsCurrencyEdit;
    PrRevenda: tscheckbox;
    PrTinta_Base: tscheckbox;
    PfCOD_PRODUTO_FORNECEDOR: TsEdit;
    sLabel5: tsLabel;
    PrNAO_VALIDAR_MARGEM: tscheckbox;
    PrComissao_Fixa: TsCurrencyEdit;
    lbComissao_Fixa: tsLabel;
    PrCUSTO_MATERIA_PRIMA: TsCurrencyEdit;
    PrCUSTO_MAO_DE_OBRA: TsCurrencyEdit;
    edPeso: TsCurrencyEdit;
    sLabel6: tsLabel;
    sLabel9: tsLabel;
    sLabel10: tsLabel;
    sLabel11: tsLabel;
    sLabel12: tsLabel;
    edSubTotal: TsCurrencyEdit;
    sLabel13: tsLabel;
    sLabel14: tsLabel;
    sLabel15: tsLabel;
    sPanel2: tsPanel;
    PrCest: TsEdit;
    sLabel16: tsLabel;
    gbIndustria: TGroupBox;
    sLabel17: tsLabel;
    PrFREQUENCIA: TsEdit;
    label200: tsLabel;
    PrPOTENCIA: TsEdit;
    sLabel19: tsLabel;
    PrTENSAO: TsEdit;
    sLabel20: tsLabel;
    PrCORRENTE: TsEdit;
    Prcod_produto: TsCurrencyEdit;
    sbClonar: TSpeedButton;
    gbCustoEntrada: TGroupBox;
    sLabel18: tsLabel;
    PrEntICMS: TsCurrencyEdit;
    sLabel21: tsLabel;
    PrEntIPI: TsCurrencyEdit;
    sLabel22: tsLabel;
    sLabel23: tsLabel;
    sLabel24: tsLabel;
    PrEntFrete: TsCurrencyEdit;
    sLabel25: tsLabel;
    sLabel26: tsLabel;
    PrCustoSubtotal: TsCurrencyEdit;
    sLabel27: tsLabel;
    sLabel28: tsLabel;
    PrEntST: TsCurrencyEdit;
    sLabel29: tsLabel;
    BtCan: TsBitBtn;
    PrObservacao: TMemo;
    sLabel30: tsLabel;
    Prqtd_estoque_max: TsCurrencyEdit;
    BtRelatMov: TsBitBtn;
    fR_RELATORIO: TfrxReport;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    ft_Cidade: TsEdit;
    ckTodos: TCheckBox;
    mmDescEspecialCIDADE: TStringField;
    Q_produto_empresa: TFDQuery;
    q_mov_rescod_produto: TIntegerField;
    q_mov_resnom_produto: TStringField;
    q_mov_rescont_estoque_ago_2010: TFloatField;
    q_mov_resqtd_estoque: TBCDField;
    q_mov_resqtd_reservado: TBCDField;
    q_mov_rescodigo_cliente_fornecedor: TIntegerField;
    q_mov_resnome_cliente_fornecedor: TStringField;
    q_mov_resnumdoc: TIntegerField;
    q_mov_resdata_mov: TDateField;
    q_mov_resnota_fiscal: TIntegerField;
    q_mov_resqtd: TBCDField;
    q_mov_rescont: TFMTBCDField;
    q_mov_restipo: TStringField;
    q_mov_respreco: TBCDField;
    q_mov_ressub_total: TBCDField;
    q_mov_fatcod_produto: TIntegerField;
    q_mov_fatnom_produto: TStringField;
    q_mov_fatcont_estoque_ago_2010: TFloatField;
    q_mov_fatqtd_estoque: TBCDField;
    q_mov_fatqtd_reservado: TBCDField;
    q_mov_fatcodigo_cliente_fornecedor: TIntegerField;
    q_mov_fatnome_cliente_fornecedor: TStringField;
    q_mov_fatnumdoc: TIntegerField;
    q_mov_fatdata_mov: TDateField;
    q_mov_fatnota_fiscal: TIntegerField;
    q_mov_fatqtd: TBCDField;
    q_mov_fatcont: TFMTBCDField;
    q_mov_fattipo: TStringField;
    q_mov_fatpreco: TBCDField;
    q_mov_fatsub_total: TBCDField;
    q_mov_acertocod_produto: TIntegerField;
    q_mov_acertonom_produto: TStringField;
    q_mov_acertocont_estoque_ago_2010: TFloatField;
    q_mov_acertoqtd_estoque: TBCDField;
    q_mov_acertoqtd_reservado: TBCDField;
    q_mov_acertocodigo_cliente_fornecedor: TIntegerField;
    q_mov_acertonome_cliente_fornecedor: TStringField;
    q_mov_acertonumdoc: TIntegerField;
    q_mov_acertodata_mov: TDateField;
    q_mov_acertonota_fiscal: TIntegerField;
    q_mov_acertoqtd: TBCDField;
    q_mov_acertocont: TBCDField;
    q_mov_acertotipo: TStringField;
    q_mov_entcod_produto: TIntegerField;
    q_mov_entnom_produto: TStringField;
    q_mov_entcont_estoque_ago_2010: TFloatField;
    q_mov_entqtd_estoque: TBCDField;
    q_mov_entqtd_reservado: TBCDField;
    q_mov_entcodigo_cliente_fornecedor: TIntegerField;
    q_mov_entnome_cliente_fornecedor: TStringField;
    q_mov_entnumdoc: TIntegerField;
    q_mov_entdata_mov: TDateField;
    q_mov_entnota_fiscal: TIntegerField;
    q_mov_entqtd: TBCDField;
    q_mov_entcont: TBCDField;
    q_mov_enttipo: TStringField;
    q_mov_entcusto: TBCDField;
    q_mov_entcusto_final: TBCDField;
    procedure btaltClick(Sender: TObject);
    procedure btcanClick(Sender: TObject);
    procedure btgraClick(Sender: TObject);
    procedure btnovClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtExc_PfClick(Sender: TObject);
    procedure BtNov_PfClick(Sender: TObject);
    procedure BtAlt_PfClick(Sender: TObject);
    procedure BtGra_PfClick(Sender: TObject);
    procedure BtCan_PfClick(Sender: TObject);
    procedure BtLocalizarClick(Sender: TObject);
    procedure BtAltClick2(Sender: TObject);
    procedure BtCanClick2(Sender: TObject);
    procedure BtExcClick2(Sender: TObject);
    procedure BtGraClick2(Sender: TObject);
    procedure Prcod_grupoButtonClick(Sender: TObject);
    procedure Pfcod_fornecedorButtonClick(Sender: TObject);
    procedure PrCustoChange(Sender: TObject);
    procedure btAdibClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btexcbClick(Sender: TObject);
    procedure Cbcod_barrasKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_prateleiraKeyPress(Sender: TObject; var Key: Char);
    procedure Gdid_CorButtonClick(Sender: TObject);
    procedure BtAdiGClick(Sender: TObject);
    procedure Gdid_tamanhoButtonClick(Sender: TObject);
    procedure Gdid_tamanhoKeyPress(Sender: TObject; var Key: Char);
    procedure BtExcGClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bt_Sel_fotoClick(Sender: TObject);
    procedure BtIns_fotClick(Sender: TObject);
    procedure Gdid_CorKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_grupoKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_colecaoButtonClick(Sender: TObject);
    procedure Prcod_colecaoKeyPress(Sender: TObject; var Key: Char);
    procedure BtAlt_fotClick(Sender: TObject);
    procedure BtGra_fotClick(Sender: TObject);
    procedure BtCan_fotClick(Sender: TObject);
    procedure BtExc_fotClick(Sender: TObject);
    procedure BtProClick(Sender: TObject);
    procedure BtAntClick(Sender: TObject);
    procedure FotoDblClick(Sender: TObject);
    procedure Prpreco_vendaExit(Sender: TObject);
    procedure Pfcod_fornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure PrgradeExit(Sender: TObject);
    procedure PrNom_produtoExit(Sender: TObject);
    procedure Prfornecedor_principalButtonClick(Sender: TObject);
    procedure Prfornecedor_principalKeyPress(Sender: TObject; var Key: Char);
    procedure Pc_produtoChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Plcod_empresaKeyPress(Sender: TObject; var Key: Char);
    procedure Plcod_empresaButtonClick(Sender: TObject);
    procedure Plcod_empresaExit(Sender: TObject);
    procedure Prfornecedor_principalExit(Sender: TObject);
    procedure Pfcod_fornecedorExit(Sender: TObject);
    procedure Prcod_grupoExit(Sender: TObject);
    procedure Prcod_colecaoExit(Sender: TObject);
    procedure Prcod_estoqueButtonClick(Sender: TObject);
    procedure Prcod_estoqueExit(Sender: TObject);
    procedure Gdid_CorExit(Sender: TObject);
    procedure Gdid_tamanhoExit(Sender: TObject);
    procedure Prid_marcaButtonClick(Sender: TObject);
    procedure Prid_marcaExit(Sender: TObject);
    procedure Prid_marcaKeyPress(Sender: TObject; var Key: Char);
    procedure PrunidadeButtonClick(Sender: TObject);
    procedure PrunidadeExit(Sender: TObject);
    procedure PrunidadeKeyPress(Sender: TObject; var Key: Char);
    procedure PrNom_produtoKeyPress(Sender: TObject; var Key: Char);
    procedure PrgradeKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_fiscal_produtoButtonClick(Sender: TObject);
    procedure Prcod_fiscal_produtoExit(Sender: TObject);
    procedure Prcod_fiscal_produtoKeyPress(Sender: TObject; var Key: Char);
    procedure PrNCMEnter(Sender: TObject);
    procedure PrNCMExit(Sender: TObject);
    procedure PrNCMButtonClick(Sender: TObject);
    procedure PrsubcategoriaButtonClick(Sender: TObject);
    procedure PrsubcategoriaExit(Sender: TObject);
    procedure PrsubcategoriaKeyPress(Sender: TObject; var Key: Char);
    procedure BtPesqMovClick(Sender: TObject);
    procedure q_mov_entAfterOpen(DataSet: TDataSet);
    procedure q_mov_resAfterOpen(DataSet: TDataSet);
    procedure q_mov_fatAfterOpen(DataSet: TDataSet);
    procedure q_mov_acertoAfterOpen(DataSet: TDataSet);
    procedure sbCodeBarClick(Sender: TObject);
    procedure Prid_plano_contasButtonClick(Sender: TObject);
    procedure Prid_plano_contasExit(Sender: TObject);
    procedure BuscaHist(produto: string; dataini, datafim: TDate);
    procedure BtnPesqHistClick(Sender: TObject);
    procedure BtNovoDescEspClick(Sender: TObject);
    procedure BtAltDescEspClick(Sender: TObject);
    procedure BtGravarDescEspClick(Sender: TObject);
    procedure BtCancDescEspClick(Sender: TObject);
    procedure BtExcDescEspClick(Sender: TObject);
    procedure Edid_representanteButtonClick(Sender: TObject);
    procedure Edid_representanteExit(Sender: TObject);
    procedure ft_representanteButtonClick(Sender: TObject);
    procedure BtPesqDescClick(Sender: TObject);
    procedure BuscaDescEspecial;
    procedure ft_representanteExit(Sender: TObject);
    procedure Com_Ft_RepresentanteButtonClick(Sender: TObject);
    procedure Com_Ft_RepresentanteExit(Sender: TObject);
    procedure BtnPesqGradeClick(Sender: TObject);
    procedure q_mov_entBeforeOpen(DataSet: TDataSet);
    procedure q_mov_resBeforeOpen(DataSet: TDataSet);
    procedure q_mov_fatBeforeOpen(DataSet: TDataSet);
    procedure q_mov_acertoBeforeOpen(DataSet: TDataSet);
    procedure dgGradeComissoesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btGraficoClick(Sender: TObject);
    procedure navAfterAction(Sender: TObject);
    procedure sbClonarClick(Sender: TObject);
    procedure Prcod_produtoExit(Sender: TObject);
    procedure PrCestExit(Sender: TObject);
    procedure BtRelatMovClick(Sender: TObject);
    procedure q_produto_fornecedorAfterScroll(DataSet: TDataSet);
  private
    procedure habilitaCamposAreaAtuacao(CodAtuacao: string);
    procedure CalculoPreco;
    procedure InserirProduto(limpar: Boolean);
    procedure TratarNCM;
    procedure CarregarDados;
    { Private declarations }
  public
    { Public declarations }
    modo_insert, modo_insert_fot, modo_insert_Pf: Boolean;
    editar_sg, tipo, acao_foto: string;
    cod_foto: string;
    id: string;
    TemPath: string;
    PathBuf: array [0 .. 255] of Char;

    campo_pesquisado, dado_pesquisado: string;
    busca_qualquer_posicao_pesquisada: Boolean;

    procedure mostra_campos(prefixo: ShortString);
    procedure ativa_produto(id: string; navigator: Boolean);
    // carrega a query q_produto
    procedure ativa_produto_fornecedor(id: string);
    // carrega a query q_produto_fornecedor
    procedure carrega_produto_fornecedor(id: string);
    // carrega a query q_produto_fornecedor cod todos os forn. do produto
    procedure limpa_campos(prefixo: ShortString);
    procedure readonly_true(prefixo: ShortString);
    procedure readonly_false(prefixo: ShortString);
    procedure verifica_nome_produto;

    procedure InsLinha;
    procedure grava_cod_barras(cod_barras, id: string);
    procedure carrega_cod_barras(cod_produto: string);

    procedure monta_sggrade;
    procedure ad_atributo_grade;
    procedure insere_reg_sgGrade(tipo: string);
    procedure carrega_grade(cod_produto: string);

    procedure carrega_produto_empresa(cod_produto: string);

    procedure mostra_fotos_pr(codigo: string);
    procedure habilita_bt_foto(habilitar: Boolean);

    procedure habilita_menus;

    procedure movimentacao_produto(cod_produto: string);
    procedure CarregaMov(produto: string);
    procedure Atualiza_cadastro_produtos_lojas;
    // Atualiza pela internet o cadastro de produtos para as lojas
    procedure AtualizaProdutoWeb;
    procedure DeletaProdutoWeb;
    procedure BuscaMov(produto: string; dataini, datafim: TDate);
  end;

var
  Fr_produtos: TFr_produtos;
  custo_anterior, impostos_anterior, ipi_anterior, geral_anterior, custo_total_anterior, lucro_anterior, preco_venda_anterior: currency;
  materia_prima: Boolean;

implementation

uses Un_dao, UnPri, Un_localizar, UnFun, Un_ncm,
  Un_amplia_foto, Math, un_aviso_representantes, Un_dm,
  un_escolhe_impressora_termica;

{$R *.dfm}

procedure TFr_produtos.btaltClick(Sender: TObject);
begin
  BtNov.Enabled := false;
  BtAlt.Enabled := false;
  BtGra.Enabled := true;
  BtCan.Enabled := true;
  BtExc.Enabled := false;

end;

procedure TFr_produtos.btcanClick(Sender: TObject);
begin
  BtNov.Enabled := true;
  BtAlt.Enabled := true;
  BtGra.Enabled := false;
  BtCan.Enabled := false;
  BtExc.Enabled := true;

end;

procedure TFr_produtos.btgraClick(Sender: TObject);
begin
  BtNov.Enabled := true;
  BtAlt.Enabled := true;
  BtGra.Enabled := false;
  BtCan.Enabled := false;
  BtExc.Enabled := true;

end;

procedure TFr_produtos.btnovClick(Sender: TObject);
begin
  BtNov.Enabled := false;
  BtAlt.Enabled := false;
  BtGra.Enabled := true;
  BtCan.Enabled := true;
  BtExc.Enabled := false;
  materia_prima := true;
  gbCustoEntrada.Enabled := true;
  InserirProduto(true);
end;

procedure TFr_produtos.FormShow(Sender: TObject);
begin
  // tamanho do Panel Aguarde
  PaAguarde.Visible := false;
  PaAguarde.Width := 497;
  PaAguarde.Height := 257;
  PaAguarde.Top := 160;
  PaAguarde.Left := 195;
  // ANIMACAO.Animate := true;

  if not(DM.q_configuracao.Active) then
    FRPRI.ativa_configuracao;

  Pc_produto.ActivePageIndex := 0;
  bt_Sel_foto.Caption := 'Selecionar' + #13 + 'Foto';
  limpa_campos('Pr');
  limpa_campos('Gd');
  // monta_sggrade;
  readonly_true('Pr');
  readonly_true('Ft');
  readonly_true('Gd');
  readonly_true('Pl');
  habilita_bt_foto(false);
  habilita_menus;
  habilitaCamposAreaAtuacao(area_atuacao);
  if FRPRI.TipUsu >= '5' then
  begin
    tab_custo_valores.tabVisible := true;
    TabHistPrec.tabVisible := true;
    TabDescontoEspecial.tabVisible := true;
  end
  else
  begin
    tab_custo_valores.tabVisible := false;
    TabHistPrec.tabVisible := false;
    TabDescontoEspecial.tabVisible := false;
  end;

  dao.q_nav.SQL.clear;
  dao.q_nav.SQL.Text := 'select cod_produto from produto order by cod_produto';
  dao.q_nav.open;
  dao.q_nav.First;
  ativa_produto(dao.q_nav.fieldbyname('cod_produto').AsString, false);
  mostra_campos('Pr');
end;

procedure TFr_produtos.BtExc_PfClick(Sender: TObject);
begin
  if Pfcod_fornecedor.Text = '' then
  begin
    showmessage('Não é possivel excluir esta Fornecedor do Produto por não ter Código!');
    BtExc_Pf.SetFocus;
    Exit;
  end;

  if MessageDlg('Tem Certeza que Deseja Excluir Este Fornecedor do Produto?', mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    try
      //if not dao.cn.InTransaction then
        dao.cn.StartTransaction;
      dao.delete('id', q_produto_fornecedor.fieldbyname('id').AsString, 'produto_fornecedor');
      dao.cn.Commit;
    except
      dao.cn.Rollback;
    end;
    dao.msg('Fornecedor do Produto Excluido com Sucesso!');
  end;
  carrega_produto_fornecedor(Prcod_produto.Text);

end;

procedure TFr_produtos.BtNov_PfClick(Sender: TObject);
begin
  try
    if Prcod_produto.Text = '' then
    begin
      dao.msg('Primeiro Deve Ser Gravado o Produto da 1ª Aba');
      Exit;
    end;

    modo_insert_Pf := true;
    readonly_false('Pf');
    Pfcod_fornecedor.SetFocus;
    // habilita botões
    BtNov_Pf.Enabled := false;
    BtAlt_Pf.Enabled := false;
    BtGra_Pf.Enabled := true;
    BtCan_Pf.Enabled := true;
    BtExc_Pf.Enabled := false;

    limpa_campos('Pf');
    LbNom_fornecedor.Caption := '...';

  except

  end;

end;

procedure TFr_produtos.BtAlt_PfClick(Sender: TObject);
begin
  try
    modo_insert_Pf := false;
    readonly_false('PR');
    // habilita botões
    Pfcod_fornecedor.SetFocus;
    // habilita botões
    BtNov_Pf.Enabled := false;
    BtAlt_Pf.Enabled := false;
    BtGra_Pf.Enabled := true;
    BtCan_Pf.Enabled := true;
    BtExc_Pf.Enabled := false;

    Pfcod_fornecedor.SetFocus;

  except
  end;

end;

procedure TFr_produtos.BtGra_PfClick(Sender: TObject);
begin
  try
    BtNov_Pf.Enabled := true;
    BtAlt_Pf.Enabled := true;
    BtGra_Pf.Enabled := false;
    BtCan_Pf.Enabled := false;
    BtExc_Pf.Enabled := true;

    if modo_insert_Pf then
    begin
      Pfcod_produto.Text := Prcod_produto.Text;
      try
       // if not(dao.cn.InTransaction) then
          (dao.cn.StartTransaction);
        id := dao.insert('Pf', 'produto_fornecedor', 'id', Fr_produtos, 'gen_produto_fornecedor');
        dao.cn.Commit;
      except
        dao.cn.Rollback;
      end;

      ativa_produto_fornecedor(id);
      carrega_produto_fornecedor(q_produtos.fieldbyname('cod_produto').AsString);
      BtNov_Pf.SetFocus;
    end
    else
    begin
      try
       // if not dao.cn.InTransaction then
          dao.cn.StartTransaction;
        dao.update('produto_fornecedor', 'id', q_produto_fornecedor.fieldbyname('id').AsString, 'Pf', Fr_produtos);
        dao.cn.Commit;
      except
        dao.cn.Rollback;
      end;
      ativa_produto_fornecedor(q_produto_fornecedor.fieldbyname('id').AsString);
      carrega_produto_fornecedor(q_produtos.fieldbyname('cod_produto').AsString);
    end;
  except
    on e: Exception do
    begin
      dao.msg('Houve um erro ao Gravar o Fornecedor deste Produto!' + #13 + e.message);
    end;
  end;
end;

procedure TFr_produtos.BtCan_PfClick(Sender: TObject);
begin
  try
    if MessageDlg('Deseja Cancelar está Operação?', mtConfirmation, [mbyes, mbno], 0) = mryes then
    begin
      BtNov_Pf.Enabled := true;
      BtAlt_Pf.Enabled := true;
      BtGra_Pf.Enabled := false;
      BtCan_Pf.Enabled := false;
      BtExc_Pf.Enabled := true;

      if modo_insert then
      begin
        limpa_campos('Pf');
        readonly_true('Pf');
      end
      else if not(modo_insert) then
        carrega_produto_fornecedor(Prcod_produto.Text);
    end
    else
      Exit;
  except
  end;

end;

procedure TFr_produtos.CarregarDados;
begin

  habilita_bt_foto(false);
  if q_produtos.Active then
  begin
    dao.Geral1('select preco_venda, qtd_estoque, qtd_reservado, (qtd_estoque+qtd_reservado) as qtdtot, grade from produto where cod_produto=' +
      QuotedStr(q_produtos.fieldbyname('cod_produto').AsString));
    zzestoque_disponivel.Text := dao.Q1.fieldbyname('qtd_estoque').AsString;
    zzestoque.Text := dao.Q1.fieldbyname('qtd_estoque').AsString;
    zzqtdrea.Text := dao.Q1.fieldbyname('qtd_estoque').AsString;
    zzqtdres.Text := dao.Q1.fieldbyname('qtd_reservado').AsString;
    zzqtdtot.Text := dao.Q1.fieldbyname('qtdtot').AsString;

    zzPreco_venda.Value := dao.Q1.fieldbyname('preco_venda').AsFloat;

    if dao.Q1.fieldbyname('grade').AsString = '0' then
      tab_grade.tabVisible := true
    else
      tab_grade.tabVisible := false;

  end;

  if Prcod_produto.Text <> '' then
  begin
    // foto.Picture := nil;
    zzDescricao.Text := '';
    mostra_fotos_pr(Prcod_produto.Text);
    carrega_produto_empresa(Prcod_produto.Text);
  end;
end;


procedure TFr_produtos.BtLocalizarClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Produto';
  chamou_pesquisa := 'fr_produto';
  chamou_form := 'fr_produto';
  chamou_cadastro := 'Fr_produto';
  revenda := 'S';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Produto';
  Fr_localizar.BT_cadastro.Visible := false;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 6);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'Marca';
  Campos_combo[3] := 'Referencia';
  Campos_combo[4] := 'Grupo';
  Campos_combo[5] := 'Fornecedor';

  for i := 0 to 5 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  if campo_pesquisado <> '' then
  begin
    Fr_localizar.CBcampos.ItemIndex := Fr_localizar.CBcampos.Items.IndexOf(campo_pesquisado);
    Fr_localizar.EDlocalizar.Text := dado_pesquisado;
    Fr_localizar.zzbusca_qualquer.Checked := busca_qualquer_posicao_pesquisada;
    Fr_localizar.loc_produto(Fr_localizar.EDlocalizar.Text);
  end;
  Fr_localizar.ckativos.visible := True;
  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

  CarregarDados;
end;

procedure TFr_produtos.BtAltClick2(Sender: TObject);
begin
  try
    if Prcod_produto.Text = '' then
    begin
      dao.msg('Para alterar os dados você deve selecionar um produto!');
      Exit;
    end;
    modo_insert := false;
    editar_sg := 'S';
    readonly_false('Pr');
    readonly_false('Gd');
    readonly_false('Pl');
    // habilita botões
    BtNov.Enabled := false;
    BtAlt.Enabled := false;
    BtGra.Enabled := true;
    BtCan.Enabled := true;
    BtExc.Enabled := false;
    BtLocalizar.Enabled := false;
    habilita_bt_foto(true);
    Prcod_produto.Enabled := false;
    if Pc_produto.ActivePageIndex = 0 then
      PrNom_produto.SetFocus;

  except
  end;

end;

procedure TFr_produtos.BtCanClick2(Sender: TObject);
begin
  try
    if MessageDlg('Deseja Cancelar está Operação?', mtConfirmation, [mbyes, mbno], 0) = mryes then
    begin
      BtNov.Enabled := true;
      BtAlt.Enabled := true;
      BtGra.Enabled := false;
      BtCan.Enabled := false;
      Prcod_produto.Enabled := true;
      BtExc.Enabled := true;
      BtLocalizar.Enabled := true;
      habilita_bt_foto(false);

      if modo_insert then
      begin
        limpa_campos('Pr');
        readonly_true('Pr');
        readonly_true('Gd');
        readonly_true('Pl');
      end
      else if not(modo_insert) then
      begin
        carrega_cod_barras('Pr');
        mostra_campos('Pr');
        readonly_true('Pr');
        readonly_true('Pl');
      end;
    end
    else
      Exit;
  except
  end;

end;

procedure TFr_produtos.BtExcClick2(Sender: TObject);
begin
  if Prcod_produto.Text = '' then
  begin
    showmessage('Não é possivel excluir esta Produto por não ter Código!');
    BtNov.SetFocus;
    Exit;
  end;

  if MessageDlg('Tem Certeza que Deseja Excluir Este Produto?', mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    dao.Geral1('select cod_produto from vendas2 where cod_produto=' + QuotedStr(Prcod_produto.Text));
    if dao.Q1.RecordCount > 0 then
    begin
      dao.msg('ESTE PRODUTO NÃO PODE SER EXCLUIDO PORQUE ESTÁ EM USO POR OUTRAS TABELAS!');
      Exit;
    end;
    dao.Geral1('select cod_produto from entrada2 where cod_produto=' + QuotedStr(Prcod_produto.Text));
    if dao.Q1.RecordCount > 0 then
    begin
      dao.msg('ESTE PRODUTO NÃO PODE SER EXCLUIDO PORQUE ESTÁ EM USO POR OUTRAS TABELAS!');
      Exit;
    end;
    //DeletaProdutoWeb;
    dao.delete('cod_produto', q_produtos.fieldbyname('cod_produto').AsString, 'grade');
    dao.delete('cod_produto', q_produtos.fieldbyname('cod_produto').AsString, 'produto_fornecedor');
    dao.delete('cod_produto', q_produtos.fieldbyname('cod_produto').AsString, 'produto');
    limpa_campos('Pr');

    dao.msg('Produto Excluido com Sucesso!');

  end;
  mostra_campos('');

end;

procedure TFr_produtos.BtGraClick2(Sender: TObject);
var
  i: Smallint;
  sql_log, SQL: string;
begin
  try
    verifica_nome_produto; // verifica se o nome do produto ja existe
    (*
      if area_atuacao = '0' then
      begin
      if Prcod_colecao.Text = '' then
      begin
      dao.msg('O campo Coleção não pode ficar vazio!');
      Pc_produto.ActivePage := tab_dados;
      Prcod_colecao.SetFocus;
      Exit;
      end;

      end;

      if dao.q2.Active then
      if dao.q2.RecordCount > 0 then
      Exit;
    *)
    if Trim(PrNom_produto.Text) = '' then
    begin
      dao.msg('O campo Nome do Produto não pode ficar vazio!');
      Pc_produto.ActivePage := tab_dados;
      PrNom_produto.SetFocus;
      Exit;
    end;

    if Prcod_grupo.Text = '' then
    begin
      dao.msg('O campo Grupo não pode ficar vazio!');
      Pc_produto.ActivePage := tab_dados;
      Prcod_grupo.SetFocus;
      Exit;
    end;

    if PrCusto.Text = '0' then
    begin
      dao.msg('O campo Custo não pode ser igual a zero!');
      Pc_produto.ActivePage := tab_custo_valores;
      PrCusto.SetFocus;
      Exit;
    end;

    if PrLucro.Text = '0' then
    begin
      dao.msg('O campo Margem de Lucro não pode ser igual a zero!');
      Pc_produto.ActivePage := tab_custo_valores;
      PrLucro.SetFocus;
      Exit;
    end;

    if Prpreco_venda.Text = '0' then
    begin
      dao.msg('O campo Preço de Venda não pode ser igual a zero!');
      Pc_produto.ActivePage := tab_custo_valores;
      Prpreco_venda.SetFocus;
      Exit;
    end;
    {
      if PrNCM.Text = '' then
      begin
      dao.Geral4('select coalesce(ncm, '''') as ncm from grupo where cod_grupo = ' + Prcod_grupo.Text);
      if dao.Q4.FieldByName('ncm').AsString = '' then
      begin
      dao.msg('O campo NCM não pode ficar vazio!');
      Pc_produto.ActivePage := tab_custo_valores;
      end;
      end;
    }
    if PrQtd_embalagem.Text = '' then
    begin
      dao.msg('O campo Qtd embalagem não pode ficar vazio!');
      PrQtd_embalagem.SetFocus;
      Exit;
    end;

    if Prfornecedor_principal.Text = '' then
    begin
      dao.msg('O FORNECEDOR PRINCIPAL DEVE SER INFORMADO!');
      Pc_produto.ActivePage := tab_fornecedor;
      Prfornecedor_principal.SetFocus;
      Exit;
    end;
    {
      if Prid_marca.Text = '' then
      begin
      dao.msg('O campo Marca deve ser Informado!');
      Pc_produto.ActivePage := tab_dados;
      Prid_marca.SetFocus;
      Exit;
      end;

      if Prsubcategoria.Text = '' then
      begin
      dao.msg('O campo Subcategoria deve ser Informado!');
      Pc_produto.ActivePage := tab_dados;
      Prsubcategoria.SetFocus;
      Exit;
      end;
    }

    BtNov.Enabled := true;
    BtAlt.Enabled := true;
    BtGra.Enabled := false;
    BtCan.Enabled := false;
    BtExc.Enabled := true;
    BtLocalizar.Enabled := true;
    { if Prcalcula_preco_automatic.Checked then
      begin
      dao.Geral1('select lucro_definido from fornecedor where cod_fornecedor=' + QuotedStr(Prfornecedor_principal.Text));
      PrLucro.Value := dao.Q1.fieldbyname('lucro_definido').AsFloat;
      end;
    }

    if modo_insert then
    begin
      try
        if not(dao.cn.InTransaction) then
          (dao.cn.StartTransaction);
        if Prcod_produto.Value = 0 then
        begin
          id := dao.insert('Pr', 'produto', 'cod_produto', Fr_produtos, 'gen_produto');
          Prcod_produto.Text := id;
        end
        else
          dao.insert('Pr', 'produto', '', Fr_produtos, '');
        dao.cn.Commit;
      except
        dao.cn.Rollback;
      end;
      ativa_produto(Prcod_produto.Text, false);
    end
    else
    begin
      try
        //if not(dao.cn. InTransaction) then
          (dao.cn.StartTransaction);
        dao.update('produto', 'cod_produto', q_produtos.fieldbyname('cod_produto').AsString, 'Pr', Fr_produtos);
        dao.cn.Commit;
      except
        dao.cn.Rollback;
      end;

    end;

    if ((custo_anterior <> PrCusto.Value) or (impostos_anterior <> PrImpostos.Value) or (ipi_anterior <> Pripi.Value) or (geral_anterior <> Prgeral.Value) or
      (custo_total_anterior <> PrCusto_Total.Value) or (lucro_anterior <> PrLucro.Value) or (preco_venda_anterior <> Prpreco_venda.Value)) then
    begin
      try
     //   if not(dao.cn.InTransaction) then
          (dao.cn.StartTransaction);
        sql_log := ' INSERT INTO PRODUTO_LOG_PRECO (CODUSU, COD_PRODUTO, DATA_HORA, CUSTO, IMPOSTOS, IPI, OUTROS, CUSTO_TOTAL, LUCRO, PRECO_VENDA) ' + ' VALUES ( ' + cod_usuario + ', ' +
          Prcod_produto.Text + ', current_timestamp, ' + ' ' + FMFUN.BuscaTroca(PrCusto.Text, ',', '.') + ', ' + ' ' + FMFUN.BuscaTroca(PrImpostos.Text, ',', '.') + ', ' + ' ' +
          FMFUN.BuscaTroca(Pripi.Text, ',', '.') + ', ' + ' ' + FMFUN.BuscaTroca(Prgeral.Text, ',', '.') + ', ' + ' ' + FMFUN.BuscaTroca(PrCusto_Total.Text, ',', '.') + ', ' + ' ' +
          FMFUN.BuscaTroca(PrLucro.Text, ',', '.') + ', ' + ' ' + FMFUN.BuscaTroca(Prpreco_venda.Text, ',', '.') + ') ';
        dao.Execsql(sql_log);
        dao.cn.Commit;

        custo_anterior := PrCusto.Value;
        impostos_anterior := PrImpostos.Value;
        ipi_anterior := Pripi.Value;
        geral_anterior := Prgeral.Value;
        custo_total_anterior := PrCusto_Total.Value;
        lucro_anterior := PrLucro.Value;
        preco_venda_anterior := Prpreco_venda.Value;

      except
        dao.cn.Rollback;
      end;

    end;

    { if (preco_venda_anterior <> Prpreco_venda.Value) then
      begin
      //Aviso de Alteração de Preço
      if MessageDlg('Enviar SMS e Email de Aviso aos Representantes?', mtConfirmation, [mbYes, mbno], 0) = mrYes then
      begin
      Application.CreateForm(Tfm_aviso_representantes, fm_aviso_representantes);
      fm_aviso_representantes.Assunto_Aviso := 'Aviso - Alteração de Preço.';
      fm_aviso_representantes.Texto_Aviso := 'Foi Alterado o Preço do Produto: ' + Prcod_produto.Text + ' - ' + Prnom_produto.Text + #13;
      fm_aviso_representantes.Anexo := '';
      fm_aviso_representantes.ShowModal;
      end;
      end; }
    try
     // if not(dao.cn.InTransaction) then
        (dao.cn.StartTransaction);
      SQL := ' DELETE FROM PRODUTO_REPRESENTANTE WHERE COD_PRODUTO = ' + Prcod_produto.Text;
      dao.Execsql(SQL);
      dao.cn.Commit;
    except
      dao.cn.Rollback;
    end;

    if mmDescEspecial.RecordCount > 0 then
    begin
      mmDescEspecial.First;
      while not mmDescEspecial.Eof do
      begin
        try
          //if not(dao.cn.InTransaction) then
            (dao.cn.StartTransaction);
          { sql := ' INSERT INTO PRODUTO_REPRESENTANTE (COD_PRODUTO, ID_REPRESENTANTE, DESCONTO_MAXIMO, COMISSAO_INICIAL_INTERNO, COMISSAO_INICIAL_OUTROS, ESCALA_COMISSAO_INTERNO, ESCALA_COMISSAO_OUTROS, ESCALA_DESCONTO) ' +
            ' VALUES ( ' + PRCOD_produto.Text + ', ' + mmDescEspecialID_REPRESENTANTE.AsString +
            ', ' + FMFUN.BuscaTroca(mmDescEspecialDESCONTO_MAXIMO.AsString, ',', '.') + ', ' + FMFUN.BuscaTroca(mmDescEspecialCOMISSAO_INICIAL_INTERNO.AsString, ',', '.') + ', '
            + FMFUN.BuscaTroca(mmDescEspecialCOMISSAO_INICIAL_OUTROS.AsString, ',', '.') + ', ' + FMFUN.BuscaTroca(mmDescEspecialESCALA_COMISSAO_INTERNO.AsString, ',', '.') + ', '
            + FMFUN.BuscaTroca(mmDescEspecialESCALA_COMISSAO_OUTROS.AsString, ',', '.') + ', ' + FMFUN.BuscaTroca(mmDescEspecialESCALA_DESCONTO.AsString, ',', '.') + ') '; }

          SQL := ' INSERT INTO PRODUTO_REPRESENTANTE (COD_PRODUTO, ID_REPRESENTANTE, DESCONTO_MAXIMO) ' + ' VALUES ( ' + Prcod_produto.Text + ', ' +
            mmDescEspecialID_REPRESENTANTE.AsString + ', ' + FMFUN.BuscaTroca(mmDescEspecialDESCONTO_MAXIMO.AsString, ',', '.')+ ') ';

          dao.Execsql(SQL);
          dao.cn.Commit;
        except
          dao.cn.Rollback;
        end;

        mmDescEspecial.Next;
      end;
    end;
    readonly_true('Pr');
    readonly_true('Gd');
    readonly_true('Pf');
    readonly_true('Pl');
    habilita_bt_foto(false);

    { dao.Geral2('select id from produto_empresa where cod_produto='+QuotedStr(Prcod_produto.Text));
      if dao.Q2.RecordCount <=0 then
      begin
      dao.msg('Não foi encontrado nenhuma empresa cadastrada para esse produto'+#13+'lance a(s) Empresa(s) da qual esse produto pertence!');
      Pc_produto.ActivePage:= tab_fornecedor;
      readonly_false('Pl');
      BtAlt.Click;
      Plcod_empresa.SetFocus;
      exit;
      end; }

    { try
      // dao.Geral2('select grava_prod_aut_internet from configuracao where cod_conf =' + QuotedStr('1'));
      // if dao.Q2.fieldbyname('grava_prod_aut_internet').AsString = 'S' then
      // begin
      //  Atualiza_cadastro_produtos_lojas;
      //  end;
      //  PaAguarde.Visible:= false;
      except
      on e: Exception do
      begin
      PaAguarde.Visible:= false;
      dao.msg('Houve um erro na replicação de Dados para as Lojas!'+#13+
      e.message);
      end;
      end; }
    if not(dao.cn.InTransaction) then
      dao.cn.StartTransaction;

    {if Prstatus.Checked then
      DeletaProdutoWeb
    else
      AtualizaProdutoWeb;}

    FMFUN.GravaCodeBar(Prcod_produto.Text, FRPRI.Tipo_Etiqueta);
    dao.cn.Commit;
    BuscaHist(q_produtos.fieldbyname('cod_produto').AsString, now - 30, now);
    Prcod_produto.Enabled := true;
  except
    on e: Exception do
    begin
      dao.cn.Rollback;
      dao.msg('Houve um erro ao Gravar o Produto!' + #13 + e.message);
    end;
  end;
end;

procedure TFr_produtos.DeletaProdutoWeb;
var
  Consulta: TStringStream;
begin
  Consulta := TStringStream.Create('');
  Consulta.WriteString('modo=deleta_produto');
  Consulta.WriteString('&id=' + Prcod_produto.Text);
  FMFUN.AtualizarSite(Consulta);
  Consulta.free;
end;

procedure TFr_produtos.AtualizaProdutoWeb;
var
  Consulta: TStringStream;
begin

  Consulta := TStringStream.Create('');
  Consulta.WriteString('modo=produto');
  Consulta.WriteString('&id=' + Prcod_produto.Text);
  Consulta.WriteString('&produto=' + PrNom_produto.Text);
  Consulta.WriteString('&subcategoria=' + Prsubcategoria.Text);
  Consulta.WriteString('&id_marca=' + Prid_marca.Text);
  Consulta.WriteString('&ord=' + PrOrd_Pauta.Text);
  Consulta.WriteString('&caracteristica=' + StringReplace(PrObservacao.Text, ''#$D#$A'', '<br>', [rfReplaceAll]));
  Consulta.WriteString('&qtd_embalagem=' + PrQtd_embalagem.Text);
  Consulta.WriteString('&unidade=' + Prunidade.Text);

  if PrPromocao.Checked then
    Consulta.WriteString('&promocao=1')
  else
    Consulta.WriteString('&promocao=0');

  if PrIndisponivel.Checked then
    Consulta.WriteString('&indisponivel=1')
  else
    Consulta.WriteString('&indisponivel=0');

  Consulta.WriteString('&valor' + FormatFloat('R$ #,###,##0.00', PrPreco_Promocao.Value));

  FMFUN.AtualizarSite(Consulta);

  Consulta.free;
end;

procedure TFr_produtos.InserirProduto(limpar: Boolean);
begin
  try
    modo_insert := true;
    tipo := '1';
    editar_sg := 'S';
    readonly_false('Pr');
    readonly_false('Gd');
    readonly_false('Pl');

    // habilita botões
    BtNov.Enabled := false;
    BtAlt.Enabled := false;
    BtGra.Enabled := true;
    BtCan.Enabled := true;
    BtExc.Enabled := false;
    BtLocalizar.Enabled := false;

    Prcod_produto.clear;
    Prcod_produto.Enabled := false;

    if limpar then
    begin
      Q_cod_barras.Close;
      habilita_bt_foto(false);
      limpa_campos('Pr');
      limpa_campos('Gd');
      Prunidade.Text := 'PC';
      PrQtd_embalagem.Value := 1;
      Prgrade.ItemIndex := 0;
      Pc_produto.ActivePageIndex := 0;

      Prcod_estoque.Text := '1';
      Lbestoque.Caption := 'VENDA';

      Q_produto_empresa.Close;

      if not(DM.q_configuracao.Active) then
        FRPRI.ativa_configuracao;

      if DM.q_configuracao.fieldbyname('calcular_preco_venda_automatic').AsString = 'S' then
        Prcalcula_preco_automatic.Checked := true;

      mmHistPrec.Close;
      mmHistPrec.EmptyTable;

      mmGradeComissao.Close;
      mmGradeComissao.EmptyTable;

      mmDescEspecial.Close;
      mmDescEspecial.EmptyTable;

      PrNom_produto.SetFocus;
      q_produto_fornecedor.Close;
      Plcod_empresa.clear;
    end;
  except
    ///
  end;

end;

procedure TFr_produtos.ativa_produto(id: string; navigator: Boolean);
begin
  with q_produtos do
  begin
    Close;
    SQL.clear;
    SQL.Add('select a.COD_PRODUTO, a.tinta_base, a.indisponivel, a.revenda, a.NOM_PRODUTO, a.COD_GRUPO, a.UNIDADE, a.PESO, a.REF_FABRICA, ' +
      'a.COD_PRATELEIRA, a.QTD_ESTOQUE, a.QTD_ESTOQUE_MIN, a.QTD_ESTOQUE_MAX, a.QTD_RESERVADO, a.QTD_ESTOQUE_MIN, a.ETIQUETA_LIN1, ' + 'a.ETIQUETA_LIN2, a.OBSERVACAO, a.ORIGEM_MERCADORIA, a.TRIB_ICMS, a.IPI, a.CUSTO, ' +
      'a.IMPOSTOS, a.GERAL, a.OUTROS, a.LUCRO, a.AVISAR_PROD_DESAT, a.QTD_DIAS_DESAT, ' + 'a.DTA_ULT_ATUALIZACAO, a.CUSTO_MEDIO, a.CUSTO_CALCULADO, a.CUSTO_ATUALIZADO, a.CustoSubtotal, ' +
      'a.EntST, a.EntFrete, a.EntIPI, a.EntICMS, a.materia_prima, ' + 'a.QTD_ULT_ENTRADA, a.QTD_ULT_SAIDA, a.DTA_ULT_ENTRADA, a.DTA_ULT_SAIDA, ' +
      'a.CUSTO_MATERIA_PRIMA, a.CUSTO_MAO_DE_OBRA, a.cest, a.FREQUENCIA, a.POTENCIA, a.TENSAO, a.CORRENTE, a.PROCESSOS, ' + 'a.QTD_EMBALAGEM, a.PRECO_VENDA, a.STATUS, a.ESTOQUE_MINIMO, a.GRADE, ' +
      'a.COD_COLECAO, a.CALCULA_PRECO_AUTOMATIC, a.FORNECEDOR_PRINCIPAL, a.COD_EMPRESA, ' + 'a.COD_ESTOQUE, a.DESCONTO_MAXIMO, a.ID_MARCA, a.COD_PRO2, a.ICMS, ' +
      'a.MARGEM_VALOR_AGREGADO_ST, a.COD_FISCAL_PRODUTO, a.NCM, a.ESTOQUE_MAXIMO, ' + 'a.MTS_ROLO, a.ORD_PAUTA, a.CONT_ESTOQUE_AGO_2010, a.PROMOCAO, a.PERC_MARGEM_MINIMA, ' +
      'a.SUBCATEGORIA, a.PRECO_PROMOCAO, a.QTD_MULTIPLA, a.SINCRONIZAR_PALM, ' + 'a.PROMOCAO_PACOTE, a.ID_PLANO_CONTAS, a.GRADE_COMISSAO, a.CUSTO_TOTAL, a.BONIFICACAO_APENAS, ' +
      'a.COMISSAO_INICIAL_INTERNO, a.COMISSAO_INICIAL_OUTROS, a.ESCALA_COMISSAO_INTERNO, a.ESCALA_COMISSAO_OUTROS, a.ESCALA_DESCONTO, a.CODIGO_BARRA, ' +
      'g.nom_grupo, f.razao_social, ep.nom_empresa, ce.descricao, ma.nom_marca, a.NAO_VALIDAR_MARGEM, a.COMISSAO_FIXA, ' +
      'cl.descricao as nom_colecao, a.MOSTRAR_EMB_ETIQUETA, a.LOC_PADRAO, a.LOC_A_FILA, a.LOC_A_LADO, A.LOC_A_ANDAR, A.LOC_A_BOX, A.LOC_B_ANDAR, A.LOC_B_BOX from produto a ' +
      'left join grupo g on g.cod_grupo=a.cod_grupo ' + 'left join fornecedor f on f.cod_fornecedor=a.fornecedor_principal ' + 'left join empresa ep on ep.cod_empresa=a.cod_empresa ' +
      'left join categoria_estoque ce on ce.id=a.cod_estoque ' + 'left join marcas ma on ma.id=a.id_marca ' + 'left join colecao cl on cl.id=a.cod_colecao ' + 'where a.cod_produto=' + QuotedStr(id));
    open;
  end;

  Q_cod_barras.SQL.clear;
  Q_cod_barras.SQL.Text := ' SELECT CODIGO_BARRA ' +
                           ' from ' +
                           ' ( ' +
                           '   SELECT a.COD_PRODUTO, a.NOM_PRODUTO, a.CODIGO_BARRA, 0 AS ORD ' +
                           '   FROM PRODUTO a ' +
                           '   WHERE A.COD_PRODUTO = ' + id +
                           '   union ' +
                           '   sELECT A.COD_PRODUTO, A.NOM_PRODUTO, C.COD_BARRAS AS CODIGO_BARRA, 1 AS ORD FROM COD_BARRAS C ' +
                           '   INNER JOIN PRODUTO A ON A.COD_PRODUTO = C.COD_PRODUTO ' +
                           '   WHERE A.COD_PRODUTO = ' + id +
                           ' ) q1 ' +
                           ' ORDER BY ORD, CODIGO_BARRA';
  Q_cod_barras.open;

  if navigator then
  begin
    dao.q_nav.SQL.clear;
    dao.q_nav.SQL.Text := 'select cod_produto from produto order by cod_produto ';
  end;

end;

procedure TFr_produtos.limpa_campos(prefixo: ShortString);
var
  i: Integer;
begin
  Lb_NCM.Caption := '...';
  for i := 0 to ComponentCount - 1 do
  begin
    if Copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).clear
      else if Components[i] is TsComboEdit then
        TsComboEdit(Components[i]).clear
      else if Components[i] is TRichEdit then
        TRichEdit(Components[i]).clear
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(Components[i]).clear
      else if Components[i] is TsDateEdit then
        TsDateEdit(Components[i]).clear
      else if Components[i] is TComboBox then
        TComboBox(Components[i]).ItemIndex := 0
      else if Components[i] is TMaskEdit then
        TMaskEdit(Components[i]).clear;

      if prefixo = 'Gd' then
      begin
        LbCor.Caption := '...';
        Lbtamanho.Caption := '...';
      end;

      if prefixo = 'Pr' then
      begin
        Lbcolecao.Caption := '...';
        LbNom_Grupo.Caption := '...';
        LbNom_fornecedor_principal.Caption := '...';
        Lbnom_plano_contas_N1.Caption := '';
        Lbnom_plano_contas_N2.Caption := '';
        Lbnom_plano_contas_N3.Caption := '';
        Lbnom_plano_contas_N4.Caption := '';
      end;

      if prefixo = 'Pf' then
        LbNom_fornecedor.Caption := '...';

    end;
  end;

end;

procedure TFr_produtos.mostra_campos(prefixo: ShortString);
var
  i: Integer;
  campo, campo1: string;
begin
  Pc_produto.TabIndex := 0;
  Screen.Cursor := crSQLWait;
  for i := 0 to ComponentCount - 1 do
  begin
    if Copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
      begin
        campo := TsEdit(Components[i]).Name;
        campo1 := Copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
        TsEdit(FindComponent(campo)).Text := q_produtos.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TsComboEdit then
      begin
        campo := TsComboEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := Copy(campo, 3, 50);
        TsComboEdit(FindComponent(campo)).Text := q_produtos.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TsCurrencyEdit then
      begin
        campo := TsCurrencyEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := Copy(campo, 3, 50);
        TsCurrencyEdit(FindComponent(campo)).Value := q_produtos.fieldbyname(campo1).AsFloat;
      end
      else if Components[i] is TComboBox then
      begin
        campo := TComboBox(Components[i]).Name;
        campo1 := campo;
        campo1 := Copy(campo, 3, 50);
        if dao.IsNumeric(q_produtos.fieldbyname(campo1).AsString) then
          TComboBox(FindComponent(campo)).ItemIndex := q_produtos.fieldbyname(campo1).AsInteger
        else
        begin
          try
            TComboBox(FindComponent(campo)).ItemIndex := q_produtos.fieldbyname(campo1).AsInteger
          except
            TComboBox(FindComponent(campo)).Text := q_produtos.fieldbyname(campo1).AsString;
          end;
        end;

      end
      else if Components[i] is TsRadioGroup then
      begin
        campo := TsRadioGroup(Components[i]).Name;
        campo1 := campo;
        campo1 := Copy(campo, 3, 50);
        TsRadioGroup(FindComponent(campo)).ItemIndex := q_produtos.fieldbyname(campo1).AsInteger;
      end
      else if Components[i] is tscheckbox then
      begin
        campo := tscheckbox(Components[i]).Name;
        campo1 := campo;
        campo1 := Copy(campo, 3, 50);
        if q_produtos.fieldbyname(campo1).AsString = 'S' then
          tscheckbox(FindComponent(campo)).Checked := true
        else
          tscheckbox(FindComponent(campo)).Checked := false;
      end

      else if Components[i] is TsDateEdit then
      begin
        campo := TsDateEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := Copy(campo, 3, 50);

        TsDateEdit(FindComponent(campo)).Date := q_produtos.fieldbyname(campo1).AsDateTime;
      end
      else if Components[i] is TMaskEdit then
      begin
        campo := TMaskEdit(Components[i]).Name;
        campo1 := Copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
        TMaskEdit(FindComponent(campo)).Text := q_produtos.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TRichEdit then
      begin
        campo := TRichEdit(Components[i]).Name;
        campo1 := Copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
        TRichEdit(FindComponent(campo)).Text := q_produtos.fieldbyname(campo1).AsString;
      end;

    end;

  end; // end do for

  if prefixo = 'Pr' then
  begin
    LbNom_Grupo.Caption := q_produtos.fieldbyname('nom_grupo').AsString;
    LbNom_fornecedor_principal.Caption := q_produtos.fieldbyname('razao_social').AsString;
    Lbcolecao.Caption := q_produtos.fieldbyname('nom_colecao').AsString;
    Lbestoque.Caption := q_produtos.fieldbyname('descricao').AsString;
    Lbmarca.Caption := q_produtos.fieldbyname('nom_marca').AsString;
    // BtnPesqGradeclick(self);
    if trim(Prsubcategoria.text) <> ''  then
      PrsubcategoriaExit(self);
    custo_anterior := q_produtos.fieldbyname('custo').AsFloat;
    impostos_anterior := q_produtos.fieldbyname('impostos').AsFloat;
    ipi_anterior := q_produtos.fieldbyname('ipi').AsFloat;
    geral_anterior := q_produtos.fieldbyname('geral').AsFloat;
    custo_total_anterior := q_produtos.fieldbyname('custo_total').AsFloat;
    lucro_anterior := q_produtos.fieldbyname('lucro').AsFloat;
    preco_venda_anterior := q_produtos.fieldbyname('preco_venda').AsFloat;
    materia_prima := q_produtos.fieldbyname('materia_prima').AsString = '1';
    edPeso.Value := PrPeso.Value;

    gbCustoEntrada.Enabled := materia_prima;
  end;

  carrega_cod_barras(q_produtos.fieldbyname('cod_produto').AsString);
  carrega_produto_fornecedor(q_produtos.fieldbyname('cod_produto').AsString);
  carrega_grade(q_produtos.fieldbyname('cod_produto').AsString);
  CarregaMov(q_produtos.fieldbyname('cod_produto').AsString);
  BuscaHist(q_produtos.fieldbyname('cod_produto').AsString, now - 30, now);
  BuscaDescEspecial;
  Screen.Cursor := crDefault;
  dao.q_nav.open;
  dao.q_nav.Locate('cod_produto', q_produtos.fieldbyname('cod_produto').AsInteger, [loCaseInsensitive]);
end;

procedure TFr_produtos.BuscaHist(produto: string; dataini, datafim: TDate);
begin
  if produto = '' then
    Exit;
  dao.Geral1
    ('SELECT a.ID, A.CODUSU, U.NOME, a.COD_PRODUTO, a.DATA_HORA, a.CUSTO, a.IMPOSTOS, a.IPI, a.OUTROS, a.CUSTO_TOTAL, a.LUCRO, a.PRECO_VENDA FROM PRODUTO_LOG_PRECO a INNER JOIN TBUSU U ON U.CODUSU = A.CODUSU WHERE 1 = 1 '
    + ' AND A.COD_PRODUTO = ' + produto + ' AND A.DATA_HORA BETWEEN ' + QuotedStr(FORMATDATETIME('dd/mm/yyyy 00:00:00', dataini)) + ' and ' + QuotedStr(FORMATDATETIME('dd/mm/yyyy 23:59:59', datafim))
    + ' ORDER BY a.DATA_HORA DESC ');

  dao.Q1.First;
  mmHistPrec.Close;
  mmHistPrec.EmptyTable;
  mmHistPrec.open;
  while not dao.Q1.Eof do
  begin
    mmHistPrec.Append;
    mmHistPrecUSUARIO.AsString := dao.Q1.fieldbyname('NOME').AsString;
    mmHistPrecDATAHORA.AsDateTime := dao.Q1.fieldbyname('DATA_HORA').AsDateTime;
    mmHistPrecCUSTO.AsString := dao.Q1.fieldbyname('CUSTO').AsString;
    mmHistPrecIMPOSTOS.AsString := dao.Q1.fieldbyname('IMPOSTOS').AsString;
    mmHistPrecIPI.AsString := dao.Q1.fieldbyname('IPI').AsString;
    mmHistPrecOUTROS.AsString := dao.Q1.fieldbyname('OUTROS').AsString;
    mmHistPrecCUSTO_TOTAL.AsString := dao.Q1.fieldbyname('CUSTO_TOTAL').AsString;
    mmHistPrecLUCRO.AsString := dao.Q1.fieldbyname('LUCRO').AsString;
    mmHistPrecPRECO_VENDA.AsString := dao.Q1.fieldbyname('PRECO_VENDA').AsString;
    mmHistPrec.Post;
    dao.Q1.Next;
  end;
  mmHistPrec.First;
end;

procedure TFr_produtos.BuscaMov(produto: string; dataini, datafim: TDate);
begin
  q_mov_ent.Close;
  q_mov_ent.ParamByName('produto').value := produto;
  q_mov_ent.ParamByName('dtini').AsDateTime := dataini;
  q_mov_ent.ParamByName('dtfim').AsDateTime := datafim;
  q_mov_ent.open;

  q_mov_res.Close;
  q_mov_res.ParamByName('produto').value := produto;
  q_mov_res.ParamByName('dtini').AsDateTime := dataini;
  q_mov_res.ParamByName('dtfim').AsDateTime := datafim;
  q_mov_res.open;

  q_mov_fat.Close;
  q_mov_fat.ParamByName('produto').value := produto;
  q_mov_fat.ParamByName('dtini').AsDateTime := dataini;
  q_mov_fat.ParamByName('dtfim').AsDateTime := datafim;
  q_mov_fat.open;

  q_mov_acerto.Close;
  q_mov_acerto.ParamByName('produto').value := produto;
  q_mov_acerto.ParamByName('dtini').AsDateTime := dataini;
  q_mov_acerto.ParamByName('dtfim').AsDateTime := datafim;
  q_mov_acerto.open;

end;

procedure TFr_produtos.CarregaMov(produto: string);
begin
  dtMovIni.Date := now - 15;
  dtMovFim.Date := now;

  BuscaMov(produto, dtMovIni.Date, dtMovFim.Date);
end;

procedure TFr_produtos.readonly_false(prefixo: ShortString);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).ReadOnly := false
      else if Components[i] is tscheckbox then
        tscheckbox(Components[i]).Enabled := true
      else if Components[i] is TsDateEdit then
        TsDateEdit(Components[i]).ReadOnly := false
      else if Components[i] is TsComboEdit then
        TsComboEdit(Components[i]).ReadOnly := false
      else if Components[i] is TRichEdit then
        TRichEdit(Components[i]).ReadOnly := false
      else if Components[i] is TsDateEdit then
        TsDateEdit(Components[i]).ReadOnly := false
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(Components[i]).ReadOnly := false
      else if Components[i] is TMaskEdit then
        TMaskEdit(Components[i]).ReadOnly := true;

    end;
  end;
  if prefixo = 'Pr' then
  begin
    BtAdiG.Enabled := true;
    BtExcG.Enabled := true;
    btAdib.Enabled := true;
    btexcb.Enabled := true;
    Cbcod_barras.ReadOnly := false;
  end;

end;

procedure TFr_produtos.readonly_true(prefixo: ShortString);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).ReadOnly := true
      else if Components[i] is tscheckbox then
        tscheckbox(Components[i]).Enabled := false
      else if Components[i] is TsComboEdit then
        TsComboEdit(Components[i]).ReadOnly := true
      else if Components[i] is TRichEdit then
        TRichEdit(Components[i]).ReadOnly := true
      else if Components[i] is TsDateEdit then
        TsDateEdit(Components[i]).ReadOnly := true
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(Components[i]).ReadOnly := true
      else if Components[i] is TMaskEdit then
        TMaskEdit(Components[i]).ReadOnly := true;

    end;
  end;
  if prefixo = 'Pr' then
  begin
    btAdib.Enabled := false;
    btexcb.Enabled := false;
    Cbcod_barras.ReadOnly := true;
    BtAdiG.Enabled := false;
    BtExcG.Enabled := false;
    Prcod_produto.ReadOnly := false;
  end;
end;

procedure TFr_produtos.Prcod_grupoButtonClick(Sender: TObject);
var
  q_campos_proponente: TFDQuery;
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

  Fr_localizar.Caption := 'Localizar Grupo';

  chamou_pesquisa := 'fr_grupo';
  chamou_form := 'fr_produto_grupo';
  chamou_cadastro := 'fr_grupo';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Grupos';

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'UF';

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

procedure TFr_produtos.Pfcod_fornecedorButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Fornecedor';
  chamou_pesquisa := 'fr_fornecedor';
  chamou_form := 'fr_produto_fornecedor';
  chamou_cadastro := 'Fr_fornecedor';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Fornecedores';
  Fr_localizar.BT_cadastro.Visible := false;

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

procedure TFr_produtos.ativa_produto_fornecedor(id: string);
begin
  with q_produto_fornecedor do
  begin
    Close;
    SQL.clear;
    SQL.Add('select a.ID, a.COD_PRODUTO, a.COD_FORNECEDOR, a.COD_PRODUTO_FORNECEDOR, ' + 'f.razao_social from produto_fornecedor a ' + 'left join fornecedor f on f.cod_fornecedor=a.cod_fornecedor ' +
      'where a.id = ' + QuotedStr(id));

    open;
  end;

  q_produto_fornecedor.fieldbyname('id').Visible := false;
  q_produto_fornecedor.fieldbyname('cod_produto').Visible := false;
  q_produto_fornecedor.fieldbyname('cod_fornecedor').Visible := false;

end;

procedure TFr_produtos.carrega_produto_fornecedor(id: string);
begin
  with q_produto_fornecedor do
  begin
    Close;
    SQL.clear;
    SQL.Add('select pf.id, pf.cod_produto, pf.cod_fornecedor, pf.cod_produto_fornecedor, f.razao_social from produto_fornecedor pf ' + 'left join fornecedor f on pf.cod_fornecedor=f.cod_fornecedor ' +
      'where cod_produto = ' + QuotedStr(id));

    open;
    q_produto_fornecedor.fieldbyname('id').Visible := false;
    q_produto_fornecedor.fieldbyname('cod_produto').Visible := false;
    q_produto_fornecedor.fieldbyname('cod_fornecedor').Visible := false;

    q_produto_fornecedor.fieldbyname('cod_produto_fornecedor').DisplayWidth := 100;
    q_produto_fornecedor.fieldbyname('razao_social').DisplayWidth := 700;
  end;

end;

{
  function TFr_produtos.calcula_custo_total: Real;
  var
  imposto, geral, outros: real;
  begin
  imposto := (PrCusto.Value * (PrImpostos.Value / 100)) + (PrCusto.value * (PrIPI.Value / 100));
  geral   := (PrCusto.Value + imposto) * (Prgeral.Value / 100);
  Result  := PrCusto.Value  + imposto + geral;
  end;

  function TFr_produtos.calcula_preco_venda: Real;
  var
  lucro: real;
  begin
  PrCusto_Total.Value := calcula_custo_total;
  lucro  := (PrCusto_Total.Value) * (Prlucro.Value / 100);
  Result := PrCusto_Total.Value + lucro;
  end;
}

procedure TFr_produtos.CalculoPreco;
begin

  if PrCUSTO_MATERIA_PRIMA.Value > 0 then
  begin
    edPeso.Value := PrPeso.Value;
    edSubTotal.Value := (edPeso.Value * PrCUSTO_MATERIA_PRIMA.Value);
    PrCusto.Value := (edPeso.Value * PrCUSTO_MATERIA_PRIMA.Value) + PrCUSTO_MAO_DE_OBRA.Value;
  end;

  PrCustoSubtotal.Value := FMFUN.calcula_custo_entrada(PrCusto.Value, PrEntICMS.Value, PrEntIPI.Value, PrEntFrete.Value, PrEntST.Value);
  PrCusto_Total.Value := FMFUN.calcula_custo_total(PrCustoSubtotal.Value, PrImpostos.Value, Pripi.Value, Prgeral.Value, 0);
  Prpreco_venda.Value := FMFUN.calcula_preco_venda(PrCusto_Total.Value, PrLucro.Value);
end;

procedure TFr_produtos.PrCustoChange(Sender: TObject);
begin
  CalculoPreco;
end;

procedure TFr_produtos.InsLinha;
begin
end;

procedure TFr_produtos.grava_cod_barras(cod_barras, id: string);
begin
end;

procedure TFr_produtos.carrega_cod_barras(cod_produto: string);
begin
  with Q_cod_barras do
  begin
    Active := false;
    Close;
    SQL.clear;
    SQL.Add('select * from cod_barras where cod_produto=' + QuotedStr(Prcod_produto.Text));
    open;
  end;
  Q_cod_barras.fieldbyname('cod_produto').Visible := false;
  Q_cod_barras.fieldbyname('id').Visible := false;
  Q_cod_barras.fieldbyname('cod_barras').DisplayLabel := 'Código de Barras';

end;

procedure TFr_produtos.btAdibClick(Sender: TObject);
begin
  try
    if Prcod_produto.Text = '' then
    begin
      dao.msg('Você deve Primeiro gravar o Produto' + '               ou' + 'selecionar um produto no botão Localizar!');
      Exit;
    end;
    Cbcod_produto.Text := Prcod_produto.Text;
    if Cbcod_barras.Text <> '' then
    begin
      btAdib.Enabled := false;
      dao.insert('Cb', 'cod_barras', 'id', Fr_produtos, 'gen_cod_barras');
      carrega_cod_barras(q_produtos.fieldbyname('cod_produto').AsString);
    end;
    btAdib.Enabled := true;
    Cbcod_barras.clear;
    Cbcod_barras.SetFocus;
  except
    on e: Exception do
    begin
      btAdib.Enabled := true;
      dao.msg('Houve um erro ao Gravar o Código de Barras!' + #13 + e.message);
    end;
  end;

end;

procedure TFr_produtos.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if BtGra.Enabled = true then
  begin
    MessageBox(handle, 'Você deve Gravar ou Cancelar as Informações Antes de Sair!', 'ORBI', MB_ICONWARNING);
    CanClose := false;
  end
  else
  begin
    CanClose := true;
  end;

end;

procedure TFr_produtos.btexcbClick(Sender: TObject);
begin
  if Q_cod_barras.RecordCount <= 0 then
  begin
    dao.msg('Você deve escolher um Código de Barras para Excluir');
    Exit;
  end;
  if MessageDlg('Tem Certeza que Deseja Excluir Este Código de Barras?', mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    dao.delete('id', Q_cod_barras.fieldbyname('id').AsString, 'cod_barras');
    dao.msg('Código de Barras Excluido com Sucesso!');
  end;
  carrega_cod_barras(Prcod_produto.Text);
end;

procedure TFr_produtos.Cbcod_barrasKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    btAdib.Click;
  end;
end;

procedure TFr_produtos.Prcod_prateleiraKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Prid_marca.SetFocus;
    Key := #0;
  end;
end;

procedure TFr_produtos.Prcod_produtoExit(Sender: TObject);
begin
  if BtGra.Enabled then
    Exit;
  if not modo_insert then
  begin
    ativa_produto(Prcod_produto.Text, false);
    mostra_campos('Pr');

    CarregarDados;
  end;
end;

procedure TFr_produtos.monta_sggrade;
begin
  SgGrade.ColWidths[0] := 0;
  SgGrade.Cells[0, 0] := 'id';
  SgGrade.Cells[1, 0] := 'Cor';
  SgGrade.Cells[2, 0] := 'Numeração';
  SgGrade.Cells[3, 0] := 'Tamanho';
  SgGrade.Cells[4, 0] := 'Estoque Individual';

  { dao.Geral1('select tamanho from tamanho order by tamanho desc');
    while not(dao.Q1.Eof) do
    begin
    Gdtamanho.Items.Add(dao.q1.fieldbyname('tamanho').AsString);
    dao.Q1.next;
    end; }

end;

procedure TFr_produtos.Gdid_CorButtonClick(Sender: TObject);
var
  q_campos_proponente: TFDQuery;
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

  Fr_localizar.Caption := 'Localizar Grupo';

  chamou_pesquisa := 'fr_cor';
  chamou_form := 'fr_produto_cor';
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

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_produtos.ad_atributo_grade;
begin
  // dao.Execsql('update from grade set cod_produto ='+QuotedStr(Prcod_produto.Text)+', cor='+QuotedStr(ZZcor.Text));

end;

procedure TFr_produtos.insere_reg_sgGrade(tipo: string);
begin
  { if SgGrade.cells[0,linMax]<> '' then
    begin
    linmax:=linMax+1;
    SgGrade.AddRow;
    end;
    SgGrade.EditorMode:=true;
    sggrade.Cells[0,linMax]:= id;
    sggrade.Cells[1,linMax]:= GdCor.Text;
    sggrade.Cells[2,linMax]:= LbCor.Caption;
    sggrade.Cells[3,linMax]:= Gdnumeracao.Text;
    sggrade.Cells[4,linMax]:= Gdtamanho.Text;

    SgPro.EditorMode:=false;
    SgPro.Row:=linMax;
    SgPro.RowSelect[linmax];
    end
    else
    if tipo='2' then
    begin
    {    if SgPro.cells[0,linMax]<> '' then
    begin
    linmax:=linMax+1;
    SgPro.AddRow;
    end; }
  { SgPro.EditorMode:=true;
    SgPro.Cells[0,lin]:= id;
    SgPro.Cells[1,lin]:= Emcod_produto.Text;
    SgPro.Cells[2,lin]:= Lbnom_produto.Caption;
    SgPro.Cells[3,lin]:= Emqtd_entrada.Text;
    SgPro.Cells[4,lin]:= FormatFloat('###,##0.00', Emcusto.Value);
    SgPro.Cells[5,linMax]:= EmIcms.Text;
    SgPro.Cells[6,lin]:= FormatFloat('###,##0.00', Emsub_total.Value);
    SgPro.Cells[7,lin]:= FormatFloat('###,##0.00', EmCusto_final.Value);

    SgPro.EditorMode:=false;
    SgPro.Row:=lin;
    SgPro.RowSelect[lin];

    end; }

end;

procedure TFr_produtos.BtAdiGClick(Sender: TObject);
begin
  if modo_insert = true then
  begin
    dao.msg('grave o Produto Primeiro ' + #13 + ' Logo Apos clique em alterar ' + #13 + 'E Depois Lançe os Atributos!');
    Exit;
  end;
  if Prcod_produto.Text <> '' then
  begin
    Gdcod_produto.Text := Prcod_produto.Text;
    dao.insert('Gd', 'grade', 'id', Fr_produtos, 'gen_grade');
    carrega_grade(Prcod_produto.Text);
    limpa_campos('Gd');
    Gdid_Cor.SetFocus;
  end;
end;

procedure TFr_produtos.carrega_grade(cod_produto: string);
begin
  with q_grade do
  begin
    Close;
    SQL.clear;
    SQL.Add('select g.id, g.cod_produto, cr.cor, g.numeracao, t.tamanho, g.est_individual from grade g ' + 'left join cores cr on cr.id = g.id_cor ' + 'left join tamanho t on t.id = g.id_tamanho ' +
      'where g.cod_produto=' + QuotedStr(Prcod_produto.Text) + ' order by cr.cor');
    open;
  end;
  q_grade.fieldbyname('id').Visible := false;
  q_grade.fieldbyname('cod_produto').Visible := false;
  q_grade.fieldbyname('numeracao').Visible := false;

  q_grade.fieldbyname('cor').DisplayLabel := 'Cor';
  q_grade.fieldbyname('Tamanho').DisplayLabel := 'Tamanho';
  // q_grade.FieldByName('numeracao').DisplayLabel:= 'Numeração';
  q_grade.fieldbyname('est_individual').DisplayLabel := 'Estoque Individual';

end;

procedure TFr_produtos.Gdid_tamanhoButtonClick(Sender: TObject);
var
  q_campos_proponente: TFDQuery;
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

  Fr_localizar.Caption := 'Localizar Grupo';

  chamou_pesquisa := 'fr_tamanho';
  chamou_form := 'fr_produto_tamanho';
  chamou_cadastro := 'fr_tamanho';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Tamanhos';
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

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_produtos.Gdid_tamanhoKeyPress(Sender: TObject; var Key: Char);
var
  q_campos_proponente: TFDQuery;
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;

  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  if Key = #13 then
  begin
    if (Gdid_tamanho.Text = '') and (BtNov.Enabled = false) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);
      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Tamanho';

      chamou_pesquisa := 'fr_tamanho';
      chamou_form := 'fr_produto_tamanho';
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

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;
    end;

    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;

end;

procedure TFr_produtos.BtExcGClick(Sender: TObject);
begin
  if q_grade.RecordCount <= 0 then
  begin
    dao.msg('Você deve escolher um Atributo da Grade para Excluir');
    Exit;
  end;
  if MessageDlg('Tem Certeza que Deseja Excluir Este Atributo da Grade?', mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    dao.delete('id', q_grade.fieldbyname('id').AsString, 'grade');
    dao.msg('Atributo Excluido com Sucesso!');
  end;
  carrega_grade(Prcod_produto.Text);

end;

procedure TFr_produtos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    Close;
  if Key = #13 then
  begin
    if ActiveControl.Name = 'PrObservacao' then
      Exit;
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TFr_produtos.bt_Sel_fotoClick(Sender: TObject);
begin
  ODfoto.Execute;
  if FMFUN.TamArquivo(ODfoto.FileName) > 262144 then
  begin
    dao.msg('A FOTO NÃO PODE SER MAIOR QUE 256MB');
    Exit;
  end;

  // if ODfoto.FileName <> '' then
  // Foto.Picture.LoadFromFile(ODfoto.FileName);
  // TFileStream.Create(ODfoto.FileName, fmOpenRead or fmShareExclusive).Free;

end;

procedure TFr_produtos.BtIns_fotClick(Sender: TObject);
begin
  BtIns_fot.Enabled := false;
  BtAlt_fot.Enabled := false;
  BtGra_fot.Enabled := true;
  BtCan_fot.Enabled := true;
  BtExc_fot.Enabled := false;
  BtAnt.Enabled := false;
  BtPro.Enabled := false;
  zzDescricao.Enabled := true;
  acao_foto := 'insert';

  // limpar campos
  zzDescricao.clear;
  // Foto.Picture := nil;

end;

procedure TFr_produtos.Gdid_CorKeyPress(Sender: TObject; var Key: Char);
var
  q_campos_proponente: TFDQuery;
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;

  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  if Key = #13 then
  begin
    if (Gdid_Cor.Text = '') and (BtNov.Enabled = false) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);
      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Grupo';

      chamou_pesquisa := 'fr_cor';
      chamou_form := 'fr_produto_cor';
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

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;
    end;

    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;

end;

procedure TFr_produtos.Prcod_grupoKeyPress(Sender: TObject; var Key: Char);
var
  q_campos_proponente: TFDQuery;
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  chamou_form_old, chamou_pesquisa_old: string;

begin
  if Key = #13 then
  begin
    if (Prcod_grupo.Text = '') and (BtNov.Enabled = false) then
    begin
      // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa

      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Grupo';

      chamou_pesquisa := 'fr_grupo';
      chamou_form := 'fr_produto_grupo';
      chamou_cadastro := 'fr_grupo';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Grupos';

      // preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo, 3);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Nome';
      Campos_combo[2] := 'UF';

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
    Prunidade.SetFocus;
    Key := #0;
  end;
end;

procedure TFr_produtos.PrCestExit(Sender: TObject);
begin

  if Trim(PrCest.Text) = '' then
    Exit;

  if Trim(PrNCM.Text) = '' then
  begin
    dao.msg('O código NCM deve ser preenchido!');
    PrNCM.SetFocus;
    Exit;
  end;

  TratarNCM;
end;

procedure TFr_produtos.Prcod_colecaoButtonClick(Sender: TObject);
var
  q_campos_proponente: TFDQuery;
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

  Fr_localizar.Caption := 'Localizar Coleção';

  chamou_pesquisa := 'fr_colecao';
  chamou_form := 'fr_produto_colecao';
  chamou_cadastro := 'fr_colecao';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Colecao';

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
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

procedure TFr_produtos.Prcod_colecaoKeyPress(Sender: TObject; var Key: Char);
var
  q_campos_proponente: TFDQuery;
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;

  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  if Key = #13 then
  begin
    if (Prcod_colecao.Text = '') and (BtNov.Enabled = false) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Coleção';

      chamou_pesquisa := 'fr_colecao';
      chamou_form := 'fr_produto_colecao';
      chamou_cadastro := 'fr_colecao';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Colecao';

      // preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo, 3);
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
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;

  end;
end;

procedure TFr_produtos.BtAlt_fotClick(Sender: TObject);
begin
  BtIns_fot.Enabled := false;
  BtAlt_fot.Enabled := false;
  BtGra_fot.Enabled := true;
  BtCan_fot.Enabled := true;
  BtExc_fot.Enabled := false;
  BtAnt.Enabled := false;
  BtPro.Enabled := false;
  zzDescricao.Enabled := true;

  acao_foto := 'update';

end;

procedure TFr_produtos.BtGra_fotClick(Sender: TObject);
var
  comando_sql: string;
begin
  Screen.Cursor := crSQLWait;
  BtIns_fot.Enabled := true;
  BtAlt_fot.Enabled := true;
  BtGra_fot.Enabled := false;
  BtCan_fot.Enabled := false;
  BtExc_fot.Enabled := true;
  BtAnt.Enabled := true;
  BtPro.Enabled := true;
  zzDescricao.Enabled := false;

  if acao_foto = 'insert' then
  begin
    with q_fotos do
    begin
      Close;
      SQL.clear;
      SQL.Add('insert into produto_foto (cod_produto,foto,descricao,nome_foto) values (:cod_produto, :foto, :descricao, :nome_foto)');
      ParamByName('cod_produto').AsString := Prcod_produto.Text;
      ParamByName('foto').LoadFromFile(ODfoto.FileName, ftBlob);
    end;

    mostra_fotos_pr(Prcod_produto.Text);
    q_fotos.Locate('id', q_produtos.fieldbyname('cod_produto').AsString, []);

    // recuperar o diretorio do windows
    GetTempPath(SizeOf(PathBuf), PathBuf);

    TemPath := ExtractFilePath(Application.ExeName) + 'temporario\';

    if not DirectoryExists(TemPath) then
      if not ForceDirectories(TemPath) then
      begin
        MessageDlg('Não foi possivel criar o espaço temporário', mtError, [mbOK], 0);
        SysUtils.Abort;
      end;

    // grava o arquivo na pasta temporaria;
    TemPath := TemPath + q_fotos.fieldbyname('nome_foto').AsString;
    TblobField(q_fotos.fieldbyname('Foto')).SaveToFile(TemPath);
    zzDescricao.Text := q_fotos.fieldbyname('descricao').AsString;
    // foto.Picture.LoadFromFile(TemPath);

  end

  else if acao_foto = 'update' then
  begin
    comando_sql := 'update produto_foto set descricao =:descricao';

    if (ODfoto.FileName <> '') then
      comando_sql := comando_sql + ' ,foto =:foto ';

    if (ODfoto.FileName <> '') then
      comando_sql := comando_sql + ' ,nome_foto =:nome_foto ';

    comando_sql := comando_sql + ' where id=:id';

    with q_fotos do
    begin
      Close;
      SQL.clear;
      SQL.Add(comando_sql);
      ParamByName('id').AsString := cod_foto;

      if (ODfoto.FileName <> '') then
        ParamByName('foto').LoadFromFile(ODfoto.FileName, ftBlob);

      ParamByName('descricao').AsString := zzDescricao.Text;

      if (ODfoto.FileName <> '') then
        ParamByName('nome_foto').AsString := ExtractFileName(ODfoto.FileName);

      if not(q_fotos.Prepared) then
        q_fotos.Prepare;
      Execsql;
    end;
    mostra_fotos_pr(Prcod_produto.Text);
    q_fotos.Locate('id', q_fotos.fieldbyname('id').AsString, []);

    // recuperar o diretorio do windows
    GetTempPath(SizeOf(PathBuf), PathBuf);

    TemPath := ExtractFilePath(Application.ExeName) + 'temporario\';

    if not DirectoryExists(TemPath) then
      if not ForceDirectories(TemPath) then
      begin
        MessageDlg('Não foi possivel criar o espaço temporário', mtError, [mbOK], 0);
        SysUtils.Abort;
      end;

    // grava o arquivo na pasta temporaria;
    TemPath := TemPath + q_fotos.fieldbyname('nome_foto').AsString;
    TBlobField(q_fotos.fieldbyname('Foto')).SaveToFile(TemPath);
    zzDescricao.Text := q_fotos.fieldbyname('descricao').AsString;
    // foto.Picture.LoadFromFile(TemPath);
  end;
  Screen.Cursor := crDefault;

end;

procedure TFr_produtos.mostra_fotos_pr(codigo: string);
begin
  Screen.Cursor := crSQLWait;

  with q_fotos do
  begin
    Close;
    SQL.clear;
    SQL.Add('select * from produto_foto where cod_produto = ' + QuotedStr(codigo));
    open;
  end;
  Screen.Cursor := crDefault;

  if q_fotos.RecordCount <= 0 then
    Exit;
  q_fotos.First;

  // recuperar o diretorio do windows
  GetTempPath(SizeOf(PathBuf), PathBuf);

  TemPath := StrPas('c:\Orbi\temporario');

  if not DirectoryExists(TemPath) then
    if not ForceDirectories(TemPath) then
    begin
      MessageDlg('Não foi possivel criar o espaço temporário', mtError, [mbOK], 0);
      SysUtils.Abort;
    end;

  // grava o arquivo na pasta temporaria;
  TemPath := TemPath + '\' + q_fotos.fieldbyname('nome_foto').AsString;
  // DMprocesso.fotos.FieldByName('foto').SaveToFile(TemPath);
  TBlobField(q_fotos.fieldbyname('FOTO')).SaveToFile(TemPath);
  zzDescricao.Text := q_fotos.fieldbyname('descricao').AsString;
  // foto.Picture.LoadFromFile(TemPath);
  cod_foto := q_fotos.fieldbyname('id').AsString;

end;

procedure TFr_produtos.BtCan_fotClick(Sender: TObject);
var
  numrec: string;
begin
  BtIns_fot.Enabled := true;
  BtAlt_fot.Enabled := true;
  BtGra_fot.Enabled := false;
  BtCan_fot.Enabled := false;
  BtExc_fot.Enabled := true;
  BtAnt.Enabled := true;
  BtPro.Enabled := true;
  zzDescricao.Enabled := false;

  numrec := IntToStr(q_fotos.RecNo);
  if acao_foto = 'insert' then
    mostra_fotos_pr(Prcod_produto.Text)
  else if acao_foto = 'update' then
    mostra_fotos_pr(Prcod_produto.Text);

  // foto.Picture.LoadFromFile(TemPath);

end;

procedure TFr_produtos.BtExc_fotClick(Sender: TObject);
begin
  if MessageDlg('Deseja Deletar Está Foto', mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    dao.Execsql('delete from produto_foto where id= ' + QuotedStr(q_fotos.fieldbyname('id').AsString));
    dao.msg('Foto Excluida com Sucesso!');
    mostra_fotos_pr(Prcod_produto.Text);

  end;

end;

procedure TFr_produtos.BtProClick(Sender: TObject);
begin
  if Prcod_produto.Text = '' then
  begin
    dao.msg('Localize um Produto Pimeiro!');
    Exit;
  end;

  BtAnt.Enabled := true;
  q_fotos.Next;

  if q_fotos.Eof then
  begin
    BtPro.Enabled := false;
    Exit;
  end;

  cod_foto := q_fotos.fieldbyname('id').AsString;

  // recuperar o diretorio do windows
  GetTempPath(SizeOf(PathBuf), PathBuf);
  TemPath := '';
  TemPath := StrPas('c:\Orbi\temporario');

  if not DirectoryExists(TemPath) then
    if not ForceDirectories(TemPath) then
    begin
      MessageDlg('Não foi possivel criar o espaço temporário', mtError, [mbOK], 0);
      SysUtils.Abort;
    end;

  // grava o arquivo na pasta temporaria;
  TemPath := TemPath + '\' + q_fotos.fieldbyname('nome_foto').AsString;
  if not FileExists(TemPath) then
    TBlobField(q_fotos.fieldbyname('Foto')).SaveToFile(TemPath);

  zzDescricao.Text := q_fotos.fieldbyname('descricao').AsString;
  // foto.Picture.LoadFromFile(TemPath);

end;

procedure TFr_produtos.BtRelatMovClick(Sender: TObject);
var
  cmd, path: string;
begin
  path := ExtractFilePath(Application.ExeName);

  if not(fR_RELATORIO.LoadFromFile(path +
    'Relatorios\posicao_estoque_detalhado2.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 +
      'Avise o Suporte');
    exit;
  end;

  cmd := 'SELECT a.COD_PRODUTO, a.NOM_PRODUTO, a.CONT_ESTOQUE_AGO_2010, a.QTD_ESTOQUE, a.qtd_reservado, a.CODIGO_CLIENTE_FORNECEDOR, a.NOME_CLIENTE_FORNECEDOR, a.NUMDOC, a.DATA, a.NOTA_FISCAL, a.QTD, a.CONT, a.TIPO '
    + 'FROM V_CHECAGEM_ESTOQUE a inner join produto p on p.cod_produto = a.cod_produto WHERE 1 = 1 ';

  cmd := cmd + fmfun.cmdAux('A.cod_produto', prcod_produto.text);


  if (dtmovini.date > 0) and (dtmovfim.date > 0) then
    cmd := cmd + ' and a.DATA between ' +
      quotedstr(formatdatetime('dd.mm.yyyy', dtmovini.date)) + ' and ' +
      quotedstr(formatdatetime('dd.mm.yyyy', dtmovfim.date));


  cmd := cmd + ' order by A.COD_PRODUTO, a.data, a.tipo, a.numdoc';

  with dm.q_entrada_saidas_produtos do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_produtos.BtAntClick(Sender: TObject);
begin
  if Prcod_produto.Text = '' then
  begin
    dao.msg('Localize um Produto Pimeiro!');
    Exit;
  end;

  q_fotos.Prior;

  BtPro.Enabled := true;

  if q_fotos.Bof then
  begin
    BtAnt.Enabled := false;
    Exit;
  end;

  cod_foto := q_fotos.fieldbyname('id').AsString;
  // recuperar o diretorio do windows
  GetTempPath(SizeOf(PathBuf), PathBuf);
  TemPath := '';
  TemPath := StrPas('c:\Orbi\temporario');

  if not DirectoryExists(TemPath) then
    if not ForceDirectories(TemPath) then
    begin
      MessageDlg('Não foi possivel criar o espaço temporário', mtError, [mbOK], 0);
      SysUtils.Abort;
    end;

  // grava o arquivo na pasta temporaria;
  TemPath := TemPath + '\' + q_fotos.fieldbyname('nome_foto').AsString;

  if not FileExists(TemPath) then
    TBlobField(q_fotos.fieldbyname('FOTO')).SaveToFile(TemPath);

  zzDescricao.Text := q_fotos.fieldbyname('descricao').AsString;
  // foto.Picture.LoadFromFile(TemPath);

end;

procedure TFr_produtos.habilita_bt_foto(habilitar: Boolean);
begin
  if habilitar then
  begin
    BtIns_fot.Enabled := true;
    bt_Sel_foto.Enabled := true;
    BtAlt_fot.Enabled := true;
    BtGra_fot.Enabled := true;
    BtCan_fot.Enabled := true;
    BtExc_fot.Enabled := true;

  end
  else
  begin
    BtIns_fot.Enabled := false;
    bt_Sel_foto.Enabled := false;
    BtAlt_fot.Enabled := false;
    BtGra_fot.Enabled := false;
    BtCan_fot.Enabled := false;
    BtExc_fot.Enabled := false;
  end;
end;

procedure TFr_produtos.FotoDblClick(Sender: TObject);
begin
  Application.CreateForm(TFr_amplia_foto, Fr_amplia_foto);
  Fr_amplia_foto.foto2.Picture.LoadFromFile(TemPath);
  Fr_amplia_foto.ShowModal;
  Fr_amplia_foto.free;

end;

procedure TFr_produtos.Prpreco_vendaExit(Sender: TObject);
begin
  zzPreco_venda.Value := Prpreco_venda.Value;
end;

procedure TFr_produtos.habilita_menus;
begin
  if Tipo_usuario < '2' then
  begin
    tab_custo_valores.tabVisible := false;
    Tab_geral.tabVisible := false;
  end;
end;

procedure TFr_produtos.Pfcod_fornecedorKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin
  if Key = #13 then
  begin
    if (BtNov_Pf.Enabled = false) and (Pfcod_fornecedor.Text = '') then
    begin

      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Fornecedor';
      chamou_pesquisa := 'fr_fornecedor';
      chamou_form := 'fr_produto_fornecedor';
      chamou_cadastro := 'Fr_fornecedor';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Fornecedores';
      Fr_localizar.BT_cadastro.Visible := false;

      // preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo, 4);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Razão Social';
      Campos_combo[2] := 'Fantasia';
      Campos_combo[3] := 'Cidade';

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

    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;
end;

procedure TFr_produtos.PrgradeExit(Sender: TObject);
begin
  if (Prgrade.Text = 'NÃO') then
  begin
    if (Prcod_produto.Text <> '') then
    begin
      dao.Geral1('select id from grade where cod_produto=' + QuotedStr(Prcod_produto.Text));

      if dao.Q1.RecordCount > 0 then
      begin
        dao.msg('NÃO É POSSIVEL DE MUDAR O CAMPO DE GRADE ' + #13 + 'PORQUE ESTE PRODUTO JÁ CONTEM ATRIBUTOS NA GRADE!');
        Prgrade.ItemIndex := 0;
        Exit;
      end;
    end;
    tab_grade.tabVisible := false;
  end
  else

    tab_grade.tabVisible := true;

end;

procedure TFr_produtos.PrNom_produtoExit(Sender: TObject);
begin
  zzDescricao.Text := PrNom_produto.Text;
  verifica_nome_produto; // verifica se o nome do produto ja existe
end;

procedure TFr_produtos.Prfornecedor_principalButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Fornecedor';
  chamou_pesquisa := 'fr_fornecedor';
  chamou_form := 'fr_produto_fornecedor_principal';
  chamou_cadastro := 'Fr_fornecedor';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Fornecedores';
  Fr_localizar.BT_cadastro.Visible := false;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 4);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Razão Social';
  Campos_combo[2] := 'Fantasia';
  Campos_combo[3] := 'Cidade';

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

procedure TFr_produtos.Prfornecedor_principalKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin
  if Key = #13 then
  begin
    if (BtNov_Pf.Enabled = false) and (Pfcod_fornecedor.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Fornecedor';
      chamou_pesquisa := 'fr_fornecedor';
      chamou_form := 'fr_produto_fornecedor_principal';
      chamou_cadastro := 'Fr_fornecedor';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Fornecedores';
      Fr_localizar.BT_cadastro.Visible := false;

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

    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;

end;

procedure TFr_produtos.verifica_nome_produto;
begin
  dao.q2.Close;
  if (modo_insert) and (BtNov.Enabled = false) then
  begin
    dao.Geral2('select nom_produto from produto where nom_produto=' + QuotedStr(PrNom_produto.Text));
    if dao.q2.RecordCount > 0 then
    begin
      dao.msg('FOI ENCONTRADO UM PRODUTO CADASTRADO COM O MESMO NOME QUE VOCÊ CADASTROU' + #13 + 'VERIFIQUE SE VOCÊ NÃO ESTÁ CADASTRANDO O PRODUTO EM DOBRO, OU ALTERE O NOME DO PRODUTO!');
      PrNom_produto.SetFocus;
    end;
  end;

end;

procedure TFr_produtos.Pc_produtoChange(Sender: TObject);
begin
  if Pc_produto.ActivePage = tab_estoque then
  begin
    if (Prcod_produto.Text <> '') then
      movimentacao_produto(Prcod_produto.Text);
  end;
end;

procedure TFr_produtos.movimentacao_produto(cod_produto: string);
var
  dtaini, dtafin: TDate;
  dt, cod_fiscal: string;
  i, tot_linhas: Integer;
begin
  // monta sgpro
  SgPro.clear;
  SgPro.RowCount := 2;
  SgPro.Cells[0, 0] := 'N. Documento';
  SgPro.Cells[1, 0] := 'Data Documento';
  SgPro.Cells[2, 0] := 'Qtd. Entrada';
  SgPro.Cells[3, 0] := 'Tipo';

  // busca as entradas
  dao.Geral1('select e2.nr_documento, e1.dta_documento, qtd_entrada, e1.cod_fiscal from entrada2 e2 ' + 'left join entrada1 e1 on e1.nr_documento=e2.nr_documento ' + 'where e2.cod_produto= ' +
    QuotedStr(cod_produto) + ' order by e1.dta_documento');

  dao.Geral2('select v2.numdoc, v1.dtadoc, v2.qtd from vendas2 v2 ' + 'left join vendas1 v1 on v1.numdoc=v2.numdoc ' + 'where v2.cod_produto= ' + QuotedStr(cod_produto) + 'order by v1.dtadoc');

  dao.Geral3('select id, ac.cod_produto, data_acerto, qtd_acerto, operacao from acerto_estoque ac ' + 'left join produto p on p.cod_produto=ac.cod_produto ' + 'where ac.cod_produto= ' +
    QuotedStr(cod_produto));

  // pegando a dta inicial
  dao.Q1.First;
  if dao.Q1.fieldbyname('dta_documento').AsDateTime <> 0 then
    dtaini := dao.Q1.fieldbyname('dta_documento').AsDateTime;

  dao.q2.First;
  if dao.q2.fieldbyname('dtadoc').AsDateTime < dtaini then
    if dao.q2.fieldbyname('dtadoc').AsDateTime <> 0 then
      dtaini := dao.q2.fieldbyname('dtadoc').AsDateTime;

  dao.Q3.First;
  if dao.Q3.fieldbyname('data_acerto').AsDateTime < dtaini then
    if dao.Q3.fieldbyname('data_acerto').AsDateTime <> 0 then
      dtaini := dao.Q3.fieldbyname('data_acerto').AsDateTime;

  dao.Q1.last;
  dtafin := dao.Q1.fieldbyname('dta_documento').AsDateTime;

  dao.q2.last;
  if dao.q2.fieldbyname('dtadoc').AsDateTime > dtafin then
    if dao.q2.fieldbyname('dtadoc').AsDateTime <> 0 then
      dtafin := dao.q2.fieldbyname('dtadoc').AsDateTime;

  dao.Q3.last;
  if dao.Q3.fieldbyname('data_acerto').AsDateTime > dtafin then
    if dao.Q3.fieldbyname('data_acerto').AsDateTime <> 0 then
      dtafin := dao.Q3.fieldbyname('data_acerto').AsDateTime;

  // q1 = entradas
  // q2= saidas
  // q3= acerto_estoque
  dao.Q1.First;
  dao.q2.First;
  dao.Q3.First;
  dt := DateToStr(dtaini);
  tot_linhas := dao.Q1.RecordCount;
  tot_linhas := tot_linhas + dao.q2.RecordCount;
  tot_linhas := tot_linhas + dao.Q3.RecordCount;

  i := 1;

  while not(dao.Q1.Eof) do
  begin
    SgPro.Cells[0, i] := dao.Q1.fieldbyname('nr_documento').AsString;
    SgPro.Cells[1, i] := dao.Q1.fieldbyname('dta_documento').AsString;
    SgPro.Cells[2, i] := dao.Q1.fieldbyname('qtd_entrada').AsString;

    cod_fiscal := Copy(Trim(dao.Q1.fieldbyname('cod_fiscal').AsString), 1, 1);
    if (cod_fiscal = '1') or (cod_fiscal = '2') or (cod_fiscal = '3') then
      SgPro.Cells[3, i] := 'E'
    else if (cod_fiscal = '5') or (cod_fiscal = '6') or (cod_fiscal = '7') then
      SgPro.Cells[3, i] := 'S';

    dao.Q1.Next;
    SgPro.AddRow;
    i := i + 1;

  end;

  while not(dao.q2.Eof) do
  begin
    SgPro.Cells[0, i] := dao.q2.fieldbyname('numdoc').AsString;
    SgPro.Cells[1, i] := dao.q2.fieldbyname('dtadoc').AsString;
    SgPro.Cells[2, i] := dao.q2.fieldbyname('qtd').AsString;
    SgPro.Cells[3, i] := 'S';
    dao.q2.Next;
    SgPro.AddRow;
    i := i + 1;
  end;

  while not(dao.Q3.Eof) do
  begin
    SgPro.Cells[0, i] := dao.Q3.fieldbyname('id').AsString;
    SgPro.Cells[1, i] := dao.Q3.fieldbyname('data_acerto').AsString;
    SgPro.Cells[2, i] := dao.Q3.fieldbyname('qtd_acerto').AsString;
    if dao.Q3.fieldbyname('operacao').AsString = '+' then
      SgPro.Cells[3, i] := 'E'
    else
      SgPro.Cells[3, i] := 'S';

    dao.Q3.Next;
    SgPro.AddRow;
    i := i + 1;
  end;

end;

procedure TFr_produtos.BitBtn1Click(Sender: TObject);
begin
  if Prcod_produto.Text <> '' then // Pl= Produto Loja
  begin
    try
      //if dao.cn.InTransaction then
        dao.cn.StartTransaction;
      Plcod_produto.Text := Prcod_produto.Text;
      dao.insert('Pl', 'produto_empresa', 'id', Fr_produtos, 'gen_produto_empresa');
      dao.cn.Commit;
    except
      dao.cn.Rollback;
    end;

    limpa_campos('Pl');
    Plcod_empresa.SetFocus;
    carrega_produto_empresa(Prcod_produto.Text);

  end;

end;

procedure TFr_produtos.BitBtn2Click(Sender: TObject);
begin
  if Q_produto_empresa.RecordCount <= 0 then
  begin
    dao.msg('Você deve escolher uma Empresa para Excluir');
    Exit;
  end;
  if MessageDlg('Tem Certeza que Deseja Excluir Esta Empresa deste Produto?', mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    try
      //if dao.cn.InTransaction then
        dao.cn.StartTransaction;
      dao.delete('id', Q_produto_empresa.fieldbyname('id').AsString, 'produto_empresa');
      dao.cn.Commit;
    except
      dao.cn.Rollback;
    end;

    dao.msg('Empresa Excluida com Sucesso!');
  end;
  carrega_produto_empresa(Prcod_produto.Text);

end;

procedure TFr_produtos.carrega_produto_empresa(cod_produto: string);
begin
  with Q_produto_empresa do
  begin
    Close;
    SQL.clear;
    SQL.Add('select id, pl.cod_produto, emp.cod_empresa, emp.nom_empresa as loja from produto_empresa pl ' + 'left join empresa emp on emp.cod_empresa = pl.cod_empresa ' + 'where pl.cod_produto=' +
      QuotedStr(cod_produto));
    open;
  end;
  Q_produto_empresa.fieldbyname('id').Visible := false;
  Q_produto_empresa.fieldbyname('cod_produto').Visible := false;
  Q_produto_empresa.fieldbyname('cod_empresa').Visible := false;

end;

procedure TFr_produtos.Plcod_empresaKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  if Key = #13 then
  begin
    if (Plcod_empresa.Text = '') and (BtNov.Enabled = false) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Empresa';
      chamou_pesquisa := 'fr_empresa';
      chamou_form := 'fr_produto_empresa';
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
  end;;

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;
    end;
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;
end;

procedure TFr_produtos.Plcod_empresaButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Empresa';
  chamou_pesquisa := 'fr_empresa';
  chamou_form := 'fr_produto_empresa';
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

procedure TFr_produtos.Atualiza_cadastro_produtos_lojas;
var
  c_empresa: string;
begin
  try
    Application.ProcessMessages;
    PaAguarde.Visible := true;
    Application.ProcessMessages;

    dao.Geral1('select * from produto_empresa where cod_produto=' + QuotedStr(Prcod_produto.Text) + ' and cod_empresa <>' + QuotedStr(cod_empresa));
    dao.Q1.First;

    dao.Configura_CN_NET(dao.Q1.fieldbyname('cod_empresa').AsString);
    c_empresa := dao.Q1.fieldbyname('cod_empresa').AsString;
    //if not(dao.cn_net.InTransaction) then
      dao.cn_net.StartTransaction;

    while not(dao.Q1.Eof) do
    begin
      if cod_empresa <> dao.Q1.fieldbyname('cod_empresa').AsString then
      begin
        c_empresa := dao.Q1.fieldbyname('cod_empresa').AsString;
        try
          dao.Configura_CN_NET(dao.Q1.fieldbyname('cod_empresa').AsString);
        except
          on e: Exception do
          begin
            dao.msg('Não foi possivel enviar os Dados para a Filial!' + #13 + e.message);
       {     dao.envia_email_suporte(e.message + #13 + 'Data: ' + dao.DtaSerStr + #13 + 'Usuario Logado:' + nom_usuario, 'Erro ao Replicar os dados para a Filial', 'claudioplasfan@gmail.com',
              '', '', '');}
          end;
        end;

      end;
      // produto
      dao.Geral1_NET('select cod_produto from produto where cod_produto=' + QuotedStr(Prcod_produto.Text));

      if dao.q1_net.RecordCount > 0 then
        dao.Execsql_NET('update produto set nom_produto=' + QuotedStr(PrNom_produto.Text) + ', cod_grupo=' + QuotedStr(Prcod_grupo.Text) + ', unidade=' + QuotedStr(Prunidade.Text) +
          ', qtd_embalagem= ' + QuotedStr(PrQtd_embalagem.Text) + ', ref_fabrica=' + QuotedStr(PrRef_fabrica.Text) + ', observacao= ' + QuotedStr(PrObservacao.Text) + ', origem_mercadoria=' +
          QuotedStr(IntToStr(PrOrigem_mercadoria.ItemIndex)) + ', trib_icms= ' + QuotedStr(IntToStr(PrTrib_icms.ItemIndex)) + ', custo=' + QuotedStr(FMFUN.prepara_valor(PrCusto.Text)) + ', lucro= ' +
          QuotedStr(FMFUN.prepara_valor(PrLucro.Text)) + ', preco_venda=' + QuotedStr(FMFUN.prepara_valor(Prpreco_venda.Text)) + ', grade= ' + QuotedStr(IntToStr(Prgrade.ItemIndex)) +
          ', fornecedor_principal=' + QuotedStr(Prfornecedor_principal.Text) + ' where cod_produto=' + QuotedStr(Prcod_produto.Text))
      else
        dao.Execsql_NET('insert into produto (cod_produto, nom_produto, cod_grupo, unidade, qtd_embalagem, ref_fabrica, observacao, origem_mercadoria, ' +
          'trib_icms, custo, lucro, preco_venda, grade, fornecedor_principal) values (' + QuotedStr(Prcod_produto.Text) + ',' + QuotedStr(PrNom_produto.Text) + ',' + QuotedStr(Prcod_grupo.Text) + ','
          + QuotedStr(Prunidade.Text) + ',' + QuotedStr(PrQtd_embalagem.Text) + ',' + QuotedStr(PrRef_fabrica.Text) + ',' + QuotedStr(PrObservacao.Text) + ',' +
          QuotedStr(IntToStr(PrOrigem_mercadoria.ItemIndex)) + ',' + QuotedStr(IntToStr(PrTrib_icms.ItemIndex)) + ',' + QuotedStr(FMFUN.prepara_valor(PrCusto.Text)) + ',' +
          QuotedStr(FMFUN.prepara_valor(PrLucro.Text)) + ',' + QuotedStr(FMFUN.prepara_valor(Prpreco_venda.Text)) + ',' + QuotedStr(IntToStr(Prgrade.ItemIndex)) + ',' +
          QuotedStr(Prfornecedor_principal.Text) + ')');
      // **final produto

      // produto_empresa
      dao.Geral1_NET('select * from produto_empresa where cod_produto=' + QuotedStr(Prcod_produto.Text) + ' and cod_empresa=' + QuotedStr(dao.Q1.fieldbyname('cod_empresa').AsString));

      if dao.q1_net.RecordCount <= 0 then
        dao.Execsql_NET('insert into produto_empresa (cod_produto, cod_empresa) values (' + QuotedStr(Prcod_produto.Text) + ',' + QuotedStr(dao.Q1.fieldbyname('cod_empresa').AsString) + ')');
      // **final produto_empresa

      dao.Q1.Next;
    end;
    dao.cn_net.Commit;
    PaAguarde.Visible := false;
  except
    on e: Exception do
    begin
      PaAguarde.Visible := false;
      dao.msg('Houve um erro na replicação de Dados para as Lojas!' + #13 + e.message);
    end;
  end;
end;

procedure TFr_produtos.Plcod_empresaExit(Sender: TObject);
begin
  if Trim(Plcod_empresa.Text) = '' then
    Lbempresa.Caption := '...';

  if Plcod_empresa.Text <> '' then
  begin
    dao.Geral2('select nom_empresa from empresa where cod_empresa=' + QuotedStr(Plcod_empresa.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbempresa.Caption := dao.q2.fieldbyname('nom_empresa').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Plcod_empresa.Text := '';
      Plcod_empresa.SetFocus;
      Exit;
    end;

  end;

end;

procedure TFr_produtos.Prfornecedor_principalExit(Sender: TObject);
begin
  if Trim(Prfornecedor_principal.Text) = '' then
    LbNom_fornecedor_principal.Caption := '...';

  if Prfornecedor_principal.Text <> '' then
  begin
    dao.Geral2('select razao_social from fornecedor where cod_fornecedor=' + QuotedStr(Prfornecedor_principal.Text));
    if dao.q2.RecordCount > 0 then
    begin
      LbNom_fornecedor_principal.Caption := dao.q2.fieldbyname('razao_social').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prfornecedor_principal.Text := '';
      Prfornecedor_principal.SetFocus;
      Exit;
    end;

  end;

end;

procedure TFr_produtos.Pfcod_fornecedorExit(Sender: TObject);
begin
  if Trim(Pfcod_fornecedor.Text) = '' then
    LbNom_fornecedor.Caption := '...';

  if Pfcod_fornecedor.Text <> '' then
  begin
    dao.Geral2('select razao_social from fornecedor where cod_fornecedor=' + QuotedStr(Pfcod_fornecedor.Text));
    if dao.q2.RecordCount > 0 then
    begin
      LbNom_fornecedor.Caption := dao.q2.fieldbyname('razao_social').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Pfcod_fornecedor.Text := '';
      Pfcod_fornecedor.SetFocus;
      Exit;
    end;

  end;

end;

procedure TFr_produtos.Prcod_grupoExit(Sender: TObject);
begin
  if Trim(Prcod_grupo.Text) = '' then
    LbNom_Grupo.Caption := '...';

  if Prcod_grupo.Text <> '' then
  begin
    dao.Geral2('select nom_grupo from grupo where cod_grupo=' + QuotedStr(Prcod_grupo.Text));
    if dao.q2.RecordCount > 0 then
    begin
      LbNom_Grupo.Caption := dao.q2.fieldbyname('nom_grupo').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_grupo.Text := '';
      Prcod_grupo.SetFocus;
      Exit;
    end;
  end;

end;

procedure TFr_produtos.Prcod_colecaoExit(Sender: TObject);
begin
  if Trim(Prcod_colecao.Text) = '' then
    Lbcolecao.Caption := '...';

  if Prcod_colecao.Text <> '' then
  begin
    dao.Geral2('select descricao from colecao where id=' + QuotedStr(Prcod_colecao.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbcolecao.Caption := dao.q2.fieldbyname('descricao').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_colecao.Text := '';
      Prcod_colecao.SetFocus;
      Exit;
    end;
  end;

end;

procedure TFr_produtos.Prcod_estoqueButtonClick(Sender: TObject);
var
  q_campos_proponente: TFDQuery;
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

  Fr_localizar.Caption := 'Localizar Categorias de Estoque';

  chamou_pesquisa := 'fr_categoria_estoque';
  chamou_form := 'fr_categoria_estoque';
  chamou_cadastro := 'fr_categoria_estoque';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Categoria de Estoque';

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
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

procedure TFr_produtos.Prcod_estoqueExit(Sender: TObject);
begin
  if Trim(Prcod_estoque.Text) = '' then
    Lbestoque.Caption := '...';

  if Prcod_estoque.Text <> '' then
  begin
    dao.Geral2('select descricao from categoria_estoque where id=' + QuotedStr(Prcod_estoque.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbestoque.Caption := dao.q2.fieldbyname('descricao').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_estoque.Text := '';
      Prcod_estoque.SetFocus;
      Exit;
    end;
  end;

end;

procedure TFr_produtos.Gdid_CorExit(Sender: TObject);
begin
  if Trim(Gdid_Cor.Text) = '' then
    LbCor.Caption := '...';

  if Gdid_Cor.Text <> '' then
  begin
    dao.Geral2('select cor from cores where id=' + QuotedStr(Gdid_Cor.Text));
    if dao.q2.RecordCount > 0 then
    begin
      LbCor.Caption := dao.q2.fieldbyname('cor').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Gdid_Cor.Text := '';
      Gdid_Cor.SetFocus;
      Exit;
    end;

  end;

end;

procedure TFr_produtos.Gdid_tamanhoExit(Sender: TObject);
begin
  if Trim(Gdid_tamanho.Text) = '' then
    Lbtamanho.Caption := '...';

  if Gdid_tamanho.Text <> '' then
  begin
    dao.Geral2('select tamanho from tamanho where id=' + QuotedStr(Gdid_tamanho.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbtamanho.Caption := dao.q2.fieldbyname('tamanho').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Gdid_tamanho.Text := '';
      Gdid_tamanho.SetFocus;
      Exit;
    end;

  end;

end;

procedure TFr_produtos.Prid_marcaButtonClick(Sender: TObject);
var
  q_campos_proponente: TFDQuery;
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

  Fr_localizar.Caption := 'Localizar Marca';

  chamou_pesquisa := 'fr_marca';
  chamou_form := 'fr_produto_marca';
  chamou_cadastro := 'fr_marca';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Marca';

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
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

procedure TFr_produtos.Prid_marcaExit(Sender: TObject);
begin
  if Trim(Prid_marca.Text) = '' then
    Lbmarca.Caption := '...';

  if Prid_marca.Text <> '' then
  begin
    dao.Geral2('select nom_marca from marcas where id=' + QuotedStr(Prid_marca.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbmarca.Caption := dao.q2.fieldbyname('nom_marca').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prid_marca.Text := '';
      Prid_marca.SetFocus;
      Exit;
    end;
  end;

end;

procedure TFr_produtos.Prid_marcaKeyPress(Sender: TObject; var Key: Char);
var
  q_campos_proponente: TFDQuery;
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;

  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  if Key = #13 then
  begin
    if (Prid_marca.Text = '') and (BtNov.Enabled = false) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Marca';

      chamou_pesquisa := 'fr_marca';
      chamou_form := 'fr_produto_marca';
      chamou_cadastro := 'fr_marca';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Marca';

      // preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo, 3);
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
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;

  end;

end;

procedure TFr_produtos.PrunidadeButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Unidade';
  chamou_pesquisa := 'fr_unidade';
  chamou_form := 'fr_produto_unidade';
  chamou_cadastro := 'fr_unidade';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Unidade';
  Fr_localizar.BT_cadastro.Visible := true;

  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Unidade';

  for i := 0 to 1 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(Campos_combo[i]);
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

procedure TFr_produtos.PrunidadeExit(Sender: TObject);
begin
  if Prunidade.Text <> '' then
  begin
    dao.Geral2('select unidade from unidade where unidade=' + QuotedStr(Prunidade.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Prunidade.Text := dao.q2.fieldbyname('unidade').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prunidade.Text := '';
      Prunidade.SetFocus;
      Exit;
    end;
  end;

end;

procedure TFr_produtos.PrunidadeKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin

  if Key = #13 then
  begin
    if (Prunidade.Text = '') and (BtNov.Enabled = false) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Unidade';
      chamou_pesquisa := 'fr_unidade';
      chamou_form := 'fr_produto_unidade';
      chamou_cadastro := 'Fr_unidade';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Unidade';
      Fr_localizar.BT_cadastro.Visible := true;

      SetLength(Campos_combo, 2);
      Campos_combo[0] := 'Unidade';

      for i := 0 to 1 do
      begin
        valor_combo := Campos_combo[i];
        Fr_localizar.CBcampos.Items.Add(Campos_combo[i]);
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

    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;
end;

procedure TFr_produtos.PrNom_produtoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;
end;

procedure TFr_produtos.habilitaCamposAreaAtuacao(CodAtuacao: string);
begin
  if CodAtuacao = '0' then // comercio de vestuarios
  begin
    Paestoque.Visible := false;
  end
  else if CodAtuacao = '3' then // distribuidora
  begin
    lblcod_colecao.Visible := false;
    Lbcolecao.Visible := false;
    Prcod_colecao.Visible := false;
    Lblutiliza_grade.Visible := false;
    Prgrade.Visible := false;
    Pc_produto.Pages[1].tabVisible := false;
    Paestoque.Visible := true;
    Prpreco_venda.DisplayFormat := 'R$ ,0.0000;-R$ ,0.0000';
    zzPreco_venda.DisplayFormat := 'R$ ,0.0000;-R$ ,0.0000';
    PrCusto.DisplayFormat := 'R$ ,0.0000;-R$ ,0.0000';
  end;
end;

procedure TFr_produtos.PrgradeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Pc_produto.ActivePage := tab_fornecedor;
    Prfornecedor_principal.SetFocus;
  end;
end;

procedure TFr_produtos.Prcod_fiscal_produtoButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Código Fiscal';
  chamou_pesquisa := 'fr_cod_fiscal';
  chamou_form := 'fr_produto_cod_fiscal';
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

procedure TFr_produtos.Prcod_fiscal_produtoExit(Sender: TObject);
begin

  if Trim(Prcod_fiscal_produto.Text) = '' then
    Lbnom_cod_fiscal.Caption := '...';

end;

procedure TFr_produtos.Prcod_fiscal_produtoKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin

  if not(Key in ['0' .. '9', #8]) and (Key <> #13) then
  begin
    beep; { somente delphi 2.0 ou > }
    Key := #0;
  end;

  if Key = #13 then
  begin
    if (Prcod_fiscal_produto.Text = '') and (BtNov.Enabled = false) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Código Fiscal';
      chamou_pesquisa := 'fr_cod_fiscal';
      chamou_form := 'fr_produto_cod_fiscal';
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
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;
end;

procedure TFr_produtos.PrNCMEnter(Sender: TObject);
begin
  PrNCM.Text := FMFUN.TratarCodigoNCM(PrNCM.Text, 1);
end;

procedure TFr_produtos.TratarNCM;
begin
  PrNCM.Text := FMFUN.TratarCodigoNCM(PrNCM.Text, 0);
  if not FMFUN.ValidaNCM(PrNCM.Text, PrCest.Text) then
  begin
    if ActiveControl.Name = 'BtCan' then
      Exit;
    Application.CreateForm(Tfr_ncm, fr_ncm);
    fr_ncm.modo_insert := true;
    fr_ncm.readonly_false;
    fr_ncm.BtNov.Enabled := false;
    fr_ncm.BtAlt.Enabled := false;
    fr_ncm.BtGra.Enabled := true;
    fr_ncm.BtCan.Enabled := true;
    fr_ncm.BtExc.Enabled := false;
    fr_ncm.BtPro.Enabled := false;
    fr_ncm.PrCODIGO.Text := PrNCM.Text;
    fr_ncm.PrCest.Text := PrCest.Text;
    fr_ncm.chamada_tela_grupo_produto := true;
    fr_ncm.ShowModal;
    PrNCM.SetFocus;
  end
  else
    Lb_NCM.Caption := FMFUN.BuscaDescNCM(PrNCM.Text);

end;

procedure TFr_produtos.PrNCMExit(Sender: TObject);
begin
  if Trim(PrNCM.Text) = '' then
    Exit;

  PrNCM.Text := FMFUN.TratarCodigoNCM(PrNCM.Text, 0);

  if Trim(PrCest.Text) = '' then
  begin
    dao.msg('O código CEST deve ser preenchido!');
    FMFUN.ListaNCM('fr_produto_ncm', PrNCM.Text, true);
    PrNCM.SetFocus;
    Exit;
  end;

  TratarNCM;

end;

procedure TFr_produtos.PrNCMButtonClick(Sender: TObject);
begin
  FMFUN.ListaNCM('fr_produto_ncm', PrNCM.Text, false);
end;

procedure TFr_produtos.PrsubcategoriaButtonClick(Sender: TObject);
var
  q_campos_proponente: TFDQuery;
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

  Fr_localizar.Caption := 'Localizar SubCategoria';

  chamou_pesquisa := 'fr_subcategoria';
  chamou_form := 'fr_produto_subcategoria';
  chamou_cadastro := 'fr_subcategoria';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'SubCategorias de Produtos';

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'Categoria';

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

procedure TFr_produtos.PrsubcategoriaExit(Sender: TObject);
begin
  Foto.Picture := nil;
  if Trim(Prsubcategoria.Text) = '' then
    lbSubCategoria.Caption := '...';

  if Prsubcategoria.Text <> '' then
  begin
    dao.Geral2('select subcategoria, imagem_bd from subcategoria where id=' + QuotedStr(Prsubcategoria.Text));
    if dao.q2.RecordCount > 0 then
    begin
      lbSubCategoria.Caption := dao.q2.fieldbyname('subcategoria').AsString;
      if dao.q2.fieldbyname('imagem_bd').IsNull then
      begin
        Foto.Picture := nil;
        Exit;
      end;
      try
        TblobField(dao.q2.fieldbyname('imagem_bd')).SaveToFile('foto.bmp');
        Foto.Picture.LoadFromFile('foto.bmp');
        DeleteFile('foto.bmp');
      except
        TblobField(dao.q2.fieldbyname('imagem_bd')).SaveToFile('foto.jpg');
        Foto.Picture.LoadFromFile('foto.jpg');
        DeleteFile('foto.jpg');
      end;
    end
    else
    begin
      // dao.msg('Registro não Encontrado!');
      Prsubcategoria.Text := '';
      Prsubcategoria.SetFocus;
      Foto.Picture := nil;
      Exit;
    end;
  end;
end;

procedure TFr_produtos.PrsubcategoriaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if (BtNov.Enabled = false) then
      PrsubcategoriaButtonClick(self);
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;
end;

procedure TFr_produtos.BtPesqMovClick(Sender: TObject);
begin
  BuscaMov(Prcod_produto.Text, dtMovIni.Date, dtMovFim.Date);
end;

procedure TFr_produtos.q_mov_entAfterOpen(DataSet: TDataSet);
var
  total: real;
begin
  total := 0;
  q_mov_ent.First;
  while not q_mov_ent.Eof do
  begin
    total := total + q_mov_entQTD.Value;
    q_mov_ent.Next;
  end;
  stEntradas.Caption := FormatFloat('#,###,##0.00', total);
end;

procedure TFr_produtos.q_mov_resAfterOpen(DataSet: TDataSet);
var
  total: real;
begin
  total := 0;
  q_mov_res.First;
  while not q_mov_res.Eof do
  begin
    total := total + q_mov_resQTD.Value;
    q_mov_res.Next;
  end;
  stReservado.Caption := FormatFloat('#,###,##0.00', total);
end;

procedure TFr_produtos.q_mov_fatAfterOpen(DataSet: TDataSet);
var
  total: real;
begin
  total := 0;
  q_mov_fat.First;
  while not q_mov_fat.Eof do
  begin
    total := total + q_mov_fatQTD.Value;
    q_mov_fat.Next;
  end;
  stSaida.Caption := FormatFloat('#,###,##0.00', total);
end;

procedure TFr_produtos.q_mov_acertoAfterOpen(DataSet: TDataSet);
var
  total: real;
begin
  total := 0;
  q_mov_acerto.First;
  while not q_mov_acerto.Eof do
  begin
    total := total + q_mov_acertoQTD.Value;
    q_mov_acerto.Next;
  end;
  stAcerto.Caption := FormatFloat('#,###,##0.00', total);
end;

procedure TFr_produtos.sbClonarClick(Sender: TObject);
begin
  InserirProduto(false);
end;

procedure TFr_produtos.sbCodeBarClick(Sender: TObject);
begin
  Application.CreateForm(Tfr_escolhe_impressora_termica, fr_escolhe_impressora_termica);
  fr_escolhe_impressora_termica.ShowModal;
  if fr_escolhe_impressora_termica.ModalResult = mrok then
    caminho_imp_cod_barras := fr_escolhe_impressora_termica.impressora_termica
  else
    Exit;
  FMFUN.ImprimeEtiqueta(Prcod_produto.Text, PrNom_produto.Text, PrQtd_embalagem.Text, Prunidade.Text, Q_cod_barras.fieldbyname('CODIGO_BARRA').AsString, FRPRI.Tipo_Etiqueta, true, true);
end;

procedure TFr_produtos.Prid_plano_contasButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Plano de Conta';
  chamou_pesquisa := 'fr_plano_conta';
  chamou_form := 'fr_produto_plano_conta';
  chamou_cadastro := 'fr_plano_conta';

  Fr_localizar.BT_cadastro.Caption := 'Plano de Contas';
  Fr_localizar.BT_cadastro.Visible := true;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Descrição';
  Campos_combo[2] := 'N° Conta';

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

procedure TFr_produtos.Prid_plano_contasExit(Sender: TObject);
var
  sqlplano: string;
begin

  if Trim(Prid_plano_contas.Text) = '' then
  begin
    Lbnom_plano_contas_N1.Caption := '...';
    Lbnom_plano_contas_N2.Caption := '...';
    Lbnom_plano_contas_N3.Caption := '...';
    Lbnom_plano_contas_N4.Caption := '...';
  end;

  if (Prid_plano_contas.Text <> '') then
  begin
    sqlplano := 'SELECT ' + '  PC4.ID, ' + '  PC4.NR_CONTA, ' + '  TRIM(PC1.NR_CONTA)||''-''||PC1.DESCRICAO DESCRICAO1, ' + '  TRIM(PC2.NR_CONTA)||''-''||PC2.DESCRICAO DESCRICAO2, ' +
      '  TRIM(PC3.NR_CONTA)||''-''||PC3.DESCRICAO DESCRICAO3, ' + '  TRIM(PC4.NR_CONTA)||''-''||PC4.DESCRICAO DESCRICAO4 ' + 'FROM ' + '  PLANO_CONTAS PC4 ' +
      'INNER JOIN PLANO_CONTAS PC3 ON (PC3.ID = PC4.ID_PAI) ' + 'INNER JOIN PLANO_CONTAS PC2 ON (PC2.ID = PC3.ID_PAI) ' + 'INNER JOIN PLANO_CONTAS PC1 ON (PC1.ID = PC2.ID_PAI) ' +
      'WHERE (PC3.ID IN (''3'')  OR PC3.ID IN (''5'')) AND PC4.ID = ' + QuotedStr(Prid_plano_contas.Text);

    dao.Geral2(sqlplano);
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_plano_contas_N1.Caption := dao.q2.fieldbyname('descricao1').AsString;
      Lbnom_plano_contas_N2.Caption := dao.q2.fieldbyname('descricao2').AsString;
      Lbnom_plano_contas_N3.Caption := dao.q2.fieldbyname('descricao3').AsString;
      Lbnom_plano_contas_N4.Caption := dao.q2.fieldbyname('descricao4').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prid_plano_contas.Text := '';
      Prid_plano_contas.SetFocus;
      Exit;
    end;

  end;
end;

procedure TFr_produtos.BtnPesqHistClick(Sender: TObject);
begin
  if (edHistIni.Date <> 0) and (edHistFim.Date <> 0) then
    BuscaHist(Prcod_produto.Text, edHistIni.Date, edHistFim.Date);
end;

procedure TFr_produtos.BtNovoDescEspClick(Sender: TObject);
begin
  BtGravarDescEsp.Enabled := true;
  BtCancDescEsp.Enabled := true;
  BtAltDescEsp.Enabled := false;
  BtExcDescEsp.Enabled := false;
  BtNovoDescEsp.Enabled := false;

  mmDescEspecial.Append;
  edId_representante.SetFocus;
end;

procedure TFr_produtos.BtAltDescEspClick(Sender: TObject);
begin
  BtGravarDescEsp.Enabled := true;
  BtCancDescEsp.Enabled := true;
  BtAltDescEsp.Enabled := false;
  BtExcDescEsp.Enabled := false;
  BtNovoDescEsp.Enabled := false;

  mmDescEspecial.Edit;
  edId_representante.SetFocus;
end;

procedure TFr_produtos.BtGravarDescEspClick(Sender: TObject);
begin
  mmDescEspecialNOME_REPRESENTANTE.AsString := Lbnom_representante.Caption;
  mmDescEspecial.Post;

  BtGravarDescEsp.Enabled := false;
  BtCancDescEsp.Enabled := false;
  BtAltDescEsp.Enabled := true;
  BtExcDescEsp.Enabled := true;
  BtNovoDescEsp.Enabled := true;
end;

procedure TFr_produtos.BtCancDescEspClick(Sender: TObject);
begin
  mmDescEspecial.cancel;
  BtGravarDescEsp.Enabled := false;
  BtCancDescEsp.Enabled := false;
  BtAltDescEsp.Enabled := true;
  BtExcDescEsp.Enabled := true;
  BtNovoDescEsp.Enabled := true;
end;

procedure TFr_produtos.BtExcDescEspClick(Sender: TObject);
begin
  mmDescEspecial.delete;
  BtGravarDescEsp.Enabled := false;
  BtCancDescEsp.Enabled := false;
  BtAltDescEsp.Enabled := true;
  BtExcDescEsp.Enabled := true;
  BtNovoDescEsp.Enabled := true;
end;

procedure TFr_produtos.Edid_representanteButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Representante';

  chamou_pesquisa := 'fr_representante';
  chamou_form := 'fr_produto_representante';
  chamou_cadastro := 'fr_representante';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Represenante';

  if Tipo_usuario < '4' then
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

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
end;

procedure TFr_produtos.Edid_representanteExit(Sender: TObject);
begin
  if Trim(edId_representante.Text) = '' then
    Lbnom_representante.Caption := '...';

  if edId_representante.Text <> '' then
  begin
    dao.Geral2('select nom_representante, funcionario from representante where id=' + QuotedStr(edId_representante.Text));
    if dao.q2.RecordCount > 0 then
      Lbnom_representante.Caption := dao.q2.fieldbyname('nom_representante').AsString
    else
    begin
      dao.msg('Registro não Encontrado!');
      edId_representante.Text := '';
      edId_representante.SetFocus;
      Exit;
    end;
  end;
end;

procedure TFr_produtos.ft_representanteButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Representante';

  chamou_pesquisa := 'fr_representante';
  chamou_form := 'fr_produto_filtro_representante';
  chamou_cadastro := 'fr_representante';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Represenante';

  if Tipo_usuario < '4' then
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

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
end;

procedure TFr_produtos.BtPesqDescClick(Sender: TObject);
begin
  BuscaDescEspecial;
end;

procedure TFr_produtos.BuscaDescEspecial;
var
   sql_representante, sql_cidades, sql_todos: string;
begin
  sql_representante := '';

  if Trim(ft_representante.Text) <> '' then
    sql_representante := ' AND PR.ID_REPRESENTANTE = ' + ft_representante.Text;


  if Trim(ft_Cidade.Text) <> '' then
    sql_cidades := ' and r.id in (select c.ID_REPRESENTANTE from CLIENTE c '+
                 '             inner join cidades cd on cd.COD_CIDADE = c.COD_CIDADE '+
                 '             where cd.NOM_CIDADE like ''%'+ft_Cidade.Text+'%'')';

   if ckTodos.Checked then
   begin
     sql_todos := '  union '+
                  '  select '+
                  '    r.ID,  '+
                  '    r.NOM_REPRESENTANTE, '+
                  '    0 as DESCONTO_MAXIMO, '+
                  '    (select q1.cidade  '+
                  '     from  '+
                  '     (  '+
                   '      select cd.NOM_CIDADE||''-''||cd.UF as cidade, count(c.COD_CLIENTE) as total  '+
                   '      from CIDADES cd  '+
                  '       inner join cliente c on c.COD_CIDADE = cd.COD_CIDADE  '+
                   '      where c.ID_REPRESENTANTE = r.id '+
                   '      group by cidade '+
                   '      order by total desc limit 1 '+
                  '      ) q1 '+
                  '    ) as cidade '+
                  '  from REPRESENTANTE r '+
                  '  where r.ATIVO = ''S'' '+
                  '  and r.FUNCIONARIO = 0 '+
                  sql_cidades +
                  sql_representante +
                  '  and r.id not in (select pr.ID_REPRESENTANTE from PRODUTO_REPRESENTANTE pr where pr.COD_produto = '+Prcod_produto.Text+') ';
   end;

  dao.Geral1
    ('select * from (select pr.ID_REPRESENTANTE, r.NOM_REPRESENTANTE, pr.DESCONTO_MAXIMO, ' +
                  '    (select q1.cidade  '+
                  '     from  '+
                  '     (  '+
                   '      select cd.NOM_CIDADE||''-''||cd.UF as cidade, count(c.COD_CLIENTE) as total  '+
                   '      from CIDADES cd  '+
                  '       inner join cliente c on c.COD_CIDADE = cd.COD_CIDADE  '+
                   '      where c.ID_REPRESENTANTE = r.id '+
                   '      group by cidade '+
                   '      order by total desc limit 1 '+
                  '      ) q1 '+
                  '    ) as cidade '+
     'from REPRESENTANTE r inner join PRODUTO_REPRESENTANTE pr on (pr.ID_REPRESENTANTE = r.ID) where pr.COD_produto = ' + Prcod_produto.Text + sql_representante + sql_todos + ') q2 order by Nom_representante');

  dao.Q1.First;
  mmDescEspecial.Close;
  mmDescEspecial.EmptyTable;
  mmDescEspecial.open;
  while not dao.Q1.Eof do
  begin
    mmDescEspecial.Append;
    mmDescEspecialID_REPRESENTANTE.AsString := dao.Q1.fieldbyname('ID_REPRESENTANTE').AsString;
    mmDescEspecialNOME_REPRESENTANTE.AsString := dao.Q1.fieldbyname('NOM_REPRESENTANTE').AsString;
    mmDescEspecialDESCONTO_MAXIMO.Value := dao.Q1.fieldbyname('DESCONTO_MAXIMO').Value;
    mmDescEspecialCIDADE.AsString := dao.Q1.fieldbyname('cidade').AsString;
    mmDescEspecial.Post;
    dao.Q1.Next;
  end;
  mmDescEspecial.First;
end;

procedure TFr_produtos.ft_representanteExit(Sender: TObject);
begin
  if Trim(ft_representante.Text) = '' then
    ft_lb_nom_representante.Caption := '...';

  if ft_representante.Text <> '' then
  begin
    dao.Geral2('select nom_representante, funcionario from representante where id=' + QuotedStr(ft_representante.Text));
    if dao.q2.RecordCount > 0 then
      ft_lb_nom_representante.Caption := dao.q2.fieldbyname('nom_representante').AsString
    else
    begin
      dao.msg('Registro não Encontrado!');
      ft_representante.Text := '';
      ft_representante.SetFocus;
      Exit;
    end;
  end;

end;

procedure TFr_produtos.Com_Ft_RepresentanteButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Representante';

  chamou_pesquisa := 'fr_representante';
  chamou_form := 'fr_produto_grade_comissao_filtro_representante';
  chamou_cadastro := 'fr_representante';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Represenante';

  if Tipo_usuario < '4' then
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

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
end;

procedure TFr_produtos.Com_Ft_RepresentanteExit(Sender: TObject);
begin
  if Trim(Com_Ft_Representante.Text) = '' then
    lb_com_representante.Caption := '...';

  if Com_Ft_Representante.Text <> '' then
  begin
    dao.Geral2('select nom_representante, funcionario from representante where id=' + QuotedStr(Com_Ft_Representante.Text));
    if dao.q2.RecordCount > 0 then
      lb_com_representante.Caption := dao.q2.fieldbyname('nom_representante').AsString
    else
    begin
      dao.msg('Registro não Encontrado!');
      Com_Ft_Representante.Text := '';
      Com_Ft_Representante.SetFocus;
      Exit;
    end;
  end;
end;

procedure TFr_produtos.BtnPesqGradeClick(Sender: TObject);
var
  SQL, sql_rep, where: string;
begin
  if Trim(Com_Ft_Representante.Text) <> '' then
    sql_rep := ' AND A.CODREP = ' + Com_Ft_Representante.Text
  else
    sql_rep := ' AND A.CODREP = (select min(ID) from REPRESENTANTE r where r.id not in (select pr.id_representante from produto_representante pr)) ';

  SQL := 'SELECT distinct a.COD_PRODUTO, a.NOM_PRODUTO, a.PRECO_VENDA, a.DESCONTO_MAXIMO, ' + 'a.INDICE_LIMITE, A.PRECO_INI, ' + 'a.PRECO_FIM, a.SEQUENCIAL, a.INTERNO, ' + 'a.OUTROS ' +
    'FROM V_GRADE_COMISSAO a WHERE A.COD_PRODUTO =  ' + Prcod_produto.Text + sql_rep;
  dao.Geral1(SQL + ' order by A.SEQUENCIAL ');

  if dao.Q1.IsEmpty then
    Exit;
  if dao.Q1.fieldbyname('PRECO_INI').IsNull then
    Exit;

  dao.Q1.First;
  mmGradeComissao.Close;
  mmGradeComissao.EmptyTable;
  mmGradeComissao.open;
  while not dao.Q1.Eof do
  begin
    mmGradeComissao.Append;
    mmGradeComissaoPrecoInicial.Value := dao.Q1.fieldbyname('PRECO_INI').Value;
    mmGradeComissaoPrecoFinal.Value := dao.Q1.fieldbyname('PRECO_FIM').Value;
    mmGradeComissaoPerc_Desconto.Value := ((Prpreco_venda.Value - mmGradeComissaoPrecoInicial.Value) / Prpreco_venda.Value) * 100;
    if mmGradeComissaoPerc_Desconto.Value < 0 then
      mmGradeComissaoPerc_Desconto.Value := 0;
    mmGradeComissaoComissaoInterno.Value := dao.Q1.fieldbyname('INTERNO').Value;
    mmGradeComissaoValorInterno.Value := mmGradeComissaoPrecoInicial.Value * (mmGradeComissaoComissaoInterno.Value / 100);
    mmGradeComissaoComissaoOutros.Value := dao.Q1.fieldbyname('OUTROS').Value;
    mmGradeComissaoValorOutros.Value := mmGradeComissaoPrecoInicial.Value * (mmGradeComissaoComissaoOutros.Value / 100);

    if PrCusto_Total.Value > 0 then
    begin
      mmGradeComissaoMargemLucroOutros.Value := ((mmGradeComissaoPrecoInicial.Value - mmGradeComissaoValorOutros.Value - PrCusto_Total.Value) / PrCusto_Total.Value) * 100;
      mmGradeComissaoMargemLucroInterno.Value := ((mmGradeComissaoPrecoInicial.Value - mmGradeComissaoValorInterno.Value - PrCusto_Total.Value) / PrCusto_Total.Value) * 100;
    end;

    mmGradeComissao.Post;
    dao.Q1.Next;
  end;
  mmGradeComissao.First;
end;

procedure TFr_produtos.q_mov_entBeforeOpen(DataSet: TDataSet);
begin
  FRPRI.DesabilitaTimers;
end;

procedure TFr_produtos.q_mov_resBeforeOpen(DataSet: TDataSet);
begin
  FRPRI.DesabilitaTimers;
end;

procedure TFr_produtos.q_produto_fornecedorAfterScroll(DataSet: TDataSet);
begin
  Pfcod_fornecedor.Text := q_produto_fornecedor.fieldbyname('cod_fornecedor').AsString;
  LbNom_fornecedor.Caption := q_produto_fornecedor.fieldbyname('razao_social').AsString;
  PfCOD_PRODUTO_FORNECEDOR.Text := q_produto_fornecedor.fieldbyname('COD_PRODUTO_FORNECEDOR').AsString;
end;

procedure TFr_produtos.q_mov_fatBeforeOpen(DataSet: TDataSet);
begin
  FRPRI.DesabilitaTimers;
end;

procedure TFr_produtos.q_mov_acertoBeforeOpen(DataSet: TDataSet);
begin
  FRPRI.DesabilitaTimers;
end;



procedure TFr_produtos.dgGradeComissoesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (Column.FieldName = 'ComissaoInterno') then
  begin
    dgGradeComissoes.Canvas.Font.Color := clNavy;
    if gdSelected in State then
    begin
      dgGradeComissoes.Canvas.Brush.Color := clNavy;
      dgGradeComissoes.Canvas.Font.Color := clWhite;
    end;
  end
  else if (Column.FieldName = 'ValorInterno') then
  begin
    dgGradeComissoes.Canvas.Font.Color := clNavy;
    if gdSelected in State then
    begin
      dgGradeComissoes.Canvas.Brush.Color := clNavy;
      dgGradeComissoes.Canvas.Font.Color := clWhite;
    end;
  end
  else if (Column.FieldName = 'MargemLucroInterno') then
  begin
    dgGradeComissoes.Canvas.Font.Color := clNavy;
    if gdSelected in State then
    begin
      dgGradeComissoes.Canvas.Brush.Color := clNavy;
      dgGradeComissoes.Canvas.Font.Color := clWhite;
    end;
  end
  else if (Column.FieldName = 'ComissaoOutros') then
  begin
    dgGradeComissoes.Canvas.Font.Color := clMaroon;
    if gdSelected in State then
    begin
      dgGradeComissoes.Canvas.Brush.Color := clMaroon;
      dgGradeComissoes.Canvas.Font.Color := clWhite;
    end;
  end
  else if (Column.FieldName = 'ValorOutros') then
  begin
    dgGradeComissoes.Canvas.Font.Color := clMaroon;
    if gdSelected in State then
    begin
      dgGradeComissoes.Canvas.Brush.Color := clMaroon;
      dgGradeComissoes.Canvas.Font.Color := clWhite;
    end;
  end
  else if (Column.FieldName = 'MargemLucroOutros') then
  begin
    dgGradeComissoes.Canvas.Font.Color := clMaroon;
    if gdSelected in State then
    begin
      dgGradeComissoes.Canvas.Brush.Color := clMaroon;
      dgGradeComissoes.Canvas.Font.Color := clWhite;
    end;
  end
  else
  begin
    dgGradeComissoes.Canvas.Font.Color := clBlack;
    if gdSelected in State then
    begin
      dgGradeComissoes.Canvas.Brush.Color := clBlack;
      dgGradeComissoes.Canvas.Font.Color := clWhite;
    end;
  end;

  dgGradeComissoes.DefaultDrawDataCell(Rect, Column.Field, State);
end;


procedure TFr_produtos.btGraficoClick(Sender: TObject);
begin
  FMFUN.GraficoCusto(Prcod_produto.Text);
end;

procedure TFr_produtos.navAfterAction(Sender: TObject);
begin
  ativa_produto(dao.q_nav.fieldbyname('COD_PRODUTO').AsString, false);
  mostra_campos('Pr');
end;

end.
