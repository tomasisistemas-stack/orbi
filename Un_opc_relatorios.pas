unit Un_opc_relatorios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Mask, SToolEdit, registry,
  Comobj, frxCross, frxClass, RdPrint, sPageControl, sSpeedButton, sPanel,
  sBitBtn, sLabel, sCheckBox, sGroupBox, sRadioButton, sMaskEdit,
  sCustomComboEdit, sEdit, sComboEdit, frxExportCSV, frxExportBaseDialog,
  sCurrEdit, sCurrencyEdit, StrUtils;

type
  TFr_opc_relatorios = class(TForm)
    fR_RELATORIO: TfrxReport;
    RD: TRDprint;
    PageControl1: TsPageControl;
    TabSheet1: TsTabSheet;
    gbContasTipo: TsGroupBox;
    Prfinalizado: TsRadioButton;
    Praberto: TsRadioButton;
    Prtodos: TsRadioButton;
    p2: TsGroupBox;
    zzfaturado: TsRadioButton;
    zznao_faturado: TsRadioButton;
    zzfaturado_todos: TsRadioButton;
    ordenar1: TsGroupBox;
    RadioButton7: TsRadioButton;
    RadioButton8: TsRadioButton;
    RadioButton9: TsRadioButton;
    p1: TsPanel;
    PRmostrar_produto_estoque_zerado: TsCheckBox;
    cidade: TsPanel;
    Lbl_cidade: TsLabel;
    LbNom_cidade: TsLabel;
    sbCidade: TsSpeedButton;
    Prcod_cidade: TsComboEdit;
    edCidade: TsEdit;
    transportadora: TsPanel;
    Label38: TsLabel;
    LbNom_transportadora: TsLabel;
    sbTransp: TsSpeedButton;
    Prcod_transportadora: TsComboEdit;
    edTransportadora: TsEdit;
    ordenar2: TsGroupBox;
    Alfabeticamente: TsRadioButton;
    OrdemInterna: TsRadioButton;
    fop: TsPanel;
    Label4: TsLabel;
    lbfop: TsLabel;
    Prfop: TsComboEdit;
    GBdata_aniver: TsGroupBox;
    Label5: TsLabel;
    Label6: TsLabel;
    Prdta_inicial_aniver: TsEdit;
    Prdta_final_aniver: TsEdit;
    vendedor: TsPanel;
    Label3: TsLabel;
    Lbnom_representante: TsLabel;
    Prcod_representante: TsComboEdit;
    Pa_botoes: TsPanel;
    bt_imprimir: TsBitBtn;
    pn_microregiao: TsPanel;
    sLabel1: TsLabel;
    lbNomeMicroRegiao: TsLabel;
    sbMicroRegiao: TsSpeedButton;
    Prcod_microregiao: TsComboEdit;
    edMicroRegiao: TsEdit;
    rgAtivo: TsGroupBox;
    rbAtivo: TsRadioButton;
    rbInativo: TsRadioButton;
    rbAtivoTodos: TsRadioButton;
    rbPromocao: TsRadioButton;
    cliente: TsPanel;
    Lbl_cliente: TsLabel;
    Lbnom_cliente: TsLabel;
    sbCliente: TsSpeedButton;
    Prcod_cliente: TsComboEdit;
    edCliente: TsEdit;
    gbConta: TsPanel;
    lbContaCorrente: TsLabel;
    Label10: TsLabel;
    sbContaCorrente: TsSpeedButton;
    prContaCorrente: TsComboEdit;
    edContaCorrente: TsEdit;
    produto: TsPanel;
    Lbl_produto: TsLabel;
    Lbnom_produto: TsLabel;
    sbProduto: TsSpeedButton;
    Prcod_produto: TsComboEdit;
    edProduto: TsEdit;
    fornecedor: TsPanel;
    Lbl_fornecedor: TsLabel;
    Lbfornecedor: TsLabel;
    sbFornecedor: TsSpeedButton;
    Prcod_fornecedor: TsComboEdit;
    edFornecedor: TsEdit;
    codigo_fiscal: TsPanel;
    Lbl_cod_fiscal: TsLabel;
    Lbnom_cod_fiscal: TsLabel;
    Prcod_fiscal: TsComboEdit;
    gbPlanoConta: TsGroupBox;
    Lbnom_plano_contas_N1: TsLabel;
    Lbnom_plano_contas_N2: TsLabel;
    Lbnom_plano_contas_N3: TsLabel;
    Lbnom_plano_contas_N4: TsLabel;
    sbPlanoConta: TsSpeedButton;
    Prid_plano_contas: TsComboEdit;
    edPlanoContas: TsEdit;
    grupo: TsPanel;
    LbNom_Grupo: TsLabel;
    Lbl_grupo: TsLabel;
    sbGrupo: TsSpeedButton;
    Prcod_grupo: TsComboEdit;
    edGrupo: TsEdit;
    gbUltimaCompra: TsGroupBox;
    sLabel3: TsLabel;
    PrUltimaCompra: TsDateEdit;
    Gbdata: TsGroupBox;
    Label1: TsLabel;
    Label2: TsLabel;
    Prdta_inicial: TsDateEdit;
    Prdta_final: TsDateEdit;
    pnDesc: TsPanel;
    Label9: TsLabel;
    sbDesc: TsSpeedButton;
    edDesc: TsEdit;
    marca: TsPanel;
    Lb_marca: TsLabel;
    Lbnom_marca: TsLabel;
    Prcod_marca: TsComboEdit;
    loja: TsPanel;
    Lbl_empresa: TsLabel;
    Lbempresa: TsLabel;
    Prempresa: TsComboEdit;
    pn_pedido: TsPanel;
    Label7: TsLabel;
    Label8: TsLabel;
    edPedido: TsEdit;
    uf: TsPanel;
    Lbl_uf: TsLabel;
    lbuf: TsLabel;
    Pruf: TsComboEdit;
    pn_mesoregiao: TsPanel;
    sLabel2: TsLabel;
    lbNome_Mesoregiao: TsLabel;
    sbMesoRegiao: TsSpeedButton;
    Prcod_mesoregiao: TsComboEdit;
    edMesoRegiao: TsEdit;
    PrMostrarProdutosAbaixoEstoqueMinimo: TsCheckBox;
    ordernarempresas: TsGroupBox;
    rgAlfabeticamente: TsRadioButton;
    rgCodigo: TsRadioButton;
    rgEndereco: TsRadioButton;
    rgClienteBloqueado: TsGroupBox;
    rbbloqueado: TsRadioButton;
    rbNaoBloqueado: TsRadioButton;
    sRadioButton3: TsRadioButton;
    categoria: TsPanel;
    lbCategoria: TsLabel;
    sLabel5: TsLabel;
    sbCategoria: TsSpeedButton;
    PrCategoria: TsComboEdit;
    edCategoria: TsEdit;
    subcategoria: TsPanel;
    lbSubCategoria: TsLabel;
    sLabel6: TsLabel;
    sbSubCategoria: TsSpeedButton;
    prSubCategoria: TsComboEdit;
    edSubCategoria: TsEdit;
    rbIndisponivel: TsRadioButton;
    rbDisponivel: TsRadioButton;
    movimentacao: TsGroupBox;
    rbAcerto: TsRadioButton;
    rbEntrada: TsRadioButton;
    rbTodos: TsRadioButton;
    rbReservado: TsRadioButton;
    rbFaturado: TsRadioButton;
    zzdesativados: TsRadioButton;
    gbSupervisao: TsGroupBox;
    rbComSupervisao: TsRadioButton;
    rbSemSupervisao: TsRadioButton;
    rbApenasSupervisao: TsRadioButton;
    grTipoData: TsGroupBox;
    Rb_filtro_faturamento: TsRadioButton;
    Rb_filtro_emissao: TsRadioButton;
    gbTipoProduto: TsGroupBox;
    rbRevenda: TsRadioButton;
    rbOutros: TsRadioButton;
    sRadioButton4: TsRadioButton;
    pn_tablet: TsPanel;
    sLabel4: TsLabel;
    sLabel7: TsLabel;
    edPedidoTablet: TsEdit;
    edfop: TsEdit;
    sbLimpaFop: TsSpeedButton;
    OrdenarRanking: TsGroupBox;
    rbTotalVendas: TsRadioButton;
    rbMediaVendas: TsRadioButton;
    PrConstrutora: TsCheckBox;
    supervisor: TsPanel;
    sLabel8: TsLabel;
    lbsupervisor: TsLabel;
    prcod_supervisor: TsComboEdit;
    sLabel9: TsLabel;
    PrClienteDataCadastro: TsDateEdit;
    ckSomenteFotos: TsCheckBox;
    sLabel10: TsLabel;
    PrNaoCompraDesde: TsDateEdit;
    edCodRepresentante: TsEdit;
    sbLimpaRep: TsSpeedButton;
    edcodsupervisor: TsEdit;
    sbLimpaSup: TsSpeedButton;
    ed_marca: TsEdit;
    sbMarca: TsSpeedButton;
    PrProtesto: TsRadioButton;
    PrPagoAtraso: TsRadioButton;
    frxCSVExport1: TfrxCSVExport;
    uf_origem_destino: TsPanel;
    sLabel11: TsLabel;
    lbUFOrigem: TsLabel;
    PrUFOrigem: TsComboEdit;
    sLabel12: TsLabel;
    PrUFDestino: TsComboEdit;
    lbUFDestino: TsLabel;
    PrNaoConstrutoras: TsCheckBox;
    PrPessoaJuridica: TsCheckBox;
    pnBairro: TsPanel;
    sLabel13: TsLabel;
    edBairro: TsEdit;
    zzorcamento: TsRadioButton;
    ckRepetirFolha: TCheckBox;
    pnComissao: TsGroupBox;
    sLabel14: TsLabel;
    PrComissao: TsCurrencyEdit;
    edUFDestino: TsEdit;
    sbUFDestino: TsSpeedButton;
    rgTipoRep: TsRadioGroup;
    gbCSV: TsGroupBox;
    ckCSV: TCheckBox;
    rgOrdemQtdeValor: TsRadioGroup;
    gbConsumidorFinal: TsGroupBox;
    rbTodosConsumidorFinal: TsRadioButton;
    rbNaoConsumidorFinal: TsRadioButton;
    rbApenasConsumidorFinal: TsRadioButton;
    CodigoProduto: TsRadioButton;
    gbMesAno: TsGroupBox;
    cbMes: TComboBox;
    sLabel15: TsLabel;
    procedure bt_imprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Prcod_clienteButtonClick(Sender: TObject);
    procedure Prcod_clienteKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_cidadeButtonClick(Sender: TObject);
    procedure PRRazao_SocialKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_produtoButtonClick(Sender: TObject);
    procedure Prcod_produtoExit(Sender: TObject);
    procedure Prcod_produtoKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_grupoButtonClick(Sender: TObject);
    procedure Prcod_grupoKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_clienteExit(Sender: TObject);
    procedure Prcod_cidadeExit(Sender: TObject);
    procedure Prcod_grupoExit(Sender: TObject);
    procedure PrempresaButtonClick(Sender: TObject);
    procedure PrempresaKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_fiscalButtonClick(Sender: TObject);
    procedure Prcod_fiscalExit(Sender: TObject);
    procedure Prcod_fiscalKeyPress(Sender: TObject; var Key: Char);
    procedure PrufButtonClick(Sender: TObject);
    procedure PrufKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_fornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_fornecedorButtonClick(Sender: TObject);
    procedure Prcod_fornecedorExit(Sender: TObject);
    procedure PrempresaExit(Sender: TObject);
    procedure PrufExit(Sender: TObject);
    procedure Prcod_marcaButtonClick(Sender: TObject);
    procedure Prcod_marcaExit(Sender: TObject);
    procedure Prcod_marcaKeyPress(Sender: TObject; var Key: Char);
    procedure fR_RELATORIOGetValue(const VarName: string; var Value: Variant);
    procedure Prcod_transportadoraButtonClick(Sender: TObject);
    procedure Prcod_transportadoraExit(Sender: TObject);
    procedure Prcod_transportadoraKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_representanteButtonClick(Sender: TObject);
    procedure Prcod_representanteExit(Sender: TObject);
    procedure PrfopButtonClick(Sender: TObject);
    procedure PrfopKeyPress(Sender: TObject; var Key: Char);
    procedure PrfopExit(Sender: TObject);
    procedure Prcod_representanteKeyPress(Sender: TObject; var Key: Char);
    procedure RDNewPage(Sender: TObject; Pagina: Integer);
    procedure Prdta_inicial_aniverExit(Sender: TObject);
    procedure Prdta_final_aniverExit(Sender: TObject);
    procedure sbProdutoClick(Sender: TObject);
    procedure sbCidadeClick(Sender: TObject);
    procedure sbGrupoClick(Sender: TObject);
    procedure sbContaCorrenteClick(Sender: TObject);
    procedure prContaCorrenteButtonClick(Sender: TObject);
    procedure prContaCorrenteExit(Sender: TObject);
    procedure Prid_plano_contasButtonClick(Sender: TObject);
    procedure Prid_plano_contasExit(Sender: TObject);
    procedure sbPlanoContaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbDescClick(Sender: TObject);
    procedure sbFornecedorClick(Sender: TObject);
    procedure sbTranspClick(Sender: TObject);
    procedure sbMicroRegiaoClick(Sender: TObject);
    procedure sbMesoRegiaoClick(Sender: TObject);
    procedure Prcod_mesoregiaoButtonClick(Sender: TObject);
    procedure Prcod_mesoregiaoExit(Sender: TObject);
    procedure Prcod_mesoregiaoKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_microregiaoButtonClick(Sender: TObject);
    procedure sbClienteClick(Sender: TObject);
    procedure PrCategoriaExit(Sender: TObject);
    procedure PrCategoriaButtonClick(Sender: TObject);
    procedure PrCategoriaKeyPress(Sender: TObject; var Key: Char);
    procedure prSubCategoriaButtonClick(Sender: TObject);
    procedure prSubCategoriaKeyPress(Sender: TObject; var Key: Char);
    procedure prSubCategoriaExit(Sender: TObject);
    procedure sbCategoriaClick(Sender: TObject);
    procedure sbSubCategoriaClick(Sender: TObject);
    procedure sbLimpaFopClick(Sender: TObject);
    procedure edContaCorrenteChange(Sender: TObject);
    procedure edfopChange(Sender: TObject);
    procedure edClienteChange(Sender: TObject);
    procedure edProdutoChange(Sender: TObject);
    procedure edFornecedorChange(Sender: TObject);
    procedure edCidadeChange(Sender: TObject);
    procedure edMesoRegiaoChange(Sender: TObject);
    procedure Prcod_microregiaoExit(Sender: TObject);
    procedure edMicroRegiaoChange(Sender: TObject);
    procedure Prcod_cidadeKeyPress(Sender: TObject; var Key: Char);
    procedure prContaCorrenteKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_microregiaoKeyPress(Sender: TObject; var Key: Char);
    procedure prcod_supervisorExit(Sender: TObject);
    procedure prcod_supervisorButtonClick(Sender: TObject);
    procedure rbApenasSupervisaoClick(Sender: TObject);
    procedure rbSemSupervisaoClick(Sender: TObject);
    procedure rbComSupervisaoClick(Sender: TObject);
    procedure edCodRepresentanteChange(Sender: TObject);
    procedure sbLimpaRepClick(Sender: TObject);
    procedure edcodsupervisorChange(Sender: TObject);
    procedure sbLimpaSupClick(Sender: TObject);
    procedure sbMarcaClick(Sender: TObject);
    procedure PrUFOrigemExit(Sender: TObject);
    procedure PrUFDestinoExit(Sender: TObject);
    procedure PrUFOrigemKeyPress(Sender: TObject; var Key: Char);
    procedure PrUFDestinoKeyPress(Sender: TObject; var Key: Char);
    procedure PrUFOrigemButtonClick(Sender: TObject);
    procedure PrUFDestinoButtonClick(Sender: TObject);
    procedure sbUFDestinoClick(Sender: TObject);
  private
    procedure relatorio_posicao_estoque_preco_venda(codgrupo, codpro: string);
    procedure relatorio_auxiliar_compra(Modo: ShortString; tipofonte: TTipoFonte);
    procedure configuraRD(fonteTamanho: TSize; tipoImpressora: TModelo; qtdcoluna, qtdlinha: Integer; qtdLpp: TLinha; testaporta, usaGerenciador: boolean);
    procedure monta_rel_produto_ncm_st(cod_grupo, cod_fonecedor: string);
    procedure monta_rel_produto_catalogo;
    procedure monta_rel_pauta_venda_categoria;
    procedure relatorio_metas_diarias;
    procedure relatorio_metas_mensais;
    procedure relatorio_comparativo_tablet;
    procedure ProdutoVendedor;
    procedure relatorio_supervisao;
    procedure relatorio_televendas;
    procedure relatorio_produto_vendas;
    procedure TeleVendasCidade;
    procedure relatorio_teto_fixo;
    procedure ranking_vendas;
    procedure relatorio_cliente_produto;
    procedure monta_rel_produtos_capa;
    procedure relatorio_comissao_desconto(c_fornecedor, c_loja, c_grupo, c_vendedor, c_marca: string);
    procedure relatorio_ranking_produtos;
    procedure ranking_vendas_completo;
    { Private declarations }
  public
    { Public declarations }
    procedure busca_produto_unitario(leitor: boolean; cod_barras: string);

    { *******RELATORIOS DE LISTAGEM******** }
    procedure monta_rel_cliente(cod_cidade: string; uf: string);
    procedure monta_rel_fornecedor;
    procedure monta_rel_cliente_completo(cod_cidade, uf, empresa: string);
    procedure relatorio_pauta_produto(c_fornecedor: string; c_grupo: string);
    procedure monta_rel_pauta_venda(cod_grupo, cod_fonecedor: string);
    procedure monta_rel_pauta_venda_est(cod_grupo, cod_fonecedor: string);
    procedure relatorio_aniversariantes(data_inicial, data_final: string);
    procedure monta_rel_produto_ncm(cod_grupo, cod_fonecedor: string);
    procedure monta_rel_produto_desconto_especial;
    procedure monta_rel_produto_calculo_preco_venda;
    procedure monta_rel_prateleira;
    procedure monta_rel_palm;
    procedure monta_rel_representante;
    procedure monta_rel_lista_func_cc;
    procedure relatorio_plano_contas_lista;

    { *******RELATORIOS DE ESTOQUE***** }
    procedure relatorio_posicao_estoque(codgrupo: string; codfor: string);
    // simplificado
    procedure relatorio_posicao_estoque_ind(codgrupo: string; codfor: string);
    // simplificado

    procedure relatorio_posicao_estoque_custo(codgrupo: string; codpro: string);
    procedure relatorio_movimentacao_produto;
    procedure relatorio_posicao_estoque_venda(codgrupo: string; codpro, codfor: string);
    procedure relatorio_posicao_estoque_venda_ind(codgrupo: string; codpro, codfor: string);
    procedure relatorio_posicao_estoque_completo(c_fornecedor: string);
    procedure relatorio_posicao_estoque_completo_simplificado(c_fornecedor: string);
    procedure relatorio_posicao_estoque_completo_simulada(c_fornecedor: string);
    procedure relatorio_pedidos_desfaturados;
    procedure relatorio_pedidos_geral;
    procedure relatorio_historico_movimentacao_produto(cod_produto: string; empresa: string);

    { *******RELATORIO DE VENDAS******** }
    { Detalhados }
    procedure relatorio_vendas_cliente(dta_inicial: TDate; dta_final: TDate; cod_cliente: string; cod_empresa: string; cod_fornecedor: string);
    procedure relatorio_vendas_cliente_ind(dta_inicial: TDate; dta_final: TDate; cod_cliente: string; cod_empresa: string); // sem cor e tamanho
    procedure relatorio_vendas_periodo(dta_inicial: string; dta_final: string);
    procedure relatorio_vendas_periodo_data(dta_inicial: string; dta_final: string);
    procedure relatorio_vendas_fornecedor_loja(c_fornecedor: string; c_loja: string);
    procedure relatorio_vendas_vendedor(c_fornecedor, c_loja, c_grupo, c_vendedor, c_marca, c_produto: string);
    // relatorio por periodo agrupado por vendedor
    procedure relatorio_vendas_vendedor_ind(c_fornecedor, c_loja, c_grupo, c_vendedor, c_marca, c_produto: string);
    procedure relatorio_rankin_clientes;
    procedure relatorio_rankin_clientes_simplificado(dta_inicial: TDate; dta_final: TDate);
    { Simplificados }
    procedure relatorio_vendas_padrao(c_fornecedor, c_loja, c_grupo, c_vendedor, c_marca: string);
    procedure relatorio_comissao(c_fornecedor, c_loja, c_grupo, c_vendedor, c_marca: string);
    procedure relatorio_comissao_cr_baixadas;
    procedure monta_rel_pedidos_vendedor;

    { *******RELATORIO DE ENTRADAS******** }
    procedure relatorio_notas_entradas(dta_inicial: string; dta_final: string);
    procedure relatorio_notas_entradas_detalhada(dta_inicial, dta_final, cod_for, cod_marca, cod_grupo: string);

    { *******RELATORIO DE TRANSFERENCIAS******** }
    procedure relatorio_transferencias(dta_inicial: string; dta_final: string; cod_fornecedor, cod_marca, cod_grupo, cod_empresa: string);

    { *******RELATORIO DE CONSIGNAÇÃO }
    procedure relatorio_consig(c_cliente: string; dta_inicial: string; dta_final: string);

    { *******RELATORIO DE FINANCEIRO }
    procedure relatorio_cheques_terceiro;
    procedure relatorio_contas_receber(dta_ini, dta_fin, cod_empresa, cod_representante, cod_cliente, cod_fop, finalizado: string);
    procedure relatorio_extrato;
    procedure relatorio_cobranca;

    { *******RELATORIO TRANSPORTADORA****** }
    procedure relatorio_controle_fretes_transportadora(c_transportadora: string; dta_inicial: string; dta_final: string);

    { *******RELATORIO TRANSPORTADORA****** }
    procedure relatorio_solicitacao_compra(codfor, codgru: string);
    // relatorio de solicitacao de compra mediante posição estoque minimo

    { *******RELATORIO COMISSÃO****** }
    procedure relatorio_comissao_venda(codrep, dta_inicial, dta_final, faturado: string);
    procedure relatorio_comissao_novo(tipo, c_fornecedor, c_loja, c_grupo, c_vendedor, c_marca: string);
    procedure relatorio_contas_pagar;
    procedure relatorio_plano_contas;
    procedure monta_rel_transportadora;
    procedure relatorio_comissao_novo_simplificado(c_fornecedor, c_loja, c_grupo, c_vendedor, c_marca: string);
  end;

var
  Fr_opc_relatorios: TFr_opc_relatorios;
  tipo_fonte: TTipoFonte;
  path: string;

implementation

uses
  Un_dao, Un_rel_cliente, UnPri, Un_localizar, UnFun, Un_dm,
  DB, Un_splash;

{$R *.dfm}
{ TFr_opc_relatorios }

procedure TFr_opc_relatorios.monta_rel_cliente(cod_cidade: string; uf: string);
var
  cmd, cmd_prod: string;
begin
  cmd := 'select cod_cliente, cast(nom_cliente||coalesce(''/''||substring(nom_fantasia from 1 for 25), '''') as varchar(200)) as nom_cliente, c.contato, cd.nom_cidade, telefone, cd.uf from cliente c ' +
         'left join cidades cd on cd.cod_cidade=c.cod_cidade ' +
         'inner join cadmicro mc on (mc.microcod = cd.microcod) ' +
         'inner join cadmeso ms on (ms.mesocod = mc.mesocod) ' +
         'where 1 = 1 ';

  if PrConstrutora.Checked then
    cmd := cmd + ' and c.CONSTRUTORA = ''S''';

  if PrNaoConstrutoras.Checked then
    cmd := cmd + ' and c.CONSTRUTORA = ''N''';

  if rbbloqueado.Checked then
    cmd := cmd + ' and c.CLIENTE_BLOQUEADO = ''S''';

  if PrPessoaJuridica.Checked then
    cmd := cmd + ' and c.TIP_PESSOA = ''J''';

  if rbNaoBloqueado.Checked then
    cmd := cmd + ' and (c.CLIENTE_BLOQUEADO <> ''S'' OR C.CLIENTE_BLOQUEADO IS NULL)';

  if cod_cidade <> '' then
  begin
    cmd := cmd + fmfun.cmdAux('c.cod_cidade', cod_cidade);
  end;

  if PrClienteDataCadastro.date <> 0 then
    cmd := cmd + 'and c.DTA_CAD >= ' + quotedstr(formatdatetime('yyyy/mm/dd', PrClienteDataCadastro.date));

  if edMicroRegiao.Text <> '' then
    cmd := cmd + fmfun.cmdAux('mc.microcod', edMicroRegiao.Text);

  if edCliente.Text <> '' then
    cmd := cmd + fmfun.cmdAux('c.cod_cliente', edCliente.Text);

  if edMesoRegiao.Text <> '' then
    cmd := cmd + fmfun.cmdAux('ms.mesocod', edMesoRegiao.Text);

  if PrUltimaCompra.date <> 0 then
    cmd := cmd + ' and c.COD_CLIENTE in (select distinct v.cod_cliente from vendas1 v where V.NFEENTRADASAIDA = ''0'' AND AND V.PROCESSO_ID NOT IN (SELECT PROCESSO_ID FROM VENDAS1 WHERE FATURADO <> 2 AND NFEENTRADASAIDA = ''1'') AND v.COD_FISCAL not in (''6152'', ''6409'') '+
                 ' and v.nfe_dev is null and  v.faturado in (0, 1, 3) and v.DTADOC > ''' + formatdatetime('yyyy/mm/dd', PrUltimaCompra.date) + ''') ';

  cmd_prod := '(SELECT v1.COD_CLIENTE FROM  vendas1 v1 inner join VENDAS2 v2 on v2.NUMDOC = v1.NUMDOC ' + 'inner join produto p on  p.COD_PRODUTO = v2.COD_PRODUTO ' + 'left outer join grupo g on p.cod_grupo = g.cod_grupo ' + 'left outer join SUBCATEGORIA s on s.id = p.SUBCATEGORIA ' + 'left outer join CATEGORIA ct on ct.ID = s.CATEGORIA ';

  if edGrupo.Text <> '' then
    cmd := cmd + ' and c.COD_CLIENTE in ' + cmd_prod + ' where 1 = 1 ' + fmfun.cmdAux('g.cod_grupo', edGrupo.Text) + ')';

  if edCategoria.Text <> '' then
    cmd := cmd + ' and c.COD_CLIENTE in ' + cmd_prod + ' where 1 = 1 ' + fmfun.cmdAux('ct.id', edCategoria.Text) + ')';

  if edSubCategoria.Text <> '' then
    cmd := cmd + ' and c.COD_CLIENTE in ' + cmd_prod + ' where 1 = 1 ' + fmfun.cmdAux('s.id', edSubCategoria.Text) + ')';

  if edProduto.Text <> '' then
    cmd := cmd + ' and c.COD_CLIENTE in ' + cmd_prod + ' where 1 = 1 ' + fmfun.cmdAux('p.cod_produto', edProduto.Text) + ')';

  if PrNaoCompraDesde.date <> 0 then
    cmd := cmd + ' and c.COD_CLIENTE not in (select distinct v.cod_cliente from vendas1 v where v.cod_cliente is not null and v.COD_FISCAL not in (''6152'', ''6409'') V.NFEENTRADASAIDA = ''0'' '+
                 ' AND V.PROCESSO_ID NOT IN (SELECT PROCESSO_ID FROM VENDAS1 WHERE FATURADO <> 2 AND NFEENTRADASAIDA = ''1'') and  v.nfe_dev is null and v.faturado in (0, 1, 3) and v.DTADOC > ''' + formatdatetime('yyyy/mm/dd', PrNaoCompraDesde.date) + ''') ';

  if edcodsupervisor.Text <> '' then
    cmd := cmd + fmfun.cmdAux('cd.cod_supervisor', edcodsupervisor.Text);

  if edCodRepresentante.Text <> '' then
    cmd := cmd + fmfun.cmdAux('c.ID_REPRESENTANTE', edCodRepresentante.Text);

  if Pruf.Text <> '' then
    cmd := cmd + ' and cd.uf=' + quotedstr(Pruf.Text);

  if rgAlfabeticamente.Checked then
    cmd := cmd + ' order by cd.nom_cidade, nom_cliente';

  if rgCodigo.Checked then
    cmd := cmd + ' order by cd.nom_cidade, cod_cliente';

  if rgEndereco.Checked then
    cmd := cmd + ' order by cd.nom_cidade, bairro, endereco, nr_endereco';

  Application.CreateForm(TFr_rel_cliente, Fr_rel_cliente);
  with Fr_rel_cliente.qu_cliente do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  Fr_rel_cliente.lb_empresa.Caption := nom_empresa;
  Fr_rel_cliente.Lb_titulo.Caption := 'LISTAGEM DE CLIENTES';
  Fr_rel_cliente.Rl_cliente.Preview();

end;

procedure TFr_opc_relatorios.monta_rel_fornecedor;
var
  cmd: string;
begin
  cmd := 'SELECT a.COD_FORNECEDOR, a.RAZAO_SOCIAL, a.FANTASIA, a.TIP_PESSOA, a.ENDERECO, a.BAIRRO, a.COD_CIDADE, a.CEP, ' + ' a.FONE, a.FAX, a.CNPCPF, a.IERG, a.EMAIL, a.HOME_PAGE, a.OBSERVACAO, a.LUCRO_DEFINIDO, a.TIPO_EMPRESA, ' + ' a.USO_PREPEDIDO, a.INATIVO, a.COMPLEMENTO, a.NR_ENDERECO, a.NFE_EMAIL, cd.nom_cidade, cd.uf FROM FORNECEDOR a ' + 'left join cidades cd on cd.cod_cidade= a.cod_cidade ' + 'inner join cadmicro mc on (mc.microcod = cd.microcod) ' + 'inner join cadmeso ms on (ms.mesocod = mc.mesocod) ' + 'where 1 = 1 ';

  if edFornecedor.Text <> '' then
    cmd := cmd + fmfun.cmdAux('a.cod_fornecedor', edFornecedor.Text);

  if edCidade.Text <> '' then
    cmd := cmd + fmfun.cmdAux('a.cod_cidade', edCidade.Text);

  if Pruf.Text <> '' then
    cmd := cmd + ' and CD.uf = ' + quotedstr(Pruf.Text);

  if edDesc.Text <> '' then
    cmd := cmd + ' and a.RAZAO_SOCIAL like ''%' + edDesc.Text + '%''';

  if edMicroRegiao.Text <> '' then
    cmd := cmd + fmfun.cmdAux('mc.microcod', edMicroRegiao.Text);

  if edMesoRegiao.Text <> '' then
    cmd := cmd + fmfun.cmdAux('ms.mesocod', edMesoRegiao.Text);

  cmd := cmd + ' order by a.RAZAO_SOCIAL ';

  with dm.q_fornecedor do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_fornecedor.RecordCount <= 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\fornecedor.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.bt_imprimirClick(Sender: TObject);
var
  Registro: TRegistry;
begin
  Registro := TRegistry.Create;
  Registro.RootKey := HKEY_CURRENT_USER;
  Registro.OpenKey('software\Acta\Orbi', true);

  Registro.Free;

  if tipo_relatorio = 'relatorio_aniversariantes' then
  begin
    relatorio_aniversariantes(Prdta_inicial_aniver.Text, Prdta_final_aniver.Text);
  end
  else if tipo_relatorio = 'televendas_cidade' then
    TeleVendasCidade
  else if tipo_relatorio = 'contas_pagar' then
    relatorio_contas_pagar
  else if tipo_relatorio = 'relatorio_movimentacao_produto' then
    relatorio_movimentacao_produto
  else if tipo_relatorio = 'produtos_vendas' then
    relatorio_produto_vendas
  else if tipo_relatorio = 'clientes_produtos' then
    relatorio_cliente_produto
  else if tipo_relatorio = 'relatorio_estoque_simples' then
  begin
    if area_atuacao = '0' then // comercio_vestuario
      relatorio_posicao_estoque(Prcod_grupo.Text, Prcod_fornecedor.Text)
    else
      relatorio_posicao_estoque_ind(Prcod_grupo.Text, Prcod_fornecedor.Text);

  end
  else if tipo_relatorio = 'relatorio_estoque_inventario' then
  begin
    relatorio_posicao_estoque_custo(Prcod_grupo.Text, edProduto.Text);
  end
  else if tipo_relatorio = 'relatorio_estoque_custo' then
  begin
    relatorio_posicao_estoque_custo(Prcod_grupo.Text, edProduto.Text);
  end
  else if tipo_relatorio = 'relatorio_estoque_venda' then
  begin
    if area_atuacao = '0' then
      relatorio_posicao_estoque_venda(Prcod_grupo.Text, edProduto.Text, Prcod_fornecedor.Text)
    else
      relatorio_posicao_estoque_venda_ind(Prcod_grupo.Text, edProduto.Text, Prcod_fornecedor.Text)

  end
  else if tipo_relatorio = 'Fornecedor' then
    monta_rel_fornecedor
  else if tipo_relatorio = 'relatorio_cliente' then
  begin
    monta_rel_cliente(edCidade.Text, Pruf.Text);
  end
  else if tipo_relatorio = 'vendas_periodo_vendedor' then
    if area_atuacao = '0' then // comercio_vestuario
      relatorio_vendas_vendedor(Prcod_fornecedor.Text, Prempresa.Text, Prcod_grupo.Text, Prcod_representante.Text, Prcod_marca.Text, edProduto.Text)
    else
      relatorio_vendas_vendedor_ind(Prcod_fornecedor.Text, Prempresa.Text, Prcod_grupo.Text, Prcod_representante.Text, Prcod_marca.Text, edProduto.Text)
  else if tipo_relatorio = 'vendas_periodo_cliente' then
  begin
    if area_atuacao = '0' then // comercio_vestuario
      relatorio_vendas_cliente(Prdta_inicial.date, Prdta_final.date, Prcod_cliente.Text, Prempresa.Text, Prcod_fornecedor.Text)
    else
      relatorio_vendas_cliente_ind(Prdta_inicial.date, Prdta_final.date, Prcod_cliente.Text, Prempresa.Text);
  end
  else if tipo_relatorio = 'vendas_fornecedor_custo' then
    relatorio_vendas_fornecedor_loja(Prcod_fornecedor.Text, Prempresa.Text)
  else if tipo_relatorio = 'vendas_periodo_data' then
    relatorio_vendas_periodo_data(Prdta_inicial.Text, Prdta_final.Text)
  else if tipo_relatorio = 'vendas_padrao' then
  begin
    if area_atuacao = '0' then // comercio_vestuario
      relatorio_vendas_padrao(Prcod_fornecedor.Text, Prempresa.Text, Prcod_grupo.Text, Prcod_representante.Text, Prcod_marca.Text)
    else
      relatorio_vendas_padrao(Prcod_fornecedor.Text, Prempresa.Text, Prcod_grupo.Text, Prcod_representante.Text, Prcod_marca.Text);
  end
  else if tipo_relatorio = 'televendas' then
    relatorio_televendas
  else if tipo_relatorio = 'vendas_geral' then
    relatorio_pedidos_geral
  else if tipo_relatorio = 'ranking_vendas' then
    ranking_vendas
  else if tipo_relatorio = 'ranking_vendas_completo' then
    ranking_vendas_completo
  else if tipo_relatorio = 'teto_faturamento' then
    relatorio_teto_fixo
  else if tipo_relatorio = 'comissoes' then
  begin
    if area_atuacao = '0' then // comercio_vestuario
      relatorio_comissao(Prcod_fornecedor.Text, Prempresa.Text, Prcod_grupo.Text, Prcod_representante.Text, Prcod_marca.Text)
    else
      relatorio_comissao(Prcod_fornecedor.Text, Prempresa.Text, Prcod_grupo.Text, Prcod_representante.Text, Prcod_marca.Text);
  end
  else if tipo_relatorio = 'comissoes_desconto' then
  begin
    relatorio_comissao_desconto(Prcod_fornecedor.Text, Prempresa.Text, Prcod_grupo.Text, Prcod_representante.Text, Prcod_marca.Text);
  end
  else if tipo_relatorio = 'cr_baixadas' then
    relatorio_comissao_cr_baixadas
  else if tipo_relatorio = 'supervisao' then
    relatorio_supervisao
  else if tipo_relatorio = 'metas_diarias' then
    relatorio_metas_diarias
  else if tipo_relatorio = 'metas_mensais' then
    relatorio_metas_mensais
  else if tipo_relatorio = 'comissoes_novo' then
  begin
    if area_atuacao = '0' then // comercio_vestuario
      relatorio_comissao_novo('0', Prcod_fornecedor.Text, Prempresa.Text, Prcod_grupo.Text, Prcod_representante.Text, Prcod_marca.Text)
    else
      relatorio_comissao_novo('0', Prcod_fornecedor.Text, Prempresa.Text, Prcod_grupo.Text, Prcod_representante.Text, Prcod_marca.Text);
  end
  else if tipo_relatorio = 'pedidos_vendedor' then
  begin
    monta_rel_pedidos_vendedor;
  end
  else if tipo_relatorio = 'palm' then
  begin
    monta_rel_palm;
  end
  else if tipo_relatorio = 'prateleira' then
  begin
    monta_rel_prateleira;
  end
  else if (tipo_relatorio = 'comissoes_novo_simplificado') or (tipo_relatorio = 'comissao_comparativo') then
  begin
    if area_atuacao = '0' then // comercio_vestuario
      relatorio_comissao_novo_simplificado(Prcod_fornecedor.Text, Prempresa.Text, Prcod_grupo.Text, Prcod_representante.Text, Prcod_marca.Text)
    else
      relatorio_comissao_novo_simplificado(Prcod_fornecedor.Text, Prempresa.Text, Prcod_grupo.Text, Prcod_representante.Text, Prcod_marca.Text);
  end
  else if tipo_relatorio = 'comissoes_novo_detalhado' then
  begin
    if area_atuacao = '0' then // comercio_vestuario
      relatorio_comissao_novo('1', Prcod_fornecedor.Text, Prempresa.Text, Prcod_grupo.Text, Prcod_representante.Text, Prcod_marca.Text)
    else
      relatorio_comissao_novo('1', Prcod_fornecedor.Text, Prempresa.Text, Prcod_grupo.Text, Prcod_representante.Text, Prcod_marca.Text);
  end
  else if tipo_relatorio = 'comparativo_tablet' then
  begin
    relatorio_comparativo_tablet;
  end
  else if tipo_relatorio = 'relatorio_pedidos_desfaturados' then
    relatorio_pedidos_desfaturados
  else if tipo_relatorio = 'ranking_cliente' then
  begin
    relatorio_rankin_clientes;
  end
  else if tipo_relatorio = 'ranking_cliente_simplificado' then
  begin
    relatorio_rankin_clientes_simplificado(Prdta_inicial.date, Prdta_final.date);
  end;

  if tipo_relatorio = 'relatorio_notas_entrada' then
    relatorio_notas_entradas(Prdta_inicial.Text, Prdta_final.Text)
  else if tipo_relatorio = 'relatorio_notas_entrada_detalhado' then
    relatorio_notas_entradas_detalhada(Prdta_inicial.Text, Prdta_final.Text, Prcod_fornecedor.Text, Prcod_marca.Text, Prcod_grupo.Text)
  else if tipo_relatorio = 'relatorio_estoque_completo' then
    relatorio_posicao_estoque_completo(Prcod_fornecedor.Text)
  else if tipo_relatorio = 'relatorio_estoque_simplificado' then
    relatorio_posicao_estoque_completo_simplificado(Prcod_fornecedor.Text)
  else if tipo_relatorio = 'relatorio_pauta_produto' then
    relatorio_pauta_produto(Prcod_fornecedor.Text, Prcod_grupo.Text)
  else if tipo_relatorio = 'relatorio_consignacao' then
    relatorio_consig(Prcod_cliente.Text, Prdta_inicial.Text, Prdta_final.Text)
  else if tipo_relatorio = 'cheque_terceiros' then
    relatorio_cheques_terceiro
  else if tipo_relatorio = 'controle_fretes_transportadora' then
    relatorio_controle_fretes_transportadora(Prcod_transportadora.Text, Prdta_inicial.Text, Prdta_final.Text)
  else if tipo_relatorio = 'relatorio_cliente_completo' then
    monta_rel_cliente_completo(edCidade.Text, Pruf.Text, Prempresa.Text)
  else if tipo_relatorio = 'relatorio_transportadora' then
    monta_rel_transportadora
  else if tipo_relatorio = 'relatorio_representante' then
    monta_rel_representante
  else if tipo_relatorio = 'lista_func_cc' then
    monta_rel_lista_func_cc
  else if tipo_relatorio = 'produto_ncm' then
    monta_rel_produto_ncm(Prcod_grupo.Text, Prcod_fornecedor.Text)
  else if (tipo_relatorio = 'produto_ncm_st') or (tipo_relatorio = 'produto_ncm_st_completo') then
    monta_rel_produto_ncm_st(Prcod_grupo.Text, Prcod_fornecedor.Text)
  else if tipo_relatorio = 'produto_desconto_especial' then
    monta_rel_produto_desconto_especial
  else if (tipo_relatorio = 'pauta_venda') or (tipo_relatorio = 'produtos_codigo_barra') then
    monta_rel_pauta_venda(Prcod_grupo.Text, Prcod_fornecedor.Text)
  else if (tipo_relatorio = 'pauta_venda_categoria') then
    monta_rel_pauta_venda_categoria
  else if (tipo_relatorio = 'produtos_catalogo') then
    monta_rel_produto_catalogo
  else if (tipo_relatorio = 'produtos_capa_6') then
    monta_rel_produtos_capa
  else if (tipo_relatorio = 'produtos_capa_11') then
    monta_rel_produtos_capa
  else if (tipo_relatorio = 'produtos_capa_20_5') then
    monta_rel_produtos_capa
  else if (tipo_relatorio = 'produtos_capa_24_6') then
    monta_rel_produtos_capa
  else if tipo_relatorio = 'produto_calculo_preco_venda' then
    monta_rel_produto_calculo_preco_venda
  else if tipo_relatorio = 'pauta_vendas_est' then
    monta_rel_pauta_venda_est(Prcod_grupo.Text, Prcod_fornecedor.Text)
  else if tipo_relatorio = 'relatorio_transferencia' then
    relatorio_transferencias(Prdta_inicial.Text, Prdta_final.Text, Prcod_fornecedor.Text, Prcod_marca.Text, Prcod_grupo.Text, Prempresa.Text)
  else if tipo_relatorio = 'solicitacao_ordem_compra' then
  begin
    if area_atuacao = '0' then // comercio_vestuario
      // relatorio_vendas_padrao(Prcod_fornecedor.Text,Prempresa.Text, Prcod_grupo.Text,Prcod_representante.Text,Prcod_marca.Text)

    else
      relatorio_solicitacao_compra(Prcod_fornecedor.Text, Prcod_grupo.Text);
  end
  else if tipo_relatorio = 'Plano Contas Lista' then
    relatorio_plano_contas_lista
  else if tipo_relatorio = 'Plano Contas' then
    relatorio_plano_contas
  else if tipo_relatorio = 'Extrato' then
    relatorio_extrato
  else if tipo_relatorio = 'relatorio_auxiliar_compra' then
  begin
    if area_atuacao = '0' then // comercio_vestuario
      // relatorio_vendas_padrao(Prcod_fornecedor.Text,Prempresa.Text, Prcod_grupo.Text,Prcod_representante.Text,Prcod_marca.Text)

    else
      relatorio_auxiliar_compra('visualizar', comp17);
  end
  else if tipo_relatorio = 'cobrança' then
    relatorio_cobranca
  else if tipo_relatorio = 'ranking_produtos' then
    relatorio_ranking_produtos
  else if tipo_relatorio = 'contas_receber' then
  begin
    if Prfinalizado.Checked then
      relatorio_contas_receber(Prdta_inicial.Text, Prdta_final.Text, Prempresa.Text, Prcod_representante.Text, Prcod_cliente.Text, Prfop.Text, 'S')
    else if Praberto.Checked then
      relatorio_contas_receber(Prdta_inicial.Text, Prdta_final.Text, Prempresa.Text, Prcod_representante.Text, Prcod_cliente.Text, Prfop.Text, 'N')
    else if PrPagoAtraso.Checked then
      relatorio_contas_receber(Prdta_inicial.Text, Prdta_final.Text, Prempresa.Text, Prcod_representante.Text, Prcod_cliente.Text, Prfop.Text, 'N')
    else if PrProtesto.Checked then
      relatorio_contas_receber(Prdta_inicial.Text, Prdta_final.Text, Prempresa.Text, Prcod_representante.Text, Prcod_cliente.Text, Prfop.Text, 'N')
    else if Prtodos.Checked then
      relatorio_contas_receber(Prdta_inicial.Text, Prdta_final.Text, Prempresa.Text, Prcod_representante.Text, Prcod_cliente.Text, Prfop.Text, 'T');

  end
  else if tipo_relatorio = 'comissao_venda' then
  begin
    if zzfaturado.Checked then
      relatorio_comissao_venda(Prcod_representante.Text, Prdta_inicial.Text, Prdta_final.Text, 'S')
    else if zznao_faturado.Checked then
      relatorio_comissao_venda(Prcod_representante.Text, Prdta_inicial.Text, Prdta_final.Text, 'N')
    else if zzfaturado_todos.Checked then
      relatorio_comissao_venda(Prcod_representante.Text, Prdta_inicial.Text, Prdta_final.Text, 'T')

  end

end;

procedure TFr_opc_relatorios.FormCreate(Sender: TObject);
var
  Registro: TRegistry;
begin
  Registro := TRegistry.Create;
  Registro.RootKey := HKEY_CURRENT_USER;
  Registro.OpenKey('Software\Acta\Orbi', true);
  Registro.Free;

end;

procedure TFr_opc_relatorios.relatorio_posicao_estoque(codgrupo: string; codfor: string);
var
  cmd: string;
begin
  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\posicao_estoque_simplificado.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;

  cmd := 'select pro.cod_produto, pro.nom_produto, pro.grade, pro.QTD_EMBALAGEM,  pro.QTD_ESTOQUE_MIN, pro.QTD_ESTOQUE_MAX, pro.UNIDADE, coalesce(pro.qtd_estoque, 0) as qtd_estoque, pro.qtd_reservado, pro.cod_grupo, cr.cor , tm.tamanho, gd.est_individual, ' +
         'g.cod_grupo, g.nom_grupo, pro.preco_venda, f.razao_social ' +
         'from produto pro ' +
         'left join grade gd on gd.cod_produto=pro.cod_produto ' +
         'left join cores cr on cr.id=gd.id_cor ' +
         'left join tamanho tm on tm.id=gd.id_tamanho ' +
         'left join fornecedor f on f.cod_fornecedor = pro.fornecedor_principal ' +
         'left join grupo g on g.cod_grupo = pro.cod_grupo ';

  if rbRevenda.Checked then
    cmd := cmd + ' and pro.revenda = ''S''';

  if rbOutros.Checked then
    cmd := cmd + ' and pro.revenda = ''N''';

  if rbAtivo.Checked then
    cmd := cmd + 'where status<>' + quotedstr('S');

  if rbInativo.Checked then
    cmd := cmd + 'where status=' + quotedstr('S');

  if rbPromocao.Checked then
    cmd := cmd + 'where pro.promocao = ''S''';

  if rbIndisponivel.Checked then
    cmd := cmd + 'where pro.indisponivel = ''S''';

  if rbDisponivel.Checked then
    cmd := cmd + 'where pro.indisponivel = ''N''';

  if edFornecedor.Text <> '' then
    cmd := cmd + ' and ( 1 = 1 ' + fmfun.cmdAux('pro.fornecedor_principal', edFornecedor.Text) + ' or 0 < (SELECT count(*) FROM PRODUTO_FORNECEDOR pf where pf.cod_produto = pro.cod_produto ' + fmfun.cmdAux('pf.cod_fornecedor', edFornecedor.Text) + '))';

  if edGrupo.Text <> '' then
    cmd := cmd + fmfun.cmdAux('pro.cod_grupo', edGrupo.Text);

  if PrMostrarProdutosAbaixoEstoqueMinimo.Checked then
    cmd := cmd + ' and pro.QTD_ESTOQUE < pro.ESTOQUE_MINIMO ';

  cmd := cmd + ' order by g.nom_grupo, pro.nom_produto';

  with dm.q_posicao_estoque do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;
  fR_RELATORIO.ShowReport;
end;

procedure TFr_opc_relatorios.relatorio_contas_pagar;
var
  cmd: string;
begin
  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\conta_pagar.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;

  cmd := 'select cr1.dtaven, cr1.dtapag, cr1.titulo, '+
         ' case when cr1.COD_REPRESENTANTE is not null then F.Nom_representante '+
         ' else '''' end as REPRESENTANTE, '+
         ' CR1.HISTORICO1, '+
         ' cr1.sequencia, cr1.valor, coalesce(cr1.valor_pago, 0) as valor_pago, '+
         ' c.razao_social, c.fone, fp.nom_fop, e.nom_empresa from cp1 cr1 ' +
         ' left join fornecedor c on c.cod_fornecedor=cr1.cod_fornecedor ' +
         ' left join fop fp on fp.cod_fop=cr1.cod_fop ' +
         ' left join representante f on f.ID=cr1.COD_REPRESENTANTE ' +
         ' left join empresa e on e.cod_empresa=cr1.cod_empresa where 1 = 1 ';
  if edPlanoContas.Text <> '' then
    cmd := cmd + fmfun.cmdAux('CR1.ID_PLANO_CONTAS', edPlanoContas.Text);

  if edDesc.Text <> '' then
    cmd := cmd + ' and cast(cr1.historico1 as varchar(5000)) like ''%' + edDesc.Text + '%''';

  if edCodRepresentante.Text <> '' then
    cmd := cmd + fmfun.cmdAux('cr1.COD_REPRESENTANTE', edCodRepresentante.Text);

  if edFornecedor.Text <> '' then
    cmd := cmd + fmfun.cmdAux('cr1.cod_fornecedor', edFornecedor.Text);

  if edfop.Text <> '' then
    cmd := cmd + fmfun.cmdAux('cr1.cod_fop', edfop.Text);

  if edPlanoContas.Text <> '' then
    cmd := cmd + fmfun.cmdAux('cr1.ID_PLANO_CONTAS', edPlanoContas.Text);

  if trim(Prempresa.Text) <> '' then
    cmd := cmd + ' and cr1.cod_empresa = ' + quotedstr(Prempresa.Text);

  if Prfinalizado.Checked then
    cmd := cmd + ' and dtapag is not null '
  else if Praberto.Checked then
    cmd := cmd + ' and dtapag is null';

  if Prfinalizado.Checked then
    cmd := cmd + ' and cr1.dtapag between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date))
  else
    cmd := cmd + ' and cr1.dtaven between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date));

  cmd := cmd + ' order by dtaven, , titulo, nom_empresa';

  with dm.q_contas_pagar do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;
  fR_RELATORIO.ShowReport;
end;

procedure TFr_opc_relatorios.relatorio_movimentacao_produto;
var
  cmd: string;
begin
  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\posicao_estoque_detalhado2.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;

  cmd := 'SELECT a.COD_PRODUTO, a.NOM_PRODUTO, a.CONT_ESTOQUE_AGO_2010, a.QTD_ESTOQUE, a.qtd_reservado, a.CODIGO_CLIENTE_FORNECEDOR, a.NOME_CLIENTE_FORNECEDOR, a.NUMDOC, a.DATA, a.NOTA_FISCAL, a.QTD, a.CONT, a.TIPO ' + 'FROM V_CHECAGEM_ESTOQUE a inner join produto p on p.cod_produto = a.cod_produto WHERE 1 = 1 ';

  if edProduto.Text <> '' then
  begin
    cmd := cmd + fmfun.cmdAux('A.cod_produto', edProduto.Text);
  end;

  if edGrupo.Text <> '' then
  begin
    cmd := cmd + fmfun.cmdAux('p.cod_grupo', edGrupo.Text);
  end;

  if edCliente.Text <> '' then
  begin
    cmd := cmd + fmfun.cmdAux('a.CODIGO_CLIENTE_FORNECEDOR', edCliente.Text);
  end;

  if rbRevenda.Checked then
    cmd := cmd + ' and p.revenda = ''S''';

  if rbOutros.Checked then
    cmd := cmd + ' and p.revenda = ''N''';

  if rbAtivo.Checked then
    cmd := cmd + 'and p.status <> ' + quotedstr('S');

  if rbInativo.Checked then
    cmd := cmd + 'and p.status = ' + quotedstr('S');

  if rbPromocao.Checked then
    cmd := cmd + ' and p.promocao = ''S''';

  if rbIndisponivel.Checked then
    cmd := cmd + ' and p.indisponivel = ''S''';

  if rbDisponivel.Checked then
    cmd := cmd + ' and p.indisponivel = ''N''';

  if PrMostrarProdutosAbaixoEstoqueMinimo.Checked then
    cmd := cmd + ' and p.QTD_ESTOQUE < p.ESTOQUE_MINIMO ';

  if rbAcerto.Checked then
    cmd := cmd + ' and a.TIPO LIKE ''ACERTO%''';

  if rbEntrada.Checked then
    cmd := cmd + ' and a.TIPO = ''ENTRADA (+)''';

  if rbReservado.Checked then
    cmd := cmd + ' and a.TIPO = ''RESERVADO (-)''';

  if rbFaturado.Checked then
    cmd := cmd + ' and a.TIPO = ''SAÍDA (-)''';

  if (Prdta_inicial.date > 0) and (Prdta_final.date > 0) then
    cmd := cmd + ' and a.DATA between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date));

  if edFornecedor.Text <> '' then
    cmd := cmd + ' and (1 = 1 ' + fmfun.cmdAux('p.fornecedor_principal', edFornecedor.Text) + ' or 0 < (SELECT count(*) FROM PRODUTO_FORNECEDOR pf where pf.cod_produto = p.cod_produto ' + fmfun.cmdAux('pf.cod_fornecedor', edFornecedor.Text) + '))';

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

procedure TFr_opc_relatorios.relatorio_produto_vendas;
var
  cmd, cmd_media: string;
begin
  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\produtos_vendas.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;

  if ((Prdta_inicial.date > 0) and (Prdta_final.date > 0)) then
    cmd_media := '   (select count(*) from (select distinct c.MES from CALENDARIO c where c.DATA between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date)) + ') q1 ) AS MEDIA_MENSAL '
  else
    cmd_media := '   (select count(*) from (select distinct c.MES from CALENDARIO c where c.DATA between current_date-365 and current_date) q1 ) AS MEDIA_MENSAL ';

  cmd := ' SELECT V2.COD_PRODUTO, PR.NOM_PRODUTO, v1.numdoc, V1.DTA_EMISSAO, v1.nfe, CL.COD_CLIENTE, CL.NOM_CLIENTE, v1.DTADOC, v1.DTA_EMISSAO, v2.QTD, v2.PRECO, v2.SUB_TOTAL, ' + cmd_media +
         ' FROM VENDAS2 v2 ' +
         ' INNER JOIN PRODUTO PR ON PR.COD_PRODUTO = V2.COD_PRODUTO  ' +
         ' INNER JOIN VENDAS1 V1 ON V1.NUMDOC = V2.NUMDOC ' +
         ' INNER JOIN CLIENTE CL ON CL.COD_CLIENTE = V1.COD_CLIENTE ' +
         'inner join cidades cd on (cl.cod_cidade = cd.cod_cidade) ' +
         ' WHERE v1.faturado in (1,3) '+
         '   AND (v1.COD_FISCAL not in (''6152'', ''6409'') OR V1.COD_FISCAL IS NULL) AND V1.NFEENTRADASAIDA = ''0'' '+
         '   AND V1.PROCESSO_ID NOT IN (SELECT PROCESSO_ID FROM VENDAS1 WHERE FATURADO <> 2 AND NFEENTRADASAIDA = ''1'') and (v1.NFE_DEV is null OR v1.STATUS_NFE_DEV = 135)  ' +
         '   AND v1.consignacao <> 1 ' +
         '   AND v1.cod_fop not in (7, 9, 22, 23, 24, 26, 32, 46, 47, 51, 52, 53, 54, 57, 58)  ';

  if edProduto.Text <> '' then
  begin
    cmd := cmd + fmfun.cmdAux('pr.cod_produto', edProduto.Text);
  end;

  if edGrupo.Text <> '' then
  begin
    cmd := cmd + fmfun.cmdAux('PR.cod_grupo', edGrupo.Text);
  end;

  if edCliente.Text <> '' then
  begin
    cmd := cmd + fmfun.cmdAux('cl.cod_cliente', edCliente.Text);
  end;

  if edMesoRegiao.Text <> '' then
    cmd := cmd + ' and cl.cod_cidade in (SELECT CD.COD_CIDADE FROM CIDADES CD WHERE 1 = 1 ' + fmfun.cmdAux('CD.MESOCOD', edMesoRegiao.Text) + ')';

  if edMicroRegiao.Text <> '' then
    cmd := cmd + ' and cl.cod_cidade in (SELECT CD.COD_CIDADE FROM CIDADES CD WHERE 1 = 1 ' + fmfun.cmdAux('CD.MICROCOD', edMicroRegiao.Text) + ')';

  if edCidade.Text <> '' then
    cmd := cmd + fmfun.cmdAux('cl.cod_cidade', edCidade.Text);

  if pruf.Text <> '' then
    cmd := cmd + 'and cd.UF = ' + QuotedStr(pruf.Text);

  if rbRevenda.Checked then
    cmd := cmd + ' and pr.revenda = ''S''';

  if rbOutros.Checked then
    cmd := cmd + ' and pr.revenda = ''N''';

  if rbAtivo.Checked then
    cmd := cmd + 'and pr.status <> ' + quotedstr('S');

  if rbInativo.Checked then
    cmd := cmd + 'and pr.status = ' + quotedstr('S');

  if rbPromocao.Checked then
    cmd := cmd + ' and pr.promocao = ''S''';

  if rbIndisponivel.Checked then
    cmd := cmd + ' and pr.indisponivel = ''S''';

  if rbDisponivel.Checked then
    cmd := cmd + ' and pr.indisponivel = ''N''';

  if PrMostrarProdutosAbaixoEstoqueMinimo.Checked then
    cmd := cmd + ' and pr.QTD_ESTOQUE < pr.ESTOQUE_MINIMO ';

  if (Prdta_inicial.date > 0) and (Prdta_final.date > 0) then
    cmd := cmd + ' and V1.DTA_EMISSAO between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date));

  if edFornecedor.Text <> '' then
    cmd := cmd + '(1=1 and ' + fmfun.cmdAux('pr.fornecedor_principal', edFornecedor.Text) + ' or 0 < (SELECT count(*) FROM PRODUTO_FORNECEDOR pf where pf.cod_produto = pr.cod_produto ' + fmfun.cmdAux('pf.cod_fornecedor', edFornecedor.Text) + '))';

  cmd := cmd + ' order by pr.COD_PRODUTO, V1.DTA_EMISSAO, v1.numdoc';

  with dm.q_produto_vendas do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;
  fR_RELATORIO.ShowReport;
end;

procedure TFr_opc_relatorios.relatorio_cliente_produto;
var
  cmd, cmd_media: string;
begin
  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\clientes_produtos.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;

  if ((Prdta_inicial.date > 0) and (Prdta_final.date > 0)) then
    cmd_media := '   (select count(*) from (select distinct c.MES from CALENDARIO c where c.DATA between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date)) + ') q1 ) AS MEDIA_MENSAL '
  else
    cmd_media := '   (select count(*) from (select distinct c.MES from CALENDARIO c where c.DATA between current_date-365 and current_date)) q1 ) AS MEDIA_MENSAL ';

  cmd := ' SELECT V2.COD_PRODUTO, PR.NOM_PRODUTO, v1.numdoc, V1.DTADOC, v1.nfe, CL.COD_CLIENTE, CL.NOM_CLIENTE, v1.DTA_EMISSAO, v2.QTD, v2.PRECO, v2.SUB_TOTAL, ' + cmd_media +
         ' FROM VENDAS2 v2 ' +
         ' INNER JOIN PRODUTO PR ON PR.COD_PRODUTO = V2.COD_PRODUTO  ' +
         ' INNER JOIN VENDAS1 V1 ON V1.NUMDOC = V2.NUMDOC ' +
         ' INNER JOIN CLIENTE CL ON CL.COD_CLIENTE = V1.COD_CLIENTE ' +
         ' INNER JOIN CIDADES CD ON CD.COD_CIDADE = CL.COD_CIDADE ' +
         ' INNER JOIN CADMICRO MI ON MI.MICROCOD = CD.MICROCOD ' +
         ' INNER JOIN CADMESO  ME ON ME.MESOCOD  = MI.MESOCOD ' +
         ' WHERE v1.faturado in (1,3) and V1.NFEENTRADASAIDA = ''0'' AND V1.PROCESSO_ID NOT IN (SELECT PROCESSO_ID FROM VENDAS1 WHERE FATURADO <> 2 AND NFEENTRADASAIDA = ''1'') '+
         '   AND v1.nfe_dev is null and v1.cod_fop not in (7, 9, 22, 23, 24, 26, 32, 46, 47, 51, 52, 53, 54, 57, 58)  ';

  if edProduto.Text <> '' then
  begin
    cmd := cmd + fmfun.cmdAux('pr.cod_produto', edProduto.Text);
  end;

  if edGrupo.Text <> '' then
  begin
    cmd := cmd + fmfun.cmdAux('PR.cod_grupo', edGrupo.Text);
  end;

  if edCliente.Text <> '' then
  begin
    cmd := cmd + fmfun.cmdAux('cl.cod_cliente', edCliente.Text);
  end;

  if edcodsupervisor.Text <> '' then
  begin
    cmd := cmd + fmfun.cmdAux('v1.cod_supervisor', edcodsupervisor.Text);
  end;

  if edCidade.Text <> '' then
  begin
    cmd := cmd + fmfun.cmdAux('cl.cod_cidade', edCidade.Text);
  end;

  if edMicroRegiao.Text <> '' then
  begin
    cmd := cmd + fmfun.cmdAux('MI.MICROCOD', edMicroRegiao.Text);
  end;

  if edMesoRegiao.Text <> '' then
  begin
    cmd := cmd + fmfun.cmdAux('ME.MESOCOD', edMesoRegiao.Text);
  end;

  if edCodRepresentante.Text <> '' then
  begin
    cmd := cmd + fmfun.cmdAux('CL.ID_REPRESENTANTE', edCodRepresentante.Text);
  end;

  if rbRevenda.Checked then
    cmd := cmd + ' and pr.revenda = ''S''';

  if rbOutros.Checked then
    cmd := cmd + ' and pr.revenda = ''N''';

  if rbAtivo.Checked then
    cmd := cmd + 'and pr.status <> ' + quotedstr('S');

  if rbInativo.Checked then
    cmd := cmd + 'and pr.status = ' + quotedstr('S');

  if rbPromocao.Checked then
    cmd := cmd + ' and pr.promocao = ''S''';

  if rbIndisponivel.Checked then
    cmd := cmd + ' and pr.indisponivel = ''S''';

  if rbDisponivel.Checked then
    cmd := cmd + ' and pr.indisponivel = ''N''';

  if PrMostrarProdutosAbaixoEstoqueMinimo.Checked then
    cmd := cmd + ' and pr.QTD_ESTOQUE < pr.ESTOQUE_MINIMO ';

  if (Prdta_inicial.date > 0) and (Prdta_final.date > 0) then
    cmd := cmd + ' and V1.DTADOC between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date));

  if edFornecedor.Text <> '' then
    cmd := cmd + '(1=1 and ' + fmfun.cmdAux('pr.fornecedor_principal', edFornecedor.Text) + ' or 0 < (SELECT count(*) FROM PRODUTO_FORNECEDOR pf where pf.cod_produto = pr.cod_produto ' + fmfun.cmdAux('pf.cod_fornecedor', edFornecedor.Text) + '))';

  cmd := cmd + ' order by CL.NOM_CLIENTE, pr.COD_PRODUTO, V1.DTADOC, v1.numdoc';

  with dm.q_produto_vendas do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;
  fR_RELATORIO.ShowReport;
end;

procedure TFr_opc_relatorios.ProdutoVendedor;
begin
  if FRPRI.TipUsu = '0' then
  begin
    rbAtivo.Checked := true;
    rbInativo.Checked := false;
    rbAtivoTodos.Checked := false;
    rbPromocao.Checked := false;
    rbDisponivel.Checked := false;
    rbIndisponivel.Checked := false;
    rgAtivo.Enabled := false;
  end;
end;

procedure TFr_opc_relatorios.FormShow(Sender: TObject);
var
  mes, ano, x : Integer;

begin
  // dao.Geral1('select ema_login, ema_senha, ema_email, ema_nom_apresentacao, ema_smtp, ema_autenticacao from empresa where cod_empresa='+QuotedStr(cod_empresa));
  // fr_relatorio.FromName:= dao.Q1.fieldbyname('ema_nom_apresentacao').AsString;
  // := dao.Q1.fieldbyname('ema_nom_apresentacao').AsString;
  // frmail.FromMail:= '';//dao.Q1.fieldbyname('ema_email').AsString;
  // frmail.SmtpHost:= dao.Q1.fieldbyname('ema_smtp').AsString;;
  // frmail.Password:= dao.Q1.fieldbyname('ema_senha').AsString;
  // Fr_opc_relatorios.Height:= 607;
  Alfabeticamente.Checked := true;
  if (tipo_relatorio = 'Extrato') or (tipo_relatorio = 'Plano Contas') then
    pn_pedido.Visible := false;

  Gbdata.Visible := false;
  loja.Visible := false;
  cliente.Visible := false;
  gbConta.Visible := false;
  produto.Visible := false;
  gbTipoProduto.Visible := false;
  fornecedor.Visible := false;
  codigo_fiscal.Visible := false;
  grupo.Visible := false;
  marca.Visible := false;
  uf.Visible := false;
  transportadora.Visible := false;
  cidade.Visible := false;
  pn_mesoregiao.Visible := false;
  pn_microregiao.Visible := false;
  p1.Visible := false;
  p2.Visible := false;
  gbSupervisao.Visible := false;
  OrdenarRanking.Visible := false;

  ordenar1.Visible := false;
  ordenar2.Visible := false;
  gbContasTipo.Visible := false;
  ordenar1.Visible := false;
  fop.Visible := false;
  vendedor.Visible := false;
  supervisor.Visible := false;

  GBdata_aniver.Visible := false;
  gbPlanoConta.Visible := false;
  pn_pedido.Visible := false;
  rgTipoRep.Visible := false;
  // listagens Produtos, Clientes e etc
  Fr_opc_relatorios.Height := 700;
  if tipo_relatorio = 'relatorio_aniversariantes' then
  begin
    GBdata_aniver.Visible := true;
    Fr_opc_relatorios.Height := 245;
  end;
  if tipo_relatorio = 'lista_func_cc' then
  begin
    gbPlanoConta.Visible := false;
    pn_pedido.Visible := false;
    rgTipoRep.Visible := true;
    vendedor.Visible := true;
    supervisor.Visible := false;
    Pa_botoes.Visible := true;
    pnDesc.Visible := false;
  end;
  if tipo_relatorio = 'relatorio_representante' then
  begin
    vendedor.Visible := true;
    supervisor.Visible := false;
    gbPlanoConta.Visible := false;
    pn_pedido.Visible := false;
  end;
  if tipo_relatorio = 'relatorio_transportadora' then
  begin
    transportadora.Visible := true;
    pn_pedido.Visible := false;
  end;
  if tipo_relatorio = 'Fornecedor' then
  begin
    fornecedor.Visible := true;
    uf.Visible := true;
    cidade.Visible := true;
    pn_mesoregiao.Visible := true;
    pn_microregiao.Visible := true;
  end;
  if tipo_relatorio = 'relatorio_cliente_completo' then
  begin
    gbPlanoConta.Visible := false;
    rgClienteBloqueado.Visible := true;
    loja.Visible := true;
    uf.Visible := true;
    cidade.Visible := true;
    cliente.Visible := true;
    pn_mesoregiao.Visible := true;
    pn_microregiao.Visible := true;
    gbUltimaCompra.Visible := true;
    ordernarempresas.Visible := true;
    vendedor.Visible := true;
    supervisor.Visible := true;
    gbCSV.Visible := true;
    Fr_opc_relatorios.Height := 700;
    if Tipo_usuario = '4' then
    begin
      prcod_supervisor.Text := Representante_usuario;
      edcodsupervisor.Text := Representante_usuario;
      prcod_supervisorExit(Self);
      supervisor.Enabled := false;
    end;
    if Tipo_usuario = '0' then
    begin
      Prcod_representante.Text := Representante_usuario;
      edCodRepresentante.Text := Representante_usuario;
      Prcod_representanteExit(Self);
      vendedor.Enabled := false;
    end;
  end
  else if tipo_relatorio = 'televendas_cidade' then
  begin
    uf.Visible := true;
    cidade.Visible := true;
    pn_mesoregiao.Visible := true;
    pn_microregiao.Visible := true;
    supervisor.Visible := true;
    if Tipo_usuario = '4' then
    begin
      prcod_supervisor.Text := Representante_usuario;
      edcodsupervisor.Text := Representante_usuario;
      prcod_supervisorExit(Self);
      supervisor.Enabled := false;
    end;
  end
  else if (tipo_relatorio = 'produto_ncm_st') or (tipo_relatorio = 'produto_ncm_st_completo') then
  begin
    Gbdata.Visible := false;
    produto.Visible := true;
    ProdutoVendedor;

    gbTipoProduto.Visible := true;
    grupo.Visible := true;
    fornecedor.Visible := true;
    ordenar2.Visible := true;
    Fr_opc_relatorios.Height := 480;
    rgAtivo.Visible := true;
    uf_origem_destino.Visible := true;
  end
  else if tipo_relatorio = 'produto_ncm' then
  begin
    Gbdata.Visible := false;
    produto.Visible := true;
    ProdutoVendedor;

    gbTipoProduto.Visible := true;
    grupo.Visible := true;
    fornecedor.Visible := true;
    ordenar2.Visible := true;
    Fr_opc_relatorios.Height := 480;
    rgAtivo.Visible := true;
    uf_origem_destino.Visible := true;
  end
  else if tipo_relatorio = 'produto_desconto_especial' then
  begin
    Gbdata.Visible := false;
    produto.Visible := true;
    ProdutoVendedor;

    gbTipoProduto.Visible := true;
    pnDesc.Visible := false;
    grupo.Visible := true;
    vendedor.Visible := true;
    supervisor.Visible := false;
    fornecedor.Visible := false;
    ordenar2.Visible := true;
    Fr_opc_relatorios.Height := 480;
    rgAtivo.Visible := true;
  end
  else if tipo_relatorio = 'produto_calculo_preco_venda' then
  begin
    Pa_botoes.Visible := true;
    ordenar2.Visible := true;
    produto.Visible := true;
    ProdutoVendedor;

    gbTipoProduto.Visible := true;
    fornecedor.Visible := true;
    grupo.Visible := true;
    subcategoria.Visible := true;
    categoria.Visible := true;
    Fr_opc_relatorios.Height := 480;
    pn_pedido.Visible := false;
    pnDesc.Visible := true;
    rgAtivo.Visible := true;
  end
  else if (tipo_relatorio = 'pauta_venda') or (tipo_relatorio = 'produtos_codigo_barra') then
  begin
    Gbdata.Visible := false;
    uf_origem_destino.Visible := true;
    grupo.Visible := true;
    produto.Visible := true;
    ProdutoVendedor;

    gbTipoProduto.Visible := true;
    fornecedor.Visible := true;
    ordenar2.Visible := true;
    Fr_opc_relatorios.Height := 480;
    rgAtivo.Visible := true;
  end
  else if (tipo_relatorio = 'pauta_venda_categoria') then
  begin
    Gbdata.Visible := false;
    produto.Visible := true;
    ProdutoVendedor;
    uf_origem_destino.Visible := true;
    gbTipoProduto.Visible := true;
    subcategoria.Visible := true;
    categoria.Visible := true;
    fornecedor.Visible := true;
    ordenar2.Visible := true;
    Fr_opc_relatorios.Height := 480;
    rgAtivo.Visible := true;
  end
  else if (tipo_relatorio = 'produtos_catalogo') then
  begin
    Gbdata.Visible := false;
    grupo.Visible := false;
    produto.Visible := false;
    gbTipoProduto.Visible := false;
    produto.Visible := true;
    fornecedor.Visible := false;
    ordenar2.Visible := false;
    Fr_opc_relatorios.Height := 300;
    categoria.Visible := true;
    marca.Visible := true;
    subcategoria.Visible := true;
  end
  else if (tipo_relatorio = 'produtos_capa_6') then
  begin
    Gbdata.Visible := false;
    grupo.Visible := false;
    produto.Visible := false;
    gbTipoProduto.Visible := false;
    produto.Visible := true;
    fornecedor.Visible := false;
    cliente.Visible := true;
    ordenar2.Visible := false;
    Fr_opc_relatorios.Height := 300;
    categoria.Visible := true;
    marca.Visible := true;
    subcategoria.Visible := true;
    ckRepetirFolha.Visible := True;
  end
  else if (tipo_relatorio = 'produtos_capa_11') then
  begin
    Gbdata.Visible := false;
    grupo.Visible := false;
    produto.Visible := false;
    gbTipoProduto.Visible := false;
    produto.Visible := true;
    fornecedor.Visible := false;
    cliente.Visible := true;
    ordenar2.Visible := false;
    Fr_opc_relatorios.Height := 300;
    categoria.Visible := true;
    marca.Visible := true;
    subcategoria.Visible := true;
  end
  else if (tipo_relatorio = 'produtos_capa_20_5') then
  begin
    Gbdata.Visible := false;
    grupo.Visible := false;
    produto.Visible := false;
    gbTipoProduto.Visible := false;
    produto.Visible := true;
    fornecedor.Visible := false;
    cliente.Visible := true;
    ordenar2.Visible := false;
    Fr_opc_relatorios.Height := 300;
    categoria.Visible := true;
    marca.Visible := true;
    subcategoria.Visible := true;
  end
  else if (tipo_relatorio = 'produtos_capa_24_6') then
  begin
    Gbdata.Visible := false;
    grupo.Visible := false;
    produto.Visible := false;
    gbTipoProduto.Visible := false;
    produto.Visible := true;
    fornecedor.Visible := false;
    cliente.Visible := true;
    ordenar2.Visible := false;
    Fr_opc_relatorios.Height := 300;
    categoria.Visible := true;
    marca.Visible := true;
    subcategoria.Visible := true;
  end
  else if tipo_relatorio = 'pauta_vendas_est' then
  begin
    Gbdata.Visible := false;
    grupo.Visible := true;
    fornecedor.Visible := true;
    ordenar2.Visible := true;
    Fr_opc_relatorios.Height := 480;
    rgAtivo.Visible := true;
  end
  else if tipo_relatorio = 'cobrança' then
  begin
    Gbdata.Visible := true;
    Gbdata.TabOrder := 0;
    grTipoData.Visible := false;
    cliente.Visible := true;
    vendedor.Visible := false;
    supervisor.Visible := false;
    gbContasTipo.Visible := true;
    gbConta.Visible := true;
  end
  else if tipo_relatorio = 'ranking_produtos' then
  begin
    pnBairro.Visible := true;
    grTipoData.Visible := true;
    Gbdata.Visible := true;
    loja.Visible := true;
    fornecedor.Visible := true;
    vendedor.Visible := true;
    supervisor.Visible := true;
    cidade.Visible := true;
    pn_mesoregiao.Visible := true;
    pn_microregiao.Visible := true;
    cliente.Visible := true;
    grupo.Visible := true;
    marca.Visible := true;
    p2.Visible := true;
    gbSupervisao.Visible := true;
    pn_pedido.Visible := true;
    fop.Visible := true;
    uf.Visible := true;
    rgOrdemQtdeValor.Visible := True;
    if telemarketing then
    begin
      prcod_supervisor.Text := Representante_usuario;
      edcodsupervisor.Text := Representante_usuario;
      prcod_supervisorExit(Self);
      supervisor.Enabled := false;
    end;
    if Tipo_usuario = '0' then
    begin
      Prcod_representante.Text := Representante_usuario;
      edCodRepresentante.Text := Representante_usuario;
      Prcod_representanteExit(Self);
      vendedor.Enabled := false;
    end;

    if Tipo_usuario = '9' then
    begin
      gbConsumidorFinal.Visible := True;
    end
    else begin
      gbConsumidorFinal.Visible:= False;
      rbNaoConsumidorFinal.Checked := True;
    end;

    Fr_opc_relatorios.Height := 750;
  end
  else if tipo_relatorio = 'contas_receber' then
  begin
    Fr_opc_relatorios.Height := 600;
    pn_mesoregiao.Visible := true;
    pn_microregiao.Visible := true;
    cidade.Visible := true;
    gbConta.Visible := true;
    gbPlanoConta.Visible := true;
    pnDesc.Visible := true;
    grTipoData.Visible := false;
    Gbdata.Visible := true;
    Gbdata.TabOrder := 0;
    loja.Visible := true;
    cliente.Visible := true;
    vendedor.Visible := true;
    supervisor.Visible := false;
    fop.Visible := true;
    gbContasTipo.Visible := true;
  end
  else if tipo_relatorio = 'relatorio_estoque_simples' then
  begin
    p1.Visible := true;
    fornecedor.Visible := true;
    grupo.Visible := true;
    rgAtivo.Visible := true;
    produto.Visible := true;
    ordenar2.visible := true;
    ProdutoVendedor;
    gbTipoProduto.Visible := true;
  end
  else if tipo_relatorio = 'contas_pagar' then
  begin
    Fr_opc_relatorios.Height := 600;
    vendedor.Visible := true;
    gbPlanoConta.Visible := true;
    pnDesc.Visible := true;
    grTipoData.Visible := false;
    Gbdata.Visible := true;
    Gbdata.TabOrder := 0;
    loja.Visible := true;
    fornecedor.Visible := true;
    fop.Visible := true;
    gbContasTipo.Visible := true;
  end
  else if tipo_relatorio = 'relatorio_movimentacao_produto' then
  begin
    Fr_opc_relatorios.Height := 600;
    grTipoData.Visible := false;
    Gbdata.Visible := true;
    produto.Visible := true;
    fornecedor.Visible := true;
    grupo.Visible := true;
    cliente.Visible := true;

    ProdutoVendedor;

    gbTipoProduto.Visible := true;
    movimentacao.Visible := true;
    rgAtivo.Visible := true;
    p1.Visible := true;
  end
  else if tipo_relatorio = 'produtos_vendas' then
  begin
    grTipoData.Visible := false;
    Gbdata.Visible := true;
    produto.Visible := true;
    fornecedor.Visible := true;
    grupo.Visible := true;
    cliente.Visible := true;
    ProdutoVendedor;
    pn_mesoregiao.Visible := true;
    pn_microregiao.Visible := true;
    cidade.Visible := true;
    uf.Visible := true;
    gbTipoProduto.Visible := true;
    rgAtivo.Visible := true;
    p1.Visible := true;

    Self.height := 600;
  end
  else if tipo_relatorio = 'clientes_produtos' then
  begin
    grTipoData.Visible := false;
    Gbdata.Visible := true;
    produto.Visible := true;

    cidade.Visible := true;
    pn_microregiao.Visible := true;
    pn_mesoregiao.Visible := true;
    vendedor.Visible := true;
    pnComissao.Visible := true;
    fornecedor.Visible := true;
    grupo.Visible := true;
    cliente.Visible := true;
    supervisor.Visible := true;
    ProdutoVendedor;

    gbTipoProduto.Visible := true;
    rgAtivo.Visible := true;
    p1.Visible := true;
    Fr_opc_relatorios.Height := 600;
  end
  else if tipo_relatorio = 'relatorio_estoque_inventario' then
  begin
    p1.Visible := true;
    fornecedor.Visible := true;
    grupo.Visible := true;
    produto.Visible := true;
    rgAtivo.Visible := true;
    ProdutoVendedor;
    gbTipoProduto.Visible := true;
    Fr_opc_relatorios.Height := 300;
  end
  else if tipo_relatorio = 'relatorio_estoque_custo' then
  begin
    p1.Visible := true;
    fornecedor.Visible := true;
    grupo.Visible := true;
    produto.Visible := true;
    ProdutoVendedor;
    gbTipoProduto.Visible := true;
    rgAtivo.Visible := true;
    Fr_opc_relatorios.Height := 300;
  end
  else if tipo_relatorio = 'relatorio_estoque_completo' then
  begin
    p1.Visible := true;
    fornecedor.Visible := true;
    grupo.Visible := true;
    loja.Visible := true;
    produto.Visible := true;
    ProdutoVendedor;

    gbTipoProduto.Visible := true;
    rgAtivo.Visible := true;
  end
  else if tipo_relatorio = 'relatorio_cliente' then
  begin
    gbUltimaCompra.Visible := true;
    cliente.Visible := true;
    grupo.Visible := true;
    categoria.Visible := true;
    subcategoria.Visible := true;
    produto.Visible := true;
    rgClienteBloqueado.Visible := true;
    ordernarempresas.Visible := true;
    Gbdata.Visible := false;
    gbPlanoConta.Visible := false;
    loja.Visible := true;
    uf.Visible := true;
    cidade.Visible := true;
    pn_mesoregiao.Visible := true;
    pn_microregiao.Visible := true;
    vendedor.Visible := true;
    supervisor.Visible := true;

    if Tipo_usuario = '4' then
    begin
      prcod_supervisor.Text := Representante_usuario;
      edcodsupervisor.Text := Representante_usuario;
      prcod_supervisorExit(Self);
      supervisor.Enabled := false;
    end;
    if Tipo_usuario = '0' then
    begin
      Prcod_representante.Text := Representante_usuario;
      edCodRepresentante.Text := Representante_usuario;
      Prcod_representanteExit(Self);
      vendedor.Enabled := false;
    end;
  end
  // relatorios de Vendas Lojas
  else if tipo_relatorio = 'vendas_periodo_cliente' then
  begin
    grTipoData.Visible := false;
    Gbdata.Visible := true;
    p2.Visible := true;
    gbSupervisao.Visible := true;
    Fr_opc_relatorios.Height := 540;
    loja.Visible := true;
    cliente.Visible := true;
    if Tipo_usuario = '9' then
      gbConsumidorFinal.Visible:= True
    else begin
      gbConsumidorFinal.Visible:= False;
      rbNaoConsumidorFinal.Checked := True;
    end;
  end
  else if tipo_relatorio = 'vendas_periodo_data' then
  begin
    grTipoData.Visible := false;
    Gbdata.Visible := true;
    cliente.Visible := true;
    loja.Visible := true;
    Fr_opc_relatorios.Height := 500;
  end
  else if tipo_relatorio = 'vendas_periodo_vendedor' then
  begin
    grTipoData.Visible := false;
    Gbdata.Visible := true;
    Gbdata.TabOrder := 0;
    // loja.visible := true;
    vendedor.Visible := true;
    supervisor.Visible := true;
    cliente.Visible := true;
    grupo.Visible := true;
    // marca.Visible := True;
    produto.Visible := true;
    ProdutoVendedor;
    gbTipoProduto.Visible := true;

    if Tipo_usuario = '9' then
      gbConsumidorFinal.Visible:= True
    else begin
      gbConsumidorFinal.Visible:= False;
      rbNaoConsumidorFinal.Checked := True;
    end;

    if area_atuacao <> '0' then
    begin
      p2.TabOrder := 10;
      p2.Visible := true;
      gbSupervisao.Visible := true;
    end;
  end
  else if tipo_relatorio = 'televendas' then
  begin
    grTipoData.Visible := true;
    Gbdata.Visible := true;
    loja.Visible := true;
    fornecedor.Visible := true;
    vendedor.Visible := true;
    supervisor.Visible := true;
    cidade.Visible := true;
    pn_mesoregiao.Visible := true;
    pn_microregiao.Visible := true;
    cliente.Visible := true;
    grupo.Visible := true;
    marca.Visible := true;
    p2.Visible := true;
    gbSupervisao.Visible := true;
    pn_pedido.Visible := true;
    fop.Visible := true;
    uf.Visible := true;

    if Tipo_usuario = '9' then
      gbConsumidorFinal.Visible:= True
    else begin
      gbConsumidorFinal.Visible:= False;
      rbNaoConsumidorFinal.Checked := True;
    end;

    Fr_opc_relatorios.Height := 700;
    if telemarketing then
    begin
      prcod_supervisor.Text := Representante_usuario;
      edcodsupervisor.Text := Representante_usuario;
      prcod_supervisorExit(Self);
      supervisor.Enabled := false;
    end;
  end
  else if tipo_relatorio = 'vendas_padrao' then
  begin
    pnBairro.Visible := true;
    grTipoData.Visible := true;
    Gbdata.Visible := true;
    loja.Visible := true;
    fornecedor.Visible := true;
    vendedor.Visible := true;
    supervisor.Visible := true;
    cidade.Visible := true;
    pn_mesoregiao.Visible := true;
    pn_microregiao.Visible := true;
    cliente.Visible := true;
    grupo.Visible := true;
    marca.Visible := true;
    p2.Visible := true;
    gbSupervisao.Visible := true;

    if Tipo_usuario = '9' then
      gbConsumidorFinal.Visible:= True
    else begin
      gbConsumidorFinal.Visible:= False;
      rbNaoConsumidorFinal.Checked := True;
    end;

    pn_pedido.Visible := true;
    fop.Visible := true;
    uf.Visible := true;
    if telemarketing then
    begin
      prcod_supervisor.Text := Representante_usuario;
      edcodsupervisor.Text := Representante_usuario;
      prcod_supervisorExit(Self);
      supervisor.Enabled := false;
    end;
    if Tipo_usuario = '0' then
    begin
      Prcod_representante.Text := Representante_usuario;
      edCodRepresentante.Text := Representante_usuario;
      Prcod_representanteExit(Self);
      vendedor.Enabled := false;
    end;

    if Tipo_usuario = '9' then
    begin
      gbConsumidorFinal.Visible:= True;
    end
    else begin
      gbConsumidorFinal.Visible:= False;
      rbNaoConsumidorFinal.Checked := True;
    end;

    Fr_opc_relatorios.Height := 700;
  end
  else if tipo_relatorio = 'vendas_geral' then
  begin
    grTipoData.Visible := true;
    Gbdata.Visible := true;
    loja.Visible := true;
    fornecedor.Visible := true;
    vendedor.Visible := true;
    supervisor.Visible := true;
    cidade.Visible := true;
    pn_mesoregiao.Visible := true;
    pn_microregiao.Visible := true;
    cliente.Visible := true;
    grupo.Visible := true;
    marca.Visible := true;
    p2.Visible := true;
    gbSupervisao.Visible := true;

    if Tipo_usuario = '9' then
      gbConsumidorFinal.Visible:= True
    else begin
      gbConsumidorFinal.Visible:= False;
      rbNaoConsumidorFinal.Checked := True;
    end;

    pn_pedido.Visible := true;
    fop.Visible := true;
    uf.Visible := true;
    produto.Visible := true;
    Fr_opc_relatorios.Height := 750;
    if telemarketing then
    begin
      prcod_supervisor.Text := Representante_usuario;
      edcodsupervisor.Text := Representante_usuario;
      prcod_supervisorExit(Self);
      supervisor.Enabled := false;
    end;

    if Tipo_usuario = '9' then
    begin
      gbConsumidorFinal.Visible:= True;
    end
    else begin
      gbConsumidorFinal.Visible:= False;
      rbNaoConsumidorFinal.Checked := True;
    end;

  end
  else if tipo_relatorio = 'metas_diarias' then
  begin
    grTipoData.Visible := false;
    p2.Visible := false;
    Gbdata.Visible := true;
    // loja.visible:=true;
    vendedor.Visible := true;
    supervisor.Visible := true;
    if Tipo_usuario = '0' then
    begin
      Prcod_representante.Text := Representante_usuario;
      edCodRepresentante.Text := Representante_usuario;
      Prcod_representanteExit(Self);
      vendedor.Enabled := false;
    end;
    if telemarketing then
    begin
      prcod_supervisor.Text := Representante_usuario;
      edcodsupervisor.Text := Representante_usuario;
      prcod_supervisorExit(Self);
      supervisor.Enabled := false;
    end;

    // grupo.Visible:= True;
    // marca.Visible:= True;
    gbSupervisao.Visible := true;

    if Tipo_usuario = '9' then
      gbConsumidorFinal.Visible:= True
    else begin
      gbConsumidorFinal.Visible:= False;
      rbNaoConsumidorFinal.Checked := True;
    end;

  end
  else if tipo_relatorio = 'metas_mensais' then
  begin
    vendedor.Visible := true;
    if Tipo_usuario = '0' then
    begin
      Prcod_representante.Text := Representante_usuario;
      edCodRepresentante.Text := Representante_usuario;
      Prcod_representanteExit(Self);
      vendedor.Enabled := false;
    end;
  end
  else if tipo_relatorio = 'supervisao' then
  begin
    grTipoData.Visible := true;
    Gbdata.Visible := true;
    // loja.visible:=true;
    vendedor.Visible := true;
    supervisor.Visible := true;
    cliente.Visible := true;
    pn_pedido.Visible := true;
    if Tipo_usuario = '0' then
    begin
      Prcod_representante.Text := Representante_usuario;
      edCodRepresentante.Text := Representante_usuario;
      Prcod_representanteExit(Self);
      vendedor.Enabled := false;
    end;
    if telemarketing then
    begin
      prcod_supervisor.Text := Representante_usuario;
      edcodsupervisor.Text := Representante_usuario;
      prcod_supervisorExit(Self);
      supervisor.Enabled := false;
    end;

    // grupo.Visible:= True;
    // marca.Visible:= True;
    p2.Visible := true;
    gbSupervisao.Visible := true;

    if Tipo_usuario = '9' then
      gbConsumidorFinal.Visible:= True
    else begin
      gbConsumidorFinal.Visible:= False;
      rbNaoConsumidorFinal.Checked := True;
    end;

  end
  else if tipo_relatorio = 'cr_baixadas' then
  begin

    cliente.Visible := true;
    vendedor.Visible := true;
    pn_pedido.Visible := true;
    Gbdata.Visible := true;

    grTipoData.Visible := false;
    edCodRepresentante.Visible := true;
    sbLimpaRep.Visible := true;
    supervisor.Visible := false;

    gbContasTipo.Visible := false;
    gbTipoProduto.Visible := false;
    p2.Visible := false;
    if Tipo_usuario = '0' then
    begin
      Prcod_representante.Text := Representante_usuario;
      edCodRepresentante.Text := Representante_usuario;
      Prcod_representanteExit(Self);
      vendedor.Enabled := false;
    end;

    { if telemarketing then
      begin
      prcod_supervisor.Text := Representante_usuario;
      edcodsupervisor.Text := Representante_usuario;
      prcod_supervisorExit(Self);
      supervisor.Enabled := false;
      end; }

    gbSupervisao.Visible := false;
    Fr_opc_relatorios.Height := 400;
  end
  else if tipo_relatorio = 'comissoes' then
  begin
    grTipoData.Visible := true;
    Gbdata.Visible := true;
    // loja.visible:=true;
    vendedor.Visible := true;

    edCodRepresentante.Visible := false;
    sbLimpaRep.Visible := false;

    supervisor.Visible := true;
    cliente.Visible := true;
    pn_pedido.Visible := true;
    if Tipo_usuario = '0' then
    begin
      Prcod_representante.Text := Representante_usuario;
      edCodRepresentante.Text := Representante_usuario;
      Prcod_representanteExit(Self);
      vendedor.Enabled := false;
    end;
    if telemarketing then
    begin
      prcod_supervisor.Text := Representante_usuario;
      edcodsupervisor.Text := Representante_usuario;
      prcod_supervisorExit(Self);
      supervisor.Enabled := false;
    end;

    // grupo.Visible:= True;
    // marca.Visible:= True;
    p2.Visible := true;
    gbSupervisao.Visible := true;

    if Tipo_usuario = '9' then
      gbConsumidorFinal.Visible:= True
    else begin
      gbConsumidorFinal.Visible:= False;
      rbNaoConsumidorFinal.Checked := True;
    end;


    Self.Height := 550;
  end
  else if tipo_relatorio = 'comissoes_desconto' then
  begin
    grTipoData.Visible := true;
    Gbdata.Visible := true;
    // loja.visible:=true;
    vendedor.Visible := true;

    edCodRepresentante.Visible := false;
    sbLimpaRep.Visible := false;

    supervisor.Visible := true;
    cliente.Visible := true;
    pn_pedido.Visible := true;
    if Tipo_usuario = '0' then
    begin
      Prcod_representante.Text := Representante_usuario;
      edCodRepresentante.Text := Representante_usuario;
      Prcod_representanteExit(Self);
      vendedor.Enabled := false;
    end;
    if telemarketing then
    begin
      prcod_supervisor.Text := Representante_usuario;
      edcodsupervisor.Text := Representante_usuario;
      prcod_supervisorExit(Self);
      supervisor.Enabled := false;
    end;

    // grupo.Visible:= True;
    // marca.Visible:= True;
    p2.Visible := true;
    gbSupervisao.Visible := true;

    if Tipo_usuario = '9' then
      gbConsumidorFinal.Visible:= True
    else begin
      gbConsumidorFinal.Visible:= False;
      rbNaoConsumidorFinal.Checked := True;
    end;

    Self.Height := 550;
  end
  else if tipo_relatorio = 'teto_faturamento' then
  begin
    grTipoData.Visible := true;
    Gbdata.Visible := true;
    // loja.visible:=true;
    vendedor.Visible := true;

    edCodRepresentante.Visible := false;
    sbLimpaRep.Visible := false;

    supervisor.Visible := true;
    cliente.Visible := true;
    pn_pedido.Visible := true;
    if Tipo_usuario = '0' then
    begin
      Prcod_representante.Text := Representante_usuario;
      edCodRepresentante.Text := Representante_usuario;
      Prcod_representanteExit(Self);
      vendedor.Enabled := false;
    end;
    if telemarketing then
    begin
      prcod_supervisor.Text := Representante_usuario;
      edcodsupervisor.Text := Representante_usuario;
      prcod_supervisorExit(Self);
      supervisor.Enabled := false;
    end;

    // grupo.Visible:= True;
    // marca.Visible:= True;
    p2.Visible := true;
    gbSupervisao.Visible := true;

    if Tipo_usuario = '9' then
      gbConsumidorFinal.Visible:= True
    else begin
      gbConsumidorFinal.Visible:= False;
      rbNaoConsumidorFinal.Checked := True;
    end;
  end
  else if tipo_relatorio = 'ranking_vendas' then
  begin
    Gbdata.Visible := true;
    // loja.visible:=true;
    vendedor.Visible := true;
    edCodRepresentante.Visible := false;
    sbLimpaRep.Visible := false;

    supervisor.Visible := true;
    if Tipo_usuario = '0' then
    begin
      Prcod_representante.Text := Representante_usuario;
      edCodRepresentante.Text := Representante_usuario;
      Prcod_representanteExit(Self);
      vendedor.Enabled := false;
    end;
    if telemarketing then
    begin
      prcod_supervisor.Text := Representante_usuario;
      edcodsupervisor.Text := Representante_usuario;
      prcod_supervisorExit(Self);
      supervisor.Enabled := false;
    end;

    if Tipo_usuario = '9' then
    begin
      gbConsumidorFinal.Visible:= True;
    end
    else
    begin
      gbConsumidorFinal.Visible:= False;
      rbNaoConsumidorFinal.Checked := True;
    end;


    Self.Height := 350;
  end
  else if tipo_relatorio = 'ranking_vendas_completo' then
  begin
    gbMesAno.Visible := True;
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


    Gbdata.Visible := false;
    // loja.visible:=true;
    vendedor.Visible := true;
    edCodRepresentante.Visible := false;
    sbLimpaRep.Visible := false;

    supervisor.Visible := true;
    if Tipo_usuario = '0' then
    begin
      Prcod_representante.Text := Representante_usuario;
      edCodRepresentante.Text := Representante_usuario;
      Prcod_representanteExit(Self);
      vendedor.Enabled := false;
    end;
    if telemarketing then
    begin
      prcod_supervisor.Text := Representante_usuario;
      edcodsupervisor.Text := Representante_usuario;
      prcod_supervisorExit(Self);
      supervisor.Enabled := false;
    end;

    if Tipo_usuario = '9' then
    begin
      gbConsumidorFinal.Visible:= True;
    end
    else
    begin
      gbConsumidorFinal.Visible:= False;
      rbNaoConsumidorFinal.Checked := True;
    end;


    Self.Height := 350;
  end
  else if tipo_relatorio = 'relatorio_pedidos_desfaturados' then
  begin
    grTipoData.Visible := false;
    Gbdata.Visible := true;
    cliente.Visible := true;
    vendedor.Visible := false;
    supervisor.Visible := false;
    fornecedor.Visible := false;
    p2.Visible := true;
    gbSupervisao.Visible := true;

    if Tipo_usuario = '9' then
      gbConsumidorFinal.Visible:= True
    else begin
      gbConsumidorFinal.Visible:= False;
      rbNaoConsumidorFinal.Checked := True;
    end;

  end
  else if tipo_relatorio = 'pedidos_vendedor' then
  begin
    grTipoData.Visible := false;
    Gbdata.Visible := true;
    vendedor.Visible := true;
    supervisor.Visible := true;
    cliente.Visible := true;
    pn_pedido.Visible := true;
    p2.Visible := true;
    gbSupervisao.Visible := true;

    if Tipo_usuario = '9' then
      gbConsumidorFinal.Visible:= True
    else begin
      gbConsumidorFinal.Visible:= False;
      rbNaoConsumidorFinal.Checked := True;
    end;

  end
  else if tipo_relatorio = 'palm' then
  begin
    grTipoData.Visible := false;
    Gbdata.Visible := true;
    vendedor.Visible := true;
    supervisor.Visible := false;
    cliente.Visible := true;
    pn_pedido.Visible := true;
    p2.Visible := true;
    gbSupervisao.Visible := true;

    if Tipo_usuario = '9' then
      gbConsumidorFinal.Visible:= True
    else begin
      gbConsumidorFinal.Visible:= False;
      rbNaoConsumidorFinal.Checked := True;
    end;
  end
  else if tipo_relatorio = 'prateleira' then
  begin
    grTipoData.Visible := false;
    Gbdata.Visible := true;
    // fornecedor.visible := true;
    cliente.Visible := true;
    pn_pedido.Visible := true;
    grupo.Visible := true;
    p2.Visible := true;
    gbSupervisao.Visible := true;

    if Tipo_usuario = '9' then
      gbConsumidorFinal.Visible:= True
    else begin
      gbConsumidorFinal.Visible:= False;
      rbNaoConsumidorFinal.Checked := True;
    end;

  end
  else if (tipo_relatorio = 'comissoes_novo_simplificado') or (tipo_relatorio = 'comissao_comparativo') then
  begin
    grTipoData.Visible := true;
    Gbdata.Visible := true;
    // loja.visible:=true;
    vendedor.Visible := true;
    supervisor.Visible := true;
    cliente.Visible := true;
    pn_pedido.Visible := true;
    if Tipo_usuario = '0' then
    begin
      Prcod_representante.Text := Representante_usuario;
      edCodRepresentante.Text := Representante_usuario;
      Prcod_representanteExit(Self);
      vendedor.Enabled := false;
    end;
    if telemarketing then
    begin
      prcod_supervisor.Text := Representante_usuario;
      edcodsupervisor.Text := Representante_usuario;
      prcod_supervisorExit(Self);
      supervisor.Enabled := false;
    end;

    // grupo.Visible:= True;
    // marca.Visible:= True;
    p2.Visible := true;
    gbSupervisao.Visible := true;

    if Tipo_usuario = '9' then
      gbConsumidorFinal.Visible:= True
    else begin
      gbConsumidorFinal.Visible:= False;
      rbNaoConsumidorFinal.Checked := True;
    end;

  end
  else if tipo_relatorio = 'comparativo_tablet' then
  begin

    grTipoData.Visible := true;
    Gbdata.Visible := true;
    // loja.visible:=true;
    vendedor.Visible := true;
    supervisor.Visible := true;
    cliente.Visible := true;
    pn_pedido.Visible := true;
    pn_tablet.Visible := true;
    if Tipo_usuario = '0' then
    begin
      Prcod_representante.Text := Representante_usuario;
      edCodRepresentante.Text := Representante_usuario;
      Prcod_representanteExit(Self);
      vendedor.Enabled := false;
    end;
    if telemarketing then
    begin
      prcod_supervisor.Text := Representante_usuario;
      edcodsupervisor.Text := Representante_usuario;
      prcod_supervisorExit(Self);
      supervisor.Enabled := false;
    end;

    // grupo.Visible:= True;
    // marca.Visible:= True;
    p2.Visible := true;
    gbSupervisao.Visible := true;

    if Tipo_usuario = '9' then
      gbConsumidorFinal.Visible:= True
    else begin
      gbConsumidorFinal.Visible:= False;
      rbNaoConsumidorFinal.Checked := True;
    end;

  end
  else if tipo_relatorio = 'comissoes_novo_detalhado' then
  begin
    grTipoData.Visible := true;
    Gbdata.Visible := true;
    // loja.visible:=true;
    vendedor.Visible := true;
    supervisor.Visible := true;
    cliente.Visible := true;
    pn_pedido.Visible := true;
    if Tipo_usuario = '0' then
    begin
      Prcod_representante.Text := Representante_usuario;
      edCodRepresentante.Text := Representante_usuario;
      Prcod_representanteExit(Self);
      vendedor.Enabled := false;
    end;
    if telemarketing then
    begin
      prcod_supervisor.Text := Representante_usuario;
      edcodsupervisor.Text := Representante_usuario;
      prcod_supervisorExit(Self);
      supervisor.Enabled := false;
    end;

    // grupo.Visible:= True;
    // marca.Visible:= True;
    p2.Visible := true;
    gbSupervisao.Visible := true;

    if Tipo_usuario = '9' then
      gbConsumidorFinal.Visible:= True
    else begin
      gbConsumidorFinal.Visible:= False;
      rbNaoConsumidorFinal.Checked := True;
    end;

  end
  else if tipo_relatorio = 'comissoes_novo' then
  begin
    grTipoData.Visible := true;
    Gbdata.Visible := true;
    // loja.visible:=true;
    vendedor.Visible := true;
    supervisor.Visible := true;
    pn_pedido.Visible := true;
    cliente.Visible := true;
    if Tipo_usuario = '0' then
    begin
      Prcod_representante.Text := Representante_usuario;
      edCodRepresentante.Text := Representante_usuario;
      Prcod_representanteExit(Self);
      vendedor.Enabled := false;
    end;
    if telemarketing then
    begin
      prcod_supervisor.Text := Representante_usuario;
      edcodsupervisor.Text := Representante_usuario;
      prcod_supervisorExit(Self);
      supervisor.Enabled := false;
    end;

    // grupo.Visible:= True;
    // marca.Visible:= True;
    p2.Visible := true;
    gbSupervisao.Visible := true;

    if Tipo_usuario = '9' then
      gbConsumidorFinal.Visible:= True
    else begin
      gbConsumidorFinal.Visible:= False;
      rbNaoConsumidorFinal.Checked := True;
    end;

  end
  else if tipo_relatorio = 'ranking_cliente' then
  begin
    Gbdata.Visible := true;
    OrdenarRanking.Visible := true;
    Fr_opc_relatorios.Height := 500;
    vendedor.Visible := true;
    uf.Visible := true;
    supervisor.Visible := true;
    cliente.Visible := true;
    cidade.Visible := True;
    rbTotalVendas.Checked := true;

    if Tipo_usuario = '4' then
    begin
      prcod_supervisor.Text := Representante_usuario;
      edcodsupervisor.Text := Representante_usuario;
      prcod_supervisorExit(Self);
      supervisor.Enabled := false;
    end;
    if Tipo_usuario = '0' then
    begin
      Prcod_representante.Text := Representante_usuario;
      edCodRepresentante.Text := Representante_usuario;
      Prcod_representanteExit(Self);
      vendedor.Enabled := false;
    end;

  end
  else if tipo_relatorio = 'ranking_cliente_simplificado' then
  begin
    Gbdata.Visible := true;
    OrdenarRanking.Visible := true;
    // Fr_opc_relatorios.Height := 200;
    vendedor.Visible := true;
    supervisor.Visible := false;
  end
  // Relatorios Vendas Industria
  else if tipo_relatorio = 'controle_fretes_transportadora' then
  begin
    cidade.Visible := true;
    uf.Visible := True;
    Gbdata.Visible := true;
    transportadora.Visible := true;
    pn_pedido.Visible := true;
    ordenar2.Visible := true;
    Fr_opc_relatorios.Height := 500;
  end
  else if tipo_relatorio = 'relatorio_notas_entrada' then
  begin
    grTipoData.Visible := false;
    Gbdata.Visible := true;
    loja.Visible := true;
    fornecedor.Visible := true;
  end
  else if tipo_relatorio = 'cheque_terceiros' then
  begin
    gbContasTipo.Visible := true;
    Fr_opc_relatorios.Height := 400
  end
  else if tipo_relatorio = 'relatorio_notas_entrada_detalhado' then
  begin
    Gbdata.Visible := true;
    loja.Visible := true;
    fornecedor.Visible := true;
    grupo.Visible := true;
    marca.Visible := true;
    produto.Visible := true;
  end
  else if tipo_relatorio = 'relatorio_estoque_completo' then
  begin

    p1.Visible := true;
    Gbdata.Visible := false;

    PRmostrar_produto_estoque_zerado.Visible := true;
    Lbl_cliente.Visible := false;
    Prcod_cliente.Visible := false;
    Lbnom_cliente.Visible := false;

    Lbl_cidade.Visible := false;
    Prcod_cidade.Visible := false;
    LbNom_cidade.Visible := false;

    Lbl_empresa.Visible := false;
    Prempresa.Visible := false;
    Lbempresa.Visible := false;

    Lbl_fornecedor.Top := 19;
    Prcod_fornecedor.Top := 33;
    Lbfornecedor.Top := 39;
    Lbl_fornecedor.Left := 10;
    Prcod_fornecedor.Left := 8;
    Lbfornecedor.Left := 91;

    Lbl_produto.Top := 17;
    Prcod_produto.Top := 30;
    Lbnom_produto.Top := 36;

    Lbl_grupo.Top := 54;
    Prcod_grupo.Top := 66;
    LbNom_Grupo.Top := 72;

    Lbl_produto.Visible := false;
    Lbnom_produto.Visible := false;
    Prcod_produto.Visible := false;

    Lbl_grupo.Visible := false;
    LbNom_Grupo.Visible := false;
    Prcod_grupo.Visible := false;

    Lbl_cod_fiscal.Visible := false;
    Lbnom_cod_fiscal.Visible := false;
    Prcod_fiscal.Visible := false;

    Lbl_uf.Visible := false;
    lbuf.Visible := false;
    Pruf.Visible := false;
    Gbdata.Visible := false;
  end
  else if tipo_relatorio = 'relatorio_estoque_simplificado' then
  begin
    p1.Visible := true;
    Gbdata.Visible := false;

    PRmostrar_produto_estoque_zerado.Visible := true;
    Lbl_cliente.Visible := false;
    Prcod_cliente.Visible := false;
    Lbnom_cliente.Visible := false;

    Lbl_cidade.Visible := false;
    Prcod_cidade.Visible := false;
    LbNom_cidade.Visible := false;

    Lbl_empresa.Visible := false;
    Prempresa.Visible := false;
    Lbempresa.Visible := false;

    Lbl_fornecedor.Top := 19;
    Prcod_fornecedor.Top := 33;
    Lbfornecedor.Top := 39;
    Lbl_fornecedor.Left := 10;
    Prcod_fornecedor.Left := 8;
    Lbfornecedor.Left := 91;

    Lbl_produto.Top := 17;
    Prcod_produto.Top := 30;
    Lbnom_produto.Top := 36;

    Lbl_grupo.Top := 54;
    Prcod_grupo.Top := 66;
    LbNom_Grupo.Top := 72;

    Lbl_produto.Visible := false;
    Lbnom_produto.Visible := false;
    Prcod_produto.Visible := false;

    Lbl_grupo.Visible := false;
    LbNom_Grupo.Visible := false;
    Prcod_grupo.Visible := false;

    Lbl_cod_fiscal.Visible := false;
    Lbnom_cod_fiscal.Visible := false;
    Prcod_fiscal.Visible := false;

    Lbl_uf.Visible := false;
    lbuf.Visible := false;
    Pruf.Visible := false;
    Gbdata.Visible := false;
  end
  else if tipo_relatorio = 'relatorio_pauta_produto' then
  begin
    Gbdata.Visible := false;

    Lbl_cliente.Visible := false;
    Prcod_cliente.Visible := false;
    Lbnom_cliente.Visible := false;

    rgAtivo.Visible := true;

    Lbl_cidade.Visible := false;
    Prcod_cidade.Visible := false;
    LbNom_cidade.Visible := false;

    Lbl_empresa.Visible := false;
    Prempresa.Visible := false;
    Lbempresa.Visible := false;

    Lbl_fornecedor.Top := 19;
    Prcod_fornecedor.Top := 33;
    Lbfornecedor.Top := 39;
    Lbl_fornecedor.Left := 10;
    Prcod_fornecedor.Left := 8;
    Lbfornecedor.Left := 91;

    Lbl_produto.Top := 17;
    Prcod_produto.Top := 30;
    Lbnom_produto.Top := 36;

    Lbl_grupo.Top := 54;
    Prcod_grupo.Top := 66;
    LbNom_Grupo.Top := 72;

    Lbl_produto.Visible := false;
    Lbnom_produto.Visible := false;
    Prcod_produto.Visible := false;

    Lbl_grupo.Visible := true;
    LbNom_Grupo.Visible := true;
    Prcod_grupo.Visible := true;

    Lbl_cod_fiscal.Visible := false;
    Lbnom_cod_fiscal.Visible := false;
    Prcod_fiscal.Visible := false;

    Lbl_uf.Visible := false;
    lbuf.Visible := false;
    Pruf.Visible := false;
    Gbdata.Visible := false;
  end
  else if tipo_relatorio = 'vendas_fornecedor_custo' then
  begin
    Lbl_cliente.Visible := false;
    Prcod_cliente.Visible := false;
    Lbnom_cliente.Visible := false;

    Lbl_cidade.Visible := false;
    Prcod_cidade.Visible := false;
    LbNom_cidade.Visible := false;

    Lbl_empresa.Visible := true;
    Prempresa.Visible := true;
    Lbempresa.Visible := true;

    Lbl_fornecedor.Top := 19;
    Prcod_fornecedor.Top := 33;
    Lbfornecedor.Top := 39;
    Lbl_fornecedor.Left := 10;
    Prcod_fornecedor.Left := 8;
    Lbfornecedor.Left := 91;

    Lbl_produto.Top := 17;
    Prcod_produto.Top := 30;
    Lbnom_produto.Top := 36;

    Lbl_grupo.Top := 54;
    Prcod_grupo.Top := 66;
    LbNom_Grupo.Top := 72;

    Lbl_produto.Visible := false;
    Lbnom_produto.Visible := false;
    Prcod_produto.Visible := false;

    Lbl_grupo.Visible := false;
    LbNom_Grupo.Visible := false;
    Prcod_grupo.Visible := false;

    Lbl_cod_fiscal.Visible := false;
    Lbnom_cod_fiscal.Visible := false;
    Prcod_fiscal.Visible := false;

    Lbl_uf.Visible := false;
    lbuf.Visible := false;
    Pruf.Visible := false;
    Gbdata.Visible := true;
  end
  else if tipo_relatorio = 'relatorio_consignacao' then
  begin
    Gbdata.Visible := true;
    cliente.Visible := true;
    loja.Visible := true;

  end
  else if tipo_relatorio = 'comissao_venda' then
  begin
    grTipoData.Visible := true;
    Gbdata.Visible := true;
    vendedor.Visible := true;
    supervisor.Visible := true;
    p2.Visible := true;
    gbSupervisao.Visible := true;

    if Tipo_usuario = '9' then
      gbConsumidorFinal.Visible:= True
    else begin
      gbConsumidorFinal.Visible:= False;
      rbNaoConsumidorFinal.Checked := True;
    end;

    if Tipo_usuario = '0' then
    begin
      Prcod_representante.Text := Representante_usuario;
      edCodRepresentante.Text := Representante_usuario;
      Prcod_representanteExit(Self);
      vendedor.Enabled := false;
    end;
    if telemarketing then
    begin
      prcod_supervisor.Text := Representante_usuario;
      edcodsupervisor.Text := Representante_usuario;
      prcod_supervisorExit(Self);
      supervisor.Enabled := false;
    end;
  end
  else if tipo_relatorio = 'relatorio_transferencia' then
  begin
    grTipoData.Visible := false;
    Gbdata.Visible := true;
    loja.Visible := true;
    fornecedor.Visible := true;
    marca.Visible := true;
    grupo.Visible := true;
  end
  else if tipo_relatorio = 'Plano Contas' then
  begin
    Gbdata.Visible := true;
    gbContasTipo.Visible := true;
  end
  else if tipo_relatorio = 'Extrato' then
  begin
    gbConta.Visible := true;
    gbPlanoConta.Visible := false;
    Gbdata.Visible := true;
  end
  else if tipo_relatorio = 'solicitacao_ordem_compra' then
  begin
    fornecedor.Visible := true;
    grupo.Visible := true;
  end
  else if tipo_relatorio = 'relatorio_auxiliar_compra' then
  begin
    fornecedor.Visible := true;
    grupo.Visible := true;
  end;

  if Gbdata.Visible then
  begin
    Prdta_inicial.date := now - 30;
    Prdta_final.date := now;
  end;

  if (tipo_relatorio = 'Plano Contas Lista') then
  begin
    gbPlanoConta.Visible := true;
    pnDesc.Visible := false;
  end;

  path := ExtractFilePath(Application.ExeName);
end;

procedure TFr_opc_relatorios.Prcod_clienteButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Cliente';
  chamou_pesquisa := 'fr_cliente';
  chamou_form := 'fr_opc_relatorio_cliente';
  chamou_cadastro := 'Fr_cliente';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cliente';
  Fr_localizar.BT_cadastro.Visible := true;

  SetLength(Campos_combo, 6);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Razão Social';
  Campos_combo[2] := 'CNPJ';
  Campos_combo[3] := 'CPF';
  Campos_combo[4] := 'Cidade';

  for i := 0 to 5 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.add(Campos_combo[i]);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

  Prcod_cliente.SetFocus;

  if edCliente.Text = '' then
  begin
    edCliente.Text := edCliente.Text + ';' + Prcod_cliente.Text;
    if pos(';', edCliente.Text) = 1 then
      edCliente.Text := copy(edCliente.Text, 2, length(edCliente.Text));
  end;
end;

procedure TFr_opc_relatorios.Prcod_clienteKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: array of string;
  i: Integer;
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
    if (Prcod_cliente.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Cliente';
      chamou_pesquisa := 'fr_cliente';
      chamou_form := 'fr_opc_relatorio_cliente';
      chamou_cadastro := 'Fr_cliente';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cliente';
      Fr_localizar.BT_cadastro.Visible := true;

      SetLength(Campos_combo, 6);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Nome';
      Campos_combo[2] := 'CNPJ';
      Campos_combo[3] := 'CPF';
      Campos_combo[4] := 'Cidade';

      for i := 0 to 5 do
      begin
        valor_combo := Campos_combo[i];
        Fr_localizar.CBcampos.Items.add(Campos_combo[i]);
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

procedure TFr_opc_relatorios.Prcod_cidadeButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Cidade';

  chamou_pesquisa := 'fr_cidades';
  chamou_form := 'fr_opc_relatorio_cidade';
  chamou_cadastro := 'fr_cidade';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cidades';

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 5);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'Microregião';
  Campos_combo[3] := 'Mesoregião';
  Campos_combo[4] := 'UF';

  for i := 0 to 4 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.add(valor_combo);
  end;

  Fr_localizar.CBcampos.ItemIndex := 1;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  Prcod_cidade.SetFocus;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

  if edCidade.Text = '' then
  begin
    edCidade.Text := edCidade.Text + ';' + Prcod_cidade.Text;
    if pos(';', edCidade.Text) = 1 then
      edCidade.Text := copy(edCidade.Text, 2, length(edCidade.Text));
  end;
end;

procedure TFr_opc_relatorios.PRRazao_SocialKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;
end;

procedure TFr_opc_relatorios.Prcod_produtoButtonClick(Sender: TObject);
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
  chamou_form := 'fr_opc_relatorio_produto';
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
    Fr_localizar.CBcampos.Items.add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

  Prcod_produto.SetFocus;

  if edProduto.Text = '' then
  begin
    edProduto.Text := edProduto.Text + ';' + Prcod_produto.Text;
    if pos(';', edProduto.Text) = 1 then
      edProduto.Text := copy(edProduto.Text, 2, length(edProduto.Text));
  end;
end;

procedure TFr_opc_relatorios.Prcod_produtoExit(Sender: TObject);
begin
  if trim(Prcod_produto.Text) = '' then
    Lbnom_produto.Caption := '...';

  if Prcod_produto.Text <> '' then
  begin
    if (not fmfun.verificaNumerico(Prcod_produto.Text)) and (length(Prcod_produto.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      Prcod_produto.SetFocus;
      exit;
    end;

    dao.Geral2('select nom_produto from produto where cod_produto=' + quotedstr(Prcod_produto.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_produto.Caption := dao.q2.fieldbyname('nom_produto').AsString;
      if edProduto.Text = '' then
        edProduto.Text := Prcod_produto.Text
      else
        edProduto.Text := Prcod_produto.Text + ';' + edProduto.Text;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_produto.Text := '';
      Prcod_produto.SetFocus;
      exit;
    end;
  end;
end;

procedure TFr_opc_relatorios.Prcod_produtoKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: array of string;
  i: Integer;
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
    if (length(Prcod_produto.Text) < 12) and (Prcod_produto.Text <> '') then
      busca_produto_unitario(false, Prcod_produto.Text)
    else if (Prcod_produto.Text <> '') then
    begin
      busca_produto_unitario(true, Prcod_produto.Text);
      usa_leitor := true;
    end;
    if (Prcod_produto.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Produto';
      chamou_pesquisa := 'fr_produto';
      chamou_form := 'fr_opc_relatorio_produto';
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
        Fr_localizar.CBcampos.Items.add(valor_combo);
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
    { if Prcod_produto.Text <> '' then
      begin
      dao.Geral1('select grade from produto where cod_produto='+QuotedStr(Prcod_produto.Text));
      if dao.Q1.FieldByName('grade').AsString = '1' then
      paAtributo.Enabled:= false
      else
      paAtributo.Enabled:= true;
      end;
      if paAtributo.Enabled=true then
      Emid_cor.SetFocus
      else
      Emqtd_entrada.SetFocus;

      if usa_leitor then
      BtgraEm.Click; }

    Key := #0;
  end;
end;

procedure TFr_opc_relatorios.Prcod_grupoButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Grupo';

  chamou_pesquisa := 'fr_grupo';
  chamou_form := 'fr_opc_relatorio_grupo';
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
    Fr_localizar.CBcampos.Items.add(valor_combo);
  end;

  Fr_localizar.CBcampos.ItemIndex := 1;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  Prcod_grupo.SetFocus;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

  if edGrupo.Text = '' then
  begin
    edGrupo.Text := edGrupo.Text + ';' + Prcod_grupo.Text;
    if pos(';', edGrupo.Text) = 1 then
      edGrupo.Text := copy(edGrupo.Text, 2, length(edGrupo.Text));
  end;

end;

procedure TFr_opc_relatorios.Prcod_grupoKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  chamou_form_old, chamou_pesquisa_old: string;
begin
  if not (Key in ['0'..'9', #8]) and (Key <> #13) then
  begin
    beep; { somente delphi 2.0 ou > }
    Key := #0;
  end;

  if Key = #13 then
  begin
    if (Prcod_grupo.Text = '') then
    begin
      // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa

      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Grupo';

      chamou_pesquisa := 'fr_grupo';
      chamou_form := 'fr_opc_relatorio_grupo';
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
        Fr_localizar.CBcampos.Items.add(valor_combo);
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
    Key := #0;
  end;
end;

procedure TFr_opc_relatorios.busca_produto_unitario(leitor: boolean; cod_barras: string);
var
  cmd: string;
begin
  if leitor then
  begin
    if length(cod_barras) < 13 then
    begin
      dao.Geral1('select p.cod_produto, nom_produto, qtd_estoque,preco_venda, grade from produto p ' + 'left join cod_barras cb on cb.cod_produto=p.cod_produto ' + 'where cb.cod_barras=' + quotedstr(cod_barras));
      dao.Q1.first;
      if dao.Q1.RecordCount < 1 then
      begin
        dao.msg('Produto não encontrado!');
        Prcod_produto.SetFocus;
        exit;
      end
      else
      begin
        Prcod_produto.Text := dao.Q1.fieldbyname('cod_produto').AsString;
        Lbnom_produto.Caption := dao.Q1.fieldbyname('nom_produto').AsString;
      end;
    end
    else
    begin
      if copy(cod_barras, 1, 4) <> '' then
        dao.Geral2('select grade from produto where cod_produto= ' + quotedstr(copy(cod_barras, 1, 4)));

      if dao.q2.fieldbyname('grade').AsString = '0' then
      begin
        dao.Geral1('select p.cod_produto, p.nom_produto, p.qtd_estoque,p.preco_venda, p.grade, gd.id_cor, gd.id_tamanho, c.cor, t.tamanho from produto p ' + 'left join grade gd on gd.cod_produto=p.cod_produto ' + 'left join cores c on c.id=gd.id_cor ' + 'left join tamanho t on t.id=gd.id_tamanho ' + 'where p.cod_produto=' + quotedstr(copy(cod_barras, 1, 4)) + ' and gd.id_cor = ' + quotedstr(copy(cod_barras, 5, 3)) + ' and id_tamanho = ' + quotedstr(copy(cod_barras, 8, 2)));
      end;

      if dao.q2.fieldbyname('grade').AsString = '1' then
      begin
        dao.Geral1('select p.cod_produto, p.nom_produto, p.qtd_estoque,p.preco_venda, p.grade, gd.id_cor, gd.id_tamanho, c.cor, t.tamanho from produto p ' + 'left join grade gd on gd.cod_produto=p.cod_produto ' + 'left join cores c on c.id=gd.id_cor ' + 'left join tamanho t on t.id=gd.id_tamanho ' + 'where p.cod_produto=' + quotedstr(copy(cod_barras, 1, 4)));
      end;

      dao.Q1.first;
      if dao.Q1.RecordCount < 1 then
      begin
        dao.msg('Produto não encontrado!');
        Prcod_produto.SetFocus;
        exit;
      end
      else
      begin
        Prcod_produto.Text := dao.Q1.fieldbyname('cod_produto').AsString;
        Lbnom_produto.Caption := dao.Q1.fieldbyname('nom_produto').AsString;
        { if dao.Q1.FieldByName('grade').AsString = '0' then
          begin
          Emid_cor.Text:= '';
          LbCor.Caption:='...';
          Emid_Tamanho.Text:= '';
          Lbtamanho.Caption:='...';

          Emid_cor.Text:= dao.Q1.fieldbyname('id_cor').AsString;
          LbCor.Caption:=dao.Q1.fieldbyname('cor').AsString;
          Emid_Tamanho.Text:= dao.Q1.fieldbyname('id_tamanho').AsString;
          Lbtamanho.Caption:=dao.Q1.fieldbyname('tamanho').AsString;
          end; }
      end;
    end;
  end;

  if not (leitor) then
  begin
    dao.Geral1('select p.cod_produto, nom_produto, qtd_estoque,preco_venda, grade from produto p ' + 'where p.cod_produto = ' + quotedstr(cod_barras));

    if dao.Q1.RecordCount < 1 then
    begin
      dao.msg('Produto não encontrado!');
      Prcod_produto.SetFocus;
      exit;
    end;
  end;

end;

procedure TFr_opc_relatorios.Prcod_clienteExit(Sender: TObject);
begin
  if trim(Prcod_cliente.Text) = '' then
    Lbnom_cliente.Caption := '...';

  if Prcod_cliente.Text <> '' then
  begin
    if (not fmfun.verificaNumerico(Prcod_cliente.Text)) and (length(Prcod_cliente.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      Prcod_cliente.SetFocus;
      exit;
    end;

    dao.Geral2('select nom_cliente from cliente where cod_cliente=' + quotedstr(Prcod_cliente.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_cliente.Caption := dao.q2.fieldbyname('nom_cliente').AsString;
      if edCliente.Text = '' then
        edCliente.Text := Prcod_cliente.Text
      else
        edCliente.Text := Prcod_cliente.Text + ';' + edCliente.Text;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_cliente.Text := '';
      Prcod_cliente.SetFocus;
      exit;
    end;
  end;

end;

procedure TFr_opc_relatorios.Prcod_cidadeExit(Sender: TObject);
begin
  if trim(Prcod_cidade.Text) = '' then
    LbNom_cidade.Caption := '...'
  else
  begin

    if (not fmfun.verificaNumerico(Prcod_cidade.Text)) and (length(Prcod_cidade.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      Prcod_cidade.SetFocus;
      exit;
    end;

    dao.Geral2('select NOM_CIDADE, UF from cidades where cod_cidade = ' + quotedstr(Prcod_cidade.Text));

    if dao.q2.RecordCount > 0 then
    begin
      LbNom_cidade.Caption := dao.q2.fieldbyname('NOM_CIDADE').AsString + '-' + dao.q2.fieldbyname('UF').AsString;
      if edCidade.Text = '' then
        edCidade.Text := Prcod_cidade.Text
      else
        edCidade.Text := edCidade.Text + ';' + Prcod_cidade.Text;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_cidade.Text := '';
      Prcod_cidade.SetFocus;
      exit;
    end;

  end;
end;

procedure TFr_opc_relatorios.Prcod_grupoExit(Sender: TObject);
begin
  if trim(Prcod_grupo.Text) = '' then
    LbNom_Grupo.Caption := '...';

  if Prcod_grupo.Text <> '' then
  begin
    dao.Geral2('select nom_grupo from grupo where cod_grupo=' + quotedstr(Prcod_grupo.Text));
    if dao.q2.RecordCount > 0 then
    begin
      LbNom_Grupo.Caption := dao.q2.fieldbyname('nom_grupo').AsString;
      if edGrupo.Text = '' then
        edGrupo.Text := Prcod_grupo.Text
      else
        edGrupo.Text := edGrupo.Text + ';' + Prcod_grupo.Text;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_grupo.Text := '';
      Prcod_grupo.SetFocus;
      exit;
    end;
  end;

end;

procedure TFr_opc_relatorios.relatorio_posicao_estoque_custo(codgrupo: string; codpro: string);
var
  Excel: Variant;
  nom_arquivo: string;
  linha: Integer;
  c_grupo, c_produto, cd_fornecedor: string;
  ac_qtd, ac_qtd_forn, ac_custo, ac_venda: Real;
  custo_final, preco_venda_final: Real;
  cmd: string;
begin

  if tipo_relatorio = 'relatorio_estoque_custo' then
  begin
    if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\posicao_estoque_preco_custo_ind.fr3')) then
    begin
      dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
      exit;
    end;
  end;

  if tipo_relatorio = 'relatorio_estoque_inventario' then
  begin
    if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\posicao_estoque_inventario.fr3')) then
    begin
      dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
      exit;
    end;
  end;

  cmd := 'select distinct pro.cod_produto, PRO.ORD_PAUTA, pro.nom_produto,  pro.QTD_EMBALAGEM, pro.UNIDADE, pro.grade, coalesce(pro.qtd_estoque, 0) as qtd_estoque, pro.qtd_reservado, ' +
         ' pro.cod_grupo,  g.nom_grupo, pro.CUSTO_total as CUSTO, pro.estoque_minimo, ' +
         ' (coalesce(pro.qtd_estoque,0)*coalesce(pro.CUSTO_total,0)) as custo_total, f.razao_social, ' +
         ' cast(coalesce((select MAX(e1.DTA_DOCUMENTO) from entrada2 e2, entrada1 e1 where e2.COD_FORNECEDOR = e1.COD_FORNECEDOR and e2.NR_DOCUMENTO = e1.NR_DOCUMENTO AND E2.COD_PRODUTO = PRO.COD_PRODUTO), ''2000/01/01'') as date) as ult_entrada, ' +
         ' coalesce((select e3.QTD_ENTRADA from entrada2 e3 where e3.ID = (select max(e2.ID) from entrada2 e2, entrada1 e1 where e2.COD_FORNECEDOR = e1.COD_FORNECEDOR and e2.NR_DOCUMENTO = e1.NR_DOCUMENTO AND E2.COD_PRODUTO = PRO.COD_PRODUTO)),0) as qtd_entrada ' +
         ' from produto pro ' +
         ' inner join grupo g on (g.COD_GRUPO = pro.cod_grupo) ' +
         ' left join fornecedor f on f.cod_fornecedor = pro.fornecedor_principal ' +
         ' where 1 = 1 ';

  if rbRevenda.Checked then
    cmd := cmd + ' and pro.revenda = ''S''';

  if rbOutros.Checked then
    cmd := cmd + ' and pro.revenda = ''N''';

  if rbAtivo.Checked then
    cmd := cmd + ' and pro.status = ''N''';

  if rbInativo.Checked then
    cmd := cmd + ' and pro.status = ''S''';

  if rbPromocao.Checked then
    cmd := cmd + ' and pro.promocao = ''S''';

  if rbIndisponivel.Checked then
    cmd := cmd + ' and pro.indisponivel = ''S''';

  if rbDisponivel.Checked then
    cmd := cmd + ' and pro.indisponivel = ''N''';

  { if not (PRmostrar_produto_estoque_zerado.Checked) then
    cmd := cmd + 'and pro.qtd_estoque > 0 '; }

  if edFornecedor.Text <> '' then
    cmd := cmd + ' and (1 = 1 ' + fmfun.cmdAux('pro.fornecedor_principal', edFornecedor.Text) + ' or 0 < (SELECT count(*) FROM PRODUTO_FORNECEDOR pf where pf.cod_produto = pro.cod_produto ' + fmfun.cmdAux('pf.cod_fornecedor', edFornecedor.Text) + '))';

  if edProduto.Text <> '' then
  begin
    cmd := cmd + fmfun.cmdAux('pro.cod_produto', edProduto.Text);
  end;

  if edGrupo.Text <> '' then
    cmd := cmd + fmfun.cmdAux('pro.cod_grupo', edGrupo.Text);

  if PrMostrarProdutosAbaixoEstoqueMinimo.Checked then
    cmd := cmd + ' and pro.QTD_ESTOQUE < pro.ESTOQUE_MINIMO ';

  cmd := cmd + ' order by f.razao_social, pro.cod_grupo, pro.nom_produto';

  with dm.q_posicao_estoque_custo do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  fR_RELATORIO.ShowReport;
end;

procedure TFr_opc_relatorios.relatorio_posicao_estoque_preco_venda(codgrupo: string; codpro: string);
begin

end;

procedure TFr_opc_relatorios.PrempresaButtonClick(Sender: TObject);
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
  chamou_form := 'fr_opc_relatorio_empresa';
  chamou_cadastro := 'Fr_empresa';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Empresa';
  Fr_localizar.BT_cadastro.Visible := false;

  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';

  for i := 0 to 1 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.add(Campos_combo[i]);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  Prempresa.SetFocus;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_opc_relatorios.PrempresaKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: array of string;
  i: Integer;
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
    if (Prempresa.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Empresa';
      chamou_pesquisa := 'fr_empresa';
      chamou_form := 'fr_opc_relatorio_empresa';
      chamou_cadastro := 'Fr_empresa';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Empresa';
      Fr_localizar.BT_cadastro.Visible := false;

      SetLength(Campos_combo, 2);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Nome';

      for i := 0 to 1 do
      begin
        valor_combo := Campos_combo[i];
        Fr_localizar.CBcampos.Items.add(Campos_combo[i]);
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
    Key := #0;

  end;
end;

procedure TFr_opc_relatorios.relatorio_historico_movimentacao_produto(cod_produto, empresa: string);
begin
  // busca as entradas
  dao.Geral1('select nr_documento, e1.dtadoc, qtd_entrada from entrada2 e2 ' + 'left join entrada1 e1 on e1.nr_documento=e2.nr_documento ' + 'where e2.cod_produto= ' + quotedstr(cod_produto));

  dao.Geral2('select numdoc, v1.dtadoc, v2.quantidade from vendas2 v2 ' + 'left join vendas1 v1 on v1.numdoc=v2.numdoc ' + 'where v1.cfop not in (''6152'', ''6409'') and  v2.cod_produto= ' + quotedstr(cod_produto));

  dao.Geral3('select id, cod_produto, data_acerto, qtd_acerto, operacao from acerto_estoque ac ' + 'left join produto p on p.cod_produto=ac.cod_produto ' + 'where ac.cod_produto= ' + quotedstr(cod_produto));

end;

procedure TFr_opc_relatorios.Prcod_fiscalButtonClick(Sender: TObject);
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
  chamou_form := 'fr_opc_relatorio_fiscal';
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
    Fr_localizar.CBcampos.Items.add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 0;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  Prcod_fiscal.SetFocus;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_opc_relatorios.Prcod_fiscalExit(Sender: TObject);
begin
  if trim(Prcod_fiscal.Text) = '' then
    Lbnom_cod_fiscal.Caption := '...';

  if Prcod_fiscal.Text <> '' then
  begin
    dao.Geral2('select nome from cod_fiscal where cod_fiscal=' + quotedstr(Prcod_fiscal.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_cod_fiscal.Caption := dao.q2.fieldbyname('nome').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_fiscal.Text := '';
      Prcod_fiscal.SetFocus;
      exit;
    end;

  end;

end;

procedure TFr_opc_relatorios.Prcod_fiscalKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: array of string;
  i: Integer;
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
    if (Prcod_fiscal.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Código Fiscal';
      chamou_pesquisa := 'fr_cod_fiscal';
      chamou_form := 'fr_opc_relatorio_fiscal';
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
        Fr_localizar.CBcampos.Items.add(valor_combo);
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

procedure TFr_opc_relatorios.PrufButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar UF';
  chamou_pesquisa := 'fr_UF';
  chamou_form := 'fr_opc_relatorio_UF';
  chamou_cadastro := 'Fr_UF';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'UF';
  Fr_localizar.BT_cadastro.Visible := false;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 1);
  Campos_combo[0] := 'UF';
  // Campos_combo[1] := 'Nome';

  for i := 0 to 0 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 0;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  Pruf.SetFocus;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_opc_relatorios.PrUFDestinoButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar UF';
  chamou_pesquisa := 'fr_UF';
  chamou_form := 'fr_opc_relatorio_UF_Destino';
  chamou_cadastro := 'Fr_UF';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'UF';
  Fr_localizar.BT_cadastro.Visible := false;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 1);
  Campos_combo[0] := 'UF';
  // Campos_combo[1] := 'Nome';

  for i := 0 to 0 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 0;
  Fr_localizar.loc_uf('');
  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  PrUFDestino.SetFocus;

  if edUFDestino.Text = '' then
  begin
    edUFDestino.Text := edUFDestino.Text + ';' +QuotedStr(PrUFDestino.Text);
    if pos(';', edUFDestino.Text) = 1 then
      edUFDestino.Text := copy(edUFDestino.Text, 2, length(edUFDestino.Text));
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_opc_relatorios.PrUFDestinoExit(Sender: TObject);
begin
  if trim(PrUFDestino.Text) = '' then
    lbUFDestino.Caption := '...';

  if PrUFDestino.Text <> '' then
  begin
    dao.Geral2('select uf from uf where uf=' + quotedstr(PrUFDestino.Text));
    if dao.q2.RecordCount > 0 then
    begin
      lbUFDestino.Caption := dao.q2.fieldbyname('uf').AsString;
      edUFDestino.Text := edUFDestino.Text + QuotedStr(PrUFDestino.Text) + ',';
      edUFDestino.Text := copy(edUFDestino.Text, 1, length(edUFDestino.Text)-1);
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      PrUFDestino.Text := '';
      PrUFDestino.SetFocus;
      exit;
    end;
  end;
end;

procedure TFr_opc_relatorios.PrUFDestinoKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  if Key = #13 then
  begin
    if (PrUFOrigem.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar UF';
      chamou_pesquisa := 'fr_UF';
      chamou_form := 'fr_opc_relatorio_UF_Destino';
      chamou_cadastro := 'Fr_UF';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'UF';
      Fr_localizar.BT_cadastro.Visible := false;

      // preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo, 1);
      Campos_combo[0] := 'UF';
      // Campos_combo[1] := 'Nome';

      for i := 0 to 0 do
      begin
        valor_combo := Campos_combo[i];
        Fr_localizar.CBcampos.Items.add(valor_combo);
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

procedure TFr_opc_relatorios.PrufKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin

  if Key = #13 then
  begin
    if (Pruf.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar UF';
      chamou_pesquisa := 'fr_UF';
      chamou_form := 'fr_opc_relatorio_UF';
      chamou_cadastro := 'Fr_UF';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Códigos Fiscais';
      Fr_localizar.BT_cadastro.Visible := false;

      // preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo, 1);
      Campos_combo[0] := 'UF';
      // Campos_combo[1] := 'Nome';

      for i := 0 to 0 do
      begin
        valor_combo := Campos_combo[i];
        Fr_localizar.CBcampos.Items.add(valor_combo);
      end;
      Fr_localizar.CBcampos.ItemIndex := 0;

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

procedure TFr_opc_relatorios.PrUFOrigemButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar UF';
  chamou_pesquisa := 'fr_UF';
  chamou_form := 'fr_opc_relatorio_UF_Origem';
  chamou_cadastro := 'Fr_UF';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'UF';
  Fr_localizar.BT_cadastro.Visible := false;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 1);
  Campos_combo[0] := 'UF';
  // Campos_combo[1] := 'Nome';

  for i := 0 to 0 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 0;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  Pruf.SetFocus;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_opc_relatorios.PrUFOrigemExit(Sender: TObject);
begin
  if trim(PrUFOrigem.Text) = '' then
    lbUFOrigem.Caption := '...';

  if PrUFOrigem.Text <> '' then
  begin
    dao.Geral2('select uf from uf where uf=' + quotedstr(PrUFOrigem.Text));
    if dao.q2.RecordCount > 0 then
    begin
      lbUFOrigem.Caption := dao.q2.fieldbyname('uf').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      PrUFOrigem.Text := '';
      PrUFOrigem.SetFocus;
      exit;
    end;
  end;
end;

procedure TFr_opc_relatorios.PrUFOrigemKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  if Key = #13 then
  begin
    if (PrUFOrigem.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar UF';
      chamou_pesquisa := 'fr_UF';
      chamou_form := 'fr_opc_relatorio_UF_Origem';
      chamou_cadastro := 'Fr_UF';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'UF';
      Fr_localizar.BT_cadastro.Visible := false;

      // preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo, 1);
      Campos_combo[0] := 'UF';
      // Campos_combo[1] := 'Nome';

      for i := 0 to 0 do
      begin
        valor_combo := Campos_combo[i];
        Fr_localizar.CBcampos.Items.add(valor_combo);
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

procedure TFr_opc_relatorios.relatorio_vendas_periodo(dta_inicial, dta_final: string);
var
  Excel: Variant;
  data: string;
  ac_data, ac_total: Real;
  lin: Integer;
  nom_arquivo: string;
begin
  ac_data := 0;
  ac_total := 0;
  dao.Geral1('select a.NUMDOC, a.HORA, a.DTADOC, a.COD_CLIENTE, a.COD_USUARIO, ' + 'a.COD_EMPRESA, a.FATURADO, a.CONSIGNACAO, a.ORCAMENTO, ' + 'a.ENTREGUE, a.TOT_BRUTO, a.DESCONTO, a.TOT_LIQUIDO, a.PRAZO_PGTO, ' + 'a.COD_FOP, a.NUM_CUPOM, a.TIPO_VENDA, a.QTD_PARCELAS, a.PONTO_USADO, ' + 'a.USUARIO_DESFATUROU, a.COD_REPRESENTANTE, a.COD_PRAZO_PGTO, a.CUSTO_TOTAL, ' + 'a.LUCRO_MEDIO, a.DTA_EMISSAO, a.DTA_SAIDA, a.EMPRESA_FATURAR, a.NF, ' + 'a.OBSERVACOES_PEDIDO, a.OBSERVACOES_NOTA, a.COD_TRANSPORTADORA, ' +
    'a.TIPO_FRETE, a.VOLUME_NOTA, a.PESO_NOTA, a.COD_CARGA, a.VL_FRETE, ' + 'a.CONTATO_FRETE, a.PED_IMPRESSO, a.DTA_VENCIMENTO_CONSIG, a.CANCELADO, ' + 'a.CONTEM_AVARIA, a.CONTEM_ETIQUETA, a.MOTIVO_TROCA, a.NR_VENDA_ORIGINAL, ' + 'a.PEDIDO, a.VENDA_ENVIADA, a.CREDITO_USADO, a.NR_PEDIDO_PALM, a.BOLETO_ANEXO, ' + 'a.COD_FISCAL, a.VLR_COMISSAO, a.VLR_BC_ICMS, a.VLR_ICMS, a.VLR_ST, ' + 'a.VLR_TOT_NF, a.VLR_BC_ICMS_ST, a.CHAVE_NFE, a.RECIBO_NFE, a.STATUS_NFE, ' +
    'a.MOTIVO_NFE, a.DIGEST_NFE, a.PROTOCOLO_NFE, a.DATA_REC_NFE, a.JUSTIF_CANC_NFE, ' + 'a.COD_SUPERVISOR, a.COD_FORNECEDOR, a.NFE, a.VLR_IPI, a.PALM_NR_CONEXAO, ' + 'a.SINCRONIZAR_PALM, a.NUMDOC_REF, a.FRETE_COMBINADO, a.DT_FRETE_COMBINADO, ' + 'a.EMAIL_NFE, a.EMAIL_PEDIDO, a.PEDIDO_VENDEDOR, a.USUARIO_CHECOU_PEDIDO_VENDEDOR, ' + 'a.CONTA_BOLETO, a.USUARIO_CHECOU_FRETE_COMBINADO, a.ABERTO_USUARIO, ' + 'a.MAQUINA_USUARIO_ABERTO, c.nom_cliente, u.nome from vendas1 a ' +
    'left join cliente c on c.cod_cliente = a.cod_cliente ' + 'left join tbusu u on u.codusu = a.cod_usuario ' + 'where case when a.FATURADO = ''1'' then a.DTA_EMISSAO else a.dtadoc END between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date)) + ' and tipo_venda <> ' + quotedstr('D') + ' and consignacao <>' + quotedstr('1') + ' and orcamento=' + quotedstr('0') + ' order by nom_cliente, dtadoc');

  DeleteFile(ExtractFilePath(ParamStr(0)) + 'temporario\relatorio vendas.xls');
  Excel := CreateOleObject('Excel.Application');

  Excel.WorkBooks.open(ExtractFilePath(ParamStr(0)) + 'Relatorios\relatorio_vendas.xls');
  Excel.WorkBooks[1].SaveAs(ExtractFilePath(ParamStr(0)) + 'temporario\relatorio vendas.xls');
  Excel.Visible := false;

  Excel.WorkBooks[1].sheets[1].cells[1, 2] := '   ' + nom_empresa;
  Excel.WorkBooks[1].sheets[1].cells[1, 6] := dao.DtaSerStr + ' / ' + dao.HrSer;
  Excel.WorkBooks[1].sheets[1].cells[3, 2] := '   Relatório de Vendas Agrupado por Cliente';

  dao.Q1.first;
  FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A5:G5');
  FRPRI.BordaCelGeral(Excel, 1, 'A5:G5', 2);
  Excel.WorkBooks[1].sheets[1].cells[4, 2] := 'CLIENTE: ' + dao.Q1.fieldbyname('nom_cliente').AsString;
  data := dao.Q1.fieldbyname('cod_cliente').AsString;
  lin := 6;

  while not (dao.Q1.Eof) do
  begin
    if data <> dao.Q1.fieldbyname('cod_cliente').AsString then
    begin
      lin := lin + 1;
      FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A' + inttostr(lin) + ':G' + inttostr(lin));
      FRPRI.BordaCelGeral(Excel, 1, 'A' + inttostr(lin) + ':G' + inttostr(lin), 2);
      Excel.WorkBooks[1].sheets[1].cells[lin, 1] := 'TOTAL DO CLIENTE: ' + FormatFloat('##,###0.00', ac_data);
      ac_data := 0;
      lin := lin + 2;

      FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A' + inttostr(lin) + ':G' + inttostr(lin));
      FRPRI.BordaCelGeral(Excel, 1, 'A' + inttostr(lin) + ':G' + inttostr(lin), 2);
      Excel.WorkBooks[1].sheets[1].cells[lin, 1] := 'CLIENTE: ' + dao.Q1.fieldbyname('nom_cliente').AsString;
      ;

      data := dao.Q1.fieldbyname('cod_cliente').AsString;
      lin := lin + 1;
    end;
    Excel.WorkBooks[1].sheets[1].cells[lin, 1] := dao.Q1.fieldbyname('numdoc').AsString;
    Excel.WorkBooks[1].sheets[1].cells[lin, 2] := formatdatetime('dd/mm/yyyy', dao.Q1.fieldbyname('dtadoc').AsDateTime);
    Excel.WorkBooks[1].sheets[1].cells[lin, 3] := dao.Q1.fieldbyname('tot_liquido').AsString;
    Excel.WorkBooks[1].sheets[1].cells[lin, 4] := dao.Q1.fieldbyname('desconto').AsString;
    Excel.WorkBooks[1].sheets[1].cells[lin, 5] := dao.Q1.fieldbyname('prazo_pgto').AsString;
    Excel.WorkBooks[1].sheets[1].cells[lin, 6] := copy(dao.Q1.fieldbyname('nome').AsString, 1, 15);

    lin := lin + 1;
    ac_data := ac_data + dao.Q1.fieldbyname('tot_liquido').AsFloat;
    if (dao.Q1.fieldbyname('tot_liquido').AsFloat <> 0) or ((dao.Q1.fieldbyname('tot_liquido').AsString = '')) then
      ac_total := ac_total + dao.Q1.fieldbyname('tot_liquido').AsFloat;
    dao.Q1.Next;
  end;
  lin := lin + 1;

  FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A' + inttostr(lin) + ':G' + inttostr(lin));
  FRPRI.BordaCelGeral(Excel, 1, 'A' + inttostr(lin) + ':G' + inttostr(lin), 2);
  Excel.WorkBooks[1].sheets[1].cells[lin, 1] := 'Total do Cliente: ' + FormatFloat('##,###0.00', ac_data);

  dao.Geral2('select sum(tot_liquido) as total from vendas1 where case when FATURADO = ''1'' then DTA_EMISSAO else dtadoc END between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date)) + ' and tipo_venda <> ' + quotedstr('D') + ' and consignacao <>' + quotedstr('1') + ' and orcamento=' + quotedstr('0'));

  lin := lin + 2;
  FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A' + inttostr(lin) + ':G' + inttostr(lin));
  FRPRI.BordaCelGeral(Excel, 1, 'A' + inttostr(lin) + ':G' + inttostr(lin), 2);
  Excel.WorkBooks[1].sheets[1].cells[lin, 1] := 'TOTAL DE VENDAS: ' + FormatFloat('##,###0.00', dao.q2.fieldbyname('total').AsFloat);

  // SALVA O DOCUMENTO
  nom_arquivo := 'posicao estoque' + '.xls';

  Excel.Visible := true;

end;

procedure TFr_opc_relatorios.relatorio_notas_entradas(dta_inicial, dta_final: string);
var
  Excel: Variant;
  c_fornecedor: string;
  ac_for, ac_qtd, ac_qtd_for, ac_total: Real;
  lin: Integer;
  nom_arquivo: string;
  cmd: string;
begin
  ac_for := 0;
  ac_total := 0;
  ac_qtd := 0;
  ac_qtd_for := 0;

  cmd := 'select e1.nr_documento,e1.dta_documento, e1.cod_fornecedor, e1.VL_TOTAL, ' + 'f.razao_social from entrada1 e1 left join fornecedor f on f.cod_fornecedor=e1.cod_fornecedor where 1 = 1 ';

  if Prdta_inicial.Text <> '  /  /  ' then
    cmd := cmd + ' and e1.dta_documento between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date));

  if edFornecedor.Text <> '' then
    cmd := cmd + fmfun.cmdAux('e1.cod_fornecedor', edFornecedor.Text);

  cmd := cmd + ' order by razao_social, dta_documento';

  dm.q_entradas_resumido.sql.clear;
  dm.q_entradas_resumido.sql.Text := cmd;
  dm.q_entradas_resumido.open;

  if dm.q_entradas_resumido.RecordCount <= 0 then
  begin
    dao.msg('Não foi Encontrado Dados para Gerar o Relatório!');
    exit;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\notas_entrada.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;

  fR_RELATORIO.ShowReport;

  {
    dao.Geral1(cmd);

    DeleteFile(ExtractFilePath(ParamStr(0)) + 'temporario\entrada notas.xls');
    Excel := CreateOleObject('Excel.Application');
    Excel.WorkBooks.Open(ExtractFilePath(ParamStr(0)) +
    'Relatorios\entrada_notas.xls');
    Excel.WorkBooks[1].SaveAs(ExtractFilePath(ParamStr(0)) +
    'temporario\entrada notas.xls');
    Excel.Visible := false;

    Excel.WorkBooks[1].sheets[1].cells[1, 6] := dao.DtaSerStr + ' / ' + dao.HrSer;
    Excel.WorkBooks[1].sheets[1].cells[2, 3] := FormatDateTime('DD/MM/YYYY',
    Prdta_inicial.Date) + ' ATÉ ' + FormatDateTime('DD/MM/YYYY',
    Prdta_final.Date);

    dao.Q1.First;
    Excel.WorkBooks[1].Sheets[1].Cells[4, 2] :=
    dao.Q1.FieldByName('razao_social').AsString;
    c_fornecedor := dao.Q1.FieldByName('cod_fornecedor').AsString;
    lin := 6;

    while not (dao.Q1.Eof) do
    begin
    if c_fornecedor <> dao.Q1.FieldByName('cod_fornecedor').AsString then
    begin
    lin := lin + 1;
    Excel.WorkBooks[1].sheets[1].cells[lin, 1] := 'Total do Fornecedor: ';
    Excel.WorkBooks[1].sheets[1].cells[lin, 2] := FormatFloat('##,###0.00',
    ac_for);
    ac_for := 0;
    Excel.WorkBooks[1].sheets[1].cells[lin, 3] := 'Total Peças: ';
    Excel.WorkBooks[1].sheets[1].cells[lin, 4] := FormatFloat('##,###0.00',
    ac_qtd_for);
    ac_qtd_for := 0;

    lin := lin + 2;

    Excel.WorkBooks[1].sheets[1].cells[lin, 1] := 'FORNECEDOR: ';
    FRPRI.FontCel(Excel, 1, 1, 10, 1, 'A' + inttostr(lin) + ':E' +
    inttostr(lin));
    Excel.WorkBooks[1].Sheets[1].Cells[lin, 2] :=
    dao.Q1.FieldByName('razao_social').AsString;
    c_fornecedor := dao.Q1.FieldByName('cod_fornecedor').AsString;
    lin := lin + 1;
    Excel.WorkBooks[1].Sheets[1].Cells[lin, 1] := 'NF';
    Excel.WorkBooks[1].Sheets[1].Cells[lin, 2] := 'DATA';
    Excel.WorkBooks[1].Sheets[1].Cells[lin, 3] := 'VL.TOTAL';
    Excel.WorkBooks[1].Sheets[1].Cells[lin, 4] := 'QTD.PEÇAS';
    lin := lin + 1;

    end;
    //       FRPRI.MesclaCel(Excel,1,'A'+IntToStr(lin)+':'+'D'+IntToStr(lin));
    Excel.WorkBooks[1].Sheets[1].Cells[lin, 1] :=
    dao.Q1.FieldByName('nr_documento').AsString;
    Excel.WorkBooks[1].Sheets[1].Cells[lin, 2] :=
    dao.Q1.FieldByName('dta_documento').AsString;
    Excel.WorkBooks[1].Sheets[1].Cells[lin, 3] := FormatFloat('##,###0.00',
    dao.Q1.FieldByName('vl_total').AsFloat);
    Excel.WorkBooks[1].Sheets[1].Cells[lin, 4] :=
    dao.Q1.FieldByName('tot_itens').AsString;

    lin := lin + 1;
    ac_for := ac_for + dao.Q1.fieldbyname('vl_total').AsFloat;
    ac_qtd_for := ac_qtd_for + dao.Q1.fieldbyname('tot_itens').AsFloat;
    ac_qtd := ac_qtd + dao.Q1.fieldbyname('tot_itens').AsFloat;
    ac_total := ac_total + dao.Q1.fieldbyname('vl_total').AsFloat;

    dao.Q1.Next;
    end;
    lin := lin + 1;
    Excel.WorkBooks[1].Sheets[1].Cells[lin, 1] := 'Total de Notas:';
    Excel.WorkBooks[1].Sheets[1].Cells[lin, 2] := FormatFloat('##,###0.00',
    ac_total);
    Excel.WorkBooks[1].Sheets[1].Cells[lin, 3] := 'Qtd. Total de Itens:';
    Excel.WorkBooks[1].Sheets[1].Cells[lin, 4] := FormatFloat('##,###0.00',
    ac_qtd);

    // SALVA O DOCUMENTO
    nom_arquivo := 'entrada notas' + '.xls';
    Excel.Visible := true;
  }
end;

procedure TFr_opc_relatorios.Prcod_fornecedorKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: array of string;
  i: Integer;
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
    if (Prcod_fornecedor.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Fornecedor';
      chamou_pesquisa := 'fr_fornecedor';
      chamou_form := 'fr_opc_relatorio_fornecedor';
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
        Fr_localizar.CBcampos.Items.add(valor_combo);
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

procedure TFr_opc_relatorios.Prcod_fornecedorButtonClick(Sender: TObject);
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
  chamou_form := 'fr_opc_relatorio_fornecedor';
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
    Fr_localizar.CBcampos.Items.add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

  Prcod_fornecedor.SetFocus;

  if edFornecedor.Text = '' then
  begin
    edFornecedor.Text := edFornecedor.Text + ';' + Prcod_fornecedor.Text;
    if pos(';', edFornecedor.Text) = 1 then
      edFornecedor.Text := copy(edFornecedor.Text, 2, length(edFornecedor.Text));
  end;

end;

procedure TFr_opc_relatorios.relatorio_posicao_estoque_completo(c_fornecedor: string);
var
  Excel: Variant;
  nom_arquivo: string;
  linha: Integer;
  cod_produto, cd_fornecedor: string;
  ac_qtd, ac_qtd_forn, ac_custo, ac_venda: Real;
  custo_final, preco_venda_final: Real;
  cmd: string;
begin
  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\estoque_gerencial.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;

  cmd := 'select pro.cod_produto, pro.nom_produto, pro.grade, pro.qtd_estoque,pro.custo, pro.preco_venda, f.razao_social, pro.fornecedor_principal, ' +
         'pro.cod_grupo, cr.cor , tm.tamanho, cr.cor, gd.id_cor, gd.id_tamanho, gd.est_individual, f.fantasia from produto pro ' +
         'left join grade gd on gd.cod_produto=pro.cod_produto ' +
         'left join cores cr on cr.id=gd.id_cor ' +
         'left join tamanho tm on tm.id=gd.id_tamanho ' +
         'left join fornecedor f on f.cod_fornecedor = pro.fornecedor_principal where 1 = 1 ';

  if rbRevenda.Checked then
    cmd := cmd + ' and pro.revenda = ''S''';

  if rbOutros.Checked then
    cmd := cmd + ' and pro.revenda = ''N''';

  if rbAtivo.Checked then
    cmd := cmd + ' and pro.status <> ' + quotedstr('S');

  if rbInativo.Checked then
    cmd := cmd + ' and pro.status = ' + quotedstr('S');

  if rbPromocao.Checked then
    cmd := cmd + ' and pro.promocao = ''S''';

  if rbIndisponivel.Checked then
    cmd := cmd + ' and pro.indisponivel = ''S''';

  if rbDisponivel.Checked then
    cmd := cmd + ' and pro.indisponivel = ''N''';

  if not (PRmostrar_produto_estoque_zerado.Checked) then
    cmd := cmd + ' and pro.qtd_estoque > 0 ';

  if trim(edProduto.Text) <> '' then
    cmd := cmd + fmfun.cmdAux('pro.cod_produto', edProduto.Text);

  if trim(edGrupo.Text) <> '' then
    cmd := cmd + fmfun.cmdAux('pro.cod_grupo', edGrupo.Text);

  if PrMostrarProdutosAbaixoEstoqueMinimo.Checked then
    cmd := cmd + ' and pro.QTD_ESTOQUE < pro.ESTOQUE_MINIMO ';

  if c_fornecedor <> '' then
  begin
    if (c_fornecedor <> '') and (not (PRmostrar_produto_estoque_zerado.Checked)) then
      cmd := cmd + ' and (pro.fornecedor_principal = ' + quotedstr(c_fornecedor) + ' or 0 < (SELECT count(*) FROM PRODUTO_FORNECEDOR pf where pf.cod_produto = pro.cod_produto ' + fmfun.cmdAux('pf.cod_fornecedor', quotedstr(c_fornecedor)) + '))'
    else
      cmd := cmd + ' and (pro.fornecedor_principal = ' + quotedstr(c_fornecedor) + ' or 0 < (SELECT count(*) FROM PRODUTO_FORNECEDOR pf where pf.cod_produto = pro.cod_produto ' + fmfun.cmdAux('pf.cod_fornecedor', edFornecedor.Text) + '))';
  end;
  cmd := cmd + ' order by f.razao_social, pro.nom_produto';

  with dm.Q_est_gerencial do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  fR_RELATORIO.ShowReport;

  { Excel := CreateOleObject('Excel.Application');
    DeleteFile(ExtractFilePath(ParamStr(0)) + 'temporario\posicao estoque completa.xls');
    Excel.WorkBooks.Open(ExtractFilePath(ParamStr(0)) + 'Relatorios\posicao_estoque_completa.xls');
    Excel.WorkBooks[1].SaveAs(ExtractFilePath(ParamStr(0)) + 'temporario\posicao estoque completa.xls');
    Excel.Visible := false;

    Excel.WorkBooks[1].sheets[1].cells[2,2]:= dao.DtaSerStr+' / '+ dao.HrSer;

    dao.Q1.First;

    //   FRPRI.FontCel(Excel,1,3,10,0,'A6:A:9');
    FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A6:H6');
    Excel.WorkBooks[1].Sheets[1].Cells[6,2]:= dao.Q1.FieldByName('razao_social').AsString;
    Excel.WorkBooks[1].Sheets[1].Cells[7,2]:= dao.Q1.FieldByName('nom_produto').AsString;
    Excel.WorkBooks[1].Sheets[1].Cells[7,8]:= dao.Q1.FieldByName('qtd_estoque').AsString;
    Excel.WorkBooks[1].sheets[1].cells[8,1]:= 'Custo:';
    Excel.WorkBooks[1].Sheets[1].Cells[8,2]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('custo').AsFloat);
    Excel.WorkBooks[1].sheets[1].cells[8,3]:= 'Tot.Custo:';
    Excel.WorkBooks[1].Sheets[1].Cells[8,4]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('custo').AsFloat * dao.Q1.fieldbyname('qtd_estoque').AsFloat);
    Excel.WorkBooks[1].sheets[1].cells[8,5]:= 'Venda:';
    Excel.WorkBooks[1].Sheets[1].Cells[8,6]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('preco_venda').AsFloat);
    Excel.WorkBooks[1].sheets[1].cells[8,7]:= 'Tot.Venda:';
    Excel.WorkBooks[1].Sheets[1].Cells[8,8]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('preco_venda').AsFloat*dao.Q1.fieldbyname('qtd_estoque').AsFloat);

    ac_qtd:= 0;
    ac_qtd_forn:= 0;

    ac_qtd:= dao.Q1.FieldByName('qtd_estoque').AsFloat;
    ac_qtd_forn:= dao.Q1.FieldByName('qtd_estoque').AsFloat;
    cod_produto:= dao.Q1.FieldByName('cod_produto').AsString;
    cd_fornecedor:= dao.Q1.fieldbyname('fornecedor_principal').AsString;
    ac_custo:= ac_custo + dao.Q1.fieldbyname('custo').AsFloat * dao.q1.fieldbyname('qtd_estoque').AsFloat;
    ac_venda:= ac_venda + dao.Q1.fieldbyname('preco_venda').AsFloat * dao.q1.fieldbyname('qtd_estoque').AsFloat;
    linha:= 10 ;

    while not(dao.Q1.Eof) do
    begin
    if cd_fornecedor <> dao.Q1.FieldByName('fornecedor_principal').AsString then
    begin
    linha:= linha+1;
    if cd_fornecedor <> '' then
    begin
    FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A'+inttostr(linha)+':H'+inttostr(linha));
    Excel.WorkBooks[1].sheets[1].cells[linha,1]:= 'Qtd. Total Fornecedor:';
    dao.Geral2('select sum(qtd_estoque) as totfor from produto where fornecedor_principal= '+quotedStr(cd_fornecedor));
    end;
    Excel.WorkBooks[1].Sheets[1].Cells[linha,3]:= dao.Q2.FieldByName('totfor').AsString;
    ac_qtd_forn:= 0;
    linha:= linha + 2;
    FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A'+inttostr(linha)+':H'+inttostr(linha));
    Excel.WorkBooks[1].sheets[1].cells[linha,1]:= 'Fornecedor:';
    Excel.WorkBooks[1].Sheets[1].Cells[linha,2]:= dao.Q1.FieldByName('razao_social').AsString;
    linha:= linha + 1;
    Excel.WorkBooks[1].sheets[1].cells[linha,1]:= 'Produto:';
    Excel.WorkBooks[1].Sheets[1].Cells[linha,2]:= dao.Q1.FieldByName('nom_produto').AsString;
    Excel.WorkBooks[1].sheets[1].cells[linha,7]:= 'Qtd.Produto:';
    Excel.WorkBooks[1].Sheets[1].Cells[linha,8]:= dao.Q1.FieldByName('qtd_estoque').AsString;
    linha:= linha +1;
    Excel.WorkBooks[1].sheets[1].cells[linha,1]:= 'Custo:';
    Excel.WorkBooks[1].Sheets[1].Cells[linha,2]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('custo').AsFloat);
    Excel.WorkBooks[1].sheets[1].cells[linha,3]:= 'Tot.Custo:';
    Excel.WorkBooks[1].Sheets[1].Cells[linha,4]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('custo').AsFloat* dao.Q1.fieldbyname('qtd_estoque').AsFloat);
    Excel.WorkBooks[1].sheets[1].cells[linha,5]:= 'Venda:';
    Excel.WorkBooks[1].Sheets[1].Cells[linha,6]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('preco_venda').AsFloat);
    Excel.WorkBooks[1].sheets[1].cells[linha,7]:= 'Tot.Venda:';
    Excel.WorkBooks[1].Sheets[1].Cells[linha,8]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('preco_venda').AsFloat*dao.Q1.fieldbyname('qtd_estoque').AsFloat);
    linha:= linha + 1;
    //cabeçalho
    if dao.Q1.fieldbyname('grade').AsString = '0' then
    begin
    Excel.WorkBooks[1].Sheets[1].Cells[linha,1]:= 'Cor';
    Excel.WorkBooks[1].Sheets[1].Cells[linha,2]:= 'Tamanho';
    Excel.WorkBooks[1].Sheets[1].Cells[linha,3]:= 'Qtd';
    linha:= linha + 1;
    end;
    //final cabeçalho

    cod_produto:= dao.Q1.FieldByName('cod_produto').AsString;
    cd_fornecedor:= dao.Q1.FieldByName('fornecedor_principal').AsString;
    end;

    if cod_produto <> dao.Q1.FieldByName('cod_produto').AsString then
    begin
    //linha:= linha+1;

    FRPRI.FontCel(Excel, 1, 1, 10, 1, 'A'+inttostr(linha)+':H'+inttostr(linha));
    Excel.WorkBooks[1].sheets[1].cells[linha,1]:= 'Produto:';
    Excel.WorkBooks[1].Sheets[1].Cells[linha,2]:= dao.Q1.FieldByName('nom_produto').AsString;
    Excel.WorkBooks[1].sheets[1].cells[linha,7]:= 'Qtd.Produto:';
    Excel.WorkBooks[1].Sheets[1].Cells[linha,8]:= dao.Q1.FieldByName('qtd_estoque').AsString;
    linha:= linha +1;
    Excel.WorkBooks[1].sheets[1].cells[linha,1]:= 'Custo:';
    Excel.WorkBooks[1].Sheets[1].Cells[linha,2]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('custo').AsFloat);
    Excel.WorkBooks[1].sheets[1].cells[linha,3]:= 'Tot.Custo:';
    Excel.WorkBooks[1].Sheets[1].Cells[linha,4]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('custo').AsFloat* dao.Q1.fieldbyname('qtd_estoque').AsFloat);
    Excel.WorkBooks[1].sheets[1].cells[linha,5]:= 'Venda:';
    Excel.WorkBooks[1].Sheets[1].Cells[linha,6]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('preco_venda').AsFloat);
    Excel.WorkBooks[1].sheets[1].cells[linha,7]:= 'Tot.Venda:';
    Excel.WorkBooks[1].Sheets[1].Cells[linha,8]:= FormatFloat('###,##0.00',dao.Q1.FieldByName('preco_venda').AsFloat*dao.Q1.fieldbyname('qtd_estoque').AsFloat);
    linha:= linha + 1;
    ac_custo:= ac_custo + dao.Q1.fieldbyname('custo').AsFloat * dao.q1.fieldbyname('qtd_estoque').AsFloat;
    ac_venda:= ac_venda + dao.Q1.fieldbyname('preco_venda').AsFloat * dao.q1.fieldbyname('qtd_estoque').AsFloat;

    cod_produto:= dao.Q1.FieldByName('cod_produto').AsString;

    if dao.q1.fieldbyname('grade').AsString = '0' then
    begin
    Excel.WorkBooks[1].sheets[1].cells[linha,1]:= 'Cor';
    Excel.workBooks[1].sheets[1].cells[linha,2]:= 'Tamanho';
    Excel.WorkBooks[1].Sheets[1].Cells[linha,3]:= 'Qtd';
    linha:= linha+1;
    end;
    end;

    Excel.WorkBooks[1].Sheets[1].Cells[linha,1]:= dao.Q1.FieldByName('cor').AsString;
    Excel.WorkBooks[1].Sheets[1].Cells[linha,2]:= dao.Q1.FieldByName('tamanho').AsString;
    Excel.WorkBooks[1].Sheets[1].Cells[linha,3]:= dao.Q1.FieldByName('est_individual').AsString;
    ac_qtd_forn:= ac_qtd_forn + dao.Q1.fieldbyname('qtd_estoque').AsFloat;
    ac_qtd:= ac_qtd + dao.Q1.fieldbyname('est_individual').AsFloat;
    linha:= linha+1;

    dao.Q1.Next;
    end;

    if cd_fornecedor <> '' then
    begin
    FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A'+inttostr(linha)+':H'+inttostr(linha));
    Excel.WorkBooks[1].sheets[1].cells[linha,1]:= 'Qtd. Total Fornecedor:';
    dao.Geral2('select sum(qtd_estoque) as totfor from produto where fornecedor_principal= '+quotedStr(cd_fornecedor));
    Excel.WorkBooks[1].Sheets[1].Cells[linha,3]:= dao.Q2.FieldByName('totfor').AsString;
    linha:= linha + 1;

    {Qtd Total }
  { cmd:= 'select sum(qtd_estoque) as qtd from produto where status='+QuotedStr('N');
    if Prcod_fornecedor.Text <> '' then
    cmd:= cmd + ' and fornecedor_principal='+QuotedStr(Prcod_fornecedor.Text);
    if Prcod_grupo.Text <> '' then
    cmd:= cmd + ' and cod_grupo='+QuotedStr(Prcod_grupo.Text);
    dao.Geral3(cmd);
    ac_qtd:= dao.Q3.fieldbyname('qtd').AsFloat;
  }
  { custo total }
  { cmd :='select sum(custo*qtd_estoque) as custo_tot from produto where status='+QuotedStr('N');
    if Prcod_fornecedor.Text <> '' then
    cmd:= cmd + ' and fornecedor_principal='+QuotedStr(Prcod_fornecedor.Text);
    if Prcod_grupo.Text <> '' then
    cmd:= cmd + ' and cod_grupo='+QuotedStr(Prcod_grupo.Text);
    dao.Geral3(cmd);
    custo_final:= dao.Q3.fieldbyname('custo_tot').AsFloat;
  }
  { somatorio }
  { cmd:= 'select sum(preco_venda*qtd_estoque) as preco_tot from produto where status='+QuotedStr('N');
    if Prcod_fornecedor.Text <> '' then
    cmd:= cmd + ' and fornecedor_principal='+QuotedStr(Prcod_fornecedor.Text);
    if Prcod_grupo.Text <> '' then
    cmd:= cmd + ' and cod_grupo='+QuotedStr(Prcod_grupo.Text);
    dao.Geral3(cmd);
    preco_venda_final:= dao.Q3.fieldbyname('preco_tot').AsFloat;

    Excel.WorkBooks[1].Sheets[1].Cells[linha,1]:= 'Qtd Total de Peças:';
    Excel.WorkBooks[1].Sheets[1].Cells[linha,3]:= FormatFloat('0.00', ac_qtd);
    Excel.WorkBooks[1].Sheets[1].Cells[linha,5]:= 'P. Custo Total :'+formatFloat('###,##0.00',custo_final);
    Excel.WorkBooks[1].Sheets[1].Cells[linha,7]:= 'P. Venda Total :'+formatFloat('###,##0.00',preco_venda_final);

    // SALVA O DOCUMENTO
    Excel.Visible:= true;
  }
end;

procedure TFr_opc_relatorios.relatorio_pauta_produto(c_fornecedor: string; c_grupo: string);
var
  Excel: Variant;
  nom_arquivo: string;
  linha: Integer;
  cod_produto, cd_fornecedor, cd_grupo: string;
  ac_qtd, ac_qtd_forn, ac_custo, ac_venda: Real;
  cmd: string;
begin

  cmd := 'select pro.cod_produto, pro.status, pro.nom_produto, pro.grade, case when pro.promocao = ''S'' then pro.preco_promocao else pro.preco_venda end preco_venda,f.razao_social, g.nom_grupo, pro.fornecedor_principal, ' + 'pro.cod_grupo, g.nom_grupo from produto pro ' + 'left join grupo g on g.cod_grupo = pro.cod_grupo ' + 'left join fornecedor f on f.cod_fornecedor = pro.fornecedor_principal where 1 = 1 ';

  if rbRevenda.Checked then
    cmd := cmd + ' and p.revenda = ''S''';

  if rbOutros.Checked then
    cmd := cmd + ' and p.revenda = ''N''';

  if rbAtivo.Checked then
    cmd := cmd + ' and pro.status <> ''S''';

  if rbInativo.Checked then
    cmd := cmd + ' and pro.status = ''S''';

  if rbPromocao.Checked then
    cmd := cmd + ' and pro.promocao = ''S''';

  if rbIndisponivel.Checked then
    cmd := cmd + ' and pro.indisponivel = ''S''';

  if rbDisponivel.Checked then
    cmd := cmd + ' and pro.indisponivel = ''N''';

  if edFornecedor.Text <> '' then
    cmd := cmd + 'and (1=1' + fmfun.cmdAux('pro.fornecedor_principal', edFornecedor.Text) + ' or 0 < (SELECT count(*) FROM PRODUTO_FORNECEDOR pf where pf.cod_produto = pro.cod_produto ' + fmfun.cmdAux('pf.cod_fornecedor', edFornecedor.Text) + '))';

  if Prcod_grupo.Text <> '' then
    cmd := cmd + ' and cod_grupo = ' + quotedstr(c_grupo);

  cmd := cmd + ' order by f.razao_social, g.nom_grupo, pro.ord_pauta, pro.nom_produto';

  dao.Geral1(cmd);

  DeleteFile(ExtractFilePath(ParamStr(0)) + 'temporario\pauta produto.xls');
  Excel := CreateOleObject('Excel.Application');
  Excel.WorkBooks.open(ExtractFilePath(ParamStr(0)) + 'Relatorios\pauta_produto.xls');
  Excel.WorkBooks[1].SaveAs(ExtractFilePath(ParamStr(0)) + 'temporario\pauta produto.xls');

  Excel.Visible := true;

  Excel.WorkBooks[1].sheets[1].cells[2, 2] := dao.DtaSerStr + ' / ' + dao.HrSer;

  dao.Q1.first;
  FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A6:H6');
  FRPRI.BordaCelGeral(Excel, 1, 'A6:H6', 2);
  Excel.WorkBooks[1].sheets[1].cells[6, 2] := dao.Q1.fieldbyname('razao_social').AsString;

  FRPRI.FontCel(Excel, 1, 1, 10, 1, 'A7:H7');
  FRPRI.BordaCelGeral(Excel, 1, 'A7:H7', 2);
  Excel.WorkBooks[1].sheets[1].cells[7, 2] := dao.Q1.fieldbyname('nom_grupo').AsString;
  cd_fornecedor := dao.Q1.fieldbyname('fornecedor_principal').AsString;
  cd_grupo := dao.Q1.fieldbyname('cod_grupo').AsString;
  FRPRI.MesclaCel(Excel, 1, 'B9:E9');
  Excel.WorkBooks[1].sheets[1].cells[9, 1] := dao.Q1.fieldbyname('cod_produto').AsString;
  Excel.WorkBooks[1].sheets[1].cells[9, 2] := dao.Q1.fieldbyname('nom_produto').AsString;
  Excel.WorkBooks[1].sheets[1].cells[9, 6] := dao.Q1.fieldbyname('preco_venda').AsString;

  linha := 10;

  while not (dao.Q1.Eof) do
  begin
    if cd_fornecedor <> dao.Q1.fieldbyname('fornecedor_principal').AsString then
    begin
      linha := linha + 2;
      FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A' + inttostr(linha) + ':H' + inttostr(linha));
      FRPRI.BordaCelGeral(Excel, 1, 'A' + inttostr(linha) + ':H' + inttostr(linha), 2);
      Excel.WorkBooks[1].sheets[1].cells[linha, 1] := 'Fornecedor';
      Excel.WorkBooks[1].sheets[1].cells[linha, 2] := dao.Q1.fieldbyname('razao_social').AsString;
      cd_fornecedor := dao.Q1.fieldbyname('fornecedor_principal').AsString;
      linha := linha + 1;
    end;

    if cd_grupo <> dao.Q1.fieldbyname('cod_grupo').AsString then
    begin
      linha := linha + 1;
      FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A' + inttostr(linha) + ':H' + inttostr(linha));
      FRPRI.BordaCelGeral(Excel, 1, 'A' + inttostr(linha) + ':H' + inttostr(linha), 2);
      Excel.WorkBooks[1].sheets[1].cells[linha, 1] := 'Grupo:';
      Excel.WorkBooks[1].sheets[1].cells[linha, 2] := dao.Q1.fieldbyname('nom_grupo').AsString;
      cd_grupo := dao.Q1.fieldbyname('cod_grupo').AsString;
      linha := linha + 1;
    end;

    FRPRI.MesclaCel(Excel, 1, 'B' + inttostr(linha) + ':E' + inttostr(linha));
    Excel.WorkBooks[1].sheets[1].cells[linha, 1] := dao.Q1.fieldbyname('cod_produto').AsString;
    Excel.WorkBooks[1].sheets[1].cells[linha, 2] := dao.Q1.fieldbyname('nom_produto').AsString;
    Excel.WorkBooks[1].sheets[1].cells[linha, 6] := dao.Q1.fieldbyname('preco_venda').AsString;

    dao.Q1.Next;

  end;

  // SALVA O DOCUMENTO
  nom_arquivo := 'pauta produto' + '.xls';
  Excel.Visible := true;

end;

procedure TFr_opc_relatorios.relatorio_vendas_fornecedor_loja(c_fornecedor, c_loja: string);
var
  Excel: Variant;
  nom_arquivo: string;
  linha: Integer;
  cod_produto, cd_fornecedor, cd_grupo: string;
  ac_qtd, ac_custo: Real;
  cmd: string;
begin
  if Prempresa.Text = '' then
  begin
    dao.msg('Escolha uma Loja para se Conectar!');
    Prempresa.SetFocus;
    exit;
  end;
  dao.Configura_CN_NET(Prempresa.Text);

  cmd := 'select sum(v2.qtd) as tqtd, sum(p.custo) as tcusto, p.fornecedor_principal, f.razao_social from vendas2 v2 ' + 'left join produto p on p.cod_produto = v2.cod_produto ' + 'left join fornecedor f on f.cod_fornecedor=p.fornecedor_principal ' + 'left join vendas1 v1 on v1.numdoc = v2.numdoc ' + 'where case when v1.FATURADO = ''1'' then v1.DTA_EMISSAO else v1.dtadoc END between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date)) + ' and tipo_venda <> ' + quotedstr('D') + ' and consignacao <>' + quotedstr('1') + ' and orcamento=' + quotedstr('0');

  if edFornecedor.Text <> '' then
    cmd := cmd + 'and (1=1' + fmfun.cmdAux('pro.fornecedor_principal', edFornecedor.Text) + ' or 0 < (SELECT count(*) FROM PRODUTO_FORNECEDOR pf where pf.cod_produto = pro.cod_produto ' + fmfun.cmdAux('pf.cod_fornecedor', edFornecedor.Text) + '))';

  cmd := cmd + ' group by p.fornecedor_principal, f.razao_social ';
  cmd := cmd + ' order by f.razao_social';

  dao.Geral1_NET(cmd);

  DeleteFile(ExtractFilePath(ParamStr(0)) + 'temporario\relatorio de venda por fonecedor e loja.xls');
  Excel := CreateOleObject('Excel.Application');
  Excel.WorkBooks.open(ExtractFilePath(ParamStr(0)) + 'Relatorios\venda_loja_fornecedor.xls');
  Excel.WorkBooks[1].SaveAs(ExtractFilePath(ParamStr(0)) + 'temporario\relatorio de venda por fornecedor e loja.xls');
  Excel.Visible := true;

  Excel.WorkBooks[1].sheets[1].cells[1, 7] := dao.DtaSerStr + ' / ' + dao.HrSer;

  dao.Q1.first;
  ac_qtd := 0;
  ac_custo := 0;

  if Prempresa.Text <> '' then
  begin
    dao.Geral3('select nom_empresa from empresa where cod_empresa=' + quotedstr(Prempresa.Text));
    Excel.WorkBooks[1].sheets[1].cells[2, 2] := 'Período: ' + formatdatetime('dd/mm/yyyy', Prdta_inicial.date) + ' a ' + formatdatetime('dd.mm.yyyy', Prdta_final.date);
    Excel.WorkBooks[1].sheets[1].cells[3, 2] := dao.Q3.fieldbyname('nom_empresa').AsString;
  end;

  FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A5:H5');
  FRPRI.BordaCelGeral(Excel, 1, 'A5:G5', 2);
  Excel.WorkBooks[1].sheets[1].cells[5, 2] := dao.q1_net.fieldbyname('razao_social').AsString;

  cd_fornecedor := dao.q1_net.fieldbyname('fornecedor_principal').AsString;
  Excel.WorkBooks[1].sheets[1].cells[7, 1] := FormatFloat('###,##0.00', dao.q1_net.fieldbyname('tcusto').AsFloat);
  Excel.WorkBooks[1].sheets[1].cells[7, 2] := dao.q1_net.fieldbyname('tqtd').AsString;

  ac_custo := dao.q1_net.fieldbyname('tcusto').AsFloat;
  ac_qtd := dao.q1_net.fieldbyname('tqtd').AsFloat;
  linha := 8;
  dao.q1_net.Next;
  while not (dao.q1_net.Eof) do
  begin
    if cd_fornecedor <> dao.q1_net.fieldbyname('fornecedor_principal').AsString then
    begin
      linha := linha + 1;
      FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A' + inttostr(linha) + ':H' + inttostr(linha));
      FRPRI.BordaCelGeral(Excel, 1, 'A' + inttostr(linha) + ':G' + inttostr(linha), 2);
      Excel.WorkBooks[1].sheets[1].cells[linha, 1] := 'FORNECEDOR:';
      Excel.WorkBooks[1].sheets[1].cells[linha, 2] := dao.q1_net.fieldbyname('razao_social').AsString;
      cd_fornecedor := dao.q1_net.fieldbyname('fornecedor_principal').AsString;
      linha := linha + 1;
      Excel.WorkBooks[1].sheets[1].cells[linha, 1] := 'T.CUSTO';
      Excel.WorkBooks[1].sheets[1].cells[linha, 2] := 'T.QTD';
      linha := linha + 1;
    end;
    Excel.WorkBooks[1].sheets[1].cells[linha, 1] := FormatFloat('###,##0.00', dao.q1_net.fieldbyname('tcusto').AsFloat);
    Excel.WorkBooks[1].sheets[1].cells[linha, 2] := dao.q1_net.fieldbyname('tqtd').AsString;
    ac_custo := ac_custo + dao.q1_net.fieldbyname('tcusto').AsFloat;
    ac_qtd := ac_qtd + dao.q1_net.fieldbyname('tqtd').AsFloat;

    dao.q1_net.Next;
    linha := linha + 1;
  end;
  linha := linha + 2;
  FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A' + inttostr(linha) + ':H' + inttostr(linha));
  Excel.WorkBooks[1].sheets[1].cells[linha, 1] := 'T.CUSTO GERAL: ' + FormatFloat('##,###0.00', ac_custo);
  Excel.WorkBooks[1].sheets[1].cells[linha, 4] := 'T.QTD GERAL: ' + FormatFloat('##,###0.00', ac_qtd);

  // SALVA O DOCUMENTO
  nom_arquivo := 'relatorio de venda por fonecedor e loja' + '.xls';
  Excel.Visible := true;

end;

procedure TFr_opc_relatorios.relatorio_vendas_periodo_data(dta_inicial, dta_final: string);
var
  Excel: Variant;
  data: string;
  ac_data_bruto, ac_data_liquido, desconto_dia: Real;
  ac_total_liquido, ac_total_bruto, desconto_total: Real;
  lin: Integer;
  nom_arquivo: string;
begin
  FORMATSETTINGS.ShortDateFormat := 'dd/mm/yyyy';
  ac_data_bruto := 0;
  ac_total_liquido := 0;
  dao.Geral1('select a.NUMDOC, a.HORA, a.DTADOC, a.COD_CLIENTE, a.COD_USUARIO, ' + 'a.COD_EMPRESA, a.FATURADO, a.CONSIGNACAO, a.ORCAMENTO, ' + 'a.ENTREGUE, a.TOT_BRUTO, a.DESCONTO, a.TOT_LIQUIDO, a.PRAZO_PGTO, ' + 'a.COD_FOP, a.NUM_CUPOM, a.TIPO_VENDA, a.QTD_PARCELAS, a.PONTO_USADO, ' + 'a.USUARIO_DESFATUROU, a.COD_REPRESENTANTE, a.COD_PRAZO_PGTO, a.CUSTO_TOTAL, ' + 'a.LUCRO_MEDIO, a.DTA_EMISSAO, a.DTA_SAIDA, a.EMPRESA_FATURAR, a.NF, ' + 'a.OBSERVACOES_PEDIDO, a.OBSERVACOES_NOTA, a.COD_TRANSPORTADORA, ' +
    'a.TIPO_FRETE, a.VOLUME_NOTA, a.PESO_NOTA, a.COD_CARGA, a.VL_FRETE, ' + 'a.CONTATO_FRETE, a.PED_IMPRESSO, a.DTA_VENCIMENTO_CONSIG, a.CANCELADO, ' + 'a.CONTEM_AVARIA, a.CONTEM_ETIQUETA, a.MOTIVO_TROCA, a.NR_VENDA_ORIGINAL, ' + 'a.PEDIDO, a.VENDA_ENVIADA, a.CREDITO_USADO, a.NR_PEDIDO_PALM, a.BOLETO_ANEXO, ' + 'a.COD_FISCAL, a.VLR_COMISSAO, a.VLR_BC_ICMS, a.VLR_ICMS, a.VLR_ST, ' + 'a.VLR_TOT_NF, a.VLR_BC_ICMS_ST, a.CHAVE_NFE, a.RECIBO_NFE, a.STATUS_NFE, ' +
    'a.MOTIVO_NFE, a.DIGEST_NFE, a.PROTOCOLO_NFE, a.DATA_REC_NFE, a.JUSTIF_CANC_NFE, ' + 'a.COD_SUPERVISOR, a.COD_FORNECEDOR, a.NFE, a.VLR_IPI, a.PALM_NR_CONEXAO, ' + 'a.SINCRONIZAR_PALM, a.NUMDOC_REF, a.FRETE_COMBINADO, a.DT_FRETE_COMBINADO, ' + 'a.EMAIL_NFE, a.EMAIL_PEDIDO, a.PEDIDO_VENDEDOR, a.USUARIO_CHECOU_PEDIDO_VENDEDOR, ' + 'a.CONTA_BOLETO, a.USUARIO_CHECOU_FRETE_COMBINADO, a.ABERTO_USUARIO, ' + 'a.MAQUINA_USUARIO_ABERTO, c.nom_cliente, u.nome from vendas1 a ' +
    'left join cliente c on c.cod_cliente = a.cod_cliente ' + 'left join tbusu u on u.codusu = a.cod_usuario ' + 'where case when a.FATURADO = ''1'' then a.DTA_EMISSAO else a.dtadoc END between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date)) + ' and tipo_venda <> ' + quotedstr('D') + ' and a.consignacao <> ' + quotedstr('1') + ' and a.orcamento=' + quotedstr('0') + ' and a.cod_fop<>' + quotedstr('9') + ' order by dtadoc, c.nom_cliente');

  if dao.Q1.RecordCount <= 0 then
  begin
    dao.msg('Não Foi Encontrado Registros para Gerar o RElatório!');
    exit;
  end;

  DeleteFile(ExtractFilePath(ParamStr(0)) + 'temporario\relatorio vendas agrupado por data.xls');
  Excel := CreateOleObject('Excel.Application');
  Excel.WorkBooks.open(ExtractFilePath(ParamStr(0)) + 'Relatorios\relatorio_vendas_data.xls');
  Excel.WorkBooks[1].SaveAs(ExtractFilePath(ParamStr(0)) + 'temporario\relatorio vendas agrupado por data.xls');
  Excel.Visible := false;

  Excel.WorkBooks[1].sheets[1].cells[1, 2] := nom_empresa;
  Excel.WorkBooks[1].sheets[1].cells[1, 6] := dao.DtaSerStr + ' / ' + dao.HrSer;

  FRPRI.FontCel(Excel, 1, 1, 10, 1, 'A2:F2');
  Excel.WorkBooks[1].sheets[1].cells[2, 2] := 'Relatório de Vendas Agrupado por Data';

  dao.Q1.first;

  FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A4:F4');
  FRPRI.BordaCelGeral(Excel, 1, 'A4:F4', 2);
  Excel.WorkBooks[1].sheets[1].cells[4, 1] := 'DATA: ' + formatdatetime('dd/mm/yyyy', dao.Q1.fieldbyname('dtadoc').AsDateTime);
  Excel.WorkBooks[1].sheets[1].cells[5, 1] := 'Cliente';
  Excel.WorkBooks[1].sheets[1].cells[5, 2] := 'Tot.Bruto';
  Excel.WorkBooks[1].sheets[1].cells[5, 3] := 'Desc.';
  Excel.WorkBooks[1].sheets[1].cells[5, 4] := 'Tot.Liquido';
  Excel.WorkBooks[1].sheets[1].cells[5, 5] := 'Prazo';
  Excel.WorkBooks[1].sheets[1].cells[5, 6] := 'Vendedor';

  data := dao.Q1.fieldbyname('dtadoc').AsString;
  lin := 6;

  while not (dao.Q1.Eof) do
  begin
    if (data <> dao.Q1.fieldbyname('dtadoc').AsString) then
    begin
      lin := lin + 1;
      if ac_data_bruto > 0 then
      begin
        desconto_dia := 100 - ((ac_data_liquido / ac_data_bruto * 100));
        FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A' + inttostr(lin) + ':F' + inttostr(lin));
        FRPRI.BordaCelGeral(Excel, 1, 'A' + inttostr(lin) + ':F' + inttostr(lin), 2);
        Excel.WorkBooks[1].sheets[1].cells[lin, 1] := 'Total Bruto Dia: ' + FormatFloat('##,###0.00', ac_data_bruto) + ' -  Desconto Médio: ' + FormatFloat('###,##0.00', desconto_dia) + '%' + '    - Total Liquido Dia: ' + FormatFloat('###,##0.00', ac_data_liquido);
      end;
      ac_data_bruto := 0;
      ac_data_liquido := 0;
      lin := lin + 2;
      FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A' + inttostr(lin) + ':F' + inttostr(lin));
      FRPRI.BordaCelGeral(Excel, 1, 'A' + inttostr(lin) + ':F' + inttostr(lin), 2);
      Excel.WorkBooks[1].sheets[1].cells[lin, 1] := 'DATA:' + formatdatetime('dd/mm/yyyy', dao.Q1.fieldbyname('dtadoc').AsDateTime);
      ;
      lin := lin + 1;
      Excel.WorkBooks[1].sheets[1].cells[1, lin] := 'Cliente';
      Excel.WorkBooks[1].sheets[1].cells[2, lin] := 'Tot.Bruto';
      Excel.WorkBooks[1].sheets[1].cells[3, lin] := 'Desc.';
      Excel.WorkBooks[1].sheets[1].cells[4, lin] := 'Tot.Liquido';
      Excel.WorkBooks[1].sheets[1].cells[5, lin] := 'Prazo';
      Excel.WorkBooks[1].sheets[1].cells[6, lin] := 'Vendedor';

      data := dao.Q1.fieldbyname('dtadoc').AsString;
      lin := lin + 1;
    end;

    // FRPRI.MesclaCel(Excel,1,'A'+IntToStr(lin)+':'+'C'+IntToStr(lin));
    // FRPRI.AlinhaCel(Excel,1,'A'+IntToStr(lin)+':'+'C'+IntToStr(lin), 1, 1);
    Excel.WorkBooks[1].sheets[1].cells[lin, 1] := copy(dao.Q1.fieldbyname('nom_cliente').AsString, 1, 28);
    Excel.WorkBooks[1].sheets[1].cells[lin, 2] := FormatFloat('###,##0.00', dao.Q1.fieldbyname('tot_bruto').AsFloat);
    Excel.WorkBooks[1].sheets[1].cells[lin, 3] := dao.Q1.fieldbyname('desconto').AsString;
    Excel.WorkBooks[1].sheets[1].cells[lin, 4] := FormatFloat('###,##0.00', dao.Q1.fieldbyname('tot_liquido').AsFloat);
    Excel.WorkBooks[1].sheets[1].cells[lin, 5] := dao.Q1.fieldbyname('prazo_pgto').AsString;
    Excel.WorkBooks[1].sheets[1].cells[lin, 6] := copy(dao.Q1.fieldbyname('nome').AsString, 1, 12);

    lin := lin + 1;
    ac_data_bruto := ac_data_bruto + dao.Q1.fieldbyname('tot_bruto').AsFloat;
    ac_data_liquido := ac_data_liquido + dao.Q1.fieldbyname('tot_liquido').AsFloat;

    if (dao.Q1.fieldbyname('tot_bruto').AsFloat <> 0) or ((dao.Q1.fieldbyname('tot_bruto').AsString = '')) then
      ac_total_bruto := ac_total_bruto + dao.Q1.fieldbyname('tot_bruto').AsFloat;

    if (dao.Q1.fieldbyname('tot_liquido').AsFloat <> 0) or ((dao.Q1.fieldbyname('tot_liquido').AsString = '')) then
      ac_total_liquido := ac_total_liquido + dao.Q1.fieldbyname('tot_liquido').AsFloat;

    dao.Q1.Next;
  end;
  lin := lin + 1;

  if ac_data_bruto > 0 then
  begin
    desconto_dia := 100 - ((ac_data_liquido / ac_data_bruto * 100));
    FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A' + inttostr(lin) + ':F' + inttostr(lin));
    FRPRI.BordaCelGeral(Excel, 1, 'A' + inttostr(lin) + ':F' + inttostr(lin), 2);
    Excel.WorkBooks[1].sheets[1].cells[lin, 1] := 'Total Bruto Dia: ' + FormatFloat('##,###0.00', ac_data_bruto) + ' -  Desconto Médio: ' + FormatFloat('###,##0.00', desconto_dia) + '%' + '    - Total Liquido Dia: ' + FormatFloat('###,##0.00', ac_data_liquido);
  end;

  lin := lin + 2;

  dao.Geral2('select sum(tot_liquido) as total from vendas1 where case when FATURADO = ''1'' then DTA_EMISSAO else dtadoc END between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date)) + ' and tipo_venda <> ' + quotedstr('D') + ' and consignacao <>' + quotedstr('1') + ' and orcamento=' + quotedstr('0'));

  dao.Geral3('select sum(tot_bruto) as totalb from vendas1 where case when FATURADO = ''1'' then DTA_EMISSAO else dtadoc END between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date)) + ' and tipo_venda <> ' + quotedstr('D') + ' and consignacao <>' + quotedstr('1') + ' and orcamento=' + quotedstr('0'));

  if dao.Q3.fieldbyname('totalb').AsFloat > 0 then
    desconto_total := 100 - ((dao.q2.fieldbyname('total').AsFloat / dao.Q3.fieldbyname('totalb').AsFloat * 100));
  Excel.WorkBooks[1].sheets[1].cells[lin, 1] := 'Total Bruto Geral: ' + FormatFloat('###,##0.00', dao.Q3.fieldbyname('totalb').AsFloat) + '   - descontop Geral: ' + FormatFloat('###,##0.00', desconto_total) + '    - Total Liquido Geral: ' + FormatFloat('###,##0.00', dao.q2.fieldbyname('total').AsFloat);
  // Excel.WorkBooks[1].Sheets[1].Cells[lin,3]:= FormatFloat('##,###0.00', dao.Q2.fieldbyname('total').AsFloat);
  // SALVA O DOCUMENTO
  nom_arquivo := 'relatorio vendas data' + '.xls';

  Excel.Visible := true;
  Excel.WorkBooks[1].printpreview;

end;

procedure TFr_opc_relatorios.Prcod_fornecedorExit(Sender: TObject);
begin
  if trim(Prcod_fornecedor.Text) = '' then
    Lbfornecedor.Caption := '...';

  if Prcod_fornecedor.Text <> '' then
  begin
    if (not fmfun.verificaNumerico(Prcod_fornecedor.Text)) and (length(Prcod_fornecedor.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      Prcod_fornecedor.SetFocus;
      exit;
    end;

    dao.Geral2('select razao_social from fornecedor where cod_fornecedor=' + quotedstr(Prcod_fornecedor.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbfornecedor.Caption := dao.q2.fieldbyname('razao_social').AsString;
      if edFornecedor.Text = '' then
        edFornecedor.Text := Prcod_fornecedor.Text
      else
        edFornecedor.Text := Prcod_fornecedor.Text + ';' + edFornecedor.Text;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_fornecedor.Text := '';
      Prcod_fornecedor.SetFocus;
      exit;
    end;

  end;

end;

procedure TFr_opc_relatorios.PrempresaExit(Sender: TObject);
begin
  if trim(Prempresa.Text) = '' then
    Lbempresa.Caption := '...';

  if Prempresa.Text <> '' then
  begin
    dao.Geral2('select nom_empresa from empresa where cod_empresa=' + quotedstr(Prempresa.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbempresa.Caption := dao.q2.fieldbyname('nom_empresa').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prempresa.Text := '';
      Prempresa.SetFocus;
      exit;
    end;

  end;

end;

procedure TFr_opc_relatorios.PrufExit(Sender: TObject);
begin
  if trim(Pruf.Text) = '' then
    lbuf.Caption := '...';

  if Pruf.Text <> '' then
  begin
    dao.Geral2('select uf from uf where uf=' + quotedstr(Pruf.Text));
    if dao.q2.RecordCount > 0 then
    begin
      lbuf.Caption := dao.q2.fieldbyname('uf').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Pruf.Text := '';
      Pruf.SetFocus;
      exit;
    end;

  end;

end;

procedure TFr_opc_relatorios.relatorio_consig(c_cliente: string; dta_inicial: string; dta_final: string);
begin
  with dm.Q_consignacao do
  begin
    close;
    sql.clear;
    sql.add('SELECT V2.COD_PRODUTO, v2.COD_CLIENTE, ID_COR, ID_TAMANHO, QTD, PRECO, SUB_TOTAL, p.nom_produto,c.cor ' + ',t.tamanho,cl.nom_cliente, v1.dta_vencimento_consig, v2.numdoc, v1.cod_fop, fp.nom_fop, v1.dtadoc, v1.desconto, v1.qtd_parcelas, v2.qtd_devolvida, v1.prazo_pgto, v1.tot_liquido,usu.logusu FROM VENDAS2 v2 ' + 'left join vendas1 v1 on v1.numdoc = v2.numdoc ' + 'left join fop fp on fp.cod_fop = v1.cod_fop ' + 'LEFT JOIN PRODUTO P ON P.COD_PRODUTO = V2.COD_PRODUTO ' +
      'left join cores c on c.id = v2.id_cor ' + 'left join tamanho t on t.id = v2.id_tamanho ' + 'left join cliente cl on cl.cod_cliente=v2.cod_cliente ' + 'left join tbusu usu on usu.codusu=v1.cod_usuario ' + 'where case when v1.FATURADO = ''1'' then v1.DTA_EMISSAO else v1.dtadoc END between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date)) + ' and v1.consignacao=' + quotedstr('1'));

    if edCliente.Text <> '' then
      sql.add(fmfun.cmdAux('v1.cod_cliente', edCliente.Text));

    if Prempresa.Text <> '' then
      sql.add(' and v1.empresa_faturar = ' + quotedstr(cod_empresa));

    sql.add(' order by v2.cod_cliente, v2.dtadoc ');
    open;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\relatorio_consignacao.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.relatorio_posicao_estoque_completo_simulada(c_fornecedor: string);
var
  Excel: Variant;
  nom_arquivo: string;
  linha: Integer;
  cod_produto, cd_fornecedor: string;
  ac_qtd, ac_qtd_forn, ac_custo, ac_venda: Real;
  cmd: string;
  qtd_entrada, qtd_venda, qtd_acerto: string;
begin
  cmd := 'select pro.cod_produto, pro.nom_produto, pro.grade, pro.qtd_estoque,pro.custo, pro.preco_venda,f.razao_social, pro.fornecedor_principal, ' + 'pro.cod_grupo, cr.cor , tm.tamanho, cr.cor, gd.id_cor, gd.id_tamanho, gd.est_individual from produto pro ' + 'left join grade gd on gd.cod_produto=pro.cod_produto ' + 'left join cores cr on cr.id=gd.id_cor ' + 'left join tamanho tm on tm.id=gd.id_tamanho ' + 'left join fornecedor f on f.cod_fornecedor = pro.fornecedor_principal ';

  if (not (PRmostrar_produto_estoque_zerado.Checked)) or (Prcod_fornecedor.Text <> '') then
    cmd := cmd + 'where 1 = 1 ';

  if rbRevenda.Checked then
    cmd := cmd + ' and pro.revenda = ''S''';

  if rbOutros.Checked then
    cmd := cmd + ' and pro.revenda = ''N''';

  if rbAtivo.Checked then
    cmd := cmd + ' and pro.status <> ' + quotedstr('S');

  if rbInativo.Checked then
    cmd := cmd + ' and pro.status = ' + quotedstr('S');

  if rbPromocao.Checked then
    cmd := cmd + ' and pro.promocao = ''S''';

  if rbIndisponivel.Checked then
    cmd := cmd + ' and pro.indisponivel = ''S''';

  if rbDisponivel.Checked then
    cmd := cmd + ' and pro.indisponivel = ''N''';

  if not (PRmostrar_produto_estoque_zerado.Checked) then
    cmd := cmd + ' and pro.qtd_estoque > 0 ';

  if PrMostrarProdutosAbaixoEstoqueMinimo.Checked then
    cmd := cmd + ' and pro.QTD_ESTOQUE < pro.ESTOQUE_MINIMO ';

  if c_fornecedor <> '' then
  begin
    if (c_fornecedor <> '') and (not (PRmostrar_produto_estoque_zerado.Checked)) then
      cmd := cmd + ' and pro.fornecedor_principal = ' + quotedstr(c_fornecedor) + ' or 0 < (SELECT count(*) FROM PRODUTO_FORNECEDOR pf where pf.cod_produto = pro.cod_produto ' + fmfun.cmdAux('pf.cod_fornecedor', edFornecedor.Text) + ')'
    else
      cmd := cmd + ' and pro.fornecedor_principal = ' + quotedstr(c_fornecedor) + ' or 0 < (SELECT count(*) FROM PRODUTO_FORNECEDOR pf where pf.cod_produto = pro.cod_produto ' + fmfun.cmdAux('pf.cod_fornecedor', edFornecedor.Text) + ')';
  end;
  cmd := cmd + ' order by f.razao_social, pro.ORD_PAUTA, pro.nom_produto';

  dao.Geral1(cmd);

  Excel := CreateOleObject('Excel.Application');
  DeleteFile(ExtractFilePath(ParamStr(0)) + 'temporario\posicao estoque completa.xls');
  Excel.WorkBooks.open(ExtractFilePath(ParamStr(0)) + 'Relatorios\posicao_estoque_completa.xls');
  Excel.WorkBooks[1].SaveAs(ExtractFilePath(ParamStr(0)) + 'temporario\posicao estoque completa.xls');
  Excel.Visible := false;

  Excel.WorkBooks[1].sheets[1].cells[2, 2] := dao.DtaSerStr + ' / ' + dao.HrSer;

  dao.Q1.first;

  // FRPRI.FontCel(Excel,1,3,10,0,'A6:A:9');
  FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A6:H6');
  Excel.WorkBooks[1].sheets[1].cells[6, 2] := dao.Q1.fieldbyname('razao_social').AsString;
  Excel.WorkBooks[1].sheets[1].cells[7, 2] := dao.Q1.fieldbyname('nom_produto').AsString;
  Excel.WorkBooks[1].sheets[1].cells[7, 8] := dao.Q1.fieldbyname('qtd_estoque').AsString;
  Excel.WorkBooks[1].sheets[1].cells[8, 1] := 'Custo:';
  Excel.WorkBooks[1].sheets[1].cells[8, 2] := FormatFloat('###,##0.00', dao.Q1.fieldbyname('custo').AsFloat);
  Excel.WorkBooks[1].sheets[1].cells[8, 3] := 'Tot.Custo:';
  Excel.WorkBooks[1].sheets[1].cells[8, 4] := FormatFloat('###,##0.00', dao.Q1.fieldbyname('custo').AsFloat * dao.Q1.fieldbyname('qtd_estoque').AsFloat);
  Excel.WorkBooks[1].sheets[1].cells[8, 5] := 'Venda:';
  Excel.WorkBooks[1].sheets[1].cells[8, 6] := FormatFloat('###,##0.00', dao.Q1.fieldbyname('preco_venda').AsFloat);
  Excel.WorkBooks[1].sheets[1].cells[8, 7] := 'Tot.Venda:';
  Excel.WorkBooks[1].sheets[1].cells[8, 8] := FormatFloat('###,##0.00', dao.Q1.fieldbyname('preco_venda').AsFloat * dao.Q1.fieldbyname('qtd_estoque').AsFloat);

  ac_qtd := 0;
  ac_qtd_forn := 0;

  ac_qtd := dao.Q1.fieldbyname('qtd_estoque').AsFloat;
  ac_qtd_forn := dao.Q1.fieldbyname('qtd_estoque').AsFloat;
  cod_produto := dao.Q1.fieldbyname('cod_produto').AsString;
  cd_fornecedor := dao.Q1.fieldbyname('fornecedor_principal').AsString;
  ac_custo := ac_custo + dao.Q1.fieldbyname('custo').AsFloat * dao.Q1.fieldbyname('qtd_estoque').AsFloat;
  ac_venda := ac_venda + dao.Q1.fieldbyname('preco_venda').AsFloat * dao.Q1.fieldbyname('qtd_estoque').AsFloat;
  linha := 10;

  while not (dao.Q1.Eof) do
  begin
    if cd_fornecedor <> dao.Q1.fieldbyname('fornecedor_principal').AsString then
    begin
      linha := linha + 1;
      if cd_fornecedor <> '' then
      begin
        FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A' + inttostr(linha) + ':H' + inttostr(linha));
        Excel.WorkBooks[1].sheets[1].cells[linha, 1] := 'Qtd. Total Fornecedor:';
        dao.Geral2('select sum(qtd_estoque) as totfor from produto where fornecedor_principal= ' + quotedstr(cd_fornecedor));
      end;
      Excel.WorkBooks[1].sheets[1].cells[linha, 3] := dao.q2.fieldbyname('totfor').AsString;
      ac_qtd_forn := 0;
      linha := linha + 2;
      FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A' + inttostr(linha) + ':H' + inttostr(linha));
      Excel.WorkBooks[1].sheets[1].cells[linha, 1] := 'Fornecedor:';
      Excel.WorkBooks[1].sheets[1].cells[linha, 2] := dao.Q1.fieldbyname('razao_social').AsString;
      linha := linha + 1;
      Excel.WorkBooks[1].sheets[1].cells[linha, 1] := 'Produto:';
      Excel.WorkBooks[1].sheets[1].cells[linha, 2] := dao.Q1.fieldbyname('nom_produto').AsString;
      Excel.WorkBooks[1].sheets[1].cells[linha, 7] := 'Qtd.Produto:';
      Excel.WorkBooks[1].sheets[1].cells[linha, 8] := dao.Q1.fieldbyname('qtd_estoque').AsString;
      linha := linha + 1;
      Excel.WorkBooks[1].sheets[1].cells[linha, 1] := 'Custo:';
      Excel.WorkBooks[1].sheets[1].cells[linha, 2] := FormatFloat('###,##0.00', dao.Q1.fieldbyname('custo').AsFloat);
      Excel.WorkBooks[1].sheets[1].cells[linha, 3] := 'Tot.Custo:';
      Excel.WorkBooks[1].sheets[1].cells[linha, 4] := FormatFloat('###,##0.00', dao.Q1.fieldbyname('custo').AsFloat * dao.Q1.fieldbyname('qtd_estoque').AsFloat);
      Excel.WorkBooks[1].sheets[1].cells[linha, 5] := 'Venda:';
      Excel.WorkBooks[1].sheets[1].cells[linha, 6] := FormatFloat('###,##0.00', dao.Q1.fieldbyname('preco_venda').AsFloat);
      Excel.WorkBooks[1].sheets[1].cells[linha, 7] := 'Tot.Venda:';
      Excel.WorkBooks[1].sheets[1].cells[linha, 8] := FormatFloat('###,##0.00', dao.Q1.fieldbyname('preco_venda').AsFloat * dao.Q1.fieldbyname('qtd_estoque').AsFloat);
      linha := linha + 1;
      // cabeçalho
      if dao.Q1.fieldbyname('grade').AsString = '0' then
      begin
        Excel.WorkBooks[1].sheets[1].cells[linha, 1] := 'Cor';
        Excel.WorkBooks[1].sheets[1].cells[linha, 2] := 'Tamanho';
        Excel.WorkBooks[1].sheets[1].cells[linha, 3] := 'Qtd';
        linha := linha + 1;
      end;
      // final cabeçalho

      cod_produto := dao.Q1.fieldbyname('cod_produto').AsString;
      cd_fornecedor := dao.Q1.fieldbyname('fornecedor_principal').AsString;
    end;

    if cod_produto <> dao.Q1.fieldbyname('cod_produto').AsString then
    begin
      // linha:= linha+1;

      FRPRI.FontCel(Excel, 1, 1, 10, 1, 'A' + inttostr(linha) + ':H' + inttostr(linha));
      Excel.WorkBooks[1].sheets[1].cells[linha, 1] := 'Produto:';
      Excel.WorkBooks[1].sheets[1].cells[linha, 2] := dao.Q1.fieldbyname('nom_produto').AsString;
      Excel.WorkBooks[1].sheets[1].cells[linha, 7] := 'Qtd.Produto:';
      Excel.WorkBooks[1].sheets[1].cells[linha, 8] := dao.Q1.fieldbyname('qtd_estoque').AsString;
      linha := linha + 1;
      Excel.WorkBooks[1].sheets[1].cells[linha, 1] := 'Custo:';
      Excel.WorkBooks[1].sheets[1].cells[linha, 2] := FormatFloat('###,##0.00', dao.Q1.fieldbyname('custo').AsFloat);
      Excel.WorkBooks[1].sheets[1].cells[linha, 3] := 'Tot.Custo:';
      Excel.WorkBooks[1].sheets[1].cells[linha, 4] := FormatFloat('###,##0.00', dao.Q1.fieldbyname('custo').AsFloat * dao.Q1.fieldbyname('qtd_estoque').AsFloat);
      Excel.WorkBooks[1].sheets[1].cells[linha, 5] := 'Venda:';
      Excel.WorkBooks[1].sheets[1].cells[linha, 6] := FormatFloat('###,##0.00', dao.Q1.fieldbyname('preco_venda').AsFloat);
      Excel.WorkBooks[1].sheets[1].cells[linha, 7] := 'Tot.Venda:';
      Excel.WorkBooks[1].sheets[1].cells[linha, 8] := FormatFloat('###,##0.00', dao.Q1.fieldbyname('preco_venda').AsFloat * dao.Q1.fieldbyname('qtd_estoque').AsFloat);
      linha := linha + 1;
      ac_custo := ac_custo + dao.Q1.fieldbyname('custo').AsFloat * dao.Q1.fieldbyname('qtd_estoque').AsFloat;
      ac_venda := ac_venda + dao.Q1.fieldbyname('preco_venda').AsFloat * dao.Q1.fieldbyname('qtd_estoque').AsFloat;

      cod_produto := dao.Q1.fieldbyname('cod_produto').AsString;

      if dao.Q1.fieldbyname('grade').AsString = '0' then
      begin
        Excel.WorkBooks[1].sheets[1].cells[linha, 1] := 'Cor';
        Excel.WorkBooks[1].sheets[1].cells[linha, 2] := 'Tamanho';
        Excel.WorkBooks[1].sheets[1].cells[linha, 3] := 'Qtd';
        linha := linha + 1;
      end;
    end;

    Excel.WorkBooks[1].sheets[1].cells[linha, 1] := dao.Q1.fieldbyname('cor').AsString;
    Excel.WorkBooks[1].sheets[1].cells[linha, 2] := dao.Q1.fieldbyname('tamanho').AsString;
    Excel.WorkBooks[1].sheets[1].cells[linha, 3] := dao.Q1.fieldbyname('est_individual').AsString;
    ac_qtd_forn := ac_qtd_forn + dao.Q1.fieldbyname('qtd_estoque').AsFloat;
    ac_qtd := ac_qtd + dao.Q1.fieldbyname('qtd_estoque').AsFloat;
    linha := linha + 1;

    dao.Q1.Next;
  end;

  if cd_fornecedor <> '' then
  begin
    FRPRI.FontCel(Excel, 1, 3, 10, 1, 'A' + inttostr(linha) + ':H' + inttostr(linha));
    Excel.WorkBooks[1].sheets[1].cells[linha, 1] := 'Qtd. Total Fornecedor:';
    dao.Geral2('select sum(qtd_estoque) as totfor from produto where fornecedor_principal= ' + quotedstr(cd_fornecedor));
    Excel.WorkBooks[1].sheets[1].cells[linha, 3] := dao.q2.fieldbyname('totfor').AsString;
    linha := linha + 1;
  end;

  Excel.WorkBooks[1].sheets[1].cells[linha, 1] := 'Qtd Total de Peças:';
  Excel.WorkBooks[1].sheets[1].cells[linha, 3] := ac_qtd;
  Excel.WorkBooks[1].sheets[1].cells[linha, 5] := 'P. Custo Total :' + FormatFloat('###,##0.00', ac_custo);
  Excel.WorkBooks[1].sheets[1].cells[linha, 7] := 'P. Venda Total :' + FormatFloat('###,##0.00', ac_venda);

  // SALVA O DOCUMENTO
  Excel.Visible := true;

end;

procedure TFr_opc_relatorios.relatorio_posicao_estoque_completo_simplificado(c_fornecedor: string);
var
  cmd: string;
  Excel: Variant;
  i: Integer;
begin
  cmd := 'select f.razao_social, m.nom_marca,  sum(qtd_estoque) as t_estoque, sum(custo) as t_custo, sum(preco_venda) as t_venda from produto p ' +
         'left join fornecedor f on f.cod_fornecedor = p.fornecedor_principal ' +
         'left join marcas m on m.id = p.id_marca ';

  if (not (PRmostrar_produto_estoque_zerado.Checked)) or (Prcod_fornecedor.Text <> '') then
    cmd := cmd + 'where 1 = 1 ';

  if rbRevenda.Checked then
    cmd := cmd + ' and p.revenda = ''S''';

  if rbOutros.Checked then
    cmd := cmd + ' and p.revenda = ''N''';

  if rbAtivo.Checked then
    cmd := cmd + ' and p.status <> ' + quotedstr('S');

  if rbInativo.Checked then
    cmd := cmd + ' and p.status = ' + quotedstr('S');

  if rbPromocao.Checked then
    cmd := cmd + ' and p.promocao = ''S''';

  if rbIndisponivel.Checked then
    cmd := cmd + ' and p.indisponivel = ''S''';

  if rbDisponivel.Checked then
    cmd := cmd + ' and p.indisponivel = ''N''';

  if not (PRmostrar_produto_estoque_zerado.Checked) then
    cmd := cmd + ' and p.qtd_estoque > 0 ';

  if PrMostrarProdutosAbaixoEstoqueMinimo.Checked then
    cmd := cmd + ' and p.QTD_ESTOQUE < p.ESTOQUE_MINIMO ';

  { if c_fornecedor <> '' then
    begin
    if (c_fornecedor <> '') and (not(PRmostrar_produto_estoque_zerado.Checked)) then
    cmd:= cmd + ' and pro.fornecedor_principal = '+ QuotedStr(c_fornecedor)
    else
    cmd:= cmd + ' pro.fornecedor_principal = '+ QuotedStr(c_fornecedor);
    end; }

  cmd := cmd + 'group by f.razao_social, p.ORD_PAUTA, m.nom_marca ';

  cmd := cmd + ' order by nom_marca ';

  dao.Geral1(cmd);

  Excel := CreateOleObject('Excel.Application');
  DeleteFile(ExtractFilePath(ParamStr(0)) + 'temporario\posicao estoque simplificada.xls');
  Excel.WorkBooks.open(ExtractFilePath(ParamStr(0)) + 'Relatorios\doc_padrao.xls');
  Excel.WorkBooks[1].SaveAs(ExtractFilePath(ParamStr(0)) + 'temporario\posicao estoque simplificada.xls');
  Excel.Visible := false;

  Excel.WorkBooks[1].sheets[1].cells[2, 1] := dao.DtaSerStr + ' / ' + dao.HrSer;

  Excel.WorkBooks[1].sheets[1].cells[2, 2] := nom_empresa;
  Excel.WorkBooks[1].sheets[1].cells[3, 2] := 'POSIÇÃO ESTOQUE SIMPLIFICADA POR MARCA';

  FRPRI.BordaCelGeral(Excel, 1, 'A5:E5', 1);
  Excel.WorkBooks[1].sheets[1].cells[5, 1] := 'FORNECEDOR';
  Excel.WorkBooks[1].sheets[1].cells[5, 2] := 'MARCA';
  Excel.WorkBooks[1].sheets[1].cells[5, 3] := ' QTD. ESTOQUE';
  // Excel.WorkBooks[1].sheets[1].cells[5,4]:= ' T. CUSTO';
  // Excel.WorkBooks[1].sheets[1].cells[5,5]:= ' T. VENDA';
  i := 6;
  dao.Q1.first;
  while not (dao.Q1.Eof) do
  begin
    Excel.WorkBooks[1].sheets[1].cells[i, 1] := dao.Q1.fieldbyname('razao_social').AsString;
    Excel.WorkBooks[1].sheets[1].cells[i, 2] := dao.Q1.fieldbyname('nom_marca').AsString;
    FRPRI.AlinhaCel(Excel, 1, 'C' + inttostr(i) + ':E' + inttostr(i), 2, 4);
    Excel.WorkBooks[1].sheets[1].cells[i, 3] := dao.Q1.fieldbyname('t_estoque').AsString;
    // Excel.WorkBooks[1].Sheets[1].Cells[i,4]:= FormatFloat('##,###0.00', dao.Q1.FieldByName('t_custo').AsFloat);
    // Excel.WorkBooks[1].Sheets[1].Cells[i,5]:= FormatFloat('##,###0.00', dao.Q1.FieldByName('t_venda').AsFloat);
    i := i + 1;
    dao.Q1.Next;
  end;
  Excel.Visible := true;

end;

procedure TFr_opc_relatorios.Prcod_marcaButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Marca';

  chamou_pesquisa := 'fr_marca';
  chamou_form := 'fr_opc_relatorio_marca';
  chamou_cadastro := 'fr_marca';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Marcas';

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';

  for i := 0 to 1 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.add(valor_combo);
  end;

  Fr_localizar.CBcampos.ItemIndex := 1;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  Prcod_marca.SetFocus;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_opc_relatorios.Prcod_marcaExit(Sender: TObject);
begin
  if trim(Prcod_marca.Text) = '' then
    Lbnom_marca.Caption := '...';

  if Prcod_marca.Text <> '' then
  begin
    dao.Geral2('select nom_marca from marcaS where ID=' + quotedstr(Prcod_marca.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_marca.Caption := dao.q2.fieldbyname('nom_marca').AsString;
      if ed_marca.Text = '' then
        ed_marca.Text := Prcod_marca.Text
      else
        ed_marca.Text := ed_marca.Text + ';' + Prcod_marca.Text;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_marca.Text := '';
      Prcod_marca.SetFocus;
      exit;
    end;
  end;

end;

procedure TFr_opc_relatorios.Prcod_marcaKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  chamou_form_old, chamou_pesquisa_old: string;
begin
  if not (Key in ['0'..'9', #8]) and (Key <> #13) then
  begin
    beep; { somente delphi 2.0 ou > }
    Key := #0;
  end;

  if Key = #13 then
  begin
    if (Prcod_grupo.Text = '') then
    begin
      // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa

      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Marca';

      chamou_pesquisa := 'fr_marca';
      chamou_form := 'fr_opc_relatorio_marca';
      chamou_cadastro := 'fr_marca';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Marcas';

      // preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo, 3);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Nome';

      for i := 0 to 1 do
      begin
        valor_combo := Campos_combo[i];
        Fr_localizar.CBcampos.Items.add(valor_combo);
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
    Key := #0;
  end;

end;

procedure TFr_opc_relatorios.relatorio_notas_entradas_detalhada(dta_inicial, dta_final, cod_for, cod_marca, cod_grupo: string);
begin
  with dm.q_entradas do
  begin
    close;
    sql.clear;
    sql.add('select e1.nr_documento,e1.dta_documento, e1.cod_fornecedor, fp.fantasia as fantasia_produto, p.custo as custo_produto,' + 'e.nom_empresa, e1.empresa_destino, e1.cod_fiscal, e1.tot_itens, e1.vl_total,' + 'e2.cod_produto, e2.custo, e2.qtd_entrada, e2.id_cor, e2.id_tamanho, e2.cod_colecao, e2.sub_total,' + 'f.razao_social,p.ref_fabrica, f.fantasia, p.nom_produto, cr.cor, tm.tamanho, cl.descricao as nom_colecao,' + 'm.nom_marca from entrada2 e2 ' +
      'left join entrada1 e1 on (e1.nr_documento=e2.nr_documento) and (e1.cod_fornecedor=e2.cod_fornecedor) ' + 'left join fornecedor f on f.cod_fornecedor=e1.cod_fornecedor ' + 'left join produto p on p.cod_produto=e2.cod_produto ' + 'left join cores cr on cr.id=e2.id_cor ' + 'left join tamanho tm on tm.id=e2.id_tamanho ' + 'left join colecao cl on cl.id=e2.cod_colecao ' + 'left join marcas m on m.id=p.id_marca ' + 'left join empresa e on e.cod_empresa = e1.empresa_destino ' +
      'left join fornecedor fp on fp.cod_fornecedor=p.fornecedor_principal ' + 'where dta_documento between ' + quotedstr(formatdatetime('dd.mm.yyyy', strtodate(dta_inicial))) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', strtodate(dta_final))) + ' and (cod_fiscal=' + quotedstr('2102') + ' or cod_fiscal=' + quotedstr('1102') + ')');

    if edFornecedor.Text <> '' then
      sql.add(fmfun.cmdAux('e1.cod_fornecedor', edFornecedor.Text));

    if cod_marca <> '' then
      sql.add(' and p.id_marca=' + quotedstr(cod_marca));

    if cod_grupo <> '' then
      sql.add(' and p.cod_grupo=' + quotedstr(cod_grupo));

    if edProduto.Text <> '' then
      sql.add(fmfun.cmdAux('p.cod_produto', edProduto.Text));

    sql.add(' order by f.razao_social, e2.nr_documento ');
    open;
  end;
  if dm.q_entradas.RecordCount <= 0 then
  begin
    dao.msg('Não foi Encontrado Dados para Gerar o Relatório!');
    exit;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\notas_entrada_detalhada.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;

  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.fR_RELATORIOGetValue(const VarName: string; var Value: Variant);
begin

  if mform = 'posicao_estoque_simplificada' then
  begin
  end
  else if tipo_relatorio = 'vendas_geral' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa;

    if VarName = 'dtaini' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_inicial.date)
    else if VarName = 'dtafin' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_final.date);

  end
  else if tipo_relatorio = 'cr_baixadas' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa;

    if VarName = 'dtaini' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_inicial.date)
    else if VarName = 'dtafin' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_final.date);

  end
  else if tipo_relatorio = 'ranking_vendas' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa;

    if VarName = 'dtaini' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_inicial.date)
    else if VarName = 'dtafin' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_final.date);

  end
  else if tipo_relatorio = 'ranking_vendas_completo' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa;

    if VarName = 'MesAno' then
      Value := cbMes.Text;
  end
  else if tipo_relatorio = 'televendas_cidade' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa;
    if VarName = 'televendas' then
      Value := lbsupervisor.Caption;
  end
  else if tipo_relatorio = 'comparativo_tablet' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa;

    if VarName = 'dtaini' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_inicial.date)
    else if VarName = 'dtafin' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_final.date)
  end
  else if tipo_relatorio = 'metas_diarias' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa;

    if VarName = 'dtaini' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_inicial.date)
    else if VarName = 'dtafin' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_final.date)
  end
  else if tipo_relatorio = 'metas_mensais' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa;

    if VarName = 'dtaini' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_inicial.date)
    else if VarName = 'dtafin' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_final.date)
  end
  else if tipo_relatorio = 'Plano Contas' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa;

    if VarName = 'dtaini' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_inicial.date)
    else if VarName = 'dtafin' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_final.date)
  end
  else if tipo_relatorio = 'Extrato' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa;

    if VarName = 'dtaini' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_inicial.date)
    else if VarName = 'dtafin' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_final.date)
  end
  else if tipo_relatorio = 'produto_calculo_preco_venda' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa;
  end
  else if tipo_relatorio = 'lista_func_cc' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa;
  end
  else if tipo_relatorio = 'cheque_terceiros' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa;
  end
  else if tipo_relatorio = 'relatorio_aniversariantes' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa
  end
  else if tipo_relatorio = 'relatorio_aniversariantes' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa
  end
  else if tipo_relatorio = 'relatorio_representante' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa
  end
  else if tipo_relatorio = 'relatorio_transportadora' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa
  end
  else if tipo_relatorio = 'relatorio_cliente_completo' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa
  end
  else if tipo_relatorio = 'contas_pagar' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa
    else if VarName = 'dtaini' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_inicial.date)
    else if VarName = 'dtafin' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_final.date)
  end
  else if tipo_relatorio = 'vendas_periodo_cliente' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa
    else if VarName = 'dtaini' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_inicial.date)
    else if VarName = 'dtafin' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_final.date)
  end
  else if tipo_relatorio = 'relatorio_consignacao' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa
    else if VarName = 'dtaini' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_inicial.date)
    else if VarName = 'dtafin' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_final.date)
  end
  else if tipo_relatorio = 'televendas' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa
    else if VarName = 'dtaini' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_inicial.date)
    else if VarName = 'dtafin' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_final.date)
  end
  else if tipo_relatorio = 'vendas_padrao' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa
    else if VarName = 'dtaini' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_inicial.date)
    else if VarName = 'dtafin' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_final.date)
    else if VarName = 'TipUsu' then
      Value := FRPRI.TipUsu;
  end
  else if tipo_relatorio = 'ranking_produtos' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa
    else if VarName = 'dtaini' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_inicial.date)
    else if VarName = 'dtafin' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_final.date)
  end
  else if tipo_relatorio = 'pedidos_vendedor' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa
    else if VarName = 'dtaini' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_inicial.date)
    else if VarName = 'dtafin' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_final.date)
  end
  else if tipo_relatorio = 'palm' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa
    else if VarName = 'dtaini' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_inicial.date)
    else if VarName = 'dtafin' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_final.date)
  end
  else if tipo_relatorio = 'comissoes_novo' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa
    else if VarName = 'dtaini' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_inicial.date)
    else if VarName = 'dtafin' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_final.date)
  end
  else if tipo_relatorio = 'prateleira' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa;
  end
  else if (tipo_relatorio = 'comissoes_novo_simplificado') or (tipo_relatorio = 'comissao_comparativo') then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa
    else if VarName = 'dtaini' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_inicial.date)
    else if VarName = 'dtafin' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_final.date)
  end
  else if tipo_relatorio = 'comissoes_novo_detalhado' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa
    else if VarName = 'dtaini' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_inicial.date)
    else if VarName = 'dtafin' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_final.date)
  end
  else if tipo_relatorio = 'relatorio_pedidos_desfaturados' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa
    else if VarName = 'dtaini' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_inicial.date)
    else if VarName = 'dtafin' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_final.date)
  end
  else if tipo_relatorio = 'Fornecedor' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa;
  end
  else if tipo_relatorio = 'comissoes_desconto' then
  begin
    if VarName = 'filtro' then
    begin
      if rbApenasSupervisao.Checked then
        Value := 'Com Televendas'
      else if rbSemSupervisao.Checked then
        Value := 'Sem Televendas'
      else
        Value := '';
    end
    else if VarName = 'empresa' then
      Value := nom_empresa
    else if VarName = 'dtaini' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_inicial.date)
    else if VarName = 'dtafin' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_final.date)
  end
  else if tipo_relatorio = 'comissoes' then
  begin
    if VarName = 'filtro' then
    begin
      if rbApenasSupervisao.Checked then
        Value := 'Com Televendas'
      else if rbSemSupervisao.Checked then
        Value := 'Sem Televendas'
      else
        Value := '';
    end
    else if VarName = 'empresa' then
      Value := nom_empresa
    else if VarName = 'dtaini' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_inicial.date)
    else if VarName = 'dtafin' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_final.date)
  end
  else if tipo_relatorio = 'teto_faturamento' then
  begin
    if VarName = 'filtro' then
    begin
      if rbApenasSupervisao.Checked then
        Value := 'Com Televendas'
      else if rbSemSupervisao.Checked then
        Value := 'Sem Televendas'
      else
        Value := '';
    end
    else if VarName = 'empresa' then
      Value := nom_empresa
    else if VarName = 'dtaini' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_inicial.date)
    else if VarName = 'dtafin' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_final.date)
  end
  else if tipo_relatorio = 'supervisao' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa
    else if VarName = 'dtaini' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_inicial.date)
    else if VarName = 'dtafin' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_final.date)
  end
  else if tipo_relatorio = 'controle_fretes_transportadora' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa
    else if VarName = 'dtaini' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_inicial.date)
    else if VarName = 'dtafin' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_final.date)
  end
  else if tipo_relatorio = 'relatorio_notas_entrada_detalhado' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa
    else if VarName = 'dtaini' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_inicial.date)
    else if VarName = 'dtafin' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_final.date)
  end
  else if tipo_relatorio = 'relatorio_notas_entrada' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa
    else if VarName = 'dtaini' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_inicial.date)
    else if VarName = 'dtafin' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_final.date)
  end
  else if tipo_relatorio = 'relatorio_cliente_completo' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa
  end
  else if tipo_relatorio = 'produto_ncm' then
  begin
    if VarName = 'empresa' then
    begin
      Value := nom_empresa;
    end;
    if VarName = 'email' then
    begin
      Value := email_empresa + '     -      ' + home_page;
    end;
  end
  else if (tipo_relatorio = 'produto_ncm_st') or (tipo_relatorio = 'produto_ncm_st_completo') then
  begin
    if VarName = 'empresa' then
    begin
      Value := nom_empresa;
    end;
    if VarName = 'email' then
    begin
      Value := email_empresa + '     -      ' + home_page;
    end;
  end
  else if tipo_relatorio = 'produto_desconto_especial' then
  begin
    if VarName = 'empresa' then
    begin
      Value := nom_empresa;
    end;
    if VarName = 'email' then
    begin
      Value := email_empresa + '     -      ' + home_page;
    end;
  end
  else if (tipo_relatorio = 'pauta_venda') or (tipo_relatorio = 'pauta_venda_categoria') or (tipo_relatorio = 'produtos_codigo_barra') then
  begin
    if VarName = 'empresa' then
    begin
      Value := nom_empresa;
    end;
    if VarName = 'email' then
    begin
      Value := email_empresa + '     -      ' + home_page;
    end;
  end
  else if tipo_relatorio = 'pauta_vendas_est' then
  begin
    if VarName = 'empresa' then
    begin
      Value := nom_empresa;
    end;
    if VarName = 'email' then
    begin
      Value := email_empresa + '     -      ' + home_page;
    end;
  end
  else if tipo_relatorio = 'cobrança' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa
    else if VarName = 'dtaini' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_inicial.date)
    else if VarName = 'dtafin' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_final.date)
  end
  else if tipo_relatorio = 'contas_receber' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa
    else if VarName = 'dtaini' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_inicial.date)
    else if VarName = 'dtafin' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_final.date)
  end
  else if tipo_relatorio = 'vendas_periodo_vendedor' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa
    else if VarName = 'dtaini' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_inicial.date)
    else if VarName = 'dtafin' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_final.date)
  end
  else if tipo_relatorio = 'ranking_cliente' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa
    else if VarName = 'dtaini' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_inicial.date)
    else if VarName = 'dtafin' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_final.date)
  end
  else if tipo_relatorio = 'ranking_cliente_simplificado' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa
    else if VarName = 'dtaini' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_inicial.date)
    else if VarName = 'dtafin' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_final.date)
  end
  else if tipo_relatorio = 'comissao_venda' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa
    else if VarName = 'dtaini' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_inicial.date)
    else if VarName = 'dtafin' then
      Value := formatdatetime('dd/mm/yyyy', Prdta_final.date)
  end
  else if (tipo_relatorio = 'Plano Contas Lista') then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa;
  end
  else if (tipo_relatorio = 'clientes_produtos') then
  begin
    if VarName = 'perc_comissao' then
      Value := PrComissao.Value;
  end;
end;

procedure TFr_opc_relatorios.relatorio_vendas_cliente(dta_inicial, dta_final: TDate; cod_cliente: string; cod_empresa: string; cod_fornecedor: string);
var
  cmd: string;
begin
  cmd := 'SELECT V2.COD_PRODUTO, v2.COD_CLIENTE, ID_COR, ID_TAMANHO, QTD, PRECO, SUB_TOTAL, p.nom_produto,p.preco_venda, c.cor, cl.telefone, cl.email, ' + 't.tamanho,cl.nom_cliente, v2.numdoc, v1.cod_fop, fp.nom_fop, v1.dtadoc, v1.desconto, v1.qtd_parcelas, v1.prazo_pgto, v1.tot_bruto, v2.preco_bruto, f.fantasia, p.fornecedor_principal, e.nom_empresa, ' + 'v2.desconto as desconto_item, v1.tot_liquido, r.nom_representante, v1.credito_usado, m.nom_marca from vendas2 v2 ' +
    'left join vendas1 v1 on v1.numdoc = v2.numdoc ' + 'left join fop fp on fp.cod_fop = v1.cod_fop ' + 'LEFT JOIN PRODUTO P ON P.COD_PRODUTO = V2.COD_PRODUTO ' + 'left join cores c on c.id = v2.id_cor ' + 'left join tamanho t on t.id = v2.id_tamanho ' + 'left join cliente cl on cl.cod_cliente=v2.cod_cliente ' + 'left join representante r on r.id=v1.cod_representante ' + 'left join marcas m on m.id=p.id_marca ' + 'left join fornecedor f on f.cod_fornecedor=p.fornecedor_principal ' +
    'left join empresa e on e.cod_empresa = v1.empresa_faturar ' + 'where case when v1.FATURADO = ''1'' then v1.DTA_EMISSAO else v1.dtadoc END between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date)) + ' and v1.consignacao<>' + quotedstr('1') + ' and v1.orcamento=' + quotedstr('0') + ' and tipo_venda<>' + quotedstr('D');

  if edCliente.Text <> '' then
    cmd := cmd + fmfun.cmdAux('v2.cod_cliente', edCliente.Text);

  if Prempresa.Text <> '' then
    cmd := cmd + ' and v1.empresa_faturar = ' + quotedstr(cod_empresa);

  if cod_fornecedor <> '' then
    cmd := cmd + ' and p.fornecedor_principal=' + quotedstr(cod_fornecedor);

  cmd := cmd + ' order by v2.cod_cliente, v2.dtadoc ';

  with dm.q_vendas2 do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_vendas2.RecordCount <= 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\vendas_cliente.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;
end;

procedure TFr_opc_relatorios.relatorio_plano_contas;
var
  cmd: string;
begin
  cmd := 'select a.ID, a.NR_CONTA, a.DESCRICAO1, a.DESCRICAO2, a.DESCRICAO3, a.DESCRICAO4, a.OPERACAO, a.TITULO, a.DATA, a.HISTORICO, a.VALOR, a.VALOR_SALDO, a.CLIENTE_FORNECEDOR, a.FORMA ' + ' FROM V_PLANO_CONTAS a WHERE 1 = 1 ';

  cmd := cmd + 'and a.data between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date)) + ' ORDER BY a.operacao, a.DESCRICAO1, a.DESCRICAO2, a.DESCRICAO3, a.DESCRICAO4, A.TITULO, a.data, a.cliente_fornecedor ';

  with dm.q_plano_contas do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_plano_contas.RecordCount <= 0 then
  begin
    dao.msg('Não foi encontrado Registros para gerar o Relatório');
    exit;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\plano_contas.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;
end;

procedure TFr_opc_relatorios.relatorio_plano_contas_lista;
var
  cmd: string;
begin
  cmd := 'SELECT a.ID, a.NR_CONTA, a.ID1, a.ID2, a.ID3, a.ID_PAI2, a.ID_PAI3, a.ID_PAI4, a.DESCRICAO1, a.DESCRICAO2, a.DESCRICAO3, a.DESCRICAO4 FROM V_PLANO_CONTAS_LISTA a WHERE 1 = 1 ';

  if edPlanoContas.Text <> '' then
    cmd := cmd + fmfun.cmdAux('a.id', edPlanoContas.Text);

  cmd := cmd + ' ORDER BY a.DESCRICAO1, a.DESCRICAO2, a.DESCRICAO3, a.DESCRICAO4 ';

  with dm.q_plano_contas_lista do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_plano_contas_lista.RecordCount <= 0 then
  begin
    dao.msg('Não foi encontrado Registros para gerar o Relatório');
    exit;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\plano_contas_lista.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;
end;

procedure TFr_opc_relatorios.relatorio_extrato;
var
  cmd: string;
begin
  cmd := 'SELECT cc.id as id_conta, cc.NOM_CONTA, a.ID, a.HISTORICO, a.DATA_MOV, a.VALOR, a.ID_CONTA, ' + ' a.OPERACAO, a.SALDO,  a.tipo, case a.TIPO when ''0'' then ''Dinheiro'' else case a.tipo when ''1'' then ''Cheque'' else case a.tipo when ''3'' then ''Permuta'' else  ''Dep./Saque'' end end end as tipo_desc ' + ' FROM EXTRATO a inner join CONTA_CORRENTE cc on (cc.ID = a.ID_CONTA) WHERE 1 = 1 ';

  if edContaCorrente.Text <> '' then
    cmd := cmd + fmfun.cmdAux('cc.id', edContaCorrente.Text);

  cmd := cmd + 'and a.data_mov between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date)) + ' ORDER BY a.id_conta, a.data_mov, a.id ';

  with dm.q_extrato do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_extrato.RecordCount <= 0 then
  begin
    dao.msg('Não foi encontrado Registros para gerar o Relatório');
    exit;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\extrato.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;
end;

procedure TFr_opc_relatorios.relatorio_cheques_terceiro;
var
  cmd: string;
begin
  cmd := 'SELECT NR_CHEQUE, NR_BANCO, NR_AGENCIA, NR_CONTA_CORRENTE, DTA_EMISSAO, DTA_VENCIMENTO, NOM_TITULAR' + ', VALOR, TITULO_CR1, TITULO_CP1, OBSERVACAO FROM CHEQUE_TERCEIROS';
  if Praberto.Checked then
    cmd := cmd + ' where titulo_cp1 is null';
  if Prfinalizado.Checked then
    cmd := cmd + ' where titulo_cp1 is not null';

  with dm.q_cheques do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_cheques.RecordCount <= 0 then
  begin
    dao.msg('Não foi encontrado Registros para gerar o Relatório');
    exit;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\cheques_terceiros.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.Prcod_transportadoraButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Transportadora';
  chamou_pesquisa := 'fr_transportadora';
  chamou_form := 'fr_opc_relatorio_transportadora';
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
    Fr_localizar.CBcampos.Items.add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

  Prcod_transportadora.SetFocus;

  edTransportadora.Text := edTransportadora.Text + ';' + Prcod_transportadora.Text;
  if pos(';', edTransportadora.Text) = 1 then
    edTransportadora.Text := copy(edTransportadora.Text, 2, length(edTransportadora.Text));

end;

procedure TFr_opc_relatorios.Prcod_transportadoraExit(Sender: TObject);
begin
  if trim(Prcod_transportadora.Text) = '' then
    LbNom_transportadora.Caption := '...';

  if Prcod_transportadora.Text <> '' then
  begin
    dao.Geral2('select nome from transportadora where cod_transportadora=' + quotedstr(Prcod_transportadora.Text));
    if dao.q2.RecordCount > 0 then
    begin
      LbNom_transportadora.Caption := dao.q2.fieldbyname('nome').AsString;
      if edTransportadora.Text = '' then
        edTransportadora.Text := Prcod_transportadora.Text;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_transportadora.Text := '';
      Prcod_transportadora.SetFocus;
      exit;
    end;

  end;

end;

procedure TFr_opc_relatorios.Prcod_transportadoraKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: array of string;
  i: Integer;
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
      chamou_form := 'fr_opc_relatorio_transportadora';
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
        Fr_localizar.CBcampos.Items.add(valor_combo);
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

procedure TFr_opc_relatorios.relatorio_controle_fretes_transportadora(c_transportadora, dta_inicial, dta_final: string);
var
  cmd: string;
begin
  if (edTransportadora.Text <> '') and (trim(edPedido.Text) <> '') then
    dao.Execsql('update vendas1 set cod_transportadora =' + edTransportadora.Text + ' where 1 = 1 '+fmfun.cmdAux('NUMDOC', edPedido.Text));

  if Prdta_inicial.Text = '  /  /    ' then
  begin
    dao.msg('Preencha os campos de Data');
    exit;
  end;

  cmd := 'select ' + '  ve1.numdoc,  ' + '  ve1.nf,  ' + '  ve1.nfe, ' + '  ve1.dta_emissao,  ' + '  cli.nom_cliente, ' + '  ve1.tot_liquido, ' + 'tra.cod_transportadora,  tra.nome, ' + '  cid.nom_cidade, ' + '  cid.uf, ' + '  ve1.vl_frete, ' + '  ve1.contato_frete,  ' + '  fp.nom_fop,  ' + '  pz.prazo, ' + '  ve1.faturado, tra.OBS  ' + 'from vendas1 ve1 ' + 'left join cliente cli on ve1.cod_cliente=cli.cod_cliente  ' + 'left join transportadora tra on ve1.cod_transportadora=tra.cod_transportadora  ' + 'left join cidades cid on cli.cod_cidade=cid.cod_cidade ' + 'left join fop fp on ve1.cod_fop=fp.cod_fop ' + 'left join prazo pz on pz.id=ve1.cod_prazo_pgto  ';
  cmd := cmd + ' where ve1.dta_emissao between ' + quotedstr(formatdatetime('dd.mm.yyyy', strtodate(dta_inicial))) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', strtodate(dta_final))) + ' and ve1.faturado in (''1'',''3'') ';

  if edTransportadora.Text <> '' then
    cmd := cmd + fmfun.cmdAux('ve1.cod_transportadora', edTransportadora.Text);

  if edCidade.Text <> '' then
    cmd := cmd + fmfun.cmdAux('cli.cod_cidade', edCidade.Text);

  if pruf.Text <> '' then
    cmd := cmd + 'and cid.UF = ' + QuotedStr(pruf.Text);

  if trim(edPedido.Text) <> '' then
    cmd := cmd + fmfun.cmdAux('ve1.NUMDOC', edPedido.Text);

  if rgAlfabeticamente.Checked then
    cmd := cmd + ' order by tra.cod_transportadora, tra.nome, cli.nom_cliente, ve1.dta_emissao';

  if rgCodigo.Checked then
    cmd := cmd + ' order by tra.cod_transportadora, ve1.dta_emissao, cli.nom_cliente';

  with dm.Q_controle_fretes do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if dm.Q_controle_fretes.RecordCount < 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\controle_fretes.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.relatorio_vendas_cliente_ind(dta_inicial, dta_final: TDate; cod_cliente, cod_empresa: string);
var
  cmd: string;
begin
  cmd := 'SELECT V2.COD_PRODUTO, v2.COD_CLIENTE, ID_COR, ID_TAMANHO, QTD, PRECO, SUB_TOTAL, p.nom_produto, p.preco_venda, c.cor, ' + 'cl.telefone ,cl.email, p.fornecedor_principal, f.fantasia ' + ',t.tamanho,cl.nom_cliente, v2.numdoc, v1.cod_fop, fp.nom_fop, v1.dtadoc, v1.desconto, v1.qtd_parcelas, v1.prazo_pgto, ' + 'v2.preco_bruto, v2.desconto as desconto_item, e.nom_empresa, ' + 'v1.tot_bruto, v1.tot_liquido,r.nom_representante, V1.credito_usado, m.nom_marca FROM VENDAS2 v2 ' +
    'left join vendas1 v1 on v1.numdoc = v2.numdoc ' + 'left join fop fp on fp.cod_fop = v1.cod_fop ' + 'LEFT JOIN PRODUTO P ON P.COD_PRODUTO = V2.COD_PRODUTO ' + 'left join cores c on c.id = v2.id_cor ' + 'left join tamanho t on t.id = v2.id_tamanho ' + 'left join cliente cl on cl.cod_cliente=v2.cod_cliente ' + 'left join representante r on r.id= coalesce(v1.cod_supervisor, v1.cod_representante) ' + 'left join marcas m on m.id=p.id_marca ' + 'left join fornecedor f on f.cod_fornecedor=p.fornecedor_principal ' + 'left join empresa e on e.cod_empresa = v1.empresa_faturar ' + 'where  (v1.COD_FISCAL not in (''6152'', ''6409'') OR V1.COD_FISCAL IS NULL) and V1.NFEENTRADASAIDA = ''0'' AND V1.PROCESSO_ID NOT IN (SELECT PROCESSO_ID FROM VENDAS1 WHERE FATURADO <> 2 AND NFEENTRADASAIDA = ''1'') AND v1.NFE_DEV is null and v1.consignacao<>' + quotedstr('1') + ' and v1.cod_fop<>' + quotedstr('9');

  if rbSemSupervisao.Checked then
    cmd := cmd + 'and v1.cod_supervisor is null';

  if rbApenasSupervisao.Checked then
    cmd := cmd + 'and v1.cod_supervisor is not null';

  if rbNaoConsumidorFinal.Checked then
    cmd := cmd + 'and coalesce(v1.consumidor_final, ''N'') = ''N'' ';

  if rbApenasConsumidorFinal.Checked then
    cmd := cmd + 'and coalesce(v1.consumidor_final, ''N'') = ''S'' ';

  if Rb_filtro_faturamento.Checked then
    cmd := cmd + ' and v1.dta_emissao between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date));

  if Rb_filtro_emissao.Checked then
    cmd := cmd + ' and v1.dtadoc between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date));

  if edCliente.Text <> '' then
    cmd := cmd + fmfun.cmdAux('v2.cod_cliente', edCliente.Text);

  if Prempresa.Text <> '' then
    cmd := cmd + ' and v1.empresa_faturar = ' + quotedstr(cod_empresa);

  if zzfaturado.Checked then
    cmd := cmd + ' and faturado=' + quotedstr('1') + ' and v1.orcamento=' + quotedstr('0')
  else if zznao_faturado.Checked then
    cmd := cmd + ' and faturado=' + quotedstr('0') + ' and v1.orcamento=' + quotedstr('0')
  else if zzdesativados.Checked then
    cmd := cmd + ' and faturado=' + quotedstr('4') + ' and v1.orcamento=' + quotedstr('0')
  else if zzfaturado_todos.Checked then
    cmd := cmd + ' and faturado<>' + quotedstr('4') + ' and v1.orcamento=' + quotedstr('0')
  else if zzorcamento.Checked then
    cmd := cmd + ' and faturado=' + quotedstr('0') + ' and v1.orcamento=' + quotedstr('1');

  cmd := cmd + ' order by v2.cod_cliente, v2.dtadoc ';

  { cmd:= 'SELECT v2.cod_produto, v2.cod_cliente, ID_COR, ID_TAMANHO, QTD, PRECO, SUB_TOTAL, p.nom_produto,p.preco_venda, c.cor, cl.telefone, cl.email '+
    ',t.tamanho,cl.nom_cliente, v2.numdoc, v1.cod_fop, fp.nom_fop, v1.dtadoc, v1.desconto, v1.qtd_parcelas, v1.prazo_pgto, v1.tot_bruto, '+
    'v1.tot_liquido, r.nom_representante, v1.credito_usado, m.nom_marca from vendas2 v2 '+
    'left join vendas1 v1 on v1.numdoc = v2.numdoc '+
    'left join fop fp on fp.cod_fop = v1.cod_fop '+
    'LEFT JOIN PRODUTO P ON P.COD_PRODUTO = V2.COD_PRODUTO '+
    'left join cores c on c.id = v2.id_cor '+
    'left join tamanho t on t.id = v2.id_tamanho '+
    'left join cliente cl on cl.cod_cliente=v2.cod_cliente '+
    'left join representante r on r.id=v1.cod_representante '+
    'left join marcas m on m.id=p.id_marca '+
    'where v1.dtadoc between '+QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_inicial.Date))+' and '+QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_final.Date))+
    ' and v1.consignacao<>'+QuotedStr('1')+' and v1.orcamento='+QuotedStr('0')+' and tipo_venda<>'+QuotedStr('D');

    if Prcod_cliente.Text <> '' then
    cmd:= cmd + ' and v2.cod_cliente = ' + QuotedStr(cod_cliente);
    if Prempresa.Text <> '' then
    cmd:= cmd + ' and v1.empresa_faturar = ' + QuotedStr(cod_empresa);
    cmd:= cmd + ' order by v2.cod_cliente, v2.dtadoc '; }

  with dm.q_vendas2 do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_vendas2.RecordCount < 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\vendas_cliente_ind.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.monta_rel_cliente_completo(cod_cidade, uf, empresa: string);
var
  cmd2: string;
begin
  cmd2 := 'select c.cod_cidade, c.cod_empresa, c.nom_cliente, c.nom_fantasia, c.cod_cliente,c.endereco, c.NR_ENDERECO, c.contato, c.cod_cidade, c.bairro, c.cep, c.telefone, ' + 'c.email, c.dta_aniversario, case when c.TIP_PESSOA = ''J'' THEN c.CNPJ ELSE c.CPF END AS CNPJ, ' +
          'case when c.TIP_PESSOA = ''J'' THEN c.IE ELSE c.RG END AS IE, ' +
          'e.nom_empresa, cd.nom_cidade,  cd.uf from cliente c ' +
          'left join cidades cd on cd.cod_cidade = c.cod_cidade ' +
          'inner join cadmicro mc on (mc.microcod = cd.microcod) ' +
          'inner join cadmeso ms on (ms.mesocod = mc.mesocod) ' +
          'left join empresa e on e.cod_empresa = c.cod_empresa ' +
          'where 1 = 1 ';

  if PrConstrutora.Checked then
    cmd2 := cmd2 + ' and c.CONSTRUTORA = ''S''';

  if PrNaoConstrutoras.Checked then
    cmd2 := cmd2 + ' and c.CONSTRUTORA = ''N''';

  if rbbloqueado.Checked then
    cmd2 := cmd2 + ' and c.CLIENTE_BLOQUEADO = ''S''';

  if rbNaoBloqueado.Checked then
    cmd2 := cmd2 + ' and (c.CLIENTE_BLOQUEADO <> ''S'' OR C.CLIENTE_BLOQUEADO IS NULL)';

  if PrPessoaJuridica.Checked then
    cmd2 := cmd2 + ' and c.TIP_PESSOA = ''J''';

  if empresa <> '' then
    cmd2 := cmd2 + ' and c.cod_empresa =' + quotedstr(empresa);

  if cod_cidade <> '' then
    cmd2 := cmd2 + fmfun.cmdAux('c.cod_cidade', cod_cidade);

  if edMicroRegiao.Text <> '' then
    cmd2 := cmd2 + fmfun.cmdAux('mc.microcod', edMicroRegiao.Text);

  if edMesoRegiao.Text <> '' then
    cmd2 := cmd2 + fmfun.cmdAux('ms.mesocod', edMesoRegiao.Text);

  if edcodsupervisor.Text <> '' then
    cmd2 := cmd2 + fmfun.cmdAux('cd.cod_supervisor', edcodsupervisor.Text);

  if edCodRepresentante.Text <> '' then
    cmd2 := cmd2 + fmfun.cmdAux('c.ID_REPRESENTANTE', edCodRepresentante.Text);

  if PrClienteDataCadastro.date <> 0 then
    cmd2 := cmd2 + 'and c.DTA_CAD >= ' + quotedstr(formatdatetime('yyyy/mm/dd', PrClienteDataCadastro.date));

  if PrUltimaCompra.date <> 0 then
    cmd2 := cmd2 + 'and c.COD_CLIENTE in (select distinct v.cod_cliente from vendas1 v where v.COD_FISCAL not in (''6152'', ''6409'') AND V.NFEENTRADASAIDA = ''0'' '+
                   ' AND V.PROCESSO_ID NOT IN (SELECT PROCESSO_ID FROM VENDAS1 WHERE FATURADO <> 2 AND NFEENTRADASAIDA = ''1'') AND v.nfe_dev is null and v.faturado in (0, 1, 3) and  v.DTA_EMISSAO > ''' + formatdatetime('yyyy/mm/dd', PrUltimaCompra.date) + ''')';

  if PrNaoCompraDesde.date <> 0 then
    cmd2 := cmd2 + ' and c.COD_CLIENTE not in (select distinct v.cod_cliente from vendas1 v where v.cod_cliente is not null and v.COD_FISCAL not in (''6152'', ''6409'') and V.NFEENTRADASAIDA = ''0'' '+
                   ' AND V.PROCESSO_ID NOT IN (SELECT PROCESSO_ID FROM VENDAS1 WHERE FATURADO <> 2 AND NFEENTRADASAIDA = ''1'') AND v.nfe_dev is null and v.faturado in (0, 1, 3) and v.DTADOC > ''' + formatdatetime('yyyy/mm/dd', PrNaoCompraDesde.date) + ''') ';

  if uf <> '' then
    cmd2 := cmd2 + ' and cd.uf=' + quotedstr(uf);

  if edCliente.Text <> '' then
    cmd2 := cmd2 + fmfun.cmdAux('c.cod_cliente', edCliente.Text);

  if rgAlfabeticamente.Checked then
    cmd2 := cmd2 + ' order by cd.nom_cidade, nom_cliente';

  if rgCodigo.Checked then
    cmd2 := cmd2 + ' order by cd.nom_cidade, cod_cliente';

  if rgEndereco.Checked then
    cmd2 := cmd2 + ' order by cd.nom_cidade, bairro, endereco, nr_endereco';

  with dm.q_cliente do
  begin
    close;
    sql.clear;
    sql.add(cmd2);
    open;
  end;

  if ckCSV.Checked then
  begin
    if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\cliente_completo_csv.fr3')) then
    begin
      dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
      exit;
    end;
  end
  else
  begin
    if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\cliente_completo.fr3')) then
    begin
      dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
      exit;
    end;
  end;
  fR_RELATORIO.ShowReport;
end;

procedure TFr_opc_relatorios.TeleVendasCidade;
var
  cmd2: string;
begin
  cmd2 := 'select cd.COD_CIDADE, cd.NOM_CIDADE, mi.MICRONOMEx, me.MESONOMEX, cd.UF, r.id||''-''||r.NOM_REPRESENTANTE as telemarketing ' + 'from cidades cd ' + 'inner join REPRESENTANTE r on r.id = cd.COD_SUPERVISOR ' + 'inner join CADMICRO mi on mi.MICROCOD = cd.MICROCOD ' + 'inner join CADMESO  me on me.MESOCOD  = mi.MESOCOD where 1 = 1 ';

  if edCidade.Text <> '' then
    cmd2 := cmd2 + fmfun.cmdAux('cd.cod_cidade', edCidade.Text);

  if edMicroRegiao.Text <> '' then
    cmd2 := cmd2 + fmfun.cmdAux('mi.microcod', edMicroRegiao.Text);

  if edMesoRegiao.Text <> '' then
    cmd2 := cmd2 + fmfun.cmdAux('me.mesocod', edMesoRegiao.Text);

  if edcodsupervisor.Text <> '' then
    cmd2 := cmd2 + fmfun.cmdAux('cd.cod_supervisor', edcodsupervisor.Text);

  if Pruf.Text <> '' then
    cmd2 := cmd2 + ' and cd.uf=' + quotedstr(Pruf.Text);

  cmd2 := cmd2 + ' order by cd.uf, me.MESONOMEX, mi.MICRONOMEx, cd.nom_cidade ';

  with dm.q_televendas_cidade do
  begin
    close;
    sql.clear;
    sql.add(cmd2);
    open;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\televendas_cidades.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;
end;

procedure TFr_opc_relatorios.monta_rel_produto_ncm(cod_grupo, cod_fonecedor: string);
var
  cmd, cmd2: string;
begin
  cmd := 'select distinct cod_produto, nom_produto, promocao, unidade, qtd_embalagem, preco_venda, g.cod_grupo, g.nom_grupo, qtd_estoque, ' +
         'n.uf, coalesce(p.NCM, g.ncm) as ncm, n.mva, n.ALIQ_ICMS_INTERNA, n.cest, ' +
         'p.CODIGO_BARRA, ' +
         '0 AS SC_ST, 0 AS PR_ST, 0 AS RS_ST, n.uf_origem as origem, n.uf as destino, ' +
         'i.icms as aliq_ICMS, ' +
         'case when mva = 0 then 0 else (p.preco_venda * (i.ICMS/100)) end as vlr_icms, ' +
         'case when mva = 0 then 0 else (p.preco_venda * (1+(n.MVA/100))) end as bc_st, ' +
         'case when mva = 0 then 0 else (p.preco_venda * (1+(n.MVA/100))) * (n.ALIQ_ICMS_INTERNA/100) end as parc_st, ' +
         'case when mva = 0 then 0 else ((p.preco_venda * (1+(n.MVA/100))) * (n.ALIQ_ICMS_INTERNA/100)) - (p.preco_venda * (i.ICMS/100)) end as vlr_st, ' +
         'case when mva = 0 then 0 else case when p.preco_venda = 0 then 0 else (((((p.preco_venda * (1+(n.MVA/100))) * (n.ALIQ_ICMS_INTERNA/100)) - (p.preco_venda * (i.ICMS/100))) / p.PRECO_VENDA) * 100) end end as perc_st ' +
         'from produto p ' +
         'inner join grupo g on g.cod_grupo=p.cod_grupo ' +
         'left outer join mva n on (n.ncm = coalesce(p.NCM, g.ncm))  ' +
         'inner join icms i on (i.uf = n.uf and i.UF_ORIGEM = n.UF_ORIGEM) ' +
         'where 1 = 1 ';

  if rbRevenda.Checked then
    cmd := cmd + ' and p.revenda = ''S''';

  if trim(PrUFOrigem.Text) <> '' then
    cmd := cmd + ' and (n.uf_origem = ' + quotedstr(PrUFOrigem.Text) + ')';

  if trim(edUFDestino.Text) <> '' then
    cmd := cmd + ' and (n.uf in (' + edUFDestino.Text + '))';

  if rbOutros.Checked then
    cmd := cmd + ' and p.revenda = ''N''';

  if rbAtivo.Checked then
    cmd := cmd + ' and p.status <> ''S''';

  if rbInativo.Checked then
    cmd := cmd + ' and p.status <> ''N''';

  if rbPromocao.Checked then
    cmd := cmd + ' and p.promocao = ''S''';

  if rbIndisponivel.Checked then
    cmd := cmd + ' and p.indisponivel = ''S''';

  if rbDisponivel.Checked then
    cmd := cmd + ' and p.indisponivel = ''N''';

  if edGrupo.Text <> '' then
    cmd := cmd + fmfun.cmdAux('p.cod_grupo', edGrupo.Text);

  if edProduto.Text <> '' then
    cmd := cmd + fmfun.cmdAux('p.cod_produto', edProduto.Text);

  if edFornecedor.Text <> '' then
    cmd2 := cmd2 + ' and ( 1 = 1 ' + fmfun.cmdAux('p.fornecedor_principal', edFornecedor.Text) + ' or 0 < (SELECT count(*) FROM PRODUTO_FORNECEDOR pf where pf.cod_produto = p.cod_produto ' + fmfun.cmdAux('pf.cod_fornecedor', edFornecedor.Text) + '))';

  if Alfabeticamente.Checked then
    cmd2 := cmd2 + ' order by nom_produto, ncm, uf';

  if OrdemInterna.Checked then
    cmd2 := cmd2 + ' order by ord_pauta, cod_produto, ncm, uf';

  if CodigoProduto.Checked then
    cmd2 := cmd2 + ' order by cod_produto, ncm, uf';

  with dm.q_pauta_venda do
  begin
    close;
    sql.clear;
    sql.add(cmd + cmd2);
    open;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\produtos_ncm.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;
end;

procedure TFr_opc_relatorios.monta_rel_produto_ncm_st(cod_grupo, cod_fonecedor: string);
var
  cmd, cmd2, rel_ncm_st: string;
begin
  cmd := 'select distinct cod_produto, nom_produto, promocao, unidade, qtd_embalagem, preco_venda, g.cod_grupo, g.nom_grupo, qtd_estoque, ' +
         'n.uf, coalesce(p.NCM, g.ncm) as ncm, n.mva, n.ALIQ_ICMS_INTERNA, n.uf_origem as origem, n.uf as destino, ' +
         'i.icms as aliq_ICMS, n.cest, ' +
         'p.CODIGO_BARRA, ' +
         '0 AS SC_ST, 0 AS PR_ST, 0 AS RS_ST, ' +
         'case when mva = 0 then 0 else (p.preco_venda * (i.ICMS/100)) end as vlr_icms, ' +
         'case when mva = 0 then 0 else (p.preco_venda * (1+(n.MVA/100))) end as bc_st, ' +
         'case when mva = 0 then 0 else (p.preco_venda * (1+(n.MVA/100))) * (n.ALIQ_ICMS_INTERNA/100) end as parc_st, ' +
         'case when mva = 0 then 0 else ((p.preco_venda * (1+(n.MVA/100))) * (n.ALIQ_ICMS_INTERNA/100)) - (p.preco_venda * (i.ICMS/100)) end as vlr_st, ' +
         'case when mva = 0 then 0 else case when p.preco_venda = 0 then 0 else (((((p.preco_venda * (1+(n.MVA/100))) * (n.ALIQ_ICMS_INTERNA/100)) - (p.preco_venda * (i.ICMS/100))) / p.PRECO_VENDA) * 100) end end as perc_st ' +
         'from produto p ' +
         'inner join grupo g on g.cod_grupo=p.cod_grupo ' +
         'inner join mva n on (n.ncm = coalesce(p.NCM, g.ncm) AND N.cest = COALESCE(P.CEST, G.CEST)) ' +
         'inner join icms i on (i.uf = n.uf and i.UF_ORIGEM = n.UF_ORIGEM) ' +
         'where 1 = 1 ';

  if rbRevenda.Checked then
    cmd := cmd + ' and p.revenda = ''S''';

  if rbOutros.Checked then
    cmd := cmd + ' and p.revenda = ''N''';

  if rbAtivo.Checked then
    cmd := cmd + ' and p.status <> ''S''';

  if rbInativo.Checked then
    cmd := cmd + ' and p.status <> ''N''';

  if trim(PrUFOrigem.Text) <> '' then
    cmd := cmd + ' and (n.uf_origem = ' + quotedstr(PrUFOrigem.Text) + ')';

  if trim(edUFDestino.Text) <> '' then
    cmd := cmd + ' and (n.uf in (' + edUFDestino.Text + '))';

  if rbPromocao.Checked then
    cmd := cmd + ' and p.promocao = ''S''';

  if rbIndisponivel.Checked then
    cmd := cmd + ' and p.indisponivel = ''S''';

  if rbDisponivel.Checked then
    cmd := cmd + ' and p.indisponivel = ''N''';

  if edGrupo.Text <> '' then
    cmd := cmd + fmfun.cmdAux('p.cod_grupo', edGrupo.Text);

  if edProduto.Text <> '' then
    cmd := cmd + fmfun.cmdAux('p.cod_produto', edProduto.Text);

  if edFornecedor.Text <> '' then
    cmd2 := cmd2 + ' and ( 1 = 1 ' + fmfun.cmdAux('p.fornecedor_principal', edFornecedor.Text) + ' or 0 < (SELECT count(*) FROM PRODUTO_FORNECEDOR pf where pf.cod_produto = p.cod_produto ' + fmfun.cmdAux('pf.cod_fornecedor', edFornecedor.Text) + '))';

  if Alfabeticamente.Checked then
    cmd2 := cmd2 + ' order by nom_produto, ncm, uf';

  if OrdemInterna.Checked then
    cmd2 := cmd2 + ' order by ord_pauta, cod_produto, ncm, uf';

  if CodigoProduto.Checked then
    cmd2 := cmd2 + ' order by cod_produto, ncm, uf';


  with dm.q_pauta_venda do
  begin
    close;
    sql.clear;
    sql.add(cmd + cmd2);
    open;
  end;

  if (tipo_relatorio = 'produto_ncm_st') then
    rel_ncm_st := 'Relatorios\produtos_ncm_st.fr3';

  if (tipo_relatorio = 'produto_ncm_st_completo') then
    rel_ncm_st := 'Relatorios\produtos_ncm_st_completo.fr3';

  if not (fR_RELATORIO.LoadFromFile(path + rel_ncm_st)) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;
end;

procedure TFr_opc_relatorios.monta_rel_produto_desconto_especial;
var
  cmd, cmd2, cmd_status: string;
begin
  if rbAtivo.Checked then
    cmd_status := ' where status <> ' + quotedstr('S');

  if rbInativo.Checked then
    cmd_status := ' where status = ' + quotedstr('S');

  if rbPromocao.Checked then
    cmd := cmd + ' where p.promocao = ''S''';

  if rbRevenda.Checked then
    cmd := cmd + ' and p.revenda = ''S''';

  if rbOutros.Checked then
    cmd := cmd + ' and p.revenda = ''N''';

  if rbIndisponivel.Checked then
    cmd := cmd + ' and p.indisponivel = ''S''';

  if rbDisponivel.Checked then
    cmd := cmd + ' and p.indisponivel = ''N''';

  cmd := ' select distinct * ' + ' from ' + ' (  ' + '   select ' + '    ''DESCONTO GERAL'' AS TIPO, ' + '    p.COD_PRODUTO, ' + '    p.NOM_PRODUTO, ' + '    P.COD_GRUPO, ' + '    G.NOM_GRUPO, ' + '    P.PRECO_VENDA, ' + '    p.peso, ' + '    p.DESCONTO_MAXIMO, ' + '    p.ORD_PAUTA, ' + '    (p.PRECO_VENDA - (p.PRECO_VENDA * (cast((p.DESCONTO_MAXIMO) as numeric(15,4))/100))) AS PRECO_DESCONTADO, ' + '    ''OUTROS'' DESCONTO_PARA, ' + '    0 as codrep ' + '  from ' + '    produto p ' +
    '  INNER JOIN GRUPO G ON (G.COD_GRUPO = P.COD_GRUPO) ' + cmd_status + '  UNION ' + '  select ' + '    ''DESCONTO ESPECIAL PRODUTO'' AS TIPO, ' + '    p.COD_PRODUTO, ' + '    p.NOM_PRODUTO, ' + '    P.COD_GRUPO, ' + '    G.NOM_GRUPO, ' + '    P.PRECO_VENDA, ' + '    p.peso, ' + '    pR.DESCONTO_MAXIMO, ' + '    p.ORD_PAUTA, ' + '    (p.PRECO_VENDA - (p.PRECO_VENDA * (cast((pr.DESCONTO_MAXIMO) as numeric(15,4))/100))) AS PRECO_DESCONTADO, ' + '    r.NOM_REPRESENTANTE as DESCONTO_PARA, ' +
    '    r.id as codrep ' + '  from ' + '    produto p ' + '  INNER JOIN GRUPO G ON (G.COD_GRUPO = P.COD_GRUPO) ' + '  INNER JOIN PRODUTO_REPRESENTANTE PR ON (pr.COD_PRODUTO = p.COD_PRODUTO) ' + '  inner join REPRESENTANTE r on (r.id = pr.ID_REPRESENTANTE and r.ATIVO = ''S'') ' + cmd_status + '  union ' + '  select ' + '    ''DESCONTO ESPECIAL GRUPO'' AS TIPO, ' + '    p.COD_PRODUTO, ' + '    p.NOM_PRODUTO, ' + '    P.COD_GRUPO, ' + '    G.NOM_GRUPO, ' + '    P.PRECO_VENDA, ' + '    p.peso, ' +
    '    GR.DESCONTO_MAXIMO, ' + '    p.ORD_PAUTA, ' + '    (p.PRECO_VENDA - (p.PRECO_VENDA * (cast((gr.DESCONTO_MAXIMO) as numeric(15,4))/100))) AS PRECO_DESCONTADO, ' + '    r.NOM_REPRESENTANTE as DESCONTO_PARA, ' + '    r.id as codrep ' + '  from ' + '    produto p ' + '  INNER JOIN GRUPO G ON (G.COD_GRUPO = P.COD_GRUPO) ' + '  INNER JOIN grupo_REPRESENTANTE GR ON (Gr.COD_GRUPO = G.COD_GRUPO) ' + '  inner join REPRESENTANTE r on (r.id = Gr.ID_REPRESENTANTE and r.ATIVO = ''S'') ' + cmd_status + ') WHERE 1 = 1 ';

  if edGrupo.Text <> '' then
    cmd := cmd + fmfun.cmdAux('cod_grupo', edGrupo.Text);

  if edProduto.Text <> '' then
    cmd := cmd + fmfun.cmdAux('cod_produto', edProduto.Text);

  if edCodRepresentante.Text <> '' then
    cmd := cmd + fmfun.cmdAux('codrep', edCodRepresentante.Text);

  if Alfabeticamente.Checked then
    cmd2 := cmd2 + ' order by nom_produto, desconto_para';

  if OrdemInterna.Checked then
    cmd2 := cmd2 + ' order by ord_pauta, desconto_para';

  if CodigoProduto.Checked then
    cmd2 := cmd2 + ' order by cod_produto, desconto_para';

  with dm.q_desconto_especial do
  begin
    close;
    sql.clear;
    sql.add(cmd + cmd2);
    open;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\produtos_desconto_especial.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;
end;

procedure TFr_opc_relatorios.monta_rel_produto_calculo_preco_venda;
var
  cmd, cmd2: string;
begin
  cmd := 'select pro.cod_produto, pro.nom_produto, pro.peso, pro.grade, pro.qtd_estoque, pro.cod_grupo, g.NOM_GRUPO, f.COD_FORNECEDOR, f.RAZAO_SOCIAL, ' + ' pro.custo, pro.IMPOSTOS, pro.ipi, pro.OUTROS, pro.geral, pro.LUCRO, pro.custo_total, ' + ' cast(pro.custo_total + (pro.custo_total * (pro.lucro/100)) as numeric(15,2)) AS Vlr_calc, ' + ' cast( pro.preco_venda as numeric(15,2)) as preco_venda, ' + ' cast( pro.preco_promocao as numeric(15,2)) as preco_promocao, ' + '  f.razao_social, f.fantasia ' + ' from produto pro ' + ' left outer join subcategoria s on (s.id = pro.subcategoria) ' + ' inner join grupo g on (g.COD_GRUPO = pro.COD_GRUPO) ' + ' left join fornecedor f on f.cod_fornecedor = pro.fornecedor_principal ' + 'where 1 = 1 ';

  if rbRevenda.Checked then
    cmd := cmd + ' and pro.revenda = ''S''';

  if rbOutros.Checked then
    cmd := cmd + ' and pro.revenda = ''N''';

  if rbAtivo.Checked then
    cmd := cmd + 'and pro.status <> ' + quotedstr('S');

  if rbInativo.Checked then
    cmd := cmd + 'and pro.status = ' + quotedstr('S');

  if rbIndisponivel.Checked then
    cmd := cmd + ' and pro.indisponivel = ''S''';

  if rbDisponivel.Checked then
    cmd := cmd + ' and pro.indisponivel = ''N''';

  if edCategoria.Text <> '' then
    cmd := cmd + fmfun.cmdAux('s.categoria', edCategoria.Text);

  if edSubCategoria.Text <> '' then
    cmd := cmd + fmfun.cmdAux('S.ID', edSubCategoria.Text);

  if rbPromocao.Checked then
    cmd := cmd + ' and pro.promocao = ''S''';

  if rbRevenda.Checked then
    cmd := cmd + ' and pro.revenda = ''S''';

  if rbOutros.Checked then
    cmd := cmd + ' and pro.revenda = ''N''';

  if edProduto.Text <> '' then
  begin
    cmd := cmd + fmfun.cmdAux('pro.cod_produto', edProduto.Text);
  end;

  if edDesc.Text <> '' then
    cmd := cmd + ' and pro.nom_produto LIKE ''%' + edDesc.Text + '%''';

  if edFornecedor.Text <> '' then
    cmd := cmd + ' and ( 1 = 1 ' + fmfun.cmdAux('pro.fornecedor_principal', edFornecedor.Text) + ' or 0 < (SELECT count(*) FROM PRODUTO_FORNECEDOR pf where pf.cod_produto = pro.cod_produto ' + fmfun.cmdAux('pf.cod_fornecedor', edFornecedor.Text) + '))';

  if edGrupo.Text <> '' then
    cmd := cmd + fmfun.cmdAux('pro.cod_grupo', edGrupo.Text);

  if Alfabeticamente.Checked then
    cmd2 := cmd2 + ' order by COD_FORNECEDOR, cod_grupo, nom_produto';

  if OrdemInterna.Checked then
    cmd2 := cmd2 + ' order by COD_FORNECEDOR, cod_grupo, ORD_PAUTA';

  if CodigoProduto.Checked then
    cmd2 := cmd2 + ' order by COD_FORNECEDOR, cod_grupo, cod_produto';



  with dm.q_produto_custo do
  begin
    close;
    sql.clear;
    sql.add(cmd + cmd2);
    open;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\produtos_custo.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;
end;

procedure TFr_opc_relatorios.monta_rel_pauta_venda(cod_grupo, cod_fonecedor: string);
var
  cmd, cmd2, cmd3, relatorio: string;
begin
  if rbPromocao.Checked then
    cmd3 := 'preco_promocao as preco_venda,'
  else
    cmd3 := 'preco_venda,';

  cmd := 'select distinct cod_produto, nom_produto, p.ord_pauta, p.unidade, p.codigo_barra, qtd_embalagem, promocao, ' + cmd3 +
    ' g.cod_grupo, g.nom_grupo, qtd_estoque, ' +
    ''''' as uf, ' +
    ''''' as ncm,'+
    '   0 as mva,' +
    '   0 as ALIQ_ICMS_INTERNA,' +
    '   0 as aliq_ICMS,    ' +
    '   0 as vlr_icms,  ' +
    '   0 as bc_st, ' +
    '   0 as parc_st, ' +
    '   0 as vlr_st, ' +
    ''''' as CEST, ' +
    ''''' as ORIGEM, ' +
    ''''' AS DESTINO,   ' +
    '   0 perc_st   ' +
    'from produto p ' +
    'inner join grupo g on g.cod_grupo=p.cod_grupo ' +
    'left outer join mva n on (n.CEST = coalesce(p.CEST, g.CEST) and ' +
    '                     (                                                          ' +
    '                      n.ncm = coalesce(p.NCM, g.ncm) or                         ' +
    '                      n.ncm = substring(coalesce(p.NCM, g.ncm) from 1 for 9) or ' +
    '                      n.ncm = substring(coalesce(p.NCM, g.ncm) from 1 for 8) or ' +
    '                      n.ncm = substring(coalesce(p.NCM, g.ncm) from 1 for 7) or ' +
    '                      n.ncm = substring(coalesce(p.NCM, g.ncm) from 1 for 6) or ' +
    '                      n.ncm = substring(coalesce(p.NCM, g.ncm) from 1 for 5) or ' +
    '                      n.ncm = substring(coalesce(p.NCM, g.ncm) from 1 for 4) ' +
    '                     ))                                                 ' +
    'left outer join icms i on (i.UF = n.UF and i.UF_ORIGEM = n.UF_ORIGEM) ' +
    'where 1 = 1 ';

  if trim(PrUFOrigem.Text) <> '' then
    cmd := cmd + ' and (n.uf_origem = ' + quotedstr(PrUFOrigem.Text) + ' or n.uf_origem is null) ';

  if trim(edUFDestino.Text) <> '' then
    cmd := cmd + ' and (n.uf in (' + edUFDestino.Text + '))';

  if rbRevenda.Checked then
    cmd := cmd + ' and p.revenda = ''S''';

  if rbOutros.Checked then
    cmd := cmd + ' and p.revenda = ''N''';

  if rbAtivo.Checked then
    cmd := cmd + ' and p.status <> ''S''';

  if rbInativo.Checked then
    cmd := cmd + ' and p.status = ''S''';

  if rbPromocao.Checked then
    cmd := cmd + ' and p.promocao = ''S''';

  if rbIndisponivel.Checked then
    cmd := cmd + ' and p.indisponivel = ''S''';

  if rbDisponivel.Checked then
    cmd := cmd + ' and p.indisponivel = ''N''';

  if edGrupo.Text <> '' then
    cmd := cmd + fmfun.cmdAux('p.cod_grupo', edGrupo.Text);

  if edProduto.Text <> '' then
    cmd := cmd + fmfun.cmdAux('p.cod_produto', edProduto.Text);

  if edFornecedor.Text <> '' then
    cmd2 := cmd2 + ' and ( 1 = 1 ' + fmfun.cmdAux('p.fornecedor_principal', edFornecedor.Text) + ' or 0 < (SELECT count(*) FROM PRODUTO_FORNECEDOR pf where pf.cod_produto = p.cod_produto ' + fmfun.cmdAux('pf.cod_fornecedor', edFornecedor.Text) + '))';

  if Alfabeticamente.Checked then
    cmd2 := cmd2 + ' order by cod_grupo, nom_produto';

  if OrdemInterna.Checked then
    cmd2 := cmd2 + ' order by cod_grupo, ord_pauta';

  if CodigoProduto.Checked then
    cmd2 := cmd2 + ' order by cod_grupo, cod_produto';

  with dm.q_pauta_venda do
  begin
    close;
    sql.clear;
    sql.add(cmd + cmd2);
    open;
  end;

  if tipo_relatorio = 'produtos_codigo_barra' then
    relatorio := 'codigo_barras.fr3';

  if tipo_relatorio = 'pauta_venda' then
    relatorio := 'pauta_venda.fr3';

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\' + relatorio)) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.monta_rel_pauta_venda_categoria;
var
  cmd, cmd2, cmd3, cmd4, relatorio: string;
begin
  if rbPromocao.Checked then
    cmd3 := 'preco_promocao as preco_venda,'
  else
    cmd3 := 'preco_venda,';

  if trim(PrUFOrigem.Text) <> '' then
    cmd4 := cmd4 + ' and (n.uf_origem = ' + quotedstr(PrUFOrigem.Text) + ')';

  if trim(edUFDestino.Text) <> '' then
    cmd4 := cmd4 + ' and (n.uf in (' + edUFDestino.Text + '))';

  cmd := 'select distinct p.cod_produto, trim(nom_produto) as nom_produto, unidade, qtd_embalagem, promocao, preco_venda, g.cod_grupo, g.nom_grupo, qtd_estoque, coalesce(p.NCM, g.ncm) as ncm, coalesce(p.cest, g.cest) as cest, ' +
         ' s.id as cod_subcategoria, s.subcategoria, c.id as cod_categoria, c.categoria, p.CODIGO_BARRA, ' +
		 ' coalesce(( ' +
		 '   select ' +
		 '     case when p.preco_venda = 0 ' +
		 '          then 0 ' +
		 '          else case when n.MVA = 0 ' +
		 '                    then 0 ' +
         '                    else (((((p.preco_venda * (1+(n.MVA/100))) * (n.ALIQ_ICMS_INTERNA/100)) - (p.preco_venda * (i.icms/100))) / p.PRECO_VENDA) * 100) ' +
		 '               end ' +
		 '     end ' +
		 '     from mva n ' +
		 '     left outer join icms i on (i.UF = n.UF and i.UF_ORIGEM = n.UF_ORIGEM) ' +
		 '     where ' +
		 '       (n.CEST = coalesce(p.CEST, g.CEST) and (n.ncm = coalesce(p.NCM, g.ncm) or n.ncm = substring(coalesce(p.NCM, g.ncm) ' +
         '        from 1 for 9) or n.ncm = substring(coalesce(p.NCM, g.ncm) from 1 for 8) or n.ncm = substring(coalesce(p.NCM, g.ncm) from 1 for 7) or n.ncm = substring(coalesce(p.NCM, g.ncm) from 1 for 6) or n.ncm = substring(coalesce(p.NCM, g.ncm) from 1 for 5) ' +
		 '        or n.ncm = substring(coalesce(p.NCM, g.ncm) from 1 for 4))) ' + cmd4 + ' limit 1 ),0) as perc_st ' +
		 'from produto p ' +
		 'inner join grupo g on g.cod_grupo=p.cod_grupo ' +
		 'inner join subcategoria s on s.ID = p.SUBCATEGORIA ' +
		 'inner join categoria c on c.ID = s.CATEGORIA ' +
		 'where 1 = 1 ';

  if rbRevenda.Checked then
    cmd := cmd + ' and p.revenda = ''S''';

  if rbOutros.Checked then
    cmd := cmd + ' and p.revenda = ''N''';

  if rbAtivo.Checked then
    cmd := cmd + ' and p.status <> ''S''';

  if rbInativo.Checked then
    cmd := cmd + ' and p.status = ''S''';

  if rbPromocao.Checked then
    cmd := cmd + ' and p.promocao = ''S''';

  if rbIndisponivel.Checked then
    cmd := cmd + ' and p.indisponivel = ''S''';

  if rbDisponivel.Checked then
    cmd := cmd + ' and p.indisponivel = ''N''';

  if edGrupo.Text <> '' then
    cmd := cmd + fmfun.cmdAux('p.cod_grupo', edGrupo.Text);

  if edCategoria.Text <> '' then
    cmd := cmd + fmfun.cmdAux('C.ID', edCategoria.Text);

  if edSubCategoria.Text <> '' then
    cmd := cmd + fmfun.cmdAux('S.ID', edSubCategoria.Text);

  if edProduto.Text <> '' then
    cmd := cmd + fmfun.cmdAux('p.cod_produto', edProduto.Text);

  if edFornecedor.Text <> '' then
    cmd2 := cmd2 + ' and ( 1 = 1 ' + fmfun.cmdAux('p.fornecedor_principal', edFornecedor.Text) + ' or 0 < (SELECT count(*) FROM PRODUTO_FORNECEDOR pf where pf.cod_produto = p.cod_produto ' + fmfun.cmdAux('pf.cod_fornecedor', edFornecedor.Text) + '))';

  if Alfabeticamente.Checked then
    cmd2 := cmd2 + ' order by c.categoria, s.subcategoria, p.nom_produto';

  if OrdemInterna.Checked then
    cmd2 := cmd2 + ' order by c.categoria, s.subcategoria, p.ord_pauta';

  if CodigoProduto.Checked then
    cmd2 := cmd2 + ' order by c.categoria, s.subcategoria, p.cod_produto';

  with dm.q_pauta_venda_categoria do
  begin
    close;
    sql.clear;
    sql.add(cmd + cmd2);
    open;
  end;

  relatorio := 'pauta_venda_categoria.fr3';

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\' + relatorio)) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.monta_rel_produtos_capa;
var
  cmd, cmd2, cmd_codebar, relatorio: string;
begin
  if edCliente.Text <> '' then
    cmd_codebar := 'coalesce((SELECT a.COD_BARRAS FROM CLIENTE_CODEBAR a where a.COD_CLIENTE = ' + edCliente.Text + ' and a.COD_PRODUTO = p.cod_produto),p.codigo_barra) as codigo_barra'
  else
    cmd_codebar := 'p.codigo_barra';

  cmd := 'select distinct p.cod_produto, cast(trim(p.nom_produto) as varchar(300)) as nom_produto, ' + cmd_codebar + ' from produto p ' + 'inner join grupo g on g.cod_grupo = p.cod_grupo ' + 'left outer join subcategoria s on s.ID = p.SUBCATEGORIA ' + 'left outer join categoria c on c.ID = s.CATEGORIA ' + 'where 1 = 1 ';

  if rbRevenda.Checked then
    cmd := cmd + ' and p.revenda = ''S''';

  if rbOutros.Checked then
    cmd := cmd + ' and p.revenda = ''N''';

  if rbAtivo.Checked then
    cmd := cmd + ' and p.status <> ''S''';

  if edGrupo.Text <> '' then
    cmd := cmd + fmfun.cmdAux('p.cod_grupo', edGrupo.Text);

  if edCategoria.Text <> '' then
    cmd := cmd + fmfun.cmdAux('C.ID', edCategoria.Text);

  if edSubCategoria.Text <> '' then
    cmd := cmd + fmfun.cmdAux('S.ID', edSubCategoria.Text);

  if rbInativo.Checked then
    cmd := cmd + ' and p.status = ''S''';

  if rbPromocao.Checked then
    cmd := cmd + ' and p.promocao = ''S''';

  if rbIndisponivel.Checked then
    cmd := cmd + ' and p.indisponivel = ''S''';

  if edProduto.Text <> '' then
    cmd := cmd + fmfun.cmdAux('p.cod_produto', edProduto.Text);

  if rbDisponivel.Checked then
    cmd := cmd + ' and p.indisponivel = ''N''';

  if edGrupo.Text <> '' then
    cmd := cmd + fmfun.cmdAux('p.cod_grupo', edGrupo.Text);

  if edFornecedor.Text <> '' then
    cmd2 := cmd2 + ' and ( 1 = 1 ' + fmfun.cmdAux('p.fornecedor_principal', edFornecedor.Text) + ' or 0 < (SELECT count(*) FROM PRODUTO_FORNECEDOR pf where pf.cod_produto = p.cod_produto ' + fmfun.cmdAux('pf.cod_fornecedor', edFornecedor.Text) + '))';

  cmd2 := cmd2 + ' order by nom_produto';

  with dm.q_capa_embalagem do
  begin
    close;
    sql.clear;
    sql.add(cmd + cmd2);
    open;
  end;

  if tipo_relatorio = 'produtos_capa_6' then
  begin
    if ckRepetirFolha.Checked then
      relatorio := 'Relatorios\capa_embalagem_todos.fr3'
    else
      relatorio := 'Relatorios\capa_embalagem.fr3';
  end
  else if tipo_relatorio = 'produtos_capa_11' then
    relatorio := 'Relatorios\capa embalagem 11.fr3'
  else if tipo_relatorio = 'produtos_capa_20_5' then
    relatorio := 'Relatorios\capa embalagem 20_5.fr3'
  else if tipo_relatorio = 'produtos_capa_24_6' then
    relatorio := 'Relatorios\capa embalagem 24_6.fr3';

  if not (fR_RELATORIO.LoadFromFile(path + relatorio)) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.monta_rel_produto_catalogo;
var
  cmd, cmd2, relatorio, subcategoria, categoria_anterior: string;
  x, y, f: Real;
  Pagina, rept, espac, t: Integer;
  (*
    procedure DefinirItensPorPagina(vezes, qtd:integer);
    var i :integer;
    begin
    dm.mm_Catalogo.prior;
    i := 1;
    repeat
    dm.mm_Catalogo.Edit;
    dm.mm_CatalogoITENSPORPAGINA.Value := qtd;
    //dm.mm_CatalogoNOM_PRODUTO.AsString := inttostr(i);
    dm.mm_Catalogo.post;
    dm.mm_Catalogo.prior;
    inc(i);
    until vezes < i ;

    i := 1;
    repeat
    dm.mm_Catalogo.next;
    inc(i);
    until vezes < i  ;
    dm.mm_Catalogo.next;
    end;

    procedure PosicaoLinha;
    var
    item, reg, pagina : integer;
    begin
    item := 0;
    reg  := 0;
    pagina := 1;
    dm.mm_Catalogo.first;
    while not dm.mm_Catalogo.Eof do
    begin
    inc(reg);

    if (item > dm.mm_CatalogoORDEMITEMPAG.Value) then
    begin
    item := dm.mm_CatalogoORDEMITEMPAG.Value;

    DefinirItensPorPagina(reg, item);
    item := 0;
    reg  := 0;
    end
    else begin
    //        item := dm.mm_CatalogoORDEMITEMPAG.Value;
    DefinirItensPorPagina(reg, item);
    end;
    dm.mm_Catalogo.next;
    end;

    //    DefinirItensPorPagina(1, item);
    //    DefinirItensPorPagina(reg, item);
    dm.mm_Catalogo.first;
    end;

    procedure MontaPosicao;
    var
    item: Integer;
    begin
    dm.mm_Catalogo.first;
    Pagina := 1;
    item := 1;
    y := 222.78;
    x := 0;
    subcategoria := '';
    categoria_anterior := '';
    espac := 200;
    while not dm.mm_Catalogo.Eof do
    begin

    if categoria_anterior <> dm.mm_CatalogoCategoria.AsString then
    begin
    Pagina := 1;
    y := 222.78;
    x := 0;
    subcategoria := '';
    categoria_anterior := dm.mm_CatalogoCategoria.AsString;
    end;

    if subcategoria <> dm.mm_CatalogosubCategoria.Value then
    begin
    inc(item);
    if subcategoria <> '' then
    begin
    f:= y + (12 * (dm.mm_CatalogoItens.Value + 1) + espac);

    if (x = 0) and (f > 1050) then
    begin
    //            PosicaoLinha(t, round(((1050 - y)/(item))/2));
    x := 359.06;
    y := 222.78;

    end
    else if (x > 300) and (f > 1050) then
    begin

    inc(Pagina);
    //            PosicaoLinha(t, round(((1050 - y)/(item))/2));
    x := 0;
    y := 222.78;
    item := 1;

    end;
    end
    else
    item := 1;

    dm.mm_Catalogo.edit;
    subcategoria := dm.mm_CatalogosubCategoria.AsString;
    dm.mm_CatalogoY.Value := y;
    dm.mm_Catalogox.Value := x;

    y := y + (12 * (dm.mm_CatalogoItens.Value + 1) + espac);
    dm.mm_CatalogoPAGINA.Value := Pagina;

    dm.mm_Catalogo.post;
    end;

    dm.mm_Catalogo.edit;
    dm.mm_CatalogoORDEMITEMPAG.Value := item;
    dm.mm_Catalogo.post;
    dm.mm_Catalogo.Next;

    end;

    //    PosicaoLinha;


    end;
  *)
begin
  cmd := 'select p.COD_PRODUTO, s.subcategoria, p.NOM_PRODUTO, c.CATEGORIA, p.qtd_embalagem, p.unidade, cr.id, cr.COR, cr.COLOR, s.IMAGEM, s.imagem_bd, ' +
         '(select count(*) from produto pt where pt.status <> ''S'' and pt.subcategoria = s.id) as itens, ' +
		 ' coalesce((select  (select count(*) from produto pt where pt.subcategoria = s1.id)  from SUBCATEGORIA s1 where s1.id <> s.id and s1.CATEGORIA = s.CATEGORIA and s1.SUBCATEGORIA > s.SUBCATEGORIA and ' +
         ' s1.id in (select p1.subcategoria from produto p1 where p1.STATUS <> ''S'') order by s1.SUBCATEGORIA limit 1),0) as proximo, ' +
		 ' (select count(sc.id) from SUBCATEGORIA sc where sc.CATEGORIA = c.id and sc.id in (select pt.subcategoria from produto pt where pt.STATUS <> ''S'') ) as itensporcategoria ' +
		 'from produto p ' +
		 'Inner join subcategoria s on (p.SUBCATEGORIA = s.ID) ' +
		 'inner join categoria c on (c.ID = s.CATEGORIA) ' +
		 'inner join cores cr on (cr.ID = c.COR) ' +
		 'where (p.status <> ''S'' or p.cod_produto in (select prd.cod_produto from produto_representante_inativos prd) ) ';

  if edCategoria.Text <> '' then
    cmd := cmd + fmfun.cmdAux('C.ID', edCategoria.Text);

  if edSubCategoria.Text <> '' then
    cmd := cmd + fmfun.cmdAux('S.ID', edSubCategoria.Text);

  if edProduto.Text <> '' then
    cmd := cmd + fmfun.cmdAux('p.cod_produto', edProduto.Text);

  if ckSomenteFotos.Checked then
    cmd := cmd + ' and s.imagem_bd is not null ';

  cmd2 := cmd2 + ' order by cr.COR, c.CATEGORIA, s.subcategoria, p.nom_produto ';

  with dm.q_catalogo do
  begin
    close;
    sql.clear;
    sql.add(cmd + cmd2);
    open;
  end;

  if not dm.mm_Catalogo.Active then
    dm.mm_Catalogo.open;

  dm.mm_Catalogo.EmptyTable;
  dm.q_catalogo.first;
  y := 222.78;
  x := 0;
  subcategoria := '';
  Pagina := 1;
  while not dm.q_catalogo.Eof do
  begin
    dm.mm_Catalogo.Append;

    { if subcategoria <> dm.mm_CatalogosubCategoria.Value then
      begin

      if subcategoria <> '' then
      begin
      y := y + (20 * dm.q_catalogoITENS.Value) + 150;
      if (x = 0) and (y > 800) then
      begin
      x := 359.06;
      y := 222.78;
      end
      else if (x > 300) and (y > 800) then
      begin
      x := 0;
      y := 222.78;
      inc(Pagina);
      end;
      // y := y + 222.78;
      end;

      subcategoria := dm.q_catalogosubCATEGORIA.Value;
      dm.mm_CatalogoY.Value := y;
      dm.mm_Catalogox.Value := x;

      end;
    }
    dm.mm_CatalogoItens.Value := dm.q_catalogoITENS.Value;
    // dm.mm_CatalogoItensPorCategoria.Value := dm.q_catalogoITENSPORCATEGORIA.Value;
    dm.mm_CatalogoCOD_PRODUTO.Value := dm.q_catalogoCOD_PRODUTO.Value;
    dm.mm_CatalogoNOM_PRODUTO.Value := dm.q_catalogoNOM_PRODUTO.Value;
    dm.mm_CatalogosubCategoria.Value := dm.q_catalogosubCATEGORIA.Value;
    dm.mm_CatalogoCategoria.Value := dm.q_catalogoCATEGORIA.Value;
    dm.mm_CatalogoQTD_EMBALAGEM.Value := dm.q_catalogoQTD_EMBALAGEM.Value;
    dm.mm_CatalogoUNIDADE.Value := dm.q_catalogoUNIDADE.Value;
    dm.mm_CatalogoCOR.Value := dm.q_catalogoCOR.Value;
    dm.mm_CatalogoCOLOR.AsString := dm.q_catalogoCOLOR.AsString;
    dm.mm_CatalogoIMAGEM_BD.Value := dm.q_catalogoIMAGEM_BD.Value;
    dm.mm_CatalogoPAGINA.Value := Pagina;

    dm.mm_Catalogo.post;

    dm.q_catalogo.Next;
  end;
  dm.q_catalogo.first;
  { rept := 0;
    repeat
    MontaPosicao;
    inc(rept);
    until (rept = 1);
  }
  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\catalogo.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.monta_rel_pauta_venda_est(cod_grupo, cod_fonecedor: string);
var
  cmd, cmd2: string;
begin
  cmd := 'select distinct cod_produto, nom_produto, unidade, qtd_embalagem, promocao, ' + ' g.cod_grupo, g.nom_grupo, qtd_estoque, ' + ''''' as uf, p.preco_venda,' + 'coalesce(p.NCM, g.ncm) as ncm, n.mva, n.ALIQ_ICMS_INTERNA, ' + 'i.icms as aliq_ICMS, ' + 'p.codigo_barra, ' + '(p.preco_venda * (i.icms/100)) as vlr_icms, ' + '(p.preco_venda * (1 + (n.MVA/100))) as bc_st, ' + '(p.preco_venda * (1 + (n.MVA/100))) * (n.ALIQ_ICMS_INTERNA/100) as parc_st, ' +
    '((p.preco_venda * (1 + (n.MVA/100))) * (n.ALIQ_ICMS_INTERNA/100)) - (p.preco_venda * (i.icms/100)) as vlr_st, ' + 'n.NCM, ' + 'n.CEST, ' + 'n.UF_ORIGEM as ORIGEM, ' + 'n.UF AS DESTINO, ' + 'n.MVA, ' + '            case when p.preco_venda = 0 ' + '                 then 0 ' + '                 else ' + '                   case when n.MVA = 0 ' + '                        then 0  ' + '                        else ' + '                          ( ' + '                           ( ' +
    '                            ( ' + '                             ( ' + '                              (p.preco_venda * (1+(n.MVA/100))) * (n.ALIQ_ICMS_INTERNA/100) ' + '                             ) ' + '                             - ' + '                             (p.preco_venda * (i.icms/100)) ' + '                            ) ' + '                            / ' + '                            p.PRECO_VENDA ' + '                           ) ' + '                           * 100 ' +
    '                          ) ' + '                        end ' + '                 end ' + '         as perc_st ' + 'from produto p ' + 'inner join grupo g on g.cod_grupo=p.cod_grupo ' + 'left outer join mva n on (n.CEST = coalesce(p.CEST, g.CEST) and ' + '                     (                                                          ' + '                      n.ncm = coalesce(p.NCM, g.ncm) or                         ' +
    '                      n.ncm = substring(coalesce(p.NCM, g.ncm) from 1 for 9) or ' + '                      n.ncm = substring(coalesce(p.NCM, g.ncm) from 1 for 8) or ' + '                      n.ncm = substring(coalesce(p.NCM, g.ncm) from 1 for 7) or ' + '                      n.ncm = substring(coalesce(p.NCM, g.ncm) from 1 for 6) or ' + '                      n.ncm = substring(coalesce(p.NCM, g.ncm) from 1 for 5) or ' + '                      n.ncm = substring(coalesce(p.NCM, g.ncm) from 1 for 4) ' + '                     ))                                                 ' + 'left outer join icms i on (i.UF = n.UF and i.UF_ORIGEM = n.UF_ORIGEM) ' + 'where 1 = 1  and n.UF_ORIGEM = ''SC'' and n.UF = ''SC'' ';

  if rbRevenda.Checked then
    cmd := cmd + ' and p.revenda = ''S''';

  if rbOutros.Checked then
    cmd := cmd + ' and p.revenda = ''N''';

  if rbAtivo.Checked then
    cmd := cmd + ' and p.status <> ''S''';

  if rbInativo.Checked then
    cmd := cmd + ' and p.status = ''S''';

  if rbPromocao.Checked then
    cmd := cmd + ' and p.promocao = ''S''';

  if rbIndisponivel.Checked then
    cmd := cmd + ' and p.indisponivel = ''S''';

  if rbDisponivel.Checked then
    cmd := cmd + ' and p.indisponivel = ''N''';

  if edGrupo.Text <> '' then
    cmd := cmd + fmfun.cmdAux('p.cod_grupo', edGrupo.Text);

  if edFornecedor.Text <> '' then
    cmd2 := cmd2 + ' and ( 1 = 1 ' + fmfun.cmdAux('p.fornecedor_principal', edFornecedor.Text) + ' or 0 < (SELECT count(*) FROM PRODUTO_FORNECEDOR pf where pf.cod_produto = p.cod_produto ' + fmfun.cmdAux('pf.cod_fornecedor', edFornecedor.Text) + '))';


  if Alfabeticamente.Checked then
    cmd2 := cmd2 + ' order by nom_grupo, nom_produto';

  if OrdemInterna.Checked then
    cmd2 := cmd2 + ' order by nom_grupo, ord_pauta';

  if CodigoProduto.Checked then
    cmd2 := cmd2 + ' order by nom_grupo, cod_produto';

  with dm.q_pauta_venda do
  begin
    close;
    sql.clear;
    sql.add(cmd + cmd2);
    open;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\pauta_venda_est.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.relatorio_transferencias(dta_inicial, dta_final, cod_fornecedor, cod_marca, cod_grupo, cod_empresa: string);
begin
  with dm.q_entradas do
  begin
    close;
    sql.clear;
    sql.add('select e1.nr_documento,e1.dta_documento, e1.cod_fornecedor, fp.fantasia as fantasia_produto, p.custo as custo_produto,' + 'e.nom_empresa, e1.empresa_destino, e1.cod_fiscal, e1.tot_itens, e1.vl_total,' + 'e2.cod_produto, e2.custo, e2.qtd_entrada, e2.id_cor, e2.id_tamanho, e2.cod_colecao, e2.sub_total,' + 'f.razao_social,p.ref_fabrica, f.fantasia, p.nom_produto, cr.cor, tm.tamanho, cl.descricao as nom_colecao,' + 'm.nom_marca from entrada2 e2 ' +
      'left join entrada1 e1 on (e1.nr_documento=e2.nr_documento) and (e1.cod_fornecedor=e2.cod_fornecedor) ' + 'left join fornecedor f on f.cod_fornecedor=e1.cod_fornecedor ' + 'left join produto p on p.cod_produto=e2.cod_produto ' + 'left join cores cr on cr.id=e2.id_cor ' + 'left join tamanho tm on tm.id=e2.id_tamanho ' + 'left join colecao cl on cl.id=e2.cod_colecao ' + 'left join marcas m on m.id=p.id_marca ' + 'left join empresa e on e.cod_empresa = e1.empresa_destino ' + 'left join fornecedor fp on fp.cod_fornecedor=p.fornecedor_principal ' + 'where dta_documento between ' + quotedstr(dta_inicial) + ' and ' + quotedstr(dta_final) + ' and (cod_fiscal=' + quotedstr('5152') + ')' + ' and rom_enviado=' + quotedstr('S'));

    if cod_empresa <> '' then
      sql.add(' and e1.empresa_destino=' + quotedstr(cod_empresa));

    if cod_fornecedor <> '' then
      sql.add(' and p.fornecedor_principal=' + quotedstr(cod_fornecedor));

    if cod_marca <> '' then
      sql.add(' and p.id_marca=' + quotedstr(cod_marca));

    if cod_grupo <> '' then
      sql.add(' and p.cod_grupo=' + quotedstr(cod_grupo));

    sql.add(' order by e.nom_empresa, fp.fantasia, p.nom_produto, e2.nr_documento ');
    open;
  end;
  if dm.q_entradas.RecordCount <= 0 then
  begin
    dao.msg('Não foi Encontrado Dados para Gerar o Relatório!');
    exit;
  end;
  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\relacao_transferencias.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

  { sql.add('select e1.nr_documento,e1.dta_documento, e1.cod_fornecedor, fp.fantasia as fantasia_produto, e.nom_empresa, e1.empresa_destino, e1.cod_fiscal, e1.tot_itens, e1.vl_total,'+
    'e2.cod_produto, e2.custo, e2.qtd_entrada, e2.id_cor, e2.id_tamanho, e2.cod_colecao,'+
    'f.razao_social, f.fantasia, p.nom_produto, p.ref_fabrica, cr.cor, tm.tamanho, cl.descricao as nom_colecao,'+
    'm.nom_marca, e2.sub_total from entrada2 e2 '+
    'left join entrada1 e1 on (e1.nr_documento=e2.nr_documento) and (e1.cod_fornecedor=e2.cod_fornecedor) '+
    'left join fornecedor f on f.cod_fornecedor=e1.cod_fornecedor '+
    'left join produto p on p.cod_produto=e2.cod_produto '+
    'left join cores cr on cr.id=e2.id_cor '+
    'left join tamanho tm on tm.id=e2.id_tamanho '+
    'left join colecao cl on cl.id=e2.cod_colecao '+
    'left join marcas m on m.id=p.id_marca '+
    'left join empresa e on e.cod_empresa = e1.empresa_destino '+
    'left join fornecedor fp on fp.cod_fornecedor=p.fornecedor_principal '+
    'where dta_documento between '+QuotedStr(dta_inicial)+' and '+QuotedStr(dta_final)+' and (cod_fiscal='+QuotedStr('5152')+')'); }

end;

procedure TFr_opc_relatorios.Prcod_representanteButtonClick(Sender: TObject);
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
  chamou_form := 'fr_opc_relatorio_representante';
  chamou_cadastro := 'Fr_representante';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Representante';

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
    Fr_localizar.CBcampos.Items.add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  Prcod_representante.SetFocus;

  if edCodRepresentante.Text = '' then
  begin
    edCodRepresentante.Text := edCodRepresentante.Text + ';' +
      Prcod_representante.Text;
    if pos(';', edCodRepresentante.Text) = 1 then
      edCodRepresentante.Text := copy(edCodRepresentante.Text, 2, length(edCodRepresentante.Text));
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_opc_relatorios.Prcod_representanteExit(Sender: TObject);
begin
  if trim(Prcod_representante.Text) = '' then
    Lbnom_representante.Caption := '...';

  if Prcod_representante.Text <> '' then
  begin
    if (not fmfun.verificaNumerico(Prcod_representante.Text)) and (length(Prcod_representante.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      Prcod_representante.SetFocus;
      exit;
    end;

    dao.Geral2('select NOM_REPRESENTANTE from representante where  funcionario in (''0'', ''1'', ''4'') and id=' + quotedstr(Prcod_representante.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_representante.Caption := dao.q2.fieldbyname('NOM_REPRESENTANTE').AsString;

      if edCodRepresentante.Text = '' then
        edCodRepresentante.Text := Prcod_representante.Text
      else
        edCodRepresentante.Text := Prcod_representante.Text + ';' + edCodRepresentante.Text;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_representante.Text := '';
      Prcod_representante.SetFocus;
      exit;
    end;
  end;
end;

procedure TFr_opc_relatorios.PrfopButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Forma de Pagamento';
  chamou_pesquisa := 'fr_fop';
  chamou_form := 'fr_opc_relatorio_fop';
  chamou_cadastro := 'fr_fop';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Fop';
  Fr_localizar.BT_cadastro.Visible := true;

  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';

  for i := 0 to 1 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.add(Campos_combo[i]);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  Prfop.SetFocus;

  if edfop.Text = '' then
  begin
    edfop.Text := edfop.Text + ';' + Prfop.Text;
    if pos(';', edfop.Text) = 1 then
      edfop.Text := copy(edfop.Text, 2, length(edfop.Text));
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_opc_relatorios.PrfopKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: array of string;
  i: Integer;
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
    if (Prfop.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Forma de Pagamento';
      chamou_pesquisa := 'fr_fop';
      chamou_form := 'fr_opc_relatorio_fop';
      chamou_cadastro := 'fr_fop';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Fop';
      Fr_localizar.BT_cadastro.Visible := true;

      SetLength(Campos_combo, 2);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Nome';

      for i := 0 to 1 do
      begin
        valor_combo := Campos_combo[i];
        Fr_localizar.CBcampos.Items.add(Campos_combo[i]);
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

procedure TFr_opc_relatorios.PrfopExit(Sender: TObject);
begin
  if trim(Prfop.Text) = '' then
    lbfop.Caption := '...';

  if Prfop.Text <> '' then
  begin

    if (not fmfun.verificaNumerico(Prfop.Text)) and (length(Prfop.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      Prfop.SetFocus;
      exit;
    end;

    dao.Geral2('select nom_fop from fop where cod_fop=' + quotedstr(Prfop.Text));
    if dao.q2.RecordCount > 0 then
    begin
      lbfop.Caption := dao.q2.fieldbyname('nom_fop').AsString;
      if edfop.Text = '' then
        edfop.Text := Prfop.Text
      else
        edfop.Text := Prfop.Text + ';' + edfop.Text;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prfop.Text := '';
      Prfop.SetFocus;
      exit;
    end;
  end;

end;

procedure TFr_opc_relatorios.relatorio_contas_receber(dta_ini, dta_fin, cod_empresa, cod_representante, cod_cliente, cod_fop, finalizado: string);
var
  cmd: string;
begin
  cmd := 'select ' +
         '  cr1.dtaven, ' +
         '  cr1.dtarec, ' +
         '  cr1.titulo, ' +
         '  cast(SUBSTRING(cr1.historico1 from 1 for 300) as varchar(300)) as historico, ' +
         '  cr1.sequencia, ' +
         '  cr1.valor, ' +
         '  coalesce(cr1.valor_recebido, 0) as valor_recebido, ' +
         '  c.nom_cliente, ' +
         '  c.telefone, ' +
         '  fp.nom_fop, fp.cod_fop, ' +
         '  e.nom_empresa, ' +
         '  r.nom_representante, ' +
         '  cr1.NR_DOCUMENTO AS NUMDOC, ' +
         '  cast(cc.id||''-''||trim(cc.NR_AGENCIA)||''/''||cc.NR_CONTA||''-''||bc.NOM_BANCO as varchar(100)) as conta, ' +
         '  v.DTA_EMISSAO, ' +
         '  v.DTADOC, ' +
         '  rr.NOM_REPRESENTANTE as vendedor_pedido ' +
         'from ' +
         '  cr1 cr1 ' +
         'left join cliente c on c.cod_cliente= cr1.cod_cliente ' +
         'left join fop fp on fp.cod_fop=cr1.cod_fop ' +
         'left join empresa e on e.cod_empresa=cr1.cod_empresa ' +
         'left join representante r on r.id=cr1.id_representante ' +
         'left join vendas1 v on v.NUMDOC = cr1.NR_DOCUMENTO ' +
         'LEFT OUTER join CONTA_CORRENTE cc on (cc.ID = coalesce(cr1.CONTA_BOLETO, v.conta_boleto)) ' +
         'left outer join banco bc on (cc.ID_BANCO = bc.ID) ' +
         'left join REPRESENTANTE rr on rr.id = v.COD_REPRESENTANTE ' +
         'where 1 = 1 ';
  if finalizado = 'S' then
    cmd := cmd + ' and CR1.dtarec between ' + quotedstr(formatdatetime('dd/mm/yyyy', strtodate(dta_ini))) + ' and ' + quotedstr(formatdatetime('dd/mm/yyyy', strtodate(dta_fin)))
  else
    cmd := cmd + ' and CR1.dtaven between ' + quotedstr(formatdatetime('dd/mm/yyyy', strtodate(dta_ini))) + ' and ' + quotedstr(formatdatetime('dd/mm/yyyy', strtodate(dta_fin)));

  if edPlanoContas.Text <> '' then
    cmd := cmd + fmfun.cmdAux('CR1.ID_PLANO_CONTAS', edPlanoContas.Text);

  if edContaCorrente.Text <> '' then
    cmd := cmd + fmfun.cmdAux('cc.ID', edContaCorrente.Text);

  if edDesc.Text <> '' then
    cmd := cmd + ' and cr1.historico1 like ''%' + edDesc.Text + '%''';

  if Prempresa.Text <> '' then
    cmd := cmd + ' and cr1.cod_empresa= ' + quotedstr(Prempresa.Text);

  if edCodRepresentante.Text <> '' then
    cmd := cmd + fmfun.cmdAux('v.COD_REPRESENTANTE', edCodRepresentante.Text);

  if edMesoRegiao.Text <> '' then
    cmd := cmd + ' and c.cod_cidade in (SELECT CD.COD_CIDADE FROM CIDADES CD WHERE 1 = 1 ' + fmfun.cmdAux('CD.MESOCOD', edMesoRegiao.Text) + ')';

  if edMicroRegiao.Text <> '' then
    cmd := cmd + ' and c.cod_cidade in (SELECT CD.COD_CIDADE FROM CIDADES CD WHERE 1 = 1 ' + fmfun.cmdAux('CD.MICROCOD', edMicroRegiao.Text) + ')';

  if edCidade.Text <> '' then
    cmd := cmd + fmfun.cmdAux('c.cod_cidade', edCidade.Text);

  if edPlanoContas.Text <> '' then
  begin
    cmd := cmd + fmfun.cmdAux('CR1.ID_PLANO_CONTAS', edPlanoContas.Text);
  end;

  if edCliente.Text <> '' then
    cmd := cmd + fmfun.cmdAux('cr1.cod_cliente', edCliente.Text);

  if edfop.Text <> '' then
    cmd := cmd + fmfun.cmdAux('cr1.cod_fop', edfop.Text);

  if Prfinalizado.Checked then
    cmd := cmd + ' and dtarec is not null '
  else if Praberto.Checked then
    cmd := cmd + ' and dtarec is null'
  else if PrPagoAtraso.Checked then
    cmd := cmd + ' and dtarec > dtaven '
  else if PrProtesto.Checked then
    cmd := cmd + ' and protesto = ''S'' ';

  cmd := cmd + ' order by cr1.dtaven, nom_empresa, conta ';

  with dm.q_contas_receber do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_contas_receber.RecordCount <= 0 then
  begin
    dao.msg('Não foi encontrado Registros para gerar o Relatório');
    exit;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\contas_receber.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.relatorio_cobranca;
var
  cmd: string;
begin
  cmd := 'SELECT a.ID, a.COD_CLIENTE, a.NR_DOCUMENTO, a.TITULO, a.SEQUENCIA,' + 'a.COD_EMPRESA, a.DTAVEN, a.VALOR, a.COD_FOP, a.HISTORICO, a.DTAREC, a.BOLETO_RETORNO_CODIGO, a.BOLETO_RETORNO_DESCRICAO, ' + 'a.VALOR_RECEBIDO, a.SALDO, a.DIAS_ATRASO, a.VLR_CORRIGIDO, a.DESCONTO, ' + 'a.NR_CUPOM, a.CONFERIDO, a.ID_REPRESENTANTE, a.VLR_COMISSAO, a.ID_PLANO_CONTAS, ' + 'a.SINCRONIZAR_PALM, a.EXTRATO, a.VALOR_CORRIGIDO, a.BOLETO_REMESSA_ORDEM, ' +
    'bc.NR_BANCO, bc.NOM_BANCO, cc.NR_AGENCIA, cc.NR_CONTA, cc.CODIGO_CEDENTE, ' + 'case when a.id is null then ''SEM REMESSA'' else ''CB''||lpad(b.DIA,2,''0'')||lpad(b.MES,2,''0'')||b.ID||''.REM'' end AS ARQUIVO, coalesce(b.data, current_date) as data, ' + 'CL.COD_CLIENTE, CL.NOM_CLIENTE FROM CR1 a inner join vendas1 v1 on (v1.NUMDOC = a.NR_DOCUMENTO) ' + 'inner join CLIENTE CL on (CL.COD_CLIENTE = V1.COD_CLIENTE) ' + 'inner join CONTA_CORRENTE cc on (cc.ID = v1.CONTA_BOLETO) ' + 'inner join banco bc on (cc.ID_BANCO = bc.ID) ' + 'left outer join BOLETO_REMESSA_ORDEM b on (b.ID = a.BOLETO_REMESSA_ORDEM) ' + 'WHERE 1 = 1 ';

  cmd := cmd + ' and coalesce(b.data, current_date) between ' + quotedstr(formatdatetime('dd/mm/yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd/mm/yyyy', Prdta_final.date));

  if edContaCorrente.Text <> '' then
    cmd := cmd + fmfun.cmdAux('cc.ID', edContaCorrente.Text);

  if edCodRepresentante.Text <> '' then
    cmd := cmd + fmfun.cmdAux('A.COD_REPRESENTANTE', edCodRepresentante.Text);

  if edPlanoContas.Text <> '' then
    cmd := cmd + fmfun.cmdAux('A.ID_PLANO_CONTAS', edPlanoContas.Text);

  if edCliente.Text <> '' then
    cmd := cmd + fmfun.cmdAux('a.cod_cliente', edCliente.Text);

  if Prfinalizado.Checked then
    cmd := cmd + ' and dtarec is not null '
  else
    cmd := cmd + ' and dtarec is null';

  cmd := cmd + ' order by bc.NR_BANCO, b.ID, a.dtaven';
  with dm.q_cobranca do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_cobranca.RecordCount <= 0 then
  begin
    dao.msg('Não foi encontrado Registros para gerar o Relatório');
    exit;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\cobranca.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.Prcod_representanteKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: array of string;
  i: Integer;
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
      chamou_form := 'fr_opc_relatorio_representante';
      chamou_cadastro := 'Fr_representante';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Representante';

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
        Fr_localizar.CBcampos.Items.add(valor_combo);
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

procedure TFr_opc_relatorios.relatorio_vendas_vendedor(c_fornecedor, c_loja, c_grupo, c_vendedor, c_marca, c_produto: string);
var
  cmd, cmd1, cmd2: string;
begin
  cmd := 'SELECT DISTINCT * FROM (SELECT V2.COD_PRODUTO, v2.COD_CLIENTE, ID_COR, ID_TAMANHO, QTD, PRECO, SUB_TOTAL, p.nom_produto,p.preco_venda, c.cor, cl.telefone, cl.email,p.fornecedor_principal, ' + 't.tamanho,cl.nom_cliente, v2.numdoc, v1.cod_fop, fp.nom_fop, v1.dtadoc, v1.desconto, v1.qtd_parcelas, v1.prazo_pgto, v1.tot_bruto, v2.preco_bruto, f.fantasia, e.nom_empresa, ' + 'v2.desconto as desconto_item, v1.tot_liquido, r.nom_representante, v1.credito_usado, m.nom_marca from vendas2 v2 ' +
    'left join vendas1 v1 on v1.numdoc = v2.numdoc ' + 'left join fop fp on fp.cod_fop = v1.cod_fop ' + 'LEFT JOIN PRODUTO P ON P.COD_PRODUTO = V2.COD_PRODUTO ' + 'left join cores c on c.id = v2.id_cor ' + 'left join tamanho t on t.id = v2.id_tamanho ' + 'left join cliente cl on cl.cod_cliente=v2.cod_cliente ' + 'left join representante r on r.id=v1.cod_representante ' + 'left join marcas m on m.id=p.id_marca ' + 'left join fornecedor f on f.cod_fornecedor=p.fornecedor_principal ' +
    'left join empresa e on e.cod_empresa = v1.empresa_faturar ' + 'where case when v1.FATURADO = ''1'' then v1.DTA_EMISSAO else v1.dtadoc END between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date)) + ' and v1.consignacao<>' + quotedstr('1') + ' and v1.orcamento=' + quotedstr('0'); // +' and tipo_venda<>'+QuotedStr('D');

  cmd2 := ' union SELECT V2.COD_PRODUTO, v2.COD_CLIENTE, ID_COR, ID_TAMANHO, QTD, PRECO, SUB_TOTAL, p.nom_produto,p.preco_venda, c.cor, cl.telefone, cl.email,p.fornecedor_principal, ' + 't.tamanho,cl.nom_cliente, v2.numdoc, v1.cod_fop, fp.nom_fop, v1.dtadoc, v1.desconto, v1.qtd_parcelas, v1.prazo_pgto, v1.tot_bruto, v2.preco_bruto, f.fantasia, e.nom_empresa, ' + 'v2.desconto as desconto_item, v1.tot_liquido, r.nom_representante, v1.credito_usado, m.nom_marca from vendas2 v2 ' +
    'left join vendas1 v1 on v1.numdoc = v2.numdoc ' + 'left join fop fp on fp.cod_fop = v1.cod_fop ' + 'LEFT JOIN PRODUTO P ON P.COD_PRODUTO = V2.COD_PRODUTO ' + 'left join cores c on c.id = v2.id_cor ' + 'left join tamanho t on t.id = v2.id_tamanho ' + 'left join cliente cl on cl.cod_cliente=v2.cod_cliente ' + 'left join representante r on r.id=v1.cod_supervisor ' + 'left join marcas m on m.id=p.id_marca ' + 'left join fornecedor f on f.cod_fornecedor=p.fornecedor_principal ' +
    'left join empresa e on e.cod_empresa = v1.empresa_faturar ' + 'where case when v1.FATURADO = ''1'' then v1.DTA_EMISSAO else v1.dtadoc END between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date)) + ' and v1.consignacao<>' + quotedstr('1') + ' and v1.orcamento=' + quotedstr('0'); // +' and tipo_venda<>'+QuotedStr('D');

  if c_fornecedor <> '' then
    cmd1 := cmd1 + ' and p.fornecedor_principal = ' + quotedstr(c_fornecedor);

  if c_loja <> '' then
    cmd1 := cmd1 + ' and v1.empresa_faturar = ' + quotedstr(c_loja);

  if c_grupo <> '' then
    cmd1 := cmd1 + ' and p.cod_grupo=' + quotedstr(c_grupo);

  if c_vendedor <> '' then
    cmd1 := cmd1 + ' and r.id=' + quotedstr(c_vendedor);

  if edcodsupervisor.Text <> '' then
    cmd1 := cmd1 + fmfun.cmdAux('v1.cod_supervisor', edcodsupervisor.Text);

  if c_marca <> '' then
    cmd1 := cmd1 + ' and v1.id_marca=' + quotedstr(c_marca);

  if c_produto <> '' then
  begin
    cmd1 := cmd1 + fmfun.cmdAux('v2.cod_produto', c_produto);
  end;

  cmd := cmd + cmd1 + cmd2 + cmd1 + ') order by nom_empresa, nom_representante, fantasia, numdoc ';

  with dm.q_vendas2 do
  begin
    close;
    sql.clear;

    sql.add(cmd);
    open;
  end;

  if dm.q_vendas2.RecordCount <= 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\vendas_vendedor.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.relatorio_vendas_vendedor_ind(c_fornecedor, c_loja, c_grupo, c_vendedor, c_marca, c_produto: string);
var
  cmd, cmd1, cmd2: string;
begin
  cmd := 'SELECT DISTINCT * FROM (SELECT V1.COD_SUPERVISOR, V2.COD_PRODUTO, v2.COD_CLIENTE, ID_COR, ID_TAMANHO, QTD, PRECO, SUB_TOTAL, p.nom_produto,p.preco_venda, c.cor, cl.telefone, cl.email,p.fornecedor_principal, ' + 't.tamanho,cl.nom_cliente, v2.numdoc, v1.cod_fop, fp.nom_fop, v1.dtadoc, v1.desconto, v1.qtd_parcelas, v1.prazo_pgto, v1.tot_bruto, v2.preco_bruto, f.fantasia, e.nom_empresa, ' +
    'v2.desconto as desconto_item, v1.tot_liquido, r.nom_representante, v1.credito_usado, m.nom_marca from vendas2 v2 ' + 'left join vendas1 v1 on v1.numdoc = v2.numdoc ' + 'left join fop fp on fp.cod_fop = v1.cod_fop ' + 'LEFT JOIN PRODUTO P ON P.COD_PRODUTO = V2.COD_PRODUTO ' + 'left join cores c on c.id = v2.id_cor ' + 'left join tamanho t on t.id = v2.id_tamanho ' + 'left join cliente cl on cl.cod_cliente=v2.cod_cliente ' + 'left join representante r on r.id=v1.cod_representante ' +
    'left join marcas m on m.id=p.id_marca ' + 'left join fornecedor f on f.cod_fornecedor=p.fornecedor_principal ' + 'left join empresa e on e.cod_empresa = v1.empresa_faturar ' + 'where case when v1.FATURADO = ''1'' then v1.DTA_EMISSAO else v1.dtadoc END between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date)) + ' and v1.consignacao<>' + quotedstr('1') + ' and v1.orcamento=' + quotedstr('0') + ' and v1.cod_fop<>' + quotedstr('9');
  // +' and tipo_venda<>'+QuotedStr('D');

  cmd2 := ' UNION SELECT  V1.COD_SUPERVISOR, V2.COD_PRODUTO, v2.COD_CLIENTE, ID_COR, ID_TAMANHO, QTD, PRECO, SUB_TOTAL, p.nom_produto,p.preco_venda, c.cor, cl.telefone, cl.email,p.fornecedor_principal, ' + 't.tamanho,cl.nom_cliente, v2.numdoc, v1.cod_fop, fp.nom_fop, v1.dtadoc, v1.desconto, v1.qtd_parcelas, v1.prazo_pgto, v1.tot_bruto, v2.preco_bruto, f.fantasia, e.nom_empresa, ' + 'v2.desconto as desconto_item, v1.tot_liquido, r.nom_representante, v1.credito_usado, m.nom_marca from vendas2 v2 ' +
    'left join vendas1 v1 on v1.numdoc = v2.numdoc ' + 'left join fop fp on fp.cod_fop = v1.cod_fop ' + 'LEFT JOIN PRODUTO P ON P.COD_PRODUTO = V2.COD_PRODUTO ' + 'left join cores c on c.id = v2.id_cor ' + 'left join tamanho t on t.id = v2.id_tamanho ' + 'left join cliente cl on cl.cod_cliente=v2.cod_cliente ' + 'left join representante r on r.id=v1.cod_supervisor ' + 'left join marcas m on m.id=p.id_marca ' + 'left join fornecedor f on f.cod_fornecedor=p.fornecedor_principal ' +
    'left join empresa e on e.cod_empresa = v1.empresa_faturar ' +
    'where  (v1.COD_FISCAL not in (''6152'', ''6409'') OR V1.COD_FISCAL IS NULL) and  V1.NFEENTRADASAIDA = ''0'' AND V1.PROCESSO_ID NOT IN (SELECT PROCESSO_ID FROM VENDAS1 WHERE FATURADO <> 2 AND NFEENTRADASAIDA = ''1'') AND v1.NFE_DEV is null '+
    ' and case when v1.FATURADO = ''1'' then v1.DTA_EMISSAO else v1.dtadoc END between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date)) +
    '  and v1.consignacao <> ' + quotedstr('1') + ' and v1.cod_fop <> ' + quotedstr('9');
  // +' and tipo_venda<>'+QuotedStr('D');

  if c_fornecedor <> '' then
    cmd1 := cmd1 + ' and p.fornecedor_principal = ' + quotedstr(c_fornecedor);

  if c_loja <> '' then
    cmd1 := cmd1 + ' and v1.empresa_faturar = ' + quotedstr(c_loja);

  if c_grupo <> '' then
    cmd1 := cmd1 + ' and p.cod_grupo=' + quotedstr(c_grupo);

  if c_vendedor <> '' then
    cmd1 := cmd1 + ' and r.id =' + quotedstr(c_vendedor);

  if edcodsupervisor.Text <> '' then
    cmd := cmd + fmfun.cmdAux('v1.cod_supervisor', edcodsupervisor.Text);

  if c_marca <> '' then
    cmd1 := cmd1 + ' and v1.id_marca=' + quotedstr(c_marca);

  if edCliente.Text <> '' then
    cmd1 := cmd1 + fmfun.cmdAux('v1.cod_cliente', edCliente.Text);

  if c_produto <> '' then
  begin
    // cmd := cmd + ' and v2.cod_produto=' + QuotedStr(c_produto);
    cmd1 := cmd1 + fmfun.cmdAux('v2.cod_produto', c_produto);
  end;

  if zzfaturado.Checked then
    cmd := cmd + ' and faturado=' + quotedstr('1') + ' and v1.orcamento=' + quotedstr('0')
  else if zznao_faturado.Checked then
    cmd := cmd + ' and faturado=' + quotedstr('0') + ' and v1.orcamento=' + quotedstr('0')
  else if zzdesativados.Checked then
    cmd := cmd + ' and faturado=' + quotedstr('4') + ' and v1.orcamento=' + quotedstr('0')
  else if zzfaturado_todos.Checked then
    cmd := cmd + ' and faturado<>' + quotedstr('4') + ' and v1.orcamento=' + quotedstr('0')
  else if zzorcamento.Checked then
    cmd := cmd + ' and faturado=' + quotedstr('0') + ' and v1.orcamento=' + quotedstr('1');

  if c_vendedor <> '' then
    cmd := cmd + cmd1 + ' ) order by nom_empresa, nom_representante, fantasia, numdoc '
  else
    cmd := cmd + cmd1 + ' ) order by nom_empresa, nom_representante, fantasia, numdoc ';
  // + cmd2 + cmd1

  with dm.q_vendas2 do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    // dm.q_vendas2.sql.SaveToFile('C:\vendas_vendedor1.sql');
    open;
  end;

  if dm.q_vendas2.RecordCount <= 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\vendas_vendedor_ind.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;
end;

procedure TFr_opc_relatorios.relatorio_televendas;
var
  cmd, cmd_data, cmd_faturado: string;
begin

  if Rb_filtro_faturamento.Checked then
    cmd_data := 'extract(month from vt.dta_emissao)||extract(year from vt.dta_emissao) = extract(month from v1.dta_emissao)||extract(year from v1.dta_emissao) ';

  if Rb_filtro_emissao.Checked then
    cmd_data := 'extract(month from vt.DTADOC)||extract(year from vt.DTADOC) = extract(month from v1.DTADOC)||extract(year from v1.DTADOC) ';

  if zzfaturado_todos.Checked then
    cmd_faturado := ''
  else
    cmd_faturado := ' and vt.faturado = v1.faturado ';

  cmd := 'select distinct v1.cod_representante, v1.cod_supervisor, v1.numdoc, v1.COD_EMPRESA, v1.nfe, v1.DTA_EMISSAO, v1.dtadoc, v1.tot_liquido, ' + ' coalesce((select sum(valor) from cr1 as cr where cr.nr_documento = v1.NUMDOC),0) - case when cd.UF <> ''SC'' and v1.nfe is not null then v1.VLR_ST else 0 end as valor_cr, ' +
    ' c.cod_cliente||''-''||c.nom_cliente as nom_cliente, c.TELEFONE as fone_cliente, cd.NOM_CIDADE||''-''||cd.uf as cidade_cliente, r.id as CODREP, r.NOM_REPRESENTANTE, b.NOM_BANCO, r.NR_BANCO,r.NR_AGENCIA,r.NR_CONTA_CORRENTE, r.email, r.fone,r.celular, ' + ' case when r.ID in (select cm.ID_REPRESENTANTE from COMISSAO cm) then (select cm.PERC_COMISSAO from comissao cm where cm.ID_REPRESENTANTE = r.ID and v1.DESCONTO between cm.PERC_MINIMO and cm.PERC_MAXIMO) else r.PERC_COMISSAO_FIXA end as comissao, ' +
    ' case when v1.cod_fop in (26, 22, 7, 9) then ''Não'' else ''Sim'' end venda_comissionada, f.NOM_FOP, ' + ' coalesce(vc.margem,0) as margem, ' + ' (select sum(vt.tot_liquido) ' + '  from vendas1 vt ' + '  where ' + '    vt.NUMDOC <= v1.numdoc and ' + cmd_data + ' AND vt.COD_FISCAL not in (''6152'', ''6409'') and VT.NFEENTRADASAIDA = ''0'' AND VT.PROCESSO_ID NOT IN (SELECT PROCESSO_ID FROM VENDAS1 WHERE FATURADO <> 2 AND NFEENTRADASAIDA = ''1'') AND (vt.NFE_DEV is null or vt.STATUS_NFE_DEV = 135) ' + '    and vt.consignacao <> 1 ' + '    and vt.orcamento= 0 ' + '    and vt.faturado not in (2,4,5) ' + cmd_faturado +
    '    and (vt.COD_supervisor = V1.COD_SUPERVISOR) ' + ' ) as acum_tot_liquido, ' + ' (select avg(vc1.MARGEM) ' + '  from vendas1 vt ' + '  left outer join V_COMISSAO vc1 on vc1.numdoc = vt.numdoc ' + '  where ' + '    vt.NUMDOC <= v1.numdoc and ' + cmd_data + '    and  vt.COD_FISCAL not in (''6152'', ''6409'') AND VT.NFEENTRADASAIDA = ''0'' AND VT.PROCESSO_ID NOT IN (SELECT PROCESSO_ID FROM VENDAS1 WHERE FATURADO <> 2 AND NFEENTRADASAIDA = ''1'') AND  (vt.NFE_DEV is null or vt.STATUS_NFE_DEV = 135) ' + '    and vt.consignacao <> 1 ' + '    and vt.orcamento= 0 ' + '    and vt.faturado not in (2,4,5) ' + cmd_faturado +
    '    and (vt.COD_supervisor = V1.COD_SUPERVISOR) ' + ' ) as media_margem ' + 'from vendas1 v1 ' + 'inner join FOP f on (f.COD_FOP = v1.COD_FOP) ' + 'left outer join V_COMISSAO vc on vc.numdoc = v1.numdoc ' + 'left join cliente c on c.cod_cliente=v1.cod_cliente ' + 'inner join cidades cd on (c.cod_cidade = cd.cod_cidade) ' + 'inner join cadmicro mc on (mc.microcod = cd.microcod) ' + 'inner join cadmeso ms on (ms.mesocod = mc.mesocod) ' + 'left join REPRESENTANTE r on r.ID = v1.COD_SUPERVISOR ' + 'left join BANCO b on b.ID = CAST(r.NR_BANCO AS INTEGER) ' + 'where V1.NUMDOC_GRUPO IS NULL ' + '  AND (v1.NFE_DEV is null or v1.STATUS_NFE_DEV = 135) ' + ' and (v1.COD_FISCAL not in (''6152'', ''6409'') OR V1.COD_FISCAL IS NULL) ' + ' and v1.consignacao <> 1 ';

  if Rb_filtro_faturamento.Checked then
    cmd := cmd + ' and v1.dta_emissao between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date));

  if Rb_filtro_emissao.Checked then
    cmd := cmd + ' and v1.dtadoc between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date));

  if edfop.Text <> '' then
    cmd := cmd + fmfun.cmdAux('v1.cod_fop', edfop.Text);

  if edFornecedor.Text <> '' then
    cmd := cmd + ' and v1.NUMDOC in (select distinct v22.numdoc from vendas2 v22 inner join produto p22 on p22.cod_produto = v22.COD_PRODUTO where p22.FORNECEDOR_PRINCIPAL in (' + StringReplace(edFornecedor.Text, ';', ',', [rfReplaceAll]) + ')) ';

  if edCliente.Text <> '' then
    cmd := cmd + fmfun.cmdAux('v1.cod_cliente', edCliente.Text);

  if edCidade.Text <> '' then
    cmd := cmd + fmfun.cmdAux('cd.cod_cidade', edCidade.Text);

  if Pruf.Text <> '' then
    cmd := cmd + ' and cd.uf = ' + quotedstr(Pruf.Text);

  if edMicroRegiao.Text <> '' then
    cmd := cmd + fmfun.cmdAux('mc.microcod', edMicroRegiao.Text);

  if edMesoRegiao.Text <> '' then
    cmd := cmd + fmfun.cmdAux('ms.mesocod', edMesoRegiao.Text);

  if Prempresa.Text <> '' then
    cmd := cmd + ' and v1.empresa_faturar = ' + quotedstr(Prempresa.Text);

  if edGrupo.Text <> '' then
    cmd := cmd + fmfun.cmdAux('p.cod_grupo', edGrupo.Text);

  if edCodRepresentante.Text <> '' then
    cmd := cmd + fmfun.cmdAux('R.ID', edCodRepresentante.Text);

  if edcodsupervisor.Text <> '' then
    cmd := cmd + fmfun.cmdAux('v1.cod_supervisor', edcodsupervisor.Text);

  if Prcod_marca.Text <> '' then
    cmd := cmd + ' and v1.id_marca=' + quotedstr(Prcod_marca.Text);

  if edPedido.Text <> '' then
    cmd := cmd + fmfun.cmdAux('v1.numdoc', edPedido.Text);

  cmd := cmd + '  and v1.faturado <> ' + quotedstr('2');

  if zzfaturado.Checked then
    cmd := cmd + ' and v1.faturado=' + quotedstr('1') + ' and v1.orcamento=' + quotedstr('0')
  else if zznao_faturado.Checked then
    cmd := cmd + ' and v1.faturado=' + quotedstr('0') + ' and v1.orcamento=' + quotedstr('0')
  else if zzdesativados.Checked then
    cmd := cmd + ' and v1.faturado=' + quotedstr('4') + ' and v1.orcamento=' + quotedstr('0')
  else if zzfaturado_todos.Checked then
    cmd := cmd + ' and v1.faturado<>' + quotedstr('4') + ' and v1.orcamento=' + quotedstr('0')
  else if zzorcamento.Checked then
    cmd := cmd + ' and v1.faturado=' + quotedstr('0') + ' and v1.orcamento=' + quotedstr('1');

  if rbSemSupervisao.Checked then
    cmd := cmd + 'and v1.cod_supervisor is null';

  if rbApenasSupervisao.Checked then
    cmd := cmd + 'and v1.cod_supervisor is not null';

  if rbNaoConsumidorFinal.Checked then
    cmd := cmd + 'and coalesce(v1.consumidor_final, ''N'') = ''N'' ';

  if rbApenasConsumidorFinal.Checked then
    cmd := cmd + 'and coalesce(v1.consumidor_final, ''N'') = ''S'' ';



  cmd := cmd + 'order by numdoc';

  with dm.q_televendas do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_televendas.RecordCount < 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\televendas.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.relatorio_vendas_padrao(c_fornecedor, c_loja, c_grupo, c_vendedor, c_marca: string);
var
  cmd, cmd1, cmd2: string;
begin
  cmd :=  'SELECT DISTINCT * '+
          'FROM ( '+
          '       select case '+
          '                when v1.NUMDOC_DESTINO is not null then cast (v1.numdoc || '' => '' || v1.NUMDOC_DESTINO as varchar (100)) '+
          '                else cast (v1.numdoc as varchar (100)) '+
          '              end as numdoc, '+
          '         v1.nfe, '+
          '         v1.DTA_EMISSAO, '+
          '         v1.dtadoc, '+
          '         v1.tot_liquido, '+
          '         coalesce(( '+
          '                    select sum(valor) '+
          '                    from cr1 as cr '+
          '                    where cr.nr_documento = v1.NUMDOC), '+
          '           0) - case '+
          '                  when cd.UF <> ''SC'' and v1.nfe is not null then v1.VLR_ST '+
          '                  else 0 '+
          '                end as valor_cr, '+
          '         c.cod_cliente || ''-'' || c.nom_cliente as nom_cliente, '+
          '         c.TELEFONE as fone_cliente, '+
          '         cd.NOM_CIDADE || ''-'' || cd.uf as cidade_cliente, '+
          '         r.id as CODREP, '+
          '         r.NOM_REPRESENTANTE, '+
          '         b.NOM_BANCO, '+
          '         r.NR_BANCO, '+
          '         r.NR_AGENCIA, '+
          '         r.NR_CONTA_CORRENTE, '+
          '         r.email, '+
          '         r.fone, '+
          '         r.celular, '+
          '         cast(coalesce(v1.desconto, 0) as numeric(15,4)) as desconto, '+
          '         case '+
          '           when r.ID in (select cm.ID_REPRESENTANTE from COMISSAO cm) '+
          '           then (select cm.PERC_COMISSAO '+
          '                 from comissao cm '+
          '                 where cm.ID_REPRESENTANTE = r.ID '+
          '                   and v1.DESCONTO between cm.PERC_MINIMO and cm.PERC_MAXIMO '+
          ') '+
          '           else r.PERC_COMISSAO_FIXA '+
          '         end as comissao, '+
          '         case '+
          '           when v1.cod_fop in (26, 22, 7, 9) then ''Não'' '+
          '           else ''Sim'' '+
          '         end venda_comissionada, '+
          '         f.NOM_FOP, '+
          '         CASE '+
          '           WHEN CASE '+
          '                  WHEN v1.numdoc_grupo IS NOT NULL THEN ( '+
          '                                                          SELECT v.faturado '+
          '                                                          FROM vendas1 v '+
          '                                                          WHERE v.numdoc = v1.numdoc_grupo '+
          '                                                        ) '+
          '                  ELSE v1.faturado '+
          '                END = 1 THEN (CASE '+
          '                                WHEN v1.numdoc_grupo IS NOT NULL THEN ( '+
          '                                                                        SELECT CASE '+
          '                                                                                 WHEN v.faturado = 1 THEN v1.tot_liquido '+
          '                                                                                 ELSE 0::numeric '+
          '                                                                               END AS "case" '+
          '                                                                        FROM vendas1 v '+
          '                                                                        WHERE v.numdoc = v1.numdoc_grupo '+
          '                                                                      ) '+
          '                                ELSE COALESCE(( '+
          '                                                SELECT sum(cr.valor) AS sum '+
          '                                                FROM cr1 cr '+
          '                                                WHERE cr.nr_documento = v1.numdoc '+
          '                                              ), v1.tot_liquido) '+
          '                                     - '+
          '                                     CASE WHEN cd.uf <> ''SC''::bpchar AND v1.nfe IS NOT NULL '+
          '                                          THEN v1.vlr_st '+
          '                                          ELSE 0::numeric '+
          '                                     END '+
          '                                END '+
          '                                - '+
          '                                ( '+
          '                                 ( '+
          '                                   SELECT CASE '+
          '                                            WHEN sum(v2.preco_custo * v2.qtd) = 0::numeric THEN sum(p.custo_total * v2.qtd) '+
          '                                            ELSE sum(v2.preco_custo * v2.qtd) '+
          '                                          END AS sum '+
          '                                   FROM vendas2 v2 '+
          '                                   JOIN produto p ON p.cod_produto = v2.cod_produto '+
          '                                   WHERE v2.numdoc = v1.numdoc '+
          '                                 ) '+
          '                             )) /(( '+
          '        SELECT CASE '+
          '                 WHEN sum(v2.preco_custo * v2.qtd) = 0::numeric THEN sum(p.custo_total * v2.qtd) '+
          '                 ELSE sum(v2.preco_custo * v2.qtd) '+
          '               END AS sum '+
          '        FROM vendas2 v2 '+
          '          JOIN produto p ON p.cod_produto = v2.cod_produto '+
          '        WHERE v2.numdoc = v1.numdoc '+
          ')) * 100::numeric '+
          '           ELSE (v1.tot_liquido -(( '+
          '                                    SELECT CASE '+
          '                                             WHEN sum(v2.preco_custo * v2.qtd) = 0::numeric THEN sum(p.custo_total * v2.qtd) '+
          '                                             ELSE sum(v2.preco_custo * v2.qtd) '+
          '                                           END AS sum '+
          '                                    FROM vendas2 v2 '+
          '                                      JOIN produto p ON p.cod_produto = v2.cod_produto '+
          '                                    WHERE v2.numdoc = v1.numdoc '+
          '))) /(( '+
          '        SELECT CASE '+
          '                 WHEN sum(v2.preco_custo * v2.qtd) = 0::numeric THEN sum(p.custo_total * v2.qtd) '+
          '                 ELSE sum(v2.preco_custo * v2.qtd) '+
          '               END AS sum '+
          '        FROM vendas2 v2 '+
          '          JOIN produto p ON p.cod_produto = v2.cod_produto '+
          '        WHERE v2.numdoc = v1.numdoc '+
          ')) * 100::numeric '+
          '         END AS margem '+
          '       from vendas1 v1 '+
          '         inner join FOP f on (f.COD_FOP = v1.COD_FOP) '+
          '         left join cliente c on c.cod_cliente = v1.cod_cliente '+
          '         inner join cidades cd on (c.cod_cidade = cd.cod_cidade) '+
          '         inner join cadmicro mc on (mc.microcod = cd.microcod) '+
          '         inner join cadmeso ms on (ms.mesocod = mc.mesocod) '+
          '         left join REPRESENTANTE r on r.ID = v1.COD_REPRESENTANTE '+
          '         left join BANCO b on b.ID = CAST (r.NR_BANCO AS INTEGER) '+
          'where V1.NUMDOC_GRUPO IS NULL AND (v1.COD_FISCAL not in (''6152'', ''6409'') OR V1.COD_FISCAL IS NULL) '+
          '  and V1.NFEENTRADASAIDA = ''0'' AND V1.PROCESSO_ID NOT IN (SELECT PROCESSO_ID FROM VENDAS1 WHERE FATURADO <> 2 AND NFEENTRADASAIDA = ''1'') AND  (v1.NFE_DEV is null or v1.STATUS_NFE_DEV = 135) and v1.consignacao <> ' + quotedstr('1');

  cmd1 := '';

  if Rb_filtro_faturamento.Checked then
    cmd1 := cmd1 + ' and v1.dta_emissao between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date));

  if Rb_filtro_emissao.Checked then
    cmd1 := cmd1 + ' and v1.DTADOC between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date));

  if edfop.Text <> '' then
    cmd1 := cmd1 + fmfun.cmdAux('v1.cod_fop', edfop.Text);

  if edFornecedor.Text <> '' then
    cmd := cmd + ' and v1.NUMDOC in (select distinct v22.numdoc from vendas2 v22 inner join produto p22 on p22.cod_produto = v22.COD_PRODUTO where p22.FORNECEDOR_PRINCIPAL in (' + StringReplace(edFornecedor.Text, ';', ',', [rfReplaceAll]) + ')) ';

  if edCliente.Text <> '' then
    cmd1 := cmd1 + fmfun.cmdAux('v1.cod_cliente', edCliente.Text);

  if edCidade.Text <> '' then
    cmd1 := cmd1 + fmfun.cmdAux('cd.cod_cidade', edCidade.Text);

  if Pruf.Text <> '' then
    cmd1 := cmd1 + ' and cd.uf = ' + quotedstr(Pruf.Text);

  if edMicroRegiao.Text <> '' then
    cmd1 := cmd1 + fmfun.cmdAux('mc.microcod', edMicroRegiao.Text);

  if edMesoRegiao.Text <> '' then
    cmd1 := cmd1 + fmfun.cmdAux('ms.mesocod', edMesoRegiao.Text);

  if c_loja <> '' then
    cmd1 := cmd1 + ' and v1.empresa_faturar = ' + quotedstr(c_loja);

  if edGrupo.Text <> '' then
    cmd := cmd + ' and v1.NUMDOC in (select distinct v23.numdoc from vendas2 v23 inner join produto p23 on p23.cod_produto = v23.COD_PRODUTO where p23.COD_GRUPO in (' + StringReplace(edGrupo.Text, ';', ',', [rfReplaceAll]) + ')) ';

  if edCodRepresentante.Text <> '' then
    cmd1 := cmd1 + fmfun.cmdAux('v1.cod_representante', edCodRepresentante.Text);

  if edcodsupervisor.Text <> '' then
    cmd1 := cmd1 + fmfun.cmdAux('v1.cod_supervisor', edcodsupervisor.Text);

  if c_marca <> '' then
    cmd1 := cmd1 + ' and v1.id_marca=' + quotedstr(c_marca);

  if edPedido.Text <> '' then
    cmd1 := cmd1 + fmfun.cmdAux('v1.numdoc', edPedido.Text);

  if trim(edBairro.Text) <> '' then
    cmd1 := cmd1 + ' and c.bairro like ''%' + edBairro.Text + '%''';

  cmd1 := cmd1 + '  and v1.faturado <> ' + quotedstr('2');

  if zzfaturado.Checked then
    cmd1 := cmd1 + ' and v1.faturado=' + quotedstr('1') + ' and v1.orcamento=' + quotedstr('0')
  else if zznao_faturado.Checked then
    cmd1 := cmd1 + ' and v1.faturado=' + quotedstr('0') + ' and v1.orcamento=' + quotedstr('0')
  else if zzdesativados.Checked then
    cmd1 := cmd1 + ' and v1.faturado=' + quotedstr('4') + ' and v1.orcamento=' + quotedstr('0')
  else if zzfaturado_todos.Checked then
    cmd1 := cmd1 + ' and v1.faturado<>' + quotedstr('4') + ' and v1.orcamento=' + quotedstr('0')
  else if zzorcamento.Checked then
    cmd1 := cmd1 + ' and v1.faturado=' + quotedstr('0') + ' and v1.orcamento=' + quotedstr('1');

  if rbSemSupervisao.Checked then
    cmd1 := cmd1 + 'and v1.cod_supervisor is null';

  if rbApenasSupervisao.Checked then
    cmd1 := cmd1 + 'and v1.cod_supervisor is not null';

  if rbNaoConsumidorFinal.Checked then
    cmd := cmd + 'and coalesce(v1.consumidor_final, ''N'') = ''N'' ';

  if rbApenasConsumidorFinal.Checked then
    cmd := cmd + 'and coalesce(v1.consumidor_final, ''N'') = ''S'' ';


  if c_vendedor <> '' then
    cmd := cmd + cmd1 + cmd2 + cmd1 + ') q1 order by venda_comissionada desc, dtadoc, numdoc'
  else
    cmd := cmd + cmd1 + ') q1 order by venda_comissionada desc, dtadoc, numdoc';

  with dm.q_vendas1 do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_vendas1.RecordCount < 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\vendas_padrao_ind.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.relatorio_ranking_produtos;
var
  cmd, cmd1, cmd2: string;
begin
  cmd :=
    'select ' +
    '  g.cod_grupo, ' +
    '  g.nom_grupo, ' +
    '  p.cod_produto, ' +
    '  p.nom_produto, ' +
    '  sum(v2.qtd) as qtd, ' +
    '  max(v2.preco) as preco, ' +
    '  sum(v2.sub_total) as valor_total ' +
    'from produto p ' +
    'inner join grupo g on g.cod_grupo = p.cod_grupo ' +
    'inner join vendas2 v2 on v2.cod_produto = p.cod_produto ' +
    'inner join vendas1 v1 on v1.numdoc = v2.numdoc ' +
    'inner join FOP f on f.COD_FOP = v1.COD_FOP ' +
    'inner join cliente c on c.cod_cliente = v1.cod_cliente ' +
    'inner join cidades cd on c.cod_cidade = cd.cod_cidade ' +
    'inner join cadmicro mc on mc.microcod = cd.microcod ' +
    'inner join cadmeso ms on ms.mesocod = mc.mesocod ' +
    'inner join REPRESENTANTE r on r.ID = v1.COD_REPRESENTANTE ' +
    'where V1.NUMDOC_GRUPO IS NULL ' +
    '  and (v1.COD_FISCAL not in (''6152'', ''6409'') or V1.COD_FISCAL IS NULL) ' +
    '  and (v1.NFE_DEV is null or v1.STATUS_NFE_DEV = 135) ' +
    '  and V1.NFEENTRADASAIDA = ''0'' AND V1.PROCESSO_ID NOT IN (SELECT PROCESSO_ID FROM VENDAS1 WHERE FATURADO <> 2 AND NFEENTRADASAIDA = ''1'') '+
    '  and v1.consignacao <> ' + QuotedStr('1');

  cmd1 := '';

  // === FILTROS DE DATA ===
  if Rb_filtro_faturamento.Checked then
    cmd1 := cmd1 + ' and v1.dta_emissao between ' +
      QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_inicial.Date)) +
      ' and ' +
      QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_final.Date));

  if Rb_filtro_emissao.Checked then
    cmd1 := cmd1 + ' and v1.DTADOC between ' +
      QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_inicial.Date)) +
      ' and ' +
      QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_final.Date));

  // === OUTROS FILTROS ===
  if edfop.Text <> '' then
    cmd1 := cmd1 + fmfun.cmdAux('v1.cod_fop', edfop.Text);

  if edFornecedor.Text <> '' then
    cmd := cmd +' and p.FORNECEDOR_PRINCIPAL in (' +
      StringReplace(edFornecedor.Text, ';', ',', [rfReplaceAll]) + ') ';

  if edCliente.Text <> '' then
    cmd1 := cmd1 + fmfun.cmdAux('v1.cod_cliente', edCliente.Text);

  if edCidade.Text <> '' then
    cmd1 := cmd1 + fmfun.cmdAux('cd.cod_cidade', edCidade.Text);

  if Pruf.Text <> '' then
    cmd1 := cmd1 + ' and cd.uf = ' + QuotedStr(Pruf.Text);

  if edMicroRegiao.Text <> '' then
    cmd1 := cmd1 + fmfun.cmdAux('mc.microcod', edMicroRegiao.Text);

  if edMesoRegiao.Text <> '' then
    cmd1 := cmd1 + fmfun.cmdAux('ms.mesocod', edMesoRegiao.Text);

//Prcod_fornecedor.Text, Prempresa.Text, Prcod_grupo.Text, Prcod_representante.Text, Prcod_marca.Text

  if Prempresa.Text <> '' then
    cmd1 := cmd1 + ' and v1.empresa_faturar = ' + QuotedStr(Prempresa.Text);

  if edGrupo.Text <> '' then
    cmd := cmd +
      ' and p.COD_GRUPO in (' +
      StringReplace(edGrupo.Text, ';', ',', [rfReplaceAll]) +
      ') ';

  if edCodRepresentante.Text <> '' then
    cmd1 := cmd1 + fmfun.cmdAux('v1.cod_representante', edCodRepresentante.Text);

  if edcodsupervisor.Text <> '' then
    cmd1 := cmd1 + fmfun.cmdAux('v1.cod_supervisor', edcodsupervisor.Text);

  if Prcod_marca.Text <> '' then
    cmd1 := cmd1 + ' and v1.id_marca = ' + QuotedStr(Prcod_marca.Text);

  if edPedido.Text <> '' then
    cmd1 := cmd1 + fmfun.cmdAux('v1.numdoc', edPedido.Text);

  if Trim(edBairro.Text) <> '' then
    cmd1 := cmd1 + ' and c.bairro like ' + QuotedStr('%' + edBairro.Text + '%');

  // === STATUS DE FATURAMENTO ===
  cmd1 := cmd1 + ' and v1.faturado <> ' + QuotedStr('2');

  if zzfaturado.Checked then
    cmd1 := cmd1 + ' and v1.faturado=' + QuotedStr('1') + ' and v1.orcamento=' + QuotedStr('0')
  else if zznao_faturado.Checked then
    cmd1 := cmd1 + ' and v1.faturado=' + QuotedStr('0') + ' and v1.orcamento=' + QuotedStr('0')
  else if zzdesativados.Checked then
    cmd1 := cmd1 + ' and v1.faturado=' + QuotedStr('4') + ' and v1.orcamento=' + QuotedStr('0')
  else if zzfaturado_todos.Checked then
    cmd1 := cmd1 + ' and v1.faturado<>' + QuotedStr('4') + ' and v1.orcamento=' + QuotedStr('0')
  else if zzorcamento.Checked then
    cmd1 := cmd1 + ' and v1.faturado=' + QuotedStr('0') + ' and v1.orcamento=' + QuotedStr('1');

  if rbSemSupervisao.Checked then
    cmd1 := cmd1 + ' and v1.cod_supervisor is null';

  if rbApenasSupervisao.Checked then
    cmd1 := cmd1 + ' and v1.cod_supervisor is not null';

  if rbNaoConsumidorFinal.Checked then
    cmd := cmd + 'and coalesce(v1.consumidor_final, ''N'') = ''N'' ';

  if rbApenasConsumidorFinal.Checked then
    cmd := cmd + 'and coalesce(v1.consumidor_final, ''N'') = ''S'' ';


  // === FINALIZA QUERY ===
  cmd := cmd + cmd1 +
    ' group by ' +
    '  g.cod_grupo, ' +
    '  g.nom_grupo, ' +
    '  p.cod_produto, ' +
    '  p.nom_produto ';

  if rgOrdemQtdeValor.ItemIndex = 0 then
    cmd := cmd + ' order by qtd desc, p.nom_produto'
  else
    cmd := cmd + ' order by valor_total desc, p.nom_produto';

  with dm.q_ranking_produtos do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_ranking_produtos.RecordCount < 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\relatorio_ranking_produtos.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

end;



procedure TFr_opc_relatorios.monta_rel_palm;
var
  cmd: string;
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
      ' inner join vendas1 vd1 on cast(vd1.nr_pedido_palm as INTEGER) = v1.nr_pedido_palm' +
      ' LEFT OUTER join CLIENTE c on (c.COD_CLIENTE = v1.COD_CLIENTE)' +
      ' LEFT OUTER join Cidades cid on (cid.COD_Cidade = c.COD_cidade)' +
      ' LEFT OUTER join REPRESENTANTE r on (r.id = v1.COD_REPRESENTANTE)' +
      ' LEFT OUTER join prazo p on (p.ID = v1.COD_PRAZO_PGTO) ' +
      ' LEFT OUTER join fop f on (f.COD_FOP = v1.COD_FOP) ' +
      ' LEFT OUTER join produto pr on (pr.COD_PRODUTO = v2.COD_PRODUTO) WHERE 1 = 1 ';
  if Rb_filtro_faturamento.Checked then
    cmd := cmd + ' and v1.dta_emissao between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date));

  if Rb_filtro_emissao.Checked then
    cmd := cmd + ' and v1.dtadoc between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date));

  if edCliente.Text <> '' then
    cmd := cmd + fmfun.cmdAux('v1.cod_cliente', edCliente.Text);

  if edCodRepresentante.Text <> '' then
    cmd := cmd + fmfun.cmdAux('v1.COD_REPRESENTANTE', edCodRepresentante.Text);

  if edcodsupervisor.Text <> '' then
    cmd := cmd + fmfun.cmdAux('v1.cod_supervisor', edcodsupervisor.Text);

  if zzfaturado.Checked then
    cmd := cmd + ' and v1.faturado=' + quotedstr('1') + ' and v1.orcamento=' + quotedstr('0')
  else if zznao_faturado.Checked then
    cmd := cmd + ' and v1.faturado=' + quotedstr('0') + ' and v1.orcamento=' + quotedstr('0')
  else if zzdesativados.Checked then
    cmd := cmd + ' and v1.faturado=' + quotedstr('4') + ' and v1.orcamento=' + quotedstr('0')
  else if zzfaturado_todos.Checked then
    cmd := cmd + ' and v1.faturado<>' + quotedstr('4') + ' and v1.orcamento=' + quotedstr('0')
  else if zzorcamento.Checked then
    cmd := cmd + ' and v1.faturado=' + quotedstr('0') + ' and v1.orcamento=' + quotedstr('1');

  if rbSemSupervisao.Checked then
    cmd := cmd + 'and v1.cod_supervisor is null';

  if rbApenasSupervisao.Checked then
    cmd := cmd + 'and v1.cod_supervisor is not null';

  if rbNaoConsumidorFinal.Checked then
    cmd := cmd + 'and coalesce(v1.consumidor_final, ''N'') = ''N'' ';

  if rbApenasConsumidorFinal.Checked then
    cmd := cmd + 'and coalesce(v1.consumidor_final, ''N'') = ''S'' ';


  if trim(edPedido.Text) <> '' then
    cmd := cmd + fmfun.cmdAux('v1.NUMDOC', edPedido.Text);

  cmd := cmd + ' order by  representante, NR_CONEXAO, v1.NUMDOC, v2.COD_PRODUTO, v2.VOLUME ';

  with dm.q_palm_pedidos do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_palm_pedidos.RecordCount < 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\palm_pedidos.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.monta_rel_pedidos_vendedor;
var
  cmd: string;
begin
  cmd := 'SELECT v1.COD_REPRESENTANTE, v1.USUARIO_CHECOU_PEDIDO_VENDEDOR||''-''||u.NOME as USUARIO_CHECOU, ' + ' v1.NUMDOC, v1.DTADOC, c.COD_CLIENTE||''-''||c.NOM_CLIENTE as cliente, c.ENDERECO, c.NR_ENDERECO, c.CEP, cid.NOM_CIDADE||''-''||cid.UF as cidade, C.CNPJ, C.IE, C.RG,C.CPF, C.EMAIL, v1.TOT_BRUTO, v1.TOT_LIQUIDO, ' + ' v1.COD_FOP||''-''||f.NOM_FOP as fop, v1.COD_REPRESENTANTE||''-''||r.NOM_REPRESENTANTE as representante, p.PRAZO, v1.NR_PEDIDO_PALM, v1.PALM_NR_CONEXAO, v1.OBSERVACOES_PEDIDO, ' +
    ' v2.ID, v2.COD_PRODUTO||''-''||pr.NOM_PRODUTO as produto, pr.unidade, v2.QTD, v2.PRECO, v2.SUB_TOTAL, v2.PRECO_BRUTO, (((v2.PRECO_BRUTO - v2.PRECO)/v2.PRECO_BRUTO) * 100) AS PERC_DESC, v2.VOLUME ' + ' FROM vendas1 v1 ' + ' LEFT OUTER join tbusu u on (u.CODUSU = v1.USUARIO_CHECOU_PEDIDO_VENDEDOR) ' + ' inner join vendas2 v2 on (v2.NUMDOC = v1.NUMDOC)' + ' inner join CLIENTE c on (c.COD_CLIENTE = v1.COD_CLIENTE)' + ' inner join Cidades cid on (cid.COD_Cidade = c.COD_cidade)' +
    ' inner join REPRESENTANTE r on (r.id = coalesce(v1.cod_supervisor, v1.COD_REPRESENTANTE))' +
    ' LEFT OUTER JOIN prazo p on (p.ID = v1.COD_PRAZO_PGTO)' +
    ' LEFT OUTER JOIN fop f on (f.COD_FOP = v1.COD_FOP) ' +
    ' inner join produto pr on (pr.COD_PRODUTO = v2.COD_PRODUTO) '+
    ' WHERE (v1.COD_FISCAL not in (''6152'', ''6409'') OR V1.COD_FISCAL IS NULL) and V1.NFEENTRADASAIDA = ''0'' '+
    '   AND V1.PROCESSO_ID NOT IN (SELECT PROCESSO_ID FROM VENDAS1 WHERE FATURADO <> 2 AND NFEENTRADASAIDA = ''1'') AND v1.NFE_DEV is null and v1.pedido_vendedor in (''1'', ''2'') ';

  if Rb_filtro_faturamento.Checked then
    cmd := cmd + ' and v1.dta_emissao between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date));

  if Rb_filtro_emissao.Checked then
    cmd := cmd + ' and v1.dtadoc between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date));

  if edCliente.Text <> '' then
    cmd := cmd + fmfun.cmdAux('v1.cod_cliente', edCliente.Text);

  if edCodRepresentante.Text <> '' then
    cmd := cmd + fmfun.cmdAux('v1.COD_REPRESENTANTE', edCodRepresentante.Text);

  if edcodsupervisor.Text <> '' then
    cmd := cmd + fmfun.cmdAux('v1.cod_supervisor', edcodsupervisor.Text);

  if zzfaturado.Checked then
    cmd := cmd + ' and v1.faturado=' + quotedstr('1') + ' and v1.orcamento=' + quotedstr('0')
  else if zznao_faturado.Checked then
    cmd := cmd + ' and v1.faturado=' + quotedstr('0') + ' and v1.orcamento=' + quotedstr('0')
  else if zzdesativados.Checked then
    cmd := cmd + ' and v1.faturado=' + quotedstr('4') + ' and v1.orcamento=' + quotedstr('0')
  else if zzfaturado_todos.Checked then
    cmd := cmd + ' and v1.faturado<>' + quotedstr('4') + ' and v1.orcamento=' + quotedstr('0')
  else if zzorcamento.Checked then
    cmd := cmd + ' and v1.faturado=' + quotedstr('0') + ' and v1.orcamento=' + quotedstr('1');

  if rbSemSupervisao.Checked then
    cmd := cmd + 'and v1.cod_supervisor is null';

  if rbApenasSupervisao.Checked then
    cmd := cmd + 'and v1.cod_supervisor is not null';

  if rbNaoConsumidorFinal.Checked then
    cmd := cmd + 'and coalesce(v1.consumidor_final, ''N'') = ''N'' ';

  if rbApenasConsumidorFinal.Checked then
    cmd := cmd + 'and coalesce(v1.consumidor_final, ''N'') = ''S'' ';


  if trim(edPedido.Text) <> '' then
    cmd := cmd + fmfun.cmdAux('v1.NUMDOC', edPedido.Text);

  cmd := cmd + ' order by  representante, v1.NUMDOC, v2.COD_PRODUTO, v2.VOLUME ';

  with dm.q_pedidos_vendedor do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_pedidos_vendedor.RecordCount < 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\pedidos_vendedor.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.monta_rel_prateleira;
var
  cmd: string;
begin
  cmd := 'SELECT v.NUMDOC, V.DTADOC, V.DTA_EMISSAO, V.TOT_LIQUIDO, c.COD_CLIENTE, ' + '  c.NOM_CLIENTE, p.COD_PRODUTO, p.NOM_PRODUTO, p.cod_prateleira, v2.QTD, ' + '  V.FATURADO, v2.volume, g.cod_grupo, g.nom_grupo from vendas1 v ' + '  inner join cliente c on (c.COD_CLIENTE = v.cod_cliente)' + '  inner join vendas2 v2 on (v.NUMDOC = v2.NUMDOC)' + '  inner join produto p on (p.COD_PRODUTO = v2.COD_PRODUTO)' + '  left join grupo g on (g.COD_GRUPO = p.COD_GRUPO)' + '  where  v.COD_FISCAL not in (''6152'', ''6409'') and V.NFEENTRADASAIDA = ''0'' AND V.PROCESSO_ID NOT IN (SELECT PROCESSO_ID FROM VENDAS1 WHERE FATURADO <> 2 AND NFEENTRADASAIDA = ''1'') AND v.NFE_DEV is null and v.consignacao <> ''1''' + '  v.cod_fop <> ''9'' and p.custo is not null and p.custo > 0 ';

  if Rb_filtro_faturamento.Checked then
    cmd := cmd + ' and v.dta_emissao between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date));

  if Rb_filtro_emissao.Checked then
    cmd := cmd + ' and v.dtadoc between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date));

  if edFornecedor.Text <> '' then
    cmd := cmd + '(1=1 and ' + fmfun.cmdAux('p.fornecedor_principal', edFornecedor.Text) + ' or 0 < (SELECT count(*) FROM PRODUTO_FORNECEDOR pf where pf.cod_produto = p.cod_produto ' + fmfun.cmdAux('pf.cod_fornecedor', edFornecedor.Text) + '))';

  if edGrupo.Text <> '' then
    cmd := cmd + fmfun.cmdAux('p.cod_grupo', edGrupo.Text);

  if rbAtivo.Checked then
    cmd := cmd + ' and p.status <> ' + quotedstr('S');

  if rbInativo.Checked then
    cmd := cmd + ' and p.status = ' + quotedstr('S');

  if rbPromocao.Checked then
    cmd := cmd + ' and p.promocao = ''S''';

  if rbIndisponivel.Checked then
    cmd := cmd + ' and p.indisponivel = ''S''';

  if rbDisponivel.Checked then
    cmd := cmd + ' and p.indisponivel = ''N''';

  if rbRevenda.Checked then
    cmd := cmd + ' and p.revenda = ''S''';

  if rbOutros.Checked then
    cmd := cmd + ' and p.revenda = ''N''';

  if edCliente.Text <> '' then
    cmd := cmd + fmfun.cmdAux('v.cod_cliente', edCliente.Text);

  if zzfaturado.Checked then
    cmd := cmd + ' and v.faturado=' + quotedstr('1') + ' and v.orcamento=' + quotedstr('0')
  else if zznao_faturado.Checked then
    cmd := cmd + ' and v.faturado=' + quotedstr('0') + ' and v.orcamento=' + quotedstr('0')
  else if zzdesativados.Checked then
    cmd := cmd + ' and v.faturado=' + quotedstr('4') + ' and v.orcamento=' + quotedstr('0')
  else if zzfaturado_todos.Checked then
    cmd := cmd + ' and v.faturado<>' + quotedstr('4') + ' and v.orcamento=' + quotedstr('0')
  else if zzorcamento.Checked then
    cmd := cmd + ' and v.faturado=' + quotedstr('0') + ' and v.orcamento=' + quotedstr('1');

  if trim(edPedido.Text) <> '' then
    cmd := cmd + fmfun.cmdAux('v.NUMDOC', edPedido.Text);

  cmd := cmd + ' order by  Nom_grupo, ORD_PAUTA, volume, numdoc desc';

  with dm.q_prateleira do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_prateleira.RecordCount < 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\prateleira.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.relatorio_metas_diarias;
var
  cmd, cmd1, cmd2: string;
begin

  cmd1 := cmd1 + ' and  (v1.COD_FISCAL not in (''6152'', ''6409'') OR V1.COD_FISCAL IS NULL) and  v1.faturado not in (2,5) '+
                 ' and V1.NFEENTRADASAIDA = ''0'' AND V1.PROCESSO_ID NOT IN (SELECT PROCESSO_ID FROM VENDAS1 WHERE FATURADO <> 2 AND NFEENTRADASAIDA = ''1'') '+
                 ' AND v1.NFE_DEV is null and v1.consignacao <> 1 and v1.orcamento= 0 and v1.cod_fop <> 9';
  if zzfaturado.Checked then
    cmd1 := cmd1 + ' and v1.faturado=' + quotedstr('1') + ' and v1.orcamento=' + quotedstr('0')
  else if zznao_faturado.Checked then
    cmd1 := cmd1 + ' and v1.faturado=' + quotedstr('0') + ' and v1.orcamento=' + quotedstr('0')
  else if zzdesativados.Checked then
    cmd1 := cmd1 + ' and v1.faturado=' + quotedstr('4') + ' and v1.orcamento=' + quotedstr('0')
  else if zzfaturado_todos.Checked then
    cmd1 := cmd1 + ' and v1.faturado<>' + quotedstr('4') + ' and v1.orcamento=' + quotedstr('0')
  else if zzorcamento.Checked then
    cmd1 := cmd1 + ' and v1.faturado=' + quotedstr('0') + ' and v1.orcamento=' + quotedstr('1');

  if rbSemSupervisao.Checked then
    cmd2 := '(SELECT SUM(V1.TOT_LIQUIDO) FROM VENDAS1 V1 WHERE V1.COD_REPRESENTANTE = R.ID ' + cmd1 + ' AND v1.DTADOC = A.DATA) ';

  if rbApenasSupervisao.Checked then
    cmd2 := '(SELECT SUM(V1.TOT_LIQUIDO) FROM VENDAS1 V1 WHERE V1.COD_SUPERVISOR = R.ID  ' + cmd1 + ' AND v1.DTADOC = A.DATA)';

  if rbComSupervisao.Checked then
    cmd2 := '(coalesce((SELECT SUM(V1.TOT_LIQUIDO) FROM VENDAS1 V1 WHERE V1.COD_REPRESENTANTE = R.ID ' + cmd1 + ' AND v1.DTADOC = A.DATA),0) + ' + 'coalesce((SELECT SUM(V1.TOT_LIQUIDO) FROM VENDAS1 V1 WHERE V1.COD_SUPERVISOR    = R.ID ' + cmd1 + ' AND v1.DTADOC = A.DATA),0))';

  if rbNaoConsumidorFinal.Checked then
    cmd := cmd + 'and coalesce(v1.consumidor_final, ''N'') = ''N'' ';

  if rbApenasConsumidorFinal.Checked then
    cmd := cmd + 'and coalesce(v1.consumidor_final, ''N'') = ''S'' ';

  cmd := 'SELECT A.DATA, A.MES, A.ANO, extract(WEEK FROM A.DATA) AS SEMANA_ANO, ' + 'CASE extract(weekday FROM A.DATA) ' + 'WHEN 0 THEN ''DOMINGO'' ' + 'WHEN 1 THEN ''SEGUNDA-FEIRA'' ' + 'WHEN 2 THEN ''TERÇA-FEIRA'' ' + 'WHEN 3 THEN ''QUARTA-FEIRA''  ' + 'WHEN 4 THEN ''QUINTA-FEIRA'' ' + 'WHEN 5 THEN ''SEXTA-FEIRA'' ' + 'WHEN 6 THEN ''SÁBADO'' ' + 'END AS SEMANA, ' + 'R.ID||''-''||R.NOM_REPRESENTANTE AS REPRESENTANTE, ' + 'M.VL_VENDA AS META_MENSAL, ' + 'M.VL_VENDA*0.25 AS META_SEMANAL, ' +
    'M.VL_VENDA*0.05 AS META_DIARIA, ' + 'COALESCE( ' + cmd2 + ',0) AS TOTAL ' + 'FROM CALENDARIO A, REPRESENTANTE R ' + 'INNER JOIN METAS_REPRESENTANTE M ON M.ID_REPRESENTANTE = R.ID AND M.MES = A.MES and m.VL_VENDA > 0  ' + ' where 1 = 1 and extract(weekday FROM A.DATA) not in (0,6) ';

  cmd := cmd + ' and A.DATA between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date));

  if edCodRepresentante.Text <> '' then
    cmd := cmd + fmfun.cmdAux('r.ID', edCodRepresentante.Text);

  cmd := cmd + ' order by A.MES, r.NOM_REPRESENTANTE, a.data';

  with dm.q_metas_diarias do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_metas_diarias.RecordCount < 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\metas_diarias.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.relatorio_metas_mensais;
var
  cmd, cmd1: string;
begin

  if edCodRepresentante.Text <> '' then
    cmd1 := cmd1 + fmfun.cmdAux('r.id', edCodRepresentante.Text)
  else
    cmd1 := ' and r.id in (select r1.id from representante r1 where r1.funcionario in (''0'',''1'') and r1.ativo = ''S'') ';

  cmd1 := cmd1 + ' order by codrep, mes_inv ';

  cmd := 'SELECT ' + '  mr.id, ' + '  r.id as codrep, ' + '  r.nom_representante, ' + '  mr.MES, ' + '  substring(mr.mes from 4 for 4)||''/''||substring(mr.mes from 1 for 2) as mes_inv, ' + '  mr.VL_VENDA as meta, ' + '  mr.TOTAL_FATURADO, ' + '  mr.TOTAL_ABERTO, ' + '  mr.MARGEM_FATURADO, ' + '  mr.MARGEM_ABERTO ' + 'FROM METAS_REPRESENTANTE mr ' + 'inner join REPRESENTANTE r on r.id = mr.ID_REPRESENTANTE ' + 'where substring(mr.mes from 4 for 4) = extract(year from current_date) and r.ativo = ''S''' + cmd1;

  with dm.q_metas do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_metas.RecordCount < 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\metas_comerciais.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;

  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.relatorio_comissao_novo_simplificado(c_fornecedor, c_loja, c_grupo, c_vendedor, c_marca: string);
var
  cmd, atu_comissao, relatorio: string;
begin

  cmd := 'SELECT DISTINCT a.NUMDOC, A.NUMDOC_GRUPO, a.DTADOC, a.DTA_EMISSAO, a.TOT_LIQUIDO, a.DESCONTO_PEDIDO, a.VALOR_CR, a.COD_CLIENTE, ' +
         'a.NOM_CLIENTE, a.CODREP, a.NOM_REPRESENTANTE, a.NOM_BANCO, a.NR_BANCO, a.NR_AGENCIA, a.NR_CONTA_CORRENTE, ' +
         'a.TITULAR_CONTA, a.EMAIL, a.FONE, a.CELULAR, a.VLR_COMISSAO_FIXA, a.FATURADO, a.SITUACAO, ' +
         'a.MARGEM_LUCRO, R.PERC_COMISSAO_FIXA, ' +
         'case when v1.cod_supervisor is not null then ''Sim'' else ''Não'' end as supervisao, ' +
         'case when v1.cod_supervisor is not null then a.PERC_COMISSAO - 0.5 else a.PERC_COMISSAO end as PERC_COMISSAO, ' +
         'case when v1.cod_supervisor is not null then a.VLR_COMISSAO - (a.tot_liquido * (0.005)) else a.VLR_COMISSAO end as VLR_COMISSAO ' +
         'FROM V_COMISSAO_NOVA a ' +
         'INNER JOIN VENDAS1 V1 ON V1.NUMDOC = A.NUMDOC  ' +
         'INNER JOIN REPRESENTANTE R ON R.ID = a.CODREP where 1 = 1 and  V1.cod_fop not in (7, 9, 22, 23, 24, 26, 32, 46, 47, 51, 52, 53, 54, 57, 58) ';

  if rbApenasSupervisao.Checked then
    cmd := cmd + ' and a.SUPERVISAO = ''Sim''';

  if rbSemSupervisao.Checked then
    cmd := cmd + ' and a.SUPERVISAO = ''Não''';

  if rbNaoConsumidorFinal.Checked then
    cmd := cmd + 'and coalesce(v1.consumidor_final, ''N'') = ''N'' ';

  if rbApenasConsumidorFinal.Checked then
    cmd := cmd + 'and coalesce(v1.consumidor_final, ''N'') = ''S'' ';

  if Rb_filtro_faturamento.Checked then
    cmd := cmd + ' and a.dta_emissao between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date));

  if Rb_filtro_emissao.Checked then
    cmd := cmd + ' and a.dtadoc between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date));

  if edCliente.Text <> '' then
    cmd := cmd + fmfun.cmdAux('a.cod_cliente', edCliente.Text);

  if Pruf.Text <> '' then
    cmd := cmd + ' and a.uf = ' + quotedstr(Pruf.Text);

  { if c_fornecedor <> '' then
    cmd:= cmd + ' and p.fornecedor_principal = ' + QuotedStr(c_fornecedor);

    if c_loja <> '' then
    cmd:= cmd + ' and v1.empresa_faturar = ' + QuotedStr(c_loja);

    if c_grupo <> '' then
    cmd:= cmd + ' and p.cod_grupo='+QuotedStr(c_grupo);
  }
  if c_vendedor <> '' then
    cmd := cmd + ' and a.codrep=' + quotedstr(c_vendedor);

  if edcodsupervisor.Text <> '' then
    cmd := cmd + fmfun.cmdAux('a.cod_supervisor', edcodsupervisor.Text);

  {
    if c_marca <> '' then
    cmd:= cmd + ' and v1.id_marca='+QuotedStr(c_marca);
  }

  if zzfaturado.Checked then
    cmd := cmd + ' and v1.faturado=' + quotedstr('1') + ' and v1.orcamento=' + quotedstr('0')
  else if zznao_faturado.Checked then
    cmd := cmd + ' and v1.faturado=' + quotedstr('0') + ' and v1.orcamento=' + quotedstr('0')
  else if zzdesativados.Checked then
    cmd := cmd + ' and v1.faturado=' + quotedstr('4') + ' and v1.orcamento=' + quotedstr('0')
  else if zzfaturado_todos.Checked then
    cmd := cmd + ' and v1.faturado<>' + quotedstr('4') + ' and v1.orcamento=' + quotedstr('0')
  else if zzorcamento.Checked then
    cmd := cmd + ' and v1.faturado=' + quotedstr('0') + ' and v1.orcamento=' + quotedstr('1');

  if trim(edPedido.Text) <> '' then
    cmd := cmd + fmfun.cmdAux('a.NUMDOC', edPedido.Text);

  if zzfaturado.Checked then
    cmd := cmd + ' order by R.NOM_REPRESENTANTE, A.DTA_EMISSAO, A.numdoc'
  else
    cmd := cmd + ' order by R.NOM_REPRESENTANTE, A.dtadoc, A.numdoc';

  with dm.q_comissao_nova_simplificado do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_comissao_nova_simplificado.RecordCount < 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  fm_splash.ggProgress.MaxValue := dm.q_comissao_nova_simplificado.RecordCount;
  fm_splash.lbStatus.Caption := 'Atualizando Comissões...';
  fm_splash.ggProgress.progress := 0;
  fm_splash.Show;

  dm.q_comissao_nova_simplificado.first;

  while not dm.q_comissao_nova_simplificado.Eof do
  begin
    fmfun.AtualizaDadosComissao(dm.q_comissao_nova_simplificadoNUMDOC.AsString);
    fm_splash.ggProgress.addprogress(1);
    dm.q_comissao_nova_simplificado.Next;
  end;
  fm_splash.close;
  dm.q_comissao_nova_simplificado.Refresh;

  if tipo_relatorio = 'comissoes_novo_simplificado' then
    relatorio := 'comissoes_novo_simplificado.fr3';

  if tipo_relatorio = 'comissao_comparativo' then
    relatorio := 'comissoes_novo_simplificado_comparativo.fr3';

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\' + relatorio)) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;

  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.relatorio_comissao_novo(tipo, c_fornecedor, c_loja, c_grupo, c_vendedor, c_marca: string);
var
  cmd: string;
begin
  cmd := 'SELECT v.NUMDOC, v.numdoc_grupo, v.tipo, v.DTADOC, v.DTA_EMISSAO, v.DESCONTO_PEDIDO, v.TOT_LIQUIDO, V.VALOR_CR, v.COD_CLIENTE, v.NOM_CLIENTE, v.CODREP, R.NOM_REPRESENTANTE, v.NOM_BANCO, ' + 'v.NR_BANCO, v.NR_AGENCIA, v.titular_conta, v.NR_CONTA_CORRENTE, v.EMAIL, v.FONE, v.CELULAR, v.COD_PRODUTO, v.NOM_PRODUTO, v.CUSTO, v.LUCRO, v.PRECO_VENDA_CALC, v.MARGEM, ' + 'v.PRECO_VENDA, v.PRECO, v.DESCONTO, v.QTD, v.SUB_TOTAL, v.VLR_COMISSAO, V.SUBTOTAL_RATEADO, V.VLR_COMISSAO_RATEADO, v.FATURADO, v.SUPERVISAO, v.PERC_COMISSAO, R.PERC_COMISSAO_FIXA, v.situacao, v.DESCONTO_MAX, V.observacoes_pedido ' +
         'FROM V_COMISSAO_NOVA2 v ' +
         'INNER JOIN REPRESENTANTE R ON (R.ID = CODREP) where 1 = 1';

  if Rb_filtro_faturamento.Checked then
    cmd := cmd + ' and v.dta_emissao between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date));

  if Rb_filtro_emissao.Checked then
    cmd := cmd + ' and v.dtadoc between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date));

  { if c_fornecedor <> '' then
    cmd:= cmd + ' and p.fornecedor_principal = ' + QuotedStr(c_fornecedor);

    if c_loja <> '' then
    cmd:= cmd + ' and v1.empresa_faturar = ' + QuotedStr(c_loja);

    if c_grupo <> '' then
    cmd:= cmd + ' and p.cod_grupo='+QuotedStr(c_grupo);
  }
  if Pruf.Text <> '' then
    cmd := cmd + ' and cd.uf = ' + quotedstr(Pruf.Text);

  if edCliente.Text <> '' then
    cmd := cmd + fmfun.cmdAux('v.cod_cliente', edCliente.Text);

  if c_vendedor <> '' then
    cmd := cmd + ' and V.codrep=' + quotedstr(c_vendedor);

  if edcodsupervisor.Text <> '' then
    cmd := cmd + fmfun.cmdAux('v.cod_supervisor', edcodsupervisor.Text);

  {
    if c_marca <> '' then
    cmd:= cmd + ' and v1.id_marca='+QuotedStr(c_marca);
  }
  if zzfaturado.Checked then
    cmd := cmd + ' and v.faturado=' + quotedstr('1') + ' and v.orcamento=' + quotedstr('0')
  else if zznao_faturado.Checked then
    cmd := cmd + ' and v.faturado=' + quotedstr('0') + ' and v.orcamento=' + quotedstr('0')
  else if zzdesativados.Checked then
    cmd := cmd + ' and v.faturado=' + quotedstr('4') + ' and v.orcamento=' + quotedstr('0')
  else if zzfaturado_todos.Checked then
    cmd := cmd + ' and v.faturado<>' + quotedstr('4') + ' and v.orcamento=' + quotedstr('0')
  else if zzorcamento.Checked then
    cmd := cmd + ' and v.faturado=' + quotedstr('0') + ' and v.orcamento=' + quotedstr('1');

  if rbNaoConsumidorFinal.Checked then
    cmd := cmd + 'and coalesce(v.consumidor_final, ''N'') = ''N'' ';

  if rbApenasConsumidorFinal.Checked then
    cmd := cmd + 'and coalesce(v.consumidor_final, ''N'') = ''S'' ';


  if rbApenasSupervisao.Checked then
    cmd := cmd + ' and V.SUPERVISAO = ''S''';

  if rbSemSupervisao.Checked then
    cmd := cmd + ' and V.SUPERVISAO = ''N''';

  if trim(edPedido.Text) <> '' then
    cmd := cmd + fmfun.cmdAux('v.NUMDOC', edPedido.Text);

  cmd := cmd + ' order by R.NOM_REPRESENTANTE, V.situacao, V.dtadoc, V.numdoc';

  with dm.q_comissao_nova do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;
  dm.q_grade_comissao.open;

  if dm.q_comissao_nova.RecordCount < 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if tipo = '0' then
  begin
    if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\email_comissoes.fr3')) then
    begin
      dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
      exit;
    end;
  end
  else
  begin
    if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\comissoes_novo_detalhado.fr3')) then
    begin
      dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
      exit;
    end;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.relatorio_comissao_cr_baixadas;
var
  cmd: string;
begin
  cmd := ' SELECT  ' +
         '   r.id, ' +
		 '   r.NOM_REPRESENTANTE, ' +
		 '   b.NOM_BANCO, ' +
		 '   r.NR_AGENCIA, ' +
		 '   r.NR_BANCO, ' +
		 '   r.NR_CONTA_CORRENTE, ' +
		 '   r.TITULAR_CONTA, ' +
		 '   r.EMAIL, ' +
		 '   r.CELULAR, ' +
		 '   r.FONE, ' +
		 '   c.COD_CLIENTE, ' +
		 '   c.NOM_CLIENTE, ' +
		 '   a.TITULO, ' +
		 '   a.SEQUENCIA, ' +
		 '   a.NR_DOCUMENTO, ' +
		 '   a.DTAREC, ' +
		 '   a.VALOR_RECEBIDO, ' +
		 '   (SELECT vc.MARGEM_LUCRO FROM V_COMISSAO_NOVA VC WHERE VC.NUMDOC = V1.NUMDOC limit 1) AS MARGEM_LUCRO, ' +
         '   case when v1.cod_supervisor is not null then v1.PERC_COMISSAO - 0.5 else v1.PERC_COMISSAO end as PERC_COMISSAO,  ' +
		 '   a.valor_recebido * (case when v1.cod_supervisor is not null then v1.PERC_COMISSAO - 0.5 else v1.PERC_COMISSAO end /100) as vlr_comissao ' +
		 ' FROM CR1 a ' +
		 ' inner join vendas1 v1 on v1.NUMDOC = a.NR_DOCUMENTO ' +
		 ' inner join REPRESENTANTE r on r.id = v1.COD_REPRESENTANTE  ' +
		 ' left outer join banco b on b.ID = CAST(r.NR_BANCO AS INTEGER) ' +
		 ' inner join cliente c on c.COD_CLIENTE = v1.COD_CLIENTE ' +
		 ' where ' +
		 '    1 = 1 and  V1.cod_fop not in (7, 9, 22, 23, 24, 26, 32, 46, 47, 51, 52, 53, 54, 57, 58)  and v1.FATURADO = 1 and ' +
		 '    a.VALOR_RECEBIDO > 0 and ' +
		 '    r.PERC_COMISSAO_fixa IS NOT NULL ';

  if (Prdta_inicial.date > 0) and (Prdta_final.date > 0) then
    cmd := cmd + ' and a.DTAREC between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date));

  if edCodRepresentante.Text <> '' then
    cmd := cmd + fmfun.cmdAux('v1.cod_representante', edCodRepresentante.Text);

  if edCliente.Text <> '' then
    cmd := cmd + fmfun.cmdAux('c.cod_cliente', edCliente.Text);

  if trim(edPedido.Text) <> '' then
    cmd := cmd + fmfun.cmdAux('V1.NUMDOC', edPedido.Text);

  cmd := cmd + ' order by r.NOM_REPRESENTANTE, a.dtarec, a.TITULO, a.id';

  with dm.q_comissao_cr_baixadas do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_comissao_cr_baixadas.RecordCount = 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  fm_splash.ggProgress.MaxValue := dm.q_comissao_cr_baixadas.RecordCount;
  fm_splash.lbStatus.Caption := 'Atualizando Comissões...';
  fm_splash.ggProgress.progress := 0;
  fm_splash.Show;

  dm.q_comissao_cr_baixadas.first;

  while not dm.q_comissao_cr_baixadas.Eof do
  begin
    fmfun.AtualizaDadosComissao(dm.q_comissao_cr_baixadasNR_DOCUMENTO.AsString);
    fm_splash.ggProgress.addprogress(1);
    dm.q_comissao_cr_baixadas.Next;
  end;
  fm_splash.close;
  dm.q_comissao_cr_baixadas.Refresh;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\comissoes_cr_baixadas.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.relatorio_comissao(c_fornecedor, c_loja, c_grupo, c_vendedor, c_marca: string);
var
  cmd: string;
begin
  cmd := ' select ' + '   V1.numdoc, V1.numdoc_grupo, V1.dtadoc, v1.numdoc_destino, v1.entregue, ' + '   case when v1.NUMDOC_GRUPO is not null then (select V.DTA_EMISSAO from vendas1 v where v.NUMDOC = v1.NUMDOC_GRUPO) else V1.DTA_EMISSAO end AS DTA_EMISSAO, ' + '   case when v1.NUMDOC_GRUPO is not null then (select case when v.faturado = 1 then v1.TOT_LIQUIDO else 0 end from vendas1 v where coalesce(v.NUMDOC_DESTINO, v.NUMDOC) = v1.NUMDOC_GRUPO) else  ' +
    '   coalesce((select sum(valor) from cr1 as cr where cr.nr_documento = coalesce(v1.numdoc_destino, v1.NUMDOC)),0)  - case when cd.UF <> ''SC'' and v1.nfe is not null then v1.VLR_ST else 0 end end as valor_cr, ' + '   c.cod_cliente, c.nom_cliente, r.id as codrep, r.NOM_REPRESENTANTE, r.cpf, b.NOM_BANCO, r.NR_BANCO,r.NR_AGENCIA,r.NR_CONTA_CORRENTE, R.TITULAR_CONTA, r.email, r.fone,r.celular, ' + '   CASE WHEN V1.NUMDOC_DESTINO IS NULL THEN (r.PERC_COMISSAO_FIXA - case when v1.cod_supervisor is not null then 1 else 0 end) ELSE ((r.PERC_COMISSAO_FIXA)/5)*(-1) END  as comissao, ' + '   CASE WHEN V1.NUMDOC_DESTINO IS NULL THEN V1.tot_liquido ELSE (SELECT VD.TOT_LIQUIDO FROM VENDAS1 VD WHERE VD.NUMDOC = V1.NUMDOC_DESTINO) END AS TOT_LIQUIDO, ' +
'   CASE WHEN V1.NUMDOC_DESTINO IS NULL ' + '        THEN (case when v1.NUMDOC_GRUPO is not null  ' + '                   then (select case when v.faturado = 1  ' + '                                     then v1.TOT_LIQUIDO ' + '                                     else 0  ' + '                                end  ' + '                         from vendas1 v  ' + '                         where coalesce(v.NUMDOC_DESTINO, v.NUMDOC) = v1.NUMDOC_GRUPO)  ' +
  '                   else coalesce((select sum(valor) from cr1 as cr where cr.nr_documento = coalesce(v1.numdoc_destino, v1.NUMDOC)),0)  - case when cd.UF <> ''SC'' and v1.nfe is not null then v1.VLR_ST else 0 end end)  ' + '                        * (CAST((CASE WHEN V1.NUMDOC_DESTINO IS NULL  ' + '                                      THEN (r.PERC_COMISSAO_FIXA - (case when v1.cod_supervisor is not null then 1 else 0 end)) ELSE ((r.PERC_COMISSAO_FIXA)/5)*(-1) END) AS NUMERIC(15,4)) /100)  ' +
  '        ELSE ((SELECT VD.TOT_LIQUIDO FROM VENDAS1 VD WHERE VD.NUMDOC = V1.NUMDOC_DESTINO) * ((r.PERC_COMISSAO_FIXA/5)*(-1)))/100  ' + '        END as vlr_comissao, ' + '   case when v1.cod_supervisor is not null then ''Sim'' else ''Não'' end as supervisao, ' + '   case when v1.NUMDOC_GRUPO is not null then (select v.faturado from vendas1 v where v.NUMDOC = v1.NUMDOC_GRUPO) else v1.FATURADO end AS FATURADO, ' + '   V1.COD_SUPERVISOR, ' +
  '   case when case when v1.NUMDOC_GRUPO is not null then (select v.faturado from vendas1 v where v.NUMDOC = v1.NUMDOC_GRUPO) else v1.FATURADO end = 1 then ' + '   ( ' + '    ((case when v1.NUMDOC_GRUPO is not null then (select case when v.faturado = 1 then v1.TOT_LIQUIDO else 0 end from vendas1 v where v.NUMDOC = v1.NUMDOC_GRUPO) else coalesce((select sum(valor) from cr1 as cr where cr.nr_documento = v1.NUMDOC),0)  - ' +
  '     case when cd.UF <> ''SC'' and v1.nfe is not null then v1.VLR_ST else 0 end end) ' + '    - ' + '    (select case when sum(v2.PRECO_CUSTO*v2.QTD) = 0 then sum(p.CUSTO_TOTAL*v2.QTD) else sum(v2.PRECO_CUSTO*v2.QTD) end from vendas2 v2 INNER JOIN PRODUTO P ON P.COD_PRODUTO = v2.COD_PRODUTO  where v2.NUMDOC = v1.NUMDOC)) ' + '    / ' + '    (select case when sum(v2.PRECO_CUSTO*v2.QTD) = 0 then sum(p.CUSTO_TOTAL*v2.QTD) else sum(v2.PRECO_CUSTO*v2.QTD) end from vendas2 v2 INNER JOIN PRODUTO P ON P.COD_PRODUTO = v2.COD_PRODUTO  where v2.NUMDOC = v1.NUMDOC) '
  + '   )*100 ' + '  else ' + '  (( ' + '    (case when v1.NUMDOC_GRUPO is not null then (select case when v.faturado = 1 then v1.TOT_LIQUIDO else 0 end from vendas1 v where coalesce(v.NUMDOC_DESTINO, v.NUMDOC) = v1.NUMDOC_GRUPO) ' + '                                            else     coalesce((select sum(valor) from cr1 as cr where cr.nr_documento = coalesce(v1.numdoc_destino, v1.NUMDOC)),0)  - case when cd.UF <> ''SC'' and v1.nfe is not null then v1.VLR_ST else 0 end end) ' + '    - ' +
  '    (select case when sum(v2.PRECO_CUSTO*v2.QTD) = 0 then sum(p.CUSTO_TOTAL*v2.QTD) else sum(v2.PRECO_CUSTO*v2.QTD) end from vendas2 v2 INNER JOIN PRODUTO P ON P.COD_PRODUTO = v2.COD_PRODUTO  where v2.NUMDOC = v1.NUMDOC)) ' + '    / ' + '    (select case when sum(v2.PRECO_CUSTO*v2.QTD) = 0 then sum(p.CUSTO_TOTAL*v2.QTD) else sum(v2.PRECO_CUSTO*v2.QTD) end from vendas2 v2 INNER JOIN PRODUTO P ON P.COD_PRODUTO = v2.COD_PRODUTO  where v2.NUMDOC = v1.NUMDOC) ' + '  )*100 ' + '  end as margem, v1.desconto ' +
  ' from vendas1 v1 ' + ' left join cliente c on c.cod_cliente=v1.cod_cliente ' + ' left join CIDADES cd on cd.COD_CIDADE = c.COD_CIDADE ' + ' INNER join REPRESENTANTE r on r.ID = v1.COD_REPRESENTANTE ' + ' left join BANCO b on b.ID = CAST(r.NR_BANCO AS INTEGER) ' +
  ' where ' +
  '   (v1.COD_FISCAL not in (''6152'', ''6409'') OR V1.COD_FISCAL IS NULL) and V1.NFEENTRADASAIDA = ''0'' AND V1.PROCESSO_ID NOT IN (SELECT PROCESSO_ID FROM VENDAS1 WHERE FATURADO <> 2 AND NFEENTRADASAIDA = ''1'') '+
  '   AND (v1.NFE_DEV is null OR v1.STATUS_NFE_DEV = 135) and ' +
  '   v1.consignacao <> 1 and  ' +
  '   v1.cod_fop not in (7, 9, 22, 23, 24, 26, 32, 46, 47, 51, 52, 53, 54, 57, 58)  ';

  if zzfaturado.Checked then
    cmd := cmd + ' and v1.dta_emissao between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date))
  else if zznao_faturado.Checked then
    cmd := cmd + ' and v1.dtadoc between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date))
  else
    cmd := cmd + ' and case when v1.FATURADO = ''1'' then v1.DTA_EMISSAO else v1.dtadoc END between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date));

  if Pruf.Text <> '' then
    cmd := cmd + ' and cd.UF = ' + quotedstr(Pruf.Text);

  if Prcod_representante.Text <> '' then
    cmd := cmd + fmfun.cmdAux('v1.cod_representante', Prcod_representante.Text);

  if edcodsupervisor.Text <> '' then
    cmd := cmd + fmfun.cmdAux('v1.cod_supervisor', edcodsupervisor.Text);
  {
    if c_marca <> '' then
    cmd:= cmd + ' and v1.id_marca='+QuotedStr(c_marca);
  }
  if zzfaturado.Checked then
    cmd := cmd + ' and v1.faturado=' + quotedstr('1') + ' and v1.orcamento=' + quotedstr('0')
  else if zznao_faturado.Checked then
    cmd := cmd + ' and v1.faturado=' + quotedstr('0') + ' and v1.orcamento=' + quotedstr('0')
  else if zzdesativados.Checked then
    cmd := cmd + ' and v1.faturado=' + quotedstr('4') + ' and v1.orcamento=' + quotedstr('0')
  else if zzfaturado_todos.Checked then
    cmd := cmd + ' and v1.faturado<>' + quotedstr('4') + ' and v1.orcamento=' + quotedstr('0')
  else if zzorcamento.Checked then
    cmd := cmd + ' and v1.faturado=' + quotedstr('0') + ' and v1.orcamento=' + quotedstr('1');

  if rbApenasSupervisao.Checked then
    cmd := cmd + ' and v1.cod_supervisor is not null ';

  if rbSemSupervisao.Checked then
    cmd := cmd + ' and v1.cod_supervisor is null ';

  if rbNaoConsumidorFinal.Checked then
    cmd := cmd + 'and coalesce(v1.consumidor_final, ''N'') = ''N'' ';

  if rbApenasConsumidorFinal.Checked then
    cmd := cmd + 'and coalesce(v1.consumidor_final, ''N'') = ''S'' ';

  if trim(edPedido.Text) <> '' then
    cmd := cmd + fmfun.cmdAux('V1.NUMDOC', edPedido.Text);

  cmd := cmd + ' order by NOM_REPRESENTANTE, NUMDOC_DESTINO, dtadoc, numdoc';

  with dm.q_comissao_venda do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_comissao_venda.RecordCount = 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\comissoes.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.relatorio_comissao_desconto(c_fornecedor, c_loja, c_grupo, c_vendedor, c_marca: string);
var
  cmd: string;
begin
  cmd := ' select ' +
         '   V1.numdoc, V1.numdoc_grupo, V1.dtadoc, v1.numdoc_destino, v1.entregue, ' +
         '   case when v1.NUMDOC_GRUPO is not null then (select V.DTA_EMISSAO from vendas1 v where v.NUMDOC = v1.NUMDOC_GRUPO) else V1.DTA_EMISSAO end AS DTA_EMISSAO, ' +
         '   case when v1.NUMDOC_GRUPO is not null then (select case when v.faturado = 1 then v1.TOT_LIQUIDO else 0 end from vendas1 v where coalesce(v.NUMDOC_DESTINO, v.NUMDOC) = v1.NUMDOC_GRUPO) else  ' +
         '   coalesce((select sum(valor) from cr1 as cr where cr.nr_documento = coalesce(v1.numdoc_destino, v1.NUMDOC)),0)  - case when cd.UF <> ''SC'' and v1.nfe is not null then v1.VLR_ST else 0 end end as valor_cr, ' +
         '   c.cod_cliente, c.nom_cliente, r.id as codrep, r.NOM_REPRESENTANTE, r.CPF, b.NOM_BANCO, r.NR_BANCO,r.NR_AGENCIA,r.NR_CONTA_CORRENTE, R.TITULAR_CONTA, r.email, r.fone,r.celular, ' + '   v1.PERC_COMISSAO  as comissao, ' +
         '   V1.tot_liquido, ' +
         '   v1.vlr_comissao, ' +
         '   case when v1.cod_supervisor is not null then ''Sim'' else ''Não'' end as supervisao, ' +
         '   case when v1.NUMDOC_GRUPO is not null then (select v.faturado from vendas1 v where v.NUMDOC = v1.NUMDOC_GRUPO) else v1.FATURADO end AS FATURADO, ' +
         '   V1.COD_SUPERVISOR, ' +
         '   case when case when v1.NUMDOC_GRUPO is not null then (select v.faturado from vendas1 v where v.NUMDOC = v1.NUMDOC_GRUPO) else v1.FATURADO end = 1 then ' + '   ( ' + '    ((case when v1.NUMDOC_GRUPO is not null then (select case when v.faturado = 1 then v1.TOT_LIQUIDO else 0 end from vendas1 v where v.NUMDOC = v1.NUMDOC_GRUPO) else coalesce((select sum(valor) from cr1 as cr where cr.nr_documento = v1.NUMDOC),0)  - ' +
         '     case when cd.UF <> ''SC'' and v1.nfe is not null then v1.VLR_ST else 0 end end) ' +
         '    - ' +
         '    (select case when sum(v2.PRECO_CUSTO*v2.QTD) = 0 then sum(p.CUSTO_TOTAL*v2.QTD) else sum(v2.PRECO_CUSTO*v2.QTD) end from vendas2 v2 INNER JOIN PRODUTO P ON P.COD_PRODUTO = v2.COD_PRODUTO  where v2.NUMDOC = v1.NUMDOC)) ' +
         '    / ' +
         '    (select case when sum(v2.PRECO_CUSTO*v2.QTD) = 0 then sum(p.CUSTO_TOTAL*v2.QTD) else sum(v2.PRECO_CUSTO*v2.QTD) end from vendas2 v2 INNER JOIN PRODUTO P ON P.COD_PRODUTO = v2.COD_PRODUTO  where v2.NUMDOC = v1.NUMDOC) ' +
         '   )*100 ' +
         '  else ' +
         '  (( ' +
         '    (case when v1.NUMDOC_GRUPO is not null then (select case when v.faturado = 1 then v1.TOT_LIQUIDO else 0 end from vendas1 v where coalesce(v.NUMDOC_DESTINO, v.NUMDOC) = v1.NUMDOC_GRUPO) ' +
         '                                           else     coalesce((select sum(valor) from cr1 as cr where cr.nr_documento = coalesce(v1.numdoc_destino, v1.NUMDOC)),0)  - case when cd.UF <> ''SC'' and v1.nfe is not null then v1.VLR_ST else 0 end end) ' +
         '    - ' +
         '    (select case when sum(v2.PRECO_CUSTO*v2.QTD) = 0 then sum(p.CUSTO_TOTAL*v2.QTD) else sum(v2.PRECO_CUSTO*v2.QTD) end from vendas2 v2 INNER JOIN PRODUTO P ON P.COD_PRODUTO = v2.COD_PRODUTO  where v2.NUMDOC = v1.NUMDOC)) ' +
         '    / ' +
         '    (select case when sum(v2.PRECO_CUSTO*v2.QTD) = 0 then sum(p.CUSTO_TOTAL*v2.QTD) else sum(v2.PRECO_CUSTO*v2.QTD) end from vendas2 v2 INNER JOIN PRODUTO P ON P.COD_PRODUTO = v2.COD_PRODUTO  where v2.NUMDOC = v1.NUMDOC) ' +
         '  )*100 ' +
         '  end as margem, v1.desconto ' +
         ' from vendas1 v1 ' +
         ' left join cliente c on c.cod_cliente=v1.cod_cliente ' +
         ' left join CIDADES cd on cd.COD_CIDADE = c.COD_CIDADE ' +
         ' INNER join REPRESENTANTE r on r.ID = v1.COD_REPRESENTANTE ' +
         ' left join BANCO b on b.ID = CAST(r.NR_BANCO AS INTEGER) ' +
         ' where ' +
         '   (v1.COD_FISCAL not in (''6152'', ''6409'') OR V1.COD_FISCAL IS NULL) and V1.NFEENTRADASAIDA = ''0'' '+
         '   AND V1.PROCESSO_ID NOT IN (SELECT PROCESSO_ID FROM VENDAS1 WHERE FATURADO <> 2 AND NFEENTRADASAIDA = ''1'') AND (v1.NFE_DEV is null OR v1.STATUS_NFE_DEV = 135) and ' +
         '   v1.consignacao <> 1 and  ' +
         '   v1.cod_fop not in (7, 9, 22, 23, 24, 26, 32, 46, 47, 51, 52, 53, 54, 57, 58)  ';

  if zzfaturado.Checked then
    cmd := cmd + ' and v1.dta_emissao between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date))
  else if zznao_faturado.Checked then
    cmd := cmd + ' and v1.dtadoc between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date))
  else
    cmd := cmd + ' and case when v1.FATURADO = ''1'' then v1.DTA_EMISSAO else v1.dtadoc END between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date));

  if Pruf.Text <> '' then
    cmd := cmd + ' and cd.UF = ' + quotedstr(Pruf.Text);

  if Prcod_representante.Text <> '' then
    cmd := cmd + fmfun.cmdAux('v1.cod_representante', Prcod_representante.Text);

  if edcodsupervisor.Text <> '' then
    cmd := cmd + fmfun.cmdAux('v1.cod_supervisor', edcodsupervisor.Text);
  {
    if c_marca <> '' then
    cmd:= cmd + ' and v1.id_marca='+QuotedStr(c_marca);
  }
  if zzfaturado.Checked then
    cmd := cmd + ' and v1.faturado=' + quotedstr('1') + ' and v1.orcamento=' + quotedstr('0')
  else if zznao_faturado.Checked then
    cmd := cmd + ' and v1.faturado=' + quotedstr('0') + ' and v1.orcamento=' + quotedstr('0')
  else if zzdesativados.Checked then
    cmd := cmd + ' and v1.faturado=' + quotedstr('4') + ' and v1.orcamento=' + quotedstr('0')
  else if zzfaturado_todos.Checked then
    cmd := cmd + ' and v1.faturado<>' + quotedstr('4') + ' and v1.orcamento=' + quotedstr('0')
  else if zzorcamento.Checked then
    cmd := cmd + ' and v1.faturado=' + quotedstr('0') + ' and v1.orcamento=' + quotedstr('1');

  if rbApenasSupervisao.Checked then
    cmd := cmd + ' and v1.cod_supervisor is not null ';

  if rbSemSupervisao.Checked then
    cmd := cmd + ' and v1.cod_supervisor is null ';

  if rbNaoConsumidorFinal.Checked then
    cmd := cmd + 'and coalesce(v1.consumidor_final, ''N'') = ''N'' ';

  if rbApenasConsumidorFinal.Checked then
    cmd := cmd + 'and coalesce(v1.consumidor_final, ''N'') = ''S'' ';

  if trim(edPedido.Text) <> '' then
    cmd := cmd + fmfun.cmdAux('V1.NUMDOC', edPedido.Text);

  cmd := cmd + ' order by NOM_REPRESENTANTE, NUMDOC_DESTINO, dtadoc, numdoc';

  with dm.q_comissao_venda do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  fm_splash.ggProgress.MaxValue := dm.q_comissao_venda.RecordCount;
  fm_splash.lbStatus.Caption := 'Atualizando Comissões...';
  fm_splash.ggProgress.progress := 0;
  fm_splash.Show;

  dm.q_comissao_venda.first;

  while not dm.q_comissao_venda.Eof do
  begin
    fmfun.AtualizaDadosComissaoDesconto(dm.q_comissao_vendaNUMDOC.AsString);
    fm_splash.ggProgress.addprogress(1);
    dm.q_comissao_venda.Next;
  end;
  fm_splash.close;
  dm.q_comissao_venda.Refresh;

  if dm.q_comissao_venda.RecordCount = 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\comissoes_desconto.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.ranking_vendas;
var
  cmd, cmd_rep: string;
begin
  if Prdta_inicial.date = 0 then
  begin
    MessageDlg('Data Inicial deve ser preenchida!', mtError, [mbOK], 0);
    Prdta_inicial.SetFocus;
    exit;
  end;

  if Prdta_final.date = 0 then
  begin
    MessageDlg('Data Final deve ser preenchida!', mtError, [mbOK], 0);
    Prdta_final.SetFocus;
    exit;
  end;

  cmd_rep := '';

  if Prcod_representante.Text <> '' then
    cmd_rep := ' and r.id = ' + Prcod_representante.Text;

  if prcod_supervisor.Text <> '' then
    cmd_rep := ' and r.id = ' + prcod_supervisor.Text;

  if (Prcod_representante.Text <> '') and (prcod_supervisor.Text <> '') then
    cmd_rep := ' and r.id in (' + Prcod_representante.Text + ',' + prcod_supervisor.Text + ')';

  cmd := 'SELECT TIPO, REPRESENTANTE, TOTAL_ABERTO, TOTAL_FATURADO, QTDE, CAST(DESCONTO AS NUMERIC(15,2)) DESCONTO ' +
         'FROM ' +
         '( ' +
         ' select ' +
         '  ''REPRESENTANTE'' AS TIPO, ' +
         '  r.id||''-''||r.NOM_REPRESENTANTE as REPRESENTANTE, ' +
         '  coalesce(( ' +
         '    SELECT ' +
         '      SUM(V1.TOT_LIQUIDO) ' +
         '    FROM ' +
         '      VENDAS1 V1 ' +
         '    WHERE ' +
         '       V1.DTADOC between ' + quotedstr(formatdatetime('dd/mm/yyyy', Prdta_inicial.date)) +
         '      and ' + quotedstr(formatdatetime('dd/mm/yyyy', Prdta_final.date)) +
         '      and (V1.consignacao <> 1 and V1.orcamento= 0 ) ' +
         '      and V1.FATURADO in (0) ' +
         '      and (v1.COD_FISCAL not in (''6152'', ''6409'') OR V1.COD_FISCAL IS NULL) and  V1.NUMDOC_GRUPO IS NULL AND V1.NFEENTRADASAIDA = ''0'' '+
         '      AND V1.PROCESSO_ID NOT IN (SELECT PROCESSO_ID FROM VENDAS1 WHERE FATURADO <> 2 AND NFEENTRADASAIDA = ''1'') AND (V1.NFE_DEV is null or V1.STATUS_NFE_DEV = 135) ' +
         '      AND V1.COD_REPRESENTANTE = R.ID ' +
         '      and v1.cod_fop not in (7, 9, 22, 23, 24, 26, 32, 46, 47, 51, 52, 53, 54, 57, 58)  ' +
         ifthen(rbApenasConsumidorFinal.Checked, '      and coalesce(v1.consumidor_final, ''N'') = ''S'' ',
         ifthen(rbNaoConsumidorFinal.Checked, '      and coalesce(v1.consumidor_final, ''N'') = ''N'' ', ''))+
         '  ),0) AS TOTAL_ABERTO, ' +
         '  COALESCE(( ' +
         '    SELECT ' +
         '      SUM(V1.TOT_LIQUIDO) ' +
         '    FROM ' +
         '      VENDAS1 V1 ' +
         '    WHERE ' +
         '       V1.DTA_EMISSAO between ' + quotedstr(formatdatetime('dd/mm/yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd/mm/yyyy', Prdta_final.date)) +
         '      and (V1.consignacao <> 1 and V1.orcamento= 0 ) ' +
         '      and V1.FATURADO in (1) ' +
         '      and (v1.COD_FISCAL not in (''6152'', ''6409'') OR V1.COD_FISCAL IS NULL) and  V1.NUMDOC_GRUPO IS NULL '+
         '      AND V1.NFEENTRADASAIDA = ''0'' AND V1.PROCESSO_ID NOT IN (SELECT PROCESSO_ID FROM VENDAS1 WHERE FATURADO <> 2 AND NFEENTRADASAIDA = ''1'') AND (V1.NFE_DEV is null or V1.STATUS_NFE_DEV = 135) ' +
         '      AND V1.COD_REPRESENTANTE = R.ID ' +
         '      and v1.cod_fop not in (7, 9, 22, 23, 24, 26, 32, 46, 47, 51, 52, 53, 54, 57, 58)  ' +
         ifthen(rbApenasConsumidorFinal.Checked, '      and coalesce(v1.consumidor_final, ''N'') = ''S'' ',
         ifthen(rbNaoConsumidorFinal.Checked, '      and coalesce(v1.consumidor_final, ''N'') = ''N'' ', ''))+
         '  ),0) AS TOTAL_FATURADO, ' +

         '  COALESCE(( ' +
         '    SELECT ' +
         '      COUNT(V1.NUMDOC) ' +
         '    FROM ' +
         '      VENDAS1 V1 ' +
         '    WHERE ' +
         '       V1.DTA_EMISSAO between ' + quotedstr(formatdatetime('dd/mm/yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd/mm/yyyy', Prdta_final.date)) +
         '      and (V1.consignacao <> 1 and V1.orcamento= 0 ) ' +
         '      and (v1.COD_FISCAL not in (''6152'', ''6409'') OR V1.COD_FISCAL IS NULL) and  V1.NUMDOC_GRUPO IS NULL '+
         '      AND V1.NFEENTRADASAIDA = ''0'' AND V1.PROCESSO_ID NOT IN (SELECT PROCESSO_ID FROM VENDAS1 WHERE FATURADO <> 2 AND NFEENTRADASAIDA = ''1'') AND (V1.NFE_DEV is null or V1.STATUS_NFE_DEV = 135) ' +
         '      AND V1.COD_REPRESENTANTE = R.ID ' +
         '      and v1.cod_fop not in (7, 9, 22, 23, 24, 26, 32, 46, 47, 51, 52, 53, 54, 57, 58)  ' +
         ifthen(rbApenasConsumidorFinal.Checked, '      and coalesce(v1.consumidor_final, ''N'') = ''S'' ',
         ifthen(rbNaoConsumidorFinal.Checked, '      and coalesce(v1.consumidor_final, ''N'') = ''N'' ', ''))+
         '  ),0) AS QTDE, ' +

         '  COALESCE(( ' +
         '    SELECT ' +
         '      AVG(V1.DESCONTO) ' +
         '    FROM ' +
         '      VENDAS1 V1 ' +
         '    WHERE ' +
         '       V1.DTA_EMISSAO between ' + quotedstr(formatdatetime('dd/mm/yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd/mm/yyyy', Prdta_final.date)) +
         '      and (V1.consignacao <> 1 and V1.orcamento= 0 ) ' +
         '      and (v1.COD_FISCAL not in (''6152'', ''6409'') OR V1.COD_FISCAL IS NULL) and  V1.NUMDOC_GRUPO IS NULL '+
         '      AND V1.NFEENTRADASAIDA = ''0'' AND V1.PROCESSO_ID NOT IN (SELECT PROCESSO_ID FROM VENDAS1 WHERE FATURADO <> 2 AND NFEENTRADASAIDA = ''1'') AND (V1.NFE_DEV is null or V1.STATUS_NFE_DEV = 135) ' +
         '      AND V1.COD_REPRESENTANTE = R.ID ' +
         '      and v1.cod_fop not in (7, 9, 22, 23, 24, 26, 32, 46, 47, 51, 52, 53, 54, 57, 58)  ' +
         ifthen(rbApenasConsumidorFinal.Checked, '      and coalesce(v1.consumidor_final, ''N'') = ''S'' ',
         ifthen(rbNaoConsumidorFinal.Checked, '      and coalesce(v1.consumidor_final, ''N'') = ''N'' ', ''))+
         '  ),0) AS DESCONTO ' +

         'from ' +
         '  REPRESENTANTE r ' +
         'where ' +
         '      r.FUNCIONARIO IN (''0'',''1'') ' +
         '  and COALESCE(( ' +
         '    SELECT ' +
         '      SUM(V1.TOT_LIQUIDO) ' +
         '    FROM ' +
         '      VENDAS1 V1 ' +
         '    WHERE ' +
         '       V1.DTA_EMISSAO between ' + quotedstr(formatdatetime('dd/mm/yyyy', Prdta_inicial.date)) +' and ' + quotedstr(formatdatetime('dd/mm/yyyy', Prdta_final.date)) +
         '      and (V1.consignacao <> 1 and V1.orcamento= 0 ) ' +
         '      and (v1.COD_FISCAL not in (''6152'', ''6409'') OR V1.COD_FISCAL IS NULL) and V1.FATURADO in (1) ' +
         '      and V1.NUMDOC_GRUPO IS NULL AND (V1.NFE_DEV is null or V1.STATUS_NFE_DEV = 135) ' +
         '      and V1.NFEENTRADASAIDA = ''0'' AND V1.PROCESSO_ID NOT IN (SELECT PROCESSO_ID FROM VENDAS1 WHERE FATURADO <> 2 AND NFEENTRADASAIDA = ''1'') '+
         '      AND V1.COD_REPRESENTANTE = R.ID ' +
         ifthen(rbApenasConsumidorFinal.Checked, '      and coalesce(v1.consumidor_final, ''N'') = ''S'' ',
         ifthen(rbNaoConsumidorFinal.Checked, '      and coalesce(v1.consumidor_final, ''N'') = ''N'' ', ''))+
         '  ),0) > 0 ' + cmd_rep +

         'UNION ' +
         'select ' +
         '  ''TELEVENDAS'' AS TIPO, ' +
         '  r.id||''-''||r.NOM_REPRESENTANTE as REPRESENTANTE, ' +
         '  coalesce(( ' +
         '    SELECT ' +
         '      SUM(V1.TOT_LIQUIDO) ' +
         '    FROM ' +
         '      VENDAS1 V1 ' +
         '    WHERE ' +
         '       V1.DTADOC between ' + quotedstr(formatdatetime('dd/mm/yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd/mm/yyyy', Prdta_final.date)) +
         '      and (V1.consignacao <> 1 and V1.orcamento= 0 ) ' +
         '      and V1.FATURADO in (0) ' +
         '      and (v1.COD_FISCAL not in (''6152'', ''6409'') OR V1.COD_FISCAL IS NULL) and V1.NUMDOC_GRUPO IS NULL '+
         '      AND V1.NFEENTRADASAIDA = ''0'' AND V1.PROCESSO_ID NOT IN (SELECT PROCESSO_ID FROM VENDAS1 WHERE FATURADO <> 2 AND NFEENTRADASAIDA = ''1'') AND (V1.NFE_DEV is null or V1.STATUS_NFE_DEV = 135) ' +
         '      AND V1.COD_SUPERVISOR = R.ID ' +
         '      AND v1.cod_fop not in (7, 9, 22, 23, 24, 26, 32, 46, 47, 51, 52, 53, 54, 57, 58)  ' +
         ifthen(rbApenasConsumidorFinal.Checked, '      and coalesce(v1.consumidor_final, ''N'') = ''S'' ',
         ifthen(rbNaoConsumidorFinal.Checked, '      and coalesce(v1.consumidor_final, ''N'') = ''N'' ', ''))+
          '  ),0) AS TOTAL_ABERTO, ' +
         '  COALESCE(( ' +
         '    SELECT ' +
         '      SUM(V1.TOT_LIQUIDO) ' +
         '    FROM  ' +
         '      VENDAS1 V1 ' +
         '    WHERE ' +
         '       V1.DTA_EMISSAO between ' + quotedstr(formatdatetime('dd/mm/yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd/mm/yyyy', Prdta_final.date)) +
         '      and (V1.consignacao <> 1 and V1.orcamento= 0 ) ' +
         '      and V1.FATURADO in (1) ' +
         '      and (v1.COD_FISCAL not in (''6152'', ''6409'') OR V1.COD_FISCAL IS NULL) and V1.NUMDOC_GRUPO IS NULL '+
         '      AND V1.NFEENTRADASAIDA = ''0'' AND V1.PROCESSO_ID NOT IN (SELECT PROCESSO_ID FROM VENDAS1 WHERE FATURADO <> 2 AND NFEENTRADASAIDA = ''1'') AND (V1.NFE_DEV is null or V1.STATUS_NFE_DEV = 135) ' +
         '      AND V1.COD_SUPERVISOR = R.ID ' +
         '      AND v1.cod_fop not in (7, 9, 22, 23, 24, 26, 32, 46, 47, 51, 52, 53, 54, 57, 58)  ' +
         ifthen(rbApenasConsumidorFinal.Checked, '      and coalesce(v1.consumidor_final, ''N'') = ''S'' ',
         ifthen(rbNaoConsumidorFinal.Checked, '      and coalesce(v1.consumidor_final, ''N'') = ''N'' ', ''))+
         '  ),0) AS TOTAL_FATURADO, ' +

         '  COALESCE(( ' +
         '    SELECT ' +
         '      COUNT(NUMDOC) ' +
         '    FROM  ' +
         '      VENDAS1 V1 ' +
         '    WHERE ' +
         '       V1.DTA_EMISSAO between ' + quotedstr(formatdatetime('dd/mm/yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd/mm/yyyy', Prdta_final.date)) +
         '      and (V1.consignacao <> 1 and V1.orcamento= 0 ) ' +
         '      and (v1.COD_FISCAL not in (''6152'', ''6409'') OR V1.COD_FISCAL IS NULL) and V1.NUMDOC_GRUPO IS NULL '+
         '      AND V1.NFEENTRADASAIDA = ''0'' AND V1.PROCESSO_ID NOT IN (SELECT PROCESSO_ID FROM VENDAS1 WHERE FATURADO <> 2 AND NFEENTRADASAIDA = ''1'') AND (V1.NFE_DEV is null or V1.STATUS_NFE_DEV = 135) ' +
         '      AND V1.COD_SUPERVISOR = R.ID ' +
         '      AND v1.cod_fop not in (7, 9, 22, 23, 24, 26, 32, 46, 47, 51, 52, 53, 54, 57, 58)  ' +
         ifthen(rbApenasConsumidorFinal.Checked, '      and coalesce(v1.consumidor_final, ''N'') = ''S'' ',
         ifthen(rbNaoConsumidorFinal.Checked, '      and coalesce(v1.consumidor_final, ''N'') = ''N'' ', ''))+
         '  ),0) AS QTDE, ' +

         '  COALESCE(( ' +
         '    SELECT ' +
         '      AVG(V1.DESCONTO) ' +
         '    FROM  ' +
         '      VENDAS1 V1 ' +
         '    WHERE ' +
         '       V1.DTA_EMISSAO between ' + quotedstr(formatdatetime('dd/mm/yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd/mm/yyyy', Prdta_final.date)) +
         '      and (V1.consignacao <> 1 and V1.orcamento= 0 ) ' +
         '      and (v1.COD_FISCAL not in (''6152'', ''6409'') OR V1.COD_FISCAL IS NULL) and V1.NUMDOC_GRUPO IS NULL '+
         '      AND V1.NFEENTRADASAIDA = ''0'' AND V1.PROCESSO_ID NOT IN (SELECT PROCESSO_ID FROM VENDAS1 WHERE FATURADO <> 2 AND NFEENTRADASAIDA = ''1'') AND (V1.NFE_DEV is null or V1.STATUS_NFE_DEV = 135) ' +
         '      AND V1.COD_SUPERVISOR = R.ID ' +
         '      AND v1.cod_fop not in (7, 9, 22, 23, 24, 26, 32, 46, 47, 51, 52, 53, 54, 57, 58)  ' +
         ifthen(rbApenasConsumidorFinal.Checked, '      and coalesce(v1.consumidor_final, ''N'') = ''S'' ',
         ifthen(rbNaoConsumidorFinal.Checked, '      and coalesce(v1.consumidor_final, ''N'') = ''N'' ', ''))+
         '  ),0) AS DESCONTO ' +
         'from ' +
         '  REPRESENTANTE r ' +
         'where ' +
         '      R.FUNCIONARIO IN (''4'') ' + cmd_rep +
         '  and COALESCE(( ' +
         '    SELECT ' +
         '      SUM(V1.TOT_LIQUIDO) ' +
         '    FROM ' +
         '      VENDAS1 V1 ' +
         '    WHERE ' +
         '       V1.DTA_EMISSAO between ' + quotedstr(formatdatetime('dd/mm/yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd/mm/yyyy', Prdta_final.date)) +
         '      and (V1.consignacao <> 1 and V1.orcamento= 0 ) ' +
         '      and  (v1.COD_FISCAL not in (''6152'', ''6409'') OR V1.COD_FISCAL IS NULL) ' +
         '      and V1.NUMDOC_GRUPO IS NULL AND (V1.NFE_DEV is null or V1.STATUS_NFE_DEV = 135) ' +
         '      and V1.NFEENTRADASAIDA = ''0'' AND V1.PROCESSO_ID NOT IN (SELECT PROCESSO_ID FROM VENDAS1 WHERE FATURADO <> 2 AND NFEENTRADASAIDA = ''1'') '+
         '      AND V1.COD_SUPERVISOR = R.ID ' +
         ifthen(rbApenasConsumidorFinal.Checked, '      and coalesce(v1.consumidor_final, ''N'') = ''S'' ',
         ifthen(rbNaoConsumidorFinal.Checked, '      and coalesce(v1.consumidor_final, ''N'') = ''N'' ', ''))+
         '  ),0) > 0 ' +
         ') q1 ' +
         'order by TIPO, total_FATURADO desc ';

  with dm.q_ranking_vendas do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_ranking_vendas.RecordCount = 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\ranking_vendas.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.ranking_vendas_completo;
var
  cmd, cmd_rep: string;
begin
  cmd_rep := '';

  if Prcod_representante.Text <> '' then
    cmd_rep := ' and r.id = ' + Prcod_representante.Text;

  if prcod_supervisor.Text <> '' then
    cmd_rep := ' and r.id = ' + prcod_supervisor.Text;

  if (Prcod_representante.Text <> '') and (prcod_supervisor.Text <> '') then
    cmd_rep := ' and r.id in (' + Prcod_representante.Text + ',' + prcod_supervisor.Text + ')';

  cmd := 'select '+
         '  r.id, '+
         '  r.nom_representante, '+
         '  mr.mes, '+
         '  mr.vl_meta, '+
         '  coalesce(mr.vl_realizado, 0) as vl_realizado, '+
         '  coalesce(mr.perc_realizado, 0) as perc_realizado, '+
         '  coalesce(mr.qtd_clientes_atendidos, 0) as qtd_clientes_atendidos, '+
         '  mr.qtd_clientes_base, '+
         '  coalesce(mr.perc_positivacao, 0) as perc_positivacao, '+
         '  coalesce(mr.ticket_medio,0) as ticket_medio, '+
         '  coalesce(mr.perc_desconto,0) as perc_desconto '+
         'from metas_representante mr '+
         'inner join representante r on r.id = mr.id_representante '+
         'where mes = '''+cbMes.Text+'''' +
         ifthen(rbApenasConsumidorFinal.Checked, '  and coalesce(r.consumidor_final, ''N'') = ''S'' ',
         ifthen(rbNaoConsumidorFinal.Checked, ' and coalesce(r.consumidor_final, ''N'') = ''N'' ', ''))+
         ' order by 5 desc ';

  with dm.q_ranking_vendas_completo do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_ranking_vendas_completo.RecordCount = 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\ranking_vendas_completo.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.relatorio_teto_fixo;
var
  cmd: string;
begin
  cmd := ' select ' + '   V1.numdoc, V1.numdoc_grupo, V1.dtadoc, v1.numdoc_destino, v1.entregue, ' + '   case when v1.NUMDOC_GRUPO is not null then (select V.DTA_EMISSAO from vendas1 v where v.NUMDOC = v1.NUMDOC_GRUPO) else V1.DTA_EMISSAO end AS DTA_EMISSAO, ' + '   case when v1.NUMDOC_GRUPO is not null then (select case when v.faturado = 1 then v1.TOT_LIQUIDO else 0 end from vendas1 v where coalesce(v.NUMDOC_DESTINO, v.NUMDOC) = v1.NUMDOC_GRUPO) else  ' +
    '   coalesce((select sum(valor) from cr1 as cr where cr.nr_documento = coalesce(v1.numdoc_destino, v1.NUMDOC)),0)  - case when cd.UF <> ''SC'' and v1.nfe is not null then v1.VLR_ST else 0 end end as valor_cr, ' + '   c.cod_cliente, c.nom_cliente, r.id as codrep, r.NOM_REPRESENTANTE, r.cpf, b.NOM_BANCO, r.NR_BANCO,r.NR_AGENCIA,r.NR_CONTA_CORRENTE, R.TITULAR_CONTA, r.email, r.fone,r.celular, ' + '   CASE WHEN V1.NUMDOC_DESTINO IS NULL THEN (r.PERC_COMISSAO_FIXA - case when v1.cod_supervisor is not null then 1 else 0 end) ELSE ((r.PERC_COMISSAO_FIXA)/5)*(-1) END  as comissao, ' + '   CASE WHEN V1.NUMDOC_DESTINO IS NULL THEN V1.tot_liquido ELSE (SELECT VD.TOT_LIQUIDO FROM VENDAS1 VD WHERE VD.NUMDOC = V1.NUMDOC_DESTINO) END AS TOT_LIQUIDO, ' +
'   CASE WHEN V1.NUMDOC_DESTINO IS NULL ' + '        THEN (case when v1.NUMDOC_GRUPO is not null  ' + '                   then (select case when v.faturado = 1  ' + '                                     then v1.TOT_LIQUIDO ' + '                                     else 0  ' + '                                end  ' + '                         from vendas1 v  ' + '                         where coalesce(v.NUMDOC_DESTINO, v.NUMDOC) = v1.NUMDOC_GRUPO)  ' +
  '                   else coalesce((select sum(valor) from cr1 as cr where cr.nr_documento = coalesce(v1.numdoc_destino, v1.NUMDOC)),0)  - case when cd.UF <> ''SC'' and v1.nfe is not null then v1.VLR_ST else 0 end end)  ' + '                        * (CAST((CASE WHEN V1.NUMDOC_DESTINO IS NULL  ' + '                                      THEN (r.PERC_COMISSAO_FIXA - (case when v1.cod_supervisor is not null then 1 else 0 end)) ELSE ((r.PERC_COMISSAO_FIXA)/5)*(-1) END) AS NUMERIC(15,4)) /100)  ' +
  '        ELSE ((SELECT VD.TOT_LIQUIDO FROM VENDAS1 VD WHERE VD.NUMDOC = V1.NUMDOC_DESTINO) * ((r.PERC_COMISSAO_FIXA/5)*(-1)))/100  ' + '        END as vlr_comissao, ' + '   case when v1.cod_supervisor is not null then ''Sim'' else ''Não'' end as supervisao, ' + '   case when v1.NUMDOC_GRUPO is not null then (select v.faturado from vendas1 v where v.NUMDOC = v1.NUMDOC_GRUPO) else v1.FATURADO end AS FATURADO, ' + '   V1.COD_SUPERVISOR, ' +
  '   case when case when v1.NUMDOC_GRUPO is not null then (select v.faturado from vendas1 v where v.NUMDOC = v1.NUMDOC_GRUPO) else v1.FATURADO end = 1 then ' + '   ( ' + '    ((case when v1.NUMDOC_GRUPO is not null then (select case when v.faturado = 1 then v1.TOT_LIQUIDO else 0 end from vendas1 v where v.NUMDOC = v1.NUMDOC_GRUPO) else coalesce((select sum(valor) from cr1 as cr where cr.nr_documento = v1.NUMDOC),0)  - ' +
  '     case when cd.UF <> ''SC'' and v1.nfe is not null then v1.VLR_ST else 0 end end) ' + '    - ' + '    (select case when sum(v2.PRECO_CUSTO*v2.QTD) = 0 then sum(p.CUSTO_TOTAL*v2.QTD) else sum(v2.PRECO_CUSTO*v2.QTD) end from vendas2 v2 INNER JOIN PRODUTO P ON P.COD_PRODUTO = v2.COD_PRODUTO  where v2.NUMDOC = v1.NUMDOC)) ' + '    / ' + '    (select case when sum(v2.PRECO_CUSTO*v2.QTD) = 0 then sum(p.CUSTO_TOTAL*v2.QTD) else sum(v2.PRECO_CUSTO*v2.QTD) end from vendas2 v2 INNER JOIN PRODUTO P ON P.COD_PRODUTO = v2.COD_PRODUTO  where v2.NUMDOC = v1.NUMDOC) '
  + '   )*100 ' + '  else ' + '  (( ' + '    (case when v1.NUMDOC_GRUPO is not null then (select case when v.faturado = 1 then v1.TOT_LIQUIDO else 0 end from vendas1 v where coalesce(v.NUMDOC_DESTINO, v.NUMDOC) = v1.NUMDOC_GRUPO) ' + '                                            else     coalesce((select sum(valor) from cr1 as cr where cr.nr_documento = coalesce(v1.numdoc_destino, v1.NUMDOC)),0)  - case when cd.UF <> ''SC'' and v1.nfe is not null then v1.VLR_ST else 0 end end) ' + '    - ' +
  '    (select case when sum(v2.PRECO_CUSTO*v2.QTD) = 0 then sum(p.CUSTO_TOTAL*v2.QTD) else sum(v2.PRECO_CUSTO*v2.QTD) end from vendas2 v2 INNER JOIN PRODUTO P ON P.COD_PRODUTO = v2.COD_PRODUTO  where v2.NUMDOC = v1.NUMDOC)) ' + '    / ' + '    (select case when sum(v2.PRECO_CUSTO*v2.QTD) = 0 then sum(p.CUSTO_TOTAL*v2.QTD) else sum(v2.PRECO_CUSTO*v2.QTD) end from vendas2 v2 INNER JOIN PRODUTO P ON P.COD_PRODUTO = v2.COD_PRODUTO  where v2.NUMDOC = v1.NUMDOC) ' + '  )*100 ' + '  end as margem ' +
  ' from vendas1 v1 ' + ' left join cliente c on c.cod_cliente=v1.cod_cliente ' +
  ' left join CIDADES cd on cd.COD_CIDADE = c.COD_CIDADE ' + ' INNER join REPRESENTANTE r on r.ID = v1.COD_REPRESENTANTE ' + ' left join BANCO b on b.ID = CAST(r.NR_BANCO AS INTEGER) ' +
  ' where ' +
  '   (v1.COD_FISCAL not in (''6152'', ''6409'') OR V1.COD_FISCAL IS NULL) and V1.NFEENTRADASAIDA = ''0'' AND V1.PROCESSO_ID NOT IN (SELECT PROCESSO_ID FROM VENDAS1 WHERE FATURADO <> 2 AND NFEENTRADASAIDA = ''1'') '+
  '   AND (v1.NFE_DEV is null OR v1.STATUS_NFE_DEV = 135) and ' +
  '   v1.consignacao <> 1 and  ' +
  '   v1.cod_fop not in (7, 9, 22, 23, 24, 26, 32, 46, 47, 51, 52, 53, 54, 57, 58)  ';

  if zzfaturado.Checked then
    cmd := cmd + ' and v1.dta_emissao between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date))
  else if zznao_faturado.Checked then
    cmd := cmd + ' and v1.dtadoc between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date))
  else
    cmd := cmd + ' and case when v1.FATURADO = ''1'' then v1.DTA_EMISSAO else v1.dtadoc END between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date));

  if Pruf.Text <> '' then
    cmd := cmd + ' and cd.UF = ' + quotedstr(Pruf.Text);

  if Prcod_representante.Text <> '' then
    cmd := cmd + fmfun.cmdAux('v1.cod_representante', Prcod_representante.Text);

  if edcodsupervisor.Text <> '' then
    cmd := cmd + fmfun.cmdAux('v1.cod_supervisor', edcodsupervisor.Text);
  {
    if c_marca <> '' then
    cmd:= cmd + ' and v1.id_marca='+QuotedStr(c_marca);
  }
  if zzfaturado.Checked then
    cmd := cmd + ' and v1.faturado=' + quotedstr('1') + ' and v1.orcamento=' + quotedstr('0')
  else if zznao_faturado.Checked then
    cmd := cmd + ' and v1.faturado=' + quotedstr('0') + ' and v1.orcamento=' + quotedstr('0')
  else if zzdesativados.Checked then
    cmd := cmd + ' and v1.faturado=' + quotedstr('4') + ' and v1.orcamento=' + quotedstr('0')
  else if zzfaturado_todos.Checked then
    cmd := cmd + ' and v1.faturado<>' + quotedstr('4') + ' and v1.orcamento=' + quotedstr('0')
  else if zzorcamento.Checked then
    cmd := cmd + ' and v1.faturado=' + quotedstr('0') + ' and v1.orcamento=' + quotedstr('1');

  if rbApenasSupervisao.Checked then
    cmd := cmd + ' and v1.cod_supervisor is not null ';

  if rbSemSupervisao.Checked then
    cmd := cmd + ' and v1.cod_supervisor is null ';

  if rbNaoConsumidorFinal.Checked then
    cmd := cmd + 'and coalesce(v1.consumidor_final, ''N'') = ''N'' ';

  if rbApenasConsumidorFinal.Checked then
    cmd := cmd + 'and coalesce(v1.consumidor_final, ''N'') = ''S'' ';

  if trim(edPedido.Text) <> '' then
    cmd := cmd + fmfun.cmdAux('V1.NUMDOC', edPedido.Text);

  cmd := cmd + ' order by NOM_REPRESENTANTE, NUMDOC_DESTINO, dtadoc, numdoc';

  with dm.q_comissao_venda do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_comissao_venda.RecordCount = 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if Prcod_representante.Text <> '' then
  begin
    cmd := 'SELECT a.ID_REPRESENTANTE, a.TETO, a.COMISSAO FROM REPRESENTANTE_TETO_COMISSAO a WHERE A.ID_REPRESENTANTE = ' + Prcod_representante.Text;

    with dm.q_teto_comissao do
    begin
      close;
      sql.clear;
      sql.add(cmd);
      open;
    end;

    if dm.q_teto_comissao.RecordCount = 0 then
    begin
      dao.msg('Não foi encontrado registro neste periodo!');
      exit;
    end;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\comissoes_teto.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.relatorio_supervisao;
var
  cmd: string;
begin
  cmd := 'select v1.numdoc, v1.dtadoc, v1.dta_emissao, v1.tot_liquido, coalesce((select sum(cr.valor) from cr1 as cr where cr.nr_documento = v1.NUMDOC),0) as valor_cr, ' +
    'c.nom_cliente, r.id as cod_representante, r.NOM_REPRESENTANTe, S.id as cod_supervisor, S.NOM_REPRESENTANTE as nom_supervisor, b.NOM_BANCO, ' +
    'S.NR_BANCO,S.NR_AGENCIA,S.NR_CONTA_CORRENTE, S.TITULAR_CONTA, S.email, S.fone,S.celular, ' +
    'S.PERC_COMISSAO_FIXA as comissao, ''Sim'' as supervisao, faturado, (tot_liquido*r.PERC_COMISSAO_FIXA)/100 as vlr_comissao, ' +
    'v1.desconto, case when v1.cod_representante = 6 then coalesce((select e.perc_comissao_func from escala_comissao_televendas e where e.desconto >= v1.desconto order by e.desconto limit 1), 0) else 0 end as perc_comissao ' +
    'from vendas1 v1 ' +
    'inner join cliente c on c.cod_cliente=v1.cod_cliente ' +
    'inner join cidades cd on cd.cod_cidade = c.cod_cidade ' +
    'INNER join REPRESENTANTE r on r.ID = V1.COD_REPRESENTANTE ' +
    'INNER join REPRESENTANTE S on S.ID = v1.COD_SUPERVISOR ' +
    'left join BANCO b on b.ID = CAST(r.NR_BANCO AS INTEGER) ' +
    'where ' +
    '  (v1.COD_FISCAL not in (''6152'', ''6409'') OR V1.COD_FISCAL IS NULL) and v1.NFE_DEV is null and ' +
    '  V1.NFEENTRADASAIDA = ''0'' AND V1.PROCESSO_ID NOT IN (SELECT PROCESSO_ID FROM VENDAS1 WHERE FATURADO <> 2 AND NFEENTRADASAIDA = ''1'') AND (v1.NFE_DEV is null OR v1.STATUS_NFE_DEV = 135) and ' +
    '  v1.consignacao<> ''1'' and ' +
    '  v1.orcamento=''0'' and ' +
    '  v1.cod_fop not in (7,9)';

  if zzfaturado.Checked then
    cmd := cmd + ' and dta_emissao between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date))
  else if zznao_faturado.Checked then
    cmd := cmd + ' and dtadoc between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date))
  else
    cmd := cmd + ' and case when FATURADO = ''1'' then DTA_EMISSAO else dtadoc END between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date));

  { if c_fornecedor <> '' then
    cmd:= cmd + ' and p.fornecedor_principal = ' + QuotedStr(c_fornecedor);

    if c_loja <> '' then
    cmd:= cmd + ' and v1.empresa_faturar = ' + QuotedStr(c_loja);

    if c_grupo <> '' then
    cmd:= cmd + ' and p.cod_grupo='+QuotedStr(c_grupo);
  }

  if Pruf.Text <> '' then
    cmd := cmd + ' and cd.uf = ' + quotedstr(Pruf.Text);

  if edcodsupervisor.Text <> '' then
    cmd := cmd + fmfun.cmdAux('v1.COD_SUPERVISOR', edcodsupervisor.Text);

  if edCodRepresentante.Text <> '' then
    cmd := cmd + fmfun.cmdAux('V1.COD_REPRESENTANTE', edCodRepresentante.Text);

  {
    if c_marca <> '' then
    cmd:= cmd + ' and v1.id_marca='+QuotedStr(c_marca);
  }
  if zzfaturado.Checked then
    cmd := cmd + ' and v1.faturado=' + quotedstr('1') + ' and v1.orcamento=' + quotedstr('0')
  else if zznao_faturado.Checked then
    cmd := cmd + ' and v1.faturado=' + quotedstr('0') + ' and v1.orcamento=' + quotedstr('0')
  else if zzdesativados.Checked then
    cmd := cmd + ' and v1.faturado=' + quotedstr('4') + ' and v1.orcamento=' + quotedstr('0')
  else if zzfaturado_todos.Checked then
    cmd := cmd + ' and v1.faturado<>' + quotedstr('4') + ' and v1.orcamento=' + quotedstr('0')
  else if zzorcamento.Checked then
    cmd := cmd + ' and v1.faturado=' + quotedstr('0') + ' and v1.orcamento=' + quotedstr('1');

  if trim(edPedido.Text) <> '' then
    cmd := cmd + fmfun.cmdAux('NUMDOC', edPedido.Text);

  cmd := cmd + ' order by cod_supervisor, NOM_REPRESENTANTE, dtadoc, numdoc';

  with dm.q_supervisao do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_supervisao.RecordCount < 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\supervisao.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.relatorio_pedidos_geral;
var
  cmd: string;
  oExportfilter: TfrxCustomExportFilter;
begin
  path := ExtractFilePath(Application.ExeName);
    cmd := 'SELECT a.NR_CONEXAO, a.COD_REPRESENTANTE, a.DATA_CONEXAO, a.HORA_CONEXAO, a.QTDE_PEDIDOS, a.QTDE_VISITAS_NEGATIVAS, a.CHECADO, cast(a.USUARIO_CHECOU||''-''||u.NOME as varchar(200)) as USUARIO_CHECOU, a.DATA_HORA_CHECADO, '
      + ' vd1.numdoc, v1.numdoc_destino, vd1.DTADOC, cast(c.COD_CLIENTE||''-''||c.NOM_CLIENTE as varchar(200)) as cliente, c.ENDERECO, c.telefone, c.NR_ENDERECO, c.CEP, cast(cid.NOM_CIDADE||''-''||cid.UF as varchar(200)) as cidade, C.CNPJ, C.IE, '
      + ' C.RG,C.CPF, C.EMAIL, vd1.TOT_BRUTO, cast(vd1.TOT_LIQUIDO as Numeric(15,2)) as tot_liquido, '
      + ' cast(vd1.COD_FOP||''-''||f.NOM_FOP as varchar(200)) as fop, cast(vd1.COD_REPRESENTANTE||''-''||r.NOM_REPRESENTANTE as varchar(200)) as representante, p.PRAZO, vd1.PALM_NR_CONEXAO, vd1.OBSERVACOES_PEDIDO, '
      + ' vd2.ID, cast(vd1.NR_PEDIDO_PALM as varchar(10)) as NR_PEDIDO_PALM, cast(vd2.COD_PRODUTO||''-''||pr.NOM_PRODUTO as varchar(200)) as produto, pr.unidade, vd2.QTD, vd2.PRECO, '
      + ' vd2.SUB_TOTAL, vd2.NR_PEDIDO_PALM, vd2.PRECO_BRUTO, (((vd2.PRECO_BRUTO - vd2.PRECO)/vd2.PRECO_BRUTO) * 100) AS PERC_DESC, vd2.VOLUME, '
      + ' '''' as NCM, ' + ' 0  as VLR_ICMS_ST, ' + ' 0  as perc_st, ' +
      ' pr.codigo_barra ' +
      'FROM vendas1 VD1 '+
      'inner join vendas2 vd2 on vd2.numdoc = vd1.numdoc '+
      'LEFT OUTER join CLIENTE c on (c.COD_CLIENTE = vd1.COD_CLIENTE) '+
      'LEFT OUTER join Cidades cid on (cid . COD_Cidade = c.COD_cidade) '+
      'inner join cadmicro mc on (mc.microcod = cid.microcod) ' +
      'inner join cadmeso ms on (ms.mesocod = mc.mesocod) ' +
      'LEFT OUTER join REPRESENTANTE r on (r.id = vd1.COD_REPRESENTANTE) '+
      'LEFT OUTER join prazo p on (p.ID = vd1.COD_PRAZO_PGTO) '+
      'LEFT OUTER join fop f on (f.COD_FOP = vd1.COD_FOP) '+
      'LEFT OUTER join produto pr on (pr.COD_PRODUTO = vd2.COD_PRODUTO) '+
      'LEFT OUTER join PEDIDO_PALM1 v1 on cast (vd1.nr_pedido_palm as INTEGER) = v1.nr_pedido_palm '+
      'LEFT OUTER join PEDIDO_PALM2 v2 on (v2.NR_PEDIDO_PALM = v1.NR_PEDIDO_PALM) '+
      'LEFT OUTER JOIN PALM_LOTE a on (v1.PALM_NR_CONEXAO = a.NR_CONEXAO) '+
      'LEFT OUTER join tbusu u on (u.CODUSU = a.USUARIO_CHECOU) '+
      'WHERE 1 = 1 ';

  if Rb_filtro_faturamento.Checked then
    cmd := cmd + ' and vd1.dta_emissao between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date));

  if Rb_filtro_emissao.Checked then
    cmd := cmd + ' and vd1.dtadoc between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date));

  if edfop.Text <> '' then
    cmd := cmd + fmfun.cmdAux('vd1.cod_fop', edfop.Text);

  if edProduto.Text <> '' then
    cmd := cmd + fmfun.cmdAux('pr.cod_produto', edProduto.Text);

  if edFornecedor.Text <> '' then
    cmd := cmd + ' and vd1.NUMDOC in (select distinct v22.numdoc from vendas2 v22 inner join produto p22 on p22.cod_produto = v22.COD_PRODUTO where p22.FORNECEDOR_PRINCIPAL in (' + StringReplace(edFornecedor.Text, ';', ',', [rfReplaceAll]) + ')) ';

  if edCliente.Text <> '' then
    cmd := cmd + fmfun.cmdAux('vd1.cod_cliente', edCliente.Text);

  if edCidade.Text <> '' then
    cmd := cmd + fmfun.cmdAux('c.cod_cidade', edCidade.Text);

  if Pruf.Text <> '' then
    cmd := cmd + ' and cid.uf = ' + quotedstr(Pruf.Text);

  if edMicroRegiao.Text <> '' then
    cmd := cmd + fmfun.cmdAux('mc.microcod', edMicroRegiao.Text);

  if edMesoRegiao.Text <> '' then
    cmd := cmd + fmfun.cmdAux('ms.mesocod', edMesoRegiao.Text);

  if edCodRepresentante.Text <> '' then
    cmd := cmd + fmfun.cmdAux('r.id', edCodRepresentante.Text);

  if edPedido.Text <> '' then
    cmd := cmd + fmfun.cmdAux('vd1.numdoc', edPedido.Text);

  if edGrupo.Text <> '' then
    cmd := cmd + fmfun.cmdAux('pr.cod_grupo', edGrupo.Text);

  cmd := cmd + '  and vd1.faturado <> ' + quotedstr('2');

  if zzfaturado.Checked then
    cmd := cmd + ' and vd1.faturado=' + quotedstr('1') + ' and vd1.orcamento=' + quotedstr('0')
  else if zznao_faturado.Checked then
    cmd := cmd + ' and vd1.faturado=' + quotedstr('0') + ' and vd1.orcamento=' + quotedstr('0')
  else if zzdesativados.Checked then
    cmd := cmd + ' and vd1.faturado=' + quotedstr('4') + ' and vd1.orcamento=' + quotedstr('0')
  else if zzfaturado_todos.Checked then
    cmd := cmd + ' and vd1.faturado<>' + quotedstr('4') + ' and vd1.orcamento=' + quotedstr('0')
  else if zzorcamento.Checked then
    cmd := cmd + ' and vd1.faturado=' + quotedstr('0') + ' and vd1.orcamento=' + quotedstr('1');

  if rbSemSupervisao.Checked then
    cmd := cmd + 'and vd1.cod_supervisor is null';

  if rbApenasSupervisao.Checked then
    cmd := cmd + 'and vd1.cod_supervisor is not null';

  if rbNaoConsumidorFinal.Checked then
    cmd := cmd + 'and coalesce(vd1.consumidor_final, ''N'') = ''N'' ';

  if rbApenasConsumidorFinal.Checked then
    cmd := cmd + 'and coalesce(vd1.consumidor_final, ''N'') = ''S'' ';


  cmd := cmd + ' order by  representante, NR_CONEXAO, vd1.NUMDOC, v2.COD_PRODUTO, v2.VOLUME ';

  with dm.q_palm_pedidos do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\pedido_email.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.relatorio_pedidos_desfaturados;
var
  cmd: string;
begin
  cmd := 'select l.ID, l.COD_USUARIO_LOGADO, l.NOME AS NOME_LOGADO, l.DATA, l.HORA, l.DESCRICAO, l.pedido, case v1.faturado when 1 then ''Sim'' else ''Não'' end faturado, v1.usuario_desfaturou, ud.nome AS NOME_DESFATUROU, v1.tot_bruto, c.cod_cliente, c.nom_cliente ' + 'from ' + '( ' + ' SELECT a.ID, a.COD_USUARIO_LOGADO, u.NOME, a.DATA, a.HORA, a.DESCRICAO, cast(substring(a.descricao from position('':'' in a.DESCRICAO)+1 for 6) as integer) as pedido ' + ' FROM LOG a ' +
    ' inner join tbusu u on (u.CODUSU = a.COD_USUARIO_LOGADO) ' + ' where a.DESCRICAO like ''%DESFATURAMENTO PEDIDO N°:%'' ' + 'union ' + ' SELECT a.ID, a.COD_USUARIO_LOGADO, u.NOME, a.DATA, a.HORA, a.DESCRICAO, cast(substring(a.descricao from position('':'' in a.DESCRICAO)+1 for 6) as integer) as pedido ' + ' FROM LOG a ' + ' inner join tbusu u on (u.CODUSU = a.COD_USUARIO_LOGADO) ' + ' where a.DESCRICAO like ''%FATURAMENTO AVULSO - PEDIDO N°:%'' ' + ') l ' + 'inner join vendas1 v1 on (v1.NUMDOC = l.pedido and v1.USUARIO_DESFATUROU is not null) ' + 'inner join cliente c on (c.cod_cliente = v1.cod_cliente) ' + 'left outer join tbusu ud on (ud.CODUSU = v1.USUARIO_DESFATUROU) ' + 'where 1 = 1';

  cmd := cmd + ' and l.data between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date));

  if zzfaturado.Checked then
    cmd := cmd + ' and v1.faturado=' + quotedstr('1') + ' and v1.orcamento=' + quotedstr('0')
  else if zznao_faturado.Checked then
    cmd := cmd + ' and v1.faturado=' + quotedstr('0') + ' and v1.orcamento=' + quotedstr('0')
  else if zzdesativados.Checked then
    cmd := cmd + ' and v1.faturado=' + quotedstr('4') + ' and v1.orcamento=' + quotedstr('0')
  else if zzfaturado_todos.Checked then
    cmd := cmd + ' and v1.faturado<>' + quotedstr('4') + ' and v1.orcamento=' + quotedstr('0')
  else if zzorcamento.Checked then
    cmd := cmd + ' and v1.faturado=' + quotedstr('0') + ' and v1.orcamento=' + quotedstr('1');

  if edCliente.Text <> '' then
    cmd := cmd + fmfun.cmdAux('v1.cod_cliente', edCliente.Text);

  cmd := cmd + ' ORDER BY PEDIDO, DATA, HORA';

  with dm.q_desfaturados do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_desfaturados.isempty then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\desfaturados.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.relatorio_posicao_estoque_ind(codgrupo, codfor: string);
var
  Excel: Variant;
  nom_arquivo: string;
  linha: Integer;
  cod_produto: string;
  ac_qtd: Real;
  cmd: string;
begin
  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\posicao_estoque_simplificado_ind.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;

  cmd := 'select pro.cod_produto, '+
         '  pro.nom_produto, '+
         '  pro.grade, '+
         '  pro.qtd_estoque_min, '+
         '  pro.qtd_estoque_max, '+
         '  pro.QTD_EMBALAGEM, '+
         '  pro.UNIDADE, '+
         '  coalesce(pro.qtd_estoque, 0) as qtd_estoque, '+
         '  pro.qtd_reservado, '+
         '  pro.cod_grupo, '+
         '  cr.cor, '+
         '  tm.tamanho, '+
         '  gd.est_individual, '+
         '  g.nom_grupo, '+
         '  pro.preco_venda, '+
         '  f.razao_social '+
         'from produto pro '+
         'left join grade gd on gd.cod_produto = pro.cod_produto '+
         'left join cores cr on cr.id = gd.id_cor '+
         'left join tamanho tm on tm.id = gd.id_tamanho '+
         'left join fornecedor f on f.cod_fornecedor = pro.fornecedor_principal '+
         'left join grupo g on g.cod_grupo = pro.cod_grupo ';

  cmd := cmd + 'where 1 = 1 ';

  if rbAtivo.Checked then
    cmd := cmd + ' and pro.status <> ''S''';

  if rbInativo.Checked then
    cmd := cmd + ' and pro.status = ''S''';

  if rbPromocao.Checked then
    cmd := cmd + ' and pro.promocao = ''S''';

  if rbIndisponivel.Checked then
    cmd := cmd + ' and pro.indisponivel = ''S''';

  if rbDisponivel.Checked then
    cmd := cmd + ' and pro.indisponivel = ''N''';

  if rbRevenda.Checked then
    cmd := cmd + ' and pro.revenda = ''S''';

  if rbOutros.Checked then
    cmd := cmd + ' and pro.revenda = ''N''';

  if edProduto.Text <> '' then
    cmd := cmd + fmfun.cmdAux('pro.cod_produto', edProduto.Text);


  if edFornecedor.Text <> '' then
    cmd := cmd + ' and (1=1 ' + fmfun.cmdAux('pro.fornecedor_principal', edFornecedor.Text) + ' or 0 < (SELECT count(*) FROM PRODUTO_FORNECEDOR pf where pf.cod_produto = pro.cod_produto ' + fmfun.cmdAux('pf.cod_fornecedor', edFornecedor.Text) + '))';

  if edGrupo.Text <> '' then
    cmd := cmd + fmfun.cmdAux('pro.cod_grupo', edGrupo.Text);

  if PrMostrarProdutosAbaixoEstoqueMinimo.Checked then
    cmd := cmd + ' and pro.QTD_ESTOQUE < pro.ESTOQUE_MINIMO ';

  if Alfabeticamente.Checked then
    cmd := cmd + ' order by pro.nom_produto';

  if OrdemInterna.Checked then
    cmd := cmd + ' order by pro.ord_pauta';

  if CodigoProduto.Checked then
    cmd := cmd + ' order by pro.cod_produto';

  with dm.q_posicao_estoque do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.relatorio_posicao_estoque_venda(codgrupo, codpro, codfor: string);
var
  cmd: string;
begin
  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\posicao_estoque_preco_venda.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;

  cmd := 'select pro.cod_produto, pro.nom_produto, pro.grade, pro.ESTOQUE_MINIMO,coalesce(pro.qtd_estoque, 0) as qtd_estoque, pro.qtd_reservado, pro.cod_grupo, cr.cor , tm.tamanho, gd.est_individual, g.nom_grupo, pro.preco_venda, f.razao_social from produto pro ' + 'left join grade gd on gd.cod_produto=pro.cod_produto ' + 'left join cores cr on cr.id=gd.id_cor ' + 'left join tamanho tm on tm.id=gd.id_tamanho ' + 'left join fornecedor f on f.cod_fornecedor = pro.fornecedor_principal ' + 'left join grupo g on g.cod_grupo = pro.cod_grupo where 1 = 1';

  if rbAtivo.Checked then
    cmd := cmd + ' and pro.status <> ''S''';

  if rbInativo.Checked then
    cmd := cmd + ' and pro.status = ''S''';

  if rbPromocao.Checked then
    cmd := cmd + ' and pro.promocao = ''S''';

  if rbIndisponivel.Checked then
    cmd := cmd + ' and pro.indisponivel = ''S''';

  if rbDisponivel.Checked then
    cmd := cmd + ' and pro.indisponivel = ''N''';

  if rbRevenda.Checked then
    cmd := cmd + ' and pro.revenda = ''S''';

  if rbOutros.Checked then
    cmd := cmd + ' and pro.revenda = ''N''';

  if edFornecedor.Text <> '' then
    cmd := cmd + '(1=1 and ' + fmfun.cmdAux('pro.fornecedor_principal', edFornecedor.Text) + ' or 0 < (SELECT count(*) FROM PRODUTO_FORNECEDOR pf where pf.cod_produto = pro.cod_produto ' + fmfun.cmdAux('pf.cod_fornecedor', edFornecedor.Text) + '))';

  if edGrupo.Text <> '' then
    cmd := cmd + fmfun.cmdAux('pro.cod_grupo', edGrupo.Text);

  if PrMostrarProdutosAbaixoEstoqueMinimo.Checked then
    cmd := ' and pro.QTD_ESTOQUE < pro.ESTOQUE_MINIMO ';

  cmd := cmd + ' order by f.razao_social, g.nom_grupo, pro.ORD_PAUTA';

  with dm.q_posicao_estoque do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.relatorio_posicao_estoque_venda_ind(codgrupo, codpro, codfor: string);
begin

end;

procedure TFr_opc_relatorios.relatorio_solicitacao_compra(codfor, codgru: string);
var
  cmd: string;
  Excel: Variant;
  i: Integer;
  qtd, ac_qtd, ac_totcusto: Real;
begin

  cmd := 'select cod_produto, nom_produto, qtd_estoque, qtd_reservado, p.cod_grupo, g.nom_grupo, fornecedor_principal, custo from produto p ' + 'left join grupo g on g.cod_grupo=p.cod_grupo ' + 'where 1 = 1 ';

  if rbAtivo.Checked then
    cmd := cmd + ' and p.status <> ''S''';

  if rbInativo.Checked then
    cmd := cmd + ' and p.status = ''S''';

  if rbPromocao.Checked then
    cmd := cmd + ' and p.promocao = ''S''';

  if rbIndisponivel.Checked then
    cmd := cmd + ' and pro.indisponivel = ''S''';

  if rbDisponivel.Checked then
    cmd := cmd + ' and pro.indisponivel = ''N''';

  if rbRevenda.Checked then
    cmd := cmd + ' and pro.revenda = ''S''';

  if rbOutros.Checked then
    cmd := cmd + ' and pro.revenda = ''N''';

  if codgru <> '' then
    cmd := cmd + ' and pro.cod_grupo =' + quotedstr(codgru);

  if edFornecedor.Text <> '' then
    cmd := cmd + '(1=1 and ' + fmfun.cmdAux('pro.fornecedor_principal', edFornecedor.Text) + ' or 0 < (SELECT count(*) FROM PRODUTO_FORNECEDOR pf where pf.cod_produto = pro.cod_produto ' + fmfun.cmdAux('pf.cod_fornecedor', edFornecedor.Text) + '))';

  dao.Geral1(cmd);

  // DeleteFile(ExtractFilePath(ParamStr(0)) + 'Temporario\ordem compra.xls');

  Excel := CreateOleObject('Excel.Application');
  Excel.WorkBooks.open(ExtractFilePath(ParamStr(0)) + 'Relatorios\ordem_compra.xls');
  // Excel.workbook

  Excel.Visible := false;

  Excel.WorkBooks[1].sheets[1].cells[2, 2] := dao.DtaSerStr + ' / ' + dao.HrSer;

  dao.Q1.first;
  // Excel.

  Excel.WorkBooks[1].sheets[1].cells[2, 4] := formatdatetime('dd/mm/yyyy', now);
  Excel.WorkBooks[1].sheets[1].cells[3, 4] := copy(dao.Q1.fieldbyname('nom_grupo').AsString, 1, 35);
  i := 13;
  while not (dao.Q1.Eof) do
  begin
    if dao.Q1.fieldbyname('qtd_estoque').AsFloat - dao.Q1.fieldbyname('qtd_reservado').AsFloat < 0 then
    begin
      Excel.WorkBooks[1].sheets[1].cells[i, 1] := dao.Q1.fieldbyname('cod_produto').AsString + '/ ' + copy(dao.Q1.fieldbyname('nom_produto').AsString, 1, 41);
      qtd := dao.Q1.fieldbyname('qtd_estoque').AsFloat - dao.Q1.fieldbyname('qtd_reservado').AsFloat;
      if qtd < 0 then
        qtd := qtd *  - 1;

      FRPRI.AlinhaCel(Excel, 1, 'B' + inttostr(i) + ':E' + inttostr(i), 2, 4);
      Excel.WorkBooks[1].sheets[1].cells[i, 2] := qtd;
      Excel.WorkBooks[1].sheets[1].cells[i, 3] := FormatFloat('###,##0.00', dao.Q1.fieldbyname('custo').AsFloat);
      Excel.WorkBooks[1].sheets[1].cells[i, 4] := FormatFloat('###,##0.00', dao.Q1.fieldbyname('custo').AsFloat * qtd);
      ac_qtd := ac_qtd + qtd;
      ac_totcusto := ac_totcusto + dao.Q1.fieldbyname('custo').AsFloat * qtd;
      i := i + 1;
    end;
    dao.Q1.Next;
  end;
  i := i + 1;
  FRPRI.AlinhaCel(Excel, 1, 'A' + inttostr(i) + ':E' + inttostr(i), 2, 4);
  Excel.WorkBooks[1].sheets[1].cells[i, 1] := 'TOTAL:';
  FRPRI.BordaCelGeral(Excel, 1, 'B' + inttostr(i) + ':B' + inttostr(i), 2);
  Excel.WorkBooks[1].sheets[1].cells[i, 2] := FormatFloat('###,##0.00', ac_qtd);
  FRPRI.BordaCelGeral(Excel, 1, 'D' + inttostr(i) + ':D' + inttostr(i), 2);
  Excel.WorkBooks[1].sheets[1].cells[i, 4] := FormatFloat('###,##0.00', ac_totcusto);

  // Excel.WorkBooks[1].SaveAs(ExtractFilePath(ParamStr(0)) + 'Temporario\ordem compra.xls');

  Excel.Visible := true;

end;

procedure TFr_opc_relatorios.relatorio_comissao_venda(codrep, dta_inicial, dta_final, faturado: string);
var
  cmd: string;
begin
  cmd := 'select numdoc, case when faturado = 0 then dtadoc else DTA_EMISSAO end as dtadoc, tot_liquido, valor_cr, vlr_comissao, nom_cliente, nom_representante, cpf, fone, celular, ' +
         'nr_conta_corrente, nr_agencia, nr_banco, titular_conta, supervisao, comissao, email, nom_banco, consumidor_final from v_comissao ' +
         'where 1 = 1 and faturado not in (2,4,5) ';

  if zzfaturado.Checked then
    cmd := cmd + ' and dta_emissao between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date))
  else if zznao_faturado.Checked then
    cmd := cmd + ' and dtadoc between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date))
  else
    cmd := cmd + ' and case when FATURADO = ''1'' then DTA_EMISSAO else dtadoc END between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date));

  if codrep <> '' then
    cmd := cmd + ' and codrep=' + quotedstr(codrep);

  if edcodsupervisor.Text <> '' then
    cmd := cmd + fmfun.cmdAux('cod_supervisor', edcodsupervisor.Text);

  if zzfaturado.Checked then
    cmd := cmd + ' and faturado=' + quotedstr('1') + ' and orcamento=' + quotedstr('0')
  else if zznao_faturado.Checked then
    cmd := cmd + ' and faturado=' + quotedstr('0') + ' and orcamento=' + quotedstr('0')
  else if zzdesativados.Checked then
    cmd := cmd + ' and faturado=' + quotedstr('4') + ' and orcamento=' + quotedstr('0')
  else if zzfaturado_todos.Checked then
    cmd := cmd + ' and faturado<>' + quotedstr('4') + ' and orcamento=' + quotedstr('0')
  else if zzorcamento.Checked then
    cmd := cmd + ' and faturado=' + quotedstr('0') + ' and orcamento=' + quotedstr('1');

  if rbApenasSupervisao.Checked then
    cmd := cmd + ' and SUPERVISAO = ''S''';

  if rbSemSupervisao.Checked then
    cmd := cmd + ' and SUPERVISAO = ''N''';

  if rbNaoConsumidorFinal.Checked then
    cmd := cmd + 'and coalesce(consumidor_final, ''N'') = ''N'' ';

  if rbApenasConsumidorFinal.Checked then
    cmd := cmd + 'and coalesce(consumidor_final, ''N'') = ''S'' ';

  if zzfaturado.Checked then
    cmd := cmd + ' order by NOM_REPRESENTANTE, DTA_EMISSAO, numdoc'
  else
    cmd := cmd + ' order by NOM_REPRESENTANTE, dtadoc, numdoc';

  with dm.q_comissao_venda do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;
  // dm.q_comissao_venda.sql.SaveToFile('C:\comissao_antiga.sql');

  if dm.q_comissao_venda.RecordCount < 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\relatorio_comissao_venda.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.relatorio_rankin_clientes;
var
  cmd, cmd_sup: string;
  clientes, data_str: string;
begin
  data_str := quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date));
  cmd_sup := '';
  if edcodsupervisor.Text <> '' then
    cmd_sup := fmfun.cmdAux('v.cod_supervisor', edcodsupervisor.Text);

  cmd := 'SELECT r.id, r.NOM_REPRESENTANTE, c.COD_CLIENTE, c.NOM_CLIENTE, c.CONTATO, c.TELEFONE, (select count(*) from vendas1 v where v.faturado = 1 and v.DTA_EMISSAO between ' + data_str + ' and v.COD_CLIENTE= c.COD_CLIENTE '+cmd_sup+') as qtd_vendas, ' +
    'coalesce((select sum(v.TOT_LIQUIDO) from vendas1 v where v.faturado = 1 and  v.DTA_EMISSAO between ' + data_str + ' and v.COD_CLIENTE= c.COD_CLIENTE '+cmd_sup+'),0) as tot_vendas, ' +
    '(select max(v.DTA_EMISSAO) from vendas1 v where v.faturado = 1 and v.DTA_EMISSAO between ' +
    data_str + ' and v.COD_CLIENTE= c.COD_CLIENTE '+cmd_sup+') as ult_venda, ' +
    'case when coalesce((select sum(v.TOT_LIQUIDO) from vendas1 v where v.faturado = 1 and v.DTA_EMISSAO between ' + data_str + ' and v.COD_CLIENTE= c.COD_CLIENTE '+cmd_sup+'),0) = 0 then 0 ' +
    'else coalesce((select sum(v.TOT_LIQUIDO) from vendas1 v where v.faturado = 1 and v.DTA_EMISSAO between ' + data_str + ' and v.COD_CLIENTE= c.COD_CLIENTE '+cmd_sup+'),0) / ' +
    '(select count(*) from vendas1 v where v.faturado = 1 and v.DTA_EMISSAO between ' + data_str +' and v.COD_CLIENTE= c.COD_CLIENTE '+cmd_sup+') end as media_vendas ' +
    'from cliente c inner join representante r on r.id = c.id_representante ' +
    'inner join cidades cd on cd.cod_cidade = c.cod_cidade where 1 = 1 '+
    ' and (select count(*) from vendas1 v where v.faturado = 1 and v.DTA_EMISSAO between ' + data_str + ' and v.COD_CLIENTE= c.COD_CLIENTE '+cmd_sup+') > 0 ';

  if edCodRepresentante.Text <> '' then
    cmd := cmd + fmfun.cmdAux('c.ID_REPRESENTANTE', edCodRepresentante.Text);

  if Pruf.Text <> '' then
    cmd := cmd + ' and cd.uf=' + quotedstr(Pruf.Text);

  if edCidade.Text <> '' then
    cmd := cmd + fmfun.cmdAux('c.cod_cidade', edCidade.Text);

  if edCliente.Text <> '' then
    cmd := cmd + fmfun.cmdAux('c.cod_cliente', edCliente.Text);

  if rbTotalVendas.Checked then
    cmd := cmd + ' order by tot_vendas desc, qtd_vendas desc';

  if rbMediaVendas.Checked then
    cmd := cmd + ' order by media_vendas desc';

  with dm.q_rankin_simplificado do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  {
  if dm.q_rankin_simplificado.RecordCount > 0 then
  begin
    dm.q_rankin_simplificado.first;
    while not (dm.q_rankin_simplificado.Eof) do
    begin
      if clientes = '' then
        clientes := ' and v2.cod_cliente=' + quotedstr(dm.q_rankin_simplificado.fieldbyname('cod_cliente').AsString)
      else

        clientes := clientes + ' or v2.cod_cliente= ' + quotedstr(dm.q_rankin_simplificado.fieldbyname('cod_cliente').AsString);
      dm.q_rankin_simplificado.Next;
    end;
  end;
    cmd := 'SELECT V2.COD_PRODUTO, v2.COD_CLIENTE, ID_COR, ID_TAMANHO, QTD, PRECO, SUB_TOTAL, p.nom_produto,p.preco_venda, c.cor, cl.telefone, cl.email, '
    +
    't.tamanho,cl.nom_cliente, v2.numdoc, v1.cod_fop, fp.nom_fop, v1.dtadoc, v1.desconto, v1.qtd_parcelas, v1.prazo_pgto, v1.tot_bruto, v2.preco_bruto, f.fantasia, p.fornecedor_principal, e.nom_empresa, ' +
    'v2.desconto as desconto_item, v1.tot_liquido, r.nom_representante, v1.credito_usado, m.nom_marca from vendas2 v2 ' +
    'left join vendas1 v1 on v1.numdoc = v2.numdoc ' +
    'left join fop fp on fp.cod_fop = v1.cod_fop ' +
    'LEFT JOIN PRODUTO P ON P.COD_PRODUTO = V2.COD_PRODUTO ' +
    'left join cores c on c.id = v2.id_cor ' +
    'left join tamanho t on t.id = v2.id_tamanho ' +
    'left join cliente cl on cl.cod_cliente=v2.cod_cliente ' +
    'left join representante r on r.id=v1.cod_representante ' +
    'left join marcas m on m.id=p.id_marca ' +
    'left join fornecedor f on f.cod_fornecedor=p.fornecedor_principal ' +
    'left join empresa e on e.cod_empresa = v1.empresa_faturar ' +
    'where 1 = 1 ' + clientes + ' and case when v1.FATURADO = ''1'' then v1.DTA_EMISSAO else v1.dtadoc END between ' +
    QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_inicial.Date)) + ' and ' +
    QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_final.Date)) +
    ' and v1.consignacao<>' + QuotedStr('1') + ' and v1.orcamento=' +
    QuotedStr('0') + ' and tipo_venda<>' + QuotedStr('D');
    cmd := cmd + ' order by v2.cod_cliente, v2.dtadoc ';

    with dm.q_vendas2 do
    begin
    close;
    sql.Clear;
    sql.add(cmd);
    open;
    end;

    if dm.q_vendas2.RecordCount < 0 then
    begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
    end;
  }
  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\ranking_cliente_simplificado.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.relatorio_comparativo_tablet;
var
  cmd: string;
begin
  cmd := 'SELECT distinct a.TIPO, a.NR_PEDIDO_PALM, a.NUMDOC, a.COD_REPRESENTANTE, a.DTADOC, a.HORA, a.COD_CLIENTE, a.FATURADO, ' +
         'a.COD_FOP, a.COD_PRAZO_PGTO, a.TOT_BRUTO, a.TOT_LIQUIDO, a.PALM_NR_CONEXAO, a.COD_PRODUTO, ' +
		 'a.PRECO_CUSTO, a.PRECO_BRUTO, A.PRECO, a.PROMOCAO, a.QTD, a.SUB_TOTAL, a.VOLUME, a.NOM_CLIENTE, a.NOM_PRODUTO, r.nom_representante, ' +
		 '(select b.OBSERVACOES_PEDIDO from v_VENDA_ORIGINAL b where b.NUMDOC = 0 and b.NR_PEDIDO_PALM = a.NR_PEDIDO_PALM limit 1) as OBSERVACOES_PEDIDO ' +
		 'FROM V_VENDA_ORIGINAL a inner join representante r on r.id = a.cod_representante where 1 = 1 ';

  cmd := cmd + ' and a.dtadoc between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date));

  if trim(edCliente.Text) <> '' then
    cmd := cmd + fmfun.cmdAux('a.cod_cliente', edCliente.Text);

  if edCodRepresentante.Text <> '' then
    cmd := cmd + fmfun.cmdAux('a.cod_representante', edCodRepresentante.Text);

  if trim(edPedido.Text) <> '' then
    cmd := cmd + fmfun.cmdAux('a.NUMDOC', edPedido.Text);

  if trim(edPedidoTablet.Text) <> '' then
    cmd := cmd + fmfun.cmdAux('a.NR_PEDIDO_PALM', edPedidoTablet.Text);

  cmd := cmd + 'order by NR_PEDIDO_PALM, cod_produto, tipo desc ';

  with dm.q_comparativo_tablet do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  { if dm.q_comparativo_tablet.RecordCount <= 0 then
    begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
    end; }

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\comparativo_tablet.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.relatorio_rankin_clientes_simplificado(dta_inicial: TDate; dta_final: TDate);
var
  cmd, cod_cidade: string;
begin
  cmd := 'select v1.cod_cliente, c.nom_cliente, sum(tot_liquido) as tot_liquido from vendas1 v1 ' +
         'left join cliente c on c.cod_cliente=v1.cod_cliente ' +
		 'inner join cidades cd on cd.cod_cidade = c.cod_cliente ' +
		 'where case when v1.FATURADO = ''1'' then v1.DTA_EMISSAO else v1.dtadoc END between ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_inicial.date)) + ' and ' + quotedstr(formatdatetime('dd.mm.yyyy', Prdta_final.date)) +
		 ' and v1.consignacao<>' + quotedstr('1') +
		 ' and v1.orcamento=' + quotedstr('0') +
		 ' and tipo_venda<>' + quotedstr('D');

  if PrConstrutora.Checked then
    cmd := cmd + ' and c.CONSTRUTORA = ''S''';

  if PrNaoConstrutoras.Checked then
    cmd := cmd + ' and c.CONSTRUTORA = ''N''';

  if rbbloqueado.Checked then
    cmd := cmd + ' and c.CLIENTE_BLOQUEADO = ''S''';

  if PrPessoaJuridica.Checked then
    cmd := cmd + ' and c.TIP_PESSOA = ''J''';

  if rbNaoBloqueado.Checked then
    cmd := cmd + ' and (c.CLIENTE_BLOQUEADO <> ''S'' OR C.CLIENTE_BLOQUEADO IS NULL)';

  if cod_cidade <> '' then
  begin
    cmd := cmd + fmfun.cmdAux('c.cod_cidade', cod_cidade);
  end;

  if PrClienteDataCadastro.date <> 0 then
    cmd := cmd + 'and c.DTA_CAD >= ' + quotedstr(formatdatetime('yyyy/mm/dd', PrClienteDataCadastro.date));

  if edMicroRegiao.Text <> '' then
    cmd := cmd + fmfun.cmdAux('mc.microcod', edMicroRegiao.Text);

  if edCliente.Text <> '' then
    cmd := cmd + fmfun.cmdAux('c.cod_cliente', edCliente.Text);

  if edMesoRegiao.Text <> '' then
    cmd := cmd + fmfun.cmdAux('ms.mesocod', edMesoRegiao.Text);

  if PrUltimaCompra.date <> 0 then
    cmd := cmd + ' and c.COD_CLIENTE in (select distinct v.cod_cliente from vendas1 v where v.COD_FISCAL not in (''6152'', ''6409'') and V.NFEENTRADASAIDA = ''0'' AND V.PROCESSO_ID NOT IN (SELECT PROCESSO_ID FROM VENDAS1 WHERE FATURADO <> 2 AND NFEENTRADASAIDA = ''1'') '+
                 ' AND v.nfe_dev is null and  v.faturado in (0, 1, 3) and v.DTADOC > ''' + formatdatetime('yyyy/mm/dd', PrUltimaCompra.date) + ''') ';

  if edCodRepresentante.Text <> '' then
    cmd := cmd + fmfun.cmdAux('c.ID_REPRESENTANTE', edCodRepresentante.Text);

  if Pruf.Text <> '' then
    cmd := cmd + ' and cd.uf=' + quotedstr(Pruf.Text);

  cmd := cmd + ' group by v1.cod_cliente, c.nom_cliente ' + ' order by 3 desc limit 100 ';

  with dm.q_rankin_simplificado do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_rankin_simplificado.RecordCount <= 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\ranking_cliente_simplificado.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.relatorio_auxiliar_compra(Modo: ShortString; tipofonte: TTipoFonte); // relatorio auxiliar de compra
var
  totpag, total, custo, actot: Real;
  cmd, gru_ant, for_ant: string;
  lh: Integer;
begin
  tipo_fonte := tipofonte;

  cmd := cmd + 'select p.cod_produto, cod_prateleira, nom_produto, unidade, qtd_estoque_min, qtd_estoque, qtd_reservado, status, p.cod_grupo, g.nom_grupo, fornecedor_principal, f.razao_social from produto p ' + 'left join fornecedor f on f.cod_fornecedor = p.fornecedor_principal ' + 'left join grupo g on g.cod_grupo = p.cod_grupo where 1 = 1 ';

  if rbAtivo.Checked then
    cmd := cmd + ' and p.status <> ''S''';

  if rbInativo.Checked then
    cmd := cmd + ' and p.status = ''S''';

  if rbPromocao.Checked then
    cmd := cmd + ' and p.promocao = ''S''';

  if rbIndisponivel.Checked then
    cmd := cmd + ' and p.indisponivel = ''S''';

  if rbDisponivel.Checked then
    cmd := cmd + ' and p.indisponivel = ''N''';

  if rbRevenda.Checked then
    cmd := cmd + ' and p.revenda = ''S''';

  if rbOutros.Checked then
    cmd := cmd + ' and p.revenda = ''N''';

  if edFornecedor.Text <> '' then
    cmd := cmd + ' and ( 1 = 1 ' + fmfun.cmdAux('p.fornecedor_principal', edFornecedor.Text) + ' or 0 < (SELECT count(*) FROM PRODUTO_FORNECEDOR pf where pf.cod_produto = p.cod_produto ' + fmfun.cmdAux('pf.cod_fornecedor', edFornecedor.Text) + '))';

  if edGrupo.Text <> '' then
    cmd := cmd + fmfun.cmdAux('p.cod_grupo', edGrupo.Text);

  cmd := cmd + ' order by f.razao_social, g.nom_grupo, nom_produto';
  dao.Geral1(cmd);
  dao.Q1.first;
  for_ant := dao.Q1.fieldbyname('fornecedor_principal').AsString;
  gru_ant := dao.Q1.fieldbyname('cod_grupo').AsString;
  lh := 5;
  configuraRD(S17cpp, Epson, 140, 70, Seis, false, true);

  RD.abrir; // Inicia a montagem do relatório...
  lh := 10;
  RD.impf(08, 01, 'FORNECEDOR :' + dao.Q1.fieldbyname('razao_social').AsString, [tipo_fonte, negrito]);
  RD.impf(09, 05, 'GRUPO :' + dao.Q1.fieldbyname('nom_grupo').AsString, [tipo_fonte, negrito]);

  while not (dao.Q1.Eof) do // Enquanto não for o fim
  begin // do arquivo...
    if lh >= 60 then
    begin
      RD.novapagina;
      lh := 8;
    end;

    if for_ant <> dao.Q1.fieldbyname('fornecedor_principal').AsString then
    begin
      RD.impf(lh, 01, 'FORNECEDOR :' + dao.Q1.fieldbyname('razao_social').AsString, [tipo_fonte, negrito]);
      for_ant := dao.Q1.fieldbyname('fornecedor_principal').AsString;
      lh := lh + 2;
    end;

    if gru_ant <> dao.Q1.fieldbyname('cod_grupo').AsString then
    begin
      RD.impf(lh, 05, 'GRUPO :' + dao.Q1.fieldbyname('nom_grupo').AsString, [tipo_fonte, negrito]);
      gru_ant := dao.Q1.fieldbyname('cod_grupo').AsString;
      lh := lh + 1;
    end;
    // 2   14       22                                       63             77                94                 112          122

    RD.impf(lh, 02, dao.Q1.fieldbyname('cod_produto').AsString, [tipo_fonte]);
    RD.impf(lh, 17, dao.Q1.fieldbyname('cod_prateleira').AsString, [tipo_fonte]);
    RD.impf(lh, 23, copy(dao.Q1.fieldbyname('nom_produto').AsString, 1, 40), [tipo_fonte]);
    RD.impf(lh, 66, dao.Q1.fieldbyname('unidade').AsString, [tipo_fonte]);
    RD.impD(lh, 76, FormatFloat('###,##0.00', dao.Q1.fieldbyname('QTD_ESTOQUE').AsFloat), [tipo_fonte]);
    RD.impD(lh, 86, FormatFloat('###,##0.00', dao.Q1.fieldbyname('QTD_RESERVADo').AsFloat), [tipo_fonte]);
    RD.impD(lh, 96, FormatFloat('###,##0.00', dao.Q1.fieldbyname('QTD_ESTOQUE').AsFloat - dao.Q1.fieldbyname('QTD_RESERVADO').AsFloat), [tipo_fonte]);

    dao.Geral2('select e2.qtd_entrada, e2.custo, e1.dta_documento from entrada2 e2 ' +
	           'left join entrada1 e1 on e1.nr_documento=e2.nr_documento and e1.cod_fornecedor=e2.cod_fornecedor ' +
			   'where e2.cod_produto = ' + quotedstr(dao.Q1.fieldbyname('cod_produto').AsString) +
			   ' order by e1.dta_documento desc limit 1 ');

    RD.impD(lh, 106, FormatFloat('###,##0.00', dao.q2.fieldbyname('qtd_entrada').AsFloat), [tipo_fonte]);
    RD.impD(lh, 116, FormatFloat('###,##0.00', dao.q2.fieldbyname('custo').AsFloat), [tipo_fonte]);
    if (dao.q2.fieldbyname('dta_documento').AsString <> '') then
      RD.impf(lh, 126, formatdatetime('dd/mm/yyyy', dao.q2.fieldbyname('dta_documento').AsDateTime), [tipo_fonte]);

    dao.Q1.Next;
    lh := lh + 1;

  end;
  RD.fechar; // Encerra o relatório...

end;

procedure TFr_opc_relatorios.configuraRD(fonteTamanho: TSize; tipoImpressora: TModelo; qtdcoluna, qtdlinha: Integer; qtdLpp: TLinha; testaporta, usaGerenciador: boolean);
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

procedure TFr_opc_relatorios.RDNewPage(Sender: TObject; Pagina: Integer);
begin
  if tipo_relatorio = 'relatorio_auxiliar_compra' then
  begin
    RD.impf(02, 118, 'Pág: ' + FormatFloat('000', Pagina), [normal]);
    if tipo_fonte = comp17 then
      RD.impf(03, 002, '=======================================================================================================================================', [tipo_fonte]);

    RD.impc(04, 050, '****   ' + nom_empresa + '   ****', [negrito]);
    RD.impc(05, 050, 'RELATÓRIO AUXILIAR DE COMPRA', [tipo_fonte, negrito]);

    if tipo_fonte = comp17 then
      RD.impf(06, 002, '=======================================================================================================================================', [tipo_fonte]);

    RD.impf(07, 002, 'Codigo       Pratel.             Produto                      Unid.  Disp      Res     Total     qtd Ent     Custo        Data_Ult ', [tipo_fonte]);
    // 2            14       22                                       63             77                94                 112          122
  end

end;

procedure TFr_opc_relatorios.relatorio_aniversariantes(data_inicial, data_final: string);
var
  cmd: string;
begin
  if Prdta_inicial_aniver.Text = '' then
  begin
    dao.msg('Você deve digitar um mês para pesquisar');
    exit;
  end;
  cmd := 'select dta_aniversario ,cod_cliente, nom_cliente, telefone, email from cliente ' + 'where substring(dta_aniversario from 4 for 5) between ' + quotedstr(data_inicial) + ' and ' + quotedstr(data_final);

  with dm.q_niver do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;
  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\aniversariantes.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_opc_relatorios.Prdta_inicial_aniverExit(Sender: TObject);
begin
  Prdta_inicial_aniver.Text := fmfun.enchezero(Prdta_inicial_aniver.Text, 2);
end;

procedure TFr_opc_relatorios.Prdta_final_aniverExit(Sender: TObject);
begin
  Prdta_inicial_aniver.Text := fmfun.enchezero(Prdta_inicial_aniver.Text, 2);

end;

procedure TFr_opc_relatorios.sbProdutoClick(Sender: TObject);
begin
  edProduto.clear;
end;

procedure TFr_opc_relatorios.sbCidadeClick(Sender: TObject);
begin
  edCidade.clear;
end;

procedure TFr_opc_relatorios.monta_rel_transportadora;
var
  cmd: string;
begin
  cmd := 'select a.COD_TRANSPORTADORA, a.NOME, a.ENDERECO, a.BAIRRO, a.CEP, a.CNPJ, a.IE, ' + 'a.COD_CIDADE, a.FONE, a.MOTORISTA, a.PLACA, a.FRETE_FIXO, a.PERCENTUAL_FRETE, a.OBS, ' + 'c.NOM_CIDADE, c.UF from transportadora a inner join cidades c on (c.cod_cidade = a.cod_cidade) where 1 = 1 ';

  if edTransportadora.Text <> '' then
    cmd := cmd + fmfun.cmdAux('a.cod_transportadora', edTransportadora.Text);

  with dm.q_transportadoras do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_transportadoras.RecordCount <= 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\transportadora_completo.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;
end;

procedure TFr_opc_relatorios.monta_rel_representante;
var
  cmd: string;
begin
  cmd := 'select a.ID, a.NOM_REPRESENTANTE, a.NOM_EMPRESA, a.ENDERECO, a.BAIRRO, a.CEP, ' + 'a.ID_CIDADE, a.CPF, a.RG, a.CNPJ, a.IE, a.FONE, a.FAX, a.CELULAR, a.NR_CONTA_CORRENTE, ' + 'a.NR_AGENCIA, a.NR_BANCO, a.EMAIL, a.HOME_PAGE, a.PERC_COMISSAO_FIXA, ' + 'a.ATIVO, a.FUNCIONARIO, a.WEB_NOME, a.UF_ATUACAO, a.WEB_CIDADES_ATUACAO, a.SINCRONIZAR_PALM, ' + 'a.SALARIO, a.PLR, a.PLR_FABRICA, a.SUPERVISOR, a.OBS, a.TITULAR_CONTA, ' + 'c.NOM_CIDADE, c.UF from REPRESENTANTE a inner join cidades c on (c.cod_cidade = a.ID_CIDADE) where a.FUNCIONARIO <> ''2'' ';

  if Prcod_representante.Text <> '' then
    cmd := cmd + 'where a.ativo = ''S'' and a.id = ' + Prcod_representante.Text;

  with dm.q_representante do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_representante.RecordCount <= 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\representantes.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;
end;

procedure TFr_opc_relatorios.monta_rel_lista_func_cc;
var
  cmd: string;
begin
  cmd := 'SELECT a.ID, a.NOM_REPRESENTANTE, a.email, a.fone, a.NR_CONTA_CORRENTE, a.NR_AGENCIA, b.NOM_BANCO, a.TITULAR_CONTA, a.UF_ATUACAO FROM REPRESENTANTE a LEFT OUTER join banco b on (b.ID = cast(a.NR_BANCO as INTEGER)) where a.ATIVO = ''S''';

  if edCodRepresentante.Text <> '' then
    cmd := cmd + fmfun.cmdAux('a.id', edCodRepresentante.Text);

  if rgTipoRep.ItemIndex = 0 then
    cmd := cmd + ' and a.FUNCIONARIO = ''2''';

  if rgTipoRep.ItemIndex = 1 then
    cmd := cmd + ' and a.FUNCIONARIO IN (''0'',''1'')';

  cmd := cmd + ' ORDER BY a.uf_atuacao, A.NOM_REPRESENTANTE ';

  with dm.q_lista_func_cc do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if dm.q_lista_func_cc.RecordCount <= 0 then
  begin
    dao.msg('Não foi encontrado registro neste periodo!');
    exit;
  end;

  if not (fR_RELATORIO.LoadFromFile(path + 'Relatorios\lista_representantes_funcionarios_cc.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  fR_RELATORIO.ShowReport;
end;

procedure TFr_opc_relatorios.sbGrupoClick(Sender: TObject);
begin
  edGrupo.clear;
end;

procedure TFr_opc_relatorios.sbContaCorrenteClick(Sender: TObject);
begin
  edContaCorrente.clear;
end;

procedure TFr_opc_relatorios.prContaCorrenteButtonClick(Sender: TObject);
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
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Conta corrente';
  chamou_pesquisa := 'fr_conta_corrente';
  chamou_form := 'fr_relatorio_cc';
  chamou_cadastro := 'Fr_conta_corrente';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Conta corrente';
  Fr_localizar.BT_cadastro.Visible := false;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 6);
  Campos_combo[0] := 'Código';
  Campos_combo[1] := 'Banco';
  Campos_combo[2] := 'Nome da Conta';
  Campos_combo[3] := 'Numero da Agencia';
  Campos_combo[4] := 'Numero da Conta';
  Campos_combo[5] := 'Data da abertura da conta';

  for i := 0 to 5 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  prContaCorrente.SetFocus;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
end;

procedure TFr_opc_relatorios.prContaCorrenteExit(Sender: TObject);
begin
  if trim(prContaCorrente.Text) = '' then
    lbContaCorrente.Caption := '...';

  if prContaCorrente.Text <> '' then
  begin

    if (not fmfun.verificaNumerico(prContaCorrente.Text)) and (length(prContaCorrente.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      prContaCorrente.SetFocus;
      exit;
    end;

    dao.Geral2('SELECT a.NOM_CONTA FROM CONTA_CORRENTE a where id = ' + quotedstr(prContaCorrente.Text));
    if dao.q2.RecordCount > 0 then
    begin
      lbContaCorrente.Caption := dao.q2.fieldbyname('NOM_CONTA').AsString;

      if edContaCorrente.Text = '' then
        edContaCorrente.Text := prContaCorrente.Text
      else
        edContaCorrente.Text := edContaCorrente.Text + ';' + prContaCorrente.Text;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      prContaCorrente.Text := '';
      prContaCorrente.SetFocus;
      exit;
    end;
  end;
end;

procedure TFr_opc_relatorios.Prid_plano_contasButtonClick(Sender: TObject);
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
  chamou_form := 'fr_rel_plano_conta';
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
    Fr_localizar.CBcampos.Items.add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  Prid_plano_contas.SetFocus;

  if edPlanoContas.Text = '' then
  begin
    edPlanoContas.Text := edPlanoContas.Text + ';' + Prid_plano_contas.Text;
    if pos(';', edPlanoContas.Text) = 1 then
      edPlanoContas.Text := copy(edPlanoContas.Text, 2, length(edPlanoContas.Text));
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
end;

procedure TFr_opc_relatorios.Prid_plano_contasExit(Sender: TObject);
var
  sqlplano: string;
begin
  if trim(Prid_plano_contas.Text) = '' then
  begin
    Lbnom_plano_contas_N1.Caption := '...';
    Lbnom_plano_contas_N2.Caption := '...';
    Lbnom_plano_contas_N3.Caption := '...';
    Lbnom_plano_contas_N4.Caption := '...';
  end;

  if (Prid_plano_contas.Text <> '') then
  begin
    sqlplano := 'SELECT ' + '  PC4.ID, ' + '  PC4.NR_CONTA, ' + '  TRIM(PC1.NR_CONTA)||''-''||PC1.DESCRICAO DESCRICAO1, ' + '  TRIM(PC2.NR_CONTA)||''-''||PC2.DESCRICAO DESCRICAO2, ' + '  TRIM(PC3.NR_CONTA)||''-''||PC3.DESCRICAO DESCRICAO3, ' + '  TRIM(PC4.NR_CONTA)||''-''||PC4.DESCRICAO DESCRICAO4 ' + 'FROM ' + '  PLANO_CONTAS PC4 ' + 'INNER JOIN PLANO_CONTAS PC3 ON (PC3.ID = PC4.ID_PAI) ' + 'INNER JOIN PLANO_CONTAS PC2 ON (PC2.ID = PC3.ID_PAI) ' + 'INNER JOIN PLANO_CONTAS PC1 ON (PC1.ID = PC2.ID_PAI) ' + 'WHERE (PC3.ID IN (''119'')  OR PC3.ID IN (''120'')  OR PC3.ID IN (''30'') OR PC3.ID IN (''36'') OR PC3.ID IN (''40'') OR PC1.ID IN(''58'')) AND PC4.ID = ' + quotedstr(Prid_plano_contas.Text);

    dao.Geral2(sqlplano);
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_plano_contas_N1.Caption := dao.q2.fieldbyname('descricao1').AsString;
      Lbnom_plano_contas_N2.Caption := dao.q2.fieldbyname('descricao2').AsString;
      Lbnom_plano_contas_N3.Caption := dao.q2.fieldbyname('descricao3').AsString;
      Lbnom_plano_contas_N4.Caption := dao.q2.fieldbyname('descricao4').AsString;
      if edPlanoContas.Text = '' then
        edPlanoContas.Text := Prid_plano_contas.Text
      else
        edPlanoContas.Text := Prid_plano_contas.Text + ';' + edPlanoContas.Text;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prid_plano_contas.Text := '';
      Prid_plano_contas.SetFocus;
      exit;
    end;

  end;

end;

procedure TFr_opc_relatorios.sbPlanoContaClick(Sender: TObject);
begin
  edPlanoContas.clear;
end;

procedure TFr_opc_relatorios.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TFr_opc_relatorios.sbDescClick(Sender: TObject);
begin
  edDesc.clear;
end;

procedure TFr_opc_relatorios.sbFornecedorClick(Sender: TObject);
begin
  edFornecedor.clear;
end;

procedure TFr_opc_relatorios.sbTranspClick(Sender: TObject);
begin
  edTransportadora.clear;
end;

procedure TFr_opc_relatorios.sbUFDestinoClick(Sender: TObject);
begin
  edUFDestino.Clear;
end;

procedure TFr_opc_relatorios.sbMicroRegiaoClick(Sender: TObject);
begin
  edMicroRegiao.clear;
end;

procedure TFr_opc_relatorios.sbMesoRegiaoClick(Sender: TObject);
begin
  edMesoRegiao.clear;
end;

procedure TFr_opc_relatorios.Prcod_mesoregiaoButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Mesoregião';

  chamou_pesquisa := 'fr_mesoregiao';
  chamou_form := 'fr_opc_relatorio_mesoregiao';
  chamou_cadastro := '';

  // Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cidades';
  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'UF';

  for i := 0 to 2 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.add(valor_combo);
  end;

  Fr_localizar.CBcampos.ItemIndex := 1;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  Prcod_mesoregiao.SetFocus;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

  if edMesoRegiao.Text = '' then
  begin
    edMesoRegiao.Text := edMesoRegiao.Text + ';' + Prcod_mesoregiao.Text;
    if pos(';', edMesoRegiao.Text) = 1 then
      edMesoRegiao.Text := copy(edMesoRegiao.Text, 2, length(edMesoRegiao.Text));
  end;
end;

procedure TFr_opc_relatorios.Prcod_mesoregiaoExit(Sender: TObject);
begin
  if trim(Prcod_mesoregiao.Text) = '' then
    lbNome_Mesoregiao.Caption := '...'
  else
  begin

    if (not fmfun.verificaNumerico(Prcod_mesoregiao.Text)) and (length(Prcod_mesoregiao.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      Prcod_mesoregiao.SetFocus;
      exit;
    end;

    dao.Geral2('select MESONOME from CADMESO where MESOCOD =' + quotedstr(Prcod_mesoregiao.Text));

    if dao.q2.RecordCount > 0 then
    begin
      lbNomeMicroRegiao.Caption := dao.q2.fieldbyname('MESONOME').AsString;
      if edMesoRegiao.Text = '' then
        edMesoRegiao.Text := Prcod_mesoregiao.Text
      else
        edMesoRegiao.Text := edMesoRegiao.Text + ';' + Prcod_mesoregiao.Text;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_mesoregiao.Text := '';
      Prcod_mesoregiao.SetFocus;
      exit;
    end;

  end;
end;

procedure TFr_opc_relatorios.Prcod_mesoregiaoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;
end;

procedure TFr_opc_relatorios.Prcod_microregiaoButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Microregião';

  chamou_pesquisa := 'fr_microregiao';
  chamou_form := 'fr_opc_relatorio_microregiao';
  chamou_cadastro := '';

  // Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cidades';
  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 4);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'Mesoregião';
  Campos_combo[3] := 'UF';

  for i := 0 to 3 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.add(valor_combo);
  end;

  Fr_localizar.CBcampos.ItemIndex := 1;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  Prcod_microregiao.SetFocus;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

  if edMicroRegiao.Text = '' then
  begin
    edMicroRegiao.Text := edMicroRegiao.Text + ';' + Prcod_microregiao.Text;
    if pos(';', edMicroRegiao.Text) = 1 then
      edMicroRegiao.Text := copy(edMicroRegiao.Text, 2, length(edMicroRegiao.Text));
  end;

end;

procedure TFr_opc_relatorios.sbClienteClick(Sender: TObject);
begin
  edCliente.clear;
end;

procedure TFr_opc_relatorios.PrCategoriaExit(Sender: TObject);
begin
  if trim(PrCategoria.Text) = '' then
    lbCategoria.Caption := '...';

  if PrCategoria.Text <> '' then
  begin
    dao.Geral2('select categoria from categoria where id =' + quotedstr(PrCategoria.Text));
    if dao.q2.RecordCount > 0 then
    begin
      lbCategoria.Caption := dao.q2.fieldbyname('categoria').AsString;
      if edCategoria.Text = '' then
        edCategoria.Text := PrCategoria.Text;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      PrCategoria.Text := '';
      PrCategoria.SetFocus;
      exit;
    end;
  end;
end;

procedure TFr_opc_relatorios.PrCategoriaButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  chamou_form_old, chamou_pesquisa_old: string;
begin
  if (PrCategoria.Text = '') then
  begin
    // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa

    Application.CreateForm(TFr_localizar, Fr_localizar);

    // guardar os valores antigos
    chamou_form_old := chamou_form;
    chamou_pesquisa_old := chamou_pesquisa;

    Fr_localizar.Caption := 'Localizar Categoria';

    chamou_pesquisa := 'fr_categoria';
    chamou_form := 'fr_opc_relatorio_categoria';
    chamou_cadastro := 'fr_categoria';

    Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Categorias';

    // preenchendo o combo box com os campos desejados para pesquisar.
    SetLength(Campos_combo, 3);
    Campos_combo[0] := 'Codigo';
    Campos_combo[1] := 'Nome';

    for i := 0 to 1 do
    begin
      valor_combo := Campos_combo[i];
      Fr_localizar.CBcampos.Items.add(valor_combo);
    end;

    Fr_localizar.CBcampos.ItemIndex := 1;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

    PrCategoria.SetFocus;

    chamou_form := chamou_form_old;
    chamou_pesquisa := chamou_pesquisa_old;

  end;
end;

procedure TFr_opc_relatorios.PrCategoriaKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) and (Key <> #13) then
  begin
    beep; { somente delphi 2.0 ou > }
    Key := #0;
  end;

  if Key = #13 then
    PrCategoriaExit(Self);
end;

procedure TFr_opc_relatorios.prSubCategoriaButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  chamou_form_old, chamou_pesquisa_old: string;
begin
  if (Prcod_grupo.Text = '') then
  begin
    // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa

    Application.CreateForm(TFr_localizar, Fr_localizar);

    // guardar os valores antigos
    chamou_form_old := chamou_form;
    chamou_pesquisa_old := chamou_pesquisa;

    Fr_localizar.Caption := 'Localizar SubCategoria';

    chamou_pesquisa := 'fr_subcategoria';
    chamou_form := 'fr_opc_relatorio_subcategoria';
    chamou_cadastro := 'fr_subcategoria';

    Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'SubCategorias';

    // preenchendo o combo box com os campos desejados para pesquisar.
    SetLength(Campos_combo, 3);
    Campos_combo[0] := 'Codigo';
    Campos_combo[1] := 'Nome';

    for i := 0 to 1 do
    begin
      valor_combo := Campos_combo[i];
      Fr_localizar.CBcampos.Items.add(valor_combo);
    end;

    Fr_localizar.CBcampos.ItemIndex := 1;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

    prSubCategoria.SetFocus;

    chamou_form := chamou_form_old;
    chamou_pesquisa := chamou_pesquisa_old;

  end;
end;

procedure TFr_opc_relatorios.prSubCategoriaKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) and (Key <> #13) then
  begin
    beep; { somente delphi 2.0 ou > }
    Key := #0;
  end;

  if Key = #13 then
    prSubCategoriaExit(Self);

end;

procedure TFr_opc_relatorios.prSubCategoriaExit(Sender: TObject);
begin
  if trim(prSubCategoria.Text) = '' then
    lbSubCategoria.Caption := '...';

  if prSubCategoria.Text <> '' then
  begin
    dao.Geral2('select subcategoria from subcategoria where id =' + quotedstr(prSubCategoria.Text));
    if dao.q2.RecordCount > 0 then
    begin
      lbSubCategoria.Caption := dao.q2.fieldbyname('subcategoria').AsString;
      if edSubCategoria.Text = '' then
        edSubCategoria.Text := prSubCategoria.Text
      else
        edSubCategoria.Text := prSubCategoria.Text + ';' + edSubCategoria.Text;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      prSubCategoria.Text := '';
      prSubCategoria.SetFocus;
      exit;
    end;
  end;

end;

procedure TFr_opc_relatorios.sbCategoriaClick(Sender: TObject);
begin
  edCategoria.clear;
end;

procedure TFr_opc_relatorios.sbSubCategoriaClick(Sender: TObject);
begin
  edSubCategoria.clear;
end;

procedure TFr_opc_relatorios.sbLimpaFopClick(Sender: TObject);
begin
  edfop.clear;
end;

procedure TFr_opc_relatorios.edContaCorrenteChange(Sender: TObject);
begin
  fmfun.LimpaLetrasConsulta(edContaCorrente);
end;

procedure TFr_opc_relatorios.edfopChange(Sender: TObject);
begin
  fmfun.LimpaLetrasConsulta(edfop);
end;

procedure TFr_opc_relatorios.edClienteChange(Sender: TObject);
begin
  fmfun.LimpaLetrasConsulta(edCliente);
end;

procedure TFr_opc_relatorios.edProdutoChange(Sender: TObject);
begin
  fmfun.LimpaLetrasConsulta(edProduto);
end;

procedure TFr_opc_relatorios.edFornecedorChange(Sender: TObject);
begin
  fmfun.LimpaLetrasConsulta(edFornecedor);
end;

procedure TFr_opc_relatorios.edCidadeChange(Sender: TObject);
begin
  fmfun.LimpaLetrasConsulta(edCidade);
end;

procedure TFr_opc_relatorios.edMesoRegiaoChange(Sender: TObject);
begin
  fmfun.LimpaLetrasConsulta(edMesoRegiao);
end;

procedure TFr_opc_relatorios.Prcod_microregiaoExit(Sender: TObject);
begin
  if trim(Prcod_microregiao.Text) = '' then
    lbNomeMicroRegiao.Caption := '...'
  else
  begin

    if (not fmfun.verificaNumerico(Prcod_microregiao.Text)) and (length(Prcod_microregiao.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      Prcod_microregiao.SetFocus;
      exit;
    end;

    dao.Geral2('select MICRONOME from cadmicro where MICROCOD =' + quotedstr(Prcod_microregiao.Text));

    if dao.q2.RecordCount > 0 then
    begin
      lbNomeMicroRegiao.Caption := dao.q2.fieldbyname('MICRONOME').AsString;
      if edMicroRegiao.Text = '' then
        edMicroRegiao.Text := Prcod_microregiao.Text
      else
        edMicroRegiao.Text := edMicroRegiao.Text + ';' + Prcod_microregiao.Text;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_microregiao.Text := '';
      Prcod_microregiao.SetFocus;
      exit;
    end;

  end;

end;

procedure TFr_opc_relatorios.edMicroRegiaoChange(Sender: TObject);
begin
  fmfun.LimpaLetrasConsulta(edMicroRegiao);
end;

procedure TFr_opc_relatorios.Prcod_cidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) and (Key <> #13) then
  begin
    beep; { somente delphi 2.0 ou > }
    Key := #0;
  end;
end;

procedure TFr_opc_relatorios.prContaCorrenteKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) and (Key <> #13) then
  begin
    beep; { somente delphi 2.0 ou > }
    Key := #0;
  end;
end;

procedure TFr_opc_relatorios.Prcod_microregiaoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) and (Key <> #13) then
  begin
    beep; { somente delphi 2.0 ou > }
    Key := #0;
  end;
end;

procedure TFr_opc_relatorios.prcod_supervisorExit(Sender: TObject);
begin
  if trim(prcod_supervisor.Text) = '' then
    lbsupervisor.Caption := '...';

  if prcod_supervisor.Text <> '' then
  begin
    if (not fmfun.verificaNumerico(prcod_supervisor.Text)) and (length(prcod_supervisor.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      prcod_supervisor.SetFocus;
      exit;
    end;

    dao.Geral2('select nom_representante from representante where  funcionario in (''0'', ''1'', ''4'') and id=' + quotedstr(prcod_supervisor.Text));
    if dao.q2.RecordCount > 0 then
    begin
      lbsupervisor.Caption := dao.q2.fieldbyname('nom_representante').AsString;
      if edcodsupervisor.Text = '' then
        edcodsupervisor.Text := prcod_supervisor.Text
      else
        edcodsupervisor.Text := prcod_supervisor.Text + ';' + edcodsupervisor.Text;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      prcod_supervisor.Text := '';
      prcod_supervisor.SetFocus;
      exit;
    end;
  end;

end;

procedure TFr_opc_relatorios.prcod_supervisorButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Supervisor';
  chamou_pesquisa := 'fr_representante';
  chamou_form := 'fr_opc_relatorio_supervisor';
  chamou_cadastro := 'Fr_representante';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Representante';

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
    Fr_localizar.CBcampos.Items.add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  prcod_supervisor.SetFocus;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_opc_relatorios.rbApenasSupervisaoClick(Sender: TObject);
begin
  if telemarketing then
  begin
    Prcod_representante.clear;
    Prcod_representanteExit(Self);
    prcod_supervisor.Text := Representante_usuario;
    edcodsupervisor.Text := Representante_usuario;
    prcod_supervisorExit(Self);
    vendedor.Enabled := true;
  end;

end;

procedure TFr_opc_relatorios.rbSemSupervisaoClick(Sender: TObject);
begin
  if telemarketing then
  begin
    Prcod_representante.Text := Representante_usuario;
    Prcod_representanteExit(Self);
    vendedor.Enabled := false;
    prcod_supervisor.clear;
    prcod_supervisorExit(Self);
  end;
end;

procedure TFr_opc_relatorios.rbComSupervisaoClick(Sender: TObject);
begin
  if telemarketing then
  begin
    Prcod_representante.clear;
    Prcod_representanteExit(Self);
    vendedor.Enabled := true;
    prcod_supervisor.Text := Representante_usuario;
    edcodsupervisor.Text := Representante_usuario;
    prcod_supervisorExit(Self);
  end;
end;

procedure TFr_opc_relatorios.edCodRepresentanteChange(Sender: TObject);
begin
  fmfun.LimpaLetrasConsulta(edCodRepresentante);
end;

procedure TFr_opc_relatorios.sbLimpaRepClick(Sender: TObject);
begin
  edCodRepresentante.clear;
end;

procedure TFr_opc_relatorios.edcodsupervisorChange(Sender: TObject);
begin
  fmfun.LimpaLetrasConsulta(edcodsupervisor);
end;

procedure TFr_opc_relatorios.sbLimpaSupClick(Sender: TObject);
begin
  edcodsupervisor.clear;
end;

procedure TFr_opc_relatorios.sbMarcaClick(Sender: TObject);
begin
  ed_marca.clear;
end;

end.

