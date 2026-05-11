object Dm: TDm
  OldCreateOrder = False
  Left = 105
  Top = 30
  Height = 726
  Width = 1091
  object Q1_NF: TIBOQuery
    Params = <>
    DatabaseName = ':c:\orbi\dados\orbi.fdb'
    Connection = dao.CN
    KeyLinks.Strings = (
      'entrada1.nr_documento'
      'entrada1.cod_fornecedor')
    RecordCountAccurate = True
    SQL.Strings = (
      
        'select e1.nr_documento, e1.dta_documento,e1.cod_fornecedor, e1.v' +
        'l_total, e1.tot_itens from entrada1 e1')
    FieldOptions = []
    Left = 40
    Top = 320
    object Q1_NFNR_DOCUMENTO: TIntegerField
      FieldName = 'NR_DOCUMENTO'
      Required = True
    end
    object Q1_NFVL_TOTAL: TBCDField
      FieldName = 'VL_TOTAL'
      Size = 8
    end
    object Q1_NFTOT_ITENS: TBCDField
      FieldName = 'TOT_ITENS'
      Size = 8
    end
    object Q1_NFCOD_FORNECEDOR: TIntegerField
      FieldName = 'COD_FORNECEDOR'
      Required = True
    end
    object Q1_NFDTA_DOCUMENTO: TDateField
      FieldName = 'DTA_DOCUMENTO'
    end
  end
  object DS_NF: TDataSource
    DataSet = Q1_NF
    Left = 40
    Top = 376
  end
  object Q_itens: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'nr_documento'
        ParamType = ptInput
        Value = 307
      end
      item
        DataType = ftInteger
        Name = 'cod_fornecedor'
        ParamType = ptInput
      end>
    DatabaseName = ':c:\orbi\dados\orbi.fdb'
    Connection = dao.CN
    RecordCountAccurate = True
    DataSource = DS_NF
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
    FieldOptions = []
    Left = 120
    Top = 320
    object Q_itensNR_DOCUMENTO: TIntegerField
      FieldName = 'NR_DOCUMENTO'
    end
    object Q_itensCOD_FORNECEDOR: TIntegerField
      FieldName = 'COD_FORNECEDOR'
    end
    object Q_itensCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
    end
    object Q_itensREF_FABRICA: TStringField
      FieldName = 'REF_FABRICA'
      Size = 15
    end
    object Q_itensNOM_PRODUTO: TStringField
      FieldName = 'NOM_PRODUTO'
      Size = 70
    end
    object Q_itensCUSTO: TBCDField
      FieldName = 'CUSTO'
      Size = 8
    end
    object Q_itensCOR: TStringField
      FieldName = 'COR'
      Size = 30
    end
    object Q_itensTAMANHO: TStringField
      FieldName = 'TAMANHO'
    end
    object Q_itensQTD_ENTRADA: TBCDField
      FieldName = 'QTD_ENTRADA'
      Size = 8
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
    DataSet = Q_itens
    Left = 120
    Top = 432
  end
  object dst_nf: TfrxDBDataset
    UserName = 'dst_nf'
    CloseDataSource = False
    DataSet = Q1_NF
    Left = 40
    Top = 432
  end
  object q_separacao_carga: TIBOQuery
    Params = <>
    DatabaseName = ':c:\orbi\dados\orbi.fdb'
    Connection = dao.CN
    RecordCountAccurate = True
    DataSource = DS_NF
    SQL.Strings = (
      
        'select p.cod_produto, p.nom_produto, p.cod_prateleira, sum(v2.qt' +
        'd) soma from vendas2 v2'
      'left join produto p on p.cod_produto=v2.cod_produto'
      'group by p.cod_produto, p.nom_produto, p.cod_prateleira')
    FieldOptions = []
    Left = 264
    Top = 320
    object q_separacao_cargaCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      ReadOnly = True
    end
    object q_separacao_cargaNOM_PRODUTO: TStringField
      FieldName = 'NOM_PRODUTO'
      ReadOnly = True
      Size = 70
    end
    object q_separacao_cargaCOD_PRATELEIRA: TStringField
      FieldName = 'COD_PRATELEIRA'
      ReadOnly = True
      Size = 10
    end
    object q_separacao_cargaSOMA: TBCDField
      FieldName = 'SOMA'
      ReadOnly = True
      Size = 2
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
    DataSet = q_separacao_carga
    Left = 264
    Top = 432
  end
  object q_posicao_estoque: TIBOQuery
    Params = <>
    DatabaseName = ':c:\orbi\dados\orbi.fdb'
    Connection = dao.CN
    RecordCountAccurate = True
    DataSource = DS_NF
    SQL.Strings = (
      
        'select pro.cod_produto, pro.nom_produto, pro.grade, pro.qtd_esto' +
        'que, pro.qtd_reservado, pro.cod_grupo, cr.cor , tm.tamanho, gd.e' +
        'st_individual, g.nom_grupo, pro.preco_venda, f.razao_social from' +
        ' produto pro '
      'left join grade gd on gd.cod_produto=pro.cod_produto '
      'left join cores cr on cr.id=gd.id_cor'
      'left join tamanho tm on tm.id=gd.id_tamanho'
      
        'left join fornecedor f on f.cod_fornecedor = pro.fornecedor_prin' +
        'cipal'
      'left join grupo g on g.cod_grupo = pro.cod_grupo'
      'order by f.razao_social, g.nom_grupo')
    FieldOptions = []
    Left = 32
    Top = 496
    object q_posicao_estoqueCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object q_posicao_estoqueNOM_PRODUTO: TStringField
      FieldName = 'NOM_PRODUTO'
      Required = True
      Size = 70
    end
    object q_posicao_estoqueGRADE: TIntegerField
      FieldName = 'GRADE'
    end
    object q_posicao_estoqueQTD_ESTOQUE: TBCDField
      FieldName = 'QTD_ESTOQUE'
      Size = 8
    end
    object q_posicao_estoqueEST_INDIVIDUAL: TBCDField
      FieldName = 'EST_INDIVIDUAL'
      Size = 8
    end
    object q_posicao_estoqueCOR: TStringField
      FieldName = 'COR'
      Size = 30
    end
    object q_posicao_estoqueTAMANHO: TStringField
      FieldName = 'TAMANHO'
    end
    object q_posicao_estoqueCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
    end
    object q_posicao_estoqueNOM_GRUPO: TStringField
      FieldName = 'NOM_GRUPO'
      Size = 30
    end
    object q_posicao_estoqueRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 50
    end
    object q_posicao_estoqueQTD_RESERVADO: TBCDField
      FieldName = 'QTD_RESERVADO'
      Precision = 18
      Size = 2
    end
    object q_posicao_estoquePRECO_VENDA: TBCDField
      FieldName = 'PRECO_VENDA'
      Precision = 18
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
      'COD_PRODUTO=COD_PRODUTO'
      'NOM_PRODUTO=NOM_PRODUTO'
      'GRADE=GRADE'
      'QTD_ESTOQUE=QTD_ESTOQUE'
      'EST_INDIVIDUAL=EST_INDIVIDUAL'
      'COR=COR'
      'TAMANHO=TAMANHO'
      'COD_GRUPO=COD_GRUPO'
      'NOM_GRUPO=NOM_GRUPO'
      'RAZAO_SOCIAL=RAZAO_SOCIAL'
      'QTD_RESERVADO=QTD_RESERVADO'
      'PRECO_VENDA=PRECO_VENDA')
    DataSet = q_posicao_estoque
    Left = 32
    Top = 608
  end
  object Q_consignacao: TIBOQuery
    Params = <>
    DatabaseName = ':c:\orbi\dados\orbi.fdb'
    Connection = dao.CN
    RecordCountAccurate = True
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
      'left join tbusu usu on usu.codusu=v1.cod_usuario'
      'order by v2.cod_cliente, v2.dtadoc')
    FieldOptions = []
    Left = 176
    Top = 496
    object Q_consignacaoCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
    end
    object Q_consignacaoCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object Q_consignacaoID_COR: TIntegerField
      FieldName = 'ID_COR'
    end
    object Q_consignacaoID_TAMANHO: TIntegerField
      FieldName = 'ID_TAMANHO'
    end
    object Q_consignacaoQTD: TBCDField
      FieldName = 'QTD'
      Size = 8
    end
    object Q_consignacaoPRECO: TBCDField
      FieldName = 'PRECO'
      Size = 8
    end
    object Q_consignacaoSUB_TOTAL: TBCDField
      FieldName = 'SUB_TOTAL'
      Size = 8
    end
    object Q_consignacaoNOM_PRODUTO: TStringField
      FieldName = 'NOM_PRODUTO'
      Size = 70
    end
    object Q_consignacaoCOR: TStringField
      FieldName = 'COR'
      Size = 30
    end
    object Q_consignacaoTAMANHO: TStringField
      FieldName = 'TAMANHO'
    end
    object Q_consignacaoLOGUSU: TStringField
      FieldName = 'LOGUSU'
      Size = 10
    end
    object Q_consignacaoNOM_CLIENTE: TStringField
      FieldName = 'NOM_CLIENTE'
      Size = 60
    end
    object Q_consignacaoNUMDOC: TIntegerField
      FieldName = 'NUMDOC'
    end
    object Q_consignacaoCOD_FOP: TIntegerField
      FieldName = 'COD_FOP'
    end
    object Q_consignacaoNOM_FOP: TStringField
      FieldName = 'NOM_FOP'
      Size = 30
    end
    object Q_consignacaoDTADOC: TDateField
      FieldName = 'DTADOC'
    end
    object Q_consignacaoDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Size = 8
    end
    object Q_consignacaoTOT_LIQUIDO: TBCDField
      FieldName = 'TOT_LIQUIDO'
      Size = 8
    end
    object Q_consignacaoQTD_DEVOLVIDA: TBCDField
      FieldName = 'QTD_DEVOLVIDA'
      Size = 8
    end
    object Q_consignacaoDTA_VENCIMENTO_CONSIG: TDateField
      FieldName = 'DTA_VENCIMENTO_CONSIG'
    end
  end
  object ds_consignacao: TDataSource
    DataSet = Q_consignacao
    Left = 176
    Top = 552
  end
  object q_vendas2: TIBOQuery
    Params = <>
    
    DatabaseName = ':c:\orbi\dados\orbi.fdb'
    Connection = dao.CN
    RecordCountAccurate = True
    SQL.Strings = (
      
        'SELECT V2.COD_PRODUTO, v2.COD_CLIENTE, ID_COR, ID_TAMANHO, QTD, ' +
        'PRECO, SUB_TOTAL, p.nom_produto, p.preco_venda, c.cor, '
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
      'order by v2.cod_cliente, v2.dtadoc')
    FieldOptions = []
    Left = 296
    Top = 496
    object q_vendas2COD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
    end
    object q_vendas2COD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object q_vendas2ID_COR: TIntegerField
      FieldName = 'ID_COR'
    end
    object q_vendas2ID_TAMANHO: TIntegerField
      FieldName = 'ID_TAMANHO'
    end
    object q_vendas2QTD: TBCDField
      FieldName = 'QTD'
      Size = 8
    end
    object q_vendas2PRECO: TBCDField
      FieldName = 'PRECO'
      Size = 8
    end
    object q_vendas2NOM_PRODUTO: TStringField
      FieldName = 'NOM_PRODUTO'
      Size = 70
    end
    object q_vendas2COR: TStringField
      FieldName = 'COR'
      Size = 30
    end
    object q_vendas2TAMANHO: TStringField
      FieldName = 'TAMANHO'
    end
    object q_vendas2NOM_CLIENTE: TStringField
      FieldName = 'NOM_CLIENTE'
      Size = 50
    end
    object q_vendas2COD_FOP: TIntegerField
      FieldName = 'COD_FOP'
    end
    object q_vendas2NOM_FOP: TStringField
      FieldName = 'NOM_FOP'
      Size = 30
    end
    object q_vendas2DTADOC: TDateField
      FieldName = 'DTADOC'
    end
    object q_vendas2DESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Size = 8
    end
    object q_vendas2TOT_LIQUIDO: TBCDField
      FieldName = 'TOT_LIQUIDO'
      Size = 8
    end
    object q_vendas2NUMDOC: TIntegerField
      FieldName = 'NUMDOC'
    end
    object q_vendas2SUB_TOTAL: TBCDField
      FieldName = 'SUB_TOTAL'
      Size = 8
    end
    object q_vendas2PRAZO_PGTO: TStringField
      FieldName = 'PRAZO_PGTO'
      Size = 28
    end
    object q_vendas2QTD_PARCELAS: TStringField
      FieldName = 'QTD_PARCELAS'
      Size = 1
    end
    object q_vendas2PRECO_VENDA: TBCDField
      FieldName = 'PRECO_VENDA'
      Size = 8
    end
    object q_vendas2TOT_BRUTO: TBCDField
      FieldName = 'TOT_BRUTO'
      Size = 8
    end
    object q_vendas2CREDITO_USADO: TBCDField
      FieldName = 'CREDITO_USADO'
      Size = 8
    end
    object q_vendas2TELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 13
    end
    object q_vendas2NOM_REPRESENTANTE: TStringField
      FieldName = 'NOM_REPRESENTANTE'
      Size = 50
    end
    object q_vendas2EMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object q_vendas2NOM_MARCA: TStringField
      FieldName = 'NOM_MARCA'
      Size = 40
    end
    object q_vendas2DESCONTO_ITEM: TBCDField
      FieldName = 'DESCONTO_ITEM'
      Precision = 18
      Size = 2
    end
    object q_vendas2PRECO_BRUTO: TBCDField
      FieldName = 'PRECO_BRUTO'
      Precision = 18
      Size = 2
    end
    object q_vendas2FORNECEDOR_PRINCIPAL: TIntegerField
      FieldName = 'FORNECEDOR_PRINCIPAL'
    end
    object q_vendas2FANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 50
    end
    object q_vendas2NOM_EMPRESA: TStringField
      FieldName = 'NOM_EMPRESA'
      Size = 50
    end
  end
  object ds_vendas2: TDataSource
    DataSet = q_vendas2
    Left = 296
    Top = 550
  end
  object dst_vendas2: TfrxDBDataset
    UserName = 'dst_vendas2'
    CloseDataSource = True
    FieldAliases.Strings = (
      'COD_PRODUTO=COD_PRODUTO'
      'COD_CLIENTE=COD_CLIENTE'
      'ID_COR=ID_COR'
      'ID_TAMANHO=ID_TAMANHO'
      'QTD=QTD'
      'PRECO=PRECO'
      'NOM_PRODUTO=NOM_PRODUTO'
      'COR=COR'
      'TAMANHO=TAMANHO'
      'NOM_CLIENTE=NOM_CLIENTE'
      'COD_FOP=COD_FOP'
      'NOM_FOP=NOM_FOP'
      'DTADOC=DTADOC'
      'DESCONTO=DESCONTO'
      'TOT_LIQUIDO=TOT_LIQUIDO'
      'NUMDOC=NUMDOC'
      'SUB_TOTAL=SUB_TOTAL'
      'PRAZO_PGTO=PRAZO_PGTO'
      'QTD_PARCELAS=QTD_PARCELAS'
      'PRECO_VENDA=PRECO_VENDA'
      'TOT_BRUTO=TOT_BRUTO'
      'CREDITO_USADO=CREDITO_USADO'
      'TELEFONE=TELEFONE'
      'NOM_REPRESENTANTE=NOM_REPRESENTANTE'
      'EMAIL=EMAIL'
      'NOM_MARCA=NOM_MARCA'
      'DESCONTO_ITEM=DESCONTO_ITEM'
      'PRECO_BRUTO=PRECO_BRUTO'
      'FORNECEDOR_PRINCIPAL=FORNECEDOR_PRINCIPAL'
      'FANTASIA=FANTASIA'
      'NOM_EMPRESA=NOM_EMPRESA')
    DataSet = q_vendas2
    Left = 296
    Top = 608
  end
  object dst_consignacao: TfrxDBDataset
    UserName = 'dst_consignacao'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_PRODUTO=COD_PRODUTO'
      'COD_CLIENTE=COD_CLIENTE'
      'ID_COR=ID_COR'
      'ID_TAMANHO=ID_TAMANHO'
      'QTD=QTD'
      'PRECO=PRECO'
      'SUB_TOTAL=SUB_TOTAL'
      'NOM_PRODUTO=NOM_PRODUTO'
      'COR=COR'
      'TAMANHO=TAMANHO'
      'LOGUSU=LOGUSU'
      'NOM_CLIENTE=NOM_CLIENTE'
      'NUMDOC=NUMDOC'
      'COD_FOP=COD_FOP'
      'NOM_FOP=NOM_FOP'
      'DTADOC=DTADOC'
      'DESCONTO=DESCONTO'
      'TOT_LIQUIDO=TOT_LIQUIDO'
      'QTD_DEVOLVIDA=QTD_DEVOLVIDA'
      'DTA_VENCIMENTO_CONSIG=DTA_VENCIMENTO_CONSIG')
    OpenDataSource = False
    DataSet = Q_consignacao
    Left = 176
    Top = 608
  end
  object q_cheques: TIBOQuery
    Params = <>
    Active = True
    DatabaseName = ':c:\orbi\dados\orbi.fdb'
    Connection = dao.CN
    RecordCountAccurate = True
    DataSource = DS_NF
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
    FieldOptions = []
    Left = 456
    Top = 496
    object q_chequesNR_CHEQUE: TStringField
      FieldName = 'NR_CHEQUE'
      Origin = 'CHEQUE_TERCEIROS.NR_CHEQUE'
    end
    object q_chequesNR_BANCO: TStringField
      FieldName = 'NR_BANCO'
      Origin = 'CHEQUE_TERCEIROS.NR_BANCO'
      Size = 4
    end
    object q_chequesNR_AGENCIA: TStringField
      FieldName = 'NR_AGENCIA'
      Origin = 'CHEQUE_TERCEIROS.NR_AGENCIA'
      Size = 10
    end
    object q_chequesNR_CONTA_CORRENTE: TStringField
      FieldName = 'NR_CONTA_CORRENTE'
      Origin = 'CHEQUE_TERCEIROS.NR_CONTA_CORRENTE'
    end
    object q_chequesDTA_EMISSAO: TDateField
      FieldName = 'DTA_EMISSAO'
      Origin = 'CHEQUE_TERCEIROS.DTA_EMISSAO'
    end
    object q_chequesDTA_VENCIMENTO: TDateField
      FieldName = 'DTA_VENCIMENTO'
      Origin = 'CHEQUE_TERCEIROS.DTA_VENCIMENTO'
    end
    object q_chequesNOM_TITULAR: TStringField
      FieldName = 'NOM_TITULAR'
      Origin = 'CHEQUE_TERCEIROS.NOM_TITULAR'
      Size = 50
    end
    object q_chequesVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'CHEQUE_TERCEIROS.VALOR'
      Precision = 18
      Size = 2
    end
    object q_chequesTITULO_CR1: TIntegerField
      FieldName = 'TITULO_CR1'
      Origin = 'CHEQUE_TERCEIROS.TITULO_CR1'
    end
    object q_chequesTITULO_CP1: TIntegerField
      FieldName = 'TITULO_CP1'
      Origin = 'CHEQUE_TERCEIROS.TITULO_CP1'
    end
    object q_chequesOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'CHEQUE_TERCEIROS.OBSERVACAO'
      BlobType = ftMemo
      Size = 8
    end
  end
  object ds_cheques: TDataSource
    DataSet = q_cheques
    Left = 456
    Top = 552
  end
  object dst_cheque: TfrxDBDataset
    UserName = 'dst_cheque'
    CloseDataSource = False
    FieldAliases.Strings = (
      'NR_CHEQUE=NR_CHEQUE'
      'NR_BANCO=NR_BANCO'
      'NR_AGENCIA=NR_AGENCIA'
      'NR_CONTA_CORRENTE=NR_CONTA_CORRENTE'
      'DTA_EMISSAO=DTA_EMISSAO'
      'DTA_VENCIMENTO=DTA_VENCIMENTO'
      'NOM_TITULAR=NOM_TITULAR'
      'VALOR=VALOR'
      'TITULO_CR1=TITULO_CR1'
      'TITULO_CP1=TITULO_CP1'
      'OBSERVACAO=OBSERVACAO')
    DataSet = q_cheques
    Left = 456
    Top = 608
  end
  object Q_controle_fretes: TIBOQuery
    Params = <>
    Active = True
    ColumnAttributes.Strings = (
      'VE1.NUMDOC=REQUIRED')
    DatabaseName = ':c:\orbi\dados\orbi.fdb'
    Connection = dao.CN
    RecordCountAccurate = True
    DataSource = DS_NF
    SQL.Strings = (
      
        'select ve1.numdoc,ve1.nf, ve1.dta_emissao, cli.nom_cliente, ve1.' +
        'tot_liquido, tra.nome ,'
      
        'cid.nom_cidade,cid.uf, ve1.vl_frete, ve1.contato_frete, fop.nom_' +
        'fop,pz.prazo from vendas1 ve1'
      'left join cliente cli on ve1.cod_cliente=cli.cod_cliente'
      
        'left join transportadora tra on ve1.cod_transportadora=tra.cod_t' +
        'ransportadora'
      'left join cidades cid on cli.cod_cidade=cid.cod_cidade'
      'left join fop fp on ve1.cod_fop=fp.cod_fop'
      'left join prazo pz on pz.id=ve1.cod_prazo_pgto'
      'order by cli.nom_cliente')
    FieldOptions = []
    Left = 576
    Top = 496
    object Q_controle_fretesNUMDOC: TIntegerField
      FieldName = 'NUMDOC'
      Origin = 'VENDAS1.NUMDOC'
      Required = True
    end
    object Q_controle_fretesNF: TStringField
      FieldName = 'NF'
      Origin = 'VENDAS1.NF'
      Size = 8
    end
    object Q_controle_fretesDTA_EMISSAO: TDateField
      FieldName = 'DTA_EMISSAO'
      Origin = 'VENDAS1.DTA_EMISSAO'
    end
    object Q_controle_fretesNOM_CLIENTE: TStringField
      FieldName = 'NOM_CLIENTE'
      Origin = 'CLIENTE.NOM_CLIENTE'
      Size = 60
    end
    object Q_controle_fretesTOT_LIQUIDO: TBCDField
      FieldName = 'TOT_LIQUIDO'
      Origin = 'VENDAS1.TOT_LIQUIDO'
      Precision = 18
      Size = 2
    end
    object Q_controle_fretesNOME: TStringField
      FieldName = 'NOME'
      Origin = 'TRANSPORTADORA.NOME'
      Size = 50
    end
    object Q_controle_fretesNOM_CIDADE: TStringField
      FieldName = 'NOM_CIDADE'
      Origin = 'CIDADES.NOM_CIDADE'
      Size = 40
    end
    object Q_controle_fretesUF: TStringField
      FieldName = 'UF'
      Origin = 'CIDADES.UF'
      Size = 2
    end
    object Q_controle_fretesVL_FRETE: TBCDField
      FieldName = 'VL_FRETE'
      Origin = 'VENDAS1.VL_FRETE'
      Precision = 18
      Size = 2
    end
    object Q_controle_fretesCONTATO_FRETE: TStringField
      FieldName = 'CONTATO_FRETE'
      Origin = 'VENDAS1.CONTATO_FRETE'
      Size = 30
    end
    object Q_controle_fretesNOM_FOP: TStringField
      FieldName = 'NOM_FOP'
      Origin = 'FOP.NOM_FOP'
      Size = 30
    end
    object Q_controle_fretesPRAZO: TStringField
      FieldName = 'PRAZO'
      Origin = 'PRAZO.PRAZO'
    end
  end
  object ds_controle_fretes: TDataSource
    DataSet = Q_controle_fretes
    Left = 576
    Top = 552
  end
  object dst_controle_fretes: TfrxDBDataset
    UserName = 'dst_controle_fretes'
    CloseDataSource = False
    FieldAliases.Strings = (
      'NUMDOC=NUMDOC'
      'NF=NF'
      'DTA_EMISSAO=DTA_EMISSAO'
      'NOM_CLIENTE=NOM_CLIENTE'
      'TOT_LIQUIDO=TOT_LIQUIDO'
      'NOME=NOME'
      'NOM_CIDADE=NOM_CIDADE'
      'UF=UF'
      'VL_FRETE=VL_FRETE'
      'CONTATO_FRETE=CONTATO_FRETE'
      'NOM_FOP=NOM_FOP'
      'PRAZO=PRAZO')
    DataSet = Q_controle_fretes
    Left = 576
    Top = 608
  end
  object q_entradas: TIBOQuery
    Params = <>
    DatabaseName = ':c:\orbi\dados\orbi.fdb'
    Connection = dao.CN
    KeyLinks.Strings = (
      'entrada1.nr_documento'
      'entrada1.cod_fornecedor')
    RecordCountAccurate = True
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
    FieldOptions = []
    Left = 376
    Top = 320
    object q_entradasNR_DOCUMENTO: TIntegerField
      FieldName = 'NR_DOCUMENTO'
    end
    object q_entradasCOD_FORNECEDOR: TIntegerField
      FieldName = 'COD_FORNECEDOR'
    end
    object q_entradasCOD_FISCAL: TStringField
      FieldName = 'COD_FISCAL'
      Size = 5
    end
    object q_entradasTOT_ITENS: TBCDField
      FieldName = 'TOT_ITENS'
      Size = 2
    end
    object q_entradasVL_TOTAL: TBCDField
      FieldName = 'VL_TOTAL'
      Size = 2
    end
    object q_entradasCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
    end
    object q_entradasCUSTO: TBCDField
      FieldName = 'CUSTO'
      Size = 2
    end
    object q_entradasQTD_ENTRADA: TBCDField
      FieldName = 'QTD_ENTRADA'
      Size = 2
    end
    object q_entradasID_COR: TIntegerField
      FieldName = 'ID_COR'
    end
    object q_entradasID_TAMANHO: TIntegerField
      FieldName = 'ID_TAMANHO'
    end
    object q_entradasCOD_COLECAO: TIntegerField
      FieldName = 'COD_COLECAO'
    end
    object q_entradasRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 50
    end
    object q_entradasNOM_PRODUTO: TStringField
      FieldName = 'NOM_PRODUTO'
      Size = 70
    end
    object q_entradasREF_FABRICA: TStringField
      FieldName = 'REF_FABRICA'
      Size = 15
    end
    object q_entradasCOR: TStringField
      FieldName = 'COR'
      Size = 30
    end
    object q_entradasTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 25
    end
    object q_entradasNOM_COLECAO: TStringField
      FieldName = 'NOM_COLECAO'
      Size = 50
    end
    object q_entradasNOM_MARCA: TStringField
      FieldName = 'NOM_MARCA'
      Size = 40
    end
    object q_entradasSUB_TOTAL: TBCDField
      FieldName = 'SUB_TOTAL'
      Size = 2
    end
    object q_entradasDTA_DOCUMENTO: TDateField
      FieldName = 'DTA_DOCUMENTO'
    end
    object strngfld_entradasFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 50
    end
    object intgrfld_entradasEMPRESA_DESTINO: TIntegerField
      FieldName = 'EMPRESA_DESTINO'
    end
    object strngfld_entradasNOM_EMPRESA: TStringField
      FieldName = 'NOM_EMPRESA'
      Size = 50
    end
    object strngfld_entradasFANTASIA_PRODUTO: TStringField
      FieldName = 'FANTASIA_PRODUTO'
      Size = 50
    end
    object bcdfld_entradasCUSTO_PRODUTO: TBCDField
      FieldName = 'CUSTO_PRODUTO'
      Size = 2
    end
  end
  object ds_entradas: TDataSource
    DataSet = q_entradas
    Left = 376
    Top = 376
  end
  object dst_entradas: TfrxDBDataset
    UserName = 'dst_entradas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'NR_DOCUMENTO=NR_DOCUMENTO'
      'COD_FORNECEDOR=COD_FORNECEDOR'
      'COD_FISCAL=COD_FISCAL'
      'TOT_ITENS=TOT_ITENS'
      'VL_TOTAL=VL_TOTAL'
      'COD_PRODUTO=COD_PRODUTO'
      'CUSTO=CUSTO'
      'QTD_ENTRADA=QTD_ENTRADA'
      'ID_COR=ID_COR'
      'ID_TAMANHO=ID_TAMANHO'
      'COD_COLECAO=COD_COLECAO'
      'RAZAO_SOCIAL=RAZAO_SOCIAL'
      'NOM_PRODUTO=NOM_PRODUTO'
      'REF_FABRICA=REF_FABRICA'
      'COR=COR'
      'TAMANHO=TAMANHO'
      'NOM_COLECAO=NOM_COLECAO'
      'NOM_MARCA=NOM_MARCA'
      'SUB_TOTAL=SUB_TOTAL'
      'DTA_DOCUMENTO=DTA_DOCUMENTO'
      'FANTASIA=FANTASIA'
      'EMPRESA_DESTINO=EMPRESA_DESTINO'
      'NOM_EMPRESA=NOM_EMPRESA'
      'FANTASIA_PRODUTO=FANTASIA_PRODUTO'
      'CUSTO_PRODUTO=CUSTO_PRODUTO')
    DataSet = q_entradas
    Left = 376
    Top = 432
  end
  object q_pedidos: TIBOQuery
    Params = <>
    DatabaseName = ':c:\orbi\dados\orbi.fdb'
    Connection = dao.CN
    RecordCountAccurate = True
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
    FieldOptions = []
    Left = 512
    Top = 320
    object q_pedidosNR_DOCUMENTO: TIntegerField
      FieldName = 'NR_DOCUMENTO'
      Required = True
    end
    object q_pedidosCOD_FORNECEDOR: TIntegerField
      FieldName = 'COD_FORNECEDOR'
      Required = True
    end
    object q_pedidosDTA_PEDIDO: TDateField
      FieldName = 'DTA_PEDIDO'
    end
    object q_pedidosCOD_COLECAO: TIntegerField
      FieldName = 'COD_COLECAO'
    end
    object q_pedidosNR_PEDIDO_FORNECEDOR: TIntegerField
      FieldName = 'NR_PEDIDO_FORNECEDOR'
    end
    object q_pedidosPRAZO_MAXIMO: TIntegerField
      FieldName = 'PRAZO_MAXIMO'
    end
    object q_pedidosPREVISAO_ENTREGA: TDateField
      FieldName = 'PREVISAO_ENTREGA'
    end
    object q_pedidosTIPO_PEDIDO: TStringField
      FieldName = 'TIPO_PEDIDO'
      Size = 6
    end
    object q_pedidosFINALIZADO: TStringField
      FieldName = 'FINALIZADO'
      Size = 1
    end
    object q_pedidosOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 8
    end
    object q_pedidosNOM_PRODUTO: TStringField
      FieldName = 'NOM_PRODUTO'
      Size = 50
    end
    object q_pedidosREF_FABRICA: TStringField
      FieldName = 'REF_FABRICA'
      Size = 15
    end
    object q_pedidosUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 3
    end
    object q_pedidosQTD_EMBALAGEM: TBCDField
      FieldName = 'QTD_EMBALAGEM'
      Precision = 18
      Size = 2
    end
    object q_pedidosQTD: TBCDField
      FieldName = 'QTD'
      Precision = 18
      Size = 2
    end
    object q_pedidosCOR: TStringField
      FieldName = 'COR'
    end
    object q_pedidosTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 15
    end
    object q_pedidosCUSTO_BRUTO: TBCDField
      FieldName = 'CUSTO_BRUTO'
      Precision = 18
      Size = 2
    end
    object q_pedidosDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Precision = 18
      Size = 2
    end
    object q_pedidosCUSTO_LIQUIDO: TBCDField
      FieldName = 'CUSTO_LIQUIDO'
      Precision = 18
      Size = 2
    end
    object q_pedidosMARCKUP: TBCDField
      FieldName = 'MARCKUP'
      Precision = 18
      Size = 2
    end
    object q_pedidosPRECO_VENDA: TBCDField
      FieldName = 'PRECO_VENDA'
      Precision = 18
      Size = 2
    end
    object q_pedidosID: TIntegerField
      FieldName = 'ID'
    end
    object q_pedidosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object q_pedidosCOD_FORNECEDOR_1: TIntegerField
      FieldName = 'COD_FORNECEDOR_1'
    end
    object q_pedidosFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 50
    end
    object q_pedidosRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 50
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
      'NR_DOCUMENTO=NR_DOCUMENTO'
      'COD_FORNECEDOR=COD_FORNECEDOR'
      'DTA_PEDIDO=DTA_PEDIDO'
      'COD_COLECAO=COD_COLECAO'
      'NR_PEDIDO_FORNECEDOR=NR_PEDIDO_FORNECEDOR'
      'PRAZO_MAXIMO=PRAZO_MAXIMO'
      'PREVISAO_ENTREGA=PREVISAO_ENTREGA'
      'TIPO_PEDIDO=TIPO_PEDIDO'
      'FINALIZADO=FINALIZADO'
      'OBS=OBS'
      'NOM_PRODUTO=NOM_PRODUTO'
      'REF_FABRICA=REF_FABRICA'
      'UNIDADE=UNIDADE'
      'QTD_EMBALAGEM=QTD_EMBALAGEM'
      'QTD=QTD'
      'COR=COR'
      'TAMANHO=TAMANHO'
      'CUSTO_BRUTO=CUSTO_BRUTO'
      'DESCONTO=DESCONTO'
      'CUSTO_LIQUIDO=CUSTO_LIQUIDO'
      'MARCKUP=MARCKUP'
      'PRECO_VENDA=PRECO_VENDA'
      'ID=ID'
      'DESCRICAO=DESCRICAO'
      'COD_FORNECEDOR_1=COD_FORNECEDOR_1'
      'FANTASIA=FANTASIA'
      'RAZAO_SOCIAL=RAZAO_SOCIAL')
    DataSet = q_pedidos
    Left = 512
    Top = 432
  end
  object q_cliente: TIBOQuery
    Params = <>
    DatabaseName = ':c:\orbi\dados\orbi.fdb'
    Connection = dao.CN
    RecordCountAccurate = True
    SQL.Strings = (
      
        'select c.cod_cidade, c.cod_empresa, c.nom_cliente, c.cod_cliente' +
        ',c.endereco, c.cod_cidade, c.bairro, c.cep, c.telefone,'
      
        'c.email, c.dta_aniversario, e.nom_empresa, cd.nom_cidade, cd.uf ' +
        'from cliente c '
      'left join cidades cd on cd.cod_cidade = c.cod_cidade '
      'left join empresa e on e.cod_empresa = c.cod_empresa ')
    FieldOptions = []
    Left = 24
    Top = 8
    object q_clienteCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
    end
    object q_clienteCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
    end
    object q_clienteNOM_CLIENTE: TStringField
      FieldName = 'NOM_CLIENTE'
      Size = 60
    end
    object q_clienteCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object q_clienteENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object q_clienteCOD_CIDADE_1: TIntegerField
      FieldName = 'COD_CIDADE_1'
    end
    object q_clienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object q_clienteCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object q_clienteTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 13
    end
    object q_clienteEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object q_clienteDTA_ANIVERSARIO: TStringField
      FieldName = 'DTA_ANIVERSARIO'
      Size = 7
    end
    object q_clienteNOM_EMPRESA: TStringField
      FieldName = 'NOM_EMPRESA'
      Size = 50
    end
    object q_clienteNOM_CIDADE: TStringField
      FieldName = 'NOM_CIDADE'
      Size = 40
    end
    object q_clienteUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = q_cliente
    Left = 24
    Top = 64
  end
  object dst_cliente: TfrxDBDataset
    UserName = 'dst_cliente'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_CIDADE=COD_CIDADE'
      'COD_EMPRESA=COD_EMPRESA'
      'NOM_CLIENTE=NOM_CLIENTE'
      'COD_CLIENTE=COD_CLIENTE'
      'ENDERECO=ENDERECO'
      'COD_CIDADE_1=COD_CIDADE_1'
      'BAIRRO=BAIRRO'
      'CEP=CEP'
      'TELEFONE=TELEFONE'
      'EMAIL=EMAIL'
      'DTA_ANIVERSARIO=DTA_ANIVERSARIO'
      'NOM_EMPRESA=NOM_EMPRESA'
      'NOM_CIDADE=NOM_CIDADE'
      'UF=UF')
    DataSet = q_cliente
    Left = 24
    Top = 120
  end
  object q_pauta_venda: TIBOQuery
    Params = <>
    ColumnAttributes.Strings = (
      'P.COD_PRODUTO=REQUIRED'
      'P.NOM_PRODUTO=REQUIRED')
    DatabaseName = ':c:\orbi\dados\orbi.fdb'
    Connection = dao.CN
    RecordCountAccurate = True
    SQL.Strings = (
      
        'select cod_produto, nom_produto, unidade, qtd_embalagem, preco_v' +
        'enda, g.nom_grupo, qtd_estoque from produto p'
      'left join grupo g on g.cod_grupo=p.cod_grupo ')
    FieldOptions = []
    Left = 112
    Top = 8
    object q_pauta_vendaCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Origin = 'PRODUTO.COD_PRODUTO'
      Required = True
    end
    object q_pauta_vendaNOM_PRODUTO: TStringField
      FieldName = 'NOM_PRODUTO'
      Origin = 'PRODUTO.NOM_PRODUTO'
      Required = True
      Size = 70
    end
    object q_pauta_vendaUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'PRODUTO.UNIDADE'
      Size = 3
    end
    object q_pauta_vendaQTD_EMBALAGEM: TBCDField
      FieldName = 'QTD_EMBALAGEM'
      Origin = 'PRODUTO.QTD_EMBALAGEM'
      Precision = 18
      Size = 3
    end
    object q_pauta_vendaPRECO_VENDA: TBCDField
      FieldName = 'PRECO_VENDA'
      Origin = 'PRODUTO.PRECO_VENDA'
      Precision = 18
    end
    object q_pauta_vendaNOM_GRUPO: TStringField
      FieldName = 'NOM_GRUPO'
      Origin = 'GRUPO.NOM_GRUPO'
      Size = 60
    end
    object q_pauta_vendaQTD_ESTOQUE: TBCDField
      FieldName = 'QTD_ESTOQUE'
      Precision = 18
      Size = 2
    end
  end
  object ds_pauta_venda: TDataSource
    DataSet = q_pauta_venda
    Left = 112
    Top = 64
  end
  object dst_pauta_venda: TfrxDBDataset
    UserName = 'dst_pauta_venda'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_PRODUTO=COD_PRODUTO'
      'NOM_PRODUTO=NOM_PRODUTO'
      'UNIDADE=UNIDADE'
      'QTD_EMBALAGEM=QTD_EMBALAGEM'
      'PRECO_VENDA=PRECO_VENDA'
      'NOM_GRUPO=NOM_GRUPO'
      'QTD_ESTOQUE=QTD_ESTOQUE')
    DataSet = q_pauta_venda
    Left = 112
    Top = 120
  end
  object q_carga: TIBOQuery
    Params = <>
    DatabaseName = ':c:\orbi\dados\orbi.fdb'
    Connection = dao.CN
    RecordCountAccurate = True
    SQL.Strings = (
      
        'select c2.*, v1.numdoc,v1.dtadoc, cl.nom_cliente, v1.tot_liquido' +
        ', c1.id, c1.dta_carga, c1.nom_carga, c1.tot_peso,'
      
        'c1.tot_carga, c1.tot_frete, v.nom_veiculo, m.nome as nom_motoris' +
        'ta, t.nome as nom_transportadora from carga2 c2'
      'left join carga1 c1 on c1.id=c2.id_carga'
      'left join vendas1 v1 on v1.numdoc=c2.id_pedido'
      'left join cliente cl on cl.cod_cliente=v1.cod_cliente'
      'left join veiculos v on v.id=c1.id_veiculo'
      'left join motorista m on m.id=c1.id_motorista '
      
        'left join transportadora t on t.cod_transportadora=c1.cod_transp' +
        'ortadora'
      '')
    FieldOptions = []
    Left = 632
    Top = 320
    object q_cargaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object q_cargaID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object q_cargaID_CARGA: TIntegerField
      FieldName = 'ID_CARGA'
    end
    object q_cargaNR_CARGA: TStringField
      FieldName = 'NR_CARGA'
      Size = 7
    end
    object q_cargaDTA_CARGA: TDateField
      FieldName = 'DTA_CARGA'
    end
    object q_cargaNUMDOC: TIntegerField
      FieldName = 'NUMDOC'
    end
    object q_cargaDTADOC: TDateField
      FieldName = 'DTADOC'
    end
    object q_cargaNOM_CLIENTE: TStringField
      FieldName = 'NOM_CLIENTE'
      Size = 60
    end
    object q_cargaTOT_LIQUIDO: TBCDField
      FieldName = 'TOT_LIQUIDO'
      Size = 2
    end
    object q_cargaID_1: TIntegerField
      FieldName = 'ID_1'
    end
    object q_cargaDTA_CARGA_1: TDateField
      FieldName = 'DTA_CARGA_1'
    end
    object q_cargaNOM_CARGA: TStringField
      FieldName = 'NOM_CARGA'
      Size = 50
    end
    object q_cargaNOM_VEICULO: TStringField
      FieldName = 'NOM_VEICULO'
      Size = 50
    end
    object q_cargaNOM_MOTORISTA: TStringField
      FieldName = 'NOM_MOTORISTA'
      Size = 50
    end
    object q_cargaNOM_TRANSPORTADORA: TStringField
      FieldName = 'NOM_TRANSPORTADORA'
      Size = 50
    end
    object q_cargaTOT_PESO: TBCDField
      FieldName = 'TOT_PESO'
      Size = 2
    end
    object q_cargaTOT_CARGA: TBCDField
      FieldName = 'TOT_CARGA'
      Size = 2
    end
    object q_cargaTOT_FRETE: TBCDField
      FieldName = 'TOT_FRETE'
      Size = 2
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
      'ID=ID'
      'ID_PEDIDO=ID_PEDIDO'
      'ID_CARGA=ID_CARGA'
      'NR_CARGA=NR_CARGA'
      'DTA_CARGA=DTA_CARGA'
      'NUMDOC=NUMDOC'
      'DTADOC=DTADOC'
      'NOM_CLIENTE=NOM_CLIENTE'
      'TOT_LIQUIDO=TOT_LIQUIDO'
      'ID_1=ID_1'
      'DTA_CARGA_1=DTA_CARGA_1'
      'NOM_CARGA=NOM_CARGA'
      'NOM_VEICULO=NOM_VEICULO'
      'NOM_MOTORISTA=NOM_MOTORISTA'
      'NOM_TRANSPORTADORA=NOM_TRANSPORTADORA'
      'TOT_PESO=TOT_PESO'
      'TOT_CARGA=TOT_CARGA'
      'TOT_FRETE=TOT_FRETE')
    DataSet = q_carga
    Left = 632
    Top = 432
  end
  object Q_transferencias: TIBOQuery
    Params = <>
    DatabaseName = ':c:\orbi\dados\orbi.fdb'
    Connection = dao.CN
    KeyLinks.Strings = (
      'entrada1.nr_documento'
      'entrada1.cod_fornecedor')
    RecordCountAccurate = True
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
    FieldOptions = []
    Left = 728
    Top = 320
    object intgrfld1: TIntegerField
      FieldName = 'NR_DOCUMENTO'
    end
    object intgrfld2: TIntegerField
      FieldName = 'COD_FORNECEDOR'
    end
    object strngfld1: TStringField
      FieldName = 'COD_FISCAL'
      Size = 5
    end
    object bcdfld1: TBCDField
      FieldName = 'TOT_ITENS'
      Size = 2
    end
    object bcdfld2: TBCDField
      FieldName = 'VL_TOTAL'
      Size = 2
    end
    object intgrfld3: TIntegerField
      FieldName = 'COD_PRODUTO'
    end
    object bcdfld3: TBCDField
      FieldName = 'CUSTO'
      Size = 2
    end
    object bcdfld4: TBCDField
      FieldName = 'QTD_ENTRADA'
      Size = 2
    end
    object intgrfld4: TIntegerField
      FieldName = 'ID_COR'
    end
    object intgrfld5: TIntegerField
      FieldName = 'ID_TAMANHO'
    end
    object intgrfld6: TIntegerField
      FieldName = 'COD_COLECAO'
    end
    object strngfld2: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 50
    end
    object strngfld3: TStringField
      FieldName = 'NOM_PRODUTO'
      Size = 70
    end
    object strngfld4: TStringField
      FieldName = 'REF_FABRICA'
      Size = 15
    end
    object strngfld5: TStringField
      FieldName = 'COR'
      Size = 30
    end
    object strngfld6: TStringField
      FieldName = 'TAMANHO'
      Size = 25
    end
    object strngfld7: TStringField
      FieldName = 'NOM_COLECAO'
      Size = 50
    end
    object strngfld8: TStringField
      FieldName = 'NOM_MARCA'
      Size = 40
    end
    object bcdfld5: TBCDField
      FieldName = 'SUB_TOTAL'
      Size = 2
    end
    object dtfld1: TDateField
      FieldName = 'DTA_DOCUMENTO'
    end
    object strngfld9: TStringField
      FieldName = 'FANTASIA'
      Size = 50
    end
    object intgrfld7: TIntegerField
      FieldName = 'EMPRESA_DESTINO'
    end
    object strngfld10: TStringField
      FieldName = 'NOM_EMPRESA'
      Size = 50
    end
    object strngfld11: TStringField
      FieldName = 'FANTASIA_PRODUTO'
      Size = 50
    end
  end
  object ds_transferencias: TDataSource
    DataSet = Q_transferencias
    Left = 728
    Top = 376
  end
  object frxdbdtst1: TfrxDBDataset
    UserName = 'dst_entradas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'NR_DOCUMENTO=NR_DOCUMENTO'
      'COD_FORNECEDOR=COD_FORNECEDOR'
      'COD_FISCAL=COD_FISCAL'
      'TOT_ITENS=TOT_ITENS'
      'VL_TOTAL=VL_TOTAL'
      'COD_PRODUTO=COD_PRODUTO'
      'CUSTO=CUSTO'
      'QTD_ENTRADA=QTD_ENTRADA'
      'ID_COR=ID_COR'
      'ID_TAMANHO=ID_TAMANHO'
      'COD_COLECAO=COD_COLECAO'
      'RAZAO_SOCIAL=RAZAO_SOCIAL'
      'NOM_PRODUTO=NOM_PRODUTO'
      'REF_FABRICA=REF_FABRICA'
      'COR=COR'
      'TAMANHO=TAMANHO'
      'NOM_COLECAO=NOM_COLECAO'
      'NOM_MARCA=NOM_MARCA'
      'SUB_TOTAL=SUB_TOTAL'
      'DTA_DOCUMENTO=DTA_DOCUMENTO'
      'FANTASIA=FANTASIA'
      'EMPRESA_DESTINO=EMPRESA_DESTINO'
      'NOM_EMPRESA=NOM_EMPRESA'
      'FANTASIA_PRODUTO=FANTASIA_PRODUTO')
    DataSet = Q_transferencias
    Left = 728
    Top = 432
  end
  object q_cheques_emitidos: TIBOQuery
    Params = <>
    DatabaseName = ':c:\orbi\dados\orbi.fdb'
    Connection = dao.CN
    KeyLinks.Strings = (
      'CHEQUES.ID')
    RecordCountAccurate = True
    DataSource = DS_NF
    SQL.Strings = (
      'select ch.*, cr.nom_conta from cheques ch'
      'left join conta_corrente cr on cr.id=ch.cod_conta_corrente')
    FieldOptions = []
    Left = 832
    Top = 322
    object q_cheques_emitidosID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object q_cheques_emitidosCOD_CONTA_CORRENTE: TIntegerField
      FieldName = 'COD_CONTA_CORRENTE'
    end
    object q_cheques_emitidosNR_CHEQUE: TStringField
      FieldName = 'NR_CHEQUE'
    end
    object q_cheques_emitidosDTA_EMISSAO: TDateField
      FieldName = 'DTA_EMISSAO'
    end
    object q_cheques_emitidosDTA_VENCIMENTO: TDateField
      FieldName = 'DTA_VENCIMENTO'
    end
    object q_cheques_emitidosVALOR: TBCDField
      FieldName = 'VALOR'
      Size = 2
    end
    object q_cheques_emitidosNOMINAL: TStringField
      FieldName = 'NOMINAL'
      Size = 50
    end
    object q_cheques_emitidosHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 60
    end
    object q_cheques_emitidosQUITADO: TStringField
      FieldName = 'QUITADO'
      Size = 1
    end
    object q_cheques_emitidosNOM_CONTA: TStringField
      FieldName = 'NOM_CONTA'
      Size = 30
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
      'ID=ID'
      'COD_CONTA_CORRENTE=COD_CONTA_CORRENTE'
      'NR_CHEQUE=NR_CHEQUE'
      'DTA_EMISSAO=DTA_EMISSAO'
      'DTA_VENCIMENTO=DTA_VENCIMENTO'
      'VALOR=VALOR'
      'NOMINAL=NOMINAL'
      'HISTORICO=HISTORICO'
      'QUITADO=QUITADO'
      'NOM_CONTA=NOM_CONTA')
    DataSet = q_cheques_emitidos
    Left = 832
    Top = 434
  end
  object q_contas_receber: TIBOQuery
    Params = <>
    ColumnAttributes.Strings = (
      'P.COD_PRODUTO=REQUIRED'
      'P.NOM_PRODUTO=REQUIRED')
    DatabaseName = ':c:\orbi\dados\orbi.fdb'
    Connection = dao.CN
    RecordCountAccurate = True
    SQL.Strings = (
      'select dtaven, dtarec, titulo, sequencia,valor, valor_recebido,'
      
        'c.nom_cliente, c.telefone, fp.nom_fop, e.nom_empresa, r.nom_repr' +
        'esentante from cr1 cr1'
      'left join cliente c on c.cod_cliente=cr1.cod_cliente'
      'left join fop fp on fp.cod_fop=cr1.cod_fop'
      'left join empresa e on e.cod_empresa=cr1.cod_empresa'
      'left join representante r on r.id=cr1.id_representante'
      ''
      ' ')
    FieldOptions = []
    Left = 936
    Top = 320
    object dtfld_contas_receberDTAVEN: TDateField
      FieldName = 'DTAVEN'
    end
    object dtfld_contas_receberDTAREC: TDateField
      FieldName = 'DTAREC'
    end
    object strngfld_contas_receberTITULO: TStringField
      FieldName = 'TITULO'
      Size = 6
    end
    object intgrfld_contas_receberSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
    end
    object bcdfld_contas_receberVALOR: TBCDField
      FieldName = 'VALOR'
      Precision = 18
      Size = 2
    end
    object bcdfld_contas_receberVALOR_RECEBIDO: TBCDField
      FieldName = 'VALOR_RECEBIDO'
      Precision = 18
      Size = 2
    end
    object strngfld_contas_receberNOM_CLIENTE: TStringField
      FieldName = 'NOM_CLIENTE'
      Size = 60
    end
    object strngfld_contas_receberTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 13
    end
    object strngfld_contas_receberNOM_FOP: TStringField
      FieldName = 'NOM_FOP'
      Size = 30
    end
    object q_contas_receberNOM_EMPRESA: TStringField
      FieldName = 'NOM_EMPRESA'
      Size = 50
    end
    object q_contas_receberNOM_REPRESENTANTE: TStringField
      FieldName = 'NOM_REPRESENTANTE'
      Size = 50
    end
  end
  object ds_contas_receber: TDataSource
    DataSet = q_contas_receber
    Left = 936
    Top = 376
  end
  object dst_contas_receber: TfrxDBDataset
    UserName = 'dst_contas_receber'
    CloseDataSource = False
    FieldAliases.Strings = (
      'DTAVEN=DTAVEN'
      'DTAREC=DTAREC'
      'TITULO=TITULO'
      'SEQUENCIA=SEQUENCIA'
      'VALOR=VALOR'
      'VALOR_RECEBIDO=VALOR_RECEBIDO'
      'NOM_CLIENTE=NOM_CLIENTE'
      'TELEFONE=TELEFONE'
      'NOM_FOP=NOM_FOP'
      'NOM_EMPRESA=NOM_EMPRESA')
    DataSet = q_contas_receber
    Left = 936
    Top = 432
  end
  object q_vendas1: TIBOQuery
    Params = <>
    ColumnAttributes.Strings = (
      'V1.NUMDOC=REQUIRED')
    
    DatabaseName = ':c:\orbi\dados\orbi.fdb'
    Connection = dao.CN
    RecordCountAccurate = True
    SQL.Strings = (
      
        'select numdoc, dtadoc, tot_liquido, c.nom_cliente from vendas1 v' +
        '1'
      'left join cliente c on c.cod_cliente=v1.cod_cliente')
    FieldOptions = []
    Left = 368
    Top = 496
    object q_vendas1NUMDOC: TIntegerField
      FieldName = 'NUMDOC'
      Origin = 'VENDAS1.NUMDOC'
      Required = True
    end
    object q_vendas1DTADOC: TDateField
      FieldName = 'DTADOC'
      Origin = 'VENDAS1.DTADOC'
    end
    object q_vendas1TOT_LIQUIDO: TBCDField
      FieldName = 'TOT_LIQUIDO'
      Origin = 'VENDAS1.TOT_LIQUIDO'
      Precision = 18
      Size = 2
    end
    object q_vendas1NOM_CLIENTE: TStringField
      FieldName = 'NOM_CLIENTE'
      Origin = 'CLIENTE.NOM_CLIENTE'
      Size = 60
    end
  end
  object ds_vendas1: TDataSource
    DataSet = q_vendas1
    Left = 368
    Top = 550
  end
  object dst_vendas1: TfrxDBDataset
    UserName = 'dst_vendas1'
    CloseDataSource = True
    FieldAliases.Strings = (
      'NUMDOC=NUMDOC'
      'DTADOC=DTADOC'
      'TOT_LIQUIDO=TOT_LIQUIDO'
      'NOM_CLIENTE=NOM_CLIENTE')
    DataSet = q_vendas1
    Left = 368
    Top = 608
  end
  object q_comissao_venda: TIBOQuery
    Params = <>
    ColumnAttributes.Strings = (
      'V1.NUMDOC=REQUIRED')
    
    DatabaseName = ':c:\orbi\dados\orbi.fdb'
    Connection = dao.CN
    RecordCountAccurate = True
    SQL.Strings = (
      
        'select numdoc, dtadoc, tot_liquido,vlr_comissao, c.nom_cliente, ' +
        'r.nom_representante, r.fone, r.celular,'
      ' r.nr_conta_corrente, r.nr_agencia, r.nr_banco  from vendas1 v1'
      'left join cliente c on c.cod_cliente=v1.cod_cliente'
      'left join representante r on r.id=v1.cod_representante')
    FieldOptions = []
    Left = 688
    Top = 496
    object IntegerField1: TIntegerField
      FieldName = 'NUMDOC'
      Origin = 'VENDAS1.NUMDOC'
      Required = True
    end
    object DateField1: TDateField
      FieldName = 'DTADOC'
      Origin = 'VENDAS1.DTADOC'
    end
    object BCDField1: TBCDField
      FieldName = 'TOT_LIQUIDO'
      Origin = 'VENDAS1.TOT_LIQUIDO'
      Precision = 18
      Size = 2
    end
    object StringField1: TStringField
      FieldName = 'NOM_CLIENTE'
      Origin = 'CLIENTE.NOM_CLIENTE'
      Size = 60
    end
    object q_comissao_vendaNOM_REPRESENTANTE: TStringField
      FieldName = 'NOM_REPRESENTANTE'
      Size = 50
    end
    object q_comissao_vendaFONE: TStringField
      FieldName = 'FONE'
      Size = 13
    end
    object q_comissao_vendaCELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 13
    end
    object q_comissao_vendaNR_CONTA_CORRENTE: TStringField
      FieldName = 'NR_CONTA_CORRENTE'
    end
    object q_comissao_vendaNR_AGENCIA: TStringField
      FieldName = 'NR_AGENCIA'
      Size = 10
    end
    object q_comissao_vendaNR_BANCO: TStringField
      FieldName = 'NR_BANCO'
      Size = 4
    end
    object q_comissao_vendaVLR_COMISSAO: TBCDField
      FieldName = 'VLR_COMISSAO'
      Precision = 18
      Size = 2
    end
  end
  object ds_comissao_venda: TDataSource
    DataSet = q_comissao_venda
    Left = 688
    Top = 550
  end
  object dst_comissao_venda: TfrxDBDataset
    UserName = 'dst_comissao_venda'
    CloseDataSource = True
    FieldAliases.Strings = (
      'NUMDOC=NUMDOC'
      'DTADOC=DTADOC'
      'TOT_LIQUIDO=TOT_LIQUIDO'
      'NOM_CLIENTE=NOM_CLIENTE'
      'NOM_REPRESENTANTE=NOM_REPRESENTANTE'
      'FONE=FONE'
      'CELULAR=CELULAR'
      'NR_CONTA_CORRENTE=NR_CONTA_CORRENTE'
      'NR_AGENCIA=NR_AGENCIA'
      'NR_BANCO=NR_BANCO'
      'VLR_COMISSAO=VLR_COMISSAO')
    DataSet = q_comissao_venda
    Left = 688
    Top = 608
  end
  object q_contas_pagar: TIBOQuery
    Params = <>
    DatabaseName = ':c:\orbi\dados\orbi.fdb'
    Connection = dao.CN
    RecordCountAccurate = True
    SQL.Strings = (
      'select * from cr1 cr1 '
      
        'left join entrada1 e1 on e1.nr_documento=cr1.nr_documento and e1' +
        '.cod_fornecedor=cr1.cod_fornecedor')
    FieldOptions = []
    Left = 376
    Top = 8
    object IntegerField2: TIntegerField
      FieldName = 'NR_DOCUMENTO'
      Required = True
    end
    object IntegerField3: TIntegerField
      FieldName = 'COD_FORNECEDOR'
      Required = True
    end
    object DateField2: TDateField
      FieldName = 'DTA_PEDIDO'
    end
    object IntegerField4: TIntegerField
      FieldName = 'COD_COLECAO'
    end
    object IntegerField5: TIntegerField
      FieldName = 'NR_PEDIDO_FORNECEDOR'
    end
    object IntegerField6: TIntegerField
      FieldName = 'PRAZO_MAXIMO'
    end
    object DateField3: TDateField
      FieldName = 'PREVISAO_ENTREGA'
    end
    object StringField2: TStringField
      FieldName = 'TIPO_PEDIDO'
      Size = 6
    end
    object StringField3: TStringField
      FieldName = 'FINALIZADO'
      Size = 1
    end
    object MemoField1: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 8
    end
    object StringField4: TStringField
      FieldName = 'NOM_PRODUTO'
      Size = 50
    end
    object StringField5: TStringField
      FieldName = 'REF_FABRICA'
      Size = 15
    end
    object StringField6: TStringField
      FieldName = 'UNIDADE'
      Size = 3
    end
    object BCDField2: TBCDField
      FieldName = 'QTD_EMBALAGEM'
      Precision = 18
      Size = 2
    end
    object BCDField3: TBCDField
      FieldName = 'QTD'
      Precision = 18
      Size = 2
    end
    object StringField7: TStringField
      FieldName = 'COR'
    end
    object StringField8: TStringField
      FieldName = 'TAMANHO'
      Size = 15
    end
    object BCDField4: TBCDField
      FieldName = 'CUSTO_BRUTO'
      Precision = 18
      Size = 2
    end
    object BCDField5: TBCDField
      FieldName = 'DESCONTO'
      Precision = 18
      Size = 2
    end
    object BCDField6: TBCDField
      FieldName = 'CUSTO_LIQUIDO'
      Precision = 18
      Size = 2
    end
    object BCDField7: TBCDField
      FieldName = 'MARCKUP'
      Precision = 18
      Size = 2
    end
    object BCDField8: TBCDField
      FieldName = 'PRECO_VENDA'
      Precision = 18
      Size = 2
    end
    object IntegerField7: TIntegerField
      FieldName = 'ID'
    end
    object StringField9: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object IntegerField8: TIntegerField
      FieldName = 'COD_FORNECEDOR_1'
    end
    object StringField10: TStringField
      FieldName = 'FANTASIA'
      Size = 50
    end
    object StringField11: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 50
    end
  end
  object ds_contas_pagar: TDataSource
    DataSet = q_contas_pagar
    Left = 376
    Top = 64
  end
  object dst_contas_pagar: TfrxDBDataset
    UserName = 'dst_pedidos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'NR_DOCUMENTO=NR_DOCUMENTO'
      'COD_FORNECEDOR=COD_FORNECEDOR'
      'DTA_PEDIDO=DTA_PEDIDO'
      'COD_COLECAO=COD_COLECAO'
      'NR_PEDIDO_FORNECEDOR=NR_PEDIDO_FORNECEDOR'
      'PRAZO_MAXIMO=PRAZO_MAXIMO'
      'PREVISAO_ENTREGA=PREVISAO_ENTREGA'
      'TIPO_PEDIDO=TIPO_PEDIDO'
      'FINALIZADO=FINALIZADO'
      'OBS=OBS'
      'NOM_PRODUTO=NOM_PRODUTO'
      'REF_FABRICA=REF_FABRICA'
      'UNIDADE=UNIDADE'
      'QTD_EMBALAGEM=QTD_EMBALAGEM'
      'QTD=QTD'
      'COR=COR'
      'TAMANHO=TAMANHO'
      'CUSTO_BRUTO=CUSTO_BRUTO'
      'DESCONTO=DESCONTO'
      'CUSTO_LIQUIDO=CUSTO_LIQUIDO'
      'MARCKUP=MARCKUP'
      'PRECO_VENDA=PRECO_VENDA'
      'ID=ID'
      'DESCRICAO=DESCRICAO'
      'COD_FORNECEDOR_1=COD_FORNECEDOR_1'
      'FANTASIA=FANTASIA'
      'RAZAO_SOCIAL=RAZAO_SOCIAL')
    DataSet = q_contas_pagar
    Left = 376
    Top = 120
  end
  object q_rankin_simplificado: TIBOQuery
    Params = <>
    ColumnAttributes.Strings = (
      'V1.NUMDOC=REQUIRED')
    
    DatabaseName = ':c:\orbi\dados\orbi.fdb'
    Connection = dao.CN
    RecordCountAccurate = True
    SQL.Strings = (
      
        'select v1.cod_cliente, c.nom_cliente, sum(tot_liquido) as tot_li' +
        'quido from vendas1 v1, cliente c'
      'where c.cod_cliente=v1.cod_cliente'
      'group by v1.cod_cliente, c.nom_cliente'
      'order by 2')
    FieldOptions = []
    Left = 816
    Top = 504
    object q_rankin_simplificadoNOM_CLIENTE: TStringField
      FieldName = 'NOM_CLIENTE'
      ReadOnly = True
      Size = 60
    end
    object q_rankin_simplificadoTOT_LIQUIDO: TBCDField
      FieldName = 'TOT_LIQUIDO'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object q_rankin_simplificadoCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      ReadOnly = True
    end
  end
  object ds_ranking_simplificado: TDataSource
    DataSet = q_rankin_simplificado
    Left = 816
    Top = 558
  end
  object dst_ranking_simplificado: TfrxDBDataset
    UserName = 'dst_ranking_simplificado'
    CloseDataSource = True
    FieldAliases.Strings = (
      'NOM_CLIENTE=NOM_CLIENTE'
      'TOT_LIQUIDO=TOT_LIQUIDO')
    DataSource = ds_ranking_simplificado
    Left = 816
    Top = 616
  end
  object q_vendas2_ranking: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'codcli'
        ParamType = ptInput
      end>
    
    DatabaseName = ':c:\orbi\dados\orbi.fdb'
    Connection = dao.CN
    RecordCountAccurate = True
    SQL.Strings = (
      
        'SELECT  first 3 V2.COD_PRODUTO, v2.COD_CLIENTE, ID_COR, ID_TAMAN' +
        'HO, QTD, PRECO, SUB_TOTAL, p.nom_produto, p.preco_venda, c.cor, '
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
      'order by v1.tot_liquido desc')
    FieldOptions = []
    Left = 680
    Top = 16
    object IntegerField9: TIntegerField
      FieldName = 'COD_PRODUTO'
    end
    object IntegerField10: TIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object IntegerField11: TIntegerField
      FieldName = 'ID_COR'
    end
    object IntegerField12: TIntegerField
      FieldName = 'ID_TAMANHO'
    end
    object BCDField9: TBCDField
      FieldName = 'QTD'
      Size = 8
    end
    object BCDField10: TBCDField
      FieldName = 'PRECO'
      Size = 8
    end
    object StringField12: TStringField
      FieldName = 'NOM_PRODUTO'
      Size = 70
    end
    object StringField13: TStringField
      FieldName = 'COR'
      Size = 30
    end
    object StringField14: TStringField
      FieldName = 'TAMANHO'
    end
    object StringField15: TStringField
      FieldName = 'NOM_CLIENTE'
      Size = 50
    end
    object IntegerField13: TIntegerField
      FieldName = 'COD_FOP'
    end
    object StringField16: TStringField
      FieldName = 'NOM_FOP'
      Size = 30
    end
    object DateField4: TDateField
      FieldName = 'DTADOC'
    end
    object BCDField11: TBCDField
      FieldName = 'DESCONTO'
      Size = 8
    end
    object BCDField12: TBCDField
      FieldName = 'TOT_LIQUIDO'
      Size = 8
    end
    object IntegerField14: TIntegerField
      FieldName = 'NUMDOC'
    end
    object BCDField13: TBCDField
      FieldName = 'SUB_TOTAL'
      Size = 8
    end
    object StringField17: TStringField
      FieldName = 'PRAZO_PGTO'
      Size = 28
    end
    object StringField18: TStringField
      FieldName = 'QTD_PARCELAS'
      Size = 1
    end
    object BCDField14: TBCDField
      FieldName = 'PRECO_VENDA'
      Size = 8
    end
    object BCDField15: TBCDField
      FieldName = 'TOT_BRUTO'
      Size = 8
    end
    object BCDField16: TBCDField
      FieldName = 'CREDITO_USADO'
      Size = 8
    end
    object StringField19: TStringField
      FieldName = 'TELEFONE'
      Size = 13
    end
    object StringField20: TStringField
      FieldName = 'NOM_REPRESENTANTE'
      Size = 50
    end
    object StringField21: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object StringField22: TStringField
      FieldName = 'NOM_MARCA'
      Size = 40
    end
    object BCDField17: TBCDField
      FieldName = 'DESCONTO_ITEM'
      Precision = 18
      Size = 2
    end
    object BCDField18: TBCDField
      FieldName = 'PRECO_BRUTO'
      Precision = 18
      Size = 2
    end
    object IntegerField15: TIntegerField
      FieldName = 'FORNECEDOR_PRINCIPAL'
    end
    object StringField23: TStringField
      FieldName = 'FANTASIA'
      Size = 50
    end
    object StringField24: TStringField
      FieldName = 'NOM_EMPRESA'
      Size = 50
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
      'COD_PRODUTO=COD_PRODUTO'
      'COD_CLIENTE=COD_CLIENTE'
      'ID_COR=ID_COR'
      'ID_TAMANHO=ID_TAMANHO'
      'QTD=QTD'
      'PRECO=PRECO'
      'NOM_PRODUTO=NOM_PRODUTO'
      'COR=COR'
      'TAMANHO=TAMANHO'
      'NOM_CLIENTE=NOM_CLIENTE'
      'COD_FOP=COD_FOP'
      'NOM_FOP=NOM_FOP'
      'DTADOC=DTADOC'
      'DESCONTO=DESCONTO'
      'TOT_LIQUIDO=TOT_LIQUIDO'
      'NUMDOC=NUMDOC'
      'SUB_TOTAL=SUB_TOTAL'
      'PRAZO_PGTO=PRAZO_PGTO'
      'QTD_PARCELAS=QTD_PARCELAS'
      'PRECO_VENDA=PRECO_VENDA'
      'TOT_BRUTO=TOT_BRUTO'
      'CREDITO_USADO=CREDITO_USADO'
      'TELEFONE=TELEFONE'
      'NOM_REPRESENTANTE=NOM_REPRESENTANTE'
      'EMAIL=EMAIL'
      'NOM_MARCA=NOM_MARCA'
      'DESCONTO_ITEM=DESCONTO_ITEM'
      'PRECO_BRUTO=PRECO_BRUTO'
      'FORNECEDOR_PRINCIPAL=FORNECEDOR_PRINCIPAL'
      'FANTASIA=FANTASIA'
      'NOM_EMPRESA=NOM_EMPRESA')
    DataSet = q_vendas2_ranking
    Left = 680
    Top = 128
  end
  object q_vendas1_ranking: TIBOQuery
    Params = <>
    ColumnAttributes.Strings = (
      'V1.NUMDOC=REQUIRED')
    
    DatabaseName = ':c:\orbi\dados\orbi.fdb'
    Connection = dao.CN
    RecordCountAccurate = True
    SQL.Strings = (
      
        'select c.nom_cliente, sum(tot_liquido) as tot_liquido f' +
        'rom vendas1 v1'
      'left join cliente c on c.cod_cliente=v1.cod_cliente '
      'group by c.nom_cliente '
      'order by 2 desc limit 30 ')
    FieldOptions = []
    Left = 576
    Top = 16
    object IntegerField16: TIntegerField
      FieldName = 'NUMDOC'
      Origin = 'VENDAS1.NUMDOC'
      Required = True
    end
    object DateField5: TDateField
      FieldName = 'DTADOC'
      Origin = 'VENDAS1.DTADOC'
    end
    object BCDField19: TBCDField
      FieldName = 'TOT_LIQUIDO'
      Origin = 'VENDAS1.TOT_LIQUIDO'
      Precision = 18
      Size = 2
    end
    object StringField25: TStringField
      FieldName = 'NOM_CLIENTE'
      Origin = 'CLIENTE.NOM_CLIENTE'
      Size = 60
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
      'NUMDOC=NUMDOC'
      'DTADOC=DTADOC'
      'TOT_LIQUIDO=TOT_LIQUIDO'
      'NOM_CLIENTE=NOM_CLIENTE')
    DataSet = q_vendas1_ranking
    Left = 576
    Top = 128
  end
end
