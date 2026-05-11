object Fr_amplia_foto: TFr_amplia_foto
  Left = 458
  Top = 137
  Width = 508
  Height = 508
  Caption = 'Foto Ampliada'
  Color = clBtnFace
  BorderIcons = [biSystemMenu]
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object foto2: TImage
    Left = 0
    Top = 0
    Width = 497
    Height = 457
    Stretch = True
    Transparent = True
    OnDblClick = foto2DblClick
  end
  object Label15: TsLabel
    Left = 1
    Top = 459
    Width = 194
    Height = 13
    Caption = 'Clique 2x na Imagem para Fechar.'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
  end
end
