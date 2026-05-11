unit UnDevCon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, CheckLst, Grids, IB_CursorGrid, 
   ComCtrls, JvExControls, JvComponent, JvNavigationPane,
  RDprint, ExtCtrls;

type
  TFRDEVCON = class(TForm)
    PCDEC: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GBDEC2: TsGroupBox;
    Label3: tsLabel;
    Label4: tsLabel;
    Label5: tsLabel;
    EDCODPRO: TMaskEdit;
    EDNOMPRO: TMaskEdit;
    DEQTDDEV: TIB_Edit;
    DGDEV: TIB_Grid;
    IB_Edit1: TIB_Edit;
    Label6: tsLabel;
    BTNOVDEC: TsBitBtn;
    BTALTDEC: TsBitBtn;
    BTGRADEC: TsBitBtn;
    BTCANDEC: TsBitBtn;
    BTEXCDEC: TsBitBtn;
    BTSAIDEC: TsBitBtn;
    GBDEC1: TsGroupBox;
    Label1: tsLabel;
    EDNOMCLI: TMaskEdit;
    BTNOVDEC1: TsBitBtn;
    BTALTDEC1: TsBitBtn;
    BTGRADEC1: TsBitBtn;
    BTCANDEC1: TsBitBtn;
    BTEXCDEC1: TsBitBtn;
    DEDTADEV: TIB_Date;
    Label2: tsLabel;
    BTRESCON: TsBitBtn;
    BitBtn1: TsBitBtn;
    btimp: TsBitBtn;
    RDIMPPED: TRDprint;
    EDSENUSU: TMaskEdit;
    Usuario: tsLabel;
    DEDTACON: TIB_Date;
    Label7: tsLabel;
    DENUMCON: TIB_Edit;
    Label8: tsLabel;
    Panel1: tsPanel;
    RichEdit1: TRichEdit;
    procedure btimpClick(Sender: TObject);
    procedure EDNOMCLIExit(Sender: TObject);
    procedure EDNOMCLIEnter(Sender: TObject);
    procedure EDNOMELEExit(Sender: TObject);
    procedure BTNOVDECClick(Sender: TObject);
    procedure BTALTDECClick(Sender: TObject);
    procedure BTGRADECClick(Sender: TObject);
    procedure BTCANDECClick(Sender: TObject);
    procedure BTEXCDECClick(Sender: TObject);
    procedure BTSAIDECClick(Sender: TObject);
    procedure EDNOMELEEnter(Sender: TObject);
    procedure EDCODPROExit(Sender: TObject);
    procedure EDCODPROEnter(Sender: TObject);
    procedure EDNOMPROExit(Sender: TObject);
    procedure EDNOMPROEnter(Sender: TObject);
    procedure BTNOVDEC1Click(Sender: TObject);
    procedure BTALTDEC1Click(Sender: TObject);
    procedure BTGRADEC1Click(Sender: TObject);
    procedure BTCANDEC1Click(Sender: TObject);
    procedure BTEXCDEC1Click(Sender: TObject);
    procedure EDNOMCLIKeyPress(Sender: TObject; var Key: Char);
    procedure DEQTDDEVExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BTRESCONClick(Sender: TObject);
    procedure DEDTADEVKeyPress(Sender: TObject; var Key: Char);
    procedure EDCODPROKeyPress(Sender: TObject; var Key: Char);
    procedure EDNOMPROKeyPress(Sender: TObject; var Key: Char);
    procedure DEQTDDEVKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RDIMPPEDNewPage(Sender: TObject; Pagina: Integer);
    procedure EDSENUSUExit(Sender: TObject);
    procedure EDSENUSUKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure DENUMCONExit(Sender: TObject);
    procedure DEDTACONExit(Sender: TObject);
  private

    { Private declarations }
  public
    procedure Imp_ComDev;
    procedure RetDadDec2;
    procedure RetDaddec1;

    { Public declarations }
  end;

var
  FRDEVCON: TFRDEVCON;
  MCLIANT,MELEANT,MACAODEC2,MACAODEC1,MCPRANT,MPRDANT: string;
  MQTDPRA: real;
  query: TFDQuery;
implementation

uses UnDmEst, UnSelCli, UnDmCad, UnFun, UnPri, UnDmFin, UnSelPro,
   UnDetCon, UnLocCli, UnDmVen, Math;

{$R *.dfm}

procedure TFRDEVCON.btimpClick(Sender: TObject);
begin
  Imp_ComDev;
end;

procedure TFRDEVCON.EDNOMCLIExit(Sender: TObject);
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
      DMEST.QUDEC1.FieldByName('codcli').AsString:=DMCAD.QUSELCLI.fieldbyname('codcli').AsString;
      EDNOMCLI.Text:=DMCAD.QUSELCLI.fieldbyname('nomcli').AsString;
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

procedure TFRDEVCON.EDNOMCLIEnter(Sender: TObject);
begin
  MCLIANT:=EDNOMCLI.Text;
end;

