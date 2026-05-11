unit conta_atrasada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask,  Buttons, ExtCtrls, sLabel, sMaskEdit,
  sCustomComboEdit, sCurrEdit, sCurrencyEdit, sGroupBox, sBitBtn, sPanel;

type
  TForm2 = class(TForm)
    Panel2: tsPanel;
    btgra: TsBitBtn;
    btcan: TsBitBtn;
    Panel1: tsPanel;
    gbDefinirSaldo: TsGroupBox;
    edSaldo: TsCurrencyEdit;
    GroupBox1: TsGroupBox;
    stTotalSel: tsLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

end.
