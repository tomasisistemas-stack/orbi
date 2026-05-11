unit Un_montagem_carga;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, Mask, StdCtrls, Buttons, ActiveX,
  ComCtrls,  comobj, Menus, frxClass, RDprint, NFE_dll_TLB,
  sBitBtn, sLabel, sCheckBox, sGroupBox, ExtCtrls, DBGrids, sSpeedButton,
  DBCtrls, DB, RxMemDS, acDBGrid, sCurrEdit, sCurrencyEdit, sMaskEdit,
  xmldom, XMLIntf, msxmldom, XMLDoc, PCNCONVERSAO, pmdfeConversaoMDFe,
  sCustomComboEdit, sTooledit, sEdit, sComboEdit,  ACBrDFeReport, ACBrMDFeConfiguracoes,
  ACBrMDFeDAMDFeClass, ACBrMDFeDAMDFEFR, ACBrBase, ACBrDFe, ACBrMDFe, ACBrMDFeManifestos,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, pmdfeMDFe,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TMDFet = class(TThread)
  private
    cBuscarCertificado: _BuscarCertificado;
    tipAmb: integer;
    cont: integer;
    erro, finalizado: boolean;
    recibo, msgerros, status, motivo: WideString;
    ChaveNfe, PathLote, pathSaida: string;
    //procedure Execute; override;
    // referente a NF-e
    procedure monta_MDFe;
{   procedure GravarChaveMDFe;
    procedure TransfereMDFeBD;
    procedure EnviarLote(arquivo: string);
    procedure GravarReciboMDFe;
    function GerarXMLProcMDFe: boolean;
    procedure Mostra; }
  public
    tipo: integer; // 0 - Saida; 1 - Entrada;
    constructor Create(BuscarCertificado: _BuscarCertificado);
  end;


  TFr_montagem_carga = class(TForm)
    GroupBox2: TsGroupBox;
    GroupBox3: TsGroupBox;
    Label5: tsLabel;
    Label6: tsLabel;
    Btgra: TsBitBtn;
    btcan: TsBitBtn;
    Btimp_separacao_itens: TsBitBtn;
    Btimp_form_carga: TsBitBtn;
    SBcarga: TStatusBar;
    btloc: TsBitBtn;
    q_carga1: TFDQuery;
    Q_carga2: TFDQuery;
    Prtot_peso: TsCurrencyEdit;
    Prtot_carga: TsCurrencyEdit;
    Label10: tsLabel;
    Prtot_frete: TsCurrencyEdit;
    Lbperc_frete: tsLabel;
    MainMenu1: TMainMenu;
    FecharCarga1: TMenuItem;
    fr_relatorio: TfrxReport;
    rd_vendas: TRDprint;
    mmRep: TRxMemoryData;
    mmRepCheck: TBooleanField;
    dsRep: TDataSource;
    mmRepNome: TStringField;
    mmUF: TRxMemoryData;
    mmUFCheck: TBooleanField;
    dsUF: TDataSource;
    mmUFUF: TStringField;
    mmMeso: TRxMemoryData;
    mmMesoNome: TStringField;
    mmMesoCheck: TBooleanField;
    dsMeso: TDataSource;
    mmMicro: TRxMemoryData;
    mmMicroNome: TStringField;
    mmMicroCheck: TBooleanField;
    dsMicro: TDataSource;
    dsCidades: TDataSource;
    mmCidades: TRxMemoryData;
    mmCidadesNome: TStringField;
    mmCidadesCheck: TBooleanField;
    dgCarga: Tdbgrid;
    mmCarga2: TRxMemoryData;
    mmCarga2Check: TBooleanField;
    dsCarga2: TDataSource;
    mmCarga2Pedido: TIntegerField;
    mmCarga2DATA: TDateField;
    mmCarga2VALOR: TCurrencyField;
    mmCarga2PESO: TFloatField;
    mmCarga2FRETE_COMBINADO: TBooleanField;
    mmRepID: TIntegerField;
    mmMesoID: TIntegerField;
    mmMicroID: TIntegerField;
    mmCidadesID: TIntegerField;
    CheckPedido: TDBCheckBox;
    mmCarga2CLIENTE: TStringField;
    mmCarga2NFE: TStringField;
    PageControl1: TPageControl;
    tsCarga: TTabSheet;
    Panel1: TPanel;
    sbFiltro: TsSpeedButton;
    sGroupBox1: TsGroupBox;
    dgRep: Tdbgrid;
    sGroupBox2: TsGroupBox;
    dgEstado: Tdbgrid;
    sGroupBox3: TsGroupBox;
    dgMeso: Tdbgrid;
    CheckMeso: TDBCheckBox;
    sGroupBox4: TsGroupBox;
    dgMicro: Tdbgrid;
    CheckMicro: TDBCheckBox;
    sGroupBox5: TsGroupBox;
    dgCidade: Tdbgrid;
    CheckCidades: TDBCheckBox;
    gbDtIni: TsGroupBox;
    ftDtIni: TsDateEdit;
    gbDtFim: TsGroupBox;
    ftDtFim: TsDateEdit;
    CheckRep: TDBCheckBox;
    CheckUF: TDBCheckBox;
    GroupBox1: TsGroupBox;
    Label1: tsLabel;
    Label2: tsLabel;
    Label3: tsLabel;
    Lbnom_motorista: tsLabel;
    Label7: tsLabel;
    Lbnom_veiculo: tsLabel;
    Label9: tsLabel;
    LbNom_transportadora: tsLabel;
    Label16: tsLabel;
    BtcriaCarga: TsBitBtn;
    Prid: TsEdit;
    Prnom_carga: TsEdit;
    Prid_motorista: TsComboEdit;
    Prdta_carga: TsDateEdit;
    Prid_veiculo: TsComboEdit;
    Prcod_transportadora: TsComboEdit;
    ACBrMDFe1: TACBrMDFe;
    ACBrMDFeDAMDFEFR1: TACBrMDFeDAMDFEFR;
    sLabel2: tsLabel;
    PRuf_destino: TsEdit;
    edPedido: TsEdit;
    sLabel1: TsLabel;
    Label8: TsLabel;
    Prcod_empresa: TsComboEdit;
    Lbempresa_faturamento: TsLabel;
    Label35: TsLabel;
    tsMDFe: TTabSheet;
    sGroupBox6: TsGroupBox;
    PrChave_MDFe: TsEdit;
    sGroupBox7: TsGroupBox;
    PrRECIBO_MDFE: TsEdit;
    sGroupBox8: TsGroupBox;
    PrPROTOCOLO_MDFE: TsEdit;
    sGroupBox9: TsGroupBox;
    PrDATA_REC_MDFE: TDateTimePicker;
    sGroupBox10: TsGroupBox;
    PrMotivo_MDFE: TsEdit;
    sGroupBox11: TsGroupBox;
    PrStatus_MDFE: TsEdit;
    gbCancNFeMDFE: TsGroupBox;
    LBsTATUSCANCEL_: TsLabel;
    PrJUSTIF_CANC_MDFE: TsEdit;
    BtnEnviarCancelamentoMDFE: TsBitBtn;
    BtnEditarCancelamentoMDFE: TsBitBtn;
    BtnSairCancelamentoMDFE: TsBitBtn;
    sGroupBox12: TsGroupBox;
    PrMDFE: TsEdit;
    btnMDFE: TsBitBtn;
    btRecXml_Dev: TsBitBtn;
    BtnDaMDFe: TsBitBtn;
    BtnEmailMDFe: TsBitBtn;
    sGroupBox13: TsGroupBox;
    PrDIGEST_MDFE: TsEdit;
    PrEntradaNaoDevolucao: TCheckBox;
    q_xml: TFDQuery;
    q_xmlXML: TBlobField;
    q_xmlXML_DEV: TBlobField;
    procedure FormShow(Sender: TObject);
    procedure PridKeyPress(Sender: TObject; var Key: Char);
    procedure Prdta_cargaKeyPress(Sender: TObject; var Key: Char);
    procedure Prnom_cargaKeyPress(Sender: TObject; var Key: Char);
    procedure Bt_insere_pedidoClick(Sender: TObject);
    procedure BtcriaCargaClick(Sender: TObject);
    procedure SgCargaClickCell(Sender: TObject; ARow, ACol: integer);
    procedure SgCargaSelectCell(Sender: TObject; ACol, ARow: integer;
      var CanSelect: boolean);
    procedure BtgraClick(Sender: TObject);
    procedure Prcod_transportadoraButtonClick(Sender: TObject);
    procedure Prcod_transportadoraExit(Sender: TObject);
    procedure Prcod_transportadoraKeyPress(Sender: TObject; var Key: Char);
    procedure Prid_motoristaButtonClick(Sender: TObject);
    procedure Prid_motoristaKeyPress(Sender: TObject; var Key: Char);
    procedure Prid_motoristaExit(Sender: TObject);
    procedure Prid_veiculoButtonClick(Sender: TObject);
    procedure Prid_veiculoKeyPress(Sender: TObject; var Key: Char);
    procedure btcanClick(Sender: TObject);
    procedure Prid_veiculoExit(Sender: TObject);
    procedure btlocClick(Sender: TObject);
    procedure Btimp_form_cargaClick(Sender: TObject);
    procedure FecharCarga1Click(Sender: TObject);
    procedure Btimp_separacao_itensClick(Sender: TObject);
    procedure fr_relatorioGetValue(const VarName: string; var Value: Variant);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dgRepDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: integer; Column: TColumn; State: TGridDrawState);
    procedure dgEstadoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: integer; Column: TColumn; State: TGridDrawState);
    procedure dgMesoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: integer; Column: TColumn; State: TGridDrawState);
    procedure dgMicroDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: integer; Column: TColumn; State: TGridDrawState);
    procedure dgCidadeDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: integer; Column: TColumn; State: TGridDrawState);
    procedure dgRepKeyPress(Sender: TObject; var Key: Char);
    procedure dgEstadoKeyPress(Sender: TObject; var Key: Char);
    procedure dgMesoKeyPress(Sender: TObject; var Key: Char);
    procedure dgCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure dgRepDblClick(Sender: TObject);
    procedure dgEstadoDblClick(Sender: TObject);
    procedure dgMesoDblClick(Sender: TObject);
    procedure dgMicroDblClick(Sender: TObject);
    procedure dgCidadeDblClick(Sender: TObject);
    procedure sbFiltroClick(Sender: TObject);
    procedure dgCargaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: integer; Column: TColumn; State: TGridDrawState);
    procedure dgCargaDblClick(Sender: TObject);
    procedure Prcod_empresaExit(Sender: TObject);
    procedure Prcod_empresaKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_empresaButtonClick(Sender: TObject);
    procedure Prcod_empresaChange(Sender: TObject);
    procedure btnMDFEClick(Sender: TObject);
  private
    { Private declarations }
    procedure Monta_SgCarga;
    procedure Carrega_SgCarga;
    procedure limpa_campos(prefixo: ShortString);
    procedure readonly_false(prefixo: ShortString);
    procedure readonly_true(prefixo: ShortString);
    procedure Grava_Sgx(insert: boolean);
    procedure totaliza_carga;
    procedure faturar(nr_documento: string; dta_documento: TDateTime;
      cod_cliente, id_vendedor, cod_fop, cod_prazo: string; valor_total: real;
      nr_carga: string);
    procedure imprime_lote(cmd_where: string);
    procedure CarregarRepresentantes;
    procedure CarregarUF;
    procedure CarregarMeso(UF: string);
    procedure CarregarMicro(Meso: string);
    procedure CarregarCidades(Micro: string);
    procedure CarregarPedidos(filtro: boolean);
    procedure CarregarPedidosMDFe;
    procedure CarregaDados;
    procedure ImprimirDamdfe(chave: string; entrada: boolean = false);
  public
    { Public declarations }
    linmax: integer;
    modo_insert: boolean;
    UF_Emissor: string;

    busca_qualquer_posicao_pesquisada: boolean;
    campo_pesquisado, dado_pesquisado: string;

    id: string;
    procedure inserePedidoGrid(nr_pedido: string);
    procedure ativa_carga1(id: string);
    procedure ativa_carga2(id: string);
    procedure mostra_campos(prefixo: ShortString);
    procedure carrega_sgx_carga2;
    procedure faturar_pedidos_carga;

    procedure MontaFormularioCarga;

  end;

