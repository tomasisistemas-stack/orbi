object fr_olap_vendas: Tfr_olap_vendas
  Left = 247
  Top = 223
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Consulta Anal'#237'tica - Vendas'
  ClientHeight = 421
  ClientWidth = 680
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TsPageControl
    Left = 0
    Top = 0
    Width = 680
    Height = 421
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
        Width = 672
        Height = 393
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
            FieldName = 'SUB_TOTAL'
            DefaultFormat = 'R$ #,##0.00'
            DimensionMapIndex = 16
            FunctionSum.SubFunctionValue.Visible = True
            FunctionSum.SubFunctionValue.FormatString = 'R$ #,##0.00'
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
          end
          item
            DisplayName = 'QUANTIDADE'
            FieldName = 'QTD'
            DefaultFormat = '#,##0.00'
            DimensionMapIndex = 17
            FunctionSum.SubFunctionValue.Visible = True
            FunctionSum.SubFunctionValue.FormatString = '#,##0.00'
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
          end
          item
            DisplayName = 'PRE'#199'O DE CUSTO'
            FieldName = 'PRECO_CUSTO'
            DimensionMapIndex = 18
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
          end
          item
            DisplayName = 'MARGEM DE LUCRO DO ITEM'
            FieldName = 'MARGEM_LUCRO_ITEM'
            DimensionMapIndex = 19
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
          end
          item
            DisplayName = '% COMISS'#195'O'
            FieldName = 'PERC_COMISSAO'
            DimensionMapIndex = 20
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
          end
          item
            DisplayName = '$ COMISS'#195'O'
            FieldName = 'VLR_COMISSAO'
            DimensionMapIndex = 21
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
          end
          item
            DisplayName = '% COMISS'#195'O ANTIGA'
            FieldName = 'PERC_COMISSAO_ANTIGA'
            DimensionMapIndex = 22
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
          end
          item
            DisplayName = 'DIFERENCA DE $ COMISS'#195'O'
            FieldName = 'DIFERENCA_COMISSAO_VALOR'
            DimensionMapIndex = 23
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
          end
          item
            DisplayName = 'DIFERENCA DE % COMISS'#195'O '
            FieldName = 'DIFERENCA_COMISSAO_PERC'
            DimensionMapIndex = 24
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
          end
          item
            DisplayName = 'DESCONTO NO PEDIDO'
            FieldName = 'DESCONTO_PEDIDO'
            DimensionMapIndex = 31
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
          end
          item
            DisplayName = 'DESCONTO DO ITEM'
            FieldName = 'DESCONTO_ITEM'
            DimensionMapIndex = 25
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
          end
          item
            DisplayName = 'PRE'#199'O'
            FieldName = 'PRECO'
            DimensionMapIndex = 26
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
          end
          item
            DisplayName = 'MARGEM LUCRO DO PEDIDO'
            FieldName = 'MARGEM_LUCRO_PEDIDO'
            DimensionMapIndex = 27
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
          end
          item
            DisplayName = 'META DI'#193'RIA'
            FieldName = 'META_DIA'
            DimensionMapIndex = 30
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
          end
          item
            DisplayName = 'META SEMANAL'
            FieldName = 'META_SEMANA'
            DimensionMapIndex = 29
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
          end
          item
            DisplayName = 'META MENSAL'
            FieldName = 'META_MENSAL'
            DefaultFormat = 'R$ #,###,###,##0.00'
            DimensionMapIndex = 28
            FunctionSum.SubFunctionValue.Visible = True
            FunctionSum.SubFunctionValue.FormatString = 'R$ #,###,###,##0.00'
            FunctionSum.SubFunctionRankByRow.FormatString = '0'
            FunctionSum.SubFunctionRankByCol.FormatString = '0'
            FunctionSum.SubFunctionPercentByRow.FormatString = '0.0"%"'
            FunctionSum.SubFunctionPercentByCol.FormatString = '0.0"%"'
            FunctionSum.SubFunctionCompareWithPrevByRow.FormatString = 'R$ #,###,###,##0.00'
            FunctionSum.SubFunctionCompareWithPrevByCol.FormatString = 'R$ #,###,###,##0.00'
            FunctionSum.SubFunctionCumulativeSumByRow.FormatString = 'R$ #,###,###,##0.00'
            FunctionSum.SubFunctionCumulativeSumByCol.FormatString = 'R$ #,###,###,##0.00'
            FunctionSum.SubFunctionCustom1.FormatString = 'R$ #,###,###,##0.00'
            FunctionSum.SubFunctionCustom2.FormatString = 'R$ #,###,###,##0.00'
            FunctionSum.SubFunctionCustom3.FormatString = 'R$ #,###,###,##0.00'
            FunctionSum.SubFunctionCustom4.FormatString = 'R$ #,###,###,##0.00'
            FunctionSum.SubFunctionCustom5.FormatString = 'R$ #,###,###,##0.00'
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
            FunctionAverage.SubFunctionValue.FormatString = 'R$ #,###,###,##0.00'
            FunctionAverage.SubFunctionRankByRow.FormatString = '0'
            FunctionAverage.SubFunctionRankByCol.FormatString = '0'
            FunctionAverage.SubFunctionPercentByRow.FormatString = '0.0"%"'
            FunctionAverage.SubFunctionPercentByCol.FormatString = '0.0"%"'
            FunctionAverage.SubFunctionCompareWithPrevByRow.FormatString = 'R$ #,###,###,##0.00'
            FunctionAverage.SubFunctionCompareWithPrevByCol.FormatString = 'R$ #,###,###,##0.00'
            FunctionAverage.SubFunctionCumulativeSumByRow.FormatString = 'R$ #,###,###,##0.00'
            FunctionAverage.SubFunctionCumulativeSumByCol.FormatString = 'R$ #,###,###,##0.00'
            FunctionAverage.SubFunctionCustom1.FormatString = 'R$ #,###,###,##0.00'
            FunctionAverage.SubFunctionCustom2.FormatString = 'R$ #,###,###,##0.00'
            FunctionAverage.SubFunctionCustom3.FormatString = 'R$ #,###,###,##0.00'
            FunctionAverage.SubFunctionCustom4.FormatString = 'R$ #,###,###,##0.00'
            FunctionAverage.SubFunctionCustom5.FormatString = 'R$ #,###,###,##0.00'
            FunctionMin.SubFunctionValue.FormatString = 'R$ #,###,###,##0.00'
            FunctionMin.SubFunctionRankByRow.FormatString = '0'
            FunctionMin.SubFunctionRankByCol.FormatString = '0'
            FunctionMin.SubFunctionPercentByRow.FormatString = '0.0"%"'
            FunctionMin.SubFunctionPercentByCol.FormatString = '0.0"%"'
            FunctionMin.SubFunctionCompareWithPrevByRow.FormatString = 'R$ #,###,###,##0.00'
            FunctionMin.SubFunctionCompareWithPrevByCol.FormatString = 'R$ #,###,###,##0.00'
            FunctionMin.SubFunctionCumulativeSumByRow.FormatString = 'R$ #,###,###,##0.00'
            FunctionMin.SubFunctionCumulativeSumByCol.FormatString = 'R$ #,###,###,##0.00'
            FunctionMin.SubFunctionCustom1.FormatString = 'R$ #,###,###,##0.00'
            FunctionMin.SubFunctionCustom2.FormatString = 'R$ #,###,###,##0.00'
            FunctionMin.SubFunctionCustom3.FormatString = 'R$ #,###,###,##0.00'
            FunctionMin.SubFunctionCustom4.FormatString = 'R$ #,###,###,##0.00'
            FunctionMin.SubFunctionCustom5.FormatString = 'R$ #,###,###,##0.00'
            FunctionMax.SubFunctionValue.FormatString = 'R$ #,###,###,##0.00'
            FunctionMax.SubFunctionRankByRow.FormatString = '0'
            FunctionMax.SubFunctionRankByCol.FormatString = '0'
            FunctionMax.SubFunctionPercentByRow.FormatString = '0.0"%"'
            FunctionMax.SubFunctionPercentByCol.FormatString = '0.0"%"'
            FunctionMax.SubFunctionCompareWithPrevByRow.FormatString = 'R$ #,###,###,##0.00'
            FunctionMax.SubFunctionCompareWithPrevByCol.FormatString = 'R$ #,###,###,##0.00'
            FunctionMax.SubFunctionCumulativeSumByRow.FormatString = 'R$ #,###,###,##0.00'
            FunctionMax.SubFunctionCumulativeSumByCol.FormatString = 'R$ #,###,###,##0.00'
            FunctionMax.SubFunctionCustom1.FormatString = 'R$ #,###,###,##0.00'
            FunctionMax.SubFunctionCustom2.FormatString = 'R$ #,###,###,##0.00'
            FunctionMax.SubFunctionCustom3.FormatString = 'R$ #,###,###,##0.00'
            FunctionMax.SubFunctionCustom4.FormatString = 'R$ #,###,###,##0.00'
            FunctionMax.SubFunctionCustom5.FormatString = 'R$ #,###,###,##0.00'
            FunctionVariance.SubFunctionValue.FormatString = 'R$ #,###,###,##0.00'
            FunctionVariance.SubFunctionRankByRow.FormatString = '0'
            FunctionVariance.SubFunctionRankByCol.FormatString = '0'
            FunctionVariance.SubFunctionPercentByRow.FormatString = '0.0"%"'
            FunctionVariance.SubFunctionPercentByCol.FormatString = '0.0"%"'
            FunctionVariance.SubFunctionCompareWithPrevByRow.FormatString = 'R$ #,###,###,##0.00'
            FunctionVariance.SubFunctionCompareWithPrevByCol.FormatString = 'R$ #,###,###,##0.00'
            FunctionVariance.SubFunctionCumulativeSumByRow.FormatString = 'R$ #,###,###,##0.00'
            FunctionVariance.SubFunctionCumulativeSumByCol.FormatString = 'R$ #,###,###,##0.00'
            FunctionVariance.SubFunctionCustom1.FormatString = 'R$ #,###,###,##0.00'
            FunctionVariance.SubFunctionCustom2.FormatString = 'R$ #,###,###,##0.00'
            FunctionVariance.SubFunctionCustom3.FormatString = 'R$ #,###,###,##0.00'
            FunctionVariance.SubFunctionCustom4.FormatString = 'R$ #,###,###,##0.00'
            FunctionVariance.SubFunctionCustom5.FormatString = 'R$ #,###,###,##0.00'
            FunctionStdDev.SubFunctionValue.FormatString = 'R$ #,###,###,##0.00'
            FunctionStdDev.SubFunctionRankByRow.FormatString = '0'
            FunctionStdDev.SubFunctionRankByCol.FormatString = '0'
            FunctionStdDev.SubFunctionPercentByRow.FormatString = '0.0"%"'
            FunctionStdDev.SubFunctionPercentByCol.FormatString = '0.0"%"'
            FunctionStdDev.SubFunctionCompareWithPrevByRow.FormatString = 'R$ #,###,###,##0.00'
            FunctionStdDev.SubFunctionCompareWithPrevByCol.FormatString = 'R$ #,###,###,##0.00'
            FunctionStdDev.SubFunctionCumulativeSumByRow.FormatString = 'R$ #,###,###,##0.00'
            FunctionStdDev.SubFunctionCumulativeSumByCol.FormatString = 'R$ #,###,###,##0.00'
            FunctionStdDev.SubFunctionCustom1.FormatString = 'R$ #,###,###,##0.00'
            FunctionStdDev.SubFunctionCustom2.FormatString = 'R$ #,###,###,##0.00'
            FunctionStdDev.SubFunctionCustom3.FormatString = 'R$ #,###,###,##0.00'
            FunctionStdDev.SubFunctionCustom4.FormatString = 'R$ #,###,###,##0.00'
            FunctionStdDev.SubFunctionCustom5.FormatString = 'R$ #,###,###,##0.00'
            FunctionMeanAbsDev.SubFunctionValue.FormatString = 'R$ #,###,###,##0.00'
            FunctionMeanAbsDev.SubFunctionRankByRow.FormatString = '0'
            FunctionMeanAbsDev.SubFunctionRankByCol.FormatString = '0'
            FunctionMeanAbsDev.SubFunctionPercentByRow.FormatString = '0.0"%"'
            FunctionMeanAbsDev.SubFunctionPercentByCol.FormatString = '0.0"%"'
            FunctionMeanAbsDev.SubFunctionCompareWithPrevByRow.FormatString = 'R$ #,###,###,##0.00'
            FunctionMeanAbsDev.SubFunctionCompareWithPrevByCol.FormatString = 'R$ #,###,###,##0.00'
            FunctionMeanAbsDev.SubFunctionCumulativeSumByRow.FormatString = 'R$ #,###,###,##0.00'
            FunctionMeanAbsDev.SubFunctionCumulativeSumByCol.FormatString = 'R$ #,###,###,##0.00'
            FunctionMeanAbsDev.SubFunctionCustom1.FormatString = 'R$ #,###,###,##0.00'
            FunctionMeanAbsDev.SubFunctionCustom2.FormatString = 'R$ #,###,###,##0.00'
            FunctionMeanAbsDev.SubFunctionCustom3.FormatString = 'R$ #,###,###,##0.00'
            FunctionMeanAbsDev.SubFunctionCustom4.FormatString = 'R$ #,###,###,##0.00'
            FunctionMeanAbsDev.SubFunctionCustom5.FormatString = 'R$ #,###,###,##0.00'
            FunctionSkewness.SubFunctionValue.FormatString = 'R$ #,###,###,##0.00'
            FunctionSkewness.SubFunctionRankByRow.FormatString = '0'
            FunctionSkewness.SubFunctionRankByCol.FormatString = '0'
            FunctionSkewness.SubFunctionPercentByRow.FormatString = '0.0"%"'
            FunctionSkewness.SubFunctionPercentByCol.FormatString = '0.0"%"'
            FunctionSkewness.SubFunctionCompareWithPrevByRow.FormatString = 'R$ #,###,###,##0.00'
            FunctionSkewness.SubFunctionCompareWithPrevByCol.FormatString = 'R$ #,###,###,##0.00'
            FunctionSkewness.SubFunctionCumulativeSumByRow.FormatString = 'R$ #,###,###,##0.00'
            FunctionSkewness.SubFunctionCumulativeSumByCol.FormatString = 'R$ #,###,###,##0.00'
            FunctionSkewness.SubFunctionCustom1.FormatString = 'R$ #,###,###,##0.00'
            FunctionSkewness.SubFunctionCustom2.FormatString = 'R$ #,###,###,##0.00'
            FunctionSkewness.SubFunctionCustom3.FormatString = 'R$ #,###,###,##0.00'
            FunctionSkewness.SubFunctionCustom4.FormatString = 'R$ #,###,###,##0.00'
            FunctionSkewness.SubFunctionCustom5.FormatString = 'R$ #,###,###,##0.00'
            FunctionKurtosis.SubFunctionValue.FormatString = 'R$ #,###,###,##0.00'
            FunctionKurtosis.SubFunctionRankByRow.FormatString = '0'
            FunctionKurtosis.SubFunctionRankByCol.FormatString = '0'
            FunctionKurtosis.SubFunctionPercentByRow.FormatString = '0.0"%"'
            FunctionKurtosis.SubFunctionPercentByCol.FormatString = '0.0"%"'
            FunctionKurtosis.SubFunctionCompareWithPrevByRow.FormatString = 'R$ #,###,###,##0.00'
            FunctionKurtosis.SubFunctionCompareWithPrevByCol.FormatString = 'R$ #,###,###,##0.00'
            FunctionKurtosis.SubFunctionCumulativeSumByRow.FormatString = 'R$ #,###,###,##0.00'
            FunctionKurtosis.SubFunctionCumulativeSumByCol.FormatString = 'R$ #,###,###,##0.00'
            FunctionKurtosis.SubFunctionCustom1.FormatString = 'R$ #,###,###,##0.00'
            FunctionKurtosis.SubFunctionCustom2.FormatString = 'R$ #,###,###,##0.00'
            FunctionKurtosis.SubFunctionCustom3.FormatString = 'R$ #,###,###,##0.00'
            FunctionKurtosis.SubFunctionCustom4.FormatString = 'R$ #,###,###,##0.00'
            FunctionKurtosis.SubFunctionCustom5.FormatString = 'R$ #,###,###,##0.00'
            FunctionMedian.SubFunctionValue.FormatString = 'R$ #,###,###,##0.00'
            FunctionMedian.SubFunctionRankByRow.FormatString = '0'
            FunctionMedian.SubFunctionRankByCol.FormatString = '0'
            FunctionMedian.SubFunctionPercentByRow.FormatString = '0.0"%"'
            FunctionMedian.SubFunctionPercentByCol.FormatString = '0.0"%"'
            FunctionMedian.SubFunctionCompareWithPrevByRow.FormatString = 'R$ #,###,###,##0.00'
            FunctionMedian.SubFunctionCompareWithPrevByCol.FormatString = 'R$ #,###,###,##0.00'
            FunctionMedian.SubFunctionCumulativeSumByRow.FormatString = 'R$ #,###,###,##0.00'
            FunctionMedian.SubFunctionCumulativeSumByCol.FormatString = 'R$ #,###,###,##0.00'
            FunctionMedian.SubFunctionCustom1.FormatString = 'R$ #,###,###,##0.00'
            FunctionMedian.SubFunctionCustom2.FormatString = 'R$ #,###,###,##0.00'
            FunctionMedian.SubFunctionCustom3.FormatString = 'R$ #,###,###,##0.00'
            FunctionMedian.SubFunctionCustom4.FormatString = 'R$ #,###,###,##0.00'
            FunctionMedian.SubFunctionCustom5.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom1.SubFunctionValue.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom1.SubFunctionRankByRow.FormatString = '0'
            FunctionCustom1.SubFunctionRankByCol.FormatString = '0'
            FunctionCustom1.SubFunctionPercentByRow.FormatString = '0.0"%"'
            FunctionCustom1.SubFunctionPercentByCol.FormatString = '0.0"%"'
            FunctionCustom1.SubFunctionCompareWithPrevByRow.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom1.SubFunctionCompareWithPrevByCol.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom1.SubFunctionCumulativeSumByRow.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom1.SubFunctionCumulativeSumByCol.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom1.SubFunctionCustom1.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom1.SubFunctionCustom2.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom1.SubFunctionCustom3.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom1.SubFunctionCustom4.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom1.SubFunctionCustom5.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom2.SubFunctionValue.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom2.SubFunctionRankByRow.FormatString = '0'
            FunctionCustom2.SubFunctionRankByCol.FormatString = '0'
            FunctionCustom2.SubFunctionPercentByRow.FormatString = '0.0"%"'
            FunctionCustom2.SubFunctionPercentByCol.FormatString = '0.0"%"'
            FunctionCustom2.SubFunctionCompareWithPrevByRow.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom2.SubFunctionCompareWithPrevByCol.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom2.SubFunctionCumulativeSumByRow.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom2.SubFunctionCumulativeSumByCol.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom2.SubFunctionCustom1.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom2.SubFunctionCustom2.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom2.SubFunctionCustom3.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom2.SubFunctionCustom4.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom2.SubFunctionCustom5.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom3.SubFunctionValue.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom3.SubFunctionRankByRow.FormatString = '0'
            FunctionCustom3.SubFunctionRankByCol.FormatString = '0'
            FunctionCustom3.SubFunctionPercentByRow.FormatString = '0.0"%"'
            FunctionCustom3.SubFunctionPercentByCol.FormatString = '0.0"%"'
            FunctionCustom3.SubFunctionCompareWithPrevByRow.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom3.SubFunctionCompareWithPrevByCol.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom3.SubFunctionCumulativeSumByRow.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom3.SubFunctionCumulativeSumByCol.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom3.SubFunctionCustom1.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom3.SubFunctionCustom2.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom3.SubFunctionCustom3.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom3.SubFunctionCustom4.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom3.SubFunctionCustom5.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom4.SubFunctionValue.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom4.SubFunctionRankByRow.FormatString = '0'
            FunctionCustom4.SubFunctionRankByCol.FormatString = '0'
            FunctionCustom4.SubFunctionPercentByRow.FormatString = '0.0"%"'
            FunctionCustom4.SubFunctionPercentByCol.FormatString = '0.0"%"'
            FunctionCustom4.SubFunctionCompareWithPrevByRow.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom4.SubFunctionCompareWithPrevByCol.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom4.SubFunctionCumulativeSumByRow.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom4.SubFunctionCumulativeSumByCol.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom4.SubFunctionCustom1.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom4.SubFunctionCustom2.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom4.SubFunctionCustom3.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom4.SubFunctionCustom4.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom4.SubFunctionCustom5.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom5.SubFunctionValue.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom5.SubFunctionRankByRow.FormatString = '0'
            FunctionCustom5.SubFunctionRankByCol.FormatString = '0'
            FunctionCustom5.SubFunctionPercentByRow.FormatString = '0.0"%"'
            FunctionCustom5.SubFunctionPercentByCol.FormatString = '0.0"%"'
            FunctionCustom5.SubFunctionCompareWithPrevByRow.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom5.SubFunctionCompareWithPrevByCol.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom5.SubFunctionCumulativeSumByRow.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom5.SubFunctionCumulativeSumByCol.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom5.SubFunctionCustom1.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom5.SubFunctionCustom2.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom5.SubFunctionCustom3.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom5.SubFunctionCustom4.FormatString = 'R$ #,###,###,##0.00'
            FunctionCustom5.SubFunctionCustom5.FormatString = 'R$ #,###,###,##0.00'
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
      object Graf: THierCubeChart
        Left = 0
        Top = 0
        Width = 672
        Height = 393
        Title.Text.Strings = (
          'Vendas')
        LeftAxis.Title.Caption = 
          'VALOR, QUANTIDADE, PRE'#199'O DE CUSTO, MARGEM DE LUCRO DO ITEM, % CO' +
          'MISS'#195'O, $ COMISS'#195'O, % COMISS'#195'O ANTIGA, DIFERENCA DE $ COMISS'#195'O, ' +
          'DIFERENCA DE % COMISS'#195'O , DESCONTO NO PEDIDO, DESCONTO DO ITEM, ' +
          'PRE'#199'O, MARGEM LUCRO DO PEDIDO, META DI'#193'RIA, META SEMANAL, META M' +
          'ENSAL'
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
  object q_vendas: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'SELECT a.NUMDOC,'
      'B.COD_PRODUTO, b.QTD, b.PRECO, b.SUB_TOTAL,'
      'P.NOM_PRODUTO,'
      'G.NOM_GRUPO,'
      'cl.COD_CLIENTE, cl.NOM_CLIENTE, cd.nom_cidade, cd.uf,'
      'cmi.MICRONOMEX as MICROREGIAO,'
      'cme.MESONOMEX AS MESOREGIAO,'
      ''
      
        'extract(week from case when a.FATURADO = '#39'1'#39' then a.DTA_EMISSAO ' +
        'else a.dtadoc END) AS SEMANA_MES,'
      'mr.VL_VENDA AS META_MENSAL,'
      'CAST((mr.VL_VENDA * 0.25) AS NUMERIC(15,2)) AS META_SEMANA,'
      'CAST((mr.VL_VENDA * 0.05) AS NUMERIC(15,2)) AS META_DIA,'
      
        'case extract(weekday from case when a.FATURADO = '#39'1'#39' then a.DTA_' +
        'EMISSAO else a.dtadoc END) '
      'when 0 then '#39'DOMINGO'#39
      'when 1 then '#39'SEGUNDA-FEIRA'#39
      'when 2 then '#39'TER'#199'A-FEIRA'#39
      'when 3 then '#39'QUARTA-FEIRA'#39
      'when 4 then '#39'QUINTA-FEIRA'#39
      'when 5 then '#39'SEXTA-FEIRA'#39
      'when 6 then '#39'S'#193'BADO'#39' END AS semana,'
      ''
      ''
      'r.NOM_REPRESENTANTE,'
      
        'case when a.FATURADO = '#39'1'#39' then '#39'FATURADO'#39' else '#39'N'#195'O FATURADO'#39' E' +
        'ND AS SITUACAO, '
      
        'extract(day from case when a.FATURADO = '#39'1'#39' then a.DTA_EMISSAO e' +
        'lse a.dtadoc END) AS dia,'
      
        'case when a.FATURADO = '#39'1'#39' then a.DTA_EMISSAO else a.dtadoc END ' +
        'AS DTA_EMISSAO,'
      'case when a.FATURADO = '#39'1'#39' then'
      
        '  case when extract(MONTH FROM a.DTA_EMISSAO) < 10 then '#39'0'#39'||ext' +
        'ract(MONTH FROM a.DTA_EMISSAO) else extract(MONTH FROM a.DTA_EMI' +
        'SSAO) end||'#39'/'#39'||EXTRACT(YEAR FROM A.DTA_EMISSAO)  '
      'else   '
      
        '  case when extract(MONTH FROM a.dtadoc) < 10 then '#39'0'#39'||extract(' +
        'MONTH FROM a.dtadoc) else extract(MONTH FROM a.dtadoc) end||'#39'/'#39'|' +
        '|EXTRACT(YEAR FROM A.dtadoc)  '
      'end  '
      'as mes_venda,'
      
        'case when a.FATURADO = '#39'1'#39' then extract(YEAR FROM a.DTA_EMISSAO)' +
        ' else extract(YEAR FROM a.dtadoc)  end AS ANO_VENDA,'
      'b.PRECO_CUSTO,'
      
        'case when b.PRECO_CUSTO is null then 0 else ((b.PRECO / COALESCE' +
        '(B.PRECO_CUSTO, P.CUSTO_TOTAL)) - 1) * 100 end as margem_lucro_i' +
        'tem,'
      
        '((b.PRECO_BRUTO - b.PRECO) / b.preco_bruto) * 100 as desconto_it' +
        'em,'
      
        'case when b.PRECO_CUSTO is null then 0 else ((a.TOT_LIQUIDO / (s' +
        'elect sum(COALESCE(v2.PRECO_CUSTO, P.CUSTO_TOTAL) *v2.QTD) from ' +
        'vendas2 v2 where v2.NUMDOC = a.NUMDOC)) - 1) * 100 end as margem' +
        '_lucro_pedido,'
      
        'case when (a.TOT_LIQUIDO is null or a.TOT_LIQUIDO = 0)  then 0 e' +
        'lse ((a.TOT_BRUTO - a.TOT_LIQUIDO) / a.TOT_BRUTO)*100 end AS DES' +
        'CONTO_PEDIDO,  '
      'coalesce(a.PERC_COMISSAO, 0) PERC_COMISSAO,'
      'coalesce(a.VLR_COMISSAO,0) AS VLR_COMISSAO,'
      'R.PERC_COMISSAO_FIXA AS PERC_COMISSAO_ANTIGA,'
      
        'a.TOT_LIQUIDO * (r.PERC_COMISSAO_FIXA/100) as VLR_COMISSAO_ANTIG' +
        'A,'
      ''
      'CASE WHEN A.PERC_COMISSAO IS NULL THEN 0'
      'ELSE A.PERC_COMISSAO - R.PERC_COMISSAO_FIXA '
      'END'
      'AS DIFERENCA_COMISSAO_PERC,'
      ''
      'CASE WHEN A.PERC_COMISSAO IS NULL THEN 0'
      
        'ELSE A.VLR_COMISSAO - (a.TOT_LIQUIDO * (r.PERC_COMISSAO_FIXA/100' +
        ')) END AS DIFERENCA_COMISSAO_VALOR'
      'FROM VENDAS1 a'
      'INNER JOIN VENDAS2 b ON (A.NUMDOC = B.NUMDOC)'
      'INNER JOIN PRODUTO P ON (B.COD_PRODUTO = P.COD_PRODUTO)'
      
        'inner join REPRESENTANTE r on (r.id = a.COD_REPRESENTANTE or r.i' +
        'd = a.COD_SUPERVISOR)'
      
        'left outer join METAS_REPRESENTANTE mr on (mr.ID_REPRESENTANTE =' +
        ' r.id and mr.MES = case when a.FATURADO = '#39'1'#39' then case when ext' +
        'ract(MONTH FROM a.DTA_EMISSAO) < 10 then '#39'0'#39'||extract(MONTH FROM' +
        ' a.DTA_EMISSAO) else extract(MONTH FROM a.DTA_EMISSAO) end||'#39'/'#39'|' +
        '|EXTRACT(YEAR FROM A.DTA_EMISSAO) else case when extract(MONTH F' +
        'ROM a.dtadoc) < 10 then '#39'0'#39'||extract(MONTH FROM a.dtadoc) else e' +
        'xtract(MONTH FROM a.dtadoc) end||'#39'/'#39'||EXTRACT(YEAR FROM A.dtadoc' +
        ') end  )'
      'left outer JOIN CLIENTE cl on (a.COD_CLIENTE = cl.cod_cliente)'
      'inner join cidades cd on (cl.COD_CIDADE = cd.cod_cidade)'
      'inner join cadmicro cmi on (cmi.microcod = cd.microcod)'
      'inner join cadmeso cme on (cme.mesocod = cmi.mesocod)'
      'inner join grupo g on (g.cod_grupo = p.cod_grupo)'
      'where'
      
        ' a.consignacao <> 1 and a.orcamento= 0 and a.cod_fop not in ('#39'7'#39 +
        ', '#39'9'#39') and a.FATURADO in ('#39'0'#39', '#39'1'#39')'
      ''
      'ORDER BY A.DTA_EMISSAO')
    Left = 280
    Top = 200
  end
  object HierCube1: THierCube
    DataSet = q_vendas
    DimensionMap = <
      item
        BaseFieldName = 'MESOREGIAO'
        BaseFieldType = ftString
        DisplayName = 'MESOREGI'#195'O'
        DimSumType = dsDimension
        DimGroup = dgPage
        SortType = dsNameAsc
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'NOM_GRUPO'
        BaseFieldType = ftString
        DisplayName = 'GRUPO'
        DimSumType = dsDimension
        DimGroup = dgPage
        SortType = dsNameAsc
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'MICROREGIAO'
        BaseFieldType = ftString
        DisplayName = 'MICROREGI'#195'O'
        DimSumType = dsDimension
        DimGroup = dgPage
        SortType = dsNameAsc
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'NOM_CIDADE'
        BaseFieldType = ftString
        DisplayName = 'CIDADE'
        DimSumType = dsDimension
        DimGroup = dgPage
        SortType = dsNameAsc
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'UF'
        BaseFieldType = ftString
        DisplayName = 'UF'
        DimSumType = dsDimension
        DimGroup = dgPage
        SortType = dsNameAsc
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'NOM_CLIENTE'
        BaseFieldType = ftString
        DisplayName = 'CLIENTE'
        DimSumType = dsDimension
        DimGroup = dgPage
        SortType = dsNameAsc
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'DIA'
        BaseFieldType = ftSmallint
        DisplayName = 'DIA'
        DimSumType = dsDimension
        DimGroup = dgPage
        SortType = dsNameAsc
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'NOM_PRODUTO'
        BaseFieldType = ftString
        DisplayName = 'PRODUTO'
        DimSumType = dsDimension
        DimGroup = dgPage
        SortType = dsNameAsc
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'NOM_REPRESENTANTE'
        BaseFieldType = ftString
        DisplayName = 'REPRESENTANTE'
        DimSumType = dsDimension
        DimGroup = dgPage
        SortType = dsNameAsc
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'MES_VENDA'
        BaseFieldType = ftString
        DisplayName = 'M'#202'S'
        DimSumType = dsDimension
        DimGroup = dgPage
        SortType = dsNameAsc
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'ANO_VENDA'
        BaseFieldType = ftSmallint
        DisplayName = 'ANO'
        DimSumType = dsDimension
        DimGroup = dgPage
        SortType = dsNameAsc
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'COD_CLIENTE'
        BaseFieldType = ftInteger
        DisplayName = 'C'#211'DIGO CLIENTE'
        DimSumType = dsDimension
        DimGroup = dgPage
        SortType = dsNameAsc
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'SEMANA'
        BaseFieldType = ftString
        DisplayName = 'SEMANA'
        DimSumType = dsDimension
        DimGroup = dgPage
        SortType = dsNameAsc
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'SEMANA_MES'
        BaseFieldType = ftSmallint
        DisplayName = 'SEMANA ANO'
        DimSumType = dsDimension
        DimGroup = dgPage
        SortType = dsNameAsc
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'SITUACAO'
        BaseFieldType = ftString
        DisplayName = 'SITUACAO'
        DimSumType = dsDimension
        DimGroup = dgPage
        SortType = dsNameAsc
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'NUMDOC'
        BaseFieldType = ftInteger
        DisplayName = 'PEDIDO'
        DimSumType = dsDimension
        DimGroup = dgPage
        SortType = dsNameAsc
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'SUB_TOTAL'
        BaseFieldType = ftBCD
        DisplayName = 'VALOR'
        DimSumType = dsSummary
        DefaultFormat = 'R$ #,###,###,##0.00'
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'QTD'
        BaseFieldType = ftBCD
        DisplayName = 'QUANTIDADE'
        DimSumType = dsSummary
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'PRECO_CUSTO'
        BaseFieldType = ftBCD
        DisplayName = 'PRE'#199'O DE CUSTO'
        DimSumType = dsSummary
        DefaultFormat = 'R$ #,###,###,##0.00'
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'MARGEM_LUCRO_ITEM'
        BaseFieldType = ftFloat
        DisplayName = 'MARGEM DE LUCRO DO ITEM'
        DimSumType = dsSummary
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'PERC_COMISSAO'
        BaseFieldType = ftBCD
        DisplayName = '% COMISS'#195'O'
        DimSumType = dsSummary
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'VLR_COMISSAO'
        BaseFieldType = ftBCD
        DisplayName = '$ COMISS'#195'O'
        DimSumType = dsSummary
        DefaultFormat = 'R$ #,###,###,##0.00'
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'PERC_COMISSAO_ANTIGA'
        BaseFieldType = ftBCD
        DisplayName = '% COMISS'#195'O ANTIGA'
        DimSumType = dsSummary
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'DIFERENCA_COMISSAO_VALOR'
        BaseFieldType = ftBCD
        DisplayName = 'DIFERENCA DE $ COMISS'#195'O'
        DimSumType = dsSummary
        DefaultFormat = 'R$ #,###,###,##0.00'
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'DIFERENCA_COMISSAO_PERC'
        BaseFieldType = ftBCD
        DisplayName = 'DIFERENCA DE % COMISS'#195'O '
        DimSumType = dsSummary
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'DESCONTO_ITEM'
        BaseFieldType = ftFloat
        DisplayName = 'DESCONTO DO ITEM'
        DimSumType = dsSummary
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'PRECO'
        BaseFieldType = ftBCD
        DisplayName = 'PRE'#199'O'
        DimSumType = dsSummary
        DefaultFormat = 'R$ #,###,###,##0.00'
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'MARGEM_LUCRO_PEDIDO'
        BaseFieldType = ftFloat
        DisplayName = 'MARGEM LUCRO DO PEDIDO'
        DimSumType = dsSummary
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'META_MENSAL'
        BaseFieldType = ftBCD
        DisplayName = 'META MENSAL'
        DimSumType = dsSummary
        DefaultFormat = 'R$ #,###,###,##0.00'
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'META_SEMANA'
        BaseFieldType = ftBCD
        DisplayName = 'META SEMANAL'
        DimSumType = dsSummary
        DefaultFormat = 'R$ #,###,###,##0.00'
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'META_DIA'
        BaseFieldType = ftBCD
        DisplayName = 'META DI'#193'RIA'
        DimSumType = dsSummary
        DefaultFormat = 'R$ #,###,###,##0.00'
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'DESCONTO_PEDIDO'
        BaseFieldType = ftBCD
        DisplayName = 'DESCONTO NO PEDIDO'
        DimSumType = dsSummary
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'DTA_EMISSAO'
        BaseFieldType = ftDate
        DisplayName = 'DTA_EMISSAO'
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'COD_PRODUTO'
        BaseFieldType = ftInteger
        DisplayName = 'COD_PRODUTO'
        CaseSensitiveKeys = False
      end
      item
        BaseFieldName = 'VLR_COMISSAO_ANTIGA'
        BaseFieldType = ftBCD
        DisplayName = 'VLR_COMISSAO_ANTIGA'
        CaseSensitiveKeys = False
      end>
    Options.Editable = True
    Left = 216
    Top = 112
  end
  object Excel: THierCubeGridExportToXLS
    Units = muMM
    Page.Height = 297.000000000000000000
    Page.Width = 210.000000000000000000
    Grid = HierCubeGrid1
    ExportOptions.DecimalSeparator = ','
    Left = 460
    Top = 128
  end
  object hpPrint: THierCubeGridPrint
    Units = muMM
    Page.Height = 297.000000000000000000
    Page.Width = 210.000000000000000000
    Grid = HierCubeGrid1
    ExportOptions.DecimalSeparator = ','
    AutoSize = True
    ShowDialog = True
    Left = 324
    Top = 96
  end
  object PDF: THierCubeGridExportToPDF
    Units = muMM
    Page.Height = 297.000000000000000000
    Page.Width = 210.000000000000000000
    Grid = HierCubeGrid1
    ExportOptions.DecimalSeparator = ','
    Left = 380
    Top = 104
  end
  object MainMenu1: TMainMenu
    Left = 184
    Top = 8
    object Imprimir1: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FF99FFFF99FF
        FF99FFFF99FFFF99FFFF99FF000000000000000000FF99FFFF99FFFF99FFFF99
        FFFF99FFFF99FFFF99FFFF99FFFF99FFFF99FFFF99FF000000000000C0C0C080
        8080808080000000000000FF99FFFF99FFFF99FFFF99FFFF99FFFF99FFFF99FF
        000000000000B0B0B0C0C0C07070700000000000008080807070700000000000
        00FF99FFFF99FFFF99FFFF99FF000000C0C0C0C0C0C0707070707070CFCFCFA0
        A0A0A0A0A0000000000000808080707070000000000000FF99FFFF99FF808080
        707070707070CFCFCFCFCFCFC0C0C0A0A0A0A0A0A09090908080800000000000
        00707070000000FF99FF808080707070CFCFCFCFCFCFCFCFCFC0C0C0C0C0C0A0
        A0A0A0A0A0909090909090808080808080000000000000FF99FF808080FFFFFF
        CFCFCFCFCFCFC0C0C0C0C0C0FFFFFFA0A0A0A0A0A09090908080808080807070
        70808080707070000000808080FFFFFFC0C0C0C0C0C0FFFFFFFFFFFFCFCFCFCF
        CFCFCFCFCF909090909090808080808080707070707070000000808080FFFFFF
        FFFFFFFFFFFFCFCFCFCFCFCF0000FF3000CFCFCFCFCFCFCFC0C0C08080808080
        80808080707070000000808080FFFFFFDFDFDFDFDFDF00FF00009F60CFCFCFCF
        CFCFCFCFCF707070808080000000C0C0C0707070707070000000FF99FF808080
        808080FFFFFFDFDFDFCFCFCFCFCFCF808080707070C0C0C0C0C0C0000000C0C0
        C0707070707070FF99FFFF99FFFF99FFFF99FF808080808080FFFFFF707070C0
        C0C0C0C0C0DFDFDFDFDFDFDFDFDF000000FF99FFFF99FFFF99FFFF99FFFF99FF
        FF99FFFF99FFFF99FF808080808080CFCFCFDFDFDFF0F0F0F0F0F0F0F0F0DFDF
        DF000000FF99FFFF99FFFF99FFFF99FFFF99FFFF99FFFF99FFFF99FFFF99FF80
        8080DFDFDFF0F0F0F0F0F0FFFFFFFFFFFFDFDFDF000000000000FF99FFFF99FF
        FF99FFFF99FFFF99FFFF99FFFF99FFFF99FF808080F0F0F0F0F0F0FFFFFF8080
        80808080FF99FFFF99FFFF99FFFF99FFFF99FFFF99FFFF99FFFF99FFFF99FFFF
        99FFFF99FF808080808080808080FF99FFFF99FFFF99FFFF99FF}
      Caption = 'Imprimir'
      SubMenuImages = ImageList1
      ImageIndex = 0
      object Grade1: TMenuItem
        Caption = 'Grade'
        OnClick = Grade1Click
      end
      object Grfico1: TMenuItem
        Caption = 'Gr'#225'fico'
        OnClick = Grfico1Click
      end
    end
    object GerarPDF1: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000F1ECFF6D6885
        767093747486707C6A78876C6E78726B71787C7C8C696E6F808E72798967848B
        7C757876696A6E86868CEFEFFD7B798DE8E2FF706D86ECF2F1E8EFEAF4F8FFF6
        F8FFF2F4FFF9FFFDE6F4D8F3FFE5F3F6F4EBEBF1FDFFFF646765FDFFF975797A
        DFDCF29F98B9837E9EC7C1E4E0D9FFEAE6FFEEF4FBE3F0E2FAFFEEF7FFF2F2F0
        FFD0CDE3EBEEEC7C8473FFFFF0666B62F6F0FFFBF2FFA9A0CB8C81B3D1C6FEDD
        D4FFE5E3FFF6F8FFD8D9E7BBB9CFA498C8776D98EAE9F37E827CF0F8DA7A7D74
        ECE4FFECE2FFEAE4FF6F698C6B6491CDC0FEAD9BEE715CB9725CB5735CB16D56
        A87F6EAEFBF0FF736D86FAFFEA989A94E1D9F0EEE7FFF8F5FFE2E0FE665F8CEC
        DFFFAB95F48167D2C8B1FFC4AEFFD3C1FFE5D7FFE6DCFF837C97FEFCFB787878
        FDFBFFE9E9F5E8E8FAE8E5FF6D679E665C9E605599D9D2FFEDEAFFE3E2FCFAF9
        FFF9F9FFFDFFFF767977F8F5FE76777BFDFFFBF2F9F4EAEFF8F4F7FFC5C1F562
        5E99D4D4FFEAEDFFF0F8FFE6F0F0E9F1F0F4F9F7EBEFEA7E827CFBFBFF797E81
        E3EDE0E1F1E0F3FFFFE2ECFDDBE1FF676D98E9EFFFC9D1EEF3FAFFD4DCE9F4F8
        FFF9F9FFEBE8F88C8697E0D9FF6B698D82889B798492727D9164718B5B688861
        6D91565D88878CB96768946A699076768EFBF9FFF6F2FF746E81856EDA5845AC
        5E50B0726BC04C4C92646EA45A6A8E5C6C91666BAA5350A0675DB76F64AD6965
        88EFEFFBF7F6FA706E6E4632A9DAC9FF5C4FBD544DB55C5BBBC4CBFFD6E7FFCA
        DCFF6169ACCECBFF6356BC6C5EB677729FFBFAFFFDFCFE7E7E787777C5C7CBFF
        D1DCFFD7E2FF4046A5CCD3FF5562B0C3D4FF55649CD3DDFFE1DAFF685CAE685F
        97E9E3FFF5F0F97B77765962A5C5D3FF60769FCAE1FF535FB7BDC6FF4B58B4BD
        CBFF5867ACC4CBFF4D47A07266B87872A39591AA6B676D8682814B52A7D2E0FF
        B8CFFFCDE9FF3D519EB5C4FFB3C1FFBCC5FF5556C8CBC5FFD3C6FF6559B17270
        8EDEE0E0FFFFFCFFFEF9535AB74D5AA8445C905977A6495FA6475BB05363C448
        50C1534FD74E42D05543C66B5FB9EDEEFFFDFFF7FFFFF7F9F6EE}
      Caption = 'Gerar PDF'
      OnClick = GerarPDF1Click
    end
    object GerarExcel1: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E0000000000000000000029784F216F46
        367E5A2164442E684B3C7156406F592D5B45305E47306348235B3E0143201E67
        3F005124085D300058273C7C5852906C68A1805B8F7172A2866189705980677E
        A28C60846C5D846A5C8A6D568B6A45825C408259478E63014A1C597D5F80A284
        DDFBDEEBFFEAE3F9E0DDF0D7E2F2DAD5E3CBD8E8D0D9ECD3E3FADED7F3D5B6D7
        B5CFF5D14B765129562F637C62789177DBF2D6E6FCE0CDE0C5E0F2D5F8FFEDDF
        EFD0DAECCDE3F8D8D4EBCBCCE4C4E5FFE1CCEBCA6B8C6A2D502E54765E8FB49A
        E2FFEADEFFE6DBFFE0CBF4CFC8F1CBCAF4CB87B1883A643B25512A25522B2753
        2FC2F0CC4F7B5C2652335A7F6B97BEA8C4EDD26F9B7C2E5F39255A2F30673A22
        5A29296130679F6E477E5163996E31663FB1E4C2619174326245597B6A93B7A1
        E3FFF1B6E3C26B9F775990635E99663B794387C58F6EAC765A956320572A79AE
        87C5F7D56593762752377191808BAE9AC9F0D6DCFFE8CAFED667A171417F4974
        B57D55975C44854D225D2A6EA576649771C2F1D0628D722A523977978686A995
        E4FFF1D7FFE1C8FAD242794A90CC9664A36B4E905544854D124D1AC0F7C8C4F7
        D1C9F8D76D987D365E45729281A8CCB6D2F9DFCFFAD94F7E5798CDA17AB38068
        A46E4B87515B9761478250235A2DC8FBD5C4F3D26B977A234E3384A793A2C8B2
        D5FCE27AA384BAE6C191C1977DB0844F865550875669A06F679C702F64393768
        42B7E6C55D8B6E507E617E9E86A0C0A7E0FFE679987B6E8E6F75967361835EE1
        FFDED4F9D160885F648B6567906A557D5ADCFFE1749D7E2E573896AB92BCD1B8
        F3FFEBF2FFE8EFFCE2E5F1D5FDFFEDE4F0D2FDFFEBC8D7B8EBFBDCD8EDCDE1F8
        D8E0F8D8839E7D516E4D94B295B4D0B3EBFFE8F4FFEEDDEDD5FBFFF0F2FCE5F2
        FAE3E6F0D9F6FFEBF5FFEBE5FBDEE4FFDEDCFCD982A6824C734D73AD8AA4DCB9
        95CAA99ECCAFA9D2B792B49C97B79FB0CCB88EAB948DAD9499BFA3739F8072A6
        816CA88061A17725683B71BA926BB28A72B4915F9B7C6FA2867BAA90648D785E
        85706289735781684B7C6047805F35764F3A82572E7D512B7C4D}
      Caption = 'Gerar Excel'
      OnClick = GerarExcel1Click
    end
  end
  object ImageList1: TImageList
    Left = 102
    Top = 90
    Bitmap = {
      494C010103000400100010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000216F4600367E5A002164
      44002E684B003C715600406F59002D5B4500305E470030634800235B3E000143
      20001E673F0000512400085D300000582700000000006D688500767093007474
      8600707C6A0078876C006E7872006B7178007C7C8C00696E6F00808E72007989
      6700848B7C0075787600696A6E0086868C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00000000003C7C580052906C0068A180005B8F
      710072A2860061897000598067007EA28C0060846C005D846A005C8A6D00568B
      6A0045825C0040825900478E6300014A1C00EFEFFD007B798D00E8E2FF00706D
      8600ECF2F100E8EFEA00F4F8FF00F6F8FF00F2F4FF00F9FFFD00E6F4D800F3FF
      E500F3F6F400EBEBF100FDFFFF00646765000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF0000000000597D5F0080A28400DDFBDE00EBFF
      EA00E3F9E000DDF0D700E2F2DA00D5E3CB00D8E8D000D9ECD300E3FADE00D7F3
      D500B6D7B500CFF5D1004B76510029562F00FDFFF90075797A00DFDCF2009F98
      B900837E9E00C7C1E400E0D9FF00EAE6FF00EEF4FB00E3F0E200FAFFEE00F7FF
      F200F2F0FF00D0CDE300EBEEEC007C8473000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000637C620078917700DBF2D600E6FC
      E000CDE0C500E0F2D500F8FFED00DFEFD000DAECCD00E3F8D800D4EBCB00CCE4
      C400E5FFE100CCEBCA006B8C6A002D502E00FFFFF000666B6200F6F0FF00FBF2
      FF00A9A0CB008C81B300D1C6FE00DDD4FF00E5E3FF00F6F8FF00D8D9E700BBB9
      CF00A498C800776D9800EAE9F3007E827C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF000000000054765E008FB49A00E2FFEA00DEFF
      E600DBFFE000CBF4CF00C8F1CB00CAF4CB0087B188003A643B0025512A002552
      2B0027532F00C2F0CC004F7B5C0026523300F0F8DA007A7D7400ECE4FF00ECE2
      FF00EAE4FF006F698C006B649100CDC0FE00AD9BEE00715CB900725CB500735C
      B1006D56A8007F6EAE00FBF0FF00736D86000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BFBFBF00FFFFFF00BFBF
      BF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBF
      BF00FFFFFF000000FF00FFFFFF00000000005A7F6B0097BEA800C4EDD2006F9B
      7C002E5F3900255A2F0030673A00225A290029613000679F6E00477E51006399
      6E0031663F00B1E4C2006191740032624500FAFFEA00989A9400E1D9F000EEE7
      FF00F8F5FF00E2E0FE00665F8C00ECDFFF00AB95F4008167D200C8B1FF00C4AE
      FF00D3C1FF00E5D7FF00E6DCFF00837C97000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF0000000000597B6A0093B7A100E3FFF100B6E3
      C2006B9F7700599063005E9966003B79430087C58F006EAC76005A9563002057
      2A0079AE8700C5F7D5006593760027523700FEFCFB0078787800FDFBFF00E9E9
      F500E8E8FA00E8E5FF006D679E00665C9E0060559900D9D2FF00EDEAFF00E3E2
      FC00FAF9FF00F9F9FF00FDFFFF00767977000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000719180008BAE9A00C9F0D600DCFF
      E800CAFED60067A17100417F490074B57D0055975C0044854D00225D2A006EA5
      760064977100C2F1D000628D72002A523900F8F5FE0076777B00FDFFFB00F2F9
      F400EAEFF800F4F7FF00C5C1F500625E9900D4D4FF00EAEDFF00F0F8FF00E6F0
      F000E9F1F000F4F9F700EBEFEA007E827C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000007797860086A99500E4FFF100D7FF
      E100C8FAD20042794A0090CC960064A36B004E90550044854D00124D1A00C0F7
      C800C4F7D100C9F8D7006D987D00365E4500FBFBFF00797E8100E3EDE000E1F1
      E000F3FFFF00E2ECFD00DBE1FF00676D9800E9EFFF00C9D1EE00F3FAFF00D4DC
      E900F4F8FF00F9F9FF00EBE8F8008C8697000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000000000000000000000000000FFFFFF0000000000FFFF
      FF000000000000000000000000000000000072928100A8CCB600D2F9DF00CFFA
      D9004F7E570098CDA1007AB3800068A46E004B8751005B97610047825000235A
      2D00C8FBD500C4F3D2006B977A00234E3300E0D9FF006B698D0082889B007984
      9200727D910064718B005B688800616D9100565D8800878CB900676894006A69
      900076768E00FBF9FF00F6F2FF00746E81000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000084A79300A2C8B200D5FCE2007AA3
      8400BAE6C10091C197007DB084004F8655005087560069A06F00679C70002F64
      390037684200B7E6C5005D8B6E00507E6100856EDA005845AC005E50B000726B
      C0004C4C9200646EA4005A6A8E005C6C9100666BAA005350A000675DB7006F64
      AD0069658800EFEFFB00F7F6FA00706E6E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000007E9E8600A0C0A700E0FFE6007998
      7B006E8E6F007596730061835E00E1FFDE00D4F9D10060885F00648B65006790
      6A00557D5A00DCFFE100749D7E002E5738004632A900DAC9FF005C4FBD00544D
      B5005C5BBB00C4CBFF00D6E7FF00CADCFF006169AC00CECBFF006356BC006C5E
      B60077729F00FBFAFF00FDFCFE007E7E78000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      00000000000000000000000000000000000096AB9200BCD1B800F3FFEB00F2FF
      E800EFFCE200E5F1D500FDFFED00E4F0D200FDFFEB00C8D7B800EBFBDC00D8ED
      CD00E1F8D800E0F8D800839E7D00516E4D007777C500C7CBFF00D1DCFF00D7E2
      FF004046A500CCD3FF005562B000C3D4FF0055649C00D3DDFF00E1DAFF00685C
      AE00685F9700E9E3FF00F5F0F9007B7776000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00FFFFFF0000000000FFFFFF00000000000000
      00000000000000000000000000000000000094B29500B4D0B300EBFFE800F4FF
      EE00DDEDD500FBFFF000F2FCE500F2FAE300E6F0D900F6FFEB00F5FFEB00E5FB
      DE00E4FFDE00DCFCD90082A682004C734D005962A500C5D3FF0060769F00CAE1
      FF00535FB700BDC6FF004B58B400BDCBFF005867AC00C4CBFF004D47A0007266
      B8007872A3009591AA006B676D00868281000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000073AD8A00A4DCB90095CAA9009ECC
      AF00A9D2B70092B49C0097B79F00B0CCB8008EAB94008DAD940099BFA300739F
      800072A681006CA8800061A1770025683B004B52A700D2E0FF00B8CFFF00CDE9
      FF003D519E00B5C4FF00B3C1FF00BCC5FF005556C800CBC5FF00D3C6FF006559
      B10072708E00DEE0E000FFFFFC00FFFEF9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000071BA92006BB28A0072B491005F9B
      7C006FA286007BAA9000648D78005E85700062897300578168004B7C60004780
      5F0035764F003A8257002E7D51002B7C4D00535AB7004D5AA800445C90005977
      A600495FA600475BB0005363C4004850C100534FD7004E42D0005543C6006B5F
      B900EDEEFF00FDFFF700FFFFF700F9F6EE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0080018000800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000E007000000000000E007000000000000
      E007000000000000E007000000000000E00F000000000000E01F000000000000
      E03F000000000000E07F00000000000000000000000000000000000000000000
      000000000000}
  end
  object odOLAP: TSaveDialog
    Left = 204
    Top = 176
  end
end
