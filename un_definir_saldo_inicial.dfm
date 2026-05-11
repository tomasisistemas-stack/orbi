object fm_definir_saldo_inicial: Tfm_definir_saldo_inicial
  Left = 423
  Top = 340
  BorderIcons = [biSystemMenu]
  Caption = 'Definir Saldo Inicial'
  ClientHeight = 219
  ClientWidth = 209
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TsPanel
    Left = 0
    Top = 0
    Width = 209
    Height = 178
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object gbDefinirSaldo: TsGroupBox
      Left = 8
      Top = 44
      Width = 193
      Height = 41
      Caption = 'Defina o Saldo Inicial da Conta/Caixa'
      TabOrder = 0
      SkinData.SkinSection = 'GROUPBOX'
      object edSaldo: TsCurrencyEdit
        Left = 45
        Top = 14
        Width = 102
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
        DisplayFormat = '0.00;'
      end
    end
    object ckMostra: TsCheckBox
      Left = 8
      Top = 87
      Width = 164
      Height = 20
      Caption = 'Mostrar Quantidade/Unidade?'
      Checked = True
      State = cbChecked
      TabOrder = 1
      Visible = False
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
    object gbPeso: TsGroupBox
      Left = 8
      Top = 130
      Width = 193
      Height = 41
      Caption = 'Imprimir Quantidade KG'
      TabOrder = 3
      SkinData.SkinSection = 'GROUPBOX'
      object edPeso: TsCurrencyEdit
        Left = 45
        Top = 14
        Width = 102
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
        DecimalPlaces = 3
        DisplayFormat = '0.000;'
      end
    end
    object ckEmpresa: TsCheckBox
      Left = 8
      Top = 108
      Width = 151
      Height = 20
      Caption = 'Mostrar Nome da Empresa?'
      Checked = True
      State = cbChecked
      TabOrder = 2
      Visible = False
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
    object gbModelo: TsGroupBox
      Left = 8
      Top = 3
      Width = 193
      Height = 41
      Caption = 'Modelo de Etiqueta'
      TabOrder = 4
      Visible = False
      SkinData.SkinSection = 'GROUPBOX'
      object cbModeloEtiqueta: TComboBox
        Left = 5
        Top = 14
        Width = 184
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 0
        Text = 'Simplificado'
        Items.Strings = (
          'Simplificado'
          'Completo')
      end
    end
  end
  object Panel2: TsPanel
    Left = 0
    Top = 178
    Width = 209
    Height = 41
    Align = alBottom
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object btgra: TsBitBtn
      Left = 15
      Top = 5
      Width = 83
      Height = 31
      Caption = '&Gravar'
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
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 0
      SkinData.SkinSection = 'BUTTON'
    end
    object btcan: TsBitBtn
      Left = 111
      Top = 5
      Width = 83
      Height = 31
      Caption = '&Cancelar'
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
      SkinData.SkinSection = 'BUTTON'
    end
  end
end
