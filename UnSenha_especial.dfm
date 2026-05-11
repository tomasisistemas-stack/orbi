object Fr_senha_especial: TFr_senha_especial
  Left = 533
  Top = 221
  BorderIcons = [biSystemMenu]
  Caption = 'Senha'
  ClientHeight = 129
  ClientWidth = 132
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TsLabel
    Left = 9
    Top = 3
    Width = 39
    Height = 13
    Caption = 'Usu'#225'rio:'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object Label2: TsLabel
    Left = 8
    Top = 43
    Width = 34
    Height = 13
    Caption = 'Senha:'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object EDusuario: TMaskEdit
    Left = 2
    Top = 16
    Width = 121
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
    Text = ''
    OnKeyPress = EDsenhaKeyPress
  end
  object EDsenha: TMaskEdit
    Left = 2
    Top = 56
    Width = 121
    Height = 21
    CharCase = ecUpperCase
    PasswordChar = '*'
    TabOrder = 1
    Text = ''
    OnKeyPress = EDsenhaKeyPress
  end
  object btok: TsBitBtn
    Left = 25
    Top = 82
    Width = 75
    Height = 25
    Caption = '&OK'
    TabOrder = 2
    OnClick = btokClick
    SkinData.SkinSection = 'BUTTON'
  end
end
