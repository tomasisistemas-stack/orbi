unit UnPri;

{ ******* IDEIA PARA CRIAÇÃO DO ATUALIZADOR AUTOMATICO ******

}

{ **** IDEIA PARA CRIAÇÃO DO ATUALIZADOR DE ESTRUTURA *****

}

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, Buttons, XPMan, AppEvnts,
  XPStyleActnCtrls, ActnList, ActnMan, ExtCtrls,
  StdCtrls, midaslib, IdGlobal,
  shellApi, ACBrBase, IdMessage,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdMessageClient, IdSMTP, ACBrCalculadora, ACBrValidador,
  wininet, pcnconversao, RxGIF, IdFTP, ExtDlgs, ComObj,
  jpeg, RDprint, frxClass, frxExportRTF,
  Grids, BaseGrid, AdvGrid,
  fs_ipascal, frxExportImage, IniFiles, ColorGrd, xmldom,
  XMLIntf, IdHTTP, msxmldom, XMLDoc, ACBrNFeDANFEClass, UrlMon, ExtActns,
  ACBrNFe, IdFTPCommon, ClipBrd,
  OleCtrls, sSkinManager, sSpeedButton,
  sSkinProvider, sTreeView, sPanel, sBitBtn, IdIOHandler, IdIOHandlerSocket,
  IdSSLOpenSSL, DB, RxMemDS, DBGrids,
  IdText, IdAttachment, IdAttachmentFile,
  IdExplicitTLSClientServerBase, IdSMTPBase, frxExportHTML,
  IdIOHandlerStack, IdSSL, IdSASL, IdSASLUserPass, IdSASLLogin,
  IdAuthentication,
  ACBrNFeDANFEFRDM, ACBrNFeDANFEFR, ACBrDFe, ACBrMail, frxExportPDF,
  ACBrDFeReport, ACBrDFeDANFeReport, frxExportBaseDialog,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, sLabel;


var
  FCorFocado: TColor = $0025C1FF;
  MenuCarregado : Boolean;

type
  TEmail = class(TThread)
  private
    cCorpo, cAssunto, cEnd1, cEnd2, cEnd3, cCC, bCC, cAnexo1, cAnexo2: string;
    procedure Execute; override;
    procedure Mostra;
    procedure envia_email;
  public
    constructor Create(corpo, assunto, end1, end2, end3, CC, BC: string;
      anexo1: string = ''; anexo2: string = '');
  end;

  TFRPRI = class(TForm)
    ISMTPmail: TIdSMTP;
    IMmail: TIdMessage;
    MM: TMainMenu;
    Cadastros1: TMenuItem;
    Cliente1: TMenuItem;
    Fornecedores1: TMenuItem;
    Produtos1: TMenuItem;
    ransportadora1: TMenuItem;
    Geral1: TMenuItem;
    Grupos1: TMenuItem;
    Unidades1: TMenuItem;
    OrigemMercadoria1: TMenuItem;
    ributaoICMS1: TMenuItem;
    Cidade1: TMenuItem;
    FormasdePagamento1: TMenuItem;
    Agenda1: TMenuItem;
    Vendas1: TMenuItem;
    Estoque1: TMenuItem;
    EntradadeMercadorias1: TMenuItem;
    Financeiro1: TMenuItem;
    ContasaReceber1: TMenuItem;
    Contasapagar1: TMenuItem;
    RegistrodeInventrio1: TMenuItem;
    FluxodeCaixa1: TMenuItem;
    ControledeChequesdeterceiro1: TMenuItem;
    Utilitrios1: TMenuItem;
    PropriedadesdoSistema1: TMenuItem;
    CadastrodeUsurios1: TMenuItem;
    CadastrodeMatrizFilial1: TMenuItem;
    BackupdeDados1: TMenuItem;
    CotaesdePreo1: TMenuItem;
    LogdoSistema1: TMenuItem;
    ftp: TIdFTP;
    ransferencia1: TMenuItem;
    Enviar1: TMenuItem;
    Receber1: TMenuItem;
    EnviarDadosparaFiliais1: TMenuItem;
    ReceberDadosdaMatriz1: TMenuItem;
    Cores1: TMenuItem;
    amanho1: TMenuItem;
    Coleo1: TMenuItem;
    Relatrios1: TMenuItem;
    Estoque2: TMenuItem;
    Listagem1: TMenuItem;
    Vendas2: TMenuItem;
    Financeiro2: TMenuItem;
    Consignaes1: TMenuItem;
    PosiodeEstoque1: TMenuItem;
    PosiodeEstoquecomCusto1: TMenuItem;
    PosiodeEstoquecomPreodeVenda1: TMenuItem;
    InventriodeEstoque1: TMenuItem;
    SMTP_suporte: TIdSMTP;
    Produto1: TMenuItem;
    Fornecedor1: TMenuItem;
    Usurio1: TMenuItem;
    transportadora1: TMenuItem;
    VendasporPeriodo1: TMenuItem;
    ContasaPagar2: TMenuItem;
    Contasareceber2: TMenuItem;
    ransferenciadeMercadoria1: TMenuItem;
    ransferenciasporperiodo1: TMenuItem;
    ransferenciasemAberto1: TMenuItem;
    HistricodeMovimentaodeProduto1: TMenuItem;
    HistricodeCustodeProdutos1: TMenuItem;
    EntradaeSaidadeMercadorias1: TMenuItem;
    RelaodeNotasporPeriodo1: TMenuItem;
    RelaodeNotasdeDevoluodeMercadoria1: TMenuItem;
    RelaodeNotasdeRemessaparaConcerto1: TMenuItem;
    PosiodeEstoqueporFornecedor1: TMenuItem;
    Gerenciamento1: TMenuItem;
    ChequeTerceiros1: TMenuItem;
    EmissoCheques1: TMenuItem;
    SB: TStatusBar;
    PrazodePagamento1: TMenuItem;
    Representante1: TMenuItem;
    CategoriaEstoque1: TMenuItem;
    Banco1: TMenuItem;
    ContaCorrente1: TMenuItem;
    ListgemdeCrditodeClientes1: TMenuItem;
    CadastroCrdito1: TMenuItem;
    Motorista1: TMenuItem;
    Veiculo1: TMenuItem;
    ConsignaesemAberto1: TMenuItem;
    Panel1: tsPanel;
    AtualizarSistema1: TMenuItem;
    PosioEstoqueFornecedorSimplificado1: TMenuItem;
    ChequedeTerceiros2: TMenuItem;
    RelaodeNotasdeEntradacompleto1: TMenuItem;
    Marcas1: TMenuItem;
    ControledePedidos1: TMenuItem;
    MontagemdeCarga1: TMenuItem;
    ControledeFretes1: TMenuItem;
    ransportadora2: TMenuItem;
    ControledeFretesTransportadora1: TMenuItem;
    ClientesDetalhado1: TMenuItem;
    Produtos2: TMenuItem;
    VendasporPerodoAgrupadoporVendedor1: TMenuItem;
    PautadeVendascomEstoque1: TMenuItem;
    VendasPadroSimplificada1: TMenuItem;
    RelatoriodeSolicitaodeCompraatravesdeestoqueMnimo1: TMenuItem;
    ComissoporVenda1: TMenuItem;
    ClientesporRepresentante1: TMenuItem;
    RelatrioAuxiliardeCompra1: TMenuItem;
    RelatriodeAniversariantes1: TMenuItem;
    NCM1: TMenuItem;
    NotaFiscalEletrnica1: TMenuItem;
    Detalhado1: TMenuItem;
    Image1: TImage;
    ProdutosxNCM1: TMenuItem;
    TmUpdate: TTimer;
    AlterarSenha1: TMenuItem;
    Vendas3: TMenuItem;
    VendasSimplificado1: TMenuItem;
    RemessaseDevolues1: TMenuItem;
    Administrativo: TMenuItem;
    RegistrodePedidosDesfaturados1: TMenuItem;
    RegistrodePedidoscomFaturamentoAvulso1: TMenuItem;
    EnviodeLote1: TMenuItem;
    DANFe1: TMenuItem;
    PlanodeContas1: TMenuItem;
    GerarArquivosparaContabilidade1: TMenuItem;
    StatusEmissor1: TMenuItem;
    ProdutosClculodoPreodeVenda1: TMenuItem;
    CategoriadeProdutos1: TMenuItem;
    SubCategoriadeProdutos1: TMenuItem;
    Completo1: TMenuItem;
    EmissoRecibos1: TMenuItem;
    PedidosxPrateleira1: TMenuItem;
    RelaodePedidosImportadosdoSistemaPalm1: TMenuItem;
    TmPedidoPalm: TTimer;
    tmHora: TTimer;
    NFComplementar1: TMenuItem;
    MalaDiretaPromoes1: TMenuItem;
    ransfernciadeValoresentreContas1: TMenuItem;
    Extrato1: TMenuItem;
    XMLGeral: TXMLDocument;
    idHttpGeral: TIdHTTP;
    BaixarFretesCombinados1: TMenuItem;
    ProdutosEtiquetas1: TMenuItem;
    ConsultaAnaltica1: TMenuItem;
    Vendas4: TMenuItem;
    PlanodeContas3: TMenuItem;
    GradedeComisses1: TMenuItem;
    CAContasLiquidadas1: TMenuItem;
    OrdemdeCompra1: TMenuItem;
    AcertodeEstoque2: TMenuItem;
    TmContaVencida: TTimer;
    CAClculoPLR1: TMenuItem;
    Representantes1: TMenuItem;
    TmPedidoVendedor: TTimer;
    RelaodePedidosDigiadospeloVendedor1: TMenuItem;
    TmReiniciaTimers: TTimer;
    tmChamaGravador: TTimer;
    PalmNovosPedidos1: TMenuItem;
    Button1: TButton;
    PlanodeContas2: TMenuItem;
    ProdutosDescontoEspecial1: TMenuItem;
    Panel4: tsPanel;
    sbClientes: TsSpeedButton;
    sbVendas: TsSpeedButton;
    sbContasPagar: TsSpeedButton;
    sbContasReceber: TsSpeedButton;
    sbFechar: TsSpeedButton;
    sbProduto: TsSpeedButton;
    sbEntrada: TsSpeedButton;
    sbOrdemCompra: TsSpeedButton;
    sbRelatVendas: TsSpeedButton;
    sbRelatComissoes: TsSpeedButton;
    estedeImagensdeProdutos1: TMenuItem;
    Cobrana1: TMenuItem;
    LerRetornoCobrana1: TMenuItem;
    EnviarAvisosaosRepresentantes1: TMenuItem;
    AlterarLayout1: TMenuItem;
    sbAbrir: TsSpeedButton;
    Panel3: tsPanel;
    RepresentantesFuncionriosCC1: TMenuItem;
    NovoSimplificado1: TMenuItem;
    Cobrana2: TMenuItem;
    EnviarRemessa1: TMenuItem;
    MotivosdeCancelamentosdeNFes1: TMenuItem;
    SPEDFiscalGerarArquivo1: TMenuItem;
    ProdutosxNCMxST1: TMenuItem;
    Simples1: TMenuItem;
    Completo2: TMenuItem;
    Avisos1: TMenuItem;
    ProdutosCdigodeBarras1: TMenuItem;
    ProdutosCatlogo1: TMenuItem;
    P1: TMenuItem;
    P2: TMenuItem;
    M1: TMenuItem;
    n1: TMenuItem;
    c1: TMenuItem;
    Button2: TButton;
    S1: TMenuItem;
    M2: TMenuItem;
    S2: TMenuItem;
    S3: TMenuItem;
    sbTransmissao: TsSpeedButton;
    V1: TMenuItem;
    c2: TMenuItem;
    Shape1: TShape;
    C3: TMenuItem;
    EnviarPedidos: TMenuItem;
    sbEnviarPedidos: TsSpeedButton;
    t1: TMenuItem;
    produto_completo: TMenuItem;
    S4: TMenuItem;
    T2: TMenuItem;
    N2: TMenuItem;
    TmAlertas: TTimer;

    D1: TMenuItem;
    M4: TMenuItem;
    cliente_pre: TMenuItem;
    C4: TMenuItem;
    IdHTTPDownload: TIdHTTP;
    Atuacao: TMenuItem;
    c5: TMenuItem;
    R1: TMenuItem;
    p3: TMenuItem;
    T3: TMenuItem;
    T4: TMenuItem;
    r2: TMenuItem;
    sslsocket: TIdSSLIOHandlerSocketOpenSSL;
    IdSASLLogin1: TIdSASLLogin;
    C6: TMenuItem;
    c7: TMenuItem;
    r3: TMenuItem;
    e1: TMenuItem;
    ProdutosCapadeEmbalagem1: TMenuItem;
    E2: TMenuItem;
    S5: TMenuItem;
    TreeView1: TTreeView;
    E3: TMenuItem;
    P4: TMenuItem;
    E4: TMenuItem;
    RD: TRDprint;
    C8: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    frxPDFExport1: TfrxPDFExport;
    frxReport1: TfrxReport;
    ISMTPmail1: TIdSMTP;
    QrCert: TFDQuery;
    mmMenu: TRxMemoryData;
    mmMenuID: TIntegerField;
    mmMenuNOM_MENU: TStringField;
    mmMenuNIVEL: TIntegerField;
    qr_nfe_email: TFDQuery;
    Q_NF: TFDQuery;
    qrGravaFoto: TFDQuery;
    Q_Geral: TFDQuery;
    q_menu: TFDQuery;
    qrConsulta: TFDQuery;
    D2: TMenuItem;
    A1: TMenuItem;
    ACBrMail: TACBrMail;
    N61: TMenuItem;
    Q_Geral1: TFDQuery;
    qr_nfe_emailnumdoc: TIntegerField;
    qr_nfe_emailnfe_email: TStringField;
    qr_nfe_emailemail: TStringField;
    qr_nfe_emailchave_nfe: TStringField;
    qr_nfe_emailemail_nfe: TSmallintField;
    qr_nfe_emailnfe: TIntegerField;
    qr_nfe_emailemail_adicional1: TStringField;
    qr_nfe_emailemail_adicional2: TStringField;
    qr_nfe_emailemail_adicional3: TStringField;
    qr_nfe_emailxml: TBlobField;
    qr_nfe_emailxml_dev: TBlobField;
    qr_nfe_emailnom_empresa: TStringField;
    ACBrNFe1: TACBrNFe;
    ACBrNFeDANFEFR1: TACBrNFeDANFEFR;
    N21: TMenuItem;
    N12: TMenuItem;
    N22: TMenuItem;
    RankingProdutos: TMenuItem;
    Button3: TButton;
    qr_nfe_emailcod_empresa: TIntegerField;
    pnlCertAviso: TsPanel;
    shpCertAviso: TShape;
    lblCertAvisoTitulo: TsLabel;
    lblCertAvisoMsg: TsLabel;
    S6: TMenuItem;
    C9: TMenuItem;
    procedure JvXPBar1Items0Click(Sender: TObject);
    procedure JvXPBar1Items1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure LaEnd_WebClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure CotaesdePreo1Click(Sender: TObject);
    procedure ransportadora1Click(Sender: TObject);
    procedure Cidade1Click(Sender: TObject);
    procedure Grupos1Click(Sender: TObject);
    procedure EntradadeMercadorias1Click(Sender: TObject);
    procedure CadastrodeMatrizFilial1Click(Sender: TObject);
    procedure CadastrodeUsurios1Click(Sender: TObject);
    procedure LogdoSistema1Click(Sender: TObject);
    procedure ImprimirEtiquetasCodigodeBarras1Click(Sender: TObject);
    procedure PropriedadesdoSistema1Click(Sender: TObject);
    procedure amanho1Click(Sender: TObject);
    procedure Coleo1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ContasaReceber1Click(Sender: TObject);
    procedure Contasapagar1Click(Sender: TObject);
    procedure AcertodeEstoque1Click(Sender: TObject);
    procedure PosiodeEstoque1Click(Sender: TObject);
    procedure PosiodeEstoquecomCusto1Click(Sender: TObject);
    procedure PosiodeEstoquecomPreodeVenda1Click(Sender: TObject);
    procedure Cores1Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure VendasporPeriodo1Click(Sender: TObject);
    procedure RelaodeNotasporPeriodo1Click(Sender: TObject);
    procedure PosiodeEstoqueporFornecedor1Click(Sender: TObject);
    procedure VendasporFornecedorcomCusto1Click(Sender: TObject);
    procedure VendasporPerodoAgrupadodorData1Click(Sender: TObject);
    procedure ChequeTerceiros1Click(Sender: TObject);
    procedure EmissoCheques1Click(Sender: TObject);
    procedure Representante1Click(Sender: TObject);
    procedure CFOP1Click(Sender: TObject);
    procedure Unidades1Click(Sender: TObject);
    procedure Banco1Click(Sender: TObject);
    procedure ContaCorrente1Click(Sender: TObject);
    procedure CategoriaEstoque1Click(Sender: TObject);
    procedure PrazodePagamento1Click(Sender: TObject);
    procedure CadastroCrdito1Click(Sender: TObject);
    procedure Veiculo1Click(Sender: TObject);
    procedure Motorista1Click(Sender: TObject);
    procedure ConsignaesemAberto1Click(Sender: TObject);
    procedure AtualizarSistema1Click(Sender: TObject);
    procedure PosioEstoqueFornecedorSimplificado1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fr_relatorioPreview(Sender: TObject);
    procedure VendasporMarca1Click(Sender: TObject);
    procedure ChequedeTerceiros2Click(Sender: TObject);
    procedure RelaodeNotasdeEntradacompleto1Click(Sender: TObject);
    procedure Marcas1Click(Sender: TObject);
    procedure MontagemdeCarga1Click(Sender: TObject);
    procedure ControledeFretesTransportadora1Click(Sender: TObject);
    procedure OrdemdeCompra1Click(Sender: TObject);
    procedure ClientesDetalhado1Click(Sender: TObject);
    procedure ransferenciasporperiodo1Click(Sender: TObject);
    procedure VendasporPerodoAgrupadoporVendedor1Click(Sender: TObject);
    procedure PautadeVendascomEstoque1Click(Sender: TObject);
    procedure VendasPadroSimplificada1Click(Sender: TObject);
    procedure RelatoriodeSolicitaodeCompraatravesdeestoqueMnimo1Click
      (Sender: TObject);
    procedure ClientesporRepresentante1Click(Sender: TObject);
    procedure RankingClientesSimplificado1Click(Sender: TObject);
    procedure RelatrioAuxiliardeCompra1Click(Sender: TObject);
    procedure RelatriodeAniversariantes1Click(Sender: TObject);
    procedure PrPedido1Click(Sender: TObject);
    procedure NCM1Click(Sender: TObject);
    procedure Simplificado1Click(Sender: TObject);
    procedure Detalhado1Click(Sender: TObject);
    procedure TreeView1DblClick(Sender: TObject);
    procedure TreeView_Menu;
    procedure sbFecharClick(Sender: TObject);
    procedure SBAbrirClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ProdutosxNCM1Click(Sender: TObject);
    procedure TmUpdateTimer(Sender: TObject);
    function HabilitaMenu(Menu: string): Boolean;
    procedure AlterarSenha1Click(Sender: TObject);
    procedure Vendas3Click(Sender: TObject);
    procedure VendasSimplificado1Click(Sender: TObject);
    procedure RemessaseDevolues1Click(Sender: TObject);
    procedure EnviodeLote1Click(Sender: TObject);
    procedure DANFe1Click(Sender: TObject);
    procedure PlanodeContas1Click(Sender: TObject);
    procedure GerarArquivosparaContabilidade1Click(Sender: TObject);
    procedure StatusEmissor1Click(Sender: TObject);
    procedure Novo1Click(Sender: TObject);
    procedure NovoDetalhado1Click(Sender: TObject);
    procedure RegistrodePedidosDesfaturados1Click(Sender: TObject);
    procedure HistricodeMovimentaodeProduto1Click(Sender: TObject);
    procedure ContasaPagar2Click(Sender: TObject);
    procedure Contasareceber2Click(Sender: TObject);
    procedure ProdutosClculodoPreodeVenda1Click(Sender: TObject);
    procedure CategoriadeProdutos1Click(Sender: TObject);
    procedure SubCategoriadeProdutos1Click(Sender: TObject);
    procedure transportadora1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure EmissoRecibos1Click(Sender: TObject);
    procedure PedidosxPrateleira1Click(Sender: TObject);
    procedure RelaodePedidosImportadosdoSistemaPalm1Click(Sender: TObject);
    procedure TmPedidoPalmTimer(Sender: TObject);
    procedure tmHoraTimer(Sender: TObject);
    procedure NFComplementar1Click(Sender: TObject);
    procedure MalaDiretaPromoes1Click(Sender: TObject);
    procedure ransfernciadeValoresentreContas1Click(Sender: TObject);
    procedure Extrato1Click(Sender: TObject);
    procedure PlanodeContas2Click(Sender: TObject);
    procedure BaixarFretesCombinados1Click(Sender: TObject);
    procedure ProdutosEtiquetas1Click(Sender: TObject);
    procedure PlanodeContas3Click(Sender: TObject);
    procedure Vendas4Click(Sender: TObject);
    procedure GradedeComisses1Click(Sender: TObject);
    procedure CalcularSalrios1Click(Sender: TObject);
    procedure CalcularComisses1Click(Sender: TObject);
    procedure PosiodeEstoqueInventrio1Click(Sender: TObject);
    procedure NovoSimplificado1Click(Sender: TObject);
    procedure CAContasLiquidadas1Click(Sender: TObject);
    procedure AcertodeEstoque2Click(Sender: TObject);
    procedure TmContaVencidaTimer(Sender: TObject);
    procedure CAClculoPLR1Click(Sender: TObject);
    procedure Representantes1Click(Sender: TObject);
    procedure TmPedidoVendedorTimer(Sender: TObject);
    procedure RelaodePedidosDigiadospeloVendedor1Click(Sender: TObject);

    procedure IdHTTPDownloadWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure TmReiniciaTimersTimer(Sender: TObject);
    procedure tmChamaGravadorTimer(Sender: TObject);
    procedure ApplicationEvents1Activate(Sender: TObject);
    procedure ISMTPmailWork(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure Fornecedor1Click(Sender: TObject);
    procedure ProdutosDescontoEspecial1Click(Sender: TObject);
    procedure sbClientesClick(Sender: TObject);
    procedure sbVendasClick(Sender: TObject);
    procedure sbContasPagarClick(Sender: TObject);
    procedure sbContasReceberClick(Sender: TObject);
    procedure sbProdutoClick(Sender: TObject);
    procedure sbEntradaClick(Sender: TObject);
    procedure sbOrdemCompraClick(Sender: TObject);
    procedure sbRelatVendasClick(Sender: TObject);
    procedure sbRelatComissoesClick(Sender: TObject);
    procedure FormasdePagamento1Click(Sender: TObject);
    procedure estedeImagensdeProdutos1Click(Sender: TObject);
    procedure Cobrana1Click(Sender: TObject);
    procedure LerRetornoCobrana1Click(Sender: TObject);
    procedure EnviarAvisosaosRepresentantes1Click(Sender: TObject);
    procedure AlterarLayout1Click(Sender: TObject);
    procedure RepresentantesFuncionriosCC1Click(Sender: TObject);
    procedure frxReport1GetValue(const VarName: string; var Value: Variant);
    procedure EnviarRemessa1Click(Sender: TObject);
    procedure MotivosdeCancelamentosdeNFes1Click(Sender: TObject);
    procedure SPEDFiscalGerarArquivo1Click(Sender: TObject);
    procedure Simples1Click(Sender: TObject);
    procedure Completo2Click(Sender: TObject);
    procedure Avisos1Click(Sender: TObject);
    procedure ProdutosCdigodeBarras1Click(Sender: TObject);
    procedure ProdutosCatlogo1Click(Sender: TObject);
    procedure P1Click(Sender: TObject);
    procedure P2Click(Sender: TObject);
    procedure n1Click(Sender: TObject);
    procedure c1Click(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure M2Click(Sender: TObject);
    procedure S2Click(Sender: TObject);
    procedure S3Click(Sender: TObject);
    procedure sbTransmissaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure V1Click(Sender: TObject);
    procedure c2Click(Sender: TObject);
    procedure C3Click(Sender: TObject);
    procedure tmConectTimer(Sender: TObject);
    procedure EnviarPedidosClick(Sender: TObject);
    procedure sbEnviarPedidosClick(Sender: TObject);
    procedure t1Click(Sender: TObject);
    procedure produto_completoClick(Sender: TObject);
    procedure S4Click(Sender: TObject);
    procedure T2Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure TmAlertasTimer(Sender: TObject);
    procedure D1Click(Sender: TObject);
    procedure M4Click(Sender: TObject);
    procedure cliente_preClick(Sender: TObject);
    procedure AtuacaoClick(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure p3Click(Sender: TObject);
    procedure T3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure T4Click(Sender: TObject);
    procedure IdHTTPDownloadWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure IdHTTPDownloadWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure C6Click(Sender: TObject);
    procedure c7Click(Sender: TObject);
    procedure r3Click(Sender: TObject);
    procedure e1Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure E2Click(Sender: TObject);
    procedure S5Click(Sender: TObject);
    procedure E3Click(Sender: TObject);
    procedure E4Click(Sender: TObject);
    procedure T5Click(Sender: TObject);
    procedure C8Click(Sender: TObject);
    procedure D2Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure N61Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure RankingProdutosClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure S6Click(Sender: TObject);
    procedure C9Click(Sender: TObject);
  private
    procedure CarregarListaMenu;
    procedure AvisoAniversariantes;

    procedure Atualizacao;
    procedure Oculta_Menu;
    procedure ChangeControl(Sender: TObject);
    procedure LiberarPedidoGeral;
    procedure AvisoContasPagarDiario;
    procedure AvisoContasVencidasDiario;
    procedure ChecarCertificado;
    procedure ChecarEstoqueMinimo;
    procedure ChecarAvisoPedidosExternos;
    procedure AbrirTelaPedidosExternos(const AAvisoPalm: Boolean);
    procedure AvisoPedidosExternosClick(Sender: TObject);
    procedure ChecarAvisoAtualizacao;
    procedure AvisoAtualizacaoClick(Sender: TObject);
    procedure ChecarRevisaoVeiculo;
    procedure OcultaBotoes;
    procedure ImprimirVisitas(rep: string);
    procedure SetaAcesso(nomeForm: string);
    { Private declarations }
  public
    TipUsu: string;
    Tipo_Etiqueta: Integer;
    TeleVendas, Frente_Caixa, Homologacao_NFe, modulo_vendedor,
      representacao: Boolean;
    Representante_id, Site: string;
    supervisor, ReiniciaTmUpdate, ReiniciaTmPedidoVendedor,
      ReiniciaTmPedidoPalm, ReiniciaTmCheckMalaDireta,
      ReiniciaTmContaVencida: Boolean;
    Habilita_Consultas: Boolean; // f2 e f3...
    function DtaSerStr: string;
    function DtaSerDt: TDateTime;
    procedure geral(comando: string);
    procedure geral2(comando: string);
    function AppIsRunning(ActivateIt: Boolean): Boolean;
    procedure execsql(comando: string);

    procedure NumTab(Modo: Variant; num: Integer; texto: string);

    procedure Configura_Email(cod_empresa: string);
    procedure Carrega_configuracao;
    procedure configura_ftp(cod_empresa: string);
    // configura ftp da empresa que vai ser enviado a carga de dados

    procedure habilita_menus(cod_usu: string);
    // Habilita os menus do main menu.
    procedure habilitaCamposAreaAtuacao(CodAtuacao: string);
    // habilita os menus de campo de acesso.
    // 0 - Comercio de Vestuario
    // 1 - Comercio de Mareriais de Construção e Eletrico
    // 2 - Comercio de Produtos Eletronicos e informatica
    // 3 - Distribuidora
    // 4 - Industria em Geral

    // o retorno dessa função é o total do estoque real - reservado
    procedure ativa_configuracao;
    procedure desativa_configuracao;
    procedure envia_email(corpo, assunto, end1, end2, end3, CC, bCC: string);

    // tipos de documentos:  docCPF,docCNPJ, docInscEst,docCEP,docNumCheque
    function valida_doc(documento: string; tipdoc: TACBrValTipoDocto): Boolean;

    { Public declarations }
    procedure AvisoContasVencidas;

    { ********************PROCEDIMENTOS E DICAS PARA O EXCEL*************** }
    procedure AbreExcel(var Modo: Variant; nome_arq: ShortString; opcao: Byte);
    procedure PrExcel(Modo: Variant; Tab, Lin, Col: Integer; texto: string);
    procedure MesclaCel(Modo: Variant; Tab: Integer; Intervalo: ShortString);
    procedure CorCel(Modo: Variant; Tab, cor: Integer; Intervalo: ShortString);
    procedure BordaCel(Modo: Variant; Tab: Integer; Intervalo: ShortString;
      Par1, Par2: Integer);
    procedure BordaCelGeral(Modo: Variant; Tab: Integer; Intervalo: ShortString;
      Par1: Integer);
    procedure FontCel(Modo: Variant; Tab, cor, tamanho, Negrito: Integer;
      Intervalo: ShortString);
    procedure AlinhaCel(Modo: Variant; Tab: Integer; Intervalo: ShortString;
      PosVertical, PosHorizontal: Integer);
    procedure ConfPagina(Modo: Variant; Tab: Integer;
      Orientacao, tamanho: ShortString; Zoom: Integer);
    procedure QuebraPagina(Modo: Variant; Tab, Linha: Integer;
      Coluna: ShortString; TirarQuebra: Boolean);
    procedure ReduzCel(Modo: Variant; Tab: Integer; Intervalo: ShortString);
    procedure FormatLinCol(Modo: Variant; Tab: Integer;
      Intervalo, Mascara: ShortString);
    procedure LarguraLin(Modo: Variant; Tab: Integer; Intervalo: ShortString;
      Largura: real);
    procedure LarguraCol(Modo: Variant; Tab: Integer; Intervalo: ShortString;
      Largura: real);
    procedure CongelaLinCol(Modo: Variant; Tab, Lin, Col: Integer);
    procedure InsereLinha(Modo: Variant; Tab, Lin, NumLin: Integer);
    procedure InsereFormula(Modo: Variant; Tab: Integer;
      Intervalo, Formula: ShortString);
    { MOSTRAR O PREVIEW DO EXCEL  EX: Excel.Workbooks(1).PrintPreview }

    { ********* FINAL DICAS E PROCEDIMENTOS DO EXCEL********************* }

    // Funções Gerais
    function LimpaCNPJ(cnpj: string): string;

    procedure configuraRD(fonteTamanho: TSize; tipoImpressora: TModelo;
      qtdcoluna, qtdlinha: Integer; qtdLpp: TLinha; usaGerenciador: Boolean);

    function busca_cfop_produto(nom_uf, trib_produto, tipo: string): string;
    // função busca o cfop correto para colocar na nfe do produto tipo= E=entrada  S=saida
    { NF-E }
    function pAssinarXML(pathDocXML, tipDocXML, titCertificado: WideString;
      out aResultado: WideString): Integer;
    function pValidarXML(pathXML, pathSchemas: WideString;
      out resMensagem, msgErros: WideString): WideString;
    procedure GerarLote(NumerodoLote: string; out PathLote: string);
    function Modulo11(Numero: string): string;
    function StrZero(num: real; Zeros, Deci: Integer): string;
    function Alltrim(const Search: string): string;
    procedure CadastraMenu(Menu: string);
    procedure AvisoEstoqueMinimo(produto: string = '');
    function VerificaEstoqueReal(cod_produto: string; qtd: real): real;
    procedure AvisoEstoqueMinimoDiario;
    procedure AtualizaSistema;
    procedure EnviaArquivoNFe(emp_nome, emp_hp, emp_fone, email_cliente, nfe,
      nfe_xml, nfe_pdf, CC1, CC2, CC3: string; count, final: Integer);
    procedure ImportarPedidoPalm;
    procedure CheckPedidoPalm;
    function EnvioEmailNFE(pedido, tipo: string): string;
    procedure AvisoContaPagarVencida;
    function BuscaEndereco(cep: string): TStringList;
    function BuscaCEP(tipo_logradouro, logradouro, uf, cidade, bairro,
      Numero: string): TStringList;
    procedure CheckPedidoVendedor;
    function BaixarNovaVersao: Boolean;
    procedure HabilitaTimers;
    procedure DesabilitaTimers;
    procedure ZeraProdutoWeb;
    procedure checar_configuracao;
    procedure EnvioEmailPedidos(pedido: string);
  end;

const
  ////////////////////////////////////////////////////////////
  versao: ShortString = '2.00.68';
  ////////////////////////////////////////////////////////////

var


  FRPRI: TFRPRI;
  MFRMSEL, MNUMTIT: string;
  MCODUSU, MSERDOC, MNUMDOC, MRELATO: string;
  MDTADOC: TDateTime;
  MNUMDOCCR1, MSERDOCCR1: string;
  MDTADOCCR1: TDate;
  NomeBD: string;
  Representante_usuario: string;
  Tipo_usuario: ShortString;
  telemarketing: Boolean;
  codpro_loc, nompro_loc: string;
  mform: string;
  numped: string;
  // variavel criada para armazenar o numero do pedido/venda e ser usada em outro form ex: usada na tela de fechamento de consignação quando gera uma venda
  liberado, aviso_estoque_minimo, aviso_conta_vencida: Boolean;
  chamou_pesquisa: string;
  // usada para quando chama algum form para referenciar qual form originou a chamada;
  chamou_form: string; // qual form ira devolver o resultado da pesquisa.
  chamou_cadastro: string;
  revenda: string;
  // usada para referenciar qual cadastro deve ser chamado no form de localizar;
  tipo_envio: ShortString;
  arquivo: string;
  // usada para armazenar o nome do arquivo para o anexo do email.
  tipo_relatorio, tipo_transferencia: string;
  // usada para definir o tipo de relatorio que foi chamado e a partir disso montar a tela do relatorio
  letra_maiuscula, checar_veiculo: Boolean;

  // variaveis para relatorios e geral
  dtserv_str: string;
  dtserv_dta: TDateTime;
  Lin, Col: Integer;

  num_documento, num_cupom, tipo_venda, versao_banco, versao_site: string;
  nom_cor, nom_tamanho: string;
  codbarras: string;
  home_page: string;

  // referente a NF-e
  arquivo_nfe, arquivo_procNFe, arquivo_ReciboNFe: string;
  nome_titular: string; // quarda o nome do titular do certificado
  // ChaveAcesso: TChaveAcesso;
  CodigoNumerico, CasasDecimais: Integer;
  ID: string;
  _FAlterado: Boolean = False;
  _FCorAntiga: TColor;
  _FControleAtivo: TWinControl = nil;

implementation

uses UnUsu,
  UnFun, UnLog, Un_Cliente, Un_Fornecedor, Un_Cotacao,
  Un_Transportadora, Un_cidade, Un_dao, Un_produto, Un_grupo, Un_entrada,
  Un_Cadempresa, Un_log,
  Un_imp_codbarras, Un_configuracao, Un_tamanho,
  Un_colecao, Un_contas_receber, Un_contas_pagar, Unacerto_estoque,
  Un_opc_relatorios, un_estrutura_produto,
  Un_cor, Un_cheque_terceiros, Un_cheques, Un_representante, Un_cfop,
  Un_tabela_unidade, Un_banco, Un_conta_corrente, Un_categoria_estoque,
  Un_prazo_pagamento, Un_parametro_credito, Un_veiculos, Un_motorista,
  Math, Un_dm, Un_marcas, Un_montagem_carga,
  Un_relatorio_cliente_vendedor, Un_pre_pedido, frmMontaXML,
  NFE_dll_TLB, nfe_v110, Un_ncm, Un_nfe_envio_lote, un_nfe_transmissao,
  un_email_envio, un_alterar_senha, Un_nfe_danfe, Un_plano_contas,
  Un_nfe_arquivos, Un_status_emissor, Un_vendas_industria2, Un_categoria, un_subcategoria,
  un_infoatu, Un_recibo, un_palm_conexao, un_nfe_complementar,
  Un_mala_direta, un_transf_valores, Un_frete_combinado,
  Un_etiquetas_produtos, un_etiquetas_multiplos_produtos, un_olap_plano_conta, un_olap_vendas,
  Un_calcular_salarios, Un_calcular_comissoes, Un_plano_contas_consulta,
  un_grade_comissao, un_telas, un_nfe,
  Un_ordem_compra, Un_calculo_plr_consulta, Un_splash, Un_forma_pagamento,
  TesteImagensBd, un_ler_retorno, Un_aviso_representantes_avulso,
  un_altera_layout, un_remessa_boleto, Un_motivo_nfe_cancel,
  un_aviso_diretoria, Un_produto_nao_revenda, un_produto_detalhes,
  un_impostos, un_ultimas_vendas, un_conexao_vendor, un_controle_status_pedido,
  Un_calcular_13o_salarios, un_vendor_enviar_pedidos, AtualizaBD,
  un_produto_simplificado, un_pre_cadastro, {MapaAtuacao,} un_controle_visitas,
  Un_representantes_clientes, un_email_nfe, Un_etapas_producao,
  un_entrada_producao, un_alterar_preco, Un_pedido_simplificado;

{$R *.dfm}

procedure SetCtrlFocado(Focar: Boolean);
begin
  if (_FControleAtivo <> nil) then
    try
      if (_FControleAtivo is TCustomEdit) or (_FControleAtivo is TCustomComboBox)
      then
      begin
        if Focar then
        begin
          _FCorAntiga := TEdit(_FControleAtivo).Color;
          _FAlterado := True;
          TEdit(_FControleAtivo).Color := FCorFocado;
        end
        else
        begin
          TEdit(_FControleAtivo).Color := _FCorAntiga;
          _FAlterado := False;
        end;
      end;
    except
      // vai q o individuo já foi destruido!!!
    end;
end;

procedure TFRPRI.ChangeControl(Sender: TObject);
begin
  if Application.Terminated then
    Exit;

  if Screen.ActiveControl <> _FControleAtivo then
  begin
    if _FAlterado then
      SetCtrlFocado(False);

    _FControleAtivo := Screen.ActiveControl;
    SetCtrlFocado(True);
  end;
end;

procedure TFRPRI.JvXPBar1Items0Click(Sender: TObject);
begin
  ShowMessage('clientes');
end;

procedure TFRPRI.JvXPBar1Items1Click(Sender: TObject);
begin
  ShowMessage('produtos');
end;

procedure TFRPRI.LiberarPedidoGeral;
var
  computador: string;
begin
  if (FMFUN <> nil) then
    Exit;
  try
    Application.CreateForm(TFMFUN, FMFUN);
    computador := FMFUN.computador;
  finally
    //
  end;

  try
    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
    dao.execsql
      ('UPDATE VENDAS1 SET ABERTO_USUARIO = ''S'', MAQUINA_USUARIO_ABERTO = NULL WHERE MAQUINA_USUARIO_ABERTO = '
      + QuotedStr(nom_usuario + '-' + computador));
    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;
end;

procedure TFRPRI.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  { IF MessageDlg('DESEJA SAIR DO SISTEMA?',mtConfirmation,[MBYES,MBNO],0)=MRYES THEN
    begin
    //    dao.msg('antes');
    FRLOG.Close;
    //    dao.msg('depois');
    CanClose:=true;
    end
    else
    CanClose:=false;
  }
end;

procedure TFRPRI.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    close;
    Key := #0;
  end;
end;

procedure TFRPRI.LaEnd_WebClick(Sender: TObject);
begin
  ActiveControl := nil;
  ShellExecute(handle, 'open', pchar('http://'), nil, nil, Sw_ShowNormal);

end;

procedure TFRPRI.FormActivate(Sender: TObject);
var
  path_flash: string;
begin
  Application.CreateForm(TFMFUN, FMFUN);
  Application.CreateForm(TFr_log, Fr_log);

  formatsettings.ShortDateFormat := 'dd/mm/yy';
  // Carrega_configuracao;

  if aviso_conta_vencida then
    AvisoContasVencidasDiario;

  if aviso_estoque_minimo then
    AvisoEstoqueMinimoDiario;

  { if dao.CN.Server <> '200.180.91.99/3050' then
    begin
    AvisoEstoqueMinimoDiario;
    //  EnvioEmailNFE;
    habilitatimers;
    end; }

end;

function TFRPRI.AppIsRunning(ActivateIt: Boolean): Boolean;
//
// Testa se a sua aplicacao já esta sendo executada
//
var
  hSem: thandle;
  hWndMe: HWnd;
  AppTitle: string;
begin
  Result := False;
  AppTitle := Application.Title;

  hSem := CreateSemaphore(nil, 0, 1, pchar(AppTitle));

  if ((hSem > 0) and (GetLastError() = ERROR_ALREADY_EXISTS)) then
  begin
    CloseHandle(hSem);
    Result := True;
  end;

  if Result and ActivateIt then
  // if Result then
  begin
    ShowMessage('APP EM USO');

    hWndMe := FindWindow(nil, pchar(AppTitle));

    if not Result then
      ShowMessage('fora');

    if (hWndMe <> 0) then
    begin
      if IsIconic(hWndMe) then
      begin
        ShowWindow(hWndMe, Sw_ShowNormal);
      end
      else
      begin
        SetForegroundWindow(hWndMe);
      end;
    end;
  end;
end;

procedure procura_exe;
begin

end;

procedure TFRPRI.geral(comando: string);
begin

end;

procedure TFRPRI.geral2(comando: string);
begin

end;

procedure TFRPRI.execsql(comando: string);
begin

end;

procedure TFRPRI.Configura_Email(cod_empresa: string);
begin
(*
  dao.Geral1('select * from empresa where cod_empresa = ' +
    QuotedStr(cod_empresa));

  // IMmail.From.Name := dao.Q1.fieldbyname('ema_nom_apresentacao').AsString;
  IMmail.From.Address := dao.Q1.fieldbyname('ema_email').AsString;
  ISMTPmail.HeloName := dao.Q1.fieldbyname('ema_nom_apresentacao').AsString;
  ISMTPmail.Username := dao.Q1.fieldbyname('ema_login').AsString;
  ISMTPmail.Password := dao.Q1.fieldbyname('ema_senha').AsString;
  ISMTPmail.Port := dao.Q1.fieldbyname('ema_porta').AsInteger;
  ISMTPmail.Host := dao.Q1.fieldbyname('ema_smtp').AsString;

  if dao.Q1.fieldbyname('email_ssl').AsString = 'S' then
  begin
    ISMTPmail.IOHandler := sslsocket;
    sslsocket.SSLOptions.Method := sslvSSLv3;
    sslsocket.SSLOptions.Mode := sslmClient;
    {
      SSLSocket.Destination = 'smtp.gmail.com:587'
      SSLSocket.Host = 'smtp.gmail.com'
      SSLSocket.MaxLineAction = maException
      SSLSocket.Port = 587
      SSLSocket.SSLOptions.Method = sslvTLSv1
      SSLSocket.SSLOptions.Mode = sslmUnassigned
      SSLSocket.SSLOptions.VerifyMode = []
      SSLSocket.SSLOptions.VerifyDepth = 0
      SSLSocket.OnStatusInfo = IdSSLSocketStatusInfo
    }

  end;

  if dao.Q1.fieldbyname('EMA_AUTENTICACAO').AsString = 'S' then
    ISMTPmail.AuthType := satSASL;
  try
    ISMTPmail.Connect();
  except
    //
  end;
  *)
end;

procedure TFRPRI.Cliente1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_Cliente, Fr_Cliente);
    SetaAcesso(Fr_Cliente.Caption);
    Fr_Cliente.ShowModal;
  finally
    Fr_Cliente.Free;
  end;
end;

procedure TFRPRI.Fornecedores1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_fornecedor, Fr_fornecedor);
	SetaAcesso(Fr_fornecedor.Caption);
    Fr_fornecedor.ShowModal;
  finally
    Fr_fornecedor.Free;
  end;
end;

procedure TFRPRI.CotaesdePreo1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_Cotacao, Fr_Cotacao);
	SetaAcesso(Fr_Cotacao.Caption);
    Fr_Cotacao.ShowModal;
  finally
    Fr_Cotacao.Free;
  end;
