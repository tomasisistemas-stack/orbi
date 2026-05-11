unit Un_Cotacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Grids, DBGrids, sLabel, sCheckBox,
  sGroupBox, acDBGrid, sEdit, sMaskEdit, sCustomComboEdit, sTooledit;

type
  TFr_Cotacao = class(TForm)
    DBGrid1: Tdbgrid;
    Label1: tsLabel;
    PrDta_Pesquisa: TsDateEdit;
    GroupBox1: TsGroupBox;
    Edit1: TsEdit;
    Label2: tsLabel;
    DateEdit1: TsDateEdit;
    Label3: tsLabel;
    Edit2: TsEdit;
    Edit3: TsEdit;
    Label4: tsLabel;
    Label5: tsLabel;
    GroupBox2: TsGroupBox;
    PrDta_Cotacao: TsDateEdit;
    Label6: tsLabel;
    PrCod_Fornecedor: TsEdit;
    Label7: tsLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr_Cotacao: TFr_Cotacao;

implementation

{$R *.dfm}

end.
