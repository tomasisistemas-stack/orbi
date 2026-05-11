unit Un_manda_email;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid;

type
  Tfrform1 = class(TForm)
    SG_financeiro: TAdvStringGrid;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frform1: Tfrform1;

implementation

{$R *.dfm}

procedure Tfrform1.FormShow(Sender: TObject);
begin
  SG_financeiro.cells[0, 0] := 'Titulo';
  SG_financeiro.cells[1, 0] := 'Seq..';
  SG_financeiro.cells[2, 0] := 'Data Vencimento';
  SG_financeiro.cells[3, 0] := 'Valor';

end;

end.
