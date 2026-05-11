unit un_remessa_boleto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, sPanel, StdCtrls, Buttons, sBitBtn, Mask,
  sLabel, sCheckBox, Grids, DBGrids, DB, RxMemDS, ACBrBoleto,
  ACBrBase, DBCtrls, DateUtils, frxClass, acDBGrid, ACBrBoletoConversao,
  sMaskEdit, sCustomComboEdit, sComboEdit, sCurrEdit, sCurrencyEdit,
  ACBrBoletoFCFR, sBevel;

type
  Tfrm_remessa_boleto = class(TForm)
    sPanel1: TsPanel;
    sPanel2: TsPanel;
    btInserir: TsBitBtn;
    BtSalvar: TsBitBtn;
    sPanel3: TsPanel;
    BtBuscar: TsBitBtn;
    Lbl_produto: TsLabel;
    PrID: TsComboEdit;
    PrCONTA: TsComboEdit;
    Label40: TsLabel;
    lbCCBoleto: TsLabel;
    CheckTodos: TsCheckBox;
    lbTotalNFs: TsLabel;
    DBCheckBox1: TDBCheckBox;
    mmItens: TRxMemoryData;
    mmItensID: TIntegerField;
    mmItensTITULO: TStringField;
    mmItensSEQUENCIA: TIntegerField;
    mmItensNOM_CLIENTE: TStringField;
    mmItensDTAVEN: TDateField;
    mmItensVALOR: TCurrencyField;
    mmItensCheck: TBooleanField;
    dsItens: TDataSource;
    lbData: TsLabel;
    BtCancelar: TsBitBtn;
    mmItensCOD_CLIENTE: TStringField;
    mmItensTIPO_PESSOA: TStringField;
    mmItensCNPJ: TStringField;
    mmItensCPF: TStringField;
    mmItensENDERECO: TStringField;
    mmItensNR_ENDERECO: TStringField;
    mmItensBAIRRO: TStringField;
    mmItensNOM_CIDADE: TStringField;
    mmItensUF: TStringField;
    mmItensCEP: TStringField;
    mmItensISENTO: TIntegerField;
    fR_RELATORIO: TfrxReport;
    BtImprimir: TsBitBtn;
    mmItensNR_DOCUMENTO: TIntegerField;
    BtBoleto: TsBitBtn;
    dgItens: Tdbgrid;
    BtGerarArquivo: TsBitBtn;
    mmItensINSTRUCAO_BOLETO: TStringField;
    mmItensDESCONTADA: TBooleanField;
    DBCheckBox2: TDBCheckBox;
    Panel1: TPanel;
    sStickyLabel1: TsStickyLabel;
    sBevel1: TsBevel;
    lbtotal: TsLabel;
    sLabel1: TsLabel;
    SaveDialog1: TSaveDialog;
    procedure MontaArquivoCobrancaEnvio;
    procedure relatorio_cobranca;
    procedure PrCONTAExit(Sender: TObject);
    procedure CarregaItens(ordem: string);
    procedure CarregaRemessa;
    procedure PrIDExit(Sender: TObject);
    procedure PrCONTAButtonClick(Sender: TObject);
    procedure PrIDButtonClick(Sender: TObject);
    procedure BtBuscarClick(Sender: TObject);
    procedure btInserirClick(Sender: TObject);
    procedure dgItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtSalvarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtImprimirClick(Sender: TObject);
    procedure CheckTodosClick(Sender: TObject);
    procedure fR_RELATORIOGetValue(const VarName: string; var Value: Variant);
    procedure BtBoletoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtGerarArquivoClick(Sender: TObject);
    procedure dgItensTitleClick(Column: TColumn);
    procedure dgItensCellClick(Column: TColumn);
  private
    remessa_arquivo: string;
    procedure SetarBoletos(listaboletos: string);
    procedure SetaBoletosDescontados(listaboletos: string; descontar: boolean);
    procedure ChecarDataVencida;

    { Private declarations }
  public
    { Public declarations }
    modo_insert: boolean;
    totalselecionados: Integer;
    impressao_boleto : Boolean;
  end;

var
  frm_remessa_boleto: Tfrm_remessa_boleto;
  carteira_conta: string;
  dias_protesto, dias_baixa: Integer;
  Boleto_Avalista: string;
  tem_data_vcto_vencida: boolean;
  mensagem_padrao : string;
implementation

uses Un_dao, Un_localizar, unpri, UnFun, Un_dm;

{$R *.dfm}

procedure Tfrm_remessa_boleto.CarregaRemessa;
var
  cmd: string;
begin
  cmd := '';
  cmd := ' SELECT a.ID, a.DIA, a.MES, a.ANO, a.DATA, a.CONTA FROM BOLETO_REMESSA_ORDEM a WHERE A.ID = '
    + PrID.text + ' AND A.CONTA = ' + PrCONTA.text;
  dao.Geral2(cmd);
  PrCONTA.text := dao.Q2.fieldbyname('CONTA').AsString;
  lbData.Caption := formatdatetime('dd/mm/yyyy', dao.Q2.fieldbyname('DATA').AsDateTime);
  BtSalvar.Enabled := formatdatetime('dd/mm/yyyy', dao.Q2.fieldbyname('DATA').AsDateTime) = formatdatetime('dd/mm/yyyy', now);

  PrCONTAExit(self);
  CarregaItens('ORDER BY TITULO, SEQUENCIA');
end;

procedure Tfrm_remessa_boleto.CarregaItens(ordem: string);
var
  cmd, cmd_conta, cmd_remessa: string;
  total: real;
