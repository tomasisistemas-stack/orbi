unit Un_motorista;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, Buttons, ExtCtrls,  sPanel, sBitBtn,
  sLabel, sCheckBox, sGroupBox, sEdit,  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFr_motorista = class(TForm)
    Panel1: tsPanel;
    Btnov: TsBitBtn;
    btalt: TsBitBtn;
    btgra: TsBitBtn;
    btcan: TsBitBtn;
    btexc: TsBitBtn;
    Btpro: TsBitBtn;
    GroupBox1: TsGroupBox;
    Label1: tsLabel;
    Label2: tsLabel;
    Label3: tsLabel;
    Label4: tsLabel;
    Label5: tsLabel;
    edit: tsLabel;
    Prid: TsEdit;
    Prnome: TsEdit;
    Prcelular: TMaskEdit;
    Prcpf: TMaskEdit;
    Prfone: TMaskEdit;
    Prrg: TsEdit;
    q_motorista: TFDQuery;
    procedure BtnovClick(Sender: TObject);
    procedure btaltClick(Sender: TObject);
    procedure btgraClick(Sender: TObject);
    procedure btcanClick(Sender: TObject);
    procedure btexcClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

    procedure BtproClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PridKeyPress(Sender: TObject; var Key: Char);
    procedure PrnomeKeyPress(Sender: TObject; var Key: Char);
    procedure PrcelularKeyPress(Sender: TObject; var Key: Char);
    procedure PrfoneKeyPress(Sender: TObject; var Key: Char);
    procedure PrcpfKeyPress(Sender: TObject; var Key: Char);
    procedure PrrgKeyPress(Sender: TObject; var Key: Char);
    procedure PridEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    procedure Limpa_campos;
    procedure readonly_false;
    procedure readonly_true;
  public
    tipo: string;
    id: string;
    modo_insert: Boolean;

    busca_qualquer_posicao_pesquisada: boolean;
    campo_pesquisado, dado_pesquisado: string;

    procedure ativa_motorista(id: string);
    procedure mostra_campos(prefixo: string);
  end;

var
  Fr_motorista: TFr_motorista;

implementation

uses UnPri, Un_dao, Un_localizar;

{$R *.dfm}

{ TFr_motorista }

procedure TFr_motorista.ativa_motorista(id: string);
begin
  with q_motorista do
  begin
    close;
    SQL.Clear;
    SQL.add('select * from motorista where id = ' + QuotedStr(id));
    open;
  end;
end;

procedure TFr_motorista.Limpa_campos;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).Clear
    else
      if components[i] is TMaskEdit then
        TMaskEdit(Components[i]).Clear;
  end;
end;

procedure TFr_motorista.mostra_campos(prefixo: string);
var
  campo, campo1: string;
  I: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
    begin
      campo := TsEdit(Components[i]).Name;
      campo1 := campo;
      campo1 := copy(campo, 3, 50);
      TsEdit(FindComponent(campo)).Text := q_motorista.fieldbyname(campo1).AsString;
    end;
    if Components[i] is TMaskEdit then
    begin
      campo := TMaskEdit(Components[i]).Name;
      campo1 := campo;
      campo1 := copy(campo, 3, 50);
      TMaskEdit(FindComponent(campo)).Text := q_motorista.fieldbyname(campo1).AsString;
    end;

  end;
end;

procedure TFr_motorista.readonly_false;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := false
    else
      if Components[i] is TMaskEdit then
        TMaskEdit(Components[i]).ReadOnly := false;
  end;
end;


procedure TFr_motorista.readonly_true;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly := true
    else
      if Components[i] is TMaskEdit then
        TMaskEdit(Components[i]).ReadOnly := true;
  end;
end;

procedure TFr_motorista.BtnovClick(Sender: TObject);
begin
  modo_insert := true;
  readonly_false;
  Prnome.SetFocus;
  btnov.Enabled := false;
  btalt.Enabled := false;
  btgra.Enabled := true;
  btcan.Enabled := true;
  btexc.Enabled := false;
  btpro.Enabled := false;
  Limpa_campos;
end;

procedure TFr_motorista.btaltClick(Sender: TObject);
begin
  try
    if Prid.Text = '' then
    begin
      dao.msg('Localize um motorista antes de alterar!');
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
  except
  end;
end;

procedure TFr_motorista.btgraClick(Sender: TObject);
begin
  try
    if (modo_insert) and (BtNov.Enabled = false) then
    begin
      dao.Geral2('select rg from motorista where rg=' + QuotedStr(Prrg.Text));
      if dao.Q2.RecordCount > 0 then
      begin
        dao.msg('Já existe um motorista cadastrado com este R.G, o nome do motorista é ' + q_motorista.fieldbyname('nome').AsString);
        Prnome.SetFocus;
        Exit;
      end;
    end;
    btnov.Enabled := true;
    btalt.Enabled := true;
    btgra.Enabled := false;
    btcan.Enabled := False;
    btexc.Enabled := true;
    btpro.Enabled := true;
    if not (dao.cn.InTransaction) then dao.cn.StartTransaction;
    if modo_insert then
    begin
      id := dao.insert('Pr', 'motorista', 'id', Fr_motorista, 'gen_motorista');
      Prid.Text := id;
      ativa_motorista(id);
      btNov.setFocus;
    end
    else
      dao.update('motorista', 'id', q_motorista.fieldbyname('id').AsString, 'Pr', Fr_motorista);
    dao.cn.commit;
    readonly_true;
  except
    dao.cn.Rollback;
  end;
end;

procedure TFr_motorista.btcanClick(Sender: TObject);
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
      else
        if modo_insert = false then
        begin
          mostra_campos(Prid.Text);
          readonly_true;
        end;
    end
    else
      exit;
  except
  end;
end;

procedure TFr_motorista.btexcClick(Sender: TObject);
var
  condicao: string;
begin
  if Prid.Text = '' then
  begin
    showmessage('Não é possivel excluir este motorista, pois não esta com código!');
    Prid.SetFocus;
    Exit;
  end;
  if MessageDlg('Tem certeza que deseja excluir este motorista?', mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    tipo := '3';
    try
      if not (dao.cn.InTransaction) then dao.cn.StartTransaction;
      dao.delete('id', q_motorista.fieldbyname('id').AsString, 'motorista');
      dao.cn.Commit;
      Limpa_campos;
    except
      dao.cn.Rollback;
    end;
  end;
end;

procedure TFr_motorista.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TFr_motorista.BtproClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar motorista';
  chamou_pesquisa := 'fr_motorista';
  chamou_form := 'fr_motorista';
  chamou_cadastro := 'fr_motorista';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'motorista';
  Fr_localizar.BT_cadastro.Visible := false;

  SetLength(Campos_combo, 6);
  Campos_combo[0] := 'Código';
  Campos_combo[1] := 'Nome do motorista';
  Campos_combo[2] := 'Fone';
  Campos_combo[3] := 'Celular';
  Campos_combo[4] := 'CPF';
  Campos_combo[5] := 'RG';


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
    Fr_localizar.loc_motorista(Fr_localizar.EDlocalizar.Text);
  end;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;
  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
end;


procedure TFr_motorista.FormCloseQuery(Sender: TObject;
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

procedure TFr_motorista.PridKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_motorista.PrnomeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_motorista.PrcelularKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_motorista.PrfoneKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_motorista.PrcpfKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_motorista.PrrgKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

procedure TFr_motorista.PridEnter(Sender: TObject);
begin
  Prid.Enabled := true;
end;

procedure TFr_motorista.FormShow(Sender: TObject);
begin
  readonly_true;
end;



end.
