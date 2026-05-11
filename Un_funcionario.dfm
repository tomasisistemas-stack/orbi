object Fr_funcionario: TFr_funcionario
  Left = 242
  Top = -10
  Width = 740
  Height = 491
  Caption = 'Funcion'#225'rio'
  Color = clBtnFace
  BorderIcons = [biSystemMenu]
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
    Width = 732
    Height = 54
    Align = alTop
    TabOrder = 0
    object Label1: tsLabel
      Left = 13
      Top = 11
      Width = 36
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object Label2: tsLabel
      Left = 83
      Top = 11
      Width = 55
      Height = 13
      Caption = 'Funcionario'
    end
    object Prcodigo: TsEdit
      Left = 8
      Top = 24
      Width = 65
      Height = 21
      TabOrder = 0
    end
    object Prnome: TsEdit
      Left = 79
      Top = 24
      Width = 345
      Height = 21
      MaxLength = 50
      TabOrder = 1
      OnKeyPress = PrnomeKeyPress
    end
  end
  object pcrep: TPageControl
    Left = 0
    Top = 54
    Width = 732
    Height = 366
    ActivePage = tab_dados
    Align = alClient
    TabOrder = 1
    object tab_dados: TTabSheet
      Caption = 'Dados'
      object Label5: tsLabel
        Left = 3
        Top = -1
        Width = 49
        Height = 13
        Caption = 'Endere'#231'o:'
      end
      object Label6: tsLabel
        Left = 356
        Top = -1
        Width = 30
        Height = 13
        Caption = 'Bairro:'
      end
      object Label7: tsLabel
        Left = 591
        Top = -2
        Width = 22
        Height = 13
        Caption = 'Cep:'
      end
      object Label14: tsLabel
        Left = 318
        Top = 34
        Width = 45
        Height = 13
        Caption = 'Telefone:'
      end
      object Label15: tsLabel
        Left = 451
        Top = 34
        Width = 20
        Height = 13
        Caption = 'Fax:'
      end
      object Label16: tsLabel
        Left = 582
        Top = 34
        Width = 35
        Height = 13
        Caption = 'Celular:'
      end
      object Label18: tsLabel
        Left = 178
        Top = 74
        Width = 22
        Height = 13
        Caption = 'R.G:'
      end
      object Label19: tsLabel
        Left = 3
        Top = 74
        Width = 23
        Height = 13
        Caption = 'CPF:'
      end
      object Label24: tsLabel
        Left = 360
        Top = 75
        Width = 28
        Height = 13
        Caption = 'Email:'
      end
      object Label3: tsLabel
        Left = 3
        Top = 35
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object LbNom_cidade: tsLabel
        Left = 69
        Top = 54
        Width = 13
        Height = 13
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: tsLabel
        Left = 4
        Top = 112
        Width = 26
        Height = 13
        Caption = 'CNH:'
      end
      object Label8: tsLabel
        Left = 178
        Top = 112
        Width = 80
        Height = 13
        Caption = 'CNH N'#186' Registro'
      end
      object Prendereco: TsEdit
        Left = 0
        Top = 12
        Width = 345
        Height = 21
        MaxLength = 50
        TabOrder = 0
        OnKeyPress = PrnomeKeyPress
      end
      object Prbairro: TsEdit
        Left = 352
        Top = 12
        Width = 227
        Height = 21
        MaxLength = 30
        TabOrder = 1
        OnKeyPress = PrnomeKeyPress
      end
      object Prcep: TMaskEdit
        Left = 587
        Top = 12
        Width = 112
        Height = 21
        EditMask = '#####-###;1;_'
        MaxLength = 9
        TabOrder = 2
        Text = '     -   '
        OnKeyPress = PrnomeKeyPress
      end
      object Prfone: TMaskEdit
        Left = 314
        Top = 48
        Width = 122
        Height = 21
        EditMask = '!\(99\)0000-0000;1;_'
        MaxLength = 13
        TabOrder = 4
        Text = '(  )    -    '
        OnKeyPress = PrnomeKeyPress
      end
      object Prfax: TMaskEdit
        Left = 447
        Top = 48
        Width = 122
        Height = 21
        EditMask = '!\(99\)0000-0000;1;_'
        MaxLength = 13
        TabOrder = 5
        Text = '(  )    -    '
        OnKeyPress = PrnomeKeyPress
      end
      object Prfone_cel: TMaskEdit
        Left = 578
        Top = 48
        Width = 122
        Height = 21
        EditMask = '!\(99\)0000-0000;1;_'
        MaxLength = 13
        TabOrder = 6
        Text = '(  )    -    '
        OnKeyPress = PrnomeKeyPress
      end
      object Prcpf: TMaskEdit
        Left = 0
        Top = 88
        Width = 171
        Height = 21
        EditMask = '###.###.###-##;1;_'
        MaxLength = 14
        TabOrder = 7
        Text = '   .   .   -  '
        OnKeyPress = PrnomeKeyPress
      end
      object Prrg: TMaskEdit
        Left = 174
        Top = 88
        Width = 172
        Height = 21
        MaxLength = 20
        TabOrder = 8
        OnKeyPress = PrnomeKeyPress
      end
      object Premail: TsEdit
        Left = 356
        Top = 88
        Width = 345
        Height = 21
        MaxLength = 50
        TabOrder = 9
        OnKeyPress = PrnomeKeyPress
      end
      object Prid_cidade: TsComboEdit
        IsNumeric = true
        Left = 1
        Top = 48
        Width = 66
        Height = 21
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
        NumGlyphs = 1
        TabOrder = 3
        OnButtonClick = PRCod_cidadeButtonClick2
        OnExit = Prid_cidadeExit
        OnKeyPress = Prid_cidadeKeyPress
      end
      object PrCNH: TMaskEdit
        Left = 0
        Top = 126
        Width = 172
        Height = 21
        MaxLength = 20
        TabOrder = 10
        OnKeyPress = PrnomeKeyPress
      end
      object PrNReg: TMaskEdit
        Left = 174
        Top = 126
        Width = 172
        Height = 21
        MaxLength = 20
        TabOrder = 11
        OnKeyPress = PrnomeKeyPress
      end
    end
    object tab_comissao: TTabSheet
      Caption = 'Comissao'
      ImageIndex = 1
      object PrPERC_COMISSAO_FIXA: TsCurrencyEdit
        Left = 112
        Top = 6
        Width = 99
        Height = 21
        AutoSize = False
        DisplayFormat = '0'
        TabOrder = 0
        OnEnter = PrPERC_COMISSAO_FIXAEnter
      end
    end
    object tab_metas: TTabSheet
      Caption = 'Metas Comerciais'
      ImageIndex = 2
      object GroupBox4: TsGroupBox
        Left = 0
        Top = 0
        Width = 724
        Height = 177
        Align = alTop
        TabOrder = 0
        object Sg_meta: TAdvStringGrid
          Left = 2
          Top = 15
          Width = 720
          Height = 114
          Cursor = crDefault
          Align = alTop
          ColCount = 13
          DefaultRowHeight = 21
          DefaultDrawing = False
          FixedCols = 1
          RowCount = 4
          FixedRows = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          GridLineWidth = 1
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goEditing]
          ParentFont = False
          TabOrder = 0
          GridLineColor = clSilver
          ActiveCellShow = False
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -11
          ActiveCellFont.Name = 'MS Sans Serif'
          ActiveCellFont.Style = [fsBold]
          ActiveCellColor = clGray
          Bands.PrimaryColor = clInfoBk
          Bands.PrimaryLength = 1
          Bands.SecondaryColor = clWindow
          Bands.SecondaryLength = 1
          Bands.Print = False
          AutoNumAlign = False
          AutoSize = False
          VAlignment = vtaTop
          EnhTextSize = False
          EnhRowColMove = False
          SizeWithForm = False
          Multilinecells = False
          DragDropSettings.OleAcceptFiles = True
          DragDropSettings.OleAcceptText = True
          SortSettings.AutoColumnMerge = False
          SortSettings.Column = 0
          SortSettings.Show = False
          SortSettings.IndexShow = False
          SortSettings.IndexColor = clYellow
          SortSettings.Full = True
          SortSettings.SingleColumn = False
          SortSettings.IgnoreBlanks = False
          SortSettings.BlankPos = blFirst
          SortSettings.AutoFormat = True
          SortSettings.Direction = sdAscending
          SortSettings.FixedCols = False
          SortSettings.NormalCellsOnly = False
          SortSettings.Row = 0
          FloatingFooter.Color = clBtnFace
          FloatingFooter.Column = 0
          FloatingFooter.FooterStyle = fsFixedLastRow
          FloatingFooter.Visible = False
          ControlLook.Color = clBlack
          ControlLook.CheckSize = 15
          ControlLook.RadioSize = 10
          ControlLook.ControlStyle = csClassic
          ControlLook.FlatButton = False
          EnableBlink = False
          EnableHTML = True
          EnableWheel = True
          Flat = False
          HintColor = clInfoBk
          SelectionColor = clHighlight
          SelectionTextColor = clHighlightText
          SelectionRectangle = False
          SelectionResizer = False
          SelectionRTFKeep = False
          HintShowCells = False
          HintShowLargeText = False
          HintShowSizing = False
          PrintSettings.FooterSize = 0
          PrintSettings.HeaderSize = 0
          PrintSettings.Time = ppNone
          PrintSettings.Date = ppNone
          PrintSettings.DateFormat = 'dd/mm/yyyy'
          PrintSettings.PageNr = ppNone
          PrintSettings.Title = ppNone
          PrintSettings.Font.Charset = DEFAULT_CHARSET
          PrintSettings.Font.Color = clWindowText
          PrintSettings.Font.Height = -11
          PrintSettings.Font.Name = 'MS Sans Serif'
          PrintSettings.Font.Style = []
          PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
          PrintSettings.HeaderFont.Color = clWindowText
          PrintSettings.HeaderFont.Height = -11
          PrintSettings.HeaderFont.Name = 'MS Sans Serif'
          PrintSettings.HeaderFont.Style = []
          PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
          PrintSettings.FooterFont.Color = clWindowText
          PrintSettings.FooterFont.Height = -11
          PrintSettings.FooterFont.Name = 'MS Sans Serif'
          PrintSettings.FooterFont.Style = []
          PrintSettings.Borders = pbNoborder
          PrintSettings.BorderStyle = psSolid
          PrintSettings.Centered = False
          PrintSettings.RepeatFixedRows = False
          PrintSettings.RepeatFixedCols = False
          PrintSettings.LeftSize = 0
          PrintSettings.RightSize = 0
          PrintSettings.ColumnSpacing = 0
          PrintSettings.RowSpacing = 0
          PrintSettings.TitleSpacing = 0
          PrintSettings.Orientation = poPortrait
          PrintSettings.PageNumberOffset = 0
          PrintSettings.MaxPagesOffset = 0
          PrintSettings.FixedWidth = 0
          PrintSettings.FixedHeight = 0
          PrintSettings.UseFixedHeight = False
          PrintSettings.UseFixedWidth = False
          PrintSettings.FitToPage = fpNever
          PrintSettings.PageNumSep = '/'
          PrintSettings.NoAutoSize = False
          PrintSettings.NoAutoSizeRow = False
          PrintSettings.PrintGraphics = False
          HTMLSettings.Width = 100
          HTMLSettings.XHTML = False
          Navigation.AdvanceDirection = adLeftRight
          Navigation.InsertPosition = pInsertBefore
          Navigation.HomeEndKey = heFirstLastColumn
          Navigation.TabToNextAtEnd = False
          Navigation.TabAdvanceDirection = adLeftRight
          ColumnSize.Location = clRegistry
          CellNode.Color = clSilver
          CellNode.NodeColor = clBlack
          CellNode.ShowTree = False
          MaxEditLength = 0
          IntelliPan = ipVertical
          URLColor = clBlue
          URLShow = False
          URLFull = False
          URLEdit = False
          ScrollType = ssNormal
          ScrollColor = clNone
          ScrollWidth = 17
          ScrollSynch = False
          ScrollProportional = False
          ScrollHints = shNone
          OemConvert = False
          FixedFooters = 0
          FixedRightCols = 0
          FixedColWidth = 64
          FixedRowHeight = 21
          FixedFont.Charset = DEFAULT_CHARSET
          FixedFont.Color = clWindowText
          FixedFont.Height = -11
          FixedFont.Name = 'Tahoma'
          FixedFont.Style = []
          FixedAsButtons = False
          FloatFormat = '%.2f'
          IntegralHeight = False
          WordWrap = False
          Lookup = False
          LookupCaseSensitive = False
          LookupHistory = False
          BackGround.Top = 0
          BackGround.Left = 0
          BackGround.Display = bdTile
          BackGround.Cells = bcNormal
          Filter = <>
          ColWidths = (
            64
            64
            64
            63
            63
            63
            63
            63
            63
            63
            63
            63
            63)
        end
        object RadioButton1: TRadioButton
          Left = 8
          Top = 137
          Width = 72
          Height = 16
          Caption = 'Faturados'
          TabOrder = 1
        end
        object RadioButton2: TRadioButton
          Left = 88
          Top = 137
          Width = 59
          Height = 16
          Caption = 'Todos'
          TabOrder = 2
        end
      end
    end
  end
  object Panel1: tsPanel
    Left = 0
    Top = 420
    Width = 732
    Height = 44
    Align = alBottom
    TabOrder = 2
    object Btnov: TsBitBtn
      Left = 144
      Top = 8
      Width = 83
      Height = 31
      Caption = 'Inserir'
      TabOrder = 0
      OnClick = BtnovClick
    end
    object btalt: TsBitBtn
      Left = 226
      Top = 8
      Width = 83
      Height = 31
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = btaltClick
    end
    object btgra: TsBitBtn
      Left = 308
      Top = 8
      Width = 83
      Height = 31
      Caption = 'Gravar'
      Enabled = False
      TabOrder = 2
      OnClick = btgraClick
    end
    object btcan: TsBitBtn
      Left = 390
      Top = 8
      Width = 83
      Height = 31
      Caption = 'Cancelar'
      Enabled = False
      TabOrder = 3
      OnClick = btcanClick
    end
    object btexc: TsBitBtn
      Left = 472
      Top = 8
      Width = 83
      Height = 31
      Caption = 'Excluir'
      TabOrder = 4
      OnClick = btexcClick
    end
    object BitBtn1: TsBitBtn
      Left = 592
      Top = 8
      Width = 91
      Height = 31
      Caption = 'Localizar'
      TabOrder = 5
      OnClick = BitBtn1Click
    end
  end
  object q_funcionario: TFDQuery
    Connection = dao.CN    
    Left = 480
    Top = 93
  end
end
