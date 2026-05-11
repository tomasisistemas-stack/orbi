unit Un_Transportadora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, 
  ComCtrls, ExtCtrls, sPanel, sBitBtn, sLabel, sCheckBox,
  sGroupBox, sEdit, sTooledit, sMaskEdit, sCustomComboEdit, sComboEdit,
  ACBrBase, ACBrSocket, ACBrCEP, MaskUtils,  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFr_Transportadora = class(TForm)
    GroupBox1: TsGroupBox;
    PrCod_transportadora: TsEdit;
    PrNome: TsEdit;
    Label1: tsLabel;
    Label2: tsLabel;
    GroupBox2: TsGroupBox;
    PrEndereco: TsEdit;
    PrIE: TsEdit;
    PrMotorista: TsEdit;
    PrPlaca: TsEdit;
    Label3: tsLabel;
    Label4: tsLabel;
    Label5: tsLabel;
    Label6: tsLabel;
    Label7: tsLabel;
    Label9: tsLabel;
    Label10: tsLabel;
    Label11: tsLabel;
    PrBairro: TsEdit;
    PrCod_cidade: TsComboEdit;
    Label12: tsLabel;
    LbNom_cidade: tsLabel;
    PrFone: TMaskEdit;
    PrCep: TMaskEdit;
    PrCNPJ: TMaskEdit;
    Prfrete_fixo: tscheckbox;
    Prpercentual_frete: TsEdit;
    lbpercentual_frete: tsLabel;
    Panel1: tsPanel;
    BtNov: TsBitBtn;
    BtAlt: TsBitBtn;
    BtGra: TsBitBtn;
    BtCan: TsBitBtn;
    BtExc: TsBitBtn;
    BtLocalizar: TsBitBtn;
    PrObs: TRichEdit;
    Label14: tsLabel;
    BtBuscaEnd: TsBitBtn;
    BtBuscaCEP: TsBitBtn;
    rgTipoPessoa: TsRadioGroup;
    PrCPF: TMaskEdit;
    Label17: TsLabel;
    PrTip_pessoa: TsEdit;
    PrInterno: TsCheckBox;
    ACBrCEP1: TACBrCEP;
    BtnBuscarCNPJ: TsBitBtn;
    q_transportadora: TFDQuery;
    procedure BtAltClick(Sender: TObject);
    procedure BtCanClick(Sender: TObject);
    procedure BtExcClick(Sender: TObject);
    procedure BtGraClick(Sender: TObject);
    procedure BtLocalizarClick(Sender: TObject);
    procedure BtNovClick(Sender: TObject);
    procedure PrNomeKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure PrCod_cidadeButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Prpercentual_freteEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtBuscaEndClick(Sender: TObject);
    procedure PrCod_cidadeExit(Sender: TObject);
    procedure BtBuscaCEPClick(Sender: TObject);
    procedure rgTipoPessoaClick(Sender: TObject);
    procedure ACBrCEP1BuscaEfetuada(Sender: TObject);
    procedure BtnBuscarCNPJClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    modo_insert, xml_nfe, dados_incompletos: Boolean;
    busca_qualquer_posicao_pesquisada: boolean;
    campo_pesquisado, dado_pesquisado, transportadora: string;

    id, xml_razao_socia, xml_cnpj, xml_nome_fantasia, xml_ie, xml_endereco,
      xml_nr, xml_cep, xml_bairro, xml_cidade, xml_uf, xml_fone: string;

    procedure mostra_campos(prefixo: ShortString);
    procedure ativa_transportadora(id: string); //carrega a query q_fornecedor
    procedure limpa_campos(prefixo: ShortString);
    procedure readonly_true(prefixo: ShortString);
    procedure readonly_false(prefixo: ShortString);
    procedure ChecarDadosIncompletos;
  end;

var
  Fr_Transportadora: TFr_Transportadora;

implementation

uses Un_dao, UnPri, Un_localizar, UnFun, ACBrConsultaCNPJ;

{$R *.dfm}

procedure TFr_Transportadora.ChecarDadosIncompletos;
var
  sql: string;