procedure TFRDEVCON.EDNOMELEExit(Sender: TObject);
//var
//  MPES:string;
begin
{  MPES:=QuotedStr('%'+EDNOMELE.Text+'%');

  if MELEANT<>EDNOMELE.Text then
  begin
    with DMCAD.QUSELCLI do
    begin
      close;
      sql.Clear;
      sql.Add('select cli.codcli,cli.nomcli from tbcli cli');
      sql.add('where cli.nomcli like'+MPES);
      Prepare;
      open;
    end;
    if DMCAD.QUSELCLI.RecordCount>0 then
    begin
      FRSELCLI.ShowModal;
      DMEST.QUDEVCON.FieldByName('codele').AsString:=DMCAD.QUSELCLI.fieldbyname('codcli').AsString;
      EDNOMELE.Text:=DMCAD.QUSELCLI.fieldbyname('nomcli').AsString;
      EDNOMELE.SetFocus;
    end
    else
    begin
      ShowMessage('<ATENÇÃO> NÃO EXISTE CLIENTE CADASTRADO COM ESTE NOME<ATENÇÃO>');
      EDNOMELE.SetFocus;
      exit;
    end;
  end;
 }
end;

procedure TFRDEVCON.BTNOVDECClick(Sender: TObject);
begin
  try
    DMEST.QUDEC1.Close;
    DMEST.QUDEC2.Close;

    EDNOMCLI.Clear;
    EDCODPRO.Clear;
    EDNOMPRO.Clear;
    BTNOVDEC.Enabled:=false;
    BTALTDEC.Enabled:=false;
    BTGRADEC.Enabled:=true;
    BTCANDEC.Enabled:=true;
    BTEXCDEC.Enabled:=false;
    BTSAIDEC.Enabled:=False;
    btimp.Enabled:=false;
    GBDEC1.Enabled:=true;
    MACAODEC1:='NOV';
    if not(DMEST.TRDEVCON.InTransaction) then DMEST.TRDEVCON.StartTransaction;
    DMEST.QUDEC1.Insert;
    DMEST.QUDEC1.FieldByName('numdec').AsString:=FMFUN.enchezero(DMEST.QUDEC1.fieldbyname('numdec').AsString,5);
    DMEST.QUDEC1.FieldByName('dtadec').AsDateTime:=now;
    EDSENUSU.SetFocus;
  except
    on e:exception do
    begin
      showmessage(e.Message);
      DMEST.TRDEVCON.Rollback;
    end;
  end;

end;

procedure TFRDEVCON.BTALTDECClick(Sender: TObject);
begin
  try
    GBDEC1.Enabled:=true;
    BTNOVDEC.Enabled:=false;
    BTALTDEC.Enabled:=false;
    BTGRADEC.Enabled:=true;
    BTCANDEC.Enabled:=true;
    BTSAIDEC.Enabled:=false;
    BTEXCDEC.Enabled:=false;
    btimp.Enabled:=false;
    MACAODEC1:='ALT';
    if not(DMEST.TRDEVCON.InTransaction) then DMEST.TRDEVCON.StartTransaction;
    DMEST.QUDEC1.edit;
    EDNOMCLI.SetFocus;
  except
    on e:exception do
    begin
      showmessage(e.Message);
      DMEST.TRDEVCON.Rollback;
    end;
  end;

end;

procedure TFRDEVCON.BTGRADECClick(Sender: TObject);
begin
  try
    if (EDNOMCLI.Text='') then
    begin
      ShowMessage('O CAMPO NOME DO CLIENTE NÃO PODE FICAR VAZIO!');
      EDNOMCLI.SetFocus;
      exit;
    end;

    if DMEST.QUDEC2.RecordCount < 1 then
    begin
      Showmessage('Não Existe Item Para Ser Gravado');
    end;


    BTNOVDEC.Enabled:=true;
    BTALTDEC.Enabled:=true;
    BTGRADEC.Enabled:=false;
    BTCANDEC.Enabled:=false;
    BTEXCDEC.Enabled:=true;
    BTSAIDEC.Enabled:=true;
    GBDEC1.Enabled:=false;
    btimp.Enabled:=true;
    if not(DMEST.TRDEVCON.InTransaction) then DMEST.TRDEVCON.StartTransaction;
    DMEST.QUDEC1.Post;
    DMEST.TRDEVCON.Commit;
    DMEST.QUDEC1.RefreshRows;

    if MessageDlg('DESEJA IMPRIMIR O COMPROVANTE?',mtConfirmation,[MBYES,MBNO],0)=mryes then
       Imp_ComDev;

    if MACAODEC1='NOV' THEN
    BTNOVDEC.SetFocus;

  except
    on e:exception do
    begin
       showmessage(e.message);
       DMEST.TRDEVCON.Rollback;
    end;
  end;

end;

