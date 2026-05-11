unit Un_Fornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, Mask,
    ACBRValidador, Menus, ShellApi, ExtCtrls, 
  sPageControl, sPanel, sBitBtn, sLabel, sCheckBox,
  sGroupBox, sMaskEdit, sCustomComboEdit, sCurrEdit, sCurrencyEdit, sEdit, sToolEdit,
  sComboEdit, ACBrBase, ACBrSocket, ACBrCEP, sRadioButton, MaskUtils,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFr_fornecedor = class(TForm)
    PCFornecedor: TsPageControl;
    Tab_fornecedor: TsTabSheet;
    tab_contato: TsTabSheet;
    PREndereco: TsEdit;
    PRBairro: TsEdit;
    Label1: tsLabel;
    Label2: tsLabel;
    Label3: tsLabel;
    Label4: tsLabel;
    Label5: tsLabel;
    Label6: tsLabel;
    Label8: tsLabel;
    Label9: tsLabel;
    Label10: tsLabel;
    GroupBox2: TsGroupBox;
    zzDados_Contato: TsGroupBox;
    CFNom_contato: TsEdit;
    CFCargo_Contato: TsEdit;
    CFEmail_Contato: TsEdit;
    Label11: tsLabel;
    Label12: tsLabel;
    Label13: tsLabel;
    Label14: tsLabel;
    BtNov_Cont: TsBitBtn;
    BtAlt_Cont: TsBitBtn;
    BtGra_Cont: TsBitBtn;
    BtCan_Cont: TsBitBtn;
    BtExc_Cont: TsBitBtn;
    Label15: tsLabel;
    Label16: tsLabel;
    PREmail: TsEdit;
    PRHome_Page: TsEdit;
    ZZBt_Email: TsBitBtn;
    ZzBt_HomePage: TsBitBtn;
    CFFone_Contato: TMaskEdit;
    PRObservacao: TRichEdit;
    Q_fornecedor: TFDQuery;
    PRCod_cidade: TsComboEdit;
    PRCNPCPF: TMaskEdit;
    PRIERG: TMaskEdit;
    PRcep: TMaskEdit;
    PRfone: TMaskEdit;
    PRWhastApp: TMaskEdit;
    LbNom_cidade: tsLabel;
    gb1: TsGroupBox;
    CFcod_fornecedor: TsEdit;
    q_contato: TFDQuery;
    Panel1: tsPanel;
    Label7: tsLabel;
    Label17: tsLabel;
    Label18: tsLabel;
    Gbtipo: TsGroupBox;
    ZZjuridica: TsRadioButton;
    ZZfisica: TsRadioButton;
    PRCod_Fornecedor: TsEdit;
    PRRazao_Social: TsEdit;
    PRFantasia: TsEdit;
    tab_adicionais: TsTabSheet;
    GroupBox3: TsGroupBox;
    ZZempresa_simples: TsRadioButton;
    ZZempresa_epp: TsRadioButton;
    ZZempresa_grande_porte: TsRadioButton;
    PRuso_prepedido: tscheckbox;
    PRinativo: tscheckbox;
    Panel2: tsPanel;
    GroupBox1: TsGroupBox;
    Label19: tsLabel;
    PRlucro_definido: TsCurrencyEdit;
    btcalcula_preco_venda: TsBitBtn;
    Panel3: tsPanel;
    Lbcolecao: tsLabel;
    zzcod_colecao: TsComboEdit;
    lblcod_colecao: tsLabel;
    zzgiro: TsCurrencyEdit;
    Button1: TButton;
    q_giro: TFDQuery;
    q_loja_fornecedor: TFDQuery;
    Label20: tsLabel;
    Label30: tsLabel;
    PRComplemento: TsEdit;
    PRnr_endereco: TsEdit;
    PrNFE_EMAIL: tscheckbox;
    Panel4: tsPanel;
    BtNov: TsBitBtn;
    BtAlt: TsBitBtn;
    BtGra: TsBitBtn;
    BtCan: TsBitBtn;
    BtExc: TsBitBtn;
    BtLocalizar: TsBitBtn;
    BtBuscaEnd: TsBitBtn;
    BtBuscaCEP: TsBitBtn;
    ACBrCEP1: TACBrCEP;
    BtnBuscarCNPJ: TsBitBtn;
    ds_contato: TDataSource;
    ds_giro: TDataSource;
    ds_loja_fornecedor: TDataSource;
    IB_Grid1: TDBGrid;
    dg_contato: TDBGrid;
    procedure BtGraClick(Sender: TObject);
    procedure BtNovClick(Sender: TObject);
    procedure BtAltClick(Sender: TObject);
    procedure BtCanClick(Sender: TObject);
    procedure BtExcClick(Sender: TObject);
    procedure PRRazao_SocialKeyPress(Sender: TObject; var Key: Char);
    procedure PRFantasiaKeyPress(Sender: TObject; var Key: Char);
    procedure BtLocalizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PRCod_cidadeButtonClick(Sender: TObject);
    procedure BtNov_ContClick(Sender: TObject);
    procedure BtAlt_ContClick(Sender: TObject);
    procedure BtGra_ContClick(Sender: TObject);
    procedure BtCan_ContClick(Sender: TObject);
    procedure BtExc_ContClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure PRCNPCPFExit(Sender: TObject);
    procedure ZZBt_EmailClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ZZfisicaClick(Sender: TObject);
    procedure ZZjuridicaClick(Sender: TObject);
    procedure ZzBt_HomePageClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure zzcod_colecaoButtonClick(Sender: TObject);
    procedure zzcod_colecaoExit(Sender: TObject);
    procedure zzcod_colecaoKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure zzcod_empresaButtonClick(Sender: TObject);
    procedure PRCod_cidadeExit(Sender: TObject);
    procedure BtBuscaEndClick(Sender: TObject);
    procedure BtBuscaCEPClick(Sender: TObject);
    procedure PRcepKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PRfoneKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PRWhastAppKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PRCNPCPFKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CFFone_ContatoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ACBrCEP1BuscaEfetuada(Sender: TObject);
    procedure BtnBuscarCNPJClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    modo_insert, modo_insert_con, xml_nfe: Boolean;
    lucro_padrao_anterior: real;
    id, xml_razao_socia, xml_cnpj, xml_nome_fantasia, xml_ie, xml_endereco, xml_nr, xml_cep, xml_bairro, xml_cidade, xml_uf, xml_fone: string;

    busca_qualquer_posicao_pesquisada: boolean;
    campo_pesquisado, dado_pesquisado: string;

    procedure mostra_campos(prefixo: ShortString);
    procedure mostra_campos_contato(prefixo: ShortString);
    procedure ativa_fornecedor(id: string); //carrega a query q_fornecedor
    procedure ativa_fornecedor_contato(id: string); //carrega a query q_fornecedor_contato
    procedure carrega_contato(id: string); //carrega todos os contatos com o nr do fornecedor informado
    procedure limpa_campos(prefixo: ShortString);
    procedure readonly_true(prefixo: ShortString);
    procedure readonly_false(prefixo: ShortString);

    procedure recalcula_preco_venda(cod_fornecedor: string);
    procedure Atualiza_cadastro_fornecedor_lojas; //Atualiza pela internet o cadastro de produtos para as lojas

  end;

