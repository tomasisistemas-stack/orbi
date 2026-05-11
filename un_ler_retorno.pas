unit un_ler_retorno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ACBrBase, ACBrBoleto, Mask,
  frxClass, sSpeedButton, sPanel, sBitBtn, ACBrBoletoConversao,
  sLabel, sCheckBox, sEdit, sMaskEdit, sCustomComboEdit, sComboEdit;

type
  TfmLerRetornoCobranca = class(TForm)
    Panel1: tsPanel;
    btnLerRetorno: TButton;
    Panel2: tsPanel;
    sbArquivoRetorno: TsSpeedButton;
    edArquivoRetorno: TsEdit;
    lbArquivoRetorno: tsLabel;
    OpenDialog1: TOpenDialog;
    PrCONTA_BOLETO: TsComboEdit;
    lbCCBoleto: tsLabel;
    Label40: tsLabel;
    fR_RELATORIO: TfrxReport;
    ACBrBoleto1: TACBrBoleto;
    procedure sbArquivoRetornoClick(Sender: TObject);
    procedure btnLerRetornoClick(Sender: TObject);
    procedure PrCONTA_BOLETOButtonClick(Sender: TObject);
    procedure PrCONTA_BOLETOExit(Sender: TObject);
    procedure relatorio_cobranca(titulos: string);
    procedure fR_RELATORIOGetValue(const VarName: string;
      var Value: Variant);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    function VerificaSeBaixado(motivo: string): boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmLerRetornoCobranca: TfmLerRetornoCobranca;

implementation

uses Un_localizar, Un_dao, UnPri, Un_dm, Un_splash, UnFun;

{$R *.dfm}

procedure TfmLerRetornoCobranca.sbArquivoRetornoClick(Sender: TObject);
begin
  if OpenDialog1.execute then
    edArquivoRetorno.Text := OpenDialog1.filename;
end;

function TfmLerRetornoCobranca.VerificaSeBaixado(motivo:string):boolean;
begin

Result := fmfun.StrInArray(motivo,
                      ['00-Pago com dinheiro',
                       '00-Por meio magnético',
                       '00-Titulo pago com dinheiro',
                       '03-Liquidação por saldo',
                       '06-Liquidação Normal',
                       '15-Titulo pago com cheque']);
end;

procedure TfmLerRetornoCobranca.btnLerRetornoClick(Sender: TObject);
var
  Titulo: TACBrTitulo;
  x: integer;
  titulos, titulo_boleto, parcela_boleto, sql_pago: string;
