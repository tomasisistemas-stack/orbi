unit Un_cod_Fiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Mask;

type
  TFr_Cod_Fiscal = class(TForm)
    GroupBox1: TsGroupBox;
    PrCod_Fiscal: TMaskEdit;
    Label1: tsLabel;
    Label2: tsLabel;
    PrNome: TsEdit;
    PrDescricao: TRichEdit;
    Label3: tsLabel;
    PrTipo: TComboBox;
    Label4: tsLabel;
    procedure PrCod_FiscalKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr_Cod_Fiscal: TFr_Cod_Fiscal;

implementation

{$R *.dfm}

procedure TFr_Cod_Fiscal.PrCod_FiscalKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
  begin
    selectnext(sender as twincontrol,true,true);
    key:=#0;
  end;
end;

end.
