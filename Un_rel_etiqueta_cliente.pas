unit Un_rel_etiqueta_cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, DB,   FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TRl_etiqueta_cliente = class(TForm)
    RLetiqueta: TRLReport;
    RLDetailGrid1: TRLDetailGrid;
    RLDBText2: TRLDBText;
    qu_etiqueta_cliente: TFDQuery;
    ds_etiqueta_cliente: TDataSource;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText1: TRLDBText;
    qu_etiqueta_clientenom_cliente: TStringField;
    qu_etiqueta_clienteendereco: TStringField;
    qu_etiqueta_clientecep: TStringField;
    qu_etiqueta_clientebairro: TStringField;
    qu_etiqueta_clientecod_cidade: TIntegerField;
    qu_etiqueta_clientenom_cidade: TStringField;
    qu_etiqueta_clienteuf: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Rl_etiqueta_cliente: TRl_etiqueta_cliente;

implementation

uses Un_dao, UnPri;

{$R *.dfm}

end.
