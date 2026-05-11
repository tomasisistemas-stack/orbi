unit un_conta_atrasada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, sLabel,
  sPanel, sBitBtn, sGroupBox, sMaskEdit, sCustomComboEdit, sCurrEdit,
  sCurrencyEdit;

type
  Tfm_conta_atrasada = class(TForm)
    Panel2: tsPanel;
    btgra: TsBitBtn;
    btcan: TsBitBtn;
    Panel1: tsPanel;
    gbDefinirSaldo: TsGroupBox;
    edValorPago: TsCurrencyEdit;
    GroupBox1: TsGroupBox;
    stValorPagar: tsLabel;
    GroupBox2: TsGroupBox;
    stTitulo: tsLabel;
    GroupBox3: TsGroupBox;
    stForn: tsLabel;
    GroupBox4: TsGroupBox;
    stVcto: tsLabel;
    procedure FormShow(Sender: TObject);
    procedure btgraKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_conta_atrasada: Tfm_conta_atrasada;

implementation

{$R *.dfm}

procedure Tfm_conta_atrasada.FormShow(Sender: TObject);
begin
  edValorPago.SetFocus;
end;

procedure Tfm_conta_atrasada.btgraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
//se for, passa o foco para o próximo campo, zerando o valor da variável Key
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure Tfm_conta_atrasada.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

end.
