unit UnDetCon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvComponent, JvButton, JvNavigationPane,
  JvTransparentButton, Grids,  ComCtrls, Buttons, StdCtrls, Mask;

type
  TFRDETCON = class(TForm)
    PADETCON: TJvNavPanelButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DGRES: TIB_Grid;
    IB_Grid2: TIB_Grid;
    BTIMP: TsSpeedButton;
    EDNOMCLI: TMaskEdit;
    Label1: tsLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EDNOMCLIExit(Sender: TObject);
    procedure EDNOMCLIEnter(Sender: TObject);
    procedure EDNOMCLIKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRDETCON: TFRDETCON;
  MCLIANT:string;
implementation

uses UnDmCad,  UnDmEst, UnSelCli;

{$R *.dfm}

procedure TFRDETCON.FormActivate(Sender: TObject);
begin
//  PADETCON.Caption:='CLIENTE: '+DMCAD.QUSELCLI.fieldbyname('nomcli').AsString;
//  if not(DMEST.QURESCON.Prepared) then DMEST.QURESCON.Prepare;
//  if not(DMEST.QUDETCON.Prepared) then DMEST.QUDETCON.Prepare;
end;

procedure TFRDETCON.FormCreate(Sender: TObject);
begin
  BTIMP.Caption:='Imprimir Extrato Detalhado'+#13+'das Consignações';
end;

procedure TFRDETCON.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then close;
end;

procedure TFRDETCON.EDNOMCLIExit(Sender: TObject);
var
  MPES:string;
begin
  MPES:=QuotedStr('%'+EDNOMCLI.Text+'%');

  if MCLIANT<>EDNOMCLI.Text then
  begin
    with DMCAD.QUSELCLI do
    begin
      close;
      sql.Clear;
      sql.Add('select cli.codcli,cli.nomcli,cli.avicli from tbcli cli');
      sql.add('where cli.nomcli like'+MPES);
      sql.add('order by nomcli');
      Prepare;
      open;
    end;
    if DMCAD.QUSELCLI.RecordCount>0 then
    begin
      FRSELCLI.ShowModal;
//      DMEST.QUDEC1.FieldByName('codcli').AsString:=DMCAD.QUSELCLI.fieldbyname('codcli').AsString;
      EDNOMCLI.Text:=DMCAD.QUSELCLI.fieldbyname('nomcli').AsString;
      //faz a pesquisa
      with DMEST.QURESCON do
      begin
        Close;
        ParamByName('codcli').AsString:=DMCAD.QUSELCLI.fieldbyname('codcli').AsString;
        open;
      end;

      with DMEST.QUDETCON do
      begin
        Close;
        ParamByName('codcli').AsString:=DMCAD.QUSELCLI.fieldbyname('codcli').AsString;
        open;
      end;

      EDNOMCLI.SetFocus;
    end
    else
    begin
      ShowMessage('<ATENÇÃO> NÃO EXISTE CLIENTE CADASTRADO COM ESTE NOME<ATENÇÃO>');
      EDNOMCLI.SetFocus;
      exit;
    end;
  end;

end;

procedure TFRDETCON.EDNOMCLIEnter(Sender: TObject);
begin
  MCLIANT:=EDNOMCLI.Text;
end;

procedure TFRDETCON.EDNOMCLIKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
    PageControl1.SetFocus;
    key:=#0;
  end;
end;

end.
