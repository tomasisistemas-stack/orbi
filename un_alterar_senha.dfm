object fm_alterar_senha: Tfm_alterar_senha
  Left = 331
  Top = 283
  Width = 653
  Height = 117
  Caption = 'Alterar Senha e Email.'
  Color = clBtnFace
  BorderIcons = [biSystemMenu]
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
  object Panel1: TsPanel
    Left = 0
    Top = 51
    Width = 645
    Height = 39
    Align = alBottom
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object BTGRAUSU: TsBitBtn
      Left = 200
      Top = 4
      Width = 75
      Height = 31
      Caption = '&Gravar'
      TabOrder = 0
      OnClick = BTGRAUSUClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000C40E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
        2222220000000000000220330000008803022033000000880302203300000088
        0302203300000000030220333333333333022033000000003302203088888888
        0302203088888888030220308888888803022030888888880302203088888888
        0002203088888888080220000000000000022222222222222222}
      SkinData.SkinSection = 'BUTTON'
    end
    object BTCANUSU: TsBitBtn
      Left = 284
      Top = 4
      Width = 75
      Height = 31
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = BTCANUSUClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000D80E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777777777777777777777777777777777777
        7777777777777778477777444447777748777744447777777477774447777777
        7477774474777777747777477748777748777777777844448777777777777777
        7777777777777777777777777777777777777777777777777777}
      SkinData.SkinSection = 'BUTTON'
    end
    object BitBtn1: TsBitBtn
      Left = 369
      Top = 4
      Width = 75
      Height = 31
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BitBtn1Click
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
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object Panel2: TsPanel
    Left = 0
    Top = 0
    Width = 645
    Height = 51
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object GroupBox1: TsGroupBox
      Left = 5
      Top = 4
      Width = 132
      Height = 43
      Caption = 'Usu'#225'rio'
      TabOrder = 0
      SkinData.SkinSection = 'GROUPBOX'
      object DENOMUSU: TsLabel
        Left = 6
        Top = 18
        Width = 13
        Height = 13
        Caption = '...'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
      end
    end
    object GroupBox2: TsGroupBox
      Left = 141
      Top = 4
      Width = 123
      Height = 42
      Caption = 'Senha Usuario'
      TabOrder = 1
      SkinData.SkinSection = 'GROUPBOX'
      object DESENUSU: TsEdit
        Left = 5
        Top = 14
        Width = 113
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        PasswordChar = '*'
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
    object GroupBox3: TsGroupBox
      Left = 268
      Top = 4
      Width = 124
      Height = 42
      Caption = 'Senha Especial'
      TabOrder = 2
      SkinData.SkinSection = 'GROUPBOX'
      object DESENFAT: TsEdit
        Left = 5
        Top = 13
        Width = 113
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        PasswordChar = '*'
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
    object sGroupBox1: TsGroupBox
      Left = 395
      Top = 4
      Width = 246
      Height = 42
      Caption = 'Email'
      TabOrder = 3
      SkinData.SkinSection = 'GROUPBOX'
      object DEEMAIL: TsEdit
        Left = 5
        Top = 13
        Width = 235
        Height = 21
        CharCase = ecLowerCase
        Color = clWhite
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
  end
end
