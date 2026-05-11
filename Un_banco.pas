unit Un_banco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,  ExtCtrls, sPanel, sBitBtn,
  sLabel, sCheckBox, sGroupBox, sEdit,  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Tfr_banco = class(TForm)
    q_banco: TFDQuery;
    Panel1: tsPanel;
    Btnov: TsBitBtn;
    btalt: TsBitBtn;
    btgra: TsBitBtn;
    btcan: TsBitBtn;
    btexc: TsBitBtn;
    Btpro: TsBitBtn;
    GroupBox1: TsGroupBox;
    Codigo: tsLabel;
    Label2: tsLabel;
    Label3: tsLabel;
    Prid: TsEdit;
    Prnom_banco: TsEdit;
    Prnr_banco: TsEdit;
    cbArqRemessa: TComboBox;
    Label1: tsLabel;
    PrLAYOUT_REMESSA: TsEdit;
    procedure BtnovClick(Sender: TObject);
    procedure btaltClick(Sender: TObject);
    procedure btgraClick(Sender: TObject);
    procedure btcanClick(Sender: TObject);
    procedure BtproClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PridKeyPress(Sender: TObject; var Key: Char);
    procedure Prnom_bancoKeyPress(Sender: TObject; var Key: Char);
    procedure Prnr_bancoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btexcClick(Sender: TObject);
    procedure cbArqRemessaChange(Sender: TObject);
  private
    procedure Limpa_campos;
    procedure readonly_false;
    procedure readonly_true;

    { Private declarations }
  public
    id: string;
    modo_insert: Boolean;

    busca_qualquer_posicao_pesquisada: boolean;
    campo_pesquisado, dado_pesquisado: string;

    procedure ativa_banco(id: string);
    procedure mostra_campos(prefixo: string);

  end;

var
  fr_banco: Tfr_banco;

implementation

uses UnPri, Un_dao, Un_localizar;

{$R *.dfm}

procedure Tfr_banco.BtnovClick(Sender: TObject);
begin
  Limpa_campos;
  modo_insert := true;
  readonly_false;
  PRnom_banco.SetFocus;
  btnov.Enabled := false;
  btalt.Enabled := false;
  btgra.Enabled := true;
  btcan.Enabled := true;
  btexc.Enabled := false;
  btpro.Enabled := false;
end;

procedure TFr_banco.Limpa_campos;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).Clear;
    if Components[i] is TComboBox then
      TComboBox(Components[i]).ItemIndex := -1;
  end;
end;

procedure TFr_banco.readonly_false;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := false;
    if Components[i] is TComboBox then
      TComboBox(Components[i]).enabled := true;
  end;
end;

procedure Tfr_banco.btaltClick(Sender: TObject);
begin
  if Prid.Text = '' then
  begin
    dao.msg('LOCALIZE UM BANCO ANTES DE ALTERAR!');
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

procedure Tfr_banco.btgraClick(Sender: TObject);
begin
  try
    if (modo_insert) and (BtNov.Enabled = false) then
    begin
      dao.Geral2('select nom_banco from banco where nom_banco=' + QuotedStr(Prnom_banco.Text));
      if dao.Q2.RecordCount > 0 then
      begin
        dao.msg('FOI ENCONTRADO UM BANCO COM O MESMO NOME' + #13 + 'VERIFIQUE SE VOCÊ NÃO ESTÁ CADASTRANDO O MESMO BANCO 2 VEZES!');
        Prnom_banco.SetFocus;
        Exit;
      end;

      if PRnom_banco.text = '' then
      begin
        dao.msg('VOCÊ DEVE COLOCAR OS DADOS DO BANCO ANTES DE GRAVA-LA!');
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
      id := dao.insert('Pr', 'banco', 'id', Fr_banco, 'gen_banco');
      Prid.Text := id;
      ativa_banco(id);
      btNov.setFocus;
    end
    else
      dao.update('banco', 'id', Prid.Text, 'Pr', Fr_banco);
    dao.cn.commit;
    readonly_true;
  except
    dao.cn.Rollback;
  end;

end;
//(*end;*)

procedure TFr_banco.ativa_banco(id: string);
begin
  with q_banco do
  begin
    close;
    SQL.Clear;
    SQL.add('select * from banco where id = ' + QuotedStr(id));
    open;
  end;
end;

procedure TFr_banco.mostra_campos(prefixo: string);
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

      TsEdit(FindComponent(campo)).Text := q_banco.fieldbyname(campo1).AsString;
    end;
  end; //end do for
  if prLAYOUT_REMESSA.text = '' then
    cbArqRemessa.ItemIndex := -1
  else if prLAYOUT_REMESSA.text = 'c240' then
    cbArqRemessa.ItemIndex := 0
  else if prLAYOUT_REMESSA.text = 'c400' then
    cbArqRemessa.ItemIndex := 1;
end;

procedure TFr_banco.readonly_true;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := True;
    if Components[i] is TComboBox then
      TComboBox(Components[i]).enabled := false;
  end;
end;

procedure Tfr_banco.btcanClick(Sender: TObject);
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
        ativa_banco(Prid.Text);
        mostra_campos('Pr');
        readonly_true;
      end;
    end
    else
      exit;
  except
  end;
end;

procedure Tfr_banco.BtproClick(Sender: TObject);
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

  if campo_pesquisado <> '' then
  begin
    Fr_localizar.CBcampos.ItemIndex := Fr_localizar.CBcampos.Items.IndexOf(campo_pesquisado);
    Fr_localizar.EDlocalizar.Text := dado_pesquisado;
    Fr_localizar.zzbusca_qualquer.Checked := busca_qualquer_posicao_pesquisada;
    Fr_localizar.loc_banco(Fr_localizar.EDlocalizar.Text);
  end;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure Tfr_banco.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure Tfr_banco.PridKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure Tfr_banco.Prnom_bancoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure Tfr_banco.Prnr_bancoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure Tfr_banco.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    close;
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure Tfr_banco.btexcClick(Sender: TObject);
begin
  if Prnom_banco.Text = '' then
  begin
    showmessage('Não é possivel excluir este banco pois não possui Código!');
    BtNov.SetFocus;
    Exit;
  end;
  //criar aqui rotina para verificar se este cliente não está sendo usado em alguma venda

  if MessageDlg('Tem Certeza que Deseja Excluir ?', mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    try
      if not (dao.cn.InTransaction) then
        dao.cn.StartTransaction;
      dao.delete('id', q_banco.fieldbyname('id').AsString, 'banco');
      dao.cn.Commit;
      dao.msg('Banco foi excluido com sucesso!');
    except
      dao.cn.Rollback;
    end;

  end;
  mostra_campos('');
end;


procedure Tfr_banco.cbArqRemessaChange(Sender: TObject);
begin
  prLAYOUT_REMESSA.text := cbArqRemessa.Text;
end;

end.
