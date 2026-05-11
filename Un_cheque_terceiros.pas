unit Un_cheque_terceiros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask,
   ACBrValidador, ExtCtrls,
  sPanel, sBitBtn, sLabel, sCheckBox, sTooledit, 
  sMaskEdit, sCustomComboEdit, sCurrEdit, sCurrencyEdit, sEdit, sComboEdit,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFr_cheque_terceiros = class(TForm)
    Q_cheque_terceiros: TFDQuery;
    Prnr_cheque: TsEdit;
    Label1: tsLabel;
    Label5: tsLabel;
    Prnr_conta_corrente: TsEdit;
    Prnr_banco: TsEdit;
    Label2: tsLabel;
    Prnr_agencia: TsEdit;
    Label6: tsLabel;
    Prnom_titular: TsEdit;
    Label4: tsLabel;
    Label9: tsLabel;
    Lbcpf: tsLabel;
    Prcpf: TMaskEdit;
    Prcnpj: TMaskEdit;
    Label11: tsLabel;
    Label3: tsLabel;
    Prvalor: TsCurrencyEdit;
    Prcheque_depositado: tscheckbox;
    Prdta_vencimento: TsDateEdit;
    Label8: tsLabel;
    Label7: tsLabel;
    Prdta_emissao: TsDateEdit;
    Prid: TsEdit;
    Prcod_empresa: TsEdit;
    Panel1: tsPanel;
    BtLocalizar: TsBitBtn;
    btexc: TsBitBtn;
    btalt: TsBitBtn;
    btgra: TsBitBtn;
    Btnov: TsBitBtn;
    btcan: TsBitBtn;
    Label12: tsLabel;
    Prtitulo_cr1: TsEdit;
    Label13: tsLabel;
    Prseq_cr1: TsEdit;
    Label14: tsLabel;
    Label16: tsLabel;
    Edit7: TsEdit;
    Label17: tsLabel;
    Edit8: TsEdit;
    Label18: tsLabel;
    Label19: tsLabel;
    Label20: tsLabel;
    Prcod_cliente: TsComboEdit;
    Lbnom_cliente: tsLabel;
    Prcod_fornecedor: TsComboEdit;
    Lbfornecedor: tsLabel;
    Prtelefone: TMaskEdit;
    procedure btaltClick(Sender: TObject);
    procedure btcanClick(Sender: TObject);
    procedure btexcClick(Sender: TObject);
    procedure btgraClick(Sender: TObject);
    procedure BtnovClick(Sender: TObject);
    procedure Prnr_chequeKeyPress(Sender: TObject; var Key: Char);
    procedure BtLocalizarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PrcnpjExit(Sender: TObject);
    procedure PrcpfExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Prcod_clienteButtonClick(Sender: TObject);
    procedure Prcod_clienteExit(Sender: TObject);
    procedure Prcod_clienteKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_fornecedorButtonClick(Sender: TObject);
    procedure Prcod_fornecedorExit(Sender: TObject);
    procedure Prcod_fornecedorKeyPress(Sender: TObject;
      var Key: Char);
    procedure Prseq_cr1Exit(Sender: TObject);
    procedure Prtitulo_cr1Exit(Sender: TObject);

  private
    { Private declarations }
  public
    id: string;
    modo_insert: boolean;
    conta_descontada : boolean;
    busca_qualquer_posicao_pesquisada: boolean;
    campo_pesquisado, dado_pesquisado: string;

    procedure ativa_cheque_terceiros(id: string);
    procedure limpa_campos(prefixo: ShortString);
    procedure readonly_false(prefixo: ShortString);
    procedure readonly_true(prefixo: ShortString);
    procedure mostra_campos(prefixo: ShortString);

    { Public declarations }
  end;

var
  Fr_cheque_terceiros: TFr_cheque_terceiros;

implementation

uses Un_dao, UnPri, Un_localizar, UnFun;

{$R *.dfm}

procedure TFr_cheque_terceiros.btaltClick(Sender: TObject);
begin
  modo_insert := false;
  readonly_false('Pr');
  //habilita botões

  btnov.Enabled := false;
  btalt.Enabled := false;
  btgra.Enabled := true;
  btcan.Enabled := true;
  btexc.Enabled := false;
  Prnr_cheque.SetFocus;
end;

