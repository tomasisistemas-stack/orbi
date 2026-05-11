unit un_infoatu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, OleCtrls, SHDocVw, HTTPApp, HTTPProd, StdCtrls,
  Buttons, sPanel, sBitBtn, sCheckBox;

type
  TfmInfoAtu = class(TForm)
    WebBrowser1: TWebBrowser;
    Panel1: tsPanel;
    BtnOk: TsBitBtn;
    CkInfo: tscheckbox;
    procedure FormShow(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmInfoAtu: TfmInfoAtu;
  caminho: string;
implementation

{$R *.dfm}

procedure TfmInfoAtu.FormShow(Sender: TObject);
begin
  caminho := ExtractFilePath(Application.ExeName);
  WebBrowser1.Navigate(caminho + 'InfoAtu.html');
end;

procedure TfmInfoAtu.BtnOkClick(Sender: TObject);
begin
  WebBrowser1.Navigate('www.plasfan.ind.br');
  if CkInfo.Checked then
    DeleteFile(caminho + 'InfoAtu.html');
  ModalResult := mrOk;
end;

end.
