object fr_nfe_complementar: Tfr_nfe_complementar
  Left = 181
  Top = 69
  BorderIcons = [biSystemMenu]
  Caption = 'Nota Fiscal Complementar'
  ClientHeight = 642
  ClientWidth = 835
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
  object PageControl1: TsPageControl
    Left = 0
    Top = 0
    Width = 835
    Height = 582
    ActivePage = TabNFE
    Align = alClient
    TabOrder = 0
    SkinData.SkinSection = 'PAGECONTROL'
    object TabDados: TsTabSheet
      Caption = 'Dados'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object Panel2: TsPanel
        Left = 0
        Top = 0
        Width = 827
        Height = 554
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 0
        SkinData.SkinSection = 'PANEL'
        object gbTotal: TsGroupBox
          Left = 5
          Top = 305
          Width = 539
          Height = 102
          Caption = 'Total'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 7
          SkinData.SkinSection = 'GROUPBOX'
          object gbBruto: TsGroupBox
            Left = 63
            Top = 16
            Width = 100
            Height = 41
            Caption = 'T.Bruto'
            TabOrder = 0
            SkinData.SkinSection = 'GROUPBOX'
            object Prtot_bruto: TsCurrencyEdit
              Left = 5
              Top = 14
              Width = 90
              Height = 21
              TabStop = False
              AutoSize = False
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
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
          object gbLiquido: TsGroupBox
            Left = 63
            Top = 56
            Width = 100
            Height = 41
            Caption = 'T.L'#237'quido'
            TabOrder = 1
            SkinData.SkinSection = 'GROUPBOX'
            object Prtot_liquido: TsCurrencyEdit
              Left = 5
              Top = 12
              Width = 90
              Height = 21
              TabStop = False
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
          object gbBCICMS: TsGroupBox
            Left = 166
            Top = 16
            Width = 100
            Height = 41
            Caption = 'T.BC.ICMS'
            TabOrder = 2
            SkinData.SkinSection = 'GROUPBOX'
            object Prvlr_bc_icms: TsCurrencyEdit
              Left = 5
              Top = 14
              Width = 90
              Height = 21
              TabStop = False
              AutoSize = False
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
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
          object gbICMS: TsGroupBox
            Left = 166
            Top = 56
            Width = 100
            Height = 41
            Caption = 'T.ICMS'
            TabOrder = 3
            SkinData.SkinSection = 'GROUPBOX'
            object Prvlr_icms: TsCurrencyEdit
              Left = 5
              Top = 12
              Width = 90
              Height = 21
              TabStop = False
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
          object gbBCST: TsGroupBox
            Left = 269
            Top = 16
            Width = 100
            Height = 41
            Caption = 'T.BC.ST.'
            TabOrder = 4
            SkinData.SkinSection = 'GROUPBOX'
            object PrVLR_BC_ICMS_ST: TsCurrencyEdit
              Left = 5
              Top = 14
              Width = 90
              Height = 21
              TabStop = False
              AutoSize = False
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
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
          object gbST: TsGroupBox
            Left = 269
            Top = 56
            Width = 100
            Height = 41
            Caption = 'T.ST.'
            TabOrder = 5
            SkinData.SkinSection = 'GROUPBOX'
            object Prvlr_st: TsCurrencyEdit
              Left = 5
              Top = 14
              Width = 90
              Height = 21
              TabStop = False
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
          object gbIPI: TsGroupBox
            Left = 372
            Top = 16
            Width = 100
            Height = 41
            Caption = 'T.IPI'
            TabOrder = 6
            SkinData.SkinSection = 'GROUPBOX'
            object Prvlr_ipi: TsCurrencyEdit
              Left = 5
              Top = 14
              Width = 90
              Height = 21
              TabStop = False
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
        object gbRef: TsGroupBox
          Left = 5
          Top = 42
          Width = 539
          Height = 263
          Caption = 'Refer'#234'ncia'
          TabOrder = 6
          SkinData.SkinSection = 'GROUPBOX'
          object gbNumDocRef: TsGroupBox
            Left = 5
            Top = 16
            Width = 96
            Height = 41
            Caption = 'N'#176' Documento'
            TabOrder = 0
            SkinData.SkinSection = 'GROUPBOX'
            object PrNumdoc_Ref: TsComboEdit
              Left = 4
              Top = 14
              Width = 89
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
              OnExit = PrNumdoc_RefExit
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
              OnButtonClick = PrNumdoc_RefButtonClick
              GlyphMode.Blend = 0
              GlyphMode.Grayed = False
            end
          end
          object gbNFeRef: TsGroupBox
            Left = 103
            Top = 16
            Width = 67
            Height = 41
            Caption = 'NF-e'
            TabOrder = 1
            SkinData.SkinSection = 'GROUPBOX'
            object edNfe_Ref: TsEdit
              Left = 4
              Top = 14
              Width = 58
              Height = 21
              Color = clWhite
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
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
          object gbChaveNfeRef: TsGroupBox
            Left = 172
            Top = 16
            Width = 362
            Height = 41
            Caption = 'Chave NF-e'
            TabOrder = 2
            SkinData.SkinSection = 'GROUPBOX'
            object ed_Chave_nfe_ref: TsEdit
              Left = 4
              Top = 14
              Width = 349
              Height = 21
              Color = clWhite
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
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
          object gbFornecedor: TsGroupBox
            Left = 5
            Top = 96
            Width = 529
            Height = 41
            Caption = 'Fornecedor'
            TabOrder = 4
            SkinData.SkinSection = 'GROUPBOX'
            object LbNom_fornecedor: TsLabel
              Left = 73
              Top = 21
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
            object Prcod_fornecedor: TsComboEdit
              Left = 4
              Top = 13
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
              OnExit = PrCod_fornecedorExit
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
          end
          object gbCliente: TsGroupBox
            Left = 5
            Top = 56
            Width = 529
            Height = 41
            Caption = 'Cliente'
            TabOrder = 3
            SkinData.SkinSection = 'GROUPBOX'
            object LbNom_cliente: TsLabel
              Left = 73
              Top = 22
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
            object Prcod_cliente: TsComboEdit
              Left = 4
              Top = 14
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
              OnExit = PrCod_clienteExit
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
          object gbCodigoFiscal: TsGroupBox
            Left = 5
            Top = 136
            Width = 529
            Height = 41
            Caption = 'C'#243'digo Fiscal'
            TabOrder = 5
            SkinData.SkinSection = 'GROUPBOX'
            object Lbnom_cod_fiscal: TsLabel
              Left = 73
              Top = 22
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
              Left = 4
              Top = 14
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
              OnExit = PrCod_FiscalExit
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
          end
          object gbEmpresaFaturar: TsGroupBox
            Left = 5
            Top = 176
            Width = 529
            Height = 41
            Caption = 'Empresa Faturar'
            TabOrder = 6
            SkinData.SkinSection = 'GROUPBOX'
            object Lbempresa_faturamento: TsLabel
              Left = 73
              Top = 22
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
            object Prcod_empresa: TsEdit
              Left = 279
              Top = 12
              Width = 25
              Height = 21
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
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
            object PrCod_Fop: TsEdit
              Left = 311
              Top = 12
              Width = 25
              Height = 21
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
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
            object Prempresa_faturar: TsComboEdit
              Left = 4
              Top = 14
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
              OnExit = Prempresa_faturarExit
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
              OnButtonClick = Prempresa_faturarButtonClick
              GlyphMode.Blend = 0
              GlyphMode.Grayed = False
            end
          end
          object gbTransportadora: TsGroupBox
            Left = 5
            Top = 216
            Width = 529
            Height = 41
            Caption = 'Transportadora'
            TabOrder = 7
            SkinData.SkinSection = 'GROUPBOX'
            object LbNom_transportadora: TsLabel
              Left = 73
              Top = 22
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
            object Prcod_transportadora: TsComboEdit
              Left = 4
              Top = 14
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
              OnExit = Prcod_transportadoraExit
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
          end
        end
        object gbNumdoc: TsGroupBox
          Left = 5
          Top = 2
          Width = 93
          Height = 41
          Caption = 'N'#176' Documento'
          TabOrder = 0
          SkinData.SkinSection = 'GROUPBOX'
          object Prnumdoc: TsEdit
            Left = 6
            Top = 14
            Width = 81
            Height = 21
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
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
        object gbData: TsGroupBox
          Left = 102
          Top = 2
          Width = 101
          Height = 41
          Caption = 'Data'
          TabOrder = 1
          SkinData.SkinSection = 'GROUPBOX'
          object Prdtadoc: TsDateEdit
            Left = 5
            Top = 14
            Width = 91
            Height = 22
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
            ReadOnly = True
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
        object gbEmissao: TsGroupBox
          Left = 207
          Top = 2
          Width = 101
          Height = 41
          Caption = 'Data Emiss'#227'o'
          TabOrder = 2
          SkinData.SkinSection = 'GROUPBOX'
          object Prdta_emissao: TsDateEdit
            Left = 5
            Top = 14
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
        object gbNfe: TsGroupBox
          Left = 416
          Top = 3
          Width = 63
          Height = 41
          Caption = 'NF-e'
          TabOrder = 4
          SkinData.SkinSection = 'GROUPBOX'
          object PrNFE: TsEdit
            Left = 5
            Top = 14
            Width = 52
            Height = 21
            TabStop = False
            Color = clWhite
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
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
        object gbSaida: TsGroupBox
          Left = 311
          Top = 2
          Width = 101
          Height = 41
          Caption = 'Data Sa'#237'da'
          TabOrder = 3
          SkinData.SkinSection = 'GROUPBOX'
          object Prdta_saida: TsDateEdit
            Left = 5
            Top = 13
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
        object gbObs: TsGroupBox
          Left = 5
          Top = 406
          Width = 539
          Height = 144
          Caption = 'Observa'#231#245'es'
          TabOrder = 8
          SkinData.SkinSection = 'GROUPBOX'
          object Probservacoes_nota: TRichEdit
            Left = 3
            Top = 18
            Width = 523
            Height = 123
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Zoom = 100
          end
        end
        object GbNF: TsGroupBox
          Left = 481
          Top = 2
          Width = 63
          Height = 41
          Caption = 'NF'
          TabOrder = 5
          SkinData.SkinSection = 'GROUPBOX'
          object PrNF: TsEdit
            Left = 5
            Top = 14
            Width = 52
            Height = 21
            TabStop = False
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnExit = PrNFExit
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
    end
    object tabMercadorias: TsTabSheet
      Caption = 'Mercadorias'
      ImageIndex = 2
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object GbProduto: TsGroupBox
        Left = 0
        Top = 0
        Width = 827
        Height = 419
        Align = alClient
        Caption = 'Produtos'
        TabOrder = 0
        SkinData.SkinSection = 'GROUPBOX'
        object DBGrid1: TRxDBGrid
          Left = 2
          Top = 15
          Width = 823
          Height = 402
          Align = alClient
          DataSource = dsVendas2
          DefaultDrawing = False
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = DBGrid1DrawColumnCell
          RowColor2 = 16776176
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
              Width = 333
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NCM'
              Width = 78
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_FISCAL_ITEM'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'd.Fisc.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRIB_ICMS'
              Title.Alignment = taCenter
              Title.Caption = 'CST'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QTD'
              Title.Alignment = taRightJustify
              Title.Caption = 'Quantidade'
              Width = 61
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECO_LIQUIDO'
              Title.Alignment = taCenter
              Title.Caption = 'Pre'#231'o Liq.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUB_TOTAL'
              Title.Alignment = taCenter
              Title.Caption = 'Sub-Total'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ICMS_ITEM'
              Title.Alignment = taCenter
              Title.Caption = 'ICMS%'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VLR_BC'
              Title.Alignment = taCenter
              Title.Caption = 'BC ICMS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VLR_ICMS_ITEM'
              Title.Alignment = taCenter
              Title.Caption = 'Valor ICMS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VLR_AGR_ITEM'
              Title.Alignment = taCenter
              Title.Caption = '% Vlr. Ag.'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VLR_BC_ST'
              Title.Alignment = taCenter
              Title.Caption = 'IST BC'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VLR_ICMS_ST'
              Title.Alignment = taCenter
              Title.Caption = 'Valor IST'
              Visible = True
            end>
        end
      end
      object GroupBox6: TsGroupBox
        Left = 0
        Top = 419
        Width = 827
        Height = 94
        Align = alBottom
        TabOrder = 1
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
          Left = 264
          Top = 57
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
        object Label19: TsLabel
          Left = 424
          Top = 56
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
          Left = 484
          Top = 57
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
          Left = 753
          Top = 62
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
        object Lbcolecao: TsLabel
          Left = 753
          Top = 80
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
        object Label39: TsLabel
          Left = 186
          Top = 56
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
        object Label1: TsLabel
          Left = 342
          Top = 57
          Width = 31
          Height = 13
          Caption = 'Pre'#231'o:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object lbCST: TsLabel
          Left = 6
          Top = 56
          Width = 27
          Height = 13
          Caption = 'CST.:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label67: TsLabel
          Left = 42
          Top = 56
          Width = 55
          Height = 13
          Caption = 'C'#243'd. Fiscal:'
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
          DataSource = dsVendas2
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
          OnButtonClick = Emcod_produtoButtonClick
          OnExit = Emcod_produtoExit
        end
        object Emqtd_entrada: TDBEdit
          Left = 262
          Top = 69
          Width = 73
          Height = 21
          AutoSize = False
          Color = clWhite
          DataField = 'QTD'
          DataSource = dsVendas2
          TabOrder = 4
        end
        object EmIcms: TDBEdit
          Left = 418
          Top = 69
          Width = 59
          Height = 21
          AutoSize = False
          Color = clWhite
          DataField = 'ICMS_ITEM'
          DataSource = dsVendas2
          TabOrder = 6
        end
        object Emsub_total: TDBEdit
          Left = 482
          Top = 69
          Width = 73
          Height = 21
          AutoSize = False
          Color = clWhite
          DataField = 'SUB_TOTAL'
          DataSource = dsVendas2
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
        end
        object Emid: TDBEdit
          Left = 656
          Top = 9
          Width = 73
          Height = 21
          TabStop = False
          DataField = 'ID'
          DataSource = dsVendas2
          TabOrder = 8
          Visible = False
        end
        object EmVolume: TDBEdit
          Left = 184
          Top = 69
          Width = 73
          Height = 21
          AutoSize = False
          Color = clWhite
          DataField = 'VOLUME'
          DataSource = dsVendas2
          TabOrder = 3
        end
        object zzEstoque: TsCurrencyEdit
          Left = 747
          Top = 33
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
          TabOrder = 9
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
        object emPreco: TDBEdit
          Left = 340
          Top = 69
          Width = 73
          Height = 21
          AutoSize = False
          Color = clWhite
          DataField = 'PRECO_LIQUIDO'
          DataSource = dsVendas2
          TabOrder = 5
        end
        object Mevlr_icms_st: TDBEdit
          Left = 369
          Top = 23
          Width = 34
          Height = 21
          TabStop = False
          AutoSize = False
          Color = cl3DLight
          DataField = 'VLR_ICMS_ST'
          DataSource = dsVendas2
          ReadOnly = True
          TabOrder = 10
          Visible = False
        end
        object Mevlr_bc_st: TDBEdit
          Left = 404
          Top = 23
          Width = 34
          Height = 21
          TabStop = False
          AutoSize = False
          Color = cl3DLight
          DataField = 'VLR_BC_ST'
          DataSource = dsVendas2
          ReadOnly = True
          TabOrder = 11
          Visible = False
        end
        object Mevlr_bc: TDBEdit
          Left = 439
          Top = 23
          Width = 34
          Height = 21
          TabStop = False
          AutoSize = False
          Color = cl3DLight
          DataField = 'VLR_BC'
          DataSource = dsVendas2
          ReadOnly = True
          TabOrder = 12
          Visible = False
        end
        object MeNCM: TDBEdit
          Left = 474
          Top = 23
          Width = 98
          Height = 21
          TabStop = False
          Color = cl3DLight
          DataField = 'NCM'
          DataSource = dsVendas2
          ReadOnly = True
          TabOrder = 13
          Visible = False
        end
        object MeCesta_Basica: TDBEdit
          Left = 608
          Top = 23
          Width = 20
          Height = 21
          TabStop = False
          Color = cl3DLight
          DataSource = dsVendas2
          ReadOnly = True
          TabOrder = 14
          Visible = False
        end
        object Mevlr_agr_item: TDBEdit
          Left = 573
          Top = 23
          Width = 34
          Height = 21
          TabStop = False
          AutoSize = False
          Color = cl3DLight
          DataField = 'VLR_AGR_ITEM'
          DataSource = dsVendas2
          ReadOnly = True
          TabOrder = 15
          Visible = False
        end
        object Mecod_fiscal_item: TRxDBComboEdit
          Left = 42
          Top = 69
          Width = 80
          Height = 21
          DataField = 'COD_FISCAL_ITEM'
          DataSource = dsVendas2
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
            DDDDDDDDDDDDDDDDDDDDDDDDDDD333DDDDDDDDDDDD33603DDDDDDDDDD3B7871D
            33DDDDD3BBB88803333DDD3B888F873887033388FF7883BBB86133FFFF83333B
            B873383888BB333BBB33D3333BBBBB333DDDDDDDD33333DDDDDDDDDDDDDDDDDD
            DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
          NumGlyphs = 1
          TabOrder = 2
        end
        object MeTrib_ICMS: TDBEdit
          Left = 6
          Top = 69
          Width = 34
          Height = 21
          TabStop = False
          Color = clWhite
          DataField = 'TRIB_ICMS'
          DataSource = dsVendas2
          TabOrder = 1
        end
      end
      object Panel5: TsPanel
        Left = 0
        Top = 513
        Width = 827
        Height = 41
        Align = alBottom
        TabOrder = 2
        SkinData.SkinSection = 'PANEL'
        object BtNovEm: TsBitBtn
          Left = 154
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Novo'
          TabOrder = 0
          OnClick = BtNovEmClick
          SkinData.SkinSection = 'BUTTON'
        end
        object BtAltEm: TsBitBtn
          Left = 228
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Alterar'
          TabOrder = 1
          OnClick = BtAltEmClick
          SkinData.SkinSection = 'BUTTON'
        end
        object BtgraEm: TsBitBtn
          Left = 302
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Gravar'
          Enabled = False
          TabOrder = 2
          OnClick = BtgraEmClick
          SkinData.SkinSection = 'BUTTON'
        end
        object BtcanEm: TsBitBtn
          Left = 376
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Cancelar'
          Enabled = False
          TabOrder = 3
          OnClick = BtcanEmClick
          SkinData.SkinSection = 'BUTTON'
        end
        object BtexcEm: TsBitBtn
          Left = 450
          Top = 8
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
    object TabNFE: TsTabSheet
      Caption = 'Nota Fiscal Eletr'#244'nica'
      ImageIndex = 1
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object Panel3: TsPanel
        Left = 0
        Top = 0
        Width = 827
        Height = 478
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 0
        SkinData.SkinSection = 'PANEL'
        object gbChaveNfe: TsGroupBox
          Left = 8
          Top = 7
          Width = 285
          Height = 42
          Caption = 'Chave N'#176
          TabOrder = 0
          SkinData.SkinSection = 'GROUPBOX'
          object PrChave_NFe: TsEdit
            Left = 6
            Top = 15
            Width = 273
            Height = 21
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
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
        object gbReciboNfe: TsGroupBox
          Left = 367
          Top = 7
          Width = 110
          Height = 42
          Caption = 'N'#176' Recibo'
          TabOrder = 1
          SkinData.SkinSection = 'GROUPBOX'
          object PrRECIBO_NFE: TsEdit
            Left = 6
            Top = 14
            Width = 99
            Height = 21
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
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
        object gbDigest: TsGroupBox
          Left = 8
          Top = 49
          Width = 191
          Height = 42
          Caption = 'Digest Value'
          TabOrder = 2
          SkinData.SkinSection = 'GROUPBOX'
          object PrDIGEST_NFE: TsEdit
            Left = 6
            Top = 14
            Width = 179
            Height = 21
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
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
        object gbProtocolo: TsGroupBox
          Left = 201
          Top = 49
          Width = 110
          Height = 42
          Caption = 'N'#176' Protocolo'
          TabOrder = 3
          SkinData.SkinSection = 'GROUPBOX'
          object PrPROTOCOLO_NFE: TsEdit
            Left = 6
            Top = 14
            Width = 99
            Height = 21
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
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
        object gbDataRecNFe: TsGroupBox
          Left = 313
          Top = 49
          Width = 164
          Height = 42
          Caption = 'Data Recebimento'
          Enabled = False
          TabOrder = 4
          SkinData.SkinSection = 'GROUPBOX'
          object PrDATA_REC_NFE: TDateTimePicker
            Left = 6
            Top = 14
            Width = 153
            Height = 21
            Date = 36892.000011574070000000
            Format = 'dd/MM/yyyy HH:mm:ss'
            Time = 36892.000011574070000000
            DateMode = dmUpDown
            TabOrder = 0
          end
        end
        object gbMotivo: TsGroupBox
          Left = 67
          Top = 91
          Width = 410
          Height = 42
          Caption = 'Motivo'
          TabOrder = 5
          SkinData.SkinSection = 'GROUPBOX'
          object PrMotivo_nfe: TsEdit
            Left = 4
            Top = 14
            Width = 400
            Height = 21
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
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
        object GbStat: TsGroupBox
          Left = 8
          Top = 91
          Width = 57
          Height = 42
          Caption = 'Situa'#231#227'o'
          TabOrder = 6
          SkinData.SkinSection = 'GROUPBOX'
          object PrStatus_Nfe: TsEdit
            Left = 11
            Top = 14
            Width = 35
            Height = 21
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
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
        object gbCancNfe: TsGroupBox
          Left = 8
          Top = 133
          Width = 469
          Height = 90
          Caption = 'Cancelamento Justificativa'
          TabOrder = 7
          SkinData.SkinSection = 'GROUPBOX'
          object lbStatusCancel: TsLabel
            Left = 8
            Top = 71
            Width = 324
            Height = 13
            Alignment = taCenter
            Caption = 'Prazo Limite para o Cancelamento: 15/12/2010 10:00:00'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
          end
          object prJUSTIF_CANC_NFE: TsEdit
            Left = 6
            Top = 14
            Width = 457
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 255
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            OnChange = prJUSTIF_CANC_NFEChange
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
          object BtnEnviarCancelamentoNFe: TsBitBtn
            Left = 184
            Top = 39
            Width = 100
            Height = 28
            Caption = 'Enviar'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              D6050000424DD605000000000000360000002800000018000000140000000100
              180000000000A005000000000000000000000000000000000000F4F4F4F4F4F4
              F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F4F3F4F4F3F6F8F1E9
              E3F3F6F8F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
              F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F7F7F7F5F2F5F2F1F2F7F7F7F7F9F9
              F3F6F9F5DDCAF0B588F0DBCFF3F9FCF4F4F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4
              F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F4F4FBF7FADFDBDC9FB9A2BD
              C3B9D0C2C9D8D1D7FFD6B9FFD6B0FFDCBCECAE84F2E4DDF2F6F8F4F4F4F4F4F4
              F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F4F3F8F5F8E2EA
              E23D9A5796CDAD18A97629944F499578A4AAB1FDCAAAFED5B4FCD0A9F0D1BCF4
              FBFFF3F4F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
              F3F3F3FFFBFF72B883E2DAD72BCFD0B2D1D5FFFFFFADD3B0008F507FA196FAC3
              A3FED6B5EBA77BF0DFD3F4FBFFF4F9FEF4F4F5F4F4F4F4F4F4F4F4F4F4F4F4F4
              F4F4F4F4F4F4F4F4F3F3F3FFFCFF6FB37DC4D2D039C3BEE5D6D8F7F6F6FFFFFF
              FDEBDC49A258B2A584F4C2A7FFE2BCEEAA7AE89C6BEBB18EF4F6FAF4F4F5F4F4
              F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F3F3FFF9FF8EC79CABBEB438C7C3D6
              CECEF8F8F8E6E1DBC0A99CC9BAB947A56A4D553CB28F7BFFDEBDFEDCBBF2BA8D
              EBBDA0F3FAFDF4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F8F6F8D4E8
              D786A98130C3C3C1C6C5F5F3F3FFFFFFEEE1D7FFF1DFFFF3EA51B1749C8A70F3
              C7ABFFD9B7FCD7B4ECA87BF4F1F3F4F5F5F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
              F4F4F4F4F4F4FFFAFE67AC7279BFC36BBFB9FFFFFF968A7FEDBF9AFFD9B2FFDD
              B5FFE7C64CA966D4AD95F6CCADFFDAB9EFB182EFDACBF3F7F9F4F4F3F4F4F4F4
              F4F4F4F4F4F4F4F4F4F4F4F3F3F3FEFAFFAED6B48EB19724B6B3FFFFFF9A8B7E
              9684759987779883749F857695937B4C9B5CEAB49CFCD6B4F5C096EFD3C3F3FA
              FFF4F4F3F4F4F4F4F4F4F4F4F4F4F4F4F3F5F5F4F9FEF2E9E5FFFFFF60B078B7
              8962FBF3EDF2F2F2EAE1DBFFFFFCFFFDF3FFFFFFE7DCDD61855B8BA474F0C1A8
              FBCDA7E49461F5EDEBF3F7F9F4F4F3F4F4F4F4F4F4F4F5F5F1F0EFEBB38EEEAA
              77EDA379D0D3B06DA570EBC0AFF6F9FA654B35CEA889FFD7AAFDE0C6E2E4E6B0
              866F57AB6DD6AE94FED9BAF0B88BE79E6EF4F3F5F3F4F5F4F4F4F4F3F3F3F7FA
              F4D6C1FACEA9FEDABAFBD3B1FFD3B18EC29496A071F1D4CBFFFFFF9E948D9C90
              88F8FFFFC9BBAFFECBA7CBD1AC709765EDBDA1FEDCBBEEA978ECBD9FF4FAFEF4
              F3F3F4F3F3F2F7FDFCDAB8FFD9B7FFD5B4FFDEBCFFD9B7FFE1C26AB984B4A17C
              EFC6ACFFF8E9FFF9ECFBE0C9FED0A9FFD6B4FFD8B950A366DFAC94FFD4B0F4B8
              89ECBC9EF4FAFEF4F3F3F4F4F4F6F7F8CFCCCACEAD91FFD6B1A78971F0CAABCD
              A78CE3BDA35CB479C0AB8BECBB9FFFD5B1FFD4B1F9D0AEFFD6B6FFD6B6A3C494
              A09E77E2B48EDDC6B9F5F7F9F4F4F4F4F4F4F4F4F4F2F2F2FFFFFF6F7175FFFF
              FFCDCBCAB29C8BECF1F39E7D65FFECCB5DB67CBAAC8BE8B89EFFD5B5FFD9B6FF
              D4AFFECDABCFD4B67B9F7836B9B6DACED3F6F7F7F4F4F4F4F4F4F4F4F4F2F2F2
              FFFFFF878685EAE7E5EFEEEE957C63FFFFFFA59991AA9488BE9C856DBE8492A8
              7BDFAE97D1B8A2E9C7B9FEFBFFE0F1E87AA68149CBC8CFC6C7F7F6F6F4F4F4F4
              F4F4F4F4F4F3F3F3FCFCFCF2F4F5A7988DFFFFFF776152FFFFFDC0B8B2D0C9C4
              E7C09FFFD3B2A7C6973D9E610FA19145A2A6ACACB99DBB9787B19B26BCB6EFD9
              DAF6F7F7F4F4F4F4F4F4F4F4F4F3F3F3F8F8F8FFFFFFB6BABAFFFFFFBAACA3F6
              EBE3F0F0EFE1E1E2A7ABB0EBF4F9FFE2D2FAE9DEA0CAA259AA6C3EA36429A87B
              32C7C5DCE0E0FAF7F7F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F2F2F2F1F1F1FAFA
              FAF1F1F1F9FCFEF3F6F8F3ECE7F4F5F5FBFBFBF5F5F5F3F6F8F5F6F8FFF8FEFF
              FFFFFFFFFFFFFEFFFFFBFBF9F6F5F4F4F4F4F4F4F4F4F4F4F4F4}
            ParentFont = False
            TabOrder = 1
            OnClick = BtnEnviarCancelamentoNFeClick
            SkinData.SkinSection = 'BUTTON'
          end
          object BtnEditarCancelamentoNFe: TsBitBtn
            Left = 73
            Top = 39
            Width = 100
            Height = 28
            Caption = 'Editar'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFB78183B78183B78183B78183B78183B78183B78183B7
              8183B78183B78183B78183B78183B78183FF00FFFF00FFFF00FFB78183FDEFD9
              F4E1C9E4CFB4D1BCA0CDB798DAC09AE4C599E9C896EDCB96EECC97F3D199B781
              83FF00FFFF00FFFF00FFB48176FEF3E3F8E7D3494645373C3E516061AE9C82BF
              A889D0B48DE4C393EDCB96F3D199B78183FF00FFFF00FFFF00FFB48176FFF7EB
              F9EBDAB0A5981B617D097CA818556F66625BA79479C5AC86DCBD8DEECD95B781
              83FF00FFFF00FFFF00FFBA8E85FFFCF4FAEFE4F2E5D638728629799A8D787F95
              6D6F7959539D8B73BAA380D9BC8CB47F81FF00FFFF00FFFF00FFBA8E85FFFFFD
              FBF4ECFAEFE3A5B3B17C7078E5A6A3C89292A4727276575195856CAF9978A877
              79FF00FFFF00FFFF00FFCB9A82FFFFFFFEF9F5FBF3ECF4EBDF85787CEEB7B5DA
              A6A6C38E8E9E6E6E73564F93836B996E6FFF00FFFF00FFFF00FFCB9A82FFFFFF
              FFFEFDFDF8F4FBF3ECF0E4D9A37978E9B5B5D9A5A5C48F8F9D6D6D7759528F67
              69FF00FFFF00FFFF00FFDCA887FFFFFFFFFFFFFFFEFDFEF9F4FBF3EBE8D9CE9E
              7473E8B5B5D8A4A4C18D8D9D6C6C7D5556FF00FFFF00FFFF00FFDCA887FFFFFF
              FFFFFFFFFFFFFFFEFDFDF9F4FBF3EBE0CFC5A17676ECB9B9D6A2A2C68E8E965F
              5D585C60FF00FFFF00FFE3B18EFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDF8F3FD
              F6ECDAC5BCAC8080F3BCBBA3878C3392B319ADCC19ADCCFF00FFE3B18EFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFFFEF9E3CFC9AA7A71B27873469CBA0FCA
              F400A4E6021EAA000099EDBD92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFE4D4D2B8857ADCA76A10A5CF04A8E60936C9092CC30318AEEDBD92FCF7F4
              FCF7F3FBF6F3FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEB8857ACF9B86FF00FF077D
              CD4860F1204ADD0416AAEDBD92DCA887DCA887DCA887DCA887DCA887DCA887DC
              A887DCA887B8857AFF00FFFF00FFFF00FF3E4BDB192DC4FF00FF}
            ParentFont = False
            TabOrder = 2
            OnClick = BtnEditarCancelamentoNFeClick
            SkinData.SkinSection = 'BUTTON'
          end
          object BtnSairCancelamentoNFe: TsBitBtn
            Left = 295
            Top = 39
            Width = 100
            Height = 28
            Caption = 'Cancelar'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF9A6666693334FF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A6666B96666BB
              6868693334FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              9A66669A6666C66A6BD06A6BD26869C368696933349A66669A66669A66669A66
              669A66669A6666FF00FFFF00FFFF00FF9A6666DE7374D77071D56F70D56D6EC7
              6A6D693334FEA2A3FCAFB0FABCBDF9C5C6F9C5C69A6666FF00FFFF00FFFF00FF
              9A6666E07778DB7576DA7475DA7273CC6E7169333439C56525CF6329CC6319CB
              5BF9C5C69A6666FF00FFFF00FFFF00FF9A6666E57D7EE07A7BDF797ADF7778D0
              727569333442C46830CD6733CB6724CB60F9C5C69A6666FF00FFFF00FFFF00FF
              9A6666EA8283E57F80E37D7EE68081D374766933343DC26429CB632FCA6420CA
              5EF9C5C69A6666FF00FFFF00FFFF00FF9A6666F08788E98182EC9697FBDDDED8
              888A693334B8E1AC6BDC895DD58046D473F9C5C69A6666FF00FFFF00FFFF00FF
              9A6666F58C8DEE8687F0999AFDDCDDDA888A693334FFF5D8FFFFE0FFFFDEECFD
              D4F9C5C69A6666FF00FFFF00FFFF00FF9A6666FA9192F48E8FF28B8CF48C8DDC
              7F80693334FDF3D4FFFFDFFFFFDDFFFFE0F9C5C69A6666FF00FFFF00FFFF00FF
              9A6666FE9798F99394F89293F99092E08585693334FDF3D4FFFFDFFFFFDDFFFF
              DFF9C5C69A6666FF00FFFF00FFFF00FF9A6666FF9B9CFD9798FC9697FE9798E3
              8889693334FDF3D4FFFFDFFFFFDDFFFFDFF9C5C69A6666FF00FFFF00FFFF00FF
              9A6666FF9FA0FF9A9BFF999AFF9A9BE78C8D693334FDF3D4FFFFDFFFFFDDFFFF
              DFF9C5C69A6666FF00FFFF00FFFF00FF9A66669A6666E98E8FFE999AFF9D9EEB
              8F90693334FBF0D2FDFCDCFDFCDAFDFCDCF9C5C69A6666FF00FFFF00FFFF00FF
              FF00FFFF00FF9A6666B07172D78687DA88886933349A66669A66669A66669A66
              669A66669A6666FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A
              6666693334FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            ParentFont = False
            TabOrder = 3
            OnClick = BtnSairCancelamentoNFeClick
            SkinData.SkinSection = 'BUTTON'
          end
        end
      end
      object Panel4: TsPanel
        Left = 0
        Top = 478
        Width = 827
        Height = 76
        Align = alBottom
        TabOrder = 1
        SkinData.SkinSection = 'PANEL'
        object BtnNFE: TsBitBtn
          Left = 179
          Top = 16
          Width = 129
          Height = 44
          Caption = 'NFe'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
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
          TabOrder = 0
          OnClick = BtnNFEClick
          SkinData.SkinSection = 'BUTTON'
        end
        object BtnDanfe: TsBitBtn
          Left = 28
          Top = 16
          Width = 129
          Height = 44
          Caption = 'DANFe'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FF999697BDBBBC9D9A9A898687FF00FFFF00
            FF979596C6C6C6D0CFCFAFACAC989596FF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FF999697B7B5B6F0EFEFF4F3F3AAA7A7
            9D9A9A4241424644456E6C6D999797BCBBBBDAD9D9E0E0E0C9C7C7A3A0A1FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF989697A9A5A6E3E2E2FFFEFEFC
            FBFBEFEEEEA7A5A59E9C9C3332341212131C1C1D2A2A2C4745476D6A6C9A9898
            C5C4C4E2E1E1D4D3D3959192FF00FFFF00FFFF00FFFF00FF9A9899D8D5D5FCFB
            FBFBFAFAF8F7F7FBFAFAE7E5E6A3A0A0A3A0A0807F805453543332341E1E1F16
            16171A1A1C29292B454445736F70918F8FFF00FFFF00FFFF00FF8E8A8BC4C1C1
            F6F4F4FAF8F8F4F3F3F4F3F3E3E2E2B8B7B79896978986878C8A8A9A9798A5A1
            A39F9D9D878686605F603D3C3D2222231415162B2A2C8A8788FF00FFFF00FFFF
            00FF8E8A8BEBEBEBF0F0F0EDEBEBD9D8D8B0ADAD969293A6A4A4C7C6C6A4A1A1
            928F8F8B88898884868B8989969293A19F9EA19F9F918F906A696A5151528B89
            89FF00FFFF00FFFF00FF8E8A8BDEDDDDD0CFCFA7A5A5939091A7A5A5CAC9CAD5
            D7D5DCDADAE1E0E0CCCACABAB7B7A7A5A59A97988F8B8C8A8788898687918E8E
            9D9999A3A0A0918F8FFF00FFFF00FFFF00FF8E8A8B9E9C9D939191A9A7A7C7C7
            C7D1D3D3CECECEC9C9C9E6E5E5F6F4F4F3F3F3EDEBEBE0DEDECFCECEBFBDBDAF
            ACACA19F9F9592928C8A8A8A8788868283FF00FFFF00FFFF00FF8E8A8BAAA7A9
            C9C7C7CFCFCFCBCBCBCACACAC6C6C6DADADAF4F3F3B5B2B4B6AAB4C4C1C2D8D7
            D7E1E1E1E2E2E2D9D9D9CECECEC1C0C0B4B2B2AAA7A7928F90FF00FFFF00FFFF
            00FF8E8A8BCACACACCCCCCCACACACACACAC7C7C7D7D7D7F4F3F3AFAAAC999E98
            66B06A9EA39D9995979C9A9AAAA9A9BBBABACCCBCBD1D1D1D1D1D1CFCFCF9A99
            99FF00FFFF00FFFF00FFFF00FFADABACD0D0D0CCCECECECECEDEDEDEE3E2E2A4
            A1A1ABA9AAEEEEEDC7EDC9E5E9E5E0DDDEF8AF9AB0ADAF9F9D9D9591929A9798
            ABA9A9ABA9AAA39FA0FF00FFFF00FFFF00FFFF00FFFF00FFA19FA0BBBABACAC9
            C9B6B4B4999797BDBBBBF4F3F3F4F3F3F4EEF3EAE7E7E5E3E3E2E2E2E1E1E1D9
            D9D9CECECE000000000000000000000000000000FF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF8A8788A9A7A7D1D1D1BFBFBF989999BABABAD3D1D1DEDDDDE1E0
            E0DEDEDEDCDCDCDDDDDDD7D7D7000415A7A4A5033DFFFF00FF010929FF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FF9D9A9CF3F4F4F4F3F2D9D5D4AAA7A7A7A9A9
            B4B7B8C7CBCCC9CCCCCCCECECCCCCCB6B5B6989697000B37033CFFFF00FF033D
            FF022096FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE9CECCFFE3D9FF
            DDCFFED5C7F8D3C6F3D1C6EDD1CAE6D4CFDED8D5D0D0D0B8B7B8FF00FF000A32
            FF00FFFF00FFFF00FF0338F7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFDDB4B0FFE0D3FFD8C9FFCFC0FFC7B5FFC0AAFFBAA4FFB79FFCB099E5C5C1FF
            00FFFF00FF00000200030C000000000208021D850338FEFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFDEB5B0FFE5D8FFD8C9FFCFC0FFC9B7FEC1ADFEBBA5FFB4
            9CF7A691FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0231E603
            36FFFF00FFFF00FFFF00FFFF00FFFF00FFE6BFB8FFE5D8FFD8C9FFCFC0FFC9B7
            FEC1ADFEBBA5FFB59DEBA08FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE1BDB8FFE2D5FF
            D8C9FFCFC0FFC9B7FEC1ADFEBBA5FFB59DF8AF9AFF00FFFF00FFFF00FF000000
            000000000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFE1BDB8FFE0D3FFD8C9FFCFC0FFC9B7FEC1ADFFBBA5F8AF9AF8AF9AFF00FFFF
            00FFFF00FF000415FF00FF033DFFFF00FF010929FF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFE0BAB5FFEDE2FFE0D3FFD8C9FFCFC0FEC9B7FEC2ADFFBDA6F8AF
            9AFF00FFFF00FFFF00FFFF00FF000B37033CFFFF00FF033DFF022096FF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFE1BDB8FFF0E5FFE5D8FFDECEFFD5C5FFCEBB
            FFC7B2EDAB9CF8AF9AFF00FFFF00FFFF00FFFF00FF000A32FF00FFFF00FFFF00
            FF0338F7FF00FFFF00FFFF00FFFF00FFFF00FFCE9F9DE1BDB8E0B7B2E0B5ADE0
            B1A9E0ACA5E0AAA0DDA39AF8AF9AFF00FFFF00FFFF00FFFF00FFFF00FF000002
            00030C000000000208021D850338FEFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0231E60336FF}
          ParentFont = False
          TabOrder = 1
          OnClick = BtnDanfeClick
          SkinData.SkinSection = 'BUTTON'
        end
        object btRecXml: TsBitBtn
          Left = 455
          Top = 16
          Width = 126
          Height = 45
          Caption = 'Rec. Xml'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            D6050000424DD605000000000000360000002800000018000000140000000100
            180000000000A005000000000000000000000000000000000000F4F4F4F4F4F4
            F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F4F3F4F4F3F6F8F1E9
            E3F3F6F8F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
            F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F7F7F7F5F2F5F2F1F2F7F7F7F7F9F9
            F3F6F9F5DDCAF0B588F0DBCFF3F9FCF4F4F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4
            F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F4F4FBF7FADFDBDC9FB9A2BD
            C3B9D0C2C9D8D1D7FFD6B9FFD6B0FFDCBCECAE84F2E4DDF2F6F8F4F4F4F4F4F4
            F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F4F3F8F5F8E2EA
            E23D9A5796CDAD18A97629944F499578A4AAB1FDCAAAFED5B4FCD0A9F0D1BCF4
            FBFFF3F4F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
            F3F3F3FFFBFF72B883E2DAD72BCFD0B2D1D5FFFFFFADD3B0008F507FA196FAC3
            A3FED6B5EBA77BF0DFD3F4FBFFF4F9FEF4F4F5F4F4F4F4F4F4F4F4F4F4F4F4F4
            F4F4F4F4F4F4F4F4F3F3F3FFFCFF6FB37DC4D2D039C3BEE5D6D8F7F6F6FFFFFF
            FDEBDC49A258B2A584F4C2A7FFE2BCEEAA7AE89C6BEBB18EF4F6FAF4F4F5F4F4
            F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F3F3FFF9FF8EC79CABBEB438C7C3D6
            CECEF8F8F8E6E1DBC0A99CC9BAB947A56A4D553CB28F7BFFDEBDFEDCBBF2BA8D
            EBBDA0F3FAFDF4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F8F6F8D4E8
            D786A98130C3C3C1C6C5F5F3F3FFFFFFEEE1D7FFF1DFFFF3EA51B1749C8A70F3
            C7ABFFD9B7FCD7B4ECA87BF4F1F3F4F5F5F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
            F4F4F4F4F4F4FFFAFE67AC7279BFC36BBFB9FFFFFF968A7FEDBF9AFFD9B2FFDD
            B5FFE7C64CA966D4AD95F6CCADFFDAB9EFB182EFDACBF3F7F9F4F4F3F4F4F4F4
            F4F4F4F4F4F4F4F4F4F4F4F3F3F3FEFAFFAED6B48EB19724B6B3FFFFFF9A8B7E
            9684759987779883749F857695937B4C9B5CEAB49CFCD6B4F5C096EFD3C3F3FA
            FFF4F4F3F4F4F4F4F4F4F4F4F4F4F4F4F3F5F5F4F9FEF2E9E5FFFFFF60B078B7
            8962FBF3EDF2F2F2EAE1DBFFFFFCFFFDF3FFFFFFE7DCDD61855B8BA474F0C1A8
            FBCDA7E49461F5EDEBF3F7F9F4F4F3F4F4F4F4F4F4F4F5F5F1F0EFEBB38EEEAA
            77EDA379D0D3B06DA570EBC0AFF6F9FA654B35CEA889FFD7AAFDE0C6E2E4E6B0
            866F57AB6DD6AE94FED9BAF0B88BE79E6EF4F3F5F3F4F5F4F4F4F4F3F3F3F7FA
            F4D6C1FACEA9FEDABAFBD3B1FFD3B18EC29496A071F1D4CBFFFFFF9E948D9C90
            88F8FFFFC9BBAFFECBA7CBD1AC709765EDBDA1FEDCBBEEA978ECBD9FF4FAFEF4
            F3F3F4F3F3F2F7FDFCDAB8FFD9B7FFD5B4FFDEBCFFD9B7FFE1C26AB984B4A17C
            EFC6ACFFF8E9FFF9ECFBE0C9FED0A9FFD6B4FFD8B950A366DFAC94FFD4B0F4B8
            89ECBC9EF4FAFEF4F3F3F4F4F4F6F7F8CFCCCACEAD91FFD6B1A78971F0CAABCD
            A78CE3BDA35CB479C0AB8BECBB9FFFD5B1FFD4B1F9D0AEFFD6B6FFD6B6A3C494
            A09E77E2B48EDDC6B9F5F7F9F4F4F4F4F4F4F4F4F4F2F2F2FFFFFF6F7175FFFF
            FFCDCBCAB29C8BECF1F39E7D65FFECCB5DB67CBAAC8BE8B89EFFD5B5FFD9B6FF
            D4AFFECDABCFD4B67B9F7836B9B6DACED3F6F7F7F4F4F4F4F4F4F4F4F4F2F2F2
            FFFFFF878685EAE7E5EFEEEE957C63FFFFFFA59991AA9488BE9C856DBE8492A8
            7BDFAE97D1B8A2E9C7B9FEFBFFE0F1E87AA68149CBC8CFC6C7F7F6F6F4F4F4F4
            F4F4F4F4F4F3F3F3FCFCFCF2F4F5A7988DFFFFFF776152FFFFFDC0B8B2D0C9C4
            E7C09FFFD3B2A7C6973D9E610FA19145A2A6ACACB99DBB9787B19B26BCB6EFD9
            DAF6F7F7F4F4F4F4F4F4F4F4F4F3F3F3F8F8F8FFFFFFB6BABAFFFFFFBAACA3F6
            EBE3F0F0EFE1E1E2A7ABB0EBF4F9FFE2D2FAE9DEA0CAA259AA6C3EA36429A87B
            32C7C5DCE0E0FAF7F7F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F2F2F2F1F1F1FAFA
            FAF1F1F1F9FCFEF3F6F8F3ECE7F4F5F5FBFBFBF5F5F5F3F6F8F5F6F8FFF8FEFF
            FFFFFFFFFFFFFEFFFFFBFBF9F6F5F4F4F4F4F4F4F4F4F4F4F4F4}
          ParentFont = False
          TabOrder = 2
          OnClick = btRecXmlClick
          SkinData.SkinSection = 'BUTTON'
        end
      end
    end
    object sTabSheet1: TsTabSheet
      Caption = 'Nota Fiscal Eletr'#244'nica - Entrada'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object sPanel1: TsPanel
        Left = 0
        Top = 0
        Width = 827
        Height = 554
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 0
        SkinData.SkinSection = 'PANEL'
        object gbChaveNfeEnt: TsGroupBox
          Left = 80
          Top = 7
          Width = 285
          Height = 42
          Caption = 'Chave N'#176
          TabOrder = 0
          SkinData.SkinSection = 'GROUPBOX'
          object PrCHAVE_NFE_DEV: TsEdit
            Left = 6
            Top = 14
            Width = 273
            Height = 21
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
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
        object gbReciboNfeEnt: TsGroupBox
          Left = 367
          Top = 7
          Width = 110
          Height = 42
          Caption = 'N'#176' Recibo'
          TabOrder = 1
          SkinData.SkinSection = 'GROUPBOX'
          object PrRECIBO_NFE_DEV: TsEdit
            Left = 6
            Top = 14
            Width = 99
            Height = 21
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
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
        object gbDigestEnt: TsGroupBox
          Left = 8
          Top = 49
          Width = 191
          Height = 42
          Caption = 'Digest Value'
          TabOrder = 2
          SkinData.SkinSection = 'GROUPBOX'
          object PrDIGEST_NFE_DEV: TsEdit
            Left = 6
            Top = 14
            Width = 179
            Height = 21
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
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
        object gbProtocoloEnt: TsGroupBox
          Left = 201
          Top = 49
          Width = 110
          Height = 42
          Caption = 'N'#176' Protocolo'
          TabOrder = 3
          SkinData.SkinSection = 'GROUPBOX'
          object PrPROTOCOLO_NFE_DEV: TsEdit
            Left = 4
            Top = 15
            Width = 99
            Height = 21
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
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
        object gbDataRecNFeEnt: TsGroupBox
          Left = 313
          Top = 49
          Width = 164
          Height = 42
          Caption = 'Data Recebimento'
          Enabled = False
          TabOrder = 4
          SkinData.SkinSection = 'GROUPBOX'
          object PrDATA_REC_NFE_DEV: TDateTimePicker
            Left = 6
            Top = 14
            Width = 153
            Height = 21
            Date = 36892.000011574070000000
            Format = 'dd/MM/yyyy HH:mm:ss'
            Time = 36892.000011574070000000
            DateMode = dmUpDown
            TabOrder = 0
          end
        end
        object gbMotivoEnt: TsGroupBox
          Left = 67
          Top = 91
          Width = 410
          Height = 42
          Caption = 'Motivo'
          TabOrder = 5
          SkinData.SkinSection = 'GROUPBOX'
          object PrMOTIVO_NFE_DEV: TsEdit
            Left = 3
            Top = 15
            Width = 400
            Height = 21
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
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
        object GbStatEnt: TsGroupBox
          Left = 8
          Top = 91
          Width = 57
          Height = 42
          Caption = 'Situa'#231#227'o'
          TabOrder = 6
          SkinData.SkinSection = 'GROUPBOX'
          object PrSTATUS_NFE_DEV: TsEdit
            Left = 11
            Top = 14
            Width = 35
            Height = 21
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
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
        object gbCancNfeEnt: TsGroupBox
          Left = 8
          Top = 133
          Width = 469
          Height = 90
          Caption = 'Cancelamento Justificativa'
          TabOrder = 7
          SkinData.SkinSection = 'GROUPBOX'
          object sLabel1: TsLabel
            Left = 8
            Top = 71
            Width = 324
            Height = 13
            Alignment = taCenter
            Caption = 'Prazo Limite para o Cancelamento: 15/12/2010 10:00:00'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
          end
          object PrJUSTIF_CANC_NFE_DEV: TsEdit
            Left = 6
            Top = 14
            Width = 457
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 255
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            OnChange = prJUSTIF_CANC_NFEChange
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
          object BtnEnviarCancelamentoNFeEnt: TsBitBtn
            Left = 184
            Top = 39
            Width = 100
            Height = 28
            Caption = 'Enviar'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              D6050000424DD605000000000000360000002800000018000000140000000100
              180000000000A005000000000000000000000000000000000000F4F4F4F4F4F4
              F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F4F3F4F4F3F6F8F1E9
              E3F3F6F8F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
              F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F7F7F7F5F2F5F2F1F2F7F7F7F7F9F9
              F3F6F9F5DDCAF0B588F0DBCFF3F9FCF4F4F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4
              F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F4F4FBF7FADFDBDC9FB9A2BD
              C3B9D0C2C9D8D1D7FFD6B9FFD6B0FFDCBCECAE84F2E4DDF2F6F8F4F4F4F4F4F4
              F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F4F3F8F5F8E2EA
              E23D9A5796CDAD18A97629944F499578A4AAB1FDCAAAFED5B4FCD0A9F0D1BCF4
              FBFFF3F4F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
              F3F3F3FFFBFF72B883E2DAD72BCFD0B2D1D5FFFFFFADD3B0008F507FA196FAC3
              A3FED6B5EBA77BF0DFD3F4FBFFF4F9FEF4F4F5F4F4F4F4F4F4F4F4F4F4F4F4F4
              F4F4F4F4F4F4F4F4F3F3F3FFFCFF6FB37DC4D2D039C3BEE5D6D8F7F6F6FFFFFF
              FDEBDC49A258B2A584F4C2A7FFE2BCEEAA7AE89C6BEBB18EF4F6FAF4F4F5F4F4
              F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F3F3FFF9FF8EC79CABBEB438C7C3D6
              CECEF8F8F8E6E1DBC0A99CC9BAB947A56A4D553CB28F7BFFDEBDFEDCBBF2BA8D
              EBBDA0F3FAFDF4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F8F6F8D4E8
              D786A98130C3C3C1C6C5F5F3F3FFFFFFEEE1D7FFF1DFFFF3EA51B1749C8A70F3
              C7ABFFD9B7FCD7B4ECA87BF4F1F3F4F5F5F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
              F4F4F4F4F4F4FFFAFE67AC7279BFC36BBFB9FFFFFF968A7FEDBF9AFFD9B2FFDD
              B5FFE7C64CA966D4AD95F6CCADFFDAB9EFB182EFDACBF3F7F9F4F4F3F4F4F4F4
              F4F4F4F4F4F4F4F4F4F4F4F3F3F3FEFAFFAED6B48EB19724B6B3FFFFFF9A8B7E
              9684759987779883749F857695937B4C9B5CEAB49CFCD6B4F5C096EFD3C3F3FA
              FFF4F4F3F4F4F4F4F4F4F4F4F4F4F4F4F3F5F5F4F9FEF2E9E5FFFFFF60B078B7
              8962FBF3EDF2F2F2EAE1DBFFFFFCFFFDF3FFFFFFE7DCDD61855B8BA474F0C1A8
              FBCDA7E49461F5EDEBF3F7F9F4F4F3F4F4F4F4F4F4F4F5F5F1F0EFEBB38EEEAA
              77EDA379D0D3B06DA570EBC0AFF6F9FA654B35CEA889FFD7AAFDE0C6E2E4E6B0
              866F57AB6DD6AE94FED9BAF0B88BE79E6EF4F3F5F3F4F5F4F4F4F4F3F3F3F7FA
              F4D6C1FACEA9FEDABAFBD3B1FFD3B18EC29496A071F1D4CBFFFFFF9E948D9C90
              88F8FFFFC9BBAFFECBA7CBD1AC709765EDBDA1FEDCBBEEA978ECBD9FF4FAFEF4
              F3F3F4F3F3F2F7FDFCDAB8FFD9B7FFD5B4FFDEBCFFD9B7FFE1C26AB984B4A17C
              EFC6ACFFF8E9FFF9ECFBE0C9FED0A9FFD6B4FFD8B950A366DFAC94FFD4B0F4B8
              89ECBC9EF4FAFEF4F3F3F4F4F4F6F7F8CFCCCACEAD91FFD6B1A78971F0CAABCD
              A78CE3BDA35CB479C0AB8BECBB9FFFD5B1FFD4B1F9D0AEFFD6B6FFD6B6A3C494
              A09E77E2B48EDDC6B9F5F7F9F4F4F4F4F4F4F4F4F4F2F2F2FFFFFF6F7175FFFF
              FFCDCBCAB29C8BECF1F39E7D65FFECCB5DB67CBAAC8BE8B89EFFD5B5FFD9B6FF
              D4AFFECDABCFD4B67B9F7836B9B6DACED3F6F7F7F4F4F4F4F4F4F4F4F4F2F2F2
              FFFFFF878685EAE7E5EFEEEE957C63FFFFFFA59991AA9488BE9C856DBE8492A8
              7BDFAE97D1B8A2E9C7B9FEFBFFE0F1E87AA68149CBC8CFC6C7F7F6F6F4F4F4F4
              F4F4F4F4F4F3F3F3FCFCFCF2F4F5A7988DFFFFFF776152FFFFFDC0B8B2D0C9C4
              E7C09FFFD3B2A7C6973D9E610FA19145A2A6ACACB99DBB9787B19B26BCB6EFD9
              DAF6F7F7F4F4F4F4F4F4F4F4F4F3F3F3F8F8F8FFFFFFB6BABAFFFFFFBAACA3F6
              EBE3F0F0EFE1E1E2A7ABB0EBF4F9FFE2D2FAE9DEA0CAA259AA6C3EA36429A87B
              32C7C5DCE0E0FAF7F7F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F2F2F2F1F1F1FAFA
              FAF1F1F1F9FCFEF3F6F8F3ECE7F4F5F5FBFBFBF5F5F5F3F6F8F5F6F8FFF8FEFF
              FFFFFFFFFFFFFEFFFFFBFBF9F6F5F4F4F4F4F4F4F4F4F4F4F4F4}
            ParentFont = False
            TabOrder = 1
            OnClick = BtnEnviarCancelamentoNFeClick
            SkinData.SkinSection = 'BUTTON'
          end
          object BtnEditarCancelamentoNFeEnt: TsBitBtn
            Left = 73
            Top = 39
            Width = 100
            Height = 28
            Caption = 'Editar'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFB78183B78183B78183B78183B78183B78183B78183B7
              8183B78183B78183B78183B78183B78183FF00FFFF00FFFF00FFB78183FDEFD9
              F4E1C9E4CFB4D1BCA0CDB798DAC09AE4C599E9C896EDCB96EECC97F3D199B781
              83FF00FFFF00FFFF00FFB48176FEF3E3F8E7D3494645373C3E516061AE9C82BF
              A889D0B48DE4C393EDCB96F3D199B78183FF00FFFF00FFFF00FFB48176FFF7EB
              F9EBDAB0A5981B617D097CA818556F66625BA79479C5AC86DCBD8DEECD95B781
              83FF00FFFF00FFFF00FFBA8E85FFFCF4FAEFE4F2E5D638728629799A8D787F95
              6D6F7959539D8B73BAA380D9BC8CB47F81FF00FFFF00FFFF00FFBA8E85FFFFFD
              FBF4ECFAEFE3A5B3B17C7078E5A6A3C89292A4727276575195856CAF9978A877
              79FF00FFFF00FFFF00FFCB9A82FFFFFFFEF9F5FBF3ECF4EBDF85787CEEB7B5DA
              A6A6C38E8E9E6E6E73564F93836B996E6FFF00FFFF00FFFF00FFCB9A82FFFFFF
              FFFEFDFDF8F4FBF3ECF0E4D9A37978E9B5B5D9A5A5C48F8F9D6D6D7759528F67
              69FF00FFFF00FFFF00FFDCA887FFFFFFFFFFFFFFFEFDFEF9F4FBF3EBE8D9CE9E
              7473E8B5B5D8A4A4C18D8D9D6C6C7D5556FF00FFFF00FFFF00FFDCA887FFFFFF
              FFFFFFFFFFFFFFFEFDFDF9F4FBF3EBE0CFC5A17676ECB9B9D6A2A2C68E8E965F
              5D585C60FF00FFFF00FFE3B18EFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDF8F3FD
              F6ECDAC5BCAC8080F3BCBBA3878C3392B319ADCC19ADCCFF00FFE3B18EFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFFFEF9E3CFC9AA7A71B27873469CBA0FCA
              F400A4E6021EAA000099EDBD92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFE4D4D2B8857ADCA76A10A5CF04A8E60936C9092CC30318AEEDBD92FCF7F4
              FCF7F3FBF6F3FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEB8857ACF9B86FF00FF077D
              CD4860F1204ADD0416AAEDBD92DCA887DCA887DCA887DCA887DCA887DCA887DC
              A887DCA887B8857AFF00FFFF00FFFF00FF3E4BDB192DC4FF00FF}
            ParentFont = False
            TabOrder = 2
            OnClick = BtnEditarCancelamentoNFeClick
            SkinData.SkinSection = 'BUTTON'
          end
          object BtnSairCancelamentoNFeEnt: TsBitBtn
            Left = 295
            Top = 39
            Width = 100
            Height = 28
            Caption = 'Cancelar'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF9A6666693334FF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A6666B96666BB
              6868693334FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              9A66669A6666C66A6BD06A6BD26869C368696933349A66669A66669A66669A66
              669A66669A6666FF00FFFF00FFFF00FF9A6666DE7374D77071D56F70D56D6EC7
              6A6D693334FEA2A3FCAFB0FABCBDF9C5C6F9C5C69A6666FF00FFFF00FFFF00FF
              9A6666E07778DB7576DA7475DA7273CC6E7169333439C56525CF6329CC6319CB
              5BF9C5C69A6666FF00FFFF00FFFF00FF9A6666E57D7EE07A7BDF797ADF7778D0
              727569333442C46830CD6733CB6724CB60F9C5C69A6666FF00FFFF00FFFF00FF
              9A6666EA8283E57F80E37D7EE68081D374766933343DC26429CB632FCA6420CA
              5EF9C5C69A6666FF00FFFF00FFFF00FF9A6666F08788E98182EC9697FBDDDED8
              888A693334B8E1AC6BDC895DD58046D473F9C5C69A6666FF00FFFF00FFFF00FF
              9A6666F58C8DEE8687F0999AFDDCDDDA888A693334FFF5D8FFFFE0FFFFDEECFD
              D4F9C5C69A6666FF00FFFF00FFFF00FF9A6666FA9192F48E8FF28B8CF48C8DDC
              7F80693334FDF3D4FFFFDFFFFFDDFFFFE0F9C5C69A6666FF00FFFF00FFFF00FF
              9A6666FE9798F99394F89293F99092E08585693334FDF3D4FFFFDFFFFFDDFFFF
              DFF9C5C69A6666FF00FFFF00FFFF00FF9A6666FF9B9CFD9798FC9697FE9798E3
              8889693334FDF3D4FFFFDFFFFFDDFFFFDFF9C5C69A6666FF00FFFF00FFFF00FF
              9A6666FF9FA0FF9A9BFF999AFF9A9BE78C8D693334FDF3D4FFFFDFFFFFDDFFFF
              DFF9C5C69A6666FF00FFFF00FFFF00FF9A66669A6666E98E8FFE999AFF9D9EEB
              8F90693334FBF0D2FDFCDCFDFCDAFDFCDCF9C5C69A6666FF00FFFF00FFFF00FF
              FF00FFFF00FF9A6666B07172D78687DA88886933349A66669A66669A66669A66
              669A66669A6666FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A
              6666693334FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            ParentFont = False
            TabOrder = 3
            OnClick = BtnSairCancelamentoNFeClick
            SkinData.SkinSection = 'BUTTON'
          end
        end
        object sPanel2: TsPanel
          Left = 2
          Top = 476
          Width = 823
          Height = 76
          Align = alBottom
          TabOrder = 8
          SkinData.SkinSection = 'PANEL'
          object BtnNFEEnt: TsBitBtn
            Left = 179
            Top = 16
            Width = 129
            Height = 44
            Caption = 'NFe'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
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
            TabOrder = 0
            OnClick = BtnNFEEntClick
            SkinData.SkinSection = 'BUTTON'
          end
          object BtnDanfeEnt: TsBitBtn
            Left = 28
            Top = 16
            Width = 129
            Height = 44
            Caption = 'DANFe'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              F6060000424DF606000000000000360000002800000018000000180000000100
              180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF999697BDBBBC9D9A9A898687FF00FFFF00
              FF979596C6C6C6D0CFCFAFACAC989596FF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FF999697B7B5B6F0EFEFF4F3F3AAA7A7
              9D9A9A4241424644456E6C6D999797BCBBBBDAD9D9E0E0E0C9C7C7A3A0A1FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF989697A9A5A6E3E2E2FFFEFEFC
              FBFBEFEEEEA7A5A59E9C9C3332341212131C1C1D2A2A2C4745476D6A6C9A9898
              C5C4C4E2E1E1D4D3D3959192FF00FFFF00FFFF00FFFF00FF9A9899D8D5D5FCFB
              FBFBFAFAF8F7F7FBFAFAE7E5E6A3A0A0A3A0A0807F805453543332341E1E1F16
              16171A1A1C29292B454445736F70918F8FFF00FFFF00FFFF00FF8E8A8BC4C1C1
              F6F4F4FAF8F8F4F3F3F4F3F3E3E2E2B8B7B79896978986878C8A8A9A9798A5A1
              A39F9D9D878686605F603D3C3D2222231415162B2A2C8A8788FF00FFFF00FFFF
              00FF8E8A8BEBEBEBF0F0F0EDEBEBD9D8D8B0ADAD969293A6A4A4C7C6C6A4A1A1
              928F8F8B88898884868B8989969293A19F9EA19F9F918F906A696A5151528B89
              89FF00FFFF00FFFF00FF8E8A8BDEDDDDD0CFCFA7A5A5939091A7A5A5CAC9CAD5
              D7D5DCDADAE1E0E0CCCACABAB7B7A7A5A59A97988F8B8C8A8788898687918E8E
              9D9999A3A0A0918F8FFF00FFFF00FFFF00FF8E8A8B9E9C9D939191A9A7A7C7C7
              C7D1D3D3CECECEC9C9C9E6E5E5F6F4F4F3F3F3EDEBEBE0DEDECFCECEBFBDBDAF
              ACACA19F9F9592928C8A8A8A8788868283FF00FFFF00FFFF00FF8E8A8BAAA7A9
              C9C7C7CFCFCFCBCBCBCACACAC6C6C6DADADAF4F3F3B5B2B4B6AAB4C4C1C2D8D7
              D7E1E1E1E2E2E2D9D9D9CECECEC1C0C0B4B2B2AAA7A7928F90FF00FFFF00FFFF
              00FF8E8A8BCACACACCCCCCCACACACACACAC7C7C7D7D7D7F4F3F3AFAAAC999E98
              66B06A9EA39D9995979C9A9AAAA9A9BBBABACCCBCBD1D1D1D1D1D1CFCFCF9A99
              99FF00FFFF00FFFF00FFFF00FFADABACD0D0D0CCCECECECECEDEDEDEE3E2E2A4
              A1A1ABA9AAEEEEEDC7EDC9E5E9E5E0DDDEF8AF9AB0ADAF9F9D9D9591929A9798
              ABA9A9ABA9AAA39FA0FF00FFFF00FFFF00FFFF00FFFF00FFA19FA0BBBABACAC9
              C9B6B4B4999797BDBBBBF4F3F3F4F3F3F4EEF3EAE7E7E5E3E3E2E2E2E1E1E1D9
              D9D9CECECE000000000000000000000000000000FF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF8A8788A9A7A7D1D1D1BFBFBF989999BABABAD3D1D1DEDDDDE1E0
              E0DEDEDEDCDCDCDDDDDDD7D7D7000415A7A4A5033DFFFF00FF010929FF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FF9D9A9CF3F4F4F4F3F2D9D5D4AAA7A7A7A9A9
              B4B7B8C7CBCCC9CCCCCCCECECCCCCCB6B5B6989697000B37033CFFFF00FF033D
              FF022096FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE9CECCFFE3D9FF
              DDCFFED5C7F8D3C6F3D1C6EDD1CAE6D4CFDED8D5D0D0D0B8B7B8FF00FF000A32
              FF00FFFF00FFFF00FF0338F7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFDDB4B0FFE0D3FFD8C9FFCFC0FFC7B5FFC0AAFFBAA4FFB79FFCB099E5C5C1FF
              00FFFF00FF00000200030C000000000208021D850338FEFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFDEB5B0FFE5D8FFD8C9FFCFC0FFC9B7FEC1ADFEBBA5FFB4
              9CF7A691FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0231E603
              36FFFF00FFFF00FFFF00FFFF00FFFF00FFE6BFB8FFE5D8FFD8C9FFCFC0FFC9B7
              FEC1ADFEBBA5FFB59DEBA08FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE1BDB8FFE2D5FF
              D8C9FFCFC0FFC9B7FEC1ADFEBBA5FFB59DF8AF9AFF00FFFF00FFFF00FF000000
              000000000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFE1BDB8FFE0D3FFD8C9FFCFC0FFC9B7FEC1ADFFBBA5F8AF9AF8AF9AFF00FFFF
              00FFFF00FF000415FF00FF033DFFFF00FF010929FF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFE0BAB5FFEDE2FFE0D3FFD8C9FFCFC0FEC9B7FEC2ADFFBDA6F8AF
              9AFF00FFFF00FFFF00FFFF00FF000B37033CFFFF00FF033DFF022096FF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFE1BDB8FFF0E5FFE5D8FFDECEFFD5C5FFCEBB
              FFC7B2EDAB9CF8AF9AFF00FFFF00FFFF00FFFF00FF000A32FF00FFFF00FFFF00
              FF0338F7FF00FFFF00FFFF00FFFF00FFFF00FFCE9F9DE1BDB8E0B7B2E0B5ADE0
              B1A9E0ACA5E0AAA0DDA39AF8AF9AFF00FFFF00FFFF00FFFF00FFFF00FF000002
              00030C000000000208021D850338FEFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0231E60336FF}
            ParentFont = False
            TabOrder = 1
            OnClick = BtnDanfeEntClick
            SkinData.SkinSection = 'BUTTON'
          end
          object btRecXmlEnt: TsBitBtn
            Left = 455
            Top = 16
            Width = 126
            Height = 45
            Caption = 'Rec. Xml'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              D6050000424DD605000000000000360000002800000018000000140000000100
              180000000000A005000000000000000000000000000000000000F4F4F4F4F4F4
              F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F4F3F4F4F3F6F8F1E9
              E3F3F6F8F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
              F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F7F7F7F5F2F5F2F1F2F7F7F7F7F9F9
              F3F6F9F5DDCAF0B588F0DBCFF3F9FCF4F4F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4
              F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F4F4FBF7FADFDBDC9FB9A2BD
              C3B9D0C2C9D8D1D7FFD6B9FFD6B0FFDCBCECAE84F2E4DDF2F6F8F4F4F4F4F4F4
              F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F4F3F8F5F8E2EA
              E23D9A5796CDAD18A97629944F499578A4AAB1FDCAAAFED5B4FCD0A9F0D1BCF4
              FBFFF3F4F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
              F3F3F3FFFBFF72B883E2DAD72BCFD0B2D1D5FFFFFFADD3B0008F507FA196FAC3
              A3FED6B5EBA77BF0DFD3F4FBFFF4F9FEF4F4F5F4F4F4F4F4F4F4F4F4F4F4F4F4
              F4F4F4F4F4F4F4F4F3F3F3FFFCFF6FB37DC4D2D039C3BEE5D6D8F7F6F6FFFFFF
              FDEBDC49A258B2A584F4C2A7FFE2BCEEAA7AE89C6BEBB18EF4F6FAF4F4F5F4F4
              F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F3F3FFF9FF8EC79CABBEB438C7C3D6
              CECEF8F8F8E6E1DBC0A99CC9BAB947A56A4D553CB28F7BFFDEBDFEDCBBF2BA8D
              EBBDA0F3FAFDF4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F8F6F8D4E8
              D786A98130C3C3C1C6C5F5F3F3FFFFFFEEE1D7FFF1DFFFF3EA51B1749C8A70F3
              C7ABFFD9B7FCD7B4ECA87BF4F1F3F4F5F5F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
              F4F4F4F4F4F4FFFAFE67AC7279BFC36BBFB9FFFFFF968A7FEDBF9AFFD9B2FFDD
              B5FFE7C64CA966D4AD95F6CCADFFDAB9EFB182EFDACBF3F7F9F4F4F3F4F4F4F4
              F4F4F4F4F4F4F4F4F4F4F4F3F3F3FEFAFFAED6B48EB19724B6B3FFFFFF9A8B7E
              9684759987779883749F857695937B4C9B5CEAB49CFCD6B4F5C096EFD3C3F3FA
              FFF4F4F3F4F4F4F4F4F4F4F4F4F4F4F4F3F5F5F4F9FEF2E9E5FFFFFF60B078B7
              8962FBF3EDF2F2F2EAE1DBFFFFFCFFFDF3FFFFFFE7DCDD61855B8BA474F0C1A8
              FBCDA7E49461F5EDEBF3F7F9F4F4F3F4F4F4F4F4F4F4F5F5F1F0EFEBB38EEEAA
              77EDA379D0D3B06DA570EBC0AFF6F9FA654B35CEA889FFD7AAFDE0C6E2E4E6B0
              866F57AB6DD6AE94FED9BAF0B88BE79E6EF4F3F5F3F4F5F4F4F4F4F3F3F3F7FA
              F4D6C1FACEA9FEDABAFBD3B1FFD3B18EC29496A071F1D4CBFFFFFF9E948D9C90
              88F8FFFFC9BBAFFECBA7CBD1AC709765EDBDA1FEDCBBEEA978ECBD9FF4FAFEF4
              F3F3F4F3F3F2F7FDFCDAB8FFD9B7FFD5B4FFDEBCFFD9B7FFE1C26AB984B4A17C
              EFC6ACFFF8E9FFF9ECFBE0C9FED0A9FFD6B4FFD8B950A366DFAC94FFD4B0F4B8
              89ECBC9EF4FAFEF4F3F3F4F4F4F6F7F8CFCCCACEAD91FFD6B1A78971F0CAABCD
              A78CE3BDA35CB479C0AB8BECBB9FFFD5B1FFD4B1F9D0AEFFD6B6FFD6B6A3C494
              A09E77E2B48EDDC6B9F5F7F9F4F4F4F4F4F4F4F4F4F2F2F2FFFFFF6F7175FFFF
              FFCDCBCAB29C8BECF1F39E7D65FFECCB5DB67CBAAC8BE8B89EFFD5B5FFD9B6FF
              D4AFFECDABCFD4B67B9F7836B9B6DACED3F6F7F7F4F4F4F4F4F4F4F4F4F2F2F2
              FFFFFF878685EAE7E5EFEEEE957C63FFFFFFA59991AA9488BE9C856DBE8492A8
              7BDFAE97D1B8A2E9C7B9FEFBFFE0F1E87AA68149CBC8CFC6C7F7F6F6F4F4F4F4
              F4F4F4F4F4F3F3F3FCFCFCF2F4F5A7988DFFFFFF776152FFFFFDC0B8B2D0C9C4
              E7C09FFFD3B2A7C6973D9E610FA19145A2A6ACACB99DBB9787B19B26BCB6EFD9
              DAF6F7F7F4F4F4F4F4F4F4F4F4F3F3F3F8F8F8FFFFFFB6BABAFFFFFFBAACA3F6
              EBE3F0F0EFE1E1E2A7ABB0EBF4F9FFE2D2FAE9DEA0CAA259AA6C3EA36429A87B
              32C7C5DCE0E0FAF7F7F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F2F2F2F1F1F1FAFA
              FAF1F1F1F9FCFEF3F6F8F3ECE7F4F5F5FBFBFBF5F5F5F3F6F8F5F6F8FFF8FEFF
              FFFFFFFFFFFFFEFFFFFBFBF9F6F5F4F4F4F4F4F4F4F4F4F4F4F4}
            ParentFont = False
            TabOrder = 2
            OnClick = btRecXmlClick
            SkinData.SkinSection = 'BUTTON'
          end
        end
        object sGroupBox1: TsGroupBox
          Left = 8
          Top = 7
          Width = 63
          Height = 41
          Caption = 'NF-e'
          TabOrder = 9
          SkinData.SkinSection = 'GROUPBOX'
          object PrNFE_Dev: TsEdit
            Left = 5
            Top = 14
            Width = 52
            Height = 21
            TabStop = False
            Color = clWhite
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
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
    end
  end
  object Panel1: TsPanel
    Left = 0
    Top = 582
    Width = 835
    Height = 41
    Align = alBottom
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object Btnovped: TsBitBtn
      Left = 25
      Top = 8
      Width = 75
      Height = 25
      Caption = 'INSERIR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BtnovpedClick
      SkinData.SkinSection = 'BUTTON'
    end
    object Btaltped: TsBitBtn
      Left = 99
      Top = 8
      Width = 75
      Height = 25
      Caption = 'ALTERAR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BtaltpedClick
      SkinData.SkinSection = 'BUTTON'
    end
    object Btgraped: TsBitBtn
      Left = 173
      Top = 8
      Width = 75
      Height = 25
      Caption = 'GRAVAR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = BtgrapedClick
      SkinData.SkinSection = 'BUTTON'
    end
    object Btcanped: TsBitBtn
      Left = 247
      Top = 8
      Width = 75
      Height = 25
      Caption = 'CANCELAR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = BtcanpedClick
      SkinData.SkinSection = 'BUTTON'
    end
    object Btlocped: TsBitBtn
      Left = 395
      Top = 8
      Width = 75
      Height = 25
      Caption = 'LOCALIZAR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = BtlocpedClick
      SkinData.SkinSection = 'BUTTON'
    end
    object Btexcped: TsBitBtn
      Left = 321
      Top = 8
      Width = 75
      Height = 25
      Caption = 'EXCLUIR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = BtexcpedClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object sbvendas: TStatusBar
    Left = 0
    Top = 623
    Width = 835
    Height = 19
    Panels = <
      item
        Width = 100
      end
      item
        Width = 300
      end>
  end
  object q_vendas1: TFDQuery
    Connection = dao.CN
    Left = 272
    Top = 144
  end
  object XMLNFe: TXMLDocument
    Left = 176
    Top = 128
    DOMVendorDesc = 'MSXML'
  end
  object RDIMPNOT: TRDprint
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
    OpcoesPreview.CaptionPreview = 'Visualiza'#231#227'o'
    OpcoesPreview.PreviewZoom = 90
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
    TamanhoQteLinhas = 126
    TamanhoQteColunas = 136
    TamanhoQteLPP = Oito
    NumerodeCopias = 1
    FonteTamanhoPadrao = S17cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    OnNewPage = RDIMPNOTNewPage
    Left = 192
    Top = 170
  end
  object dsVendas2: TDataSource
    AutoEdit = False
    DataSet = mmVendas2
    Left = 496
    Top = 120
  end
  object q_vendas2: TFDQuery
    Connection = dao.CN
    Left = 472
    Top = 168
  end
  object mmVendas2: TRxMemoryData
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'COD_PRODUTO'
        DataType = ftInteger
      end
      item
        Name = 'NOM_PRODUTO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'NCM'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CESTA_BASICA'
        DataType = ftBoolean
      end
      item
        Name = 'QTD'
        DataType = ftFloat
      end
      item
        Name = 'SUB_TOTAL'
        DataType = ftCurrency
      end
      item
        Name = 'IPI_ITEM'
        DataType = ftFloat
      end
      item
        Name = 'VLR_IPI_ITEM'
        DataType = ftCurrency
      end
      item
        Name = 'VLR_BC'
        DataType = ftCurrency
      end
      item
        Name = 'ICMS_ITEM'
        DataType = ftFloat
      end
      item
        Name = 'VLR_ICMS_ITEM'
        DataType = ftCurrency
      end
      item
        Name = 'VLR_AGR_ITEM'
        DataType = ftFloat
      end
      item
        Name = 'VLR_BC_ST'
        DataType = ftCurrency
      end
      item
        Name = 'VLR_ICMS_ST'
        DataType = ftCurrency
      end
      item
        Name = 'NUMDOC'
        DataType = ftInteger
      end
      item
        Name = 'DTADOC'
        DataType = ftDate
      end
      item
        Name = 'COD_CLIENTE'
        DataType = ftInteger
      end
      item
        Name = 'COD_REPRESENTANTE'
        DataType = ftInteger
      end
      item
        Name = 'ID_COR'
        DataType = ftInteger
      end
      item
        Name = 'ID_TAMANHO'
        DataType = ftInteger
      end
      item
        Name = 'QTD_DEVOLVIDA'
        DataType = ftFloat
      end
      item
        Name = 'DEVOLVIDO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'VOLUME'
        DataType = ftFloat
      end
      item
        Name = 'COD_EMPRESA'
        DataType = ftInteger
      end
      item
        Name = 'NR_PEDIDO_PALM'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'SUB_TOTAL_BRUTO'
        DataType = ftCurrency
      end
      item
        Name = 'VLR_COMISSAO'
        DataType = ftCurrency
      end
      item
        Name = 'TROCA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'COD_FISCAL_ITEM'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'COD_SUPERVISOR'
        DataType = ftInteger
      end
      item
        Name = 'PRECO_LIQUIDO'
        DataType = ftFloat
      end
      item
        Name = 'QTD_ESTOQUE'
        DataType = ftFloat
      end
      item
        Name = 'ESTOQUE_MINIMO'
        DataType = ftFloat
      end
      item
        Name = 'QTD_RESERVADO'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO'
        DataType = ftFloat
      end
      item
        Name = 'TRIB_ICMS'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'PRECO_CUSTO'
        DataType = ftCurrency
      end
      item
        Name = 'DESCONTO_MAXIMO'
        DataType = ftFloat
      end
      item
        Name = 'PRECO_VENDA'
        DataType = ftCurrency
      end
      item
        Name = 'PERC_COMISSAO'
        DataType = ftFloat
      end
      item
        Name = 'GRADE_COMISSAO'
        DataType = ftString
        Size = 1
      end>
    Left = 576
    Top = 120
    object mmVendas2ID: TIntegerField
      FieldName = 'ID'
    end
    object mmVendas2COD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
    end
    object mmVendas2NOM_PRODUTO: TStringField
      FieldName = 'NOM_PRODUTO'
      Size = 100
    end
    object mmVendas2NCM: TStringField
      FieldName = 'NCM'
    end
    object mmVendas2CESTA_BASICA: TBooleanField
      FieldName = 'CESTA_BASICA'
    end
    object mmVendas2QTD: TFloatField
      FieldName = 'QTD'
      DisplayFormat = '#,###,##0.00'
    end
    object mmVendas2SUB_TOTAL: TCurrencyField
      FieldName = 'SUB_TOTAL'
    end
    object mmVendas2IPI_ITEM: TFloatField
      FieldName = 'IPI_ITEM'
      DisplayFormat = '#0.00%'
    end
    object mmVendas2VLR_IPI_ITEM: TCurrencyField
      FieldName = 'VLR_IPI_ITEM'
    end
    object mmVendas2VLR_BC: TCurrencyField
      FieldName = 'VLR_BC'
    end
    object mmVendas2ICMS_ITEM: TFloatField
      FieldName = 'ICMS_ITEM'
      DisplayFormat = '#0.00%'
    end
    object mmVendas2VLR_ICMS_ITEM: TCurrencyField
      FieldName = 'VLR_ICMS_ITEM'
    end
    object mmVendas2VLR_AGR_ITEM: TFloatField
      FieldName = 'VLR_AGR_ITEM'
      DisplayFormat = '#0.00%'
    end
    object mmVendas2VLR_BC_ST: TCurrencyField
      FieldName = 'VLR_BC_ST'
    end
    object mmVendas2VLR_ICMS_ST: TCurrencyField
      FieldName = 'VLR_ICMS_ST'
    end
    object mmVendas2NUMDOC: TIntegerField
      FieldName = 'NUMDOC'
    end
    object mmVendas2DTADOC: TDateField
      FieldName = 'DTADOC'
    end
    object mmVendas2COD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object mmVendas2COD_REPRESENTANTE: TIntegerField
      FieldName = 'COD_REPRESENTANTE'
    end
    object mmVendas2ID_COR: TIntegerField
      FieldName = 'ID_COR'
    end
    object mmVendas2ID_TAMANHO: TIntegerField
      FieldName = 'ID_TAMANHO'
    end
    object mmVendas2QTD_DEVOLVIDA: TFloatField
      FieldName = 'QTD_DEVOLVIDA'
    end
    object mmVendas2DEVOLVIDO: TStringField
      FieldName = 'DEVOLVIDO'
      Size = 1
    end
    object mmVendas2VOLUME: TFloatField
      FieldName = 'VOLUME'
    end
    object mmVendas2COD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
    end
    object mmVendas2NR_PEDIDO_PALM: TStringField
      FieldName = 'NR_PEDIDO_PALM'
      Size = 7
    end
    object mmVendas2SUB_TOTAL_BRUTO: TCurrencyField
      FieldName = 'SUB_TOTAL_BRUTO'
    end
    object mmVendas2VLR_COMISSAO: TCurrencyField
      FieldName = 'VLR_COMISSAO'
    end
    object mmVendas2TROCA: TStringField
      FieldName = 'TROCA'
      Size = 1
    end
    object mmVendas2COD_FISCAL_ITEM: TStringField
      Alignment = taCenter
      FieldName = 'COD_FISCAL_ITEM'
      Size = 5
    end
    object mmVendas2COD_SUPERVISOR: TIntegerField
      FieldName = 'COD_SUPERVISOR'
    end
    object mmVendas2PRECO_LIQUIDO: TFloatField
      FieldName = 'PRECO_LIQUIDO'
      currency = True
    end
    object mmVendas2QTD_ESTOQUE: TFloatField
      FieldName = 'QTD_ESTOQUE'
    end
    object mmVendas2ESTOQUE_MINIMO: TFloatField
      FieldName = 'ESTOQUE_MINIMO'
    end
    object mmVendas2QTD_RESERVADO: TFloatField
      FieldName = 'QTD_RESERVADO'
    end
    object mmVendas2DESCONTO: TFloatField
      FieldName = 'DESCONTO'
      DisplayFormat = '#0.00'#39#39'%'
      currency = True
    end
    object mmVendas2TRIB_ICMS: TStringField
      Alignment = taCenter
      FieldName = 'TRIB_ICMS'
      Size = 5
    end
    object mmVendas2PRECO_CUSTO: TCurrencyField
      FieldName = 'PRECO_CUSTO'
    end
    object mmVendas2DESCONTO_MAXIMO: TFloatField
      FieldName = 'DESCONTO_MAXIMO'
      DisplayFormat = '#0.00%'
    end
    object mmVendas2PRECO_VENDA: TCurrencyField
      FieldName = 'PRECO_VENDA'
    end
    object mmVendas2PERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
      DisplayFormat = '#0.00%'
    end
    object mmVendas2GRADE_COMISSAO: TStringField
      FieldName = 'GRADE_COMISSAO'
      Size = 1
    end
  end
  object ACBrNFe1: TACBrNFe
    Configuracoes.Geral.SSLLib = libCustom
    Configuracoes.Geral.SSLCryptLib = cryNone
    Configuracoes.Geral.SSLHttpLib = httpIndy
    Configuracoes.Geral.SSLXmlSignLib = xsNone
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.ValidarDigest = False
    Configuracoes.Geral.VersaoQRCode = veqr000
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'PR'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.Tentativas = 20
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.RespTec.IdCSRT = 0
    DANFE = ACBrNFeDANFEFR1
    Left = 376
    Top = 216
  end
  object q_xml: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'SELECT a.xml, a.XML_DEV'
      'FROM vendas1 a'
      'where a.NUMDOC = :numdoc')
    Left = 592
    Top = 208
    ParamData = <
      item
        Name = 'numdoc'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object q_xmlXML: TBlobField
      FieldName = 'XML'
      Origin = 'XML'
    end
    object q_xmlXML_DEV: TBlobField
      FieldName = 'XML_DEV'
      Origin = 'XML_DEV'
    end
  end
  object ACBrNFeDANFEFR1: TACBrNFeDANFEFR
    Sistema = 'Projeto ACBr - www.projetoacbr.com.br'
    MargemInferior = 0.800000000000000000
    MargemSuperior = 4.000000000000000000
    MargemEsquerda = 4.000000000000000000
    MargemDireita = 0.500000000000000000
    ExpandeLogoMarcaConfig.Altura = 0
    ExpandeLogoMarcaConfig.Esquerda = 0
    ExpandeLogoMarcaConfig.Topo = 0
    ExpandeLogoMarcaConfig.Largura = 0
    ExpandeLogoMarcaConfig.Dimensionar = False
    ExpandeLogoMarcaConfig.Esticar = True
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 2
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.00'
    CasasDecimais.MaskvUnCom = ',0.00'
    CasasDecimais.Aliquota = 2
    CasasDecimais.MaskAliquota = ',0.00'
    ACBrNFe = ACBrNFe1
    TipoDANFE = tiSemGeracao
    EspessuraBorda = 1
    BorderIcon = [biSystemMenu, biMinimize, biMaximize]
    ThreadSafe = False
    Left = 231
    Top = 300
  end
  object Q_produto: TFDQuery
    Connection = dao.CN
    Left = 432
    Top = 169
  end
  object qrGravaXml: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'UPDATE VENDAS1'
      'SET XML =:arquivo'
      'WHERE numdoc =:numdoc')
    Left = 342
    Top = 24
    ParamData = <
      item
        Name = 'arquivo'
        DataType = ftBlob
        FDDataType = dtBlob
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'numdoc'
        DataType = ftInteger
        FDDataType = dtInt64
        ParamType = ptInput
        Value = Null
      end>
  end
  object qrGravaXmlDev: TFDQuery
    Connection = dao.CN
    SQL.Strings = (
      'UPDATE VENDAS1'
      'SET XML_DEV =:arquivo'
      'WHERE numdoc =:numdoc')
    Left = 406
    Top = 8
    ParamData = <
      item
        Name = 'arquivo'
        DataType = ftBlob
        FDDataType = dtBlob
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'numdoc'
        DataType = ftInteger
        FDDataType = dtInt64
        ParamType = ptInput
        Value = Null
      end>
  end
end