begin
  sql := 'SELECT ' +
    '  CASE WHEN a.NOME IS NULL THEN ''F'' ELSE ''T'' END AS RAZAO_SOCIAL_OK, ' +
    '  a.NOME, ' +
    '  CASE WHEN a.ENDERECO IS NULL THEN ''F'' ELSE ''T'' END AS ENDERECO_OK, ' +
    '  CASE WHEN a.BAIRRO IS NULL THEN ''F'' ELSE ''T'' END AS BAIRRO_OK, ' +
    '  CASE WHEN a.CEP IS NULL THEN ''F'' ELSE ''T'' END AS CEP_OK, ' +
    '  a.CEP, ' +
    '  CASE WHEN a.COD_CIDADE IS NULL THEN ''F'' ELSE ''T'' END AS COD_CIDADE_OK, ' +
    '  CASE WHEN A.TIP_PESSOA = ''J'' AND A.CNPJ IS NULL THEN ''F'' ELSE ''T'' END AS CNPJ_OK, ' +
    '  CASE WHEN A.TIP_PESSOA = ''F'' AND A.CPF IS NULL THEN ''F'' ELSE ''T'' END AS CPF_OK, ' +
    '  CASE WHEN a.fone IS NULL THEN ''F'' ELSE ''T'' END AS TELEFONE_OK, ' +
    '  a.fone AS TELEFONE, ' +
    '  CASE WHEN a.IE IS NULL THEN ''F'' ELSE ''T'' END AS IE_OK, ' +
    '  a.interno ' +
    'FROM TRANSPORTADORA a        ' +
    'WHERE A.COD_TRANSPORTADORA =' + PRCOD_TRANSPORTADORA.Text;

  dao.Geral4(sql);

  if dao.q4.FieldByName('IE_OK').AsString = 'F' then
  begin
    PrIE.Color := clred;
    PrIE.Font.Color := clwhite;
    PrIE.SetFocus;
  end
  else
  begin
    PrIE.Color := clwhite;
    PrIE.Font.Color := clblack;
  end;

  if dao.q4.FieldByName('CNPJ_OK').AsString = 'F' then
  begin
    PrCNPJ.Color := clred;
    PrCNPJ.Font.Color := clwhite;
    PrCNPJ.SetFocus;
  end
  else
  begin
    PrCNPJ.Color := clwhite;
    PrCNPJ.Font.Color := clblack;
  end;

  if dao.q4.FieldByName('CPF_OK').AsString = 'F' then
  begin
    PrCPF.Color := clred;
    PrCPF.Font.Color := clwhite;
    PrCPF.SetFocus;
  end
  else
  begin
    PrCPF.Color := clwhite;
    PrCPF.Font.Color := clblack;
  end;

  if dao.q4.FieldByName('TELEFONE_OK').AsString = 'F' then
  begin
    PrFONE.Color := clred;
    PrFONE.Font.Color := clwhite;
    PrFONE.SetFocus;
  end
  else
  begin
    PrFONE.Color := clwhite;
    PrFONE.Font.Color := clblack;
  end;

  if pos(' ', dao.q4.FieldByName('TELEFONE').AsString) <> 0 then
  begin
    PrFONE.Color := clred;
    PrFONE.Font.Color := clwhite;
    PrFONE.SetFocus;
  end
  else
  begin
    PrFONE.Color := clwhite;
    PrFONE.Font.Color := clblack;
  end;

  if dao.q4.FieldByName('COD_CIDADE_OK').AsString = 'F' then
  begin
    PrCod_cidade.Color := clred;
    PrCod_cidade.Font.Color := clwhite;
    PrCod_cidade.SetFocus;
  end
  else
  begin
    PrCod_cidade.Color := clwhite;
    PrCod_cidade.Font.Color := clblack;
  end;

  ////
  if dao.q4.FieldByName('RAZAO_SOCIAL_OK').AsString = 'F' then
  begin
    PrNome.Color := clred;
    PrNome.Font.Color := clwhite;
    PrNome.SetFocus;
  end
  else
  begin
    PrNome.Color := clwhite;
    PrNome.Font.Color := clblack;
  end;

  if pos(' ', dao.q4.FieldByName('NOME').AsString) = 1 then
  begin
    PrNome.Color := clred;
    PrNome.Font.Color := clwhite;
    PrNome.SetFocus;
  end
  else
  begin
    PrNome.Color := clwhite;
    PrNome.Font.Color := clblack;
  end;

  if dao.q4.FieldByName('ENDERECO_OK').AsString = 'F' then
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

  if dao.q4.FieldByName('BAIRRO_OK').AsString = 'F' then
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

  if dao.q4.FieldByName('CEP_OK').AsString = 'F' then
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

  if pos('.', dao.q4.FieldByName('CEP').AsString) <> 0 then
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

  if length(dao.q4.FieldByName('CEP').AsString) <> 9 then
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

  //////////////

end;

