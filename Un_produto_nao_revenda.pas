unit Un_produto_nao_revenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,  sPanel, sBitBtn,
  sLabel, sCheckBox, sGroupBox, sEdit, Mask, sMaskEdit, sCustomComboEdit,
  sComboEdit, sCurrEdit, sCurrencyEdit, sComboBox,  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFr_produto_nao_revenda = class(TForm)
    GroupBox1: TsGroupBox;
    Label1: tsLabel;
    Label25: tsLabel;
    Panel1: tsPanel;
    Btnov: TsBitBtn;
    Btalt: TsBitBtn;
    Btgra: TsBitBtn;
    Btcan: TsBitBtn;
    Btpro: TsBitBtn;
    Prcod_produto: TsEdit;
    PrNom_produto: TsEdit;
    PrRevenda: TsCheckBox;
    Prstatus: TsCheckBox;
    Lbnom_plano_contas_N1: TsLabel;
    Lbnom_plano_contas_N2: TsLabel;
    Lbnom_plano_contas_N3: TsLabel;
    Lbnom_plano_contas_N4: TsLabel;
    Prid_plano_contas: TsComboEdit;
    Label58: TsLabel;
    PrAviso_Revisao_Veiculo: TsCheckBox;
    gbAvisoRevisao: TsGroupBox;
    PrPROXIMA_REVISAO: TsCurrencyEdit;
    sLabel1: TsLabel;
    PrTIPO_REVISAO: TsComboBox;
    sLabel2: TsLabel;
    q_produto: TFDQuery;
    procedure BtnovClick(Sender: TObject);
    procedure BtaltClick(Sender: TObject);
    procedure BtgraClick(Sender: TObject);
    procedure BtcanClick(Sender: TObject);
    procedure BtproClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

    procedure PrNom_produtoKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_produtoKeyPress(Sender: TObject; var Key: Char);
    procedure Prid_plano_contasButtonClick(Sender: TObject);
    procedure Prid_plano_contasExit(Sender: TObject);
    procedure PrAviso_Revisao_VeiculoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure limpa_campos;
    procedure readonly_false;
    procedure readonly_true;

  public
    busca_qualquer_posicao_pesquisada: boolean;
    campo_pesquisado, dado_pesquisado: string;
    modo_insert: boolean;
    id: string;
    procedure ativa_produto(id: string);
    procedure mostra_campos(prefixo: string);

  end;

var
  Fr_produto_nao_revenda: TFr_produto_nao_revenda;

implementation

uses UnPri, Un_dao, Un_localizar, Un_marcas;

{$R *.dfm}

{ TFr_marcas }

procedure TFr_produto_nao_revenda.ativa_produto(id: string);
begin
  with q_produto do
  begin
    close;
    SQL.Clear;
    SQL.add('select * from produto where cod_produto = ' + QuotedStr(id));
    open;
  end;
end;

procedure TFr_produto_nao_revenda.limpa_campos;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).Clear;
  end;
end;

procedure TFr_produto_nao_revenda.mostra_campos(prefixo: string);
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

      TsEdit(FindComponent(campo)).Text := q_produto.fieldbyname(campo1).AsString;
    end;
    if Components[i] is TsComboEdit then
    begin
      campo := TsComboEdit(Components[i]).Name;
      campo1 := campo;
      campo1 := copy(campo, 3, 50);

      TsComboEdit(FindComponent(campo)).Text := q_produto.fieldbyname(campo1).AsString;
    end;
    if Components[i] is TsCurrencyEdit then
    begin
      campo := TsCurrencyEdit(Components[i]).Name;
      campo1 := campo;
      campo1 := copy(campo, 3, 50);

      TsCurrencyEdit(FindComponent(campo)).Text := q_produto.fieldbyname(campo1).AsString;
    end;
    if Components[i] is TsComboBox then
    begin
      campo := TsCurrencyEdit(Components[i]).Name;
      campo1 := campo;
      campo1 := copy(campo, 3, 50);

      TsComboBox(FindComponent(campo)).Text := q_produto.fieldbyname(campo1).AsString;
    end;
  end;
  Prid_plano_contasExit(self);
end;

procedure TFr_produto_nao_revenda.readonly_false;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := false;
    if Components[i] is TsCheckBox then
      TsCheckBox(Components[i]).Enabled := true;
    if Components[i] is TsCurrencyEdit then
      TsCurrencyEdit(Components[i]).ReadOnly := false;
    if Components[i] is TsComboBox then
      TsComboBox(Components[i]).ReadOnly := false;
    if Components[i] is TsComboEdit then
      TsComboEdit(Components[i]).ReadOnly := false;
  end;
end;

procedure TFr_produto_nao_revenda.readonly_true;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := true;
    if Components[i] is TsCheckBox then
      TsCheckBox(Components[i]).Enabled := false;
    if Components[i] is TsCurrencyEdit then
      TsCurrencyEdit(Components[i]).ReadOnly := true;
    if Components[i] is TsComboBox then
      TsComboBox(Components[i]).ReadOnly := true;
    if Components[i] is TsComboEdit then
      TsComboEdit(Components[i]).ReadOnly := true;
  end;
