object Fr_grupo: TFr_grupo
  Left = 265
  Top = 11
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Grupos'
  ClientHeight = 630
  ClientWidth = 654
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TsGroupBox
    Left = 0
    Top = 0
    Width = 654
    Height = 630
    Align = alClient
    TabOrder = 0
    SkinData.SkinSection = 'GROUPBOX'
    object Label2: TsLabel
      Left = 659
      Top = 15
      Width = 137
      Height = 13
      Caption = 'Margem Lucro Agregado S.T'
      Visible = False
    end
    object Prmargem_valor_agregado_st: TsEdit
      Left = 658
      Top = 28
      Width = 76
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 50
      ParentFont = False
      TabOrder = 0
      Visible = False
      OnKeyPress = Prcod_grupoKeyPress
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
    object Panel2: TsPanel
      Left = 2
      Top = 15
      Width = 650
      Height = 57
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 1
      SkinData.SkinSection = 'PANEL'
      object Label22: TsLabel
        Left = 425
        Top = 8
        Width = 63
        Height = 13
        Caption = 'C'#243'digo NCM:'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Label25: TsLabel
        Left = 77
        Top = 8
        Width = 78
        Height = 13
        Caption = 'Nome do Grupo:'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object Label1: TsLabel
        Left = 4
        Top = 8
        Width = 36
        Height = 13
        Caption = 'C'#243'digo:'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object sLabel16: TsLabel
        Left = 550
        Top = 8
        Width = 24
        Height = 13
        Caption = 'Cest:'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object PrNCM: TsComboEdit
        Left = 424
        Top = 22
        Width = 121
        Height = 21
        AutoSize = False
        Color = clWhite
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = ''
        OnEnter = PrNCMEnter
        OnExit = PrNCMExit
        OnKeyPress = PrNCMKeyPress
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
        OnButtonClick = PrNCMButtonClick
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
      object PrNom_grupo: TsEdit
        Left = 77
        Top = 22
        Width = 347
        Height = 21
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 50
        ParentFont = False
        TabOrder = 1
        OnKeyPress = Prcod_grupoKeyPress
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
      object Prcod_grupo: TsEdit
        Left = 4
        Top = 22
        Width = 67
        Height = 21
        Color = clWhite
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnKeyPress = Prcod_grupoKeyPress
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
      object PrCest: TsEdit
        Left = 547
        Top = 22
        Width = 99
        Height = 21
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnExit = PrCestExit
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
      Left = 2
      Top = 72
      Width = 650
      Height = 474
      Align = alClient
      Caption = 'Desconto Especiais'
      TabOrder = 2
      SkinData.SkinSection = 'GROUPBOX'
      object Panel9: TsPanel
        Left = 2
        Top = 15
        Width = 646
        Height = 58
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        SkinData.SkinSection = 'PANEL'
        object ft_lb_nom_representante: TsLabel
          Left = 85
          Top = 31
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
        object sLabel1: TsLabel
          Left = 11
          Top = 7
          Width = 70
          Height = 13
          Caption = 'Representante'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object sLabel2: TsLabel
          Left = 282
          Top = 5
          Width = 91
          Height = 13
          Caption = 'Cidade de Atua'#231#227'o'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object BtPesqDesc: TsBitBtn
          Left = 566
          Top = 21
          Width = 75
          Height = 25
          Caption = '&Pesquisar'
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000220B0000220B00000001000000010000E78C3100B56B
            4A00E79C52008C635A0094635A00A5635A00A56B5A00BD7B5A00FFB55A004A52
            630094636300A5636B00A5736B00AD7B6B00BD846B00C6846B00D6946B00AD7B
            7300B58C7300DE9C7300AD847B00B58C7B00E7AD7B00EFBD7B00EFC67B005A63
            8400636B84006B6B8400B58C8400CEA58400EFBD8400EFC68400F7C68400AD8C
            8C00EFC68C00F7CE8C00BD949400B5AD9400EFC69400EFCE9400F7CE9400CEA5
            9C00D6B59C00EFCE9C00DEBDA500EFCEA500F7D6A500427BAD00EFD6AD00F7D6
            AD00DEC6B500DECEB500EFD6B500F7D6B500F7DEB500D6BDBD00DEC6BD00F7DE
            BD00186BC600DEC6C600DECEC600F7E7C600FFEFC600F7E7CE001073D600FFFF
            D600F7EFDE00FFEFDE00F7EFE700FFEFE700FFF7E700F7F7EF00FFF7EF00FFFF
            EF00FFF7F700FFFFF700FF00FF0031A5FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004C4C0B0B0B0B
            0B0B0B0B0B0B0B0B0B4C4C4C093E35302B27221E171E1E1F0B4C4C1A3A1A3930
            2D2B26221E17171F0B4C4C4C4D401B39342D2B26221E171F0B4C4C4C054D4019
            39302D2B26221E1F0B4C4C4C0C484D2F0311040D1D26221F0B4C4C4C0C4E4421
            1C2C342A121D26220B4C4C4C0E4E4814323F3D4B2A0D2B270B4C4C4C0E4E4E0A
            42423F4934042D2E0B4C4C4C104E4E1C3B4442412C11312D0B4C4C4C104E4E37
            243B42321C1533250B4C4C4C134E4E4E371C0A14290606060B4C4C4C134E4E4E
            4E4E4B4B37060200014C4C4C164E4E4E4E4E4E4E3B0608074C4C4C4C16474747
            4747474737060E4C4C4C4C4C161010101010101010064C4C4C4C}
          TabOrder = 0
          OnClick = BtPesqDescClick
          SkinData.SkinSection = 'BUTTON'
        end
        object ft_representante: TsComboEdit
          Left = 11
          Top = 23
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
          TabOrder = 1
          Text = ''
          OnExit = ft_representanteExit
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
          OnButtonClick = ft_representanteButtonClick
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
        end
        object ft_Cidade: TsEdit
          Left = 282
          Top = 24
          Width = 214
          Height = 21
          CharCase = ecUpperCase
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnKeyPress = Prcod_grupoKeyPress
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
        object ckTodos: TCheckBox
          Left = 503
          Top = 25
          Width = 54
          Height = 17
          Caption = 'Todos'
          TabOrder = 3
        end
      end
      object Panel11: TsPanel
        Left = 2
        Top = 384
        Width = 646
        Height = 88
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 1
        SkinData.SkinSection = 'PANEL'
        object gbRepre: TsGroupBox
          Left = 8
          Top = 5
          Width = 488
          Height = 41
          Caption = 'Representante'
          TabOrder = 0
          SkinData.SkinSection = 'GROUPBOX'
          object Lbnom_representante: TDBText
            Left = 75
            Top = 18
            Width = 103
            Height = 13
            AutoSize = True
            DataField = 'NOME_REPRESENTANTE'
            DataSource = dsDescEspecial
          end
          object edId_representante: TRxDBComboEdit
            Left = 10
            Top = 14
            Width = 55
            Height = 21
            DataField = 'ID_REPRESENTANTE'
            DataSource = dsDescEspecial
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
              DDDDDDDDDDDDDDDDDDDDDDDDDDD333DDDDDDDDDDDD33603DDDDDDDDDD3B7871D
              33DDDDD3BBB88803333DDD3B888F873887033388FF7883BBB86133FFFF83333B
              B873383888BB333BBB33D3333BBBBB333DDDDDDDD33333DDDDDDDDDDDDDDDDDD
              DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
            NumGlyphs = 1
            TabOrder = 0
            OnButtonClick = edId_representanteButtonClick
            OnExit = edId_representanteExit
          end
        end
        object gbDescMax: TsGroupBox
          Left = 575
          Top = 6
          Width = 66
          Height = 41
          Caption = 'Desc. M'#225'x.'
          TabOrder = 1
          SkinData.SkinSection = 'GROUPBOX'
          object edDescMaximo: TDBEdit
            Left = 6
            Top = 14
            Width = 53
            Height = 21
            DataField = 'DESCONTO_MAXIMO'
            DataSource = dsDescEspecial
            TabOrder = 0
          end
        end
        object Panel12: TsPanel
          Left = 2
          Top = 53
          Width = 642
          Height = 33
          Align = alBottom
          TabOrder = 2
          SkinData.SkinSection = 'PANEL'
          object BtNovoDescEsp: TsBitBtn
            Left = 135
            Top = 5
            Width = 75
            Height = 23
            Caption = '&Novo'
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
            OnClick = BtNovoDescEspClick
            SkinData.SkinSection = 'BUTTON'
          end
          object BtAltDescEsp: TsBitBtn
            Left = 209
            Top = 5
            Width = 75
            Height = 23
            Caption = '&Alterar'
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
            OnClick = BtAltDescEspClick
            SkinData.SkinSection = 'BUTTON'
          end
          object BtGravarDescEsp: TsBitBtn
            Left = 283
            Top = 5
            Width = 75
            Height = 23
            Caption = '&Gravar'
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
            OnClick = BtGravarDescEspClick
            SkinData.SkinSection = 'BUTTON'
          end
          object BtCancDescEsp: TsBitBtn
            Left = 357
            Top = 5
            Width = 75
            Height = 23
            Caption = '&Cancelar'
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
            OnClick = BtCancDescEspClick
            SkinData.SkinSection = 'BUTTON'
          end
          object BtExcDescEsp: TsBitBtn
            Left = 432
            Top = 5
            Width = 75
            Height = 23
            Caption = '&Excluir'
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
            OnClick = BtExcDescEspClick
            SkinData.SkinSection = 'BUTTON'
          end
        end
        object ckAltTodos: TCheckBox
          Left = 512
          Top = 21
          Width = 54
          Height = 17
          Caption = 'Todos'
          TabOrder = 3
        end
      end
      object DBGrid6: TDBGrid
        Left = 2
        Top = 73
        Width = 646
        Height = 311
        Align = alClient
        DataSource = dsDescEspecial
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ID_REPRESENTANTE'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_REPRESENTANTE'
            Title.Caption = 'Representante'
            Width = 244
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CIDADE'
            Title.Caption = 'Cidade'
            Width = 244
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCONTO_MAXIMO'
            Title.Alignment = taCenter
            Title.Caption = 'Desc.M'#225'x.'
            Visible = True
          end>
      end
    end
    object sPanel1: TsPanel
      Left = 2
      Top = 587
      Width = 650
      Height = 41
      Align = alBottom
      TabOrder = 3
      SkinData.SkinSection = 'PANEL'
    end
    object Panel1: TsPanel
      Left = 2
      Top = 546
      Width = 650
      Height = 41
      Align = alBottom
      TabOrder = 4
      SkinData.SkinSection = 'PANEL'
      object btnov: TsBitBtn
        Left = 100
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Inclui'
        TabOrder = 0
        OnClick = btnovClick
        SkinData.SkinSection = 'BUTTON'
      end
      object btalt: TsBitBtn
        Left = 176
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Altera'
        TabOrder = 1
        OnClick = btaltClick
        SkinData.SkinSection = 'BUTTON'
      end
      object btgra: TsBitBtn
        Left = 252
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Grava'
        Enabled = False
        TabOrder = 2
        OnClick = btgraClick
        SkinData.SkinSection = 'BUTTON'
      end
      object btcan: TsBitBtn
        Left = 328
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Cancela'
        Enabled = False
        TabOrder = 3
        OnClick = btcanClick
        SkinData.SkinSection = 'BUTTON'
      end
      object btexc: TsBitBtn
        Left = 404
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Excluir'
        TabOrder = 4
        OnClick = btexcClick
        SkinData.SkinSection = 'BUTTON'
      end
      object btpro: TsBitBtn
        Left = 480
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Procura'
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
        OnClick = btproClick
        SkinData.SkinSection = 'BUTTON'
      end
    end
  end
  object q_grupo: TFDQuery
    Connection = dao.CN
    Left = 408
    Top = 304
  end
  object ds_template_grupo: TDataSource
    Left = 292
    Top = 286
  end
  object mmDescEspecial: TRxMemoryData
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
    Left = 88
    Top = 296
    object mmDescEspecialID_REPRESENTANTE: TIntegerField
      FieldName = 'ID_REPRESENTANTE'
    end
    object mmDescEspecialNOME_REPRESENTANTE: TStringField
      FieldName = 'NOME_REPRESENTANTE'
      Size = 100
    end
    object mmDescEspecialCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 200
    end
    object mmDescEspecialDESCONTO_MAXIMO: TFloatField
      FieldName = 'DESCONTO_MAXIMO'
      DisplayFormat = '##0.00%'
    end
  end
  object dsDescEspecial: TDataSource
    DataSet = mmDescEspecial
    Left = 122
    Top = 296
  end
  object q_template_grupo: TFDQuery
    Connection = dao.CN
    Left = 328
    Top = 238
  end
end
