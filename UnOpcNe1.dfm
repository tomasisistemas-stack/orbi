object FROPCNE1: TFROPCNE1
  Left = 213
  Top = 141
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Op'#231#227'o relatorio de Entradas'
  ClientHeight = 214
  ClientWidth = 244
  Color = clMoneyGreen
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
  object Label2: tsLabel
    Left = 158
    Top = 2
    Width = 48
    Height = 13
    Caption = 'Data Final'
  end
  object Label1: tsLabel
    Left = 26
    Top = 1
    Width = 53
    Height = 13
    Caption = 'Data Inicial'
  end
  object GroupBox2: TsGroupBox
    Left = 7
    Top = 113
    Width = 233
    Height = 63
    Caption = 'Por Fornecedor'
    TabOrder = 0
    object RBTODCLI: TRadioButton
      Left = 41
      Top = 41
      Width = 113
      Height = 17
      Caption = 'Todos os Clientes'
      TabOrder = 0
      OnClick = RBTODCLIClick
    end
    object EDNOMFOR: TMaskEdit
      Left = 4
      Top = 15
      Width = 225
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnEnter = EDNOMFOREnter
      OnExit = EDNOMFORExit
    end
  end
  object GroupBox1: TsGroupBox
    Left = 7
    Top = 40
    Width = 233
    Height = 73
    Caption = 'Tipo de Documento'
    TabOrder = 1
    object RBTODDOC: TRadioButton
      Left = 41
      Top = 46
      Width = 136
      Height = 17
      Caption = 'Todos os Documentos'
      TabOrder = 0
      OnClick = RBTODDOCClick
    end
    object LKTIPDOC: TIB_LookupCombo
      Left = 3
      Top = 16
      Width = 225
      Height = 21
      TabOrder = 1
      OnEnter = LKTIPDOCEnter
      DisplayField = 'NOMFOP'
      ShowButton = True
    end
  end
  object EDDTAFIN: TsDateEdit
    Left = 138
    Top = 15
    Width = 84
    Height = 21
    NumGlyphs = 2
    TabOrder = 2
    OnKeyPress = EDDTAFINKeyPress
  end
  object EDDTAINI: TsDateEdit
    Left = 12
    Top = 15
    Width = 84
    Height = 21
    NumGlyphs = 2
    TabOrder = 3
    OnKeyPress = EDDTAINIKeyPress
  end
  object BTIMP: TsBitBtn
    Left = 50
    Top = 181
    Width = 121
    Height = 28
    Caption = '&Imprimir/Visualizar'
    TabOrder = 4
    OnClick = BTIMPClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000CE0E0000D80E00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
      22222200000000000222208888888880802200000000000008020888888BBB88
      0002088888877788080200000000000008800888888888808080200000000008
      0800220FFFFFFFF080802220F00000F000022220FFFFFFFF022222220F00000F
      022222220FFFFFFFF02222222000000000222222222222222222}
  end
end
