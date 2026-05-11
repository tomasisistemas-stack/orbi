unit Un_imp_pedidos_lote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, Mask, Buttons, RdPrint, sBitBtn,
  sLabel, sCheckBox, sGroupBox, sMaskEdit, sCustomComboEdit, sTooledit;

type
  TFr_imp_pedidos_lote = class(TForm)
    GroupBox1: TsGroupBox;
    GroupBox2: TsGroupBox;
    BitBtn1: TsBitBtn;
    Prdta_inicial: TsDateEdit;
    Label1: tsLabel;
    Prdta_final: TsDateEdit;
    Label2: tsLabel;
    BitBtn2: TsBitBtn;
    Cl_Pedidos: TCheckListBox;
    CheckBox1: tscheckbox;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Prdta_inicialKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure busca_lote_pedidos(dtaini, dtafin: TDate);
    procedure monta_checklist;
    procedure imprime_lote(cmd_where: string);
  end;

var
  Fr_imp_pedidos_lote: TFr_imp_pedidos_lote;

implementation

uses Un_dao, UnFun, Un_vendas_industria2, UnPri;

{$R *.dfm}

procedure TFr_imp_pedidos_lote.busca_lote_pedidos(dtaini, dtafin: TDate);
begin
  dao.Geral1('select a.NUMDOC, a.HORA, a.DTADOC, a.COD_CLIENTE, a.COD_USUARIO, a.COD_EMPRESA, a.FATURADO, a.CONSIGNACAO, a.ORCAMENTO, a.ENTREGUE, a.TOT_BRUTO, ' +
    'a.DESCONTO, a.TOT_LIQUIDO, a.PRAZO_PGTO, a.COD_FOP, a.NUM_CUPOM, a.TIPO_VENDA, a.QTD_PARCELAS, a.PONTO_USADO, a.USUARIO_DESFATUROU, a.COD_REPRESENTANTE, ' +
    'a.COD_PRAZO_PGTO, a.CUSTO_TOTAL, a.LUCRO_MEDIO, a.DTA_EMISSAO, a.DTA_SAIDA, a.EMPRESA_FATURAR, a.NF, a.OBSERVACOES_PEDIDO, a.OBSERVACOES_NOTA, ' +
    'a.COD_TRANSPORTADORA, a.TIPO_FRETE, a.VOLUME_NOTA, a.PESO_NOTA, a.COD_CARGA, a.VL_FRETE, a.CONTATO_FRETE, a.PED_IMPRESSO, a.DTA_VENCIMENTO_CONSIG, a.CANCELADO, ' +
    'a.CONTEM_AVARIA, a.CONTEM_ETIQUETA, a.MOTIVO_TROCA, a.NR_VENDA_ORIGINAL, a.PEDIDO, a.VENDA_ENVIADA, a.CREDITO_USADO, a.NR_PEDIDO_PALM, a.BOLETO_ANEXO, a.COD_FISCAL, ' +
    'a.VLR_COMISSAO, a.VLR_BC_ICMS, a.VLR_ICMS, a.VLR_ST, a.VLR_TOT_NF, a.VLR_BC_ICMS_ST, a.CHAVE_NFE, a.RECIBO_NFE, a.STATUS_NFE, a.MOTIVO_NFE, a.DIGEST_NFE, ' +
    'a.PROTOCOLO_NFE, a.DATA_REC_NFE, a.JUSTIF_CANC_NFE, a.COD_SUPERVISOR, a.COD_FORNECEDOR, a.NFE, a.VLR_IPI, a.PALM_NR_CONEXAO, a.SINCRONIZAR_PALM, ' +
    'a.NUMDOC_REF, a.FRETE_COMBINADO, a.DT_FRETE_COMBINADO, a.EMAIL_NFE, a.EMAIL_PEDIDO, a.PEDIDO_VENDEDOR, a.USUARIO_CHECOU_PEDIDO_VENDEDOR, a.CONTA_BOLETO, a.USUARIO_CHECOU_FRETE_COMBINADO, a.ABERTO_USUARIO, a.MAQUINA_USUARIO_ABERTO, ' +
    'c.nom_cliente from vendas1 a ' +
    'left join cliente c on c.cod_cliente=a.cod_cliente ' +
    'where dtadoc between ' + QuotedStr(FormatDateTime('dd.mm.yyyy', dtaini)) + ' and ' + QuotedStr(FormatDateTime('dd.mm.yyyy', dtafin)));
