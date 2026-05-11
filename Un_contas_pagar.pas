unit Un_contas_pagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, Math,
  ComCtrls, Buttons, Grids, BaseGrid, AdvGrid,  ComObj, DB,
  RxMemDS, DBGrids, DBCtrls, DateUtils,
  sPageControl, sSpeedButton, sLabel, sPanel, sBitBtn, sGroupBox, sCheckBox,
  sRadioButton, acDBGrid, sCurrEdit, sCurrencyEdit, sEdit, sMaskEdit, 
  sCustomComboEdit, sTooledit, sComboEdit, sMemo, frxClass,
  AdvObj, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFr_contas_pagar = class(TForm)
    Pccop: TsPageControl;
    tab_localizar: TsTabSheet;
    tab_resultado: TsTabSheet;
    tab_dados: TsTabSheet;
    Sg_cop: TAdvStringGrid;
    Q_resultado: TFDQuery;
    GroupBox1: TsGroupBox;
    Label8: tsLabel;
    Label10: tsLabel;
    Prtitulo: TsEdit;
    Prsequencia: TsEdit;
    GroupBox2: TsGroupBox;
    Label11: tsLabel;
    Label12: tsLabel;
    Label13: tsLabel;
    Label15: tsLabel;
    Label16: tsLabel;
    Prdtaven: TsDateEdit;
    Prvalor: TsCurrencyEdit;
    Prhistorico1: TsMemo;
    Prdtapag: TsDateEdit;
    Prvalor_pago: TsCurrencyEdit;
    Prcod_fop: TsComboEdit;
    Label17: tsLabel;
    Lbnom_fop: tsLabel;
    Prconferido: tscheckbox;
    Prid: TsEdit;
    BTSEQ: TButton;
    Prcod_empresa: TsComboEdit;
    Label22: tsLabel;
    Lbnom_empresa: tsLabel;
    SpeedButton1: TsSpeedButton;
    Label18: tsLabel;
    Prcod_fornecedor: TsComboEdit;
    Lbnom_fornecedor: tsLabel;
    Panel9: tsPanel;
    btexc: TsBitBtn;
    btcan: TsBitBtn;
    btgra: TsBitBtn;
    btalt: TsBitBtn;
    Btnov: TsBitBtn;
    Panel10: tsPanel;
    GroupBox3: TsGroupBox;
    Lbnom_plano_contas_N1: tsLabel;
    Prid_plano_contas: TsComboEdit;
    Lbnom_plano_contas_N2: tsLabel;
    Lbnom_plano_contas_N3: tsLabel;
    Lbnom_plano_contas_N4: tsLabel;
    mmContasPagar: TRxMemoryData;
    mmContasPagarCheck: TBooleanField;
    dsContapagar: TDataSource;
    mmContasPagarTITULO: TStringField;
    mmContasPagarSEQUENCIA: TIntegerField;
    mmContasPagarRAZAO_SOCIAL: TStringField;
    mmContasPagarHISTORICO: TStringField;
    mmContasPagarDTAVEN: TDateField;
    mmContasPagarDTAPAG: TDateField;
    mmContasPagarVALOR: TCurrencyField;
    mmContasPagarVALOR_PAGO: TCurrencyField;
    mmContasPagarNOM_FOP: TStringField;
    DBCheckBox1: TDBCheckBox;
    sbAbrir: TsSpeedButton;
    CheckTodos: tscheckbox;
    sbConfPgto: TsSpeedButton;
    sbCancPgto: TsSpeedButton;
    Panel11: tsPanel;
    GroupBox4: TsGroupBox;
    stTotal: tsLabel;
    GroupBox5: TsGroupBox;
    stTotalSel: tsLabel;
    dgContasPagar: Tdbgrid;
    Tab_parcelas: TsTabSheet;
    Panel12: tsPanel;
    Panel13: tsPanel;
    mmParcelas: TRxMemoryData;
    mmParcelasID: TIntegerField;
    mmParcelasTITULO: TStringField;
    mmParcelasSEQUENCIA: TIntegerField;
    mmParcelasRAZAO_SOCIAL: TStringField;
    mmParcelasHISTORICO: TStringField;
    mmParcelasDTAVEN: TDateField;
    mmParcelasDTAPAG: TDateField;
    mmParcelasVALOR: TCurrencyField;
    mmParcelasVALOR_PAGO: TCurrencyField;
    mmParcelasNOM_FOP: TStringField;
    mmParcelasCheck: TBooleanField;
    dsParcelas: TDataSource;
    dgParcelas: Tdbgrid;
    sbAbrirParc: TsSpeedButton;
    Panel14: tsPanel;
    GroupBox6: TsGroupBox;
    stTotalParc: tsLabel;
    GroupBox7: TsGroupBox;
    StaticText2: tsLabel;
    Q_parcela: TFDQuery;
    ckParcelado: tscheckbox;
    Label7: tsLabel;
    sbGerarParc: TsSpeedButton;
    edEntrada: TsCurrencyEdit;
    Label20: tsLabel;
    edNumParc: TsCurrencyEdit;
    mmParcelasCOD_FOP: TIntegerField;
    mmParcelasCOD_FORNECEDOR: TIntegerField;
    mmParcelasID_PLANO_CONTAS: TIntegerField;
    mmParcelasCOD_EMPRESA: TIntegerField;
    BtSalvar: TsSpeedButton;
    GroupBox8: TsGroupBox;
    mmParcelasID_MASTER: TIntegerField;
    PrId_master: TsEdit;
    Panel1: tsPanel;
    BtnLimpar: TsBitBtn;
    btok: TsBitBtn;
    BitBtn2: TsBitBtn;
    Bt_imp_cop: TsBitBtn;
    Panel15: tsPanel;
    gbDTIni: TsGroupBox;
    EDdtaini: TsDateEdit;
    gbDTFim: TsGroupBox;
    Eddtafin: TsDateEdit;
    gbTipoData: TsGroupBox;
    Rb_filtro_vencimento: TsRadioButton;
    Rb_filtro_pagamento: TsRadioButton;
    gbLoja: TsGroupBox;
    Lbnom_empresa1: tsLabel;
    Zzcod_empresa: TsComboEdit;
    gbForn: TsGroupBox;
    LbNom_fornecedor1: tsLabel;
    Zzcod_fornecedor1: TsComboEdit;
    gbFormaPgto: TsGroupBox;
    Lbnom_fop1: tsLabel;
    Zzcod_fop1: TsComboEdit;
    gbTituloDe: TsGroupBox;
    Ed_titulo1: TsEdit;
    gbTituloAte: TsGroupBox;
    ed_titulo2: TsEdit;
    gbVlrIni: TsGroupBox;
    edValorIni: TsCurrencyEdit;
    gbVlrFim: TsGroupBox;
    edValorFim: TsCurrencyEdit;
    gbFiltro: TsGroupBox;
    Rb_efetivados: TsRadioButton;
    Rb_nao_efetivados: TsRadioButton;
    rbVencidos: TsRadioButton;
    Rb_todos: TsRadioButton;
    gbOrd: TsGroupBox;
    zz_ord_titulo: TsRadioButton;
    zz_ord_vencimento: TsRadioButton;
    zz_ord_pagamento: TsRadioButton;
    zz_ord_fornecedor: TsRadioButton;
    zz_ord_valor: TsRadioButton;
    mmContasPagarEXTRATO: TIntegerField;
    mmContasPagarCHEQUE: TIntegerField;
    PrExtrato: TsEdit;
    PrCHEQUE: TsEdit;
    mmContasPagarVALOR_CORRIGIDO: TCurrencyField;
    rbParciais: TsRadioButton;
    Label1: tsLabel;
    PrCOD_REPRESENTANTE: TsComboEdit;
    Lbnom_representante: tsLabel;
    gbRepres: TsGroupBox;
    lbNom_Representante1: tsLabel;
    zzRepresentante: TsComboEdit;
    gbPlanoContas: TsGroupBox;
    zLbnom_plano_contas_N1: tsLabel;
    zLbnom_plano_contas_N2: tsLabel;
    zLbnom_plano_contas_N3: tsLabel;
    zLbnom_plano_contas_N4: tsLabel;
    zPrId_Plano_Contas: TsComboEdit;
    mmParcelasID_REPRESENTANTE: TIntegerField;
    Label2: tsLabel;
    edDiaVcto: TsCurrencyEdit;
    mmContasPagarREPRESENTANTE: TStringField;
    mmContasPagarID: TIntegerField;
    gbVales: TsGroupBox;
    sLabel8: tsLabel;
    sLabel1: tsLabel;
    gbHistorico: TsGroupBox;
    edHistorico: TsEdit;
    fR_RELATORIO: TfrxReport;
    mmContasPagarCONTA: TStringField;
    lbTotalVale: tsLabel;
    lbPercSal: tsLabel;
    sBExcluirPgto: TsSpeedButton;
    Q_cp1: TFDQuery;
    gbNF: TsGroupBox;
    ED_NF: TsEdit;
    procedure Zzcod_fornecedor1ButtonClick(Sender: TObject);
    procedure Zzcod_fornecedor1KeyPress(Sender: TObject; var Key: Char);
    procedure Zzcod_fop1ButtonClick(Sender: TObject);
    procedure Zzcod_fop1Exit(Sender: TObject);
    procedure Zzcod_fop1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Zzcod_empresaButtonClick(Sender: TObject);
    procedure Zzcod_empresaKeyPress(Sender: TObject; var Key: Char);
    procedure Zzcod_fornecedor1Exit(Sender: TObject);
    procedure btokClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Ed_titulo1Exit(Sender: TObject);
    procedure ed_titulo2Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Sg_copMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure Prcod_fopButtonClick(Sender: TObject);
    procedure Prcod_fopExit(Sender: TObject);
    procedure Prcod_fopKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_fornecedorButtonClick(Sender: TObject);
    procedure Prcod_fornecedorExit(Sender: TObject);
    procedure Prcod_fornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure Sg_copDblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BtnovClick(Sender: TObject);
    procedure btaltClick(Sender: TObject);
    procedure btgraClick(Sender: TObject);
    procedure btcanClick(Sender: TObject);
    procedure PrtituloKeyPress(Sender: TObject; var Key: Char);
    procedure Bt_imp_copClick(Sender: TObject);
    procedure BTSEQClick(Sender: TObject);
    procedure Prcod_empresaButtonClick(Sender: TObject);
    procedure Prcod_empresaKeyPress(Sender: TObject; var Key: Char);
    procedure PrtituloExit(Sender: TObject);
    procedure btexcClick(Sender: TObject);
    procedure Prcod_empresaExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Prid_plano_contasButtonClick(Sender: TObject);
    procedure Prid_plano_contasExit(Sender: TObject);
    procedure dgContasPagarDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sbAbrirClick(Sender: TObject);
    procedure dgContasPagarDblClick(Sender: TObject);
    procedure CheckTodosClick(Sender: TObject);
    procedure Prid_plano_contasKeyPress(Sender: TObject; var Key: Char);
    procedure sbConfPgtoClick(Sender: TObject);
    procedure edValorIniExit(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure sbAbrirParcClick(Sender: TObject);
    procedure sbGerarParcClick(Sender: TObject);
    procedure ckParceladoClick(Sender: TObject);
    procedure dgParcelasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtSalvarClick(Sender: TObject);
    procedure edEntradaExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbCancPgtoClick(Sender: TObject);
    procedure PrCOD_REPRESENTANTEExit(Sender: TObject);
    procedure PrCOD_REPRESENTANTEButtonClick(Sender: TObject);
    procedure zzRepresentanteButtonClick(Sender: TObject);
    procedure zzRepresentanteExit(Sender: TObject);
    procedure zPrId_Plano_ContasButtonClick(Sender: TObject);
    procedure zPrId_Plano_ContasExit(Sender: TObject);
    procedure Zzcod_empresaExit(Sender: TObject);
    procedure PrdtavenExit(Sender: TObject);
    procedure tab_localizarShow(Sender: TObject);
    procedure tab_resultadoShow(Sender: TObject);
    procedure tab_dadosShow(Sender: TObject);
    procedure Tab_parcelasShow(Sender: TObject);
    procedure fR_RELATORIOGetValue(const VarName: String; var Value: Variant);
    procedure sBExcluirPgtoClick(Sender: TObject);
  private
    procedure TotalVales;
    procedure redimensionar(expandir: Boolean);
    { Private declarations }
  public
    expande_grid: string;
    aviso_vencido, modo_insert: Boolean;
    Col, Row: Integer;
    id: string;
    procedure preenche_grid;
    procedure preenche_campos;
    procedure monta_campos(origem: string);
    procedure readonly_false(prefixo: ShortString);
    procedure readonly_true(prefixo: ShortString);
    procedure limpa_campos(prefixo: ShortString);
    procedure ativa_cp1(id: string);
    procedure mostra_campos(prefixo: ShortString);
    procedure relatorio_contas_pagar;
    procedure preenche_grid_parc;
    { Public declarations }
  end;

var
  Fr_contas_pagar: TFr_contas_pagar;
  totalselecionados, total_confimar_pagto, total_cancelar_pgto,
    total_parcial_pgto: Integer;
  VlrTotal, VlrTotalSel, VlrTotalParc: real;
  DataInicialParc: TDate;
  PermiteAlterar: Boolean;

implementation

uses Un_localizar, Un_dao, UnPri, UnFun, Un_dados_fornecedor, Un_grupo,
  Un_sel_plano_contas, un_definir_saldo_inicial, un_conta_descontada,
  un_conta_atrasada, Un_dm, un_splash, UnSenha_especial;

{$R *.dfm}

procedure TFr_contas_pagar.Zzcod_fornecedor1ButtonClick(Sender: TObject);
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
  chamou_form := 'fr_cop_fornecedor';
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

procedure TFr_contas_pagar.Zzcod_fornecedor1KeyPress(Sender: TObject;
  var Key: Char);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin
  if Key = #13 then
  begin
    if (Zzcod_fornecedor1.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Fornecedor';
      chamou_pesquisa := 'fr_fornecedor';
      chamou_form := 'fr_cop_fornecedor';
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
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;
end;

procedure TFr_contas_pagar.Zzcod_fop1ButtonClick(Sender: TObject);
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
  chamou_form := 'fr_cop_fop';
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

procedure TFr_contas_pagar.Zzcod_fop1Exit(Sender: TObject);
begin
  if trim(Zzcod_fop1.Text) = '' then
    Lbnom_fop1.Caption := '...';

  if Zzcod_fop1.Text <> '' then
  begin
    dao.Geral2('select nom_fop from fop where cod_fop=' +
      QuotedStr(Zzcod_fop1.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_fop1.Caption := dao.q2.fieldbyname('nom_fop').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Zzcod_fop1.Text := '';
      Zzcod_fop1.SetFocus;
      Exit;
    end;

  end;

end;

procedure TFr_contas_pagar.Zzcod_fop1KeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  if Key = #13 then
  begin
    if (Prcod_fop.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Formas de Pagamento';
      chamou_pesquisa := 'fr_fop';
      chamou_form := 'fr_cop_fop';
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

procedure TFr_contas_pagar.FormShow(Sender: TObject);
begin
  Sg_cop.ColWidths[0] := 0;
  Sg_cop.Cells[1, 0] := 'Titulo';
  Sg_cop.Cells[2, 0] := 'Seq';
  Sg_cop.Cells[3, 0] := 'Fornecedor';
  Sg_cop.Cells[4, 0] := 'Descrição';
  Sg_cop.Cells[5, 0] := 'Dta.Vencimento';
  Sg_cop.Cells[6, 0] := 'Valor';
  Sg_cop.Cells[7, 0] := 'Dta.Pagamento';
  Sg_cop.Cells[8, 0] := 'Vlr.Pagamento';
  Sg_cop.Cells[9, 0] := 'Forma Pgto';
  Pccop.ActivePage := tab_localizar;
  Bt_imp_cop.Caption := 'Relatorio' + #13 + 'Contas a Pagar';
  expande_grid := 'false';
  EDdtaini.date := round(now) - 180;
  Eddtafin.date := round(now) + 180;
  readonly_true('Pr');

  if aviso_vencido then
  begin
    rbVencidos.Checked := true;
    btokClick(Self);
  end;

end;

procedure TFr_contas_pagar.Zzcod_empresaButtonClick(Sender: TObject);
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
  chamou_form := 'fr_cop_empresa';
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

procedure TFr_contas_pagar.Zzcod_empresaKeyPress(Sender: TObject;
  var Key: Char);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  if Key = #13 then
  begin
    if (Zzcod_empresa.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Empresa';
      chamou_pesquisa := 'fr_empresa';
      chamou_form := 'fr_cop_empresa';
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
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;

  end;
end;

procedure TFr_contas_pagar.Zzcod_fornecedor1Exit(Sender: TObject);
begin
  if trim(Zzcod_fornecedor1.Text) = '' then
    LbNom_fornecedor1.Caption := '...';

  if Zzcod_fornecedor1.Text <> '' then
  begin
    dao.Geral2('select razao_social from fornecedor where cod_fornecedor=' +
      QuotedStr(Zzcod_fornecedor1.Text));
    if dao.q2.RecordCount > 0 then
    begin
      LbNom_fornecedor1.Caption := dao.q2.fieldbyname('razao_social').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Zzcod_fornecedor1.Text := '';
      Zzcod_fornecedor1.SetFocus;
      Exit;
    end;

  end;

end;

procedure TFr_contas_pagar.btokClick(Sender: TObject);
var
  cmd, ordem: string;
begin
  try
    Screen.Cursor := crSQLWait;
    cmd := '';

    cmd := 'select distinct a.ID, a.COD_FORNECEDOR, a.NR_DOCUMENTO, a.TITULO, a.SEQUENCIA, a.DTAVEN, a.DTAPAG, '
      + 'a.VALOR, a.OBS, a.COD_FOP, a.HISTORICO1, a.VALOR_PAGO, a.SALDO_DEVEDOR, a.TIPO_ENTRADA, a.COD_EMPRESA, a.CONFERIDO, '
      + 'a.ID_PLANO_CONTAS, a.EXTRATO, a.CHEQUE, a.ID_MASTER, a.VLR_CORRIGIDO, a.COD_REPRESENTANTE, '
      + 'r.nom_representante, f.razao_social, fp.nom_fop, ep.nom_empresa, ' +
      '  TRIM(PC1.NR_CONTA)||''-''||PC1.DESCRICAO DESCRICAO1, ' +
      '  TRIM(PC2.NR_CONTA)||''-''||PC2.DESCRICAO DESCRICAO2, ' +
      '  TRIM(PC3.NR_CONTA)||''-''||PC3.DESCRICAO DESCRICAO3, ' +
      '  TRIM(PC4.NR_CONTA)||''-''||PC4.DESCRICAO DESCRICAO4 ' +
     // '  cc.id||''-''||cc.NOM_CONTA||''-''||cc.NR_AGENCIA||''-''||cc.NR_CONTA as conta '
      'from cp1 a  ' + 'left join EXTRATO_CP1 ec on ec.CP1 = a.id ' +
      'left join extrato ex on ex.ID = ec.EXTRATO ' +
      'left join CONTA_CORRENTE cc on cc.ID = ex.ID_CONTA ' +
      'left join fornecedor f on f.cod_fornecedor=a.cod_fornecedor ' +
      'left join representante r on r.id=a.cod_representante ' +
      'left join fop fp on fp.cod_fop=a.cod_fop ' +
      'left join empresa ep on ep.cod_empresa = a.cod_empresa ' +
      'left join plano_contas pc4 on pc4.id = a.id_plano_contas ' +
      'left JOIN PLANO_CONTAS PC3 ON (PC3.ID = PC4.ID_PAI) ' +
      'left JOIN PLANO_CONTAS PC2 ON (PC2.ID = PC3.ID_PAI) ' +
      'left JOIN PLANO_CONTAS PC1 ON (PC1.ID = PC2.ID_PAI) where 1 = 1 ';

    if (EDdtaini.date > 0) and (Eddtafin.date > 0) then
    begin
      if Rb_filtro_vencimento.Checked then
        cmd := cmd + ' and dtaven between ' +
          QuotedStr(FormatDateTime('dd.mm.yyyy', EDdtaini.date)) + ' and ' +
          QuotedStr(FormatDateTime('dd.mm.yyyy', Eddtafin.date))
      else
        cmd := cmd + ' and dtapag between ' +
          QuotedStr(FormatDateTime('dd.mm.yyyy', EDdtaini.date)) + ' and ' +
          QuotedStr(FormatDateTime('dd.mm.yyyy', Eddtafin.date));
    end;

    if ed_nf.Text <> '' then
      cmd := cmd + ' and cast(a.NR_DOCUMENTO as integer) = ' + ed_nf.Text;

    if Zzcod_empresa.Text <> '' then
      cmd := cmd + ' and a.cod_empresa = ' + QuotedStr(Zzcod_empresa.Text);

    if zPrId_Plano_Contas.Text <> '' then
      cmd := cmd + ' and a.id_plano_contas = ' +
        QuotedStr(zPrId_Plano_Contas.Text);

    if Zzcod_fornecedor1.Text <> '' then
      cmd := cmd + ' and a.cod_fornecedor = ' +
        QuotedStr(Zzcod_fornecedor1.Text);

    if zzRepresentante.Text <> '' then
      cmd := cmd + ' and a.cod_representante = ' +
        QuotedStr(zzRepresentante.Text);

    if Zzcod_fop1.Text <> '' then
      cmd := cmd + ' and a.cod_fop = ' + QuotedStr(Zzcod_fop1.Text);

    if (Ed_titulo1.Text <> '') and (ed_titulo2.Text = '') then
      cmd := cmd + ' and a.titulo like ''%' + Ed_titulo1.Text + '%''';

    if (Ed_titulo1.Text <> '') and (ed_titulo2.Text <> '') then
      cmd := cmd + ' and a.titulo between ' + QuotedStr(Ed_titulo1.Text) +
        ' and ' + QuotedStr(ed_titulo2.Text);

    if (edValorIni.Value > 0) and (edValorFim.Value > 0) then
      cmd := cmd + ' and a.valor between ' +
        StringReplace(formatfloat('0.00', edValorIni.Value), ',', '.',
        [rfReplaceAll]) + ' and ' + StringReplace
        (formatfloat('0.00', edValorFim.Value), ',', '.', [rfReplaceAll]);

    if trim(edHistorico.Text) <> '' then
      cmd := cmd + ' and a.HISTORICO1 like ''%' +
        edHistorico.Text + '%''';

    if Rb_efetivados.Checked then
      cmd := cmd + ' and dtapag is not null '
    else if Rb_nao_efetivados.Checked then
      cmd := cmd + ' and dtapag is null '
    else if rbParciais.Checked then
      cmd := cmd + ' and a.vlr_corrigido > a.valor_pago '
    else if rbVencidos.Checked then
      cmd := cmd + ' and dtapag is null and dtaven < current_timestamp ';

    ordem := ' order by ';
    if zz_ord_titulo.Checked then
      ordem := ordem + ' a.titulo';

    if zz_ord_vencimento.Checked then
      ordem := ordem + ' a.dtaven ';

    if zz_ord_pagamento.Checked then
      ordem := ordem + ' a.dtapag ';

    if zz_ord_fornecedor.Checked then
      ordem := ordem + ' f.razao_social';

    if zz_ord_valor.Checked then
      ordem := ordem + ' a.valor';

    fm_splash.pgArquivos.Visible := false;
    fm_splash.lbArquivos.Visible := false;

    fm_splash.lbStatus.Caption := 'Consultando...';
    fm_splash.ggProgress.Visible := false;
    fm_splash.Show;

    with Q_resultado do
    begin
      close;
      sql.clear;
      sql.Add(cmd + ordem);
      open;
    end;
    fm_splash.lbStatus.Caption := 'Listando...';
    fm_splash.ggProgress.Visible := true;
    fm_splash.ggProgress.MaxValue := Q_resultado.RecordCount;
    fm_splash.ggProgress.Progress := 0;
    fm_splash.Update;

    preenche_grid;
    Screen.Cursor := crDefault;
    Pccop.ActivePage := tab_resultado;
    CheckTodosClick(Self);

  except
    on e: Exception do
    begin
      Screen.Cursor := crDefault;

      dao.msg('Houve um Erro na Busca das Informações!' + #13 +
        'Abaixo segue o Erro Detalhado:' + #13 + e.Message);
    end;
  end;
end;

procedure TFr_contas_pagar.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TFr_contas_pagar.preenche_grid;
{ var
  i: integer; }
begin
  mmContasPagar.DisableControls;
  mmContasPagar.close;
  mmContasPagar.EmptyTable;
  mmContasPagar.open;
  VlrTotal := 0;
  while not(Q_resultado.Eof) do
  begin
    mmContasPagar.Append;
    mmContasPagarID.AsString := Q_resultado.fieldbyname('ID').AsString;
    mmContasPagarREPRESENTANTE.AsString :=
      Q_resultado.fieldbyname('nom_representante').AsString;
    mmContasPagarTITULO.AsString := Q_resultado.fieldbyname('titulo').AsString;
    mmContasPagarSEQUENCIA.AsString := Q_resultado.fieldbyname
      ('sequencia').AsString;
    mmContasPagarRAZAO_SOCIAL.AsString :=
      Q_resultado.fieldbyname('razao_social').AsString;
    mmContasPagarHISTORICO.AsString := Q_resultado.fieldbyname
      ('historico1').AsString;
    mmContasPagarDTAVEN.AsString := Q_resultado.fieldbyname('dtaven').AsString;
    mmContasPagarVALOR.AsString := Q_resultado.fieldbyname('valor').AsString;
    mmContasPagarDTAPAG.AsString := Q_resultado.fieldbyname('dtapag').AsString;
    mmContasPagarVALOR_PAGO.AsString := Q_resultado.fieldbyname
      ('valor_pago').AsString;
    mmContasPagarVALOR_CORRIGIDO.AsString :=
      Q_resultado.fieldbyname('vlr_corrigido').AsString;

    mmContasPagarNOM_FOP.AsString := Q_resultado.fieldbyname('nom_fop')
      .AsString;
    mmContasPagarEXTRATO.AsString := Q_resultado.fieldbyname('EXTRATO')
      .AsString;
    mmContasPagarCHEQUE.AsString := Q_resultado.fieldbyname('CHEQUE').AsString;
    //mmContasPagarCONTA.AsString := Q_resultado.fieldbyname('CONTA').AsString;

    VlrTotal := VlrTotal + mmContasPagarVALOR.Value;
    mmContasPagar.Post;

    fm_splash.ggProgress.AddProgress(1);
    fm_splash.Update;

    Q_resultado.Next;
  end;
  mmContasPagar.First;
  mmContasPagar.EnableControls;
  stTotal.Caption := formatfloat('R$ #,###,##0.00', VlrTotal);
  stTotalSel.Caption := formatfloat('R$ #,###,##0.00', 0);
  sbConfPgto.enabled := false;
  sbCancPgto.enabled := false;
  totalselecionados := 0;
  total_confimar_pagto := 0;
  total_cancelar_pgto := 0;
  total_parcial_pgto := 0;
  begin
    sbConfPgto.enabled := false;
    sbCancPgto.enabled := false;
  end;
  VlrTotalSel := 0;
  fm_splash.hide;
end;

procedure TFr_contas_pagar.Ed_titulo1Exit(Sender: TObject);
begin
  FMFUN.enchezero(Ed_titulo1.Text, 6);
end;

procedure TFr_contas_pagar.ed_titulo2Exit(Sender: TObject);
begin
  FMFUN.enchezero(ed_titulo2.Text, 6);

end;

procedure TFr_contas_pagar.FormCreate(Sender: TObject);
begin
  // Sg_cop.Hint := '0 0';
  // Sg_cop.ShowHint := True;

end;

procedure TFr_contas_pagar.Sg_copMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  r, c: Integer;
begin
  { Sg_cop.MouseToCell(X, Y, C, R);
    if ((Row <> r) or (Col <> c)) then
    begin
    Row := r; Col := c;
    if (c = -1) or (r = - 1) then
    Application.CancelHint
    else
    Sg_cop.Hint := Sg_cop.Cells[c,r];
    end; }
end;

procedure TFr_contas_pagar.Prcod_fopButtonClick(Sender: TObject);
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
  chamou_form := 'fr_cp1_fop';
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

procedure TFr_contas_pagar.Prcod_fopExit(Sender: TObject);
begin
  if trim(Prcod_fop.Text) = '' then
    Lbnom_fop.Caption := '...';

  if Prcod_fop.Text <> '' then
  begin
    dao.Geral2('select nom_fop from fop where cod_fop=' +
      QuotedStr(Prcod_fop.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_fop.Caption := dao.q2.fieldbyname('nom_fop').AsString;
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

procedure TFr_contas_pagar.Prcod_fopKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  if Key = #13 then
  begin
    if (Prcod_fop.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Formas de Pagamento';
      chamou_pesquisa := 'fr_fop';
      chamou_form := 'fr_cp1_fop';
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

procedure TFr_contas_pagar.Prcod_fornecedorButtonClick(Sender: TObject);
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
  chamou_form := 'fr_cp1_fornecedor';
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

procedure TFr_contas_pagar.Prcod_fornecedorExit(Sender: TObject);
begin

  if trim(Prcod_fornecedor.Text) = '' then
    Lbnom_fornecedor.Caption := '...';

  if (Prcod_fornecedor.Text <> '') then
  begin
    dao.Geral2
      ('select f.razao_social||'' - ''||c.NOM_CIDADE||''-''||c.UF as razao_social  from fornecedor f inner join CIDADES c on c.COD_CIDADE = f.COD_CIDADE where f.cod_fornecedor='
      + QuotedStr(Prcod_fornecedor.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_fornecedor.Caption := dao.q2.fieldbyname('razao_social').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_fornecedor.Text := '';
      Prcod_fornecedor.SetFocus;
      Exit;
    end;

  end;

end;

procedure TFr_contas_pagar.Prcod_fornecedorKeyPress(Sender: TObject;
  var Key: Char);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin
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
      chamou_form := 'fr_cp1_fornecedor';
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
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;
end;

procedure TFr_contas_pagar.Sg_copDblClickCell(Sender: TObject;
  ARow, ACol: Integer);
begin
  if Q_resultado.RecordCount > 0 then
  begin
    Q_resultado.Locate('id', Sg_cop.Cells[0, ARow], []);
    preenche_campos;
    ativa_cp1(Sg_cop.Cells[0, ARow]);
    Pccop.ActivePage := tab_dados;
  end;

end;

procedure TFr_contas_pagar.monta_campos(origem: string);
// origem indica qual é a origem dos dados pode ser origem='grid' ou origem='dataset'
var
  id: string;
begin
  id := Sg_cop.Cells[0, Row];

  dao.Geral1('select a.ID, a.COD_FORNECEDOR, a.NR_DOCUMENTO, ' +
    'a.TITULO, a.SEQUENCIA, a.DTAVEN, a.DTAPAG, a.VALOR, a.OBS, ' +
    'a.COD_FOP, a.HISTORICO1, a.VALOR_PAGO, a.SALDO_DEVEDOR, a.TIPO_ENTRADA, ' +
    'a.COD_EMPRESA, a.CONFERIDO, a.ID_PLANO_CONTAS, a.EXTRATO, a.CHEQUE, ' +
    'a.ID_MASTER, a.VLR_CORRIGIDO, a.COD_REPRESENTANTE, fop.nom_fop, fr.razao_social from cp1 a '
    + 'left join fop fop on fop.cod_fop=a.cod_fop ' +
    'left join fr.cod_fornecedor=a.cod_fornecedor ' + 'where id=' +
    QuotedStr(id));

  Prtitulo.Text := dao.Q1.fieldbyname('titulo').AsString;
  Prsequencia.Text := dao.Q1.fieldbyname('sequencia').AsString;
  Prcod_fornecedor.Text := dao.Q1.fieldbyname('cod_fornecedor').AsString;
  Lbnom_fornecedor.Caption := dao.Q1.fieldbyname('razao_social').AsString;
  Prtitulo.Text := Sg_cop.Cells[1, Row];

end;

procedure TFr_contas_pagar.preenche_campos;
begin
  Prid.Text := Q_resultado.fieldbyname('id').AsString;
  Prtitulo.Text := Q_resultado.fieldbyname('titulo').AsString;
  Prsequencia.Text := Q_resultado.fieldbyname('sequencia').AsString;
  Prcod_fornecedor.Text := Q_resultado.fieldbyname('cod_fornecedor').AsString;
  Prcod_fornecedorExit(Self);
  Prdtaven.date := Q_resultado.fieldbyname('dtaven').AsDateTime;
  Prvalor.Value := Q_resultado.fieldbyname('valor').AsFloat;
  Prcod_fop.Text := Q_resultado.fieldbyname('cod_fop').AsString;
  Lbnom_fop.Caption := Q_resultado.fieldbyname('nom_fop').AsString;
  Prhistorico1.Text := Q_resultado.fieldbyname('historico1').AsString;
  Prdtapag.date := Q_resultado.fieldbyname('dtapag').AsDateTime;
  Prvalor_pago.Value := Q_resultado.fieldbyname('valor_pago').AsFloat;
  Prcod_empresa.Text := Q_resultado.fieldbyname('cod_empresa').AsString;
  Lbnom_empresa.Caption := Q_resultado.fieldbyname('nom_empresa').AsString;
  Prid_plano_contas.Text := Q_resultado.fieldbyname('id_plano_contas').AsString;
  Lbnom_plano_contas_N1.Caption := Q_resultado.fieldbyname
    ('descricao1').AsString;
  Lbnom_plano_contas_N2.Caption := Q_resultado.fieldbyname
    ('descricao2').AsString;
  Lbnom_plano_contas_N3.Caption := Q_resultado.fieldbyname
    ('descricao3').AsString;
  Lbnom_plano_contas_N4.Caption := Q_resultado.fieldbyname
    ('descricao4').AsString;

  if Q_resultado.fieldbyname('conferido').AsString = 'S' then
    Prconferido.Checked := true
  else
    Prconferido.Checked := false;

  if (Q_resultado.fieldbyname('valor_pago').IsNull) or
    (Q_resultado.fieldbyname('valor_pago').Value = 0) then
    ckParcelado.Visible := Q_resultado.fieldbyname('valor_pago').IsNull;

end;

procedure TFr_contas_pagar.SpeedButton1Click(Sender: TObject);
begin
  if Prcod_fornecedor.Text <> '' then
  begin
    Application.CreateForm(TFr_dados_fornecedor, Fr_dados_fornecedor);
    Fr_dados_fornecedor.Busca_dados_fornecedor(Prcod_fornecedor.Text);
    Fr_dados_fornecedor.busca_dados_contato(Prcod_fornecedor.Text);

    Fr_dados_fornecedor.ShowModal;

  end
  else
  begin
    dao.msg('Um Titulo com Fornecedor deve ser Selecionado!');
    Exit;
  end;

end;

procedure TFr_contas_pagar.BtnovClick(Sender: TObject);
begin
  modo_insert := true;
  readonly_false('Pr');
  Prtitulo.enabled := true;
  Prsequencia.enabled := true;
  Prcod_fornecedor.enabled := true;
  BTSEQ.enabled := false;
  Prtitulo.SetFocus;
  // habilita botões
  Btnov.enabled := false;
  btalt.enabled := false;
  btgra.enabled := true;
  btcan.enabled := true;
  btexc.enabled := false;
  ckParcelado.Visible := false;
  tab_localizar.TabVisible := false;
  tab_resultado.TabVisible := false;
  Tab_parcelas.TabVisible := false;
  limpa_campos('Pr');
  Prsequencia.Text := '1';
  BTSEQ.enabled := true;
  PermiteAlterar := True;
end;

procedure TFr_contas_pagar.btaltClick(Sender: TObject);
begin
  if not PermiteAlterar then
  begin
    showmessage
      ('Não se pode alterar contas pagas! Efetue o cancelamento do mesmo na Aba Resultado.');
    Exit;
  end;

  modo_insert := false;
  readonly_false('Pr');
  // habilita botões
  Prtitulo.enabled := false;
  Prsequencia.enabled := false;
  // Prcod_fornecedor.Enabled := false;
  BTSEQ.enabled := false;
  tab_localizar.TabVisible := false;
  tab_resultado.TabVisible := false;

  Btnov.enabled := false;
  btalt.enabled := false;
  btgra.enabled := true;
  btcan.enabled := true;
  btexc.enabled := false;
  Prdtaven.SetFocus;

end;

procedure TFr_contas_pagar.btgraClick(Sender: TObject);
var
  descricao: string;
  extrato: Integer;
begin
  if (not modo_insert) and (not ckParcelado.Checked) then
  begin
    if (PrCOD_REPRESENTANTE.Text <> '') and (Tipo_usuario < '5') then
    begin
      dao.msg('Usuário não habilitado para alteração de Vales!');
      Exit;
    end;
  end;

  if Prtitulo.Text = '' then
  begin
    dao.msg('O campo Titulo deve ser preenchido!');
    Prtitulo.SetFocus;
    Exit;
  end;
  if Prsequencia.Text = '' then
  begin
    dao.msg('O campo Seqüência deve ser preenchido!');
    Prsequencia.SetFocus;
    Exit;
  end;
{  if Prid_plano_contas.Text = '' then
  begin
    dao.msg('O campo Plano de Contas deve ser preenchido!');
    Prid_plano_contas.SetFocus;
    Exit;
  end;}
  if Prcod_fornecedor.Text = '' then
  begin
    dao.msg('O campo Fornecedor deve ser preenchido!');
    Prcod_fornecedor.SetFocus;
    Exit;
  end;
  if Prvalor.Value = 0 then
  begin
    dao.msg('O campo Valor deve ser preenchido!');
    Prsequencia.SetFocus;
    Exit;
  end;

  if Prdtaven.Text = '  /  /    ' then
  begin
    dao.msg('O campo Data Vencimento deve ser preenchido!');
    Prsequencia.SetFocus;
    Exit;
  end;

  Btnov.enabled := true;
  btalt.enabled := true;
  btgra.enabled := false;
  btcan.enabled := false;
  btexc.enabled := true;

  Screen.Cursor := crSQLWait;
  try
    if not(dao.cn.InTransaction) then
      dao.cn.StartTransaction;

    if Prvalor_pago.Value > 0 then
    begin
      descricao := 'PAGAMENTO CONTA: FORNECEDOR: ' + Lbnom_fornecedor.Caption +
        ' TÍTULO Nº: ' + Prtitulo.Text + ';';
      Application.CreateForm(Tfrm_conta_descontada, frm_conta_descontada);

      SetLength(frm_conta_descontada.Listas_Contas, 1);
      frm_conta_descontada.Listas_Contas[0] := mmContasPagarID.Value;

      frm_conta_descontada.pagar := true;
      frm_conta_descontada.Total := RoundTo(Prvalor_pago.Value, -2);
      frm_conta_descontada.historico := descricao;
      // frm_conta_descontada.eddtMov.Date := Prdtaven.Date;
      frm_conta_descontada.ShowModal;
    end;
    if modo_insert then
    begin
      id := dao.insert('Pr', 'cp1', 'id', Fr_contas_pagar, 'gen_cp1');

      Prid.Text := id;
      Btnov.SetFocus;
    end
    else
      dao.update('cp1', 'id', Prid.Text, 'Pr', Fr_contas_pagar);
    dao.cn.Commit;
  except
    dao.cn.rollback;
  end;
  ativa_cp1(Prid.Text);
  mostra_campos('Pr');
  Screen.Cursor := crDefault;
  Tab_parcelas.TabVisible := ckParcelado.Checked;
  tab_localizar.TabVisible := true;
  tab_resultado.TabVisible := true;
  if not((EDdtaini.date = round(now) - 180) and
    (Eddtafin.date = round(now) + 180)) then
    btokClick(Self);
  Pccop.ActivePage := tab_dados;
  readonly_true('Pr');
  Prid_plano_contasExit(Self);
  Prcod_fornecedorExit(Self);
  Prcod_fopExit(Self);
  BTSEQ.enabled := false;
end;

procedure TFr_contas_pagar.btcanClick(Sender: TObject);
begin
  try
    if MessageDlg('Deseja Cancelar está Operação?', mtConfirmation,
      [mbyes, mbno], 0) = mryes then
    begin
      Btnov.enabled := true;
      btalt.enabled := true;
      btgra.enabled := false;
      btcan.enabled := false;
      btexc.enabled := true;
      tab_localizar.TabVisible := true;
      tab_resultado.TabVisible := true;
      BTSEQ.enabled := false;
      if modo_insert then
      begin
        limpa_campos('Pr');
        readonly_true('Pr');
      end
      else if modo_insert = false then
      begin
        mostra_campos('Pr');
        readonly_true('Pr');
      end;
    end
    else
      Exit;
  except
  end;

end;

procedure TFr_contas_pagar.readonly_false(prefixo: ShortString);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).ReadOnly := false
      else if Components[i] is TsMemo then
        TsMemo(Components[i]).ReadOnly := false
      else if Components[i] is tscheckbox then
        tscheckbox(Components[i]).enabled := true
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
        TMaskEdit(Components[i]).ReadOnly := false;
    end;
  end;

end;

procedure TFr_contas_pagar.readonly_true(prefixo: ShortString);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).ReadOnly := true
      else if Components[i] is TsMemo then
        TsMemo(Components[i]).ReadOnly := true
      else if Components[i] is tscheckbox then
        tscheckbox(Components[i]).enabled := false
      else if Components[i] is TsDateEdit then
        TsDateEdit(Components[i]).ReadOnly := true
      else if Components[i] is TsComboEdit then
        TsComboEdit(Components[i]).ReadOnly := true
      else if Components[i] is TsDateEdit then
        TsDateEdit(Components[i]).ReadOnly := true
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(Components[i]).ReadOnly := true
      else if Components[i] is TRichEdit then
        TRichEdit(Components[i]).ReadOnly := true
      else if Components[i] is TMaskEdit then
        TMaskEdit(Components[i]).ReadOnly := true;

    end;
  end;
end;

procedure TFr_contas_pagar.limpa_campos(prefixo: ShortString);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).clear
      else if Components[i] is TsMemo then
        TsMemo(Components[i]).clear
      else if Components[i] is TsComboEdit then
        TsComboEdit(Components[i]).clear
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(Components[i]).clear
      else if Components[i] is TsDateEdit then
        TsDateEdit(Components[i]).clear;
    end;
  end;
  if prefixo = 'Pr' then
  begin
    Lbnom_fornecedor.Caption := '...';
    Lbnom_fop.Caption := '...';
    Lbnom_plano_contas_N1.Caption := '...';
    Lbnom_plano_contas_N2.Caption := '...';
    Lbnom_plano_contas_N3.Caption := '...';
    Lbnom_plano_contas_N4.Caption := '...';
    Lbnom_representante.Caption := '...';
    gbVales.Visible := false;
  end;

end;

procedure TFr_contas_pagar.ativa_cp1(id: string);
begin
  with Q_cp1 do
  begin
    close;
    sql.clear;
    sql.Add('select a.ID, a.COD_FORNECEDOR, a.NR_DOCUMENTO, ' +
      '  a.TITULO, a.SEQUENCIA, a.DTAVEN, a.DTAPAG, a.VALOR, ' +
      '  a.OBS, a.COD_FOP, a.HISTORICO1, a.VALOR_PAGO, a.SALDO_DEVEDOR, ' +
      '  a.TIPO_ENTRADA, a.COD_EMPRESA, a.CONFERIDO, a.ID_PLANO_CONTAS, ' +
      '  a.EXTRATO, a.CHEQUE, a.ID_MASTER, a.VLR_CORRIGIDO, a.COD_REPRESENTANTE, '
      + '  f.razao_social, fp.nom_fop, ep.nom_empresa, ' +
      '  TRIM(PC1.NR_CONTA)||''-''||PC1.DESCRICAO NIVEL1, ' +
      '  TRIM(PC2.NR_CONTA)||''-''||PC2.DESCRICAO NIVEL2, ' +
      '  TRIM(PC3.NR_CONTA)||''-''||PC3.DESCRICAO NIVEL3, ' +
      '  TRIM(PC4.NR_CONTA)||''-''||PC4.DESCRICAO NIVEL4 ' + 'from cp1 a ' +
      'left join fornecedor f on f.cod_fornecedor=a.cod_fornecedor ' +
      'left join fop fp on fp.cod_fop=a.cod_fop ' +
      'left join empresa ep on ep.cod_empresa = a.cod_empresa ' +
      'left join plano_contas pc4 on pc4.id = a.id_plano_contas ' +
      'LEFT OUTER JOIN PLANO_CONTAS PC3 ON (PC3.ID = PC4.ID_PAI AND (PC3.ID IN (''30'') OR PC3.ID IN (''40''))) '
      + 'LEFT OUTER JOIN PLANO_CONTAS PC2 ON (PC2.ID = PC3.ID_PAI) ' +
      'LEFT OUTER JOIN PLANO_CONTAS PC1 ON (PC1.ID = PC2.ID_PAI AND PC1.ID IN(''58'')) '
      + 'WHERE a.id = ' + id);
    open;
  end;
end;

procedure TFr_contas_pagar.PrtituloKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;
end;

procedure TFr_contas_pagar.mostra_campos(prefixo: ShortString);
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
        TsEdit(FindComponent(campo)).Text := Q_cp1.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TsMemo then
      begin
        campo := TsMemo(Components[i]).Name;
        campo1 := copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
        TsMemo(FindComponent(campo)).Text := Q_cp1.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TsComboEdit then
      begin
        campo := TsComboEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        TsComboEdit(FindComponent(campo)).Text :=
          Q_cp1.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TsCurrencyEdit then
      begin
        campo := TsCurrencyEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        TsCurrencyEdit(FindComponent(campo)).Value :=
          Q_cp1.fieldbyname(campo1).AsFloat;
      end
      else if Components[i] is TComboBox then
      begin
        campo := TComboBox(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);

        TComboBox(FindComponent(campo)).ItemIndex := Q_cp1.fieldbyname(campo1)
          .AsInteger;
      end
      else if Components[i] is tscheckbox then
      begin
        campo := tscheckbox(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        if Q_cp1.fieldbyname(campo1).AsString = 'S' then
          tscheckbox(FindComponent(campo)).Checked := true
        else
          tscheckbox(FindComponent(campo)).Checked := false;
      end

      else if Components[i] is TsDateEdit then
      begin
        campo := TsDateEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);

        TsDateEdit(FindComponent(campo)).date := Q_cp1.fieldbyname(campo1)
          .AsDateTime;
      end;

    end;

  end; // end do for

  Prcod_fornecedorExit(Self);
  Prid_plano_contasExit(Self);
  PrCOD_REPRESENTANTEExit(Self);

  Screen.Cursor := crDefault;

  if not Q_cp1.fieldbyname('ID_MASTER').IsNull then
  begin
    Tab_parcelas.TabVisible := true;

    with Q_parcela do
    begin
      close;
      sql.clear;
      sql.Add('select a.ID, a.COD_FORNECEDOR, a.NR_DOCUMENTO, a.TITULO, ' +
        '  a.SEQUENCIA, a.DTAVEN, a.DTAPAG, a.VALOR, a.OBS, a.COD_FOP, ' +
        '  a.HISTORICO1, a.VALOR_PAGO, a.SALDO_DEVEDOR, a.TIPO_ENTRADA, ' +
        '  a.COD_EMPRESA, a.CONFERIDO, a.ID_PLANO_CONTAS, a.EXTRATO, ' +
        '  a.CHEQUE, a.ID_MASTER, a.VLR_CORRIGIDO, a.COD_REPRESENTANTE, ' +
        '  f.razao_social, fp.nom_fop, ep.nom_empresa, ' +
        '  TRIM(PC1.NR_CONTA)||''-''||PC1.DESCRICAO DESCRICAO1, ' +
        '  TRIM(PC2.NR_CONTA)||''-''||PC2.DESCRICAO DESCRICAO2, ' +
        '  TRIM(PC3.NR_CONTA)||''-''||PC3.DESCRICAO DESCRICAO3, ' +
        '  TRIM(PC4.NR_CONTA)||''-''||PC4.DESCRICAO DESCRICAO4  ' +
        'from cp1 a  ' +
        'left join fornecedor f on f.cod_fornecedor=a.cod_fornecedor ' +
        'left join fop fp on fp.cod_fop=a.cod_fop ' +
        'left join empresa ep on ep.cod_empresa = a.cod_empresa ' +
        'left join plano_contas pc4 on pc4.id = a.id_plano_contas ' +
        'left JOIN PLANO_CONTAS PC3 ON (PC3.ID = PC4.ID_PAI) ' +
        'left JOIN PLANO_CONTAS PC2 ON (PC2.ID = PC3.ID_PAI) ' +
        'left JOIN PLANO_CONTAS PC1 ON (PC1.ID = PC2.ID_PAI) where 1 = 1 and ID_MASTER = '
        + QuotedStr(Q_cp1.fieldbyname('ID_MASTER').AsString));
      open;
      if not isempty then
        preenche_grid_parc;
    end;
  end
  else
  begin
    ckParcelado.enabled := true;
    ckParcelado.Checked := false;
    if Prvalor_pago.Value = 0 then
      ckParcelado.Visible := true
    else
      ckParcelado.Visible := false;

    Q_parcela.close;
    mmParcelas.close;
    Tab_parcelas.TabVisible := ckParcelado.Checked;
  end;

  if not Q_cp1.fieldbyname('DTAPAG').IsNull then
    PermiteAlterar := false
  else
    PermiteAlterar := true;

end;

procedure TFr_contas_pagar.relatorio_contas_pagar;
var
  cmd, ordem, dia: string;
  excel: Variant;
  linha: Integer;
  ac_qtd, ac_total: real;
  nom_arquivo: string;

begin
  try
    Screen.Cursor := crSQLWait;
    cmd := '';
    cmd := 'select distinct a.ID, a.COD_FORNECEDOR, a.NR_DOCUMENTO, a.TITULO, a.SEQUENCIA, '
      + ' a.DTAVEN, a.DTAPAG, a.VALOR, a.OBS, a.COD_FOP, a.HISTORICO1, a.VALOR_PAGO, '
      + ' a.SALDO_DEVEDOR, a.TIPO_ENTRADA, a.COD_EMPRESA, a.CONFERIDO, a.ID_PLANO_CONTAS, '
      + ' a.EXTRATO, a.CHEQUE, a.ID_MASTER, a.VLR_CORRIGIDO, a.COD_REPRESENTANTE, '
      + ' f.razao_social, e.nom_empresa, fp.nom_fop from cp1 a ' +
      'left join fornecedor f on f.cod_fornecedor = a.cod_fornecedor ' +
      'left join fop fp on fp.cod_fop = a.cod_fop ' +
      'left join empresa e on e.cod_empresa = a.cod_empresa ' + 'where ';

    if (EDdtaini.Text <> '  /  /  ') and (Eddtafin.Text <> '  /  /  ') then
    begin
      if (Rb_filtro_vencimento.Checked) then
        cmd := cmd + ' dtaven between ' +
          QuotedStr(FormatDateTime('dd.mm.yyyy', EDdtaini.date)) + ' and ' +
          QuotedStr(FormatDateTime('dd.mm.yyyy', Eddtafin.date))
      else
        cmd := cmd + ' dtapag between ' +
          QuotedStr(FormatDateTime('dd.mm.yyyy', EDdtaini.date)) + ' and ' +
          QuotedStr(FormatDateTime('dd.mm.yyyy', Eddtafin.date));
    end;

    if Zzcod_empresa.Text <> '' then
      cmd := cmd + ' and a.cod_empresa = ' + QuotedStr(Zzcod_empresa.Text);

    if Zzcod_fornecedor1.Text <> '' then
      cmd := cmd + ' and a.cod_fornecedor = ' +
        QuotedStr(Zzcod_fornecedor1.Text);

    if Zzcod_fop1.Text <> '' then
      cmd := cmd + ' and a.cod_fop = ' + QuotedStr(Zzcod_fop1.Text);

    if (Ed_titulo1.Text <> '') and (ed_titulo2.Text = '') then
      cmd := cmd + ' and a.titulo=' + QuotedStr(Ed_titulo1.Text);

    if (Ed_titulo1.Text <> '') and (ed_titulo2.Text <> '') then
      cmd := cmd + ' and a.titulo between ' + QuotedStr(Ed_titulo1.Text) +
        ' and ' + QuotedStr(ed_titulo2.Text);

    if Rb_efetivados.Checked then
      cmd := cmd + ' and dtapag is not null'
    else if Rb_nao_efetivados.Checked then
      cmd := cmd + ' and dtapag is null';

    if zz_ord_pagamento.Checked then
      ordem := 'order by dtapag';

    if zz_ord_titulo.Checked then
      ordem := ordem + ' order by a.titulo';

    if zz_ord_vencimento.Checked then
      ordem := ordem + ' order by a.dtaven';

    with Q_resultado do
    begin
      close;
      sql.clear;
      sql.Add(cmd + ' ' + ordem);
      open;
    end;
    Q_resultado.First;

    Screen.Cursor := crDefault;
    DeleteFile(ExtractFilePath(ParamStr(0)) + 'temporario\contas pagar.xls');
    excel := CreateOleObject('Excel.Application');
    excel.WorkBooks.open(ExtractFilePath(ParamStr(0)) +
      'Relatorios\contas_pagar.xls');
    excel.Visible := false;

    excel.WorkBooks[1].sheets[1].Cells[1, 1] :=
      'RELATÓRIO DE CONTAS A PAGAR DO PERÍODO: ' + EDdtaini.Text + ' e ' +
      Eddtafin.Text;

    FRPRI.CorCel(excel, 1, RGB(194, 194, 194), 'A3:H3');
    excel.WorkBooks[1].sheets[1].Cells[3, 1] := 'DIA......:';
    if copy(formatdatetime('dd/mm/yyyy', Q_resultado.fieldbyname('dtapag')
      .AsDateTime), 7, 4) <> '1899' then
      excel.WorkBooks[1].sheets[1].Cells[3, 2] :=
        FormatDateTime('mm/dd/yy', Q_resultado.fieldbyname('DTAVEN').AsDateTime);
    dia := Q_resultado.fieldbyname('dtaven').AsString;
    ac_qtd := ac_qtd + Q_resultado.fieldbyname('valor').AsFloat;

    linha := 5;

    while not(Q_resultado.Eof) do
    begin
      if dia <> Q_resultado.fieldbyname('dtaven').AsString then
      begin
        FRPRI.CorCel(excel, 1, RGB(194, 194, 194), 'A' + inttostr(linha) + ':H'
          + inttostr(linha));
        excel.WorkBooks[1].sheets[1].Cells[linha, 1] := 'TOTAL DIA:';
        excel.WorkBooks[1].sheets[1].Cells[linha, 2] :=
          formatfloat('###,##0.00', ac_qtd);

        linha := linha + 2;
        FRPRI.CorCel(excel, 1, RGB(194, 194, 194), 'A' + inttostr(linha) + ':H'
          + inttostr(linha));
        excel.WorkBooks[1].sheets[1].Cells[linha, 1] := 'DIA......:';
        excel.WorkBooks[1].sheets[1].Cells[linha, 2] :=
          FormatDateTime('mm/dd/yy', Q_resultado.fieldbyname('dtaven').AsDateTime);
        dia := Q_resultado.fieldbyname('dtaven').AsString;
        ac_qtd := 0;
        linha := linha + 1;

        excel.WorkBooks[1].sheets[1].Cells[linha, 1] := 'TITULO-SEQ.';
        excel.WorkBooks[1].sheets[1].Cells[linha, 2] := 'RAZAO SOCIAL';
        excel.WorkBooks[1].sheets[1].Cells[linha, 3] := 'HISTÓRICO';
        excel.WorkBooks[1].sheets[1].Cells[linha, 4] := 'DTA.VENC';
        excel.WorkBooks[1].sheets[1].Cells[linha, 5] := 'VALOR';
        excel.WorkBooks[1].sheets[1].Cells[linha, 6] := 'DTA.PAG';
        excel.WorkBooks[1].sheets[1].Cells[linha, 7] := 'VLR.PAG';
        excel.WorkBooks[1].sheets[1].Cells[linha, 8] := 'F.PAGTO';
        linha := linha + 1;
      end;

      excel.WorkBooks[1].sheets[1].Cells[linha, 1] :=
        Q_resultado.fieldbyname('titulo').AsString + '-' +
        Q_resultado.fieldbyname('sequencia').AsString;
      excel.WorkBooks[1].sheets[1].Cells[linha, 2] :=
        Q_resultado.fieldbyname('razao_social').AsString;
      excel.WorkBooks[1].sheets[1].Cells[linha, 3] :=
        Q_resultado.fieldbyname('historico1').AsString;
      excel.WorkBooks[1].sheets[1].Cells[linha, 4] :=
        FormatDateTime('mm/dd/yy', Q_resultado.fieldbyname('dtaven').AsDateTime);
      excel.WorkBooks[1].sheets[1].Cells[linha, 5] :=
        formatfloat('###,##0.00', Q_resultado.fieldbyname('valor').AsFloat);
      if copy(FormatDateTime('mm/yy/yyyy', Q_resultado.fieldbyname('dtapag')
        .AsDateTime), 7, 4) <> '1899' then
        excel.WorkBooks[1].sheets[1].Cells[linha, 6] :=
          FormatDateTime('mm/dd/yy', Q_resultado.fieldbyname('dtapag').AsDateTime);
      excel.WorkBooks[1].sheets[1].Cells[linha, 7] :=
        formatfloat('###,##0.00', Q_resultado.fieldbyname('valor_pago')
        .AsFloat);
      excel.WorkBooks[1].sheets[1].Cells[linha, 8] :=
        Q_resultado.fieldbyname('nom_fop').AsString;
      ac_qtd := ac_qtd + Q_resultado.fieldbyname('valor').AsFloat;
      ac_total := ac_total + Q_resultado.fieldbyname('valor').AsFloat;
      linha := linha + 1;
      Q_resultado.Next;
    end;
    linha := linha + 2;
    FRPRI.CorCel(excel, 1, RGB(194, 194, 194), 'A' + inttostr(linha) + ':H' +
      inttostr(linha));
    excel.WorkBooks[1].sheets[1].Cells[linha, 1] := 'VALOR GERAL:';
    excel.WorkBooks[1].sheets[1].Cells[linha, 2] :=
      formatfloat('###,##0.00', ac_total);

    // SALVA O DOCUMENTO
    nom_arquivo := 'contas pagar' + '.xls';

    excel.WorkBooks[1].SaveAs(ExtractFilePath(ParamStr(0)) +
      'temporario\contas pagar.xls');
    excel.Visible := true;
  except
    on e: Exception do
    begin
      Screen.Cursor := crDefault;
      dao.msg('Houve um Erro na Busca das Informações!' + #13 +
        'Abaixo segue o Erro Detalhado:' + #13 + e.Message);
    end;
  end;

end;

procedure TFr_contas_pagar.Bt_imp_copClick(Sender: TObject);
var
  cmd, ordem, path: string;
begin
  path := ExtractFilePath(Application.ExeName);
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

  if (EDdtaini.date > 0) and (Eddtafin.date > 0) then
  begin
    if Rb_filtro_vencimento.Checked then
      cmd := cmd + ' and cr1.dtaven between ' +
        QuotedStr(FormatDateTime('dd.mm.yyyy', EDdtaini.date)) + ' and ' +
        QuotedStr(FormatDateTime('dd.mm.yyyy', Eddtafin.date))
    else
      cmd := cmd + ' and cr1.dtapag between ' +
        QuotedStr(FormatDateTime('dd.mm.yyyy', EDdtaini.date)) + ' and ' +
        QuotedStr(FormatDateTime('dd.mm.yyyy', Eddtafin.date));
  end;

  if Zzcod_empresa.Text <> '' then
    cmd := cmd + ' and cr1.cod_empresa = ' + QuotedStr(Zzcod_empresa.Text);

  if Zzcod_fornecedor1.Text <> '' then
    cmd := cmd + ' and cr1.cod_fornecedor = ' +
      QuotedStr(Zzcod_fornecedor1.Text);

  if zzRepresentante.Text <> '' then
    cmd := cmd + ' and cr1.COD_REPRESENTANTE = ' +
      QuotedStr(zzRepresentante.Text);

  if zPrId_Plano_Contas.Text <> '' then
    cmd := cmd + ' and cr1.id_plano_contas = ' +
      QuotedStr(zPrId_Plano_Contas.Text);

  if Zzcod_fop1.Text <> '' then
    cmd := cmd + ' and cr1.cod_fop = ' + QuotedStr(Zzcod_fop1.Text);

  if (Ed_titulo1.Text <> '') and (ed_titulo2.Text = '') then
    cmd := cmd + ' and cr1.titulo like ''%' + trim(Ed_titulo1.Text) + '%''';

  if (Ed_titulo1.Text <> '') and (ed_titulo2.Text <> '') then
    cmd := cmd + ' and cr1.titulo between ' +
      QuotedStr(FMFUN.enchezero(Ed_titulo1.Text, 6)) + ' and ' +
      QuotedStr(FMFUN.enchezero(ed_titulo2.Text, 6));

  if (edValorIni.Value > 0) and (edValorFim.Value > 0) then
    cmd := cmd + ' and cr1.valor between ' +
      StringReplace(formatfloat('0.00', edValorIni.Value), ',', '.',
      [rfReplaceAll]) + ' and ' + StringReplace
      (formatfloat('0.00', edValorFim.Value), ',', '.', [rfReplaceAll]);

  if trim(edHistorico.Text) <> '' then
    cmd := cmd + ' and cr1.HISTORICO1 like ''%' +
      edHistorico.Text + '%''';

  if Rb_efetivados.Checked then
    cmd := cmd + ' and cr1.dtapag is not null '
  else if Rb_nao_efetivados.Checked then
    cmd := cmd + ' and cr1.dtapag is null '
  else if rbParciais.Checked then
    cmd := cmd + ' and cr1.vlr_corrigido > cr1.valor_pago '
  else if rbVencidos.Checked then
    cmd := cmd + ' and cr1.dtapag is null and cr1.dtapag < current_timestamp ';

  ordem := ' order by ';
  if zz_ord_titulo.Checked then
    ordem := ordem + ' cr1.titulo ';

  if zz_ord_vencimento.Checked then
    ordem := ordem + ' cr1.dtaven ';

  if zz_ord_pagamento.Checked then
    ordem := ordem + ' cr1.dtapag ';

  if zz_ord_fornecedor.Checked then
    ordem := ordem + ' c.razao_social ';

  if zz_ord_valor.Checked then
    ordem := ordem + ' cr1.valor ';

  with Dm.q_contas_pagar do
  begin
    close;
    sql.clear;
    sql.Add(cmd + ordem);
    open;
  end;

  if Dm.q_contas_pagar.RecordCount <= 0 then
  begin
    dao.msg('Não foi encontrado Registros para gerar o Relatório');
    Exit;
  end;

  if not(fR_RELATORIO.LoadFromFile(path + 'Relatorios\conta_pagar.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 +
      'Avise o Suporte');
    Exit;
  end;
  fR_RELATORIO.ShowReport;
end;

procedure TFr_contas_pagar.BTSEQClick(Sender: TObject);
var
  nr_documento: Integer;
begin
  if Prtitulo.Text <> '' then
  begin
    showmessage('Primeiro Apague o Conteudo do Campo Titulo!');
    Prtitulo.SetFocus;
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
   //dao.cn.Isolation := tiCommitted;
  except
    dao.cn.rollback;
  end;

  Prtitulo.Text := FMFUN.enchezero(inttostr(nr_documento), 6);
  Prtitulo.enabled := false;
  Prsequencia.SetFocus;
end;

procedure TFr_contas_pagar.Prcod_empresaButtonClick(Sender: TObject);
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
  chamou_form := 'fr_cp1_empresa';
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

procedure TFr_contas_pagar.Prcod_empresaKeyPress(Sender: TObject;
  var Key: Char);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  if Key = #13 then
  begin
    if (Prcod_empresa.Text = '') and (Btnov.enabled = false) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Empresa';
      chamou_pesquisa := 'fr_empresa';
      chamou_form := 'fr_cp1_empresa';
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
    Prcod_fornecedor.SetFocus;
    Key := #0;

  end;
end;

procedure TFr_contas_pagar.PrtituloExit(Sender: TObject);
begin
  if Prtitulo.Text <> '' then
    Prtitulo.Text := FMFUN.enchezero(Prtitulo.Text, 6);

end;

procedure TFr_contas_pagar.btexcClick(Sender: TObject);
begin
  if (PrCOD_REPRESENTANTE.Text <> '') and (Tipo_usuario < '5') then
  begin
    dao.msg('Usuário não habilitado para exclusão de Vales!');
    Exit;
  end;

  if MessageDlg('Deseja Excluir o Titulo', mtConfirmation, [mbyes, mbno], 0) = mryes
  then
  begin
    if not fmfun.LiberarProcesso then
      Exit;


    try
      if not(dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      dao.Execsql('delete from cp1 where id = ' + QuotedStr(Prid.Text));
      dao.cn.Commit;
      dao.msg('Titulo Excluido com Sucesso!');
    except
      dao.cn.rollback;
    end;
    btokClick(Self);
  end;

end;

procedure TFr_contas_pagar.Prcod_empresaExit(Sender: TObject);
begin
  if Prcod_empresa.Text <> '' then
  begin
    dao.Geral2('select nom_empresa from empresa where cod_empresa=' +
      QuotedStr(Prcod_empresa.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_empresa.Caption := dao.q2.fieldbyname('nom_empresa').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_empresa.Text := '';
      Prcod_empresa.SetFocus;
      Exit;
    end;

  end;

end;

procedure TFr_contas_pagar.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if btgra.enabled = true then
  begin
    MessageBox(handle,
      'Você deve Gravar ou Cancelar as Informações Antes de Sair!', 'ORBI',
      MB_ICONWARNING);
    CanClose := false;
  end
  else
  begin
    CanClose := true;
  end;

end;

procedure TFr_contas_pagar.Prid_plano_contasButtonClick(Sender: TObject);
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
  chamou_form := 'fr_cp_plano_conta';
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

procedure TFr_contas_pagar.Prid_plano_contasExit(Sender: TObject);
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
    sqlplano := 'SELECT ' + '  PC4.ID, ' + '  PC4.NR_CONTA, ' +
      '  TRIM(PC1.NR_CONTA)||''-''||PC1.DESCRICAO DESCRICAO1, ' +
      '  TRIM(PC2.NR_CONTA)||''-''||PC2.DESCRICAO DESCRICAO2, ' +
      '  TRIM(PC3.NR_CONTA)||''-''||PC3.DESCRICAO DESCRICAO3, ' +
      '  TRIM(PC4.NR_CONTA)||''-''||PC4.DESCRICAO DESCRICAO4 ' + 'FROM ' +
      '  PLANO_CONTAS PC4 ' +
      'INNER JOIN PLANO_CONTAS PC3 ON (PC3.ID = PC4.ID_PAI) ' +
      'INNER JOIN PLANO_CONTAS PC2 ON (PC2.ID = PC3.ID_PAI) ' +
      'INNER JOIN PLANO_CONTAS PC1 ON (PC1.ID = PC2.ID_PAI) ' +
      'WHERE (PC3.ID IN (''119'')  OR PC3.ID IN (''120'')  OR PC3.ID IN (''30'') OR PC3.ID IN (''36'') OR PC3.ID IN (''40'') OR PC1.ID IN(''58'')) AND PC4.ID = '
      + QuotedStr(Prid_plano_contas.Text);

    dao.Geral2(sqlplano);
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_plano_contas_N1.Caption := dao.q2.fieldbyname('descricao1')
        .AsString;
      Lbnom_plano_contas_N2.Caption := dao.q2.fieldbyname('descricao2')
        .AsString;
      Lbnom_plano_contas_N3.Caption := dao.q2.fieldbyname('descricao3')
        .AsString;
      Lbnom_plano_contas_N4.Caption := dao.q2.fieldbyname('descricao4')
        .AsString;
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

procedure TFr_contas_pagar.dgContasPagarDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
  IsChecked: array [Boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or
    DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  if (mmContasPagarVALOR_PAGO.Value > 0) and (not mmContasPagarVALOR_PAGO.IsNull)
  then
  begin
    if (mmContasPagarVALOR_PAGO.Value >= mmContasPagarVALOR.Value) then
    begin
      dgContasPagar.Canvas.Font.Color := clNavy;
      if gdSelected in State then
      begin
        dgContasPagar.Canvas.Brush.Color := clNavy;
        dgContasPagar.Canvas.Font.Color := clWhite;
      end;
    end
    else
    begin
      dgContasPagar.Canvas.Font.Color := clOlive;
      if gdSelected in State then
      begin
        dgContasPagar.Canvas.Brush.Color := clOlive;
        dgContasPagar.Canvas.Font.Color := clWhite;
      end;
    end;
  end
  else if (mmContasPagarDTAVEN.Value < now) then
  begin
    dgContasPagar.Canvas.Font.Color := clRed;
    dgContasPagar.Canvas.Font.Style := [fsBold];
    if gdSelected in State then
    begin
      dgContasPagar.Canvas.Brush.Color := clRed;
      dgContasPagar.Canvas.Font.Color := clWhite;
    end;
  end
  else
  begin
    dgContasPagar.Canvas.Font.Color := clGreen;
    dgContasPagar.Canvas.Font.Style := [fsBold];
    if gdSelected in State then
    begin
      dgContasPagar.Canvas.Brush.Color := clGreen;
      dgContasPagar.Canvas.Font.Color := clWhite;
    end
  end;

  dgContasPagar.DefaultDrawDataCell(Rect, Column.Field, State);

  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = DBCheckBox1.DataField) then
    begin
      DBCheckBox1.Left := Rect.Left + dgContasPagar.Left + 2;
      DBCheckBox1.Top := Rect.Top + dgContasPagar.Top + 2;
      DBCheckBox1.Width := Rect.Right - Rect.Left;
      DBCheckBox1.Height := Rect.Bottom - Rect.Top;

      DBCheckBox1.Visible := true;
    end
  end
  else
  begin
    if (Column.Field.FieldName = DBCheckBox1.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := IsChecked[Column.Field.AsBoolean];

      dgContasPagar.Canvas.FillRect(Rect);
      DrawFrameControl(dgContasPagar.Canvas.handle, DrawRect, DFC_BUTTON,
        DrawState);
    end;
  end;
end;

procedure TFr_contas_pagar.sbAbrirClick(Sender: TObject);
begin
  if not Q_resultado.isempty then
  begin
    Q_resultado.Locate('id', mmContasPagarID.AsString, []);
    // preenche_campos;
    ativa_cp1(mmContasPagarID.AsString);
    mostra_campos('Pr');
    Pccop.ActivePage := tab_dados;
    BtSalvar.enabled := false;
  end;
end;

procedure TFr_contas_pagar.dgContasPagarDblClick(Sender: TObject);
begin
  mmContasPagar.Edit;
  if mmContasPagarCheck.Value = true then
  begin
    mmContasPagarCheck.Value := false;
    totalselecionados := totalselecionados - 1;
    VlrTotalSel := VlrTotalSel - mmContasPagarVALOR.Value;
    if mmContasPagarVALOR_PAGO.Value = 0 then
      total_confimar_pagto := total_confimar_pagto - 1
    else if mmContasPagarVALOR_CORRIGIDO.Value > mmContasPagarVALOR_PAGO.Value
    then
      total_parcial_pgto := total_parcial_pgto - 1
    else
      total_cancelar_pgto := total_cancelar_pgto - 1;
  end
  else
  begin
    mmContasPagarCheck.Value := true;
    totalselecionados := totalselecionados + 1;

    if mmContasPagarVALOR_PAGO.Value = 0 then
      total_confimar_pagto := total_confimar_pagto + 1
    else if mmContasPagarVALOR_CORRIGIDO.Value > mmContasPagarVALOR_PAGO.Value
    then
      total_parcial_pgto := total_parcial_pgto + 1
    else
      total_cancelar_pgto := total_cancelar_pgto + 1;

    VlrTotalSel := VlrTotalSel + mmContasPagarVALOR.Value;
  end;
  mmContasPagar.Post;
  stTotalSel.Caption := formatfloat('R$ #,###,##0.00', VlrTotalSel);

  sbConfPgto.enabled := false;
  sbCancPgto.enabled := false;

  if total_confimar_pagto > 0 then
    sbConfPgto.enabled := true;

  if total_cancelar_pgto > 0 then
    sbCancPgto.enabled := true;

  if total_parcial_pgto > 0 then
  begin
    sbConfPgto.enabled := true;
    sbCancPgto.enabled := true;
  end;

  if ((total_confimar_pagto > 0) and (total_cancelar_pgto > 0)) or
    ((total_parcial_pgto > 0) and (total_cancelar_pgto > 0)) or
    ((total_confimar_pagto > 0) and (total_cancelar_pgto > 0)) then
  begin
    sbConfPgto.enabled := false;
    sbCancPgto.enabled := false;
  end;

end;

procedure TFr_contas_pagar.CheckTodosClick(Sender: TObject);
begin
  totalselecionados := 0;
  mmContasPagar.DisableControls;
  mmContasPagar.First;
  while not mmContasPagar.Eof do
  begin
    mmContasPagar.Edit;
    mmContasPagarCheck.Value := CheckTodos.Checked;
    if CheckTodos.Checked then
    begin
      totalselecionados := totalselecionados + 1;
      VlrTotalSel := VlrTotalSel + mmContasPagarVALOR.Value;
    end
    else
    begin
      totalselecionados := 0;
      VlrTotalSel := 0;
    end;
    mmContasPagar.Post;
    mmContasPagar.Next;
  end;
  mmContasPagar.First;
  stTotalSel.Caption := formatfloat('R$ #,###,##0.00', VlrTotalSel);
  mmContasPagar.EnableControls;

  if totalselecionados = 0 then
  begin
    sbConfPgto.enabled := false;
    sbCancPgto.enabled := false;
  end
  else
  begin
    if mmContasPagarVALOR_PAGO.Value = 0 then
    begin
      sbConfPgto.enabled := true;
      sbCancPgto.enabled := false;
    end
    else
    begin
      sbConfPgto.enabled := false;
      sbCancPgto.enabled := true;
    end;
  end;
end;

procedure TFr_contas_pagar.Prid_plano_contasKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;
end;

procedure TFr_contas_pagar.sbConfPgtoClick(Sender: TObject);
var
  codigo, quem_pagou, descricao, sacador, sql_cheque: string;
  saldo, valor_a_pagar: real;
  usuario, X: Integer;
  Contas: array of Integer;
begin
  // cod_usuario
  valor_a_pagar := 0;
  if VlrTotalSel > 0 then
  begin
    mmContasPagar.First;
    mmContasPagar.DisableControls;
    while not mmContasPagar.Eof do
    begin
      if mmContasPagarCheck.Value = true then
      begin
        if (mmContasPagarVALOR_CORRIGIDO.Value > mmContasPagarVALOR_PAGO.Value)
          and (mmContasPagarVALOR_PAGO.Value > 0) then
          valor_a_pagar := valor_a_pagar +
            (mmContasPagarVALOR_CORRIGIDO.Value - mmContasPagarVALOR_PAGO.Value)
        else
        begin
          if mmContasPagarDTAVEN.Value < now then
          begin
            Application.CreateForm(Tfm_conta_atrasada, fm_conta_atrasada);
            fm_conta_atrasada.stTitulo.Caption := mmContasPagarTITULO.AsString;
            fm_conta_atrasada.stForn.Caption :=
              mmContasPagarRAZAO_SOCIAL.AsString;
            fm_conta_atrasada.stVcto.Caption := mmContasPagarDTAVEN.AsString;
            fm_conta_atrasada.stValorPagar.Caption :=
              formatfloat('R$ #,###,##0.00', mmContasPagarVALOR.Value);
            fm_conta_atrasada.edValorPago.Value := mmContasPagarVALOR.Value;
            fm_conta_atrasada.ShowModal;
            if fm_conta_atrasada.ModalResult = mrok then
            begin
              mmContasPagar.Edit;
              mmContasPagarVALOR_CORRIGIDO.Value :=
                fm_conta_atrasada.edValorPago.Value;
              mmContasPagar.Post;
            end
            else
            begin
              mmContasPagar.Edit;
              mmContasPagarVALOR_CORRIGIDO.Value := mmContasPagarVALOR.Value;
              mmContasPagar.Post;
            end;
            valor_a_pagar := valor_a_pagar + mmContasPagarVALOR_CORRIGIDO.Value;
          end
          else
          begin
            mmContasPagar.Edit;
            mmContasPagarVALOR_CORRIGIDO.Value := mmContasPagarVALOR.Value;
            mmContasPagar.Post;
            valor_a_pagar := valor_a_pagar + mmContasPagarVALOR_CORRIGIDO.Value;
          end;
        end;
      end;
      mmContasPagar.Next;
    end;

    mmContasPagar.First;
    Application.CreateForm(Tfrm_conta_descontada, frm_conta_descontada);
    SetLength(frm_conta_descontada.Listas_Contas, totalselecionados);
    X := 0;
    while not mmContasPagar.Eof do
    begin
      if mmContasPagarCheck.Value = true then
      begin
        descricao := 'PAGAMENTO CONTA: FORNECEDOR: ' +
          mmContasPagarRAZAO_SOCIAL.AsString + ' TÍTULO Nº: ' +
          mmContasPagarTITULO.Value + ';';
        // frm_conta_descontada.eddtMov.Date := mmContasPagarDTAVEN.AsDateTime;
        frm_conta_descontada.Listas_Contas[X] := mmContasPagarID.Value;
        X := X + 1;
      end;
      mmContasPagar.Next;
    end;

    mmContasPagar.First;
    frm_conta_descontada.pagar := true;
    frm_conta_descontada.Total := RoundTo(valor_a_pagar, -2);
    frm_conta_descontada.historico := descricao;
    frm_conta_descontada.ShowModal;
    if frm_conta_descontada.ModalResult = mrok then
    begin
      mmContasPagar.First;
      while not mmContasPagar.Eof do
      begin
        if mmContasPagarCheck.Value = true then
        begin
          mmContasPagar.Edit;
          mmContasPagarVALOR_PAGO.Value := mmContasPagarVALOR_CORRIGIDO.Value *
            frm_conta_descontada.Rateio;
          mmContasPagar.Post;
          try
            if not dao.cn.InTransaction then
              dao.cn.StartTransaction;
            dao.Exec_sql.sql.clear;

            if frm_conta_descontada.cheque_master <> 0 then
              sql_cheque := ', CHEQUE = ' +
                inttostr(frm_conta_descontada.cheque_master)
            else
              sql_cheque := '';

            dao.Exec_sql.sql.Add('UPDATE CP1 SET DTAPAG = ' +
              QuotedStr(formatdatetime('dd/mm/yyyy',
              strtodate(frm_conta_descontada.edDtMov.Text))) + sql_cheque +
              ', VLR_CORRIGIDO = ' +
              StringReplace(mmContasPagarVALOR_CORRIGIDO.AsString, ',', '.',
              [rfReplaceAll]) + ', VALOR_PAGO = ' +
              StringReplace(mmContasPagarVALOR_PAGO.AsString, ',', '.',
              [rfReplaceAll]) + ' WHERE ID = ' + mmContasPagarID.AsString);
            dao.Exec_sql.Execsql;
            dao.grava_log(dao.Exec_sql.sql.Text, '');;
            dao.cn.Commit;
          except
            dao.cn.rollback;
          end;
        end;
        mmContasPagar.Next;
      end;
    end;
  end;
  btokClick(Self);
  mmContasPagar.EnableControls;
end;

procedure TFr_contas_pagar.sBExcluirPgtoClick(Sender: TObject);
begin
  if VlrTotalSel > 0 then
  begin
    if MessageDlg('Deseja Excluir os Titulos Selecionados?', mtConfirmation,
      [mbyes, mbno], 0) = mryes then
    begin

      if not FMFUN.LiberarProcesso then
        Exit;

      if not(dao.cn.InTransaction) then
        dao.cn.StartTransaction;

      mmContasPagar.First;
      mmContasPagar.DisableControls;
      while not mmContasPagar.Eof do
      begin
        if mmContasPagarCheck.Value = true then
          dao.Execsql('delete from cp1 where dtapag is null and id =' + mmContasPagarID.AsString);
        mmContasPagar.Next;
      end;
    end;
    dao.cn.Commit;
    btokClick(Self);
    mmContasPagar.EnableControls;
  end;
end;

procedure TFr_contas_pagar.edValorIniExit(Sender: TObject);
begin
  edValorFim.Value := edValorIni.Value;
end;

procedure TFr_contas_pagar.BtnLimparClick(Sender: TObject);
begin
  Zzcod_empresa.clear;
  Zzcod_fornecedor1.clear;
  Zzcod_fop1.clear;
  Ed_titulo1.clear;
  ed_titulo2.clear;
  edValorIni.Value := 0;
  edValorFim.Value := 0;
  LbNom_fornecedor1.Caption := '...';
  Lbnom_fop1.Caption := '...';
  Lbnom_empresa1.Caption := '...';
end;

procedure TFr_contas_pagar.sbAbrirParcClick(Sender: TObject);
begin
  if mmParcelasID.IsNull then
  begin
    MessageBox(handle,
      'Parcela não pode ser aberta pois as parcelas não foram salvas!', 'ORBI',
      MB_ICONWARNING);
    Exit;
  end;

  ativa_cp1(mmParcelasID.AsString);
  mostra_campos('Pr');
  Pccop.ActivePage := tab_dados;
  BtSalvar.enabled := false;
end;

procedure TFr_contas_pagar.preenche_grid_parc;
begin
  ckParcelado.Visible := true;
  ckParcelado.Checked := true;
  ckParcelado.enabled := false;
  mmParcelas.close;
  mmParcelas.EmptyTable;
  mmParcelas.open;
  VlrTotalParc := 0;
  DataInicialParc := 0;
  while not(Q_parcela.Eof) do
  begin
    mmParcelas.Append;
    mmParcelasID.AsString := Q_parcela.fieldbyname('id').AsString;
    mmParcelasTITULO.AsString := Q_parcela.fieldbyname('titulo').AsString;
    mmParcelasSEQUENCIA.AsString := Q_parcela.fieldbyname('sequencia').AsString;
    mmParcelasRAZAO_SOCIAL.AsString :=
      Q_parcela.fieldbyname('razao_social').AsString;
    mmParcelasHISTORICO.AsString := Q_parcela.fieldbyname('historico1')
      .AsString;
    mmParcelasDTAVEN.AsString := Q_parcela.fieldbyname('dtaven').AsString;
    if DataInicialParc = 0 then
      DataInicialParc := mmParcelasDTAVEN.Value;
    mmParcelasVALOR.AsString := Q_parcela.fieldbyname('valor').AsString;
    mmParcelasDTAPAG.AsString := Q_parcela.fieldbyname('dtapag').AsString;
    mmParcelasVALOR_PAGO.AsString := Q_parcela.fieldbyname
      ('valor_pago').AsString;
    mmParcelasNOM_FOP.AsString := Q_parcela.fieldbyname('nom_fop').AsString;
    VlrTotalParc := VlrTotalParc + mmParcelasVALOR.Value;
    mmParcelas.Post;
    Q_parcela.Next;
  end;
  mmParcelas.First;
  stTotalParc.Caption := formatfloat('R$ #,###,##0.00', VlrTotalParc);

end;

procedure TFr_contas_pagar.sbGerarParcClick(Sender: TObject);
var
  totais, Total, saldo, valor_parc: double;
  dtvcto: TDate;
  X, Y, dia, mes, ano: Integer;
  data_str: string;
begin
  if PrId_master.Text = '' then
    PrId_master.Text := Prid.Text;

  mmParcelas.close;
  mmParcelas.EmptyTable;
  mmParcelas.open;
  Total := VlrTotalParc;
  totais := 0;

  if edEntrada.Value > 0 then
  begin
    mmParcelas.Append;
    mmParcelasID.AsString := Prid.Text;
    mmParcelasID_MASTER.AsString := PrId_master.Text;
    mmParcelasTITULO.Value := copy(Prtitulo.Text, 1, 6) + '-0';
    mmParcelasRAZAO_SOCIAL.Value := Lbnom_fornecedor.Caption;
    mmParcelasHISTORICO.Value := Prhistorico1.Text;
    mmParcelasDTAVEN.Value := Prdtaven.date;
    mmParcelasVALOR.Value := edEntrada.Value;
    mmParcelasNOM_FOP.Value := Lbnom_fop.Caption;
    mmParcelasCOD_FOP.AsString := Prcod_fop.Text;
    mmParcelasCOD_FORNECEDOR.AsString := Prcod_fornecedor.Text;
    mmParcelasID_PLANO_CONTAS.AsString := Prid_plano_contas.Text;
    mmParcelasCOD_EMPRESA.AsString := Prcod_empresa.Text;
    if PrCOD_REPRESENTANTE.Text <> '' then
      mmParcelasID_REPRESENTANTE.AsString := PrCOD_REPRESENTANTE.Text;
    mmParcelas.Post;
    totais := totais + mmParcelasVALOR.Value;
  end;

  saldo := Total - edEntrada.Value;
  valor_parc := saldo / edNumParc.Value;
  mes := strtoint(FormatDateTime('mm', Prdtaven.date));
  ano := strtoint(FormatDateTime('yyyy', Prdtaven.date));
  for X := 1 to edNumParc.AsInteger do
  begin
    mmParcelas.Append;
    mmParcelasID_MASTER.AsString := PrId_master.Text;
    mmParcelasTITULO.Value := copy(Prtitulo.Text, 1, 6) + '-' + inttostr(X);
    mmParcelasRAZAO_SOCIAL.Value := Lbnom_fornecedor.Caption;
    mmParcelasHISTORICO.Value := Prhistorico1.Text;
    dia := strtoint(edDiaVcto.Text);
    mes := mes + 1;

    if mes > 12 then
    begin
      mes := mes - 12;
      ano := ano + 1;
    end;

    // data_str := inttostr(dia) + '/' + formatdatetime('mm/yyyy', Prdtaven.Date + (30 * x));
    data_str := inttostr(dia) + '/' + inttostr(mes) + '/' + inttostr(ano);

    if not(FMFUN.ValidaData(data_str)) then
      dia := dia - 1
    else
      dtvcto := strtodate(data_str);
    FMFUN.ValidaData(data_str);

    if DayOfTheWeek(dtvcto) = 6 then
      dtvcto := dtvcto + 1;
    if DayOfTheWeek(dtvcto) = 7 then
      dtvcto := dtvcto + 1;

    mmParcelasDTAVEN.Value := dtvcto;
    mmParcelasVALOR.Value := valor_parc;
    mmParcelasNOM_FOP.Value := Lbnom_fop.Caption;
    mmParcelasCOD_FOP.AsString := Prcod_fop.Text;
    mmParcelasCOD_FORNECEDOR.AsString := Prcod_fornecedor.Text;
    mmParcelasID_PLANO_CONTAS.AsString := Prid_plano_contas.Text;
    mmParcelasCOD_EMPRESA.AsString := Prcod_empresa.Text;
    if PrCOD_REPRESENTANTE.Text <> '' then
      mmParcelasID_REPRESENTANTE.AsString := PrCOD_REPRESENTANTE.Text;
    mmParcelas.Post;
    totais := totais + mmParcelasVALOR.Value;
  end;
  stTotalParc.Caption := formatfloat('R$ #,###,##0.00', totais);
  BtSalvar.enabled := true;
end;

procedure TFr_contas_pagar.ckParceladoClick(Sender: TObject);
begin
  if ckParcelado.Checked then
  begin
    Tab_parcelas.TabVisible := true;
    Pccop.TabIndex := 3;
    VlrTotalParc := Prvalor.Value;
    stTotalParc.Caption := formatfloat('R$ #,###,##0.00', Prvalor.Value);
    DataInicialParc := Prdtaven.date;
    edDiaVcto.Text := copy(Prdtaven.Text, 1, 2);
  end
  else
  begin
    Tab_parcelas.TabVisible := false;
  end;
end;

procedure TFr_contas_pagar.dgParcelasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
  IsChecked: array [Boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or
    DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  if (mmParcelasVALOR_PAGO.Value > 0) and (not mmParcelasVALOR_PAGO.IsNull) then
  begin
    dgParcelas.Canvas.Font.Color := clNavy;
    if gdSelected in State then
    begin
      dgParcelas.Canvas.Brush.Color := clNavy;
      dgParcelas.Canvas.Font.Color := clWhite;
    end;
  end
  else if (mmParcelasDTAVEN.Value < now) then
  begin
    dgParcelas.Canvas.Font.Color := clRed;
    dgParcelas.Canvas.Font.Style := [fsBold];
    if gdSelected in State then
    begin
      dgParcelas.Canvas.Brush.Color := clRed;
      dgParcelas.Canvas.Font.Color := clWhite;
    end;
  end
  else
  begin
    dgParcelas.Canvas.Font.Color := clGreen;
    dgParcelas.Canvas.Font.Style := [fsBold];
    if gdSelected in State then
    begin
      dgParcelas.Canvas.Brush.Color := clGreen;
      dgParcelas.Canvas.Font.Color := clWhite;
    end
  end;

  dgParcelas.DefaultDrawDataCell(Rect, Column.Field, State);

  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = DBCheckBox1.DataField) then
    begin
      DBCheckBox1.Left := Rect.Left + dgParcelas.Left + 2;
      DBCheckBox1.Top := Rect.Top + dgParcelas.Top + 2;
      DBCheckBox1.Width := Rect.Right - Rect.Left;
      DBCheckBox1.Height := Rect.Bottom - Rect.Top;

      DBCheckBox1.Visible := true;
    end
  end
  else
  begin
    if (Column.Field.FieldName = DBCheckBox1.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := IsChecked[Column.Field.AsBoolean];

      dgParcelas.Canvas.FillRect(Rect);
      DrawFrameControl(dgParcelas.Canvas.handle, DrawRect, DFC_BUTTON,
        DrawState);
    end;
  end;
end;

procedure TFr_contas_pagar.BtSalvarClick(Sender: TObject);
var
  sql_insert, id_plano_contas, cod_empresa, representante: string;
begin
  if PrId_master.Text <> '' then
  begin
    try
      if not dao.cn.InTransaction then
        dao.cn.StartTransaction;
      dao.Exec_sql.sql.clear;
      dao.Exec_sql.sql.Add('DELETE FROM CP1 WHERE ID_MASTER = ' +
        PrId_master.Text);
      dao.Exec_sql.Execsql;
      dao.cn.Commit;
    except
      dao.cn.rollback;
    end;
    try
      if not dao.cn.InTransaction then
        dao.cn.StartTransaction;
      dao.Exec_sql.sql.clear;
      dao.Exec_sql.sql.Add('DELETE FROM CP1 WHERE ID = ' + Prid.Text);
      dao.Exec_sql.Execsql;
      dao.cn.Commit;
    except
      dao.cn.rollback;
    end;
    mmParcelas.First;
    while not mmParcelas.Eof do
    begin
      if mmParcelasID_PLANO_CONTAS.AsString = '' then
        id_plano_contas := 'null'
      else
        id_plano_contas := mmParcelasID_PLANO_CONTAS.AsString;

      if mmParcelasCOD_EMPRESA.AsString = '' then
        cod_empresa := 'null'
      else
        cod_empresa := mmParcelasCOD_EMPRESA.AsString;

      if not mmParcelasID_REPRESENTANTE.IsNull then
        representante := mmParcelasID_REPRESENTANTE.AsString
      else
        representante := 'null';

      if not mmParcelasID.IsNull then
      begin
        sql_insert :=
          'INSERT INTO CP1 (ID, ID_MASTER, SEQUENCIA, TITULO, HISTORICO1, DTAVEN, VALOR, COD_FOP, COD_FORNECEDOR, ID_PLANO_CONTAS, COD_EMPRESA, COD_REPRESENTANTE)'
          + ' VALUES ( ' + mmParcelasID.AsString + ',' +
          mmParcelasID_MASTER.AsString + ', 1,' +
          QuotedStr(mmParcelasTITULO.AsString) + ',' +
          QuotedStr(mmParcelasHISTORICO.AsString) + ',' +
          QuotedStr(formatdatetime('dd/mm/yyyy', mmParcelasDTAVEN.AsDateTime)) +
          ',' + StringReplace(mmParcelasVALOR.AsString, ',', '.', [rfReplaceAll]
          ) + ',' + mmParcelasCOD_FOP.AsString + ',' +
          mmParcelasCOD_FORNECEDOR.AsString + ',' + id_plano_contas + ',' +
          cod_empresa + ',' + representante + ')';
      end
      else
      begin
        sql_insert :=
          'INSERT INTO CP1 (ID_MASTER, SEQUENCIA, TITULO, HISTORICO1, DTAVEN, VALOR, COD_FOP, COD_FORNECEDOR, ID_PLANO_CONTAS, COD_EMPRESA, COD_REPRESENTANTE )'
          + ' VALUES ( ' + mmParcelasID_MASTER.AsString + ', 1,' +
          QuotedStr(mmParcelasTITULO.AsString) + ',' +
          QuotedStr(mmParcelasHISTORICO.AsString) + ',' +
          QuotedStr(formatdatetime('dd/mm/yyyy', mmParcelasDTAVEN.AsDateTime)) +
          ',' + StringReplace(mmParcelasVALOR.AsString, ',', '.', [rfReplaceAll]
          ) + ',' + mmParcelasCOD_FOP.AsString + ',' +
          mmParcelasCOD_FORNECEDOR.AsString + ',' + id_plano_contas + ',' +
          cod_empresa + ',' + representante + ')';
      end;
      try
        if not dao.cn.InTransaction then
          dao.cn.StartTransaction;
        dao.Exec_sql.sql.clear;
        dao.Exec_sql.sql.Add(sql_insert);
        dao.Exec_sql.Execsql;
        dao.cn.Commit;
      except
        dao.cn.rollback;
      end;
      mmParcelas.Next;
    end;

    dao.Geral1('select min(ID) AS ID FROM CP1 WHERE ID_MASTER = ' +
      mmParcelasID_MASTER.AsString);

    ativa_cp1(dao.Q1.fieldbyname('id').AsString);
    mostra_campos('Pr');
    BtSalvar.enabled := false;
  end;
end;

procedure TFr_contas_pagar.edEntradaExit(Sender: TObject);
begin
  if edEntrada.Value >= VlrTotalParc then
  begin
    showmessage('Valor de Entrada não pode ser maior que valor total!');
    edEntrada.SetFocus;
    Exit;
  end;
end;

procedure TFr_contas_pagar.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if (ActiveControl.Name = 'Prhistorico1') then
      Exit;
    // se for, passa o foco para o próximo campo, zerando o valor da variável Key
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TFr_contas_pagar.sbCancPgtoClick(Sender: TObject);
var
  cheque_compensado: Integer;
begin
  mmContasPagar.First;
  mmContasPagar.DisableControls;
  while not mmContasPagar.Eof do
  begin
    if mmContasPagarCheck.Value = true then
    begin
      if not mmContasPagarCHEQUE.IsNull then
      begin
        dao.Geral3
          ('SELECT sum(coalesce(a.EXTRATO, 0)) extrato FROM CHEQUES a where a.ID_MASTER = '
          + mmContasPagarCHEQUE.AsString);
        cheque_compensado := dao.Q3.fieldbyname('extrato').AsInteger;

        if cheque_compensado > 0 then
          showmessage
            ('Há cheques compensados relacionados. Por isso, não pode ser cancelado!')
        else
        begin
          try
            if not dao.cn.InTransaction then
              dao.cn.StartTransaction;
            dao.Exec_sql.sql.clear;
            dao.Exec_sql.sql.Add('DELETE FROM CHEQUES WHERE ID_MASTER = ' +
              mmContasPagarCHEQUE.AsString);
            dao.Exec_sql.Execsql;

            dao.cn.Commit;
          except
            dao.cn.rollback;
          end;
          // exclui os extratos relacionados...
          FMFUN.ExcluirExtratoConta(mmContasPagarID.AsString, 'D',
            mmContasPagarVALOR_PAGO.Value);

        end;
      end
      else
        // exclui os extratos relacionados...
        FMFUN.ExcluirExtratoConta(mmContasPagarID.AsString, 'D',
          mmContasPagarVALOR_PAGO.Value);
    end;
    mmContasPagar.Next;
  end;
  btokClick(Self);
  mmContasPagar.EnableControls;
end;

procedure TFr_contas_pagar.TotalVales;
var
  mes, cmd: string;
begin

  if trim(PrCOD_REPRESENTANTE.Text) = '' then
    Exit;

  if Prdtaven.date = 0 then
    mes := FormatDateTime('m/yyyy', now)
  else
    mes := FormatDateTime('m/yyyy', Prdtaven.date);

  cmd := 'SELECT coalesce(f.SALARIO, 0) as salario, case when coalesce(f.SALARIO, 0) = 0 then 0 else coalesce((select sum(a.VALOR) from cp1 a where a.COD_REPRESENTANTE = '
    + PrCOD_REPRESENTANTE.Text +
    ' and a.ID_PLANO_CONTAS in (select c.VALE_PLANO_CONTAS from CONFIGURACAO c) and extract(MONTH FROM a.DTAVEN)||''/''||extract(YEAR FROM a.DTAVEN) = '
    + QuotedStr(mes) + '),0) end as total_vale, ' +
    'case when coalesce(f.SALARIO, 0) = 0 then 0 else ((coalesce((select sum(a.VALOR) from cp1 a where a.COD_REPRESENTANTE = '
    + PrCOD_REPRESENTANTE.Text +
    ' and a.ID_PLANO_CONTAS in (select c.VALE_PLANO_CONTAS from CONFIGURACAO c) and extract(MONTH FROM a.DTAVEN)||''/''||extract(YEAR FROM a.DTAVEN) = '
    + QuotedStr(mes) + '),0)/coalesce(f.SALARIO,1)) * 100) end as perc_salario '
    + ' FROM REPRESENTANTE f where 1 = 1 and f.id = ' +
    PrCOD_REPRESENTANTE.Text;

  dao.Geral3(cmd);

  lbTotalVale.Caption := formatfloat('R$ #,###,##0.00',
    dao.Q3.fieldbyname('total_vale').AsCurrency);
  lbPercSal.Caption := formatfloat('% ##0.00',
    dao.Q3.fieldbyname('perc_salario').AsFloat);
  if dao.Q3.fieldbyname('perc_salario').AsFloat > 80 then
    showmessage('Total de Vales no mês está acima do Permitido!');
end;

procedure TFr_contas_pagar.PrCOD_REPRESENTANTEExit(Sender: TObject);
begin
  if trim(PrCOD_REPRESENTANTE.Text) = '' then
  begin
    Lbnom_representante.Caption := '...';
    gbVales.Visible := false;
  end;

  if PrCOD_REPRESENTANTE.Text <> '' then
  begin
    dao.Geral2
      ('select nom_representante, funcionario from representante where id=' +
      QuotedStr(PrCOD_REPRESENTANTE.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_representante.Caption :=
        dao.q2.fieldbyname('nom_representante').AsString;
      gbVales.Visible := true;
      if (dao.q2.fieldbyname('funcionario').AsString = '1') or
        (dao.q2.fieldbyname('funcionario').AsString = '2') then
        TotalVales;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      PrCOD_REPRESENTANTE.Text := '';
      PrCOD_REPRESENTANTE.SetFocus;
      gbVales.Visible := false;
      Exit;
    end;
  end;

end;

procedure TFr_contas_pagar.PrCOD_REPRESENTANTEButtonClick(Sender: TObject);
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
  chamou_form := 'fr_cp_representante';
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

procedure TFr_contas_pagar.zzRepresentanteButtonClick(Sender: TObject);
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
  chamou_form := 'fr_zz_cp_representante';
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

procedure TFr_contas_pagar.zzRepresentanteExit(Sender: TObject);
begin
  if trim(zzRepresentante.Text) = '' then
    lbNom_Representante1.Caption := '...';

  if zzRepresentante.Text <> '' then
  begin
    dao.Geral2
      ('select nom_representante, funcionario from representante where ativo = ''S'' and id='
      + QuotedStr(zzRepresentante.Text));
    if dao.q2.RecordCount > 0 then
      lbNom_Representante1.Caption :=
        dao.q2.fieldbyname('nom_representante').AsString
    else
    begin
      dao.msg('Registro não Encontrado!');
      zzRepresentante.Text := '';
      zzRepresentante.SetFocus;
      Exit;
    end;
  end;

end;

procedure TFr_contas_pagar.zPrId_Plano_ContasButtonClick(Sender: TObject);
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
  chamou_form := 'fr_zz_cp_plano_conta';
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

procedure TFr_contas_pagar.zPrId_Plano_ContasExit(Sender: TObject);
var
  sqlplano: string;
begin
  if trim(zPrId_Plano_Contas.Text) = '' then
  begin
    zLbnom_plano_contas_N1.Caption := '...';
    zLbnom_plano_contas_N2.Caption := '...';
    zLbnom_plano_contas_N3.Caption := '...';
    zLbnom_plano_contas_N4.Caption := '...';
  end;

  if (zPrId_Plano_Contas.Text <> '') then
  begin
    sqlplano := 'SELECT ' + '  PC4.ID, ' + '  PC4.NR_CONTA, ' +
      '  TRIM(PC1.NR_CONTA)||''-''||PC1.DESCRICAO DESCRICAO1, ' +
      '  TRIM(PC2.NR_CONTA)||''-''||PC2.DESCRICAO DESCRICAO2, ' +
      '  TRIM(PC3.NR_CONTA)||''-''||PC3.DESCRICAO DESCRICAO3, ' +
      '  TRIM(PC4.NR_CONTA)||''-''||PC4.DESCRICAO DESCRICAO4 ' + 'FROM ' +
      '  PLANO_CONTAS PC4 ' +
      'INNER JOIN PLANO_CONTAS PC3 ON (PC3.ID = PC4.ID_PAI) ' +
      'INNER JOIN PLANO_CONTAS PC2 ON (PC2.ID = PC3.ID_PAI) ' +
      'INNER JOIN PLANO_CONTAS PC1 ON (PC1.ID = PC2.ID_PAI) ' +
      'WHERE (PC3.ID IN (''43'') or PC3.ID IN (''119'')  OR PC3.ID IN (''120'')  OR PC3.ID IN (''30'') OR PC3.ID IN (''36'') OR PC3.ID IN (''40'') OR PC1.ID IN(''58'')) AND PC4.ID = '
      + QuotedStr(zPrId_Plano_Contas.Text);

    dao.Geral2(sqlplano);
    if dao.q2.RecordCount > 0 then
    begin
      zLbnom_plano_contas_N1.Caption :=
        dao.q2.fieldbyname('descricao1').AsString;
      zLbnom_plano_contas_N2.Caption :=
        dao.q2.fieldbyname('descricao2').AsString;
      zLbnom_plano_contas_N3.Caption :=
        dao.q2.fieldbyname('descricao3').AsString;
      zLbnom_plano_contas_N4.Caption :=
        dao.q2.fieldbyname('descricao4').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      zPrId_Plano_Contas.Text := '';
      zPrId_Plano_Contas.SetFocus;
      Exit;
    end;

  end;
end;

procedure TFr_contas_pagar.Zzcod_empresaExit(Sender: TObject);
begin
  if trim(Zzcod_empresa.Text) = '' then
    Lbnom_empresa.Caption := '...';

  if Zzcod_empresa.Text <> '' then
  begin
    dao.Geral2('select nom_empresa from empresa where cod_empresa=' +
      QuotedStr(Zzcod_empresa.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_empresa1.Caption := dao.q2.fieldbyname('nom_empresa').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Zzcod_empresa.Text := '';
      Zzcod_empresa.SetFocus;
      Exit;
    end;

  end;

end;

procedure TFr_contas_pagar.PrdtavenExit(Sender: TObject);
begin
  TotalVales;
end;

procedure TFr_contas_pagar.redimensionar(expandir: Boolean);
var
  largura: Integer;
begin
  largura := Fr_contas_pagar.Width;
  if expandir then
  begin
    Fr_contas_pagar.Width := 1222;
    Fr_contas_pagar.Left := (Screen.DesktopWidth - Fr_contas_pagar.Width) DIV 2;

  end
  else
  begin
    Fr_contas_pagar.Width := 610;
    if largura <> Fr_contas_pagar.Width then
      Fr_contas_pagar.Left := Fr_contas_pagar.Left + 200;
  end;
end;

procedure TFr_contas_pagar.tab_localizarShow(Sender: TObject);
begin
  redimensionar(false);
end;

procedure TFr_contas_pagar.tab_resultadoShow(Sender: TObject);
begin
  redimensionar(true);
end;

procedure TFr_contas_pagar.tab_dadosShow(Sender: TObject);
begin
  redimensionar(false);
end;

procedure TFr_contas_pagar.Tab_parcelasShow(Sender: TObject);
begin
  redimensionar(true);
end;

procedure TFr_contas_pagar.fR_RELATORIOGetValue(const VarName: String;
  var Value: Variant);
begin
  if VarName = 'empresa' then
    Value := nom_empresa
  else if VarName = 'dtaini' then
    Value := FormatDateTime('dd/mm/yyyy', EDdtaini.date)
  else if VarName = 'dtafin' then
    Value := FormatDateTime('dd/mm/yyyy', Eddtafin.date);
end;

end.
