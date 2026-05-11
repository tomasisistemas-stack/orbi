unit un_selec_uf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, sComboBox, ExtCtrls, sPanel, sLabel,
  sEdit, PngImage, ACBrConsultaCPF, ACBrBase, ACBrSocket, ACBrConsultaCNPJ;

type
  Tfm_selec_uf = class(TForm)
    sPanel1: TsPanel;
    Image1: TImage;
    LabAtualizarCaptcha: TsLabel;
    sPanel2: TsPanel;
    cbUF: TsComboBox;
    BtnOK: TsBitBtn;
    edCaptcha: TsEdit;
    lbCaptcha: TsLabel;
    lbuf: TsLabel;
    Timer1: TTimer;
    ACBrConsultaCNPJ1: TACBrConsultaCNPJ;
    ACBrConsultaCPF1: TACBrConsultaCPF;
    procedure BtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LabAtualizarCaptchaClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    uf_selecionado: string;
  end;

var
  fm_selec_uf: Tfm_selec_uf;

implementation

uses Un_dao, UnFun;



{$R *.dfm}



procedure Tfm_selec_uf.BtnOKClick(Sender: TObject);
begin
  uf_selecionado := CBUF.Text;
  ModalResult := MROK;
end;

procedure Tfm_selec_uf.FormShow(Sender: TObject);
begin
  if cbuf.Visible then
  begin
    dao.Geral1('SELECT UF FROM UF ORDER BY UF');
    dao.Q1.first;
    cbUF.Items.Clear;
    while not dao.q1.Eof do
    begin
      cbUF.Items.Add(dao.q1.fieldbyname('uf').AsString);
      dao.q1.Next;
    end;
    cbuf.itemindex := 23;
  end;
  edCaptcha.SetFocus;
end;

procedure Tfm_selec_uf.LabAtualizarCaptchaClick(Sender: TObject);
var
  Stream: TMemoryStream;
  ImgArq: String;
begin
  Stream := TMemoryStream.Create;
  try
    FMFUN.ACBrConsultaCNPJ1.Captcha(Stream);
    ImgArq := ExtractFilePath(ParamStr(0))+PathDelim+'captch.png';
    Stream.SaveToFile( ImgArq );
    Image1.Picture.LoadFromFile( ImgArq );

    EdCaptcha.Clear;
    EdCaptcha.SetFocus;
  finally
    Stream.Free;
  end;

end;

procedure Tfm_selec_uf.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  LabAtualizarCaptchaClick(self);
  edCaptcha.SetFocus;
end;

end.

