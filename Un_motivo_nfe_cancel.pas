unit Un_motivo_nfe_cancel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  StdCtrls, Buttons, ExtCtrls, sLabel, sGroupBox,
  sBitBtn, sPanel, sEdit,  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFr_motivo_nfe_cancel = class(TForm)
    Panel1: tsPanel;
    Btnov: TsBitBtn;
    btalt: TsBitBtn;
    btgra: TsBitBtn;
    btcan: TsBitBtn;
    btexc: TsBitBtn;
    Btpro: TsBitBtn;
    GroupBox1: TsGroupBox;
    Label3: tsLabel;
    PrId: TsEdit;
    PrMOTIVO: TsEdit;
    q_motivo: TFDQuery;
    procedure BtnovClick(Sender: TObject);
    procedure btaltClick(Sender: TObject);
    procedure btgraClick(Sender: TObject);
    procedure btcanClick(Sender: TObject);
    procedure btexcClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure PrIdKeyPress(Sender: TObject; var Key: Char);
    procedure BtproClick(Sender: TObject);
  private
    procedure Limpa_campos;
    procedure readonly_false;
    procedure readonly_true;
  public
    id, campo_pesquisado, dado_pesquisado : string;
    modo_insert: Boolean;

    procedure ativa_motivo(id: String);
    procedure mostra_campos(prefixo: string);
  end;

var
  Fr_motivo_nfe_cancel: TFr_motivo_nfe_cancel;

implementation

uses UnPri, Un_dao, Un_localizar;

{$R *.dfm}

{ TFr_ }

procedure TFr_motivo_nfe_cancel.ativa_motivo(id: String);
begin
  with q_motivo do
  begin
    close;
    SQL.Clear;
    SQL.add('SELECT a.ID, a.MOTIVO FROM NFE_MOTIVO_CANCEL a where a.id = '+ QuotedStr(id));
    open;
  end;
end;

procedure TFr_motivo_nfe_cancel.Limpa_campos;
var
i: integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).Clear;
  end;
end;

procedure TFr_motivo_nfe_cancel.mostra_campos(prefixo: string);
var
  campo, campo1: String;//campo tem o nome do campo sem tirar as primeiras letras
                        //campo1 tem o nome do campo tirando as 1º letras.
  I: integer;
begin
  for i:=0 to ComponentCount -1 do
  begin
    if Components[i] is TsEdit then
    begin
      campo:= TsEdit(Components[i]).Name;
      campo1:= campo;
      campo1:=copy(campo,3,50);

      TsEdit(FindComponent(campo)).Text :=q_motivo.fieldbyname(campo1).AsString;
    end;

  end;//end do for
end;
procedure TFr_motivo_nfe_cancel.readonly_false;
var
  i: integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly:=false;
  end;
end;

procedure TFr_motivo_nfe_cancel.readonly_true;
var
  i: integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly:=true;
  end;
end;

procedure TFr_motivo_nfe_cancel.BtnovClick(Sender: TObject);
begin
  Limpa_campos;
  modo_insert := true;
  readonly_false;
  PrMotivo.SetFocus;
  btnov.Enabled:=false;
  btalt.Enabled:=false;
  btgra.Enabled:=true;
  btcan.Enabled:=true;
  btexc.Enabled:=false;
  btpro.Enabled:=false;
end;

procedure TFr_motivo_nfe_cancel.btaltClick(Sender: TObject);
begin
if Prid.Text = '' then
begin
  showmessage('SELECIONE UM MOTIVO ANTES DE ALTERAR!');
  exit;
end;
  modo_insert:=false;
  readonly_false;
  btnov.Enabled:=false;
  btalt.Enabled:=false;
  btgra.Enabled:=true;
  btcan.Enabled:=true;
  btexc.Enabled:=false;
  btpro.Enabled:=false;
end;

procedure TFr_motivo_nfe_cancel.btgraClick(Sender: TObject);
begin
  try
    if (modo_insert) and (BtNov.Enabled=false) then
    begin
      if PrMOTIVO.text='' then
      begin
      showmessage('VOCÊ DEVE COLOCAR OS DADOS ANTES DE GRAVAR!');
      Exit;
      end;
    end;

    btnov.Enabled:=true;
    btalt.Enabled:=true;
    btgra.Enabled:=false;
    btcan.Enabled:=False;
    btexc.Enabled:=true;
    btpro.Enabled:=true;
    if not(dao.cn.InTransaction) then dao.cn.StartTransaction;
    if modo_insert then
    begin
      id:= dao.insert('Pr','NFE_MOTIVO_CANCEL','id', Fr_motivo_nfe_cancel,'gen_motivo');
      Prid.Text:= id;
      ativa_motivo(id);
      btNov.setFocus;
    end
    else
      dao.update('NFE_MOTIVO_CANCEL','id',q_motivo.fieldbyname('id').AsString,'Pr', Fr_motivo_nfe_cancel);
      dao.cn.commit;
      readonly_true;
  except
  end;

end;
procedure TFr_motivo_nfe_cancel.btcanClick(Sender: TObject);
var
  query_cancel: TFDQuery;
begin
  try
    if MessageDlg('Deseja Cancelar está Operação?', mtConfirmation, [mbyes, mbno], 0)=mryes then
    begin
      btnov.Enabled:=true;
      btalt.Enabled:=true;
      btgra.Enabled:=false;
      btcan.Enabled:=False;
      btexc.Enabled:=true;
      btpro.Enabled:=true;

      if modo_insert then
      begin
        Limpa_campos;
        readonly_true;
      end
      else
      if modo_insert = false then
      begin
         ativa_motivo(Prid.Text);
         mostra_campos('Pr');
         readonly_true;
      end;
    end
    else
      exit;
  except
  end;
end;

procedure TFr_motivo_nfe_cancel.btexcClick(Sender: TObject);
begin
  if MessageDlg('Tem Certeza que Deseja Excluir ?', mtConfirmation, [mbyes, mbno], 0) =mryes then
  begin
    if not(dao.cn.InTransaction) then dao.cn.StartTransaction;
    dao.delete('NFE_MOTIVO_CANCEL',q_motivo.fieldbyname('ID').AsString,'ID');
    dao.cn.Commit;
    showmessage('Motivo foi excluido com sucesso!');
  end;
  mostra_campos('');
end;
procedure TFr_motivo_nfe_cancel.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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


procedure TFr_motivo_nfe_cancel.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then
  close;
end;

procedure TFr_motivo_nfe_cancel.PrIdKeyPress(Sender: TObject; var Key: Char);
begin
  if key =#13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key:=#0;
  end;
end;


procedure TFr_motivo_nfe_cancel.BtproClick(Sender: TObject);
var
  Campos_combo: Array of String;
  i:integer;
  valor_combo:string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old : String;

begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  //guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption:='Localizar Motivo';
  chamou_pesquisa := 'fr_motivo';
  chamou_form := 'fr_motivo';
  chamou_cadastro := 'Fr_motivo';

  Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Motivo';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.

 SetLength(Campos_combo,2);
  Campos_combo[0] := 'Código';
  Campos_combo[1] := 'Motivo';

  for i:=0 to 1 do
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
