object fr_calculo_plr_consulta: Tfr_calculo_plr_consulta
  Left = 311
  Top = 242
  BorderIcons = [biSystemMenu]
  Caption = 'C'#225'lculo PLR'
  ClientHeight = 701
  ClientWidth = 1010
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
  object Panel1: TsPanel
    Left = 0
    Top = 0
    Width = 1010
    Height = 49
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object btImprimir: TsSpeedButton
      Left = 914
      Top = 13
      Width = 86
      Height = 25
      Caption = '&Imprimir'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
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
    object GroupBox1: TsGroupBox
      Left = 5
      Top = 2
      Width = 416
      Height = 43
      Caption = 'Informe a Descri'#231#227'o '#224' ser Pesquisada:'
      TabOrder = 0
      SkinData.SkinSection = 'GROUPBOX'
      object edDesc: TsEdit
        Left = 8
        Top = 16
        Width = 401
        Height = 21
        CharCase = ecUpperCase
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
    object BtLocalizar: TsBitBtn
      Left = 787
      Top = 13
      Width = 75
      Height = 25
      Caption = '&Localizar'
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
      TabOrder = 1
      OnClick = BtLocalizarClick
      SkinData.SkinSection = 'BUTTON'
    end
    object GroupBox4: TsGroupBox
      Left = 439
      Top = 2
      Width = 264
      Height = 43
      Caption = 'Data Movimento'
      TabOrder = 2
      SkinData.SkinSection = 'GROUPBOX'
      object Label1: TsLabel
        Left = 8
        Top = 18
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
      object Label2: TsLabel
        Left = 136
        Top = 18
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
      object ftMovDe: TsDateEdit
        Left = 27
        Top = 15
        Width = 99
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
        DialogTitle = 'Selecione uma Data'
      end
      object ftMovAte: TsDateEdit
        Left = 159
        Top = 15
        Width = 99
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
        DialogTitle = 'Selecione uma Data'
      end
    end
  end
  object Panel7: TsPanel
    Left = 0
    Top = 49
    Width = 497
    Height = 625
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object GroupBox2: TsGroupBox
      Left = 1
      Top = 1
      Width = 495
      Height = 623
      Align = alClient
      Caption = 'Faturamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      SkinData.SkinSection = 'GROUPBOX'
      object Panel2: TsPanel
        Left = 2
        Top = 592
        Width = 491
        Height = 29
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 0
        SkinData.SkinSection = 'PANEL'
        object stFatLiq: TsLabel
          Left = 167
          Top = 1
          Width = 323
          Height = 27
          Align = alRight
          Alignment = taRightJustify
          Caption = 'Total Faturamento L'#237'quido: R$ 0,00'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Sylfaen'
          Font.Style = [fsBold]
          ExplicitLeft = 175
          ExplicitHeight = 25
        end
      end
      object TvFaturamento: TTreeView
        Left = 2
        Top = 22
        Width = 491
        Height = 570
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Indent = 19
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  object Panel8: TsPanel
    Left = 497
    Top = 49
    Width = 513
    Height = 625
    Align = alRight
    BevelInner = bvLowered
    BevelOuter = bvLowered
    TabOrder = 2
    SkinData.SkinSection = 'PANEL'
    object GroupBox3: TsGroupBox
      Left = 2
      Top = 2
      Width = 509
      Height = 621
      Align = alClient
      Caption = 'Despesas Operacionais e Impostos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      SkinData.SkinSection = 'GROUPBOX'
      object TvDespesas: TTreeView
        Left = 2
        Top = 22
        Width = 505
        Height = 570
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Indent = 19
        ParentFont = False
        TabOrder = 0
      end
      object Panel3: TsPanel
        Left = 2
        Top = 592
        Width = 505
        Height = 27
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 1
        SkinData.SkinSection = 'PANEL'
        object stDespesas: TsLabel
          Left = 291
          Top = 1
          Width = 213
          Height = 25
          Align = alRight
          Alignment = taRightJustify
          Caption = 'Total Despesas: R$ 0,00'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Sylfaen'
          Font.Style = [fsBold]
        end
      end
    end
  end
  object Panel9: TsPanel
    Left = 0
    Top = 674
    Width = 1010
    Height = 27
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 3
    SkinData.SkinSection = 'PANEL'
    object stTotalGeral: TsLabel
      Left = 814
      Top = 1
      Width = 195
      Height = 25
      Align = alRight
      Alignment = taRightJustify
      Caption = 'Total Ativo:R$ 0,00'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Sylfaen'
      Font.Style = [fsBold]
      ExplicitLeft = 822
      ExplicitHeight = 27
    end
  end
  object Q_Faturamento: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      '')
    Left = 144
    Top = 74
  end
  object Q_Despesas: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      '')
    Left = 288
    Top = 114
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
    ReportOptions.LastChange = 40575.494529803240000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure mmDescricao1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = fR_RELATORIOGetValue
    Left = 456
    Top = 40
    Datasets = <
      item
        DataSet = Dm.dst_custo_fixo
        DataSetName = 'dst_custo_fixo'
      end
      item
        DataSet = Dm.dst_fat_liq
        DataSetName = 'dst_fat_liq'
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
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
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
        Height = 7.559060000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 200.315090000000000000
        Width = 718.110700000000000000
        RowCount = 1
        object Subreport2: TfrxSubreport
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Page = fR_RELATORIO.Page3
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 396.850650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 642.520100000000000000
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
        Height = 90.708720000000000000
        Top = 49.133890000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 616.842920000000000000
          Top = 1.000000000000000000
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
          Left = 573.488560000000000000
          Top = 19.897650000000010000
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
          Left = 7.559060000000000000
          Top = 67.354360000000010000
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
            'Faturamento Liquido')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 313.700990000000000000
          Top = 67.354359999999990000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dtaini]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 400.630180000000000000
          Top = 67.354360000000010000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'e')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 423.307360000000000000
          Top = 67.354360000000010000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dtafin]')
          ParentFont = False
        end
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 3.779530000000001000
          Width = 200.315090000000000000
          Height = 56.692950000000000000
          Frame.Typ = []
          Picture.Data = {
            0A544A504547496D6167657D0F0000FFD8FFE000104A46494600010101006000
            600000FFDB004300080606070605080707070909080A0C140D0C0B0B0C191213
            0F141D1A1F1E1D1A1C1C20242E2720222C231C1C2837292C30313434341F2739
            3D38323C2E333432FFDB0043010909090C0B0C180D0D1832211C213232323232
            3232323232323232323232323232323232323232323232323232323232323232
            32323232323232323232323232FFC0001108003A00CC03012200021101031101
            FFC4001F0000010501010101010100000000000000000102030405060708090A
            0BFFC400B5100002010303020403050504040000017D01020300041105122131
            410613516107227114328191A1082342B1C11552D1F02433627282090A161718
            191A25262728292A3435363738393A434445464748494A535455565758595A63
            6465666768696A737475767778797A838485868788898A92939495969798999A
            A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
            D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
            01010101010101010000000000000102030405060708090A0BFFC400B5110002
            0102040403040705040400010277000102031104052131061241510761711322
            328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
            292A35363738393A434445464748494A535455565758595A636465666768696A
            737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
            A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
            E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F6DB
            8CF9EDB860F1FCAA2A96E33E7B6E393C7F2AA57B7B0E9F68F7139C22F6EE4FA0
            ADB9946377B10A2E52E55BB269258E18CC92BAA20EACC700563BF883CF731E99
            672DDB0E378184FCEA0B6D3EE35A75BDD50B2C1D62B507000F535BF1C6914623
            8D151074551802B04EA55D57BABF1FF8074B8D2A3A4BDE97E0BFCCC52BE239C6
            77DA5B0F41F31FEB51BC1E278FE64BAB7971FC3B40FE95A93EA76903F9664F32
            5FF9E710DEDF90A8CDF5E05F38E9ECB6E3EF02E3CCC7A851FCB3512A70DB9E57
            F26FF4348D4A9BFB38DBCD2FD753197C4D7B65308B53B1DBEEA369FF00035D05
            95FDB6A10F9B6D2071DC775FA8A5961B5D4ED007549A090654FF0051E95C55DC
            173E1BD595E07250F28C7A3AF706B29D4AB86B4A4F9A1F8A35852A38BBC62B92
            6BA747FE477B4541677497B6715CC7F7645CE3D3D453AE65682D669963695A38
            D9C46BD58819C0FAD7A09A6AE8F325171767B92D15E43A3FC47F1DF8904F368B
            E17B39A08A4F2DB2E46D3D7049239AD19FE23789F40513789BC1B2C169BB0F71
            6D26E0BFCC7E6452E741CACF4DA2B80F0FF8FA4F11FC469F4AB2689F475B1134
            6DB7E72F852493F8E31ED5DFD34EE26AC145145300A28A2800A5208EA0D797F8
            975FD73C4FE353E0EF0D5D358C36C375FDF27DE5F500F60381EE6B2B58F0EF8E
            FC1BA9D9DDE81ABEA3AD5BC8E04914996C37A32E48DA7D7B54F30F94F64A29A8
            58C685D42B9505941CE0F714EAA105145140055EB2FF0052DFEF7F41546AF597
            FA96FF007BFA0A99EC38EE56B8044EC09C9E39FC2B9A980D5FC4A2DDB9B5B21B
            997B33FF009FE55D2CE00B860391915CBF86583DE6A8E7EF997F4C9AE7ADEF4A
            14DECDFE5A9D787F76152A2DD2D3E6EC744CCA8859885551924F402B24EA17D7
            F93A5C28215FF96F3E4073E8A3FAD5BD5BFE40F79FF5C5BF954D6831656E074F
            2D7F95693BCA7C89D958CA1CB0873B5777B6BB14349BD85DDED9ED92D2F57992
            2031BBDC1EE2B56A96A1A6C5A82292C639E3E63993EF29FF000ACDB33A9EAA92
            4735DAC3142E62768570F211EFDAA14E54ED06AFDBFE09A3A70AA9D44EDDEFD3
            D3B935CDD43A66A28B6F20733BE24B54E4827F887A1F51DE99E2BB75974732E3
            E685C303EC78356D34A82D8DBFD96255D928791C9CB30C1EA7BF5AA5AFCAD7C5
            348B4F9E691834A4748D47AD6555354A6A5D765E7FF0E6D465175E9CA1D376FB
            2EFF00224F0AEEFEC34DDD3CC6DBF4ADACE39AAD043169D611C2BF72250A3D49
            FF00EB9AB406481EB5D3461C94E307BA4726226AA5594D6CDB3CF3E0FF003E18
            D49BBB6A9393F98AB5F1635B834AF03DD5A37CF73A88FB34310E49C91938F61F
            A915C2785FC49E22D17C397D07877461A8C8BAB4E2E0ED2E63CE36FCA39E79E7
            DABACF0E783F59D6B5D8BC51E36646BA880FB1E9EBF720F723A67BE3D7934D3B
            AB221AB3BB399F849A1DC68BF10753B4BB1B67B7D3D1997D0BED38FC338AF6A9
            658A089A59A448E35EAEEC140FC4D79FDB38B2F8F17D1B1005FE96ACBEE571FE
            06B03E2C69DB75BB6D435BD6CFF6210A22D2E1CF9D211F7828FBBCFF0078F4CD
            34F9509EACF56B2D574ED48B0B1BFB5B92BF78432AB11F91AB95F2F6B3771E97
            3DA6A9A3787F51F0E5D2BEE85DA5664957FE0401CFE608AF79D5F51F105E7816
            DF52F0D470C9A94F0C53059003952016DA0F19FAD0A57071B1D39207520738E4
            F7A70FBC3EB5F3EC1717DE2CD523D3BC63E2AD4346BF8E50D0DBCB6E228F3D88
            390037D7F3AF67D775697C33E186BE8ED6E75592DD1176C7CBC9D06E381F8920
            5352B89AB1C3FC2A571E2AF1A1B807ED62F00627AE373FFF005ABD4ABE7DD1BE
            21CBA5F8EF59D561D02E58EA71AFFA0AB1DCB20C7CDD391D7B77AEAB49F895E2
            CD63C4369609E1636F6F3C811DDA39331A9EAD9200E3AD4C64AD629C59E9D7BA
            9D869AA1AFAF6DED81E9E74A133F9D4B6F736F7902CD6D3C53C4DD1E370C0FE2
            2BE79BFD3ED74CF14DE41AF79BE2FD69C90B6D6CEE123C9CE598739C7F08E055
            8F006AD268DF1360D3ACEDEF2C2C6F58C53D85D3926362A48EA07423838CE29F
            3EA2E53E83C1F4A2BC23C41A878A6F3E296B5E1DD1F509626BF748866420451A
            A86C8FEEF19CE39AD3F0E5BEAFF0F7E24596857FA9BDF58EAF170EC5B1BF9C10
            0938208C7B834730729EC957ACBFD4B7FBDFD0551ABD65FEA5BFDEFE829CF614
            772ACFB44EDB7A0C63F2AE2E1B8FEC3F14DC24DF2C13B727D8F20FE75DA5C106
            762071C63F2AC5D73465D56DC14216E63FB8C7A11E86B9B134E728A9C3E28EA7
            5E0EAC23370A9F0CB47FE65EBD85AE74F9E18C8DD246554F6E4565DAEB6B6AB1
            DAEA76F25AC8A02EF2328D8F7AC7D3B5DBBD1DFEC77F13B469C60FDE4FA7A8AE
            9A0D474ED4E2DAB2C522B758E4C67F23510AF1ACF9A12B4BB335A9879505CB52
            3CD1DD35FD7E65C8E449503C6EAE87A153915950BC5A24374F7B322896769100
            39241E9C52B6810C6E64B1B89ECC9EA226CA9FC0D496FA35A5ACBF689CB5C4FD
            7CDB86C91F4EC2B57ED5B4F9526BADF4FF003318FB18A6B99B4FA5B5FF002FCF
            D0AA2E354D5F8B65363687FE5AB8FDE30F61DAB4AC74FB7D3A1290AF2797918E
            598FA93505D6B9A7DA1DA6712C9DA38BE627F2AAC23BED608FB50369647FE580
            6FDE4A3FDAF41529C54B47CD2FCBF45F9FA9725394755C90FCFF0056FF000F42
            D432FF0068DD89133F6481BE56ED2BFA8F61FCEB457EF0FAD311238512340A8A
            0615471C7B53ABA211696BB9C939293D363C93E0FB3C7E25F175B9076ADC06FA
            1DEE2BD6EAADA69D636135CBDA5B430C973279D398D403237F78D590CAD9C303
            8EB83551565625BBB3C73E21EA4DE1CF8BDA06B536E4B558543B81D537307FD0
            D4FE289AC63F8CDA1EA3ADCA83467B40F6B349FEAB760919EDD483F957A7EA9A
            3699ADC090EA76305DC68DBD1664CED3EA28D4748D3357B3FB1EA1656F756EBD
            2391010BF4F4FC2A7958F98F36F8B5E2EF0E5F783A4D3ADEFEDEFAF65911A210
            B6FF002F0725891D38C8FC6B52F7C5527823E14E8B746DC497B25B450C314990
            3715CE5BD80AE92CFC0FE16D3A4F36DB41B0471C8668F711FF007D6715A3A8E9
            9A66B765F64D42DADEF2D98EE08F86191DC7FF005A9D9EE174709A96ABE12F12
            783A04F186A7A49D4043B9DAD640CF0BFF00B18C9CF4E3A1A8BE0B6ADA8DEE89
            7F6970D34D6167285B3B894609539CAFE1807DB38AEA22F87BE0FB67122F87EC
            411CE5D4B01F99C574504305BC090DB451C50A0C2A46A0281EC05093BDC1B56B
            1E67F14AE3FE11DF117863C5510F9ADE7682603F8A33C91F916AF4D8E61716E9
            340FB92440F1B7A82320D55D4B4AD3B5BB3FB2EA3690DDDBEE0DB241B86E1DEA
            DA04540A8142A8DA02F418ED4D2D44DE878EFC2DD4748D06F3C40BAFDE4367AE
            1BB2B235D36D629D4E09FF006B24FE1506BBAD699E25F8D3E1B6D1255B836EE8
            B34F18E1F049383DC01DEBD4755F0B78775EB9F3752D2ECEEAE1060BB2FCE076
            048E7F3A9F4DF0FE8BA27CDA76996768718DF1C615B1FEF75A9E57B0EEB73CDF
            CBDDFB479310CEDB6DEF8EDFBAFF00F553FE2A164F1D782E44C87139008FFAE8
            95E9E96562B7CD7C96F6E2EE54DAD3AA8DECA3B6EEA454779A569DA85D5A5C5E
            5A4335C5A3F996EEE32D1B7A8A7CBA073179BEF1FAD5DB2FF52DFEF7F41546AF
            597FA96FF7BFA0A27B0A3B95AE0933B1231D38FC2A2A9AEBFE3E5FF0FE550D35
            B09EE57BBB1B5BE4D9730AC807427A8FA1AC49BC1F68ED986E258FD880D8AE8E
            8ACAA61E954D671B9BD2C556A5A42563998FC2F771F09ABCAABE8A08FEB53AF8
            5A276DD757D733FB16C56FD159AC1D15D3F166AF1F887F6BF05FE454B4D2ECAC
            7FE3DEDD11BFBD8CB7E66B0FC4961ABDE6AF67369C1D2386265699240AC3730D
            C067BED5C67FDAAE9E8AE8508C55A2AC8E594E527CD277679E0D33C5C6FADAEE
            E3ED334B68A391326D7CF960841EB80FB89EB9E2A5934FF16CC924572D752214
            80B159D572C1959C2E3A8E0F5C1EDCD77D453E515CE01F4DF17C12C0F1493CB3
            3183CEB86953771F338C71F2E59801EC3D6A2B2D23C4D60D1F9504E87E691BCA
            9D02B109F2A3E7920BB31CF38C0F5AF44A297285CE060B0F1B7D9A391AF2759E
            30DB51A4520E7CC3F375C9FF0056073C53F48D2BC496BAAC32B35DA413DC79D3
            19674621738224C7DE250205C74E6BBBA28E50B9C74965E2696DBC4A970EF279
            F1BC5671AB281824E0A9CF1F21039C73594340D7ACE19E4D32CDECD1B2D6F6D1
            48998725148CE782C132DB4F1BBBD7A3514F942E708FA3788A49AF896B8D924B
            BC46F3AB24A4BA8E98E8114F1C726ABD869DE31B3B5820885C4711F94AB4E8C6
            362537B67FBA7F79B457A1D14B942E7010E97E2DB78D59659D53077C30CA8320
            EC2DB78C0724C873EDEF573C35A5F886C351B54BA6952D555A49B74AAC8C5812
            411D4C9BCE4B74C0AECE8A7CA173CE2CF49F11D8DFBCD0E9863BA8C626B88E65
            CDF9690B1624F4C60000F3863E94EB8D2BC6178D245701E489445B55A752ACE8
            09DDF890323DFDABD168A5CA173CE25D1BC5B11924B6598CF1C62DA293CF550A
            BB89CC60745C2C6083EF4B71A4F8CE5BD92ED25996607C92E254E54B31CC638D
            ABC45907D0D7A35147285C4190A013938E4D5FB2FF0052DFEF7F41546AF597FA
            96FF007BFA0A27B04773FFD9}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 211.653680000000000000
          Top = 3.779530000000001000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[empresa]')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 211.653680000000000000
          Top = 20.456709999999990000
          Width = 415.748300000000000000
          Height = 37.795300000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'www.plasfan.ind.br'
            'Email: plasfan@terra.com.br'
            'Fone: (47)3346-2052')
          ParentFont = False
        end
      end
      object MasterData4: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 253.228510000000000000
        Width = 718.110700000000000000
        RowCount = 1
        object Subreport1: TfrxSubreport
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Page = fR_RELATORIO.Page2
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 336.378170000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 393.071120000000000000
          Width = 321.260050000000000000
          Height = 30.236240000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Faturamento Real: [fat_real]')
          ParentFont = False
        end
      end
    end
    object Page2: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Frame.Typ = []
        Height = 15.118120000000000000
        Top = 253.228510000000000000
        Width = 718.110700000000000000
        OnAfterCalcHeight = 'DetailData1OnAfterCalcHeight'
        OnAfterPrint = 'DetailData1OnAfterPrint'
        OnBeforePrint = 'DetailData1OnBeforePrint'
        DataSet = Dm.dst_custo_fixo
        DataSetName = 'dst_custo_fixo'
        KeepChild = True
        RowCount = 0
        object mmData: TfrxMemoView
          AllowVectorExport = True
          Left = 37.795300000000000000
          Top = 0.779530000000022500
          Width = 52.913420000000000000
          Height = 11.338590000000000000
          DataField = 'DATA'
          DataSet = Dm.dst_custo_fixo
          DataSetName = 'dst_custo_fixo'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_custo_fixo."DATA"]')
          ParentFont = False
        end
        object mmValor: TfrxMemoView
          AllowVectorExport = True
          Left = 627.842920000000000000
          Top = 0.779529999999994100
          Width = 86.929190000000000000
          Height = 11.338590000000000000
          DataField = 'VALOR'
          DataSet = Dm.dst_custo_fixo
          DataSetName = 'dst_custo_fixo'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_custo_fixo."VALOR"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object mmCliente: TfrxMemoView
          AllowVectorExport = True
          Left = 94.488250000000000000
          Top = 0.779530000000022500
          Width = 245.669450000000000000
          Height = 11.338590000000000000
          OnBeforePrint = 'Memo5OnBeforePrint'
          DataField = 'CLIENTE_FORNECEDOR'
          DataSet = Dm.dst_custo_fixo
          DataSetName = 'dst_custo_fixo'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_custo_fixo."CLIENTE_FORNECEDOR"]')
          ParentFont = False
        end
        object mmTitulo: TfrxMemoView
          AllowVectorExport = True
          Left = 555.590910000000000000
          Top = 1.000000000000000000
          Width = 68.031540000000000000
          Height = 11.338590000000000000
          DataField = 'TITULO'
          DataSet = Dm.dst_custo_fixo
          DataSetName = 'dst_custo_fixo'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_custo_fixo."TITULO"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object mmHistorico: TfrxMemoView
          AllowVectorExport = True
          Left = 341.937230000000000000
          Top = 1.000000000000000000
          Width = 211.653543310000000000
          Height = 11.338590000000000000
          OnBeforePrint = 'Memo5OnBeforePrint'
          DataField = 'HISTORICO'
          DataSet = Dm.dst_custo_fixo
          DataSetName = 'dst_custo_fixo'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_custo_fixo."HISTORICO"]')
          ParentFont = False
        end
      end
      object GroupHeader2: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 35.236240000000000000
        Top = 196.535560000000000000
        Width = 718.110700000000000000
        Condition = 'dst_custo_fixo."DESCRICAO4"'
        KeepChild = True
        KeepTogether = True
        object mmDescricao4: TfrxMemoView
          AllowVectorExport = True
          Left = 37.795300000000000000
          Top = 1.779529999999994000
          Width = 597.165740000000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_comissao_nova
          DataSetName = 'dst_comissao_nova'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_custo_fixo."DESCRICAO4"]')
          ParentFont = False
        end
        object lbCliente: TfrxMemoView
          AllowVectorExport = True
          Left = 93.708720000000000000
          Top = 22.118120000000000000
          Width = 245.669450000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Cliente/Fornecedor')
          ParentFont = False
        end
        object lbData: TfrxMemoView
          AllowVectorExport = True
          Left = 37.692950000000000000
          Top = 21.897650000000000000
          Width = 52.913420000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object lbValor: TfrxMemoView
          AllowVectorExport = True
          Left = 627.961040000000000000
          Top = 21.897650000000000000
          Width = 86.929190000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
        end
        object lbTitulo: TfrxMemoView
          AllowVectorExport = True
          Left = 555.590910000000000000
          Top = 21.677179999999990000
          Width = 68.031540000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'T'#237'tulo')
          ParentFont = False
        end
        object lbHistorico: TfrxMemoView
          AllowVectorExport = True
          Left = 342.157700000000000000
          Top = 21.897650000000000000
          Width = 211.653680000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Hist'#243'rico')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 291.023810000000000000
        Width = 718.110700000000000000
        object mmTotal4: TfrxMemoView
          AllowVectorExport = True
          Left = 529.134200000000000000
          Width = 185.196970000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          DataSet = Dm.dst_custo_fixo
          DataSetName = 'dst_custo_fixo'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8W = (
            
              ' [dst_custo_fixo."DESCRICAO4"] - Total : [SUM(<dst_custo_fixo."V' +
              'ALOR">,DetailData1)]')
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 154.960730000000000000
        Width = 718.110700000000000000
        Condition = 'dst_custo_fixo."DESCRICAO3"'
        object mmDescricao3: TfrxMemoView
          AllowVectorExport = True
          Left = 26.456710000000000000
          Top = 0.779529999999994100
          Width = 631.181510000000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_comissao_nova
          DataSetName = 'dst_comissao_nova'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_custo_fixo."DESCRICAO3"]')
          ParentFont = False
        end
      end
      object GroupHeader3: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 109.606370000000000000
        Width = 718.110700000000000000
        Condition = 'dst_custo_fixo."DESCRICAO2"'
        object mmDescricao2: TfrxMemoView
          AllowVectorExport = True
          Left = 15.118120000000000000
          Width = 665.197280000000000000
          Height = 18.897650000000000000
          DataSet = Dm.dst_comissao_nova
          DataSetName = 'dst_comissao_nova'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_custo_fixo."DESCRICAO2"]')
          ParentFont = False
        end
      end
      object GroupHeader4: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 64.252010000000000000
        Width = 718.110700000000000000
        Condition = 'dst_custo_fixo."DESCRICAO1"'
        object mmDescricao1: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 665.197280000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'mmDescricao1OnBeforePrint'
          DataSet = Dm.dst_comissao_nova
          DataSetName = 'dst_comissao_nova'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_custo_fixo."DESCRICAO1"]')
          ParentFont = False
        end
      end
      object GroupFooter2: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 377.953000000000000000
        Width = 718.110700000000000000
        object mmTotal3: TfrxMemoView
          AllowVectorExport = True
          Left = 529.134200000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataSet = Dm.dst_plano_contas
          DataSetName = 'dst_plano_contas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8W = (
            
              ' [dst_custo_fixo."DESCRICAO2"] - Total : [SUM(<dst_custo_fixo."V' +
              'ALOR">,DetailData1)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
      end
      object GroupFooter3: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 332.598640000000000000
        Width = 718.110700000000000000
        object mmTotal2: TfrxMemoView
          AllowVectorExport = True
          Left = 529.134200000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataSet = Dm.dst_plano_contas
          DataSetName = 'dst_plano_contas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[dst_custo_fixo."DESCRICAO3"] - Total : [SUM(<dst_custo_fixo."VA' +
              'LOR">,DetailData1)]')
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object GroupFooter4: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 423.307360000000000000
        Width = 718.110700000000000000
        object mmTotal1: TfrxMemoView
          AllowVectorExport = True
          Left = 529.134200000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataSet = Dm.dst_plano_contas
          DataSetName = 'dst_plano_contas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8W = (
            
              ' [dst_custo_fixo."DESCRICAO1"] - Total : [SUM(<dst_custo_fixo."V' +
              'ALOR">,DetailData1)]')
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object MasterData3: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        DataSet = Dm.dst_custo_fixo
        DataSetName = 'dst_custo_fixo'
        RowCount = 0
      end
    end
    object Page3: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object Header1: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 15.118120000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 153.283550000000000000
          Top = 3.220470000000010000
          Width = 245.669450000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Cliente')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 37.795300000000000000
          Top = 3.999999999999990000
          Width = 52.913420000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 401.732530000000000000
          Top = 3.779529999999990000
          Width = 68.031540000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Fat. Bruto')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 92.811070000000000000
          Top = 3.999999999999990000
          Width = 56.692950000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'N'#186' Pedido')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 472.441250000000000000
          Top = 3.779529999999990000
          Width = 68.031540000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Custo')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 543.252320000000000000
          Top = 3.779529999999990000
          Width = 68.031540000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Fat. L'#237'quido')
          ParentFont = False
        end
      end
      object MasterData2: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 15.118120000000000000
        Top = 56.692950000000000000
        Width = 718.110700000000000000
        DataSet = Dm.dst_fat_liq
        DataSetName = 'dst_fat_liq'
        RowCount = 0
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 37.795300000000000000
          Top = 1.559059999999990000
          Width = 52.913420000000000000
          Height = 11.338590000000000000
          DataField = 'DTA_EMISSAO'
          DataSet = Dm.dst_fat_liq
          DataSetName = 'dst_fat_liq'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_fat_liq."DTA_EMISSAO"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 92.708720000000000000
          Top = 1.000000000000000000
          Width = 56.692913390000000000
          Height = 11.338590000000000000
          DataField = 'NUMDOC'
          DataSet = Dm.dst_fat_liq
          DataSetName = 'dst_fat_liq'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_fat_liq."NUMDOC"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 152.181200000000000000
          Top = 1.000000000000000000
          Width = 245.669291340000000000
          Height = 11.338590000000000000
          DataField = 'CLIENTE'
          DataSet = Dm.dst_fat_liq
          DataSetName = 'dst_fat_liq'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_fat_liq."CLIENTE"]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 400.630180000000000000
          Top = 1.000000000000000000
          Width = 68.031503390000000000
          Height = 11.338590000000000000
          DataField = 'FAT_BRUTO'
          DataSet = Dm.dst_fat_liq
          DataSetName = 'dst_fat_liq'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_fat_liq."FAT_BRUTO"]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 472.441250000000000000
          Top = 1.000000000000000000
          Width = 68.031503390000000000
          Height = 11.338590000000000000
          DataField = 'CUSTO'
          DataSet = Dm.dst_fat_liq
          DataSetName = 'dst_fat_liq'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_fat_liq."CUSTO"]')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 543.252320000000000000
          Top = 1.000000000000000000
          Width = 68.031503390000000000
          Height = 11.338590000000000000
          DataField = 'FAT_LIQUIDO'
          DataSet = Dm.dst_fat_liq
          DataSetName = 'dst_fat_liq'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_fat_liq."FAT_LIQUIDO"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 94.488250000000000000
        Width = 718.110700000000000000
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 400.630180000000000000
          Top = 1.779529999999990000
          Width = 68.031503390000000000
          Height = 11.338590000000000000
          DataSet = Dm.dst_fat_liq
          DataSetName = 'dst_fat_liq'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<dst_fat_liq."FAT_BRUTO">,MasterData2)]')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 472.441250000000000000
          Top = 1.779529999999990000
          Width = 68.031503390000000000
          Height = 11.338590000000000000
          DataSet = Dm.dst_fat_liq
          DataSetName = 'dst_fat_liq'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<dst_fat_liq."CUSTO">,MasterData2)]')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 543.252320000000000000
          Top = 1.779529999999990000
          Width = 68.031503390000000000
          Height = 11.338590000000000000
          DataSet = Dm.dst_fat_liq
          DataSetName = 'dst_fat_liq'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<dst_fat_liq."FAT_LIQUIDO">,MasterData2)]')
          ParentFont = False
        end
      end
    end
  end
  object Q_Plano_Conta1: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      '')
    Left = 272
    Top = 202
  end
  object Q_Plano_Conta2: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      '')
    Left = 304
    Top = 202
  end
  object Q_Plano_Conta3: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      '')
    Left = 336
    Top = 202
  end
  object Q_Plano_Conta4: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      '')
    Left = 368
    Top = 202
  end
end
