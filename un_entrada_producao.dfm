object frm_entrada_producao: Tfrm_entrada_producao
  Left = 0
  Top = 0
  Caption = 'Entrada de Produ'#231#227'o'
  ClientHeight = 450
  ClientWidth = 891
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
  object pnCab: TPanel
    Left = 0
    Top = 0
    Width = 891
    Height = 49
    Align = alTop
    Enabled = False
    TabOrder = 0
    object gbCodigo: TGroupBox
      Left = 6
      Top = 1
      Width = 110
      Height = 42
      Caption = 'C'#243'digo'
      TabOrder = 0
      object lbCodigo: TLabel
        Left = 5
        Top = 18
        Width = 101
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '..'
      end
    end
    object GbLocal: TGroupBox
      Left = 122
      Top = 1
      Width = 644
      Height = 42
      Caption = 'Local de Estoque'
      TabOrder = 1
      object sBevel1: TsBevel
        Left = 70
        Top = 14
        Width = 568
        Height = 21
      end
      object lbdescEstoque: TsLabelFX
        Left = 74
        Top = 16
        Width = 11
        Height = 21
        Angle = 0
        Shadow.OffsetKeeper.LeftTop = -3
        Shadow.OffsetKeeper.RightBottom = 5
      end
      object PrLocal: TsComboEdit
        Left = 5
        Top = 14
        Width = 62
        Height = 21
        AutoSize = False
        TabOrder = 0
        Text = ''
        OnExit = PrLocalExit
        CheckOnExit = True
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
        OnButtonClick = PrLocalButtonClick
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
    end
    object gbEmissao: TGroupBox
      Left = 772
      Top = 1
      Width = 110
      Height = 42
      Caption = 'Emiss'#227'o'
      TabOrder = 2
      object PrDT_EMISSAO: TsDateEdit
        Left = 5
        Top = 14
        Width = 100
        Height = 21
        AutoSize = False
        EditMask = '!99/99/9999;1; '
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
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
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 49
    Width = 891
    Height = 325
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object pnItensCtrl: TPanel
      Left = 2
      Top = 231
      Width = 887
      Height = 92
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 0
      object pnbotoesitens: TPanel
        Left = 2
        Top = 55
        Width = 883
        Height = 35
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 0
        object Btnovitem: TsBitBtn
          Left = 237
          Top = 5
          Width = 75
          Height = 25
          Caption = '&INSERIR'
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = BtnovitemClick
          SkinData.SkinSection = 'BUTTON'
        end
        object Btaltitem: TsBitBtn
          Left = 319
          Top = 5
          Width = 75
          Height = 25
          Caption = '&ALTERAR'
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = BtaltitemClick
          SkinData.SkinSection = 'BUTTON'
        end
        object Btgraitem: TsBitBtn
          Left = 399
          Top = 5
          Width = 75
          Height = 25
          Caption = '&GRAVAR'
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = BtgraitemClick
          SkinData.SkinSection = 'BUTTON'
        end
        object Btcanitem: TsBitBtn
          Left = 561
          Top = 5
          Width = 75
          Height = 25
          Caption = '&CANCELAR'
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = BtcanitemClick
          SkinData.SkinSection = 'BUTTON'
        end
        object BTEXCLUIRitem: TsBitBtn
          Left = 480
          Top = 5
          Width = 75
          Height = 25
          Caption = '&EXCLUIR'
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = BTEXCLUIRitemClick
          SkinData.SkinSection = 'BUTTON'
        end
      end
      object pnItens: TPanel
        Left = 2
        Top = 2
        Width = 883
        Height = 53
        Align = alClient
        TabOrder = 1
        object GroupBox1: TGroupBox
          Left = 7
          Top = 4
          Width = 755
          Height = 41
          Cursor = crDrag
          Caption = 'Produto'
          TabOrder = 0
          object sBevel2: TsBevel
            Left = 75
            Top = 14
            Width = 673
            Height = 21
          end
          object lbDescProduto: TsDBTextFX
            Left = 78
            Top = 17
            Width = 12
            Height = 21
            AutoSize = True
            Caption = '.'
            ShowAccelChar = False
            Angle = 0
            Shadow.OffsetKeeper.LeftTop = -3
            Shadow.OffsetKeeper.RightBottom = 5
            DataField = 'DESCRICAO'
            DataSource = dsEntradaItem
          end
          object Mecod_produto: TRxDBComboEdit
            Left = 6
            Top = 14
            Width = 66
            Height = 21
            DataField = 'COD_PRODUTO'
            DataSource = dsEntradaItem
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
            OnButtonClick = Mecod_produtoButtonClick
            OnExit = Mecod_produtoExit
          end
        end
        object GroupBox2: TGroupBox
          Left = 768
          Top = 4
          Width = 110
          Height = 41
          Caption = 'Quantidade'
          TabOrder = 1
          object Meqtd: TsDBCalcEdit
            Left = 6
            Top = 14
            Width = 97
            Height = 21
            AutoSize = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnExit = MeqtdExit
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
            DisplayFormat = '0.00'
            DataSource = dsEntradaItem
            DataField = 'QUANTIDADE'
          end
        end
      end
    end
    object sDBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 887
      Height = 229
      Align = alClient
      DataSource = dsEntradaItem
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_PRODUTO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'Produto'
          Width = 554
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUANTIDADE'
          Title.Alignment = taCenter
          Title.Caption = 'Qtde'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CUSTO'
          Title.Alignment = taCenter
          Title.Caption = 'Custo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL'
          Title.Alignment = taCenter
          Title.Caption = 'Total'
          Width = 91
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 374
    Width = 891
    Height = 35
    Align = alBottom
    TabOrder = 2
    object BtAlterarStatus: TsSpeedButton
      Left = 530
      Top = 4
      Width = 75
      Height = 27
      Caption = 'Alterar Status'
      Enabled = False
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        3333333777333777FF33339993707399933333773337F3777FF3399933000339
        9933377333777F3377F3399333707333993337733337333337FF993333333333
        399377F33333F333377F993333303333399377F33337FF333373993333707333
        333377F333777F333333993333101333333377F333777F3FFFFF993333000399
        999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
        99933773FF777F3F777F339993707399999333773F373F77777F333999999999
        3393333777333777337333333999993333333333377777333333}
      NumGlyphs = 2
      ParentFont = False
      OnClick = BtAlterarStatusClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object btImprimir: TsSpeedButton
      Left = 800
      Top = 4
      Width = 85
      Height = 27
      Caption = 'Imprimir'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
      OnClick = BtImprimirClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object Btlocped: TsBitBtn
      Left = 611
      Top = 4
      Width = 75
      Height = 27
      Caption = '&LOCALIZAR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BtlocpedClick
      SkinData.SkinSection = 'BUTTON'
    end
    object Btgraped: TsBitBtn
      Left = 367
      Top = 4
      Width = 75
      Height = 27
      Caption = '&GRAVAR'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BtgrapedClick
      SkinData.SkinSection = 'BUTTON'
    end
    object Btaltped: TsBitBtn
      Left = 287
      Top = 4
      Width = 75
      Height = 27
      Caption = '&ALTERAR'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = BtaltpedClick
      SkinData.SkinSection = 'BUTTON'
    end
    object Btnovped: TsBitBtn
      Left = 206
      Top = 4
      Width = 75
      Height = 27
      Caption = '&INSERIR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = BtnovpedClick
      SkinData.SkinSection = 'BUTTON'
    end
    object Btcanped: TsBitBtn
      Left = 448
      Top = 4
      Width = 75
      Height = 27
      Caption = '&CANCELAR'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = BtcanpedClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 409
    Width = 891
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    BevelKind = bkSoft
    BevelOuter = bvSpace
    TabOrder = 3
    object Status: TLabel
      Left = 420
      Top = 13
      Width = 101
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '..'
    end
  end
  object mmEntradaItem: TRxMemoryData
    FieldDefs = <>
    Left = 424
    Top = 177
    object mmEntradaItemCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
    end
    object mmEntradaItemDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object mmEntradaItemQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object mmEntradaItemCUSTO: TCurrencyField
      FieldName = 'CUSTO'
    end
    object mmEntradaItemTOTAL: TCurrencyField
      FieldName = 'TOTAL'
    end
  end
  object dsEntradaItem: TDataSource
    DataSet = mmEntradaItem
    Left = 488
    Top = 177
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
    ReportOptions.LastChange = 42668.574615162000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '//                      '
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = fR_RELATORIOGetValue
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 352
    Top = 160
    Datasets = <
      item
        DataSet = Dm.dst_ordem_producao
        DataSetName = 'dst_ordem_producao'
      end>
    Variables = <
      item
        Name = ' ORDEM'
        Value = Null
      end
      item
        Name = 'PAI'
        Value = '<dst_ordem_producao."PAI">'
      end>
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
        Height = 593.779530000000000000
        Top = 283.464750000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = Dm.dst_ordem_producao
        DataSetName = 'dst_ordem_producao'
        RowCount = 0
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 937.323440000000000000
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
          Width = 706.582870000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Ordem de Produ'#231#227'o')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 10.653680000000000000
          Top = 3.779530000000001000
          Width = 616.748300000000000000
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
          Left = 11.653680000000000000
          Top = 20.456709999999990000
          Width = 615.748300000000000000
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
      object GroupHeader3: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 241.889920000000000000
        Width = 718.110700000000000000
        Condition = 'dst_ordem_producao."CODIGO"'
        object mmDescricao2: TfrxMemoView
          AllowVectorExport = True
          Left = 14.118120000000000000
          Width = 665.197280000000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_plano_contas_lista
          DataSetName = 'dst_plano_contas_lista'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'ORDEM N'#186' [dst_ordem_producao."CODIGO"]')
          ParentFont = False
        end
      end
      object GroupHeader4: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 200.315090000000000000
        Width = 718.110700000000000000
        Condition = 'dst_ordem_producao."LOCAL"'
        object mmDescricao1: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 665.197280000000000000
          Height = 15.118120000000000000
          DataSet = Dm.dst_plano_contas_lista
          DataSetName = 'dst_plano_contas_lista'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dst_ordem_producao."LOCAL"]-[dst_ordem_producao."DESCRICAO"]')
          ParentFont = False
        end
      end
      object mmLista: TfrxMemoView
        Align = baClient
        AllowVectorExport = True
        Width = 718.110700000000000000
        Height = 1046.929810000000000000
        Frame.Typ = []
        Memo.UTF8W = (
          '[lista]')
      end
    end
  end
  object q_clientes: TFDQuery
    Connection = dao.CN
    Left = 624
    Top = 9
  end
end
