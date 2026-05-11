unit Un_cfop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,  sPanel, sBitBtn,
  sLabel, sCheckBox, sGroupBox, sEdit,  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFr_CFOP = class(TForm)
    Panel1: tsPanel;
    Btnov: TsBitBtn;
    btalt: TsBitBtn;
    btgra: TsBitBtn;
    btcan: TsBitBtn;
    btexc: TsBitBtn;
    Btpro: TsBitBtn;
    sPanel1: TsPanel;
    Label2: TsLabel;
    Label3: TsLabel;
    Prcfop: TsEdit;
    Prdescricao: TMemo;
    CheckBox1: TsCheckBox;
    CheckBox2: TsCheckBox;
    CheckBox3: TsCheckBox;
    CheckBox4: TsCheckBox;
    q_cfop: TFDQuery;
    procedure BtnovClick(Sender: TObject);
    procedure btaltClick(Sender: TObject);
    procedure btgraClick(Sender: TObject);
    procedure btcanClick(Sender: TObject);
    procedure btexcClick(Sender: TObject);
    procedure BtproClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PrcfopKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    procedure limpa_campos;
    procedure readonly_false;
    procedure readonly_true;
  public
    modo_insert: boolean;
    id: string;

    procedure ativa_cfop(id: string);
    procedure mostra_campos(prefixo: string);

  end;

var
  Fr_CFOP: TFr_CFOP;

implementation

uses UnPri, Un_dao, Un_localizar;

{$R *.dfm}

procedure TFr_CFOP.ativa_cfop;
begin
  with q_cfop do
  begin
    close;
    SQL.Clear;
    SQL.add('select * from cfop where cfop = ' + QuotedStr(id));
    open;
  end;
end;

procedure TFr_CFOP.limpa_campos;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).Clear;
    if Components[i] is TMemo then
      TMemo(Components[i]).Clear;
  end;
end;

procedure TFr_CFOP.mostra_campos(prefixo: string);
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

      TsEdit(FindComponent(campo)).Text := q_cfop.fieldbyname(campo1).AsString;
    end
    else if Components[i] is TMemo then
    begin
      campo := TMemo(Components[i]).Name;
      campo1 := campo;
      campo1 := copy(campo, 3, 50);

      TMemo(FindComponent(campo)).Text := q_cfop.fieldbyname(campo1).AsString;
    end;
  end;
end;

procedure TFr_CFOP.readonly_false;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := false;
    if Components[i] is TMemo then
      TMemo(Components[i]).Clear;
  end;
end;

procedure TFr_CFOP.readonly_true;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := True;
    if Components[i] is TMemo then
      TMemo(Components[i]).Clear;
  end;
end;

procedure TFr_CFOP.BtnovClick(Sender: TObject);
begin
  Limpa_campos;
  modo_insert := true;
  readonly_false;
  Prcfop.SetFocus;
  btnov.Enabled := false;
  btalt.Enabled := false;
  btgra.Enabled := true;
  btcan.Enabled := true;
  btexc.Enabled := false;
  btpro.Enabled := false;
end;

procedure TFr_CFOP.btaltClick(Sender: TObject);
begin
  if Prcfop.Text = '' then
  begin
    dao.msg('LOCALIZE UM CFOP ANTES DE ALTERAR!');
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

procedure TFr_CFOP.btgraClick(Sender: TObject);
begin
  try
    if (modo_insert) and (BtNov.Enabled = false) then
    begin
      dao.Geral2('select cfop from cfop where cfop=' + QuotedStr(Prcfop.Text));
      if dao.Q2.RecordCount > 0 then
      begin
        dao.msg('FOI ENCONTRADO UM CFOP COM O MESMO NOME' + #13 + 'VERIFIQUE SE VOCÊ NÃO ESTÁ CADASTRANDO O MESMO CFOP 2 VEZES!');
        Prcfop.SetFocus;
        Exit;
      end;

      if PRcfop.text = '' then
      begin
        dao.msg('VOCÊ DEVE COLOCAR OS DADOS DO CFOP ANTES DE GRAVA-LO!');
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
      id := dao.insert('Pr', 'cfop', 'id', Fr_cfop, 'gen_cfop');
      dao.cn.commit;
      Prcfop.Text := id;
      ativa_cfop(id);
      btNov.setFocus;
    end
    else
      dao.update('cfop', 'id', Prcfop.Text, 'Pr', Fr_cfop);
    dao.cn.commit;
    readonly_true;
  except
    dao.cn.Rollback;
  end;

end;

procedure TFr_CFOP.btcanClick(Sender: TObject);
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
        ativa_cfop(Prcfop.text);
        mostra_campos('Pr');
        readonly_true;
      end;
    end
    else
      exit;
  except
  end;
end;

procedure TFr_CFOP.btexcClick(Sender: TObject);
begin
  if Prcfop.Text = '' then
  begin
    showmessage('Não é possivel excluir este CFOP por não ter Código!');
    BtNov.SetFocus;
    Exit;
  end;
  //criar aqui rotina para verificar se este cliente não está sendo usado em alguma venda

  if MessageDlg('Tem Certeza que Deseja Excluir Esta CFOP?', mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    try
      if not (dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      dao.delete('id', q_cfop.fieldbyname('id').AsString, 'CFOP');
      dao.cn.Commit;
      dao.msg('CFOP excluido com sucesso!');
      limpa_campos;
    except
      dao.cn.rollback;
    end;

  end;
  mostra_campos('');
end;

procedure TFr_CFOP.BtproClick(Sender: TObject);
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

  Fr_localizar.Caption := 'Localizar CFOP';
  chamou_pesquisa := 'fr_cod_fiscal';
  chamou_form := 'fr_cfop';
  chamou_cadastro := 'Fr_cfop';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Cfop';
  Fr_localizar.BT_cadastro.Visible := false;

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

procedure TFr_CFOP.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure TFr_CFOP.PrcfopKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_CFOP.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    close;
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;


end.
