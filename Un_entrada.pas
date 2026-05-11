unit Un_entrada;

{ ********

  -DICA-  FAZER A DEVOLUÇÃO DE MERCADORIA DO CLIENTE PARA LOJA DIRETO NO MODULO DE VENDAS PARA
  FACILITAR COLOCAR A FATURA QUE O CLIENTE FICARA DEVENDO NO CONTAS A RECEBER.

}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids,  Buttons, StdCtrls, Mask,
  ComCtrls, Menus,  shellApi,
  BaseGrid, AdvGrid, ExtCtrls, comObj, jpeg, RDprint, xmldom,
  XMLIntf, msxmldom, XMLDoc, DBGrids, RXDBCtrl, DB, RxMemDS, DBCtrls,
  {oxmldom,} sPageControl, sSpeedButton, sPanel, sBitBtn, sLabel, sCheckBox,
  sGroupBox, sTooledit, sMaskEdit, sCustomComboEdit, sCurrEdit,
  sCurrencyEdit, sEdit, sComboEdit, acDBGrid, sDialogs,
    AdvObj, RxToolEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFr_entrada = class(TForm)
    MainMenu1: TMainMenu;
    ReabrirNota1: TMenuItem;
    PcEntrada: TsPageControl;
    TabSheet1: TsTabSheet;
    TabSheet2: TsTabSheet;
    GroupBox1: TsGroupBox;
    GroupBox2: TsGroupBox;
    Lbnom_cod_fiscal: tsLabel;
    Prcod_fiscal: TsComboEdit;
    Gbcp1: TsGroupBox;
    Label8: tsLabel;
    Label9: tsLabel;
    Lbnom_fop: tsLabel;
    PrQtd_parcelas: TsCurrencyEdit;
    Prcod_fop: TsComboEdit;
    GroupBox4: TsGroupBox;
    Label12: tsLabel;
    Label13: tsLabel;
    Label14: tsLabel;
    Probs_nota1: TsEdit;
    Probs_nota2: TsEdit;
    Probs_nota3: TsEdit;
    GbProduto: TsGroupBox;
    GroupBox6: TsGroupBox;
    Label15: tsLabel;
    Emcod_produto: TRxDBComboEdit;
    Lbnom_produto: tsLabel;
    Emqtd_entrada: TDBEdit;
    Label17: tsLabel;
    Emcusto: TDBEdit;
    Label18: tsLabel;
    EmIcms: TDBEdit;
    Label19: tsLabel;
    Label20: tsLabel;
    Emsub_total: TDBEdit;
    q_entrada2: TFDQuery;
    q_entrada1: TFDQuery;
    TabSheet3: TsTabSheet;
    Lbembalagem: tsLabel;
    GroupBox7: TsGroupBox;
    Label3: tsLabel;
    Label2: tsLabel;
    Label5: tsLabel;
    Label6: tsLabel;
    Label7: tsLabel;
    Prvl_frete: TsCurrencyEdit;
    Prvl_outros: TsCurrencyEdit;
    Prbase_icms: TsCurrencyEdit;
    Prtotal_mercadorias: TsCurrencyEdit;
    Prvl_total: TsCurrencyEdit;
    PopupMenu1: TPopupMenu;
    gsdfg1: TMenuItem;
    dfgsdfgsdf1: TMenuItem;
    sdfgsdf1: TMenuItem;
    Prcod_transportadora: TsComboEdit;
    LbNom_transportadora: tsLabel;
    Label16: tsLabel;
    Prfrete_separado: tscheckbox;
    EmCusto_final: TDBEdit;
    Label21: tsLabel;
    paAtributo: tsPanel;
    Emid_cor: TRxDBComboEdit;
    Label10: tsLabel;
    LbCor: tsLabel;
    Emid_Tamanho: TRxDBComboEdit;
    Lbtamanho: tsLabel;
    Label23: tsLabel;
    Panel2: tsPanel;
    Label1: tsLabel;
    Label47: tsLabel;
    Label34: tsLabel;
    LbNom_fornecedor: tsLabel;
    PrNr_documento: TsEdit;
    Prdta_documento: TsDateEdit;
    Prcod_fornecedor: TsComboEdit;
    BTSEQ: TButton;
    sb_entrada: TStatusBar;
    Lbcolecao: tsLabel;
    Prcod_empresa: TsEdit;
    Prempresa_destino: TsComboEdit;
    Lbempresa_destino: tsLabel;
    Label22: tsLabel;
    Label24: tsLabel;
    Prnr_romaneio: TsEdit;
    Label25: tsLabel;
    RomaneiodeTransfernciadeMercadoria1: TMenuItem;
    Prtot_itens: TsCurrencyEdit;
    Label26: tsLabel;
    zzPreco_venda_atualizar: TsCurrencyEdit;
    Label31: tsLabel;
    ImprimirEtiquetaUnitria1: TMenuItem;
    EspelhodeNotacomPreodeCustoeVenda1: TMenuItem;
    ransferirMercadoriasparaLojaDestino1: TMenuItem;
    Emid: TDBEdit;
    Prempresa: TsComboEdit;
    Label35: tsLabel;
    Lbempresa_pertence: tsLabel;
    Panel1: tsPanel;
    BtNov: TsBitBtn;
    BtAlt: TsBitBtn;
    BtGra: TsBitBtn;
    BtCan: TsBitBtn;
    BtExc: TsBitBtn;
    BtLocalizar: TsBitBtn;
    SpeedButton1: TsSpeedButton;
    RD: TRDprint;
    Prvalor_icms: TsCurrencyEdit;
    Label11: tsLabel;
    Prbase_calculo_icms_subst: TsCurrencyEdit;
    Label27: tsLabel;
    Prvalor_icms_subst: TsCurrencyEdit;
    Label28: tsLabel;
    Label30: tsLabel;
    Prvalor_seguro: TsCurrencyEdit;
    Prtotal_ipi: TsCurrencyEdit;
    Label36: tsLabel;
    Lbqtd: tsLabel;
    lbqtd_ant: tsLabel;
    ZZpode_enviar: tscheckbox;
    Label29: tsLabel;
    lbqtdpecas: tsLabel;
    BtnNFE: TsBitBtn;
    XMLGeral: TXMLDocument;
    Label37: tsLabel;
    Prcod_cliente: TsComboEdit;
    Lbnom_cliente: tsLabel;
    Label39: tsLabel;
    EmVolume: TDBEdit;
    mmEntradas2: TRxMemoryData;
    dsEntradas2: TDataSource;
    mmEntradas2ID: TIntegerField;
    mmEntradas2NR_DOCUMENTO: TIntegerField;
    mmEntradas2COD_FORNECEDOR: TIntegerField;
    mmEntradas2COD_PRODUTO: TIntegerField;
    mmEntradas2QTD_ENTRADA: TBCDField;
    mmEntradas2CUSTO: TCurrencyField;
    mmEntradas2ICMS: TFloatField;
    mmEntradas2VALOR_ICMS: TCurrencyField;
    mmEntradas2SUB_TOTAL: TCurrencyField;
    mmEntradas2CUSTO_FINAL: TCurrencyField;
    mmEntradas2ID_COR: TIntegerField;
    mmEntradas2ID_TAMANHO: TIntegerField;
    mmEntradas2NUMERACAO: TIntegerField;
    mmEntradas2COD_COLECAO: TIntegerField;
    mmEntradas2VOLUME: TFloatField;
    mmEntradas2NOM_PRODUTO: TStringField;
    DBGrid1: Tdbgrid;
    Panel3: tsPanel;
    BtNovEm: TsBitBtn;
    BtAltEm: TsBitBtn;
    BtgraEm: TsBitBtn;
    BtcanEm: TsBitBtn;
    BtexcEm: TsBitBtn;
    Label4: tsLabel;
    zzEstoque: TsCurrencyEdit;
    Emcod_colecao: TDBEdit;
    Emcod_fornecedor: TDBEdit;
    Emnr_documento: TDBEdit;
    Panel4: tsPanel;
    Gbanalise_custo: TsGroupBox;
    Label40: tsLabel;
    emCustoPro: TDBEdit;
    Label41: tsLabel;
    emImpostosPro: TDBEdit;
    Label42: tsLabel;
    emIPIPro: TDBEdit;
    Label43: tsLabel;
    emGeralPro: TDBEdit;
    mmEntradas2CUSTO_PRO: TFloatField;
    mmEntradas2IMPOSTO_PRO: TCurrencyField;
    mmEntradas2IPI_PRO: TCurrencyField;
    mmEntradas2GERAL_PRO: TCurrencyField;
    mmEntradas2IMAGEM_PRO: TBlobField;
    btGrafico: TsSpeedButton;
    q_foto: TFDQuery;
    Foto: TImage;
    EmHodometro: TDBEdit;
    lbHodometro: tsLabel;
    EmID_VEICULO: TRxDBComboEdit;
    lbVeiculo: tsLabel;
    lbsVeiculo: tsLabel;
    mmEntradas2ID_VEICULO: TIntegerField;
    mmEntradas2HODOMETRO: TIntegerField;
    PrTIPO_NF: tscheckbox;
    sbParc: TsSpeedButton;
    sDBGrid1: Tdbgrid;
    GroupBox8: TsGroupBox;
    sLabel1: tsLabel;
    sLabel2: tsLabel;
    sLabel3: tsLabel;
    Label53: tsLabel;
    Cpdtaven: TsDateEdit;
    Cpvalor: TsCurrencyEdit;
    Cpid: TsEdit;
    Cptitulo: TsEdit;
    Cpsequencia: TsEdit;
    ds_Cp1: TDataSource;
    q_cp1: TFDQuery;
    Btgrava_cp1: TsBitBtn;
    sLabel4: tsLabel;
    PrDesconto: TsCurrencyEdit;
    DlgXml: TOpenDialog;
    Q_produto: TFDQuery;
    q_cp1id: TIntegerField;
    q_cp1cod_fornecedor: TIntegerField;
    q_cp1nr_documento: TStringField;
    q_cp1titulo: TStringField;
    q_cp1sequencia: TIntegerField;
    q_cp1dtaven: TDateField;
    q_cp1dtapag: TDateField;
    q_cp1valor: TBCDField;
    q_cp1obs: TMemoField;
    q_cp1cod_fop: TIntegerField;
    q_cp1historico: TStringField;
    q_cp1valor_pago: TBCDField;
    q_cp1saldo_devedor: TBCDField;
    q_cp1tipo_entrada: TIntegerField;
    q_cp1cod_empresa: TIntegerField;
    q_cp1conferido: TStringField;
    q_cp1id_plano_contas: TIntegerField;
    q_cp1extrato: TIntegerField;
    q_cp1cheque: TIntegerField;
    q_cp1id_master: TIntegerField;
    q_cp1vlr_corrigido: TBCDField;
    q_cp1cod_representante: TIntegerField;
    q_cp1historico1: TBlobField;
    q_cp1cr_vinculada: TIntegerField;
    q_cp1emprestimo: TStringField;
    q_cp1conta_emprestimo: TIntegerField;
    q_fotocod_produto: TIntegerField;
    q_fotosubcategoria: TIntegerField;
    q_fotoimagem_bd: TBlobField;
    q_fotoqtd_estoque: TBCDField;
    q_fotoqtd_reservado: TBCDField;
    q_fotoqtd_total: TFMTBCDField;
    q_fotoqtd_embalagem: TBCDField;
    q_fotounidade: TStringField;
    procedure BtAltClick(Sender: TObject);
    procedure BtCanClick(Sender: TObject);
    procedure BtExcClick(Sender: TObject);
    procedure BtGraClick(Sender: TObject);
    procedure BtLocalizarClick(Sender: TObject);
    procedure BtNovClick(Sender: TObject);
    procedure BtNovEmClick(Sender: TObject);
    procedure BtAltEmClick(Sender: TObject);
    procedure BtgraEmClick(Sender: TObject);
    procedure BtcanEmClick(Sender: TObject);
    procedure BtexcEmClick(Sender: TObject);
    procedure Prdta_documentoKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_fornecedorButtonClick(Sender: TObject);
    procedure Prcod_fopButtonClick(Sender: TObject);
    procedure Prcod_fiscalButtonClick(Sender: TObject);
    procedure Emcod_produtoButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Prcod_fornecedorExit(Sender: TObject);
    procedure Prcod_fiscalExit(Sender: TObject);
    procedure Prcod_fopExit(Sender: TObject);
    procedure Emcod_produtoExit(Sender: TObject);
    procedure PrNr_documentoKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_fornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure Probs_nota3KeyPress(Sender: TObject; var Key: Char);
    procedure BTSEQClick(Sender: TObject);
    procedure btinf_cod_fiscalClick(Sender: TObject);
    procedure EmcustoExit(Sender: TObject);
    procedure EmIcmsExit(Sender: TObject);
    procedure SgProSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Prvl_freteExit(Sender: TObject);
    procedure Prvl_outrosExit(Sender: TObject);
    procedure Prtotal_mercadoriasExit(Sender: TObject);
    procedure Prcod_transportadoraButtonClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Emcod_produtoKeyPress(Sender: TObject; var Key: Char);
    procedure Emid_corButtonClick(Sender: TObject);
    procedure Emid_corKeyPress(Sender: TObject; var Key: Char);
    procedure Emid_TamanhoKeyPress(Sender: TObject; var Key: Char);
    procedure Emid_TamanhoButtonClick(Sender: TObject);
    procedure Prcod_fiscalKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_transportadoraKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_fopKeyPress(Sender: TObject; var Key: Char);
    procedure Xb_produtoItems0Click(Sender: TObject);
    procedure Xb_produtoItems1Click(Sender: TObject);
    procedure Xb_produtoItems2Click(Sender: TObject);
    procedure Xb_produtoItems3Click(Sender: TObject);
    procedure Xb_produtoItems4Click(Sender: TObject);
    procedure Xb_produtoItems5Click(Sender: TObject);
    procedure Xb_produtoItems6Click(Sender: TObject);
    procedure Xb_produtoItems7Click(Sender: TObject);
    procedure Xb_produtoItems8Click(Sender: TObject);
    procedure Xb_produtoItems9Click(Sender: TObject);
    procedure Prempresa_destinoButtonClick(Sender: TObject);
    procedure Prempresa_destinoKeyPress(Sender: TObject; var Key: Char);
    procedure Xb_produtoItems10Click(Sender: TObject);
    procedure Xb_produtoItems11Click(Sender: TObject);
    procedure RomaneiodeTransfernciadeMercadoria1Click(Sender: TObject);
    procedure ReabrirNota1Click(Sender: TObject);
    procedure Btgrava_cp1Click(Sender: TObject);
    procedure Prfrete_separadoClick(Sender: TObject);
    procedure zzPreco_venda_atualizarExit(Sender: TObject);
    procedure Xb_produtoItems12Click(Sender: TObject);
    procedure SgCp1ClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure EspelhodeNotacomPreodeCustoeVenda1Click(Sender: TObject);
    procedure Xb_produtoItems13Click(Sender: TObject);
    procedure Xb_produtoExit(Sender: TObject);
    procedure ransferirMercadoriasparaLojaDestino1Click(Sender: TObject);
    procedure Prnr_romaneioExit(Sender: TObject);
    procedure EmcustoEnter(Sender: TObject);
    procedure zzPreco_venda_atualizarEnter(Sender: TObject);
    procedure PrempresaButtonClick(Sender: TObject);
    procedure PrempresaKeyPress(Sender: TObject; var Key: Char);
    procedure PrempresaExit(Sender: TObject);
    procedure Prempresa_destinoExit(Sender: TObject);
    procedure Prcod_transportadoraExit(Sender: TObject);
    procedure Emid_corExit(Sender: TObject);
    procedure Emid_TamanhoExit(Sender: TObject);
    procedure gsdfg1Click(Sender: TObject);
    procedure RDNewPage(Sender: TObject; Pagina: Integer);
    procedure Xb_produtoItems14Click(Sender: TObject);
    procedure Xb_produtoItems15Click(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure ZZpode_enviarClick(Sender: TObject);
    procedure BtnNFEClick(Sender: TObject);
    procedure CancelarItem;
    procedure CancelarNota;
    procedure Prcod_clienteButtonClick(Sender: TObject);
    procedure Prcod_clienteExit(Sender: TObject);
    procedure btGraficoClick(Sender: TObject);
    procedure CarregaDadosProdutos(cod_produto: string);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EmVolumeKeyPress(Sender: TObject; var Key: Char);
    procedure Emqtd_entradaKeyPress(Sender: TObject; var Key: Char);
    procedure EmcustoKeyPress(Sender: TObject; var Key: Char);
    procedure EmCusto_finalKeyPress(Sender: TObject; var Key: Char);
    procedure EmIcmsKeyPress(Sender: TObject; var Key: Char);
    procedure Emsub_totalKeyPress(Sender: TObject; var Key: Char);
    procedure PrQtd_parcelasEnter(Sender: TObject);
    procedure EmID_VEICULOExit(Sender: TObject);
    procedure EmID_VEICULOButtonClick(Sender: TObject);
    procedure Emcod_produtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EmID_VEICULOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbParcClick(Sender: TObject);
    procedure Emqtd_entradaExit(Sender: TObject);
    procedure q_cp1AfterClose(DataSet: TDataSet);
    procedure q_cp1AfterScroll(DataSet: TDataSet);
    procedure q_cp1BeforeOpen(DataSet: TDataSet);
    procedure Prvalor_icms_substExit(Sender: TObject);
    procedure Prtotal_ipiExit(Sender: TObject);
    procedure PrDescontoExit(Sender: TObject);
  private
    procedure habilitaCamposAreaAtuacao(CodAtuacao: string);
    procedure CarregaFoto(produto: string);
    procedure ChecaProdutoFornecedor;
    procedure ReativaProduto(produto: string);
    procedure AtualizaTotais;
    procedure SomaValorTotal;
    procedure CalculoDesconto;
    { Private declarations }
  public
    { Public declarations }

    servico, busca_qualquer_posicao_pesquisada, servico_alteracao,
      servico_insercao: Boolean;
    campo_pesquisado, dado_pesquisado: string;
    modo_insert, modo_insert_Em, importar_xml: Boolean;
    id, veiculo, numdoc, fornecedor: string;
    linMax: Integer;
    // lin,col: integer;
    uf, icms: string;

    procedure mostra_campos(prefixo: ShortString);
    procedure ativa_entrada(nr_documento: string; cod_fornecedor: string);
    // procedure ativa_entrada(id: String);//carrega a query q_produto
    procedure ativa_entrada2(id: string);
    // carrega a query q_produto_fornecedor
    procedure carrega_entrada2(nr_documento: string; cod_fornecedor: string);
    // carrega a query q_produto_fornecedor cod todos os forn. do produto
    procedure limpa_campos(prefixo: ShortString);
    procedure readonly_true(prefixo: ShortString);
    procedure readonly_false(prefixo: ShortString);

    procedure ativa_cp1(nr_documento, cod_fornecedor: string);

    function verifica_UfFornecedor(cod_fornecedor: string): string;
    function ver_num_entrada(nr_documento, cod_fornecedor,
      tipo: string): Boolean;
    function dados_produto(cod_produto: string): Boolean;

    // TRIBUTAÇÃO
    function verifica_substituicao_tributaria(numdoc, codfor: string): string;
    procedure MontaImpostosNota;
    // gera os impostos da nota e coloca no campo correto.

    procedure monta_SgPro;
    procedure insere_reg_sgPro(tipo: string);
    procedure scroll_sgpro;
    procedure DeletaLinha(Linha: Integer);

    procedure Gera_cod_barras;

    procedure monta_custo_final(nr_documento, cod_fornecedor: string);
    function Grava_custo(cod_produto: string; custo_atu: string): real;
    // grava tbm o preço de venda quando marcado para

    // calcula automaticamente o preço de venda.
    procedure atualiza_preco_venda;

    procedure envia_romaneio_mercadoria_lojas(cod_empresa: string);
    // envia os Romaneios

    // procedimentos apenas para o recebimento de registros da tabela de Romaneio
    procedure busca_romaneio_lanca(nr_romaneio: string);
    // busca o romanei que está gravado na tabela romaneio e insere os produtos na
    // entrada
    procedure insere_reg_sgPro_romaneio(tipo: string);
    // insere o registro na Stringgrid que vem do romaneio2.

    procedure Faturar;
    function verifica_linha_branco_grid: Boolean;
    procedure Abrir_entrada(nr_documento, cod_fornecedor, cod_fiscal: string);
    // re-abre a entrada e cancela o contas a pagar

    function busca_produto_unitario(leitor: Boolean;
      cod_barras: string): Boolean;

    // impressões
    procedure imp_etiqueta(cor, tamanho, cod_produto, colecao, descricao,
      cod_barras, qtd, preco, col_inicia: string);
    procedure Monta_romaneio;
    procedure Monta_espelho_nota;
    procedure Monta_NF(nr_documento, cod_fornecedor, cfop: string);

  end;

var
  Fr_entrada: TFr_entrada;
  gerar_cp, alterou_parcela, atualizar_preco_venda: Boolean;
  qtd_parcela: Integer;
  fornecedor_anterior: string;

implementation

uses Un_dao, UnPri, Un_localizar, UnFun, Math,
  Un_dm, UnSenha_especial, Un_Fornecedor, Un_Transportadora,
  Un_produto_fornecedor, Un_produto_fornecedor_unidade;

{$R *.dfm}

procedure TFr_entrada.BtAltClick(Sender: TObject);
begin
  try
    if PrNr_documento.Text <> '' then // verifica se a entrada não está fechada
    begin
      dao.Geral1('select ent_fechada from entrada1 where nr_documento=' +
        QuotedStr(PrNr_documento.Text) + ' and cod_fornecedor=' +
        QuotedStr(Prcod_fornecedor.Text));

      /// ////////
      Abrir_entrada(PrNr_documento.Text, Prcod_fornecedor.Text,
        Prcod_fiscal.Text);

      { if dao.Q1.FieldByName('ent_fechada').AsString = 'S' then
        begin
        dao.msg('Está Entrada está fechada, para modifica-la' + #13 +
        'antes você deve reabri-la"');
        exit;
        end; }
    end;

    if (PrNr_documento.Text = '') or (Prcod_fornecedor.Text = '') then
    begin
      dao.msg('Selecione uma entrada no botão Localizar!');
      Exit;
    end;

    modo_insert := false;
    readonly_false('Pr');
    // habilita botões
    BtNov.Enabled := false;
    BtAlt.Enabled := false;
    BtGra.Enabled := true;

    BtCan.Enabled := true;
    BtExc.Enabled := false;
    BtLocalizar.Enabled := false;

    if PcEntrada.ActivePageIndex = 0 then
      Prcod_fiscal.SetFocus;
    alterou_parcela := false;
  except
  end;

end;

procedure TFr_entrada.CancelarNota;
begin
  BtNov.Enabled := true;
  BtGra.Enabled := false;
  Emcod_produto.Enabled := BtGra.Enabled;
  BtCan.Enabled := false;
  BtLocalizar.Enabled := true;

  if modo_insert then
  begin
    limpa_campos('Pr');
    readonly_true('Pr');
    mmEntradas2.EmptyTable;
    dao.cn.Rollback;
  end
  else if not(modo_insert) then
  begin
    BtAlt.Enabled := true;
    BtExc.Enabled := true;
    mostra_campos(q_entrada1.fieldbyname('nr_documento').AsString);
    dao.cn.Rollback;
  end;
end;

procedure TFr_entrada.BtCanClick(Sender: TObject);
begin
  try
    if BtNovEm.Enabled = false then
    begin
      dao.msg('<ATENÇÃO>O BOTÃO NOVO DOS PRODUTOS FOI CLICADO E NÃO FOI LANÇADO NENHUM ITEM'
        + #13 + 'CLIQUE EM CANCELAR OU LANCE A MERCADORIA!');
      Exit;
    end;

    if MessageDlg('Deseja Cancelar está Operação?', mtConfirmation,
      [mbyes, mbno], 0) = mryes then
      CancelarNota
    else
      Exit;
  except
  end;
  readonly_true('Pr');
  readonly_true('Em');

  if servico_alteracao or servico_insercao then
    ModalResult := mrCancel;

end;

procedure TFr_entrada.BtExcClick(Sender: TObject);
var
  produto_lst, quant_lst: TStringList;
  x: Integer;
begin
  produto_lst := TStringList.Create;
  quant_lst := TStringList.Create;

  if PrNr_documento.Text <> '' then // verifica se a entrada não está fechada
  begin
    dao.Geral1('select ent_fechada from entrada1 where nr_documento=' +
      QuotedStr(PrNr_documento.Text) + ' and cod_fornecedor=' +
      QuotedStr(Prcod_fornecedor.Text));
    if dao.Q1.fieldbyname('ent_fechada').AsString = 'S' then
    begin
      dao.msg('Está Entrada está fechada, para Excluir a mesma' + #13 +
        'antes você deve reabri-la"');
      Exit;
    end;
  end;

  if PrNr_documento.Text = '' then
  begin
    showmessage('Não é possivel excluir esta Entrada por não ter Código!');
    BtNov.SetFocus;
    Exit;
  end;

  dao.Geral3
    ('select e2.cod_produto, sum(e2.qtd_entrada) as qtd_entrada from entrada2 e2 '
    + 'left join produto p on p.cod_produto = e2.cod_produto ' +
    'where e2.nr_documento=' + QuotedStr(PrNr_documento.Text) +
    ' and e2.cod_fornecedor=' + QuotedStr(Prcod_fornecedor.Text) +
    ' group by cod_produto ');
  dao.q3.first;

  while not dao.q3.eof do
  begin
    produto_lst.add(dao.q3.fieldbyname('cod_produto').AsString);
    quant_lst.add(dao.q3.fieldbyname('qtd_entrada').AsString);
    dao.q3.next;
  end;

  if MessageDlg('Tem Certeza que Deseja Excluir Esta Entrada?', mtConfirmation,
    [mbyes, mbno], 0) = mryes then
  begin
    try

      if not(dao.cn.InTransaction) then
        (dao.cn.StartTransaction);

      dao.Execsql('delete from cp1 where nr_documento=' +
        QuotedStr(PrNr_documento.Text) + ' and cod_fornecedor=' +
        QuotedStr(Prcod_fornecedor.Text));

      dao.delete('nr_documento', 'cod_fornecedor',
        q_entrada1.fieldbyname('nr_documento').AsString,
        q_entrada1.fieldbyname('cod_fornecedor').AsString, 'entrada1');
      dao.delete('nr_documento', 'cod_fornecedor',
        q_entrada1.fieldbyname('nr_documento').AsString,
        q_entrada1.fieldbyname('cod_fornecedor').AsString, 'entrada2');

      dao.cn.Commit;
      dao.msg('Entrada excluida com sucesso!');
    except
      dao.cn.Rollback;
    end;

    produto_lst.Free;
    quant_lst.Free;

    limpa_campos('Pr');
    mmEntradas2.EmptyTable;
  end;
end;

procedure TFr_entrada.AtualizaTotais;
var
  qtd_itens: real;
  valor_sg: real;
begin
  qtd_itens := 0;
  valor_sg := 0;

  mmEntradas2.first;
  while not mmEntradas2.eof do
  begin
    valor_sg := valor_sg + mmEntradas2SUB_TOTAL.Value;
    qtd_itens := qtd_itens + mmEntradas2QTD_ENTRADA.Value;
    mmEntradas2.next;
  end;
  Prtot_itens.Value := qtd_itens;
  Prtotal_mercadorias.Value := valor_sg;
end;

procedure TFr_entrada.BtGraClick(Sender: TObject);
var
  cod_fiscal, sql_entrada2, id_veiculo, hodometro: string;
begin
  try
    if mmEntradas2.IsEmpty then
    begin
      dao.msg('Entrada não pode ser salva sem ter alguma mercadoria relacionada!');
      Exit;
    end;

    if BtNovEm.Enabled = false then
    begin
      dao.msg('<ATENÇÃO>O BOTÃO NOVO DOS PRODUTOS FOI CLICADO E NÃO FOI LANÇADO NENHUM ITEM'
        + #13 + 'CLIQUE EM CANCELAR OU LANCE A MERCADORIA!');
      Exit;
    end;

    if Prcod_fiscal.Text = '5152' then
    begin
      if Prempresa_destino.Text = '' then
      begin
        dao.msg('Para uma Transferência de Mercadoria deve ser Informado a Loja de Destino');
        PcEntrada.ActivePageIndex := 0;
        Prempresa_destino.SetFocus;
        Exit;
      end;
    end;

    if Prempresa.Text = '' then
    begin
      dao.msg('Informe a Loja a Qual Pertence a Nota!');
      PcEntrada.ActivePageIndex := 0;
      Prempresa.SetFocus;
      Exit;
    end;

    if Prdta_documento.Text = '  /  /    ' then
    begin
      dao.msg('Deve ser Informado a Data do Documento!');
      Exit;
    end;

    { if (Prcod_fiscal.text = '1') or (Prcod_fiscal.text = '11') then
      begin
      if Prnr_romaneio.Text = '' then
      begin
      dao.msg('Deve ser Informado o Número do Romaneio!');
      PcEntrada.ActivePageIndex := 0;
      Prnr_romaneio.SetFocus;
      exit;
      end;
      end; }

    if Prtot_itens.Value = 0 then
    begin
      dao.msg('O campo Qtd de Itens não pode ficar em vazio ou zero!');
      PcEntrada.ActivePageIndex := 0;
      Prtot_itens.SetFocus;
      Exit;
    end;

    if (Prcod_fiscal.Text = '1102') or (Prcod_fiscal.Text = '2102') or
      (Prcod_fiscal.Text = '1900') or (Prcod_fiscal.Text = '2900') then
    begin
      if (trim(PrQtd_parcelas.Text) = '0') or (trim(PrQtd_parcelas.Text) = '')
      then
      begin
        dao.msg('O campo Qtd Parcelas não pode ficar em vazio ou zero!');
        PcEntrada.ActivePageIndex := 0;
        PrQtd_parcelas.SetFocus;
        Exit;
      end;
      if (trim(Prcod_fop.Text) = '') then
      begin
        dao.msg('O campo Forma de Pagamento deve ser Informado!');
        PcEntrada.ActivePageIndex := 0;
        Prcod_fop.SetFocus;
        Exit;
      end;
    end;

    if (Prtot_itens.Text = '') then
    begin
      dao.msg('O Campo Qtd de Itens de ve ser Preenchido!');
      PcEntrada.ActivePageIndex := 0;
      Prtot_itens.SetFocus
    end;

    if (PrNr_documento.Text = '') or
      ((Prcod_fornecedor.Text = '') and (Prcod_cliente.Text = '')) then
    begin
      dao.msg('O campo Nº Documento ou Fornecedor ou Cliente não estão preenchidos!');
      PcEntrada.ActivePageIndex := 0;

      if PrNr_documento.Text = '' then
      begin
        PcEntrada.ActivePageIndex := 0;
        PrNr_documento.SetFocus;
      end
      else
        Prcod_fornecedor.SetFocus;

      Exit;
    end;

    if (PrNr_documento.Text <> '') and
      ((Prcod_fornecedor.Text <> '') or (Prcod_cliente.Text <> '')) and
      (modo_insert) then
    begin

      if (Prcod_fornecedor.Text <> '') then
        ver_num_entrada(PrNr_documento.Text, Prcod_fornecedor.Text, '0');

      if (Prcod_cliente.Text <> '') then
        ver_num_entrada(PrNr_documento.Text, Prcod_cliente.Text, '1');

    end;

    BtNov.Enabled := true;
    BtAlt.Enabled := true;
    BtGra.Enabled := false;
    Emcod_produto.Enabled := BtGra.Enabled;
    BtCan.Enabled := false;
    BtExc.Enabled := true;
    BtLocalizar.Enabled := true;

    if not(dao.cn.InTransaction) then
      dao.cn.StartTransaction;

    mmEntradas2.first;
    try
      if not(dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      dao.Execsql('DELETE FROM ENTRADA2 WHERE COD_FORNECEDOR = ' +
        Prcod_fornecedor.Text + ' AND NR_DOCUMENTO = ' + PrNr_documento.Text);
      while not mmEntradas2.eof do
      begin
        if mmEntradas2ID_VEICULO.IsNull then
          id_veiculo := 'null'
        else
          id_veiculo := mmEntradas2ID_VEICULO.AsString;
        if mmEntradas2HODOMETRO.IsNull then
          hodometro := 'null'
        else
          hodometro := mmEntradas2HODOMETRO.AsString;

        sql_entrada2 :=
          ' INSERT INTO ENTRADA2 (NR_DOCUMENTO, COD_FORNECEDOR, COD_PRODUTO, QTD_ENTRADA, CUSTO, ICMS, VALOR_ICMS, SUB_TOTAL, CUSTO_FINAL, VOLUME, ID_VEICULO, HODOMETRO) '
          + ' VALUES ( ' + PrNr_documento.Text + ', ' + Prcod_fornecedor.Text +
          ', ' + mmEntradas2COD_PRODUTO.AsString + ', ' +
          Fmfun.BuscaTroca(mmEntradas2QTD_ENTRADA.AsString, ',', '.') + ', ' +
          Fmfun.BuscaTroca(mmEntradas2CUSTO.AsString, ',', '.') + ', ' +
          Fmfun.BuscaTroca(mmEntradas2ICMS.AsString, ',', '.') + ', ' +
          Fmfun.BuscaTroca(mmEntradas2VALOR_ICMS.AsString, ',', '.') + ', ' +
          Fmfun.BuscaTroca(mmEntradas2SUB_TOTAL.AsString, ',', '.') + ', ' +
          Fmfun.BuscaTroca(mmEntradas2CUSTO_FINAL.AsString, ',', '.') + ', ' +
          Fmfun.BuscaTroca(mmEntradas2VOLUME.AsString, ',', '.') + ', ' +
          Fmfun.BuscaTroca(id_veiculo, ',', '.') + ', ' +
          Fmfun.BuscaTroca(hodometro, ',', '.') + ')';
        dao.Execsql(sql_entrada2);

        ReativaProduto(mmEntradas2COD_PRODUTO.AsString);
        // id_item := dao.insert('Me', 'vendas2', 'id', Fr_vendas_industria2, 'gen_venda2');
        mmEntradas2.next;
      end;
      dao.cn.Commit;
    except
      dao.cn.Rollback;
    end;

    AtualizaTotais;

    mmEntradas2.first;
    SomaValorTotal;
    CalculoDesconto;
    try
      if not(dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      if modo_insert then
      begin

        dao.insert('Pr', 'entrada1', 'nr_documento', Fr_entrada, '');
        dao.cn.Commit;

        if (PrNr_documento.Text <> '') and (Prcod_fornecedor.Text <> '') then
          ativa_entrada(PrNr_documento.Text, Prcod_fornecedor.Text);
      end
      else
      begin
        dao.update('entrada1', 'nr_documento', 'cod_fornecedor',
          q_entrada1.fieldbyname('nr_documento').AsString,
          q_entrada1.fieldbyname('cod_fornecedor').AsString, 'Pr', Fr_entrada);
        dao.cn.Commit;
        ativa_entrada(PrNr_documento.Text, Prcod_fornecedor.Text);
      end;
    except
      dao.cn.Rollback;
    end;

    if not(servico_alteracao or servico_insercao) then
    begin
      // ****
      // monta_custo_final(PrNr_documento.Text, Prcod_fornecedor.Text);
      // MontaImpostosNota;

      // ****
      { *** }

      try
        if atualizar_preco_venda then
          atualiza_preco_venda;

        sb_entrada.Panels[0].Text := '* NOTA FECHADA *';
        //SgCp1.EditMode := true;
      except
        on e: Exception do
        begin
          dao.cn.Rollback;
          dao.msg('Houve um erro no Fechamento desta Entrada!' + #13 +
            ' as seguintes etapas não puderam ser completadas:' + #13 +
            '-Gerar a(s) Parcela(s) para o Contas a Pagar.' + #13 +
            '-Gerar os Código de Barras Personalizado.' + #13 + #13 +
            e.Message);
{
          dao.envia_email_suporte(e.Message + #13 + 'Data: ' + dao.DtaSerStr +
            #13 + 'Usuario Logado:' + nom_usuario,
            'Erro ao Gravar Registro 1 exception do procedimento Entrada1',
            'claudioplasfan@gmail.com', '', '', '');
 }
        end;
      end;
      // end;
      { *** }
      if (PrNr_documento.Text <> '') and (Prcod_fornecedor.Text <> '') then
      begin
        ativa_entrada(PrNr_documento.Text, Prcod_fornecedor.Text);
        mostra_campos('Pr');
        readonly_true('Pr');
        readonly_true('Em');
      end;
      try
        if not(dao.cn.InTransaction) then
          dao.cn.StartTransaction;
        dao.Execsql('update entrada1 set ent_fechada =' + QuotedStr('S') +
          ', cod_empresa=' + QuotedStr(cod_empresa) + ' where nr_documento=' +
          QuotedStr(PrNr_documento.Text) + ' and cod_fornecedor=' +
          QuotedStr(Prcod_fornecedor.Text));
        if (Prcod_fiscal.Text = '5152') and (ZZpode_enviar.Checked) then
          dao.Execsql('update entrada1 set pode_enviar=' + QuotedStr('S') +
            ' where nr_documento=' + QuotedStr(PrNr_documento.Text) +
            ' and cod_fornecedor=' + QuotedStr(Prcod_fornecedor.Text));

        dao.cn.Commit;
      except
        dao.cn.Rollback;
      end;

      Lbqtd.Caption := 'Qtd. Anterior de Estoque.';
      dao.Geral1('select sum(qtd_estoque) as qtd from produto where status=' +QuotedStr('N')); // N=produto ativo  S=produto inativado

      ZZpode_enviar.Enabled := true;

      if (Prcod_fop.Text = '1') then
        Faturar;
    end
    else
      ModalResult := mrok;

  except
    on e: Exception do
    begin
      sb_entrada.Panels[0].Text := '';

      dao.msg('Houve um erro ao Gravar a Entrada!' + #13 + e.Message);
{      dao.envia_email_suporte(e.Message + #13 + 'Data: ' + dao.DtaSerStr + #13 +
        'Usuario Logado:' + nom_usuario,
        'Erro ao Gravar Registro exception2 do procedimento Entrada1',
        'claudioplasfan@gmail.com', '', '', '');
 }
    end;
  end;
end;

procedure TFr_entrada.CalculoDesconto;
begin
  if Prvalor_icms_subst.Value > 0 then
    Prvl_total.Value := (Prtotal_mercadorias.Value + Prvalor_icms_subst.Value +
      Prtotal_ipi.Value) - PrDesconto.Value;
end;

procedure TFr_entrada.ReativaProduto(produto: string);
begin
  try
    if not (dao.cn.InTransaction) then
     (dao.cn.StartTransaction);
    dao.Execsql('update produto set status = ''N'', indisponivel = ''N'' where cod_produto = '+ produto);
    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;
end;

procedure TFr_entrada.BtLocalizarClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Entradas';
  chamou_pesquisa := 'fr_entrada';
  chamou_form := 'fr_entrada';
  chamou_cadastro := 'Fr_entrada';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Entrada';
  Fr_localizar.BT_cadastro.Visible := false;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 4);
  Campos_combo[0] := 'Nº Documento';
  Campos_combo[1] := 'Fornecedor';
  Campos_combo[2] := 'CNPJ';
  Campos_combo[3] := 'Codigo Fiscal';

  for i := 0 to 3 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  if campo_pesquisado <> '' then
  begin
    Fr_localizar.CBcampos.ItemIndex := Fr_localizar.CBcampos.Items.IndexOf
      (campo_pesquisado);
    Fr_localizar.EDlocalizar.Text := dado_pesquisado;
    Fr_localizar.zzbusca_qualquer.Checked := busca_qualquer_posicao_pesquisada;
    Fr_localizar.loc_entrada(Fr_localizar.EDlocalizar.Text);
  end;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

  if (PrNr_documento.Text <> '') and (Prcod_fornecedor.Text <> '') then
  begin
    carrega_entrada2(PrNr_documento.Text, Prcod_fornecedor.Text);
    ativa_cp1(PrNr_documento.Text, Prcod_fornecedor.Text);
    BtAlt.Enabled := true;
  end;

  if q_entrada1.Active = true then
    if q_entrada1.fieldbyname('pode_enviar').AsString = 'S' then
      ZZpode_enviar.Checked := true
    else
      ZZpode_enviar.Checked := false;

  if q_entrada1.Active then
  begin
    if q_entrada1.fieldbyname('ent_fechada').AsString = 'S' then
    begin
      sb_entrada.Panels[0].Text := '* NOTA FECHADA *';
    end;
    if q_entrada1.fieldbyname('cod_fiscal').AsString = '5152' then
      Prempresa_destino.Enabled := true;
  end;
end;

procedure TFr_entrada.BtNovClick(Sender: TObject);
begin
  try
    readonly_false('Pr');
    limpa_campos('Pr');
    lbqtdpecas.Caption := '...';
    if PrNr_documento.Text <> '' then // verifica se a entrada não está fechada
    begin
      dao.Geral1('select ent_fechada from entrada1 where nr_documento=' +
        QuotedStr(PrNr_documento.Text) + ' and cod_fornecedor=' +
        QuotedStr(Prcod_fornecedor.Text));
      if dao.Q1.fieldbyname('ent_fechado').AsString = 'S' then
      begin
        dao.msg('Está Entrada está fechada, para modifica-la' + #13 +
          'antes você deve reabri-la"');
        Exit;
      end;
    end;

    dao.Geral1('select sum(qtd_estoque) as qtd from produto where status=' + QuotedStr('N')); // N=produto ativo  S=produto inativado

    modo_insert := true;
    PcEntrada.ActivePageIndex := 0;
    PrNr_documento.SetFocus;
    // habilita botões
    BtNov.Enabled := false;
    BtAlt.Enabled := false;
    BtGra.Enabled := true;
    BtCan.Enabled := true;
    BtExc.Enabled := false;
    BtLocalizar.Enabled := false;

    mmEntradas2.EmptyTable;
    if not(dao.cn.InTransaction) then
      dao.cn.StartTransaction;

    Prcod_empresa.Text := cod_empresa;
    Prdta_documento.Date := now;
    ZZpode_enviar.Checked := true;
    Prempresa_destino.Enabled := false;
    sb_entrada.Panels[0].Text := 'NOTA ABERTA';

    linMax := 1;
  except
    on e: Exception do
    begin
      dao.msg('Houve um erro ao Executar o Procedimento!' + #13 + e.Message);

{      dao.envia_email_suporte(e.Message + #13 + 'Data: ' + dao.DtaSerStr + #13 +
        'Usuario Logado:' + nom_usuario,
        'Erro ao clicarno botão Novo do entrada1 ', 'claudioplasfan@gmail.com',
        '', '', '');
 }
    end;
  end;

end;

procedure TFr_entrada.BtNovEmClick(Sender: TObject);
begin
  try
    { if (Prcod_fiscal.Text = '1102') or (Prcod_fiscal.text = '2102') or
      (Prcod_fiscal.text = '5918') or (Prcod_fiscal.text = '6918') then
      if (Prtotal_mercadorias.Value = 0) then
      begin
      dao.msg('O campo de Total da Mercadoria deve ser preenchido!');
      PcEntrada.ActivePageIndex := 0;
      Prtotal_mercadorias.SetFocus;
      exit;
      end;
    }
    if (BtNov.Enabled = true) or (BtAlt.Enabled = true) then
    begin
      dao.msg('O Botão Novo ou Alterar Geral deve ser pressionado!');
      PcEntrada.ActivePageIndex := 0;
      BtAlt.SetFocus;
      Exit;
    end;

    if (PrNr_documento.Text = '') or (Prcod_fornecedor.Text = '') then
    begin
      dao.msg('O campo Nº Documento ou Fornecedor não estão preenchidos!');
      PcEntrada.ActivePageIndex := 0;
      if PrNr_documento.Text = '' then
        PrNr_documento.SetFocus
      else
        Prcod_fornecedor.SetFocus;

      Exit;
    end;

    if not mmEntradas2.Active then
      mmEntradas2.open;
    mmEntradas2.Append;
    Emnr_documento.Text := PrNr_documento.Text;
    Emcod_fornecedor.Text := Prcod_fornecedor.Text;
    Emqtd_entrada.Text := '1';
    // zzPreco_venda_atualizar.ReadOnly:= false;
    // zzPreco_venda_atualizar.Clear;

    // colocar o icms
    EmIcms.Text := icms;

    readonly_false('Em');

    modo_insert_Em := true;
    BtgraEm.Enabled := true;

    mmEntradas2ID_VEICULO.AsString := veiculo;
    EmID_VEICULOExit(self);
    EmID_VEICULO.Enabled := false;

    Emcod_produto.Enabled := BtgraEm.Enabled;

    Emcod_produto.SetFocus;
    // habilita botões
    BtNovEm.Enabled := false;
    BtAltEm.Enabled := false;
    BtcanEm.Enabled := true;
    BtexcEm.Enabled := false;
    GbProduto.Enabled := false;

  except

  end;

end;

procedure TFr_entrada.BtAltEmClick(Sender: TObject);
begin
  try
    if (BtNov.Enabled = true) or (BtAlt.Enabled = true) then
    begin
      dao.msg('O Botão Novo ou Alterar Geral deve ser precionado!');
      PcEntrada.ActivePageIndex := 0;
      BtAlt.SetFocus;
      Exit;
    end;

    if Emcod_produto.Text <> '' then
    begin
      { dao.Geral1('select grade from produto where cod_produto='+QuotedStr(Emcod_produto.Text));
        if dao.Q1.FieldByName('grade').AsString = '0' then
        paAtributo.Visible:= true
        else
        paAtributo.Visible:= false; }

    end;
    readonly_false('Em');
    mmEntradas2.Edit;
    modo_insert_Em := false;
    BtgraEm.Enabled := true;
    Emcod_produto.Enabled := BtgraEm.Enabled;
    Emcod_produto.SetFocus;
    // habilita botões
    BtNovEm.Enabled := false;
    BtAltEm.Enabled := false;

    BtcanEm.Enabled := true;
    BtexcEm.Enabled := false;

    Emcod_produto.SetFocus;
    GbProduto.Enabled := false;
  except
  end;

end;

procedure TFr_entrada.BtgraEmClick(Sender: TObject);
var
  codbarra: string;
var
  vl_icms, sub_total: real;
  cod_fiscal: string;
begin
  try
    if (Prcod_fiscal.Text = '5152') and (Emid_cor.Text <> '') and
      (Emid_Tamanho.Text <> '') then
    begin
      dao.Geral1
        ('select cod_produto, id_cor,id_tamanho, est_individual from grade where cod_produto='
        + QuotedStr(Emcod_produto.Text) + ' and id_cor=' +
        QuotedStr(Emid_cor.Text) + ' and id_tamanho=' +
        QuotedStr(Emid_Tamanho.Text));
      if dao.Q1.RecordCount < 1 then
      begin
        dao.msg('Não foi encontrado esse Atributo neste Produto' + #13 +
          'Não é Possivel Lançar esse Produto No Romaneio!');
        Exit;
      end;
    end;

    if (mmEntradas2CUSTO.IsNull) or (mmEntradas2CUSTO.Value = 0) then
      if ((Prcod_fiscal.Text = '2102') or (Prcod_fiscal.Text = '1102') or
        (Prcod_fiscal.Text = '2102') or (Prcod_fiscal.Text = '5202') or
        (Prcod_fiscal.Text = '6202') or (Prcod_fiscal.Text = '5915') or
        (Prcod_fiscal.Text = '6915')) then
      begin
        dao.msg('O Campo Custo deve ser preenchido!');
        Emcusto.SetFocus;
        Exit;
      end;

    if (mmEntradas2QTD_ENTRADA.IsNull) or (mmEntradas2QTD_ENTRADA.Value = 0)
    then
    begin
      dao.msg('O Campo Quantidade deve ser preenchido!');
      Emqtd_entrada.SetFocus;
      Exit;
    end;
    if paAtributo.Visible = true then
    begin
      if (LbCor.Caption = '') or (LbCor.Caption = '...') then
      begin
        dao.msg('informe a Cor do Produto!');
        Emid_cor.SetFocus;
        Exit;
      end;

      if (Lbtamanho.Caption = '') or (Lbtamanho.Caption = '...') then
      begin
        dao.msg('informe o Tamanho do Produto!');
        Emid_Tamanho.SetFocus;
        Exit;
      end;

    end;

    BtNovEm.Enabled := true;
    BtAltEm.Enabled := true;
    BtgraEm.Enabled := false;
    Emcod_produto.Enabled := BtgraEm.Enabled;
    BtcanEm.Enabled := false;
    BtexcEm.Enabled := true;
    // paAtributo.Visible:= true;
    // zzPreco_venda_atualizar.ReadOnly:= true;

    // recalcular o sub_total
    mmEntradas2SUB_TOTAL.Value := mmEntradas2CUSTO.Value *
      mmEntradas2QTD_ENTRADA.Value;
    if mmEntradas2ICMS.IsNull then
      mmEntradas2ICMS.Value := 0;
    if mmEntradas2VALOR_ICMS.IsNull then
      mmEntradas2VALOR_ICMS.Value := 0;
    if mmEntradas2CUSTO_FINAL.IsNull then
      mmEntradas2CUSTO_FINAL.Value := 0;
    if mmEntradas2VOLUME.IsNull then
      mmEntradas2VOLUME.Value := 0;

    mmEntradas2.Post;
    BtNovEm.SetFocus;
    cod_fiscal := copy(trim(Prcod_fiscal.Text), 1, 1);


    GbProduto.Enabled := true;

    AtualizaTotais;

    readonly_true('Em');
  except
    on e: Exception do
    begin
      dao.msg('Houve um erro ao Gravar o Produto ' + Lbnom_produto.Caption + ' desta Entrada!' + #13 + e.Message);
{      dao.envia_email_suporte('Houve um erro ao Gravar o Produto ' +
        Lbnom_produto.Caption + ' desta Entrada!' + #13 + 'Nr.Documento=' +
        PrNr_documento.Text + '  - Fornecedor  ' + LbNom_fornecedor.Caption +
        #13 + e.Message + #13 + 'Data: ' + dao.DtaSerStr + #13 +
        'Usuario Logado:' + nom_usuario,
        'Erro ao Gravar Registro 1 exction do procedimento Entrada1',
        'claudioplasfan@gmail.com', '', '', '');
        }
    end;
  end;
end;

procedure TFr_entrada.CancelarItem;
begin
  BtNovEm.Enabled := true;
  BtAltEm.Enabled := true;
  BtgraEm.Enabled := false;
  Emcod_produto.Enabled := BtgraEm.Enabled;
  BtcanEm.Enabled := false;
  BtexcEm.Enabled := true;

  mmEntradas2.Cancel;
end;

procedure TFr_entrada.BtcanEmClick(Sender: TObject);
begin
  try
    if MessageDlg('Deseja Cancelar está Operação?', mtConfirmation,
      [mbyes, mbno], 0) = mryes then
      CancelarItem
    else
      Exit;

    GbProduto.Enabled := true;

  except
  end;

end;

procedure TFr_entrada.BtexcEmClick(Sender: TObject);
begin
  try
    if (BtNov.Enabled = true) or (BtAlt.Enabled = true) then
    begin
      dao.msg('O Botão Novo ou Alterar Geral deve ser precionado!');
      PcEntrada.ActivePageIndex := 0;
      BtAlt.SetFocus;
      Exit;
    end;

    if MessageDlg('Tem Certeza que Deseja Excluir Este Produto da Entrada?',
      mtConfirmation, [mbyes, mbno], 0) = mryes then
      mmEntradas2.delete;
  except
    on e: Exception do
    begin
      dao.msg('Houve um erro ao Excluir o Produto da Entrada!' + #13 +
        e.Message);

{      dao.envia_email_suporte('Erro ao excluir produto ' + Lbnom_produto.Caption
        + ' da entrada: ' + PrNr_documento.Text + '   - Fornecedor : ' +
        LbNom_fornecedor.Caption + #13 + e.Message + #13 + 'Data: ' +
        dao.DtaSerStr + #13 + 'Usuario Logado:' + nom_usuario,
        'Erro ao inserir Registro módulo Dao', 'claudioplasfan@gmail.com',
        '', '', '');}
    end;
  end;

end;

procedure TFr_entrada.ativa_entrada(nr_documento: string;
  cod_fornecedor: string);
begin
  with q_entrada1 do
  begin
    close;
    sql.clear;
    sql.add('select a.TIPO_NF, a.NR_DOCUMENTO, a.COD_FORNECEDOR, a.DTA_DOCUMENTO, a.COD_FISCAL, '
      + 'a.VL_FRETE, a.VL_OUTROS, a.BASE_ICMS, a.VALOR_ICMS, a.TOTAL_IPI, ' +
      'a.BASE_CALCULO_ICMS_SUBST, a.VALOR_ICMS_SUBST, a.VALOR_SEGURO, a.DESCONTO, '
      + 'a.TOTAL_MERCADORIAS, a.VL_TOTAL, a.TOT_ITENS, a.QTD_PARCELAS, a.COD_FOP, '
      + 'a.OBS_NOTA1, a.OBS_NOTA2, a.OBS_NOTA3, a.ENT_FECHADA, a.COD_EMPRESA, '
      + 'a.COD_TRANSPORTADORA, a.FRETE_SEPARADO, a.EMPRESA_DESTINO, a.NR_ROMANEIO, '
      + 'a.NOTA_FISCAL, a.ROM_ENVIADO, a.EMPRESA, a.VOLUME, a.PODE_ENVIAR, a.COD_CLIENTE, fp.NAO_GERAR_CR, '
      + 'f.razao_social, fp.nom_fop, cf.nome as cf,ep.nom_empresa, epr.nom_empresa, epd.nom_empresa as empresa_dest, t.nome from entrada1 a '
      + 'left join fornecedor f on f.cod_fornecedor=a.cod_fornecedor ' +
      'left join fop fp on fp.cod_fop=a.cod_fop ' +
      'left join transportadora t on t.cod_transportadora=a.cod_transportadora '
      + 'left join cod_fiscal cf on cf.cod_fiscal=a.cod_fiscal ' +
      'left join empresa ep on ep.cod_empresa=a.cod_empresa ' +
      'left join empresa epd on epd.cod_empresa=a.empresa_destino ' +
      'left join empresa epr on epr.cod_empresa=a.empresa ' +
      // empresa pertence
      'where a.nr_documento=' + QuotedStr(nr_documento) +
      ' and a.cod_fornecedor=' + QuotedStr(cod_fornecedor));
    open;
  end;

end;

procedure TFr_entrada.limpa_campos(prefixo: ShortString);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if copy(Components[i].Name, 1, 2) = prefixo then
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
      else if Components[i] is TMaskEdit then
        TMaskEdit(Components[i]).clear
      else if Components[i] is TComboBox then
        TComboBox(Components[i]).ItemIndex := 0;
    end;
  end;
  if prefixo = 'Pr' then
  begin
    Lbnom_produto.Caption := '...';
    Lbembalagem.Caption := '...';
    LbNom_fornecedor.Caption := '...';
    Lbnom_fop.Caption := '...';
    LbNom_transportadora.Caption := '...';
    Lbnom_cod_fiscal.Caption := '...';
    Lbempresa_pertence.Caption := '...';
    Lbempresa_destino.Caption := '...';
  end
  else if prefixo = 'Em' then
  begin
    Lbembalagem.Caption := '...';
    Lbcolecao.Caption := '...';
    LbCor.Caption := '...';
    Lbtamanho.Caption := '...';
    Lbnom_produto.Caption := '...';
  end;

end;

procedure TFr_entrada.mostra_campos(prefixo: ShortString);
var
  i: Integer;
  campo, campo1: string;
begin
  Screen.Cursor := crSQLWait;

  for i := 0 to ComponentCount - 1 do
  begin
    if copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
      begin
        campo := TsEdit(Components[i]).Name;
        campo1 := copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
        TsEdit(FindComponent(campo)).Text :=
          q_entrada1.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TsComboEdit then
      begin
        campo := TsComboEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        TsComboEdit(FindComponent(campo)).Text :=
          q_entrada1.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TsCurrencyEdit then
      begin
        campo := TsCurrencyEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        TsCurrencyEdit(FindComponent(campo)).Value :=
          q_entrada1.fieldbyname(campo1).AsFloat;
      end
      else if Components[i] is tscheckbox then
      begin
        campo := tscheckbox(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        if q_entrada1.fieldbyname(campo1).AsString = 'S' then
          tscheckbox(FindComponent(campo)).Checked := true
        else
          tscheckbox(FindComponent(campo)).Checked := false;
      end
      else if Components[i] is TsDateEdit then
      begin
        campo := TsDateEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);

        TsDateEdit(FindComponent(campo)).Date := q_entrada1.fieldbyname(campo1)
          .AsDateTime;
      end
      else if Components[i] is TComboBox then
      begin
        campo := TComboBox(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);

        TComboBox(FindComponent(campo)).ItemIndex :=
          q_entrada1.fieldbyname(campo1).AsInteger;
      end
      else if Components[i] is TMaskEdit then
      begin
        campo := TMaskEdit(Components[i]).Name;
        campo1 := copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
        TMaskEdit(FindComponent(campo)).Text :=
          q_entrada1.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TRichEdit then
      begin
        campo := TRichEdit(Components[i]).Name;
        campo1 := copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
        TRichEdit(FindComponent(campo)).Text :=
          q_entrada1.fieldbyname(campo1).AsString;
      end;
    end;

  end; // end do for
  LbNom_fornecedor.Caption := q_entrada1.fieldbyname('razao_social').AsString;
  Lbnom_fop.Caption := q_entrada1.fieldbyname('nom_fop').AsString;
  LbNom_transportadora.Caption := q_entrada1.fieldbyname('nome').AsString;
  Lbnom_cod_fiscal.Caption := q_entrada1.fieldbyname('cf').AsString;
  Lbempresa_destino.Caption := q_entrada1.fieldbyname('empresa_dest').AsString;
  Lbempresa_pertence.Caption := q_entrada1.fieldbyname('nom_empresa').AsString;
  gerar_cp := q_entrada1.fieldbyname('NAO_GERAR_CR').AsString <> 'S';

  fornecedor_anterior := q_entrada1.fieldbyname('cod_fornecedor').AsString;

  carrega_entrada2(PrNr_documento.Text, Prcod_fornecedor.Text);

  Screen.Cursor := crDefault;

end;

procedure TFr_entrada.readonly_false(prefixo: ShortString);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).Enabled := true
      else if Components[i] is tscheckbox then
        tscheckbox(Components[i]).Enabled := true
      else if Components[i] is TsDateEdit then
        TsDateEdit(Components[i]).Enabled := true
      else if Components[i] is TsComboEdit then
        TsComboEdit(Components[i]).Enabled := true
      else if Components[i] is TRichEdit then
        TRichEdit(Components[i]).Enabled := true
      else if Components[i] is TsDateEdit then
        TsDateEdit(Components[i]).Enabled := true
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(Components[i]).Enabled := true
      else if Components[i] is TMaskEdit then
        TMaskEdit(Components[i]).Enabled := true;

    end;
  end;
  BTSEQ.Enabled := true;
  ZZpode_enviar.Enabled := true;

end;

procedure TFr_entrada.readonly_true(prefixo: ShortString);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).Enabled := false
      else if Components[i] is tscheckbox then
        tscheckbox(Components[i]).Enabled := false
      else if Components[i] is TsComboEdit then
        TsComboEdit(Components[i]).Enabled := false
      else if Components[i] is TRichEdit then
        TRichEdit(Components[i]).Enabled := false
      else if Components[i] is TsDateEdit then
        TsDateEdit(Components[i]).Enabled := false
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(Components[i]).Enabled := false
      else if Components[i] is TMaskEdit then
        TMaskEdit(Components[i]).Enabled := false;
    end;
  end;
  BTSEQ.Enabled := false;
  ZZpode_enviar.Enabled := true;
end;

procedure TFr_entrada.Prdta_documentoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;

end;

procedure TFr_entrada.Prcod_fornecedorButtonClick(Sender: TObject);
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
  chamou_form := 'fr_entrada_fornecedor';
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

procedure TFr_entrada.Prcod_fopButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Formas de Pagamento';
  chamou_pesquisa := 'fr_fop';
  chamou_form := 'fr_entrada_fop';
  chamou_cadastro := 'Fr_fop';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 +
    'Formas de Pagamento';
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
  Fr_localizar.CBcampos.ItemIndex := 1;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_entrada.Prcod_fiscalButtonClick(Sender: TObject);
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
  chamou_form := 'fr_entrada_cod_fiscal';
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

procedure TFr_entrada.Emcod_produtoButtonClick(Sender: TObject);
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
  chamou_form := 'fr_entrada_produto';
  if servico then
  begin
    revenda := 'N';
    chamou_cadastro := 'Fr_servicos';
  end
  else
  begin
    revenda := 'S';
    chamou_cadastro := 'Fr_produto';
  end;

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Produto';
  Fr_localizar.BT_cadastro.Visible := true;

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
    Fr_localizar.CBcampos.Items.add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  if not servico then
    revenda := 'S'
  else
    revenda := 'N';

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_entrada.FormShow(Sender: TObject);
begin
  dao.Geral1('SELECT ATUALIZAR_PRECO_NA_ENTRADA  FROM CONFIGURACAO ');
  atualizar_preco_venda := dao.Q1.fieldbyname('ATUALIZAR_PRECO_NA_ENTRADA')
    .AsString = 'S';

  // tamanho do Panel Aguarde
  FORMATSETTINGS.DecimalSeparator := ',';

  if tipo_empresa = '0' then
  begin
    {//Xb_produto.Items[0].Visible := false;
    //Xb_produto.Items[1].Visible := false;
    //Xb_produto.Items[2].Visible := false;
    //Xb_produto.Items[3].Visible := false;
    //Xb_produto.Items[4].Visible := false;
    //Xb_produto.Items[5].Visible := false;
    //Xb_produto.Items[6].Visible := false;
    //Xb_produto.Items[7].Visible := false;
    //Xb_produto.Items[12].Visible := false;
    //Xb_produto.Items[14].Visible := false;
    //Xb_produto.Items[15].Visible := false;
     }
  end;
  habilitaCamposAreaAtuacao(area_atuacao);

  Lbqtd.Caption := '';
  lbqtd_ant.Caption := '';
  PcEntrada.ActivePageIndex := 0;
  limpa_campos('Pr');
  limpa_campos('Em');

  readonly_true('Pr');
  readonly_true('Em');
  //SgCp1.EditorMode := true;
  //SgCp1.Options := SgCp1.Options + [goEditing];

  BtNov.Enabled := true;
  BtAlt.Enabled := false;
  BtGra.Enabled := false;
  Emcod_produto.Enabled := BtGra.Enabled;
  BtCan.Enabled := false;
  BtExc.Enabled := false;

  lbsVeiculo.Visible := servico;
  lbVeiculo.Visible := servico;
  EmID_VEICULO.Visible := servico;
  lbHodometro.Visible := servico;
  EmHodometro.Visible := servico;

  if servico_insercao then
    BtNovClick(self);

  if servico_alteracao then
  begin
    ativa_entrada(numdoc, fornecedor);
    mostra_campos('Pr');
    BtAltClick(self);
  end;
  // //Xb_produto.Collapsed := false;
end;

procedure TFr_entrada.Prcod_fornecedorExit(Sender: TObject);
begin
  if dao.cn.InTransaction then
    dao.cn.StartTransaction;

  if trim(Prcod_fornecedor.Text) = '' then
    LbNom_fornecedor.Caption := '...';

  if (PrNr_documento.Text <> '') and (Prcod_fornecedor.Text <> '') and
    (modo_insert = true) then
  begin
    ver_num_entrada(PrNr_documento.Text, Prcod_fornecedor.Text, '0');
  end;

  if (trim(Prcod_fiscal.Text) = '') and (tipo_empresa = '1') and
    (Prcod_fornecedor.Text <> '') then
  begin
    uf := verifica_UfFornecedor(Prcod_fornecedor.Text);
    if uf <> 'SC' then
    begin
      if servico then
        Prcod_fiscal.Text := '2900'
      else
        Prcod_fiscal.Text := '2102';
    end
    else if uf = 'SC' then
    begin
      if servico then
        Prcod_fiscal.Text := '1900'
      else
        Prcod_fiscal.Text := '1102';
    end;
    Gbcp1.Enabled := true;
    Prcod_fiscalExit(self);
  end
  else if (trim(Prcod_fiscal.Text) = '') and (tipo_empresa = '0') then
  begin
    Prcod_fiscal.Text := '5152';
    Lbnom_cod_fiscal.Caption :=
      'Transferência de Mercadoria de Matriz para Filial';
    Prempresa_destino.Enabled := true;
    Gbcp1.Enabled := false;
    // pega o icms e coloca na variavel para usar no produto
    if dao.Q1.Active = true then
    begin
      dao.Geral1('select icms from icms where uf=' + QuotedStr(uf));
      icms := dao.Q1.fieldbyname('icms').AsString;
    end;
  end;

  if Prcod_fornecedor.Text <> '' then
  begin
    dao.Geral2
      ('select razao_social from fornecedor where (inativo <> ''S'' OR inativo is null)  and cod_fornecedor='
      + QuotedStr(Prcod_fornecedor.Text));
    if dao.q2.RecordCount > 0 then
    begin
      LbNom_fornecedor.Caption := dao.q2.fieldbyname('razao_social').AsString;
      if (fornecedor_anterior <> '') and
        (Prcod_fornecedor.Text <> fornecedor_anterior) then
      begin

        dao.Execsql('update entrada2 set cod_fornecedor = ' +
          Prcod_fornecedor.Text + ' where cod_fornecedor = ' +
          fornecedor_anterior + ' and nr_documento = ' + PrNr_documento.Text);
        dao.Execsql('update cp1 set cod_fornecedor = ' + Prcod_fornecedor.Text +
          ' where cod_fornecedor = ' + fornecedor_anterior +
          ' and nr_documento = ' + QuotedStr(PrNr_documento.Text));
        dao.cn.Commit;
        carrega_entrada2(PrNr_documento.Text, Prcod_fornecedor.Text);
        ativa_cp1(PrNr_documento.Text, Prcod_fornecedor.Text);
        PcEntrada.TabIndex := 0;
      end;
    end
    else
    begin
      dao.msg('Registro não Encontrado ou Inativo!');
      Prcod_fornecedor.Text := '';
      Prcod_fornecedor.SetFocus;
      Exit;
    end;

  end;

end;

procedure TFr_entrada.Prcod_fiscalExit(Sender: TObject);
begin

  if trim(Prcod_fiscal.Text) = '' then
    Lbnom_cod_fiscal.Caption := '...';

  if Prcod_fiscal.Text = '5152' then
  begin
    Prempresa_destino.Enabled := true;
  end;

  { if Prcod_fiscal.Text <> '' then
    begin
    dao.Geral2('select nome from cod_fiscal where cod_fiscal='+QuotedStr(Prcod_fiscal.Text));
    if dao.q2.RecordCount > 0 then
    begin
    Lbnom_cod_fiscal.Caption := dao.Q2.fieldbyname('nome').AsString;
    end
    else
    begin
    dao.msg('Registro não Encontrado!');
    Prcod_fiscal.Text:= '';
    Prcod_fiscal.SetFocus;
    Exit;
    end;

    end; }

end;

procedure TFr_entrada.Prcod_fopExit(Sender: TObject);
begin
  if trim(Prcod_fop.Text) = '' then
    Lbnom_fop.Caption := '...';

  if Prcod_fop.Text <> '' then
  begin
    dao.Geral2('select nom_fop, NAO_GERAR_CR from fop where cod_fop=' +
      QuotedStr(Prcod_fop.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_fop.Caption := dao.q2.fieldbyname('nom_fop').AsString;
      gerar_cp := dao.q2.fieldbyname('NAO_GERAR_CR').AsString <> 'S';
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

procedure TFr_entrada.ChecaProdutoFornecedor;
begin
  dao.Geral1
    ('SELECT a.ID, a.COD_PRODUTO, a.COD_FORNECEDOR, a.COD_PRODUTO_FORNECEDOR FROM PRODUTO_FORNECEDOR a WHERE a.COD_FORNECEDOR = '
    + Prcod_fornecedor.Text + ' and A.COD_PRODUTO =' + Emcod_produto.Text);
  if dao.Q1.IsEmpty then
  begin
    Application.CreateForm(Tfm_produto_fornecedor, fm_produto_fornecedor);
    fm_produto_fornecedor.produto_servico := servico;

    fm_produto_fornecedor.lbProdutoFornecedor.Caption := '';
    fm_produto_fornecedor.EmCOD_PRODUTO_FORNECEDOR.Enabled := true;
    fm_produto_fornecedor.Emcod_produto.Text := Emcod_produto.Text;
    fm_produto_fornecedor.Emcod_produto.Enabled := false;

    fm_produto_fornecedor.ShowModal;

    if fm_produto_fornecedor.ModalResult = mrok then
    begin
      dao.Exec_sql.sql.clear;
      dao.Exec_sql.sql.add
        ('INSERT INTO PRODUTO_FORNECEDOR (COD_PRODUTO, COD_FORNECEDOR, COD_PRODUTO_FORNECEDOR) VALUES ('
        + Emcod_produto.Text + ',' + Prcod_fornecedor.Text + ',' +
        QuotedStr(fm_produto_fornecedor.EmCOD_PRODUTO_FORNECEDOR.Text) + ')');
      dao.Exec_sql.Execsql;
    end
    else
      CancelarItem;
  end;
end;

procedure TFr_entrada.Emcod_produtoExit(Sender: TObject);
begin
  if trim(Emcod_produto.Text) = '' then
    Lbnom_produto.Caption := '...';

  if Emcod_produto.Text <> '' then
  begin
    if Length(trim(Emcod_produto.Text)) > 13 then
    begin
      if dados_produto(copy(Emcod_produto.Text, 1, 4)) = false then
      begin
        showmessage('Produto inexistente ou desativado!');
        Emcod_produto.SetFocus;
        Exit;
      end;
    end
    else
    begin
      if dados_produto(Emcod_produto.Text) = false then
      begin
        showmessage('Produto inexistente ou desativado!');
        Emcod_produto.SetFocus;
        Exit;
      end;
    end;

    { if Q_produto.FieldByName('nom_produto').AsString <> '' then
      Lbnom_produto.Caption:= Q_produto.fieldbyname('nom_produto').AsString;

      if Q_produto.FieldByName('unidade').AsInteger = 1 then
      Lbembalagem.Caption:='CX\ '+Q_produto.fieldbyname('qtd_embalagem').AsString
      else
      if Q_produto.FieldByName('unidade').AsInteger = 0 then
      Lbembalagem.Caption:='PC\ '+Q_produto.fieldbyname('qtd_embalagem').AsString
      else
      if Q_produto.FieldByName('unidade').AsInteger = 2 then
      Lbembalagem.Caption:='LT\ '+Q_produto.fieldbyname('qtd_embalagem').AsString
      else
      if Q_produto.FieldByName('unidade').AsInteger = 3 then
      Lbembalagem.Caption:='KG\ '+Q_produto.fieldbyname('qtd_embalagem').AsString;

      if Q_produto.FieldByName('cod_colecao').AsString <> '' then
      Lbcolecao.Caption:='COLEÇÃO - ' + Q_produto.fieldbyname('descricao').AsString;

      Emcod_colecao.Text:= Q_produto.FieldByName('cod_colecao').AsString; }
    if Q_produto.fieldbyname('nom_produto').AsString <> '' then
      Lbnom_produto.Caption := Q_produto.fieldbyname('nom_produto').AsString;

    if Q_produto.fieldbyname('unidade').AsString <> '' then
      Lbembalagem.Caption := Q_produto.fieldbyname('unidade').AsString + '\ ' +
        Q_produto.fieldbyname('qtd_embalagem').AsString;

    zzEstoque.Text := Q_produto.fieldbyname('qtd_estoque').AsString;

    if mmEntradas2.State in [dsEdit, dsInsert] then
    begin
      mmEntradas2NOM_PRODUTO.AsString :=
        Q_produto.fieldbyname('nom_produto').AsString;

      if not Q_produto.fieldbyname('custo').IsNull then
        mmEntradas2CUSTO_PRO.Value := Q_produto.fieldbyname('custo').Value;

      if not Q_produto.fieldbyname('IPI').IsNull then
        mmEntradas2IPI_PRO.Value := Q_produto.fieldbyname('IPI').Value;

      if not Q_produto.fieldbyname('IMPOSTOS').IsNull then
        mmEntradas2IMPOSTO_PRO.Value := Q_produto.fieldbyname('IMPOSTOS').Value;

      if not Q_produto.fieldbyname('GERAL').IsNull then
        mmEntradas2GERAL_PRO.Value := Q_produto.fieldbyname('GERAL').Value;

      CarregaFoto(mmEntradas2COD_PRODUTO.AsString);
    end;

    { puxando o custo do cadastro de produto }
    if (Prcod_fiscal.Text = '1') or (Prcod_fiscal.Text = '1910') or
      (Prcod_fiscal.Text = '2910') or (Prcod_fiscal.Text = '1102') or
      (Prcod_fiscal.Text = '2102') or (Prcod_fiscal.Text = '5918') or
      (Prcod_fiscal.Text = '6918') or (Prcod_fiscal.Text = '5915') or
      (Prcod_fiscal.Text = '6915') or (Prcod_fiscal.Text = '5914') or
      (Prcod_fiscal.Text = '6914') or (Prcod_fiscal.Text = '5202') or
      (Prcod_fiscal.Text = '6202') or (Prcod_fiscal.Text = '12') then
    begin
      if (Q_produto.fieldbyname('custo').AsString <> '') and (not importar_xml)
        and (mmEntradas2.State in [dsEdit, dsInsert]) then
        mmEntradas2CUSTO.AsString := Q_produto.fieldbyname('custo').AsString;
      if Q_produto.fieldbyname('preco_venda').AsString <> '' then
        zzPreco_venda_atualizar.Text :=
          Q_produto.fieldbyname('preco_venda').AsString;
    end;
    ChecaProdutoFornecedor;
  end;

end;

procedure TFr_entrada.CarregaFoto(produto: string);
begin
  if not (dao.cn.InTransaction) then
    dao.cn.StartTransaction;

  q_foto.close;
  q_foto.ParamByName('produto').value := produto;
  q_foto.open;

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

procedure TFr_entrada.PrNr_documentoKeyPress(Sender: TObject; var Key: Char);
begin

  if not(Key in ['0' .. '9', #8]) and (Key <> #13) then
  begin
    beep; { somente delphi 2.0 ou > }
    Key := #0;
  end;

  if Key = #13 then
  begin
    Prdta_documento.SetFocus;
    Key := #0;
  end;
end;

procedure TFr_entrada.Prcod_fornecedorKeyPress(Sender: TObject; var Key: Char);
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
    if (Prcod_fornecedor.Text = '') and (BtNov.Enabled = false) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Fornecedor';
      chamou_pesquisa := 'fr_fornecedor';
      chamou_form := 'fr_entrada_fornecedor';
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
        Fr_localizar.CBcampos.Items.add(valor_combo);
      end;
      Fr_localizar.CBcampos.ItemIndex := 1;

  try
    Fr_localizar.ShowModal;
  finally


      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;
    end;
    Prcod_fiscal.SetFocus;
    // SelectNext(sender as TWinControl, true, true);
    Key := #0;
  end;
    Fr_localizar.Free;
  end;
end;

procedure TFr_entrada.Probs_nota3KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    PcEntrada.ActivePageIndex := 1;
    BtNovEm.SetFocus;
    Key := #0;
  end;
end;

procedure TFr_entrada.carrega_entrada2(nr_documento: string;
  cod_fornecedor: string);
begin
  with q_entrada2 do
  begin
    close;
    sql.clear;
    sql.add('select A.ID_VEICULO, A.HODOMETRO, a.ID, a.NR_DOCUMENTO, a.COD_FORNECEDOR, a.COD_PRODUTO, a.QTD_ENTRADA, a.CUSTO, a.ICMS, a.VALOR_ICMS, a.SUB_TOTAL, a.CUSTO_FINAL, a.ID_COR, a.ID_TAMANHO, a.NUMERACAO, a.COD_COLECAO, a.VOLUME, a.IPI_ITEM, a.VLR_IPI_ITEM, '
      + 'p.nom_produto, p.unidade, p.qtd_embalagem, p.custo as custo_pro, p.ipi, p.IMPOSTOS, p.GERAL, p.qtd_estoque, p.preco_venda, s.SUBCATEGORIA, s.IMAGEM_BD  from entrada2 a '
      + 'left join produto p on p.cod_produto=a.cod_produto ' +
      'left outer join SUBCATEGORIA s on (s.ID = p.SUBCATEGORIA) ' +
      'where a.nr_documento = ' + QuotedStr(nr_documento) +
      ' and a.cod_fornecedor=' + QuotedStr(cod_fornecedor));
    open;
  end;
  q_entrada2.first;
  mmEntradas2.EmptyTable;
  mmEntradas2.open;
  while not(q_entrada2.eof) do
  begin
    mmEntradas2.Append;
    mmEntradas2ID.AsString := q_entrada2.fieldbyname('id').AsString;
    mmEntradas2NR_DOCUMENTO.AsString :=
      q_entrada2.fieldbyname('NR_DOCUMENTO').AsString;
    mmEntradas2COD_FORNECEDOR.AsString :=
      q_entrada2.fieldbyname('COD_FORNECEDOR').AsString;
    mmEntradas2COD_PRODUTO.AsString := q_entrada2.fieldbyname
      ('cod_produto').AsString;
    mmEntradas2NOM_PRODUTO.AsString := q_entrada2.fieldbyname
      ('nom_produto').AsString;
    mmEntradas2QTD_ENTRADA.AsString := q_entrada2.fieldbyname
      ('qtd_entrada').AsString;
    mmEntradas2CUSTO.AsFloat := q_entrada2.fieldbyname('custo').AsFloat;
    mmEntradas2ICMS.AsFloat := q_entrada2.fieldbyname('icms').AsFloat;
    mmEntradas2VALOR_ICMS.AsFloat := q_entrada2.fieldbyname
      ('VALOR_ICMS').AsFloat;
    mmEntradas2SUB_TOTAL.AsFloat := q_entrada2.fieldbyname('sub_total').AsFloat;
    mmEntradas2CUSTO_FINAL.AsFloat := q_entrada2.fieldbyname
      ('custo_final').AsFloat;
    mmEntradas2VOLUME.AsString := q_entrada2.fieldbyname('volume').AsString;

    if not q_entrada2.fieldbyname('custo_pro').IsNull then
      mmEntradas2CUSTO_PRO.Value := q_entrada2.fieldbyname('custo_pro').Value;

    if not q_entrada2.fieldbyname('ipi').IsNull then
      mmEntradas2IPI_PRO.Value := q_entrada2.fieldbyname('IPI').Value;

    if not q_entrada2.fieldbyname('impostos').IsNull then
      mmEntradas2IMPOSTO_PRO.Value := q_entrada2.fieldbyname('IMPOSTOS').Value;

    if not q_entrada2.fieldbyname('geral').IsNull then
      mmEntradas2GERAL_PRO.Value := q_entrada2.fieldbyname('GERAL').Value;

    if not q_entrada2.fieldbyname('ID_VEICULO').IsNull then
      mmEntradas2ID_VEICULO.Value := q_entrada2.fieldbyname('ID_VEICULO').Value;

    if not q_entrada2.fieldbyname('HODOMETRO').IsNull then
      mmEntradas2HODOMETRO.Value := q_entrada2.fieldbyname('HODOMETRO').Value;

    CarregaFoto(mmEntradas2COD_PRODUTO.AsString);

    mmEntradas2.Post;
    q_entrada2.next;
  end;
  mmEntradas2.first;
  // Emcod_produtoexit(self);
end;

function TFr_entrada.ver_num_entrada(nr_documento, cod_fornecedor,
  tipo: string): Boolean;
var
  fornecedor_cliente: string;
begin
  if tipo = '0' then
    fornecedor_cliente := ' and cod_fornecedor =' + QuotedStr(cod_fornecedor)
  else
    fornecedor_cliente := ' and cod_cliente =' + QuotedStr(cod_fornecedor);

  if not (dao.cn.InTransaction) then
    (dao.cn.StartTransaction);

  dao.Geral1
    ('select nr_documento, cod_fornecedor from entrada1 where nr_documento=' +
    QuotedStr(nr_documento) + fornecedor_cliente);
  if dao.Q1.RecordCount > 0 then
  begin
    dao.msg('Este numero de entrada já existe verifique ' + #13 +
      'no sistema se já foi dado entrada nesta nota!');
    limpa_campos('Pr');
    readonly_true('Pr');

    BtNov.Enabled := true;
    BtAlt.Enabled := true;
    BtGra.Enabled := false;
    Emcod_produto.Enabled := BtGra.Enabled;
    BtCan.Enabled := false;
    BtExc.Enabled := true;
    BtLocalizar.Enabled := true;
    Result := false;
    Exit;
  end
  else
    Result := true;
end;

procedure TFr_entrada.BTSEQClick(Sender: TObject);
var
  nr_documento: Integer;
begin

  if PrNr_documento.Text <> '' then
  begin
    showmessage('Primeiro Apague o Conteudo do Campo Nº Documento!');
    PrNr_documento.SetFocus;
    Exit;
  end;

  dao.Geral1('select num_entrada from contador');
  nr_documento := dao.Q1.fieldbyname('num_entrada').AsInteger + 1;

  //dao.cn.close;
 //dao.cn.Isolation := tiConcurrency;
  try
    if not(dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    dao.Execsql('update contador set num_entrada=' +
      QuotedStr(inttostr(nr_documento)));
    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;

 //dao.cn.Isolation := tiCommitted;
  PrNr_documento.Text := inttostr(nr_documento);
  PrNr_documento.SetFocus;

end;

procedure TFr_entrada.btinf_cod_fiscalClick(Sender: TObject);
begin
  dao.testaconexao;
  ActiveControl := nil;
  ShellExecute(handle, 'open',
    pchar('http://www.sefaz.pe.gov.br/flexpub/versao1/filesdirectory/sessions398.htm'),
    nil, nil, Sw_ShowNormal);

end;

function TFr_entrada.verifica_UfFornecedor(cod_fornecedor: string): string;
begin
  if not (dao.cn.InTransaction) then
    (dao.cn.StartTransaction);

  dao.Geral1('select f.cod_fornecedor,c.uf from fornecedor f ' +
    'left join cidades c on c.cod_cidade=f.cod_cidade ' +
    'where f.cod_fornecedor=' + QuotedStr(cod_fornecedor));
  Result := dao.Q1.fieldbyname('uf').AsString;
end;

procedure TFr_entrada.monta_SgPro;
begin
end;

procedure TFr_entrada.insere_reg_sgPro(tipo: string);
begin
end;

procedure TFr_entrada.EmcustoExit(Sender: TObject);
begin

  if (BtNovEm.Enabled = false) or (BtAltEm.Enabled = false) then
    mmEntradas2SUB_TOTAL.Value := mmEntradas2CUSTO.Value *
      mmEntradas2QTD_ENTRADA.Value;

end;

procedure TFr_entrada.EmIcmsExit(Sender: TObject);
var
  vl_icms, sub_total: real;
begin
  if (BtNovEm.Enabled = false) or (BtAltEm.Enabled = false) then
  begin
    vl_icms := mmEntradas2SUB_TOTAL.Value * (mmEntradas2ICMS.Value / 100);
    sub_total := mmEntradas2SUB_TOTAL.Value;
    mmEntradas2VALOR_ICMS.Value := vl_icms;
    mmEntradas2SUB_TOTAL.Value := 0;
    mmEntradas2SUB_TOTAL.Value := sub_total + vl_icms;
  end;
end;

procedure TFr_entrada.scroll_sgpro;
begin

end;

procedure TFr_entrada.ativa_entrada2(id: string);
begin
  with q_entrada2 do
  begin
    close;
    sql.clear;
    sql.add('select a.ID, a.NR_DOCUMENTO, a.COD_FORNECEDOR, a.COD_PRODUTO, a.QTD_ENTRADA, '
      + 'a.CUSTO, a.ICMS, a.VALOR_ICMS, a.SUB_TOTAL, a.CUSTO_FINAL, a.ID_COR, a.ID_TAMANHO, '
      + 'a.NUMERACAO, a.COD_COLECAO, a.VOLUME, a.IPI_ITEM, a.VLR_IPI_ITEM, p.nom_produto, '
      + 'p.cod_colecao from entrada2 a ' +
      'left join produto p on p.cod_produto=a.cod_produto ' + 'where a.id=' +
      QuotedStr(id));
    open;
  end;

end;

procedure TFr_entrada.SgProSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  lin := ARow;
  scroll_sgpro;

end;

procedure TFr_entrada.DeletaLinha(Linha: Integer);
begin
end;

procedure TFr_entrada.CarregaDadosProdutos(cod_produto: string);
begin
  with Q_produto do
  begin
    close;
    sql.clear;
    sql.add('select p.nom_produto, p.unidade, p.qtd_embalagem, p.custo, p.ipi, p.IMPOSTOS, p.GERAL, p.qtd_estoque, p.preco_venda, s.SUBCATEGORIA, s.IMAGEM_BD from produto p '
      + 'left outer join SUBCATEGORIA s on (s.ID = p.SUBCATEGORIA) ' +
      'where p.cod_produto =  ' + QuotedStr(cod_produto));
    open;
  end;

  if Q_produto.fieldbyname('nom_produto').AsString <> '' then
    Lbnom_produto.Caption := Q_produto.fieldbyname('nom_produto').AsString;

  if Q_produto.fieldbyname('unidade').AsString <> '' then
    Lbembalagem.Caption := Q_produto.fieldbyname('unidade').AsString + '\ ' +
      Q_produto.fieldbyname('qtd_embalagem').AsString;

  zzEstoque.Text := Q_produto.fieldbyname('qtd_estoque').AsString;

end;

function TFr_entrada.dados_produto(cod_produto: string): Boolean;
begin
  with Q_produto do
  begin
    close;
    sql.clear;
    sql.add('select p.nom_produto, p.unidade, p.qtd_embalagem, p.custo, p.ipi, p.IMPOSTOS, p.GERAL, p.qtd_estoque, p.preco_venda, s.SUBCATEGORIA, s.IMAGEM_BD from produto p '
      + 'left outer join SUBCATEGORIA s on (s.ID = p.SUBCATEGORIA) ' +
      'where p.cod_produto =  ' + QuotedStr(cod_produto) +
      ' and (p.status = ''N'' OR P.COD_PRODUTO IN (SELECT PRA.COD_PRODUTO FROM PRODUTO_REPRESENTANTE_INATIVOS PRA )) ');
    open;
  end;
  if Q_produto.RecordCount > 0 then
    Result := true
  else
    Result := false;

end;

procedure TFr_entrada.Prvl_freteExit(Sender: TObject);
begin
  // if not(Prfrete_separado.Checked) then
  // Prvl_total.Value:= Prvl_frete.Value + Prvl_outros.Value + Prtotal_mercadorias.Value;
end;

procedure TFr_entrada.Prvl_outrosExit(Sender: TObject);
begin
  SomaValorTotal;
end;

procedure TFr_entrada.Prtotal_mercadoriasExit(Sender: TObject);
begin
  SomaValorTotal;
  CalculoDesconto;
end;

procedure TFr_entrada.SomaValorTotal;
begin
  if Prvalor_icms_subst.Value > 0 then
    Prvl_total.Value := Prvalor_icms_subst.Value + Prtotal_ipi.Value +
      Prvl_outros.Value + Prtotal_mercadorias.Value;
end;

procedure TFr_entrada.Prcod_transportadoraButtonClick(Sender: TObject);
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
  chamou_form := 'fr_entrada_transportadora';
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

procedure TFr_entrada.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    if MessageDlg('Deseja Sair das Notas de Entrada?', mtConfirmation,
      [mbyes, mbno], 0) = mryes then
      close;
  end;
  if Key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TFr_entrada.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if BtNov.Enabled = false then
  begin
    showmessage('<ATENÇÃO>ALGUM BOTÃO GRAVAR/CANCELAR ESTÁ PENDENTE!<ATENÇÃO>');
    CanClose := false;
  end
  else
    CanClose := true;

end;

procedure TFr_entrada.monta_custo_final(nr_documento, cod_fornecedor: string);
var
  qtd_prod, vlr_frete_dist, calc: real;

begin
  dao.Geral2('select sum(qtd_entrada) from entrada2 where nr_documento=' +
    QuotedStr(nr_documento) + ' and cod_fornecedor=' +
    QuotedStr(cod_fornecedor));
  qtd_prod := dao.q2.fieldbyname('sum').AsFloat;

  dao.Geral1('select id, qtd_entrada, custo from entrada2 where nr_documento=' +
    QuotedStr(nr_documento) + ' and cod_fornecedor=' +
    QuotedStr(cod_fornecedor));

  if qtd_prod > 0 then
    vlr_frete_dist := Fmfun.poe2zero(Prvl_frete.Value / qtd_prod);

  dao.Q1.first;
  try
    if not(dao.cn.InTransaction) then
      dao.cn.StartTransaction;

    while not(dao.Q1.eof) do
    begin
      FORMATSETTINGS.DecimalSeparator := '.';
      calc := dao.Q1.fieldbyname('custo').AsFloat + vlr_frete_dist;
      dao.Execsql('update entrada2 set custo_final = ' +
        QuotedStr(floattostr(calc)) + ' where id=' +
        QuotedStr(dao.Q1.fieldbyname('id').AsString));
      calc := 0;
      dao.Q1.next;
    end;
    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;

  FORMATSETTINGS.DecimalSeparator := ',';
  carrega_entrada2(PrNr_documento.Text, Prcod_fornecedor.Text);

end;

procedure TFr_entrada.Emcod_produtoKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
  usa_leitor: Boolean;
begin

  // If not( key in['0'..'9',#8] ) and (key <> #13) then
  // begin
  // beep;{somente delphi 2.0 ou >}
  // key:=#0;
  // end;

  if Key = #13 then
  begin
    if (Length(Emcod_produto.Text) < 12) and (Emcod_produto.Text <> '') then
    begin
      if not(busca_produto_unitario(false, Emcod_produto.Text)) then
        Exit
    end
    else if (Emcod_produto.Text <> '') then
    begin
      if not(busca_produto_unitario(true, Emcod_produto.Text)) then
        Exit;
      usa_leitor := true;
    end;
    if (Emcod_produto.Text = '') and (BtNovEm.Enabled = false) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Produto';
      chamou_pesquisa := 'fr_produto';
      chamou_form := 'fr_entrada_produto';
      chamou_cadastro := 'Fr_produto';
      revenda := 'S';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Produto';
      Fr_localizar.BT_cadastro.Visible := true;

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
    if Emcod_produto.Text <> '' then
    begin
      dao.Geral1('select grade from produto where cod_produto=' +
        QuotedStr(Emcod_produto.Text));
      if dao.Q1.fieldbyname('grade').AsString = '1' then
      begin
        Emid_cor.Text := '';
        Emid_Tamanho.Text := '';
        paAtributo.Visible := false;
      end
      else
      begin
        // paAtributo.Visible:= true;
      end;
    end;

    if paAtributo.Visible = true then
      Emid_cor.SetFocus
    else
      EmVolume.SetFocus;

    if usa_leitor then
      BtgraEm.Click;

    Key := #0;
  end;
end;

procedure TFr_entrada.Emid_corButtonClick(Sender: TObject);
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

procedure TFr_entrada.Emid_corKeyPress(Sender: TObject; var Key: Char);
var
  q_campos_proponente: TFDQuery;
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
    if (Emid_cor.Text = '') and (BtNov.Enabled = false) then
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
    end
    else if Emid_cor.Text <> '' then
    begin
      dao.Geral2('select cor from cores where id=' + QuotedStr(Emid_cor.Text));
      if dao.q2.RecordCount > 0 then
        LbCor.Caption := dao.q2.fieldbyname('cor').AsString
      else
      begin
        dao.msg('Registro não Encontrado');
        Emid_cor.Text := '';
        Emid_cor.SetFocus;
        Exit;
      end;

    end;

    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;

end;

procedure TFr_entrada.Emid_TamanhoKeyPress(Sender: TObject; var Key: Char);
var
  q_campos_proponente: TFDQuery;
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
    if (Emid_Tamanho.Text = '') and (BtNov.Enabled = false) then
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
    end
    else if Emid_Tamanho.Text <> '' then
    begin
      dao.Geral2('select tamanho from tamanho where id=' +
        QuotedStr(Emid_Tamanho.Text));
      if dao.q2.RecordCount > 0 then
        Lbtamanho.Caption := dao.q2.fieldbyname('tamanho').AsString
      else
      begin
        dao.msg('Registro não Encontrado');
        Emid_Tamanho.Text := '';
        Emid_Tamanho.SetFocus;
        Exit;
      end;

    end;

    Emqtd_entrada.SetFocus;
    Key := #0;
  end;

end;

procedure TFr_entrada.Emid_TamanhoButtonClick(Sender: TObject);
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
    Fr_localizar.CBcampos.Items.add(valor_combo);
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

procedure TFr_entrada.Prcod_fiscalKeyPress(Sender: TObject; var Key: Char);
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
    if (Prcod_fiscal.Text = '') and (BtNov.Enabled = false) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Código Fiscal';
      chamou_pesquisa := 'fr_cod_fiscal';
      chamou_form := 'fr_entrada_cod_fiscal';
      chamou_cadastro := 'Fr_cod_fiscal';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 +
        'Códigos Fiscais';
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

procedure TFr_entrada.Prcod_transportadoraKeyPress(Sender: TObject;
  var Key: Char);
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
    if (Prcod_transportadora.Text = '') and (BtNov.Enabled = false) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Transportadora';
      chamou_pesquisa := 'fr_transportadora';
      chamou_form := 'fr_entrada_transportadora';
      chamou_cadastro := 'Fr_transportadora';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 +
        'Transportadoras';
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

procedure TFr_entrada.PrDescontoExit(Sender: TObject);
begin
  CalculoDesconto;
end;

procedure TFr_entrada.Prcod_fopKeyPress(Sender: TObject; var Key: Char);
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
    if (Prcod_fop.Text = '') and (BtNov.Enabled = false) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Formas de Pagamento';
      chamou_pesquisa := 'fr_fop';
      chamou_form := 'fr_entrada_fop';
      chamou_cadastro := 'Fr_fop';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 +
        'Formas de Pagamento';
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

function TFr_entrada.busca_produto_unitario(leitor: Boolean;
  cod_barras: string): Boolean;
var
  cmd: string;
  id_produto, idcor, idtamanho: string;
begin
  if leitor then
  begin
    if Length(trim(cod_barras)) < 13 then
    begin
      dao.Geral1
        ('select p.cod_produto, nom_produto, qtd_estoque,preco_venda, grade, cod_colecao from produto p '
        + 'left join cod_barras cb on cb.cod_produto=p.cod_produto ' +
        'where cb.cod_barras=' + QuotedStr(cod_barras));
      dao.Q1.first;
      if dao.Q1.RecordCount < 1 then
      begin
        Result := false;
        dao.msg('Produto não encontrado!');
        Emcod_produto.Text := '';
        Emcod_produto.SetFocus;
        Exit;
      end
      else
      begin
        Emcod_produto.Text := dao.Q1.fieldbyname('cod_produto').AsString;
        Lbnom_produto.Caption := dao.Q1.fieldbyname('nom_produto').AsString;
        Emcod_colecao.Text := dao.Q1.fieldbyname('cod_colecao').AsString;
        Result := true;
      end;
    end

    else
    begin
      if Length(trim(cod_barras)) = 22 then
      begin
        if copy(cod_barras, 1, 4) <> '' then
          dao.Geral2('select grade from produto where cod_produto= ' +
            QuotedStr(copy(cod_barras, 1, 4)));

        if dao.q2.fieldbyname('grade').AsString = '0' then
        begin
          dao.Geral1
            ('select p.cod_produto, p.nom_produto, p.qtd_estoque,p.preco_venda, p.grade, gd.id_cor, gd.id_tamanho, c.cor, t.tamanho, cod_colecao from produto p '
            + 'left join grade gd on gd.cod_produto=p.cod_produto ' +
            'left join cores c on c.id=gd.id_cor ' +
            'left join tamanho t on t.id=gd.id_tamanho ' +
            'where p.cod_produto=' + QuotedStr(copy(cod_barras, 1, 4)) +
            ' and gd.id_cor = ' + QuotedStr(copy(cod_barras, 5, 3)) +
            ' and id_tamanho = ' + QuotedStr(copy(cod_barras, 8, 3)));
        end
        else
        begin
          dao.Geral1
            ('select p.cod_produto, p.nom_produto, p.qtd_estoque,p.preco_venda, p.grade, gd.id_cor, gd.id_tamanho, c.cor, t.tamanho, cod_colecao from produto p '
            + 'left join grade gd on gd.cod_produto=p.cod_produto ' +
            'left join cores c on c.id=gd.id_cor ' +
            'left join tamanho t on t.id=gd.id_tamanho ' +
            'where p.cod_produto=' + QuotedStr(copy(cod_barras, 1, 4)));
        end;
      end
      else if Length(trim(cod_barras)) = 14 then
      begin
        if copy(cod_barras, 1, 8) <> '' then
          dao.Geral2('select grade from produto where cod_pro2= ' +
            QuotedStr(copy(cod_barras, 1, 8)));

        if dao.q2.fieldbyname('grade').AsString = '0' then
        begin
          dao.Geral3
            ('select cod_produto, cod_pro2, cod_colecao from produto where cod_pro2='
            + QuotedStr(copy(cod_barras, 1, 8)));
          id_produto := dao.q3.fieldbyname('cod_produto').AsString;
          Emcod_colecao.Text := dao.q3.fieldbyname('cod_colecao').AsString;
          dao.Geral3('select id, id_cor2 from cores where id_cor2=' +
            QuotedStr(copy(cod_barras, 9, 3)));
          idcor := dao.q3.fieldbyname('id').AsString;
          dao.Geral3('select id, id_tam2 from tamanho where id_tam2=' +
            QuotedStr(copy(cod_barras, 12, 3)));
          idtamanho := dao.q3.fieldbyname('id').AsString;

          dao.Geral1
            ('select p.cod_produto, p.cod_pro2 , p.nom_produto, p.qtd_estoque,p.preco_venda, p.grade, gd.id_cor, gd.id_tamanho, c.cor, c.id_cor2, t.tamanho, t.id_tam2, cod_colecao from produto p '
            + 'left join grade gd on gd.cod_produto=p.cod_produto ' +
            'left join cores c on c.id=gd.id_cor ' +
            'left join tamanho t on t.id=gd.id_tamanho ' +
            'where p.cod_produto=' + QuotedStr(id_produto) + ' and gd.id_cor = '
            + QuotedStr(idcor) + ' and id_tamanho = ' + QuotedStr(idtamanho));

        end;
      end
      else if Length(trim(cod_barras)) = 21 then
      begin
        if copy(cod_barras, 1, 4) <> '' then
          dao.Geral2('select grade from produto where cod_produto= ' +
            QuotedStr(copy(cod_barras, 1, 4)));

        if dao.q2.fieldbyname('grade').AsString = '0' then
        begin
          dao.Geral1
            ('select p.cod_produto, p.nom_produto, p.qtd_estoque,p.preco_venda, p.grade, gd.id_cor, gd.id_tamanho, c.cor, t.tamanho, cod_colecao from produto p '
            + 'left join grade gd on gd.cod_produto=p.cod_produto ' +
            'left join cores c on c.id=gd.id_cor ' +
            'left join tamanho t on t.id=gd.id_tamanho ' +
            'where p.cod_produto=' + QuotedStr(copy(cod_barras, 1, 4)) +
            ' and gd.id_cor = ' + QuotedStr(copy(cod_barras, 5, 3)) +
            ' and id_tamanho = ' + QuotedStr(copy(cod_barras, 8, 2)));
        end
        else
        begin
          dao.Geral1
            ('select p.cod_produto, p.nom_produto, p.qtd_estoque,p.preco_venda, p.grade, gd.id_cor, gd.id_tamanho, c.cor, t.tamanho, cod_colecao from produto p '
            + 'left join grade gd on gd.cod_produto=p.cod_produto ' +
            'left join cores c on c.id=gd.id_cor ' +
            'left join tamanho t on t.id=gd.id_tamanho ' +
            'where p.cod_produto=' + QuotedStr(copy(cod_barras, 1, 4)));
        end;

      end
      else if Length(trim(cod_barras)) >= 23 then
      begin
        if copy(cod_barras, 1, 5) <> '' then
          dao.Geral2('select grade from produto where cod_produto= ' +
            QuotedStr(copy(cod_barras, 1, 5)));

        if dao.q2.fieldbyname('grade').AsString = '0' then
        begin
          dao.Geral1
            ('select p.cod_produto, p.nom_produto, p.qtd_estoque,p.preco_venda, p.grade, gd.id_cor, gd.id_tamanho, c.cor, t.tamanho, cod_colecao from produto p '
            + 'left join grade gd on gd.cod_produto=p.cod_produto ' +
            'left join cores c on c.id=gd.id_cor ' +
            'left join tamanho t on t.id=gd.id_tamanho ' +
            'where p.cod_produto=' + QuotedStr(copy(cod_barras, 1, 5)) +
            ' and gd.id_cor = ' + QuotedStr(copy(cod_barras, 6, 3)) +
            ' and id_tamanho = ' + QuotedStr(copy(cod_barras, 9, 3)));
          Emcod_colecao.Text := dao.Q1.fieldbyname('cod_colecao').AsString;
        end;

        if dao.q2.fieldbyname('grade').AsString = '1' then
        begin
          dao.Geral1
            ('select p.cod_produto, p.nom_produto, p.qtd_estoque,p.preco_venda, p.grade, gd.id_cor, gd.id_tamanho, c.cor, t.tamanho, cod_colecao from produto p '
            + 'left join grade gd on gd.cod_produto=p.cod_produto ' +
            'left join cores c on c.id=gd.id_cor ' +
            'left join tamanho t on t.id=gd.id_tamanho ' +
            'where p.cod_produto=' + QuotedStr(copy(cod_barras, 1, 5)));
          Emcod_colecao.Text := dao.Q1.fieldbyname('cod_colecao').AsString;
        end;
      end;

      dao.Q1.first;
      if dao.Q1.RecordCount < 1 then
      begin
        Result := false;
        dao.msg('Produto não encontrado!');
        Emcod_produto.Text := '';
        Emcod_produto.SetFocus;
        Exit;
      end
      else
      begin
        Result := true;
        Emcod_produto.Text := dao.Q1.fieldbyname('cod_produto').AsString;
        Lbnom_produto.Caption := dao.Q1.fieldbyname('nom_produto').AsString;
        if dao.Q1.fieldbyname('grade').AsString = '0' then
        begin
          Emid_cor.Text := '';
          LbCor.Caption := '...';
          Emid_Tamanho.Text := '';
          Lbtamanho.Caption := '...';

          Emid_cor.Text := dao.Q1.fieldbyname('id_cor').AsString;
          LbCor.Caption := dao.Q1.fieldbyname('cor').AsString;
          Emid_Tamanho.Text := dao.Q1.fieldbyname('id_tamanho').AsString;
          Lbtamanho.Caption := dao.Q1.fieldbyname('tamanho').AsString;
          Emcod_colecao.Text := dao.Q1.fieldbyname('cod_colecao').AsString;
        end;
      end;
    end;
  end;

  if not(leitor) then
  begin
    dao.Geral1
      ('select p.cod_produto, nom_produto, qtd_estoque,preco_venda, grade, cod_colecao from produto p '
      + 'where p.cod_produto = ' + QuotedStr(cod_barras));

    if dao.Q1.RecordCount < 1 then
    begin
      Result := false;
      dao.msg('Produto não encontrado!');
      Emcod_produto.Text := '';
      Emcod_produto.SetFocus;
      Exit;
    end
    else
    begin
      Emcod_colecao.Text := dao.Q1.fieldbyname('cod_colecao').AsString;
      Result := true;
    end;
  end;

end;

procedure TFr_entrada.Xb_produtoItems0Click(Sender: TObject);
begin
  if BtNov.Enabled = false then
  begin
    Prcod_fiscal.Text := '5202';
    Lbnom_cod_fiscal.Caption := 'Devolução de Mercadoria Estadual';
    Prempresa_destino.Enabled := false;
    Gbcp1.Enabled := false;
    ////Xb_produto.Collapsed := true;
  end;
end;

procedure TFr_entrada.Xb_produtoItems1Click(Sender: TObject);
begin
  if BtNov.Enabled = false then
  begin
    Prcod_fiscal.Text := '6202';
    Lbnom_cod_fiscal.Caption := 'Devolução de Mercadoria Inter-Estadual';
    Prempresa_destino.Enabled := false;
    Gbcp1.Enabled := false;
    ////Xb_produto.Collapsed := true;
  end;
end;

procedure TFr_entrada.Xb_produtoItems2Click(Sender: TObject);
begin
  if BtNov.Enabled = false then
  begin
    Prcod_fiscal.Text := '5915';
    Lbnom_cod_fiscal.Caption := 'Remessa para Concerto Estadual';
    Prempresa_destino.Enabled := false;
    Gbcp1.Enabled := false;
    ////Xb_produto.Collapsed := true;
  end;
end;

procedure TFr_entrada.Xb_produtoItems3Click(Sender: TObject);
begin
  if BtNov.Enabled = false then
  begin
    Prcod_fiscal.Text := '6915';
    Prempresa_destino.Enabled := false;
    Lbnom_cod_fiscal.Caption := 'Remessa para Concerto Inter- Estadual';
    ////Xb_produto.Collapsed := true;
    Gbcp1.Enabled := false;

  end;

end;

procedure TFr_entrada.Xb_produtoItems4Click(Sender: TObject);
begin
  if BtNov.Enabled = false then
  begin
    Prcod_fiscal.Text := '5914';
    Lbnom_cod_fiscal.Caption :=
      'Remessa de Merc. ou Bem para Exposição ou Feira Estadual';
    Prempresa_destino.Enabled := false;
    Gbcp1.Enabled := false;
    ////Xb_produto.Collapsed := true;

  end;
end;

procedure TFr_entrada.Xb_produtoItems5Click(Sender: TObject);
begin
  if BtNov.Enabled = false then
  begin
    Prcod_fiscal.Text := '6914';
    Lbnom_cod_fiscal.Caption :=
      'Remessa de Merc. ou Bem para Exposição ou Feira Inter-al';
    Prempresa_destino.Enabled := false;
    Gbcp1.Enabled := false;
    ////Xb_produto.Collapsed := true;

  end;
end;

procedure TFr_entrada.Xb_produtoItems6Click(Sender: TObject);
begin
  if BtNov.Enabled = false then
  begin
    Prcod_fiscal.Text := '1914';
    Lbnom_cod_fiscal.Caption :=
      'Retorno de Merc. ou Bem Remetido para Exposição ou Feira Estadual';
    Prempresa_destino.Enabled := false;
    Gbcp1.Enabled := false;
    ////Xb_produto.Collapsed := true;
  end;
end;

procedure TFr_entrada.Xb_produtoItems7Click(Sender: TObject);
begin
  if BtNov.Enabled = false then
  begin
    Prcod_fiscal.Text := '2914';
    Lbnom_cod_fiscal.Caption :=
      'Retorno de Merc. ou Bem Remetido para Exposição ou Feira Inter-Estadual';
    Prempresa_destino.Enabled := false;
    Gbcp1.Enabled := false;
    ////Xb_produto.Collapsed := true;

  end;
end;

procedure TFr_entrada.Gera_cod_barras;
begin
  // CRIAÇÃO DOS COD. BARRAS
  codbarras := Fmfun.enchezero(q_entrada2.fieldbyname('cod_produto').AsString,
    5) + Fmfun.enchezero(q_entrada2.fieldbyname('id_cor').AsString, 3) +
    Fmfun.enchezero(q_entrada2.fieldbyname('id_tamanho').AsString, 3) +
    Fmfun.enchezero(q_entrada2.fieldbyname('cod_colecao').AsString, 3) +
    Fmfun.enchezero(q_entrada1.fieldbyname('nr_documento').AsString, 6) +
    Fmfun.enchezero(q_entrada2.fieldbyname('cod_fornecedor').AsString, 3);

  dao.Geral1('select cod_barras from cod_barras where cod_barras=' +
    QuotedStr(codbarras));
  if dao.Q1.RecordCount <= 0 then
  begin
    dao.Execsql
      ('insert into cod_barras (cod_produto, cod_barras, data) values (' +
      QuotedStr(q_entrada2.fieldbyname('cod_produto').AsString) + ', ' +
      QuotedStr(codbarras) + ', ' + QuotedStr(FormatDateTime('dd.mm.yyyy',
      now)) + ')');
  end;
end;

procedure TFr_entrada.Faturar;
var
  MVLRDIV, MPERDES, MPERACR: real;
  // faturamento
  i, q: Integer;
  CTPAR: Integer;
  MVLRPAR: EXTENDED;
  MNEWVLR: real;
  MVLRDIF: real;
  sequencia: Integer;
  CTPGT: Integer;
  MDIAVEN: Integer;
  MNUMTIT, MNUMORI, FLANOR: string;
  cmd: string;
begin
  try
    if not gerar_cp then
      Exit;

    if not(dao.cn.InTransaction) then
      dao.cn.StartTransaction;

    dao.Geral1('select ent_fechada from entrada1 where nr_documento=' +
      QuotedStr(PrNr_documento.Text) + ' and cod_fornecedor= ' +
      QuotedStr(Prcod_fornecedor.Text));

    dao.Execsql('delete from cp1 where nr_documento=' +
      QuotedStr(PrNr_documento.Text) + ' and cod_fornecedor=' +
      QuotedStr(Prcod_fornecedor.Text));

    { if dao.Q1.FieldByName('ent_fechada').AsString = 'S' then
      begin
      dao.msg('Está Entrada já está Fechada!');
      exit;
      end; }
    { if not importar_xml then
      begin }
    FLANOR := 'NOV';
    CTPAR := strtoint(PrQtd_parcelas.Text);
    i := 1;
    MDIAVEN := 0;
    MVLRPAR := Fmfun.arredonda(q_entrada1.fieldbyname('total_mercadorias').AsFloat / CTPAR);
    MNEWVLR := MVLRPAR * CTPAR;
    MVLRDIF := q_entrada1.fieldbyname('total_mercadorias').AsFloat - MNEWVLR;
    sequencia := 1;
    CTPGT := 1;
    for i := 1 to CTPAR do
    begin

      if FLANOR = 'NOV' then
        MNUMORI := q_entrada1.fieldbyname('nr_documento').AsString;

      MDIAVEN := MDIAVEN + 30;

      if MNUMORI <> '' then
      begin
        MNUMTIT := Fmfun.enchezero(MNUMORI, 6);
      end;

      FLANOR := 'FIM';
      // preenche a cr1.

      if (q_entrada1.fieldbyname('cod_fop').AsString = '1') then
      // or (q_venda1.FieldByName('cod_fop').AsString = '2') then
      begin
        FORMATSETTINGS.DecimalSeparator := '.';
        cmd := 'insert into cp1 (id_plano_contas, nr_documento,cod_fornecedor, titulo, sequencia, dtaven, dtapag, valor, vlr_corrigido, cod_fop, valor_pago, saldo_devedor)'
          + ' values (41,' + PrNr_documento.Text + ',' + Prcod_fornecedor.Text +
          ' , ' + QuotedStr(MNUMTIT) + ',' + QuotedStr(inttostr(sequencia)) +
          ' , ' + QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_documento.Date))
          + ',' + QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_documento.Date))
          + ' , ' + QuotedStr(stringreplace(floattostr(MVLRPAR), ',', '.',
          [rfReplaceAll])) + ',' + QuotedStr(stringreplace(floattostr(MVLRPAR),
          ',', '.', [rfReplaceAll])) + ',' +
          QuotedStr(q_entrada1.fieldbyname('cod_fop').AsString) + ' , ' +
          QuotedStr(stringreplace(floattostr(MVLRPAR), ',', '.', [rfReplaceAll])
          ) + ' , ' + QuotedStr('0') + ')';
        dao.Execsql(cmd);
        FORMATSETTINGS.DecimalSeparator := ',';
      end
      else
      begin
        FORMATSETTINGS.DecimalSeparator := '.';
        cmd := 'insert into cp1 (id_plano_contas, nr_documento,cod_fornecedor, titulo, sequencia, dtaven, valor, cod_fop, saldo_devedor)'
          + ' values (41, ' + PrNr_documento.Text + ',' + Prcod_fornecedor.Text
          + ' , ' + QuotedStr(MNUMTIT) + ',' + QuotedStr(inttostr(sequencia)) +
          ' , ' + QuotedStr(FormatDateTime('dd.mm.yyyy', now + MDIAVEN)) + ' , '
          + QuotedStr(stringreplace(floattostr(MVLRPAR), ',', '.',
          [rfReplaceAll])) + ',' + QuotedStr(q_entrada1.fieldbyname('cod_fop')
          .AsString) + ' , ' + QuotedStr(stringreplace(floattostr(MVLRPAR), ',',
          '.', [rfReplaceAll])) + ')';
        dao.Execsql(cmd);
        FORMATSETTINGS.DecimalSeparator := ',';
      end;

      sequencia := sequencia + 1;

    end;

    if Prfrete_separado.Checked then
    begin
      FORMATSETTINGS.DecimalSeparator := '.';
      cmd := 'insert into cp1 (id_plano_contas, nr_documento,cod_fornecedor, titulo, sequencia, dtaven, valor, cod_fop, saldo_devedor)'
        + ' values (41,' + PrNr_documento.Text + ',' + Prcod_fornecedor.Text +
        ' , ' + QuotedStr(MNUMTIT) + ',' + QuotedStr(inttostr(sequencia)) +
        ' , ' + QuotedStr(FormatDateTime('dd.mm.yyyy', now + MDIAVEN)) + ' , ' +
        QuotedStr(stringreplace(floattostr(q_entrada1.fieldbyname('vl_frete')
        .AsFloat), ',', '.', [rfReplaceAll])) + ',' +
        QuotedStr(q_entrada1.fieldbyname('cod_fop').AsString) + ' , ' +
        QuotedStr(stringreplace(floattostr(q_entrada1.fieldbyname('vl_frete')
        .AsFloat), ',', '.', [rfReplaceAll])) + ')';
      dao.Execsql(cmd);
      FORMATSETTINGS.DecimalSeparator := ',';
    end;

    // end;
    // 0 = entrada aberta
    // 1 = entrada fechada

  except
    on e: Exception do
    begin
      dao.msg('Houve um erro ao Gerar as Parcelas da Entrada!' + #13 +
        e.Message);
    end;
  end;
  // importar_xml := false;
end;

procedure TFr_entrada.imp_etiqueta(cor, tamanho, cod_produto, colecao,
  descricao, cod_barras, qtd, preco, col_inicia: string);
var
  F: TextFile;

begin
  if MessageDlg('DESEJA IMPRIMIR A(S) ETIQUETA(S)?', mtConfirmation,
    [mbyes, mbno], 0) = mryes then
  begin
    if col_inicia = '1' then
    begin
      AssignFile(F, 'LPT1');
      Rewrite(F);
      Writeln(F, ' ');
      Writeln(F, 'O');
      Writeln(F, 'N');
      Writeln(F, 'D7');
      Writeln(F, 'S2');
      Writeln(F, 'ZT');
      Writeln(F, 'Q576,24');
      Writeln(F, 'q800');

      Writeln(F, 'B750,91,2,1,2,2,60,N,"' + cod_barras + '"');
      // etiqueta de baixo
      Writeln(F, 'A750,28,2,3,1,1,N,"' + 'R$: ' + preco + '"');
      // etiqueta de cima

      Writeln(F, 'B750,220,2,1,2,2,60,N,"' + cod_barras + '"');
      Writeln(F, 'A750,155,2,3,1,1,N,"' + 'R$: ' + preco + '"');

      Writeln(F, 'A770,280,2,3,1,1,N,"' + 'COLECAO: ' + copy(colecao, 1,
        15) + '"');
      Writeln(F, 'A770,305,2,3,1,1,N,"' + 'TAMANHO:' + tamanho + '"');
      Writeln(F, 'A770,330,2,3,1,1,N,"' + 'COR:' + cor + '"');
      Writeln(F, 'A770,355,2,3,1,1,N,"' + copy(descricao, 1, 25) + '"');

      Writeln(F, 'A750,420,2,1,1,1,N,"Trocas somente no prazo"');
      Writeln(F, 'A750,405,2,1,1,1,N,"maximo de 30 dias"');
      Writeln(F, 'A750,389,2,1,1,1,N,"a partir da data:    /    /     "');

      Writeln(F, 'A700,480,2,3,1,2,N,"Beach Boutique"');

      Writeln(F, '' + 'P' + qtd + '');
      Writeln(F, ' ');
      Sleep(1000);
      CloseFile(F);
    end
    else if col_inicia = '2' then
    begin
      AssignFile(F, 'LPT1');
      Rewrite(F);
      Writeln(F, ' ');
      Writeln(F, 'O');
      Writeln(F, 'N');
      Writeln(F, 'D7');
      Writeln(F, 'S2');
      Writeln(F, 'ZT');
      Writeln(F, 'Q576,24');
      Writeln(F, 'q800');

      Writeln(F, 'B360,91,2,1,2,2,60,N,"' + cod_barras + '"');
      // etiqueta de baixo
      Writeln(F, 'A350,28,2,3,1,1,N,"' + 'R$: ' + preco + '"');
      // etiqueta de cima

      Writeln(F, 'B360,220,2,1,2,2,60,N,"' + cod_barras + '"');
      Writeln(F, 'A350,155,2,3,1,1,N,"' + 'R$: ' + preco + '"');

      Writeln(F, 'A365,280,2,3,1,1,N,"' + 'COLECAO: ' + copy(colecao, 1,
        15) + '"');
      Writeln(F, 'A365,305,2,3,1,1,N,"' + 'TAMANHO:' + tamanho + '"');
      Writeln(F, 'A365,330,2,3,1,1,N,"' + 'COR:' + cor + '"');
      Writeln(F, 'A365,355,2,3,1,1,N,"' + copy(descricao, 1, 25) + '"');

      Writeln(F, 'A350,420,2,1,1,1,N,"Trocas somente no prazo"');
      Writeln(F, 'A350,405,2,1,1,1,N,"maximo de 30 dias"');
      Writeln(F, 'A350,389,2,1,1,1,N,"a partir da data:    /    /     "');

      Writeln(F, 'A330,480,2,3,1,2,N,"Beach Boutique"');

      Writeln(F, '' + 'P' + qtd + '');
      Writeln(F, ' ');
      Sleep(1000);
      CloseFile(F);
    end;

  end;

end;

function TFr_entrada.Grava_custo(cod_produto: string; custo_atu: string): real;
var
  custo_conv: real;
  imposto, geral, lucro, preco_venda_atu: real;
  valor: string;
begin
  dao.Geral1
    ('select custo,lucro, impostos, geral, preco_venda, calcula_preco_automatic from produto where cod_produto='
    + QuotedStr(cod_produto));
  try
    if not(dao.cn.InTransaction) then
      dao.cn.StartTransaction;

    dao.Execsql('update produto set custo=' +
      QuotedStr(Fmfun.prepara_valor(custo_atu)) + ' where cod_produto=' +
      QuotedStr(cod_produto));

    if dao.Q1.fieldbyname('calcula_preco_automatic').AsString = 'S' then
    begin
      imposto := mmEntradas2CUSTO.Value *
        (dao.Q1.fieldbyname('impostos').AsFloat / 100);
      geral := mmEntradas2CUSTO.Value *
        (dao.Q1.fieldbyname('geral').AsFloat / 100);
      lucro := mmEntradas2CUSTO.Value *
        (dao.Q1.fieldbyname('lucro').AsFloat / 100);

      preco_venda_atu := mmEntradas2CUSTO.Value + imposto + geral + lucro;
      // FMFUN.BuscaTroca(valor,'.','')

      { valor:= FloatToStr(preco_venda_atu);
        if copy(valor,pos(',',valor)+1,2) = '00' then
        begin
        valor:=copy(valor,1,pos(',',valor)-1);
        end
        else
        begin
        valor:=FMFUN.BuscaTroca(valor,'.','');
        valor:=FMFUN.BuscaTroca(valor,',','.');
        end; }

      // dao.Execsql('update produto set preco_venda='+QuotedStr(FMFUN.prepara_valor(FloatToStr(preco_venda_atu))) + ' where cod_produto='+QuotedStr(cod_produto));
      Result := preco_venda_atu;

    end
    else
      Result := zzPreco_venda_atualizar.Value;

    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;

end;

procedure TFr_entrada.Xb_produtoItems8Click(Sender: TObject);
begin
  if BtNov.Enabled = false then
  begin
    Prcod_fiscal.Text := '5152';
    Lbnom_cod_fiscal.Caption :=
      'Transferência de Mercadoria de Matriz para Filial';
    Prempresa_destino.Enabled := true;
    Gbcp1.Enabled := false;
    //Xb_produto.Collapsed := true;

  end;

end;

procedure TFr_entrada.Xb_produtoItems9Click(Sender: TObject);
begin
  if BtNov.Enabled = false then
  begin
    Prcod_fiscal.Text := '5152';
    Lbnom_cod_fiscal.Caption :=
      'Transferência de Mercadoria de Filial para Matriz';
    Prempresa_destino.Enabled := true;
    Gbcp1.Enabled := false;
    //Xb_produto.Collapsed := true;

  end;

end;

procedure TFr_entrada.ativa_cp1(nr_documento, cod_fornecedor: string);
begin
  with q_cp1 do
  begin
    close;
    sql.clear;
    sql.add('select * from cp1 where nr_documento=' + QuotedStr(nr_documento) +
      ' and cod_fornecedor=' + QuotedStr(cod_fornecedor));
    open;
  end;
  { q_cp1.fieldbyname('id').visible:= false;
    q_cp1.fieldbyname('cod_fornecedor').visible:= false;
    q_cp1.fieldbyname('nr_documento').visible:= false;
    q_cp1.fieldbyname('cod_fop').visible:= false;
    q_cp1.fieldbyname('historico').visible:= false;
    q_cp1.fieldbyname('valor_pago').visible:= false;
    q_cp1.fieldbyname('saldo_devedor').visible:= false;
    q_cp1.fieldbyname('obs').visible:= false;
    q_cp1.fieldbyname('tipo_entrada').visible:= false;
    q_cp1.fieldbyname('titulo').DisplayLabel:= 'Titulo';

    q_cp1.fieldbyname('sequencia').DisplayLabel:= 'Sequencia';

    q_cp1.fieldbyname('Dtaven').DisplayLabel:= 'Data Vencimento';

    q_cp1.fieldbyname('DtaPag').DisplayLabel:= 'Data Pagamento';

    q_cp1.fieldbyname('valor').DisplayLabel:= 'Valor'; }

end;

procedure TFr_entrada.Prempresa_destinoButtonClick(Sender: TObject);
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
  chamou_form := 'fr_entrada_empresa';
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

procedure TFr_entrada.Prempresa_destinoKeyPress(Sender: TObject; var Key: Char);
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
    if (Prempresa_destino.Text = '') and (BtNov.Enabled = false) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Empresa';
      chamou_pesquisa := 'fr_empresa';
      chamou_form := 'fr_entrada_empresa';
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
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;

  end;
end;

procedure TFr_entrada.Xb_produtoItems10Click(Sender: TObject);
begin
  if BtNov.Enabled = false then
  begin
    Prcod_fiscal.Text := '1';
    Lbnom_cod_fiscal.Caption := 'Recebimento de Mercadoria da Filial';
    Prempresa_destino.Enabled := false;
    Prnr_romaneio.Enabled := true;
    Gbcp1.Enabled := false;
    //Xb_produto.Collapsed := true;

  end;

end;

procedure TFr_entrada.Xb_produtoItems11Click(Sender: TObject);
begin
  if BtNov.Enabled = false then
  begin
    Prcod_fiscal.Text := '1';
    Lbnom_cod_fiscal.Caption := 'Recebimento de Mercadoria da Matriz';
    Prempresa_destino.Enabled := false;
    Prnr_romaneio.Enabled := true;
    Gbcp1.Enabled := false;
    //Xb_produto.Collapsed := true;

  end;

end;

procedure TFr_entrada.Monta_romaneio;
var
  Excel: Variant;
  nom_arquivo: string;
  Linha: Integer;
  cod_produto: string;
  ac_qtd, ac_preco: real;
begin
  dao.Geral1
    ('select e2.id_cor, e2.id_tamanho, e2.qtd_entrada, e2.sub_total, e2.cod_produto, p.nom_produto,p.preco_venda, t.tamanho,c.cor from entrada2 e2 '
    + 'left join tamanho t on t.id=e2.id_tamanho ' +
    'left join cores c on c.id=e2.id_cor ' +
    'left join produto p on p.cod_produto=e2.cod_produto ' +
    'where e2.nr_documento=' + QuotedStr(q_entrada1.fieldbyname('nr_documento')
    .AsString) + ' and e2.cod_fornecedor=' +
    QuotedStr(q_entrada1.fieldbyname('cod_fornecedor').AsString) +
    ' order by e2.cod_produto');

  DeleteFile(ExtractFilePath(ParamStr(0)) + 'temporario\romaneio.xls');
  Excel := CreateOleObject('Excel.Application');
  Excel.WorkBooks.open(ExtractFilePath(ParamStr(0)) +
    'Relatorios\romaneio.xls');
  Excel.Visible := false;

  Excel.WorkBooks[1].sheets[1].cells[2, 2] := PrNr_documento.Text;
  Excel.WorkBooks[1].sheets[1].cells[2, 5] := FormatDateTime('dd/mm/yyyy',
    Prdta_documento.Date);

  Excel.WorkBooks[1].sheets[1].cells[4, 2] := Lbempresa_destino.Caption;
  Excel.WorkBooks[1].sheets[1].cells[5, 2] := Probs_nota1.Text;
  Excel.WorkBooks[1].sheets[1].cells[6, 2] := Probs_nota2.Text;
  Excel.WorkBooks[1].sheets[1].cells[7, 2] := Probs_nota3.Text;

  dao.Q1.first;
  Excel.WorkBooks[1].sheets[1].cells[10, 2] := dao.Q1.fieldbyname('cod_produto')
    .AsString + '/ ' + dao.Q1.fieldbyname('nom_produto').AsString;
  cod_produto := dao.Q1.fieldbyname('cod_produto').AsString;
  Linha := 12;

  while not(dao.Q1.eof) do
  begin
    if cod_produto <> dao.Q1.fieldbyname('cod_produto').AsString then
    begin
      Linha := Linha + 2;
      Excel.WorkBooks[1].sheets[1].cells[Linha, 1] := 'Produto:';
      Excel.WorkBooks[1].sheets[1].cells[Linha, 2] :=
        dao.Q1.fieldbyname('cod_produto').AsString + '/ ' +
        dao.Q1.fieldbyname('nom_produto').AsString;
      cod_produto := dao.Q1.fieldbyname('cod_produto').AsString;
      Linha := Linha + 1;
      Excel.WorkBooks[1].sheets[1].cells[Linha, 1] := 'Cor';
      Excel.WorkBooks[1].sheets[1].cells[Linha, 3] := 'Tamanho';
      Excel.WorkBooks[1].sheets[1].cells[Linha, 5] := 'Qtd';
      Excel.WorkBooks[1].sheets[1].cells[Linha, 6] := 'Preço';
      Excel.WorkBooks[1].sheets[1].cells[Linha, 7] := 'Total';
      Linha := Linha + 1;
    end;
    Excel.WorkBooks[1].sheets[1].cells[Linha, 1] :=
      dao.Q1.fieldbyname('cor').AsString;
    Excel.WorkBooks[1].sheets[1].cells[Linha, 3] :=
      dao.Q1.fieldbyname('tamanho').AsString;
    Excel.WorkBooks[1].sheets[1].cells[Linha, 5] :=
      dao.Q1.fieldbyname('qtd_entrada').AsString;
    Excel.WorkBooks[1].sheets[1].cells[Linha, 6] :=
      FormatFloat('###,##0.00', dao.Q1.fieldbyname('preco_venda').AsFloat);
    Excel.WorkBooks[1].sheets[1].cells[Linha, 7] :=
      FormatFloat('###,##0.00', dao.Q1.fieldbyname('preco_venda').AsFloat *
      dao.Q1.fieldbyname('qtd_entrada').AsFloat);

    Linha := Linha + 1;
    ac_qtd := ac_qtd + dao.Q1.fieldbyname('qtd_entrada').AsFloat;
    ac_preco := ac_preco + (dao.Q1.fieldbyname('preco_venda').AsFloat *
      dao.Q1.fieldbyname('qtd_entrada').AsFloat);
    dao.Q1.next;
  end;
  Linha := Linha + 1;
  Excel.WorkBooks[1].sheets[1].cells[Linha, 1] := 'Qtd Total de Peças:';
  Excel.WorkBooks[1].sheets[1].cells[Linha, 3] := ac_qtd;

  Excel.WorkBooks[1].sheets[1].cells[Linha, 5] := 'Valor Total:';
  Excel.WorkBooks[1].sheets[1].cells[Linha, 6] :=
    FormatFloat('###,##0.00', ac_preco);

  // SALVA O DOCUMENTO
  nom_arquivo := 'romaneio' + '.xls';

  Excel.WorkBooks[1].SaveAs(ExtractFilePath(ParamStr(0)) +
    'temporario\romaneio.xls');
  Excel.Visible := true;
  // Excel.WorkBooks[1].Close(0);

  { if chamou = 'imprimir' then
    begin
    Excel.Visible := false;

    //mz if PrintDialog1.Execute then
    //mz begin
    //mz    MSWord.ActiveDocument.PrintOut(Copies := PrintDialog1.Copies);
    //mz    MessageDlg('Aguarde o término da impressão ...', mtInformation, [mbOk], 0);
    //mz end;

    Excel.Workooks[1].Close(0);
    Excel.Quit;
    end;

    if chamou = 'visualizar' then
    Excel.Visible:= true;

    if chamou = 'enviar' then
    begin
    Excel.Visible := false;
    Excel.WorkBooks[1].Close(0);
    Excel.Quit;

    arquivo:= nom_arquivo;
    assunto:= 'Quadro Final - ' + EDnr_relatorio.Text + ' - ' + lbl_nom_segurado.Caption;

    dm.SQL(Self, 'Query1', 'select email_analista from analista where cod_analista = "' + EDcod_analista.Text + '"');

    Application.CreateForm(TF_manda_email, F_manda_email);
    F_manda_email.mail1:= Query1.FieldByName('email_analista').AsString;

    F_manda_email.analista:= lbl_nom_analista.Caption;
    F_manda_email.relatorio:= EDnr_relatorio.Text;
    F_manda_email.sinistro:= EDnr_produto.Text + ' - ' + EDnr_protocolo.Text;
    F_manda_email.segurado:= lbl_nom_segurado.Caption;

    F_manda_email.ShowModal;
    F_manda_email.Free;
    end; }

  // Excel.Workooks[1].Close(0);
  // Excel.Quit;

end;

procedure TFr_entrada.RomaneiodeTransfernciadeMercadoria1Click(Sender: TObject);
begin
  if PrNr_documento.Text = '' then
  begin
    dao.msg('Localize um Nota Primeiro!');
    Exit;
  end;
  Monta_romaneio;
end;

procedure TFr_entrada.Abrir_entrada(nr_documento, cod_fornecedor,
  cod_fiscal: string);
var
  cmd, cod_fiscal_ori: string;
begin
  try
    if not(dao.cn.InTransaction) then
      dao.cn.StartTransaction;

    cod_fiscal_ori := cod_fiscal;
    cod_fiscal := copy(trim(Prcod_fiscal.Text), 1, 1);
    { **** }

    dao.Execsql('update entrada1 set ent_fechada = ' + QuotedStr('N') +
      ' where nr_documento=' + QuotedStr(nr_documento) + ' and cod_fornecedor='
      + QuotedStr(cod_fornecedor));
    dao.cn.Commit;

    if (cod_fiscal_ori = '1102') or (cod_fiscal_ori = '2102') then
    begin
      ativa_cp1(q_entrada1.fieldbyname('nr_documento').AsString,
        q_entrada1.fieldbyname('cod_fornecedor').AsString);
    end;


    sb_entrada.Panels[0].Text := 'NOTA ABERTA';
    DBGrid1.Enabled := true;
    // dao.msg('Nota Aberta com Sucesso!');
  except
    on e: Exception do
    begin
      dao.cn.Rollback;
      dao.msg('Houve um erro ao tentar Reabrir Está Nota !' + #13 + #13 +
        e.Message);
    end;
  end;
end;

procedure TFr_entrada.ReabrirNota1Click(Sender: TObject);
begin

  if PrNr_documento.Text = '' then
  begin
    dao.msg('Você Deve Selecionar uma Nota para Reabrir!');
    Exit;
  end;

  if Prcod_fiscal.Text = '5152' then
  begin
    dao.Geral1('select rom_enviado from entrada1 where nr_documento=' +
      QuotedStr(PrNr_documento.Text) + ' and cod_fornecedor=' +
      QuotedStr(Prcod_fornecedor.Text));
    if dao.Q1.RecordCount >= 1 then
      if dao.Q1.fieldbyname('rom_enviado').AsString = 'S' then
      begin
        dao.msg('Este Romaneio não pode mais ser Reaberto porque já foi enviado para a loja de destino'
          + #13 + 'Crie um novo romaneio para o destino!');
        Exit;
      end;
  end;

  dao.Geral1('select ent_fechada from entrada1 where nr_documento=' +
    QuotedStr(PrNr_documento.Text) + ' and cod_fornecedor=' +
    QuotedStr(Prcod_fornecedor.Text));
  if dao.Q1.fieldbyname('ent_fechada').AsString = 'N' then
  begin
    dao.msg('A Nota não está Fechada!');
    Exit;
  end;

  if MessageDlg('Deseja Reabrir o Nota?', mtConfirmation, [mbyes, mbno], 0) = mryes
  then
  begin
    Application.CreateForm(TFr_senha_especial, Fr_senha_especial);
    Fr_senha_especial.nivel := '2';
    Fr_senha_especial.ShowModal;
    if liberado then
      Abrir_entrada(PrNr_documento.Text, Prcod_fornecedor.Text,
        Prcod_fiscal.Text);

  end;
end;

procedure TFr_entrada.Btgrava_cp1Click(Sender: TObject);
var
  valor: string;
  valor_c: real;
  i, posic: Integer;
begin
  try
    if not(dao.cn.InTransaction) then
      (dao.cn.StartTransaction);
    dao.update('cp1', 'id', Cpid.Text, 'Cp', Fr_entrada);
    dao.cn.Commit;
    ativa_cp1(PrNr_documento.Text, Prcod_fornecedor.Text);
    dao.msg('Alterações Gravadas com Sucesso!');
  except
    on e: Exception do
    begin
      dao.cn.Rollback;
      dao.msg('Houve um erro ao gravar Alterações no grid do Contas a Pagar!' +
        #13 + e.Message);
{      dao.envia_email_suporte(e.Message + #13 + 'Data: ' + dao.DtaSerStr + #13 +
        'Usuario Logado:' + nom_usuario,
        'Erro ao gravar os dados no grid do cp1 form entradas',
        'informatica@plasfan.ind.br', '', '', '');}
    end;
  end;
end;

procedure TFr_entrada.Prfrete_separadoClick(Sender: TObject);
begin
  // if Prvl_frete.Value > 0 then
  // if Prfrete_separado.Checked then
  // Prvl_total.Value:= Prvl_total.Value - Prvl_frete.Value;
end;

procedure TFr_entrada.atualiza_preco_venda;
var
  preco_venda, lucro, impostos, ipi, geral, custo, custo_total: real;
begin
  q_entrada2.first;
  if not(dao.cn.InTransaction) then
    dao.cn.StartTransaction;
  while not(q_entrada2.eof) do
  begin
    preco_venda := 0;
    lucro := 0;

    impostos := 0;
    geral := 0;

    custo := q_entrada2.fieldbyname('custo').AsFloat;

    dao.Geral1
      ('select cod_produto, lucro, geral, impostos, ipi, custo from produto where cod_produto='
      + QuotedStr(q_entrada2.fieldbyname('cod_produto').AsString));

    if dao.Q1.fieldbyname('ipi').AsFloat <> 0 then
      ipi := custo * (dao.Q1.fieldbyname('ipi').AsFloat / 100);

    if dao.Q1.fieldbyname('impostos').AsFloat <> 0 then
      impostos := custo * (dao.Q1.fieldbyname('impostos').AsFloat / 100);

    if dao.Q1.fieldbyname('geral').AsFloat <> 0 then
      geral := (custo + ipi + impostos) *
        (dao.Q1.fieldbyname('geral').AsFloat / 100);

    custo_total := custo + geral + ipi + impostos;

    if dao.Q1.fieldbyname('lucro').AsFloat <> 0 then
      lucro := custo_total +
        (custo_total * (dao.Q1.fieldbyname('lucro').AsFloat / 100));

    preco_venda := lucro;

    dao.Execsql('update produto set ' + 'preco_venda=' +
      QuotedStr(Fmfun.prepara_valor(floattostr(preco_venda))) + ', ' + 'custo='
      + QuotedStr(Fmfun.prepara_valor(floattostr(custo))) +
      ' where cod_produto=' + QuotedStr(q_entrada2.fieldbyname('cod_produto')
      .AsString));
    q_entrada2.next;
  end;
end;

procedure TFr_entrada.zzPreco_venda_atualizarExit(Sender: TObject);
begin
  if area_atuacao <> '3' then
  begin
    if (Prcod_fiscal.Text = '2102') or (Prcod_fiscal.Text = '1102') or
      (Prcod_fiscal.Text = '12') then
    begin
      if BtAlt.Enabled = false then
      begin
        try
          if not(dao.cn.InTransaction) then
            dao.cn.StartTransaction;
          dao.Execsql('update produto set preco_venda=' +
            QuotedStr(Fmfun.prepara_valor
            (floattostr(zzPreco_venda_atualizar.Value))) + ' where cod_produto='
            + QuotedStr(Emcod_produto.Text));
          dao.cn.Commit;
        except
          dao.cn.Rollback;
        end;
      end;
    end;
  end;
end;

procedure TFr_entrada.Xb_produtoItems12Click(Sender: TObject);
begin
  if BtNov.Enabled = false then
  begin
    Prcod_fiscal.Text := '12';
    Lbnom_cod_fiscal.Caption :=
      'Entrada de Mercadoria sem Gerar Contas a Pagar';
    Prempresa_destino.Enabled := false;
    Prnr_romaneio.Enabled := false;
    Gbcp1.Enabled := false;
    //Xb_produto.Collapsed := true;
  end;
end;

procedure TFr_entrada.SgCp1ClickCell(Sender: TObject; ARow, ACol: Integer);
begin
  if (ACol = 7) or (ACol = 5) or (ACol = 6) or (ACol = 1) or (ACol = 2) then
    //SgCp1.Col := 3

end;

procedure TFr_entrada.EspelhodeNotacomPreodeCustoeVenda1Click(Sender: TObject);
begin
  Monta_espelho_nota;
end;

procedure TFr_entrada.Monta_espelho_nota;
var
  Excel: Variant;
  nom_arquivo: string;
  Linha: Integer;
  cod_produto: string;
  ac_qtd, ac_preco, ac_custo: real;
begin
  dao.Geral1
    ('select e2.id_cor, e2.id_tamanho, e2.qtd_entrada, e2.sub_total, e2.cod_produto, p.nom_produto, p.custo, p.preco_venda, t.tamanho,c.cor from entrada2 e2 '
    + 'left join tamanho t on t.id=e2.id_tamanho ' +
    'left join cores c on c.id=e2.id_cor ' +
    'left join produto p on p.cod_produto=e2.cod_produto ' +
    'where e2.nr_documento=' + QuotedStr(q_entrada1.fieldbyname('nr_documento')
    .AsString) + ' and e2.cod_fornecedor=' +
    QuotedStr(q_entrada1.fieldbyname('cod_fornecedor').AsString) +
    ' order by e2.cod_produto');

  DeleteFile(ExtractFilePath(ParamStr(0)) + 'temporario\espelho_nota.xls');
  Excel := CreateOleObject('Excel.Application');
  Excel.WorkBooks.open(ExtractFilePath(ParamStr(0)) +
    'Relatorios\espelho_nota.xls');
  Excel.Visible := false;

  Excel.WorkBooks[1].sheets[1].cells[2, 2] := PrNr_documento.Text;
  Excel.WorkBooks[1].sheets[1].cells[2, 5] := FormatDateTime('dd/mm/yyyy',
    Prdta_documento.Date);
  // Excel.WorkBooks[1].Sheets[1].Cells[3,2]:= LbEmpresa.Caption;
  // Excel.WorkBooks[1].Sheets[1].Cells[4,2]:= Lbempresa_destino.Caption;
  Excel.WorkBooks[1].sheets[1].cells[5, 2] := Probs_nota1.Text;
  Excel.WorkBooks[1].sheets[1].cells[6, 2] := Probs_nota2.Text;
  Excel.WorkBooks[1].sheets[1].cells[7, 2] := Probs_nota3.Text;

  dao.Q1.first;
  Excel.WorkBooks[1].sheets[1].cells[9, 2] :=
    dao.Q1.fieldbyname('nom_produto').AsString;
  cod_produto := dao.Q1.fieldbyname('cod_produto').AsString;
  Linha := 11;

  while not(dao.Q1.eof) do
  begin
    if cod_produto <> dao.Q1.fieldbyname('cod_produto').AsString then
    begin
      Linha := Linha + 2;
      Excel.WorkBooks[1].sheets[1].cells[Linha, 1] := 'Produto:';
      Excel.WorkBooks[1].sheets[1].cells[Linha, 2] :=
        dao.Q1.fieldbyname('nom_produto').AsString;
      cod_produto := dao.Q1.fieldbyname('cod_produto').AsString;
      Linha := Linha + 1;
      Excel.WorkBooks[1].sheets[1].cells[Linha, 1] := 'Cor';
      Excel.WorkBooks[1].sheets[1].cells[Linha, 3] := 'Tamanho';
      Excel.WorkBooks[1].sheets[1].cells[Linha, 5] := 'Qtd';
      Excel.WorkBooks[1].sheets[1].cells[Linha, 6] := 'Custo';
      Excel.WorkBooks[1].sheets[1].cells[Linha, 7] := 'Total Custo';
      Excel.WorkBooks[1].sheets[1].cells[Linha, 8] := 'Venda';
      Excel.WorkBooks[1].sheets[1].cells[Linha, 9] := 'Total Venda';

      Linha := Linha + 1;
    end;
    Excel.WorkBooks[1].sheets[1].cells[Linha, 1] :=
      dao.Q1.fieldbyname('cor').AsString;
    Excel.WorkBooks[1].sheets[1].cells[Linha, 3] :=
      dao.Q1.fieldbyname('tamanho').AsString;
    Excel.WorkBooks[1].sheets[1].cells[Linha, 5] :=
      dao.Q1.fieldbyname('qtd_entrada').AsString;
    Excel.WorkBooks[1].sheets[1].cells[Linha, 6] :=
      FormatFloat('###,##0.00', dao.Q1.fieldbyname('custo').AsFloat);
    Excel.WorkBooks[1].sheets[1].cells[Linha, 7] :=
      FormatFloat('###,##0.00', dao.Q1.fieldbyname('custo').AsFloat *
      dao.Q1.fieldbyname('qtd_entrada').AsFloat);
    Excel.WorkBooks[1].sheets[1].cells[Linha, 8] :=
      FormatFloat('###,##0.00', dao.Q1.fieldbyname('preco_venda').AsFloat);
    Excel.WorkBooks[1].sheets[1].cells[Linha, 9] :=
      FormatFloat('###,##0.00', dao.Q1.fieldbyname('preco_venda').AsFloat *
      dao.Q1.fieldbyname('qtd_entrada').AsFloat);

    Linha := Linha + 1;
    ac_qtd := ac_qtd + dao.Q1.fieldbyname('qtd_entrada').AsFloat;
    ac_preco := ac_preco + (dao.Q1.fieldbyname('preco_venda').AsFloat *
      dao.Q1.fieldbyname('qtd_entrada').AsFloat);
    ac_custo := ac_custo + (dao.Q1.fieldbyname('custo').AsFloat *
      dao.Q1.fieldbyname('qtd_entrada').AsFloat);

    dao.Q1.next;
  end;
  Linha := Linha + 1;
  Excel.WorkBooks[1].sheets[1].cells[Linha, 1] := 'Qtd Total de Peças:';
  Excel.WorkBooks[1].sheets[1].cells[Linha, 3] := ac_qtd;

  Excel.WorkBooks[1].sheets[1].cells[Linha, 5] := 'Total Custo :';
  Excel.WorkBooks[1].sheets[1].cells[Linha, 6] :=
    FormatFloat('###,##0.00', ac_custo);

  // SALVA O DOCUMENTO
  nom_arquivo := 'romaneio' + '.xls';

  Excel.WorkBooks[1].SaveAs(ExtractFilePath(ParamStr(0)) +
    'temporario\espelho_nota.xls');
  Excel.Visible := true;
  // Excel.WorkBooks[1].Close(0);

  { if chamou = 'imprimir' then
    begin
    Excel.Visible := false;

    //mz if PrintDialog1.Execute then
    //mz begin
    //mz    MSWord.ActiveDocument.PrintOut(Copies := PrintDialog1.Copies);
    //mz    MessageDlg('Aguarde o término da impressão ...', mtInformation, [mbOk], 0);
    //mz end;

    Excel.Workooks[1].Close(0);
    Excel.Quit;
    end;

    if chamou = 'visualizar' then
    Excel.Visible:= true;

    if chamou = 'enviar' then
    begin
    Excel.Visible := false;
    Excel.WorkBooks[1].Close(0);
    Excel.Quit;

    arquivo:= nom_arquivo;
    assunto:= 'Quadro Final - ' + EDnr_relatorio.Text + ' - ' + lbl_nom_segurado.Caption;

    dm.SQL(Self, 'Query1', 'select email_analista from analista where cod_analista = "' + EDcod_analista.Text + '"');

    Application.CreateForm(TF_manda_email, F_manda_email);
    F_manda_email.mail1:= Query1.FieldByName('email_analista').AsString;

    F_manda_email.analista:= lbl_nom_analista.Caption;
    F_manda_email.relatorio:= EDnr_relatorio.Text;
    F_manda_email.sinistro:= EDnr_produto.Text + ' - ' + EDnr_protocolo.Text;
    F_manda_email.segurado:= lbl_nom_segurado.Caption;

    F_manda_email.ShowModal;
    F_manda_email.Free;
    end; }

  // Excel.Workooks[1].Close(0);
  // Excel.Quit;

end;

procedure TFr_entrada.Xb_produtoItems13Click(Sender: TObject);
begin
  if BtNov.Enabled = false then
  begin
    Prcod_fiscal.Text := '5152';
    Lbnom_cod_fiscal.Caption :=
      'Transferência de Mercadoria de FILIAL para FILIAL';
    Prempresa_destino.Enabled := true;
    Gbcp1.Enabled := false;
    //Xb_produto.Collapsed := true;

  end;

end;

procedure TFr_entrada.envia_romaneio_mercadoria_lojas(cod_empresa: string);
begin
  try
    //if not(dao.cn_net.InTransaction) then
      dao.cn_net.StartTransaction;
    if not(dao.cn.InTransaction) then
      dao.cn.StartTransaction;

    dao.Configura_CN_NET(cod_empresa);

    dao.Geral1_NET
      ('select nr_documento, cod_fornecedor from romaneio1 where nr_documento='
      + QuotedStr(PrNr_documento.Text) + ' and cod_fornecedor=' +
      QuotedStr(Prcod_fornecedor.Text));


    if dao.q1_net.RecordCount <= 0 then
    begin
      dao.Execsql_NET
        ('insert into romaneio1 (nr_documento, cod_fornecedor, dta_documento, cod_fiscal, vl_frete, vl_outros, total_mercadorias, vl_total,'
        + 'obs_nota1, obs_nota2, obs_nota3, rom_fechado, cod_empresa, cod_transportadora, nr_romaneio) values ('
        + QuotedStr(PrNr_documento.Text) + ',' +
        QuotedStr(Prcod_fornecedor.Text) + ',' +
        QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_documento.Date)) + ',' +
        QuotedStr(Prcod_fiscal.Text) + ',' +
        QuotedStr(Fmfun.prepara_valor(Prvl_frete.Text)) + ',' +
        QuotedStr(Fmfun.prepara_valor(Prvl_outros.Text)) + ',' +
        QuotedStr(Fmfun.prepara_valor(Prtot_itens.Text)) + ',' +
        QuotedStr(Fmfun.prepara_valor(Prvl_total.Text)) + ',' +
        QuotedStr(Probs_nota1.Text) + ',' + QuotedStr(Probs_nota2.Text) + ',' +
        QuotedStr(Probs_nota3.Text) + ',' + QuotedStr('N') + ',' +
        QuotedStr(cod_empresa) + ',' + QuotedStr(Prcod_transportadora.Text) +
        ',' + QuotedStr(PrNr_documento.Text) + ')');

      dao.Geral1('select * from entrada2 where nr_documento=' +
        QuotedStr(PrNr_documento.Text) + ' and cod_fornecedor=' +
        QuotedStr(Prcod_fornecedor.Text));
      dao.Q1.first;
      while not(dao.Q1.eof) do
      begin
        dao.Geral3('select grade from produto where cod_produto=' +
          QuotedStr(dao.Q1.fieldbyname('cod_produto').AsString));
        if dao.q3.fieldbyname('grade').AsString = '0' then
        begin
          dao.Execsql2_NET
            ('insert into romaneio2 (nr_documento, cod_fornecedor, cod_produto, qtd_entrada, id_cor, id_tamanho) values ('
            + QuotedStr(PrNr_documento.Text) + ',' +
            QuotedStr(Prcod_fornecedor.Text) + ',' +
            QuotedStr(dao.Q1.fieldbyname('cod_produto').AsString) + ',' +
            QuotedStr(Fmfun.prepara_valor(dao.Q1.fieldbyname('qtd_entrada')
            .AsString)) + ',' + QuotedStr(dao.Q1.fieldbyname('id_cor').AsString)
            + ',' + QuotedStr(dao.Q1.fieldbyname('id_tamanho').AsString) + ')')
        end
        else
        begin
          dao.Execsql2_NET
            ('insert into romaneio2 (nr_documento, cod_fornecedor, cod_produto, qtd_entrada) values ('
            + QuotedStr(PrNr_documento.Text) + ',' +
            QuotedStr(Prcod_fornecedor.Text) + ',' +
            QuotedStr(dao.Q1.fieldbyname('cod_produto').AsString) + ',' +
            QuotedStr(Fmfun.prepara_valor(dao.Q1.fieldbyname('qtd_entrada')
            .AsString)) + ')');
        end;

        dao.Q1.next;
      end;

      // envia os cod_Barras dos Produtos da nota
      dao.Geral1('select * from entrada2 where nr_documento=' +
        QuotedStr(PrNr_documento.Text) + ' and cod_fornecedor=' +
        QuotedStr(Prcod_fornecedor.Text));
      dao.Q1.first;
      while not(dao.Q1.eof) do
      begin

        // envia os Produtos
        dao.Geral1_NET('select cod_produto from produto where cod_produto = ' +
          QuotedStr(dao.Q1.fieldbyname('cod_produto').AsString));
        if dao.q1_net.RecordCount <= 0 then
        begin
          dao.Geral2('select * from produto where cod_produto=' +
            QuotedStr(dao.Q1.fieldbyname('cod_produto').AsString));

          dao.Execsql_NET
            ('insert into produto (cod_produto, nom_produto, cod_grupo, unidade, qtd_embalagem, ref_fabrica, observacao, origem_mercadoria, '
            + 'trib_icms, custo, lucro, preco_venda, grade, fornecedor_principal) values ('
            + QuotedStr(dao.q2.fieldbyname('cod_produto').AsString) + ',' +
            QuotedStr(dao.q2.fieldbyname('nom_produto').AsString) + ',' +
            QuotedStr(dao.q2.fieldbyname('cod_grupo').AsString) + ',' +
            QuotedStr(dao.q2.fieldbyname('unidade').AsString) + ',' +
            QuotedStr(dao.q2.fieldbyname('qtd_embalagem').AsString) + ',' +
            QuotedStr(dao.q2.fieldbyname('ref_fabrica').AsString) + ',' +
            QuotedStr(dao.q2.fieldbyname('observacao').AsString) + ',' +
            QuotedStr(dao.q2.fieldbyname('origem_mercadoria').AsString) + ',' +
            QuotedStr(dao.q2.fieldbyname('trib_icms').AsString) + ',' +
            QuotedStr(dao.q2.fieldbyname('custo').AsString) + ',' +
            QuotedStr(dao.q2.fieldbyname('lucro').AsString) + ',' +
            QuotedStr(dao.q2.fieldbyname('preco_venda').AsString) + ',' +
            QuotedStr(dao.q2.fieldbyname('grade').AsString) + ',' +
            QuotedStr(dao.q2.fieldbyname('fornecedor_principal')
            .AsString) + ')');

        end;
        // final Produtos

        // envia os cod_barras
        dao.Geral2('select * from cod_barras where cod_produto=' +
          QuotedStr(dao.Q1.fieldbyname('cod_produto').AsString));
        while not(dao.q2.eof) do
        begin
          dao.Geral3_NET('select cod_barras from cod_barras where cod_barras=' +
            QuotedStr(dao.q2.fieldbyname('cod_barras').AsString));
          if dao.q3_net.RecordCount <= 0 then
            dao.Execsql2_NET
              ('insert into cod_barras (id, cod_barras, cod_produto, data) values ('
              + QuotedStr(dao.q2.fieldbyname('id').AsString) + ',' +
              QuotedStr(dao.q2.fieldbyname('cod_barras').AsString) + ',' +
              QuotedStr(dao.q2.fieldbyname('cod_produto').AsString) + ',' +
              QuotedStr(FormatDateTime('dd.mm.yyyy', dao.q2.fieldbyname('data')
              .AsDateTime)) + ')');

          dao.q2.next;
        end;
        // final cod_barras

        // envia os grade
        dao.Geral4('select * from grade where cod_produto=' +
          QuotedStr(dao.Q1.fieldbyname('cod_produto').AsString));
        while not(dao.Q4.eof) do
        begin
          dao.Geral3_NET('select * from grade where cod_produto=' +
            QuotedStr(dao.Q4.fieldbyname('cod_produto').AsString) +
            ' and id_cor=' + QuotedStr(dao.Q4.fieldbyname('id_cor').AsString) +
            ' and id_tamanho=' + QuotedStr(dao.Q4.fieldbyname('id_tamanho')
            .AsString));

          if dao.q3_net.RecordCount <= 0 then
            dao.Execsql2_NET
              ('insert into grade (id, cod_produto, id_cor, id_tamanho) values ('
              + QuotedStr(dao.Q4.fieldbyname('id').AsString) + ',' +
              QuotedStr(dao.Q4.fieldbyname('cod_produto').AsString) + ',' +
              QuotedStr(dao.Q4.fieldbyname('id_cor').AsString) + ',' +
              QuotedStr(dao.Q4.fieldbyname('id_tamanho').AsString) + ')');

          dao.Q4.next;
        end;
        // final grade

        // atualiza preco_venda mercadorias
        dao.Geral2('select preco_venda from produto where cod_produto=' +
          QuotedStr(dao.Q1.fieldbyname('cod_produto').AsString));
        if dao.q2.fieldbyname('preco_venda').AsFloat <> 0 then
          dao.Execsql_NET('update produto set preco_venda=' +
            QuotedStr(Fmfun.prepara_valor(dao.q2.fieldbyname('preco_venda')
            .AsString)) + ' where cod_produto=' +
            QuotedStr(dao.Q1.fieldbyname('cod_produto').AsString));

        dao.Q1.next;
      end;

      dao.Execsql('update entrada1 set rom_enviado=' + QuotedStr('S') +
        ' where nr_documento=' + QuotedStr(PrNr_documento.Text) +
        ' and cod_fornecedor=' + QuotedStr(Prcod_fornecedor.Text));
      dao.cn_net.Commit;
      dao.cn.Commit;
    end;
  except
    on e: Exception do
    begin
      dao.cn_net.Rollback;
      dao.cn.Rollback;

      dao.msg('Não foi possivel enviar o Romaneio para a Loja de destino' + #13
        + 'Nº documento=' + PrNr_documento.Text + #13 + e.Message);

{      dao.envia_email_suporte(e.Message + #13 + 'Data: ' + dao.DtaSerStr + #13 +
        'Usuario Logado:' + nom_usuario, 'Erro ao Enviar Romaneio ',
        'claudioplasfan@gmail.com', '', '', '');}
    end;
  end;

end;

procedure TFr_entrada.Xb_produtoExit(Sender: TObject);
begin
  if (PrNr_documento.Text <> '') and (Prcod_fornecedor.Text <> '') and
    (modo_insert = true) then
  begin
    ver_num_entrada(PrNr_documento.Text, Prcod_fornecedor.Text, '0');
  end;

end;

procedure TFr_entrada.ransferirMercadoriasparaLojaDestino1Click
  (Sender: TObject);
begin
  if Prcod_fiscal.Text = '5152' then
  begin
    dao.Geral1('select rom_enviado from entrada1 where nr_documento=' +
      QuotedStr(PrNr_documento.Text) + ' and cod_fornecedor=' +
      QuotedStr(Prcod_fornecedor.Text));
    if dao.Q1.fieldbyname('rom_enviado').AsString = 'N' then
    begin
      Application.ProcessMessages;
      Application.ProcessMessages;

      envia_romaneio_mercadoria_lojas(Prempresa_destino.Text);

      Application.ProcessMessages;
    end;
  end;
end;

procedure TFr_entrada.busca_romaneio_lanca(nr_romaneio: string);
begin
  dao.Geral1('select * from romaneio1 where nr_documento=' +
    QuotedStr(Prnr_romaneio.Text) + ' and cod_fornecedor= ' +
    QuotedStr(Prcod_fornecedor.Text) + ' and rom_fechado=' + QuotedStr('S'));

  if dao.Q1.RecordCount <= 0 then
  begin
    Prcod_transportadora.Text :=
      dao.Q1.fieldbyname('cod_transportadora').AsString;
    Prtot_itens.Text := dao.Q1.fieldbyname('total_mercadorias').AsString;

    dao.Geral3
      ('select a.ID, a.NR_DOCUMENTO, a.COD_FORNECEDOR, a.COD_PRODUTO, a.QTD_ENTRADA, a.CUSTO, a.SUB_TOTAL, a.ID_COR, a.ID_TAMANHO, a.COD_COLECAO, p.nom_produto, p.grade from romaneio2 a '
      + 'left join produto p on p.cod_produto = a.cod_produto ' +
      'where a.nr_documento = ' + QuotedStr(Prnr_romaneio.Text) +
      ' and a.cod_fornecedor=' + QuotedStr(Prcod_fornecedor.Text));
    dao.q3.first;
    while not(dao.q3.eof) do
    begin
      if dao.q3.fieldbyname('grade').AsString = '0' then
      begin
        dao.Execsql
          ('insert into entrada2 (nr_documento, cod_fornecedor, cod_produto, qtd_entrada, id_cor, id_tamanho) values ('
          + QuotedStr(PrNr_documento.Text) + ',' +
          QuotedStr(Prcod_fornecedor.Text) + ',' +
          QuotedStr(dao.q3.fieldbyname('cod_produto').AsString) + ',' +
          QuotedStr(Fmfun.prepara_valor(dao.q3.fieldbyname('qtd_entrada')
          .AsString)) + ',' + QuotedStr(dao.q3.fieldbyname('id_cor').AsString) +
          ',' + QuotedStr(dao.q3.fieldbyname('id_tamanho').AsString) + ')');
      end
      else
      begin
        dao.Execsql
          ('insert into entrada2 (nr_documento, cod_fornecedor, cod_produto, qtd_entrada) values ('
          + QuotedStr(PrNr_documento.Text) + ',' +
          QuotedStr(Prcod_fornecedor.Text) + ',' +
          QuotedStr(dao.q3.fieldbyname('cod_produto').AsString) + ',' +
          QuotedStr(Fmfun.prepara_valor(dao.q3.fieldbyname('qtd_entrada')
          .AsString)) + ')');

      end;
      insere_reg_sgPro_romaneio('1');
      dao.q3.next;
    end;

    dao.Execsql('update romaneio1 set rom_fechado=' + QuotedStr('S') +
      ' where nr_documento=' + QuotedStr(nr_romaneio));
  end
  else
  begin
    showmessage('Não foi Possivel buscar esse Romaneio, possiveis causas!' + #13
      + 'O Romaneio não foi transferido de sua Origem' + #13 +
      'O Romaneio já foi Recebido no destino!');

  end;

end;

procedure TFr_entrada.insere_reg_sgPro_romaneio(tipo: string);
begin
end;

procedure TFr_entrada.Prnr_romaneioExit(Sender: TObject);
begin
  if Prnr_romaneio.Text <> '9999' then
  begin
    if (PrNr_documento.Text <> '') and (Prcod_fornecedor.Text <> '') then
      if (Prnr_romaneio.Text <> '') then
        busca_romaneio_lanca(Prnr_romaneio.Text);
  end;
end;

procedure TFr_entrada.EmcustoEnter(Sender: TObject);
begin
  if (Prcod_fiscal.Text = '5152') or (Prcod_fiscal.Text = '1') then
  begin
    SelectNext(Sender as TWinControl, true, true);
  end;
end;

procedure TFr_entrada.zzPreco_venda_atualizarEnter(Sender: TObject);
begin
  if (Prcod_fiscal.Text = '5152') or (Prcod_fiscal.Text = '5915') or
    (Prcod_fiscal.Text = '6915') or (Prcod_fiscal.Text = '5914') or
    (Prcod_fiscal.Text = '6914') or (Prcod_fiscal.Text = '5202') or
    (Prcod_fiscal.Text = '6202') or (Prcod_fiscal.Text = '1') then
  begin
    SelectNext(Sender as TWinControl, true, true);
  end;

end;

procedure TFr_entrada.PrempresaButtonClick(Sender: TObject);
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
  chamou_form := 'fr_entrada_empresa_pertence';
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

procedure TFr_entrada.PrempresaKeyPress(Sender: TObject; var Key: Char);
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
    if (Prempresa.Text = '') and (BtNov.Enabled = false) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Empresa';
      chamou_pesquisa := 'fr_empresa';
      chamou_form := 'fr_entrada_empresa_pertence';
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
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;

  end;

end;

procedure TFr_entrada.PrempresaExit(Sender: TObject);
begin
  if trim(Prempresa.Text) = '' then
    Lbempresa_pertence.Caption := '...';

  if Prempresa.Text <> '' then
  begin
    dao.Geral2('select nom_empresa from empresa where cod_empresa=' +
      QuotedStr(Prempresa.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbempresa_pertence.Caption := dao.q2.fieldbyname('nom_empresa').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prempresa.Text := '';
      Prempresa.SetFocus;
      Exit;
    end;

  end;

end;

procedure TFr_entrada.Prempresa_destinoExit(Sender: TObject);
begin
  if trim(Prempresa_destino.Text) = '' then
    Lbempresa_destino.Caption := '...';

  if Prempresa_destino.Text <> '' then
  begin
    dao.Geral2('select nom_empresa from empresa where cod_empresa=' +
      QuotedStr(Prempresa_destino.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbempresa_destino.Caption := dao.q2.fieldbyname('nom_empresa').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prempresa_destino.Text := '';
      Prempresa_destino.SetFocus;
      Exit;
    end;
  end;

end;

procedure TFr_entrada.Prcod_transportadoraExit(Sender: TObject);
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

procedure TFr_entrada.Emid_corExit(Sender: TObject);
begin
  if Emid_cor.Text <> '' then
  begin
    dao.Geral2('select cor from cores where id=' + QuotedStr(Emid_cor.Text));
    if dao.q2.RecordCount > 0 then
    begin
      LbCor.Caption := dao.q2.fieldbyname('cor').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Emid_cor.Text := '';
      Emid_cor.SetFocus;
      Exit;
    end;

  end;

end;

procedure TFr_entrada.Emid_TamanhoExit(Sender: TObject);
begin
  if Emid_Tamanho.Text <> '' then
  begin
    dao.Geral2('select tamanho from tamanho where id=' +
      QuotedStr(Emid_Tamanho.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbtamanho.Caption := dao.q2.fieldbyname('tamanho').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Emid_Tamanho.Text := '';
      Emid_Tamanho.SetFocus;
      Exit;
    end;

  end;

end;

procedure TFr_entrada.Monta_NF(nr_documento, cod_fornecedor, cfop: string);
var
  cod_fiscal: string;
  uf, MNUMDUP: string;
  icm: real;
  MCOL, LH, ultima_nf: Integer;
  MNUMNOT: string;
  i, Y, CTPAR, MLETRA, CTPGT, MDIAVEN, MQTDPRO, MCTNOT: Integer;
  MVLRPAR, MNEWVLR, MVLRDIF, MQTDNOT, MDIVCOM: real;
  numero, a, b, c: real;
  a1, b1, c1: string;
  ver_nota: TFDQuery;
  base_calculo_icm, vlr_icm, vlr_ipi, valor_agregado: real;
  base_calculo_ST, vlr_icm_ST, vlr_ipi_ST: real;
  modelo_empresa: string; // marca o tipo de empresa se é super simples ou epp
begin
  dao.Geral1
    ('select a.NR_DOCUMENTO, a.COD_FORNECEDOR, a.DTA_DOCUMENTO, a.COD_FISCAL, a.VL_FRETE, a.VL_OUTROS, a.BASE_ICMS, '
    + 'a.VALOR_ICMS, a.TOTAL_IPI, a.BASE_CALCULO_ICMS_SUBST, a.VALOR_ICMS_SUBST, a.VALOR_SEGURO, a.TOTAL_MERCADORIAS, a.VL_TOTAL, '
    + 'a.TOT_ITENS, a.QTD_PARCELAS, a.COD_FOP, a.OBS_NOTA1, a.OBS_NOTA2, a.OBS_NOTA3, a.ENT_FECHADA, a.COD_EMPRESA, '
    + 'a.COD_TRANSPORTADORA, a.FRETE_SEPARADO, a.EMPRESA_DESTINO, a.NR_ROMANEIO, a.NOTA_FISCAL, a.ROM_ENVIADO, a.EMPRESA, a.VOLUME, a.PODE_ENVIAR, a.COD_CLIENTE, '
    + 'f.razao_social, f.endereco, f.bairro, f.cep, f.fone, f.fax, f.cnpcpf as cnpjfor, f.ierg as iefor, f.tipo_empresa, '
    + 'cf.nom_cidade as nomcidfor, cf.uf, t.nome as nom_transportadora, t.cnpj as cnpjtra, t.ie as ietra, t.endereco as endtra, '
    + 't.placa, ctr.nom_cidade as nomcidtra, ctr.uf as uftra  from entrada1 a '
    + 'left join fornecedor f on f.cod_fornecedor= a.cod_fornecedor ' +
    'left join cidades cf on cf.cod_cidade=f.cod_cidade ' +
    'left join transportadora t on t.cod_transportadora = a.cod_transportadora '
    + 'left join cidades ctr on ctr.cod_cidade = t.cod_cidade ' +
    'where a.nr_documento=' + QuotedStr(nr_documento) + ' and a.cod_fornecedor='
    + QuotedStr(cod_fornecedor));

  dao.Geral2
    ('select e2.cod_produto, p.nom_produto, sum(e2.qtd_entrada) as qtdent, p.custo, sum(e2.sub_total) as subtotal ,'
    + 'p.trib_icms, p.ipi, p.unidade,p.icms from entrada2 e2 ' +
    'left join produto p on p.cod_produto= e2.cod_produto ' +
    'where e2.nr_documento=' + QuotedStr(nr_documento) +
    ' and e2.cod_fornecedor=' + QuotedStr(cod_fornecedor) +
    'group by e2.cod_produto, p.nom_produto,e2.qtd_entrada, p.custo, ' +
    'p.trib_icms, p.ipi, p.unidade,p.icms');

  // dao.Geral2('select e2.*, p.nom_produto, p.custo, p.trib_icms, p.ipi, p.unidade from entrada2 e2 '+
  // 'left join produto p on p.cod_produto= e2.cod_produto '+
  // 'where e2.nr_documento='+QuotedStr(nr_documento)+' and e2.cod_fornecedor='+QuotedStr(cod_fornecedor));

  // VERIFICAR SE O NUMERO DA NOTA J[A NÁO FOI USADO

  modelo_empresa := dao.Q1.fieldbyname('tipo_empresa').AsString;
  uf := dao.Q1.fieldbyname('uf').AsString;

  if (cod_fiscal = '5202') or (cod_fiscal = '6202') then
  begin
    if verifica_substituicao_tributaria(nr_documento, cod_fornecedor) = '2' then
    begin
      if uf = 'SC' then
        cod_fiscal := '5202/5411'
      else
        cod_fiscal := '6202/6411';
    end;

    if verifica_substituicao_tributaria(nr_documento, cod_fornecedor) = '1' then
    begin
      if (uf = 'SC') then
        cod_fiscal := '5202'
      else
        cod_fiscal := '6202';
    end;
  end;
  if verifica_substituicao_tributaria(nr_documento, cod_fornecedor) = '3' then
  begin
    if (uf = 'SC') then
      cod_fiscal := '5411'
    else
      cod_fiscal := '6411';
  end;

  if uf = 'SC' then // descobrir qual icms
    icm := 17
  else if (uf = 'MG') or (uf = 'PR') or (uf = 'RJ') or (uf = 'RS') or (uf = 'SP')
  then
    icm := 12
  else
    icm := 7;

  MQTDPRO := dao.q2.RecordCount;
  MQTDNOT := MQTDPRO / 14;
  numero := MQTDNOT;
  a := 100 * numero;
  a1 := floattostr(a);
  // edit1.text:=a1;
  c1 := copy(trim(a1), 2, 2);
  if c1 <> '00' then
  begin
    c := int(numero) + 1;
    MQTDNOT := c;
  end
  else
    MQTDNOT := int(numero);
  MCTNOT := 1;

  // ***** IMPRESSÃO DA NOTA  ********

  RD.Abrir;

  // *****************CORPO DA NOTA****************************
  dao.q2.first;
  LH := 23;
  while not(dao.q2.eof) do
  begin
    if LH > 37 then
    begin
      if MCTNOT < MQTDNOT then
        RD.ImpF(51, 01, 'FOLHA ' + inttostr(MCTNOT) + '\' + floattostr(MQTDNOT)
          + ' CONTINUA PROXIMO FORMULARIO...', [comp17]);
      LH := 23;
      MCTNOT := MCTNOT + 1;
      RD.Novapagina;
    end;

    RD.ImpF(LH, 10, dao.q2.fieldbyname('cod_produto').AsString, [comp17]);
    RD.ImpF(LH, 24, dao.q2.fieldbyname('nom_produto').AsString, [comp17]);
    RD.ImpF(LH, 78, dao.q2.fieldbyname('trib_icms').AsString, [comp17]);
    RD.ImpF(LH, 84, dao.q2.fieldbyname('unidade').AsString, [comp17]);
    RD.impD(LH, 99, FormatFloat('###,##0.00', dao.q2.fieldbyname('qtdent')
      .AsFloat), [comp17]);
    RD.impD(LH, 113, FormatFloat('###,##0.00', dao.q2.fieldbyname('custo')
      .AsFloat), [comp17]);
    RD.impD(LH, 129, FormatFloat('###,##0.00', dao.q2.fieldbyname('subtotal')
      .AsFloat), [comp17]);
    if modelo_empresa <> '1' then
      RD.impD(LH, 138, FormatFloat('###,##0.00', icm), [comp17]);

    // RDIMPNOT.impd(lh,140,formatfloat('###,##0.00',DMREL.QUNOTNE1.fieldbyname('vlripi').AsFloat),[comp17]);
    base_calculo_icm := base_calculo_icm + dao.q2.fieldbyname
      ('subtotal').AsFloat;
    vlr_ipi := vlr_ipi + dao.q2.fieldbyname('ipi').AsFloat;
    vlr_icm := vlr_icm + (dao.q2.fieldbyname('subtotal').AsFloat * (icm / 100));

    if dao.q2.fieldbyname('trib_icms').AsString = '8' then // SUBSTITUIÇÃO TRIB
    begin
      base_calculo_ST := base_calculo_ST + dao.q2.fieldbyname
        ('subtotal').AsFloat;
      vlr_icm_ST := (base_calculo_ST * (dao.q2.fieldbyname('icms')
        .AsFloat / 100));
    end;
    LH := LH + 1;
    dao.q2.next;

    if LH = 59 then
      break;
  end;
  // if (MCTNOT=2) and (i=1) then continue;

  // BASE CÁLCULO ICMS
  if modelo_empresa <> '0' then
    RD.impD(39, 30, FormatFloat('###,##0.00', base_calculo_icm), [comp17]);
  // VLR DO ICMS
  if modelo_empresa <> '0' then
    RD.impD(39, 50, FormatFloat('###,##0.00', vlr_icm), [comp17]);

  // **********************CÁLCULO DO IMPOSTO ***********************
  if (verifica_substituicao_tributaria(nr_documento, cod_fornecedor) = '2') or
    (verifica_substituicao_tributaria(nr_documento, cod_fornecedor) = '3') then
  begin

    // BASE CÁLCULO SUBSTITUIÇÃO TRIBUTARIA
    base_calculo_ST := base_calculo_ST + (base_calculo_ST * (44 / 100));
    // base_calculo_ST:= base_calculo_ST + vlr_icm_ST;
    RD.impD(39, 74, FormatFloat('###,##0.00', base_calculo_ST), [comp17]);

    // VALOR ICMS SUBSTITUIÇÃO TRIBUTARIA
    RD.impD(39, 101, FormatFloat('###,##0.00',
      (base_calculo_ST * (dao.q2.fieldbyname('icms').AsFloat / 100)) -
      vlr_icm_ST), [comp17]);
  end;
  // VALOR TOTAL DOS PRODUTOS
  RD.impD(38, 132, FormatFloat('###,##0.00', dao.Q1.fieldbyname('vl_total')
    .AsFloat), [comp17]);

  // ipi
  if (verifica_substituicao_tributaria(nr_documento, cod_fornecedor) = '2') or
    (verifica_substituicao_tributaria(nr_documento, cod_fornecedor) = '3') then
    RD.impD(41, 107, FormatFloat('###,##0.00', vlr_ipi), [comp17]);

  // VALOR TOTAL DA NOTA
  RD.impD(39, 132, FormatFloat('###,##0.00', dao.Q1.fieldbyname('vl_total')
    .AsFloat + vlr_ipi + ((base_calculo_ST * (dao.q2.fieldbyname('icms').AsFloat
    / 100)) - vlr_icm_ST)), [comp17]);

  // ****************TRANSPORTADORA*******************************
  // NOME /RAZÃO SOCIAL
  RD.ImpF(43, 10, dao.Q1.fieldbyname('nom_transportadora').AsString, [comp17]);

  // frete por conta
  RD.ImpF(43, 88, '1', [comp17]);

  // placa do veiculo
  RD.ImpF(43, 98, dao.Q1.fieldbyname('placa').AsString, [comp17]);

  // uf
  RD.ImpF(43, 101, dao.Q1.fieldbyname('uftra').AsString, [comp17]);

  // cnpj transportadora
  RD.ImpF(43, 116, dao.Q1.fieldbyname('cnpjtra').AsString, [comp17]);

  // endereço
  RD.ImpF(45, 10, dao.Q1.fieldbyname('endtra').AsString, [comp17]);

  // MUNICIPIO
  // RDIMPNOT.impf(46,72,DMREL.QUTRANE1NOMCID.AsString,[comp17]);

  // INSCRIÇÃO ESTADUAL
  RD.ImpF(45, 116, dao.Q1.fieldbyname('ietra').AsString, [comp17]);

  // VOLUME DO PEDIDO
  RD.ImpF(47, 26, dao.Q1.fieldbyname('volume').AsString, [comp17]);

  // ESPÉCIE
  RD.ImpF(47, 31, 'VOLUMES', [comp17]);

  // MARCA
  // RDIMPNOT.imp(76,50,'X',[comp17]);

  // PESO BRUTO
  // RD.impVAL(48,103,'###,##0.00',dao.Q1.fieldbyname('PESPED').AsFloat,[comp17]);

  // PESO LIQUIDO
  // RD.impVAL(48,114,'###,##0.00',dao.Q1.fieldbyname('PESPED').AsFloat,[comp17]);

  // ********INFORMAÇÕES ADICIONAIS*************************
  RD.ImpF(50, 10, 'Documento emitido por EPP optante pelo Simples Nacional e',
    [comp17]);
  RD.ImpF(51, 10, 'não gera direito a crédito fiscal de ICMS.', [comp17]);

  // mudei por ultimo     if (verifica_substituicao_tributaria(nr_documento, cod_fornecedor)= '1') then
  // 20/10/2009     RD.impf(54,10,'Base de Calculo='+ FormatFloat('###,##0.00', dao.Q1.fieldbyname('base_icms').AsFloat)+' - Vlr ICMS= '+formatfloat('###,##0.00', dao.Q1.fieldbyname('vl_total').AsFloat*(icm/100)),[comp17]);

  RD.ImpF(52, 10, dao.Q1.fieldbyname('obs_nota1').AsString, [comp17]);
  RD.ImpF(53, 10, dao.Q1.fieldbyname('obs_nota2').AsString, [comp17]);

  dao.Geral4('select ultima_nf from configuracao where cod_conf=' +
    QuotedStr('1'));
  RD.ImpF(63, 128, dao.Q4.fieldbyname('ultima_nf').AsString, [comp17]);

  // RDIMPNOT.impf(51,15,'EMPRESA OPTANTE PELO SIMPLES CF. REGIME ANEXO IV DO RICMS/SC',[comp17]);

  RD.Fechar;
  // ****** acabou a impressão da nota *******
  try
    if not(dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    // dao.Execsql('update configuracao set ultima_nf = ultima_nf + 1 where cod_conf='+QuotedStr('1'));
    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;
end;

function TFr_entrada.verifica_substituicao_tributaria(numdoc,
  codfor: string): string;
var
  tipo: string; // 1=sem ST   - 2=tem com ST e tbm sem ST   - 3=somente ST
begin
  tipo := '0';
  dao.Geral4('select p.cod_produto, p.trib_icms from entrada2 e2 ' +
    'left join produto p on p.cod_produto=e2.cod_produto ' +
    'where e2.nr_documento=' + QuotedStr(numdoc) + ' and e2.cod_fornecedor= ' +
    QuotedStr(codfor) + ' and trib_icms = ' + QuotedStr('00'));
  if dao.Q4.RecordCount > 0 then
    tipo := '1';

  dao.Geral4('select p.cod_produto, p.trib_icms from entrada2 e2 ' +
    'left join produto p on p.cod_produto=e2.cod_produto ' +
    'where e2.nr_documento=' + QuotedStr(numdoc) + ' and cod_fornecedor=' +
    QuotedStr(codfor) + ' and trib_icms = ' + QuotedStr('60'));
  if dao.Q4.RecordCount > 0 then
  begin
    if tipo = '1' then
      tipo := '2'
    else
      tipo := '3';
  end;
  Result := tipo

end;

procedure TFr_entrada.gsdfg1Click(Sender: TObject);
var
  ultima_nf: Integer;
begin
  if MessageDlg('Deseja Imprimir a Nota Fiscal?', mtConfirmation, [mbyes, mbno],
    0) = mryes then
  begin
    dao.Geral4('select ultima_nf from configuracao where cod_conf=' +
      QuotedStr('1'));
    ultima_nf := dao.Q4.fieldbyname('ultima_nf').AsInteger;
    ultima_nf := ultima_nf + 1;
    try
      if not(dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      dao.Execsql('update configuracao set ultima_nf=' +
        QuotedStr(inttostr(ultima_nf)));
      dao.cn.Commit;
      Monta_NF(PrNr_documento.Text, Prcod_fornecedor.Text, Prcod_fiscal.Text);
    except
      dao.cn.Rollback;
    end;
  end;
end;

procedure TFr_entrada.RDNewPage(Sender: TObject; Pagina: Integer);
var
  MCOL, maccr1, mtotcr1: Integer;
begin
  // SAIDA DA NOTA
  RD.ImpF(03, 93, 'X', [comp17]);

  dao.Geral4('select ultima_nf from configuracao where cod_conf=' +
    QuotedStr('1'));
  RD.ImpF(03, 118, dao.Q4.fieldbyname('ultima_nf').AsString, [comp17]);

  RD.ImpF(08, 10, Lbnom_cod_fiscal.Caption, [comp17]);

  // NATUREZA OPERAÇÃO
  RD.ImpF(08, 46, Prcod_fiscal.Text, [comp17]);
  // NOME FORNECEDOR
  RD.ImpF(11, 10, dao.Q1.fieldbyname('cod_fornecedor').AsString + '/ ' +
    dao.Q1.fieldbyname('razao_social').AsString, [comp17]);
  // CNPJ
  // rd.impF(11,87,dao.Q1.FieldByName('cpf').AsString,[comp17]);
  RD.ImpF(11, 87, dao.Q1.fieldbyname('cnpjfor').AsString, [comp17]);
  // DTA EMISSÃO
  // if copy(datetostr(DMREL.QUNOTNE1DTADOC.VALUE),7,4) <> '1899' then
  RD.ImpF(11, 124, datetostr(now), [comp17]);

  // endereço
  RD.ImpF(13, 10, dao.Q1.fieldbyname('endereco').AsString, [comp17]);

  // bairro
  RD.ImpF(13, 74, dao.Q1.fieldbyname('bairro').AsString, [comp17]);
  // cep
  RD.ImpF(13, 111, dao.Q1.fieldbyname('cep').AsString, [comp17]);

  // data saida / entrada
  RD.ImpF(13, 124, datetostr(now), [comp17]);

  // municip
  RD.ImpF(15, 10, dao.Q1.fieldbyname('nomcidfor').AsString, [comp17]);
  RD.ImpF(15, 60, dao.Q1.fieldbyname('fone').AsString, [comp17]);
  // uf
  RD.ImpF(15, 84, dao.Q1.fieldbyname('uf').AsString, [comp17]);
  // ie

  // rd.impf(23,86,DMREL.QUNOTPE1NUMIDE.AsString,[comp17]);
  RD.ImpF(15, 90, dao.Q1.fieldbyname('ieRG').AsString, [comp17]);

end;

procedure TFr_entrada.Xb_produtoItems14Click(Sender: TObject);
begin
  if BtNov.Enabled = false then
  begin
    Prcod_fiscal.Text := '5918';
    Lbnom_cod_fiscal.Caption := 'Dev. Merc. Consignada Estadual';
    Prempresa_destino.Enabled := false;
    Gbcp1.Enabled := false;
    //Xb_produto.Collapsed := true;
  end;
end;

procedure TFr_entrada.Xb_produtoItems15Click(Sender: TObject);
begin
  if BtNov.Enabled = false then
  begin
    Prcod_fiscal.Text := '6918';
    Lbnom_cod_fiscal.Caption := 'Dev. Merc. Consignada Inter-Estadual';
    Prempresa_destino.Enabled := false;
    Gbcp1.Enabled := false;
    //Xb_produto.Collapsed := true;
  end;

end;

function TFr_entrada.verifica_linha_branco_grid: Boolean;
begin
end;

procedure TFr_entrada.habilitaCamposAreaAtuacao(CodAtuacao: string);
begin
  if CodAtuacao = '0' then // comercio de vestuarios
  begin
    { Emqtd_entrada.DecimalPlaces := 2;
      Emqtd_entrada.DisplayFormat := '0.00'
      / }
  end
  else if CodAtuacao = '3' then // distribuidora
  begin
    paAtributo.Visible := false;
    Lbcolecao.Visible := false;
    { Emqtd_entrada.DecimalPlaces := 3;
      Emqtd_entrada.DisplayFormat := '0.000' }
  end;
end;

procedure TFr_entrada.FormClick(Sender: TObject);
begin
  // if not (dao.cn.InTransaction) then dao.cn.StartTransaction;
  // if Prpode_enviar.Checked then
  // dao.Execsql('update entrada1 set pode_enviar='+QuotedStr('S')+' where nr_documento='+QuotedStr(PrNr_documento.Text)+' and cod_fornecedor='+QuotedStr(Prcod_fornecedor.Text));
end;

procedure TFr_entrada.ZZpode_enviarClick(Sender: TObject);
begin
  if (PrNr_documento.Text <> '') and (Prcod_fornecedor.Text <> '') then
  begin
    try
      if not(dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      if ZZpode_enviar.Checked then
        dao.Execsql('update entrada1 set pode_enviar=' + QuotedStr('S') +
          ' where nr_documento=' + QuotedStr(PrNr_documento.Text) +
          ' and cod_fornecedor=' + QuotedStr(Prcod_fornecedor.Text))
      else
        dao.Execsql('update entrada1 set pode_enviar=' + QuotedStr('N') +
          ' where nr_documento=' + QuotedStr(PrNr_documento.Text) +
          ' and cod_fornecedor=' + QuotedStr(Prcod_fornecedor.Text));
      dao.cn.Commit;
    except
      dao.cn.Rollback;
    end;
  end;
end;

procedure TFr_entrada.MontaImpostosNota;
var
  uf: string;
  icms: real;
begin
  dao.Geral1('select cod_fornecedor, c.uf from fornecedor f ' +
    'left join cidades c on c.cod_cidade=f.cod_cidade ' +
    'where cod_fornecedor=' + QuotedStr(Prcod_fornecedor.Text));

  if dao.Q1.fieldbyname('UF').AsString = '' then
  begin
    dao.msg('Fornecedor não tem cidade cadastrada no cadastro!');
    Exit;
  end;
  uf := dao.Q1.fieldbyname('uf').AsString;
  dao.Geral2('select * from uf where uf=' + QuotedStr(uf));

  icms := dao.q2.fieldbyname('icms').AsFloat;

  Prbase_icms.Value := Prtotal_mercadorias.Value;
  Prvalor_icms.Value := Prtotal_mercadorias.Value * (icms / 100);
end;

procedure TFr_entrada.BtnNFEClick(Sender: TObject);
var
  NodePai, NodeFilho, NodeSec, NodeFat, NodeDup, NodeTmp, NodeAux: IXMLNode;
  data: Tdate;
  data_arr, arquivo: TStringList;
  produto, duplicata: string;
  sequencia, item, parcelas: Integer;
  procedure AjustaXML(arquivoxml: string);
  begin
    arquivo := TStringList.Create;

    arquivo.LoadFromFile(arquivoxml);
    arquivo.Text := stringreplace(arquivo.Text, '&amp;', 'e', [rfReplaceAll]);
    arquivo.Text := stringreplace(arquivo.Text, 'Õ', 'O', [rfReplaceAll]);
    arquivo.Text := stringreplace(arquivo.Text, '&amp;quo;', '',
      [rfReplaceAll]);
    arquivo.Text := stringreplace(arquivo.Text, 'ï»¿', '', [rfReplaceAll]);
    arquivo.Text := stringreplace(arquivo.Text, #13#10 + ' ', '',
      [rfReplaceAll]);
    arquivo.Text := stringreplace(arquivo.Text, '‡', 'C', [rfReplaceAll]);
    arquivo.Text := stringreplace(arquivo.Text, 'A§A£', 'cao', [rfReplaceAll]);
    arquivo.Text := stringreplace(arquivo.Text, 'A­', 'i', [rfReplaceAll]);
    arquivo.Text := stringreplace(arquivo.Text, '‰', '', [rfReplaceAll]);
    arquivo.Text := stringreplace(arquivo.Text, '', '', [rfReplaceAll]);
    arquivo.Text := stringreplace(arquivo.Text, 'A©', 'e', [rfReplaceAll]);
    arquivo.Text := stringreplace(arquivo.Text, 'A', 'I', [rfReplaceAll]);
    arquivo.Text := stringreplace(arquivo.Text, 'A²', 'a', [rfReplaceAll]);
    arquivo.Text := stringreplace(arquivo.Text, 'oo', 'o', [rfReplaceAll]);
    arquivo.Text := stringreplace(arquivo.Text, 'Ç', 'C', [rfReplaceAll]);
    arquivo.Text := stringreplace(arquivo.Text, 'Ã', 'A', [rfReplaceAll]);
    arquivo.Text := stringreplace(arquivo.Text, 'A‡Aƒ', 'CA', [rfReplaceAll]);
    arquivo.Text := stringreplace(arquivo.Text, 'ƒ', 'A', [rfReplaceAll]);
    arquivo.Text := stringreplace(arquivo.Text, 'AA', 'A', [rfReplaceAll]);
    arquivo.Text := Fmfun.AnsiToAscii(arquivo.Text, false);
    // ï»¿ ;
    arquivo.SaveToFile(DlgXml.FileName);
    arquivo.Free;
  end;

  procedure ConverterUnidade(unidade, id: string);
  begin
    dao.Geral5
      ('SELECT a.QUANT_UNID FROM PRODUTO_FORNECEDOR_UNIDADE a WHERE trim(A.UNIDADE) = '
      + QuotedStr(UpperCase(unidade)) + ' and a.produto_fornecedor_id = ' + id);
    if dao.Q5.IsEmpty then
    begin
      Application.CreateForm(TFr_produto_fornecedor_unidade,
        Fr_produto_fornecedor_unidade);
      Fr_produto_fornecedor_unidade.modo_insert := true;
      Fr_produto_fornecedor_unidade.unidade := unidade;
      Fr_produto_fornecedor_unidade.id := id;
      Fr_produto_fornecedor_unidade.ShowModal;
      if Fr_produto_fornecedor_unidade.ModalResult = mrok then
        dao.Geral5
          ('SELECT a.QUANT_UNID FROM PRODUTO_FORNECEDOR_UNIDADE a WHERE trim(A.UNIDADE) = '
          + QuotedStr(UpperCase(unidade)) +
          ' and a.produto_fornecedor_id = ' + id)
      else
        Exit;
    end;

    mmEntradas2QTD_ENTRADA.Value := mmEntradas2QTD_ENTRADA.Value *
      dao.Q5.fieldbyname('QUANT_UNID').AsFloat;
    mmEntradas2CUSTO.Value := mmEntradas2CUSTO.Value /
      dao.Q5.fieldbyname('QUANT_UNID').AsFloat;
    mmEntradas2CUSTO_PRO.Value := mmEntradas2CUSTO_PRO.Value /
      dao.Q5.fieldbyname('QUANT_UNID').AsFloat;
  end;

begin

  importar_xml := true;
  // busca xml;

  DlgXml.Execute;

  // XMLGeral.DOMVendor := GetDOMVendor('Open XML');
  XMLGeral.Active := true;
  XMLGeral.Encoding := 'iso-8859-1';

  try
    XMLGeral.LoadFromFile(DlgXml.FileName);
  except
    AjustaXML(DlgXml.FileName);
    XMLGeral.LoadFromFile(DlgXml.FileName);
  end;


  // Carrega xml;
  BtNovClick(self);
  NodePai := XMLGeral.DocumentElement.childNodes.first.childNodes.first.
    childNodes.FindNode('ide');

  if NodePai = nil then
    NodePai := XMLGeral.DocumentElement.childNodes.first.childNodes.
      FindNode('ide');

  PrNr_documento.Text := NodePai.childNodes.FindNode('nNF').Text;
  PrTIPO_NF.Checked := true;

  data_arr := TStringList.Create;

  if NodePai.childNodes.FindNode('dEmi') <> nil then
    data_arr := Fmfun.Explode(NodePai.childNodes.FindNode('dEmi').Text, '-')
  else
    data_arr := Fmfun.Explode(NodePai.childNodes.FindNode('dhEmi').Text, '-');

  Prdta_documento.Date := strtodate(copy(data_arr[2], 1, 2) + '/' + data_arr[1]
    + '/' + data_arr[0]);
  data_arr.Free;

  NodePai := XMLGeral.DocumentElement.childNodes.first.childNodes.first.
    childNodes.FindNode('total');

  if NodePai = nil then
    NodePai := XMLGeral.DocumentElement.childNodes.first.childNodes.
      FindNode('total');

  NodeSec := NodePai.childNodes.FindNode('ICMSTot');

  Prvl_frete.Text := stringreplace(NodeSec.childNodes.FindNode('vFrete')
    .NodeValue, '.', ',', [rfReplaceAll]);
  Prbase_icms.Text := stringreplace(NodeSec.childNodes.FindNode('vBC')
    .NodeValue, '.', ',', [rfReplaceAll]);
  Prvalor_icms.Text := stringreplace(NodeSec.childNodes.FindNode('vICMS')
    .NodeValue, '.', ',', [rfReplaceAll]);
  Prbase_calculo_icms_subst.Text :=
    stringreplace(NodeSec.childNodes.FindNode('vBCST').NodeValue, '.', ',',
    [rfReplaceAll]);
  Prvalor_icms_subst.Text := stringreplace(NodeSec.childNodes.FindNode('vST')
    .NodeValue, '.', ',', [rfReplaceAll]);
  Prvalor_seguro.Text := stringreplace(NodeSec.childNodes.FindNode('vSeg')
    .NodeValue, '.', ',', [rfReplaceAll]);
  Prvl_outros.Text := stringreplace(NodeSec.childNodes.FindNode('vOutro')
    .NodeValue, '.', ',', [rfReplaceAll]);
  Prtotal_ipi.Text := stringreplace(NodeSec.childNodes.FindNode('vIPI')
    .NodeValue, '.', ',', [rfReplaceAll]);

  PrDesconto.Text := stringreplace(NodeSec.childNodes.FindNode('vDesc')
    .NodeValue, '.', ',', [rfReplaceAll]);

  Prvl_total.Text := stringreplace(NodeSec.childNodes.FindNode('vNF').NodeValue,
    '.', ',', [rfReplaceAll]);
  Prtotal_mercadorias.Text := stringreplace(NodeSec.childNodes.FindNode('vProd')
    .NodeValue, '.', ',', [rfReplaceAll]);

  NodePai := XMLGeral.DocumentElement.childNodes.first.childNodes.first.
    childNodes.FindNode('emit');

  if NodePai = nil then
    NodePai := XMLGeral.DocumentElement.childNodes.first.childNodes.
      FindNode('emit');

  // Checa Fornecedor
  dao.Geral1('select * from fornecedor f where cnpcpf =' +
    QuotedStr(copy(NodePai.childNodes.FindNode('CNPJ').NodeValue, 1, 2) + '.' +
    copy(NodePai.childNodes.FindNode('CNPJ').NodeValue, 3, 3) + '.' +
    copy(NodePai.childNodes.FindNode('CNPJ').NodeValue, 6, 3) + '/' +
    copy(NodePai.childNodes.FindNode('CNPJ').NodeValue, 9, 4) + '-' +
    copy(NodePai.childNodes.FindNode('CNPJ').NodeValue, 13, 2)));
  if not dao.Q1.IsEmpty then
  begin
    Prcod_fornecedor.Text := dao.Q1.fieldbyname('cod_fornecedor').AsString;
    if not ver_num_entrada(PrNr_documento.Text, Prcod_fornecedor.Text, '0') then
    begin
      CancelarNota;
      Exit;
    end
    else
      Prcod_fornecedorExit(self);
  end
  else
  begin
    try
      Application.CreateForm(TFr_fornecedor, Fr_fornecedor);
      Fr_fornecedor.xml_nfe := true;
      Fr_fornecedor.xml_razao_socia := NodePai.childNodes.FindNode('xNome')
        .NodeValue;

      if NodePai.childNodes.FindNode('xFant') <> nil then
        Fr_fornecedor.xml_nome_fantasia := NodePai.childNodes.FindNode('xFant')
          .NodeValue;

      NodeFilho := NodePai.childNodes.FindNode('enderEmit');
      Fr_fornecedor.xml_endereco := NodeFilho.childNodes.FindNode('xLgr')
        .NodeValue;
      Fr_fornecedor.xml_nr := NodeFilho.childNodes.FindNode('nro').NodeValue;
      Fr_fornecedor.xml_bairro := NodeFilho.childNodes.FindNode('xBairro')
        .NodeValue;
      Fr_fornecedor.xml_cidade := NodeFilho.childNodes.FindNode('xMun')
        .NodeValue;
      Fr_fornecedor.xml_uf := NodeFilho.childNodes.FindNode('UF').NodeValue;

      if NodeFilho.childNodes.FindNode('CEP') <> nil then
        Fr_fornecedor.xml_cep := NodeFilho.childNodes.FindNode('CEP').NodeValue;

      if NodeFilho.childNodes.FindNode('fone') <> nil then
        Fr_fornecedor.xml_fone := NodeFilho.childNodes.FindNode('fone')
          .NodeValue;

      Fr_fornecedor.xml_ie := NodePai.childNodes.FindNode('IE').NodeValue;
      Fr_fornecedor.xml_cnpj := copy(NodePai.childNodes.FindNode('CNPJ')
        .NodeValue, 1, 2) + '.' + copy(NodePai.childNodes.FindNode('CNPJ')
        .NodeValue, 3, 3) + '.' + copy(NodePai.childNodes.FindNode('CNPJ')
        .NodeValue, 6, 3) + '/' + copy(NodePai.childNodes.FindNode('CNPJ')
        .NodeValue, 9, 4) + '-' + copy(NodePai.childNodes.FindNode('CNPJ')
        .NodeValue, 13, 2);
      Fr_fornecedor.ShowModal;
      if Fr_fornecedor.ModalResult = mrok then
      begin
        Prcod_fornecedor.Text := Fr_fornecedor.Prcod_fornecedor.Text;
        Prcod_fornecedorExit(self);
      end;
    finally
      Fr_fornecedor.Free;
    end;

  end;

  NodePai := XMLGeral.DocumentElement.childNodes.first.childNodes.first.
    childNodes.FindNode('transp');
  if NodePai = nil then
    NodePai := XMLGeral.DocumentElement.childNodes.first.childNodes.FindNode
      ('transp');

  NodeSec := NodePai.childNodes.FindNode('transporta');
  if NodeSec <> nil then
  begin
    if NodeSec.childNodes.FindNode('CNPJ') <> nil then
    begin
      if (NodeSec.childNodes.FindNode('xNome').NodeValue <> 'MESMO') and
        (NodeSec.childNodes.FindNode('xNome').NodeValue <> 'O MESMO') and
        (NodeSec.childNodes.FindNode('xNome').NodeValue <> 'CLIENTE RETIRA') and
        (NodeSec.childNodes.FindNode('xNome').NodeValue <> 'EMITENTE - O MESMO')
      then
      begin
        // Checa Transportadora
        dao.Geral1('select * FROM TRANSPORTADORA a where a.CNPJ =' +
          QuotedStr(copy(NodeSec.childNodes.FindNode('CNPJ').NodeValue, 1,
          2) + '.' + copy(NodeSec.childNodes.FindNode('CNPJ').NodeValue, 3,
          3) + '.' + copy(NodeSec.childNodes.FindNode('CNPJ').NodeValue, 6,
          3) + '/' + copy(NodeSec.childNodes.FindNode('CNPJ').NodeValue, 9,
          4) + '-' + copy(NodeSec.childNodes.FindNode('CNPJ')
          .NodeValue, 13, 2)));
        if not dao.Q1.IsEmpty then
          Prcod_transportadora.Text :=
            dao.Q1.fieldbyname('cod_transportadora').AsString
        else
        begin
          try
            Application.CreateForm(TFr_Transportadora, Fr_Transportadora);
            Fr_Transportadora.xml_nfe := true;
            Fr_Transportadora.xml_razao_socia :=
              NodeSec.childNodes.FindNode('xNome').NodeValue;
            if NodeSec.childNodes.FindNode('xEnder') <> nil then
              Fr_Transportadora.xml_endereco :=
                NodeSec.childNodes.FindNode('xEnder').NodeValue;
            if NodeSec.childNodes.FindNode('xMun') <> nil then
              Fr_Transportadora.xml_cidade := NodeSec.childNodes.FindNode
                ('xMun').NodeValue;
            if NodeSec.childNodes.FindNode('UF') <> nil then
              Fr_Transportadora.xml_uf := NodeSec.childNodes.FindNode('UF')
                .NodeValue;
            if NodeSec.childNodes.FindNode('IE') <> nil then
              Fr_Transportadora.xml_ie := NodeSec.childNodes.FindNode('IE')
                .NodeValue;
            if NodeSec.childNodes.FindNode('CNPJ') <> nil then
            begin
              Fr_Transportadora.xml_cnpj :=
                copy(NodeSec.childNodes.FindNode('CNPJ').NodeValue, 1, 2) + '.'
                + copy(NodeSec.childNodes.FindNode('CNPJ').NodeValue, 3, 3) +
                '.' + copy(NodeSec.childNodes.FindNode('CNPJ').NodeValue, 6, 3)
                + '/' + copy(NodeSec.childNodes.FindNode('CNPJ').NodeValue, 9,
                4) + '-' + copy(NodeSec.childNodes.FindNode('CNPJ')
                .NodeValue, 13, 2);
            end;

            Fr_Transportadora.ShowModal;
            if Fr_Transportadora.ModalResult = mrok then
            begin
              Prcod_transportadora.Text :=
                Fr_Transportadora.Prcod_transportadora.Text;
              Prcod_transportadoraExit(self);
            end;
          finally
            Fr_Transportadora.Free;
          end;
        end;
      end;
    end;
  end;

  // Checa Produto
  NodePai := XMLGeral.DocumentElement.childNodes.first.childNodes.first.
    childNodes.FindNode('det');
  if NodePai = nil then
    NodePai := XMLGeral.DocumentElement.childNodes.first.childNodes.
      FindNode('det');

  // Esse nó vai ser usado no LOOP
  NodeSec := NodePai;
  item := 0;
  // Posiciona o primeiro elemento encontrado
  NodeSec.childNodes.first;
  repeat
    // referencia a tag <prod> dentro de <det>
    NodeTmp := NodeSec.childNodes['prod'];
    // da pra ver que é um XML resumido da NFe (so temos uma tag <prod> para cada <det> então não precisaria da linha abaixo
    // agora se tivéssemos mais de uma seria o caso de posicionar também na primeira ocorrencia.
    // NodeTmp.ChildNodes.First;
    NodeTmp.childNodes.first;
    PcEntrada.ActivePage := TabSheet2;
    if NodeTmp.childNodes['xProd'].IsTextElement then
    begin
      BtNovEmClick(self);
      // pega os dados que vc quiser dentro da tag <prod>

      produto := NodeTmp.childNodes['xProd'].NodeValue;

      mmEntradas2QTD_ENTRADA.AsString :=
        stringreplace(NodeTmp.childNodes['qCom'].Text, '.', ',',
        [rfReplaceAll]);
      mmEntradas2CUSTO.AsString :=
        stringreplace(NodeTmp.childNodes['vUnCom'].Text, '.', ',',
        [rfReplaceAll]);
      mmEntradas2SUB_TOTAL.AsString :=
        stringreplace(NodeTmp.childNodes['vProd'].Text, '.', ',',
        [rfReplaceAll]);
      NodeAux := NodeSec.childNodes['imposto'];

      if NodeTmp.childNodes['cProd'].Text <> '' then
      begin
        if NodeAux.childNodes['ICMS'].childNodes['ICMS00'].childNodes['vICMS']
          <> nil then
          if NodeAux.childNodes['ICMS'].childNodes['ICMS00'].childNodes['vICMS']
            .NodeValue <> null then
            mmEntradas2VALOR_ICMS.AsString :=
              stringreplace(NodeAux.childNodes['ICMS'].childNodes['ICMS00']
              .childNodes['vICMS'].NodeValue, '.', ',', [rfReplaceAll]);

        if NodeAux.childNodes['ICMS'].childNodes['ICMS00'].childNodes['pICMS']
          <> nil then
          if NodeAux.childNodes['ICMS'].childNodes['ICMS00'].childNodes['pICMS']
            .NodeValue <> null then
            mmEntradas2ICMS.AsString :=
              stringreplace(NodeAux.childNodes['ICMS'].childNodes['ICMS00']
              .childNodes['pICMS'].NodeValue, '.', ',', [rfReplaceAll]);

        dao.Geral1
          ('SELECT a.ID, a.COD_PRODUTO, a.COD_FORNECEDOR, a.COD_PRODUTO_FORNECEDOR FROM PRODUTO_FORNECEDOR a WHERE a.COD_FORNECEDOR = '
          + Prcod_fornecedor.Text + ' AND A.COD_PRODUTO_FORNECEDOR =' +
          QuotedStr(NodeTmp.childNodes['cProd'].Text));
        if not dao.Q1.IsEmpty then
        begin
          mmEntradas2COD_PRODUTO.Text :=
            dao.Q1.fieldbyname('COD_PRODUTO').AsString;
          Emcod_produtoExit(self);
          ConverterUnidade(NodeTmp.childNodes['uCom'].Text,
            dao.Q1.fieldbyname('ID').AsString);
          BtgraEmClick(self);
        end
        else
        begin
          Application.CreateForm(Tfm_produto_fornecedor, fm_produto_fornecedor);
          fm_produto_fornecedor.produto_servico := servico;

          fm_produto_fornecedor.EmCOD_PRODUTO_FORNECEDOR.Text :=
            NodeTmp.childNodes['cProd'].Text;
          fm_produto_fornecedor.lbProdutoFornecedor.Caption :=
            NodeTmp.childNodes['xProd'].Text;
          fm_produto_fornecedor.EmCOD_PRODUTO_FORNECEDOR.Enabled := false;

          fm_produto_fornecedor.ShowModal;

          if fm_produto_fornecedor.ModalResult = mrok then
          begin
            Emcod_produto.Text := fm_produto_fornecedor.Emcod_produto.Text;
            mmEntradas2COD_PRODUTO.AsString := fm_produto_fornecedor.Emcod_produto.Text;
            dao.Exec_sql.sql.clear;
            dao.Exec_sql.sql.add
              ('INSERT INTO PRODUTO_FORNECEDOR (COD_PRODUTO, COD_FORNECEDOR, COD_PRODUTO_FORNECEDOR) VALUES ('
              + Emcod_produto.Text + ',' + Prcod_fornecedor.Text + ',' +
              QuotedStr(NodeTmp.childNodes['cProd'].Text) + ')');
            dao.Exec_sql.Execsql;

            dao.Geral1
              ('SELECT a.ID, a.COD_PRODUTO, a.COD_FORNECEDOR, a.COD_PRODUTO_FORNECEDOR FROM PRODUTO_FORNECEDOR a WHERE a.COD_FORNECEDOR = '
              + Prcod_fornecedor.Text + ' AND A.COD_PRODUTO_FORNECEDOR =' +
              QuotedStr(NodeTmp.childNodes['cProd'].Text));
            ConverterUnidade(NodeTmp.childNodes['uCom'].Text,
              dao.Q1.fieldbyname('ID').AsString);
            Emcod_produtoExit(self);
            BtgraEmClick(self);
            item := item + 1;
          end
          else
            CancelarItem;
        end;
      end
      else
        CancelarItem;

      NodeAux := NodeAux.NextSibling;
    end
    else
      produto := '';
    NodeTmp := NodeTmp.NextSibling;
    NodeSec := NodeSec.NextSibling;
  until produto = '';

  dao.Execsql('delete from cp1 where nr_documento=' +
    QuotedStr(PrNr_documento.Text) + ' and cod_fornecedor=' +
    QuotedStr(Prcod_fornecedor.Text));
  parcelas := 0;
  NodePai := XMLGeral.DocumentElement.childNodes.first.childNodes.first.
    childNodes.FindNode('cobr');
  if NodePai = nil then
    NodePai := XMLGeral.DocumentElement.childNodes.first.childNodes.
      FindNode('cobr');

  if NodePai <> nil then
  begin
    // Esse nó vai ser usado no LOOP
    NodeDup := NodePai;
    NodeDup.childNodes.first;
    sequencia := 0;
    NodeTmp := NodeDup.childNodes['dup'];
    NodeTmp.childNodes.first;
    repeat

      if (NodeTmp.childNodes['nDup'].Text <> '') and
        (NodeTmp.childNodes['vDup'].Text <> '') then
      begin
        sequencia := sequencia + 1;
        dao.Exec_sql.sql.clear;
        dao.Exec_sql.sql.add
          ('insert into cp1 (id_plano_contas, nr_documento, cod_fornecedor, titulo, sequencia, dtaven, valor, valor_pago, saldo_devedor)'
          + ' values (41,' + PrNr_documento.Text + ',' + Prcod_fornecedor.Text +
          ' , ' + QuotedStr(PrNr_documento.Text+'-'+NodeTmp.childNodes['nDup'].Text) + ',' +
          QuotedStr(inttostr(sequencia)) + ' , ' +
          QuotedStr(NodeTmp.childNodes['dVenc'].Text) + ' , ' +
          NodeTmp.childNodes['vDup'].Text + ' , ' + '0' + ',' + '0' + ')');
        dao.Exec_sql.Execsql;
        parcelas := parcelas + 1;
      end;

      NodeTmp := NodeTmp.NextSibling;
      // NodeDup := NodeDup.NextSibling;
    until NodeTmp = nil;
  end;

  NodePai := XMLGeral.DocumentElement.childNodes.first.childNodes.first.
    childNodes.FindNode('cobr');
  if NodePai = nil then
    NodePai := XMLGeral.DocumentElement.childNodes.first.childNodes.
      FindNode('cobr');

  if (NodePai <> nil) and (parcelas = 0) then
  begin
    // Esse nó vai ser usado no LOOP
    NodeFat := NodePai;
    parcelas := 0;
    NodeFat.childNodes.first;
    NodeTmp := NodeFat.childNodes['fat'];
    NodeTmp.childNodes.first;
    repeat
      if (NodeTmp.childNodes['nFat'].Text <> '') and
        (NodeTmp.childNodes['vLiq'].Text <> '') then
      begin
        dao.Exec_sql.sql.clear;
        dao.Exec_sql.sql.add
          ('insert into cp1 (id_plano_contas, nr_documento, cod_fornecedor, titulo, sequencia, dtaven, valor, valor_pago, saldo_devedor)'
          + ' values (41,' + PrNr_documento.Text + ',' + Prcod_fornecedor.Text +
          ' , ' + NodeTmp.childNodes['nFat'].Text + ',' + '0' + ' , ' +
          QuotedStr(FormatDateTime('dd.mm.yyyy', Prdta_documento.Date)) + ' , '
          + NodeTmp.childNodes['vLiq'].Text + ' , ' + '0' + ',' +
          QuotedStr('0') + ')');
        dao.Exec_sql.Execsql;
        parcelas := parcelas + 1;
      end;

      NodeTmp := NodeTmp.NextSibling;
    until NodeTmp = nil;
  end;

  PrQtd_parcelas.Value := parcelas;
  Prtot_itens.Value := item;
  ativa_cp1(PrNr_documento.Text, Prcod_fornecedor.Text);
end;

procedure TFr_entrada.Prcod_clienteButtonClick(Sender: TObject);
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
  chamou_form := 'fr_entrada_cliente';
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

procedure TFr_entrada.Prcod_clienteExit(Sender: TObject);
begin
  if trim(Prcod_cliente.Text) = '' then
    Lbnom_cliente.Caption := '...';
  if Prcod_cliente.Text <> '' then
  begin
    dao.Geral2
      ('select nom_cliente, cnpj, cd.nom_cidade, desconto_maximo, cd.uf, CASE WHEN c.IE = ''ISENTO'' THEN ''1'' ELSE CASE WHEN c.ie is null THEN ''2'' ELSE ''0'' END END AS ISENTO from cliente c '
      + 'left join cidades cd on cd.cod_cidade=c.cod_cidade ' +
      'where cod_cliente=' + QuotedStr(Prcod_cliente.Text));

    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_cliente.Caption := dao.q2.fieldbyname('nom_cliente').AsString;

      if (PrNr_documento.Text <> '') and (Prcod_cliente.Text <> '') and
        (modo_insert = true) then
        ver_num_entrada(PrNr_documento.Text, Prcod_cliente.Text, '1');

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


procedure TFr_entrada.btGraficoClick(Sender: TObject);
begin
  Fmfun.GraficoCusto(Emcod_produto.Text);
end;

procedure TFr_entrada.DBGrid1CellClick(Column: TColumn);
begin
  CarregaDadosProdutos(Emcod_produto.Text);
  CarregaFoto(mmEntradas2COD_PRODUTO.AsString);
end;

procedure TFr_entrada.DBGrid1Enter(Sender: TObject);
begin
  CarregaDadosProdutos(Emcod_produto.Text);
  CarregaFoto(mmEntradas2COD_PRODUTO.AsString);
end;

procedure TFr_entrada.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CarregaDadosProdutos(Emcod_produto.Text);
  CarregaFoto(mmEntradas2COD_PRODUTO.AsString);
end;

procedure TFr_entrada.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CarregaDadosProdutos(Emcod_produto.Text);
  CarregaFoto(mmEntradas2COD_PRODUTO.AsString);
end;

procedure TFr_entrada.EmVolumeKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in [',']) and (Pos(FORMATSETTINGS.DecimalSeparator, EmVolume.Text)
    <> 0) then
    Key := #0;
end;

procedure TFr_entrada.Emqtd_entradaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in [',']) and (Pos(FORMATSETTINGS.DecimalSeparator,
    Emqtd_entrada.Text) <> 0) then
    Key := #0;
end;

procedure TFr_entrada.EmcustoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in [',']) and (Pos(FORMATSETTINGS.DecimalSeparator, Emcusto.Text) <> 0)
  then
    Key := #0;
end;

procedure TFr_entrada.EmCusto_finalKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in [',']) and (Pos(FORMATSETTINGS.DecimalSeparator,
    EmCusto_final.Text) <> 0) then
    Key := #0;
end;

procedure TFr_entrada.EmIcmsKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in [',']) and (Pos(FORMATSETTINGS.DecimalSeparator, EmIcms.Text) <> 0)
  then
    Key := #0;
end;

procedure TFr_entrada.Emsub_totalKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in [',']) and (Pos(FORMATSETTINGS.DecimalSeparator, Emsub_total.Text)
    <> 0) then
    Key := #0;
end;

procedure TFr_entrada.PrQtd_parcelasEnter(Sender: TObject);
begin
  qtd_parcela := PrQtd_parcelas.AsInteger;
end;

procedure TFr_entrada.EmID_VEICULOExit(Sender: TObject);
begin
  if trim(EmID_VEICULO.Text) = '' then
    lbVeiculo.Caption := '...'
  else
  begin
    dao.Geral2('select placa from veiculos where id =' +
      QuotedStr(EmID_VEICULO.Text));
    if dao.q2.RecordCount > 0 then
      lbVeiculo.Caption := dao.q2.fieldbyname('placa').AsString
    else
    begin
      dao.msg('Registro não Encontrado!');
      EmID_VEICULO.Text := '';
      EmID_VEICULO.SetFocus;
      Exit;
    end;

  end;

end;

procedure TFr_entrada.EmID_VEICULOButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar veiculos';
  chamou_pesquisa := 'fr_veiculos';
  chamou_form := 'fr_entrada_veiculos';
  chamou_cadastro := 'fr_veiculos';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'veiculos';
  Fr_localizar.BT_cadastro.Visible := false;

  SetLength(Campos_combo, 4);
  Campos_combo[0] := 'Código';
  Campos_combo[1] := 'Nome do veiculo';
  Campos_combo[2] := 'Placa';
  Campos_combo[3] := 'Data de aquisição';

  for i := 0 to 3 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  if campo_pesquisado <> '' then
  begin
    Fr_localizar.CBcampos.ItemIndex := Fr_localizar.CBcampos.Items.IndexOf
      (campo_pesquisado);
    Fr_localizar.EDlocalizar.Text := dado_pesquisado;
    Fr_localizar.zzbusca_qualquer.Checked := busca_qualquer_posicao_pesquisada;
    Fr_localizar.loc_veiculos(Fr_localizar.EDlocalizar.Text);
  end;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_entrada.Emcod_produtoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F9 then
    Emcod_produtoButtonClick(self);
end;

procedure TFr_entrada.EmID_VEICULOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F9 then
    EmID_VEICULOButtonClick(self);
end;

procedure TFr_entrada.sbParcClick(Sender: TObject);
begin
  if not(dao.cn.InTransaction) then
    (dao.cn.StartTransaction);

  // if (Prcod_fiscal.Text = '1102') or (Prcod_fiscal.Text = '2102') then
  Faturar;

  dao.cn.Commit;

  ativa_cp1(PrNr_documento.Text, Prcod_fornecedor.Text);

end;

procedure TFr_entrada.Emqtd_entradaExit(Sender: TObject);
begin

  if (trim(Emqtd_entrada.Text) = '') or (trim(Emqtd_entrada.Text) = '0') then
  begin
    showmessage('Quantidade tem que ser preenchida.');
    Emqtd_entrada.SetFocus;
    Exit;
  end;

end;

procedure TFr_entrada.q_cp1AfterClose(DataSet: TDataSet);
begin
  dao.cn.Commit;
  frpri.HabilitaTimers;
end;

procedure TFr_entrada.q_cp1AfterScroll(DataSet: TDataSet);
begin
  Cpid.Text := q_cp1.fieldbyname('id').AsString;
  Cptitulo.Text := q_cp1.fieldbyname('titulo').AsString;
  Cpsequencia.Text := q_cp1.fieldbyname('sequencia').AsString;
  Cpdtaven.Date := q_cp1.fieldbyname('dtaven').AsDateTime;
  Cpvalor.Value := q_cp1.fieldbyname('valor').AsFloat;

  if trim(Cpid.Text) = '' then
    Btgrava_cp1.Enabled := false
  else
    Btgrava_cp1.Enabled := true;

end;

procedure TFr_entrada.q_cp1BeforeOpen(DataSet: TDataSet);
begin
  frpri.DesabilitaTimers;
end;

procedure TFr_entrada.Prvalor_icms_substExit(Sender: TObject);
begin
  SomaValorTotal;
end;

procedure TFr_entrada.Prtotal_ipiExit(Sender: TObject);
begin
  SomaValorTotal;
end;

end.