end;

procedure TFr_produto_nao_revenda.BtnovClick(Sender: TObject);
begin
  Limpa_campos;
  modo_insert := true;
  readonly_false;
  PrNom_produto.SetFocus;
  btnov.Enabled := false;
  btalt.Enabled := false;
  btgra.Enabled := true;
  btcan.Enabled := true;
  btpro.Enabled := false;
end;

procedure TFr_produto_nao_revenda.BtaltClick(Sender: TObject);
begin
  if Prcod_produto.Text = '' then
  begin
    dao.msg('LOCALIZE UM PRODUTO/SERVIÇO ANTES DE ALTERAR!');
    exit;
  end;
  modo_insert := false;
  readonly_false;
  btnov.Enabled := false;
  btalt.Enabled := false;
  btgra.Enabled := true;
  btcan.Enabled := true;
  btpro.Enabled := false;
end;

procedure TFr_produto_nao_revenda.BtgraClick(Sender: TObject);
begin
  try
    if (modo_insert) and (BtNov.Enabled = false) then
    begin
      dao.Geral2('select nom_produto from produto where nom_produto=' + QuotedStr(PrNom_produto.Text));
      if dao.Q2.RecordCount > 0 then
      begin
        dao.msg('FOI ENCONTRADO UM PRODUTO CADASTRADO COM O MESMO NOME QUE VOCÊ CADASTROU' + #13 + 'VERIFIQUE SE VOCÊ NÃO ESTÁ CADASTRANDO O PRODUTO EM DOBRO, OU ALTERE O NOME DO PRODUTO!');
        PrNom_produto.SetFocus;
        Exit;
      end;

      if PrNom_produto.text = '' then
      begin
        dao.msg('VOCÊ DEVE COLOCAR OS DADOS ANTES DE GRAVAR!');
        Exit;
      end;
    end;

    btnov.Enabled := true;
    btalt.Enabled := true;
    btgra.Enabled := false;
    btcan.Enabled := False;
    btpro.Enabled := true;
    if not (dao.cn.InTransaction) then
      dao.cn.StartTransaction;
    if modo_insert then
    begin
      id := dao.insert('Pr', 'produto', 'cod_produto', Fr_produto_nao_revenda, 'gen_produto');
      Prcod_produto.Text := id;
      ativa_produto(id);
      btNov.setFocus;
    end
    else
      dao.update('produto', 'cod_produto', Prcod_produto.Text, 'Pr', Fr_produto_nao_revenda);
    dao.cn.commit;
    readonly_true;
  except
    dao.cn.Rollback;
  end;
end;

procedure TFr_produto_nao_revenda.BtcanClick(Sender: TObject);
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

      btpro.Enabled := true;

      if modo_insert then
      begin
        Limpa_campos;
        readonly_true;
      end
      else if modo_insert = false then
      begin
        ativa_produto(Prcod_produto.Text);
        mostra_campos('Pr');
        gbAvisoRevisao.Enabled := PrAviso_Revisao_Veiculo.Checked;
        readonly_true;
      end;
    end
    else
      exit;
  except
  end;
end;

procedure TFr_produto_nao_revenda.BtproClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar Produto';
  chamou_pesquisa := 'fr_produto';
  chamou_form := 'Fr_produto_nao_revenda';
  chamou_cadastro := 'Fr_produto_nao_revenda';
  revenda := 'N';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Produto';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 6);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'Marca';
  Campos_combo[3] := 'Referencia';
  Campos_combo[4] := 'Grupo';
  Campos_combo[5] := 'Fornecedor';

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
    Fr_localizar.loc_produto(Fr_localizar.EDlocalizar.Text);
  end;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
end;

procedure TFr_produto_nao_revenda.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if btgra.Enabled = true then
  begin
    raise Exception.Create('Grave ou Cancele as informações antes de sair!');
    CanClose := false;
  end
  else
  begin
    CanClose := true;
  end;

end;


procedure TFr_produto_nao_revenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    close;
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;


procedure TFr_produto_nao_revenda.PrNom_produtoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_produto_nao_revenda.Prcod_produtoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_produto_nao_revenda.Prid_plano_contasButtonClick(
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

  Fr_localizar.Caption := 'Localizar Plano de Conta';
  chamou_pesquisa := 'fr_plano_conta';
  chamou_form := 'fr_produto_nao_revenda_plano_conta';
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

procedure TFr_produto_nao_revenda.Prid_plano_contasExit(Sender: TObject);
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
      'WHERE PC4.ID = ' + QuotedStr(Prid_plano_contas.Text);

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

procedure TFr_produto_nao_revenda.PrAviso_Revisao_VeiculoClick(
  Sender: TObject);
begin
  gbAvisoRevisao.Enabled := PrAviso_Revisao_Veiculo.Checked;
end;

procedure TFr_produto_nao_revenda.FormShow(Sender: TObject);
begin
  readonly_true;
  gbAvisoRevisao.Enabled := PrAviso_Revisao_Veiculo.Checked;
end;

end.



