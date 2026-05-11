object frm_historico_processo_pedido: Tfrm_historico_processo_pedido
  Left = 0
  Top = 0
  Caption = 'Hist'#243'rico de Processo do Pedido'
  ClientHeight = 623
  ClientWidth = 760
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 760
    Height = 35
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object Lbl_produto: TsLabel
      Left = 9
      Top = 12
      Width = 47
      Height = 13
      Caption = 'Processo:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object PrProcesso_id: TsComboEdit
      Left = 60
      Top = 7
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
      OnExit = PrProcesso_idExit
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
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 35
    Width = 760
    Height = 588
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object Panel8: TPanel
      Left = 2
      Top = 2
      Width = 756
      Height = 584
      Align = alClient
      Caption = 'Panel8'
      TabOrder = 0
      object sPanel1: TsPanel
        Left = 1
        Top = 1
        Width = 754
        Height = 23
        Align = alTop
        Caption = 'HIST'#211'RICO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        SkinData.SkinSection = 'PANEL'
      end
      object pnProcesso: TPanel
        Left = 1
        Top = 382
        Width = 754
        Height = 162
        Align = alBottom
        BevelInner = bvLowered
        Enabled = False
        TabOrder = 1
        object sLabel8: TsLabel
          Left = 10
          Top = 6
          Width = 66
          Height = 13
          Caption = 'Observa'#231#245'es:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object edDesc: TsDBMemo
          Left = 10
          Top = 25
          Width = 735
          Height = 128
          DataField = 'OBS'
          DataSource = dsProcessos
          TabOrder = 0
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
        end
      end
      object Panel6: TPanel
        Left = 1
        Top = 544
        Width = 754
        Height = 39
        Align = alBottom
        TabOrder = 2
        object BTOK: TsBitBtn
          Left = 338
          Top = 6
          Width = 75
          Height = 26
          Caption = '&OK'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ModalResult = 1
          ParentFont = False
          TabOrder = 0
          SkinData.SkinSection = 'BUTTON'
        end
        object btImprimir: TsBitBtn
          Left = 670
          Top = 6
          Width = 75
          Height = 26
          Caption = '&IMPRIMIR'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = btImprimirClick
          SkinData.SkinSection = 'BUTTON'
        end
      end
      object gbProcessos: TDBGrid
        Left = 1
        Top = 24
        Width = 754
        Height = 358
        Align = alClient
        DataSource = dsProcessos
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ID'
            Title.Alignment = taCenter
            Title.Caption = 'Ord'
            Width = 39
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DATA'
            Title.Alignment = taCenter
            Title.Caption = 'Data'
            Width = 57
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'HORA'
            Title.Alignment = taCenter
            Title.Caption = 'Hora'
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBS'
            Title.Alignment = taCenter
            Title.Caption = 'Observa'#231#245'es'
            Width = 100
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NUMDOC'
            Title.Alignment = taCenter
            Title.Caption = 'Pedido'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLIENTE'
            Title.Alignment = taCenter
            Title.Caption = 'Cliente'
            Width = 310
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Title.Alignment = taCenter
            Title.Caption = 'Valor'
            Width = 75
            Visible = True
          end>
      end
    end
  end
  object mmProcessos: TRxMemoryData
    FieldDefs = <
      item
        Name = 'IDPRODUTO'
        DataType = ftInteger
      end
      item
        Name = 'NOME_PRODUTO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'CUSTO'
        DataType = ftCurrency
      end
      item
        Name = 'QTD_ENTRADA'
        DataType = ftFloat
      end
      item
        Name = 'SUB_TOTAL'
        DataType = ftCurrency
      end
      item
        Name = 'DT_ULTIMA_COMPRA'
        DataType = ftDate
      end
      item
        Name = 'QTD_ULTIMA_COMPRA'
        DataType = ftFloat
      end
      item
        Name = 'PRECO_ULTIMA_COMPRA'
        DataType = ftCurrency
      end
      item
        Name = 'FORNECEDOR'
        DataType = ftInteger
      end
      item
        Name = 'NR_DCTO_ULTIMA_COMPRA'
        DataType = ftInteger
      end
      item
        Name = 'UNIDADE'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'QTD_EMBALAGEM'
        DataType = ftFloat
      end
      item
        Name = 'COD_PRODUTO_FORNECEDOR'
        DataType = ftString
        Size = 10
      end>
    Left = 256
    Top = 160
    object mmProcessosID: TIntegerField
      FieldName = 'ID'
    end
    object mmProcessosDATA: TDateField
      FieldName = 'DATA'
    end
    object mmProcessosHORA: TTimeField
      FieldName = 'HORA'
    end
    object mmProcessosOBS: TStringField
      FieldName = 'OBS'
      Size = 300
    end
    object mmProcessosNUMDOC: TIntegerField
      FieldName = 'NUMDOC'
    end
    object mmProcessosCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 100
    end
    object mmProcessosVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
  end
  object dsProcessos: TDataSource
    AutoEdit = False
    DataSet = mmProcessos
    Left = 360
    Top = 160
  end
  object fR_RELATORIO: TfrxReport
    Version = '6.9.3'
    DotMatrixReport = False
    EngineOptions.PrintIfEmpty = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40101.789510081000000000
    ReportOptions.LastChange = 42664.689665335650000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    OnGetValue = fR_RELATORIOGetValue
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 136
    Top = 160
    Datasets = <
      item
        DataSet = Dm.dst_hist_processo_pedidos
        DataSetName = 'dst_hist_processo_pedidos'
      end>
    Variables = <>
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
        Height = 13.228346456692910000
        Top = 173.858380000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = Dm.dst_hist_processo_pedidos
        DataSetName = 'dst_hist_processo_pedidos'
        RowCount = 0
        object dst_vendas2NOM_CLIENTE: TfrxMemoView
          AllowVectorExport = True
          Left = 176.858267720000000000
          Width = 178.425480000000000000
          Height = 13.228346456692910000
          DataField = 'OBS'
          DataSet = Dm.dst_hist_processo_pedidos
          DataSetName = 'dst_hist_processo_pedidos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clWhite
          Memo.UTF8W = (
            '[dst_hist_processo_pedidos."OBS"]')
          ParentFont = False
        end
        object dst_vendas2NUMDOC: TfrxMemoView
          AllowVectorExport = True
          Left = 1.889763780000000000
          Width = 39.102362200000000000
          Height = 13.228346456692910000
          DataField = 'ID'
          DataSet = Dm.dst_hist_processo_pedidos
          DataSetName = 'dst_hist_processo_pedidos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_hist_processo_pedidos."ID"]')
          ParentFont = False
        end
        object dst_vendas2DTADOC: TfrxMemoView
          AllowVectorExport = True
          Left = 44.393700790000000000
          Width = 61.811070000000000000
          Height = 13.228346456692910000
          DataField = 'DATA'
          DataSet = Dm.dst_hist_processo_pedidos
          DataSetName = 'dst_hist_processo_pedidos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_hist_processo_pedidos."DATA"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 109.984251970000000000
          Top = 0.362090000000000000
          Width = 63.874015750000000000
          Height = 13.228346456692910000
          DataField = 'HORA'
          DataSet = Dm.dst_hist_processo_pedidos
          DataSetName = 'dst_hist_processo_pedidos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'hh:mm'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_hist_processo_pedidos."HORA"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 359.000000000000000000
          Width = 71.811070000000000000
          Height = 13.228346456692910000
          DataSet = Dm.dst_hist_processo_pedidos
          DataSetName = 'dst_hist_processo_pedidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_hist_processo_pedidos."NUMDOC"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 434.000000000000000000
          Width = 208.929190000000000000
          Height = 13.228346456692910000
          DataSet = Dm.dst_hist_processo_pedidos
          DataSetName = 'dst_hist_processo_pedidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clWhite
          Memo.UTF8W = (
            
              '[dst_hist_processo_pedidos."COD_CLIENTE"]-[dst_hist_processo_ped' +
              'idos."NOM_CLIENTE"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 647.000000000000000000
          Width = 68.031540000000000000
          Height = 13.228346456692910000
          DataField = 'TOT_LIQUIDO'
          DataSet = Dm.dst_hist_processo_pedidos
          DataSetName = 'dst_hist_processo_pedidos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_hist_processo_pedidos."TOT_LIQUIDO"]')
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 56.692950000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 616.063390000000000000
          Top = 3.779530000000001000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
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
          Left = 570.709030000000000000
          Top = 34.015770000000010000
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
          Left = 52.913420000000000000
          Top = 34.338590000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Hist'#243'rico de Processo do Pedido: ')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 359.055350000000000000
          Top = 34.338590000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[processo]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 260.787570000000000000
          Top = 3.779530000000000000
          Width = 336.378170000000000000
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
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 15.118120000000000000
        Top = 98.267780000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 1.779530000000000000
          Width = 36.929190000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Fill.BackColor = clWhite
          HAlign = haCenter
          Memo.UTF8W = (
            'Ord.')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 42.267780000000000000
          Width = 63.811070000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Fill.BackColor = clWhite
          HAlign = haCenter
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 176.858380000000000000
          Width = 178.425118740000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Fill.BackColor = clWhite
          Memo.UTF8W = (
            'Observa'#231#245'es')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 110.063390000000000000
          Width = 63.874015750000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Fill.BackColor = clWhite
          HAlign = haCenter
          Memo.UTF8W = (
            'Hora')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 359.000000000000000000
          Width = 71.811023620000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Fill.BackColor = clWhite
          HAlign = haCenter
          Memo.UTF8W = (
            'Pedido')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 434.000000000000000000
          Width = 207.779527560000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Fill.BackColor = clWhite
          Memo.UTF8W = (
            'Cliente')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 647.000000000000000000
          Width = 68.031493620000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Fill.BackColor = clWhite
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
        end
      end
    end
  end
end
