unit Un_status_financeiro_cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid;

type
  TFr_status_financeiro_cliente = class(TForm)
    SG_financeiro: TAdvStringGrid;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr_status_financeiro_cliente: TFr_status_financeiro_cliente;

implementation

{$R *.dfm}

procedure TFr_status_financeiro_cliente.FormShow(Sender: TObject);
begin
  SG_financeiro.cells[0, 0] := 'Titulo';
  SG_financeiro.cells[1, 0] := 'Seq..';
  SG_financeiro.cells[2, 0] := 'Data Vencimento';
  SG_financeiro.cells[3, 0] := 'Valor';
end;

end.