procedure TFr_Transportadora.ativa_transportadora(id: string);
begin
  with q_transportadora do
  begin
    close;
    sql.clear;
    sql.add('select a.COD_TRANSPORTADORA, a.NOME, a.ENDERECO, a.BAIRRO, a.CEP, a.whastapp, ' +
      'a.CNPJ, a.IE, a.COD_CIDADE, a.FONE, a.MOTORISTA, a.PLACA, a.FRETE_FIXO, ' +
      'a.PERCENTUAL_FRETE, a.OBS, c.nom_cidade, c.uf, a.tip_pessoa, a.cpf, a.interno from transportadora a ' +
      'left join cidades c on c.cod_cidade = a.cod_cidade ' +
      'where a.cod_transportadora=' + QuotedStr(id));
    open;
  end;

end;

procedure TFr_Transportadora.limpa_campos(prefixo: ShortString);
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
        TsComboEdit(components[i]).Clear
      else if Components[i] is TMaskEdit then
        TMaskEdit(components[i]).Clear
      else if Components[i] is TRichEdit then
        TRichEdit(components[i]).Clear;

      LbNom_cidade.Caption := '...';

    end;
  end;

end;

procedure TFr_Transportadora.mostra_campos(prefixo: ShortString);
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
        TsEdit(FindComponent(campo)).Text :=
          q_transportadora.fieldbyname(campo1).AsString;
      end
      else if Components[i] is tscheckbox then
      begin
        campo := tscheckbox(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        if q_transportadora.fieldbyname(campo1).AsString = 'S' then
          tscheckbox(FindComponent(campo)).Checked := true
        else
          tscheckbox(FindComponent(campo)).Checked := false;
      end
      else if Components[i] is TsComboEdit then
      begin
        campo := TsComboEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        TsComboEdit(FindComponent(campo)).Text :=
          q_transportadora.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TRichEdit then
      begin
        campo := TRichEdit(Components[i]).Name;
        campo1 := copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
        TRichEdit(FindComponent(campo)).Text :=
          q_transportadora.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TMaskEdit then
      begin
        campo := TMaskEdit(Components[i]).Name;
        campo1 := copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
        TMaskEdit(FindComponent(campo)).Text :=
          q_transportadora.fieldbyname(campo1).AsString;
      end;
    end;
  end; //end do for

  LbNom_cidade.Caption := q_transportadora.fieldbyname('nom_cidade').AsString;

  Screen.Cursor := crDefault;

  PRCod_cidadeExit(self);

end;

procedure TFr_Transportadora.readonly_false(prefixo: ShortString);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).ReadOnly := false
      else if Components[i] is TsDateEdit then
        TsDateEdit(components[i]).ReadOnly := false
      else if Components[i] is TsComboEdit then
        TsComboEdit(components[i]).ReadOnly := false
      else if Components[i] is tscheckbox then
        tscheckbox(components[i]).enabled := true
      else if Components[i] is TMaskEdit then
        TMaskEdit(components[i]).ReadOnly := false;


    end;
  end;

end;

procedure TFr_Transportadora.readonly_true(prefixo: ShortString);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).ReadOnly := True
      else if Components[i] is TsComboEdit then
        TsComboEdit(components[i]).ReadOnly := True
      else if Components[i] is tscheckbox then
        tscheckbox(components[i]).enabled := false
      else if Components[i] is TMaskEdit then
        TMaskEdit(components[i]).ReadOnly := True;

    end;
  end;

end;

procedure TFr_Transportadora.BtAltClick(Sender: TObject);
begin
  try
    modo_insert := false;
    readonly_false('Pr');
    //habilita botões
    btnov.Enabled := false;
    btalt.Enabled := false;
    btgra.Enabled := true;
    btcan.Enabled := true;
    btexc.Enabled := false;
    BtLocalizar.Enabled := false;

    PrNome.SetFocus;

  except
  end;

end;

procedure TFr_Transportadora.BtCanClick(Sender: TObject);
begin
  try
    if MessageDlg('Deseja Cancelar está Operação?', mtConfirmation, [mbyes,
      mbno], 0) = mryes then
    begin
      btnov.Enabled := true;
      btalt.Enabled := true;
      btgra.Enabled := false;
      btcan.Enabled := False;
      btexc.Enabled := true;
      BtLocalizar.Enabled := true;

      if modo_insert then
      begin
        limpa_campos('Pr');
        readonly_true('Pr');
      end
      else if not (modo_insert) then
      begin
        mostra_campos(q_transportadora.fieldbyname('cod_transportadora').AsString);
      end;
      if dados_incompletos then
        modalresult := mrcancel;
    end
    else
      exit;
  except
  end;

end;

