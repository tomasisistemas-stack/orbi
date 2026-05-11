unit Un_rel_fluxo_caixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport;

type
  TRLfluxo_caixa = class(TForm)
    FRflucai: TRLReport;
    RLBand1: TRLBand;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RLfluxo_caixa: TRLfluxo_caixa;

implementation

{$R *.dfm}

end.
