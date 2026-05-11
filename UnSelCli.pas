unit UnSelCli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids;

type
  TFRSELCLI = class(TForm)
    IB_Grid1: TIB_Grid;
    procedure IB_Grid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRSELCLI: TFRSELCLI;

implementation

uses UnPri, UnDmVen;

{$R *.dfm}

procedure TFRSELCLI.IB_Grid1KeyPress(Sender: TObject; var Key: Char);
begin
  if (key= #13) or (key=#27) then
  begin
    close;
    key:=#0;
  end;  
end;

end.