var
  Fr_fornecedor: TFr_fornecedor;

implementation

uses Un_dao, UnPri, Un_cidade, Un_localizar, UnFun, Un_dm;

{$R *.dfm}

{ TFr_fornecedor }

procedure TFr_fornecedor.ativa_fornecedor(id: string);
begin
  with q_fornecedor do
  begin
    close;
    sql.clear;
    sql.add('select a.COD_FORNECEDOR, a.RAZAO_SOCIAL, a.FANTASIA, a.TIP_PESSOA, ' +
      'a.ENDERECO, a.BAIRRO, a.COD_CIDADE, a.CEP, a.FONE, a.FAX, a.CNPCPF, ' +
      'a.IERG, a.EMAIL, a.HOME_PAGE, a.OBSERVACAO, a.LUCRO_DEFINIDO, a.TIPO_EMPRESA, ' +
      'a.USO_PREPEDIDO, a.INATIVO, a.COMPLEMENTO, a.NR_ENDERECO, a.NFE_EMAIL, ' +
      'c.nom_cidade, c.uf, a.whastapp from fornecedor a ' +
      'left join cidades c on c.cod_cidade = a.cod_cidade ' +
      'where a.cod_fornecedor=' + QuotedStr(id));

    open;
  end;

end;

procedure TFr_fornecedor.limpa_campos(prefixo: ShortString);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).Clear
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(Components[i]).Clear
      else if Components[i] is TsComboEdit then
        TsComboEdit(components[i]).Clear
      else if Components[i] is TRichEdit then
        TRichEdit(components[i]).Clear
      else if Components[i] is TMaskEdit then
        TMaskEdit(components[i]).Clear;

      LbNom_cidade.Caption := '...';
      PRuso_prepedido.Checked := False;
      PRinativo.Checked := False;
    end;
  end;

end;

procedure TFr_fornecedor.mostra_campos(prefixo: ShortString);
var
  i: integer;
  campo, campo1: string;
begin
  Screen.Cursor := crSQLWait;

  if Q_fornecedor.FieldByName('tip_pessoa').AsString = 'J' then
    ZZjuridica.Checked := true
  else
    ZZfisica.Checked := true;

  for i := 0 to ComponentCount - 1 do
  begin
    if copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
      begin
        campo := TsEdit(Components[i]).Name;
        campo1 := copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
        TsEdit(FindComponent(campo)).Text := q_fornecedor.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TsCurrencyEdit then
      begin
        campo := TsCurrencyEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        TsCurrencyEdit(FindComponent(campo)).Value := Q_fornecedor.fieldbyname(campo1).AsFloat;
      end
      else if Components[i] is TRichEdit then
      begin
        campo := TRichEdit(Components[i]).Name;
        campo1 := copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
        TRichEdit(FindComponent(campo)).Text := q_fornecedor.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TsComboEdit then
      begin
        campo := TsComboEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        TsComboEdit(FindComponent(campo)).Text := q_fornecedor.fieldbyname(campo1).AsString;
      end
      else if Components[i] is tscheckbox then
      begin
        campo := tscheckbox(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        if Q_fornecedor.fieldbyname(campo1).AsString = 'S' then
          tscheckbox(FindComponent(campo)).Checked := true
        else
          tscheckbox(FindComponent(campo)).Checked := false;
      end
      else if Components[i] is TMaskEdit then
      begin
        campo := TMaskEdit(Components[i]).Name;
        campo1 := copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
        TMaskEdit(FindComponent(campo)).Text := q_fornecedor.fieldbyname(campo1).AsString;
      end;
    end;
  end; //end do for

  PRCod_cidadeExit(self);

  carrega_contato(Q_fornecedor.fieldbyname('cod_fornecedor').AsString);
  Screen.Cursor := crDefault;

end;

procedure TFr_fornecedor.readonly_false(prefixo: ShortString);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).ReadOnly := false
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(components[i]).ReadOnly := false
      else if Components[i] is TsDateEdit then
        TsDateEdit(components[i]).ReadOnly := false
      else if Components[i] is TsComboEdit then
        TsComboEdit(components[i]).ReadOnly := false
      else if Components[i] is TRichEdit then
        TRichEdit(components[i]).ReadOnly := false
      else if Components[i] is TMaskEdit then
        TMaskEdit(components[i]).ReadOnly := false;
    end;
    if prefixo = 'PR' then
    begin
      Gbtipo.Enabled := true;
    end;
  end;

end;

procedure TFr_fornecedor.readonly_true(prefixo: ShortString);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).ReadOnly := True
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(Components[i]).ReadOnly := True
      else if Components[i] is TsComboEdit then
        TsComboEdit(components[i]).ReadOnly := True
      else if Components[i] is TRichEdit then
        TRichEdit(components[i]).ReadOnly := True
      else if Components[i] is TMaskEdit then
        TMaskEdit(components[i]).ReadOnly := True;


    end;
  end;
  if prefixo = 'PR' then
  begin
    Gbtipo.Enabled := false;
  end;