procedure TFr_cheque_terceiros.btcanClick(Sender: TObject);
begin
  try
    if MessageDlg('Deseja Cancelar está Operação?', mtConfirmation, [mbyes, mbno], 0) = mryes then
    begin
      btnov.Enabled := true;
      btalt.Enabled := true;
      btgra.Enabled := false;
      btcan.Enabled := False;
      btexc.Enabled := true;

      if modo_insert then
      begin
        Limpa_campos('Pr');
        readonly_true('Pr');
      end
      else if modo_insert = false then
      begin
        mostra_campos('Pr');
        readonly_true('Pr');
      end;
    end
    else
      exit;
  except
  end;

end;

procedure TFr_cheque_terceiros.btexcClick(Sender: TObject);
begin
  if MessageDlg('Deseja Excluir o Titulo', mtConfirmation, [mbYes, mbno], 0) = mryes then
  begin
    try
      if not (dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      dao.Execsql('delete from cheque_terceiros where id = ' + QuotedStr(Prid.Text));
      dao.cn.Commit;
      dao.msg('Cheque Excluido com Sucesso!');
    except
      dao.cn.rollback;
    end;
  end;

end;

procedure TFr_cheque_terceiros.btgraClick(Sender: TObject);
begin
  if Prnr_cheque.Text = '' then
  begin
    dao.msg('O campo Nº Cheque deve ser preenchido!');
    Prnr_cheque.SetFocus;
  end;
  if Prnr_agencia.Text = '' then
  begin
    dao.msg('O campo Nº Agência deve ser preenchido!');
    Prnr_agencia.SetFocus;
  end;
  if Prnr_conta_corrente.Text = '' then
  begin
    dao.msg('O campo Nº Conta Corrente deve ser preenchido!');
    Prnr_conta_corrente.SetFocus;
  end;

  if Prnom_titular.Text = '' then
  begin
    dao.msg('O campo Nome Titular deve ser preenchido!');
    Prnom_titular.SetFocus;
  end;

  if Prvalor.Value = 0 then
  begin
    dao.msg('O campo Vlr Cheque deve ser preenchido!');
    Prvalor.SetFocus;
    exit;
  end;

  if Prdta_vencimento.Text = '  /  /    ' then
  begin
    dao.msg('O campo Data Vencimento deve ser preenchido!');
    Prdta_vencimento.SetFocus;
    exit;
  end;

  btnov.Enabled := true;
  btalt.Enabled := true;
  btgra.Enabled := false;
  btcan.Enabled := False;
  btexc.Enabled := true;

  Screen.Cursor := crSQLWait;
  try
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    if modo_insert then
    begin
      id := dao.insert('Pr', 'cheque_terceiros', 'id', Fr_cheque_terceiros, 'gen_cheque_terceiros');
      Prid.Text := id;
      ativa_cheque_terceiros(id);
      btNov.setFocus;
    end
    else
      dao.update('cheque_terceiros+', 'id', Prid.Text, 'Pr', Fr_cheque_terceiros);

    dao.cn.Commit;

    Screen.Cursor := crDefault;

    readonly_true('Pr');
  except
    dao.cn.rollback;
  end;
end;

procedure TFr_cheque_terceiros.BtnovClick(Sender: TObject);
begin
  modo_insert := true;
  readonly_false('Pr');
  Prnr_cheque.SetFocus;
  //habilita botões
  btnov.Enabled := false;
  btalt.Enabled := false;
  btgra.Enabled := true;
  btcan.Enabled := true;
  btexc.Enabled := false;
  Limpa_campos('Pr');
  Prcod_empresa.Text := cod_empresa;
end;

procedure TFr_cheque_terceiros.readonly_false(prefixo: ShortString);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).ReadOnly := false
      else if Components[i] is tscheckbox then
        tscheckbox(components[i]).enabled := true
      else if Components[i] is TsDateEdit then
        TsDateEdit(components[i]).ReadOnly := false
      else if Components[i] is TsComboEdit then
        TsComboEdit(components[i]).ReadOnly := false
      else if Components[i] is TsDateEdit then
        TsDateEdit(components[i]).ReadOnly := false
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(components[i]).ReadOnly := false
      else if Components[i] is TMaskEdit then
        TMaskEdit(components[i]).ReadOnly := false;
    end;
  end;

