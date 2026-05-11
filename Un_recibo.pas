unit Un_recibo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask,  Grids,  ComCtrls, frxClass,
  DB, frxDBSet, ACBrBase, ACBrExtenso, sPanel, sBitBtn, sLabel, sCheckBox,
  sGroupBox, sTooledit, sMaskEdit, sCustomComboEdit, sCurrEdit, 
  sCurrencyEdit, sEdit, sComboEdit, ACBrBoleto, ACBrBoletoFCFR,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFr_recibo = class(TForm)
    Panel1: tsPanel;
    btnov: TsBitBtn;
    btalt: TsBitBtn;
    btgra: TsBitBtn;
    btcan: TsBitBtn;
    btexc: TsBitBtn;
    btpro: TsBitBtn;
    GroupBox1: TsGroupBox;
    Label1: tsLabel;
    Prid: TsEdit;
    Label35: tsLabel;
    lbForn: tsLabel;
    LbNom_fornecedor: tsLabel;
    Prvalor: TsCurrencyEdit;
    Label21: tsLabel;
    Prdata: TsDateEdit;
    Label3: tsLabel;
    Label2: tsLabel;
    PrReferente: TRichEdit;
    fR_RELATORIO: TfrxReport;
    BtnImprimir: TsBitBtn;
    dst_recibo: TfrxDBDataset;
    ACBrExtenso1: TACBrExtenso;
    PrSacado: TsEdit;
    PrEmitente: TsEdit;
    ckLogo: tscheckbox;
    ckVias: tscheckbox;
    BtnCtaPagar: TsBitBtn;
    lbContasPagar: TsLabelFX;
    Label18: TsLabel;
    Prcod_fornecedor: TsComboEdit;
    gbPlanoContas: TsGroupBox;
    Lbnom_plano_contas_N1: TsLabel;
    Lbnom_plano_contas_N2: TsLabel;
    Lbnom_plano_contas_N3: TsLabel;
    Lbnom_plano_contas_N4: TsLabel;
    PrID_PLANO_DE_CONTAS: TsComboEdit;
    ACBrBoletoFCFR1: TACBrBoletoFCFR;
    q_recibo: TFDQuery;
    q_reciboID: TIntegerField;
    q_reciboDATA: TDateField;
    q_reciboVALOR: TBCDField;
    q_reciboREFERENTE: TBlobField;
    q_reciboSACADO: TStringField;
    q_reciboEMITENTE: TStringField;
    q_reciboCOD_FORNECEDOR: TIntegerField;
    q_reciboID_PLANO_DE_CONTAS: TIntegerField;
    q_reciboID_CONTAS_PAGAR: TIntegerField;
    procedure btaltClick(Sender: TObject);
    procedure btcanClick(Sender: TObject);
    procedure btexcClick(Sender: TObject);
    procedure btgraClick(Sender: TObject);
    procedure btnovClick(Sender: TObject);
    procedure btproClick(Sender: TObject);
    procedure PridKeyPress(Sender: TObject;
      var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure fR_RELATORIOGetValue(const VarName: string;
      var Value: Variant);
    procedure q_reciboBeforeOpen(DataSet: TDataSet);
    procedure q_reciboAfterClose(DataSet: TDataSet);
    procedure BtnCtaPagarClick(Sender: TObject);
    procedure PrID_PLANO_DE_CONTASExit(Sender: TObject);
    procedure PrID_PLANO_DE_CONTASButtonClick(Sender: TObject);
    procedure Prcod_fornecedorExit(Sender: TObject);
    procedure Prcod_fornecedorButtonClick(Sender: TObject);
  private
    procedure EfetuarPagamento;
    { Private declarations }
  public
    tipo: string;
    { Public declarations }
    modo_insert: Boolean;
    busca_qualquer_posicao_pesquisada: boolean;
    campo_pesquisado, dado_pesquisado: string;

    id: string;
    procedure mostra_campos(prefixo: string);
    procedure Limpa_campos;
    procedure readonly_true;
    procedure readonly_false;
    procedure ativa_recibo(id: string); //carrega a Q_cidade
  end;

var
  Fr_recibo: TFr_recibo;
  comando_campos, comando_valor, condicao, contas_pagar: string;
  Query: TFDQuery;

implementation

uses UnPri, Un_dao, Un_localizar, unfun, un_ncm, Un_contas_pagar, un_conta_descontada;

{$R *.dfm}

procedure TFr_recibo.btaltClick(Sender: TObject);
begin
  try
    if PrID.Text = '' then
    begin
      dao.msg('Selecione um Recibo para Alterar!');
      exit;
    end;

    modo_insert := false;
    readonly_false;
    //habilita botões
    btnov.Enabled := false;
    btalt.Enabled := false;
    btgra.Enabled := true;
    btcan.Enabled := true;
    btexc.Enabled := false;
    btpro.Enabled := false;
    BtnCtaPagar.Enabled := false;
  except
  end;
end;

procedure TFr_recibo.btcanClick(Sender: TObject);
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
        mostra_campos(PrID.Text);
        readonly_true;
      end;

    end
    else
      exit;
  except
  end;
end;

procedure TFr_recibo.btexcClick(Sender: TObject);
var
  condicao: string;
begin
  if PrID.Text = '' then
  begin
    showmessage('Não é possivel excluir este Recibo por não ter Código!');
    Exit;
  end;

  if MessageDlg('Tem Certeza que Deseja Excluir Este Recibo?', mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    tipo := '3';
    try
      if not (dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      dao.delete('id', q_recibo.fieldbyname('id').AsString, 'recibo');
      dao.cn.Commit;
      Limpa_campos;
    except
      dao.cn.rollback;
    end;

  end;
  // mostra_campos('');

end;

procedure TFr_recibo.btgraClick(Sender: TObject);
begin
  try

    btnov.Enabled := true;
    btalt.Enabled := true;
    btgra.Enabled := false;
    btcan.Enabled := False;
    btexc.Enabled := true;
    btpro.Enabled := true;
    BtnCtaPagar.Enabled := true;

    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    if modo_insert then
    begin
      id := dao.insert('Pr', 'recibo', 'id', Fr_recibo, 'gen_recibo');
      PrId.Text := id;
      ativa_recibo(id);
      btNov.setFocus;
    end
    else
      dao.update('recibo', 'id', Prid.Text, 'Pr', Fr_recibo);

    dao.cn.Commit;
    readonly_true;

  except
    dao.cn.Rollback;
  end;
end;

procedure TFr_recibo.btnovClick(Sender: TObject);
begin
  try
    modo_insert := true;
    readonly_false;
    PrSacado.SetFocus;
    PrSacado.Text := 'PLASTICOS FANTONI DIST. LTDA.';
    //habilita botões
    btnov.Enabled := false;
    btalt.Enabled := false;
    btgra.Enabled := true;
    btcan.Enabled := true;
    btexc.Enabled := false;
    btpro.Enabled := false;
    BtnCtaPagar.Enabled := false;
    Limpa_campos;
    prdata.Date := now;
  except

  end;
end;

procedure TFr_recibo.btproClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Recibo';
  chamou_pesquisa := 'fr_recibo';
  chamou_form := 'fr_recibo';
  chamou_cadastro := 'Fr_recibo';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Recibos';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 3);
  Campos_combo[0] := 'Código';
  Campos_combo[1] := 'Sacado';
  Campos_combo[2] := 'Emitente';

  for i := 0 to 2 do
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
    Fr_localizar.loc_recibo(Fr_localizar.EDlocalizar.Text);
  end;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
end;

procedure TFr_recibo.PridKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_recibo.Limpa_campos;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Copy(Components[i].Name, 1, 2) = 'Pr' then
    begin
      if Components[i] is TsEdit then
        TsEdit(Components[i]).Clear
      else if Components[i] is TsComboEdit then
        TsComboEdit(components[i]).Clear
      else if Components[i] is TsCurrencyEdit then
        TsCurrencyEdit(components[i]).Clear
      else if Components[i] is TsDateEdit then
        TsDateEdit(components[i]).Clear
      else if Components[i] is TMaskEdit then
        TMaskEdit(components[i]).Clear
      else if Components[i] is TRichEdit then
        TRichEdit(components[i]).Clear
      else if Components[i] is TComboBox then
        TComboBox(components[i]).ItemIndex := 0;
    end;
  end;

  Lbnom_fornecedor.Caption := '...';
  Lbnom_plano_contas_N1.Caption := '...';
  Lbnom_plano_contas_N2.Caption := '...';
  Lbnom_plano_contas_N3.Caption := '...';
  Lbnom_plano_contas_N4.Caption := '...';
  lbContasPagar.Caption := '';
  contas_pagar := '';
end;

procedure TFr_recibo.readonly_true;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := True;
  end;

end;

procedure TFr_recibo.readonly_false;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := false;
  end;
end;

procedure TFr_recibo.mostra_campos(prefixo: string);
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
      campo1 := copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
      TsEdit(FindComponent(campo)).Text := q_recibo.fieldbyname(campo1).AsString;
    end
    else if Components[i] is TsComboEdit then
    begin
      campo := TsComboEdit(Components[i]).Name;
      campo1 := campo;
      campo1 := copy(campo, 3, 50);
      TsComboEdit(FindComponent(campo)).Text := q_recibo.fieldbyname(campo1).AsString;
    end
    else if Components[i] is TsCurrencyEdit then
    begin
      campo := TsCurrencyEdit(Components[i]).Name;
      campo1 := campo;
      campo1 := copy(campo, 3, 50);
      TsCurrencyEdit(FindComponent(campo)).Value := q_recibo.fieldbyname(campo1).AsFloat;
    end
    else if Components[i] is TsDateEdit then
    begin
      campo := TsDateEdit(Components[i]).Name;
      campo1 := campo;
      campo1 := copy(campo, 3, 50);

      TsDateEdit(FindComponent(campo)).Date := q_recibo.fieldbyname(campo1).AsDateTime;
    end
    else if Components[i] is TMaskEdit then
    begin
      campo := TMaskEdit(Components[i]).Name;
      campo1 := copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
      TMaskEdit(FindComponent(campo)).Text := q_recibo.fieldbyname(campo1).AsString;
    end
    else if Components[i] is TRichEdit then
    begin
      campo := TRichEdit(Components[i]).Name;
      campo1 := copy(Components[i].Name, 3, Length(Components[i].Name) - 1);
      TRichEdit(FindComponent(campo)).Text := q_recibo.fieldbyname(campo1).AsString;
    end
    else if Components[i] is TDateTimePicker then
    begin
      campo := TDateTimePicker(Components[i]).Name;
      campo1 := campo;
      campo1 := copy(campo, 3, 50);

      TDateTimePicker(FindComponent(campo)).DateTime := q_recibo.fieldbyname(campo1).AsDateTime;
    end;
  end;

  if q_recibo.fieldbyname('ID_CONTAS_PAGAR').IsNull then
  begin
    lbContasPagar.Caption := '.';
    contas_pagar := '';
    BtnCtaPagar.Enabled := true;
  end
  else begin
    lbContasPagar.Caption := 'Importado para Contas à Pagar ID: ' + q_recibo.fieldbyname('ID_CONTAS_PAGAR').AsString;
    contas_pagar := q_recibo.fieldbyname('ID_CONTAS_PAGAR').AsString;
    BtnCtaPagar.Enabled := false;
  end;

  PrID_PLANO_DE_CONTASExit(self);
  Prcod_fornecedorExit(Self);

end;

procedure TFr_recibo.FormShow(Sender: TObject);
begin
  readonly_true;
end;

procedure TFr_recibo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    close;
  if key = #13 then
  begin
    if (ActiveControl.Name = 'PrReferente') then
      exit;
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TFr_recibo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if btgra.Enabled = true then
  begin
    raise Exception.Create('Gravar ou Cancelar as Informações Antes de Sair!');
    CanClose := false;
  end
  else
  begin
    CanClose := true;
  end;

end;

procedure TFr_recibo.ativa_recibo(id: string);
begin
  with q_recibo do
  begin
    close;
    SQL.Clear;
    SQL.add('SELECT a.ID, a.DATA, a.VALOR, a.REFERENTE, a.SACADO, a.EMITENTE, a.cod_fornecedor, a.ID_PLANO_DE_CONTAS, a.id_contas_pagar FROM RECIBO a where a.id = ' + QuotedStr(id));
    open;
  end;

end;

procedure TFr_recibo.Button1Click(Sender: TObject);
begin
  if Prid.Text = '' then
  begin
    dao.msg('Você deve Gravar o Recibo que está cadastrando!');
    btgra.SetFocus;
    Exit;

  end;
end;

procedure TFr_recibo.BtnImprimirClick(Sender: TObject);
var
  path: string;
begin
  path := ExtractFilePath(Application.ExeName);
  if PrID.Text = '' then
  begin
    dao.msg('Selecione um Recibo para Imprimir!');
    exit;
  end;

  if not (fr_relatorio.LoadFromFile(path + 'Relatorios\recibo.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 + 'Avise o Suporte');
    exit;
  end;
  if not q_recibo.active then q_recibo.open;
  fr_relatorio.ShowReport;
end;

procedure TFr_recibo.fR_RELATORIOGetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'EXTENSO' then
    value := ACBrExtenso1.ValorToTexto(PrValor.Value);
  if VarName = 'LOGO' then
    value := ckLogo.Checked;
  if VarName = 'DUAS_VIAS' then
    value := ckVias.Checked;
end;

procedure TFr_recibo.q_reciboBeforeOpen(DataSet: TDataSet);
begin
  frpri.DesabilitaTimers;
end;

procedure TFr_recibo.q_reciboAfterClose(DataSet: TDataSet);
begin
  dao.cn.Commit;
  frpri.HabilitaTimers;
end;

procedure TFr_recibo.BtnCtaPagarClick(Sender: TObject);
var
  sql_insert, sql_update: string;
begin
  if contas_pagar <> '' then exit;

  if trim(Prid.Text) = '' then exit;

  if trim(Prcod_fornecedor.Text) = '' then
  begin
    dao.msg('Fornecedor deve ser preenchido.');
    Prcod_fornecedor.SetFocus;
    exit;
  end;

  if trim(Prid_plano_de_contas.Text) = '' then
  begin
    dao.msg('Plano de Contas deve ser preenchido.');
    Prid_plano_de_contas.SetFocus;
    exit;
  end;

  dao.Geral3('SELECT nextval(''gen_cp1'') as gen_id FROM configuracao ');
  contas_pagar := dao.Q3.fieldbyname('gen_id').AsString;

  sql_insert := 'INSERT INTO CP1 (ID, COD_FORNECEDOR, TITULO, SEQUENCIA, DTAVEN, VALOR, OBS, COD_FOP, HISTORICO1, ID_PLANO_CONTAS) ' +
    'SELECT ' + contas_pagar + ', r.cod_fornecedor, r.id||''r'', 1, r.DATA, r.VALOR, r.REFERENTE, 1, r.REFERENTE, r.id_plano_de_contas FROM RECIBO r WHERE r.ID = ' + Prid.Text;

  sql_update := 'UPDATE RECIBO SET ID_CONTAS_PAGAR = ' + contas_pagar + ' where ID = ' + Prid.Text;

  if not dao.cn.InTransaction then dao.cn.StartTransaction;
  dao.Execsql(sql_insert);
  dao.Execsql(sql_update);
  dao.cn.Commit;

  ativa_recibo(Prid.Text);
  mostra_campos('Pr');

  if MessageDlg('Registro no Contas à Pagar gerado com sucesso. Desejas efetuar o pagamento do mesmo?', mtConfirmation, [mbyes, mbno], 0) = mryes then
    EfetuarPagamento;
    
end;

procedure TFr_recibo.EfetuarPagamento;
begin
  ativa_recibo(PRID.Text);
  Application.CreateForm(Tfrm_conta_descontada, frm_conta_descontada);
  frm_conta_descontada.pagar := true;
  frm_conta_descontada.Total := Prvalor.Value;
//  frm_conta_descontada.eddtMov.Date := Prdata.Date;

  frm_conta_descontada.historico := 'PAGAMENTO CONTA: FORNECEDOR: ' + LbNom_fornecedor.CAPTION + ' TÍTULO Nº: ' + PRID.TEXT + 'r;';
  SetLength(frm_conta_descontada.Listas_Contas, 1);
  frm_conta_descontada.Listas_Contas[0] := q_recibo.fieldbyname('ID_CONTAS_PAGAR').AsInteger;
  frm_conta_descontada.ShowModal;
  if frm_conta_descontada.ModalResult = mrOk then
  begin
    try
      dao.Exec_sql.SQL.Text := 'UPDATE CP1 SET DTAPAG = ' +
        QuotedStr(formatdatetime('dd/mm/yyyy',
        strtodate(frm_conta_descontada.edDtMov.Text))) +
        ', VALOR_PAGO = ' +
        StringReplace(Prvalor.Text, ',', '.', [rfReplaceAll]) + ' WHERE ID = ' + q_recibo.fieldbyname('ID_CONTAS_PAGAR').ASSTRING;
      dao.Exec_sql.ExecSQL;
      dao.grava_log(dao.Exec_sql.SQL.text, '');
      dao.cn.commit;
    except
      dao.cn.Rollback;
    end;
  end;
end;

procedure TFr_recibo.PrID_PLANO_DE_CONTASExit(Sender: TObject);
var
  sqlplano: string;
begin
  if trim(Prid_plano_de_contas.Text) = '' then
  begin
    Lbnom_plano_contas_N1.Caption := '...';
    Lbnom_plano_contas_N2.Caption := '...';
    Lbnom_plano_contas_N3.Caption := '...';
    Lbnom_plano_contas_N4.Caption := '...';
  end;

  if (Prid_plano_de_contas.Text <> '') then
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
      'WHERE (PC3.ID IN (''119'')  OR PC3.ID IN (''120'')  OR PC3.ID IN (''30'') OR PC3.ID IN (''36'') OR PC3.ID IN (''40'') OR PC1.ID IN(''58'')) AND PC4.ID = ' +
      QuotedStr(Prid_plano_de_contas.Text);

    dao.Geral2(sqlplano);
    if dao.q2.RecordCount > 0 then
    begin
      Lbnom_plano_contas_N1.Caption :=
        dao.Q2.fieldbyname('descricao1').AsString;
      Lbnom_plano_contas_N2.Caption :=
        dao.Q2.fieldbyname('descricao2').AsString;
      Lbnom_plano_contas_N3.Caption :=
        dao.Q2.fieldbyname('descricao3').AsString;
      Lbnom_plano_contas_N4.Caption :=
        dao.Q2.fieldbyname('descricao4').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prid_plano_de_contas.Text := '';
      Prid_plano_de_contas.SetFocus;
      Exit;
    end;

  end;

end;

procedure TFr_recibo.PrID_PLANO_DE_CONTASButtonClick(Sender: TObject);
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
  chamou_form := 'fr_recibo_plano_conta';
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

procedure TFr_recibo.Prcod_fornecedorExit(Sender: TObject);
begin

  if trim(Prcod_fornecedor.Text) = '' then
    Lbnom_fornecedor.Caption := '...';

  if (Prcod_fornecedor.Text <> '') then
  begin
    dao.Geral2('select f.razao_social||'' - ''||c.NOM_CIDADE||''-''||c.UF as razao_social  from fornecedor f inner join CIDADES c on c.COD_CIDADE = f.COD_CIDADE where f.cod_fornecedor=' + QuotedStr(Prcod_fornecedor.Text));
    if dao.q2.RecordCount > 0 then
      Lbnom_fornecedor.Caption := dao.Q2.fieldbyname('razao_social').AsString
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_fornecedor.SetFocus;
    end;

  end;

end;

procedure TFr_recibo.Prcod_fornecedorButtonClick(Sender: TObject);
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
  chamou_form := 'fr_recibo_fornecedor';
  chamou_cadastro := 'Fr_fornecedor';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Fornecedores';
  Fr_localizar.BT_cadastro.Visible := true;

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

end.