end;

procedure TFr_fornecedor.BtGraClick(Sender: TObject);
begin
  try
    if (modo_insert) and (BtNov.Enabled = false) then
    begin
      dao.Geral2('select razao_social from fornecedor where razao_social=' + QuotedStr(PRRazao_Social.Text));
      if dao.Q2.RecordCount > 0 then
      begin
        dao.msg('FOI ENCONTRADO UM FORNECEDOR CADASTRADO COM O MESMO NOME QUE VOCÊ CADASTROU' + #13 + 'VERIFIQUE SE VOCÊ NÃO ESTÁ CADASTRANDO ESTE FORNECEDOR NOVAMENTE, OU ALTERE O NOME DO FORNECEDOR!');
        PRRazao_Social.SetFocus;
        Exit;
      end;
    end;

    if PRCod_cidade.Text = '' then
    begin
      dao.msg('O campo Cidade deve ser Preenchido');
      exit;
    end;

    if PRRazao_Social.Text = '' then
    begin
      dao.msg('O campo Razão Social deve ser preenchido!');
      exit;
    end;

    btnov.Enabled := true;
    btalt.Enabled := true;
    btgra.Enabled := false;
    btcan.Enabled := False;
    btexc.Enabled := true;
    BtLocalizar.Enabled := true;

    if modo_insert then
    begin
      try
        if not (dao.cn.InTransaction) then
          dao.cn.StartTransaction;
        id := dao.insert('PR', 'fornecedor', 'cod_fornecedor', Fr_fornecedor, 'gen_fornecedor');
        dao.cn.Commit;
      except
        dao.cn.rollback;
      end;

      PrCod_Fornecedor.Text := id;
      ativa_fornecedor(id);
    end
    else
    begin
      try
       // if not (dao.cn.InTransaction) then
          dao.cn.StartTransaction;
        dao.update('fornecedor', 'cod_fornecedor', Q_fornecedor.fieldbyname('cod_fornecedor').AsString, 'PR', Fr_fornecedor);
        dao.cn.commit;
      except
        dao.cn.rollback;
      end;

      ativa_fornecedor(PRCod_Fornecedor.Text);
    end;

    try
      if (PRCNPCPF.Text <> '  .   .   /    -  ') or (PRCNPCPF.Text <> '   .   .   -  ') then
        if ZZjuridica.Checked = true then
        begin
          try
           // if not (dao.cn.InTransaction) then
              dao.cn.StartTransaction;
            dao.Execsql('update fornecedor set tip_pessoa=' + QuotedStr('J') + ' where cod_fornecedor=' + Q_fornecedor.fieldbyname('cod_fornecedor').AsString);
            dao.cn.Commit;
          except
            dao.cn.rollback;
          end;

        end
        else
        begin
          try
           // if not (dao.cn.InTransaction) then
              dao.cn.StartTransaction;
            dao.Execsql('update fornecedor set tip_pessoa=' + QuotedStr('F') + ' where cod_fornecedor=' + Q_fornecedor.fieldbyname('cod_fornecedor').AsString);
            dao.cn.Commit;
          except
            dao.cn.rollback;
          end;

        end;
      try
     //   if not (dao.cn.InTransaction) then
          dao.cn.StartTransaction;
        if lucro_padrao_anterior <> PRlucro_definido.Value then
        begin
          if PRCod_Fornecedor.Text <> '' then
            dao.Execsql('update produto set lucro=' + QuotedStr(PRlucro_definido.Text) + ' where fornecedor_principal=' + QuotedStr(PRCod_Fornecedor.Text));
        end;

        if ZZempresa_simples.Checked then
          dao.Execsql('update fornecedor set tipo_empresa=' + QuotedStr('1') + ' where cod_fornecedor=' + QuotedStr(PRCod_Fornecedor.Text))
        else if ZZempresa_epp.Checked then
          dao.Execsql('update fornecedor set tipo_empresa=' + QuotedStr('2') + ' where cod_fornecedor=' + QuotedStr(PRCod_Fornecedor.Text))
        else if ZZempresa_grande_porte.Checked then
          dao.Execsql('update fornecedor set tipo_empresa=' + QuotedStr('3') + ' where cod_fornecedor=' + QuotedStr(PRCod_Fornecedor.Text));

        dao.cn.Commit;
      except
        dao.cn.rollback;
      end;

      ativa_fornecedor(PRCod_Fornecedor.Text);
      mostra_campos('PR');
      if xml_nfe then
      begin
        ModalResult := mrok;
      end;
      //    Atualiza_cadastro_fornecedor_lojas;
    except
      on e: Exception do
      begin
        dao.msg('Houve um erro ao Gravar o Tipo de Pessoa!' + #13 +
          e.message);
      end;
    end;

  except
    on e: Exception do
    begin
      dao.msg('Houve um erro ao Gravar o Fornecedor!' + #13 +
        e.message);
    end;
  end;
end;

procedure TFr_fornecedor.BtNovClick(Sender: TObject);
begin
  try
    modo_insert := true;
    readonly_false('PR');
    if PCFornecedor.ActivePageIndex = 0 then
      PrRazao_Social.SetFocus;
    //habilita botões
    btnov.Enabled := false;
    btalt.Enabled := false;
    btgra.Enabled := true;
    btcan.Enabled := true;
    btexc.Enabled := false;
    BtLocalizar.Enabled := false;
    ZZjuridica.Checked := true;
    Limpa_campos('PR');
    if not (DM.q_configuracao.Active) then
      FRPRI.ativa_configuracao;
    PRlucro_definido.Value := DM.q_configuracao.FieldByName('lucro_padrao_fornecedor').AsFloat;
    ZZempresa_epp.Checked := True;

  except

  end;

end;

procedure TFr_fornecedor.BtAltClick(Sender: TObject);
begin
  try
    if PRCod_Fornecedor.Text = '' then
    begin
      dao.msg('Selecione um Fornecedor para Alterar!');
      exit;
    end;
    modo_insert := false;
    readonly_false('PR');
    //habilita botões
    btnov.Enabled := false;
    btalt.Enabled := false;
    btgra.Enabled := true;
    btcan.Enabled := true;
    btexc.Enabled := false;
    BtLocalizar.Enabled := false;
    if PCFornecedor.ActivePageIndex = 0 then
      PrRazao_Social.SetFocus;

    lucro_padrao_anterior := PRlucro_definido.Value;

  except
  end;

end;

procedure TFr_fornecedor.BtCanClick(Sender: TObject);
begin
  try
    if MessageDlg('Deseja Cancelar está Operação?', mtConfirmation, [mbyes, mbno], 0) = mryes then
    begin
      btnov.Enabled := true;
      btalt.Enabled := true;
      btgra.Enabled := false;
      btcan.Enabled := False;
      btexc.Enabled := true;
      BtLocalizar.Enabled := true;

      if modo_insert then
      begin
        limpa_campos('PR');
        readonly_true('PR');
      end
      else if not (modo_insert) then
      begin
        mostra_campos(Q_fornecedor.fieldbyname('cod_fornecedor').AsString);
      end;
    end
    else
      exit;
  except
  end;

end;

procedure TFr_fornecedor.BtExcClick(Sender: TObject);
begin
  try
    if PRcod_cidade.Text = '' then
    begin
      showmessage('Não é possivel excluir esta Fornecedor por não ter Código!');
      BtNov.SetFocus;
      Exit;
    end;

    if MessageDlg('Tem Certeza que Deseja Excluir Este Fornecedor?', mtConfirmation, [mbyes, mbno], 0) = mryes then
    begin
      //exclui os registros pai..
      try
        if not (dao.cn.InTransaction) then
          (dao.cn.StartTransaction);
        dao.delete('cod_fornecedor', Q_fornecedor.fieldbyname('cod_fornecedor').AsString, 'fornecedor');
        dao.cn.Commit;
      except
        dao.cn.rollback;
      end;

      dao.msg('Fornecedor excluido com sucesso!');
      limpa_campos('PR');
      limpa_campos('CF');
    end;
  except
    on e: Exception do
    begin
      dao.msg('Houve um erro ao Excluir o Fornecedor!' + #13 +
        e.message);
    end;
  end;

end;

procedure TFr_fornecedor.PRRazao_SocialKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as twincontrol, true, true);
    Key := #0;
  end;
