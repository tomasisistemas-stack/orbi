object FRSELFOR: TFRSELFOR
  Left = 214
  Top = 218
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Localizar Fornecedor'
  ClientHeight = 220
  ClientWidth = 469
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object IB_Grid1: TIB_Grid
    Left = 0
    Top = 0
    Width = 469
    Height = 220
    CustomGlyphsSupplied = []
    Align = alClient
    ReadOnly = True
    TabOrder = 0
    OnKeyPress = IB_Grid1KeyPress
    CurrentRowColor = clMoneyGreen
    TitleAlignment = gtaCenter
  end
end