procedure TFRDEVCON.BTCANDECClick(Sender: TObject);
begin
  try
    GBDEC1.Enabled:=false;
    BTNOVDEC.Enabled:=true;
    BTALTDEC.Enabled:=true;
    BTGRADEC.Enabled:=false;
    BTCANDEC.Enabled:=false;
    BTEXCDEC.Enabled:=true;
    BTSAIDEC.Enabled:=True;
    btimp.Enabled:=true;
    DMEST.QUDEC1.cancel;
    RetDaddec1;
    DMEST.TRDEVCON.Rollback;
  except
    on e:exception do
    begin
      showmessage(e.Message);
      DMEST.TRDEVCON.Rollback;
    end;
  end;

end;

procedure TFRDEVCON.BTEXCDECClick(Sender: TObject);
begin
  if MessageDlg('CONFIRMA A EXCLUSÃO DESTE DEVOLUÇÃO DE CONSIGNAÇÃO!',mtConfirmation,[mbyes,mbno],0)=mrno then
  exit
  else
  begin
    IF not(DMEST.TRDEVCON.InTransaction) then DMEST.TRDEVCON.StartTransaction;
    DMEST.QUDEC1.Delete;
    DMEST.TRDEVCON.Commit;
  end;

end;

procedure TFRDEVCON.BTSAIDECClick(Sender: TObject);
begin
  close;
end;

procedure TFRDEVCON.EDNOMELEEnter(Sender: TObject);
begin
  //MELEANT:=EDNOMELE.Text;
end;

procedure TFRDEVCON.EDCODPROExit(Sender: TObject);
var
  MPES:string;
begin
  if EDCODPRO.Text<>'' then
  begin
    if Length(EDCODPRO.Text)<13 then
    begin
      EDCODPRO.Text:=FMFUN.enchezero(EDCODPRO.Text,5);
      MPES:=EDCODPRO.Text;

      if (MCPRANT<>EDCODPRO.Text) and (EDCODPRO.Text<>'00000') then
      begin
        with DMFIN.QUSELPRO do
        begin
          close;
          sql.Clear;
          sql.Add('select codpro,nompro,preven,peripi,nomuni from tbpro');
          sql.add('where codpro=:mcodpro');
          ParamByName('mcodpro').value:=EDCODPRO.Text;
          Prepare;
          open;
        end;
        if DMFIN.QUSELPRO.RecordCount>0 then
        begin
          DMEST.QUDEC2.FieldByName('codpro').AsString:=DMFIN.QUSELPRO.fieldbyname('codpro').AsString;
          EDNOMPRO.Text:=DMFIN.QUSELPRO.fieldbyname('nompro').AsString;
        end
        else
        begin
          ShowMessage('<ATENÇÃO> NÃO EXISTE PRODUTO CADASTRADO COM ESTE CÓDIGO!<ATENÇÃO>');
          EDCODPRO.SetFocus;
        end;
      end;
    end
    else // A partir daqui será a pesquisa para o código de barras
    begin
      if Length(edcodpro.Text)=13 then
      begin
        EDCODPRO.Text:=FMFUN.enchezero(EDCODPRO.Text,13);
        MPES:=EDCODPRO.Text;

        if (MCPRANT<>EDCODPRO.Text) and (EDCODPRO.Text<>'0000000000000') then
        begin
          with DMFIN.QUSELPRO do
          begin
            close;
            sql.Clear;
            sql.Add('select pro.codpro,pro.nompro,pro.preven,pro.peripi,pro.nomuni,prb.codbar from tbpro pro');
            sql.add('left join tbprobar prb on prb.codpro=pro.codpro');
            sql.add('where prb.codbar=:mcodbar');
            ParamByName('mcodbar').value:=EDCODPRO.Text;
            Prepare;
            open;
          end;
          if DMFIN.QUSELPRO.RecordCount>0 then
          begin
            DMEST.QUDEC2.FieldByName('codpro').AsString:=DMFIN.QUSELPRO.fieldbyname('codpro').AsString;
            EDNOMPRO.Text:=DMFIN.QUSELPRO.fieldbyname('nompro').AsString;
          end
          else
          begin
            ShowMessage('<ATENÇÃO> NÃO EXISTE PRODUTO CADASTRADO COM ESTE CÓDIGO!<ATENÇÃO>');
            EDCODPRO.SetFocus;
          end;
        end;
      end;
    end;
  end;

end;

procedure TFRDEVCON.EDCODPROEnter(Sender: TObject);
begin
  MCPRANT:=EDCODPRO.Text;
end;

procedure TFRDEVCON.EDNOMPROExit(Sender: TObject);
var
  MPES:string;
begin
  MPES:=QuotedStr('%'+EDNOMPRO.Text+'%');
  if MPRDANT<>EDNOMPRO.Text then
  begin
    with DMFIN.QUSELPRO do
    begin
      close;
      sql.Clear;
      sql.Add('select codpro,nompro,preven,nomuni from tbpro');
      sql.add('where nompro like'+MPES);
      sql.add('order by nompro');
      Prepare;
      open;
    end;
    if DMFIN.QUSELPRO.RecordCount>0 then
    begin
      MFRMSEL:='';
      FRSELPRO.ShowModal;
      DMEST.QUDEC2.FieldByName('codpro').AsString:=DMFIN.QUSELPRO.fieldbyname('codpro').AsString;
      EDNOMPRO.Text:=DMFIN.QUSELPRO.fieldbyname('nompro').AsString;
      EDCODPRO.Text:=DMFIN.QUSELPRO.fieldbyname('codpro').AsString;
      EDNOMPRO.SetFocus;
    end
    else
    begin
      ShowMessage('<ATENÇÃO> NÃO EXISTE PRODUTO CADASTRADO COM ESTE NOME<ATENÇÃO>');
      EDNOMPRO.SetFocus;
    end;
  end;

