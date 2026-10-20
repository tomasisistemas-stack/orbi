unit Un_splash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Gauges, jpeg, sPanel, sBitBtn,
  StdCtrls, sLabel, sGauge, sButton;

type
  Tfm_splash = class(TForm)
    Panel1: tsPanel;
    Image1: TImage;
    ggProgress: TsGauge;
    lbStatus: tsLabel;
    lbArquivos: TsLabel;
    pgArquivos: TsGauge;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_splash: Tfm_splash;

implementation

{$R *.dfm}

procedure Tfm_splash.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure Tfm_splash.FormShow(Sender: TObject);
begin
  // A visibilidade e controlada pelo VCL durante OnShow.
end;

end.
