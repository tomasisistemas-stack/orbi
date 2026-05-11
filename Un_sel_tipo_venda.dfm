object Fr_sel_tipo_venda: TFr_sel_tipo_venda
  Left = 864
  Top = 495
  Width = 113
  Height = 82
  Color = clGrayText
  BorderIcons = [biSystemMenu]
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
  object Label1: TsLabel
    Left = 20
    Top = 34
    Width = 77
    Height = 13
    Caption = 'Confirma S/N'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
  end
  object ZZtipovenda: TsEdit
    Left = 32
    Top = 8
    Width = 41
    Height = 24
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 1
    ParentFont = False
    TabOrder = 0
    OnKeyPress = ZZtipovendaKeyPress
  end
end
