unit Un_Cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Mask, ExtCtrls, Buttons,
  ACBrValidador, shellapi, Menus,
  ACBrBase, ACBrSocket, ACBrCEP, sPanel, sBitBtn, sLabel,
  sCheckBox, sGroupBox, sPageControl, sSpeedButton, sTooledit, sMaskEdit,
  sCustomComboEdit, sCurrEdit, sCurrencyEdit, sEdit, sComboEdit, OleCtrls,
  SHDocVw, ACBrConsultaCPF, ACBrConsultaCNPJ, Data.DB, RxMemDS,
  sDBCalcEdit, RxToolEdit, RxDBCtrl, sDBText, Vcl.Grids, Vcl.DBGrids, acDBGrid,
  Vcl.DBCtrls, sDBDateEdit, sDBEdit, RxCurrEdit,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFr_Cliente = class(TForm)
    q_cliente: TFDQuery;
    PopupMenu1: TPopupMenu;
    Pgcliente: TsPageControl;
    tab_dados: TsTabSheet;
    tab_perfil: TsTabSheet;
    gbDados: TsGroupBox;
    Label4: tsLabel;
    Label5: tsLabel;
    Label6: tsLabel;
    Label7: tsLabel;
    Label8: tsLabel;
    Label9: tsLabel;
    LbNom_cidade: tsLabel;
    Label11: tsLabel;
    Label12: tsLabel;
    Label13: tsLabel;
    Label14: tsLabel;
    Label40: tsLabel;
    PrEndereco: TsEdit;
    PrComplemento: TsEdit;
    PrProximo: TsEdit;
    PrEmail: TsEdit;
    PrAviso: TRichEdit;
    BtCDL: TsBitBtn;
    PCCliente: TsPageControl;
    TabSheet1: TsTabSheet;
    GroupBox6: TsGroupBox;
    Label33: tsLabel;
    Label34: tsLabel;
    Label35: tsLabel;
    Label36: tsLabel;
    Label37: tsLabel;
    Label38: tsLabel;
    BitBtn4: TsBitBtn;
    PrProd_Rural: TComboBox;
    PrContato: TsEdit;
    PrIE: TsEdit;
    PrIM: TsEdit;
    BitBtn5: TsBitBtn;
    PrFone_Contato: TsMaskEdit;
    PrCNPJ: TsMaskEdit;
    TabSheet2: TsTabSheet;
    GroupBox4: TsGroupBox;
    Label17: tsLabel;
    Label18: tsLabel;
    Label19: tsLabel;
    Label20: tsLabel;
    Label21: tsLabel;
    Label22: tsLabel;
    Label23: tsLabel;
    Label24: tsLabel;
    Label10: tsLabel;
    PrRG: TsEdit;
    BitBtn2: TsBitBtn;
    PrNaturalidade: TsEdit;
    PrEst_Civil: TComboBox;
    PrPai: TsEdit;
    PrMae: TsEdit;
    PrTip_Residencia: TComboBox;
    PrAluguel: TsCurrencyEdit;
    PrDta_aniversario: TsMaskEdit;
    PrCPF: TsMaskEdit;
    TabSheet3: TsTabSheet;
    GroupBox7: TsGroupBox;
    PrObservacoes: TRichEdit;
    PrBairro: TsEdit;
    PrTelefone: TsMaskEdit;
    PrCep: TsMaskEdit;
    PrWHASTAPP: TsMaskEdit;
    GroupBox5: TsGroupBox;
    lbest: tsLabel;
    Prestilo: TComboBox;
    Label26: tsLabel;
    PrContato_preferido: TComboBox;
    PrManequim: TsEdit;
    Label27: tsLabel;
    PrCalcado: TsEdit;
    Label28: tsLabel;
    Label29: tsLabel;
    Prcor_preferida: TsEdit;
    Panel1: tsPanel;
    Label1: tsLabel;
    PrCod_Cliente: TsEdit;
    Label2: tsLabel;
    PrNom_Cliente: TsEdit;
    PrNom_Fantasia: TsEdit;
    Label3: tsLabel;
    GroupBox2: TsGroupBox;
    Label15: tsLabel;
    Label16: tsLabel;
    PrDta_Cad: TsDateEdit;
    PrPri_Compra: TsDateEdit;
    GroupBox13: TsGroupBox;
    Prcontato_fone: tsCheckbox;
    Prcontato_email: tsCheckbox;
    Prcontato_correspondencia: tsCheckbox;
    RelaodeClientes1: TMenuItem;
    EtiquetasparaMalaDireta1: TMenuItem;
    Prcliente_bloqueado: tsCheckbox;
    lbDescMaximo: tsLabel;
    Prdesconto_maximo: TsCurrencyEdit;
    PrLimite: TsCurrencyEdit;
    Prnr_endereco: TsEdit;
    Label30: tsLabel;
    PrNFE_EMAIL: tsCheckbox;
    Panel2: tsPanel;
    SpeedButton1: TsSpeedButton;
    BtNov: TsBitBtn;
    BtAlt: TsBitBtn;
    BtGra: TsBitBtn;
    BtCan: TsBitBtn;
    BtExc: TsBitBtn;
    BtLocalizar: TsBitBtn;
    Prid_representante: TsComboEdit;
    Label31: tsLabel;
    Lbnom_representante: tsLabel;
    Label32: tsLabel;
    PrPRAZO_MAXIMO: TsCurrencyEdit;
    PrPre_Cadastro: tsCheckbox;
    BtBuscaEnd: TsBitBtn;
    BtBuscaCEP: TsBitBtn;
    PrTip_pessoa: TsEdit;
    rgTipoPessoa: TsRadioGroup;
    PrCod_Cidade: TsComboEdit;
    sLabel1: tsLabel;
    PrEMAIL_END_NFE: TsEdit;
    sLabel2: tsLabel;
    PrEMAIL_ADICIONAL1: TsEdit;
    PrEMAIL_ADICIONAL2: TsEdit;
    PrEMAIL_ADICIONAL3: TsEdit;
    tabGeral: TsTabSheet;
    PageControl1: TsPageControl;
    TabSheet4: TsTabSheet;
    GroupBox8: TsGroupBox;
    Label39: tsLabel;
    Label41: tsLabel;
    Label44: tsLabel;
    Label46: tsLabel;
    Label47: tsLabel;
    Lbcid_trabalho: tsLabel;
    Label43: tsLabel;
    Label45: tsLabel;
    PrEmpresa: TsEdit;
    PrEnd_TraCli: TsEdit;
    PrBairro_Trabalho: TsEdit;
    PrCargo: TsEdit;
    PrFone_Trabalho: TsMaskEdit;
    Prcid_trabalho: TsComboEdit;
    PrSalario: TsCurrencyEdit;
    TabSheet5: TsTabSheet;
    GroupBox9: TsGroupBox;
    Label48: tsLabel;
    Label49: tsLabel;
    Label50: tsLabel;
    Label51: tsLabel;
    Label52: tsLabel;
    Lbcid_emp_conj: tsLabel;
    Label54: tsLabel;
    PrEmp_Conj: TsEdit;
    PrEnd_Emp_Conj: TsEdit;
    PrCargo_Conj: TsEdit;
    PrNom_Conjugue: TsEdit;
    PrFone_Emp_Conj: TsMaskEdit;
    PrCid_emp_Conj: TsComboEdit;
    TabSheet6: TsTabSheet;
    GroupBox10: TsGroupBox;
    Label55: tsLabel;
    Label56: tsLabel;
    Label57: tsLabel;
    PrNom_Ref1: TsEdit;
    PrObs_Ref1: TsEdit;
    PrFone_Ref1: TsMaskEdit;
    GroupBox11: TsGroupBox;
    Label58: tsLabel;
    Label59: tsLabel;
    Label60: tsLabel;
    PrNom_Ref2: TsEdit;
    PrObs_Ref2: TsEdit;
    PrFone_Ref2: TsMaskEdit;
    TabSheet7: TsTabSheet;
    GroupBox12: TsGroupBox;
    Label61: tsLabel;
    Label62: tsLabel;
    PrCad_SPC: TComboBox;
    PrDta_Cad_SPC: TsDateEdit;
    sLabel3: tsLabel;
    PrCelular: TsMaskEdit;
    PrACEITA_NOTA_SIMPLES: tsCheckbox;
    BtnSimples: TsBitBtn;
    ACBrCEP1: TACBrCEP;
    BtnEmail: TsBitBtn;
    PrConsumidor_Final: tsCheckbox;
    btnOperadora: TsBitBtn;
    PrOperadora: TsEdit;
    sLabel4: tsLabel;
    PrConstrutora: tsCheckbox;
    PrUltConsSerasa: TsDateEdit;
    sLabel5: tsLabel;
    sLabel6: tsLabel;
    PrDESCONTO_ESPECIAL: TsCurrencyEdit;
    TabLimite: TsTabSheet;
    DBGrid6: Tdbgrid;
    Panel11: tsPanel;
    gbUF: TsGroupBox;
    Panel12: tsPanel;
    BtNovoBonificacao: TsBitBtn;
    BtAltBonificacao: TsBitBtn;
    BtGravarBonificacao: TsBitBtn;
    BtCancBonificacao: TsBitBtn;
    BtExcBonificacao: TsBitBtn;
    gbLimite: TsGroupBox;
    mmLimiteBonificacao: TRxMemoryData;
    dsLimiteBonificacao: TDataSource;
    mmLimiteBonificacaocod_produto: TIntegerField;
    mmLimiteBonificacaonom_produto: TStringField;
    mmLimiteBonificacaolimite: TIntegerField;
    edcodproduto: TRxDBComboEdit;
    TabVisitas: TsTabSheet;
    mmVisitas: TRxMemoryData;
    dsVisitas: TDataSource;
    dgVisitas: Tdbgrid;
    mmVisitasData: TDateTimeField;
    mmVisitasVendeu: TBooleanField;
    mmVisitasValor: TCurrencyField;
    sPanel1: tsPanel;
    sPanel2: tsPanel;
    BtNovoVisitas: TsBitBtn;
    BtAlterarVisitas: TsBitBtn;
    BtSalvarVisitas: TsBitBtn;
    BtCancelarVisitas: TsBitBtn;
    BtExcluirVisitas: TsBitBtn;
    gbData: TGroupBox;
    gbValor: TGroupBox;
    edValorVisita: TsDBCalcEdit;
    gbMotivo: TGroupBox;
    DBMemo1: TDBMemo;
    CkVendeu: TDBCheckBox;
    edDataVisitas: TsDBDateEdit;
    mmVisitasMotivo: TStringField;
    DBCheckBox2: TDBCheckBox;
    mmVisitasENVIADO: TBooleanField;
    sLabel7: tsLabel;
    sLabel8: tsLabel;
    Shape1: TShape;
    Shape2: TShape;
    tabNCM: TsTabSheet;
    mmNCM: TRxMemoryData;
    dsNCM: TDataSource;
    dbNCM: Tdbgrid;
    sPanel3: tsPanel;
    sPanel4: tsPanel;
    btInsNCM: TsBitBtn;
    btAltNCM: TsBitBtn;
    btGravarNCM: TsBitBtn;
    btCancNCM: TsBitBtn;
    btExcNCM: TsBitBtn;
    gbNCM: TGroupBox;
    gbTribICMS: TGroupBox;
    mmNCMCEST: TStringField;
    mmNCMNCM: TStringField;
    mmNCMTRIB_ICMS: TStringField;
    GBCest: TGroupBox;
    edTrib_icms: TDBComboBox;
    edNCM: TDBEdit;
    edCest: TsDBEdit;
    mmNCMDESCTRIB_ICMS: TStringField;
    PrSUSPENSAO_PIS_CONFINS: tsCheckbox;
    DBText1: TDBText;
    RxDBCalcEdit1: TRxDBCalcEdit;
    GroupBox1: TGroupBox;
    PrProNautica: TCheckBox;
    PrProEmprego: TCheckBox;
    sLabel9: TsLabel;
    PrSaldo: TsCurrencyEdit;
    procedure BtAltClick(Sender: TObject);
    procedure BtCanClick(Sender: TObject);
    procedure BtExcClick(Sender: TObject);
    procedure BtGraClick(Sender: TObject);
    procedure BtLocalizarClick(Sender: TObject);
    procedure BtNovClick(Sender: TObject);
    procedure PrNom_ClienteKeyPress(Sender: TObject; var Key: Char);
    procedure PrCod_CidadeButtonClick(Sender: TObject);
    procedure PrCid_emp_ConjButtonClick(Sender: TObject);
    procedure Prcid_trabalhoButtonClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure PrCPFExit(Sender: TObject);
    procedure PrCNPJExit(Sender: TObject);
    procedure PrIEExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PrEst_CivilEnter(Sender: TObject);
    procedure PrCad_SPCEnter(Sender: TObject);
    procedure PrCod_CidadeKeyPress(Sender: TObject; var Key: Char);
    procedure Prcid_trabalhoKeyPress(Sender: TObject; var Key: Char);
    procedure PrCid_emp_ConjKeyPress(Sender: TObject; var Key: Char);
    procedure PrNom_FantasiaKeyPress(Sender: TObject; var Key: Char);
    procedure RelaodeClientes1Click(Sender: TObject);
    procedure EtiquetasparaMalaDireta1Click(Sender: TObject);
    procedure Prid_representanteButtonClick(Sender: TObject);
    procedure Prid_representanteExit(Sender: TObject);
    procedure BtBuscaEndClick(Sender: TObject);
    procedure PrCod_CidadeExit(Sender: TObject);
    procedure BtBuscaCEPClick(Sender: TObject);
    procedure PrCNPJKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PrFone_ContatoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PrTelefoneKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PrWHASTAPPKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PrCepKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PrCPFKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PrFone_TrabalhoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PrDta_aniversarioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PrFone_Emp_ConjKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PrFone_Ref1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PrFone_Ref2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PrDta_Cad_SPCKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rgTipoPessoaClick(Sender: TObject);
    procedure ACBrCEP1BuscaEfetuada(Sender: TObject);
    procedure BtnSimplesClick(Sender: TObject);
    procedure BtnEmailClick(Sender: TObject);
    procedure btnOperadoraClick(Sender: TObject);
    procedure BtNovoBonificacaoClick(Sender: TObject);
    procedure BtAltBonificacaoClick(Sender: TObject);
    procedure BtGravarBonificacaoClick(Sender: TObject);
    procedure BtCancBonificacaoClick(Sender: TObject);
    procedure BtExcBonificacaoClick(Sender: TObject);
    procedure edcodprodutoButtonClick(Sender: TObject);
    procedure edcodprodutoExit(Sender: TObject);
    procedure BtNovoVisitasClick(Sender: TObject);
    procedure BtAlterarVisitasClick(Sender: TObject);
    procedure BtSalvarVisitasClick(Sender: TObject);
    procedure BtCancelarVisitasClick(Sender: TObject);
    procedure BtExcluirVisitasClick(Sender: TObject);
    procedure dgVisitasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dgVisitasKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dgVisitasKeyPress(Sender: TObject; var Key: Char);
    procedure dgVisitasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dgVisitasCellClick(Column: TColumn);
    procedure btInsNCMClick(Sender: TObject);
    procedure btAltNCMClick(Sender: TObject);
    procedure btGravarNCMClick(Sender: TObject);
    procedure btCancNCMClick(Sender: TObject);
    procedure btExcNCMClick(Sender: TObject);
    procedure edTrib_icmsChange(Sender: TObject);
  private
    procedure habilitaCamposAreaAtuacao(CodAtuacao: string);
    procedure CarregarMapa;
    procedure BuscaBonificacao;
    procedure BuscaVisitas;
    procedure ChecaVisitasEnviadas;
    procedure BuscaNCMs;
    { Private declarations }
  public
    { Public declarations }

    modo_insert, modo_insert_con, dados_incompletos: Boolean;
    busca_qualquer_posicao_pesquisada: Boolean;
    campo_pesquisado, dado_pesquisado, cliente: string;
    id: string;

    procedure mostra_campos(prefixo: ShortString);
    procedure ativa_cliente(id: string); // carrega a query q_fornecedor
    procedure limpa_campos(prefixo: ShortString);
    procedure readonly_true(prefixo: ShortString);
    procedure readonly_false(prefixo: ShortString);

    procedure atualiza_cadastro_cliente_lojas;
    procedure ChecarDadosIncompletos;
    function VerificaCNPJCadastrados(cnpj, cliente: string): Boolean;
    function VerificaCPFCadastrados(cpf, cliente: string): Boolean;
  end;