begin
  Screen.Cursor := crSQLWait;

  cmd_conta := ' 1 = 1  ';

  if PrID.text <> '' then
    cmd_remessa := ' and coalesce(a.CONTA_BOLETO, v1.conta_boleto) = ' +
      PrCONTA.text + ' and a.BOLETO_REMESSA_ORDEM = ' + PrID.text
  else
    cmd_remessa := ' and a.BOLETO_REMESSA_ORDEM = 0 ';

  if PrCONTA.text <> '' then
    cmd_conta := '   coalesce(a.CONTA_BOLETO, v1.conta_boleto) = ' +
      PrCONTA.text;

  if PrID.text = '' then
    cmd_conta := cmd_conta + ' and A.DTAVEN > CURRENT_DATE ';

  cmd := '';
  cmd := ' select * ' + ' from ' + ' ( ' +
    '   select a.ID, a.COD_CLIENTE, a.NR_DOCUMENTO, a.TITULO, ' +
    '   a.SEQUENCIA, a.COD_EMPRESA, a.DTAVEN, a.VALOR, a.COD_FOP, a.Instrucao_boleto, '
    + '   a.HISTORICO, a.DTAREC, a.VALOR_RECEBIDO, a.SALDO, a.DIAS_ATRASO, ' +
    '   a.VLR_CORRIGIDO, a.DESCONTO, a.NR_CUPOM, a.CONFERIDO, a.ID_REPRESENTANTE, '
    + '   a.VLR_COMISSAO, a.ID_PLANO_CONTAS, a.SINCRONIZAR_PALM, a.EXTRATO, ' +
    '   a.VALOR_CORRIGIDO, a.BOLETO_REMESSA_ORDEM, a.BOLETO_RETORNO_CODIGO, a.CONTA_BOLETO, '
    + '   a.BOLETO_RETORNO_DESCRICAO, c.nom_cliente, C.TIP_PESSOA, C.CNPJ, C.CPF, C.ENDERECO, A.DESCONTADA, '
    + '   C.NR_ENDERECO, C.BAIRRO, CD.NOM_CIDADE, CD.UF, C.CEP, CASE WHEN C.IE IS NULL THEN 1 ELSE 0 END AS ISENTO  '
    + '   from cr1 a ' +
    '   left join cliente c on c.cod_cliente = a.cod_cliente ' +
    '   inner join cidades cd on (cd.COD_CIDADE = C.COD_CIDADE) ' +
    '   left outer join vendas1 v1 on (v1.NUMDOC = a.NR_DOCUMENTO) ' +
    '   where ' + cmd_conta + ' and ' + '   a.DTAREC is null and ' +
    '   a.BOLETO_REMESSA_ORDEM is null ' + '   union ' +
    '   select a.ID, a.COD_CLIENTE, a.NR_DOCUMENTO, a.TITULO, ' +
    '   a.SEQUENCIA, a.COD_EMPRESA, a.DTAVEN, a.VALOR, a.COD_FOP, a.Instrucao_boleto, '
    + '   a.HISTORICO, a.DTAREC, a.VALOR_RECEBIDO, a.SALDO, a.DIAS_ATRASO, ' +
    '   a.VLR_CORRIGIDO, a.DESCONTO, a.NR_CUPOM, a.CONFERIDO, a.ID_REPRESENTANTE, '
    + '   a.VLR_COMISSAO, a.ID_PLANO_CONTAS, a.SINCRONIZAR_PALM, a.EXTRATO, ' +
    '   a.VALOR_CORRIGIDO, a.BOLETO_REMESSA_ORDEM, a.BOLETO_RETORNO_CODIGO, a.CONTA_BOLETO, '
    + '   a.BOLETO_RETORNO_DESCRICAO, c.nom_cliente, C.TIP_PESSOA, C.CNPJ, C.CPF, C.ENDERECO, A.DESCONTADA, '
    + '   C.NR_ENDERECO, C.BAIRRO, CD.NOM_CIDADE, CD.UF, C.CEP, CASE WHEN C.IE IS NULL THEN 1 ELSE 0 END AS ISENTO  '
    + '   from cr1 a ' +
    '   left join cliente c on c.cod_cliente = a.cod_cliente ' +
    '   inner join cidades cd on (cd.COD_CIDADE = C.COD_CIDADE) ' +
    '   left outer join vendas1 v1 on (v1.NUMDOC = a.NR_DOCUMENTO) ' +
    '   where ' + ' A.DTAVEN > CURRENT_DATE and a.DTAREC is null ' + cmd_remessa
    + '   ) q1 ' + ordem;

  dao.Geral1(cmd);
  dao.Q1.First;
  tem_data_vcto_vencida := false;
  mmItens.DisableControls;
  mmItens.Close;
  mmItens.EmptyTable;
  mmItens.Open;
  totalselecionados := 0;
  total := 0;
  while not dao.Q1.Eof do
  begin
    mmItens.Append;
    mmItensID.AsString := dao.Q1.fieldbyname('id').AsString;
    mmItensNR_DOCUMENTO.AsString := dao.Q1.fieldbyname('NR_DOCUMENTO').AsString;
    mmItensTITULO.AsString := dao.Q1.fieldbyname('titulo').AsString;
    mmItensSEQUENCIA.AsString := dao.Q1.fieldbyname('sequencia').AsString;
    mmItensCOD_CLIENTE.AsString := dao.Q1.fieldbyname('COD_CLIENTE').AsString;
    mmItensNOM_CLIENTE.AsString := dao.Q1.fieldbyname('nom_cliente').AsString;
    mmItensCOD_CLIENTE.AsString := dao.Q1.fieldbyname('cod_cliente').AsString;
    mmItensTIPO_PESSOA.AsString := dao.Q1.fieldbyname('tip_pessoa').AsString;
    mmItensCNPJ.AsString := dao.Q1.fieldbyname('cnpj').AsString;
    mmItensCPF.AsString := dao.Q1.fieldbyname('cpf').AsString;
    mmItensENDERECO.AsString := dao.Q1.fieldbyname('endereco').AsString;
    mmItensNR_ENDERECO.AsString := dao.Q1.fieldbyname('nr_endereco').AsString;
    mmItensBAIRRO.AsString := dao.Q1.fieldbyname('bairro').AsString;
    mmItensNOM_CIDADE.AsString := dao.Q1.fieldbyname('nom_cidade').AsString;
    mmItensUF.AsString := dao.Q1.fieldbyname('uf').AsString;
    mmItensCEP.AsString := dao.Q1.fieldbyname('cep').AsString;
    mmItensDTAVEN.AsString := dao.Q1.fieldbyname('dtaven').AsString;
    mmItensVALOR.AsString := dao.Q1.fieldbyname('valor').AsString;
    mmItensISENTO.AsInteger := dao.Q1.fieldbyname('ISENTO').AsInteger;
    mmItensDESCONTADA.Value := dao.Q1.fieldbyname('DESCONTADA').AsString = '1';

    if impressao_boleto then
      mmItensINSTRUCAO_BOLETO.AsString := dao.Q1.fieldbyname('INSTRUCAO_BOLETO').AsString+#13+mensagem_padrao
    else
      mmItensINSTRUCAO_BOLETO.AsString := dao.Q1.fieldbyname('INSTRUCAO_BOLETO').AsString;

    if not dao.Q1.fieldbyname('BOLETO_REMESSA_ORDEM').IsNull then
    begin
      mmItensCheck.Value := true;
      totalselecionados := totalselecionados + 1;
    end
    else
      mmItensCheck.Value := false;

    total := total + dao.Q1.fieldbyname('valor').Asfloat;

    mmItens.Post;

    dao.Q1.Next;
  end;
  mmItens.First;
  mmItens.EnableControls;
  lbTotalNFs.Caption := 'Boletos Relacionados: ' + inttostr(totalselecionados);
  lbtotal.Caption := formatfloat('R$ #,###,##0.00', total);

