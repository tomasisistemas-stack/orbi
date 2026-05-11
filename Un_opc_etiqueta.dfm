object Fr_opc_etiqueta: TFr_opc_etiqueta
  Left = 511
  Top = 232
  BorderIcons = [biSystemMenu]
  ClientHeight = 316
  ClientWidth = 314
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TsGroupBox
    Left = 1
    Top = 0
    Width = 312
    Height = 41
    Caption = 'Tipo Impressora'
    TabOrder = 0
    SkinData.SkinSection = 'GROUPBOX'
    object Cbjato: TRadioButton
      Left = 170
      Top = 17
      Width = 113
      Height = 17
      Caption = 'Jato de Tinta/Laser'
      TabOrder = 0
    end
    object Cbmatricial: TRadioButton
      Left = 10
      Top = 17
      Width = 113
      Height = 17
      Caption = 'Matricial'
      TabOrder = 1
    end
  end
  object GroupBox2: TsGroupBox
    Left = 0
    Top = 41
    Width = 313
    Height = 217
    Caption = 'Dados'
    TabOrder = 1
    SkinData.SkinSection = 'GROUPBOX'
    object Label34: TsLabel
      Left = 9
      Top = 131
      Width = 32
      Height = 13
      Caption = 'Grupo:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object LbNom_Grupo: TsLabel
      Left = 77
      Top = 148
      Width = 9
      Height = 13
      Caption = '...'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Label15: TsLabel
      Left = 10
      Top = 94
      Width = 40
      Height = 13
      Caption = 'Produto:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Lbnom_produto: TsLabel
      Left = 73
      Top = 113
      Width = 9
      Height = 13
      Caption = '...'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Label1: TsLabel
      Left = 8
      Top = 15
      Width = 95
      Height = 13
      Caption = 'Modelo da Etiqueta:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Label9: TsLabel
      Left = 5
      Top = 170
      Width = 33
      Height = 13
      Caption = 'Cidade'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object LbNom_cidade: TsLabel
      Left = 74
      Top = 188
      Width = 9
      Height = 13
      Caption = '...'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Label11: TsLabel
      Left = 9
      Top = 51
      Width = 35
      Height = 13
      Caption = 'Cliente:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Lbnom_cliente: TsLabel
      Left = 77
      Top = 69
      Width = 9
      Height = 13
      Caption = '...'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Prcod_grupo: TsComboEdit
      Left = 5
      Top = 143
      Width = 66
      Height = 21
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Text = ''
      CheckOnExit = True
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object Emcod_produto: TsComboEdit
      Left = 4
      Top = 108
      Width = 65
      Height = 21
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = ''
      CheckOnExit = True
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object ComboBox1: TComboBox
      Left = 5
      Top = 28
      Width = 272
      Height = 21
      TabOrder = 2
    end
    object PrCod_Cidade: TsComboEdit
      Left = 5
      Top = 182
      Width = 66
      Height = 21
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = ''
      CheckOnExit = True
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object Prcod_cliente: TsComboEdit
      Left = 6
      Top = 64
      Width = 66
      Height = 21
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Text = ''
      OnKeyPress = Prcod_clienteKeyPress
      CheckOnExit = True
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
      OnButtonClick = Prcod_clienteButtonClick2
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
  end
  object GroupBox3: TsGroupBox
    Left = 0
    Top = 257
    Width = 313
    Height = 51
    TabOrder = 2
    SkinData.SkinSection = 'GROUPBOX'
    object bt_enviar_email: TsBitBtn
      Left = 186
      Top = 10
      Width = 100
      Height = 36
      Caption = 'Enviar E-mail'
      TabOrder = 0
      SkinData.SkinSection = 'BUTTON'
    end
    object bt_imprimir: TsBitBtn
      Left = 26
      Top = 10
      Width = 100
      Height = 36
      Caption = 'Imprimir'
      TabOrder = 1
      OnClick = bt_imprimirClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
end
