object Dm: TDm
  OldCreateOrder = False
  Height = 939
  Width = 1297
  object Q1_NF: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'select e1.nr_documento, e1.dta_documento,e1.cod_fornecedor, e1.v' +
        'l_total, e1.tot_itens from entrada1 e1')
    Left = 40
    Top = 320
    object Q1_NFnr_documento: TIntegerField
      FieldName = 'nr_documento'
      Origin = 'nr_documento'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object Q1_NFdta_documento: TDateField
      FieldName = 'dta_documento'
      Origin = 'dta_documento'
    end
    object Q1_NFcod_fornecedor: TIntegerField
      FieldName = 'cod_fornecedor'
      Origin = 'cod_fornecedor'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object Q1_NFvl_total: TBCDField
      FieldName = 'vl_total'
      Origin = 'vl_total'
      Precision = 15
      Size = 2
    end
    object Q1_NFtot_itens: TBCDField
      FieldName = 'tot_itens'
      Origin = 'tot_itens'
      Precision = 15
      Size = 2
    end
  end
  object DS_NF: TDataSource
    DataSet = Q1_NF
    Left = 40
    Top = 376
  end
  object Q_itens: TFDQuery
    MasterSource = DS_NF
    MasterFields = 'nr_documento;cod_fornecedor'
    Connection = dao.CN
    SQL.Strings = (
      
        'select e2.nr_documento, e2.cod_fornecedor, e2.cod_produto, p.ref' +
        '_fabrica,'
      
        'p.nom_produto,c.cor,t.tamanho,e2.qtd_entrada, e2.custo from entr' +
        'ada2 e2'
      'left join produto p on p.cod_produto = e2.cod_produto'
      'left join cores c on c.id = e2.id_cor'
      'left join tamanho t on t.id = e2.id_tamanho'
      
        'where e2.nr_documento=:nr_documento and e2.cod_fornecedor=:cod_f' +
        'ornecedor')
    Left = 120
    Top = 320
    ParamData = <
      item
        Name = 'NR_DOCUMENTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'COD_FORNECEDOR'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object Q_itensnr_documento: TIntegerField
      FieldName = 'nr_documento'
      Origin = 'nr_documento'
    end
    object Q_itenscod_fornecedor: TIntegerField
      FieldName = 'cod_fornecedor'
      Origin = 'cod_fornecedor'
    end
    object Q_itenscod_produto: TIntegerField
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
    end
    object Q_itensref_fabrica: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ref_fabrica'
      Origin = 'ref_fabrica'
      FixedChar = True
      Size = 15
    end
    object Q_itensnom_produto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_produto'
      Origin = 'nom_produto'
      Size = 100
    end
    object Q_itenscor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cor'
      Origin = 'cor'
      Size = 30
    end
    object Q_itenstamanho: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tamanho'
      Origin = 'tamanho'
      FixedChar = True
      Size = 25
    end
    object Q_itensqtd_entrada: TBCDField
      FieldName = 'qtd_entrada'
      Origin = 'qtd_entrada'
      Precision = 15
      Size = 2
    end
    object Q_itenscusto: TBCDField
      FieldName = 'custo'
      Origin = 'custo'
      Precision = 15
      Size = 2
    end
  end
  object DS_ITENS: TDataSource
    DataSet = Q_itens
    Left = 120
    Top = 376
  end
  object dst_itens: TfrxDBDataset
    UserName = 'dst_itens'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nr_documento=NR_DOCUMENTO'
      'cod_fornecedor=COD_FORNECEDOR'
      'cod_produto=COD_PRODUTO'
      'ref_fabrica=REF_FABRICA'
      'nom_produto=NOM_PRODUTO'
      'cor=COR'
      'tamanho=TAMANHO'
      'qtd_entrada=QTD_ENTRADA'
      'custo=CUSTO')
    DataSet = Q_itens
    BCDToCurrency = False
    Left = 120
    Top = 432
  end
  object dst_nf: TfrxDBDataset
    UserName = 'dst_nf'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nr_documento=NR_DOCUMENTO'
      'dta_documento=DTA_DOCUMENTO'
      'cod_fornecedor=COD_FORNECEDOR'
      'vl_total=VL_TOTAL'
      'tot_itens=TOT_ITENS')
    DataSet = Q1_NF
    BCDToCurrency = False
    Left = 40
    Top = 432
  end
  object q_separacao_carga: TFDQuery
    MasterSource = DS_NF
    Connection = dao.CN
    SQL.Strings = (
      
        'select p.cod_produto, p.nom_produto, p.cod_prateleira, sum(v2.qt' +
        'd) soma from vendas2 v2'
      'left join produto p on p.cod_produto=v2.cod_produto'
      'group by p.cod_produto, p.nom_produto, p.cod_prateleira')
    Left = 264
    Top = 320
    object q_separacao_cargacod_produto: TIntegerField
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
    end
    object q_separacao_carganom_produto: TStringField
      FieldName = 'nom_produto'
      Origin = 'nom_produto'
      Size = 100
    end
    object q_separacao_cargacod_prateleira: TStringField
      FieldName = 'cod_prateleira'
      Origin = 'cod_prateleira'
      FixedChar = True
      Size = 10
    end
    object q_separacao_cargasoma: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'soma'
      Origin = 'soma'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
  end
  object ds_separacao_carga: TDataSource
    DataSet = q_separacao_carga
    Left = 264
    Top = 376
  end
  object dst_separacao_carga: TfrxDBDataset
    UserName = 'dst_itens'
    CloseDataSource = True
    FieldAliases.Strings = (
      'cod_produto=COD_PRODUTO'
      'nom_produto=NOM_PRODUTO'
      'cod_prateleira=COD_PRATELEIRA'
      'soma=SOMA')
    DataSet = q_separacao_carga
    BCDToCurrency = False
    Left = 264
    Top = 432
  end
  object q_posicao_estoque: TFDQuery
    MasterSource = DS_NF
    Connection = dao.CN
    SQL.Strings = (
      'select pro.cod_produto,'
      '       pro.nom_produto,'
      '       pro.grade,'
      '       pro.qtd_estoque_min,'
      '       pro.qtd_estoque_max,       '
      '       pro.QTD_EMBALAGEM,'
      '       pro.UNIDADE,'
      '       coalesce(pro.qtd_estoque, 0) as qtd_estoque,'
      '       pro.qtd_reservado,'
      '       pro.cod_grupo,'
      '       cr.cor,'
      '       tm.tamanho,'
      '       gd.est_individual,'
      '       g.nom_grupo,'
      '       pro.preco_venda,'
      '       f.razao_social'
      'from produto pro'
      '     left join grade gd on gd.cod_produto = pro.cod_produto'
      '     left join cores cr on cr.id = gd.id_cor'
      '     left join tamanho tm on tm.id = gd.id_tamanho'
      
        '     left join fornecedor f on f.cod_fornecedor = pro.fornecedor' +
        '_principal'
      '     left join grupo g on g.cod_grupo = pro.cod_grupo'
      'where 1 = 1 and'
      '      cast (pro.cod_grupo as integer) in (923, 923)'
      'order by g.nom_grupo,'
      '         pro.nom_produto ')
    Left = 24
    Top = 16
    object q_posicao_estoquecod_produto: TIntegerField
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_posicao_estoquenom_produto: TStringField
      FieldName = 'nom_produto'
      Origin = 'nom_produto'
      Size = 100
    end
    object q_posicao_estoquegrade: TIntegerField
      FieldName = 'grade'
      Origin = 'grade'
    end
    object q_posicao_estoqueqtd_estoque_min: TBCDField
      FieldName = 'qtd_estoque_min'
      Origin = 'qtd_estoque_min'
      Precision = 15
      Size = 2
    end
    object q_posicao_estoqueqtd_estoque_max: TBCDField
      FieldName = 'qtd_estoque_max'
      Origin = 'qtd_estoque_max'
      Precision = 15
      Size = 2
    end
    object q_posicao_estoqueqtd_embalagem: TBCDField
      FieldName = 'qtd_embalagem'
      Origin = 'qtd_embalagem'
      Precision = 15
      Size = 3
    end
    object q_posicao_estoqueunidade: TStringField
      FieldName = 'unidade'
      Origin = 'unidade'
      FixedChar = True
      Size = 3
    end
    object q_posicao_estoqueqtd_estoque: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'qtd_estoque'
      Origin = 'qtd_estoque'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_posicao_estoqueqtd_reservado: TBCDField
      FieldName = 'qtd_reservado'
      Origin = 'qtd_reservado'
      Precision = 15
      Size = 2
    end
    object q_posicao_estoquecod_grupo: TIntegerField
      FieldName = 'cod_grupo'
      Origin = 'cod_grupo'
    end
    object q_posicao_estoquecor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cor'
      Origin = 'cor'
      Size = 30
    end
    object q_posicao_estoquetamanho: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tamanho'
      Origin = 'tamanho'
      FixedChar = True
      Size = 25
    end
    object q_posicao_estoqueest_individual: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'est_individual'
      Origin = 'est_individual'
      Precision = 15
      Size = 2
    end
    object q_posicao_estoquenom_grupo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_grupo'
      Origin = 'nom_grupo'
      Size = 100
    end
    object q_posicao_estoquepreco_venda: TBCDField
      FieldName = 'preco_venda'
      Origin = 'preco_venda'
      Precision = 15
    end
    object q_posicao_estoquerazao_social: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'razao_social'
      Origin = 'razao_social'
      Size = 200
    end
  end
  object ds_posicao_estoque: TDataSource
    DataSet = q_posicao_estoque
    Left = 32
    Top = 552
  end
  object dst_posicao_estoque: TfrxDBDataset
    UserName = 'dst_posicao_estoque'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cod_produto=COD_PRODUTO'
      'nom_produto=NOM_PRODUTO'
      'grade=GRADE'
      'qtd_estoque_min=qtd_estoque_min'
      'qtd_estoque_max=qtd_estoque_max'
      'qtd_embalagem=QTD_EMBALAGEM'
      'unidade=UNIDADE'
      'qtd_estoque=QTD_ESTOQUE'
      'qtd_reservado=QTD_RESERVADO'
      'cod_grupo=COD_GRUPO'
      'cor=COR'
      'tamanho=TAMANHO'
      'est_individual=EST_INDIVIDUAL'
      'nom_grupo=NOM_GRUPO'
      'preco_venda=PRECO_VENDA'
      'razao_social=RAZAO_SOCIAL')
    DataSet = q_posicao_estoque
    BCDToCurrency = False
    Left = 32
    Top = 608
  end
  object Q_consignacao: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'SELECT V2.COD_PRODUTO'
      '     , v2.COD_CLIENTE'
      '     , ID_COR'
      '     , ID_TAMANHO'
      '     , QTD'
      '     , PRECO'
      '     , SUB_TOTAL'
      '     , p.nom_produto'
      '     ,c.cor'
      '     ,t.tamanho, usu.logusu'
      
        '     ,cl.nom_cliente , v2.numdoc, v1.dta_vencimento_consig, v1.c' +
        'od_fop, fp.nom_fop,v2.qtd_devolvida, v1.dtadoc, v1.desconto, v1.' +
        'tot_liquido'
      'FROM VENDAS2 v2'
      'left join vendas1 v1 on v1.numdoc = v2.numdoc'
      'left join fop fp on fp.cod_fop = v1.cod_fop'
      'LEFT JOIN PRODUTO P ON P.COD_PRODUTO = V2.COD_PRODUTO'
      'left join cores c on c.id = v2.id_cor'
      'left join tamanho t on t.id = v2.id_tamanho'
      'left join cliente cl on cl.cod_cliente=v2.cod_cliente'
      
        'left join tbusu usu on cast(usu.codusu as INTEGER)=v1.cod_usuari' +
        'o'
      'order by v2.cod_cliente, v2.dtadoc')
    Left = 328
    Top = 496
    object Q_consignacaocod_produto: TIntegerField
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
    end
    object Q_consignacaocod_cliente: TIntegerField
      FieldName = 'cod_cliente'
      Origin = 'cod_cliente'
    end
    object Q_consignacaoid_cor: TIntegerField
      FieldName = 'id_cor'
      Origin = 'id_cor'
    end
    object Q_consignacaoid_tamanho: TIntegerField
      FieldName = 'id_tamanho'
      Origin = 'id_tamanho'
    end
    object Q_consignacaoqtd: TBCDField
      FieldName = 'qtd'
      Origin = 'qtd'
      Precision = 15
      Size = 2
    end
    object Q_consignacaopreco: TBCDField
      FieldName = 'preco'
      Origin = 'preco'
      Precision = 15
    end
    object Q_consignacaosub_total: TBCDField
      FieldName = 'sub_total'
      Origin = 'sub_total'
      Precision = 15
    end
    object Q_consignacaonom_produto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_produto'
      Origin = 'nom_produto'
      Size = 100
    end
    object Q_consignacaocor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cor'
      Origin = 'cor'
      Size = 30
    end
    object Q_consignacaotamanho: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tamanho'
      Origin = 'tamanho'
      FixedChar = True
      Size = 25
    end
    object Q_consignacaologusu: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'logusu'
      Origin = 'logusu'
      Size = 15
    end
    object Q_consignacaonom_cliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_cliente'
      Origin = 'nom_cliente'
      Size = 150
    end
    object Q_consignacaonumdoc: TIntegerField
      FieldName = 'numdoc'
      Origin = 'numdoc'
    end
    object Q_consignacaodta_vencimento_consig: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'dta_vencimento_consig'
      Origin = 'dta_vencimento_consig'
    end
    object Q_consignacaocod_fop: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_fop'
      Origin = 'cod_fop'
    end
    object Q_consignacaonom_fop: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_fop'
      Origin = 'nom_fop'
      Size = 60
    end
    object Q_consignacaoqtd_devolvida: TBCDField
      FieldName = 'qtd_devolvida'
      Origin = 'qtd_devolvida'
      Precision = 15
      Size = 2
    end
    object Q_consignacaodtadoc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'dtadoc'
      Origin = 'dtadoc'
    end
    object Q_consignacaodesconto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'desconto'
      Origin = 'desconto'
      Precision = 15
    end
    object Q_consignacaotot_liquido: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tot_liquido'
      Origin = 'tot_liquido'
      Precision = 15
    end
  end
  object ds_consignacao: TDataSource
    DataSet = Q_consignacao
    Left = 328
    Top = 552
  end
  object q_vendas2: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'SELECT * FROM (SELECT V2.COD_PRODUTO, v2.COD_CLIENTE, ID_COR, ID' +
        '_TAMANHO, QTD, PRECO, SUB_TOTAL, p.nom_produto,p.preco_venda, c.' +
        'cor, cl.telefone, cl.email,p.fornecedor_principal, t.tamanho,cl.' +
        'nom_cliente, v2.numdoc, v1.cod_fop, fp.nom_fop, v1.dtadoc, v1.de' +
        'sconto, v1.qtd_parcelas, v1.prazo_pgto, v1.tot_bruto, v2.preco_b' +
        'ruto, f.fantasia, e.nom_empresa, v2.desconto as desconto_item, v' +
        '1.tot_liquido, r.nom_representante, v1.credito_usado, m.nom_marc' +
        'a from vendas2 v2 left join vendas1 v1 on v1.numdoc = v2.numdoc ' +
        'left join fop fp on fp.cod_fop = v1.cod_fop LEFT JOIN PRODUTO P ' +
        'ON P.COD_PRODUTO = V2.COD_PRODUTO left join cores c on c.id = v2' +
        '.id_cor left join tamanho t on t.id = v2.id_tamanho left join cl' +
        'iente cl on cl.cod_cliente=v2.cod_cliente left join representant' +
        'e r on r.id=v1.cod_representante left join marcas m on m.id=p.id' +
        '_marca left join fornecedor f on f.cod_fornecedor=p.fornecedor_p' +
        'rincipal left join empresa e on e.cod_empresa = v1.empresa_fatur' +
        'ar where v1.dtadoc between '#39'01.08.2010'#39' and '#39'31.08.2010'#39' and v1.' +
        'consignacao<>'#39'1'#39' and v1.orcamento='#39'0'#39' and v1.cod_fop<>'#39'9'#39' and r.' +
        'id ='#39'30'#39' and faturado='#39'1'#39' UNION SELECT V2.COD_PRODUTO, v2.COD_CL' +
        'IENTE, ID_COR, ID_TAMANHO, QTD, PRECO, SUB_TOTAL, p.nom_produto,' +
        'p.preco_venda, c.cor, cl.telefone, cl.email,p.fornecedor_princip' +
        'al, t.tamanho,cl.nom_cliente, v2.numdoc, v1.cod_fop, fp.nom_fop,' +
        ' v1.dtadoc, v1.desconto, v1.qtd_parcelas, v1.prazo_pgto, v1.tot_' +
        'bruto, v2.preco_bruto, f.fantasia, e.nom_empresa, v2.desconto as' +
        ' desconto_item, v1.tot_liquido, r.nom_representante, v1.credito_' +
        'usado, m.nom_marca from vendas2 v2 left join vendas1 v1 on v1.nu' +
        'mdoc = v2.numdoc left join fop fp on fp.cod_fop = v1.cod_fop LEF' +
        'T JOIN PRODUTO P ON P.COD_PRODUTO = V2.COD_PRODUTO left join cor' +
        'es c on c.id = v2.id_cor left join tamanho t on t.id = v2.id_tam' +
        'anho left join cliente cl on cl.cod_cliente=v2.cod_cliente left ' +
        'join representante r on r.id=v1.cod_supervisor left join marcas ' +
        'm on m.id=p.id_marca left join fornecedor f on f.cod_fornecedor=' +
        'p.fornecedor_principal left join empresa e on e.cod_empresa = v1' +
        '.empresa_faturar where v1.dtadoc between '#39'01.08.2010'#39' and '#39'31.08' +
        '.2010'#39' and v1.consignacao<>'#39'1'#39' and v1.orcamento='#39'0'#39' and v1.cod_f' +
        'op<>'#39'9'#39' and r.id ='#39'30'#39' and faturado='#39'1'#39' ) Q1 order by nom_empres' +
        'a, nom_representante, fantasia, numdoc')
    Left = 448
    Top = 496
    object q_vendas2cod_produto: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
      ReadOnly = True
    end
    object q_vendas2cod_cliente: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_cliente'
      Origin = 'cod_cliente'
      ReadOnly = True
    end
    object q_vendas2id_cor: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id_cor'
      Origin = 'id_cor'
      ReadOnly = True
    end
    object q_vendas2id_tamanho: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id_tamanho'
      Origin = 'id_tamanho'
      ReadOnly = True
    end
    object q_vendas2qtd: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'qtd'
      Origin = 'qtd'
      ReadOnly = True
      Precision = 15
      Size = 2
    end
    object q_vendas2preco: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'preco'
      Origin = 'preco'
      ReadOnly = True
      Precision = 15
    end
    object q_vendas2sub_total: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'sub_total'
      Origin = 'sub_total'
      ReadOnly = True
      Precision = 15
    end
    object q_vendas2nom_produto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_produto'
      Origin = 'nom_produto'
      ReadOnly = True
      Size = 100
    end
    object q_vendas2preco_venda: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'preco_venda'
      Origin = 'preco_venda'
      ReadOnly = True
      Precision = 15
    end
    object q_vendas2cor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cor'
      Origin = 'cor'
      ReadOnly = True
      Size = 30
    end
    object q_vendas2telefone: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'telefone'
      Origin = 'telefone'
      ReadOnly = True
      FixedChar = True
      Size = 14
    end
    object q_vendas2email: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'email'
      Origin = 'email'
      ReadOnly = True
      Size = 50
    end
    object q_vendas2fornecedor_principal: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'fornecedor_principal'
      Origin = 'fornecedor_principal'
      ReadOnly = True
    end
    object q_vendas2tamanho: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tamanho'
      Origin = 'tamanho'
      ReadOnly = True
      FixedChar = True
      Size = 25
    end
    object q_vendas2nom_cliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_cliente'
      Origin = 'nom_cliente'
      ReadOnly = True
      Size = 150
    end
    object q_vendas2numdoc: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'numdoc'
      Origin = 'numdoc'
      ReadOnly = True
    end
    object q_vendas2cod_fop: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_fop'
      Origin = 'cod_fop'
      ReadOnly = True
    end
    object q_vendas2nom_fop: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_fop'
      Origin = 'nom_fop'
      ReadOnly = True
      Size = 60
    end
    object q_vendas2dtadoc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'dtadoc'
      Origin = 'dtadoc'
      ReadOnly = True
    end
    object q_vendas2desconto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'desconto'
      Origin = 'desconto'
      ReadOnly = True
      Precision = 15
    end
    object q_vendas2qtd_parcelas: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'qtd_parcelas'
      Origin = 'qtd_parcelas'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object q_vendas2prazo_pgto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'prazo_pgto'
      Origin = 'prazo_pgto'
      ReadOnly = True
      FixedChar = True
      Size = 30
    end
    object q_vendas2tot_bruto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tot_bruto'
      Origin = 'tot_bruto'
      ReadOnly = True
      Precision = 15
      Size = 2
    end
    object q_vendas2preco_bruto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'preco_bruto'
      Origin = 'preco_bruto'
      ReadOnly = True
      Precision = 15
      Size = 2
    end
    object q_vendas2fantasia: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fantasia'
      Origin = 'fantasia'
      ReadOnly = True
      Size = 200
    end
    object q_vendas2nom_empresa: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_empresa'
      Origin = 'nom_empresa'
      ReadOnly = True
      Size = 50
    end
    object q_vendas2desconto_item: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'desconto_item'
      Origin = 'desconto_item'
      ReadOnly = True
      Precision = 15
    end
    object q_vendas2tot_liquido: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tot_liquido'
      Origin = 'tot_liquido'
      ReadOnly = True
      Precision = 15
    end
    object q_vendas2nom_representante: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_representante'
      Origin = 'nom_representante'
      ReadOnly = True
      Size = 50
    end
    object q_vendas2credito_usado: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'credito_usado'
      Origin = 'credito_usado'
      ReadOnly = True
      Precision = 15
      Size = 2
    end
    object q_vendas2nom_marca: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_marca'
      Origin = 'nom_marca'
      ReadOnly = True
      Size = 40
    end
  end
  object ds_vendas2: TDataSource
    DataSet = q_vendas2
    Left = 448
    Top = 550
  end
  object dst_vendas2: TfrxDBDataset
    UserName = 'dst_vendas2'
    CloseDataSource = True
    FieldAliases.Strings = (
      'cod_produto=COD_PRODUTO'
      'cod_cliente=COD_CLIENTE'
      'id_cor=ID_COR'
      'id_tamanho=ID_TAMANHO'
      'qtd=QTD'
      'preco=PRECO'
      'sub_total=SUB_TOTAL'
      'nom_produto=NOM_PRODUTO'
      'preco_venda=PRECO_VENDA'
      'cor=COR'
      'telefone=TELEFONE'
      'email=EMAIL'
      'fornecedor_principal=FORNECEDOR_PRINCIPAL'
      'tamanho=TAMANHO'
      'nom_cliente=NOM_CLIENTE'
      'numdoc=NUMDOC'
      'cod_fop=COD_FOP'
      'nom_fop=NOM_FOP'
      'dtadoc=DTADOC'
      'desconto=DESCONTO'
      'qtd_parcelas=QTD_PARCELAS'
      'prazo_pgto=PRAZO_PGTO'
      'tot_bruto=TOT_BRUTO'
      'preco_bruto=PRECO_BRUTO'
      'fantasia=FANTASIA'
      'nom_empresa=NOM_EMPRESA'
      'desconto_item=DESCONTO_ITEM'
      'tot_liquido=TOT_LIQUIDO'
      'nom_representante=NOM_REPRESENTANTE'
      'credito_usado=CREDITO_USADO'
      'nom_marca=NOM_MARCA')
    DataSet = q_vendas2
    BCDToCurrency = False
    Left = 448
    Top = 608
  end
  object dst_consignacao: TfrxDBDataset
    UserName = 'dst_consignacao'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cod_produto=COD_PRODUTO'
      'cod_cliente=COD_CLIENTE'
      'id_cor=ID_COR'
      'id_tamanho=ID_TAMANHO'
      'qtd=QTD'
      'preco=PRECO'
      'sub_total=SUB_TOTAL'
      'nom_produto=NOM_PRODUTO'
      'cor=COR'
      'tamanho=TAMANHO'
      'logusu=LOGUSU'
      'nom_cliente=NOM_CLIENTE'
      'numdoc=NUMDOC'
      'dta_vencimento_consig=DTA_VENCIMENTO_CONSIG'
      'cod_fop=COD_FOP'
      'nom_fop=NOM_FOP'
      'qtd_devolvida=QTD_DEVOLVIDA'
      'dtadoc=DTADOC'
      'desconto=DESCONTO'
      'tot_liquido=TOT_LIQUIDO')
    OpenDataSource = False
    DataSet = Q_consignacao
    BCDToCurrency = False
    Left = 328
    Top = 608
  end
  object q_cheques: TFDQuery
    MasterSource = DS_NF
    Connection = dao.CN
    SQL.Strings = (
      'SELECT NR_CHEQUE'
      '     , NR_BANCO'
      '     , NR_AGENCIA'
      '     , NR_CONTA_CORRENTE'
      '     , DTA_EMISSAO'
      '     , DTA_VENCIMENTO'
      '     , NOM_TITULAR'
      '     , VALOR'
      '     , TITULO_CR1'
      '     , TITULO_CP1'
      '     , OBSERVACAO'
      'FROM CHEQUE_TERCEIROS')
    Left = 608
    Top = 496
    object q_chequesnr_cheque: TStringField
      FieldName = 'nr_cheque'
      Origin = 'nr_cheque'
      FixedChar = True
    end
    object q_chequesnr_banco: TStringField
      FieldName = 'nr_banco'
      Origin = 'nr_banco'
      FixedChar = True
      Size = 4
    end
    object q_chequesnr_agencia: TStringField
      FieldName = 'nr_agencia'
      Origin = 'nr_agencia'
      FixedChar = True
      Size = 10
    end
    object q_chequesnr_conta_corrente: TStringField
      FieldName = 'nr_conta_corrente'
      Origin = 'nr_conta_corrente'
      FixedChar = True
    end
    object q_chequesdta_emissao: TDateField
      FieldName = 'dta_emissao'
      Origin = 'dta_emissao'
    end
    object q_chequesdta_vencimento: TDateField
      FieldName = 'dta_vencimento'
      Origin = 'dta_vencimento'
    end
    object q_chequesnom_titular: TStringField
      FieldName = 'nom_titular'
      Origin = 'nom_titular'
      Size = 50
    end
    object q_chequesvalor: TBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Precision = 15
      Size = 2
    end
    object q_chequestitulo_cr1: TStringField
      FieldName = 'titulo_cr1'
      Origin = 'titulo_cr1'
    end
    object q_chequestitulo_cp1: TIntegerField
      FieldName = 'titulo_cp1'
      Origin = 'titulo_cp1'
    end
    object q_chequesobservacao: TMemoField
      FieldName = 'observacao'
      Origin = 'observacao'
      BlobType = ftMemo
    end
  end
  object ds_cheques: TDataSource
    DataSet = q_cheques
    Left = 608
    Top = 552
  end
  object dst_cheque: TfrxDBDataset
    UserName = 'dst_cheque'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nr_cheque=NR_CHEQUE'
      'nr_banco=NR_BANCO'
      'nr_agencia=NR_AGENCIA'
      'nr_conta_corrente=NR_CONTA_CORRENTE'
      'dta_emissao=DTA_EMISSAO'
      'dta_vencimento=DTA_VENCIMENTO'
      'nom_titular=NOM_TITULAR'
      'valor=VALOR'
      'titulo_cr1=TITULO_CR1'
      'titulo_cp1=TITULO_CP1'
      'observacao=OBSERVACAO')
    DataSet = q_cheques
    BCDToCurrency = False
    Left = 608
    Top = 608
  end
  object Q_controle_fretes: TFDQuery
    MasterSource = DS_NF
    Connection = dao.CN
    SQL.Strings = (
      
        'select ve1.numdoc,ve1.nf, ve1.nfe, ve1.dta_emissao, cli.nom_clie' +
        'nte, ve1.tot_liquido, tra.cod_transportadora, tra.nome ,'
      
        'cid.nom_cidade,cid.uf, ve1.vl_frete, ve1.contato_frete, fp.nom_f' +
        'op,pz.prazo, tra.OBS from vendas1 ve1'
      'left join cliente cli on ve1.cod_cliente=cli.cod_cliente'
      
        'left join transportadora tra on ve1.cod_transportadora=tra.cod_t' +
        'ransportadora'
      'left join cidades cid on cli.cod_cidade=cid.cod_cidade'
      'left join fop fp on ve1.cod_fop=fp.cod_fop'
      'left join prazo pz on pz.id=ve1.cod_prazo_pgto'
      'order by cli.nom_cliente')
    Left = 632
    Top = 496
    object Q_controle_fretesnumdoc: TIntegerField
      FieldName = 'numdoc'
      Origin = 'numdoc'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object Q_controle_fretesnf: TStringField
      FieldName = 'nf'
      Origin = 'nf'
      FixedChar = True
      Size = 9
    end
    object Q_controle_fretesnfe: TIntegerField
      FieldName = 'nfe'
      Origin = 'nfe'
    end
    object Q_controle_fretesdta_emissao: TDateField
      FieldName = 'dta_emissao'
      Origin = 'dta_emissao'
    end
    object Q_controle_fretesnom_cliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_cliente'
      Origin = 'nom_cliente'
      Size = 150
    end
    object Q_controle_fretestot_liquido: TBCDField
      FieldName = 'tot_liquido'
      Origin = 'tot_liquido'
      Precision = 15
    end
    object Q_controle_fretescod_transportadora: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_transportadora'
      Origin = 'cod_transportadora'
    end
    object Q_controle_fretesnome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object Q_controle_fretesnom_cidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_cidade'
      Origin = 'nom_cidade'
      Size = 40
    end
    object Q_controle_fretesuf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'uf'
      Origin = 'uf'
      FixedChar = True
      Size = 2
    end
    object Q_controle_fretesvl_frete: TBCDField
      FieldName = 'vl_frete'
      Origin = 'vl_frete'
      Precision = 15
      Size = 2
    end
    object Q_controle_fretescontato_frete: TStringField
      FieldName = 'contato_frete'
      Origin = 'contato_frete'
      Size = 50
    end
    object Q_controle_fretesnom_fop: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_fop'
      Origin = 'nom_fop'
      Size = 60
    end
    object Q_controle_fretesprazo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'prazo'
      Origin = 'prazo'
      Size = 40
    end
    object Q_controle_fretesobs: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'obs'
      Origin = 'obs'
    end
  end
  object ds_controle_fretes: TDataSource
    DataSet = Q_controle_fretes
    Left = 632
    Top = 552
  end
  object dst_controle_fretes: TfrxDBDataset
    UserName = 'dst_controle_fretes'
    CloseDataSource = False
    FieldAliases.Strings = (
      'numdoc=NUMDOC'
      'nf=NF'
      'nfe=NFE'
      'dta_emissao=DTA_EMISSAO'
      'nom_cliente=NOM_CLIENTE'
      'tot_liquido=TOT_LIQUIDO'
      'cod_transportadora=COD_TRANSPORTADORA'
      'nome=NOME'
      'nom_cidade=NOM_CIDADE'
      'uf=UF'
      'vl_frete=VL_FRETE'
      'contato_frete=CONTATO_FRETE'
      'nom_fop=NOM_FOP'
      'prazo=PRAZO'
      'obs=OBS')
    DataSet = Q_controle_fretes
    BCDToCurrency = False
    Left = 632
    Top = 608
  end
  object q_entradas: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'select e1.nr_documento,e1.dta_documento, e1.cod_fornecedor, fp.f' +
        'antasia as fantasia_produto, p.custo as custo_produto,'
      
        ' e.nom_empresa, e1.empresa_destino, e1.cod_fiscal, e1.tot_itens,' +
        ' e1.vl_total, '
      
        'e2.cod_produto, e2.custo, e2.qtd_entrada, e2.id_cor, e2.id_taman' +
        'ho, e2.cod_colecao,'
      
        'f.razao_social, f.fantasia, p.nom_produto, p.ref_fabrica, cr.cor' +
        ', tm.tamanho, cl.descricao as nom_colecao,'
      'm.nom_marca, e2.sub_total from entrada2 e2'
      
        'left join entrada1 e1 on (e1.nr_documento=e2.nr_documento) and (' +
        'e1.cod_fornecedor=e2.cod_fornecedor)  '
      'left join fornecedor f on f.cod_fornecedor=e1.cod_fornecedor'
      'left join produto p on p.cod_produto=e2.cod_produto'
      'left join cores cr on cr.id=e2.id_cor'
      'left join tamanho tm on tm.id=e2.id_tamanho'
      'left join colecao cl on cl.id=e2.cod_colecao'
      'left join marcas m on m.id=p.id_marca'
      'left join empresa e on e.cod_empresa = e1.empresa_destino'
      
        'left join fornecedor fp on fp.cod_fornecedor=p.fornecedor_princi' +
        'pal'
      ''
      ''
      '')
    Left = 400
    Top = 320
    object q_entradasnr_documento: TIntegerField
      FieldName = 'nr_documento'
      Origin = 'nr_documento'
    end
    object q_entradasdta_documento: TDateField
      FieldName = 'dta_documento'
      Origin = 'dta_documento'
    end
    object q_entradascod_fornecedor: TIntegerField
      FieldName = 'cod_fornecedor'
      Origin = 'cod_fornecedor'
    end
    object q_entradasfantasia_produto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fantasia_produto'
      Origin = 'fantasia_produto'
      Size = 200
    end
    object q_entradascusto_produto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'custo_produto'
      Origin = 'custo_produto'
      Precision = 15
      Size = 2
    end
    object q_entradasnom_empresa: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_empresa'
      Origin = 'nom_empresa'
      Size = 50
    end
    object q_entradasempresa_destino: TIntegerField
      FieldName = 'empresa_destino'
      Origin = 'empresa_destino'
    end
    object q_entradascod_fiscal: TStringField
      FieldName = 'cod_fiscal'
      Origin = 'cod_fiscal'
      FixedChar = True
      Size = 5
    end
    object q_entradastot_itens: TBCDField
      FieldName = 'tot_itens'
      Origin = 'tot_itens'
      Precision = 15
      Size = 2
    end
    object q_entradasvl_total: TBCDField
      FieldName = 'vl_total'
      Origin = 'vl_total'
      Precision = 15
      Size = 2
    end
    object q_entradascod_produto: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
    end
    object q_entradascusto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'custo'
      Origin = 'custo'
      Precision = 15
      Size = 2
    end
    object q_entradasqtd_entrada: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'qtd_entrada'
      Origin = 'qtd_entrada'
      Precision = 15
      Size = 2
    end
    object q_entradasid_cor: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id_cor'
      Origin = 'id_cor'
    end
    object q_entradasid_tamanho: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id_tamanho'
      Origin = 'id_tamanho'
    end
    object q_entradascod_colecao: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_colecao'
      Origin = 'cod_colecao'
    end
    object q_entradasrazao_social: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'razao_social'
      Origin = 'razao_social'
      Size = 200
    end
    object q_entradasfantasia: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fantasia'
      Origin = 'fantasia'
      Size = 200
    end
    object q_entradasnom_produto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_produto'
      Origin = 'nom_produto'
      Size = 100
    end
    object q_entradasref_fabrica: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ref_fabrica'
      Origin = 'ref_fabrica'
      FixedChar = True
      Size = 15
    end
    object q_entradascor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cor'
      Origin = 'cor'
      Size = 30
    end
    object q_entradastamanho: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tamanho'
      Origin = 'tamanho'
      FixedChar = True
      Size = 25
    end
    object q_entradasnom_colecao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_colecao'
      Origin = 'nom_colecao'
      Size = 50
    end
    object q_entradasnom_marca: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_marca'
      Origin = 'nom_marca'
      Size = 40
    end
    object q_entradassub_total: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'sub_total'
      Origin = 'sub_total'
      Precision = 15
      Size = 2
    end
  end
  object ds_entradas: TDataSource
    DataSet = q_entradas
    Left = 400
    Top = 376
  end
  object dst_entradas: TfrxDBDataset
    UserName = 'dst_entradas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nr_documento=NR_DOCUMENTO'
      'dta_documento=DTA_DOCUMENTO'
      'cod_fornecedor=COD_FORNECEDOR'
      'fantasia_produto=FANTASIA_PRODUTO'
      'custo_produto=CUSTO_PRODUTO'
      'nom_empresa=NOM_EMPRESA'
      'empresa_destino=EMPRESA_DESTINO'
      'cod_fiscal=COD_FISCAL'
      'tot_itens=TOT_ITENS'
      'vl_total=VL_TOTAL'
      'cod_produto=COD_PRODUTO'
      'custo=CUSTO'
      'qtd_entrada=QTD_ENTRADA'
      'id_cor=ID_COR'
      'id_tamanho=ID_TAMANHO'
      'cod_colecao=COD_COLECAO'
      'razao_social=RAZAO_SOCIAL'
      'fantasia=FANTASIA'
      'nom_produto=NOM_PRODUTO'
      'ref_fabrica=REF_FABRICA'
      'cor=COR'
      'tamanho=TAMANHO'
      'nom_colecao=NOM_COLECAO'
      'nom_marca=NOM_MARCA'
      'sub_total=SUB_TOTAL')
    DataSet = q_entradas
    BCDToCurrency = False
    Left = 400
    Top = 432
  end
  object q_pedidos: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'Select p1.*, p2.nom_produto, p2.ref_fabrica, p2.unidade, p2.qtd_' +
        'embalagem,'
      'p2.qtd, p2.cor, p2.tamanho, p2.custo_bruto, p2.desconto, '
      'p2.custo_liquido, p2.marckup, p2.preco_venda,'
      ' cl.id, cl.descricao, f.cod_fornecedor, '
      'f.fantasia, f.razao_social from pedidos1 p1 '
      
        'left join pedidos2 p2 on (p2.nr_documento = p1.nr_documento) and' +
        ' (p2.cod_fornecedor = p1.cod_fornecedor) '
      'left join colecao cl on cl.id = p1.cod_colecao '
      'left join fornecedor f on f.cod_fornecedor = p1.cod_fornecedor ')
    Left = 512
    Top = 320
    object q_pedidosnr_documento: TIntegerField
      FieldName = 'nr_documento'
      Origin = 'nr_documento'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_pedidoscod_fornecedor: TIntegerField
      FieldName = 'cod_fornecedor'
      Origin = 'cod_fornecedor'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_pedidosdta_pedido: TDateField
      FieldName = 'dta_pedido'
      Origin = 'dta_pedido'
    end
    object q_pedidoscod_colecao: TIntegerField
      FieldName = 'cod_colecao'
      Origin = 'cod_colecao'
    end
    object q_pedidosnr_pedido_fornecedor: TIntegerField
      FieldName = 'nr_pedido_fornecedor'
      Origin = 'nr_pedido_fornecedor'
    end
    object q_pedidosprazo_maximo: TIntegerField
      FieldName = 'prazo_maximo'
      Origin = 'prazo_maximo'
    end
    object q_pedidosprevisao_entrega: TDateField
      FieldName = 'previsao_entrega'
      Origin = 'previsao_entrega'
    end
    object q_pedidostipo_pedido: TStringField
      FieldName = 'tipo_pedido'
      Origin = 'tipo_pedido'
      Size = 6
    end
    object q_pedidosfinalizado: TStringField
      FieldName = 'finalizado'
      Origin = 'finalizado'
      FixedChar = True
      Size = 1
    end
    object q_pedidosobs: TMemoField
      FieldName = 'obs'
      Origin = 'obs'
      BlobType = ftMemo
    end
    object q_pedidostotal_custo: TBCDField
      FieldName = 'total_custo'
      Origin = 'total_custo'
      Precision = 15
      Size = 2
    end
    object q_pedidostotal_venda: TBCDField
      FieldName = 'total_venda'
      Origin = 'total_venda'
      Precision = 15
      Size = 2
    end
    object q_pedidosnom_produto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_produto'
      Origin = 'nom_produto'
      Size = 50
    end
    object q_pedidosref_fabrica: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ref_fabrica'
      Origin = 'ref_fabrica'
      FixedChar = True
      Size = 15
    end
    object q_pedidosunidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'unidade'
      Origin = 'unidade'
      FixedChar = True
      Size = 3
    end
    object q_pedidosqtd_embalagem: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'qtd_embalagem'
      Origin = 'qtd_embalagem'
      Precision = 15
      Size = 2
    end
    object q_pedidosqtd: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'qtd'
      Origin = 'qtd'
      Precision = 15
      Size = 2
    end
    object q_pedidoscor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cor'
      Origin = 'cor'
    end
    object q_pedidostamanho: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tamanho'
      Origin = 'tamanho'
      Size = 15
    end
    object q_pedidoscusto_bruto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'custo_bruto'
      Origin = 'custo_bruto'
      Precision = 15
      Size = 2
    end
    object q_pedidosdesconto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'desconto'
      Origin = 'desconto'
      Precision = 15
      Size = 2
    end
    object q_pedidoscusto_liquido: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'custo_liquido'
      Origin = 'custo_liquido'
      Precision = 15
      Size = 2
    end
    object q_pedidosmarckup: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'marckup'
      Origin = 'marckup'
      Precision = 15
      Size = 2
    end
    object q_pedidospreco_venda: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'preco_venda'
      Origin = 'preco_venda'
      Precision = 15
      Size = 2
    end
    object q_pedidosid: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id'
      Origin = 'id'
    end
    object q_pedidosdescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 50
    end
    object q_pedidoscod_fornecedor_1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_fornecedor_1'
      Origin = 'cod_fornecedor'
    end
    object q_pedidosfantasia: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fantasia'
      Origin = 'fantasia'
      Size = 200
    end
    object q_pedidosrazao_social: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'razao_social'
      Origin = 'razao_social'
      Size = 200
    end
  end
  object ds_pedidos: TDataSource
    DataSet = q_pedidos
    Left = 512
    Top = 376
  end
  object dst_pedidos: TfrxDBDataset
    UserName = 'dst_pedidos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nr_documento=NR_DOCUMENTO'
      'cod_fornecedor=COD_FORNECEDOR'
      'dta_pedido=DTA_PEDIDO'
      'cod_colecao=COD_COLECAO'
      'nr_pedido_fornecedor=NR_PEDIDO_FORNECEDOR'
      'prazo_maximo=PRAZO_MAXIMO'
      'previsao_entrega=PREVISAO_ENTREGA'
      'tipo_pedido=TIPO_PEDIDO'
      'finalizado=FINALIZADO'
      'obs=OBS'
      'total_custo=TOTAL_CUSTO'
      'total_venda=TOTAL_VENDA'
      'nom_produto=NOM_PRODUTO'
      'ref_fabrica=REF_FABRICA'
      'unidade=UNIDADE'
      'qtd_embalagem=QTD_EMBALAGEM'
      'qtd=QTD'
      'cor=COR'
      'tamanho=TAMANHO'
      'custo_bruto=CUSTO_BRUTO'
      'desconto=DESCONTO'
      'custo_liquido=CUSTO_LIQUIDO'
      'marckup=MARCKUP'
      'preco_venda=PRECO_VENDA'
      'id=ID'
      'descricao=DESCRICAO'
      'cod_fornecedor_1=COD_FORNECEDOR_1'
      'fantasia=FANTASIA'
      'razao_social=RAZAO_SOCIAL')
    DataSet = q_pedidos
    BCDToCurrency = False
    Left = 512
    Top = 432
  end
  object q_cliente: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'select c.cod_cidade, c.cod_empresa, c.nom_cliente, c.cod_cliente' +
        ', c.nom_fantasia, c.endereco, c.NR_ENDERECO, c.cod_cidade, c.bai' +
        'rro, c.cep, c.telefone,'
      
        'c.email, c.dta_aniversario, e.nom_empresa, cd.nom_cidade, cd.uf,' +
        ' c.contato,'
      'case when c.TIP_PESSOA = '#39'J'#39' THEN c.CNPJ ELSE c.CPF END AS CNPJ,'
      'case when c.TIP_PESSOA = '#39'J'#39' THEN c.IE ELSE c.RG END AS IE'
      'from cliente c '
      'left join cidades cd on cd.cod_cidade = c.cod_cidade '
      'left join empresa e on e.cod_empresa = c.cod_empresa ')
    Left = 56
    Top = 8
    object q_clientecod_cidade: TIntegerField
      FieldName = 'cod_cidade'
      Origin = 'cod_cidade'
    end
    object q_clientecod_empresa: TIntegerField
      FieldName = 'cod_empresa'
      Origin = 'cod_empresa'
    end
    object q_clientenom_cliente: TStringField
      FieldName = 'nom_cliente'
      Origin = 'nom_cliente'
      Size = 150
    end
    object q_clientecod_cliente: TIntegerField
      FieldName = 'cod_cliente'
      Origin = 'cod_cliente'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_clientenom_fantasia: TStringField
      FieldName = 'nom_fantasia'
      Origin = 'nom_fantasia'
      Size = 60
    end
    object q_clienteendereco: TStringField
      FieldName = 'endereco'
      Origin = 'endereco'
      Size = 200
    end
    object q_clientenr_endereco: TStringField
      FieldName = 'nr_endereco'
      Origin = 'nr_endereco'
      Size = 10
    end
    object q_clientecod_cidade_1: TIntegerField
      FieldName = 'cod_cidade_1'
      Origin = 'cod_cidade'
    end
    object q_clientebairro: TStringField
      FieldName = 'bairro'
      Origin = 'bairro'
      Size = 30
    end
    object q_clientecep: TStringField
      FieldName = 'cep'
      Origin = 'cep'
      FixedChar = True
      Size = 10
    end
    object q_clientetelefone: TStringField
      FieldName = 'telefone'
      Origin = 'telefone'
      FixedChar = True
      Size = 14
    end
    object q_clienteemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 50
    end
    object q_clientedta_aniversario: TStringField
      FieldName = 'dta_aniversario'
      Origin = 'dta_aniversario'
      FixedChar = True
      Size = 7
    end
    object q_clientenom_empresa: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_empresa'
      Origin = 'nom_empresa'
      Size = 50
    end
    object q_clientenom_cidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_cidade'
      Origin = 'nom_cidade'
      Size = 40
    end
    object q_clienteuf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'uf'
      Origin = 'uf'
      FixedChar = True
      Size = 2
    end
    object q_clientecontato: TStringField
      FieldName = 'contato'
      Origin = 'contato'
      Size = 30
    end
    object q_clientecnpj: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cnpj'
      Origin = 'cnpj'
      ReadOnly = True
      FixedChar = True
      Size = 40
    end
    object q_clienteie: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ie'
      Origin = 'ie'
      ReadOnly = True
      FixedChar = True
      Size = 40
    end
  end
  object ds_cliente: TDataSource
    DataSet = q_cliente
    Left = 24
    Top = 64
  end
  object dst_cliente: TfrxDBDataset
    UserName = 'dst_cliente'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cod_cidade=COD_CIDADE'
      'cod_empresa=COD_EMPRESA'
      'nom_cliente=NOM_CLIENTE'
      'cod_cliente=COD_CLIENTE'
      'nom_fantasia=NOM_FANTASIA'
      'endereco=ENDERECO'
      'nr_endereco=NR_ENDERECO'
      'cod_cidade_1=COD_CIDADE_1'
      'bairro=BAIRRO'
      'cep=CEP'
      'telefone=TELEFONE'
      'email=EMAIL'
      'dta_aniversario=DTA_ANIVERSARIO'
      'nom_empresa=NOM_EMPRESA'
      'nom_cidade=NOM_CIDADE'
      'uf=UF'
      'contato=CONTATO'
      'cnpj=CNPJ'
      'ie=IE')
    DataSet = q_cliente
    BCDToCurrency = False
    Left = 64
    Top = 128
  end
  object q_pauta_venda: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'select distinct cod_produto, nom_produto, unidade, qtd_embalagem' +
        ', promocao, preco_venda, g.cod_grupo, g.nom_grupo, qtd_estoque, '
      
        '    n.uf, coalesce(p.NCM, g.ncm) as ncm, n.mva, n.ALIQ_ICMS_INTE' +
        'RNA,'
      '    i.icms as aliq_ICMS,'
      '    p.codigo_barra, '
      '    (p.preco_venda * (i.icms/100)) as vlr_icms,'
      '    (p.preco_venda * (1 + (n.MVA/100))) as bc_st, '
      
        '    (p.preco_venda * (1 + (n.MVA/100))) * (n.ALIQ_ICMS_INTERNA/1' +
        '00) as parc_st,'
      
        '    ((p.preco_venda * (1 + (n.MVA/100))) * (n.ALIQ_ICMS_INTERNA/' +
        '100)) - (p.preco_venda * (i.icms/100)) as vlr_st,'
      
        '    (((((p.preco_venda * (1 + (n.MVA/100))) * (n.ALIQ_ICMS_INTER' +
        'NA/100)) - (p.preco_venda * (i.icms/100))) / p.PRECO_VENDA) * 10' +
        '0) as perc_st,'
      '    p.CODIGO_BARRA,'
      '    n.NCM, '
      '    n.CEST, '
      '    n.UF_ORIGEM as ORIGEM, '
      '    n.UF AS DESTINO, '
      '    n.MVA, '
      '                case when p.preco_venda = 0 '
      '                     then 0 '
      '                     else '
      '                       case when n.MVA = 0 '
      '                            then 0  '
      '                            else '
      '                              ( '
      '                               ( '
      '                                ( '
      '                                 ( '
      
        '                                  (p.preco_venda * (1 + (n.MVA/1' +
        '00))) * (n.ALIQ_ICMS_INTERNA/100) '
      '                                 ) '
      '                                 - '
      '                                 (p.preco_venda * (i.icms/100)) '
      '                                ) '
      '                                / '
      '                                p.PRECO_VENDA '
      '                               ) '
      '                               * 100 '
      '                              ) '
      '                            end '
      '                     end '
      '             as perc_st '
      '    from produto p  '
      '    inner join grupo g on g.cod_grupo=p.cod_grupo  '
      
        '    left outer join mva n on (n.CEST = coalesce(p.CEST, g.CEST) ' +
        'and '
      
        '                         (                                      ' +
        '                    '
      
        '                          n.ncm = coalesce(p.NCM, g.ncm) or     ' +
        '                    '
      
        '                          n.ncm = substring(coalesce(p.NCM, g.nc' +
        'm) from 1 for 9) or '
      
        '                          n.ncm = substring(coalesce(p.NCM, g.nc' +
        'm) from 1 for 8) or '
      
        '                          n.ncm = substring(coalesce(p.NCM, g.nc' +
        'm) from 1 for 7) or '
      
        '                          n.ncm = substring(coalesce(p.NCM, g.nc' +
        'm) from 1 for 6) or '
      
        '                          n.ncm = substring(coalesce(p.NCM, g.nc' +
        'm) from 1 for 5) or '
      
        '                          n.ncm = substring(coalesce(p.NCM, g.nc' +
        'm) from 1 for 4) '
      
        '                         ))                                     ' +
        '             '
      
        '    left outer join icms i on (i.UF = n.UF and i.UF_ORIGEM = n.U' +
        'F_ORIGEM) '
      ''
      '    where 1 = 1 '
      '')
    Left = 112
    Top = 16
  end
  object ds_pauta_venda: TDataSource
    DataSet = q_pauta_venda
    Left = 112
    Top = 64
  end
  object dst_pauta_venda: TfrxDBDataset
    UserName = 'dst_pauta_venda'
    CloseDataSource = False
    DataSet = q_pauta_venda
    BCDToCurrency = False
    Left = 120
    Top = 120
  end
  object q_carga: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'select v1.nfe,'
      '  v1.numdoc,'
      '  v1.DTA_EMISSAO as dtadoc,'
      '  v1.volume_nota,'
      '  cl.nom_cliente,'
      '  cd.nom_cidade||'#39'-'#39'||cd.uf as cidade,'
      '  v1.tot_liquido,'
      '  f.nom_fop,'
      '  c1.id,'
      '  c1.dta_carga,'
      '  c1.nom_carga,'
      '  c1.tot_peso,'
      '  c1.tot_carga,'
      '  c1.tot_frete,'
      '  v.nom_veiculo,'
      '  m.nome as nom_motorista,'
      '  t.nome as nom_transportadora'
      'from carga1 c1'
      
        '  left join vendas1 v1 on v1.cod_carga = cast (c1.id as VARCHAR ' +
        '(20))'
      '  left join fop f on f.cod_fop = v1.cod_fop'
      '  left join cliente cl on cl.cod_cliente = v1.cod_cliente'
      '  left join cidades cd on cd.cod_cidade = cl.cod_cidade'
      '  left join veiculos v on v.id = c1.id_veiculo'
      '  left join motorista m on m.id = c1.id_motorista'
      
        '  left join transportadora t on t.cod_transportadora = c1.cod_tr' +
        'ansportadora'
      'where c1.id = 706'
      'order by nom_cliente ')
    Left = 632
    Top = 320
    object q_carganfe: TIntegerField
      FieldName = 'nfe'
      Origin = 'nfe'
    end
    object q_carganumdoc: TIntegerField
      FieldName = 'numdoc'
      Origin = 'numdoc'
    end
    object q_cargadtadoc: TDateField
      FieldName = 'dtadoc'
      Origin = 'dtadoc'
    end
    object q_cargavolume_nota: TBCDField
      FieldName = 'volume_nota'
      Origin = 'volume_nota'
      Precision = 15
      Size = 2
    end
    object q_carganom_cliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_cliente'
      Origin = 'nom_cliente'
      Size = 150
    end
    object q_cargatot_liquido: TBCDField
      FieldName = 'tot_liquido'
      Origin = 'tot_liquido'
      Precision = 15
    end
    object q_cargaid: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_cargadta_carga: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'dta_carga'
      Origin = 'dta_carga'
    end
    object q_carganom_carga: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_carga'
      Origin = 'nom_carga'
      Size = 50
    end
    object q_cargatot_peso: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tot_peso'
      Origin = 'tot_peso'
      Precision = 15
      Size = 2
    end
    object q_cargatot_carga: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tot_carga'
      Origin = 'tot_carga'
      Precision = 15
      Size = 2
    end
    object q_cargatot_frete: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tot_frete'
      Origin = 'tot_frete'
      Precision = 15
      Size = 2
    end
    object q_carganom_veiculo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_veiculo'
      Origin = 'nom_veiculo'
      Size = 50
    end
    object q_carganom_motorista: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_motorista'
      Origin = 'nom_motorista'
      Size = 50
    end
    object q_carganom_transportadora: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_transportadora'
      Origin = 'nom_transportadora'
      Size = 100
    end
    object q_cargacidade: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'cidade'
      Origin = 'cidade'
      ReadOnly = True
      BlobType = ftMemo
    end
    object q_carganom_fop: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_fop'
      Origin = 'nom_fop'
      Size = 60
    end
  end
  object ds_carga: TDataSource
    DataSet = q_carga
    Left = 632
    Top = 376
  end
  object dst_carga: TfrxDBDataset
    UserName = 'dst_carga'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nfe=NFE'
      'numdoc=NUMDOC'
      'dtadoc=DTADOC'
      'volume_nota=VOLUME_NOTA'
      'nom_cliente=NOM_CLIENTE'
      'tot_liquido=TOT_LIQUIDO'
      'id=ID'
      'dta_carga=DTA_CARGA'
      'nom_carga=NOM_CARGA'
      'tot_peso=TOT_PESO'
      'tot_carga=TOT_CARGA'
      'tot_frete=TOT_FRETE'
      'nom_veiculo=NOM_VEICULO'
      'nom_motorista=NOM_MOTORISTA'
      'nom_transportadora=NOM_TRANSPORTADORA'
      'cidade=cidade'
      'nom_fop=nom_fop')
    DataSet = q_carga
    BCDToCurrency = False
    Left = 632
    Top = 432
  end
  object Q_transferencias: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'select e1.nr_documento,e1.dta_documento, e1.cod_fornecedor, fp.f' +
        'antasia as fantasia_produto,'
      
        ' e.nom_empresa, e1.empresa_destino, e1.cod_fiscal, e1.tot_itens,' +
        ' e1.vl_total, '
      
        'e2.cod_produto, e2.custo, e2.qtd_entrada, e2.id_cor, e2.id_taman' +
        'ho, e2.cod_colecao,'
      
        'f.razao_social, f.fantasia, p.nom_produto, p.ref_fabrica, cr.cor' +
        ', tm.tamanho, cl.descricao as nom_colecao,'
      'm.nom_marca, e2.sub_total from entrada2 e2'
      
        'left join entrada1 e1 on (e1.nr_documento=e2.nr_documento) and (' +
        'e1.cod_fornecedor=e2.cod_fornecedor)  '
      'left join fornecedor f on f.cod_fornecedor=e1.cod_fornecedor'
      'left join produto p on p.cod_produto=e2.cod_produto'
      'left join cores cr on cr.id=e2.id_cor'
      'left join tamanho tm on tm.id=e2.id_tamanho'
      'left join colecao cl on cl.id=e2.cod_colecao'
      'left join marcas m on m.id=p.id_marca'
      'left join empresa e on e.cod_empresa = e1.empresa_destino'
      
        'left join fornecedor fp on fp.cod_fornecedor=p.fornecedor_princi' +
        'pal'
      ''
      ''
      '')
    Left = 728
    Top = 320
    object Q_transferenciasnr_documento: TIntegerField
      FieldName = 'nr_documento'
      Origin = 'nr_documento'
    end
    object Q_transferenciasdta_documento: TDateField
      FieldName = 'dta_documento'
      Origin = 'dta_documento'
    end
    object Q_transferenciascod_fornecedor: TIntegerField
      FieldName = 'cod_fornecedor'
      Origin = 'cod_fornecedor'
    end
    object Q_transferenciasfantasia_produto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fantasia_produto'
      Origin = 'fantasia_produto'
      Size = 200
    end
    object Q_transferenciasnom_empresa: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_empresa'
      Origin = 'nom_empresa'
      Size = 50
    end
    object Q_transferenciasempresa_destino: TIntegerField
      FieldName = 'empresa_destino'
      Origin = 'empresa_destino'
    end
    object Q_transferenciascod_fiscal: TStringField
      FieldName = 'cod_fiscal'
      Origin = 'cod_fiscal'
      FixedChar = True
      Size = 5
    end
    object Q_transferenciastot_itens: TBCDField
      FieldName = 'tot_itens'
      Origin = 'tot_itens'
      Precision = 15
      Size = 2
    end
    object Q_transferenciasvl_total: TBCDField
      FieldName = 'vl_total'
      Origin = 'vl_total'
      Precision = 15
      Size = 2
    end
    object Q_transferenciascod_produto: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
    end
    object Q_transferenciascusto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'custo'
      Origin = 'custo'
      Precision = 15
      Size = 2
    end
    object Q_transferenciasqtd_entrada: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'qtd_entrada'
      Origin = 'qtd_entrada'
      Precision = 15
      Size = 2
    end
    object Q_transferenciasid_cor: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id_cor'
      Origin = 'id_cor'
    end
    object Q_transferenciasid_tamanho: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id_tamanho'
      Origin = 'id_tamanho'
    end
    object Q_transferenciascod_colecao: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_colecao'
      Origin = 'cod_colecao'
    end
    object Q_transferenciasrazao_social: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'razao_social'
      Origin = 'razao_social'
      Size = 200
    end
    object Q_transferenciasfantasia: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fantasia'
      Origin = 'fantasia'
      Size = 200
    end
    object Q_transferenciasnom_produto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_produto'
      Origin = 'nom_produto'
      Size = 100
    end
    object Q_transferenciasref_fabrica: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ref_fabrica'
      Origin = 'ref_fabrica'
      FixedChar = True
      Size = 15
    end
    object Q_transferenciascor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cor'
      Origin = 'cor'
      Size = 30
    end
    object Q_transferenciastamanho: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tamanho'
      Origin = 'tamanho'
      FixedChar = True
      Size = 25
    end
    object Q_transferenciasnom_colecao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_colecao'
      Origin = 'nom_colecao'
      Size = 50
    end
    object Q_transferenciasnom_marca: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_marca'
      Origin = 'nom_marca'
      Size = 40
    end
    object Q_transferenciassub_total: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'sub_total'
      Origin = 'sub_total'
      Precision = 15
      Size = 2
    end
  end
  object ds_transferencias: TDataSource
    DataSet = Q_transferencias
    Left = 744
    Top = 360
  end
  object frxdbdtst1: TfrxDBDataset
    UserName = 'dst_entradas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nr_documento=NR_DOCUMENTO'
      'dta_documento=DTA_DOCUMENTO'
      'cod_fornecedor=COD_FORNECEDOR'
      'fantasia_produto=FANTASIA_PRODUTO'
      'nom_empresa=NOM_EMPRESA'
      'empresa_destino=EMPRESA_DESTINO'
      'cod_fiscal=COD_FISCAL'
      'tot_itens=TOT_ITENS'
      'vl_total=VL_TOTAL'
      'cod_produto=COD_PRODUTO'
      'custo=CUSTO'
      'qtd_entrada=QTD_ENTRADA'
      'id_cor=ID_COR'
      'id_tamanho=ID_TAMANHO'
      'cod_colecao=COD_COLECAO'
      'razao_social=RAZAO_SOCIAL'
      'fantasia=FANTASIA'
      'nom_produto=NOM_PRODUTO'
      'ref_fabrica=REF_FABRICA'
      'cor=COR'
      'tamanho=TAMANHO'
      'nom_colecao=NOM_COLECAO'
      'nom_marca=NOM_MARCA'
      'sub_total=SUB_TOTAL')
    DataSet = Q_transferencias
    BCDToCurrency = False
    Left = 720
    Top = 408
  end
  object q_cheques_emitidos: TFDQuery
    MasterSource = DS_NF
    Connection = dao.CN
    SQL.Strings = (
      
        'select ch.id, ch.cod_conta_corrente, cr.nom_conta, nr_cheque, dt' +
        'a_emissao, dta_vencimento, valor, nominal, historico, quitado, c' +
        'ancelado from cheques ch left join conta_corrente cr on cr.id=ch' +
        '.cod_conta_corrente  where dta_vencimento between '#39'01.01.2014'#39' a' +
        'nd '#39'31.01.2015'#39' and (cancelado <> '#39'S'#39' or cancelado is null)  ord' +
        'er by dta_emissao ')
    Left = 832
    Top = 322
    object q_cheques_emitidosid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_cheques_emitidoscod_conta_corrente: TIntegerField
      FieldName = 'cod_conta_corrente'
      Origin = 'cod_conta_corrente'
    end
    object q_cheques_emitidosnom_conta: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_conta'
      Origin = 'nom_conta'
      Size = 30
    end
    object q_cheques_emitidosnr_cheque: TStringField
      FieldName = 'nr_cheque'
      Origin = 'nr_cheque'
      FixedChar = True
    end
    object q_cheques_emitidosdta_emissao: TDateField
      FieldName = 'dta_emissao'
      Origin = 'dta_emissao'
    end
    object q_cheques_emitidosdta_vencimento: TDateField
      FieldName = 'dta_vencimento'
      Origin = 'dta_vencimento'
    end
    object q_cheques_emitidosvalor: TBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Precision = 15
      Size = 2
    end
    object q_cheques_emitidosnominal: TStringField
      FieldName = 'nominal'
      Origin = 'nominal'
      Size = 50
    end
    object q_cheques_emitidoshistorico: TStringField
      FieldName = 'historico'
      Origin = 'historico'
      Size = 200
    end
    object q_cheques_emitidosquitado: TStringField
      FieldName = 'quitado'
      Origin = 'quitado'
      FixedChar = True
      Size = 1
    end
    object q_cheques_emitidoscancelado: TStringField
      FieldName = 'cancelado'
      Origin = 'cancelado'
      FixedChar = True
      Size = 1
    end
  end
  object ds_cheques_emitidos: TDataSource
    DataSet = q_cheques_emitidos
    Left = 832
    Top = 378
  end
  object dst_cheques_emitidos: TfrxDBDataset
    UserName = 'dst_cheque_emitidos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=ID'
      'cod_conta_corrente=COD_CONTA_CORRENTE'
      'nom_conta=NOM_CONTA'
      'nr_cheque=NR_CHEQUE'
      'dta_emissao=DTA_EMISSAO'
      'dta_vencimento=DTA_VENCIMENTO'
      'valor=VALOR'
      'nominal=NOMINAL'
      'historico=HISTORICO'
      'quitado=QUITADO'
      'cancelado=CANCELADO')
    DataSet = q_cheques_emitidos
    BCDToCurrency = False
    Left = 832
    Top = 434
  end
  object q_contas_receber: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'select cr1.dtaven,'
      '       cr1.dtarec,'
      '       cr1.titulo,'
      '       cast (SUBSTRING(cr1.historico1'
      'from 1 for 300) as varchar (300)) as historico,'
      '     cr1.sequencia,'
      '     cr1.valor,'
      '     coalesce(cr1.valor_recebido, 0) as valor_recebido,'
      '     c.nom_cliente,'
      '     c.telefone,'
      '     fp.nom_fop,'
      '     fp.cod_fop,'
      '     e.nom_empresa,'
      '     r.nom_representante,'
      '     cr1.NR_DOCUMENTO AS NUMDOC,'
      
        '     cast (cc.id || '#39' - '#39' || trim(cc.NR_AGENCIA) || '#39' / '#39' || cc.' +
        'NR_CONTA || '#39' - '#39' || bc.NOM_BANCO as varchar (100)) as conta,'
      '     v.DTA_EMISSAO,'
      '     v.DTADOC,'
      '     rr.NOM_REPRESENTANTE as vendedor_pedido'
      'from cr1 cr1'
      '     left join cliente c on c.cod_cliente = cr1.cod_cliente'
      '     left join fop fp on fp.cod_fop = cr1.cod_fop'
      '     left join empresa e on e.cod_empresa = cr1.cod_empresa'
      '     left join representante r on r.id = cr1.id_representante'
      '     left join vendas1 v on v.NUMDOC = cr1.NR_DOCUMENTO'
      
        '     LEFT OUTER join CONTA_CORRENTE cc on (cc.ID = coalesce(cr1.' +
        'CONTA_BOLETO, v.conta_boleto))'
      '     left outer join banco bc on (cc.ID_BANCO = bc.ID)'
      '     left join REPRESENTANTE rr on rr.id = v.COD_REPRESENTANTE'
      'where 1 = 1 and'
      '      cr1.dtaven between '#39'04.07.2021'#39' and  '#39'29.06.2022'#39' and'
      '      cr1.cod_cliente = '#39'11831'#39
      'order by nom_empresa,'
      '         conta,'
      '         cr1.dtaven  ')
    Left = 896
    Top = 328
    object q_contas_receberdtaven: TDateField
      FieldName = 'dtaven'
      Origin = 'dtaven'
    end
    object q_contas_receberdtarec: TDateField
      FieldName = 'dtarec'
      Origin = 'dtarec'
    end
    object q_contas_recebertitulo: TStringField
      FieldName = 'titulo'
      Origin = 'titulo'
      FixedChar = True
      Size = 6
    end
    object q_contas_receberhistorico: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'historico'
      Origin = 'historico'
      ReadOnly = True
      Size = 300
    end
    object q_contas_recebersequencia: TIntegerField
      FieldName = 'sequencia'
      Origin = 'sequencia'
    end
    object q_contas_recebervalor: TBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Precision = 15
      Size = 2
    end
    object q_contas_recebervalor_recebido: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valor_recebido'
      Origin = 'valor_recebido'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_contas_recebernom_cliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_cliente'
      Origin = 'nom_cliente'
      Size = 150
    end
    object q_contas_recebertelefone: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'telefone'
      Origin = 'telefone'
      FixedChar = True
      Size = 14
    end
    object q_contas_recebernom_fop: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_fop'
      Origin = 'nom_fop'
      Size = 60
    end
    object q_contas_recebercod_fop: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_fop'
      Origin = 'cod_fop'
    end
    object q_contas_recebernom_empresa: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_empresa'
      Origin = 'nom_empresa'
      Size = 50
    end
    object q_contas_recebernom_representante: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_representante'
      Origin = 'nom_representante'
      Size = 50
    end
    object q_contas_recebernumdoc: TIntegerField
      FieldName = 'numdoc'
      Origin = 'numdoc'
    end
    object q_contas_receberconta: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'conta'
      Origin = 'conta'
      ReadOnly = True
      Size = 100
    end
    object q_contas_receberdta_emissao: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'dta_emissao'
      Origin = 'dta_emissao'
    end
    object q_contas_receberdtadoc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'dtadoc'
      Origin = 'dtadoc'
    end
    object q_contas_recebervendedor_pedido: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'vendedor_pedido'
      Origin = 'vendedor_pedido'
      Size = 50
    end
  end
  object ds_contas_receber: TDataSource
    DataSet = q_contas_receber
    Left = 896
    Top = 384
  end
  object dst_contas_receber: TfrxDBDataset
    UserName = 'dst_contas_receber'
    CloseDataSource = False
    FieldAliases.Strings = (
      'dtaven=DTAVEN'
      'dtarec=DTAREC'
      'titulo=TITULO'
      'historico=HISTORICO'
      'sequencia=SEQUENCIA'
      'valor=VALOR'
      'valor_recebido=VALOR_RECEBIDO'
      'nom_cliente=NOM_CLIENTE'
      'telefone=TELEFONE'
      'cod_fop=cod_fop'
      'nom_fop=NOM_FOP'
      'nom_empresa=NOM_EMPRESA'
      'nom_representante=NOM_REPRESENTANTE'
      'numdoc=NUMDOC'
      'conta=CONTA'
      'dta_emissao=DTA_EMISSAO'
      'dtadoc=DTADOC'
      'vendedor_pedido=VENDEDOR_PEDIDO')
    DataSet = q_contas_receber
    BCDToCurrency = False
    Left = 896
    Top = 440
  end
  object q_vendas1: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      ''
      'SELECT DISTINCT *'
      'FROM ('
      '       select case'
      
        '                when v1.NUMDOC_DESTINO is not null then cast (v1' +
        '.numdoc || '#39' => '#39' || v1.NUMDOC_DESTINO as varchar (100))'
      '                else cast (v1.numdoc as varchar (100))'
      '              end as numdoc,'
      '         v1.nfe,'
      '         v1.DTA_EMISSAO,'
      '         v1.dtadoc,'
      '         v1.tot_liquido,'
      '         coalesce(('
      '                    select sum(valor)'
      '                    from cr1 as cr'
      '                    where cr.nr_documento = v1.NUMDOC),'
      '           0) - case'
      
        '                  when cd.UF <> '#39'SC'#39' and v1.nfe is not null then' +
        ' v1.VLR_ST'
      '                  else 0'
      '                end as valor_cr,'
      '         c.cod_cliente || '#39'-'#39' || c.nom_cliente as nom_cliente,'
      '         c.TELEFONE as fone_cliente,'
      '         cd.NOM_CIDADE || '#39'-'#39' || cd.uf as cidade_cliente,'
      '         r.id as CODREP,'
      '         r.NOM_REPRESENTANTE,'
      '         b.NOM_BANCO,'
      '         r.NR_BANCO,'
      '         r.NR_AGENCIA,'
      '         r.NR_CONTA_CORRENTE,'
      '         r.email,'
      '         r.fone,'
      '         r.celular,'
      '         v1.desconto,'
      '         case'
      
        '           when r.ID in (select cm.ID_REPRESENTANTE from COMISSA' +
        'O cm) '
      '           then (select cm.PERC_COMISSAO'
      '                 from comissao cm'
      '                 where cm.ID_REPRESENTANTE = r.ID '
      
        '                   and v1.DESCONTO between cm.PERC_MINIMO and cm' +
        '.PERC_MAXIMO'
      ')'
      '           else r.PERC_COMISSAO_FIXA'
      '         end as comissao,'
      '         case'
      '           when v1.cod_fop in (26, 22, 7, 9) then '#39'N'#227'o'#39
      '           else '#39'Sim'#39
      '         end venda_comissionada,'
      '         f.NOM_FOP,'
      '         CASE'
      '           WHEN CASE'
      '                  WHEN v1.numdoc_grupo IS NOT NULL THEN ('
      
        '                                                          SELECT' +
        ' v.faturado'
      
        '                                                          FROM v' +
        'endas1 v'
      
        '                                                          WHERE ' +
        'v.numdoc = v1.numdoc_grupo'
      '                                                        )'
      '                  ELSE v1.faturado'
      '                END = 1 THEN (CASE'
      
        '                                WHEN v1.numdoc_grupo IS NOT NULL' +
        ' THEN ('
      
        '                                                                ' +
        '        SELECT CASE'
      
        '                                                                ' +
        '                 WHEN v.faturado = 1 THEN v1.tot_liquido'
      
        '                                                                ' +
        '                 ELSE 0::numeric'
      
        '                                                                ' +
        '               END AS "case"'
      
        '                                                                ' +
        '        FROM vendas1 v'
      
        '                                                                ' +
        '        WHERE v.numdoc = v1.numdoc_grupo'
      
        '                                                                ' +
        '      )'
      '                                ELSE COALESCE(('
      
        '                                                SELECT sum(cr.va' +
        'lor) AS sum'
      '                                                FROM cr1 cr'
      
        '                                                WHERE cr.nr_docu' +
        'mento = v1.numdoc'
      
        '                                              ), v1.tot_liquido)' +
        ' '
      '                                     - '
      
        '                                     CASE WHEN cd.uf <> '#39'SC'#39'::bp' +
        'char AND v1.nfe IS NOT NULL '
      '                                          THEN v1.vlr_st'
      '                                          ELSE 0::numeric'
      '                                     END'
      '                                END '
      '                                -'
      '                                ('
      '                                 ('
      '                                   SELECT CASE'
      
        '                                            WHEN sum(v2.preco_cu' +
        'sto * v2.qtd) = 0::numeric THEN sum(p.custo_total * v2.qtd)'
      
        '                                            ELSE sum(v2.preco_cu' +
        'sto * v2.qtd)'
      '                                          END AS sum'
      '                                   FROM vendas2 v2'
      
        '                                   JOIN produto p ON p.cod_produ' +
        'to = v2.cod_produto'
      '                                   WHERE v2.numdoc = v1.numdoc'
      '                                 )'
      '                             )) /(('
      '        SELECT CASE'
      
        '                 WHEN sum(v2.preco_custo * v2.qtd) = 0::numeric ' +
        'THEN sum(p.custo_total * v2.qtd)'
      '                 ELSE sum(v2.preco_custo * v2.qtd)'
      '               END AS sum'
      '        FROM vendas2 v2'
      '          JOIN produto p ON p.cod_produto = v2.cod_produto'
      '        WHERE v2.numdoc = v1.numdoc'
      ')) * 100::numeric'
      '           ELSE (v1.tot_liquido -(('
      '                                    SELECT CASE'
      
        '                                             WHEN sum(v2.preco_c' +
        'usto * v2.qtd) = 0::numeric THEN sum(p.custo_total * v2.qtd)'
      
        '                                             ELSE sum(v2.preco_c' +
        'usto * v2.qtd)'
      '                                           END AS sum'
      '                                    FROM vendas2 v2'
      
        '                                      JOIN produto p ON p.cod_pr' +
        'oduto = v2.cod_produto'
      '                                    WHERE v2.numdoc = v1.numdoc'
      '))) /(('
      '        SELECT CASE'
      
        '                 WHEN sum(v2.preco_custo * v2.qtd) = 0::numeric ' +
        'THEN sum(p.custo_total * v2.qtd)'
      '                 ELSE sum(v2.preco_custo * v2.qtd)'
      '               END AS sum'
      '        FROM vendas2 v2'
      '          JOIN produto p ON p.cod_produto = v2.cod_produto'
      '        WHERE v2.numdoc = v1.numdoc'
      ')) * 100::numeric'
      '         END AS margem'
      '       from vendas1 v1'
      '         inner join FOP f on (f.COD_FOP = v1.COD_FOP)'
      '         left join cliente c on c.cod_cliente = v1.cod_cliente'
      '         inner join cidades cd on (c.cod_cidade = cd.cod_cidade)'
      '         inner join cadmicro mc on (mc.microcod = cd.microcod)'
      '         inner join cadmeso ms on (ms.mesocod = mc.mesocod)'
      
        '         left join REPRESENTANTE r on r.ID = v1.COD_REPRESENTANT' +
        'E'
      
        '         left join BANCO b on b.ID = CAST (r.NR_BANCO AS INTEGER' +
        ')'
      '       where V1.NUMDOC_GRUPO IS NULL AND'
      '         (v1.COD_FISCAL not in ('#39'6152'#39','
      '             '#39'6409'#39') OR'
      '           V1.COD_FISCAL IS NULL) and'
      '         (v1.NFE_DEV is null or'
      '           v1.STATUS_NFE_DEV = 135) and'
      '         v1.consignacao <> '#39'1'#39' and'
      '         v1.DTADOC between '#39'09.03.2026'#39' and '#39'10.03.2026'#39' and'
      '         v1.faturado <> '#39'2'#39' and'
      '         v1.faturado <> '#39'4'#39' and'
      '         v1.orcamento = '#39'0'#39
      ') q1'
      'order by venda_comissionada desc,'
      '  dtadoc,'
      '  numdoc')
    Left = 528
    Top = 496
    object q_vendas1numdoc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'numdoc'
      Origin = 'numdoc'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      Size = 100
    end
    object q_vendas1nfe: TIntegerField
      FieldName = 'nfe'
      Origin = 'nfe'
    end
    object q_vendas1dta_emissao: TDateField
      FieldName = 'dta_emissao'
      Origin = 'dta_emissao'
    end
    object q_vendas1dtadoc: TDateField
      FieldName = 'dtadoc'
      Origin = 'dtadoc'
    end
    object q_vendas1tot_liquido: TBCDField
      FieldName = 'tot_liquido'
      Origin = 'tot_liquido'
      Precision = 15
    end
    object q_vendas1valor_cr: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valor_cr'
      Origin = 'valor_cr'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_vendas1nom_cliente: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'nom_cliente'
      Origin = 'nom_cliente'
      ReadOnly = True
      BlobType = ftMemo
    end
    object q_vendas1fone_cliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fone_cliente'
      Origin = 'fone_cliente'
      FixedChar = True
      Size = 14
    end
    object q_vendas1cidade_cliente: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'cidade_cliente'
      Origin = 'cidade_cliente'
      ReadOnly = True
      BlobType = ftMemo
    end
    object q_vendas1codrep: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'codrep'
      Origin = 'codrep'
    end
    object q_vendas1nom_representante: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_representante'
      Origin = 'nom_representante'
      Size = 50
    end
    object q_vendas1nom_banco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_banco'
      Origin = 'nom_banco'
      Size = 30
    end
    object q_vendas1nr_banco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nr_banco'
      Origin = 'nr_banco'
      FixedChar = True
      Size = 4
    end
    object q_vendas1nr_agencia: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nr_agencia'
      Origin = 'nr_agencia'
      FixedChar = True
      Size = 10
    end
    object q_vendas1nr_conta_corrente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nr_conta_corrente'
      Origin = 'nr_conta_corrente'
      FixedChar = True
    end
    object q_vendas1email: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'email'
      Origin = 'email'
      Size = 50
    end
    object q_vendas1fone: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fone'
      Origin = 'fone'
      FixedChar = True
      Size = 14
    end
    object q_vendas1celular: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'celular'
      Origin = 'celular'
      FixedChar = True
      Size = 14
    end
    object q_vendas1comissao: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'comissao'
      Origin = 'comissao'
      ReadOnly = True
      Precision = 15
      Size = 2
    end
    object q_vendas1venda_comissionada: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'venda_comissionada'
      Origin = 'venda_comissionada'
      ReadOnly = True
      BlobType = ftMemo
    end
    object q_vendas1nom_fop: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_fop'
      Origin = 'nom_fop'
      Size = 60
    end
    object q_vendas1margem: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'margem'
      Origin = 'margem'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_vendas1desconto: TBCDField
      FieldName = 'desconto'
      Origin = 'desconto'
      Precision = 15
    end
  end
  object ds_vendas1: TDataSource
    DataSet = q_vendas1
    Left = 520
    Top = 550
  end
  object dst_vendas1: TfrxDBDataset
    UserName = 'dst_vendas1'
    CloseDataSource = True
    FieldAliases.Strings = (
      'numdoc=NUMDOC'
      'nfe=NFE'
      'dta_emissao=DTA_EMISSAO'
      'dtadoc=DTADOC'
      'tot_liquido=TOT_LIQUIDO'
      'valor_cr=VALOR_CR'
      'nom_cliente=NOM_CLIENTE'
      'fone_cliente=FONE_CLIENTE'
      'cidade_cliente=CIDADE_CLIENTE'
      'codrep=CODREP'
      'nom_representante=NOM_REPRESENTANTE'
      'nom_banco=NOM_BANCO'
      'nr_banco=NR_BANCO'
      'nr_agencia=NR_AGENCIA'
      'nr_conta_corrente=NR_CONTA_CORRENTE'
      'email=EMAIL'
      'fone=FONE'
      'celular=CELULAR'
      'comissao=COMISSAO'
      'venda_comissionada=VENDA_COMISSIONADA'
      'nom_fop=NOM_FOP'
      'margem=MARGEM'
      'desconto=desconto')
    DataSet = q_vendas1
    BCDToCurrency = False
    Left = 520
    Top = 608
  end
  object q_comissao_venda: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'select V1.numdoc,'
      '       V1.numdoc_grupo,'
      '       V1.dtadoc,'
      '       v1.numdoc_destino,'
      '       case'
      '         when v1.NUMDOC_GRUPO is not null then ('
      
        '                                                 select V.DTA_EM' +
        'ISSAO'
      '                                                 from vendas1 v'
      
        '                                                 where v.NUMDOC ' +
        '= v1.NUMDOC_GRUPO'
      '       )'
      '         else V1.DTA_EMISSAO'
      '       end AS DTA_EMISSAO,'
      '       case'
      '         when v1.NUMDOC_GRUPO is not null then ('
      '                                                 select case'
      
        '                                                          when v' +
        '.faturado = 1 then v1.TOT_LIQUIDO'
      '                                                          else 0'
      '                                                        end'
      '                                                 from vendas1 v'
      
        '                                                 where coalesce(' +
        'v.NUMDOC_DESTINO, v.NUMDOC) = v1.NUMDOC_GRUPO'
      '       )'
      '         else coalesce(('
      '                         select sum(valor)'
      '                         from cr1 as cr'
      
        '                         where cr.nr_documento = coalesce(v1.num' +
        'doc_destino, v1.NUMDOC)'
      '       ), 0) - case'
      
        '                 when cd.UF <> '#39'SC'#39' and v1.nfe is not null then ' +
        'v1.VLR_ST'
      '                 else 0'
      '               end'
      '       end as valor_cr,'
      '       c.cod_cliente,'
      '       c.nom_cliente,'
      '       r.id as codrep,'
      '       r.NOM_REPRESENTANTE,'
      '       r.CPF,'
      '       b.NOM_BANCO,'
      '       r.NR_BANCO,'
      '       r.NR_AGENCIA,'
      '       r.NR_CONTA_CORRENTE,'
      '       R.TITULAR_CONTA,'
      '       r.email,'
      '       r.fone,'
      '       r.celular,'
      '       v1.PERC_COMISSAO as comissao,'
      '       CASE'
      '         WHEN V1.NUMDOC_DESTINO IS NULL THEN V1.tot_liquido'
      '         ELSE '
      '       ('
      '         SELECT VD.TOT_LIQUIDO'
      '         FROM VENDAS1 VD'
      '         WHERE VD.NUMDOC = V1.NUMDOC_DESTINO'
      '       )'
      '       END AS TOT_LIQUIDO,'
      '       v1.vlr_comissao,'
      '       case'
      '         when v1.cod_supervisor is not null then '#39'Sim'#39
      '         else '#39'N'#227'o'#39
      '       end as supervisao,'
      '       case'
      '         when v1.NUMDOC_GRUPO is not null then ('
      
        '                                                 select v.fatura' +
        'do'
      '                                                 from vendas1 v'
      
        '                                                 where v.NUMDOC ' +
        '= v1.NUMDOC_GRUPO'
      '       )'
      '         else v1.FATURADO'
      '       end AS FATURADO,'
      '       V1.COD_SUPERVISOR,'
      '       case'
      '         when case'
      '                when v1.NUMDOC_GRUPO is not null then ('
      
        '                                                        select v' +
        '.faturado'
      
        '                                                        from ven' +
        'das1 v'
      
        '                                                        where v.' +
        'NUMDOC = v1.NUMDOC_GRUPO'
      '       )'
      '                else v1.FATURADO'
      '              end = 1 then (((case'
      
        '                                when v1.NUMDOC_GRUPO is not null' +
        ' then ('
      
        '                                                                ' +
        '        select case'
      
        '                                                                ' +
        '                 when v.faturado = 1 then v1.TOT_LIQUIDO'
      
        '                                                                ' +
        '                 else 0'
      
        '                                                                ' +
        '               end'
      
        '                                                                ' +
        '        from vendas1 v'
      
        '                                                                ' +
        '        where v.NUMDOC = v1.NUMDOC_GRUPO'
      '       )'
      '                                else coalesce(('
      
        '                                                select sum(valor' +
        ')'
      '                                                from cr1 as cr'
      
        '                                                where cr.nr_docu' +
        'mento = v1.NUMDOC'
      '       ), 0) - case'
      
        '                 when cd.UF <> '#39'SC'#39' and v1.nfe is not null then ' +
        'v1.VLR_ST'
      '                 else 0'
      '               end'
      '                              end) -'
      '       ('
      '         select case'
      
        '                  when sum(v2.PRECO_CUSTO * v2.QTD) = 0 then sum' +
        '(p.CUSTO_TOTAL * v2.QTD)'
      '                  else sum(v2.PRECO_CUSTO * v2.QTD)'
      '                end'
      '         from vendas2 v2'
      
        '              INNER JOIN PRODUTO P ON P.COD_PRODUTO = v2.COD_PRO' +
        'DUTO'
      '         where v2.NUMDOC = v1.NUMDOC'
      '       )) /'
      '       ('
      '         select case'
      
        '                  when sum(v2.PRECO_CUSTO * v2.QTD) = 0 then sum' +
        '(p.CUSTO_TOTAL * v2.QTD)'
      '                  else sum(v2.PRECO_CUSTO * v2.QTD)'
      '                end'
      '         from vendas2 v2'
      
        '              INNER JOIN PRODUTO P ON P.COD_PRODUTO = v2.COD_PRO' +
        'DUTO'
      '         where v2.NUMDOC = v1.NUMDOC'
      '       )) * 100'
      '         else (((case'
      '                   when v1.NUMDOC_GRUPO is not null then ('
      
        '                                                           selec' +
        't case'
      
        '                                                                ' +
        '    when v.faturado = 1 then v1.TOT_LIQUIDO'
      
        '                                                                ' +
        '    else 0'
      
        '                                                                ' +
        '  end'
      
        '                                                           from ' +
        'vendas1 v'
      
        '                                                           where' +
        ' coalesce(v.NUMDOC_DESTINO, v.NUMDOC) = v1.NUMDOC_GRUPO'
      '       )'
      '                   else coalesce(('
      '                                   select sum(valor)'
      '                                   from cr1 as cr'
      
        '                                   where cr.nr_documento = coale' +
        'sce(v1.numdoc_destino, v1.NUMDOC)'
      '       ), 0) - case'
      
        '                 when cd.UF <> '#39'SC'#39' and v1.nfe is not null then ' +
        'v1.VLR_ST'
      '                 else 0'
      '               end'
      '                 end) -'
      '       ('
      '         select case'
      
        '                  when sum(v2.PRECO_CUSTO * v2.QTD) = 0 then sum' +
        '(p.CUSTO_TOTAL * v2.QTD)'
      '                  else sum(v2.PRECO_CUSTO * v2.QTD)'
      '                end'
      '         from vendas2 v2'
      
        '              INNER JOIN PRODUTO P ON P.COD_PRODUTO = v2.COD_PRO' +
        'DUTO'
      '         where v2.NUMDOC = v1.NUMDOC'
      '       )) /'
      '       ('
      '         select case'
      
        '                  when sum(v2.PRECO_CUSTO * v2.QTD) = 0 then sum' +
        '(p.CUSTO_TOTAL * v2.QTD)'
      '                  else sum(v2.PRECO_CUSTO * v2.QTD)'
      '                end'
      '         from vendas2 v2'
      
        '              INNER JOIN PRODUTO P ON P.COD_PRODUTO = v2.COD_PRO' +
        'DUTO'
      '         where v2.NUMDOC = v1.NUMDOC'
      '       )) * 100'
      '       end as margem,'
      '       v1.desconto'
      'from vendas1 v1'
      '     left join cliente c on c.cod_cliente = v1.cod_cliente'
      '     left join CIDADES cd on cd.COD_CIDADE = c.COD_CIDADE'
      '     INNER join REPRESENTANTE r on r.ID = v1.COD_REPRESENTANTE'
      '     left join BANCO b on b.ID = CAST (r.NR_BANCO AS INTEGER)'
      'where (v1.COD_FISCAL not in ('#39'6152'#39', '#39'6409'#39') OR'
      '      V1.COD_FISCAL IS NULL) and'
      '      (v1.NFE_DEV is null OR'
      '      v1.STATUS_NFE_DEV = 135) and'
      '      v1.consignacao <> 1 and'
      '      v1.cod_fop not in (7, 9, 22) and'
      '      case'
      '        when v1.FATURADO = '#39'1'#39' then v1.DTA_EMISSAO'
      '        else v1.dtadoc'
      '      END between '#39'01.12.2021'#39' and'
      '      '#39'31.12.2021'#39' and'
      '      cast (v1.cod_representante as integer) in (589) and'
      '      v1.faturado <> '#39'4'#39' and'
      '      v1.orcamento = '#39'0'#39
      'order by NOM_REPRESENTANTE,'
      '         NUMDOC_DESTINO,'
      '         dtadoc,'
      '         numdoc')
    Left = 760
    Top = 496
    object q_comissao_vendanumdoc: TIntegerField
      FieldName = 'numdoc'
      Origin = 'numdoc'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_comissao_vendanumdoc_grupo: TIntegerField
      FieldName = 'numdoc_grupo'
      Origin = 'numdoc_grupo'
    end
    object q_comissao_vendadtadoc: TDateField
      FieldName = 'dtadoc'
      Origin = 'dtadoc'
    end
    object q_comissao_vendanumdoc_destino: TIntegerField
      FieldName = 'numdoc_destino'
      Origin = 'numdoc_destino'
    end
    object q_comissao_vendaentregue: TIntegerField
      FieldName = 'entregue'
      Origin = 'entregue'
    end
    object q_comissao_vendadta_emissao: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'dta_emissao'
      Origin = 'dta_emissao'
      ReadOnly = True
    end
    object q_comissao_vendavalor_cr: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valor_cr'
      Origin = 'valor_cr'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_comissao_vendacod_cliente: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_cliente'
      Origin = 'cod_cliente'
    end
    object q_comissao_vendanom_cliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_cliente'
      Origin = 'nom_cliente'
      Size = 150
    end
    object q_comissao_vendacodrep: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'codrep'
      Origin = 'codrep'
    end
    object q_comissao_vendanom_representante: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_representante'
      Origin = 'nom_representante'
      Size = 50
    end
    object q_comissao_vendacpf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cpf'
      Origin = 'cpf'
      FixedChar = True
    end
    object q_comissao_vendanom_banco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_banco'
      Origin = 'nom_banco'
      Size = 30
    end
    object q_comissao_vendanr_banco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nr_banco'
      Origin = 'nr_banco'
      FixedChar = True
      Size = 4
    end
    object q_comissao_vendanr_agencia: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nr_agencia'
      Origin = 'nr_agencia'
      FixedChar = True
      Size = 10
    end
    object q_comissao_vendanr_conta_corrente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nr_conta_corrente'
      Origin = 'nr_conta_corrente'
      FixedChar = True
    end
    object q_comissao_vendatitular_conta: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'titular_conta'
      Origin = 'titular_conta'
      Size = 50
    end
    object q_comissao_vendaemail: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'email'
      Origin = 'email'
      Size = 50
    end
    object q_comissao_vendafone: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fone'
      Origin = 'fone'
      FixedChar = True
      Size = 14
    end
    object q_comissao_vendacelular: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'celular'
      Origin = 'celular'
      FixedChar = True
      Size = 14
    end
    object q_comissao_vendacomissao: TSingleField
      FieldName = 'comissao'
      Origin = 'comissao'
    end
    object q_comissao_vendatot_liquido: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tot_liquido'
      Origin = 'tot_liquido'
      ReadOnly = True
      Precision = 15
    end
    object q_comissao_vendavlr_comissao: TBCDField
      FieldName = 'vlr_comissao'
      Origin = 'vlr_comissao'
      Precision = 15
      Size = 2
    end
    object q_comissao_vendasupervisao: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'supervisao'
      Origin = 'supervisao'
      ReadOnly = True
      BlobType = ftMemo
    end
    object q_comissao_vendafaturado: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'faturado'
      Origin = 'faturado'
      ReadOnly = True
    end
    object q_comissao_vendacod_supervisor: TIntegerField
      FieldName = 'cod_supervisor'
      Origin = 'cod_supervisor'
    end
    object q_comissao_vendamargem: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'margem'
      Origin = 'margem'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_comissao_vendadesconto: TBCDField
      FieldName = 'desconto'
      Origin = 'desconto'
      Precision = 15
    end
  end
  object ds_comissao_venda: TDataSource
    DataSet = q_comissao_venda
    Left = 752
    Top = 550
  end
  object dst_comissao_venda: TfrxDBDataset
    UserName = 'dst_comissao_venda'
    CloseDataSource = True
    FieldAliases.Strings = (
      'numdoc=NUMDOC'
      'numdoc_grupo=NUMDOC_GRUPO'
      'dtadoc=DTADOC'
      'numdoc_destino=NUMDOC_DESTINO'
      'entregue=entregue'
      'dta_emissao=DTA_EMISSAO'
      'valor_cr=VALOR_CR'
      'cod_cliente=COD_CLIENTE'
      'nom_cliente=NOM_CLIENTE'
      'codrep=CODREP'
      'nom_representante=NOM_REPRESENTANTE'
      'cpf=CPF'
      'nom_banco=NOM_BANCO'
      'nr_banco=NR_BANCO'
      'nr_agencia=NR_AGENCIA'
      'nr_conta_corrente=NR_CONTA_CORRENTE'
      'titular_conta=TITULAR_CONTA'
      'email=EMAIL'
      'fone=FONE'
      'celular=CELULAR'
      'comissao=COMISSAO'
      'tot_liquido=TOT_LIQUIDO'
      'vlr_comissao=VLR_COMISSAO'
      'supervisao=SUPERVISAO'
      'faturado=FATURADO'
      'cod_supervisor=COD_SUPERVISOR'
      'margem=MARGEM'
      'desconto=DESCONTO')
    DataSet = q_comissao_venda
    BCDToCurrency = False
    Left = 752
    Top = 608
  end
  object q_contas_pagar: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'select cr1.dtaven,'
      '       cr1.dtapag,'
      '       cr1.titulo,'
      '       case'
      
        '         when cr1.COD_REPRESENTANTE is not null then F.Nom_repre' +
        'sentante'
      '         else '#39#39
      '       end as REPRESENTANTE,'
      '       CR1.HISTORICO1,'
      '       cr1.sequencia,'
      '       cr1.valor,'
      '       coalesce(cr1.valor_pago, 0) as valor_pago,'
      '       c.razao_social,'
      '       c.fone,'
      '       fp.nom_fop,'
      '       e.nom_empresa'
      'from cp1 cr1'
      
        '     left join fornecedor c on c.cod_fornecedor = cr1.cod_fornec' +
        'edor'
      '     left join fop fp on fp.cod_fop = cr1.cod_fop'
      '     left join representante f on f.ID = cr1.COD_REPRESENTANTE'
      '     left join empresa e on e.cod_empresa = cr1.cod_empresa'
      'where 1 = 1 and'
      '      cr1.dtaven between '#39'04.07.2021'#39' and '#39'29.06.2022'#39' and'
      '      cr1.cod_fornecedor = '#39'61'#39
      'order by cr1.dtaven '
      ' ')
    Left = 328
    object q_contas_pagardtaven: TDateField
      FieldName = 'dtaven'
      Origin = 'dtaven'
    end
    object q_contas_pagardtapag: TDateField
      FieldName = 'dtapag'
      Origin = 'dtapag'
    end
    object q_contas_pagartitulo: TStringField
      FieldName = 'titulo'
      Origin = 'titulo'
    end
    object q_contas_pagarsequencia: TIntegerField
      FieldName = 'sequencia'
      Origin = 'sequencia'
    end
    object q_contas_pagarvalor: TBCDField
      FieldName = 'valor'
      Origin = 'valor'
      currency = True
      Precision = 15
      Size = 2
    end
    object q_contas_pagarvalor_pago: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valor_pago'
      Origin = 'valor_pago'
      ReadOnly = True
      currency = True
      Precision = 64
      Size = 0
    end
    object q_contas_pagarrazao_social: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'razao_social'
      Origin = 'razao_social'
      Size = 200
    end
    object q_contas_pagarfone: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fone'
      Origin = 'fone'
      FixedChar = True
      Size = 14
    end
    object q_contas_pagarnom_fop: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_fop'
      Origin = 'nom_fop'
      Size = 60
    end
    object q_contas_pagarnom_empresa: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_empresa'
      Origin = 'nom_empresa'
      Size = 50
    end
    object q_contas_pagarrepresentante: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'representante'
      Origin = 'representante'
      ReadOnly = True
      Size = 8190
    end
    object q_contas_pagarhistorico1: TBlobField
      FieldName = 'historico1'
      Origin = 'historico1'
    end
  end
  object ds_contas_pagar: TDataSource
    DataSet = q_contas_pagar
    Left = 328
    Top = 56
  end
  object dst_contas_pagar: TfrxDBDataset
    UserName = 'dst_contas_pagar'
    CloseDataSource = False
    FieldAliases.Strings = (
      'dtaven=DTAVEN'
      'dtapag=DTAPAG'
      'titulo=TITULO'
      'sequencia=SEQUENCIA'
      'valor=VALOR'
      'valor_pago=VALOR_PAGO'
      'razao_social=RAZAO_SOCIAL'
      'fone=FONE'
      'nom_fop=NOM_FOP'
      'nom_empresa=NOM_EMPRESA'
      'representante=representante'
      'historico1=historico1')
    DataSet = q_contas_pagar
    BCDToCurrency = False
    Left = 328
    Top = 112
  end
  object q_rankin_simplificado: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'SELECT'
      '  r.id,'
      '  r.NOM_REPRESENTANTE,'
      '  c.COD_CLIENTE,'
      '  c.NOM_CLIENTE,'
      '  c.CONTATO,'
      '  c.TELEFONE,'
      
        '  (select count(*) from vendas1 v where v.faturado = 1 and v.DTA' +
        '_EMISSAO between '#39'01.11.2016'#39' and '#39'30.11.2016'#39' and v.COD_CLIENTE' +
        '= c.COD_CLIENTE) as qtd_vendas,'
      
        '  coalesce((select sum(v.TOT_LIQUIDO) from vendas1 v where v.fat' +
        'urado = 1 and  v.DTA_EMISSAO between '#39'01.11.2016'#39' and '#39'30.11.201' +
        '6'#39' and v.COD_CLIENTE= c.COD_CLIENTE),0) as tot_vendas,'
      
        '  (select max(v.DTA_EMISSAO) from vendas1 v where v.faturado = 1' +
        ' and v.DTA_EMISSAO between '#39'01.11.2016'#39' and '#39'30.11.2016'#39' and v.C' +
        'OD_CLIENTE= c.COD_CLIENTE) as ult_venda,'
      
        '  case when coalesce((select sum(v.TOT_LIQUIDO) from vendas1 v w' +
        'here v.faturado = 1 and v.DTA_EMISSAO between '#39'01.11.2016'#39' and '#39 +
        '30.11.2016'#39' and v.COD_CLIENTE= c.COD_CLIENTE),0) = 0'
      '       then 0'
      
        '       else coalesce((select sum(v.TOT_LIQUIDO) from vendas1 v w' +
        'here v.faturado = 1 and v.DTA_EMISSAO between '#39'01.11.2016'#39' and '#39 +
        '30.11.2016'#39' and v.COD_CLIENTE= c.COD_CLIENTE),0) / (select count' +
        '(*) from vendas1 v where v.faturado = 1 and v.DTA_EMISSAO betwee' +
        'n '#39'01.11.2016'#39' and '#39'30.11.2016'#39' and v.COD_CLIENTE= c.COD_CLIENTE' +
        ') end as media_vendas'
      
        'from cliente c inner join representante r on r.id = c.id_represe' +
        'ntante'
      
        'inner join cidades cd on cd.cod_cidade = c.cod_cidade where 1 = ' +
        '1'
      'LIMIT 50')
    Left = 960
    Top = 496
    object q_rankin_simplificadoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
    end
    object q_rankin_simplificadonom_representante: TStringField
      FieldName = 'nom_representante'
      Origin = 'nom_representante'
      Size = 50
    end
    object q_rankin_simplificadocod_cliente: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_cliente'
      Origin = 'cod_cliente'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_rankin_simplificadonom_cliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_cliente'
      Origin = 'nom_cliente'
      Size = 150
    end
    object q_rankin_simplificadocontato: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'contato'
      Origin = 'contato'
      Size = 30
    end
    object q_rankin_simplificadotelefone: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'telefone'
      Origin = 'telefone'
      FixedChar = True
      Size = 14
    end
    object q_rankin_simplificadoqtd_vendas: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'qtd_vendas'
      Origin = 'qtd_vendas'
      ReadOnly = True
    end
    object q_rankin_simplificadotot_vendas: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tot_vendas'
      Origin = 'tot_vendas'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_rankin_simplificadoult_venda: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'ult_venda'
      Origin = 'ult_venda'
      ReadOnly = True
    end
    object q_rankin_simplificadomedia_vendas: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'media_vendas'
      Origin = 'media_vendas'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
  end
  object ds_ranking_simplificado: TDataSource
    DataSet = q_rankin_simplificado
    Left = 960
    Top = 550
  end
  object dst_ranking_simplificado: TfrxDBDataset
    UserName = 'dst_ranking_simplificado'
    CloseDataSource = True
    FieldAliases.Strings = (
      'id=ID'
      'nom_representante=NOM_REPRESENTANTE'
      'cod_cliente=COD_CLIENTE'
      'nom_cliente=NOM_CLIENTE'
      'contato=CONTATO'
      'telefone=TELEFONE'
      'qtd_vendas=QTD_VENDAS'
      'tot_vendas=TOT_VENDAS'
      'ult_venda=ULT_VENDA'
      'media_vendas=MEDIA_VENDAS')
    DataSource = ds_ranking_simplificado
    BCDToCurrency = False
    Left = 960
    Top = 608
  end
  object q_vendas2_ranking: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'SELECT   V2.COD_PRODUTO, v2.COD_CLIENTE, ID_COR, ID_TAMANHO, QTD' +
        ', PRECO, SUB_TOTAL, p.nom_produto, p.preco_venda, c.cor, '
      'cl.telefone ,cl.email, p.fornecedor_principal, f.fantasia '
      
        ',t.tamanho,cl.nom_cliente, v2.numdoc, v1.cod_fop, fp.nom_fop, v1' +
        '.dtadoc, v1.desconto, v1.qtd_parcelas, v1.prazo_pgto,'
      'v2.preco_bruto, v2.desconto as desconto_item, e.nom_empresa,'
      
        'v1.tot_bruto, v1.tot_liquido,r.nom_representante, V1.credito_usa' +
        'do, m.nom_marca FROM VENDAS2 v2 '
      'left join vendas1 v1 on v1.numdoc = v2.numdoc '
      'left join fop fp on fp.cod_fop = v1.cod_fop '
      'LEFT JOIN PRODUTO P ON P.COD_PRODUTO = V2.COD_PRODUTO '
      'left join cores c on c.id = v2.id_cor '
      'left join tamanho t on t.id = v2.id_tamanho '
      'left join cliente cl on cl.cod_cliente=v2.cod_cliente '
      'left join representante r on r.id=v1.cod_representante '
      'left join marcas m on m.id=p.id_marca'
      
        'left join fornecedor f on f.cod_fornecedor=p.fornecedor_principa' +
        'l'
      'left join empresa e on e.cod_empresa = v1.cod_empresa'
      'where v2.cod_cliente=:codcli'
      'ORDER BY v1.tot_liquido DESC'
      'LIMIT 3')
    Left = 680
    Top = 16
    ParamData = <
      item
        Name = 'codcli'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object q_vendas2_rankingcod_produto: TIntegerField
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
    end
    object q_vendas2_rankingcod_cliente: TIntegerField
      FieldName = 'cod_cliente'
      Origin = 'cod_cliente'
    end
    object q_vendas2_rankingid_cor: TIntegerField
      FieldName = 'id_cor'
      Origin = 'id_cor'
    end
    object q_vendas2_rankingid_tamanho: TIntegerField
      FieldName = 'id_tamanho'
      Origin = 'id_tamanho'
    end
    object q_vendas2_rankingqtd: TBCDField
      FieldName = 'qtd'
      Origin = 'qtd'
      Precision = 15
      Size = 2
    end
    object q_vendas2_rankingpreco: TBCDField
      FieldName = 'preco'
      Origin = 'preco'
      Precision = 15
    end
    object q_vendas2_rankingsub_total: TBCDField
      FieldName = 'sub_total'
      Origin = 'sub_total'
      Precision = 15
    end
    object q_vendas2_rankingnom_produto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_produto'
      Origin = 'nom_produto'
      Size = 100
    end
    object q_vendas2_rankingpreco_venda: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'preco_venda'
      Origin = 'preco_venda'
      Precision = 15
    end
    object q_vendas2_rankingcor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cor'
      Origin = 'cor'
      Size = 30
    end
    object q_vendas2_rankingtelefone: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'telefone'
      Origin = 'telefone'
      FixedChar = True
      Size = 14
    end
    object q_vendas2_rankingemail: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'email'
      Origin = 'email'
      Size = 50
    end
    object q_vendas2_rankingfornecedor_principal: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'fornecedor_principal'
      Origin = 'fornecedor_principal'
    end
    object q_vendas2_rankingfantasia: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fantasia'
      Origin = 'fantasia'
      Size = 200
    end
    object q_vendas2_rankingtamanho: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tamanho'
      Origin = 'tamanho'
      FixedChar = True
      Size = 25
    end
    object q_vendas2_rankingnom_cliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_cliente'
      Origin = 'nom_cliente'
      Size = 150
    end
    object q_vendas2_rankingnumdoc: TIntegerField
      FieldName = 'numdoc'
      Origin = 'numdoc'
    end
    object q_vendas2_rankingcod_fop: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_fop'
      Origin = 'cod_fop'
    end
    object q_vendas2_rankingnom_fop: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_fop'
      Origin = 'nom_fop'
      Size = 60
    end
    object q_vendas2_rankingdtadoc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'dtadoc'
      Origin = 'dtadoc'
    end
    object q_vendas2_rankingdesconto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'desconto'
      Origin = 'desconto'
      Precision = 15
    end
    object q_vendas2_rankingqtd_parcelas: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'qtd_parcelas'
      Origin = 'qtd_parcelas'
      FixedChar = True
      Size = 1
    end
    object q_vendas2_rankingprazo_pgto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'prazo_pgto'
      Origin = 'prazo_pgto'
      FixedChar = True
      Size = 30
    end
    object q_vendas2_rankingpreco_bruto: TBCDField
      FieldName = 'preco_bruto'
      Origin = 'preco_bruto'
      Precision = 15
      Size = 2
    end
    object q_vendas2_rankingdesconto_item: TBCDField
      FieldName = 'desconto_item'
      Origin = 'desconto_item'
      Precision = 15
    end
    object q_vendas2_rankingnom_empresa: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_empresa'
      Origin = 'nom_empresa'
      Size = 50
    end
    object q_vendas2_rankingtot_bruto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tot_bruto'
      Origin = 'tot_bruto'
      Precision = 15
      Size = 2
    end
    object q_vendas2_rankingtot_liquido: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tot_liquido'
      Origin = 'tot_liquido'
      Precision = 15
    end
    object q_vendas2_rankingnom_representante: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_representante'
      Origin = 'nom_representante'
      Size = 50
    end
    object q_vendas2_rankingcredito_usado: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'credito_usado'
      Origin = 'credito_usado'
      Precision = 15
      Size = 2
    end
    object q_vendas2_rankingnom_marca: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_marca'
      Origin = 'nom_marca'
      Size = 40
    end
  end
  object ds_vendas2_ranking: TDataSource
    DataSet = q_vendas2_ranking
    Left = 680
    Top = 70
  end
  object dst_vendas2_ranking: TfrxDBDataset
    UserName = 'dst_vendas2_ranking'
    CloseDataSource = True
    FieldAliases.Strings = (
      'cod_produto=COD_PRODUTO'
      'cod_cliente=COD_CLIENTE'
      'id_cor=ID_COR'
      'id_tamanho=ID_TAMANHO'
      'qtd=QTD'
      'preco=PRECO'
      'sub_total=SUB_TOTAL'
      'nom_produto=NOM_PRODUTO'
      'preco_venda=PRECO_VENDA'
      'cor=COR'
      'telefone=TELEFONE'
      'email=EMAIL'
      'fornecedor_principal=FORNECEDOR_PRINCIPAL'
      'fantasia=FANTASIA'
      'tamanho=TAMANHO'
      'nom_cliente=NOM_CLIENTE'
      'numdoc=NUMDOC'
      'cod_fop=COD_FOP'
      'nom_fop=NOM_FOP'
      'dtadoc=DTADOC'
      'desconto=DESCONTO'
      'qtd_parcelas=QTD_PARCELAS'
      'prazo_pgto=PRAZO_PGTO'
      'preco_bruto=PRECO_BRUTO'
      'desconto_item=DESCONTO_ITEM'
      'nom_empresa=NOM_EMPRESA'
      'tot_bruto=TOT_BRUTO'
      'tot_liquido=TOT_LIQUIDO'
      'nom_representante=NOM_REPRESENTANTE'
      'credito_usado=CREDITO_USADO'
      'nom_marca=NOM_MARCA')
    DataSet = q_vendas2_ranking
    BCDToCurrency = False
    Left = 680
    Top = 128
  end
  object q_vendas1_ranking: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'select c.nom_cliente, sum(tot_liquido) as tot_liquido from venda' +
        's1 v1'
      'left join cliente c on c.cod_cliente=v1.cod_cliente '
      'group by c.nom_cliente '
      'order by 2 desc limit 30 ')
    Left = 576
    Top = 16
    object q_vendas1_rankingnom_cliente: TStringField
      FieldName = 'nom_cliente'
      Origin = 'nom_cliente'
      Size = 150
    end
    object q_vendas1_rankingtot_liquido: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tot_liquido'
      Origin = 'tot_liquido'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
  end
  object ds_vendas1_ranking: TDataSource
    DataSet = q_vendas1_ranking
    Left = 576
    Top = 70
  end
  object dst_vendas1_ranking: TfrxDBDataset
    UserName = 'dst_vendas1_ranking'
    CloseDataSource = True
    FieldAliases.Strings = (
      'nom_cliente=NOM_CLIENTE'
      'tot_liquido=TOT_LIQUIDO')
    DataSet = q_vendas1_ranking
    BCDToCurrency = False
    Left = 576
    Top = 128
  end
  object q_niver: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'select dta_aniversario ,cod_cliente, nom_cliente, telefone, emai' +
        'l from cliente '
      '      ')
    Left = 192
    Top = 200
    object q_niverdta_aniversario: TStringField
      FieldName = 'dta_aniversario'
      Origin = 'dta_aniversario'
      FixedChar = True
      Size = 7
    end
    object q_nivercod_cliente: TIntegerField
      FieldName = 'cod_cliente'
      Origin = 'cod_cliente'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_nivernom_cliente: TStringField
      FieldName = 'nom_cliente'
      Origin = 'nom_cliente'
      Size = 150
    end
    object q_nivertelefone: TStringField
      FieldName = 'telefone'
      Origin = 'telefone'
      FixedChar = True
      Size = 14
    end
    object q_niveremail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 50
    end
  end
  object ds_niver: TDataSource
    DataSet = q_niver
    Left = 440
    Top = 56
  end
  object dst_niver: TfrxDBDataset
    UserName = 'dst_niver'
    CloseDataSource = False
    FieldAliases.Strings = (
      'dta_aniversario=DTA_ANIVERSARIO'
      'cod_cliente=COD_CLIENTE'
      'nom_cliente=NOM_CLIENTE'
      'telefone=TELEFONE'
      'email=EMAIL')
    DataSet = q_niver
    BCDToCurrency = False
    Left = 440
    Top = 112
  end
  object Q_est_gerencial: TFDQuery
    MasterSource = DS_NF
    Connection = dao.CN
    SQL.Strings = (
      
        'select pro.cod_produto, pro.nom_produto, pro.grade, pro.qtd_esto' +
        'que,pro.custo, pro.preco_venda, f.razao_social, pro.fornecedor_p' +
        'rincipal,'
      
        '        pro.cod_grupo, cr.cor , tm.tamanho, cr.cor, gd.id_cor, g' +
        'd.id_tamanho, gd.est_individual, f.fantasia from produto pro '
      '        left join grade gd on gd.cod_produto=pro.cod_produto'
      '        left join cores cr on cr.id=gd.id_cor '
      '        left join tamanho tm on tm.id=gd.id_tamanho '
      
        '        left join fornecedor f on f.cod_fornecedor = pro.fornece' +
        'dor_principal where 1 = 1 ')
    Left = 69
    Top = 497
    object Q_est_gerencialcod_produto: TIntegerField
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object Q_est_gerencialnom_produto: TStringField
      FieldName = 'nom_produto'
      Origin = 'nom_produto'
      Size = 100
    end
    object Q_est_gerencialgrade: TIntegerField
      FieldName = 'grade'
      Origin = 'grade'
    end
    object Q_est_gerencialqtd_estoque: TBCDField
      FieldName = 'qtd_estoque'
      Origin = 'qtd_estoque'
      Precision = 15
      Size = 2
    end
    object Q_est_gerencialcusto: TBCDField
      FieldName = 'custo'
      Origin = 'custo'
      Precision = 15
      Size = 2
    end
    object Q_est_gerencialpreco_venda: TBCDField
      FieldName = 'preco_venda'
      Origin = 'preco_venda'
      Precision = 15
    end
    object Q_est_gerencialrazao_social: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'razao_social'
      Origin = 'razao_social'
      Size = 200
    end
    object Q_est_gerencialfornecedor_principal: TIntegerField
      FieldName = 'fornecedor_principal'
      Origin = 'fornecedor_principal'
    end
    object Q_est_gerencialcod_grupo: TIntegerField
      FieldName = 'cod_grupo'
      Origin = 'cod_grupo'
    end
    object Q_est_gerencialcor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cor'
      Origin = 'cor'
      Size = 30
    end
    object Q_est_gerencialtamanho: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tamanho'
      Origin = 'tamanho'
      FixedChar = True
      Size = 25
    end
    object Q_est_gerencialcor_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cor_1'
      Origin = 'cor'
      Size = 30
    end
    object Q_est_gerencialid_cor: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id_cor'
      Origin = 'id_cor'
    end
    object Q_est_gerencialid_tamanho: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id_tamanho'
      Origin = 'id_tamanho'
    end
    object Q_est_gerencialest_individual: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'est_individual'
      Origin = 'est_individual'
      Precision = 15
      Size = 2
    end
    object Q_est_gerencialfantasia: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fantasia'
      Origin = 'fantasia'
      Size = 200
    end
  end
  object ds_est_gerencial: TDataSource
    DataSet = Q_est_gerencial
    Left = 69
    Top = 553
  end
  object dst_est_gerencial: TfrxDBDataset
    UserName = 'dst_est_gerencial'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cod_produto=COD_PRODUTO'
      'nom_produto=NOM_PRODUTO'
      'grade=GRADE'
      'qtd_estoque=QTD_ESTOQUE'
      'cod_grupo=COD_GRUPO'
      'cor=COR'
      'tamanho=TAMANHO'
      'est_individual=EST_INDIVIDUAL'
      'custo=CUSTO'
      'preco_venda=PRECO_VENDA'
      'razao_social=RAZAO_SOCIAL'
      'fantasia=FANTASIA')
    DataSet = Q_est_gerencial
    BCDToCurrency = False
    Left = 69
    Top = 609
  end
  object FTPNFe: TIdFTP
    IPVersion = Id_IPv4
    Host = '177.204.17.14'
    Passive = True
    Password = 'cltorbi'
    TransferTimeout = 3600000
    ListenTimeout = 3600000
    Username = 'plasfanorbi'
    UseExtensionDataPort = True
    NATKeepAlive.UseKeepAlive = True
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    ReadTimeout = 3600000
    Left = 192
    Top = 256
  end
  object q_vendedor_produto: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'SELECT a.CODREP, a.REPRESENTANTE, a.FUNCIONARIO, a.COD_PRODUTO, ' +
        'a.PRODUTO, a.PRECO_VENDA, a.CUSTO, a.LUCRO, a.VLR_TOTAL_LUCRO, a' +
        '.PERC_DESCONTO, a.VALOR_LUCRO_DESCONTADO, a.DIF, a.MARGEM, a.NUM' +
        'DOC, a.PRECO, a.QTD, a.SUB_TOTAL, a.VLR_COMISSAO, a.FATURADO, a.' +
        'DTADOC, a.DTA_EMISSAO'
      'FROM V_COMISSAO_PRODUTO a')
    Left = 880
    Top = 8
  end
  object ds_vendedor_produto: TDataSource
    DataSet = q_vendedor_produto
    Left = 896
    Top = 70
  end
  object dst_vendedor_produto: TfrxDBDataset
    UserName = 'dst_vendedor_produto'
    CloseDataSource = True
    DataSet = q_vendedor_produto
    BCDToCurrency = False
    Left = 896
    Top = 128
  end
  object dst_posicao_estoque_custo: TfrxDBDataset
    UserName = 'dst_posicao_estoque_custo'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cod_produto=COD_PRODUTO'
      'nom_produto=NOM_PRODUTO'
      'estoque_minimo=ESTOQUE_MINIMO'
      'grade=GRADE'
      'qtd_estoque=QTD_ESTOQUE'
      'qtd_reservado=QTD_RESERVADO'
      'qtd_embalagem=QTD_EMBALAGEM'
      'unidade=UNIDADE'
      'cod_grupo=COD_GRUPO'
      'nom_grupo=NOM_GRUPO'
      'custo=CUSTO'
      'custo_total=CUSTO_TOTAL'
      'razao_social=RAZAO_SOCIAL'
      'ult_entrada=ULT_ENTRADA'
      'qtd_entrada=QTD_ENTRADA')
    DataSet = q_posicao_estoque_custo
    BCDToCurrency = False
    Left = 192
    Top = 112
  end
  object ds_posicao_estoque_custo: TDataSource
    DataSet = q_posicao_estoque_custo
    Left = 184
    Top = 64
  end
  object q_posicao_estoque_custo: TFDQuery
    MasterSource = DS_NF
    Connection = dao.CN
    SQL.Strings = (
      
        'select distinct pro.cod_produto, PRO.ORD_PAUTA, pro.nom_produto,' +
        '  pro.QTD_EMBALAGEM, pro.UNIDADE, pro.grade, coalesce(pro.qtd_es' +
        'toque, 0) as qtd_estoque, pro.qtd_reservado,'
      
        '          pro.cod_grupo,  g.nom_grupo, pro.CUSTO_total as CUSTO,' +
        ' pro.estoque_minimo, '
      
        '          (coalesce(pro.qtd_estoque,0)*coalesce(pro.CUSTO_total,' +
        '0)) as custo_total, f.razao_social, '
      
        '          cast(coalesce((select MAX(e1.DTA_DOCUMENTO) from entra' +
        'da2 e2, entrada1 e1 where e2.COD_FORNECEDOR = e1.COD_FORNECEDOR ' +
        'and e2.NR_DOCUMENTO = e1.NR_DOCUMENTO AND E2.COD_PRODUTO = PRO.C' +
        'OD_PRODUTO), '#39'2000/01/01'#39') as date) as ult_entrada, '
      
        '          coalesce((select e3.QTD_ENTRADA from entrada2 e3 where' +
        ' e3.ID = (select max(e2.ID) from entrada2 e2, entrada1 e1 where ' +
        'e2.COD_FORNECEDOR = e1.COD_FORNECEDOR and e2.NR_DOCUMENTO = e1.N' +
        'R_DOCUMENTO AND E2.COD_PRODUTO = PRO.COD_PRODUTO)),0) as qtd_ent' +
        'rada '
      '          from produto pro '
      '          inner join grupo g on (g.COD_GRUPO = pro.cod_grupo) '
      
        '          left join fornecedor f on f.cod_fornecedor = pro.forne' +
        'cedor_principal '
      '          where 1 = 1')
    Left = 184
    Top = 8
    object q_posicao_estoque_custocod_produto: TIntegerField
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_posicao_estoque_custoord_pauta: TIntegerField
      FieldName = 'ord_pauta'
      Origin = 'ord_pauta'
    end
    object q_posicao_estoque_custonom_produto: TStringField
      FieldName = 'nom_produto'
      Origin = 'nom_produto'
      Size = 100
    end
    object q_posicao_estoque_custoqtd_embalagem: TBCDField
      FieldName = 'qtd_embalagem'
      Origin = 'qtd_embalagem'
      Precision = 15
      Size = 3
    end
    object q_posicao_estoque_custounidade: TStringField
      FieldName = 'unidade'
      Origin = 'unidade'
      FixedChar = True
      Size = 3
    end
    object q_posicao_estoque_custograde: TIntegerField
      FieldName = 'grade'
      Origin = 'grade'
    end
    object q_posicao_estoque_custoqtd_estoque: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'qtd_estoque'
      Origin = 'qtd_estoque'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_posicao_estoque_custoqtd_reservado: TBCDField
      FieldName = 'qtd_reservado'
      Origin = 'qtd_reservado'
      Precision = 15
      Size = 2
    end
    object q_posicao_estoque_custocod_grupo: TIntegerField
      FieldName = 'cod_grupo'
      Origin = 'cod_grupo'
    end
    object q_posicao_estoque_custonom_grupo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_grupo'
      Origin = 'nom_grupo'
      Size = 100
    end
    object q_posicao_estoque_custocusto: TBCDField
      FieldName = 'custo'
      Origin = 'custo'
      Precision = 15
      Size = 2
    end
    object q_posicao_estoque_custoestoque_minimo: TBCDField
      FieldName = 'estoque_minimo'
      Origin = 'estoque_minimo'
      Precision = 15
      Size = 2
    end
    object q_posicao_estoque_custocusto_total: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'custo_total'
      Origin = 'custo_total'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_posicao_estoque_custorazao_social: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'razao_social'
      Origin = 'razao_social'
      Size = 200
    end
    object q_posicao_estoque_custoult_entrada: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'ult_entrada'
      Origin = 'ult_entrada'
      ReadOnly = True
    end
    object q_posicao_estoque_custoqtd_entrada: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'qtd_entrada'
      Origin = 'qtd_entrada'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
  end
  object q_comissao_nova: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'SELECT a.NUMDOC, a.numdoc_grupo, A.TIPO, a.DTADOC, a.DTA_EMISSAO' +
        ', a.TOT_LIQUIDO, A.DESCONTO_PEDIDO, a.VALOR_CR, a.COD_CLIENTE, a' +
        '.NOM_CLIENTE, a.CODREP, a.NOM_REPRESENTANTE, a.NOM_BANCO, a.NR_B' +
        'ANCO, a.NR_AGENCIA, a.NR_CONTA_CORRENTE, A.TITULAR_CONTA, a.EMAI' +
        'L, a.FONE, a.CELULAR, a.COD_PRODUTO, a.NOM_PRODUTO, a.CUSTO, a.L' +
        'UCRO, a.PRECO_VENDA_CALC, a.MARGEM, a.PRECO_VENDA, a.PRECO, a.DE' +
        'SCONTO, a.DESCONTO_MAX, a.QTD, a.SUB_TOTAL, a.VLR_COMISSAO, '
      
        'a.SUBTOTAL_RATEADO, a.VLR_COMISSAO_RATEADO, a.FATURADO, a.SUPERV' +
        'ISAO, a.PERC_COMISSAO, r.PERC_COMISSAO_FIXA, A.SITUACAO, a.obser' +
        'vacoes_pedido'
      'FROM V_COMISSAO_NOVA2 a'
      'inner join representante r on (r.id = a.codrep)')
    Left = 792
    Top = 8
    object q_comissao_novanumdoc: TIntegerField
      FieldName = 'numdoc'
      Origin = 'numdoc'
    end
    object q_comissao_novanumdoc_grupo: TIntegerField
      FieldName = 'numdoc_grupo'
      Origin = 'numdoc_grupo'
    end
    object q_comissao_novatipo: TStringField
      FieldName = 'tipo'
      Origin = 'tipo'
      FixedChar = True
      Size = 1
    end
    object q_comissao_novadtadoc: TDateField
      FieldName = 'dtadoc'
      Origin = 'dtadoc'
    end
    object q_comissao_novadta_emissao: TDateField
      FieldName = 'dta_emissao'
      Origin = 'dta_emissao'
    end
    object q_comissao_novatot_liquido: TBCDField
      FieldName = 'tot_liquido'
      Origin = 'tot_liquido'
      Precision = 15
    end
    object q_comissao_novadesconto_pedido: TFMTBCDField
      FieldName = 'desconto_pedido'
      Origin = 'desconto_pedido'
      Precision = 64
      Size = 0
    end
    object q_comissao_novavalor_cr: TFMTBCDField
      FieldName = 'valor_cr'
      Origin = 'valor_cr'
      Precision = 64
      Size = 0
    end
    object q_comissao_novacod_cliente: TIntegerField
      FieldName = 'cod_cliente'
      Origin = 'cod_cliente'
    end
    object q_comissao_novanom_cliente: TStringField
      FieldName = 'nom_cliente'
      Origin = 'nom_cliente'
      Size = 150
    end
    object q_comissao_novacodrep: TIntegerField
      FieldName = 'codrep'
      Origin = 'codrep'
    end
    object q_comissao_novanom_representante: TStringField
      FieldName = 'nom_representante'
      Origin = 'nom_representante'
      Size = 50
    end
    object q_comissao_novanom_banco: TStringField
      FieldName = 'nom_banco'
      Origin = 'nom_banco'
      Size = 30
    end
    object q_comissao_novanr_banco: TStringField
      FieldName = 'nr_banco'
      Origin = 'nr_banco'
      FixedChar = True
      Size = 4
    end
    object q_comissao_novanr_agencia: TStringField
      FieldName = 'nr_agencia'
      Origin = 'nr_agencia'
      FixedChar = True
      Size = 10
    end
    object q_comissao_novanr_conta_corrente: TStringField
      FieldName = 'nr_conta_corrente'
      Origin = 'nr_conta_corrente'
      FixedChar = True
    end
    object q_comissao_novatitular_conta: TStringField
      FieldName = 'titular_conta'
      Origin = 'titular_conta'
      Size = 50
    end
    object q_comissao_novaemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 50
    end
    object q_comissao_novafone: TStringField
      FieldName = 'fone'
      Origin = 'fone'
      FixedChar = True
      Size = 14
    end
    object q_comissao_novacelular: TStringField
      FieldName = 'celular'
      Origin = 'celular'
      FixedChar = True
      Size = 14
    end
    object q_comissao_novacod_produto: TStringField
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
      Size = 8190
    end
    object q_comissao_novanom_produto: TStringField
      FieldName = 'nom_produto'
      Origin = 'nom_produto'
      Size = 100
    end
    object q_comissao_novacusto: TBCDField
      FieldName = 'custo'
      Origin = 'custo'
      Precision = 15
      Size = 2
    end
    object q_comissao_novalucro: TBCDField
      FieldName = 'lucro'
      Origin = 'lucro'
      Precision = 15
      Size = 2
    end
    object q_comissao_novapreco_venda_calc: TFMTBCDField
      FieldName = 'preco_venda_calc'
      Origin = 'preco_venda_calc'
      Precision = 64
      Size = 0
    end
    object q_comissao_novamargem: TFMTBCDField
      FieldName = 'margem'
      Origin = 'margem'
      Precision = 64
      Size = 0
    end
    object q_comissao_novapreco_venda: TBCDField
      FieldName = 'preco_venda'
      Origin = 'preco_venda'
      Precision = 15
    end
    object q_comissao_novapreco: TBCDField
      FieldName = 'preco'
      Origin = 'preco'
      Precision = 15
    end
    object q_comissao_novadesconto: TBCDField
      FieldName = 'desconto'
      Origin = 'desconto'
      Precision = 15
    end
    object q_comissao_novadesconto_max: TFMTBCDField
      FieldName = 'desconto_max'
      Origin = 'desconto_max'
      Precision = 64
      Size = 0
    end
    object q_comissao_novaqtd: TBCDField
      FieldName = 'qtd'
      Origin = 'qtd'
      Precision = 15
      Size = 2
    end
    object q_comissao_novasub_total: TBCDField
      FieldName = 'sub_total'
      Origin = 'sub_total'
      Precision = 15
    end
    object q_comissao_novavlr_comissao: TBCDField
      FieldName = 'vlr_comissao'
      Origin = 'vlr_comissao'
      Precision = 15
      Size = 2
    end
    object q_comissao_novasubtotal_rateado: TFMTBCDField
      FieldName = 'subtotal_rateado'
      Origin = 'subtotal_rateado'
      Precision = 64
      Size = 0
    end
    object q_comissao_novavlr_comissao_rateado: TFMTBCDField
      FieldName = 'vlr_comissao_rateado'
      Origin = 'vlr_comissao_rateado'
      Precision = 64
      Size = 0
    end
    object q_comissao_novafaturado: TIntegerField
      FieldName = 'faturado'
      Origin = 'faturado'
    end
    object q_comissao_novasupervisao: TMemoField
      FieldName = 'supervisao'
      Origin = 'supervisao'
      BlobType = ftMemo
    end
    object q_comissao_novaperc_comissao: TBCDField
      FieldName = 'perc_comissao'
      Origin = 'perc_comissao'
      Precision = 15
      Size = 2
    end
    object q_comissao_novaperc_comissao_fixa: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'perc_comissao_fixa'
      Origin = 'perc_comissao_fixa'
      Precision = 15
      Size = 2
    end
    object q_comissao_novasituacao: TMemoField
      FieldName = 'situacao'
      Origin = 'situacao'
      BlobType = ftMemo
    end
    object q_comissao_novaobservacoes_pedido: TMemoField
      FieldName = 'observacoes_pedido'
      Origin = 'observacoes_pedido'
      BlobType = ftMemo
    end
  end
  object ds_comissao_nova: TDataSource
    DataSet = q_comissao_nova
    Left = 792
    Top = 62
  end
  object dst_comissao_nova: TfrxDBDataset
    UserName = 'dst_comissao_nova'
    CloseDataSource = True
    FieldAliases.Strings = (
      'numdoc=NUMDOC'
      'numdoc_grupo=NUMDOC_GRUPO'
      'tipo=TIPO'
      'dtadoc=DTADOC'
      'dta_emissao=DTA_EMISSAO'
      'tot_liquido=TOT_LIQUIDO'
      'desconto_pedido=DESCONTO_PEDIDO'
      'valor_cr=VALOR_CR'
      'cod_cliente=COD_CLIENTE'
      'nom_cliente=NOM_CLIENTE'
      'codrep=CODREP'
      'nom_representante=NOM_REPRESENTANTE'
      'nom_banco=NOM_BANCO'
      'nr_banco=NR_BANCO'
      'nr_agencia=NR_AGENCIA'
      'nr_conta_corrente=NR_CONTA_CORRENTE'
      'titular_conta=TITULAR_CONTA'
      'email=EMAIL'
      'fone=FONE'
      'celular=CELULAR'
      'cod_produto=COD_PRODUTO'
      'nom_produto=NOM_PRODUTO'
      'custo=CUSTO'
      'lucro=LUCRO'
      'preco_venda_calc=PRECO_VENDA_CALC'
      'margem=MARGEM'
      'preco_venda=PRECO_VENDA'
      'preco=PRECO'
      'desconto=DESCONTO'
      'desconto_max=DESCONTO_MAX'
      'qtd=QTD'
      'sub_total=SUB_TOTAL'
      'vlr_comissao=VLR_COMISSAO'
      'subtotal_rateado=SUBTOTAL_RATEADO'
      'vlr_comissao_rateado=VLR_COMISSAO_RATEADO'
      'faturado=FATURADO'
      'supervisao=SUPERVISAO'
      'perc_comissao=PERC_COMISSAO'
      'perc_comissao_fixa=PERC_COMISSAO_FIXA'
      'situacao=SITUACAO'
      'observacoes_pedido=OBSERVACOES_PEDIDO')
    DataSet = q_comissao_nova
    BCDToCurrency = False
    Left = 792
    Top = 120
  end
  object q_desfaturados: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'select l.ID, l.COD_USUARIO_LOGADO, l.NOME AS NOME_LOGADO, l.DATA' +
        ', l.HORA, l.DESCRICAO, l.pedido, case v1.faturado when 1 then '#39'S' +
        'im'#39' else '#39'N'#227'o'#39' end faturado, v1.usuario_desfaturou, ud.nome AS N' +
        'OME_DESFATUROU, v1.tot_bruto, c.cod_cliente, c.nom_cliente '
      'from'
      '('
      
        'SELECT a.ID, a.COD_USUARIO_LOGADO, u.NOME, a.DATA, a.HORA, a.DES' +
        'CRICAO, cast(substring(a.descricao from position('#39':'#39' in a.DESCRI' +
        'CAO)+1 for 6) as integer) as pedido'
      'FROM LOG a'
      
        'inner join tbusu u on (cast(u.codusu as INTEGER) = a.COD_USUARIO' +
        '_LOGADO)'
      'where a.DESCRICAO like '#39'%DESFATURAMENTO PEDIDO N'#176':%'#39' '
      ''
      'union'
      ''
      ''
      
        'SELECT a.ID, a.COD_USUARIO_LOGADO, u.NOME, a.DATA, a.HORA, a.DES' +
        'CRICAO, cast(substring(a.descricao from position('#39':'#39' in a.DESCRI' +
        'CAO)+1 for 6) as integer) as pedido'
      'FROM LOG a'
      
        'inner join tbusu u on (cast(u.codusu as INTEGER) = a.COD_USUARIO' +
        '_LOGADO)'
      'where a.DESCRICAO like '#39'%FATURAMENTO AVULSO - PEDIDO N'#176':%'#39' '
      ') l'
      
        'inner join vendas1 v1 on (v1.NUMDOC = l.pedido and v1.USUARIO_DE' +
        'SFATUROU is not null)'
      'inner join cliente c on (c.cod_cliente = v1.cod_cliente)'
      
        'left outer join tbusu ud on (cast(ud.codusu as INTEGER) = v1.USU' +
        'ARIO_DESFATUROU)')
    Left = 504
    Top = 8
  end
  object ds_desfaturados: TDataSource
    DataSet = q_desfaturados
    Left = 504
    Top = 62
  end
  object dst_desfaturados: TfrxDBDataset
    UserName = 'dst_desfaturados'
    CloseDataSource = True
    DataSet = q_desfaturados
    BCDToCurrency = False
    Left = 504
    Top = 120
  end
  object q_entrada_saidas_produtos: TFDQuery
    MasterSource = DS_NF
    Connection = dao.CN
    SQL.Strings = (
      
        'SELECT a.COD_PRODUTO, a.NOM_PRODUTO, A.DATA, a.CONT_ESTOQUE_AGO_' +
        '2010, a.QTD_ESTOQUE, A.QTD_RESERVADO, a.CODIGO_CLIENTE_FORNECEDO' +
        'R, a.NOME_CLIENTE_FORNECEDOR, a.NUMDOC, a.NOTA_FISCAL, a.QTD, a.' +
        'CONT, a.TIPO'
      'FROM V_CHECAGEM_ESTOQUE a')
    Left = 256
    Top = 8
    object q_entrada_saidas_produtoscod_produto: TIntegerField
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
    end
    object q_entrada_saidas_produtosnom_produto: TStringField
      FieldName = 'nom_produto'
      Origin = 'nom_produto'
      Size = 100
    end
    object q_entrada_saidas_produtosdata: TDateField
      FieldName = 'data'
      Origin = 'data'
    end
    object q_entrada_saidas_produtoscont_estoque_ago_2010: TFloatField
      FieldName = 'cont_estoque_ago_2010'
      Origin = 'cont_estoque_ago_2010'
    end
    object q_entrada_saidas_produtosqtd_estoque: TBCDField
      FieldName = 'qtd_estoque'
      Origin = 'qtd_estoque'
      Precision = 15
      Size = 2
    end
    object q_entrada_saidas_produtosqtd_reservado: TBCDField
      FieldName = 'qtd_reservado'
      Origin = 'qtd_reservado'
      Precision = 15
      Size = 2
    end
    object q_entrada_saidas_produtoscodigo_cliente_fornecedor: TIntegerField
      FieldName = 'codigo_cliente_fornecedor'
      Origin = 'codigo_cliente_fornecedor'
    end
    object q_entrada_saidas_produtosnome_cliente_fornecedor: TStringField
      FieldName = 'nome_cliente_fornecedor'
      Origin = 'nome_cliente_fornecedor'
      Size = 8190
    end
    object q_entrada_saidas_produtosnumdoc: TIntegerField
      FieldName = 'numdoc'
      Origin = 'numdoc'
    end
    object q_entrada_saidas_produtosnota_fiscal: TIntegerField
      FieldName = 'nota_fiscal'
      Origin = 'nota_fiscal'
    end
    object q_entrada_saidas_produtosqtd: TBCDField
      FieldName = 'qtd'
      Origin = 'qtd'
      Precision = 15
      Size = 2
    end
    object q_entrada_saidas_produtoscont: TFMTBCDField
      FieldName = 'cont'
      Origin = 'cont'
      Precision = 64
      Size = 0
    end
    object q_entrada_saidas_produtostipo: TMemoField
      FieldName = 'tipo'
      Origin = 'tipo'
      BlobType = ftMemo
    end
  end
  object ds_entrada_saidas_produtos: TDataSource
    DataSet = q_entrada_saidas_produtos
    Left = 256
    Top = 64
  end
  object dst_entrada_saidas_produtos: TfrxDBDataset
    UserName = 'dst_entrada_saidas_produtos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cod_produto=COD_PRODUTO'
      'nom_produto=NOM_PRODUTO'
      'data=DATA'
      'cont_estoque_ago_2010=CONT_ESTOQUE_AGO_2010'
      'qtd_estoque=QTD_ESTOQUE'
      'qtd_reservado=QTD_RESERVADO'
      'codigo_cliente_fornecedor=CODIGO_CLIENTE_FORNECEDOR'
      'nome_cliente_fornecedor=NOME_CLIENTE_FORNECEDOR'
      'numdoc=NUMDOC'
      'nota_fiscal=NOTA_FISCAL'
      'qtd=QTD'
      'cont=CONT'
      'tipo=TIPO')
    DataSet = q_entrada_saidas_produtos
    BCDToCurrency = False
    Left = 248
    Top = 120
  end
  object Q_produto_custo: TFDQuery
    MasterSource = DS_NF
    Connection = dao.CN
    SQL.Strings = (
      
        'select pro.cod_produto, pro.nom_produto, pro.peso, pro.grade, pr' +
        'o.qtd_estoque, pro.cod_grupo, g.NOM_GRUPO, f.COD_FORNECEDOR, f.R' +
        'AZAO_SOCIAL,  pro.custo, pro.IMPOSTOS, pro.ipi, pro.OUTROS, pro.' +
        'geral, pro.LUCRO, pro.custo_total,  cast(pro.custo_total + (pro.' +
        'custo_total * (pro.lucro/100)) as numeric(15,2)) AS Vlr_calc,  c' +
        'ast( pro.preco_venda as numeric(15,2)) as preco_venda,  cast( pr' +
        'o.preco_promocao as numeric(15,2)) as preco_promocao,   f.razao_' +
        'social, f.fantasia  from produto pro  left outer join subcategor' +
        'ia s on (s.id = pro.subcategoria)  inner join grupo g on (g.COD_' +
        'GRUPO = pro.COD_GRUPO)  left join fornecedor f on f.cod_forneced' +
        'or = pro.fornecedor_principal where 1 = 1 and cast(pro.cod_produ' +
        'to as integer) in (89) order by COD_FORNECEDOR, cod_grupo, ORD_P' +
        'AUTA, nom_produto')
    Left = 224
    Top = 497
    object Q_produto_custocod_produto: TIntegerField
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object Q_produto_custonom_produto: TStringField
      FieldName = 'nom_produto'
      Origin = 'nom_produto'
      Size = 100
    end
    object Q_produto_custopeso: TBCDField
      FieldName = 'peso'
      Origin = 'peso'
      Precision = 15
      Size = 3
    end
    object Q_produto_custograde: TIntegerField
      FieldName = 'grade'
      Origin = 'grade'
    end
    object Q_produto_custoqtd_estoque: TBCDField
      FieldName = 'qtd_estoque'
      Origin = 'qtd_estoque'
      Precision = 15
      Size = 2
    end
    object Q_produto_custocod_grupo: TIntegerField
      FieldName = 'cod_grupo'
      Origin = 'cod_grupo'
    end
    object Q_produto_custonom_grupo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_grupo'
      Origin = 'nom_grupo'
      Size = 100
    end
    object Q_produto_custocod_fornecedor: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_fornecedor'
      Origin = 'cod_fornecedor'
    end
    object Q_produto_custorazao_social: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'razao_social'
      Origin = 'razao_social'
      Size = 200
    end
    object Q_produto_custocusto: TBCDField
      FieldName = 'custo'
      Origin = 'custo'
      Precision = 15
      Size = 2
    end
    object Q_produto_custoimpostos: TBCDField
      FieldName = 'impostos'
      Origin = 'impostos'
      Precision = 15
      Size = 2
    end
    object Q_produto_custoipi: TBCDField
      FieldName = 'ipi'
      Origin = 'ipi'
      Precision = 15
      Size = 2
    end
    object Q_produto_custooutros: TBCDField
      FieldName = 'outros'
      Origin = 'outros'
      Precision = 15
      Size = 2
    end
    object Q_produto_custogeral: TBCDField
      FieldName = 'geral'
      Origin = 'geral'
      Precision = 15
      Size = 2
    end
    object Q_produto_custolucro: TBCDField
      FieldName = 'lucro'
      Origin = 'lucro'
      Precision = 15
      Size = 2
    end
    object Q_produto_custocusto_total: TBCDField
      FieldName = 'custo_total'
      Origin = 'custo_total'
      Precision = 15
      Size = 2
    end
    object Q_produto_custovlr_calc: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vlr_calc'
      Origin = 'vlr_calc'
      ReadOnly = True
      Precision = 15
      Size = 2
    end
    object Q_produto_custopreco_venda: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'preco_venda'
      Origin = 'preco_venda'
      ReadOnly = True
      Precision = 15
      Size = 2
    end
    object Q_produto_custopreco_promocao: TBCDField
      FieldName = 'preco_promocao'
      Origin = 'preco_promocao'
      Precision = 15
      Size = 2
    end
    object Q_produto_custofantasia: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fantasia'
      Origin = 'fantasia'
      Size = 200
    end
  end
  object ds_produto_custo: TDataSource
    DataSet = Q_produto_custo
    Left = 224
    Top = 553
  end
  object dst_produto_custo: TfrxDBDataset
    UserName = 'dst_produto_custo'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cod_produto=COD_PRODUTO'
      'nom_produto=NOM_PRODUTO'
      'peso=PESO'
      'grade=GRADE'
      'qtd_estoque=QTD_ESTOQUE'
      'cod_grupo=COD_GRUPO'
      'nom_grupo=NOM_GRUPO'
      'cod_fornecedor=COD_FORNECEDOR'
      'razao_social=RAZAO_SOCIAL'
      'custo=custo'
      'impostos=IMPOSTOS'
      'ipi=IPI'
      'outros=OUTROS'
      'geral=GERAL'
      'lucro=LUCRO'
      'custo_total=CUSTO_TOTAL'
      'vlr_calc=VLR_CALC'
      'preco_venda=PRECO_VENDA'
      'preco_promocao=PRECO_PROMOCAO'
      'fantasia=FANTASIA')
    DataSet = Q_produto_custo
    BCDToCurrency = False
    Left = 224
    Top = 609
  end
  object q_transportadoras: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'select t.*, c.NOM_CIDADE, c.UF from transportadora t'
      'inner join cidades c on (c.cod_cidade = t.cod_cidade)')
    Left = 448
    Top = 320
    object q_transportadorascod_transportadora: TIntegerField
      FieldName = 'cod_transportadora'
      Origin = 'cod_transportadora'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_transportadorasnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object q_transportadorasendereco: TStringField
      FieldName = 'endereco'
      Origin = 'endereco'
      Size = 100
    end
    object q_transportadorasbairro: TStringField
      FieldName = 'bairro'
      Origin = 'bairro'
      Size = 30
    end
    object q_transportadorascep: TStringField
      FieldName = 'cep'
      Origin = 'cep'
      FixedChar = True
      Size = 9
    end
    object q_transportadorascnpj: TStringField
      FieldName = 'cnpj'
      Origin = 'cnpj'
      FixedChar = True
      Size = 40
    end
    object q_transportadorasie: TStringField
      FieldName = 'ie'
      Origin = 'ie'
      FixedChar = True
      Size = 40
    end
    object q_transportadorascod_cidade: TIntegerField
      FieldName = 'cod_cidade'
      Origin = 'cod_cidade'
    end
    object q_transportadorasfone: TStringField
      FieldName = 'fone'
      Origin = 'fone'
      FixedChar = True
      Size = 14
    end
    object q_transportadorasmotorista: TStringField
      FieldName = 'motorista'
      Origin = 'motorista'
      Size = 30
    end
    object q_transportadorasplaca: TStringField
      FieldName = 'placa'
      Origin = 'placa'
      FixedChar = True
      Size = 10
    end
    object q_transportadorasfrete_fixo: TStringField
      FieldName = 'frete_fixo'
      Origin = 'frete_fixo'
      FixedChar = True
      Size = 1
    end
    object q_transportadoraspercentual_frete: TBCDField
      FieldName = 'percentual_frete'
      Origin = 'percentual_frete'
      Precision = 15
      Size = 2
    end
    object q_transportadorasobs: TBlobField
      FieldName = 'obs'
      Origin = 'obs'
    end
    object q_transportadorascpf: TStringField
      FieldName = 'cpf'
      Origin = 'cpf'
    end
    object q_transportadorastip_pessoa: TStringField
      FieldName = 'tip_pessoa'
      Origin = 'tip_pessoa'
      FixedChar = True
      Size = 1
    end
    object q_transportadorasinterno: TStringField
      FieldName = 'interno'
      Origin = 'interno'
      FixedChar = True
      Size = 1
    end
    object q_transportadoraswhastapp: TStringField
      FieldName = 'whastapp'
      Origin = 'whastapp'
      FixedChar = True
      Size = 14
    end
    object q_transportadorasnom_cidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_cidade'
      Origin = 'nom_cidade'
      Size = 40
    end
    object q_transportadorasuf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'uf'
      Origin = 'uf'
      FixedChar = True
      Size = 2
    end
  end
  object ds_transportadoras: TDataSource
    DataSet = q_transportadoras
    Left = 448
    Top = 376
  end
  object dst_transportadoras: TfrxDBDataset
    UserName = 'dst_transportadoras'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cod_transportadora=COD_TRANSPORTADORA'
      'nome=NOME'
      'endereco=ENDERECO'
      'bairro=BAIRRO'
      'cep=CEP'
      'cnpj=CNPJ'
      'ie=IE'
      'cod_cidade=COD_CIDADE'
      'fone=FONE'
      'motorista=MOTORISTA'
      'placa=PLACA'
      'frete_fixo=FRETE_FIXO'
      'percentual_frete=PERCENTUAL_FRETE'
      'obs=OBS'
      'cpf=CPF'
      'tip_pessoa=TIP_PESSOA'
      'interno=INTERNO'
      'whastapp=whastapp'
      'nom_cidade=NOM_CIDADE'
      'uf=UF')
    DataSet = q_transportadoras
    BCDToCurrency = False
    Left = 448
    Top = 432
  end
  object q_mala_direta1: TFDQuery
    MasterSource = DS_NF
    Connection = dao.CN
    SQL.Strings = (
      
        'select ct.categoria, p.COD_PRODUTO, p.unidade, s.id, M.NOM_MARCA' +
        ' AS MARCA, case when p.unidade = '#39'PT'#39' and p.qtd_embalagem > 1 th' +
        'en p.Nom_produto||'#39'**'#39' else p.NOM_PRODUTO end Nom_produto, '
      
        'case when p.unidade = '#39'PT'#39' and p.qtd_embalagem > 1 then  CAST(pi' +
        '.preco_promocao/p.qtd_embalagem AS NUMERIC(15,2)) else pi.preco_' +
        'promocao end AS PRECO_PROMOCAO, '
      
        'case when p.PROMOCAO_PACOTE = '#39'S'#39' then cast(p.QTD_EMBALAGEM as i' +
        'nteger)||'#39' '#39'||p.UNIDADE else '#39#39' end as pacote, pr.liquidacao, '
      
        's.IMAGEM, s.imagem_bd, s.subcategoria, (select count(*) from pro' +
        'duto p1 where p1.subcategoria = p.subcategoria and p1.promocao =' +
        ' '#39'S'#39') as ordem '
      
        'from produto p inner join PROMOCAO_ITEM PI on (PI.COD_PRODUTO = ' +
        'P.COD_PRODUTO) INNER JOIN PROMOCAO PR ON (PR.ID = PI.PROMOCAO_ID' +
        ') '
      
        'Inner join subcategoria s on (p.SUBCATEGORIA = s.ID) inner join ' +
        'categoria ct on ct.id = s.categoria INNER JOIN MARCAS M ON M.ID ' +
        '= P.ID_MARCA '
      'where pr.data_valida_ate ='#39'31.12.2016'#39'  '
      'order by subcategoria, ordem, ord_pauta, nom_produto '
      ' '
      ''
      ''
      ''
      '')
    Left = 192
    Top = 320
    object q_mala_direta1categoria: TStringField
      FieldName = 'categoria'
      Origin = 'categoria'
      Size = 200
    end
    object q_mala_direta1cod_produto: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_mala_direta1unidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'unidade'
      Origin = 'unidade'
      FixedChar = True
      Size = 3
    end
    object q_mala_direta1id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id'
      Origin = 'id'
    end
    object q_mala_direta1marca: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'marca'
      Origin = 'marca'
      Size = 40
    end
    object q_mala_direta1nom_produto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_produto'
      Origin = 'nom_produto'
      ReadOnly = True
      Size = 8190
    end
    object q_mala_direta1preco_promocao: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'preco_promocao'
      Origin = 'preco_promocao'
      ReadOnly = True
      Precision = 15
      Size = 2
    end
    object q_mala_direta1pacote: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'pacote'
      Origin = 'pacote'
      ReadOnly = True
      BlobType = ftMemo
    end
    object q_mala_direta1liquidacao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'liquidacao'
      Origin = 'liquidacao'
      FixedChar = True
      Size = 1
    end
    object q_mala_direta1imagem: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'imagem'
      Origin = 'imagem'
      Size = 200
    end
    object q_mala_direta1imagem_bd: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'imagem_bd'
      Origin = 'imagem_bd'
    end
    object q_mala_direta1subcategoria: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'subcategoria'
      Origin = 'subcategoria'
      Size = 200
    end
    object q_mala_direta1ordem: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'ordem'
      Origin = 'ordem'
      ReadOnly = True
    end
  end
  object ds_mala_direta1: TDataSource
    DataSet = q_mala_direta1
    Left = 192
    Top = 376
  end
  object dst_mala_direta1: TfrxDBDataset
    UserName = 'dst_mala_direta1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'categoria=CATEGORIA'
      'cod_produto=COD_PRODUTO'
      'unidade=UNIDADE'
      'id=ID'
      'marca=MARCA'
      'nom_produto=NOM_PRODUTO'
      'preco_promocao=PRECO_PROMOCAO'
      'pacote=PACOTE'
      'liquidacao=LIQUIDACAO'
      'imagem=IMAGEM'
      'imagem_bd=IMAGEM_BD'
      'subcategoria=SUBCATEGORIA'
      'ordem=ORDEM')
    DataSet = q_mala_direta1
    BCDToCurrency = False
    Left = 192
    Top = 432
  end
  object q_prateleira: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'select '
      '  v.NUMDOC,'
      '  V.DTADOC,'
      '  V.DTA_EMISSAO,'
      '  V.TOT_LIQUIDO,'
      '  c.COD_CLIENTE,'
      '  c.NOM_CLIENTE, '
      '  p.COD_PRODUTO, '
      '  p.NOM_PRODUTO, '
      '  p.cod_prateleira,'
      '  v2.QTD, '
      '  V.FATURADO,'
      '  v2.volume,'
      '  g.cod_grupo,'
      '  g.nom_grupo   '
      'from vendas1 v'
      'inner join cliente c on (c.COD_CLIENTE = v.cod_cliente)'
      'inner join vendas2 v2 on (v.NUMDOC = v2.NUMDOC)'
      'inner join produto p on (p.COD_PRODUTO = v2.COD_PRODUTO)'
      'left join grupo g on (g.COD_GRUPO = p.COD_GRUPO)'
      'where'
      '  v.consignacao <> '#39'1'#39' and '
      '  v.orcamento='#39'0'#39' and '
      '  v.cod_fop <> '#39'9'#39' and'
      '  p.custo is not null and'
      '  p.custo > 0  ')
    Left = 576
    Top = 320
    object q_prateleiranumdoc: TIntegerField
      FieldName = 'numdoc'
      Origin = 'numdoc'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_prateleiradtadoc: TDateField
      FieldName = 'dtadoc'
      Origin = 'dtadoc'
    end
    object q_prateleiradta_emissao: TDateField
      FieldName = 'dta_emissao'
      Origin = 'dta_emissao'
    end
    object q_prateleiratot_liquido: TBCDField
      FieldName = 'tot_liquido'
      Origin = 'tot_liquido'
      Precision = 15
    end
    object q_prateleiracod_cliente: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_cliente'
      Origin = 'cod_cliente'
    end
    object q_prateleiranom_cliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_cliente'
      Origin = 'nom_cliente'
      Size = 150
    end
    object q_prateleiracod_produto: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
    end
    object q_prateleiranom_produto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_produto'
      Origin = 'nom_produto'
      Size = 100
    end
    object q_prateleiracod_prateleira: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cod_prateleira'
      Origin = 'cod_prateleira'
      FixedChar = True
      Size = 10
    end
    object q_prateleiraqtd: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'qtd'
      Origin = 'qtd'
      Precision = 15
      Size = 2
    end
    object q_prateleirafaturado: TIntegerField
      FieldName = 'faturado'
      Origin = 'faturado'
    end
    object q_prateleiravolume: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'volume'
      Origin = 'volume'
      Precision = 15
      Size = 2
    end
    object q_prateleiracod_grupo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_grupo'
      Origin = 'cod_grupo'
    end
    object q_prateleiranom_grupo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_grupo'
      Origin = 'nom_grupo'
      Size = 100
    end
  end
  object ds_prateleira: TDataSource
    DataSet = q_prateleira
    Left = 576
    Top = 376
  end
  object dst_prateleira: TfrxDBDataset
    UserName = 'dst_prateleira'
    CloseDataSource = False
    FieldAliases.Strings = (
      'numdoc=NUMDOC'
      'dtadoc=DTADOC'
      'dta_emissao=DTA_EMISSAO'
      'tot_liquido=TOT_LIQUIDO'
      'cod_cliente=COD_CLIENTE'
      'nom_cliente=NOM_CLIENTE'
      'cod_produto=COD_PRODUTO'
      'nom_produto=NOM_PRODUTO'
      'cod_prateleira=COD_PRATELEIRA'
      'qtd=QTD'
      'faturado=FATURADO'
      'volume=VOLUME'
      'cod_grupo=COD_GRUPO'
      'nom_grupo=NOM_GRUPO')
    DataSet = q_prateleira
    BCDToCurrency = False
    Left = 576
    Top = 432
  end
  object q_palm_pedidos: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'SELECT a.NR_CONEXAO,'
      '  a.COD_REPRESENTANTE,'
      '  a.DATA_CONEXAO,'
      '  a.HORA_CONEXAO,'
      '  a.QTDE_PEDIDOS,'
      '  a.QTDE_VISITAS_NEGATIVAS,'
      '  a.CHECADO,'
      
        '  cast (a.USUARIO_CHECOU || '#39'-'#39' || u.NOME as varchar (200)) as U' +
        'SUARIO_CHECOU,'
      '  a.DATA_HORA_CHECADO,'
      '  vd1.numdoc,'
      '  v1.numdoc_destino,'
      '  v1.DTADOC,'
      
        '  cast (c.COD_CLIENTE || '#39'-'#39' || c.NOM_CLIENTE as varchar (200)) ' +
        'as cliente,'
      '  c.ENDERECO,'
      '  c.telefone,'
      '  c.NR_ENDERECO,'
      '  c.CEP,'
      
        '  cast (cid . NOM_CIDADE || '#39'-'#39' || cid . UF as varchar (200)) as' +
        ' cidade,'
      '  C.CNPJ,'
      '  C.IE,'
      '  C.RG,'
      '  C.CPF,'
      '  C.EMAIL,'
      '  vd1.TOT_BRUTO,'
      '  vd1.TOT_LIQUIDO,'
      
        '  cast (vd1.COD_FOP || '#39'-'#39' || f.NOM_FOP as varchar (200)) as fop' +
        ','
      
        '  cast (vd1.COD_REPRESENTANTE || '#39'-'#39' || r.NOM_REPRESENTANTE as v' +
        'archar (200)) as representante,'
      '  p.PRAZO,'
      '  v1.PALM_NR_CONEXAO,'
      '  vd1.OBSERVACOES_PEDIDO,'
      '  vd2.ID,'
      '  cast (vd1.NR_PEDIDO_PALM as varchar (10)) as NR_PEDIDO_PALM,'
      
        '  cast (vd2.COD_PRODUTO || '#39'-'#39' || pr.NOM_PRODUTO as varchar (200' +
        ')) as produto,'
      '  pr.unidade,'
      '  vd2.QTD,'
      '  vd2.PRECO,'
      '  vd2.SUB_TOTAL,'
      '  vd2.NR_PEDIDO_PALM,'
      '  vd2.PRECO_BRUTO,'
      
        '  (((vd2.PRECO_BRUTO - vd2.PRECO) / vd2.PRECO_BRUTO) * 100) AS P' +
        'ERC_DESC,'
      '  vd2.VOLUME,'
      '  '#39#39'  as NCM,'
      '  0 as VLR_ICMS_ST,'
      '  0 as perc_st,'
      '  pr.codigo_barra'
      ''
      'FROM'
      '  vendas1 VD1'
      '  inner join vendas2 vd2 on vd2.numdoc = vd1.numdoc'
      '  LEFT OUTER join CLIENTE c on (c.COD_CLIENTE = vd1.COD_CLIENTE)'
      
        '  LEFT OUTER join Cidades cid on (cid . COD_Cidade = c.COD_cidad' +
        'e)'
      
        '  LEFT OUTER join REPRESENTANTE r on (r.id = vd1.COD_REPRESENTAN' +
        'TE)'
      '  LEFT OUTER join prazo p on (p.ID = vd1.COD_PRAZO_PGTO)'
      '  LEFT OUTER join fop f on (f.COD_FOP = vd1.COD_FOP)'
      
        '  LEFT OUTER join produto pr on (pr.COD_PRODUTO = vd2.COD_PRODUT' +
        'O)'
      
        '  LEFT OUTER join  PEDIDO_PALM1 v1 on cast (vd1.nr_pedido_palm a' +
        's INTEGER) = v1.nr_pedido_palm'
      
        '  LEFT OUTER join PEDIDO_PALM2 v2 on (v2.NR_PEDIDO_PALM = v1.NR_' +
        'PEDIDO_PALM) '
      
        '  LEFT OUTER JOIN PALM_LOTE a on (v1.PALM_NR_CONEXAO = a.NR_CONE' +
        'XAO) '
      '  LEFT OUTER join tbusu u on (u.CODUSU = a.USUARIO_CHECOU)'
      ''
      'WHERE 1 = 1 and'
      '  vd1.dta_emissao between '#39'01.10.2025'#39' and '#39'31.10.2025'#39' and'
      '  cast (r.id as integer) in (1191,'
      '    1191) and'
      '  vd1.faturado <> '#39'2'#39' and'
      '  vd1.faturado = '#39'1'#39' and'
      '  vd1.orcamento = '#39'0'#39
      'order by representante,'
      '  NR_CONEXAO,'
      '  vd1.NUMDOC,'
      '  v2.COD_PRODUTO,'
      '  v2.VOLUME ')
    Left = 32
    Top = 176
    object q_palm_pedidosnr_conexao: TIntegerField
      FieldName = 'nr_conexao'
      Origin = 'nr_conexao'
    end
    object q_palm_pedidoscod_representante: TIntegerField
      FieldName = 'cod_representante'
      Origin = 'cod_representante'
    end
    object q_palm_pedidosdata_conexao: TDateField
      FieldName = 'data_conexao'
      Origin = 'data_conexao'
    end
    object q_palm_pedidoshora_conexao: TTimeField
      FieldName = 'hora_conexao'
      Origin = 'hora_conexao'
    end
    object q_palm_pedidosqtde_pedidos: TIntegerField
      FieldName = 'qtde_pedidos'
      Origin = 'qtde_pedidos'
    end
    object q_palm_pedidosqtde_visitas_negativas: TIntegerField
      FieldName = 'qtde_visitas_negativas'
      Origin = 'qtde_visitas_negativas'
    end
    object q_palm_pedidoschecado: TStringField
      FieldName = 'checado'
      Origin = 'checado'
      FixedChar = True
      Size = 1
    end
    object q_palm_pedidosusuario_checou: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'usuario_checou'
      Origin = 'usuario_checou'
      ReadOnly = True
      Size = 200
    end
    object q_palm_pedidosdata_hora_checado: TSQLTimeStampField
      FieldName = 'data_hora_checado'
      Origin = 'data_hora_checado'
    end
    object q_palm_pedidosnumdoc: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'numdoc'
      Origin = 'numdoc'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_palm_pedidosnumdoc_destino: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'numdoc_destino'
      Origin = 'numdoc_destino'
    end
    object q_palm_pedidosdtadoc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'dtadoc'
      Origin = 'dtadoc'
    end
    object q_palm_pedidoscliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cliente'
      Origin = 'cliente'
      ReadOnly = True
      Size = 200
    end
    object q_palm_pedidosendereco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'endereco'
      Origin = 'endereco'
      Size = 200
    end
    object q_palm_pedidostelefone: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'telefone'
      Origin = 'telefone'
      FixedChar = True
      Size = 14
    end
    object q_palm_pedidosnr_endereco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nr_endereco'
      Origin = 'nr_endereco'
      Size = 6
    end
    object q_palm_pedidoscep: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cep'
      Origin = 'cep'
      FixedChar = True
      Size = 10
    end
    object q_palm_pedidoscidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cidade'
      Origin = 'cidade'
      ReadOnly = True
      Size = 200
    end
    object q_palm_pedidoscnpj: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cnpj'
      Origin = 'cnpj'
      FixedChar = True
      Size = 40
    end
    object q_palm_pedidosie: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ie'
      Origin = 'ie'
      FixedChar = True
      Size = 40
    end
    object q_palm_pedidosrg: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'rg'
      Origin = 'rg'
      FixedChar = True
      Size = 40
    end
    object q_palm_pedidoscpf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cpf'
      Origin = 'cpf'
      FixedChar = True
      Size = 40
    end
    object q_palm_pedidosemail: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'email'
      Origin = 'email'
      Size = 50
    end
    object q_palm_pedidostot_bruto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tot_bruto'
      Origin = 'tot_bruto'
      Precision = 15
      Size = 2
    end
    object q_palm_pedidostot_liquido: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tot_liquido'
      Origin = 'tot_liquido'
      Precision = 15
      Size = 2
    end
    object q_palm_pedidosfop: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fop'
      Origin = 'fop'
      ReadOnly = True
      Size = 200
    end
    object q_palm_pedidosrepresentante: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'representante'
      Origin = 'representante'
      ReadOnly = True
      Size = 200
    end
    object q_palm_pedidosprazo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'prazo'
      Origin = 'prazo'
      Size = 100
    end
    object q_palm_pedidospalm_nr_conexao: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'palm_nr_conexao'
      Origin = 'palm_nr_conexao'
    end
    object q_palm_pedidosobservacoes_pedido: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'observacoes_pedido'
      Origin = 'observacoes_pedido'
      BlobType = ftMemo
    end
    object q_palm_pedidosid: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id'
      Origin = 'id'
    end
    object q_palm_pedidosnr_pedido_palm: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nr_pedido_palm'
      Origin = 'nr_pedido_palm'
      ReadOnly = True
      Size = 10
    end
    object q_palm_pedidosproduto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'produto'
      Origin = 'produto'
      ReadOnly = True
      Size = 200
    end
    object q_palm_pedidosunidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'unidade'
      Origin = 'unidade'
      FixedChar = True
      Size = 3
    end
    object q_palm_pedidosqtd: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'qtd'
      Origin = 'qtd'
      Precision = 15
      Size = 2
    end
    object q_palm_pedidospreco: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'preco'
      Origin = 'preco'
      Precision = 15
    end
    object q_palm_pedidossub_total: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'sub_total'
      Origin = 'sub_total'
      Precision = 15
    end
    object q_palm_pedidospreco_bruto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'preco_bruto'
      Origin = 'preco_bruto'
      Precision = 15
      Size = 2
    end
    object q_palm_pedidosperc_desc: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'perc_desc'
      Origin = 'perc_desc'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_palm_pedidosvolume: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'volume'
      Origin = 'volume'
      Precision = 15
      Size = 2
    end
    object q_palm_pedidosncm: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ncm'
      Origin = 'ncm'
      ReadOnly = True
      Size = 32767
    end
    object q_palm_pedidosvlr_icms_st: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vlr_icms_st'
      Origin = 'vlr_icms_st'
      ReadOnly = True
    end
    object q_palm_pedidosperc_st: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'perc_st'
      Origin = 'perc_st'
      ReadOnly = True
    end
    object q_palm_pedidoscodigo_barra: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'codigo_barra'
      Origin = 'codigo_barra'
    end
  end
  object ds_palm_pedidos: TDataSource
    DataSet = q_palm_pedidos
    Left = 32
    Top = 216
  end
  object dst_palm_pedidos: TfrxDBDataset
    UserName = 'dst_palm_pedidos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nr_conexao=NR_CONEXAO'
      'cod_representante=COD_REPRESENTANTE'
      'data_conexao=DATA_CONEXAO'
      'hora_conexao=HORA_CONEXAO'
      'qtde_pedidos=QTDE_PEDIDOS'
      'qtde_visitas_negativas=QTDE_VISITAS_NEGATIVAS'
      'checado=CHECADO'
      'usuario_checou=USUARIO_CHECOU'
      'data_hora_checado=DATA_HORA_CHECADO'
      'numdoc=NUMDOC'
      'numdoc_destino=NUMDOC_DESTINO'
      'dtadoc=DTADOC'
      'cliente=CLIENTE'
      'endereco=ENDERECO'
      'telefone=TELEFONE'
      'nr_endereco=NR_ENDERECO'
      'cep=CEP'
      'cidade=CIDADE'
      'cnpj=CNPJ'
      'ie=IE'
      'rg=RG'
      'cpf=CPF'
      'email=EMAIL'
      'tot_bruto=TOT_BRUTO'
      'tot_liquido=TOT_LIQUIDO'
      'fop=FOP'
      'representante=REPRESENTANTE'
      'prazo=PRAZO'
      'palm_nr_conexao=PALM_NR_CONEXAO'
      'observacoes_pedido=OBSERVACOES_PEDIDO'
      'id=ID'
      'nr_pedido_palm=NR_PEDIDO_PALM'
      'produto=PRODUTO'
      'unidade=UNIDADE'
      'qtd=QTD'
      'preco=PRECO'
      'sub_total=SUB_TOTAL'
      'nr_pedido_palm_1=nr_pedido_palm_1'
      'preco_bruto=PRECO_BRUTO'
      'perc_desc=PERC_DESC'
      'volume=VOLUME'
      'ncm=NCM'
      'vlr_icms_st=VLR_ICMS_ST'
      'perc_st=PERC_ST'
      'codigo_barra=CODIGO_BARRA')
    DataSet = q_palm_pedidos
    BCDToCurrency = False
    Left = 32
    Top = 272
  end
  object q_extrato: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'SELECT'
      '  cc.id as id_conta, '
      '  cc.NOM_CONTA,'
      '  a.ID, '
      '  a.HISTORICO, '
      '  a.DATA_MOV, '
      '  a.VALOR, '
      '  a.ID_CONTA, '
      '  a.OPERACAO, '
      '  a.SALDO,'
      '  a.tipo, '
      
        '  case a.TIPO when '#39'0'#39' then '#39'Dinheiro'#39' else case a.tipo when '#39'1'#39 +
        ' then '#39'Cheque de Terceiros'#39' else  '#39'Dep'#243'sito'#39' end end as tipo_des' +
        'c'
      'FROM EXTRATO a'
      'inner join CONTA_CORRENTE cc on (cc.ID = a.ID_CONTA)')
    Left = 80
    Top = 176
    object q_extratoid_conta: TIntegerField
      FieldName = 'id_conta'
      Origin = 'id_conta'
    end
    object q_extratonom_conta: TStringField
      FieldName = 'nom_conta'
      Origin = 'nom_conta'
      Size = 30
    end
    object q_extratoid: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_extratohistorico: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'historico'
      Origin = 'historico'
    end
    object q_extratodata_mov: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'data_mov'
      Origin = 'data_mov'
    end
    object q_extratovalor: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valor'
      Origin = 'valor'
      Precision = 15
      Size = 2
    end
    object q_extratoid_conta_1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id_conta_1'
      Origin = 'id_conta'
    end
    object q_extratooperacao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'operacao'
      Origin = 'operacao'
      FixedChar = True
      Size = 1
    end
    object q_extratosaldo: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'saldo'
      Origin = 'saldo'
      Precision = 15
      Size = 2
    end
    object q_extratotipo: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'tipo'
      Origin = 'tipo'
    end
    object q_extratotipo_desc: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'tipo_desc'
      Origin = 'tipo_desc'
      ReadOnly = True
      BlobType = ftMemo
    end
  end
  object ds_extrato: TDataSource
    DataSet = q_extrato
    Left = 80
    Top = 216
  end
  object dst_extrato: TfrxDBDataset
    UserName = 'dst_extrato'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id_conta=ID_CONTA'
      'nom_conta=NOM_CONTA'
      'id=ID'
      'historico=HISTORICO'
      'data_mov=DATA_MOV'
      'valor=VALOR'
      'id_conta_1=ID_CONTA_1'
      'operacao=OPERACAO'
      'saldo=SALDO'
      'tipo=TIPO'
      'tipo_desc=TIPO_DESC')
    DataSet = q_extrato
    BCDToCurrency = False
    Left = 80
    Top = 272
  end
  object q_plano_contas: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'SELECT a.ID, a.NR_CONTA, a.DESCRICAO1, a.DESCRICAO2, a.DESCRICAO' +
        '3, a.DESCRICAO4, a.OPERACAO, a.TITULO, a.DATA, a.HISTORICO, a.VA' +
        'LOR, a.VALOR_SALDO, a.CLIENTE_FORNECEDOR, a.FORMA'
      'FROM V_PLANO_CONTAS a')
    Left = 328
    Top = 176
    object q_plano_contasid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
    end
    object q_plano_contasnr_conta: TStringField
      FieldName = 'nr_conta'
      Origin = 'nr_conta'
      FixedChar = True
      Size = 8
    end
    object q_plano_contasdescricao1: TMemoField
      FieldName = 'descricao1'
      Origin = 'descricao1'
      BlobType = ftMemo
    end
    object q_plano_contasdescricao2: TMemoField
      FieldName = 'descricao2'
      Origin = 'descricao2'
      BlobType = ftMemo
    end
    object q_plano_contasdescricao3: TMemoField
      FieldName = 'descricao3'
      Origin = 'descricao3'
      BlobType = ftMemo
    end
    object q_plano_contasdescricao4: TMemoField
      FieldName = 'descricao4'
      Origin = 'descricao4'
      BlobType = ftMemo
    end
    object q_plano_contasoperacao: TMemoField
      FieldName = 'operacao'
      Origin = 'operacao'
      BlobType = ftMemo
    end
    object q_plano_contastitulo: TStringField
      FieldName = 'titulo'
      Origin = 'titulo'
      Size = 8190
    end
    object q_plano_contasdata: TDateField
      FieldName = 'data'
      Origin = 'data'
    end
    object q_plano_contashistorico: TStringField
      FieldName = 'historico'
      Origin = 'historico'
      Size = 8190
    end
    object q_plano_contasvalor: TFMTBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Precision = 64
      Size = 0
    end
    object q_plano_contasvalor_saldo: TFMTBCDField
      FieldName = 'valor_saldo'
      Origin = 'valor_saldo'
      Precision = 64
      Size = 0
    end
    object q_plano_contascliente_fornecedor: TStringField
      FieldName = 'cliente_fornecedor'
      Origin = 'cliente_fornecedor'
      Size = 8190
    end
    object q_plano_contasforma: TMemoField
      FieldName = 'forma'
      Origin = 'forma'
      BlobType = ftMemo
    end
  end
  object ds_plano_contas: TDataSource
    DataSet = q_plano_contas
    Left = 328
    Top = 216
  end
  object dst_plano_contas: TfrxDBDataset
    UserName = 'dst_plano_contas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=ID'
      'nr_conta=NR_CONTA'
      'descricao1=DESCRICAO1'
      'descricao2=DESCRICAO2'
      'descricao3=DESCRICAO3'
      'descricao4=DESCRICAO4'
      'operacao=OPERACAO'
      'titulo=TITULO'
      'data=DATA'
      'historico=HISTORICO'
      'valor=VALOR'
      'valor_saldo=VALOR_SALDO'
      'cliente_fornecedor=CLIENTE_FORNECEDOR'
      'forma=FORMA')
    DataSet = q_plano_contas
    BCDToCurrency = False
    Left = 328
    Top = 272
  end
  object q_frete_combinado: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'SELECT CASE WHEN V.NFE IS NULL THEN 0 ELSE V.NFE END AS NFE, V.N' +
        'UMDOC, V.DTA_SAIDA, T.COD_TRANSPORTADORA||'#39'-'#39'||T.NOME AS TRANSPO' +
        'RTADORA, V.FRETE_COMBINADO, V.VL_FRETE, '
      
        '     CASE WHEN C.COD_CLIENTE IS NOT NULL THEN C.COD_CLIENTE||'#39'-'#39 +
        '||C.NOM_CLIENTE ELSE F.COD_FORNECEDOR||'#39'-'#39'||F.RAZAO_SOCIAL END a' +
        's cliente, v.DT_FRETE_COMBINADO, V.PESO_NOTA,  CD.NOM_CIDADE, CD' +
        '.UF, V.TOT_LIQUIDO, V.VOLUME_NOTA'
      '     FROM VENDAS1 V '
      
        '     INNER JOIN TRANSPORTADORA T ON (T.COD_TRANSPORTADORA = V.CO' +
        'D_TRANSPORTADORA) '
      
        '     LEFT OUTER JOIN CLIENTE C ON (C.COD_CLIENTE = V.COD_CLIENTE' +
        ') '
      
        '     LEFT OUTER JOIN FORNECEDOR F ON (F.COD_FORNECEDOR = V.COD_F' +
        'ORNECEDOR) '
      
        '     INNER JOIN CIDADES CD ON (coalesce(C.COD_CIDADE, F.COD_CIDA' +
        'DE) = CD.COD_CIDADE)'
      
        '     WHERE V.FATURADO IN ('#39'1'#39', '#39'3'#39') AND V.DTA_SAIDA >= '#39'10/01/20' +
        '10'#39' ORDER BY V.DTA_SAIDA DESC, V.NUMDOC DESC')
    Left = 469
    Top = 176
    object q_frete_combinadonfe: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'nfe'
      Origin = 'nfe'
      ReadOnly = True
    end
    object q_frete_combinadonumdoc: TIntegerField
      FieldName = 'numdoc'
      Origin = 'numdoc'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_frete_combinadodta_saida: TDateField
      FieldName = 'dta_saida'
      Origin = 'dta_saida'
    end
    object q_frete_combinadotransportadora: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'transportadora'
      Origin = 'transportadora'
      ReadOnly = True
      BlobType = ftMemo
    end
    object q_frete_combinadofrete_combinado: TStringField
      FieldName = 'frete_combinado'
      Origin = 'frete_combinado'
      FixedChar = True
      Size = 1
    end
    object q_frete_combinadovl_frete: TBCDField
      FieldName = 'vl_frete'
      Origin = 'vl_frete'
      Precision = 15
      Size = 2
    end
    object q_frete_combinadocliente: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'cliente'
      Origin = 'cliente'
      ReadOnly = True
      BlobType = ftMemo
    end
    object q_frete_combinadodt_frete_combinado: TDateField
      FieldName = 'dt_frete_combinado'
      Origin = 'dt_frete_combinado'
    end
    object q_frete_combinadopeso_nota: TBCDField
      FieldName = 'peso_nota'
      Origin = 'peso_nota'
      Precision = 15
      Size = 2
    end
    object q_frete_combinadonom_cidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_cidade'
      Origin = 'nom_cidade'
      Size = 40
    end
    object q_frete_combinadouf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'uf'
      Origin = 'uf'
      FixedChar = True
      Size = 2
    end
    object q_frete_combinadotot_liquido: TBCDField
      FieldName = 'tot_liquido'
      Origin = 'tot_liquido'
      Precision = 15
    end
    object q_frete_combinadovolume_nota: TBCDField
      FieldName = 'volume_nota'
      Origin = 'volume_nota'
      Precision = 15
      Size = 2
    end
  end
  object ds_frete_combinado: TDataSource
    DataSet = q_frete_combinado
    Left = 469
    Top = 216
  end
  object dst_frete_combinado: TfrxDBDataset
    UserName = 'dst_frete_combinado'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nfe=NFE'
      'numdoc=NUMDOC'
      'dta_saida=DTA_SAIDA'
      'transportadora=TRANSPORTADORA'
      'frete_combinado=FRETE_COMBINADO'
      'vl_frete=VL_FRETE'
      'cliente=CLIENTE'
      'dt_frete_combinado=DT_FRETE_COMBINADO'
      'peso_nota=PESO_NOTA'
      'nom_cidade=NOM_CIDADE'
      'uf=UF'
      'tot_liquido=TOT_LIQUIDO'
      'volume_nota=VOLUME_NOTA')
    DataSet = q_frete_combinado
    BCDToCurrency = False
    Left = 469
    Top = 272
  end
  object q_grade_comissao: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'SELECT a.ID, a.TIPO, a.INICIO, a.FIM, a.COMISSAO_INTERNO, a.COMI' +
        'SSAO_OUTROS'
      'FROM GRADE_COMISSAO a'
      'ORDER BY A.TIPO, A.INICIO')
    Left = 680
    Top = 176
    object q_grade_comissaoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_grade_comissaotipo: TStringField
      FieldName = 'tipo'
      Origin = 'tipo'
      FixedChar = True
      Size = 1
    end
    object q_grade_comissaoinicio: TBCDField
      FieldName = 'inicio'
      Origin = 'inicio'
      Precision = 15
      Size = 2
    end
    object q_grade_comissaofim: TBCDField
      FieldName = 'fim'
      Origin = 'fim'
      Precision = 15
      Size = 2
    end
    object q_grade_comissaocomissao_interno: TBCDField
      FieldName = 'comissao_interno'
      Origin = 'comissao_interno'
      Precision = 15
      Size = 2
    end
    object q_grade_comissaocomissao_outros: TBCDField
      FieldName = 'comissao_outros'
      Origin = 'comissao_outros'
      Precision = 15
      Size = 2
    end
  end
  object ds_grade_comissao: TDataSource
    DataSet = q_grade_comissao
    Left = 680
    Top = 232
  end
  object dst_grade_comissao: TfrxDBDataset
    UserName = 'dst_grade_comissao'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=ID'
      'tipo=TIPO'
      'inicio=INICIO'
      'fim=FIM'
      'comissao_interno=COMISSAO_INTERNO'
      'comissao_outros=COMISSAO_OUTROS')
    DataSet = q_grade_comissao
    BCDToCurrency = False
    Left = 680
    Top = 288
  end
  object q_comissao_nova_simplificado: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'SELECT a.NUMDOC, A.NUMDOC_GRUPO, a.DTADOC, a.DTA_EMISSAO, a.TOT_' +
        'LIQUIDO, a.DESCONTO_PEDIDO, a.VALOR_CR, a.COD_CLIENTE, a.NOM_CLI' +
        'ENTE, a.CODREP, a.NOM_REPRESENTANTE, a.NOM_BANCO, a.NR_BANCO, a.' +
        'NR_AGENCIA, a.NR_CONTA_CORRENTE, a.TITULAR_CONTA, a.EMAIL, a.FON' +
        'E, a.CELULAR, a.VLR_COMISSAO, a.VLR_COMISSAO_FIXA, a.FATURADO, a' +
        '.SITUACAO, a.SUPERVISAO, a.PERC_COMISSAO, a.MARGEM_LUCRO,'
      'R.PERC_COMISSAO_FIXA'
      'FROM V_COMISSAO_NOVA a'
      'INNER JOIN REPRESENTANTE R ON R.ID = A.CODREP')
    Left = 795
    Top = 160
    object q_comissao_nova_simplificadonumdoc: TIntegerField
      FieldName = 'numdoc'
      Origin = 'numdoc'
    end
    object q_comissao_nova_simplificadonumdoc_grupo: TIntegerField
      FieldName = 'numdoc_grupo'
      Origin = 'numdoc_grupo'
    end
    object q_comissao_nova_simplificadodtadoc: TDateField
      FieldName = 'dtadoc'
      Origin = 'dtadoc'
    end
    object q_comissao_nova_simplificadodta_emissao: TDateField
      FieldName = 'dta_emissao'
      Origin = 'dta_emissao'
    end
    object q_comissao_nova_simplificadotot_liquido: TBCDField
      FieldName = 'tot_liquido'
      Origin = 'tot_liquido'
      Precision = 15
    end
    object q_comissao_nova_simplificadodesconto_pedido: TFMTBCDField
      FieldName = 'desconto_pedido'
      Origin = 'desconto_pedido'
      Precision = 64
      Size = 0
    end
    object q_comissao_nova_simplificadovalor_cr: TFMTBCDField
      FieldName = 'valor_cr'
      Origin = 'valor_cr'
      Precision = 64
      Size = 0
    end
    object q_comissao_nova_simplificadocod_cliente: TIntegerField
      FieldName = 'cod_cliente'
      Origin = 'cod_cliente'
    end
    object q_comissao_nova_simplificadonom_cliente: TStringField
      FieldName = 'nom_cliente'
      Origin = 'nom_cliente'
      Size = 150
    end
    object q_comissao_nova_simplificadocodrep: TIntegerField
      FieldName = 'codrep'
      Origin = 'codrep'
    end
    object q_comissao_nova_simplificadonom_representante: TStringField
      FieldName = 'nom_representante'
      Origin = 'nom_representante'
      Size = 50
    end
    object q_comissao_nova_simplificadonom_banco: TStringField
      FieldName = 'nom_banco'
      Origin = 'nom_banco'
      Size = 30
    end
    object q_comissao_nova_simplificadonr_banco: TStringField
      FieldName = 'nr_banco'
      Origin = 'nr_banco'
      FixedChar = True
      Size = 4
    end
    object q_comissao_nova_simplificadonr_agencia: TStringField
      FieldName = 'nr_agencia'
      Origin = 'nr_agencia'
      FixedChar = True
      Size = 10
    end
    object q_comissao_nova_simplificadonr_conta_corrente: TStringField
      FieldName = 'nr_conta_corrente'
      Origin = 'nr_conta_corrente'
      FixedChar = True
    end
    object q_comissao_nova_simplificadotitular_conta: TStringField
      FieldName = 'titular_conta'
      Origin = 'titular_conta'
      Size = 50
    end
    object q_comissao_nova_simplificadoemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 50
    end
    object q_comissao_nova_simplificadofone: TStringField
      FieldName = 'fone'
      Origin = 'fone'
      FixedChar = True
      Size = 14
    end
    object q_comissao_nova_simplificadocelular: TStringField
      FieldName = 'celular'
      Origin = 'celular'
      FixedChar = True
      Size = 14
    end
    object q_comissao_nova_simplificadovlr_comissao: TFMTBCDField
      FieldName = 'vlr_comissao'
      Origin = 'vlr_comissao'
      Precision = 64
      Size = 0
    end
    object q_comissao_nova_simplificadovlr_comissao_fixa: TFMTBCDField
      FieldName = 'vlr_comissao_fixa'
      Origin = 'vlr_comissao_fixa'
      Precision = 64
      Size = 0
    end
    object q_comissao_nova_simplificadofaturado: TIntegerField
      FieldName = 'faturado'
      Origin = 'faturado'
    end
    object q_comissao_nova_simplificadosituacao: TMemoField
      FieldName = 'situacao'
      Origin = 'situacao'
      BlobType = ftMemo
    end
    object q_comissao_nova_simplificadosupervisao: TMemoField
      FieldName = 'supervisao'
      Origin = 'supervisao'
      BlobType = ftMemo
    end
    object q_comissao_nova_simplificadoperc_comissao: TSingleField
      FieldName = 'perc_comissao'
      Origin = 'perc_comissao'
    end
    object q_comissao_nova_simplificadomargem_lucro: TFMTBCDField
      FieldName = 'margem_lucro'
      Origin = 'margem_lucro'
      Precision = 64
      Size = 0
    end
    object q_comissao_nova_simplificadoperc_comissao_fixa: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'perc_comissao_fixa'
      Origin = 'perc_comissao_fixa'
      Precision = 15
      Size = 2
    end
  end
  object ds_comissao_nova_simplificado: TDataSource
    DataSet = q_comissao_nova_simplificado
    Left = 800
    Top = 206
  end
  object dst_comissao_nova_simplificado: TfrxDBDataset
    UserName = 'dst_comissao_nova_simplificado'
    CloseDataSource = True
    FieldAliases.Strings = (
      'numdoc=NUMDOC'
      'numdoc_grupo=NUMDOC_GRUPO'
      'dtadoc=DTADOC'
      'dta_emissao=DTA_EMISSAO'
      'tot_liquido=TOT_LIQUIDO'
      'desconto_pedido=DESCONTO_PEDIDO'
      'valor_cr=VALOR_CR'
      'cod_cliente=COD_CLIENTE'
      'nom_cliente=NOM_CLIENTE'
      'codrep=CODREP'
      'nom_representante=NOM_REPRESENTANTE'
      'nom_banco=NOM_BANCO'
      'nr_banco=NR_BANCO'
      'nr_agencia=NR_AGENCIA'
      'nr_conta_corrente=NR_CONTA_CORRENTE'
      'titular_conta=TITULAR_CONTA'
      'email=EMAIL'
      'fone=FONE'
      'celular=CELULAR'
      'vlr_comissao=VLR_COMISSAO'
      'vlr_comissao_fixa=VLR_COMISSAO_FIXA'
      'faturado=FATURADO'
      'situacao=SITUACAO'
      'supervisao=SUPERVISAO'
      'perc_comissao=PERC_COMISSAO'
      'margem_lucro=MARGEM_LUCRO'
      'perc_comissao_fixa=PERC_COMISSAO_FIXA')
    DataSet = q_comissao_nova_simplificado
    BCDToCurrency = False
    Left = 792
    Top = 288
  end
  object q_ordem_compra: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'SELECT e.NOM_EMPRESA,'
      '       e.CNPJ,'
      '       e.ie,'
      '       e.ENDERECO,'
      '       e.NR_ENDERECO,'
      '       e.BAIRRO,'
      '       e.CEP,'
      
        '       cast(c.Nom_cidade || '#39' - '#39' || C.UF as varchar(200)) as ci' +
        'dade,'
      '       a.NR_OC,'
      
        '       cast(a.COD_FORNECEDOR || '#39' - '#39' || f.RAZAO_SOCIAL as varch' +
        'ar(200)) as fornecedor,'
      '       a.DTA_DOCUMENTO,'
      '       a.VL_TOTAL,'
      
        '       cast(o.COD_PRODUTO || '#39' - '#39' || p.NOM_PRODUTO as VARCHAR(2' +
        '00)) as produto,'
      '       pf.COD_PRODUTO_FORNECEDOR,'
      
        '       cast(coalesce(o.unidade, p.unidade) || '#39' / '#39' || coalesce(' +
        'o.qtd_embalagem, p.qtd_embalagem) as varchar(100)) as unidade,'
      '       o.CUSTO,'
      '       o.QTD_ENTRADA,'
      '       o.SUB_TOTAL,'
      '       A.OBS,'
      '       p.peso'
      'FROM OC1 a'
      '     INNER JOIN OC2 O on (a.NR_OC = o.NR_OC)'
      
        '     inner join FORNECEDOR f on (f.COD_FORNECEDOR = a.COD_FORNEC' +
        'EDOR)'
      
        '     left outer join PRODUTO_FORNECEDOR pf on (pf.COD_FORNECEDOR' +
        ' = a.COD_FORNECEDOR and pf.COD_PRODUTO = o.COD_PRODUTO)'
      '     inner join produto p on (p.COD_PRODUTO = o.COD_PRODUTO)'
      '     inner join empresa e on (e.COD_EMPRESA = a.COD_EMPRESA)'
      '     inner join cidades c on (e.COD_CIDADE = c.cod_cidade)'
      
        'where a.nr_oc = 544and coalesce(pf.COD_PRODUTO_FORNECEDOR, '#39'0'#39') ' +
        '= coalesce(('
      
        '                                                                ' +
        '           SELECT b.COD_PRODUTO_FORNECEDOR'
      
        '                                                                ' +
        '           FROM PRODUTO_FORNECEDOR b'
      
        '                                                                ' +
        '           where b.COD_PRODUTO = pf.cod_produto and'
      
        '                                                                ' +
        '                 b.COD_FORNECEDOR = a.cod_fornecedor'
      
        '                                                                ' +
        '           order by b.cod_produto_fornecedor desc'
      
        '                                                                ' +
        '           limit 1'
      '      ), '#39'0'#39')'
      'ORDER BY p.nom_produto')
    Left = 864
    Top = 176
    object q_ordem_compranom_empresa: TStringField
      FieldName = 'nom_empresa'
      Origin = 'nom_empresa'
      Size = 50
    end
    object q_ordem_compracnpj: TStringField
      FieldName = 'cnpj'
      Origin = 'cnpj'
      FixedChar = True
    end
    object q_ordem_compraie: TStringField
      FieldName = 'ie'
      Origin = 'ie'
      FixedChar = True
    end
    object q_ordem_compraendereco: TStringField
      FieldName = 'endereco'
      Origin = 'endereco'
      Size = 50
    end
    object q_ordem_compranr_endereco: TStringField
      FieldName = 'nr_endereco'
      Origin = 'nr_endereco'
      Size = 6
    end
    object q_ordem_comprabairro: TStringField
      FieldName = 'bairro'
      Origin = 'bairro'
      Size = 30
    end
    object q_ordem_compracep: TStringField
      FieldName = 'cep'
      Origin = 'cep'
      FixedChar = True
      Size = 10
    end
    object q_ordem_compracidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cidade'
      Origin = 'cidade'
      ReadOnly = True
      Size = 200
    end
    object q_ordem_compranr_oc: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'nr_oc'
      Origin = 'nr_oc'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_ordem_comprafornecedor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fornecedor'
      Origin = 'fornecedor'
      ReadOnly = True
      Size = 200
    end
    object q_ordem_compradta_documento: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'dta_documento'
      Origin = 'dta_documento'
    end
    object q_ordem_compravl_total: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vl_total'
      Origin = 'vl_total'
      Precision = 15
      Size = 2
    end
    object q_ordem_compraproduto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'produto'
      Origin = 'produto'
      ReadOnly = True
      Size = 200
    end
    object q_ordem_compracod_produto_fornecedor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cod_produto_fornecedor'
      Origin = 'cod_produto_fornecedor'
      Size = 50
    end
    object q_ordem_compraunidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'unidade'
      Origin = 'unidade'
      ReadOnly = True
      Size = 100
    end
    object q_ordem_compracusto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'custo'
      Origin = 'custo'
      Precision = 15
      Size = 2
    end
    object q_ordem_compraqtd_entrada: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'qtd_entrada'
      Origin = 'qtd_entrada'
      Precision = 15
      Size = 2
    end
    object q_ordem_comprasub_total: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'sub_total'
      Origin = 'sub_total'
      Precision = 15
      Size = 2
    end
    object q_ordem_compraobs: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'obs'
      Origin = 'obs'
    end
    object q_ordem_comprapeso: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'peso'
      Origin = 'peso'
      Precision = 15
      Size = 3
    end
  end
  object ds_ordem_compra: TDataSource
    DataSet = q_ordem_compra
    Left = 864
    Top = 230
  end
  object dst_ordem_compra: TfrxDBDataset
    UserName = 'dst_ordem_compra'
    CloseDataSource = True
    FieldAliases.Strings = (
      'nom_empresa=NOM_EMPRESA'
      'cnpj=CNPJ'
      'ie=IE'
      'endereco=ENDERECO'
      'nr_endereco=NR_ENDERECO'
      'bairro=BAIRRO'
      'cep=CEP'
      'cidade=CIDADE'
      'nr_oc=NR_OC'
      'fornecedor=FORNECEDOR'
      'dta_documento=DTA_DOCUMENTO'
      'vl_total=VL_TOTAL'
      'produto=PRODUTO'
      'cod_produto_fornecedor=COD_PRODUTO_FORNECEDOR'
      'unidade=UNIDADE'
      'custo=CUSTO'
      'qtd_entrada=QTD_ENTRADA'
      'sub_total=SUB_TOTAL'
      'obs=OBS'
      'peso=PESO')
    DataSet = q_ordem_compra
    BCDToCurrency = False
    Left = 864
    Top = 288
  end
  object q_fat_liq: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'SELECT a.NUMDOC, a.CLIENTE, a.DTA_EMISSAO, a.FAT_BRUTO, a.CUSTO,' +
        ' a.FAT_LIQUIDO'
      'FROM V_FATURAMENT_LIQUIDO a')
    Left = 512
    Top = 176
    object q_fat_liqnumdoc: TIntegerField
      FieldName = 'numdoc'
      Origin = 'numdoc'
    end
    object q_fat_liqcliente: TMemoField
      FieldName = 'cliente'
      Origin = 'cliente'
      BlobType = ftMemo
    end
    object q_fat_liqdta_emissao: TDateField
      FieldName = 'dta_emissao'
      Origin = 'dta_emissao'
    end
    object q_fat_liqfat_bruto: TFMTBCDField
      FieldName = 'fat_bruto'
      Origin = 'fat_bruto'
      Precision = 64
      Size = 0
    end
    object q_fat_liqcusto: TFMTBCDField
      FieldName = 'custo'
      Origin = 'custo'
      Precision = 64
      Size = 0
    end
    object q_fat_liqfat_liquido: TFMTBCDField
      FieldName = 'fat_liquido'
      Origin = 'fat_liquido'
      Precision = 64
      Size = 0
    end
  end
  object ds_fat_liq: TDataSource
    DataSet = q_fat_liq
    Left = 512
    Top = 216
  end
  object dst_fat_liq: TfrxDBDataset
    UserName = 'dst_fat_liq'
    CloseDataSource = False
    FieldAliases.Strings = (
      'numdoc=NUMDOC'
      'cliente=CLIENTE'
      'dta_emissao=DTA_EMISSAO'
      'fat_bruto=FAT_BRUTO'
      'custo=CUSTO'
      'fat_liquido=FAT_LIQUIDO')
    DataSet = q_fat_liq
    BCDToCurrency = False
    Left = 512
    Top = 272
  end
  object q_custo_fixo: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'SELECT a.ID, a.NR_CONTA, a.ID1, a.ID2, a.ID3, a.ID_PAI2, a.ID_PA' +
        'I3, a.ID_PAI4, a.DESCRICAO1, a.DESCRICAO2, a.DESCRICAO3, a.DESCR' +
        'ICAO4, a.OPERACAO, a.TITULO, a.DATA, a.HISTORICO, a.VALOR, a.VAL' +
        'OR_SALDO, a.CLIENTE_FORNECEDOR'
      'FROM V_CUSTOS_FIXOS a')
    Left = 560
    Top = 176
    object q_custo_fixoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
    end
    object q_custo_fixonr_conta: TStringField
      FieldName = 'nr_conta'
      Origin = 'nr_conta'
      FixedChar = True
      Size = 8
    end
    object q_custo_fixoid1: TIntegerField
      FieldName = 'id1'
      Origin = 'id1'
    end
    object q_custo_fixoid2: TIntegerField
      FieldName = 'id2'
      Origin = 'id2'
    end
    object q_custo_fixoid3: TIntegerField
      FieldName = 'id3'
      Origin = 'id3'
    end
    object q_custo_fixoid_pai2: TIntegerField
      FieldName = 'id_pai2'
      Origin = 'id_pai2'
    end
    object q_custo_fixoid_pai3: TIntegerField
      FieldName = 'id_pai3'
      Origin = 'id_pai3'
    end
    object q_custo_fixoid_pai4: TIntegerField
      FieldName = 'id_pai4'
      Origin = 'id_pai4'
    end
    object q_custo_fixodescricao1: TMemoField
      FieldName = 'descricao1'
      Origin = 'descricao1'
      BlobType = ftMemo
    end
    object q_custo_fixodescricao2: TMemoField
      FieldName = 'descricao2'
      Origin = 'descricao2'
      BlobType = ftMemo
    end
    object q_custo_fixodescricao3: TMemoField
      FieldName = 'descricao3'
      Origin = 'descricao3'
      BlobType = ftMemo
    end
    object q_custo_fixodescricao4: TMemoField
      FieldName = 'descricao4'
      Origin = 'descricao4'
      BlobType = ftMemo
    end
    object q_custo_fixooperacao: TStringField
      FieldName = 'operacao'
      Origin = 'operacao'
      Size = 32767
    end
    object q_custo_fixotitulo: TStringField
      FieldName = 'titulo'
      Origin = 'titulo'
    end
    object q_custo_fixodata: TDateField
      FieldName = 'data'
      Origin = 'data'
    end
    object q_custo_fixohistorico: TStringField
      FieldName = 'historico'
      Origin = 'historico'
      Size = 1000
    end
    object q_custo_fixovalor: TBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Precision = 15
      Size = 2
    end
    object q_custo_fixovalor_saldo: TFMTBCDField
      FieldName = 'valor_saldo'
      Origin = 'valor_saldo'
      Precision = 64
      Size = 0
    end
    object q_custo_fixocliente_fornecedor: TMemoField
      FieldName = 'cliente_fornecedor'
      Origin = 'cliente_fornecedor'
      BlobType = ftMemo
    end
  end
  object ds_custo_fixo: TDataSource
    DataSet = q_custo_fixo
    Left = 560
    Top = 216
  end
  object dst_custo_fixo: TfrxDBDataset
    UserName = 'dst_custo_fixo'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=ID'
      'nr_conta=NR_CONTA'
      'id1=ID1'
      'id2=ID2'
      'id3=ID3'
      'id_pai2=ID_PAI2'
      'id_pai3=ID_PAI3'
      'id_pai4=ID_PAI4'
      'descricao1=DESCRICAO1'
      'descricao2=DESCRICAO2'
      'descricao3=DESCRICAO3'
      'descricao4=DESCRICAO4'
      'operacao=OPERACAO'
      'titulo=TITULO'
      'data=DATA'
      'historico=HISTORICO'
      'valor=VALOR'
      'valor_saldo=VALOR_SALDO'
      'cliente_fornecedor=CLIENTE_FORNECEDOR')
    OpenDataSource = False
    DataSet = q_custo_fixo
    BCDToCurrency = False
    Left = 560
    Top = 272
  end
  object q_representante: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'select t.*, c.NOM_CIDADE, c.UF from REPRESENTANTE t'
      'inner join cidades c on (c.cod_cidade = t.ID_CIDADE)'
      'where t.FUNCIONARIO <> '#39'2'#39' ')
    Left = 256
    Top = 168
    object q_representanteid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_representantenom_representante: TStringField
      FieldName = 'nom_representante'
      Origin = 'nom_representante'
      Size = 50
    end
    object q_representantenom_empresa: TStringField
      FieldName = 'nom_empresa'
      Origin = 'nom_empresa'
      Size = 50
    end
    object q_representanteendereco: TStringField
      FieldName = 'endereco'
      Origin = 'endereco'
      Size = 50
    end
    object q_representantebairro: TStringField
      FieldName = 'bairro'
      Origin = 'bairro'
      Size = 30
    end
    object q_representantecep: TStringField
      FieldName = 'cep'
      Origin = 'cep'
      FixedChar = True
      Size = 10
    end
    object q_representanteid_cidade: TIntegerField
      FieldName = 'id_cidade'
      Origin = 'id_cidade'
    end
    object q_representantecpf: TStringField
      FieldName = 'cpf'
      Origin = 'cpf'
      FixedChar = True
    end
    object q_representanterg: TStringField
      FieldName = 'rg'
      Origin = 'rg'
      FixedChar = True
    end
    object q_representantecnpj: TStringField
      FieldName = 'cnpj'
      Origin = 'cnpj'
      FixedChar = True
    end
    object q_representanteie: TStringField
      FieldName = 'ie'
      Origin = 'ie'
      FixedChar = True
    end
    object q_representantefone: TStringField
      FieldName = 'fone'
      Origin = 'fone'
      FixedChar = True
      Size = 14
    end
    object q_representantefax: TStringField
      FieldName = 'fax'
      Origin = 'fax'
      FixedChar = True
      Size = 14
    end
    object q_representantecelular: TStringField
      FieldName = 'celular'
      Origin = 'celular'
      FixedChar = True
      Size = 14
    end
    object q_representantenr_conta_corrente: TStringField
      FieldName = 'nr_conta_corrente'
      Origin = 'nr_conta_corrente'
      FixedChar = True
    end
    object q_representantenr_agencia: TStringField
      FieldName = 'nr_agencia'
      Origin = 'nr_agencia'
      FixedChar = True
      Size = 10
    end
    object q_representantenr_banco: TStringField
      FieldName = 'nr_banco'
      Origin = 'nr_banco'
      FixedChar = True
      Size = 4
    end
    object q_representanteemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 50
    end
    object q_representantehome_page: TStringField
      FieldName = 'home_page'
      Origin = 'home_page'
      Size = 50
    end
    object q_representanteperc_comissao_fixa: TBCDField
      FieldName = 'perc_comissao_fixa'
      Origin = 'perc_comissao_fixa'
      Precision = 15
      Size = 2
    end
    object q_representanteativo: TStringField
      FieldName = 'ativo'
      Origin = 'ativo'
      FixedChar = True
      Size = 1
    end
    object q_representantefuncionario: TStringField
      FieldName = 'funcionario'
      Origin = 'funcionario'
      FixedChar = True
      Size = 1
    end
    object q_representanteweb_nome: TStringField
      FieldName = 'web_nome'
      Origin = 'web_nome'
      Size = 100
    end
    object q_representanteuf_atuacao: TStringField
      FieldName = 'uf_atuacao'
      Origin = 'uf_atuacao'
      Size = 2
    end
    object q_representanteweb_cidades_atuacao: TStringField
      FieldName = 'web_cidades_atuacao'
      Origin = 'web_cidades_atuacao'
      Size = 900
    end
    object q_representantesincronizar_palm: TStringField
      FieldName = 'sincronizar_palm'
      Origin = 'sincronizar_palm'
      FixedChar = True
      Size = 1
    end
    object q_representantesalario: TBCDField
      FieldName = 'salario'
      Origin = 'salario'
      Precision = 15
      Size = 2
    end
    object q_representanteplr: TStringField
      FieldName = 'plr'
      Origin = 'plr'
      FixedChar = True
      Size = 1
    end
    object q_representanteplr_fabrica: TStringField
      FieldName = 'plr_fabrica'
      Origin = 'plr_fabrica'
      FixedChar = True
      Size = 1
    end
    object q_representantesupervisor: TStringField
      FieldName = 'supervisor'
      Origin = 'supervisor'
      FixedChar = True
      Size = 1
    end
    object q_representantetitular_conta: TStringField
      FieldName = 'titular_conta'
      Origin = 'titular_conta'
      Size = 50
    end
    object q_representantemargem_minima: TBCDField
      FieldName = 'margem_minima'
      Origin = 'margem_minima'
      Precision = 15
      Size = 2
    end
    object q_representantemargem_ideal: TBCDField
      FieldName = 'margem_ideal'
      Origin = 'margem_ideal'
      Precision = 15
      Size = 2
    end
    object q_representanteindice_abaixo: TBCDField
      FieldName = 'indice_abaixo'
      Origin = 'indice_abaixo'
      Precision = 15
      Size = 2
    end
    object q_representanteindice_acima: TBCDField
      FieldName = 'indice_acima'
      Origin = 'indice_acima'
      Precision = 15
      Size = 2
    end
    object q_representantetipo_sistema: TIntegerField
      FieldName = 'tipo_sistema'
      Origin = 'tipo_sistema'
    end
    object q_representanteplr_valor: TBCDField
      FieldName = 'plr_valor'
      Origin = 'plr_valor'
      Precision = 14
      Size = 2
    end
    object q_representantecomissao_fixa: TStringField
      FieldName = 'comissao_fixa'
      Origin = 'comissao_fixa'
      FixedChar = True
      Size = 1
    end
    object q_representanteadmissao: TDateField
      FieldName = 'admissao'
      Origin = 'admissao'
    end
    object q_representantedemissao: TDateField
      FieldName = 'demissao'
      Origin = 'demissao'
    end
    object q_representanteoperadora: TStringField
      FieldName = 'operadora'
      Origin = 'operadora'
    end
    object q_representanteobs: TBlobField
      FieldName = 'obs'
      Origin = 'obs'
    end
    object q_representantemobile: TIntegerField
      FieldName = 'mobile'
      Origin = 'mobile'
    end
    object q_representantetipo_comissao: TIntegerField
      FieldName = 'tipo_comissao'
      Origin = 'tipo_comissao'
    end
    object q_representantemargem_plr: TBCDField
      FieldName = 'margem_plr'
      Origin = 'margem_plr'
      Precision = 15
      Size = 2
    end
    object q_representantewhatsapp: TStringField
      FieldName = 'whatsapp'
      Origin = 'whatsapp'
      FixedChar = True
      Size = 14
    end
    object q_representantecod_tablet: TIntegerField
      FieldName = 'cod_tablet'
      Origin = 'cod_tablet'
    end
    object q_representantenom_cidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_cidade'
      Origin = 'nom_cidade'
      Size = 40
    end
    object q_representanteuf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'uf'
      Origin = 'uf'
      FixedChar = True
      Size = 2
    end
  end
  object ds_representante: TDataSource
    DataSet = q_representante
    Left = 256
    Top = 224
  end
  object dst_representante: TfrxDBDataset
    UserName = 'dst_representante'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=ID'
      'nom_representante=NOM_REPRESENTANTE'
      'nom_empresa=NOM_EMPRESA'
      'endereco=ENDERECO'
      'bairro=BAIRRO'
      'cep=CEP'
      'id_cidade=ID_CIDADE'
      'cpf=CPF'
      'rg=RG'
      'cnpj=CNPJ'
      'ie=IE'
      'fone=FONE'
      'fax=FAX'
      'celular=CELULAR'
      'nr_conta_corrente=NR_CONTA_CORRENTE'
      'nr_agencia=NR_AGENCIA'
      'nr_banco=NR_BANCO'
      'email=EMAIL'
      'home_page=HOME_PAGE'
      'perc_comissao_fixa=PERC_COMISSAO_FIXA'
      'ativo=ATIVO'
      'funcionario=FUNCIONARIO'
      'web_nome=WEB_NOME'
      'uf_atuacao=UF_ATUACAO'
      'web_cidades_atuacao=WEB_CIDADES_ATUACAO'
      'sincronizar_palm=SINCRONIZAR_PALM'
      'salario=SALARIO'
      'plr=PLR'
      'plr_fabrica=PLR_FABRICA'
      'supervisor=SUPERVISOR'
      'titular_conta=TITULAR_CONTA'
      'margem_minima=MARGEM_MINIMA'
      'margem_ideal=MARGEM_IDEAL'
      'indice_abaixo=INDICE_ABAIXO'
      'indice_acima=INDICE_ACIMA'
      'tipo_sistema=TIPO_SISTEMA'
      'plr_valor=PLR_VALOR'
      'comissao_fixa=COMISSAO_FIXA'
      'admissao=ADMISSAO'
      'demissao=DEMISSAO'
      'operadora=OPERADORA'
      'obs=OBS'
      'mobile=mobile'
      'tipo_comissao=tipo_comissao'
      'margem_plr=margem_plr'
      'whatsapp=whatsapp'
      'cod_tablet=cod_tablet'
      'nom_cidade=NOM_CIDADE'
      'uf=UF')
    DataSet = q_representante
    BCDToCurrency = False
    Left = 256
    Top = 280
  end
  object q_ultimos_cr: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'SELECT distinct Cod_cliente,'
      '       NR_documento,'
      '       titulo,'
      '       HISTORICO,'
      '       DTAVEN,'
      '       DTAREC,'
      '       valor,'
      '       valor_recebido,'
      '       SITUACAO,'
      '       CONTA'
      'FROM ('
      '       SELECT Cod_cliente,'
      '              NR_documento,'
      '              titulo,'
      '              HISTORICO,'
      '              DTAVEN,'
      '              DTAREC,'
      '              valor,'
      '              valor_recebido,'
      '              SITUACAO,'
      '              CONTA'
      '       FROM ('
      '              SELECT c.cod_cliente,'
      '                     NR_documento,'
      '                     titulo,'
      '                     substring(C.HISTORICO1'
      '              from 1 for 500) as historico,'
      '                   DTAVEN,'
      '                   DTAREC,'
      '                   C.valor,'
      
        '                   coalesce(c.valor_recebido, 0) as valor_recebi' +
        'do,'
      '                   case'
      '                     when dtarec is null then case'
      
        '                                                when DTAVEN >= c' +
        'urrent_date then '#39#192' VENCER'#39
      '                                                else '#39'VENCIDO'#39
      '                                              END'
      '                     ELSE '#39'PAGO'#39
      '                   END AS SITUACAO,'
      '                   case'
      
        '                     when dtarec is null then coalesce(CV.NR_AGE' +
        'NCIA || '#39' '#39' || CV.NR_CONTA || '#39' '#39' || CV.NOM_CONTA, F.NOM_FOP)'
      
        '                     Else coalesce(CC.NR_AGENCIA || '#39' '#39' || CC.NR' +
        '_CONTA || '#39' '#39' || CC.NOM_CONTA, CASE E.TIPO'
      
        '                                                                ' +
        '                                     WHEN 0 THEN '#39' DINHEIRO'#39
      
        '                                                                ' +
        '                                     WHEN 1 THEN '#39' CHEQUE PR'#211'PRI' +
        'O'#39
      
        '                                                                ' +
        '                                     WHEN 2 THEN '#39' DEP'#211'SITO'#39
      
        '                                                                ' +
        '                                     WHEN 3 THEN '#39' PERMUTA'#39
      
        '                                                                ' +
        '                                     WHEN 4 THEN '#39' DESCONTO'#39
      
        '                                                                ' +
        '                                   END)'
      '                   END AS CONTA'
      '              FROM CR1 C'
      
        '                   LEFT OUTER JOIN EXTRATO_CR1 EC ON EC.CR1 = C.' +
        'ID'
      
        '                   LEFT OUTER JOIN EXTRATO E ON E.ID = EC.EXTRAT' +
        'O'
      
        '                   LEFT OUTER JOIN CONTA_CORRENTE CC ON CC.ID = ' +
        'E.ID_CONTA'
      
        '                   LEFT OUTER JOIN VENDAS1 V ON V.NUMDOC = C.NR_' +
        'DOCUMENTO'
      
        '                   LEFT OUTER JOIN CONTA_CORRENTE CV ON CV.ID = ' +
        'v.CONTA_BOLETO'
      
        '                   LEFT OUTER JOIN FOP F ON F.COD_FOP = V.COD_FO' +
        'P'
      '              WHERE C.COD_CLIENTE = 1785 and'
      '                    c.DTAREC is not null'
      '              ORDER BY COD_CLIENTE,'
      '                       DTAVEN DESC'
      '              limit 10'
      '            ) q2'
      '       Union'
      '       SELECT c.Cod_cliente,'
      '              NR_documento,'
      '              titulo,'
      '              substring(C.HISTORICO1'
      '       from 1 for 500) as historico,'
      '            DTAVEN,'
      '            DTAREC,'
      '            C.valor,'
      '            coalesce(c.valor_recebido, 0) as valor_recebido,'
      '            case'
      '              when dtarec is null then case'
      
        '                                         when DTAVEN >= current_' +
        'date then '#39' '#192' VENCER'#39
      '                                         else '#39' VENCIDO'#39
      '                                       END'
      '              ELSE '#39' PAGO'#39
      '            END AS SITUACAO,'
      '            case'
      
        '              when dtarec is null then coalesce(CV.NR_AGENCIA ||' +
        ' '#39' '#39' || CV.NR_CONTA || '#39' '#39' || CV.NOM_CONTA, F.NOM_FOP)'
      
        '              Else coalesce(CC.NR_AGENCIA || '#39' '#39' || CC.NR_CONTA ' +
        '|| '#39' '#39' || CC.NOM_CONTA, CASE E.TIPO'
      
        '                                                                ' +
        '                              WHEN 0 THEN '#39' DINHEIRO'#39
      
        '                                                                ' +
        '                              WHEN 1 THEN '#39' CHEQUE PR'#211'PRIO'#39
      
        '                                                                ' +
        '                              WHEN 2 THEN '#39' DEP'#211'SITO'#39
      
        '                                                                ' +
        '                              WHEN 3 THEN '#39' PERMUTA'#39
      
        '                                                                ' +
        '                              WHEN 4 THEN '#39' DESCONTO'#39
      
        '                                                                ' +
        '                            END)'
      '            END AS CONTA'
      '       FROM CR1 C'
      '            LEFT OUTER JOIN EXTRATO_CR1 EC ON EC.CR1 = C.ID'
      '            LEFT OUTER JOIN EXTRATO E ON E.ID = EC.EXTRATO'
      
        '            LEFT OUTER JOIN CONTA_CORRENTE CC ON CC.ID = E.ID_CO' +
        'NTA'
      
        '            LEFT OUTER JOIN VENDAS1 V ON V.NUMDOC = C.NR_DOCUMEN' +
        'TO'
      
        '            LEFT OUTER JOIN CONTA_CORRENTE CV ON CV.ID = v.CONTA' +
        '_BOLETO'
      '            LEFT OUTER JOIN FOP F ON F.COD_FOP = V.COD_FOP'
      '       WHERE C.COD_CLIENTE = 1785 AND'
      '             dtarec is null'
      '     ) q1'
      'ORDER BY DTAVEN DESC')
    Left = 392
    object q_ultimos_crcod_cliente: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_cliente'
      Origin = 'cod_cliente'
      ReadOnly = True
    end
    object q_ultimos_crnr_documento: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'nr_documento'
      Origin = 'nr_documento'
      ReadOnly = True
    end
    object q_ultimos_crtitulo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'titulo'
      Origin = 'titulo'
      ReadOnly = True
      FixedChar = True
      Size = 6
    end
    object q_ultimos_crhistorico: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'historico'
      Origin = 'historico'
      ReadOnly = True
      BlobType = ftMemo
    end
    object q_ultimos_crdtaven: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'dtaven'
      Origin = 'dtaven'
      ReadOnly = True
    end
    object q_ultimos_crdtarec: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'dtarec'
      Origin = 'dtarec'
      ReadOnly = True
    end
    object q_ultimos_crvalor: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valor'
      Origin = 'valor'
      ReadOnly = True
      Precision = 15
      Size = 2
    end
    object q_ultimos_crvalor_recebido: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valor_recebido'
      Origin = 'valor_recebido'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_ultimos_crsituacao: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'situacao'
      Origin = 'situacao'
      ReadOnly = True
      BlobType = ftMemo
    end
    object q_ultimos_crconta: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'conta'
      Origin = 'conta'
      ReadOnly = True
      BlobType = ftMemo
    end
  end
  object ds_ultimos_cr: TDataSource
    DataSet = q_ultimos_cr
    Left = 392
    Top = 56
  end
  object dst_ultimos_cr: TfrxDBDataset
    UserName = 'dst_ultimos_cr'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cod_cliente=COD_CLIENTE'
      'nr_documento=NR_DOCUMENTO'
      'titulo=TITULO'
      'historico=HISTORICO'
      'dtaven=DTAVEN'
      'dtarec=DTAREC'
      'valor=VALOR'
      'valor_recebido=VALOR_RECEBIDO'
      'situacao=SITUACAO'
      'conta=CONTA')
    DataSet = q_ultimos_cr
    BCDToCurrency = False
    Left = 392
    Top = 112
  end
  object q_venda_espelho: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'select v.NUMDOC,'
      '       V.DTADOC,'
      '       V.DTA_EMISSAO,'
      '       V.OBSERVACOES_PEDIDO AS OBS,'
      '       PZ.PRAZO,'
      '       V.TOT_LIQUIDO,'
      
        '       ((V.TOT_BRUTO - V.TOT_LIQUIDO) / V.TOT_BRUTO) * 100 AS DE' +
        'SCONTO_PEDIDO,'
      '       coalesce(('
      '                  select sum(valor)'
      '                  from cr1 as cr'
      '                  where cr.nr_documento = v.NUMDOC'
      '       ), 0) - case'
      
        '                 when cd.UF <> '#39'SC'#39' and v.nfe is not null then v' +
        '.VLR_ST'
      '                 else 0'
      '               end as valor_cr,'
      '       c.COD_CLIENTE,'
      '       c.NOM_CLIENTE,'
      '       c.ENDERECO || '#39#39','
      '       '#39#39'       || C.NR_ENDERECO AS CLIENTE_ENDERECO,'
      '       c.BAIRRO AS CLIENTE_BAIRRO,'
      '       C.CEP AS CEP_CLIENTE,'
      '       coalesce(c.cnpj, c.cpf) as cliente_cnpj_cpf,'
      '       coalesce(c.ie, c.rg) as cliente_ie_rg,'
      
        '       cast(cd.nom_cidade || '#39' - '#39' || cd.uf as varchar(300)) as ' +
        'cliente_cidade,'
      '       c.telefone as fone_CLIENTE,'
      '       c.fax,'
      '       c.contato,'
      '       c.aviso,'
      '       r.id as codrep,'
      '       r.NOM_REPRESENTANTE,'
      '       b.NOM_BANCO,'
      '       r.NR_BANCO,'
      '       r.NR_AGENCIA,'
      '       r.NR_CONTA_CORRENTE,'
      '       r.email,'
      '       r.fone,'
      '       r.celular,'
      '       p.COD_PRODUTO,'
      '       CASE'
      
        '         WHEN V2.PROMOCAO = '#39'S'#39' THEN cast (P.NOM_PRODUTO || '#39'*'#39' ' +
        'as varchar (300))'
      '         ELSE cast (p.NOM_PRODUTO as varchar (300))'
      '       END NOM_PRODUTO,'
      '       coalesce(v2.preco_custo, p.custo_total) as custo,'
      '       p.custo_total,'
      '       p.LUCRO,'
      
        '       (p.custo_total *(1 +(p.lucro / 100))) as preco_venda_calc' +
        ','
      
        '       (((v2.PRECO - coalesce(v2.preco_custo, p.custo_total)) / ' +
        'coalesce(v2.preco_custo, p.custo_total))) * 100 as margem,'
      '       coalesce(v2.PRECO_BRUTO, P.PRECO_VENDA) AS PRECO_VENDA,'
      '       ((v2.PRECO / P.custo_total) - 1) * 100 as margem,'
      '       p.ord_pauta,'
      '       V2.ID,'
      '       v2.PRECO,'
      '       v2.DESCONTO,'
      '       v2.QTD,'
      '       v2.SUB_TOTAL,'
      '       v.VLR_COMISSAO,'
      '       V2.SUB_TOTAL *(V.TOT_LIQUIDO / coalesce(('
      
        '                                                 select sum(valo' +
        'r)'
      '                                                 from cr1 as cr'
      
        '                                                 where cr.nr_doc' +
        'umento = v.NUMDOC'
      '       ), V.TOT_LIQUIDO)) AS SUBTOTAL_RATEADO,'
      '       0 AS VLR_COMISSAO_RATEADO,'
      '       V.FATURADO,'
      '       v2.volume,'
      '       V2.PROMOCAO,'
      '       P.GRADE_COMISSAO as TIPO,'
      '       '#39'N'#227'o'#39'       AS SUPERVISAO,'
      '       v.PERC_COMISSAO,'
      '       s.NOM_REPRESENTANTE as supervisor,'
      '       '#39#39#39#39'       as contido,'
      '       tl.NOME as USUARIO_LIBEROU_DESCONTO,'
      '       v.MOTIVO_LIBERACAO_DESCONTO,'
      '       coalesce(('
      '                  select sum(vc.preco_custo * vc.qtd)'
      '                  from vendas2 as vc'
      '                  where vc.numdoc = v.NUMDOC'
      '       ), V.TOT_LIQUIDO) as total_custo'
      'from vendas1 v'
      '     inner join cliente c on (c.COD_CLIENTE = v.cod_cliente)'
      '     inner join CIDADES cd on (c.COD_CIDADE = cd.COD_CIDADE)'
      '     inner join vendas2 v2 on (v.NUMDOC = v2.NUMDOC)'
      '     inner join REPRESENTANTE r on (r.ID = v.COD_REPRESENTANTE)'
      '     left join REPRESENTANTE s on (s.ID = v.COD_SUPERVISOR)'
      '     left join BANCO b on b.ID = cast (r.NR_BANCO as integer)'
      '     inner join produto p on (p.COD_PRODUTO = v2.COD_PRODUTO)'
      '     left join grupo g on (g.COD_GRUPO = p.COD_GRUPO)'
      '     INNER JOIN PRAZO PZ ON (PZ.ID = V.COD_PRAZO_PGTO)'
      
        '     left outer join tbusu tl on tl.codusu = cast(v.USUARIO_LIBE' +
        'ROU_DESCONTO as integer)'
      'where v.consignacao <> '#39'1'#39' and'
      '      p.custo is not null and'
      '      p.custo > 0 and'
      '      v.TOT_LIQUIDO > 0 and'
      '      v.COD_REPRESENTANTE = 589 and'
      '      v.numdoc = 66882order by r.NOM_REPRESENTANTE,'
      '      v.dtadoc,'
      '      v.numdoc,'
      '      p.ord_pauta')
    Left = 728
    Top = 8
    object q_venda_espelhonumdoc: TIntegerField
      FieldName = 'numdoc'
      Origin = 'numdoc'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_venda_espelhodtadoc: TDateField
      FieldName = 'dtadoc'
      Origin = 'dtadoc'
    end
    object q_venda_espelhodta_emissao: TDateField
      FieldName = 'dta_emissao'
      Origin = 'dta_emissao'
    end
    object q_venda_espelhoobs: TMemoField
      FieldName = 'obs'
      Origin = 'obs'
      BlobType = ftMemo
    end
    object q_venda_espelhoprazo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'prazo'
      Origin = 'prazo'
      Size = 40
    end
    object q_venda_espelhotot_liquido: TBCDField
      FieldName = 'tot_liquido'
      Origin = 'tot_liquido'
      Precision = 15
    end
    object q_venda_espelhodesconto_pedido: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'desconto_pedido'
      Origin = 'desconto_pedido'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_venda_espelhovalor_cr: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valor_cr'
      Origin = 'valor_cr'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_venda_espelhocod_cliente: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_cliente'
      Origin = 'cod_cliente'
    end
    object q_venda_espelhonom_cliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_cliente'
      Origin = 'nom_cliente'
      Size = 150
    end
    object q_venda_espelhocliente_endereco: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'cliente_endereco'
      Origin = 'cliente_endereco'
      ReadOnly = True
      BlobType = ftMemo
    end
    object q_venda_espelhocliente_bairro: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cliente_bairro'
      Origin = 'cliente_bairro'
      Size = 30
    end
    object q_venda_espelhocep_cliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cep_cliente'
      Origin = 'cep_cliente'
      FixedChar = True
      Size = 10
    end
    object q_venda_espelhocliente_cnpj_cpf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cliente_cnpj_cpf'
      Origin = 'cliente_cnpj_cpf'
      ReadOnly = True
      FixedChar = True
      Size = 40
    end
    object q_venda_espelhocliente_ie_rg: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cliente_ie_rg'
      Origin = 'cliente_ie_rg'
      ReadOnly = True
      FixedChar = True
      Size = 40
    end
    object q_venda_espelhocliente_cidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cliente_cidade'
      Origin = 'cliente_cidade'
      ReadOnly = True
      Size = 300
    end
    object q_venda_espelhofone_cliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fone_cliente'
      Origin = 'fone_cliente'
      FixedChar = True
      Size = 14
    end
    object q_venda_espelhofax: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fax'
      Origin = 'fax'
      FixedChar = True
      Size = 14
    end
    object q_venda_espelhocontato: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'contato'
      Origin = 'contato'
      Size = 30
    end
    object q_venda_espelhoaviso: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'aviso'
      Origin = 'aviso'
      BlobType = ftMemo
    end
    object q_venda_espelhocodrep: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'codrep'
      Origin = 'codrep'
    end
    object q_venda_espelhonom_representante: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_representante'
      Origin = 'nom_representante'
      Size = 50
    end
    object q_venda_espelhonom_banco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_banco'
      Origin = 'nom_banco'
      Size = 30
    end
    object q_venda_espelhonr_banco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nr_banco'
      Origin = 'nr_banco'
      FixedChar = True
      Size = 4
    end
    object q_venda_espelhonr_agencia: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nr_agencia'
      Origin = 'nr_agencia'
      FixedChar = True
      Size = 10
    end
    object q_venda_espelhonr_conta_corrente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nr_conta_corrente'
      Origin = 'nr_conta_corrente'
      FixedChar = True
    end
    object q_venda_espelhoemail: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'email'
      Origin = 'email'
      Size = 50
    end
    object q_venda_espelhofone: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fone'
      Origin = 'fone'
      FixedChar = True
      Size = 14
    end
    object q_venda_espelhocelular: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'celular'
      Origin = 'celular'
      FixedChar = True
      Size = 14
    end
    object q_venda_espelhocod_produto: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
    end
    object q_venda_espelhonom_produto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_produto'
      Origin = 'nom_produto'
      ReadOnly = True
      Size = 300
    end
    object q_venda_espelhocusto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'custo'
      Origin = 'custo'
      ReadOnly = True
      Precision = 15
      Size = 2
    end
    object q_venda_espelhocusto_total: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'custo_total'
      Origin = 'custo_total'
      Precision = 15
      Size = 2
    end
    object q_venda_espelholucro: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'lucro'
      Origin = 'lucro'
      Precision = 15
      Size = 2
    end
    object q_venda_espelhopreco_venda_calc: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'preco_venda_calc'
      Origin = 'preco_venda_calc'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_venda_espelhomargem: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'margem'
      Origin = 'margem'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_venda_espelhopreco_venda: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'preco_venda'
      Origin = 'preco_venda'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_venda_espelhomargem_1: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'margem_1'
      Origin = 'margem'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_venda_espelhoord_pauta: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ord_pauta'
      Origin = 'ord_pauta'
    end
    object q_venda_espelhoid: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id'
      Origin = 'id'
    end
    object q_venda_espelhopreco: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'preco'
      Origin = 'preco'
      Precision = 15
    end
    object q_venda_espelhodesconto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'desconto'
      Origin = 'desconto'
      Precision = 15
    end
    object q_venda_espelhoqtd: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'qtd'
      Origin = 'qtd'
      Precision = 15
      Size = 2
    end
    object q_venda_espelhosub_total: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'sub_total'
      Origin = 'sub_total'
      Precision = 15
    end
    object q_venda_espelhovlr_comissao: TBCDField
      FieldName = 'vlr_comissao'
      Origin = 'vlr_comissao'
      Precision = 15
      Size = 2
    end
    object q_venda_espelhosubtotal_rateado: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'subtotal_rateado'
      Origin = 'subtotal_rateado'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_venda_espelhovlr_comissao_rateado: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vlr_comissao_rateado'
      Origin = 'vlr_comissao_rateado'
      ReadOnly = True
    end
    object q_venda_espelhofaturado: TIntegerField
      FieldName = 'faturado'
      Origin = 'faturado'
    end
    object q_venda_espelhovolume: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'volume'
      Origin = 'volume'
      Precision = 15
      Size = 2
    end
    object q_venda_espelhopromocao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'promocao'
      Origin = 'promocao'
      FixedChar = True
      Size = 1
    end
    object q_venda_espelhotipo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipo'
      Origin = 'tipo'
      FixedChar = True
      Size = 1
    end
    object q_venda_espelhosupervisao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'supervisao'
      Origin = 'supervisao'
      ReadOnly = True
      Size = 32767
    end
    object q_venda_espelhosupervisor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'supervisor'
      Origin = 'supervisor'
      Size = 50
    end
    object q_venda_espelhocontido: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'contido'
      Origin = 'contido'
      ReadOnly = True
      Size = 32767
    end
    object q_venda_espelhousuario_liberou_desconto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'usuario_liberou_desconto'
      Origin = 'usuario_liberou_desconto'
      Size = 50
    end
    object q_venda_espelhomotivo_liberacao_desconto: TStringField
      FieldName = 'motivo_liberacao_desconto'
      Origin = 'motivo_liberacao_desconto'
      Size = 100
    end
    object q_venda_espelhototal_custo: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'total_custo'
      Origin = 'total_custo'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_venda_espelhoperc_comissao: TSingleField
      FieldName = 'perc_comissao'
      Origin = 'perc_comissao'
    end
  end
  object ds_venda_espelho: TDataSource
    DataSet = q_venda_espelho
    Left = 736
    Top = 62
  end
  object dst_venda_espelho: TfrxDBDataset
    UserName = 'dst_venda_espelho'
    CloseDataSource = True
    FieldAliases.Strings = (
      'numdoc=NUMDOC'
      'dtadoc=DTADOC'
      'dta_emissao=DTA_EMISSAO'
      'obs=OBS'
      'prazo=PRAZO'
      'tot_liquido=TOT_LIQUIDO'
      'desconto_pedido=DESCONTO_PEDIDO'
      'valor_cr=VALOR_CR'
      'cod_cliente=COD_CLIENTE'
      'nom_cliente=NOM_CLIENTE'
      'cliente_endereco=CLIENTE_ENDERECO'
      'cliente_bairro=CLIENTE_BAIRRO'
      'cep_cliente=CEP_CLIENTE'
      'cliente_cnpj_cpf=CLIENTE_CNPJ_CPF'
      'cliente_ie_rg=CLIENTE_IE_RG'
      'cliente_cidade=CLIENTE_CIDADE'
      'fone_cliente=FONE_CLIENTE'
      'fax=FAX'
      'contato=CONTATO'
      'aviso=AVISO'
      'codrep=CODREP'
      'nom_representante=NOM_REPRESENTANTE'
      'nom_banco=NOM_BANCO'
      'nr_banco=NR_BANCO'
      'nr_agencia=NR_AGENCIA'
      'nr_conta_corrente=NR_CONTA_CORRENTE'
      'email=EMAIL'
      'fone=FONE'
      'celular=CELULAR'
      'cod_produto=COD_PRODUTO'
      'nom_produto=NOM_PRODUTO'
      'custo=CUSTO'
      'custo_total=CUSTO_TOTAL'
      'lucro=LUCRO'
      'preco_venda_calc=PRECO_VENDA_CALC'
      'margem=MARGEM'
      'preco_venda=PRECO_VENDA'
      'margem_1=MARGEM_1'
      'ord_pauta=ORD_PAUTA'
      'id=ID'
      'preco=PRECO'
      'desconto=DESCONTO'
      'qtd=QTD'
      'sub_total=SUB_TOTAL'
      'vlr_comissao=VLR_COMISSAO'
      'subtotal_rateado=SUBTOTAL_RATEADO'
      'vlr_comissao_rateado=VLR_COMISSAO_RATEADO'
      'faturado=FATURADO'
      'promocao=PROMOCAO'
      'volume=VOLUME'
      'tipo=TIPO'
      'supervisao=SUPERVISAO'
      'perc_comissao=PERC_COMISSAO'
      'perc_comissao_antiga=PERC_COMISSAO_ANTIGA'
      'usuario_liberou_desconto=USUARIO_LIBEROU_DESCONTO'
      'motivo_liberacao_desconto=MOTIVO_LIBERACAO_DESCONTO'
      'total_custo=TOTAL_CUSTO'
      'supervisor=SUPERVISOR'
      'contido=CONTIDO')
    DataSet = q_venda_espelho
    BCDToCurrency = False
    Left = 736
    Top = 120
  end
  object q_pedidos_vendedor: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'SELECT v1.COD_REPRESENTANTE, v1.USUARIO_CHECOU_PEDIDO_VENDEDOR||' +
        #39'-'#39'||u.NOME as USUARIO_CHECOU,  v1.NUMDOC, v1.DTADOC, c.COD_CLIE' +
        'NTE||'#39'-'#39'||c.NOM_CLIENTE as cliente, c.ENDERECO, c.NR_ENDERECO, c' +
        '.CEP, cid.NOM_CIDADE||'#39'-'#39'||cid.UF as cidade, C.CNPJ, C.IE, C.RG,' +
        'C.CPF, C.EMAIL, v1.TOT_BRUTO, v1.TOT_LIQUIDO,  v1.COD_FOP||'#39'-'#39'||' +
        'f.NOM_FOP as fop, v1.COD_REPRESENTANTE||'#39'-'#39'||r.NOM_REPRESENTANTE' +
        ' as representante, p.PRAZO, '#39#39' as NR_PEDIDO_PALM, 0 as PALM_NR_C' +
        'ONEXAO, v1.OBSERVACOES_PEDIDO,  v2.ID, v2.COD_PRODUTO||'#39'-'#39'||pr.N' +
        'OM_PRODUTO as produto, pr.unidade, v2.QTD, v2.PRECO, v2.SUB_TOTA' +
        'L, v2.PRECO_BRUTO, (((v2.PRECO_BRUTO - v2.PRECO)/v2.PRECO_BRUTO)' +
        ' * 100) AS PERC_DESC, v2.VOLUME  FROM vendas1_orig v1  LEFT OUTE' +
        'R join tbusu u on (cast(u.codusu as INTEGER) = v1.USUARIO_CHECOU' +
        '_PEDIDO_VENDEDOR)  inner join vendas2_orig v2 on (v2.NUMDOC = v1' +
        '.NUMDOC) inner join CLIENTE c on (c.COD_CLIENTE = v1.COD_CLIENTE' +
        ') inner join Cidades cid on (cid.COD_Cidade = c.COD_cidade) inne' +
        'r join REPRESENTANTE r on (r.id = v1.COD_REPRESENTANTE) inner jo' +
        'in prazo p on (p.ID = v1.COD_PRAZO_PGTO) inner join fop f on (f.' +
        'COD_FOP = v1.COD_FOP)  inner join produto pr on (pr.COD_PRODUTO ' +
        '= v2.COD_PRODUTO) WHERE 1 = 1 and v1.numdoc in (31420) order by ' +
        ' representante, v1.NUMDOC, v2.COD_PRODUTO, v2.VOLUME ')
    Left = 960
    Top = 16
    object q_pedidos_vendedorcod_representante: TIntegerField
      FieldName = 'cod_representante'
      Origin = 'cod_representante'
    end
    object q_pedidos_vendedorusuario_checou: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'usuario_checou'
      Origin = 'usuario_checou'
      ReadOnly = True
      BlobType = ftMemo
    end
    object q_pedidos_vendedornumdoc: TIntegerField
      FieldName = 'numdoc'
      Origin = 'numdoc'
    end
    object q_pedidos_vendedordtadoc: TDateField
      FieldName = 'dtadoc'
      Origin = 'dtadoc'
    end
    object q_pedidos_vendedorcliente: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'cliente'
      Origin = 'cliente'
      ReadOnly = True
      BlobType = ftMemo
    end
    object q_pedidos_vendedorendereco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'endereco'
      Origin = 'endereco'
      Size = 200
    end
    object q_pedidos_vendedornr_endereco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nr_endereco'
      Origin = 'nr_endereco'
      Size = 10
    end
    object q_pedidos_vendedorcep: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cep'
      Origin = 'cep'
      FixedChar = True
      Size = 10
    end
    object q_pedidos_vendedorcidade: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'cidade'
      Origin = 'cidade'
      ReadOnly = True
      BlobType = ftMemo
    end
    object q_pedidos_vendedorcnpj: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cnpj'
      Origin = 'cnpj'
      FixedChar = True
      Size = 40
    end
    object q_pedidos_vendedorie: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ie'
      Origin = 'ie'
      FixedChar = True
      Size = 40
    end
    object q_pedidos_vendedorrg: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'rg'
      Origin = 'rg'
      FixedChar = True
      Size = 40
    end
    object q_pedidos_vendedorcpf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cpf'
      Origin = 'cpf'
      FixedChar = True
      Size = 40
    end
    object q_pedidos_vendedoremail: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'email'
      Origin = 'email'
      Size = 50
    end
    object q_pedidos_vendedortot_bruto: TBCDField
      FieldName = 'tot_bruto'
      Origin = 'tot_bruto'
      Precision = 15
      Size = 2
    end
    object q_pedidos_vendedortot_liquido: TBCDField
      FieldName = 'tot_liquido'
      Origin = 'tot_liquido'
      Precision = 15
      Size = 2
    end
    object q_pedidos_vendedorfop: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'fop'
      Origin = 'fop'
      ReadOnly = True
      BlobType = ftMemo
    end
    object q_pedidos_vendedorrepresentante: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'representante'
      Origin = 'representante'
      ReadOnly = True
      BlobType = ftMemo
    end
    object q_pedidos_vendedorprazo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'prazo'
      Origin = 'prazo'
      Size = 40
    end
    object q_pedidos_vendedornr_pedido_palm: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nr_pedido_palm'
      Origin = 'nr_pedido_palm'
      ReadOnly = True
      Size = 32767
    end
    object q_pedidos_vendedorpalm_nr_conexao: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'palm_nr_conexao'
      Origin = 'palm_nr_conexao'
      ReadOnly = True
    end
    object q_pedidos_vendedorobservacoes_pedido: TMemoField
      FieldName = 'observacoes_pedido'
      Origin = 'observacoes_pedido'
      BlobType = ftMemo
    end
    object q_pedidos_vendedorid: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id'
      Origin = 'id'
    end
    object q_pedidos_vendedorproduto: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'produto'
      Origin = 'produto'
      ReadOnly = True
      BlobType = ftMemo
    end
    object q_pedidos_vendedorunidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'unidade'
      Origin = 'unidade'
      FixedChar = True
      Size = 3
    end
    object q_pedidos_vendedorqtd: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'qtd'
      Origin = 'qtd'
      Precision = 15
      Size = 2
    end
    object q_pedidos_vendedorpreco: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'preco'
      Origin = 'preco'
      Precision = 15
    end
    object q_pedidos_vendedorsub_total: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'sub_total'
      Origin = 'sub_total'
      Precision = 15
    end
    object q_pedidos_vendedorpreco_bruto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'preco_bruto'
      Origin = 'preco_bruto'
      Precision = 15
      Size = 2
    end
    object q_pedidos_vendedorperc_desc: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'perc_desc'
      Origin = 'perc_desc'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_pedidos_vendedorvolume: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'volume'
      Origin = 'volume'
      Precision = 15
      Size = 2
    end
  end
  object ds_pedidos_vendedor: TDataSource
    DataSet = q_pedidos_vendedor
    Left = 960
    Top = 70
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'dst_pedidos_vendedor'
    CloseDataSource = True
    FieldAliases.Strings = (
      'cod_representante=COD_REPRESENTANTE'
      'usuario_checou=USUARIO_CHECOU'
      'numdoc=NUMDOC'
      'dtadoc=DTADOC'
      'cliente=CLIENTE'
      'endereco=ENDERECO'
      'nr_endereco=NR_ENDERECO'
      'cep=CEP'
      'cidade=CIDADE'
      'cnpj=CNPJ'
      'ie=IE'
      'rg=RG'
      'cpf=CPF'
      'email=EMAIL'
      'tot_bruto=TOT_BRUTO'
      'tot_liquido=TOT_LIQUIDO'
      'fop=FOP'
      'representante=REPRESENTANTE'
      'prazo=PRAZO'
      'nr_pedido_palm=NR_PEDIDO_PALM'
      'palm_nr_conexao=PALM_NR_CONEXAO'
      'observacoes_pedido=OBSERVACOES_PEDIDO'
      'id=ID'
      'produto=PRODUTO'
      'unidade=UNIDADE'
      'qtd=QTD'
      'preco=PRECO'
      'sub_total=SUB_TOTAL'
      'preco_bruto=PRECO_BRUTO'
      'perc_desc=PERC_DESC'
      'volume=VOLUME')
    DataSet = q_pedidos_vendedor
    BCDToCurrency = False
    Left = 960
    Top = 128
  end
  object q_plano_contas_lista: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'SELECT a.ID, a.NR_CONTA, a.ID1, a.ID2, a.ID3, a.ID_PAI2, a.ID_PA' +
        'I3, a.ID_PAI4, a.DESCRICAO1, a.DESCRICAO2, a.DESCRICAO3, a.DESCR' +
        'ICAO4'
      'FROM V_PLANO_CONTAS_LISTA a')
    Left = 392
    Top = 496
    object q_plano_contas_listaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
    end
    object q_plano_contas_listanr_conta: TStringField
      FieldName = 'nr_conta'
      Origin = 'nr_conta'
      FixedChar = True
      Size = 8
    end
    object q_plano_contas_listaid1: TIntegerField
      FieldName = 'id1'
      Origin = 'id1'
    end
    object q_plano_contas_listaid2: TIntegerField
      FieldName = 'id2'
      Origin = 'id2'
    end
    object q_plano_contas_listaid3: TIntegerField
      FieldName = 'id3'
      Origin = 'id3'
    end
    object q_plano_contas_listaid_pai2: TIntegerField
      FieldName = 'id_pai2'
      Origin = 'id_pai2'
    end
    object q_plano_contas_listaid_pai3: TIntegerField
      FieldName = 'id_pai3'
      Origin = 'id_pai3'
    end
    object q_plano_contas_listaid_pai4: TIntegerField
      FieldName = 'id_pai4'
      Origin = 'id_pai4'
    end
    object q_plano_contas_listadescricao1: TMemoField
      FieldName = 'descricao1'
      Origin = 'descricao1'
      BlobType = ftMemo
    end
    object q_plano_contas_listadescricao2: TMemoField
      FieldName = 'descricao2'
      Origin = 'descricao2'
      BlobType = ftMemo
    end
    object q_plano_contas_listadescricao3: TMemoField
      FieldName = 'descricao3'
      Origin = 'descricao3'
      BlobType = ftMemo
    end
    object q_plano_contas_listadescricao4: TMemoField
      FieldName = 'descricao4'
      Origin = 'descricao4'
      BlobType = ftMemo
    end
  end
  object ds_plano_contas_lista: TDataSource
    DataSet = q_plano_contas_lista
    Left = 392
    Top = 536
  end
  object dst_plano_contas_lista: TfrxDBDataset
    UserName = 'dst_plano_contas_lista'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=ID'
      'nr_conta=NR_CONTA'
      'id1=ID1'
      'id2=ID2'
      'id3=ID3'
      'id_pai2=ID_PAI2'
      'id_pai3=ID_PAI3'
      'id_pai4=ID_PAI4'
      'descricao1=DESCRICAO1'
      'descricao2=DESCRICAO2'
      'descricao3=DESCRICAO3'
      'descricao4=DESCRICAO4')
    DataSet = q_plano_contas_lista
    BCDToCurrency = False
    Left = 392
    Top = 592
  end
  object q_desconto_especial: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'select distinct *'
      'from'
      '('
      'select'
      '  '#39'DESCONTO GERAL'#39' AS TIPO, '
      '  p.COD_PRODUTO,'
      '  p.NOM_PRODUTO,'
      '  P.COD_GRUPO,'
      '  G.NOM_GRUPO,'
      '  P.PRECO_VENDA,'
      '  p.peso, '
      '  p.DESCONTO_MAXIMO,'
      '  p.ORD_PAUTA,'
      
        '  P.PRECO_VENDA - (P.PRECO_VENDA * (P.DESCONTO_MAXIMO/100)) AS P' +
        'RECO_DESCONTADO,  '
      '  '#39'OUTROS'#39' DESCONTO_PARA,'
      '  0 as codrep '
      'from '
      '  produto p'
      'INNER JOIN GRUPO G ON (G.COD_GRUPO = P.COD_GRUPO)  '
      'WHERE P.STATUS <> '#39'S'#39'  '
      ''
      'UNION'
      ''
      'select '
      '  '#39'DESCONTO ESPECIAL PRODUTO'#39' AS TIPO,'
      '  p.COD_PRODUTO,'
      '  p.NOM_PRODUTO,'
      '  P.COD_GRUPO,'
      '  G.NOM_GRUPO,'
      '  P.PRECO_VENDA,'
      '  p.peso, '
      '  pR.DESCONTO_MAXIMO,'
      '  p.ORD_PAUTA,'
      
        '  P.PRECO_VENDA - (P.PRECO_VENDA * (PR.DESCONTO_MAXIMO/100)) AS ' +
        'PRECO_DESCONTADO,'
      '  r.NOM_REPRESENTANTE as DESCONTO_PARA,'
      '  r.id as codrep'
      'from '
      '  produto p'
      'INNER JOIN GRUPO G ON (G.COD_GRUPO = P.COD_GRUPO)  '
      
        'INNER JOIN PRODUTO_REPRESENTANTE PR ON (pr.COD_PRODUTO = p.COD_P' +
        'RODUTO)'
      
        'inner join REPRESENTANTE r on (r.id = pr.ID_REPRESENTANTE and r.' +
        'ATIVO = '#39'S'#39')'
      'WHERE P.STATUS <> '#39'S'#39'  '
      ''
      'union'
      ''
      'select '
      '  '#39'DESCONTO ESPECIAL GRUPO'#39' AS TIPO,'
      '  p.COD_PRODUTO,'
      '  p.NOM_PRODUTO,'
      '  P.COD_GRUPO,'
      '  G.NOM_GRUPO,'
      '  P.PRECO_VENDA,'
      '  p.peso, '
      '  GR.DESCONTO_MAXIMO,'
      '  p.ORD_PAUTA,'
      
        '  P.PRECO_VENDA - (P.PRECO_VENDA * (GR.DESCONTO_MAXIMO/100)) AS ' +
        'PRECO_DESCONTADO,'
      '  r.NOM_REPRESENTANTE as DESCONTO_PARA,'
      '  r.id as codrep  '
      'from '
      '  produto p'
      'INNER JOIN GRUPO G ON (G.COD_GRUPO = P.COD_GRUPO)  '
      
        'INNER JOIN grupo_REPRESENTANTE GR ON (Gr.COD_GRUPO = G.COD_GRUPO' +
        ')'
      
        'inner join REPRESENTANTE r on (r.id = Gr.ID_REPRESENTANTE and r.' +
        'ATIVO = '#39'S'#39')'
      'WHERE P.STATUS <> '#39'S'#39'  '
      ') Q1')
    Left = 856
    Top = 496
    object q_desconto_especialtipo: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'tipo'
      Origin = 'tipo'
      ReadOnly = True
      BlobType = ftMemo
    end
    object q_desconto_especialcod_produto: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_desconto_especialnom_produto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_produto'
      Origin = 'nom_produto'
      ReadOnly = True
      Size = 100
    end
    object q_desconto_especialcod_grupo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_grupo'
      Origin = 'cod_grupo'
      ReadOnly = True
    end
    object q_desconto_especialnom_grupo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_grupo'
      Origin = 'nom_grupo'
      ReadOnly = True
      Size = 100
    end
    object q_desconto_especialpreco_venda: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'preco_venda'
      Origin = 'preco_venda'
      ReadOnly = True
      Precision = 15
    end
    object q_desconto_especialpeso: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'peso'
      Origin = 'peso'
      ReadOnly = True
      Precision = 15
      Size = 3
    end
    object q_desconto_especialdesconto_maximo: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'desconto_maximo'
      Origin = 'desconto_maximo'
      ReadOnly = True
      Precision = 15
      Size = 2
    end
    object q_desconto_especialord_pauta: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ord_pauta'
      Origin = 'ord_pauta'
      ReadOnly = True
    end
    object q_desconto_especialpreco_descontado: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'preco_descontado'
      Origin = 'preco_descontado'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_desconto_especialdesconto_para: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'desconto_para'
      Origin = 'desconto_para'
      ReadOnly = True
      Size = 8190
    end
    object q_desconto_especialcodrep: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'codrep'
      Origin = 'codrep'
      ReadOnly = True
    end
  end
  object ds_desconto_especial: TDataSource
    DataSet = q_desconto_especial
    Left = 856
    Top = 550
  end
  object dst_desconto_especial: TfrxDBDataset
    UserName = 'dst_desconto_especial'
    CloseDataSource = True
    FieldAliases.Strings = (
      'tipo=TIPO'
      'cod_produto=COD_PRODUTO'
      'nom_produto=NOM_PRODUTO'
      'cod_grupo=COD_GRUPO'
      'nom_grupo=NOM_GRUPO'
      'preco_venda=PRECO_VENDA'
      'peso=PESO'
      'desconto_maximo=DESCONTO_MAXIMO'
      'ord_pauta=ORD_PAUTA'
      'preco_descontado=PRECO_DESCONTADO'
      'desconto_para=DESCONTO_PARA'
      'codrep=CODREP')
    DataSet = q_desconto_especial
    BCDToCurrency = False
    Left = 856
    Top = 608
  end
  object q_cobranca: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'SELECT distinct '
      '       a.ID,'
      '       a.COD_CLIENTE,'
      '       a.NR_DOCUMENTO,'
      '       a.TITULO,'
      '       a.SEQUENCIA,'
      '       a.COD_EMPRESA,'
      '       a.DTAVEN,'
      '       a.VALOR,'
      '       a.COD_FOP,'
      '       a.HISTORICO,'
      '       a.DTAREC,'
      '       a.BOLETO_RETORNO_CODIGO,'
      '       a.BOLETO_RETORNO_DESCRICAO,'
      '       coalesce(a.VALOR_RECEBIDO, 0) as VALOR_RECEBIDO,'
      '       a.SALDO,'
      '       a.DIAS_ATRASO,'
      '       coalesce(a.VLR_CORRIGIDO, 0) AS VLR_CORRIGIDO,'
      '       a.DESCONTO,'
      '       a.NR_CUPOM,'
      '       a.CONFERIDO,'
      '       a.ID_REPRESENTANTE,'
      '       a.VLR_COMISSAO,'
      '       a.ID_PLANO_CONTAS,'
      '       a.SINCRONIZAR_PALM,'
      '       a.EXTRATO,'
      '       a.VALOR_CORRIGIDO,'
      '       a.BOLETO_REMESSA_ORDEM,'
      '       bc.NR_BANCO,'
      '       bc.NOM_BANCO,'
      '       cc.NR_AGENCIA,'
      '       cc.NR_CONTA,'
      '       cc.nom_conta,'
      '       cc.CODIGO_CEDENTE,'
      
        '       cast ('#39'CB'#39'||lpad(cast(b.DIA as VARCHAR(2)), 2,  '#39'0'#39')||lpa' +
        'd(cast(b.MES as VARCHAR(2)), 2, '#39'0'#39') || b.ID || '#39'. REM'#39' as varch' +
        'ar (50)) AS ARQUIVO,'
      '       b.data,'
      '       CL.COD_CLIENTE,'
      '       CL.NOM_CLIENTE'
      'FROM CR1 a'
      '     left outer join vendas1 v1 on (v1.NUMDOC = a.NR_DOCUMENTO)'
      '     inner join CLIENTE CL on (CL.COD_CLIENTE = a.COD_CLIENTE)'
      
        '     LEFT OUTER join CONTA_CORRENTE cc on (cc.ID = coalesce(a.CO' +
        'NTA_BOLETO, v1.conta_boleto))'
      '     inner join banco bc on (cc.ID_BANCO = bc.ID)'
      
        '     inner join BOLETO_REMESSA_ORDEM b on (b.ID = a.BOLETO_REMES' +
        'SA_ORDEM AND B.CONTA = coalesce(a.CONTA_BOLETO, v1.conta_boleto)' +
        ')'
      'WHERE 1 = 1 and'
      '      b.id = 477 and'
      '      b.conta = 33'
      'order by bc.NR_BANCO,'
      '         cl.nom_cliente,'
      '         a.ID,'
      '         a.dtaven ')
    Left = 960
    Top = 184
    object q_cobrancaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_cobrancacod_cliente: TIntegerField
      FieldName = 'cod_cliente'
      Origin = 'cod_cliente'
    end
    object q_cobrancanr_documento: TIntegerField
      FieldName = 'nr_documento'
      Origin = 'nr_documento'
    end
    object q_cobrancatitulo: TStringField
      FieldName = 'titulo'
      Origin = 'titulo'
      FixedChar = True
      Size = 6
    end
    object q_cobrancasequencia: TIntegerField
      FieldName = 'sequencia'
      Origin = 'sequencia'
    end
    object q_cobrancacod_empresa: TIntegerField
      FieldName = 'cod_empresa'
      Origin = 'cod_empresa'
    end
    object q_cobrancadtaven: TDateField
      FieldName = 'dtaven'
      Origin = 'dtaven'
    end
    object q_cobrancavalor: TBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Precision = 15
      Size = 2
    end
    object q_cobrancacod_fop: TIntegerField
      FieldName = 'cod_fop'
      Origin = 'cod_fop'
    end
    object q_cobrancahistorico: TStringField
      FieldName = 'historico'
      Origin = 'historico'
      Size = 300
    end
    object q_cobrancadtarec: TDateField
      FieldName = 'dtarec'
      Origin = 'dtarec'
    end
    object q_cobrancaboleto_retorno_codigo: TStringField
      FieldName = 'boleto_retorno_codigo'
      Origin = 'boleto_retorno_codigo'
      Size = 50
    end
    object q_cobrancaboleto_retorno_descricao: TStringField
      FieldName = 'boleto_retorno_descricao'
      Origin = 'boleto_retorno_descricao'
      Size = 200
    end
    object q_cobrancavalor_recebido: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valor_recebido'
      Origin = 'valor_recebido'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_cobrancasaldo: TBCDField
      FieldName = 'saldo'
      Origin = 'saldo'
      Precision = 15
      Size = 2
    end
    object q_cobrancadias_atraso: TIntegerField
      FieldName = 'dias_atraso'
      Origin = 'dias_atraso'
    end
    object q_cobrancavlr_corrigido: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vlr_corrigido'
      Origin = 'vlr_corrigido'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_cobrancadesconto: TBCDField
      FieldName = 'desconto'
      Origin = 'desconto'
      Precision = 15
      Size = 2
    end
    object q_cobrancanr_cupom: TIntegerField
      FieldName = 'nr_cupom'
      Origin = 'nr_cupom'
    end
    object q_cobrancaconferido: TStringField
      FieldName = 'conferido'
      Origin = 'conferido'
      FixedChar = True
      Size = 1
    end
    object q_cobrancaid_representante: TIntegerField
      FieldName = 'id_representante'
      Origin = 'id_representante'
    end
    object q_cobrancavlr_comissao: TBCDField
      FieldName = 'vlr_comissao'
      Origin = 'vlr_comissao'
      Precision = 15
      Size = 2
    end
    object q_cobrancaid_plano_contas: TIntegerField
      FieldName = 'id_plano_contas'
      Origin = 'id_plano_contas'
    end
    object q_cobrancasincronizar_palm: TStringField
      FieldName = 'sincronizar_palm'
      Origin = 'sincronizar_palm'
      FixedChar = True
      Size = 1
    end
    object q_cobrancaextrato: TIntegerField
      FieldName = 'extrato'
      Origin = 'extrato'
    end
    object q_cobrancavalor_corrigido: TBCDField
      FieldName = 'valor_corrigido'
      Origin = 'valor_corrigido'
      Precision = 15
      Size = 2
    end
    object q_cobrancaboleto_remessa_ordem: TIntegerField
      FieldName = 'boleto_remessa_ordem'
      Origin = 'boleto_remessa_ordem'
    end
    object q_cobrancanr_banco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nr_banco'
      Origin = 'nr_banco'
      FixedChar = True
      Size = 4
    end
    object q_cobrancanom_banco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_banco'
      Origin = 'nom_banco'
      Size = 30
    end
    object q_cobrancanr_agencia: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nr_agencia'
      Origin = 'nr_agencia'
      FixedChar = True
      Size = 10
    end
    object q_cobrancanr_conta: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nr_conta'
      Origin = 'nr_conta'
    end
    object q_cobrancacodigo_cedente: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'codigo_cedente'
      Origin = 'codigo_cedente'
    end
    object q_cobrancaarquivo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'arquivo'
      Origin = 'arquivo'
      ReadOnly = True
      Size = 50
    end
    object q_cobrancadata: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'data'
      Origin = 'data'
    end
    object q_cobrancacod_cliente_1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_cliente_1'
      Origin = 'cod_cliente'
    end
    object q_cobrancanom_cliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_cliente'
      Origin = 'nom_cliente'
      Size = 150
    end
    object q_cobrancanom_conta: TStringField
      FieldName = 'nom_conta'
      Size = 100
    end
  end
  object ds_cobranca: TDataSource
    DataSet = q_cobranca
    Left = 952
    Top = 230
  end
  object dst_cobranca: TfrxDBDataset
    UserName = 'dst_cobranca'
    CloseDataSource = True
    FieldAliases.Strings = (
      'id=ID'
      'cod_cliente=COD_CLIENTE'
      'nr_documento=NR_DOCUMENTO'
      'titulo=TITULO'
      'sequencia=SEQUENCIA'
      'cod_empresa=COD_EMPRESA'
      'dtaven=DTAVEN'
      'valor=VALOR'
      'cod_fop=COD_FOP'
      'historico=HISTORICO'
      'dtarec=DTAREC'
      'boleto_retorno_codigo=BOLETO_RETORNO_CODIGO'
      'boleto_retorno_descricao=BOLETO_RETORNO_DESCRICAO'
      'valor_recebido=VALOR_RECEBIDO'
      'saldo=SALDO'
      'dias_atraso=DIAS_ATRASO'
      'vlr_corrigido=VLR_CORRIGIDO'
      'desconto=DESCONTO'
      'nr_cupom=NR_CUPOM'
      'conferido=CONFERIDO'
      'id_representante=ID_REPRESENTANTE'
      'vlr_comissao=VLR_COMISSAO'
      'id_plano_contas=ID_PLANO_CONTAS'
      'sincronizar_palm=SINCRONIZAR_PALM'
      'extrato=EXTRATO'
      'valor_corrigido=VALOR_CORRIGIDO'
      'boleto_remessa_ordem=BOLETO_REMESSA_ORDEM'
      'nr_banco=NR_BANCO'
      'nom_banco=NOM_BANCO'
      'nr_agencia=NR_AGENCIA'
      'nr_conta=NR_CONTA'
      'codigo_cedente=CODIGO_CEDENTE'
      'arquivo=ARQUIVO'
      'data=DATA'
      'cod_cliente_1=COD_CLIENTE_1'
      'nom_cliente=NOM_CLIENTE'
      'nom_conta=nom_conta')
    DataSet = q_cobranca
    BCDToCurrency = False
    Left = 960
    Top = 280
  end
  object q_lista_func_cc: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'SELECT a.ID, a.NOM_REPRESENTANTE, a.email, a.fone, a.NR_CONTA_CO' +
        'RRENTE, a.NR_AGENCIA, b.NOM_BANCO, a.TITULAR_CONTA, a.UF_ATUACAO' +
        ' '
      'FROM REPRESENTANTE a '
      'inner join banco b on (b.ID = cast(a.NR_BANCO as integer)) '
      'where a.ATIVO = '#39'S'#39
      ' ')
    Left = 968
    Top = 328
    object q_lista_func_ccid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_lista_func_ccnom_representante: TStringField
      FieldName = 'nom_representante'
      Origin = 'nom_representante'
      Size = 50
    end
    object q_lista_func_ccemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 50
    end
    object q_lista_func_ccfone: TStringField
      FieldName = 'fone'
      Origin = 'fone'
      FixedChar = True
      Size = 14
    end
    object q_lista_func_ccnr_conta_corrente: TStringField
      FieldName = 'nr_conta_corrente'
      Origin = 'nr_conta_corrente'
      FixedChar = True
    end
    object q_lista_func_ccnr_agencia: TStringField
      FieldName = 'nr_agencia'
      Origin = 'nr_agencia'
      FixedChar = True
      Size = 10
    end
    object q_lista_func_ccnom_banco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_banco'
      Origin = 'nom_banco'
      Size = 30
    end
    object q_lista_func_cctitular_conta: TStringField
      FieldName = 'titular_conta'
      Origin = 'titular_conta'
      Size = 50
    end
    object q_lista_func_ccuf_atuacao: TStringField
      FieldName = 'uf_atuacao'
      Origin = 'uf_atuacao'
      Size = 2
    end
  end
  object ds_lista_func_cc: TDataSource
    DataSet = q_lista_func_cc
    Left = 968
    Top = 384
  end
  object dst_lista_func_cc: TfrxDBDataset
    UserName = 'dst_lista_func_cc'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=ID'
      'nom_representante=NOM_REPRESENTANTE'
      'email=EMAIL'
      'fone=FONE'
      'nr_conta_corrente=NR_CONTA_CORRENTE'
      'nr_agencia=NR_AGENCIA'
      'nom_banco=NOM_BANCO'
      'titular_conta=TITULAR_CONTA'
      'uf_atuacao=UF_ATUACAO')
    DataSet = q_lista_func_cc
    BCDToCurrency = False
    Left = 968
    Top = 440
  end
  object ds_fornecedor: TDataSource
    DataSet = q_fornecedor
    Left = 392
    Top = 224
  end
  object q_fornecedor: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'SELECT a.COD_FORNECEDOR, a.RAZAO_SOCIAL, a.FANTASIA, a.TIP_PESSO' +
        'A, a.ENDERECO, a.BAIRRO, a.COD_CIDADE, a.CEP, a.FONE, a.FAX, a.C' +
        'NPCPF, a.IERG, a.EMAIL, a.HOME_PAGE, a.OBSERVACAO, a.LUCRO_DEFIN' +
        'IDO, a.TIPO_EMPRESA, a.USO_PREPEDIDO, a.INATIVO, a.COMPLEMENTO, ' +
        'a.NR_ENDERECO, a.NFE_EMAIL, cd.nom_cidade, cd.uf'
      'FROM FORNECEDOR a'
      'left join cidades cd on cd.cod_cidade = a.cod_cidade '
      'inner join cadmicro mc on (mc.microcod = cd.microcod) '
      'inner join cadmeso ms on (ms.mesocod = mc.mesocod) '
      '')
    Left = 392
    Top = 168
    object q_fornecedorcod_fornecedor: TIntegerField
      FieldName = 'cod_fornecedor'
      Origin = 'cod_fornecedor'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_fornecedorrazao_social: TStringField
      FieldName = 'razao_social'
      Origin = 'razao_social'
      Size = 200
    end
    object q_fornecedorfantasia: TStringField
      FieldName = 'fantasia'
      Origin = 'fantasia'
      Size = 200
    end
    object q_fornecedortip_pessoa: TStringField
      FieldName = 'tip_pessoa'
      Origin = 'tip_pessoa'
      FixedChar = True
      Size = 1
    end
    object q_fornecedorendereco: TStringField
      FieldName = 'endereco'
      Origin = 'endereco'
      Size = 100
    end
    object q_fornecedorbairro: TStringField
      FieldName = 'bairro'
      Origin = 'bairro'
      Size = 100
    end
    object q_fornecedorcod_cidade: TIntegerField
      FieldName = 'cod_cidade'
      Origin = 'cod_cidade'
    end
    object q_fornecedorcep: TStringField
      FieldName = 'cep'
      Origin = 'cep'
      FixedChar = True
      Size = 10
    end
    object q_fornecedorfone: TStringField
      FieldName = 'fone'
      Origin = 'fone'
      FixedChar = True
      Size = 14
    end
    object q_fornecedorfax: TStringField
      FieldName = 'fax'
      Origin = 'fax'
      FixedChar = True
      Size = 14
    end
    object q_fornecedorcnpcpf: TStringField
      FieldName = 'cnpcpf'
      Origin = 'cnpcpf'
      FixedChar = True
      Size = 40
    end
    object q_fornecedorierg: TStringField
      FieldName = 'ierg'
      Origin = 'ierg'
      FixedChar = True
      Size = 40
    end
    object q_fornecedoremail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 50
    end
    object q_fornecedorhome_page: TStringField
      FieldName = 'home_page'
      Origin = 'home_page'
      Size = 50
    end
    object q_fornecedorobservacao: TMemoField
      FieldName = 'observacao'
      Origin = 'observacao'
      BlobType = ftMemo
    end
    object q_fornecedorlucro_definido: TBCDField
      FieldName = 'lucro_definido'
      Origin = 'lucro_definido'
      Precision = 15
      Size = 2
    end
    object q_fornecedortipo_empresa: TIntegerField
      FieldName = 'tipo_empresa'
      Origin = 'tipo_empresa'
    end
    object q_fornecedoruso_prepedido: TStringField
      FieldName = 'uso_prepedido'
      Origin = 'uso_prepedido'
      FixedChar = True
      Size = 1
    end
    object q_fornecedorinativo: TStringField
      FieldName = 'inativo'
      Origin = 'inativo'
      FixedChar = True
      Size = 1
    end
    object q_fornecedorcomplemento: TStringField
      FieldName = 'complemento'
      Origin = 'complemento'
      Size = 40
    end
    object q_fornecedornr_endereco: TStringField
      FieldName = 'nr_endereco'
      Origin = 'nr_endereco'
      Size = 6
    end
    object q_fornecedornfe_email: TStringField
      FieldName = 'nfe_email'
      Origin = 'nfe_email'
      FixedChar = True
      Size = 1
    end
    object q_fornecedornom_cidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_cidade'
      Origin = 'nom_cidade'
      Size = 40
    end
    object q_fornecedoruf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'uf'
      Origin = 'uf'
      FixedChar = True
      Size = 2
    end
  end
  object dst_fornecedor: TfrxDBDataset
    UserName = 'dst_fornecedor'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cod_fornecedor=COD_FORNECEDOR'
      'razao_social=RAZAO_SOCIAL'
      'fantasia=FANTASIA'
      'tip_pessoa=TIP_PESSOA'
      'endereco=ENDERECO'
      'bairro=BAIRRO'
      'cod_cidade=COD_CIDADE'
      'cep=CEP'
      'fone=FONE'
      'fax=FAX'
      'cnpcpf=CNPCPF'
      'ierg=IERG'
      'email=EMAIL'
      'home_page=HOME_PAGE'
      'observacao=OBSERVACAO'
      'lucro_definido=LUCRO_DEFINIDO'
      'tipo_empresa=TIPO_EMPRESA'
      'uso_prepedido=USO_PREPEDIDO'
      'inativo=INATIVO'
      'complemento=COMPLEMENTO'
      'nr_endereco=NR_ENDERECO'
      'nfe_email=NFE_EMAIL'
      'nom_cidade=NOM_CIDADE'
      'uf=UF')
    DataSet = q_fornecedor
    BCDToCurrency = False
    Left = 392
    Top = 280
  end
  object dst_lista_func_sal: TfrxDBDataset
    UserName = 'dst_lista_func_sal'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=ID'
      'nom_representante=NOM_REPRESENTANTE'
      'funcionario=FUNCIONARIO'
      'nr_conta_corrente=NR_CONTA_CORRENTE'
      'nr_agencia=NR_AGENCIA'
      'nom_banco=NOM_BANCO'
      'titular_conta=TITULAR_CONTA'
      'dtaven=DTAVEN'
      'salario=SALARIO'
      'id_1=ID_1'
      'id_plr=ID_PLR'
      'plr=PLR'
      'adiantamentos=ADIANTAMENTOS'
      'comissoes=COMISSOES')
    DataSet = q_lista_func_sal
    BCDToCurrency = False
    Left = 280
    Top = 616
  end
  object ds_lista_func_sal: TDataSource
    DataSet = q_lista_func_sal
    Left = 280
    Top = 560
  end
  object q_lista_func_sal: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'SELECT r.ID, r.NOM_REPRESENTANTE, r.funcionario, r.NR_CONTA_CORR' +
        'ENTE, r.NR_AGENCIA, b.NOM_BANCO, r.TITULAR_CONTA, CP.DTAVEN, coa' +
        'lesce(r.salario,0) as salario, '
      
        '            coalesce((SELECT MAX(CP1.ID) FROM CP1 WHERE CP1.ID_P' +
        'LANO_CONTAS = ( SELECT c.SALARIO_PLANO_CONTAS FROM CONFIGURACAO ' +
        'C) AND CP1.COD_REPRESENTANTE = R.ID AND CP1.DTAVEN = CP.DTAVEN),' +
        '0) AS ID, '
      
        '            coalesce((SELECT MAX(CP_PLR.ID) FROM CP1 CP_PLR WHER' +
        'E CP_PLR.ID_PLANO_CONTAS = ( SELECT c.PLR_PLANO_CONTAS FROM CONF' +
        'IGURACAO C) AND CP_PLR.COD_REPRESENTANTE = R.ID AND CP_PLR.DTAVE' +
        'N = CP.DTAVEN),0) AS ID_PLR, '
      
        '            coalesce((SELECT SUM(CP_PLR.VALOR) FROM CP1 CP_PLR W' +
        'HERE CP_PLR.ID_PLANO_CONTAS = ( SELECT c.PLR_PLANO_CONTAS FROM C' +
        'ONFIGURACAO C) AND CP_PLR.COD_REPRESENTANTE = R.ID AND CP_PLR.DT' +
        'AVEN = CP.DTAVEN),0) AS PLR, '
      
        '            coalesce((SELECT MAX(CP1.VALOR) FROM CP1 WHERE CP1.I' +
        'D_PLANO_CONTAS = ( SELECT c.VALE_PLANO_CONTAS FROM CONFIGURACAO ' +
        'C) AND CP1.COD_REPRESENTANTE = R.ID AND CP1.DTAVEN = CP.DTAVEN),' +
        '0) AS ADIANTAMENTOS , '
      
        '            coalesce((SELECT SUM(CP_COMISSOES.VALOR) FROM CP1 CP' +
        '_COMISSOES WHERE CP_COMISSOES.ID_PLANO_CONTAS = ( SELECT c.COMIS' +
        'SAO_PLANO_CONTAS FROM CONFIGURACAO C) AND CP_COMISSOES.COD_REPRE' +
        'SENTANTE = R.ID AND CP_COMISSOES.DTAVEN = CP.DTAVEN),0) AS COMIS' +
        'SOES '
      
        '          FROM REPRESENTANTE R inner join banco b on (b.ID = CAS' +
        'T(r.NR_BANCO AS INTEGER)) INNER JOIN CP1 CP ON (CP.COD_REPRESENT' +
        'ANTE = R.ID)')
    Left = 280
    Top = 504
    object q_lista_func_salid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_lista_func_salnom_representante: TStringField
      FieldName = 'nom_representante'
      Origin = 'nom_representante'
      Size = 50
    end
    object q_lista_func_salfuncionario: TStringField
      FieldName = 'funcionario'
      Origin = 'funcionario'
      FixedChar = True
      Size = 1
    end
    object q_lista_func_salnr_conta_corrente: TStringField
      FieldName = 'nr_conta_corrente'
      Origin = 'nr_conta_corrente'
      FixedChar = True
    end
    object q_lista_func_salnr_agencia: TStringField
      FieldName = 'nr_agencia'
      Origin = 'nr_agencia'
      FixedChar = True
      Size = 10
    end
    object q_lista_func_salnom_banco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_banco'
      Origin = 'nom_banco'
      Size = 30
    end
    object q_lista_func_saltitular_conta: TStringField
      FieldName = 'titular_conta'
      Origin = 'titular_conta'
      Size = 50
    end
    object q_lista_func_saldtaven: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'dtaven'
      Origin = 'dtaven'
    end
    object q_lista_func_salsalario: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'salario'
      Origin = 'salario'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_lista_func_salid_1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id_1'
      Origin = 'id'
      ReadOnly = True
    end
    object q_lista_func_salid_plr: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id_plr'
      Origin = 'id_plr'
      ReadOnly = True
    end
    object q_lista_func_salplr: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'plr'
      Origin = 'plr'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_lista_func_saladiantamentos: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'adiantamentos'
      Origin = 'adiantamentos'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_lista_func_salcomissoes: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'comissoes'
      Origin = 'comissoes'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
  end
  object qListaTabelas: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'SELECT A.RDB$RELATION_NAME AS TABELAS'
      'FROM RDB$RELATIONS a'
      
        'where a.RDB$RELATION_NAME NOT LIKE '#39'%$%'#39' AND A.RDB$VIEW_BLR IS N' +
        'ULL;')
    Left = 11
    Top = 384
    object qListaTabelasTABELAS: TStringField
      FieldName = 'TABELAS'
      Size = 31
    end
  end
  object qDadosOrbi: TFDQuery
    Connection = dao.CN
    Left = 7
    Top = 440
  end
  object Q_REPRESENTANTES: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'SELECT A.RDB$RELATION_NAME AS TABELAS'
      'FROM RDB$RELATIONS a'
      
        'where a.RDB$RELATION_NAME NOT LIKE '#39'%$%'#39' AND A.RDB$VIEW_BLR IS N' +
        'ULL;')
    Left = 75
    Top = 432
  end
  object q_entradas_resumido: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'select e1.nr_documento,e1.dta_documento, e1.cod_fornecedor, e1.V' +
        'L_TOTAL, '
      'f.razao_social from entrada1 e1 '
      'left join fornecedor f on f.cod_fornecedor=e1.cod_fornecedor'
      ''
      '')
    Left = 344
    Top = 320
    object q_entradas_resumidonr_documento: TIntegerField
      FieldName = 'nr_documento'
      Origin = 'nr_documento'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_entradas_resumidodta_documento: TDateField
      FieldName = 'dta_documento'
      Origin = 'dta_documento'
    end
    object q_entradas_resumidocod_fornecedor: TIntegerField
      FieldName = 'cod_fornecedor'
      Origin = 'cod_fornecedor'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_entradas_resumidovl_total: TBCDField
      FieldName = 'vl_total'
      Origin = 'vl_total'
      Precision = 15
      Size = 2
    end
    object q_entradas_resumidorazao_social: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'razao_social'
      Origin = 'razao_social'
      Size = 200
    end
  end
  object ds_entradas_resumido: TDataSource
    DataSet = q_entradas_resumido
    Left = 344
    Top = 376
  end
  object dst_entradas_resumido: TfrxDBDataset
    UserName = 'dst_entradas_resumido'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nr_documento=NR_DOCUMENTO'
      'dta_documento=DTA_DOCUMENTO'
      'cod_fornecedor=COD_FORNECEDOR'
      'vl_total=VL_TOTAL'
      'razao_social=RAZAO_SOCIAL')
    DataSet = q_entradas_resumido
    BCDToCurrency = False
    Left = 344
    Top = 432
  end
  object q_catalogo: TFDQuery
    MasterSource = DS_NF
    Connection = dao.CN
    SQL.Strings = (
      
        'select p.COD_PRODUTO, s.subcategoria, p.NOM_PRODUTO, c.CATEGORIA' +
        ', p.qtd_embalagem, p.unidade, cr.id, cr.COR, cr.COLOR, s.IMAGEM,' +
        ' s.imagem_bd, (select count(*) from produto pt where pt.subcateg' +
        'oria = s.id) as itens,'
      
        'coalesce((select (select count(*) from produto pt where pt.subca' +
        'tegoria = s1.id)  from SUBCATEGORIA s1 where s1.id <> s.id and s' +
        '1.CATEGORIA = s.CATEGORIA and s1.SUBCATEGORIA > s.SUBCATEGORIA a' +
        'nd s1.id in (select p1.subcategoria from produto p1 where p1.STA' +
        'TUS <> '#39'S'#39') order by s1.SUBCATEGORIA limit 1),0) as proximo,'
      
        '(select count(sc.id) from SUBCATEGORIA sc where sc.CATEGORIA = c' +
        '.id and sc.id in (select pt.subcategoria from produto pt where p' +
        't.STATUS <> '#39'S'#39') ) as itensporcategoria  '
      'from produto p '
      'Inner join subcategoria s on (p.SUBCATEGORIA = s.ID) '
      'inner join categoria c on (c.ID = s.CATEGORIA) '
      'inner join cores cr on (cr.ID = c.COR)'
      'where p.status <> '#39'S'#39
      'order by cr.ID, c.CATEGORIA, s.subcategoria')
    Left = 736
    Top = 672
    object q_catalogocod_produto: TIntegerField
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_catalogosubcategoria: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'subcategoria'
      Origin = 'subcategoria'
      Size = 200
    end
    object q_catalogonom_produto: TStringField
      FieldName = 'nom_produto'
      Origin = 'nom_produto'
      Size = 100
    end
    object q_catalogocategoria: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'categoria'
      Origin = 'categoria'
      Size = 200
    end
    object q_catalogoqtd_embalagem: TBCDField
      FieldName = 'qtd_embalagem'
      Origin = 'qtd_embalagem'
      Precision = 15
      Size = 3
    end
    object q_catalogounidade: TStringField
      FieldName = 'unidade'
      Origin = 'unidade'
      FixedChar = True
      Size = 3
    end
    object q_catalogoid: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id'
      Origin = 'id'
    end
    object q_catalogocor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cor'
      Origin = 'cor'
      Size = 30
    end
    object q_catalogocolor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'color'
      Origin = 'color'
      Size = 15
    end
    object q_catalogoimagem: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'imagem'
      Origin = 'imagem'
      Size = 200
    end
    object q_catalogoimagem_bd: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'imagem_bd'
      Origin = 'imagem_bd'
    end
    object q_catalogoitens: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'itens'
      Origin = 'itens'
      ReadOnly = True
    end
    object q_catalogoproximo: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'proximo'
      Origin = 'proximo'
      ReadOnly = True
    end
    object q_catalogoitensporcategoria: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'itensporcategoria'
      Origin = 'itensporcategoria'
      ReadOnly = True
    end
  end
  object ds_catalogo: TDataSource
    DataSet = mm_Catalogo
    Left = 736
    Top = 728
  end
  object dst_catalogo: TfrxDBDataset
    UserName = 'dst_catalogo'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_PRODUTO=COD_PRODUTO'
      'SUBCATEGORIA=SUBCATEGORIA'
      'NOM_PRODUTO=NOM_PRODUTO'
      'CATEGORIA=CATEGORIA'
      'QTD_EMBALAGEM=QTD_EMBALAGEM'
      'UNIDADE=UNIDADE'
      'COR=COR'
      'COLOR=COLOR'
      'IMAGEM_BD=IMAGEM_BD'
      'PAGINA=PAGINA'
      'ITENS=ITENS'
      'PROXIMO=PROXIMO'
      'X=X'
      'Y=Y'
      'ItensPorCategoria=ItensPorCategoria'
      'ITENSPORPAGINA=ITENSPORPAGINA'
      'ORDEMITEMPAG=ORDEMITEMPAG')
    DataSet = mm_Catalogo
    BCDToCurrency = False
    Left = 736
    Top = 784
  end
  object ftpPalm: TIdFTP
    IPVersion = Id_IPv4
    Host = 'ftp.palmsystem.com.br'
    Password = 'CLA101'
    Username = 'palmsystem08'
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    ReadTimeout = 0
    Left = 672
    Top = 432
  end
  object q_pauta_venda_categoria: TFDQuery
    CachedUpdates = True
    Connection = dao.CN
    SQL.Strings = (
      
        'select distinct p.cod_produto, nom_produto, unidade, qtd_embalag' +
        'em, promocao, preco_venda, g.cod_grupo, g.nom_grupo, qtd_estoque' +
        ', coalesce(p.NCM, g.ncm) as ncm, coalesce(p.cest, g.cest) as ces' +
        't, s.id as cod_subcategoria, s.subcategoria, '
      ' c.id as cod_categoria, c.categoria, p.CODIGO_BARRA, '
      ' coalesce(( '
      '   select '
      '     case when p.preco_venda = 0 '
      '          then 0 '
      '          else case when n.MVA = 0 '
      '                    then 0 '
      
        '                    else (((((p.preco_venda * (1+(n.MVA/100))) *' +
        ' (n.ALIQ_ICMS_INTERNA/100)) - (p.preco_venda * (i.icms/100))) / ' +
        'p.PRECO_VENDA) * 100) '
      '               end '
      '     end '
      '     from mva n '
      
        '     left outer join icms i on (i.UF = n.UF and i.UF_ORIGEM = n.' +
        'UF_ORIGEM) '
      '     where '
      
        '       (n.CEST = coalesce(p.CEST, g.CEST) and (n.ncm = coalesce(' +
        'p.NCM, g.ncm) or n.ncm = substring(coalesce(p.NCM, g.ncm) '
      
        '        from 1 for 9) or n.ncm = substring(coalesce(p.NCM, g.ncm' +
        ') from 1 for 8) or n.ncm = substring(coalesce(p.NCM, g.ncm) from' +
        ' 1 for 7) or n.ncm = substring(coalesce(p.NCM, g.ncm) from 1 for' +
        ' 6) or n.ncm = substring(coalesce(p.NCM, g.ncm) from 1 for 5) '
      
        '        or n.ncm = substring(coalesce(p.NCM, g.ncm) from 1 for 4' +
        '))) '
      '        and (n.uf_origem = '#39'RS'#39')'
      '        and (n.uf= '#39'RS'#39')'
      ' ),0) as perc_st '
      'from produto p '
      'left outer join grupo g on g.cod_grupo=p.cod_grupo '
      'left outer join subcategoria s on s.ID = p.SUBCATEGORIA '
      'left outer join categoria c on c.ID = s.CATEGORIA '
      'where 1 = 1 and c.ID = 62')
    Left = 72
    Top = 16
    object q_pauta_venda_categoriacod_produto: TIntegerField
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_pauta_venda_categorianom_produto: TStringField
      FieldName = 'nom_produto'
      Origin = 'nom_produto'
      Size = 100
    end
    object q_pauta_venda_categoriaunidade: TStringField
      FieldName = 'unidade'
      Origin = 'unidade'
      FixedChar = True
      Size = 3
    end
    object q_pauta_venda_categoriaqtd_embalagem: TBCDField
      FieldName = 'qtd_embalagem'
      Origin = 'qtd_embalagem'
      Precision = 15
      Size = 3
    end
    object q_pauta_venda_categoriapromocao: TStringField
      FieldName = 'promocao'
      Origin = 'promocao'
      FixedChar = True
      Size = 1
    end
    object q_pauta_venda_categoriapreco_venda: TBCDField
      FieldName = 'preco_venda'
      Origin = 'preco_venda'
      Precision = 15
    end
    object q_pauta_venda_categoriacod_grupo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_grupo'
      Origin = 'cod_grupo'
    end
    object q_pauta_venda_categorianom_grupo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_grupo'
      Origin = 'nom_grupo'
      Size = 100
    end
    object q_pauta_venda_categoriaqtd_estoque: TBCDField
      FieldName = 'qtd_estoque'
      Origin = 'qtd_estoque'
      Precision = 15
      Size = 2
    end
    object q_pauta_venda_categoriancm: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ncm'
      Origin = 'ncm'
      ReadOnly = True
      Size = 11
    end
    object q_pauta_venda_categoriacest: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cest'
      Origin = 'cest'
      ReadOnly = True
      Size = 10
    end
    object q_pauta_venda_categoriacod_subcategoria: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_subcategoria'
      Origin = 'cod_subcategoria'
    end
    object q_pauta_venda_categoriasubcategoria: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'subcategoria'
      Origin = 'subcategoria'
      Size = 200
    end
    object q_pauta_venda_categoriacod_categoria: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_categoria'
      Origin = 'cod_categoria'
    end
    object q_pauta_venda_categoriacategoria: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'categoria'
      Origin = 'categoria'
      Size = 200
    end
    object q_pauta_venda_categoriacodigo_barra: TStringField
      FieldName = 'codigo_barra'
      Origin = 'codigo_barra'
    end
    object q_pauta_venda_categoriaperc_st: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'perc_st'
      Origin = 'perc_st'
      ReadOnly = True
    end
  end
  object ds_pauta_venda_categoria: TDataSource
    DataSet = q_pauta_venda_categoria
    Left = 72
    Top = 64
  end
  object dst_pauta_venda_categoria: TfrxDBDataset
    UserName = 'dst_pauta_venda_categoria'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cod_produto=COD_PRODUTO'
      'nom_produto=NOM_PRODUTO'
      'unidade=UNIDADE'
      'qtd_embalagem=QTD_EMBALAGEM'
      'promocao=PROMOCAO'
      'preco_venda=PRECO_VENDA'
      'cod_grupo=COD_GRUPO'
      'nom_grupo=NOM_GRUPO'
      'qtd_estoque=QTD_ESTOQUE'
      'ncm=NCM'
      'cest=CEST'
      'cod_subcategoria=COD_SUBCATEGORIA'
      'subcategoria=SUBCATEGORIA'
      'cod_categoria=COD_CATEGORIA'
      'categoria=CATEGORIA'
      'codigo_barra=CODIGO_BARRA'
      'perc_st=PERC_ST')
    DataSet = q_pauta_venda_categoria
    BCDToCurrency = False
    Left = 16
    Top = 120
  end
  object q_metas_diarias: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'SELECT '
      
        '  A.DATA, A.MES, A.ANO, extract(WEEK FROM A.DATA) AS SEMANA_ANO,' +
        ' '
      '  CASE extract(DOW FROM A.DATA) '
      '  WHEN 0 THEN '#39'DOMINGO'#39' '
      '  WHEN 1 THEN '#39'SEGUNDA-FEIRA'#39
      '  WHEN 2 THEN '#39'TER'#199'A-FEIRA'#39
      '  WHEN 3 THEN '#39'QUARTA-FEIRA'#39'  '
      '  WHEN 4 THEN '#39'QUINTA-FEIRA'#39
      '  WHEN 5 THEN '#39'SEXTA-FEIRA'#39
      '  WHEN 6 THEN '#39'S'#193'BADO'#39
      '  END AS SEMANA,'
      '    R.ID||'#39'-'#39'||R.NOM_REPRESENTANTE AS REPRESENTANTE,   '
      '  M.VL_VENDA AS META_MENSAL,'
      '  M.VL_VENDA*0.25 AS META_SEMANAL,  '
      '  M.VL_VENDA*0.05 AS META_DIARIA,'
      
        '  COALESCE((SELECT SUM(V1.TOT_LIQUIDO) FROM VENDAS1 V1 WHERE V1.' +
        'COD_REPRESENTANTE = R.ID AND CASE WHEN V1.FATURADO = 1 THEN V1.D' +
        'TA_EMISSAO ELSE v1.DTADOC END = A.DATA),0) AS TOTAL '
      'FROM REPRESENTANTE R'
      'INNER JOIN METAS_REPRESENTANTE M ON M.ID_REPRESENTANTE = R.ID '
      'INNER JOIN CALENDARIO A ON M.MES = A.MES  '
      'order by REPRESENTANTE, a.data')
    Left = 624
    Top = 16
    object q_metas_diariasdata: TDateField
      FieldName = 'data'
      Origin = 'data'
    end
    object q_metas_diariasmes: TStringField
      FieldName = 'mes'
      Origin = 'mes'
      Size = 7
    end
    object q_metas_diariasano: TStringField
      FieldName = 'ano'
      Origin = 'ano'
      Size = 4
    end
    object q_metas_diariassemana_ano: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'semana_ano'
      Origin = 'semana_ano'
      ReadOnly = True
    end
    object q_metas_diariassemana: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'semana'
      Origin = 'semana'
      ReadOnly = True
      BlobType = ftMemo
    end
    object q_metas_diariasrepresentante: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'representante'
      Origin = 'representante'
      ReadOnly = True
      BlobType = ftMemo
    end
    object q_metas_diariasmeta_mensal: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'meta_mensal'
      Origin = 'meta_mensal'
      Precision = 15
      Size = 2
    end
    object q_metas_diariasmeta_semanal: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'meta_semanal'
      Origin = 'meta_semanal'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_metas_diariasmeta_diaria: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'meta_diaria'
      Origin = 'meta_diaria'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_metas_diariastotal: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'total'
      Origin = 'total'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
  end
  object ds_metas_diarias: TDataSource
    DataSet = q_metas_diarias
    Left = 624
    Top = 70
  end
  object dst_metas_diarias: TfrxDBDataset
    UserName = 'dst_metas_diarias'
    CloseDataSource = True
    FieldAliases.Strings = (
      'data=DATA'
      'mes=MES'
      'ano=ANO'
      'semana_ano=SEMANA_ANO'
      'semana=SEMANA'
      'representante=REPRESENTANTE'
      'meta_mensal=META_MENSAL'
      'meta_semanal=META_SEMANAL'
      'meta_diaria=META_DIARIA'
      'total=TOTAL')
    DataSet = q_metas_diarias
    BCDToCurrency = False
    Left = 624
    Top = 128
  end
  object ds_configuracao: TDataSource
    DataSet = q_configuracao
    Left = 744
    Top = 200
  end
  object dst_configuracao: TfrxDBDataset
    UserName = 'dst_configuracao'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cod_conf=COD_CONF'
      'ano_vigor=ANO_VIGOR'
      'versao=VERSAO'
      'letra_maiuscula=LETRA_MAIUSCULA'
      'calcular_preco_venda_automatic=CALCULAR_PRECO_VENDA_AUTOMATIC'
      'lucro_padrao_fornecedor=LUCRO_PADRAO_FORNECEDOR'
      'faturar_sem_estoque=FATURAR_SEM_ESTOQUE'
      'grava_prod_aut_internet=GRAVA_PROD_AUT_INTERNET'
      'transferir_romaneio_internet=TRANSFERIR_ROMANEIO_INTERNET'
      'sincroniza_vendas_servidor=SINCRONIZA_VENDAS_SERVIDOR'
      'ultima_nf=ULTIMA_NF'
      'utiliza_fila_impressao=UTILIZA_FILA_IMPRESSAO'
      'nao_utiliza_grade=NAO_UTILIZA_GRADE'
      'area_atuacao=AREA_ATUACAO'
      'prazo_vencimento_consignacao=PRAZO_VENCIMENTO_CONSIGNACAO'
      'grava_cliente_aut_internet=GRAVA_CLIENTE_AUT_INTERNET'
      'agrupar_prod_iguais_vendas=AGRUPAR_PROD_IGUAIS_VENDAS'
      'valor_ponto_fidelidade=VALOR_PONTO_FIDELIDADE'
      'utilizar_ponto_fidelidade_cli=UTILIZAR_PONTO_FIDELIDADE_CLI'
      'caminho_cod_barras=CAMINHO_COD_BARRAS'
      'verifica_status_financeiro=VERIFICA_STATUS_FINANCEIRO'
      'aviso_estoque=AVISO_ESTOQUE'
      'site=SITE'
      'usuario_site=USUARIO_SITE'
      'login_site=LOGIN_SITE'
      'mala_direta_prazo=MALA_DIRETA_PRAZO'
      'salario_fornecedor=SALARIO_FORNECEDOR'
      'salario_plano_contas=SALARIO_PLANO_CONTAS'
      'comissao_fornecedor=COMISSAO_FORNECEDOR'
      'comissao_plano_contas=COMISSAO_PLANO_CONTAS'
      'qtd_consulta_cep=QTD_CONSULTA_CEP'
      'data_rel_pedidos_vendedores=DATA_REL_PEDIDOS_VENDEDORES'
      'plr_fornecedor=PLR_FORNECEDOR'
      'plr_plano_contas=PLR_PLANO_CONTAS'
      'margem_lucro_padrao=MARGEM_LUCRO_PADRAO'
      'vale_fornecedor=VALE_FORNECEDOR'
      'vale_plano_contas=VALE_PLANO_CONTAS'
      'logo=LOGO'
      'checar_revisao_veiculo=CHECAR_REVISAO_VEICULO')
    DataSet = q_configuracao
    BCDToCurrency = False
    Left = 744
    Top = 248
  end
  object q_configuracao: TFDQuery
    Active = True
    Connection = dao.CN
    SQL.Strings = (
      
        'SELECT a.COD_CONF, a.ANO_VIGOR, a.VERSAO, a.LETRA_MAIUSCULA, a.C' +
        'ALCULAR_PRECO_VENDA_AUTOMATIC, a.LUCRO_PADRAO_FORNECEDOR, a.FATU' +
        'RAR_SEM_ESTOQUE, a.GRAVA_PROD_AUT_INTERNET, a.TRANSFERIR_ROMANEI' +
        'O_INTERNET, a.SINCRONIZA_VENDAS_SERVIDOR, a.ULTIMA_NF, a.UTILIZA' +
        '_FILA_IMPRESSAO, a.NAO_UTILIZA_GRADE, a.AREA_ATUACAO, a.PRAZO_VE' +
        'NCIMENTO_CONSIGNACAO, a.GRAVA_CLIENTE_AUT_INTERNET, a.AGRUPAR_PR' +
        'OD_IGUAIS_VENDAS, a.VALOR_PONTO_FIDELIDADE, a.UTILIZAR_PONTO_FID' +
        'ELIDADE_CLI, a.CAMINHO_COD_BARRAS, a.VERIFICA_STATUS_FINANCEIRO,' +
        ' a.AVISO_ESTOQUE, a.SITE, a.USUARIO_SITE, a.LOGIN_SITE, a.MALA_D' +
        'IRETA_PRAZO, a.SALARIO_FORNECEDOR, a.SALARIO_PLANO_CONTAS, a.COM' +
        'ISSAO_FORNECEDOR, a.COMISSAO_PLANO_CONTAS, a.QTD_CONSULTA_CEP, a' +
        '.DATA_REL_PEDIDOS_VENDEDORES, a.PLR_FORNECEDOR, a.PLR_PLANO_CONT' +
        'AS, a.MARGEM_LUCRO_PADRAO, a.VALE_FORNECEDOR, a.VALE_PLANO_CONTA' +
        'S, a.LOGO, a.CHECAR_REVISAO_VEICULO'
      'FROM CONFIGURACAO a')
    Left = 736
    Top = 160
    object q_configuracaocod_conf: TSmallintField
      FieldName = 'cod_conf'
      Origin = 'cod_conf'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_configuracaoano_vigor: TStringField
      FieldName = 'ano_vigor'
      Origin = 'ano_vigor'
      FixedChar = True
      Size = 4
    end
    object q_configuracaoversao: TStringField
      FieldName = 'versao'
      Origin = 'versao'
      FixedChar = True
      Size = 12
    end
    object q_configuracaoletra_maiuscula: TStringField
      FieldName = 'letra_maiuscula'
      Origin = 'letra_maiuscula'
      FixedChar = True
      Size = 1
    end
    object q_configuracaocalcular_preco_venda_automatic: TStringField
      FieldName = 'calcular_preco_venda_automatic'
      Origin = 'calcular_preco_venda_automatic'
      FixedChar = True
      Size = 1
    end
    object q_configuracaolucro_padrao_fornecedor: TBCDField
      FieldName = 'lucro_padrao_fornecedor'
      Origin = 'lucro_padrao_fornecedor'
      Precision = 15
      Size = 2
    end
    object q_configuracaofaturar_sem_estoque: TStringField
      FieldName = 'faturar_sem_estoque'
      Origin = 'faturar_sem_estoque'
      FixedChar = True
      Size = 1
    end
    object q_configuracaograva_prod_aut_internet: TStringField
      FieldName = 'grava_prod_aut_internet'
      Origin = 'grava_prod_aut_internet'
      FixedChar = True
      Size = 1
    end
    object q_configuracaotransferir_romaneio_internet: TStringField
      FieldName = 'transferir_romaneio_internet'
      Origin = 'transferir_romaneio_internet'
      FixedChar = True
      Size = 1
    end
    object q_configuracaosincroniza_vendas_servidor: TStringField
      FieldName = 'sincroniza_vendas_servidor'
      Origin = 'sincroniza_vendas_servidor'
      FixedChar = True
      Size = 1
    end
    object q_configuracaoultima_nf: TStringField
      FieldName = 'ultima_nf'
      Origin = 'ultima_nf'
      FixedChar = True
      Size = 8
    end
    object q_configuracaoutiliza_fila_impressao: TStringField
      FieldName = 'utiliza_fila_impressao'
      Origin = 'utiliza_fila_impressao'
      FixedChar = True
      Size = 1
    end
    object q_configuracaonao_utiliza_grade: TStringField
      FieldName = 'nao_utiliza_grade'
      Origin = 'nao_utiliza_grade'
      FixedChar = True
      Size = 1
    end
    object q_configuracaoarea_atuacao: TIntegerField
      FieldName = 'area_atuacao'
      Origin = 'area_atuacao'
    end
    object q_configuracaoprazo_vencimento_consignacao: TStringField
      FieldName = 'prazo_vencimento_consignacao'
      Origin = 'prazo_vencimento_consignacao'
      FixedChar = True
      Size = 3
    end
    object q_configuracaograva_cliente_aut_internet: TStringField
      FieldName = 'grava_cliente_aut_internet'
      Origin = 'grava_cliente_aut_internet'
      FixedChar = True
      Size = 1
    end
    object q_configuracaoagrupar_prod_iguais_vendas: TStringField
      FieldName = 'agrupar_prod_iguais_vendas'
      Origin = 'agrupar_prod_iguais_vendas'
      FixedChar = True
      Size = 1
    end
    object q_configuracaovalor_ponto_fidelidade: TBCDField
      FieldName = 'valor_ponto_fidelidade'
      Origin = 'valor_ponto_fidelidade'
      Precision = 15
      Size = 2
    end
    object q_configuracaoutilizar_ponto_fidelidade_cli: TStringField
      FieldName = 'utilizar_ponto_fidelidade_cli'
      Origin = 'utilizar_ponto_fidelidade_cli'
      FixedChar = True
      Size = 1
    end
    object q_configuracaocaminho_cod_barras: TStringField
      FieldName = 'caminho_cod_barras'
      Origin = 'caminho_cod_barras'
      Size = 50
    end
    object q_configuracaoverifica_status_financeiro: TStringField
      FieldName = 'verifica_status_financeiro'
      Origin = 'verifica_status_financeiro'
      FixedChar = True
      Size = 1
    end
    object q_configuracaoaviso_estoque: TDateField
      FieldName = 'aviso_estoque'
      Origin = 'aviso_estoque'
    end
    object q_configuracaosite: TStringField
      FieldName = 'site'
      Origin = 'site'
      Size = 100
    end
    object q_configuracaousuario_site: TStringField
      FieldName = 'usuario_site'
      Origin = 'usuario_site'
      Size = 10
    end
    object q_configuracaologin_site: TStringField
      FieldName = 'login_site'
      Origin = 'login_site'
      Size = 10
    end
    object q_configuracaomala_direta_prazo: TDateField
      FieldName = 'mala_direta_prazo'
      Origin = 'mala_direta_prazo'
    end
    object q_configuracaosalario_fornecedor: TIntegerField
      FieldName = 'salario_fornecedor'
      Origin = 'salario_fornecedor'
    end
    object q_configuracaosalario_plano_contas: TIntegerField
      FieldName = 'salario_plano_contas'
      Origin = 'salario_plano_contas'
    end
    object q_configuracaocomissao_fornecedor: TIntegerField
      FieldName = 'comissao_fornecedor'
      Origin = 'comissao_fornecedor'
    end
    object q_configuracaocomissao_plano_contas: TIntegerField
      FieldName = 'comissao_plano_contas'
      Origin = 'comissao_plano_contas'
    end
    object q_configuracaoqtd_consulta_cep: TIntegerField
      FieldName = 'qtd_consulta_cep'
      Origin = 'qtd_consulta_cep'
    end
    object q_configuracaodata_rel_pedidos_vendedores: TDateField
      FieldName = 'data_rel_pedidos_vendedores'
      Origin = 'data_rel_pedidos_vendedores'
    end
    object q_configuracaoplr_fornecedor: TIntegerField
      FieldName = 'plr_fornecedor'
      Origin = 'plr_fornecedor'
    end
    object q_configuracaoplr_plano_contas: TIntegerField
      FieldName = 'plr_plano_contas'
      Origin = 'plr_plano_contas'
    end
    object q_configuracaomargem_lucro_padrao: TSmallintField
      FieldName = 'margem_lucro_padrao'
      Origin = 'margem_lucro_padrao'
    end
    object q_configuracaovale_fornecedor: TIntegerField
      FieldName = 'vale_fornecedor'
      Origin = 'vale_fornecedor'
    end
    object q_configuracaovale_plano_contas: TIntegerField
      FieldName = 'vale_plano_contas'
      Origin = 'vale_plano_contas'
    end
    object q_configuracaologo: TBlobField
      FieldName = 'logo'
      Origin = 'logo'
    end
    object q_configuracaochecar_revisao_veiculo: TStringField
      FieldName = 'checar_revisao_veiculo'
      Origin = 'checar_revisao_veiculo'
      FixedChar = True
      Size = 1
    end
  end
  object q_comparativo_tablet: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'SELECT a.TIPO, a.NR_PEDIDO_PALM, a.NUMDOC, a.COD_REPRESENTANTE, ' +
        'a.DTADOC, a.HORA, a.COD_CLIENTE, a.FATURADO, a.COD_FOP, a.COD_PR' +
        'AZO_PGTO, a.TOT_BRUTO, a.TOT_LIQUIDO, a.OBSERVACOES_PEDIDO, a.PA' +
        'LM_NR_CONEXAO, a.COD_PRODUTO, a.PRECO_CUSTO, a.PRECO_BRUTO, A.PR' +
        'ECO, a.PROMOCAO, a.QTD, a.SUB_TOTAL, a.VOLUME, a.NOM_CLIENTE, a.' +
        'NOM_PRODUTO,'
      'r.nom_representante'
      'FROM V_VENDA_ORIGINAL a'
      'INNER JOIN representante r on r.id = a.cod_representante'
      '')
    Left = 904
    Top = 496
    object q_comparativo_tablettipo: TStringField
      FieldName = 'tipo'
      Origin = 'tipo'
    end
    object q_comparativo_tabletnr_pedido_palm: TIntegerField
      FieldName = 'nr_pedido_palm'
      Origin = 'nr_pedido_palm'
    end
    object q_comparativo_tabletnumdoc: TIntegerField
      FieldName = 'numdoc'
      Origin = 'numdoc'
    end
    object q_comparativo_tabletcod_representante: TIntegerField
      FieldName = 'cod_representante'
      Origin = 'cod_representante'
    end
    object q_comparativo_tabletdtadoc: TDateField
      FieldName = 'dtadoc'
      Origin = 'dtadoc'
    end
    object q_comparativo_tablethora: TTimeField
      FieldName = 'hora'
      Origin = 'hora'
    end
    object q_comparativo_tabletcod_cliente: TIntegerField
      FieldName = 'cod_cliente'
      Origin = 'cod_cliente'
    end
    object q_comparativo_tabletfaturado: TIntegerField
      FieldName = 'faturado'
      Origin = 'faturado'
    end
    object q_comparativo_tabletcod_fop: TIntegerField
      FieldName = 'cod_fop'
      Origin = 'cod_fop'
    end
    object q_comparativo_tabletcod_prazo_pgto: TIntegerField
      FieldName = 'cod_prazo_pgto'
      Origin = 'cod_prazo_pgto'
    end
    object q_comparativo_tablettot_bruto: TBCDField
      FieldName = 'tot_bruto'
      Origin = 'tot_bruto'
      Precision = 15
      Size = 2
    end
    object q_comparativo_tablettot_liquido: TFMTBCDField
      FieldName = 'tot_liquido'
      Origin = 'tot_liquido'
      Precision = 64
      Size = 0
    end
    object q_comparativo_tabletobservacoes_pedido: TMemoField
      FieldName = 'observacoes_pedido'
      Origin = 'observacoes_pedido'
      BlobType = ftMemo
    end
    object q_comparativo_tabletpalm_nr_conexao: TIntegerField
      FieldName = 'palm_nr_conexao'
      Origin = 'palm_nr_conexao'
    end
    object q_comparativo_tabletcod_produto: TIntegerField
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
    end
    object q_comparativo_tabletpreco_custo: TBCDField
      FieldName = 'preco_custo'
      Origin = 'preco_custo'
      Precision = 15
      Size = 2
    end
    object q_comparativo_tabletpreco_bruto: TBCDField
      FieldName = 'preco_bruto'
      Origin = 'preco_bruto'
      Precision = 15
      Size = 2
    end
    object q_comparativo_tabletpreco: TBCDField
      FieldName = 'preco'
      Origin = 'preco'
      Precision = 15
    end
    object q_comparativo_tabletpromocao: TStringField
      FieldName = 'promocao'
      Origin = 'promocao'
      FixedChar = True
      Size = 1
    end
    object q_comparativo_tabletqtd: TBCDField
      FieldName = 'qtd'
      Origin = 'qtd'
      Precision = 15
      Size = 2
    end
    object q_comparativo_tabletsub_total: TBCDField
      FieldName = 'sub_total'
      Origin = 'sub_total'
      Precision = 15
    end
    object q_comparativo_tabletvolume: TBCDField
      FieldName = 'volume'
      Origin = 'volume'
      Precision = 15
      Size = 2
    end
    object q_comparativo_tabletnom_cliente: TStringField
      FieldName = 'nom_cliente'
      Origin = 'nom_cliente'
      Size = 150
    end
    object q_comparativo_tabletnom_produto: TStringField
      FieldName = 'nom_produto'
      Origin = 'nom_produto'
      Size = 100
    end
    object q_comparativo_tabletnom_representante: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_representante'
      Origin = 'nom_representante'
      Size = 50
    end
  end
  object ds_comparativo_tablet: TDataSource
    DataSet = q_comparativo_tablet
    Left = 904
    Top = 550
  end
  object dst_comparativo_tablet: TfrxDBDataset
    UserName = 'dst_comparativo_tablet'
    CloseDataSource = True
    FieldAliases.Strings = (
      'tipo=TIPO'
      'nr_pedido_palm=NR_PEDIDO_PALM'
      'numdoc=NUMDOC'
      'cod_representante=COD_REPRESENTANTE'
      'dtadoc=DTADOC'
      'hora=HORA'
      'cod_cliente=COD_CLIENTE'
      'faturado=FATURADO'
      'cod_fop=COD_FOP'
      'cod_prazo_pgto=COD_PRAZO_PGTO'
      'tot_bruto=TOT_BRUTO'
      'tot_liquido=TOT_LIQUIDO'
      'observacoes_pedido=OBSERVACOES_PEDIDO'
      'palm_nr_conexao=PALM_NR_CONEXAO'
      'cod_produto=COD_PRODUTO'
      'preco_custo=PRECO_CUSTO'
      'preco_bruto=PRECO_BRUTO'
      'preco=PRECO'
      'promocao=PROMOCAO'
      'qtd=QTD'
      'sub_total=SUB_TOTAL'
      'volume=VOLUME'
      'nom_cliente=NOM_CLIENTE'
      'nom_produto=NOM_PRODUTO'
      'nom_representante=NOM_REPRESENTANTE')
    DataSet = q_comparativo_tablet
    BCDToCurrency = False
    Left = 904
    Top = 608
  end
  object XMLNFe: TXMLDocument
    Left = 224
    Top = 656
    DOMVendorDesc = 'MSXML'
  end
  object ftpPedidosTablet: TIdFTP
    IPVersion = Id_IPv4
    Passive = True
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    ReadTimeout = 0
    Left = 776
    Top = 448
  end
  object q_supervisao: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'select numdoc, dtadoc, dta_emissao, tot_liquido, coalesce((selec' +
        't sum(valor) from cr1 as cr where cr.nr_documento = v1.NUMDOC),0' +
        ') as valor_cr, c.nom_cliente, r.id as cod_representante, r.NOM_R' +
        'EPRESENTANTe, S.id as cod_supervisor, S.NOM_REPRESENTANTE as nom' +
        '_supervisor, b.NOM_BANCO, S.NR_BANCO,S.NR_AGENCIA,S.NR_CONTA_COR' +
        'RENTE, S.TITULAR_CONTA, S.email, S.fone,S.celular,'
      'S.PERC_COMISSAO_FIXA as comissao,'
      #39'Sim'#39' as supervisao,'
      'faturado,'
      '(tot_liquido*r.PERC_COMISSAO_FIXA)/100 as vlr_comissao,'
      '  v1.desconto,'
      '  coalesce((select e.perc_comissao_func'
      '   from escala_comissao_televendas e'
      '   where e.desconto >= v1.desconto'
      '   order by e.desconto limit 1), 0) as perc_comissao'
      ''
      'from vendas1 v1 '
      'left join cliente c on c.cod_cliente=v1.cod_cliente '
      'left join CIDADES cd on cd.COD_CIDADE = c.COD_CIDADE '
      'INNER join REPRESENTANTE r on r.ID = V1.COD_REPRESENTANTE'
      'INNER join REPRESENTANTE S on S.ID = v1.COD_SUPERVISOR'
      'left join BANCO b on b.ID = CAST(r.NR_BANCO AS INTEGER)'
      'where'
      '  v1.NFE_DEV is null and'
      '  v1.consignacao<> '#39'1'#39' and '
      '  v1.orcamento='#39'0'#39' and '
      '  v1.cod_fop not in (7,9)')
    Left = 656
    Top = 496
    object q_supervisaonumdoc: TIntegerField
      FieldName = 'numdoc'
      Origin = 'numdoc'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_supervisaodtadoc: TDateField
      FieldName = 'dtadoc'
      Origin = 'dtadoc'
    end
    object q_supervisaodta_emissao: TDateField
      FieldName = 'dta_emissao'
      Origin = 'dta_emissao'
    end
    object q_supervisaotot_liquido: TBCDField
      FieldName = 'tot_liquido'
      Origin = 'tot_liquido'
      Precision = 15
    end
    object q_supervisaovalor_cr: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valor_cr'
      Origin = 'valor_cr'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_supervisaonom_cliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_cliente'
      Origin = 'nom_cliente'
      Size = 150
    end
    object q_supervisaocod_representante: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_representante'
      Origin = 'cod_representante'
    end
    object q_supervisaonom_representante: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_representante'
      Origin = 'nom_representante'
      Size = 50
    end
    object q_supervisaocod_supervisor: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_supervisor'
      Origin = 'cod_supervisor'
    end
    object q_supervisaonom_supervisor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_supervisor'
      Origin = 'nom_supervisor'
      Size = 50
    end
    object q_supervisaonom_banco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_banco'
      Origin = 'nom_banco'
      Size = 30
    end
    object q_supervisaonr_banco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nr_banco'
      Origin = 'nr_banco'
      FixedChar = True
      Size = 4
    end
    object q_supervisaonr_agencia: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nr_agencia'
      Origin = 'nr_agencia'
      FixedChar = True
      Size = 10
    end
    object q_supervisaonr_conta_corrente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nr_conta_corrente'
      Origin = 'nr_conta_corrente'
      FixedChar = True
    end
    object q_supervisaotitular_conta: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'titular_conta'
      Origin = 'titular_conta'
      Size = 50
    end
    object q_supervisaoemail: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'email'
      Origin = 'email'
      Size = 50
    end
    object q_supervisaofone: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fone'
      Origin = 'fone'
      FixedChar = True
      Size = 14
    end
    object q_supervisaocelular: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'celular'
      Origin = 'celular'
      FixedChar = True
      Size = 14
    end
    object q_supervisaocomissao: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'comissao'
      Origin = 'comissao'
      Precision = 15
      Size = 2
    end
    object q_supervisaosupervisao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'supervisao'
      Origin = 'supervisao'
      ReadOnly = True
      Size = 32767
    end
    object q_supervisaofaturado: TIntegerField
      FieldName = 'faturado'
      Origin = 'faturado'
    end
    object q_supervisaovlr_comissao: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vlr_comissao'
      Origin = 'vlr_comissao'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_supervisaodesconto: TBCDField
      FieldName = 'desconto'
      Origin = 'desconto'
      Precision = 15
    end
    object q_supervisaoperc_comissao: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'perc_comissao'
      Origin = 'perc_comissao'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
  end
  object ds_supervisao: TDataSource
    DataSet = q_supervisao
    Left = 656
    Top = 550
  end
  object frxDBDataset3: TfrxDBDataset
    UserName = 'dst_supervisao'
    CloseDataSource = True
    FieldAliases.Strings = (
      'numdoc=NUMDOC'
      'dtadoc=DTADOC'
      'dta_emissao=DTA_EMISSAO'
      'tot_liquido=TOT_LIQUIDO'
      'valor_cr=VALOR_CR'
      'nom_cliente=NOM_CLIENTE'
      'cod_representante=COD_REPRESENTANTE'
      'nom_representante=NOM_REPRESENTANTE'
      'cod_supervisor=COD_SUPERVISOR'
      'nom_supervisor=NOM_SUPERVISOR'
      'nom_banco=NOM_BANCO'
      'nr_banco=NR_BANCO'
      'nr_agencia=NR_AGENCIA'
      'nr_conta_corrente=NR_CONTA_CORRENTE'
      'titular_conta=TITULAR_CONTA'
      'email=EMAIL'
      'fone=FONE'
      'celular=CELULAR'
      'comissao=COMISSAO'
      'supervisao=SUPERVISAO'
      'faturado=FATURADO'
      'vlr_comissao=VLR_COMISSAO'
      'desconto=desconto'
      'perc_comissao=perc_comissao')
    DataSet = q_supervisao
    BCDToCurrency = False
    Left = 656
    Top = 608
  end
  object q_lista_func_13sal: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'SELECT DISTINCT R.ID as codrep, r.funcionario, r.admissao, r.NR_' +
        'CONTA_CORRENTE, r.NR_AGENCIA, b.NOM_BANCO, r.TITULAR_CONTA, R.NO' +
        'M_REPRESENTANTE, CP.DTAVEN, '
      
        '   coalesce((SELECT MAX(CP1.ID) FROM CP1 WHERE CP1.ID_PLANO_CONT' +
        'AS = ( SELECT c.DEC_TERC_PLANO_CONTAS FROM CONFIGURACAO C) AND C' +
        'P1.COD_REPRESENTANTE = R.ID AND CP1.DTAVEN = CP.DTAVEN),0) AS ID' +
        ', '
      
        '   coalesce((SELECT SUM(CP1.VALOR) FROM CP1 WHERE CP1.ID_PLANO_C' +
        'ONTAS = ( SELECT c.DEC_TERC_PLANO_CONTAS FROM CONFIGURACAO C) AN' +
        'D CP1.COD_REPRESENTANTE = R.ID AND '
      
        '   EXTRACT(MONTH FROM CP1.DTAVEN)||'#39'/'#39'||EXTRACT(YEAR FROM CP1.DT' +
        'AVEN) = EXTRACT(MONTH FROM CP.DTAVEN)||'#39'/'#39'||EXTRACT(YEAR FROM CP' +
        '.DTAVEN)),0) AS VALOR '
      
        'FROM REPRESENTANTE R INNER JOIN CP1 CP ON (CP.COD_REPRESENTANTE ' +
        '= R.ID) '
      'inner join banco b on (b.ID = cast(r.NR_BANCO as integer))')
    Left = 141
    Top = 496
    object q_lista_func_13salcodrep: TIntegerField
      FieldName = 'codrep'
      Origin = 'codrep'
    end
    object q_lista_func_13salfuncionario: TStringField
      FieldName = 'funcionario'
      Origin = 'funcionario'
      FixedChar = True
      Size = 1
    end
    object q_lista_func_13saladmissao: TDateField
      FieldName = 'admissao'
      Origin = 'admissao'
    end
    object q_lista_func_13salnr_conta_corrente: TStringField
      FieldName = 'nr_conta_corrente'
      Origin = 'nr_conta_corrente'
      FixedChar = True
    end
    object q_lista_func_13salnr_agencia: TStringField
      FieldName = 'nr_agencia'
      Origin = 'nr_agencia'
      FixedChar = True
      Size = 10
    end
    object q_lista_func_13salnom_banco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_banco'
      Origin = 'nom_banco'
      Size = 30
    end
    object q_lista_func_13saltitular_conta: TStringField
      FieldName = 'titular_conta'
      Origin = 'titular_conta'
      Size = 50
    end
    object q_lista_func_13salnom_representante: TStringField
      FieldName = 'nom_representante'
      Origin = 'nom_representante'
      Size = 50
    end
    object q_lista_func_13saldtaven: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'dtaven'
      Origin = 'dtaven'
    end
    object q_lista_func_13salid: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_lista_func_13salvalor: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valor'
      Origin = 'valor'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
  end
  object ds_lista_func_13sal: TDataSource
    DataSet = q_lista_func_13sal
    Left = 141
    Top = 552
  end
  object dst_lista_func_13sal: TfrxDBDataset
    UserName = 'dst_lista_func_13sal'
    CloseDataSource = False
    FieldAliases.Strings = (
      'codrep=CODREP'
      'funcionario=FUNCIONARIO'
      'admissao=ADMISSAO'
      'nr_conta_corrente=NR_CONTA_CORRENTE'
      'nr_agencia=NR_AGENCIA'
      'nom_banco=NOM_BANCO'
      'titular_conta=TITULAR_CONTA'
      'nom_representante=NOM_REPRESENTANTE'
      'dtaven=DTAVEN'
      'id=ID'
      'valor=VALOR')
    DataSet = q_lista_func_13sal
    BCDToCurrency = False
    Left = 141
    Top = 608
  end
  object qrGravaFoto: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'UPDATE subcategoria '
      'SET imagem_bd =:bitmap_foto'
      'WHERE id =:id')
    Left = 782
    Top = 344
    ParamData = <
      item
        Name = 'BITMAP_FOTO'
        DataType = ftBlob
        ParamType = ptInput
      end
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object q_televendas: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'select distinct v1.cod_representante, v1.cod_supervisor, v1.numd' +
        'oc, v1.COD_EMPRESA, v1.nfe, v1.DTA_EMISSAO, v1.dtadoc, v1.tot_li' +
        'quido, '
      
        '     coalesce((select sum(valor) from cr1 as cr where cr.nr_docu' +
        'mento = v1.NUMDOC),0) - case when cd.UF <> '#39'SC'#39' and v1.nfe is no' +
        't null then v1.VLR_ST else 0 end as valor_cr, '
      
        '     c.cod_cliente||'#39'-'#39'||c.nom_cliente as nom_cliente, c.TELEFON' +
        'E as fone_cliente, cd.NOM_CIDADE||'#39'-'#39'||cd.uf as cidade_cliente, ' +
        'r.id as CODREP, r.NOM_REPRESENTANTE, b.NOM_BANCO, r.NR_BANCO,r.N' +
        'R_AGENCIA,r.NR_CONTA_CORRENTE, r.email, r.fone,r.celular,'
      
        '     case when r.ID in (select cm.ID_REPRESENTANTE from COMISSAO' +
        ' cm) then (select cm.PERC_COMISSAO from comissao cm where cm.ID_' +
        'REPRESENTANTE = r.ID and v1.DESCONTO between cm.PERC_MINIMO and ' +
        'cm.PERC_MAXIMO) else r.PERC_COMISSAO_FIXA end as comissao, '
      
        '     case when v1.cod_fop in (7, 9) then '#39'N'#227'o'#39' else '#39'Sim'#39' end ve' +
        'nda_comissionada, f.NOM_FOP,'
      '     coalesce(vc.margem,0) as margem,'
      '     (select sum(vt.tot_liquido) '
      '      from vendas1 vt '
      '      where '
      '        vt.NUMDOC <= v1.numdoc and '
      
        '        extract(month from vt.DTADOC)||extract(year from vt.DTAD' +
        'OC) = extract(month from v1.DTADOC)||extract(year from v1.DTADOC' +
        ') '
      '        AND (vt.NFE_DEV is null or vt.STATUS_NFE_DEV = 135) '
      '        and vt.consignacao <> 1 '
      '        and vt.orcamento= 0   '
      
        '        and (vt.COD_supervisor = 796 or vt.COD_REPRESENTANTE = 7' +
        '96)       '
      '     ) as acum_tot_liquido,'
      '     (select avg(vc1.MARGEM)'
      '      from vendas1 vt '
      '      left outer join V_COMISSAO vc1 on vc1.numdoc = vt.numdoc '
      '      where '
      '        vt.NUMDOC <= v1.numdoc and '
      
        '        extract(month from vt.DTADOC)||extract(year from vt.DTAD' +
        'OC) = extract(month from v1.DTADOC)||extract(year from v1.DTADOC' +
        ') '
      '        AND (vt.NFE_DEV is null or vt.STATUS_NFE_DEV = 135) '
      '        and vt.consignacao <> 1 '
      '        and vt.orcamento= 0   '
      
        '        and (vt.COD_supervisor = 796 or vt.COD_REPRESENTANTE = 7' +
        '96)     '
      '     ) as media_margem'
      '    from vendas1 v1 '
      '    inner join FOP f on (f.COD_FOP = v1.COD_FOP) '
      '    left outer join V_COMISSAO vc on vc.numdoc = v1.numdoc '
      '    left join cliente c on c.cod_cliente=v1.cod_cliente '
      '    inner join cidades cd on (c.cod_cidade = cd.cod_cidade) '
      '    inner join cadmicro mc on (mc.microcod = cd.microcod) '
      '    inner join cadmeso ms on (ms.mesocod = mc.mesocod) '
      '    left join REPRESENTANTE r on r.ID = v1.COD_SUPERVISOR'
      '    left join BANCO b on b.ID = r.NR_BANCO '
      '    where V1.NUMDOC_GRUPO IS NULL '
      '    AND (v1.NFE_DEV is null or v1.STATUS_NFE_DEV = 135) '
      '    and v1.consignacao <> 1 '
      '    and v1.orcamento= 0'
      '    and (v1.COD_supervisor = 796 or v1.COD_REPRESENTANTE = 796)'
      '    and v1.DTADOC between '#39'01.02.2014'#39' and '#39'24.02.2014'#39'    '
      'order by v1.numdoc ')
    Left = 488
    Top = 496
  end
  object ds_televendas: TDataSource
    DataSet = q_televendas
    Left = 488
    Top = 550
  end
  object dst_televendas: TfrxDBDataset
    UserName = 'dst_televendas'
    CloseDataSource = True
    DataSet = q_televendas
    BCDToCurrency = False
    Left = 488
    Top = 608
  end
  object q_metas: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'SELECT mr.id,'
      '       r.id as codrep,'
      '       r.nom_representante,'
      '       mr.MES,'
      
        '       cast (substring(mr.mes from 4 for 4) || '#39' / '#39' || substrin' +
        'g(mr.mes from 1 for 2) as varchar (20)) as mes_inv,'
      '     coalesce(mr.VL_VENDA, 0) as meta,'
      '     coalesce(mr.TOTAL_FATURADO, 0) as TOTAL_FATURADO,'
      '     coalesce(mr.TOTAL_ABERTO, 0) as TOTAL_ABERTO,'
      '     coalesce(mr.MARGEM_FATURADO, 0) as MARGEM_FATURADO,'
      '     coalesce(mr.MARGEM_ABERTO, 0) as MARGEM_ABERTO'
      'FROM METAS_REPRESENTANTE mr'
      '     inner join REPRESENTANTE r on r.id = mr.ID_REPRESENTANTE'
      
        'where cast(substring(mr.mes from 4 for 4) as VARCHAR(4)) = cast(' +
        'extract(year from current_date) as varchar(4)) '
      '  and r.id = 948')
    Left = 568
    Top = 493
    object q_metasid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_metascodrep: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'codrep'
      Origin = 'codrep'
    end
    object q_metasnom_representante: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_representante'
      Origin = 'nom_representante'
      Size = 50
    end
    object q_metasmes: TStringField
      FieldName = 'mes'
      Origin = 'mes'
      Size = 11
    end
    object q_metasmes_inv: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mes_inv'
      Origin = 'mes_inv'
      ReadOnly = True
    end
    object q_metasmeta: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'meta'
      Origin = 'meta'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_metastotal_faturado: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'total_faturado'
      Origin = 'total_faturado'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_metastotal_aberto: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'total_aberto'
      Origin = 'total_aberto'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_metasmargem_faturado: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'margem_faturado'
      Origin = 'margem_faturado'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_metasmargem_aberto: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'margem_aberto'
      Origin = 'margem_aberto'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
  end
  object dst_metas: TfrxDBDataset
    UserName = 'dst_metas'
    CloseDataSource = True
    FieldAliases.Strings = (
      'id=ID'
      'codrep=CODREP'
      'nom_representante=NOM_REPRESENTANTE'
      'mes=MES'
      'mes_inv=MES_INV'
      'meta=META'
      'total_faturado=TOTAL_FATURADO'
      'total_aberto=TOTAL_ABERTO'
      'margem_faturado=MARGEM_FATURADO'
      'margem_aberto=MARGEM_ABERTO')
    DataSet = q_metas
    BCDToCurrency = False
    Left = 560
    Top = 608
  end
  object q_comissao_venda_aux: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      '  select '
      '           v1.NUMDOC, '
      '           r.nom_representante, '
      '           c.cod_cliente, '
      '           c.nom_cliente, '
      '           v2.cod_produto, '
      '           p.NOM_PRODUTO, '
      '           v2.PRECO, '
      '           v2.QTD, '
      '           v2.SUB_TOTAL, '
      '           r.perc_comissao_fixa, '
      '           r.perc_comissao_fixa / 5  AS COMISSAO_DESC,'
      '           v1.TOT_LIQUIDO,'
      
        '           ((v1.TOT_LIQUIDO * (r.perc_comissao_fixa / 5))/100) /' +
        ' (SELECT COUNT(*) FROM VENDAS2 VC2 WHERE VC2.NAO_VALIDAR_MARGEM ' +
        '= '#39'S'#39' and VC2.PRECO_CUSTO >= VC2.PRECO AND VC2.NUMDOC = V2.NUMDO' +
        'C) VLR_COMISSAO_DESC'
      '         from '
      '           produto p '
      
        '         inner join vendas2 v2 on v2.COD_PRODUTO = p.COD_PRODUTO' +
        ' '
      '         inner join vendas1 v1 on v1.NUMDOC = v2.NUMDOC '
      
        '         inner join REPRESENTANTE r on v1.COD_REPRESENTANTE = r.' +
        'id '
      '         inner join cliente c on c.COD_CLIENTE = v1.COD_CLIENTE '
      '         inner join cidades cd on cd.COD_CIDADE = c.COD_CIDADE '
      '         where '
      '               v2.NAO_VALIDAR_MARGEM = '#39'S'#39' '
      '           and v2.PRECO_CUSTO >= v2.PRECO '
      '')
    Left = 704
    Top = 480
    object q_comissao_venda_auxnumdoc: TIntegerField
      FieldName = 'numdoc'
      Origin = 'numdoc'
    end
    object q_comissao_venda_auxnom_representante: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_representante'
      Origin = 'nom_representante'
      Size = 50
    end
    object q_comissao_venda_auxcod_cliente: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_cliente'
      Origin = 'cod_cliente'
    end
    object q_comissao_venda_auxnom_cliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_cliente'
      Origin = 'nom_cliente'
      Size = 150
    end
    object q_comissao_venda_auxcod_produto: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_comissao_venda_auxnom_produto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_produto'
      Origin = 'nom_produto'
      Size = 100
    end
    object q_comissao_venda_auxpreco: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'preco'
      Origin = 'preco'
      Precision = 15
    end
    object q_comissao_venda_auxqtd: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'qtd'
      Origin = 'qtd'
      Precision = 15
      Size = 2
    end
    object q_comissao_venda_auxsub_total: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'sub_total'
      Origin = 'sub_total'
      Precision = 15
    end
    object q_comissao_venda_auxperc_comissao_fixa: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'perc_comissao_fixa'
      Origin = 'perc_comissao_fixa'
      Precision = 15
      Size = 2
    end
    object q_comissao_venda_auxcomissao_desc: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'comissao_desc'
      Origin = 'comissao_desc'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_comissao_venda_auxtot_liquido: TBCDField
      FieldName = 'tot_liquido'
      Origin = 'tot_liquido'
      Precision = 15
    end
    object q_comissao_venda_auxvlr_comissao_desc: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vlr_comissao_desc'
      Origin = 'vlr_comissao_desc'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
  end
  object ds_comissao_vendas_aux: TDataSource
    DataSet = q_comissao_venda_aux
    Left = 704
    Top = 550
  end
  object dst_comissao_venda_aux: TfrxDBDataset
    UserName = 'dst_comissao_venda_aux'
    CloseDataSource = True
    FieldAliases.Strings = (
      'numdoc=NUMDOC'
      'nom_representante=NOM_REPRESENTANTE'
      'cod_cliente=COD_CLIENTE'
      'nom_cliente=NOM_CLIENTE'
      'cod_produto=COD_PRODUTO'
      'nom_produto=NOM_PRODUTO'
      'preco=PRECO'
      'qtd=QTD'
      'sub_total=SUB_TOTAL'
      'perc_comissao_fixa=PERC_COMISSAO_FIXA'
      'comissao_desc=COMISSAO_DESC'
      'tot_liquido=TOT_LIQUIDO'
      'vlr_comissao_desc=VLR_COMISSAO_DESC')
    DataSet = q_comissao_venda_aux
    BCDToCurrency = False
    Left = 704
    Top = 608
  end
  object q_pedido_vinculado: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'SELECT '
      
        '  V2.NUMDOC, V2.COD_PRODUTO||'#39'-'#39'||P.NOM_PRODUTO AS PRODUTO, V2.Q' +
        'TD, V2.PRECO, V2.SUB_TOTAL'
      'FROM '
      '  VENDAS2 V2'
      'INNER JOIN PRODUTO P ON P.COD_PRODUTO = V2.COD_PRODUTO'
      'INNER JOIN VENDAS1 V1 ON V1.NUMDOC = V2.NUMDOC'
      'where'
      '  V1.NUMDOC_DESTINO = 30670  ')
    Left = 1072
    Top = 32
    object q_pedido_vinculadonumdoc: TIntegerField
      FieldName = 'numdoc'
      Origin = 'numdoc'
    end
    object q_pedido_vinculadoproduto: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'produto'
      Origin = 'produto'
      ReadOnly = True
      BlobType = ftMemo
    end
    object q_pedido_vinculadoqtd: TBCDField
      FieldName = 'qtd'
      Origin = 'qtd'
      Precision = 15
      Size = 2
    end
    object q_pedido_vinculadopreco: TBCDField
      FieldName = 'preco'
      Origin = 'preco'
      Precision = 15
    end
    object q_pedido_vinculadosub_total: TBCDField
      FieldName = 'sub_total'
      Origin = 'sub_total'
      Precision = 15
    end
  end
  object ds_pedido_vinculado: TDataSource
    DataSet = q_pedido_vinculado
    Left = 1072
    Top = 86
  end
  object dst_pedido_vinculado: TfrxDBDataset
    UserName = 'dst_pedido_vinculado'
    CloseDataSource = True
    FieldAliases.Strings = (
      'numdoc=NUMDOC'
      'produto=PRODUTO'
      'qtd=QTD'
      'preco=PRECO'
      'sub_total=SUB_TOTAL')
    DataSet = q_pedido_vinculado
    BCDToCurrency = False
    Left = 1072
    Top = 144
  end
  object q_produto_vendas: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'SELECT '
      
        '  V2.COD_PRODUTO, PR.NOM_PRODUTO, v1.numdoc, V1.DTADOC, v1.nfe, ' +
        'CL.COD_CLIENTE, CL.NOM_CLIENTE, v1.DTA_EMISSAO, v2.QTD, v2.PRECO' +
        ', v2.SUB_TOTAL,'
      
        '(select count(*) from (select distinct c.MES from CALENDARIO c w' +
        'here c.DATA between '#39'01.01.2014'#39' and '#39'31.12.2014'#39') q1 ) media_me' +
        'nsal'
      'FROM VENDAS2 v2'
      'INNER JOIN PRODUTO PR ON PR.COD_PRODUTO = V2.COD_PRODUTO '
      'INNER JOIN VENDAS1 V1 ON V1.NUMDOC = V2.NUMDOC '
      'INNER JOIN CLIENTE CL ON CL.COD_CLIENTE = V1.COD_CLIENTE'
      
        'where v2.cod_produto = 29 AND V1.DTADOC BETWEEN '#39'01.07.2014'#39' AND' +
        ' '#39'28.02.2015'#39'  AND V1.FATURADO IN (1,3)'
      '')
    Left = 1040
    Top = 224
    object q_produto_vendascod_produto: TIntegerField
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
    end
    object q_produto_vendasnom_produto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_produto'
      Origin = 'nom_produto'
      Size = 100
    end
    object q_produto_vendasnumdoc: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'numdoc'
      Origin = 'numdoc'
    end
    object q_produto_vendasdtadoc: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'dtadoc'
      Origin = 'dtadoc'
    end
    object q_produto_vendasnfe: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'nfe'
      Origin = 'nfe'
    end
    object q_produto_vendascod_cliente: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_cliente'
      Origin = 'cod_cliente'
    end
    object q_produto_vendasnom_cliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_cliente'
      Origin = 'nom_cliente'
      Size = 150
    end
    object q_produto_vendasdta_emissao: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'dta_emissao'
      Origin = 'dta_emissao'
    end
    object q_produto_vendasqtd: TBCDField
      FieldName = 'qtd'
      Origin = 'qtd'
      Precision = 15
      Size = 2
    end
    object q_produto_vendaspreco: TBCDField
      FieldName = 'preco'
      Origin = 'preco'
      Precision = 15
    end
    object q_produto_vendassub_total: TBCDField
      FieldName = 'sub_total'
      Origin = 'sub_total'
      Precision = 15
    end
    object q_produto_vendasmedia_mensal: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'media_mensal'
      Origin = 'media_mensal'
      ReadOnly = True
    end
  end
  object ds_produto_vendas: TDataSource
    DataSet = q_produto_vendas
    Left = 1040
    Top = 278
  end
  object dst_produto_vendas: TfrxDBDataset
    UserName = 'dst_produto_vendas'
    CloseDataSource = True
    FieldAliases.Strings = (
      'cod_produto=COD_PRODUTO'
      'nom_produto=NOM_PRODUTO'
      'numdoc=NUMDOC'
      'dtadoc=DTADOC'
      'nfe=NFE'
      'cod_cliente=COD_CLIENTE'
      'nom_cliente=NOM_CLIENTE'
      'dta_emissao=DTA_EMISSAO'
      'qtd=QTD'
      'preco=PRECO'
      'sub_total=SUB_TOTAL'
      'media_mensal=MEDIA_MENSAL')
    DataSet = q_produto_vendas
    BCDToCurrency = False
    Left = 1040
    Top = 336
  end
  object q_televendas_cidade: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'select '
      
        '  cd.COD_CIDADE, cd.NOM_CIDADE, mi.MICRONOMEx, me.MESONOMEX, cd.' +
        'UF, r.id||'#39'-'#39'||r.NOM_REPRESENTANTE as telemarketing'
      'from cidades cd'
      'inner join REPRESENTANTE r on r.id = cd.COD_SUPERVISOR'
      'inner join CADMICRO mi on mi.MICROCOD = cd.MICROCOD'
      'inner join CADMESO  me on me.MESOCOD  = mi.MESOCOD  '
      'where '
      '  r.ID = 856'
      'order by cd.UF, cd.NOM_CIDADE  ')
    Left = 616
    Top = 176
    object q_televendas_cidadecod_cidade: TIntegerField
      FieldName = 'cod_cidade'
      Origin = 'cod_cidade'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_televendas_cidadenom_cidade: TStringField
      FieldName = 'nom_cidade'
      Origin = 'nom_cidade'
      Size = 40
    end
    object q_televendas_cidademicronomex: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'micronomex'
      Origin = 'micronomex'
      Size = 50
    end
    object q_televendas_cidademesonomex: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mesonomex'
      Origin = 'mesonomex'
      Size = 50
    end
    object q_televendas_cidadeuf: TStringField
      FieldName = 'uf'
      Origin = 'uf'
      FixedChar = True
      Size = 2
    end
    object q_televendas_cidadetelemarketing: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'telemarketing'
      Origin = 'telemarketing'
      ReadOnly = True
      BlobType = ftMemo
    end
  end
  object ds_televendas_cidade: TDataSource
    DataSet = q_televendas_cidade
    Left = 616
    Top = 216
  end
  object dst_televendas_cidade: TfrxDBDataset
    UserName = 'dst_televendas_cidade'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cod_cidade=COD_CIDADE'
      'nom_cidade=NOM_CIDADE'
      'micronomex=MICRONOMEX'
      'mesonomex=MESONOMEX'
      'uf=UF'
      'telemarketing=TELEMARKETING')
    OpenDataSource = False
    DataSet = q_televendas_cidade
    BCDToCurrency = False
    Left = 616
    Top = 272
  end
  object q_teto_comissao: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'SELECT a.ID_REPRESENTANTE, a.TETO, a.COMISSAO'
      'FROM REPRESENTANTE_TETO_COMISSAO a')
    Left = 1056
    Top = 496
    object q_teto_comissaoid_representante: TIntegerField
      FieldName = 'id_representante'
      Origin = 'id_representante'
    end
    object q_teto_comissaoteto: TBCDField
      FieldName = 'teto'
      Origin = 'teto'
      Precision = 15
      Size = 2
    end
    object q_teto_comissaocomissao: TBCDField
      FieldName = 'comissao'
      Origin = 'comissao'
      Precision = 3
      Size = 2
    end
  end
  object ds_teto_comissao: TDataSource
    DataSet = q_teto_comissao
    Left = 1056
    Top = 550
  end
  object dst_teto_comissao: TfrxDBDataset
    UserName = 'dst_teto_comissao'
    CloseDataSource = True
    FieldAliases.Strings = (
      'id_representante=ID_REPRESENTANTE'
      'teto=TETO'
      'comissao=COMISSAO')
    DataSet = q_teto_comissao
    BCDToCurrency = False
    Left = 1056
    Top = 608
  end
  object q_ranking_vendas: TFDQuery
    Active = True
    Connection = dao.CN
    SQL.Strings = (
      'SELECT TIPO,'
      '       REPRESENTANTE,'
      '       TOTAL_ABERTO,'
      '       TOTAL_FATURADO,'
      '       QTDE,'
      '       CAST(DESCONTO AS NUMERIC(15,2)) AS DESCONTO'
      'FROM ('
      '       select '#39'REPRESENTANTE'#39' AS TIPO,'
      
        '              r.id || '#39'-'#39' || r.NOM_REPRESENTANTE as REPRESENTANT' +
        'E,'
      '              coalesce(('
      '                         SELECT SUM(V1.TOT_LIQUIDO)'
      '                         FROM VENDAS1 V1'
      
        '                         WHERE V1.DTADOC between '#39'01/03/2026'#39' an' +
        'd '#39'13/03/2026'#39' and'
      '                               (V1.consignacao <> 1 and'
      '                               V1.orcamento = 0) and'
      '                               V1.FATURADO in (0) and'
      
        '                               (v1.COD_FISCAL not in ('#39'6152'#39', '#39'6' +
        '409'#39') OR'
      '                               V1.COD_FISCAL IS NULL) and'
      '                               V1.NUMDOC_GRUPO IS NULL AND'
      '                               (V1.NFE_DEV is null or'
      '                               V1.STATUS_NFE_DEV = 135) AND'
      '                               V1.COD_REPRESENTANTE = R.ID and'
      
        '                               v1.cod_fop not in (7, 9, 22, 23, ' +
        '24, 26, 32, 46, 47, 51, 52, 53, 54, 57, 58)'
      '              ), 0) AS TOTAL_ABERTO,           '
      '              COALESCE(('
      '                         SELECT SUM(V1.TOT_LIQUIDO)'
      '                         FROM VENDAS1 V1'
      
        '                         WHERE V1.DTA_EMISSAO between '#39'01/03/202' +
        '6'#39' and '#39'13/03/2026'#39' and'
      '                               (V1.consignacao <> 1 and'
      '                               V1.orcamento = 0) and'
      '                               V1.FATURADO in (1) and'
      
        '                               (v1.COD_FISCAL not in ('#39'6152'#39', '#39'6' +
        '409'#39') OR'
      '                               V1.COD_FISCAL IS NULL) and'
      '                               V1.NUMDOC_GRUPO IS NULL AND'
      '                               (V1.NFE_DEV is null or'
      '                               V1.STATUS_NFE_DEV = 135) AND'
      '                               V1.COD_REPRESENTANTE = R.ID and'
      
        '                               v1.cod_fop not in (7, 9, 22, 23, ' +
        '24, 26, 32, 46, 47, 51, 52, 53, 54, 57, 58)'
      '              ), 0) AS TOTAL_FATURADO,'
      '              coalesce(('
      '                         SELECT COUNT(V1.NUMDOC)'
      '                         FROM VENDAS1 V1'
      
        '                         WHERE V1.DTADOC between '#39'01/03/2026'#39' an' +
        'd '#39'13/03/2026'#39' and'
      '                               (V1.consignacao <> 1 and'
      '                               V1.orcamento = 0) and'
      
        '                               (v1.COD_FISCAL not in ('#39'6152'#39', '#39'6' +
        '409'#39') OR'
      '                               V1.COD_FISCAL IS NULL) and'
      '                               V1.NUMDOC_GRUPO IS NULL AND'
      '                               (V1.NFE_DEV is null or'
      '                               V1.STATUS_NFE_DEV = 135) AND'
      '                               V1.COD_REPRESENTANTE = R.ID and'
      
        '                               v1.cod_fop not in (7, 9, 22, 23, ' +
        '24, 26, 32, 46, 47, 51, 52, 53, 54, 57, 58)'
      '              ), 0) AS QTDE,              '
      '              coalesce(('
      '                         SELECT AVG(V1.desconto)'
      '                         FROM VENDAS1 V1'
      
        '                         WHERE V1.DTADOC between '#39'01/03/2026'#39' an' +
        'd '#39'13/03/2026'#39' and'
      '                               (V1.consignacao <> 1 and'
      '                               V1.orcamento = 0) and'
      
        '                               (v1.COD_FISCAL not in ('#39'6152'#39', '#39'6' +
        '409'#39') OR'
      '                               V1.COD_FISCAL IS NULL) and'
      '                               V1.NUMDOC_GRUPO IS NULL AND'
      '                               (V1.NFE_DEV is null or'
      '                               V1.STATUS_NFE_DEV = 135) AND'
      '                               V1.COD_REPRESENTANTE = R.ID and'
      
        '                               v1.cod_fop not in (7, 9, 22, 23, ' +
        '24, 26, 32, 46, 47, 51, 52, 53, 54, 57, 58)'
      '              ), 0) AS DESCONTO                            '
      '       from REPRESENTANTE r'
      '       where R.ATIVO = '#39'S'#39' AND'
      '             R.FUNCIONARIO IN ('#39'0'#39', '#39'1'#39') and'
      '             COALESCE(('
      '                        SELECT SUM(V1.TOT_LIQUIDO)'
      '                        FROM VENDAS1 V1'
      
        '                        WHERE V1.DTA_EMISSAO between '#39'01/03/2026' +
        #39' and '#39'13/03/2026'#39' and'
      '                              (V1.consignacao <> 1 and'
      '                              V1.orcamento = 0) and'
      
        '                              (v1.COD_FISCAL not in ('#39'6152'#39', '#39'64' +
        '09'#39') OR'
      '                              V1.COD_FISCAL IS NULL) and'
      '                              V1.FATURADO in (1) and'
      '                              V1.NUMDOC_GRUPO IS NULL AND'
      '                              (V1.NFE_DEV is null or'
      '                              V1.STATUS_NFE_DEV = 135) AND'
      '                              V1.COD_REPRESENTANTE = R.ID'
      '             ), 0) > 0'
      '       UNION'
      '       select '#39'TELEVENDAS'#39' AS TIPO,'
      
        '              r.id || '#39'-'#39' || r.NOM_REPRESENTANTE as REPRESENTANT' +
        'E,'
      '              coalesce(('
      '                         SELECT SUM(V1.TOT_LIQUIDO)'
      '                         FROM VENDAS1 V1'
      
        '                         WHERE V1.DTADOC between '#39'01/03/2026'#39' an' +
        'd '#39'13/03/2026'#39' and'
      '                               (V1.consignacao <> 1 and'
      '                               V1.orcamento = 0) and'
      '                               V1.FATURADO in (0) and'
      
        '                               (v1.COD_FISCAL not in ('#39'6152'#39', '#39'6' +
        '409'#39') OR'
      '                               V1.COD_FISCAL IS NULL) and'
      '                               V1.NUMDOC_GRUPO IS NULL AND'
      '                               (V1.NFE_DEV is null or'
      '                               V1.STATUS_NFE_DEV = 135) AND'
      '                               V1.COD_SUPERVISOR = R.ID AND'
      
        '                               v1.cod_fop not in (7, 9, 22, 23, ' +
        '24, 26, 32, 46, 47, 51, 52, 53, 54, 57, 58)'
      '              ), 0) AS TOTAL_ABERTO,'
      '              COALESCE(('
      '                         SELECT SUM(V1.TOT_LIQUIDO)'
      '                         FROM VENDAS1 V1'
      
        '                         WHERE V1.DTA_EMISSAO between '#39'01/03/202' +
        '6'#39' and '#39'13/03/2026'#39' and'
      '                               (V1.consignacao <> 1 and'
      '                               V1.orcamento = 0) and'
      '                               V1.FATURADO in (1) and'
      
        '                               (v1.COD_FISCAL not in ('#39'6152'#39', '#39'6' +
        '409'#39') OR'
      '                               V1.COD_FISCAL IS NULL) and'
      '                               V1.NUMDOC_GRUPO IS NULL AND'
      '                               (V1.NFE_DEV is null or'
      '                               V1.STATUS_NFE_DEV = 135) AND'
      '                               V1.COD_SUPERVISOR = R.ID AND'
      
        '                               v1.cod_fop not in (7, 9, 22, 23, ' +
        '24, 26, 32, 46, 47, 51, 52, 53, 54, 57, 58)'
      '              ), 0) AS TOTAL_FATURADO,'
      '              COALESCE(('
      '                         SELECT COUNT(V1.NUMDOC)'
      '                         FROM VENDAS1 V1'
      
        '                         WHERE V1.DTA_EMISSAO between '#39'01/03/202' +
        '6'#39' and '#39'13/03/2026'#39' and'
      '                               (V1.consignacao <> 1 and'
      '                               V1.orcamento = 0) and'
      '                               V1.FATURADO in (1) and'
      
        '                               (v1.COD_FISCAL not in ('#39'6152'#39', '#39'6' +
        '409'#39') OR'
      '                               V1.COD_FISCAL IS NULL) and'
      '                               V1.NUMDOC_GRUPO IS NULL AND'
      '                               (V1.NFE_DEV is null or'
      '                               V1.STATUS_NFE_DEV = 135) AND'
      '                               V1.COD_SUPERVISOR = R.ID AND'
      
        '                               v1.cod_fop not in (7, 9, 22, 23, ' +
        '24, 26, 32, 46, 47, 51, 52, 53, 54, 57, 58)'
      '              ), 0) AS QTDE,              '
      '              COALESCE(('
      '                         SELECT AVG(V1.DESCONTO)'
      '                         FROM VENDAS1 V1'
      
        '                         WHERE V1.DTA_EMISSAO between '#39'01/03/202' +
        '6'#39' and '#39'13/03/2026'#39' and'
      '                               (V1.consignacao <> 1 and'
      '                               V1.orcamento = 0) and'
      '                               V1.FATURADO in (1) and'
      
        '                               (v1.COD_FISCAL not in ('#39'6152'#39', '#39'6' +
        '409'#39') OR'
      '                               V1.COD_FISCAL IS NULL) and'
      '                               V1.NUMDOC_GRUPO IS NULL AND'
      '                               (V1.NFE_DEV is null or'
      '                               V1.STATUS_NFE_DEV = 135) AND'
      '                               V1.COD_SUPERVISOR = R.ID AND'
      
        '                               v1.cod_fop not in (7, 9, 22, 23, ' +
        '24, 26, 32, 46, 47, 51, 52, 53, 54, 57, 58)'
      '              ), 0) AS DESCONTO               '
      '       from REPRESENTANTE r'
      '       where R.FUNCIONARIO IN ('#39'4'#39') and'
      '             COALESCE(('
      '                        SELECT SUM(V1.TOT_LIQUIDO)'
      '                        FROM VENDAS1 V1'
      
        '                        WHERE V1.DTA_EMISSAO between '#39'01/03/2026' +
        #39' and '#39'13/03/2026'#39' and'
      '                              (V1.consignacao <> 1 and'
      '                              V1.orcamento = 0) and'
      
        '                              (v1.COD_FISCAL not in ('#39'6152'#39', '#39'64' +
        '09'#39') OR'
      '                              V1.COD_FISCAL IS NULL) and'
      '                              V1.NUMDOC_GRUPO IS NULL AND'
      '                              (V1.NFE_DEV is null or'
      '                              V1.STATUS_NFE_DEV = 135) AND'
      '                              V1.COD_SUPERVISOR = R.ID'
      '             ), 0) > 0'
      '     ) q1'
      'order by TIPO,'
      '         total_FATURADO desc')
    Left = 1152
    Top = 496
    object q_ranking_vendastipo: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'tipo'
      Origin = 'tipo'
      ReadOnly = True
      BlobType = ftMemo
    end
    object q_ranking_vendasrepresentante: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'representante'
      Origin = 'representante'
      ReadOnly = True
      BlobType = ftMemo
    end
    object q_ranking_vendastotal_aberto: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'total_aberto'
      Origin = 'total_aberto'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_ranking_vendastotal_faturado: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'total_faturado'
      Origin = 'total_faturado'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_ranking_vendasqtde: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'qtde'
      Origin = 'qtde'
      ReadOnly = True
    end
    object q_ranking_vendasdesconto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'desconto'
      Origin = 'desconto'
      ReadOnly = True
      Precision = 15
      Size = 2
    end
  end
  object ds_ranking_vendas: TDataSource
    DataSet = q_ranking_vendas
    Left = 1152
    Top = 550
  end
  object dst_ranking_vendas: TfrxDBDataset
    UserName = 'dst_ranking_vendas'
    CloseDataSource = True
    FieldAliases.Strings = (
      'tipo=TIPO'
      'representante=REPRESENTANTE'
      'total_aberto=TOTAL_ABERTO'
      'total_faturado=TOTAL_FATURADO'
      'qtde=qtde'
      'desconto=desconto')
    DataSet = q_ranking_vendas
    BCDToCurrency = False
    Left = 1152
    Top = 608
  end
  object mm_Catalogo: TRxMemoryData
    FieldDefs = <>
    Left = 672
    Top = 704
    object mm_CatalogoCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
    end
    object mm_CatalogoSUBCATEGORIA: TStringField
      FieldName = 'SUBCATEGORIA'
      Size = 100
    end
    object mm_CatalogoNOM_PRODUTO: TStringField
      FieldName = 'NOM_PRODUTO'
      Size = 100
    end
    object mm_CatalogoCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
      Size = 100
    end
    object mm_CatalogoQTD_EMBALAGEM: TFloatField
      FieldName = 'QTD_EMBALAGEM'
    end
    object mm_CatalogoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 5
    end
    object mm_CatalogoCOR: TStringField
      DisplayWidth = 100
      FieldName = 'COR'
      Size = 100
    end
    object mm_CatalogoCOLOR: TIntegerField
      FieldName = 'COLOR'
    end
    object mm_CatalogoIMAGEM_BD: TBlobField
      FieldName = 'IMAGEM_BD'
    end
    object mm_CatalogoPAGINA: TIntegerField
      FieldName = 'PAGINA'
    end
    object mm_CatalogoITENS: TIntegerField
      FieldName = 'ITENS'
    end
    object mm_CatalogoPROXIMO: TIntegerField
      FieldName = 'PROXIMO'
    end
    object mm_CatalogoX: TFloatField
      FieldName = 'X'
    end
    object mm_CatalogoY: TFloatField
      FieldName = 'Y'
    end
    object mm_CatalogoItensPorCategoria: TIntegerField
      FieldName = 'ItensPorCategoria'
    end
    object mm_CatalogoITENSPORPAGINA: TIntegerField
      FieldName = 'ITENSPORPAGINA'
    end
    object mm_CatalogoORDEMITEMPAG: TIntegerField
      FieldName = 'ORDEMITEMPAG'
    end
  end
  object q_clientes_visitas: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'SELECT a.COD_CLIENTE, a.NOM_CLIENTE, a.PERIODO_FREQUENCIA_VISITA' +
        'S, cast(coalesce(a.ULTIMA_FREQUENCIA, '#39'2015-01-01'#39') as date) as ' +
        'ultima_frequencia,'
      'R.ID||'#39'-'#39'||R.NOM_REPRESENTANTE AS REPRESENTANTE'
      'FROM CLIENTE a'
      'INNER JOIN REPRESENTANTE R ON R.ID = A.ID_REPRESENTANTE'
      ''
      'where'
      '  a.CLIENTE_BLOQUEADO <> '#39'S'#39' and'
      
        '  (a.ULTIMA_FREQUENCIA+cast(a.PERIODO_FREQUENCIA_VISITAS as inte' +
        'ger)) < current_date'
      '  '
      'ORDER BY'
      '  REPRESENTANTE, ULTIMA_FREQUENCIA DESC, NOM_CLIENTE')
    Left = 136
    Top = 176
    object q_clientes_visitascod_cliente: TIntegerField
      FieldName = 'cod_cliente'
      Origin = 'cod_cliente'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_clientes_visitasnom_cliente: TStringField
      FieldName = 'nom_cliente'
      Origin = 'nom_cliente'
      Size = 150
    end
    object q_clientes_visitasperiodo_frequencia_visitas: TStringField
      FieldName = 'periodo_frequencia_visitas'
      Origin = 'periodo_frequencia_visitas'
      Size = 50
    end
    object q_clientes_visitasultima_frequencia: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'ultima_frequencia'
      Origin = 'ultima_frequencia'
      ReadOnly = True
    end
    object q_clientes_visitasrepresentante: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'representante'
      Origin = 'representante'
      ReadOnly = True
      BlobType = ftMemo
    end
  end
  object ds_clientes_visitas: TDataSource
    DataSet = q_clientes_visitas
    Left = 136
    Top = 216
  end
  object dst_clientes_visitas: TfrxDBDataset
    UserName = 'dst_clientes_visitas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cod_cliente=COD_CLIENTE'
      'nom_cliente=NOM_CLIENTE'
      'periodo_frequencia_visitas=PERIODO_FREQUENCIA_VISITAS'
      'ultima_frequencia=ULTIMA_FREQUENCIA'
      'representante=REPRESENTANTE')
    DataSet = q_clientes_visitas
    BCDToCurrency = False
    Left = 136
    Top = 272
  end
  object q_capa_embalagem: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'SELECT a.cod_produto, a.NOM_PRODUTO, a.CODIGO_BARRA'
      'FROM PRODUTO a'
      'where a.cod_PRODUTO > 3171'
      'order by a.NOM_PRODUTO')
    Left = 440
    Top = 664
    object q_capa_embalagemcod_produto: TIntegerField
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_capa_embalagemnom_produto: TStringField
      FieldName = 'nom_produto'
      Origin = 'nom_produto'
      Size = 100
    end
    object q_capa_embalagemcodigo_barra: TStringField
      FieldName = 'codigo_barra'
      Origin = 'codigo_barra'
    end
  end
  object ds_capa_embalagem: TDataSource
    DataSet = q_capa_embalagem
    Left = 440
    Top = 720
  end
  object frx_capa_embalagem: TfrxDBDataset
    UserName = 'frx_capa_embalagem'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cod_produto=COD_PRODUTO'
      'nom_produto=NOM_PRODUTO'
      'codigo_barra=CODIGO_BARRA')
    DataSet = q_capa_embalagem
    BCDToCurrency = False
    Left = 440
    Top = 776
  end
  object q_ordem_producao: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'select '
      
        '  codigo, local, descricao, cod_produto, nom_produto, qtde, qtd_' +
        'estoque, estoque_minimo, pai, ordem'
      'from'
      '('
      
        'SELECT distinct e.CODIGO, e.LOCAL, ce.DESCRICAO, a.COD_PRODUTO, ' +
        'a.NOM_PRODUTO,  ei.QTDE, a.QTD_ESTOQUE, a.ESTOQUE_MINIMO, 0 as p' +
        'ai, 0 as ordem'
      'FROM PRODUTO a'
      
        'left outer join ESTRUTURA_PRODUTO ep on ep.COD_PRODUTO_ACABADO =' +
        ' a.cod_produto'
      
        'left outer join ENTRADA_PRODUCAO_ITEM ei on ei.COD_PRODUTO = a.c' +
        'od_produto'
      'inner join ENTRADA_PRODUCAO e on e.CODIGO = ei.CODIGO'
      'inner join CATEGORIA_ESTOQUE ce on ce.ID = e.LOCAL'
      'where'
      '  e.CODIGO = :cod'
      '  '
      'union'
      ''
      
        'SELECT distinct e.codigo, e.local, ce.DESCRICAO, a.COD_PRODUTO, ' +
        'a.NOM_PRODUTO,  ei.QTDE*ep.QUANTIDADE, a.QTD_ESTOQUE, a.ESTOQUE_' +
        'MINIMO, b.cod_produto as pai, ep.ORDEM'
      'FROM ESTRUTURA_PRODUTO ep'
      'inner join PRODUTO a on ep.COD_PRODUTO_insumo = a.cod_produto '
      'inner join produto b on b.COD_PRODUTO = ep.COD_PRODUTO_ACABADO'
      
        'inner join ENTRADA_PRODUCAO_ITEM ei on ei.COD_PRODUTO = b.cod_pr' +
        'oduto'
      'inner join ENTRADA_PRODUCAO e on e.CODIGO = ei.CODIGO'
      'inner join CATEGORIA_ESTOQUE ce on ce.ID = e.LOCAL'
      'where'
      '  e.CODIGO = :cod'
      ' ) Q1'
      ' order by pai, ordem'
      ''
      '')
    Left = 1200
    Top = 32
    ParamData = <
      item
        Name = 'cod'
        DataType = ftLargeint
        ParamType = ptInput
      end>
    object q_ordem_producaocodigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'codigo'
      Origin = 'codigo'
      ReadOnly = True
    end
    object q_ordem_producaolocal: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'local'
      Origin = '"local"'
      ReadOnly = True
    end
    object q_ordem_producaodescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      ReadOnly = True
      FixedChar = True
    end
    object q_ordem_producaocod_produto: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_ordem_producaonom_produto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_produto'
      Origin = 'nom_produto'
      ReadOnly = True
      Size = 100
    end
    object q_ordem_producaoqtde: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'qtde'
      Origin = 'qtde'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_ordem_producaoqtd_estoque: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'qtd_estoque'
      Origin = 'qtd_estoque'
      ReadOnly = True
      Precision = 15
      Size = 2
    end
    object q_ordem_producaoestoque_minimo: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'estoque_minimo'
      Origin = 'estoque_minimo'
      ReadOnly = True
      Precision = 15
      Size = 2
    end
    object q_ordem_producaopai: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'pai'
      Origin = 'pai'
      ReadOnly = True
    end
    object q_ordem_producaoordem: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ordem'
      Origin = 'ordem'
      ReadOnly = True
    end
  end
  object ds_ordem_producao: TDataSource
    DataSet = q_ordem_producao
    Left = 1200
    Top = 86
  end
  object dst_ordem_producao: TfrxDBDataset
    UserName = 'dst_ordem_producao'
    CloseDataSource = True
    FieldAliases.Strings = (
      'codigo=CODIGO'
      'local=LOCAL'
      'descricao=DESCRICAO'
      'cod_produto=COD_PRODUTO'
      'nom_produto=NOM_PRODUTO'
      'qtde=QTDE'
      'qtd_estoque=QTD_ESTOQUE'
      'estoque_minimo=ESTOQUE_MINIMO'
      'pai=PAI'
      'ordem=ORDEM')
    DataSet = q_ordem_producao
    BCDToCurrency = False
    Left = 1200
    Top = 144
  end
  object q_hist_processo_pedidos: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'SELECT a.ID, a.PROCESSO_ID, a.DATA, a.HORA, a.OBS, v1.NUMDOC, v1' +
        '.COD_CLIENTE, cl.NOM_CLIENTE, v1.TOT_LIQUIDO'
      'FROM HIST_PROCESSO_PEDIDO a'
      'inner join PROCESSO_PEDIDO pp on pp.ID  = a.PROCESSO_ID'
      'inner join VENDAS1 v1 on v1.PROCESSO_ID = a.PROCESSO_ID'
      'inner join cliente cl on cl.COD_CLIENTE = v1.COD_CLIENTE'
      'where a.PROCESSO_ID = :cod and v1.COD_FOP <> 32'
      'order by v1.numdoc, a.ID desc')
    Left = 1200
    Top = 200
    ParamData = <
      item
        Name = 'cod'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object q_hist_processo_pedidosid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_hist_processo_pedidosprocesso_id: TIntegerField
      FieldName = 'processo_id'
      Origin = 'processo_id'
    end
    object q_hist_processo_pedidosdata: TDateField
      FieldName = 'data'
      Origin = 'data'
    end
    object q_hist_processo_pedidoshora: TTimeField
      FieldName = 'hora'
      Origin = 'hora'
    end
    object q_hist_processo_pedidosobs: TMemoField
      FieldName = 'obs'
      Origin = 'obs'
      BlobType = ftMemo
    end
    object q_hist_processo_pedidosnumdoc: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'numdoc'
      Origin = 'numdoc'
    end
    object q_hist_processo_pedidoscod_cliente: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_cliente'
      Origin = 'cod_cliente'
    end
    object q_hist_processo_pedidosnom_cliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_cliente'
      Origin = 'nom_cliente'
      Size = 150
    end
    object q_hist_processo_pedidostot_liquido: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'tot_liquido'
      Origin = 'tot_liquido'
      Precision = 15
    end
  end
  object ds_hist_processo_pedidos: TDataSource
    DataSet = q_hist_processo_pedidos
    Left = 1200
    Top = 254
  end
  object dst_hist_processo_pedidos: TfrxDBDataset
    UserName = 'dst_hist_processo_pedidos'
    CloseDataSource = True
    FieldAliases.Strings = (
      'id=ID'
      'processo_id=PROCESSO_ID'
      'data=DATA'
      'hora=HORA'
      'obs=OBS'
      'numdoc=NUMDOC'
      'cod_cliente=COD_CLIENTE'
      'nom_cliente=NOM_CLIENTE'
      'tot_liquido=TOT_LIQUIDO')
    DataSet = q_hist_processo_pedidos
    BCDToCurrency = False
    Left = 1200
    Top = 312
  end
  object q_comissao_cr_baixadas: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'SELECT r.id,'
      '       r.NOM_REPRESENTANTE,'
      '       b.NOM_BANCO,'
      '       r.NR_AGENCIA,'
      '       r.NR_BANCO,'
      '       r.NR_CONTA_CORRENTE,'
      '       r.TITULAR_CONTA,'
      '       r.EMAIL,'
      '       r.CELULAR,'
      '       r.FONE,'
      '       c.COD_CLIENTE,'
      '       c.NOM_CLIENTE,'
      '       a.TITULO,'
      '       a.nr_documento,'
      '       a.SEQUENCIA,'
      '       a.DTAREC,'
      '       a.VALOR_RECEBIDO,'
      '       vc.MARGEM_LUCRO,'
      '       case'
      
        '         when v1.cod_supervisor is not null then v1.PERC_COMISSA' +
        'O - 0.5'
      '         else v1.PERC_COMISSAO'
      '       end as PERC_COMISSAO,'
      
        '       a.valor_recebido *(v1.PERC_COMISSAO / 100) as vlr_comissa' +
        'o'
      'FROM CR1 a'
      '     inner join vendas1 v1 on v1.NUMDOC = a.NR_DOCUMENTO'
      '     inner join V_COMISSAO_NOVA vc on vc.NUMDOC = v1.numdoc'
      '     inner join REPRESENTANTE r on r.id = v1.COD_REPRESENTANTE'
      
        '     left outer join banco b on b.ID = CAST(r.NR_BANCO AS INTEGE' +
        'R)'
      '     inner join cliente c on c.COD_CLIENTE = v1.COD_CLIENTE'
      'where a.VALOR_RECEBIDO > 0 and'
      '      V1.PERC_COMISSAO IS NOT NULL -- and V1.NUMDOC = 41237')
    Left = 864
    Top = 672
    object q_comissao_cr_baixadasid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_comissao_cr_baixadasnom_representante: TStringField
      FieldName = 'nom_representante'
      Origin = 'nom_representante'
      Size = 50
    end
    object q_comissao_cr_baixadasnom_banco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_banco'
      Origin = 'nom_banco'
      Size = 30
    end
    object q_comissao_cr_baixadasnr_agencia: TStringField
      FieldName = 'nr_agencia'
      Origin = 'nr_agencia'
      FixedChar = True
      Size = 10
    end
    object q_comissao_cr_baixadasnr_banco: TStringField
      FieldName = 'nr_banco'
      Origin = 'nr_banco'
      FixedChar = True
      Size = 4
    end
    object q_comissao_cr_baixadasnr_conta_corrente: TStringField
      FieldName = 'nr_conta_corrente'
      Origin = 'nr_conta_corrente'
      FixedChar = True
    end
    object q_comissao_cr_baixadastitular_conta: TStringField
      FieldName = 'titular_conta'
      Origin = 'titular_conta'
      Size = 50
    end
    object q_comissao_cr_baixadasemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 50
    end
    object q_comissao_cr_baixadascelular: TStringField
      FieldName = 'celular'
      Origin = 'celular'
      FixedChar = True
      Size = 14
    end
    object q_comissao_cr_baixadasfone: TStringField
      FieldName = 'fone'
      Origin = 'fone'
      FixedChar = True
      Size = 14
    end
    object q_comissao_cr_baixadascod_cliente: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_cliente'
      Origin = 'cod_cliente'
    end
    object q_comissao_cr_baixadasnom_cliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_cliente'
      Origin = 'nom_cliente'
      Size = 150
    end
    object q_comissao_cr_baixadastitulo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'titulo'
      Origin = 'titulo'
      FixedChar = True
      Size = 6
    end
    object q_comissao_cr_baixadasnr_documento: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'nr_documento'
      Origin = 'nr_documento'
    end
    object q_comissao_cr_baixadassequencia: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'sequencia'
      Origin = 'sequencia'
    end
    object q_comissao_cr_baixadasdtarec: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'dtarec'
      Origin = 'dtarec'
    end
    object q_comissao_cr_baixadasvalor_recebido: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valor_recebido'
      Origin = 'valor_recebido'
      Precision = 15
      Size = 2
    end
    object q_comissao_cr_baixadasmargem_lucro: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'margem_lucro'
      Origin = 'margem_lucro'
      Precision = 64
      Size = 0
    end
    object q_comissao_cr_baixadasperc_comissao: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'perc_comissao'
      Origin = 'perc_comissao'
      ReadOnly = True
    end
    object q_comissao_cr_baixadasvlr_comissao: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'vlr_comissao'
      Origin = 'vlr_comissao'
      ReadOnly = True
    end
  end
  object ds_comissao_cr_baixadas: TDataSource
    DataSet = q_comissao_cr_baixadas
    Left = 856
    Top = 718
  end
  object dst_comissao_cr_baixadas: TfrxDBDataset
    UserName = 'dst_comissao_cr_baixadas'
    CloseDataSource = True
    FieldAliases.Strings = (
      'id=ID'
      'nom_representante=NOM_REPRESENTANTE'
      'nom_banco=NOM_BANCO'
      'nr_agencia=NR_AGENCIA'
      'nr_banco=NR_BANCO'
      'nr_conta_corrente=NR_CONTA_CORRENTE'
      'titular_conta=TITULAR_CONTA'
      'email=EMAIL'
      'celular=CELULAR'
      'fone=FONE'
      'cod_cliente=COD_CLIENTE'
      'nom_cliente=NOM_CLIENTE'
      'titulo=TITULO'
      'nr_documento=NR_DOCUMENTO'
      'sequencia=SEQUENCIA'
      'dtarec=DTAREC'
      'valor_recebido=VALOR_RECEBIDO'
      'margem_lucro=MARGEM_LUCRO'
      'perc_comissao=PERC_COMISSAO'
      'vlr_comissao=VLR_COMISSAO')
    DataSet = q_comissao_cr_baixadas
    BCDToCurrency = False
    Left = 864
    Top = 768
  end
  object ACBrNFe1: TACBrNFe
    Configuracoes.Geral.SSLLib = libCustom
    Configuracoes.Geral.SSLCryptLib = cryNone
    Configuracoes.Geral.SSLHttpLib = httpIndy
    Configuracoes.Geral.SSLXmlSignLib = xsNone
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.VersaoQRCode = veqr000
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.RespTec.IdCSRT = 0
    DANFE = ACBrNFeDANFEFR1
    Left = 56
    Top = 704
  end
  object ACBrNFeDANFEFR1: TACBrNFeDANFEFR
    Sistema = 'Projeto ACBr - www.projetoacbr.com.br'
    MargemInferior = 0.800000000000000000
    MargemSuperior = 0.800000000000000000
    MargemEsquerda = 0.600000000000000000
    MargemDireita = 0.510000000000000000
    ExpandeLogoMarcaConfig.Altura = 0
    ExpandeLogoMarcaConfig.Esquerda = 0
    ExpandeLogoMarcaConfig.Topo = 0
    ExpandeLogoMarcaConfig.Largura = 0
    ExpandeLogoMarcaConfig.Dimensionar = False
    ExpandeLogoMarcaConfig.Esticar = True
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 2
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.00'
    CasasDecimais.MaskvUnCom = ',0.00'
    CasasDecimais.Aliquota = 2
    CasasDecimais.MaskAliquota = ',0.00'
    ACBrNFe = ACBrNFe1
    TipoDANFE = tiSemGeracao
    EspessuraBorda = 1
    BorderIcon = [biSystemMenu, biMinimize, biMaximize]
    ThreadSafe = False
    Left = 152
    Top = 704
  end
  object ftpSite: TIdFTP
    IPVersion = Id_IPv4
    Host = 'www.plasfan.ind.br'
    Password = 'q1w2e3'
    Username = 'plasfa'
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    ReadTimeout = 0
    Left = 680
    Top = 376
  end
  object q_ranking_produtos: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'select'
      '  g.cod_grupo, '
      '  g.nom_grupo,'
      '  p.cod_produto,'
      '  p.nom_produto,'
      '  sum(v2.qtd) as qtd,'
      '  max(v2.preco) as preco,'
      '  sum(v2.sub_total) as valor_total'
      'from produto p'
      'inner join grupo g on g.cod_grupo = p.cod_grupo'
      'inner join vendas2 v2 on v2.cod_produto = p.cod_produto'
      'inner join vendas1 v1 on v1.numdoc = v2.numdoc'
      'where'
      '      v1.COD_FISCAL not in ('#39'6152'#39', '#39'6409'#39') '
      '  and v1.nfe_dev is null '
      '  and v1.faturado in (1)'
      '  and v1.dta_emissao between '#39'01/11/2025'#39' and '#39'30/11/2025'#39
      'group by'
      '  g.cod_grupo, '
      '  g.nom_grupo,'
      '  p.cod_produto,'
      '  p.nom_produto'
      'order by g.nom_grupo, p.nom_produto  ')
    Left = 1152
    Top = 392
    object q_ranking_produtoscod_grupo: TIntegerField
      FieldName = 'cod_grupo'
      Origin = 'cod_grupo'
    end
    object q_ranking_produtosnom_grupo: TStringField
      FieldName = 'nom_grupo'
      Origin = 'nom_grupo'
      Size = 100
    end
    object q_ranking_produtoscod_produto: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_ranking_produtosnom_produto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_produto'
      Origin = 'nom_produto'
      Size = 100
    end
    object q_ranking_produtosqtd: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'qtd'
      Origin = 'qtd'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_ranking_produtospreco: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'preco'
      Origin = 'preco'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_ranking_produtosvalor_total: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valor_total'
      Origin = 'valor_total'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
  end
  object ds_ranking_produtos: TDataSource
    DataSet = q_ranking_produtos
    Left = 1152
    Top = 446
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'dst_ranking_produtos'
    CloseDataSource = True
    FieldAliases.Strings = (
      'cod_grupo=cod_grupo'
      'nom_grupo=nom_grupo'
      'cod_produto=cod_produto'
      'nom_produto=nom_produto'
      'qtd=qtd'
      'preco=preco'
      'valor_total=valor_total')
    DataSet = q_ranking_produtos
    BCDToCurrency = False
    Left = 1232
    Top = 440
  end
  object q_ranking_vendas_completo: TFDQuery
    MasterSource = DS_NF
    Connection = dao.CN
    SQL.Strings = (
      'select '
      '  r.id,'
      '  r.nom_representante,'
      '  mr.mes,'
      '  mr.vl_meta,'
      '  coalesce(mr.vl_realizado, 0) as vl_realizado,'
      '  coalesce(mr.perc_realizado, 0) as perc_realizado,'
      
        '  coalesce(mr.qtd_clientes_atendidos, 0) as qtd_clientes_atendid' +
        'os,'
      '  coalesce(mr.qtd_clientes_base) as qtd_clientes_base,'
      '  coalesce(mr.perc_positivacao, 0) as perc_positivacao,'
      '  coalesce(mr.ticket_medio,0) as ticket_medio,'
      '  coalesce(mr.perc_desconto,0) as perc_desconto'
      ' '
      'from metas_representante mr '
      'inner join representante r on r.id = mr.id_representante'
      'where mes = '#39'05/2026'#39
      'order by 5 desc')
    Left = 301
    Top = 689
    object q_ranking_vendas_completoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_ranking_vendas_completonom_representante: TStringField
      FieldName = 'nom_representante'
      Origin = 'nom_representante'
      Size = 50
    end
    object q_ranking_vendas_completomes: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'mes'
      Origin = 'mes'
      Size = 11
    end
    object q_ranking_vendas_completovl_meta: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vl_meta'
      Origin = 'vl_meta'
      Precision = 15
      Size = 2
    end
    object q_ranking_vendas_completovl_realizado: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vl_realizado'
      Origin = 'vl_realizado'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_ranking_vendas_completoperc_realizado: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'perc_realizado'
      Origin = 'perc_realizado'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_ranking_vendas_completoqtd_clientes_atendidos: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'qtd_clientes_atendidos'
      Origin = 'qtd_clientes_atendidos'
      ReadOnly = True
    end
    object q_ranking_vendas_completoqtd_clientes_base: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'qtd_clientes_base'
      Origin = 'qtd_clientes_base'
    end
    object q_ranking_vendas_completoperc_positivacao: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'perc_positivacao'
      Origin = 'perc_positivacao'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_ranking_vendas_completoticket_medio: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ticket_medio'
      Origin = 'ticket_medio'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_ranking_vendas_completoperc_desconto: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'perc_desconto'
      Origin = 'perc_desconto'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
  end
  object ds_ranking_vendas_completo: TDataSource
    DataSet = q_ranking_vendas_completo
    Left = 301
    Top = 745
  end
  object dst_ranking_vendas_completo: TfrxDBDataset
    UserName = 'dst_ranking_vendas_completo'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=id'
      'nom_representante=nom_representante'
      'mes=mes'
      'vl_meta=vl_meta'
      'vl_realizado=vl_realizado'
      'perc_realizado=perc_realizado'
      'qtd_clientes_atendidos=qtd_clientes_atendidos'
      'qtd_clientes_base=qtd_clientes_base'
      'perc_positivacao=perc_positivacao'
      'ticket_medio=ticket_medio'
      'perc_desconto=perc_desconto')
    DataSet = q_ranking_vendas_completo
    BCDToCurrency = False
    Left = 301
    Top = 801
  end
end