end;

procedure Tfrm_remessa_boleto.PrCONTAExit(Sender: TObject);
begin
  if trim(PrCONTA.text) = '' then
    lbCCBoleto.Caption := '...'
  else
  begin
    dao.Geral2
      ('select c.id, e.cod_empresa, C.DIAS_PROTESTO, c.DIAS_BAIXAR, b.NOM_BANCO, b.NR_BANCO, c.mensagem_padrao, '
      + 'b.LAYOUT_REMESSA, c.nr_conta, c.codigo_cedente, c.nr_agencia, c.dta_abertura_conta, '
      + 'c.convenio, COALESCE(C.NOME_CORRENTISTA, E.NOM_EMPRESA) AS NOME_CORRENTISTA, C.CARTEIRA, e.CNPJ, e.ENDERECO, e.NR_ENDERECO, '
      + 'e.CEP, cd.NOM_CIDADE, cd.UF, c.tipo_cobranca, c.codigo_transmissao, C.MODALIDADE ' +
      'from conta_corrente c ' + 'inner join banco b on b.ID = c.ID_BANCO ' +
      'inner join empresa e on (e.COD_EMPRESA = c.ID_EMPRESA) ' +
      'inner join cidades cd on cd.COD_CIDADE = e.COD_CIDADE ' + 'where c.id=' +
      QuotedStr(PrCONTA.text));
    if dao.Q2.RecordCount > 0 then
    begin
      lbCCBoleto.Caption := dao.Q2.fieldbyname('nom_banco').AsString + ' - ' +
        dao.Q2.fieldbyname('nr_agencia').AsString + '/' +
        dao.Q2.fieldbyname('nr_conta').AsString;
      if dao.Q2.fieldbyname('LAYOUT_REMESSA').AsString = 'c240' then
        fmfun.ACBrBoleto1.LayoutRemessa := c240
      else
        fmfun.ACBrBoleto1.LayoutRemessa := c400;

      case dao.Q2.fieldbyname('nr_banco').AsInteger of
        1:
          begin
            fmfun.ACBrBoleto1.Banco.TipoCobranca := cobBancoDoBrasil;
            if dao.Q2.fieldbyname('tipo_cobranca').AsString = '1' then
              fmfun.ACBrBoleto1.Cedente.CaracTitulo := tcSimples;

            if dao.Q2.fieldbyname('tipo_cobranca').AsString = '2' then
              fmfun.ACBrBoleto1.Cedente.CaracTitulo := tcVinculada;

            if dao.Q2.fieldbyname('tipo_cobranca').AsString = '3' then
              fmfun.ACBrBoleto1.Cedente.CaracTitulo := tcDescontada;

            fmfun.ACBrBoleto1.Cedente.TipoCarteira := tctRegistrada;

            fmfun.ACBrBoleto1.Cedente.Modalidade :=  dao.Q2.fieldbyname('MODALIDADE').AsString;
          end;
        104:
          fmfun.ACBrBoleto1.Banco.TipoCobranca := cobCaixaEconomica;
        237:
          fmfun.ACBrBoleto1.Banco.TipoCobranca := cobBradesco;
        341:
          fmfun.ACBrBoleto1.Banco.TipoCobranca := cobItau;
        87:
          fmfun.ACBrBoleto1.Banco.TipoCobranca := cobBradesco;
        756:
          begin
            fmfun.ACBrBoleto1.Banco.TipoCobranca := cobBancoob;
            if dao.Q2.fieldbyname('tipo_cobranca').AsString = '1' then
              fmfun.ACBrBoleto1.Cedente.CaracTitulo := tcSimples;

            if dao.Q2.fieldbyname('tipo_cobranca').AsString = '2' then
              fmfun.ACBrBoleto1.Cedente.CaracTitulo := tcVinculada;

            if dao.Q2.fieldbyname('tipo_cobranca').AsString = '3' then
              fmfun.ACBrBoleto1.Cedente.CaracTitulo := tcDescontada;

            fmfun.ACBrBoleto1.Cedente.Modalidade := '01';
          end;
        33:
          begin
            fmfun.ACBrBoleto1.Banco.TipoCobranca := cobSantander;
            if dao.Q2.fieldbyname('tipo_cobranca').AsString = '1' then
              fmfun.ACBrBoleto1.Cedente.CaracTitulo := tcSimples;

            if dao.Q2.fieldbyname('tipo_cobranca').AsString = '2' then
              fmfun.ACBrBoleto1.Cedente.CaracTitulo := tcVinculada;

            if dao.Q2.fieldbyname('tipo_cobranca').AsString = '3' then
              fmfun.ACBrBoleto1.Cedente.CaracTitulo := tcDescontada;
          end;
        41:
          fmfun.ACBrBoleto1.Banco.TipoCobranca := cobBanrisul;

        85:
          fmfun.ACBrBoleto1.Banco.TipoCobranca := cobBancoCECRED;

      end;

      if pos('-', dao.Q2.fieldbyname('nr_agencia').AsString) > 0 then
      begin
        fmfun.ACBrBoleto1.Cedente.Agencia := copy(dao.Q2.fieldbyname('nr_agencia').AsString, 1, pos('-', dao.Q2.fieldbyname('nr_agencia').AsString) - 1);
        fmfun.ACBrBoleto1.Cedente.AgenciaDigito := copy(dao.Q2.fieldbyname('nr_agencia').AsString, pos('-', dao.Q2.fieldbyname('nr_agencia').AsString) + 1, 2);
      end
      else
        fmfun.ACBrBoleto1.Cedente.Agencia := dao.Q2.fieldbyname('nr_agencia').AsString;


      fmfun.ACBrBoleto1.Cedente.Conta := copy(dao.Q2.fieldbyname('nr_conta').AsString,
        1, pos('-', dao.Q2.fieldbyname('nr_conta').AsString) - 1);
      fmfun.ACBrBoleto1.Cedente.ContaDigito :=
        copy(dao.Q2.fieldbyname('nr_conta').AsString,
        pos('-', dao.Q2.fieldbyname('nr_conta').AsString) + 1, 2);
      fmfun.ACBrBoleto1.Cedente.CodigoCedente :=
        dao.Q2.fieldbyname('codigo_cedente').AsString;
      fmfun.ACBrBoleto1.Cedente.Convenio := dao.Q2.fieldbyname('convenio').AsString;
      fmfun.ACBrBoleto1.Cedente.Nome :=
        dao.Q2.fieldbyname('NOME_CORRENTISTA').AsString;
      fmfun.ACBrBoleto1.Cedente.Logradouro := dao.Q2.fieldbyname('ENDERECO').AsString;
      fmfun.ACBrBoleto1.Cedente.NumeroRes :=
        dao.Q2.fieldbyname('NR_ENDERECO').AsString;
      fmfun.ACBrBoleto1.Cedente.Cidade := dao.Q2.fieldbyname('NOM_CIDADE').AsString;
      fmfun.ACBrBoleto1.Cedente.UF := dao.Q2.fieldbyname('UF').AsString;

      dias_protesto := dao.Q2.fieldbyname('DIAS_PROTESTO').AsInteger;
      dias_baixa := dao.Q2.fieldbyname('DIAS_BAIXAR').AsInteger;
      carteira_conta := dao.Q2.fieldbyname('CARTEIRA').AsString;
      fmfun.ACBrBoleto1.Cedente.CNPJCPF := dao.Q2.fieldbyname('CNPJ').AsString;

      if dao.Q2.fieldbyname('nr_banco').AsInteger = 33 then
      begin
        fmfun.ACBrBoleto1.Cedente.CodigoTransmissao :=
          dao.Q2.fieldbyname('codigo_transmissao').AsString;
        fmfun.ACBrBoleto1.Cedente.Modalidade := carteira_conta;
      end;

      if dao.Q2.fieldbyname('nr_banco').AsInteger = 87 then
      begin
        Boleto_Avalista := dao.Q2.fieldbyname('CNPJ').AsString + ' - CNPJ ' +
          dao.Q2.fieldbyname('CNPJ').AsString + ' ' +
          dao.Q2.fieldbyname('ENDERECO').AsString + ', ' +
          dao.Q2.fieldbyname('NR_ENDERECO').AsString + ' - ' +
          dao.Q2.fieldbyname('CEP').AsString + ', ' +
          dao.Q2.fieldbyname('NOM_CIDADE').AsString + '-' +
          dao.Q2.fieldbyname('UF').AsString;

        fmfun.ACBrBoleto1.Cedente.Nome := 'UNICRED LITORAL E NORTE CATARINENSE';
        fmfun.ACBrBoleto1.Cedente.Logradouro := 'RUA CAMBORIÚ, Nº 519 - CENTRO';
        fmfun.ACBrBoleto1.Cedente.Bairro := 'CENTRO';
        fmfun.ACBrBoleto1.Cedente.Cidade := 'ITAJAI';
        fmfun.ACBrBoleto1.Cedente.UF := 'SC';
        fmfun.ACBrBoleto1.Cedente.CNPJCPF := '74114042000190';
        fmfun.ACBrBoleto1.Cedente.CEP := '80301451';
      end;
      mensagem_padrao := dao.Q2.fieldbyname('mensagem_padrao').AsString;
      CarregaItens('order by titulo, sequencia');
      BtGerarArquivo.enabled := fmfun.ACBrBoleto1.Cedente.Agencia <> '';
    end
    else // 4456324
    begin
      dao.msg('Registro não Encontrado!');
      PrCONTA.text := '';
      PrCONTA.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfrm_remessa_boleto.PrIDExit(Sender: TObject);