end;

procedure TFRPRI.ransportadora1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_Transportadora, Fr_Transportadora);
	SetaAcesso(Fr_Transportadora.Caption);
    Fr_Transportadora.ShowModal;
  finally
    Fr_Transportadora.Free
  end;
end;

procedure TFRPRI.Cidade1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_cidades, Fr_cidades);
	SetaAcesso(Fr_cidades.Caption);
    Fr_cidades.tipo := '1';
    Fr_cidades.ShowModal;
  finally
    Fr_cidades.Free;
  end;
end;

procedure TFRPRI.checar_configuracao;
begin
  dao.Geral1('select * from configuracao');

  if dao.Q1.fieldbyname('letra_maiuscula').AsString = 'S' then
    letra_maiuscula := True
  else
    letra_maiuscula := False;

  Tipo_Etiqueta := dao.Q1.fieldbyname('TIPO_ETIQUETA').AsInteger;
  modulo_vendedor := dao.Q1.fieldbyname('MODULO_VENDOR').AsString = 'S';
  representacao := dao.Q1.fieldbyname('REPRESENTACAO').AsString = 'S';

  sbTransmissao.Visible := modulo_vendedor and representacao;

  CasasDecimais := dao.Q1.fieldbyname('casasdecimais').AsInteger;
  Homologacao_NFe := dao.Q1.fieldbyname('NFE_HOMOLOGACAO').AsString = 'S';

  aviso_estoque_minimo := dao.Q1.fieldbyname('AVISO_ESTOQUE_MINIMO_CK')
    .AsString = 'S';
  aviso_conta_vencida := dao.Q1.fieldbyname('AVISO_CONTA_VENCIDA_CK')
    .AsString = 'S';
  Frente_Caixa := dao.Q1.fieldbyname('FRENTE_CAIXA_UTILIZA').AsString = 'S';
  versao_banco := dao.Q1.fieldbyname('versao').AsString;
  dao.Q1.close;
end;

procedure TFRPRI.Carrega_configuracao;
var
  Resposta: TStringStream;
  TSConsulta: TStringList;
begin
  checar_configuracao;
  Resposta := TStringStream.Create('');
  TSConsulta := TStringList.Create;
  TSConsulta.Values['&versao'] := '';
  //versao_banco := versao;
  //versao_site := versao;
{  try
    idHttpGeral.Request.UserAgent :=
      'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)';
    idHttpGeral.Post('http://www.plasfan.ind.br/admin/orbi.php?', TSConsulta,
      Resposta);
  except
    Exit;
  end;
  // XMLGeral.DOMVendor := GetDOMVendor('Open XML');
  XMLGeral.Active := True;
  XMLGeral.Encoding := 'iso-8859-1';
  XMLGeral.LoadFromStream(Resposta);
  versao_site := XMLGeral.DocumentElement.ChildNodes['versao'].NodeValue;
  TSConsulta.Free;
  Resposta.Free;
  XMLGeral.Active := False;}
end;

procedure TFRPRI.Grupos1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_grupo, Fr_grupo);
	SetaAcesso(Fr_grupo.Caption);
    Fr_grupo.ShowModal;
  finally
    Fr_grupo.Free;
  end;
end;

procedure TFRPRI.EntradadeMercadorias1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_entrada, Fr_entrada);
	SetaAcesso(Fr_entrada.Caption);
    Fr_entrada.servico := False;
    Fr_entrada.ShowModal;
  finally
    Fr_entrada.Free;
  end;
end;

function TFRPRI.valida_doc(documento: string;
  tipdoc: TACBrValTipoDocto): Boolean;
begin

end;

function TFRPRI.VerificaEstoqueReal(cod_produto: string; qtd: real): real;
var
  novo_estoque: real;
begin
  dao.Geral1('SELECT qtd_estoque from produto where cod_produto = ' +
    cod_produto);
  novo_estoque := dao.Q1.fieldbyname('qtd_estoque').AsFloat - qtd;
  if novo_estoque <= 0 then
    Result := 0
  else
    Result := novo_estoque;
end;

procedure TFRPRI.CadastrodeMatrizFilial1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_Empresa, Fr_Empresa);
    Fr_Empresa.ShowModal;
  finally
    Fr_Empresa.Free;
  end;
end;

function TFRPRI.DtaSerStr: string;
begin
  dao.geral2('select current_date as dt from configuracao ');
  Result := dao.Q2.fieldbyname('dt').AsString;
end;

procedure TFRPRI.e1Click(Sender: TObject);
begin
  try
    Application.CreateForm(Tfrm_nfe_email, frm_nfe_email);
    SetaAcesso(frm_nfe_email.Caption);	
    frm_nfe_email.ShowModal;
  finally
    frm_nfe_email.Free;
  end;
end;

function TFRPRI.DtaSerDt: TDateTime;
begin
  dao.geral2('select current_date as dt from configuracao ');
  Result := dao.Q2.fieldbyname('dt').AsDateTime;

end;

procedure TFRPRI.CadastrodeUsurios1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFRUSU, FRUSU);
	SetaAcesso(FRUSU.Caption);
    FRUSU.ShowModal;
  finally
    FRUSU.Free;
  end;
end;


procedure TFRPRI.LogdoSistema1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_log, Fr_log);
	SetaAcesso(Fr_log.Caption);
    Fr_log.ShowModal;
  finally
    Fr_log.Free;
  end;
end;

procedure TFRPRI.ImprimirEtiquetasCodigodeBarras1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_eti_codbarras, Fr_eti_codbarras);
	SetaAcesso(Fr_eti_codbarras.Caption);
    Fr_eti_codbarras.ShowModal;
  finally
    Fr_eti_codbarras.Free;
  end;
end;

procedure TFRPRI.PropriedadesdoSistema1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_configuracao, Fr_configuracao);
	SetaAcesso(Fr_configuracao.Caption);
    Fr_configuracao.ShowModal;
  finally
    Fr_configuracao.Free;
  end;
end;

procedure TFRPRI.habilita_menus(cod_usu: string);
begin
  dao.Geral1
    ('select u.CODUSU, u.LOGUSU, u.SENUSU, u.SENESP, u.CADCLI, u.CADFOR, ' +
    'u.CADPRO, u.CADTAB, u.CADTRA, u.PEDIDO, u.CADOBR, u.CONENT, u.DEVCON, u.FECCON, '
    + 'u.CONAPA, u.CONREC, u.CONCHT, u.ENTRAD, u.NOTESP, u.ACEEST, u.ATUPRE, u.CADUSU, '
    + 'u.CADEMP, u.CONSIS, u.AGECON, u.FLUCAI, u.IMPETI, u.REGINV, u.LANCHT, u.COVCUP, '
    + 'u.DMECLI, u.RELEST, u.COTPRE, u.BACKUP, u.NIVEL, u.COD_EMPRESA, u.FONE, u.NOME, '
    + 'u.COD_REPRESENTANTE, e.cod_empresa, e.tipo from tbusu u ' +
    'left join empresa e on e.cod_empresa=u.cod_empresa ' + 'where u.codusu=' +
    QuotedStr(cod_usu));

  Tipo_usuario := dao.Q1.fieldbyname('nivel').AsString;
  Representante_usuario := dao.Q1.fieldbyname('cod_representante').AsString;

  if area_atuacao = '0' then
  begin

  end;

  if Tipo_usuario < '2' then // tipo_usuario 0 = normal
  begin
    PosiodeEstoque1.Visible := False;
    PosiodeEstoquecomCusto1.Visible := False;
    PosiodeEstoquecomPreodeVenda1.Visible := False;
  end;

  if dao.Q1.fieldbyname('tipo').AsString = '1' then // 1= matriz   0= filial
  begin
    // EnviarDadosparaMatriz1.Visible:= false;
    ReceberDadosdaMatriz1.Visible := True;
  end
  else if dao.Q1.fieldbyname('tipo').AsString = '0' then
  // 1= matriz   0= filial
  begin
    EnviarDadosparaFiliais1.Visible := True;
    // ReceberDadosdasFiliais1.Visible:= false;
  end;

  if (dao.Q1.fieldbyname('tipo').AsString = '1') or
    (dao.Q1.fieldbyname('tipo').AsString = '0') then
  begin
    if dao.Q1.fieldbyname('cadcli').AsString = 'S' then
      Cliente1.Visible := True
    else
      Cliente1.Visible := False;

    if dao.Q1.fieldbyname('cadfor').AsString = 'S' then
      Fornecedores1.Visible := True
    else
      Fornecedores1.Visible := False;

    if dao.Q1.fieldbyname('cadpro').AsString = 'S' then
      Produtos1.Visible := True
    else
      Produtos1.Visible := False;

    if dao.Q1.fieldbyname('cadtab').AsString = 'S' then
      Geral1.Visible := True
    else
      Geral1.Visible := False;

    if dao.Q1.fieldbyname('cadtra').AsString = 'S' then
      ransportadora1.Visible := True
    else
      ransportadora1.Visible := False;

    if dao.Q1.fieldbyname('pedido').AsString = 'S' then
      Vendas1.Visible := True
    else
      Vendas1.Visible := False;

    { if dao.Q1.FieldByName('aceest').AsString = 'S' then
      AcertodeEstoque1.Visible := true
      else
      AcertodeEstoque1.Visible := false;
    }

  end
  else
  begin
    // cadastros
    Fornecedores1.Visible := False;
    Produtos1.Visible := False;
    CotaesdePreo1.Visible := False;
    Geral1.Visible := False;
    Agenda1.Visible := False;
    ransportadora1.Visible := False;

    // financeiro
    Financeiro1.Visible := False;

    // utilitario
    Utilitrios1.Visible := False;

  end;

end;

procedure TFRPRI.amanho1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_tamanho, Fr_tamanho);
	SetaAcesso(Fr_tamanho.Caption);
    Fr_tamanho.ShowModal;
  finally
    Fr_tamanho.Free;
  end;
end;

procedure TFRPRI.Coleo1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_colecao, Fr_colecao);
	SetaAcesso(Fr_colecao.Caption);
    Fr_colecao.ShowModal;
  finally
    Fr_colecao.Free;
  end;
end;

procedure TFRPRI.ativa_configuracao;
begin
  with DM.q_configuracao do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT a.COD_CONF, a.ANO_VIGOR, a.VERSAO, a.LETRA_MAIUSCULA, a.CALCULAR_PRECO_VENDA_AUTOMATIC, '
      + 'a.LUCRO_PADRAO_FORNECEDOR, a.FATURAR_SEM_ESTOQUE, a.GRAVA_PROD_AUT_INTERNET, a.TRANSFERIR_ROMANEIO_INTERNET, '
      + 'a.SINCRONIZA_VENDAS_SERVIDOR, a.ULTIMA_NF, a.UTILIZA_FILA_IMPRESSAO, a.NAO_UTILIZA_GRADE, a.AREA_ATUACAO, '
      + 'a.PRAZO_VENCIMENTO_CONSIGNACAO, a.GRAVA_CLIENTE_AUT_INTERNET, a.AGRUPAR_PROD_IGUAIS_VENDAS, a.VALOR_PONTO_FIDELIDADE, '
      + 'a.UTILIZAR_PONTO_FIDELIDADE_CLI, a.CAMINHO_COD_BARRAS, a.VERIFICA_STATUS_FINANCEIRO, a.AVISO_ESTOQUE, '
      + 'a.SITE, a.USUARIO_SITE, a.LOGIN_SITE, a.MALA_DIRETA_PRAZO, a.SALARIO_FORNECEDOR, a.SALARIO_PLANO_CONTAS, '
      + 'a.COMISSAO_FORNECEDOR, a.COMISSAO_PLANO_CONTAS, a.QTD_CONSULTA_CEP, a.DATA_REL_PEDIDOS_VENDEDORES, '
      + 'a.PLR_FORNECEDOR, a.PLR_PLANO_CONTAS, a.MARGEM_LUCRO_PADRAO, a.VALE_FORNECEDOR, a.VALE_PLANO_CONTAS, '
      + 'a.CHECAR_REVISAO_VEICULO, a.LOGO ' +
      'FROM CONFIGURACAO a where a.cod_conf=' + QuotedStr('1'));
    open;
  end;
end;

procedure TFRPRI.desativa_configuracao;
begin
 // DM.q_configuracao.close;
end;

procedure TFRPRI.OcultaBotoes;
var
  x, posicao: Integer;
begin
  if not representacao then
    Exit;
  // sbClientes.Visible := Cliente1.Visible;
  sbProduto.Visible := produto_completo.Visible;
  sbVendas.Visible := Vendas3.Visible;
  sbEntrada.Visible := EntradadeMercadorias1.Visible;
  sbOrdemCompra.Visible := OrdemdeCompra1.Visible;
  sbContasPagar.Visible := Contasapagar1.Visible;
  sbContasReceber.Visible := ContasaReceber1.Visible;
  sbRelatVendas.Visible := VendasPadroSimplificada1.Visible;
  sbRelatComissoes.Visible := Detalhado1.Visible;
  sbEnviarPedidos.Visible := EnviarPedidos.Visible;

  posicao := 2;

  for x := 0 to FRPRI.ComponentCount - 1 do
  begin
    with FRPRI do
    begin
      if Components[x] is TSpeedButton then
      begin
        if TSpeedButton(Components[x]).Visible and
          (TSpeedButton(Components[x]).width = 90) then
        begin
          TSpeedButton(Components[x]).left := posicao;
          posicao := posicao + TSpeedButton(Components[x]).width;
        end;
      end;
    end;
  end;

end;

procedure TFRPRI.sbContasReceberClick(Sender: TObject);
begin
  if ContasaReceber1.Visible then
    ContasaReceber1Click(self)
  else
    ShowMessage('Seu Perfil de Usuário não está habilitado!');
end;

procedure TFRPRI.sbProdutoClick(Sender: TObject);
begin
  if produto_completo.Visible then
    produto_completoClick(self)
  else
    ShowMessage('Seu Perfil de Usuário não está habilitado!');
end;

procedure TFRPRI.sbEntradaClick(Sender: TObject);
begin
  if EntradadeMercadorias1.Visible then
    EntradadeMercadorias1Click(self)
  else
    ShowMessage('Seu Perfil de Usuário não está habilitado!');
end;

procedure TFRPRI.sbOrdemCompraClick(Sender: TObject);
begin
  if OrdemdeCompra1.Visible then
    OrdemdeCompra1Click(self)
  else
    ShowMessage('Seu Perfil de Usuário não está habilitado!');
end;

procedure TFRPRI.sbRelatVendasClick(Sender: TObject);
begin
  if VendasPadroSimplificada1.Visible then
    VendasPadroSimplificada1Click(self)
  else
    ShowMessage('Seu Perfil de Usuário não está habilitado!');
end;

procedure TFRPRI.sbRelatComissoesClick(Sender: TObject);
begin
  if Detalhado1.Visible then
    Detalhado1Click(self);
end;

procedure TFRPRI.FormShow(Sender: TObject);
var
  caminho: string;
var
  AtuBD: TAtuBD;
begin
  Habilita_Consultas := True;
  if dao.CN.params.values['server'] = '200.180.91.99:3050' then
    DesabilitaTimers;

  // SBABRIRCLICK(SELF);

  fm_splash.show;
  fm_splash.ggProgress.Progress := 80;
  fm_splash.lbStatus.Caption := 'Ativando Configurações...';
  fm_splash.Refresh;
  sleep(100);
  ativa_configuracao;

  checar_veiculo := DM.q_configuracao.fieldbyname('CHECAR_REVISAO_VEICULO').AsString = 'S';
  versao_banco := DM.q_configuracao.fieldbyname('VERSAO').AsString;

  if versao_banco <> versao then
    AtuBD.ExecAtualizaBD;

  TBlobField(DM.q_configuracao.fieldbyname('LOGO')).SaveToFile('principal.bmp');

  // LiberarPedidoGeral;

  area_atuacao := DM.q_configuracao.fieldbyname('area_atuacao').AsString;
  dao.Geral1('select homepage, fone from empresa where tipo = ' +
    QuotedStr('1'));
  home_page := dao.Q1.fieldbyname('homepage').AsString;
  SB.Panels[0].Text := '       ' + home_page;
  TipUsu := Tipo_usuario;

  if TipUsu = '0' then
  begin
    Representante_id := Representante_usuario;
    dao.geral2('select supervisor from representante where id = ' +
      Representante_id);
    if dao.Q2.fieldbyname('supervisor').AsString = 'S' then
      supervisor := True
    else
      supervisor := False;
  end;

  if Tipo_usuario = '0' then
    SB.Panels[1].Text := nom_usuario + ' - Representante'
  else if Tipo_usuario = '1' then
    SB.Panels[1].Text := nom_usuario + ' - Balcão'
  else if Tipo_usuario = '2' then
    SB.Panels[1].Text := nom_usuario + ' - Faturamento'
  else if Tipo_usuario = '3' then
    SB.Panels[1].Text := nom_usuario + ' - Financeiro'
  else if Tipo_usuario = '4' then
    SB.Panels[1].Text := nom_usuario + ' - Administrador'
  else if Tipo_usuario = '5' then
    SB.Panels[1].Text := nom_usuario + ' - Master';

  SB.Panels[2].Text := TimeToStr(Time);