end;

procedure TFr_cheque_terceiros.readonly_true(prefixo: ShortString);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Copy(Components[i].Name, 1, 2) = prefixo then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).ReadOnly := True
      else if Components[i] is tscheckbox then
        tscheckbox(components[i]).enabled := false
      else if Components[i] is TsComboEdit then
        TsComboEdit(components[i]).ReadOnly := True
      else if Components[i] is TsDateEdit then
        TsDateEdit(components[i]).ReadOnly := True
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(components[i]).ReadOnly := True
      else if Components[i] is TMaskEdit then
        TMaskEdit(components[i]).ReadOnly := True;


    end;
  end;
end;

procedure TFr_cheque_terceiros.limpa_campos(prefixo: ShortString);
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
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(components[i]).Clear
      else if Components[i] is TsDateEdit then
        TsDateEdit(components[i]).Clear;
    end;
  end;

end;

procedure TFr_cheque_terceiros.ativa_cheque_terceiros(id: string);
begin
  with Q_cheque_terceiros do
  begin
    close;
    sql.clear;
    sql.add('select * from cheque_terceiros ' +
      'where id = ' + QuotedStr(id));
    open;
  end;

end;

procedure TFr_cheque_terceiros.mostra_campos(prefixo: ShortString);
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
        TsEdit(FindComponent(campo)).Text := Q_cheque_terceiros.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TsComboEdit then
      begin
        campo := TsComboEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        TsComboEdit(FindComponent(campo)).Text := Q_cheque_terceiros.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TsCurrencyEdit then
      begin
        campo := TsCurrencyEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        TsCurrencyEdit(FindComponent(campo)).Value := Q_cheque_terceiros.fieldbyname(campo1).AsFloat;
      end
      else if Components[i] is TComboBox then
      begin
        campo := TComboBox(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);

        TComboBox(FindComponent(campo)).ItemIndex := Q_cheque_terceiros.fieldbyname(campo1).AsInteger;
      end
      else if Components[i] is tscheckbox then
      begin
        campo := tscheckbox(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        if Q_cheque_terceiros.fieldbyname(campo1).AsString = 'S' then
          tscheckbox(FindComponent(campo)).Checked := true
        else
          tscheckbox(FindComponent(campo)).Checked := false;
      end

      else if Components[i] is TsDateEdit then
      begin
        campo := TsDateEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);

        TsDateEdit(FindComponent(campo)).Date := Q_cheque_terceiros.fieldbyname(campo1).AsDateTime;
      end;

    end;

  end; //end do for
  Screen.Cursor := crDefault;

end;

procedure TFr_cheque_terceiros.Prnr_chequeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_cheque_terceiros.BtLocalizarClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Entradas';
  chamou_pesquisa := 'fr_cheque_terceiros';
  chamou_form := 'fr_cheque_terceiros';
  chamou_cadastro := 'Fr_cheque_terceiros';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cheque Terceiros';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 6);
  Campos_combo[0] := 'Nº Cheque';
  Campos_combo[1] := 'Nº Agência';
  Campos_combo[2] := 'Nº Conta Corrente';
  Campos_combo[3] := 'Titular';
  Campos_combo[4] := 'Data Vencimento';
  Campos_combo[5] := 'Valor';

  for i := 0 to 5 do
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
    Fr_localizar.loc_cheque_terceiros(Fr_localizar.EDlocalizar.Text);
  end;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;
  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_cheque_terceiros.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #27 then
  begin
    close;
  end;
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TFr_cheque_terceiros.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if BtNov.Enabled = false then
  begin
    showmessage('<ATENÇÃO>ALGUM BOTÃO GRAVAR/CANCELAR ESTÁ PENDENTE!<ATENÇÃO>');
    CanClose := FALSE;
  end
  else
    CanClose := true;

end;

procedure TFr_cheque_terceiros.PrcnpjExit(Sender: TObject);
var
  passou: Boolean;
begin
  if Prcnpj.Text = '  .   .   \    -  ' then
    exit;

  //tipos de documentos:  docCPF,docCNPJ, docInscEst,docCEP,docNumCheque
  if BtNov.Enabled = false then
  begin
    passou := FRPRI.valida_doc(PrCNPJ.Text, docCNPJ);
    if not (passou) then
    begin
      dao.msg('CNPJ inválido!');
      Prcnpj.Clear;
      Prdta_emissao.SetFocus;
    end;
  end;

