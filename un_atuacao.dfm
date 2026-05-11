object fr_atuacao: Tfr_atuacao
  Left = 268
  Top = 199
  Width = 870
  Height = 480
  Caption = 'Mapa de Atua'#231#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object SVOGISImage1: TSVOGISImage
    Left = 140
    Top = 34
    Width = 722
    Height = 419
    Cursor = crCross
    ArrowSize = 15
    BlinkCount = 3
    BlinkRate = 150
    BlinkSelection = True
    BlinkThenPersist = False
    BorderStyle = bsSingle
    Color = clWindow
    EdgeBuffer = 5
    Flat = False
    DisplayPercent = 0
    IDSelectedOnly = False
    ImageStretchMethod = stHermite
    Legend = SVOLegend
    Mode = moDefault
    ModeCursorOff = False
    PickNodeRadius = 2
    ProjectionActive = False
    ProjectionFrom = projLatLon
    ProjectionFromParams.Eccentricity = 0.081819190842621270
    ProjectionFromParams.Ellipsoid = 'WGS 84'
    ProjectionFromParams.EquatorFixed = False
    ProjectionFromParams.Flattening = 0.003352810664747463
    ProjectionFromParams.Hemisphere = hsEasting
    ProjectionFromParams.MajorAxis = 6378137.000000000000000000
    ProjectionFromParams.MinorAxis = 6356752.314245180000000000
    ProjectionFromParams.Pole = poNorthing
    ProjectionFromParams.ReraiseException = False
    ProjectionFromParams.UTMZone = 1
    ProjectionFromParams.UTMZoneFixed = False
    ProjectionFromParams.ScaleFactor = 0.999600000000000000
    ProjectionFromParams.LatLongStorage = stDecimalDeg
    ProjectionFromParams.Units = 'Meter'
    ProjectionFromParams.UnitDivisor = 1.000000000000000000
    ProjectionFromParams.UTMZoneWidth = 6
    ProjectionTo = projLatLon
    ProjectionToParams.Eccentricity = 0.081819190842621270
    ProjectionToParams.Ellipsoid = 'WGS 84'
    ProjectionToParams.EquatorFixed = False
    ProjectionToParams.Flattening = 0.003352810664747463
    ProjectionToParams.Hemisphere = hsEasting
    ProjectionToParams.MajorAxis = 6378137.000000000000000000
    ProjectionToParams.MinorAxis = 6356752.314245180000000000
    ProjectionToParams.Pole = poNorthing
    ProjectionToParams.ReraiseException = False
    ProjectionToParams.UTMZone = 1
    ProjectionToParams.UTMZoneFixed = False
    ProjectionToParams.ScaleFactor = 0.999600000000000000
    ProjectionToParams.LatLongStorage = stDecimalDeg
    ProjectionToParams.Units = 'Meter'
    ProjectionToParams.UnitDivisor = 1.000000000000000000
    ProjectionToParams.UTMZoneWidth = 6
    Scrollable = True
    ScrollAllwaysVisible = False
    ScrollPercent = 25
    ShowCrossHairs = False
    UndoLimit = 20
    Align = alClient
    TabOrder = 0
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 862
    Height = 34
    AutoSize = True
    ButtonHeight = 32
    ButtonWidth = 31
    Caption = 'ToolBar1'
    Flat = True
    Indent = 7
    TabOrder = 1
    object ToolButtonExit: TToolButton
      Left = 7
      Top = 0
      Hint = 'Close'
      Caption = 'ToolButtonClose'
      ImageIndex = 8
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton13: TToolButton
      Left = 38
      Top = 0
      Width = 15
      Caption = 'ToolButton13'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object ToolButtonOpenGIS: TToolButton
      Left = 53
      Top = 0
      Hint = 'Open Vector File'
      Caption = 'ToolButtonOpenGIS'
      ImageIndex = 18
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButtonCloseGIS: TToolButton
      Left = 84
      Top = 0
      Hint = 'Close Selected File'
      Caption = 'ToolButtonCloseGIS'
      ImageIndex = 11
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButtonGrid: TToolButton
      Left = 115
      Top = 0
      Hint = 'Show Data'
      Caption = 'ToolButtonGrid'
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton11: TToolButton
      Left = 146
      Top = 0
      Width = 15
      Caption = 'ToolButton11'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object ToolButtonDefault: TToolButton
      Left = 161
      Top = 0
      Hint = 'Default Pointer'
      Caption = 'ToolButtonDefault'
      Grouped = True
      ImageIndex = 12
      ParentShowHint = False
      ShowHint = True
      Style = tbsCheck
    end
    object ToolButtonShapeInfo: TToolButton
      Left = 192
      Top = 0
      Hint = 'Get Shape Info'
      Caption = 'ToolButtonShapeInfo'
      Grouped = True
      ImageIndex = 5
      ParentShowHint = False
      ShowHint = True
      Style = tbsCheck
    end
    object ToolButtonGrab: TToolButton
      Left = 223
      Top = 0
      Hint = 'Move'
      Grouped = True
      ImageIndex = 6
      ParentShowHint = False
      ShowHint = True
      Style = tbsCheck
    end
    object ToolButtonZoomIn: TToolButton
      Left = 254
      Top = 0
      Hint = 'Zoom In'
      Caption = 'ToolButtonZoomIn'
      Grouped = True
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      Style = tbsCheck
    end
    object ToolButtonZoomOut: TToolButton
      Left = 285
      Top = 0
      Hint = 'Zoom Out'
      Caption = 'ToolButtonZoomOut'
      Grouped = True
      ImageIndex = 13
      ParentShowHint = False
      ShowHint = True
      Style = tbsCheck
    end
    object ToolButtonFullExtent: TToolButton
      Left = 316
      Top = 0
      Hint = 'Cancel Zoom'
      Caption = 'ToolButtonFullExtent'
      ImageIndex = 7
      ParentShowHint = False
      ShowHint = True
    end
  end
  object SVOLegend: TSVOLegend
    Left = 0
    Top = 34
    Width = 140
    Height = 419
    Align = alLeft
    AutoSizePanels = True
    Beveled = True
    CheckMarks = True
    CheckMark = cmBlack
    DefaultActions = True
    DefaultMarkStyle = stPolygon
    DefaultWindows = True
    ItemHeight = 45
    MarkLocation = mlBelow
    MarkWidth = 30
    Margin = 5
    Options = [stPoint, stMultipoint, stLine, stPolygon, stImage]
    SelectedColor = clBtnFace
    SubItemIndent = 10
    TabOrder = 2
    TabStop = True
  end
end