//  configura_ftp(cod_empresa);

  SB.Panels[3].Text := 'Versão: ' + versao;

  SB.Panels[6].Text := dao.NomeBanco;

  habilitaCamposAreaAtuacao(area_atuacao);

  if Representante_usuario <> '' then
  begin
    dao.geral2('select funcionario from representante where id = ' +
      Representante_usuario);
    TeleVendas := 4 = dao.Q2.fieldbyname('funcionario').AsInteger;
    Representante_id := Representante_usuario;
  end
  else
    TeleVendas := False;

  fm_splash.show;
  fm_splash.ggProgress.Progress := 90;
  fm_splash.lbStatus.Caption := 'Carregando Menu...';
  fm_splash.Refresh;
  sleep(100);
  Carrega_configuracao;

  EnviarPedidos.Visible := sbTransmissao.Visible;
  sbEnviarPedidos.Visible := sbTransmissao.Visible;

  TreeView_Menu;
  dao.Geral1
    ('select FTP_NFE_HOST, FTP_NFE_USUARIO, FTP_NFE_SENHA, FTP_TABLET_HOST, FTP_TABLET_USER, FTP_TABLET_SENHA, FTP_TABLET_PORTA, caminho_cod_barras from configuracao where cod_conf='
    + QuotedStr('1'));
  caminho_imp_cod_barras := dao.Q1.fieldbyname('caminho_cod_barras').AsString;
  DM.ftpPedidosTablet.Host := dao.Q1.fieldbyname('FTP_TABLET_HOST').AsString;
  DM.ftpPedidosTablet.Username := dao.Q1.fieldbyname('FTP_TABLET_USER').AsString;
  DM.ftpPedidosTablet.Password := dao.Q1.fieldbyname('FTP_TABLET_SENHA').AsString;
  DM.ftpPedidosTablet.Port := dao.Q1.fieldbyname('FTP_TABLET_PORTA').AsInteger;


  DM.FTPNFe.Host := dao.Q1.fieldbyname('FTP_NFE_HOST').AsString;
  DM.FTPNFe.Username := dao.Q1.fieldbyname('FTP_NFE_USUARIO').AsString;
  DM.FTPNFe.Password := dao.Q1.fieldbyname('FTP_NFE_SENHA').AsString;

  fm_splash.show;
  fm_splash.ggProgress.Progress := 100;
  fm_splash.lbStatus.Caption := 'Abrindo Sistema...';
  fm_splash.Refresh;
  sleep(100);

  { fm_splash.close;
    fm_splash.free;
  }
  // Informações da Atualização...
  caminho := ExtractFilePath(Application.ExeName);
  {
  if TipUsu > '1' then
  begin
    if FileExists(caminho + 'InfoAtu.html') then
    begin
      try
        Application.CreateForm(TfmInfoAtu, fmInfoAtu);
        fmInfoAtu.ShowModal;
      finally
        fmInfoAtu.Free;
      end;
    end;
  end;
  }
  Carrega_configuracao;

  if dao.CN.params.values['server'] <> '172.16.1.250' then
    DesabilitaTimers;
  { else
    AvisoEstoqueMinimoDiario; }

  Configura_Email(cod_empresa);

  ReiniciaTmUpdate := True;
  ReiniciaTmPedidoVendedor := True;
  ReiniciaTmPedidoPalm := True;
  ReiniciaTmCheckMalaDireta := True;
  ReiniciaTmContaVencida := True;

  HabilitaTimers;

  fm_splash.close;
  fm_splash.lbStatus.Caption := 'Fechando Sistema...';

  desativa_configuracao;

  { if Tipo_usuario >= '3' then
    Avisos1Click(Self); }
  OcultaBotoes;

  cliente_pre.Visible := modulo_vendedor;

  if modulo_vendedor and representacao then
    ImprimirVisitas(Representante_usuario);

  MenuCarregado := True;



end;

procedure TFRPRI.HabilitaTimers;
begin
  if ReiniciaTmUpdate then
  begin
    TmUpdate.Interval := 10000;
    TmUpdate.Enabled := True;
  end;

  if ReiniciaTmPedidoVendedor then
  begin
    // TmPedidoVendedor.Interval := 15000;
    TmPedidoVendedor.Enabled := True;
  end;

  if ReiniciaTmPedidoPalm then
  begin
    // TmPedidoPalm.Interval := 2000;
    TmPedidoPalm.Enabled := True;
  end;

  if ReiniciaTmContaVencida then
  begin
    TmContaVencida.Interval := 50000;
    TmContaVencida.Enabled := True;
  end;
end;

procedure TFRPRI.DesabilitaTimers;
begin
  //TmUpdate.Enabled := False;
  TmPedidoVendedor.Enabled := False;
  TmPedidoPalm.Enabled := False;
  TmContaVencida.Enabled := False;
end;

procedure TFRPRI.ContasaReceber1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_contas_receber, fr_contas_receber);
	SetaAcesso(fr_contas_receber.Caption);
    fr_contas_receber.ShowModal;
  finally
    fr_contas_receber.Free;
  end;
end;

procedure TFRPRI.Contasapagar1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_contas_pagar, Fr_contas_pagar);
	SetaAcesso(Fr_contas_pagar.Caption);
    Fr_contas_pagar.ShowModal;
  finally
    Fr_contas_pagar.Free;
  end;
end;

procedure TFRPRI.AcertodeEstoque1Click(Sender: TObject);
begin
  //
end;

procedure TFRPRI.PosiodeEstoque1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'relatorio_estoque_simples';
	SetaAcesso('relatorio_estoque_simples');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.PosiodeEstoquecomCusto1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'relatorio_estoque_custo';
	SetaAcesso('relatorio_estoque_custo');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.PosiodeEstoquecomPreodeVenda1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'relatorio_estoque_completo';
	SetaAcesso('relatorio_estoque_completo');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;

end;

procedure TFRPRI.AvisoContaPagarVencida;
begin
  dao.Geral3
    ('SELECT count(a.ID) conta_aberto FROM CP1 a where a.DTAVEN < current_date + 1 and a.DTAPAG is null');
  if (dao.Q3.RecordCount > 0) then
  begin
    TmContaVencida.Enabled := False;
    if MessageDlg
      ('Há Contas à Pagar (Vencidas ou à vencer amanhã.) em aberto. Desejas visualizar?',
      mtConfirmation, [mbyes, mbno], 0) = mryes then
    begin
      try
        Application.CreateForm(TFr_contas_pagar, Fr_contas_pagar);
        Fr_contas_pagar.aviso_vencido := True;
        Fr_contas_pagar.ShowModal;
      finally
        Fr_contas_pagar.Free;
      end;
    end;
    TmContaVencida.Enabled := False;
    ReiniciaTmContaVencida := False;
  end;
end;

procedure TFRPRI.AvisoContasVencidasDiario;
begin
  try
    dao.Geral3
      ('SELECT AVISO_CONTA_VENCIDA FROM CONFIGURACAO where AVISO_CONTA_VENCIDA <= current_date');
    if (dao.Q3.RecordCount > 0) then
      AvisoContasVencidas;
    try
      if not dao.cn.InTransaction then
        dao.cn.StartTransaction;
      dao.execsql
        ('UPDATE CONFIGURACAO SET AVISO_CONTA_VENCIDA = current_date+1');
      dao.cn.Commit;
    except
      dao.cn.Rollback;
    end;
  finally
    dao.Q3.close;
  end;
end;

procedure TFRPRI.AvisoEstoqueMinimoDiario;
begin
  try
    dao.Geral3
      ('SELECT AVISO_ESTOQUE FROM CONFIGURACAO where aviso_estoque <= current_date');
    if (dao.Q3.RecordCount > 0) then
      AvisoEstoqueMinimo;
    try
      if not dao.cn.InTransaction then
        dao.cn.StartTransaction;
      dao.execsql('UPDATE CONFIGURACAO SET AVISO_ESTOQUE = current_date+1');
      dao.cn.Commit;
    except
      dao.cn.Rollback;
    end;
  finally
    dao.Q3.close;
  end;
end;

procedure TFRPRI.ImprimirVisitas(rep: string);
var
  cmd: string;
  oExportfilter: TfrxCustomExportFilter;
begin
  try
    path := ExtractFilePath(Application.ExeName);
    cmd := 'SELECT a.COD_CLIENTE, a.NOM_CLIENTE, a.PERIODO_FREQUENCIA_VISITAS, cast(coalesce(a.ULTIMA_FREQUENCIA, ''2015-01-01'') as date) as ultima_frequencia, '
      + ' R.ID||''-''||R.NOM_REPRESENTANTE AS REPRESENTANTE ' +
      'FROM CLIENTE a ' +
      'INNER JOIN REPRESENTANTE R ON R.ID = A.ID_REPRESENTANTE ' + 'where ' +
      '  a.CLIENTE_BLOQUEADO <> ''S'' and ' +
      '  (a.ULTIMA_FREQUENCIA+cast(a.PERIODO_FREQUENCIA_VISITAS as integer)) < current_date and '
      + '  a.id_representante = ' + rep + ' ' + 'ORDER BY ' +
      '  REPRESENTANTE, ULTIMA_FREQUENCIA DESC, NOM_CLIENTE';

    with DM.q_clientes_visitas do
    begin
      close;
      sql.Clear;
      sql.Add(cmd);
      open;
    end;
    if DM.q_clientes_visitas.IsEmpty then
      Exit;

    frxReport1.LoadFromFile(path + 'Relatorios\clientes_visitas.fr3');
    frxReport1.PrepareReport(True);
    frxReport1.ShowReport;
  except
    on E: Exception do
    begin
      Exception.Create(E.Message);
{      dao.envia_email_suporte(E.Message + #13 + 'Data: ' +
        formatdatetime('dd/mm/yyyy', now) + #13 + 'Usuario Logado:' +
        nom_usuario + #13 + 'Máquina:' + FMFUN.computador, 'Erro ORBI',
        'informatica@plasfan.ind.br', '', '', '');}
    end;
  end;
end;

procedure TFRPRI.EnvioEmailPedidos(pedido: string);
var
  assunto_email: string;

  procedure ImprimirPedido(numped: string);
  var
    cmd: string;
    oExportfilter: TfrxCustomExportFilter;
  begin
    try
      path := ExtractFilePath(Application.ExeName);
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
      ' inner join vendas1 vd1 on vd1.nr_pedido_palm = v1.nr_pedido_palm ' +
      ' LEFT OUTER join CLIENTE c on (c.COD_CLIENTE = v1.COD_CLIENTE)' +
      ' LEFT OUTER join Cidades cid on (cid.COD_Cidade = c.COD_cidade)' +
      ' LEFT OUTER join REPRESENTANTE r on (r.id = v1.COD_REPRESENTANTE)' +
      ' LEFT OUTER join prazo p on (p.ID = v1.COD_PRAZO_PGTO) ' +
      ' LEFT OUTER join fop f on (f.COD_FOP = v1.COD_FOP) ' +
      ' LEFT OUTER join produto pr on (pr.COD_PRODUTO = v2.COD_PRODUTO) WHERE 1 = 1 '+
      'v1.numdoc = ' + numped;

      cmd := cmd +
        ' order by  representante, NR_CONEXAO, v1.NUMDOC, v2.COD_PRODUTO, v2.VOLUME ';

      with DM.q_palm_pedidos do
      begin
        close;
        sql.Clear;
        sql.Add(cmd);
        open;
      end;

      frxReport1.LoadFromFile
        (path + 'Relatorios\pedido_sem_st_sem_desconto.fr3');
      frxReport1.PrepareReport(True);
      oExportfilter := TfrxCustomExportFilter(frxPDFExport1);
      oExportfilter.ShowDialog := False;
      oExportfilter.FileName := 'Pedido_' + numped + '.pdf';
      frxReport1.Export(oExportfilter);
    except
      on E: Exception do
      begin
        Exception.Create(E.Message);
{        dao.envia_email_suporte(E.Message + #13 + 'Data: ' +
          formatdatetime('dd/mm/yyyy', now) + #13 + 'Usuario Logado:' +
          nom_usuario + #13 + 'Máquina:' + FMFUN.computador, 'Erro ORBI',
          'informatica@plasfan.ind.br', '', '', '');}
      end;
    end;
  end;

  procedure EnviaEmailPedido(emp_nome, emp_hp, emp_fone, email_cliente, CC1,
    CC2, CC3, assunto, pdf: string);
  var
    corpo_email, assunto_email: string;
    EmailPedido: TEmail;
  begin
    corpo_email := '<html><body> ' +
      '  <font face="Consolas" size="2">Segue em anexo os dados do Pedido.</font><br><br> '
      + '  <font face="Consolas" size="2">Informações: ' + emp_fone +
      '</font><br> ' + '  <font face="Consolas" size="2">' + emp_hp +
      '</font><br><br>' + '  <img src="cid:123456"><br>' + '</body></html> ';
    try
      Application.CreateForm(TFr_email_envio, Fr_email_envio);
      Fr_email_envio.lbResultado.Caption :=
        'Enviando Email de Pedido ao Cliente...';

      if FMFUN.BuscaAmbienteNFE = taHomologacao then
        EmailPedido := TEmail.Create(corpo_email, 'Teste', '', '', '', '',
          '', pdf, '')
      else
        EmailPedido := TEmail.Create(corpo_email, assunto, email_cliente, CC1,
          CC2, CC3, '', pdf, '');

      Fr_email_envio.ShowModal;
    finally
      Fr_email_envio.Free;
    end;
  end;

begin
  ImprimirPedido(pedido);

  dao.Geral1(' SELECT   ' + '   V1.NUMDOC, ' + '   E.NOM_EMPRESA, ' +
    '   E.HOMEPAGE, ' + '   E.FONE, ' + '   C.EMAIL,   ' +
    '   C.EMAIL_ADICIONAL1, ' + '   C.EMAIL_ADICIONAL2, ' +
    '   C.EMAIL_ADICIONAL3, ' + '   C.NOM_CLIENTE ' + ' FROM ' +
    '   VENDAS1 V1 ' +
    ' INNER JOIN EMPRESA E ON V1.EMPRESA_FATURAR = E.COD_EMPRESA ' +
    ' INNER JOIN CLIENTE C ON V1.COD_CLIENTE = C.COD_CLIENTE ' +
    ' WHERE V1.numdoc = ' + pedido);

  nom_empresa := dao.Q1.fieldbyname('NOM_EMPRESA').AsString;

  if not dao.Q1.fieldbyname('EMAIL').IsNull then
  begin
    try
      assunto_email := dao.Q1.fieldbyname('NOM_EMPRESA').AsString +
        ' - PEDIDO  N°: ' + pedido;
      EnviaEmailPedido(dao.Q1.fieldbyname('NOM_EMPRESA').AsString,
        dao.Q1.fieldbyname('HOMEPAGE').AsString, dao.Q1.fieldbyname('FONE')
        .AsString, dao.Q1.fieldbyname('EMAIL').AsString,
        dao.Q1.fieldbyname('EMAIL_ADICIONAL1').AsString,
        dao.Q1.fieldbyname('EMAIL_ADICIONAL2').AsString,
        dao.Q1.fieldbyname('EMAIL_ADICIONAL3').AsString, assunto_email,
        'Pedido_' + dao.Q1.fieldbyname('NUMDOC').AsString + '.pdf');
    finally
      dao.Q1.close;
    end;
  end;
end;

function TFRPRI.EnvioEmailNFE(pedido, tipo: string): string;
var
  pathSaida, arquivoPDF, arquivoNFe, nome_logo, anexosPDF, boletoPDF, formaPagto: string;
  nomEmpresa, emailCliente, emailAdicional1, emailAdicional2, emailAdicional3, numeroNFe: string;
  final, count: Integer;
  F: TSearchRec;
  Ret: Integer;
  RecNFe: Tnferecxml;

  procedure ExecSqlEmailNFe(const ACmd: string);
  begin
    if Trim(ACmd) = '' then
      Exit;
    with dao.Exec_sql do
    begin
      Prepared := False;
      Close;
      SQL.Clear;
      SQL.Add(ACmd);
      ExecSQL;
    end;
  end;
