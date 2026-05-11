unit AtualizaBD;

interface

uses classes, SysUtils;

type
  TAtuBD = class
  private
  public
    procedure ExecAtualizaBD;
  end;


implementation

uses Un_dao, UnPri;

procedure TAtuBD.ExecAtualizaBD;
var script: TstringList;
  procedure SetaVersao;
  begin
    if versao < versao_banco then exit;
    if not dao.cn.InTransaction then dao.cn.StartTransaction;
    dao.Execsql('update configuracao set versao = ' + quotedstr(versao) + ';');
    dao.cn.Commit;
  end;
  procedure ExecuteSQL;
  var x: integer;
  begin
    for x := 0 to script.Count - 1 do
    begin
      if not dao.cn.InTransaction then dao.cn.StartTransaction;
      try
        try
          dao.IS_IMPORTAR_DADOS.SQLSCRIPTS[0].sql.text := script.Strings[x];
          dao.IS_IMPORTAR_DADOS.ValidateAll;
          dao.IS_IMPORTAR_DADOS.ExecuteAll;
        except
          dao.cn.Rollback;
        end;
      finally
        dao.cn.Commit;
      end;
    end;
  end;
begin
  script := TstringList.Create;
//  frpri.checar_configuracao;

  if versao_banco < '1.04.16' then
  begin
    script.Add('update representante set observacao = obs;');
    script.Add('ALTER TABLE REPRESENTANTE ALTER OBS TO OBS1;');
    script.Add('ALTER TABLE REPRESENTANTE ALTER OBSERVACAO TO OBS;');
    script.Add('ALTER TABLE REPRESENTANTE DROP OBS1;');
    script.Add('ALTER TABLE CONFIGURACAO ADD CASASDECIMAIS INTEGER;');
    script.Add('update CONFIGURACAO set CASASDECIMAIS = 2;');
    script.Add('ALTER TABLE PROMOCAO ADD LIQUIDACAO CHAR(1) CHARACTER SET WIN1252 COLLATE WIN1252;');
    script.Add('ALTER TABLE CONFIGURACAO ADD NFE_HOMOLOGACAO CHAR(1) CHARACTER SET WIN1252 COLLATE WIN1252;');
    ExecuteSQL;

    SetaVersao;
  end;

  if versao_banco < '1.04.17' then
  begin
    script.Add('ALTER TABLE CONFIGURACAO ADD mala_direta Varchar(30);');
    script.Add('ALTER TABLE VENDAS1 ADD ValorDescontoAdic Numeric(15,4);');
    script.Add('ALTER TABLE VENDAS2 ADD DESCONTO_VALOR Numeric(15,4);');
    script.Add('ALTER TABLE ACERTO_ESTOQUE ADD QTD_ESTOQUE Numeric(15,2);');
    script.Add('ALTER TABLE CONFIGURACAO ADD AVISO_CONTA_VENCIDA Date;');
    script.Add('ALTER TABLE CONFIGURACAO ADD AVISO_ESTOQUE_MINIMO_EMAIL Varchar(200)');
    script.Add('ALTER TABLE CONFIGURACAO ADD AVISO_ESTOQUE_MINIMO_CK CHAR(1) CHARACTER SET WIN1252 COLLATE WIN1252;');
    script.Add('ALTER TABLE CONFIGURACAO ADD AVISO_CONTA_VENCIDA_EMAIL Varchar(200)');
    script.Add('ALTER TABLE CONFIGURACAO ADD AVISO_CONTA_VENCIDA_CK CHAR(1) CHARACTER SET WIN1252 COLLATE WIN1252;');
    script.Add('update CONFIGURACAO a set a.AVISO_CONTA_VENCIDA = ''01.01.2014''');
    ExecuteSQL;

    SetaVersao;
  end;
  if versao_banco < '1.04.18' then
  begin
    script.Add('ALTER TABLE CONFIGURACAO ADD MODELO_DESCONTO Integer;');
    script.Add('ALTER TABLE CLIENTE ADD UltConsSerasa Date;');
    script.Add('ALTER TABLE FOP ADD AVISTA Char(1);');
    script.Add('ALTER TABLE FOP ADD PRAZO_PADRAO Integer;');
    script.Add('ALTER TABLE CONFIGURACAO ADD FRENTE_CAIXA_EMPRESA_PADRAO Integer;');
    script.Add('ALTER TABLE RECIBO ADD ID_CONTAS_PAGAR Integer;');
    script.Add('ALTER TABLE RECIBO ADD ID_PLANO_DE_CONTAS Integer;');
    script.Add('ALTER TABLE RECIBO ADD COD_FORNECEDOR Integer;');
    script.Add('ALTER TABLE CONFIGURACAO ADD VENDOR_SERVIDOR_CLIENTES Varchar(20);');
    script.Add('ALTER TABLE CONFIGURACAO ADD VENDOR_BD_CLIENTES Varchar(100);');
    script.Add('ALTER TABLE FOP ADD CONTA_PADRAO Integer;');
    script.Add('ALTER TABLE CP1 ADD CR_VINCULADA Integer;');
    script.Add('ALTER TABLE CP1 ADD EMPRESTIMO Char(1);');
    script.Add('ALTER TABLE CP1 ADD CONTA_EMPRESTIMO Integer;');
    script.Add('ALTER TABLE EMPRESA ADD CERTIFICADO_VCTO Date;');
    ExecuteSQL;

    SetaVersao;
  end;

  if versao_banco < '1.04.19' then
  begin
    script.Add('ALTER TABLE EXTRATO ALTER VALOR TYPE Numeric(15,2);');
    script.Add('ALTER TABLE EXTRATO ALTER SALDO TYPE Numeric(15,2);');
    script.Add('ALTER TABLE METAS_REPRESENTANTE ADD TOTAL_FATURADO Numeric(15,2);');
    script.Add('ALTER TABLE METAS_REPRESENTANTE ADD TOTAL_ABERTO Numeric(15,2);');
    script.Add('ALTER TABLE METAS_REPRESENTANTE ADD MARGEM_FATURADO Numeric(15,2);');
    script.Add('ALTER TABLE METAS_REPRESENTANTE ADD MARGEM_ABERTO Numeric(15,2);');
    script.Add('ALTER TABLE CP1 ALTER HISTORICO TYPE Varchar(1000);');
    script.Add('ALTER TABLE UF ADD MASCARA_IE Varchar(30);');
    script.Add('ALTER TABLE FORNECEDOR ALTER RAZAO_SOCIAL TYPE Varchar(100);');
    script.Add('ALTER TABLE TRANSPORTADORA ALTER NOME TYPE Varchar(100);');
    ExecuteSQL;
    SetaVersao;
  end;

  if versao_banco < '1.04.20' then
  begin
    script.Add('CREATE TABLE VENDAS_REPRESENTANTE ( COD_REPRESENTANTE Integer NOT NULL,  DATA Date NOT NULL,  VALOR NUMERIC(15,2));');
    script.Add('CREATE INDEX IDX_VENDAS_REPRESENTANTE ON VENDAS_REPRESENTANTE (COD_REPRESENTANTE, DATA);');
    script.Add('GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON VENDAS_REPRESENTANTE TO SYSDBA WITH GRANT OPTION;');
    script.Add('ALTER TABLE CONFIGURACAO ADD AVISO_VENDAS_EMAIL1 Varchar(200);');
    script.Add('ALTER TABLE CONFIGURACAO ADD AVISO_VENDAS_EMAIL2 Varchar(200);');
    script.Add('ALTER TABLE CONFIGURACAO ADD AVISO_VENDAS_EMAIL3 Varchar(200);');
    script.Add('ALTER TABLE CONFIGURACAO ADD AVISO_VENDAS Date;');
    script.Add('ALTER TABLE CONFIGURACAO ADD AVISO_VENDAS_CK Char(1);');
    script.Add('ALTER TABLE FOP ADD NAO_GERAR_CR Char(1);');
    script.Add('ALTER TABLE CONFIGURACAO ADD AVISO_CONTA_VENCIDA_EMAIL1 VARCHAR(200) CHARACTER SET WIN1252 COLLATE WIN1252;');
    script.Add('ALTER TABLE CONFIGURACAO ADD AVISO_CONTA_VENCIDA_EMAIL2 VARCHAR(200) CHARACTER SET WIN1252 COLLATE WIN1252;');
    script.Add('ALTER TABLE CONFIGURACAO ADD AVISO_CONTA_VENCIDA_EMAIL3 VARCHAR(200) CHARACTER SET WIN1252 COLLATE WIN1252;');
    ExecuteSQL;
    SetaVersao;
  end;

  if versao_banco < '1.04.21' then
  begin
    script.Add('ALTER TABLE VEICULOS ADD PROXIMA_REVISAO_DATA Date;');
    script.Add('ALTER TABLE VEICULOS ADD PROXIMA_REVISAO_HODOMETRO Integer;');
    script.Add('ALTER TABLE CONFIGURACAO ADD CHECAR_REVISAO_VEICULO Char(1);');
    script.Add('ALTER TABLE PRODUTO ADD AVISO_REVISAO_VEICULO Char(1);');
    script.Add('ALTER TABLE PRODUTO ADD PROXIMA_REVISAO Integer;');
    script.Add('ALTER TABLE PRODUTO ADD TIPO_REVISAO Varchar(10); ');
    ExecuteSQL;
    SetaVersao;
  end;

  if versao_banco < '1.04.22' then
  begin
    script.Add('CREATE TABLE VENDAS1_ORIG '+
     ' ( '+
     '   NUMDOC Integer NOT NULL,  '+
     '   COD_REPRESENTANTE Integer,  '+
     '   DTADOC Date, '+
     '   HORA Time, '+
     '   COD_CLIENTE Integer, '+
     '   FATURADO Integer, '+
     '   COD_FOP Integer, '+
     '   COD_PRAZO_PGTO Integer, '+
     '   TOT_BRUTO Numeric(15,2), '+
     '   TOT_LIQUIDO Numeric(15,2), '+
     '   OBSERVACOES_PEDIDO Blob sub_type 1, '+
     '   USUARIO_CHECOU_PEDIDO_VENDEDOR Integer '+
     ' ); '+
     ' GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON VENDAS1_ORIG TO  SYSDBA WITH GRANT OPTION; ');

    script.Add('CREATE TABLE VENDAS2_ORIG '+
     ' ( '+
     '   ID Integer NOT NULL, '+
     '   NUMDOC Integer, '+
     '   COD_PRODUTO Integer, '+
     '   QTD Numeric(15,2), '+
     '   PRECO Numeric(15,4), '+
     '   SUB_TOTAL Numeric(15,4), '+
     '   PRECO_BRUTO Numeric(15,2), '+
     '   VOLUME Numeric(15,2), '+
     '   PROMOCAO Char(1), '+
     '   PRECO_CUSTO Numeric(15,2) '+
     ' ); '+
     ' GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE '+
     '  ON VENDAS2_ORIG TO  SYSDBA WITH GRANT OPTION; ');

    script.Add('ALTER TABLE PRODUTO ADD NAO_VALIDAR_MARGEM Char(1)');
    script.Add('ALTER TABLE PRODUTO ADD COMISSAO_FIXA Float;');
    script.Add('ALTER TABLE VENDAS2 ADD NAO_VALIDAR_MARGEM Char(1);');
    script.Add('CREATE INDEX IDX_VENDAS24 ON VENDAS2 (NAO_VALIDAR_MARGEM);');
    script.Add('ALTER TABLE CONFIGURACAO ADD VENDOR_PRAZO_ATUALIZAR Date;');
    script.Add('ALTER TABLE CONFIGURACAO ADD DATA_ULTIMO_ENVIO Date;');
    script.Add('DROP VIEW V_COMISSAO_NOVA;');
    script.Add('CREATE VIEW V_COMISSAO_NOVA (NUMDOC, NUMDOC_GRUPO, DTADOC, DTA_EMISSAO, TOT_LIQUIDO, DESCONTO_PEDIDO, VALOR_CR, COD_CLIENTE, NOM_CLIENTE, CODREP, COD_SUPERVISOR, NOM_REPRESENTANTE, NOM_BANCO, NR_BANCO, NR_AGENCIA, '+
               'NR_CONTA_CORRENTE, TITULAR_CONTA, EMAIL, FONE, CELULAR, VLR_COMISSAO, VLR_COMISSAO_FIXA, COMISSAO_DESC, FATURADO, SITUACAO, SUPERVISAO, PERC_COMISSAO, MARGEM_LUCRO) AS '+
               'select '+
               '  v.NUMDOC, '+
               '  v.numdoc_grupo, '+
               '  V.DTADOC, '+
               '  V.DTA_EMISSAO, '+
               '  V.TOT_LIQUIDO, '+
               '  ((V.TOT_BRUTO - V.TOT_LIQUIDO) / V.TOT_BRUTO)*100 AS DESCONTO_PEDIDO, '+
               '  case when v.NUMDOC_GRUPO is not null then (select case when v1.faturado = 1 then v.TOT_LIQUIDO else 0 end from vendas1 v1 where v1.NUMDOC = v.NUMDOC_GRUPO) else coalesce((select sum(valor) from cr1 as cr where cr.nr_documento = v.NUMDOC),0) - '+
               '  case when cd.UF <> ''SC'' and v.nfe is not null then v.VLR_ST else 0 end end as valor_cr, '+
               '  c.COD_CLIENTE, '+
               '  c.NOM_CLIENTE, '+
               '  r.id as codrep, '+
               '  v.COD_SUPERVISOR, '+
               '  r.NOM_REPRESENTANTE, b.NOM_BANCO, r.NR_BANCO,r.NR_AGENCIA,r.NR_CONTA_CORRENTE, R.TITULAR_CONTA, r.email, r.fone,r.celular, '+
               '  ( '+
               '   case when (case when v.NUMDOC_GRUPO is not null then (select case when v1.faturado = 1 then v.TOT_LIQUIDO else 0 end from vendas1 v1 where v1.NUMDOC = v.NUMDOC_GRUPO) else coalesce((select sum(valor) from cr1 as cr '+
               '      where cr.nr_documento = v.NUMDOC),0)  - case when cd.UF <> ''SC'' and v.nfe is not null then v.VLR_ST else 0 end end) > 0 '+
               '   then '+
               '     v.VLR_COMISSAO - ( v.VLR_COMISSAO * ((v.tot_LIQUIDO - (case when v.NUMDOC_GRUPO is not null then (select case when v1.faturado = 1 then v.TOT_LIQUIDO else 0 end from vendas1 v1 where v1.NUMDOC = v.NUMDOC_GRUPO) '+
               '     else coalesce((select sum(valor) from cr1 as cr where cr.nr_documento = v.NUMDOC),0) - '+
               '     case when cd.UF <> ''SC'' and v.nfe is not null then v.VLR_ST else 0 end end)) / V.TOT_LIQUIDO)) '+
               '   else '+
               '     V.VLR_COMISSAO '+
               '   end '+
               '  ) as VLR_COMISSAO, '+
               '  ( '+
               '   case when (case when v.NUMDOC_GRUPO is not null then (select case when v1.faturado = 1 then v.TOT_LIQUIDO else 0 end '+
               '              from vendas1 v1 where v1.NUMDOC = v.NUMDOC_GRUPO) else coalesce((select sum(valor) from cr1 as cr where cr.nr_documento = v.NUMDOC),0) - '+
               '     case when cd.UF <> ''SC'' and v.nfe is not null then v.VLR_ST else 0 end end) > 0 '+
               '   then (case when v.NUMDOC_GRUPO is not null then (select case when v1.faturado = 1 then v.TOT_LIQUIDO else 0 end from vendas1 v1 where v1.NUMDOC = v.NUMDOC_GRUPO) '+
               '   else coalesce((select sum(valor) from cr1 as cr where cr.nr_documento = v.NUMDOC),0) - '+
               '     case when cd.UF <> ''SC'' and v.nfe is not null then v.VLR_ST else 0 end end) '+
               '   else '+
               '   v.TOT_LIQUIDO '+
               '   end) * (CAST(r.perc_comissao_fixa AS NUMERIC(15,4))/100) as vlr_comissao_fixa, '+
               '  coalesce(( '+
               '    select '+
               '      sum(v2.SUB_TOTAL * '+
               '      ((case when r.FUNCIONARIO = 0 then (R.PERC_COMISSAO_FIXA - p.COMISSAO_INICIAL_OUTROS) else (R.PERC_COMISSAO_FIXA - p.COMISSAO_INICIAL_INTERNO) end )))/100  AS COMISSAO_DESC '+
               '    from '+
               '      produto p '+
               '    inner join vendas2 v2 on v2.COD_PRODUTO = p.COD_PRODUTO '+
               '    where '+
               '      v2.NAO_VALIDAR_MARGEM = ''S'' and v2.numdoc = v.numdoc '+
               '  ),0) AS COMISSAO_DESC, '+
               '  case when v.NUMDOC_GRUPO is not null then (select v1.faturado from vendas1 v1 where v1.NUMDOC = v.NUMDOC_GRUPO) else v.FATURADO end AS FATURADO, '+
               '  case when case when v.NUMDOC_GRUPO is not null then (select v1.faturado from vendas1 v1 where v1.NUMDOC = v.NUMDOC_GRUPO) else v.FATURADO end = ''0'' then ''ABERTO'' '+
               '  else case when case when v.NUMDOC_GRUPO is not null then (select v1.faturado from vendas1 v1 where v1.NUMDOC = v.NUMDOC_GRUPO) else v.FATURADO end = ''1'' then ''FATURADO'' '+
               '  else case when case when v.NUMDOC_GRUPO is not null then (select v1.faturado from vendas1 v1 where v1.NUMDOC = v.NUMDOC_GRUPO) else v.FATURADO end = ''2'' then ''CANCELADO'' end end end as SITUACAO, '+
               '  ''Não'' AS SUPERVISAO, '+
               '  V.perc_comissao, '+
               '  case when case when v.NUMDOC_GRUPO is not null then (select v1.faturado from vendas1 v1 where v1.NUMDOC = v.NUMDOC_GRUPO) else v.FATURADO end = 1 then '+
               '( '+
               '((case when v.NUMDOC_GRUPO is not null then (select case when v1.faturado = 1 then v.TOT_LIQUIDO else 0 end from vendas1 v1 where v1.NUMDOC = v.NUMDOC_GRUPO) '+
               ' else coalesce((select sum(valor) from cr1 as cr where cr.nr_documento = v.NUMDOC),0)  - case when cd.UF <> ''SC'' and v.nfe is not null then v.VLR_ST else 0 end end) '+
               '- '+
               '(select case when sum(v2.PRECO_CUSTO*v2.QTD) = 0 then sum(p.CUSTO_TOTAL*v2.QTD) else sum(v2.PRECO_CUSTO*v2.QTD) end from vendas2 v2 INNER JOIN PRODUTO P ON P.COD_PRODUTO = v2.COD_PRODUTO  where v2.NUMDOC = v.NUMDOC)) '+
               '/ '+
               '(select case when sum(v2.PRECO_CUSTO*v2.QTD) = 0 then sum(p.CUSTO_TOTAL*v2.QTD) else sum(v2.PRECO_CUSTO*v2.QTD) end from vendas2 v2 INNER JOIN PRODUTO P ON P.COD_PRODUTO = v2.COD_PRODUTO  where v2.NUMDOC = v.NUMDOC) '+
               ')*100 '+
               'else '+
               '(( '+
               ' v.tot_liquido '+
               '- '+
               '(select case when sum(v2.PRECO_CUSTO*v2.QTD) = 0 then sum(p.CUSTO_TOTAL*v2.QTD) else sum(v2.PRECO_CUSTO*v2.QTD) end from vendas2 v2 INNER JOIN PRODUTO P ON P.COD_PRODUTO = v2.COD_PRODUTO  where v2.NUMDOC = v.NUMDOC)) '+
               '/ '+
               '(select case when sum(v2.PRECO_CUSTO*v2.QTD) = 0 then sum(p.CUSTO_TOTAL*v2.QTD) else sum(v2.PRECO_CUSTO*v2.QTD) end from vendas2 v2 INNER JOIN PRODUTO P ON P.COD_PRODUTO = v2.COD_PRODUTO  where v2.NUMDOC = v.NUMDOC) '+
               ')*100 '+
               'end as margem_lucro '+
               'from vendas1 v '+
               'inner join cliente c on (c.COD_CLIENTE = v.cod_cliente) '+
               'left join CIDADES cd on cd.COD_CIDADE = c.COD_CIDADE '+
               'inner join REPRESENTANTE r on (r.ID = v.COD_REPRESENTANTE) '+
               'left join BANCO b on b.ID = r.NR_BANCO '+
               'where '+
               '  v.COD_FISCAL not in (''6152'', ''6409'') and '+
               '  (v.NFE_DEV is null or v.STATUS_NFE_DEV = 135) and '+
               '  v.consignacao <> ''1'' and '+
               '  v.orcamento=''0'' and '+
               '  v.cod_fop not in (''7'', ''9'') and '+
               '  v.TOT_LIQUIDO > 0 '+
               'union '+
               'select '+
               '  v.NUMDOC, '+
               '  v.numdoc_grupo, '+
               '  V.DTADOC, '+
               '  V.DTA_EMISSAO, '+
               '  V.TOT_LIQUIDO, '+
               '  ((V.TOT_BRUTO - V.TOT_LIQUIDO) / V.TOT_BRUTO)*100 AS DESCONTO_PEDIDO, '+
               '  case when v.NUMDOC_GRUPO is not null then (select case when v1.faturado = 1 then v.TOT_LIQUIDO else 0 end from vendas1 v1 where v1.NUMDOC = v.NUMDOC_GRUPO) '+
               '       else coalesce((select sum(valor) from cr1 as cr where cr.nr_documento = v.NUMDOC),0)  - case when cd.UF <> ''SC'' and v.nfe is not null then v.VLR_ST else 0 end end as valor_cr, '+
               '  c.COD_CLIENTE, '+
               '  c.NOM_CLIENTE, '+
               '  r.id as codrep, '+
               '  v.COD_SUPERVISOR, '+
               '  r.NOM_REPRESENTANTE, b.NOM_BANCO, r.NR_BANCO,r.NR_AGENCIA,r.NR_CONTA_CORRENTE, R.TITULAR_CONTA, r.email, r.fone,r.celular, '+
               '  ( '+
               '   case when (case when v.NUMDOC_GRUPO is not null then (select case when v1.faturado = 1 then v.TOT_LIQUIDO else 0 end from vendas1 v1 where v1.NUMDOC = v.NUMDOC_GRUPO) '+
               '        else coalesce((select sum(valor) from cr1 as cr where cr.nr_documento = v.NUMDOC),0)  - case when cd.UF <> ''SC'' and v.nfe is not null then v.VLR_ST else 0 end end) > 0 '+
               '   then '+
               '     v.VLR_COMISSAO - ( v.VLR_COMISSAO * ((v.tot_LIQUIDO - (case when v.NUMDOC_GRUPO is not null then (select case when v1.faturado = 1 then v.TOT_LIQUIDO else 0 end from vendas1 v1 where v1.NUMDOC = v.NUMDOC_GRUPO) '+
               '     else coalesce((select sum(valor) from cr1 as cr where cr.nr_documento = v.NUMDOC),0)  - case when cd.UF <> ''SC'' and v.nfe is not null then v.VLR_ST else 0 end end)) / V.TOT_LIQUIDO)) '+
               '   else '+
               '     V.VLR_COMISSAO '+
               '   end '+
               '  ) as VLR_COMISSAO, '+
               '  ( '+
               '   case when (case when v.NUMDOC_GRUPO is not null then (select case when v1.faturado = 1 then v.TOT_LIQUIDO else 0 end from vendas1 v1 where v1.NUMDOC = v.NUMDOC_GRUPO) '+
               '        else coalesce((select sum(valor) from cr1 as cr where cr.nr_documento = v.NUMDOC),0)  - case when cd.UF <> ''SC'' and v.nfe is not null then v.VLR_ST else 0 end end) > 0 '+
               '   then (case when v.NUMDOC_GRUPO is not null then (select case when v1.faturado = 1 then v.TOT_LIQUIDO else 0 end from vendas1 v1 where v1.NUMDOC = v.NUMDOC_GRUPO) '+
               '   else coalesce((select sum(valor) from cr1 as cr where cr.nr_documento = v.NUMDOC),0)  - case when cd.UF <> ''SC'' and v.nfe is not null then v.VLR_ST else 0 end end) '+
               '   else '+
               '   v.TOT_LIQUIDO '+
               '   end) * (CAST(r.perc_comissao_fixa AS NUMERIC(15,4))/100) as vlr_comissao_fixa, '+
               '  coalesce(( '+
               '    select '+
               '      sum(v2.SUB_TOTAL * '+
               '      ((case when r.FUNCIONARIO = 0 then (R.PERC_COMISSAO_FIXA - p.COMISSAO_INICIAL_OUTROS) else (R.PERC_COMISSAO_FIXA - p.COMISSAO_INICIAL_INTERNO) end )))/100  AS COMISSAO_DESC '+
               '    from '+
               '      produto p '+
               '    inner join vendas2 v2 on v2.COD_PRODUTO = p.COD_PRODUTO '+
               '    where '+
               '      v2.NAO_VALIDAR_MARGEM = ''S'' and v2.numdoc = v.numdoc '+
               '  ),0) AS COMISSAO_DESC, '+
               '  case when v.NUMDOC_GRUPO is not null then (select v1.faturado from vendas1 v1 where v1.NUMDOC = v.NUMDOC_GRUPO) else v.FATURADO end AS FATURADO, '+
               '  case when case when v.NUMDOC_GRUPO is not null then (select v1.faturado from vendas1 v1 where v1.NUMDOC = v.NUMDOC_GRUPO) else v.FATURADO end = ''0'' then ''ABERTO'' '+
               '       else case when case when v.NUMDOC_GRUPO is not null then (select v1.faturado from vendas1 v1 where v1.NUMDOC = v.NUMDOC_GRUPO) else v.FATURADO end = ''1'' then ''FATURADO'' '+
               '       else case when case when v.NUMDOC_GRUPO is not null then (select v1.faturado from vendas1 v1 where v1.NUMDOC = v.NUMDOC_GRUPO) else v.FATURADO end = ''2'' then ''CANCELADO'' end end end as SITUACAO, '+
               '  ''Sim'' AS SUPERVISAO, '+
               '  V.perc_comissao, '+
               '  case when case when v.NUMDOC_GRUPO is not null then (select v1.faturado from vendas1 v1 where v1.NUMDOC = v.NUMDOC_GRUPO) else v.FATURADO end = 1 then '+
               '( '+
               '((case when v.NUMDOC_GRUPO is not null then (select case when v1.faturado = 1 then v.TOT_LIQUIDO else 0 end from vendas1 v1 where v1.NUMDOC = v.NUMDOC_GRUPO) '+
               '  else coalesce((select sum(valor) from cr1 as cr where cr.nr_documento = v.NUMDOC),0)  - case when cd.UF <> ''SC'' and v.nfe is not null then v.VLR_ST else 0 end end) '+
               '- '+
               '(select case when sum(v2.PRECO_CUSTO*v2.QTD) = 0 then sum(p.CUSTO_TOTAL*v2.QTD) else sum(v2.PRECO_CUSTO*v2.QTD) end from vendas2 v2 INNER JOIN PRODUTO P ON P.COD_PRODUTO = v2.COD_PRODUTO  where v2.NUMDOC = v.NUMDOC)) '+
               '/ '+
               '(select case when sum(v2.PRECO_CUSTO*v2.QTD) = 0 then sum(p.CUSTO_TOTAL*v2.QTD) else sum(v2.PRECO_CUSTO*v2.QTD) end from vendas2 v2 INNER JOIN PRODUTO P ON P.COD_PRODUTO = v2.COD_PRODUTO  where v2.NUMDOC = v.NUMDOC) '+
               ')*100 '+
               'else '+
               '(( '+
               ' v.tot_liquido '+
               '- '+
               '(select case when sum(v2.PRECO_CUSTO*v2.QTD) = 0 then sum(p.CUSTO_TOTAL*v2.QTD) else sum(v2.PRECO_CUSTO*v2.QTD) end from vendas2 v2 INNER JOIN PRODUTO P ON P.COD_PRODUTO = v2.COD_PRODUTO  where v2.NUMDOC = v.NUMDOC)) '+
               '/ '+
               '(select case when sum(v2.PRECO_CUSTO*v2.QTD) = 0 then sum(p.CUSTO_TOTAL*v2.QTD) else sum(v2.PRECO_CUSTO*v2.QTD) end from vendas2 v2 INNER JOIN PRODUTO P ON P.COD_PRODUTO = v2.COD_PRODUTO  where v2.NUMDOC = v.NUMDOC) '+
               ')*100 end as margem_lucro '+
               'from vendas1 v '+
               'inner join cliente c on (c.COD_CLIENTE = v.cod_cliente) '+
               'left join CIDADES cd on cd.COD_CIDADE = c.COD_CIDADE '+
               'inner join REPRESENTANTE r on (r.ID = v.COD_SUPERVISOR) '+
               'left join BANCO b on b.ID = r.NR_BANCO '+
               'where '+
               '  v.COD_FISCAL not in (''6152'', ''6409'') and '+
               '  (v.NFE_DEV is null or v.STATUS_NFE_DEV = 135) and '+
               '  v.consignacao <> ''1'' and '+
               '  v.orcamento=''0'' and '+
               '  v.cod_fop not in (''7'', ''9'') and '+
               '  v.TOT_LIQUIDO > 0;');



    ExecuteSQL;
    SetaVersao;
  end;

  if versao_banco < '1.04.23' then
  begin
    script.Add('UPDATE MENU SET NIVEL = ''0'' WHERE NOM_MENU = ''Vendas..'';');
    script.Add('UPDATE MENU SET NIVEL = ''0'' WHERE NOM_MENU = ''Vendas Padrão (Simplificada)'';');
    script.Add('UPDATE MENU SET NIVEL = ''0'' WHERE NOM_MENU = ''Vendas Padrão (Detalhada)'';');

    if frpri.representacao then
      script.Add('SET GENERATOR GEN_VENDA1 TO 50000');

    ExecuteSQL;
    SetaVersao;
  end;

  if versao_banco < '1.04.24' then
  begin

    script.Add('ALTER TABLE PRODUTO_REPRESENTANTE ADD QTD_PROMOCAO Numeric(15,4);');
    script.Add('ALTER TABLE PRODUTO_REPRESENTANTE ADD PRECO_PROMOCAO Numeric(15,2);');


    ExecuteSQL;



    SetaVersao;
  end;

  if versao_banco < '1.04.25' then
  begin

    if frpri.representacao then
      script.Add('SET GENERATOR GEN_VENDA1 TO 58000');

    ExecuteSQL;

    SetaVersao;
  end;

  if versao_banco < '1.04.26' then
  begin
    script.Add('ALTER TABLE CONFIGURACAO ADD TIPO_ETIQUETA Integer;');
    script.Add('ALTER TABLE CONTA_CORRENTE ADD TIPO_COBRANCA Integer;');
    script.Add('ALTER TABLE PRODUTO_REPRESENTANTE ADD QTD_PROMOCAO NUMERIC(15, 4);');
    script.Add('ALTER TABLE PRODUTO_REPRESENTANTE ADD PRECO_PROMOCAO NUMERIC(15, 2);');
    script.Add('ALTER TABLE SUBCATEGORIA ADD ID_MARCA INTEGER;');
{    script.Add('CREATE VIEW ORDEM_CATALOGO( '+
               '  COD_SUBCATEG, '+
               '  DESC_SUBCATEG, '+
               '  COD_MARCA, '+
               '  DESC_MARCA, '+
               '  GRUPO, '+
               '  ESPACO) '+
               'AS '+
               '  select '+
               '   distinct '+
               '   s.ID cod_subcateg, '+
               '   s.SUBCATEGORIA desc_subcateg, '+
               '   S.ID_MARCA as cod_marca, '+
               '   m.NOM_MARCA as desc_marca, '+
               '   floor(((202.93* '+
               '      ((select count(*) from subcategoria sc where sc.SUBCATEGORIA < s.SUBCATEGORIA and sc.ID_MARCA = s.ID_MARCA )+1)) '+
               '      +((select count(*) from produto p1 where p1.subcategoria = s.id) * 13.23))/803.41)+1 as grupo, '+
               '      (( '+
               '        803.41 '+
               '        * '+
               '      (floor(((202.93* '+
               '      ((select count(*) from subcategoria sc where sc.SUBCATEGORIA < s.SUBCATEGORIA and sc.ID_MARCA = s.ID_MARCA )+1)) '+
               '      +((select count(*) from produto p1 where p1.subcategoria = s.id) * 13.23))/803.41)+1) '+
               '      ) '+
               '      - '+
               '      (202.93* '+
               '      ((select count(*) from subcategoria sc where sc.SUBCATEGORIA < s.SUBCATEGORIA and sc.ID_MARCA = s.ID_MARCA )+1)) '+
               '      +((select count(*) from produto p1 where p1.subcategoria = s.id) * 13.23)) as espaco '+
               '  from '+
               '    SUBCATEGORIA s '+
               '  inner join marcas m on m.ID = s.ID_MARCA '+
               '  order by '+
               '    m.NOM_MARCA, s.SUBCATEGORIA; '); }

    ExecuteSQL;

    SetaVersao;
  end;

  if versao_banco < '1.04.27' then
  begin
    script.Add('ALTER TABLE CONFIGURACAO ALTER FTP_SITE_USUARIO TYPE Varchar(100);');
    script.Add('CREATE TABLE CARTA_CORRECAO '+
               ' ( '+
               '  ID Integer NOT NULL, '+
               '  NUMDOC Integer NOT NULL, '+
               '  CARTACORRECAO Varchar(200) '+
               ' );');
    script.Add('ALTER TABLE CIDADES ADD POPULACAO BigInt;');
    script.Add('ALTER TABLE EMPRESA ADD EMAIL_SSL Char(1);');
    script.Add('ALTER TABLE CONFIGURACAO ADD INDUSTRIA Char(1);');

    ExecuteSQL;
    SetaVersao;
  end;


  if versao_banco < '1.04.28' then
  begin
    script.Add('UPDATE MENU SET NIVEL = ''0'' WHERE ID = ''1'';');
    script.Add('UPDATE MENU SET NIVEL = ''4'' WHERE ID = ''4'';');
    script.Add('UPDATE MENU SET NIVEL = ''3'' WHERE ID = ''855'';');
    script.Add('uPDATE MENU SET ID = ''619'', NOM_MENU = ''Serviços/Produtos não destinados para Revenda'', NIVEL = ''4'' WHERE ID = ''619'';');
    script.Add('UPDATE MENU SET ID = ''622'', NOM_MENU = ''Movimento de Prestação de Serviços/Entrada de Mercadorias Sem Revenda'', NIVEL = ''4'' WHERE ID = ''622'';');
    script.Add('UPDATE MENU SET ID = ''819'', NOM_MENU = ''Serviços/Produtos não destinados para Revenda'', NIVEL = ''4'' WHERE ID = ''819'';');
    script.Add('UPDATE MENU SET ID = ''820'', NOM_MENU = ''Movimento de Prestação de Serviços/Entrada de Mercadorias Sem Revenda'', NIVEL = ''4'' WHERE ID = ''820'';');
    script.Add('INSERT INTO MENU (NOM_MENU, NIVEL) VALUES (''Cliente - Pré-Cadastro'', ''0'');');
    ExecuteSQL;
    SetaVersao;
  end;

  if versao_banco < '1.04.29' then
  begin

    script.Add('update menu set nom_menu = ''Simplificado'' where id = 47;');
    script.Add('update menu set nom_menu = ''Completo'' where id = 48');
    script.Add('update menu set nom_menu = ''Ranking'' where id = 70');
    script.Add('update menu set nom_menu = ''Por Representante'' where id = 53');
    script.Add('INSERT INTO MENU (NOM_MENU, NIVEL) VALUES (''Clientes'', ''0'')');
    script.Add('ALTER TABLE EMPRESA ADD ALIQ_ICMS_SIMPLES Numeric(15,2);');
    script.Add('ALTER TABLE CIDADES ADD COD_SUPERVISOR Integer;');
    script.Add('ALTER TABLE EMPRESA ADD INDUSTRIA Char(1);');
    script.Add('ALTER TABLE PRODUTO ADD CUSTO_MATERIA_PRIMA Numeric(15,2);');
    script.Add('ALTER TABLE PRODUTO ADD CUSTO_MAO_DE_OBRA Numeric(15,2);');

    ExecuteSQL;
    SetaVersao;
  end;

  if versao_banco < '1.04.31' then
  begin

    script.Add('ALTER TABLE CONTA_CORRENTE ADD ANTECIPADO Char(1);');
    script.Add('ALTER TABLE CR1 ADD DESCONTADA Char(1);');
    script.Add('ALTER TABLE CR1 ADD PROTESTO Char(1);');

    ExecuteSQL;
    SetaVersao;
  end;

  if versao_banco < '1.04.32' then
  begin
    script.Add('ALTER TABLE REPRESENTANTE ALTER WEB_CIDADES_ATUACAO TYPE Varchar(900);');
    script.Add('CREATE TABLE PRODUTO_FORNECEDOR_UNIDADE '+
               ' ( '+
               '   PRODUTO_FORNECEDOR_ID INTEGER, '+
               '   UNIDADE Char(3) NOT NULL, '+
               '   QUANT_UNID Float, '+
               '   CONSTRAINT PK_PRODUTO_FORNECEDOR_UNIDADE PRIMARY KEY (PRODUTO_FORNECEDOR_ID, UNIDADE) '+
               ' ); '+
               ' GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE ON UNIDADE TO  SYSDBA WITH GRANT OPTION; ');

    ExecuteSQL;
    SetaVersao;
  end;

  if versao_banco < '1.04.33' then
  begin
    script.Add('ALTER TABLE CLIENTE ADD DESCONTO_ESPECIAL numeric(3,2);');
    script.Add('ALTER TABLE CLIENTE ADD TOTAL_CREDITO numeric(15,2);');
    ExecuteSQL;
    SetaVersao;
  end;

  if versao_banco < '1.04.35' then
  begin
    script.Add('ALTER TABLE REPRESENTANTE ADD MOBILE INTEGER;');
    script.Add('ALTER TABLE REPRESENTANTE ADD TIPO_COMISSAO Integer;');
    script.Add('ALTER TABLE REPRESENTANTE ADD MARGEM_PLR Numeric(3,2);');

    script.Add('CREATE TABLE INDICES_ANUAIS '+
               '( '+
               '  ANO Integer, '+
               '  SALARIO_MINIMO Numeric(15,2) '+
               ');');

    script.Add('CREATE TABLE REPRESENTANTE_TETO_COMISSAO '+
               '( '+
               '  ID Integer NOT NULL, '+
               '  ID_REPRESENTANTE Integer NOT NULL, '+
               '  TETO Numeric(15,2), '+
               '  COMISSAO Numeric(3,2), '+
               '  CONSTRAINT PK_REPRESENTANTE_TETO_COMISSAO PRIMARY KEY (ID) '+
               ');');

    script.Add('CREATE TABLE CONEXAO_VENDOR '+
               '( '+
               '  NR_CONEXAO Integer NOT NULL, '+
               '  COD_REPRESENTANTE Integer, '+
               '  DATA_CONEXAO Date, '+
               '  HORA_CONEXAO Time, '+
               '  TIPO VARCHAR(50), '+
               '  CONSTRAINT PK_CONEXAO_VENDOR PRIMARY KEY (NR_CONEXAO) '+
               ');');

    script.Add('CREATE GENERATOR GEN_CONEXAO; ');


    script.Add('SET TERM ^ ; '+
               '  CREATE TRIGGER TR_CONEXAO FOR CONEXAO_VENDOR ACTIVE '+
               '  BEFORE INSERT POSITION 0 '+
               '  AS '+
               '  begin '+
               '  if (new.NR_CONEXAO is null) then '+
               '  begin '+
               '    New.NR_CONEXAO = gen_id(gen_CONEXAO, 1); '+
               '  end '+
               'end^ ');

    ExecuteSQL;
    SetaVersao;
  end;

  if versao_banco < '1.04.37' then
  begin
    script.Add('ALTER TABLE CORES ADD COLOR Varchar(15);');
    script.Add('ALTER TABLE CATEGORIA ADD COR Integer;');
    script.Add('CREATE TABLE CLIENTE_PRODUTO '+
               '( '+
               '  COD_CLIENTE Integer NOT NULL, '+
               '  COD_PRODUTO Integer NOT NULL, '+
               '  LIMITE Integer '+
               '); ');
    ExecuteSQL;
    SetaVersao;
  end;

  if versao_banco < '1.04.38' then
  begin
    script.Add('CREATE TABLE PRODUTO_REPRESENTANTE_INATIVOS '+
               '( '+
               '  COD_PRODUTO Integer NOT NULL, '+
               '  ID_REPRESENTANTE Integer NOT NULL '+
               '); ');

    script.Add('CREATE TABLE NFE_REF_DEV '+
               '( '+
               '  ID INTEGER NOT NULL, '+
               '  NUMDOC INTEGER NOT NULL, '+
               '  CHAVE_NFE VARCHAR(44) CHARACTER SET WIN1252 COLLATE WIN1252 '+
               '); ');

    ExecuteSQL;
    SetaVersao;
  end;

  if versao_banco < '1.04.39' then
  begin
    script.Add('ALTER TABLE CONTA_CORRENTE ADD CODIGO_TRANSMISSAO Varchar(20);');

    ExecuteSQL;
    SetaVersao;
  end;

  if versao_banco < '1.04.40' then
  begin
    script.Add('ALTER TABLE CLIENTE ADD PERIODO_FREQUENCIA_VISITAS Varchar(50);');
    script.Add('ALTER TABLE CLIENTE ADD ULTIMA_FREQUENCIA Date;');

    script.Add('CREATE TABLE CLIENTE_VISITAS '+
               '( '+
               '  COD_CLIENTE Integer NOT NULL, '+
               '  DATA Date NOT NULL, '+
               '  VENDEU Char(1), '+
               '  ENVIADO Char(1), '+
               '  MOTIVO_N_VENDA Blob sub_type 0,  '+
               '  VALOR_PEDIDO Numeric(15,2), '+
               '  CONSTRAINT PK_CLIENTE_VISITAS_1 PRIMARY KEY (COD_CLIENTE,DATA) '+
               ');');

    ExecuteSQL;

    script.Clear;

    script.Add('UPDATE CLIENTE C set '+
               '  C.ULTIMA_FREQUENCIA = (SELECT max(V1.DTADOC) FROM VENDAS1 V1 WHERE V1.COD_CLIENTE = C.COD_CLIENTE), '+
               '  C.PERIODO_FREQUENCIA_VISITAS = 30; ');

    script.Add('INSERT INTO CLIENTE_VISITAS (COD_CLIENTE, DATA, VENDEU, VALOR_PEDIDO) '+
               'SELECT V1.COD_CLIENTE, V1.DTADOC, ''S'', SUM(V1.TOT_LIQUIDO) AS TOT_LIQUIDO '+
               'FROM VENDAS1 V1 '+
               'WHERE V1.COD_CLIENTE IS NOT NULL AND V1.DTADOC IS NOT NULL '+
               'GROUP BY COD_CLIENTE, DTADOC; ');

    ExecuteSQL;

    SetaVersao;
  end;

  if versao_banco < '1.04.41' then
  begin
    script.Add('ALTER TABLE ENTRADA1 ADD DESCONTO Numeric(15,2);');
    script.Add('CREATE TABLE ESTOQUE '+
               ' ( '+
               '   ID Integer NOT NULL, '+
               '   COD_PRODUTO Integer, '+
               '   DATA Date, '+
               '   CODIGO_CLIENTE_FORNECEDOR Integer, '+
               '   TIPO Varchar(50), '+
               '   DOCUMENTO Integer, '+
               '   qtd numeric(15,2), '+
               '   cont numeric(15,2), '+
               '   saldo numeric(15,2), '+
               '   CONSTRAINT PK_ESTOQUE PRIMARY KEY (ID) '+
               ' ); ');

    script.Add('CREATE GENERATOR GEN_ESTOQUE;');

    script.Add('SET TERM ^ ; '+
               'CREATE TRIGGER TR_ESTOQUE FOR ESTOQUE ACTIVE '+
               'BEFORE INSERT POSITION 0 '+
               'AS '+
               'begin '+
               '  If (new.id is null) then '+
               '  Begin '+
               '    New.id = gen_id(gen_estoque, 1); '+
               '  end '+
               'end^ '+
               'SET TERM ; ^ ');

    ExecuteSQL;
    SetaVersao;
  end;

  if versao_banco < '1.04.42' then
  begin
    script.Add('ALTER TABLE VENDAS1 ADD STATUS_NFE_EMAIL Char(1);');

    ExecuteSQL;
    SetaVersao;
  end;

  if versao_banco < '1.04.45' then
  begin
    script.Add('ALTER TABLE SUBCATEGORIA ADD video Varchar(200);');

    ExecuteSQL;
    SetaVersao;
  end;

  if versao_banco < '1.04.46' then
  begin
    script.Add('ALTER TABLE VENDAS2            ADD DESCONTO_VALOR_GERAL Numeric(14,2);');
    script.Add('ALTER TABLE VENDAS2            ADD CEST Varchar(10);');
    script.Add('ALTER TABLE NCM                ADD CEST Varchar(10);');
    script.Add('ALTER TABLE MVA                ADD CEST Varchar(10);');
    script.Add('ALTER TABLE MVA                ADD UF_ORIGEM Varchar(2);');
    script.Add('ALTER TABLE MVA                ADD ALIQ_ICMS Double precision;');
    script.Add('ALTER TABLE ICMS               ADD UF_ORIGEM Char(2);');
    script.Add('ALTER TABLE VENDAS1            ADD DESCONTO_GERAL Numeric(3,2);');
    script.Add('ALTER TABLE VENDAS1            ADD VLR_DESCOALIQ_ICMS Double precision;');
    script.Add('ALTER TABLE GRUPO              ADD CEST Varchar(10);');
    script.Add('ALTER TABLE PRODUTO            ADD CEST Varchar(10);');
    script.Add('ALTER TABLE VENDAS1            ADD VLR_DESCONTO_GERAL Numeric(14,2);');
    ExecuteSQL;
    SetaVersao;
  end;

  if versao_banco < '1.04.47' then
  begin
    script.Add('CREATE TABLE CLIENTE_CODEBAR '+
               ' ( '+
               '   COD_CLIENTE Integer NOT NULL, '+
               '   COD_BARRAS Char(23), '+
               '   COD_PRODUTO Integer NOT NULL, '+
               '   CONSTRAINT PK_CLIENTE_CODEBAR_1 PRIMARY KEY (COD_CLIENTE,COD_PRODUTO) '+
               ' ); ');

    script.Add('CREATE INDEX IDX_CLIENTE_CODEBAR1 ON CLIENTE_CODEBAR (COD_CLIENTE);');
    script.Add('CREATE INDEX IDX_CLIENTE_CODEBAR2 ON CLIENTE_CODEBAR (COD_PRODUTO);');

    ExecuteSQL;
    SetaVersao;
  end;

  if versao_banco < '1.04.48' then
  begin

    script.Add('ALTER TABLE PRODUTO ADD FREQUENCIA Varchar(10);');
    script.Add('ALTER TABLE PRODUTO ADD POTENCIA Varchar(10);');
    script.Add('ALTER TABLE PRODUTO ADD TENSAO Varchar(10);');
    script.Add('ALTER TABLE PRODUTO ADD CORRENTE Varchar(10);');
    script.Add('ALTER TABLE PRODUTO ADD PROCESSOS Blob;');
    script.Add('ALTER TABLE VENDAS1 ADD ATUALIZAR_ESTOQUE Char(1);');
    script.Add('ALTER TABLE VENDAS1 ADD PROCESSO_ID INTEGER;');

    script.Add('ALTER TABLE PRODUTO ADD CustoSubtotal NUMERIC(14,2)');
    script.Add('ALTER TABLE PRODUTO ADD EntST NUMERIC(14,2)');
    script.Add('ALTER TABLE PRODUTO ADD EntFrete NUMERIC(14,2)');
    script.Add('ALTER TABLE PRODUTO ADD EntIPI NUMERIC(14,2)');
    script.Add('ALTER TABLE PRODUTO ADD EntICMS NUMERIC(14,2)');



    script.Add('CREATE TABLE ESTRUTURA_PRODUTO '+
               '( '+
               '  COD_PRODUTO_ACABADO Integer NOT NULL, '+
               '  COD_PRODUTO_INSUMO Integer NOT NULL, '+
               '  ORDEM Integer, '+
               '  QUANTIDADE Numeric(15,2), '+
               '  CONSTRAINT PK_ESTRUTURA_PRODUTO_1 PRIMARY KEY (COD_PRODUTO_ACABADO,COD_PRODUTO_INSUMO) '+
               '); ');

    script.Add('CREATE TABLE ENTRADA_PRODUCAO '+
               '( '+
               '  CODIGO Integer NOT NULL, '+
               '  LOCAL Integer, '+
               '  DT_EMISSAO date, '+
               '  STATUS char(1), '+
               '  CONSTRAINT PK_ENTRADA_PRODUCAO PRIMARY KEY (CODIGO) '+
               '); ');

    script.Add('CREATE TABLE ENTRADA_PRODUCAO_ITEM '+
               '( '+
               '  CODIGO Integer NOT NULL, '+
               '  COD_PRODUTO Integer NOT NULL, '+
               '  QTDE Numeric(15,2), '+
               '  CONSTRAINT PK_ENTRADA_PRODUCAO_ITEM PRIMARY KEY (CODIGO,COD_PRODUTO) '+
               '); ');

    script.Add('CREATE TABLE SERIE_PRODUTO '+
              '( '+
              '  SERIE Integer NOT NULL, '+
              '  COD_PRODUTO Integer, '+
              '  CONSTRAINT PK_SERIE_PRODUTO PRIMARY KEY (SERIE) '+
              '); ');

    script.Add('CREATE TABLE SERIE_MOVIMENTO '+
              '( '+
              '  SERIE Integer NOT NULL, '+
              '  MOVIMENTO INTEGER, '+
              '  TIPO VARCHAR(20), '+
              '  CONSTRAINT PK_SERIE_MOVIMENTO PRIMARY KEY (SERIE, MOVIMENTO) '+
              '); ');

    script.Add('CREATE GENERATOR GEN_ENTRADA_PRODUCAO;');
    script.Add('CREATE GENERATOR GEN_SERIE_PRODUTO;');
    script.Add('CREATE GENERATOR GEN_PROCESSO_PEDIDO;');
    script.Add('CREATE GENERATOR GEN_HIST_PROCESSO_PEDIDO;');
    script.Add('CREATE GENERATOR GEN_ETAPA_PRODUCAO;');
    script.Add('CREATE GENERATOR GEN_PROCESSO_PRODUCAO;');

    script.Add('CREATE TABLE PROCESSO_PEDIDO '+
               '( '+
               '  ID Integer NOT NULL, '+
               '  STATUS Varchar(30) COLLATE WIN_PTBR, '+
               '  CONSTRAINT PK_PROCESSO_PEDIDO PRIMARY KEY (ID) '+
               '); ');

    script.Add('CREATE TABLE HIST_PROCESSO_PEDIDO '+
               '( '+
               '  ID Integer NOT NULL, '+
               '  PROCESSO_ID Integer NOT NULL, '+
               '  DATA date, '+
               '  HORA time, '+
               '  OBS Blob sub_type 1, '+
               '  CONSTRAINT PK_HIST_PROCESSO_PEDIDO PRIMARY KEY (ID) '+
               '); ');

    script.Add('SET TERM ^ ; '+
               'CREATE TRIGGER TR_HIST_PROCESSO_PEDIDO FOR HIST_PROCESSO_PEDIDO ACTIVE '+
               'BEFORE INSERT POSITION 0 '+
               'AS '+
               'begin '+
               '  if (new.id is null) then '+
               '  begin '+
               '    New.id = gen_id(gen_HIST_PROCESSO_PEDIDO, 1); '+
               '  end '+
               'end^ '+
               'SET TERM ; ^');

    script.Add('SET TERM ^ ; '+
               'CREATE TRIGGER TR_ETAPA_PRODUCAO FOR ETAPA_PRODUCAO ACTIVE '+
               'BEFORE INSERT POSITION 0 '+
               'AS '+
               'begin '+
               '  if (new.id is null) then '+
               '  begin '+
               '    New.id = gen_id(GEN_ETAPA_PRODUCAO, 1); '+
               '  end '+
               'end^ '+
               'SET TERM ; ^ ');

    script.Add('SET TERM ^ ; '+
               'CREATE TRIGGER TR_PROCESSO_PRODUCAO FOR PROCESSO_PRODUCAO ACTIVE '+
               'BEFORE INSERT POSITION 0 '+
               'AS '+
               'begin '+
               '  if (new.id is null) then '+
               '  begin '+
               '    New.id = gen_id(GEN_PROCESSO_PRODUCAO, 1); '+
               '  end '+
               'end^ '+
               'SET TERM ; ^ ');

    script.Add('CREATE TABLE ETAPA_PRODUCAO '+
               '( '+
               '  ID Integer NOT NULL, '+
               '  DESCRICAO Varchar(100) COLLATE WIN_PTBR, '+
               '  CUSTO NUMERIC(15,2), '+
               '  CONSTRAINT PK_ETAPA_PRODUCAO PRIMARY KEY (ID) '+
               '); ');

    script.Add('CREATE TABLE PROCESSO_PRODUCAO '+
               '( '+
               '  ID Integer NOT NULL, '+
               '  DESCRICAO Varchar(100) COLLATE WIN_PTBR, '+
               '  COD_PRODUTO INTEGER, '+
               '  ETAPA_ID INTEGER, '+
               '  TEMPO INTEGER, '+
               '  CUSTO_TOTAL NUMERIC(15,2), '+
               '  CONSTRAINT PK_PROCESSO_PRODUCAO PRIMARY KEY (ID) '+
               '); ');

    script.Add('ALTER TABLE PRODUTO ADD MATERIA_PRIMA Char(1);');
    script.Add('ALTER TABLE EMPRESA ADD PROX_NFE Integer;');

    script.Add('CREATE TABLE CLIENTE_NCM '+
               '( '+
               '  NCM Varchar(11) NOT NULL, '+
               '  CEST Varchar(10) NOT NULL, '+
               '  COD_CLIENTE INTEGER, '+
               '  TRIB_ICMS Char(2), '+
               '  COD_FISCAL_PRODUTO Char(5) '+
               '); ');

    ExecuteSQL;
    SetaVersao;
  end;

  script.Free;

end;




end.

