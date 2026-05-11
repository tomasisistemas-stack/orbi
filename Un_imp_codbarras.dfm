object Fr_eti_codbarras: TFr_eti_codbarras
  Left = 378
  Top = 307
  BorderIcons = [biSystemMenu]
  Caption = 'Etiquetas de C'#243'digo de Barras'
  ClientHeight = 187
  ClientWidth = 482
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  PrintScale = poNone
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TsPanel
    Left = 0
    Top = 2
    Width = 481
    Height = 183
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object Label15: TsLabel
      Left = 9
      Top = 12
      Width = 40
      Height = 13
      Caption = 'Produto:'
    end
    object Label20: TsLabel
      Left = 10
      Top = 51
      Width = 19
      Height = 13
      Caption = 'Cor:'
    end
    object Label22: TsLabel
      Left = 10
      Top = 93
      Width = 48
      Height = 13
      Caption = 'Tamanho:'
    end
    object Label1: TsLabel
      Left = 388
      Top = 95
      Width = 62
      Height = 13
      Caption = 'Qtd Etiqueta:'
    end
    object Label2: TsLabel
      Left = 10
      Top = 134
      Width = 58
      Height = 13
      Caption = 'Numera'#231#227'o:'
    end
    object BitBtn1: TsBitBtn
      Left = 384
      Top = 136
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 5
      OnClick = BitBtn1Click
      SkinData.SkinSection = 'BUTTON'
    end
    object EDQTD: TsEdit
      Left = 389
      Top = 109
      Width = 58
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object Cbcor: TComboBox
      Left = 7
      Top = 64
      Width = 155
      Height = 21
      Style = csDropDownList
      TabOrder = 1
    end
    object Cbtamanho: TComboBox
      Left = 7
      Top = 106
      Width = 98
      Height = 21
      Style = csDropDownList
      TabOrder = 2
    end
    object Cbnumeracao: TComboBox
      Left = 7
      Top = 147
      Width = 98
      Height = 21
      Style = csDropDownList
      TabOrder = 3
    end
    object CbMercadoria: TComboBox
      Left = 7
      Top = 26
      Width = 394
      Height = 21
      Style = csDropDownList
      TabOrder = 0
    end
  end
end