begin

  pathSaida := ExtractFilePath(Application.ExeName) + 'nf\';
  Ret := FindFirst(pathSaida + '*.xml', faAnyFile, F);
  while Ret = 0 do
  begin
    DeleteFile(pathSaida + F.name);
    Ret := FindNext(F);
  end;

  Ret := FindFirst(pathSaida + '*.pdf', faAnyFile, F);
  while Ret = 0 do
  begin
    DeleteFile(pathSaida + F.name);
    Ret := FindNext(F);
  end;
  if dao.cn.InTransaction then
    dao.cn.Rollback;

  try
    dao.cn.StartTransaction;
    qr_nfe_email.Close;
    qr_nfe_email.ParamByName('numdoc').Value := pedido;
    qr_nfe_email.Open;

    count := 1;
    final := qr_nfe_email.RecordCount;
  {
  try
    DM.FTPNFe.Connect;
    if DM.FTPNFe.Connected then
    begin
      // transfere um arquivo texto
      DM.FTPNFe.TransferType := ftASCII;

      DM.FTPNFe.get(arquivoNFe, pathSaida + arquivoNFe);
      DM.FTPNFe.Quit;
    end;
  except
    DM.FTPNFe.Quit;
    // ShowMessage('Erro ao carregar Arquivo no FTP...');
    DeleteFile(pathSaida + arquivoNFe);
    Result := '2';
    RecNFe := Tnferecxml.Create(qr_nfe_email.fieldbyname('nfe').AsInteger,
      qr_nfe_email.fieldbyname('NUMDOC').AsInteger,
      qr_nfe_email.fieldbyname('COD_EMPRESA').AsInteger,
      qr_nfe_email.fieldbyname('CHAVE_NFE').AsString);
    Exit;
  end;
  }
  if qr_nfe_email.IsEmpty then
  begin
    qr_nfe_email.Close;
    dao.cn.Commit;
    Result := '2';
    Exit;
  end;

  cod_empresa := qr_nfe_email.fieldbyname('COD_EMPRESA').AsString;
  nomEmpresa := qr_nfe_email.fieldbyname('nom_empresa').AsString;
  emailCliente := qr_nfe_email.fieldbyname('EMAIL').AsString;
  emailAdicional1 := qr_nfe_email.fieldbyname('EMAIL_ADICIONAL1').AsString;
  emailAdicional2 := qr_nfe_email.fieldbyname('EMAIL_ADICIONAL2').AsString;
  emailAdicional3 := qr_nfe_email.fieldbyname('EMAIL_ADICIONAL3').AsString;
  numeroNFe := qr_nfe_email.fieldbyname('NFE').AsString;
  nome_logo := nomEmpresa + '.bmp';
  arquivoNFe := qr_nfe_email.fieldbyname('CHAVE_NFE').AsString + '-procNFe.xml';
  arquivoPDF := qr_nfe_email.fieldbyname('CHAVE_NFE').AsString + '-nfe.pdf';

  if tipo <> 'Entrada' then
    TBlobField(qr_nfe_email.fieldbyname('XML')).SAVETOFILE(pathSaida + arquivoNFe)
  else
    TBlobField(qr_nfe_email.fieldbyname('XML_DEV')).SAVETOFILE(pathSaida + arquivoNFe);

  qr_nfe_email.Close;
  dao.cn.Commit;
  except
    if dao.cn.InTransaction then
      dao.cn.Rollback;
    raise;
  end;

  ACBrNFe1.NotasFiscais.Clear;
  // ACBrNFe1.DANFE.Impressora := fmfun.BuscaImpressoraPadrao;

  ACBrNFe1.NotasFiscais.LoadFromFile(pathSaida + arquivoNFe);
  ACBrNFe1.DANFE.PathPDF := pathSaida;

  ACBrNFe1.DANFE.Logo := ExtractFilePath(Application.ExeName) + nome_logo;
  ACBrNFeDANFEFR1.fastfile := ExtractFilePath(Application.ExeName) +'Relatorios\Danfe.fr3';
  ACBrNFe1.DANFE.ImprimirDANFEPDF();

  if not FileExists(pathSaida + arquivoPDF) then
  begin
    Result := '2';
    Exit;
  end;

  anexosPDF := pathSaida + arquivoPDF;
  formaPagto := '';
  try
    if dao.cn.InTransaction then
      dao.cn.Rollback;
    dao.cn.StartTransaction;
    dao.Geral2('select coalesce(f.NOM_FOP, '''') as NOM_FOP from VENDAS1 v left join FOP f on f.COD_FOP = v.COD_FOP where v.NUMDOC = ' + pedido);
    if (not dao.Q2.IsEmpty) and (not dao.Q2.FieldByName('NOM_FOP').IsNull) then
      formaPagto := UpperCase(Trim(dao.Q2.FieldByName('NOM_FOP').AsString));
    dao.Q2.Close;
    dao.cn.Commit;
  except
    if dao.cn.InTransaction then
      dao.cn.Rollback;
    formaPagto := '';
  end;

  if Pos('BOLETO', formaPagto) > 0 then
  begin
    boletoPDF := pathSaida + 'boleto_' + pedido + '.pdf';
    if FileExists(boletoPDF) then
      DeleteFile(boletoPDF);

    if Assigned(Fr_vendas_industria2) then
    begin
      if Trim(Fr_vendas_industria2.Prnumdoc.Text) <> pedido then
      begin
        Fr_vendas_industria2.Prnumdoc.Text := pedido;
        Fr_vendas_industria2.CarregaDados;
      end;

      if (Trim(Fr_vendas_industria2.PrCONTA_BOLETO.Text) <> '') and
         Fr_vendas_industria2.q_cr1.Active and
         (not Fr_vendas_industria2.q_cr1.IsEmpty) then
      begin
        Fr_vendas_industria2.MontaArquivoCobrancaEnvio;
        FMFUN.ACBrBoletoFCFR1.FastReportFile := ExtractFilePath(Application.ExeName) + 'Relatorios\Boleto.fr3';
        FMFUN.ACBrBoletoFCFR1.DirLogo := ExtractFilePath(Application.ExeName) + 'Logos\colorido\';
        FMFUN.ACBrBoletoFCFR1.NomeArquivo := boletoPDF;
        FMFUN.ACBrBoleto1.GerarPDF;
      end;
    end;

    if FileExists(boletoPDF) then
      anexosPDF := anexosPDF + ';' + boletoPDF;
  end;
  try
   if FMFUN.BuscaAmbienteNFE = taHomologacao then
    begin
      EnviaArquivoNFe(nomEmpresa,
        '',
        '', 'cltomasi@gmail.com',
        numeroNFe, pathSaida + arquivoNFe,
        anexosPDF, '', '', '', count, final);
    end
    else
    begin
      EnviaArquivoNFe(nomEmpresa,
        '',
        '',
        emailCliente,
        numeroNFe, pathSaida + arquivoNFe,
        anexosPDF, emailAdicional1, emailAdicional2,
        emailAdicional3, count, final);
    end;
  except
    DM.FTPNFe.Quit;
    Result := '3';
    Exit;
  end;
  DeleteFile(pathSaida + arquivoPDF);
  DeleteFile(pathSaida + arquivoNFe);

  try
    if dao.cn.InTransaction then
      dao.cn.Rollback;
    dao.cn.StartTransaction;
    ExecSqlEmailNFe('UPDATE vendas1 SET EMAIL_NFE = 1 WHERE NUMDOC = ' + pedido);
    dao.cn.Commit;
  except
    if dao.cn.InTransaction then
      dao.cn.Rollback;
    raise;
  end;
  count := count + 1;
  Result := '1';

  qr_nfe_email.Close;

end;

procedure TFRPRI.AvisoContasVencidas;
var
  corpo_email, sqlconta, assunto_email, destinatario: string;
  EmailAviso: TEmail;

begin
  sqlconta := 'SELECT ' +
    '  coalesce(a.COD_FORNECEDOR||''-''||f.RAZAO_SOCIAL, '''') as FORNECEDOR, '
    + '  trim(a.TITULO)||''-''||a.SEQUENCIA as titulo, ' + '  a.DTAVEN, ' +
    '  a.VALOR, ' +
    '  coalesce(a.COD_FOP||''-''||fp.NOM_FOP,'''') as forma_pagto, ' +
    '  coalesce(a.COD_REPRESENTANTE||''-''||r.NOM_REPRESENTANTE, '''') as funcionario, '
    + '  cast(a.HISTORICO1 as varchar(500)) as historico ' + 'FROM CP1 a ' +
    'left outer join FORNECEDOR f on f.COD_FORNECEDOR = a.COD_FORNECEDOR ' +
    'left outer join fop fp on fp.COD_FOP = a.COD_FOP ' +
    'left outer join REPRESENTANTE r on r.id = a.COD_REPRESENTANTE ' +
    'where a.DTAVEN < current_date and a.DTAPAG is null ORDER BY DTAVEN';

  assunto_email := 'ORBI - Lista de Contas Vencidas - ' +
    formatdatetime('dd/mm/yyyy', now) + '. [Não responder]';

  dao.geral2(sqlconta);
  if dao.Q2.IsEmpty then
    Exit;
  corpo_email := '<html><body> ' + '  <img src="cid:123456"><br> ' +
    '  <font face="Consolas" size="4">Lista de Contas Vencidas</font> ' +
    '  <table> ' +
    '    <tr><td align="left"><font face="Consolas" size="3"><b>Fornecedor</b></font></td>'
    + '<td align="right"><font face="Consolas" size="3"><b>Título</b></font></td>'
    + '<td align="right"><font face="Consolas" size="3"><b>Vencto</b></font></td>'
    + '<td align="right"><font face="Consolas" size="3"><b>Valor</b></font></td> '
    + '<td align="right"><font face="Consolas" size="3"><b>F.Pgto</b></font></td>'
    + '<td align="right"><font face="Consolas" size="3"><b>Func.</b></font></td>'
    + '<td align="right"><font face="Consolas" size="3"><b>Hitórico</b></font></td></tr> ';
  dao.Q2.First;
  while not dao.Q2.Eof do
  begin
    corpo_email := corpo_email + '<tr>' +
      '<td align="left"><font face="Consolas" size="2"><u>' +
      stringreplace(dao.Q2.fieldbyname('FORNECEDOR').AsString, '"', '',
      [rfReplaceAll]) + '</u></font></td>' +
      '<td align="center"><font face="Consolas" size="2"><u>' +
      stringreplace(dao.Q2.fieldbyname('titulo').AsString, '"', '',
      [rfReplaceAll]) + '</u></font></td>' +
      '<td align="center"><font face="Consolas" size="2"><u>' +
      formatdatetime('dd/mm/yyyy', dao.Q2.fieldbyname('DTAVEN').AsDateTime) +
      '</u></font></td>' +
      '<td align="right"><font face="Consolas" size="2"><u>' +
      formatfloat('#,###,##0.00', dao.Q2.fieldbyname('VALOR').AsFloat) +
      '</u></font></td>' + '<td align="left"><font face="Consolas" size="2"><u>'
      + stringreplace(dao.Q2.fieldbyname('forma_pagto').AsString, '"', '',
      [rfReplaceAll]) + '</u></font></td>' +
      '<td align="left"><font face="Consolas" size="2"><u>' +
      stringreplace(dao.Q2.fieldbyname('funcionario').AsString, '"', '',
      [rfReplaceAll]) + '</u></font></td>' +
      '<td align="left"><font face="Consolas" size="2"><u>' +
      stringreplace(dao.Q2.fieldbyname('historico').AsString, '"', '',
      [rfReplaceAll]) + '</u></font></td>' + '</tr> ';
    dao.Q2.Next;
  end;

  dao.Geral3('SELECT AVISO_CONTA_VENCIDA_EMAIL FROM CONFIGURACAO ');

  destinatario := dao.Q3.fieldbyname('AVISO_CONTA_VENCIDA_EMAIL').AsString;

  corpo_email := corpo_email + '  </table> ' + '</body></html> ';

  EmailAviso := TEmail.Create(corpo_email, assunto_email, '', '', '', '',
    '' + destinatario);

  try
    Application.CreateForm(TFr_email_envio, Fr_email_envio);
    Fr_email_envio.lbResultado.Caption :=
      'Enviando Email de Aviso de Contas Vencidas...';
    Fr_email_envio.ShowModal;
  finally
    Fr_email_envio.Free;
  end;

end;

procedure TFRPRI.AvisoEstoqueMinimo(produto: string = '');
var
  corpo_email, sqlestoque, assunto_email, destinatario: string;
  EmailAviso: TEmail;

begin
  sqlestoque := ' select ' + '  cod_produto||''-''||Nom_produto as produto, ' +
    '  qtd_estoque, ' + '  qtd_reservado, ' + '  estoque_minimo, ' +
    '  estoque_maximo ' + 'from ' + '  PRODUTO ' + 'where ' + ' status = ''N'' '
    + ' and qtd_estoque <= (estoque_minimo + qtd_reservado) ';

  if produto <> '' then
  begin
    sqlestoque := sqlestoque + ' and cod_produto = ' + produto;
    assunto_email :=
      'ORBI - Lista de Produtos Abaixo do Estoque Mínimo - Individual.[Não responder]';
  end
  else
    assunto_email :=
      'ORBI - Lista de Produtos Abaixo do Estoque Mínimo - Geral -  ' +
      formatdatetime('dd/mm/yyyy', now) + '. [Não responder]';

  sqlestoque := sqlestoque + ' order by cod_produto  ';

  dao.geral2(sqlestoque);
  if dao.Q2.IsEmpty then
    Exit;
  corpo_email := '<html><body> ' + '  <img src="cid:123456"><br> ' +
    '  <font face="Consolas" size="4">Lista de Produtos abaixo do Estoque Mínimo</font> '
    + '  <table> ' +
    '    <tr><td align="left"><font face="Consolas" size="3"><b>Produto</b></font></td>'
    + '<td align="right"><font face="Consolas" size="3"><b>Reservado</b></font></td>'
    + '<td align="right"><font face="Consolas" size="3"><b>Estoque</b></font></td>'
    + '<td align="right"><font face="Consolas" size="3"><b>Mínimo</b></font></td> '
    + '<td align="right"><font face="Consolas" size="3"><b>Máximo</b></font></td></tr> ';
  dao.Q2.First;
  while not dao.Q2.Eof do
  begin
    corpo_email := corpo_email +
      '    <tr><td align="left"><font face="Consolas" size="2"><u>' +
      stringreplace(dao.Q2.fieldbyname('produto').AsString, '"', '',
      [rfReplaceAll]) +
      '</u></font></td><td align="center"><font face="Consolas" size="2"><u>' +
      formatfloat('#,###,##0.00', dao.Q2.fieldbyname('qtd_reservado').AsFloat) +
      '</u></font></td><td align="center"><font face="Consolas" size="2"><u>' +
      formatfloat('#,###,##0.00', dao.Q2.fieldbyname('qtd_estoque').AsFloat) +
      '</u></font></td><td align="center"><font face="Consolas" size="2"><u>' +
      formatfloat('#,###,##0.00', dao.Q2.fieldbyname('estoque_minimo').AsFloat)
      + '</u></font></td><td align="center"><font face="Consolas" size="2"><u>'
      + formatfloat('#,###,##0.00', dao.Q2.fieldbyname('estoque_maximo')
      .AsFloat) + '</u></font></td></tr> ';
    dao.Q2.Next;
  end;

  dao.Geral3('SELECT AVISO_ESTOQUE_MINIMO_EMAIL FROM CONFIGURACAO ');

  destinatario := dao.Q3.fieldbyname('AVISO_ESTOQUE_MINIMO_EMAIL').AsString;

  corpo_email := corpo_email + '  </table> ' + '</body></html> ';

  if dao.CN.params.values['database'] = 'C:\orbi\trunk\dados\orbi.fdb' then
    EmailAviso := TEmail.Create(corpo_email, 'Teste', '', '', '', '',
      '')
  else
    EmailAviso := TEmail.Create(corpo_email, assunto_email, '', '', '', '',
      '' + destinatario);

  try
    Application.CreateForm(TFr_email_envio, Fr_email_envio);
    Fr_email_envio.lbResultado.Caption :=
      'Enviando Email de Aviso de Produtos Abaixo do Estoque Mínimo...';
    Fr_email_envio.ShowModal;
  finally
    Fr_email_envio.Free;
  end;

end;

procedure TFRPRI.AvisoAniversariantes;
var
  corpo_email, sqlaniversario, assunto_email: string;
  EmailAviso: TEmail;

begin
  sqlaniversario := ' SELECT COD_CLIENTE, CONTATO, DATA ' + ' from ' + ' (    '
    + '   SELECT a.COD_CLIENTE, a.NOM_CLIENTE AS CONTATO, a.DTA_ANIVERSARIO AS DATA '
    + '   FROM CLIENTE a ' +
    '   WHERE A.TIP_PESSOA = ''F'' AND TRIM(A.DTA_ANIVERSARIO) <> ''/'' ' +
    '         and a.DTA_ANIVERSARIO is not null ' + '   UNION ' +
    '   SELECT B.COD_CLIENTE, B.CONTATO||''-''||B.NOM_CLIENTE AS CONTATO, B.DTA_ANIVERSARIO_CONTATO AS DATA '
    + '   FROM CLIENTE B ' +
    '   WHERE B.TIP_PESSOA = ''J'' AND TRIM(B.DTA_ANIVERSARIO_CONTATO) <> ''/'' '
    + '         and b.DTA_ANIVERSARIO_CONTATO is not null ' + '   ) ' +
    '   WHERE ' +
    '   extract(month from (CAST(TRIM(replace(data, ''/'', ''.''))||''.''||EXTRACT(YEAR FROM current_DATE) AS DATE))) = extract(month from current_date) order by date ';

  assunto_email := 'Lista de Aniversariantes do Mês [Não responder]';

  dao.geral2(sqlaniversario);
  if dao.Q2.IsEmpty then
    Exit;
  corpo_email := '<html><body> ' + '  <img src="cid:123456"><br> ' +
    '  <font face="Consolas" size="4">Lista de Aniversariantes do Mês</font> ' +
    '  <table> ' +
    '    <tr><td align="left"><font face="Consolas" size="3"><b>Contato</b></font></td>'
    + '<td align="right"><font face="Consolas" size="3"><b>Data</b></font></td></tr> ';
  dao.Q2.First;
  while not dao.Q2.Eof do
  begin
    corpo_email := corpo_email +
      '    <tr><td align="left"><font face="Consolas" size="2"><u>' +
      stringreplace(dao.Q2.fieldbyname('data').AsString, '"', '', [rfReplaceAll]
      ) + '</u></font></td><td align="center"><font face="Consolas" size="2"><u>'
      + dao.Q2.fieldbyname('contato').AsString + '</u></font></td></tr> ';
    dao.Q2.Next;
  end;
  corpo_email := corpo_email + '  </table> ' + '</body></html> ';

  if dao.CN.params.values['database'] = 'C:\orbi\trunk\dados\orbi.fdb' then
    EmailAviso := TEmail.Create(corpo_email, 'Teste', '', '', '', '',
      '')
  else
    EmailAviso := TEmail.Create(corpo_email, assunto_email, '', '', '', '',
      '');

  try
    Application.CreateForm(TFr_email_envio, Fr_email_envio);
    Fr_email_envio.lbResultado.Caption :=
      'Enviando Email de Aviso de Aniversariantes..';
    Fr_email_envio.ShowModal;
  finally
    Fr_email_envio.Free;
  end;

end;

procedure TFRPRI.EnviaArquivoNFe(emp_nome, emp_hp, emp_fone, email_cliente, nfe,
  nfe_xml, nfe_pdf, CC1, CC2, CC3: string; count, final: Integer);
var
  corpo_email, assunto_email: string;
  EmailNFe: TEmail;

begin
  // if Fr_email_envio = nil then Application.CreateForm(TFr_email_envio, Fr_email_envio);
  Application.CreateForm(TFr_email_envio, Fr_email_envio);
  assunto_email := emp_nome + ' - Nota Fiscal Eletrônica N°: ' + nfe;
  nom_empresa := emp_nome;
    corpo_email :=
    '<html><body style="margin:0;padding:0;background:#ffffff;">' +
    '  <table width="100%" cellpadding="0" cellspacing="0" border="0">' +
    '    <tr><td align="center">' +
    '      <table width="640" cellpadding="0" cellspacing="0" border="0" style="font-family:Arial, sans-serif;color:#0a8f45;">' +
    '        <tr><td height="24"></td></tr>' +
    '        <tr><td align="center" style="padding:0 24px;font-size:20px;line-height:26px;color:#00a651;font-weight:bold;">' + emp_nome + '</td></tr>' +
    '        <tr><td height="8"></td></tr>' +    '        <tr><td align="center" style="padding:0 24px;">' +
    '          <img src="cid:logo_plasfan" width="160" height="160" alt="Plasfan" style="display:block;border:0;margin:0 auto 6px auto;" />' +
    '        </td></tr>' +
    '        <tr><td height="18"></td></tr>' +
    '        <tr><td align="center" style="padding:0 24px;font-size:16px;line-height:22px;color:#1f1f1f;">Prezado Cliente</td></tr>' +
    '        <tr><td height="8"></td></tr>' +
    '        <tr><td align="center" style="padding:0 24px;font-size:16px;line-height:22px;color:#1f1f1f;">Segue arquivos da NF-e em anexo.</td></tr>' +
    '        <tr><td height="10"></td></tr>' +
    '        <tr><td align="center" style="padding:0 24px;font-size:13px;line-height:18px;color:#4f4f4f;">' + emp_fone + '</td></tr>' +
    '        <tr><td align="center" style="padding:0 24px;font-size:13px;line-height:18px;color:#4f4f4f;">' + emp_hp + '</td></tr>' +
    '        <tr><td height="24"></td></tr>' +
    '      </table>' +
    '    </td></tr>' +
    '  </table>' +
    '</body></html>';

  if FMFUN.BuscaAmbienteNFE = taHomologacao then
    EmailNFe := TEmail.Create(corpo_email, 'Teste', 'cltomasi@gmail.com', '', '', '',
      '', nfe_xml, nfe_pdf)
  else
    EmailNFe := TEmail.Create(corpo_email, assunto_email, email_cliente, CC1,
      CC2, CC3, '',
      nfe_xml, nfe_pdf);

  try
    Fr_email_envio.lbResultado.Caption :=
      'Enviando Email de Nota Fiscal Eletrônica... De ' + inttostr(count) +
      ' até ' + inttostr(final);
    Fr_email_envio.ShowModal;
  finally
    Fr_email_envio.Free;
  end;

end;

procedure TFRPRI.envia_email(corpo, assunto, end1, end2, end3, CC, bCC: string);
var
  // registro: TRegistry;
  lista_endereco: string;
  tamstr: Integer;
  texto, Html: TIdText;
begin
  // if not(TestaConexao) then
  // exit;

  try
    { dao.Geral4('select nom_empresa, ema_email, ema_login, ema_senha, ema_porta, ema_smtp from empresa where cod_empresa = ' + QuotedStr(cod_empresa));

      IMmail.From.Name := dao.Q4.fieldbyname('nom_empresa').AsString;
      IMmail.From.Address := dao.Q4.fieldbyname('ema_email').AsString;
      ISMTPmail.Username := dao.Q4.fieldbyname('ema_login').AsString;
      ISMTPmail.Password := dao.Q4.fieldbyname('ema_senha').AsString;
      ISMTPmail.Port := dao.Q4.fieldbyname('ema_porta').AsInteger;
      ISMTPmail.Host := dao.Q4.fieldbyname('ema_smtp').AsString;
    }
    lista_endereco := '';
    IMmail.Recipients.Clear;
    if end1 <> '' then
      IMmail.Recipients.Add.Address := end1;
    if end2 <> '' then
      IMmail.Recipients.Add.Address := end2;
    if end3 <> '' then
      IMmail.Recipients.Add.Address := end3;

    IMmail.Subject := assunto;
    IMmail.CCList.Clear;
    if CC <> '' then
      IMmail.CCList.EMailAddresses := CC;

    if bCC <> '' then
      IMmail.BccList.EMailAddresses := bCC;

    IMmail.MessageParts.Clear;

    texto := TIdText.Create(IMmail.MessageParts);
    texto.ContentType := 'text/plain';
    texto.Body.Text := ' ';

    Html := TIdText.Create(IMmail.MessageParts);
    Html.ContentType := 'text/html';
    Html.Body.Add(corpo);

    if not ISMTPmail.Connected then
      ISMTPmail.Connect;

    ISMTPmail.Send(IMmail);

    ISMTPmail.disconnect;
  except
    on E: Exception do
    begin
      dao.msg('Houve um erro ao enviar o e-mail! ' + #13 + E.Message);
    end;
  end;

end;

procedure TFRPRI.A1Click(Sender: TObject);
begin
   try
    Application.CreateForm(TFmAlterarPreco, FmAlterarPreco);
	SetaAcesso(FmAlterarPreco.Caption);
    FmAlterarPreco.ShowModal;
  finally
    FmAlterarPreco.Free;
  end;
 end;

procedure TFRPRI.AbreExcel(var Modo: Variant; nome_arq: ShortString;
  opcao: Byte);
begin
  // PROCEDIMENTO PARA ABRIR DOCUMENTOS - (EM BRANCO / A PARTIR DE MODELOS)

  // opcao: 0 - Excel + Arquivo (em branco / modelo)
  // 1 - somente Excel
  // 2 - somente Arquivo (em branco / modelo)

  case opcao of
    0:
      begin
        Modo := CreateOleObject('Excel.Application');

        if nome_arq = '' then
          Modo.WorkBooks.Add
        else
          Modo.WorkBooks.open(nome_arq);
      end;
    1:
      Modo := CreateOleObject('Excel.Application');
    2:
      begin
        if nome_arq = '' then
          Modo.WorkBooks.Add
        else
          Modo.WorkBooks.open(nome_arq);
      end;
  end;

  // ex.: AbreExcel(Excel, '', 0);
end;

procedure TFRPRI.PrExcel(Modo: Variant; Tab, Lin, Col: Integer; texto: string);
begin
  // PROCEDIMENTO PARA PREENCHER CELULAS NO MICROSOFT EXCEL

  if (Lin > 0) and (Col > 0) then
    Modo.WorkBooks[1].Sheets[Tab].Cells[Lin, Col] := texto;

  // ex.: PrExcel(Excel, 1, 2, 2, 'Relatório de Clientes');
end;

procedure TFRPRI.MesclaCel(Modo: Variant; Tab: Integer; Intervalo: ShortString);
begin
  // PROCEDIMENTO PARA MESCLAR CELULA NO EXCEL

  Modo.WorkBooks[1].Sheets[Tab].Range[Intervalo].Merge;
  Modo.WorkBooks[1].Sheets[Tab].Range[Intervalo].VerticalAlignment := 2;
  // Centro da celula - vertical
  Modo.WorkBooks[1].Sheets[Tab].Range[Intervalo].HorizontalAlignment := 3;
  // Centro da celula - horizontal

  // ex.: MesclaCel(Excel, 1, 'A9:F9');
end;

procedure TFRPRI.CorCel(Modo: Variant; Tab, cor: Integer;
  Intervalo: ShortString);
begin
  // PROCEDIMENTO PARA MUDAR COR DA CELULA

  Modo.WorkBooks[1].Sheets[Tab].Range[Intervalo].Interior.Color := cor;

  // ex.: CorCel(Excel, 1, RGB(255, 0, 0),  'A9:I9');
end;

procedure TFRPRI.BordaCel(Modo: Variant; Tab: Integer; Intervalo: ShortString;
  Par1, Par2: Integer);
begin
  // PROCEDIMENTO PARA INSERIR BORDA NA CELULA

  Modo.WorkBooks[1].Sheets[Tab].Range[Intervalo].Style.IncludeBorder := True;
  Modo.WorkBooks[1].Sheets[Tab].Range[Intervalo].Borders.LineStyle := Par1;
  Modo.WorkBooks[1].Sheets[Tab].Range[Intervalo].Borders.Weight := Par2;

  // ex.: BordaCel(Excel, 1, 'A9:I9', 1, 3);
end;

procedure TFRPRI.BordaCelGeral(Modo: Variant; Tab: Integer;
  Intervalo: ShortString; Par1: Integer);
begin
  // PROCEDIMENTO PARA INSERIR BORDA EM UM INTERVALO

  // 1 - linha pontilhada
  // 2 - linha fina
  // 3 - linha grossa (ui, ui ...)
  // 4 - linha + grossa

  Modo.WorkBooks[1].Sheets[Tab].Range[Intervalo].BorderAround[Weight := Par1];

  // ex.: BordaCelGeral(Excel, 1, 'A9:I9', 4);
end;

procedure TFRPRI.FontCel(Modo: Variant; Tab, cor, tamanho, Negrito: Integer;
  Intervalo: ShortString);
begin
  // PROCEDIMENTO PARA FORMATAR FONTE DA CELULA

  Modo.WorkBooks[1].Sheets[Tab].Range[Intervalo].Font.ColorIndex := cor;
  Modo.WorkBooks[1].Sheets[Tab].Range[Intervalo].Font.Bold := (Negrito = 1);
  Modo.WorkBooks[1].Sheets[Tab].Range[Intervalo].Font.Size := tamanho;

  // ex.: FontCel(Excel, 1, 6, 14, 1, 'A9:I9');

  { OPCOES DE CORES (SOH ALGUMAS QUE EU ACHEI)
    1 preto       6 amarelo         11 azul escuro                         16 cinza escuro
    2 branco      7 rosa            12 amarelo esverdeado (bege, sei lah)  17 roxo claro
    3 vermelho    8 azul oceano     13 roxo                                18 marrom quase vermelho escuro
    4 verde       9 marrom          14 verde area de trabalho              19 amarelo nao se ve p** nenhuma
    5 azul        10 verde escuro   15 cinza claro                         20 azul o mesmo de cima
  }
end;

procedure TFRPRI.AlinhaCel(Modo: Variant; Tab: Integer; Intervalo: ShortString;
  PosVertical, PosHorizontal: Integer);
begin
  {
    PosVertical:
    1 = Superior
    2 = Centro
    3 = Inferior
    4 = Justificar

    PosHorizontal:
    1 = Geral
    2 = Esquerda
    3 = Centro
    4 = Direita
    5 = Preencher
    6 = Justificar
    7 = Centralizar seleção
  }

  // PROCEDIMENTO PARA CENTRALIZAR VALORES NAS CELULAS

  Modo.WorkBooks[1].Sheets[Tab].Range[Intervalo].VerticalAlignment :=
    PosVertical;
  Modo.WorkBooks[1].Sheets[Tab].Range[Intervalo].HorizontalAlignment :=
    PosHorizontal;

  // ex.: AlinhaCel(Excel, 1, 'A9:I9');
end;

procedure TFRPRI.ConfPagina(Modo: Variant; Tab: Integer;
  Orientacao, tamanho: ShortString; Zoom: Integer);
const
  tam: array [1 .. 42] of string[80] = ('Carta', 'Carta pequena', 'Tablóide',
    'Ledger', 'Ofício', 'Declaração', 'Executivo', 'A3', 'A4', 'A4 pequena',
    'A5', 'B4', 'B5', 'Fólio', 'A4 (21,5 cm x 27,5 cm)', '10x14', '11x17',
    'Nota', 'Envelope #9', 'Envelope #10', 'Envelope #11', 'Envelope #12',
    'Envelope #14', 'Folha tamanho C', 'Folha tamanho D', 'Folha tamanho E',
    'Envelope DL', 'Envelope C3', 'Envelope C4', 'Envelope C5', 'Envelope C6',
    'Envelope C65', 'Envelope B4', 'Envelope B5', 'Envelope B6',
    'Envelope (11 cm x 23 cm)', 'Envelope Monarquia',
    'Envelope (9,21 cm x 16,51 cm)', 'Formulário contínuo padrão americano',
    'Formulário contínuo padrão alemão', 'Formulário contínuo ofício alemão',
    'Definido pelo usuário');

var
  pag, i: Byte;

begin
  // PROCEDIMENTO PARA CONFIGURAR ORIENTACAO, TAMANHO E ZOOM DE PAGINA
  // ATENÇÃO: ESSE PROCEDIMENTO DEVERÁ SER UTILIZADO NO FINAL DA ROTINA DE PREENCHIMENTO,
  // ANTES DE SALVAR O ARQUIVO.

  if Orientacao = 'Paisagem' then
    pag := 2
  else
    pag := 1;

  Modo.WorkBooks[1].Sheets[Tab].PageSetup.Orientation := pag;

  for i := 1 to 42 do
    if tam[i] = tamanho then
    begin
      Modo.WorkBooks[1].Sheets[Tab].PageSetup.PaperSize := i;
      break
    end;

  Modo.WorkBooks[1].Sheets[Tab].PageSetup.FitToPagesTall := 1;
  // imprime com altura e largura
  Modo.WorkBooks[1].Sheets[Tab].PageSetup.FitToPagesWide := 1;
  // exatamente de uma página
  Modo.WorkBooks[1].Sheets[Tab].PageSetup.Zoom := Zoom;

  // ex.: ConfPagina(Excel, 1, 'Paisagem', 'A4', 76);
end;

procedure TFRPRI.QuebraPagina(Modo: Variant; Tab, Linha: Integer;
  Coluna: ShortString; TirarQuebra: Boolean);
begin

  if TirarQuebra then
  begin
    Modo.WorkBooks[1].Sheets[Tab].Cells.PageBreak := 0;
    // limpa todas quebras de página
    Modo.WorkBooks[1].Sheets[Tab].ResetAllPageBreaks;
    // redefine todas as quebra de pagina
  end;

  if Linha > 1 then
    Modo.WorkBooks[1].Sheets[Tab].Rows[Linha].PageBreak := 1;
  // insere quebra de página na linha

  if Coluna <> '' then
    Modo.WorkBooks[1].Sheets[Tab].Columns[Coluna].PageBreak := 1;
  // insere quebra de página na coluna

  // ex.: QuebraPagina(Excel, 1, 0, 'J', true);
end;

procedure TFRPRI.ReduzCel(Modo: Variant; Tab: Integer; Intervalo: ShortString);
begin
  // PROCEDIMENTO PARA AJUSTAR CONTEÚDO DA CELULA AO SEU TAMANHO

  Modo.WorkBooks[1].Sheets[Tab].Range[Intervalo].ShrinkToFit := True;

  // ex.: ReduzCel(Excel, 1, 'G9:I9');
end;

procedure TFRPRI.FormatLinCol(Modo: Variant; Tab: Integer;
  Intervalo, Mascara: ShortString);
// var
// Ranger: Variant;
begin
  // PROCEDIMENTO PARA FORMATAR CELULAS

  if Mascara = '' then
    Mascara := 'General'; // modo geral

  // Ranger:= Modo.WorkBooks(1).Sheets(Tab).Range(Intervalo);
  // Ranger.NumberFormat := '"' + Mascara + '"';
  // Modo.WorkBooks(1).Sheets(Tab).Range('"' + Intervalo + '"').NumberFormat := '"' + Mascara + '"';

  Modo.WorkBooks[1].Sheets[Tab].Range[Intervalo].NumberFormat := Mascara;

  // ex.: FormatLinCol(Excel, 1, 'G9:H9', '###,###,##0.000');
end;

procedure TFRPRI.LarguraLin(Modo: Variant; Tab: Integer; Intervalo: ShortString;
  Largura: real);
begin
  // PROCEDIMENTO PARA AJUSTAR LARGURA DA LINHA

  if pos(':', Intervalo) <> 0 then
    Modo.WorkBooks[1].Sheets[Tab].Range[Intervalo].RowHeight := Largura
  else
    Modo.WorkBooks[1].Sheets[Tab].Rows[Intervalo].RowHeight := Largura;

  // ex.: LarguraLin(Excel, 1, 'A9:I15', 15.75);
end;

procedure TFRPRI.LarguraCol(Modo: Variant; Tab: Integer; Intervalo: ShortString;
  Largura: real);
begin
  // PROCEDIMENTO PARA AJUSTAR LARGURA DA COLUNA

  if pos(':', Intervalo) <> 0 then
    Modo.WorkBooks[1].Sheets[Tab].Range[Intervalo].ColumnWidth := Largura
  else
    Modo.WorkBooks[1].Sheets[Tab].Columns[Intervalo].ColumnWidth := Largura;

  // ex.: LarguraCol(Excel, 1, 'A:B', 16.43);
end;

procedure TFRPRI.CongelaLinCol(Modo: Variant; Tab, Lin, Col: Integer);
begin
  // PROCEDIMENTO PARA CONGELAR LINHAS / COLUNAS

  Modo.WorkBooks[1].Sheets[Tab].Activate;
  Modo.ActiveWindow.SplitColumn := Col;
  Modo.ActiveWindow.SplitRow := Lin;

  // ex.: CongelaLinCol(Excel, 1, 5, 0);
end;

procedure TFRPRI.InsereLinha(Modo: Variant; Tab, Lin, NumLin: Integer);
var
  i: Integer;

begin
  // PROCEDIMENTO PARA INSERIR LINHAS

  for i := 1 to NumLin do
    Modo.WorkBooks[1].Sheets[Tab].Rows[Lin].Insert;

  // ex.: InsereLinha(Excel, 1, 5, 2);
end;

procedure TFRPRI.InsereFormula(Modo: Variant; Tab: Integer;
  Intervalo, Formula: ShortString);
begin
  Modo.WorkBooks[1].Sheets[Tab].Range[Intervalo].Formula := Formula;
  // ex.: InsereFormula(Excel, 1, 'A5', '=SUM(A1:A4')
end;

procedure TFRPRI.configura_ftp(cod_empresa: string);
begin

  dao.Geral1
    ('select ftp_host, ftp_login, ftp_senha, ftp_porta from empresa where cod_empresa ='
    + QuotedStr(cod_empresa));

  if dao.Q1.RecordCount > 0 then
  begin

    if ftp.Connected then
      FTP.Disconnect;
    if dao.Q1.fieldbyname('ftp_host').AsString <> '' then
      ftp.Host := dao.Q1.fieldbyname('ftp_host').AsString;
    if dao.Q1.fieldbyname('ftp_login').AsString <> '' then
      ftp.Username := dao.Q1.fieldbyname('ftp_login').AsString;
    if dao.Q1.fieldbyname('ftp_senha').AsString <> '' then
      ftp.Password := dao.Q1.fieldbyname('ftp_senha').AsString;
    if dao.Q1.fieldbyname('ftp_porta').AsInteger <> 0 then
      ftp.Port := dao.Q1.fieldbyname('ftp_porta').AsInteger;
  end;
end;

procedure TFRPRI.Cores1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_cor, Fr_cor);
	SetaAcesso(Fr_cor.Caption);
    Fr_cor.ShowModal;
  finally
    Fr_cor.Free;
  end;
end;

procedure TFRPRI.Produto1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
	SetaAcesso('relatorio_cliente');
    tipo_relatorio := 'relatorio_cliente';
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.VendasporPeriodo1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'vendas_periodo_cliente';
	SetaAcesso('vendas_periodo_cliente');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.RelaodeNotasporPeriodo1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'relatorio_notas_entrada';
	SetaAcesso('relatorio_notas_entrada');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.PosiodeEstoqueporFornecedor1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'relatorio_estoque_completo';
	SetaAcesso('relatorio_estoque_completo');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.VendasporFornecedorcomCusto1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'vendas_fornecedor_custo';
	SetaAcesso('vendas_fornecedor_custo');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.VendasporPerodoAgrupadodorData1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'vendas_periodo_data';
	SetaAcesso('vendas_periodo_data');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.NumTab(Modo: Variant; num: Integer; texto: string);
var
  x: Integer;
begin
  // REALIZA PREENCHIMENTO EM TABELAS NO WORD
  for x := 1 to num do
    Modo.Selection.MoveRight(12);

  if texto <> '' then
    Modo.Selection.TypeText(texto);
end;

procedure TFRPRI.ChequeTerceiros1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_cheque_terceiros, Fr_cheque_terceiros);
	SetaAcesso(Fr_cheque_terceiros.Caption);
    Fr_cheque_terceiros.ShowModal;
  finally
    Fr_cheque_terceiros.Free;
  end;
end;

procedure TFRPRI.E2Click(Sender: TObject);
begin
  try
    Application.CreateForm(Tfrm_estrutura_produto, frm_estrutura_produto);
	SetaAcesso(frm_estrutura_produto.Caption);
    frm_estrutura_produto.ShowModal;
  finally
    frm_estrutura_produto.Free;
  end;
end;

procedure TFRPRI.E3Click(Sender: TObject);
begin
  try
    Application.CreateForm(Tfr_etapas_producao, fr_etapas_producao);
	SetaAcesso(fr_etapas_producao.Caption);
    fr_etapas_producao.ShowModal;
  finally
    fr_etapas_producao.Free;
  end;
end;

procedure TFRPRI.E4Click(Sender: TObject);
begin
  try
    Application.CreateForm(Tfrm_entrada_producao, frm_entrada_producao);
	SetaAcesso(frm_entrada_producao.Caption);
    frm_entrada_producao.ShowModal;
  finally
    frm_entrada_producao.Free;
  end;
end;

procedure TFRPRI.EmissoCheques1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_Emissao_cheques, Fr_Emissao_cheques);
	SetaAcesso(Fr_Emissao_cheques.Caption);
    Fr_Emissao_cheques.ShowModal;

  finally
    Fr_Emissao_cheques.Free;
  end;
end;

procedure TFRPRI.Representante1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_representante, Fr_representante);
	SetaAcesso(Fr_representante.Caption);
    Fr_representante.ShowModal;
  finally
    Fr_representante.Free;
  end;
end;

procedure TFRPRI.CFOP1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_CFOP, Fr_CFOP);
	SetaAcesso(Fr_CFOP.Caption);
    Fr_CFOP.ShowModal;
  finally
    Fr_CFOP.Free;
  end;
end;

procedure TFRPRI.Unidades1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_tabela_unidade, Fr_tabela_unidade);
	SetaAcesso(Fr_tabela_unidade.Caption);
    Fr_tabela_unidade.ShowModal;
  finally
    Fr_tabela_unidade.Free;
  end;
end;

procedure TFRPRI.Banco1Click(Sender: TObject);
begin
  try
    Application.CreateForm(Tfr_banco, fr_banco);
	SetaAcesso(fr_banco.Caption);
    fr_banco.ShowModal;
  finally
    fr_banco.Free;
  end;
end;

procedure TFRPRI.ContaCorrente1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_conta_corrente, Fr_conta_corrente);
	SetaAcesso(Fr_conta_corrente.Caption);
    Fr_conta_corrente.ShowModal;
  finally
    Fr_conta_corrente.Free;
  end;
end;

procedure TFRPRI.CategoriaEstoque1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_categoria_estoque, Fr_categoria_estoque);
	SetaAcesso(Fr_categoria_estoque.Caption);
    Fr_categoria_estoque.ShowModal;
  finally
    Fr_categoria_estoque.Free;
  end;
end;

procedure TFRPRI.PrazodePagamento1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_prazo_pagamento, Fr_prazo_pagamento);
	SetaAcesso(Fr_prazo_pagamento.Caption);
    Fr_prazo_pagamento.ShowModal;
  finally
    Fr_prazo_pagamento.Free;
  end;
end;

procedure TFRPRI.CadastroCrdito1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_parametro_credito, Fr_parametro_credito);
	SetaAcesso(Fr_parametro_credito.Caption);
    Fr_parametro_credito.ShowModal;
  finally
    Fr_parametro_credito.Free;
  end;
end;

procedure TFRPRI.Veiculo1Click(Sender: TObject);
begin
  try
    Application.CreateForm(Tfr_veiculo, fr_veiculo);
	SetaAcesso(fr_veiculo.Caption);
    fr_veiculo.ShowModal;
  finally
    fr_veiculo.Free;
  end;
end;

procedure TFRPRI.Motorista1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_motorista, Fr_motorista);
	SetaAcesso(Fr_motorista.Caption);
    Fr_motorista.ShowModal;
  finally
    Fr_motorista.Free;
  end;
end;

procedure TFRPRI.N11Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'produtos_capa';
	SetaAcesso('produtos_capa');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.N12Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'produtos_capa_11';
	SetaAcesso('produtos_capa_11');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.ConsignaesemAberto1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'relatorio_consignacao';
	SetaAcesso('relatorio_consignacao');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.configuraRD(fonteTamanho: TSize; tipoImpressora: TModelo;
  qtdcoluna, qtdlinha: Integer; qtdLpp: TLinha; usaGerenciador: Boolean);
begin
  // fonteTamanho: TSize; ex : s10cpp , s12cpp, s17cpp
  // tipoImpressora: TModelo; ex epson, grafico, hp, rima
  // qtdcoluna, qtdlinha: integer; ex numero inteiro
  // qtdLpp: TLinha; ex: seis , oito
  // testaporta, usaGerenciador: boolean); ex true ou false
  with RD do
  begin
    FonteTamanhoPadrao := fonteTamanho;
    Impressora := Impressora;
    TamanhoQteColunas := qtdcoluna;
    TamanhoQteLinhas := qtdlinha;
    qtdLpp := qtdLpp;
    // TestarPorta:= testaporta;
    UsaGerenciadorImpr := usaGerenciador;
  end;

end;

procedure TFRPRI.AtualizarSistema1Click(Sender: TObject);
begin
  Atualizacao;
end;

procedure TFRPRI.PosioEstoqueFornecedorSimplificado1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'relatorio_estoque_simplificado';
	SetaAcesso('relatorio_estoque_simplificado');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dao.SkinData1.Active := False;

  fm_splash.show;
  fm_splash.ggProgress.Progress := 0;
  fm_splash.lbStatus.Caption := 'Fechando Sistema...';
  fm_splash.Refresh;
  sleep(100);
  fm_splash.ggProgress.Progress := 100;
  fm_splash.lbStatus.Caption := 'Fechando Sistema...';
  fm_splash.Refresh;
  sleep(100);

  fm_splash.Free;

  FMFUN.TerminarProcesso('TelasOrbi.exe');
  dao.SkinData1.Active := False;
  Application.Terminate;
end;

procedure TFRPRI.fr_relatorioPreview(Sender: TObject);
begin
  // fr_relatorio.LoadFromFile('c:\orbi\relatorio\orbi.fdb');

  // fr_relatorio.fr
end;

procedure TFRPRI.VendasporMarca1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'vendas_periodo_marca';
	SetaAcesso('vendas_periodo_marca');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.ChequedeTerceiros2Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'cheque_terceiros';
	SetaAcesso('cheque_terceiros');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.RelaodeNotasdeEntradacompleto1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'relatorio_notas_entrada_detalhado';
	SetaAcesso('relatorio_notas_entrada_detalhado');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.Marcas1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_marcas, Fr_marcas);
	SetaAcesso(Fr_marcas.Caption);
    Fr_marcas.ShowModal;
  finally
    Fr_marcas.Free;
  end;
end;

procedure TFRPRI.habilitaCamposAreaAtuacao(CodAtuacao: string);
begin
  if CodAtuacao = '0' then // comercio de vestuarios
  begin
    ControledePedidos1.Visible := False;
    MontagemdeCarga1.Visible := False;
    ClientesporRepresentante1.Visible := False;
    RelatrioAuxiliardeCompra1.Visible := False;
    RelatoriodeSolicitaodeCompraatravesdeestoqueMnimo1.Visible := False;
    ControledeFretes1.Visible := False;
  end
  else if CodAtuacao = '3' then // distribuidora
  begin
    Cores1.Visible := False;
    amanho1.Visible := False;
    ControledePedidos1.Visible := True;
    MontagemdeCarga1.Visible := True;
  end;

end;

procedure TFRPRI.MontagemdeCarga1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_montagem_carga, Fr_montagem_carga);
    mform := 'montagem_carga';
	SetaAcesso(Fr_montagem_carga.Caption);
    Fr_montagem_carga.ShowModal;
  finally
    Fr_montagem_carga.Free;
  end;
end;

procedure TFRPRI.ControledeFretesTransportadora1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'controle_fretes_transportadora';
	SetaAcesso('controle_fretes_transportadora');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.OrdemdeCompra1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFmOrdemCompra, FmOrdemCompra);
	SetaAcesso(FmOrdemCompra.Caption);
    FmOrdemCompra.ShowModal;
  finally
    FmOrdemCompra.Free;
  end;
end;

procedure TFRPRI.ClientesDetalhado1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'relatorio_cliente_completo';
	SetaAcesso('relatorio_cliente_completo');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.ransferenciasporperiodo1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'relatorio_transferencia';
	SetaAcesso('relatorio_transferencia');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.VendasporPerodoAgrupadoporVendedor1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'vendas_periodo_vendedor';
	SetaAcesso('vendas_periodo_vendedor');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.PautadeVendascomEstoque1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'pauta_vendas_est';
	SetaAcesso('pauta_vendas_est');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;