var
  Fr_Cliente: TFr_Cliente;
  UF, CIDADE: string;

implementation

uses Un_dao, UnPri, Un_localizar, Un_opc_relatorios, Un_opc_etiqueta,
  UnFun, un_rl_etiqueta_empresa, Un_dm, pcnRetConsCad, MaskUtils;

{$R *.dfm}

procedure TFr_Cliente.BtAltClick(Sender: TObject);
begin
  try
    if PrCod_Cliente.Text = '' then
    begin
      dao.msg('Para alterar os dados você deve selecionar um cliente!');
      exit;
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

    if Pgcliente.ActivePageIndex = 0 then
      PrNom_Cliente.SetFocus;
    if Pgcliente.ActivePageIndex = 1 then
      Prestilo.SetFocus;

    if (frpri.TipUsu = '0') or (frpri.TipUsu = '1') then
      Prid_representante.ReadOnly := true;

    Prcliente_bloqueado.Enabled := Tipo_usuario = '9';
  except
  end;

end;

procedure TFr_Cliente.BtAlterarVisitasClick(Sender: TObject);
begin
  BtSalvarVisitas.Enabled := true;
  BtCancelarVisitas.Enabled := true;
  BtAlterarVisitas.Enabled := false;
  BtExcluirVisitas.Enabled := false;
  BtNovoVisitas.Enabled := false;

  mmVisitas.Edit;
  edDataVisitas.SetFocus;
end;

procedure TFr_Cliente.btAltNCMClick(Sender: TObject);
begin
  btGravarNCM.Enabled := true;
  btCancNCM.Enabled := true;
  btAltNCM.Enabled := false;
  btExcNCM.Enabled := false;
  btInsNCM.Enabled := false;

  mmNCM.Edit;

end;

procedure TFr_Cliente.BtCanClick(Sender: TObject);
begin
  try
    if MessageDlg('Deseja Cancelar está Operação?', mtConfirmation, [mbyes, mbno], 0) = mryes then
    begin
      BtNov.Enabled := true;
      BtAlt.Enabled := true;
      BtGra.Enabled := false;
      BtCan.Enabled := false;
      BtExc.Enabled := true;
      BtLocalizar.Enabled := true;

      if modo_insert then
      begin
        limpa_campos('Pr');
        readonly_true('Pr');
      end
      else if not(modo_insert) then
      begin
        mostra_campos(q_cliente.fieldbyname('cod_cliente').AsString);
      end;
      if dados_incompletos then
        modalresult := mrcancel;
    end
    else
      exit;
  except
  end;

end;

procedure TFr_Cliente.btCancNCMClick(Sender: TObject);
begin

  mmNCM.cancel;

  btGravarNCM.Enabled := false;
  btCancNCM.Enabled := false;
  btAltNCM.Enabled := true;
  btExcNCM.Enabled := true;
  btInsNCM.Enabled := true;

end;