var
  Fr_montagem_carga: TFr_montagem_carga;
  lista_uf, lista_meso, lista_micro, lista_cidades, lista_repr, path: string;

implementation

uses Un_localizar, UnPri, Un_dao, Un_veiculos, UnFun, Un_fechamento_carga,
  Un_dm, Un_vendas_industria2, un_nfe_transmissao;

{$R *.dfm}

procedure TFr_montagem_carga.FormShow(Sender: TObject);
begin
  path := ExtractFilePath(Application.ExeName);
  Btimp_separacao_itens.Caption := 'Imprimir ' + #13 + 'Separação de Itens';
  Btimp_form_carga.Caption := 'Imprimir ' + #13 + 'Formulário de Carga';
  BtcriaCarga.Caption := 'Cria' + #13 + 'Carga';
  Monta_SgCarga;
  SBcarga.Panels[1].Text := '';
  readonly_true('Pr');

  lista_uf := '';
  lista_meso := '';
  lista_micro := '';
  lista_cidades := '';
  lista_repr := '';

  CarregarRepresentantes;
  CarregarUF;
end;

procedure TFr_montagem_carga.Monta_SgCarga;
begin
  //
end;

procedure TFr_montagem_carga.limpa_campos(prefixo: ShortString);
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
    Lbnom_motorista.Caption := '...';
    Lbnom_veiculo.Caption := '...';
    Lbperc_frete.Caption := '';
  end;

end;

procedure TFr_montagem_carga.PridKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;

end;

procedure TFr_montagem_carga.Prdta_cargaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;

end;

procedure TFr_montagem_carga.Prnom_cargaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;

end;

procedure TFr_montagem_carga.Bt_insere_pedidoClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
  It, J, Coluna: byte;
begin
  if Prid.Text <> '' then
  begin
    if q_carga1.Active = true then
    begin
      if q_carga1.FieldByName('carga_fechada').AsString = '1' then
      begin
        dao.msg('CARGA JÁ FECHADA');
        exit;
      end;
    end;
  end;

  if Prnom_carga.Text = '' then
  begin
    dao.msg('Digite um Nome para a Carga');
    Prnom_carga.SetFocus;
    exit;
  end;

  { if BtcriaCarga.Enabled = true then
    begin
    dao.msg('Para Inserir Pedidos na Carga Clique no Botão Criar Carga');
    exit;
    end; }

  if linmax <= 0 then
  begin
    dao.msg('Para Inserir Pedidos na Carga Clique no Botão Criar Carga');
    exit;
  end;

  if Prcod_transportadora.Text = '' then
  begin
    dao.msg('Informe a Transportadora da Carga!');
    Prcod_transportadora.SetFocus;
    exit;
  end;

  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Inserir Pedido na Carga';
  chamou_pesquisa := 'fr_pedido_carga';
  chamou_form := 'fr_pedido_monta_carga';
  chamou_cadastro := '';
  Fr_localizar.BT_cadastro.Caption := 'Ca&dastro de' + #13 + 'Cliente';
  Fr_localizar.BT_cadastro.Visible := false;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 6);
  Campos_combo[0] := 'Numero';
  Campos_combo[1] := 'Cliente';
  Campos_combo[2] := 'CNPJ';
  Campos_combo[3] := 'CPF';
  Campos_combo[4] := 'Cidade';
  Campos_combo[5] := 'Vendedor';

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

  // if Prcod_cliente.Text <> '' then
  // zzvalor_credito.Text:=  busca_credito(Prcod_cliente.Text);

  totaliza_carga;

end;

procedure TFr_montagem_carga.inserePedidoGrid(nr_pedido: string);
begin
  dao.Geral1
    ('select c.nom_cliente,v1.numdoc, v1.dtadoc, v1.tot_liquido, v1.peso_nota, v1.vl_frete '
    + ',volume_nota, dta_emissao, dta_saida, v1.cod_cliente, cod_fop, cod_prazo_pgto from vendas1 v1 '
    + 'left join cliente c on c.cod_cliente = v1.cod_cliente ' +
    'where V1.numdoc = ' + QuotedStr(nr_pedido));

  //
end;

procedure TFr_montagem_carga.BtcriaCargaClick(Sender: TObject);
begin
  BtcriaCarga.Enabled := false;
  Btimp_separacao_itens.Enabled := false;
  Btimp_form_carga.Enabled := false;

  Btgra.Enabled := true;
  btcan.Enabled := true;

  limpa_campos('Pr');
  modo_insert := true;
  Prdta_carga.Text := FormatDateTime('dd/mm/yyyy', dao.DtaSerDt);
  Prnom_carga.SetFocus;
  readonly_false('Pr');
  SBcarga.Panels[1].Text := 'CARGA EM ABERTO';
  sbFiltro.Enabled := true;
end;

procedure TFr_montagem_carga.SgCargaClickCell(Sender: TObject;
  ARow, ACol: integer);
begin
  lin := ARow;

end;

procedure TFr_montagem_carga.SgCargaSelectCell(Sender: TObject;
  ACol, ARow: integer; var CanSelect: boolean);
begin
  lin := ARow;

end;

procedure TFr_montagem_carga.readonly_false(prefixo: ShortString);
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

procedure TFr_montagem_carga.readonly_true(prefixo: ShortString);
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
end;

