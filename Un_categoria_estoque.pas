unit Un_categoria_estoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  StdCtrls, Buttons, ExtCtrls, sPanel, sBitBtn,
  sLabel, sCheckBox, sGroupBox, sEdit,  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFr_categoria_estoque = class(TForm)
    GroupBox1: TsGroupBox;
    Label1: tsLabel;
    Label25: tsLabel;
    Prid: TsEdit;
    Prdescricao: TsEdit;
    Panel1: tsPanel;
    btnov: TsBitBtn;
    btalt: TsBitBtn;
    btgra: TsBitBtn;
    btcan: TsBitBtn;
    btexc: TsBitBtn;
    btpro: TsBitBtn;
    q_categoria_estoque: TFDQuery;
    procedure readonly_false;
    procedure btnovClick(Sender: TObject);
    procedure btaltClick(Sender: TObject);
    procedure btgraClick(Sender: TObject);
    procedure btcanClick(Sender: TObject);
    procedure btexcClick(Sender: TObject);
    procedure btproClick(Sender: TObject);
    procedure PrdescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure PridKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    procedure Limpa_campos;
    procedure readonly_true;

  public
    id: string;
    modo_insert: Boolean;
    procedure ativa_categoria(id: string);
    procedure mostra_campos(prefixo: string);

  end;

var
  Fr_categoria_estoque: TFr_categoria_estoque;

implementation

uses UnPri, Un_dao, Un_localizar;

{$R *.dfm}

procedure TFr_categoria_estoque.Limpa_campos;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).Clear;
  end;
end;

procedure TFr_categoria_estoque.readonly_false;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := false;
  end;
end;

procedure TFr_categoria_estoque.readonly_true;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := true;
  end;
end;

procedure TFr_categoria_estoque.ativa_categoria(id: string);
begin
  with q_categoria_estoque do
  begin
    close;
    SQL.Clear;
    SQL.add('select * from categoria_estoque where id = ' + QuotedStr(id));
    open;
  end;
end;

procedure TFr_categoria_estoque.mostra_campos(prefixo: string);
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

      TsEdit(FindComponent(campo)).Text := q_categoria_estoque.fieldbyname(campo1).AsString;
    end;

  end; //end do for
end;

procedure TFr_categoria_estoque.btnovClick(Sender: TObject);
begin
  Limpa_campos;
  modo_insert := true;
  readonly_false;
  Prdescricao.SetFocus;
  btnov.Enabled := false;
  btalt.Enabled := false;
  btgra.Enabled := true;
  btcan.Enabled := true;
  btexc.Enabled := false;
  btpro.Enabled := false;
end;

procedure TFr_categoria_estoque.btaltClick(Sender: TObject);
begin
  if Prid.Text = '' then
  begin
    dao.msg('LOCALIZE ANTES DE ALTERAR!');
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

procedure TFr_categoria_estoque.btgraClick(Sender: TObject);
begin
  try
    if (modo_insert) and (BtNov.Enabled = false) then
    begin
      dao.Geral2('select descricao from categoria_estoque where descricao=' + QuotedStr(Prdescricao.Text));
      if dao.Q2.RecordCount > 0 then
      begin
        dao.msg('FOI ENCONTRADO UMA DESCRIÇAO IGUAL!');
        Prdescricao.SetFocus;
        Exit;
      end;

      if PRdescricao.text = '' then
      begin
        dao.msg('VOCÊ DEVE COLOCAR OS DADOS ANTES DE GRAVAR!');
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
      id := dao.insert('Pr', 'categoria_estoque', 'id', Fr_categoria_estoque, 'gen_categoria_estoque');
      Prid.Text := id;
      ativa_categoria(id);
      btNov.setFocus;
    end
    else
      dao.update('categoria_estoque', 'id', Prid.Text, 'Pr', Fr_categoria_estoque);
    dao.cn.commit;
    readonly_true;
  except
    dao.cn.Rollback;
  end;

end;

procedure TFr_categoria_estoque.btcanClick(Sender: TObject);
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
        ativa_categoria(Prid.Text);
        mostra_campos('Pr');
        readonly_true;
      end;
    end
    else
      exit;
  except
  end;
end;

procedure TFr_categoria_estoque.btexcClick(Sender: TObject);
begin
  if Prdescricao.Text = '' then
  begin
    showmessage('Não é possivel excluir pois não possui Código!');
    BtNov.SetFocus;
    Exit;
  end;
  //criar aqui rotina para verificar se este cliente não está sendo usado em alguma venda

  if MessageDlg('Tem Certeza que Deseja Excluir ?', mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    try
      if not (dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      dao.delete('id', q_categoria_estoque.fieldbyname('id').AsString, 'categoria_estoque');
      dao.cn.Commit;
      dao.msg('Exclusão efetuada com sucesso!');
    except
      dao.cn.rollback;
    end;
  end;
  mostra_campos('');
end;

procedure TFr_categoria_estoque.btproClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar categoria-estoque';
  chamou_pesquisa := 'fr_categoria_estoque';
  chamou_form := 'fr_categoria_estoque';
  chamou_cadastro := 'Fr_categoria_estoque';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'categoria-estoque';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 2);
  Campos_combo[0] := 'Código';
  Campos_combo[1] := 'Descrição';

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

procedure TFr_categoria_estoque.PrdescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then

end;

procedure TFr_categoria_estoque.PridKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_categoria_estoque.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
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

procedure TFr_categoria_estoque.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;


end.
