unit un_olap_plano_conta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, ExtCtrls,
   xhGrid,
   VclTee.TeeProcs, VclTee.TeEngine, VclTee.Chart, xhChart, ComCtrls,
  VclTee.Series, sPageControl, VclTee.TeeGDIPlus, xhHierCube, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Tfr_olap_plano_conta = class(TForm)
    q_plano_conta: TFDQuery;
    HierCube1: THierCube;
    PageControl1: TsPageControl;
    tabGrade: TsTabSheet;
    HierCubeGrid1: THierCubeGrid;
    tabGrafico: TsTabSheet;
    HierCubeChart1: THierCubeChart;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fr_olap_plano_conta: Tfr_olap_plano_conta;

implementation

uses un_dao;

{$R *.dfm}

end.
