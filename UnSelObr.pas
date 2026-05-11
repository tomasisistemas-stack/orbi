unit UnSelObr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids;

type
  TFRSELOBR = class(TForm)
    IB_Grid1: TIB_Grid;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure IB_Grid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRSELOBR: TFRSELOBR;

implementation

uses UnDmVen;

{$R *.dfm}

procedure TFRSELOBR.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then close;
end;

procedure TFRSELOBR.IB_Grid1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then close;
end;

end.
