unit Un_fec_consignacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, Buttons,  CheckLst,
  sPanel, sBitBtn, sLabel, sCheckBox;

type
  TFr_fec_consignacao = class(TForm)
    Panel1: tsPanel;
    Prcod_cliente: TsComboEdit;
    Label11: tsLabel;
    Lbnom_cliente: tsLabel;
    Btvis_consig: TsBitBtn;
    CLconsig: TCheckListBox;
    Panel2: tsPanel;
    Label1: tsLabel;
    EdValor: TsCurrencyEdit;
    BitBtn1: TsBitBtn;
    Panel3: tsPanel;
    Label2: tsLabel;
    Label3: tsLabel;
    Label4: tsLabel;
    Label5: tsLabel;
    Label6: tsLabel;
    Label7: tsLabel;
    Label8: tsLabel;
    Label9: tsLabel;
    procedure Prcod_clienteButtonClick(Sender: TObject);
    procedure Prcod_clienteKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Btvis_consigClick(Sender: TObject);
    procedure CLconsigClickCheck(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Prcod_clienteExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure montar_venda;

  end;

var
  Fr_fec_consignacao: TFr_fec_consignacao;

implementation

uses Un_localizar, UnPri, Un_dao, UnFun,  Un_vendas;

{$R *.dfm}

procedure TFr_fec_consignacao.Prcod_clienteButtonClick(Sender: TObject);
var
  Campos_combo: Array of String;
  i:integer;
  valor_combo:string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old : String;

begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  //guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption:='Localizar Cliente';
  chamou_pesquisa := 'fr_cliente';
  chamou_form := 'fr_fec_consignacao';
  chamou_cadastro := 'Fr_cliente';

  Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Cliente';
  Fr_localizar.BT_cadastro.Visible := true;

  SetLength(Campos_combo,6);
  Campos_combo[0] := 'Codigo';
  Campos_combo[1] := 'Nome';
  Campos_combo[2] := 'CNPJ';
  Campos_combo[3] := 'CPF';
  Campos_combo[4] := 'Cidade';

  for i:=0 to 5 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(campos_combo[i]);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  Fr_localizar.ShowModal;
  Fr_localizar.Free;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;

end;

procedure TFr_fec_consignacao.Prcod_clienteKeyPress(Sender: TObject; var Key: Char);
var
  Campos_combo: Array of String;
  i:integer;
  valor_combo:string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old : String;

begin
  If not( key in['0'..'9',#8] ) and (key <> #13) then
  begin
    beep;{somente delphi 2.0 ou >}
    key:=#0;
  end;


  if key=#13 then
  begin
    if (Prcod_cliente.Text='') then
    begin
      Application.CreateForm(TFr_localizar, Fr_localizar);

      //guardar os valores antigos
      chamou_form_old := chamou_form;
      chamou_pesquisa_old := chamou_pesquisa;

      Fr_localizar.Caption:='Localizar Cliente';
      chamou_pesquisa := 'fr_cliente';
      chamou_form := 'fr_fec_consignacao';
      chamou_cadastro := 'Fr_cliente';

      Fr_localizar.BT_cadastro.Caption:='Cadastro de'+#13+'Cliente';
      Fr_localizar.BT_cadastro.Visible := true;

      SetLength(Campos_combo,6);
      Campos_combo[0] := 'Codigo';
      Campos_combo[1] := 'Nome';
      Campos_combo[2] := 'CNPJ';
      Campos_combo[3] := 'CPF';
      Campos_combo[4] := 'Cidade';

      for i:=0 to 5 do
      begin
        valor_combo := campos_combo[i];
        Fr_localizar.CBcampos.Items.Add(campos_combo[i]);
      end;
      Fr_localizar.CBcampos.ItemIndex := 1;

      Fr_localizar.ShowModal;
      Fr_localizar.Free;

      chamou_form := chamou_form_old;
      chamou_pesquisa := chamou_pesquisa_old;
    end;

    SelectNext(sender as TWinControl, true,true);
    key:=#0;
  end;
end;

procedure TFr_fec_consignacao.FormShow(Sender: TObject);
begin
  Btvis_consig.Caption:= 'Visualizar '+#13+'Consignações';
end;

procedure TFr_fec_consignacao.Btvis_consigClick(Sender: TObject);
var
  x:integer;
  mnompro, mqtdpro, mpreven, mtotliq, mcor, mtamanho:string;
begin
  if Prcod_cliente.Text = '' then
  begin
    dao.msg('Selecione 1 Cliente!');
    exit;
  end;

  dao.Geral1('select v2.cod_produto, v2.numdoc, t.tamanho, c.cor, v2.preco, p.nom_produto, qtd_devolvida, qtd from vendas2 v2 '+
             'left join produto p on p.cod_produto = v2.cod_produto '+
             'left join vendas1 v1 on v1.numdoc=v2.numdoc '+
             'left join tamanho t on t.id=v2.id_tamanho '+
             'left join cores c on c.id = v2.id_cor '+
             'where v2.cod_cliente = '+QuotedStr(Prcod_cliente.Text) +  ' and v1.consignacao = '+QuotedStr('1'));

    if dao.q1.RecordCount<1 then
    begin
      showmessage('NÃO EXISTE CONSIGNAÇÕES ABERTAS PARA ESTE CLIENTE!');
      exit;
    end;

    CLconsig.Clear;
    dao.q1.First;
    while not(dao.Q1.Eof) do
    begin
      mnompro := '';
      mqtdpro := '';
      mpreven := '';
      mtotliq := '';
      mcor := '';
      mtamanho := '';
      mnompro := FMFUN.poePONTOS(FMFUN.enchevazio(dao.q1.fieldbyname('cod_produto').AsString,6)+' - '+ FmFun.enchevazio(dao.q1.fieldbyname('numdoc').AsString,6)+' - '+copy(dao.q1.fieldbyname('nom_produto').AsString,1,26),50);
      mcor :=  FMFUN.PreEsp(dao.q1.fieldbyname('cor').AsString,30);
      mtamanho := FMFUN.PreEsp(dao.q1.fieldbyname('tamanho').AsString,20);
      mqtdpro := Format('%9n',[dao.q1.FieldByName('qtd').AsFloat - dao.q1.FieldByName('qtd_devolvida').AsFloat]);
      mpreven := Format('%9n',[dao.q1.FieldByName('preco').AsFloat]);
      mtotliq := Format('%12n',[dao.q1.FieldByName('preco').AsFloat * strtofloat(FMFUN.BuscaTroca(mqtdpro,'.',''))]);
      if (dao.q1.FieldByName('qtd').AsFloat - dao.q1.FieldByName('qtd_devolvida').AsFloat) > 0 then
         CLconsig.Items.Add(' '+mnompro+' '+ mcor + ' '+ mtamanho +'   '+mqtdpro + '  '+mpreven + '  ' + mtotliq);
      dao.q1.Next;
    end;
  CLconsig.SetFocus




end;

procedure TFr_fec_consignacao.CLconsigClickCheck(Sender: TObject);
var
  acvlr:real;
  valor:string;
  i: integer;
begin
  acvlr:=0;
  for I:=0 to (CLconsig.Items.Count -1) do
  begin
    if CLconsig.checked[I] then
      begin
        valor := FMFUN.Alltrim(copy(CLconsig.Items.ValueFromIndex[i],128,15));
        valor := FMFUN.BuscaTroca(valor,'.','');
        acvlr := acvlr + strtofloat(valor);
//        acvlr:= acvlr + StrToFloat(FMFUN.BuscaTroca(valor,',','.'));
      end;
  end;
  Edvalor.Text:=floattostr(acvlr);
//  Edvalor.Text:=formatfloat('###,##0.00',acvlr);
//    BTCONFEC.SetFocus;

end;

procedure TFr_fec_consignacao.montar_venda;
var
  id, cor, tamanho, id_cor, id_tamanho, cod_produto: string;
  i: integer;
  qtd, num_consig, cod_prod : String;
begin
  mform:= 'fechamento_consig';
  if not(dao.cn.InTransaction) then (dao.cn.StartTransaction);

  dao.Execsql('insert into vendas1 ( dtadoc, cod_empresa, cod_cliente, orcamento, consignacao, tot_bruto, tot_liquido, cod_fop, qtd_parcelas, prazo_pgto) values ( '+
              quotedstr(FormatDateTime('dd.mm.yyyy', dao.DtaSerDt))+','+QuotedStr(cod_empresa)+','+QuotedStr(Prcod_cliente.Text)+','+'0'+','+'2'+
              ','+QuotedStr(FMFUN.prepara_valor(EdValor.Text))+','+QuotedStr(FMFUN.prepara_valor(EdValor.Text))+','+QuotedStr('1')+','+QuotedStr('1')+','+QuotedStr('00/  /   /   /   /   /   /   ')+')');

  dao.Geral1('select nextval(''gen_venda1'') as gen_id from configuracao');
  id := dao.Q1.fieldbyname('gen_id').AsString;
  numped := id;
  for i := 0 to CLconsig.Items.Count - 1 do
  begin
    if CLconsig.checked[I] then
    begin
      cod_produto := copy(CLconsig.Items.ValueFromIndex[i],2,6);
      if cod_produto <> '' then
         dao.Geral3('select grade from produto where cod_produto = '+QuotedStr(trim(cod_produto)));

      if dao.Q3.FieldByName('grade').AsString = '0' then
      begin
        //descobre o id_cor
        cor := copy(CLconsig.Items.ValueFromIndex[i],51,33);
        tamanho :=  copy(CLconsig.Items.ValueFromIndex[i],75,25);

        dao.Geral1('select * from cores where cor = '+QuotedStr(Trim(cor)));
        id_cor := dao.Q1.fieldbyname('id').AsString;

        dao.Geral1('select * from tamanho where tamanho = '+QuotedStr(Trim(tamanho)));
        id_tamanho := dao.Q1.fieldbyname('id').AsString;

        //zera a qtd devolvida no vendas2
        qtd := trim(copy(CLconsig.Items.ValueFromIndex[i],112,10));
        num_consig := trim(copy(CLconsig.Items.ValueFromIndex[i],10,7));
        cod_prod := trim(copy(CLconsig.Items.ValueFromIndex[i],1,7));

        dao.Execsql('update vendas2 set qtd_devolvida=qtd_devolvida + '+ FMFUN.prepara_valor(qtd) +' where numdoc='+quotedStr(num_consig)+
        ' and cod_cliente='+quotedStr(Prcod_cliente.Text)+' and cod_produto='+quotedStr(cod_prod)+' and id_cor='+ QuotedStr(id_cor)+
        ' and id_tamanho='+ QuotedStr(id_tamanho));


        dao.Execsql('insert into vendas2 (numdoc, cod_cliente, cod_produto, id_cor, id_tamanho, qtd, preco, sub_total, preco_bruto, sub_total_bruto) values ('+
                    QuotedStr(id)+','+QuotedStr(Prcod_cliente.Text)+','+QuotedStr(trim(copy(CLconsig.Items.ValueFromIndex[i],2,6)))+','+
                    QuotedStr(trim(id_cor))+','+QuotedStr(trim(id_tamanho))+','+QuotedStr(FMFUN.prepara_valor(trim(copy(CLconsig.Items.ValueFromIndex[i],112,11))))+','+ QuotedStr(FMFUN.prepara_valor(FMFUN.BuscaTroca(trim(copy(CLconsig.Items.ValueFromIndex[i],117,14)),'.','')))+','+ QuotedStr(FMFUN.prepara_valor(FMFUN.BuscaTroca(trim(copy(CLconsig.Items.ValueFromIndex[i],129,20)),'.','')))+
                    ','+ QuotedStr(FMFUN.prepara_valor(FMFUN.BuscaTroca(trim(copy(CLconsig.Items.ValueFromIndex[i],117,14)),'.','')))+','+ QuotedStr(FMFUN.prepara_valor(FMFUN.BuscaTroca(trim(copy(CLconsig.Items.ValueFromIndex[i],129,20)),'.','')))+')');
      end                                                                         //qtd                                                             //preco                                                                     //sub_total
      else
      begin
        qtd := trim(copy(CLconsig.Items.ValueFromIndex[i],112,10));
        num_consig := trim(copy(CLconsig.Items.ValueFromIndex[i],10,7));
        cod_prod := trim(copy(CLconsig.Items.ValueFromIndex[i],1,7));
        dao.Execsql('update vendas2 set qtd_devolvida=qtd_devolvida + '+ FMFUN.prepara_valor(qtd) +' where numdoc='+quotedStr(num_consig)+' and cod_cliente='+quotedStr(Prcod_cliente.Text)+' and cod_produto='+quotedStr(cod_prod));

        dao.Execsql('insert into vendas2 (numdoc, cod_cliente, cod_produto, qtd, preco, sub_total, preco_bruto, sub_total_bruto) values ('+
                    QuotedStr(id)+','+QuotedStr(Prcod_cliente.Text)+','+QuotedStr(trim(copy(CLconsig.Items.ValueFromIndex[i],2,6)))+','+
                    QuotedStr(FMFUN.prepara_valor(trim(copy(CLconsig.Items.ValueFromIndex[i],112,11))))+','+ QuotedStr(FMFUN.prepara_valor(FMFUN.BuscaTroca(trim(copy(CLconsig.Items.ValueFromIndex[i],117,14)),'.','')))+','+ QuotedStr(FMFUN.prepara_valor(FMFUN.BuscaTroca(trim(copy(CLconsig.Items.ValueFromIndex[i],129,20)),'.','')))+
                    ','+ QuotedStr(FMFUN.prepara_valor(FMFUN.BuscaTroca(trim(copy(CLconsig.Items.ValueFromIndex[i],117,14)),'.','')))+','+ QuotedStr(FMFUN.prepara_valor(FMFUN.BuscaTroca(trim(copy(CLconsig.Items.ValueFromIndex[i],129,20)),'.','')))+')');
      end;
    end;

  end;
  dao.cn.Commit;
  Fr_fec_consignacao.Close;
  Application.CreateForm(TFr_vendas, Fr_vendas);
//  Fr_vendas.ativa_venda1(id);
//  Fr_vendas.ativa_venda2(id);
//  Fr_vendas.monta_sgx;
//  Fr_vendas.mostra_campos('Pr');
//  Fr_vendas.mostra_sgx(id);
  Fr_vendas.ShowModal;


end;

procedure TFr_fec_consignacao.BitBtn1Click(Sender: TObject);
var
  i,j : integer;
begin
  j := 0;
  for i := 0 to CLconsig.Items.Count - 1 do
  begin
    if CLconsig.Checked[i] then
      j := j + 1;
  end;
  if j <= 0 then
  begin
    dao.msg('Deve ser Marcado ao Menos 1 Item para Faturar!');
    exit;
  end;

  if MessageDlg('Deseja Faturar os Itens Marcados?'+#13+'Atenção - Os Itens Marcados e Faturados não poderão voltar a forma de consignação!',mtConfirmation, [mbYes, mbNo],0) = mryes then
  begin
    montar_venda;
  end;

end;

procedure TFr_fec_consignacao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
     close;
end;

procedure TFr_fec_consignacao.Prcod_clienteExit(Sender: TObject);
begin
  if trim(Prcod_cliente.Text) = '' then
     LBnom_cliente.Caption:= '...';

  if Prcod_cliente.Text <> '' then
  begin
    dao.Geral2('select nom_cliente from cliente where cod_cliente='+QuotedStr(Prcod_cliente.Text));
    if dao.q2.RecordCount > 0 then
    begin
      LBnom_cliente.Caption := dao.Q2.fieldbyname('nom_cliente').AsString;
    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      Prcod_cliente.Text:= '';
      Prcod_cliente.SetFocus;
      Exit;
    end;

  end;

end;

end.