begin
  if trim(PrCONTA_BOLETO.Text) = '' then
  begin
    showmessage('Conta Corrente deve ser informado!');
    exit;
  end;

  if trim(edArquivoRetorno.Text) = '' then
  begin
    showmessage('Arquivo de Retorno deve ser informado!');
    exit;
  end;

  ACBrBoleto1.NomeArqRetorno := edArquivoRetorno.Text;
  ACBrBoleto1.LerRetorno;

  fm_splash.ggProgress.MaxValue := ACBrBoleto1.ListadeBoletos.Count;
  fm_splash.lbStatus.Caption := 'Lendo os Dados de Retorno...';
  fm_splash.ggProgress.progress := 0;
  fm_splash.Show;

  try
    if not dao.cn.InTransaction then
      dao.cn.StartTransaction;

    titulos := '';
    for x := 0 to ACBrBoleto1.ListadeBoletos.Count - 1 do
    begin
      Titulo :=  ACBrBoleto1.ListadeBoletos[x];
      with Titulo do
      begin

        if trim(NumeroDocumento) <> '' then
        begin
          titulo_boleto := trim(Copy(NumeroDocumento, 1, Pos('-', NumeroDocumento)-1));
          parcela_boleto := trim(Copy(NumeroDocumento, Pos('-', NumeroDocumento)+1, 10));

          sql_pago := '';
          if (DataCredito <> 0) then
            sql_pago := ' DTAREC = '''+formatdatetime('dd.mm.yyyy', DataCredito)+''', VALOR_RECEBIDO = ' + FMFUN.BuscaTroca(formatfloat('#0.00', ValorRecebido), ',', '.')+',';

          dao.Execsql('UPDATE CR1 '+
                      '   SET '+sql_pago+' BOLETO_RETORNO_CODIGO = ' + QUOTEDSTR(MotivoRejeicaoComando.Text) + ', BOLETO_RETORNO_DESCRICAO = ' + QUOTEDSTR(DescricaoMotivoRejeicaoComando.Text) +
            ' WHERE VALOR = '+ FMFUN.BuscaTroca(formatfloat('#0.00', ValorDocumento), ',', '.')+' and titulo = ' + QuotedStr(titulo_boleto) +
            ' and sequencia = '+parcela_boleto);

          dao.Geral1('select titulo, sequencia from cr1 ' +
            ' WHERE VALOR = '''+ FMFUN.BuscaTroca(formatfloat('#0.00', ValorDocumento), ',', '.')+''' and titulo = ' + QuotedStr(titulo_boleto)  +
            '   and sequencia = ' + parcela_boleto);

          if dao.Q1.fieldbyname('titulo').AsString <> '' then
            titulos := titulos + quotedstr(dao.Q1.fieldbyname('titulo').AsString) + ',';
        end;

      end;
      fm_splash.ggProgress.AddProgress(1);
      fm_splash.Refresh;
    end;

    dao.cn.Commit;
  except
    dao.cn.Rollback;
  end;
  titulos := copy(titulos, 1, length(titulos) - 1);
  fm_splash.hide;
  if titulos <> '' then
    relatorio_cobranca(titulos)
  else
    showmessage('Não há titulos retornados.');  


end;

procedure TfmLerRetornoCobranca.relatorio_cobranca(titulos: string);
var
  cmd, path: string;
begin
  path := ExtractFilePath(Application.ExeName);

  cmd := 'SELECT  a.ID, a.COD_CLIENTE, a.NR_DOCUMENTO, a.TITULO, a.SEQUENCIA,a.COD_EMPRESA, a.DTAVEN, a.VALOR, a.COD_FOP, a.HISTORICO, a.DTAREC, a.BOLETO_RETORNO_CODIGO, a.BOLETO_RETORNO_DESCRICAO, a.VALOR_RECEBIDO, a.SALDO, a.DIAS_ATRASO, '+
         'a.VLR_CORRIGIDO, a.DESCONTO, a.NR_CUPOM, a.CONFERIDO, a.ID_REPRESENTANTE, a.VLR_COMISSAO, a.ID_PLANO_CONTAS, a.SINCRONIZAR_PALM, a.EXTRATO, a.VALOR_CORRIGIDO, a.BOLETO_REMESSA_ORDEM, bc.NR_BANCO, bc.NOM_BANCO, cc.NR_AGENCIA, cc.NR_CONTA, '+
         'cc.CODIGO_CEDENTE, ''CB''||lpad(b.DIA,2,''0'')||lpad(b.MES,2,''0'')||b.ID||''.REM'' AS ARQUIVO, b.data, CL.COD_CLIENTE, CL.NOM_CLIENTE FROM CR1 a left outer join vendas1 v1 on (v1.NUMDOC = a.NR_DOCUMENTO) '+
         'inner join CLIENTE CL on (CL.COD_CLIENTE = a.COD_CLIENTE) LEFT OUTER join CONTA_CORRENTE cc on  (cc.ID = coalesce(a.CONTA_BOLETO, v1.conta_boleto))  inner join banco bc on (cc.ID_BANCO = bc.ID) '+
         'inner join BOLETO_REMESSA_ORDEM b on (b.ID = a.BOLETO_REMESSA_ORDEM and b.CONTA = cc.id) where 1 = 1 ';

  cmd := cmd + ' and coalesce(v1.CONTA_BOLETO, a.CONTA_BOLETO) = ' + PrConta_Boleto.text;

  if trim(titulos) <> '' then
    cmd := cmd + ' and a.titulo in (' + titulos + ')';

  cmd := cmd + ' order by bc.NR_BANCO, b.ID, a.dtaven';
  with Dm.q_cobranca do
  begin
    Close;
    sql.Clear;
    sql.add(cmd);
    open;
  end;

  if Dm.q_cobranca.RecordCount <= 0 then
  begin
    dao.msg('Não foi encontrado Registros para gerar o Relatório');
    exit;
  end;

  if not (fr_relatorio.LoadFromFile(path + 'Relatorios\cobranca.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 +
      'Avise o Suporte');
    exit;
  end;
  fr_relatorio.ShowReport;

end;

procedure TfmLerRetornoCobranca.PrCONTA_BOLETOButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: integer;
  valor_combo: string;
  //variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  //guardar os valores antigos
  //guardar os valores antigos
  chamou_form_old := chamou_form;
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Conta corrente';
  chamou_pesquisa := 'fr_conta_corrente';
  chamou_form := 'fr_cc_ler_retorno';
  chamou_cadastro := 'Fr_conta_corrente';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Conta corrente';
  Fr_localizar.BT_cadastro.Visible := false;

  //preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 5);
  Campos_combo[0] := 'Código';
  Campos_combo[1] := 'Banco';
  Campos_combo[2] := 'Numero da Agencia';
  Campos_combo[3] := 'Numero da Conta';
  Campos_combo[4] := 'Data da abertura da conta';

  for i := 0 to 4 do
  begin
    valor_combo := campos_combo[i];
    Fr_localizar.CBcampos.Items.Add(valor_combo);
  end;
  Fr_localizar.CBcampos.ItemIndex := 1;

  try
    Fr_localizar.ShowModal;
  finally
    Fr_localizar.Free;
  end;

  chamou_form := chamou_form_old;
  chamou_pesquisa := chamou_pesquisa_old;
end;

procedure TfmLerRetornoCobranca.PrCONTA_BOLETOExit(Sender: TObject);
begin
  if trim(prCONTA_BOLETO.Text) = '' then
    lbCCBoleto.Caption := '...'
  else
  begin
    dao.Geral2('select c.id, C.DIAS_PROTESTO, b.NOM_BANCO, b.NR_BANCO, b.LAYOUT_REMESSA, c.nr_conta, c.codigo_cedente, c.nr_agencia, c.dta_abertura_conta, c.convenio, C.NOME_CORRENTISTA, C.CARTEIRA, e.CNPJ, c.tipo_cobranca '+
               'from conta_corrente c inner join banco b on b.ID = c.ID_BANCO inner join empresa e on (e.COD_EMPRESA = c.ID_EMPRESA) ' +
               'where c.id=' + QuotedStr(prCONTA_BOLETO.Text));

    if dao.q2.RecordCount > 0 then
    begin
      lbCCBoleto.Caption := dao.Q2.fieldbyname('nom_banco').AsString + ' - ' + dao.Q2.fieldbyname('nr_agencia').AsString + '/' + dao.Q2.fieldbyname('nr_conta').AsString;
      if dao.Q2.fieldbyname('LAYOUT_REMESSA').AsString = 'c240' then
        ACBrBoleto1.LayoutRemessa := c240
      else
        ACBrBoleto1.LayoutRemessa := c400;
      ACBrBoleto1.Banco.Numero := dao.Q2.fieldbyname('nr_banco').AsInteger;

      case dao.Q2.fieldbyname('nr_banco').AsInteger of
        1:
          begin
            ACBrBoleto1.Banco.TipoCobranca := cobBancoDoBrasil;
            if dao.Q2.fieldbyname('tipo_cobranca').AsString = '1' then
              ACBrBoleto1.Cedente.CaracTitulo := tcSimples;

            if dao.Q2.fieldbyname('tipo_cobranca').AsString = '2' then
              ACBrBoleto1.Cedente.CaracTitulo := tcVinculada;

          end;
        104: ACBrBoleto1.Banco.TipoCobranca := cobCaixaEconomica;
        237: ACBrBoleto1.Banco.TipoCobranca := cobBradesco;
        341: ACBrBoleto1.Banco.TipoCobranca := cobItau;
         87: ACBrBoleto1.Banco.TipoCobranca := cobBradesco;
         33: ACBrBoleto1.Banco.TipoCobranca := cobSantander;
      end;

      ACBrBoleto1.Cedente.Agencia := copy(dao.Q2.fieldbyname('nr_agencia').AsString, 1, pos('-', dao.Q2.fieldbyname('nr_agencia').AsString) - 1);
      ACBrBoleto1.Cedente.AgenciaDigito := copy(dao.Q2.fieldbyname('nr_agencia').AsString, pos('-', dao.Q2.fieldbyname('nr_agencia').AsString) + 1, 2);
      ACBrBoleto1.Cedente.Conta := copy(dao.Q2.fieldbyname('nr_conta').AsString, 1, pos('-', dao.Q2.fieldbyname('nr_conta').AsString) - 1);
      ACBrBoleto1.Cedente.ContaDigito := copy(dao.Q2.fieldbyname('nr_conta').AsString, pos('-', dao.Q2.fieldbyname('nr_conta').AsString) + 1, 2);
      ACBrBoleto1.Cedente.CodigoCedente := dao.Q2.fieldbyname('codigo_cedente').AsString;
      ACBrBoleto1.Cedente.Convenio := dao.Q2.fieldbyname('convenio').AsString;
      ACBrBoleto1.Cedente.Nome := dao.Q2.fieldbyname('NOME_CORRENTISTA').AsString;
      ACBrBoleto1.Cedente.CNPJCPF := dao.Q2.fieldbyname('CNPJ').AsString;

      if dao.Q2.fieldbyname('nr_banco').AsInteger = 87 then
      begin
       { Boleto_Avalista := dao.Q2.fieldbyname('CNPJ').AsString + ' - CNPJ '+dao.Q2.fieldbyname('CNPJ').AsString+' '+dao.Q2.fieldbyname('ENDERECO').AsString+', '+dao.Q2.fieldbyname('NR_ENDERECO').AsString+' - '+dao.Q2.fieldbyname('CEP').AsString+', '+
           dao.Q2.fieldbyname('NOM_CIDADE').AsString+'-'+dao.Q2.fieldbyname('UF').AsString;
        }
        ACBrBoleto1.Cedente.Nome := 'UNICRED LITORAL E NORTE CATARINENSE';
        ACBrBoleto1.Cedente.Logradouro := 'RUA CAMBORIÚ, Nº 519 - CENTRO';
        ACBrBoleto1.Cedente.Bairro := 'CENTRO';
        ACBrBoleto1.Cedente.Cidade := 'ITAJAI';
        ACBrBoleto1.Cedente.UF := 'SC';
        ACBrBoleto1.Cedente.CNPJCPF := '74114042000190';
        ACBrBoleto1.Cedente.CEP := '80301451';
      end;

    end
    else
    begin
      dao.msg('Registro não Encontrado!');
      prCONTA_BOLETO.Text := '';
      prCONTA_BOLETO.SetFocus;
      Exit;
    end;
  end;
end;

procedure TfmLerRetornoCobranca.fR_RELATORIOGetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'empresa' then
    value := nom_empresa;

  if VarName = 'titulo' then
    Value := 'Retorno/Baixa';

  if VarName = 'dtaini' then
    value := FormatDateTime('dd/mm/yyyy', now)
  else if VarName = 'dtafin' then
    value := FormatDateTime('dd/mm/yyyy', now);
end;

procedure TfmLerRetornoCobranca.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end
end;

end.

