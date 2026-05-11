object fmLerRetornoCobranca: TfmLerRetornoCobranca
  Left = 459
  Top = 269
  BorderIcons = [biSystemMenu]
  Caption = 'Ler Retorno - Cobran'#231'a.'
  ClientHeight = 92
  ClientWidth = 566
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TsPanel
    Left = 0
    Top = 59
    Width = 566
    Height = 33
    Align = alBottom
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    ExplicitTop = 51
    ExplicitWidth = 551
    object btnLerRetorno: TButton
      Left = 238
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Ler Retorno'
      TabOrder = 0
      OnClick = btnLerRetornoClick
    end
  end
  object Panel2: TsPanel
    Left = 0
    Top = 0
    Width = 566
    Height = 59
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    ExplicitWidth = 551
    ExplicitHeight = 51
    object sbArquivoRetorno: TsSpeedButton
      Left = 524
      Top = 25
      Width = 23
      Height = 22
      Hint = 'Carregar Arquivo de Retorno'
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
      OnClick = sbArquivoRetornoClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object lbArquivoRetorno: TsLabel
      Left = 6
      Top = 30
      Width = 80
      Height = 13
      Caption = 'Arquivo Retorno:'
      Color = clBlack
      ParentColor = False
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object lbCCBoleto: TsLabel
      Left = 161
      Top = 8
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
    object Label40: TsLabel
      Left = 6
      Top = 8
      Width = 84
      Height = 13
      Caption = 'Banco CC Boleto:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object edArquivoRetorno: TsEdit
      Left = 92
      Top = 26
      Width = 430
      Height = 21
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
    object PrCONTA_BOLETO: TsComboEdit
      Left = 92
      Top = 4
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
      OnExit = PrCONTA_BOLETOExit
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
      OnButtonClick = PrCONTA_BOLETOButtonClick
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.RET'
    FileName = '*.RET'
    Filter = '*.RET'
    Left = 416
    Top = 4
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
    ReportOptions.CreateDate = 40150.698157500000000000
    ReportOptions.LastChange = 42682.623023761570000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  if (((<dst_cobranca."VALOR_RECEBIDO"> - <dst_cobranca."VALOR">' +
        ') < - 10) and (<dst_cobranca."VALOR_RECEBIDO"> <> 0)) then'
      '  begin                     '
      '    mmRetornoDescricao.Font.Color := clMaroon;'
      '    mmVALOR_RECEBIDO.Font.Color   := clMaroon;'
      '    mmVALOR.Font.Color            := clMaroon;'
      '    mmDTAREC.Font.Color           := clMaroon;'
      '    mmDTAVEN1.Font.Color          := clMaroon;'
      '    mmNOM_CLIENTE.Font.Color      := clMaroon;'
      '    mmTITULO.Font.Color           := clMaroon;'
      ''
      '    mmRetornoDescricao.Font.Style := 3;'
      '    mmVALOR_RECEBIDO.Font.Style   := 3;'
      '    mmVALOR.Font.Style            := 3;  '
      '    mmDTAREC.Font.Style           := 3;  '
      '    mmDTAVEN1.Font.Style          := 3;  '
      '    mmNOM_CLIENTE.Font.Style      := 3;'
      '    mmTITULO.Font.Style           := 3;        '
      '  end'
      '  else begin'
      '    mmRetornoDescricao.Font.Color := clBlack;'
      '    mmVALOR_RECEBIDO.Font.Color   := clBlack;  '
      '    mmVALOR.Font.Color            := clBlack;  '
      '    mmDTAREC.Font.Color           := clBlack;  '
      '    mmDTAVEN1.Font.Color          := clBlack;  '
      '    mmNOM_CLIENTE.Font.Color      := clBlack;  '
      '    mmTITULO.Font.Color           := clBlack;'
      ''
      '    mmRetornoDescricao.Font.Style := 0;'
      '    mmVALOR_RECEBIDO.Font.Style   := 0;'
      '    mmVALOR.Font.Style            := 0;  '
      '    mmDTAREC.Font.Style           := 0;  '
      '    mmDTAVEN1.Font.Style          := 0;  '
      '    mmNOM_CLIENTE.Font.Style      := 0;'
      '    mmTITULO.Font.Style           := 0;        '
      '  end;            '
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = fR_RELATORIOGetValue
    Left = 264
    Top = 8
    Datasets = <
      item
        DataSet = Dm.dst_cobranca
        DataSetName = 'dst_cobranca'
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
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 52.913420000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 668.976810000000000000
          Width = 75.590600000000000000
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
          Left = 657.638220000000000000
          Top = 19.677180000000000000
          Width = 86.929190000000000000
          Height = 11.338590000000000000
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
          Top = 30.559060000000000000
          Width = 222.992270000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Relatorio de [titulo] entre:')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 234.330860000000000000
          Top = 30.559060000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dtaini]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 317.480520000000000000
          Top = 30.559060000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'e')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 335.378170000000000000
          Top = 30.559060000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dtafin]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Width = 570.709030000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[empresa]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 15.897650000000000000
        Top = 238.110390000000000000
        Width = 755.906000000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = Dm.dst_cobranca
        DataSetName = 'dst_cobranca'
        RowCount = 0
        object mmNOM_CLIENTE: TfrxMemoView
          AllowVectorExport = True
          Left = 72.566929130000000000
          Width = 196.535433070000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_contas_receber
          DataSetName = 'dst_contas_receber'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_cobranca."NOM_CLIENTE"]')
          ParentFont = False
        end
        object mmDTAVEN1: TfrxMemoView
          AllowVectorExport = True
          Left = 271.346630000000000000
          Width = 60.472440940000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_contas_receber
          DataSetName = 'dst_contas_receber'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HideZeros = True
          Memo.UTF8W = (
            '[dst_cobranca."DTAVEN"]')
          ParentFont = False
        end
        object mmDTAREC: TfrxMemoView
          AllowVectorExport = True
          Left = 334.598640000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_contas_receber
          DataSetName = 'dst_contas_receber'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HideZeros = True
          Memo.UTF8W = (
            '[dst_cobranca."DTAREC"]')
          ParentFont = False
        end
        object mmVALOR: TfrxMemoView
          AllowVectorExport = True
          Left = 399.512060000000000000
          Width = 68.031496060000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_contas_receber
          DataSetName = 'dst_contas_receber'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_cobranca."VALOR"]')
          ParentFont = False
        end
        object mmVALOR_RECEBIDO: TfrxMemoView
          AllowVectorExport = True
          Left = 472.409378030000000000
          Width = 68.031496060000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_contas_receber
          DataSetName = 'dst_contas_receber'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dst_cobranca."VALOR_RECEBIDO"]')
          ParentFont = False
        end
        object mmTITULO: TfrxMemoView
          AllowVectorExport = True
          Width = 68.031496060000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_cobranca
          DataSetName = 'dst_cobranca'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_cobranca."TITULO"]-[dst_cobranca."SEQUENCIA"]')
          ParentFont = False
        end
        object mmRetornoDescricao: TfrxMemoView
          AllowVectorExport = True
          Left = 544.252320000000000000
          Width = 207.874047480000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_cobranca
          DataSetName = 'dst_cobranca'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_cobranca."BOLETO_RETORNO_DESCRICAO"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 453.543600000000000000
        Width = 755.906000000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 676.535870000000000000
          Width = 75.590600000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
          ParentFont = False
        end
      end
      object GroupFooter2: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 275.905690000000000000
        Width = 755.906000000000000000
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 356.787238030000000000
          Top = 3.779530000000022000
          Width = 109.606326060000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<dst_cobranca."VALOR">,MasterData1)]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 177.637910000000000000
          Top = 3.779530000000022000
          Width = 173.858380000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haRight
          Memo.UTF8W = (
            'Total Arquivo:')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 471.306949920000000000
          Top = 4.000000000000000000
          Width = 68.031496060000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<dst_cobranca."VALOR_RECEBIDO">,MasterData1)]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 83.149660000000000000
          Top = 3.779530000000022000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clWhite
          Memo.UTF8W = (
            '[COUNT(MasterData1,1)]')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 3.779530000000022000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clWhite
          Memo.UTF8W = (
            'Quantidade:')
          ParentFont = False
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 752.126470000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 411.968770000000000000
        Width = 755.906000000000000000
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 177.637910000000000000
          Width = 173.858380000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clWindow
          HAlign = haRight
          Memo.UTF8W = (
            'Total Geral:')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 356.787238030000000000
          Width = 109.606326060000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clWindow
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<dst_cobranca."VALOR">,MasterData1,2)]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 471.306949920000000000
          Top = 0.220469999999977500
          Width = 68.031496060000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clWindow
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<dst_cobranca."VALOR_RECEBIDO">,MasterData1,2)]')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Left = 83.149660000000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clWhite
          Memo.UTF8W = (
            '[COUNT(MasterData1,1)]')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clWhite
          Memo.UTF8W = (
            'Quantidade:')
          ParentFont = False
        end
      end
      object GroupHeader3: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 24.236240000000000000
        Top = 132.283550000000000000
        Width = 755.906000000000000000
        Condition = 'dst_cobranca."NR_CONTA"'
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 3.779529999999994000
          Width = 41.574830000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clNavy
          Frame.Typ = []
          Fill.BackColor = clWhite
          Memo.UTF8W = (
            'Banco:')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 49.133890000000000000
          Top = 3.779529999999994000
          Width = 211.653680000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clNavy
          Frame.Typ = []
          Fill.BackColor = clWhite
          Memo.UTF8W = (
            '[dst_cobranca."NR_BANCO"]-[dst_cobranca."NOM_BANCO"]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 275.905690000000000000
          Top = 3.779529999999994000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clNavy
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haRight
          Memo.UTF8W = (
            'Ag'#234'ncia:')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 332.598640000000000000
          Top = 3.779529999999994000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clNavy
          Frame.Typ = []
          Fill.BackColor = clWhite
          Memo.UTF8W = (
            '[dst_cobranca."NR_AGENCIA"]')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 400.630180000000000000
          Top = 3.779529999999994000
          Width = 98.267780000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clNavy
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haRight
          Memo.UTF8W = (
            'Conta Corrente:')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 502.677490000000000000
          Top = 3.779529999999994000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clNavy
          Frame.Typ = []
          Fill.BackColor = clWhite
          Memo.UTF8W = (
            '[dst_cobranca."NR_CONTA"]')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 593.386210000000000000
          Top = 3.779529999999994000
          Width = 98.267780000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clNavy
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haRight
          Memo.UTF8W = (
            'C'#243'digo Cedente:')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 695.433520000000000000
          Top = 3.779529999999994000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clNavy
          Frame.Typ = []
          Fill.BackColor = clWhite
          Memo.UTF8W = (
            '[dst_cobranca."CODIGO_CEDENTE"]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 20.456709999999990000
          Width = 748.346940000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object GroupFooter3: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 328.819110000000000000
        Width = 755.906000000000000000
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 356.787238030000000000
          Top = 4.000000000000000000
          Width = 109.606326060000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = cl3DLight
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<dst_cobranca."VALOR">,MasterData1)]')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 177.637910000000000000
          Top = 4.000000000000000000
          Width = 173.858380000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = cl3DLight
          HAlign = haRight
          Memo.UTF8W = (
            'Total Banco:')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 471.306949920000000000
          Top = 4.220469999999978000
          Width = 68.031496060000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = cl3DLight
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<dst_cobranca."VALOR_RECEBIDO">,MasterData1)]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 83.149660000000000000
          Top = 3.779530000000022000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = cl3DLight
          Memo.UTF8W = (
            '[COUNT(MasterData1,1)]')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 3.779530000000022000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = cl3DLight
          Memo.UTF8W = (
            'Quantidade:')
          ParentFont = False
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 752.126470000000000000
          Color = clBlack
          ArrowWidth = 10
          Frame.Typ = [ftTop]
        end
      end
      object GroupHeader2: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 177.637910000000000000
        Width = 755.906000000000000000
        Condition = 'dst_cobranca."ARQUIVO"'
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 566.929500000000000000
          Width = 185.196970000000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_cobranca
          DataSetName = 'dst_cobranca'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clNavy
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haRight
          Memo.UTF8W = (
            'Data Gera'#231#227'o: [dst_cobranca."DATA"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 0.779530000000000000
          Top = 17.897650000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Titulo-Seq')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 72.370130000000000000
          Top = 17.897650000000000000
          Width = 196.535560000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Cliente')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Left = 271.126160000000000000
          Top = 17.897650000000000000
          Width = 60.472440940000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Dta.Venc.')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          AllowVectorExport = True
          Left = 334.378170000000000000
          Top = 17.897650000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Dta.Receb.')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          AllowVectorExport = True
          Left = 399.071120000000000000
          Top = 17.897650000000000000
          Width = 68.031496060000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          AllowVectorExport = True
          Left = 471.323130000000000000
          Top = 17.897650000000000000
          Width = 68.031496060000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Valor Receb.')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          AllowVectorExport = True
          Left = 0.779530000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clNavy
          Frame.Typ = []
          Fill.BackColor = clWhite
          Memo.UTF8W = (
            'Arquivo:')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          AllowVectorExport = True
          Left = 83.929190000000000000
          Width = 139.842610000000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_cobranca
          DataSetName = 'dst_cobranca'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clNavy
          Frame.Typ = []
          Fill.BackColor = clWhite
          Memo.UTF8W = (
            '[dst_cobranca."ARQUIVO"]')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          AllowVectorExport = True
          Left = 544.252320000000000000
          Top = 17.897650000000000000
          Width = 207.874106060000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Retorno Descri'#231#227'o')
          ParentFont = False
        end
      end
    end
  end
  object ACBrBoleto1: TACBrBoleto
    Banco.TamanhoMaximoNossoNum = 10
    Banco.TipoCobranca = cobNenhum
    Banco.LayoutVersaoArquivo = 0
    Banco.LayoutVersaoLote = 0
    Banco.CasasDecimaisMoraJuros = 2
    Cedente.TipoInscricao = pJuridica
    Cedente.PIX.TipoChavePIX = tchNenhuma
    Cedente.IntegradoraBoleto = tibNenhum
    NumeroArquivo = 0
    Configuracoes.Arquivos.LogNivel = logNenhum
    Configuracoes.WebService.SSLHttpLib = httpOpenSSL
    Configuracoes.WebService.StoreName = 'My'
    Configuracoes.WebService.Ambiente = tawsHomologacao
    Configuracoes.WebService.Operacao = tpInclui
    Configuracoes.WebService.VersaoDF = '1.2'
    Left = 168
    Top = 8
  end
end
