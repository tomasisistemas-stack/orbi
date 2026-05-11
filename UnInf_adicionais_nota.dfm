object FrInf_adicionais_nota: TFrInf_adicionais_nota
  Left = 349
  Top = 259
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Informa'#231#245'es adicionais Nota Fiscal'
  ClientHeight = 136
  ClientWidth = 293
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DEinfadi1: TIB_Edit
    Left = 8
    Top = 8
    Width = 272
    Height = 21
    DataField = 'TBVE1.INF_ADICIONAL1'
    TabOrder = 0
    OnKeyPress = DEinfadi1KeyPress
  end
  object deinfadi2: TIB_Edit
    Left = 8
    Top = 32
    Width = 272
    Height = 21
    DataField = 'TBVE1.INF_ADICIONAL2'
    TabOrder = 1
    OnKeyPress = DEinfadi1KeyPress
  end
  object deinfadi3: TIB_Edit
    Left = 8
    Top = 56
    Width = 272
    Height = 21
    DataField = 'TBVE1.INF_ADICIONAL3'
    TabOrder = 2
    OnKeyPress = DEinfadi1KeyPress
  end
  object btok: TsBitBtn
    Left = 104
    Top = 88
    Width = 83
    Height = 33
    Caption = '&Ok'
    TabOrder = 3
    OnClick = btokClick
  end
end
