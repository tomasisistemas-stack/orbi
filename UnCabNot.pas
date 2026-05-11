unit UnCabNot;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, IB_Controls;

type
  TFRCABNOT = class(TForm)
    DENOMCLI: TIB_Edit;
    DEENDCLI: TIB_Edit;
    DECEPCLI: TIB_Edit;
    DEUFCID: TIB_Edit;
    DENUMCNP: TIB_Edit;
    DEIECLI: TIB_Edit;
    DEFONCLI: TIB_Edit;
    Label1: tsLabel;
    BTCON: TsBitBtn;
    DEBAICLI: TIB_Edit;
    DENOMCID: TIB_Edit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure BTCONClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRCABNOT: TFRCABNOT;

implementation

uses UnDmVen, UnVen;

{$R *.dfm}

procedure TFRCABNOT.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
  begin
    Perform(Wm_NextDlgCtl,0,0);
    key:=#0;
  end;
end;

procedure TFRCABNOT.FormActivate(Sender: TObject);
begin
  DMVEN.QUVE1.FieldByName('nomcab').AsString:=FRVEN.EDNOMCLI.Text;
end;

procedure TFRCABNOT.BTCONClick(Sender: TObject);
begin
  FRVEN.EDNOMCLI.Text := DMVEN.QUVE1.fieldbyname('nomcab').AsString;
  DMVEN.QUVE1.Post;
  FRCABNOT.Close;
end;

procedure TFRCABNOT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FRCABNOT := nil;
end;

end.
