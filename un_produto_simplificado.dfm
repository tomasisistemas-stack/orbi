object frm_produtos_simplificado: Tfrm_produtos_simplificado
  Left = 361
  Top = 223
  Caption = 'Cadastro de Produtos - Simplificado.'
  ClientHeight = 249
  ClientWidth = 578
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sPanel1: TsPanel
    Left = 0
    Top = 193
    Width = 578
    Height = 56
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object DBNavProd: TsDBNavigator
      Left = 128
      Top = 4
      Width = 321
      Height = 49
      FullRepaint = False
      TabOrder = 0
      SkinData.SkinSection = 'TOOLBAR'
      DataSource = DSProduto
    end
  end
  object sPanel2: TsPanel
    Left = 0
    Top = 0
    Width = 578
    Height = 193
    Align = alClient
    BevelInner = bvLowered
    BorderStyle = bsSingle
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object gbDescricao: TsGroupBox
      Left = 75
      Top = 48
      Width = 493
      Height = 50
      Caption = 'Descri'#231#227'o'
      TabOrder = 0
      SkinData.SkinSection = 'GROUPBOX'
      object edDescricao: TsDBEdit
        Left = 5
        Top = 18
        Width = 483
        Height = 21
        Color = clWhite
        DataField = 'NOM_PRODUTO'
        DataSource = DSProduto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
    end
    object Pacusto_produto: TsPanel
      Left = 8
      Top = 101
      Width = 559
      Height = 68
      BevelInner = bvLowered
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 1
      SkinData.SkinSection = 'PANEL'
      object Label24: TsLabel
        Left = 7
        Top = 3
        Width = 27
        Height = 13
        Caption = 'Custo'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Label38: TsLabel
        Left = 72
        Top = 20
        Width = 9
        Height = 20
        Caption = '+'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Label25: TsLabel
        Left = 84
        Top = 3
        Width = 42
        Height = 13
        Caption = 'Impostos'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Label39: TsLabel
        Left = 150
        Top = 20
        Width = 9
        Height = 20
        Caption = '+'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Label26: TsLabel
        Left = 242
        Top = 4
        Width = 25
        Height = 13
        Caption = 'Geral'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Label41: TsLabel
        Left = 383
        Top = 19
        Width = 9
        Height = 20
        Caption = '+'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Label35: TsLabel
        Left = 397
        Top = 4
        Width = 27
        Height = 13
        Caption = 'Lucro'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Label42: TsLabel
        Left = 461
        Top = 18
        Width = 9
        Height = 20
        Caption = '='
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object LbPrecovenda: TsLabel
        Left = 474
        Top = 3
        Width = 65
        Height = 13
        Caption = 'Preco Venda:'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Label10: TsLabel
        Left = 168
        Top = 4
        Width = 16
        Height = 13
        Caption = 'IPI:'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Label36: TsLabel
        Left = 228
        Top = 20
        Width = 9
        Height = 20
        Caption = '+'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Label60: TsLabel
        Left = 306
        Top = 18
        Width = 9
        Height = 20
        Caption = '='
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Label61: TsLabel
        Left = 317
        Top = 3
        Width = 54
        Height = 13
        Caption = 'Custo Total'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object PrCusto: TsDBEdit
        Left = 4
        Top = 17
        Width = 68
        Height = 21
        AutoSize = False
        Color = clWhite
        DataField = 'CUSTO'
        DataSource = DSProduto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = PrCustoChange
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object PrImpostos: TsDBEdit
        Left = 81
        Top = 17
        Width = 68
        Height = 21
        AutoSize = False
        Color = clWhite
        DataField = 'IMPOSTOS'
        DataSource = DSProduto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnChange = PrImpostosChange
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object Prgeral: TsDBEdit
        Left = 238
        Top = 17
        Width = 68
        Height = 21
        AutoSize = False
        Color = clWhite
        DataField = 'GERAL'
        DataSource = DSProduto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnChange = PrgeralChange
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object PrLucro: TsDBEdit
        Left = 393
        Top = 17
        Width = 68
        Height = 21
        AutoSize = False
        Color = clWhite
        DataField = 'LUCRO'
        DataSource = DSProduto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnChange = PrLucroChange
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object Prcalcula_preco_automatic: TsDBCheckBox
        Left = 142
        Top = 44
        Width = 270
        Height = 20
        TabStop = False
        Caption = 'Calcular automaticamente o pre'#231'o de venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        Visible = False
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
        DataField = 'CALCULA_PRECO_AUTOMATIC'
        DataSource = DSProduto
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object Prpreco_venda: TsDBEdit
        Left = 471
        Top = 17
        Width = 83
        Height = 21
        AutoSize = False
        Color = clWhite
        DataField = 'PRECO_VENDA'
        DataSource = DSProduto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object Pripi: TsDBEdit
        Left = 159
        Top = 17
        Width = 68
        Height = 22
        AutoSize = False
        Color = clWhite
        DataField = 'IPI'
        DataSource = DSProduto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnChange = PripiChange
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object PrCusto_Total: TsDBEdit
        Left = 315
        Top = 17
        Width = 68
        Height = 21
        AutoSize = False
        Color = clWhite
        DataField = 'CUSTO_TOTAL'
        DataSource = DSProduto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
    end
    object gpCodigo: TsGroupBox
      Left = 8
      Top = 48
      Width = 65
      Height = 49
      Caption = 'Codigo'
      TabOrder = 2
      SkinData.SkinSection = 'GROUPBOX'
      object sBevel1: TsBevel
        Left = 4
        Top = 16
        Width = 57
        Height = 26
      end
      object lbProduto: TsDBTextFX
        Left = 3
        Top = 18
        Width = 53
        Height = 21
        Alignment = taRightJustify
        Caption = 'lbProduto'
        ParentFont = False
        ShowAccelChar = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Angle = 0
        Shadow.OffsetKeeper.LeftTop = -3
        Shadow.OffsetKeeper.RightBottom = 5
        DataField = 'COD_PRODUTO'
        DataSource = DSProduto
      end
    end
    object sGroupBox1: TsGroupBox
      Left = 9
      Top = 0
      Width = 560
      Height = 49
      Caption = 'Digite C'#243'digo ou Descri'#231#227'o'
      TabOrder = 3
      SkinData.SkinSection = 'GROUPBOX'
      object edproduto: TsEdit
        Left = 4
        Top = 19
        Width = 61
        Height = 21
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = edprodutoChange
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object ftdescricao: TsEdit
        Left = 68
        Top = 19
        Width = 485
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnChange = ftdescricaoChange
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
    end
  end
  object DSProduto: TDataSource
    DataSet = IBProduto
    Left = 376
  end
  object IBProduto: TFDTable
    IndexFieldNames = 'cod_produto'
    Connection = dao.CN
    UpdateOptions.UpdateTableName = 'PRODUTO'
    TableName = 'PRODUTO'
    Left = 336
    object IBProdutocod_produto: TIntegerField
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object IBProdutonom_produto: TStringField
      FieldName = 'nom_produto'
      Origin = 'nom_produto'
      Size = 100
    end
    object IBProdutocod_grupo: TIntegerField
      FieldName = 'cod_grupo'
      Origin = 'cod_grupo'
    end
    object IBProdutounidade: TStringField
      FieldName = 'unidade'
      Origin = 'unidade'
      FixedChar = True
      Size = 3
    end
    object IBProdutopeso: TBCDField
      FieldName = 'peso'
      Origin = 'peso'
      Precision = 15
      Size = 3
    end
    object IBProdutoref_fabrica: TStringField
      FieldName = 'ref_fabrica'
      Origin = 'ref_fabrica'
      FixedChar = True
      Size = 15
    end
    object IBProdutocod_prateleira: TStringField
      FieldName = 'cod_prateleira'
      Origin = 'cod_prateleira'
      FixedChar = True
      Size = 10
    end
    object IBProdutoqtd_estoque: TBCDField
      FieldName = 'qtd_estoque'
      Origin = 'qtd_estoque'
      Precision = 15
      Size = 2
    end
    object IBProdutoqtd_reservado: TBCDField
      FieldName = 'qtd_reservado'
      Origin = 'qtd_reservado'
      Precision = 15
      Size = 2
    end
    object IBProdutoqtd_estoque_min: TBCDField
      FieldName = 'qtd_estoque_min'
      Origin = 'qtd_estoque_min'
      Precision = 15
      Size = 2
    end
    object IBProdutoetiqueta_lin1: TStringField
      FieldName = 'etiqueta_lin1'
      Origin = 'etiqueta_lin1'
      Size = 25
    end
    object IBProdutoetiqueta_lin2: TStringField
      FieldName = 'etiqueta_lin2'
      Origin = 'etiqueta_lin2'
      Size = 25
    end
    object IBProdutoobservacao: TMemoField
      FieldName = 'observacao'
      Origin = 'observacao'
      BlobType = ftMemo
    end
    object IBProdutoorigem_mercadoria: TStringField
      FieldName = 'origem_mercadoria'
      Origin = 'origem_mercadoria'
      FixedChar = True
      Size = 1
    end
    object IBProdutotrib_icms: TStringField
      FieldName = 'trib_icms'
      Origin = 'trib_icms'
      FixedChar = True
      Size = 2
    end
    object IBProdutoipi: TBCDField
      FieldName = 'ipi'
      Origin = 'ipi'
      Precision = 15
      Size = 2
    end
    object IBProdutocusto: TBCDField
      FieldName = 'custo'
      Origin = 'custo'
      Precision = 15
      Size = 2
    end
    object IBProdutoimpostos: TBCDField
      FieldName = 'impostos'
      Origin = 'impostos'
      Precision = 15
      Size = 2
    end
    object IBProdutogeral: TBCDField
      FieldName = 'geral'
      Origin = 'geral'
      Precision = 15
      Size = 2
    end
    object IBProdutooutros: TBCDField
      FieldName = 'outros'
      Origin = 'outros'
      Precision = 15
      Size = 2
    end
    object IBProdutolucro: TBCDField
      FieldName = 'lucro'
      Origin = 'lucro'
      Precision = 15
      Size = 2
    end
    object IBProdutoavisar_prod_desat: TStringField
      FieldName = 'avisar_prod_desat'
      Origin = 'avisar_prod_desat'
      FixedChar = True
      Size = 1
    end
    object IBProdutoqtd_dias_desat: TSmallintField
      FieldName = 'qtd_dias_desat'
      Origin = 'qtd_dias_desat'
    end
    object IBProdutodta_ult_atualizacao: TDateField
      FieldName = 'dta_ult_atualizacao'
      Origin = 'dta_ult_atualizacao'
    end
    object IBProdutocusto_medio: TBCDField
      FieldName = 'custo_medio'
      Origin = 'custo_medio'
      Precision = 15
      Size = 2
    end
    object IBProdutocusto_calculado: TBCDField
      FieldName = 'custo_calculado'
      Origin = 'custo_calculado'
      Precision = 15
      Size = 2
    end
    object IBProdutocusto_atualizado: TBCDField
      FieldName = 'custo_atualizado'
      Origin = 'custo_atualizado'
      Precision = 15
      Size = 2
    end
    object IBProdutoqtd_ult_entrada: TBCDField
      FieldName = 'qtd_ult_entrada'
      Origin = 'qtd_ult_entrada'
      Precision = 15
      Size = 2
    end
    object IBProdutoqtd_ult_saida: TBCDField
      FieldName = 'qtd_ult_saida'
      Origin = 'qtd_ult_saida'
      Precision = 15
      Size = 2
    end
    object IBProdutodta_ult_entrada: TDateField
      FieldName = 'dta_ult_entrada'
      Origin = 'dta_ult_entrada'
    end
    object IBProdutodta_ult_saida: TDateField
      FieldName = 'dta_ult_saida'
      Origin = 'dta_ult_saida'
    end
    object IBProdutoqtd_embalagem: TBCDField
      FieldName = 'qtd_embalagem'
      Origin = 'qtd_embalagem'
      Precision = 15
      Size = 3
    end
    object IBProdutopreco_venda: TBCDField
      FieldName = 'preco_venda'
      Origin = 'preco_venda'
      Precision = 15
    end
    object IBProdutostatus: TStringField
      FieldName = 'status'
      Origin = 'status'
      FixedChar = True
      Size = 1
    end
    object IBProdutoestoque_minimo: TBCDField
      FieldName = 'estoque_minimo'
      Origin = 'estoque_minimo'
      Precision = 15
      Size = 2
    end
    object IBProdutograde: TIntegerField
      FieldName = 'grade'
      Origin = 'grade'
    end
    object IBProdutocod_colecao: TIntegerField
      FieldName = 'cod_colecao'
      Origin = 'cod_colecao'
    end
    object IBProdutocalcula_preco_automatic: TStringField
      FieldName = 'calcula_preco_automatic'
      Origin = 'calcula_preco_automatic'
      FixedChar = True
      Size = 1
    end
    object IBProdutofornecedor_principal: TIntegerField
      FieldName = 'fornecedor_principal'
      Origin = 'fornecedor_principal'
    end
    object IBProdutocod_empresa: TIntegerField
      FieldName = 'cod_empresa'
      Origin = 'cod_empresa'
    end
    object IBProdutocod_estoque: TIntegerField
      FieldName = 'cod_estoque'
      Origin = 'cod_estoque'
    end
    object IBProdutodesconto_maximo: TBCDField
      FieldName = 'desconto_maximo'
      Origin = 'desconto_maximo'
      Precision = 15
      Size = 2
    end
    object IBProdutoid_marca: TIntegerField
      FieldName = 'id_marca'
      Origin = 'id_marca'
    end
    object IBProdutocod_pro2: TStringField
      FieldName = 'cod_pro2'
      Origin = 'cod_pro2'
      FixedChar = True
      Size = 8
    end
    object IBProdutoicms: TBCDField
      FieldName = 'icms'
      Origin = 'icms'
      Precision = 15
      Size = 2
    end
    object IBProdutomargem_valor_agregado_st: TBCDField
      FieldName = 'margem_valor_agregado_st'
      Origin = 'margem_valor_agregado_st'
      Precision = 15
      Size = 2
    end
    object IBProdutocod_fiscal_produto: TStringField
      FieldName = 'cod_fiscal_produto'
      Origin = 'cod_fiscal_produto'
      FixedChar = True
      Size = 5
    end
    object IBProdutoncm: TStringField
      FieldName = 'ncm'
      Origin = 'ncm'
      Size = 11
    end
    object IBProdutoestoque_maximo: TBCDField
      FieldName = 'estoque_maximo'
      Origin = 'estoque_maximo'
      Precision = 15
      Size = 2
    end
    object IBProdutomts_rolo: TBCDField
      FieldName = 'mts_rolo'
      Origin = 'mts_rolo'
      Precision = 15
      Size = 2
    end
    object IBProdutoord_pauta: TIntegerField
      FieldName = 'ord_pauta'
      Origin = 'ord_pauta'
    end
    object IBProdutocont_estoque_ago_2010: TFloatField
      FieldName = 'cont_estoque_ago_2010'
      Origin = 'cont_estoque_ago_2010'
    end
    object IBProdutopromocao: TStringField
      FieldName = 'promocao'
      Origin = 'promocao'
      FixedChar = True
      Size = 1
    end
    object IBProdutoperc_margem_minima: TBCDField
      FieldName = 'perc_margem_minima'
      Origin = 'perc_margem_minima'
      Precision = 15
      Size = 2
    end
    object IBProdutosubcategoria: TIntegerField
      FieldName = 'subcategoria'
      Origin = 'subcategoria'
    end
    object IBProdutopreco_promocao: TBCDField
      FieldName = 'preco_promocao'
      Origin = 'preco_promocao'
      Precision = 15
      Size = 2
    end
    object IBProdutoqtd_multipla: TBCDField
      FieldName = 'qtd_multipla'
      Origin = 'qtd_multipla'
      Precision = 15
      Size = 2
    end
    object IBProdutosincronizar_palm: TStringField
      FieldName = 'sincronizar_palm'
      Origin = 'sincronizar_palm'
      FixedChar = True
      Size = 1
    end
    object IBProdutopromocao_pacote: TStringField
      FieldName = 'promocao_pacote'
      Origin = 'promocao_pacote'
      FixedChar = True
      Size = 1
    end
    object IBProdutoid_plano_contas: TIntegerField
      FieldName = 'id_plano_contas'
      Origin = 'id_plano_contas'
    end
    object IBProdutograde_comissao: TStringField
      FieldName = 'grade_comissao'
      Origin = 'grade_comissao'
      FixedChar = True
      Size = 1
    end
    object IBProdutocusto_total: TBCDField
      FieldName = 'custo_total'
      Origin = 'custo_total'
      Precision = 15
      Size = 2
    end
    object IBProdutocomissao_inicial_interno: TBCDField
      FieldName = 'comissao_inicial_interno'
      Origin = 'comissao_inicial_interno'
      Precision = 15
      Size = 2
    end
    object IBProdutocomissao_inicial_outros: TBCDField
      FieldName = 'comissao_inicial_outros'
      Origin = 'comissao_inicial_outros'
      Precision = 15
      Size = 2
    end
    object IBProdutoescala_comissao_interno: TBCDField
      FieldName = 'escala_comissao_interno'
      Origin = 'escala_comissao_interno'
      Precision = 15
      Size = 2
    end
    object IBProdutoescala_comissao_outros: TBCDField
      FieldName = 'escala_comissao_outros'
      Origin = 'escala_comissao_outros'
      Precision = 15
      Size = 2
    end
    object IBProdutoescala_desconto: TBCDField
      FieldName = 'escala_desconto'
      Origin = 'escala_desconto'
      Precision = 15
      Size = 2
    end
    object IBProdutocodigo_barra: TStringField
      FieldName = 'codigo_barra'
      Origin = 'codigo_barra'
    end
    object IBProdutobonificacao_apenas: TStringField
      FieldName = 'bonificacao_apenas'
      Origin = 'bonificacao_apenas'
      FixedChar = True
      Size = 1
    end
    object IBProdutomostrar_emb_etiqueta: TStringField
      FieldName = 'mostrar_emb_etiqueta'
      Origin = 'mostrar_emb_etiqueta'
      FixedChar = True
      Size = 1
    end
    object IBProdutoindisponivel: TStringField
      FieldName = 'indisponivel'
      Origin = 'indisponivel'
      FixedChar = True
      Size = 1
    end
    object IBProdutoloc_a_fila: TIntegerField
      FieldName = 'loc_a_fila'
      Origin = 'loc_a_fila'
    end
    object IBProdutoloc_a_lado: TIntegerField
      FieldName = 'loc_a_lado'
      Origin = 'loc_a_lado'
    end
    object IBProdutoloc_a_andar: TIntegerField
      FieldName = 'loc_a_andar'
      Origin = 'loc_a_andar'
    end
    object IBProdutoloc_a_box: TIntegerField
      FieldName = 'loc_a_box'
      Origin = 'loc_a_box'
    end
    object IBProdutoloc_padrao: TIntegerField
      FieldName = 'loc_padrao'
      Origin = 'loc_padrao'
    end
    object IBProdutoloc_b_andar: TIntegerField
      FieldName = 'loc_b_andar'
      Origin = 'loc_b_andar'
    end
    object IBProdutoloc_b_box: TIntegerField
      FieldName = 'loc_b_box'
      Origin = 'loc_b_box'
    end
    object IBProdutorevenda: TStringField
      FieldName = 'revenda'
      Origin = 'revenda'
      FixedChar = True
      Size = 1
    end
    object IBProdutotinta_base: TStringField
      FieldName = 'tinta_base'
      Origin = 'tinta_base'
      FixedChar = True
      Size = 1
    end
    object IBProdutoaviso_revisao_veiculo: TStringField
      FieldName = 'aviso_revisao_veiculo'
      Origin = 'aviso_revisao_veiculo'
      FixedChar = True
      Size = 1
    end
    object IBProdutoproxima_revisao: TIntegerField
      FieldName = 'proxima_revisao'
      Origin = 'proxima_revisao'
    end
    object IBProdutotipo_revisao: TStringField
      FieldName = 'tipo_revisao'
      Origin = 'tipo_revisao'
      Size = 10
    end
    object IBProdutonao_validar_margem: TStringField
      FieldName = 'nao_validar_margem'
      Origin = 'nao_validar_margem'
      FixedChar = True
      Size = 1
    end
    object IBProdutocomissao_fixa: TSingleField
      FieldName = 'comissao_fixa'
      Origin = 'comissao_fixa'
    end
    object IBProdutocusto_materia_prima: TBCDField
      FieldName = 'custo_materia_prima'
      Origin = 'custo_materia_prima'
      Precision = 15
      Size = 2
    end
    object IBProdutocusto_mao_de_obra: TBCDField
      FieldName = 'custo_mao_de_obra'
      Origin = 'custo_mao_de_obra'
      Precision = 15
      Size = 2
    end
    object IBProdutocest: TStringField
      FieldName = 'cest'
      Origin = 'cest'
      Size = 10
    end
    object IBProdutofrequencia: TStringField
      FieldName = 'frequencia'
      Origin = 'frequencia'
      Size = 10
    end
    object IBProdutopotencia: TStringField
      FieldName = 'potencia'
      Origin = 'potencia'
      Size = 10
    end
    object IBProdutotensao: TStringField
      FieldName = 'tensao'
      Origin = 'tensao'
      Size = 10
    end
    object IBProdutocorrente: TStringField
      FieldName = 'corrente'
      Origin = 'corrente'
      Size = 10
    end
    object IBProdutoprocessos: TBlobField
      FieldName = 'processos'
      Origin = 'processos'
    end
    object IBProdutocustosubtotal: TBCDField
      FieldName = 'custosubtotal'
      Origin = 'custosubtotal'
      Precision = 14
      Size = 2
    end
    object IBProdutoentst: TBCDField
      FieldName = 'entst'
      Origin = 'entst'
      Precision = 14
      Size = 2
    end
    object IBProdutoentfrete: TBCDField
      FieldName = 'entfrete'
      Origin = 'entfrete'
      Precision = 14
      Size = 2
    end
    object IBProdutoentipi: TBCDField
      FieldName = 'entipi'
      Origin = 'entipi'
      Precision = 14
      Size = 2
    end
    object IBProdutoenticms: TBCDField
      FieldName = 'enticms'
      Origin = 'enticms'
      Precision = 14
      Size = 2
    end
    object IBProdutomateria_prima: TStringField
      FieldName = 'materia_prima'
      Origin = 'materia_prima'
      FixedChar = True
      Size = 1
    end
    object IBProdutodta_alt_preco: TDateField
      FieldName = 'dta_alt_preco'
      Origin = 'dta_alt_preco'
    end
  end
end