end;

procedure TFr_imp_pedidos_lote.monta_checklist;
var
  mnumdoc, mdtadoc, mnomcli, mtotal, cmd: string;

begin


  Cl_Pedidos.Clear;
  dao.Q1.First;
  while not (dao.Q1.Eof) do
  begin
    mnumdoc := '';
    mdtadoc := '';
    mnomcli := '';
    mtotal := '';
//    mnumdoc := FMFUN.poePONTOS(FMFUN.enchevazio(dao.q1.fieldbyname('numdoc').AsString,10)+' - '+
//               FmFun.enchevazio(dao.q1.fieldbyname('dtadoc').AsString,10)+' - '+
//               FMFUN.enchevazio(copy(dao.q1.fieldbyname('nom_cliente').AsString,1,30),35)+' - '+
//               FmFun.enchevazio(formatfloat('###,##0.00', dao.q1.fieldbyname('tot_liquido').AsFloat),20),150);

    mnumdoc := FMFUN.PreEsp(FMFUN.enchezero(dao.q1.FieldByName('numdoc').AsString, 6), 11);
    mdtadoc := FMFUN.PreEsp(formatdatetime('dd/mm/yyyy', dao.Q1.FieldByName('dtadoc').AsDateTime), 11);
    mnomcli := FMFUN.PreEsp(FMFUN.poePONTOS(copy(dao.Q1.fieldbyname('nom_cliente').AsString, 1, 25), 30), 30);
    mtotal := Format('%12n', [dao.q1.FieldByName('tot_liquido').AsFloat]);
//    mtotal :=FMFUN.PreEsp(dao.q1.FieldByName('tot_liquido').AsString,20);
//    Cl_Pedidos.Items.Add(' '+mnumdoc+' ');
    Cl_Pedidos.Items.Add(' ' + mnumdoc + ' ' + mdtadoc + '  ' + mnomcli + '  ' + mtotal);
    dao.Q1.Next;
  end;
  Cl_Pedidos.SetFocus;

end;

procedure TFr_imp_pedidos_lote.FormShow(Sender: TObject);
begin
  Prdta_inicial.Date := dao.DtaSerDt;
  Prdta_final.Date := dao.DtaSerDt;
  busca_lote_pedidos(Prdta_inicial.Date, Prdta_final.Date);
  monta_checklist;
end;

procedure TFr_imp_pedidos_lote.BitBtn2Click(Sender: TObject);
begin
  busca_lote_pedidos(Prdta_inicial.Date, Prdta_final.Date);
  monta_checklist;




end;

procedure TFr_imp_pedidos_lote.BitBtn1Click(Sender: TObject);
var
  i, j: integer;
  num_pedidos: string;
  nr_ped: integer;
begin
  j := 0;
  for i := 0 to Cl_Pedidos.Items.Count - 1 do
  begin
    if Cl_Pedidos.Checked[i] then
      j := j + 1;
  end;
  if j <= 0 then
  begin
    dao.msg('Deve ser Marcado ao Menos 1 Pedido para Imprimir!');
    exit;
  end;

  if MessageDlg('Deseja Imprimir os Pedidos Marcados?', mtConfirmation, [mbYes, mbNo], 0) = mryes then
  begin
    for i := 0 to Cl_Pedidos.Items.Count - 1 do
    begin
      if Cl_Pedidos.Checked[i] then
        if num_pedidos = '' then
        begin
          nr_ped := strtoint(copy(trim(Cl_Pedidos.Items[i]), 1, 6));
          num_pedidos := 'numdoc= ' + QuotedStr(inttostr(nr_ped));
        end
        else
        begin
          nr_ped := strtoint(copy(trim(Cl_Pedidos.Items[i]), 1, 6));
          num_pedidos := num_pedidos + ' or numdoc= ' + QuotedStr(inttostr(nr_ped));
        end;
    end;
    if num_pedidos <> '' then
      imprime_lote(num_pedidos);

  end;

end;

procedure TFr_imp_pedidos_lote.imprime_lote(cmd_where: string);
var
  cmd: string;
  lh, CL: integer;
  MCR1, USUARIO: string;

