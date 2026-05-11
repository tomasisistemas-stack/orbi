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
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, ACBrMDFe.Classes,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TMDFet = class(TThread)
  private
    procedure PreencherConfiguracoes;
    procedure PreencherIde(MDFe: TMDFe);
    procedure PreencherEmitente(MDFe: TMDFe);
    procedure PreencherCarregamento(MDFe: TMDFe);
    procedure PreencherDocumentos(MDFe: TMDFe);
    procedure PreencherModalRodoviario(MDFe: TMDFe);
    procedure PreencherSeguroCarga(MDFe: TMDFe);
    procedure FinalizarMDFe;
    procedure CancelarMDFe(const ANumProtocolo, AChave, AJustificativa: string);
    procedure ImprimirDAMDFE;
    function GetPlaca(pID: string): string;
  protected
    procedure Execute; override;
  public
    constructor Create;
    procedure monta_MDFe;
  end;


  TFr_montagem_carga = class(TForm)
    GroupBox2: TsGroupBox;
    GroupBox3: TsGroupBox;
    Label5: tsLabel;
    Label6: tsLabel;
    SBcarga: TStatusBar;
    q_carga1: TFDQuery;
    Q_carga2: TFDQuery;
    Prtot_peso: TsCurrencyEdit;
    Prtot_carga: TsCurrencyEdit;
    Label10: tsLabel;
    Prtot_frete: TsCurrencyEdit;
    Lbperc_frete: tsLabel;
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
    dgCargaOutros: Tdbgrid;
    CheckEntregue: TDBCheckBox;
    CheckOutros: TDBCheckBox;
    mmCarga2: TRxMemoryData;
    mmCarga2Check: TBooleanField;
    dsCarga2: TDataSource;
    mmCarga2Pedido: TIntegerField;
    mmCarga2DATA: TDateField;
    mmCarga2VALOR: TCurrencyField;
    mmCarga2PESO: TFloatField;
    mmCarga2ENTREGUE: TBooleanField;
    mmRepID: TIntegerField;
    mmMesoID: TIntegerField;
    mmMicroID: TIntegerField;
    mmCidadesID: TIntegerField;
    CheckPedido: TDBCheckBox;
    mmCarga2CLIENTE: TStringField;
    mmCarga2NFE: TStringField;
    mmCargaOutros: TRxMemoryData;
    dsCargaOutros: TDataSource;
    mmCargaOutrosPedido: TIntegerField;
    mmCargaOutrosNFE: TStringField;
    mmCargaOutrosCLIENTE: TStringField;
    mmCargaOutrosDATA: TDateField;
    mmCargaOutrosVALOR: TCurrencyField;
    mmCargaOutrosCOD_CARGA: TStringField;
    mmCargaOutrosNOM_CARGA: TStringField;
    mmCargaOutrosCheck: TBooleanField;
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
    ACBrMDFe1: TACBrMDFe;
    ACBrMDFeDAMDFEFR1: TACBrMDFeDAMDFEFR;
    edPedido: TsEdit;
    sLabel1: TsLabel;
    Label8: TsLabel;
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
    btEncerramentoMDFe: TsBitBtn;
    BtnDaMDFe: TsBitBtn;
    sGroupBox13: TsGroupBox;
    PrDIGEST_MDFE: TsEdit;
    q_xml: TFDQuery;
    mmCarga2VALOR_FRETE: TCurrencyField;
    gbSeguro: TGroupBox;
    PrResponsavelSeguro: TsRadioGroup;
    PrCNPJSeguradora: TsMaskEdit;
    Label4: TLabel;
    Label11: TLabel;
    PrNomeSeguradora: TsEdit;
    PrCNPJResponsavel: TsMaskEdit;
    Label12: TLabel;
    PrApoliceSeguro: TsCurrencyEdit;
    Label13: TLabel;
    Label14: TLabel;
    PrNumAberbacao: TsCurrencyEdit;
    q_xmlxml_mdfe: TBlobField;
    qrGravaXml: TFDQuery;
    pnRod: TPanel;
    btAlt: TsBitBtn;
    Btgra: TsBitBtn;
    btcan: TsBitBtn;
    Btimp_separacao_itens: TsBitBtn;
    Btimp_form_carga: TsBitBtn;
    btloc: TsBitBtn;
    Panel2: TPanel;
    GroupBox1: TsGroupBox;
    Label1: TsLabel;
    Label2: TsLabel;
    Label3: TsLabel;
    Lbnom_motorista: TsLabel;
    Label7: TsLabel;
    Lbnom_veiculo: TsLabel;
    Label9: TsLabel;
    LbNom_transportadora: TsLabel;
    Label16: TsLabel;
    sLabel2: TsLabel;
    Lbempresa_faturamento: TsLabel;
    Label35: TsLabel;
    BtcriaCarga: TsBitBtn;
    Prid: TsEdit;
    Prnom_carga: TsEdit;
    Prid_motorista: TsComboEdit;
    Prdta_carga: TsDateEdit;
    Prid_veiculo: TsComboEdit;
    Prcod_transportadora: TsComboEdit;
    Pruf_destino: TsEdit;
    Prcod_empresa: TsComboEdit;
    ckSomenteNfes: TCheckBox;
    ckSelecionarTodos: TCheckBox;
    ckSelecionarTodosOutros: TCheckBox;
    pnOutrosRodape: TPanel;
    btTransferirOutros: TsBitBtn;
    edRep: TEdit;
    edUF: TEdit;
    edMeso: TEdit;
    edMicro: TEdit;
    edCidades: TEdit;
    pcPedidos: TPageControl;
    Pedidos: TTabSheet;
    tabOutrasCargas: TTabSheet;
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
    procedure dgCargaOutrosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: integer; Column: TColumn; State: TGridDrawState);
    procedure dgCargaDblClick(Sender: TObject);
    procedure Prcod_empresaExit(Sender: TObject);
    procedure Prcod_empresaKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_empresaButtonClick(Sender: TObject);
    procedure Prcod_empresaChange(Sender: TObject);
    procedure btnMDFEClick(Sender: TObject);
    procedure BtnEnviarCancelamentoMDFEClick(Sender: TObject);
    procedure PridExit(Sender: TObject);
    procedure PrJUSTIF_CANC_MDFEChange(Sender: TObject);
    procedure BtnDaMDFeClick(Sender: TObject);
    procedure BtnEditarCancelamentoMDFEClick(Sender: TObject);
    procedure btAltClick(Sender: TObject);
    procedure btEncerramentoMDFeClick(Sender: TObject);
    procedure ckSelecionarTodosClick(Sender: TObject);
    procedure ckSelecionarTodosOutrosClick(Sender: TObject);
    procedure btTransferirOutrosClick(Sender: TObject);
    procedure edRepChange(Sender: TObject);
    procedure edUFChange(Sender: TObject);
    procedure edMesoChange(Sender: TObject);
    procedure edMicroChange(Sender: TObject);
    procedure edCidadesChange(Sender: TObject);
    procedure dgCargaOutrosDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure limpa_campos(prefixo: ShortString);
    procedure readonly_false(prefixo: ShortString);
    procedure readonly_true(prefixo: ShortString);
    procedure Grava_Sgx(insert: boolean);
    procedure totaliza_carga;
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
    procedure MontaFormularioCarga;

  end;

var
  Fr_montagem_carga: TFr_montagem_carga;
  lista_uf, lista_meso, lista_micro, lista_cidades, lista_repr, path: string;
  iSelecionados : Integer;
  carga_fechada : Boolean;