procedure TFr_montagem_carga.BtgraClick(Sender: TObject);
begin
  if Prid.Text <> '' then
  begin
    dao.Geral1('select carga_fechada from carga1 where id=' +
      QuotedStr(Prid.Text));
    if dao.Q1.FieldByName('carga_fechada').AsString = '1' then
    begin
      dao.msg('CARGA JÁ FECHADA');
      exit;
    end;
  end;

  if Prdta_carga.Text = '  /  /    ' then
  begin
    dao.msg('Preencha a Data da Carga');
    Prdta_carga.SetFocus;
    exit;
  end;

  { if Prid_veiculo.text = '' then
    begin
    dao.msg('Preencha o Veículo');
    Prid_veiculo.setfocus;
    exit;
    end;

    if Prid_motorista.text = '' then
    begin
    dao.msg('Preencha o Motorista');
    Prid_motorista.setfocus;
    exit;
    end; }

  if Prcod_transportadora.Text = '' then
  begin
    dao.msg('Preencha a Transportadora');
    Prcod_transportadora.SetFocus;
    exit;
  end;

  if trim(Prnom_carga.Text) = '' then
  begin
    dao.msg('Preencha o Nome da Carga');
    Prnom_carga.SetFocus;
    exit;
  end;

  BtcriaCarga.Enabled := true;
  btcan.Enabled := false;
  Btimp_separacao_itens.Enabled := true;
  Btimp_form_carga.Enabled := true;
  try
    if not(dao.cn.InTransaction) then
      dao.cn.StartTransaction;

    if Prid.Text = '' then
    begin
      id := dao.insert('Pr', 'carga1', 'id', Fr_montagem_carga, 'gen_carga1');
      Prid.Text := id;
      ativa_carga1(id);
    end
    else
    begin
      ativa_carga1(Prid.Text);
      dao.update('carga1', 'id', q_carga1.FieldByName('id').AsString, 'Pr',
        Fr_montagem_carga);
      dao.cn.Commit;

    end;
    Grava_Sgx(true);

    dao.Execsql('update carga1 set carga_fechada=' + QuotedStr('0') +
      ' where  id=' + QuotedStr(Prid.Text));
    // 0= carga ñ fechada e 1=carga fechada

    dao.cn.Commit;
    ativa_carga1(Prid.Text);
    ativa_carga2(Prid.Text);
    carrega_sgx_carga2;
    SBcarga.Panels[0].Text := 'CARGA EM ABERTO';
    dao.msg('Carga Gravada com Sucesso!');
  except
    dao.cn.rollback;
  end;

end;

procedure TFr_montagem_carga.ativa_carga1(id: string);
begin
  with q_carga1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(
      'SELECT ' +
      '  a.id, ' +
      '  a.dta_carga, ' +
      '  a.id_motorista, ' +
      '  a.nom_carga, ' +
      '  a.carga_fechada, ' +
      '  a.dta_faturamento, ' +
      '  a.id_veiculo, ' +
      '  a.cod_usuario, ' +
      '  a.cod_transportadora, ' +
      '  a.tot_peso, ' +
      '  a.tot_carga, ' +
      '  a.tot_frete, ' +
      '  a.chave_mdfe, ' +
      '  a.recibo_mdfe, ' +
      '  a.status_mdfe, ' +
      '  a.motivo_mdfe, ' +
      '  a.digest_mdfe, ' +
      '  a.protocolo_mdfe, ' +
      '  a.data_rec_mdfe, ' +
      '  a.justif_canc_mdfe, ' +
      '  a.mdfe, ' +
      '  a.cod_empresa, ' +
      '  v.nom_veiculo, ' +
      '  m.nome AS nom_motorista, ' +
      '  t.nome AS nome_transportadora ' +
      'FROM carga1 a ' +
      'LEFT JOIN veiculos v ON v.id = a.id_veiculo ' +
      'LEFT JOIN motorista m ON m.id = a.id_motorista ' +
      'LEFT JOIN transportadora t ON t.cod_transportadora = a.cod_transportadora ' +
      'WHERE a.id = ' + QuotedStr(id)
    );
    Open;
  end;
end;


procedure TFr_montagem_carga.ativa_carga2(id: string);
begin
  with Q_carga2 do
  begin
    close;
    sql.Clear;
    sql.Add(' SELECT a.NOM_REPRESENTANTE, a.NOM_CLIENTE, a.NOM_CIDADE, a.MICRONOMEX, a.MESONOMEX, a.UF, a.DTA_EMISSAO, a.NFE, a.NUMDOC, a.CARGA '
      + ' FROM V_CARGA a ' + ' where a.CARGA = ' + QuotedStr(id));
    open;
  end;
end;

