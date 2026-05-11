unit UnTESTE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, JvgStringGrid, JvExControls, JvComponent, JvEnterTab,
  StdCtrls, IB_CGrid, Mask,  ExtCtrls, Buttons;

type
  TFRTESTE = class(TForm)
    Edit2: TsEdit;
    DEPREVEN: TIB_Edit;
    cg: TIB_CtrlGrid;
    EDCODPRO: TIB_Edit;
    EDNOMPRO: TIB_Edit;
    PREVEN: TIB_Edit;
    TOTLIQ: TIB_Edit;
    GBDAD2: TsGroupBox;
    Label19: tsLabel;
    Label21: tsLabel;
    LA1: tsLabel;
    Label24: tsLabel;
    Label25: tsLabel;
    DEVLRDES: TIB_Edit;
    DEVLRACR: TIB_Edit;
    LKFORPAG: TIB_LookupCombo;
    DEPRAPGT: TIB_Edit;
    GroupBox2: TsGroupBox;
    IB_Grid1: TIB_Grid;
    BTREL: TsBitBtn;
    BitBtn2: TsBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure EDCODPROKeyPress(Sender: TObject; var Key: Char);
    procedure cgKeyPress(Sender: TObject; var Key: Char);
  private
    procedure exemplo_stringgrid;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRTESTE: TFRTESTE;

implementation

uses UnDmVen;

{$R *.dfm}

procedure TFRTESTE.exemplo_stringgrid;
begin
{ StringGrid1.ColWidths[2]:=0;   //oculta a coluna
 }
end;

procedure TFRTESTE.FormActivate(Sender: TObject);
begin




  {SG.ColWidths[0] :=-1;

  SG.Cells[1,0] :='Código';
  SG.ColWidths[1] :=50;

  SG.Cells[2,0] := 'Produto';
  SG.ColWidths[2] :=150;

  SG.Cells[3,0] := 'Preço';
  SG.ColWidths[3] :=80;

  SG.Cells[4,0] :='Total';
  SG.ColWidths[4] :=80;
   }
end;

procedure TFRTESTE.EDCODPROKeyPress(Sender: TObject; var Key: Char);
begin
//  if key =#13 then
//    cg
//    EDNOMPRO.setfocus;
//    SelectNext(Sender as TWinControl,true,true);
end;

procedure TFRTESTE.cgKeyPress(Sender: TObject; var Key: Char);
begin
  if key =#13 then
    SelectNext(Sender as TWinControl,true,true);

end;

end.
