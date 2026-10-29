object FrPedidosML: TFrPedidosML
  Left = 0
  Top = 0
  Caption = 'Pedidos Mercado Livre'
  ClientHeight = 600
  ClientWidth = 900
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TsPanel
    Left = 0
    Top = 559
    Width = 900
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object btImprimir: TsSpeedButton
      Left = 8
      Top = 6
      Width = 86
      Height = 30
      Caption = 'Imprimir'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btImprimirClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
  end
  object Panel2: TsPanel
    Left = 0
    Top = 0
    Width = 900
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object btAtualizar: TsSpeedButton
      Left = 8
      Top = 6
      Width = 86
      Height = 30
      Caption = 'Atualizar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btAtualizarClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object lbTotal: TsLabel
      Left = 104
      Top = 14
      Width = 56
      Height = 13
      Caption = 'Registros: 0'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object lbPeriodo: TsLabel
      Left = 180
      Top = 14
      Width = 50
      Height = 13
      Caption = 'Per'#237'odo:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object lbAte: TsLabel
      Left = 340
      Top = 14
      Width = 19
      Height = 13
      Caption = 'at'#233
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object lbStatus: TsLabel
      Left = 478
      Top = 14
      Width = 41
      Height = 13
      Caption = 'Status:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object dtInicial: TDateTimePicker
      Left = 228
      Top = 10
      Width = 104
      Height = 21
      Date = 46322.441102291670000000
      Format = 'dd/MM/yyyy'
      Time = 46322.441102291670000000
      TabOrder = 0
    end
    object dtFinal: TDateTimePicker
      Left = 364
      Top = 10
      Width = 104
      Height = 21
      Date = 46322.441102314820000000
      Format = 'dd/MM/yyyy'
      Time = 46322.441102314820000000
      TabOrder = 2
    end
    object cbStatus: TComboBox
      Left = 524
      Top = 10
      Width = 130
      Height = 21
      Style = csDropDownList
      TabOrder = 1
    end
  end
  object dgPedidos: TDBGrid
    Left = 0
    Top = 41
    Width = 900
    Height = 518
    Align = alClient
    Color = clWhite
    DataSource = dsPedidos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dgPedidosDrawColumnCell
  end
  object dsPedidos: TDataSource
    DataSet = qPedidos
    Left = 48
    Top = 120
  end
  object qPedidos: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'select m.numdoc, cast(upper(m.buyer_name) as varchar(200)) buyer' +
        '_name, m.total_amount,'
      'm.taxa_ml, m.taxa_frete, m.data_fechamento,'
      
        'cast(case v.faturado when 0 then '#39'FATURAR'#39' when 1 then '#39'FATURADO' +
        #39
      'when 2 then '#39'CANCELADO'#39' end as varchar(100)) status'
      'from ml_pedido m'
      'inner join vendas1 v on v.numdoc = m.numdoc'
      'order by 1 desc')
    Left = 120
    Top = 120
    object qPedidosnumdoc: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'N'#186' Pedido'
      FieldName = 'numdoc'
      Origin = 'numdoc'
    end
    object qPedidosdata_fechamento: TSQLTimeStampField
      Alignment = taCenter
      DisplayLabel = 'Data Compra'
      DisplayWidth = 20
      FieldName = 'data_fechamento'
      Origin = 'data_fechamento'
    end
    object qPedidosbuyer_name: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Comprador'
      DisplayWidth = 50
      FieldName = 'buyer_name'
      Origin = 'buyer_name'
      ReadOnly = True
      Size = 100
    end
    object qPedidostotal_amount: TBCDField
      DisplayLabel = 'Valor'
      FieldName = 'total_amount'
      Origin = 'total_amount'
      currency = True
      Precision = 15
      Size = 2
    end
    object qPedidosstatus: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Status'
      DisplayWidth = 15
      FieldName = 'status'
      Origin = 'status'
      ReadOnly = True
      Size = 100
    end
    object qPedidostaxa_ml: TBCDField
      DisplayLabel = 'Taxa ML'
      DisplayWidth = 10
      FieldName = 'taxa_ml'
      Origin = 'taxa_ml'
      currency = True
      Precision = 15
      Size = 2
    end
    object qPedidostaxa_frete: TBCDField
      DisplayLabel = 'Taxa Frete'
      DisplayWidth = 10
      FieldName = 'taxa_frete'
      Origin = 'taxa_frete'
      currency = True
      Precision = 15
      Size = 2
    end
  end
  object fR_RELATORIO: TfrxReport
    Version = '6.9.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 46322.474736805600000000
    ReportOptions.LastChange = 46323.338347465300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 320
    Top = 120
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'Pedidos'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
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
        Height = 44.000000000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        StartNewPage = True
        object mTitulo: TfrxMemoView
          AllowVectorExport = True
          Width = 1047.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Pedidos Mercado Livre')
          ParentFont = False
        end
        object mPeriodo: TfrxMemoView
          AllowVectorExport = True
          Top = 22.000000000000000000
          Width = 1047.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.000000000000000000
        Top = 86.929190000000000000
        Width = 1046.929810000000000000
        object hNum: TfrxMemoView
          AllowVectorExport = True
          Top = 2.000000000000000000
          Width = 70.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'N'#186' Pedido')
          ParentFont = False
        end
        object hData: TfrxMemoView
          AllowVectorExport = True
          Left = 70.000000000000000000
          Top = 2.000000000000000000
          Width = 130.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Fechamento')
          ParentFont = False
        end
        object hComprador: TfrxMemoView
          AllowVectorExport = True
          Left = 200.000000000000000000
          Top = 2.000000000000000000
          Width = 380.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Comprador')
          ParentFont = False
        end
        object hValor: TfrxMemoView
          AllowVectorExport = True
          Left = 580.000000000000000000
          Top = 2.000000000000000000
          Width = 100.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
        end
        object hTaxaMl: TfrxMemoView
          AllowVectorExport = True
          Left = 680.000000000000000000
          Top = 2.000000000000000000
          Width = 100.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'Taxa ML')
          ParentFont = False
        end
        object hTaxaFrete: TfrxMemoView
          AllowVectorExport = True
          Left = 780.000000000000000000
          Top = 2.000000000000000000
          Width = 100.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'Taxa Frete')
          ParentFont = False
        end
        object hStatus: TfrxMemoView
          AllowVectorExport = True
          Left = 880.000000000000000000
          Top = 2.000000000000000000
          Width = 160.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Status')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -7
        Font.Name = 'Arial'
        Font.Style = []
        Height = 18.000000000000000000
        ParentFont = False
        Top = 170.078850000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBDataset1
        DataSetName = 'Pedidos'
        RowCount = 0
        object dNum: TfrxMemoView
          AllowVectorExport = True
          Width = 70.000000000000000000
          Height = 18.000000000000000000
          DataField = 'numdoc'
          DataSet = frxDBDataset1
          DataSetName = 'Pedidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Highlight.ApplyFont = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<Line#> mod 2 = 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 15724527
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[Pedidos."numdoc"]')
          ParentFont = False
        end
        object dData: TfrxMemoView
          AllowVectorExport = True
          Left = 70.000000000000000000
          Width = 130.000000000000000000
          Height = 18.000000000000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy hh:nn'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Highlight.ApplyFont = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<Line#> mod 2 = 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 15724527
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[Pedidos."DATA_FECHAMENTO"]')
          ParentFont = False
        end
        object dComprador: TfrxMemoView
          AllowVectorExport = True
          Left = 200.000000000000000000
          Width = 380.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Highlight.ApplyFont = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<Line#> mod 2 = 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 15724527
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[Pedidos."BUYER_NAME"]')
          ParentFont = False
        end
        object dValor: TfrxMemoView
          AllowVectorExport = True
          Left = 580.000000000000000000
          Width = 100.000000000000000000
          Height = 18.000000000000000000
          DisplayFormat.FormatStr = '#,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Highlight.ApplyFont = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<Line#> mod 2 = 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 15724527
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[Pedidos."TOTAL_AMOUNT"]')
          ParentFont = False
        end
        object dTaxaMl: TfrxMemoView
          AllowVectorExport = True
          Left = 680.000000000000000000
          Width = 100.000000000000000000
          Height = 18.000000000000000000
          DisplayFormat.FormatStr = '#,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Highlight.ApplyFont = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<Line#> mod 2 = 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 15724527
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[Pedidos."TAXA_ML"]')
          ParentFont = False
        end
        object dTaxaFrete: TfrxMemoView
          AllowVectorExport = True
          Left = 780.000000000000000000
          Width = 100.000000000000000000
          Height = 18.000000000000000000
          DisplayFormat.FormatStr = '#,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Highlight.ApplyFont = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<Line#> mod 2 = 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 15724527
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[Pedidos."TAXA_FRETE"]')
          ParentFont = False
        end
        object dStatus: TfrxMemoView
          AllowVectorExport = True
          Left = 880.000000000000000000
          Width = 160.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Highlight.ApplyFont = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<Line#> mod 2 = 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 15724527
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[Pedidos."STATUS"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 20.000000000000000000
        Top = 249.448980000000000000
        Width = 1046.929810000000000000
        object mRodape: TfrxMemoView
          AllowVectorExport = True
          Left = 760.000000000000000000
          Top = 2.000000000000000000
          Width = 287.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina [Page#] de [TotalPages#]')
          ParentFont = False
        end
      end
    end
  end
  object frxPDFExport1: TfrxPDFExport
    ShowDialog = False
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 400
    Top = 120
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'Pedidos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'numdoc=numdoc'
      'data_fechamento=data_fechamento'
      'buyer_name=buyer_name'
      'total_amount=total_amount'
      'status=status'
      'taxa_ml=taxa_ml'
      'taxa_frete=taxa_frete')
    DataSet = qPedidos
    BCDToCurrency = False
    Left = 240
    Top = 120
  end
end