end;

procedure TFr_fornecedor.PRFantasiaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    Prendereco.setFocus;
    Key := #0;
  end;

end;

procedure TFr_fornecedor.BtLocalizarClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  //guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Fornecedor';
  chamou_pesquisa := 'fr_fornecedor';
  chamou_form := 'fr_fornecedor';
  chamou_cadastro := 'Fr_fornecedor';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Fornecedores';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 5);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Razão Social';
  Campos_combo[2] := 'Fantasia';
  Campos_combo[3] := 'CNPJ';
  Campos_combo[4] := 'Cidade';

  for i := 0 to 4 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  if campo_pesquisado <> '' then
  begin
    Fr_localizar.CBcampos.ItemIndex := Fr_localizar.CBcampos.Items.IndexOf(campo_pesquisado);
    Fr_localizar.EDlocalizar.Text := dado_pesquisado;
    Fr_localizar.zzbusca_qualquer.Checked := busca_qualquer_posicao_pesquisada;
    Fr_localizar.loc_fornecedor(Fr_localizar.EDlocalizar.Text);
  end;

  try
    Fr_localizar.ShowModal;


  if PRCod_Fornecedor.Text <> '' then
  begin
    if Q_fornecedor.FieldByName('tipo_empresa').AsString = '1' then
      ZZempresa_simples.Checked := true
    else if Q_fornecedor.FieldByName('tipo_empresa').AsString = '2' then
      ZZempresa_epp.Checked := true
    else if Q_fornecedor.FieldByName('tipo_empresa').AsString = '3' then
      ZZempresa_grande_porte.Checked := true;
  end;
  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
  if PRCod_Fornecedor.Text <> '' then
  begin
    with q_giro do
    begin
      Close;
      sql.Clear;
      sql.Add('select c.descricao, g.giro from giro_fornecedor g ' +
        'left join colecao c on c.id=g.cod_colecao ' +
        'where g.cod_fornecedor=' + QuotedStr(PRCod_Fornecedor.Text));
      Open;
    end;
    q_giro.FieldByName('descricao').DisplayLabel := 'Coleção';
    q_giro.FieldByName('giro').DisplayLabel := 'Giro';
  end;
  finally
    Fr_localizar.Free;
  end;
end;

procedure TFr_fornecedor.FormShow(Sender: TObject);
begin
  limpa_campos('PR');
  limpa_campos('CF');
  readonly_true('PR');
  readonly_true('CF');
  PCFornecedor.ActivePageIndex := 0;
  if xml_nfe then
  begin
    BtNovClick(Self);
    PRRazao_Social.Text := xml_razao_socia;
    PRCNPCPF.Text := xml_cnpj;
    PRIERG.Text := xml_ie;
    PRFantasia.Text := xml_nome_fantasia;
    PREndereco.Text := xml_endereco;
    PRnr_endereco.Text := xml_nr;
    PRBairro.Text := xml_bairro;
    PRcep.Text := copy(xml_cep, 1, 5) + '-' + copy(xml_cep, 6, 3);
    PRfone.Text := '(' + copy(xml_fone, 1, 2) + ')' + copy(xml_fone, 3, 4) + '-' + copy(xml_fone, 7, 4);
    PRIERG.Text := xml_ie;

    dao.Geral2('select * from cidades c where c.nom_cidade like ' + QuotedStr(xml_cidade) + ' and c.uf = ' + QuotedStr(xml_uf));
    if not dao.q2.IsEmpty then
    begin
      PRCod_cidade.Text := dao.Q2.fieldbyname('cod_cidade').AsString;
      LbNom_cidade.Caption := xml_cidade + ' - ' + xml_uf;
    end;
  end;
end;

