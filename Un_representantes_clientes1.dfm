object Fr_representantes_clientes: TFr_representantes_clientes
  Left = 57
  Top = 32
  BorderIcons = [biSystemMenu]
  Caption = 'Representantes x Clientes'
  ClientHeight = 658
  ClientWidth = 1028
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
  object SBcarga: TStatusBar
    Left = 0
    Top = 639
    Width = 1028
    Height = 19
    Panels = <
      item
        Width = 400
      end
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1028
    Height = 211
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object sGroupBox1: TsGroupBox
      Left = 4
      Top = 17
      Width = 226
      Height = 191
      Caption = 'Representantes Atual'
      TabOrder = 0
      SkinData.SkinSection = 'GROUPBOX'
      object dgRep: Tdbgrid
        Left = 2
        Top = 15
        Width = 222
        Height = 174
        Align = alClient
        DataSource = dsRep
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dgRepDrawColumnCell
        OnDblClick = dgRepDblClick
        OnKeyPress = dgRepKeyPress
        SkinData.SkinSection = 'EDIT'
        Columns = <
          item
            Expanded = False
            FieldName = 'Nome'
            Width = 162
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Check'
            Width = 20
            Visible = True
          end>
      end
    end
    object sGroupBox2: TsGroupBox
      Left = 234
      Top = 17
      Width = 79
      Height = 191
      Caption = 'Estado'
      TabOrder = 1
      SkinData.SkinSection = 'GROUPBOX'
      object dgEstado: Tdbgrid
        Left = 2
        Top = 15
        Width = 75
        Height = 174
        Align = alClient
        DataSource = dsUF
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dgEstadoDrawColumnCell
        OnDblClick = dgEstadoDblClick
        OnKeyPress = dgEstadoKeyPress
        SkinData.SkinSection = 'EDIT'
        Columns = <
          item
            Expanded = False
            FieldName = 'UF'
            Width = 18
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Check'
            Width = 20
            Visible = True
          end>
      end
    end
    object sGroupBox3: TsGroupBox
      Left = 315
      Top = 17
      Width = 226
      Height = 191
      Caption = 'Meso-Regi'#227'o'
      TabOrder = 2
      SkinData.SkinSection = 'GROUPBOX'
      object dgMeso: Tdbgrid
        Left = 2
        Top = 15
        Width = 222
        Height = 174
        Align = alClient
        DataSource = dsMeso
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dgMesoDrawColumnCell
        OnDblClick = dgMesoDblClick
        OnKeyPress = dgMesoKeyPress
        SkinData.SkinSection = 'EDIT'
        Columns = <
          item
            Expanded = False
            FieldName = 'Nome'
            Width = 162
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Check'
            Width = 20
            Visible = True
          end>
      end
      object CheckMeso: TDBCheckBox
        Left = 51
        Top = 118
        Width = 15
        Height = 17
        Color = clWhite
        DataField = 'Check'
        DataSource = dsMeso
        ParentColor = False
        TabOrder = 1
        Visible = False
      end
    end
    object sGroupBox4: TsGroupBox
      Left = 543
      Top = 17
      Width = 235
      Height = 191
      Caption = 'Micro-Regi'#227'o'
      TabOrder = 3
      SkinData.SkinSection = 'GROUPBOX'
      object dgMicro: Tdbgrid
        Left = 2
        Top = 15
        Width = 231
        Height = 174
        Align = alClient
        DataSource = dsMicro
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dgMicroDrawColumnCell
        OnDblClick = dgMicroDblClick
        SkinData.SkinSection = 'EDIT'
        Columns = <
          item
            Expanded = False
            FieldName = 'Nome'
            Width = 171
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Check'
            Width = 20
            Visible = True
          end>
      end
      object CheckMicro: TDBCheckBox
        Left = 19
        Top = 126
        Width = 15
        Height = 17
        Color = clWhite
        DataField = 'Check'
        DataSource = dsMicro
        ParentColor = False
        TabOrder = 1
        Visible = False
      end
    end
    object sGroupBox5: TsGroupBox
      Left = 783
      Top = 17
      Width = 235
      Height = 191
      Caption = 'Cidades'
      TabOrder = 4
      SkinData.SkinSection = 'GROUPBOX'
      object dgCidade: Tdbgrid
        Left = 2
        Top = 15
        Width = 231
        Height = 174
        Align = alClient
        DataSource = dsCidades
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dgCidadeDrawColumnCell
        OnDblClick = dgCidadeDblClick
        OnKeyPress = dgCidadeKeyPress
        SkinData.SkinSection = 'EDIT'
        Columns = <
          item
            Expanded = False
            FieldName = 'Nome'
            Width = 170
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Check'
            Width = 20
            Visible = True
          end>
      end
      object CheckCidades: TDBCheckBox
        Left = 19
        Top = 126
        Width = 15
        Height = 17
        Color = clWhite
        DataField = 'Check'
        DataSource = dsCidades
        ParentColor = False
        TabOrder = 1
        Visible = False
      end
    end
    object CheckRep: TDBCheckBox
      Left = 88
      Top = 151
      Width = 15
      Height = 17
      Color = clWhite
      DataField = 'Check'
      DataSource = dsRep
      ParentColor = False
      TabOrder = 5
      Visible = False
    end
    object CheckUF: TDBCheckBox
      Left = 264
      Top = 191
      Width = 15
      Height = 17
      Color = clWhite
      DataField = 'Check'
      DataSource = dsUF
      ParentColor = False
      TabOrder = 6
      Visible = False
    end
  end
  object GroupBox2: TsGroupBox
    Left = 0
    Top = 211
    Width = 1028
    Height = 428
    Align = alClient
    Caption = 'Clientes'
    TabOrder = 2
    SkinData.SkinSection = 'GROUPBOX'
    object dgCarga: Tdbgrid
      Left = 2
      Top = 15
      Width = 1024
      Height = 411
      Align = alClient
      DataSource = dsClientes
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      SkinData.SkinSection = 'EDIT'
      Columns = <
        item
          Expanded = False
          FieldName = 'CLIENTE'
          Title.Caption = 'Cliente'
          Width = 500
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REPRESENTANTE'
          Title.Caption = 'Representante'
          Width = 450
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Check'
          Width = 20
          Visible = True
        end>
    end
    object CheckClientes: TDBCheckBox
      Left = 88
      Top = 151
      Width = 15
      Height = 17
      Color = clWhite
      DataField = 'CLIENTE'
      DataSource = dsClientes
      ParentColor = False
      TabOrder = 1
      Visible = False
    end
  end
  object q_clientes: TFDQuery
    AfterClose = q_clientesAfterClose
    BeforeOpen = q_clientesBeforeOpen
    
    Left = 624
    Top = 9
  end
  object fr_relatorio: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40124.577814571800000000
    ReportOptions.LastChange = 41250.715790289350000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 816
    Top = 8
    Datasets = <
      item
        DataSetName = 'dst_carga'
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
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 143.622140000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 619.842920000000000000
          Top = 24.677180000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[DATE]')
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          Left = 575.488560000000000000
          Top = 41.574830000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[PAGE#] de [TOTALPAGES#]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 3.779530000000000000
          Top = 27.559060000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Formul'#225'rio de Carga')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = clScrollBar
          HAlign = haCenter
          Memo.UTF8W = (
            '[empresa]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 5.000000000000000000
          Top = 50.472480000000010000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome Carga:')
          ParentFont = False
        end
        object dst_cargaNOM_CARGA: TfrxMemoView
          Left = 95.488250000000000000
          Top = 51.133890000000010000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          DataSetName = 'dst_carga'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dst_carga."ID"]/ [dst_carga."NOM_CARGA"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 410.850650000000000000
          Top = 53.133889999999990000
          Width = 45.354360000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data:')
          ParentFont = False
        end
        object dst_cargaDTA_CARGA: TfrxMemoView
          Left = 461.764070000000000000
          Top = 52.472480000000010000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          DataField = 'DTA_CARGA'
          DataSetName = 'dst_carga'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dst_carga."DTA_CARGA"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 4.779530000000000000
          Top = 71.811070000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Veiculo:')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 67.031540000000000000
          Top = 71.811070000000000000
          Width = 173.858380000000000000
          Height = 15.118120000000000000
          DataSetName = 'dst_carga'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dst_carga."NOM_VEICULO"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 253.228510000000000000
          Top = 70.811070000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Motorista:')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 323.819110000000000000
          Top = 70.811070000000000000
          Width = 143.622140000000000000
          Height = 15.118120000000000000
          DataSetName = 'dst_carga'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dst_carga."NOM_MOTORISTA"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 6.559060000000000000
          Top = 91.267780000000000000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Transportadora:')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 114.724490000000000000
          Top = 91.267780000000000000
          Width = 257.008040000000000000
          Height = 15.118120000000000000
          DataSetName = 'dst_carga'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dst_carga."NOM_TRANSPORTADORA"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 3.779530000000000000
          Top = 123.724490000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'N'#186' Pedido')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 104.606370000000000000
          Top = 124.724490000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 205.874150000000000000
          Top = 124.724490000000000000
          Width = 325.039580000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Cliente')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 547.031849999999900000
          Top = 124.944960000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'Total')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 222.992270000000000000
        Width = 718.110700000000000000
        DataSetName = 'dst_carga'
        RowCount = 0
        object dst_cargaID_PEDIDO: TfrxMemoView
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataField = 'NUMDOC'
          DataSetName = 'dst_carga'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_carga."NUMDOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object dst_cargaDTADOC: TfrxMemoView
          Left = 104.047310000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataField = 'DTADOC'
          DataSetName = 'dst_carga'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[dst_carga."DTADOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object dst_cargaNOM_CLIENTE: TfrxMemoView
          Left = 203.535560000000000000
          Width = 325.039580000000000000
          Height = 18.897650000000000000
          DataField = 'NOM_CLIENTE'
          DataSetName = 'dst_carga'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            '[dst_carga."NOM_CLIENTE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object dst_cargaTOT_LIQUIDO: TfrxMemoView
          Left = 548.031849999999900000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataSetName = 'dst_carga'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_carga."TOT_LIQUIDO"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 396.850650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 68.031540000000000000
        Top = 268.346630000000000000
        Width = 718.110700000000000000
        object Memo15: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.000000000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Vlr Total:')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 166.299320000000000000
          Top = 3.000000000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Vlr Frete:')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 332.598640000000000000
          Top = 3.000000000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Peso:')
          ParentFont = False
        end
        object dst_cargaTOT_FRETE: TfrxMemoView
          Left = 232.551330000000000000
          Top = 3.000000000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'TOT_FRETE'
          DataSetName = 'dst_carga'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dst_carga."TOT_FRETE"]')
          ParentFont = False
        end
        object dst_cargaTOT_PESO: TfrxMemoView
          Left = 376.512060000000000000
          Top = 3.000000000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSetName = 'dst_carga'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dst_carga."TOT_PESO"]')
          ParentFont = False
        end
        object dst_cargaTOT_CARGA: TfrxMemoView
          Left = 70.590600000000000000
          Top = 3.000000000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'TOT_CARGA'
          DataSetName = 'dst_carga'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dst_carga."TOT_CARGA"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 15.118120000000000000
          Top = 45.354359999999990000
          Width = 234.330860000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8W = (
            'Ass Conferente')
          ParentFont = False
        end
      end
    end
  end
  object rd_vendas: TRDprint
    ImpressoraPersonalizada.NomeImpressora = 'Modelo Personalizado - (Epson)'
    ImpressoraPersonalizada.AvancaOitavos = '27 48'
    ImpressoraPersonalizada.AvancaSextos = '27 50'
    ImpressoraPersonalizada.SaltoPagina = '12'
    ImpressoraPersonalizada.TamanhoPagina = '27 67 66'
    ImpressoraPersonalizada.Negrito = '27 69'
    ImpressoraPersonalizada.Italico = '27 52'
    ImpressoraPersonalizada.Sublinhado = '27 45 49'
    ImpressoraPersonalizada.Expandido = '27 14'
    ImpressoraPersonalizada.Normal10 = '18 27 80'
    ImpressoraPersonalizada.Comprimir12 = '18 27 77'
    ImpressoraPersonalizada.Comprimir17 = '27 80 27 15'
    ImpressoraPersonalizada.Comprimir20 = '27 77 27 15'
    ImpressoraPersonalizada.Reset = '27 80 18 20 27 53 27 70 27 45 48'
    ImpressoraPersonalizada.Inicializar = '27 64'
    OpcoesPreview.PaginaZebrada = False
    OpcoesPreview.Remalina = False
    OpcoesPreview.CaptionPreview = 'Visualiza'#231#227'o'
    OpcoesPreview.PreviewZoom = 95
    OpcoesPreview.CorPapelPreview = clWhite
    OpcoesPreview.CorLetraPreview = clBlack
    OpcoesPreview.Preview = True
    OpcoesPreview.BotaoSetup = Ativo
    OpcoesPreview.BotaoImprimir = Ativo
    OpcoesPreview.BotaoGravar = Ativo
    OpcoesPreview.BotaoLer = Ativo
    OpcoesPreview.BotaoProcurar = Ativo
    OpcoesPreview.BotaoPDF = Ativo
    OpcoesPreview.BotaoEMAIL = Ativo
    Margens.Left = 10
    Margens.Right = 10
    Margens.Top = 10
    Margens.Bottom = 10
    Autor = Deltress
    RegistroUsuario.NomeRegistro = 'CLAUDIO TOMASI'
    RegistroUsuario.SerieProduto = 'SINGLE-0415/02048'
    RegistroUsuario.AutorizacaoKey = 'O9IT-2CS2-OB3L-DAW1-8E87'
    About = 'RDprint 5.0 - Registrado'
    Acentuacao = Transliterate
    CaptionSetup = 'CONFIGURA'#199#195'O'
    TitulodoRelatorio = 'Pedido'
    UsaGerenciadorImpr = True
    CorForm = clBtnFace
    CorFonte = clBlack
    Impressora = Epson
    Mapeamento.Strings = (
      '//--- Grafico Compativel com Windows/USB ---//'
      '//'
      'GRAFICO=GRAFICO'
      'HP=GRAFICO'
      'DESKJET=GRAFICO'
      'LASERJET=GRAFICO'
      'INKJET=GRAFICO'
      'STYLUS=GRAFICO'
      'EPL=GRAFICO'
      'USB=GRAFICO'
      '//'
      '//--- Linha Epson Matricial 9 e 24 agulhas ---//'
      '//'
      'EPSON=EPSON'
      'GENERICO=EPSON'
      'LX-300=EPSON'
      'LX-810=EPSON'
      'FX-2170=EPSON'
      'FX-1170=EPSON'
      'LQ-1170=EPSON'
      'LQ-2170=EPSON'
      'OKIDATA=EPSON'
      '//'
      '//--- Rima e Emilia ---//'
      '//'
      'RIMA=RIMA'
      'EMILIA=RIMA'
      '//'
      '//--- Linha HP/Xerox padr'#227'o PCL ---//'
      '//'
      'PCL=HP'
      '//'
      '//--- Impressoras 40 Colunas ---//'
      '//'
      'DARUMA=BOBINA'
      'SIGTRON=BOBINA'
      'SWEDA=BOBINA'
      'BEMATECH=BOBINA')
    PortaComunicacao = 'LPT1'
    MostrarProgresso = True
    TamanhoQteLinhas = 33
    TamanhoQteColunas = 96
    TamanhoQteLPP = Seis
    NumerodeCopias = 1
    FonteTamanhoPadrao = S12cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    Left = 684
    Top = 65528
  end
  object mmRep: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Num_Doc'
        DataType = ftInteger
      end
      item
        Name = 'Data_Saida'
        DataType = ftDateTime
      end
      item
        Name = 'Cliente'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Chave_NFE'
        DataType = ftString
        Size = 44
      end>
    Left = 72
    Top = 184
    object mmRepID: TIntegerField
      FieldName = 'ID'
    end
    object mmRepNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object mmRepCheck: TBooleanField
      DisplayLabel = ' '
      FieldName = 'Check'
    end
  end
  object dsRep: TDataSource
    DataSet = mmRep
    Left = 120
    Top = 192
  end
  object mmUF: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Num_Doc'
        DataType = ftInteger
      end
      item
        Name = 'Data_Saida'
        DataType = ftDateTime
      end
      item
        Name = 'Cliente'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Chave_NFE'
        DataType = ftString
        Size = 44
      end>
    Left = 248
    Top = 200
    object mmUFUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object mmUFCheck: TBooleanField
      DisplayLabel = ' '
      FieldName = 'Check'
    end
  end
  object dsUF: TDataSource
    DataSet = mmUF
    Left = 256
    Top = 232
  end
  object mmMeso: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Num_Doc'
        DataType = ftInteger
      end
      item
        Name = 'Data_Saida'
        DataType = ftDateTime
      end
      item
        Name = 'Cliente'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Chave_NFE'
        DataType = ftString
        Size = 44
      end>
    Left = 376
    Top = 200
    object mmMesoID: TIntegerField
      FieldName = 'ID'
    end
    object mmMesoNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object mmMesoCheck: TBooleanField
      DisplayLabel = ' '
      FieldName = 'Check'
    end
  end
  object dsMeso: TDataSource
    DataSet = mmMeso
    Left = 424
    Top = 208
  end
  object mmMicro: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Num_Doc'
        DataType = ftInteger
      end
      item
        Name = 'Data_Saida'
        DataType = ftDateTime
      end
      item
        Name = 'Cliente'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Chave_NFE'
        DataType = ftString
        Size = 44
      end>
    Left = 600
    Top = 216
    object mmMicroID: TIntegerField
      FieldName = 'ID'
    end
    object mmMicroNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object mmMicroCheck: TBooleanField
      DisplayLabel = ' '
      FieldName = 'Check'
    end
  end
  object dsMicro: TDataSource
    DataSet = mmMicro
    Left = 648
    Top = 224
  end
  object dsCidades: TDataSource
    DataSet = mmCidades
    Left = 880
    Top = 240
  end
  object mmCidades: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Num_Doc'
        DataType = ftInteger
      end
      item
        Name = 'Data_Saida'
        DataType = ftDateTime
      end
      item
        Name = 'Cliente'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Chave_NFE'
        DataType = ftString
        Size = 44
      end>
    Left = 832
    Top = 232
    object mmCidadesID: TIntegerField
      FieldName = 'ID'
    end
    object mmCidadesNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object mmCidadesCheck: TBooleanField
      DisplayLabel = ' '
      FieldName = 'Check'
    end
  end
  object mmClientes: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Num_Doc'
        DataType = ftInteger
      end
      item
        Name = 'Data_Saida'
        DataType = ftDateTime
      end
      item
        Name = 'Cliente'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Chave_NFE'
        DataType = ftString
        Size = 44
      end>
    Left = 328
    Top = 360
    object mmClientesCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 100
    end
    object mmClientesCheck: TBooleanField
      DisplayLabel = ' '
      FieldName = 'Check'
    end
    object mmClientesREPRESENTANTE: TStringField
      FieldName = 'REPRESENTANTE'
      Size = 100
    end
  end
  object dsClientes: TDataSource
    DataSet = mmClientes
    Left = 376
    Top = 368
  end
end
