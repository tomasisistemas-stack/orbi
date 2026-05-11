unit Un_cheques;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons,
  Mask,  Menus, Grids,  ComCtrls,
  BaseGrid, AdvGrid, frxClass, RDprint, sPageControl, sPanel, sBitBtn,
  sLabel, sCheckBox, sGroupBox, sCurrEdit, sCurrencyEdit, sEdit, sMaskEdit,
  sCustomComboEdit, sTooledit, sComboEdit, sRadioButton, DB, RxMemDS,
  DBGrids, acDBGrid,  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFr_Emissao_cheques = class(TForm)
    pc_cheque: TsPageControl;
    tab_localizar: TsTabSheet;
    tab_dados: TsTabSheet;
    GroupBox2: TsGroupBox;
    GroupBox3: TsGroupBox;
    Label16: tsLabel;
    Label17: tsLabel;
    GroupBox5: TsGroupBox;
    quitado: TsRadioButton;
    todos: TsRadioButton;
    BitBtn9: TsBitBtn;
    CBTOTDIA: tscheckbox;
    GroupBox1: TsGroupBox;
    Lbnom_cc: tsLabel;
    Label2: tsLabel;
    Label3: tsLabel;
    Label4: tsLabel;
    Label5: tsLabel;
    Label6: tsLabel;
    Label7: tsLabel;
    Label8: tsLabel;
    Label9: tsLabel;
    Prid: TsEdit;
    Prcod_conta_corrente: TsComboEdit;
    zznr_banco: TsEdit;
    Prnr_cheque: TsEdit;
    Prdta_emissao: TsDateEdit;
    PrDta_vencimento: TsDateEdit;
    Prnominal: TsEdit;
    Prvalor: TsCurrencyEdit;
    Prhistorico: TsEdit;
    Prquitado: tscheckbox;
    Panel1: tsPanel;
    Btnov: TsBitBtn;
    btalt: TsBitBtn;
    btgra: TsBitBtn;
    btcan: TsBitBtn;
    btexc: TsBitBtn;
    BtLocalizar: TsBitBtn;
    Q_cheques: TFDQuery;
    zzconta_corrente: TsComboEdit;
    Label1: tsLabel;
    lbl_conta_corrente: tsLabel;
    zzdta_inicial: TsDateEdit;
    zzdta_final: TsDateEdit;
    Panel2: tsPanel;
    nao_quitado: TsRadioButton;
    zznr_cheque: TsEdit;
    Label11: tsLabel;
    BitBtn1: TsBitBtn;
    fr_relatorio: TfrxReport;
    Label10: tsLabel;
    Prdta_quitacao: TsDateEdit;
    BtnImprimir: TsBitBtn;
    RDIMPCHQ: TRDprint;
    PrExtrato: TsEdit;
    PrCancelado: tscheckbox;
    Label12: tsLabel;
    zzHistorico: TsEdit;
    cancelados: TsRadioButton;
    dsCheques: TDataSource;
    mmCheques: TRxMemoryData;
    mmChequesID: TIntegerField;
    mmChequesNR_CHEQUE: TIntegerField;
    mmChequesVALOR: TCurrencyField;
    mmChequesDTA_EMISSAO: TDateField;
    mmChequesDTA_VENCIMENTO: TDateField;
    mmChequesNOMINAL: TStringField;
    mmChequesNOM_CONTA: TStringField;
    gdCheques: Tdbgrid;
    mmChequesCANCELADO: TStringField;
    mmChequesQUITADO: TStringField;
    rgORDEM: TsRadioGroup;
    GroupBox4: TsGroupBox;
    dta_vencimento: TsRadioButton;
    dta_emissao: TsRadioButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btaltClick(Sender: TObject);
    procedure btcanClick(Sender: TObject);
    procedure btexcClick(Sender: TObject);
    procedure btgraClick(Sender: TObject);
    procedure BtnovClick(Sender: TObject);
    procedure Prcod_conta_correnteKeyPress(Sender: TObject; var Key: Char);
    procedure BtLocalizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure Prcod_conta_correnteButtonClick(Sender: TObject);
    procedure zznr_bancoKeyPress(Sender: TObject; var Key: Char);
    procedure zzconta_correnteKeyPress(Sender: TObject; var Key: Char);
    procedure zzconta_correnteButtonClick(Sender: TObject);
    procedure PrquitadoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure fr_relatorioGetValue(const VarName: string;
      var Value: Variant);
    procedure BtnImprimirClick(Sender: TObject);
    procedure Prcod_conta_correnteExit(Sender: TObject);
    procedure zzconta_correnteExit(Sender: TObject);
    procedure RDIMPCHQAfterPrint(Sender: TObject);
    procedure Prnr_chequeExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure gdChequesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure gdChequesDblClick(Sender: TObject);
  private
    procedure preenche_grid;
    { Private declarations }
  public
    id: string;
    modo_insert, pagamento: Boolean;

    busca_qualquer_posicao_pesquisada: boolean;
    sql_cheques, campo_pesquisado, dado_pesquisado: string;

    procedure ativa_cheques(id: string);
    procedure mostra_campos(prefixo: ShortString);
    procedure limpa_campos(prefixo: ShortString);
    procedure readonly_false(prefixo: ShortString);
    procedure readonly_true(prefixo: ShortString);
    procedure MontaSg_cheque;

    procedure CarregaSG_cheque;

    procedure MontaRelatorioCheques;
    procedure CarregaCheque;
    procedure imp_cheque;
    procedure ChecarNrCheque;
    { Public declarations }
  end;