begin

  if trim(PrID.text) = '' then
    Exit;
  if trim(PrCONTA.text) = '' then
    Exit;

  CarregaRemessa;

  BtGerarArquivo.enabled := fmfun.ACBrBoleto1.Cedente.Agencia <> '';
  BtImprimir.enabled := true;
  BtBoleto.enabled := true;
end;

procedure Tfrm_remessa_boleto.PrCONTAButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  // guardar os valores antigos
  chamou_form_old := '';
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Conta corrente';
  chamou_pesquisa := 'fr_conta_corrente';
  chamou_form := 'fr_cc_remessa';
  chamou_cadastro := 'Fr_conta_corrente';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Conta corrente';
  Fr_localizar.BT_cadastro.Visible := false;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 5);
  Campos_combo[0] := 'Código';
  Campos_combo[1] := 'Banco';
  Campos_combo[2] := 'Numero da Agencia';
  Campos_combo[3] := 'Numero da Conta';
  Campos_combo[4] := 'Data da abertura da conta';

  for i := 0 to 4 do
  begin
    valor_combo := Campos_combo[i];
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

procedure Tfrm_remessa_boleto.PrIDButtonClick(Sender: TObject);
var
  Campos_combo: array of string;
  i: Integer;
  valor_combo: string;
  // variavel para armazenar o valor antigo de chamou_form e chamou_pesquisa
  chamou_form_old, chamou_pesquisa_old: string;
