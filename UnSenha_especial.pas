unit UnSenha_especial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, sBitBtn, sLabel, sCheckBox;

type
  TFr_senha_especial = class(TForm)
    EDusuario: TMaskEdit;
    EDsenha: TMaskEdit;
    btok: TsBitBtn;
    Label1: tsLabel;
    Label2: tsLabel;
    procedure EDsenhaKeyPress(Sender: TObject; var Key: Char);
    procedure btokClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    codusu: string;
    nivel: string;
  end;

var
  Fr_senha_especial: TFr_senha_especial;

implementation

uses UnPri, Un_dao;

{$R *.dfm}

procedure TFr_senha_especial.EDsenhaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    btok.Click;
    key := #0;

  end;
end;


procedure TFr_senha_especial.btokClick(Sender: TObject);
begin
  dao.Geral1('select codusu,logusu, senesp, nivel from tbusu where logusu=' + QuotedStr(EDusuario.Text) + ' and senusu=' + QuotedStr(EDsenha.Text));
  if dao.Q1.RecordCount > 0 then
  begin
    codusu := dao.Q1.fieldbyname('codusu').AsString;
    liberado := dao.Q1.fieldbyname('nivel').AsInteger >= strtoint(nivel);
    close;
  end
  else
  begin
    liberado := false;
    dao.msg('Senha ou Login Incorreto!');
    close;
  end;
end;

procedure TFr_senha_especial.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

end.
