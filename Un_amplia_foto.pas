unit Un_amplia_foto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, sLabel, sCheckBox;

type
  TFr_amplia_foto = class(TForm)
    foto2: TImage;
    Label15: tsLabel;
    procedure foto2DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr_amplia_foto: TFr_amplia_foto;

implementation

{$R *.dfm}

procedure TFr_amplia_foto.foto2DblClick(Sender: TObject);
begin
  close;
end;

end.
