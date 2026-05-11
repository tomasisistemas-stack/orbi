unit Un_conta_corrente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,  Mask, ExtCtrls,
  sPanel, sBitBtn, sLabel, sCheckBox, sGroupBox, sMaskEdit, 
  sCustomComboEdit, sTooledit, sEdit, sComboEdit, sCurrEdit, sCurrencyEdit,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFr_conta_corrente = class(TForm)
    Panel1: tsPanel;
    btnov: TsBitBtn;
    btalt: TsBitBtn;
    btgra: TsBitBtn;
    btcan: TsBitBtn;
    btexc: TsBitBtn;
    btpro: TsBitBtn;
    GroupBox1: TsGroupBox;
    gbPlano: TsGroupBox;
    Lbnom_plano_contas_N1: tsLabel;
    Lbnom_plano_contas_N2: tsLabel;
    Lbnom_plano_contas_N3: tsLabel;
    Lbnom_plano_contas_N4: tsLabel;
    Prid_plano_contas: TsComboEdit;
    gbCodigo: TsGroupBox;
    Prid: TsEdit;
    gbNome: TsGroupBox;
    Prnom_conta: TsEdit;
    gbNrAgencia: TsGroupBox;
    Prnr_agencia: TsEdit;
    gbAbertura: TsGroupBox;
    Prdta_abertura_conta: TsDateEdit;
    gbBanco: TsGroupBox;
    Prid_banco: TsComboEdit;
    Lbbanco: tsLabel;
    gbConta: TsGroupBox;
    PrNr_Conta: TsEdit;
    gbCodigoCedente: TsGroupBox;
    PrCodigo_Cedente: TsEdit;
    sGroupBox1: TsGroupBox;
    lb_empresa: TsLabel;
    Prid_empresa: TsComboEdit;
    PrAtivo: TsCheckBox;
    gbCarteira: TsGroupBox;
    PrCarteira: TsEdit;
    gbDiasProtestar: TsGroupBox;
    PrDias_Protesto: TsCurrencyEdit;
    gbCodigoConvenio: TsGroupBox;
    PrConvenio: TsEdit;
    gbDiasBaixar: TsGroupBox;
    PrDias_Baixar: TsCurrencyEdit;
    gbModalidade: TsGroupBox;
    PrModalidade: TsEdit;
    sGroupBox2: TsGroupBox;
    PrMensagem_Padrao: TMemo;
    q_conta_corrente: TFDQuery;
    procedure btnovClick(Sender: TObject);
    procedure btaltClick(Sender: TObject);
    procedure btgraClick(Sender: TObject);
    procedure btcanClick(Sender: TObject);
    procedure btexcClick(Sender: TObject);
    procedure Prid_bancoButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btproClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Prnom_contaKeyPress(Sender: TObject; var Key: Char);
    procedure Prnr_agenciaKeyPress(Sender: TObject; var Key: Char);
    procedure Prdta_abertura_contaKeyPress(Sender: TObject; var Key: Char);
    procedure Prid_bancoKeyPress(Sender: TObject; var Key: Char);
    procedure Prid_plano_contasButtonClick(Sender: TObject);
    procedure Prid_plano_contasExit(Sender: TObject);
    procedure Prid_empresaExit(Sender: TObject);
    procedure Prid_empresaButtonClick(Sender: TObject);
    procedure Prid_bancoExit(Sender: TObject);

  private
    procedure Limpa_campos;
    procedure readonly_true;
    procedure readonly_false;
    { Private declarations }
  public
    busca_qualquer_posicao_pesquisada: boolean;
    campo_pesquisado, dado_pesquisado: string;

    modo_insert: Boolean;
    tipo: char;
    id: string;
    procedure mostra_campos(prefixo: string);
    procedure ativa_conta(id: string);
  end;

var
  Fr_conta_corrente: TFr_conta_corrente;

implementation

uses Un_dao, UnPri, Un_localizar, un_definir_saldo_inicial, UnFun;