end;

procedure TFRPRI.VendasPadroSimplificada1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'vendas_padrao';
	SetaAcesso('vendas_padrao');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.RelatoriodeSolicitaodeCompraatravesdeestoqueMnimo1Click
  (Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'solicitacao_ordem_compra';
	SetaAcesso('solicitacao_ordem_compra');
    // solicitação de ordem de compra mediante estoque minimo
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.ClientesporRepresentante1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_relatorio_cliente_vendedor, Fr_relatorio_cliente_vendedor);
    tipo_relatorio := 'cliente_vendedor'; // relatorio de comissão por venda
	SetaAcesso('cliente_vendedor');
    Fr_relatorio_cliente_vendedor.ShowModal;
  finally
    Fr_relatorio_cliente_vendedor.Free;
  end;
end;

procedure TFRPRI.RankingClientesSimplificado1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'ranking_cliente_simplificado';
	SetaAcesso('ranking_cliente_simplificado');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.RankingProdutosClick(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'ranking_produtos';
  	SetaAcesso('ranking_produtos');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.RelatrioAuxiliardeCompra1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'relatorio_auxiliar_compra';
	SetaAcesso('relatorio_auxiliar_compra');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.RelatriodeAniversariantes1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'relatorio_aniversariantes';
	SetaAcesso('relatorio_aniversariantes');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.PrPedido1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_pre_pedido, Fr_pre_pedido);
	SetaAcesso(Fr_pre_pedido.Caption);
    Fr_pre_pedido.ShowModal;
  finally
    Fr_pre_pedido.Free;
  end;
end;

function TFRPRI.pAssinarXML(pathDocXML, tipDocXML, titCertificado: WideString;
  out aResultado: WideString): Integer;
var
  cAssinarXML: _AssinarXML;
  strResultado: WideString;
  intResultado: Integer;

  /// AssinarXML : Assinatura Digital XML no padrão do Projeto NF-e
  ///
  ///
  /// Entradas:
  /// XMLString: string XML a ser assinada
  /// RefUri : Referência da URI a ser assinada (Ex. infNFe
  /// X509Cert : certificado digital a ser utilizado na assinatura digital
  ///
  /// Retornos:
  ///
  /// vResultado: código do resultado
  ///
  /// 0 - Assinatura realizada com sucesso
  /// 1 - Erro: Problema ao acessar o certificado digital - %exceção%
  /// 2 - Certificado digital inexistente para %nome%
  /// 3 - XML mal formado + exceção
  /// 4 - A tag de assinatura %RefUri% inexiste
  /// 5 - A tag de assinatura %RefUri% não é unica
  /// 6 - Erro Ao assinar o documento - ID deve ser string %RefUri(Atributo)%
  /// 7 - Erro: Ao assinar o documento - %exceção%
  ///
  ///
  /// vResultadoString  : Literal da mensagem resultado

begin
  try
    cAssinarXML := CoAssinarXML.Create;
    cAssinarXML.Assinar(pathDocXML, tipDocXML, titCertificado, intResultado,
      strResultado);
    aResultado := strResultado;
    Result := intResultado;
  finally
    cAssinarXML := nil;
  end;
end;

function TFRPRI.pValidarXML(pathXML, pathSchemas: WideString;
  out resMensagem: WideString; out msgErros: WideString): WideString;
var
  cValidarXML: _ValidarXML;
  Resultado: Integer;

  /// ValidarXML:  Valida Schema XML
  ///
  /// Entradas:
  ///
  /// XML: Mensagem XML a ser validada
  /// tipoXML: 0 - cabeçalho (cabecMsg_v1.02)
  /// 1 - NF-e (nfe_v1.10.xsd)
  /// 2 - Envio de Lote de NF-e (enviNFe_v1.10.xsd)
  /// 3 - Retorno Lote de NF-e (retEnviNFe_v1.10.xsd)
  /// 4 - Busca Resultado de NF-e (consReciNFe_v1.10.xsd)
  /// 5 - Retorno de Resultado de NF-e (retConsReciNFe_v1.10.xd)
  /// 6 - Cancelamento de NF-e (cancNFe_v1.07.xsd)
  /// 7 - Retorno de Cancelamento de NF-e (retCancNFe_v1.07.xsd)
  /// 8 - Inutilizacao de Numeração de NF-e (inutNFe_v1.07.xsd)
  /// 9 - Retorno de Inutilização de NF-e (retInutNFe_v1.07.xsd)
  /// 10 - Consulta Situação de NF-e (consSitNFe_v1.07.xsd)
  /// 11 - Retorno de Consulta Situação de NF-e (retConsSitNFe_v1.07.xsd)
  /// 12 - Consulta Status de Serviço (consStatServ_v1.07.xsd)
  /// 13 - Retorno de Consulta Status de Serviço (retConsStatServ_v1.07.xsd)
  /// 14 - Consulta Cadastro de Contribuintes (consCad_v1.01.xsd)
  /// 15 - Retorno da Consulta Cadastro de Contribuintes (retConsCad_v1.01.xsd)
  ///
  /// Retornos:
  ///
  /// ValidaXML: código do resultado Validação
  /// 0 - OK - mensagem XML válida
  /// 1 - Erro: tipoXML %tipoXML%inválido (fora do intervalor 0-15)
  /// 2 - Erro: arquivo de Schema XML %nome do arquivo% não localizado
  /// 3 - Erro: XML mal formado
  /// 4 - Erro: XML não atende Schema XML
  /// 5 - Erro: não previsto
  /// oRetorno: literal do resultado da chamada do ValidaXML
  /// oRetornoString: Erros de XML encontrados

begin
  if pathXML <> '' then
  begin
    if pathSchemas <> '' then
    begin
      try
        cValidarXML := CoValidarXML.Create;
        cValidarXML.validaXML(pathXML, pathSchemas, Resultado, msgErros);
        // cValidarXML.validaXML(pathXML, 'C:\MaterialNFe 2.0\Schemas\nfe_v2.00.xsd', Resultado, msgErros);
        Result := inttostr(Resultado);
      finally
        cValidarXML := nil;
      end;
    end
    else
      MessageDlg('Espécie do XML não informado...', mtInformation, [mbOk], 0);
  end
  else
    MessageDlg('Documento XML não informado...', mtInformation, [mbOk], 0);
end;

// LimpaCNPJ (retira máscaras do CNPJ)

function TFRPRI.LimpaCNPJ(cnpj: string): string;
begin
  Result := stringreplace
    (stringreplace(stringreplace(stringreplace(stringreplace(cnpj, '.', '',
    [rfReplaceAll]), '-', '', [rfReplaceAll]), '/', '', [rfReplaceAll]), '(',
    '', [rfReplaceAll]), ')', '', [rfReplaceAll]);
end;

procedure TFRPRI.GerarLote(NumerodoLote: string; out PathLote: string);
var
  fArquivoTexto: TextFile;
  MeuXMLAssinado: pchar;
  buf, ArquivoXMLAssinado, pathSaida: string;
  Qry: TFDQuery;
  mTexto, mTexto2: TStringList;
  timAntes, timDepois: TTimer;

begin
  { Qry := TIBQuery.Create(Application);
    Qry.Database := fDmodule.IBDatabase1;
    Qry.Transaction := fDmodule.IBTransaction1;

    mTexto2 := TStringList.Create;
    mTexto2.Clear;

    MeuXMLAssinado := Pchar(MeuXMLAssinado);
    dao.Geral4('select ultimo_lote_nfe from configuracao');
    // Crie o novo arquivo (Ex. arquivoXMLEnviNFe = 0000000000001env-lot.xml)
    with fDmodule do
    begin
    qryConfiguracoes.Open;
    pathSaida := qryConfiguracoes.FieldByName('CFG_PATH_SAI').AsString;
    end;

    PathLote := pathSaida + '\' + dao.q4.fieldbyname() +'-env-lot.xml';
    AssignFile(fArquivoTexto, (PathLote));
    Rewrite(fArquivoTexto);

    // Adiciona as namespaces
    Write(fArquivoTexto, '<?xml version="1.0" encoding="UTF-8"?>');
    Write(fArquivoTexto, '<enviNFe xmlns="http://www.portalfiscal.inf.br/nfe" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" versao="2.00">' );
    Write(fArquivoTexto, '<idLote>' + NumerodoLote + '</idLote>');

    //repetir essa parte do codigo quando quiser anexar varios arquivos... aki é que entra o while das notas
    with gridNFe.DataSource do
    begin
    DataSet.First;
    while not DataSet.Eof do
    begin
    if (DataSet.FieldByName('NFE_STATUS').AsString = 'M') and (DataSet.FieldByName('NFE_SITUACAO').AsString = 'Validado') then
    begin
    buf := '';
    mTexto := TStringList.Create;
    mTexto.Clear;
    mTexto.LoadFromFile(DataSet.FieldByName('NFE_PATH').AsString);
    MeuXMLAssinado := PChar(mTexto.Text);
    // Nesse ponto vc está copiando o conteudo da tag "NFe" para o buffer...
    buf := Copy(MeuXMLAssinado, Pos('<NFe', MeuXMLAssinado), Length(MeuXMLAssinado));
    Write(fArquivoTexto, buf);
    mTexto.Free;
    AtualizaTabela(tpTransmitindo, DataSet.FieldByName('IDE_NNF').AsString, PathLote);
    end;
    DataSet.Next;
    end;
    end;

    // Fecha o arquivo
    Write(fArquivoTexto, '</enviNFe>');
    CloseFile(fArquivoTexto);

    mTexto2.Free;
    Qry.Free; }
end;

function TFRPRI.busca_cfop_produto(nom_uf, trib_produto, tipo: string): string;
// função busca o cfop correto para colocar na nfe do produto tipo= E=entrada  S=saida
var
  cfop: string;
begin
  if tipo = 'S' then
  begin
    if nom_uf = 'SC' then
    begin
      if trib_produto = '00' then
        cfop := '5101';
      if (trib_produto = '40') or (trib_produto = '60') or (trib_produto = '90')
      then
        cfop := '5405';
    end
    else
    begin
      if trib_produto = '00' then
        cfop := '6101';
      if (trib_produto = '40') or (trib_produto = '60') or (trib_produto = '90')
      then
        cfop := '6403';
    end;
  end
  else
  begin

  end;
  Result := cfop;

end;

function TFRPRI.Modulo11(Numero: string): string;
var
  i, k: Integer;
  Soma: Integer;
  Digito: Integer;

begin
  Result := '';
  try
    Soma := 0;
    k := 2;
    for i := Length(Numero) downto 1 do
    begin
      Soma := Soma + (StrToInt(Numero[i]) * k);
      inc(k);
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

function TFRPRI.StrZero(num: real; Zeros, Deci: Integer): string;
var
  tam, z: Integer;
  res, zer: string;

begin
  str(num: Zeros: Deci, res);
  res := Alltrim(res);
  tam := Length(res);
  zer := '';
  for z := 1 to (Zeros - tam) do
    zer := zer + '0';
  Result := zer + res
end;

function TFRPRI.Alltrim(const Search: string): string;
const
  BlackSpace = [#33 .. #126];
var
  Index: Byte;
begin
  Index := 1;
  while (Index <= Length(Search)) and not(Search[Index] in BlackSpace) do
  begin
    Index := Index + 1;
  end;
  Result := Copy(Search, Index, 255);
  Index := Length(Result);
  while (Index > 0) and not(Result[Index] in BlackSpace) do
  begin
    Index := Index - 1;
  end;
  Result := Copy(Result, 1, Index);
end;

procedure TFRPRI.NCM1Click(Sender: TObject);
begin
  try
    Application.CreateForm(Tfr_ncm, fr_ncm);
	SetaAcesso(fr_ncm.Caption);
    fr_ncm.ShowModal;
  finally
    fr_ncm.Free;
  end;
end;

procedure TFRPRI.Simplificado1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'comissao_venda'; // relatorio de comissão por venda
	SetaAcesso('comissao_venda');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.Detalhado1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'comissoes';
	SetaAcesso('comissoes');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

function TFRPRI.HabilitaMenu(Menu: string): Boolean;
begin
  try
    mmMenu.First;
    // dao.Geral4('SELECT a.ID, a.NOM_MENU, a.NIVEL FROM MENU a where a.nom_menu like ' + QuotedStr(Menu) + ' and a.nivel <= ' + Tipo_usuario);
    Result := False;
    if mmMenu.Locate('NOM_MENU', trim(Menu), [loCaseInsensitive]) then
      Result := mmMenuNIVEL.AsInteger <= StrToInt(Tipo_usuario);

  finally
    // dao.Q4.close;
    mmMenu.First;
  end;
end;

procedure TFRPRI.CarregarListaMenu;
var
  sql_add: string;
begin
{  if not EnviarPedidos.Visible then
    sql_add := 'AND NOM_MENU NOT LIKE ''%' + EnviarPedidos.Caption + '%''';
 }
  mmMenu.open;
  mmMenu.EmptyTable;
  q_menu.close;
  q_menu.sql.Text := 'SELECT a.ID, a.NOM_MENU, a.NIVEL FROM MENU a where 1 = 1 ' + sql_add;
  q_menu.open;
  q_menu.First;
  while not q_menu.Eof do
  begin
    mmMenu.Append;
    mmMenuID.AsInteger := q_menu.fieldbyname('ID').AsInteger;
    mmMenuNOM_MENU.AsString := q_menu.fieldbyname('NOM_MENU').AsString;
    mmMenuNIVEL.AsInteger := q_menu.fieldbyname('NIVEL').AsInteger;
    mmMenu.Post;
    q_menu.Next;
  end;
  mmMenu.First;
end;

procedure TFRPRI.CadastraMenu(Menu: string);
var
  ItemM: TMenuItem;
begin
  try
    // dao.Geral1('select NOM_MENU from MENU where NOM_MENU = ' + QuotedStr(Menu));
    mmMenu.First;
    if not mmMenu.Locate('NOM_MENU', trim(Menu), [loPartialKey]) then
    // if dao.Q1.isempty then
    begin
      try
        if not(dao.cn.InTransaction) then
          dao.cn.StartTransaction;
        dao.execsql('Insert into MENU (NOM_MENU) VALUES (' +
          QuotedStr(Menu) + ')');
        dao.cn.Commit;
      except
        dao.cn.Rollback;
      end;
    end;
  finally
    // dao.Q1.Close;
    mmMenu.First;
  end;
end;

procedure TFRPRI.TreeView_Menu;
var
  i, z: Integer;
  No1: TTreeNode;
  ItemM: TMenuItem;
  s: string;

  procedure SubNivel(opcao: TMenuItem; No: TTreeNode);
  var
    x: Integer;
    NoFilho: TTreeNode;
  begin
    s := opcao.Caption;
    if (s <> '-') then
    begin
      Delete(s, pos('&', s), 1);
      //CadastraMenu(s);
      opcao.Visible := HabilitaMenu(s);
      if opcao.Visible then
      begin
        NoFilho := TreeView1.Items.AddChild(No, s);
        NoFilho.ImageIndex := 0;
        for x := 0 to opcao.count - 1 do
          SubNivel(opcao.Items[x], NoFilho);
      end;
    end;
  end;

begin
  CarregarListaMenu;
  Oculta_Menu;
  for i := 0 to Menu.Items.count - 1 do
  begin
    fm_splash.show;
    fm_splash.ggProgress.MaxValue := Menu.Items.count - 1;
    fm_splash.ggProgress.Progress := i;
    fm_splash.lbStatus.Caption := 'Carregando Menu...';
    fm_splash.Refresh;

    ItemM := Menu.Items[i];
    s := ItemM.Caption;
    if (s <> '-') then
    begin
      Delete(s, pos('&', s), 1);
      //CadastraMenu(s);
      ItemM.Visible := HabilitaMenu(s);
      if ItemM.Visible then
      begin
        No1 := TreeView1.Items.Add(nil, s);
        No1.ImageIndex := 0;
        for z := 0 to ItemM.count - 1 do
          SubNivel(ItemM.Items[z], No1);
      end;
    end;
  end;
end;

procedure TFRPRI.Oculta_Menu;
var
  i, z: Integer;
  ItemM: TMenuItem;
  s: string;

  procedure SubNivel(opcao: TMenuItem);
  var
    x: Integer;
  begin
    opcao.Visible := False;
    for x := 0 to opcao.count - 1 do
      SubNivel(opcao.Items[x]);
  end;

begin

  for i := 0 to Menu.Items.count - 1 do
  begin
    Menu.Items[i].Visible := False;
    for z := 0 to Menu.Items[i].count - 1 do
      SubNivel(Menu.Items[i].Items[z]);
  end;

end;

procedure TFRPRI.TreeView1DblClick(Sender: TObject);
var
  Cont1: Integer;
  s: string;
begin
  for Cont1 := 0 to FRPRI.ComponentCount - 1 do
  begin
    with FRPRI do
    begin
      if Components[Cont1] is TMenuItem then
      begin
        s := TMenuItem(Components[Cont1]).Caption;
        Delete(s, pos('&', s), 1);

        if (s = TreeView1.Selected.Text) then
          TMenuItem(Components[Cont1]).Click;
      end;
    end;
  end;
end;

procedure TFRPRI.sbFecharClick(Sender: TObject);
begin
  Panel3.Visible := True;
  sbAbrir.Visible := True;
  sbFechar.Visible := False;
end;

procedure TFRPRI.SBAbrirClick(Sender: TObject);
begin
  Panel3.Visible := False;
  sbAbrir.Visible := False;
  sbFechar.Visible := True;
end;

constructor TEmail.Create(corpo, assunto, end1, end2, end3, CC, BC: string;
  anexo1: string = ''; anexo2: string = '');
begin
  inherited Create(True);
  { Chama o contrutor herdado. Ele irá temporariamente colocar o thread em estado de espera para depois executá-lo. }
  FreeOnTerminate := True; // Libera o objeto após terminar.
  Priority := TpLower;
  { Configura sua prioridade na lista de processos do Sistema operacional. }
  cCorpo := corpo;
  cAssunto := assunto;
  cEnd1 := end1;
  cEnd2 := end2;
  cEnd3 := end3;
  cCC := CC;
  bCC := BC;
  cAnexo1 := anexo1;
  cAnexo2 := anexo2;
  Resume; // Inicia o Thread.
end;

procedure TEmail.Execute;
begin
  envia_email;
  Fr_email_envio.ModalResult := mrOk;
end;

procedure TEmail.envia_email;
var
  smtpHost, smtpLogin, smtpPass, smtpFrom: string;
  smtpPort: Integer;
  isGmail: Boolean;
  xmlFile, xmlEnvio, pdfFile, logoFile, anexoPath, mimeType, corpoMsg: string;
  sl, ListaAnexos, ItensAnexo: TStringList;
  i, ToCount: Integer;
  emailTmp, listaEndereco: string;
begin
  path := ExtractFilePath(Application.ExeName);

  try
    Fr_email_envio.lbResultado.Caption := 'Configurando os dados de Conexão...';

    dao.geral2(
      'select nom_empresa, ema_email, ema_login, ema_senha, ema_porta, ema_smtp from empresa where cod_empresa = '+ QuotedStr(cod_empresa));

    smtpFrom := dao.Q2.FieldByName('ema_email').AsString;
    smtpLogin := dao.Q2.FieldByName('ema_login').AsString;
    smtpPass := dao.Q2.FieldByName('ema_senha').AsString;
    smtpHost := dao.Q2.FieldByName('ema_smtp').AsString;
    smtpPort := dao.Q2.FieldByName('ema_porta').AsInteger;

    isGmail := (Pos('gmail.com', LowerCase(smtpHost)) > 0) or
               (Pos('@gmail.com', LowerCase(smtpLogin)) > 0);

    frpri.ACBrMail.Clear;

    // ===== CONFIG SMTP =====
    if isGmail then
    begin
      frpri.ACBrMail.Host := 'smtp.gmail.com';
      frpri.ACBrMail.Port := '587';
      frpri.ACBrMail.SetTLS := True;
      frpri.ACBrMail.SetSSL := False;
    end
    else
    begin
      frpri.ACBrMail.Host := smtpHost;
      frpri.ACBrMail.Port := IntToStr(smtpPort);
      frpri.ACBrMail.SetTLS := True;
      frpri.ACBrMail.SetSSL := False;
    end;

    frpri.ACBrMail.From := smtpFrom;
    frpri.ACBrMail.FromName := dao.Q2.FieldByName('nom_empresa').AsString;
    frpri.ACBrMail.Username := smtpLogin;
    frpri.ACBrMail.Password := smtpPass;
    // ===== DESTINATARIOS =====
    ToCount := 0;
    ItensAnexo := TStringList.Create;
    try
      ItensAnexo.StrictDelimiter := True;
      ItensAnexo.Delimiter := ';';

      listaEndereco := Trim(cEnd1) + ';' + Trim(cEnd2) + ';' + Trim(cEnd3);
      listaEndereco := StringReplace(listaEndereco, ',', ';', [rfReplaceAll]);
      listaEndereco := StringReplace(listaEndereco, #13, ';', [rfReplaceAll]);
      listaEndereco := StringReplace(listaEndereco, #10, ';', [rfReplaceAll]);

      ItensAnexo.DelimitedText := listaEndereco;
      for i := 0 to ItensAnexo.Count - 1 do
      begin
        emailTmp := Trim(ItensAnexo[i]);
        if (emailTmp <> '') and (Pos('@', emailTmp) > 1) then
        begin
          frpri.ACBrMail.AddAddress(emailTmp);
          Inc(ToCount);
        end;
      end;

      if Trim(cCC) <> '' then
      begin
        ItensAnexo.Clear;
        ItensAnexo.DelimitedText := StringReplace(StringReplace(StringReplace(cCC, ',', ';', [rfReplaceAll]), #13, ';', [rfReplaceAll]), #10, ';', [rfReplaceAll]);
        for i := 0 to ItensAnexo.Count - 1 do
        begin
          emailTmp := Trim(ItensAnexo[i]);
          if (emailTmp <> '') and (Pos('@', emailTmp) > 1) then
          begin
            if ToCount = 0 then
            begin
              frpri.ACBrMail.AddAddress(emailTmp);
              Inc(ToCount);
            end
            else
              frpri.ACBrMail.AddCC(emailTmp);
          end;
        end;
      end;

      if Trim(bCC) <> '' then
      begin
        ItensAnexo.Clear;
        ItensAnexo.DelimitedText := StringReplace(StringReplace(StringReplace(bCC, ',', ';', [rfReplaceAll]), #13, ';', [rfReplaceAll]), #10, ';', [rfReplaceAll]);
        for i := 0 to ItensAnexo.Count - 1 do
        begin
          emailTmp := Trim(ItensAnexo[i]);
          if (emailTmp <> '') and (Pos('@', emailTmp) > 1) then
          begin
            if ToCount = 0 then
            begin
              frpri.ACBrMail.AddAddress(emailTmp);
              Inc(ToCount);
            end
            else
              frpri.ACBrMail.AddBCC(emailTmp);
          end;
        end;
      end;
    finally
      ItensAnexo.Free;
    end;

    if ToCount = 0 then
      raise Exception.Create('Nenhum destinatario valido informado para envio de email.');

    frpri.ACBrMail.Subject := cAssunto;

    // ===== CORPO =====
    frpri.ACBrMail.Body.Clear;
    corpoMsg := Trim(cCorpo);
    if Pos('<?xml', LowerCase(corpoMsg)) > 0 then
      corpoMsg := Trim(Copy(corpoMsg, 1, Pos('<?xml', LowerCase(corpoMsg)) - 1));

    if corpoMsg <> '' then
    begin
      frpri.ACBrMail.IsHTML := True;
      frpri.ACBrMail.Body.Add(corpoMsg);
    end
    else
    begin
      frpri.ACBrMail.IsHTML := False;
      frpri.ACBrMail.Body.Add('Segue anexo XML da NF-e emitida');
    end;

    // ===== LOGO INLINE (usa CONFIGURACAO.LOGO) =====
    logoFile := '';
    if frpri.ACBrMail.IsHTML and
       (Pos('cid:logo_plasfan', LowerCase(frpri.ACBrMail.Body.Text)) > 0) then
    begin
      logoFile := path + 'logo_email.bmp';
      try
        dao.geral2('select logo from configuracao where cod_conf = 1');
        if (not dao.Q2.IsEmpty) and (not dao.Q2.FieldByName('LOGO').IsNull) then
        begin
          try
            TBlobField(dao.Q2.FieldByName('LOGO')).SaveToFile(logoFile);
          except
            logoFile := path + 'logo_email.jpg';
            TBlobField(dao.Q2.FieldByName('LOGO')).SaveToFile(logoFile);
          end;
        end
        else
          logoFile := '';
      except
        logoFile := '';
      end;

      if (logoFile <> '') and FileExists(logoFile) then
        frpri.ACBrMail.AddAttachment(logoFile, 'logo_plasfan', adInline);
    end;
    // ===== ANEXOS INDIVIDUAIS (suporta varios arquivos separados por ;) =====
    ListaAnexos := TStringList.Create;
    ItensAnexo := TStringList.Create;
    try
      ListaAnexos.StrictDelimiter := True;
      ItensAnexo.StrictDelimiter := True;

      // cAnexo1: arquivo(s) ou XML em texto
      if Trim(cAnexo1) <> '' then
      begin
        if Pos(';', cAnexo1) > 0 then
        begin
          ItensAnexo.Delimiter := ';';
          ItensAnexo.DelimitedText := cAnexo1;
          for i := 0 to ItensAnexo.Count - 1 do
          begin
            anexoPath := Trim(ItensAnexo[i]);
            if (anexoPath <> '') and FileExists(anexoPath) then
              ListaAnexos.Add(anexoPath);
          end;
        end
        else if FileExists(cAnexo1) then
          ListaAnexos.Add(cAnexo1)
        else
        begin
          xmlFile := path + 'NFE_' + FormatDateTime('yyyymmdd_hhnnss', Now) + '.xml';
          sl := TStringList.Create;
          try
            sl.Text := cAnexo1; // XML vindo como string
            sl.SaveToFile(xmlFile);
            if FileExists(xmlFile) then
              ListaAnexos.Add(xmlFile);
          finally
            sl.Free;
          end;
        end;
      end;

      // cAnexo2: arquivo(s)
      if Trim(cAnexo2) <> '' then
      begin
        if Pos(';', cAnexo2) > 0 then
        begin
          ItensAnexo.Clear;
          ItensAnexo.Delimiter := ';';
          ItensAnexo.DelimitedText := cAnexo2;
          for i := 0 to ItensAnexo.Count - 1 do
          begin
            anexoPath := Trim(ItensAnexo[i]);
            if (anexoPath <> '') and FileExists(anexoPath) then
              ListaAnexos.Add(anexoPath);
          end;
        end
        else if FileExists(cAnexo2) then
          ListaAnexos.Add(cAnexo2);
      end;

      for i := 0 to ListaAnexos.Count - 1 do
      begin
        anexoPath := ListaAnexos[i];
        frpri.ACBrMail.AddAttachment(anexoPath, '', adAttachment);
      end;
    finally
      ItensAnexo.Free;
      ListaAnexos.Free;
    end;

    Fr_email_envio.lbResultado.Caption := 'Enviando Email...';
    Fr_email_envio.Refresh;

    try
      frpri.ACBrMail.Send;
    except
      on E: Exception do
      begin
        Fr_email_envio.lbResultado.Caption :=
          'Erro ao enviar: ' + E.Message;
        Exit;
      end;
    end;

  finally
    Fr_email_envio.lbResultado.Caption := 'Email enviado com sucesso!';
    Fr_email_envio.Refresh;
    Sleep(2000);
    Fr_email_envio.ModalResult := mrOk;
  end;
end;


procedure TEmail.Mostra;
begin
  { Fr_nfe_transmissao.Gauge1.Progress := cont;

    Fr_nfe_transmissao.Update;
    Sleep(2000); }
end;

procedure TFRPRI.BitBtn1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_email_envio, Fr_email_envio);
	SetaAcesso(Fr_email_envio.Caption);
    Fr_email_envio.show;
  finally
    Fr_email_envio.Free;
  end;

end;

procedure TFRPRI.ProdutosxNCM1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'produto_ncm';
	SetaAcesso('produto_ncm');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.ChecarAvisoAtualizacao;
var
  pnl: TsPanel;
  lblMsg: TsLabel;
  lblTit: TsLabel;
  shp: TShape;
begin
  pnl := TsPanel(FindComponent('pnlAtualizacaoAviso'));
  if not Assigned(pnl) then
  begin
    pnl := TsPanel.Create(Self);
    pnl.Name := 'pnlAtualizacaoAviso';
    pnl.Parent := Self;
    pnl.Align := alRight;
    pnl.Width := pnlCertAviso.Width;
    pnl.Color := clInfoBk;
    pnl.ParentBackground := False;
    pnl.Visible := False;
    pnl.TabOrder := 8;
    pnl.SkinData.SkinSection := 'PANEL';
    pnl.Cursor := crHandPoint;
    pnl.OnClick := AvisoAtualizacaoClick;

    shp := TShape.Create(pnl);
    shp.Name := 'shpAtualizacaoAviso';
    shp.Parent := pnl;
    shp.Align := alLeft;
    shp.Width := 5;
    shp.Brush.Color := clTeal;
    shp.Pen.Style := psClear;

    lblTit := TsLabel.Create(pnl);
    lblTit.Name := 'lblAtualizacaoAvisoTitulo';
    lblTit.Parent := pnl;
    lblTit.Left := 12;
    lblTit.Top := 6;
    lblTit.Caption := 'ATUALIZACAO DISPONIVEL';
    lblTit.ParentFont := False;
    lblTit.Font.Color := clTeal;
    lblTit.Font.Style := [fsBold];
    lblTit.Cursor := crHandPoint;
    lblTit.OnClick := AvisoAtualizacaoClick;

    lblMsg := TsLabel.Create(pnl);
    lblMsg.Name := 'lblAtualizacaoAvisoMsg';
    lblMsg.Parent := pnl;
    lblMsg.Left := 12;
    lblMsg.Top := 24;
    lblMsg.Width := pnl.Width - 16;
    lblMsg.Height := 36;
    lblMsg.AutoSize := False;
    lblMsg.WordWrap := True;
    lblMsg.ParentFont := False;
    lblMsg.Font.Color := clTeal;
    lblMsg.Cursor := crHandPoint;
    lblMsg.OnClick := AvisoAtualizacaoClick;
  end;

  lblTit := TsLabel(pnl.FindComponent('lblAtualizacaoAvisoTitulo'));
  lblMsg := TsLabel(pnl.FindComponent('lblAtualizacaoAvisoMsg'));

  pnl.Visible := False;
  pnl.Caption := '';

  if versao_banco = versao then
    Exit;

  pnl.Visible := True;
  pnl.Height := 66;

  if Assigned(lblTit) then
    lblTit.Caption := 'ATUALIZACAO DISPONIVEL';

  if Assigned(lblMsg) then
    lblMsg.Caption := 'Nova versao disponivel (' + versao_banco + ').' + sLineBreak +
      'Clique para efetuar a atualizacao.';
end;

procedure TFRPRI.AvisoAtualizacaoClick(Sender: TObject);
var
  pnl: TsPanel;
begin
  pnl := TsPanel(FindComponent('pnlAtualizacaoAviso'));
  if Assigned(pnl) then
    pnl.Visible := False;

  DesabilitaTimers;
  Atualizacao;
end;

procedure TFRPRI.Atualizacao;
var
  progC: PAnsiChar;
begin
  try
    if BaixarNovaVersao then
    begin
      progC := 'OrbiUpdate.exe';
      WinExec(progC, SW_SHOWNORMAL);
      FMFUN.TerminarProcesso('TelasOrbi.exe');
      Application.Terminate;
    end
    else
      HabilitaTimers;
  except
    on E: Exception do
    begin
      HabilitaTimers;
      MessageDlg('Nao foi possivel baixar a atualizacao.' + sLineBreak +
        E.Message, mtWarning, [mbOk], 0);
    end;
  end;
end;

procedure TFRPRI.AtualizaSistema;
begin
  DesabilitaTimers;
  if versao_banco <> versao then
  begin
    // if dao.CN.Server = '200.180.91.99/3050' then exit;
    //TmUpdate.Enabled := False;
    if FMFUN.Dc_MessageDlg('Nova versão disponível. Efetuar Atualização?',
      mtConfirmation, [mbyes, mbno], 0, mrno) = mryes then
      Atualizacao
    else
    begin
      HabilitaTimers;
      ReiniciaTmUpdate := False;
     // TmUpdate.Enabled := False;
    end;
  end;
end;

function TFRPRI.BaixarNovaVersao: Boolean;
var
  arquivo, caminho, link: string;
  MyFile: TFileStream;
begin
  Result := False;
  caminho := ExtractFilePath(Application.ExeName);
  link := 'http://plasfan.ddns.com.br:9002/download/orbiupdate';
  arquivo := 'OrbiUpdate.exe'; // nome do arquivo para download

  MyFile := TFileStream.Create(caminho + arquivo, fmCreate);
  // local no hd e nome do arquivo com a extensão, onde vai salvar.
  try
    IdHTTPDownload.Request.UserAgent := 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)';
    try
      IdHTTPDownload.Get(link, MyFile); // fazendo o download pelo WorbyRest
      Result := True;
    except
      SysUtils.DeleteFile(caminho + arquivo);
      raise;
    end;
  finally
    IdHTTPDownload.disconnect;
    MyFile.Free;
  end;
end;

procedure TFRPRI.CheckPedidoPalm;
var
  Arquivos: TStringList;
begin
  ReiniciaTmPedidoPalm := False;
  if DM.ftpPedidosTablet.Host = '' then
    Exit;
  DesabilitaTimers;
  if TipUsu = '0' then
    Exit;

  Arquivos := TStringList.Create;
  if not DM.ftpPedidosTablet.Connected then
    DM.ftpPedidosTablet.Connect;
  DM.ftpPedidosTablet.TransferType := ftASCII;
  DM.ftpPedidosTablet.List(Arquivos, '*.txt', False);
  DM.ftpPedidosTablet.disconnect;
  // dao.Geral2('select * from PALM_LOTE where checado is null ');
  // if not dao.Q2.IsEmpty then
  if Arquivos.count > 0 then
  begin
    if MessageDlg
      ('Há novos Pedidos gerados pelo Sistema Palm. Desejas visualizar?',
      mtConfirmation, [mbyes, mbno], 0) = mryes then
    begin
      try
        Application.CreateForm(TFrPalmConexao, FrPalmConexao);
        FrPalmConexao.Aviso_Palm := True;
		SetaAcesso(FrPalmConexao.Caption);
        FrPalmConexao.ShowModal;
      finally
        FrPalmConexao.Free;
        TmPedidoPalm.Interval := 2000;
        ReiniciaTmPedidoPalm := True;
        HabilitaTimers;
        Arquivos.Free;

      end;
    end
    else
    begin
      TmPedidoPalm.Interval := 30000;
      ReiniciaTmPedidoPalm := True;
      HabilitaTimers;
      Arquivos.Free;
      DM.ftpPedidosTablet.disconnect;
    end;
  end;
end;

procedure TFRPRI.TmUpdateTimer(Sender: TObject);
begin
  ChecarAvisoAtualizacao;
end;

procedure TFRPRI.AlterarSenha1Click(Sender: TObject);
begin
  try
    Application.CreateForm(Tfm_alterar_senha, fm_alterar_senha);
	SetaAcesso(fm_alterar_senha.Caption);
    fm_alterar_senha.ShowModal;
  finally
    fm_alterar_senha.Free;
  end;
end;

procedure TFRPRI.Vendas3Click(Sender: TObject);
begin
  if representacao then
  begin
    if not FMFUN.ChecarPrazoAtualizacaoVendedor then
    begin
      MessageDlg
        ('É necessário efetuar a atualização de dados, antes de efetuar a venda.',
        mtWarning, [mbOk], 0);
      // MessageDlg('Espécie do XML não informado...', mtInformation, [mbOk], 0);
      Exit;
    end;
  end;

  try
    Application.CreateForm(TFr_vendas_industria2, Fr_vendas_industria2);
    mform := 'vendas_industria';
    Fr_vendas_industria2.Caption := 'Pedidos - Vendas';
	SetaAcesso(Fr_vendas_industria2.Caption);
    Fr_vendas_industria2.venda := True;
    Fr_vendas_industria2.ShowModal;
  finally
    Fr_vendas_industria2.Free;
  end;
end;

procedure TFRPRI.VendasSimplificado1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_pedido_simplificado, Fr_pedido_simplificado);
    mform := 'pedido_simplificado';
    Fr_pedido_simplificado.Caption := 'Pedidos - Vendas Simplificado';
    SetaAcesso(Fr_pedido_simplificado.Caption);
    Fr_pedido_simplificado.ShowModal;
  finally
    Fr_pedido_simplificado.Free;
  end;
end;

procedure TFRPRI.RemessaseDevolues1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_vendas_industria2, Fr_vendas_industria2);
    mform := 'vendas_devolucoes';
    Fr_vendas_industria2.Caption := 'Pedidos - Devoluções e Remessas';
    Fr_vendas_industria2.venda := False;
	SetaAcesso(Fr_vendas_industria2.Caption);
    Fr_vendas_industria2.ShowModal;
  finally
    Fr_vendas_industria2.Free;
  end;
end;

procedure TFRPRI.EnviodeLote1Click(Sender: TObject);
begin
  try
    Application.CreateForm(Tfm_nfe_envio_lote, fm_nfe_envio_lote);
	SetaAcesso(fm_nfe_envio_lote.Caption);
    fm_nfe_envio_lote.ShowModal;
  finally
    fm_nfe_envio_lote.Free;
  end;
end;

procedure TFRPRI.DANFe1Click(Sender: TObject);
begin
  try
    Application.CreateForm(Tfm_nfe_danfe, fm_nfe_danfe);
	SetaAcesso(fm_nfe_danfe.Caption);
    fm_nfe_danfe.ShowModal;
  finally
    fm_nfe_danfe.Free;
  end;
end;

procedure TFRPRI.PlanodeContas1Click(Sender: TObject);
begin
  try
    Application.CreateForm(Tfr_plano_contas, fr_plano_contas);
	SetaAcesso(fr_plano_contas.Caption);
    fr_plano_contas.ShowModal;
  finally
    fr_plano_contas.Free;
  end;
end;

procedure TFRPRI.GerarArquivosparaContabilidade1Click(Sender: TObject);
begin
  try
    Application.CreateForm(Tfm_nfe_arquivos, fm_nfe_arquivos);
	SetaAcesso(fm_nfe_arquivos.Caption);
    fm_nfe_arquivos.ShowModal;
  finally
    fm_nfe_arquivos.Free;
  end;
end;procedure TFRPRI.StatusEmissor1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_status_emissor, Fr_status_emissor);
	SetaAcesso(Fr_status_emissor.Caption);
    Fr_status_emissor.ShowModal;
  finally
    Fr_status_emissor.Free;
  end;
end;

procedure TFRPRI.Novo1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'comissoes_novo';
	SetaAcesso('comissoes_novo');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;

end;

procedure TFRPRI.NovoDetalhado1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'comissoes_novo_detalhado';
	SetaAcesso('comissoes_novo_detalhado');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.RegistrodePedidosDesfaturados1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'relatorio_pedidos_desfaturados';
	SetaAcesso('relatorio_pedidos_desfaturados');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.HistricodeMovimentaodeProduto1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'relatorio_movimentacao_produto';
	SetaAcesso('relatorio_movimentacao_produto');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.ContasaPagar2Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'contas_pagar';
	SetaAcesso('contas_pagar');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.Contasareceber2Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'contas_receber';
	SetaAcesso('contas_receber');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.ProdutosClculodoPreodeVenda1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'produto_calculo_preco_venda';
	SetaAcesso('produto_calculo_preco_venda');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.CategoriadeProdutos1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_categoria, Fr_categoria);
	SetaAcesso(Fr_categoria.Caption);
    Fr_categoria.ShowModal;
  finally
    Fr_categoria.Free;
  end;
end;

procedure TFRPRI.SubCategoriadeProdutos1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_subcategoria, Fr_subcategoria);
	SetaAcesso(Fr_subcategoria.Caption);
    Fr_subcategoria.ShowModal;
  finally
    Fr_subcategoria.Free;
  end;