procedure TFr_montagem_carga.Grava_Sgx(insert: boolean);
begin
  mmCarga2.First;
  try
    if not(dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    while not mmCarga2.Eof do
    begin
      if mmCarga2Check.Value then
        dao.Execsql('UPDATE VENDAS1 SET COD_CARGA = ' + Prid.Text +
          ' WHERE NUMDOC = ' + mmCarga2Pedido.AsString)
      else
        dao.Execsql('UPDATE VENDAS1 SET COD_CARGA = NULL WHERE NUMDOC = ' +
          mmCarga2Pedido.AsString);
      mmCarga2.Next;
    end;
    dao.cn.Commit;
  except
    dao.cn.rollback;
  end;
  mmCarga2.First;
end;

procedure TFr_montagem_carga.Prcod_empresaButtonClick(Sender: TObject);
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
  chamou_form := 'fr_carga_empresa';
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

procedure TFr_montagem_carga.Prcod_empresaChange(Sender: TObject);
begin
  PrMDFe.Clear;
end;

procedure TFr_montagem_carga.Prcod_empresaExit(Sender: TObject);
var
  codEmpresa: string;
begin
  Lbempresa_faturamento.Caption := '...';
  codEmpresa := Trim(Prcod_empresa.Text);

  if codEmpresa = '' then
    Exit;

  if (not FMFUN.verificaNumerico(codEmpresa)) then
  begin
    ShowMessage('Dado tem que ser sempre numérico!');
    Prcod_empresa.SetFocus;
    Exit;
  end;

  // Atualiza variável global/local
  empresa_faturar := codEmpresa;

  dao.Geral5(
    'SELECT ' +
    '  e.nom_empresa || '' - '' || e.CNPJ AS nom_empresa, ' +
    '  e.nom_empresa AS logo_desc, ' +
    '  c.id AS conta_corrente, ' +
    '  cd.uf, ' +
    '  e.logo ' +
    'FROM empresa e ' +
    'INNER JOIN cidades cd ON cd.cod_cidade = e.cod_cidade ' +
    'WHERE e.cod_empresa = ' + QuotedStr(codEmpresa)
  );

  if dao.q5.RecordCount > 0 then
  begin
    Lbempresa_faturamento.Caption := dao.q5.FieldByName('nom_empresa').AsString;
    UF_Emissor := dao.q5.FieldByName('uf').AsString;

    nome_logo := dao.q5.FieldByName('logo_desc').AsString + '.bmp';

    if not dao.q5.FieldByName('logo').IsNull then
      TBlobField(dao.q5.FieldByName('logo')).SaveToFile(nome_logo);
  end
  else
  begin
    dao.msg('Registro não encontrado!');
    Prcod_empresa.Text := '';
    Prcod_empresa.SetFocus;
    Exit;
  end;
end;


procedure TFr_montagem_carga.Prcod_empresaKeyPress(Sender: TObject;
  var Key: Char);
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
    if (Prcod_empresa.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Empresa';
      chamou_pesquisa := 'fr_empresa';
      chamou_form := 'fr_carga_empresa';
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

procedure TFr_montagem_carga.Prcod_transportadoraButtonClick(Sender: TObject);
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
  chamou_form := 'fr_monta_carga_transportadora';
  chamou_cadastro := 'fr_transportadora';

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

procedure TFr_montagem_carga.Prcod_transportadoraExit(Sender: TObject);
begin
  if trim(Prcod_transportadora.Text) = '' then
    LbNom_transportadora.Caption := '...';

  if Prcod_transportadora.Text <> '' then
  begin
    dao.Geral2
      ('select nome, frete_fixo, percentual_frete from transportadora where cod_transportadora='
      + QuotedStr(Prcod_transportadora.Text));
    if dao.q2.RecordCount > 0 then
    begin
      LbNom_transportadora.Caption := dao.q2.FieldByName('nome').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_transportadora.Text := '';
      Prcod_transportadora.SetFocus;
      exit;
    end;

    if dao.q2.FieldByName('frete_fixo').AsString = 'S' then
      Lbperc_frete.Caption := '%' + dao.q2.FieldByName
        ('percentual_frete').AsString
    else
      Lbperc_frete.Caption := '';

  end;

end;

procedure TFr_montagem_carga.Prcod_transportadoraKeyPress(Sender: TObject;
  var Key: Char);
var
  Campos_combo: array of string;
  i: integer;
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
    if (Prcod_transportadora.Text = '') and (BtcriaCarga.Enabled = false) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Transportadora';
      chamou_pesquisa := 'fr_transportadora';
      chamou_form := 'fr_monta_carga_transportadora';
      chamou_cadastro := 'fr_transportadora';

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

procedure TFr_montagem_carga.Prid_motoristaButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Motorista';
  chamou_pesquisa := 'fr_motorista';
  chamou_form := 'fr_monta_carga_motorista';
  chamou_cadastro := 'fr_motorista';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Motorista';
  Fr_localizar.BT_cadastro.Visible := true;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 6);
  Campos_combo[0] := 'Código';
  Campos_combo[1] := 'Nome do motorista';
  Campos_combo[2] := 'Fone';
  Campos_combo[3] := 'Celular';
  Campos_combo[4] := 'CPF';
  Campos_combo[5] := 'RG';

  for i := 0 to 5 do
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

procedure TFr_montagem_carga.Prid_motoristaKeyPress(Sender: TObject;
  var Key: Char);
var
  Campos_combo: array of string;
  i: integer;
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
    if (Prid_motorista.Text = '') and (BtcriaCarga.Enabled = false) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Motorista';
      chamou_pesquisa := 'fr_motorista';
      chamou_form := 'fr_monta_carga_motorista';
      chamou_cadastro := 'fr_motorista';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Motorista';
      Fr_localizar.BT_cadastro.Visible := true;

      // preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo, 2);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Nome';

      SetLength(Campos_combo, 6);
      Campos_combo[0] := 'Código';
      Campos_combo[1] := 'Nome do motorista';
      Campos_combo[2] := 'Fone';
      Campos_combo[3] := 'Celular';
      Campos_combo[4] := 'CPF';
      Campos_combo[5] := 'RG';

      for i := 0 to 5 do
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

procedure TFr_montagem_carga.totaliza_carga();
var
  i: integer;
begin
  if Prcod_transportadora.Text <> '' then
    dao.Geral1
      ('select frete_fixo, percentual_frete from transportadora where cod_transportadora='
      + QuotedStr(Prcod_transportadora.Text));
  Prtot_carga.Value := 0;
  Prtot_peso.Value := 0;
  Prtot_frete.Value := 0;

  { Prtot_carga.Value := SgCarga.ColumnSum(4, 1, SgCarga.RowCount);
    Prtot_peso.value := SgCarga.ColumnSum(5, 1, SgCarga.RowCount);
    Prtot_frete.Value := SgCarga.ColumnSum(6, 1, SgCarga.RowCount);
  }

end;

procedure TFr_montagem_carga.Prid_motoristaExit(Sender: TObject);
begin
  if trim(Prid_motorista.Text) = '' then
    Lbnom_motorista.Caption := '...';

  if Prid_motorista.Text <> '' then
  begin
    dao.Geral2('select nome from motorista where id=' +
      QuotedStr(Prid_motorista.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_motorista.Caption := dao.q2.FieldByName('nome').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prid_motorista.Text := '';
      Prid_motorista.SetFocus;
      exit;
    end;

  end;

end;

procedure TFr_montagem_carga.Prid_veiculoButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Veiculo';
  chamou_pesquisa := 'fr_veiculos';
  chamou_form := 'fr_monta_carga_veiculos';
  chamou_cadastro := 'fr_veiculos';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Veiculos';
  Fr_localizar.BT_cadastro.Visible := true;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 4);
  Campos_combo[0] := 'Código';
  Campos_combo[1] := 'Nome do veiculo';
  Campos_combo[2] := 'Placa';
  Campos_combo[3] := 'Data de aquisição';

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

procedure TFr_montagem_carga.Prid_veiculoKeyPress(Sender: TObject;
  var Key: Char);
var
  Campos_combo: array of string;
  i: integer;
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
    if (Prid_veiculo.Text = '') and (BtcriaCarga.Enabled = false) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Veiculos';
      chamou_pesquisa := 'fr_veiculos';
      chamou_form := 'fr_monta_carga_veiculos';
      chamou_cadastro := 'fr_veiculos';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Veiculos';
      Fr_localizar.BT_cadastro.Visible := true;

      // preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo, 4);
      Campos_combo[0] := 'Código';
      Campos_combo[1] := 'Nome do veiculo';
      Campos_combo[2] := 'Placa';
      Campos_combo[3] := 'Data de aquisição';

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

procedure TFr_montagem_carga.btcanClick(Sender: TObject);
begin
  BtcriaCarga.Enabled := true;
  Btimp_separacao_itens.Enabled := true;
  Btimp_form_carga.Enabled := true;

end;

procedure TFr_montagem_carga.Prid_veiculoExit(Sender: TObject);
begin
  if trim(Prid_veiculo.Text) = '' then
    Lbnom_veiculo.Caption := '...';

  if Prid_veiculo.Text <> '' then
  begin
    dao.Geral2('select nom_veiculo from veiculoS where id=' +
      QuotedStr(Prid_veiculo.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_veiculo.Caption := dao.q2.FieldByName('nom_veiculo').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prid_veiculo.Text := '';
      Prid_veiculo.SetFocus;
      exit;
    end;

  end;

end;

procedure TFr_montagem_carga.btlocClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  chamou_form_old, chamou_pesquisa_old: string;
begin
  sbFiltro.Enabled := false;
  Btgra.Enabled := false;
  btcan.Enabled := false;

  Application.CreateForm(TFr_localizar, Fr_localizar);

  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Cargas';
  chamou_pesquisa := 'fr_carga';
  chamou_form := 'fr_carga';
  chamou_cadastro := 'fr_carga';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'veiculos';
  Fr_localizar.BT_cadastro.Visible := false;

  SetLength(Campos_combo, 4);
  Campos_combo[0] := 'Nº Carga';
  Campos_combo[1] := 'Nome da Carga';
  Campos_combo[2] := 'Data Carga';
  Campos_combo[3] := 'Transportadora';

  for i := 0 to 3 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  if campo_pesquisado <> '' then
  begin
    Fr_localizar.CBcampos.ItemIndex := Fr_localizar.CBcampos.Items.IndexOf
      (campo_pesquisado);
    Fr_localizar.EDlocalizar.Text := dado_pesquisado;
    Fr_localizar.zzbusca_qualquer.Checked := busca_qualquer_posicao_pesquisada;
  end;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
  if q_carga1.Active = true then
  begin
    if q_carga1.FieldByName('carga_fechada').AsString = '1' then
      SBcarga.Panels[1].Text := 'CARGA FECHADA'
    else
    begin
      SBcarga.Panels[0].Text := 'CARGA EM ABERTO';
      sbFiltro.Enabled := true;
      Btgra.Enabled := true;
      btcan.Enabled := true;
    end;
    CarregarPedidos(false);
  end;
end;

procedure TFr_montagem_carga.CarregaDados;
begin
  ativa_carga1(Prid.Text);
  mostra_campos('Pr');
end;

procedure TFr_montagem_carga.ImprimirDamdfe(chave: string; entrada: boolean = false);
var
  arquivoMDFe, pathSaida, Protocolo: string;
begin
  arquivoMDFe := chave + '-procMDFe.xml';
  pathSaida := ExtractFilePath(Application.ExeName) + 'mdfe\';

  q_xml.close;
  q_xml.ParamByName('id').value := PrID.Text;
  q_xml.Open;

    if not q_xml.fieldbyname('XML').IsNull then
      TBlobField(q_xml.fieldbyname('XML')).SaveToFile(pathSaida + arquivoMDFe);

  ACBrMDFe1.Manifestos.Clear;
  ACBrMDFe1.Manifestos.LoadFromFile(pathSaida + arquivoMDFe);

  ACBrMDFe1.DAMDFE.Logo := ExtractFilePath(Application.ExeName) + nome_logo;
  ACBrMDFeDAMDFEFR1.fastfile := ExtractFilePath(Application.ExeName) + 'Relatorios\DAMDFe_Retrato.fr3';
  ACBrMDFe1.Manifestos.Imprimir;

  DeleteFile(pathSaida + arquivoMDFe);

end;


procedure TFr_montagem_carga.btnMDFEClick(Sender: TObject);
var
  EmissaoMDFe: TMDFet;
  cBuscarCeritifcado: _BuscarCertificado;
  valor_total: currency;
  x: integer;
  pathSaida: string;
begin
  pathSaida := ExtractFilePath(Application.ExeName) + 'mdfe\';

  Prcod_empresa.ReadOnly := false;
  if trim(PrMDFe.Text) = '' then
  begin
    for x := 1 to 2 do
    begin
      dao.Geral4('select CASE WHEN MAX(Nota) IS NULL THEN 1 ELSE MAX(Nota)+1 END AS MDFE from ' + ' ( SELECT MDFE as  nota FROM CARGA1 WHERE EMPRESA_FATURAR = ' + Prcod_empresa.Text + ') q1 ');

      if dao.q4.fieldbyname('MDFe').IsNull then
        PrMDFe.Text := '1'
      else
        PrMDFe.Text := dao.q4.fieldbyname('MDFe').AsString;
    end;

    try
      if not (dao.cn.InTransaction) then
        (dao.cn.StartTransaction);
      dao.Execsql('update carga1 set mdfe=' + QuotedStr(PrMDFe.Text) + ' where id=' + QuotedStr(Prid.Text));
      dao.cn.Commit;
      Prcod_empresa.ReadOnly := true;
    except
      dao.cn.Rollback;
    end;

  end;


  EmissaoMDFe := TMDFet.Create(cBuscarCeritifcado);
  Application.CreateForm(TFr_nfe_transmissao, Fr_nfe_transmissao);

  Fr_nfe_transmissao.sCheckBox1.Visible := true;
  Fr_nfe_transmissao.sCheckBox1.Caption := 'Buscar Certificado.';

  Fr_nfe_transmissao.sCheckBox2.Visible := true;
  Fr_nfe_transmissao.sCheckBox2.Caption := 'Gerar Arquivo MDFe.';

  Fr_nfe_transmissao.sCheckBox3.Visible := true;
  Fr_nfe_transmissao.sCheckBox3.Caption := 'Assinar Arquivo MDFe.';

  Fr_nfe_transmissao.sCheckBox4.Visible := true;
  Fr_nfe_transmissao.sCheckBox4.Caption := 'Validar Arquivo MDFe.';

  Fr_nfe_transmissao.sCheckBox5.Visible := true;
  Fr_nfe_transmissao.sCheckBox5.Caption := 'Gravando Chave MDFe.';

  Fr_nfe_transmissao.sCheckBox6.Visible := true;
  Fr_nfe_transmissao.sCheckBox6.Caption := 'Enviando Lote';

  Fr_nfe_transmissao.sCheckBox7.Visible := true;
  Fr_nfe_transmissao.sCheckBox7.Caption := 'Grava Recibo Lote';

  Fr_nfe_transmissao.Gauge1.MaxValue := 7;
  Fr_nfe_transmissao.Height := Fr_nfe_transmissao.Height + (11 * 10);
  Fr_nfe_transmissao.Gauge1.Progress := 0;

  /// Fr_nfe_transmissao.BtnOK.Enabled := true;
  FRPRI.Habilita_Consultas := false;
  Fr_nfe_transmissao.ShowModal;
  if Fr_nfe_transmissao.modalresult = mrOk then
  begin
    FRPRI.Habilita_Consultas := true;
    CarregaDados;


    if PrStatus_MDFE.Text = '539' then
    begin
      DeleteFile(pathSaida + PrChave_MDFe.Text + '.xml');
      PrChave_MDFe.Text := copy(PrMotivo_MDFE.Text, Pos('chMDFe:', PrMotivo_MDFE.Text) + 6, 44);
      if not dao.cn.InTransaction then
        dao.cn.StartTransaction;
      dao.Execsql('update carga1 set chave_mdfe = ' + QuotedStr(PrChave_MDFe.Text) + ' where id = ' + PrId.Text);
      dao.cn.Commit;

    end
    else if PrStatus_MDFE.Text = '100' then
    begin
      // EnviarEmailNfe := true;
      ImprimirDamdfe(PrChave_MDFe.Text);

    end;
  end;
  LiberaItemRepetido := false;
end;


procedure TFr_montagem_carga.Carrega_SgCarga;
begin
end;

procedure TFr_montagem_carga.mostra_campos(prefixo: ShortString);
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
          q_carga1.FieldByName(campo1).AsString;
      end
      { else
        if Components[i] is TRichEdit then
        begin
        campo:= TRichEdit(Components[i]).Name;
        campo1:=copy(Components[i].Name, 3, Length(Components[i].Name) -1);
        TRichEdit(FindComponent(campo)).Text := q_entrada1.fieldbyname(campo1).AsString;
        end }
      else if Components[i] is TsComboEdit then
      begin
        campo := TsComboEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := Copy(campo, 3, 50);
        TsComboEdit(FindComponent(campo)).Text :=
          q_carga1.FieldByName(campo1).AsString;
      end
      else if Components[i] is TsCurrencyEdit then
      begin
        campo := TsCurrencyEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := Copy(campo, 3, 50);
        TsCurrencyEdit(FindComponent(campo)).Value :=
          q_carga1.FieldByName(campo1).AsFloat;
      end
      { else
        if Components[i] is TComboBox then
        begin
        campo:= TComboBox(Components[i]).Name;
        campo1:= campo;
        campo1:=copy(campo,3,50);

        TComboBox(FindComponent(campo)).ItemIndex := q_entrada1.fieldbyname(campo1).AsInteger;
        end
        else
        if Components[i] is tsCheckbox then
        begin
        campo:= tsCheckbox(Components[i]).Name;
        campo1:= campo;
        campo1:=copy(campo,3,50);
        if q_entrada1.fieldbyname(campo1).AsString ='S' then
        tsCheckbox(FindComponent(campo)).Checked := true
        else
        tsCheckbox(FindComponent(campo)).Checked := false;
        end }
      else if Components[i] is TsDateEdit then
      begin
        campo := TsDateEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := Copy(campo, 3, 50);

        TsDateEdit(FindComponent(campo)).Date := q_carga1.FieldByName(campo1)
          .AsDateTime;
      end;

    end;

  end; // end do for
  Lbnom_veiculo.Caption := q_carga1.FieldByName('nom_veiculo').AsString;
  Lbnom_motorista.Caption := q_carga1.FieldByName('nom_motorista').AsString;
  LbNom_transportadora.Caption := q_carga1.FieldByName('nome').AsString;

  Screen.Cursor := crDefault;

end;

procedure TFr_montagem_carga.carrega_sgx_carga2;
begin
end;

procedure TFr_montagem_carga.MontaFormularioCarga;
begin
  with dm.q_carga do
  begin
    close;
    sql.Clear;
    sql.Add('select v1.nfe, v1.numdoc, v1.DTA_EMISSAO as dtadoc, v1.volume_nota, cl.nom_cliente, v1.tot_liquido, c1.id, c1.dta_carga, c1.nom_carga, c1.tot_peso, c1.tot_carga, c1.tot_frete, v.nom_veiculo, m.nome as nom_motorista, t.nome as nom_transportadora '
      + 'from carga1 c1 ' + 'left join vendas1 v1 on cast(v1.cod_carga as integer) = c1.id ' +
      'left join cliente cl on cl.cod_cliente=v1.cod_cliente ' +
      'left join veiculos v on v.id=c1.id_veiculo ' +
      'left join motorista m on m.id=c1.id_motorista ' +
      'left join transportadora t on t.cod_transportadora=c1.cod_transportadora '
      + 'where c1.id=' + QuotedStr(Prid.Text) + ' order by nom_cliente ');
    open;
  end;

  if not(fr_relatorio.LoadFromFile(path + 'Relatorios\formulario_carga.fr3'))
  then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 +
      'Avise o Suporte');
    exit;
  end;
  fr_relatorio.ShowReport();
end;

procedure TFr_montagem_carga.Btimp_form_cargaClick(Sender: TObject);
begin
  if Prid.Text = '' then
  begin
    dao.msg('Localize uma carga antes de Imprimir o Formulário de Carga!');
    exit;
  end;

  MontaFormularioCarga;
end;

procedure TFr_montagem_carga.FecharCarga1Click(Sender: TObject);
var
  pedidos: array of string;
  i: integer;
  num_pedidos: string;
  nr_ped: integer;

begin
end;

procedure TFr_montagem_carga.Btimp_separacao_itensClick(Sender: TObject);
var
  cmd_where: string;
begin
  if Prid.Text = '' then
  begin
    dao.msg('Localize uma carga antes de Imprimir a Separação de Carga!');
    exit;
  end;

  mmCarga2.First;
  cmd_where := cmd_where + ' numdoc in (';
  mmCarga2.Next;
  while not(mmCarga2.Eof) do
  begin
    cmd_where := cmd_where + QuotedStr(mmCarga2Pedido.AsString)+ ',';
    mmCarga2.Next;
  end;

  cmd_where := Copy(cmd_where, 1, Length(cmd_where)-1)+')';

  with dm.q_separacao_carga do
  begin
    close;
    sql.Clear;
    sql.Add('select p.cod_produto, p.nom_produto, p.cod_prateleira, sum(v2.qtd) as soma from vendas2 v2 '
      + 'inner join produto p on p.cod_produto=v2.cod_produto ' + 'where ' +
      cmd_where + ' group by p.cod_produto, p.nom_produto, p.cod_prateleira');
    open;
  end;

  if not(fr_relatorio.LoadFromFile(path + 'Relatorios\separacao_carga.fr3'))
  then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 +
      'Avise o Suporte');
    exit;
  end;

  fr_relatorio.ShowReport;

end;

procedure TFr_montagem_carga.fr_relatorioGetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'empresa' then
    Value := nom_empresa;

  if VarName = 'titulo' then
    Value := 'Relação de Produtos da Carga Nº ' + Prid.Text;

  if VarName = 'numero_carga' then
    Value := Prid.Text;

end;

procedure TFr_montagem_carga.faturar_pedidos_carga;
var
  pedidos: array of string;
  campos_pendente: string;
  i: integer;
  ped: string;
  sair: integer;
begin
end;

procedure TFr_montagem_carga.faturar(nr_documento: string;
  dta_documento: TDateTime; cod_cliente, id_vendedor, cod_fop,
  cod_prazo: string; valor_total: real; nr_carga: string);
begin
end;

procedure TFr_montagem_carga.imprime_lote(cmd_where: string);
begin
end;

procedure TFr_montagem_carga.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;


procedure TFr_montagem_carga.CarregarRepresentantes;
begin
  dao.Geral1('SELECT a.ID, a.NOM_REPRESENTANTE FROM REPRESENTANTE a ' +
    'where ativo = ''S'' and funcionario in (''0'', ''1'') order by a.NOM_REPRESENTANTE ');
  dao.Q1.First;
  mmRep.open;
  mmRep.EmptyTable;
  while not dao.Q1.Eof do
  begin
    mmRep.Append;
    mmRepID.AsString := dao.Q1.FieldByName('ID').AsString;
    mmRepNome.AsString := dao.Q1.FieldByName('NOM_REPRESENTANTE').AsString;
    mmRep.Post;
    dao.Q1.Next;
  end;
  mmRep.First;
end;

procedure TFr_montagem_carga.dgRepDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
const
  IsChecked: array [boolean] of integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or
    DFCS_CHECKED);
var
  DrawState: integer;
  DrawRect: TRect;
begin
  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = CheckRep.DataField) then

    begin
      CheckRep.Left := Rect.Left + dgRep.Left + 2;
      CheckRep.Top := Rect.Top + dgRep.Top + 2;
      CheckRep.Width := Rect.Right - Rect.Left;
      CheckRep.Height := Rect.Bottom - Rect.Top;

      CheckRep.Visible := true;
    end
  end
  else
  begin
    if (Column.Field.FieldName = CheckRep.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := IsChecked[Column.Field.AsBoolean];

      dgRep.Canvas.FillRect(Rect);
      DrawFrameControl(dgRep.Canvas.Handle, DrawRect, DFC_BUTTON, DrawState);
    end;
  end;
end;

procedure TFr_montagem_carga.dgEstadoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
const
  IsChecked: array [boolean] of integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or
    DFCS_CHECKED);
