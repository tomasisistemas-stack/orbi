object Fr_imp_pedidos_lote: TFr_imp_pedidos_lote
  Left = 382
  Top = 115
  BorderIcons = [biSystemMenu]
  Caption = 'Imprimir Pedidos em Lote'
  ClientHeight = 490
  ClientWidth = 591
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TsGroupBox
    Left = 0
    Top = 0
    Width = 591
    Height = 73
    Align = alTop
    Caption = 'Intervalo de Datas de Emiss'#227'o dos pedidos'
    TabOrder = 0
    SkinData.SkinSection = 'GROUPBOX'
    object Label1: TsLabel
      Left = 25
      Top = 19
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Label2: TsLabel
      Left = 157
      Top = 20
      Width = 48
      Height = 13
      Caption = 'Data Final'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Prdta_inicial: TsDateEdit
      Left = 11
      Top = 33
      Width = 99
      Height = 21
      AutoSize = False
      Color = clWhite
      EditMask = '!99/99/9999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
      Text = '01/01/2001'
      OnKeyPress = Prdta_inicialKeyPress
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
      Date = 36892.000000000000000000
      DialogTitle = 'Selecione uma Data'
    end
    object Prdta_final: TsDateEdit
      Left = 137
      Top = 33
      Width = 108
      Height = 21
      AutoSize = False
      Color = clWhite
      EditMask = '!99/99/9999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 1
      Text = '01/01/2099'
      OnKeyPress = Prdta_inicialKeyPress
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
      Date = 72686.000000000000000000
      DialogTitle = 'Selecione uma Data'
    end
    object BitBtn2: TsBitBtn
      Left = 280
      Top = 29
      Width = 96
      Height = 29
      Caption = 'Buscar Pedidos'
      TabOrder = 2
      OnClick = BitBtn2Click
      SkinData.SkinSection = 'BUTTON'
    end
    object CheckBox1: TsCheckBox
      Left = 470
      Top = 51
      Width = 91
      Height = 19
      Caption = 'Marcar Todos'
      TabOrder = 3
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
  end
  object GroupBox2: TsGroupBox
    Left = 0
    Top = 73
    Width = 591
    Height = 376
    Align = alTop
    TabOrder = 1
    SkinData.SkinSection = 'GROUPBOX'
    object Cl_Pedidos: TCheckListBox
      Left = 2
      Top = 15
      Width = 587
      Height = 359
      Align = alClient
      Flat = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ItemHeight = 14
      ParentFont = False
      TabOrder = 0
    end
  end
  object BitBtn1: TsBitBtn
    Left = 9
    Top = 453
    Width = 188
    Height = 33
    Caption = 'Imprimir Pedidos Selecionados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn1Click
    SkinData.SkinSection = 'BUTTON'
  end
end