{$R *.dfm}

procedure TFr_conta_corrente.btnovClick(Sender: TObject);
begin
  modo_insert := true;
  readonly_false;
  PRnom_conta.SetFocus;
  btnov.Enabled := false;
  btalt.Enabled := false;
  btgra.Enabled := true;
  btcan.Enabled := true;
  btexc.Enabled := false;
  btpro.Enabled := false;
end;

procedure TFr_conta_corrente.btaltClick(Sender: TObject);
begin
  if Prid.Text = '' then
  begin
    dao.msg('LOCALIZE UMA CONTA CORRENTE ANTES DE ALTERAR!');
    exit;
  end;
  modo_insert := false;
  readonly_false;
  btnov.Enabled := false;
  btalt.Enabled := false;
  btgra.Enabled := true;
  btcan.Enabled := true;
  btexc.Enabled := false;
  btpro.Enabled := false;
end;

procedure TFr_conta_corrente.mostra_campos(prefixo: string);
var
  campo, campo1: string; //campo tem o nome do  sem tirar as primeiras letras
  //campo1 tem o nome do campo tirando as 1º letras.
  I: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
    begin
      campo := TsEdit(Components[i]).Name;
      campo1 := campo;
      campo1 := copy(campo, 3, 50);
      TsEdit(FindComponent(campo)).Text := q_conta_corrente.fieldbyname(campo1).AsString;

    end
    else if Components[i] is TsCurrencyEdit then
    begin
      campo := TsEdit(Components[i]).Name;
      campo1 := campo;
      campo1 := copy(campo, 3, 50);
      TsCurrencyEdit(FindComponent(campo)).Value := q_conta_corrente.fieldbyname(campo1).AsInteger;
    end
    else if Components[i] is TsDateEdit then
    begin
      campo := TsDateEdit(Components[i]).Name;
      campo1 := campo;
      campo1 := copy(campo, 3, 50);

      TsDateEdit(FindComponent(campo)).Date := q_conta_corrente.fieldbyname(campo1).AsDateTime;
    end
    else if Components[i] is TsComboEdit then
    begin
      campo := TsComboEdit(Components[i]).Name;
      campo1 := campo;
      campo1 := copy(campo, 3, 50);
      TsComboEdit(FindComponent(campo)).Text := q_conta_corrente.fieldbyname(campo1).AsString;
    end
    else if Components[i] is TMemo then
    begin
      campo := TsComboEdit(Components[i]).Name;
      campo1 := campo;
      campo1 := copy(campo, 3, 50);
      TMemo(FindComponent(campo)).Lines.Text := q_conta_corrente.fieldbyname(campo1).AsString;
    end
    else if Components[i] is tscheckbox then
    begin
      campo := tscheckbox(Components[i]).Name;
      campo1 := campo;
      campo1 := copy(campo, 3, 50);
      if q_conta_corrente.fieldbyname(campo1).AsString = 'S' then
        tscheckbox(FindComponent(campo)).Checked := true
      else
        tscheckbox(FindComponent(campo)).Checked := false;
    end;
  end;

  Prid_plano_contasExit(Self);
  prid_empresaExit(Self);
end; //end do for

procedure TFr_conta_corrente.ativa_conta(id: string);
begin
  with q_conta_corrente do
  begin
    close;
    SQL.Clear;
    SQL.add('select * from conta_corrente where id = ' + QuotedStr(id));
    open;
  end;

end;

procedure TFr_conta_corrente.Limpa_campos;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).Clear
    else if Components[i] is TsDateEdit then
      TsDateEdit(Components[i]).Clear;
  end;

end;

procedure TFr_conta_corrente.readonly_true;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := True
    else if Components[i] is TsCurrencyEdit then
      TsCurrencyEdit(Components[i]).ReadOnly := True
    else if Components[i] is TsCheckBox then
      TsCheckBox(Components[i]).ReadOnly := True
    else if Components[i] is TsDateEdit then
      TsDateEdit(Components[i]).ReadOnly := True;
  end;
