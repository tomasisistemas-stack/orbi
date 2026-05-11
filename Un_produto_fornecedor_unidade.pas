unit Un_produto_fornecedor_unidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,  sPanel, sBitBtn,
  sLabel, sCheckBox, sGroupBox, sEdit, Mask, sMaskEdit, sCustomComboEdit,
  sCurrEdit, sCurrencyEdit,  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFr_produto_fornecedor_unidade = class(TForm)
    Panel1: tsPanel;
    Btnov: TsBitBtn;
    btalt: TsBitBtn;
    btgra: TsBitBtn;
    btcan: TsBitBtn;
    btexc: TsBitBtn;
    Btpro: TsBitBtn;
    q_produto_fornecedor_unidade: TFDQuery;
    GroupBox1: TsGroupBox;
    Prunidade: TsEdit;
    Label1: tsLabel;
    sLabel1: TsLabel;
    PrQUANT_UNID: TsCurrencyEdit;
    lbid: TsLabel;
    PrPRODUTO_FORNECEDOR_ID: TsEdit;
    procedure btaltClick(Sender: TObject);
    procedure BtnovClick(Sender: TObject);
    procedure btgraClick(Sender: TObject);
    procedure btcanClick(Sender: TObject);
    procedure btexcClick(Sender: TObject);
    procedure BtproClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure PrunidadeKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    procedure limpa_campos;
    procedure readonly_false;
    procedure readonly_true;
  public
    modo_insert: boolean;
    unidade, id: string;
    busca_qualquer_posicao_pesquisada: boolean;
    campo_pesquisado, dado_pesquisado: string;
    procedure ativa_unidade(unidade, id: string);
    procedure mostra_campos(prefixo: string);

  end;

var
  Fr_produto_fornecedor_unidade: TFr_produto_fornecedor_unidade;

implementation

uses UnPri, Un_dao, Un_localizar, UnFun;

{$R *.dfm}

procedure TFr_produto_fornecedor_unidade.ativa_unidade(unidade, id: string);
begin
  with q_produto_fornecedor_unidade do
  begin
    close;
    SQL.Clear;
    SQL.add('select * from produto_fornecedor_unidade where unidade = ' +
      QuotedStr(unidade) + ' and produto_fornecedor_id = ' + id);
    open;
  end;
end;

procedure TFr_produto_fornecedor_unidade.limpa_campos;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).Clear
    else if Components[i] is TsCurrencyEdit then
      TsCurrencyEdit(Components[i]).value := 0;
  end;
end;

procedure TFr_produto_fornecedor_unidade.mostra_campos(prefixo: string);
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

      TsEdit(FindComponent(campo)).Text :=
        q_produto_fornecedor_unidade.fieldbyname(campo1).AsString;
    end
    else if Components[i] is TsCurrencyEdit then
    begin
      campo := TsCurrencyEdit(Components[i]).Name;
      campo1 := campo;
      campo1 := copy(campo, 3, 50);

      TsCurrencyEdit(FindComponent(campo)).value :=
        q_produto_fornecedor_unidade.fieldbyname(campo1).value;
    end;
  end;
end;

procedure TFr_produto_fornecedor_unidade.readonly_false;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := false;
  end;
end;

procedure TFr_produto_fornecedor_unidade.readonly_true;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := True;
  end;
end;

procedure TFr_produto_fornecedor_unidade.btaltClick(Sender: TObject);
begin
  if Prunidade.Text = '' then
  begin
    dao.msg('LOCALIZE UMA UNIDADE ANTES DE ALTERAR!');
    exit;
  end;
  modo_insert := false;
  readonly_false;
  unidade := prunidade.Text;
  btnov.Enabled := false;
  btalt.Enabled := false;
  btgra.Enabled := true;
  btcan.Enabled := true;
  btexc.Enabled := false;
  btpro.Enabled := false;
end;

procedure TFr_produto_fornecedor_unidade.BtnovClick(Sender: TObject);
begin
  Limpa_campos;
  modo_insert := true;
  readonly_false;
  Prunidade.SetFocus;
  btnov.Enabled := false;
  btalt.Enabled := false;
  btgra.Enabled := true;
  btcan.Enabled := true;
  btexc.Enabled := false;
  btpro.Enabled := false;
end;

