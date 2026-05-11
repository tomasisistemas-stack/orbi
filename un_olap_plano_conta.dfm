object fr_olap_plano_conta: Tfr_olap_plano_conta
  Left = 247
  Top = 223
  BorderIcons = [biSystemMenu]
  Caption = 'Consulta Anal'#237'tica - Plano de Contas.'
  ClientHeight = 453
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TsPageControl
    Left = 0
    Top = 0
    Width = 688
    Height = 453
    ActivePage = tabGrade
    Align = alClient
    TabOrder = 0
    SkinData.SkinSection = 'PAGECONTROL'
    object tabGrade: TsTabSheet
      Caption = 'Grade'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object HierCubeGrid1: THierCubeGrid
        Left = 0
        Top = 0
        Width = 680
        Height = 425
        Align = alClient
        UseDockManager = False
        ParentColor = False
        TabOrder = 0
        HierCube = HierCube1
        VisualSettings.CaptionFont.Charset = DEFAULT_CHARSET
        VisualSettings.CaptionFont.Color = clWindowText
        VisualSettings.CaptionFont.Height = -11
        VisualSettings.CaptionFont.Name = 'MS Sans Serif'
        VisualSettings.CaptionFont.Style = [fsBold]
        VisualSettings.DimPanelFont.Charset = DEFAULT_CHARSET
        VisualSettings.DimPanelFont.Color = clWindowText
        VisualSettings.DimPanelFont.Height = -11
        VisualSettings.DimPanelFont.Name = 'MS Sans Serif'
        VisualSettings.DimPanelFont.Style = []
        VisualSettings.LabelFont.Charset = DEFAULT_CHARSET
        VisualSettings.LabelFont.Color = clWindowText
        VisualSettings.LabelFont.Height = -11
        VisualSettings.LabelFont.Name = 'MS Sans Serif'
        VisualSettings.LabelFont.Style = []
        VisualSettings.DataFont.Charset = DEFAULT_CHARSET
        VisualSettings.DataFont.Color = clWindowText
        VisualSettings.DataFont.Height = -11
        VisualSettings.DataFont.Name = 'MS Sans Serif'
        VisualSettings.DataFont.Style = []
        VisualSettings.ShowMoreIconsButton = True
        SummarySettings = <
          item
            DisplayName = 'VALOR'
            FieldName = 'VALOR_SALDO'
            DimensionMapIndex = 10
            FunctionSum.SubFunctionValue.Visible = True
            FunctionSum.SubFunctionRankByRow.FormatString = '0'
            FunctionSum.SubFunctionRankByCol.FormatString = '0'
            FunctionSum.SubFunctionPercentByRow.FormatString = '0.0"%"'
            FunctionSum.SubFunctionPercentByCol.FormatString = '0.0"%"'
            FunctionCount.SubFunctionValue.FormatString = '0'
            FunctionCount.SubFunctionRankByRow.FormatString = '0'
            FunctionCount.SubFunctionRankByCol.FormatString = '0'
            FunctionCount.SubFunctionPercentByRow.FormatString = '0.0"%"'
            FunctionCount.SubFunctionPercentByCol.FormatString = '0.0"%"'
            FunctionCount.SubFunctionCompareWithPrevByRow.FormatString = '0'
            FunctionCount.SubFunctionCompareWithPrevByCol.FormatString = '0'
            FunctionCount.SubFunctionCumulativeSumByRow.FormatString = '0'
            FunctionCount.SubFunctionCumulativeSumByCol.FormatString = '0'
            FunctionCount.SubFunctionCustom1.FormatString = '0'
            FunctionCount.SubFunctionCustom2.FormatString = '0'
            FunctionCount.SubFunctionCustom3.FormatString = '0'
            FunctionCount.SubFunctionCustom4.FormatString = '0'
            FunctionCount.SubFunctionCustom5.FormatString = '0'
            FunctionAverage.SubFunctionRankByRow.FormatString = '0'
            FunctionAverage.SubFunctionRankByCol.FormatString = '0'
            FunctionAverage.SubFunctionPercentByRow.FormatString = '0.0"%"'
            FunctionAverage.SubFunctionPercentByCol.FormatString = '0.0"%"'
            FunctionMin.SubFunctionRankByRow.FormatString = '0'
            FunctionMin.SubFunctionRankByCol.FormatString = '0'
            FunctionMin.SubFunctionPercentByRow.FormatString = '0.0"%"'
            FunctionMin.SubFunctionPercentByCol.FormatString = '0.0"%"'
            FunctionMax.SubFunctionRankByRow.FormatString = '0'
            FunctionMax.SubFunctionRankByCol.FormatString = '0'
            FunctionMax.SubFunctionPercentByRow.FormatString = '0.0"%"'
            FunctionMax.SubFunctionPercentByCol.FormatString = '0.0"%"'
            FunctionVariance.SubFunctionRankByRow.FormatString = '0'
            FunctionVariance.SubFunctionRankByCol.FormatString = '0'
            FunctionVariance.SubFunctionPercentByRow.FormatString = '0.0"%"'
            FunctionVariance.SubFunctionPercentByCol.FormatString = '0.0"%"'
            FunctionStdDev.SubFunctionRankByRow.FormatString = '0'
            FunctionStdDev.SubFunctionRankByCol.FormatString = '0'
            FunctionStdDev.SubFunctionPercentByRow.FormatString = '0.0"%"'
            FunctionStdDev.SubFunctionPercentByCol.FormatString = '0.0"%"'
            FunctionMeanAbsDev.SubFunctionRankByRow.FormatString = '0'
            FunctionMeanAbsDev.SubFunctionRankByCol.FormatString = '0'
            FunctionMeanAbsDev.SubFunctionPercentByRow.FormatString = '0.0"%"'
            FunctionMeanAbsDev.SubFunctionPercentByCol.FormatString = '0.0"%"'
            FunctionSkewness.SubFunctionRankByRow.FormatString = '0'
            FunctionSkewness.SubFunctionRankByCol.FormatString = '0'
            FunctionSkewness.SubFunctionPercentByRow.FormatString = '0.0"%"'
            FunctionSkewness.SubFunctionPercentByCol.FormatString = '0.0"%"'
            FunctionKurtosis.SubFunctionRankByRow.FormatString = '0'
            FunctionKurtosis.SubFunctionRankByCol.FormatString = '0'
            FunctionKurtosis.SubFunctionPercentByRow.FormatString = '0.0"%"'
            FunctionKurtosis.SubFunctionPercentByCol.FormatString = '0.0"%"'
            FunctionMedian.SubFunctionRankByRow.FormatString = '0'
            FunctionMedian.SubFunctionRankByCol.FormatString = '0'
            FunctionMedian.SubFunctionPercentByRow.FormatString = '0.0"%"'
            FunctionMedian.SubFunctionPercentByCol.FormatString = '0.0"%"'
            FunctionCustom1.SubFunctionRankByRow.FormatString = '0'
            FunctionCustom1.SubFunctionRankByCol.FormatString = '0'
            FunctionCustom1.SubFunctionPercentByRow.FormatString = '0.0"%"'
            FunctionCustom1.SubFunctionPercentByCol.FormatString = '0.0"%"'
            FunctionCustom2.SubFunctionRankByRow.FormatString = '0'
            FunctionCustom2.SubFunctionRankByCol.FormatString = '0'
            FunctionCustom2.SubFunctionPercentByRow.FormatString = '0.0"%"'
            FunctionCustom2.SubFunctionPercentByCol.FormatString = '0.0"%"'
            FunctionCustom3.SubFunctionRankByRow.FormatString = '0'
            FunctionCustom3.SubFunctionRankByCol.FormatString = '0'
            FunctionCustom3.SubFunctionPercentByRow.FormatString = '0.0"%"'
            FunctionCustom3.SubFunctionPercentByCol.FormatString = '0.0"%"'
            FunctionCustom4.SubFunctionRankByRow.FormatString = '0'
            FunctionCustom4.SubFunctionRankByCol.FormatString = '0'
            FunctionCustom4.SubFunctionPercentByRow.FormatString = '0.0"%"'
            FunctionCustom4.SubFunctionPercentByCol.FormatString = '0.0"%"'
            FunctionCustom5.SubFunctionRankByRow.FormatString = '0'
            FunctionCustom5.SubFunctionRankByCol.FormatString = '0'
            FunctionCustom5.SubFunctionPercentByRow.FormatString = '0.0"%"'
            FunctionCustom5.SubFunctionPercentByCol.FormatString = '0.0"%"'
          end>
        FunctionDefs = <
          item
            DisplayName = 'Sum'
            UserAllowed = True
          end
          item
            DisplayName = 'Count'
            UserAllowed = True
          end
          item
            DisplayName = 'Average'
            UserAllowed = True
          end
          item
            DisplayName = 'Min'
            UserAllowed = True
          end
          item
            DisplayName = 'Max'
            UserAllowed = True
          end
          item
            DisplayName = 'Variance'
            UserAllowed = True
          end
          item
            DisplayName = 'Standard deviation'
            UserAllowed = True
          end
          item
            DisplayName = 'Average deviation'
            UserAllowed = True
          end
          item
            DisplayName = 'Skewness'
            UserAllowed = True
          end
          item
            DisplayName = 'Kurtosis'
            UserAllowed = True
          end
          item
            DisplayName = 'Median'
            UserAllowed = True
          end>
        SubFunctionDefs = <
          item
            DisplayName = 'Agg. value'
            UserAllowed = True
          end
          item
            DisplayName = 'Row rank'
            UserAllowed = True
          end
          item
            DisplayName = 'Col rank'
            UserAllowed = True
          end
          item
            DisplayName = '% ROW'
            UserAllowed = True
          end
          item
            DisplayName = '% COL'
            UserAllowed = True
          end
          item
            DisplayName = 'Prev. row compare'
            UserAllowed = True
          end
          item
            DisplayName = 'Prev. col compare'
            UserAllowed = True
          end
          item
            DisplayName = 'Row cumul. Sum'
            UserAllowed = True
          end
          item
            DisplayName = 'Col cumul. Sum'
            UserAllowed = True
          end>
        DimensionEditorFilterOn = False
      end
    end
    object tabGrafico: TsTabSheet
      Caption = 'Gr'#225'fico'
      ImageIndex = 1
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object HierCubeChart1: THierCubeChart
        Left = 0
        Top = 0
        Width = 680
        Height = 425
        Title.Text.Strings = (
          'THierCubeChart')
        LeftAxis.Title.Caption = 'VALOR'
        View3DOptions.Elevation = 315
        View3DOptions.Orthogonal = False
        View3DOptions.Perspective = 0
        View3DOptions.Rotation = 360
        Align = alClient
        TabOrder = 0
        HierGrid = HierCubeGrid1
        UseDimension = xhcRows
        Summaries = <>
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
      end
    end
  end
  object q_plano_conta: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'SELECT a.ID, a.NR_CONTA, a.DESCRICAO1 AS PC1, a.DESCRICAO2 AS PC' +
        '2, a.DESCRICAO3 AS PC3, a.DESCRICAO4 AS PC4, a.OPERACAO, a.TITUL' +
        'O, '
      
        'case when extract(DAY FROM a.DATA) < 10 then '#39'0'#39'||extract(DAY FR' +
        'OM a.DATA) else extract(DAY FROM a.DATA) end||'#39'/'#39'||'
      
        'case when extract(MONTH FROM a.DATA) < 10 then '#39'0'#39'||extract(MONT' +
        'H FROM a.DATA) else extract(MONTH FROM a.DATA) end||'#39'/'#39'||'
      'EXTRACT(YEAR FROM A.DATA) AS DATA, '
      
        'case when extract(MONTH FROM a.DATA) < 10 then '#39'0'#39'||extract(MONT' +
        'H FROM a.DATA) else extract(MONTH FROM a.DATA) end||'#39'/'#39'||EXTRACT' +
        '(YEAR FROM A.DATA) AS MES, '
      'EXTRACT(YEAR FROM A.DATA) AS ANO,'
      
        'a.HISTORICO, a.VALOR, a.VALOR_SALDO, a.CLIENTE_FORNECEDOR, a.FOR' +
        'MA'
      'FROM V_PLANO_CONTAS a'
      'ORDER BY A.DATA')
    Left = 272
    Top = 32
  end
  object HierCube1: THierCube
    DataSet = q_plano_conta
    DimensionMap = <
      item
        BaseFieldName = 'TITULO'
        BaseFieldType = ftString
        DisplayName = 'TITULO'
        DimSumType = dsDimension
        DimGroup = dgPage
        SortType = dsNameAsc
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'CLIENTE_FORNECEDOR'
        BaseFieldType = ftString
        DisplayName = 'CLIENTE\FORNECEDOR'
        DimSumType = dsDimension
        DimGroup = dgPage
        SortType = dsNameAsc
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'PC1'
        BaseFieldType = ftString
        DisplayName = 'PC1'
        DimSumType = dsDimension
        DimGroup = dgPage
        SortType = dsNameAsc
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'PC2'
        BaseFieldType = ftString
        DisplayName = 'PC2'
        DimSumType = dsDimension
        DimGroup = dgPage
        SortType = dsNameAsc
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'PC3'
        BaseFieldType = ftString
        DisplayName = 'PC3'
        DimSumType = dsDimension
        DimGroup = dgPage
        SortType = dsNameAsc
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'PC4'
        BaseFieldType = ftString
        DisplayName = 'PC4'
        DimSumType = dsDimension
        DimGroup = dgPage
        SortType = dsNameAsc
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'ANO'
        BaseFieldType = ftSmallint
        DisplayName = 'ANO'
        DimSumType = dsDimension
        DimGroup = dgPage
        SortType = dsNameAsc
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'MES'
        BaseFieldType = ftString
        DisplayName = 'MES'
        DimSumType = dsDimension
        DimGroup = dgPage
        SortType = dsNameAsc
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'DATA'
        BaseFieldType = ftString
        DisplayName = 'DATA'
        DimSumType = dsDimension
        DimGroup = dgPage
        SortType = dsNameAsc
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'FORMA'
        BaseFieldType = ftString
        DisplayName = 'FORMA'
        DimSumType = dsDimension
        DimGroup = dgPage
        SortType = dsNameAsc
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'VALOR_SALDO'
        BaseFieldType = ftBCD
        DisplayName = 'VALOR'
        DimSumType = dsSummary
        DefaultFormat = 'R$ #,###,###,##0.00'
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'VALOR'
        BaseFieldType = ftBCD
        DisplayName = 'VALOR'
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'ID'
        BaseFieldType = ftInteger
        DisplayName = 'ID'
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'NR_CONTA'
        BaseFieldType = ftString
        DisplayName = 'NR_CONTA'
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'OPERACAO'
        BaseFieldType = ftString
        DisplayName = 'OPERACAO'
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'HISTORICO'
        BaseFieldType = ftString
        DisplayName = 'HISTORICO'
        CaseSensitiveKeys = False
      end>
    Options.Editable = True
    Left = 216
    Top = 112
  end
end
