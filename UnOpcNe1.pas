unit UnOpcNe1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,  Mask;

type
  TFROPCNE1 = class(TForm)
    GroupBox2: TsGroupBox;
    RBTODCLI: TRadioButton;
    EDNOMFOR: TMaskEdit;
    GroupBox1: TsGroupBox;
    RBTODDOC: TRadioButton;
    LKTIPDOC: TIB_LookupCombo;
    EDDTAFIN: TsDateEdit;
    Label2: tsLabel;
    EDDTAINI: TsDateEdit;
    Label1: tsLabel;
    BTIMP: TsBitBtn;
    procedure BTIMPClick(Sender: TObject);
    procedure EDDTAFINKeyPress(Sender: TObject; var Key: Char);
    procedure EDDTAINIKeyPress(Sender: TObject; var Key: Char);
    procedure EDNOMCLIEnter(Sender: TObject);
    procedure EDNOMCLIExit(Sender: TObject);
    procedure EDNOMCLIKeyPress(Sender: TObject; var Key: Char);
    procedure LKTIPDOCEnter(Sender: TObject);
    procedure RBTODCLIClick(Sender: TObject);
    procedure RBTODDOCClick(Sender: TObject);
    procedure EDNOMFORExit(Sender: TObject);
    procedure EDNOMFOREnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROPCNE1: TFROPCNE1;

implementation

uses UnDmRel;

{$R *.dfm}

procedure TFROPCNE1.BTIMPClick(Sender: TObject);
var
 sqlcom:string;
begin

{  with DMREL.QURELCOR do
  begin
    close;
    sql.clear;
    sql.add('select cr2.numtit,cli.nomcli,cr2.dtaven,cr2.vlrtit,cr2.dtarec,cr2.vlrrec,cr2.codfop,fop.nomfop from tbcr2 cr2');
    sql.Add('left join tbcli cli on cr2.codcli=cli.codcli');
    sql.add('left join tbfop fop on cr2.codfop=fop.codfop');

    if RBARE.Checked=true then
    sqlcom:='where (cr2.dtaven>=:dtaini) and (cr2.dtaven<=:dtafin)';

    if RBGER.Checked=true then
    sqlcom:='where (cr2.dtaven>=:dtaini) and (cr2.dtaven<=:dtafin)';

    if RBREC.Checked=true then
    sqlcom:='where (cr2.dtarec>=:dtaini) and (cr2.dtarec<=:dtafin)';
    if RBTODDOC.Checked=false then
    begin
      //if sqlcom='where (cr2.dtarec>=:dtaini) and (cr2.dtarec<=:dtafin)' then
      sqlcom:=sqlcom+' and (cr2.codfop=:codfop)';
    end;

    if RBTODCLI.Checked=false then
    begin
      //if sqlcom='where (cr2.dtarec>=:dtaini) and (cr2.dtarec<=:dtafin)' then
      sqlcom:=sqlcom+' and (cr2.codcli=:codcli)'
    end;

    if RBARE.Checked=true then
    begin
//      sqlcom:='where (cr2.dtaven>=:dtaini) and (cr2.dtaven<=:dtafin)' then
      sqlcom:=sqlcom+' and (cr2.dtarec is null)';
    end;

    if RBREC.Checked=true then
    begin
      //if sqlcom='where (cr2.dtarec>=:dtaini) and (cr2.dtarec<=:dtafin)' then
      sqlcom:=sqlcom+' and not(cr2.dtarec is null)';
    end;
    sql.Add(sqlcom);
    ParamByName('dtaini').AsDateTime:=EDDTAINI.Date;
    ParamByName('dtafin').AsDateTime:=EDDTAFIN.Date;
    if RBTODDOC.Checked=false then
    ParamByName('codfop').AsString:=DMREL.QUTIPDOC.fieldbyname('codfop').AsString;
    if RBTODCLI.Checked=false then
    ParamByName('codcli').AsString:=DMCAD.QUSELCLI.fieldbyname('codcli').AsString;
    showmessage(DMREL.QURELCOR.SQL.Text);
    open;
  end;

  if MFORM='' then
  begin
    with TRLCor.Create(nil) do
    begin
      FRCOR.Preview;
      free;
    end;
  end;
  if MFORM='COMCLI' then
  begin
    with TRLCORCLI.Create(nil) do
    begin
      FRCORCLI.Preview;
      free;
    end;
  end;

 }
end;

procedure TFROPCNE1.EDDTAFINKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
    BTIMP.SetFocus;
    KEY:=#0;
  end;

end;

