unit un_rl_etiqueta_empresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, DB;

type
  Tfr_etiqueta_empresa = class(TForm)
    RLReport1: TRLReport;
    RLDetailGrid1: TRLDetailGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fr_etiqueta_empresa: Tfr_etiqueta_empresa;

implementation

uses Un_opc_etiqueta, UnPri;

{$R *.dfm}

end.
