unit un_escolhe_impressora_termica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, sPanel, Grids, DBGrids, acDBGrid, DB, RxMemDS,
  StdCtrls, Buttons, sBitBtn;

type
  Tfr_escolhe_impressora_termica = class(TForm)
    sPanel1: TsPanel;
    sPanel2: TsPanel;
    gdZebras: Tdbgrid;
    mmZebras: TRxMemoryData;
    mmZebrasNomeImpressora: TStringField;
    dsZebras: TDataSource;
    BtSelecione: TsBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BtSelecioneClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    impressora_termica : string;
  end;

var
  fr_escolhe_impressora_termica: Tfr_escolhe_impressora_termica;

implementation

uses Un_dao;

{$R *.dfm}

procedure Tfr_escolhe_impressora_termica.FormShow(Sender: TObject);
  procedure AddImpressora(impressora:string);
  begin
    mmZebras.Append;
    mmZebrasNomeImpressora.AsString := impressora;
    mmZebras.post;
  end;
begin
  dao.geral1('SELECT a.CAMINHO_COD_BARRAS, a.CAMINHO_COD_BARRAS2 FROM CONFIGURACAO a');

  mmZebras.EmptyTable;
  mmZebras.Open;
  AddImpressora(dao.Q1.fieldbyname('caminho_cod_barras').asstring);
  AddImpressora(dao.Q1.fieldbyname('caminho_cod_barras2').asstring);
  mmZebras.First;
end;

procedure Tfr_escolhe_impressora_termica.BtSelecioneClick(Sender: TObject);
begin
  impressora_termica := mmZebrasNomeImpressora.AsString;
  modalresult := mrOk;
end;

end.

