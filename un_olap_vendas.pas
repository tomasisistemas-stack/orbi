unit un_olap_vendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids,ExtCtrls,
   xhGrid,
  xhHierCube, VclTee.TeeProcs, VclTee.TeEngine, VclTee.Chart, xhChart, ComCtrls,
  VclTee.Series, xhExport, Menus, ImgList, sPageControl, VclTee.TeeGDIPlus,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  Tfr_olap_vendas = class(TForm)
    q_vendas: TFDQuery;
    HierCube1: THierCube;
    PageControl1: TsPageControl;
    tabGrade: TsTabSheet;
    HierCubeGrid1: THierCubeGrid;
    tabGrafico: TsTabSheet;
    Graf: THierCubeChart;
    Excel: THierCubeGridExportToXLS;
    hpPrint: THierCubeGridPrint;
    PDF: THierCubeGridExportToPDF;
    MainMenu1: TMainMenu;
    Imprimir1: TMenuItem;
    ImageList1: TImageList;
    GerarPDF1: TMenuItem;
    GerarExcel1: TMenuItem;
    Grade1: TMenuItem;
    Grfico1: TMenuItem;
    odOLAP: TSaveDialog;
    procedure GerarPDF1Click(Sender: TObject);
    procedure GerarExcel1Click(Sender: TObject);
    procedure Grade1Click(Sender: TObject);
    procedure Grfico1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fr_olap_vendas: Tfr_olap_vendas;

implementation

uses un_dao;

{$R *.dfm}

procedure Tfr_olap_vendas.GerarPDF1Click(Sender: TObject);
begin
  ODOLAP.Filter := '*.PDF';
  ODOLAP.DefaultExt := '*.PDF';
  ODOLAP.Execute;
  PDF.ExportToFile(ODOLAP.FileName);
end;

procedure Tfr_olap_vendas.GerarExcel1Click(Sender: TObject);
begin
  ODOLAP.Filter := '*.XLS';
  ODOLAP.DefaultExt := '*.XLS';
  ODOLAP.Execute;
  EXCEL.ExportToFile(ODOLAP.FileName);
end;

procedure Tfr_olap_vendas.Grade1Click(Sender: TObject);
begin
  hpPrint.Print;
end;

procedure Tfr_olap_vendas.Grfico1Click(Sender: TObject);
begin
  graf.Print;
end;

end.