end;

procedure TFRDEVCON.EDNOMPROEnter(Sender: TObject);
begin
  MPRDANT:=EDNOMPRO.Text;
end;

procedure TFRDEVCON.BTNOVDEC1Click(Sender: TObject);
begin
  try
    if (DEDTACON.Text='') or (DENUMCON.Text='') or (EDNOMCLI.Text='') then
    begin
      showmessage('Algum Campo na Aba Principal deve ser Preenchido!!!!');
      exit;
     end;

    if BTGRADEC.Enabled = false then
    begin
      FRPRI.msg('O BOTÃO NOVO/ALTERAR DA ABA DADOS NAO ESTÁ PRESIONADO!');
      exit;
    end;

    query:=TFDQuery.Create(self);
    with query do
    begin
      IB_Connection:=dmcad.CN;
      close;
      sql.Clear;
      sql.add('select numdoc,dtadoc,serdoc from tbve1 '+
              'where flacon='+QuotedStr('S')+' and dtadoc=:dtadoc and numdoc=:numdoc and codcli=:codcli');

      ParamByName('dtadoc').AsString:=DMEST.QUDEC1.fieldbyname('dtacon').AsString;
      ParamByName('numdoc').AsString:=DMEST.QUDEC1.fieldbyname('numcon').AsString;
      ParamByName('codcli').AsString:=DMEST.QUDEC1.fieldbyname('codcli').AsString;
      open;
    end;
    if query.RecordCount<=0 then
    begin
      showmessage('Não foi encontrado Consignação com estes Dados, Por Favor Verifique os Dados');
      exit;
    end;

    EDCODPRO.Clear;
    EDNOMPRO.Clear;
    BTNOVDEC1.Enabled:=false;
    BTALTDEC1.Enabled:=false;
    BTGRADEC1.Enabled:=true;
    BTCANDEC1.Enabled:=true;
    BTEXCDEC1.Enabled:=false;
    DGDEV.Enabled:=false;
    MACAODEC2:='NOV';
    if not(DMEST.TRDEVCON.InTransaction) then DMEST.TRDEVCON.StartTransaction;
    DMEST.QUDEC2.append;
    EDCODPRO.SetFocus;
  except
    on e:exception do
    begin
      showmessage(e.Message);
      DMEST.TRDEVCON.Rollback;
    end;
  end;

end;

procedure TFRDEVCON.BTALTDEC1Click(Sender: TObject);
begin
  try
    BTNOVDEC1.Enabled:=false;
    BTALTDEC1.Enabled:=false;
    BTGRADEC1.Enabled:=true;
    BTCANDEC1.Enabled:=true;
    BTEXCDEC1.Enabled:=false;
    DGDEV.Enabled:=false;
    MACAODEC2:='ALT';
    if not(DMEST.TRDEVCON.InTransaction) then DMEST.TRDEVCON.StartTransaction;
    DMEST.QUDEC2.edit;
    MCPRANT:= DMEST.QUDEC2.fieldbyname('codpro').AsString;
    MQTDPRA:= DMEST.QUDEC2.fieldbyname('qtddev').AsFloat;
    EDCODPRO.SetFocus;
  except
    on e:exception do
    begin
      showmessage(e.Message);
      DMEST.TRDEVCON.Rollback;
    end;
  end;

end;

procedure TFRDEVCON.BTGRADEC1Click(Sender: TObject);
var
 MQTDDEV,MQTD,resto, qtdrec:real;
