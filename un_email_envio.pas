unit un_email_envio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Gauges, RXCtrls, ImgList, StdCtrls, Buttons,
  RxGIF, RxRichEd, sPanel, sBitBtn, sGauge, sLabel, sCheckBox;

type
  TFr_email_envio = class(TForm)
    Panel3: tsPanel;
    Panel2: tsPanel;
    Image1: TImage;
    Panel1: tsPanel;
    lbResultado: tsLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr_email_envio: TFr_email_envio;

implementation

{$R *.dfm}

end.
