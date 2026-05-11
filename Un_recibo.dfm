object Fr_recibo: TFr_recibo
  Left = 184
  Top = 18
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Recibos'
  ClientHeight = 524
  ClientWidth = 628
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
  object Panel1: TsPanel
    Left = 0
    Top = 483
    Width = 628
    Height = 41
    Align = alBottom
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object btnov: TsBitBtn
      Left = 6
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Inclui'
      TabOrder = 0
      OnClick = btnovClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btalt: TsBitBtn
      Left = 82
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Altera'
      TabOrder = 1
      OnClick = btaltClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btgra: TsBitBtn
      Left = 158
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
      Left = 234
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
      Left = 310
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Excluir'
      TabOrder = 4
      OnClick = btexcClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btpro: TsBitBtn
      Left = 386
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
    object BtnImprimir: TsBitBtn
      Left = 462
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Im&primir'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      TabOrder = 6
      OnClick = BtnImprimirClick
      SkinData.SkinSection = 'BUTTON'
    end
    object BtnCtaPagar: TsBitBtn
      Left = 548
      Top = 8
      Width = 75
      Height = 25
      Caption = 'C.Pagar'
      Enabled = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337333733373
        3373337F3F7F3F7F3F7F33737373737373733F7F7F7F7F7F7F7F770000000000
        00007777777777777777330333333C333333337FFF3337F3333F370993333C33
        3399377773F337F33377330339333C3339333F7FF7FFF7FFF7FF770777977C77
        97777777777777777777330333933C339333337F3373F7F37333370333393C39
        3333377F333737F7333333033333999333333F7FFFFF777FFFFF770777777C77
        77777777777777777777330333333C330333337F333337FF7FF3370333333C00
        003C377F333337777737330333333C3303333F7FFFFFF7FF7FFF770777777777
        7777777777777777777733333333333333333333333333333333}
      NumGlyphs = 2
      TabOrder = 7
      OnClick = BtnCtaPagarClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object GroupBox1: TsGroupBox
    Left = 0
    Top = 0
    Width = 628
    Height = 483
    Align = alClient
    TabOrder = 1
    SkinData.SkinSection = 'GROUPBOX'
    object Label1: TsLabel
      Left = 8
      Top = 16
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
    object Label35: TsLabel
      Left = 8
      Top = 54
      Width = 40
      Height = 13
      Caption = 'Sacado:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object lbForn: TsLabel
      Left = 9
      Top = 91
      Width = 43
      Height = 13
      Caption = 'Sacador:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object LbNom_fornecedor: TsLabel
      Left = 77
      Top = 347
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
    object Label21: TsLabel
      Left = 9
      Top = 168
      Width = 27
      Height = 13
      Caption = 'Valor:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Label3: TsLabel
      Left = 12
      Top = 128
      Width = 26
      Height = 13
      Caption = 'Data:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Label2: TsLabel
      Left = 8
      Top = 208
      Width = 50
      Height = 13
      Caption = 'Referente:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object lbContasPagar: TsLabelFX
      Left = 605
      Top = 32
      Width = 11
      Height = 21
      Alignment = taRightJustify
      Caption = '.'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Angle = 0
      Shadow.OffsetKeeper.LeftTop = -3
      Shadow.OffsetKeeper.RightBottom = 5
    end
    object Label18: TsLabel
      Left = 10
      Top = 327
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
    object Prid: TsEdit
      Left = 8
      Top = 30
      Width = 45
      Height = 21
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnKeyPress = PridKeyPress
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
    object Prvalor: TsCurrencyEdit
      Left = 8
      Top = 181
      Width = 90
      Height = 21
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
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
    object Prdata: TsDateEdit
      Left = 8
      Top = 141
      Width = 91
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
      TabOrder = 3
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
    object PrReferente: TRichEdit
      Left = 8
      Top = 221
      Width = 610
      Height = 102
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 7
      Zoom = 100
    end
    object PrSacado: TsEdit
      Left = 8
      Top = 67
      Width = 609
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
    object PrEmitente: TsEdit
      Left = 8
      Top = 104
      Width = 609
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
    object ckLogo: TsCheckBox
      Left = 112
      Top = 184
      Width = 74
      Height = 20
      Caption = 'Com Logo?'
      Alignment = taLeftJustify
      Checked = True
      State = cbChecked
      TabOrder = 5
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
    object ckVias: TsCheckBox
      Left = 200
      Top = 184
      Width = 54
      Height = 20
      Caption = '2 vias?'
      Alignment = taLeftJustify
      TabOrder = 6
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
    object Prcod_fornecedor: TsComboEdit
      Left = 7
      Top = 342
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
      TabOrder = 8
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
    object gbPlanoContas: TsGroupBox
      Left = 7
      Top = 367
      Width = 611
      Height = 83
      Caption = 'Plano De Contas'
      TabOrder = 9
      SkinData.SkinSection = 'GROUPBOX'
      object Lbnom_plano_contas_N1: TsLabel
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
      object Lbnom_plano_contas_N2: TsLabel
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
      object Lbnom_plano_contas_N3: TsLabel
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
      object Lbnom_plano_contas_N4: TsLabel
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
      object PrID_PLANO_DE_CONTAS: TsComboEdit
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
        OnExit = PrID_PLANO_DE_CONTASExit
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
        OnButtonClick = PrID_PLANO_DE_CONTASButtonClick
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
    end
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
    ReportOptions.CreateDate = 40438.591957824100000000
    ReportOptions.LastChange = 41718.392828622700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin          '
      ' Picture1.Visible := <LOGO>;'
      ' Picture2.Visible := <LOGO>;'
      
        ' MasterData2.Visible := <DUAS_VIAS>;                            ' +
        '     '
      'end.')
    OnGetValue = fR_RELATORIOGetValue
    Left = 416
    Top = 65528
    Datasets = <
      item
        DataSet = Dm.dst_configuracao
        DataSetName = 'dst_configuracao'
      end
      item
        DataSet = dst_recibo
        DataSetName = 'dst_recibo'
      end>
    Variables = <
      item
        Name = ' EXTENSO'
        Value = Null
      end
      item
        Name = ' LOGO'
        Value = Null
      end
      item
        Name = ' DUAS_VIAS'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 491.338582677165000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        DataSet = dst_recibo
        DataSetName = 'dst_recibo'
        RowCount = 0
        object Shape1: TfrxShapeView
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 491.338900000000000000
          Frame.Typ = []
        end
        object Shape3: TfrxShapeView
          AllowVectorExport = True
          Top = 86.149660000000000000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          Frame.Typ = []
        end
        object Shape4: TfrxShapeView
          AllowVectorExport = True
          Top = 113.385900000000000000
          Width = 718.110236220000000000
          Height = 84.283467010000000000
          Frame.Typ = []
        end
        object Shape5: TfrxShapeView
          AllowVectorExport = True
          Top = 198.315090000000000000
          Width = 718.110236220000000000
          Height = 141.732283464567000000
          Frame.Typ = []
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 212.653680000000000000
          Top = 3.000000000000000000
          Width = 294.803340000000000000
          Height = 58.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -29
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'RECIBO N'#176' [dst_recibo."ID"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 4.779530000000000000
          Top = 3.000000000000000000
          Width = 204.000000000000000000
          Height = 58.000000000000000000
          AutoSize = True
          DataField = 'LOGO'
          DataSet = Dm.dst_configuracao
          DataSetName = 'dst_configuracao'
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
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 511.236550000000000000
          Top = 3.000000000000000000
          Width = 200.315090000000000000
          Height = 58.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'VALOR: [dst_recibo."VALOR" #n%2,2m]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 19.897650000000000000
          Top = 86.149660000000000000
          Width = 691.653990000000000000
          Height = 26.456710000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haBlock
          Memo.UTF8W = (
            'Recebi(emos) de: [dst_recibo."SACADO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 19.897650000000000000
          Top = 117.165430000000000000
          Width = 691.653990000000000000
          Height = 75.590600000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haBlock
          Memo.UTF8W = (
            'A import'#226'ncia de: [EXTENSO].')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 20.031496060000000000
          Top = 200.094620000000000000
          Width = 691.653990000000000000
          Height = 132.283464570000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haBlock
          Memo.UTF8W = (
            'Referente: [dst_recibo."REFERENTE"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 20.031496060000000000
          Top = 342.937230000000000000
          Width = 691.653990000000000000
          Height = 26.456710000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd '#39'de'#39' mmmm '#39'de'#39' yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haBlock
          Memo.UTF8W = (
            'Itaja'#237', [dst_recibo."DATA"].')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 19.897650000000000000
          Top = 380.732530000000000000
          Width = 691.653990000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haBlock
          Memo.UTF8W = (
            '[dst_recibo."EMITENTE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 18.897650000000000000
          Top = 438.425480000000000000
          Width = 306.141930000000000000
          Height = 45.354360000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '________________________'
            'Assinatura')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData2: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 491.338582680000000000
        Top = 532.913730000000000000
        Width = 718.110700000000000000
        DataSet = dst_recibo
        DataSetName = 'dst_recibo'
        RowCount = 0
        object Shape2: TfrxShapeView
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 491.338900000000000000
          Frame.Typ = []
        end
        object Shape8: TfrxShapeView
          AllowVectorExport = True
          Top = 197.094620000000000000
          Width = 718.110236220000000000
          Height = 141.732283464567000000
          Frame.Typ = []
        end
        object Shape7: TfrxShapeView
          AllowVectorExport = True
          Top = 113.165430000000000000
          Width = 718.110236220000000000
          Height = 84.283467010000000000
          Frame.Typ = []
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 212.653680000000000000
          Top = 3.000000000000000000
          Width = 294.803340000000000000
          Height = 58.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -29
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'RECIBO N'#176' [dst_recibo."ID"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Picture2: TfrxPictureView
          AllowVectorExport = True
          Left = 4.779530000000000000
          Top = 3.000000000000000000
          Width = 204.000000000000000000
          Height = 58.000000000000000000
          AutoSize = True
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
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 511.236550000000000000
          Top = 3.000000000000000000
          Width = 200.315090000000000000
          Height = 58.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'VALOR: [dst_recibo."VALOR" #n%2,2m]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 19.897650000000000000
          Top = 86.149660000000000000
          Width = 691.653990000000000000
          Height = 26.456710000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haBlock
          Memo.UTF8W = (
            'Recebi(emos) de: [dst_recibo."SACADO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 19.897650000000000000
          Top = 118.165430000000000000
          Width = 691.653990000000000000
          Height = 75.590600000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haBlock
          Memo.UTF8W = (
            'A import'#226'ncia de: [EXTENSO].')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 20.031496060000000000
          Top = 199.094620000000000000
          Width = 691.653990000000000000
          Height = 132.283464570000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haBlock
          Memo.UTF8W = (
            'Referente: [dst_recibo."REFERENTE"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 18.897650000000000000
          Top = 438.425480000000000000
          Width = 306.141930000000000000
          Height = 45.354360000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '________________________'
            'Assinatura')
          ParentFont = False
          VAlign = vaCenter
        end
        object Shape6: TfrxShapeView
          AllowVectorExport = True
          Top = 86.929190000000100000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          Frame.Typ = []
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 19.031496060000000000
          Top = 355.275820000000000000
          Width = 691.653990000000000000
          Height = 26.456710000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd '#39'de'#39' mmmm '#39'de'#39' yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haBlock
          Memo.UTF8W = (
            'Itaja'#237', [dst_recibo."DATA"].')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 18.897650000000000000
          Top = 393.071120000000000000
          Width = 691.653990000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haBlock
          Memo.UTF8W = (
            '[dst_recibo."EMITENTE"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object dst_recibo: TfrxDBDataset
    UserName = 'dst_recibo'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'DATA=DATA'
      'VALOR=VALOR'
      'REFERENTE=REFERENTE'
      'SACADO=SACADO'
      'EMITENTE=EMITENTE')
    DataSet = q_recibo
    BCDToCurrency = False
    Left = 288
    Top = 24
  end
  object ACBrExtenso1: TACBrExtenso
    StrMoeda = 'Real'
    StrMoedas = 'Reais'
    StrCentavo = 'Centavo'
    StrCentavos = 'Centavos'
    Left = 432
    Top = 24
  end
  object ACBrBoletoFCFR1: TACBrBoletoFCFR
    ModoThread = False
    IncorporarBackgroundPdf = False
    IncorporarFontesPdf = False
    Left = 311
    Top = 391
  end
  object q_recibo: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'SELECT a.ID, a.DATA, a.VALOR, a.REFERENTE, a.SACADO, a.EMITENTE,' +
        ' a.cod_fornecedor, a.ID_PLANO_DE_CONTAS, a.id_contas_pagar'
      'FROM RECIBO a')
    Left = 184
    Top = 56
    object q_reciboID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object q_reciboDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object q_reciboVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 18
      Size = 2
    end
    object q_reciboREFERENTE: TBlobField
      FieldName = 'REFERENTE'
      Origin = 'REFERENTE'
    end
    object q_reciboSACADO: TStringField
      FieldName = 'SACADO'
      Origin = 'SACADO'
      Size = 100
    end
    object q_reciboEMITENTE: TStringField
      FieldName = 'EMITENTE'
      Origin = 'EMITENTE'
      Size = 100
    end
    object q_reciboCOD_FORNECEDOR: TIntegerField
      FieldName = 'COD_FORNECEDOR'
      Origin = 'COD_FORNECEDOR'
    end
    object q_reciboID_PLANO_DE_CONTAS: TIntegerField
      FieldName = 'ID_PLANO_DE_CONTAS'
      Origin = 'ID_PLANO_DE_CONTAS'
    end
    object q_reciboID_CONTAS_PAGAR: TIntegerField
      FieldName = 'ID_CONTAS_PAGAR'
      Origin = 'ID_CONTAS_PAGAR'
    end
  end
end
