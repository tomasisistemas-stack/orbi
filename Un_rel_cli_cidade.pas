unit Un_rel_cli_cidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids,   StdCtrls, DBCtrls, CheckLst,
  RDprint, Buttons;

type
  TFMCIDREL = class(TForm)
    LKCODUF: TIB_LookupCombo;
    Label1: tsLabel;
    QUUF: TFDQuery;
    DSCODUF: TIB_DataSource;
    LKLBCODUF: TIB_LookupList;
    Button1: TButton;
    QUGERREL: TFDQuery;
    DSQUGERREL: TIB_DataSource;
    LBCID: TCheckListBox;
    BTIMP: TButton;
    QUCLI: TFDQuery;
    DSQUCLI: TIB_DataSource;
    RDCLICID: TRDprint;
    BTTOD: TsBitBtn;
    rb_tod_rep: TRadioButton;
    lkcodrep: TIB_LookupCombo;
    QUREP: TFDQuery;
    DSREP: TIB_DataSource;
    CBRELSIM: tscheckbox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure BTIMPClick(Sender: TObject);
    procedure BTTODClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rb_tod_repClick(Sender: TObject);
    procedure lkcodrepEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMCIDREL: TFMCIDREL;

implementation

uses UnitDmcadpri, UnitDMREL, Un_dao;

{$R *.dfm}

procedure TFMCIDREL.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QUUF.Close;
  QUREP.close;
end;

procedure TFMCIDREL.Button1Click(Sender: TObject);
begin
  With QUGERREL do
  begin
    close;
    sql.Clear;
    sql.add('select uf,nom_cidade from cidade');
    if not rb_tod_rep.Checked then
      sql.Add('where uf=:muf')
    else
      sql.Add('where uf=:muf');

    sql.Add('order by nom_cidade');
    ParamByName('muf').AsString:=QUUF.fieldbyname('uf').AsString;
  end;
  LBCID.Items.Clear;
  QUGERREL.First;
  while not(QUGERREL.Eof) do
  begin
    LBCID.Items.Add(' '+QUGERREL.fieldbyname('nomcid').Value);
    QUGERREL.Next;
  end;
end;

procedure TFMCIDREL.BTIMPClick(Sender: TObject);
var
i,lh:integer;
MNOMCID, cmd:string;
orient: TPrinterOrientation;