procedure TFROPCNE1.EDDTAINIKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
    EDDTAFIN.SetFocus;
    Key:=#0;
  end;
end;

procedure TFROPCNE1.EDNOMCLIEnter(Sender: TObject);
begin
{  MFORM:='COMCLI';
  RBTODCLI.Checked:=false;
  MCLIANT:=EDNOMCLI.Text;}

end;

procedure TFROPCNE1.EDNOMCLIExit(Sender: TObject);
var
MPES:string;
begin
  if EDNOMCLI.Text<>'' then
  begin
    MPES:=QuotedStr('%'+EDNOMCLI.Text+'%');

    if MCLIANT<>EDNOMCLI.Text then
    begin
      with DMCAD.QUSELCLI do
      begin
        close;
        sql.Clear;
        sql.Add('select cli.codcli,cli.nomcli,cli.endcli,cli.avicli from tbcli cli');
        sql.add('where cli.nomcli like'+MPES);
        sql.add('order by nomcli');
        Prepare;
        open;
      end;
      if DMCAD.QUSELCLI.RecordCount>0 then
      begin
        FRSELCLI.ShowModal;
        EDNOMCLI.Text:=DMCAD.QUSELCLI.fieldbyname('nomcli').AsString;
        EDNOMCLI.SetFocus;
      end;
    end;
   //verificar a situação cadastral do cliente, para bloquear o pedido
    with DMVEN.QUVERCR1 do
    begin
      close;
      ParamByName('codcli').AsString:=DMCAD.QUSELCLI.fieldbyname('codcli').AsString;
      open;
    end;
    DMVEN.QUVERCR1.First;
    If DMVEN.QUVERCR1.RecordCount>=1 then
    begin
      if DMVEN.QUVERCR1.RecordCount=1 then
      begin
        ShowMessage('ESTE CLIENTE:'+DMVEN.QUVERCR1.fieldbyname('nomcli').AsString+#13+' TEM UM TITULO EM ATRASO DE Nº'+DMVEN.QUVERCR1.fieldbyname('numtit').AsString+' VENCIDO EM '+DMVEN.QUVERCR1.fieldbyname('dtaven').AsString);
      end
      else
      begin
        ShowMessage('ESTE CLIENTE:'+DMVEN.QUVERCR1.fieldbyname('nomcli').AsString+#13+' TEM MAIS DE 1 TITULO EM ATRASO O MAIS ANTIGO É O Nº'+DMVEN.QUVERCR1.fieldbyname('numtit').AsString+' VENCIDO EM '+DMVEN.QUVERCR1.fieldbyname('dtaven').AsString);
      end;
    end;
  end;

end;

procedure TFROPCNE1.EDNOMCLIKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
    RBGER.SetFocus;
    key:=#0;
  end;  
end;

procedure TFROPCNE1.LKTIPDOCEnter(Sender: TObject);
begin
  DMREL.QUTIPDOC.Open;
  RBTODDOC.Checked:=false;
end;

procedure TFROPCNE1.RBTODCLIClick(Sender: TObject);
begin
  MFORM:='';
  EDNOMCLI.Text:='';
end;

procedure TFROPCNE1.RBTODDOCClick(Sender: TObject);
begin
    LKTIPDOC.Text:='';
end;

procedure TFROPCNE1.EDNOMFORExit(Sender: TObject);
var
  MPES:string;
begin
  MPES:=QuotedStr('%'+EDNOMFOR.Text+'%');

  if MFORANT<>EDNOMFOR.Text then
  begin
    with DMFIN.QUSELFOR do
    begin
      close;
      sql.Clear;
      sql.Add('select fon.codfor,fon.razfor,cid.nomcid,cid.ufcid from tbfor fon');
      sql.add('left join tbcid cid on fon.codcid=cid.codcid');
      sql.add('where razfor like'+MPES);
      Prepare;
      open;
    end;
    if DMFIN.QUSELFOR.RecordCount>0 then
    begin
      FRSELFOR.ShowModal;
      EDNOMFOR.Text:=DMFIN.QUSELFOR.fieldbyname('razfor').AsString
    end
    else
    begin
      ShowMessage('<ATENÇÃO> NÃO EXISTE FORNECEDOR CADASTRADO COM ESTE NOME<ATENÇÃO>');
      EDNOMFOR.SetFocus;
      exit;
    end;
  end;

end;

procedure TFROPCNE1.EDNOMFOREnter(Sender: TObject);
begin
  RBTODFOR.Checked:=false;
  MFORANT:=EDNOMFOR.Text;
end;

end.
