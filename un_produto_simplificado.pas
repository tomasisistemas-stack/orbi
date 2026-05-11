unit un_produto_simplificado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sDBNavigator, ExtCtrls, sPanel, StdCtrls, Mask, DBCtrls,
  sDBEdit, sGroupBox, DB, sCheckBox, sMaskEdit,
  sCustomComboEdit, sCurrEdit, sCurrencyEdit, sLabel, sDBCheckBox, sEdit,
  acDBTextFX, sBevel, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  Tfrm_produtos_simplificado = class(TForm)
    sPanel1: TsPanel;
    DBNavProd: TsDBNavigator;
    sPanel2: TsPanel;
    gbDescricao: TsGroupBox;
    edDescricao: TsDBEdit;
    DSProduto: TDataSource;
    IBProduto: TFDTable;
    Pacusto_produto: TsPanel;
    Label24: TsLabel;
    Label38: TsLabel;
    Label25: TsLabel;
    Label39: TsLabel;
    Label26: TsLabel;
    Label41: TsLabel;
    Label35: TsLabel;
    Label42: TsLabel;
    LbPrecovenda: TsLabel;
    Label10: TsLabel;
    Label36: TsLabel;
    Label60: TsLabel;
    Label61: TsLabel;
    PrCusto: TsDBEdit;
    PrImpostos: TsDBEdit;
    Prgeral: TsDBEdit;
    PrLucro: TsDBEdit;
    Prcalcula_preco_automatic: TsdbCheckBox;
    Prpreco_venda: TsDBEdit;
    Pripi: TsDBEdit;
    PrCusto_Total: TsDBEdit;
    gpCodigo: TsGroupBox;
    sGroupBox1: TsGroupBox;
    edproduto: TsEdit;
    sBevel1: TsBevel;
    lbProduto: TsDBTextFX;
    ftdescricao: TsEdit;
    IBProdutocod_produto: TIntegerField;
    IBProdutonom_produto: TStringField;
    IBProdutocod_grupo: TIntegerField;
    IBProdutounidade: TStringField;
    IBProdutopeso: TBCDField;
    IBProdutoref_fabrica: TStringField;
    IBProdutocod_prateleira: TStringField;
    IBProdutoqtd_estoque: TBCDField;
    IBProdutoqtd_reservado: TBCDField;
    IBProdutoqtd_estoque_min: TBCDField;
    IBProdutoetiqueta_lin1: TStringField;
    IBProdutoetiqueta_lin2: TStringField;
    IBProdutoobservacao: TMemoField;
    IBProdutoorigem_mercadoria: TStringField;
    IBProdutotrib_icms: TStringField;
    IBProdutoipi: TBCDField;
    IBProdutocusto: TBCDField;
    IBProdutoimpostos: TBCDField;
    IBProdutogeral: TBCDField;
    IBProdutooutros: TBCDField;
    IBProdutolucro: TBCDField;
    IBProdutoavisar_prod_desat: TStringField;
    IBProdutoqtd_dias_desat: TSmallintField;
    IBProdutodta_ult_atualizacao: TDateField;
    IBProdutocusto_medio: TBCDField;
    IBProdutocusto_calculado: TBCDField;
    IBProdutocusto_atualizado: TBCDField;
    IBProdutoqtd_ult_entrada: TBCDField;
    IBProdutoqtd_ult_saida: TBCDField;
    IBProdutodta_ult_entrada: TDateField;
    IBProdutodta_ult_saida: TDateField;
    IBProdutoqtd_embalagem: TBCDField;
    IBProdutopreco_venda: TBCDField;
    IBProdutostatus: TStringField;
    IBProdutoestoque_minimo: TBCDField;
    IBProdutograde: TIntegerField;
    IBProdutocod_colecao: TIntegerField;
    IBProdutocalcula_preco_automatic: TStringField;
    IBProdutofornecedor_principal: TIntegerField;
    IBProdutocod_empresa: TIntegerField;
    IBProdutocod_estoque: TIntegerField;
    IBProdutodesconto_maximo: TBCDField;
    IBProdutoid_marca: TIntegerField;
    IBProdutocod_pro2: TStringField;
    IBProdutoicms: TBCDField;
    IBProdutomargem_valor_agregado_st: TBCDField;
    IBProdutocod_fiscal_produto: TStringField;
    IBProdutoncm: TStringField;
    IBProdutoestoque_maximo: TBCDField;
    IBProdutomts_rolo: TBCDField;
    IBProdutoord_pauta: TIntegerField;
    IBProdutocont_estoque_ago_2010: TFloatField;
    IBProdutopromocao: TStringField;
    IBProdutoperc_margem_minima: TBCDField;
    IBProdutosubcategoria: TIntegerField;
    IBProdutopreco_promocao: TBCDField;
    IBProdutoqtd_multipla: TBCDField;
    IBProdutosincronizar_palm: TStringField;
    IBProdutopromocao_pacote: TStringField;
    IBProdutoid_plano_contas: TIntegerField;
    IBProdutograde_comissao: TStringField;
    IBProdutocusto_total: TBCDField;
    IBProdutocomissao_inicial_interno: TBCDField;
    IBProdutocomissao_inicial_outros: TBCDField;
    IBProdutoescala_comissao_interno: TBCDField;
    IBProdutoescala_comissao_outros: TBCDField;
    IBProdutoescala_desconto: TBCDField;
    IBProdutocodigo_barra: TStringField;
    IBProdutobonificacao_apenas: TStringField;
    IBProdutomostrar_emb_etiqueta: TStringField;
    IBProdutoindisponivel: TStringField;
    IBProdutoloc_a_fila: TIntegerField;
    IBProdutoloc_a_lado: TIntegerField;
    IBProdutoloc_a_andar: TIntegerField;
    IBProdutoloc_a_box: TIntegerField;
    IBProdutoloc_padrao: TIntegerField;
    IBProdutoloc_b_andar: TIntegerField;
    IBProdutoloc_b_box: TIntegerField;
    IBProdutorevenda: TStringField;
    IBProdutotinta_base: TStringField;
    IBProdutoaviso_revisao_veiculo: TStringField;
    IBProdutoproxima_revisao: TIntegerField;
    IBProdutotipo_revisao: TStringField;
    IBProdutonao_validar_margem: TStringField;
    IBProdutocomissao_fixa: TSingleField;
    IBProdutocusto_materia_prima: TBCDField;
    IBProdutocusto_mao_de_obra: TBCDField;
    IBProdutocest: TStringField;
    IBProdutofrequencia: TStringField;
    IBProdutopotencia: TStringField;
    IBProdutotensao: TStringField;
    IBProdutocorrente: TStringField;
    IBProdutoprocessos: TBlobField;
    IBProdutocustosubtotal: TBCDField;
    IBProdutoentst: TBCDField;
    IBProdutoentfrete: TBCDField;
    IBProdutoentipi: TBCDField;
    IBProdutoenticms: TBCDField;
    IBProdutomateria_prima: TStringField;
    IBProdutodta_alt_preco: TDateField;
    procedure edprodutoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure PrCustoChange(Sender: TObject);
    procedure PrImpostosChange(Sender: TObject);
    procedure PripiChange(Sender: TObject);
    procedure PrgeralChange(Sender: TObject);
    procedure PrLucroChange(Sender: TObject);
    procedure ftdescricaoChange(Sender: TObject);
  private
    procedure CalculoPreco;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_produtos_simplificado: Tfrm_produtos_simplificado;

