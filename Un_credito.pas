unit Un_credito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask,  ExtCtrls, CheckLst,
  sPanel, sBitBtn, sLabel, sCheckBox;

type
  TFr_credito = class(TForm)
    Panel1: tsPanel;
    Label1: tsLabel;
    EdValor: TsCurrencyEdit;
    BitBtn1: TsBitBtn;
    Panel2: tsPanel;
    CL_creditos: TCheckListBox;
    Label2: tsLabel;
    Label3: tsLabel;
    Label4: tsLabel;
    Label5: tsLabel;
    zzcliente: tsLabel;
    procedure CL_creditosClickCheck(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private deps
    clarations }
  public
    { Public declarations }
    procedure MontaCL_credito(c_cliente: String);
  end;

var
  Fr_credito: TFr_credito;

implementation

uses Un_dao, UnFun, Un_veiculos, Un_vendas, UnPri;



{$R *.dfm}

{ TFr_credito }

procedure TFr_credito.MontaCL_credito(c_cliente: String);
var
  mnr_venda_original, mnr_troca, mdata, mvalor:string;
begin
  dao.Geral1('select * from credito where cod_cliente='+QuotedStr(c_cliente)+' and pago='+QuotedStr('N'));
    if dao.q1.RecordCount<1 then
    begin
      showmessage('NÃO EXISTEM CRÉDITOS ABERTOS PARA ESTE CLIENTE!');
      exit;
    end;

    CL_creditos.Clear;
    dao.q1.First;
    while not(dao.Q1.Eof) do
    begin
      mnr_venda_original:='';
      mnr_troca:='';
      mdata:='';
      mvalor:='';
      mnr_venda_original := FMFUN.PreEsp(dao.q1.fieldbyname('nr_venda_original').AsString,15);
      mnr_troca := FMFUN.PreEsp(dao.q1.fieldbyname('nr_documento').AsString,15);
      mdata :=  FMFUN.PreEsp(FormatDateTime('dd/mm/yyyy',dao.q1.fieldbyname('data').AsDateTime),20);
      mvalor := FMFUN.PreEsp(FormatFloat('###,##0.00', dao.q1.fieldbyname('valor').AsFloat),20);
      CL_creditos.Items.Add(' '+mnr_venda_original+' '+ mnr_troca + ' '+ mdata +'   '+mvalor);
      dao.q1.Next;
    end;
   // CL_creditos.SetFocus;




end;

procedure TFr_credito.CL_creditosClickCheck(Sender: TObject);
var
  acvlr:real;
  valor:string;
  i: integer;
begin
  acvlr:=0;
  for I:=0 to (CL_creditos.Items.Count -1) do
  begin
    if CL_creditos.checked[I] then
      begin
        valor := FMFUN.Alltrim(copy(CL_creditos.Items.ValueFromIndex[i],50,17));
        valor := FMFUN.BuscaTroca(valor,'.','');
        acvlr := acvlr + strtofloat(valor);
//        acvlr:= acvlr + StrToFloat(FMFUN.BuscaTroca(valor,',','.'));
      end;
  end;
  Edvalor.Text:=floattostr(acvlr);

end;

procedure TFr_credito.BitBtn1Click(Sender: TObject);
var
  ped:string;
  i: integer;
begin
  if EdValor.Value = 0 then
  begin
    dao.msg('Você deve Marcar algum Crédito para Prosseguir');
    exit;
  end;

  if MessageDlg('ATENÇÃO!! OS CRÉDITOS MARCADOS AQUI NÃO PODERAM MAIS SER UTILIZADOS'+#13+'DESEJA PROSEGUIR',mtConfirmation,[MBYES,MBNO],0) = mryes then
  begin
    if not(dao.cn.InTransaction) then dao.cn.StartTransaction;

    Fr_vendas.Prcredito_usado.Value:= EdValor.Value;

    Fr_vendas.Prtot_liquido.Value:= Fr_vendas.Prtot_liquido.Value - Edvalor.Value;

    for I:=0 to (CL_creditos.Items.Count -1) do
    begin
      if CL_creditos.checked[I] then
      begin
        ped := FMFUN.Alltrim(copy(CL_creditos.Items.ValueFromIndex[i],15,15));
        dao.Execsql('update credito set pago='+QuotedStr('S')+' where nr_documento='+QuotedStr(ped));
      end;
    end;
    close;

  end;

end;

end.