procedure TFr_Transportadora.BtExcClick(Sender: TObject);
begin
  try
    if PrCod_transportadora.Text = '' then
    begin
      showmessage('Não é possivel excluir esta Transportadora por não ter Código!');
      BtNov.SetFocus;
      Exit;
    end;

    if MessageDlg('Tem Certeza que Deseja Excluir Esta Transportadora?',
      mtConfirmation, [mbyes, mbno], 0) = mryes then
    begin
      //exclui os registros filho..
      dao.delete('cod_transportadora',
        q_transportadora.fieldbyname('cod_transportadora').AsString,
        'transportadora');

      dao.msg('Transportadora excluido com sucesso!');
      limpa_campos('Pr');
    end;
  except
    on e: Exception do
    begin
      dao.msg('Houve um erro ao Excluir a Transportadora!' + #13 +
        e.message);
    end;
  end;

end;

procedure TFr_Transportadora.BtGraClick(Sender: TObject);
begin
  try
    if PrNome.Text = '' then
    begin
      dao.msg('O campo nome da trasportadora deve ser preenchido!');
      exit;
    end;

    if modo_insert then
    begin
      try
       // if not (dao.cn.InTransaction) then
          dao.cn.StartTransaction;
        id := dao.insert('Pr', 'transportadora', 'cod_transportadora',
          Fr_Transportadora, 'gen_transportadora');
        dao.cn.Commit;
      except
        dao.cn.rollback;
      end;
      PrCod_transportadora.Text := id;
      ativa_transportadora(id);
    end
    else
    begin
      try
       // if not (dao.cn.InTransaction) then
          dao.cn.StartTransaction;
        dao.update('transportadora', 'cod_transportadora',
          q_transportadora.fieldbyname('cod_transportadora').AsString, 'Pr',
          Fr_Transportadora);
        dao.cn.commit;
      except
        dao.cn.rollback;
      end;

      ativa_transportadora(PrCod_transportadora.Text);

    end;

    if not FMFUN.ValidaDadosTransportadora(prcod_transportadora.Text) then
    begin
      btaltclick(self);
      ChecarDadosIncompletos;
      exit;
    end
    else
      ChecarDadosIncompletos;

    if dados_incompletos then
      modalresult := mrok;

    mostra_campos('Pr');
    if Fr_Transportadora.xml_nfe then
      ModalResult := mrOk;

    btnov.Enabled := true;
    btalt.Enabled := true;
    btgra.Enabled := false;
    btcan.Enabled := False;
    btexc.Enabled := true;
    BtLocalizar.Enabled := true;
    readonly_true('Pr');
  except
    on e: Exception do
    begin
      dao.msg('Houve um erro ao Gravar a Transportadora!' + #13 +
        e.message);
    end;
  end;
end;

procedure TFr_Transportadora.BtLocalizarClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Transportadora';
  chamou_pesquisa := 'fr_transportadora';
  chamou_form := 'fr_transportadora';
  chamou_cadastro := 'Fr_transportadora';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Fornecedores';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';

  for i := 0 to 1 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  if campo_pesquisado <> '' then
  begin
    Fr_localizar.CBcampos.ItemIndex :=
      Fr_localizar.CBcampos.Items.IndexOf(campo_pesquisado);
    Fr_localizar.EDlocalizar.Text := dado_pesquisado;
    Fr_localizar.zzbusca_qualquer.Checked := busca_qualquer_posicao_pesquisada;
    Fr_localizar.loc_transportadora(Fr_localizar.EDlocalizar.Text);
  end;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_Transportadora.BtNovClick(Sender: TObject);
begin
  try
    modo_insert := true;
    readonly_false('Pr');

    PrNome.SetFocus;

    //habilita botões
    btnov.Enabled := false;
    btalt.Enabled := false;
    btgra.Enabled := true;
    btcan.Enabled := true;
    btexc.Enabled := false;
    BtLocalizar.Enabled := false;

    Limpa_campos('Pr');

  except

  end;

end;

procedure TFr_Transportadora.PrNomeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_Transportadora.FormShow(Sender: TObject);
begin
  limpa_campos('Pr');
  readonly_true('Pr');

  if dados_incompletos then
  begin
    ativa_transportadora(transportadora);
    mostra_campos('Pr');
    btaltclick(self);
    ChecarDadosIncompletos;
  end;

  if xml_nfe then
  begin
    BtNovClick(Self);
    PrNome.Text := xml_razao_socia;
    PrCNPJ.Text := xml_cnpj;
    PrIE.Text := xml_ie;
    PrEndereco.Text := xml_endereco;

    dao.Geral2('select * from cidades c where c.nom_cidade like ' +
      QuotedStr(xml_cidade) + ' and c.uf = ' + QuotedStr(xml_uf));
    if not dao.q2.IsEmpty then
    begin
      PrCod_cidade.Text := dao.Q2.fieldbyname('cod_cidade').AsString;
      LbNom_cidade.Caption := xml_cidade + ' - ' + xml_uf;
    end;
  end;