procedure TFr_produto_fornecedor_unidade.btgraClick(Sender: TObject);
begin
  try
    if (modo_insert) and (BtNov.Enabled = false) then
    begin
      {    dao.Geral2('select unidade from unidade where unidade=' + QuotedStr(Prunidade.Text));
          if dao.Q2.RecordCount > 0 then
          begin
            dao.msg('FOI ENCONTRADO UMA UNIDADE COM O MESMO NOME' + #13 + 'VERIFIQUE SE VOCÊ NÃO ESTÁ CADASTRANDO A MESMA UNIDADE 2 VEZES!');
            Prunidade.SetFocus;
            Exit;
          end;

          if PRunidade.text = '' then
          begin
            dao.msg('VOCÊ DEVE SELECIONAR UMA UNIDADE ANTES DE GRAVAR!');
            Exit;
          end;}
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
      dao.Execsql('INSERT INTO PRODUTO_FORNECEDOR_UNIDADE (PRODUTO_FORNECEDOR_ID, UNIDADE, QUANT_UNID)  VALUES ( ' +
        PrPRODUTO_FORNECEDOR_ID.Text + ', ' + QuotedStr(PrUNIDADE.Text) + ', '
        + FMFUN.BuscaTroca(PrQUANT_UNID.Text, ',', '.') + ')');
      //Prunidade.Text := id;
//      ativa_unidade(id);
      btNov.setFocus;
    end
    else
      dao.Execsql('UPDATE PRODUTO_FORNECEDOR SET QUANT_UNID = ' +
        PrQUANT_UNID.Text + ' WHERE PRODUTO_FORNECEDOR_ID = ' +
        PrPRODUTO_FORNECEDOR_ID.Text + ' AND UNIDADE = ' +
        FMFUN.BuscaTroca(PrQUANT_UNID.Text, ',', '.'));
    dao.cn.commit;
    readonly_true;
  except
    dao.cn.Rollback;
  end;
end;

procedure TFr_produto_fornecedor_unidade.btcanClick(Sender: TObject);
var
  query_cancel: TFDQuery;
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
      btpro.Enabled := true;

      if modo_insert then
      begin
        Limpa_campos;
        readonly_true;
      end
      else if modo_insert = false then
      begin
        ativa_unidade(Prunidade.Text, PrPRODUTO_FORNECEDOR_ID.Text);
        mostra_campos('Pr');
        readonly_true;
      end;
    end
    else
      exit;
  except
  end;
end;

procedure TFr_produto_fornecedor_unidade.btexcClick(Sender: TObject);
begin
  if Prunidade.Text = '' then
  begin
    showmessage('Você deve selecionar alguma unidade para excluir!');
    BtNov.SetFocus;
    Exit;
  end;
  if MessageDlg('Tem Certeza que Deseja Excluir esta unidade?', mtConfirmation,
    [mbyes, mbno], 0) = mryes then
  begin
    try
      if not (dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      dao.Execsql('DELETE FROM PRODUTO_FORNECEDOR_UNIDADE WHERE PRODUTO_FORNECEDOR_ID = ' +
        PrPRODUTO_FORNECEDOR_ID.Text + ' AND UNIDADE = ' + QuotedStr(PrUNIDADE.Text));
      dao.cn.Commit;
      dao.msg('Produto/Fornecedor/Unidade excluído com sucesso!');
    except
      dao.cn.rollback;
    end;
  end;
  mostra_campos('');
end;

procedure TFr_produto_fornecedor_unidade.BtproClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar unidade';
  chamou_pesquisa := 'fr_unidade';
  chamou_form := 'fr_tabela_unidade';
  chamou_cadastro := 'Fr_tabela_unidade';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Unidade';
  Fr_localizar.BT_cadastro.Visible := false;

  Fr_localizar.CBcampos.Items.Add('Unidade');

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 1);
  Campos_combo[0] := 'Unidade';

  for i := 0 to 0 do
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
    Fr_localizar.loc_unidade(Fr_localizar.EDlocalizar.Text);
  end;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_produto_fornecedor_unidade.FormCloseQuery(Sender: TObject;
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

procedure TFr_produto_fornecedor_unidade.FormKeyPress(Sender: TObject; var Key:
  Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
  if key = #27 then
    close;
end;

procedure TFr_produto_fornecedor_unidade.PrunidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_produto_fornecedor_unidade.FormShow(Sender: TObject);
begin
  if (unidade <> '') and modo_insert then
  begin
    btgra.ModalResult := mrOk;
    btcan.ModalResult := mrCancel;
    BtnovClick(self);
    Prunidade.Text := unidade;
    PrPRODUTO_FORNECEDOR_ID.Text := id;    
    PrQUANT_UNID.SetFocus;
  end;
end;

end.


