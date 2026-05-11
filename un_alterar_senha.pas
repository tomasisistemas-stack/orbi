unit un_alterar_senha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask,  ExtCtrls, Buttons, sPanel, sBitBtn,
  sLabel, sCheckBox, sGroupBox, sEdit;

type
  Tfm_alterar_senha = class(TForm)
    Panel1: tsPanel;
    Panel2: tsPanel;
    GroupBox1: TsGroupBox;
    DENOMUSU: tsLabel;
    GroupBox2: TsGroupBox;
    GroupBox3: TsGroupBox;
    BTGRAUSU: TsBitBtn;
    BTCANUSU: TsBitBtn;
    BitBtn1: TsBitBtn;
    DESENUSU: TsEdit;
    DESENFAT: TsEdit;
    sGroupBox1: TsGroupBox;
    DEEMAIL: TsEdit;
    procedure FormShow(Sender: TObject);
    procedure CarregarDados;
    procedure BTCANUSUClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BTGRAUSUClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_alterar_senha: Tfm_alterar_senha;

implementation

uses Un_dao, UnPri;

{$R *.dfm}

procedure Tfm_alterar_senha.FormShow(Sender: TObject);
begin
  CarregarDados;
end;

procedure Tfm_alterar_senha.CarregarDados;
begin
  dao.Geral1('SELECT a.LOGUSU, a.SENUSU, a.SENESP, a.email FROM TBUSU a WHERE a.CODUSU = ' + cod_usuario);
  DENOMUSU.Caption := dao.Q1.FieldByName('LOGUSU').AsString;
  DESENUSU.Text := dao.Q1.FieldByName('SENUSU').AsString;
  DESENFAT.Text := dao.Q1.FieldByName('SENESP').AsString;
  DEEMAIL.Text := dao.Q1.FieldByName('EMAIL').AsString;
  DESENUSU.SetFocus;
end;

procedure Tfm_alterar_senha.BTCANUSUClick(Sender: TObject);
begin
  CarregarDados;
end;

procedure Tfm_alterar_senha.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure Tfm_alterar_senha.BTGRAUSUClick(Sender: TObject);
begin
  try
    if not (dao.cn.InTransaction) then dao.cn.StartTransaction;
    dao.Execsql('UPDATE TBUSU SET EMAIL = ' + QuotedStr(DEEMAIL.Text) + ', SENUSU = ' + QuotedStr(DESENUSU.Text) + ', SENESP = ' + QuotedStr(DESENFAT.Text) + ' WHERE CODUSU = ' + cod_usuario);
    dao.cn.Commit;
  except
    dao.cn.Rollback;
    raise Exception.Create('Erro ao gravar o registro!');
    exit;
  end;
  showmessage('Alteração efetuada com sucesso!');
end;

procedure Tfm_alterar_senha.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

end.
