unit un_definir_saldo_inicial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, Buttons, sPanel, sBitBtn,
  sGroupBox, sCheckBox, sMaskEdit, sCustomComboEdit, sCurrEdit,
  sCurrencyEdit;

type
  Tfm_definir_saldo_inicial = class(TForm)
    Panel1: tsPanel;
    Panel2: tsPanel;
    gbDefinirSaldo: TsGroupBox;
    edSaldo: TsCurrencyEdit;
    btgra: TsBitBtn;
    btcan: TsBitBtn;
    ckMostra: TsCheckBox;
    gbPeso: TsGroupBox;
    edPeso: TsCurrencyEdit;
    ckEmpresa: TsCheckBox;
    gbModelo: TsGroupBox;
    cbModeloEtiqueta: TComboBox;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_definir_saldo_inicial: Tfm_definir_saldo_inicial;

implementation

{$R *.dfm}

procedure Tfm_definir_saldo_inicial.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure Tfm_definir_saldo_inicial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
