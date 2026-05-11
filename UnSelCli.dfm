object FRSELCLI: TFRSELCLI
  Left = 151
  Top = 85
  Width = 682
  Height = 256
  Caption = 'Seleciona Cliente'
  Color = clBtnFace
  BorderIcons = [biSystemMenu]  
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object IB_Grid1: TIB_Grid
    Left = 0
    Top = 0
    Width = 674
    Height = 229
    CustomGlyphsSupplied = []
    DataSource = DMCAD.DSSELCLI
    Align = alClient
    ReadOnly = True
    TabOrder = 0
    OnKeyPress = IB_Grid1KeyPress
    CurrentRowColor = clMoneyGreen
  end
end
