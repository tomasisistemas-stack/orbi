object fr_frete_combinado: Tfr_frete_combinado
  Left = 6
  Top = 35
  BorderIcons = [biSystemMenu]
  Caption = 'Frete Combinado'
  ClientHeight = 671
  ClientWidth = 1001
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TsPanel
    Left = 0
    Top = 630
    Width = 1001
    Height = 41
    Align = alBottom
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object lbTotalNFs: TsLabel
      Left = 816
      Top = 14
      Width = 172
      Height = 13
      Alignment = taRightJustify
      Caption = 'Notas Fiscais Selecionadas: 0'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object BtnConfirmar: TsSpeedButton
      Left = 341
      Top = 5
      Width = 97
      Height = 30
      Caption = 'Confirmar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
      ParentFont = False
      OnClick = BtnConfirmarClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object btImprimir: TsSpeedButton
      Left = 455
      Top = 5
      Width = 86
      Height = 30
      Caption = 'Imprimir'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentFont = False
      OnClick = btImprimirClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object BtnSair: TsBitBtn
      Left = 559
      Top = 6
      Width = 100
      Height = 28
      Caption = 'Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
        0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
        0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
        0333337F777FFFFF7F3333000000000003333377777777777333}
      ModalResult = 2
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      SkinData.SkinSection = 'BUTTON'
    end
    object CheckTodos: TsCheckBox
      Left = 9
      Top = 14
      Width = 119
      Height = 20
      Caption = 'Selecionar Todos'
      Alignment = taLeftJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = CheckTodosClick
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
    object ckImpSVlrFrete: TsCheckBox
      Left = 152
      Top = 14
      Width = 178
      Height = 20
      Caption = 'Impress'#227'o Sem Valor Frete?'
      Alignment = taLeftJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
  end
  object Panel2: TsPanel
    Left = 0
    Top = 0
    Width = 1001
    Height = 85
    Align = alTop
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object gbPedido: TsGroupBox
      Left = 4
      Top = 1
      Width = 81
      Height = 39
      Caption = 'Pedido'
      TabOrder = 0
      SkinData.SkinSection = 'GROUPBOX'
      object edPedido: TsCurrencyEdit
        Left = 3
        Top = 13
        Width = 75
        Height = 21
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
        DecimalPlaces = 0
        DisplayFormat = '0'
      end
    end
    object gbDataSaida: TsGroupBox
      Left = 170
      Top = 1
      Width = 217
      Height = 39
      Caption = 'Data de Sa'#237'da'
      TabOrder = 2
      SkinData.SkinSection = 'GROUPBOX'
      object Label2: TsLabel
        Left = 5
        Top = 16
        Width = 17
        Height = 13
        Caption = 'De:'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Label1: TsLabel
        Left = 109
        Top = 16
        Width = 19
        Height = 13
        Caption = 'At'#233':'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object edSaidaDe: TsDateEdit
        Left = 25
        Top = 13
        Width = 81
        Height = 21
        AutoSize = False
        Color = clWhite
        EditMask = '!99/99/9999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 0
        Text = '  /  /    '
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
      object edSaidaAte: TsDateEdit
        Left = 131
        Top = 13
        Width = 81
        Height = 21
        AutoSize = False
        Color = clWhite
        EditMask = '!99/99/9999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 1
        Text = '  /  /    '
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
    end
    object gbCliente: TsGroupBox
      Left = 389
      Top = 1
      Width = 260
      Height = 39
      Caption = 'Cliente:'
      TabOrder = 3
      SkinData.SkinSection = 'GROUPBOX'
      object Lbnom_cliente: TsLabel
        Left = 72
        Top = 16
        Width = 9
        Height = 13
        Caption = '...'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object edCliente: TsComboEdit
        Left = 4
        Top = 13
        Width = 66
        Height = 21
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = ''
        CheckOnExit = True
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        OnButtonClick = edClienteButtonClick
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
    end
    object BtConsulta: TsBitBtn
      Left = 915
      Top = 9
      Width = 75
      Height = 28
      Caption = 'Consulta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
        FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
        FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
        FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
        FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
        FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
        C8807FF7777777777FF700000000000000007777777777777777333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 4
      OnClick = BtConsultaClick
      SkinData.SkinSection = 'BUTTON'
    end
    object gbNFe: TsGroupBox
      Left = 87
      Top = 1
      Width = 81
      Height = 39
      Caption = 'Nota Fiscal'
      TabOrder = 1
      SkinData.SkinSection = 'GROUPBOX'
      object edNFe: TsCurrencyEdit
        Left = 2
        Top = 13
        Width = 75
        Height = 21
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
        DecimalPlaces = 0
        DisplayFormat = '0'
      end
    end
    object gbTransp: TsGroupBox
      Left = 651
      Top = 1
      Width = 254
      Height = 39
      Caption = 'Transportadora:'
      TabOrder = 5
      SkinData.SkinSection = 'GROUPBOX'
      object lbTransportadora: TsLabel
        Left = 72
        Top = 16
        Width = 9
        Height = 13
        Caption = '...'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object edTransportadora: TsComboEdit
        Left = 4
        Top = 13
        Width = 66
        Height = 21
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = ''
        CheckOnExit = True
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        OnButtonClick = edTransportadoraButtonClick
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
    end
    object rgFreteComb: TsRadioGroup
      Left = 576
      Top = 40
      Width = 185
      Height = 41
      Caption = 'Frete Combinado?'
      ParentBackground = False
      TabOrder = 6
      SkinData.SkinSection = 'GROUPBOX'
      Columns = 3
      Items.Strings = (
        'Todos'
        'Sim'
        'N'#227'o')
    end
    object gbConf: TsGroupBox
      Left = 764
      Top = 40
      Width = 217
      Height = 41
      Caption = 'Data de Confirma'#231#227'o'
      TabOrder = 7
      SkinData.SkinSection = 'GROUPBOX'
      object Label3: TsLabel
        Left = 5
        Top = 16
        Width = 17
        Height = 13
        Caption = 'De:'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Label4: TsLabel
        Left = 109
        Top = 16
        Width = 19
        Height = 13
        Caption = 'At'#233':'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object edConfDe: TsDateEdit
        Left = 25
        Top = 13
        Width = 81
        Height = 21
        AutoSize = False
        Color = clWhite
        EditMask = '!99/99/9999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 0
        Text = '  /  /    '
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
      object edConfAte: TsDateEdit
        Left = 131
        Top = 13
        Width = 81
        Height = 21
        AutoSize = False
        Color = clWhite
        EditMask = '!99/99/9999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 1
        Text = '  /  /    '
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
    end
    object GroupBox1: TsGroupBox
      Left = 4
      Top = 40
      Width = 341
      Height = 41
      Caption = 'Cidade'
      TabOrder = 8
      SkinData.SkinSection = 'GROUPBOX'
      object LbNom_cidade: TsLabel
        Left = 87
        Top = 19
        Width = 9
        Height = 13
        Caption = '...'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object sbCidade: TsSpeedButton
        Left = 314
        Top = 12
        Width = 23
        Height = 22
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
          555557777F777555F55500000000555055557777777755F75555005500055055
          555577F5777F57555555005550055555555577FF577F5FF55555500550050055
          5555577FF77577FF555555005050110555555577F757777FF555555505099910
          555555FF75777777FF555005550999910555577F5F77777775F5500505509990
          3055577F75F77777575F55005055090B030555775755777575755555555550B0
          B03055555F555757575755550555550B0B335555755555757555555555555550
          BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
          50BB555555555555575F555555555555550B5555555555555575}
        NumGlyphs = 2
        OnClick = sbCidadeClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object Prcod_cidade: TsComboEdit
        Left = 5
        Top = 13
        Width = 77
        Height = 21
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = ''
        OnExit = Prcod_cidadeExit
        CheckOnExit = True
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        OnButtonClick = Prcod_cidadeButtonClick
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
      object edCidade: TsEdit
        Left = 160
        Top = 13
        Width = 150
        Height = 21
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
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
    object GroupBox2: TsGroupBox
      Left = 347
      Top = 40
      Width = 226
      Height = 41
      Caption = 'UF'
      TabOrder = 9
      SkinData.SkinSection = 'GROUPBOX'
      object lbuf: TsLabel
        Left = 87
        Top = 19
        Width = 9
        Height = 13
        Caption = '...'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Pruf: TsComboEdit
        Left = 5
        Top = 13
        Width = 77
        Height = 21
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = ''
        OnExit = PrufExit
        CheckOnExit = True
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        OnButtonClick = PrufButtonClick
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
    end
  end
  object Panel3: TsPanel
    Left = 0
    Top = 85
    Width = 1001
    Height = 545
    Align = alClient
    TabOrder = 2
    SkinData.SkinSection = 'PANEL'
    object dgListaNFe: TDBGrid
      Left = 1
      Top = 1
      Width = 999
      Height = 492
      Align = alClient
      DataSource = dsListaNFe
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnColExit = dgListaNFeColExit
      OnDrawColumnCell = dgListaNFeDrawColumnCell
      OnDblClick = dgListaNFeDblClick
      OnKeyPress = dgListaNFeKeyPress
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Num_Doc'
          ReadOnly = True
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NFE'
          Title.Caption = 'N'#176' Nota Fiscal'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Data_Saida'
          ReadOnly = True
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Cliente'
          ReadOnly = True
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Transportadora'
          ReadOnly = True
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ValorFrete'
          Title.Alignment = taCenter
          Title.Caption = 'Valor'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PesoNota'
          Title.Alignment = taCenter
          Title.Caption = 'Peso'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TotLiquido'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr.Nota'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VolumeNota'
          Title.Alignment = taCenter
          Title.Caption = 'Volume'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Cidade'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UF'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UsuarioConf'
          Title.Caption = 'Conferiu'
          Width = 100
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DataConf'
          Title.Alignment = taCenter
          Title.Caption = 'Data Conf.'
          Width = 80
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Check'
          Title.Alignment = taCenter
          Width = 18
          Visible = True
        end>
    end
    object DBCheckBox1: TDBCheckBox
      Left = 248
      Top = 96
      Width = 15
      Height = 17
      Color = clWhite
      DataField = 'Check'
      DataSource = dsListaNFe
      ParentColor = False
      TabOrder = 1
      Visible = False
    end
    object Panel4: TsPanel
      Left = 1
      Top = 493
      Width = 999
      Height = 51
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 2
      SkinData.SkinSection = 'PANEL'
      object sbAlterar: TsSpeedButton
        Left = 514
        Top = 12
        Width = 86
        Height = 30
        Caption = 'Alterar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
        ParentFont = False
        OnClick = sbAlterarClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object btCancelar: TsSpeedButton
        Left = 610
        Top = 12
        Width = 86
        Height = 30
        Caption = 'Cancelar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333333333333333333FFF33FF333FFF339993370733
          999333777FF37FF377733339993000399933333777F777F77733333399970799
          93333333777F7377733333333999399933333333377737773333333333990993
          3333333333737F73333333333331013333333333333777FF3333333333910193
          333333333337773FF3333333399000993333333337377737FF33333399900099
          93333333773777377FF333399930003999333337773777F777FF339993370733
          9993337773337333777333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        ParentFont = False
        OnClick = btCancelarClick
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object gbPrecoProm: TsGroupBox
        Left = 287
        Top = 5
        Width = 100
        Height = 41
        Caption = 'Valor Frete'
        TabOrder = 0
        SkinData.SkinSection = 'GROUPBOX'
        object edValorFrete: TDBEdit
          Left = 5
          Top = 14
          Width = 90
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clWhite
          DataField = 'ValorFrete'
          DataSource = dsListaNFe
          TabOrder = 0
        end
      end
      object gbValidoAte: TsGroupBox
        Left = 390
        Top = 5
        Width = 113
        Height = 41
        Caption = 'Data Confima'#231#227'o'
        TabOrder = 1
        SkinData.SkinSection = 'GROUPBOX'
        object edDtConf: TDBEdit
          Left = 5
          Top = 14
          Width = 103
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clWhite
          DataField = 'DataConf'
          DataSource = dsListaNFe
          TabOrder = 0
        end
      end
    end
  end
  object mmListaFrete: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Num_Doc'
        DataType = ftInteger
      end
      item
        Name = 'Data_Saida'
        DataType = ftDateTime
      end
      item
        Name = 'Cliente'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Chave_NFE'
        DataType = ftString
        Size = 44
      end>
    Left = 600
    Top = 200
    object mmListaFreteNum_Doc: TIntegerField
      DisplayLabel = 'N'#176' Pedido'
      FieldName = 'Num_Doc'
    end
    object mmListaFreteNFE: TIntegerField
      FieldName = 'NFE'
    end
    object mmListaFreteData_Saida: TDateTimeField
      DisplayLabel = 'Data Sa'#237'da'
      FieldName = 'Data_Saida'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object mmListaFreteCliente: TStringField
      FieldName = 'Cliente'
      Size = 100
    end
    object mmListaFreteCheck: TBooleanField
      DisplayLabel = ' '
      FieldName = 'Check'
    end
    object mmListaFreteTransportadora: TStringField
      FieldName = 'Transportadora'
      Size = 100
    end
    object mmListaFreteDataConf: TDateField
      FieldName = 'DataConf'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object mmListaFreteValorFrete: TCurrencyField
      FieldName = 'ValorFrete'
    end
    object mmListaFreteChave_NFE: TStringField
      FieldName = 'Chave_NFE'
      Size = 44
    end
    object mmListaFretePesoNota: TFloatField
      FieldName = 'PesoNota'
      DisplayFormat = '#,###,##0.00'
    end
    object mmListaFreteTotLiquido: TCurrencyField
      FieldName = 'TotLiquido'
    end
    object mmListaFreteVolumeNota: TFloatField
      FieldName = 'VolumeNota'
    end
    object mmListaFreteCidade: TStringField
      FieldName = 'Cidade'
      Size = 50
    end
    object mmListaFreteUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object mmListaFreteUsuarioConf: TStringField
      FieldName = 'UsuarioConf'
      Size = 50
    end
  end
  object dsListaNFe: TDataSource
    DataSet = mmListaFrete
    Left = 656
    Top = 184
  end
  object fR_RELATORIO: TfrxReport
    Version = '6.9.3'
    DotMatrixReport = False
    EngineOptions.PrintIfEmpty = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40180.423318680600000000
    ReportOptions.LastChange = 40644.491234618050000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      ''
      ''
      'procedure ckFreteCombOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  '
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = fR_RELATORIOGetValue
    Left = 552
    Top = 136
    Datasets = <
      item
        DataSet = Dm.dst_frete_combinado
        DataSetName = 'dst_frete_combinado'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 56.692950000000010000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 945.662030000000000000
          Top = 3.779530000000001000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[DATE]')
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 899.528140000000000000
          Top = 22.677180000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[PAGE#] de [TOTALPAGES#]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 30.559060000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Relatorio de Frete Combinado')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[empresa]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 177.637910000000000000
        Width = 1046.929810000000000000
        DataSet = Dm.dst_frete_combinado
        DataSetName = 'dst_frete_combinado'
        RowCount = 0
        object dst_vendas1NUMDOC: TfrxMemoView
          AllowVectorExport = True
          Left = 1.889763780000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataField = 'NFE'
          DataSet = Dm.dst_frete_combinado
          DataSetName = 'dst_frete_combinado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_frete_combinado."NFE"]')
          ParentFont = False
        end
        object dst_vendas1DTADOC: TfrxMemoView
          AllowVectorExport = True
          Left = 77.102362200000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataField = 'NFE'
          DataSet = Dm.dst_frete_combinado
          DataSetName = 'dst_frete_combinado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_frete_combinado."NFE"]')
          ParentFont = False
        end
        object dst_vendas1NOM_CLIENTE: TfrxMemoView
          AllowVectorExport = True
          Left = 233.952755910000000000
          Width = 226.771653543307100000
          Height = 15.118120000000000000
          DataField = 'CLIENTE'
          DataSet = Dm.dst_frete_combinado
          DataSetName = 'dst_frete_combinado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_frete_combinado."CLIENTE"]')
          ParentFont = False
        end
        object dst_vendas1TOT_LIQUIDO: TfrxMemoView
          AllowVectorExport = True
          Left = 760.818875670000000000
          Width = 75.590553620000000000
          Height = 15.118120000000000000
          DataField = 'TOT_LIQUIDO'
          DataSet = Dm.dst_frete_combinado
          DataSetName = 'dst_frete_combinado'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_frete_combinado."TOT_LIQUIDO"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 151.559055120000000000
          Width = 79.370078740000000000
          Height = 15.118120000000000000
          DataField = 'DTA_SAIDA'
          DataSet = Dm.dst_frete_combinado
          DataSetName = 'dst_frete_combinado'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_frete_combinado."DTA_SAIDA"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 464.480280790000000000
          Width = 219.212593540000000000
          Height = 15.118120000000000000
          DataField = 'TRANSPORTADORA'
          DataSet = Dm.dst_frete_combinado
          DataSetName = 'dst_frete_combinado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_frete_combinado."TRANSPORTADORA"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 686.315400000000000000
          Width = 71.811023620000000000
          Height = 15.118120000000000000
          DataField = 'PESO_NOTA'
          DataSet = Dm.dst_frete_combinado
          DataSetName = 'dst_frete_combinado'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_frete_combinado."PESO_NOTA"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 838.409475670000000000
          Top = 0.779529999999994100
          Width = 71.811023620000000000
          Height = 15.118120000000000000
          DataField = 'VOLUME_NOTA'
          DataSet = Dm.dst_frete_combinado
          DataSetName = 'dst_frete_combinado'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_frete_combinado."VOLUME_NOTA"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 911.622054570000000000
          Top = 0.779529999999994100
          Width = 132.283457240000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_frete_combinado
          DataSetName = 'dst_frete_combinado'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_frete_combinado."NOM_CIDADE"]-[dst_frete_combinado."UF"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 302.362400000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 963.780150000000000000
          Top = 0.779530000000022500
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 98.267780000000000000
        Width = 1046.929810000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 1.779530000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'N'#186' Pedido')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 151.740260000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Data  Sa'#237'da')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 234.110390000000000000
          Width = 226.771653543307100000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Cliente ')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 77.149660000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'N'#186' NFe')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 464.645950000000000000
          Width = 219.212593540000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Transportadoras')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 759.685530000000000000
          Top = 0.220470000000006000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'Valor NF')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 686.315400000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'Peso')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 838.276130000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Volume')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 911.733384330000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Cidade')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 257.008040000000000000
        Width = 1046.929810000000000000
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 196.535560000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Total Qtd Pedidos: [COUNT(MasterData1,2)]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 686.362204724409300000
          Top = 0.220469999999977500
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<dst_frete_combinado."PESO_NOTA">,MasterData1,2)]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 760.818897640000000000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<dst_frete_combinado."TOT_LIQUIDO">,MasterData1,2)]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 588.047620000000000000
          Top = 0.133890000000008100
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Total :')
          ParentFont = False
        end
      end
    end
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
    TipoDANFE = tiSemGeracao
    EspessuraBorda = 1
    BorderIcon = [biSystemMenu, biMinimize, biMaximize]
    ThreadSafe = False
    Left = 280
    Top = 392
  end
end