begin
  try
    if (EDCODPRO.Text='') then
    begin
      ShowMessage('O CAMPO CÓDIGO DO PRODUTO NÃO PODE FICAR VAZIO!');
      EDCODPRO.SetFocus;
      exit;
    end;

    if (DEQTDDEV.Text='') or (DMEST.QUDEC2.FieldByName('qtddev').AsFloat=0) then
    begin
      ShowMessage('O CAMPO QUANTIDADE DEVOLVIDA NÃO PODE FICAR VAZIO!!');
      EDCODPRO.SetFocus;
      exit;
    end;
    BTNOVDEC1.Enabled:=true;
    BTALTDEC1.Enabled:=true;
    BTGRADEC1.Enabled:=false;
    BTCANDEC1.Enabled:=false;
    BTEXCDEC1.Enabled:=true;
    DGDEV.Enabled:=true;

    DMEST.QUDEC2.FieldByName('dtadev').AsDateTime:=DMEST.QUDEC1.fieldbyname('dtadec').AsDateTime;
    resto:=0;
    if not(DMEST.TRDEVCON.InTransaction) then DMEST.TRDEVCON.StartTransaction;
    DMEST.QUDEC2.Post;
    DMEST.QUDEC2.RefreshRows;

    //Devolver os itens no campo tbve2.qtddev.
     MQTDDEV:=DMEST.QUDEC2.fieldbyname('qtddev').AsFloat;

     with DMEST.QUDEVCON do
     begin
       Close;
       ParamByName('codpro').AsString:=DMEST.QUDEC2.fieldbyname('codpro').AsString;
       ParamByName('codcli').AsString:=DMEST.QUDEC1.fieldbyname('codcli').AsString;
       ParamByName('dtacon').AsDateTime:=DMEST.QUDEC1.fieldbyname('dtacon').AsDateTime;
       ParamByName('numcon').AsString:=DMEST.QUDEC1.fieldbyname('numcon').AsString;
       open;
     end;
     if DMEST.QUDEVCON.RecordCount <=0 then
     begin
       FRPRI.msg('Produto Inexistente ou já Devolvido na Consignação!');
       exit;
     end;

     if MACAODEC2 = 'ALT' then
     begin
        DMEST.QUDEVCON.fieldbyname('qtddev').AsFloat:= DMEST.QUDEVCON.fieldbyname('qtddev').AsFloat - MQTDPRA;
     end;

     DMEST.QUDEVCON.First;

     while not(DMEST.QUDEVCON.Eof) do
     begin
       if MQTDDEV <=0 then break;
       if DMEST.QUVERCOM.FieldByName('totpro').AsFloat >= MQTDDEV then
       begin
         //if a quantidade devolcida atual for maior que a qtdpro da linha então o resto recebe o resto :)
         if (DMEST.QUDEVCON.FieldByName('qtdpro').AsFloat - DMEST.QUDEVCON.FieldByName('qtddev').AsFloat) < MQTDDEV  then
         begin
           resto := MQTDDEV - (DMEST.QUDEVCON.FieldByName('qtdpro').AsFloat - DMEST.QUDEVCON.FieldByName('qtddev').AsFloat);
           qtdrec:= DMEST.QUDEVCON.FieldByName('qtddev').AsFloat - DMEST.QUDEVCON.FieldByName('qtdpro').AsFloat;
           if qtdrec < 0 then
              qtdrec := qtdrec * -1;

           DMEST.QUDEVCON.FieldByName('qtddev').AsFloat := DMEST.QUDEVCON.FieldByName('qtddev').AsFloat + qtdrec ;

//           DMEST.QUDEVCON.FieldByName('qtddev').AsFloat := DMEST.QUDEVCON.FieldByName('qtddev').AsFloat + DMEST.QUDEVCON.FieldByName('qtdpro').AsFloat;
           if DMEST.QUDEVCON.FieldByName('qtddev').AsFloat >= DMEST.QUDEVCON.FieldByName('qtdpro').AsFloat then
              DMEST.QUDEVCON.FieldByName('fladev').AsString:='S';
         end
         else
           DMEST.QUDEVCON.FieldByName('qtddev').AsFloat := dmest.QUDEVCON.fieldbyname('qtddev').AsFloat + MQTDDEV;


         if DMEST.QUDEVCON.FieldByName('qtdpro').AsFloat = DMEST.QUDEVCON.FieldByName('qtddev').AsFloat then
            if messagedlg('<ATENÇÃO> VOCÊ ESTÁ PRESTES A FINALIZAR ESTE PRODUTO COMO COMPLETO! '+#13+
                          'PARA CONFIRMAR CLIQUE EM SIM, MAS SE AINDA PRECISA ALTERAR A QUANTIDADE DEVOLVIDA ENTÃO CLIQUE EM NÃO!',mtConfirmation, [MBYES,MBNO],0)=mryes then
                               DMEST.QUDEVCON.FieldByName('fladev').AsString:='S'
                               else
                               begin
                                 DEQTDDEV.SetFocus;
                                 BTNOVDEC1.Enabled:=false;
                                 BTALTDEC1.Enabled:=false;
                                 BTGRADEC1.Enabled:=true;
                                 BTCANDEC1.Enabled:=true;
                                 BTEXCDEC1.Enabled:=false;
                                 DGDEV.Enabled:=false;
                                 DEQTDDEV.SetFocus;
                                 //dmest.TRDEVCON.RollbackRetaining;
                               //  DMEST.QUDEVCON.Cancel;
                               //  DMEST.QUDEC2.Cancel;
                                 Exit;
                               end;

{       if (DMEST.QUDEVCON.FieldByName('qtdpro').AsFloat-DMEST.QUDEVCON.FieldByName('qtddev').AsFloat) >=MQTDDEV then
       begin
         DMEST.QUDEVCON.FieldByName('qtddev').AsFloat:=DMEST.QUDEVCON.FieldByName('qtddev').AsFloat+MQTDDEV;

         if DMEST.QUDEVCON.FieldByName('qtdpro').AsFloat = DMEST.QUDEVCON.FieldByName('qtddev').AsFloat then
         DMEST.QUDEVCON.FieldByName('fladev').AsString:='S';}


         DMEST.QUDEC2.FieldByName('predev').AsFloat := DMEST.QUDEVCON.fieldbyname('preven').AsFloat;