var
  DrawState: integer;
  DrawRect: TRect;
begin
  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = CheckUF.DataField) then

    begin
      CheckUF.Left := Rect.Left + dgRep.Left + 2;
      CheckUF.Top := Rect.Top + dgRep.Top + 2;
      CheckUF.Width := Rect.Right - Rect.Left;
      CheckUF.Height := Rect.Bottom - Rect.Top;
      CheckUF.Visible := true;
    end
  end
  else
  begin
    if (Column.Field.FieldName = CheckUF.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := IsChecked[Column.Field.AsBoolean];

      dgEstado.Canvas.FillRect(Rect);
      DrawFrameControl(dgEstado.Canvas.Handle, DrawRect, DFC_BUTTON, DrawState);
    end;
  end;

end;

procedure TFr_montagem_carga.dgMesoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
const
  IsChecked: array [boolean] of integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or
    DFCS_CHECKED);
var
  DrawState: integer;
  DrawRect: TRect;
begin
  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = CheckMeso.DataField) then

    begin
      CheckMeso.Left := Rect.Left + dgRep.Left + 2;
      CheckMeso.Top := Rect.Top + dgRep.Top + 2;
      CheckMeso.Width := Rect.Right - Rect.Left;
      CheckMeso.Height := Rect.Bottom - Rect.Top;
      CheckMeso.Visible := true;
    end
  end
  else
  begin
    if (Column.Field.FieldName = CheckMeso.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := IsChecked[Column.Field.AsBoolean];

      dgMeso.Canvas.FillRect(Rect);
      DrawFrameControl(dgMeso.Canvas.Handle, DrawRect, DFC_BUTTON, DrawState);
    end;
  end;

end;

procedure TFr_montagem_carga.dgMicroDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
const
  IsChecked: array [boolean] of integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or
    DFCS_CHECKED);
