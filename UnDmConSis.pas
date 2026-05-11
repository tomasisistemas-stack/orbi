unit UnDmConSis;

interface

uses
  SysUtils, Classes, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  TDMCONSIS = class(TDataModule)
    QUJUR: TFDQuery;
    TRCONSIS: TFDTransaction;
    DSJUR: TDataSource;
    QUUSU: TFDQuery;
    DSUSU: TDataSource;
    TRUSU: TFDTransaction;
    QUNUMNOT: TFDQuery;
    DSNUMNOT: TDataSource;
    TRNUMNOT: TFDTransaction;
    QUPROSIS: TFDQuery;
    DSPROSIS: TDataSource;
    TRPROSIS: TFDTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCONSIS: TDMCONSIS;

implementation



{$R *.dfm}

end.