begin
  Application.CreateForm(TFr_localizar, Fr_localizar);

  // guardar os valores antigos
  // guardar os valores antigos
  chamou_form_old := '';
  chamou_pesquisa_old := chamou_pesquisa;

  Fr_localizar.Caption := 'Localizar Remessa';
  chamou_pesquisa := 'frm_remessa_boleto';
  chamou_form := 'frm_remessa_boleto';
  chamou_cadastro := 'frm_remessa_boleto';

  Fr_localizar.BT_cadastro.Caption := 'Cadastro de' + #13 + 'Conta corrente';
  Fr_localizar.BT_cadastro.Visible := false;

  // preenchendo o combo box com os campos desejados para pesquisar.
  SetLength(Campos_combo, 4);
  Campos_combo[0] := 'Nº Remessa';
  Campos_combo[1] := 'Banco';
  Campos_combo[2] := 'Conta';
  Campos_combo[3] := 'Data';

  for i := 0 to 3 do
  begin
    valor_combo := Campos_combo[i];
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

procedure Tfrm_remessa_boleto.BtBuscarClick(Sender: TObject);
begin
  PrIDButtonClick(self);
end;

procedure Tfrm_remessa_boleto.btInserirClick(Sender: TObject);
begin
  modo_insert := true;
  PrID.enabled := false;
  PrID.Clear;
  PrCONTA.enabled := true;
  btInserir.enabled := false;
  BtSalvar.enabled := true;
  BtCancelar.enabled := true;
  BtBuscar.enabled := false;
  BtGerarArquivo.enabled := false;

  PrCONTA.SetFocus;
  mmItens.EmptyTable;
end;