end;

procedure TFr_Transportadora.PrCod_cidadeButtonClick(Sender: TObject);
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
  chamou_form := 'fr_transportadora_cidade';
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

procedure TFr_Transportadora.FormCloseQuery(Sender: TObject;
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

procedure TFr_Transportadora.Prpercentual_freteEnter(Sender: TObject);
begin
  if not (Prfrete_fixo.Checked) then
    SelectNext(sender as TWinControl, true, true);
end;

procedure TFr_Transportadora.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TFr_Transportadora.BtBuscaEndClick(Sender: TObject);
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

procedure TFr_Transportadora.PrCod_cidadeExit(Sender: TObject);
begin
  if trim(PrCod_Cidade.Text) <> '' then
  begin
    dao.Geral2('select NOM_CIDADE, UF from cidades where cod_cidade = ' +
      QuotedStr(PrCod_Cidade.Text));

    if dao.q2.RecordCount > 0 then
      LbNom_cidade.Caption := dao.Q2.fieldbyname('NOM_CIDADE').AsString + '-' +
        dao.Q2.fieldbyname('UF').AsString
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

procedure TFr_Transportadora.BtBuscaCEPClick(Sender: TObject);
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

  dao.Geral2('select NOM_CIDADE, UF from cidades where cod_cidade = ' +
    QuotedStr(PrCod_Cidade.Text));

  tipo_logradouro := copy(prEndereco.text, 1, pos(' ', prEndereco.text));
  logradouro := copy(prEndereco.text, pos(' ', prEndereco.text),
    length(prEndereco.text));
  numero := '1';
  bairro := prbairro.Text;
  uf := dao.Q2.fieldbyname('uf').AsString;
  cidade := dao.Q2.fieldbyname('nom_cidade').AsString;

  dados_consulta_cep := TStringList.Create;
  dados_consulta_cep := FRPRI.BuscaCEP(tipo_logradouro, logradouro, uf, cidade,
    bairro, numero);
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

procedure TFr_Transportadora.rgTipoPessoaClick(Sender: TObject);
begin
  if rgTipoPessoa.ItemIndex = 0 then
  begin
    PrTip_Pessoa.Text := 'J';
    PrCNPJ.Enabled := true;
    PrCPF.Enabled := false;
  end
  else begin
    PrTip_Pessoa.Text := 'F';
    PrCNPJ.Enabled := false;
    PrCPF.Enabled := true;
  end;
  PrCNPJ.Clear;
  PrCPF.Clear;
end;

procedure TFr_Transportadora.ACBrCEP1BuscaEfetuada(Sender: TObject);
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
//        prcomplemento.Text := Complemento;
        prbairro.Text := Bairro;
        PrCod_cidade.Text := COPY(IBGE_Municipio, 1, 6);
        PrCod_cidadeExit(Self);
      end;
    end;
  end;
end;

procedure TFr_Transportadora.BtnBuscarCNPJClick(Sender: TObject);
var
  PJ: boolean;
  Documento, RazaoSocial, Fantasia, CEP, Endereco, Numero, Complemento, Bairro,
    Cidade, UF, EmpresaTipo, Situacao: string;
begin
  PJ := rgTipoPessoa.ItemIndex = 0;
  if PJ then
    Documento := PrCNPJ.Text
  else
    Documento := PrCPF.Text;

  FMFUN.BuscaDadosPorCNPJJson(Documento, RazaoSocial, Fantasia, CEP, Endereco,
    Numero, Complemento, Bairro, Cidade, UF, EmpresaTipo, Situacao);

  PrNome.Text := RazaoSocial;
  PrCep.Text := FMFUN.FormataCEP(CEP);
  if Trim(Numero) <> '' then
    PrEndereco.Text := Endereco + ', ' + Numero
  else
    PrEndereco.Text := Endereco;
  PrBairro.Text := Bairro;

  dao.Geral2('select COD_CIDADE, NOM_CIDADE, UF from cidades where UF = ''' + UF + ''' AND NOM_cidade = ' +
    QuotedStr(Cidade));

  if dao.q2.RecordCount > 0 then
  begin
    LbNom_cidade.Caption := dao.Q2.FieldByName('NOM_CIDADE').AsString + '-'
      + dao.Q2.FieldByName('UF').AsString;
    PrCod_cidade.Text := dao.Q2.FieldByName('COD_CIDADE').AsString;
  end;
end;
end.







