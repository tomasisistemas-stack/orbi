object Fr_PDV: TFr_PDV
  Left = 0
  Top = 0
  Caption = 'Frente de Caixa - PDV'
  ClientHeight = 760
  ClientWidth = 1280
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pnCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 1280
    Height = 64
    Align = alTop
    Color = clNavy
    ParentBackground = False
    TabOrder = 0
    object lbTitulo: TLabel
      Left = 20
      Top = 12
      Width = 292
      Height = 29
      Caption = 'FRENTE DE CAIXA - PDV'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbOperador: TLabel
      Left = 870
      Top = 16
      Width = 156
      Height = 17
      Caption = 'Operador: n'#227'o informado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -14
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbDataDocumento: TLabel
      Left = 500
      Top = 16
      Width = 129
      Height = 17
      Caption = 'Data: 00/00/0000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -14
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbNumeroDocumento: TLabel
      Left = 675
      Top = 16
      Width = 89
      Height = 17
      Caption = 'Venda: Nova'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -14
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbCaixa: TLabel
      Left = 1157
      Top = 16
      Width = 73
      Height = 17
      Alignment = taRightJustify
      Caption = 'Caixa: 001'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -14
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnEntrada: TPanel
    Left = 0
    Top = 64
    Width = 1280
    Height = 64
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object lbCodigoBarras: TLabel
      Left = 12
      Top = 16
      Width = 82
      Height = 13
      Caption = 'C'#243'digo de barras'
    end
    object lbDescricaoItem: TLabel
      Left = 226
      Top = 16
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object lbQuantidadeItem: TLabel
      Left = 475
      Top = 16
      Width = 22
      Height = 13
      Caption = 'Qtd.'
    end
    object lbPrecoItem: TLabel
      Left = 567
      Top = 16
      Width = 47
      Height = 13
      Caption = 'Pre'#231'o Un.'
    end
    object lbDescontoItem: TLabel
      Left = 667
      Top = 16
      Width = 59
      Height = 13
      Caption = '% Desconto'
    end
    object lbTotalItem: TLabel
      Left = 769
      Top = 16
      Width = 50
      Height = 13
      Caption = 'Pre'#231'o Tot.'
    end
    object edCodigoBarras: TEdit
      Left = 12
      Top = 33
      Width = 214
      Height = 27
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyDown = edCodigoBarrasKeyDown
      OnKeyPress = edCodigoBarrasKeyPress
    end
    object edDescricaoItem: TEdit
      Left = 226
      Top = 33
      Width = 250
      Height = 25
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object edQuantidadeItem: TEdit
      Left = 475
      Top = 33
      Width = 92
      Height = 25
      Alignment = taRightJustify
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = '0,000'
      OnExit = edQuantidadeItemExit
    end
    object edPrecoItem: TEdit
      Left = 567
      Top = 33
      Width = 100
      Height = 25
      Alignment = taRightJustify
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = 'R$ 0,00'
      OnExit = edPrecoItemExit
    end
    object edDescontoItem: TEdit
      Left = 667
      Top = 33
      Width = 102
      Height = 25
      Alignment = taRightJustify
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Text = '0,00'
      OnExit = edDescontoItemExit
      OnKeyPress = edDescontoItemKeyPress
    end
    object edTotalItem: TEdit
      Left = 769
      Top = 33
      Width = 142
      Height = 25
      Alignment = taRightJustify
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      Text = 'R$ 0,00'
    end
  end
  object pnItens: TPanel
    Left = 0
    Top = 128
    Width = 930
    Height = 552
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    object dbItens: TDBGrid
      Left = 1
      Top = 1
      Width = 928
      Height = 550
      Align = alClient
      DataSource = dsItens
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'cod_produto'
          Title.Caption = 'C'#243'digo'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nom_produto'
          Title.Caption = 'Descri'#231#227'o'
          Width = 390
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'qtd'
          Title.Caption = 'Quantidade'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'preco'
          Title.Caption = 'Pre'#231'o'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'desconto'
          Title.Caption = 'Desconto'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'sub_total'
          Title.Caption = 'Subtotal'
          Width = 140
          Visible = True
        end>
    end
  end
  object pnResumo: TPanel
    Left = 930
    Top = 128
    Width = 350
    Height = 552
    Align = alRight
    Color = clNavy
    ParentBackground = False
    TabOrder = 3
    object lbCliente: TLabel
      Left = 20
      Top = 8
      Width = 39
      Height = 13
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LbNomCliente: TLabel
      Left = 82
      Top = 25
      Width = 245
      Height = 17
      AutoSize = False
      Caption = 'Descri'#231#227'o cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbRepresentante: TLabel
      Left = 20
      Top = 50
      Width = 85
      Height = 13
      Caption = 'Representante'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LbNomRepresentante: TLabel
      Left = 82
      Top = 67
      Width = 245
      Height = 17
      AutoSize = False
      Caption = 'Representante n'#227'o informado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbFormaPagamento: TLabel
      Left = 20
      Top = 92
      Width = 121
      Height = 13
      Caption = 'Forma de pagamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LbNomFop: TLabel
      Left = 82
      Top = 111
      Width = 112
      Height = 17
      AutoSize = False
      Caption = 'Forma n'#227'o informada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbPrazo: TLabel
      Left = 205
      Top = 92
      Width = 32
      Height = 13
      Caption = 'Prazo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LbNomPrazo: TLabel
      Left = 267
      Top = 111
      Width = 60
      Height = 17
      AutoSize = False
      Caption = 'N'#227'o informado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbItens: TLabel
      Left = 24
      Top = 145
      Width = 71
      Height = 22
      Caption = 'Itens: 0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -18
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbQuantidade: TLabel
      Left = 24
      Top = 175
      Width = 156
      Height = 22
      Caption = 'Quantidade: 0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -18
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbSubtotal: TLabel
      Left = 24
      Top = 208
      Width = 139
      Height = 22
      Caption = 'Subtotal: R$ 0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -18
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbDesconto: TLabel
      Left = 24
      Top = 240
      Width = 79
      Height = 22
      Caption = 'Desconto:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -18
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbTotal: TLabel
      Left = 24
      Top = 278
      Width = 140
      Height = 43
      Caption = 'R$ 0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -36
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edDescontoGeral: TEdit
      Left = 109
      Top = 241
      Width = 96
      Height = 25
      Alignment = taRightJustify
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Text = '0,00'
      OnChange = edDescontoGeralChange
      OnExit = edDescontoGeralExit
    end
    object Prcod_cliente: TsComboEdit
      Left = 20
      Top = 22
      Width = 55
      Height = 21
      AutoSize = False
      TabOrder = 4
      Text = ''
      OnExit = PrcodClienteExit
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
      OnButtonClick = btBuscarClienteClick
      ClickKey = 120
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object Prcod_representante: TsComboEdit
      Left = 20
      Top = 64
      Width = 55
      Height = 21
      AutoSize = False
      TabOrder = 1
      Text = ''
      OnExit = PrcodRepresentanteExit
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
      OnButtonClick = btBuscarRepresentanteClick
      ClickKey = 120
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object Prcod_fop: TsComboEdit
      Left = 20
      Top = 108
      Width = 55
      Height = 21
      AutoSize = False
      TabOrder = 2
      Text = ''
      OnExit = PrcodFopExit
      OnKeyPress = PrcodFopKeyPress
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
      OnButtonClick = btBuscarFopClick
      ClickKey = 120
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object Prcod_prazo_pgto: TsComboEdit
      Left = 205
      Top = 108
      Width = 55
      Height = 21
      AutoSize = False
      TabOrder = 3
      Text = ''
      OnExit = PrcodPrazoExit
      OnKeyPress = PrcodPrazoKeyPress
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
      OnButtonClick = btBuscarPrazoClick
      ClickKey = 120
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object pnPagamento: TPanel
      Left = 18
      Top = 342
      Width = 314
      Height = 112
      BevelOuter = bvLowered
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object lbRecebido: TLabel
        Left = 16
        Top = 12
        Width = 63
        Height = 17
        Caption = 'Recebido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbTroco: TLabel
        Left = 16
        Top = 75
        Width = 40
        Height = 17
        Caption = 'Troco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbTrocoValor: TLabel
        Left = 211
        Top = 69
        Width = 85
        Height = 27
        Alignment = taRightJustify
        Caption = 'R$ 0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -22
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edRecebido: TEdit
        Left = 16
        Top = 34
        Width = 280
        Height = 27
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = '0,00'
        OnChange = edRecebidoChange
        OnExit = edRecebidoExit
      end
    end
  end
  object pnRodape: TPanel
    Left = 0
    Top = 680
    Width = 1280
    Height = 80
    Align = alBottom
    Color = clNavy
    ParentBackground = False
    TabOrder = 4
    object lbStatusRodape: TLabel
      Left = 769
      Top = 32
      Width = 126
      Height = 17
      Caption = 'Status: Em aberto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -14
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btNovo: TButton
      Left = 18
      Top = 22
      Width = 110
      Height = 38
      Caption = 'Nova venda'
      TabOrder = 0
      TabStop = False
      OnClick = btNovoClick
    end
    object btLocalizarPedido: TButton
      Left = 134
      Top = 22
      Width = 130
      Height = 38
      Caption = 'Localizar pedido'
      TabOrder = 1
      TabStop = False
      OnClick = btLocalizarPedidoClick
    end
    object btExcluirItem: TButton
      Left = 270
      Top = 22
      Width = 110
      Height = 38
      Caption = 'Excluir item'
      TabOrder = 2
      TabStop = False
      OnClick = btExcluirItemClick
    end
    object btCancelar: TButton
      Left = 387
      Top = 22
      Width = 110
      Height = 38
      Caption = 'Cancelar'
      TabOrder = 3
      TabStop = False
      OnClick = btCancelarClick
    end
    object btDANFCe: TButton
      Left = 630
      Top = 22
      Width = 120
      Height = 38
      Caption = 'DANFE NFC-e'
      TabOrder = 4
      TabStop = False
      OnClick = btDANFCeClick
    end
    object btImprimir: TButton
      Left = 504
      Top = 22
      Width = 120
      Height = 38
      Caption = 'Imprimir'
      TabOrder = 7
      TabStop = False
      OnClick = btImprimirClick
    end
    object btFinalizar: TButton
      Left = 921
      Top = 14
      Width = 160
      Height = 50
      Caption = 'Finalizar venda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      TabStop = False
      OnClick = btFinalizarClick
    end
    object btEmitirNFCe: TButton
      Left = 1093
      Top = 14
      Width = 180
      Height = 50
      Caption = 'Emitir NFC-e'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      TabStop = False
      OnClick = btEmitirNFCeClick
    end
  end
  object dsItens: TDataSource
    DataSet = mdItens
  end
  object mdItens: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    AutoCommitUpdates = False
  end
  object dsFop: TDataSource
    DataSet = qFop
  end
  object qFop: TFDQuery
  end
end