var
  DrawState: integer;
  DrawRect: TRect;
begin
  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = CheckMicro.DataField) then

    begin
      CheckMicro.Left := Rect.Left + dgRep.Left + 2;
      CheckMicro.Top := Rect.Top + dgRep.Top + 2;
      CheckMicro.Width := Rect.Right - Rect.Left;
      CheckMicro.Height := Rect.Bottom - Rect.Top;
      CheckMicro.Visible := true;
    end
  end
  else
  begin
    if (Column.Field.FieldName = CheckMicro.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := IsChecked[Column.Field.AsBoolean];

      dgMicro.Canvas.FillRect(Rect);
      DrawFrameControl(dgMicro.Canvas.Handle, DrawRect, DFC_BUTTON, DrawState);
    end;
  end;

end;

procedure TFr_montagem_carga.dgCidadeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
const
  IsChecked: array [boolean] of integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or
    DFCS_CHECKED);
var
  DrawState: integer;
  DrawRect: TRect;
begin
  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = CheckCidades.DataField) then

    begin
      CheckCidades.Left := Rect.Left + dgRep.Left + 2;
      CheckCidades.Top := Rect.Top + dgRep.Top + 2;
      CheckCidades.Width := Rect.Right - Rect.Left;
      CheckCidades.Height := Rect.Bottom - Rect.Top;
      CheckCidades.Visible := true;
    end
  end
  else
  begin
    if (Column.Field.FieldName = CheckCidades.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := IsChecked[Column.Field.AsBoolean];

      dgCidade.Canvas.FillRect(Rect);
      DrawFrameControl(dgCidade.Canvas.Handle, DrawRect, DFC_BUTTON, DrawState);
    end;
  end;
end;

procedure TFr_montagem_carga.CarregarUF;
begin
  dao.Geral1
    ('SELECT a.UF, CASE A.UF WHEN ''SC'' THEN 0 WHEN ''PR'' THEN 1 WHEN ''RS'' THEN 2 ELSE 3 END AS ORD FROM UF a ORDER BY ORD, UF');
  dao.Q1.First;
  mmUF.open;
  mmUF.EmptyTable;
  while not dao.Q1.Eof do
  begin
    mmUF.Append;
    mmUFUF.AsString := dao.Q1.FieldByName('UF').AsString;
    mmUF.Post;
    dao.Q1.Next;
  end;
  mmUF.First;
end;

procedure TFr_montagem_carga.dgRepKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(9)) then
    exit;

  if (dgRep.SelectedField.FieldName = CheckRep.DataField) then
  begin
    CheckRep.SetFocus;
    SendMessage(CheckRep.Handle, WM_Char, word(Key), 0);
  end;
end;

procedure TFr_montagem_carga.dgEstadoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(9)) then
    exit;

  if (dgEstado.SelectedField.FieldName = CheckUF.DataField) then
  begin
    CheckUF.SetFocus;
    SendMessage(CheckUF.Handle, WM_Char, word(Key), 0);
  end;

end;

procedure TFr_montagem_carga.dgMesoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(9)) then
    exit;

  if (dgMeso.SelectedField.FieldName = CheckMeso.DataField) then
  begin
    CheckMeso.SetFocus;
    SendMessage(CheckMeso.Handle, WM_Char, word(Key), 0);
  end;

end;

procedure TFr_montagem_carga.dgCidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(9)) then
    exit;

  if (dgCidade.SelectedField.FieldName = CheckCidades.DataField) then
  begin
    CheckCidades.SetFocus;
    SendMessage(CheckCidades.Handle, WM_Char, word(Key), 0);
  end;
end;

procedure TFr_montagem_carga.dgRepDblClick(Sender: TObject);
begin
  mmRep.Edit;
  if mmRepCheck.Value = true then
    mmRepCheck.Value := false
  else
    mmRepCheck.Value := true;
  mmRep.Post;

  mmRep.First;

  lista_repr := '';

  while not mmRep.Eof do
  begin
    if mmRepCheck.Value then
      lista_repr := lista_repr + mmRepID.AsString + ',';
    mmRep.Next;
  end;
  mmRep.First;

  lista_repr := Copy(lista_repr, 1, Length(lista_repr) - 1);