end;

procedure TFRPRI.transportadora1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'relatorio_transportadora';
	SetaAcesso('relatorio_transportadora');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.Button1Click(Sender: TObject);
var
  imagem, Site, usuario_site, senha_site: string;
  Lista: TStringList;
  x: Integer;

  procedure AtualizaCategoriaWeb(categoria, nome, imagem: string);
  var
    Consulta: TStringStream;
  begin
    Consulta := TStringStream.Create('');
    Consulta.WriteString('modo=categoria');
    Consulta.WriteString('&id=' + categoria);
    Consulta.WriteString('&categoria=' + nome);
    Consulta.WriteString('&imagem=' + imagem);
    FMFUN.AtualizarSite(Consulta);
    Consulta.Free;
  end;

  procedure DeletaCategoriaWeb(categoria: string);
  var
    Consulta: TStringStream;
  begin
    Consulta := TStringStream.Create('');
    Consulta.WriteString('modo=deleta_categoria');
    Consulta.WriteString('&id=' + categoria);
    FMFUN.AtualizarSite(Consulta);
    Consulta.Free;
  end;

  procedure AtualizaSubCategoriaWeb(subcategoria, nome, imagem,
    categoria: string);
  var
    Consulta: TStringStream;
  begin

    Consulta := TStringStream.Create('');
    Consulta.WriteString('modo=subcategoria');
    Consulta.WriteString('&id=' + subcategoria);
    Consulta.WriteString('&subcategoria=' + nome);
    Consulta.WriteString('&imagem=' + imagem);
    Consulta.WriteString('&categoria=' + categoria);

    FMFUN.AtualizarSite(Consulta);
    Consulta.Free;

  end;

  procedure DeletaSubCategoriaWeb(subcategoria: string);
  var
    Consulta: TStringStream;
  begin
    Consulta := TStringStream.Create('');
    Consulta.WriteString('modo=deleta_subcategoria');
    Consulta.WriteString('&id=' + subcategoria);
    FMFUN.AtualizarSite(Consulta);
    Consulta.Free;
  end;

  procedure DeletaProdutoWeb(produto: string);
  var
    Consulta: TStringStream;
  begin
    Consulta := TStringStream.Create('');
    Consulta.WriteString('modo=deleta_produto');
    Consulta.WriteString('&id=' + produto);
    FMFUN.AtualizarSite(Consulta);
    Consulta.Free;
  end;

  procedure AtualizaProdutoWeb(produto, nome, subcategoria, Ord, promocao, obs,
    unidade, qtd_emb: string; preco_promocao: double);
  var
    Consulta: TStringStream;
  begin

    Consulta := TStringStream.Create('');
    Consulta.WriteString('modo=produto');
    Consulta.WriteString('&id=' + produto);
    Consulta.WriteString('&produto=' + nome);
    Consulta.WriteString('&subcategoria=' + subcategoria);
    Consulta.WriteString('&ord=' + Ord);
    Consulta.WriteString('&caracteristica=' + stringreplace(obs, ''#$D#$A'',
      '<br>', [rfReplaceAll]));
    Consulta.WriteString('&qtd_embalagem=' + qtd_emb);
    Consulta.WriteString('&unidade=' + unidade);
    Consulta.WriteString('&promocao=' + promocao);
    Consulta.WriteString('&valor' + formatfloat('R$ #,###,##0.00',
      preco_promocao));

    FMFUN.AtualizarSite(Consulta);

    Consulta.Free;
  end;

begin
  DesabilitaTimers;
  // try
  { dao.Geral1('SELECT a.SITE, a.USUARIO_SITE, a.LOGIN_SITE FROM CONFIGURACAO a');
    usuario_site := dao.Q1.fieldbyname('USUARIO_SITE').AsString;
    senha_site := dao.Q1.fieldbyname('LOGIN_SITE').AsString; }

  // dao.cn.StartTransaction;
  // dao.Geral2('select id, categoria, imagem, (select count(*) from subcategoria p where p.categoria = s.id AND P.STATUS <> ''S''') as total from categoria s');
  (* dao.Geral2('select COD_PRODUTO, NOM_PRODUTO, STATUS, SUBCATEGORIA, PROMOCAO, ORD_PAUTA, PRECO_PROMOCAO, CODIGO_BARRA, observacao, UNIDADE, QTD_EMBALAGEM from PRODUTO P where P.STATUS <> ''S''');
    Lista := Tstringlist.Create;

    {     dao.Geral2('select v1.NUMDOC from vendas1 v1 where v1.NUMDOC in ( 10113,10102,10115,10095,10089,10092,10052,10066,10071,10078,10074,10070,10064,10060,10076,10081,10061,10058,10037,10042,10035,10049,10029,10039,10050)');}

    //dao.Geral2('SELECT a.PROMOCAO_ID, a.COD_PRODUTO, a.PRECO_PROMOCAO FROM PROMOCAO_ITEM a where a.PROMOCAO_ID = 40');
    //dao.Geral2('SELECT a.COD_PRODUTO FROM PRODUTO a ');

    dao.q2.First;
    while not dao.q2.eof do
    begin
    Lista.Add(dao.q2.fieldbyname('COD_PRODUTO').AsString);
    dao.q2.next;
    end;

    fm_splash.ggProgress.MaxValue := Lista.Count;
    fm_splash.lbStatus.Caption := 'Carregando Itens...';
    fm_splash.ggProgress.progress := 0;
    fm_splash.Show;

    for x := 0 to Lista.Count - 1 do
    begin
    dao.Geral2('select COD_PRODUTO, NOM_PRODUTO, STATUS, SUBCATEGORIA, PROMOCAO, ORD_PAUTA, PRECO_PROMOCAO, CODIGO_BARRA, observacao, UNIDADE, QTD_EMBALAGEM from PRODUTO P where P.COD_PRODUTO = ' + LISTA[X]);
    DeletaProdutoWeb(dao.q2.fieldbyname('COD_PRODUTO').AsString);

    AtualizaProdutoWeb(
    dao.q2.fieldbyname('COD_PRODUTO').AsString,
    dao.q2.fieldbyname('NOM_PRODUTO').AsString,
    dao.q2.fieldbyname('SUBCATEGORIA').AsString,
    dao.q2.fieldbyname('ORD_PAUTA').AsString,
    dao.q2.fieldbyname('PROMOCAO').AsString,
    dao.q2.fieldbyname('Observacao').AsString,
    dao.q2.fieldbyname('unidade').AsString,
    dao.q2.fieldbyname('qtd_embalagem').AsString,
    dao.q2.fieldbyname('PRECO_PROMOCAO').AsFloat);

    //        FMFUN.AtualizaDadosComissao(dao.q2.fieldbyname('numdoc').AsString);

    //     if dao.q2.fieldbyname('CODIGO_BARRA').IsNull then
    //      FMFUN.GravaCodeBar(dao.q2.fieldbyname('COD_PRODUTO').AsString,   Tipo_Etiqueta);
    //}
    fm_splash.ggProgress.AddProgress(1);
    fm_splash.Refresh;
    //sleep(10);
    end;

    // dao.cn.Commit;

    Lista.Clear;
    Lista.free;

    showmessage('finalizado!!');
    except
    dao.cn.Rollback;
    end;
  *)
  // ImportarPedidoPalm;
  {
    try
    dao.cn.StartTransaction;
    //  dao.Geral2('select id, categoria, imagem, (select count(*) from subcategoria p where p.categoria = s.id AND P.STATUS <> ''S''') as total from categoria s');
    Q_Geral.SQL.clear;
    Q_Geral.SQL.Text := 'SELECT a.ID, a.CATEGORIA, a.IMAGEM, a.IMAGEM_BD FROM CATEGORIA a ';
    Q_Geral.open;

    //  dao.Geral2('select v1.NUMDOC from vendas1 v1 where v1.NUMDOC in ( 10113,10102,10115,10095,10089,10092,10052,10066,10071,10078,10074,10070,10064,10060,10076,10081,10061,10058,10037,10042,10035,10049,10029,10039,10050)');
    fm_splash.ggProgress.MaxValue := Q_Geral.RecordCount;
    fm_splash.lbStatus.Caption := 'Carregando Itens...';
    fm_splash.ggProgress.progress := 0;
    fm_splash.Show;
    Q_Geral.First;
    while not Q_Geral.eof do
    begin
    qrGravaFoto.close;
    qrGravaFoto.ParamByName('bitmap_foto').LoadFromFile('C:\AppServ\www\site_novo\categoria\' + dao.q2.fieldbyname('IMAGEM').AsString);
    qrGravaFoto.ParamByName('id').AsString := dao.q2.fieldbyname('id').AsString;
    qrGravaFoto.open;

    DeletaCategoriaWeb(Q_Geral.fieldbyname('ID').AsString);
    AtualizaCategoriaWeb(Q_Geral.fieldbyname('ID').AsString, Q_Geral.fieldbyname('CATEGORIA').AsString, Q_Geral.fieldbyname('IMAGEM').AsString);

    fm_splash.ggProgress.AddProgress(1);
    fm_splash.Refresh;
    Q_Geral.next;
  }

  Lista := TStringList.Create;

  { Q_Geral.sql.Clear;
    Q_Geral.sql.Text :=
    'SELECT a.ID, a.SUBCATEGORIA, a.IMAGEM, a.imagem_bd, a.CATEGORIA FROM SUBCATEGORIA a where a.imagem is not null ';
    Q_Geral.open; }

  { Q_Geral.SQL.clear;
    Q_Geral.SQL.Text := 'SELECT a.ID, a.CATEGORIA, a.IMAGEM, a.IMAGEM_BD FROM CATEGORIA a ';
    Q_Geral.open;
  }
  {
    Q_Geral.sql.Clear;
    Q_Geral.sql.Text :=
    'select COD_PRODUTO as ID, NOM_PRODUTO, STATUS, SUBCATEGORIA, PROMOCAO, ORD_PAUTA, PRECO_PROMOCAO, CODIGO_BARRA from PRODUTO P where revenda = ''S'' and status <> ''S'' order by cod_produto ';
    Q_Geral.open;

    Q_Geral.First;
    while not Q_Geral.Eof do
    begin
    Lista.Add(Q_Geral.fieldbyname('ID').AsString);
    Q_Geral.Next;
    end;
  }
  {
    Q_Geral.SQL.clear;
    Q_Geral.SQL.Text := 'select COD_PRODUTO, NOM_PRODUTO, STATUS, SUBCATEGORIA, PROMOCAO, ORD_PAUTA, PRECO_PROMOCAO, CODIGO_BARRA from PRODUTO P where status <> ''S'' order by cod_produto ';
    Q_Geral.open;
  }
  // dao.Geral2('select v1.NUMDOC from vendas1 v1 where v1.NUMDOC in ( 10113,10102,10115,10095,10089,10092,10052,10066,10071,10078,10074,10070,10064,10060,10076,10081,10061,10058,10037,10042,10035,10049,10029,10039,10050)');

  { fm_splash.ggProgress.MaxValue := Lista.count;
    fm_splash.lbStatus.Caption := 'Carregando Itens...';
    fm_splash.ggProgress.Progress := 0;
    fm_splash.show;

    for x := 0 to Lista.count - 1 do
    begin }
  { qrGravaFoto.close;
    qrGravaFoto.ParamByName('bitmap_foto').LoadFromFile('C:\AppServ\www\site_novo\produto\' + Q_Geral.fieldbyname('IMAGEM').AsString);
    qrGravaFoto.ParamByName('id').AsString := Q_Geral.fieldbyname('id').AsString;
    qrGravaFoto.open; }
  // DeletaCategoriaWeb(Lista[x]);
  // DeletaSubCategoriaWeb(Lista[x]);
  (*
    DeletaProdutoWeb(Lista[x]);
    Q_Geral1.sql.Clear;
    // Q_Geral1.sql.Text :='SELECT a.ID, a.SUBCATEGORIA, a.IMAGEM, a.imagem_bd, a.CATEGORIA FROM SUBCATEGORIA a where a.id = '+ Lista[x];
    // Q_Geral1.sql.Text :=  'SELECT a.ID, a.CATEGORIA, a.IMAGEM, a.IMAGEM_BD FROM CATEGORIA a where a.id = '+ Lista[x]; *)
  { Q_Geral1.sql.Text :=
    'select COD_PRODUTO, NOM_PRODUTO, STATUS, SUBCATEGORIA, PROMOCAO, ORD_PAUTA, PRECO_PROMOCAO, CODIGO_BARRA, OBSERVACAO, UNIDADE, QTD_EMBALAGEM from PRODUTO P where P.COD_PRODUTO = '
    + Lista[x] + ' order by cod_produto ';
    Q_Geral1.open;

    AtualizaProdutoWeb(Q_Geral1.fieldbyname('COD_PRODUTO').AsString,
    Q_Geral1.fieldbyname('NOM_PRODUTO').AsString,
    Q_Geral1.fieldbyname('SUBCATEGORIA').AsString,
    Q_Geral1.fieldbyname('ORD_PAUTA').AsString,
    Q_Geral1.fieldbyname('PROMOCAO').AsString,
    Q_Geral1.fieldbyname('Observacao').AsString,
    Q_Geral1.fieldbyname('unidade').AsString,
    Q_Geral1.fieldbyname('qtd_embalagem').AsString,
    Q_Geral1.fieldbyname('PRECO_PROMOCAO').AsFloat);

    // imagem := {ExtractFilePath(Application.ExeName) + Q_Geral1.fieldbyname('IMAGEM').AsString;
  }
  { if not Q_Geral1.fieldbyname('IMAGEM_BD').IsNull then
    Q_Geral1.fieldbyname('IMAGEM_BD').SaveToFile(imagem); }

  { AtualizaSubCategoriaWeb(Q_Geral1.fieldbyname('ID').AsString,
    Q_Geral1.fieldbyname('SUBCATEGORIA').AsString, imagem,
    Q_Geral1.fieldbyname('CATEGORIA').AsString);
  }

  { AtualizaCategoriaWeb(Q_Geral1.fieldbyname('ID').AsString,
    Q_Geral1.fieldbyname('categoria').AsString, imagem);
  }

  Q_Geral1.sql.Text :=
    ' SELECT a.ID, a.COD_PRODUTO, a.QTD_ACERTO, a.OPERACAO, a.DATA_ACERTO, a.QTD_ESTOQUE '
    + ' FROM ACERTO_ESTOQUE a ' + ' WHERE a.DATA_ACERTO = ''11.03.2016''';
  Q_Geral1.open;
  Q_Geral1.First;

  while not Q_Geral1.Eof do
  begin
    Lista.Add(Q_Geral1.fieldbyname('ID').AsString);
    Q_Geral1.Next;
  end;

  fm_splash.ggProgress.MaxValue := Q_Geral1.RecordCount;
  fm_splash.lbStatus.Caption := 'Carregando Itens...';
  fm_splash.ggProgress.Progress := 0;
  fm_splash.show;

  for x := 0 to Lista.count - 1 do
  begin
    Q_Geral1.sql.Text :=
      ' SELECT a.ID, a.COD_PRODUTO, a.QTD_ACERTO, a.OPERACAO, a.DATA_ACERTO, a.QTD_ESTOQUE '
      + ' FROM ACERTO_ESTOQUE a ' + ' WHERE a.id = ' + Lista[x];
    Q_Geral1.open;


    fm_splash.ggProgress.AddProgress(1);
    fm_splash.Refresh;

  end;

  { end;
    Lista.Clear;
    Lista.Free;
  }
  ShowMessage('Finalizado!!!');

end;

procedure TFRPRI.EmissoRecibos1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_recibo, Fr_recibo);
	SetaAcesso(Fr_recibo.Caption);
    Fr_recibo.ShowModal;
  finally
    Fr_recibo.Free;
  end;
end;

procedure TFRPRI.ImportarPedidoPalm;
var
  pedidoLote: TStringList;
  pathSaida, sql_insert, nr_conexao, numdoc, nr_pedido_palm, UF_Cliente, cst,
    cod_fiscal_item: string;
  x, tot_linhas, Aliquota_ICMS_Interno: Integer;
  VLR_BC, SUB_TOTAL, VLR_ICMS_ITEM, VLR_BC_ST, MVA, VLR_AGR_ITEM, ICMS_ITEM,
    vlr_icms_st, ipi_item, vlr_ipi_item, perc_desc, vlr_comissao: real;
  procedure CalculoIcmsItem;
  begin
    VLR_BC := SUB_TOTAL;

    VLR_ICMS_ITEM := VLR_BC * (ICMS_ITEM / 100);
    if (cst = '60') or (cst = '90') then
    begin
      // Buscar a Base de Cáculo ST
      VLR_BC_ST := RoundTo((SUB_TOTAL * (1 + (MVA / 100))), -2);
      vlr_icms_st := RoundTo(((VLR_BC_ST * (Aliquota_ICMS_Interno / 100)) -
        VLR_ICMS_ITEM), -2);
      VLR_BC := 0;
      VLR_ICMS_ITEM := 0;
      VLR_AGR_ITEM := MVA;
      ICMS_ITEM := 0;
    end
    else
    begin
      VLR_BC_ST := 0;
      vlr_icms_st := 0;
      VLR_AGR_ITEM := 0;
    end;

    if cliente_isento_icms or cliente_consumidor_final then
    begin
      VLR_BC_ST := 0;
      vlr_icms_st := 0;
      VLR_BC := 0;
      VLR_ICMS_ITEM := 0;
      ICMS_ITEM := 0;
    end;
  end;

begin
  pathSaida := ExtractFilePath(Application.ExeName) + 'Transmicao\';
  pedidoLote := TStringList.Create;
  pedidoLote.LoadFromFile(pathSaida + '0162009a.txt');
  tot_linhas := pedidoLote.count;
  for x := 0 to tot_linhas - 1 do
  begin
    if Copy(pedidoLote[x], 1, 2) = '60' then
    begin
      nr_conexao := Copy(pedidoLote[x], 6, 6);
      try
        if not(dao.cn.InTransaction) then
          dao.cn.StartTransaction;
        sql_insert :=
          'INSERT INTO PALM_LOTE (NR_CONEXAO, COD_REPRESENTANTE, DATA_CONEXAO, HORA_CONEXAO, QTDE_PEDIDOS, QTDE_VISITAS_NEGATIVAS) '
          + ' VALUES (' + nr_conexao + ',' + Copy(pedidoLote[x], 3, 3) + ',' +
          QuotedStr(FMFUN.InverteData(Copy(pedidoLote[x], 12, 10))) + ',' +
          QuotedStr(Copy(pedidoLote[x], 22, 5)) + ',' + Copy(pedidoLote[x], 27,
          3) + ',' + Copy(pedidoLote[x], 30, 3) + ')';
        dao.execsql(sql_insert);
        dao.cn.Commit;
      except
        dao.cn.Rollback;
      end;
    end;
    if Copy(pedidoLote[x], 1, 2) = '70' then
    begin
      try
        if not(dao.cn.InTransaction) then
          dao.cn.StartTransaction;
        sql_insert :=
          'INSERT INTO VENDAS1 (COD_REPRESENTANTE, NR_PEDIDO_PALM, DTADOC, HORA, COD_CLIENTE, '
          + '                     FATURADO, COD_FOP, COD_PRAZO_PGTO, TOT_BRUTO, TOT_LIQUIDO, '
          + '                     OBSERVACOES_PEDIDO, PALM_NR_CONEXAO, COD_EMPRESA) '
          + ' VALUES (' + Copy(pedidoLote[x], 3, 3) + ',' +
          Copy(pedidoLote[x], 6, 7) + ',' +
          QuotedStr(FMFUN.InverteData(Copy(pedidoLote[x], 14, 10))) + ',' +
          QuotedStr(Copy(pedidoLote[x], 29, 5)) + ',' + Copy(pedidoLote[x], 34,
          6) + ', 0,' + Copy(pedidoLote[x], 40, 3) + ',' +
          Copy(pedidoLote[x], 43, 3) + ',' + Copy(pedidoLote[x], 46, 10) + ',' +
          Copy(pedidoLote[x], 56, 10) + ',' +
          QuotedStr(Copy(pedidoLote[x], 104, 150)) + ',' + nr_conexao + ',1)';
        dao.execsql(sql_insert);
        dao.cn.Commit;
      except
        dao.cn.Rollback;
      end;

      nr_pedido_palm := Copy(pedidoLote[x], 6, 7);
      dao.geral2('select NUMDOC FROM VENDAS1 WHERE NR_PEDIDO_PALM = ' +
        nr_pedido_palm);
      numdoc := dao.Q2.fieldbyname('numdoc').AsString;
      dao.Geral3
        ('SELECT CID.UF FROM CIDADES CID INNER JOIN CLIENTE C ON (C.COD_CIDADE = CID.COD_CIDADE AND C.COD_CLIENTE = '
        + Copy(pedidoLote[x], 34, 6) + ')');
      UF_Cliente := dao.Q3.fieldbyname('UF').AsString;
    end;

    if Copy(pedidoLote[x], 1, 2) = '72' then
    begin

      dao.Geral3('                                              ' +
        ' SELECT                                                 ' +
        '   P.NOM_PRODUTO,                                       ' +
        '   P.PRECO_VENDA,                                       ' +
        '   P.UNIDADE,                                           ' +
        '   P.QTD_EMBALAGEM,                                     ' +
        '   P.GRADE,                                             ' +
        '   P.QTD_ESTOQUE,                                       ' +
        '   P.QTD_RESERVADO,                                     ' +
        '   P.CUSTO,                                             ' +
        '   P.LUCRO,                                             ' +
        '   N.CODIGO AS NCM,                                     ' +
        '   COALESCE(N.MARGEM_VALOR_AGRE_DENTRO ,0) AS MARGEM_VALOR_AGRE_DENTRO, '
        + '   COALESCE(N.MARGEM_VALOR_AGRE_FORA ,0) AS MARGEM_VALOR_AGRE_FORA, '
        + '   N.IPI_ALIQUOTA,                                      ' +
        '   COALESCE(N.TRIB_ICMS, P.TRIB_ICMS) AS TRIB_ICMS,     ' +
        '   N.CESTA_BASICA                                       ' +
        ' FROM                                                   ' +
        '   PRODUTO P                                            ' +
        ' LEFT OUTER JOIN GRUPO G ON (G.COD_GRUPO = P.COD_GRUPO) ' +
        ' LEFT OUTER JOIN NCM N ON (N.CODIGO = G.NCM OR N.CODIGO = P.NCM) ' +
        ' WHERE P.COD_PRODUTO = ' + trim(Copy(pedidoLote[x], 16, 10)));

      if dao.Q3.fieldbyname('trib_icms').AsString = '0' then
        cst := '00';
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
        cst := '60';
      if dao.Q3.fieldbyname('trib_icms').AsString = '9' then
        cst := '70';
      if dao.Q3.fieldbyname('trib_icms').AsString = '10' then
        cst := '90';
      if dao.Q3.fieldbyname('CESTA_BASICA').AsString = 'S' then
        cst := '90';

      cod_fiscal_item := dao.Q3.fieldbyname('trib_icms').AsString;

      if UF_Cliente = 'SC' then
        MVA := dao.Q3.fieldbyname('MARGEM_VALOR_AGRE_DENTRO').AsFloat
      else
        MVA := dao.Q3.fieldbyname('MARGEM_VALOR_AGRE_FORA').AsFloat;

      if dao.Q3.fieldbyname('cesta_basica').AsString = 'S' then
        Aliquota_ICMS_Interno := 12
      else
        Aliquota_ICMS_Interno := 17;

      SUB_TOTAL := STRTOFLOAT(stringreplace(Copy(pedidoLote[x], 42, 10), '.',
        ',', [rfReplaceAll]));

      ipi_item := dao.Q3.fieldbyname('IPI_ALIQUOTA').AsFloat;
      vlr_ipi_item := SUB_TOTAL * (dao.Q3.fieldbyname('IPI_ALIQUOTA')
        .AsFloat / 100);

      CalculoIcmsItem;
      vlr_comissao := SUB_TOTAL *
        STRTOFLOAT(stringreplace(Copy(pedidoLote[x], 69, 7), '.', ',',
        [rfReplaceAll]));
      perc_desc := (STRTOFLOAT(stringreplace(Copy(pedidoLote[x], 52, 10), '.',
        ',', [rfReplaceAll])) / (STRTOFLOAT(stringreplace(Copy(pedidoLote[x],
        77, 9), '.', ',', [rfReplaceAll])) *
        STRTOFLOAT(stringreplace(Copy(pedidoLote[x], 26, 6), '.', ',',
        [rfReplaceAll])))) * (-1);
      try
        if not(dao.cn.InTransaction) then
          dao.cn.StartTransaction;
        sql_insert :=
          'INSERT INTO VENDAS2 (NUMDOC, COD_PRODUTO, QTD, PRECO, SUB_TOTAL, ' +
          ' NR_PEDIDO_PALM, PRECO_BRUTO, VOLUME, NCM, TRIB_ICMS, VLR_BC, VLR_ICMS_ITEM, VLR_BC_ST, '
          + ' VLR_AGR_ITEM, ICMS_ITEM, vlr_icms_st, ipi_item, vlr_ipi_item, vlr_comissao, desconto, cod_fiscal_item) '
          + ' VALUES (' + numdoc + ',' + Copy(pedidoLote[x], 16, 10) + ',' +
          Copy(pedidoLote[x], 26, 6) + ',' + Copy(pedidoLote[x], 32, 10) + ',' +
          Copy(pedidoLote[x], 42, 10) + ',' + nr_pedido_palm + ',' +
          Copy(pedidoLote[x], 77, 9) + ',' + Copy(pedidoLote[x], 86, 9) + ',' +
          QuotedStr(dao.Q3.fieldbyname('ncm').AsString) + ',' + QuotedStr(cst) +
          ',' + stringreplace(formatfloat('0.00', VLR_BC), ',', '.',
          [rfReplaceAll]) + ',' + stringreplace
          (formatfloat('0.00', VLR_ICMS_ITEM), ',', '.', [rfReplaceAll]) + ',' +
          stringreplace(formatfloat('0.00', VLR_BC_ST), ',', '.', [rfReplaceAll]
          ) + ',' + stringreplace(formatfloat('0.00', VLR_AGR_ITEM), ',', '.',
          [rfReplaceAll]) + ',' + stringreplace(formatfloat('0.00', ICMS_ITEM),
          ',', '.', [rfReplaceAll]) + ',' +
          stringreplace(formatfloat('0.00', vlr_icms_st), ',', '.',
          [rfReplaceAll]) + ',' + stringreplace(formatfloat('0.00', ipi_item),
          ',', '.', [rfReplaceAll]) + ',' +
          stringreplace(formatfloat('0.00', vlr_ipi_item), ',', '.',
          [rfReplaceAll]) + ',' + stringreplace
          (formatfloat('0.00', vlr_comissao), ',', '.', [rfReplaceAll]) + ',' +
          stringreplace(formatfloat('0.00', perc_desc), ',', '.', [rfReplaceAll]
          ) + ',' + QuotedStr(cod_fiscal_item) + ')';
        dao.execsql(sql_insert);
        dao.cn.Commit;
      except
        dao.cn.Rollback;
      end;

    end;
  end;
end;

procedure TFRPRI.PedidosxPrateleira1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'prateleira';
	SetaAcesso('prateleira');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.RelaodePedidosImportadosdoSistemaPalm1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'palm';
	SetaAcesso('palm');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.TmPedidoPalmTimer(Sender: TObject);
begin
  if (Tipo_usuario = '3') or (Tipo_usuario = '5') then
    CheckPedidoPalm;
end;

procedure TFRPRI.tmHoraTimer(Sender: TObject);
begin
  FMFUN.TrimAppMemorySize;
  SB.Panels[2].Text := formatdatetime
    ('dddd", "dd "de" mmmmm "de" yyyy - hh:mm:ss', now);

  if not Habilita_Consultas then
    Exit;

  if (GetASyncKeyState(VK_F2) <> 0) then
  begin
    if (fr_produtos_detalhes <> nil) then
      Exit;
    try
      Application.CreateForm(Tfr_produtos_detalhes, fr_produtos_detalhes);
	  SetaAcesso(fr_produtos_detalhes.caption);
      fr_produtos_detalhes.ShowModal;
    finally
      fr_produtos_detalhes.Free;
      fr_produtos_detalhes := nil;
    end;

  end;

  if (GetASyncKeyState(VK_F3) <> 0) then
  begin
    if (fr_ultimas_vendas <> nil) then
      Exit;
    try
      Application.CreateForm(Tfr_ultimas_vendas, fr_ultimas_vendas);
	  SetaAcesso(fr_ultimas_vendas.caption);
      fr_ultimas_vendas.ShowModal;
    finally
      fr_ultimas_vendas.Free;
      fr_ultimas_vendas := nil;
    end;

  end;

  if (GetASyncKeyState(VK_F11) <> 0) then
  begin
    if (fr_etiquetas_multiplos_produtos <> nil) then
      Exit;
    try
      Application.CreateForm(Tfr_etiquetas_multiplos_produtos, fr_etiquetas_multiplos_produtos);
  	  SetaAcesso(fr_etiquetas_multiplos_produtos.caption);
      fr_etiquetas_multiplos_produtos.ShowModal;
    finally
      fr_etiquetas_multiplos_produtos.Free;
      fr_etiquetas_multiplos_produtos := nil;
    end;

  end;

end;

procedure TFRPRI.NFComplementar1Click(Sender: TObject);
begin
  try
    Application.CreateForm(Tfr_nfe_complementar, fr_nfe_complementar);
	SetaAcesso(fr_nfe_complementar.caption);
    fr_nfe_complementar.ShowModal;
  finally
    fr_nfe_complementar.Free;
  end;
end;

procedure TFRPRI.MalaDiretaPromoes1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFmMalaDireta, FmMalaDireta);
	SetaAcesso(FmMalaDireta.caption);
    FmMalaDireta.ShowModal;
  finally
    FmMalaDireta.Free;
  end;
end;

procedure TFRPRI.ransfernciadeValoresentreContas1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFm_Transf_Valores, Fm_Transf_Valores);
	SetaAcesso(Fm_Transf_Valores.caption);
    Fm_Transf_Valores.ShowModal;
  finally
    Fm_Transf_Valores.Free;
  end;
