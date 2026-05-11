object frm_conta_descontada: Tfrm_conta_descontada
  Left = 254
  Top = 91
  BorderIcons = [biSystemMenu]
  Caption = 'Conta/Caixa '#224' ser descontado ou depositado.'
  ClientHeight = 577
  ClientWidth = 705
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
    Top = 0
    Width = 705
    Height = 157
    Align = alTop
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object gbCheques: TsGroupBox
      Left = 5
      Top = 44
      Width = 696
      Height = 108
      Caption = 'Pagamentos em Cheques'
      TabOrder = 3
      SkinData.SkinSection = 'GROUPBOX'
      object gbNCC: TsGroupBox
        Left = 259
        Top = 14
        Width = 305
        Height = 44
        Caption = 'N'#176' da Conta Corrente'
        TabOrder = 2
        SkinData.SkinSection = 'GROUPBOX'
        object Lbnom_cc: TsLabel
          Left = 76
          Top = 23
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
        object edContaCheque: TsComboEdit
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
          OnExit = edContaChequeExit
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
          OnButtonClick = edContaChequeButtonClick
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
        end
      end
      object gbDataSacar: TsGroupBox
        Left = 5
        Top = 14
        Width = 124
        Height = 44
        Caption = 'Data '#224' Sacar'
        TabOrder = 0
        SkinData.SkinSection = 'GROUPBOX'
        object eddtSacar: TsDateEdit
          Left = 8
          Top = 15
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
          TabOrder = 0
          Text = '  /  /    '
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
      object gbCheqNum: TsGroupBox
        Left = 132
        Top = 14
        Width = 124
        Height = 44
        Caption = 'N'#176' Cheque'
        TabOrder = 1
        SkinData.SkinSection = 'GROUPBOX'
        object edNumCheque: TsCurrencyEdit
          Left = 9
          Top = 15
          Width = 104
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
          DecimalPlaces = 0
          DisplayFormat = '0;-0'
        end
      end
      object gbValorCheque: TsGroupBox
        Left = 567
        Top = 14
        Width = 124
        Height = 44
        Caption = 'Valor Cheque'
        TabOrder = 3
        SkinData.SkinSection = 'GROUPBOX'
        object edValorCheque: TsCurrencyEdit
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
          OnExit = edValorChequeExit
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
      object gbNominal: TsGroupBox
        Left = 6
        Top = 60
        Width = 686
        Height = 44
        Caption = 'Nominal'
        TabOrder = 4
        SkinData.SkinSection = 'GROUPBOX'
        object edNominal: TsEdit
          Left = 8
          Top = 16
          Width = 670
          Height = 21
          CharCase = ecUpperCase
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 50
          ParentFont = False
          TabOrder = 0
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
      end
    end
    object gbDeposito: TsGroupBox
      Left = 5
      Top = 44
      Width = 696
      Height = 63
      Caption = 'Pagamentos em Dep'#243'sito, Dinheiro ou Cheque de Terceiros'
      TabOrder = 2
      SkinData.SkinSection = 'GROUPBOX'
      object rgtipoPagto: TsRadioGroup
        Left = 3
        Top = 14
        Width = 540
        Height = 44
        Caption = 'Tipo de Pagamento'
        ParentBackground = False
        TabOrder = 1
        OnClick = rgtipoPagtoClick
        SkinData.SkinSection = 'GROUPBOX'
        Columns = 5
        ItemIndex = 0
        Items.Strings = (
          'Dinheiro'
          'Cheques Pr'#243'prio'
          'Cheques de Terc.'
          'Permuta'
          'Desconto (-)')
      end
      object GroupBox5: TsGroupBox
        Left = 601
        Top = 14
        Width = 90
        Height = 44
        Caption = 'Valor'
        TabOrder = 0
        SkinData.SkinSection = 'GROUPBOX'
        object edValor: TsCurrencyEdit
          Left = 8
          Top = 15
          Width = 73
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
          OnExit = edValorExit
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
      object gbDescPerc: TsGroupBox
        Left = 544
        Top = 14
        Width = 56
        Height = 44
        Caption = '% Desc.'
        TabOrder = 2
        Visible = False
        SkinData.SkinSection = 'GROUPBOX'
        object lbPercDesc: TsLabelFX
          Left = 5
          Top = 16
          Width = 46
          Height = 21
          Alignment = taCenter
          AutoSize = False
          Caption = '0,00'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Angle = 0
          Shadow.Mode = smCustom
          Shadow.OffsetKeeper.LeftTop = -3
          Shadow.OffsetKeeper.RightBottom = 5
        end
      end
    end
    object gbFormaPgto: TsGroupBox
      Left = 5
      Top = 1
      Width = 568
      Height = 44
      Caption = 'Forma de Pagamento (Cheque ou Conta Corrente/Caixa)'
      TabOrder = 0
      SkinData.SkinSection = 'GROUPBOX'
      object cbConta: TsComboBox
        Left = 7
        Top = 16
        Width = 553
        Height = 21
        Alignment = taLeftJustify
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'COMBOBOX'
        VerticalAlignment = taAlignTop
        Style = csDropDownList
        ItemIndex = -1
        TabOrder = 0
        OnChange = cbContaChange
        Items.Strings = (
          '0-Cheques')
      end
    end
    object gbDataMov: TsGroupBox
      Left = 576
      Top = 1
      Width = 124
      Height = 44
      Caption = 'Data Movimenta'#231#227'o'
      TabOrder = 1
      SkinData.SkinSection = 'GROUPBOX'
      object eddtMov: TsDateEdit
        Left = 8
        Top = 15
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
        TabOrder = 0
        Text = '  /  /    '
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
  object pnInsCheq: TsPanel
    Left = 0
    Top = 157
    Width = 705
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object Btnov: TsBitBtn
      Left = 311
      Top = 4
      Width = 83
      Height = 31
      Caption = 'Inserir'
      Glyph.Data = {
        A2070000424DA207000000000000360000002800000019000000190000000100
        1800000000006C070000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFEFEFEFAFAFAF1F1F1EAEAEAE5E5E5E5E5E5E4E5E5E4E4E5E4E4E5E4E4
        E4E4E4E4E3E3E3E2E2E3E2E2E2E1E1E2E2E2E2E7E7E7F0F0F0F8F8F8FEFEFEFF
        FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFEFEFEE6E6E6D4D4D3CECDCDCAC9C8C9C8
        C7C8C7C5C7C6C4C6C5C3C6C5C3C7C5C4C7C6C5C7C7C6C8C8C7C8C8C7C9C8C8CD
        CCCCD2D2D2EEEEEEFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFE3E3
        E2ECEBE9E7E6E5E7E5E3E5E3E1E3E1DEE2DFDAE1DDD8E1DED9E3E0DCE5E2DFE6
        E5E3E8E7E5E9E8E7EAE9E8EAE9E8EBEAE8EBEBEAFFFFFFFFFFFFFFFFFF00FFFF
        FFFFFFFFFFFFFFFFFFFFE6E5E4E8E7E7FAFAFAFBFBFBFBFBFBFBFBFBFBFBFBFB
        FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFAFBFBFBFCFCF1F1F1E9E8E6ECECEC
        FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFE5E5E4E8E7E7FDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
        FEFEFEF3F3F3E8E7E6EDECECFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
        FFFFE5E5E4E8E7E7FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
        FCFCFCFCFCFCFCFCFCFCFCFCFDFDFDF3F3F3E9E8E6EDEDECFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFE6E5E4E8E7E7FCFCFCFCFCFCFCFCFCFCFCFC
        FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFDFDFDF3F3F3E9E8
        E6EDEDECFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFE6E5E4E8E7E7
        FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
        FCFCFCFCFDFDFDF3F3F3E9E8E6EDEDECFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFE6E5E5E8E7E7FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
        FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFDFDFDF3F3F3E9E8E6EDEDEDFFFFFFFF
        FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFE6E5E5E8E7E7FCFCFCFCFCFCFCFC
        FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFDFDFDF3
        F3F3E9E8E6EDEDEDFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFE6E5
        E5E8E7E7FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
        FCFCFCFCFCFCFCFCFDFDFDF3F3F3E9E8E6EDEDEDFFFFFFFFFFFFFFFFFF00FFFF
        FFFFFFFFFFFFFFFFFFFFE6E6E5E8E7E7FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
        FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFDFDFDF3F3F3E9E8E6EDEDED
        FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFE6E6E5E8E7E7FCFCFCFC
        FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
        FDFDFDF3F3F3E9E8E6EEEEEDFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
        FFFFE6E6E5E8E7E7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFB
        FBFBFBFBFBFBFBFBFBFBFBFBFCFCFCF2F2F2E8E8E6EEEEEDFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFE6E6E5E8E7E6FAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFBFBFBF1F1F1E8E8
        E6EEEEEDFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFE6E6E5E7E6E6
        F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8
        F8F8F8F8F9F9F9F0EFEFE8E7E5EEEDEDFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFE6E6E5E7E6E6F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7
        F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F8F8F8EFEFEFE8E7E5EEEDEDFFFFFFFF
        FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFE6E6E5E6E5E5F5F5F5F5F5F5F5F5
        F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F7F7F7F7F7F7F8F8F8EF
        EFEFE7E6E5ECECECFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFE6E6
        E5E5E5E4F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F3F3F3ED
        EDEDDEDEDEDDDDDDE1E1E1D7D7D7D6D5D3EDEDEDFFFFFFFFFFFFFFFFFF00FFFF
        FFFFFFFFFFFFFFFFFFFFE6E5E5E5E4E3F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0DEDEDED9D9D9D3D3D3D2D2D2CECECED6D6D6F9F9F9
        FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFE6E5E5E5E4E4F1F1F1F1
        F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F0F0EFDDDDDDF8F8F8F6F6F6
        EFEFEFDCDCDCF1F1F1FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
        FFFFE6E5E5E4E4E3F2F2F1F2F2F1F2F2F1F2F2F1F2F2F1F2F2F2F2F3F2F2F3F2
        F0F0EFDDDDDDF9F9F9EEEEEEDEDEDFF2F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFE6E6E5E6E5E4D9D9D8DADAD9D9D9D8D9D9D7
        D8D7D6D7D6D4D6D4D2D6D4D1D1CFCCCACAC7E3E2E1DBDBDBF5F5F5FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFE5E5E4F7F6F4
        F6F5F3F6F5F3F5F3F1F3F1EDF0EDE8EDE9E3EAE6DEE8E3DAE4DFD6DDDBD5E4E4
        E3F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFEEEEEEE5E5E5E6E6E5E6E6E5E6E6E5E5E5E4E5E4E3E4E3E1E4E2
        E0E3E1DFE1E0DEEBEAEAFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF00}
      TabOrder = 0
      OnClick = BtnovClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object Panel3: TsPanel
    Left = 0
    Top = 513
    Width = 705
    Height = 23
    Align = alBottom
    Alignment = taRightJustify
    TabOrder = 2
    SkinData.SkinSection = 'PANEL'
    object Label1: TsLabel
      Left = 533
      Top = 5
      Width = 42
      Height = 14
      Alignment = taRightJustify
      Caption = 'Saldo:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
    end
    object stTotal: TsLabel
      Left = 577
      Top = 3
      Width = 106
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0,00'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Consolas'
      Font.Style = []
    end
  end
  object Panel4: TsPanel
    Left = 0
    Top = 536
    Width = 705
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 3
    SkinData.SkinSection = 'PANEL'
    object BtnOk: TsBitBtn
      Left = 255
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      Enabled = False
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
      OnClick = BtnOkClick
      SkinData.SkinSection = 'BUTTON'
    end
    object BitBtn2: TsBitBtn
      Left = 375
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
      SkinData.SkinSection = 'BUTTON'
    end
    object ckPgtoParcial: TsCheckBox
      Left = 584
      Top = 12
      Width = 115
      Height = 20
      Caption = 'Pagamento Parcial?'
      Alignment = taLeftJustify
      TabOrder = 2
      OnClick = ckPgtoParcialClick
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
  end
  object dgContasPagar: TDBGrid
    Left = 0
    Top = 398
    Width = 705
    Height = 115
    Align = alBottom
    DataSource = dsContapagar
    DefaultDrawing = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = dgContasPagarDrawColumnCell
    OnKeyDown = dgContasPagarKeyDown
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ChequeNum'
        Title.Alignment = taCenter
        Title.Caption = 'Cheque N'#176
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Conta'
        Title.Caption = 'Conta Corrente'
        Width = 343
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DataEmissao'
        Title.Alignment = taCenter
        Title.Caption = 'Dt. Emiss'#227'o'
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DataSacar'
        Title.Alignment = taCenter
        Title.Caption = 'Dt. Vcto'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Title.Alignment = taCenter
        Width = 104
        Visible = True
      end>
  end
  object PnDeposito: TsPanel
    Left = 0
    Top = 198
    Width = 705
    Height = 25
    Align = alTop
    Caption = 'Pagamentos em Dep'#243'sito, Dinheiro ou Cheques'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    SkinData.SkinSection = 'PANEL'
  end
  object PnCheques: TsPanel
    Left = 0
    Top = 373
    Width = 705
    Height = 25
    Align = alBottom
    Caption = 'Pagamentos em Cheques'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    SkinData.SkinSection = 'PANEL'
  end
  object dgDeposito: TDBGrid
    Left = 0
    Top = 223
    Width = 705
    Height = 150
    Align = alClient
    DataSource = dsDeposito
    DefaultDrawing = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = dgDepositoDrawColumnCell
    OnKeyDown = dgDepositoKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'ChequeNum'
        Title.Alignment = taCenter
        Title.Caption = 'Cheque N'#186
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DataSacar'
        Title.Alignment = taCenter
        Title.Caption = 'Dt Sacar'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Conta'
        Title.Alignment = taCenter
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DescConta'
        Title.Caption = 'Descri'#231#227'o'
        Width = 145
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TipoPagto'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DescTipo'
        Title.Caption = 'Descri'#231#227'o'
        Width = 145
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DataMov'
        Title.Alignment = taCenter
        Title.Caption = 'Data'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Title.Alignment = taCenter
        Width = 80
        Visible = True
      end>
  end
  object mmContasPagar: TRxMemoryData
    FieldDefs = <
      item
        Name = 'ChequeNum'
        DataType = ftInteger
      end
      item
        Name = 'CodConta'
        DataType = ftInteger
      end
      item
        Name = 'Conta'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'DataSacar'
        DataType = ftDate
      end
      item
        Name = 'Valor'
        DataType = ftCurrency
      end
      item
        Name = 'Nominal'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DataEmissao'
        DataType = ftDateTime
      end>
    Left = 424
    Top = 152
    object mmContasPagarChequeNum: TIntegerField
      FieldName = 'ChequeNum'
    end
    object mmContasPagarCodConta: TIntegerField
      FieldName = 'CodConta'
    end
    object mmContasPagarConta: TStringField
      FieldName = 'Conta'
      Size = 25
    end
    object mmContasPagarDataSacar: TDateField
      FieldName = 'DataSacar'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object mmContasPagarValor: TCurrencyField
      FieldName = 'Valor'
    end
    object mmContasPagarNominal: TStringField
      DisplayWidth = 50
      FieldName = 'Nominal'
      Size = 50
    end
    object mmContasPagarDataEmissao: TDateTimeField
      FieldName = 'DataEmissao'
    end
  end
  object dsContapagar: TDataSource
    DataSet = mmContasPagar
    Left = 464
    Top = 144
  end
  object mmDeposito: TRxMemoryData
    FieldDefs = <
      item
        Name = 'ChequeNum'
        DataType = ftInteger
      end
      item
        Name = 'CodConta'
        DataType = ftInteger
      end
      item
        Name = 'Conta'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'DataSacar'
        DataType = ftDate
      end
      item
        Name = 'Valor'
        DataType = ftCurrency
      end
      item
        Name = 'Nominal'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DataEmissao'
        DataType = ftDateTime
      end>
    Left = 544
    Top = 152
    object mmDepositoChequeNum: TIntegerField
      FieldName = 'ChequeNum'
    end
    object mmDepositoConta: TIntegerField
      FieldName = 'Conta'
    end
    object mmDepositoTipoPagto: TIntegerField
      FieldName = 'TipoPagto'
    end
    object mmDepositoValor: TCurrencyField
      FieldName = 'Valor'
    end
    object mmDepositoDescConta: TStringField
      FieldName = 'DescConta'
    end
    object mmDepositoDescTipo: TStringField
      FieldName = 'DescTipo'
    end
    object mmDepositoDataMov: TDateField
      FieldName = 'DataMov'
    end
    object mmDepositoDataSacar: TDateField
      FieldName = 'DataSacar'
    end
  end
  object dsDeposito: TDataSource
    DataSet = mmDeposito
    Left = 592
    Top = 152
  end
end
