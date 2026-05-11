object Frimportacao_dados: TFrimportacao_dados
  Left = 286
  Top = 210
  BorderIcons = [biSystemMenu]
  Caption = 'Importa'#231#227'o de Dados'
  ClientHeight = 328
  ClientWidth = 611
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TsGroupBox
    Left = 360
    Top = 0
    Width = 217
    Height = 146
    Caption = 'Legenda'
    TabOrder = 0
    SkinData.SkinSection = 'GROUPBOX'
    object Label1: TsLabel
      Left = 8
      Top = 32
      Width = 117
      Height = 91
      Caption = 
        '001 - Cliente'#13#10'002 - Produto'#13#10'003 - Cod_Barras'#13#10'004 - Grupo'#13#10'005' +
        ' - Fornecedor'#13#10'006 - Representante'#13#10'  '
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
  end
  object Button1: TButton
    Left = 8
    Top = 0
    Width = 281
    Height = 41
    Caption = 'Pegar Arquivo'
    TabOrder = 1
    OnClick = Button1Click
  end
  object PB: TProgressBar
    Left = 0
    Top = 312
    Width = 611
    Height = 16
    Align = alBottom
    TabOrder = 2
  end
  object Button2: TButton
    Left = 24
    Top = 56
    Width = 225
    Height = 33
    Caption = 'Clientes'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 24
    Top = 93
    Width = 225
    Height = 33
    Caption = 'Produtos'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 24
    Top = 131
    Width = 225
    Height = 33
    Caption = 'Grupo'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 24
    Top = 176
    Width = 225
    Height = 33
    Caption = 'Vendedores'
    TabOrder = 6
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 320
    Top = 160
    Width = 225
    Height = 33
    Caption = 'Button2'
    TabOrder = 7
  end
  object Button7: TButton
    Left = 320
    Top = 200
    Width = 217
    Height = 49
    Caption = 'arrumar cidades ibge'
    TabOrder = 8
    OnClick = Button7Click
  end
  object OD: TOpenDialog
    Left = 248
    Top = 16
  end
end
