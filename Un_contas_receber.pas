unit Un_contas_receber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask, ExtCtrls, Buttons, Grids,
  BaseGrid, AdvGrid, DateUtils, ACBrBoletoConversao,
  DBGrids, DB, RxMemDS, DBCtrls,
  sPageControl, sSpeedButton, sLabel, sPanel, sBitBtn, sGroupBox, sCheckBox,
  ACBrBoleto, ACBrBase, sRadioButton, acDBGrid,
  sCurrEdit, sCurrencyEdit, sEdit, sMaskEdit, sCustomComboEdit, sTooledit,
  sComboEdit, sDBCheckBox, sMemo, frxClass,  AdvObj,
  ACBrBoletoFCFR, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFr_contas_receber = class(TForm)
    Pccor: TsPageControl;
    tab_localizar: TsTabSheet;
    tab_resultado: TsTabSheet;
    tab_dados: TsTabSheet;
    Pcdados_cr1: TsPageControl;
    Panel8: tsPanel;
    TabSheet2: TsTabSheet;
    TabSheet3: TsTabSheet;
    tab_deposito: TsTabSheet;
    GroupBox1: TsGroupBox;
    Label8: tsLabel;
    Label10: tsLabel;
    Label22: tsLabel;
    Lbnom_empresa: tsLabel;
    Prtitulo: TsEdit;
    Prsequencia: TsEdit;
    Prconferido: tscheckbox;
    Prid: TsEdit;
    Prcod_empresa: TsComboEdit;
    GroupBox2: TsGroupBox;
    Label11: tsLabel;
    Label12: tsLabel;
    Label13: tsLabel;
    lbrec: tsLabel;
    Label16: tsLabel;
    Label17: tsLabel;
    Lbnom_fop: tsLabel;
    Prdtaven: TsDateEdit;
    Prvalor: TsCurrencyEdit;
    Prhistorico1: TsMemo;
    Prdtarec: TsDateEdit;
    Prvalor_recebido: TsCurrencyEdit;
    Prcod_fop: TsComboEdit;
    Prcod_cliente: TsComboEdit;
    Label18: tsLabel;
    Lbnom_cliente: tsLabel;
    SpeedButton1: TsSpeedButton;
    GroupBox3: TsGroupBox;
    GroupBox4: TsGroupBox;
    Sg_deposito: TAdvStringGrid;
    Btnov: TsBitBtn;
    btalt: TsBitBtn;
    btgra: TsBitBtn;
    btcan: TsBitBtn;
    btexc: TsBitBtn;
    Q_cr1: TFDQuery;
    Q_deposito_cr1: TFDQuery;
    Q_cheque_terc_cr1: TFDQuery;
    Q_resultado: TFDQuery;
    bt_loc_cheque: TsBitBtn;
    Gbdados_cheque: TsGroupBox;
    BitBtn3: TsBitBtn;
    Label7: tsLabel;
    Label19: tsLabel;
    Label20: tsLabel;
    Label21: tsLabel;
    Label23: tsLabel;
    Label24: tsLabel;
    Label25: tsLabel;
    Label26: tsLabel;
    Lbnr_cheque: tsLabel;
    LbNr_banco: tsLabel;
    Lbnr_agencia: tsLabel;
    lbvalor_cheque: tsLabel;
    LbData_vencimento: tsLabel;
    LbData_emissao: tsLabel;
    Lbnom_titular: tsLabel;
    Lbnr_cc: tsLabel;
    Sgcht_cr1: TAdvStringGrid;
    lbid: tsLabel;
    Panel10: tsPanel;
    GroupBox5: TsGroupBox;
    Dpcod_conta: TsComboEdit;
    lbconta: tsLabel;
    Dpjustificativa: TsEdit;
    Dpdta_deposito: TsDateEdit;
    Dpvlr_deposito: TsCurrencyEdit;
    Label27: tsLabel;
    Label29: tsLabel;
    Label30: tsLabel;
    Label31: tsLabel;
    btexcdep: TsBitBtn;
    btcandep: TsBitBtn;
    btgradep: TsBitBtn;
    btaltdep: TsBitBtn;
    btnovdep: TsBitBtn;
    Dpid: TsEdit;
    Dpnr_documento: TsEdit;
    Dpseq: TsEdit;
    Dpnr_deposito: TsEdit;
    Label15: tsLabel;
    GroupBox6: TsGroupBox;
    Prid_plano_contas: TsComboEdit;
    Lbnom_plano_contas_N1: tsLabel;
    Lbnom_plano_contas_N2: tsLabel;
    Lbnom_plano_contas_N3: tsLabel;
    Lbnom_plano_contas_N4: tsLabel;
    mmContasPagar: TRxMemoryData;
    mmContasPagarID: TIntegerField;
    mmContasPagarTITULO: TStringField;
    mmContasPagarSEQUENCIA: TIntegerField;
    mmContasPagarRAZAO_SOCIAL: TStringField;
    mmContasPagarHISTORICO: TStringField;
    mmContasPagarDTAVEN: TDateField;
    mmContasPagarDTAPAG: TDateField;
    mmContasPagarVALOR: TCurrencyField;
    mmContasPagarVALOR_PAGO: TCurrencyField;
    mmContasPagarNOM_FOP: TStringField;
    mmContasPagarCheck: TBooleanField;
    dsContapagar: TDataSource;
    Panel11: tsPanel;
    Panel12: tsPanel;
    GroupBox7: TsGroupBox;
    stTotal: tsLabel;
    GroupBox8: TsGroupBox;
    stTotalSel: tsLabel;
    DBCheckBox1: TDBCheckBox;
    Panel13: tsPanel;
    dgContasPagar: Tdbgrid;
    sbAbrir: TsSpeedButton;
    Panel15: tsPanel;
    GroupBox9: TsGroupBox;
    EDdtaini: TsDateEdit;
    GroupBox10: TsGroupBox;
    Eddtafin: TsDateEdit;
    GroupBox11: TsGroupBox;
    Rb_filtro_vencimento: TsRadioButton;
    Rb_filtro_pagamento: TsRadioButton;
    GroupBox12: TsGroupBox;
    Lbnom_empresa1: tsLabel;
    Zzcod_empresa: TsComboEdit;
    GroupBox13: TsGroupBox;
    LbNom_cliente1: tsLabel;
    Zzcod_cliente1: TsComboEdit;
    gbFormaPgto: TsGroupBox;
    Lbnom_fop1: tsLabel;
    Zzcod_fop1: TsComboEdit;
    gbtitulo1: TsGroupBox;
    Ed_titulo1: TsEdit;
    gbtitulo2: TsGroupBox;
    ed_titulo2: TsEdit;
    gbValor1: TsGroupBox;
    edValorIni: TsCurrencyEdit;
    gbvalor2: TsGroupBox;
    edValorFim: TsCurrencyEdit;
    GroupBox19: TsGroupBox;
    Rb_efetivados: TsRadioButton;
    Rb_nao_efetivados: TsRadioButton;
    rbVencidos: TsRadioButton;
    Rb_todos: TsRadioButton;
    GroupBox20: TsGroupBox;
    zz_ord_titulo: TsRadioButton;
    zz_ord_vencimento: TsRadioButton;
    zz_ord_pagamento: TsRadioButton;
    zz_ord_Cliente: TsRadioButton;
    zz_ord_valor: TsRadioButton;
    Panel1: tsPanel;
    BtnLimpar: TsBitBtn;
    btok: TsBitBtn;
    BitBtn2: TsBitBtn;
    Bt_imp_cop: TsBitBtn;
    gbNF: TsGroupBox;
    ED_NF: TsEdit;
    sbConfPgto: TsSpeedButton;
    sbCancPgto: TsSpeedButton;
    mmContasPagarEXTRATO: TIntegerField;
    PrExtrato: TsEdit;
    mmContasPagarVALOR_CORRIGIDO: TCurrencyField;
    rbParciais: TsRadioButton;
    gbPlanoContas: TsGroupBox;
    zLbnom_plano_contas_N1: tsLabel;
    zLbnom_plano_contas_N2: tsLabel;
    zLbnom_plano_contas_N3: tsLabel;
    zLbnom_plano_contas_N4: tsLabel;
    zPrId_Plano_Contas: TsComboEdit;
    lbCCBoleto: tsLabel;
    PrCONTA_BOLETO: TsComboEdit;
    Label40: tsLabel;
    btBoleto: TsBitBtn;
    btAltTitulo: TsSpeedButton;
    btGrTitulo: TsSpeedButton;
    sLabel1: tsLabel;
    PrInstrucao_Boleto: TsEdit;
    BtnEmailBoleto: TsBitBtn;
    tabAgruparPedidos: TsTabSheet;
    dgPedidosAgrupar: Tdbgrid;
    ckAgrupar: TsDBCheckBox;
    q_pedidos_agrupar: TFDQuery;
    ds_pedidos_agrupar: TDataSource;
    GBPedido: TsGroupBox;
    ed_pedido: TsEdit;
    mmContasPagarNR_DOCUMENTO: TIntegerField;
    CheckTodos: tscheckbox;
    gbHistorico: TsGroupBox;
    edHistorico: TsEdit;
    mmContasPagarTOTAL_PEDIDO: TCurrencyField;
    gbContaBoleto: TsGroupBox;
    lbContaBoleto: tsLabel;
    ZzContaBoleto: TsComboEdit;
    fR_RELATORIO: TfrxReport;
    mmContasPagarDESCONTADA: TStringField;
    PrProtesto: tscheckbox;
    rbProtestados: TsRadioButton;
    mmContasPagarCONTA: TStringField;
    q_pedidos_agruparNUMDOC: TIntegerField;
    q_pedidos_agruparDTADOC: TDateField;
    q_pedidos_agruparCOD_CLIENTE: TIntegerField;
    q_pedidos_agruparCLIENTE: TStringField;
    q_pedidos_agruparTOT_BRUTO: TBCDField;
    q_pedidos_agruparTOT_LIQUIDO: TBCDField;
    q_pedidos_agruparREPRESENTANTE: TStringField;
    q_pedidos_agruparOBSERVACOES_PEDIDO: TMemoField;
    q_pedidos_agruparAGRUPADO: TStringField;
    procedure Ed_titulo1Exit(Sender: TObject);
    procedure ed_titulo2Exit(Sender: TObject);
    procedure EDdtainiKeyPress(Sender: TObject; var Key: Char);
    procedure Zzcod_empresaButtonClick(Sender: TObject);
    procedure Zzcod_empresaExit(Sender: TObject);
    procedure Zzcod_empresaKeyPress(Sender: TObject; var Key: Char);
    procedure Zzcod_fop1ButtonClick(Sender: TObject);
    procedure Zzcod_fop1Exit(Sender: TObject);
    procedure Zzcod_fop1KeyPress(Sender: TObject; var Key: Char);
    procedure Zzcod_cliente1ButtonClick(Sender: TObject);
    procedure Zzcod_cliente1Exit(Sender: TObject);
    procedure Zzcod_cliente1KeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_empresaButtonClick(Sender: TObject);
    procedure Prcod_empresaExit(Sender: TObject);
    procedure Prcod_empresaKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_fopButtonClick(Sender: TObject);
    procedure Prcod_fopExit(Sender: TObject);
    procedure Prcod_fopKeyPress(Sender: TObject; var Key: Char);
    procedure PrtituloExit(Sender: TObject);
    procedure PrtituloKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_clienteButtonClick(Sender: TObject);
    procedure Prcod_clienteKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_clienteExit(Sender: TObject);
    procedure btaltClick(Sender: TObject);
    procedure btcanClick(Sender: TObject);
    procedure btexcClick(Sender: TObject);
    procedure btgraClick(Sender: TObject);
    procedure BtnovClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btokClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bt_loc_chequeClick(Sender: TObject);
    procedure Sg_corDblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure BitBtn3Click(Sender: TObject);
    procedure Dpcod_contaButtonClick(Sender: TObject);
    procedure Dpcod_contaExit(Sender: TObject);
    procedure Dpcod_contaKeyPress(Sender: TObject; var Key: Char);
    procedure btexcdepClick(Sender: TObject);
    procedure btcandepClick(Sender: TObject);
    procedure btgradepClick(Sender: TObject);
    procedure btaltdepClick(Sender: TObject);
    procedure btnovdepClick(Sender: TObject);
    procedure Dpnr_depositoKeyPress(Sender: TObject; var Key: Char);
    procedure Sg_depositoClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure Bt_imp_copClick(Sender: TObject);
    procedure Prid_plano_contasButtonClick(Sender: TObject);
    procedure Prid_plano_contasKeyPress(Sender: TObject; var Key: Char);
    procedure Prid_plano_contasExit(Sender: TObject);
    procedure edValorIniExit(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure dgContasPagarDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sbAbrirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbConfPgtoClick(Sender: TObject);
    procedure sbCancPgtoClick(Sender: TObject);
    procedure dgContasPagarDblClick(Sender: TObject);
    procedure zPrId_Plano_ContasButtonClick(Sender: TObject);
    procedure zPrId_Plano_ContasExit(Sender: TObject);
    procedure PrCONTA_BOLETOExit(Sender: TObject);
    procedure PrCONTA_BOLETOButtonClick(Sender: TObject);
    procedure btBoletoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btAltTituloClick(Sender: TObject);
    procedure btGrTituloClick(Sender: TObject);
    procedure BtnEmailBoletoClick(Sender: TObject);
    procedure tab_localizarShow(Sender: TObject);
    procedure tab_resultadoShow(Sender: TObject);
    procedure tab_dadosShow(Sender: TObject);
    procedure CheckTodosClick(Sender: TObject);
    procedure ZzContaBoletoButtonClick(Sender: TObject);
    procedure ZzContaBoletoExit(Sender: TObject);
    procedure fR_RELATORIOGetValue(const VarName: string; var Value: Variant);
    procedure PrdtavenExit(Sender: TObject);
  private
    procedure redimensionar(expandir: Boolean);
    { Private declarations }
  public
    expande_grid: string;
    modo_insert, modo_insert_dep: Boolean;
    Col, Row: Integer;
    id: string;
    procedure ativa_cr1(id: string);
    // procedure ativa_deposito_cr1()
    procedure limpa_campos(prefixo: ShortString);
    procedure readonly_false(prefixo: ShortString);
    procedure readonly_true(prefixo: ShortString);
    procedure mostra_campos(prefixo: ShortString);
    { Cheque Terceiro }
    procedure MontaSg_cht_cr1;
    procedure MostraSgcht_cr1(titulo, seq: string);

    procedure Montasg_deposito;
    procedure MostraSg_deposito(titulo, seq: string);

    procedure mostra_dados_cheque_terceiros(id: string);
    // Mostra no GBdados_cheque os dados do Cheque localizado

    procedure preenche_grid;
    procedure preenche_campos;
    procedure MontaArquivoCobrancaEnvio;
  end;

var
  Fr_contas_receber: TFr_contas_receber;
  totalselecionados, total_confimar_pagto, total_cancelar_pgto,
    total_parcial_pgto, dias_baixar, dias_protesto: Integer;
  VlrTotal, VlrTotalSel: real;
  PermiteAlterar: Boolean;
  Boleto_Avalista, id_remessa, carteira_conta, uf_cliente, mensagem_padrao: string;

implementation

uses Un_localizar, UnPri, UnFun, Un_dao, Un_dados_cliente,
  Un_opc_relatorios, un_conta_atrasada, un_conta_descontada,
  un_email_envio, Un_dm, un_splash;

{$R *.dfm}

procedure TFr_contas_receber.Ed_titulo1Exit(Sender: TObject);
begin
  FMFUN.enchezero(Ed_titulo1.Text, 6);
end;

procedure TFr_contas_receber.ed_titulo2Exit(Sender: TObject);
begin
  FMFUN.enchezero(ed_titulo2.Text, 6);
end;

procedure TFr_contas_receber.EDdtainiKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;
end;

procedure TFr_contas_receber.Zzcod_empresaButtonClick(Sender: TObject);
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
  chamou_form := 'fr_cor_empresa';
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

procedure TFr_contas_receber.Zzcod_empresaExit(Sender: TObject);
begin
  if trim(Zzcod_empresa.Text) = '' then
    Lbnom_empresa1.Caption := '...';

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

procedure TFr_contas_receber.Zzcod_empresaKeyPress(Sender: TObject;
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
      chamou_form := 'fr_cor_empresa';
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

procedure TFr_contas_receber.Zzcod_fop1ButtonClick(Sender: TObject);
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
  chamou_form := 'fr_cor_fop';
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

  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_contas_receber.Zzcod_fop1Exit(Sender: TObject);
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

procedure TFr_contas_receber.Zzcod_fop1KeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  if Key = #13 then
  begin
    if (Zzcod_fop1.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Formas de Pagamento';
      chamou_pesquisa := 'fr_fop';
      chamou_form := 'fr_cor_fop';
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

      Fr_localizar.ShowModal;
      Fr_localizar.Free;

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;
    end;
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;

end;

procedure TFr_contas_receber.Zzcod_cliente1ButtonClick(Sender: TObject);
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
  chamou_form := 'fr_cor_cliente';
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

procedure TFr_contas_receber.Zzcod_cliente1Exit(Sender: TObject);
begin
  if trim(Zzcod_cliente1.Text) = '' then
    LbNom_cliente1.Caption := '...';

  if Zzcod_cliente1.Text <> '' then
  begin
    dao.Geral2
      ('select cl.nom_cliente||'' - ''||c.NOM_CIDADE||''-''||c.UF as nom_cliente from cliente cl left outer join CIDADES c on c.COD_CIDADE = cl.COD_CIDADE where cl.cod_cliente='
      + QuotedStr(Zzcod_cliente1.Text));
    if dao.q2.RecordCount > 0 then
    begin
      LbNom_cliente1.Caption := dao.q2.fieldbyname('nom_cliente').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Zzcod_cliente1.Text := '';
      Zzcod_cliente1.SetFocus;
      Exit;
    end;
  end;

end;

procedure TFr_contas_receber.Zzcod_cliente1KeyPress(Sender: TObject;
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
    if (Zzcod_cliente1.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Cliente';
      chamou_pesquisa := 'fr_cliente';
      chamou_form := 'fr_cor_cliente';
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

procedure TFr_contas_receber.redimensionar(expandir: Boolean);
var
  largura: Integer;
begin
  largura := Fr_contas_receber.Width;
  if expandir then
  begin

    Fr_contas_receber.Width := 1222;

    Fr_contas_receber.Left :=
      (Screen.DesktopWidth - Fr_contas_receber.Width) DIV 2;

  end
  else
  begin
    Fr_contas_receber.Width := 610;
    if largura <> Fr_contas_receber.Width then
      Fr_contas_receber.Left := Fr_contas_receber.Left + 200;
  end;
end;

procedure TFr_contas_receber.Prcod_empresaButtonClick(Sender: TObject);
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
  chamou_form := 'fr_cr1_empresa';
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

procedure TFr_contas_receber.Prcod_empresaExit(Sender: TObject);
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

procedure TFr_contas_receber.Prcod_empresaKeyPress(Sender: TObject;
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
    if (Prcod_empresa.Text = '') and (Btnov.Enabled = false) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Empresa';
      chamou_pesquisa := 'fr_empresa';
      chamou_form := 'fr_cr1_empresa';
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
    Prcod_empresa.SetFocus;
    Key := #0;

  end;
end;

procedure TFr_contas_receber.Prcod_fopButtonClick(Sender: TObject);
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
  chamou_form := 'fr_cr1_fop';
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

  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_contas_receber.Prcod_fopExit(Sender: TObject);
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

procedure TFr_contas_receber.Prcod_fopKeyPress(Sender: TObject; var Key: Char);
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
      chamou_form := 'fr_cr1_fop';
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

      Fr_localizar.ShowModal;
      Fr_localizar.Free;

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;
    end;
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;

end;

procedure TFr_contas_receber.PrtituloExit(Sender: TObject);
begin
  if Prtitulo.Text <> '' then
    Prtitulo.Text := FMFUN.enchezero(Prtitulo.Text, 6);

end;

procedure TFr_contas_receber.PrtituloKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;
end;

procedure TFr_contas_receber.Prcod_clienteButtonClick(Sender: TObject);
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
  chamou_form := 'fr_cr1_cliente';
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

procedure TFr_contas_receber.Prcod_clienteKeyPress(Sender: TObject;
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
    if (Prcod_cliente.Text = '') and (Btnov.Enabled = false) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Cliente';
      chamou_pesquisa := 'fr_cliente';
      chamou_form := 'fr_cr1_cliente';
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

procedure TFr_contas_receber.Prcod_clienteExit(Sender: TObject);
begin
  if trim(Prcod_cliente.Text) = '' then
    Lbnom_cliente.Caption := '...';

  if Prcod_cliente.Text <> '' then
  begin
    dao.Geral2
      ('select cl.nom_cliente||'' - ''||c.NOM_CIDADE||''-''||c.UF as nom_cliente, c.uf from cliente cl left outer join CIDADES c on c.COD_CIDADE = cl.COD_CIDADE where cl.cod_cliente='
      + QuotedStr(Prcod_cliente.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_cliente.Caption := dao.q2.fieldbyname('nom_cliente').AsString;
      uf_cliente := dao.q2.fieldbyname('uf').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_cliente.Text := '';
      uf_cliente := '';
      Prcod_cliente.SetFocus;
      Exit;
    end;
  end;

end;

procedure TFr_contas_receber.btaltClick(Sender: TObject);
begin
  if not PermiteAlterar then
  begin
    showmessage
      ('Não se pode alterar contas recebidas! Efetue o cancelamento do mesmo na Aba Resultado.');
    Exit;
  end;

  modo_insert := false;
  readonly_false('Pr');
  // habilita botões
  Prtitulo.Enabled := false;
  Prsequencia.Enabled := false;
  Prcod_cliente.Enabled := false;
  tab_localizar.TabVisible := false;
  tab_resultado.TabVisible := false;

  Btnov.Enabled := false;
  btalt.Enabled := false;
  btgra.Enabled := true;
  btcan.Enabled := true;
  btexc.Enabled := false;
  if Pcdados_cr1.ActivePage = tab_dados then
    Prdtaven.SetFocus;

end;

procedure TFr_contas_receber.btcanClick(Sender: TObject);
begin
  try
    if MessageDlg('Deseja Cancelar está Operação?', mtConfirmation,
      [mbyes, mbno], 0) = mryes then
    begin
      Btnov.Enabled := true;
      btalt.Enabled := true;
      btgra.Enabled := false;
      btcan.Enabled := false;
      btexc.Enabled := true;
      tab_localizar.TabVisible := true;
      tab_resultado.TabVisible := true;

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

procedure TFr_contas_receber.btexcClick(Sender: TObject);
begin
  if MessageDlg('Deseja Excluir o Titulo', mtConfirmation, [mbyes, mbno], 0) = mryes
  then
  begin
    if not FMFUN.LiberarProcesso then
      Exit;

    try
      if not(dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      dao.Execsql('delete from cr1 where id =' + QuotedStr(Prid.Text));
      dao.cn.Commit;
      dao.msg('Titulo Excluido com Sucesso!');
    except
      dao.cn.rollback;
    end;
    btokClick(Self);
  end;

end;

procedure TFr_contas_receber.btgraClick(Sender: TObject);
var
  descricao: string;
begin
{  if Prid_plano_contas.Text = '' then
  begin
    dao.msg('O campo Plano de Contas deve ser preenchido!');
    Prid_plano_contas.SetFocus;
    Exit;
  end;}
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
  if Prcod_cliente.Text = '' then
  begin
    dao.msg('O campo Fornecedor deve ser preenchido!');
    Prcod_cliente.SetFocus;
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

  Btnov.Enabled := true;
  btalt.Enabled := true;
  btgra.Enabled := false;
  btcan.Enabled := false;
  btexc.Enabled := true;

  Screen.Cursor := crSQLWait;
  try
    if not(dao.cn.InTransaction) then
      dao.cn.StartTransaction;

    if (Prvalor_recebido.Value > 0) and (mmContasPagarDESCONTADA.AsString <> '1')
    then
    begin
      descricao := 'RECEBIMENTO CONTA: CLIENTE: ' + Lbnom_cliente.Caption +
        ' TÍTULO Nº: ' + Prtitulo.Text + ';';
      Application.CreateForm(Tfrm_conta_descontada, frm_conta_descontada);

      SetLength(frm_conta_descontada.Listas_Contas, 1);
      frm_conta_descontada.Listas_Contas[0] := mmContasPagarID.Value;

      frm_conta_descontada.pagar := false;
      frm_conta_descontada.Total := Prvalor_recebido.Value;
      frm_conta_descontada.historico := descricao;
      // frm_conta_descontada.eddtMov.Date := Prdtaven.Date;
      frm_conta_descontada.ShowModal;
    end;

    if modo_insert then
    begin

      id := dao.insert('Pr', 'cr1', 'id', Fr_contas_receber, 'gen_cr1');

      Prid.Text := id;
      ativa_cr1(id);
      preenche_campos;
      Btnov.SetFocus;
    end
    else
      dao.update('cr1', 'id', Prid.Text, 'Pr', Fr_contas_receber);

    dao.cn.Commit;
  except
    dao.cn.rollback;
  end;

  Screen.Cursor := crDefault;
  tab_localizar.TabVisible := true;
  tab_resultado.TabVisible := true;

  if not((EDdtaini.Date = round(now) - 180) and
    (Eddtafin.Date = round(now) + 180)) then
    btokClick(Self);
  Pccor.ActivePage := tab_dados;
  readonly_true('Pr');
end;

procedure TFr_contas_receber.BtnovClick(Sender: TObject);
begin
  modo_insert := true;
  readonly_false('Pr');
  Prtitulo.Enabled := true;
  Prsequencia.Enabled := true;
  Prcod_cliente.Enabled := true;

  Prtitulo.SetFocus;
  // habilita botões
  Btnov.Enabled := false;
  btalt.Enabled := false;
  btgra.Enabled := true;
  btcan.Enabled := true;
  btexc.Enabled := false;
  btBoleto.Enabled := false;
  tab_localizar.TabVisible := false;
  tab_resultado.TabVisible := false;
  limpa_campos('Pr');
  Prsequencia.Text := '1';
  PermiteAlterar := True;
end;

procedure TFr_contas_receber.readonly_false(prefixo: ShortString);
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
        TMaskEdit(Components[i]).ReadOnly := false;
    end;
  end;
end;

procedure TFr_contas_receber.readonly_true(prefixo: ShortString);
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
        tscheckbox(Components[i]).Enabled := false
      else if Components[i] is TsComboEdit then
        TsComboEdit(Components[i]).ReadOnly := true
      else if Components[i] is TsDateEdit then
        TsDateEdit(Components[i]).ReadOnly := true
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(Components[i]).ReadOnly := true
      else if Components[i] is TMaskEdit then
        TMaskEdit(Components[i]).ReadOnly := true;
    end;
  end;
end;

procedure TFr_contas_receber.limpa_campos(prefixo: ShortString);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).Clear
      else if Components[i] is TsMemo then
        TsMemo(Components[i]).Clear
      else if Components[i] is TsComboEdit then
        TsComboEdit(Components[i]).Clear
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(Components[i]).Clear
      else if Components[i] is TsDateEdit then
        TsDateEdit(Components[i]).Clear;
    end;
  end;
  if prefixo = 'Pr' then
  begin
    Lbnom_cliente.Caption := '...';
    Lbnom_fop.Caption := '...';
  end
  else
  begin
    lbconta.Caption := '...';
  end;

end;

procedure TFr_contas_receber.ativa_cr1(id: string);
begin
  with Q_cr1 do
  begin
    close;
    sql.Clear;
    sql.Add('select a.ID, a.COD_CLIENTE, a.NR_DOCUMENTO, a.TITULO, a.SEQUENCIA, '
      + 'a.COD_EMPRESA, a.DTAVEN, a.VALOR, a.COD_FOP, a.HISTORICO1, a.DTAREC, a.VALOR_RECEBIDO, '
      + 'a.SALDO, a.DIAS_ATRASO, a.VLR_CORRIGIDO, a.DESCONTO, a.NR_CUPOM, a.CONFERIDO, '
      + 'a.ID_REPRESENTANTE, a.VLR_COMISSAO, a.ID_PLANO_CONTAS, a.SINCRONIZAR_PALM, a.EXTRATO, '
      + 'a.VALOR_CORRIGIDO, a.BOLETO_REMESSA_ORDEM, a.BOLETO_RETORNO_CODIGO, a.CONTA_BOLETO, '
      + 'a.INSTRUCAO_BOLETO, a.BOLETO_RETORNO_DESCRICAO, c.nom_cliente, fp.nom_fop, ep.nom_empresa '
      + 'from cr1 a ' + 'left join cliente c on c.cod_cliente=a.cod_cliente ' +
      'left join fop fp on fp.cod_fop=a.cod_fop ' +
      'left join empresa ep on ep.cod_empresa = a.cod_empresa ' +
      'where a.id = ' + QuotedStr(id));
    open;
  end;

end;

procedure TFr_contas_receber.mostra_campos(prefixo: ShortString);
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
        TsEdit(FindComponent(campo)).Text := Q_cr1.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TsMemo then
      begin
        campo := TsMemo(Components[i]).Name;
        campo1 := copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
        TsMemo(FindComponent(campo)).Text := Q_cr1.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TsComboEdit then
      begin
        campo := TsComboEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        TsComboEdit(FindComponent(campo)).Text :=
          Q_cr1.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TsCurrencyEdit then
      begin
        campo := TsCurrencyEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        TsCurrencyEdit(FindComponent(campo)).Value :=
          Q_cr1.fieldbyname(campo1).AsFloat;
      end
      else if Components[i] is TComboBox then
      begin
        campo := TComboBox(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);

        TComboBox(FindComponent(campo)).ItemIndex := Q_cr1.fieldbyname(campo1)
          .AsInteger;
      end
      else if Components[i] is tscheckbox then
      begin
        campo := tscheckbox(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        if Q_cr1.fieldbyname(campo1).AsString = 'S' then
          tscheckbox(FindComponent(campo)).Checked := true
        else
          tscheckbox(FindComponent(campo)).Checked := false;
      end
      else if Components[i] is TsDateEdit then
      begin
        campo := TsDateEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);

        TsDateEdit(FindComponent(campo)).Date := Q_cr1.fieldbyname(campo1)
          .AsDateTime;
      end;
    end;

  end; // end do for

  Prcod_clienteExit(Self);
  Prid_plano_contasExit(Self);
  Prcod_fopExit(Self);
  PrCONTA_BOLETOExit(Self);

  Screen.Cursor := crDefault;

  if not Q_cr1.fieldbyname('DTAREC').IsNull then
    PermiteAlterar := false
  else
    PermiteAlterar := true;

  if not Q_cr1.fieldbyname('BOLETO_REMESSA_ORDEM').IsNull then
    btAltTitulo.Visible := true
  else
  begin
    btAltTitulo.Visible := false;
    btGrTitulo.Visible := false;
  end;
end;

procedure TFr_contas_receber.SpeedButton1Click(Sender: TObject);
begin
  if Prcod_cliente.Text <> '' then
  begin
    Application.CreateForm(TFr_dados_cliente, Fr_dados_cliente);
    Fr_dados_cliente.Busca_dados_cliente(Prcod_cliente.Text);
    // Fr_dados_cliente(Prcod_cliente.Text);
    Fr_dados_cliente.ShowModal;

  end
  else
  begin
    dao.msg('Um Titulo com Fornecedor deve ser Selecionado!');
    Exit;
  end;

end;

procedure TFr_contas_receber.BitBtn2Click(Sender: TObject);
begin
  close
end;

procedure TFr_contas_receber.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if btgra.Enabled = true then
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

procedure TFr_contas_receber.btokClick(Sender: TObject);
var
  cmd, ordem: string;
begin
  try
    Screen.Cursor := crSQLWait;
    cmd := '';
    cmd := 'select distinct a.ID, a.COD_CLIENTE, a.NR_DOCUMENTO, a.TITULO, ' +
      '  a.SEQUENCIA, a.COD_EMPRESA, a.DTAVEN, a.VALOR, a.COD_FOP, ' +
      '  a.HISTORICO1, a.DTAREC, a.VALOR_RECEBIDO, a.SALDO, a.DIAS_ATRASO, ' +
      '  a.VLR_CORRIGIDO, a.DESCONTO, a.NR_CUPOM, a.CONFERIDO, a.ID_REPRESENTANTE, cc.mensagem_padrao, '
      + '  a.VLR_COMISSAO, a.ID_PLANO_CONTAS, a.SINCRONIZAR_PALM, a.EXTRATO, a.DESCONTADA, '
      + '  a.VALOR_CORRIGIDO, a.BOLETO_REMESSA_ORDEM, a.BOLETO_RETORNO_CODIGO, a.CONTA_BOLETO, '
      + '  a.BOLETO_RETORNO_DESCRICAO, c.nom_cliente, e.nom_empresa, fp.nom_fop, v1.tot_liquido, '
      + '  TRIM(PC1.NR_CONTA)||''-''||PC1.DESCRICAO DESCRICAO1, ' +
      '  TRIM(PC2.NR_CONTA)||''-''||PC2.DESCRICAO DESCRICAO2, ' +
      '  TRIM(PC3.NR_CONTA)||''-''||PC3.DESCRICAO DESCRICAO3, ' +
      '  TRIM(PC4.NR_CONTA)||''-''||PC4.DESCRICAO DESCRICAO4, ' +
      '  cc.id||''-''||cc.NOM_CONTA||''-''||cc.NR_AGENCIA||''-''||cc.NR_CONTA as conta '
      + 'from cr1 a ' + 'left join CONTA_CORRENTE cc on cc.id = a.CONTA_BOLETO '
      + 'left join cliente c on c.cod_cliente = a.cod_cliente ' +
      'left join fop fp on fp.cod_fop = a.cod_fop ' +
      'left join empresa e on e.cod_empresa = a.cod_empresa ' +
      'left join vendas1 v1 on v1.numdoc=a.nr_documento ' +
      'left join plano_contas pc4 on pc4.id = a.id_plano_contas ' +
      'left JOIN PLANO_CONTAS PC3 ON (PC3.ID = PC4.ID_PAI) ' +
      'left JOIN PLANO_CONTAS PC2 ON (PC2.ID = PC3.ID_PAI) ' +
      'left JOIN PLANO_CONTAS PC1 ON (PC1.ID = PC2.ID_PAI) ' + 'where  1 = 1 ';
    if (EDdtaini.Date > 0) and (Eddtafin.Date > 0) then
    begin
      if Rb_filtro_vencimento.Checked then
        cmd := cmd + ' and dtaven between ' +
          QuotedStr(FormatDateTime('dd.mm.yyyy', EDdtaini.Date)) + ' and ' +
          QuotedStr(FormatDateTime('dd.mm.yyyy', Eddtafin.Date))
      else
        cmd := cmd + ' and dtarec between ' +
          QuotedStr(FormatDateTime('dd.mm.yyyy', EDdtaini.Date)) + ' and ' +
          QuotedStr(FormatDateTime('dd.mm.yyyy', Eddtafin.Date));
    end;

    if ZzContaBoleto.Text <> '' then
      cmd := cmd + ' and coalesce(a.CONTA_BOLETO, v1.CONTA_BOLETO) = ' +
        QuotedStr(ZzContaBoleto.Text);

    if Zzcod_empresa.Text <> '' then
      cmd := cmd + ' and a.cod_empresa = ' + QuotedStr(Zzcod_empresa.Text);

    if Zzcod_cliente1.Text <> '' then
      cmd := cmd + ' and a.cod_cliente = ' + QuotedStr(Zzcod_cliente1.Text);

    if zPrId_Plano_Contas.Text <> '' then
      cmd := cmd + ' and a.id_plano_contas = ' +
        QuotedStr(zPrId_Plano_Contas.Text);

    if Zzcod_fop1.Text <> '' then
      cmd := cmd + ' and a.cod_fop = ' + QuotedStr(Zzcod_fop1.Text);

    if (Ed_titulo1.Text <> '') and (ed_titulo2.Text = '') then
      cmd := cmd + ' and a.titulo like ''%' + trim(Ed_titulo1.Text) + '%''';

    if (Ed_titulo1.Text <> '') and (ed_titulo2.Text <> '') then
      cmd := cmd + ' and a.titulo between ' +
        QuotedStr(FMFUN.enchezero(Ed_titulo1.Text, 6)) + ' and ' +
        QuotedStr(FMFUN.enchezero(ed_titulo2.Text, 6));

    if (edValorIni.Value > 0) and (edValorFim.Value > 0) then
      cmd := cmd + ' and a.valor between ' +
        StringReplace(formatfloat('0.00', edValorIni.Value), ',', '.',
        [rfReplaceAll]) + ' and ' + StringReplace
        (formatfloat('0.00', edValorFim.Value), ',', '.', [rfReplaceAll]);

    if ED_NF.Text <> '' then
      cmd := cmd + ' and v1.NFE = ' + QuotedStr(ED_NF.Text);

    if ed_pedido.Text <> '' then
      cmd := cmd + ' and a.NR_DOCUMENTO = ' + QuotedStr(ed_pedido.Text);

    if trim(edHistorico.Text) <> '' then
      cmd := cmd + ' and UPPER(a.HISTORICO1) like ''%' +
        edHistorico.Text + '%''';

    if Rb_efetivados.Checked then
      cmd := cmd + ' and a.dtarec is not null '
    else if Rb_nao_efetivados.Checked then
      cmd := cmd + ' and a.dtarec is null '
    else if rbParciais.Checked then
      cmd := cmd + ' and a.vlr_corrigido > a.valor_recebido '
    else if rbVencidos.Checked then
      cmd := cmd + ' and a.dtarec is null and dtaven < current_timestamp '
    else if rbProtestados.Checked then
      cmd := cmd + ' and a.protesto = ''S'' ';

    ordem := ' order by ';
    if zz_ord_titulo.Checked then
      ordem := ordem + ' a.titulo ';

    if zz_ord_vencimento.Checked then
      ordem := ordem + ' a.dtaven ';

    if zz_ord_pagamento.Checked then
      ordem := ordem + ' a.dtarec ';

    if zz_ord_Cliente.Checked then
      ordem := ordem + ' c.nom_cliente ';

    if zz_ord_valor.Checked then
      ordem := ordem + ' a.valor ';

    fm_splash.pgArquivos.Visible := false;
    fm_splash.lbArquivos.Visible := false;

    fm_splash.lbStatus.Caption := 'Consultando...';
    fm_splash.ggProgress.Visible := false;
    fm_splash.Show;

    with Q_resultado do
    begin
      close;
      sql.Clear;
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
    Pccor.ActivePage := tab_resultado;
    dao.grava_log(Q_resultado.sql.Text, cod_usuario);
  except
    on e: Exception do
    begin
      Screen.Cursor := crDefault;

      dao.msg('Houve um Erro na Busca das Informações!' + #13 +
        'Abaixo segue o Erro Detalhado:' + #13 + e.Message);
    end;
  end;

end;

procedure TFr_contas_receber.preenche_grid;
var
  i: Integer;
begin
  mmContasPagar.DisableControls;

  mmContasPagar.close;
  mmContasPagar.EmptyTable;
  mmContasPagar.open;
  VlrTotal := 0;
  while not(Q_resultado.Eof) do
  begin
    mmContasPagar.Append;
    mmContasPagarID.AsString := Q_resultado.fieldbyname('id').AsString;
    mmContasPagarNR_DOCUMENTO.AsString :=
      Q_resultado.fieldbyname('NR_DOCUMENTO').AsString;
    mmContasPagarTITULO.AsString := Q_resultado.fieldbyname('titulo').AsString;
    mmContasPagarSEQUENCIA.AsString := Q_resultado.fieldbyname
      ('sequencia').AsString;
    mmContasPagarRAZAO_SOCIAL.AsString :=
      Q_resultado.fieldbyname('nom_cliente').AsString;
    mmContasPagarHISTORICO.AsString := Q_resultado.fieldbyname
      ('historico1').AsString;
    mmContasPagarDTAVEN.AsString := Q_resultado.fieldbyname('dtaven').AsString;
    mmContasPagarTOTAL_PEDIDO.AsString :=
      Q_resultado.fieldbyname('tot_liquido').AsString;
    mmContasPagarVALOR.AsString := Q_resultado.fieldbyname('valor').AsString;
    mmContasPagarDTAPAG.AsString := Q_resultado.fieldbyname('dtarec').AsString;
    mmContasPagarVALOR_PAGO.AsString := Q_resultado.fieldbyname
      ('valor_recebido').AsString;
    mmContasPagarVALOR_CORRIGIDO.AsString :=
      Q_resultado.fieldbyname('vlr_corrigido').AsString;

    mmContasPagarNOM_FOP.AsString := Q_resultado.fieldbyname('nom_fop')
      .AsString;
    mmContasPagarEXTRATO.AsString := Q_resultado.fieldbyname('EXTRATO')
      .AsString;
    VlrTotal := VlrTotal + mmContasPagarVALOR.Value;
    mmContasPagarDESCONTADA.AsString := Q_resultado.fieldbyname
      ('DESCONTADA').AsString;
    mmContasPagarCONTA.AsString := Q_resultado.fieldbyname('conta').AsString;
    mmContasPagar.Post;

    fm_splash.ggProgress.AddProgress(1);
    fm_splash.Update;

    Q_resultado.Next;
  end;
  mmContasPagar.First;
  mmContasPagar.EnableControls;

  stTotal.Caption := formatfloat('R$ #,###,##0.00', VlrTotal);
  stTotalSel.Caption := formatfloat('R$ #,###,##0.00', 0);
  totalselecionados := 0;
  total_confimar_pagto := 0;
  total_cancelar_pgto := 0;
  total_parcial_pgto := 0;
  VlrTotalSel := 0;

  fm_splash.hide;
end;

procedure TFr_contas_receber.FormShow(Sender: TObject);
begin
  { Sg_cor.ColWidths[0] := 0;
    Sg_cor.Cells[1, 0] := 'Titulo';
    Sg_cor.Cells[2, 0] := 'Seq';
    Sg_cor.Cells[3, 0] := 'Cliente';
    Sg_cor.Cells[4, 0] := 'Descrição';
    Sg_cor.Cells[5, 0] := 'Dta.Vencimento';
    Sg_cor.Cells[6, 0] := 'Valor';
    Sg_cor.Cells[7, 0] := 'Dta.Pagamento';
    Sg_cor.Cells[8, 0] := 'Vlr.Pagamento';
    Sg_cor.Cells[9, 0] := 'Forma Pgto';
    Pccor.ActivePage := tab_localizar;
    Bt_imp_cop.Caption := 'Relatorio' + #13 + 'Contas a Receber';
    expande_grid := 'false';
    // EDdtaini.date := now - 30;
    // Eddtafin.date := now;
    readonly_true('Pr');
    MontaSg_cht_cr1; }
  EDdtaini.Date := round(now) - 180;
  Eddtafin.Date := round(now) + 180;
  totalselecionados := 0;
  total_confimar_pagto := 0;
  total_cancelar_pgto := 0;
end;

procedure TFr_contas_receber.bt_loc_chequeClick(Sender: TObject);
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
  chamou_pesquisa := 'fr_cheque_terceiros';
  chamou_form := 'fr_cr1_cheque_terceiros';
  chamou_cadastro := 'Fr_cheque_terceiros';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cheque Terceiros';
  Fr_localizar.BT_cadastro.Visible := true;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 6);
  Campos_combo[0] := 'Nº Cheque';
  Campos_combo[1] := 'Nº Agência';
  Campos_combo[2] := 'Nº Conta Corrente';
  Campos_combo[3] := 'Titular';
  Campos_combo[4] := 'Data Vencimento';
  Campos_combo[5] := 'Valor';

  for i := 0 to 5 do
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

procedure TFr_contas_receber.mostra_dados_cheque_terceiros(id: string);
begin
  dao.Geral1('select * from cheque_terceiros where id=' + QuotedStr(id));

  Lbnr_cheque.Caption := dao.Q1.fieldbyname('nr_cheque').AsString;
  LbNr_banco.Caption := dao.Q1.fieldbyname('nr_banco').AsString;
  Lbnr_agencia.Caption := dao.Q1.fieldbyname('nr_agencia').AsString;
  Lbnr_cc.Caption := dao.Q1.fieldbyname('nr_conta_corrente').AsString;
  Lbnom_titular.Caption := dao.Q1.fieldbyname('nom_titular').AsString;
  LbData_vencimento.Caption := FormatDateTime('dd/mm/yyyy',
    dao.Q1.fieldbyname('dta_vencimento').AsDateTime);
  LbData_emissao.Caption := FormatDateTime('dd/mm/yyyy',
    dao.Q1.fieldbyname('dta_emissao').AsDateTime);
  lbvalor_cheque.Caption := formatfloat('###,##0.00',
    dao.Q1.fieldbyname('valor').AsFloat);
  lbid.Caption := dao.Q1.fieldbyname('id').AsString;

end;

procedure TFr_contas_receber.Sg_corDblClickCell(Sender: TObject;
  ARow, ACol: Integer);
begin
  { if Q_resultado.RecordCount > 0 then
    begin
    Q_resultado.Locate('id', Sg_cor.Cells[0, ARow], []);
    preenche_campos;
    ativa_cr1(Sg_cor.Cells[0, ARow]);
    Pccor.ActivePage := tab_dados;
    MostraSgcht_cr1(Prtitulo.Text, Prsequencia.Text);
    MostraSg_deposito(Prtitulo.Text, Prsequencia.Text);

    end;
  }
end;

procedure TFr_contas_receber.preenche_campos;
begin
  Prid.Text := Q_cr1.fieldbyname('id').AsString;
  Prtitulo.Text := Q_cr1.fieldbyname('titulo').AsString;
  Prsequencia.Text := Q_cr1.fieldbyname('sequencia').AsString;
  Prcod_cliente.Text := Q_cr1.fieldbyname('cod_cliente').AsString;
  Prcod_clienteExit(Self);
  Prdtaven.Date := Q_cr1.fieldbyname('dtaven').AsDateTime;
  Prvalor.Value := Q_cr1.fieldbyname('valor').AsFloat;
  Prcod_fop.Text := Q_cr1.fieldbyname('cod_fop').AsString;
  Lbnom_fop.Caption := Q_cr1.fieldbyname('nom_fop').AsString;
  Prhistorico1.Text := Q_cr1.fieldbyname('historico1').AsString;
  Prdtarec.Date := Q_cr1.fieldbyname('dtarec').AsDateTime;
  Prvalor_recebido.Value := Q_cr1.fieldbyname('valor_recebido').AsFloat;
  Prcod_empresa.Text := Q_cr1.fieldbyname('cod_empresa').AsString;
  Lbnom_empresa.Caption := Q_cr1.fieldbyname('nom_empresa').AsString;
  Prid_plano_contas.Text := Q_cr1.fieldbyname('id_plano_contas').AsString;
  PrCONTA_BOLETO.Text := Q_cr1.fieldbyname('CONTA_BOLETO').AsString;
  Prid_plano_contasExit(Self);

  if Q_cr1.fieldbyname('conferido').AsString = 'S' then
    Prconferido.Checked := true
  else
    Prconferido.Checked := false;

  if not Q_cr1.fieldbyname('DTAREC').IsNull then
    PermiteAlterar := false
  else
    PermiteAlterar := true;
  PrCONTA_BOLETOExit(Self);

  if not Q_cr1.fieldbyname('BOLETO_REMESSA_ORDEM').IsNull then
    btAltTitulo.Visible := true
  else
  begin
    btAltTitulo.Visible := false;
    btGrTitulo.Visible := false;
  end;
end;

procedure TFr_contas_receber.MontaSg_cht_cr1;
begin
  Sgcht_cr1.Cells[0, 0] := 'id';
  Sgcht_cr1.Cells[1, 0] := 'Nr. Cheque';
  Sgcht_cr1.Cells[2, 0] := 'Dta. Emissão.';
  Sgcht_cr1.Cells[3, 0] := 'Dta. Vencim.';
  Sgcht_cr1.Cells[4, 0] := 'Titular';
  Sgcht_cr1.Cells[5, 0] := 'Valor';

end;

procedure TFr_contas_receber.MostraSgcht_cr1(titulo, seq: string);
var
  linmax: Integer;
begin
  dao.Geral1('select * from cheque_terceiros where titulo_cr1= ' +
    QuotedStr(titulo) + ' and seq_CR1=' + QuotedStr(seq));
  Sgcht_cr1.Clear;
  Sgcht_cr1.RowCount := 2;
  MontaSg_cht_cr1;
  linmax := 1;
  dao.Q1.RecordCount;
  while not(dao.Q1.Eof) do
  begin
    Sgcht_cr1.EditorMode := true;
    if linmax > 1 then
    begin
      Sgcht_cr1.AddRow;
    end;
    Sgcht_cr1.Cells[0, linmax] := dao.Q1.fieldbyname('id').AsString;
    Sgcht_cr1.Cells[1, linmax] := dao.Q1.fieldbyname('nr_cheque').AsString;
    Sgcht_cr1.Cells[2, linmax] := FormatDateTime('dd/mm/yyyy',
      dao.Q1.fieldbyname('dta_emissao').AsDateTime);
    Sgcht_cr1.Cells[3, linmax] := FormatDateTime('dd/mm/yyyy',
      dao.Q1.fieldbyname('dta_vencimento').AsDateTime);
    Sgcht_cr1.Cells[4, linmax] := dao.Q1.fieldbyname('nom_titular').AsString;
    Sgcht_cr1.Cells[5, linmax] := formatfloat('###,##0.00',
      dao.Q1.fieldbyname('valor').AsFloat);
    dao.Q1.Next;

    if not(dao.Q1.Eof) then
      linmax := linmax + 1;

  end;
  Sgcht_cr1.EditorMode := false;
  Sgcht_cr1.Row := linmax;
  Sgcht_cr1.RowSelect[linmax];

end;

procedure TFr_contas_receber.BitBtn3Click(Sender: TObject);
begin
  if Prid.Text = '' then
  begin
    dao.msg('Este Cheque foi dado Entrada Atraves de Outro Titulo');
    Exit;
  end;
  dao.Geral2('select id, titulo_cr1, seq_cr1 from cheque_terceiros where id=' +
    QuotedStr(Prid.Text));
  if dao.q2.fieldbyname('titulo_cr1').AsString <> '' then
  begin
    dao.msg('Este Cheque já fo dado entrada por meio de outro Titulo');
    Exit;
  end;

  try
    if not(dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    dao.Execsql('update cheque_terceiros set titulo_cr1=' +
      QuotedStr(Prtitulo.Text) + ' , seq_cr1=' + QuotedStr(Prsequencia.Text) +
      ' where id=' + QuotedStr(lbid.Caption));
    MostraSgcht_cr1(Prtitulo.Text, Prsequencia.Text);
    dao.cn.Commit;
  except
    dao.cn.rollback;
  end;

end;

procedure TFr_contas_receber.Dpcod_contaButtonClick(Sender: TObject);
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
  chamou_pesquisa := 'fr_conta_corrente';
  chamou_form := 'fr_cr1_cc';
  chamou_cadastro := 'Fr_conta_corrente';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Conta Corrente';
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

procedure TFr_contas_receber.Dpcod_contaExit(Sender: TObject);
begin
  if Dpcod_conta.Text <> '' then
  begin
    dao.Geral2('select nom_conta from conta_corrente where id=' +
      QuotedStr(Dpcod_conta.Text));
    if dao.q2.RecordCount > 0 then
    begin
      lbconta.Caption := dao.q2.fieldbyname('nom_conta').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Dpcod_conta.Text := '';
      Dpcod_conta.SetFocus;
      Exit;
    end;

  end;

end;

procedure TFr_contas_receber.Dpcod_contaKeyPress(Sender: TObject;
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
    if (Dpcod_conta.Text = '') and (btnovdep.Enabled = false) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Conta Corrente';
      chamou_pesquisa := 'fr_conta_corrente';
      chamou_form := 'fr_cr1_cc';
      chamou_cadastro := 'Fr_conta_corrente';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 +
        'Conta Corrente';
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

procedure TFr_contas_receber.btexcdepClick(Sender: TObject);
begin
  if MessageDlg('Deseja Excluir o Titulo', mtConfirmation, [mbyes, mbno], 0) = mryes  then
  begin
    if not FMFUN.LiberarProcesso then
      Exit;

    try
      if not(dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      dao.Execsql('delete from deposito_cr1 where id=' + QuotedStr(Dpid.Text));
      dao.cn.Commit;
      dao.msg('Deposito Excluido com Sucesso!');
      MostraSg_deposito(Prtitulo.Text, Prsequencia.Text);
    except
      dao.cn.rollback;
    end;
  end;
end;

procedure TFr_contas_receber.btcandepClick(Sender: TObject);
begin
  try
    if MessageDlg('Deseja Cancelar está Operação?', mtConfirmation,
      [mbyes, mbno], 0) = mryes then
    begin
      btnovdep.Enabled := true;
      btaltdep.Enabled := true;
      btgradep.Enabled := false;
      btcandep.Enabled := false;
      btexcdep.Enabled := true;

      if modo_insert_dep then
      begin
        limpa_campos('Dp');
        readonly_true('Dp');
      end
      else if modo_insert_dep = false then
      begin
        mostra_campos('Dp');
        readonly_true('Dp');
      end;
    end
    else
      Exit;
  except
  end;

end;

procedure TFr_contas_receber.btgradepClick(Sender: TObject);
begin
  if Dpcod_conta.Text = '' then
  begin
    dao.msg('O campo Conta Corrente deve ser preenchido!');
    Dpcod_conta.SetFocus;
  end;

  // habilita botões
  btnovdep.Enabled := true;
  btaltdep.Enabled := true;
  btgradep.Enabled := false;
  btcandep.Enabled := false;
  btexcdep.Enabled := true;
  Screen.Cursor := crSQLWait;
  try
    if not(dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    if modo_insert_dep then
    begin

      id := dao.insert('Dp', 'deposito_cr1', 'id', Fr_contas_receber,
        'gen_deposito_cr1');
      Dpid.Text := id;
      ativa_cr1(id);
      btnovdep.SetFocus;
    end
    else
      dao.update('cp1', 'id', Dpid.Text, 'Pr', Fr_contas_receber);

    dao.cn.Commit;

    Screen.Cursor := crDefault;

    readonly_true('Dp');
    MostraSg_deposito(Prtitulo.Text, Prsequencia.Text);
  except
    dao.cn.rollback;
  end;

end;

procedure TFr_contas_receber.btaltdepClick(Sender: TObject);
begin
  if Prtitulo.Text = '' then
  begin
    dao.msg('Localize um Titulo para Alterar um Deposito');
    Exit;
  end;

  modo_insert_dep := false;
  readonly_false('Dp');
  // habilita botões

  // habilita botões
  btnovdep.Enabled := false;
  btaltdep.Enabled := false;
  btgradep.Enabled := true;
  btcandep.Enabled := true;
  btexcdep.Enabled := false;
  if Pcdados_cr1.ActivePage = tab_deposito then
    Dpcod_conta.SetFocus;

end;

procedure TFr_contas_receber.btnovdepClick(Sender: TObject);
begin
  if Prtitulo.Text = '' then
  begin
    dao.msg('Localize um Titulo para Adicionar um Deposito');
    Exit;
  end;

  modo_insert_dep := true;
  readonly_false('Dp');

  // habilita botões
  btnovdep.Enabled := false;
  btaltdep.Enabled := false;
  btgradep.Enabled := true;
  btcandep.Enabled := true;
  btexcdep.Enabled := false;
  limpa_campos('Dp');
  Dpnr_documento.Text := Prtitulo.Text;
  Dpseq.Text := Prsequencia.Text;
  Dpcod_conta.SetFocus;
end;

procedure TFr_contas_receber.Montasg_deposito;
begin
  Sg_deposito.Cells[0, 0] := 'id';
  Sg_deposito.Cells[1, 0] := 'Conta Corrente';
  Sg_deposito.Cells[2, 0] := 'Dta. Deposito';
  Sg_deposito.Cells[3, 0] := 'Valor';
  Sg_deposito.ColWidths[0] := 0;
end;

procedure TFr_contas_receber.MostraSg_deposito(titulo, seq: string);
var
  linmax: Integer;
begin
  dao.Geral1
    ('select a.ID, a.NR_DOCUMENTO, a.SEQ, a.NR_DEPOSITO, a.COD_CONTA, a.DTA_DEPOSITO, a.JUSTIFICATIVA, a.VLR_DEPOSITO, cc.nom_conta from deposito_cr1 a '
    + 'left join conta_corrente cc on cc.id=a.cod_conta ' +
    ' where a.nr_documento= ' + QuotedStr(titulo) + ' and a.seq=' +
    QuotedStr(seq));
  Sg_deposito.Clear;
  Sg_deposito.RowCount := 2;
  Montasg_deposito;
  linmax := 1;
  dao.Q1.RecordCount;
  while not(dao.Q1.Eof) do
  begin
    Sg_deposito.EditorMode := true;
    if linmax > 1 then
    begin
      Sg_deposito.AddRow;
    end;
    Sg_deposito.Cells[0, linmax] := dao.Q1.fieldbyname('id').AsString;
    Sg_deposito.Cells[1, linmax] := dao.Q1.fieldbyname('nom_conta').AsString;
    Sg_deposito.Cells[2, linmax] := FormatDateTime('dd/mm/yyyy',
      dao.Q1.fieldbyname('dta_deposito').AsDateTime);
    Sg_deposito.Cells[3, linmax] := formatfloat('###,##0.00',
      dao.Q1.fieldbyname('vlr_deposito').AsFloat);
    dao.Q1.Next;

    if not(dao.Q1.Eof) then
      linmax := linmax + 1;

  end;
  Sg_deposito.EditorMode := false;
  Sg_deposito.Row := linmax;
  Sg_deposito.RowSelect[linmax];

end;

procedure TFr_contas_receber.Dpnr_depositoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;
end;

procedure TFr_contas_receber.Sg_depositoClickCell(Sender: TObject;
  ARow, ACol: Integer);
begin
  if btnovdep.Enabled = true then
  begin
    dao.Geral2
      ('select a.ID, a.NR_DOCUMENTO, a.SEQ, a.NR_DEPOSITO, a.COD_CONTA, a.DTA_DEPOSITO, a.JUSTIFICATIVA, a.VLR_DEPOSITO, cc.nom_conta from deposito_cr1 a '
      + 'left join conta_corrente cc on cc.id=a.cod_conta ' + ' where a.id=' +
      QuotedStr(Sg_deposito.Cells[0, ARow]));

    if dao.q2.RecordCount > 0 then
    begin
      Dpid.Text := dao.q2.fieldbyname('id').AsString;
      Dpcod_conta.Text := dao.q2.fieldbyname('cod_conta').AsString;
      lbconta.Caption := dao.q2.fieldbyname('nom_conta').AsString;
      Dpnr_deposito.Text := dao.q2.fieldbyname('nr_deposito').AsString;
      Dpdta_deposito.Text := dao.q2.fieldbyname('dta_deposito').AsString;
      Dpjustificativa.Text := dao.q2.fieldbyname('justificativa').AsString;
      Dpvlr_deposito.Text := dao.q2.fieldbyname('vlr_deposito').AsString;
    end;
  end;
end;

procedure TFr_contas_receber.Bt_imp_copClick(Sender: TObject);
var
  cmd, ordem, path: string;
begin
  path := ExtractFilePath(Application.ExeName);
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

  if (EDdtaini.Date > 0) and (Eddtafin.Date > 0) then
  begin
    if Rb_filtro_vencimento.Checked then
      cmd := cmd + ' and cr1.dtaven between ' +
        QuotedStr(FormatDateTime('dd.mm.yyyy', EDdtaini.Date)) + ' and ' +
        QuotedStr(FormatDateTime('dd.mm.yyyy', Eddtafin.Date))
    else
      cmd := cmd + ' and cr1.dtarec between ' +
        QuotedStr(FormatDateTime('dd.mm.yyyy', EDdtaini.Date)) + ' and ' +
        QuotedStr(FormatDateTime('dd.mm.yyyy', Eddtafin.Date));
  end;

  if ZzContaBoleto.Text <> '' then
    cmd := cmd + ' and coalesce(cr1.CONTA_BOLETO, v.CONTA_BOLETO) = ' +
      QuotedStr(ZzContaBoleto.Text);

  if Zzcod_empresa.Text <> '' then
    cmd := cmd + ' and cr1.cod_empresa = ' + QuotedStr(Zzcod_empresa.Text);

  if Zzcod_cliente1.Text <> '' then
    cmd := cmd + ' and cr1.cod_cliente = ' + QuotedStr(Zzcod_cliente1.Text);

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

  if ED_NF.Text <> '' then
    cmd := cmd + ' and v.NFE = ' + QuotedStr(ED_NF.Text);

  if ed_pedido.Text <> '' then
    cmd := cmd + ' and cr1.NR_DOCUMENTO = ' + QuotedStr(ed_pedido.Text);

  if trim(edHistorico.Text) <> '' then
    cmd := cmd + ' and UPPER(cr1.HISTORICO1) like ''%' +
      edHistorico.Text + '%''';

  if Rb_efetivados.Checked then
    cmd := cmd + ' and cr1.dtarec is not null '
  else if Rb_nao_efetivados.Checked then
    cmd := cmd + ' and cr1.dtarec is null '
  else if rbParciais.Checked then
    cmd := cmd + ' and cr1.vlr_corrigido > cr1.valor_recebido '
  else if rbVencidos.Checked then
    cmd := cmd + ' and cr1.dtarec is null and cr1.dtaven < current_timestamp '
  else if rbProtestados.Checked then
    cmd := cmd + ' and cr1.protesto = ''S'' ';

  ordem := ' order by  ';
  if zz_ord_titulo.Checked then
    ordem := ordem + ' cr1.titulo ';

  if zz_ord_vencimento.Checked then
    ordem := ordem + ' cr1.dtaven ';

  if zz_ord_pagamento.Checked then
    ordem := ordem + ' cr1.dtarec ';

  if zz_ord_Cliente.Checked then
    ordem := ordem + ' c.nom_cliente ';

  if zz_ord_valor.Checked then
    ordem := ordem + ' cr1.valor ';

  with Dm.q_contas_receber do
  begin
    close;
    sql.Clear;
    sql.Add(cmd + ordem);
    open;
  end;

  if Dm.q_contas_receber.RecordCount <= 0 then
  begin
    dao.msg('Não foi encontrado Registros para gerar o Relatório');
    Exit;
  end;

  if not(fR_RELATORIO.LoadFromFile(path + 'Relatorios\contas_receber.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 +
      'Avise o Suporte');
    Exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure TFr_contas_receber.Prid_plano_contasButtonClick(Sender: TObject);
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
  chamou_form := 'fr_cr_plano_conta';
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

  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_contas_receber.Prid_plano_contasKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;
end;

procedure TFr_contas_receber.Prid_plano_contasExit(Sender: TObject);
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
    sqlplano := 'SELECT ' + '  PC4.ID, ' +
      '  TRIM(PC1.NR_CONTA)||''-''||PC1.DESCRICAO DESCRICAO1, ' +
      '  TRIM(PC2.NR_CONTA)||''-''||PC2.DESCRICAO DESCRICAO2, ' +
      '  TRIM(PC3.NR_CONTA)||''-''||PC3.DESCRICAO DESCRICAO3, ' +
      '  TRIM(PC4.NR_CONTA)||''-''||PC4.DESCRICAO DESCRICAO4  ' + 'FROM ' +
      '  PLANO_CONTAS PC4 ' +
      'INNER JOIN PLANO_CONTAS PC3 ON (PC3.ID = PC4.ID_PAI) ' +
      'INNER JOIN PLANO_CONTAS PC2 ON (PC2.ID = PC3.ID_PAI) ' +
      'INNER JOIN PLANO_CONTAS PC1 ON (PC1.ID = PC2.ID_PAI) ' +
      'WHERE PC4.NIVEL = 4 AND (PC3.ID IN (''7'')) AND PC4.ID = ' +
      QuotedStr(Prid_plano_contas.Text);

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

procedure TFr_contas_receber.edValorIniExit(Sender: TObject);
begin
  edValorFim.Value := edValorIni.Value;
end;

procedure TFr_contas_receber.BtnLimparClick(Sender: TObject);
begin
  Zzcod_empresa.Clear;
  Zzcod_cliente1.Clear;
  Zzcod_fop1.Clear;
  Ed_titulo1.Clear;
  ed_titulo2.Clear;
  ED_NF.Clear;
  edValorIni.Value := 0;
  edValorFim.Value := 0;
  LbNom_cliente1.Caption := '...';
  Lbnom_fop1.Caption := '...';
  Lbnom_empresa1.Caption := '...';
end;

procedure TFr_contas_receber.dgContasPagarDrawColumnCell(Sender: TObject;
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

procedure TFr_contas_receber.sbAbrirClick(Sender: TObject);
begin
  if not Q_resultado.IsEmpty then
  begin
    Q_resultado.Locate('id', mmContasPagarID.AsString, []);
    ativa_cr1(mmContasPagarID.AsString);
    preenche_campos;
    Pccor.ActivePage := tab_dados;
  end;

end;

procedure TFr_contas_receber.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TFr_contas_receber.sbConfPgtoClick(Sender: TObject);
var
  codigo, quem_pagou, descricao, sacador: string;
  saldo, valor_a_pagar: real;
  cheque, cheque_master, usuario, x: Integer;
  function ChecarJuros: Boolean;
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
          Result := true;
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
            Result := false;
            Exit;
            { mmContasPagar.Edit;
              mmContasPagarVALOR_CORRIGIDO.Value := mmContasPagarVALOR.Value;
              mmContasPagar.Post; }
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
  end;
  procedure efetuar_recebimento;
  begin
    // descricao := 'RECEBIMENTO CONTA: CLIENTE: ' + mmContasPagarRAZAO_SOCIAL.AsString + ' TÍTULO Nº: ' + mmContasPagarTITULO.Value + ';';

    mmContasPagar.First;
    x := 0;
    Application.CreateForm(Tfrm_conta_descontada, frm_conta_descontada);
    while not mmContasPagar.Eof do
    begin
      if (mmContasPagarDESCONTADA.AsString <> '1') then
      begin
        SetLength(frm_conta_descontada.Listas_Contas, totalselecionados);
        if mmContasPagarCheck.Value = true then
        begin
          descricao := descricao + 'RECEBIMENTO CONTA: CLIENTE: ' +
            mmContasPagarRAZAO_SOCIAL.AsString + ' TÍTULO Nº: ' +
            mmContasPagarTITULO.Value + '-' +
            mmContasPagarSEQUENCIA.AsString + ';';
          frm_conta_descontada.Listas_Contas[x] := mmContasPagarID.Value;
          x := x + 1;
        end;
      end;

      mmContasPagar.Next;
    end;

    mmContasPagar.First;

    if mmContasPagarDESCONTADA.AsString <> '1' then
    begin
      frm_conta_descontada.pagar := false;
      frm_conta_descontada.Total := valor_a_pagar;
      frm_conta_descontada.historico := descricao;
      // frm_conta_descontada.eddtMov.Date := mmContasPagarDTAVEN.AsDateTime;
      SetLength(frm_conta_descontada.Listas_Contas, 1);
      frm_conta_descontada.Listas_Contas[0] := mmContasPagarID.Value;
      frm_conta_descontada.ShowModal;

      if frm_conta_descontada.ModalResult = mrok then
      begin
        while not mmContasPagar.Eof do
        begin
          if mmContasPagarCheck.Value = true then
          begin

            mmContasPagar.Edit;
            mmContasPagarVALOR_CORRIGIDO.Value :=
              mmContasPagarVALOR_CORRIGIDO.Value -
              (frm_conta_descontada.Desconto / x);
            mmContasPagarVALOR.Value := mmContasPagarVALOR.Value -
              (frm_conta_descontada.Desconto / x);
            mmContasPagarVALOR_PAGO.Value := mmContasPagarVALOR_CORRIGIDO.Value;
            mmContasPagar.Post;

            try
              if not dao.cn.InTransaction then
                dao.cn.StartTransaction;
              dao.Exec_sql.sql.Clear;
              dao.Exec_sql.sql.Add('UPDATE CR1 SET DTAREC = ' +
                QuotedStr(formatdatetime('dd/mm/yyyy',
                strtodate(frm_conta_descontada.eddtMov.Text))) + ', VALOR = ' +
                StringReplace(mmContasPagarVALOR.AsString, ',', '.',
                [rfReplaceAll]) + ', VLR_CORRIGIDO = ' +
                StringReplace(mmContasPagarVALOR_CORRIGIDO.AsString, ',', '.',
                [rfReplaceAll]) + ', VALOR_RECEBIDO = ' +
                StringReplace(mmContasPagarVALOR_PAGO.AsString, ',', '.',
                [rfReplaceAll]) + ' WHERE ID = ' + mmContasPagarID.AsString);
              dao.Exec_sql.Execsql;
              dao.grava_log(dao.Exec_sql.sql.Text, '');
              if mmContasPagarNR_DOCUMENTO.AsString <> '' then
                FMFUN.AtualizaDadosComissao(mmContasPagarNR_DOCUMENTO.AsString);
              dao.cn.Commit;
            except
              dao.cn.rollback;
            end;
          end;
          mmContasPagar.Next;
        end;
      end;
    end;
  end;

begin
  // cod_usuario
  valor_a_pagar := 0;
  if VlrTotalSel > 0 then
  begin
    mmContasPagar.DisableControls;
    mmContasPagar.First;
    while not mmContasPagar.Eof do
    begin
      if mmContasPagarCheck.Value = true then
        if not ChecarJuros then
          Exit;
      mmContasPagar.Next;
    end;

    efetuar_recebimento;
    btokClick(Self);
    sbConfPgto.Enabled := false;
    total_confimar_pagto := 0;
    mmContasPagar.EnableControls;
  end;
end;

procedure TFr_contas_receber.sbCancPgtoClick(Sender: TObject);
begin
  mmContasPagar.First;
  while not mmContasPagar.Eof do
  begin

    if mmContasPagarCheck.Value = true then
      FMFUN.ExcluirExtratoConta(mmContasPagarID.AsString, 'C',
        mmContasPagarVALOR_PAGO.Value);

    mmContasPagar.Next;
  end;
  btokClick(Self);
  sbCancPgto.Enabled := false;
  total_cancelar_pgto := 0;
end;

procedure TFr_contas_receber.dgContasPagarDblClick(Sender: TObject);
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

  sbConfPgto.Enabled := false;
  sbCancPgto.Enabled := false;

  if total_confimar_pagto > 0 then
    sbConfPgto.Enabled := true;

  if total_cancelar_pgto > 0 then
    sbCancPgto.Enabled := true;

  if total_parcial_pgto > 0 then
  begin
    sbConfPgto.Enabled := true;
    sbCancPgto.Enabled := true;
  end;

  if ((total_confimar_pagto > 0) and (total_cancelar_pgto > 0)) or
    ((total_parcial_pgto > 0) and (total_cancelar_pgto > 0)) or
    ((total_confimar_pagto > 0) and (total_cancelar_pgto > 0)) then
  begin
    sbConfPgto.Enabled := false;
    sbCancPgto.Enabled := false;
  end;
end;

procedure TFr_contas_receber.zPrId_Plano_ContasButtonClick(Sender: TObject);
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
  chamou_form := 'fr_zz_cr_plano_conta';
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

  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_contas_receber.zPrId_Plano_ContasExit(Sender: TObject);
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
      'WHERE (PC3.ID IN (''119'')  OR PC3.ID IN (''120'')  OR PC3.ID IN (''30'') OR PC3.ID IN (''36'') OR PC3.ID IN (''40'') OR PC1.ID IN(''58'')) AND PC4.ID = '
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

procedure TFr_contas_receber.MontaArquivoCobrancaEnvio;
var
  txt: TextFile;
  dia, mes, ano, ord, ext, pathSaida, tempFile, nosso_numero, nosso_numero_div,
    sql_cliente, dir_remessa: string;
  sequencial_arquivo: Integer;
begin
  pathSaida := ExtractFilePath(Application.ExeName);
  tempFile := pathSaida + 'temp.txt';
  dia := FormatDateTime('dd', now);
  mes := FormatDateTime('mm', now);
  ano := FormatDateTime('yy', now);

  dir_remessa := pathSaida + fmfun.ACBrBoleto1.Banco.Nome + '\';
  if not DirectoryExists(dir_remessa) then
    ForceDirectories(dir_remessa);
  arquivo := dir_remessa + 'CB' + dia + mes + ord + ext;

  fmfun.ACBrBoleto1.NomeArqRemessa := arquivo;

    sql_cliente :=
      ' SELECT a.COD_CLIENTE, '+
      '   a.NOM_CLIENTE, '+
      '   a.ENDERECO, '+
      '   a.COMPLEMENTO, '+
      '   a.BAIRRO, '+
      '   a.CEP, '+
      '   a.COD_CIDADE, '+
      '   a.TIP_PESSOA, '+
      '   a.CNPJ, '+
      '   a.CPF, '+
      '   a.NR_ENDERECO, '+
      '   cd.NOM_CIDADE, '+
      '   cd.uf, '+
      '   CASE WHEN a.IE IS NULL THEN 1 ELSE 0 END AS ISENTO '
      + ' FROM CLIENTE a ' +
      ' inner join cidades cd on (cd.COD_CIDADE = a.COD_CIDADE) ' +
      ' where a.cod_cliente = ' + Prcod_cliente.Text;

    dao.Geral4(sql_cliente);

  // CABEÇALHO 0
  sequencial_arquivo := 1;
  fmfun.ACBrBoleto1.ListadeBoletos.Clear;
  fmfun.MontaCobrancaItem(
   dao.Q4.fieldbyname('NOM_CLIENTE').AsString,
   dao.Q4.fieldbyname('TIP_PESSOA').AsString,
   dao.Q4.fieldbyname('CNPJ').AsString,
   dao.Q4.fieldbyname('cpf').AsString,
   dao.Q4.fieldbyname('ENDERECO').AsString,
   dao.Q4.fieldbyname('NR_ENDERECO').AsString,
   dao.Q4.fieldbyname('Bairro').AsString,
   dao.Q4.fieldbyname('NOM_CIDADE').AsString,
   dao.Q4.fieldbyname('uf').AsString,
   dao.Q4.fieldbyname('CEP').AsString,
   carteira_conta,
   Boleto_Avalista,
   Q_cr1.fieldbyname('titulo').AsString,
   Q_cr1.fieldbyname('sequencia').AsString,
   PrInstrucao_Boleto.Text+#13+mensagem_padrao,
   Prdtaven.Date,
   dias_protesto,
   dias_baixar,
   dao.Q4.fieldbyname('isento').asinteger,
   Q_cr1.fieldbyname('valor').AsFloat);

end;

procedure TFr_contas_receber.PrCONTA_BOLETOExit(Sender: TObject);
begin
  if trim(PrCONTA_BOLETO.Text) = '' then
  begin
    lbCCBoleto.Caption := '...';
    btBoleto.Enabled := false;
  end
  else
  begin
    dao.Geral2
      ('select c.id, e.cod_empresa, C.DIAS_PROTESTO, c.dias_baixar, b.NOM_BANCO, b.NR_BANCO, '
      + 'b.LAYOUT_REMESSA, c.nr_conta, c.codigo_cedente, c.nr_agencia, c.dta_abertura_conta, '
      + 'c.convenio, COALESCE(C.NOME_CORRENTISTA, E.NOM_EMPRESA) AS NOME_CORRENTISTA, C.CARTEIRA, e.CNPJ, e.ENDERECO, e.NR_ENDERECO, '
      + 'e.CEP, cd.NOM_CIDADE, cd.UF, c.tipo_cobranca, c.mensagem_padrao ' +
      'from conta_corrente c ' + 'inner join banco b on b.ID = c.ID_BANCO ' +
      'inner join empresa e on (e.COD_EMPRESA = c.ID_EMPRESA) ' +
      'inner join cidades cd on cd.COD_CIDADE = e.COD_CIDADE ' + 'where c.id=' +
      QuotedStr(PrCONTA_BOLETO.Text));
    if dao.q2.RecordCount > 0 then
    begin
      lbCCBoleto.Caption := dao.q2.fieldbyname('nom_banco').AsString + ' - ' +
        dao.q2.fieldbyname('nr_agencia').AsString + '/' +
        dao.q2.fieldbyname('nr_conta').AsString;
      if dao.q2.fieldbyname('LAYOUT_REMESSA').AsString = 'c240' then
        fmfun.ACBrBoleto1.LayoutRemessa := c240
      else
        fmfun.ACBrBoleto1.LayoutRemessa := c400;

      case dao.q2.fieldbyname('nr_banco').AsInteger of
        1:
          begin
            fmfun.ACBrBoleto1.Banco.TipoCobranca := cobBancoDoBrasil;
            if dao.q2.fieldbyname('tipo_cobranca').AsString = '1' then
              fmfun.ACBrBoleto1.Cedente.CaracTitulo := tcSimples;

            if dao.q2.fieldbyname('tipo_cobranca').AsString = '2' then
              fmfun.ACBrBoleto1.Cedente.CaracTitulo := tcVinculada;

            if dao.q2.fieldbyname('tipo_cobranca').AsString = '3' then
              fmfun.ACBrBoleto1.Cedente.CaracTitulo := tcDescontada;
          end;
        104:
          fmfun.ACBrBoleto1.Banco.TipoCobranca := cobCaixaEconomica;
        237:
          fmfun.ACBrBoleto1.Banco.TipoCobranca := cobBradesco;
        341:
          fmfun.ACBrBoleto1.Banco.TipoCobranca := cobItau;
        87:
          fmfun.ACBrBoleto1.Banco.TipoCobranca := cobBradesco;
        85:
          fmfun.ACBrBoleto1.Banco.TipoCobranca := cobBancoCECRED;
        756:
          begin
            fmfun.ACBrBoleto1.Banco.TipoCobranca := cobBancoob;
            if dao.q2.fieldbyname('tipo_cobranca').AsString = '1' then
              fmfun.ACBrBoleto1.Cedente.CaracTitulo := tcSimples;

            if dao.q2.fieldbyname('tipo_cobranca').AsString = '2' then
              fmfun.ACBrBoleto1.Cedente.CaracTitulo := tcVinculada;

            if dao.q2.fieldbyname('tipo_cobranca').AsString = '3' then
              fmfun.ACBrBoleto1.Cedente.CaracTitulo := tcDescontada;

            fmfun.ACBrBoleto1.Cedente.Modalidade := '01';
          end;
        33:
          begin
            fmfun.ACBrBoleto1.Banco.TipoCobranca := cobSantander;
            if dao.q2.fieldbyname('tipo_cobranca').AsString = '1' then
              fmfun.ACBrBoleto1.Cedente.CaracTitulo := tcSimples;

            if dao.q2.fieldbyname('tipo_cobranca').AsString = '2' then
              fmfun.ACBrBoleto1.Cedente.CaracTitulo := tcVinculada;

            if dao.q2.fieldbyname('tipo_cobranca').AsString = '3' then
              fmfun.ACBrBoleto1.Cedente.CaracTitulo := tcDescontada;
          end;
      end;

      fmfun.ACBrBoleto1.Cedente.Agencia :=
        copy(dao.q2.fieldbyname('nr_agencia').AsString, 1,
        pos('-', dao.q2.fieldbyname('nr_agencia').AsString) - 1);
      fmfun.ACBrBoleto1.Cedente.AgenciaDigito :=
        copy(dao.q2.fieldbyname('nr_agencia').AsString,
        pos('-', dao.q2.fieldbyname('nr_agencia').AsString) + 1, 2);
      fmfun.ACBrBoleto1.Cedente.Conta := copy(dao.q2.fieldbyname('nr_conta').AsString,
        1, pos('-', dao.q2.fieldbyname('nr_conta').AsString) - 1);
      fmfun.ACBrBoleto1.Cedente.ContaDigito :=
        copy(dao.q2.fieldbyname('nr_conta').AsString,
        pos('-', dao.q2.fieldbyname('nr_conta').AsString) + 1, 2);
      fmfun.ACBrBoleto1.Cedente.CodigoCedente :=
        dao.q2.fieldbyname('codigo_cedente').AsString;
      fmfun.ACBrBoleto1.Cedente.Convenio := dao.q2.fieldbyname('convenio').AsString;
      fmfun.ACBrBoleto1.Cedente.Nome :=
        dao.q2.fieldbyname('NOME_CORRENTISTA').AsString;
      fmfun.ACBrBoleto1.Cedente.CNPJCPF := dao.q2.fieldbyname('CNPJ').AsString;
      dias_protesto := dao.q2.fieldbyname('DIAS_PROTESTO').AsInteger;
      dias_baixar := dao.q2.fieldbyname('DIAS_BAIXAR').AsInteger;
      carteira_conta := dao.q2.fieldbyname('CARTEIRA').AsString;
      mensagem_padrao :=  dao.q2.fieldbyname('mensagem_padrao').AsString;
      if dao.q2.fieldbyname('nr_banco').AsInteger = 87 then
      begin

        Boleto_Avalista := dao.q2.fieldbyname('CNPJ').AsString + ' - CNPJ ' +
          dao.q2.fieldbyname('CNPJ').AsString + ' ' +
          dao.q2.fieldbyname('ENDERECO').AsString + ', ' +
          dao.q2.fieldbyname('NR_ENDERECO').AsString + ' - ' +
          dao.q2.fieldbyname('CEP').AsString + ', ' +
          dao.q2.fieldbyname('NOM_CIDADE').AsString + '-' +
          dao.q2.fieldbyname('UF').AsString;

        fmfun.ACBrBoleto1.Cedente.Nome := 'UNICRED LITORAL E NORTE CATARINENSE';
        fmfun.ACBrBoleto1.Cedente.Logradouro := 'RUA CAMBORIÚ, Nº 519 - CENTRO';
        fmfun.ACBrBoleto1.Cedente.Bairro := 'CENTRO';
        fmfun.ACBrBoleto1.Cedente.Cidade := 'ITAJAI';
        fmfun.ACBrBoleto1.Cedente.UF := 'SC';
        fmfun.ACBrBoleto1.Cedente.CNPJCPF := '74114042000190';
        fmfun.ACBrBoleto1.Cedente.CEP := '80301451';

      end;

      MontaArquivoCobrancaEnvio;
      btBoleto.Enabled := true;

    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      PrCONTA_BOLETO.Text := '';
      PrCONTA_BOLETO.SetFocus;
      btBoleto.Enabled := false;
      Exit;
    end;
  end;
end;

procedure TFr_contas_receber.PrdtavenExit(Sender: TObject);
begin
  if Prdtaven.Date < now then
  begin
    dao.msg('Data de Vencimento anterior do que a Data Atual!');
    Exit;
  end;
end;

procedure TFr_contas_receber.PrCONTA_BOLETOButtonClick(Sender: TObject);
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
  chamou_form := 'fr_cc_cr';
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

procedure TFr_contas_receber.btBoletoClick(Sender: TObject);
begin
  // fmfun.ACBrBoleto1.GerarRemessa(strtoint('1'));
  fmfun.ACBrBoletoFCFR1.DirLogo := ExtractFilePath(Application.ExeName) +
    '\Logos\colorido\';

  fmfun.ACBrBoletoFCFR1.FastReportFile := ExtractFilePath(Application.ExeName) +
    'Relatorios\Boleto.fr3';

  if trim(PrCONTA_BOLETO.Text) = '' then
  begin
    showmessage('É necessário informar a Conta Corrente do Boleto.');
    Exit;
  end;

  fmfun.ACBrBoleto1.Imprimir;
end;

procedure TFr_contas_receber.FormCreate(Sender: TObject);
begin
  fmfun.ACBrBoleto1.Cedente.TipoInscricao := pJuridica;
end;

procedure TFr_contas_receber.btAltTituloClick(Sender: TObject);
begin
  Prtitulo.ReadOnly := false;
  btAltTitulo.Visible := false;
  btGrTitulo.Visible := true;
  Prtitulo.SetFocus;
end;

procedure TFr_contas_receber.btGrTituloClick(Sender: TObject);
begin
  btAltTitulo.Visible := true;
  btGrTitulo.Visible := false;
  //if dao.cn.InTransaction then
    dao.cn.StartTransaction;
  dao.Execsql('UPDATE CR1 SET BOLETO_REMESSA_ORDEM = NULL WHERE ID = ' +
    Prid.Text);
  dao.cn.Commit;
  btgraClick(Self);
  ativa_cr1(Prid.Text);
  mostra_campos('Pr');
end;

procedure TFr_contas_receber.BtnEmailBoletoClick(Sender: TObject);
var
  EmailBoleto: TEmail;
  corpo_email, assunto_email, ref: string;
begin
  if not FMFUN.ChecarEmailCliente(Prcod_cliente.Text, 'pedido') then
    Exit;

  dao.Geral1
    ('SELECT C.EMAIL, C.EMAIL_ADICIONAL1, C.EMAIL_ADICIONAL2, C.EMAIL_ADICIONAL3, C.NOM_CLIENTE FROM CLIENTE C WHERE c.cod_cliente = '
    + Prcod_cliente.Text);

  if dao.Q1.fieldbyname('EMAIL').IsNull then
    Exit;

  ref := 'Título Nº.: ' + Prtitulo.Text + '-' + Prsequencia.Text;

  assunto_email := nom_empresa + '- Boleto ' + ref;

  corpo_email := '<html><body> ' +
    '  <font face="Consolas" size="2">Prezado Cliente</font><br><br> ' +
    '  <font face="Consolas" size="2">Segue arquivo do Boleto ' + ref +
    ' em Anexo</font><br><br> ' +
    '  <font face="Consolas" size="2">Informações: ' + fone_empresa +
    '</font><br> ' + '  <font face="Consolas" size="2">' + home_page +
    '</font><br><br>' + '  <img src="cid:123456"><br>' + '</body></html> ';

  if Q_cr1.IsEmpty then
    Exit;

  fmfun.ACBrBoletoFCFR1.NomeArquivo := 'c:\orbi\boleto.pdf';
  fmfun.ACBrBoleto1.GerarPDF;

  try
    Application.CreateForm(TFr_email_envio, Fr_email_envio);
    Fr_email_envio.lbResultado.Caption := 'Enviando Email de Boleto ao Cliente';

   if dao.CN.params.values['database'] = 'C:\orbi\trunk\dados\orbi.fdb' then
      EmailBoleto := TEmail.Create(corpo_email, 'Teste', '', '', '', '',
        'informatica@plasfan.ind.br', fmfun.ACBrBoletoFCFR1.NomeArquivo)
    else
      EmailBoleto := TEmail.Create(corpo_email, assunto_email,
        dao.Q1.fieldbyname('EMAIL').AsString,
        dao.Q1.fieldbyname('EMAIL_ADICIONAL1').AsString,
        dao.Q1.fieldbyname('EMAIL_ADICIONAL2').AsString,
        dao.Q1.fieldbyname('EMAIL_ADICIONAL3').AsString,
        'claudioplasfan@gmail.com', fmfun.ACBrBoletoFCFR1.NomeArquivo);

    Fr_email_envio.ShowModal;
  finally
    Fr_email_envio.Free;
    dao.Q1.close;
  end;

end;

procedure TFr_contas_receber.tab_localizarShow(Sender: TObject);
begin
  redimensionar(false);
end;

procedure TFr_contas_receber.tab_resultadoShow(Sender: TObject);
begin
  redimensionar(true);
end;

procedure TFr_contas_receber.tab_dadosShow(Sender: TObject);
begin
  redimensionar(false);
end;

procedure TFr_contas_receber.CheckTodosClick(Sender: TObject);
begin
  totalselecionados := 0;
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
  if totalselecionados = 0 then
  begin
    sbConfPgto.Enabled := false;
    sbCancPgto.Enabled := false;
  end
  else
  begin
    if mmContasPagarVALOR_PAGO.Value = 0 then
    begin
      sbConfPgto.Enabled := true;
      sbCancPgto.Enabled := false;
    end
    else
    begin
      sbConfPgto.Enabled := false;
      sbCancPgto.Enabled := true;
    end;
  end;
end;

procedure TFr_contas_receber.ZzContaBoletoButtonClick(Sender: TObject);
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
  chamou_form := 'fr_cor_cc';
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

procedure TFr_contas_receber.ZzContaBoletoExit(Sender: TObject);
begin
  if trim(ZzContaBoleto.Text) = '' then
    lbContaBoleto.Caption := '...'
  else
  begin
    dao.Geral2
      ('select c.id, C.DIAS_PROTESTO, C.DIAS_BAIXAR, b.NOM_BANCO, b.NR_BANCO, b.LAYOUT_REMESSA, c.nr_conta, c.codigo_cedente, c.nr_agencia, c.dta_abertura_conta, c.convenio, C.NOME_CORRENTISTA, C.CARTEIRA, e.CNPJ, c.mensagem_padrao '
      + 'from conta_corrente c inner join banco b on b.ID = c.ID_BANCO inner join empresa e on (e.COD_EMPRESA = c.ID_EMPRESA) '
      + 'where c.id=' + QuotedStr(ZzContaBoleto.Text));
    if dao.q2.RecordCount > 0 then
    begin
      lbContaBoleto.Caption := dao.q2.fieldbyname('nom_banco').AsString + ' - '
        + dao.q2.fieldbyname('nr_agencia').AsString + '/' +
        dao.q2.fieldbyname('nr_conta').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      ZzContaBoleto.Text := '';
      ZzContaBoleto.SetFocus;
      Exit;
    end;
  end;
end;

procedure TFr_contas_receber.fR_RELATORIOGetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'empresa' then
    Value := nom_empresa
  else if VarName = 'dtaini' then
    Value := FormatDateTime('dd/mm/yyyy', EDdtaini.Date)
  else if VarName = 'dtafin' then
    Value := FormatDateTime('dd/mm/yyyy', Eddtafin.Date);
end;

end.



