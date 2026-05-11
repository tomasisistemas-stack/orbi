unit un_motivo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, sPanel, sBitBtn, sLabel, sCheckBox,
  sEdit;

type
  TFmMotivo = class(TForm)
    Panel1: tsPanel;
    Panel2: tsPanel;
    BitBtn1: TsBitBtn;
    BitBtn2: TsBitBtn;
    Label1: tsLabel;
    mmMotivo: TsEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmMotivo: TFmMotivo;

implementation

{$R *.dfm}

procedure TFmMotivo.BitBtn1Click(Sender: TObject);
begin
  if length(trim(mmmotivo.Text)) = 0 then
  begin
    showmessage('O campo Motivo deve ser preenchido!');
    mmmotivo.SetFocus;
  end
  else
    modalresult := mrok;
end;

procedure TFmMotivo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TFmMotivo.FormShow(Sender: TObject);
begin
  mmMotivo.SetFocus;
end;

end.
