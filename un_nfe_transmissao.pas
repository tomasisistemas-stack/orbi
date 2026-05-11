unit un_nfe_transmissao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Gauges, RXCtrls, ImgList, StdCtrls, Buttons,
  RxGIF, RxRichEd, sPanel, sBitBtn, sLabel, sGauge, acAlphaImageList,
  sCheckBox, RxAnimate, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP;

type
  TFr_nfe_transmissao = class(TForm)
    Panel1: tsPanel;
    AnimatedImage1: TAnimatedImage;
    RxLabel1: tsLabel;
    Gauge1: tsGauge;
    lbResultado: tsLabel;
    Panel2: tsPanel;
    BtnOK: TsBitBtn;
    MsgErro: TRxRichEdit;
    Shape1: TShape;
    ImgLst: TsAlphaImageList;
    sCheckBox1: TsCheckBox;
    sCheckBox2: TsCheckBox;
    sCheckBox3: TsCheckBox;
    sCheckBox4: TsCheckBox;
    sCheckBox5: TsCheckBox;
    sCheckBox6: TsCheckBox;
    sCheckBox7: TsCheckBox;
    sCheckBox8: TsCheckBox;
    sCheckBox9: TsCheckBox;
    sCheckBox10: TsCheckBox;
    sCheckBox11: TsCheckBox;
    IdHTTP1: TIdHTTP;
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  Fr_nfe_transmissao: TFr_nfe_transmissao;

implementation

{$R *.dfm}

end.
