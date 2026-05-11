unit Un_credito_fidelidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, JvExExtCtrls, JvComponent, JvgHint,
  JvExControls, JvNavigationPane, JvSticker, StdCtrls, Buttons, CheckLst,
  Mask,  JvExStdCtrls, JvCheckBox, sBitBtn, sLabel, sCheckBox;

type
  TFr_sel_fidelidade = class(TForm)
    Btutilizar_credito: TsBitBtn;
    Edvalor: TsCurrencyEdit;
    Label5: tsLabel;
    Lbpontos: tsLabel;
    Label4: tsLabel;
    zzponto_utilizar: TsCurrencyEdit;
    ZZpontuacao_completa: tsCheckbox;
    Label1: tsLabel;
    Label2: tsLabel;
    Lbnome: tsLabel;
    Label3: tsLabel;
    LbCod: tsLabel;
    procedure FormShow(Sender: TObject);
    procedure Btutilizar_creditoClick(Sender: TObject);
    procedure ClcreditoClickCheck(Sender: TObject);
    procedure zzponto_utilizarEnter(Sender: TObject);
    procedure ZZpontuacao_completaClick(Sender: TObject);
    procedure zzponto_utilizarChange(Sender: TObject);
    procedure zzponto_utilizarExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    numdoc: String;
    valor_ponto: real;

    procedure mostra_creditos(c_cliente: String; nom_cliente: String; nr_documento: String);
  end;

var
  Fr_sel_fidelidade: TFr_sel_fidelidade;

implementation

uses Un_dados_fornecedor, Un_dao, UnFun,  Un_vendas, UnPri;

{$R *.dfm}

{ TFr_credito }

procedure TFr_sel_fidelidade.mostra_creditos(c_cliente: String; nom_cliente : String; nr_documento: String);
var
 num_venda, vlr_credito: string;
begin
  LbCod.Caption := c_cliente;
  Lbnome.Caption:= nom_cliente;

  dao.Geral1('select ponto_fidelidade from cliente where cod_cliente='+QuotedStr(c_cliente));
  Lbpontos.Caption:= dao.Q1.fieldbyname('ponto_fidelidade').AsString;


{  Pacredito.Caption:= '';

  dao.Geral1('select * from credito where cod_cliente='+QuotedStr(c_cliente)+' and pago='+QuotedStr('N'));

  Clcredito.Clear;

  while not(dao.Q1.Eof) do //preenche os creditos no ChekList
  begin
    num_venda := '';
    vlr_credito := '';
    num_venda :=dao.Q1.FieldByName('nr_documento').AsString;
//    vlr_credito :=Format('%9n',[dao.Q1.FieldByName('valor').AsFloat]);
    vlr_credito :=dao.Q1.FieldByName('valor').AsString;
    Clcredito.Items.Add(' '+num_venda+'            '+vlr_credito);
    dao.Q1.Next;
  end;

  dao.Geral2('select sum(valor) as vlr from credito where cod_cliente='+QuotedStr(c_cliente)+' and pago='+QuotedStr('N'));
  LbCod.Caption:=  c_cliente;
  Lbnome.Caption:= nom_cliente;
  Lbcredito.Caption := FormatFloat('###,##0.00',dao.Q2.fieldbyname('vlr').AsFloat);

//  Pacredito.Caption:= 'Cliente: '+ nom_cliente + #13 +  '             Crédito Total: '+FormatFloat('###,##0.00',dao.Q2.fieldbyname('vlr').AsFloat);

 }
end;

procedure TFr_sel_fidelidade.FormShow(Sender: TObject);
begin
  Btutilizar_credito.Caption:= 'Utilizar Créditos'+#13+'Marcados';
  dao.Geral2('select valor_ponto_fidelidade from configuracao');
  valor_ponto := dao.Q2.fieldbyname('valor_ponto_fidelidade').AsFloat;

end;

procedure TFr_sel_fidelidade.Btutilizar_creditoClick(Sender: TObject);
var
  acvlr:real;
  valor:string;
  ponto_convertido: real;
  i: integer;
begin
  if MessageDlg('ATENÇÃO!! OS PONTOS USADOS AQUI NÃO PODERAM MAIS SER UTILIZADOS'+#13+'DESEJA PROSEGUIR',mtConfirmation,[MBYES,MBNO],0) = mryes then
  begin
    acvlr:=0;
    if not(dao.cn.InTransaction) then dao.cn.StartTransaction;

    Fr_vendas.Prponto_usado.Value:= zzponto_utilizar.Value;

    ponto_convertido := zzponto_utilizar.Value * valor_ponto;
    Edvalor.Value := ponto_convertido;

    Fr_vendas.Prtot_liquido.Value:= Fr_vendas.Prtot_liquido.Value - Edvalor.Value;

//    dao.cn.Commit;
    mostra_creditos(LbCod.Caption,Lbnome.Caption,'11');
    close;

  end;


end;

procedure TFr_sel_fidelidade.ClcreditoClickCheck(Sender: TObject);
var
  acvlr:real;
  valor:string;
  i: integer;
begin
{  acvlr:=0;
  for I:=0 to (Clcredito.Items.Count -1) do
  begin
    if Clcredito.checked[I] then
      begin
        valor:= FMFUN.Alltrim(copy(Clcredito.Items.ValueFromIndex[i],15,15));
        acvlr:= acvlr + StrToFloat(valor);
//        acvlr:= acvlr + StrToFloat(FMFUN.BuscaTroca(valor,',','.'));
      end;
  end;
  Edvalor.Text:=floattostr(acvlr);
//  Edvalor.Text:=formatfloat('###,##0.00',acvlr);
//    BTCONFEC.SetFocus;

 }

end;

procedure TFr_sel_fidelidade.zzponto_utilizarEnter(Sender: TObject);
begin
  if ZZpontuacao_completa.Checked then
     ZZpontuacao_completa.SetFocus

end;

procedure TFr_sel_fidelidade.ZZpontuacao_completaClick(Sender: TObject);
begin
  if ZZpontuacao_completa.Checked then
     zzponto_utilizar.Text := lbPontos.caption;
end;

procedure TFr_sel_fidelidade.zzponto_utilizarChange(Sender: TObject);
var
  ponto_convertido: real;
begin
  ponto_convertido := zzponto_utilizar.Value * valor_ponto;
  Edvalor.Value := ponto_convertido;

end;

procedure TFr_sel_fidelidade.zzponto_utilizarExit(Sender: TObject);
begin
  if zzponto_utilizar.Value > StrToFloat(Lbpontos.Caption) then
  begin
    dao.msg('Os Pontos a Utilizar é maior que o Pontos Total');
    zzponto_utilizar.SetFocus;

  end;
end;

end.
