object FrSel_Venda: TFrSel_Venda
  Left = 487
  Top = 293
  Width = 128
  Height = 105
  Caption = 'Confirma Venda'
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
  object Label1: tsLabel
    Left = 5
    Top = 13
    Width = 108
    Height = 13
    Caption = 'Confirma a Venda?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: tsLabel
    Left = 44
    Top = 61
    Width = 24
    Height = 13
    Caption = 'S/N'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object zztipo_venda: TsEdit
    Left = 40
    Top = 32
    Width = 33
    Height = 24
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnKeyPress = zztipo_vendaKeyPress
  end
end
