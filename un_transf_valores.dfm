object Fm_Transf_Valores: TFm_Transf_Valores
  Left = 193
  Top = 184
  BorderIcons = [biSystemMenu]
  Caption = 'Fluxo de Caixa - Transfer'#234'ncia entre Contas.'
  ClientHeight = 190
  ClientWidth = 688
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TsPanel
    Left = 0
    Top = 149
    Width = 688
    Height = 41
    Align = alBottom
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object BtnOk: TsBitBtn
      Left = 407
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      TabOrder = 0
      OnClick = BtnOkClick
      SkinData.SkinSection = 'BUTTON'
    end
    object BtnCancelar: TsBitBtn
      Left = 495
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
      SkinData.SkinSection = 'BUTTON'
    end
    object ckDeposito: TsCheckBox
      Left = 17
      Top = 12
      Width = 278
      Height = 19
      Caption = 'N'#227'o Registrar Sa'#237'da de Valores na Conta de Origem?'
      TabOrder = 2
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
  end
  object Panel2: TsPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 149
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object gbOrigem: TsGroupBox
      Left = 7
      Top = 2
      Width = 676
      Height = 44
      Caption = 'N'#176' da Conta Corrente - Origem'
      TabOrder = 0
      SkinData.SkinSection = 'GROUPBOX'
      object Lbnom_cc_Orig: TsLabel
        Left = 76
        Top = 23
        Width = 9
        Height = 13
        Caption = '...'
      end
      object edContaOrigem: TsComboEdit
        Left = 6
        Top = 15
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
        TabOrder = 0
        Text = ''
        OnExit = edContaOrigemExit
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
        OnButtonClick = edContaOrigemButtonClick
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
    end
    object gbDestino: TsGroupBox
      Left = 7
      Top = 48
      Width = 676
      Height = 44
      Caption = 'N'#176' da Conta Corrente - Destino'
      TabOrder = 1
      SkinData.SkinSection = 'GROUPBOX'
      object Lbnom_cc_Dest: TsLabel
        Left = 76
        Top = 23
        Width = 9
        Height = 13
        Caption = '...'
      end
      object edContaDestino: TsComboEdit
        Left = 6
        Top = 15
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
        TabOrder = 0
        Text = ''
        OnExit = edContaDestinoExit
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
        OnButtonClick = edContaDestinoButtonClick
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
    end
    object gbValor: TsGroupBox
      Left = 7
      Top = 96
      Width = 124
      Height = 44
      Caption = 'Valor Transferido'
      TabOrder = 2
      SkinData.SkinSection = 'GROUPBOX'
      object edValorTransf: TsCurrencyEdit
        Left = 8
        Top = 15
        Width = 107
        Height = 21
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
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
    end
  end
end