end;

procedure TFRPRI.Extrato1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'Extrato';
	SetaAcesso('Extrato');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.PlanodeContas2Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'Plano Contas Lista';
	SetaAcesso('Plano Contas Lista');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.BaixarFretesCombinados1Click(Sender: TObject);
begin
  try
    Application.CreateForm(Tfr_frete_combinado, fr_frete_combinado);
	SetaAcesso(fr_frete_combinado.caption);
    fr_frete_combinado.ShowModal;
  finally
    fr_frete_combinado.Free;
  end;
end;

procedure TFRPRI.ProdutosEtiquetas1Click(Sender: TObject);
begin
  SetaAcesso('Impressao de Etiquetas - Multiplos Produtos');
  Tfr_etiquetas_multiplos_produtos.Executar('', 1);
end;

procedure TFRPRI.PlanodeContas3Click(Sender: TObject);
begin
  try
    Application.CreateForm(Tfr_plano_contas_consulta, fr_plano_contas_consulta);
    fr_plano_contas_consulta.Pagos := False;
	SetaAcesso(fr_plano_contas_consulta.caption);
    fr_plano_contas_consulta.ShowModal;
  finally
    fr_plano_contas_consulta.Free;
  end;
end;

procedure TFRPRI.Vendas4Click(Sender: TObject);
begin
  try
    Application.CreateForm(tfr_olap_vendas, fr_olap_vendas);
	SetaAcesso(fr_olap_vendas.caption);
    fr_olap_vendas.ShowModal;
  finally
    fr_olap_vendas.Free;
  end;
end;

procedure TFRPRI.CalcularSalrios1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFmCalcularSalario, FmCalcularSalario);
	SetaAcesso(FmCalcularSalario.caption);
    FmCalcularSalario.ShowModal;
  finally
    FmCalcularSalario.Free;
  end;
end;

procedure TFRPRI.CalcularComisses1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFmCalcularComissao, FmCalcularComissao);
	SetaAcesso(FmCalcularSalario.caption);
    FmCalcularComissao.ShowModal;
  finally
    FmCalcularComissao.Free;
  end;
end;

procedure TFRPRI.PosiodeEstoqueInventrio1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'relatorio_estoque_inventario';
	SetaAcesso('relatorio_estoque_inventario');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.NovoSimplificado1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'comissoes_novo_simplificado';
	SetaAcesso('comissoes_novo_simplificado');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.GradedeComisses1Click(Sender: TObject);
begin
  try
    Application.CreateForm(Tfrm_grade_comissao, frm_grade_comissao);
	SetaAcesso(frm_grade_comissao.Caption);
    frm_grade_comissao.ShowModal;
  finally
    frm_grade_comissao.Free;
  end;
end;

procedure TFRPRI.CAContasLiquidadas1Click(Sender: TObject);
begin
  try
    Application.CreateForm(Tfr_plano_contas_consulta, fr_plano_contas_consulta);
    fr_plano_contas_consulta.Pagos := True;
    fr_plano_contas_consulta.Caption := 'Contas Líquidadas.';
	SetaAcesso(fr_plano_contas_consulta.Caption);
    fr_plano_contas_consulta.ShowModal;
  finally
    fr_plano_contas_consulta.Free;
  end;
end;

procedure TFRPRI.AcertodeEstoque2Click(Sender: TObject);
begin
  try
    Application.CreateForm(Tfr_acerto_estoque, fr_acerto_estoque);
	SetaAcesso(fr_acerto_estoque.Caption);
    fr_acerto_estoque.ShowModal;
  finally
    fr_acerto_estoque.Free;
  end;
end;

procedure TFRPRI.TmContaVencidaTimer(Sender: TObject);
begin
  if TipUsu = '2' then
    AvisoContaPagarVencida;
end;

procedure TFRPRI.C8Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'cr_baixadas';
	SetaAcesso('cr_baixadas');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.C9Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'ranking_vendas_completo';
  	SetaAcesso(tipo_relatorio);
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.CAClculoPLR1Click(Sender: TObject);
begin
  try
    Application.CreateForm(Tfr_calculo_plr_consulta, fr_calculo_plr_consulta);
	SetaAcesso(fr_calculo_plr_consulta.caption);
    fr_calculo_plr_consulta.ShowModal;
  finally
    fr_calculo_plr_consulta.Free;
  end;
end;

procedure TFRPRI.Representantes1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'relatorio_representante';
	SetaAcesso('relatorio_representante');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

function TFRPRI.BuscaEndereco(cep: string): TStringList;
var
  TSConsulta, TSResposta: TStringList;
  Resposta: TStringStream;
  Resultado, cidade, uf: string;
begin
  Resposta := TStringStream.Create('');
  TSConsulta := TStringList.Create;
  TSConsulta.Values['&cep'] := LimpaCNPJ(cep);
  TSConsulta.Values['&formato'] := 'xml';
  TSConsulta.Values['&chave'] := '1T0OETpsVbHf.6oHZVyWyQLaLKCyeq0';
  try
    idHttpGeral.Request.UserAgent :=
      'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)';
    // idHttpGeral.Post('http://cep.republicavirtual.com.br/web_cep.php?', TSConsulta, Resposta);
    idHttpGeral.Post('http://www.buscarcep.com.br/?', TSConsulta, Resposta);
  except
    Exit;
  end;
  XMLGeral.DOMVendor := GetDOMVendor('Open XML');
  XMLGeral.Active := True;
  XMLGeral.Encoding := 'iso-8859-1';
  XMLGeral.LoadFromStream(Resposta);
  TSConsulta.Free;
  Resposta.Free;

  TSResposta := TStringList.Create;
  TSResposta.Values['resultado'] := XMLGeral.DocumentElement.ChildNodes.FindNode
    ('retorno').ChildNodes.FindNode('resultado').Text;

  if TSResposta.Values['resultado'] = '1' then
  begin
    TSResposta.Values['cidade'] := XMLGeral.DocumentElement.ChildNodes.FindNode
      ('retorno').ChildNodes.FindNode('ibge_municipio').Text;
    if XMLGeral.DocumentElement.ChildNodes.FindNode('retorno')
      .ChildNodes.FindNode('bairro') <> nil then
      TSResposta.Values['bairro'] :=
        FMFUN.uppercase(XMLGeral.DocumentElement.ChildNodes.FindNode('retorno')
        .ChildNodes.FindNode('bairro').Text);
    if XMLGeral.DocumentElement.ChildNodes.FindNode('retorno')
      .ChildNodes.FindNode('tipo_logradouro') <> nil then
      TSResposta.Values['endereco'] :=
        FMFUN.uppercase(XMLGeral.DocumentElement.ChildNodes.FindNode('retorno')
        .ChildNodes.FindNode('tipo_logradouro').Text + ' ' +
        XMLGeral.DocumentElement.ChildNodes.FindNode('retorno')
        .ChildNodes.FindNode('logradouro').Text);
  end;
  XMLGeral.Active := False;

  Result := TSResposta;
end;

function TFRPRI.BuscaCEP(tipo_logradouro, logradouro, uf, cidade, bairro,
  Numero: string): TStringList;
var
  TSConsulta, TSResposta: TStringList;
  Resposta: TStringStream;
  Resultado, numero_inicial, numero_final, complemento: string;
  NodePai, NodeFilho, NodeSec, NodeTmp, NodeAux: IXMLNode;
begin
  Resposta := TStringStream.Create('');
  TSConsulta := TStringList.Create;
  if tipo_logradouro <> '' then
    TSConsulta.Values['&tipo_logradouro'] := tipo_logradouro;
  if logradouro <> '' then
    TSConsulta.Values['&logradouro'] := logradouro;
  TSConsulta.Values['&uf'] := uf;
  TSConsulta.Values['&cidade'] := cidade;
  if bairro <> '' then
    TSConsulta.Values['&bairro'] := bairro;
  TSConsulta.Values['&formato'] := 'xml';
  TSConsulta.Values['&chave'] := '1T0OETpsVbHf.6oHZVyWyQLaLKCyeq0';

  try
    idHttpGeral.Request.UserAgent :=
      'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)';
    // idHttpGeral.Post('http://cep.republicavirtual.com.br/web_cep.php?', TSConsulta, Resposta);
    idHttpGeral.Post('http://www.buscarcep.com.br/?', TSConsulta, Resposta);
  except
    Exit;
  end;
  XMLGeral.DOMVendor := GetDOMVendor('Open XML');
  XMLGeral.Active := True;
  XMLGeral.Encoding := 'iso-8859-1';
  XMLGeral.LoadFromStream(Resposta);
  TSConsulta.Free;
  Resposta.Free;

  NodePai := XMLGeral.DocumentElement.ChildNodes.FindNode('retorno');
  // Esse nó vai ser usado no LOOP
  NodeSec := NodePai;
  NodeSec.ChildNodes.First;
  TSResposta := TStringList.Create;
  repeat
    TSResposta.Values['resultado'] := NodeSec.ChildNodes.FindNode
      ('resultado').Text;
    if TSResposta.Values['resultado'] = '1' then
    begin
      if NodeSec.ChildNodes.FindNode('complemento') <> nil then
      begin
        if NodeSec.ChildNodes.FindNode('complemento').Text <> '' then
        begin
          complemento := NodeSec.ChildNodes.FindNode('complemento').Text;
          if pos('- de ', complemento) = 1 then
          begin
            numero_inicial :=
              trim(Copy(complemento, pos('- de ', complemento) + 5,
              Length(complemento)));
            numero_inicial :=
              trim(Copy(numero_inicial, 1, pos(' ', numero_inicial)));
          end;
          if pos('ao fim', complemento) > 0 then
            numero_final := '99999';
          if pos('até', complemento) > 0 then
          begin
            numero_inicial := '1';
            numero_final :=
              trim(Copy(complemento, pos('- até ', complemento) + 6,
              Length(complemento)));
            numero_final := trim(Copy(numero_final, 1, pos(' ', numero_final)));
          end;
          if pos(' a ', complemento) > 0 then
          begin
            numero_final := trim(Copy(complemento, pos(' a ', complemento) + 3,
              Length(complemento)));
            numero_final := trim(Copy(numero_final, 1, pos(' ', numero_final)));
          end;
          if (StrToInt(Numero) >= StrToInt(numero_inicial)) and
            (StrToInt(Numero) <= StrToInt(numero_final)) then
          begin
            if TSResposta.Values['resultado'] = '1' then
            begin
              TSResposta.Values['cep'] :=
                Copy(NodeSec.ChildNodes.FindNode('cep').Text, 1, 5) + '-' +
                Copy(NodeSec.ChildNodes.FindNode('cep').Text, 6, 3);
              TSResposta.Values['cidade'] := NodeSec.ChildNodes.FindNode
                ('ibge_municipio').Text;
              TSResposta.Values['bairro'] :=
                FMFUN.uppercase(NodeSec.ChildNodes.FindNode('bairro').Text);
              TSResposta.Values['endereco'] :=
                FMFUN.uppercase(NodeSec.ChildNodes.FindNode('tipo_logradouro')
                .Text + ' ' + NodeSec.ChildNodes.FindNode('logradouro').Text);
            end;
          end;
        end;
      end
      else
      begin
        if TSResposta.Values['resultado'] = '1' then
        begin
          TSResposta.Values['cep'] :=
            Copy(NodeSec.ChildNodes.FindNode('cep').Text, 1, 5) + '-' +
            Copy(NodeSec.ChildNodes.FindNode('cep').Text, 6, 3);
          TSResposta.Values['cidade'] := NodeSec.ChildNodes.FindNode
            ('ibge_municipio').Text;
          TSResposta.Values['bairro'] :=
            FMFUN.uppercase(NodeSec.ChildNodes.FindNode('bairro').Text);
          TSResposta.Values['endereco'] :=
            FMFUN.uppercase(NodeSec.ChildNodes.FindNode('tipo_logradouro').Text
            + ' ' + NodeSec.ChildNodes.FindNode('logradouro').Text);
        end;
      end;
    end;
    NodeSec := NodeSec.NextSibling;
  until NodeSec = nil;

  XMLGeral.Active := False;

  Result := TSResposta;
end;

procedure TFRPRI.TmPedidoVendedorTimer(Sender: TObject);
begin
  if (Tipo_usuario = '3') or (Tipo_usuario = '5') then
    CheckPedidoVendedor;
end;

procedure TFRPRI.CheckPedidoVendedor;
begin
  ReiniciaTmPedidoVendedor := False;
  DesabilitaTimers;
  if TipUsu = '0' then
    Exit;
  dao.geral2
    ('select * from vendas1 where faturado = ''0'' and pedido_vendedor = ''1'' ');
  if not dao.Q2.IsEmpty then
  begin
    if MessageDlg
      ('Há novos Pedidos gerados pelo Representante. Desejas visualizar?',
      mtConfirmation, [mbyes, mbno], 0) = mryes then
    begin
      try
        Application.CreateForm(TFrPalmConexao, FrPalmConexao);
        FrPalmConexao.Aviso_Palm := False;
		SetaAcesso(FrPalmConexao.Caption);
        FrPalmConexao.ShowModal;
      finally
        FrPalmConexao.Free;
        ReiniciaTmPedidoVendedor := True;
        TmPedidoVendedor.Interval := 3000;
        HabilitaTimers;
      end;
    end
    else
    begin
      ReiniciaTmPedidoVendedor := True;
      TmPedidoVendedor.Interval := 30000;
      HabilitaTimers;
    end;
  end;
end;

procedure TFRPRI.RelaodePedidosDigiadospeloVendedor1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'pedidos_vendedor';
	SetaAcesso('pedidos_vendedor');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

{
  procedure TFRPRI.ApplicationEvents1Exception(Sender: TObject; E: Exception);
  begin

  FMFUN.LogException;

  if (Copy(E.Message, 1, 24) <> 'ISC ERROR CODE:335544721') and
  (Copy(E.Message, 1, 24) <> 'ISC ERROR CODE:335544726') and
  (E.Message <> 'Não é possível preparar uma sentença em branco') and
  (E.Message <> 'Não Foi Encontrado Registro com Este Dado!') then
  begin
  dao.envia_email_suporte(E.Message + #13 + 'Data: ' + DtaSerStr + #13 +
  'Usuario Logado:' + nom_usuario + #13 + 'Máquina:' + FMFUN.computador +
  #13 + 'Versão:' + versao, 'Erro ORBI', 'informatica@plasfan.ind.br',
  '', '', '');

  if ((E.Message = 'Cannot focus a disabled or invisible window') or
  (E.Message = 'Dataset not in edit or insert mode') or
  (E.Message = 'Cannot perform this operation on a closed dataset')) then
  ShowMessage(E.Message);

  if (Copy(E.Message, 49, 11) = 'ZIMFDRV.dll') then
  ShowMessage('Servidor de Impressão está Desligado!');

  Exception.Create(E.Message);
  end;

  end;
}

procedure TFRPRI.IdHTTPDownloadWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  fm_splash.ggProgress.Progress := AWorkCount;
  fm_splash.Refresh;

end;

procedure TFRPRI.IdHTTPDownloadWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  fm_splash.ggProgress.Progress := 0;
  fm_splash.ggProgress.MaxValue := AWorkCountMax;
  fm_splash.lbStatus.Caption := 'Download em andamento, aguarde...';
  fm_splash.show;
end;

procedure TFRPRI.IdHTTPDownloadWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
begin
  fm_splash.ggProgress.Progress := fm_splash.ggProgress.MaxValue;
  fm_splash.lbStatus.Caption := 'Download Finalizado...';
  fm_splash.Refresh;
  fm_splash.hide;
end;


procedure TFRPRI.TmReiniciaTimersTimer(Sender: TObject);
begin
  if not ReiniciaTmUpdate then
    ReiniciaTmUpdate := True;

  if not ReiniciaTmPedidoVendedor then
    ReiniciaTmPedidoVendedor := True;

  if not ReiniciaTmPedidoPalm then
    ReiniciaTmPedidoPalm := True;

  if not ReiniciaTmCheckMalaDireta then
    ReiniciaTmCheckMalaDireta := True;

  if not ReiniciaTmContaVencida then
    ReiniciaTmContaVencida := True;
  // HabilitaTimers;
end;

procedure TFRPRI.tmChamaGravadorTimer(Sender: TObject);
begin
  if not FMFUN.ProcessoExiste('TelasOrbi.exe') then
    WinExec('TelasOrbi.exe', SW_HIDE);
end;

procedure TFRPRI.ApplicationEvents1Activate(Sender: TObject);
begin

  { if fileexists(ExtractFilePath(Application.ExeName) +
    'ORBI_MemoryManager_EventosLog.txt') then
    begin
    dao.envia_email_suporte('Data: ' + DtaSerStr + #13 + 'Usuario Logado:' +
    nom_usuario + #13 + 'Máquina:' + FMFUN.COMPUTADOR + #13 + 'Versão:' +
    versao,
    'Erro ORBI - Análise da memória.', 'informatica@plasfan.ind.br', '', '',
    '');
    deletefile(ExtractFilePath(Application.ExeName) +
    'ORBI_MemoryManager_EventosLog.txt');
    end; }
end;

procedure TFRPRI.ISMTPmailWork(Sender: TObject; AWorkMode: TWorkMode;  const AWorkCount: Integer);
begin
  if Assigned(Fr_email_envio) then
    Fr_email_envio.Refresh;
end;

procedure TFRPRI.Fornecedor1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'Fornecedor';
	SetaAcesso('Relatorio Fornecedor');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.ProdutosDescontoEspecial1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'produto_desconto_especial';
	SetaAcesso('produto_desconto_especial');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.ZeraProdutoWeb;
var
  Consulta: TStringStream;
begin
  Consulta := TStringStream.Create('');
  Consulta.WriteString('modo=zerar_promocao');
  FMFUN.AtualizarSite(Consulta);
  Consulta.Free;

  try
    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;
    dao.Exec_sql.sql.Clear;
    dao.Exec_sql.sql.Add('UPDATE PRODUTO SET PROMOCAO = ''N'' ');
    dao.Exec_sql.execsql;
    dao.cn.Commit;
  except
    dao.cn.Rollback;
    Exit;
  end;

end;

procedure TFRPRI.sbClientesClick(Sender: TObject);
begin
  if Cliente1.Visible then
    Cliente1Click(self)
  else
    ShowMessage('Seu Perfil de Usuário não está habilitado!');
end;

procedure TFRPRI.sbVendasClick(Sender: TObject);
begin
  if (FRPRI.TipUsu = '0') then
    VendasSimplificado1Click(Self)
  else begin
  if Vendas3.Visible then
    Vendas3Click(self)
  else
    ShowMessage('Seu Perfil de Usuário não está habilitado!');
  end;
end;

procedure TFRPRI.sbContasPagarClick(Sender: TObject);
begin
  if Contasapagar1.Visible then
    Contasapagar1Click(self)
  else
    ShowMessage('Seu Perfil de Usuário não está habilitado!');
end;

procedure TFRPRI.FormasdePagamento1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_forma_pagamento, Fr_forma_pagamento);
	SetaAcesso(Fr_forma_pagamento.Caption);
    Fr_forma_pagamento.ShowModal;
  finally
    Fr_forma_pagamento.Free;
  end;
end;

procedure TFRPRI.estedeImagensdeProdutos1Click(Sender: TObject);
begin
  try
    Application.CreateForm(Tfm_teste_imagens_bd, fm_teste_imagens_bd);
	  SetaAcesso(fm_teste_imagens_bd.Caption);
    fm_teste_imagens_bd.ShowModal;
  finally
    fm_teste_imagens_bd.Free;

  end;
end;

procedure TFRPRI.Cobrana1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    // tipo_relatorio := 'contas_receber';
    tipo_relatorio := 'cobrança';
	SetaAcesso('cobrança');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.LerRetornoCobrana1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TfmLerRetornoCobranca, fmLerRetornoCobranca);
	SetaAcesso(fmLerRetornoCobranca.Caption);
    fmLerRetornoCobranca.ShowModal;
  finally
    fmLerRetornoCobranca.Free;
  end;
end;

procedure TFRPRI.EnviarAvisosaosRepresentantes1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_Aviso_Representantes_Avulso, Fr_Aviso_Representantes_Avulso);
	SetaAcesso(Fr_Aviso_Representantes_Avulso.Caption);
    Fr_Aviso_Representantes_Avulso.ShowModal;
  finally
    Fr_Aviso_Representantes_Avulso.Free;
  end;
end;

procedure TFRPRI.AlterarLayout1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TfmAlterarLayout, fmAlterarLayout);
	SetaAcesso(fmAlterarLayout.Caption);
    fmAlterarLayout.ShowModal;
  finally
    fmAlterarLayout.Free;
  end;
end;

procedure TFRPRI.RepresentantesFuncionriosCC1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    // tipo_relatorio := 'contas_receber';
    tipo_relatorio := 'lista_func_cc';
	SetaAcesso('lista_func_cc');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.frxReport1GetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'empresa' then
    Value := nom_empresa;
end;

procedure TFRPRI.EnviarRemessa1Click(Sender: TObject);
begin
  try
    Application.CreateForm(Tfrm_remessa_boleto, frm_remessa_boleto);
	SetaAcesso(frm_remessa_boleto.caption);
    frm_remessa_boleto.ShowModal;
  finally
    frm_remessa_boleto.Free;
  end;
end;

procedure TFRPRI.MotivosdeCancelamentosdeNFes1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_motivo_nfe_cancel, Fr_motivo_nfe_cancel);
	SetaAcesso(Fr_motivo_nfe_cancel.caption);
    Fr_motivo_nfe_cancel.ShowModal;
  finally
    Fr_motivo_nfe_cancel.Free;
  end;
end;

procedure TFRPRI.SPEDFiscalGerarArquivo1Click(Sender: TObject);
begin

  { try
    Application.CreateForm(Tfm_sped, fm_sped);
    fm_sped.ShowModal;
    finally
    fm_sped.Free;
    end; }
end;

procedure TFRPRI.Simples1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'produto_ncm_st';
	SetaAcesso(Fr_opc_relatorios.caption);
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end
end;

procedure TFRPRI.Completo2Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'produto_ncm_st_completo';
	SetaAcesso('produto_ncm_st_completo');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end
end;

procedure TFRPRI.Avisos1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFrAvisosDiretoria, FrAvisosDiretoria);
	SetaAcesso(FrAvisosDiretoria.Caption);
    FrAvisosDiretoria.ShowModal;
  finally
    FrAvisosDiretoria.Free;
  end
end;

procedure TFRPRI.ProdutosCdigodeBarras1Click(Sender: TObject);
begin

  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'produtos_codigo_barra';
	SetaAcesso('produtos_codigo_barra');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.ProdutosCatlogo1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'produtos_catalogo';
    SetaAcesso('produtos_catalogo');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.P1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'pauta_venda';
	SetaAcesso('pauta_venda');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.P2Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'pauta_venda_categoria';
	SetaAcesso('pauta_venda_categoria');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.n1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'comissao_comparativo';
	SetaAcesso('comissao_comparativo');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.c1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'comparativo_tablet';
	SetaAcesso('comparativo_tablet');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.S1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_produto_nao_revenda, Fr_produto_nao_revenda);
	SetaAcesso(Fr_produto_nao_revenda.Caption);
    Fr_produto_nao_revenda.ShowModal;
  finally
    Fr_produto_nao_revenda.Free;
  end;
end;

procedure TFRPRI.M2Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_entrada, Fr_entrada);
    Fr_entrada.servico := True;
	SetaAcesso(Fr_entrada.Caption);
    Fr_entrada.ShowModal;
  finally
    Fr_entrada.Free;
  end;

end;

procedure TFRPRI.S2Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'supervisao';
	SetaAcesso('supervisao');
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.S3Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFrImpostos, FrImpostos);
	SetaAcesso(FrImpostos.Caption);
    FrImpostos.ShowModal;
  finally
    FrImpostos.Free;
  end;
end;

procedure TFRPRI.sbTransmissaoClick(Sender: TObject);
var
  Vendor: TConexaoVendor;
