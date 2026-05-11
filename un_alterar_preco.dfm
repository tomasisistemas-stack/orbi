object FmAlterarPreco: TFmAlterarPreco
  Left = 0
  Top = 0
  Caption = 'Alterar Pre'#231'o'
  ClientHeight = 480
  ClientWidth = 684
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel4: TsPanel
    Left = 0
    Top = 0
    Width = 684
    Height = 106
    Align = alTop
    BevelOuter = bvSpace
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object Lbl_produto: TsLabel
      Left = 9
      Top = 13
      Width = 40
      Height = 13
      Caption = 'Produto:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Lbnom_produto: TsLabel
      Left = 186
      Top = 13
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
    object sbProduto: TsSpeedButton
      Left = 600
      Top = 7
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
      OnClick = sbProdutoClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object Lbl_fornecedor: TsLabel
      Left = 9
      Top = 58
      Width = 57
      Height = 13
      Caption = 'Fornecedor:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Lbfornecedor: TsLabel
      Left = 186
      Top = 58
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
    object Lbl_grupo: TsLabel
      Left = 9
      Top = 80
      Width = 32
      Height = 13
      Caption = 'Grupo:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object LbNom_Grupo: TsLabel
      Left = 186
      Top = 80
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
    object sbGrupo: TsSpeedButton
      Left = 600
      Top = 77
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
      OnClick = sbGrupoClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object sbFornecedor: TsSpeedButton
      Left = 600
      Top = 54
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
      OnClick = sbFornecedorClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object Label2: TsLabel
      Left = 9
      Top = 34
      Width = 91
      Height = 13
      Caption = 'Produto Descri'#231#227'o:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Prcod_produto: TsComboEdit
      Left = 106
      Top = 8
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
      OnExit = Prcod_produtoExit
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
      OnButtonClick = Prcod_produtoButtonClick
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object edProduto: TsEdit
      Left = 446
      Top = 8
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
    object Prcod_fornecedor: TsComboEdit
      Left = 106
      Top = 54
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
      TabOrder = 3
      Text = ''
      OnExit = Prcod_fornecedorExit
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
      OnButtonClick = Prcod_fornecedorButtonClick
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object Prcod_grupo: TsComboEdit
      Left = 106
      Top = 76
      Width = 77
      Height = 21
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      Text = ''
      OnExit = Prcod_grupoExit
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
      OnButtonClick = Prcod_grupoButtonClick
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object edGrupo: TsEdit
      Left = 446
      Top = 76
      Width = 150
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
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
    object edFornecedor: TsEdit
      Left = 446
      Top = 54
      Width = 150
      Height = 21
      Color = clWhite
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
    object edProdutoDesc: TsEdit
      Left = 106
      Top = 31
      Width = 517
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
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
  object Panel5: TsPanel
    Left = 0
    Top = 106
    Width = 684
    Height = 47
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object btok: TsBitBtn
      Left = 267
      Top = 5
      Width = 112
      Height = 38
      Caption = 'Consulta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
        7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F0000
        000000000000000000000000000000000000000000007F7F7F7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F000000000000000000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF00000000000000000000007F
        7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F000000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000
        00000000007F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF7F7F7F000000000000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF00000000007F7F7F7F7F7F7F7F7FFFFFFF7F7F7F7F7F7FFFFFFFFFFFFF
        FFFFFFFFFFFF7F7F7F000000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF00000000007F7F7F7F7F7F7F7F7F7F7F7F7F0000FFFFFFFFFFFF
        FFFFFF7F7F7F0000007F0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF00000000007F7F7F7F00007F0000FF0000FFFFFFFFFFFF
        7F7F7F0000007F0000FF00007F0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF00007F00007F00007F0000FF0000FFFF00FFFFFFFFFFFF
        7F7F7F000000FF00007F0000FF00007F0000FF0000FF0000FF0000FF0000FF00
        00000000000000000000000000000000000000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF00007F0000FF0000FF0000FFFF00FFFFFFFFFFFF
        000000FF00007F0000FF00007F0000FF00007F0000FF00007F00000000000000
        00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FFFF007F7F7FFFFFFFFFFFFF
        7F00007F00007F00007F0000FF00007F0000FF00007F00000000007F7F7FFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F00007F00007F0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FFFF007F7F7FFFFFFF000000
        7F00007F00007F00007F00007F00007F00007F0000FF00000000007F7F7FFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF7F00007F0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FFFF000000007F7F7FFFFFFF000000
        7F00007F00007F00007F00007F00007F00007F00000000007F7F7F7F7F7FFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FFFF000000007F7F7FFFFFFF000000
        7F00007F0000FFFFFFFFFFFF7F00007F00007F00007F7F7F7F7F7F7F7F7FFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FFFF007F007F0000007F7F7FFFFFFF000000
        7F00007F0000FFFFFFFF00FFFFFFFFFFFFFF7F00000000007F7F7F7F7F7F7F7F
        7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF
        FF00FF0000FF0000FF0000FF0000FFFF007F007F0000007F7F7FFFFFFF000000
        7F0000FFFFFFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFF7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007F
        007FFFFF00FFFF00FF0000FFFF007F007F7F007F0000007F7F7FFFFFFF000000
        7F0000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFF
        FF7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007F
        007F7F007F7F007FFFFF00FFFF007F007F7F007F0000007F7F7FFFFFFF000000
        FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F0000007F
        007F7F007F7F007F7F007F7F007F7F007F7F007F000000FFFFFFFFFFFF000000
        FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF7F007F7F007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F000000FF00FF7F
        007FFF00FF7F007F7F007F7F007F7F007F7F007F000000FFFFFFFFFFFFFFFFFF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F007F7F007F7F00
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F0000007F007FFF
        00FF7F007FFF00FF7F007FFF00FF7F007F000000FFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000000000
        007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F000000000000FF00FFFF00FF7F
        007FFF00FF7F007FFF00FF7F007FFF00FF000000FFFFFFFFFFFFFFFFFFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF000000000000000000000000000000000000FF00FFFF00FFFF00FFFF00FFFF
        00FF7F007FFF00FF7F007FFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFF00FF
        FF00FF7F007FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF7F007FFF00FF7F007F000000FFFFFFFFFFFFFFFFFFFF00FF7F007F
        7F007F7F007F000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF7F007F000000FFFFFFFFFFFFFFFFFFFFFFFF7F007FFFFFFF
        FFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000000000FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000000000000000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentFont = False
      TabOrder = 0
      OnClick = btokClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object Panel2: TsPanel
    Left = 0
    Top = 153
    Width = 684
    Height = 47
    Align = alTop
    TabOrder = 2
    SkinData.SkinSection = 'PANEL'
    ExplicitTop = 155
    object sbAlterar: TsSpeedButton
      Left = 329
      Top = 10
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
    object gbMargemLucro: TsGroupBox
      Left = 231
      Top = 0
      Width = 85
      Height = 44
      Caption = 'Acr'#233'sc'
      TabOrder = 0
      SkinData.SkinSection = 'GROUPBOX'
      object edAcresDesc: TsCurrencyEdit
        Left = 8
        Top = 14
        Width = 65
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
        DisplayFormat = '% ,0.00;-% ,0.00'
      end
    end
  end
  object pnProdutos: TsPanel
    Left = 0
    Top = 200
    Width = 684
    Height = 142
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 3
    SkinData.SkinSection = 'PANEL'
    ExplicitHeight = 97
    object dgProdutos: TDBGrid
      Left = 2
      Top = 19
      Width = 680
      Height = 121
      Align = alClient
      DataSource = dsAcrescimo
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'IDPRODUTO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Width = 37
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_PRODUTO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 328
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CUSTO_TOTAL'
          Title.Alignment = taCenter
          Title.Caption = 'Custo'
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECO_VENDA'
          Title.Alignment = taCenter
          Title.Caption = 'Pr.Venda'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MARGEM_LUCRO'
          Title.Caption = '(%)Lucro '
          Width = 52
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DTA_ALT_PRECO'
          Title.Alignment = taCenter
          Title.Caption = 'Ult.Alt.Pre'#231'o'
          Width = 80
          Visible = True
        end>
    end
    object pncabProdutos: TPanel
      Left = 2
      Top = 2
      Width = 680
      Height = 17
      Align = alTop
      Caption = 'PRODUTOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 160
      ExplicitTop = 80
      ExplicitWidth = 185
    end
  end
  object Panel1: TsPanel
    Left = 0
    Top = 439
    Width = 684
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 4
    SkinData.SkinSection = 'PANEL'
    object btnSalvar: TsSpeedButton
      Left = 213
      Top = 6
      Width = 97
      Height = 30
      Caption = 'Salvar'
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
      OnClick = btnSalvarClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object sbSair: TsSpeedButton
      Left = 329
      Top = 6
      Width = 86
      Height = 30
      Caption = 'Sair'
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
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
        0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
        0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
        0333337F777FFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
      ParentFont = False
      OnClick = sbSairClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
  end
  object pnHistorico: TsPanel
    Left = 0
    Top = 342
    Width = 684
    Height = 97
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 5
    SkinData.SkinSection = 'PANEL'
    ExplicitTop = 208
    object pnCabHistorico: TPanel
      Left = 2
      Top = 2
      Width = 680
      Height = 17
      Align = alTop
      Caption = 'HIST'#211'RICO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object dgHistorico: TDBGrid
      Left = 2
      Top = 19
      Width = 680
      Height = 76
      Align = alClient
      Color = clWhite
      DataSource = dsHistPrec
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'DATAHORA'
          Title.Alignment = taCenter
          Title.Caption = 'Data Hora'
          Width = 99
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'USUARIO'
          Title.Caption = 'Usu'#225'rio'
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CUSTO'
          Title.Alignment = taCenter
          Title.Caption = 'Custo'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IMPOSTOS'
          Title.Alignment = taCenter
          Title.Caption = 'Impostos'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IPI'
          Title.Alignment = taCenter
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OUTROS'
          Title.Alignment = taCenter
          Title.Caption = 'Outros'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CUSTO_TOTAL'
          Title.Alignment = taCenter
          Title.Caption = 'Custo Total'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LUCRO'
          Title.Alignment = taCenter
          Title.Caption = 'Lucro'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECO_VENDA'
          Title.Alignment = taCenter
          Title.Caption = 'Pre'#231'o Venda'
          Width = 72
          Visible = True
        end>
    end
  end
  object mmAcrescimo: TRxMemoryData
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'NR_CONEXAO'
        DataType = ftInteger
      end
      item
        Name = 'REPRESENTANTE'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DATA_CONEXAO'
        DataType = ftDate
      end
      item
        Name = 'HORA'
        DataType = ftTime
      end
      item
        Name = 'QTDE_PEDIDOS'
        DataType = ftInteger
      end
      item
        Name = 'QTDE_VISITAS_NEGATIVAS'
        DataType = ftInteger
      end
      item
        Name = 'check'
        DataType = ftBoolean
      end>
    AfterScroll = mmAcrescimoAfterScroll
    Left = 512
    Top = 136
    object mmAcrescimoIDPRODUTO: TIntegerField
      FieldName = 'IDPRODUTO'
    end
    object mmAcrescimoNOME_PRODUTO: TStringField
      DisplayWidth = 400
      FieldName = 'NOME_PRODUTO'
      Size = 100
    end
    object mmAcrescimoCUSTO_TOTAL: TCurrencyField
      FieldName = 'CUSTO_TOTAL'
    end
    object mmAcrescimoPRECO_VENDA: TCurrencyField
      FieldName = 'PRECO_VENDA'
    end
    object mmAcrescimoMARGEM_LUCRO: TFloatField
      FieldName = 'MARGEM_LUCRO'
      DisplayFormat = '#0.00%'
    end
    object mmAcrescimoCUSTO: TCurrencyField
      FieldName = 'CUSTO'
    end
    object mmAcrescimoDTA_ALT_PRECO: TDateField
      FieldName = 'DTA_ALT_PRECO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object mmAcrescimoCUSTO_SUBTOTAL: TCurrencyField
      FieldName = 'CUSTO_SUBTOTAL'
    end
  end
  object dsAcrescimo: TDataSource
    AutoEdit = False
    DataSet = mmAcrescimo
    Left = 544
    Top = 136
  end
  object mmHistPrec: TRxMemoryData
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'NR_CONEXAO'
        DataType = ftInteger
      end
      item
        Name = 'REPRESENTANTE'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DATA_CONEXAO'
        DataType = ftDate
      end
      item
        Name = 'HORA'
        DataType = ftTime
      end
      item
        Name = 'QTDE_PEDIDOS'
        DataType = ftInteger
      end
      item
        Name = 'QTDE_VISITAS_NEGATIVAS'
        DataType = ftInteger
      end
      item
        Name = 'check'
        DataType = ftBoolean
      end>
    Left = 352
    Top = 256
    object mmHistPrecDATAHORA: TDateTimeField
      FieldName = 'DATAHORA'
      DisplayFormat = 'dd/mm/yyyy hh:mm:ss'
    end
    object mmHistPrecUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 60
    end
    object mmHistPrecCUSTO: TCurrencyField
      FieldName = 'CUSTO'
    end
    object mmHistPrecIMPOSTOS: TCurrencyField
      FieldName = 'IMPOSTOS'
      DisplayFormat = '##0.00%'
      currency = False
    end
    object mmHistPrecIPI: TCurrencyField
      FieldName = 'IPI'
      DisplayFormat = '##0.00%'
      currency = False
    end
    object mmHistPrecOUTROS: TCurrencyField
      FieldName = 'OUTROS'
      DisplayFormat = '##0.00%'
      currency = False
    end
    object mmHistPrecCUSTO_TOTAL: TCurrencyField
      FieldName = 'CUSTO_TOTAL'
    end
    object mmHistPrecLUCRO: TFloatField
      FieldName = 'LUCRO'
      DisplayFormat = '##0.00%'
    end
    object mmHistPrecPRECO_VENDA: TCurrencyField
      FieldName = 'PRECO_VENDA'
    end
  end
  object dsHistPrec: TDataSource
    AutoEdit = False
    DataSet = mmHistPrec
    Left = 288
    Top = 224
  end
end