procedure TFr_Cliente.BtExcClick(Sender: TObject);
begin
  if PrCod_Cliente.Text = '' then
  begin
    showmessage('Não é possivel excluir este Cliente por não ter Código!');
    BtNov.SetFocus;
    exit;
  end;
  // criar aqui rotina para verificar se este cliente não está sendo usado em alguma venda

  if MessageDlg('Tem Certeza que Deseja Excluir Este Cliente?', mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    dao.delete('cod_cliente', q_cliente.fieldbyname('cod_cliente').AsString, 'cliente');
    dao.msg('Cliente excluido com sucesso!');
  end;
  mostra_campos('');
end;

procedure TFr_Cliente.BtExcluirVisitasClick(Sender: TObject);
begin
  mmVisitas.delete;

  BtSalvarVisitas.Enabled := false;
  BtCancelarVisitas.Enabled := false;
  BtAlterarVisitas.Enabled := true;
  BtExcluirVisitas.Enabled := true;
  BtNovoVisitas.Enabled := true;

end;

procedure TFr_Cliente.btExcNCMClick(Sender: TObject);
begin
  mmNCM.delete;

  btGravarNCM.Enabled := false;
  btCancNCM.Enabled := false;
  btAltNCM.Enabled := true;
  btExcNCM.Enabled := true;
  btInsNCM.Enabled := true;

end;

procedure TFr_Cliente.BtGraClick(Sender: TObject);
var
  sql, vendeu: string;
begin
  try
    BtNov.Enabled := true;
    BtAlt.Enabled := true;
    BtGra.Enabled := false;
    BtCan.Enabled := false;
    BtExc.Enabled := true;
    BtLocalizar.Enabled := true;

    Pgcliente.ActivePageIndex := 0;

    if rgTipoPessoa.ItemIndex = 0 then
      PrTip_pessoa.Text := 'J'
    else
      PrTip_pessoa.Text := 'F';

    if modo_insert then
    begin
      Prdesconto_maximo.Value := 100;
      try
        if not(dao.cn.InTransaction) then
          dao.cn.StartTransaction;
        id := dao.insert('Pr', 'cliente', 'cod_cliente', Fr_Cliente, 'gen_cliente');
        dao.cn.Commit;
      except
        dao.cn.rollback;
      end;

      PrCod_Cliente.Text := id;

      ChecarDadosIncompletos;
{      if not FMFUN.ValidaDadosCliente(PrCod_Cliente.Text) then
        exit;}

      ativa_cliente(id);
    end
    else
    begin
      try
      //  if not(dao.cn.InTransaction) then
          dao.cn.StartTransaction;
        dao.update('cliente', 'cod_cliente', PrCod_Cliente.Text, 'Pr', Fr_Cliente);
        ativa_cliente(PrCod_Cliente.Text);

        // dao.Execsql2('update cliente set limite='+QuotedStr(FMFUN.prepara_valor(PrLimite.Text)) +' , desconto_maximo = '+QuotedStr(FMFUN.prepara_valor(Prdesconto_maximo.Text)));
        dao.cn.Commit;
      except
        dao.cn.rollback;
      end;

      {if not FMFUN.ValidaDadosCliente(PrCod_Cliente.Text) then
      begin
        BtAltClick(self);
        ChecarDadosIncompletos;
        exit;
      end
      else
        ChecarDadosIncompletos;
      }
      if dados_incompletos then
        modalresult := mrok;
    end;

    // dao.Geral1('select grava_cliente_aut_internet from configuracao where cod_conf ='+QuotedStr('1'));
    // if dao.Q1.FieldByName('grava_cliente_aut_internet').AsString = 'S' then
    // atualiza_cadastro_cliente_lojas;
    readonly_true('Pr');
  except
    on e: Exception do
    begin
      dao.msg('Houve um erro ao Gravar o Cliente!' + #13 + e.message);
    end;
  end;

  try
    //if not(dao.cn.InTransaction) then
      (dao.cn.StartTransaction);
    sql := ' delete FROM cliente_produto where COD_cliente = ' + quotedstr(PrCod_Cliente.Text);

    dao.Execsql(sql);
    dao.cn.Commit;
  except
    dao.cn.rollback;
  end;

  if mmLimiteBonificacao.Active = false then
    mmLimiteBonificacao.Active := true;

  mmLimiteBonificacao.First;

  while not mmLimiteBonificacao.Eof do
  begin
    try
     // if not(dao.cn.InTransaction) then
        (dao.cn.StartTransaction);
      sql := ' INSERT INTO cliente_produto (COD_CLIENTE, COD_PRODUTO, LIMITE) ' + ' VALUES ( ' + quotedstr(PrCod_Cliente.Text) + ', ' + quotedstr(mmLimiteBonificacaocod_produto.AsString) + ', ' +
        FMFUN.BuscaTroca(mmLimiteBonificacaolimite.AsString, ',', '.') + ') ';
      dao.Execsql(sql);
      dao.cn.Commit;
    except
      dao.cn.rollback;
    end;
    mmLimiteBonificacao.Next;
  end;
  mmLimiteBonificacao.First;

  try
    //if not(dao.cn.InTransaction) then
      (dao.cn.StartTransaction);
    sql := ' delete FROM CLIENTE_NCM where COD_cliente = ' + quotedstr(PrCod_Cliente.Text);

    dao.Execsql(sql);
    dao.cn.Commit;
  except
    dao.cn.rollback;
  end;

  if mmNCM.Active = false then
    mmNCM.Active := true;

  mmNCM.First;

  while not mmNCM.Eof do
  begin
    try
     // if not(dao.cn.InTransaction) then
        (dao.cn.StartTransaction);

      sql := ' INSERT INTO CLIENTE_NCM (NCM, CEST, COD_CLIENTE, TRIB_ICMS) VALUES ' + ' ( ' + quotedstr(mmNCMNCM.AsString) + ', ' + quotedstr(mmNCMCEST.AsString) + ', ' + quotedstr(PrCod_Cliente.Text)
        + ', ' + quotedstr(mmNCMTRIB_ICMS.AsString) + ') ';
      dao.Execsql(sql);
      dao.cn.Commit;
    except
      dao.cn.rollback;
    end;
    mmNCM.Next;
  end;
  mmNCM.First;

  /// /////////////////////////////////
  (*
    try
    if not(dao.cn.InTransaction) then
    (dao.cn.StartTransaction);
    sql := ' delete FROM CLIENTE_VISITAS where COD_cliente = ' +
    quotedstr(PrCod_Cliente.Text);

    dao.Execsql(sql);
    dao.cn.Commit;
    except
    dao.cn.rollback;
    end;

    if mmVisitas.Active = false then
    mmVisitas.Active := true;

    mmVisitas.First;

    while not mmVisitas.Eof do
    begin
    try
    if not(dao.cn.InTransaction) then
    (dao.cn.StartTransaction);

    if mmVisitasVendeu.Value = true then
    vendeu := 'S'
    else
    vendeu := 'N';

    sql := ' INSERT INTO CLIENTE_VISITAS (COD_CLIENTE, DATA, VENDEU, MOTIVO_N_VENDA, VALOR_PEDIDO) '
    + ' VALUES ( ' + quotedstr(PrCod_Cliente.Text) + ', ' +
    quotedstr(formatdatetime('dd.mm.yyyy', mmVisitasData.AsDateTime)) + ', '
    + quotedstr(vendeu) + ', ' + quotedstr(mmVisitasMotivo.AsString) + ', '
    + FMFUN.BuscaTroca(mmVisitasValor.AsString, ',', '.') + ') ';

    dao.Execsql(sql);
    dao.cn.Commit;
    except
    dao.cn.rollback;
    end;
    mmVisitas.Next;
    end;
    mmVisitas.First;

    if not mmVisitas.IsEmpty then
    begin
  *)
  (* if not(dao.cn.InTransaction) then
    (dao.cn.StartTransaction);

    sql := 'update cliente c set c.ULTIMA_FREQUENCIA = (select max(v.DATA) from CLIENTE_VISITAS v where v.COD_CLIENTE = c.COD_CLIENTE)';
    dao.Execsql(sql);

    dao.cn.Commit; *)
  // end;
end;

procedure TFr_Cliente.BuscaBonificacao;
var
  sql: string;
begin
  sql := '';

  dao.Geral1('SELECT a.COD_PRODUTO, a.COD_CLIENTE, a.LIMITE, P.NOM_PRODUTO ' + 'FROM CLIENTE_PRODUTO A INNER JOIN PRODUTO P ON P.COD_PRODUTO = A.COD_PRODUTO where a.COD_CLIENTE = ' +
    quotedstr(PrCod_Cliente.Text));
  dao.Q1.First;
  mmLimiteBonificacao.Close;
  mmLimiteBonificacao.EmptyTable;
  mmLimiteBonificacao.Open;
  while not dao.Q1.Eof do
  begin
    mmLimiteBonificacao.Append;

    mmLimiteBonificacaocod_produto.AsString := dao.Q1.fieldbyname('COD_PRODUTO').AsString;
    mmLimiteBonificacaonom_produto.AsString := dao.Q1.fieldbyname('NOM_PRODUTO').AsString;
    mmLimiteBonificacaolimite.AsString := dao.Q1.fieldbyname('LIMITE').AsString;

    mmLimiteBonificacao.Post;
    dao.Q1.Next;
  end;
  mmLimiteBonificacao.First;
end;

procedure TFr_Cliente.BuscaVisitas;
var
  sql: string;
begin
  sql := '';

  dao.Geral1(' SELECT a.COD_CLIENTE, a.DATA, a.VENDEU, a.MOTIVO_N_VENDA, a.VALOR_PEDIDO, a.ENVIADO ' + ' FROM CLIENTE_VISITAS a WHERE A.COD_CLIENTE = ' + quotedstr(PrCod_Cliente.Text) +
    ' ORDER BY A.DATA DESC ');
  dao.Q1.First;
  mmVisitas.Close;
  mmVisitas.EmptyTable;
  mmVisitas.Open;
  while not dao.Q1.Eof do
  begin
    mmVisitas.Append;

    mmVisitasData.Value := dao.Q1.fieldbyname('data').AsDateTime;
    mmVisitasVendeu.Value := dao.Q1.fieldbyname('vendeu').AsString = 'S';
    mmVisitasENVIADO.Value := dao.Q1.fieldbyname('enviado').AsString = 'S';

    mmVisitasMotivo.Value := dao.Q1.fieldbyname('motivo_n_venda').AsString;
    mmVisitasValor.Value := dao.Q1.fieldbyname('valor_pedido').AsCurrency;

    mmVisitas.Post;
    dao.Q1.Next;
  end;
  mmVisitas.First;
  ChecaVisitasEnviadas;
end;

procedure TFr_Cliente.BuscaNCMs;
var
  sql: string;
begin
  sql := '';

  dao.Geral1(' SELECT a.NCM, a.CEST, a.COD_CLIENTE, a.TRIB_ICMS, a.COD_FISCAL_PRODUTO, ' +
             ' cast(case a.TRIB_ICMS when ''0'' then ''00 - Tributada integralmente'' ' +
             '                   when ''1'' then ''10 - Trib. e com cobrança de ICMS'' ' +
             '                   when ''2'' then ''20 - com redução de base de cálculo'' ' +
             '                   when ''3'' then ''30 - Isento ou não tribut. com cobrança de ICMS'' ' +
             '                   when ''4'' then ''40 - Isenta'' ' +
             '                   when ''5'' then ''41 - Não tributada'' ' +
             '                   when ''6'' then ''50 - Suspensão'' ' +
             '                   when ''7'' then ''51 - Diferimento'' ' +
             '                   when ''8'' then ''60 - ICMS cobrado anteriormente por subs. trib.'' ' +
             '                   when ''9'' then ''70 - com redu. da base de cálculo e cob. do ICMs'' ' +
             '                  when ''10'' then ''90 - Outras'' ' +
             '  end as varchar(200))  as desc_trib_icms ' +
             ' FROM CLIENTE_NCM a WHERE A.COD_CLIENTE = ' + trim(PrCod_Cliente.Text) +
             ' ORDER BY A.NCM, A.CEST ');

  dao.Q1.First;

  mmNCM.Close;
  mmNCM.EmptyTable;
  mmNCM.Open;
  while not dao.Q1.Eof do
  begin
    mmNCM.Append;

    mmNCMNCM.AsString := dao.Q1.fieldbyname('NCM').AsString;
    mmNCMCEST.AsString := dao.Q1.fieldbyname('CEST').AsString;
    mmNCMTRIB_ICMS.AsString := dao.Q1.fieldbyname('trib_icms').AsString;
    mmNCMDESCTRIB_ICMS.AsString := dao.Q1.fieldbyname('desc_trib_icms').AsString;
    mmNCM.Post;
    dao.Q1.Next;
  end;
  mmNCM.First;

end;

procedure TFr_Cliente.BtLocalizarClick(Sender: TObject);
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
  chamou_form := 'fr_cliente';
  chamou_cadastro := '';
  Fr_localizar.BT_cadastro.Caption := 'Ca&dastro de' + #13 + 'Cliente';
  Fr_localizar.BT_cadastro.Visible := false;

  // preenchendo o combo box com os campos desejados para pesquisar.
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
  if campo_pesquisado <> '' then
  begin
    Fr_localizar.CBcampos.ItemIndex := Fr_localizar.CBcampos.Items.IndexOf(campo_pesquisado);
    Fr_localizar.EDlocalizar.Text := dado_pesquisado;
    Fr_localizar.zzbusca_qualquer.Checked := busca_qualquer_posicao_pesquisada;
    Fr_localizar.loc_Cliente(Fr_localizar.EDlocalizar.Text);
  end;
  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;
  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_Cliente.BtNovClick(Sender: TObject);
begin
  try
    modo_insert := true;
    readonly_false('Pr');
    PrNom_Cliente.SetFocus;
    // habilita botões
    BtNov.Enabled := false;
    BtAlt.Enabled := false;
    BtGra.Enabled := true;
    BtCan.Enabled := true;
    BtExc.Enabled := false;
    BtLocalizar.Enabled := false;
    limpa_campos('Pr');
    if (frpri.TipUsu = '0') or (frpri.TipUsu = '1') then
    begin
      Prid_representante.Text := frpri.Representante_id;
      Prid_representanteExit(self);
      Prid_representante.ReadOnly := true;
    end;
    mmLimiteBonificacao.EmptyTable;
  except

  end;

end;

procedure TFr_Cliente.mostra_campos(prefixo: ShortString);
var
  i: Integer;
  campo, campo1: string;
begin
  Screen.Cursor := crSQLWait;

  for i := 0 to ComponentCount - 1 do
  begin
    // showmessage(inttostr(i));
    if copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
      begin
        campo := TsEdit(Components[i]).Name;
        campo1 := copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
        TsEdit(FindComponent(campo)).Text := q_cliente.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TRichEdit then
      begin
        campo := TRichEdit(Components[i]).Name;
        campo1 := copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
        TRichEdit(FindComponent(campo)).Text := q_cliente.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TsComboEdit then
      begin
        campo := TsComboEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        TsComboEdit(FindComponent(campo)).Text := q_cliente.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TsCurrencyEdit then
      begin
        campo := TsCurrencyEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        TsCurrencyEdit(FindComponent(campo)).Value := q_cliente.fieldbyname(campo1).AsFloat;
      end
      else if Components[i] is TComboBox then
      begin
        campo := TComboBox(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        TComboBox(FindComponent(campo)).ItemIndex := q_cliente.fieldbyname(campo1).AsInteger;
      end
      else if Components[i] is TsDateEdit then
      begin
        campo := TsDateEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);

        TsDateEdit(FindComponent(campo)).Date := q_cliente.fieldbyname(campo1).AsDateTime;
      end
      else if Components[i] is tsCheckbox then
      begin
        campo := tsCheckbox(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        if q_cliente.fieldbyname(campo1).AsString = 'S' then
          tsCheckbox(FindComponent(campo)).Checked := true
        else
          tsCheckbox(FindComponent(campo)).Checked := false;
      end
      else if Components[i] is tCheckbox then
      begin
        campo := tCheckbox(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        if q_cliente.fieldbyname(campo1).AsString = 'S' then
          tCheckbox(FindComponent(campo)).Checked := true
        else
          tCheckbox(FindComponent(campo)).Checked := false;
      end
      else if Components[i] is TsMaskEdit then
      begin
        campo := TsMaskEdit(Components[i]).Name;
        campo1 := copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
        TsMaskEdit(FindComponent(campo)).Text := q_cliente.fieldbyname(campo1).AsString;
      end;
    end;
  end; // end do for

  LbNom_cidade.Caption := q_cliente.fieldbyname('nom_cidade').AsString;
  Lbcid_trabalho.Caption := q_cliente.fieldbyname('cid_trabalho').AsString;
  Lbcid_emp_conj.Caption := q_cliente.fieldbyname('cid_trab_conj').AsString;

  if q_cliente.fieldbyname('tip_pessoa').AsString = 'J' then
    rgTipoPessoa.ItemIndex := 0
  else
    rgTipoPessoa.ItemIndex := 1;

  Prid_representanteExit(self);
  PrCod_CidadeExit(self);
  CarregarMapa;

  Screen.Cursor := crDefault;
  BuscaBonificacao;
  BuscaVisitas;
  BuscaNCMs;




end;

procedure TFr_Cliente.ChecarDadosIncompletos;
var
  sql: string;
begin
  if frpri.modulo_vendedor and frpri.representacao then
    exit;

  sql := 'SELECT A.TIP_PESSOA,' + '  CASE WHEN a.NOM_CLIENTE IS NULL THEN ''F'' ELSE ''T'' END AS RAZAO_SOCIAL_OK, ' + '  a.NOM_CLIENTE, ' +
    '  CASE WHEN a.UltConsSerasa+180 < current_date THEN ''F'' ELSE ''T'' END AS ULTCONSSERASA_OK, ' + '  CASE WHEN a.ENDERECO IS NULL THEN ''F'' ELSE ''T'' END AS ENDERECO_OK, ' +
    '  CASE WHEN a.BAIRRO IS NULL THEN ''F'' ELSE ''T'' END AS BAIRRO_OK, ' + '  CASE WHEN a.CEP IS NULL THEN ''F'' ELSE ''T'' END AS CEP_OK, ' + '  a.CEP, ' +
    '  CASE WHEN a.COD_CIDADE IS NULL THEN ''F'' ELSE ''T'' END AS COD_CIDADE_OK, ' +
    '  CASE WHEN A.TIP_PESSOA = ''J'' THEN CASE WHEN A.CNPJ = ''  .   .   /    -  '' THEN ''F'' ELSE ''T'' END ELSE CASE WHEN A.CPF = ''   .   .   -  '' THEN ''F'' ELSE ''T'' END END AS CNPJ_CPF_OK, '
    + '  CASE WHEN a.NR_ENDERECO IS NULL THEN ''F'' ELSE ''T'' END AS NR_ENDERECO_OK, ' + '  CASE WHEN a.TELEFONE IS NULL THEN ''F'' ELSE ''T'' END AS TELEFONE_OK, ' + '  a.TELEFONE, ' +
    '  CASE WHEN A.TIP_PESSOA = ''J'' THEN CASE WHEN a.IE IS NULL THEN ''F'' ELSE ''T'' END ELSE CASE WHEN A.RG IS NULL THEN ''F'' ELSE ''T'' END END AS IE_RG_OK ' + 'FROM CLIENTE a        ' +
    'WHERE A.COD_CLIENTE =' + PrCod_Cliente.Text;

  dao.Geral4(sql);

  if dao.q4.fieldbyname('IE_RG_OK').AsString = 'F' then
  begin
    if rgTipoPessoa.ItemIndex = 0 then
    begin
      PrIE.Color := clred;
      PrIE.Font.Color := clwhite;
      PCCliente.TabIndex := 0;
      PrIE.SetFocus;
    end
    else
    begin
      PrRG.Color := clred;
      PrRG.Font.Color := clwhite;
      PCCliente.TabIndex := 1;
      PrRG.SetFocus;
    end;
  end
  else
  begin
    if rgTipoPessoa.ItemIndex = 0 then
    begin
      PrIE.Color := clwhite;
      PrIE.Font.Color := clblack;
    end
    else
    begin
      PrRG.Color := clwhite;
      PrRG.Font.Color := clblack;
    end;
  end;

  if dao.q4.fieldbyname('CNPJ_CPF_OK').AsString = 'F' then
  begin
    if rgTipoPessoa.ItemIndex = 0 then
    begin
      PrCNPJ.Color := clred;
      PrCNPJ.Font.Color := clwhite;
      PrCNPJ.SetFocus;
    end
    else
    begin
      PrCPF.Color := clred;
      PrCPF.Font.Color := clwhite;
      PrCPF.SetFocus;
    end;
  end
  else
  begin
    if rgTipoPessoa.ItemIndex = 0 then
    begin
      PrCNPJ.Color := clwhite;
      PrCNPJ.Font.Color := clblack;
    end
    else
    begin
      PrCPF.Color := clwhite;
      PrCPF.Font.Color := clblack;
    end;
  end;

  if dao.q4.fieldbyname('ULTCONSSERASA_OK').AsString = 'F' then
  begin
    PrUltConsSerasa.Color := clred;
    PrUltConsSerasa.Font.Color := clwhite;
    PrUltConsSerasa.SetFocus;
  end
  else
  begin
    PrUltConsSerasa.Color := clwhite;
    PrUltConsSerasa.Font.Color := clblack;
  end;

  if dao.q4.fieldbyname('TELEFONE_OK').AsString = 'F' then
  begin
    PrTelefone.Color := clred;
    PrTelefone.Font.Color := clwhite;
    PrTelefone.SetFocus;
  end
  else
  begin
    PrTelefone.Color := clwhite;
    PrTelefone.Font.Color := clblack;
  end;

  if pos(' ', dao.q4.fieldbyname('TELEFONE').AsString) <> 0 then
  begin
    PrTelefone.Color := clred;
    PrTelefone.Font.Color := clwhite;
    PrTelefone.SetFocus;
  end
  else
  begin
    PrTelefone.Color := clwhite;
    PrTelefone.Font.Color := clblack;
  end;

  if dao.q4.fieldbyname('NR_ENDERECO_OK').AsString = 'F' then
  begin
    Prnr_endereco.Color := clred;
    Prnr_endereco.Font.Color := clwhite;
    Prnr_endereco.SetFocus;
  end
  else
  begin
    Prnr_endereco.Color := clwhite;
    Prnr_endereco.Font.Color := clblack;
  end;

  if dao.q4.fieldbyname('COD_CIDADE_OK').AsString = 'F' then
  begin
    PrCod_Cidade.Color := clred;
    PrCod_Cidade.Font.Color := clwhite;
    PrCod_Cidade.SetFocus;
  end
  else
  begin
    PrCod_Cidade.Color := clwhite;
    PrCod_Cidade.Font.Color := clblack;
  end;

  /// /
  if dao.q4.fieldbyname('RAZAO_SOCIAL_OK').AsString = 'F' then
  begin
    PrNom_Cliente.Color := clred;
    PrNom_Cliente.Font.Color := clwhite;
    PrNom_Cliente.SetFocus;
  end
  else
  begin
    PrNom_Cliente.Color := clwhite;
    PrNom_Cliente.Font.Color := clblack;
  end;

  if pos(' ', dao.q4.fieldbyname('NOM_CLIENTE').AsString) = 1 then
  begin
    PrNom_Cliente.Color := clred;
    PrNom_Cliente.Font.Color := clwhite;
    PrNom_Cliente.SetFocus;
  end
  else
  begin
    PrNom_Cliente.Color := clwhite;
    PrNom_Cliente.Font.Color := clblack;
  end;

  if dao.q4.fieldbyname('ENDERECO_OK').AsString = 'F' then
  begin
    PrEndereco.Color := clred;
    PrEndereco.Font.Color := clwhite;
    PrEndereco.SetFocus;
  end
  else
  begin
    PrEndereco.Color := clwhite;
    PrEndereco.Font.Color := clblack;
  end;

  if dao.q4.fieldbyname('BAIRRO_OK').AsString = 'F' then
  begin
    PrBairro.Color := clred;
    PrBairro.Font.Color := clwhite;
    PrBairro.SetFocus;
  end
  else
  begin
    PrBairro.Color := clwhite;
    PrBairro.Font.Color := clblack;
  end;

  if dao.q4.fieldbyname('CEP_OK').AsString = 'F' then
  begin
    PrCep.Color := clred;
    PrCep.Font.Color := clwhite;
    PrCep.SetFocus;
  end
  else
  begin
    PrCep.Color := clwhite;
    PrCep.Font.Color := clblack;
  end;

  if pos('.', dao.q4.fieldbyname('CEP').AsString) <> 0 then
  begin
    PrCep.Color := clred;
    PrCep.Font.Color := clwhite;
    PrCep.SetFocus;
  end
  else
  begin
    PrCep.Color := clwhite;
    PrCep.Font.Color := clblack;
  end;

  if Length(dao.q4.fieldbyname('CEP').AsString) <> 9 then
  begin
    PrCep.Color := clred;
    PrCep.Font.Color := clwhite;
    PrCep.SetFocus;
  end
  else
  begin
    PrCep.Color := clwhite;
    PrCep.Font.Color := clblack;
  end;

  /// ///////////

end;

procedure TFr_Cliente.dgVisitasCellClick(Column: TColumn);
begin
  ChecaVisitasEnviadas;
end;

procedure TFr_Cliente.dgVisitasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
  IsChecked: array [Boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
begin

  if (mmVisitasENVIADO.Value = true) then
  begin
    dgVisitas.Canvas.Font.Color := clGrayText;
    if gdSelected in State then
    begin
      dgVisitas.Canvas.Brush.Color := clGrayText;
      dgVisitas.Canvas.Font.Color := clwhite;
    end;
  end
  else
  begin
    dgVisitas.Canvas.Font.Color := clNavy;
    if gdSelected in State then
    begin
      dgVisitas.Canvas.Brush.Color := clNavy;
      dgVisitas.Canvas.Font.Color := clwhite;
    end;
  end;

  dgVisitas.DefaultDrawDataCell(Rect, Column.Field, State);

  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = DBCheckBox2.DataField) then
    begin
      DBCheckBox2.Left := Rect.Left + dgVisitas.Left + 2;
      DBCheckBox2.Top := Rect.Top + dgVisitas.Top + 2;
      DBCheckBox2.Width := Rect.Right - Rect.Left;
      DBCheckBox2.Height := Rect.Bottom - Rect.Top;

      DBCheckBox2.Visible := true;
    end;

  end
  else
  begin

    if (Column.Field.FieldName = DBCheckBox2.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := IsChecked[Column.Field.AsBoolean];

      dgVisitas.Canvas.FillRect(Rect);
      DrawFrameControl(dgVisitas.Canvas.Handle, DrawRect, DFC_BUTTON, DrawState);
    end;
  end;

end;

procedure TFr_Cliente.ChecaVisitasEnviadas;
begin
  BtAlterarVisitas.Enabled := mmVisitasENVIADO.Value <> true;
  BtExcluirVisitas.Enabled := mmVisitasENVIADO.Value <> true;
end;

procedure TFr_Cliente.dgVisitasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  ChecaVisitasEnviadas;
end;

procedure TFr_Cliente.dgVisitasKeyPress(Sender: TObject; var Key: Char);
begin
  ChecaVisitasEnviadas;
end;

procedure TFr_Cliente.dgVisitasKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  ChecaVisitasEnviadas;
end;

procedure TFr_Cliente.ativa_cliente(id: string);
begin
  with q_cliente do
  begin
    Close;
    sql.clear;
    sql.Add('select a.COD_CLIENTE, a.SUSPENSAO_PIS_CONFINS, a.celular, a.UltConsSerasa, a.DTA_CAD, a.PRI_COMPRA, a.NOM_CLIENTE, a.NOM_FANTASIA, a.EMAIL_END_NFE, ' +
      'a.ENDERECO, a.CONSTRUTORA, a.COMPLEMENTO, a.PROXIMO, a.BAIRRO, a.CEP, a.COD_CIDADE, a.TIP_PESSOA, a.consumidor_final, ' +
      'a.TELEFONE, a.EMAIL, a.AVISO, a.CNPJ, a.IE, a.IM, a.PROD_RURAL, a.CONTATO, a.FONE_CONTATO, a.operadora, ' +
      'a.LIMITE, a.CPF, a.RG, a.NATURALIDADE, a.EST_CIVIL, a.PAI, a.MAE, a.TIP_RESIDENCIA, a.ALUGUEL, a.pronautica, a.proemprego, ' +
      'a.EMPRESA, a.END_TRACLI, a.BAIRRO_TRABALHO, a.CID_TRABALHO, a.FONE_TRABALHO, a.CARGO, a.SALARIO, ' +
      'a.NOM_CONJUGUE, a.EMP_CONJ, a.END_EMP_CONJ, a.CID_EMP_CONJ, a.FONE_EMP_CONJ, a.CARGO_CONJ, ' +
      'a.NOM_REF1, a.FONE_REF1, a.OBS_REF1, a.NOM_REF2, a.FONE_REF2, a.OBS_REF2, a.CAD_SPC, a.DTA_CAD_SPC, ' +
      'a.DTA_ANIVERSARIO, a.ACEITA_NOTA_SIMPLES, a.OBSERVACOES, a.FAX, a.MANEQUIM, a.CALCADO, a.COR_PREFERIDA, ' +
      'a.CONTATO_PREFERIDO, a.ESTILO, a.CONTATO_FONE, a.CONTATO_EMAIL, a.CONTATO_CORRESPONDENCIA, ' +
      'a.ID_ANTIGO, a.PONTO_FIDELIDADE, a.ID_REPRESENTANTE, a.ID_FOP, a.PRAZO_MAXIMO, a.DESCONTO_MAXIMO, a.desconto_especial, ' +
      'a.CLIENTE_BLOQUEADO, a.STATUS, a.COD_EMPRESA, a.NR_ENDERECO, a.NFE_EMAIL, a.SINCRONIZAR_PALM, a.EMAIL_ADICIONAL1, EMAIL_ADICIONAL2, EMAIL_ADICIONAL3, ' +
      'a.WHASTAPP, a.PRE_CADASTRO, c.nom_cidade, ct.nom_cidade as cid_trabalho, cj.nom_cidade as cid_trab_conj, a.saldo from cliente a ' +
      'left join cidades c on c.cod_cidade = a.cod_cidade ' +
      'left join cidades ct on ct.cod_cidade = a.cid_trabalho ' +
      'left join cidades cj on cj.cod_cidade = a.cid_emp_conj ' +
      'where a.cod_cliente=' + quotedstr(id));
    Open;
  end;

end;

procedure TFr_Cliente.limpa_campos(prefixo: ShortString);
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
      else if Components[i] is TsDateEdit then
        TsDateEdit(Components[i]).clear
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(Components[i]).clear
      else if Components[i] is TComboBox then
        TComboBox(Components[i]).ItemIndex := 0
      else if Components[i] is TsMaskEdit then
        TsMaskEdit(Components[i]).clear;

      LbNom_cidade.Caption := '...';
      Lbcid_trabalho.Caption := '...';
      Lbcid_emp_conj.Caption := '...';

    end;
  end;

end;

procedure TFr_Cliente.readonly_true(prefixo: ShortString);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if copy(Components[i].Name, 1, 2) = prefixo then
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
      else if Components[i] is TsMaskEdit then
        TsMaskEdit(Components[i]).ReadOnly := true;

    end;
  end;

end;

procedure TFr_Cliente.readonly_false(prefixo: ShortString);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if copy(Components[i].Name, 1, 2) = prefixo then
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
      else if Components[i] is TsMaskEdit then
        TsMaskEdit(Components[i]).ReadOnly := false;
    end;
  end;

end;

procedure TFr_Cliente.PrNom_ClienteKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;
end;

procedure TFr_Cliente.PrCod_CidadeButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Cidade';

  chamou_pesquisa := 'fr_cidades';
  chamou_form := 'fr_cliente_cidade';
  chamou_cadastro := 'fr_cidade';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cidades';

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

procedure TFr_Cliente.PrCid_emp_ConjButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Cidade';

  chamou_pesquisa := 'fr_cidades';
  chamou_form := 'fr_cliente_cidade_trab_conj';
  chamou_cadastro := 'fr_cidade';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cidades';

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

procedure TFr_Cliente.Prcid_trabalhoButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Cidade';

  chamou_pesquisa := 'fr_cidades';
  chamou_form := 'fr_cliente_cidade_trab';
  chamou_cadastro := 'fr_cidade';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cidades';

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

procedure TFr_Cliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    Close;

  if (ActiveControl.Name = 'PrAviso') or (ActiveControl.Name = 'PrObservacoes') then
    exit;

  if Key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TFr_Cliente.FormShow(Sender: TObject);
begin
  readonly_true('Pr');
  limpa_campos('Pr');
  habilitaCamposAreaAtuacao(area_atuacao);

  if (frpri.TipUsu = '0') or (frpri.TipUsu = '1') then
    BtExc.Visible := false;

  if dados_incompletos then
  begin
    ativa_cliente(cliente);
    mostra_campos('Pr');
    BtAltClick(self);
    ChecarDadosIncompletos;
  end;

  TabLimite.TabVisible := frpri.TipUsu = '9';
  lbDescMaximo.Visible := frpri.TipUsu = '9';
  Prdesconto_maximo.Visible := frpri.TipUsu = '9';
  Prcliente_bloqueado.Visible := frpri.TipUsu = '9';

  if frpri.modulo_vendedor and frpri.representacao then
  begin
    gbDados.Enabled := false;
    tab_perfil.TabVisible := false;
    TabLimite.TabVisible := false;
    BtNov.Visible := false;
    TabVisitas.TabVisible := true;
    tab_dados.TabVisible := true;
    Pgcliente.ActivePage := tab_dados;
    Refresh;
  end;

end;

procedure TFr_Cliente.PrCPFExit(Sender: TObject);
var
  passou: Boolean;
begin
  if ActiveControl.Name = 'BtCan' then
    exit;

  if PrCPF.Text = '   .   .   -  ' then
    exit;

  // tipos de documentos:  docCPF,docCNPJ, docInscEst,docCEP,docNumCheque
  if BtNov.Enabled = false then
  begin
    { passou := frpri.valida_doc(PrCPF.Text, docCPF);
      if not(passou) then
      begin
      dao.msg('CPF inválido!');
      PrCPF.SetFocus;
      end; }

    if not VerificaCPFCadastrados(PrCPF.Text, PrCod_Cliente.Text) then
      PrCPF.SetFocus;
  end;
end;

procedure TFr_Cliente.PrCNPJExit(Sender: TObject);
var
  passou: Boolean;
begin
  if ActiveControl.Name = 'BtCan' then
    exit;

  if PrCNPJ.Text = '  .   .   /    -  ' then
    exit;

  // tipos de documentos:  docCPF,docCNPJ, docInscEst,docCEP,docNumCheque
  if BtNov.Enabled = false then
  begin
    (* passou := frpri.valida_doc(PrCNPJ.Text, docCNPJ);
      if not(passou) then
      begin
      dao.msg('CNPJ inválido!');
      PrCNPJ.SetFocus;
      end; *)
    if not VerificaCNPJCadastrados(PrCNPJ.Text, PrCod_Cliente.Text) then
      PrCNPJ.SetFocus;
  end;
end;

function TFr_Cliente.VerificaCNPJCadastrados(cnpj, cliente: string): Boolean;
begin
  if cliente = '' then
    cliente := '0';
  dao.Geral1('select count(*) as total from cliente b where trim(b.cnpj) <> ''.   .   /    -'' and b.cnpj = ' + quotedstr(cnpj) + ' and b.cod_cliente <> ' + quotedstr(cliente));
  if (dao.Q1.fieldbyname('total').AsInteger > 0) then
  begin
    showmessage('CNPJ já Cadastrado!');
    Result := false;
  end
  else
    Result := true;
end;

function TFr_Cliente.VerificaCPFCadastrados(cpf, cliente: string): Boolean;
begin
  if cliente = '' then
    cliente := '0';
  dao.Geral1('select count(*) as total from cliente b where TRIM(b.CPF) <> ''.   .   -'' AND b.cpf = ' + quotedstr(cpf) + ' and b.cod_cliente <> ' + quotedstr(cliente));
  if (dao.Q1.fieldbyname('total').AsInteger > 0) then
  begin
    showmessage('CPF já Cadastrado!');
    Result := false;
  end
  else
    Result := true;
end;

procedure TFr_Cliente.PrIEExit(Sender: TObject);
var
  passou: Boolean;
begin
  // tipos de documentos:  docCPF,docCNPJ, docInscEst,docCEP,docNumCheque
  { if PrIE.text <> '' then
    begin
    passou:= FRPRI.valida_doc(PrCep.Text, docInscEst);
    if not(passou) then
    begin
    dao.msg('Inscrição Estadual inválida!');
    PrIE.SetFocus;
    end;
    end; }

end;

procedure TFr_Cliente.BitBtn2Click(Sender: TObject);
begin
  { if fmfun.BuscaDadosPorCNPJ(PrCPF.Text, uf, false) then
    begin
    with fmfun.ACBrConsultaCPF1 do
    begin
    PrNom_Cliente.Text := Nome;
    PrAviso.Lines.Add('Situação: ' + Situacao);
    end;
    end;

  }

  dao.TestaConexao;
  ActiveControl := nil;
  ShellExecute(Handle, 'open', pchar('http://www.receita.fazenda.gov.br/Aplicacoes/ATCTA/CPF/ConsultaPublica.asp'), nil, nil, Sw_ShowNormal);

  { dao.TestaConexao;
    activecontrol := nil;
    ShellExecute(handle, 'open',
    pchar('http://www.receita.fazenda.gov.br/PessoaJuridica/CNPJ/cnpjreva/Cnpjreva_Solicitacao.asp'), nil, nil, Sw_ShowNormal);
  }

end;

procedure TFr_Cliente.BitBtn4Click(Sender: TObject);
var
  z: Integer;
  RazaoSocial, Fantasia, CEP, Endereco, Numero, Complemento, Bairro, CIDADE, uf, EmpresaTipo, Situacao: string;
begin
  dao.TestaConexao;
  ActiveControl := nil;
  { ShellExecute(handle, 'open', pchar('http://www.receita.fazenda.gov.br/pessoajuridica/cnpj/cnpjreva/cnpjreva_solicitacao.asp'), nil, nil,
    Sw_ShowNormal); }

  FMFUN.BuscaDadosPorCNPJJson(PrCNPJ.Text, RazaoSocial, Fantasia, CEP, Endereco, Numero, Complemento, Bairro, CIDADE, UF, EmpresaTipo, Situacao);

  PrNom_Cliente.Text := RazaoSocial;
  PrNom_Fantasia.Text := Fantasia;
  PrCep.Text := FMFUN.FormataCEP(CEP);
  PrEndereco.Text := Endereco;
  Prnr_endereco.Text := Numero;
  PrComplemento.Text := Complemento;
  PrBairro.Text := Bairro;

  dao.Geral2('select COD_CIDADE, NOM_CIDADE, UF from cidades where UF = ''' + UF + ''' AND NOM_cidade = ' + quotedstr(CIDADE));

  if dao.q2.RecordCount > 0 then
  begin
    LbNom_cidade.Caption := dao.q2.fieldbyname('NOM_CIDADE').AsString + '-' + dao.q2.fieldbyname('UF').AsString;
    PrCod_Cidade.Text := dao.q2.fieldbyname('cod_CIDADE').AsString;
  end;

  PrAviso.Lines.Add('Tipo: ' + EmpresaTipo);
  PrAviso.Lines.Add('Situaçao: ' + Situacao);
  {
    UF := '';
    if FMFUN.BuscaDadosPorCNPJ(PrCNPJ.Text, UF, true) then
    begin
    UF := FMFUN.ACBrNFe1.WebServices.ConsultaCadastro.UF;

    with FMFUN.ACBrConsultaCNPJ1 do
    begin
    PrNom_Cliente.Text := RazaoSocial;
    PrNom_Fantasia.Text := Fantasia;
    PrCep.Text := FMFUN.FormataCEP(CEP);
    PrEndereco.Text := Endereco;
    Prnr_endereco.Text := Numero;
    PrComplemento.Text := Complemento;
    PrBairro.Text := Bairro;
    dao.Geral2('select COD_CIDADE, NOM_CIDADE, UF from cidades where UF = '''
    + UF + ''' AND NOM_cidade = ' + quotedstr(CIDADE));

    if dao.q2.RecordCount > 0 then
    begin
    LbNom_cidade.Caption := dao.q2.fieldbyname('NOM_CIDADE').AsString + '-'
    + dao.q2.fieldbyname('UF').AsString;
    PrCod_Cidade.Text := dao.q2.fieldbyname('cod_CIDADE').AsString;
    end;

    PrAviso.Lines.Add('Tipo: ' + EmpresaTipo);
    PrAviso.Lines.Add('Situaçao: ' + Situacao);

    end;
    {    try
    z := FMFUN.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.count;
    with FMFUN.ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[z - 1] do
    begin
    PrIE.Text := FormatMaskText(FMFUN.FormataIE(UF) + ';0', IE);
    PrAviso.Lines.Add('IE CNAE: ' + IntToStr(CNAE));
    PrAviso.Lines.Add('IE Regime de Apuração: ' + xRegApur);

    if dIniAtiv <> 0 then
    PrAviso.Lines.Add('IE Início das Atividades: ' +
    formatdatetime('IE dd/mm/yyyy', dIniAtiv));
    if dBaixa <> 0 then
    PrAviso.Lines.Add('IE Data da Baixa: ' +
    formatdatetime('dd/mm/yyyy', dBaixa));
    end;
    except

    end; }
  // end;
end;

procedure TFr_Cliente.BitBtn5Click(Sender: TObject);
begin
  dao.TestaConexao;
  ActiveControl := nil;
  ShellExecute(Handle, 'open', pchar('http://www.sintegra.gov.br'), nil, nil, Sw_ShowNormal);

end;

procedure TFr_Cliente.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if BtGra.Enabled = true then
  begin
    MessageBox(Handle, 'Você deve Gravar ou Cancelar as Informações Antes de Sair!', 'ORBI', MB_ICONWARNING);
    CanClose := false;
  end
  else
  begin
    CanClose := true;
  end;

end;

procedure TFr_Cliente.PrEst_CivilEnter(Sender: TObject);
begin
  if (not BtGra.Enabled) then
    SelectNext(Sender as TWinControl, true, true);

end;

procedure TFr_Cliente.PrCad_SPCEnter(Sender: TObject);
begin
  if (not BtGra.Enabled) then
    SelectNext(Sender as TWinControl, true, true);

end;

procedure TFr_Cliente.PrCod_CidadeKeyPress(Sender: TObject; var Key: Char);
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
    if (PrCod_Cidade.Text = '') and (BtNov.Enabled = false) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Cidade';

      chamou_pesquisa := 'fr_cidades';
      chamou_form := 'fr_cliente_cidade';
      chamou_cadastro := 'fr_cidade';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cidades';

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
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;

end;

procedure TFr_Cliente.Prcid_trabalhoKeyPress(Sender: TObject; var Key: Char);
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
    if (Prcid_trabalho.Text = '') and (BtNov.Enabled = false) then
    begin

      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Cidade';

      chamou_pesquisa := 'fr_cidades';
      chamou_form := 'fr_cliente_cidade_trab';
      chamou_cadastro := 'fr_cidade';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cidades';

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
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;

end;

procedure TFr_Cliente.PrCid_emp_ConjKeyPress(Sender: TObject; var Key: Char);
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
    if (PrCid_emp_Conj.Text = '') and (BtNov.Enabled = false) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      // guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Cidade';

      chamou_pesquisa := 'fr_cidades';
      chamou_form := 'fr_cliente_cidade_trab_conj';
      chamou_cadastro := 'fr_cidade';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cidades';

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

      Fr_localizar.ShowModal;
      Fr_localizar.free;

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;
    end;
    SelectNext(Sender as TWinControl, true, true);
    Key := #0;
  end;
end;

procedure TFr_Cliente.PrNom_FantasiaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    PrEndereco.SetFocus;
    Key := #0;
  end;

end;

procedure TFr_Cliente.RelaodeClientes1Click(Sender: TObject);
begin
  Application.CreateForm(TFr_opc_relatorios, Fr_opc_relatorios);
  tipo_relatorio := 'relatorio_cliente';
  Fr_opc_relatorios.ShowModal;

end;

procedure TFr_Cliente.EtiquetasparaMalaDireta1Click(Sender: TObject);
begin
  // Application.CreateForm(Tfr_etiqueta_empresa, fr_etiqueta_empresa);
  // tipo_relatorio:='etiqueta_cliente';
  // Fr_opc_etiqueta.ShowModal;
  // fr_etiqueta_empresa.Rl_etiqueta_empresa.Preview;

  Application.CreateForm(TFr_opc_etiqueta, Fr_opc_etiqueta);
  tipo_relatorio := 'etiqueta_cliente';
  Fr_opc_etiqueta.ShowModal;
end;

procedure TFr_Cliente.atualiza_cadastro_cliente_lojas;
begin
  dao.Geral1('select cod_empresa, ip_valido from empresa where cod_empresa <> ' + quotedstr(cod_empresa) + ' and cod_empresa <>' + quotedstr('1'));

  dao.Q1.First;
  while not(dao.Q1.Eof) do
  begin
    if dao.Q1.fieldbyname('ip_valido').AsString <> '' then
    begin
      dao.Configura_CN_NET(dao.Q1.fieldbyname('cod_empresa').AsString);
     // //if not(dao.cn_net.InTransaction) then
        dao.cn_net.StartTransaction;
      dao.Geral1_NET('select cod_cliente from cliente where cod_cliente=' + quotedstr(PrCod_Cliente.Text));

      if dao.q1_net.RecordCount < 0 then
        dao.insert_net('Pr', 'cliente', 'cod_cliente', Fr_Cliente, 'gen_cliente')
      else
        dao.update_net('cliente', 'cod_cliente', q_cliente.fieldbyname('cod_cliente').AsString, 'Pr', Fr_Cliente);

      dao.cn_net.Commit;
    end;
    dao.Q1.Next;
  end;

end;

procedure TFr_Cliente.habilitaCamposAreaAtuacao(CodAtuacao: string);
begin
  if CodAtuacao = '0' then // comercio de vestuarios
  begin

  end
  else if CodAtuacao = '3' then // distribuidora
  begin
    Pgcliente.Pages[1].TabVisible := false;
  end;

end;

procedure TFr_Cliente.Prid_representanteButtonClick(Sender: TObject);
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
  chamou_form := 'fr_cliente_representante';
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

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_Cliente.Prid_representanteExit(Sender: TObject);
begin
  if trim(Prid_representante.Text) = '' then
    Lbnom_representante.Caption := '...';

  if Prid_representante.Text <> '' then
  begin

    if (not FMFUN.verificaNumerico(Prid_representante.Text)) and (Length(Prid_representante.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      Prid_representante.SetFocus;
      exit;
    end;

    dao.Geral2('select nom_representante, funcionario from representante where id=' + quotedstr(Prid_representante.Text));
    if dao.q2.RecordCount > 0 then
      Lbnom_representante.Caption := dao.q2.fieldbyname('nom_representante').AsString
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prid_representante.Text := '';
      Prid_representante.SetFocus;
      exit;
    end;
  end;
end;

procedure TFr_Cliente.BtBuscaEndClick(Sender: TObject);
begin
  if trim(PrCep.Text) = '-' then
  begin
    showmessage('Informe o CEP!!');
    PrCep.SetFocus;
    exit;
  end;

  ACBrCEP1.BuscarPorCEP(PrCep.Text);

  PrEndereco.SetFocus;
end;

procedure TFr_Cliente.PrCod_CidadeExit(Sender: TObject);
begin
  if trim(PrCod_Cidade.Text) <> '' then
  begin
    if (not FMFUN.verificaNumerico(PrCod_Cidade.Text)) and (Length(PrCod_Cidade.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      PrCod_Cidade.SetFocus;
      exit;
    end;

    dao.Geral2('select NOM_CIDADE, UF from cidades where cod_cidade = ' + quotedstr(PrCod_Cidade.Text));

    if dao.q2.RecordCount > 0 then
    begin
      LbNom_cidade.Caption := dao.q2.fieldbyname('NOM_CIDADE').AsString + '-' + dao.q2.fieldbyname('UF').AsString;
      CIDADE := dao.q2.fieldbyname('NOM_CIDADE').AsString;
      UF := dao.q2.fieldbyname('uf').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      PrCod_Cidade.Text := '';
      PrCod_Cidade.SetFocus;
      LbNom_cidade.Caption := '...';
      exit;
    end;
  end
  else
    LbNom_cidade.Caption := '...';
end;

procedure TFr_Cliente.BtBuscaCEPClick(Sender: TObject);
begin
  dao.TestaConexao;
  ActiveControl := nil;
  ShellExecute(Handle, 'open', pchar('http://www.correios.com.br/'), nil, nil, Sw_ShowNormal);
end;


procedure TFr_Cliente.PrCNPJKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  valor: string;
begin

  valor := stringreplace(PrCNPJ.Text, '.', '', [rfReplaceAll]);
  valor := stringreplace(valor, '/', '', [rfReplaceAll]);
  valor := stringreplace(valor, '-', '', [rfReplaceAll]);

  if (Key = vk_back) and (trim(valor) = '') then
    PrCNPJ.clear;
end;

procedure TFr_Cliente.PrFone_ContatoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  valor: string;
begin
  valor := stringreplace(PrFone_Contato.Text, '.', '', [rfReplaceAll]);
  valor := stringreplace(valor, '/', '', [rfReplaceAll]);
  valor := stringreplace(valor, '-', '', [rfReplaceAll]);

  if (Key = vk_back) and (trim(valor) = '') then
    PrFone_Contato.clear;
end;

procedure TFr_Cliente.PrTelefoneKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  valor: string;
begin
  valor := stringreplace(PrTelefone.Text, '.', '', [rfReplaceAll]);
  valor := stringreplace(valor, '/', '', [rfReplaceAll]);
  valor := stringreplace(valor, '-', '', [rfReplaceAll]);

  if (Key = vk_back) and (trim(valor) = '') then
    PrTelefone.clear;
end;

procedure TFr_Cliente.PrWHASTAPPKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  valor: string;
begin
  valor := stringreplace(PrWHASTAPP.Text, '.', '', [rfReplaceAll]);
  valor := stringreplace(valor, '/', '', [rfReplaceAll]);
  valor := stringreplace(valor, '-', '', [rfReplaceAll]);

  if (Key = vk_back) and (trim(valor) = '') then
    PrWHASTAPP.clear;
end;

procedure TFr_Cliente.PrCepKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  valor: string;
begin
  valor := stringreplace(PrCep.Text, '.', '', [rfReplaceAll]);
  valor := stringreplace(valor, '/', '', [rfReplaceAll]);
  valor := stringreplace(valor, '-', '', [rfReplaceAll]);

  if (Key = vk_back) and (trim(valor) = '') then
    PrCep.clear;
end;

procedure TFr_Cliente.PrCPFKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  valor: string;
begin
  valor := stringreplace(PrCPF.Text, '.', '', [rfReplaceAll]);
  valor := stringreplace(valor, '/', '', [rfReplaceAll]);
  valor := stringreplace(valor, '-', '', [rfReplaceAll]);

  if (Key = vk_back) and (trim(valor) = '') then
    PrCPF.clear;
end;

procedure TFr_Cliente.PrFone_TrabalhoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  valor: string;
begin
  valor := stringreplace(PrFone_Trabalho.Text, '.', '', [rfReplaceAll]);
  valor := stringreplace(valor, '/', '', [rfReplaceAll]);
  valor := stringreplace(valor, '-', '', [rfReplaceAll]);

  if (Key = vk_back) and (trim(valor) = '') then
    PrFone_Trabalho.clear;
end;

procedure TFr_Cliente.PrDta_aniversarioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  valor: string;
begin
  valor := stringreplace(PrDta_aniversario.Text, '.', '', [rfReplaceAll]);
  valor := stringreplace(valor, '/', '', [rfReplaceAll]);
  valor := stringreplace(valor, '-', '', [rfReplaceAll]);

  if (Key = vk_back) and (trim(valor) = '') then
    PrDta_aniversario.clear;
end;

procedure TFr_Cliente.PrFone_Emp_ConjKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  valor: string;
begin
  valor := stringreplace(PrFone_Emp_Conj.Text, '.', '', [rfReplaceAll]);
  valor := stringreplace(valor, '/', '', [rfReplaceAll]);
  valor := stringreplace(valor, '-', '', [rfReplaceAll]);

  if (Key = vk_back) and (trim(valor) = '') then
    PrFone_Emp_Conj.clear;
end;

procedure TFr_Cliente.PrFone_Ref1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  valor: string;
begin
  valor := stringreplace(PrFone_Ref1.Text, '.', '', [rfReplaceAll]);
  valor := stringreplace(valor, '/', '', [rfReplaceAll]);
  valor := stringreplace(valor, '-', '', [rfReplaceAll]);

  if (Key = vk_back) and (trim(valor) = '') then
    PrFone_Ref1.clear;
end;

procedure TFr_Cliente.PrFone_Ref2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  valor: string;
begin
  valor := stringreplace(PrFone_Ref2.Text, '.', '', [rfReplaceAll]);
  valor := stringreplace(valor, '/', '', [rfReplaceAll]);
  valor := stringreplace(valor, '-', '', [rfReplaceAll]);

  if (Key = vk_back) and (trim(valor) = '') then
    PrFone_Ref2.clear;
end;

procedure TFr_Cliente.PrDta_Cad_SPCKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  valor: string;
begin
  valor := stringreplace(PrDta_Cad_SPC.Text, '.', '', [rfReplaceAll]);
  valor := stringreplace(valor, '/', '', [rfReplaceAll]);
  valor := stringreplace(valor, '-', '', [rfReplaceAll]);

  if (Key = vk_back) and (trim(valor) = '') then
    PrDta_Cad_SPC.clear;
end;

procedure TFr_Cliente.rgTipoPessoaClick(Sender: TObject);
begin
  if rgTipoPessoa.ItemIndex = 0 then
  begin
    PrTip_pessoa.Text := 'J';
    PCCliente.ActivePageIndex := 0;
    PrCNPJ.SetFocus;
  end
  else
  begin
    PCCliente.ActivePageIndex := 1;
    PrTip_pessoa.Text := 'F';
    PrConsumidor_Final.Checked := true;
    PrCPF.SetFocus;
  end;
end;

procedure TFr_Cliente.ACBrCEP1BuscaEfetuada(Sender: TObject);
var
  i: Integer;
begin
  if ACBrCEP1.Enderecos.count < 1 then
    showmessage('Endereço não Encontrado.')
  else
  begin
    for i := 0 to ACBrCEP1.Enderecos.count - 1 do
    begin
      with ACBrCEP1.Enderecos[i] do
      begin
        PrEndereco.Text := trim(Tipo_Logradouro + ' ' + Logradouro);
        PrComplemento.Text := Complemento;
        PrBairro.Text := Bairro;
        PrCod_Cidade.Text := COPY(IBGE_Municipio, 1, 6);
        PrCod_CidadeExit(Self);
      end;
    end;
  end;
end;

procedure TFr_Cliente.BtnSimplesClick(Sender: TObject);
begin
  dao.TestaConexao;
  ActiveControl := nil;
  ShellExecute(Handle, 'open', pchar('http://www8.receita.fazenda.gov.br/SIMPLESNACIONAL/aplicacoes.aspx?id=21'), nil, nil, Sw_ShowNormal);

end;

procedure TFr_Cliente.BtSalvarVisitasClick(Sender: TObject);
begin
  if (trim(edValorVisita.Text) = '') or (edValorVisita.Value = 0) then
    mmVisitasValor.Value := 0;

  mmVisitas.Post;

  BtSalvarVisitas.Enabled := false;
  BtCancelarVisitas.Enabled := false;
  BtAlterarVisitas.Enabled := true;
  BtExcluirVisitas.Enabled := true;
  BtNovoVisitas.Enabled := true;

end;

procedure TFr_Cliente.CarregarMapa;
var
  ConsultaEndereco: string;
begin
  ConsultaEndereco := 'GoogleMaps.html?Address=';
  { if PrCep.Text <> '' then
    ConsultaEndereco := ConsultaEndereco + PrCep.Text; }
  { else begin }
  if CIDADE <> '' then
    ConsultaEndereco := ConsultaEndereco + CIDADE;
  if UF <> '' then
    ConsultaEndereco := ConsultaEndereco + ',' + UF;
  if PrEndereco.Text <> '' then
    ConsultaEndereco := ConsultaEndereco + ',' + PrEndereco.Text;
  if Prnr_endereco.Text <> '' then
    ConsultaEndereco := ConsultaEndereco + ',' + Prnr_endereco.Text;
  // end;

  ConsultaEndereco := stringreplace(ConsultaEndereco, ' ', '%', [rfReplaceAll]);

end;

procedure TFr_Cliente.BtnEmailClick(Sender: TObject);
begin
  dao.TestaConexao;
  ActiveControl := nil;
  ShellExecute(Handle, 'open', pchar('http://verify-email.org/'), nil, nil, Sw_ShowNormal);
end;

procedure TFr_Cliente.btnOperadoraClick(Sender: TObject);
begin
  dao.TestaConexao;
  ActiveControl := nil;
  ShellExecute(Handle, 'open', pchar('http://consultanumero.abr.net.br:8080/consultanumero/consulta/consultaSituacaoAtual'), nil, nil, Sw_ShowNormal);
end;

procedure TFr_Cliente.BtNovoBonificacaoClick(Sender: TObject);
begin
  BtGravarBonificacao.Enabled := true;
  BtCancBonificacao.Enabled := true;
  BtAltBonificacao.Enabled := false;
  BtExcBonificacao.Enabled := false;
  BtNovoBonificacao.Enabled := false;

  mmLimiteBonificacao.Append;
  edcodproduto.SetFocus;
end;

procedure TFr_Cliente.BtNovoVisitasClick(Sender: TObject);
begin
  BtSalvarVisitas.Enabled := true;
  BtCancelarVisitas.Enabled := true;
  BtAlterarVisitas.Enabled := false;
  BtExcluirVisitas.Enabled := false;
  BtNovoVisitas.Enabled := false;

  mmVisitas.Append;
  edDataVisitas.SetFocus;
  edValorVisita.Value := 0;
end;

procedure TFr_Cliente.BtAltBonificacaoClick(Sender: TObject);
begin
  BtGravarBonificacao.Enabled := true;
  BtCancBonificacao.Enabled := true;
  BtAltBonificacao.Enabled := false;
  BtExcBonificacao.Enabled := false;
  BtNovoBonificacao.Enabled := false;

  mmLimiteBonificacao.Edit;
  edcodproduto.SetFocus;
end;

procedure TFr_Cliente.BtGravarBonificacaoClick(Sender: TObject);
begin
  mmLimiteBonificacao.Post;

  BtGravarBonificacao.Enabled := false;
  BtCancBonificacao.Enabled := false;
  BtAltBonificacao.Enabled := true;
  BtExcBonificacao.Enabled := true;
  BtNovoBonificacao.Enabled := true;
end;

procedure TFr_Cliente.btGravarNCMClick(Sender: TObject);
begin

  mmNCM.Post;

  btGravarNCM.Enabled := false;
  btCancNCM.Enabled := false;
  btAltNCM.Enabled := true;
  btExcNCM.Enabled := true;
  btInsNCM.Enabled := true;

end;

procedure TFr_Cliente.btInsNCMClick(Sender: TObject);
begin
  btGravarNCM.Enabled := true;
  btCancNCM.Enabled := true;
  btAltNCM.Enabled := false;
  btExcNCM.Enabled := false;
  btInsNCM.Enabled := false;

  mmNCM.Append;

end;

procedure TFr_Cliente.BtCancBonificacaoClick(Sender: TObject);
begin
  mmLimiteBonificacao.cancel;

  BtGravarBonificacao.Enabled := false;
  BtCancBonificacao.Enabled := false;
  BtAltBonificacao.Enabled := true;
  BtExcBonificacao.Enabled := true;
  BtNovoBonificacao.Enabled := true;
end;

procedure TFr_Cliente.BtCancelarVisitasClick(Sender: TObject);
begin
  mmVisitas.cancel;

  BtSalvarVisitas.Enabled := false;
  BtCancelarVisitas.Enabled := false;
  BtAlterarVisitas.Enabled := true;
  BtExcluirVisitas.Enabled := true;
  BtNovoVisitas.Enabled := true;

end;

procedure TFr_Cliente.BtExcBonificacaoClick(Sender: TObject);
begin
  mmLimiteBonificacao.delete;

  BtGravarBonificacao.Enabled := false;
  BtCancBonificacao.Enabled := false;
  BtAltBonificacao.Enabled := true;
  BtExcBonificacao.Enabled := true;
  BtNovoBonificacao.Enabled := true;
end;

procedure TFr_Cliente.edcodprodutoButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: Integer;
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

    chamou_form := 'fr_cliente_produto';

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

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

    chamou_form := chamou_form_old;
    chamou_pesquisa := chamou_pesquisa_old;
  finally
    edcodprodutoExit(self);
  end;

end;

procedure TFr_Cliente.edcodprodutoExit(Sender: TObject);
  function VerificaProdutoRepetido: Boolean;
  begin
    dao.Geral4('SELECT a.COD_PRODUTO, a.COD_CLIENTE ' + 'FROM CLIENTE_PRODUTO a where a.cod_cliente = ' + PrCod_Cliente.Text + ' and a.cod_produto =' + quotedstr(edcodproduto.Text));
    Result := dao.q4.isempty;

  end;

begin
  if not(mmLimiteBonificacao.State in [dsInsert]) then
    exit;

  if edcodproduto.Text <> '' then
  begin
    dao.Geral2('select nom_produto from produto where cod_produto =' + quotedstr(edcodproduto.Text));
    if dao.q2.RecordCount > 0 then
    begin
      mmLimiteBonificacaonom_produto.AsString := dao.q2.fieldbyname('nom_produto').AsString;
      if not VerificaProdutoRepetido then
      begin
        dao.msg('Produto já Lançado neste Cliente!');
        edcodproduto.SetFocus;
        exit;
      end;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      edcodproduto.SetFocus;
      exit;
    end;
  end;

end;

procedure TFr_Cliente.edTrib_icmsChange(Sender: TObject);
begin
  mmNCMTRIB_ICMS.AsInteger := edTrib_icms.ItemIndex;
end;

end.
