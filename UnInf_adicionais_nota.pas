unit UnInf_adicionais_nota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, IB_Controls;

type
  TFrInf_adicionais_nota = class(TForm)
    DEinfadi1: TIB_Edit;
    deinfadi2: TIB_Edit;
    deinfadi3: TIB_Edit;
    btok: TsBitBtn;
    procedure btokClick(Sender: TObject);
    procedure DEinfadi1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrInf_adicionais_nota: TFrInf_adicionais_nota;

implementation

uses

{$R *.dfm}

procedure TFrInf_adicionais_nota.btokClick(Sender: TObject);
begin
//  close;
end;

procedure TFrInf_adicionais_nota.DEinfadi1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    key:=#0;
  end;
end;

end.