begin
  cmd:='select cli.*,cid.nomcid from tacli cli '+
       'left join tacid cid on cid.codcid=cli.codcid ';
  if not rb_tod_rep.Checked then
     cmd:= cmd + 'where codrep = ' + QuotedStr(QUREP.fieldbyname('codrep').AsString);
  cmd:= cmd + ' order by cid.nomcid';

  with qucli do
  begin
    close;
    sql.clear;
    sql.add(cmd);
    open;
  end;

  if CBRELSIM.Checked=false then
  begin

    QUCLI.First;
    RDCLICID.Abrir;
    lh:=2;
    if rb_tod_rep.Checked then
      RDCLICID.ImpC(lh,10,'***RELATORIO COMPLETO DE CLIENTES*** PLASFAN IND E COM DE PLASTICOS',[negrito])
    else
      RDCLICID.ImpC(lh,10,'***RELATORIO COMPLETO DE CLIENTES*** DO REPRESENTANTE: '+lkcodrep.Text + ' PLASFAN IND E COM DE PLASTICOS',[negrito]);

    for i:=0 to (LBCID.Items.count-1) do
    begin
      if LBCID.Checked[i] = true then
      begin
       // showmessage(LBCID.Items.ValueFromIndex[i]);
        MNOMCID:=LBCID.Items.ValueFromIndex[i];
        if QUCLI.Locate('nomcid',MNOMCID,[])  then
        begin
          lh:=lh+1;
          RDCLICID.ImpF(lh,40,'CIDADE...:'+QUCLI.fieldbyname('nomcid').value,[comp12]);
          lh:=lh+2;

          while not(QUCLI.Eof) and (QUCLI.FieldByName('nomcid').Value=MNOMCID) do
          begin
            if lh>85 then
            begin
              RDCLICID.Novapagina;
              lh:=2;
            end;
            if QUCLI.FieldByName('nomcli').Value<>null then
            RDCLICID.ImpF(lh,01,'NOME.....:'+QUCLI.fieldbyname('nomcli').Value,[comp17,negrito]);
            LH:=LH+1;

            if QUCLI.FieldByName('endcli').Value<>null then
            RDCLICID.ImpF(lh,01,'ENDERECO.:'+QUCLI.fieldbyname('ENDCLI').Value,[comp17]);

            if QUCLI.FieldByName('baicli').Value<>null then
            RDCLICID.ImpF(lh,72,'BAIRRO:'+QUCLI.fieldbyname('BAICLI').Value,[comp17]);

            if QUCLI.FieldByName('cepcli').Value<>null then
            RDCLICID.ImpF(lh,100,'CEP......:'+QUCLI.fieldbyname('CEPCLI').Value,[comp17]);
            LH:=LH+1;

            if QUCLI.FieldByName('cnpcli').Value<>null then
            RDCLICID.ImpF(lh,01,'CNPJ......:'+QUCLI.fieldbyname('CNPCLI').Value,[comp17]);

            if QUCLI.FieldByName('iecli').Value<>null then
            RDCLICID.ImpF(lh,32,'IE:'+QUCLI.fieldbyname('IECLI').Value,[comp17]);

            if QUCLI.FieldByName('comcli').Value<>null then
            RDCLICID.ImpF(lh,53,'COMPRADOR:'+QUCLI.fieldbyname('COMCLI').Value,[comp17]);

            if QUCLI.FieldByName('foncli').Value<>null then
            RDCLICID.ImpF(lh,79,'FONE:'+QUCLI.fieldbyname('foncli').Value,[comp17]);

            RDCLICID.ImpF(lh,100,'E-MAIL:'+QUCLI.fieldbyname('emacli').AsString,[comp17]);

            lh:=lh+2;

            QUCLI.Next;
          end;

        end;
      end;
    end;
    RDCLICID.Fechar;
  end;//end do primeiro if

  if CBRELSIM.Checked=true then
  begin
    QUCLI.First;



    RDCLICID.Abrir;
    lh:=2;

    if rb_tod_rep.Checked then
      RDCLICID.ImpC(lh,10,'***RELATORIO COMPLETO DE CLIENTES*** PLASFAN IND E COM DE PLASTICOS',[negrito])
    else
      RDCLICID.ImpC(lh,10,'***RELATORIO COMPLETO DE CLIENTES*** DO REPRESENTANTE: '+lkcodrep.Text + ' PLASFAN IND E COM DE PLASTICOS',[negrito]);

    for i:=0 to (LBCID.Items.count-1) do
    begin
      if LBCID.Checked[i]=true then
      begin
       // showmessage(LBCID.Items.ValueFromIndex[i]);

        MNOMCID:=LBCID.Items.ValueFromIndex[i];
        if QUCLI.Locate('nomcid',MNOMCID,[])  then
        begin
          lh:=lh+1;
          RDCLICID.ImpF(lh,40,'CIDADE...:'+QUCLI.fieldbyname('nomcid').value,[comp12]);
          lh:=lh+1;
          RDCLICID.ImpF(LH,02,'          CODIGO/ CLIENTE                                          FONE                CNPJ    ',[comp17,negrito]);
          lh:=lh+2;

          while not(QUCLI.Eof) and (QUCLI.FieldByName('nomcid').Value=MNOMCID) do
          begin
            if lh>85 then
            begin
              RDCLICID.Novapagina;
              lh:=2;
            end;
            RDCLICID.ImpF(lh,01,QUCLI.fieldbyname('codcli').AsString+'/'+QUCLI.fieldbyname('nomcli').AsString,[comp17]);
            RDCLICID.ImpF(lh,65,QUCLI.fieldbyname('foncli').AsString,[comp17]);
            RDCLICID.ImpF(lh,85,QUCLI.fieldbyname('cnpcli').AsString,[comp17]);
            lh:=lh+1;

            QUCLI.Next;
          end;

        end;
      end;
    end;
    RDCLICID.Fechar;
  end;
end;
procedure TFMCIDREL.BTTODClick(Sender: TObject);
var
I:integer;
begin
  if BTTOD.Caption='MARCAR TODOS' then
    begin
      for I:= 0 to (LBCID.Items.Count - 1) do LBCID.checked[I]:=true;
      BTTOD.Caption:='DESMARCAR TODOS'
    end
  else
    begin
      for I:= 0 to (LBCID.Items.Count - 1) do LBCID.checked[I]:=false;
      BTTOD.Caption:='MARCAR TODOS'
    end;

end;

procedure TFMCIDREL.FormShow(Sender: TObject);
begin
  QUUF.Open;
  QUREP.Open;
  rb_tod_rep.checked:= true;
end;

procedure TFMCIDREL.rb_tod_repClick(Sender: TObject);
begin
  lkcodrep.Text:= '';

end;

procedure TFMCIDREL.lkcodrepEnter(Sender: TObject);
begin
  rb_tod_rep.Checked:= false;
end;

end.