//         DMEST.QUDEC2.FieldByName('totliq').AsFloat := DMEST.QUDEVCON.FieldByName('preven').AsFloat * DMEST.QUDEVCON.fieldbyname('qtddev').AsFloat;
         DMEST.QUDEC2.FieldByName('totliq').AsFloat := DMEST.QUDEVCON.FieldByName('preven').AsFloat * MQTDDEV;

         DMEST.QUDEVCON.Post;
         MQTDDEV := resto;
//felipe 18/02  MQTDDEV := MQTDDEV - DMEST.QUDEVCON.FieldByName('qtdpro').AsFloat;

       end;
       DMEST.QUDEVCON.Next;
     end;
    //fina do devolver os itens no campo tbve2.qtddev.


     if MACAODEC2='NOV' THEN
     BTNOVDEC1.SetFocus;
  except
  on e:exception do
  begin
    showmessage(e.message);
    exit;
  end;
  end;

end;

procedure TFRDEVCON.BTCANDEC1Click(Sender: TObject);
begin
  try
    BTNOVDEC1.Enabled:=true;
    BTALTDEC1.Enabled:=true;
    BTGRADEC1.Enabled:=false;
    BTCANDEC1.Enabled:=false;
    BTEXCDEC1.Enabled:=true;
    if not(DMEST.TRDEVCON.InTransaction) then DMEST.TRDEVCON.StartTransaction;

    DMEST.QUDEC2.cancel;
    RetDadDec2;
  except
    on e:exception do
    begin
      showmessage(e.Message);
      //DMEST.TRDEVCON.Rollback;
    end;
  end;

end;

procedure TFRDEVCON.BTEXCDEC1Click(Sender: TObject);
begin
  if MessageDlg('CONFIRMA A EXCLUSÃO DESTE PRODUTO DA CONSIGNAÇÃO!',mtConfirmation,[mbyes,mbno],0)=mryes then
  begin
    IF not(DMEST.TRDEVCON.InTransaction) then DMEST.TRDEVCON.StartTransaction;
    DMEST.QUDEC2.Delete;
    DMEST.TRDEVCON.Commit;
  end
  else
    exit;

end;

procedure TFRDEVCON.EDNOMCLIKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
    PCDEC.ActivePageIndex:=1;
    KEY:=#0;
  end;
end;

procedure TFRDEVCON.DEQTDDEVExit(Sender: TObject);
begin

  with DMEST.QUVERCOM do
  begin
    close;
    ParamByName('codpro').AsString:=DMEST.QUDEC2.fieldbyname('codpro').AsString;
    ParamByName('codcli').AsString:=DMEST.QUDEC1.fieldbyname('codcli').AsString;
    ParamByName('dtacon').AsString:=DMEST.QUDEC1.fieldbyname('dtacon').AsString;
    ParamByName('numcon').AsString:=DMEST.QUDEC1.fieldbyname('numcon').AsString;
    open;
  end;


   // ShowMessage(DMEST.QUVERCOM.fieldbyname('totpro').AsString);
    if DMEST.QUVERCOM.RecordCount<=0 then
    begin
      showmessage('ESTE PRODUTO NÃO ESTÁ REGISTRADO NAS CONSIGNAÇÕES DO CLIENTE :'+DMCAD.QUSELCLI.fieldbyname('nomcli').AsString);
      DMEST.QUDEC2.FieldByName('qtddev').AsFloat:=0;
      EDCODPRO.SetFocus;
      exit;
    end
    else
    if DMEST.QUDEC2.FieldByName('qtddev').AsFloat > DMEST.QUVERCOM.FieldByName('totpro').AsFloat then
    begin
      showmessage('A QUANTIDADE MÁXIMA PARA DEVOLUÇÃO É:'+DMEST.QUVERCOM.fieldbyname('totpro').AsString);
      DEQTDDEV.SetFocus;
      exit;
    end;
end;

procedure TFRDEVCON.FormCreate(Sender: TObject);
begin
  BTRESCON.Caption:='Resumo Detalhado das'+#13+'Consignações';
end;

procedure TFRDEVCON.BTRESCONClick(Sender: TObject);
begin
  if TFRDETCON=nil then
  FRDETCON:=TFRDETCON.Create(Application);
  FRDETCON.ShowModal;

end;

procedure TFRDEVCON.DEDTADEVKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
    SelectNext(sender as TWinControl, true, true);
    Key:=#0;
  end;

end;

procedure TFRDEVCON.EDCODPROKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
    EDNOMPRO.SetFocus;
    key:=#0;
  end;
end;

procedure TFRDEVCON.EDNOMPROKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
    DEQTDDEV.SetFocus;
    key:=#0;
  end;
end;

procedure TFRDEVCON.DEQTDDEVKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
    BTGRADEC1.SetFocus;
    key:=#0;
  end;

