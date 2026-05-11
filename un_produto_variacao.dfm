object fm_produto_variacao: Tfm_produto_variacao
  Left = 1
  Top = 1
  BorderIcons = [biSystemMenu]
  Caption = 'Produtos - Varia'#231#227'o de Pre'#231'o de Custo.'
  ClientHeight = 709
  ClientWidth = 1013
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
    Top = 668
    Width = 1013
    Height = 41
    Align = alBottom
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object btImprimir: TsSpeedButton
      Left = 518
      Top = 5
      Width = 86
      Height = 30
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
      OnClick = btImprimirClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object BTOK: TsSpeedButton
      Left = 416
      Top = 5
      Width = 97
      Height = 30
      Caption = 'OK'
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
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
      ParentFont = False
      OnClick = BTOKClick
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
  end
  object gfProdutos: TChart
    Left = 0
    Top = 0
    Width = 1013
    Height = 668
    Title.Text.Strings = (
      'TChart')
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 296
    ExplicitTop = 160
    ExplicitWidth = 400
    ExplicitHeight = 250
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series1: TLineSeries
      DataSource = DBCrossTabSource1
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object mmProdutoVariacao: TRxMemoryData
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'PRODUTO'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'CUSTO'
        DataType = ftFloat
      end
      item
        Name = 'MES'
        DataType = ftString
        Size = 10
      end>
    Left = 96
    Top = 136
    object mmProdutoVariacaoPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 80
    end
    object mmProdutoVariacaoCUSTO: TFloatField
      FieldName = 'CUSTO'
    end
    object mmProdutoVariacaoMES: TStringField
      FieldName = 'MES'
      Size = 10
    end
    object mmProdutoVariacaoMES_ANO: TDateTimeField
      FieldName = 'MES_ANO'
    end
  end
  object dsProdutoVariacao: TDataSource
    AutoEdit = False
    DataSet = mmProdutoVariacao
    Left = 128
    Top = 136
  end
  object DBCrossTabSource1: TDBCrossTabSource
    Active = True
    DataSet = mmProdutoVariacao
    GroupField = 'MES_ANO'
    LabelField = 'MES_ANO'
    Series = Series1
    ValueField = 'CUSTO'
  end
end