end;

procedure TFr_montagem_carga.dgEstadoDblClick(Sender: TObject);
begin
  mmUF.Edit;
  if mmUFCheck.Value = true then
    mmUFCheck.Value := false
  else
    mmUFCheck.Value := true;
  mmUF.Post;

  mmUF.First;

  lista_uf := '';

  while not mmUF.Eof do
  begin
    if mmUFCheck.Value then
      lista_uf := lista_uf + QuotedStr(mmUFUF.AsString) + ',';
    mmUF.Next;
  end;
  mmUF.First;

  lista_uf := Copy(lista_uf, 1, Length(lista_uf) - 1);

  if lista_uf <> '' then
    CarregarMeso(lista_uf);
end;

procedure TFr_montagem_carga.CarregarMeso(UF: string);
begin
  dao.Geral1('SELECT a.MESOCOD, a.MESONOME, a.UFCOD FROM CADMESO a WHERE a.UFCOD IN (' +  UF + ')');
  dao.Q1.First;
  mmMeso.open;
  mmMeso.EmptyTable;
  while not dao.Q1.Eof do
  begin
    mmMeso.Append;
    mmMesoID.AsString := dao.Q1.FieldByName('MESOCOD').AsString;
    mmMesoNome.AsString := dao.Q1.FieldByName('MESONOME').AsString;
    mmMeso.Post;
    dao.Q1.Next;
  end;
  mmMeso.First;
end;

procedure TFr_montagem_carga.dgMesoDblClick(Sender: TObject);
begin
  mmMeso.Edit;
  if mmMesoCheck.Value = true then
    mmMesoCheck.Value := false
  else
    mmMesoCheck.Value := true;
  mmMeso.Post;

  mmMeso.First;

  lista_meso := '';

  while not mmMeso.Eof do
  begin
    if mmMesoCheck.Value then
      lista_meso := lista_meso + QuotedStr(mmMesoID.AsString) + ',';
    mmMeso.Next;
  end;
  mmMeso.First;

  lista_meso := Copy(lista_meso, 1, Length(lista_meso) - 1);

  if lista_meso <> '' then
    CarregarMicro(lista_meso);
end;

procedure TFr_montagem_carga.CarregarMicro(Meso: string);
begin
  dao.Geral1
    ('SELECT a.MICROCOD, a.MICRONOME, a.MESOCOD FROM CADMICRO a WHERE a.MESOCOD IN (' + Meso + ')');
  dao.Q1.First;
  mmMicro.open;
  mmMicro.EmptyTable;
  while not dao.Q1.Eof do
  begin
    mmMicro.Append;
    mmMicroID.AsString := dao.Q1.FieldByName('MICROCOD').AsString;
    mmMicroNome.AsString := dao.Q1.FieldByName('MICRONOME').AsString;
    mmMicro.Post;
    dao.Q1.Next;
  end;
  mmMicro.First;
end;

procedure TFr_montagem_carga.dgMicroDblClick(Sender: TObject);
begin
  mmMicro.Edit;
  if mmMicroCheck.Value = true then
    mmMicroCheck.Value := false
  else
    mmMicroCheck.Value := true;
  mmMicro.Post;

  mmMicro.First;

  lista_micro := '';

  while not mmMicro.Eof do
  begin
    if mmMicroCheck.Value then
      lista_micro := lista_micro + QuotedStr(mmMicroID.AsString) + ',';
    mmMicro.Next;
  end;
  mmMicro.First;

  lista_micro := Copy(lista_micro, 1, Length(lista_micro) - 1);

  if lista_micro <> '' then
    CarregarCidades(lista_micro);

end;

procedure TFr_montagem_carga.CarregarCidades(Micro: string);
begin
  dao.Geral1('SELECT a.COD_CIDADE, a.NOM_CIDADE, a.MICROCOD FROM CIDADES a WHERE a.MICROCOD IN (' + Micro + ')');
  dao.Q1.First;
  mmCidades.open;
  mmCidades.EmptyTable;
  while not dao.Q1.Eof do
  begin
    mmCidades.Append;
    mmCidadesID.AsString := dao.Q1.FieldByName('COD_CIDADE').AsString;
    mmCidadesNome.AsString := dao.Q1.FieldByName('NOM_CIDADE').AsString;
    mmCidades.Post;
    dao.Q1.Next;
  end;
  mmCidades.First;
end;

procedure TFr_montagem_carga.dgCidadeDblClick(Sender: TObject);
begin
  mmCidades.Edit;
  if mmCidadesCheck.Value = true then
    mmCidadesCheck.Value := false
  else
    mmCidadesCheck.Value := true;
  mmCidades.Post;

  mmCidades.First;

  lista_cidades := '';

  while not mmCidades.Eof do
  begin
    if mmCidadesCheck.Value then
      lista_cidades := lista_cidades + QuotedStr(mmCidadesID.AsString) + ',';
    mmCidades.Next;
  end;
  mmCidades.First;

  lista_cidades := Copy(lista_cidades, 1, Length(lista_cidades) - 1);
end;

procedure TFr_montagem_carga.sbFiltroClick(Sender: TObject);
begin
  CarregarPedidos(true);
end;

procedure TFr_montagem_carga.CarregarPedidos(filtro: boolean);
var
  cmd: string;
  peso, frete, carga: double;
