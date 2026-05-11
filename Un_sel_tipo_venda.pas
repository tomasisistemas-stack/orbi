unit Un_sel_tipo_venda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, sLabel, sCheckBox;

type
  TFr_sel_tipo_venda = class(TForm)
    Label1: tsLabel;
    ZZtipovenda: TsEdit;
    procedure ZZtipo_vendaKeyPress(Sender: TObject; var Key: Char);
    procedure ZZtipovendaKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure tipo_venda;
  end;

var
  Fr_sel_tipo_venda: TFr_sel_tipo_venda;

implementation

uses UnPri, Un_vendas;

{$R *.dfm}

{ TFr_sel_tipo_venda }

procedure TFr_sel_tipo_venda.tipo_venda;
begin
end;

procedure TFr_sel_tipo_venda.ZZtipo_vendaKeyPress(Sender: TObject;
  var Key: Char);
begin
//  tipo_venda := ZZtipo_venda.Text;
end;

procedure TFr_sel_tipo_venda.ZZtipovendaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    close;
  end;
end;

procedure TFr_sel_tipo_venda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  tipo_venda := ZZtipovenda.Text;
end;

procedure TFr_sel_tipo_venda.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

end.