end;

procedure TFRDEVCON.RetDaddec1;
begin
  FRDEVCON.EDNOMCLI.Text:=DMEST.QUDEC1.fieldbyname('nomcli').AsString;
end;

procedure TFRDEVCON.RetDadDec2;
begin
  FRDEVCON.EDCODPRO.Text:=DMEST.QUDEC2.fieldbyname('codpro').AsString;
  FRDEVCON.EDNOMPRO.Text:=DMEST.QUDEC2.fieldbyname('nompro').AsString;
end;

procedure TFRDEVCON.BitBtn1Click(Sender: TObject);
begin
  if FRLOCCLI=nil then
  FRLOCCLI:=TFRLOCCLI.Create(Self);
  FRLOCCLI.ShowModal;
  DMEST.QUDEC1.FieldByName('codcli').AsString:=DMCAD.QUSELCLI.fieldbyname('codcli').AsString;
  EDNOMCLI.Text:=DMCAD.QULOCCLI.fieldbyname('nomcli').AsString;
  EDNOMCLI.SetFocus;
end;

procedure TFRDEVCON.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then
  close;
end;

procedure TFRDEVCON.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if BTSAIDEC.Enabled=false then
  begin
    ShowMessage('ALGUM BOTÃO GRAVAR/CANCELAR ESTÁ PENDENTE!');
    CanClose:=false;
    exit;
  end
  else
  begin
    DMEST.QUDEC1.Close;
    DMEST.QUDEC2.Close;
    DMEST.TRDEVCON.Commit;
    CanClose:=true;
  end;
end;

procedure TFRDEVCON.Imp_ComDev;
VAR
LH,CL:INTEGER;
MCR1,TIPIMP:string;
ACVLR:real;
begin
  RDIMPPED.abrir;            // Inicia a montagem do relatório...
  LH:=13;

//  DMVEN.QUVE2.DisableControls;
  RDIMPPED.impf(03,15,'COMPROVANTE DE DEVOLUÇAO DE CONSIGNAÇAO DE '+ DMEST.qudec1.fieldbyname('dtacon').asstring + ' DO Nº ' + DMEST.qudec1.fieldbyname('numcon').asstring ,[comp12,NEGRITO]);
  RDIMPPED.impf(04,35,'LOJA INSTALADORA',[comp12,negrito]);
  RDIMPPED.impf(05,18,'RUA JOAO BAUER, 155 - CENTRO - ITAJAI/SC - FONE:348-3044',[comp12]);
  RDIMPPED.impf(06,01,'-----------------------------------------------------------------------------------------------',[comp12]);
  RDIMPPED.impf(07,02,'CLIENTE.: '+DMEST.QUDEC1.fieldbyname('codcli').AsString+'/ '+DMEST.QUDEC1.fieldbyname('nomcli').AsString,[comp12]);

  RDIMPPED.impf(08,02,'ENDERECO: '+DMEST.QUDEC1.fieldbyname('endcli').AsString,[comp12]);
  RDIMPPED.impf(08,50,'BAIRRO: '+DMEST.QUDEC1.fieldbyname('baicli').AsString,[comp12]);
  RDIMPPED.impf(08,82,'CEP: '+DMEST.QUDEC1.fieldbyname('cepcli').AsString,[comp12]);
  RDIMPPED.impf(09,02,'CIDADE..: '+DMEST.QUDEC1.fieldbyname('nomcid').AsString,[comp12]);
  RDIMPPED.impf(09,35,'UF: '+DMEST.QUDEC1.fieldbyname('ufcid').AsString,[comp12]);
  RDIMPPED.impf(09,45,'FONE: '+DMEST.QUDEC1.fieldbyname('telcli').AsString,[comp12]);
  RDIMPPED.impf(10,02,'CNPJ\CPF: ',[comp12]);
  RDIMPPED.impf(10,12,DMEST.QUDEC1.fieldbyname('numcpf').AsString,[comp12]);
  RDIMPPED.impf(10,12,DMEST.QUDEC1.fieldbyname('numcnp').AsString,[comp12]);
  RDIMPPED.impf(10,45,'I.E\RG: ',[comp12]);
  RDIMPPED.impf(10,53,DMEST.QUDEC1.fieldbyname('numide').AsString,[comp12]);
  RDIMPPED.impf(10,53,DMEST.QUDEC1.fieldbyname('numies').AsString,[comp12]);
  RDIMPPED.impf(11,01,'--------------------------------------------------------------------------------------------',[comp12]);
  RDIMPPED.impf(12,02,'        PRODUTO                               QTD.DEVOLVIDA       PRECO           TOTAL     ' ,[comp12,NEGRITO]);
  //                       6                                      45    46        61   66       75       83
  DMEST.QUDEC2.First;
  ACVLR:=0;
  while not (DMEST.QUDEC2.eof) do
  begin

    if LH>30 then
    begin
      RDIMPPED.novapagina;
      lh:=3;
    end;
    RDIMPPED.impf(LH,02,DMEST.QUDEC2.fieldbyname('codpro').AsString+'/ '+DMEST.QUDEC2.fieldbyname('nompro').AsString,[comp12]);
    RDIMPPED.impd(LH,55,formatfloat('###,##0.00',DMEST.QUDEC2.fieldbyname('qtddev').AsFloat),[comp12]);
    RDIMPPED.impd(LH,73,formatfloat('###,##0.00',DMEST.QUDEC2.fieldbyname('predev').AsFloat),[comp12]);
    RDIMPPED.impd(LH,90,formatfloat('###,##0.00',DMEST.QUDEC2.fieldbyname('totliq').AsFloat),[comp12]);
    ACVLR := ACVLR + DMEST.QUDEC2.fieldbyname('totliq').AsFloat;

    LH:=LH+1;
    DMEST.QUDEC2.next;
  end;
  LH:=LH+1;
  RDIMPPED.impd(LH,90,'VALOR TOTAL: '+formatfloat('###,##0.00',ACVLR),[comp12]);
  LH:=LH+1;
  RDIMPPED.impF(LH,01,'-----------------------------------------------------------------------------------------------',[comp12]);
  lh:=lh+1;
  RDIMPPED.impF(LH,01,'ATESTO QUE RECEBI OS ITENS ACIMA DESCRITOS Ass:',[comp12]);

  LH:=LH+1;
  RDIMPPED.impf(LH,01,'----------------------------------------------------------------------------------------------- ',[comp12]);

  RDIMPPED.fechar;  // Encerra o relatório...
  //DMREL.QUVE2.EnableControls;