procedure TFr_fornecedor.PRCod_cidadeButtonClick(Sender: TObject);
var
  q_campos_proponente: TFDQuery;
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;

  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  //guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Cidade';

  chamou_pesquisa := 'fr_cidades';
  chamou_form := 'fr_fornecedor_cidade';
  chamou_cadastro := 'fr_cidade';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cidades';

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'UF';

  for i := 0 to 1 do
  begin
    valor_combo := campos_combo[i];
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

procedure TFr_fornecedor.BtNov_ContClick(Sender: TObject);
begin
  try
    if (BtNov.Enabled = true) or (BtAlt.Enabled = true) then
    begin
      dao.msg('O Botão Novo ou Alterar Geral deve ser precionado!');
      PCFornecedor.ActivePageIndex := 0;
      BtAlt.SetFocus;
      exit;
    end;

    if PRCod_Fornecedor.Text = '' then
    begin
      dao.msg('Primeiro você deve clicar no botão gravar na aba dados!');
      PCFornecedor.ActivePageIndex := 0;
      BtGra.SetFocus;
      exit;
    end;

    modo_insert_con := true;
    readonly_false('CF');
    CFNom_contato.SetFocus;
    //habilita botões
    BtNov_Cont.Enabled := false;
    btalt_Cont.Enabled := false;
    btgra_Cont.Enabled := true;
    btcan_Cont.Enabled := true;
    btexc_Cont.Enabled := false;
    Limpa_campos('CF');
    CFcod_fornecedor.Text := PRCod_Fornecedor.Text;

  except

  end;

end;

procedure TFr_fornecedor.BtAlt_ContClick(Sender: TObject);
begin
  try
    if (BtNov.Enabled = true) or (BtAlt.Enabled = true) then
    begin
      dao.msg('O Botão Novo ou Alterar Geral deve ser precionado!');
      PCFornecedor.ActivePageIndex := 0;
      BtAlt.SetFocus;
      exit;
    end;

    modo_insert_con := false;
    readonly_false('CF');
    //habilita botões
    btnov_Cont.Enabled := false;
    btalt_Cont.Enabled := false;
    btgra_Cont.Enabled := true;
    btcan_Cont.Enabled := true;
    btexc_Cont.Enabled := false;

    CFNom_contato.SetFocus;

  except
  end;

end;

procedure TFr_fornecedor.BtGra_ContClick(Sender: TObject);
begin
  try
    if (BtNov.Enabled = true) or (BtAlt.Enabled = true) then
    begin
      dao.msg('O Botão Novo ou Alterar Geral deve ser precionado!');
      PCFornecedor.ActivePageIndex := 0;
      BtAlt.SetFocus;
      exit;
    end;

    if CFNom_contato.Text = '' then
    begin
      dao.msg('O campo Nome do Contato deve ser preenchido!');
      exit;
    end;

    btnov_Cont.Enabled := true;
    btalt_Cont.Enabled := true;
    btgra_Cont.Enabled := false;
    btcan_Cont.Enabled := False;
    btexc_Cont.Enabled := true;

    if modo_insert_con then
    begin
      id := dao.insert('CF', 'fornecedor_contato', 'id', Fr_fornecedor, 'gen_fornecedor_contato');
      carrega_contato(PRCod_Fornecedor.Text);
      //       ativa_fornecedor_contato(id);
    end
    else

      dao.update('fornecedor_contato', 'id', q_contato.fieldbyname('id').AsString, 'CF', Fr_fornecedor);
  except
    on e: Exception do
    begin
      dao.msg('Houve um erro ao Gravar o Contato do Fornecedor!' + #13 +
        e.message);
    end;
  end;

end;

procedure TFr_fornecedor.BtCan_ContClick(Sender: TObject);
begin
  try
    if MessageDlg('Deseja Cancelar está Operação?', mtConfirmation, [mbyes, mbno], 0) = mryes then
    begin
      btnov_Cont.Enabled := true;
      btalt_Cont.Enabled := true;
      btgra_Cont.Enabled := false;
      btcan_Cont.Enabled := False;
      btexc_Cont.Enabled := true;

      if modo_insert_con then
      begin
        limpa_campos('CF');
        readonly_true('CF');
      end
      else if not (modo_insert_con) then
      begin
        mostra_campos(q_contato.fieldbyname('id').AsString);
      end;
    end
    else
      exit;
  except
  end;

end;

