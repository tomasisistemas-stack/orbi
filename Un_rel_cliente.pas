unit Un_rel_cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, jpeg, RLFilters, RLXLSFilter, RLReport, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFr_rel_cliente = class(TForm)
    Rl_cliente: TRLReport;
    RLBand1: TRLBand;
    lb_empresa: TRLLabel;
    RLImage1: TRLImage;
    RLSystemInfo1: TRLSystemInfo;
    Lb_titulo: TRLLabel;
    qu_cliente: TFDQuery;
    ds_cliente: TDataSource;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLBand3: TRLBand;
    RLLabel1: TRLLabel;
    RLDBText3: TRLDBText;
    RLBand4: TRLBand;
    RLSystemInfo2: TRLSystemInfo;
    RLDBText4: TRLDBText;
    RLBand5: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLDBText5: TRLDBText;
    RLXLSFilter1: TRLXLSFilter;
    qu_clientecod_cliente: TIntegerField;
    qu_clientenom_cliente: TStringField;
    qu_clientecontato: TStringField;
    qu_clientenom_cidade: TStringField;
    qu_clienteuf: TStringField;
    qu_clientetelefone: TStringField;
    procedure RLImage1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr_rel_cliente: TFr_rel_cliente;

implementation

uses UnPri, Un_dao;

{$R *.dfm}

procedure TFr_rel_cliente.RLImage1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLImage1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo.bmp');
end;

end.
