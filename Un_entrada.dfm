object Fr_entrada: TFr_entrada
  Left = 97
  Top = 22
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Entrada de Mercadorias/Notas Especiais'
  ClientHeight = 672
  ClientWidth = 930
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  PrintScale = poNone
  OnClick = FormClick
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PcEntrada: TsPageControl
    Left = 0
    Top = 89
    Width = 930
    Height = 512
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    SkinData.SkinSection = 'PAGECONTROL'
    object TabSheet1: TsTabSheet
      Caption = 'Dados da Entrada'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object GroupBox1: TsGroupBox
        Left = 2
        Top = -3
        Width = 752
        Height = 433
        TabOrder = 0
        SkinData.SkinSection = 'GROUPBOX'
        object GroupBox2: TsGroupBox
          Left = 3
          Top = 9
          Width = 747
          Height = 170
          Color = clMoneyGreen
          ParentColor = False
          TabOrder = 0
          SkinData.SkinSection = 'GROUPBOX'
          object Lbnom_cod_fiscal: TsLabel
            Left = 75
            Top = 68
            Width = 13
            Height = 13
            Caption = '...'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
          end
          object Lbempresa_destino: TsLabel
            Left = 394
            Top = 109
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
          object Label22: TsLabel
            Left = 325
            Top = 91
            Width = 77
            Height = 13
            Caption = 'Loja de Destino:'
            ParentFont = False
            PopupMenu = PopupMenu1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object Label24: TsLabel
            Left = 6
            Top = 51
            Width = 66
            Height = 13
            Caption = 'C'#243'digo Fiscal:'
            ParentFont = False
            PopupMenu = PopupMenu1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object Label25: TsLabel
            Left = 5
            Top = 128
            Width = 115
            Height = 13
            Caption = 'N'#186' Romaneio Recebido:'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object Label35: TsLabel
            Left = 5
            Top = 90
            Width = 90
            Height = 13
            Caption = 'Pertertence a Loja:'
            ParentFont = False
            PopupMenu = PopupMenu1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object Lbempresa_pertence: TsLabel
            Left = 76
            Top = 110
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
          object Lbqtd: TsLabel
            Left = 478
            Top = 132
            Width = 13
            Height = 13
            Caption = '...'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
          end
          object lbqtd_ant: TsLabel
            Left = 497
            Top = 149
            Width = 13
            Height = 13
            Caption = '...'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
          end
          object Prcod_fiscal: TsComboEdit
            Left = 5
            Top = 63
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
            OnExit = Prcod_fiscalExit
            OnKeyPress = Prcod_fiscalKeyPress
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
            OnButtonClick = Prcod_fiscalButtonClick
            GlyphMode.Blend = 0
            GlyphMode.Grayed = False
          end
          object Prempresa_destino: TsComboEdit
            Left = 325
            Top = 104
            Width = 66
            Height = 21
            AutoSize = False
            Color = clWhite
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Text = ''
            OnExit = Prempresa_destinoExit
            OnKeyPress = Prempresa_destinoKeyPress
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
            OnButtonClick = Prempresa_destinoButtonClick
            GlyphMode.Blend = 0
            GlyphMode.Grayed = False
          end
          object Prnr_romaneio: TsEdit
            Left = 5
            Top = 143
            Width = 74
            Height = 21
            Color = clWhite
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            OnExit = Prnr_romaneioExit
            OnKeyPress = Prdta_documentoKeyPress
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
          object Prempresa: TsComboEdit
            Left = 5
            Top = 104
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
            TabOrder = 1
            Text = ''
            OnExit = PrempresaExit
            OnKeyPress = PrempresaKeyPress
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
            OnButtonClick = PrempresaButtonClick
            GlyphMode.Blend = 0
            GlyphMode.Grayed = False
          end
          object ZZpode_enviar: TsCheckBox
            Left = 134
            Top = 148
            Width = 157
            Height = 20
            TabStop = False
            Caption = 'Liberar Romaneio para Envio'
            TabOrder = 5
            OnClick = ZZpode_enviarClick
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
          object PrTIPO_NF: TsCheckBox
            Left = 632
            Top = 109
            Width = 89
            Height = 20
            TabStop = False
            Caption = #201' Nota Fiscal?'
            TabOrder = 3
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
        end
        object Gbcp1: TsGroupBox
          Left = 2
          Top = 327
          Width = 367
          Height = 100
          TabOrder = 2
          SkinData.SkinSection = 'GROUPBOX'
          object Label8: TsLabel
            Left = 7
            Top = 10
            Width = 63
            Height = 13
            Caption = 'Qtd parcelas:'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object Label9: TsLabel
            Left = 5
            Top = 53
            Width = 104
            Height = 13
            Caption = 'Forma de Pagamento:'
            ParentFont = False
            PopupMenu = PopupMenu1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object Lbnom_fop: TsLabel
            Left = 75
            Top = 71
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
          object sbParc: TsSpeedButton
            Left = 47
            Top = 24
            Width = 24
            Height = 22
            Hint = 'Alterar'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
              55555575555555775F55509999999901055557F55555557F75F5001111111101
              105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
              01105777F555557F7FF75500FFFFFF0F00105577F555FF7F77575550FF70000F
              0F0055575FF777757F775555000FFFFF0F005555777555FF7F77555550FF7000
              0F055555575FF777757F555555000FFFFF05555555777555FF7F55555550FF70
              0005555555575FF7777555555555000555555555555577755555555555555555
              5555555555555555555555555555555555555555555555555555}
            NumGlyphs = 2
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = sbParcClick
            SkinData.SkinSection = 'SPEEDBUTTON'
          end
          object PrQtd_parcelas: TsCurrencyEdit
            Left = 6
            Top = 25
            Width = 39
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
            OnEnter = PrQtd_parcelasEnter
            OnKeyPress = Prdta_documentoKeyPress
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
            DisplayFormat = ' 0'
          end
          object Prcod_fop: TsComboEdit
            Left = 5
            Top = 67
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
            TabOrder = 1
            Text = ''
            OnExit = Prcod_fopExit
            OnKeyPress = Prcod_fopKeyPress
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
            OnButtonClick = Prcod_fopButtonClick
            GlyphMode.Blend = 0
            GlyphMode.Grayed = False
          end
        end
        object GroupBox4: TsGroupBox
          Left = 370
          Top = 327
          Width = 380
          Height = 100
          Caption = 'Observa'#231#245'es da Nota (ser'#225' impresso na nota Fiscal)'
          TabOrder = 3
          SkinData.SkinSection = 'GROUPBOX'
          object Label12: TsLabel
            Left = 8
            Top = 20
            Width = 9
            Height = 13
            Caption = '1)'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object Label13: TsLabel
            Left = 8
            Top = 44
            Width = 9
            Height = 13
            Caption = '2)'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object Label14: TsLabel
            Left = 8
            Top = 68
            Width = 9
            Height = 13
            Caption = '3)'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object Probs_nota1: TsEdit
            Left = 24
            Top = 16
            Width = 342
            Height = 21
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 50
            ParentFont = False
            TabOrder = 0
            OnKeyPress = Prdta_documentoKeyPress
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
          object Probs_nota2: TsEdit
            Left = 24
            Top = 40
            Width = 342
            Height = 21
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 50
            ParentFont = False
            TabOrder = 1
            OnKeyPress = Prdta_documentoKeyPress
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
          object Probs_nota3: TsEdit
            Left = 24
            Top = 64
            Width = 342
            Height = 21
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 50
            ParentFont = False
            TabOrder = 2
            OnKeyPress = Probs_nota3KeyPress
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
        object GroupBox7: TsGroupBox
          Left = 3
          Top = 185
          Width = 748
          Height = 142
          TabOrder = 1
          SkinData.SkinSection = 'GROUPBOX'
          object Label3: TsLabel
            Left = 4
            Top = 14
            Width = 42
            Height = 13
            Caption = 'Vlr Frete:'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object Label2: TsLabel
            Left = 92
            Top = 94
            Width = 49
            Height = 13
            Caption = 'Vlr Outros:'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object Label5: TsLabel
            Left = 5
            Top = 56
            Width = 52
            Height = 13
            Caption = 'Base Icms:'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object Label6: TsLabel
            Left = 348
            Top = 95
            Width = 95
            Height = 13
            Caption = 'Tot. Mercadoria:'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
          end
          object Label7: TsLabel
            Left = 645
            Top = 94
            Width = 53
            Height = 13
            Caption = 'Vlr Total:'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
          end
          object LbNom_transportadora: TsLabel
            Left = 368
            Top = 36
            Width = 13
            Height = 13
            Caption = '...'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
          end
          object Label16: TsLabel
            Left = 298
            Top = 14
            Width = 75
            Height = 13
            Caption = 'Transportadora:'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object Label26: TsLabel
            Left = 262
            Top = 95
            Width = 75
            Height = 13
            Caption = 'Qtd de Itens:'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
          end
          object Label11: TsLabel
            Left = 91
            Top = 56
            Width = 52
            Height = 13
            Caption = 'Valor Icms:'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object Label27: TsLabel
            Left = 177
            Top = 56
            Width = 78
            Height = 13
            Caption = 'B.C. Icms Subst:'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object Label28: TsLabel
            Left = 263
            Top = 56
            Width = 85
            Height = 13
            Caption = 'Valor Icms Subst.:'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object Label30: TsLabel
            Left = 6
            Top = 94
            Width = 52
            Height = 13
            Caption = 'Vlr Seguro:'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object Label36: TsLabel
            Left = 179
            Top = 93
            Width = 58
            Height = 13
            Caption = 'Total do IPI:'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object sLabel4: TsLabel
            Left = 502
            Top = 95
            Width = 55
            Height = 13
            Caption = 'Desconto'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
          end
          object Prvl_frete: TsCurrencyEdit
            Left = 2
            Top = 28
            Width = 80
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
            OnExit = Prvl_freteExit
            OnKeyPress = Prdta_documentoKeyPress
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
          object Prvl_outros: TsCurrencyEdit
            Left = 89
            Top = 106
            Width = 80
            Height = 21
            AutoSize = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
            OnExit = Prvl_outrosExit
            OnKeyPress = Prdta_documentoKeyPress
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
          object Prbase_icms: TsCurrencyEdit
            Left = 3
            Top = 69
            Width = 80
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
            OnKeyPress = Prdta_documentoKeyPress
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
          object Prtotal_mercadorias: TsCurrencyEdit
            Left = 348
            Top = 107
            Width = 80
            Height = 21
            AutoSize = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 11
            OnExit = Prtotal_mercadoriasExit
            OnKeyPress = Prdta_documentoKeyPress
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
          object Prvl_total: TsCurrencyEdit
            Left = 642
            Top = 106
            Width = 80
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 13
            OnKeyPress = Prdta_documentoKeyPress
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
          object Prcod_transportadora: TsComboEdit
            Left = 298
            Top = 28
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
            TabOrder = 2
            Text = ''
            OnExit = Prcod_transportadoraExit
            OnKeyPress = Prcod_transportadoraKeyPress
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
            OnButtonClick = Prcod_transportadoraButtonClick
            GlyphMode.Blend = 0
            GlyphMode.Grayed = False
          end
          object Prfrete_separado: TsCheckBox
            Left = 118
            Top = 30
            Width = 161
            Height = 20
            TabStop = False
            Caption = 'Gerar Parcela Frete Separada'
            TabOrder = 1
            OnClick = Prfrete_separadoClick
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
          object Prtot_itens: TsCurrencyEdit
            Left = 262
            Top = 107
            Width = 80
            Height = 21
            AutoSize = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 10
            OnKeyPress = Prdta_documentoKeyPress
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
            DisplayFormat = '0'
          end
          object Prvalor_icms: TsCurrencyEdit
            Left = 89
            Top = 69
            Width = 80
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
            OnKeyPress = Prdta_documentoKeyPress
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
          object Prbase_calculo_icms_subst: TsCurrencyEdit
            Left = 175
            Top = 69
            Width = 80
            Height = 21
            AutoSize = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            OnKeyPress = Prdta_documentoKeyPress
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
          object Prvalor_icms_subst: TsCurrencyEdit
            Left = 261
            Top = 69
            Width = 80
            Height = 21
            AutoSize = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            OnExit = Prvalor_icms_substExit
            OnKeyPress = Prdta_documentoKeyPress
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
          object Prvalor_seguro: TsCurrencyEdit
            Left = 3
            Top = 106
            Width = 80
            Height = 21
            AutoSize = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            OnExit = Prvl_outrosExit
            OnKeyPress = Prdta_documentoKeyPress
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
          object Prtotal_ipi: TsCurrencyEdit
            Left = 175
            Top = 106
            Width = 80
            Height = 21
            AutoSize = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
            OnExit = Prtotal_ipiExit
            OnKeyPress = Prdta_documentoKeyPress
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
          object PrDesconto: TsCurrencyEdit
            Left = 499
            Top = 107
            Width = 80
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 12
            OnExit = PrDescontoExit
            OnKeyPress = Prdta_documentoKeyPress
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
        object Prcod_empresa: TsEdit
          Left = 732
          Top = 24
          Width = 13
          Height = 21
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          Visible = False
          OnKeyPress = PrNr_documentoKeyPress
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
    object TabSheet2: TsTabSheet
      Caption = 'Mercadorias'
      ImageIndex = 1
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object GroupBox6: TsGroupBox
        Left = 12
        Top = 266
        Width = 745
        Height = 195
        TabOrder = 0
        SkinData.SkinSection = 'GROUPBOX'
        object Label15: TsLabel
          Left = 9
          Top = 12
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
          Left = 89
          Top = 29
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
        object Label17: TsLabel
          Left = 280
          Top = 49
          Width = 58
          Height = 13
          Caption = 'Quantidade:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label18: TsLabel
          Left = 342
          Top = 49
          Width = 30
          Height = 13
          Caption = 'Custo:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label19: TsLabel
          Left = 606
          Top = 50
          Width = 25
          Height = 13
          Caption = 'Icms:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label20: TsLabel
          Left = 666
          Top = 51
          Width = 46
          Height = 13
          Caption = 'Sub-Total'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Lbembalagem: TsLabel
          Left = 649
          Top = 29
          Width = 13
          Height = 13
          Alignment = taRightJustify
          Caption = '...'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
        end
        object Label21: TsLabel
          Left = 516
          Top = 49
          Width = 55
          Height = 13
          Caption = 'Custo Final:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Lbcolecao: TsLabel
          Left = 9
          Top = 124
          Width = 13
          Height = 13
          Caption = '...'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
        end
        object Label31: TsLabel
          Left = 424
          Top = 40
          Width = 77
          Height = 13
          Caption = 'Pre'#231'o de Venda'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label39: TsLabel
          Left = 228
          Top = 48
          Width = 38
          Height = 13
          Caption = 'Volume:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label4: TsLabel
          Left = 677
          Top = 12
          Width = 59
          Height = 13
          Caption = 'Qtd Estoque'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object btGrafico: TsSpeedButton
          Left = 312
          Top = 98
          Width = 129
          Height = 81
          Caption = 'Gr'#225'fico'
          Glyph.Data = {
            42080000424D4208000000000000420000002800000020000000200000000100
            1000030000000008000000000000000000000000000000000000007C0000E003
            00001F000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7F0000FF7FFF7F0000FF7FFF7F0000
            FF7FFF7F0000FF7FFF7F0000FF7FFF7F0000FF7FFF7F0000FF7FFF7F0000FF7F
            FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FEF3D00000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000EF3DFF7F0000FF7FF75EFF7FF75EFF7FF75EFF7FF75EFF7FF75EFF7F
            F75EFF7FF75EFF7FF75EFF7FF75EFF7FF75EFF7FF75EFF7FF75EFF7FF75EFF7F
            F75EFF7F0000FF7F0000F75EFF7FF75EFF7FF75EFF7FF75EFF7FF75EFF7FF75E
            FF7FF75EFF7FF75EFF7FF75EFF7FF75EFF7FF75EFF7FF75EFF7FF75EFF7FF75E
            FF7FF75E0000FF7F0000F75EF75E00000000000000000000F75EF75E00000000
            000000000000F75EF75E00000000000000000000F75EF75E0000000000000000
            0000F75E0000FF7F0000F75E00000000FF03FF03EF010000F75EF75E0000FF03
            FF03EF010000F75EF75E0000FF03FF03EF010000F75EF75E0000FF03FF03EF01
            0000F75E0000FF7F0000F75EE07F0000FF03FF03EF010000F75EF75E0000FF03
            FF03EF010000F75EF75E0000FF03FF03EF010000F75EF75E0000FF03FF03EF01
            0000F75E0000FF7F0000F75EE07FE07F0000FF03EF010000F75EF75E0000FF03
            FF03EF010000F75EF75E0000FF03FF03EF010000F75EF75E0000FF03FF03EF01
            0000F75E0000FF7F0000F75EF75EE07FE07F0000EF010000F75E00000000FF03
            FF03EF010000F75EF75E0000FF03FF03EF010000F75EF75E0000FF03FF03EF01
            0000F75E0000FF7F0000F75EF75E0000E07FE07F000000000000E07F0000FF03
            FF03EF010000F75EF75E0000FF03FF03EF010000F75EF75E0000FF03FF03EF01
            0000F75E0000FF7F0000F75EF75E0000FF03E07FE07F0000E07FE07FE07F0000
            FF03EF010000F75EF75E0000FF03FF03EF010000F75EF75E0000FF03FF03EF01
            0000F75E0000FF7F0000F75EF75E0000FF03FF03E07FE07FE07FF75EE07FE07F
            0000EF010000F75EF75E0000FF03FF03EF010000F75EF75E0000FF03FF03EF01
            0000F75E0000FF7F0000F75EF75E0000FF03FF03EF01E07FF75EF75E0000E07F
            E07F00000000F75EF75E0000FF03FF03EF010000F75E00000000FF03FF03EF01
            0000F75E0000FF7F0000F75EF75E0000FF03FF03EF010000F75EF75E0000FF03
            E07FE07F0000F75EF75E0000FF03FF03EF0100000000E07F0000FF03FF03EF01
            0000F75E0000FF7F0000F75EF75E0000FF03FF03EF010000F75EF75E0000FF03
            FF03E07FE07F0000F75E0000FF03FF03EF010000E07FE07FE07F0000FF03EF01
            0000F75E0000FF7F0000F75EF75E0000FF03FF03EF010000F75EF75E0000FF03
            FF03EF01E07FE07F00000000FF03FF030000E07FE07FF75EE07FE07F0000EF01
            0000F75E0000FF7F0000F75EF75E0000FF03FF03EF010000F75EF75E0000FF03
            FF03EF010000E07FE07F0000FF030000E07FE07FF75EF75E0000E07FE07F0000
            0000F75E0000FF7F0000F75EF75E0000FF03FF03EF010000F75EF75E0000FF03
            FF03EF010000F75EE07FE07F0000E07FE07F0000F75EF75E0000FF7FE07FE07F
            0000F75E0000FF7F0000F75EF75E0000FF03FF03EF010000F75EF75E0000FF03
            FF03EF010000F75EF75EE07FE07FE07FEF010000F75EF75EF75E00000000E07F
            E07F00000000FF7F0000F75EF75E0000FF03FF03EF010000F75EF75E0000FF7F
            FF7FFF030000F75EF75E0000E07FFF03EF010000F75EF75EF75EF75EF75EF75E
            E07FE07F0000FF7F0000F75EF75E0000FF03FF03EF010000F75EF75EF75E0000
            00000000F75EF75EF75E0000FF03FF03EF010000F75EF75EF75EF75EF75EF75E
            F75EE07F0000FF7F0000F75EF75E0000FF03FF03EF010000F75EF75EF75EF75E
            F75EF75EF75EF75EF75E0000FF03FF03EF010000F75EF75EF75EF75EF75EF75E
            F75EF75E0000FF7F0000F75EF75E0000FF03FF03EF010000F75EF75EF75EF75E
            F75EF75EF75EF75EF75E0000FF7FFF7FFF030000F75EF75EF75EF75EF75EF75E
            F75EF75E0000FF7F0000FF7FF75E0000FF7FFF7FFF030000F75EFF7FF75EFF7F
            F75EFF7FF75EFF7FF75EFF7F000000000000FF7FF75EFF7FF75EFF7FF75EFF7F
            F75EFF7F0000FF7F0000F75EFF7FF75E000000000000F75EFF7FF75EFF7FF75E
            FF7FF75EFF7FF75EFF7FF75EFF7FF75EFF7FF75EFF7FF75EFF7FF75EFF7FF75E
            FF7FF75E0000FF7F0000FF7FF75EFF7FF75EFF7FF75EFF7FF75EFF7FF75EFF7F
            F75EFF7FF75EFF7FF75EFF7FF75EFF7FF75EFF7FF75EFF7FF75EFF7FF75EFF7F
            F75EFF7F0000FF7FEF3D00000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000EF3DFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7F}
          OnClick = btGraficoClick
          SkinData.SkinSection = 'SPEEDBUTTON'
        end
        object lbHodometro: TsLabel
          Left = 168
          Top = 48
          Width = 52
          Height = 13
          Caption = 'Hod'#244'metro'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object lbVeiculo: TsLabel
          Left = 58
          Top = 67
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
        object lbsVeiculo: TsLabel
          Left = 6
          Top = 48
          Width = 37
          Height = 13
          Caption = 'Ve'#237'culo'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Emcod_produto: TRxDBComboEdit
          Left = 5
          Top = 26
          Width = 79
          Height = 21
          DataField = 'COD_PRODUTO'
          DataSource = dsEntradas2
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FF0975A7075C840C6F9DFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0670A43F
            9AB86E533B15212618769FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FF0670A431CDFF50A8BFFFDAA07C5F451B3B4CFF00FF0052
            86005286FF00FFFF00FFFF00FFFF00FFFF00FF0670A42FBFF028ACDF59D2FE78
            C9E7E3BB8FD7A8792832391D7BAB0052860052860A587EFF00FFFF00FFFF00FF
            0670A443D0FE6CDEFF5CB4DBAEDDF3F1FFFFDEDBD59B88732C5F765FBDE665BF
            E083756117161504557F0C7BAE2998C877DDFFA3E5FFCFF1FFDBF0F95AA9C8B1
            D8E98BCAE5379AC61AABDA4AD0FF2EB8E7D0BE9D7C5639023B57086C9F0670A4
            CDEBF9FAFFFFF2FCFFDBF5FF60BDE00697C6008EBC0089B80BA9D534C7FA33CF
            FF7EB8BF8B6B4C0142620670A4BCDBEA0670A4A1D2E693D9F772DBFF53D6FF33
            C0F1189CCE058CBC00A0CB1FB5E437CBFC23B1E51A6687025F8FFF00FF0670A4
            0670A40670A426A1D226ADE031C2F537C9FB34C4F72AB5E7128DBE0172A10F7B
            AFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0E85B80C7EB213
            93C50B8DC0006C9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          NumGlyphs = 1
          TabOrder = 1
          OnButtonClick = Emcod_produtoButtonClick
          OnExit = Emcod_produtoExit
          OnKeyDown = Emcod_produtoKeyDown
          OnKeyPress = Emcod_produtoKeyPress
        end
        object Emqtd_entrada: TDBEdit
          Left = 278
          Top = 61
          Width = 59
          Height = 21
          AutoSize = False
          Color = clWhite
          DataField = 'QTD_ENTRADA'
          DataSource = dsEntradas2
          TabOrder = 5
          OnExit = Emqtd_entradaExit
          OnKeyPress = Emqtd_entradaKeyPress
        end
        object Emcusto: TDBEdit
          Left = 340
          Top = 61
          Width = 73
          Height = 21
          AutoSize = False
          Color = clWhite
          DataField = 'CUSTO'
          DataSource = dsEntradas2
          TabOrder = 6
          OnEnter = EmcustoEnter
          OnExit = EmcustoExit
          OnKeyPress = EmcustoKeyPress
        end
        object EmIcms: TDBEdit
          Left = 600
          Top = 63
          Width = 59
          Height = 21
          AutoSize = False
          Color = clWhite
          DataField = 'ICMS'
          DataSource = dsEntradas2
          TabOrder = 9
          OnExit = EmIcmsExit
          OnKeyPress = EmIcmsKeyPress
        end
        object Emsub_total: TDBEdit
          Left = 664
          Top = 63
          Width = 73
          Height = 21
          AutoSize = False
          Color = clWhite
          DataField = 'SUB_TOTAL'
          DataSource = dsEntradas2
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
          OnKeyPress = Emsub_totalKeyPress
        end
        object EmCusto_final: TDBEdit
          Left = 514
          Top = 62
          Width = 73
          Height = 21
          AutoSize = False
          Color = clWhite
          DataField = 'CUSTO_FINAL'
          DataSource = dsEntradas2
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          OnExit = EmcustoExit
          OnKeyPress = EmCusto_finalKeyPress
        end
        object paAtributo: TsPanel
          Left = -68
          Top = 160
          Width = 361
          Height = 41
          Color = clGradientInactiveCaption
          TabOrder = 0
          Visible = False
          SkinData.SkinSection = 'PANEL'
          object Label10: TsLabel
            Left = 5
            Top = 2
            Width = 19
            Height = 13
            Caption = 'Cor:'
          end
          object LbCor: TsLabel
            Left = 75
            Top = 22
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
          object Lbtamanho: TsLabel
            Left = 258
            Top = 22
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
          object Label23: TsLabel
            Left = 209
            Top = 4
            Width = 48
            Height = 13
            Caption = 'Tamanho:'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object Emid_cor: TRxDBComboEdit
            Left = 6
            Top = 16
            Width = 66
            Height = 21
            DataField = 'ID_COR'
            DataSource = dsEntradas2
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF0975A7075C840C6F9DFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0670A43F
              9AB86E533B15212618769FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF0670A431CDFF50A8BFFFDAA07C5F451B3B4CFF00FF0052
              86005286FF00FFFF00FFFF00FFFF00FFFF00FF0670A42FBFF028ACDF59D2FE78
              C9E7E3BB8FD7A8792832391D7BAB0052860052860A587EFF00FFFF00FFFF00FF
              0670A443D0FE6CDEFF5CB4DBAEDDF3F1FFFFDEDBD59B88732C5F765FBDE665BF
              E083756117161504557F0C7BAE2998C877DDFFA3E5FFCFF1FFDBF0F95AA9C8B1
              D8E98BCAE5379AC61AABDA4AD0FF2EB8E7D0BE9D7C5639023B57086C9F0670A4
              CDEBF9FAFFFFF2FCFFDBF5FF60BDE00697C6008EBC0089B80BA9D534C7FA33CF
              FF7EB8BF8B6B4C0142620670A4BCDBEA0670A4A1D2E693D9F772DBFF53D6FF33
              C0F1189CCE058CBC00A0CB1FB5E437CBFC23B1E51A6687025F8FFF00FF0670A4
              0670A40670A426A1D226ADE031C2F537C9FB34C4F72AB5E7128DBE0172A10F7B
              AFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0E85B80C7EB213
              93C50B8DC0006C9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            NumGlyphs = 1
            TabOrder = 0
            OnButtonClick = Emid_corButtonClick
            OnExit = Emid_corExit
            OnKeyPress = Emid_corKeyPress
          end
          object Emid_Tamanho: TRxDBComboEdit
            Left = 208
            Top = 16
            Width = 49
            Height = 21
            DataField = 'ID_TAMANHO'
            DataSource = dsEntradas2
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF0975A7075C840C6F9DFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0670A43F
              9AB86E533B15212618769FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF0670A431CDFF50A8BFFFDAA07C5F451B3B4CFF00FF0052
              86005286FF00FFFF00FFFF00FFFF00FFFF00FF0670A42FBFF028ACDF59D2FE78
              C9E7E3BB8FD7A8792832391D7BAB0052860052860A587EFF00FFFF00FFFF00FF
              0670A443D0FE6CDEFF5CB4DBAEDDF3F1FFFFDEDBD59B88732C5F765FBDE665BF
              E083756117161504557F0C7BAE2998C877DDFFA3E5FFCFF1FFDBF0F95AA9C8B1
              D8E98BCAE5379AC61AABDA4AD0FF2EB8E7D0BE9D7C5639023B57086C9F0670A4
              CDEBF9FAFFFFF2FCFFDBF5FF60BDE00697C6008EBC0089B80BA9D534C7FA33CF
              FF7EB8BF8B6B4C0142620670A4BCDBEA0670A4A1D2E693D9F772DBFF53D6FF33
              C0F1189CCE058CBC00A0CB1FB5E437CBFC23B1E51A6687025F8FFF00FF0670A4
              0670A40670A426A1D226ADE031C2F537C9FB34C4F72AB5E7128DBE0172A10F7B
              AFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0E85B80C7EB213
              93C50B8DC0006C9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            NumGlyphs = 1
            TabOrder = 1
            OnButtonClick = Emid_TamanhoButtonClick
            OnExit = Emid_TamanhoExit
            OnKeyPress = Emid_TamanhoKeyPress
          end
        end
        object zzPreco_venda_atualizar: TsCurrencyEdit
          Left = 420
          Top = 57
          Width = 88
          Height = 26
          AutoSize = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          OnEnter = zzPreco_venda_atualizarEnter
          OnExit = zzPreco_venda_atualizarExit
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
          DecimalPlaces = 4
          DisplayFormat = ' ,0.0000;- ,0.0000'
        end
        object Emid: TDBEdit
          Left = 48
          Top = 177
          Width = 73
          Height = 21
          TabStop = False
          DataField = 'ID'
          DataSource = dsEntradas2
          TabOrder = 11
          Visible = False
        end
        object EmVolume: TDBEdit
          Left = 226
          Top = 61
          Width = 49
          Height = 21
          AutoSize = False
          Color = clWhite
          DataField = 'VOLUME'
          DataSource = dsEntradas2
          TabOrder = 4
          OnKeyPress = EmVolumeKeyPress
        end
        object zzEstoque: TsCurrencyEdit
          Left = 664
          Top = 26
          Width = 73
          Height = 21
          AutoSize = False
          Color = clWhite
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 12
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
          DisplayFormat = ' ,0.00;- ,0.00'
        end
        object Emcod_colecao: TDBEdit
          Left = 53
          Top = 181
          Width = 84
          Height = 21
          DataField = 'COD_COLECAO'
          DataSource = dsEntradas2
          TabOrder = 13
          Visible = False
        end
        object Emcod_fornecedor: TDBEdit
          Left = 61
          Top = 173
          Width = 84
          Height = 21
          DataField = 'COD_FORNECEDOR'
          DataSource = dsEntradas2
          TabOrder = 14
          Visible = False
        end
        object Emnr_documento: TDBEdit
          Left = 21
          Top = 173
          Width = 84
          Height = 21
          DataField = 'NR_DOCUMENTO'
          DataSource = dsEntradas2
          TabOrder = 15
          Visible = False
        end
        object Panel4: TsPanel
          Left = 609
          Top = 85
          Width = 132
          Height = 106
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Color = clWhite
          TabOrder = 16
          SkinData.SkinSection = 'PANEL'
          object Foto: TImage
            Left = 2
            Top = 2
            Width = 128
            Height = 102
            Align = alClient
            Center = True
            Proportional = True
          end
        end
        object Gbanalise_custo: TsGroupBox
          Left = 447
          Top = 91
          Width = 155
          Height = 95
          Caption = 'An'#225'lise do Produto'
          TabOrder = 17
          SkinData.SkinSection = 'GROUPBOX'
          object Label40: TsLabel
            Left = 7
            Top = 15
            Width = 27
            Height = 13
            Caption = 'Custo'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object Label41: TsLabel
            Left = 84
            Top = 15
            Width = 42
            Height = 13
            Caption = 'Impostos'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object Label42: TsLabel
            Left = 7
            Top = 55
            Width = 16
            Height = 13
            Caption = 'IPI:'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object Label43: TsLabel
            Left = 84
            Top = 55
            Width = 25
            Height = 13
            Caption = 'Geral'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object emCustoPro: TDBEdit
            Left = 4
            Top = 29
            Width = 68
            Height = 21
            AutoSize = False
            Color = clMoneyGreen
            DataField = 'CUSTO_PRO'
            DataSource = dsEntradas2
            TabOrder = 0
          end
          object emImpostosPro: TDBEdit
            Left = 81
            Top = 29
            Width = 68
            Height = 21
            AutoSize = False
            Color = clMoneyGreen
            DataField = 'IMPOSTO_PRO'
            DataSource = dsEntradas2
            TabOrder = 1
          end
          object emIPIPro: TDBEdit
            Left = 4
            Top = 68
            Width = 68
            Height = 22
            AutoSize = False
            Color = clMoneyGreen
            DataField = 'IPI_PRO'
            DataSource = dsEntradas2
            TabOrder = 2
          end
          object emGeralPro: TDBEdit
            Left = 83
            Top = 68
            Width = 68
            Height = 21
            AutoSize = False
            Color = clMoneyGreen
            DataField = 'GERAL_PRO'
            DataSource = dsEntradas2
            TabOrder = 3
          end
        end
        object EmHodometro: TDBEdit
          Left = 166
          Top = 61
          Width = 57
          Height = 21
          AutoSize = False
          Color = clWhite
          DataField = 'HODOMETRO'
          DataSource = dsEntradas2
          TabOrder = 3
          OnKeyPress = EmVolumeKeyPress
        end
        object EmID_VEICULO: TRxDBComboEdit
          Left = 5
          Top = 61
          Width = 52
          Height = 21
          DataField = 'ID_VEICULO'
          DataSource = dsEntradas2
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FF0975A7075C840C6F9DFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0670A43F
            9AB86E533B15212618769FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FF0670A431CDFF50A8BFFFDAA07C5F451B3B4CFF00FF0052
            86005286FF00FFFF00FFFF00FFFF00FFFF00FF0670A42FBFF028ACDF59D2FE78
            C9E7E3BB8FD7A8792832391D7BAB0052860052860A587EFF00FFFF00FFFF00FF
            0670A443D0FE6CDEFF5CB4DBAEDDF3F1FFFFDEDBD59B88732C5F765FBDE665BF
            E083756117161504557F0C7BAE2998C877DDFFA3E5FFCFF1FFDBF0F95AA9C8B1
            D8E98BCAE5379AC61AABDA4AD0FF2EB8E7D0BE9D7C5639023B57086C9F0670A4
            CDEBF9FAFFFFF2FCFFDBF5FF60BDE00697C6008EBC0089B80BA9D534C7FA33CF
            FF7EB8BF8B6B4C0142620670A4BCDBEA0670A4A1D2E693D9F772DBFF53D6FF33
            C0F1189CCE058CBC00A0CB1FB5E437CBFC23B1E51A6687025F8FFF00FF0670A4
            0670A40670A426A1D226ADE031C2F537C9FB34C4F72AB5E7128DBE0172A10F7B
            AFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0E85B80C7EB213
            93C50B8DC0006C9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          NumGlyphs = 1
          TabOrder = 2
          OnButtonClick = EmID_VEICULOButtonClick
          OnExit = EmID_VEICULOExit
          OnKeyDown = EmID_VEICULOKeyDown
        end
      end
      object GbProduto: TsGroupBox
        Left = 8
        Top = 0
        Width = 911
        Height = 263
        Caption = 'Produtos'
        TabOrder = 1
        SkinData.SkinSection = 'GROUPBOX'
        object DBGrid1: TDBGrid
          Left = 2
          Top = 15
          Width = 907
          Height = 246
          Align = alClient
          Color = clWhite
          DataSource = dsEntradas2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGrid1CellClick
          OnEnter = DBGrid1Enter
          OnKeyDown = DBGrid1KeyDown
          OnKeyUp = DBGrid1KeyUp
          Columns = <
            item
              Expanded = False
              FieldName = 'COD_PRODUTO'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'digo'
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOM_PRODUTO'
              Title.Caption = 'Produto'
              Width = 317
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'VOLUME'
              Title.Alignment = taCenter
              Title.Caption = 'Volume'
              Width = 40
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'QTD_ENTRADA'
              Title.Alignment = taCenter
              Title.Caption = 'Qtd'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUSTO'
              Title.Alignment = taCenter
              Title.Caption = 'Custo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ICMS'
              Title.Alignment = taCenter
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_ICMS'
              Title.Alignment = taCenter
              Title.Caption = 'Vlr. ICMS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUB_TOTAL'
              Title.Alignment = taCenter
              Title.Caption = 'Sub Total'
              Visible = True
            end>
        end
      end
      object Panel3: TsPanel
        Left = 0
        Top = 450
        Width = 922
        Height = 34
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 2
        SkinData.SkinSection = 'PANEL'
        object BtNovEm: TsBitBtn
          Left = 194
          Top = 5
          Width = 75
          Height = 25
          Caption = '&Novo'
          TabOrder = 0
          OnClick = BtNovEmClick
          SkinData.SkinSection = 'BUTTON'
        end
        object BtAltEm: TsBitBtn
          Left = 268
          Top = 5
          Width = 75
          Height = 25
          Caption = '&Alterar'
          TabOrder = 1
          OnClick = BtAltEmClick
          SkinData.SkinSection = 'BUTTON'
        end
        object BtgraEm: TsBitBtn
          Left = 342
          Top = 5
          Width = 75
          Height = 25
          Caption = '&Gravar'
          TabOrder = 2
          OnClick = BtgraEmClick
          SkinData.SkinSection = 'BUTTON'
        end
        object BtcanEm: TsBitBtn
          Left = 416
          Top = 5
          Width = 75
          Height = 25
          Caption = '&Cancelar'
          TabOrder = 3
          OnClick = BtcanEmClick
          SkinData.SkinSection = 'BUTTON'
        end
        object BtexcEm: TsBitBtn
          Left = 490
          Top = 5
          Width = 75
          Height = 25
          Caption = '&Excluir'
          NumGlyphs = 2
          TabOrder = 4
          OnClick = BtexcEmClick
          SkinData.SkinSection = 'BUTTON'
        end
      end
    end
    object TabSheet3: TsTabSheet
      Caption = 'Contas a Pagar'
      ImageIndex = 2
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object sDBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 922
        Height = 121
        Align = alTop
        Color = clWhite
        DataSource = ds_Cp1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'titulo'
            Title.Alignment = taCenter
            Title.Caption = 'T'#237'tulo'
            Width = 83
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'sequencia'
            Title.Alignment = taCenter
            Title.Caption = 'Seq'
            Width = 31
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'dtaven'
            Title.Alignment = taCenter
            Title.Caption = 'Vencto.'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor'
            Title.Alignment = taCenter
            Title.Caption = 'Valor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dtapag'
            Title.Alignment = taCenter
            Title.Caption = 'Dt.Pagto'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor_pago'
            Title.Alignment = taCenter
            Title.Caption = 'Valor Pago'
            Visible = True
          end>
      end
      object GroupBox8: TsGroupBox
        Left = 0
        Top = 121
        Width = 922
        Height = 76
        Align = alTop
        TabOrder = 0
        SkinData.SkinSection = 'GROUPBOX'
        object sLabel1: TsLabel
          Left = 126
          Top = 25
          Width = 85
          Height = 13
          Caption = 'Data Vencimento:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object sLabel2: TsLabel
          Left = 231
          Top = 25
          Width = 27
          Height = 13
          Caption = 'Valor:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object sLabel3: TsLabel
          Left = 78
          Top = 26
          Width = 25
          Height = 13
          Caption = 'Seq.:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label53: TsLabel
          Left = 7
          Top = 25
          Width = 44
          Height = 13
          Caption = 'N'#186' Titulo:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Cpdtaven: TsDateEdit
          Left = 124
          Top = 39
          Width = 93
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
        object Cpvalor: TsCurrencyEdit
          Left = 227
          Top = 39
          Width = 95
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
        object Cpid: TsEdit
          Left = 824
          Top = 24
          Width = 49
          Height = 21
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Text = 'Cpid'
          Visible = False
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
        object Cptitulo: TsEdit
          Left = 5
          Top = 39
          Width = 56
          Height = 21
          Color = clWhite
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 6
          ParentFont = False
          TabOrder = 3
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
        object Cpsequencia: TsEdit
          Left = 76
          Top = 39
          Width = 35
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
        object Btgrava_cp1: TsBitBtn
          Left = 336
          Top = 32
          Width = 161
          Height = 33
          Caption = 'Gravar Altera'#231#245'es'
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFAFAFAF5F5
            F5EFEFEFE8E8E8E4E4E4DDDEDED5D5D4CBCBCBC1C1C1CFCFD0FDFDFDFFFFFFFF
            FFFFFFFFFFFEFEFEEDEDEDD7D7D7CCCCCBC1C1C1BDBDBDB7B7B7B4B5B6ACACAD
            A0A0A19A9A9A979797939394929293706E6B4F49434C453F5750495A51495F59
            54C7C7C7FFFFFFFFFFFFFFFFFFFFFFFF93908E423D38423D37423D3887868793
            929373706F7573719B9B9CA2A2A4A2A2A4A4A4A5A8A8AA6E6A673F362E443C34
            584E455E5349645C538C8B8BE3E3E3FFFFFFFFFFFFDDDDDC37332E25201B2A25
            20342E29A2A1A19B9A9B2A241E3C3732A7A6A7B7B7B9B5B5B6B5B5B6B8B9BB73
            6F6D3B342D4139324A433B4B423B5C554E979696B8B8B8F0F0F0FFFFFFB3B3B2
            030100151210151210201C1AACABACA6A5A5211D19383430B6B5B6C8C8CAC6C6
            C7C6C6C7CBCBCC74716F302A2438312B38322D332D27504A45D6D5D4F1F1F1F7
            F7F7FFFFFFB2B1B10000000303030303020F0E0DB9B8B9B1B0B113110F302D2B
            C4C4C4DADADBD7D7D8D7D7D8DDDDDE757270241F1B2D282325211E1A1713403C
            39E8E7E7FFFFFFFFFFFFFFFFFFB1B1B10000000000000000000A0A0AC6C6C7B9
            B8B80000001C1B1AD2D2D2ECECECEAEAEAEBEBECF3F3F4777573171310231F1B
            141211050503302E2DE5E4E3FFFFFFFFFFFFFFFFFFB3B3B20000000403030101
            010E0E0DDADADAE2E2E25F5E5E808080F4F4F4FFFFFFFBFBFBF4F4F4F1F1F16A
            696812100E1C1A180A0909000000282726E5E4E3FFFFFFFFFFFFFFFFFFB3B3B2
            0000000908070706050B0B0A6F6E6E8483827B7B7B6D6D6C5656554746463C3B
            3B313130272626080807000000000000010101000000282727E4E3E2FFFFFFFF
            FFFFFFFFFFB5B5B40504020E0C0B080604060403000000000000000000000000
            0201000606050E0D0D1615141F1E1E2D2C2C3A3A393332320908070202012A29
            29E2E2E1FFFFFFFFFFFFFFFFFFB8B7B6080502302E2C7F7E7D84848486858588
            88888C8B8B9090909898989FA09FA7A7A7AFAFAFB7B6B6BDBDBDC5C5C5AAAAAA
            1C1A1A0806052D2B2AE1E0E0FFFFFFFFFFFFFFFFFFBAB9B80D09054E4C4ACBCB
            CBCCCCCCCBCCCCCBCBCBCBCBCBCBCBCBCBCBCBCACACAC9C9C9C8C8C8C6C6C6C6
            C6C6C8C8C8ADADAD2422210F0D0B312F2EE0DFDFFFFFFFFFFFFFFFFFFFBCBBBA
            16110D53504ECECECFD0D0D0D0D0D0D0D0D0D0D0D0D1D1D1D1D1D1D1D1D1D1D1
            D1D1D1D1D2D2D2D2D2D2D5D6D6B8B8B82B2825171412363432DFDEDEFFFFFFFF
            FFFFFFFFFFBEBDBB2019145B5754DCDCDCDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF
            DFDFDFE0E0E0E0E0E0E0E0E0E0E0E0E1E1E1E5E5E5C5C5C4332E2C201C183B38
            36DEDEDEFFFFFFFFFFFFFFFFFFC1BFBD29221B635E5BE9E9E9EDEDEDECECECEC
            ECECECECECEDEDEDEDEDEDEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEF3F3F3D1D0CF
            3B363229241F413E3ADDDDDDFFFFFFFFFFFFFFFFFFC4C1BF322A236A6561F1F2
            F2F7F7F7F6F6F6F6F6F6F6F6F6F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7
            F7F7FBFBFCD9D9D8423D38342D274A4642DDDDDDFFFFFFFFFFFFFFFFFFC7C4C1
            3B3229706A65F4F5F5FAFAFAF9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
            F9F9F9F9F9F9F9F9F9F9FDFDFDDBDAD94C4641433C3657524EDDDDDDFFFFFFFF
            FFFFFFFFFFC9C5C3433930756F69F5F5F5FBFBFBFAFAFAFAFAFAFAFAFAFAFAFA
            FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFEFEFEDEDDDC5B544D554D47645F
            5ADDDDDDFFFFFFFFFFFFFFFFFFCAC7C4493F3477716BF0F0F0F6F6F6F4F4F4F4
            F4F4F4F4F4F4F4F4F3F3F3F3F3F3F3F3F3F3F3F3F2F2F2F2F2F2F5F5F5D9D8D7
            69625C69625B726D68DDDDDDFFFFFFFFFFFFFFFFFFCCC9C66B62598A847FE2E2
            E2E9E9E9E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
            E8E8EBEBEBD4D3D277706A59544F75706CE0DFDFFFFFFFFFFFFFFFFFFFCBC8C5
            5F5449857F79F2F3F3FAFAFBF9FAFAFAFAFAFAFAFAFAFAFBFAFBFBFBFBFBFBFB
            FCFBFCFCFBFCFCFCFCFCFFFFFFE5E4E3827B746D6761817C76DEDEDDFFFFFFFF
            FFFFFFFFFFDBD8D66C6157877F78E3E2E0EAE8E6E8E6E5E8E6E5E9E7E5E8E7E5
            E6E4E3E6E5E3E4E3E1E4E2E0E3E2E0E3E2E0E4E3E2D0CECC96908B9D9792A09C
            98E9E8E8FFFFFFFFFFFFFFFFFFFFFFFFF0EEEDEBE9E8EAE8E6EAE8E6E9E7E6E9
            E7E6EAE8E6E9E8E6E8E7E5E9E7E6E8E7E5E8E6E5E8E6E5E8E7E5E7E6E5E8E7E6
            EDECEBECEBEBF0F0EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          TabOrder = 5
          OnClick = Btgrava_cp1Click
          SkinData.SkinSection = 'BUTTON'
        end
      end
    end
  end
  object Panel2: TsPanel
    Left = 0
    Top = 0
    Width = 930
    Height = 89
    Align = alTop
    BevelInner = bvSpace
    BevelOuter = bvNone
    Color = clMoneyGreen
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object Label1: TsLabel
      Left = 5
      Top = 6
      Width = 56
      Height = 13
      Caption = 'Nota Fiscal:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Label47: TsLabel
      Left = 127
      Top = 6
      Width = 84
      Height = 13
      Caption = 'Data Documento:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Label34: TsLabel
      Left = 231
      Top = 6
      Width = 57
      Height = 13
      Caption = 'Fornecedor:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object LbNom_fornecedor: TsLabel
      Left = 298
      Top = 27
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
    object Label37: TsLabel
      Left = 5
      Top = 46
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
      Left = 75
      Top = 68
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
    object PrNr_documento: TsEdit
      Left = 4
      Top = 20
      Width = 74
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyPress = PrNr_documentoKeyPress
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
    object Prdta_documento: TsDateEdit
      Left = 126
      Top = 20
      Width = 91
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
      TabOrder = 2
      Text = '  /  /    '
      OnKeyPress = Prdta_documentoKeyPress
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
    object Prcod_fornecedor: TsComboEdit
      Left = 228
      Top = 20
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
      OnExit = Prcod_fornecedorExit
      OnKeyPress = Prcod_fornecedorKeyPress
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
      OnButtonClick = Prcod_fornecedorButtonClick
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object BTSEQ: TButton
      Left = 79
      Top = 20
      Width = 33
      Height = 21
      Caption = 'Seq...'
      TabOrder = 1
      OnClick = BTSEQClick
    end
    object Prcod_cliente: TsComboEdit
      Left = 4
      Top = 60
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
      OnExit = Prcod_clienteExit
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
      OnButtonClick = Prcod_clienteButtonClick
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
  end
  object sb_entrada: TStatusBar
    Left = 0
    Top = 653
    Width = 930
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object Panel1: TsPanel
    Left = 0
    Top = 601
    Width = 930
    Height = 52
    Align = alBottom
    TabOrder = 2
    SkinData.SkinSection = 'PANEL'
    object SpeedButton1: TsSpeedButton
      Left = 3
      Top = 4
      Width = 46
      Height = 44
      Glyph.Data = {
        6E110000424D6E11000000000000360000002800000026000000260000000100
        18000000000038110000130B0000130B00000000000000000000FFFFFFFEFEFE
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFEFEFEFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF9F9F9F5F5F5F3F3F3F3F3F3F3F3F3
        F3F3F3F4F4F4F4F4F4F4F4F4F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5
        F5F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6
        F6F6F6F6F6F7F7F7F8F8F8F8F8F8FAFAFAFCFCFCFEFEFEFFFFFFFFFFFFFFFFFF
        FFFFF5F5F5EAEAEADFDFDFD8D8D8D7D7D7D7D7D7D8D8D8D8D8D8D8D8D8D9D9D9
        DADADADADADADADADADBDBDBDBDBDBDBDBDBDCDCDCDCDCDCDCDCDCDDDDDDDDDD
        DDDEDEDEDEDEDEDEDEDEDFDFDFDFDFDFE0E0E0E0E0E0E0E0E0E1E1E1E2E2E2E6
        E6E6EEEEEEF6F6F6FBFBFBFEFEFEFFFFFFFFFFFFFFFFE9E9E9D4D4D4BABABAAA
        AAAAA5A5A5A5A4A4A6A5A5A6A6A6A6A6A6A7A7A7A8A8A8A9A9A9A9A9A9ABABAB
        ABABABACACACADACACAEADADAEADADAFAEAEAFAFAFB0B0B0B0B0B0B1B1B1B2B2
        B2B2B2B2B3B3B3B3B3B3B3B3B3B5B5B5B9B9B9C4C4C4D4D4D4E6E6E6F5F5F5FB
        FBFBFEFEFEFFFFFFFFFFE4E4E4C5C5C59E9E9E807F7F777372817B7B88828085
        7F7D857F7D857F7D857F7D86807E86807E87817F87817F88827F88827F88827F
        88827F88827F88827F88827F8882808882808882808882808883808883808883
        808983818B85838F898796908E9C9695989493B6B2B1DFDEDDFDFDFDFFFFE9E9
        E9C9C9C99D9D9D6F6A68999593AFA9A7D9D6D5D9D6D5D9D6D5D9D6D5D9D6D5D9
        D6D5D9D6D5D9D6D5D9D6D5D9D6D5D9D6D5D9D6D5D9D6D5D9D6D5D9D6D5D9D6D5
        D9D6D5D9D6D5D9D6D5D9D6D5D9D6D5D9D6D5D9D6D5D9D6D5D9D6D5D9D6D5D9D6
        D5D9D6D58A828095908FA8A3A2F2F1F1FFFFEFEFEFD2D2D2A5A5A56E6765AFAD
        ACBFBAB8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8
        F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8
        F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F89B9390ADABAB9E98
        97ECEBEAFFFFF5F5F5DDDDDDB3B3B3716A67AFADACBCB6B5F1F1F1F1F1F1F1F1
        F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1
        F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1
        F1F1F1F1F1F1F1F1F1F1F1F19A9290ADABAB9E9897ECEBEAFFFFF9F9F9E8E8E8
        C3C3C3746D6AAFADACB8B3B1E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9
        E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9
        E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9
        9A9290ADABAB9E9897ECEBEAFFFFFBFBFBEFEFEFD3D3D3766F6DAFADACB4AFAD
        E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1
        E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1
        E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E199928FADABAB9E9897ECEBEA
        FFFFFDFDFDF7F7F7E6E6E67A7371AFADACB1ABA9D8D8D8D8D8D8D8D8D8D8D8D8
        D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8
        D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8
        D8D8D8D8D8D8D8D899918FADABAB9E9897ECEBEAFFFFFFFFFFFDFDFDF6F6F67E
        7774AFADACACA6A5CECECECECECECECECECECECECECECECECECECECECECECECE
        CECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECE
        CECECECECECECECECECECECECECECECECECECECECECECECECECECECE99918FAD
        ABAB9E9897ECEBEAFFFFFFFFFFFFFFFFFDFDFD7F7876AFADACA8A2A1C5C5C5C5
        C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5
        C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5
        C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C598918EADABAB9E9897ECEBEAFFFFFFFF
        FFFFFFFFFFFFFF807976AFADACA39E9CBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBC
        BCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBC
        BCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBC
        BCBCBCBC98908EADABAB9E9897ECEBEAFFFFFFFFFFFFFFFFFFFFFF807976AFAD
        ACA09A99B4B4B4B5B5B5B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
        B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
        B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B4B4B4B3B3B398908DADABAB9E98
        97ECEBEAFFFFFFFFFFFFFFFFFFFFFF807976AFADAC9E9997B2B2B2B6B6B6B8B8
        B8B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9
        B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B99D9DBA3535BB2020BC
        A6AFB370D4755CD8639FB9A098908DADABAB9E9897ECEBEAFFFFFFFFFFFFFFFF
        FFFFFF807976AFADAC9E9997B4B4B4B9B9B9BCBCBCBDBDBDBEBEBEBEBEBEBEBE
        BEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBE
        BEBEBEBEBEBEBEBEBEBEBEA6A6BE5151BD4040BDABB6B664DC694CE1539DBB9E
        98908DADABAB9E9897ECEBEAFFFFFFFFFFFFFFFFFFFFFF807976B0ADADA09B99
        B8B8B8BEBEBEC2C2C2C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3BE
        BEC3ABABC2A7A7C2BFC1C1ADC7AEA5C5A6B1B7B198908EAEACAC9E9897ECEBEA
        FFFFFFFFFFFFFFFFFFFFFF807977B6B5B49B959298908E99918F9A92909A9290
        9A92909A92909A92909A92909A92909A92909A92909A92909A92909A92909A92
        909A92909A92909A92909A92909A92909A92909A92909A92909A92909A92909A
        928F99918E978F8DA5A09EB1AFAF9E9998ECEBEAFFFFFFFFFFFFFFFFFFFFFF80
        7977C5C5C5C9C9C9CCCCCCCECECECAC9C8A89F9BDFDBD9FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFBDB3B0B6B0AECECECECECECECECECECCCCCCCACACAB7
        B5B59F9A99ECEBEAFFFFFFFFFFFFFFFFFFFFFF948E8DB8B7B7BCBBBABFBEBDC1
        BFBFBDBBBAA39995DEDAD8FEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEBDB3
        AFACA5A3C1BFBFC1BFBFC0BEBEBFBEBDBDBBBBACA9A8A5A09FEFEEEDFFFFFFFF
        FFFFFFFFFFFFFFD0CECDA19C9BA29D9CA39E9DA49E9DA29B9A968A86DBD6D5FA
        FAFAFAFAFAFBFBFBFBFBFBFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
        FCFCFCFCFCFCFBFBFBFBFBFBFAFAFAFAFAFABBB1AD988E8BA49E9DA49E9DA39E
        9DA39E9DA29D9CA7A2A0D2CFCEFBFAFAFFFFFFFFFFFFFFFFFFFFFFFAFAFAEFEE
        EEEFEEEEEFEEEEEFEEEEE9E7E7B5ABA8D7D2D1F5F5F5F5F5F5F6F6F6F6F6F6F7
        F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F6F6F6F6F6F6
        F5F5F5F5F5F5B8AEAACDC7C5EFEEEEEFEEEEEFEEEEEFEEEEEFEEEEF2F1F1FBFB
        FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F7
        F7BCB2AED3CECCEFEFEFF0F0F0F0F0F0F0F0F0F0F0F0F1F1F1F1F1F1F1F1F1F1
        F1F1F1F1F1F1F1F1F1F1F1F0F0F0F0F0F0F0F0F0F0F0F0EFEFEFB5ABA7D8D3D1
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F7F7BCB2AED0CBC9EBEBEBEBEB
        EBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEB
        EBEBEBEBEBEBEBEBEBEBEBEBEBEBB3A9A5D8D3D1FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF8F7F7BBB1ADCCC7C5E5E5E5E5E5E5E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E5E5E5E5E5E5E5E5E5E5
        E5E5B1A7A3D8D3D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F7F7BBB1AD
        C8C4C2E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0DFDFDFDFDFDFDFDFDFDFDFDFDFDF
        DFDFDFDFDFDFDFE0E0E0E0E0E0E0E0E0E0E0E0E0E0E0AEA4A1D8D3D1FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F7F7BAB0ADC4BFBDDBDBDBDBDBDBDADADA
        DADADADADADADADADAD9D9D9D9D9D9D9D9D9D9D9D9DADADADADADADADADADADA
        DADADADADBDBDBDBDBDBABA19ED8D3D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF8F7F7BAAFACC1BCBAD6D6D6D5D5D5D4D4D4D4D4D4D4D4D4D3D3D3D3D3D3
        D3D3D3D2D2D2D2D2D2D3D3D3D3D3D3D4D4D4D4D4D4D5D5D5D5D5D5D6D6D6A99F
        9CD8D3D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F7F7B9AFACBDB8B6D1
        D1D1D0D0D0CFCFCFCECECECECECECECECECDCDCDCDCDCDCDCDCDCDCDCDCDCDCD
        CECECECECECECECECECFCFCFD0D0D0D1D1D1A79D99D8D3D1FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFF8F7F7B9AFABB9B4B3CCCCCCCBCBCBC9C9C9C9C9C9C8
        C8C8C8C8C8C7C7C7C7C7C7C7C7C7C7C7C7C8C8C8C8C8C8C8C8C8C9C9C9CACACA
        CBCBCBCCCCCCA49A97D8D3D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9
        F9BAAFACAAA29FB8B4B2B7B3B2B6B2B0B5B1B0B4B0AFB4B0AFB3AFAEB3AFAEB3
        AFAEB3AFAEB4B0AFB4B0AFB4B0AFB6B2B0B7B3B1B7B3B2B8B4B3A39895DDD9D7
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEDDD8D7B7AEAAB4AAA6B3A9
        A6B3A9A5B3A9A5B3A9A5B3A9A5B2A8A5B2A8A5B2A8A5B2A8A5B3A9A5B3A9A5B3
        A9A5B3A9A5B3A9A6B3A9A6B4AAA6C7BFBDF4F3F3FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFEFDFDF5F3F3F2F0EFF2F0EFF2F0EFF2F0EFF2F0EFF2F0
        EFF2F0EFF2F0EFF2F0EFF2F0EFF2F0EFF2F0EFF2F0EFF2F0EFF2F0EFF2F0EFF2
        F0EFF8F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      PopupMenu = PopupMenu1
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object Label29: TsLabel
      Left = 617
      Top = 7
      Width = 50
      Height = 13
      Caption = 'Qtd.Pe'#231'as'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object lbqtdpecas: TsLabel
      Left = 623
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
    object BtNov: TsBitBtn
      Left = 98
      Top = 4
      Width = 75
      Height = 44
      Caption = '&Novo'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888888888888888888800000000000888880FFFFFFFFF0888880FFFFFFFFF
        0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF
        0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFF0000888880FFFFFF0F0
        8888880FFFFFF008888888000000008888888888888888888888}
      TabOrder = 0
      OnClick = BtNovClick
      SkinData.SkinSection = 'BUTTON'
    end
    object BtAlt: TsBitBtn
      Left = 172
      Top = 4
      Width = 75
      Height = 44
      Caption = '&Alterar'
      Enabled = False
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000CE0E0000C40E00000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000
        00000000000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0000000000000C0C0C0C0C0C0000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0808000808000808000808000808000000000000000FFFF
        FFC0C0C0000000000000C0C0C0C0C0C0C0C0C0808000808000C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0808000808000000000000000000000000000C0C0C0C0C0C0
        808000C0C0C0808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C08080
        00000000000000C0C0C0C0C0C0808000C0C0C0008080000000000000808080C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808000C0C0C0C0C0C0C0C0C0808000
        C0C0C0C0C0C0008080808080000000000000000000000000000000C0C0C0C0C0
        C0808000C0C0C0C0C0C0808000C0C0C0C0C0C0C0C0C000808080808000000000
        0000000000000000000000C0C0C0C0C0C0C0C0C0808000C0C0C0808000C0C0C0
        C0C0C0C0C0C0C0C0C000808000FFFF00FFFF00FFFFC0C0C00080800000008080
        80C0C0C0808000C0C0C0808000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0008080FF
        FFFF00FFFF00FFFFC0C0C0008080000000000000808000C0C0C0808000C0C0C0
        C0C0C0FFFFFFFFFFFFC0C0C0C0C0C0008080FFFFFF00FFFFFFFFFF00FFFF0000
        00000000808000C0C0C0C0C0C0808000C0C0C0FFFFFFFFFFFFFFFFFFC0C0C0C0
        C0C0008080FFFFFF00FFFF000000000000808000800000000000C0C0C0808000
        C0C0C0C0C0C0FFFFFFFFFFFFC0C0C0C0C0C0C0C0C00080800000000000000000
        00808000800000800000C0C0C0C0C0C0808000C0C0C0C0C0C0FFFFFFC0C0C0C0
        C0C0C0C0C0808080000000000000808000FF0000FF0000800000C0C0C0C0C0C0
        C0C0C0808000808000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808000808000C0C0
        C0800000FF0000FF0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C080800080800080
        8000808000808000C0C0C0800000800000C0C0C0800000FF0000}
      TabOrder = 1
      OnClick = BtAltClick
      SkinData.SkinSection = 'BUTTON'
    end
    object BtGra: TsBitBtn
      Left = 246
      Top = 4
      Width = 75
      Height = 44
      Caption = '&Gravar'
      Enabled = False
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000C40E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
        2222220000000000000220330000008803022033000000880302203300000088
        0302203300000000030220333333333333022033000000003302203088888888
        0302203088888888030220308888888803022030888888880302203088888888
        0002203088888888080220000000000000022222222222222222}
      TabOrder = 2
      OnClick = BtGraClick
      SkinData.SkinSection = 'BUTTON'
    end
    object BtCan: TsBitBtn
      Left = 320
      Top = 4
      Width = 75
      Height = 44
      Caption = '&Cancelar'
      Enabled = False
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000D80E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777777777777777777777777777777777777
        7777777777777778477777444447777748777744447777777477774447777777
        7477774474777777747777477748777748777777777844448777777777777777
        7777777777777777777777777777777777777777777777777777}
      TabOrder = 3
      OnClick = BtCanClick
      SkinData.SkinSection = 'BUTTON'
    end
    object BtExc: TsBitBtn
      Left = 394
      Top = 4
      Width = 75
      Height = 44
      Caption = '&Excluir'
      Enabled = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
        03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
        33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
        0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
        3333333337FFF7F3333333333000003333333333377777333333}
      NumGlyphs = 2
      TabOrder = 4
      OnClick = BtExcClick
      SkinData.SkinSection = 'BUTTON'
    end
    object BtLocalizar: TsBitBtn
      Left = 679
      Top = 4
      Width = 79
      Height = 44
      Caption = '&Localizar'
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000220B0000220B00000001000000010000E78C3100B56B
        4A00E79C52008C635A0094635A00A5635A00A56B5A00BD7B5A00FFB55A004A52
        630094636300A5636B00A5736B00AD7B6B00BD846B00C6846B00D6946B00AD7B
        7300B58C7300DE9C7300AD847B00B58C7B00E7AD7B00EFBD7B00EFC67B005A63
        8400636B84006B6B8400B58C8400CEA58400EFBD8400EFC68400F7C68400AD8C
        8C00EFC68C00F7CE8C00BD949400B5AD9400EFC69400EFCE9400F7CE9400CEA5
        9C00D6B59C00EFCE9C00DEBDA500EFCEA500F7D6A500427BAD00EFD6AD00F7D6
        AD00DEC6B500DECEB500EFD6B500F7D6B500F7DEB500D6BDBD00DEC6BD00F7DE
        BD00186BC600DEC6C600DECEC600F7E7C600FFEFC600F7E7CE001073D600FFFF
        D600F7EFDE00FFEFDE00F7EFE700FFEFE700FFF7E700F7F7EF00FFF7EF00FFFF
        EF00FFF7F700FFFFF700FF00FF0031A5FF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004C4C0B0B0B0B
        0B0B0B0B0B0B0B0B0B4C4C4C093E35302B27221E171E1E1F0B4C4C1A3A1A3930
        2D2B26221E17171F0B4C4C4C4D401B39342D2B26221E171F0B4C4C4C054D4019
        39302D2B26221E1F0B4C4C4C0C484D2F0311040D1D26221F0B4C4C4C0C4E4421
        1C2C342A121D26220B4C4C4C0E4E4814323F3D4B2A0D2B270B4C4C4C0E4E4E0A
        42423F4934042D2E0B4C4C4C104E4E1C3B4442412C11312D0B4C4C4C104E4E37
        243B42321C1533250B4C4C4C134E4E4E371C0A14290606060B4C4C4C134E4E4E
        4E4E4B4B37060200014C4C4C164E4E4E4E4E4E4E3B0608074C4C4C4C16474747
        4747474737060E4C4C4C4C4C161010101010101010064C4C4C4C}
      TabOrder = 5
      OnClick = BtLocalizarClick
      SkinData.SkinSection = 'BUTTON'
    end
    object BtnNFE: TsBitBtn
      Left = 468
      Top = 4
      Width = 129
      Height = 44
      Caption = 'Importar NFe'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        B6160000424DB61600000000000036000000280000002F000000280000000100
        1800000000008016000000000000000000000000000000000000F4F4F4F4F4F4
        F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
        F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F4F3F3F4F4F5
        F5F5F3F1EDF1F4F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
        F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
        F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
        F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
        F4F4F4F4F4F4F3F4F3F4F3F5F4F7F7F1E4D9F1D3C1F3E8E2F4F5F6F3F4F3F4F4
        F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
        F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
        F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
        F4F5F5F5F4F4F4F5F5F5F4F4F4F4F4F4F4F4F4F4F3F4F4F4F4F3F5F5F3EEEBF9
        D1AEE7AC84EFCDB9F5EEEAF3F4F5F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
        F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
        F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
        F4F4F4F4F4F4F4F4F5F5F5F1F1F1E9E9E9E5E5E5E6E6E6EAEAEAF0F0F0F4F4F4
        F4F4F4F2F6F4F4F3F5F1DED4F4CDAEFFD8B6F8CDA6EBB088EFD4BFF5F1F1F4F5
        F5F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
        F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
        F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F5F5F4ECEAECD9D3D8D3CC
        D0D2CBD1D0CCCFCFCECED2D4D3DCDDDDE9E9E9F1F1F0F5DCCDFBD0ACFFD7B3FF
        D5B5FFD8B7FBD4AFEAA982F0DFCEF6F3F4F4F4F4F3F4F4F4F4F4F4F4F4F4F4F4
        F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
        F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
        F4F4F4F5F5F3EEF1CFD2CDA6C8AC7FB78D77B58694BDA0B8C4B9BBB4B7B1ABAE
        B5B4B6C9C1BAFACDABFFD7B5FFD6B5FFD6B5FFD5B5FFDBBBE9AB80ECAF89F2E6
        DEF4F5F6F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
        F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
        F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3FBF5FCCCDCCD65B3791D883F4DA0
        6361A76B479D54258C413B985884AD959CACAFACA3AABBADA4F4C8A6FCD5B2FE
        D8B6FED7B6FBD3B2FAD2ABEDB286F2D8CAF4F5F7F3F4F4F3F4F3F3F4F4F4F4F4
        F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
        F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F6
        F5F6EDF0EB7FBD8D2B8C4CE8EBE5FFFFFF58DCE127C4BC5BC9B163B485238D44
        22945245B1A074AAB4B8A8A7E0BAA0F8CBA9F8CDADFCD4B3FFDAB9F4C39AF1D2
        C0F3F5F7F4F5F5F4F4F4F4F4F3F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
        F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
        F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F9F6F9CBE2CD419B5CA3C1ADFFF6FD63DD
        DD08B9B269C4C0DAE7ECF3FAFBD7E9DB6FB6841A8739249E6F22AAAD83A1A0E7
        B999F8CCA6F9CFAAFAD2B1F0BB94EFB38FF3E2DAF4F3F5F1F6F5F2F4F5F4F4F4
        F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
        F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4FC
        F7FBB6DBBB2F924BD2CFCFE1EFF120CBC941BCB0E0CCCDF3F1F0F7F5F5F9F7FA
        FCF9F8BAD9C0439A56178F4E9EAE95DDB098DAB99CF4CBAEFED7B8F9D2ACE698
        66ECAF84EED0B9F3E4DCF4F1F3F4F2F2F3F2F4F4F4F4F4F4F4F4F4F4F4F4F4F4
        F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
        F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4FCF7FBB2D5B5329250D5CFCFB6E4E412C6
        BE8AC2BDD6CED0F1F1F1F4F4F4F4F3F4F5F4F5FFFAFFDDECDD69B37F1C873BBF
        B993E0B099DBB79CF1C8A9FAD1B0FDD8B3E9A272E69967EDAF87EEC3A5EFC3A6
        F0D6C5F3EFF1F4F4F5F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
        F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4FB
        F7FBB7D9BC369551D0CAC9A0DDDF13C2BD9BC4C2D0CCCDEEEEEEF4F5F5F5F3F4
        F2F6F5F5F2F0F9D5C3EBCCAE8CC79312853AA4AD87D1A48FD5AF92F8CFAEFFD9
        B7FEDCBAFACFADEB9E6BEA9E6DEA9C6BEBA579F0D7C7F6F4F5F3F4F4F4F4F4F4
        F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
        F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4FAF6F9C5E0CA409E5ABAC0B7A6D5DB15C4
        BD91C6C3CFC8C8EAEAEAF5F5F5F4F4F5F6F4F3D1B59E936A4E8265527C6A5881
        AC851083366A7D5B8A6A5DA68E76E8C1A5FCD2AFFAD3B1F9D0ADF9D5B2FBD8B6
        EAA778EDB18DF2E6DEF2F6F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
        F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F8
        F5F7D7E9DA59AB7090B299BED0D51EC5C06CC6BECFC6C6E1E1E1F5F5F5F2F2F1
        E0E3E0E3DED9FDFFFFFFFFFFFFFFFFF6F6F49BC8A3188C3F5D6E515E4740927D
        67F5CBAAFFD7B8FFD7B6FFD8B5F9CEAEF6C99FE79863ECC5AAF4F1EEF3F4F5F4
        F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
        F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F5F4F5F2F3F17EBD8A5EA26FDBCED62DC4
        C43AC0B4D6C9CAD5D5D5F1F1F1FBFCFCFFFFFFFFFFFFFFFFFFFEFFFCFDFEFCFF
        FFFFFFFFFF9DD0AA1A8F43878969987162DBB99EF8D1B2FFD7B6FFD6B4FCD4B2
        FBD7B7EEAF84EBAE85F5E7E2F4F5F6F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
        F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
        F3F4FCFAFCA9D3B0399656D5CBC95EC4C50EB9AECCCFCFCBC8C8F4F4F4FFFFFF
        FFFFFFC5BFB8CEAE96FDD2ADFBD2AEF9D0ACF7D0B4F8E3CE8DC79C1B8941D2B7
        9AD3AD95E6BFA1FDD3B3FFD6B5FFD6B6F8D0ABFAD3AFE89A6AF0D5C1F6F3F8F3
        F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
        F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F4F3FBF5F9D4E6D553AB6C99B79C96C4
        C914BBB38CCBC5CAC3C4FFFFFFFFFFFFCCCBC8725C4AFCD2B0FED4B3FAD0ADF8
        CAA8FFD8B5FFD5B4F0D9B875B582268C44E5B9A0D0AE95EBC5A6FED5B3FFD7B6
        F9D0AFFAD2ACE99E6BEEC2A2F2F0EFF4F4F5F4F4F4F4F4F4F4F4F4F4F4F4F4F4
        F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3
        F4F3F5F4F5F7F6F691C497459C63DACDD32CB8B92DBCADDFD3D6FFFFFFFFFFFF
        847263987C68FDD3B1FFD9B7FFD7B5FDD4AEFFDCB9FFDAB8FFDCB9E8DDBE53A7
        69589B5FE3B59FD4B397F4CBACFFD6B5FFD8B5FAD4B4EEAE80EBB48FF2EEEAF4
        F5F6F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
        F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F3F3F4F3F3FAF8FAC4E0C74AA260B3C0
        AD74BDC20AB4A5AAD7D3FFFFFFFFFFFF7866547B6552AF927CB1937BB0937AB3
        9277AF8E76B2937BB1927BB69078AAB797228D4697A97ED9B096DCBA9DFAD3B1
        F9D1AFFAD3B2F3BE92ECB08BF5ECEAF4F6F6F3F4F4F3F4F4F4F4F4F4F4F4F4F4
        F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F3F4
        F4F4F4F4F4F5F4F5F4F5F386C2904E9E64CCCBD22BB0AE4FAF9CFFFFFFFFFFFF
        B8B0A8A89F94A99F95A99F95A99F96A99F96A99E94A99D94A99E95AAA2989381
        748EB68D12823AD8B89AD0A98CE7BF9DFFD6B6FFDABAEFB589EAAB81F2E4DBF2
        F4F6F4F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
        F4F4F4F4F4F4F4F4F4F3F4F4F3F4F4F4F4F5F4F4F4F4F4F5FCF9FCC7DFCD4DA6
        67A1AE8D99937B8E865AFFFEFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFDDD7D37D6F5C70B27D44934EE5B4A0D8B397
        F7CDAEFFDABAEFB78AE99966ECB696F1E2D8F5F4F8F2F4F4F4F4F4F4F4F4F4F4
        F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F3F4F4F4F4F5F5F3F7F2
        ECEAF0D8C9F2D8CBF6EAE6F9F6F893C89F3F9A54CE9E7CE1B598F2E5DDFFFFFF
        EEECEA907F71B09E91FADCC7FDE2C9FAE0C7FBE1C8F7D8C0F8E4D0FFFFFFF4F5
        F1644334B1BB9B2C944FA0AF82D7AE95E1BDA1FED5B6FCD5B4E7A374E89B66EE
        C1A5F6EEEAF5F5F6F4F4F4F3F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
        F4F4F4F4F4F4F3F4F5F3EEEBF0D7C9ECC3A5EDA375E99E6EEAB997F8DBD0D8D5
        B663B37D77A878DFAF96DDBEA5FCFFFFFFFFFF8C76636C5945BA9B83FFD6B3FF
        D9B7FFD8B1FCD1ABFBE0C4FFFFFFFEFFFD634B3AC7A68EA4CCA421873DE0B89E
        D2AF95F2CCACFFD9B9F9D2AFE4935EEBA376EECAB4F3EEEBF2F5F6F4F4F4F3F4
        F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F3F3F5EFD3C0E99E70F3
        BF96F5CAA5F4C49AE99B69E69F70FFD3AEB4D2AF41A061B0AF86D5A589E3D9D3
        FFFFFFF7F4EF7F634F73604EAA927BE7C3A7FAD4B2F7CBA7F2E1CEFFFFFFEFEE
        EE6C5745E7B897E5D9B6449E6085A673DAAE97E4BD9EFFD6B6FAD4B3F2C398E6
        965EE9A473EFCFB9F7F1F4F3F4F4F4F3F4F4F4F4F4F4F4000000F4F4F4F4F4F4
        F4F4F3F2F5F6F3E8E4F1C09FF7CAA5F6CAA4FFDAB9FDD6B6FAD6B1F1B992F9CF
        A8FED8B88DC79B3F9D5CDCB599D1AD8FECEAEAFFFFFFF8F4F1967C6D69503F74
        5B478165519B8471FEFFFFFFFFFFBDB9B3AE8B6FFDD4B0FFD9BBACCAA01D8740
        DCB49BD3AE92F5CFAEF7CBAAF9D4B4F2BF93EA9763E9AD85F3E4DAF2F6F6F4F4
        F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F3F3F6F8F4E4D9FED5B1FED7B9FC
        D4B4FBD1B1FED5B4FED6B6FFD9B8FED4B5FDCFADE4D4B16CB7865BA565DEAF96
        D3A98CF1E6E6FFFFFFFFFFFFF5F4F2D9D5D4E1E1DEFFFFFFFFFFFFFCFFFFC0A0
        87F8CCA7FBD3AFFFD7B7E5D8B94AA1628BA071D5AC92E4BD9EFCD4B1FAD5B0FD
        DABAE9A16FE9A170F1D5C6F5F5F7F3F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
        F4F4F4F3F7FAF5D4B3FDD2B0FCD3B1FED6B5FFD6B5FFD6B5FFD5B5FFD5B4FFD6
        B5FED5B5FFD7B5C7D4B152A87083AE7DDFAB93D4AE8FEFD8C3FEF9F6FFFFFFFF
        FFFFFFFFFFFEFFFFFAF4EDEFCCB0FDD0A8FDD6B3FAD2AFFAD1AFFFD9BA9FC89D
        308C47DDAF95D6AD8FFACDADF9D0A9FAD6B6EDAF7DE7A06FF1D7C9F3F6F7F4F4
        F4F4F4F4F4F4F4000000F4F4F4F4F4F4F3F3F4F4F5F6F4EBE0FFD5B0FFD8B7FF
        D6B5FFD5B4FFD6B5FFD8B6FFD8B7FFD7B6FED6B4FFD7B6FFDABBB6D1AA40A061
        A1B084DBB096DAB495F3C6A4FCD2B2FDDABCFDDBBCFCD3B3FFD2AEF9D0ACFBD3
        B2FFD6B5FFD6B5FCD4B3FECDACD5D9B42F934EB8AE8BD4AB92F0C5A0F6CDA9FD
        D8B6E9A174EAAF85F2E3DAF4F4F6F3F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
        F3F3F4F4F4F4F5F6F8E9C4ACF3CAA8FFD6B3FFD6B5FCD4B2EFC7AAF1C8ABFCD2
        B3FFD7B5F5CDADF2C9AAFCD1B4A4CEA6399C5AB2B891DAAF94D9B59CF3C9ABFF
        D4B3FFD5B4FFD5B4FFD6B5F9CEAAF9D0ACFFD6B6FFD5B5FFD6B5FCD2AFF3D7B6
        6CB3796D9E67DBAE98EEC4A3FFD3B0F3CBA5DFBCA8F4E0D4F2F1F1F3F5F4F4F3
        F4F4F4F4F4F4F4000000F4F4F4F4F4F4F3F3F3F5F5F5EEEFF08F918E7F736CE9
        CAB0FFDABAE0BFA38A7768766350C7A78EFFE0C2C7AC95766354AE927AFEDCBB
        9AC99E399A5DBBB995D8B196D8B498EEC8A9FED5B3FFD6B5FFD6B5FFD7B6F9CF
        AFFFD6B5FFD6B4FFD6B5FAD1B0FFD7B7A5CA9E388C4CDFB29BC7A27F999F7DCF
        BBB1D7D6D7F0F5F4F4F4F5F4F3F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
        F3F3F3F5F5F5FFFFFFEEEEEE616465D0CDCBFBEFE1FFFFFFFFFFFF736154A688
        6FFFFFFEFFFFFF9A8E878D735DFFD6B5FAD9B98EC89B389B5BB7BA95DDB098D4
        B296EBC4A4FCD2B1FFD6B6FED6B5FFD6B5F7CFADFED6B6FFD8B6FFD8B5FECCA7
        C6D1AF2A8F46CCAC967DA69336BCB0D5CCCFCFCED0F2F2F2F4F4F4F4F4F4F4F4
        F4F4F4F4F4F4F4000000F4F4F4F4F4F4F3F3F3F3F3F3FFFFFFFFFFFF5F6062B3
        ABA9FFFFFFFFFFFFFFFFFF998C8191725CFDF0E1FFFFFFBDB7AE7A624FF4CEB0
        FFDEBDFCD9BA99CB9F379B5DACB88EE5B49BD0B094E5BEA2F8CFAFFFD5B5FFD7
        B6FAD2AFFFD9B9EFBF95F2D0B9F8E6DCD4E2D0399857B6BFB482C3C51BBEB5CA
        CFCECDCBCCEFEFEFF4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
        F4F4F4F2F2F2FEFEFEFFFFFF767877A5A09FFFFFFFF1EFEFFFFFFFBDB5AE7B62
        4CEFDBC8FFFFFFDFDCD85E46369C7F68A7866CAF8B71CDB096A2CFA4399E5B8D
        B283E4B497D3AF96DDB89BFAC9ACFFD2AFF0C29EE9BF9FF0DED3F5F0F3F9F8FC
        DDEBDE439E60A9B7A895CCC91EC1B7BEC9CBCECBCBEFEFEFF4F4F4F4F4F4F4F4
        F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F3F3F3FBFBFBFFFFFF989796C0
        C2C0FFFFFF9B8C82FFFFFFDEDBD8695543DCC2A6FFFFFFFEFFFFD2CDC9D4D0CF
        D8D4D3908177997F67FFD8B9B4D2AB4CA5685EA66ED7BB9AD8AB926A967EA0AB
        A2C8BABACCCCCEE2E2E3EFF0F0FAF6F9D9E7D93E9A59AFBAAE96D3D319C0B5BC
        C4C5D3CFD0F2F2F2F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
        F4F4F4F3F3F3F8F8F8FFFFFFB3B3B3FBFCFCE7E5E2896C57FFFFFFFFFFFF644F
        43C5A489FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECD8F9CDABFFDAB7FFD6B5CB
        D1AE6FB4833E9C5A7DA97D40AAA204989053A7A5B0B2B1BFB5B6C7C3C3D6D0D5
        B5D5BA298B48DACCCE6DD5D21FB9AFCAC3C4E1DDDEF5F5F5F4F4F4F4F4F4F4F4
        F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F3F3F3F5F5F5FFFFFFF7F7F7FF
        FFFFA9A6A5B09F91FFFFFFFFFFFF6D6E6DA07C63FFFFF9FFFFFF88796C684E3D
        AEA7A3B2A293BAA28DDFB698F9CFB3FFD5B4F2D8B69CC9A04BA3624FA36957BB
        A126ACA1119D9651A4A590A3A8AFB8AD6FB17B59976599CFD426C4B85EBBB5DB
        CFD0EFEFEFF5F5F5F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
        F4F4F4F3F3F3F3F3F3FFFFFFFFFFFFFFFFFF777A79D7DBDCFEFFFFFFFFFF9695
        9493725DFBEFE2FFFFFFDFDCD8BBB2ACBDBEBFC4C4C86F7073A5A4A3F9F9FAF2
        F7F7FCD4B4FCC7A9DAE2CE88C2984FA05E4A9E5B54AC794FAE8155B38846A463
        27904E34BDB313BBAF34BBB2E0D7D8EEECECF5F5F5F4F4F4F4F4F4F4F4F4F4F4
        F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F2F2F2FFFFFFFFFFFFF9
        F9F9D9D9D9F3F3F3FAFAFAFFFFFFEEE8E3DDCABEF5EFECFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFE5E5E5E2E2E3F5F5F5F3F5F7F4E8DFF4E1D3F9F3F3FDFAFFE1ED
        E4B4D5B97EB98B62AA7462AB757AC3A057D1CB56CDCCA0DEDAF8EEEFF6F3F3F5
        F5F5F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000F4F4F4F4F4F4
        F4F4F4F4F4F4F3F3F3F3F3F3F3F3F3F4F4F4F6F6F6F4F4F4F3F3F3F4F3F3F3F7
        F6F5F8FAF5F5F4F2F3F5F0DDCFF3ECEBF2F3F3F3F3F3F6F6F6F6F6F6F4F4F4F4
        F4F3F4F4F7F3F4F7F4F4F4F2F4F4F7F5F6FBF8FBFFFBFFFFFCFFFFFCFFFFF9FE
        FFF8FAFFF8F8FEF6F7F7F4F4F6F4F4F3F4F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4
        F4F4F4F4F4F4F4000000F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F3F3F3F3F3F3
        F3F3F4F4F4F4F4F4F3F3F3F3F3F3F4F3F4F4F4F3F3F3F4F4F4F4F5F5F7F5F4F4
        F3F3F3F3F3F3F4F4F4F4F4F4F4F4F4F4F4F4F3F4F3F4F4F3F4F4F3F4F3F3F4F3
        F4F4F3F4F3F3F4F4F3F4F4F3F3F3F4F3F4F4F4F4F4F4F4F4F4F3F4F4F3F4F3F4
        F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4000000}
      ParentFont = False
      TabOrder = 6
      OnClick = BtnNFEClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object MainMenu1: TMainMenu
    Left = 264
    Top = 192
    object ReabrirNota1: TMenuItem
      Caption = 'Reabrir Nota'
      OnClick = ReabrirNota1Click
    end
    object ransferirMercadoriasparaLojaDestino1: TMenuItem
      Caption = 'Transferir Mercadorias para Loja Destino'
      Visible = False
      OnClick = ransferirMercadoriasparaLojaDestino1Click
    end
  end
  object q_entrada2: TFDQuery
    Connection = dao.CN
    Left = 128
    Top = 241
  end
  object q_entrada1: TFDQuery
    Connection = dao.CN
    Left = 96
    Top = 241
  end
  object PopupMenu1: TPopupMenu
    TrackButton = tbLeftButton
    Left = 400
    Top = 187
    object gsdfg1: TMenuItem
      Caption = 'Imprimir Nota Fiscal'
      OnClick = gsdfg1Click
    end
    object dfgsdfgsdf1: TMenuItem
      Caption = 'Relat'#243'rio de Entradas'
    end
    object sdfgsdf1: TMenuItem
      Caption = 'Imprimir Etiqueta ref. Entrada'
    end
    object RomaneiodeTransfernciadeMercadoria1: TMenuItem
      Caption = 'Romaneio de Transfer'#234'ncia de Mercadoria'
      OnClick = RomaneiodeTransfernciadeMercadoria1Click
    end
    object ImprimirEtiquetaUnitria1: TMenuItem
      Caption = 'Imprimir Etiqueta Individual'
    end
    object EspelhodeNotacomPreodeCustoeVenda1: TMenuItem
      Caption = 'Espelho de Nota com Pre'#231'o de Custo e Venda'
      OnClick = EspelhodeNotacomPreodeCustoeVenda1Click
    end
  end
  object RD: TRDprint
    ImpressoraPersonalizada.NomeImpressora = 'Modelo Personalizado - (Epson)'
    ImpressoraPersonalizada.AvancaOitavos = '27 48'
    ImpressoraPersonalizada.AvancaSextos = '27 50'
    ImpressoraPersonalizada.SaltoPagina = '12'
    ImpressoraPersonalizada.TamanhoPagina = '27 67 66'
    ImpressoraPersonalizada.Negrito = '27 69'
    ImpressoraPersonalizada.Italico = '27 52'
    ImpressoraPersonalizada.Sublinhado = '27 45 49'
    ImpressoraPersonalizada.Expandido = '27 14'
    ImpressoraPersonalizada.Normal10 = '18 27 80'
    ImpressoraPersonalizada.Comprimir12 = '18 27 77'
    ImpressoraPersonalizada.Comprimir17 = '27 80 27 15'
    ImpressoraPersonalizada.Comprimir20 = '27 77 27 15'
    ImpressoraPersonalizada.Reset = '27 80 18 20 27 53 27 70 27 45 48'
    ImpressoraPersonalizada.Inicializar = '27 64'
    OpcoesPreview.PaginaZebrada = False
    OpcoesPreview.Remalina = False
    OpcoesPreview.CaptionPreview = 'Rdprint Preview'
    OpcoesPreview.PreviewZoom = -1
    OpcoesPreview.CorPapelPreview = clWhite
    OpcoesPreview.CorLetraPreview = clBlack
    OpcoesPreview.Preview = True
    OpcoesPreview.BotaoSetup = Ativo
    OpcoesPreview.BotaoImprimir = Ativo
    OpcoesPreview.BotaoGravar = Ativo
    OpcoesPreview.BotaoLer = Ativo
    OpcoesPreview.BotaoProcurar = Ativo
    OpcoesPreview.BotaoPDF = Ativo
    OpcoesPreview.BotaoEMAIL = Ativo
    Margens.Left = 10
    Margens.Right = 10
    Margens.Top = 10
    Margens.Bottom = 10
    Autor = Deltress
    RegistroUsuario.NomeRegistro = 'CLAUDIO TOMASI'
    RegistroUsuario.SerieProduto = 'SINGLE-0415/02048'
    RegistroUsuario.AutorizacaoKey = 'O9IT-2CS2-OB3L-DAW1-8E87'
    About = 'RDprint 5.0 - Registrado'
    Acentuacao = Transliterate
    CaptionSetup = 'Configura'#231#227'o'
    TitulodoRelatorio = 'Gerado por RDprint'
    UsaGerenciadorImpr = True
    CorForm = clBtnFace
    CorFonte = clBlack
    Impressora = Epson
    Mapeamento.Strings = (
      '//--- Grafico Compativel com Windows/USB ---//'
      '//'
      'GRAFICO=GRAFICO'
      'HP=GRAFICO'
      'DESKJET=GRAFICO'
      'LASERJET=GRAFICO'
      'INKJET=GRAFICO'
      'STYLUS=GRAFICO'
      'EPL=GRAFICO'
      'USB=GRAFICO'
      '//'
      '//--- Linha Epson Matricial 9 e 24 agulhas ---//'
      '//'
      'EPSON=EPSON'
      'GENERICO=EPSON'
      'LX-300=EPSON'
      'LX-810=EPSON'
      'FX-2170=EPSON'
      'FX-1170=EPSON'
      'LQ-1170=EPSON'
      'LQ-2170=EPSON'
      'OKIDATA=EPSON'
      '//'
      '//--- Rima e Emilia ---//'
      '//'
      'RIMA=RIMA'
      'EMILIA=RIMA'
      '//'
      '//--- Linha HP/Xerox padr'#227'o PCL ---//'
      '//'
      'PCL=HP'
      '//'
      '//--- Impressoras 40 Colunas ---//'
      '//'
      'DARUMA=BOBINA'
      'SIGTRON=BOBINA'
      'SWEDA=BOBINA'
      'BEMATECH=BOBINA')
    PortaComunicacao = 'LPT1'
    MostrarProgresso = True
    TamanhoQteLinhas = 67
    TamanhoQteColunas = 142
    TamanhoQteLPP = Oito
    NumerodeCopias = 1
    FonteTamanhoPadrao = S17cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    OnNewPage = RDNewPage
    Left = 344
    Top = 176
  end
  object XMLGeral: TXMLDocument
    Left = 544
    Top = 272
    DOMVendorDesc = 'MSXML'
  end
  object mmEntradas2: TRxMemoryData
    AutoCalcFields = False
    FieldDefs = <>
    Left = 440
    Top = 48
    object mmEntradas2ID: TIntegerField
      FieldName = 'ID'
    end
    object mmEntradas2NR_DOCUMENTO: TIntegerField
      FieldName = 'NR_DOCUMENTO'
    end
    object mmEntradas2COD_FORNECEDOR: TIntegerField
      FieldName = 'COD_FORNECEDOR'
    end
    object mmEntradas2COD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
    end
    object mmEntradas2QTD_ENTRADA: TBCDField
      FieldName = 'QTD_ENTRADA'
      DisplayFormat = '#,###,##0.00'
    end
    object mmEntradas2CUSTO: TCurrencyField
      FieldName = 'CUSTO'
    end
    object mmEntradas2ICMS: TFloatField
      FieldName = 'ICMS'
    end
    object mmEntradas2VALOR_ICMS: TCurrencyField
      DisplayWidth = 15
      FieldName = 'VALOR_ICMS'
    end
    object mmEntradas2SUB_TOTAL: TCurrencyField
      DisplayWidth = 15
      FieldName = 'SUB_TOTAL'
    end
    object mmEntradas2CUSTO_FINAL: TCurrencyField
      FieldName = 'CUSTO_FINAL'
    end
    object mmEntradas2ID_COR: TIntegerField
      FieldName = 'ID_COR'
    end
    object mmEntradas2ID_TAMANHO: TIntegerField
      FieldName = 'ID_TAMANHO'
    end
    object mmEntradas2NUMERACAO: TIntegerField
      FieldName = 'NUMERACAO'
    end
    object mmEntradas2COD_COLECAO: TIntegerField
      FieldName = 'COD_COLECAO'
    end
    object mmEntradas2VOLUME: TFloatField
      FieldName = 'VOLUME'
    end
    object mmEntradas2NOM_PRODUTO: TStringField
      FieldName = 'NOM_PRODUTO'
      Size = 100
    end
    object mmEntradas2CUSTO_PRO: TFloatField
      FieldName = 'CUSTO_PRO'
      currency = True
    end
    object mmEntradas2IMPOSTO_PRO: TCurrencyField
      FieldName = 'IMPOSTO_PRO'
    end
    object mmEntradas2IPI_PRO: TCurrencyField
      FieldName = 'IPI_PRO'
    end
    object mmEntradas2GERAL_PRO: TCurrencyField
      FieldName = 'GERAL_PRO'
    end
    object mmEntradas2IMAGEM_PRO: TBlobField
      FieldName = 'IMAGEM_PRO'
    end
    object mmEntradas2ID_VEICULO: TIntegerField
      FieldName = 'ID_VEICULO'
    end
    object mmEntradas2HODOMETRO: TIntegerField
      FieldName = 'HODOMETRO'
    end
  end
  object dsEntradas2: TDataSource
    AutoEdit = False
    DataSet = mmEntradas2
    Left = 488
    Top = 48
  end
  object q_foto: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      
        'select p.cod_produto, p.subcategoria, s.imagem_bd, p.QTD_ESTOQUE' +
        ', p.QTD_RESERVADO, (p.QTD_ESTOQUE + p.QTD_RESERVADO) as qtd_tota' +
        'l, p.QTD_EMBALAGEM, p.UNIDADE'
      'from'
      '  produto p'
      'inner join subcategoria s on (s.ID = p.SUBCATEGORIA)'
      'where p.cod_produto =:produto')
    Left = 240
    Top = 496
    ParamData = <
      item
        Name = 'produto'
        DataType = ftInteger
        FDDataType = dtInt64
        ParamType = ptInput
      end>
    object q_fotocod_produto: TIntegerField
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_fotosubcategoria: TIntegerField
      FieldName = 'subcategoria'
      Origin = 'subcategoria'
    end
    object q_fotoimagem_bd: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'imagem_bd'
      Origin = 'imagem_bd'
    end
    object q_fotoqtd_estoque: TBCDField
      FieldName = 'qtd_estoque'
      Origin = 'qtd_estoque'
      Precision = 15
      Size = 2
    end
    object q_fotoqtd_reservado: TBCDField
      FieldName = 'qtd_reservado'
      Origin = 'qtd_reservado'
      Precision = 15
      Size = 2
    end
    object q_fotoqtd_total: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'qtd_total'
      Origin = 'qtd_total'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object q_fotoqtd_embalagem: TBCDField
      FieldName = 'qtd_embalagem'
      Origin = 'qtd_embalagem'
      Precision = 15
      Size = 3
    end
    object q_fotounidade: TStringField
      FieldName = 'unidade'
      Origin = 'unidade'
      FixedChar = True
      Size = 3
    end
  end
  object ds_Cp1: TDataSource
    AutoEdit = False
    DataSet = q_cp1
    Left = 296
    Top = 232
  end
  object q_cp1: TFDQuery
    AfterScroll = q_cp1AfterScroll
    Connection = dao.CN
    SQL.Strings = (
      'select * from cp1')
    Left = 256
    Top = 232
    object q_cp1id: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object q_cp1cod_fornecedor: TIntegerField
      FieldName = 'cod_fornecedor'
      Origin = 'cod_fornecedor'
    end
    object q_cp1nr_documento: TStringField
      FieldName = 'nr_documento'
      Origin = 'nr_documento'
      FixedChar = True
      Size = 8
    end
    object q_cp1titulo: TStringField
      FieldName = 'titulo'
      Origin = 'titulo'
    end
    object q_cp1sequencia: TIntegerField
      FieldName = 'sequencia'
      Origin = 'sequencia'
    end
    object q_cp1dtaven: TDateField
      FieldName = 'dtaven'
      Origin = 'dtaven'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object q_cp1dtapag: TDateField
      FieldName = 'dtapag'
      Origin = 'dtapag'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object q_cp1valor: TBCDField
      FieldName = 'valor'
      Origin = 'valor'
      currency = True
      Precision = 15
      Size = 2
    end
    object q_cp1obs: TMemoField
      FieldName = 'obs'
      Origin = 'obs'
      BlobType = ftMemo
    end
    object q_cp1cod_fop: TIntegerField
      FieldName = 'cod_fop'
      Origin = 'cod_fop'
    end
    object q_cp1historico: TStringField
      FieldName = 'historico'
      Origin = 'historico'
      Size = 1000
    end
    object q_cp1valor_pago: TBCDField
      FieldName = 'valor_pago'
      Origin = 'valor_pago'
      currency = True
      Precision = 15
      Size = 2
    end
    object q_cp1saldo_devedor: TBCDField
      FieldName = 'saldo_devedor'
      Origin = 'saldo_devedor'
      currency = True
      Precision = 15
      Size = 2
    end
    object q_cp1tipo_entrada: TIntegerField
      FieldName = 'tipo_entrada'
      Origin = 'tipo_entrada'
    end
    object q_cp1cod_empresa: TIntegerField
      FieldName = 'cod_empresa'
      Origin = 'cod_empresa'
    end
    object q_cp1conferido: TStringField
      FieldName = 'conferido'
      Origin = 'conferido'
      FixedChar = True
      Size = 1
    end
    object q_cp1id_plano_contas: TIntegerField
      FieldName = 'id_plano_contas'
      Origin = 'id_plano_contas'
    end
    object q_cp1extrato: TIntegerField
      FieldName = 'extrato'
      Origin = 'extrato'
    end
    object q_cp1cheque: TIntegerField
      FieldName = 'cheque'
      Origin = 'cheque'
    end
    object q_cp1id_master: TIntegerField
      FieldName = 'id_master'
      Origin = 'id_master'
    end
    object q_cp1vlr_corrigido: TBCDField
      FieldName = 'vlr_corrigido'
      Origin = 'vlr_corrigido'
      currency = True
      Precision = 15
      Size = 2
    end
    object q_cp1cod_representante: TIntegerField
      FieldName = 'cod_representante'
      Origin = 'cod_representante'
    end
    object q_cp1historico1: TBlobField
      FieldName = 'historico1'
      Origin = 'historico1'
    end
    object q_cp1cr_vinculada: TIntegerField
      FieldName = 'cr_vinculada'
      Origin = 'cr_vinculada'
    end
    object q_cp1emprestimo: TStringField
      FieldName = 'emprestimo'
      Origin = 'emprestimo'
      FixedChar = True
      Size = 1
    end
    object q_cp1conta_emprestimo: TIntegerField
      FieldName = 'conta_emprestimo'
      Origin = 'conta_emprestimo'
    end
  end
  object DlgXml: TOpenDialog
    Left = 304
    Top = 485
  end
  object Q_produto: TFDQuery
    Connection = dao.CN
    Left = 160
    Top = 241
  end
end
