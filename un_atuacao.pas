unit un_atuacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SVOLegend, ComCtrls, ToolWin, GISShape, GISImage;

type
  Tfr_atuacao = class(TForm)
    SVOGISImage1: TSVOGISImage;
    ToolBar1: TToolBar;
    ToolButtonExit: TToolButton;
    ToolButton13: TToolButton;
    ToolButtonOpenGIS: TToolButton;
    ToolButtonCloseGIS: TToolButton;
    ToolButtonGrid: TToolButton;
    ToolButton11: TToolButton;
    ToolButtonDefault: TToolButton;
    ToolButtonShapeInfo: TToolButton;
    ToolButtonGrab: TToolButton;
    ToolButtonZoomIn: TToolButton;
    ToolButtonZoomOut: TToolButton;
    ToolButtonFullExtent: TToolButton;
    SVOLegend: TSVOLegend;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fr_atuacao: Tfr_atuacao;

implementation

{$R *.dfm}

end.
