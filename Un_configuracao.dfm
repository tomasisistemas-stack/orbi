object Fr_configuracao: TFr_configuracao
  Left = 319
  Top = 99
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Configura'#231#245'es do Sistema'
  ClientHeight = 516
  ClientWidth = 683
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TsPanel
    Left = 0
    Top = 475
    Width = 683
    Height = 41
    Align = alBottom
    TabOrder = 0
    TabStop = True
    SkinData.SkinSection = 'PANEL'
    object Button1: TsButton
      Left = 281
      Top = 6
      Width = 121
      Height = 30
      Caption = 'Gravar Altera'#231#245'es '
      TabOrder = 0
      OnClick = Button1Click
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object PageControl1: TsPageControl
    Left = 0
    Top = 0
    Width = 683
    Height = 475
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    SkinData.SkinSection = 'PAGECONTROL'
    object TabSheet1: TsTabSheet
      Caption = 'Geral'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object Panel2: TsPanel
        Left = 0
        Top = 0
        Width = 675
        Height = 447
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 0
        TabStop = True
        SkinData.SkinSection = 'PANEL'
        object sbImagem: TsSpeedButton
          Left = 282
          Top = 185
          Width = 23
          Height = 25
          Hint = 'Carregar Imagem'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            5555555555555555555555555555555555555555555555555555555555555555
            555555555555555555555555555555555555555FFFFFFFFFF555550000000000
            55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
            B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
            000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
            555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
            55555575FFF75555555555700007555555555557777555555555555555555555
            5555555555555555555555555555555555555555555555555555}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sbImagemClick
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object gbCaminhoZebra: TsGroupBox
          Left = 5
          Top = 11
          Width = 332
          Height = 42
          Caption = 'Local Impressora Zebra 1'
          TabOrder = 0
          SkinData.SkinSection = 'GROUPBOX'
          object PrCaminho_Cod_Barras: TsEdit
            Left = 6
            Top = 15
            Width = 321
            Height = 21
            TabStop = False
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
        object gbSite: TsGroupBox
          Left = 5
          Top = 53
          Width = 309
          Height = 42
          Caption = 'Site'
          TabOrder = 1
          SkinData.SkinSection = 'GROUPBOX'
          object PrSite: TsEdit
            Left = 6
            Top = 15
            Width = 297
            Height = 21
            TabStop = False
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
        object gbUsuarioSite: TsGroupBox
          Left = 316
          Top = 53
          Width = 89
          Height = 42
          Caption = 'Usu'#225'rio Site'
          TabOrder = 2
          SkinData.SkinSection = 'GROUPBOX'
          object PrUsuario_Site: TsEdit
            Left = 6
            Top = 15
            Width = 78
            Height = 21
            TabStop = False
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
        object gbSenhaSite: TsGroupBox
          Left = 407
          Top = 53
          Width = 84
          Height = 42
          Caption = 'Senha Site'
          TabOrder = 3
          SkinData.SkinSection = 'GROUPBOX'
          object PrLogin_Site: TsEdit
            Left = 6
            Top = 15
            Width = 71
            Height = 21
            TabStop = False
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
        object gbLogo: TsGroupBox
          Left = 280
          Top = 213
          Width = 221
          Height = 203
          Caption = 'Logo'
          TabOrder = 9
          SkinData.SkinSection = 'GROUPBOX'
          object BtAnt: TsSpeedButton
            Left = 21
            Top = 272
            Width = 35
            Height = 25
            Flat = True
            Glyph.Data = {
              360C0000424D360C000000000000360000002800000020000000200000000100
              180000000000000C0000130B0000130B00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666
              6666666666666666666666666666666666666666666666666666666666666666
              6666666666666666666666666666666666666666666666666666666666666666
              6666666666666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666
              FFFFFF4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A3A9A613A9A613A9A613A9A
              614FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4F
              BA7AFFFFFF6D615C925C428D5439FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666
              FFFFFF4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A3A9A613A9A613A9A613A9A614FBA
              7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4F
              BA7AFFFFFF875237BC9A818A5034FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666
              FFFFFF4FBA7A4FBA7A4FBA7A4FBA7A3A9A613A9A613A9A613A9A614FBA7A4FBA
              7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4F
              BA7A915B41A97F65DBC7B08A5034FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666
              FFFFFF4FBA7A4FBA7A4FBA7A4FBA7A3A9A613A9A613A9A613A9A614FBA7A4FBA
              7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A85
              593AA77D63D6C2ACDBC7B08A5034FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666
              FFFFFF4CA8774CA8774CA8774CA877347B9A549FD3549FD3347B9A3F9A673F9A
              673F9A673F9A673F9A6757946D57946D57946D57946D57946D618662865537A5
              7C62D1BEA7CAA686DBC7B0AD836995604797634A8A5034FFFFFFFFFFFF666666
              FFFFFFF9EAE1F9EAE1F9EAE1F9EAE1347B9A549FD3549FD3347B9AF9EAE1F9EA
              E1F9EAE1F9EAE1F9EAE1F9EAE1F9EAE1F9EAE1F9EAE1F9EAE1935D41B19077CC
              BAA3C3A080C39772D1AD8CDFCBB4DAC1ABD8BFA98A5034FFFFFFFFFFFF666666
              FFFFFFF6E3D7F6E3D7F6E3D7F6E3D7568380418B87418B87568380F6E3D7F6E3
              D7F6E3D7F6E3D7F6E3D7F6E3D7F6E3D7F6E3D7F6E3D7925B3FA47B61C9B8A1B6
              8A63BC906AC39772CB9F79D1A680D8B18FE2CDB78A5034FFFFFFFFFFFF666666
              FFFFFFF6DECEF6DECEF6DECE63C58F4FBA7A4FBA7A4AAB713A9A613A9A61F6DE
              CEF6DECEF6DECEF6DECEF6DECEF6DECEF6DECE9B674DA47B61C9B8A1BA9876B6
              8A63BC906AC39772CB9F79D1A680D5AA84E2CDB78A5034FFFFFFFFFFFF666666
              FFFFFFF9D5BFF9D5BF7DCDA063C58F65BD8A4FBA7A4AAB714AAB713A9A613A9A
              61F9D5BFF9D5BFF9D5BFF9D5BFF9D5BFF9D5BFF9D5BF935A3EA47B61C9B8A1BE
              9B7ABC906AC39772CB9F79D1A680D8B18FE2CDB78A5034FFFFFFFFFFFF666666
              FFFFFFF1C9B0F1C9B0ACD4B563C58F65BD8A4FBA7A4FBA7A4AAB714AAB713A9A
              61F1C9B0F1C9B0F1C9B0F1C9B0F1C9B0F1C9B0F1C9B0F1C9B0935A3EA47B61CC
              BAA3C3A080C39772CDA581DFCBB4D9C1AAD8BFA88A5034FFFFFFFFFFFF666666
              FFFFFFE7BB9FE7BB9FACD4B57DCDA065BD8A65BD8A4FBA7A4FBA7A4AAB713A9A
              61E7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9F91573CA5
              7C62D1BEA7CAA686DBC7B0B6907795614897644B8A5034FFFFFFFFFFFF666666
              FFFFFFE7BB9FE7BB9FACD4B57DCDA063C58F65BD8A65BD8A65BD8A4AAB713A9A
              61E7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9F92
              5A3EA77D63D6C2ACDBC7B0935E41F2ECE9FFFFFFFFFFFFFFFFFFFFFFFF666666
              FFFFFFE7BB9FE7BB9FE7BB9FACD4B57DCDA063C58F63C58F63C58F3A9A61E7BB
              9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7
              BB9F925C41A97F65DBC7B08A5034FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666
              FFFFFFE7BB9FE7BB9FE7BB9FE7BB9FACD4B57DCDA07DCDA07DCDA0E7BB9FE7BB
              9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7
              BB9FFFFFFF875238AB81678A5034FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666
              FFFFFFE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB
              9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7
              BB9FFFFFFF666666935D438D553AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666
              6666666666666666666666666666666666666666666666666666666666666666
              6666666666666666666666666666666666666666666666666666666666666666
              6666666666666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            Visible = False
            SkinData.SkinSection = 'SPEEDBUTTON'
          end
          object SpeedButton1: TsSpeedButton
            Left = 60
            Top = 272
            Width = 34
            Height = 25
            Flat = True
            Glyph.Data = {
              360C0000424D360C000000000000360000002800000020000000200000000100
              180000000000000C0000130B0000130B00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              6666666666666666666666666666666666666666666666666666666666666666
              6666666666666666666666666666666666666666666666666666666666666666
              6666666666666666666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              666666FFFFFF4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A3A9A613A9A613A9A
              613A9A614FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A88533586
              57384FBA7AFFFFFF666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              666666FFFFFF4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A3A9A613A9A613A9A613A9A
              614FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A8A5034A5
              7C62855A3AFFFFFF666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              666666FFFFFF4FBA7A4FBA7A4FBA7A4FBA7A3A9A613A9A613A9A613A9A614FBA
              7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A8A5034CC
              BAA3A77D63925C41666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              666666FFFFFF4FBA7A4FBA7A4FBA7A4FBA7A3A9A613A9A613A9A613A9A614FBA
              7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A4FBA7A54AE72915B3FCC
              BAA3D1BEA7A97F65875238FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              666666FFFFFF4CA8774CA8774CA8774CA877347B9A549FD3549FD3347B9A3F9A
              673F9A673F9A673F9A673F9A6757946D57946D8A503484573A85573AAB866DCC
              BAA3C3A080D6C2ACAB8167935D43FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              666666FFFFFFF9EAE1F9EAE1F9EAE1F9EAE1347B9A549FD3549FD3347B9AF9EA
              E1F9EAE1F9EAE1F9EAE1F9EAE1F9EAE1F9EAE18A5034C2AC95C3AE96C9B8A1B9
              916CBC906ACAA686DBC7B0AD8369945F46FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              666666FFFFFFF6E3D7F6E3D7F6E3D7F6E3D7568380418B87418B87568380F6E3
              D7F6E3D7F6E3D7F6E3D7F6E3D7F6E3D7F6E3D78A5034C9B8A1B7906DB2865FB6
              8A63BC906AC39772D1AD8CDFCBB4AE836A935E44FFFFFFFFFFFFFFFFFFFFFFFF
              666666FFFFFFF6DECEF6DECEF6DECE63C58F4FBA7A4FBA7A4AAB713A9A613A9A
              61F6DECEF6DECEF6DECEF6DECEF6DECEF6DECE8A5034C9B8A1B2865FB2865FB6
              8A63BC906AC39772CB9F79D6B392E2CDB7AE836A9D6C55FFFFFFFFFFFFFFFFFF
              666666FFFFFFF9D5BFF9D5BF7DCDA063C58F65BD8A4FBA7A4AAB714AAB713A9A
              613A9A61F9D5BFF9D5BFF9D5BFF9D5BFF9D5BF8A5034C9B8A1B7906DB2865FB6
              8A63BC906AC39772CB9F79DFCBB4AE836A935D43FFFFFFFFFFFFFFFFFFFFFFFF
              666666FFFFFFF1C9B0F1C9B0ACD4B563C58F65BD8A4FBA7A4FBA7A4AAB714AAB
              713A9A61F1C9B0F1C9B0F1C9B0F1C9B0F1C9B08A5034C2AD95C3AE97C9B8A1BE
              9B7ABC906ACAA686DBC7B0BE9B82945E45FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              666666FFFFFFE7BB9FE7BB9FACD4B57DCDA065BD8A65BD8A4FBA7A4FBA7A4AAB
              713A9A61E7BB9FE7BB9FE7BB9FE7BB9FE7BB9F8A5034945C3F935A3EA47B61CC
              BAA3C3A080D6C2ACAB8167925C42E8DCD6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              666666FFFFFFE7BB9FE7BB9FACD4B57DCDA063C58F65BD8A65BD8A65BD8A4AAB
              713A9A61E7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9F8A5034CC
              BAA3D1BEA7A97F65875237FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              666666FFFFFFE7BB9FE7BB9FE7BB9FACD4B57DCDA063C58F63C58F63C58F3A9A
              61E7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9F8A5034CC
              BAA3A77D63915B41666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              666666FFFFFFE7BB9FE7BB9FE7BB9FE7BB9FACD4B57DCDA07DCDA07DCDA0E7BB
              9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9F8A5034B3
              927992593CFFFFFF666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              666666FFFFFFE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB
              9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9FE7BB9F8C533791
              573CD4A589FFFFFF666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              6666666666666666666666666666666666666666666666666666666666666666
              6666666666666666666666666666666666666666666666666666666666666666
              6666666666666666666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            Visible = False
            SkinData.SkinSection = 'SPEEDBUTTON'
          end
          object Label15: TsLabel
            Left = 9
            Top = 299
            Width = 196
            Height = 13
            Caption = 'Clique 2x na Imagem para Ampliar.'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
          end
          object zzDescricao: TsEdit
            Left = 115
            Top = 271
            Width = 226
            Height = 21
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            Visible = False
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
          object BtExc_fot: TsBitBtn
            Left = 330
            Top = 208
            Width = 75
            Height = 25
            Caption = 'Excluir'
            TabOrder = 4
            SkinData.SkinSection = 'BUTTON'
          end
          object BtCan_fot: TsBitBtn
            Left = 330
            Top = 184
            Width = 75
            Height = 25
            Caption = 'Cancelar'
            Enabled = False
            TabOrder = 3
            SkinData.SkinSection = 'BUTTON'
          end
          object BtGra_fot: TsBitBtn
            Left = 330
            Top = 160
            Width = 75
            Height = 25
            Caption = 'Gravar'
            Enabled = False
            TabOrder = 2
            SkinData.SkinSection = 'BUTTON'
          end
          object BtAlt_fot: TsBitBtn
            Left = 330
            Top = 136
            Width = 75
            Height = 25
            Caption = 'Alterar'
            TabOrder = 1
            SkinData.SkinSection = 'BUTTON'
          end
          object bt_Sel_foto: TsBitBtn
            Left = 330
            Top = 68
            Width = 75
            Height = 65
            Caption = 'bt_Sel_foto'
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000420B0000420B0000000100000001000000730800087B
              080008841000088C100008A51800108C2100109C210018AD290031C64A0042D6
              6B0052D67B005AE78C0018A5C60018ADD60021ADD60029ADD60031B5DE0052BD
              E7004AC6E7004AC6EF009CDEEF00ADDEEF006BDEF70073DEF700A5EFF700FF00
              FF0084EFFF008CEFFF0094EFFF008CF7FF0094F7FF00A5F7FF0094FFFF009CFF
              FF00ADFFFF00C6FFFF00D6FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00191919191919
              19191919191919191919190F100E191919191919191919191919190F141A120E
              0C0C0C19191919191919190F11212017171717120E0C19191919190F11221D1B
              1B1B171717130E191919190F0F151E1E1B1B1B1B171713191919190F170F211D
              1D1D1B1B1B17170C1919190F1E0F1518181F1B1B1B17000C1919190F21170F0C
              0C0C151D1A000B000C19190F211E171717160F15000A09080019190F211E1E1E
              1E17170F0C0508060C19190F23202124241B1C17170207021919190E14232314
              0D0C0C0C0C03041919191919100F0C0C19191919030402191919191919191919
              1900010303011919191919191919191919191919191919191919}
            Layout = blGlyphTop
            TabOrder = 6
            SkinData.SkinSection = 'BUTTON'
          end
          object BtIns_fot: TsBitBtn
            Left = 330
            Top = 40
            Width = 75
            Height = 25
            Caption = 'Inserir'
            TabOrder = 0
            SkinData.SkinSection = 'BUTTON'
          end
          object Panel7: TsPanel
            Left = 2
            Top = 15
            Width = 217
            Height = 186
            Align = alClient
            BevelInner = bvLowered
            Color = clWhite
            TabOrder = 7
            SkinData.SkinSection = 'PANEL'
            object Shape1: TShape
              Left = 2
              Top = 2
              Width = 213
              Height = 182
              Align = alClient
              Pen.Color = clWhite
            end
            object Logo: TImage
              Left = 2
              Top = 2
              Width = 213
              Height = 182
              Align = alClient
              Center = True
              Proportional = True
              Transparent = True
            end
          end
        end
        object PrAgrupar_Pedidos: TsCheckBox
          Left = 503
          Top = 212
          Width = 104
          Height = 20
          Caption = 'Agrupar Pedidos?'
          TabOrder = 10
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object gbFTPTabletHost: TsGroupBox
          Left = 4
          Top = 95
          Width = 357
          Height = 42
          Caption = 'FTP Tablet Host'
          TabOrder = 6
          SkinData.SkinSection = 'GROUPBOX'
          object PrFTP_TABLET_HOST: TsEdit
            Left = 6
            Top = 15
            Width = 345
            Height = 21
            TabStop = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 50
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
        object gbFTPTabletUsuario: TsGroupBox
          Left = 367
          Top = 95
          Width = 150
          Height = 42
          Caption = 'FTP Tablet Usu'#225'rio'
          TabOrder = 7
          SkinData.SkinSection = 'GROUPBOX'
          object PrFTP_TABLET_USER: TsEdit
            Left = 6
            Top = 15
            Width = 138
            Height = 21
            TabStop = False
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
        object gbFTPNFeHost: TsGroupBox
          Left = 4
          Top = 137
          Width = 357
          Height = 42
          Caption = 'FTP NFe Host'
          TabOrder = 11
          SkinData.SkinSection = 'GROUPBOX'
          object PrFTP_NFE_HOST: TsEdit
            Left = 6
            Top = 15
            Width = 345
            Height = 21
            TabStop = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 50
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
        object gbFTPNFeUsuario: TsGroupBox
          Left = 363
          Top = 137
          Width = 156
          Height = 42
          Caption = 'FTP NFe Usu'#225'rio'
          TabOrder = 12
          SkinData.SkinSection = 'GROUPBOX'
          object PrFTP_NFE_USUARIO: TsEdit
            Left = 6
            Top = 15
            Width = 145
            Height = 21
            TabStop = False
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
        object gbFTPNFeSenha: TsGroupBox
          Left = 521
          Top = 137
          Width = 150
          Height = 42
          Caption = 'FTP NFe Senha'
          TabOrder = 13
          SkinData.SkinSection = 'GROUPBOX'
          object PrFTP_NFE_SENHA: TsEdit
            Left = 6
            Top = 15
            Width = 138
            Height = 21
            TabStop = False
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
        object sGroupBox6: TsGroupBox
          Left = 339
          Top = 11
          Width = 332
          Height = 42
          Caption = 'Local Impressora Zebra 2'
          TabOrder = 16
          SkinData.SkinSection = 'GROUPBOX'
          object PrCaminho_Cod_Barras2: TsEdit
            Left = 8
            Top = 15
            Width = 318
            Height = 21
            TabStop = False
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
        object PrMOSTRA_MARCA_NO_PEDIDO: TsCheckBox
          Left = 503
          Top = 230
          Width = 145
          Height = 20
          Caption = 'Mostrar Marca no Pedido?'
          TabOrder = 17
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object PrTINTA_BASE: TsCheckBox
          Left = 503
          Top = 248
          Width = 154
          Height = 20
          Caption = 'Controle de Base de Tintas?'
          TabOrder = 18
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object PrATUALIZAR_PRECO_NA_ENTRADA: TsCheckBox
          Left = 503
          Top = 266
          Width = 152
          Height = 20
          Caption = 'Atualizar Pre'#231'o na Entrada?'
          TabOrder = 19
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object PrOBRIGATORIEDADE_PESO: TsCheckBox
          Left = 503
          Top = 284
          Width = 150
          Height = 20
          Caption = 'Obrigator. Peso no Pedido?'
          TabOrder = 20
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object Prcodigo_barras: TsCheckBox
          Left = 503
          Top = 302
          Width = 143
          Height = 20
          Caption = 'C'#243'digo de Barras Pr'#243'prio?'
          TabOrder = 21
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object PrREPRESENTACAO: TsCheckBox
          Left = 503
          Top = 320
          Width = 99
          Height = 20
          Caption = 'Representa'#231#227'o?'
          TabOrder = 22
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object PrTablet: TsCheckBox
          Left = 503
          Top = 338
          Width = 147
          Height = 20
          Caption = 'Integrado com Sis. Tablet?'
          TabOrder = 23
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object gbUsuarioFTPSite: TsGroupBox
          Left = 496
          Top = 53
          Width = 89
          Height = 42
          Caption = 'Usu'#225'rio FTP Site'
          TabOrder = 4
          SkinData.SkinSection = 'GROUPBOX'
          object PrFTP_SITE_Usuario: TsEdit
            Left = 6
            Top = 15
            Width = 78
            Height = 21
            TabStop = False
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
        object gbSenhaFTPSite: TsGroupBox
          Left = 587
          Top = 53
          Width = 84
          Height = 42
          Caption = 'Senha FTP Site'
          TabOrder = 5
          SkinData.SkinSection = 'GROUPBOX'
          object PrFTP_SITE_SENHA: TsEdit
            Left = 6
            Top = 15
            Width = 71
            Height = 21
            TabStop = False
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
        object sGroupBox7: TsGroupBox
          Left = 505
          Top = 374
          Width = 79
          Height = 42
          Caption = 'Dec. Pre'#231'os'
          TabOrder = 25
          SkinData.SkinSection = 'GROUPBOX'
          object PrCasasDecimais: TsComboBox
            Left = 19
            Top = 16
            Width = 41
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'MS Sans Serif'
            BoundLabel.Font.Style = []
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'COMBOBOX'
            VerticalAlignment = taAlignTop
            Style = csDropDownList
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemIndex = 0
            ParentFont = False
            TabOrder = 0
            Text = '2'
            Items.Strings = (
              '2'
              '3'
              '4')
          end
        end
        object gbMalaDireta: TsGroupBox
          Left = 3
          Top = 181
          Width = 156
          Height = 42
          Caption = 'Mala Direta'
          TabOrder = 14
          SkinData.SkinSection = 'GROUPBOX'
          object PrMala_Direta: TsEdit
            Left = 6
            Top = 15
            Width = 145
            Height = 21
            TabStop = False
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
        object gbModeloDesconto: TsGroupBox
          Left = 586
          Top = 374
          Width = 79
          Height = 42
          Caption = 'Mod. Desc.'
          TabOrder = 26
          SkinData.SkinSection = 'GROUPBOX'
          object PrModelo_Desconto: TsComboBox
            Left = 19
            Top = 16
            Width = 41
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'MS Sans Serif'
            BoundLabel.Font.Style = []
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'COMBOBOX'
            VerticalAlignment = taAlignTop
            Style = csDropDownList
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemIndex = 0
            ParentFont = False
            TabOrder = 0
            Text = '1'
            Items.Strings = (
              '1'
              '2')
          end
        end
        object PrNfe_Homologacao: TsCheckBox
          Left = 503
          Top = 356
          Width = 159
          Height = 20
          Cursor = crDrag
          Caption = 'NF-e Homologa'#231#227'o (Testes)?'
          TabOrder = 24
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object gbtipo_etiqueta: TsGroupBox
          Left = 163
          Top = 181
          Width = 62
          Height = 42
          Caption = 'Tipo Etiq.'
          TabOrder = 15
          SkinData.SkinSection = 'GROUPBOX'
          object PrTipo_Etiqueta: TsComboBox
            Left = 8
            Top = 16
            Width = 41
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'MS Sans Serif'
            BoundLabel.Font.Style = []
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'COMBOBOX'
            VerticalAlignment = taAlignTop
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 0
            Text = '0'
            Items.Strings = (
              '0'
              '1')
          end
        end
        object PrIndustria: TsCheckBox
          Left = 503
          Top = 196
          Width = 66
          Height = 20
          Caption = 'Ind'#250'stria?'
          TabOrder = 27
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object gbFTPTabletSenha: TsGroupBox
          Left = 523
          Top = 95
          Width = 150
          Height = 42
          Caption = 'FTP Tablet Senha'
          TabOrder = 8
          SkinData.SkinSection = 'GROUPBOX'
          object PrFTP_TABLET_SENHA: TsEdit
            Left = 6
            Top = 15
            Width = 138
            Height = 21
            TabStop = False
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
      end
    end
    object TabSheet2: TsTabSheet
      Caption = 'Sal'#225'rios'
      ImageIndex = 1
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object Panel3: TsPanel
        Left = 0
        Top = 0
        Width = 675
        Height = 447
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 0
        TabStop = True
        SkinData.SkinSection = 'PANEL'
        object gbPlano: TsGroupBox
          Left = 4
          Top = 46
          Width = 668
          Height = 76
          Caption = 'Plano De Contas'
          TabOrder = 1
          SkinData.SkinSection = 'GROUPBOX'
          object LbSALARIO_PLANO_CONTASN1: TsLabel
            Left = 64
            Top = 15
            Width = 13
            Height = 13
            Caption = '...'
            Color = clBtnFace
            ParentColor = False
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
          end
          object LbSALARIO_PLANO_CONTASN2: TsLabel
            Left = 64
            Top = 30
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
          object LbSALARIO_PLANO_CONTASN3: TsLabel
            Left = 64
            Top = 45
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
          object LbSALARIO_PLANO_CONTASN4: TsLabel
            Left = 64
            Top = 60
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
          object PrSALARIO_PLANO_CONTAS: TsComboEdit
            Left = 6
            Top = 34
            Width = 52
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
            OnExit = PrSALARIO_PLANO_CONTASExit
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
            OnButtonClick = PrSALARIO_PLANO_CONTASButtonClick
            GlyphMode.Blend = 0
            GlyphMode.Grayed = False
          end
        end
        object gbForn: TsGroupBox
          Left = 4
          Top = 2
          Width = 667
          Height = 43
          Caption = 'Fornecedor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          SkinData.SkinSection = 'GROUPBOX'
          object LbSALARIO_FORNECEDOR: TsLabel
            Left = 78
            Top = 25
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
          object PrSALARIO_FORNECEDOR: TsComboEdit
            Left = 8
            Top = 17
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
            OnExit = PrSALARIO_FORNECEDORExit
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
            OnButtonClick = PrSALARIO_FORNECEDORButtonClick
            GlyphMode.Blend = 0
            GlyphMode.Grayed = False
          end
        end
      end
    end
    object TabSheet3: TsTabSheet
      Caption = 'Comiss'#245'es'
      ImageIndex = 2
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object Panel4: TsPanel
        Left = 0
        Top = 0
        Width = 675
        Height = 447
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 0
        TabStop = True
        SkinData.SkinSection = 'PANEL'
        object GroupBox4: TsGroupBox
          Left = 4
          Top = 46
          Width = 668
          Height = 76
          Caption = 'Plano De Contas'
          TabOrder = 1
          SkinData.SkinSection = 'GROUPBOX'
          object LbCOMISSAO_PLANO_CONTASN1: TsLabel
            Left = 64
            Top = 15
            Width = 13
            Height = 13
            Caption = '...'
            Color = clBtnFace
            ParentColor = False
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
          end
          object LbCOMISSAO_PLANO_CONTASN2: TsLabel
            Left = 64
            Top = 30
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
          object LbCOMISSAO_PLANO_CONTASN3: TsLabel
            Left = 64
            Top = 45
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
          object LbCOMISSAO_PLANO_CONTASN4: TsLabel
            Left = 64
            Top = 60
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
          object PrCOMISSAO_PLANO_CONTAS: TsComboEdit
            Left = 6
            Top = 34
            Width = 52
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
            OnExit = PrCOMISSAO_PLANO_CONTASExit
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
            OnButtonClick = PrCOMISSAO_PLANO_CONTASButtonClick
            GlyphMode.Blend = 0
            GlyphMode.Grayed = False
          end
        end
        object GroupBox5: TsGroupBox
          Left = 4
          Top = 2
          Width = 667
          Height = 43
          Caption = 'Fornecedor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          SkinData.SkinSection = 'GROUPBOX'
          object LbCOMISSAO_FORNECEDOR: TsLabel
            Left = 78
            Top = 25
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
          object PrCOMISSAO_FORNECEDOR: TsComboEdit
            Left = 8
            Top = 17
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
            OnExit = PrCOMISSAO_FORNECEDORExit
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
            OnButtonClick = PrCOMISSAO_FORNECEDORButtonClick
            GlyphMode.Blend = 0
            GlyphMode.Grayed = False
          end
        end
      end
    end
    object tbPlr: TsTabSheet
      Caption = 'PLR'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object sPanel1: TsPanel
        Left = 0
        Top = 0
        Width = 675
        Height = 447
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 0
        TabStop = True
        SkinData.SkinSection = 'PANEL'
        object sGroupBox1: TsGroupBox
          Left = 4
          Top = 46
          Width = 668
          Height = 76
          Caption = 'Plano De Contas'
          TabOrder = 1
          SkinData.SkinSection = 'GROUPBOX'
          object LbPLR_PLANO_CONTASN1: TsLabel
            Left = 64
            Top = 15
            Width = 13
            Height = 13
            Caption = '...'
            Color = clBtnFace
            ParentColor = False
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
          end
          object LbPLR_PLANO_CONTASN2: TsLabel
            Left = 64
            Top = 30
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
          object LbPLR_PLANO_CONTASN3: TsLabel
            Left = 64
            Top = 45
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
          object LbPLR_PLANO_CONTASN4: TsLabel
            Left = 64
            Top = 60
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
          object PrPLR_PLANO_CONTAS: TsComboEdit
            Left = 6
            Top = 34
            Width = 52
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
            OnExit = PrPLR_PLANO_CONTASExit
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
            OnButtonClick = PrPLR_PLANO_CONTASButtonClick
            GlyphMode.Blend = 0
            GlyphMode.Grayed = False
          end
        end
        object sGroupBox2: TsGroupBox
          Left = 4
          Top = 2
          Width = 667
          Height = 43
          Caption = 'Fornecedor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          SkinData.SkinSection = 'GROUPBOX'
          object LbPLR_FORNECEDOR: TsLabel
            Left = 78
            Top = 25
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
          object PrPLR_FORNECEDOR: TsComboEdit
            Left = 8
            Top = 17
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
            OnExit = PrPLR_FORNECEDORExit
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
            OnButtonClick = PrPLR_FORNECEDORButtonClick
            GlyphMode.Blend = 0
            GlyphMode.Grayed = False
          end
        end
      end
    end
    object sTabSheet1: TsTabSheet
      Caption = 'Vales'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object sPanel2: TsPanel
        Left = 0
        Top = 0
        Width = 675
        Height = 447
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 0
        TabStop = True
        SkinData.SkinSection = 'PANEL'
        object sGroupBox3: TsGroupBox
          Left = 4
          Top = 46
          Width = 668
          Height = 76
          Caption = 'Plano De Contas'
          TabOrder = 1
          SkinData.SkinSection = 'GROUPBOX'
          object LbVALES_PLANO_CONTASN1: TsLabel
            Left = 64
            Top = 15
            Width = 13
            Height = 13
            Caption = '...'
            Color = clBtnFace
            ParentColor = False
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
          end
          object LbVALES_PLANO_CONTASN2: TsLabel
            Left = 64
            Top = 30
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
          object LbVALES_PLANO_CONTASN3: TsLabel
            Left = 64
            Top = 45
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
          object LbVALES_PLANO_CONTASN4: TsLabel
            Left = 64
            Top = 60
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
          object PrVALE_PLANO_CONTAS: TsComboEdit
            Left = 6
            Top = 34
            Width = 52
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
            OnExit = PrVALE_PLANO_CONTASExit
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
            OnButtonClick = PrVALE_PLANO_CONTASButtonClick
            GlyphMode.Blend = 0
            GlyphMode.Grayed = False
          end
        end
        object sGroupBox4: TsGroupBox
          Left = 4
          Top = 2
          Width = 667
          Height = 43
          Caption = 'Fornecedor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          SkinData.SkinSection = 'GROUPBOX'
          object LbVALE_FORNECEDOR: TsLabel
            Left = 78
            Top = 25
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
          object PrVALE_FORNECEDOR: TsComboEdit
            Left = 8
            Top = 17
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
            OnExit = PrVALE_FORNECEDORExit
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
            OnButtonClick = PrVALE_FORNECEDORButtonClick
            GlyphMode.Blend = 0
            GlyphMode.Grayed = False
          end
        end
      end
    end
    object sTabSheet2: TsTabSheet
      Caption = '13'#186' Sal'#225'rio'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object sGroupBox13: TsGroupBox
        Left = 4
        Top = 2
        Width = 667
        Height = 43
        Caption = 'Fornecedor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        SkinData.SkinSection = 'GROUPBOX'
        object lbDecTercFornecedor: TsLabel
          Left = 78
          Top = 25
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
        object PrDEC_TERC_fornecedor: TsComboEdit
          Left = 8
          Top = 17
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
          OnExit = PrDEC_TERC_fornecedorExit
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
          OnButtonClick = PrDEC_TERC_fornecedorButtonClick
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
        end
      end
      object sGroupBox14: TsGroupBox
        Left = 4
        Top = 46
        Width = 668
        Height = 76
        Caption = 'Plano De Contas'
        TabOrder = 1
        SkinData.SkinSection = 'GROUPBOX'
        object LbDEC_TERC_PLANO_CONTASN1: TsLabel
          Left = 64
          Top = 15
          Width = 13
          Height = 13
          Caption = '...'
          Color = clBtnFace
          ParentColor = False
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
        end
        object LbDEC_TERC_PLANO_CONTASN2: TsLabel
          Left = 64
          Top = 30
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
        object LbDEC_TERC_PLANO_CONTASN3: TsLabel
          Left = 64
          Top = 45
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
        object LbDEC_TERC_PLANO_CONTASN4: TsLabel
          Left = 64
          Top = 60
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
        object PrDEC_TERC_PLANO_CONTAS: TsComboEdit
          Left = 6
          Top = 34
          Width = 52
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
          OnExit = PrDEC_TERC_PLANO_CONTASExit
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
          OnButtonClick = PrDEC_TERC_PLANO_CONTASButtonClick
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
        end
      end
    end
    object sTabSheet3: TsTabSheet
      Caption = 'Integra'#231#245'es'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object PrFRENTE_CAIXA_UTILIZA: TsCheckBox
        Left = 8
        Top = 6
        Width = 189
        Height = 20
        Caption = 'Utilizar Sistema de Frente de Caixa?'
        TabOrder = 0
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sGroupBox5: TsGroupBox
        Left = 7
        Top = 29
        Width = 194
        Height = 42
        Caption = 'Servidor'
        TabOrder = 1
        SkinData.SkinSection = 'GROUPBOX'
        object PrFRENTE_CAIXA_SERVIDOR_BD: TsEdit
          Left = 6
          Top = 15
          Width = 179
          Height = 21
          TabStop = False
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
      object Pr: TsGroupBox
        Left = 205
        Top = 29
        Width = 460
        Height = 42
        Caption = 'Local do Banco de Dados'
        TabOrder = 2
        SkinData.SkinSection = 'GROUPBOX'
        object PrFRENTE_CAIXA_BD: TsEdit
          Left = 6
          Top = 15
          Width = 448
          Height = 21
          TabStop = False
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
      object PrMODULO_VENDOR: TsCheckBox
        Left = 8
        Top = 118
        Width = 125
        Height = 20
        Caption = 'M'#243'dulo de Vendedor?'
        TabOrder = 3
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object gbVendorHostExterno: TsGroupBox
        Left = 7
        Top = 141
        Width = 127
        Height = 42
        Caption = 'Servidor Externo'
        TabOrder = 4
        SkinData.SkinSection = 'GROUPBOX'
        object PrVENDOR_SERVIDOR_BD_EXTERNO: TsEdit
          Left = 6
          Top = 15
          Width = 115
          Height = 21
          TabStop = False
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
      object gbVendorLocalBD: TsGroupBox
        Left = 263
        Top = 141
        Width = 403
        Height = 42
        Caption = 'Local do Banco de Dados'
        TabOrder = 6
        SkinData.SkinSection = 'GROUPBOX'
        object PrVENDOR_BD: TsEdit
          Left = 6
          Top = 15
          Width = 391
          Height = 21
          TabStop = False
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
      object gbVendorHostInterno: TsGroupBox
        Left = 135
        Top = 141
        Width = 127
        Height = 42
        Caption = 'Servidor Interno'
        TabOrder = 5
        SkinData.SkinSection = 'GROUPBOX'
        object PrVENDOR_SERVIDOR_BD_INTERNO: TsEdit
          Left = 6
          Top = 15
          Width = 115
          Height = 21
          TabStop = False
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
      object gbVendorFTPHostInterno: TsGroupBox
        Left = 191
        Top = 185
        Width = 169
        Height = 42
        Caption = 'FTP Host Interno'
        TabOrder = 8
        SkinData.SkinSection = 'GROUPBOX'
        object PrVENDOR_FTP_HOST: TsEdit
          Left = 6
          Top = 15
          Width = 157
          Height = 21
          TabStop = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 50
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
      object gbVendorFTPUsuario: TsGroupBox
        Left = 361
        Top = 185
        Width = 153
        Height = 42
        Caption = 'FTP Usu'#225'rio'
        TabOrder = 9
        SkinData.SkinSection = 'GROUPBOX'
        object PrVENDOR_FTP_USUARIO: TsEdit
          Left = 6
          Top = 15
          Width = 140
          Height = 21
          TabStop = False
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
      object gbVendorFTPSenha: TsGroupBox
        Left = 516
        Top = 185
        Width = 150
        Height = 42
        Caption = 'FTP Senha'
        TabOrder = 10
        SkinData.SkinSection = 'GROUPBOX'
        object PrVENDOR_FTP_SENHA: TsEdit
          Left = 6
          Top = 15
          Width = 138
          Height = 21
          TabStop = False
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
      object gbVendorFTPHostExterno: TsGroupBox
        Left = 7
        Top = 185
        Width = 183
        Height = 42
        Caption = 'FTP Host Externo'
        TabOrder = 7
        SkinData.SkinSection = 'GROUPBOX'
        object PrVENDOR_FTP_HOST_EXTERNO: TsEdit
          Left = 6
          Top = 15
          Width = 171
          Height = 21
          TabStop = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 50
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
      object sGroupBox9: TsGroupBox
        Left = 7
        Top = 72
        Width = 658
        Height = 42
        Caption = 'Empresa Padr'#227'o'
        TabOrder = 11
        SkinData.SkinSection = 'GROUPBOX'
        object Lbempresa_padrao: TsLabel
          Left = 77
          Top = 23
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
        object PrFRENTE_CAIXA_EMPRESA_PADRAO: TsComboEdit
          Left = 6
          Top = 15
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
          OnExit = PrFRENTE_CAIXA_EMPRESA_PADRAOExit
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
          OnButtonClick = PrFRENTE_CAIXA_EMPRESA_PADRAOButtonClick
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
        end
      end
      object sGroupBox10: TsGroupBox
        Left = 7
        Top = 229
        Width = 127
        Height = 42
        Caption = 'Servidor Clientes'
        TabOrder = 12
        SkinData.SkinSection = 'GROUPBOX'
        object sEdit1: TsEdit
          Left = 6
          Top = 15
          Width = 115
          Height = 21
          TabStop = False
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
      object sGroupBox11: TsGroupBox
        Left = 135
        Top = 229
        Width = 530
        Height = 42
        Caption = 'Local do Banco de Dados Clientes'
        TabOrder = 13
        SkinData.SkinSection = 'GROUPBOX'
        object sEdit2: TsEdit
          Left = 6
          Top = 15
          Width = 518
          Height = 21
          TabStop = False
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
    object sTabSheet4: TsTabSheet
      Caption = 'Avisos'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object PrAVISO_ESTOQUE_MINIMO_CK: TsCheckBox
        Left = 8
        Top = 7
        Width = 103
        Height = 20
        Caption = 'Estoque M'#237'nimo?'
        TabOrder = 0
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object PrAVISO_CONTA_VENCIDA_CK: TsCheckBox
        Left = 8
        Top = 87
        Width = 96
        Height = 20
        Caption = 'Conta Vencida?'
        TabOrder = 2
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object gbEstoqueMinimo: TsGroupBox
        Left = 10
        Top = 25
        Width = 655
        Height = 42
        Caption = 'Email - Estoque M'#237'nimo'
        TabOrder = 1
        SkinData.SkinSection = 'GROUPBOX'
        object PrAVISO_ESTOQUE_MINIMO_EMAIL: TsEdit
          Left = 6
          Top = 15
          Width = 643
          Height = 21
          TabStop = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 50
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
      object gbContaVencida: TsGroupBox
        Left = 10
        Top = 105
        Width = 655
        Height = 88
        Caption = 'Email - Conta Vencida'
        TabOrder = 3
        SkinData.SkinSection = 'GROUPBOX'
        object PrAVISO_CONTA_VENCIDA_EMAIL1: TsEdit
          Left = 6
          Top = 15
          Width = 643
          Height = 21
          TabStop = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 50
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
        object PrAVISO_CONTA_VENCIDA_EMAIL2: TsEdit
          Left = 6
          Top = 38
          Width = 643
          Height = 21
          TabStop = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 50
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
      object PrAVISO_CONTA_VENCIDA_EMAIL3: TsEdit
        Left = 16
        Top = 166
        Width = 643
        Height = 21
        TabStop = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 50
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
  end
  object q_entrada: TFDQuery
    Connection = dao.CN
    Left = 432
    Top = 480
  end
  object q_produto: TFDQuery
    Connection = dao.CN
    Left = 600
    Top = 488
  end
  object q_entrada2: TFDQuery
    Connection = dao.CN
    Left = 568
    Top = 480
  end
  object q_venda1: TFDQuery
    Connection = dao.CN
    Left = 512
    Top = 488
  end
  object Q_configuracao: TFDQuery
    Connection = dao.CN
    Left = 472
    Top = 488
  end
  object Q1: TFDQuery
    Connection = dao.CN
    Left = 632
    Top = 480
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 448
    Top = 320
  end
  object qrGravaLogo: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'UPDATE CONFIGURACAO '
      'SET LOGO=:bitmap_foto'
      'where'
      '  cod_conf = 1'
      ''
      '')
    Left = 382
    Top = 336
  end
end