begin
  FRPRI.RD.TamanhoQteColunas := 96;
  FRPRI.RD.TamanhoQteLinhas := 60;
  FRPRI.RD.TamanhoQteLPP := seis;
  FRPRI.RD.FonteTamanhoPadrao := S12cpp;

  dao.Geral1('select a.NUMDOC, a.HORA, a.DTADOC, a.COD_CLIENTE, a.COD_USUARIO, a.COD_EMPRESA, a.FATURADO, ' +
    'a.CONSIGNACAO, a.ORCAMENTO, a.ENTREGUE, a.TOT_BRUTO, a.DESCONTO, a.TOT_LIQUIDO, a.PRAZO_PGTO, ' +
    'a.COD_FOP, a.NUM_CUPOM, a.TIPO_VENDA, a.QTD_PARCELAS, a.PONTO_USADO, a.USUARIO_DESFATUROU, ' +
    'a.COD_REPRESENTANTE, a.COD_PRAZO_PGTO, a.CUSTO_TOTAL, a.LUCRO_MEDIO, a.DTA_EMISSAO, a.DTA_SAIDA, ' +
    'a.EMPRESA_FATURAR, a.NF, a.OBSERVACOES_PEDIDO, a.OBSERVACOES_NOTA, a.COD_TRANSPORTADORA, a.TIPO_FRETE, ' +
    'a.VOLUME_NOTA, a.PESO_NOTA, a.COD_CARGA, a.VL_FRETE, a.CONTATO_FRETE, a.PED_IMPRESSO, a.DTA_VENCIMENTO_CONSIG, ' +
    'a.CANCELADO, a.CONTEM_AVARIA, a.CONTEM_ETIQUETA, a.MOTIVO_TROCA, a.NR_VENDA_ORIGINAL, a.PEDIDO, a.VENDA_ENVIADA, ' +
    'a.CREDITO_USADO, a.NR_PEDIDO_PALM, a.BOLETO_ANEXO, a.COD_FISCAL, a.VLR_COMISSAO, a.VLR_BC_ICMS, a.VLR_ICMS, ' +
    'a.VLR_ST, a.VLR_TOT_NF, a.VLR_BC_ICMS_ST, a.CHAVE_NFE, a.RECIBO_NFE, a.STATUS_NFE, a.MOTIVO_NFE, a.DIGEST_NFE, ' +
    'a.PROTOCOLO_NFE, a.DATA_REC_NFE, a.JUSTIF_CANC_NFE, a.COD_SUPERVISOR, a.COD_FORNECEDOR, a.NFE, a.VLR_IPI, ' +
    'a.PALM_NR_CONEXAO, a.SINCRONIZAR_PALM, a.NUMDOC_REF, a.FRETE_COMBINADO, a.DT_FRETE_COMBINADO, a.EMAIL_NFE, ' +
    'a.EMAIL_PEDIDO, a.PEDIDO_VENDEDOR, a.USUARIO_CHECOU_PEDIDO_VENDEDOR, a.CONTA_BOLETO, a.USUARIO_CHECOU_FRETE_COMBINADO, a.ABERTO_USUARIO, a.MAQUINA_USUARIO_ABERTO, ' +
    'c.nom_cliente, c.nom_fantasia, c.cnpj, c.dta_cad, c.bairro, c.endereco, c.nr_endereco, c.cep, c.cpf, c.cnpj,c.rg, c.ie, c.telefone, c.fax, c.email, ' +
    'r.nom_representante, r.celular, f.nom_fop, p.prazo, e.nom_empresa,' +
    't.nome, cd.nom_cidade, cd.uf, us.logusu from vendas1 a ' +
    'left join cliente c on c.cod_cliente = a.cod_cliente ' +
    'left join cidades cd on cd.cod_cidade= c.cod_cidade ' +
    'left join representante r on r.id = a.cod_representante ' +
    'left join fop f on f.cod_fop = a.cod_fop ' +
    'left join prazo p on p.id = a.cod_prazo_pgto ' +
    'left join empresa e on e.cod_empresa = a.empresa_faturar ' +
    'left join transportadora t on t.cod_transportadora = a.cod_transportadora ' +
    'left join tbusu us on cast(us.codusu as INTEGER) = a.cod_usuario ' +
    'where ' + cmd_where);

  if dao.Q1.recordcount <= 0 then
  begin
    dao.msg('NÃO FOI ENCONTRADO PEDIDOS COM ESSES DADOS!');
    exit;
  end;

  FRPRI.RD.Abrir;

  lh := 1;
  while not (dao.Q1.Eof) do
  begin
    if LH >= 60 then
    begin
      frpri.rd.novapagina;
      lh := 1;
    end;

    usuario := dao.Q1.fieldbyname('logusu').AsString;
    frpri.rd.impC(LH, 02, 'Nº: ', [comp12, negrito]);
    frpri.rd.impf(LH, 08, inttostr(dao.Q1.FIELDBYNAME('numdoc').asinteger), [comp12]); // DADOS DO CLIENTE

    if dao.Q1.FieldByName('dtadoc').Value <> null then
      frpri.rd.impf(LH, 20, FormatDateTime('dd/mm/yyyy', dao.Q1.fieldbyname('dtadoc').AsDateTime), [comp12]);

    frpri.rd.impC(LH, 48, 'CLIENTE DESDE:', [comp12, negrito]);
    if FormatDateTime('dd/mm/yyyy', dao.Q1.FieldByName('dta_cad').AsDateTime) <> '30/12/1899' then
      frpri.rd.impf(LH, 55, FormatDateTime('dd/mm/yyyy', dao.Q1.fieldbyname('dta_cad').AsDateTime), [comp12]);

    if FormatDateTime('dd/mm/yyyy', dao.Q1.FieldByName('dta_emissao').AsDateTime) <> '30/12/1899' then
      frpri.rd.impf(LH, 86, formatdatetime('dd/mm/yyyy', dao.Q1.fieldbyname('dta_emissao').AsDateTime), [comp12]);
    LH := LH + 1;

    frpri.rd.impC(LH, 02, 'CODIGO:', [comp12, NEGRITO]);
    frpri.rd.impf(LH, 10, dao.Q1.fieldbyname('cod_cliente').AsString, [comp12]);

    frpri.rd.impC(LH, 21, 'CLIENTE:', [comp12, NEGRITO]);
    frpri.rd.impf(lh, 26, dao.Q1.fieldbyname('nom_cliente').AsString + ' / ' + copy(dao.Q1.fieldbyname('nom_cliente').AsString, 1, 40), [comp12]);
    LH := LH + 1;

    frpri.rd.impC(LH, 02, 'END:', [comp12, NEGRITO]);
    frpri.rd.impf(LH, 07, dao.Q1.fieldbyname('endereco').AsString + ', ' + dao.Q1.fieldbyname('nr_endereco').AsString, [comp12]);

    frpri.rd.impC(LH, 60, 'BAIRRO:', [comp12, NEGRITO]);
    frpri.rd.impf(LH, 68, dao.Q1.fieldbyname('bairro').AsString, [comp12]);
    LH := LH + 1;

    frpri.rd.impC(LH, 02, 'CEP:', [comp12, NEGRITO]);
    frpri.rd.impf(LH, 06, dao.Q1.fieldbyname('cep').AsString, [comp12]);


    frpri.rd.impC(LH, 22, 'CIDADE:', [comp12, NEGRITO]);
    frpri.rd.impf(LH, 27, dao.Q1.fieldbyname('nom_cidade').AsString, [comp12]);

    frpri.rd.impC(LH, 59, 'UF:', [comp12, NEGRITO]);
    frpri.rd.impf(LH, 62, dao.Q1.fieldbyname('uf').AsString, [comp12]);
    LH := LH + 1;

    frpri.rd.impC(LH, 02, 'CNPJ\CPF:', [comp12, NEGRITO]);
    if (dao.Q1.FieldByName('cnpj').AsString <> '') or (dao.Q1.FieldByName('cnpj').AsString <> '  .   .   /    -') then
      frpri.rd.impf(LH, 11, dao.Q1.fieldbyname('cnpj').AsString, [comp12])
    else
      frpri.rd.impf(LH, 11, dao.Q1.fieldbyname('cpf').AsString, [comp12]);

    frpri.rd.impC(LH, 33, 'I.E\RG:', [comp12, NEGRITO]);
    if dao.Q1.fieldbyname('ie').Asstring <> null then
      frpri.rd.impf(LH, 45, dao.Q1.fieldbyname('ie').AsString, [comp12])
    else
      frpri.rd.impf(LH, 45, dao.Q1.fieldbyname('rg').AsString, [comp12]);
    LH := LH + 1;

    frpri.rd.impC(LH, 02, 'FONE:', [comp12, NEGRITO]);
    frpri.rd.impf(LH, 06, dao.Q1.fieldbyname('telefone').AsString, [comp12]);

    frpri.rd.impC(LH, 30, 'FAX:', [comp12, NEGRITO]);
    frpri.rd.impf(LH, 33, dao.Q1.fieldbyname('fax').AsString, [comp12]);
    LH := LH + 1;


  //  frpri.rd.impC(07,60,'COMPRADOR:',[comp12,NEGRITO]);
  //  if DMVEN.QUPED1.FIELDBYNAME('comcli').value<>null then
  //  frpri.rd.impf(07,70,DMVEN.QUPED1.FieldByName('comcli').value,[comp12]);

    frpri.rd.impC(LH, 02, 'E-MAIL:', [comp12, NEGRITO]);
    frpri.rd.impf(LH, 12, dao.Q1.fieldbyname('email').AsString, [comp12]);

    frpri.rd.impC(LH, 02, 'REPRESENTANTE:', [comp12, NEGRITO]);
    frpri.rd.impf(LH, 16, dao.Q1.fieldbyname('nom_representante').AsString + '-' + dao.Q1.fieldbyname('celular').AsString, [comp12]);
    LH := LH + 1;
    if LH >= 60 then
    begin
      frpri.rd.novapagina;
      lh := 1;
    end;

    frpri.rd.impC(LH, 09, '------------------------------------------------------------------------------------------', [comp12, NEGRITO]);
    LH := LH + 1;
    if LH >= 60 then
    begin
      frpri.rd.novapagina;
      lh := 1;
    end;

    frpri.rd.impC(LH, 02, '  COD \ PTL          PRODUTO                                 QTD    UNI-QTD   VLR.UNI   TOT.LIQ', [comp12, NEGRITO]);

      // BUSCA PRODUTOS DO PEDIDO
    dao.Geral2('select a.ID, a.NUMDOC, a.DTADOC, a.COD_PRODUTO, a.COD_CLIENTE, a.COD_REPRESENTANTE, a.ID_COR, a.ID_TAMANHO, a.QTD, ' +
      'a.QTD_DEVOLVIDA, a.DEVOLVIDO, a.PRECO, a.SUB_TOTAL, a.DESCONTO, a.VOLUME, a.COD_EMPRESA, a.NR_PEDIDO_PALM, ' +
      'a.PRECO_BRUTO, a.SUB_TOTAL_BRUTO, a.VLR_COMISSAO, a.TROCA, a.COD_FISCAL_ITEM, a.ICMS_ITEM, a.VLR_ICMS_ST, ' +
      'a.VLR_BC_ST, a.VLR_ICMS_ITEM, a.NCM, a.VLR_BC, a.IPI_ITEM, a.VLR_IPI_ITEM, a.VLR_AGR_ITEM, a.TRIB_ICMS, ' +
      'a.CESTA_BASICA, a.COD_SUPERVISOR, a.QTD_EMBALAGEM, a.PRECO_CUSTO, a.PERC_COMISSAO, a.PROMOCAO, a.DESCONTO_MAX, ' +
      'c.cor, t.tamanho, p.preco_venda, p.nom_produto, p.cod_prateleira,p.unidade, p.qtd_embalagem from vendas2 a ' +
      'left join produto p on p.cod_produto = a.cod_produto ' +
      'left join cores c on c.id = a.id_cor ' +
      'left join tamanho t on t.id = a.id_tamanho ' +
      'where numdoc = ' + QuotedStr(dao.Q1.fieldbyname('numdoc').AsString));
    dao.q2.First;
    LH := LH + 1;
    while not (dao.q2.eof) do
    begin
      if LH > 60 then
      begin
        frpri.RD.novapagina;
        lh := 2;
      end;
      LH := LH + 1;

      frpri.rd.impf(LH, 01, dao.Q2.fieldbyname('cod_produto').AsString + '\' + dao.Q2.fieldbyname('cod_prateleira').AsString, [comp12]);

      frpri.rd.impf(LH, 15, copy(dao.Q2.fieldbyname('nom_produto').AsString, 1, 41), [comp12]);

      frpri.rd.impval(LH, 57, '###,##0.00', dao.Q2.fieldbyname('qtd').AsFloat, [comp12]);

      frpri.rd.impf(LH, 69, dao.Q2.fieldbyname('unidade').AsString, [comp12]);

      frpri.rd.impval(LH, 72, '#', dao.Q2.fieldbyname('qtd_embalagem').AsFloat, [comp12]);

      if (dao.Q2.fieldbyname('qtd_embalagem').AsFloat <> 0) and (dao.Q2.fieldbyname('volume').AsFloat <> 0) then
        frpri.rd.impf(LH, 72, formatfloat('#', dao.Q2.fieldbyname('qtd_embalagem').AsFloat) + '/' + dao.Q2.fieldbyname('volume').AsString, [comp12]);

      frpri.rd.impd(LH, 85, FormatFloat('###,##0.00', dao.Q2.fieldbyname('preco').AsFloat), [comp12]);
      frpri.rd.impval(LH, 85, '###,##0.00', dao.Q2.fieldbyname('sub_total').AsFloat, [comp12]);

      dao.Q2.next;
    end;
    if LH >= 60 then
    begin
      FRPRI.RD.novapagina;
      lh := 1;
    end;

    LH := LH + 1;
    frpri.rd.impC(LH, 01, '-----------------------------------------------------------------------------------------', [comp12, NEGRITO]);

    LH := LH + 1;

    frpri.rd.impC(LH, 02, 'TOT.LIQUIDO:', [comp12, NEGRITO]);
    frpri.rd.impval(LH, 13, '###,##0.00', dao.Q1.fieldbyname('tot_liquido').AsFloat, [comp12]);

    frpri.rd.impC(LH, 35, 'FOR.PAGAMEN.:', [comp12, NEGRITO]);
    frpri.rd.impf(LH, 45, dao.Q1.fieldbyname('nom_fop').AsString + ' ' + dao.Q1.fieldbyname('prazo').AsString, [comp12]);
    LH := LH + 1;

    frpri.rd.impC(LH, 02, 'PESO PEDIDO:', [comp12, NEGRITO]);
    frpri.rd.impval(LH, 13, '0.000', dao.Q1.fieldbyname('peso_nota').AsFloat, [comp12]);

    frpri.rd.impC(LH, 41, 'QTD DE VOLUMES DO PEDIDO:', [comp12, NEGRITO]);
    frpri.rd.impval(LH, 54, '###,##0.00', dao.Q1.fieldbyname('volume_nota').AsFloat, [comp12]);
    LH := LH + 1;
    frpri.rd.impC(LH, 02, 'OBSERV:', [comp12, NEGRITO]);
    frpri.rd.impf(LH, 09, dao.Q1.fieldbyname('observacoes_pedido').AsString, [comp12]);

    cmd := 'select * from cr1 ' +
      'where nr_documento = ' + QuotedStr(dao.Q1.fieldbyname('numdoc').AsString) +
      ' order by dtaven';
    dao.Geral3(cmd);
    if LH >= 60 then
    begin
      frpri.rd.novapagina;
      lh := 1;
    end;

    if dao.Q3.RecordCount >= 1 then
    begin
      lh := lh + 1;
      if LH >= 60 then
      begin
        frpri.rd.novapagina;
        lh := 1;
      end;
      lh := lh + 1;
      frpri.rd.ImpF(lh, 02, 'Vencimentos: ', [comp12]);
      dao.Q3.First;
      CL := 16;
      MCR1 := FormatDateTime('dd/mm/yyyy', dao.Q3.fieldbyname('dtaven').AsDateTime) + ':' + formatfloat('###,##0.00', dao.Q3.fieldbyname('valor').AsFloat);
      dao.Q3.Next;
      while not (dao.Q3.Eof) do
      begin
        MCR1 := MCR1 + ' - ' + dao.Q3.fieldbyname('dtaven').AsString + ':' + formatfloat('###,##0.00', dao.q3.fieldbyname('valor').value);
        dao.Q3.Next;
      end;
      frpri.rd.ImpF(lh, 16, MCR1, [comp12]);
    end;

    LH := LH + 1;
    frpri.rd.impf(LH, 01, '------------------------------------------------------------------------- ' + USUARIO, [comp12, NEGRITO]);

    lh := lh + 3;

    dao.q1.Next;
  end;

  frpri.rd.fechar;
end;

procedure TFr_imp_pedidos_lote.Prdta_inicialKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(sender as twincontrol, true, true);
    key := #0;
  end;
end;

procedure TFr_imp_pedidos_lote.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

end.
