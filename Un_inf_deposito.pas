unit Un_inf_deposito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask,  Buttons, sBitBtn, sLabel, sCheckBox, Vcl.DBCtrls;

type
  Tfr_inf_deposito = class(TForm)
    IB_Edit1: TdbEdit;
    IB_Edit2: TdbEdit;
    IB_Edit4: TdbEdit;
    Label1: tsLabel;
    Label2: tsLabel;
    Label3: tsLabel;
    Label4: tsLabel;
    Label5: tsLabel;
    Label7: tsLabel;
    Lbnom_fornecedor: tsLabel;
    IB_Edit7: TdbEdit;
    IB_Date1: TdbEdit;
    bt_gra: TsBitBtn;
    bt_envia: TsBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure IB_Edit7KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fr_inf_deposito: Tfr_inf_deposito;

implementation

uses UnPri;

{$R *.dfm}

procedure Tfr_inf_deposito.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
  begin
    close;
  end;
end;

procedure Tfr_inf_deposito.IB_Edit7KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key := #0;
  end;
end;

end.
