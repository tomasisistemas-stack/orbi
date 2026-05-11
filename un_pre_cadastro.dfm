object fr_pre_cadastro: Tfr_pre_cadastro
  Left = 489
  Top = 124
  Caption = 'Pr'#233'- Cadastro de Clientes'
  ClientHeight = 328
  ClientWidth = 474
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 474
    Height = 97
    Align = alTop
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    ExplicitWidth = 482
    object BtnConsultaCNPJ: TsBitBtn
      Left = 271
      Top = 14
      Width = 109
      Height = 22
      Caption = 'Consulta CNPJ'
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
      OnClick = BtnConsultaCNPJClick
      SkinData.SkinSection = 'BUTTON'
    end
    object gbCNPJ: TsGroupBox
      Left = 102
      Top = 2
      Width = 125
      Height = 41
      Caption = 'CNPJ'
      TabOrder = 1
      SkinData.SkinSection = 'GROUPBOX'
      object PrCNPJ: TsMaskEdit
        Left = 5
        Top = 13
        Width = 115
        Height = 21
        Color = clWhite
        EditMask = '##.###.###/####-##;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 18
        ParentFont = False
        TabOrder = 0
        Text = '  .   .   /    -  '
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
      end
    end
    object gbStatus: TsGroupBox
      Left = 1
      Top = 50
      Width = 480
      Height = 41
      Caption = 'Status'
      TabOrder = 2
      SkinData.SkinSection = 'GROUPBOX'
      object sBevel1: TsBevel
        Left = 4
        Top = 14
        Width = 472
        Height = 22
      end
    end
  end
  object sPanel2: TsPanel
    Left = 0
    Top = 97
    Width = 474
    Height = 190
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    ExplicitWidth = 482
    ExplicitHeight = 202
    object gbCodigo: TsGroupBox
      Left = 4
      Top = 3
      Width = 54
      Height = 38
      Caption = 'C'#243'digo'
      TabOrder = 0
      SkinData.SkinSection = 'GROUPBOX'
      object lbCod_cliente: TsLabelFX
        Left = 5
        Top = 14
        Width = 72
        Height = 21
        Alignment = taCenter
        Caption = 'lbCod_cliente'
        Angle = 0
        Shadow.OffsetKeeper.LeftTop = -3
        Shadow.OffsetKeeper.RightBottom = 5
      end
    end
    object gbNom_Cliente: TsGroupBox
      Left = 60
      Top = 3
      Width = 416
      Height = 38
      Caption = 'Raz'#227'o Social'
      TabOrder = 1
      SkinData.SkinSection = 'GROUPBOX'
      object lbNom_cliente: TsLabelFX
        Left = 5
        Top = 14
        Width = 76
        Height = 21
        Caption = 'lbNom_Cliente'
        Angle = 0
        Shadow.OffsetKeeper.LeftTop = -3
        Shadow.OffsetKeeper.RightBottom = 5
      end
    end
    object gbPrNom_Fantasia: TsGroupBox
      Left = 4
      Top = 41
      Width = 473
      Height = 38
      Caption = 'Nome de Fantasia'
      TabOrder = 2
      SkinData.SkinSection = 'GROUPBOX'
      object LbNom_Fantasia: TsLabelFX
        Left = 5
        Top = 14
        Width = 88
        Height = 21
        Caption = 'LbNom_Fantasia'
        Angle = 0
        Shadow.OffsetKeeper.LeftTop = -3
        Shadow.OffsetKeeper.RightBottom = 5
      end
    end
    object gbEndereco: TsGroupBox
      Left = 4
      Top = 79
      Width = 417
      Height = 38
      Caption = 'Endere'#231'o'
      TabOrder = 3
      SkinData.SkinSection = 'GROUPBOX'
      object LbEndereco: TsLabelFX
        Left = 5
        Top = 14
        Width = 66
        Height = 21
        Caption = 'LbEndereco'
        Angle = 0
        Shadow.OffsetKeeper.LeftTop = -3
        Shadow.OffsetKeeper.RightBottom = 5
      end
    end
    object gbNr_Endereco: TsGroupBox
      Left = 423
      Top = 79
      Width = 54
      Height = 38
      Caption = 'N'#186
      TabOrder = 4
      SkinData.SkinSection = 'GROUPBOX'
      object lbNr_Endereco: TsLabelFX
        Left = 5
        Top = 14
        Width = 44
        Height = 21
        Alignment = taCenter
        Caption = 'Nr_End'
        Angle = 0
        Shadow.OffsetKeeper.LeftTop = -3
        Shadow.OffsetKeeper.RightBottom = 5
      end
    end
    object gbComplemento: TsGroupBox
      Left = 4
      Top = 119
      Width = 93
      Height = 38
      Caption = 'Complemento'
      TabOrder = 5
      SkinData.SkinSection = 'GROUPBOX'
      object LbComplemento: TsLabelFX
        Left = 5
        Top = 14
        Width = 72
        Height = 21
        Caption = 'Complemento'
        Angle = 0
        Shadow.OffsetKeeper.LeftTop = -3
        Shadow.OffsetKeeper.RightBottom = 5
      end
    end
    object gbBairro: TsGroupBox
      Left = 98
      Top = 119
      Width = 191
      Height = 38
      Caption = 'Bairro'
      TabOrder = 6
      SkinData.SkinSection = 'GROUPBOX'
      object lbBairro: TsLabelFX
        Left = 5
        Top = 14
        Width = 35
        Height = 21
        Caption = 'Bairro'
        Angle = 0
        Shadow.OffsetKeeper.LeftTop = -3
        Shadow.OffsetKeeper.RightBottom = 5
      end
    end
    object gbCidade: TsGroupBox
      Left = 290
      Top = 119
      Width = 187
      Height = 38
      Caption = 'Cidade'
      TabOrder = 7
      SkinData.SkinSection = 'GROUPBOX'
      object lbCidade: TsLabelFX
        Left = 5
        Top = 14
        Width = 41
        Height = 21
        Caption = 'Cidade'
        Angle = 0
        Shadow.OffsetKeeper.LeftTop = -3
        Shadow.OffsetKeeper.RightBottom = 5
      end
    end
    object gbCep: TsGroupBox
      Left = 4
      Top = 159
      Width = 109
      Height = 38
      Caption = 'CEP'
      TabOrder = 8
      SkinData.SkinSection = 'GROUPBOX'
      object LBCEP: TsLabelFX
        Left = 5
        Top = 14
        Width = 29
        Height = 21
        Caption = 'CEP'
        Angle = 0
        Shadow.OffsetKeeper.LeftTop = -3
        Shadow.OffsetKeeper.RightBottom = 5
      end
    end
    object gbIE: TsGroupBox
      Left = 290
      Top = 159
      Width = 187
      Height = 38
      Caption = 'Inscri'#231#227'o Estadual'
      TabOrder = 9
      SkinData.SkinSection = 'GROUPBOX'
      object LBIE: TsLabelFX
        Left = 5
        Top = 14
        Width = 18
        Height = 21
        Caption = 'IE'
        Angle = 0
        Shadow.OffsetKeeper.LeftTop = -3
        Shadow.OffsetKeeper.RightBottom = 5
      end
    end
  end
  object sPanel3: TsPanel
    Left = 0
    Top = 287
    Width = 474
    Height = 41
    Align = alBottom
    TabOrder = 2
    SkinData.SkinSection = 'PANEL'
    ExplicitTop = 299
    ExplicitWidth = 482
    object btnImportar: TsBitBtn
      Left = 203
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Importar'
      Enabled = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
        FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
        990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
        990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
        FFFF3333333333333F333333333FFFFF0FFF3333333333337FF333333333FFF0
        00FF33333333333777FF333333333F00000F33FFFFF33777777F300000333000
        0000377777F33777777730EEE033333000FF37F337F3333777F330EEE0333330
        00FF37F337F3333777F330EEE033333000FF37FFF7F333F77733300000333000
        03FF3777773337777333333333333333333F3333333333333333}
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnImportarClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
end