implementation

uses un_dao, UnFun;

{$R *.dfm}

procedure Tfrm_produtos_simplificado.CalculoPreco;
begin
 if IBProduto.State <> dsEdit then exit;
 IBProdutoCUSTO_TOTAL.Value := fmfun.calcula_custo_total(IBProdutoCUSTO.Value, IBProdutoIMPOSTOS.VALUE, IBProdutoiPI.value, IBProdutoGERAL.value, 0);
 IBProdutoPRECO_VENDA.Value := fmfun.calcula_preco_venda(IBProdutoCUSTO_TOTAL.value, IBProdutoLUCRO.value);
end;

procedure Tfrm_produtos_simplificado.edprodutoChange(Sender: TObject);
begin
 IBProduto.Locate('COD_PRODUTO', edProduto.Text, [loPartialKey])
end;

procedure Tfrm_produtos_simplificado.FormShow(Sender: TObject);
begin
  IBProduto.Open;
end;

procedure Tfrm_produtos_simplificado.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure Tfrm_produtos_simplificado.PrCustoChange(Sender: TObject);
begin
  CalculoPreco;
end;

procedure Tfrm_produtos_simplificado.PrImpostosChange(Sender: TObject);
begin
  CalculoPreco;
end;

procedure Tfrm_produtos_simplificado.PripiChange(Sender: TObject);
begin
  CalculoPreco;
end;

procedure Tfrm_produtos_simplificado.PrgeralChange(Sender: TObject);
begin
  CalculoPreco;
end;

procedure Tfrm_produtos_simplificado.PrLucroChange(Sender: TObject);
begin
  CalculoPreco;
end;

procedure Tfrm_produtos_simplificado.ftdescricaoChange(Sender: TObject);
begin
  IBProduto.Locate('NOM_PRODUTO', ftDescricao.Text, [loPartialKey])
end;

end.
