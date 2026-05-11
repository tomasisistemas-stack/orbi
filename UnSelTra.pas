unit UnSelTra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids;

type
  TFRSELTRA = class(TForm)
    IB_Grid1: TIB_Grid;
    procedure IB_Grid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRSELTRA: TFRSELTRA;

implementation

uses UnDmCad;

{$R *.dfm}

procedure TFRSELTRA.IB_Grid1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
    Close;
    key:=#0;
  end;
end;

end.