end;

procedure TFr_cheque_terceiros.PrcpfExit(Sender: TObject);
var
  passou: boolean;
begin
  if PrCPF.Text = '   .   .   -  ' then
    exit;

  //tipos de documentos:  docCPF,docCNPJ, docInscEst,docCEP,docNumCheque
  if BtNov.Enabled = false then
  begin
    passou := FRPRI.valida_doc(PrCPF.Text, docCPF);
    if not (passou) then
    begin
      dao.msg('CPF inválido!');
      PrCPF.SetFocus;
    end;
  end;

end;

procedure TFr_cheque_terceiros.FormShow(Sender: TObject);
begin
  readonly_true('Pr');
  if conta_descontada then
  begin
    BtnovClick(self);
    btgra.ModalResult := mrOk;
    btcan.ModalResult := mrCancel;

  end;
end;

procedure TFr_cheque_terceiros.Prcod_clienteButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Cliente';
  chamou_pesquisa := 'fr_cliente';
  chamou_form := 'fr_cliente_cht';
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

procedure TFr_cheque_terceiros.Prcod_clienteExit(Sender: TObject);
begin
  if trim(Prcod_cliente.Text) = '' then
    Lbnom_cliente.Caption := '...';

  if Prcod_cliente.Text <> '' then
  begin
    dao.Geral2('select nom_cliente from cliente where cod_cliente=' + QuotedStr(Prcod_cliente.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_cliente.Caption := dao.Q2.fieldbyname('nom_cliente').AsString;
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

procedure TFr_cheque_terceiros.Prcod_clienteKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin
  if not (key in ['0'..'9', #8]) and (key <> #13) then
  begin
    beep; {somente delphi 2.0 ou >}
    key := #0;
  end;

  if key = #13 then
  begin
    if (Prcod_cliente.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Cliente';
      chamou_pesquisa := 'fr_cliente';
      chamou_form := 'fr_cliente_cht';
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

    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_cheque_terceiros.Prcod_fornecedorButtonClick(Sender: TObject);
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
  chamou_form := 'fr_fornecedor_cht';
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

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;
  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_cheque_terceiros.Prcod_fornecedorExit(Sender: TObject);
begin
  if trim(Prcod_fornecedor.Text) = '' then
    Lbfornecedor.Caption := '...';

  if Prcod_fornecedor.Text <> '' then
  begin
    dao.Geral2('select razao_social from fornecedor where cod_fornecedor=' + QuotedStr(Prcod_fornecedor.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbfornecedor.Caption := dao.Q2.fieldbyname('razao_social').AsString;
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

procedure TFr_cheque_terceiros.Prcod_fornecedorKeyPress(Sender: TObject;
  var Key: Char);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;

begin
  if not (key in ['0'..'9', #8]) and (key <> #13) then
  begin
    beep; {somente delphi 2.0 ou >}
    key := #0;
  end;

  if key = #13 then
  begin
    if (Prcod_fornecedor.Text = '') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Fornecedor';
      chamou_pesquisa := 'fr_fornecedor';
      chamou_form := 'fr_fornecedor_cp1';
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

procedure TFr_cheque_terceiros.Prseq_cr1Exit(Sender: TObject);
begin
  if (Prtitulo_cr1.Text <> '') and (Prseq_cr1.Text <> '') then
  begin
    dao.Geral1('select cr1.cod_cliente, c.nom_cliente from cr1 cr1 ' +
      'left join cliente c on c.cod_cliente=cr1.cod_cliente ' +
      'where titulo=' + QuotedStr(Prtitulo_cr1.Text) + ' and sequencia=' + QuotedStr(Prseq_cr1.Text));
    if dao.Q1.RecordCount > 0 then
    begin
      Prcod_cliente.Text := dao.Q1.fieldbyname('cod_cliente').AsString;
      Lbnom_cliente.Caption := dao.Q1.fieldbyname('nom_cliente').AsString;
    end;
  end;
end;

procedure TFr_cheque_terceiros.Prtitulo_cr1Exit(Sender: TObject);
begin
  Prtitulo_cr1.Text := FMFUN.enchezero(Prtitulo_cr1.Text, 6);
end;

end.