var
  Fr_Emissao_cheques: TFr_Emissao_cheques;
  path: string;
implementation

uses Un_dao, UnPri, Un_localizar, Math, Un_dm, UnFun;

{$R *.dfm}

procedure TFr_Emissao_cheques.FormCloseQuery(Sender: TObject; var CanClose:
  Boolean);
begin
  {  if BtNov.Enabled=false then
    begin
      showmessage('<ATENÇÃO>ALGUM BOTÃO GRAVAR/CANCELAR ESTÁ PENDENTE!<ATENÇÃO>');
      CanClose:=FALSE;
    end
    else
      CanClose:=true;}

end;

procedure TFr_Emissao_cheques.btaltClick(Sender: TObject);
begin
  modo_insert := false;
  readonly_false('Pr');
  //habilita botões

  btnov.Enabled := false;
  btalt.Enabled := false;
  btgra.Enabled := true;
  btcan.Enabled := true;
  btexc.Enabled := false;
  PRcod_conta_corrente.SetFocus;

end;

procedure TFr_Emissao_cheques.btcanClick(Sender: TObject);
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

procedure TFr_Emissao_cheques.btexcClick(Sender: TObject);
begin
  if prid.Text = '' then
  begin
    dao.msg('Selecione um Cheque antes de Excluir!');
    exit;
  end;

  if MessageDlg('Deseja Excluir o Titulo', mtConfirmation, [mbYes, mbno], 0) =
    mryes then
  begin
    if Prquitado.Checked then
    begin
      dao.msg('Este cheque não pode ser excluido porque ele já está quitado' +
        #13 + 'Apenas o administrador do sistema pode excluir');
      exit;
    end;
    try
      if not (dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      dao.Execsql('delete from cheques where id=' + QuotedStr(prid.Text));
      dao.cn.Commit;
      dao.msg('Cheque Excluido com Sucesso!');
    except
      dao.cn.rollback;
    end;

  end;

end;

procedure TFr_Emissao_cheques.btgraClick(Sender: TObject);
begin
  if PRcod_conta_corrente.Text = '' then
  begin
    dao.msg('O campo Conta C.C deve ser preenchido!');
    PRcod_conta_corrente.SetFocus;
  end
  else if Prdta_emissao.Text = '  /  /    ' then
  begin
    dao.msg('O campo Data Emissão deve ser preenchido!');
    Prdta_emissao.SetFocus;
  end
  else if Prvalor.Text = '' then
  begin
    dao.msg('O campo Valor deve ser preenchido!');
    Prvalor.SetFocus;
  end
  else if Prhistorico.Text = '' then
  begin
    dao.msg('O campo Histórico deve ser preenchido!');
    Prhistorico.SetFocus;
    exit;
  end;

  btnov.Enabled := true;
  btalt.Enabled := true;
  btgra.Enabled := false;
  btcan.Enabled := False;
  btexc.Enabled := true;

  Screen.Cursor := crSQLWait;

  if (PrQuitado.checked) and ((prextrato.text = '') or (prextrato.text = '0'))
    then
    Prextrato.text := inttostr(fmfun.GravaExtrato('CHEQUE COMPENSADO N°: ' +
      PrNr_cheque.text + ' REF. ' + Prhistorico.text,
      QuotedStr(formatdatetime('dd/mm/yyyy', Prdta_quitacao.date)),
      Prcod_conta_corrente.text, 'D', Prvalor.value, 0));

  if (not PrQuitado.checked) and ((prextrato.text <> '') and (prextrato.text <>
    '0')) then
  begin
    fmfun.ExcluirExtrato(PrEXTRATO.text, 'D');
    Prextrato.Clear;
    Prdta_quitacao.Clear;
  end;

  try
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    if modo_insert then
    begin
      id := dao.insert('Pr', 'cheques', 'id', Fr_Emissao_cheques,
        'gen_cheques');
      Prid.Text := id;
      ativa_cheques(id);
      btNov.setFocus;
    end
    else
      dao.update('cheques', 'id', Prid.Text, 'Pr', Fr_Emissao_cheques);

    dao.cn.Commit;

    Screen.Cursor := crDefault;

    readonly_true('Pr');

    Btnov.SetFocus;
  except
    dao.cn.rollback;
  end;

end;

procedure TFr_Emissao_cheques.BtnovClick(Sender: TObject);
begin
  modo_insert := true;
  readonly_false('Pr');
  PRcod_conta_corrente.SetFocus;
  //habilita botões
  btnov.Enabled := false;
  btalt.Enabled := false;
  btgra.Enabled := true;
  btcan.Enabled := true;
  btexc.Enabled := false;
  Limpa_campos('Pr');

end;

procedure TFr_Emissao_cheques.ativa_cheques(id: string);
begin
  with Q_cheques do
  begin
    close;
    sql.clear;
    sql.add('select a.ID, a.COD_CONTA_CORRENTE, a.NR_CHEQUE, a.DTA_EMISSAO, a.DTA_VENCIMENTO, a.VALOR, a.NOMINAL, a.HISTORICO, a.QUITADO, a.DTA_QUITACAO, a.CANCELADO, a.EXTRATO, a.ID_MASTER, cc.nom_conta from cheques a ' +
      'left join conta_corrente cc on cc.id=a.cod_conta_corrente ' +
      'where a.id = ' + QuotedStr(id));
    open;
  end;

end;

procedure TFr_Emissao_cheques.mostra_campos(prefixo: ShortString);
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
          Q_cheques.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TsComboEdit then
      begin
        campo := TsComboEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        TsComboEdit(FindComponent(campo)).Text :=
          Q_cheques.fieldbyname(campo1).AsString;
      end
      else if Components[i] is TsCurrencyEdit then
      begin
        campo := TsCurrencyEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        TsCurrencyEdit(FindComponent(campo)).Value :=
          Q_cheques.fieldbyname(campo1).AsFloat;
      end
      else if Components[i] is TComboBox then
      begin
        campo := TComboBox(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);

        TComboBox(FindComponent(campo)).ItemIndex :=
          Q_cheques.fieldbyname(campo1).AsInteger;
      end
      else if Components[i] is tscheckbox then
      begin
        campo := tscheckbox(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);
        if Q_cheques.fieldbyname(campo1).AsString = 'S' then
          tscheckbox(FindComponent(campo)).Checked := true
        else
          tscheckbox(FindComponent(campo)).Checked := false;
      end

      else if Components[i] is TsDateEdit then
      begin
        campo := TsDateEdit(Components[i]).Name;
        campo1 := campo;
        campo1 := copy(campo, 3, 50);

        TsDateEdit(FindComponent(campo)).Date :=
          Q_cheques.fieldbyname(campo1).AsDateTime;
      end;

    end;

  end; //end do for
  Lbnom_cc.Caption := Q_cheques.fieldbyname('nom_conta').AsString;
  Screen.Cursor := crDefault;

end;

procedure TFr_Emissao_cheques.readonly_false(prefixo: ShortString);
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
        tscheckbox(components[i]).Enabled := true
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

procedure TFr_Emissao_cheques.readonly_true(prefixo: ShortString);
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

procedure TFr_Emissao_cheques.limpa_campos(prefixo: ShortString);
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

procedure TFr_Emissao_cheques.Prcod_conta_correnteKeyPress(Sender: TObject;
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
    if (Prcod_conta_corrente.Text = '') and (Btnov.Enabled = false) then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption := 'Localizar Conta Coorente';
      chamou_pesquisa := 'fr_conta_corrente';
      chamou_form := 'fr_emissao_cheque_cc';
      chamou_cadastro := 'fr_conta_corrente';

      Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 +
        'Conta Corrente';
      Fr_localizar.BT_cadastro.Visible := true;

      //preenchendo o combo box com os campos desejados para pesquisar.
      SetLength(Campos_combo, 4);
      Campos_combo[0] := 'Código';
      Campos_combo[1] := 'Nome da Conta';
      Campos_combo[2] := 'Numero da Agencia';
      Campos_combo[3] := 'Data da abertura da conta';

      for i := 0 to 3 do
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

procedure TFr_Emissao_cheques.BtLocalizarClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Cheques';
  chamou_pesquisa := 'fr_cheques';
  chamou_form := 'fr_cheques';
  chamou_cadastro := 'Fr_cheques';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cheques ';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 5);
  Campos_combo[0] := 'Nº Cheque';
  Campos_combo[1] := 'Nº Conta Corrente';
  Campos_combo[2] := 'Nominal';
  Campos_combo[3] := 'Data Vencimento';
  Campos_combo[4] := 'Valor';

  for i := 0 to 4 do
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
    Fr_localizar.loc_cheques(Fr_localizar.EDlocalizar.Text);
  end;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_Emissao_cheques.FormShow(Sender: TObject);
begin
  sql_cheques := '';
  if pagamento then
  begin
    mostra_campos('Pr');
    BtnImprimirClick(Self);
  end
  else
  begin
    limpa_campos('Pr');
    mmCheques.EmptyTable;
  end;
  path := ExtractFilePath(Application.ExeName);
end;

procedure TFr_Emissao_cheques.MontaSg_cheque;
begin

end;

procedure TFr_Emissao_cheques.preenche_grid;
{var
  i: integer;}
begin
  mmCheques.Close;
  mmCheques.EmptyTable;
  mmCheques.Open;
  while not (dao.Q1.Eof) do
  begin
    mmCheques.Append;
    mmChequesID.AsInteger := dao.Q1.fieldbyname('ID').AsInteger;
    mmChequesNR_CHEQUE.AsInteger := dao.Q1.fieldbyname('nr_cheque').AsInteger;
    mmChequesVALOR.AsCurrency := dao.Q1.fieldbyname('valor').AsCurrency;
    mmChequesDTA_EMISSAO.AsDateTime := dao.Q1.fieldbyname('dta_emissao').AsDateTime;
    mmChequesDTA_VENCIMENTO.AsDateTime :=
      dao.Q1.fieldbyname('dta_vencimento').AsDateTime;
    mmChequesNOMINAL.AsString := dao.Q1.fieldbyname('nominal').AsString;
    mmChequesNOM_CONTA.AsString := dao.Q1.fieldbyname('nom_conta').AsString;

    mmChequesQUITADO.AsString := dao.Q1.fieldbyname('quitado').AsString;
    mmChequesCANCELADO.AsString := dao.Q1.fieldbyname('cancelado').AsString;

    mmCheques.Post;
    dao.Q1.Next;
  end;
  mmCheques.First;
end;

procedure TFr_Emissao_cheques.CarregaSG_cheque;
var
  i: integer;
begin
  sql_cheques := 'select ch.id, ch.cod_conta_corrente, cr.nom_conta, nr_cheque, dta_emissao, dta_vencimento, valor, nominal, historico, quitado, cancelado '
    +
    'from cheques ch ' +
    'left join conta_corrente cr on cr.id=ch.cod_conta_corrente ';

  if dta_vencimento.checked then
    sql_cheques := sql_cheques + ' where dta_vencimento between ' + QuotedStr(formatdatetime('dd.mm.yyyy', zzdta_inicial.Date)) + ' and ' + QuotedStr(formatdatetime('dd.mm.yyyy', zzdta_final.date));

  if dta_emissao.checked then
    sql_cheques := sql_cheques + ' where dta_emissao between ' + QuotedStr(formatdatetime('dd.mm.yyyy', zzdta_inicial.Date)) + ' and ' + QuotedStr(formatdatetime('dd.mm.yyyy', zzdta_final.date));

  if zznr_cheque.Text <> '' then
    sql_cheques := sql_cheques + ' and nr_cheque=' + QuotedStr(zznr_cheque.Text);

  if zzconta_corrente.Text <> '' then
    sql_cheques := sql_cheques + ' and ch.cod_conta_corrente=' +
      QuotedStr(zzconta_corrente.Text);

  if zzhistorico.Text <> '' then
    sql_cheques := sql_cheques + ' and (nominal like ''%' + zzhistorico.Text +
      '%'' or historico like ''%' + zzhistorico.Text + '%'')';

  if quitado.Checked then
    sql_cheques := sql_cheques + ' and quitado=' + QuotedStr('S');
  if nao_quitado.Checked then
    sql_cheques := sql_cheques +
      ' and (cancelado <> ''S'' or cancelado is null) and (quitado <> ''S'' or quitado is null) ';
  if cancelados.Checked then
    sql_cheques := sql_cheques + ' and cancelado = ''S''';
  if todos.Checked then
    sql_cheques := sql_cheques + ' and (cancelado <> ''S'' or cancelado is null) ';

  case rgORDEM.ItemIndex of
    0: sql_cheques := sql_cheques + ' order by dta_emissao ';
    1: sql_cheques := sql_cheques + ' order by dta_vencimento ';
    2: sql_cheques := sql_cheques + ' order by nr_cheque ';
    3: sql_cheques := sql_cheques + ' order by valor ';
    4: sql_cheques := sql_cheques + ' order by nominal ';
    5: sql_cheques := sql_cheques + ' order by cr.nom_conta ';
  end;

  dao.Geral1(sql_cheques);
  i := 1;
  preenche_grid;

end;

procedure TFr_Emissao_cheques.BitBtn9Click(Sender: TObject);
begin
  CarregaSG_cheque;
end;

procedure TFr_Emissao_cheques.Prcod_conta_correnteButtonClick(
  Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Conta Corrente';
  chamou_pesquisa := 'fr_conta_corrente';
  chamou_form := 'fr_emissao_cheque_cc';
  chamou_cadastro := 'fr_conta_corrente';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Conta Corrente';
  Fr_localizar.BT_cadastro.Visible := true;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 4);
  Campos_combo[0] := 'Código';
  Campos_combo[1] := 'Nome da Conta';
  Campos_combo[2] := 'Numero da Agencia';
  Campos_combo[3] := 'Data da abertura da conta';

  for i := 0 to 3 do
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

procedure TFr_Emissao_cheques.zznr_bancoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(sender as TWinControl, True, true);
    key := #0;
  end;

end;

procedure TFr_Emissao_cheques.zzconta_correnteKeyPress(Sender: TObject;
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
    Application.CreateForm(TFr_localizar, Fr_localizar);

    //guardar os valores antigos
    chamou_form_old := chamou_form;
    chamou_pesquisa_old := chamou_pesquisa;

    Fr_localizar.Caption := 'Localizar Conta Corrente';
    chamou_pesquisa := 'fr_conta_corrente';
    chamou_form := 'fr_emissao_cheque_loc_cc';
    chamou_cadastro := 'fr_conta_corrente';

    Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Conta Corrente';
    Fr_localizar.BT_cadastro.Visible := true;

    //preenchendo o combo box com os campos desejados para pesquisar.
    SetLength(Campos_combo, 4);
    Campos_combo[0] := 'Código';
    Campos_combo[1] := 'Nome da Conta';
    Campos_combo[2] := 'Numero da Agencia';
    Campos_combo[3] := 'Data da abertura da conta';

    for i := 0 to 3 do
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
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;

end;

procedure TFr_Emissao_cheques.zzconta_correnteButtonClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Conta Corrente';
  chamou_pesquisa := 'fr_conta_corrente';
  chamou_form := 'fr_emissao_cheque_loc_cc';
  chamou_cadastro := 'fr_conta_corrente';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Conta Corrente';
  Fr_localizar.BT_cadastro.Visible := true;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 4);
  Campos_combo[0] := 'Código';
  Campos_combo[1] := 'Banco';
  Campos_combo[2] := 'Numero da Agencia';
  Campos_combo[3] := 'Data da abertura da conta';

  for i := 0 to 3 do
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

procedure TFr_Emissao_cheques.PrquitadoClick(Sender: TObject);
begin
  if Prquitado.Checked then
    Prdta_quitacao.Date := dao.DtaSerDt;
end;

procedure TFr_Emissao_cheques.MontaRelatorioCheques;
begin
  with dm.q_cheques_emitidos do
  begin
    close;
    sql.clear;
    sql.text := sql_cheques;
    Open;
  end;

  if Dm.q_cheques_emitidos.RecordCount <= 0 then
  begin
    dao.msg('Não foi Encontrado Dados para Gerar o Relatório!');
    exit;
  end;

  if not (fr_relatorio.LoadFromFile(path + '\relatorios\cheques_emitidos.fr3'))
    then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 +
      'Avise o Suporte');
    exit;
  end;

  fr_relatorio.ShowReport;
end;

procedure TFr_Emissao_cheques.BitBtn1Click(Sender: TObject);
begin
  tipo_relatorio := 'emissao_cheque';
  MontaRelatorioCheques;
end;

procedure TFr_Emissao_cheques.fr_relatorioGetValue(const VarName: string;
  var Value: Variant);
begin
  if tipo_relatorio = 'emissao_cheque' then
  begin
    if VarName = 'empresa' then
      Value := nom_empresa
    else if VarName = 'dtaini' then
      value := FormatDateTime('dd/mm/yyyy', zzdta_inicial.Date)
    else if VarName = 'dtafin' then
      value := FormatDateTime('dd/mm/yyyy', zzdta_final.Date)
  end

end;

procedure TFr_Emissao_cheques.CarregaCheque;
begin
  //dao.Geral1('select * from cheque where nr_cheque='+QuotedStr(Sg_cheque.Cells[0,lin]));
  ativa_cheques(mmChequesID.AsString);

  if Q_cheques.RecordCount >= 1 then
  begin
    readonly_false('Pr');
    mostra_campos('Pr');
    pc_cheque.ActivePage := tab_dados;
  end;

end;

procedure TFr_Emissao_cheques.imp_cheque;
var
  MASTERISCOS, MEXTENSO, MLHCH1, MLHCH2, MVLRCHQ: string;
  I, MTAMTOT: word;
begin

  MVLRCHQ := '(' + formatfloat('###,##0.00', Prvalor.Value) + ')';

  MASTERISCOS := '*********************************************************';

  MEXTENSO := FMFUN.extenso(Prvalor.Value);
  MLHCH1 := '';
  MLHCH2 := '';

  MTAMTOT := length(MEXTENSO);

  if MTAMTOT > 57 then
  begin

    I := 57;
    while I > 0 do
    begin
      if copy(MEXTENSO, I, 1) = ' ' then
        break
      else
        I := I - 1;
    end;

    MLHCH1 := copy(MEXTENSO, 1, I - 1);
    MLHCH2 := copy(MEXTENSO, I + 1, length(MEXTENSO));
  end
  else
    MLHCH1 := MEXTENSO;

  MLHCH1 := MLHCH1 + copy(MASTERISCOS, 1, 57 - length(MLHCH1));
  MLHCH2 := MLHCH2 + copy(MASTERISCOS, 1, 55 - length(MLHCH2));

  RDIMPCHQ.abrir;
  //  RDIMPCHQ.Setup;
  //  RDIMPCHQ.impval(01,55,'###,##0.00',DMECH.TAECHVLRCHQ.value,[normal]);
  //  RDIMPCHQ.impf(01,54,'(            )',[normal]);
  RDIMPCHQ.impf(01, 55, MVLRCHQ, [normal]);
  RDIMPCHQ.impf(03, 15, MLHCH1, [normal]);
  RDIMPCHQ.impf(05, 08, MLHCH2, [normal]);

  if Prnominal.Text <> '' then
    RDIMPCHQ.impf(07, 08, Prnominal.Text, [normal]);

  if Prdta_emissao.Text <> '  /  /    ' then
    RDIMPCHQ.impf(9, 35, FMFUN.DataExtenso(Prdta_emissao.Date), [NEGRITO,
      normal]);

  RDIMPCHQ.fechar;

end;

procedure TFr_Emissao_cheques.BtnImprimirClick(Sender: TObject);
begin
  imp_cheque;
end;

procedure TFr_Emissao_cheques.Prcod_conta_correnteExit(Sender: TObject);
begin
  if trim(Prcod_conta_corrente.Text) = '' then
    Lbnom_cc.Caption := '...';

  if Prcod_conta_corrente.Text <> '' then
  begin
    dao.Geral2('select nom_conta from conta_corrente where id =' +
      QuotedStr(Prcod_conta_corrente.Text));
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_cc.Caption := dao.Q2.fieldbyname('nom_conta').AsString;
      ChecarNrCheque;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_conta_corrente.Text := '';
      Prcod_conta_corrente.SetFocus;
      Exit;
    end;
  end;

end;

procedure TFr_Emissao_cheques.zzconta_correnteExit(Sender: TObject);
begin
  if zzconta_corrente.Text <> '' then
  begin
    dao.Geral2('select nom_conta from conta_corrente where id=' +
      QuotedStr(zzconta_corrente.Text));
    if dao.q2.RecordCount > 0 then
    begin
      lbl_conta_corrente.caption := dao.Q2.fieldbyname('nom_conta').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      zzconta_corrente.Text := '';
      lbl_conta_corrente.caption := '';
      zzconta_corrente.SetFocus;
      Exit;
    end;
  end;

end;

procedure TFr_Emissao_cheques.RDIMPCHQAfterPrint(Sender: TObject);
begin
  if pagamento then
    ModalResult := mrOk;
end;

procedure TFr_Emissao_cheques.Prnr_chequeExit(Sender: TObject);
begin
  ChecarNrCheque;
end;

procedure TFr_Emissao_cheques.ChecarNrCheque;
begin
  if not modo_insert then
    exit;
  if Prnr_cheque.Text = '' then
    exit;
  if Prcod_conta_corrente.Text = '' then
    exit;

  dao.Geral2('select * from cheques where nr_cheque = ' + Prnr_cheque.text +
    ' and cod_conta_corrente = ' + Prcod_conta_corrente.Text);
  if dao.q2.RecordCount > 0 then
  begin
    Showmessage('Número de Cheque já cadastrado nessa Conta Corrente!');
    prnr_cheque.SetFocus;
    exit;
  end;
end;

procedure TFr_Emissao_cheques.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TFr_Emissao_cheques.gdChequesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  if (mmChequesQUITADO.AsString = 'S') then
  begin
    gdCheques.Canvas.Font.Color := clNavy;
    if gdSelected in State then
    begin
      gdCheques.Canvas.Brush.Color := clNavy;
      gdCheques.Canvas.Font.Color := clWhite;
    end;
  end
  else
  begin
    gdCheques.Canvas.Font.Color := clRed;
    if gdSelected in State then
    begin
      gdCheques.Canvas.Brush.Color := clRed;
      gdCheques.Canvas.Font.Color := clWhite;
    end;
  end;

  if (mmChequesCANCELADO.AsString = 'S') then
  begin
    gdCheques.Canvas.Font.Color := clGray;
    if gdSelected in State then
    begin
      gdCheques.Canvas.Brush.Color := clGray;
      gdCheques.Canvas.Font.Color := clWhite;
    end;
  end;

  gdCheques.DefaultDrawDataCell(rect, Column.Field, State);
end;

procedure TFr_Emissao_cheques.gdChequesDblClick(Sender: TObject);
begin
  CarregaCheque;
end;

end.

