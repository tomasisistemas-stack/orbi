object Fr_Cod_Fiscal: TFr_Cod_Fiscal
  Left = 193
  Top = 108
  Width = 653
  Height = 355
  Caption = 'Cadastro de C'#243'digo Fiscal'
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
  object GroupBox1: TsGroupBox
    Left = 8
    Top = 8
    Width = 633
    Height = 265
    Caption = 'C'#243'digo Fiscal'
    TabOrder = 0
    object Label1: tsLabel
      Left = 8
      Top = 25
      Width = 63
      Height = 13
      Caption = 'C'#243'digo Fiscal'
    end
    object Label2: tsLabel
      Left = 8
      Top = 69
      Width = 28
      Height = 13
      Caption = 'Nome'
    end
    object Label3: tsLabel
      Left = 8
      Top = 108
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label4: tsLabel
      Left = 9
      Top = 217
      Width = 21
      Height = 13
      Caption = 'Tipo'
    end
    object PrCod_Fiscal: TMaskEdit
      Left = 8
      Top = 41
      Width = 49
      Height = 21
      MaxLength = 6
      TabOrder = 0
      OnKeyPress = PrCod_FiscalKeyPress
    end
    object PrNome: TsEdit
      Left = 8
      Top = 82
      Width = 617
      Height = 21
      MaxLength = 250
      TabOrder = 1
      OnKeyPress = PrCod_FiscalKeyPress
    end
    object PrDescricao: TRichEdit
      Left = 8
      Top = 123
      Width = 615
      Height = 89
      Lines.Strings = (
        'PrDescricao')
      TabOrder = 2
      OnKeyPress = PrCod_FiscalKeyPress
    end
    object PrTipo: TComboBox
      Left = 8
      Top = 232
      Width = 105
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      OnKeyPress = PrCod_FiscalKeyPress
    end
  end
end