procedure Tfrm_remessa_boleto.dgItensDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
  IsChecked: array [boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or
    DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  dgItens.DefaultDrawDataCell(Rect, Column.Field, State);

  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = DBCheckBox1.DataField) then
    begin
      DBCheckBox1.Left := Rect.Left + dgItens.Left + 2;
      DBCheckBox1.Top := Rect.Top + dgItens.Top + 2;
      DBCheckBox1.Width := Rect.Right - Rect.Left;
      DBCheckBox1.Height := Rect.Bottom - Rect.Top;

      DBCheckBox1.Visible := true;
    end;
    if (Column.Field.FieldName = DBCheckBox2.DataField) then
    begin
      DBCheckBox2.Left := Rect.Left + dgItens.Left + 2;
      DBCheckBox2.Top := Rect.Top + dgItens.Top + 2;
      DBCheckBox2.Width := Rect.Right - Rect.Left;
      DBCheckBox2.Height := Rect.Bottom - Rect.Top;

      DBCheckBox2.Visible := true;
    end;

  end
  else
  begin
    if (Column.Field.FieldName = DBCheckBox1.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := IsChecked[Column.Field.AsBoolean];

      dgItens.Canvas.FillRect(Rect);
      DrawFrameControl(dgItens.Canvas.Handle, DrawRect, DFC_BUTTON, DrawState);
    end;

    if (Column.Field.FieldName = DBCheckBox2.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);

      DrawState := IsChecked[Column.Field.AsBoolean];

      dgItens.Canvas.FillRect(Rect);
      DrawFrameControl(dgItens.Canvas.Handle, DrawRect, DFC_BUTTON, DrawState);
    end;

  end;
end;

procedure Tfrm_remessa_boleto.MontaArquivoCobrancaEnvio;
var
  txt: TextFile;
  dia, mes, ano, ord, ext, pathSaida, tempFile, nosso_numero, nosso_numero_div,
    sql_cliente, dir_remessa: string;
  sequencial_arquivo: Integer;
begin
  pathSaida := ExtractFilePath(Application.ExeName);
  tempFile := pathSaida + 'temp.txt';
  dia := formatdatetime('dd', now);
  mes := formatdatetime('mm', now);
  ano := formatdatetime('yy', now);

  if dao.CN.params.values['database'] = 'C:\orbi\trunk\dados\orbi.fdb' then
    ext := '.TST'
  else
    ext := '.REM';

  if remessa_arquivo <> '' then
  begin
    dir_remessa := ExtractFilePath(remessa_arquivo);
    arquivo := ExtractFileName(remessa_arquivo);
  end
  else
  begin
    dir_remessa := pathSaida + fmfun.ACBrBoleto1.Banco.Nome + '_' + PrCONTA.text + '\\';
    if not DirectoryExists(dir_remessa) then
      ForceDirectories(dir_remessa);

    if fmfun.ACBrBoleto1.Banco.TipoCobranca = cobItau then
      arquivo := PrID.text + ext
    else
      arquivo := 'CB' + dia + mes + PrID.text + ext;
  end;

  fmfun.ACBrBoleto1.DirArqRemessa := dir_remessa;
  fmfun.ACBrBoleto1.NomeArqRemessa := arquivo;

  // CABEÇALHO 0
  sequencial_arquivo := 1;
  mmItens.First;
  fmfun.ACBrBoleto1.ListadeBoletos.Clear;
  while not mmItens.Eof do
  begin
    if mmItensCheck.Value = true then
    begin
      fmfun.MontaCobrancaItem(mmItensNOM_CLIENTE.AsString,
        mmItensTIPO_PESSOA.AsString, mmItensCNPJ.AsString, mmItensCPF.AsString,
        mmItensENDERECO.AsString, mmItensNR_ENDERECO.AsString,
        mmItensBAIRRO.AsString, mmItensNOM_CIDADE.AsString, mmItensUF.AsString,
        mmItensCEP.AsString, carteira_conta, Boleto_Avalista,
        mmItensTITULO.AsString, mmItensSEQUENCIA.AsString,
        mmItensINSTRUCAO_BOLETO.AsString, mmItensDTAVEN.AsDateTime, dias_protesto,
        dias_baixa, mmItensISENTO.AsInteger, mmItensVALOR.Value);
    end;
    mmItens.Next;
  end;

  mmItens.First;
  if trim(PrID.text) = '' then
    Exit;

  fmfun.ACBrBoleto1.GerarRemessa(strtoint(PrID.text));
  showmessage('Remessa gerada com sucesso.')
end;

procedure Tfrm_remessa_boleto.BtSalvarClick(Sender: TObject);
var
  cmd, dia, mes, ano, data_str, boletos, boletos_descontados,
    boletos_n_descontados: string;
  extrato, Conta_Receber: Integer;
begin
  if PrID.text <> '' then
  begin
    dao.cn.StartTransaction;
    dao.Execsql
      ('UPDATE CR1 SET BOLETO_REMESSA_ORDEM = NULL WHERE conta_boleto = ' +
      PrCONTA.text + ' and BOLETO_REMESSA_ORDEM = ' + PrID.text);
    dao.cn.Commit;
  end;

  boletos := '';
  boletos_descontados := '';
  boletos_n_descontados := '';
  mmItens.First;
  while not mmItens.Eof do
  begin
    if mmItensCheck.Value = true then
      boletos := boletos + mmItensID.AsString + ',';

    { FMFUN.ExcluirExtratoConta(mmItensID.AsString, 'C', mmItensVALOR.Value); }
    if mmItensDESCONTADA.Value = true then
    begin
      boletos_descontados := boletos_descontados + mmItensID.AsString + ',';
      {
        extrato := FMFUN.GravaExtrato('DESCONTO ESCRITURAL REF. AO TÍTULO: ' +
        mmItensTITULO.AsString + '-' + mmItensSEQUENCIA.AsString,
        QuotedStr(formatdatetime('dd/mm/yyyy', now)), PrCONTA.text, 'C',
        mmItensVALOR.Value, 2);
        FMFUN.GravaExtratoConta(extrato, mmItensID.Value, 2); }
    end
    else
      boletos_n_descontados := boletos_n_descontados + mmItensID.AsString + ',';
    mmItens.Next;
  end;
  mmItens.First;
  // dao.cn.Commit;
  // MontaArquivoCobrancaEnvio;
  boletos := copy(boletos, 1, length(boletos) - 1);
  boletos_descontados := copy(boletos, 1, length(boletos_descontados) - 1);
  boletos_n_descontados := copy(boletos, 1, length(boletos_n_descontados) - 1);

  if boletos <> '' then
    SetarBoletos(boletos);

  if boletos_descontados <> '' then
    SetaBoletosDescontados(boletos_descontados, true);

  if boletos_n_descontados <> '' then
    SetaBoletosDescontados(boletos_n_descontados, false);

  PrCONTA.enabled := false;
  btInserir.enabled := true;
  BtSalvar.enabled := false;
  BtCancelar.enabled := false;
  BtBuscar.enabled := true;
  BtGerarArquivo.enabled := fmfun.ACBrBoleto1.Cedente.Agencia <> '';
  BtImprimir.enabled := true;
  BtBoleto.enabled := true;
end;

procedure Tfrm_remessa_boleto.SetaBoletosDescontados(listaboletos: string;
  descontar: boolean);
begin
  dao.cn.StartTransaction;
  if descontar then
    dao.Execsql('UPDATE CR1 SET DESCONTADA = ''1'' WHERE ID in (' +
      listaboletos + ')')
  else
    dao.Execsql('UPDATE CR1 SET DESCONTADA = ''0'' WHERE ID in (' +
      listaboletos + ')');
  dao.cn.Commit;
end;

procedure Tfrm_remessa_boleto.SetarBoletos(listaboletos: string);
var
  cmd, dia, mes, ano, data_str: string;
begin
  if modo_insert then
  begin
    // dao.Geral4('SELECT GEN_ID(GEN_BOLETO_REMESSA_ORDEM, 1) as ordem FROM RDB$DATABASE');
    dao.Geral4
      ('SELECT max(a.ID)+1 as ordem FROM BOLETO_REMESSA_ORDEM a where a.CONTA = '
      + PrCONTA.text);
    PrID.text := dao.q4.fieldbyname('ORDEM').AsString;

    dia := formatdatetime('dd', now);
    mes := formatdatetime('mm', now);
    ano := formatdatetime('yyyy', now);
    data_str := formatdatetime('dd/mm/yyyy', now);
    dao.cn.StartTransaction;
    cmd := 'INSERT INTO BOLETO_REMESSA_ORDEM (ID, DIA, MES, ANO, DATA, CONTA) '
      + 'VALUES (' + PrID.text + ',''' + dia + ''',''' + mes + ''',''' + ano +
      ''',''' + data_str + ''',''' + PrCONTA.text + ''')';
    dao.Execsql(cmd);
    dao.cn.Commit;
  end;
  dao.cn.StartTransaction;
  dao.Execsql('UPDATE CR1 SET conta_boleto = ' + PrCONTA.text +
    ', BOLETO_REMESSA_ORDEM = ' + PrID.text + ' WHERE ID In (' +
    listaboletos + ')');
  dao.cn.Commit;
end;

procedure Tfrm_remessa_boleto.BtCancelarClick(Sender: TObject);
begin
  if PrID.text = '' then
  begin
    mmItens.EmptyTable;
    PrID.Clear;
    PrCONTA.Clear;
    BtGerarArquivo.enabled := false;
    BtImprimir.enabled := false;
    BtBoleto.enabled := false;
  end
  else
  begin
    CarregaRemessa;
    BtGerarArquivo.enabled := fmfun.ACBrBoleto1.Cedente.Agencia <> '';
    BtImprimir.enabled := true;
    BtBoleto.enabled := true;
  end;

  btInserir.enabled := true;
  BtSalvar.enabled := false;
  BtCancelar.enabled := false;
  BtBuscar.enabled := true;
  PrCONTA.enabled := false;
end;

procedure Tfrm_remessa_boleto.FormShow(Sender: TObject);
begin
  modo_insert := false;
  BtBoleto.enabled := false;
  BtGerarArquivo.enabled := false;
  BtImprimir.enabled := false;
end;

procedure Tfrm_remessa_boleto.relatorio_cobranca;
var
  cmd, Path: string;
begin
  Path := ExtractFilePath(Application.ExeName);

  cmd := 'SELECT distinct a.ID, a.COD_CLIENTE, a.NR_DOCUMENTO, a.TITULO, a.SEQUENCIA,'
    + 'a.COD_EMPRESA, a.DTAVEN, a.VALOR, a.COD_FOP, a.HISTORICO, a.DTAREC, a.BOLETO_RETORNO_CODIGO, a.BOLETO_RETORNO_DESCRICAO, '
    + 'coalesce(a.VALOR_RECEBIDO, 0) as VALOR_RECEBIDO, a.SALDO, a.DIAS_ATRASO, coalesce(a.VLR_CORRIGIDO,0) AS VLR_CORRIGIDO, a.DESCONTO, '
    + 'a.NR_CUPOM, a.CONFERIDO, a.ID_REPRESENTANTE, a.VLR_COMISSAO, a.ID_PLANO_CONTAS, '
    + 'a.SINCRONIZAR_PALM, a.EXTRATO, a.VALOR_CORRIGIDO, a.BOLETO_REMESSA_ORDEM, '
    + 'bc.NR_BANCO, bc.NOM_BANCO, cc.NR_AGENCIA, cc.nom_conta,  cc.NR_CONTA, cc.CODIGO_CEDENTE, '
    + 'cast (''CB''||lpad(cast(b.DIA as VARCHAR(2)), 2,  ''0'')||lpad(cast(b.MES as VARCHAR(2)), 2, ''0'') || b.ID || ''. REM'' as varchar (50)) AS ARQUIVO, b.data, '
    + 'CL.COD_CLIENTE, CL.NOM_CLIENTE FROM CR1 a left outer join vendas1 v1 on (v1.NUMDOC = a.NR_DOCUMENTO) '
    + 'inner join CLIENTE CL on (CL.COD_CLIENTE = a.COD_CLIENTE) ' +
    'LEFT OUTER join CONTA_CORRENTE cc on  (cc.ID = coalesce(a.CONTA_BOLETO, v1.conta_boleto))  '
    + 'inner join banco bc on (cc.ID_BANCO = bc.ID) ' +
    'inner join BOLETO_REMESSA_ORDEM b on (b.ID = a.BOLETO_REMESSA_ORDEM AND B.CONTA = coalesce(a.CONTA_BOLETO, v1.conta_boleto)) '
    + 'WHERE 1 = 1 ';

  cmd := cmd + ' and b.id = ' + PrID.text + ' and b.conta = ' + PrCONTA.text;

  cmd := cmd + ' order by bc.NR_BANCO, cl.nom_cliente, a.ID, a.dtaven';
  with Dm.q_cobranca do
  begin
    Close;
    sql.Clear;
    sql.Add(cmd);
    Open;
  end;

  if Dm.q_cobranca.RecordCount <= 0 then
  begin
    dao.msg('Não foi encontrado Registros para gerar o Relatório');
    Exit;
  end;

  if not(fR_RELATORIO.LoadFromFile(Path + 'Relatorios\cobranca.fr3')) then
  begin
    dao.msg('Relatório não encontrado nas configurações do Sistema' + #13 +
      'Avise o Suporte');
    Exit;
  end;
  fR_RELATORIO.ShowReport;

end;

procedure Tfrm_remessa_boleto.BtImprimirClick(Sender: TObject);
begin
  if trim(PrID.text) = '' then
    Exit;
  relatorio_cobranca;
end;

procedure Tfrm_remessa_boleto.CheckTodosClick(Sender: TObject);
begin
  totalselecionados := 0;
  mmItens.First;
  while not mmItens.Eof do
  begin
    mmItens.Edit;
    mmItensCheck.Value := CheckTodos.Checked;
    if CheckTodos.Checked then
      totalselecionados := totalselecionados + 1
    else
      totalselecionados := 0;
    mmItens.Post;
    mmItens.Next;
  end;
  mmItens.First;
  lbTotalNFs.Caption := 'Boletos Relacionados: ' + inttostr(totalselecionados);
  BtSalvar.enabled := true;
  BtCancelar.enabled := true;
end;

procedure Tfrm_remessa_boleto.fR_RELATORIOGetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'empresa' then
    Value := nom_empresa;

  if VarName = 'titulo' then
    Value := 'Remessa de Cobrança';

  if VarName = 'dtaini' then
    Value := formatdatetime('dd/mm/yyyy', now)
  else if VarName = 'dtafin' then
    Value := formatdatetime('dd/mm/yyyy', now);
end;

procedure Tfrm_remessa_boleto.BtBoletoClick(Sender: TObject);
begin
  impressao_boleto := True;
  CarregaItens('ORDER BY TITULO, SEQUENCIA');
  if trim(PrID.text) = '' then
    Exit;
  MontaArquivoCobrancaEnvio;
  fmfun.ACBrBoletoFCFR1.DirLogo := ExtractFilePath(Application.ExeName) +
    'Logos\colorido\';
  fmfun.ACBrBoletoFCFR1.FastReportFile := ExtractFilePath(Application.ExeName) +
    'Relatorios\Boleto.fr3';
  fmfun.ACBrBoleto1.Imprimir;
end;

procedure Tfrm_remessa_boleto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    Close;
  end;
  if Key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure Tfrm_remessa_boleto.ChecarDataVencida;
begin
  mmItens.DisableControls;
  mmItens.First;
  tem_data_vcto_vencida := false;
  while not mmItens.Eof do
  begin
    if (mmItensDTAVEN.Value < now) and (mmItensCheck.Value = true) then
    begin
      tem_data_vcto_vencida := true;
      mmItens.EnableControls;
      Exit;
    end;
    mmItens.Next;
  end;
  mmItens.EnableControls;
end;

procedure Tfrm_remessa_boleto.BtGerarArquivoClick(Sender: TObject);
var
  dia, mes, ano, ext, pathSaida, dir_remessa, arquivo: string;
begin
  impressao_boleto := False;
  CarregaItens('ORDER BY TITULO, SEQUENCIA');
  if tem_data_vcto_vencida then
  begin
    Dialogs.messagedlg
      ('Há Data de Vencimentos Vencidos nos boletos relacionados!', mtError,
      [mbOk], 0, mbOk);
    Exit;
  end;

  pathSaida := ExtractFilePath(Application.ExeName);
  dia := formatdatetime('dd', now);
  mes := formatdatetime('mm', now);
  ano := formatdatetime('yy', now);

  if dao.CN.params.values['database'] = 'C:\orbi\trunk\dados\orbi.fdb' then
    ext := '.TST'
  else
    ext := '.REM';

  dir_remessa := pathSaida + fmfun.ACBrBoleto1.Banco.Nome + '_' + PrCONTA.text + '\\';
  if not DirectoryExists(dir_remessa) then
    ForceDirectories(dir_remessa);

  if fmfun.ACBrBoleto1.Banco.TipoCobranca = cobItau then
    arquivo := PrID.text + ext
  else
    arquivo := 'CB' + dia + mes + PrID.text + ext;

  SaveDialog1.InitialDir := dir_remessa;
  SaveDialog1.FileName := arquivo;
  SaveDialog1.Filter := 'Remessa (*' + ext + ')|*' + ext + '|Todos (*.*)|*.*';
  SaveDialog1.DefaultExt := Copy(ext, 2, Length(ext) - 1);

  if not SaveDialog1.Execute then
    Exit;

  remessa_arquivo := SaveDialog1.FileName;
  MontaArquivoCobrancaEnvio;
end;

procedure Tfrm_remessa_boleto.dgItensTitleClick(Column: TColumn);
begin
  CarregaItens('ORDER BY ' + Column.FieldName);
end;

procedure Tfrm_remessa_boleto.dgItensCellClick(Column: TColumn);
begin
  mmItens.Edit;

  if Column.FieldName = 'Check' then
  begin
    if mmItensCheck.Value = true then
    begin
      mmItensCheck.Value := false;
      totalselecionados := totalselecionados - 1;
    end
    else
    begin
      mmItensCheck.Value := true;
      totalselecionados := totalselecionados + 1;
    end;
  end;

  if Column.FieldName = 'DESCONTADA' then
  begin
    if mmItensDESCONTADA.Value = true then
      mmItensDESCONTADA.Value := false
    else
      mmItensDESCONTADA.Value := true;
  end;

  mmItens.Post;
  lbTotalNFs.Caption := 'Boletos Relacionados: ' + inttostr(totalselecionados);

  btInserir.enabled := false;
  BtSalvar.enabled := true;
  BtCancelar.enabled := true;
  BtBuscar.enabled := false;
  BtGerarArquivo.enabled := false;
  BtImprimir.enabled := false;
  BtBoleto.enabled := false;
end;

end.








