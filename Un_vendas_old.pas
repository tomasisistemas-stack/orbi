unit Un_vendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, Mask, Menus, CurrEdit;

type
  TFr_vendas = class(TForm)
    GroupBox1: TsGroupBox;
    GroupBox2: TsGroupBox;
    MainMenu1: TMainMenu;
    Atalho11: TMenuItem;
    Atalho21: TMenuItem;
    PRcod_sucursal: TsComboEdit;
    lb_nom_sucursal: tsLabel;
    GroupBox3: TsGroupBox;
    Panel1: tsPanel;
    Label9: tsLabel;
    Edit1: TsEdit;
    Label7: tsLabel;
    DateEdit1: TsDateEdit;
    GroupBox4: TsGroupBox;
    Label1: tsLabel;
    ComboBox1: TComboBox;
    Label10: tsLabel;
    ComboBox2: TComboBox;
    Label11: tsLabel;
    ComboEdit1: TsComboEdit;
    Label12: tsLabel;
    SpeedButton1: TsSpeedButton;
    CurrencyEdit1: TsCurrencyEdit;
    CurrencyEdit2: TsCurrencyEdit;
    CurrencyEdit3: TsCurrencyEdit;
    Label13: tsLabel;
    Label14: tsLabel;
    Label15: tsLabel;
    BitBtn1: TsBitBtn;
    BitBtn2: TsBitBtn;
    BitBtn3: TsBitBtn;
    BitBtn4: TsBitBtn;
    BitBtn5: TsBitBtn;
    BitBtn6: TsBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr_vendas: TFr_vendas;

implementation

{$R *.dfm}

end.
