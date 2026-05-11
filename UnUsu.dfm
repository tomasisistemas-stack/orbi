object FRUSU: TFRUSU
  Left = 328
  Top = 151
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Usu'#225'rios.'
  ClientHeight = 132
  ClientWidth = 570
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GBDADUSU: TsGroupBox
    Left = 0
    Top = 0
    Width = 570
    Height = 91
    Align = alClient
    Caption = 'Dados Usuario'
    TabOrder = 0
    SkinData.SkinSection = 'GROUPBOX'
    ExplicitWidth = 805
    ExplicitHeight = 349
    object Label1: TsLabel
      Left = 6
      Top = 18
      Width = 44
      Height = 13
      Caption = 'C'#243'd.Usu:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Label2: TsLabel
      Left = 7
      Top = 41
      Width = 39
      Height = 13
      Caption = 'Usuario:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Label3: TsLabel
      Left = 171
      Top = 40
      Width = 73
      Height = 13
      Caption = 'Senha Usuario:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Label4: TsLabel
      Left = 375
      Top = 39
      Width = 77
      Height = 13
      Caption = 'Senha Especial:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Label12: TsLabel
      Left = 8
      Top = 65
      Width = 26
      Height = 13
      Caption = 'Loja :'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Lbnom_empresa: TsLabel
      Left = 125
      Top = 64
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
    object Label34: TsLabel
      Left = 109
      Top = 16
      Width = 31
      Height = 13
      Caption = 'Nome:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Label36: TsLabel
      Left = 419
      Top = 15
      Width = 42
      Height = 13
      Caption = 'Telefone'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Label39: TsLabel
      Left = 195
      Top = 64
      Width = 84
      Height = 13
      Caption = 'Vendedor Assoc.:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Lbnom_representante: TsLabel
      Left = 364
      Top = 64
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
    object sLabel1: TsLabel
      Left = 488
      Top = 64
      Width = 29
      Height = 13
      Caption = 'N'#237'vel:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object PrNivel: TsEdit
      Left = 523
      Top = 62
      Width = 42
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      Text = 'PrNivel'
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
    object PrCODUSU: TsEdit
      Left = 53
      Top = 12
      Width = 52
      Height = 21
      Color = clWhite
      Enabled = False
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
    object PrLOGUSU: TsEdit
      Left = 53
      Top = 37
      Width = 112
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnKeyPress = IB_ComboBox9KeyPress
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
    object PrSENUSU: TsEdit
      Left = 248
      Top = 37
      Width = 112
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      PasswordChar = '#'
      TabOrder = 4
      OnKeyPress = IB_ComboBox9KeyPress
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
    object PrSENESP: TsEdit
      Left = 458
      Top = 37
      Width = 108
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      PasswordChar = '#'
      TabOrder = 5
      OnKeyPress = IB_ComboBox9KeyPress
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
    object Prcod_empresa: TsComboEdit
      Left = 53
      Top = 62
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
      TabOrder = 6
      Text = ''
      OnExit = Prcod_empresaExit
      OnKeyPress = IB_ComboBox9KeyPress
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
      OnButtonClick = Prcod_empresaButtonClick
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object PrNOME: TsEdit
      Left = 142
      Top = 12
      Width = 271
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
      OnKeyPress = IB_ComboBox9KeyPress
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
    object PrFONE: TsEdit
      Left = 466
      Top = 12
      Width = 100
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
      OnKeyPress = IB_ComboBox9KeyPress
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
    object Prcod_representante: TsComboEdit
      Left = 282
      Top = 62
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
      TabOrder = 7
      Text = ''
      OnExit = Prcod_representanteExit
      OnKeyPress = Prcod_representanteKeyPress
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
      OnButtonClick = Prcod_representanteButtonClick
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
  end
  object sPanel1: TsPanel
    Left = 0
    Top = 91
    Width = 570
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    ExplicitTop = 349
    ExplicitWidth = 805
    object BTNOVUSU: TsBitBtn
      Left = 25
      Top = 6
      Width = 75
      Height = 31
      Caption = '&Nov.Usu'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888888888888888888800000000000888880FFFFFFFFF0888880FFFFFFFFF
        0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF
        0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFF0000888880FFFFFF0F0
        8888880FFFFFF008888888000000008888888888888888888888}
      TabOrder = 0
      OnClick = BTNOVUSUClick
      SkinData.SkinSection = 'BUTTON'
    end
    object BTALTUSU: TsBitBtn
      Left = 99
      Top = 6
      Width = 75
      Height = 31
      Caption = '&Alt.Usu'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000CE0E0000C40E00000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000
        00000000000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0000000000000C0C0C0C0C0C0000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0808000808000808000808000808000000000000000FFFF
        FFC0C0C0000000000000C0C0C0C0C0C0C0C0C0808000808000C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0808000808000000000000000000000000000C0C0C0C0C0C0
        808000C0C0C0808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C08080
        00000000000000C0C0C0C0C0C0808000C0C0C0008080000000000000808080C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808000C0C0C0C0C0C0C0C0C0808000
        C0C0C0C0C0C0008080808080000000000000000000000000000000C0C0C0C0C0
        C0808000C0C0C0C0C0C0808000C0C0C0C0C0C0C0C0C000808080808000000000
        0000000000000000000000C0C0C0C0C0C0C0C0C0808000C0C0C0808000C0C0C0
        C0C0C0C0C0C0C0C0C000808000FFFF00FFFF00FFFFC0C0C00080800000008080
        80C0C0C0808000C0C0C0808000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0008080FF
        FFFF00FFFF00FFFFC0C0C0008080000000000000808000C0C0C0808000C0C0C0
        C0C0C0FFFFFFFFFFFFC0C0C0C0C0C0008080FFFFFF00FFFFFFFFFF00FFFF0000
        00000000808000C0C0C0C0C0C0808000C0C0C0FFFFFFFFFFFFFFFFFFC0C0C0C0
        C0C0008080FFFFFF00FFFF000000000000808000800000000000C0C0C0808000
        C0C0C0C0C0C0FFFFFFFFFFFFC0C0C0C0C0C0C0C0C00080800000000000000000
        00808000800000800000C0C0C0C0C0C0808000C0C0C0C0C0C0FFFFFFC0C0C0C0
        C0C0C0C0C0808080000000000000808000FF0000FF0000800000C0C0C0C0C0C0
        C0C0C0808000808000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808000808000C0C0
        C0800000FF0000FF0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C080800080800080
        8000808000808000C0C0C0800000800000C0C0C0800000FF0000}
      TabOrder = 1
      OnClick = BTALTUSUClick
      SkinData.SkinSection = 'BUTTON'
    end
    object BTGRAUSU: TsBitBtn
      Left = 173
      Top = 6
      Width = 75
      Height = 31
      Caption = '&Gra.Usu'
      Enabled = False
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000C40E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
        2222220000000000000220330000008803022033000000880302203300000088
        0302203300000000030220333333333333022033000000003302203088888888
        0302203088888888030220308888888803022030888888880302203088888888
        0002203088888888080220000000000000022222222222222222}
      TabOrder = 2
      OnClick = BTGRAUSUClick
      SkinData.SkinSection = 'BUTTON'
    end
    object BTCANUSU: TsBitBtn
      Left = 247
      Top = 6
      Width = 75
      Height = 31
      Caption = '&Can.Usu'
      Enabled = False
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000D80E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777777777777777777777777777777777777
        7777777777777778477777444447777748777744447777777477774447777777
        7477774474777777747777477748777748777777777844448777777777777777
        7777777777777777777777777777777777777777777777777777}
      TabOrder = 3
      OnClick = BTCANUSUClick
      SkinData.SkinSection = 'BUTTON'
    end
    object BTEXCUSU: TsBitBtn
      Left = 321
      Top = 6
      Width = 75
      Height = 31
      Caption = '&Exc.Usu'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
        03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
        33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
        0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
        3333333337FFF7F3333333333000003333333333377777333333}
      NumGlyphs = 2
      TabOrder = 4
      OnClick = BTEXCUSUClick
      SkinData.SkinSection = 'BUTTON'
    end
    object BtLocalizar: TsBitBtn
      Left = 491
      Top = 6
      Width = 75
      Height = 31
      Caption = 'localizar'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF0975A7075C840C6F9DFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0670A43F
        9AB86E533B15212618769FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0670A431CDFF50A8BFFFDAA07C5F451B3B4CFF00FF0052
        86005286FF00FFFF00FFFF00FFFF00FFFF00FF0670A42FBFF028ACDF59D2FE78
        C9E7E3BB8FD7A8792832391D7BAB0052860052860A587EFF00FFFF00FFFF00FF
        0670A443D0FE6CDEFF5CB4DBAEDDF3F1FFFFDEDBD59B88732C5F765FBDE665BF
        E083756117161504557F0C7BAE2998C877DDFFA3E5FFCFF1FFDBF0F95AA9C8B1
        D8E98BCAE5379AC61AABDA4AD0FF2EB8E7D0BE9D7C5639023B57086C9F0670A4
        CDEBF9FAFFFFF2FCFFDBF5FF60BDE00697C6008EBC0089B80BA9D534C7FA33CF
        FF7EB8BF8B6B4C0142620670A4BCDBEA0670A4A1D2E693D9F772DBFF53D6FF33
        C0F1189CCE058CBC00A0CB1FB5E437CBFC23B1E51A6687025F8FFF00FF0670A4
        0670A40670A426A1D226ADE031C2F537C9FB34C4F72AB5E7128DBE0172A10F7B
        AFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0E85B80C7EB213
        93C50B8DC0006C9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      TabOrder = 5
      OnClick = BtLocalizarClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object dsusus: TDataSource
    DataSet = QUUSU
    Left = 168
    Top = 62
  end
  object QUUSU: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'select * from tbusu')
    Left = 134
    Top = 64
  end
end