begin
  if Representante_id = '' then
    Exit;
  fm_splash.pgArquivos.Visible := True;
  fm_splash.lbArquivos.Visible := True;
  fm_splash.pgArquivos.MaxValue := 6;
  fm_splash.pgArquivos.Progress := 0;
  fm_splash.lbStatus.Caption := '';
  fm_splash.ggProgress.Visible := False;
  fm_splash.lbStatus.Visible := False;
  fm_splash.ggProgress.Progress := 0;
  fm_splash.show;

  Vendor := TConexaoVendor.Create();

  if not Vendor.BaixarFTP('sql') then
    Exit;

  if not Vendor.BaixarFTP('bmp') then
    Exit;

  fm_splash.lbArquivos.Caption := 'Atualização de Dados...';
  fm_splash.update;
  Vendor.ImportarDados;
  Vendor.Free;

  // Vendor.LimparDir('sql');
  // Vendor.LimparDir('bmp');

  fm_splash.close;

end;

procedure TFRPRI.FormCreate(Sender: TObject);
begin
  Screen.OnActiveControlChange := ChangeControl;
end;

procedure TFRPRI.V1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'vendas_geral';
	SetaAcesso(tipo_relatorio);
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.c2Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFmCalcular13Salario, FmCalcular13Salario);
	SetaAcesso(FmCalcular13Salario.Caption);
    FmCalcular13Salario.ShowModal;
  finally
    FmCalcular13Salario.Free;
  end;
end;

procedure TFRPRI.C3Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'ranking_cliente';
	SetaAcesso(tipo_relatorio);
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.C6Click(Sender: TObject);
begin
  try
    Application.CreateForm(Tfr_controle_visitas, fr_controle_visitas);
	SetaAcesso(fr_controle_visitas.caption);
    fr_controle_visitas.ShowModal;
  finally
    fr_controle_visitas.Free;
  end;
end;

procedure TFRPRI.c7Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'clientes_produtos';
	SetaAcesso(tipo_relatorio);
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.tmConectTimer(Sender: TObject);
begin
  if not dao.CN.Connected then
    dao.CN.Connected := True;
end;

procedure TFRPRI.EnviarPedidosClick(Sender: TObject);
begin
  try
    Application.CreateForm(Tfm_vendor_enviar_pedidos, fm_vendor_enviar_pedidos);
	SetaAcesso(fm_vendor_enviar_pedidos.caption);
    fm_vendor_enviar_pedidos.ShowModal;
  finally
    fm_vendor_enviar_pedidos.Free;
  end;
end;

procedure TFRPRI.sbEnviarPedidosClick(Sender: TObject);
begin
  if Representante_id = '' then
    Exit;
  if EnviarPedidos.Visible then
    EnviarPedidosClick(self)
  else
    ShowMessage('Seu Perfil de Usuário não está habilitado!');
end;

procedure TFRPRI.t1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'televendas';
	SetaAcesso(tipo_relatorio);
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.produto_completoClick(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_produtos, Fr_produtos);
	SetaAcesso(Fr_produtos.Caption);
    Fr_produtos.ShowModal;
  finally
    Fr_produtos.Free;
  end;
end;

procedure TFRPRI.S4Click(Sender: TObject);
begin
  try
    Application.CreateForm(Tfrm_produtos_simplificado, frm_produtos_simplificado);
	SetaAcesso(frm_produtos_simplificado.Caption);
    frm_produtos_simplificado.ShowModal;
  finally
    frm_produtos_simplificado.Free;
  end;
end;

procedure TFRPRI.SetaAcesso(nomeForm: string);
var
  qAcesso: TFDQuery;
begin
  qAcesso := TFDQuery.Create(nil);
  try
    try
      if not dao.cn.InTransaction then
        dao.cn.StartTransaction;
      qAcesso.connection := dao.CN;
      qAcesso.SQL.Text := 'INSERT INTO acesso (data, form) VALUES (current_date,:form)';
      qAcesso.Parambyname('form').AsString := nomeForm;
      qAcesso.ExecSQL;
      dao.cn.Commit;
    except
      dao.cn.Rollback;
      Exit;
    end;
  finally
    qAcesso.Free;
  end;
end;

procedure TFRPRI.S5Click(Sender: TObject);
begin
  try
    Application.CreateForm(Tfrm_controle_status_pedido, frm_controle_status_pedido);
	SetaAcesso(frm_controle_status_pedido.Caption);
    frm_controle_status_pedido.ShowModal;
  finally
    frm_controle_status_pedido.Free;
  end;
end;

procedure TFRPRI.S6Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'ranking_vendas';
  	SetaAcesso(tipo_relatorio);
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.AvisoContasPagarDiario;
begin

end;

procedure TFRPRI.T2Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFrPalmConexao, FrPalmConexao);
    FrPalmConexao.Aviso_Palm := True;
	SetaAcesso(FrPalmConexao.Caption);
    FrPalmConexao.ShowModal;
  finally
    FrPalmConexao.Free;
  end;
end;

procedure TFRPRI.N21Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'produtos_capa_20_5';
	SetaAcesso(tipo_relatorio);
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.N22Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'produtos_capa_24_6';
	SetaAcesso(tipo_relatorio);
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.N2Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFrPalmConexao, FrPalmConexao);
    FrPalmConexao.Aviso_Palm := False;
	SetaAcesso(FrPalmConexao.Caption);
    FrPalmConexao.ShowModal;
  finally
    FrPalmConexao.Free;
  end;
end;

procedure TFRPRI.N61Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'produtos_capa_6';
	SetaAcesso(tipo_relatorio);
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.AbrirTelaPedidosExternos(const AAvisoPalm: Boolean);
begin
  try
    Application.CreateForm(TFrPalmConexao, FrPalmConexao);
    FrPalmConexao.Aviso_Palm := AAvisoPalm;
    SetaAcesso(FrPalmConexao.Caption);
    FrPalmConexao.ShowModal;
  finally
    FrPalmConexao.Free;
  end;
end;

procedure TFRPRI.AvisoPedidosExternosClick(Sender: TObject);
var
  pnl: TsPanel;
  ctrl: TControl;
  sep: Integer;
  sHint: string;
  qtdCorePlus, qtdWorbyRepre: Integer;
  resp: Integer;
begin
  pnl := nil;
  if Sender is TsPanel then
    pnl := TsPanel(Sender)
  else if Sender is TControl then
  begin
    ctrl := TControl(Sender);
    if Assigned(ctrl.Parent) and (ctrl.Parent is TsPanel) then
      pnl := TsPanel(ctrl.Parent);
  end;

  if not Assigned(pnl) then
    Exit;

  sHint := pnl.Hint;
  sep := Pos('|', sHint);
  qtdCorePlus := 0;
  qtdWorbyRepre := 0;

  if sep > 0 then
  begin
    qtdCorePlus := StrToIntDef(Copy(sHint, 1, sep - 1), 0);
    qtdWorbyRepre := StrToIntDef(Copy(sHint, sep + 1, MaxInt), 0);
  end;

  if (qtdCorePlus <= 0) and (qtdWorbyRepre <= 0) then
    Exit;

  if (qtdCorePlus > 0) and (qtdWorbyRepre <= 0) then
  begin
    AbrirTelaPedidosExternos(True);
    Exit;
  end;

  if (qtdWorbyRepre > 0) and (qtdCorePlus <= 0) then
  begin
    AbrirTelaPedidosExternos(False);
    Exit;
  end;

  resp := MessageDlg('Ha pedidos pendentes das duas origens.' + sLineBreak +
                     'Sim = COREPLUS' + sLineBreak +
                     'Nao = WORBYREPRE', mtConfirmation, [mbYes, mbNo, mbCancel], 0);
  if resp = mrYes then
    AbrirTelaPedidosExternos(True)
  else if resp = mrNo then
    AbrirTelaPedidosExternos(False);
end;
procedure TFRPRI.ChecarCertificado;
var
  data_cert: TDate;
  empresa_str, data_cert_str: string;
  dias_a_vencer: Integer;
  lista: TStringList;
  i, sep1, sep2: Integer;
  itemEmpresa, itemData, itemStatus: string;
  pnl: TsPanel;
  lblMsg: TsLabel;
  lblTit: TsLabel;
  temVencido: Boolean;
begin
  pnl := TsPanel(FindComponent('pnlCertAviso'));
  lblMsg := TsLabel(FindComponent('lblCertAvisoMsg'));
  lblTit := TsLabel(FindComponent('lblCertAvisoTitulo'));

  if Assigned(pnl) then
    pnl.Visible := False;

  if TipUsu >= '2' then
  begin
    lista := TStringList.Create;
    try
      QrCert.Close;
      QrCert.SQL.Clear;
      QrCert.SQL.Text :=
        'SELECT a.COD_EMPRESA, a.NOM_EMPRESA, a.CERTIFICADO_VCTO FROM EMPRESA a where a.CERTIFICADO_VCTO is not null';
      QrCert.Open;
      QrCert.First;

      while not QrCert.Eof do
      begin
        data_cert := QrCert.FieldByName('CERTIFICADO_VCTO').AsDateTime;
        empresa_str := QrCert.FieldByName('COD_EMPRESA').AsString + '-' +
          QrCert.FieldByName('NOM_EMPRESA').AsString;
        data_cert_str := FormatDateTime('dd/mm/yyyy', data_cert);
        dias_a_vencer := Round(data_cert - Now);

        if dias_a_vencer <= 30 then
        begin
          if dias_a_vencer <= 0 then
            itemStatus := 'vencido'
          else
            itemStatus := 'a vencer';
          lista.Add(empresa_str + '|' + data_cert_str + '|' + itemStatus);
        end;

        QrCert.Next;
      end;

      if (lista.Count > 0) and Assigned(pnl) then
      begin
        pnl.Visible := True;
        temVencido := False;
        for i := 0 to lista.Count - 1 do
          if Pos('|vencido', lista[i]) > 0 then
            temVencido := True;

        if Assigned(lblTit) then
        begin
          if temVencido then
            lblTit.Caption := 'CERTIFICADO DIGITAL VENCIDO'
          else
            lblTit.Caption := 'CERTIFICADO DIGITAL A VENCER';
        end;

        if Assigned(lblMsg) then
        begin
          lblMsg.AutoSize := False;
          lblMsg.WordWrap := True;
          lblMsg.Width := pnl.Width - 16;
          lblMsg.Caption := '';

          for i := 0 to lista.Count - 1 do
          begin
            sep1 := Pos('|', lista[i]);
            sep2 := Pos('|', Copy(lista[i], sep1 + 1, MaxInt));
            if (sep1 > 0) and (sep2 > 0) then
            begin
              itemEmpresa := Copy(lista[i], 1, sep1 - 1);
              itemData := Copy(lista[i], sep1 + 1, sep2 - 1);
              itemStatus := Copy(lista[i], sep1 + sep2 + 1, MaxInt);
            end
            else
            begin
              itemEmpresa := lista[i];
              itemData := '';
              itemStatus := '';
            end;

            if lblMsg.Caption <> '' then
              lblMsg.Caption := lblMsg.Caption + sLineBreak;

            if itemStatus = 'vencido' then
              lblMsg.Caption := lblMsg.Caption + itemEmpresa + ' (vencido em ' + itemData + ')'
            else
              lblMsg.Caption := lblMsg.Caption + itemEmpresa + ' (a vencer em ' + itemData + ')';
          end;

          pnl.Height := 24 + (lista.Count * 14);
          lblMsg.Height := pnl.Height - 24;
        end;
      end;
    finally
      lista.Free;
    end;
  end;
end;

procedure TFRPRI.ChecarEstoqueMinimo;
var
  QEst: TFDQuery;
  lista: TStringList;
  pnl: TsPanel;
  lblMsg: TsLabel;
  lblTit: TsLabel;
  mmMsg: TMemo;
  shp: TShape;
  linha: string;
  total: Integer;
begin
  pnl := TsPanel(FindComponent('pnlEstoqueAviso'));
  if not Assigned(pnl) then
  begin
    pnl := TsPanel.Create(Self);
    pnl.Name := 'pnlEstoqueAviso';
    pnl.Parent := Self;
    pnl.Align := alRight;
    pnl.Width := pnlCertAviso.Width;
    pnl.Color := clInfoBk;
    pnl.ParentBackground := False;
    pnl.Visible := False;
    pnl.TabOrder := 8;
    pnl.SkinData.SkinSection := 'PANEL';

    shp := TShape.Create(pnl);
    shp.Name := 'shpEstoqueAviso';
    shp.Parent := pnl;
    shp.Align := alLeft;
    shp.Width := 5;
    shp.Brush.Color := clRed;
    shp.Pen.Style := psClear;

    lblTit := TsLabel.Create(pnl);
    lblTit.Name := 'lblEstoqueAvisoTitulo';
    lblTit.Parent := pnl;
    lblTit.Left := 12;
    lblTit.Top := 6;
    lblTit.Caption := 'ESTOQUE ABAIXO DO MINIMO';
    lblTit.ParentFont := False;
    lblTit.Font.Color := clMaroon;
    lblTit.Font.Style := [fsBold];

    lblMsg := TsLabel.Create(pnl);
    lblMsg.Name := 'lblEstoqueAvisoMsg';
    lblMsg.Parent := pnl;
    lblMsg.Left := 12;
    lblMsg.Top := 24;
    lblMsg.Width := pnl.Width - 16;
    lblMsg.Height := 16;
    lblMsg.AutoSize := False;
    lblMsg.WordWrap := False;
    lblMsg.Caption := 'Aguardando verificacao de estoque minimo.';
    lblMsg.ParentFont := False;
    lblMsg.Font.Color := clMaroon;

    mmMsg := TMemo.Create(pnl);
    mmMsg.Name := 'mmEstoqueAviso';
    mmMsg.Parent := pnl;
    mmMsg.Left := 12;
    mmMsg.Top := 44;
    mmMsg.Width := pnl.Width - 20;
    mmMsg.Height := pnl.Height - 52;
    mmMsg.ReadOnly := True;
    mmMsg.ScrollBars := ssVertical;
    mmMsg.WordWrap := False;
    mmMsg.BorderStyle := bsNone;
    mmMsg.Color := clInfoBk;
    mmMsg.ParentFont := False;
    mmMsg.Font.Name := 'Courier New';
    mmMsg.Font.Size := 8;
    mmMsg.Font.Color := clMaroon;
    mmMsg.Anchors := [akLeft, akTop, akRight, akBottom];
    mmMsg.Lines.Text := '';
  end;

  pnl := TsPanel(FindComponent('pnlEstoqueAviso'));
  lblMsg := nil;
  lblTit := nil;
  mmMsg := nil;
  if Assigned(pnl) then
  begin
    lblMsg := TsLabel(pnl.FindComponent('lblEstoqueAvisoMsg'));
    lblTit := TsLabel(pnl.FindComponent('lblEstoqueAvisoTitulo'));
    mmMsg := TMemo(pnl.FindComponent('mmEstoqueAviso'));
  end;

  if Assigned(pnl) then
    pnl.Visible := False;

  if Assigned(mmMsg) then
  begin
    mmMsg.ParentFont := False;
    mmMsg.Font.Name := 'Courier New';
    mmMsg.Font.Size := 8;
    mmMsg.Clear;
  end;

  if TipUsu < '2' then
    Exit;

  lista := TStringList.Create;
  QEst := TFDQuery.Create(nil);
  try
    QEst.Connection := dao.CN;
    QEst.SQL.Text :=
      'SELECT P.COD_PRODUTO, P.NOM_PRODUTO, P.QTD_ESTOQUE, P.QTD_RESERVADO, P.QTD_ESTOQUE_MIN ' +
      'FROM PRODUTO P ' +
      'WHERE P.QTD_ESTOQUE_MIN > 0 ' +
      'AND P.QTD_ESTOQUE < P.QTD_ESTOQUE_MIN ' +
      'AND EXISTS (SELECT 1 FROM ACERTO_ESTOQUE A WHERE A.COD_PRODUTO = P.COD_PRODUTO ' +
      'AND EXTRACT(YEAR FROM A.DATA_ACERTO) >= 2026) ' +
      'ORDER BY 1';
    QEst.Open;

    total := 0;
    while not QEst.Eof do
    begin
      Inc(total);
      linha := QEst.FieldByName('COD_PRODUTO').AsString + '-' +
        QEst.FieldByName('NOM_PRODUTO').AsString;
      lista.Add(linha);
      lista.Add('..(Est.: ' +
        FormatFloat('#,###,##0.00', QEst.FieldByName('QTD_ESTOQUE').AsFloat) +
        ' / Res.: ' +
        FormatFloat('#,###,##0.00', QEst.FieldByName('QTD_RESERVADO').AsFloat) +
        ' / Min.: ' +
        FormatFloat('#,###,##0.00', QEst.FieldByName('QTD_ESTOQUE_MIN').AsFloat) + ')');
      lista.Add('');
      QEst.Next;
    end;

    if (total > 0) and Assigned(pnl) then
    begin
      pnl.Visible := True;

      if Assigned(lblTit) then
        lblTit.Caption := 'ESTOQUE ABAIXO DO MINIMO';

      if Assigned(lblMsg) then
      begin
        lblMsg.AutoSize := False;
        lblMsg.WordWrap := False;
        lblMsg.Width := pnl.Width - 16;
        lblMsg.Caption := 'Existem ' + IntToStr(total) +
          ' produto(s) abaixo do minimo com acerto de estoque em ' +
          FormatDateTime('yyyy', Date) + ':';
      end;

      if Assigned(mmMsg) then
      begin
        mmMsg.Lines.BeginUpdate;
        try
          mmMsg.Lines.Assign(lista);
        finally
          mmMsg.Lines.EndUpdate;
        end;
      end;
    end;
  finally
    QEst.Free;
    lista.Free;
  end;
end;

procedure TFRPRI.ChecarAvisoPedidosExternos;
var
  QPed: TFDQuery;
  pnl: TsPanel;
  lblMsg: TsLabel;
  lblTit: TsLabel;
  mmMsg: TMemo;
  shp: TShape;
  lista: TStringList;
  qtdCorePlus, qtdWorbyRepre: Integer;
begin
  pnl := TsPanel(FindComponent('pnlPedidosAviso'));
  if not Assigned(pnl) then
  begin
    pnl := TsPanel.Create(Self);
    pnl.Name := 'pnlPedidosAviso';
    pnl.Parent := Self;
    pnl.Align := alRight;
    pnl.Width := pnlCertAviso.Width;
    pnl.Color := clInfoBk;
    pnl.ParentBackground := False;
    pnl.Visible := False;
    pnl.TabOrder := 9;
    pnl.SkinData.SkinSection := 'PANEL';
    pnl.Cursor := crHandPoint;
    pnl.OnClick := AvisoPedidosExternosClick;

    shp := TShape.Create(pnl);
    shp.Name := 'shpPedidosAviso';
    shp.Parent := pnl;
    shp.Align := alLeft;
    shp.Width := 5;
    shp.Brush.Color := clNavy;
    shp.Pen.Style := psClear;

    lblTit := TsLabel.Create(pnl);
    lblTit.Name := 'lblPedidosAvisoTitulo';
    lblTit.Parent := pnl;
    lblTit.Left := 12;
    lblTit.Top := 6;
    lblTit.Caption := 'PEDIDOS EXTERNOS PENDENTES';
    lblTit.ParentFont := False;
    lblTit.Font.Color := clNavy;
    lblTit.Font.Style := [fsBold];
    lblTit.Cursor := crHandPoint;
    lblTit.OnClick := AvisoPedidosExternosClick;

    lblMsg := TsLabel.Create(pnl);
    lblMsg.Name := 'lblPedidosAvisoMsg';
    lblMsg.Parent := pnl;
    lblMsg.Left := 12;
    lblMsg.Top := 24;
    lblMsg.Width := pnl.Width - 16;
    lblMsg.Height := 16;
    lblMsg.AutoSize := False;
    lblMsg.WordWrap := False;
    lblMsg.Caption := 'Aguardando verificacao de pedidos externos.';
    lblMsg.ParentFont := False;
    lblMsg.Font.Color := clNavy;
    lblMsg.Cursor := crHandPoint;
    lblMsg.OnClick := AvisoPedidosExternosClick;

    mmMsg := TMemo.Create(pnl);
    mmMsg.Name := 'mmPedidosAviso';
    mmMsg.Parent := pnl;
    mmMsg.Left := 12;
    mmMsg.Top := 44;
    mmMsg.Width := pnl.Width - 20;
    mmMsg.Height := pnl.Height - 52;
    mmMsg.ReadOnly := True;
    mmMsg.ScrollBars := ssVertical;
    mmMsg.WordWrap := False;
    mmMsg.BorderStyle := bsNone;
    mmMsg.Color := clInfoBk;
    mmMsg.ParentFont := False;
    mmMsg.Font.Name := 'Courier New';
    mmMsg.Font.Size := 8;
    mmMsg.Font.Color := clNavy;
    mmMsg.Anchors := [akLeft, akTop, akRight, akBottom];
    mmMsg.Lines.Text := '';
    mmMsg.Cursor := crHandPoint;
    mmMsg.OnDblClick := AvisoPedidosExternosClick;
  end;

  pnl := TsPanel(FindComponent('pnlPedidosAviso'));
  lblMsg := nil;
  lblTit := nil;
  mmMsg := nil;
  if Assigned(pnl) then
  begin
    lblMsg := TsLabel(pnl.FindComponent('lblPedidosAvisoMsg'));
    lblTit := TsLabel(pnl.FindComponent('lblPedidosAvisoTitulo'));
    mmMsg := TMemo(pnl.FindComponent('mmPedidosAviso'));

    pnl.Visible := False;
    pnl.Hint := '0|0';
    pnl.OnClick := AvisoPedidosExternosClick;
  end;

  if Assigned(lblTit) then
  begin
    lblTit.Cursor := crHandPoint;
    lblTit.OnClick := AvisoPedidosExternosClick;
  end;

  if Assigned(lblMsg) then
  begin
    lblMsg.Cursor := crHandPoint;
    lblMsg.OnClick := AvisoPedidosExternosClick;
  end;

  if Assigned(mmMsg) then
  begin
    mmMsg.ParentFont := False;
    mmMsg.Font.Name := 'Courier New';
    mmMsg.Font.Size := 8;
    mmMsg.Clear;
    mmMsg.Cursor := crHandPoint;
    mmMsg.OnDblClick := AvisoPedidosExternosClick;
  end;

  if TipUsu < '2' then
    Exit;

  QPed := TFDQuery.Create(nil);
  lista := TStringList.Create;
  try
    QPed.Connection := dao.CN;
    QPed.SQL.Text :=
      'SELECT ' +
      '  (SELECT COUNT(*) FROM PALM_LOTE P ' +
      '    WHERE P.STATUS = ''S'' ' +
      '      AND COALESCE(P.CHECADO, ''N'') <> ''S'' ' +
      '      AND CAST(P.DATA_CONEXAO AS DATE) >= (CURRENT_DATE - 30)) AS QTD_COREPLUS, ' +
      '  (SELECT COUNT(*) FROM VENDAS1 V ' +
      '    WHERE V.FATURADO = ''0'' ' +
      '      AND V.PEDIDO_VENDEDOR = ''1'' ' +
      '      AND V.ORCAMENTO = 0 ' +
      '      AND COALESCE((SELECT PP.STATUS FROM PROCESSO_PEDIDO pp WHERE pp.ID = V.PROCESSO_ID), ''À Conferir'') <> ''À Digitar'' ' +
      '      AND CAST(V.DTADOC AS DATE) >= (CURRENT_DATE - 30)) AS QTD_WORBYREPRE';
    QPed.Open;

    qtdCorePlus := QPed.FieldByName('QTD_COREPLUS').AsInteger;
    qtdWorbyRepre := QPed.FieldByName('QTD_WORBYREPRE').AsInteger;

    if qtdCorePlus > 0 then
      lista.Add('COREPLUS: ' + IntToStr(qtdCorePlus) + ' pedido(s) pendente(s).');

    if qtdWorbyRepre > 0 then
      lista.Add('WORBYREPRE: ' + IntToStr(qtdWorbyRepre) + ' pedido(s) pendente(s).');

    if (lista.Count > 0) and Assigned(pnl) then
    begin
      pnl.Visible := True;
      pnl.Hint := IntToStr(qtdCorePlus) + '|' + IntToStr(qtdWorbyRepre);

      if Assigned(lblTit) then
        lblTit.Caption := 'PEDIDOS EXTERNOS PENDENTES';

      if Assigned(lblMsg) then
      begin
        lblMsg.AutoSize := False;
        lblMsg.WordWrap := False;
        lblMsg.Width := pnl.Width - 16;
        lblMsg.Caption := 'Existem pedidos pendentes de conferencia/importacao:';
      end;

      if Assigned(mmMsg) then
      begin
        mmMsg.Lines.BeginUpdate;
        try
          mmMsg.Lines.Assign(lista);
        finally
          mmMsg.Lines.EndUpdate;
        end;
      end;
    end;
  finally
    QPed.Free;
    lista.Free;
  end;
end;

procedure TFRPRI.ChecarRevisaoVeiculo;
var
  avisos: TStringList;
begin
  if not checar_veiculo then
    Exit;
  dao.Geral1('SELECT ' + '  V.ID, ' + '  V.NOM_VEICULO, ' +
    '  current_date + 15 AS LIMITE, ' + '  V.PROXIMA_REVISAO_DATA, ' +
    '  V.PROXIMA_REVISAO_HODOMETRO, ' + '  ( ' + '    select ' +
    '      coalesce(max(e3.HODOMETRO),0) AS HODOMETRO ' + '    from ' +
    '      ENTRADA2 e3 ' +
    '    INNER JOIN PRODUTO P ON P.COD_PRODUTO = E3.COD_PRODUTO ' + '    where '
    + '      e3.ID_VEICULO = V.ID) HODOMETRO_ATUAL ' + 'from ' +
    '  VEICULOS V ');

  avisos := TStringList.Create;

  while not dao.Q1.Eof do
  begin

    if (dao.Q1.fieldbyname('LIMITE').AsDateTime > dao.Q1.fieldbyname
      ('PROXIMA_REVISAO_DATA').AsDateTime) then
      avisos.Add('Data da Próxima Revisão do Veículo ' +
        dao.Q1.fieldbyname('NOM_VEICULO').AsString + ' expira em ' +
        formatdatetime('dd/mm/yyyy',
        dao.Q1.fieldbyname('PROXIMA_REVISAO_DATA').AsDateTime));

    if ((dao.Q1.fieldbyname('HODOMETRO').AsInteger + 1000) >
      dao.Q1.fieldbyname('PROXIMA_REVISAO_HODOMETRO').AsInteger) then
      avisos.Add('Hodometro da Próxima Revisão do Veículo ' +
        dao.Q1.fieldbyname('NOM_VEICULO').AsString + ' em ' +
        dao.Q1.fieldbyname('PROXIMA_REVISAO_HODOMETRO').AsString +
        '. Hodometro Atual: ' + dao.Q1.fieldbyname('HODOMETRO').AsString + '.');

    dao.Q1.Next;
  end;

  if avisos.count > 0 then
    MessageDlg(avisos.Text, mtWarning, [mbOk], 0);

  avisos.Free;
end;

procedure TFRPRI.TmAlertasTimer(Sender: TObject);
begin
  TmAlertas.Enabled := False;

  ChecarCertificado;
  ChecarEstoqueMinimo;
  ChecarAvisoPedidosExternos;
  ChecarRevisaoVeiculo;

  TmAlertas.Interval := 30000;
  TmAlertas.Enabled := True;

end;

procedure TFRPRI.D1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'metas_diarias';
	SetaAcesso(tipo_relatorio);
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.D2Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'comissoes_desconto';
	SetaAcesso(tipo_relatorio);
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.M4Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'metas_mensais';
	SetaAcesso(tipo_relatorio);
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.cliente_preClick(Sender: TObject);
begin
  try
    Application.CreateForm(Tfr_pre_cadastro, fr_pre_cadastro);
	SetaAcesso(fr_pre_cadastro.caption);
    fr_pre_cadastro.ShowModal;
  finally
    fr_pre_cadastro.Free;
  end;
end;

procedure TFRPRI.AtuacaoClick(Sender: TObject);
begin
  { try
    Application.CreateForm(TFrMapaAtuacao, FrMapaAtuacao);
    FrMapaAtuacao.ShowModal;
    finally
    FrMapaAtuacao.Free;
    end; }
end;

procedure TFRPRI.R1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'relatorio_cidade';
	SetaAcesso(tipo_relatorio);
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.p3Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'produtos_vendas';
	SetaAcesso(tipo_relatorio);
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.T3Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'televendas_cidade';
	SetaAcesso(tipo_relatorio);
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.Button2Click(Sender: TObject);
var
  processo: string;
  x: Integer;
  numdoc, status, processo_id: TStringList;
begin
  dao.geral2('select ' + '  v1.numdoc, ' + '  v1.processo_id , ' +
    '  case when v1.faturado = ''0'' and v1.empresa_faturar is null then ''À DIGITAR'' '
    + '  else case when v1.faturado = ''0'' and v1.empresa_faturar is not null then ''À FATURAR'' '
    + '  else case when v1.faturado = ''1'' then ''FATURADO-VENDAS'' ' +
    '  else case when v1.faturado = ''1'' and v1.nfe_dev is not null then ''FATURADO-ENTRADA'' '
    + '  else case when v1.faturado = ''2'' then ''CANCELADO'' ' +
    '  else case when v1.faturado = ''3'' then ''FATURADO-DEVOLUÇÃO'' ' +
    '  else case when v1.faturado = ''4'' then ''DESATIVADO'' ' +
    '  else case when v1.faturado = ''5'' then ''NFE DENEGADA'' end end end end end end end end as faturado '
    + 'from vendas1 v1 ' +
    'left outer join PROCESSO_PEDIDO pp on pp.ID = v1.PROCESSO_ID ' +
    'where v1.dtadoc > ''01.01.2016''  ' +
    // ' v1.PROCESSO_ID is null '+
    '   order by v1.numdoc desc');
  dao.Q2.First;
  numdoc := TStringList.Create;
  status := TStringList.Create;
  processo_id := TStringList.Create;
  while not dao.Q2.Eof do
  begin
    numdoc.Add(dao.Q2.fieldbyname('numdoc').AsString);
    status.Add(dao.Q2.fieldbyname('faturado').AsString);
    processo_id.Add(dao.Q2.fieldbyname('processo_id').AsString);
    dao.Q2.Next;
  end;

  dao.cn.StartTransaction;
  fm_splash.ggProgress.MaxValue := numdoc.count;
  fm_splash.lbStatus.Caption := 'Atualizando o Pedido...';
  fm_splash.ggProgress.Progress := 0;
  fm_splash.show;

  for x := 0 to numdoc.count - 1 do
  begin
    FMFUN.GravarProcessoPedido(status[x], processo_id[x], numdoc[x]);
    fm_splash.ggProgress.Progress := x + 1;
    fm_splash.update;
  end;
  dao.cn.Commit;
  fm_splash.close;
  ShowMessage('concluído!!!');

end;

procedure TFRPRI.Button3Click(Sender: TObject);
begin
//  raise Exception.Create('teste');
end;

procedure TFRPRI.T4Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
    tipo_relatorio := 'teto_faturamento';
	SetaAcesso(tipo_relatorio);
    Fr_opc_relatorios.ShowModal;
  finally
    Fr_opc_relatorios.Free;
  end;
end;

procedure TFRPRI.T5Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_telas, Fr_telas);
	SetaAcesso(Fr_telas.caption);
    Fr_telas.ShowModal;
  finally
    Fr_telas.Free;
  end;
end;

procedure TFRPRI.r3Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFr_representantes_clientes, Fr_representantes_clientes);
	SetaAcesso(Fr_representantes_clientes.caption);
    Fr_representantes_clientes.ShowModal;
  finally
    Fr_representantes_clientes.Free;
  end;
end;

end.

















































