unit Un_uf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  StdCtrls, Buttons, ExtCtrls;

type
  TFr_uf = class(TForm)
    Panel1: tsPanel;
    Btnov: TsBitBtn;
    btalt: TsBitBtn;
    btgra: TsBitBtn;
    btcan: TsBitBtn;
    btexc: TsBitBtn;
    Btpro: TsBitBtn;
    GroupBox1: TsGroupBox;
    Label3: tsLabel;
    Pruf: TsEdit;
    Pricms: TsEdit;
    q_uf: TFDQuery;
    procedure BtnovClick(Sender: TObject);
    procedure btaltClick(Sender: TObject);
    procedure btgraClick(Sender: TObject);
    procedure btcanClick(Sender: TObject);
    procedure btexcClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure PrufKeyPress(Sender: TObject; var Key: Char);
    procedure BtproClick(Sender: TObject);
  private
    procedure Limpa_campos;
    procedure readonly_false;
    procedure readonly_true;
  public
    id: string;
    modo_insert: Boolean;
    procedure ativa_uf(id: String);
    procedure mostra_campos(prefixo: string);
  end;

var
  Fr_uf: TFr_uf;

implementation

uses UnPri, Un_dao, Un_localizar;

{$R *.dfm}

{ TFr_ }

procedure TFr_uf.ativa_uf(id: String);
begin
  with q_uf do
  begin
    close;
    SQL.Clear;
    SQL.add('select * from uf where uf = '+ QuotedStr(id));
    open;
  end;
end;

procedure TFr_uf.Limpa_campos;
var
i: integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).Clear;
  end;
end;

procedure TFr_uf.mostra_campos(prefixo: string);
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

      TsEdit(FindComponent(campo)).Text :=q_uf.fieldbyname(campo1).AsString;
    end;

  end;//end do for
end;
procedure TFr_uf.readonly_false;
var
  i: integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly:=false;
  end;
end;

procedure TFr_uf.readonly_true;
var
  i: integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if Components[i] is TsEdit then
      TsEdit(Components[i]).ReadOnly:=true;
  end;
end;

procedure TFr_uf.BtnovClick(Sender: TObject);
begin
  Limpa_campos;
  modo_insert := true;
  readonly_false;
  Pruf.SetFocus;
  btnov.Enabled:=false;
  btalt.Enabled:=false;
  btgra.Enabled:=true;
  btcan.Enabled:=true;
  btexc.Enabled:=false;
  btpro.Enabled:=false;
end;

procedure TFr_uf.btaltClick(Sender: TObject);
begin
if Pruf.Text = '' then
begin
  FRPRI.msg('SELECIONE UM UF ANTES DE ALTERAR!');
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

procedure TFr_uf.btgraClick(Sender: TObject);
begin
  try
    if (modo_insert) and (BtNov.Enabled=false) then
    begin
      dao.Geral2('select uf from uf where uf='+QuotedStr(Pruf.Text));
      if dao.Q2.RecordCount > 0 then
      begin
        FRPRI.msg('FOI ENCONTRADO UM UF IGUAL'+#13+'VERIFIQUE SE VOCÊ NÃO ESTÁ CADASTRANDO O MESMO 2 VEZES!');
        Pruf.SetFocus;
        Exit;
      end;

      if Pruf.text='' then
      begin
      FRPRI.msg('VOCÊ DEVE COLOCAR OS DADOS ANTES DE GRAVAR!');
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
      id:= dao.insert('Pr','uf','id', Fr_uf,'gen_uf');
      Pruf.Text:= id;
      ativa_uf(id);
      btNov.setFocus;
    end
    else
      dao.update('uf','id',q_uf.fieldbyname('id').AsString,'Pr', Fr_uf);
      dao.cn.commit;
      readonly_true;
      limpa_campos;
  except
  end;

end;
procedure TFr_uf.btcanClick(Sender: TObject);
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
         ativa_uf(Pruf.Text);
         mostra_campos('Pr');
         readonly_true;
      end;
    end
    else
      exit;
  except
  end;
end;

procedure TFr_uf.btexcClick(Sender: TObject);
begin
  if Pruf.Text='' then
  begin
    showmessage('Não é possivel excluir pois não existe um UF selecionado !');
    BtNov.SetFocus;
    Exit;
  end;
  if MessageDlg('Tem Certeza que Deseja Excluir ?', mtConfirmation, [mbyes, mbno], 0) =mryes then
  begin
    if not(dao.cn.InTransaction) then dao.cn.StartTransaction;
    dao.delete('uf',q_uf.fieldbyname('uf').AsString,'uf');
    dao.cn.Commit;
    FRPRI.msg('UF foi excluido com sucesso!');
  end;
  mostra_campos('');
end;
procedure TFr_uf.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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


procedure TFr_uf.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then
  close;
end;

procedure TFr_uf.PrufKeyPress(Sender: TObject; var Key: Char);
begin
  if key =#13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key:=#0;
  end;
end;


procedure TFr_uf.BtproClick(Sender: TObject);
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

  Fr_localizar.Caption:='Localizar UF';
  chamou_pesquisa := 'fr_uf';
  chamou_form := 'fr_uf';
  chamou_cadastro := 'Fr_uf';

  Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'UF';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.

 SetLength(Campos_combo,2);
  Campos_combo[0] := 'UF';
  Campos_combo[1] := 'ICMS';

  for i:=0 to 1 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;
  Fr_localizar.ShowModal;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

end.