procedure TFr_fornecedor.BtExc_ContClick(Sender: TObject);
begin
  if (BtNov.Enabled = true) or (BtAlt.Enabled = true) then
  begin
    dao.msg('O Botão Novo ou Alterar Geral deve ser precionado!');
    BtAlt.SetFocus;
    exit;
  end;

  if CFNom_contato.Text = '' then
  begin
    showmessage('Não é possivel excluir este Contato por não ter Código!');
    BtNov_Cont.SetFocus;
    Exit;
  end;

  if MessageDlg('Tem Certeza que Deseja Excluir o Contato do Fornecedor ' + CFNom_contato.Text + '?', mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    dao.delete('id', q_contato.fieldbyname('id').AsString, 'fornecedor_contato');
    dao.msg('Contato do Fornecedor Excluido com Sucesso!');
  end;

  carrega_contato(PRCod_Fornecedor.Text);

end;

procedure TFr_fornecedor.ativa_fornecedor_contato(id: string);
begin
  with q_contato do
  begin
    close;
    sql.clear;
    sql.add('select * from fornecedor_contato f ' +
      'where f.id =' + QuotedStr(id));
    open;
  end;

end;

procedure TFr_fornecedor.carrega_contato(id: string);
begin
  with q_contato do
  begin
    close;
    sql.clear;
    sql.add('select * from fornecedor_contato ' +
      'where cod_fornecedor =' + QuotedStr(id));
    open;
  end;
  q_contato.FieldByName('cod_fornecedor').Visible := false;
  q_contato.FieldByName('id').Visible := false;
  q_contato.FieldByName('email_contato').Visible := false;
  q_contato.FieldByName('fone_contato').Visible := false;

  q_contato.FieldByName('nom_contato').DisplayLabel := 'Contato';
  q_contato.FieldByName('cargo_contato').DisplayLabel := 'Cargo';

end;

procedure TFr_fornecedor.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    close;
  if key = #13 then
  begin
    if ActiveControl.Name = 'PRObservacao' then
      exit;
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TFr_fornecedor.PRCNPCPFExit(Sender: TObject);
var
  passou: Boolean;
begin
  //tipos de documentos:  docCPF,docCNPJ, docInscEst,docCEP,docNumCheque
  if PRCNPCPF.Text = '  .   .   /    -  ' then
    exit;
  if PRCNPCPF.Text = '   .   .   -  ' then
    exit;

{  if ZZjuridica.Checked then
  begin
    passou := FRPRI.valida_doc(PRCNPCPF.Text, docCNPJ);
    if not (passou) then
    begin
      dao.msg('CNPJ inválido!');
      PRCNPCPF.SetFocus;
    end;
  end
  else
  begin
    passou := FRPRI.valida_doc(PRCNPCPF.Text, docCPF);
    if not (passou) then
    begin
      dao.msg('CPF inválido!');
      PRCNPCPF.SetFocus;
    end;
  end;
 }
end;

procedure TFr_fornecedor.ZZBt_EmailClick(Sender: TObject);
var
  MEMAIL: string;
begin
  MEMAIL := 'mailto:' + PREmail.Text;
  ShellExecute(GetDesktopWindow, 'open', pchar(MEMAIL), nil, nil, sw_ShowNormal);

end;

procedure TFr_fornecedor.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if btgra.Enabled = true then
  begin
    MessageBox(handle, 'Você deve Gravar ou Cancelar as Informações Antes de Sair!', 'ORBI', MB_ICONWARNING);
    CanClose := false;
  end
  else
  begin
    CanClose := true;
  end;

end;

procedure TFr_fornecedor.ZZfisicaClick(Sender: TObject);
begin
  PRCNPCPF.Clear;
  PRCNPCPF.EditMask := '###.###.###-##';
end;

procedure TFr_fornecedor.ZZjuridicaClick(Sender: TObject);
begin
  PRCNPCPF.Clear;
  PRCNPCPF.EditMask := '##.###.###/####-##;1;_';

end;

procedure TFr_fornecedor.mostra_campos_contato(prefixo: ShortString);
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
        campo1 := copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
        TsEdit(FindComponent(campo)).Text := q_contato.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TRichEdit then
      begin
        campo := TRichEdit(Components[i]).Name;
        campo1 := copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
        TRichEdit(FindComponent(campo)).Text := q_contato.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TsComboEdit then
      begin
        campo := TsComboEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        TsComboEdit(FindComponent(campo)).Text := q_contato.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TMaskEdit then
      begin
        campo := TMaskEdit(Components[i]).Name;
        campo1 := copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
        TMaskEdit(FindComponent(campo)).Text := q_contato.fieldbyname(campo1).AsString;
      end;
    end;
  end; //end do for

  Screen.Cursor := crDefault;
end;

procedure TFr_fornecedor.ZzBt_HomePageClick(Sender: TObject);
var
  MENDPAG: string;
begin
  ActiveControl := nil;
  MENDPAG := PRHome_Page.Text;
  ShellExecute(handle, 'open', pchar(MENDPAG), nil, nil, Sw_ShowNormal);

end;

procedure TFr_fornecedor.FormCreate(Sender: TObject);
begin
  btcalcula_preco_venda.Caption := 'Re-calcular o Preço de Venda' + #13 + 'Baseado no  Lucro Definido';

end;

procedure TFr_fornecedor.recalcula_preco_venda(cod_fornecedor: string);
var
  imposto, geral, lucro, preco_venda_atu: Real;
  preco_venda_conv: string;
begin
  dao.Geral1('select cod_produto, custo, lucro, impostos, geral, outros, preco_venda from produto where fornecedor_principal=' + QuotedStr(cod_fornecedor));
  dao.Q1.First;

  while not (dao.Q1.Eof) do
  begin
    imposto := dao.q1.fieldbyname('custo').AsFloat * (dao.Q1.fieldbyname('impostos').AsFloat / 100);
    geral := dao.q1.fieldbyname('custo').AsFloat * (dao.Q1.fieldbyname('geral').AsFloat / 100);
    lucro := dao.q1.fieldbyname('custo').AsFloat * (PRlucro_definido.Value / 100);

    preco_venda_atu := dao.q1.fieldbyname('custo').AsFloat + imposto + geral + lucro;

    preco_venda_conv := FMFUN.prepara_valor(floattostr(preco_venda_atu));

    //    dao.Exec_sql2('update produto set preco_venda =' + QuotedStr(preco_venda_conv) + ' where cod_produto=' + QuotedStr(dao.Q1.fieldbyname('cod_produto').AsString));

  end;

end;

procedure TFr_fornecedor.Atualiza_cadastro_fornecedor_lojas;
var
  c_empresa: string;
begin
  try
    {    Application.ProcessMessages;
        PaAguarde.Visible:= true;
        ANIMACAO.Animate:=true;
        Application.ProcessMessages;}

    dao.Geral1('select * from empresa where cod_empresa <> ' + QuotedStr(cod_empresa));
    dao.Q1.First;

    dao.Configura_CN_NET(dao.Q1.fieldbyname('cod_empresa').AsString);
    c_empresa := dao.Q1.fieldbyname('cod_empresa').AsString;
    //if not (dao.cn_net.InTransaction) then
      dao.cn_net.StartTransaction;

    while not (dao.Q1.eof) do
    begin
      if cod_empresa <> dao.Q1.FieldByName('cod_empresa').AsString then
      begin
        c_empresa := dao.Q1.fieldbyname('cod_empresa').AsString;
        dao.Configura_CN_NET(dao.Q1.fieldbyname('cod_empresa').AsString);
      end;
      //produto
      dao.Geral1_NET('select cod_fornecedor from fornecedor where cod_fornecedor=' + QuotedStr(PRCod_Fornecedor.Text));

      if dao.q1_net.RecordCount > 0 then
        dao.Execsql_NET('update fornecedor set razao_social=' + QuotedStr(PRRazao_Social.Text) + ', fantasia=' + QuotedStr(PRFantasia.Text) +
          ' where cod_fornecedor=' + QuotedStr(PRCod_Fornecedor.Text))
      else
        dao.Execsql_NET('insert into fornecedor (cod_fornecedor, razao_social, fantasia) values (' +
          QuotedStr(PRCod_Fornecedor.Text) + ',' + QuotedStr(PRRazao_Social.Text) + ',' + QuotedStr(PRFantasia.Text) + ')');
      //**final produto
      dao.q1.Next;
    end;
    dao.cn_net.Commit;
    //    PaAguarde.Visible:= false;
  except
    on e: Exception do
    begin
      //        PaAguarde.Visible:= false;
      dao.msg('Houve um erro na replicação de Dados para as Lojas!(FORNECEDOR)' + #13 +
        e.message);
    end;
  end;

end;

procedure TFr_fornecedor.zzcod_colecaoButtonClick(Sender: TObject);
var
  q_campos_proponente: TFDQuery;
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;

  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  //guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Coleção';

  chamou_pesquisa := 'fr_colecao';
  chamou_form := 'fr_fornecedor_colecao';
  chamou_cadastro := 'fr_colecao';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Colecao';

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';

  for i := 0 to 1 do
  begin
    valor_combo := campos_combo[i];
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

procedure TFr_fornecedor.zzcod_colecaoExit(Sender: TObject);
begin
  if trim(zzcod_colecao.Text) = '' then
    Lbcolecao.Caption := '...';

  if zzcod_colecao.Text <> '' then
  begin
    dao.Geral2('select descricao from colecao where id=' + QuotedStr(zzcod_colecao.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbcolecao.Caption := dao.Q2.fieldbyname('descricao').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      zzcod_colecao.Text := '';
      zzcod_colecao.SetFocus;
      Exit;
    end;
  end;

end;

procedure TFr_fornecedor.zzcod_colecaoKeyPress(Sender: TObject; var Key: Char);
var
  q_campos_proponente: TFDQuery;
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;

  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  if key = #13 then
  begin
    if (zzcod_colecao.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Coleção';

      chamou_pesquisa := 'fr_colecao';
      chamou_form := 'fr_fornecedor_colecao';
      chamou_cadastro := 'fr_colecao';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Colecao';

      //preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo, 3);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Nome';

      for i := 0 to 1 do
      begin
        valor_combo := campos_combo[i];
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
    SelectNext(sender as TWinControl, true, true);
    key := #0;

  end;
end;

procedure TFr_fornecedor.Button1Click(Sender: TObject);
begin
  if zzcod_colecao.Text = '' then
  begin
    dao.msg('Digite a Coleção!');
    zzcod_colecao.SetFocus;
    Exit;
  end;

  if zzgiro.Value = 0 then
  begin
    dao.msg('Digite um Giro!');
    zzgiro.SetFocus;
    Exit;
  end;
  try
   // if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    dao.Execsql('insert into giro_fornecedor (cod_colecao, cod_fornecedor, giro) values (' + QuotedStr(zzcod_colecao.Text) + ',' + QuotedStr(PRCod_Fornecedor.Text) + ',' + QuotedStr(zzgiro.Text) + ')');
    dao.cn.Commit;
  except
    dao.cn.rollback;
  end;

  with q_giro do
  begin
    Close;
    sql.Clear;
    sql.Add('select c.descricao, g.giro from giro_fornecedor g ' +
      'left join colecao c on c.id=g.cod_colecao ' +
      'where g.cod_fornecedor=' + QuotedStr(PRCod_Fornecedor.Text));
    Open;
  end;
  q_giro.FieldByName('descricao').DisplayLabel := 'Coleção';
  q_giro.FieldByName('giro').DisplayLabel := 'Giro';

end;

procedure TFr_fornecedor.zzcod_empresaButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  //guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Empresa';
  chamou_pesquisa := 'fr_empresa';
  chamou_form := 'fr_fornecedor_empresa';
  chamou_cadastro := 'Fr_empresa';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Empresa';
  Fr_localizar.BT_cadastro.Visible := false;

  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';

  for i := 0 to 1 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(campos_combo[i]);
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

procedure TFr_fornecedor.PRCod_cidadeExit(Sender: TObject);
begin
  if trim(PrCod_Cidade.Text) <> '' then
  begin
    if (not FMFUN.verificaNumerico(PrCod_Cidade.Text)) and
      (length(PrCod_Cidade.Text) > 0) then
    begin
      showmessage('Dado tem que ser sempre Numérico!');
      PrCod_Cidade.SetFocus;
      exit;
    end;

    dao.Geral2('select NOM_CIDADE, UF from cidades where cod_cidade = ' + QuotedStr(PrCod_Cidade.Text));

    if dao.q2.RecordCount > 0 then
      LbNom_cidade.Caption := dao.Q2.fieldbyname('NOM_CIDADE').AsString + '-' + dao.Q2.fieldbyname('UF').AsString
    else
    begin
      dao.msg('Registro não Encontrado!');
      PrCod_Cidade.Text := '';
      PrCod_Cidade.setfocus;
      LbNom_cidade.Caption := '...';
      Exit;
    end;
  end
  else
    LbNom_cidade.Caption := '...';
end;

procedure TFr_fornecedor.BtBuscaEndClick(Sender: TObject);
var
  dados_consulta_cep: TStringList;
  resultado: string;
begin
  if trim(prcep.Text) = '-' then
  begin
    showmessage('Informe o CEP!!');
    prcep.SetFocus;
    exit;
  end;

  ACBrCEP1.BuscarPorCEP(prcep.Text);


  prendereco.SetFocus;
end;

procedure TFr_fornecedor.BtBuscaCEPClick(Sender: TObject);
var
  dados_consulta_cep: TStringList;
  resultado, tipo_logradouro, logradouro, uf, cidade, bairro, numero: string;
begin
  if trim(prEndereco.text) = '' then
  begin
    showmessage('Endereço precisa ser preenchido!');
    prEndereco.SetFocus;
    exit;
  end;

  if trim(prcod_cidade.text) = '' then
  begin
    showmessage('Cidade precisa ser preenchido!');
    prcod_cidade.SetFocus;
    exit;
  end;

  dao.Geral2('select NOM_CIDADE, UF from cidades where cod_cidade = ' + QuotedStr(PrCod_Cidade.Text));

  tipo_logradouro := copy(prEndereco.text, 1, pos(' ', prEndereco.text));
  logradouro := copy(prEndereco.text, pos(' ', prEndereco.text), length(prEndereco.text));
  numero := prnr_endereco.Text;
  bairro := prbairro.Text;
  uf := dao.Q2.fieldbyname('uf').AsString;
  cidade := dao.Q2.fieldbyname('nom_cidade').AsString;

  dados_consulta_cep := TStringList.Create;
  dados_consulta_cep := FRPRI.BuscaCEP(tipo_logradouro, logradouro, uf, cidade, bairro, numero);
  resultado := dados_consulta_cep.Values['resultado'];

  if resultado <> '1' then
  begin
    showmessage('CEP não encontrado!');
    prcep.SetFocus;
    exit;
  end;

  prcep.Text := dados_consulta_cep.Values['cep'];
  prendereco.Text := dados_consulta_cep.Values['endereco'];
  prbairro.Text := dados_consulta_cep.Values['bairro'];
  prcod_cidade.Text := dados_consulta_cep.Values['cidade'];
  prcod_cidadeexit(self);
  prendereco.SetFocus;
  //  FMFUN.Atualiza_Qtd_Consultas_CEP;
end;


procedure TFr_fornecedor.PRcepKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  valor: string;
begin
  valor := stringreplace(PRcep.Text, '.', '', [rfReplaceAll]);
  valor := stringreplace(valor, '/', '', [rfReplaceAll]);
  valor := stringreplace(valor, '-', '', [rfReplaceAll]);

  if (key = vk_back) and (trim(valor) = '') then
    PRcep.clear;
end;

procedure TFr_fornecedor.PRfoneKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  valor: string;
begin
  valor := stringreplace(PRfone.Text, '.', '', [rfReplaceAll]);
  valor := stringreplace(valor, '/', '', [rfReplaceAll]);
  valor := stringreplace(valor, '-', '', [rfReplaceAll]);

  if (key = vk_back) and (trim(valor) = '') then
    PRfone.clear;
end;

procedure TFr_fornecedor.PRWhastAppKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  valor: string;
begin
  valor := stringreplace(PRWhastApp.Text, '.', '', [rfReplaceAll]);
  valor := stringreplace(valor, '/', '', [rfReplaceAll]);
  valor := stringreplace(valor, '-', '', [rfReplaceAll]);

  if (key = vk_back) and (trim(valor) = '') then
    PRWhastApp.clear;
end;

procedure TFr_fornecedor.PRCNPCPFKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  valor: string;
begin
  valor := stringreplace(PRCNPCPF.Text, '.', '', [rfReplaceAll]);
  valor := stringreplace(valor, '/', '', [rfReplaceAll]);
  valor := stringreplace(valor, '-', '', [rfReplaceAll]);

  if (key = vk_back) and (trim(valor) = '') then
    PRCNPCPF.clear;
end;

procedure TFr_fornecedor.CFFone_ContatoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  valor: string;
begin
  valor := stringreplace(CFFone_Contato.Text, '.', '', [rfReplaceAll]);
  valor := stringreplace(valor, '/', '', [rfReplaceAll]);
  valor := stringreplace(valor, '-', '', [rfReplaceAll]);

  if (key = vk_back) and (trim(valor) = '') then
    CFFone_Contato.clear;
end;

procedure TFr_fornecedor.ACBrCEP1BuscaEfetuada(Sender: TObject);
var
  I: Integer;
begin
  if ACBrCEP1.Enderecos.Count < 1 then
    showmessage('Endereço não Encontrado.')
  else
  begin
    for I := 0 to ACBrCEP1.Enderecos.Count - 1 do
    begin
      with ACBrCEP1.Enderecos[I] do
      begin
        prendereco.Text := trim(Tipo_Logradouro + ' ' + Logradouro);
        prcomplemento.Text := Complemento;
        prbairro.Text := Bairro;
        prcod_cidade.Text := COPY(IBGE_Municipio, 1, 6);
        PrCod_CidadeExit(Self);
      end;
    end;
  end;
end;

procedure TFr_fornecedor.BtnBuscarCNPJClick(Sender: TObject);
var
  Documento, RazaoSocial, Fantasia, CEP, Endereco, Numero, Complemento, Bairro,
    Cidade, UF, EmpresaTipo, Situacao: string;
begin
  Documento := PRCNPCPF.Text;

  FMFUN.BuscaDadosPorCNPJJson(Documento, RazaoSocial, Fantasia, CEP, Endereco,
    Numero, Complemento, Bairro, Cidade, UF, EmpresaTipo, Situacao);

  PRRazao_Social.Text := RazaoSocial;
  PRFantasia.Text := Fantasia;
  PrCep.Text := FMFUN.FormataCEP(CEP);
  PrEndereco.Text := Endereco;
  Prnr_endereco.Text := Numero;
  PrComplemento.Text := Complemento;
  PrBairro.Text := Bairro;

  dao.Geral2('select COD_CIDADE, NOM_CIDADE, UF from cidades where UF = ''' + UF + ''' AND NOM_cidade = ' +
    QuotedStr(Cidade));

  if dao.q2.RecordCount > 0 then
  begin
    LbNom_cidade.Caption := dao.Q2.FieldByName('NOM_CIDADE').AsString + '-'
      + dao.Q2.FieldByName('UF').AsString;
    Prcod_cidade.Text := dao.Q2.FieldByName('COD_CIDADE').AsString;
  end;

  PRObservacao.Lines.Add('Tipo: ' + EmpresaTipo);
  PRObservacao.Lines.Add('Situaçao: ' + Situacao);
end;

end.








