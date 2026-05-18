object Fr_pedido_simplificado: TFr_pedido_simplificado
  Left = 0
  Top = 0
  Caption = 'Pedido Simplificado'
  ClientHeight = 760
  ClientWidth = 1309
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pnTopo: TPanel
    Left = 0
    Top = 0
    Width = 1309
    Height = 97
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object lbNumDoc: TLabel
      Left = 16
      Top = 12
      Width = 72
      Height = 13
      Caption = 'N'#250'mero Pedido'
    end
    object lbCliente: TLabel
      Left = 147
      Top = 12
      Width = 33
      Height = 13
      Caption = 'Cliente'
    end
    object lbRepresentante: TLabel
      Left = 477
      Top = 12
      Width = 72
      Height = 13
      Caption = 'Representante'
    end
    object lbFop: TLabel
      Left = 16
      Top = 55
      Width = 102
      Height = 13
      Caption = 'Forma de Pagamento'
    end
    object lbPrazo: TLabel
      Left = 477
      Top = 55
      Width = 27
      Height = 13
      Caption = 'Prazo'
    end
    object Lb_orcamento: TLabel
      Left = 902
      Top = 55
      Width = 53
      Height = 13
      Caption = 'Or'#231'amento'
    end
    object lbSupervisor: TLabel
      Left = 902
      Top = 11
      Width = 51
      Height = 13
      Caption = 'Supervisor'
    end
    object LbNomCliente: TLabel
      Left = 212
      Top = 32
      Width = 250
      Height = 13
      AutoSize = False
      Caption = 'Descricao cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LbNomRepresentante: TLabel
      Left = 544
      Top = 32
      Width = 250
      Height = 13
      AutoSize = False
      Caption = 'Descricao representante'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LbNomSupervisor: TLabel
      Left = 969
      Top = 31
      Width = 250
      Height = 13
      AutoSize = False
      Caption = 'Descricao supervisor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LbNomFop: TLabel
      Left = 74
      Top = 75
      Width = 110
      Height = 13
      AutoSize = False
      Caption = 'Descricao Forma Pagto.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LbNomPrazo: TLabel
      Left = 533
      Top = 75
      Width = 100
      Height = 13
      AutoSize = False
      Caption = 'Descricao prazo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Prnumdoc: TEdit
      Left = 16
      Top = 28
      Width = 81
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object Prcod_cliente: TsComboEdit
      Left = 147
      Top = 28
      Width = 60
      Height = 21
      AutoSize = False
      TabOrder = 1
      Text = ''
      OnExit = Prcod_clienteExit
      CheckOnExit = True
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
      OnButtonClick = Prcod_clienteButtonClick
      ClickKey = 120
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object Prcod_supervisor: TsComboEdit
      Left = 902
      Top = 27
      Width = 60
      Height = 21
      AutoSize = False
      TabOrder = 3
      Text = ''
      OnExit = Prcod_supervisorExit
      CheckOnExit = True
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
      OnButtonClick = Prcod_supervisorButtonClick
      ClickKey = 120
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object Prcod_fop: TsComboEdit
      Left = 18
      Top = 71
      Width = 50
      Height = 21
      AutoSize = False
      TabOrder = 4
      Text = ''
      OnExit = Prcod_fopExit
      CheckOnExit = True
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
      OnButtonClick = Prcod_fopButtonClick
      ClickKey = 120
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object Prcod_prazo_pgto: TsComboEdit
      Left = 477
      Top = 71
      Width = 50
      Height = 21
      AutoSize = False
      TabOrder = 5
      Text = ''
      OnExit = Prcod_prazo_pgtoExit
      CheckOnExit = True
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
      OnButtonClick = Prcod_prazo_pgtoButtonClick
      ClickKey = 120
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object Prorcamento: TComboBox
      Left = 902
      Top = 71
      Width = 57
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 6
      Text = 'N'#227'o'
      Items.Strings = (
        'N'#227'o'
        'Sim')
    end
    object Prcod_representante: TsComboEdit
      Left = 477
      Top = 28
      Width = 60
      Height = 21
      AutoSize = False
      TabOrder = 2
      Text = ''
      OnExit = Prcod_representanteExit
      CheckOnExit = True
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
      OnButtonClick = Prcod_representanteButtonClick
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
  end
  object pnItem: TPanel
    Left = 939
    Top = 97
    Width = 370
    Height = 573
    Align = alRight
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      370
      573)
    object lbCodProduto: TLabel
      Left = 16
      Top = 9
      Width = 38
      Height = 13
      Caption = 'Produto'
    end
    object lbQtd: TLabel
      Left = 16
      Top = 57
      Width = 18
      Height = 13
      Caption = 'Qtd'
    end
    object lbPreco: TLabel
      Left = 96
      Top = 57
      Width = 27
      Height = 13
      Caption = 'Preco'
    end
    object lbDesc: TLabel
      Left = 178
      Top = 57
      Width = 41
      Height = 13
      Caption = 'Desc. %'
    end
    object LbNomProduto: TLabel
      Left = 105
      Top = 32
      Width = 250
      Height = 13
      AutoSize = False
      Caption = 'Descri'#231#227'o produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LbSubTotalItem: TLabel
      Left = 297
      Top = 76
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Foto: TImage
      Left = 15
      Top = 152
      Width = 340
      Height = 234
      Center = True
      Proportional = True
      Stretch = True
    end
    object Label1: TLabel
      Left = 189
      Top = 76
      Width = 41
      Height = 13
      Caption = 'Desc. %'
    end
    object Label2: TLabel
      Left = 254
      Top = 57
      Width = 67
      Height = 13
      Caption = 'SubTotal Item'
    end
    object lbObs: TsLabel
      Left = 17
      Top = 398
      Width = 62
      Height = 13
      Caption = 'Observa'#231#227'o:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object MeCodProduto: TsComboEdit
      Left = 17
      Top = 29
      Width = 80
      Height = 21
      AutoSize = False
      TabOrder = 0
      Text = ''
      OnExit = MeCodProdutoExit
      CheckOnExit = True
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
      OnButtonClick = MeCodProdutoButtonClick
      ClickKey = 120
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object MeQtd: TEdit
      Left = 16
      Top = 73
      Width = 74
      Height = 21
      TabOrder = 1
      Text = '1'
      OnEnter = MeQtdEnter
    end
    object MePreco: TEdit
      Left = 96
      Top = 73
      Width = 76
      Height = 21
      TabOrder = 2
      OnEnter = MePrecoEnter
      OnExit = MePrecoExit
    end
    object MeDesconto: TEdit
      Left = 178
      Top = 73
      Width = 70
      Height = 21
      TabOrder = 3
      Text = '0'
      OnEnter = MeDescontoEnter
      OnExit = MeDescontoExit
    end
    object btInsItem: TButton
      Left = 17
      Top = 111
      Width = 62
      Height = 25
      Caption = 'Ins. Item'
      TabOrder = 4
      OnClick = btInsItemClick
    end
    object btGraItem: TButton
      Left = 151
      Top = 111
      Width = 62
      Height = 25
      Caption = 'Grv. Item'
      TabOrder = 6
      OnClick = btGraItemClick
    end
    object btAltItem: TButton
      Left = 84
      Top = 111
      Width = 62
      Height = 25
      Caption = 'Alt. Item'
      TabOrder = 5
      OnClick = btAltItemClick
    end
    object btExcItem: TButton
      Left = 218
      Top = 111
      Width = 62
      Height = 25
      Caption = 'Exc. Item'
      TabOrder = 9
      OnClick = btExcItemClick
    end
    object btCanItem: TButton
      Left = 285
      Top = 111
      Width = 62
      Height = 25
      Caption = 'Can. Item'
      TabOrder = 8
      OnClick = btCanItemClick
    end
    object Probservacoes_pedido: TsRichEdit
      Left = 17
      Top = 413
      Width = 340
      Height = 119
      Anchors = [akLeft, akTop, akRight]
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      Zoom = 100
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
    end
  end
  object pnRod: TPanel
    Left = 0
    Top = 670
    Width = 1309
    Height = 90
    Align = alBottom
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    object LbTotalLiquidoPedido: TLabel
      Left = 24
      Top = 22
      Width = 311
      Height = 40
      Caption = 'Total Liquido: 0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -33
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LbStatusPedido: TLabel
      Left = 1187
      Top = 52
      Width = 76
      Height = 25
      Alignment = taRightJustify
      Caption = 'Status:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btImprimir: TButton
      Left = 1081
      Top = 17
      Width = 88
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 1
      OnClick = btImprimirClick
    end
    object btStatus: TButton
      Left = 989
      Top = 17
      Width = 88
      Height = 25
      Caption = 'Status'
      TabOrder = 0
      OnClick = btStatusClick
    end
    object btCarregar: TButton
      Left = 1173
      Top = 17
      Width = 86
      Height = 25
      Caption = 'Localizar'
      TabOrder = 2
      OnClick = btCarregarClick
    end
    object btNovo: TButton
      Left = 640
      Top = 17
      Width = 82
      Height = 25
      Caption = 'Novo'
      TabOrder = 3
      OnClick = btNovoClick
    end
    object btAlterar: TButton
      Left = 728
      Top = 17
      Width = 82
      Height = 25
      Caption = 'Alterar'
      TabOrder = 4
      OnClick = btAlterarClick
    end
    object btGravar: TButton
      Left = 815
      Top = 17
      Width = 82
      Height = 25
      Caption = 'Gravar'
      TabOrder = 5
      OnClick = btGravarClick
    end
    object btCancelar: TButton
      Left = 902
      Top = 17
      Width = 82
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 6
      OnClick = btCancelarClick
    end
  end
  object pngeral: TPanel
    Left = 0
    Top = 97
    Width = 939
    Height = 573
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    object dbgItens: TDBGrid
      Left = 1
      Top = 1
      Width = 937
      Height = 530
      Align = alClient
      DataSource = dsItens
      DrawingStyle = gdsGradient
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = dbgItensCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'cod_produto'
          Title.Caption = 'Cod. Produto'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nom_produto'
          Title.Caption = 'Nome do Produto'
          Width = 360
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'preco_base'
          Title.Alignment = taCenter
          Title.Caption = 'Preco Base'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'preco'
          Title.Alignment = taCenter
          Title.Caption = 'Preco'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'qtd'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'desconto'
          Title.Alignment = taCenter
          Title.Caption = 'Desc. %'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'sub_total'
          Title.Alignment = taCenter
          Title.Caption = 'Sub Total'
          Width = 100
          Visible = True
        end>
    end
    object pnGeralRod: TPanel
      Left = 1
      Top = 531
      Width = 937
      Height = 41
      Align = alBottom
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      object LbDescontoPedido: TLabel
        Left = 0
        Top = 6
        Width = 266
        Height = 25
        Caption = 'Desconto Pedido %: 0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LbComissaoPerc: TLabel
        Left = 367
        Top = 6
        Width = 192
        Height = 25
        Alignment = taRightJustify
        Caption = 'Comissao %: 0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LbComissaoValor: TLabel
        Left = 698
        Top = 6
        Width = 195
        Height = 25
        Alignment = taRightJustify
        Caption = 'Comissao R$: 0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object dsItens: TDataSource
    DataSet = mmItens
    Left = 728
    Top = 224
  end
  object mmItens: TRxMemoryData
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'cod_produto'
        DataType = ftInteger
      end
      item
        Name = 'nom_produto'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'preco_base'
        DataType = ftFloat
      end
      item
        Name = 'preco'
        DataType = ftFloat
      end
      item
        Name = 'qtd'
        DataType = ftFloat
      end
      item
        Name = 'desconto'
        DataType = ftFloat
      end
      item
        Name = 'sub_total'
        DataType = ftFloat
      end>
    AfterScroll = qItensAfterScroll
    Left = 760
    Top = 224
    object mmItenscod_produto: TIntegerField
      FieldName = 'cod_produto'
    end
    object mmItensnom_produto: TStringField
      FieldName = 'nom_produto'
      Size = 120
    end
    object mmItenspreco_base: TFloatField
      FieldName = 'preco_base'
      DisplayFormat = '#,##0.00'
    end
    object mmItenspreco: TFloatField
      FieldName = 'preco'
      DisplayFormat = '#,##0.00'
    end
    object mmItensqtd: TFloatField
      FieldName = 'qtd'
      DisplayFormat = '0.00'
    end
    object mmItensdesconto: TFloatField
      FieldName = 'desconto'
      DisplayFormat = '0.00'
    end
    object mmItenssub_total: TFloatField
      FieldName = 'sub_total'
      DisplayFormat = '#,##0.00'
    end
    object mmItenssub_total_bruto: TFloatField
      FieldName = 'sub_total_bruto'
    end
  end
  object qItens: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'select v2.cod_produto, p.nom_produto, '
      '       coalesce(v2.preco_base, 0) as preco_base, '
      '       coalesce(v2.preco, 0) as preco, '
      '       coalesce(v2.qtd, 0) as qtd, '
      '       coalesce(v2.desconto, 0) as desconto, '
      '       coalesce(v2.sub_total, 0) as sub_total, '
      '       coalesce(v2.sub_total_bruto, 0) as sub_total_bruto '
      'from vendas2 v2 '
      'left join produto p on p.cod_produto = v2.cod_produto '
      'where v2.numdoc =:numdoc'
      'order by v2.id')
    Left = 792
    Top = 224
    ParamData = <
      item
        Name = 'NUMDOC'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qItenscod_produto: TIntegerField
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
    end
    object qItensnom_produto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nom_produto'
      Origin = 'nom_produto'
      Size = 100
    end
    object qItenspreco_base: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'preco_base'
      Origin = 'preco_base'
      ReadOnly = True
      currency = True
      Precision = 64
      Size = 0
    end
    object qItenspreco: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'preco'
      Origin = 'preco'
      ReadOnly = True
      currency = True
      Precision = 64
      Size = 0
    end
    object qItensqtd: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'qtd'
      Origin = 'qtd'
      ReadOnly = True
      DisplayFormat = '#,###,##0.00'
      Precision = 64
      Size = 0
    end
    object qItensdesconto: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'desconto'
      Origin = 'desconto'
      ReadOnly = True
      DisplayFormat = '##0.00'
      Precision = 64
      Size = 0
    end
    object qItenssub_total: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'sub_total'
      Origin = 'sub_total'
      ReadOnly = True
      currency = True
      Precision = 64
      Size = 0
    end
    object qItenssub_total_bruto: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'sub_total_bruto'
      Origin = 'sub_total_bruto'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
  end
  object qPedido: TFDQuery
    Left = 856
    Top = 224
  end
  object q_foto: TFDQuery
    Left = 920
    Top = 224
  end
end