implementation

uses Un_localizar, UnPri, Un_dao, Un_veiculos, UnFun, Un_fechamento_carga,
  Un_dm, Un_vendas_industria2, un_nfe_transmissao, Un_status_emissor;

{$R *.dfm}

function OnlyNumbers(const S: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(S) do
    if CharInSet(S[I], ['0'..'9']) then
      Result := Result + S[I];
end;

function RemoverCaracteresEspeciais(const Texto: string): string;
const
  CaracteresParaRemover: array[0..2] of Char = ('.', '-', '/');
var
  i, j: Integer;
  Resultado: string;
  CaracterAtual: Char;
  Remover: Boolean;
begin
  Resultado := '';
  for i := 1 to Length(Texto) do
  begin
    CaracterAtual := Texto[i];
    Remover := False;

    for j := Low(CaracteresParaRemover) to High(CaracteresParaRemover) do
    begin
      if CaracterAtual = CaracteresParaRemover[j] then
      begin
        Remover := True;
        Break;
      end;
    end;

    if not Remover then
      Resultado := Resultado + CaracterAtual;
  end;

  Result := Resultado;
end;

procedure TFr_montagem_carga.FormShow(Sender: TObject);
begin
  path := ExtractFilePath(Application.ExeName);
  BtcriaCarga.Caption := 'Cria' + #13 + 'Carga';
  readonly_true('Pr');

  lista_uf := '';
  lista_meso := '';
  lista_micro := '';
  lista_cidades := '';
  lista_repr := '';

  CarregarRepresentantes;
  CarregarUF;
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

procedure TFr_montagem_carga.PridExit(Sender: TObject);
begin
  if Trim(Prid.Text) = '' then
    Exit;
  if BtGra.Enabled then
    Exit;
  if not modo_insert then
    CarregaDados;
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
  btloc.Enabled := false;
  sbFiltro.Enabled := True;

  limpa_campos('Pr');
  modo_insert := true;
  Prdta_carga.Text := FormatDateTime('dd/mm/yyyy', dao.DtaSerDt);
  Prnom_carga.SetFocus;
  readonly_false('Pr');
  carga_fechada := False;

  mmCarga2.Close;


  btnMDFE.Enabled                   := False;
  btEncerramentoMDFe.Enabled        := False;
  BtnDaMDFe.Enabled                 := False;
  BtnEditarCancelamentoMDFE.Enabled := False;
  BtnEnviarCancelamentoMDFE.Enabled := False;
  BtnSairCancelamentoMDFE.Enabled   := False;
end;

procedure TFr_montagem_carga.btEncerramentoMDFeClick(Sender: TObject);
begin
  try
    try
      if not (dao.cn.InTransaction) then
        (dao.cn.StartTransaction);
      dao.Execsql('update CARGA1 set status_emissor = ''AGUARDANDO'', solicitar_emissor = ''ENCERRAMENTO'' where id =' + QuotedStr(PrID.Text));
      dao.cn.Commit;
    except
      dao.cn.Rollback;
    end;

    try
      Application.CreateForm(TFr_status_emissor, Fr_status_emissor);
      Fr_status_emissor.StartWait('MDFE', PrID.Text, 'ENCERRAMENTO');
      Fr_status_emissor.ShowModal;
    finally
      if Assigned(Fr_status_emissor) then
      Fr_status_emissor := nil;
    end;
  finally
    CarregaDados;
  end;
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

  if Prid_veiculo.text = '' then
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
  end;
{
  if Prcod_transportadora.Text = '' then
  begin
    dao.msg('Preencha a Transportadora');
    Prcod_transportadora.SetFocus;
    exit;
  end;   }

  if trim(Prnom_carga.Text) = '' then
  begin
    dao.msg('Preencha o Nome da Carga');
    Prnom_carga.SetFocus;
    exit;
  end;
{
  if trim(Prcod_empresa.Text) = '' then
  begin
    dao.msg('Preencha o Código da Empresa');
    Prcod_empresa.SetFocus;
    exit;
  end;

  if trim(PRuf_destino.Text) = '' then
  begin
    dao.msg('Preencha o UF Destino');
    PRuf_destino.SetFocus;
    exit;
  end;

}
  if mmCarga2.RecordCount = 0 then
  begin
    dao.msg('Não pode gravar sem itens selecionados.');
    exit;
  end;

  if iSelecionados = 0 then
  begin
    dao.msg('Não pode gravar sem itens selecionados.');
    exit;
  end;

  try
    if not(dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    if Prid.Text = '' then
    begin
      id := dao.insert('Pr', 'carga1', 'id', Fr_montagem_carga, 'gen_carga1');
      Prid.Text := id;
    end
    else
      dao.update('carga1', 'id', q_carga1.FieldByName('id').AsString, 'Pr', Fr_montagem_carga);
    dao.cn.Commit;
  except
    dao.cn.rollback;
  end;

  if not (dao.cn.InTransaction) then
    dao.cn.StartTransaction;
  Grava_Sgx(true);
  dao.cn.Commit;

  ativa_carga1(Prid.Text);
  ativa_carga2(Prid.Text);
  carrega_sgx_carga2;

  BtcriaCarga.Enabled := true;
  sbFiltro.Enabled := False;
  btcan.Enabled := false;
  Btimp_separacao_itens.Enabled := true;
  Btimp_form_carga.Enabled := true;
  btnMDFE.Enabled := True;
  Btgra.Enabled := false;
  btloc.Enabled := true;
  btAlt.Enabled := true;
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
      '  t.nome AS nome_transportadora, ' +
      '  a.uf_destino, ' +
      '  a.ResponsavelSeguro, ' +
      '  a.CNPJSeguradora, ' +
      '  a.NomeSeguradora, ' +
      '  a.CNPJResponsavel, ' +
      '  a.ApoliceSeguro, ' +
      '  a.NumAberbacao, ' +
      '  a.situacao_mdfe ' +
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
var
  vEntregue: string;
begin
  mmCarga2.First;
  while not mmCarga2.Eof do
  begin
    if mmCarga2ENTREGUE.AsBoolean then
      vEntregue := '1'
    else
      vEntregue := '0';

    if mmCarga2Check.Value then
      dao.Execsql('UPDATE VENDAS1 SET COD_CARGA = ''' + Prid.Text + ''', ENTREGUE = ' + vEntregue + ' WHERE NUMDOC = ' + mmCarga2Pedido.AsString)
    else
      dao.Execsql('UPDATE VENDAS1 SET COD_CARGA = NULL, ENTREGUE = ' + vEntregue + ' WHERE NUMDOC = ' + mmCarga2Pedido.AsString);

    mmCarga2.Next;
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
  Fr_localizar.CBcampos.ItemIndex := 2;

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

procedure TFr_montagem_carga.PrJUSTIF_CANC_MDFEChange(Sender: TObject);
begin
  if length(PrJUSTIF_CANC_MDFE.Text) >= 15 then
  begin
    BtnEnviarCancelamentoMDFe.Enabled := true;
    BtnSairCancelamentoMDFe.Enabled := true;
  end
  else
  begin
    BtnEnviarCancelamentoMDFe.Enabled := false;
    BtnSairCancelamentoMDFe.Enabled := false;
  end;
end;

procedure TFr_montagem_carga.btAltClick(Sender: TObject);
begin
  BtcriaCarga.Enabled := false;
  Btimp_separacao_itens.Enabled := false;
  Btimp_form_carga.Enabled := false;
  Btgra.Enabled := true;
  btcan.Enabled := true;
  btloc.Enabled := false;
  sbFiltro.Enabled := True;
  btAlt.Enabled := false;



  modo_insert := false;
  Prdta_carga.Text := FormatDateTime('dd/mm/yyyy', dao.DtaSerDt);
  Prnom_carga.SetFocus;
  readonly_false('Pr');
  carga_fechada := False;



end;

procedure TFr_montagem_carga.btcanClick(Sender: TObject);
begin
  BtcriaCarga.Enabled := true;
  Btimp_separacao_itens.Enabled := true;
  Btimp_form_carga.Enabled := true;
  Btgra.Enabled := false;
  btcan.Enabled := false;
  btloc.Enabled := true;
  sbFiltro.Enabled := False;
  limpa_campos('Pr');
  mmCarga2.Close;
  btAlt.Enabled := true;
end;

procedure TFr_montagem_carga.Prid_veiculoExit(Sender: TObject);
begin
  if trim(Prid_veiculo.Text) = '' then
    Lbnom_veiculo.Caption := '...';

  if Prid_veiculo.Text <> '' then
  begin
    dao.Geral2('select nom_veiculo, placa from veiculoS where trim(placa) <> ''-'' and id='+ QuotedStr(Prid_veiculo.Text));
    if dao.q2.RecordCount > 0 then
      Lbnom_veiculo.Caption := dao.q2.FieldByName('placa').AsString
    else
    begin
      dao.msg('Registro não Encontrado ou sem a placa preenchida!');
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

  SetLength(Campos_combo, 5);
  Campos_combo[0] := 'Nº Carga';
  Campos_combo[1] := 'Nº MDFe';
  Campos_combo[2] := 'Nome da Carga';
  Campos_combo[3] := 'Data Carga';
  Campos_combo[4] := 'Transportadora';

  for i := 0 to 4 do
  begin
    valor_combo := Campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 0;

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
  if Trim(PrId.Text)= '' then
    exit;
  CarregaDados;
end;

procedure TFr_montagem_carga.BtnDaMDFeClick(Sender: TObject);
begin
  ImprimirDamdfe(PrChave_MDFe.Text);
end;

procedure TFr_montagem_carga.BtnEditarCancelamentoMDFEClick(Sender: TObject);
begin
  PrJUSTIF_CANC_MDFE.ReadOnly := false;
  PrJUSTIF_CANC_MDFE.Enabled := true;
  PrJUSTIF_CANC_MDFE.SetFocus;
end;

procedure TFr_montagem_carga.BtnEnviarCancelamentoMDFEClick(Sender: TObject);
var
  CancelMDFe: TMDFet;
begin
  try
{    try
      CancelMDFe := TMDFet.Create;
      CancelMDFe.FreeOnTerminate := True;
      CancelMDFe.CancelarMDFe(PrPROTOCOLO_MDFE.Text, PrChave_MDFe.Text, PrJUSTIF_CANC_MDFE.Text);
    except
      on E: Exception do
        showmessage('Erro ao encerrar MDF-e: ' + E.Message);
    end;}

    try
      if not (dao.cn.InTransaction) then
        (dao.cn.StartTransaction);
      dao.Execsql('update CARGA1 set status_emissor = ''AGUARDANDO'', solicitar_emissor = ''CANCELAMENTO'', status_motivo = null, justif_canc_mdfe = ' + QuotedStr(PrJUSTIF_CANC_MDFE.Text) + ' where id =' + QuotedStr(PrID.Text));
      dao.cn.Commit;
    except
      dao.cn.Rollback;
    end;

    try
      Application.CreateForm(TFr_status_emissor, Fr_status_emissor);
      Fr_status_emissor.StartWait('MDFE', PrID.Text, 'CANCELAMENTO');
      Fr_status_emissor.ShowModal;
    finally
     if Assigned(Fr_status_emissor) then
      Fr_status_emissor := nil;
    end;


  finally
    CarregaDados;
  end;
end;

procedure TFr_montagem_carga.CarregaDados;
begin
  modo_insert := False;
  ativa_carga1(Prid.Text);
  mostra_campos('Pr');

  CarregarPedidos(false);
  btnMDFE.Enabled                   := False;
  Prcod_empresaExit(Self);
  Btgra.Enabled := False;
  Btcan.Enabled := False;
  readonly_true('Pr');
  if q_carga1.FieldByName('situacao_mdfe').IsNull then
  begin
    btnMDFE.Enabled := True;
    btEncerramentoMDFe.Enabled := False;
    BtnDaMDFe.Enabled := False;
    BtnEditarCancelamentoMDFE.Enabled := False;
    BtnEnviarCancelamentoMDFE.Enabled := False;
    BtnSairCancelamentoMDFE.Enabled := False;
    btAlt.Enabled := True;
    SBcarga.Panels[0].Text := 'ABERTA';
  end
  else
  begin
    btAlt.Enabled := False;
    case q_carga1.FieldByName('situacao_mdfe').AsInteger of
      1:
        begin
          btnMDFE.Enabled := False;
          btEncerramentoMDFe.Enabled := True;
          BtnDaMDFe.Enabled := True;
          BtnEditarCancelamentoMDFE.Enabled := True;
          BtnEnviarCancelamentoMDFE.Enabled := False;
          BtnSairCancelamentoMDFE.Enabled := False;
          SBcarga.Panels[0].Text := 'MDF-e AUTORIZADA';
        end;
      2:
        begin
          btnMDFE.Enabled := False;
          btEncerramentoMDFe.Enabled := False;
          BtnDaMDFe.Enabled := False;
          BtnEditarCancelamentoMDFE.Enabled := False;
          BtnEnviarCancelamentoMDFE.Enabled := False;
          BtnSairCancelamentoMDFE.Enabled := False;
          SBcarga.Panels[0].Text := 'MDF-e CANCELADA';
        end;
      3:
        begin
          btnMDFE.Enabled := False;
          btEncerramentoMDFe.Enabled := False;
          BtnDaMDFe.Enabled := True;
          BtnEditarCancelamentoMDFE.Enabled := False;
          BtnEnviarCancelamentoMDFE.Enabled := False;
          BtnSairCancelamentoMDFE.Enabled := False;
          SBcarga.Panels[0].Text := 'MDF-e ENCERRADA';
        end;
    end;
  end;
end;


procedure TFr_montagem_carga.ImprimirDamdfe(chave: string; entrada: boolean = false);
var
  arquivoMDFe, pathSaida, Protocolo: string;
begin
  arquivoMDFe := chave + '-procMDFe.xml';
  pathSaida := ExtractFilePath(Application.ExeName) + 'mdfe\';

  if not DirectoryExists(pathSaida) then
    CreateDir(pathSaida);

  q_xml.close;
  q_xml.ParamByName('id').value := PrID.Text;
  q_xml.Open;

    if not q_xml.fieldbyname('XML_MDFE').IsNull then
      TBlobField(q_xml.fieldbyname('XML_MDFE')).SaveToFile(pathSaida + arquivoMDFe);

  ACBrMDFe1.Manifestos.Clear;
  ACBrMDFe1.Manifestos.LoadFromFile(pathSaida + arquivoMDFe);

  //ACBrMDFe1.DAMDFE.Logo := ExtractFilePath(Application.ExeName) + nome_logo;
  ACBrMDFeDAMDFEFR1.fastfile := ExtractFilePath(Application.ExeName) + 'Relatorios\DAMDFe_Retrato.fr3';
  ACBrMDFe1.Manifestos.Imprimir;

  DeleteFile(pathSaida + arquivoMDFe);

end;


procedure TFr_montagem_carga.btnMDFEClick(Sender: TObject);
var
  EmissaoMDFe: TMDFet;
begin
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

  if trim(Prcod_empresa.Text) = '' then
  begin
    dao.msg('Preencha o Código da Empresa');
    Prcod_empresa.SetFocus;
    exit;
  end;

  if trim(PRuf_destino.Text) = '' then
  begin
    dao.msg('Preencha o UF Destino');
    PRuf_destino.SetFocus;
    exit;
  end;

  if trim(PrMDFE.Text) = '' then
  begin
    try
      if not (dao.cn.InTransaction) then
        (dao.cn.StartTransaction);
      dao.Execsql('update CARGA1 set status_emissor = ''AGUARDANDO'', solicitar_emissor = ''EMISSAO'', status_motivo = null where id = ' + QuotedStr(PrID.Text));
      dao.cn.Commit;
    except
      dao.cn.Rollback;
    end;

    try
      Application.CreateForm(TFr_status_emissor, Fr_status_emissor);
      Fr_status_emissor.StartWait('MDFE', Prid.Text, 'EMITIR');
      Fr_status_emissor.ShowModal;
    finally
      if Assigned(Fr_status_emissor) then
        Fr_status_emissor := nil;

      CarregaDados;
      if PrStatus_MDFE.Text = '100' then
        ImprimirDamdfe(PrChave_MDFe.Text);
    end;
  end;
end;

procedure TFr_montagem_carga.mostra_campos(prefixo: ShortString);
var
  i: integer;
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
        campo1 := copy(Components[i].Name, 3, length(Components[i].Name) - 1);
        TsEdit(FindComponent(campo)).Text := q_carga1.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TsComboEdit then
      begin
        campo := TsComboEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        TsComboEdit(FindComponent(campo)).Text := q_carga1.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TsCurrencyEdit then
      begin
        campo := TsCurrencyEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        TsCurrencyEdit(FindComponent(campo)).Value := q_carga1.fieldbyname(campo1).AsFloat;
      end
      else if Components[i] is TComboBox then
      begin
        campo := TComboBox(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        if not q_carga1.fieldbyname(campo1).isnull then
          TComboBox(FindComponent(campo)).ItemIndex := q_carga1.fieldbyname(campo1).AsInteger;
      end
      else if Components[i] is tscheckbox then
      begin
        campo := tscheckbox(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        if q_carga1.fieldbyname(campo1).AsString = 'S' then
          tscheckbox(FindComponent(campo)).Checked := true
        else
          tscheckbox(FindComponent(campo)).Checked := false;
      end
      else if Components[i] is TsDateEdit then
      begin
        campo := TsDateEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);

        TsDateEdit(FindComponent(campo)).Date := q_carga1.fieldbyname(campo1).AsDateTime;
      end
      else if Components[i] is TMaskEdit then
      begin
        campo := TMaskEdit(Components[i]).Name;
        campo1 := copy(Components[i].Name, 3, length(Components[i].Name) - 1);
        TMaskEdit(FindComponent(campo)).Text := q_carga1.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TDateTimePicker then
      begin
        campo := TDateTimePicker(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);

        TDateTimePicker(FindComponent(campo)).DateTime := q_carga1.fieldbyname(campo1).AsDateTime;
      end;
    end;

  end; // end do for

  Lbnom_veiculo.Caption := q_carga1.FieldByName('nom_veiculo').AsString;
  Lbnom_motorista.Caption := q_carga1.FieldByName('nom_motorista').AsString;
  LbNom_transportadora.Caption := q_carga1.fieldbyname('nome_transportadora').asstring;

  Screen.Cursor := crDefault;

end;

procedure TFr_montagem_carga.carrega_sgx_carga2;
begin
end;

procedure TFr_montagem_carga.ckSelecionarTodosClick(Sender: TObject);
begin
  mmCarga2.DisableControls;
  mmCarga2.First;
  while not mmCarga2.eof do
  begin
    mmCarga2.Edit;
    mmCarga2Check.AsBoolean := ckSelecionarTodos.Checked;
    mmCarga2.Post;
    mmCarga2.Next;  end;
  mmCarga2.First;
  mmCarga2.EnableControls;
end;

procedure TFr_montagem_carga.ckSelecionarTodosOutrosClick(Sender: TObject);
begin
  mmCargaOutros.DisableControls;
  mmCargaOutros.First;
  while not mmCargaOutros.Eof do
  begin
    mmCargaOutros.Edit;
    mmCargaOutrosCheck.AsBoolean := ckSelecionarTodosOutros.Checked;
    mmCargaOutros.Post;
    mmCargaOutros.Next;
  end;
  mmCargaOutros.First;
  mmCargaOutros.EnableControls;
end;

procedure TFr_montagem_carga.btTransferirOutrosClick(Sender: TObject);
var
  numdoc: string;
begin
  if mmCargaOutros.IsEmpty then Exit;

  mmCargaOutros.DisableControls;
  mmCarga2.DisableControls;
  try
    mmCargaOutros.First;
    while not mmCargaOutros.Eof do
    begin
      if mmCargaOutrosCheck.AsBoolean then
      begin
        numdoc := mmCargaOutrosPedido.AsString;

        // evita duplicar
        if not mmCarga2.Locate('Pedido', numdoc, []) then
        begin
          dao.Geral1('select numdoc, nfe, dta_emissao, tot_liquido, peso_nota, vl_frete, entregue from vendas1 where numdoc = ' + QuotedStr(numdoc));

          mmCarga2.Append;
          mmCarga2Pedido.AsString := numdoc;
          if not dao.Q1.IsEmpty then
          begin
            mmCarga2NFE.AsString := dao.Q1.FieldByName('NFE').AsString;
            mmCarga2DATA.AsDateTime := dao.Q1.FieldByName('DTA_EMISSAO').AsDateTime;
            mmCarga2VALOR.AsFloat := dao.Q1.FieldByName('TOT_LIQUIDO').AsFloat;
            mmCarga2PESO.AsFloat := dao.Q1.FieldByName('PESO_NOTA').AsFloat;
            mmCarga2VALOR_FRETE.AsFloat := dao.Q1.FieldByName('VL_FRETE').AsFloat;
            mmCarga2ENTREGUE.AsBoolean := dao.Q1.FieldByName('ENTREGUE').AsInteger = 1;
          end
          else
          begin
            mmCarga2NFE.AsString := mmCargaOutrosNFE.AsString;
            mmCarga2DATA.AsDateTime := mmCargaOutrosDATA.AsDateTime;
            mmCarga2VALOR.AsFloat := mmCargaOutrosVALOR.AsFloat;
          end;
          mmCarga2CLIENTE.AsString := mmCargaOutrosCLIENTE.AsString;
          mmCarga2ENTREGUE.AsBoolean := False;
          mmCarga2Check.AsBoolean := False;
          dgCargaDblClick(Self);
        end;

        mmCargaOutros.Delete;
        Continue;
      end;

      mmCargaOutros.Next;
    end;
  finally
    mmCarga2.EnableControls;
    mmCargaOutros.EnableControls;
  end;
end;

procedure TFr_montagem_carga.MontaFormularioCarga;
begin
  with dm.q_carga do
  begin
    close;
    sql.Clear;
    SQL.Add('select v1.nfe,');
    SQL.Add('       v1.numdoc,');
    SQL.Add('       v1.DTA_EMISSAO as dtadoc,');
    SQL.Add('       v1.volume_nota,');
    SQL.Add('       cl.nom_cliente,');
    SQL.Add('       cd.nom_cidade||''-''||cd.uf as cidade,');
    SQL.Add('       v1.tot_liquido,');
    SQL.Add('       f.nom_fop,');
    SQL.Add('       c1.id,');
    SQL.Add('       c1.dta_carga,');
    SQL.Add('       c1.nom_carga,');
    SQL.Add('       c1.tot_peso,');
    SQL.Add('       c1.tot_carga,');
    SQL.Add('       c1.tot_frete,');
    SQL.Add('       v.nom_veiculo,');
    SQL.Add('       m.nome as nom_motorista,');
    SQL.Add('       t.nome as nom_transportadora');
    SQL.Add('from carga1 c1');
    SQL.Add('left join vendas1 v1 on v1.cod_carga = cast(c1.id as VARCHAR(20))');
    SQL.Add('left join fop f on f.cod_fop = v1.cod_fop');
    SQL.Add('left join cliente cl on cl.cod_cliente = v1.cod_cliente');
    SQL.Add('left join cidades cd on cd.cod_cidade = cl.cod_cidade');
    SQL.Add('left join veiculos v on v.id = c1.id_veiculo');
    SQL.Add('left join motorista m on m.id = c1.id_motorista');
    SQL.Add('left join transportadora t on t.cod_transportadora = c1.cod_transportadora');
    SQL.Add('where c1.id = ' + QuotedStr(Prid.Text));
    SQL.Add('order by nom_cliente');
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
    sql.Add('select p.cod_produto, p.nom_produto, p.cod_prateleira, sum(v2.qtd) as soma from vendas2 v2 ' +
            'inner join produto p on p.cod_produto=v2.cod_produto ' +
            'where ' +
            cmd_where +
            ' group by p.cod_produto, p.nom_produto, p.cod_prateleira');
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

procedure TFr_montagem_carga.edMicroChange(Sender: TObject);
begin
  if Trim(edMicro.Text) <> '' then
    mmMicro.Locate('Nome', edMicro.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TFr_montagem_carga.edCidadesChange(Sender: TObject);
begin
  if Trim(edCidades.Text) <> '' then
    mmCidades.Locate('Nome', edCidades.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TFr_montagem_carga.edMesoChange(Sender: TObject);
begin
  if Trim(edMeso.Text) <> '' then
    mmMeso.Locate('Nome', edMeso.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TFr_montagem_carga.edRepChange(Sender: TObject);
begin
  if Trim(EdRep.Text) <> '' then
    mmRep.Locate('Nome', EdRep.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TFr_montagem_carga.edUFChange(Sender: TObject);
begin
  if Trim(Eduf.Text) <> '' then
    mmUF.Locate('UF', Eduf.Text, [loPartialKey, loCaseInsensitive]);
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
  if filtro then
  begin
{    if trim(Prcod_empresa.Text) = '' then
    begin
      dao.msg('Empresa deve ser preenchida!');
      Prcod_empresa.SetFocus;
      exit;
    end;  }

    if ftDtIni.Date = 0 then
    begin
      dao.msg('Data Inicial deve ser preenchida!');
      ftDtIni.SetFocus;
      exit;
    end;

    if ftDtFim.Date = 0 then
    begin
      dao.msg('Data Final deve ser preenchida!');
      ftDtFim.SetFocus;
      exit;
    end;
  end;

  cmd := 'SELECT distinct a.NUMDOC, a.nfe, a.DTADOC, a.VL_FRETE, A.DTA_EMISSAO, c.NOM_CLIENTE, a.TOT_BRUTO, a.TOT_LIQUIDO, a.PESO_NOTA, a.ENTREGUE, '
    + 'a.COD_FOP||''-''||f.NOM_FOP as fop, a.COD_REPRESENTANTE||''-''||r.NOM_REPRESENTANTE as representante, p.PRAZO, a.NR_PEDIDO_PALM, a.PALM_NR_CONEXAO, A.OBSERVACOES_PEDIDO, A.COD_CARGA, c1.NOM_CARGA '
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
    'left join carga1 c1 on (a.COD_CARGA = cast(c1.ID as VARCHAR(20))) ' +
    'where (a.FATURADO IN (1)  ';

  if ckSomenteNfes.Checked then
    cmd := cmd +'  and a.chave_nfe is not null ';

  if trim(Prcod_empresa.Text) <> '' then
    cmd := cmd + ' and a.empresa_faturar = '+Prcod_empresa.Text;

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

  if edPedido.Text <> '' then
    cmd := cmd + fmfun.cmdAux('a.numdoc', edPedido.Text);


  if Prid.Text <> '' then
  begin
    if not filtro then
      cmd := cmd + ' ) and a.cod_carga in (''' + trim(Prid.Text) + ''')'
    else if trim(Prid.Text) <> '' then
      cmd := cmd + ' ) or a.cod_carga in (''' + trim(Prid.Text) + ''')';
  end
  else
      cmd := cmd + ' ) ';

  cmd := cmd + ' order by c.NOM_CLIENTE, a.NUMDOC ';


  dao.Geral1(cmd);
  peso := 0;
  frete := 0;
  carga := 0;
  mmCarga2.DisableControls;
  mmCarga2.open;
  mmCarga2.EmptyTable;
  iSelecionados := 0;
  mmCargaOutros.DisableControls;
  mmCargaOutros.Open;
  mmCargaOutros.EmptyTable;
  while not dao.Q1.Eof do
  begin
    if (not dao.Q1.FieldByName('COD_CARGA').IsNull) and (dao.Q1.FieldByName('COD_CARGA').AsString <> Prid.Text)  then
    begin
      mmCargaOutros.Append;
      mmCargaOutrosPedido.AsString := dao.Q1.FieldByName('NUMDOC').AsString;
      mmCargaOutrosNFE.AsString := dao.Q1.FieldByName('NFE').AsString;
      mmCargaOutrosCLIENTE.AsString := dao.Q1.FieldByName('NOM_CLIENTE').AsString;
      mmCargaOutrosDATA.AsDateTime := dao.Q1.FieldByName('DTA_EMISSAO').AsDateTime;
      mmCargaOutrosVALOR.AsFloat := dao.Q1.FieldByName('TOT_LIQUIDO').AsFloat;
      mmCargaOutrosCOD_CARGA.AsString := dao.Q1.FieldByName('COD_CARGA').AsString;
      mmCargaOutrosNOM_CARGA.AsString := dao.Q1.FieldByName('NOM_CARGA').AsString;
      mmCargaOutrosCheck.Value := false;
      mmCargaOutros.Post;
      dao.Q1.Next;
      Continue;
    end;

    mmCarga2.Append;
    mmCarga2Pedido.AsString := dao.Q1.FieldByName('NUMDOC').AsString;
    mmCarga2NFE.AsString := dao.Q1.FieldByName('NFE').AsString;
    mmCarga2CLIENTE.AsString := dao.Q1.FieldByName('NOM_CLIENTE').AsString;
    mmCarga2DATA.AsDateTime := dao.Q1.FieldByName('DTA_EMISSAO').AsDateTime;
    mmCarga2VALOR.AsFloat := dao.Q1.FieldByName('TOT_LIQUIDO').AsFloat;
    mmCarga2PESO.AsFloat := dao.Q1.FieldByName('PESO_NOTA').AsFloat;
    mmCarga2VALOR_FRETE.AsFloat := dao.Q1.FieldByName('VL_FRETE').AsFloat;
    mmCarga2ENTREGUE.AsBoolean := dao.Q1.FieldByName('ENTREGUE').AsInteger = 1;
    if (trim(Prid.Text) <> '') and
      (dao.Q1.FieldByName('COD_CARGA').AsString = Prid.Text) then
    begin
      mmCarga2Check.Value := true;
      iSelecionados := iSelecionados + 1;
      peso := mmCarga2PESO.AsFloat + peso;
      frete := frete + mmCarga2VALOR_FRETE.AsFloat;
      carga := carga + mmCarga2VALOR.AsFloat;
    end
    else
      mmCarga2Check.Value := false;

    mmCarga2.Post;
    dao.Q1.Next;
  end;
  mmCarga2.First;
  mmCarga2.EnableControls;
  mmCargaOutros.First;
  mmCargaOutros.EnableControls;

  Prtot_peso.Value := peso;
  Prtot_frete.Value := frete;
  Prtot_carga.Value := carga;

  Btimp_separacao_itens.Enabled := not mmCarga2.IsEmpty;
  Btimp_form_carga.Enabled := not mmCarga2.IsEmpty;

  tabOutrasCargas.TabVisible := not mmCargaOutros.IsEmpty;
end;

procedure TFr_montagem_carga.dgCargaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
const
  IsChecked: array [boolean] of integer = (
    DFCS_BUTTONCHECK,
    DFCS_BUTTONCHECK or DFCS_CHECKED
  );
var
  DrawState: integer;
  DrawRect: TRect;
  IsCheckedValue: Boolean;
begin
  if (Column = nil) or (Column.Field = nil) then Exit;
  if Column.Field.FieldName = '' then Exit;

  if (CheckPedido <> nil) and (Column.Field.FieldName = CheckPedido.DataField) then
  begin
    if (gdFocused in State) then
    begin
      CheckPedido.Left := Rect.Left + dgRep.Left + 2;
      CheckPedido.Top := Rect.Top + dgRep.Top + 2;
      CheckPedido.Width := Rect.Right - Rect.Left;
      CheckPedido.Height := Rect.Bottom - Rect.Top;
      CheckPedido.Visible := True;
    end
    else
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := IsChecked[Column.Field.AsBoolean];

      dgCarga.Canvas.FillRect(Rect);
      DrawFrameControl(dgCarga.Canvas.Handle, DrawRect, DFC_BUTTON, DrawState);
    end;
    Exit;
  end;

  if (CheckEntregue <> nil) and (Column.Field.FieldName = CheckEntregue.DataField) then
  begin
    if (gdFocused in State) then
    begin
      CheckEntregue.Left := Rect.Left + dgRep.Left + 2;
      CheckEntregue.Top := Rect.Top + dgRep.Top + 2;
      CheckEntregue.Width := Rect.Right - Rect.Left;
      CheckEntregue.Height := Rect.Bottom - Rect.Top;
      CheckEntregue.Visible := True;
    end
    else
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := IsChecked[Column.Field.AsBoolean];

      dgCarga.Canvas.FillRect(Rect);
      DrawFrameControl(dgCarga.Canvas.Handle, DrawRect, DFC_BUTTON, DrawState);
    end;
    Exit;
  end;
end;


procedure TFr_montagem_carga.dgCargaOutrosDblClick(Sender: TObject);
begin
  mmCargaOutros.Edit;
  if mmCargaOutrosCheck.Value = true then
    mmCargaOutrosCheck.Value := false
  else
    mmCargaOutrosCheck.Value := true;
  mmCargaOutros.Post;
end;

procedure TFr_montagem_carga.dgCargaOutrosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: integer; Column: TColumn;
  State: TGridDrawState);
const
  IsChecked: array [boolean] of integer = (
    DFCS_BUTTONCHECK,
    DFCS_BUTTONCHECK or DFCS_CHECKED
  );
var
  DrawState: integer;
  DrawRect: TRect;
begin
  if (Column = nil) or (Column.Field = nil) or (CheckOutros = nil) then Exit;
  if Column.Field.FieldName = '' then Exit;

  if Column.Field.FieldName = CheckOutros.DataField then
  begin
    if (gdFocused in State) then
    begin
      CheckOutros.Left := Rect.Left + dgCargaOutros.Left + 2;
      CheckOutros.Top := Rect.Top + dgCargaOutros.Top + 2;
      CheckOutros.Width := Rect.Right - Rect.Left;
      CheckOutros.Height := Rect.Bottom - Rect.Top;

      CheckOutros.Visible := true;
    end
    else
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := IsChecked[Column.Field.AsBoolean];

      dgCargaOutros.Canvas.FillRect(Rect);
      DrawFrameControl(dgCargaOutros.Canvas.Handle, DrawRect, DFC_BUTTON, DrawState);
    end;
  end;
end;

procedure TFr_montagem_carga.dgCargaDblClick(Sender: TObject);
begin
  mmCarga2.Edit;
  if mmCarga2Check.Value = true then
  begin
    mmCarga2Check.Value := false;
    Prtot_peso.Value    := Prtot_peso.Value  - mmCarga2PESO.AsFloat;
    Prtot_frete.Value   := Prtot_frete.Value - mmCarga2VALOR_FRETE.AsFloat;
    Prtot_carga.Value   := Prtot_carga.Value - mmCarga2VALOR.AsFloat;
    iSelecionados       := iSelecionados     - 1;
  end
  else begin
    mmCarga2Check.Value := true;
    Prtot_peso.Value    := Prtot_peso.Value  + mmCarga2PESO.AsFloat;
    Prtot_frete.Value   := Prtot_frete.Value + mmCarga2VALOR_FRETE.AsFloat;
    Prtot_carga.Value   := Prtot_carga.Value + mmCarga2VALOR.AsFloat;
    iSelecionados       := iSelecionados     + 1;
  end;
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
  Manifesto1: TManifesto;
  MDFe: TMDFe;
begin
  Fr_montagem_carga.ACBrMDFe1.ssl.selecionarcertificado;
  PreencherConfiguracoes;
  Fr_montagem_carga.ACBrMDFe1.Manifestos.Clear;

  Manifesto1 := Fr_montagem_carga.ACBrMDFe1.Manifestos.Add;
  MDFe := Manifesto1.MDFe;

  PreencherIde(MDFe);
  PreencherEmitente(MDFe);
  PreencherCarregamento(MDFe);
  PreencherDocumentos(MDFe);
  PreencherModalRodoviario(MDFe);
  PreencherSeguroCarga(MDFe);

  // Totais
  MDFe.tot.qCTe := 0;
  MDFe.tot.qMDFe := 0;
  MDFe.tot.vCarga := Fr_montagem_carga.Prtot_frete.Value;
  MDFe.tot.cUnid := uKG;
  MDFe.tot.qCarga := Fr_montagem_carga.Prtot_peso.Value;

  FinalizarMDFe;
end;

procedure TMDFet.PreencherConfiguracoes;
begin
  with Fr_montagem_carga.ACBrMDFe1.Configuracoes do
  begin
    WebServices.Ambiente := FMFUN.BuscaAmbienteNFE;
    Geral.FormaEmissao := teNormal;
    ARQUIVOS.PathSchemas := ExtractFilePath(Application.ExeName) + 'Schemas\MDFe\';
  end;
end;

procedure TMDFet.PreencherIde(MDFe: TMDFe);
begin
  with MDFe.ide do
  begin
    Fr_montagem_carga.ACBrMDFe1.Configuracoes.WebServices.UF := Fr_montagem_carga.UF_Emissor;
    cUF := Fr_montagem_carga.ACBrMDFe1.Configuracoes.WebServices.UFCodigo;
    tpAmb := FMFUN.BuscaAmbienteNFE;
    tpEmit := teTranspCargaPropria;
    serie := 1;
    nMDF := StrToInt(Fr_montagem_carga.PrMDFE.Text);
    dhEmi := Now;
    tpEmis := teNormal;

    procEmi := peAplicativoContribuinte;
    verProc := '1.0.0';

    UFIni := Fr_montagem_carga.UF_Emissor;
    UFFim := Fr_montagem_carga.PRuf_destino.Text;
  end;
end;


procedure TMDFet.PreencherSeguroCarga(MDFe: TMDFe);
begin
  with MDFe.seg.New do
  begin
    case Fr_montagem_carga.prResponsavelSeguro.ItemIndex of
      0 : respSeg := rsEmitente;
      1 : respSeg := rsTomadorServico;
    end;

    CNPJCPF := Fr_montagem_carga.PrCNPJResponsavel.Text;

    xSeg := Fr_montagem_carga.prNomeSeguradora.Text;
    CNPJ := Fr_montagem_carga.PrCNPJSeguradora.Text; // CNPJ da Seguradora
    nApol := Fr_montagem_carga.prApoliceSeguro.Text;

    with aver.New do
    begin
      nAver := Fr_montagem_carga.prNumAberbacao.Text;
    end;
  end;
end;


procedure TMDFet.PreencherEmitente(MDFe: TMDFe);
var
  EnderEmit: TenderEmit;
begin
  dao.Geral5(
    'SELECT a.CNPJ, a.NOM_EMPRESA, a.NOM_FANTASIA, a.ENDERECO, a.NR_ENDERECO, ' +
    'a.COMPLEMENTO, a.BAIRRO, c.COD_IBGE, c.NOM_CIDADE, c.UF, a.CEP, a.FONE, a.IE ' +
    'FROM EMPRESA a ' +
    'INNER JOIN CIDADES c ON c.COD_CIDADE = a.COD_CIDADE ' +
    'WHERE a.COD_EMPRESA = ' + QuotedStr(Fr_montagem_carga.Prcod_empresa.Text)
  );

  if dao.q5.RecordCount = 0 then
  begin
    raise Exception.Create('Emitente não encontrado para a empresa ' + Fr_montagem_carga.Prcod_empresa.Text);
    exit;
  end;

  if dao.q5.RecordCount > 0 then
  begin
    with MDFe.emit do
    begin
      CNPJCPF := dao.q5.FieldByName('CNPJ').AsString;
      IE := dao.q5.FieldByName('IE').AsString;
      xNome := dao.q5.FieldByName('NOM_EMPRESA').AsString;
      xFant := dao.q5.FieldByName('NOM_FANTASIA').AsString;

      EnderEmit := enderEmit;
      with EnderEmit do
      begin
        xLgr := dao.q5.FieldByName('ENDERECO').AsString;
        nro := dao.q5.FieldByName('NR_ENDERECO').AsString;
        xCpl := dao.q5.FieldByName('COMPLEMENTO').AsString;
        xBairro := dao.q5.FieldByName('BAIRRO').AsString;
        cMun := dao.q5.FieldByName('COD_IBGE').AsInteger;
        xMun := dao.q5.FieldByName('NOM_CIDADE').AsString;
        UF := dao.q5.FieldByName('UF').AsString;
        CEP := StrToIntDef(dao.q5.FieldByName('CEP').AsString, 0);
        fone := dao.q5.FieldByName('FONE').AsString;
      end;
    end;
  end;
end;

procedure TMDFet.PreencherCarregamento(MDFe: TMDFe);
var
  Item: TinfMunCarregaCollectionItem;
begin
  Item := MDFe.ide.infMunCarrega.Add;
  Item.cMunCarrega := MDFe.emit.enderEmit.cMun;
  Item.xMunCarrega := MDFe.emit.enderEmit.xMun;
end;

procedure TMDFet.PreencherDocumentos(MDFe: TMDFe);
var
  infMunDescarga: TinfMunDescargaCollectionItem;
  infNFe: TinfNFeCollectionItem;
  CodIBGE: Integer;
  i: Integer;
  MunicipioExiste: Boolean;
begin
  MDFe.tot.qNFe := 0;

  // Carrega os pedidos para compor o MDF-e
  Fr_montagem_carga.CarregarPedidosMDFe;
  dao.Q1.First;

  while not dao.Q1.Eof do
  begin
    CodIBGE := dao.Q1.FieldByName('cod_ibge').AsInteger;

    // Verifica se o município já foi adicionado
    MunicipioExiste := False;
    for i := 0 to MDFe.infDoc.infMunDescarga.Count - 1 do
    begin
      if MDFe.infDoc.infMunDescarga[i].cMunDescarga = CodIBGE then
      begin
        infMunDescarga := MDFe.infDoc.infMunDescarga[i];
        MunicipioExiste := True;
        Break;
      end;
    end;

    // Se não existe, cria novo município
    if not MunicipioExiste then
    begin
      infMunDescarga := MDFe.infDoc.infMunDescarga.Add;
      infMunDescarga.cMunDescarga := CodIBGE;
      infMunDescarga.xMunDescarga := dao.Q1.FieldByName('nom_cidade').AsString;
    end;

    // Só adiciona NF-e se tiver chave válida
    if dao.Q1.FieldByName('chave_nfe').AsString <> '' then
    begin
      infNFe := infMunDescarga.infNFe.Add;
      infNFe.chNFe := dao.Q1.FieldByName('chave_nfe').AsString;

      MDFe.tot.qNFe := MDFe.tot.qNFe + 1;
    end
    else
    begin
      raise Exception.CreateFmt(
        'Município %s (%d) não possui chave NF-e vinculada!',
        [dao.Q1.FieldByName('nom_cidade').AsString, CodIBGE]
      );
    end;

    dao.Q1.Next;
  end;
end;


function TMDFet.GetPlaca(pID: string): string;
begin
  Result := '';
  dao.Geral5('select placa from veiculos where id = ' + pID);
  if not dao.q5.IsEmpty then
    Result := StringReplace(dao.q5.FieldByName('placa').AsString, '-', '', [rfReplaceAll]);
end;

procedure TMDFet.PreencherModalRodoviario(MDFe: TMDFe);
begin
  dao.Geral5('select id, nom_veiculo, placa, dt_aquisicao, hodometro_inicial, proxima_revisao_data, proxima_revisao_hodometro, '+
             'renavam, tara, capkg, capm3, tiporodado, tipocarroceria, uf from veiculos '+
             'where id  = ' + QuotedStr(Fr_montagem_carga.Prid_veiculo.Text));

  if dao.q5.RecordCount = 0 then
  begin
    raise Exception.Create('Veículo não encontrado ' + Fr_montagem_carga.Prid_veiculo.Text);
    exit;
  end;


  with MDFe.rodo do
  begin
    //RNTRC := Fr_montagem_carga.PrRNTRC.Text;

    with veicTracao do
    begin
      // Informações sobre o veiculo de tração
      cInt := dao.q5.FieldByName('id').AsString;
      placa := RemoverCaracteresEspeciais(dao.q5.FieldByName('placa').AsString);
      RENAVAM := dao.q5.FieldByName('renavam').AsString;
      tara := dao.q5.FieldByName('tara').AsInteger;
      capKG := dao.q5.FieldByName('capkg').AsInteger;
      capM3 := dao.q5.FieldByName('capm3').AsInteger;

      // TpcteTipoRodado = (trNaoAplicavel, trTruck, trToco, trCavaloMecanico, trVAN, trUtilitario, trOutros);
      // Para o MDF-e não utilizar o trNaoAplicavel.
      case dao.q5.FieldByName('tiporodado').AsInteger of
        0: tpRod := trNaoAplicavel;
        1: tpRod := trTruck;
        2: tpRod := trToco;
        3: tpRod := trCavaloMecanico;
        4: tpRod := trVAN;
        5: tpRod := trUtilitario;
        6: tpRod := trOutros;
      end;

      // TpcteTipoCarroceria = (tcNaoAplicavel, tcAberta, tcFechada, tcGraneleira, tcPortaContainer, tcSider);
      tpCar := tcFechada;
      case dao.q5.FieldByName('tipocarroceria').AsInteger of
        0: tpCar := tcNaoAplicavel;
        1: tpCar := tcAberta;
        2: tpCar := tcFechada;
        3: tpCar := tcGraneleira;
        4: tpCar := tcPortaContainer;
        5: tpCar := tcSider;
      end;

      UF := dao.q5.FieldByName('uf').AsString;

      dao.Geral5('select nome, cpf from public.motorista where id = ' + QuotedStr(Fr_montagem_carga.Prid_motorista.Text));

      if dao.q5.RecordCount = 0 then
      begin
        raise Exception.Create('Motorista não encontrado ' + Fr_montagem_carga.Prid_motorista.Text);
        exit;
      end;

      with condutor.New do
      begin
        xNome := dao.q5.FieldByName('nome').AsString;
        CPF := OnlyNumbers(dao.q5.FieldByName('cpf').AsString);
      end;


      dao.Geral5('SELECT a.CNPJ, a.NOM_EMPRESA ' +
                 'FROM EMPRESA a ' +
                 'WHERE a.COD_EMPRESA = ' + QuotedStr(Fr_montagem_carga.Prcod_empresa.Text));


      with infANTT.infContratante.New do
      begin
        CNPJCPF := OnlyNumbers(dao.q5.FieldByName('CNPJ').AsString);
        idEstrangeiro := '';
        xNome := dao.q5.FieldByName('NOM_EMPRESA').AsString;
      end;

    end;
  end;
end;

procedure TMDFet.ImprimirDAMDFE;
var
  DAMDFeFR: TACBrMDFeDAMDFEFR;
begin
  DAMDFeFR := TACBrMDFeDAMDFEFR.Create(nil);
  try
    with Fr_montagem_carga.ACBrMDFe1 do
      DAMDFeFR.ImprimirDAMDFe(Manifestos.Items[0].MDFe);
  finally
    DAMDFeFR.Free;
  end;
end;

procedure TMDFet.FinalizarMDFe;
var
  NumeroLote, sqlMDfe, motivo, Protocolo, Data, StatusMDFE: String;
begin
  with Fr_montagem_carga.ACBrMDFe1 do
  begin
    Manifestos.Assinar;
    Manifestos.Items[0].GravarXML();
    Manifestos.Validar;
    Manifestos.Assinar;

    NumeroLote := FormatDateTime('yyyymmddhhnnss', Now); // Gera número do lote
    StatusMDFE := '';
    try
      Enviar(NumeroLote);  // Aqui já faz envio e consulta automática

      // Verifica retorno direto
      if WebServices.Retorno.cStat = 100 then
      begin
        motivo := 'MDF-e autorizado.';
        Protocolo := WebServices.Retorno.Protocolo;

        ImprimirDAMDFE;
      end
      else
        motivo := IntToStr(WebServices.Retorno.cStat) + ' - ' +  WebServices.Retorno.xMotivo;

      StatusMDFE := IntToStr(WebServices.Retorno.cstat);
    except
      on E: Exception do
        ShowMessage('Erro ao enviar MDF-e: ' + E.Message);
    end;

    if StatusMDFE <> '' then
    begin
      sqlMDfe := 'update carga1 set ' +
                 ', STATUS_MDFE = ' + StatusMDFE +
                 ', MOTIVO_MDFE = ' + QuotedStr(motivo)+
                 ', XML_MDFE = '''+Manifestos.Items[0].XML+'''';
      if Protocolo <> 'null' then
        sqlMDfe := sqlMDfe + ' , PROTOCOLO_MDFE = ' + QuotedStr(Protocolo);

      sqlMDfe := sqlMDfe + ' where id =' + Fr_montagem_carga.Prid.Text;



      try
        if not (dao.cn.InTransaction) then
          dao.cn.StartTransaction;
        dao.Execsql(sqlMDfe);
        dao.cn.Commit;
      except
        dao.cn.Rollback;
      end;

    end;

  end;
end;

procedure TMDFet.CancelarMDFe(const ANumProtocolo, AChave, AJustificativa: string);
var
  NumeroLote, sqlMDfe, motivo, Protocolo, Data, StatusMDFE: String;
begin
  Fr_montagem_carga.ACBrMDFe1.ssl.selecionarcertificado;
  PreencherConfiguracoes;
  with Fr_montagem_carga.ACBrMDFe1 do
  begin
    try
      EventoMDFe.Evento.Clear;

      with EventoMDFe.Evento.Add do
      begin
        infEvento.chMDFe     := AChave;
        infEvento.CNPJCPF    := OnlyNumbers(SSL.CertCNPJ);
        infEvento.dhEvento   := Now;
        infEvento.tpEvento   := teCancelamento;
        infEvento.nSeqEvento := 1;

        with infEvento.detEvento do
        begin
          xJust := AJustificativa;
          nProt := ANumProtocolo;
        end;
      end;

      EnviarEvento(-1);  // Envia o evento de cancelamento

      if WebServices.EnvEvento.cStat = 135 then
      begin
        with WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento do
        begin
          if cStat = 135 then
          begin
            motivo := 'Cancelamento autorizado! Protocolo: ' + nProt;
            Protocolo := nProt;
          end
          else
            motivo := IntToStr(WebServices.Retorno.cStat) + ' - ' +  WebServices.Retorno.xMotivo;

          StatusMDFE := IntToStr(WebServices.Retorno.cstat);
        end;
      end
      else
        motivo := 'Erro ao enviar evento de cancelamento: ' + WebServices.EnvEvento.xMotivo;
    except
      on E: Exception do
        ShowMessage('Falha ao cancelar MDF-e: ' + E.Message);
    end;

    if StatusMDFE <> '' then
    begin
      sqlMDfe := 'update carga1 set ' +
                 ', STATUS_MDFE = ' + StatusMDFE +
                 ', MOTIVO_MDFE = ' + QuotedStr(motivo);

      if Protocolo <> 'null' then
        sqlMDfe := sqlMDfe + ' , PROTOCOLO_MDFE = ' + QuotedStr(Protocolo);

      sqlMDfe := sqlMDfe + ' where id =' + Fr_montagem_carga.Prid.Text;

      try
        if not (dao.cn.InTransaction) then
          dao.cn.StartTransaction;
        dao.Execsql(sqlMDfe);
        dao.cn.Commit;
      except
        dao.cn.Rollback;
      end;
    end;
  end;
end;

constructor TMDFet.Create;
begin
  inherited;
end;




procedure TMDFet.Execute;
begin
  inherited;

end;

end.