end;

procedure TFr_conta_corrente.readonly_false;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := False
    else if Components[i] is TsCurrencyEdit then
      TsCurrencyEdit(Components[i]).ReadOnly := False
    else if Components[i] is TsCheckBox then
      TsCheckBox(Components[i]).ReadOnly := False
    else if Components[i] is TsDateEdit then
      TsDateEdit(Components[i]).ReadOnly := False;
  end;
end;

procedure TFr_conta_corrente.btgraClick(Sender: TObject);
var
  extrato: integer;
begin
  try
    if trim(prid_empresa.text) = '' then
    begin
      showmessage('Empresa Associada deve ser preenchida.');
      prid_empresa.SetFocus;
      exit;
    end;
   {
    if trim(Prid_plano_contas.text) = '' then
    begin
      showmessage('Plano de Contas deve ser preenchido.');
      Prid_plano_contas.SetFocus;
      exit;
    end;

    if trim(Prid_banco.text) = '' then
    begin
      showmessage('Banco deve ser preenchido.');
      Prid_banco.SetFocus;
      exit;
    end;}

    if (modo_insert) and (BtNov.Enabled = false) then
    begin
      dao.Geral2('select nom_conta from conta_corrente where nom_conta=' + QuotedStr(Prnom_conta.Text));
      if dao.Q2.RecordCount > 0 then
      begin
        dao.msg('FOI ENCONTRADO UMA CONTA CORRENTE COM O MESMO NOME' + #13 + 'VERIFIQUE SE VOCÊ NÃO ESTÁ CADASTRANDO A MESMA CONTA 2 VEZES!');
        Prnom_conta.SetFocus;
        Exit;
      end;

      if PRnom_conta.text = '' then
      begin
        dao.msg('VOCÊ DEVE COLOCAR OS DADOS DA CONTA CORRENTE ANTES DE GRAVA-LA!');
        Exit;
      end;

    end;

    btnov.Enabled := true;
    btalt.Enabled := true;
    btgra.Enabled := false;
    btcan.Enabled := False;
    btexc.Enabled := true;
    btpro.Enabled := true;

    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;

    if modo_insert then
    begin
      id := dao.insert('Pr', 'conta_corrente', 'id', Fr_conta_corrente, 'gen_conta_corrente');
      Prid.Text := id;
      ativa_conta(id);
      //definir Saldo Inicial da Conta/Caixa
      try
        Application.CreateForm(Tfm_definir_saldo_inicial, fm_definir_saldo_inicial);
        fm_definir_saldo_inicial.gbPeso.Visible := false;
        fm_definir_saldo_inicial.ckMostra.Visible := false;
        fm_definir_saldo_inicial.ckEmpresa.Visible := false;
        fm_definir_saldo_inicial.Height := 122;
        fm_definir_saldo_inicial.ShowModal;
        if fm_definir_saldo_inicial.ModalResult = mrOk then
          extrato := fmfun.GravaExtrato('SALDO INICIAL', QuotedStr(formatdatetime('dd/mm/yyyy', Now)), id, 'C', fm_definir_saldo_inicial.edSaldo.value, 2);
      finally
        fm_definir_saldo_inicial.Free;
      end;

      btNov.setFocus;
    end
    else
    begin
      dao.Geral2('select * from extrato where id_conta = ' + QuotedStr(Prid.Text));
      if dao.Q2.RecordCount = 0 then
      begin
        try
          Application.CreateForm(Tfm_definir_saldo_inicial, fm_definir_saldo_inicial);
          fm_definir_saldo_inicial.gbPeso.Visible := False;
          fm_definir_saldo_inicial.ShowModal;
          if fm_definir_saldo_inicial.ModalResult = mrOk then
            extrato := fmfun.GravaExtrato('SALDO INICIAL', QuotedStr(formatdatetime('dd/mm/yyyy', Now)), Prid.Text, 'C', fm_definir_saldo_inicial.edSaldo.value, 2);
        finally
          fm_definir_saldo_inicial.Free;
        end;
      end;
      dao.update('conta_corrente', 'id', q_conta_corrente.fieldbyname('id').AsString, 'Pr', Fr_conta_corrente);

    end;
    readonly_true;
    dao.cn.commit;
  except
    dao.cn.Rollback;
  end;

end;

procedure Tfr_conta_corrente.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if btgra.Enabled = true then
  begin
    raise Exception.Create('Grave ou Cancele as Informações Antes de Sair!');
    CanClose := false;
  end
  else
  begin
    CanClose := true;
  end;

end;

procedure TFr_conta_corrente.btcanClick(Sender: TObject);
var
  query_cancel: TFDQuery;
begin
  try
    if MessageDlg('Deseja Cancelar está Operação?', mtConfirmation, [mbyes, mbno], 0) = mryes then
    begin
      btnov.Enabled := true;
      btalt.Enabled := true;
      btgra.Enabled := false;
      btcan.Enabled := False;
      btexc.Enabled := true;
      btpro.Enabled := true;

      if modo_insert then
      begin
        Limpa_campos;
        readonly_true;
      end
      else if modo_insert = false then
      begin
        ativa_conta(Prid.Text);
        mostra_campos('Pr');
        readonly_true;
      end;
    end
    else
      exit;
  except
  end;
end;

procedure TFr_conta_corrente.btexcClick(Sender: TObject);
var
  condicao: string;
begin
  if Prid.Text = '' then
  begin
    showmessage('Não é possivel excluir este Grupo por não ter Código!');
    Prnom_conta.SetFocus;
    Exit;
  end;

  if MessageDlg('Tem certeza que deseja excluir esta conta corrente?', mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    try
      if not (dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      dao.delete('id', q_conta_corrente.fieldbyname('id').AsString, 'conta_corrente');
      dao.cn.Commit;
      dao.msg('Conta corrente excluida com sucesso!');
    except
      dao.cn.rollback;
    end;
  end;
  mostra_campos('');
end;

procedure TFr_conta_corrente.Prid_bancoButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Banco';
  chamou_pesquisa := 'fr_banco';
  chamou_form := 'fr_banco_cc';
  chamou_cadastro := 'Fr_banco';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Banco';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Código';
  Campos_combo[1] := 'Nome do banco';
  Campos_combo[2] := 'Numero do banco';

  for i := 0 to 2 do
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

procedure TFr_conta_corrente.btproClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Conta corrente';
  chamou_pesquisa := 'fr_conta_corrente';
  chamou_form := 'fr_conta_corrente';
  chamou_cadastro := 'Fr_conta_corrente';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Conta corrente';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 6);
  Campos_combo[0] := 'Código';
  Campos_combo[1] := 'Banco';
  Campos_combo[2] := 'Nome da Conta';
  Campos_combo[3] := 'Numero da Agencia';
  Campos_combo[4] := 'Numero da Conta';
  Campos_combo[5] := 'Data da abertura da conta';

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
    Fr_localizar.loc_conta_corrente(Fr_localizar.EDlocalizar.Text);
  end;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_conta_corrente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    close;
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TFr_conta_corrente.Prnom_contaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_conta_corrente.Prnr_agenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_conta_corrente.Prdta_abertura_contaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_conta_corrente.Prid_bancoKeyPress(Sender: TObject;
  var Key: Char);
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
    if btgra.Enabled = true then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Banco';
      chamou_pesquisa := 'fr_banco';
      chamou_form := 'fr_banco';
      chamou_cadastro := 'Fr_banco';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Banco';
      Fr_localizar.BT_cadastro.Visible := false;

      //preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo, 3);
      Campos_combo[0] := 'Código';
      Campos_combo[1] := 'Nome do banco';
      Campos_combo[2] := 'Numero do banco';

      for i := 0 to 2 do
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
  end;
  SelectNext(sender as TWinControl, true, true);
  key := #0;
end;

procedure TFr_conta_corrente.Prid_plano_contasButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Plano de Conta';
  chamou_pesquisa := 'fr_plano_conta';
  chamou_form := 'fr_cc_plano_conta';
  chamou_cadastro := 'fr_plano_conta';

  Fr_localizar.BT_cadastro.Caption := 'Plano de Contas';
  Fr_localizar.BT_cadastro.Visible := true;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Descrição';
  Campos_combo[2] := 'N° Conta';

  for i := 0 to 2 do
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

procedure TFr_conta_corrente.Prid_plano_contasExit(Sender: TObject);
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
    sqlplano := 'SELECT ' +
      '  PC4.ID, ' +
      '  PC4.NR_CONTA, ' +
      '  TRIM(PC1.NR_CONTA)||''-''||PC1.DESCRICAO DESCRICAO1, ' +
      '  TRIM(PC2.NR_CONTA)||''-''||PC2.DESCRICAO DESCRICAO2, ' +
      '  TRIM(PC3.NR_CONTA)||''-''||PC3.DESCRICAO DESCRICAO3, ' +
      '  TRIM(PC4.NR_CONTA)||''-''||PC4.DESCRICAO DESCRICAO4 ' +
      'FROM ' +
      '  PLANO_CONTAS PC4 ' +
      'INNER JOIN PLANO_CONTAS PC3 ON (PC3.ID = PC4.ID_PAI) ' +
      'INNER JOIN PLANO_CONTAS PC2 ON (PC2.ID = PC3.ID_PAI) ' +
      'INNER JOIN PLANO_CONTAS PC1 ON (PC1.ID = PC2.ID_PAI) ' +
      'WHERE (PC3.ID IN (''3'')  OR PC3.ID IN (''5'')) AND PC4.ID = ' + QuotedStr(Prid_plano_contas.Text);

    dao.Geral2(sqlplano);
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_plano_contas_N1.Caption := dao.Q2.fieldbyname('descricao1').AsString;
      Lbnom_plano_contas_N2.Caption := dao.Q2.fieldbyname('descricao2').AsString;
      Lbnom_plano_contas_N3.Caption := dao.Q2.fieldbyname('descricao3').AsString;
      Lbnom_plano_contas_N4.Caption := dao.Q2.fieldbyname('descricao4').AsString;
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


procedure TFr_conta_corrente.Prid_empresaExit(Sender: TObject);
begin
  if trim(Prid_empresa.Text) = '' then
    lb_empresa.Caption := '...';

  if Prid_empresa.Text <> '' then
  begin
    dao.Geral2('select nom_empresa from empresa where cod_empresa=' + QuotedStr(Prid_empresa.Text));
    if dao.q2.RecordCount > 0 then
    begin
      lb_empresa.Caption := dao.Q2.fieldbyname('nom_empresa').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prid_empresa.Text := '';
      Prid_empresa.SetFocus;
      Exit;
    end;

  end;
end;

procedure TFr_conta_corrente.Prid_empresaButtonClick(Sender: TObject);
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
  chamou_form := 'fr_cc_empresa';
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

procedure TFr_conta_corrente.Prid_bancoExit(Sender: TObject);
begin
  if trim(Prid_banco.Text) = '' then
    Lbbanco.Caption := '...';

  if Prid_banco.Text <> '' then
  begin
    dao.Geral2('select NOM_BANCO from banco where id =' + QuotedStr(Prid_banco.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbbanco.Caption := dao.Q2.fieldbyname('NOM_BANCO').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prid_banco.Text := '';
      Prid_banco.SetFocus;
      Exit;
    end;

  end;
end;

end.

procedure TFr_conta_corrente.ativa_conta(id: string);
begin
  with q_mes do
  begin
    close;
    SQL.Clear;
    SQL.add('select * from conta_corrente where id = ' + QuotedStr(id));
    open;
  end;

end;

end.