begin
  cmd := 'SELECT distinct a.NUMDOC, a.nfe, a.DTADOC, a.VL_FRETE, A.DTA_EMISSAO, c.NOM_CLIENTE, a.TOT_BRUTO, a.TOT_LIQUIDO, a.PESO_NOTA, '
    + 'a.COD_FOP||''-''||f.NOM_FOP as fop, a.COD_REPRESENTANTE||''-''||r.NOM_REPRESENTANTE as representante, p.PRAZO, a.NR_PEDIDO_PALM, a.PALM_NR_CONEXAO, A.OBSERVACOES_PEDIDO, A.COD_CARGA '
    + 'FROM VENDAS1 a ' +
    'inner join vendas2 v2 on (v2.numdoc = a.numdoc) ' +
    'inner join produto pr on (pr.COD_PRODUTO = v2.COD_PRODUTO)  ' +
    'inner join cliente c on c.cod_cliente=a.cod_cliente  ' +
    'inner join cidades cd on (c.cod_cidade = cd.cod_cidade) ' +
    'inner join cadmicro mc on (mc.microcod = cd.microcod) ' +
    'inner join cadmeso ms on (ms.mesocod = mc.mesocod) ' +
    'inner join REPRESENTANTE r on r.ID = a.COD_REPRESENTANTE ' +
    'inner join prazo p on (p.ID = a.COD_PRAZO_PGTO) ' +
    'inner join fop f on (f.COD_FOP = a.COD_FOP) ' +
    'where a.FATURADO IN (1,3)';

  if lista_repr <> '' then
    cmd := cmd + ' and a.cod_representante in (' + lista_repr + ') ';

  if lista_uf <> '' then
    cmd := cmd + ' and cd.uf in (' + lista_uf + ') ';

  if lista_meso <> '' then
    cmd := cmd + ' and ms.mesocod in (' + lista_meso + ') ';

  if lista_micro <> '' then
    cmd := cmd + ' and mc.microcod in (' + lista_micro + ') ';

  if lista_cidades <> '' then
    cmd := cmd + ' and cd.cod_cidade in (' + lista_cidades + ') ';

  if ftDtIni.Date > 0 then
    cmd := cmd + ' and a.DTA_EMISSAO >= ' +
      QuotedStr(formatdatetime('dd/mm/yyyy', ftDtIni.Date));

  if ftDtFim.Date > 0 then
    cmd := cmd + ' and a.DTA_EMISSAO <= ' +
      QuotedStr(formatdatetime('dd/mm/yyyy', ftDtFim.Date));

  if not filtro then
    cmd := cmd + ' and a.cod_carga in (''' + Prid.Text + ''')'
  else if trim(Prid.Text) <> '' then
    cmd := cmd + ' or a.cod_carga in (''' + Prid.Text + ''')';

  if edPedido.Text <> '' then
    cmd := cmd + fmfun.cmdAux('a.numdoc', edPedido.Text);

  dao.Geral1(cmd);
  peso := 0;
  frete := 0;
  carga := 0;
  mmCarga2.open;
  mmCarga2.EmptyTable;
  while not dao.Q1.Eof do
  begin
    mmCarga2.Append;
    mmCarga2Pedido.AsString := dao.Q1.FieldByName('NUMDOC').AsString;
    mmCarga2NFE.AsString := dao.Q1.FieldByName('NFE').AsString;
    mmCarga2CLIENTE.AsString := dao.Q1.FieldByName('NOM_CLIENTE').AsString;
    mmCarga2DATA.AsDateTime := dao.Q1.FieldByName('DTA_EMISSAO').AsDateTime;
    mmCarga2VALOR.Value := dao.Q1.FieldByName('TOT_LIQUIDO').Value;
    mmCarga2PESO.Value := dao.Q1.FieldByName('PESO_NOTA').Value;
    peso := mmCarga2PESO.Value + peso;
    frete := frete + dao.Q1.FieldByName('VL_FRETE').Value;
    carga := carga + mmCarga2VALOR.Value;
    if (trim(Prid.Text) <> '') and
      (dao.Q1.FieldByName('COD_CARGA').AsString = Prid.Text) then
      mmCarga2Check.Value := true
    else
      mmCarga2Check.Value := false;

    mmCarga2.Post;
    dao.Q1.Next;
  end;
  mmCarga2.First;
  Prtot_peso.Value := peso;
  Prtot_frete.Value := frete;
  Prtot_carga.Value := carga;

  Btimp_separacao_itens.Enabled := not mmCarga2.IsEmpty;
  Btimp_form_carga.Enabled := not mmCarga2.IsEmpty;
end;

procedure TFr_montagem_carga.dgCargaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
const
  IsChecked: array [boolean] of integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or
    DFCS_CHECKED);
var
  DrawState: integer;
  DrawRect: TRect;
begin
  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = CheckPedido.DataField) then

    begin
      CheckPedido.Left := Rect.Left + dgRep.Left + 2;
      CheckPedido.Top := Rect.Top + dgRep.Top + 2;
      CheckPedido.Width := Rect.Right - Rect.Left;
      CheckPedido.Height := Rect.Bottom - Rect.Top;
      CheckPedido.Visible := true;
    end
  end
  else
  begin
    if (Column.Field.FieldName = CheckPedido.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := IsChecked[Column.Field.AsBoolean];

      dgCarga.Canvas.FillRect(Rect);
      DrawFrameControl(dgCarga.Canvas.Handle, DrawRect, DFC_BUTTON, DrawState);
    end;
  end;

end;

procedure TFr_montagem_carga.dgCargaDblClick(Sender: TObject);
begin
  mmCarga2.Edit;
  if mmCarga2Check.Value = true then
    mmCarga2Check.Value := false
  else
    mmCarga2Check.Value := true;
  mmCarga2.Post;
end;

procedure TFr_montagem_carga.CarregarPedidosMDFe;
var
  cmd: string;
begin
  cmd := 'select distinct vd.numdoc, vd.chave_nfe, cd.cod_ibge, cd.nom_cidade, cd.uf '+
         'from vendas1 vd '+
         'inner join cliente cl on vd.cod_cliente = cl.cod_cliente '+
         'inner join cidades cd on cd.cod_cidade = cl.cod_cidade '+
         'where vd.faturado in (1,3) '+
         '  and vd.chave_nfe is not null '+
         '  and vd.cod_carga in (''' + Prid.Text + ''') '+
         'order by cd.cod_ibge desc limit 1 ';

  dao.Geral1(cmd);
end;


procedure TMDFet.monta_MDFe;
var
  Manifesto1: Manifesto;
  MDFe: TMDFe;
  ConfiguracoesMDFe: TConfiguracoesMDFe;
  EnderEmit: TenderEmit;
  InfMunCarrega: TinfMunCarregaCollectionItem;
  infMunDescarga: TinfMunDescargaCollectionItem;
  infNFe: TinfNFeCollectionItem;
  vCodIBGE: Integer;
begin
  ConfiguracoesMDFe := Fr_montagem_carga.ACBrMDFe1.Configuracoes;
  ConfiguracoesMDFe.WebServices.Ambiente := FMFUN.BuscaAmbienteNFE;
  ConfiguracoesMDFe.Geral.FormaEmissao := teNormal;

  Manifesto1 := Fr_montagem_carga.ACBrMDFe1.Manifestos.Add;
  MDFe := Manifesto1.MDFe;

  // Ide
  MDFe.ide.cUF      := ConfiguracoesMDFe.WebServices.UFCodigo;
  MDFe.ide.tpAmb    := FMFUN.BuscaAmbienteNFE;
  MDFe.ide.tpEmit   := teTransportadora;
  MDFe.ide.serie    := 1;
  MDFe.ide.nMDF     := 123;  // Substituir por número gerado automaticamente
  MDFe.ide.dhEmi    := Now;
  MDFe.ide.tpEmis   := teNormal;
  MDFe.ide.procEmi  := peAplicativoContribuinte;
  MDFe.ide.verProc  := '1.0.0';

  // Busca dados do emitente
  dao.Geral5(
    'SELECT a.CNPJ, a.NOM_EMPRESA, a.NOM_FANTASIA, a.ENDERECO, a.NR_ENDERECO, ' +
    'a.COMPLEMENTO, a.BAIRRO, c.COD_IBGE, c.NOM_CIDADE, c.UF, a.CEP, a.FONE, a.IE ' +
    'FROM EMPRESA a ' +
    'INNER JOIN CIDADES c ON c.COD_CIDADE = a.COD_CIDADE ' +
    'WHERE a.COD_EMPRESA = ' + QuotedStr(Fr_montagem_carga.Prcod_empresa.Text)
  );

  if dao.q5.RecordCount > 0 then
  begin
    // Emitente
    MDFe.emit.CNPJCPF := dao.q5.FieldByName('CNPJ').AsString;
    MDFe.emit.IE      := dao.q5.FieldByName('IE').AsString;
    MDFe.emit.xNome   := dao.q5.FieldByName('NOM_EMPRESA').AsString;
    MDFe.emit.xFant   := dao.q5.FieldByName('NOM_FANTASIA').AsString;

    EnderEmit := MDFe.emit.enderEmit;
    EnderEmit.xLgr := dao.q5.FieldByName('ENDERECO').AsString;
    EnderEmit.nro  := dao.q5.FieldByName('NR_ENDERECO').AsString;
    EnderEmit.xCpl := dao.q5.FieldByName('COMPLEMENTO').AsString;
    EnderEmit.xBairro := dao.q5.FieldByName('BAIRRO').AsString;
    EnderEmit.cMun := dao.q5.FieldByName('COD_IBGE').AsInteger;
    EnderEmit.xMun := dao.q5.FieldByName('NOM_CIDADE').AsString;
    EnderEmit.UF   := dao.q5.FieldByName('UF').AsString;
    EnderEmit.CEP  := StrToIntDef(dao.q5.FieldByName('CEP').AsString, 0);
    EnderEmit.fone := dao.q5.FieldByName('FONE').AsString;
  end;

  // Modal Rodoviário
  //MDFe.rodo.RNTRC := '12345678'; // Substituir por valor real

  // Município de Carregamento
  InfMunCarrega := MDFe.ide.infMunCarrega.Add;
  InfMunCarrega.cMunCarrega := EnderEmit.cMun;
  InfMunCarrega.xMunCarrega := EnderEmit.xMun;

  // Documento Fiscal Vinculado (NFe)
  vCodIBGE := 0;
  MDFe.tot.qNFe := 0;

  Fr_montagem_carga.CarregarPedidosMDFe;
  dao.Q1.First;

  while not dao.Q1.Eof do
  begin
    if (vCodIBGE <> dao.Q1.FieldByName('cod_ibge').AsInteger) then
    begin
      vCodIBGE := dao.Q1.FieldByName('cod_ibge').AsInteger;
      infMunDescarga := MDFe.infDoc.infMunDescarga.Add;
      infMunDescarga.cMunDescarga := vCodIBGE;
      infMunDescarga.xMunDescarga := dao.Q1.FieldByName('nom_cidade').AsString;
    end;

    if Assigned(infMunDescarga) then
    begin
      infNFe := infMunDescarga.infNFe.Add;
      infNFe.chNFe := dao.Q1.FieldByName('chave_nfe').AsString;
      MDFe.tot.qNFe := MDFe.tot.qNFe + 1;
    end;

    dao.Q1.Next;
  end;

  // Totais
  MDFe.tot.qCTe := 0;
  // MDFe.tot.qNFe já acumulado no loop
  MDFe.tot.qMDFe := 0;
  MDFe.tot.vCarga := Fr_montagem_carga.Prtot_frete.Value;
  MDFe.tot.cUnid := uKG;
  MDFe.tot.qCarga := Fr_montagem_carga.Prtot_peso.Value;
end;

constructor TMDFet.Create;
begin
  inherited Create(true);
  { Chama o contrutor herdado. Ele irá temporariamente colocar o thread em estado de espera para depois executá-lo. }
  FreeOnTerminate := true; // Libera o objeto após terminar.
  Priority := TpLower;
  { Configura sua prioridade na lista de processos do Sistema operacional. }
  Resume; // Inicia o Thread.
end;

end.
