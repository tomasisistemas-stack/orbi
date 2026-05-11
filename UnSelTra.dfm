object FRSELTRA: TFRSELTRA
  Left = 237
  Top = 103
  Width = 444
  Height = 240
  Caption = 'Seleciona Transportadora'
  Color = clBtnFace
  BorderIcons = [biSystemMenu]
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object IB_Grid1: TIB_Grid
    Left = 0
    Top = 0
    Width = 436
    Height = 213
    CustomGlyphsSupplied = []
    DataSource = DMCAD.DSSELTRA
    Align = alClient
    TabOrder = 0
    OnKeyPress = IB_Grid1KeyPress
    CurrentRowColor = clMoneyGreen
  end
end
