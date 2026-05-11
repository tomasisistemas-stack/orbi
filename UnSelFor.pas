unit UnSelFor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids;

type
  TFRSELFOR = class(TForm)
    IB_Grid1: TIB_Grid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure IB_Grid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRSELFOR: TFRSELFOR;

implementation

uses UnDmFin, UnPri;

{$R *.dfm}

procedure TFRSELFOR.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  if MFRMSEL='CP1IND' then
  begin
    DMFIN.QUEN1IND.FieldByName('codfor').AsString:=DMFIN.QUSELFOR.fieldbyname('codfor').AsString;

  end;


end;

procedure TFRSELFOR.IB_Grid1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then  close;
end;

procedure TFRSELFOR.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then close;
end;

end.