end;

procedure TFRDEVCON.RDIMPPEDNewPage(Sender: TObject; Pagina: Integer);
var
ct,ac:integer;
begin
  RDIMPPED.impF(01,02,'Nrº: '+DMEST.QUDEC1.Fieldbyname('numdec').AsString,[comp12]);    // DADOS DO CLIENTE
  RDIMPPED.impf(01,20,'DATA: '+DMEST.QUDEC1.fieldbyname('dtadec').AsString,[comp12]);
  RDIMPPED.impf(01,40,'ATENDENTE: '+DMEST.QUDEC1.fieldbyname('logusu').AsString,[comp12]);

  RDIMPPED.impf(02,01,'-----------------------------------------------------------------------------------------------',[comp12]);

end;

procedure TFRDEVCON.EDSENUSUExit(Sender: TObject);
begin
  if EDSENUSU.Text<>'' then
  begin
    with DMVEN.QUUSUVEN do
    begin
      Close;
      ParamByName('senusu').value:=EDSENUSU.Text;
      open;
    end;
    DMEST.QUDEC1.FieldByName('codusu').AsString:=DMVEN.QUUSUVEN.fieldbyname('codusu').AsString;
  end;
end;


procedure TFRDEVCON.EDSENUSUKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
    DEDTADEV.SetFocus;
    key:=#0;
  end;

end;

procedure TFRDEVCON.FormShow(Sender: TObject);
begin
  PCDEC.ActivePageIndex:= 0;
  EDSENUSU.Clear;
  EDNOMCLI.Clear;
end;

procedure TFRDEVCON.DENUMCONExit(Sender: TObject);
var
  query1 : TFDQuery;
begin
  if DMEST.QUDEC1.FieldByName('numcon').AsString<>'' then
    DMEST.QUDEC1.fieldbyname('numcon').AsString:= FMFUN.enchezero(DMEST.QUDEC1.fieldbyname('numcon').AsString,6);

  If DMEST.QUDEC1.FieldByName('numcon').AsString = '' then
  begin
    showmessage('o Número da Consignação Deve ser Preenchido!');
  end;

  query1 := TFDQuery.Create(self);
  query1.IB_Connection := DMCAD.CN;
  query1.SQL.add('select ve1.codcli, cli.nomcli from tbve1 ve1 '+
                'left join tbcli cli on ve1.codcli=cli.codcli '+
                'where ve1.numdoc = :numdoc and ve1.dtadoc= :dtadoc');
  query1.ParamByName('numdoc').AsString := DMEST.QUDEC1.fieldbyname('numcon').AsString;
  query1.ParamByName('dtadoc').AsString := DMEST.QUDEC1.fieldbyname('dtacon').AsString;

  query1.Open;

  if query1.RecordCount > 0 then
  begin
    EDNOMCLI.Text := query1.fieldbyname('nomcli').AsString;
    DMEST.QUDEC1.FieldByName('codcli').AsString := query1.fieldbyname('codcli').AsString;
  end
  else
  begin
    showmessage('Não foi Encontrado Cliente Referente a Está Data e Número de Consignação, '+#13+
                'Verifique se Algum Campo não Foi Digitado Errado!');

  end;

end;

procedure TFRDEVCON.DEDTACONExit(Sender: TObject);
begin
  If DMEST.QUDEC1.FieldByName('dtacon').AsString = '' then
  begin
    showmessage('A Data da Consignação Deve ser Preenchida!');
  end;
end;

end.
